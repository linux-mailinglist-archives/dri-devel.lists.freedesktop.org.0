Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92ABFC118E0
	for <lists+dri-devel@lfdr.de>; Mon, 27 Oct 2025 22:27:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 069E610E1A0;
	Mon, 27 Oct 2025 21:27:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="XzKwNxAO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E27F510E19B
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 21:27:06 +0000 (UTC)
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
 by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 59RLQd7m2490420;
 Mon, 27 Oct 2025 16:26:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1761600399;
 bh=9iqKGNULG93Mahxgc9Y04ieslV3U/KXOSXDAHgNKDxc=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=XzKwNxAOaMHEmlps6sbqGPpCsgovMFEbCLYGLb4WFLbIwAhiI9l09FnOgiuu8reUr
 EBSdY7/Vej4okIN9lZ1KjN1mIefDRtS4IDxaZsaT+R4Ayb36+Vh4E6x3mKcA1kjXS0
 Yc5Pv2077IefkRQ5pZ4spRQHfBMvl22/zbSUmi/s=
Received: from DLEE204.ent.ti.com (dlee204.ent.ti.com [157.170.170.84])
 by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 59RLQdQX1491705
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 27 Oct 2025 16:26:39 -0500
Received: from DLEE201.ent.ti.com (157.170.170.76) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 27 Oct
 2025 16:26:39 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE201.ent.ti.com
 (157.170.170.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 27 Oct 2025 16:26:39 -0500
Received: from a0512632.dhcp.ti.com (a0512632.dhcp.ti.com [172.24.233.20])
 by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 59RLQP5m1301370;
 Mon, 27 Oct 2025 16:26:35 -0500
From: Swamil Jain <s-jain1@ti.com>
To: <aradhya.bhatia@linux.dev>, <devarsht@ti.com>, <mripard@kernel.org>,
 <tomi.valkeinen@ideasonboard.com>, <jyri.sarha@iki.fi>,
 <maarten.lankhorst@linux.intel.com>, <simona@ffwll.ch>,
 <airlied@gmail.com>, <tzimmermann@suse.de>, <h-shenoy@ti.com>
CC: <praneeth@ti.com>, <u-kumar1@ti.com>, <vigneshr@ti.com>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <s-jain1@ti.com>
Subject: [PATCH v7 2/2] drm/tidss: Move OLDI mode validation to OLDI bridge
 mode_valid hook
Date: Tue, 28 Oct 2025 02:56:24 +0530
Message-ID: <20251027212624.359235-3-s-jain1@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251027212624.359235-1-s-jain1@ti.com>
References: <20251027212624.359235-1-s-jain1@ti.com>
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

From: Jayesh Choudhary <j-choudhary@ti.com>

After integrating OLDI support[0], it is necessary to identify which VP
instances use OLDI, since the OLDI driver owns the video port clock
(as a serial clock). Clock operations on these VPs must be delegated to
the OLDI driver, not handled by the TIDSS driver. This issue also
emerged in upstream discussions when DSI-related clock management was
attempted in the TIDSS driver[1].

To address this, add an 'is_ext_vp_clk' array to the 'tidss_device'
structure, marking a VP as 'true' during 'tidss_oldi_init()' and as
'false' during 'tidss_oldi_deinit()'. TIDSS then uses 'is_ext_vp_clk'
to skip clock validation checks in 'dispc_vp_mode_valid()' for VPs
under OLDI control.

Since OLDI uses the DSS VP clock directly as a serial interface and
manages its own rate, mode validation should be implemented in the OLDI
bridge's 'mode_valid' hook. This patch adds that logic, ensuring proper
delegation and avoiding spurious clock handling in the TIDSS driver.

[0]: https://lore.kernel.org/all/20250528122544.817829-1-aradhya.bhatia@linux.dev/
[1]: https://lore.kernel.org/all/DA6TT575Z82D.3MPK8HG5GRL8U@kernel.org/

Fixes: 7246e0929945 ("drm/tidss: Add OLDI bridge support")
Tested-by: Michael Walle <mwalle@kernel.org>
Reviewed-by: Devarsh Thakkar <devarsht@ti.com>
Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
Signed-off-by: Swamil Jain <s-jain1@ti.com>
---
 drivers/gpu/drm/tidss/tidss_dispc.c |  2 ++
 drivers/gpu/drm/tidss/tidss_drv.h   |  2 ++
 drivers/gpu/drm/tidss/tidss_oldi.c  | 21 +++++++++++++++++++++
 3 files changed, 25 insertions(+)

diff --git a/drivers/gpu/drm/tidss/tidss_dispc.c b/drivers/gpu/drm/tidss/tidss_dispc.c
index 07731b02490f..0c3337a7b163 100644
--- a/drivers/gpu/drm/tidss/tidss_dispc.c
+++ b/drivers/gpu/drm/tidss/tidss_dispc.c
@@ -1315,6 +1315,8 @@ static int check_pixel_clock(struct dispc_device *dispc,
 {
 	unsigned long round_clock;
 
+	if (dispc->tidss->is_ext_vp_clk[hw_videoport])
+		return 0;
 	round_clock = clk_round_rate(dispc->vp_clk[hw_videoport], clock);
 	/*
 	 * To keep the check consistent with dispc_vp_set_clk_rate(), we
diff --git a/drivers/gpu/drm/tidss/tidss_drv.h b/drivers/gpu/drm/tidss/tidss_drv.h
index 84454a4855d1..e1c1f41d8b4b 100644
--- a/drivers/gpu/drm/tidss/tidss_drv.h
+++ b/drivers/gpu/drm/tidss/tidss_drv.h
@@ -24,6 +24,8 @@ struct tidss_device {
 
 	const struct dispc_features *feat;
 	struct dispc_device *dispc;
+	bool is_ext_vp_clk[TIDSS_MAX_PORTS];
+
 
 	unsigned int num_crtcs;
 	struct drm_crtc *crtcs[TIDSS_MAX_PORTS];
diff --git a/drivers/gpu/drm/tidss/tidss_oldi.c b/drivers/gpu/drm/tidss/tidss_oldi.c
index 7688251beba2..d1a5fdac93ff 100644
--- a/drivers/gpu/drm/tidss/tidss_oldi.c
+++ b/drivers/gpu/drm/tidss/tidss_oldi.c
@@ -309,6 +309,24 @@ static u32 *tidss_oldi_atomic_get_input_bus_fmts(struct drm_bridge *bridge,
 	return input_fmts;
 }
 
+static enum drm_mode_status
+tidss_oldi_mode_valid(struct drm_bridge *bridge,
+		      const struct drm_display_info *info,
+		      const struct drm_display_mode *mode)
+{
+	struct tidss_oldi *oldi = drm_bridge_to_tidss_oldi(bridge);
+	unsigned long round_clock;
+
+	round_clock = clk_round_rate(oldi->serial, mode->clock * 7 * 1000);
+	/*
+	 * To keep the check consistent with dispc_vp_set_clk_rate(),
+	 * we use the same 5% check here.
+	 */
+	if (dispc_pclk_diff(mode->clock * 7 * 1000, round_clock) > 5)
+		return -EINVAL;
+	return 0;
+}
+
 static const struct drm_bridge_funcs tidss_oldi_bridge_funcs = {
 	.attach	= tidss_oldi_bridge_attach,
 	.atomic_pre_enable = tidss_oldi_atomic_pre_enable,
@@ -317,6 +335,7 @@ static const struct drm_bridge_funcs tidss_oldi_bridge_funcs = {
 	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
 	.atomic_reset = drm_atomic_helper_bridge_reset,
+	.mode_valid = tidss_oldi_mode_valid,
 };
 
 static int get_oldi_mode(struct device_node *oldi_tx, int *companion_instance)
@@ -430,6 +449,7 @@ void tidss_oldi_deinit(struct tidss_device *tidss)
 	for (int i = 0; i < tidss->num_oldis; i++) {
 		if (tidss->oldis[i]) {
 			drm_bridge_remove(&tidss->oldis[i]->bridge);
+			tidss->is_ext_vp_clk[tidss->oldis[i]->parent_vp] = false;
 			tidss->oldis[i] = NULL;
 		}
 	}
@@ -580,6 +600,7 @@ int tidss_oldi_init(struct tidss_device *tidss)
 		oldi->bridge.timings = &default_tidss_oldi_timings;
 
 		tidss->oldis[tidss->num_oldis++] = oldi;
+		tidss->is_ext_vp_clk[oldi->parent_vp] = true;
 		oldi->tidss = tidss;
 
 		drm_bridge_add(&oldi->bridge);
