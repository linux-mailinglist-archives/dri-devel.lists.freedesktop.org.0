Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DEE69AB64C
	for <lists+dri-devel@lfdr.de>; Tue, 22 Oct 2024 20:56:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78E3710E624;
	Tue, 22 Oct 2024 18:56:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="XEABDg/d";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA39D10E32A
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Oct 2024 18:56:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1729623379;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sIebS6dUMD5Xkf2nEFyb4E9/NZ6DwCvnfmCp5lAiOj0=;
 b=XEABDg/dzI2ne6Gjey86s4K7kYDPrmqD7OQaAjmVmRzC6T7+/YyCpW33PkCbbSErjBm88/
 zfM/yR4QcUFbEEo/d1/R8g7/UTC5fQapaXaKOjkDcVVS+13qc1K4rlqE0DJNNasOw7do20
 01iPh8oS3RRZ2PA9chSmYyO9Odm0R6k=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-179-0pt-69vwO5qZpHsfzmEqdA-1; Tue,
 22 Oct 2024 14:56:15 -0400
X-MC-Unique: 0pt-69vwO5qZpHsfzmEqdA-1
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 9267D1955E85; Tue, 22 Oct 2024 18:56:13 +0000 (UTC)
Received: from hydra.redhat.com (unknown [10.39.193.145])
 by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 8D8711955EA3; Tue, 22 Oct 2024 18:56:10 +0000 (UTC)
From: Jocelyn Falempe <jfalempe@redhat.com>
To: Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@redhat.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org
Cc: Jocelyn Falempe <jfalempe@redhat.com>
Subject: [PATCH v4 2/3] drm/nouveau/disp: Move tiling functions to
 dispnv50/tile.h
Date: Tue, 22 Oct 2024 20:39:48 +0200
Message-ID: <20241022185553.1103384-3-jfalempe@redhat.com>
In-Reply-To: <20241022185553.1103384-1-jfalempe@redhat.com>
References: <20241022185553.1103384-1-jfalempe@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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

Refactor, and move the tiling geometry functions to dispnv50/tile.h,
so they can be re-used by drm_panic.
No functional impact.

Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
---

 drivers/gpu/drm/nouveau/dispnv50/tile.h   | 63 +++++++++++++++++++++++
 drivers/gpu/drm/nouveau/nouveau_display.c | 59 ++++-----------------
 2 files changed, 73 insertions(+), 49 deletions(-)
 create mode 100644 drivers/gpu/drm/nouveau/dispnv50/tile.h

diff --git a/drivers/gpu/drm/nouveau/dispnv50/tile.h b/drivers/gpu/drm/nouveau/dispnv50/tile.h
new file mode 100644
index 0000000000000..e8769d1886b11
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/dispnv50/tile.h
@@ -0,0 +1,63 @@
+/* SPDX-License-Identifier: MIT */
+#ifndef __NV50_TILE_H__
+#define __NV50_TILE_H__
+
+#include <linux/types.h>
+#include <linux/math.h>
+
+/*
+ * Tiling parameters for NV50+.
+ * GOB = Group of bytes, the main unit for tiling blocks.
+ * Tiling blocks are a power of 2 number of GOB.
+ * All GOBs and blocks have the same width: 64 bytes (so 16 pixels in 32bits).
+ * tile_mode is the log2 of the number of GOB per block.
+ */
+
+#define NV_TILE_GOB_HEIGHT_TESLA 4	/* 4 x 64 bytes = 256 bytes for a GOB on Tesla*/
+#define NV_TILE_GOB_HEIGHT 8		/* 8 x 64 bytes = 512 bytes for a GOB on Fermi and later */
+#define NV_TILE_GOB_WIDTH_BYTES 64
+
+/* Number of blocks to cover the width of the framebuffer */
+static inline u32 nouveau_get_width_in_blocks(u32 stride)
+{
+	return DIV_ROUND_UP(stride, NV_TILE_GOB_WIDTH_BYTES);
+}
+
+/* Return the height in pixel of one GOB */
+static inline u32 nouveau_get_gob_height(u16 family)
+{
+	if (family == NV_DEVICE_INFO_V0_TESLA)
+		return NV_TILE_GOB_HEIGHT_TESLA;
+	else
+		return NV_TILE_GOB_HEIGHT;
+}
+
+/* Number of blocks to cover the heigth of the framebuffer */
+static inline u32 nouveau_get_height_in_blocks(u32 height, u32 gobs_in_block, u16 family)
+{
+	return DIV_ROUND_UP(height, nouveau_get_gob_height(family) * gobs_in_block);
+}
+
+/* Return the GOB size in bytes */
+static inline u32 nouveau_get_gob_size(u16 family)
+{
+	return nouveau_get_gob_height(family) * NV_TILE_GOB_WIDTH_BYTES;
+}
+
+/* Return the number of GOB in a block */
+static inline int nouveau_get_gobs_in_block(u32 tile_mode, u16 chipset)
+{
+	if (chipset >= 0xc0)
+		return 1 << (tile_mode >> 4);
+	return 1 << tile_mode;
+}
+
+/* Return true if tile_mode is invalid */
+static inline bool nouveau_check_tile_mode(u32 tile_mode, u16 chipset)
+{
+	if (chipset >= 0xc0)
+		return (tile_mode & 0xfffff0f);
+	return (tile_mode & 0xfffffff0);
+}
+
+#endif
diff --git a/drivers/gpu/drm/nouveau/nouveau_display.c b/drivers/gpu/drm/nouveau/nouveau_display.c
index 619a3efbe8c88..add006fc8d818 100644
--- a/drivers/gpu/drm/nouveau/nouveau_display.c
+++ b/drivers/gpu/drm/nouveau/nouveau_display.c
@@ -44,6 +44,7 @@
 #include <nvif/if0011.h>
 #include <nvif/if0013.h>
 #include <dispnv50/crc.h>
