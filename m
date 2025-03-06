Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13847A54C31
	for <lists+dri-devel@lfdr.de>; Thu,  6 Mar 2025 14:29:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EC2510E967;
	Thu,  6 Mar 2025 13:29:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="wmXy1l4i";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 116A010E967
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Mar 2025 13:29:54 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 526DTJtH082852
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 6 Mar 2025 07:29:19 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1741267759;
 bh=cfH/BfYw3JZZUPQRZltbUd0vU8X5sLh7O9qJt/uGt2I=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=wmXy1l4ix5mW4lyodXdvZKOyH4u8MalX+DamDwIQ49oWu4d5Lq0ExW9gfc8BBi23w
 uHS6xi/PxP73rSkjGO3YMmZ8Zwst3DUfO10iqrUjXdMRs/YWdl85BE4Sx34fwKSrld
 wLKsPVbbSes5t/s4e4UJ8HuGpwj9ilw+WRlTxdfo=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 526DTJpY088347
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 6 Mar 2025 07:29:19 -0600
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 6
 Mar 2025 07:29:19 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 6 Mar 2025 07:29:19 -0600
Received: from localhost (ti.dhcp.ti.com [172.24.227.95] (may be forged))
 by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 526DTI1S021943;
 Thu, 6 Mar 2025 07:29:18 -0600
From: Devarsh Thakkar <devarsht@ti.com>
To: <jyri.sarha@iki.fi>, <tomi.valkeinen@ideasonboard.com>,
 <airlied@gmail.com>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <tzimmermann@suse.de>,
 <dri-devel@lists.freedesktop.org>, <simona@ffwll.ch>,
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <praneeth@ti.com>, <vigneshr@ti.com>, <aradhya.bhatia@linux.dev>,
 <s-jain1@ti.com>, <r-donadkar@ti.com>, <j-choudhary@ti.com>,
 <h-shenoy@ti.com>, <devarsht@ti.com>
Subject: [PATCH v3 2/3] drm/tidss: Update infrastructure to support K3 DSS
 cut-down versions
Date: Thu, 6 Mar 2025 18:59:13 +0530
Message-ID: <20250306132914.1469387-3-devarsht@ti.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20250306132914.1469387-1-devarsht@ti.com>
References: <20250306132914.1469387-1-devarsht@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
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

SoCs like AM62Lx support cut-down version of DSS7 where
although same register space is supported as in other
DSS7 supported SoCs such as AM65x, AM62x, AM62Ax but some of
the resources such as planes and corresponding register spaces
are truncated.

For e.g. AM62Lx has only single VIDL pipeline supported, so
corresponding register spaces for other video pipelines need
to be skipped.

To add a generic support for future SoCs whether one or more
video pipelines can get truncated from the parent register space,
move the plane related information to plane_info struct which will
also have a flag to indicate whether that plane is actually supported
or it is truncated. If the plane is truncated, then skip the access
to corresponding register space while doing plane related operations.

Signed-off-by: Devarsh Thakkar <devarsht@ti.com>
---
V3: Patch is introduced
V2: Patch not present

 drivers/gpu/drm/tidss/tidss_crtc.c  |   7 +-
 drivers/gpu/drm/tidss/tidss_dispc.c | 133 +++++++++++++++++++++++-----
 drivers/gpu/drm/tidss/tidss_dispc.h |   9 +-
 drivers/gpu/drm/tidss/tidss_irq.c   |   6 ++
 drivers/gpu/drm/tidss/tidss_kms.c   |  10 ++-
 5 files changed, 135 insertions(+), 30 deletions(-)

diff --git a/drivers/gpu/drm/tidss/tidss_crtc.c b/drivers/gpu/drm/tidss/tidss_crtc.c
index 94f8e3178df5..0e08d2242c90 100644
--- a/drivers/gpu/drm/tidss/tidss_crtc.c
+++ b/drivers/gpu/drm/tidss/tidss_crtc.c
@@ -130,7 +130,7 @@ static void tidss_crtc_position_planes(struct tidss_device *tidss,
 	    !to_tidss_crtc_state(cstate)->plane_pos_changed)
 		return;
 
