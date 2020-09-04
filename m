Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2CE925DF62
	for <lists+dri-devel@lfdr.de>; Fri,  4 Sep 2020 18:07:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C4996EC95;
	Fri,  4 Sep 2020 16:07:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B586B6EC90
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Sep 2020 16:07:21 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id o5so7219331wrn.13
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Sep 2020 09:07:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=basnieuwenhuizen-nl.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=J9ot4dVg+gmoEa6EnvAB4TB3j6uAys0SZkmM4BqciWs=;
 b=aGwk9ziegtBcMDkovWv0SYipppmLXqIFf1itGfMILRNsVtCyHF9cYXk7s9tnZPbGxA
 spjGgM3JU23qYLgW1ME3hKpUOZ0+lH3Q8UekcsHvqJy91TU9qjacUQatHyDdv19hQFSL
 jzJ40zsMrkwyg/9aP+/XhcBRDkOVxbJIA4PUVzbY1vsL9qKdk35iZ59c+C9C+HhzbhIG
 crZyVxwtIIA4e+X0KROB1xOTF4QBj89ysDA41X3bp6u2L4YBG+ITzhTJ5bn5si4l9EPI
 /uvd3lfjLSU2omwH9pNLyYWvjgnfUHHhTShuas0ISB83+ZZ35gp/e/zCuyyDLzI3NnUI
 +oAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=J9ot4dVg+gmoEa6EnvAB4TB3j6uAys0SZkmM4BqciWs=;
 b=fRmFZw7soX2xAQI/xVHWGyGmWm7Z0kT7L9BRUx1v7xw0DR1eXIB+zLLrGJ5H8OPmVQ
 Oe1FJrO2ZTjDidO9wm2hvPgKLTn17dAfhDejiIoUzkG8BYpHHK9Km/ceQ4xLboUV4xKH
 8UhpzyMuA36n1K/RknlCZsXGYO1L3DUdKWzJxAJ2hUQrUCuTXzpoVeHy2rMmPLprIbLJ
 u62R3sigPkg8sjuBFS4ws9dAClp/9CYkQkjz/XG7/NybzZswUaFdh4p31+lXC0rglHzw
 QgVWlbP1zMM88ljZ/pIp6xAOUWJH1MTLx750J/psDkze/kGVLRxSeE7tsw9v6Jbg0NvT
 UO5g==
X-Gm-Message-State: AOAM531pw30t5VOyN4fDRTumDZJjC5WOdvI8sO1NGy9lH2rlDVhbgCZ4
 rwsC0a3ooKj7feVc8nGgRRypIS9uFsiMu65TpZQ=
X-Google-Smtp-Source: ABdhPJxqa7JHr2i8AVUDBKfvLEZk6qfyBxGf8C9rsJCMKtikBgrkOZA+RnP+UYYoMziVaT7xfd/W+g==
X-Received: by 2002:a5d:67d2:: with SMTP id n18mr8295124wrw.223.1599235640404; 
 Fri, 04 Sep 2020 09:07:20 -0700 (PDT)
Received: from localhost.localdomain
 ([2a02:aa12:a77f:2000:4cea:81e7:5fd4:93f7])
 by smtp.gmail.com with ESMTPSA id h185sm12467609wme.25.2020.09.04.09.07.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Sep 2020 09:07:19 -0700 (PDT)
From: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH v2 11/11] drm/amd/display: Clean up GFX9 tiling_flags path.
Date: Fri,  4 Sep 2020 18:07:09 +0200
Message-Id: <20200904160709.123970-12-bas@basnieuwenhuizen.nl>
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

We're unconditionally using modifiers internally for GFX9+ now.

Signed-off-by: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 74 ++-----------------
 1 file changed, 7 insertions(+), 67 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 25b1c7c821d2..f4a4ca84485a 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -3793,57 +3793,6 @@ validate_dcc(struct amdgpu_device *adev,
 	return 0;
 }
 
-static void
-fill_dcc_params_from_flags(const struct amdgpu_framebuffer *afb,
-			   struct dc_plane_dcc_param *dcc,
-			   struct dc_plane_address *address,
-			   const uint64_t flags, bool force_disable_dcc)
-{
-	uint64_t dcc_address;
-	uint64_t plane_address = afb->address + afb->base.offsets[0];
-	uint32_t offset = AMDGPU_TILING_GET(flags, DCC_OFFSET_256B);
-	uint32_t i64b = AMDGPU_TILING_GET(flags, DCC_INDEPENDENT_64B) != 0;
-
-	if (!offset || force_disable_dcc)
-		return;
-
-	dcc->enable = 1;
-	dcc->meta_pitch = AMDGPU_TILING_GET(flags, DCC_PITCH_MAX) + 1;
-	dcc->independent_64b_blks = i64b;
-
-	dcc_address = plane_address + (uint64_t)offset * 256;
-	address->grph.meta_addr.low_part = lower_32_bits(dcc_address);
-	address->grph.meta_addr.high_part = upper_32_bits(dcc_address);
-}
-
-
-static int
-fill_gfx9_plane_attributes_from_flags(struct amdgpu_device *adev,
-				      const struct amdgpu_framebuffer *afb,
-				      const enum surface_pixel_format format,
-				      const enum dc_rotation_angle rotation,
-				      const struct plane_size *plane_size,
-				      union dc_tiling_info *tiling_info,
-				      struct dc_plane_dcc_param *dcc,
-				      struct dc_plane_address *address,
-				      uint64_t tiling_flags,
-				      bool force_disable_dcc)
-{
-	int ret;
-
-	fill_gfx9_tiling_info_from_device(adev, tiling_info);
-
-	tiling_info->gfx9.swizzle =
-		AMDGPU_TILING_GET(tiling_flags, SWIZZLE_MODE);
-
-	fill_dcc_params_from_flags(afb, dcc, address, tiling_flags, force_disable_dcc);
-	ret = validate_dcc(adev, format, rotation, tiling_info, dcc, address, plane_size);
-	if (ret)
-		return ret;
-
-	return 0;
-}
-
 static bool
 modifier_has_dcc(uint64_t modifier)
 {
@@ -4410,22 +4359,13 @@ fill_plane_buffer_attributes(struct amdgpu_device *adev,
 	}
 
 	if (adev->family >= AMDGPU_FAMILY_AI) {
-		if (afb->base.flags & DRM_MODE_FB_MODIFIERS) {
-			ret = fill_gfx9_plane_attributes_from_modifiers(adev, afb, format,
-									rotation, plane_size,
-									tiling_info, dcc,
-									address,
-									force_disable_dcc);
-			if (ret)
-				return ret;
-		} else {
-			ret = fill_gfx9_plane_attributes_from_flags(adev, afb, format, rotation,
-								    plane_size, tiling_info, dcc,
-								    address, tiling_flags,
-								    force_disable_dcc);
-			if (ret)
-				return ret;
-		}
+		ret = fill_gfx9_plane_attributes_from_modifiers(adev, afb, format,
+								rotation, plane_size,
+								tiling_info, dcc,
+								address,
+								force_disable_dcc);
+		if (ret)
+			return ret;
 	} else {
 		fill_gfx8_tiling_info_from_flags(tiling_info, tiling_flags);
 	}
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
