Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7655D9E7939
	for <lists+dri-devel@lfdr.de>; Fri,  6 Dec 2024 20:45:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A70E10E63D;
	Fri,  6 Dec 2024 19:45:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=canonical.com header.i=@canonical.com header.b="blgoFFBs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 436 seconds by postgrey-1.36 at gabe;
 Fri, 06 Dec 2024 11:50:03 UTC
Received: from smtp-relay-canonical-0.canonical.com
 (smtp-relay-canonical-0.canonical.com [185.125.188.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8465C10E3F7
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Dec 2024 11:50:03 +0000 (UTC)
Received: from laptop.lan (unknown [125.33.216.38])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPSA id 2CFCF3F789; 
 Fri,  6 Dec 2024 11:42:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1733485365;
 bh=PFPFV0Ax8i8C9LyOLIOefcKHDDFqRhlURq1jSxeY31o=;
 h=From:To:Subject:Date:Message-Id:MIME-Version;
 b=blgoFFBseV8uNYm7ISBs4Rh1VbtPHumoIOXPTinyfqfICH5IaNJv1CLMT3yRtHsXJ
 3aSrEH7kzcWwEiUZLuWYDqkpfQ2fklpXSk50KvH0ju0RqTB1yfRMGWxE/ldKTFC1An
 iVNQ4RYYnqqC4dae2l/0MdarYIj2bYOw9EG9oqKe08YiC8tZ2+eueUQjd7e+/G1SbY
 2HWZCKN0uBZQEKI+RHwhs1F2L1h4B5bDY55uzMtumpV/6+90qAVWsqgZ8yW4+j3Luy
 M8Is54VTN/qYoBoiEd2PXcKOLdCsT+5bvxcK+77I1/ohFzNIplLdEoK43sccfj7ntE
 7Q7I8FcQ1dm5g==
From: Guoqing Jiang <guoqing.jiang@canonical.com>
To: hjc@rock-chips.com, heiko@sntech.de, andy.yan@rock-chips.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
Subject: [PATCH] drm/rockchip: Remove unnecessary checking
Date: Fri,  6 Dec 2024 19:42:33 +0800
Message-Id: <20241206114233.1270989-1-guoqing.jiang@canonical.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 06 Dec 2024 19:45:35 +0000
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

It is not needed since drm_atomic_helper_shutdown checks it.

Signed-off-by: Guoqing Jiang <guoqing.jiang@canonical.com>
---
 drivers/gpu/drm/rockchip/rockchip_drm_drv.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_drv.c b/drivers/gpu/drm/rockchip/rockchip_drm_drv.c
index 585355de696b..64f5f547fb7a 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_drv.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_drv.c
@@ -488,8 +488,7 @@ static void rockchip_drm_platform_shutdown(struct platform_device *pdev)
 {
 	struct drm_device *drm = platform_get_drvdata(pdev);
 
-	if (drm)
-		drm_atomic_helper_shutdown(drm);
+	drm_atomic_helper_shutdown(drm);
 }
 
 static const struct of_device_id rockchip_drm_dt_ids[] = {
-- 
2.35.3

