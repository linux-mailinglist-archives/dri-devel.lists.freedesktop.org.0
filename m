Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8AE911BECB
	for <lists+dri-devel@lfdr.de>; Wed, 11 Dec 2019 22:04:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C75816EBCF;
	Wed, 11 Dec 2019 21:03:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqnvemgate25.nvidia.com (hqnvemgate25.nvidia.com
 [216.228.121.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B2B36EBCE;
 Wed, 11 Dec 2019 21:03:55 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5df158870000>; Wed, 11 Dec 2019 12:58:47 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Wed, 11 Dec 2019 12:58:54 -0800
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Wed, 11 Dec 2019 12:58:54 -0800
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 11 Dec
 2019 20:58:54 +0000
Received: from rnnvemgw01.nvidia.com (10.128.109.123) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via
 Frontend Transport; Wed, 11 Dec 2019 20:58:54 +0000
Received: from jajones-aftershock.nvidia.com (Not Verified[172.20.42.105]) by
 rnnvemgw01.nvidia.com with Trustwave SEG (v7, 5, 8, 10121)
 id <B5df1588d0004>; Wed, 11 Dec 2019 12:58:54 -0800
From: James Jones <jajones@nvidia.com>
To: Ben Skeggs <bskeggs@redhat.com>
Subject: [PATCH 0/3] drm/nouveau: Support NVIDIA format modifiers
Date: Wed, 11 Dec 2019 12:59:19 -0800
Message-ID: <20191211205922.7096-1-jajones@nvidia.com>
X-Mailer: git-send-email 2.17.1
X-NVConfidentiality: public
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1576097928; bh=pznojtHHydzWQ5aV3IHBFsSXnn7vbgU3LpvUL9xzI8Q=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 X-NVConfidentiality:MIME-Version:Content-Type;
 b=WWDcupYjlKZMwaScMT0TJNdw5vILmwkvOLwNaKmKGws+myj0OId5nZeNODhevAuEH
 51Ybgj/dKjL9YVzwvSQM5kAGV9nzcRp8QFm2OQNOKm+Bp6ibF3BiY6M+0NsuxWVck6
 Hc1ojGxMHHJ+tKeQiONRvRud5e1mjpg4+VHQMOiJFcE+1xt4hfXLitxPwBTtr/c1tR
 MrATjypYCsEH+/nAjzMkmUeStTwEZ1yy5g1czMn61QAk5ibScbCPCfPyASEMKXlEMn
 pA7Rreo8XgjtFuNVhozvtiRTo3YI10/BGLlPsSsPoE3EjXVoslPHcW4hyb39ZzqrVA
 pyOrvngczDboA==
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
Cc: nouveau@lists.freedesktop.org, James Jones <jajones@nvidia.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This series modifies the NV5x+ nouveau display backends to advertise
appropriate format modifiers on their display planes in atomic mode
setting blobs.

Corresponding modifications to Mesa/userspace are available here:

https://gitlab.freedesktop.org/cubanismo/mesa/tree/nouveau_work

But those need a bit of cleanup before they're ready to submit.

I've tested this on Tesla, Kepler, Pascal, and Turing-class hardware
using various formats and all the exposed format modifiers, plus some
negative testing with invalid ones.

NOTE: this series depends on the "[PATCH v3] drm: Generalized NV Block
Linear DRM format mod" patch submitted to dri-devel.

Signed-off-by: James Jones <jajones@nvidia.com>
---
 drivers/gpu/drm/tegra/dc.c  | 10 ++++++++++
 drivers/gpu/drm/tegra/fb.c  | 14 +++++++-------
 drivers/gpu/drm/tegra/hub.c | 10 ++++++++++
 3 files changed, 27 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
index fbf57bc3cdab..a2cc687dc2d8 100644
--- a/drivers/gpu/drm/tegra/dc.c
+++ b/drivers/gpu/drm/tegra/dc.c
@@ -588,6 +588,16 @@ static const u32 tegra124_primary_formats[] = {
 
 static const u64 tegra124_modifiers[] = {
 	DRM_FORMAT_MOD_LINEAR,
+	DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 0, 0, 0xfe, 0),
+	DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 0, 0, 0xfe, 1),
+	DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 0, 0, 0xfe, 2),
+	DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 0, 0, 0xfe, 3),
+	DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 0, 0, 0xfe, 4),
+	DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 0, 0, 0xfe, 5),
+	/*
+	 * For backwards compatibility with older userspace that may have
+	 * baked in usage of the less-descriptive modifiers
+	 */
 	DRM_FORMAT_MOD_NVIDIA_16BX2_BLOCK(0),
 	DRM_FORMAT_MOD_NVIDIA_16BX2_BLOCK(1),
 	DRM_FORMAT_MOD_NVIDIA_16BX2_BLOCK(2),
