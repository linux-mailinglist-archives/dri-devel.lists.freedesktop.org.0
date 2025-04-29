Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13489AA0F16
	for <lists+dri-devel@lfdr.de>; Tue, 29 Apr 2025 16:37:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E47289D63;
	Tue, 29 Apr 2025 14:37:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="xtxe9l4E";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC51F89D63
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Apr 2025 14:37:19 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53TEb15i3104290
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 29 Apr 2025 09:37:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1745937421;
 bh=eu15erCyhxP3BDmNxfKy4L321siBvPUeCXFMlB/hzIM=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=xtxe9l4EZDco0tQqqDMFazyFgiWUfKqzdtMoZLCHSbND+TPmDAkrWOWNCGenAv5rb
 9yhNdr2Sg5CCzs3Ziov4CjS3XzXtM8EEqCb6mxzUHGomrEqibq+wX0bvB1Oqia1jqj
 mq7+q2+I3E5ZuTUYWl2KPVX5LTlg1/p97UAjTTFs=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53TEb1RA035794
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 29 Apr 2025 09:37:01 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 29
 Apr 2025 09:37:00 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 29 Apr 2025 09:37:00 -0500
Received: from localhost (ti.dhcp.ti.com [172.24.227.95] (may be forged))
 by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53TEb0Ql086117;
 Tue, 29 Apr 2025 09:37:00 -0500
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
Subject: [PATCH v5 2/3] drm/tidss: Update infrastructure to support K3 DSS
 cut-down versions
Date: Tue, 29 Apr 2025 20:06:55 +0530
Message-ID: <20250429143656.3252877-3-devarsht@ti.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20250429143656.3252877-1-devarsht@ti.com>
References: <20250429143656.3252877-1-devarsht@ti.com>
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

SoCs like AM62Lx support cut-down version of K3 DSS where although same
register space is supported as in other K3 DSS supported SoCs such as
AM65x, AM62x, AM62Ax but some of the resources such as planes and
corresponding register spaces are truncated.

For e.g. AM62Lx has only single VIDL pipeline supported, so corresponding
register spaces for other video pipelines need to be skipped.

To add a generic support for future SoCs where one or more video pipelines
can get truncated from the parent register space, move the video plane
related information to vid_info struct which will also have a field to
indicate hardware index of each of the available video planes, so that
driver only maps and programs those video pipes and skips the unavailable
ones.

While at it, also change the num_planes field in the features structure to
num_vid so that all places in code which use vid_info structure are
highlighted in the code.

Signed-off-by: Devarsh Thakkar <devarsht@ti.com>
---
V5:
- Use separate variable for hw_id and add it in missing places to access
  correct VID pipeline bits in common registers

V4:
- Create vid_info struct only for instantiated planes
- s/num_planes/num_vids
- s/vid_lite/is_lite
- Add hw_id member in vid_info struct and remove is_present

V2->V3:
- No change (patch introduced in V3)
 
 drivers/gpu/drm/tidss/tidss_crtc.c  |  11 +-
 drivers/gpu/drm/tidss/tidss_dispc.c | 152 +++++++++++++++++++++-------
 drivers/gpu/drm/tidss/tidss_dispc.h |  11 +-
 drivers/gpu/drm/tidss/tidss_kms.c   |   2 +-
 drivers/gpu/drm/tidss/tidss_plane.c |   2 +-
 5 files changed, 131 insertions(+), 47 deletions(-)

diff --git a/drivers/gpu/drm/tidss/tidss_crtc.c b/drivers/gpu/drm/tidss/tidss_crtc.c
index 94f8e3178df5..c555f6717e7d 100644
--- a/drivers/gpu/drm/tidss/tidss_crtc.c
+++ b/drivers/gpu/drm/tidss/tidss_crtc.c
@@ -130,7 +130,7 @@ static void tidss_crtc_position_planes(struct tidss_device *tidss,
 	    !to_tidss_crtc_state(cstate)->plane_pos_changed)
 		return;
 
