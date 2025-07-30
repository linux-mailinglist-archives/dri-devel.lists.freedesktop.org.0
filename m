Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E984B15B0C
	for <lists+dri-devel@lfdr.de>; Wed, 30 Jul 2025 10:57:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1321710E43B;
	Wed, 30 Jul 2025 08:57:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="LcLiha0M";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DC2D10E435
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Jul 2025 08:57:41 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 8EF325C5420;
 Wed, 30 Jul 2025 08:57:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DB7AC4CEE7;
 Wed, 30 Jul 2025 08:57:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1753865860;
 bh=34elvM1s2AFsn1IFdmSPZJm2lK5jpkaAUPc9/D4aLec=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=LcLiha0M0yBg+7g59jzHzw1eG0bIfsJNeRlyvoC01bzjF1rhKHlPPOyGsZMKD7aIt
 L7yyf09i0vcbko5hptfEAbORtdheVALmYX+71m3/PuNazKhfnh8kkBAUG0GTrSKwK1
 w8YPf0MMuGkwBfiOZJkg97q9bqSA9IfF2gv0L1N5uhLKA2NAznZj0e32iOnJialF79
 8xIiXNkCA6IsrziJzalIa7QpywowxfxvBxYLvZEemVaE94hsgKgHWdohTOaVOOZWgi
 xGohmcri7cWRGrF6Iri6cSaPdu8jihXO2ubaU5W6xSDdlKJIaFcBxPrLYqsKgjQIQc
 JW3UW0jHPQ5fg==
From: Maxime Ripard <mripard@kernel.org>
Date: Wed, 30 Jul 2025 10:57:10 +0200
Subject: [PATCH 10/14] drm/tidss: dispc: Switch VID_REG_FLD_MOD to using a mask
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250730-drm-tidss-field-api-v1-10-a71ae8dd2782@kernel.org>
References: <20250730-drm-tidss-field-api-v1-0-a71ae8dd2782@kernel.org>
In-Reply-To: <20250730-drm-tidss-field-api-v1-0-a71ae8dd2782@kernel.org>
To: Jyri Sarha <jyri.sarha@iki.fi>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5036; i=mripard@kernel.org;
 h=from:subject:message-id; bh=34elvM1s2AFsn1IFdmSPZJm2lK5jpkaAUPc9/D4aLec=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBmd91IuHz3/uupuwPpPWbqTc70KSr2D9u9euOjtBAOdW
 2I3mh+Jd0xlYRDmZJAVU2R5IhN2enn74ioH+5U/YOawMoEMYeDiFICJ2H5nbDiQ/IF9otmj+Vq2
 qXPPL1j79+7W1vnHpE5L7/64c8sZpb7+p9NlFqws3Wkh1H/5ol92yXHGhgeqckvei03V619++jQ
 jo/T3qt7MyriqnDjp/HIZDlWGteWfvj1p46z3vnB1Fnvk9GlsAA==
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
index d276ad881706057acabf6895f0c1f6758693504a..c22036d2b1dc2115245014d2e0572ac6bffa77ef 100644
--- a/drivers/gpu/drm/tidss/tidss_dispc.c
+++ b/drivers/gpu/drm/tidss/tidss_dispc.c
@@ -630,14 +630,14 @@ static u32 VID_REG_GET(struct dispc_device *dispc, u32 hw_plane, u32 idx,
 {
 	return FIELD_GET(mask, dispc_vid_read(dispc, hw_plane, idx));
 }
 
 static void VID_REG_FLD_MOD(struct dispc_device *dispc, u32 hw_plane, u32 idx,
-			    u32 val, u32 start, u32 end)
+			    u32 val, u32 mask)
 {
 	dispc_vid_write(dispc, hw_plane, idx,
-			FLD_MOD(dispc_vid_read(dispc, hw_plane, idx), val, GENMASK(start, end)));
+			FLD_MOD(dispc_vid_read(dispc, hw_plane, idx), val, mask));
 }
 
 static u32 VP_REG_GET(struct dispc_device *dispc, u32 vp, u32 idx,
 		      u32 start, u32 end)
 {
@@ -1756,11 +1756,12 @@ static void dispc_vid_csc_setup(struct dispc_device *dispc, u32 hw_plane,
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
@@ -2013,24 +2014,24 @@ static void dispc_vid_set_scaling(struct dispc_device *dispc,
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
@@ -2116,11 +2117,11 @@ static void dispc_plane_set_pixel_format(struct dispc_device *dispc,
 
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
@@ -2294,19 +2295,20 @@ void dispc_plane_setup(struct dispc_device *dispc, u32 hw_plane,
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
@@ -2371,11 +2373,11 @@ static void dispc_k2g_plane_init(struct dispc_device *dispc)
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
@@ -2422,11 +2424,11 @@ static void dispc_k3_plane_init(struct dispc_device *dispc)
 
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

