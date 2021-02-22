Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 83A18321123
	for <lists+dri-devel@lfdr.de>; Mon, 22 Feb 2021 08:09:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 376946E1E0;
	Mon, 22 Feb 2021 07:09:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 474 seconds by postgrey-1.36 at gabe;
 Mon, 22 Feb 2021 07:00:08 UTC
Received: from lucky1.263xmail.com (lucky1.263xmail.com [211.157.147.132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32DC86E1E0;
 Mon, 22 Feb 2021 07:00:08 +0000 (UTC)
Received: from localhost (unknown [192.168.167.32])
 by lucky1.263xmail.com (Postfix) with ESMTP id 29657F0FFC;
 Mon, 22 Feb 2021 14:47:04 +0800 (CST)
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-ADDR-CHECKED: 0
X-ANTISPAM-LEVEL: 2
X-ABS-CHECKED: 0
Received: from localhost.localdomain (unknown [124.126.19.250])
 by smtp.263.net (postfix) whith ESMTP id
 P27943T140459827513088S1613976423851514_; 
 Mon, 22 Feb 2021 14:47:03 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <17e9c158043e3d51b4697a8f6a79f68d>
X-RL-SENDER: wangjingyu@uniontech.com
X-SENDER: wangjingyu@uniontech.com
X-LOGIN-NAME: wangjingyu@uniontech.com
X-FST-TO: alexander.deucher@amd.com
X-SENDER-IP: 124.126.19.250
X-ATTACHMENT-NUM: 0
X-System-Flag: 0
From: wangjingyu <wangjingyu@uniontech.com>
To: alexander.deucher@amd.com,
	christian.koenig@amd.com,
	airlied@linux.ie
Subject: [PATCH] drm/radeon: A gray screen appears when going into
 hibernation(S4)
Date: Mon, 22 Feb 2021 14:46:53 +0800
Message-Id: <20210222064653.22084-1-wangjingyu@uniontech.com>
X-Mailer: git-send-email 2.11.0
X-Mailman-Approved-At: Mon, 22 Feb 2021 07:09:03 +0000
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
Cc: wangjingyu <wangjingyu@uniontech.com>, zhuyong <zhuyong@uniontech.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Radeon Card:
    Caicos[Radeon HD 6450/7450/8450 /R5 230 OEM]

there is no gray screen when echo 4>/sys/module/drm/parameters/debug,
so the WREG32 function after DRM_DEBUG_KMS may have wrong when going
into hibernation.the delay of msleep(50) just can fix gray screen.

Signed-off-by: wangjingyu <wangjingyu@uniontech.com>
Signed-off-by: zhuyong <zhuyong@uniontech.com>
---
 drivers/gpu/drm/radeon/radeon_display.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/radeon/radeon_display.c b/drivers/gpu/drm/radeon/radeon_display.c
index ddfe91efa61e..1f7f0904e4a5 100644
--- a/drivers/gpu/drm/radeon/radeon_display.c
+++ b/drivers/gpu/drm/radeon/radeon_display.c
@@ -215,6 +215,7 @@ void radeon_crtc_load_lut(struct drm_crtc *crtc)
 	if (!crtc->enabled)
 		return;
 
+	msleep(50);
 	if (ASIC_IS_DCE5(rdev))
 		dce5_crtc_load_lut(crtc);
 	else if (ASIC_IS_DCE4(rdev))
-- 
2.11.0



_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
