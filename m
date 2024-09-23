Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E809D97ECDB
	for <lists+dri-devel@lfdr.de>; Mon, 23 Sep 2024 16:14:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4617410E416;
	Mon, 23 Sep 2024 14:14:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="WKDGHWbt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 398BA10E407
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Sep 2024 14:14:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=sWWXo0wkprv73VjqR+GCSMM3hIWXpKMAEjl+ASzWi2c=; b=WKDGHWbtkLiEd7KssO4uJpW26+
 OzRwIsERDSZWvMLMzmIeL8tJdtsY6UDJiWD75xeNynH1wkvdNy7KE/Yjg5MlPgd34/3z9jw7kckhs
 sENcgafvjA8fdP+Hs/GFz2xjpxiBjuImflTOCS+6zOdV0qI7PTopmp14LBx/C0aSGa5vkNsNVCgUR
 spXXgsYs7T44ysBI91i1zkmCRUfbD8i8nvvvDeafqCfNKDrTsu2F+cudb3DJwMVV6EG4q0g3lRakL
 SUesmVbE6bTTuwje+kN9Z4yYgKzsVwpb0bpEnUsihuPu3HFMh2Bd3uK63UoEZo5SiGnPA4vztu3bY
 o+QztJsw==;
Received: from [187.36.213.55] (helo=morissey..)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1ssjpT-00HYyM-CU; Mon, 23 Sep 2024 16:14:20 +0200
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: Melissa Wen <mwen@igalia.com>, Iago Toral <itoral@igalia.com>,
 Tvrtko Ursulin <tursulin@igalia.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, kernel-dev@igalia.com,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
Subject: [PATCH v6 01/11] drm/v3d: Address race-condition in MMU flush
Date: Mon, 23 Sep 2024 10:55:05 -0300
Message-ID: <20240923141348.2422499-2-mcanal@igalia.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240923141348.2422499-1-mcanal@igalia.com>
References: <20240923141348.2422499-1-mcanal@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

We must first flush the MMU cache and then, flush the TLB, not the other
way around. Currently, we can see a race condition between the MMU cache
and the TLB when running multiple rendering processes at the same time.
This is evidenced by MMU errors triggered by the IRQ.

Fix the MMU flush order by flushing the MMU cache and then the TLB.
Also, in order to address the race condition, wait for the MMU cache flush
to finish before starting the TLB flush.

Fixes: 57692c94dcbe ("drm/v3d: Introduce a new DRM driver for Broadcom V3D V3.x+")
Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 drivers/gpu/drm/v3d/v3d_mmu.c | 29 ++++++++++-------------------
 1 file changed, 10 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/v3d/v3d_mmu.c b/drivers/gpu/drm/v3d/v3d_mmu.c
index 14f3af40d6f6..e36ec3343b06 100644
--- a/drivers/gpu/drm/v3d/v3d_mmu.c
+++ b/drivers/gpu/drm/v3d/v3d_mmu.c
@@ -32,32 +32,23 @@ static int v3d_mmu_flush_all(struct v3d_dev *v3d)
 {
 	int ret;
 
-	/* Make sure that another flush isn't already running when we
-	 * start this one.
-	 */
-	ret = wait_for(!(V3D_READ(V3D_MMU_CTL) &
-			 V3D_MMU_CTL_TLB_CLEARING), 100);
-	if (ret)
-		dev_err(v3d->drm.dev, "TLB clear wait idle pre-wait failed\n");
-
-	V3D_WRITE(V3D_MMU_CTL, V3D_READ(V3D_MMU_CTL) |
-		  V3D_MMU_CTL_TLB_CLEAR);
-
-	V3D_WRITE(V3D_MMUC_CONTROL,
-		  V3D_MMUC_CONTROL_FLUSH |
+	V3D_WRITE(V3D_MMUC_CONTROL, V3D_MMUC_CONTROL_FLUSH |
 		  V3D_MMUC_CONTROL_ENABLE);
 
-	ret = wait_for(!(V3D_READ(V3D_MMU_CTL) &
-			 V3D_MMU_CTL_TLB_CLEARING), 100);
+	ret = wait_for(!(V3D_READ(V3D_MMUC_CONTROL) &
+			 V3D_MMUC_CONTROL_FLUSHING), 100);
 	if (ret) {
-		dev_err(v3d->drm.dev, "TLB clear wait idle failed\n");
+		dev_err(v3d->drm.dev, "MMUC flush wait idle failed\n");
 		return ret;
 	}
 
-	ret = wait_for(!(V3D_READ(V3D_MMUC_CONTROL) &
-			 V3D_MMUC_CONTROL_FLUSHING), 100);
+	V3D_WRITE(V3D_MMU_CTL, V3D_READ(V3D_MMU_CTL) |
+		  V3D_MMU_CTL_TLB_CLEAR);
+
+	ret = wait_for(!(V3D_READ(V3D_MMU_CTL) &
+			 V3D_MMU_CTL_TLB_CLEARING), 100);
 	if (ret)
-		dev_err(v3d->drm.dev, "MMUC flush wait idle failed\n");
+		dev_err(v3d->drm.dev, "MMU TLB clear wait idle failed\n");
 
 	return ret;
 }
-- 
2.46.0

