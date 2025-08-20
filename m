Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C36D5B2DE8C
	for <lists+dri-devel@lfdr.de>; Wed, 20 Aug 2025 16:02:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2869210E746;
	Wed, 20 Aug 2025 14:02:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="g1DX8RTu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCD0D10E745
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Aug 2025 14:02:12 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id A4CB7457C3;
 Wed, 20 Aug 2025 14:02:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31C2AC116B1;
 Wed, 20 Aug 2025 14:02:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1755698532;
 bh=3tToQxPuD+Y+SqYGY3q3oiIhiOifongn+nBP/XX4RXc=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=g1DX8RTu8fwBrDLssJQyt5TEyZD9fZ36GSf2wIzgYcdZL3mtWmusx3jLlgP3S/YdR
 bFNAsbB34ZrW11HLTMYhSHpkZTuVekNPGkWbK99LBvbnWYpQHJiLdpGKfhutgc5cY9
 aDm4O2RE/N9xJERc3Hwuh9CCkCUGWw84j0BfW7wsnOi0SeCEB1K8xQ9/+0e4T0tLKD
 ibtpRfBPLCgnshZymACHg+8bok7uvhLThst0WkAv5NtAi41nHOtoBfJqRaECPrQVFt
 wUiF05X7LCNvrlB62IWxBmEdga8XHPveoxxMyiBKDO+tcJ+hd/eJpXlsfWM9v4LWPQ
 3YDSzXmYoDrvA==
From: Maxime Ripard <mripard@kernel.org>
Date: Wed, 20 Aug 2025 16:01:44 +0200
Subject: [PATCH v2 04/14] drm/tidss: dispc: Get rid of FLD_VAL
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250820-drm-tidss-field-api-v2-4-43cab671c648@kernel.org>
References: <20250820-drm-tidss-field-api-v2-0-43cab671c648@kernel.org>
In-Reply-To: <20250820-drm-tidss-field-api-v2-0-43cab671c648@kernel.org>
To: Jyri Sarha <jyri.sarha@iki.fi>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=7248; i=mripard@kernel.org;
 h=from:subject:message-id; bh=3tToQxPuD+Y+SqYGY3q3oiIhiOifongn+nBP/XX4RXc=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBlLrwa0dG4LEWf6sVR/xopDIY6bdvzSvfVf/n+n9P7ZO
 U1c1rYxHVNZGIQ5GWTFFFmeyISdXt6+uMrBfuUPmDmsTCBDGLg4BWAi57wY60M8tr7YvJkv75ay
 nb64tfrqzJrM/DvaOusU3JuXnYn/uyV5xVGBXZVb+9hKb9tOePksn7FOv8XnePDGuYueqn9fv3S
 /cNMRdaeJlmrLYs6H3juYE/fusscVq0v9x6JvvM17I+Yd9tIOAA==
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

The FLD_VAL function is an equivalent to what FIELD_PREP + GENMASK
provide, so let's drop it and switch to the latter.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/tidss/tidss_dispc.c | 58 +++++++++++++++++--------------------
 1 file changed, 26 insertions(+), 32 deletions(-)

diff --git a/drivers/gpu/drm/tidss/tidss_dispc.c b/drivers/gpu/drm/tidss/tidss_dispc.c
index 929c9e3ac1174df68937afd86f13bda4e3a66394..f0568ae3e7bebf481bb5f6d0603dae4b6e6a0729 100644
--- a/drivers/gpu/drm/tidss/tidss_dispc.c
+++ b/drivers/gpu/drm/tidss/tidss_dispc.c
@@ -607,17 +607,10 @@ void tidss_disable_oldi(struct tidss_device *tidss, u32 hw_videoport)
 /*
  * TRM gives bitfields as start:end, where start is the higher bit
  * number. For example 7:0
  */
 