-	for (layer = 0; layer < tidss->feat->num_planes; layer++) {
+	for (layer = 0; layer < tidss->num_planes ; layer++) {
 		struct drm_plane_state *pstate;
 		struct drm_plane *plane;
 		bool layer_active = false;
@@ -271,9 +271,12 @@ static void tidss_crtc_atomic_disable(struct drm_crtc *crtc,
 	 * another videoport, the DSS will report sync lost issues. Disable all
 	 * the layers here as a work-around.
 	 */
-	for (u32 layer = 0; layer < tidss->feat->num_planes; layer++)
+	for (u32 layer = 0; layer < tidss->feat->num_planes; layer++) {
+		if (!tidss->feat->vid_info[layer].is_present)
+			continue;
 		dispc_ovr_enable_layer(tidss->dispc, tcrtc->hw_videoport, layer,
 				       false);
+	}
 
 	dispc_vp_disable(tidss->dispc, tcrtc->hw_videoport);
 
diff --git a/drivers/gpu/drm/tidss/tidss_dispc.c b/drivers/gpu/drm/tidss/tidss_dispc.c
index cacb5f3d8085..9b46403dbb0c 100644
--- a/drivers/gpu/drm/tidss/tidss_dispc.c
+++ b/drivers/gpu/drm/tidss/tidss_dispc.c
@@ -104,8 +104,15 @@ const struct dispc_features dispc_k2g_feats = {
 	},
 
 	.num_planes = 1,
-	.vid_name = { "vid1" },
-	.vid_lite = { false },
+
+	.vid_info = {
+		{
+			.vid_name = "vid1",
+			.vid_lite = false,
+			.is_present = true,
+		},
+	},
+
 	.vid_order = { 0 },
 };
 
@@ -180,9 +187,20 @@ const struct dispc_features dispc_am65x_feats = {
 
 	.num_planes = 2,
 	/* note: vid is plane_id 0 and vidl1 is plane_id 1 */
-	.vid_name = { "vid", "vidl1" },
-	.vid_lite = { false, true, },
-	.vid_order = { 1, 0 },
+	.vid_info = {
+		{
+			.vid_name = "vid",
+			.vid_lite = false,
+			.is_present = true,
+		},
+		{
+			.vid_name = "vidl1",
+			.vid_lite = true,
+			.is_present = true,
+		},
+	},
+
+	.vid_order = {1, 0},
 };
 
 static const u16 tidss_j721e_common_regs[DISPC_COMMON_REG_TABLE_LEN] = {
@@ -267,9 +285,32 @@ const struct dispc_features dispc_j721e_feats = {
 			.gamma_type = TIDSS_GAMMA_10BIT,
 		},
 	},
+
 	.num_planes = 4,
-	.vid_name = { "vid1", "vidl1", "vid2", "vidl2" },
-	.vid_lite = { 0, 1, 0, 1, },
+
+	.vid_info = {
+		{
+			.vid_name = "vid1",
+			.vid_lite = false,
+			.is_present = true,
+		},
+		{
+			.vid_name = "vidl1",
+			.vid_lite = true,
+			.is_present = true,
+		},
+		{
+			.vid_name = "vid2",
+			.vid_lite = false,
+			.is_present = true,
+		},
+		{
+			.vid_name = "vidl2",
+			.vid_lite = true,
+			.is_present = true,
+		},
+	},
+
 	.vid_order = { 1, 3, 0, 2 },
 };
 
@@ -316,10 +357,22 @@ const struct dispc_features dispc_am625_feats = {
 	},
 
 	.num_planes = 2,
+
 	/* note: vid is plane_id 0 and vidl1 is plane_id 1 */
-	.vid_name = { "vid", "vidl1" },
-	.vid_lite = { false, true, },
-	.vid_order = { 1, 0 },
+	.vid_info = {
+		{
+			.vid_name = "vid",
+			.vid_lite = false,
+			.is_present = true,
+		},
+		{
+			.vid_name = "vidl1",
+			.vid_lite = true,
+			.is_present = true,
+		}
+	},
+
+	.vid_order = {1, 0},
 };
 
 const struct dispc_features dispc_am62a7_feats = {
@@ -370,10 +423,21 @@ const struct dispc_features dispc_am62a7_feats = {
 	},
 
 	.num_planes = 2,
-	/* note: vid is plane_id 0 and vidl1 is plane_id 1 */
-	.vid_name = { "vid", "vidl1" },
-	.vid_lite = { false, true, },
-	.vid_order = { 1, 0 },
+
+	.vid_info = {
+		{
+			.vid_name = "vid",
+			.vid_lite = false,
+			.is_present = true,
+		},
+		{
+			.vid_name = "vidl1",
+			.vid_lite = true,
+			.is_present = true,
+		}
+	},
+
+	.vid_order = {1, 0},
 };
 
 static const u16 *dispc_common_regmap;