diff --git a/drivers/gpu/drm/tegra/fb.c b/drivers/gpu/drm/tegra/fb.c
index e34325c83d28..d04e0b1c61ea 100644
--- a/drivers/gpu/drm/tegra/fb.c
+++ b/drivers/gpu/drm/tegra/fb.c
@@ -44,7 +44,7 @@ int tegra_fb_get_tiling(struct drm_framebuffer *framebuffer,
 {
 	uint64_t modifier = framebuffer->modifier;
 
-	switch (modifier) {
+	switch (drm_fourcc_canonicalize_nvidia_format_mod(modifier)) {
 	case DRM_FORMAT_MOD_LINEAR:
 		tiling->mode = TEGRA_BO_TILING_MODE_PITCH;
 		tiling->value = 0;
@@ -55,32 +55,32 @@ int tegra_fb_get_tiling(struct drm_framebuffer *framebuffer,
 		tiling->value = 0;
 		break;
 
-	case DRM_FORMAT_MOD_NVIDIA_16BX2_BLOCK(0):
+	case DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 0, 0, 0xfe, 0):
 		tiling->mode = TEGRA_BO_TILING_MODE_BLOCK;
 		tiling->value = 0;
 		break;
 
-	case DRM_FORMAT_MOD_NVIDIA_16BX2_BLOCK(1):
+	case DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 0, 0, 0xfe, 1):
 		tiling->mode = TEGRA_BO_TILING_MODE_BLOCK;
 		tiling->value = 1;
 		break;
 
-	case DRM_FORMAT_MOD_NVIDIA_16BX2_BLOCK(2):
+	case DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 0, 0, 0xfe, 2):
 		tiling->mode = TEGRA_BO_TILING_MODE_BLOCK;
 		tiling->value = 2;
 		break;
 
-	case DRM_FORMAT_MOD_NVIDIA_16BX2_BLOCK(3):
+	case DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 0, 0, 0xfe, 3):
 		tiling->mode = TEGRA_BO_TILING_MODE_BLOCK;
 		tiling->value = 3;
 		break;
 
-	case DRM_FORMAT_MOD_NVIDIA_16BX2_BLOCK(4):
+	case DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 0, 0, 0xfe, 4):
 		tiling->mode = TEGRA_BO_TILING_MODE_BLOCK;
 		tiling->value = 4;
 		break;
 
-	case DRM_FORMAT_MOD_NVIDIA_16BX2_BLOCK(5):
+	case DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 0, 0, 0xfe, 5):
 		tiling->mode = TEGRA_BO_TILING_MODE_BLOCK;
 		tiling->value = 5;
 		break;
diff --git a/drivers/gpu/drm/tegra/hub.c b/drivers/gpu/drm/tegra/hub.c
index 839b49c40e51..03c97b10b122 100644
--- a/drivers/gpu/drm/tegra/hub.c
+++ b/drivers/gpu/drm/tegra/hub.c
@@ -49,6 +49,16 @@ static const u32 tegra_shared_plane_formats[] = {
 
 static const u64 tegra_shared_plane_modifiers[] = {
 	DRM_FORMAT_MOD_LINEAR,
+	DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 0, 0, 0xfe, 0),
+	DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 0, 0, 0xfe, 1),
+	DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 0, 0, 0xfe, 2),
+	DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 0, 0, 0xfe, 3),
+	DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 0, 0, 0xfe, 4),
+	DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 0, 0, 0xfe, 5),
+	/*
+	 * For backwards compatibility with older userspace that may have
+	 * baked in usage of the less-descriptive modifiers
+	 */
 	DRM_FORMAT_MOD_NVIDIA_16BX2_BLOCK(0),
 	DRM_FORMAT_MOD_NVIDIA_16BX2_BLOCK(1),
 	DRM_FORMAT_MOD_NVIDIA_16BX2_BLOCK(2),
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
