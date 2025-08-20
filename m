Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03DC8B2DE96
	for <lists+dri-devel@lfdr.de>; Wed, 20 Aug 2025 16:02:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2F0510E751;
	Wed, 20 Aug 2025 14:02:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="mDAxE6Eo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5ECD10E750
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Aug 2025 14:02:34 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 8676B44670;
 Wed, 20 Aug 2025 14:02:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5A9FC4CEE7;
 Wed, 20 Aug 2025 14:02:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1755698554;
 bh=b6xJyo18UYS8O7YOE9dEVSSRl/sjpwJiLbl0KFBA/JY=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=mDAxE6EoHibiW3nR5lH0tZnw6styea3YObdfyJfqpLFkcvk3eroH3HhuJ1LcxtL+V
 w5qRzia5VHNDcKIhh/cRyP5vUqireQxr2FxSqCqbl6M9tmNN8g9RNcFS2VHiYhodOa
 sPZFUv4Pqr3urRaLrZzsrWb8KD9vYM1jCeJDYOxPJ2S5+/TvChx4b2NW7fDeVylkte
 ny6h0ImybyJTCgGxyO7DCwFU2lxln8I4VbbkzSKuL78AFnjnaYmh3gD5xdd+G99u5S
 k4esPOFc3TVrbX7aQzvHXnHpkBdFqfUSmQOtHzRDYArbnwfjDB8Ts0JkP/EqKbO0A8
 P+yQBzQJP5llg==
From: Maxime Ripard <mripard@kernel.org>
Date: Wed, 20 Aug 2025 16:01:52 +0200
Subject: [PATCH v2 12/14] drm/tidss: dispc: Switch VP_REG_FLD_MOD to using
 a mask
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250820-drm-tidss-field-api-v2-12-43cab671c648@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5443; i=mripard@kernel.org;
 h=from:subject:message-id; bh=b6xJyo18UYS8O7YOE9dEVSSRl/sjpwJiLbl0KFBA/JY=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBlLr4ZwxRbVPC6p5fihk53SP31H2XuJ0sXL8nJ+T4h54
 bXkmfH2jqksDMKcDLJiiixPZMJOL29fXOVgv/IHzBxWJpAhDFycAjCR9zGMDfveck78fmoJ6+tD
 vpe4Zy5b9HpDR4RX+vSp5fbr7hgvjdud9yuc5emB/SKP/s26fs0oYwpjw/bOgk3T/vb8Wyh2ZPE
 PuYJ/K4TMUp0NFhv79WhGhNXUNgv+2f4jZ1+iftHsG1px558XAQA=
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

The VP_REG_FLD_MOD function takes the start and end bits as parameter
and will generate a mask out of them.

This makes it difficult to share the masks between callers, since we now
need two arguments and to keep them consistent.

Let's change VP_REG_FLD_MOD to take the mask as an argument instead, and
let the caller create the mask. Eventually, this mask will be moved to a
define.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/tidss/tidss_dispc.c | 29 +++++++++++++++++------------
 1 file changed, 17 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/tidss/tidss_dispc.c b/drivers/gpu/drm/tidss/tidss_dispc.c
index 45422fb6038a255b8ba1246762f39a4284e5b1d5..c5cad1ddcccfbf1d0b6fb53773bb3aff428ef493 100644
--- a/drivers/gpu/drm/tidss/tidss_dispc.c
+++ b/drivers/gpu/drm/tidss/tidss_dispc.c
@@ -635,17 +635,17 @@ void tidss_disable_oldi(struct tidss_device *tidss, u32 hw_videoport)
 	})
 
 #define VP_REG_GET(dispc, vp, idx, mask)				\
 	((u32)FIELD_GET((mask), dispc_vp_read((dispc), (vp), (idx))))
 
