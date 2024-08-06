Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AEC9E94968F
	for <lists+dri-devel@lfdr.de>; Tue,  6 Aug 2024 19:19:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FCBA10E3D4;
	Tue,  6 Aug 2024 17:19:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from Edge12.fintech.ru (exchange.fintech.ru [195.54.195.159])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 463CE10E3D4;
 Tue,  6 Aug 2024 17:19:14 +0000 (UTC)
Received: from Ex16-01.fintech.ru (10.0.10.18) by exchange.fintech.ru
 (195.54.195.169) with Microsoft SMTP Server (TLS) id 14.3.498.0; Tue, 6 Aug
 2024 20:19:11 +0300
Received: from localhost (10.0.253.138) by Ex16-01.fintech.ru (10.0.10.18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Tue, 6 Aug 2024
 20:19:10 +0300
From: Nikita Zhandarovich <n.zhandarovich@fintech.ru>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, Xinhui Pan
 <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>, Daniel Vetter
 <daniel@ffwll.ch>
CC: Nikita Zhandarovich <n.zhandarovich@fintech.ru>, Jerome Glisse
 <jglisse@redhat.com>, Dave Airlie <airlied@redhat.com>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <lvc-project@linuxtesting.org>
Subject: [PATCH v2] drm/radeon/evergreen_cs: fix int overflow errors in cs
 track offsets
Date: Tue, 6 Aug 2024 10:19:04 -0700
Message-ID: <20240806171904.49032-1-n.zhandarovich@fintech.ru>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.0.253.138]
X-ClientProxiedBy: Ex16-02.fintech.ru (10.0.10.19) To Ex16-01.fintech.ru
 (10.0.10.18)
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

Several cs track offsets (such as 'track->db_s_read_offset')
either are initialized with or plainly take big enough values that,
once shifted 8 bits left, may be hit with integer overflow if the
resulting values end up going over u32 limit.

Same goes for a few instances of 'surf.layer_size * mslice'
multiplications that are added to 'offset' variable - they may
potentially overflow as well and need to be validated properly.

While some debug prints in this code section take possible overflow
issues into account, simply casting to (unsigned long) may be
erroneous in its own way, as depending on CPU architecture one is
liable to get different results.

Fix said problems by:
 - casting 'offset' to fixed u64 data type instead of
 ambiguous unsigned long.
 - casting one of the operands in vulnerable to integer
 overflow cases to u64.
 - adjust format specifiers in debug prints to properly
 represent 'offset' values.

Found by Linux Verification Center (linuxtesting.org) with static
analysis tool SVACE.

Fixes: 285484e2d55e ("drm/radeon: add support for evergreen/ni tiling informations v11")
Signed-off-by: Nikita Zhandarovich <n.zhandarovich@fintech.ru>
---
v2:
- change data type to cast from unsigned long to u64 per Alex's and
Christian's suggestion:
https://lore.kernel.org/all/CADnq5_NaMr+vpqwqhsMoSeGrto2Lw5v0KXWEp2HRK=++orScMg@mail.gmail.com/
- include validation of surf.layer_size * mslice per Christian's
approval:
https://lore.kernel.org/all/1914cfcb-9700-4274-8120-9746e241cb54@amd.com/
- change format specifiers when printing 'offset' value.
- fix commit description to reflect patch changes.

v1:
https://lore.kernel.org/all/20240725180950.15820-1-n.zhandarovich@fintech.ru/

 drivers/gpu/drm/radeon/evergreen_cs.c | 62 +++++++++++++++++------------------
 1 file changed, 31 insertions(+), 31 deletions(-)