-	for (layer = 0; layer < tidss->feat->num_planes; layer++) {
+	for (layer = 0; layer < tidss->feat->num_vids ; layer++) {
 		struct drm_plane_state *pstate;
 		struct drm_plane *plane;
 		bool layer_active = false;
@@ -271,9 +271,12 @@ static void tidss_crtc_atomic_disable(struct drm_crtc *crtc,
 	 * another videoport, the DSS will report sync lost issues. Disable all
 	 * the layers here as a work-around.
 	 */
-	for (u32 layer = 0; layer < tidss->feat->num_planes; layer++)
-		dispc_ovr_enable_layer(tidss->dispc, tcrtc->hw_videoport, layer,
-				       false);
+	for (u32 layer = 0; layer < tidss->feat->num_vids; layer++) {
+		u32 hw_id = tidss->feat->vid_info[layer].hw_id;
+
+		dispc_ovr_enable_layer(tidss->dispc, tcrtc->hw_videoport,
+				       hw_id, false);
+	}
 
 	dispc_vp_disable(tidss->dispc, tcrtc->hw_videoport);
 
diff --git a/drivers/gpu/drm/tidss/tidss_dispc.c b/drivers/gpu/drm/tidss/tidss_dispc.c
index cacb5f3d8085..da6fe4e3ca85 100644
--- a/drivers/gpu/drm/tidss/tidss_dispc.c
+++ b/drivers/gpu/drm/tidss/tidss_dispc.c
@@ -103,9 +103,16 @@ const struct dispc_features dispc_k2g_feats = {
 		},
 	},
 
-	.num_planes = 1,
-	.vid_name = { "vid1" },
-	.vid_lite = { false },
+	.num_vids = 1,
+
+	.vid_info = {
+		{
+			.name = "vid1",
+			.is_lite = false,
+			.hw_id = 0,
+		},
+	},
+
 	.vid_order = { 0 },
 };
 
@@ -178,11 +185,22 @@ const struct dispc_features dispc_am65x_feats = {
 		},
 	},
 
-	.num_planes = 2,
+	.num_vids = 2,
 	/* note: vid is plane_id 0 and vidl1 is plane_id 1 */
-	.vid_name = { "vid", "vidl1" },
-	.vid_lite = { false, true, },
-	.vid_order = { 1, 0 },
+	.vid_info = {
+		{
+			.name = "vid",
+			.is_lite = false,
+			.hw_id = 0,
+		},
+		{
+			.name = "vidl1",
+			.is_lite = true,
+			.hw_id = 1,
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
-	.num_planes = 4,
-	.vid_name = { "vid1", "vidl1", "vid2", "vidl2" },
-	.vid_lite = { 0, 1, 0, 1, },
+
+	.num_vids = 4,
+
+	.vid_info = {
+		{
+			.name = "vid1",
+			.is_lite = false,
+			.hw_id = 0,
+		},
+		{
+			.name = "vidl1",
+			.is_lite = true,
+			.hw_id = 1,
+		},
+		{
+			.name = "vid2",
+			.is_lite = false,
+			.hw_id = 2,
+		},
+		{
+			.name = "vidl2",
+			.is_lite = true,
+			.hw_id = 3,
+		},
+	},
+
 	.vid_order = { 1, 3, 0, 2 },
 };
 
@@ -315,11 +356,23 @@ const struct dispc_features dispc_am625_feats = {
 		},
 	},
 
-	.num_planes = 2,
+	.num_vids = 2,
+
 	/* note: vid is plane_id 0 and vidl1 is plane_id 1 */