-#define FLD_VAL(val, start, end)					\
-	({								\
-		int _end_inner = (end);					\
-		u32 _new_val = ((val) << _end_inner) & GENMASK((start), _end_inner); \
-		_new_val;						\
-	})
-
 #define FLD_GET(val, start, end)					\
 	({								\
 		int _end = (end);					\
 		u32 _ret_val = ((val) & GENMASK((start), _end)) >> _end; \
 		_ret_val;						\
@@ -625,11 +618,11 @@ void tidss_disable_oldi(struct tidss_device *tidss, u32 hw_videoport)
 
 #define FLD_MOD(orig, val, start, end)					\
 	({								\
 		int _start = (start), _end = (end);			\
 		u32 _masked_val = (orig) & ~GENMASK(_start, _end);	\
-		u32 _new_val = _masked_val | FLD_VAL((val), _start, _end); \
+		u32 _new_val = _masked_val | FIELD_PREP(GENMASK(_start, _end), (val)); \
 		_new_val;						\
 	})
 
 #define REG_GET(dispc, idx, start, end)					\
 	((u32)FLD_GET(dispc_read((dispc), (idx)), (start), (end)))
@@ -1233,18 +1226,18 @@ void dispc_vp_enable(struct dispc_device *dispc, u32 hw_videoport,
 	vfp = mode->vsync_start - mode->vdisplay;
 	vsw = mode->vsync_end - mode->vsync_start;
 	vbp = mode->vtotal - mode->vsync_end;
 
 	dispc_vp_write(dispc, hw_videoport, DISPC_VP_TIMING_H,
-		       FLD_VAL(hsw - 1, 7, 0) |
-		       FLD_VAL(hfp - 1, 19, 8) |
-		       FLD_VAL(hbp - 1, 31, 20));
+		       FIELD_PREP(GENMASK(7, 0), hsw - 1) |
+		       FIELD_PREP(GENMASK(19, 8), hfp - 1) |
+		       FIELD_PREP(GENMASK(31, 20), hbp - 1));
 
 	dispc_vp_write(dispc, hw_videoport, DISPC_VP_TIMING_V,
-		       FLD_VAL(vsw - 1, 7, 0) |
-		       FLD_VAL(vfp, 19, 8) |
-		       FLD_VAL(vbp, 31, 20));
+		       FIELD_PREP(GENMASK(7, 0), vsw - 1) |
+		       FIELD_PREP(GENMASK(19, 8), vfp) |
+		       FIELD_PREP(GENMASK(31, 20), vbp));
 
 	ivs = !!(mode->flags & DRM_MODE_FLAG_NVSYNC);
 
 	ihs = !!(mode->flags & DRM_MODE_FLAG_NHSYNC);
 
@@ -1263,21 +1256,21 @@ void dispc_vp_enable(struct dispc_device *dispc, u32 hw_videoport,
 	/* always use DE_HIGH for OLDI */
 	if (dispc->feat->vp_bus_type[hw_videoport] == DISPC_VP_OLDI_AM65X)
 		ieo = false;
 
 	dispc_vp_write(dispc, hw_videoport, DISPC_VP_POL_FREQ,
-		       FLD_VAL(align, 18, 18) |
-		       FLD_VAL(onoff, 17, 17) |
-		       FLD_VAL(rf, 16, 16) |
-		       FLD_VAL(ieo, 15, 15) |
-		       FLD_VAL(ipc, 14, 14) |
-		       FLD_VAL(ihs, 13, 13) |
-		       FLD_VAL(ivs, 12, 12));
+		       FIELD_PREP(GENMASK(18, 18), align) |
+		       FIELD_PREP(GENMASK(17, 17), onoff) |
+		       FIELD_PREP(GENMASK(16, 16), rf) |
+		       FIELD_PREP(GENMASK(15, 15), ieo) |
+		       FIELD_PREP(GENMASK(14, 14), ipc) |
+		       FIELD_PREP(GENMASK(13, 13), ihs) |
+		       FIELD_PREP(GENMASK(12, 12), ivs));
 
 	dispc_vp_write(dispc, hw_videoport, DISPC_VP_SIZE_SCREEN,
-		       FLD_VAL(mode->hdisplay - 1, 11, 0) |
-		       FLD_VAL(mode->vdisplay - 1, 27, 16));
+		       FIELD_PREP(GENMASK(11, 0), mode->hdisplay - 1) |
+		       FIELD_PREP(GENMASK(27, 16), mode->vdisplay - 1));
 
 	VP_REG_FLD_MOD(dispc, hw_videoport, DISPC_VP_CONTROL, 1, 0, 0);
 }
 
 void dispc_vp_disable(struct dispc_device *dispc, u32 hw_videoport)
