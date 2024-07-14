Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D11C930A70
	for <lists+dri-devel@lfdr.de>; Sun, 14 Jul 2024 16:53:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC27610E055;
	Sun, 14 Jul 2024 14:53:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="mPUHAlrF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9021E10E055
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Jul 2024 14:53:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=KGYf+dklKR4vjGMhUXf5Jz3Z5FN7D93ZsvVoZ4449GI=; b=mPUHAlrFgM26QmGDxc65Z68aTt
 SO7m1Odeb4WVRbijlWBwLsVpXsVv8BzeQDbF2vkz/hD/sgM8G8AJouQmNLlUTrupv7bKeJRPSp8kU
 T99VcVEGWGqMcT16y2n/0jNRFTO7yq/vaSnSiDhIOOLRyyRwy9hI+ZvY1VBSnnoUNXGdS/7C5lpak
 IItPyPf7sLS1Wvs3J9qm/TFb6zrcFOy/llyXvt0byIiNN9HfnhttHDvtdVMeDeJaqnbY95KDzyojs
 /tOj24lpNVwfRYbVxPPC+DTKU53jxR3LHsk50NzGevPh6rFJazN2htwxRhpHgwMPkTm2uv5oEc99I
 nrISP4Yw==;
Received: from [187.36.213.55] (helo=morissey..)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1sT0bC-00F4qu-2m; Sun, 14 Jul 2024 16:53:14 +0200
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: Melissa Wen <mwen@igalia.com>, Iago Toral <itoral@igalia.com>,
 =?UTF-8?q?Alejandro=20Pi=C3=B1eiro?= <apinheiro@igalia.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, kernel-dev@igalia.com,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
Subject: [PATCH 1/2] drm/v3d: Add V3D tech revision to the device information
Date: Sun, 14 Jul 2024 11:49:11 -0300
Message-ID: <20240714145243.1223131-1-mcanal@igalia.com>
X-Mailer: git-send-email 2.45.2
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

The V3D tech revision can be a useful information when configuring
jobs. Therefore, expose it in the `struct v3d_dev` with the V3D tech
version.

Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 drivers/gpu/drm/v3d/v3d_drv.c | 5 ++++-
 drivers/gpu/drm/v3d/v3d_drv.h | 8 +++++---
 2 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/v3d/v3d_drv.c b/drivers/gpu/drm/v3d/v3d_drv.c
index d38628e4fc2f..d7ff1f5fa481 100644
--- a/drivers/gpu/drm/v3d/v3d_drv.c
+++ b/drivers/gpu/drm/v3d/v3d_drv.c
@@ -267,7 +267,7 @@ static int v3d_platform_drm_probe(struct platform_device *pdev)
 	struct v3d_dev *v3d;
 	int ret;
 	u32 mmu_debug;
-	u32 ident1;
+	u32 ident1, ident3;
 	u64 mask;
 
 	v3d = devm_drm_dev_alloc(dev, &v3d_drm_driver, struct v3d_dev, drm);
@@ -300,6 +300,9 @@ static int v3d_platform_drm_probe(struct platform_device *pdev)
 	v3d->cores = V3D_GET_FIELD(ident1, V3D_HUB_IDENT1_NCORES);
 	WARN_ON(v3d->cores > 1); /* multicore not yet implemented */
 
+	ident3 = V3D_READ(V3D_HUB_IDENT3);
+	v3d->rev = V3D_GET_FIELD(ident3, V3D_HUB_IDENT3_IPREV);
+
 	v3d_perfmon_init(v3d);
 
 	v3d->reset = devm_reset_control_get_exclusive(dev, NULL);
diff --git a/drivers/gpu/drm/v3d/v3d_drv.h b/drivers/gpu/drm/v3d/v3d_drv.h
index 8524761bc62d..cf4b23369dc4 100644
--- a/drivers/gpu/drm/v3d/v3d_drv.h
+++ b/drivers/gpu/drm/v3d/v3d_drv.h
@@ -98,10 +98,12 @@ struct v3d_perfmon {
 struct v3d_dev {
 	struct drm_device drm;
 
-	/* Short representation (e.g. 33, 41) of the V3D tech version
-	 * and revision.
-	 */
+	/* Short representation (e.g. 33, 41) of the V3D tech version */
 	int ver;
+
+	/* Short representation (e.g. 5, 6) of the V3D tech revision */
+	int rev;
+
 	bool single_irq_line;
 
 	struct v3d_perfmon_info perfmon_info;
-- 
2.45.2