diff --git a/drivers/gpu/drm/radeon/evergreen_cs.c b/drivers/gpu/drm/radeon/evergreen_cs.c
index e5577d2a19ef..a46613283393 100644
--- a/drivers/gpu/drm/radeon/evergreen_cs.c
+++ b/drivers/gpu/drm/radeon/evergreen_cs.c
@@ -397,7 +397,7 @@ static int evergreen_cs_track_validate_cb(struct radeon_cs_parser *p, unsigned i
 	struct evergreen_cs_track *track = p->track;
 	struct eg_surface surf;
 	unsigned pitch, slice, mslice;
-	unsigned long offset;
+	u64 offset;
 	int r;
 
 	mslice = G_028C6C_SLICE_MAX(track->cb_color_view[id]) + 1;
@@ -435,14 +435,14 @@ static int evergreen_cs_track_validate_cb(struct radeon_cs_parser *p, unsigned i
 		return r;
 	}
 
-	offset = track->cb_color_bo_offset[id] << 8;
+	offset = (u64)track->cb_color_bo_offset[id] << 8;
 	if (offset & (surf.base_align - 1)) {
-		dev_warn(p->dev, "%s:%d cb[%d] bo base %ld not aligned with %ld\n",
+		dev_warn(p->dev, "%s:%d cb[%d] bo base %llu not aligned with %ld\n",
 			 __func__, __LINE__, id, offset, surf.base_align);
 		return -EINVAL;
 	}
 
-	offset += surf.layer_size * mslice;
+	offset += (u64)surf.layer_size * mslice;
 	if (offset > radeon_bo_size(track->cb_color_bo[id])) {
 		/* old ddx are broken they allocate bo with w*h*bpp but
 		 * program slice with ALIGN(h, 8), catch this and patch
@@ -450,14 +450,14 @@ static int evergreen_cs_track_validate_cb(struct radeon_cs_parser *p, unsigned i
 		 */
 		if (!surf.mode) {
 			uint32_t *ib = p->ib.ptr;
-			unsigned long tmp, nby, bsize, size, min = 0;
+			u64 tmp, nby, bsize, size, min = 0;
 
 			/* find the height the ddx wants */
 			if (surf.nby > 8) {
 				min = surf.nby - 8;
 			}
 			bsize = radeon_bo_size(track->cb_color_bo[id]);
-			tmp = track->cb_color_bo_offset[id] << 8;
+			tmp = (u64)track->cb_color_bo_offset[id] << 8;
 			for (nby = surf.nby; nby > min; nby--) {
 				size = nby * surf.nbx * surf.bpe * surf.nsamples;
 				if ((tmp + size * mslice) <= bsize) {
@@ -469,7 +469,7 @@ static int evergreen_cs_track_validate_cb(struct radeon_cs_parser *p, unsigned i
 				slice = ((nby * surf.nbx) / 64) - 1;
 				if (!evergreen_surface_check(p, &surf, "cb")) {
 					/* check if this one works */
-					tmp += surf.layer_size * mslice;
+					tmp += (u64)surf.layer_size * mslice;
 					if (tmp <= bsize) {
 						ib[track->cb_color_slice_idx[id]] = slice;
 						goto old_ddx_ok;
@@ -478,9 +478,9 @@ static int evergreen_cs_track_validate_cb(struct radeon_cs_parser *p, unsigned i
 			}
 		}
 		dev_warn(p->dev, "%s:%d cb[%d] bo too small (layer size %d, "
-			 "offset %d, max layer %d, bo size %ld, slice %d)\n",
+			 "offset %llu, max layer %d, bo size %ld, slice %d)\n",
 			 __func__, __LINE__, id, surf.layer_size,
-			track->cb_color_bo_offset[id] << 8, mslice,
+			(u64)track->cb_color_bo_offset[id] << 8, mslice,
 			radeon_bo_size(track->cb_color_bo[id]), slice);
 		dev_warn(p->dev, "%s:%d problematic surf: (%d %d) (%d %d %d %d %d %d %d)\n",
 			 __func__, __LINE__, surf.nbx, surf.nby,
@@ -564,7 +564,7 @@ static int evergreen_cs_track_validate_stencil(struct radeon_cs_parser *p)
 	struct evergreen_cs_track *track = p->track;
 	struct eg_surface surf;
 	unsigned pitch, slice, mslice;
-	unsigned long offset;
+	u64 offset;
 	int r;
 
 	mslice = G_028008_SLICE_MAX(track->db_depth_view) + 1;
@@ -610,18 +610,18 @@ static int evergreen_cs_track_validate_stencil(struct radeon_cs_parser *p)
 		return r;
 	}
 
-	offset = track->db_s_read_offset << 8;
+	offset = (u64)track->db_s_read_offset << 8;
 	if (offset & (surf.base_align - 1)) {
-		dev_warn(p->dev, "%s:%d stencil read bo base %ld not aligned with %ld\n",
+		dev_warn(p->dev, "%s:%d stencil read bo base %llu not aligned with %ld\n",
 			 __func__, __LINE__, offset, surf.base_align);
 		return -EINVAL;
 	}
-	offset += surf.layer_size * mslice;
+	offset += (u64)surf.layer_size * mslice;
 	if (offset > radeon_bo_size(track->db_s_read_bo)) {
 		dev_warn(p->dev, "%s:%d stencil read bo too small (layer size %d, "
-			 "offset %ld, max layer %d, bo size %ld)\n",
+			 "offset %llu, max layer %d, bo size %ld)\n",
 			 __func__, __LINE__, surf.layer_size,
-			(unsigned long)track->db_s_read_offset << 8, mslice,
+			(u64)track->db_s_read_offset << 8, mslice,
 			radeon_bo_size(track->db_s_read_bo));
 		dev_warn(p->dev, "%s:%d stencil invalid (0x%08x 0x%08x 0x%08x 0x%08x)\n",
 			 __func__, __LINE__, track->db_depth_size,
@@ -629,18 +629,18 @@ static int evergreen_cs_track_validate_stencil(struct radeon_cs_parser *p)
 		return -EINVAL;
 	}
 
-	offset = track->db_s_write_offset << 8;
+	offset = (u64)track->db_s_write_offset << 8;
 	if (offset & (surf.base_align - 1)) {
-		dev_warn(p->dev, "%s:%d stencil write bo base %ld not aligned with %ld\n",
+		dev_warn(p->dev, "%s:%d stencil write bo base %llu not aligned with %ld\n",
 			 __func__, __LINE__, offset, surf.base_align);
 		return -EINVAL;
 	}
-	offset += surf.layer_size * mslice;
+	offset += (u64)surf.layer_size * mslice;
 	if (offset > radeon_bo_size(track->db_s_write_bo)) {
 		dev_warn(p->dev, "%s:%d stencil write bo too small (layer size %d, "
-			 "offset %ld, max layer %d, bo size %ld)\n",
+			 "offset %llu, max layer %d, bo size %ld)\n",
 			 __func__, __LINE__, surf.layer_size,
-			(unsigned long)track->db_s_write_offset << 8, mslice,
+			(u64)track->db_s_write_offset << 8, mslice,
 			radeon_bo_size(track->db_s_write_bo));
 		return -EINVAL;
 	}
@@ -661,7 +661,7 @@ static int evergreen_cs_track_validate_depth(struct radeon_cs_parser *p)
 	struct evergreen_cs_track *track = p->track;
 	struct eg_surface surf;
 	unsigned pitch, slice, mslice;
-	unsigned long offset;
+	u64 offset;
 	int r;
 
 	mslice = G_028008_SLICE_MAX(track->db_depth_view) + 1;
@@ -708,34 +708,34 @@ static int evergreen_cs_track_validate_depth(struct radeon_cs_parser *p)
 		return r;
 	}
 
-	offset = track->db_z_read_offset << 8;
+	offset = (u64)track->db_z_read_offset << 8;
 	if (offset & (surf.base_align - 1)) {
-		dev_warn(p->dev, "%s:%d stencil read bo base %ld not aligned with %ld\n",
+		dev_warn(p->dev, "%s:%d stencil read bo base %llu not aligned with %ld\n",
 			 __func__, __LINE__, offset, surf.base_align);
 		return -EINVAL;
 	}
-	offset += surf.layer_size * mslice;
+	offset += (u64)surf.layer_size * mslice;
 	if (offset > radeon_bo_size(track->db_z_read_bo)) {
 		dev_warn(p->dev, "%s:%d depth read bo too small (layer size %d, "
-			 "offset %ld, max layer %d, bo size %ld)\n",
+			 "offset %llu, max layer %d, bo size %ld)\n",
 			 __func__, __LINE__, surf.layer_size,
-			(unsigned long)track->db_z_read_offset << 8, mslice,
+			(u64)track->db_z_read_offset << 8, mslice,
 			radeon_bo_size(track->db_z_read_bo));
 		return -EINVAL;
 	}
 
-	offset = track->db_z_write_offset << 8;
+	offset = (u64)track->db_z_write_offset << 8;
 	if (offset & (surf.base_align - 1)) {
-		dev_warn(p->dev, "%s:%d stencil write bo base %ld not aligned with %ld\n",
+		dev_warn(p->dev, "%s:%d stencil write bo base %llu not aligned with %ld\n",
 			 __func__, __LINE__, offset, surf.base_align);
 		return -EINVAL;
 	}
-	offset += surf.layer_size * mslice;
+	offset += (u64)surf.layer_size * mslice;
 	if (offset > radeon_bo_size(track->db_z_write_bo)) {
 		dev_warn(p->dev, "%s:%d depth write bo too small (layer size %d, "
-			 "offset %ld, max layer %d, bo size %ld)\n",
+			 "offset %llu, max layer %d, bo size %ld)\n",
 			 __func__, __LINE__, surf.layer_size,
-			(unsigned long)track->db_z_write_offset << 8, mslice,
+			(u64)track->db_z_write_offset << 8, mslice,
 			radeon_bo_size(track->db_z_write_bo));
 		return -EINVAL;
 	}