-#define VP_REG_FLD_MOD(dispc, vp, idx, val, start, end)			\
+#define VP_REG_FLD_MOD(dispc, vp, idx, val, mask)			\
 	({								\
 		struct dispc_device *_dispc = (dispc);			\
 		u32 _vp = (vp);						\
 		u32 _idx = (idx);					\
 		u32 _reg = dispc_vp_read(_dispc, _vp, _idx);		\
-		FIELD_MODIFY(GENMASK((start), (end)), &_reg, (val));	\
+		FIELD_MODIFY((mask), &_reg, (val));			\
 		dispc_vp_write(_dispc, _vp, _idx, _reg);		\
 	})
 
 #define OVR_REG_FLD_MOD(dispc, ovr, idx, val, start, end)		\
 	({								\
@@ -1126,11 +1126,12 @@ static void dispc_set_num_datalines(struct dispc_device *dispc,
 	default:
 		WARN_ON(1);
 		v = 3;
 	}
 
-	VP_REG_FLD_MOD(dispc, hw_videoport, DISPC_VP_CONTROL, v, 10, 8);
+	VP_REG_FLD_MOD(dispc, hw_videoport, DISPC_VP_CONTROL, v,
+		       GENMASK(10, 8));
 }
 
 static void dispc_enable_am65x_oldi(struct dispc_device *dispc, u32 hw_videoport,
 				    const struct dispc_bus_format *fmt)
 {
@@ -1253,16 +1254,18 @@ void dispc_vp_enable(struct dispc_device *dispc, u32 hw_videoport,
 
 	dispc_vp_write(dispc, hw_videoport, DISPC_VP_SIZE_SCREEN,
 		       FIELD_PREP(GENMASK(11, 0), mode->hdisplay - 1) |
 		       FIELD_PREP(GENMASK(27, 16), mode->vdisplay - 1));
 
-	VP_REG_FLD_MOD(dispc, hw_videoport, DISPC_VP_CONTROL, 1, 0, 0);
+	VP_REG_FLD_MOD(dispc, hw_videoport, DISPC_VP_CONTROL, 1,
+		       GENMASK(0, 0));
 }
 
 void dispc_vp_disable(struct dispc_device *dispc, u32 hw_videoport)
 {
-	VP_REG_FLD_MOD(dispc, hw_videoport, DISPC_VP_CONTROL, 0, 0, 0);
+	VP_REG_FLD_MOD(dispc, hw_videoport, DISPC_VP_CONTROL, 0,
+		       GENMASK(0, 0));
 }
 
 void dispc_vp_unprepare(struct dispc_device *dispc, u32 hw_videoport)
 {
 	if (dispc->feat->vp_bus_type[hw_videoport] == DISPC_VP_OLDI_AM65X) {
@@ -1279,11 +1282,12 @@ bool dispc_vp_go_busy(struct dispc_device *dispc, u32 hw_videoport)
 }
 
 void dispc_vp_go(struct dispc_device *dispc, u32 hw_videoport)
 {
 	WARN_ON(VP_REG_GET(dispc, hw_videoport, DISPC_VP_CONTROL, GENMASK(5, 5)));
-	VP_REG_FLD_MOD(dispc, hw_videoport, DISPC_VP_CONTROL, 1, 5, 5);
+	VP_REG_FLD_MOD(dispc, hw_videoport, DISPC_VP_CONTROL, 1,
+		       GENMASK(5, 5));
 }
 
 enum c8_to_c12_mode { C8_TO_C12_REPLICATE, C8_TO_C12_MAX, C8_TO_C12_MIN };
 
 static u16 c8_to_c12(u8 c8, enum c8_to_c12_mode mode)
@@ -2453,11 +2457,11 @@ static void dispc_vp_init(struct dispc_device *dispc)
 
 	dev_dbg(dispc->dev, "%s()\n", __func__);
 
 	/* Enable the gamma Shadow bit-field for all VPs*/
 	for (i = 0; i < dispc->feat->num_vps; i++)
-		VP_REG_FLD_MOD(dispc, i, DISPC_VP_CONFIG, 1, 2, 2);
+		VP_REG_FLD_MOD(dispc, i, DISPC_VP_CONFIG, 1, GENMASK(2, 2));
 }
 
 static void dispc_initial_config(struct dispc_device *dispc)
 {
 	dispc_plane_init(dispc);
@@ -2686,12 +2690,12 @@ static void dispc_k2g_vp_set_ctm(struct dispc_device *dispc, u32 hw_videoport,
 		dispc_k2g_cpr_from_ctm(ctm, &cpr);
 		dispc_k2g_vp_write_csc(dispc, hw_videoport, &cpr);
 		cprenable = 1;
 	}
 
-	VP_REG_FLD_MOD(dispc, hw_videoport, DISPC_VP_CONFIG,
-		       cprenable, 15, 15);
+	VP_REG_FLD_MOD(dispc, hw_videoport, DISPC_VP_CONFIG, cprenable,
+		       GENMASK(15, 15));
 }
 
 static s16 dispc_S31_32_to_s3_8(s64 coef)
 {
 	u64 sign_bit = 1ULL << 63;
@@ -2752,12 +2756,12 @@ static void dispc_k3_vp_set_ctm(struct dispc_device *dispc, u32 hw_videoport,
 		dispc_csc_from_ctm(ctm, &csc);
 		dispc_k3_vp_write_csc(dispc, hw_videoport, &csc);
 		colorconvenable = 1;
 	}
 
-	VP_REG_FLD_MOD(dispc, hw_videoport, DISPC_VP_CONFIG,
-		       colorconvenable, 24, 24);
+	VP_REG_FLD_MOD(dispc, hw_videoport, DISPC_VP_CONFIG, colorconvenable,
+		       GENMASK(24, 24));
 }
 
 static void dispc_vp_set_color_mgmt(struct dispc_device *dispc,
 				    u32 hw_videoport,
 				    const struct drm_crtc_state *state,
@@ -2904,11 +2908,12 @@ static void dispc_softreset_k2g(struct dispc_device *dispc)
 	dispc_set_irqenable(dispc, 0);
 	dispc_read_and_clear_irqstatus(dispc);
 	spin_unlock_irqrestore(&dispc->tidss->irq_lock, flags);
 
 	for (unsigned int vp_idx = 0; vp_idx < dispc->feat->num_vps; ++vp_idx)
-		VP_REG_FLD_MOD(dispc, vp_idx, DISPC_VP_CONTROL, 0, 0, 0);
+		VP_REG_FLD_MOD(dispc, vp_idx, DISPC_VP_CONTROL, 0,
+			       GENMASK(0, 0));
 }
 
 static int dispc_softreset(struct dispc_device *dispc)
 {
 	u32 val;

-- 
2.50.1

