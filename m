Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 921CA82EFD8
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jan 2024 14:42:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DCD610E5C0;
	Tue, 16 Jan 2024 13:42:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8153410E5A7
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jan 2024 13:42:04 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 40GDflK8027738;
 Tue, 16 Jan 2024 07:41:47 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1705412507;
 bh=wQEjH/QcMV9G0qvNPXdd2mmcbDN5IMvxwNcSdD5z1Ak=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=YA35iwEk+vmavqWfHuVj7wKgnMrup82il49UKeImKuXqRVm6EcsXEb0MMFpQUDJtV
 SMeN/7Q9pLOzSTe8deZrxu1llll9JUm0iV+8QsT+7CMXR1A7/KcU4RuPEK89DHIifH
 99ApKkd+U2C4XnfkvZYfT3FrnVy5C/nyiHbnF0lo=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 40GDfl7Z027029
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 16 Jan 2024 07:41:47 -0600
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 16
 Jan 2024 07:41:47 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 16 Jan 2024 07:41:47 -0600
Received: from localhost (ti.dhcp.ti.com [172.24.227.95] (may be forged))
 by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 40GDfk0I063352;
 Tue, 16 Jan 2024 07:41:47 -0600
From: Devarsh Thakkar <devarsht@ti.com>
To: <jyri.sarha@iki.fi>, <tomi.valkeinen@ideasonboard.com>,
 <airlied@gmail.com>, <daniel@ffwll.ch>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <robh+dt@kernel.org>,
 <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
 <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>
Subject: [RFC PATCH 2/3] drm/tidss: Add support for display sharing
Date: Tue, 16 Jan 2024 19:11:41 +0530
Message-ID: <20240116134142.2092483-3-devarsht@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240116134142.2092483-1-devarsht@ti.com>
References: <20240116134142.2092483-1-devarsht@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
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
Cc: praneeth@ti.com, j-luthra@ti.com, devarsht@ti.com, a-bhatia1@ti.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Display subsystem present in TI Keystone family of devices supports sharing
of display between multiple hosts as it provides separate register space
(common* region) for each host to programming display controller and also a
unique interrupt line for each host.

This adds support for display sharing, by allowing partitioning of
resources either at video port level or at video plane level as
described below :

1) Linux can own (i.e have write access) completely one or more of video
ports along with corresponding resources (viz. overlay managers,
video planes) used by Linux in context of those video ports.
Even if Linux is owning
these video ports it can still share this video port with a remote core
which can own one or more video planes associated with this video port.

2) Linux owns one or more of the video planes with video port
(along with corresponding overlay manager) associated with these planes
being owned and controlled by a remote core. Linux still has read-only
access to the associated video port and overlay managers so that it can
parse the settings made by remote core.

For both the cases, the resources used in context of processing core
running Linux along with ownership information are exposed by user as
part of device-tree blob and driver uses an updated feature list tailored
for this shared mode accordingly. The driver also auto-populates
matching overlay managers and output types from shared video
port list provided in device-tree blob.
In dispc_feature struct remove const access specfier for output_type
array as it is required to be updated dynamically in run-time for shared
mode.

For 2) where Linux is only owning a set of video planes with
corresponding video port and overlay manager controlled by a remote
core, separate set of CRTC callbacks are used which just latch on
to the preset mode set by remote core, thus avoiding any reconfiguration
of associated video ports, overlay managers and clocks.
For this case, it is also checked that Linux controlled video planes
don't exceed screen size set by remote core while running the display.
Display clocks and OLDI related fields are also not
populated for this scenario as remote core is owning those resources.

For 1), where Linux owns only a set of video port and associated
planes with rest of resources owned completely by remote cores,
only those set of resources are exposed to Linux and programmed using
traditional CRTC helpers and rest of video ports and associated resources
are removed from feature list accordingly.

Signed-off-by: Devarsh Thakkar <devarsht@ti.com>
---
 drivers/gpu/drm/tidss/tidss_crtc.c  | 120 ++++++++++++-
 drivers/gpu/drm/tidss/tidss_dispc.c | 254 +++++++++++++++++++++++++---
 drivers/gpu/drm/tidss/tidss_dispc.h |   2 +-
 drivers/gpu/drm/tidss/tidss_drv.c   |  33 ++--
 drivers/gpu/drm/tidss/tidss_drv.h   |   6 +
 5 files changed, 375 insertions(+), 40 deletions(-)

