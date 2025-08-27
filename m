Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41985B385ED
	for <lists+dri-devel@lfdr.de>; Wed, 27 Aug 2025 17:13:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AAC310E84B;
	Wed, 27 Aug 2025 15:13:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="oZI9kyiE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E08510E851
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Aug 2025 15:13:17 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id B4F95601DA;
 Wed, 27 Aug 2025 15:13:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A295C4CEEB;
 Wed, 27 Aug 2025 15:13:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756307596;
 bh=Vr81QLsdJfPxTAirR9ZzowAMIpD+4tSxhNs79iOJJeA=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=oZI9kyiE6QH7Yyac7a+J2tcZ6J4Igc3iNxgSvggozjDxgDJBPTT8qGC3SqBnsbEm/
 VEx4bC+b6J8T41vh4qptJQsJ3d7E3Cw7/jTK6GSFO1JV4f1XMMi8C4e+RM56WJg5KS
 ZgIIw2oS4+MANr+zsRl5pkLGVH8xkJJvtZcU7oN0B598J0m+NpdhzMft45qKDtqR0P
 19i3JcXexJYdBc0h9SUIspon8rpPdcJ+sPQXZClmA5yN0efKIoZFrBRZ26cxTzaFp1
 JP0gUvDZmGtD2YoVW84y9trufzS/Io47lKnuwvFCO0CQcUFHJ6pGA28OG8PpFOWeAu
 xReXKd5mWL46A==
From: Maxime Ripard <mripard@kernel.org>
Date: Wed, 27 Aug 2025 17:12:43 +0200
Subject: [PATCH v3 12/14] drm/tidss: dispc: Switch VP_REG_FLD_MOD to using
 a mask
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250827-drm-tidss-field-api-v3-12-7689b664cc63@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5453; i=mripard@kernel.org;
 h=from:subject:message-id; bh=Vr81QLsdJfPxTAirR9ZzowAMIpD+4tSxhNs79iOJJeA=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBnrFTJOm9dLNBq5TNg4+dAiU460C11PNJy8jcufzJC1m
 p9/RHVbx1QWBmFOBlkxRZYnMmGnl7cvrnKwX/kDZg4rE8gQBi5OAZjIGV7GavbcuTnWG50nyt5s
 PhLe3bzWsUNDWPKym/A6R/mS9g9efRvVuSuqzkwP+OQYkOT00MSTsT5w2rvMVUt2HDzS4zT/DF/
 19Tl/5+Vd3yIjk2gQZn3yyoJlBwsU9p5d4yerwmaqual1thEA
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
index 3d807b129c09f1b78016e9d04fa501ed745e5aad..0255f7156f46008c8fee2b37f1431957f1c71cad 100644
--- a/drivers/gpu/drm/tidss/tidss_dispc.c
+++ b/drivers/gpu/drm/tidss/tidss_dispc.c
@@ -620,17 +620,17 @@ void tidss_disable_oldi(struct tidss_device *tidss, u32 hw_videoport)
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
@@ -1111,11 +1111,12 @@ static void dispc_set_num_datalines(struct dispc_device *dispc,
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
@@ -1238,16 +1239,18 @@ void dispc_vp_enable(struct dispc_device *dispc, u32 hw_videoport,
 
 	dispc_vp_write(dispc, hw_videoport, DISPC_VP_SIZE_SCREEN,
 		       FIELD_PREP(GENMASK(11, 0), mode->crtc_hdisplay - 1) |
 		       FIELD_PREP(GENMASK(27, 16), mode->crtc_vdisplay - 1));
 
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
@@ -1264,11 +1267,12 @@ bool dispc_vp_go_busy(struct dispc_device *dispc, u32 hw_videoport)
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
@@ -2438,11 +2442,11 @@ static void dispc_vp_init(struct dispc_device *dispc)
 
 	dev_dbg(dispc->dev, "%s()\n", __func__);
 
 	/* Enable the gamma Shadow bit-field for all VPs*/
 	for (i = 0; i < dispc->feat->num_vps; i++)
-		VP_REG_FLD_MOD(dispc, i, DISPC_VP_CONFIG, 1, 2, 2);
+		VP_REG_FLD_MOD(dispc, i, DISPC_VP_CONFIG, 1, GENMASK(2, 2));
 }
 
 static void dispc_initial_config(struct dispc_device *dispc)
 {
 	dispc_plane_init(dispc);
@@ -2671,12 +2675,12 @@ static void dispc_k2g_vp_set_ctm(struct dispc_device *dispc, u32 hw_videoport,
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
@@ -2737,12 +2741,12 @@ static void dispc_k3_vp_set_ctm(struct dispc_device *dispc, u32 hw_videoport,
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
@@ -2889,11 +2893,12 @@ static void dispc_softreset_k2g(struct dispc_device *dispc)
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

