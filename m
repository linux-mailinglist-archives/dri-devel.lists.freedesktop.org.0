Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A484B385EB
	for <lists+dri-devel@lfdr.de>; Wed, 27 Aug 2025 17:13:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 420DE10E84A;
	Wed, 27 Aug 2025 15:13:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="qUX6Ffab";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6A3610E854
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Aug 2025 15:13:10 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id A795144B26;
 Wed, 27 Aug 2025 15:13:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 386D6C4CEF0;
 Wed, 27 Aug 2025 15:13:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756307590;
 bh=6hD6UxbBlKoYZyHeGn3CyW4PVYW/AoySrOUl6AiF3ic=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=qUX6FfabGEBcUa5pVk9bIbE+C1DAS80F5Ep4T1uddeVXIfu9Q3hhlKnlLyymWC6S7
 SvVaMgVAnVdUsXSl/pb1XvbT5KzqWq5BLgq8xEV8OCZh+sPD/G5vRW9kQIasc1EQXR
 NhEbNe+dklyvGK2f5dZODbctkxRpQidX5/zhp8Rz9JvzmfNewyS+MyLMGee/9jVtw0
 jbr8M3jWGnLQr3Hyk0XMTQysegNtUTUw3bCwS2fQVYM5AbgAduoEIUuo/CWJTVJDdR
 eWkCFc7Cu2qjdXVS4lh1kDAzJt84yivd4llvd4TfYG5yF3mpJZxXZ638jQaemA8Z4X
 5cvF/skwADHjA==
From: Maxime Ripard <mripard@kernel.org>
Date: Wed, 27 Aug 2025 17:12:41 +0200
Subject: [PATCH v3 10/14] drm/tidss: dispc: Switch VID_REG_FLD_MOD to using
 a mask
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250827-drm-tidss-field-api-v3-10-7689b664cc63@kernel.org>
References: <20250827-drm-tidss-field-api-v3-0-7689b664cc63@kernel.org>
In-Reply-To: <20250827-drm-tidss-field-api-v3-0-7689b664cc63@kernel.org>
To: Jyri Sarha <jyri.sarha@iki.fi>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5234; i=mripard@kernel.org;
 h=from:subject:message-id; bh=6hD6UxbBlKoYZyHeGn3CyW4PVYW/AoySrOUl6AiF3ic=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBnrFdLn3xS4WjR9mpaZ2gq5rJ5qkxdbQvycsz18/LR+T
 p6x8cGvjqksDMKcDLJiiixPZMJOL29fXOVgv/IHzBxWJpAhDFycAjCRFk7Ghnlc81xPbn3CqbRo
 29V5jTsDg9u4feZN3S03rWzNwcIdffV9XwsrYvq5k76x5r9K2fM5hbHhMW9Og6qR6jTH43tfCwW
 yzHn+X/jHhfkW2T07Eq9PfbpZYqrWfGGltg21Z1bnNvE9nWcCAA==
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
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

The VID_REG_FLD_MOD function takes the start and end bits as parameter
and will generate a mask out of them.

This makes it difficult to share the masks between callers, since we now
need two arguments and to keep them consistent.

Let's change VID_REG_FLD_MOD to take the mask as an argument instead,
and let the caller create the mask. Eventually, this mask will be moved
to a define.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/tidss/tidss_dispc.c | 32 +++++++++++++++++---------------
 1 file changed, 17 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/tidss/tidss_dispc.c b/drivers/gpu/drm/tidss/tidss_dispc.c
index 8e2c8ecb9f18c71cb532f1f5cea2bc00a0262ad3..27ac57d770327707c3b6d8bc97a683e4d770cffa 100644
--- a/drivers/gpu/drm/tidss/tidss_dispc.c
+++ b/drivers/gpu/drm/tidss/tidss_dispc.c
@@ -607,17 +607,17 @@ void tidss_disable_oldi(struct tidss_device *tidss, u32 hw_videoport)
 	})
 
 #define VID_REG_GET(dispc, hw_plane, idx, mask)				\
 	((u32)FIELD_GET((mask), dispc_vid_read((dispc), (hw_plane), (idx))))
 
