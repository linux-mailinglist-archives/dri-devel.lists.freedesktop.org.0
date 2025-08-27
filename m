Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21DEEB385E2
	for <lists+dri-devel@lfdr.de>; Wed, 27 Aug 2025 17:13:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 785DD10E149;
	Wed, 27 Aug 2025 15:12:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Hq5J2Gu3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FEA610E84F
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Aug 2025 15:12:55 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 133CA6026E;
 Wed, 27 Aug 2025 15:12:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CD34C4CEF0;
 Wed, 27 Aug 2025 15:12:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756307574;
 bh=PmbbEdF9MF1vSaRgtsiUedCNxEGcP/e30F1iYuqyXv8=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=Hq5J2Gu3bpHyvLTZZ/Lb3v1JUPN+kKFi+gGpg7/IPRx+f+Rol42KtUquzoJA6YzJp
 IVYrFTwvX0GE5XILExMSOObRQchWi32w+m71/iQvhhAGCK5T85a/2nAyAQh90D5EiA
 nERSAkKDHCaX9bKoMupY0HQtgyXgC03KgbUp2Ei9hMN6YE+Z01apmUKt0O2rit0O7Q
 SAmDp1EOJrIDWlw8ka/e2pGm5Wsw8fkcdIKjHq6CzHGcxCAtrmq5hnPmki+/F+yRBG
 PlZg6hYMJ48flbwoeL/PtJi8/43JVyaGoJPCLg4VbxhaovQM4dDw7yWY3XtEFZEhT3
 q0FiP6dQ/q1Mw==
From: Maxime Ripard <mripard@kernel.org>
Date: Wed, 27 Aug 2025 17:12:35 +0200
Subject: [PATCH v3 04/14] drm/tidss: dispc: Get rid of FLD_VAL
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250827-drm-tidss-field-api-v3-4-7689b664cc63@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=7298; i=mripard@kernel.org;
 h=from:subject:message-id; bh=PmbbEdF9MF1vSaRgtsiUedCNxEGcP/e30F1iYuqyXv8=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBnrFVLqtM5/tz2zv9G1+2W9b//+H1LyTHs+e86aL3Pe7
 Mw6kU7ljqksDMKcDLJiiixPZMJOL29fXOVgv/IHzBxWJpAhDFycAjCRsNuM9XH/dM+VyW25fatO
 rE3I99el+Mw3d5dIzzZi1yitV1suY/bN+syK7Y938QR+MOhcd396PWPDBc3vuxn0ircfDd3Zol9
 t7Va299U//wmPQiP4U2ZvZFjXabXgb0nK2yzrNo5pu9c2xDEBAA==
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
index b5f09ed2f3700068bc39bef3630a86a33c16fabb..43f8078a1effa2b5a09532cb069131dc0cbf3c10 100644
--- a/drivers/gpu/drm/tidss/tidss_dispc.c
+++ b/drivers/gpu/drm/tidss/tidss_dispc.c
@@ -592,17 +592,10 @@ void tidss_disable_oldi(struct tidss_device *tidss, u32 hw_videoport)
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
@@ -610,11 +603,11 @@ void tidss_disable_oldi(struct tidss_device *tidss, u32 hw_videoport)
 
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
@@ -1218,18 +1211,18 @@ void dispc_vp_enable(struct dispc_device *dispc, u32 hw_videoport,
 	vfp = mode->crtc_vsync_start - mode->crtc_vdisplay;
 	vsw = mode->crtc_vsync_end - mode->crtc_vsync_start;
 	vbp = mode->crtc_vtotal - mode->crtc_vsync_end;
 
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
 
@@ -1248,21 +1241,21 @@ void dispc_vp_enable(struct dispc_device *dispc, u32 hw_videoport,
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
-		       FLD_VAL(mode->crtc_hdisplay - 1, 11, 0) |
-		       FLD_VAL(mode->crtc_vdisplay - 1, 27, 16));
+		       FIELD_PREP(GENMASK(11, 0), mode->crtc_hdisplay - 1) |
+		       FIELD_PREP(GENMASK(27, 16), mode->crtc_vdisplay - 1));
 
 	VP_REG_FLD_MOD(dispc, hw_videoport, DISPC_VP_CONTROL, 1, 0, 0);
 }
 
 void dispc_vp_disable(struct dispc_device *dispc, u32 hw_videoport)
@@ -1574,18 +1567,18 @@ struct dispc_csc_coef {
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
@@ -1820,11 +1813,12 @@ static void dispc_vid_write_fir_coefs(struct dispc_device *dispc,
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
 
@@ -2318,18 +2312,18 @@ static u32 dispc_vid_get_fifo_size(struct dispc_device *dispc, u32 hw_plane)
 
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
@@ -2466,12 +2460,12 @@ static void dispc_initial_config(struct dispc_device *dispc)
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
@@ -2645,12 +2639,12 @@ static void dispc_k2g_cpr_from_ctm(const struct drm_color_ctm *ctm,
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