-	.vid_name = { "vid", "vidl1" },
-	.vid_lite = { false, true, },
-	.vid_order = { 1, 0 },
+	.vid_info = {
+		{
+			.name = "vid",
+			.is_lite = false,
+			.hw_id = 0,
+		},
+		{
+			.name = "vidl1",
+			.is_lite = true,
+			.hw_id = 1,
+		}
+	},
+
+	.vid_order = {1, 0},
 };
 
 const struct dispc_features dispc_am62a7_feats = {
@@ -369,11 +422,22 @@ const struct dispc_features dispc_am62a7_feats = {
 		},
 	},
 
-	.num_planes = 2,
-	/* note: vid is plane_id 0 and vidl1 is plane_id 1 */
-	.vid_name = { "vid", "vidl1" },
-	.vid_lite = { false, true, },
-	.vid_order = { 1, 0 },
+	.num_vids = 2,
+
+	.vid_info = {
+		{
+			.name = "vid",
+			.is_lite = false,
+			.hw_id = 0,
+		},
+		{
+			.name = "vidl1",
+			.is_lite = true,
+			.hw_id = 1,
+		}
+	},
+
+	.vid_order = {1, 0},
 };
 
 static const u16 *dispc_common_regmap;
@@ -788,9 +852,12 @@ void dispc_k3_clear_irqstatus(struct dispc_device *dispc, dispc_irq_t clearmask)
 		if (clearmask & DSS_IRQ_VP_MASK(i))
 			dispc_k3_vp_write_irqstatus(dispc, i, clearmask);
 	}
-	for (i = 0; i < dispc->feat->num_planes; ++i) {
+
+	for (i = 0; i < dispc->feat->num_vids; ++i) {
+		u32 hw_id = dispc->feat->vid_info[i].hw_id;
+
 		if (clearmask & DSS_IRQ_PLANE_MASK(i))
-			dispc_k3_vid_write_irqstatus(dispc, i, clearmask);
+			dispc_k3_vid_write_irqstatus(dispc, hw_id, clearmask);
 	}
 
 	/* always clear the top level irqstatus */
@@ -809,8 +876,11 @@ dispc_irq_t dispc_k3_read_and_clear_irqstatus(struct dispc_device *dispc)
 	for (i = 0; i < dispc->feat->num_vps; ++i)
 		status |= dispc_k3_vp_read_irqstatus(dispc, i);
 
-	for (i = 0; i < dispc->feat->num_planes; ++i)
-		status |= dispc_k3_vid_read_irqstatus(dispc, i);
+	for (i = 0; i < dispc->feat->num_vids; ++i) {
+		u32 hw_id = dispc->feat->vid_info[i].hw_id;
+
+		status |= dispc_k3_vid_read_irqstatus(dispc, hw_id);
+	}
 
 	dispc_k3_clear_irqstatus(dispc, status);
 
@@ -825,8 +895,11 @@ static dispc_irq_t dispc_k3_read_irqenable(struct dispc_device *dispc)
 	for (i = 0; i < dispc->feat->num_vps; ++i)
 		enable |= dispc_k3_vp_read_irqenable(dispc, i);
 
-	for (i = 0; i < dispc->feat->num_planes; ++i)
-		enable |= dispc_k3_vid_read_irqenable(dispc, i);
+	for (i = 0; i < dispc->feat->num_vids; ++i) {
+		u32 hw_id = dispc->feat->vid_info[i].hw_id;
+
+		enable |= dispc_k3_vid_read_irqenable(dispc, hw_id);
+	}
 
 	return enable;
 }
@@ -849,19 +922,22 @@ static void dispc_k3_set_irqenable(struct dispc_device *dispc,
 			main_enable |= BIT(i);		/* VP IRQ */
 		else
 			main_disable |= BIT(i);		/* VP IRQ */
+
 	}
 