diff --git a/drivers/gpu/drm/tidss/tidss_crtc.c b/drivers/gpu/drm/tidss/tidss_crtc.c
index 5f838980c7a1..f6a877ff4c6c 100644
--- a/drivers/gpu/drm/tidss/tidss_crtc.c
+++ b/drivers/gpu/drm/tidss/tidss_crtc.c
@@ -31,13 +31,19 @@ static void tidss_crtc_finish_page_flip(struct tidss_crtc *tcrtc)
 	/*
 	 * New settings are taken into use at VFP, and GO bit is cleared at
 	 * the same time. This happens before the vertical blank interrupt.
-	 * So there is a small change that the driver sets GO bit after VFP, but
+	 * So there is a small chance that the driver sets GO bit after VFP, but
 	 * before vblank, and we have to check for that case here.
+	 *
+	 * For a video port shared between Linux and remote core but owned by remote core,
+	 * this is not required since Linux just attaches to mode that was preset by remote
+	 * core with which display is being shared.
 	 */
-	busy = dispc_vp_go_busy(tidss->dispc, tcrtc->hw_videoport);
-	if (busy) {
-		spin_unlock_irqrestore(&ddev->event_lock, flags);
-		return;
+	if (!tidss->shared_mode || tidss->shared_mode_owned_vps[tcrtc->hw_videoport]) {
+		busy = dispc_vp_go_busy(tidss->dispc, tcrtc->hw_videoport);
+		if (busy) {
+			spin_unlock_irqrestore(&ddev->event_lock, flags);
+			return;
+		}
 	}
 
 	event = tcrtc->event;
@@ -208,6 +214,44 @@ static void tidss_crtc_atomic_flush(struct drm_crtc *crtc,
 	spin_unlock_irqrestore(&ddev->event_lock, flags);
 }
 
+static void tidss_shared_vp_crtc_atomic_flush(struct drm_crtc *crtc,
+					      struct drm_atomic_state *state)
+{
+	struct tidss_crtc *tcrtc = to_tidss_crtc(crtc);
+	struct drm_device *ddev = crtc->dev;
+	unsigned long flags;
+
+	dev_dbg(ddev->dev,
+		"%s: %s enabled %d, needs modeset %d, event %p\n", __func__,
+		crtc->name, drm_atomic_crtc_needs_modeset(crtc->state),
+		crtc->state->enable, crtc->state->event);
+
+	/* There is nothing to do if CRTC is not going to be enabled. */
+	if (!crtc->state->enable)
+		return;
+	/*
+	 * Flush CRTC changes with go bit only if new modeset is not
+	 * coming, so CRTC is enabled trough out the commit.
+	 */
+	if (drm_atomic_crtc_needs_modeset(crtc->state))
+		return;
+
+	/* We should have event if CRTC is enabled through out this commit. */
+	if (WARN_ON(!crtc->state->event))
+		return;
+
+	WARN_ON(drm_crtc_vblank_get(crtc) != 0);
+
+	spin_lock_irqsave(&ddev->event_lock, flags);
+
+	WARN_ON(tcrtc->event);
+
+	tcrtc->event = crtc->state->event;
+	crtc->state->event = NULL;
+
+	spin_unlock_irqrestore(&ddev->event_lock, flags);
+}
+
 static void tidss_crtc_atomic_enable(struct drm_crtc *crtc,
 				     struct drm_atomic_state *state)
 {
@@ -253,6 +297,27 @@ static void tidss_crtc_atomic_enable(struct drm_crtc *crtc,
 	spin_unlock_irqrestore(&ddev->event_lock, flags);
 }
 
+static void tidss_shared_vp_crtc_atomic_enable(struct drm_crtc *crtc,
+					       struct drm_atomic_state *state)
+{
+	struct drm_device *ddev = crtc->dev;
+	unsigned long flags;
+
+	dev_dbg(ddev->dev, "%s, event %p\n", __func__, crtc->state->event);
+
+	/* Turn vertical blanking interrupt reporting on. */
+	drm_crtc_vblank_on(crtc);
+
+	spin_lock_irqsave(&ddev->event_lock, flags);
+
+	if (crtc->state->event) {
+		drm_crtc_send_vblank_event(crtc, crtc->state->event);
+		crtc->state->event = NULL;
+	}
+
+	spin_unlock_irqrestore(&ddev->event_lock, flags);
+}
+
 static void tidss_crtc_atomic_disable(struct drm_crtc *crtc,
 				      struct drm_atomic_state *state)
 {
@@ -288,6 +353,27 @@ static void tidss_crtc_atomic_disable(struct drm_crtc *crtc,
 	tidss_runtime_put(tidss);
 }
 
+static void tidss_shared_vp_crtc_atomic_disable(struct drm_crtc *crtc,
+						struct drm_atomic_state *state)
+{
+	struct tidss_crtc *tcrtc = to_tidss_crtc(crtc);
+	struct drm_device *ddev = crtc->dev;
+	unsigned long flags;
+
+	dev_dbg(ddev->dev, "%s, event %p\n", __func__, crtc->state->event);
+
+	reinit_completion(&tcrtc->framedone_completion);
+
+	spin_lock_irqsave(&ddev->event_lock, flags);
+	if (crtc->state->event) {
+		drm_crtc_send_vblank_event(crtc, crtc->state->event);
+		crtc->state->event = NULL;
+	}
+	spin_unlock_irqrestore(&ddev->event_lock, flags);
+
+	drm_crtc_vblank_off(crtc);
+}
+
 static
 enum drm_mode_status tidss_crtc_mode_valid(struct drm_crtc *crtc,
 					   const struct drm_display_mode *mode)
@@ -304,7 +390,14 @@ static const struct drm_crtc_helper_funcs tidss_crtc_helper_funcs = {
 	.atomic_flush = tidss_crtc_atomic_flush,
 	.atomic_enable = tidss_crtc_atomic_enable,
 	.atomic_disable = tidss_crtc_atomic_disable,
+	.mode_valid = tidss_crtc_mode_valid,
+};
 
+static const struct drm_crtc_helper_funcs tidss_shared_vp_crtc_helper_funcs = {
+	.atomic_check = tidss_crtc_atomic_check,
+	.atomic_flush = tidss_shared_vp_crtc_atomic_flush,
+	.atomic_enable = tidss_shared_vp_crtc_atomic_enable,
+	.atomic_disable = tidss_shared_vp_crtc_atomic_disable,
 	.mode_valid = tidss_crtc_mode_valid,
 };
 
@@ -406,6 +499,10 @@ struct tidss_crtc *tidss_crtc_create(struct tidss_device *tidss,
 	bool has_ctm = tidss->feat->vp_feat.color.has_ctm;
 	int ret;
 
+	dev_dbg(tidss->dev, "%s: tidss->shared_mode: %d tidss->shared_mode_owned_vps[%d] = %d\n",
+		__func__, tidss->shared_mode, hw_videoport,
+		tidss->shared_mode_owned_vps[hw_videoport]);
+
 	tcrtc = kzalloc(sizeof(*tcrtc), GFP_KERNEL);
 	if (!tcrtc)
 		return ERR_PTR(-ENOMEM);
@@ -422,8 +519,17 @@ struct tidss_crtc *tidss_crtc_create(struct tidss_device *tidss,
 		return ERR_PTR(ret);
 	}
 
-	drm_crtc_helper_add(crtc, &tidss_crtc_helper_funcs);
-
+	/* Use shared video port CRTC helpers which don't access associated
+	 * video port and overlay register spaces when Linux is not owning the
+	 * video port.
+	 */
+	if (tidss->shared_mode && !tidss->shared_mode_owned_vps[hw_videoport]) {
+		drm_crtc_helper_add(crtc, &tidss_shared_vp_crtc_helper_funcs);
+		dev_dbg(tidss->dev, "%s: vp%d is being shared with Linux\n", __func__,
+			hw_videoport + 1);
+	} else {
+		drm_crtc_helper_add(crtc, &tidss_crtc_helper_funcs);
+	}
 	/*
 	 * The dispc gamma functions adapt to what ever size we ask
 	 * from it no matter what HW supports. X-server assumes 256
diff --git a/drivers/gpu/drm/tidss/tidss_dispc.c b/drivers/gpu/drm/tidss/tidss_dispc.c
index 1ad711f8d2a8..35a82198629f 100644
--- a/drivers/gpu/drm/tidss/tidss_dispc.c
+++ b/drivers/gpu/drm/tidss/tidss_dispc.c
@@ -273,6 +273,18 @@ const struct dispc_features dispc_j721e_feats = {
 	.vid_order = { 1, 3, 0, 2 },
 };
 
+static const u16 tidss_am62_common1_regs[DISPC_COMMON_REG_TABLE_LEN] = {
+	[DISPC_IRQ_EOI_OFF] =			0x24,
+	[DISPC_IRQSTATUS_RAW_OFF] =		0x28,
+	[DISPC_IRQSTATUS_OFF] =			0x2c,
+	[DISPC_IRQENABLE_SET_OFF] =		0x30,
+	[DISPC_IRQENABLE_CLR_OFF] =		0x40,
+	[DISPC_VID_IRQENABLE_OFF] =		0x44,
+	[DISPC_VID_IRQSTATUS_OFF] =		0x58,
+	[DISPC_VP_IRQENABLE_OFF] =		0x70,
+	[DISPC_VP_IRQSTATUS_OFF] =		0x7c,
+};
+
 const struct dispc_features dispc_am625_feats = {
 	.max_pclk_khz = {
 		[DISPC_VP_DPI] = 165000,
@@ -1228,6 +1240,22 @@ enum drm_mode_status dispc_vp_mode_valid(struct dispc_device *dispc,
 
 	max_pclk = dispc->feat->max_pclk_khz[bus_type];
 
+	/*
+	 * For shared mode, with remote core driving the video port, make sure that Linux
+	 * controlled primary plane doesn't exceed video port screen size set by remote core
+	 */
+	if (dispc->tidss->shared_mode && !dispc->tidss->shared_mode_owned_vps[hw_videoport]) {
+		int vp_hdisplay = VP_REG_GET(dispc, hw_videoport, DISPC_VP_SIZE_SCREEN, 11, 0) + 1;
+		int vp_vdisplay = VP_REG_GET(dispc, hw_videoport, DISPC_VP_SIZE_SCREEN, 27, 16) + 1;
+
+		if (mode->hdisplay > vp_hdisplay ||
+		    mode->vdisplay > vp_vdisplay) {
+			dev_err(dispc->dev, "%dx%d exceeds VP screen size %dx%d in shared mode\n",
+				mode->hdisplay, mode->vdisplay, vp_hdisplay, vp_vdisplay);
+			return MODE_BAD;
+		}
+	}
+
 	if (WARN_ON(max_pclk == 0))
 		return MODE_BAD;
 
@@ -1276,15 +1304,18 @@ enum drm_mode_status dispc_vp_mode_valid(struct dispc_device *dispc,
 		return MODE_BAD_VVALUE;
 
 	if (dispc->memory_bandwidth_limit) {
-		const unsigned int bpp = 4;
-		u64 bandwidth;
+		if (!dispc->tidss->shared_mode ||
+		    dispc->tidss->shared_mode_owned_vps[hw_videoport]) {
+			const unsigned int bpp = 4;
+			u64 bandwidth;
 
-		bandwidth = 1000 * mode->clock;
-		bandwidth = bandwidth * mode->hdisplay * mode->vdisplay * bpp;
-		bandwidth = div_u64(bandwidth, mode->htotal * mode->vtotal);
+			bandwidth = 1000 * mode->clock;
+			bandwidth = bandwidth * mode->hdisplay * mode->vdisplay * bpp;
+			bandwidth = div_u64(bandwidth, mode->htotal * mode->vtotal);
 
-		if (dispc->memory_bandwidth_limit < bandwidth)
-			return MODE_BAD;
+			if (dispc->memory_bandwidth_limit < bandwidth)
+				return MODE_BAD;
+		}
 	}
 
 	return MODE_OK;
@@ -2655,6 +2686,147 @@ static void dispc_vp_set_color_mgmt(struct dispc_device *dispc,
 		dispc_k3_vp_set_ctm(dispc, hw_videoport, ctm);
 }
 
+static int get_vp_idx_from_vp(const char *vp_name)
+{
+	u32 vp_idx;
+
+	if (!strcmp("vp1", vp_name))
+		vp_idx = 0;
+	else if (!strcmp("vp2", vp_name))
+		vp_idx = 1;
+	else if (!strcmp("vp3", vp_name))
+		vp_idx = 2;
+	else if (!strcmp("vp4", vp_name))
+		vp_idx = 3;
+	else
+		return 0;
+
+	return vp_idx;
+}
+
+static const char *get_ovr_from_vp(const char *vp_name)
+{
+	const char *ovr_name = NULL;
+
+	if (!strcmp("vp1", vp_name))
+		ovr_name = "ovr1";
+	else if (!strcmp("vp2", vp_name))
+		ovr_name = "ovr2";
+	else if (!strcmp("vp3", vp_name))
+		ovr_name = "ovr3";
+	else if (!strcmp("vp4", vp_name))
+		ovr_name = "ovr4";
+	else
+		return NULL;
+
+	return ovr_name;
+}
+
+static void dispc_shared_mode_update_bus_type(struct dispc_features *shared_mode_feat,
+					      struct dispc_device *dispc)
+{
+	u32 i, vp_idx;
+	int num_vps = shared_mode_feat->num_vps;
+	enum dispc_vp_bus_type vp_bus_type[TIDSS_MAX_PORTS];
+
+	memcpy((void *)vp_bus_type, (void *)shared_mode_feat->vp_bus_type,
+	       sizeof(vp_bus_type));
+	memset(shared_mode_feat->vp_bus_type, 0, sizeof(vp_bus_type));
+
+	for (i = 0; i < num_vps; i++) {
+		/*
+		 * Find corresponding vp bus type.
+		 */
+		vp_idx = get_vp_idx_from_vp(shared_mode_feat->vp_name[i]);
+		shared_mode_feat->vp_bus_type[i] = vp_bus_type[vp_idx];
+	}
+}
+
+static int dispc_update_shared_mode_features(struct dispc_features *shared_mode_feat,
+					     struct dispc_device *dispc)
+{
+	int r = 0, i = 0;
+
+	dev_dbg(dispc->dev, "Start updating dispc feature list for shared mode:\n");
+
+	/*
+	 * Start with a shallow copy from existing features and prune the list
+	 * as per what is actually made available to Linux
+	 */
+	memcpy((void *)shared_mode_feat, (void *)dispc->feat, sizeof(*shared_mode_feat));
+	shared_mode_feat->num_vps = device_property_string_array_count(dispc->dev,
+								       "ti,dss-shared-mode-vp");
+	shared_mode_feat->num_planes = device_property_string_array_count(dispc->dev,
+									  "ti,dss-shared-mode-planes");
+
+	r = device_property_read_string(dispc->dev, "ti,dss-shared-mode-common",
+					(const char **)&shared_mode_feat->common);
+	if (r) {
+		dev_err(dispc->dev, "failed to read shared video port name: %d\n", r);
+		return r;
+	}
+
+	memset(shared_mode_feat->vid_name, 0, sizeof(shared_mode_feat->vid_name));
+	r = device_property_read_string_array(dispc->dev, "ti,dss-shared-mode-planes",
+					      shared_mode_feat->vid_name, TIDSS_MAX_PLANES);
+	if (r < 0) {
+		dev_err(dispc->dev, "failed to read client vid layer name: %d\n", r);
+		return r;
+	}
+
+	r = device_property_read_u32_array(dispc->dev, "ti,dss-shared-mode-vp-owned",
+					   dispc->tidss->shared_mode_owned_vps,
+					   shared_mode_feat->num_vps);
+	if (r < 0) {
+		dev_err(dispc->dev, "failed to read owned vp list: %d\n", r);
+		return r;
+	}
+
+	memset(shared_mode_feat->vp_name, 0, sizeof(shared_mode_feat->vp_name));
+	r = device_property_read_string_array(dispc->dev, "ti,dss-shared-mode-vp",
+					      shared_mode_feat->vp_name, TIDSS_MAX_PORTS);
+	if (r < 0) {
+		dev_err(dispc->dev, "failed to read shared video port name: %d\n", r);
+		return r;
+	}
+
+	memset(shared_mode_feat->vid_order, 0, sizeof(shared_mode_feat->vid_order));
+	r = device_property_read_u32_array(dispc->dev, "ti,dss-shared-mode-plane-zorder",
+					   shared_mode_feat->vid_order,
+					   shared_mode_feat->num_planes);
+	if (r < 0) {
+		dev_err(dispc->dev, "failed to read vid_order array name: %d\n", r);
+		return r;
+	}
+	memcpy((void *)shared_mode_feat->vpclk_name, (void *)shared_mode_feat->vp_name,
+	       sizeof(shared_mode_feat->vpclk_name));
+	memset(shared_mode_feat->ovr_name, 0, sizeof(shared_mode_feat->ovr_name));
+
+	for (i = 0; i < shared_mode_feat->num_vps; i++) {
+		shared_mode_feat->ovr_name[i] = get_ovr_from_vp(shared_mode_feat->vp_name[i]);
+		dev_dbg(dispc->dev, "vp[%d] = %s, ovr[%d] = %s vpclk[%d] = %s vp_owned[%d] = %d\n",
+			i,  shared_mode_feat->vp_name[i], i, shared_mode_feat->ovr_name[i], i,
+			shared_mode_feat->vpclk_name[i], i, dispc->tidss->shared_mode_owned_vps[i]);
+	}
+
+	for (i = 0; i < shared_mode_feat->num_planes; i++) {
+		if (!strncmp("vidl", shared_mode_feat->vid_name[i], 4))
+			shared_mode_feat->vid_lite[i] = true;
+		dev_dbg(dispc->dev, "vid[%d] = %s, vid_order[%d] = %u vid_lite[%d] = %u\n", i,
+			shared_mode_feat->vid_name[i], i, shared_mode_feat->vid_order[i], i,
+			shared_mode_feat->vid_lite[i]);
+	}
+
+	if (!strcmp(shared_mode_feat->common, "common1"))
+		shared_mode_feat->common_regs = tidss_am62_common1_regs;
+
+	dev_dbg(dispc->dev, "common : %s\n", shared_mode_feat->common);
+	dispc_shared_mode_update_bus_type(shared_mode_feat, dispc);
+	dev_dbg(dispc->dev, "Feature list updated for shared mode\n");
+
+	return 0;
+}
+
 void dispc_vp_setup(struct dispc_device *dispc, u32 hw_videoport,
 		    const struct drm_crtc_state *state, bool newmodeset)
 {
@@ -2662,6 +2834,16 @@ void dispc_vp_setup(struct dispc_device *dispc, u32 hw_videoport,
 	dispc_vp_set_color_mgmt(dispc, hw_videoport, state, newmodeset);
 }
 
+static bool dispc_owns_global_common_in_shared_mode(struct dispc_device *dispc)
+{
+	if ((!strcmp(dispc->feat->common, "common") ||
+	     !strcmp(dispc->feat->common, "common_m")) &&
+	     dispc->tidss->shared_mode)
+		return true;
+	else
+		return false;
+}
+
 int dispc_runtime_suspend(struct dispc_device *dispc)
 {
 	dev_dbg(dispc->dev, "suspend\n");
@@ -2846,6 +3028,7 @@ int dispc_init(struct tidss_device *tidss)
 	struct platform_device *pdev = to_platform_device(dev);
 	struct dispc_device *dispc;
 	const struct dispc_features *feat;
+	struct dispc_features *shared_mode_feat;
 	unsigned int i, num_fourccs;
 	int r = 0;
 
@@ -2887,6 +3070,21 @@ int dispc_init(struct tidss_device *tidss)
 
 	dispc->num_fourccs = num_fourccs;
 
+	if (tidss->shared_mode) {
+		dev_dbg(dev, "%s : DSS is being shared with remote core\n", __func__);
+		shared_mode_feat = devm_kzalloc(dev, sizeof(*shared_mode_feat), GFP_KERNEL);
+		if (!shared_mode_feat)
+			return -ENOMEM;
+
+		r = dispc_update_shared_mode_features(shared_mode_feat, dispc);
+		if (r)
+			return r;
+
+		tidss->feat = (const struct dispc_features *)shared_mode_feat;
+		feat = tidss->feat;
+		dispc->feat = feat;
+	}
+
 	dispc_common_regmap = dispc->feat->common_regs;
 
 	r = dispc_iomap_resource(pdev, dispc->feat->common,
@@ -2933,25 +3131,37 @@ int dispc_init(struct tidss_device *tidss)
 	}
 
 	if (feat->subrev == DISPC_AM65X) {
-		r = dispc_init_am65x_oldi_io_ctrl(dev, dispc);
-		if (r)
-			return r;
+		/*
+		 * For shared mode, Initialize the OLDI IO control only if we own
+		 * the OLDI Tx ports
+		 */
+		if (!tidss->shared_mode || tidss->shared_mode_own_oldi) {
+			r = dispc_init_am65x_oldi_io_ctrl(dev, dispc);
+			if (r)
+				return r;
+		}
 	}
 
-	dispc->fclk = devm_clk_get(dev, "fck");
-	if (IS_ERR(dispc->fclk)) {
-		dev_err(dev, "%s: Failed to get fclk: %ld\n",
-			__func__, PTR_ERR(dispc->fclk));
-		return PTR_ERR(dispc->fclk);
-	}
-	dev_dbg(dev, "DSS fclk %lu Hz\n", clk_get_rate(dispc->fclk));
+	/*
+	 * For shared mode, Initialize the hardware and clocking only if processing core running
+	 * Linux has ownership of DSS global register space
+	 */
+	if (!tidss->shared_mode || dispc_owns_global_common_in_shared_mode(dispc)) {
+		dispc->fclk = devm_clk_get(dev, "fck");
+		if (IS_ERR(dispc->fclk)) {
+			dev_err(dev, "%s: Failed to get fclk: %ld\n",
+				__func__, PTR_ERR(dispc->fclk));
+			return PTR_ERR(dispc->fclk);
+		}
+		dev_dbg(dev, "DSS fclk %lu Hz\n", clk_get_rate(dispc->fclk));
 
-	of_property_read_u32(dispc->dev->of_node, "max-memory-bandwidth",
-			     &dispc->memory_bandwidth_limit);
+		of_property_read_u32(dispc->dev->of_node, "max-memory-bandwidth",
+				     &dispc->memory_bandwidth_limit);
 
-	r = dispc_init_hw(dispc);
-	if (r)
-		return r;
+		r = dispc_init_hw(dispc);
+		if (r)
+			return r;
+	}
 
 	tidss->dispc = dispc;
 
diff --git a/drivers/gpu/drm/tidss/tidss_dispc.h b/drivers/gpu/drm/tidss/tidss_dispc.h
index 086327d51a90..368a39941b34 100644
--- a/drivers/gpu/drm/tidss/tidss_dispc.h
+++ b/drivers/gpu/drm/tidss/tidss_dispc.h
@@ -80,7 +80,7 @@ struct dispc_features {
 	const char *vp_name[TIDSS_MAX_PORTS]; /* Should match dt reg names */
 	const char *ovr_name[TIDSS_MAX_PORTS]; /* Should match dt reg names */
 	const char *vpclk_name[TIDSS_MAX_PORTS]; /* Should match dt clk names */
-	const enum dispc_vp_bus_type vp_bus_type[TIDSS_MAX_PORTS];
+	enum dispc_vp_bus_type vp_bus_type[TIDSS_MAX_PORTS];
 	struct tidss_vp_feat vp_feat;
 	u32 num_planes;
 	const char *vid_name[TIDSS_MAX_PLANES]; /* Should match dt reg names */
diff --git a/drivers/gpu/drm/tidss/tidss_drv.c b/drivers/gpu/drm/tidss/tidss_drv.c
index d15f836dca95..141481635578 100644
--- a/drivers/gpu/drm/tidss/tidss_drv.c
+++ b/drivers/gpu/drm/tidss/tidss_drv.c
@@ -32,6 +32,10 @@ int tidss_runtime_get(struct tidss_device *tidss)
 
 	dev_dbg(tidss->dev, "%s\n", __func__);
 
+	/* No PM in display sharing mode */
+	if (tidss->shared_mode)
+		return 0;
+
 	r = pm_runtime_resume_and_get(tidss->dev);
 	WARN_ON(r < 0);
 	return r;
@@ -43,6 +47,9 @@ void tidss_runtime_put(struct tidss_device *tidss)
 
 	dev_dbg(tidss->dev, "%s\n", __func__);
 
+	if (tidss->shared_mode)
+		return;
+
 	pm_runtime_mark_last_busy(tidss->dev);
 
 	r = pm_runtime_put_autosuspend(tidss->dev);
@@ -140,21 +147,23 @@ static int tidss_probe(struct platform_device *pdev)
 
 	spin_lock_init(&tidss->wait_lock);
 
+	tidss->shared_mode = device_property_read_bool(dev, "ti,dss-shared-mode");
 	ret = dispc_init(tidss);
 	if (ret) {
 		dev_err(dev, "failed to initialize dispc: %d\n", ret);
 		return ret;
 	}
 
-	pm_runtime_enable(dev);
-
-	pm_runtime_set_autosuspend_delay(dev, 1000);
-	pm_runtime_use_autosuspend(dev);
+	if (!tidss->shared_mode) {
+		pm_runtime_enable(dev);
+		pm_runtime_set_autosuspend_delay(dev, 1000);
+		pm_runtime_use_autosuspend(dev);
 
 #ifndef CONFIG_PM
-	/* If we don't have PM, we need to call resume manually */
-	dispc_runtime_resume(tidss->dispc);
+		/* If we don't have PM, we need to call resume manually */
+		dispc_runtime_resume(tidss->dispc);
 #endif
+	}
 
 	ret = tidss_modeset_init(tidss);
 	if (ret < 0) {
@@ -196,6 +205,8 @@ static int tidss_probe(struct platform_device *pdev)
 	tidss_irq_uninstall(ddev);
 
 err_runtime_suspend:
+	if (tidss->shared_mode)
+		return ret;
 #ifndef CONFIG_PM
 	dispc_runtime_suspend(tidss->dispc);
 #endif
@@ -219,12 +230,14 @@ static void tidss_remove(struct platform_device *pdev)
 
 	tidss_irq_uninstall(ddev);
 
+	if (!tidss->shared_mode) {
 #ifndef CONFIG_PM
-	/* If we don't have PM, we need to call suspend manually */
-	dispc_runtime_suspend(tidss->dispc);
+		/* If we don't have PM, we need to call suspend manually */
+		dispc_runtime_suspend(tidss->dispc);
 #endif
-	pm_runtime_dont_use_autosuspend(dev);
-	pm_runtime_disable(dev);
+		pm_runtime_dont_use_autosuspend(dev);
+		pm_runtime_disable(dev);
+	}
 
 	/* devm allocated dispc goes away with the dev so mark it NULL */
 	dispc_remove(tidss);
diff --git a/drivers/gpu/drm/tidss/tidss_drv.h b/drivers/gpu/drm/tidss/tidss_drv.h
index d7f27b0b0315..68d53c70651d 100644
--- a/drivers/gpu/drm/tidss/tidss_drv.h
+++ b/drivers/gpu/drm/tidss/tidss_drv.h
@@ -31,6 +31,12 @@ struct tidss_device {
 
 	spinlock_t wait_lock;	/* protects the irq masks */
 	dispc_irq_t irq_mask;	/* enabled irqs in addition to wait_list */
+
+	bool shared_mode; /* DSS resources shared between remote core and Linux */
+
+	/* 1: VP owned by Linux 0: VP is owned by remote and shared with Linux */
+	u32 shared_mode_owned_vps[TIDSS_MAX_PORTS];
+	bool shared_mode_own_oldi; /* Linux needs to configure OLDI in shared mode */
 };
 
 #define to_tidss(__dev) container_of(__dev, struct tidss_device, ddev)
-- 
2.34.1

