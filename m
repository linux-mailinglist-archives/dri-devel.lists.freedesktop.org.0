Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD08325DF61
	for <lists+dri-devel@lfdr.de>; Fri,  4 Sep 2020 18:07:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66CB66EC93;
	Fri,  4 Sep 2020 16:07:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB0F46EC90
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Sep 2020 16:07:20 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id z4so7278430wrr.4
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Sep 2020 09:07:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=basnieuwenhuizen-nl.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=elifejHGg4wfG/3YmmPVfZee7mPeer9yRxxl5qpXFLo=;
 b=eI6CGnhKnoHNLuaGuUrDXv3/8RLYaQBrDxQsCrhz1OeVHLe4vanXqGux2sQPiU3dIl
 c/fj5Qlt1LUkisNRhcNJD5kbsQcTmy7R2GwtFDezxilVyP9fghgNPKusWs1I/umLpqbs
 v/F49L323WqoJOEPOOHJmY+6A74aUCw9mRWCsUohoeIIQ/L/nAHVo8XK3lDbtat7/PJR
 /MCODukXDySSpe5HUKauNDgTcnDVsne0aHDPHxfh6TA3mj4OajRXlzduUR2FrZAasE+s
 EUx+xdiV6Wdb8zjIpp+SzRHuNObBwoGALQw1ogcFCg5KzoomddyF1u8gVaJe1MAOdOus
 RnXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=elifejHGg4wfG/3YmmPVfZee7mPeer9yRxxl5qpXFLo=;
 b=I14T+Ve5ZWYA/euPSJFJhPYhRXUo+hUqOc84F5y78Icc+l2nqRwF2uQJ+ErYj/GNZG
 EUA6iBZorNsr4DkgDGybNYJCP21pswhHquQxA+hDK9TQCycRi3szf1hQqueSxCvxraNT
 tYULA7CAjtH96oMn/Hm2lTc7ieVK4h/L/iTIZTK++uVIc9oqkdCN85o5AqgWayF1BP/J
 HOyHqKpKbLcCZQBvS9Wj7//YLden15HWZXSWsjGtbTLU5bCvqOA9vbf9hz60zMYOrpMg
 ujUP2ZYDE+QBZtlAJfdcDE1RBGiA8YEGRDfbZRu/LBORNb23lgECt8kja7/q4zTrASUX
 nabA==
X-Gm-Message-State: AOAM531hA1Zwfcq++9Uc1I6qm0XP3hikZ+ruoXgJ8u2D+CNwQH+FOzLB
 45CV+U2AiCzOL4EyF/FLW5NXGw==
X-Google-Smtp-Source: ABdhPJzFhE0gc8NudwRMGOBbDHvLJIf9dQga3cS5BFG/odhwqTHEbfnS9zfDFmMjOPCoBbV3J6msJg==
X-Received: by 2002:adf:ec0a:: with SMTP id x10mr8016277wrn.47.1599235639414; 
 Fri, 04 Sep 2020 09:07:19 -0700 (PDT)
Received: from localhost.localdomain
 ([2a02:aa12:a77f:2000:4cea:81e7:5fd4:93f7])
 by smtp.gmail.com with ESMTPSA id h185sm12467609wme.25.2020.09.04.09.07.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Sep 2020 09:07:18 -0700 (PDT)
From: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH v2 10/11] drm/amd/display: Expose modifiers.
Date: Fri,  4 Sep 2020 18:07:08 +0200
Message-Id: <20200904160709.123970-11-bas@basnieuwenhuizen.nl>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200904160709.123970-1-bas@basnieuwenhuizen.nl>
References: <20200904160709.123970-1-bas@basnieuwenhuizen.nl>
MIME-Version: 1.0
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
Cc: maraeo@gmail.com, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This expose modifier support on GFX9+.

Only modifiers that can be rendered on the current GPU are
added. This is to reduce the number of modifiers exposed.

The HW could expose more, but the best mechanism to decide
what to expose without an explosion in modifiers is still
to be decided, and in the meantime this should not regress
things from pre-modifiers and does not risk regressions as
we make up our mind in the future.

v2:
  - Added comment that D on Raven is only valid for 64bpp
    and will be filtered based on format later.
  - Removed D tiling modes that weren't useful for 64bpp
    on GFX10+.

Signed-off-by: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 338 +++++++++++++++++-
 1 file changed, 337 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index ceb92a0dccdc..25b1c7c821d2 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -3978,6 +3978,335 @@ fill_gfx9_tiling_info_from_modifier(const struct amdgpu_device *adev,
 	}
 }
 