+#include <dispnv50/tile.h>
 
 int
 nouveau_display_vblank_enable(struct drm_crtc *crtc)
@@ -220,69 +221,29 @@ nouveau_validate_decode_mod(struct nouveau_drm *drm,
 	return 0;
 }
 
-static inline uint32_t
-nouveau_get_width_in_blocks(uint32_t stride)
-{
-	/* GOBs per block in the x direction is always one, and GOBs are
-	 * 64 bytes wide
-	 */
-	static const uint32_t log_block_width = 6;
-
-	return (stride + (1 << log_block_width) - 1) >> log_block_width;
-}
-
-static inline uint32_t
-nouveau_get_height_in_blocks(struct nouveau_drm *drm,
-			     uint32_t height,
-			     uint32_t log_block_height_in_gobs)
-{
-	uint32_t log_gob_height;
-	uint32_t log_block_height;
-
-	BUG_ON(drm->client.device.info.family < NV_DEVICE_INFO_V0_TESLA);
-
-	if (drm->client.device.info.family < NV_DEVICE_INFO_V0_FERMI)
-		log_gob_height = 2;
-	else
-		log_gob_height = 3;
-
-	log_block_height = log_block_height_in_gobs + log_gob_height;
-
-	return (height + (1 << log_block_height) - 1) >> log_block_height;
-}
-
 static int
 nouveau_check_bl_size(struct nouveau_drm *drm, struct nouveau_bo *nvbo,
 		      uint32_t offset, uint32_t stride, uint32_t h,
 		      uint32_t tile_mode)
 {
-	uint32_t gob_size, bw, bh;
+	uint32_t gob_size, bw, bh, gobs_in_block;
 	uint64_t bl_size;
 
 	BUG_ON(drm->client.device.info.family < NV_DEVICE_INFO_V0_TESLA);
 
-	if (drm->client.device.info.chipset >= 0xc0) {
-		if (tile_mode & 0xF)
-			return -EINVAL;
-		tile_mode >>= 4;
-	}
-
-	if (tile_mode & 0xFFFFFFF0)
+	if (nouveau_check_tile_mode(tile_mode, drm->client.device.info.chipset))
 		return -EINVAL;
 
-	if (drm->client.device.info.family < NV_DEVICE_INFO_V0_FERMI)
-		gob_size = 256;
-	else
-		gob_size = 512;
-
+	gobs_in_block = nouveau_get_gobs_in_block(tile_mode, drm->client.device.info.chipset);
 	bw = nouveau_get_width_in_blocks(stride);
-	bh = nouveau_get_height_in_blocks(drm, h, tile_mode);
+	bh = nouveau_get_height_in_blocks(h, gobs_in_block, drm->client.device.info.family);
+	gob_size = nouveau_get_gob_size(drm->client.device.info.family);
 
-	bl_size = bw * bh * (1 << tile_mode) * gob_size;
+	bl_size = bw * bh * gobs_in_block * gob_size;
 
-	DRM_DEBUG_KMS("offset=%u stride=%u h=%u tile_mode=0x%02x bw=%u bh=%u gob_size=%u bl_size=%llu size=%zu\n",
-		      offset, stride, h, tile_mode, bw, bh, gob_size, bl_size,
-		      nvbo->bo.base.size);
+	DRM_DEBUG_KMS("offset=%u stride=%u h=%u gobs_in_block=%u bw=%u bh=%u gob_size=%u bl_size=%llu size=%zu\n",
+		      offset, stride, h, gobs_in_block, bw, bh, gob_size,
+		      bl_size, nvbo->bo.base.size);
 
 	if (bl_size + offset > nvbo->bo.base.size)
 		return -ERANGE;
-- 
2.47.0

