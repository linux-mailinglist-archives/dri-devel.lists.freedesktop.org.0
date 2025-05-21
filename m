Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C04AABED1D
	for <lists+dri-devel@lfdr.de>; Wed, 21 May 2025 09:33:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC95A10E698;
	Wed, 21 May 2025 07:33:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="QbJllpgh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C09ED10E691
 for <dri-devel@lists.freedesktop.org>; Wed, 21 May 2025 07:33:09 +0000 (UTC)
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
 by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 54L7Wg7w272056;
 Wed, 21 May 2025 02:32:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1747812762;
 bh=ERFJooSfJlL9/YRWqddt2gXryT1aSLvVABRJgdqPkKk=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=QbJllpghKHT6Nhv6gjjdkIuSZ3K0T+OHsXP9QdlpGMpaA/GMxNHRE9mqAxDldrGHb
 PeNKxKawy5KNNXhV28NGt8dMGTW2r4aR9VHOzsnowUzmFN/KaUHMXeY+XQTpn1Ad/b
 fl2l5Jx6LcAtYGK5BnXJTtws9th3TCCSfwl571DU=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
 by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 54L7Wg0o551172
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
 Wed, 21 May 2025 02:32:42 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 21
 May 2025 02:32:41 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 21 May 2025 02:32:41 -0500
Received: from localhost (jayesh-hp-z2-tower-g5-workstation.dhcp.ti.com
 [10.24.72.182])
 by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 54L7WeFQ068568;
 Wed, 21 May 2025 02:32:41 -0500
From: Jayesh Choudhary <j-choudhary@ti.com>
To: <dianders@chromium.org>, <andrzej.hajda@intel.com>,
 <neil.armstrong@linaro.org>, <rfoss@kernel.org>,
 <Laurent.pinchart@ideasonboard.com>, <dri-devel@lists.freedesktop.org>,
 <tomi.valkeinen@ideasonboard.com>, <alexander.stein@ew.tq-group.com>
CC: <jonas@kwiboo.se>, <jernej.skrabec@gmail.com>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <simona@ffwll.ch>,
 <lumag@kernel.org>, <jani.nikula@intel.com>, <andy.yan@rock-chips.com>,
 <mordan@ispras.ru>, <linux@treblig.org>, <viro@zeniv.linux.org.uk>,
 <yamonkar@cadence.com>, <sjakhade@cadence.com>,
 <quentin.schulz@free-electrons.com>, <jsarha@ti.com>,
 <linux-kernel@vger.kernel.org>, <devarsht@ti.com>, <j-choudhary@ti.com>
Subject: [RFC PATCH v2 1/3] drm/bridge: cadence: cdns-mhdp8546-core: Remove
 legacy support for connector initialisation in bridge
Date: Wed, 21 May 2025 13:02:35 +0530
Message-ID: <20250521073237.366463-2-j-choudhary@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250521073237.366463-1-j-choudhary@ti.com>
References: <20250521073237.366463-1-j-choudhary@ti.com>
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

Now that we have DBANC framework, remove the connector initialisation code
as that piece of code is not called if DRM_BRIDGE_ATTACH_NO_CONNECTOR flag
is used. Only TI K3 platforms consume this driver and tidss (their display
controller) has this flag set. So this legacy support can be dropped.

Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
---
 .../drm/bridge/cadence/cdns-mhdp8546-core.c   | 186 +++---------------
 1 file changed, 25 insertions(+), 161 deletions(-)

diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
index b431e7efd1f0..66bd916c2fe9 100644
--- a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
+++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
@@ -1444,56 +1444,6 @@ static const struct drm_edid *cdns_mhdp_edid_read(struct cdns_mhdp_device *mhdp,
 	return drm_edid_read_custom(connector, cdns_mhdp_get_edid_block, mhdp);
 }
 