@@ -788,7 +852,11 @@ void dispc_k3_clear_irqstatus(struct dispc_device *dispc, dispc_irq_t clearmask)
 		if (clearmask & DSS_IRQ_VP_MASK(i))
 			dispc_k3_vp_write_irqstatus(dispc, i, clearmask);
 	}
+
 	for (i = 0; i < dispc->feat->num_planes; ++i) {
+		if (!dispc->feat->vid_info[i].is_present)
+			continue;
+
 		if (clearmask & DSS_IRQ_PLANE_MASK(i))
 			dispc_k3_vid_write_irqstatus(dispc, i, clearmask);
 	}
@@ -809,8 +877,12 @@ dispc_irq_t dispc_k3_read_and_clear_irqstatus(struct dispc_device *dispc)
 	for (i = 0; i < dispc->feat->num_vps; ++i)
 		status |= dispc_k3_vp_read_irqstatus(dispc, i);
 
-	for (i = 0; i < dispc->feat->num_planes; ++i)
+	for (i = 0; i < dispc->feat->num_planes; ++i) {
+		if (!dispc->feat->vid_info[i].is_present)
+			continue;
+
 		status |= dispc_k3_vid_read_irqstatus(dispc, i);
+	}
 
 	dispc_k3_clear_irqstatus(dispc, status);
 
@@ -825,8 +897,12 @@ static dispc_irq_t dispc_k3_read_irqenable(struct dispc_device *dispc)
 	for (i = 0; i < dispc->feat->num_vps; ++i)
 		enable |= dispc_k3_vp_read_irqenable(dispc, i);
 
-	for (i = 0; i < dispc->feat->num_planes; ++i)
+	for (i = 0; i < dispc->feat->num_planes; ++i) {
+		if (!dispc->feat->vid_info[i].is_present)
+			continue;
+
 		enable |= dispc_k3_vid_read_irqenable(dispc, i);
+	}
 
 	return enable;
 }
