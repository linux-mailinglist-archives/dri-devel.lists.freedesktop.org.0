Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4947A30237
	for <lists+dri-devel@lfdr.de>; Tue, 11 Feb 2025 04:34:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 430F210E2D6;
	Tue, 11 Feb 2025 03:34:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vip.corpemail.net (mail-vip.corpemail.net
 [162.243.126.186])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC12410E2D6
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Feb 2025 03:34:14 +0000 (UTC)
Received: from unicom145.biz-email.net
 by unicom145.biz-email.net ((D)) with ASMTP (SSL) id IVN00135;
 Tue, 11 Feb 2025 11:28:35 +0800
Received: from jtjnmail201607.home.langchao.com (10.100.2.7) by
 jtjnmail201606.home.langchao.com (10.100.2.6) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 11 Feb 2025 11:28:34 +0800
Received: from locahost.localdomain (10.94.14.107) by
 jtjnmail201607.home.langchao.com (10.100.2.7) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 11 Feb 2025 11:28:33 +0800
From: Charles Han <hanchunchao@inspur.com>
To: <laurent.pinchart@ideasonboard.com>, <Markus.Elfring@web.de>,
 <tomi.valkeinen@ideasonboard.com>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <tzimmermann@suse.de>, <airlied@gmail.com>,
 <simona@ffwll.ch>, <michal.simek@amd.com>, <vishal.sagar@amd.com>
CC: <dri-devel@lists.freedesktop.org>, <linux-arm-kernel@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, Charles Han <hanchunchao@inspur.com>
Subject: [v2] drm: xlnx: zynqmp_dpsub: Add NULL check in zynqmp_audio_init
Date: Tue, 11 Feb 2025 11:28:29 +0800
Message-ID: <20250211032830.2400-1-hanchunchao@inspur.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.94.14.107]
X-ClientProxiedBy: Jtjnmail201614.home.langchao.com (10.100.2.14) To
 jtjnmail201607.home.langchao.com (10.100.2.7)
tUid: 20252111128356074588d4dd940152aa283627d077bd3
X-Abuse-Reports-To: service@corp-email.com
Abuse-Reports-To: service@corp-email.com
X-Complaints-To: service@corp-email.com
X-Report-Abuse-To: service@corp-email.com
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

devm_kasprintf() calls can return null pointers on failure.
But some return values were not checked in zynqmp_audio_init().
Add NULL check in zynqmp_audio_init(), to handle kernel NULL
pointer dereference error.

Fixes: 3ec5c1579305 ("drm: xlnx: zynqmp_dpsub: Add DP audio support")
Signed-off-by: Charles Han <hanchunchao@inspur.com>
---
 drivers/gpu/drm/xlnx/zynqmp_dp_audio.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/xlnx/zynqmp_dp_audio.c b/drivers/gpu/drm/xlnx/zynqmp_dp_audio.c
index fa5f0ace6084..f07ff4eb3a6d 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_dp_audio.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_dp_audio.c
@@ -323,12 +323,16 @@ int zynqmp_audio_init(struct zynqmp_dpsub *dpsub)
 
 	audio->dai_name = devm_kasprintf(dev, GFP_KERNEL,
 					 "%s-dai", dev_name(dev));
+	if (!audio->dai_name)
+		return -ENOMEM;
 
 	for (unsigned int i = 0; i < ZYNQMP_NUM_PCMS; ++i) {
 		audio->link_names[i] = devm_kasprintf(dev, GFP_KERNEL,
 						      "%s-dp-%u", dev_name(dev), i);
 		audio->pcm_names[i] = devm_kasprintf(dev, GFP_KERNEL,
 						     "%s-pcm-%u", dev_name(dev), i);
+		if (!audio->link_names[i] || !audio->pcm_names[i])
+			return -ENOMEM;
 	}
 
 	audio->base = devm_platform_ioremap_resource_byname(pdev, "aud");
-- 
2.43.0

