Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0879589D39F
	for <lists+dri-devel@lfdr.de>; Tue,  9 Apr 2024 09:58:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0897B10F880;
	Tue,  9 Apr 2024 07:58:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=t-argos.ru header.i=@t-argos.ru header.b="h2KMpMeG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.t-argos.ru (mx1.t-argos.ru [109.73.34.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3DB910F880
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Apr 2024 07:58:10 +0000 (UTC)
Received: from mx1.t-argos.ru (localhost [127.0.0.1])
 by mx1.t-argos.ru (Postfix) with ESMTP id ACE56100002;
 Tue,  9 Apr 2024 10:57:52 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-argos.ru; s=mail;
 t=1712649472; bh=19/Iy6O/3LiyHhHggC3Vu6d5yWOLTGboqwpYX5yUxhE=;
 h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
 b=h2KMpMeGhSjBRau0u8dxlvcVd01vY+Bg0ZgvGrH0+UFqhE3oI/y6dv5nffZVPBFRR
 taGnfUqPJQD0v3Mg27F58CI/vKFRXut6pQrffVZ0rHYyMBSqxJu/eEu9WMVCoNiFBF
 vbhGbh4RfQ369y3AqyY/XSsnl/frty3BNVkmZwDUu9CJluZ8QAZJ7rXFM0Am//kQt+
 yL3f18NadrMDRXadGUmDHbcw4OHH67HgGlKQm+zkDxbUxQRPvpSswgRhlb+lJ6NKcg
 GtgL+IrE5LkDOGY3J2MgOb8xTzb/Bqg2ITyQsidjMxn4edlPW9Z4hDYWUP57JoC4//
 kvr8ACzovQrNQ==
Received: from mx1.t-argos.ru.ru (ta-mail-02.ta.t-argos.ru [172.17.13.212])
 by mx1.t-argos.ru (Postfix) with ESMTP;
 Tue,  9 Apr 2024 10:56:50 +0300 (MSK)
Received: from localhost.localdomain (172.17.215.6) by ta-mail-02
 (172.17.13.212) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 9 Apr 2024
 10:56:30 +0300
From: Aleksandr Mishin <amishin@t-argos.ru>
To: Eric Anholt <eric@anholt.net>
CC: Aleksandr Mishin <amishin@t-argos.ru>, Maxime Ripard <mripard@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Daniel Vetter
 <daniel@ffwll.ch>, Boris Brezillon <bbrezillon@kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <lvc-project@linuxtesting.org>
Subject: [PATCH] drm: vc4: Fix possible null pointer dereference
Date: Tue, 9 Apr 2024 10:56:22 +0300
Message-ID: <20240409075622.11783-1-amishin@t-argos.ru>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.17.215.6]
X-ClientProxiedBy: ta-mail-02.ta.t-argos.ru (172.17.13.212) To ta-mail-02
 (172.17.13.212)
X-KSMG-Rule-ID: 1
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 184634 [Apr 09 2024]
X-KSMG-AntiSpam-Version: 6.1.0.4
X-KSMG-AntiSpam-Envelope-From: amishin@t-argos.ru
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 15 0.3.15
 adb41f89e2951eb37b279104a7abb8e79494a5e7,
 {Tracking_from_domain_doesnt_match_to}, 127.0.0.199:7.1.2;
 mx1.t-argos.ru.ru:7.1.1; d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;
 t-argos.ru:7.1.1, FromAlignment: s
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean, bases: 2024/04/09 06:51:00
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 1.1.2.30,
 bases: 2024/04/09 03:34:00 #24714050
X-KSMG-AntiVirus-Status: Clean, skipped
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

In vc4_hdmi_audio_init() of_get_address() may return
NULL which is later dereferenced. Fix this bug by adding NULL check.

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Fixes: bb7d78568814 ("drm/vc4: Add HDMI audio support")
Signed-off-by: Aleksandr Mishin <amishin@t-argos.ru>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index d8751ea20303..5f8d51b29370 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -2740,6 +2740,8 @@ static int vc4_hdmi_audio_init(struct vc4_hdmi *vc4_hdmi)
 		index = 1;
 
 	addr = of_get_address(dev->of_node, index, NULL, NULL);
+	if (!addr)
+		return -EINVAL;
 
 	vc4_hdmi->audio.dma_data.addr = be32_to_cpup(addr) + mai_data->offset;
 	vc4_hdmi->audio.dma_data.addr_width = DMA_SLAVE_BUSWIDTH_4_BYTES;
-- 
2.30.2