@@ -1589,18 +1582,18 @@ struct dispc_csc_coef {
 #define DISPC_CSC_REGVAL_LEN 8
 
 static
 void dispc_csc_offset_regval(const struct dispc_csc_coef *csc, u32 *regval)
 {
-#define OVAL(x, y) (FLD_VAL(x, 15, 3) | FLD_VAL(y, 31, 19))
+#define OVAL(x, y) (FIELD_PREP(GENMASK(15, 3), x) | FIELD_PREP(GENMASK(31, 19), y))
 	regval[5] = OVAL(csc->preoffset[0], csc->preoffset[1]);
 	regval[6] = OVAL(csc->preoffset[2], csc->postoffset[0]);
 	regval[7] = OVAL(csc->postoffset[1], csc->postoffset[2]);
 #undef OVAL
 }
 
-#define CVAL(x, y) (FLD_VAL(x, 10, 0) | FLD_VAL(y, 26, 16))
+#define CVAL(x, y) (FIELD_PREP(GENMASK(10, 0), x) | FIELD_PREP(GENMASK(26, 16), y))
 static
 void dispc_csc_yuv2rgb_regval(const struct dispc_csc_coef *csc, u32 *regval)
 {
 	regval[0] = CVAL(csc->m[CSC_RY], csc->m[CSC_RCR]);
 	regval[1] = CVAL(csc->m[CSC_RCB], csc->m[CSC_GY]);
@@ -1835,11 +1828,12 @@ static void dispc_vid_write_fir_coefs(struct dispc_device *dispc,
 		s16 c1, c2;
 		u32 c12;
 
 		c1 = coefs->c1[phase];
 		c2 = coefs->c2[phase];
-		c12 = FLD_VAL(c1, 19, 10) | FLD_VAL(c2, 29, 20);
+		c12 = FIELD_PREP(GENMASK(19, 10), c1) | FIELD_PREP(GENMASK(29, 20),
+								   c2);
 
 		dispc_vid_write(dispc, hw_plane, reg, c12);
 	}
 }
 
@@ -2333,18 +2327,18 @@ static u32 dispc_vid_get_fifo_size(struct dispc_device *dispc, u32 hw_plane)
 
 static void dispc_vid_set_mflag_threshold(struct dispc_device *dispc,
 					  u32 hw_plane, u32 low, u32 high)
 {
 	dispc_vid_write(dispc, hw_plane, DISPC_VID_MFLAG_THRESHOLD,
-			FLD_VAL(high, 31, 16) | FLD_VAL(low, 15, 0));
+			FIELD_PREP(GENMASK(31, 16), high) | FIELD_PREP(GENMASK(15, 0), low));
 }
 
 static void dispc_vid_set_buf_threshold(struct dispc_device *dispc,
 					u32 hw_plane, u32 low, u32 high)
 {
 	dispc_vid_write(dispc, hw_plane, DISPC_VID_BUF_THRESHOLD,
-			FLD_VAL(high, 31, 16) | FLD_VAL(low, 15, 0));
+			FIELD_PREP(GENMASK(31, 16), high) | FIELD_PREP(GENMASK(15, 0), low));
 }
 
 static void dispc_k2g_plane_init(struct dispc_device *dispc)
 {
 	unsigned int hw_plane;
@@ -2481,12 +2475,12 @@ static void dispc_initial_config(struct dispc_device *dispc)
 	dispc_vp_init(dispc);
 
 	/* Note: Hardcoded DPI routing on J721E for now */
 	if (dispc->feat->subrev == DISPC_J721E) {
 		dispc_write(dispc, DISPC_CONNECTIONS,
-			    FLD_VAL(2, 3, 0) |		/* VP1 to DPI0 */
-			    FLD_VAL(8, 7, 4)		/* VP3 to DPI1 */
+			    FIELD_PREP(GENMASK(3, 0), 2) |		/* VP1 to DPI0 */
+			    FIELD_PREP(GENMASK(7, 4), 8)		/* VP3 to DPI1 */
 			);
 	}
 }
 
 static void dispc_k2g_vp_write_gamma_table(struct dispc_device *dispc,
@@ -2660,12 +2654,12 @@ static void dispc_k2g_cpr_from_ctm(const struct drm_color_ctm *ctm,
 	cpr->m[CSC_BR] = dispc_S31_32_to_s2_8(ctm->matrix[6]);
 	cpr->m[CSC_BG] = dispc_S31_32_to_s2_8(ctm->matrix[7]);
 	cpr->m[CSC_BB] = dispc_S31_32_to_s2_8(ctm->matrix[8]);
 }
 
-#define CVAL(xR, xG, xB) (FLD_VAL(xR, 9, 0) | FLD_VAL(xG, 20, 11) |	\
-			  FLD_VAL(xB, 31, 22))
+#define CVAL(xR, xG, xB) (FIELD_PREP(GENMASK(9, 0), xR) | FIELD_PREP(GENMASK(20, 11), xG) |	\
+			  FIELD_PREP(GENMASK(31, 22), xB))
 
 static void dispc_k2g_vp_csc_cpr_regval(const struct dispc_csc_coef *csc,
 					u32 *regval)
 {
 	regval[0] = CVAL(csc->m[CSC_BB], csc->m[CSC_BG], csc->m[CSC_BR]);

-- 
2.50.1