-static int cdns_mhdp_get_modes(struct drm_connector *connector)
-{
-	struct cdns_mhdp_device *mhdp = connector_to_mhdp(connector);
-	const struct drm_edid *drm_edid;
-	int num_modes;
-
-	if (!mhdp->plugged)
-		return 0;
-
-	drm_edid = cdns_mhdp_edid_read(mhdp, connector);
-
-	drm_edid_connector_update(connector, drm_edid);
-
-	if (!drm_edid) {
-		dev_err(mhdp->dev, "Failed to read EDID\n");
-		return 0;
-	}
-
-	num_modes = drm_edid_connector_add_modes(connector);
-	drm_edid_free(drm_edid);
-
-	/*
-	 * HACK: Warn about unsupported display formats until we deal
-	 *       with them correctly.
-	 */
-	if (connector->display_info.color_formats &&
-	    !(connector->display_info.color_formats &
-	      mhdp->display_fmt.color_format))
-		dev_warn(mhdp->dev,
-			 "%s: No supported color_format found (0x%08x)\n",
-			__func__, connector->display_info.color_formats);
-
-	if (connector->display_info.bpc &&
-	    connector->display_info.bpc < mhdp->display_fmt.bpc)
-		dev_warn(mhdp->dev, "%s: Display bpc only %d < %d\n",
-			 __func__, connector->display_info.bpc,
-			 mhdp->display_fmt.bpc);
-
-	return num_modes;
-}
-
-static int cdns_mhdp_connector_detect(struct drm_connector *conn,
-				      struct drm_modeset_acquire_ctx *ctx,
-				      bool force)
-{
-	struct cdns_mhdp_device *mhdp = connector_to_mhdp(conn);
-
-	return cdns_mhdp_detect(mhdp);
-}
-
 static u32 cdns_mhdp_get_bpp(struct cdns_mhdp_display_fmt *fmt)
 {
 	u32 bpp;
@@ -1547,114 +1497,6 @@ bool cdns_mhdp_bandwidth_ok(struct cdns_mhdp_device *mhdp,
 	return true;
 }
 
-static
-enum drm_mode_status cdns_mhdp_mode_valid(struct drm_connector *conn,
-					  const struct drm_display_mode *mode)
-{
-	struct cdns_mhdp_device *mhdp = connector_to_mhdp(conn);
-
-	mutex_lock(&mhdp->link_mutex);
-
-	if (!cdns_mhdp_bandwidth_ok(mhdp, mode, mhdp->link.num_lanes,
-				    mhdp->link.rate)) {
-		mutex_unlock(&mhdp->link_mutex);
-		return MODE_CLOCK_HIGH;
-	}
-
-	mutex_unlock(&mhdp->link_mutex);
-	return MODE_OK;
-}
-
-static int cdns_mhdp_connector_atomic_check(struct drm_connector *conn,
-					    struct drm_atomic_state *state)
-{
-	struct cdns_mhdp_device *mhdp = connector_to_mhdp(conn);
-	struct drm_connector_state *old_state, *new_state;
-	struct drm_crtc_state *crtc_state;
-	u64 old_cp, new_cp;
-
-	if (!mhdp->hdcp_supported)
-		return 0;
-
-	old_state = drm_atomic_get_old_connector_state(state, conn);
-	new_state = drm_atomic_get_new_connector_state(state, conn);
-	old_cp = old_state->content_protection;
-	new_cp = new_state->content_protection;
-
-	if (old_state->hdcp_content_type != new_state->hdcp_content_type &&
-	    new_cp != DRM_MODE_CONTENT_PROTECTION_UNDESIRED) {
-		new_state->content_protection = DRM_MODE_CONTENT_PROTECTION_DESIRED;
-		goto mode_changed;
-	}
-
-	if (!new_state->crtc) {
-		if (old_cp == DRM_MODE_CONTENT_PROTECTION_ENABLED)
-			new_state->content_protection = DRM_MODE_CONTENT_PROTECTION_DESIRED;
-		return 0;
-	}
-
-	if (old_cp == new_cp ||
-	    (old_cp == DRM_MODE_CONTENT_PROTECTION_DESIRED &&
-	     new_cp == DRM_MODE_CONTENT_PROTECTION_ENABLED))
-		return 0;
-
-mode_changed:
-	crtc_state = drm_atomic_get_new_crtc_state(state, new_state->crtc);
-	crtc_state->mode_changed = true;
-
-	return 0;
-}
-
-static const struct drm_connector_helper_funcs cdns_mhdp_conn_helper_funcs = {
-	.detect_ctx = cdns_mhdp_connector_detect,
-	.get_modes = cdns_mhdp_get_modes,
-	.mode_valid = cdns_mhdp_mode_valid,
-	.atomic_check = cdns_mhdp_connector_atomic_check,
-};
-
-static const struct drm_connector_funcs cdns_mhdp_conn_funcs = {
-	.fill_modes = drm_helper_probe_single_connector_modes,
-	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
-	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
-	.reset = drm_atomic_helper_connector_reset,
-	.destroy = drm_connector_cleanup,
-};
-
-static int cdns_mhdp_connector_init(struct cdns_mhdp_device *mhdp)
-{
-	u32 bus_format = MEDIA_BUS_FMT_RGB121212_1X36;
-	struct drm_connector *conn = &mhdp->connector;
-	struct drm_bridge *bridge = &mhdp->bridge;
-	int ret;
-
-	conn->polled = DRM_CONNECTOR_POLL_HPD;
-
-	ret = drm_connector_init(bridge->dev, conn, &cdns_mhdp_conn_funcs,
-				 DRM_MODE_CONNECTOR_DisplayPort);
-	if (ret) {
-		dev_err(mhdp->dev, "Failed to initialize connector with drm\n");
-		return ret;
-	}
-
-	drm_connector_helper_add(conn, &cdns_mhdp_conn_helper_funcs);
-
-	ret = drm_display_info_set_bus_formats(&conn->display_info,
-					       &bus_format, 1);
-	if (ret)
-		return ret;
-
-	ret = drm_connector_attach_encoder(conn, bridge->encoder);
-	if (ret) {
-		dev_err(mhdp->dev, "Failed to attach connector to encoder\n");
-		return ret;
-	}
-
-	if (mhdp->hdcp_supported)
-		ret = drm_connector_attach_content_protection_property(conn, true);
-
-	return ret;
-}
-
 static int cdns_mhdp_attach(struct drm_bridge *bridge,
 			    struct drm_encoder *encoder,
 			    enum drm_bridge_attach_flags flags)
@@ -1671,9 +1513,11 @@ static int cdns_mhdp_attach(struct drm_bridge *bridge,
 		return ret;
 
 	if (!(flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)) {
-		ret = cdns_mhdp_connector_init(mhdp);
-		if (ret)
-			goto aux_unregister;
+		ret = -EINVAL;
+		dev_err(mhdp->dev,
+			"Connector initialisation not supported in bridge_attach %d\n",
+			ret);
+		goto aux_unregister;
 	}
 
 	spin_lock(&mhdp->start_lock);
@@ -2158,6 +2002,25 @@ static const struct drm_edid *cdns_mhdp_bridge_edid_read(struct drm_bridge *brid
 	return cdns_mhdp_edid_read(mhdp, connector);
 }
 
+static enum drm_mode_status
+cdns_mhdp_bridge_mode_valid(struct drm_bridge *bridge,
+			    const struct drm_display_info *info,
+			    const struct drm_display_mode *mode)
+{
+	struct cdns_mhdp_device *mhdp = bridge_to_mhdp(bridge);
+
+	mutex_lock(&mhdp->link_mutex);
+
+	if (!cdns_mhdp_bandwidth_ok(mhdp, mode, mhdp->link.num_lanes,
+				    mhdp->link.rate)) {
+		mutex_unlock(&mhdp->link_mutex);
+		return MODE_CLOCK_HIGH;
+	}
+
+	mutex_unlock(&mhdp->link_mutex);
+	return MODE_OK;
+}
+
 static const struct drm_bridge_funcs cdns_mhdp_bridge_funcs = {
 	.atomic_enable = cdns_mhdp_atomic_enable,
 	.atomic_disable = cdns_mhdp_atomic_disable,
@@ -2172,6 +2035,7 @@ static const struct drm_bridge_funcs cdns_mhdp_bridge_funcs = {
 	.edid_read = cdns_mhdp_bridge_edid_read,
 	.hpd_enable = cdns_mhdp_bridge_hpd_enable,
 	.hpd_disable = cdns_mhdp_bridge_hpd_disable,
+	.mode_valid = cdns_mhdp_bridge_mode_valid,
 };
 
 static bool cdns_mhdp_detect_hpd(struct cdns_mhdp_device *mhdp, bool *hpd_pulse)
-- 
2.34.1