+enum dm_micro_swizzle {
+	MICRO_SWIZZLE_Z = 0,
+	MICRO_SWIZZLE_S = 1,
+	MICRO_SWIZZLE_D = 2,
+	MICRO_SWIZZLE_R = 3
+};
+
+static bool dm_plane_format_mod_supported(struct drm_plane *plane,
+					  uint32_t format,
+					  uint64_t modifier)
+{
+	struct amdgpu_device *adev = drm_to_adev(plane->dev);
+	const struct drm_format_info *info = drm_format_info(format);
+
+	enum dm_micro_swizzle microtile = modifier_gfx9_swizzle_mode(modifier) & 3;
+
+	if (!info)
+		return false;
+
+	/*
+	 * We always have to allow this modifier, because core DRM still
+	 * checks LINEAR support if userspace does not provide modifers.
+	 */
+	if (modifier == DRM_FORMAT_MOD_LINEAR)
+		return true;
+
+	/*
+	 * The arbitrary tiling support for multiplane formats has not been hooked
+	 * up.
+	 */
+	if (info->num_planes > 1)
+		return false;
+
+	/*
+	 * For D swizzle the canonical modifier depends on the bpp, so check
+	 * it here.
+	 */
+	if (AMD_FMT_MOD_GET(TILE_VERSION, modifier) == AMD_FMT_MOD_TILE_VER_GFX9 &&
+	    adev->family >= AMDGPU_FAMILY_NV) {
+		if (microtile == MICRO_SWIZZLE_D && info->cpp[0] == 4)
+			return false;
+	}
+
+	if (adev->family >= AMDGPU_FAMILY_RV && microtile == MICRO_SWIZZLE_D &&
+	    info->cpp[0] < 8)
+		return false;
+
+	if (modifier_has_dcc(modifier)) {
+		/* Per radeonsi comments 16/64 bpp are more complicated. */
+		if (info->cpp[0] != 4)
+			return false;
+	}
+
+	return true;
+}
+
+static void
+add_modifier(uint64_t **mods, uint64_t *size, uint64_t *cap, uint64_t mod)
+{
+	if (!*mods)
+		return;
+
+	if (*cap - *size < 1) {
+		uint64_t new_cap = *cap * 2;
+		uint64_t *new_mods = kmalloc(new_cap * sizeof(uint64_t), GFP_KERNEL);
+
+		if (!new_mods) {
+			kfree(*mods);
+			*mods = NULL;
+			return;
+		}
+
+		memcpy(new_mods, *mods, sizeof(uint64_t) * *size);
+		kfree(*mods);
+		*mods = new_mods;
+		*cap = new_cap;
+	}
+
+	(*mods)[*size] = mod;
+	*size += 1;
+}
+
+static void
+add_gfx9_modifiers(const struct amdgpu_device *adev,
+		   uint64_t **mods, uint64_t *size, uint64_t *capacity)
+{
+	int pipes = ilog2(adev->gfx.config.gb_addr_config_fields.num_pipes);
+	int pipe_xor_bits = min(8, pipes +
+				ilog2(adev->gfx.config.gb_addr_config_fields.num_se));
+	int bank_xor_bits = min(8 - pipe_xor_bits,
+				ilog2(adev->gfx.config.gb_addr_config_fields.num_banks));
+	int rb = ilog2(adev->gfx.config.gb_addr_config_fields.num_se) +
+		 ilog2(adev->gfx.config.gb_addr_config_fields.num_rb_per_se);
+
+
+	if (adev->family == AMDGPU_FAMILY_RV) {
+		/* Raven2 and later */
+		bool has_constant_encode = adev->asic_type > CHIP_RAVEN || adev->external_rev_id >= 0x81;
+
+		/*
+		 * No _D DCC swizzles yet because we only allow 32bpp, which
+		 * doesn't support _D on DCN
+		 */
+
+		if (has_constant_encode) {
+			add_modifier(mods, size, capacity, AMD_FMT_MOD |
+				    AMD_FMT_MOD_SET(TILE, AMD_FMT_MOD_TILE_GFX9_64K_S_X) |
+				    AMD_FMT_MOD_SET(TILE_VERSION, AMD_FMT_MOD_TILE_VER_GFX9) |
+				    AMD_FMT_MOD_SET(PIPE_XOR_BITS, pipe_xor_bits) |
+				    AMD_FMT_MOD_SET(BANK_XOR_BITS, bank_xor_bits) |
+				    AMD_FMT_MOD_SET(DCC, 1) |
+				    AMD_FMT_MOD_SET(DCC_INDEPENDENT_64B, 1) |
+				    AMD_FMT_MOD_SET(DCC_MAX_COMPRESSED_BLOCK, AMD_FMT_MOD_DCC_BLOCK_64B) |
+				    AMD_FMT_MOD_SET(DCC_CONSTANT_ENCODE, 1));
+		}
+
+		add_modifier(mods, size, capacity, AMD_FMT_MOD |
+			    AMD_FMT_MOD_SET(TILE, AMD_FMT_MOD_TILE_GFX9_64K_S_X) |
+			    AMD_FMT_MOD_SET(TILE_VERSION, AMD_FMT_MOD_TILE_VER_GFX9) |
+			    AMD_FMT_MOD_SET(PIPE_XOR_BITS, pipe_xor_bits) |
+			    AMD_FMT_MOD_SET(BANK_XOR_BITS, bank_xor_bits) |
+			    AMD_FMT_MOD_SET(DCC, 1) |
+			    AMD_FMT_MOD_SET(DCC_INDEPENDENT_64B, 1) |
+			    AMD_FMT_MOD_SET(DCC_MAX_COMPRESSED_BLOCK, AMD_FMT_MOD_DCC_BLOCK_64B) |
+			    AMD_FMT_MOD_SET(DCC_CONSTANT_ENCODE, 0));
+
+		if (has_constant_encode) {
+			add_modifier(mods, size, capacity, AMD_FMT_MOD |
+				    AMD_FMT_MOD_SET(TILE, AMD_FMT_MOD_TILE_GFX9_64K_S_X) |
+				    AMD_FMT_MOD_SET(TILE_VERSION, AMD_FMT_MOD_TILE_VER_GFX9) |
+				    AMD_FMT_MOD_SET(PIPE_XOR_BITS, pipe_xor_bits) |
+				    AMD_FMT_MOD_SET(BANK_XOR_BITS, bank_xor_bits) |
+				    AMD_FMT_MOD_SET(DCC, 1) |
+				    AMD_FMT_MOD_SET(DCC_RETILE, 1) |
+				    AMD_FMT_MOD_SET(DCC_INDEPENDENT_64B, 1) |
+				    AMD_FMT_MOD_SET(DCC_MAX_COMPRESSED_BLOCK, AMD_FMT_MOD_DCC_BLOCK_64B) |
+
+				    AMD_FMT_MOD_SET(DCC_CONSTANT_ENCODE, 1) |
+				    AMD_FMT_MOD_SET(RB, rb) |
+				    AMD_FMT_MOD_SET(PIPE, pipes));
+		}
+
+		add_modifier(mods, size, capacity, AMD_FMT_MOD |
+			    AMD_FMT_MOD_SET(TILE, AMD_FMT_MOD_TILE_GFX9_64K_S_X) |
+			    AMD_FMT_MOD_SET(TILE_VERSION, AMD_FMT_MOD_TILE_VER_GFX9) |
+			    AMD_FMT_MOD_SET(PIPE_XOR_BITS, pipe_xor_bits) |
+			    AMD_FMT_MOD_SET(BANK_XOR_BITS, bank_xor_bits) |
+			    AMD_FMT_MOD_SET(DCC, 1) |
+			    AMD_FMT_MOD_SET(DCC_RETILE, 1) |
+			    AMD_FMT_MOD_SET(DCC_INDEPENDENT_64B, 1) |
+			    AMD_FMT_MOD_SET(DCC_MAX_COMPRESSED_BLOCK, AMD_FMT_MOD_DCC_BLOCK_64B) |
+			    AMD_FMT_MOD_SET(DCC_CONSTANT_ENCODE, 0) |
+			    AMD_FMT_MOD_SET(RB, rb) |
+			    AMD_FMT_MOD_SET(PIPE, pipes));
+	}
+
+	/*
+	 * Only supported for 64bpp on Raven, will be filtered on format in
+	 * dm_plane_format_mod_supported.
+	 */
+	add_modifier(mods, size, capacity, AMD_FMT_MOD |
+		    AMD_FMT_MOD_SET(TILE, AMD_FMT_MOD_TILE_GFX9_64K_D_X) |
+		    AMD_FMT_MOD_SET(TILE_VERSION, AMD_FMT_MOD_TILE_VER_GFX9) |
+		    AMD_FMT_MOD_SET(PIPE_XOR_BITS, pipe_xor_bits) |
+		    AMD_FMT_MOD_SET(BANK_XOR_BITS, bank_xor_bits));
+
+	if (adev->family == AMDGPU_FAMILY_RV) {
+		add_modifier(mods, size, capacity, AMD_FMT_MOD |
+			    AMD_FMT_MOD_SET(TILE, AMD_FMT_MOD_TILE_GFX9_64K_S_X) |
+			    AMD_FMT_MOD_SET(TILE_VERSION, AMD_FMT_MOD_TILE_VER_GFX9) |
+			    AMD_FMT_MOD_SET(PIPE_XOR_BITS, pipe_xor_bits) |
+			    AMD_FMT_MOD_SET(BANK_XOR_BITS, bank_xor_bits));
+	}
+
+	/*
+	 * Only supported for 64bpp on Raven, will be filtered on format in
+	 * dm_plane_format_mod_supported.
+	 */
+	add_modifier(mods, size, capacity, AMD_FMT_MOD |
+		    AMD_FMT_MOD_SET(TILE, AMD_FMT_MOD_TILE_GFX9_64K_D) |
+		    AMD_FMT_MOD_SET(TILE_VERSION, AMD_FMT_MOD_TILE_VER_GFX9));
+
+	if (adev->family == AMDGPU_FAMILY_RV) {
+		add_modifier(mods, size, capacity, AMD_FMT_MOD |
+			    AMD_FMT_MOD_SET(TILE, AMD_FMT_MOD_TILE_GFX9_64K_S) |
+			    AMD_FMT_MOD_SET(TILE_VERSION, AMD_FMT_MOD_TILE_VER_GFX9));
+	}
+}
+
+static void
+add_gfx10_1_modifiers(const struct amdgpu_device *adev,
+		      uint64_t **mods, uint64_t *size, uint64_t *capacity)
+{
+	int pipe_xor_bits = ilog2(adev->gfx.config.gb_addr_config_fields.num_pipes);
+
+	add_modifier(mods, size, capacity, AMD_FMT_MOD |
+		    AMD_FMT_MOD_SET(TILE, AMD_FMT_MOD_TILE_GFX9_64K_R_X) |
+		    AMD_FMT_MOD_SET(TILE_VERSION, AMD_FMT_MOD_TILE_VER_GFX10) |
+		    AMD_FMT_MOD_SET(PIPE_XOR_BITS, pipe_xor_bits) |
+		    AMD_FMT_MOD_SET(DCC, 1) |
+		    AMD_FMT_MOD_SET(DCC_CONSTANT_ENCODE, 1) |
+		    AMD_FMT_MOD_SET(DCC_INDEPENDENT_64B, 1) |
+		    AMD_FMT_MOD_SET(DCC_MAX_COMPRESSED_BLOCK, AMD_FMT_MOD_DCC_BLOCK_64B));
+
+	add_modifier(mods, size, capacity, AMD_FMT_MOD |
+		    AMD_FMT_MOD_SET(TILE, AMD_FMT_MOD_TILE_GFX9_64K_R_X) |
+		    AMD_FMT_MOD_SET(TILE_VERSION, AMD_FMT_MOD_TILE_VER_GFX10) |
+		    AMD_FMT_MOD_SET(PIPE_XOR_BITS, pipe_xor_bits) |
+		    AMD_FMT_MOD_SET(DCC, 1) |
+		    AMD_FMT_MOD_SET(DCC_RETILE, 1) |
+		    AMD_FMT_MOD_SET(DCC_CONSTANT_ENCODE, 1) |
+		    AMD_FMT_MOD_SET(DCC_INDEPENDENT_64B, 1) |
+		    AMD_FMT_MOD_SET(DCC_MAX_COMPRESSED_BLOCK, AMD_FMT_MOD_DCC_BLOCK_64B));
+
+	add_modifier(mods, size, capacity, AMD_FMT_MOD |
+		    AMD_FMT_MOD_SET(TILE, AMD_FMT_MOD_TILE_GFX9_64K_R_X) |
+		    AMD_FMT_MOD_SET(TILE_VERSION, AMD_FMT_MOD_TILE_VER_GFX10) |
+		    AMD_FMT_MOD_SET(PIPE_XOR_BITS, pipe_xor_bits));
+
+	add_modifier(mods, size, capacity, AMD_FMT_MOD |
+		    AMD_FMT_MOD_SET(TILE, AMD_FMT_MOD_TILE_GFX9_64K_S_X) |
+		    AMD_FMT_MOD_SET(TILE_VERSION, AMD_FMT_MOD_TILE_VER_GFX10) |
+		    AMD_FMT_MOD_SET(PIPE_XOR_BITS, pipe_xor_bits));
+
+
+	/* Only supported for 64bpp, will be filtered in dm_plane_format_mod_supported */
+	add_modifier(mods, size, capacity, AMD_FMT_MOD |
+		    AMD_FMT_MOD_SET(TILE, AMD_FMT_MOD_TILE_GFX9_64K_D) |
+		    AMD_FMT_MOD_SET(TILE_VERSION, AMD_FMT_MOD_TILE_VER_GFX9));
+
+	add_modifier(mods, size, capacity, AMD_FMT_MOD |
+		    AMD_FMT_MOD_SET(TILE, AMD_FMT_MOD_TILE_GFX9_64K_S) |
+		    AMD_FMT_MOD_SET(TILE_VERSION, AMD_FMT_MOD_TILE_VER_GFX9));
+}
+
+static void
+add_gfx10_3_modifiers(const struct amdgpu_device *adev,
+		      uint64_t **mods, uint64_t *size, uint64_t *capacity)
+{
+	int pipe_xor_bits = ilog2(adev->gfx.config.gb_addr_config_fields.num_pipes);
+	int pkrs = ilog2(adev->gfx.config.gb_addr_config_fields.num_pkrs);
+
+	add_modifier(mods, size, capacity, AMD_FMT_MOD |
+		    AMD_FMT_MOD_SET(TILE, AMD_FMT_MOD_TILE_GFX9_64K_R_X) |
+		    AMD_FMT_MOD_SET(TILE_VERSION, AMD_FMT_MOD_TILE_VER_GFX10_RBPLUS) |
+		    AMD_FMT_MOD_SET(PIPE_XOR_BITS, pipe_xor_bits) |
+		    AMD_FMT_MOD_SET(PACKERS, pkrs) |
+		    AMD_FMT_MOD_SET(DCC, 1) |
+		    AMD_FMT_MOD_SET(DCC_CONSTANT_ENCODE, 1) |
+		    AMD_FMT_MOD_SET(DCC_INDEPENDENT_64B, 1) |
+		    AMD_FMT_MOD_SET(DCC_INDEPENDENT_128B, 1) |
+		    AMD_FMT_MOD_SET(DCC_MAX_COMPRESSED_BLOCK, AMD_FMT_MOD_DCC_BLOCK_128B));
+
+	add_modifier(mods, size, capacity, AMD_FMT_MOD |
+		    AMD_FMT_MOD_SET(TILE, AMD_FMT_MOD_TILE_GFX9_64K_R_X) |
+		    AMD_FMT_MOD_SET(TILE_VERSION, AMD_FMT_MOD_TILE_VER_GFX10_RBPLUS) |
+		    AMD_FMT_MOD_SET(PIPE_XOR_BITS, pipe_xor_bits) |
+		    AMD_FMT_MOD_SET(PACKERS, pkrs) |
+		    AMD_FMT_MOD_SET(DCC, 1) |
+		    AMD_FMT_MOD_SET(DCC_RETILE, 1) |
+		    AMD_FMT_MOD_SET(DCC_CONSTANT_ENCODE, 1) |
+		    AMD_FMT_MOD_SET(DCC_INDEPENDENT_64B, 1) |
+		    AMD_FMT_MOD_SET(DCC_INDEPENDENT_128B, 1) |
+		    AMD_FMT_MOD_SET(DCC_MAX_COMPRESSED_BLOCK, AMD_FMT_MOD_DCC_BLOCK_128B));
+
+	add_modifier(mods, size, capacity, AMD_FMT_MOD |
+		    AMD_FMT_MOD_SET(TILE, AMD_FMT_MOD_TILE_GFX9_64K_R_X) |
+		    AMD_FMT_MOD_SET(TILE_VERSION, AMD_FMT_MOD_TILE_VER_GFX10_RBPLUS) |
+		    AMD_FMT_MOD_SET(PIPE_XOR_BITS, pipe_xor_bits) |
+		    AMD_FMT_MOD_SET(PACKERS, pkrs));
+
+	add_modifier(mods, size, capacity, AMD_FMT_MOD |
+		    AMD_FMT_MOD_SET(TILE, AMD_FMT_MOD_TILE_GFX9_64K_S_X) |
+		    AMD_FMT_MOD_SET(TILE_VERSION, AMD_FMT_MOD_TILE_VER_GFX10_RBPLUS) |
+		    AMD_FMT_MOD_SET(PIPE_XOR_BITS, pipe_xor_bits) |
+		    AMD_FMT_MOD_SET(PACKERS, pkrs));
+
+	/* Only supported for 64bpp, will be filtered in dm_plane_format_mod_supported */
+	add_modifier(mods, size, capacity, AMD_FMT_MOD |
+		    AMD_FMT_MOD_SET(TILE, AMD_FMT_MOD_TILE_GFX9_64K_D) |
+		    AMD_FMT_MOD_SET(TILE_VERSION, AMD_FMT_MOD_TILE_VER_GFX9));
+
+	add_modifier(mods, size, capacity, AMD_FMT_MOD |
+		    AMD_FMT_MOD_SET(TILE, AMD_FMT_MOD_TILE_GFX9_64K_S) |
+		    AMD_FMT_MOD_SET(TILE_VERSION, AMD_FMT_MOD_TILE_VER_GFX9));
+}
+
+static int
+get_plane_modifiers(const struct amdgpu_device *adev, unsigned int plane_type, uint64_t **mods)
+{
+	uint64_t size = 0, capacity = 128;
+	*mods = NULL;
+
+	/* We have not hooked up any pre-GFX9 modifiers. */
+	if (adev->family < AMDGPU_FAMILY_AI)
+		return 0;
+
+	*mods = kmalloc(capacity * sizeof(uint64_t), GFP_KERNEL);
+
+	if (plane_type == DRM_PLANE_TYPE_CURSOR) {
+		add_modifier(mods, &size, &capacity, DRM_FORMAT_MOD_LINEAR);
+		add_modifier(mods, &size, &capacity, DRM_FORMAT_MOD_INVALID);
+		return *mods ? 0 : -ENOMEM;
+	}
+
+	switch (adev->family) {
+	case AMDGPU_FAMILY_AI:
+	case AMDGPU_FAMILY_RV:
+		add_gfx9_modifiers(adev, mods, &size, &capacity);
+		break;
+	case AMDGPU_FAMILY_NV:
+		if (adev->asic_type >= CHIP_SIENNA_CICHLID)
+			add_gfx10_3_modifiers(adev, mods, &size, &capacity);
+		else
+			add_gfx10_1_modifiers(adev, mods, &size, &capacity);
+		break;
+	}
+
+	add_modifier(mods, &size, &capacity, DRM_FORMAT_MOD_LINEAR);
+
+	/* INVALID marks the end of the list. */
+	add_modifier(mods, &size, &capacity, DRM_FORMAT_MOD_INVALID);
+
+	if (!*mods)
+		return -ENOMEM;
+
+	return 0;
+}
+
 static int
 fill_gfx9_plane_attributes_from_modifiers(struct amdgpu_device *adev,
 					  const struct amdgpu_framebuffer *afb,
@@ -5954,6 +6283,7 @@ static const struct drm_plane_funcs dm_plane_funcs = {
 	.reset = dm_drm_plane_reset,
 	.atomic_duplicate_state = dm_drm_plane_duplicate_state,
 	.atomic_destroy_state = dm_drm_plane_destroy_state,
+	.format_mod_supported = dm_plane_format_mod_supported,
 };
 
 static int dm_plane_helper_prepare_fb(struct drm_plane *plane,
@@ -6246,13 +6576,19 @@ static int amdgpu_dm_plane_init(struct amdgpu_display_manager *dm,
 	int num_formats;
 	int res = -EPERM;
 	unsigned int supported_rotations;
+	uint64_t *modifiers = NULL;
 
 	num_formats = get_plane_formats(plane, plane_cap, formats,
 					ARRAY_SIZE(formats));
 
+	res = get_plane_modifiers(dm->adev, plane->type, &modifiers);
+	if (res)
+		return res;
+
 	res = drm_universal_plane_init(adev_to_drm(dm->adev), plane, possible_crtcs,
 				       &dm_plane_funcs, formats, num_formats,
-				       NULL, plane->type, NULL);
+				       modifiers, plane->type, NULL);
+	kfree(modifiers);
 	if (res)
 		return res;
 
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
