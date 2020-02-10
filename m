Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B23B2158610
	for <lists+dri-devel@lfdr.de>; Tue, 11 Feb 2020 00:15:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BB186ED72;
	Mon, 10 Feb 2020 23:15:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqnvemgate25.nvidia.com (hqnvemgate25.nvidia.com
 [216.228.121.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EA476EA0D;
 Mon, 10 Feb 2020 23:15:25 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5e41e3f10001>; Mon, 10 Feb 2020 15:14:57 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Mon, 10 Feb 2020 15:15:24 -0800
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Mon, 10 Feb 2020 15:15:24 -0800
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 10 Feb
 2020 23:15:24 +0000
Received: from rnnvemgw01.nvidia.com (10.128.109.123) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via
 Frontend Transport; Mon, 10 Feb 2020 23:15:24 +0000
Received: from jajones-aftershock.nvidia.com (Not Verified[172.20.40.102]) by
 rnnvemgw01.nvidia.com with Trustwave SEG (v7, 5, 8, 10121)
 id <B5e41e40c0000>; Mon, 10 Feb 2020 15:15:24 -0800
From: James Jones <jajones@nvidia.com>
To: Ben Skeggs <bskeggs@redhat.com>
Subject: [PATCH v5 2/3] drm/nouveau: Check framebuffer size against bo
Date: Mon, 10 Feb 2020 15:15:54 -0800
Message-ID: <20200210231555.3316-3-jajones@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200210231555.3316-1-jajones@nvidia.com>
References: <20200210231555.3316-1-jajones@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1581376498; bh=Afv8XvnLWtcxADbB+SJWjH/rsBGzy/uEyLL57xFuqSM=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 In-Reply-To:References:X-NVConfidentiality:MIME-Version:
 Content-Type;
 b=W/bBbHbZ7f6fXL4+C4Xr8KjPPR6UgruXb6hx5tWQTdaY47zUCEUx4mDtd6QCzCHdv
 LbDIjyUVo3UV7a8AkgRueEgtrppSZznjiJESW8tGJRRlHwzfdrXyk2mH4Vo5Sf1uRW
 F64i+GzGuqlPLDzaVEFYCnAediifjO6l8Yc0Owe1tl49JhjZvy3tLgcfOmpNLbMJ0d
 guh7Rqi+YGvzgRN/wevwLDCECJCyLJ2RiNBXwbn5zdaKhb2LspdcYIzZVE1hB5HAuW
 toDtEvmLhiR9lkzVw6ow013W+m0EbpNx5YGN47eREjJ8mu62Moh7XUKXuG/s4rtIAR
 KpRrP50PU8fzQ==
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

Make sure framebuffer dimensions and tiling
parameters will not result in accesses beyond the
end of the GEM buffer they are bound to.

v3: Return EINVAL when creating FB against BO with
    unsupported tiling
v5: Resolved against nouveau_framebuffer cleanup

Signed-off-by: James Jones <jajones@nvidia.com>
---
 drivers/gpu/drm/nouveau/nouveau_display.c | 98 +++++++++++++++++++++++
 1 file changed, 98 insertions(+)

diff --git a/drivers/gpu/drm/nouveau/nouveau_display.c b/drivers/gpu/drm/nouveau/nouveau_display.c
index 94f7fd48e1cf..3048a43a8d36 100644
--- a/drivers/gpu/drm/nouveau/nouveau_display.c
+++ b/drivers/gpu/drm/nouveau/nouveau_display.c
@@ -203,6 +203,76 @@ static const struct drm_framebuffer_funcs nouveau_framebuffer_funcs = {
 	.create_handle = drm_gem_fb_create_handle,
 };
 
+static inline uint32_t
+nouveau_get_width_in_blocks(uint32_t stride)
+{
+	/* GOBs per block in the x direction is always one, and GOBs are
+	 * 64 bytes wide
+	 */
+	static const uint32_t log_block_width = 6;
+
+	return (stride + (1 << log_block_width) - 1) >> log_block_width;
+}
+
+static inline uint32_t
+nouveau_get_height_in_blocks(struct nouveau_drm *drm,
+			     uint32_t height,
+			     uint32_t log_block_height_in_gobs)
+{
+	uint32_t log_gob_height;
+	uint32_t log_block_height;
+
+	BUG_ON(drm->client.device.info.family < NV_DEVICE_INFO_V0_TESLA);
+
+	if (drm->client.device.info.family < NV_DEVICE_INFO_V0_FERMI)
+		log_gob_height = 2;
+	else
+		log_gob_height = 3;
+
+	log_block_height = log_block_height_in_gobs + log_gob_height;
+
+	return (height + (1 << log_block_height) - 1) >> log_block_height;
+}
+
+static int
+nouveau_check_bl_size(struct nouveau_drm *drm, struct nouveau_bo *nvbo,
+		      uint32_t offset, uint32_t stride, uint32_t h,
+		      uint32_t tile_mode)
+{
+	uint32_t gob_size, bw, bh;
+	uint64_t bl_size;
+
+	BUG_ON(drm->client.device.info.family < NV_DEVICE_INFO_V0_TESLA);
+
+	if (drm->client.device.info.chipset >= 0xc0) {
+		if (tile_mode & 0xF)
+			return -EINVAL;
+		tile_mode >>= 4;
+	}
+
+	if (tile_mode & 0xFFFFFFF0)
+		return -EINVAL;
+
+	if (drm->client.device.info.family < NV_DEVICE_INFO_V0_FERMI)
+		gob_size = 256;
+	else
+		gob_size = 512;
+
+	bw = nouveau_get_width_in_blocks(stride);
+	bh = nouveau_get_height_in_blocks(drm, h, tile_mode);
+
+	bl_size = bw * bh * (1 << tile_mode) * gob_size;
+
+	DRM_DEBUG_KMS("offset=%u stride=%u h=%u tile_mode=0x%02x bw=%u bh=%u gob_size=%u bl_size=%llu size=%lu\n",
+		      offset, stride, h, tile_mode, bw, bh, gob_size, bl_size,
+		      nvbo->bo.mem.size);
+
+	if (bl_size + offset > nvbo->bo.mem.size)
+		return -ERANGE;
+
+	return 0;
+}
+
 int
 nouveau_framebuffer_new(struct drm_device *dev,
 			const struct drm_mode_fb_cmd2 *mode_cmd,
@@ -210,7 +280,10 @@ nouveau_framebuffer_new(struct drm_device *dev,
 			struct drm_framebuffer **pfb)
 {
 	struct nouveau_drm *drm = nouveau_drm(dev);
+	struct nouveau_bo *nvbo = nouveau_gem_object(gem);
 	struct drm_framebuffer *fb;
+	const struct drm_format_info *info;
+	unsigned int width, height, i;
 	int ret;
 
         /* YUV overlays have special requirements pre-NV50 */
@@ -233,6 +306,31 @@ nouveau_framebuffer_new(struct drm_device *dev,
 		return -EINVAL;
 	}
 
+	info = drm_get_format_info(dev, mode_cmd);
+
+	for (i = 0; i < info->num_planes; i++) {
+		width = drm_format_info_plane_width(info,
+						    mode_cmd->width,
+						    i);
+		height = drm_format_info_plane_height(info,
+						      mode_cmd->height,
+						      i);
+
+		if (nvbo->kind) {
+			ret = nouveau_check_bl_size(drm, nvbo,
+						    mode_cmd->offsets[i],
+						    mode_cmd->pitches[i],
+						    height, nvbo->mode);
+			if (ret)
+				return ret;
+		} else {
+			uint32_t size = mode_cmd->pitches[i] * height;
+
+			if (size + mode_cmd->offsets[i] > nvbo->bo.mem.size)
+				return -ERANGE;
+		}
+	}
+
 	if (!(fb = *pfb = kzalloc(sizeof(*fb), GFP_KERNEL)))
 		return -ENOMEM;
 
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