-#define VID_REG_FLD_MOD(dispc, hw_plane, idx, val, start, end)		\
+#define VID_REG_FLD_MOD(dispc, hw_plane, idx, val, mask)		\
 	({								\
 		struct dispc_device *_dispc = (dispc);			\
 		u32 _hw_plane = (hw_plane);				\
 		u32 _idx = (idx);					\
 		u32 _reg = dispc_vid_read(_dispc, _hw_plane, _idx);	\
-		FIELD_MODIFY(GENMASK((start), (end)), &_reg, (val));	\
+		FIELD_MODIFY((mask), &_reg, (val));			\
 		dispc_vid_write(_dispc, _hw_plane, _idx, _reg);		\
 	})
 
 #define VP_REG_GET(dispc, vp, idx, start, end)				\
 	((u32)FIELD_GET(GENMASK((start), (end)),			\
@@ -1740,11 +1740,12 @@ static void dispc_vid_csc_setup(struct dispc_device *dispc, u32 hw_plane,
 }
 
 static void dispc_vid_csc_enable(struct dispc_device *dispc, u32 hw_plane,
 				 bool enable)
 {
-	VID_REG_FLD_MOD(dispc, hw_plane, DISPC_VID_ATTRIBUTES, !!enable, 9, 9);
+	VID_REG_FLD_MOD(dispc, hw_plane, DISPC_VID_ATTRIBUTES, !!enable,
+			GENMASK(9, 9));
 }
 
 /* SCALER */
 
 static u32 dispc_calc_fir_inc(u32 in, u32 out)
@@ -1997,24 +1998,24 @@ static void dispc_vid_set_scaling(struct dispc_device *dispc,
 				  u32 hw_plane,
 				  struct dispc_scaling_params *sp,
 				  u32 fourcc)
 {
 	/* HORIZONTAL RESIZE ENABLE */
-	VID_REG_FLD_MOD(dispc, hw_plane, DISPC_VID_ATTRIBUTES,
-			sp->scale_x, 7, 7);
+	VID_REG_FLD_MOD(dispc, hw_plane, DISPC_VID_ATTRIBUTES, sp->scale_x,
+			GENMASK(7, 7));
 
 	/* VERTICAL RESIZE ENABLE */
-	VID_REG_FLD_MOD(dispc, hw_plane, DISPC_VID_ATTRIBUTES,
-			sp->scale_y, 8, 8);
+	VID_REG_FLD_MOD(dispc, hw_plane, DISPC_VID_ATTRIBUTES, sp->scale_y,
+			GENMASK(8, 8));
 
 	/* Skip the rest if no scaling is used */
 	if (!sp->scale_x && !sp->scale_y)
 		return;
 
 	/* VERTICAL 5-TAPS  */
-	VID_REG_FLD_MOD(dispc, hw_plane, DISPC_VID_ATTRIBUTES,
-			sp->five_taps, 21, 21);
+	VID_REG_FLD_MOD(dispc, hw_plane, DISPC_VID_ATTRIBUTES, sp->five_taps,
+			GENMASK(21, 21));
 
 	if (dispc_fourcc_is_yuv(fourcc)) {
 		if (sp->scale_x) {
 			dispc_vid_write(dispc, hw_plane, DISPC_VID_FIRH2,
 					sp->fir_xinc_uv);
@@ -2100,11 +2101,11 @@ static void dispc_plane_set_pixel_format(struct dispc_device *dispc,
 
 	for (i = 0; i < ARRAY_SIZE(dispc_color_formats); ++i) {
 		if (dispc_color_formats[i].fourcc == fourcc) {
 			VID_REG_FLD_MOD(dispc, hw_plane, DISPC_VID_ATTRIBUTES,
 					dispc_color_formats[i].dss_code,
-					6, 1);
+					GENMASK(6, 1));
 			return;
 		}
 	}
 
 	WARN_ON(1);
@@ -2278,19 +2279,20 @@ void dispc_plane_setup(struct dispc_device *dispc, u32 hw_plane,
 	dispc_vid_write(dispc, hw_plane, DISPC_VID_GLOBAL_ALPHA,
 			0xFF & (state->alpha >> 8));
 
 	if (state->pixel_blend_mode == DRM_MODE_BLEND_PREMULTI)
 		VID_REG_FLD_MOD(dispc, hw_plane, DISPC_VID_ATTRIBUTES, 1,
-				28, 28);
+				GENMASK(28, 28));
 	else
 		VID_REG_FLD_MOD(dispc, hw_plane, DISPC_VID_ATTRIBUTES, 0,
-				28, 28);
+				GENMASK(28, 28));
 }
 
 void dispc_plane_enable(struct dispc_device *dispc, u32 hw_plane, bool enable)
 {
-	VID_REG_FLD_MOD(dispc, hw_plane, DISPC_VID_ATTRIBUTES, !!enable, 0, 0);
+	VID_REG_FLD_MOD(dispc, hw_plane, DISPC_VID_ATTRIBUTES, !!enable,
+			GENMASK(0, 0));
 }
 
 static u32 dispc_vid_get_fifo_size(struct dispc_device *dispc, u32 hw_plane)
 {
 	return VID_REG_GET(dispc, hw_plane, DISPC_VID_BUF_SIZE_STATUS,
@@ -2355,11 +2357,11 @@ static void dispc_k2g_plane_init(struct dispc_device *dispc)
 		 * Prefetch up to fifo high-threshold value to minimize the
 		 * possibility of underflows. Note that this means the PRELOAD
 		 * register is ignored.
 		 */
 		VID_REG_FLD_MOD(dispc, hw_plane, DISPC_VID_ATTRIBUTES, 1,
-				19, 19);
+				GENMASK(19, 19));
 	}
 }
 
 static void dispc_k3_plane_init(struct dispc_device *dispc)
 {
@@ -2406,11 +2408,11 @@ static void dispc_k3_plane_init(struct dispc_device *dispc)
 
 		dispc_vid_write(dispc, hw_plane, DISPC_VID_PRELOAD, preload);
 
 		/* Prefech up to PRELOAD value */
 		VID_REG_FLD_MOD(dispc, hw_plane, DISPC_VID_ATTRIBUTES, 0,
-				19, 19);
+				GENMASK(19, 19));
 	}
 }
 
 static void dispc_plane_init(struct dispc_device *dispc)
 {

-- 
2.50.1