-	for (i = 0; i < dispc->feat->num_planes; ++i) {
-		dispc_k3_vid_set_irqenable(dispc, i, mask);
+	for (i = 0; i < dispc->feat->num_vids; ++i) {
+		u32 hw_id = dispc->feat->vid_info[i].hw_id;
+
+		dispc_k3_vid_set_irqenable(dispc, hw_id, mask);
+
 		if (mask & DSS_IRQ_PLANE_MASK(i))
-			main_enable |= BIT(i + 4);	/* VID IRQ */
+			main_enable |= BIT(hw_id + 4);	/* VID IRQ */
 		else
-			main_disable |= BIT(i + 4);	/* VID IRQ */
+			main_disable |= BIT(hw_id + 4);	/* VID IRQ */
 	}
 
 	if (main_enable)
 		dispc_write(dispc, DISPC_IRQENABLE_SET, main_enable);
-
 	if (main_disable)
 		dispc_write(dispc, DISPC_IRQENABLE_CLR, main_disable);
 
@@ -2025,7 +2101,7 @@ int dispc_plane_check(struct dispc_device *dispc, u32 hw_plane,
 		      const struct drm_plane_state *state,
 		      u32 hw_videoport)
 {
-	bool lite = dispc->feat->vid_lite[hw_plane];
+	bool lite = dispc->feat->vid_info[hw_plane].is_lite;
 	u32 fourcc = state->fb->format->format;
 	bool need_scaling = state->src_w >> 16 != state->crtc_w ||
 		state->src_h >> 16 != state->crtc_h;
@@ -2096,7 +2172,7 @@ void dispc_plane_setup(struct dispc_device *dispc, u32 hw_plane,
 		       const struct drm_plane_state *state,
 		       u32 hw_videoport)
 {
-	bool lite = dispc->feat->vid_lite[hw_plane];
+	bool lite = dispc->feat->vid_info[hw_plane].is_lite;
 	u32 fourcc = state->fb->format->format;
 	u16 cpp = state->fb->format->cpp[0];
 	u32 fb_width = state->fb->pitches[0] / cpp;
@@ -2210,7 +2286,7 @@ static void dispc_k2g_plane_init(struct dispc_device *dispc)
 	/* MFLAG_START = MFLAGNORMALSTARTMODE */
 	REG_FLD_MOD(dispc, DISPC_GLOBAL_MFLAG_ATTRIBUTE, 0, 6, 6);
 
-	for (hw_plane = 0; hw_plane < dispc->feat->num_planes; hw_plane++) {
+	for (hw_plane = 0; hw_plane < dispc->feat->num_vids; hw_plane++) {
 		u32 size = dispc_vid_get_fifo_size(dispc, hw_plane);
 		u32 thr_low, thr_high;
 		u32 mflag_low, mflag_high;
@@ -2226,7 +2302,7 @@ static void dispc_k2g_plane_init(struct dispc_device *dispc)
 
 		dev_dbg(dispc->dev,
 			"%s: bufsize %u, buf_threshold %u/%u, mflag threshold %u/%u preload %u\n",
-			dispc->feat->vid_name[hw_plane],
+			dispc->feat->vid_info[hw_plane].name,
 			size,
 			thr_high, thr_low,
 			mflag_high, mflag_low,
@@ -2265,7 +2341,7 @@ static void dispc_k3_plane_init(struct dispc_device *dispc)
 	/* MFLAG_START = MFLAGNORMALSTARTMODE */
 	REG_FLD_MOD(dispc, DISPC_GLOBAL_MFLAG_ATTRIBUTE, 0, 6, 6);
 
-	for (hw_plane = 0; hw_plane < dispc->feat->num_planes; hw_plane++) {
+	for (hw_plane = 0; hw_plane < dispc->feat->num_vids; hw_plane++) {
 		u32 size = dispc_vid_get_fifo_size(dispc, hw_plane);
 		u32 thr_low, thr_high;
 		u32 mflag_low, mflag_high;
@@ -2281,7 +2357,7 @@ static void dispc_k3_plane_init(struct dispc_device *dispc)
 
 		dev_dbg(dispc->dev,
 			"%s: bufsize %u, buf_threshold %u/%u, mflag threshold %u/%u preload %u\n",
-			dispc->feat->vid_name[hw_plane],
+			dispc->feat->vid_info[hw_plane].name,
 			size,
 			thr_high, thr_low,
 			mflag_high, mflag_low,
@@ -2898,8 +2974,8 @@ int dispc_init(struct tidss_device *tidss)
 	if (r)
 		return r;
 
-	for (i = 0; i < dispc->feat->num_planes; i++) {
-		r = dispc_iomap_resource(pdev, dispc->feat->vid_name[i],
+	for (i = 0; i < dispc->feat->num_vids; i++) {
+		r = dispc_iomap_resource(pdev, dispc->feat->vid_info[i].name,
 					 &dispc->base_vid[i]);
 		if (r)
 			return r;
diff --git a/drivers/gpu/drm/tidss/tidss_dispc.h b/drivers/gpu/drm/tidss/tidss_dispc.h
index 086327d51a90..72a0146e57d5 100644
--- a/drivers/gpu/drm/tidss/tidss_dispc.h
+++ b/drivers/gpu/drm/tidss/tidss_dispc.h
@@ -46,6 +46,12 @@ struct dispc_features_scaling {
 	u32 xinc_max;
 };
 
+struct dispc_vid_info {
+	const char *name; /* Should match dt reg names */
+	u32 hw_id;
+	bool is_lite;
+};
+
 struct dispc_errata {
 	bool i2000; /* DSS Does Not Support YUV Pixel Data Formats */
 };
@@ -82,9 +88,8 @@ struct dispc_features {
 	const char *vpclk_name[TIDSS_MAX_PORTS]; /* Should match dt clk names */
 	const enum dispc_vp_bus_type vp_bus_type[TIDSS_MAX_PORTS];
 	struct tidss_vp_feat vp_feat;
-	u32 num_planes;
-	const char *vid_name[TIDSS_MAX_PLANES]; /* Should match dt reg names */
-	bool vid_lite[TIDSS_MAX_PLANES];
+	u32 num_vids;
+	struct dispc_vid_info vid_info[TIDSS_MAX_PLANES];
 	u32 vid_order[TIDSS_MAX_PLANES];
 };
 
diff --git a/drivers/gpu/drm/tidss/tidss_kms.c b/drivers/gpu/drm/tidss/tidss_kms.c
index f371518f8697..19432c08ec6b 100644
--- a/drivers/gpu/drm/tidss/tidss_kms.c
+++ b/drivers/gpu/drm/tidss/tidss_kms.c
@@ -115,7 +115,7 @@ static int tidss_dispc_modeset_init(struct tidss_device *tidss)
 
 	const struct dispc_features *feat = tidss->feat;
 	u32 max_vps = feat->num_vps;
-	u32 max_planes = feat->num_planes;
+	u32 max_planes = feat->num_vids;
 
 	struct pipe pipes[TIDSS_MAX_PORTS];
 	u32 num_pipes = 0;
diff --git a/drivers/gpu/drm/tidss/tidss_plane.c b/drivers/gpu/drm/tidss/tidss_plane.c
index 719412e6c346..142ae81951a0 100644
--- a/drivers/gpu/drm/tidss/tidss_plane.c
+++ b/drivers/gpu/drm/tidss/tidss_plane.c
@@ -200,7 +200,7 @@ struct tidss_plane *tidss_plane_create(struct tidss_device *tidss,
 	struct tidss_plane *tplane;
 	enum drm_plane_type type;
 	u32 possible_crtcs;
-	u32 num_planes = tidss->feat->num_planes;
+	u32 num_planes = tidss->feat->num_vids;
 	u32 color_encodings = (BIT(DRM_COLOR_YCBCR_BT601) |
 			       BIT(DRM_COLOR_YCBCR_BT709));
 	u32 color_ranges = (BIT(DRM_COLOR_YCBCR_FULL_RANGE) |
-- 
2.39.1