@@ -849,9 +925,12 @@ static void dispc_k3_set_irqenable(struct dispc_device *dispc,
 			main_enable |= BIT(i);		/* VP IRQ */
 		else
 			main_disable |= BIT(i);		/* VP IRQ */
+
 	}
 
 	for (i = 0; i < dispc->feat->num_planes; ++i) {
+		if (!dispc->feat->vid_info[i].is_present)
+			continue;
 		dispc_k3_vid_set_irqenable(dispc, i, mask);
 		if (mask & DSS_IRQ_PLANE_MASK(i))
 			main_enable |= BIT(i + 4);	/* VID IRQ */
@@ -861,7 +940,6 @@ static void dispc_k3_set_irqenable(struct dispc_device *dispc,
 
 	if (main_enable)
 		dispc_write(dispc, DISPC_IRQENABLE_SET, main_enable);
-
 	if (main_disable)
 		dispc_write(dispc, DISPC_IRQENABLE_CLR, main_disable);
 
@@ -2025,7 +2103,7 @@ int dispc_plane_check(struct dispc_device *dispc, u32 hw_plane,
 		      const struct drm_plane_state *state,
 		      u32 hw_videoport)
 {
-	bool lite = dispc->feat->vid_lite[hw_plane];
+	bool lite = dispc->feat->vid_info[hw_plane].vid_lite;
 	u32 fourcc = state->fb->format->format;
 	bool need_scaling = state->src_w >> 16 != state->crtc_w ||
 		state->src_h >> 16 != state->crtc_h;
@@ -2096,7 +2174,7 @@ void dispc_plane_setup(struct dispc_device *dispc, u32 hw_plane,
 		       const struct drm_plane_state *state,
 		       u32 hw_videoport)
 {
-	bool lite = dispc->feat->vid_lite[hw_plane];
+	bool lite = dispc->feat->vid_info[hw_plane].vid_lite;
 	u32 fourcc = state->fb->format->format;
 	u16 cpp = state->fb->format->cpp[0];
 	u32 fb_width = state->fb->pitches[0] / cpp;
@@ -2211,6 +2289,9 @@ static void dispc_k2g_plane_init(struct dispc_device *dispc)
 	REG_FLD_MOD(dispc, DISPC_GLOBAL_MFLAG_ATTRIBUTE, 0, 6, 6);
 
 	for (hw_plane = 0; hw_plane < dispc->feat->num_planes; hw_plane++) {
+		if (!dispc->feat->vid_info[hw_plane].is_present)
+			continue;
+
 		u32 size = dispc_vid_get_fifo_size(dispc, hw_plane);
 		u32 thr_low, thr_high;
 		u32 mflag_low, mflag_high;
@@ -2226,7 +2307,7 @@ static void dispc_k2g_plane_init(struct dispc_device *dispc)
 
 		dev_dbg(dispc->dev,
 			"%s: bufsize %u, buf_threshold %u/%u, mflag threshold %u/%u preload %u\n",
-			dispc->feat->vid_name[hw_plane],
+			dispc->feat->vid_info[hw_plane].vid_name,
 			size,
 			thr_high, thr_low,
 			mflag_high, mflag_low,
@@ -2266,6 +2347,9 @@ static void dispc_k3_plane_init(struct dispc_device *dispc)
 	REG_FLD_MOD(dispc, DISPC_GLOBAL_MFLAG_ATTRIBUTE, 0, 6, 6);
 
 	for (hw_plane = 0; hw_plane < dispc->feat->num_planes; hw_plane++) {
+		if (!dispc->feat->vid_info[hw_plane].is_present)
+			continue;
+
 		u32 size = dispc_vid_get_fifo_size(dispc, hw_plane);
 		u32 thr_low, thr_high;
 		u32 mflag_low, mflag_high;
@@ -2281,7 +2365,7 @@ static void dispc_k3_plane_init(struct dispc_device *dispc)
 
 		dev_dbg(dispc->dev,
 			"%s: bufsize %u, buf_threshold %u/%u, mflag threshold %u/%u preload %u\n",
-			dispc->feat->vid_name[hw_plane],
+			dispc->feat->vid_info[hw_plane].vid_name,
 			size,
 			thr_high, thr_low,
 			mflag_high, mflag_low,
@@ -2899,8 +2983,11 @@ int dispc_init(struct tidss_device *tidss)
 		return r;
 
 	for (i = 0; i < dispc->feat->num_planes; i++) {
-		r = dispc_iomap_resource(pdev, dispc->feat->vid_name[i],
-					 &dispc->base_vid[i]);
+		if (dispc->feat->vid_info[i].is_present) {
+			r = dispc_iomap_resource(pdev, dispc->feat->vid_info[i].vid_name,
+						 &dispc->base_vid[i]);
+		}
+
 		if (r)
 			return r;
 	}
diff --git a/drivers/gpu/drm/tidss/tidss_dispc.h b/drivers/gpu/drm/tidss/tidss_dispc.h
index 086327d51a90..f1755e031348 100644
--- a/drivers/gpu/drm/tidss/tidss_dispc.h
+++ b/drivers/gpu/drm/tidss/tidss_dispc.h
@@ -46,6 +46,12 @@ struct dispc_features_scaling {
 	u32 xinc_max;
 };
 
+struct plane_info {
+	const char *vid_name; /* Should match dt reg names */
+	bool vid_lite;
+	bool is_present;
+};
+
 struct dispc_errata {
 	bool i2000; /* DSS Does Not Support YUV Pixel Data Formats */
 };
@@ -83,8 +89,7 @@ struct dispc_features {
 	const enum dispc_vp_bus_type vp_bus_type[TIDSS_MAX_PORTS];
 	struct tidss_vp_feat vp_feat;
 	u32 num_planes;
-	const char *vid_name[TIDSS_MAX_PLANES]; /* Should match dt reg names */
-	bool vid_lite[TIDSS_MAX_PLANES];
+	struct plane_info vid_info[TIDSS_MAX_PLANES];
 	u32 vid_order[TIDSS_MAX_PLANES];
 };
 
diff --git a/drivers/gpu/drm/tidss/tidss_irq.c b/drivers/gpu/drm/tidss/tidss_irq.c
index 5abc788781f4..dce03504d006 100644
--- a/drivers/gpu/drm/tidss/tidss_irq.c
+++ b/drivers/gpu/drm/tidss/tidss_irq.c
@@ -83,6 +83,9 @@ static irqreturn_t tidss_irq_handler(int irq, void *arg)
 		struct drm_plane *plane = tidss->planes[i];
 		struct tidss_plane *tplane = to_tidss_plane(plane);
 
+		if (!(tidss->feat->vid_info[i].is_present))
+			continue;
+
 		if (irqstatus & DSS_IRQ_PLANE_FIFO_UNDERFLOW(tplane->hw_plane_id))
 			tidss_plane_error_irq(plane, irqstatus);
 	}
@@ -122,6 +125,9 @@ int tidss_irq_install(struct drm_device *ddev, unsigned int irq)
 	}
 
 	for (unsigned int i = 0; i < tidss->num_planes; ++i) {
+		if (!tidss->feat->vid_info[i].is_present)
+			continue;
+
 		struct tidss_plane *tplane = to_tidss_plane(tidss->planes[i]);
 
 		tidss->irq_mask |= DSS_IRQ_PLANE_FIFO_UNDERFLOW(tplane->hw_plane_id);
diff --git a/drivers/gpu/drm/tidss/tidss_kms.c b/drivers/gpu/drm/tidss/tidss_kms.c
index f371518f8697..c0184c5ea23e 100644
--- a/drivers/gpu/drm/tidss/tidss_kms.c
+++ b/drivers/gpu/drm/tidss/tidss_kms.c
@@ -191,6 +191,9 @@ static int tidss_dispc_modeset_init(struct tidss_device *tidss)
 		u32 hw_plane_id = feat->vid_order[tidss->num_planes];
 		int ret;
 
+		if (!feat->vid_info[hw_plane_id].is_present)
+			continue;
+
 		tplane = tidss_plane_create(tidss, hw_plane_id,
 					    DRM_PLANE_TYPE_PRIMARY, crtc_mask,
 					    fourccs, fourccs_len);
@@ -220,15 +223,16 @@ static int tidss_dispc_modeset_init(struct tidss_device *tidss)
 	}
 
 	/* create overlay planes of the leftover planes */
-
-	while (tidss->num_planes < max_planes) {
+	for (i = tidss->num_planes; i < max_planes ; i++) {
 		struct tidss_plane *tplane;
 		u32 hw_plane_id = feat->vid_order[tidss->num_planes];
 
+		if (!feat->vid_info[hw_plane_id].is_present)
+			continue;
+
 		tplane = tidss_plane_create(tidss, hw_plane_id,
 					    DRM_PLANE_TYPE_OVERLAY, crtc_mask,
 					    fourccs, fourccs_len);
-
 		if (IS_ERR(tplane)) {
 			dev_err(tidss->dev, "plane create failed\n");
 			return PTR_ERR(tplane);
-- 
2.39.1

