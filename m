Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93758AE29D4
	for <lists+dri-devel@lfdr.de>; Sat, 21 Jun 2025 17:27:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2AF410E2D1;
	Sat, 21 Jun 2025 15:27:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="pWbXO7sV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B396810E2CA;
 Sat, 21 Jun 2025 15:27:16 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 0350E60008;
 Sat, 21 Jun 2025 15:27:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80C8EC4CEEF;
 Sat, 21 Jun 2025 15:27:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1750519627;
 bh=9jSKtJv1nn+TNAOM5l1IRorTjPFy7K2tgnqW1ydup3A=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=pWbXO7sVA6kgOl4C6gUgYn9WvHQzT2zLwZpgSRnZxpnzm8gTxEoxZ66mbxEOjIUhF
 v/zSfV4PNd62lVrX/CjzhFo2GvXMD4fvgX0D4zXm3TQa4voO9647e7e5inmhRIi5wN
 leLWZz+5hCSZh/s/Z6bcF/Dd+1SsTs0CfYbRi/AQ8OOFC5unIAnYcIeV9jvuR6M6u0
 a8bCir19rfN6MjquzB5H85407YsP9yAhTiUSW/+NkP8Y5e/xT1Oi50lcVYW5kZK+Yj
 GtDQ9dVmHoX6ODOWYmmN6Xn8bFc14XAYAN8fKzYSylsHOgpJuLWgdVyXK7c7SudfGk
 CcXm4ojchDYRQ==
From: Mario Limonciello <superm1@kernel.org>
To: amd-gfx@lists.freedesktop.org,
	Simon Ser <contact@emersion.fr>
Cc: Harry Wentland <Harry.Wentland@amd.com>, Xaver Hugl <xaver.hugl@gmail.com>,
 dri-devel@lists.freedesktop.org, Leo Li <sunpeng.li@amd.com>,
 Sean Paul <seanpaul@google.com>,
 Mario Limonciello <mario.limonciello@amd.com>
Subject: [PATCH v5 2/2] drm/amd: Add power_saving_policy drm property to eDP
 connectors
Date: Sat, 21 Jun 2025 10:26:57 -0500
Message-ID: <20250621152657.1048807-3-superm1@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250621152657.1048807-1-superm1@kernel.org>
References: <20250621152657.1048807-1-superm1@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

From: Mario Limonciello <mario.limonciello@amd.com>

When the `power_saving_policy` property is set to bit mask
"Require color accuracy" ABM should be disabled immediately and
any requests by sysfs to update will return an -EBUSY error.

When the `power_saving_policy` property is set to bit mask
"Require low latency" PSR should be disabled.

When the property is restored to an empty bit mask ABM and PSR
can be enabled again.

Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
v5:
 * Adjust for new signature of amdgpu_dm_psr_disable()
 * Default to none
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_display.c   |  4 ++
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 52 +++++++++++++++++--
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h |  2 +
 3 files changed, 53 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
index 35c778426a7c7..973ea4f618235 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
@@ -1409,6 +1409,10 @@ int amdgpu_display_modeset_create_props(struct amdgpu_device *adev)
 					 "dither",
 					 amdgpu_dither_enum_list, sz);
 
+	if (adev->dc_enabled)
+		drm_mode_create_power_saving_policy_property(adev_to_drm(adev),
+							     DRM_MODE_POWER_SAVING_POLICY_ALL);
+
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 33d5f6f2669ff..b8be7887dfb40 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -7110,6 +7110,13 @@ int amdgpu_dm_connector_atomic_set_property(struct drm_connector *connector,
 	} else if (property == adev->mode_info.underscan_property) {
 		dm_new_state->underscan_enable = val;
 		ret = 0;
+	} else if (property == dev->mode_config.power_saving_policy) {
+		dm_new_state->abm_forbidden = val & DRM_MODE_REQUIRE_COLOR_ACCURACY;
+		dm_new_state->abm_level = (dm_new_state->abm_forbidden || !dm_old_state->abm_level) ?
+						ABM_LEVEL_IMMEDIATE_DISABLE :
+						dm_old_state->abm_level;
+		dm_new_state->psr_forbidden = val & DRM_MODE_REQUIRE_LOW_LATENCY;
+		ret = 0;
 	}
 
 	return ret;
@@ -7152,6 +7159,15 @@ int amdgpu_dm_connector_atomic_get_property(struct drm_connector *connector,
 	} else if (property == adev->mode_info.underscan_property) {
 		*val = dm_state->underscan_enable;
 		ret = 0;
+	} else if (property == dev->mode_config.power_saving_policy) {
+		*val = 0;
+		if (!dm_state->abm_forbidden && !dm_state->psr_forbidden)
+			*val |= DRM_MODE_REQUIRE_NONE;
+		if (dm_state->psr_forbidden)
+			*val |= DRM_MODE_REQUIRE_LOW_LATENCY;
+		if (dm_state->abm_forbidden)
+			*val |= DRM_MODE_REQUIRE_COLOR_ACCURACY;
+		ret = 0;
 	}
 
 	return ret;
@@ -7178,9 +7194,12 @@ static ssize_t panel_power_savings_show(struct device *device,
 	u8 val;
 
 	drm_modeset_lock(&dev->mode_config.connection_mutex, NULL);
-	val = to_dm_connector_state(connector->state)->abm_level ==
-		ABM_LEVEL_IMMEDIATE_DISABLE ? 0 :
-		to_dm_connector_state(connector->state)->abm_level;
+	if (to_dm_connector_state(connector->state)->abm_forbidden)
+		val = 0;
+	else
+		val = to_dm_connector_state(connector->state)->abm_level ==
+			ABM_LEVEL_IMMEDIATE_DISABLE ? 0 :
+			to_dm_connector_state(connector->state)->abm_level;
 	drm_modeset_unlock(&dev->mode_config.connection_mutex);
 
 	return sysfs_emit(buf, "%u\n", val);
@@ -7204,10 +7223,16 @@ static ssize_t panel_power_savings_store(struct device *device,
 		return -EINVAL;
 
 	drm_modeset_lock(&dev->mode_config.connection_mutex, NULL);
-	to_dm_connector_state(connector->state)->abm_level = val ?:
-		ABM_LEVEL_IMMEDIATE_DISABLE;
+	if (to_dm_connector_state(connector->state)->abm_forbidden)
+		ret = -EBUSY;
+	else
+		to_dm_connector_state(connector->state)->abm_level = val ?:
+			ABM_LEVEL_IMMEDIATE_DISABLE;
 	drm_modeset_unlock(&dev->mode_config.connection_mutex);
 
+	if (ret)
+		return ret;
+
 	drm_kms_helper_hotplug_event(dev);
 
 	return count;
@@ -8444,6 +8469,13 @@ void amdgpu_dm_connector_init_helper(struct amdgpu_display_manager *dm,
 	aconnector->base.state->max_bpc = 16;
 	aconnector->base.state->max_requested_bpc = aconnector->base.state->max_bpc;
 
+	if (connector_type == DRM_MODE_CONNECTOR_eDP &&
+	    (dc_is_dmcu_initialized(adev->dm.dc) ||
+	     adev->dm.dc->ctx->dmub_srv)) {
+		drm_object_attach_property(&aconnector->base.base,
+				dm->ddev->mode_config.power_saving_policy, DRM_MODE_REQUIRE_NONE);
+	}
+
 	if (connector_type == DRM_MODE_CONNECTOR_HDMIA) {
 		/* Content Type is currently only implemented for HDMI. */
 		drm_connector_attach_content_type_property(&aconnector->base);
@@ -10220,6 +10252,7 @@ static void amdgpu_dm_atomic_commit_tail(struct drm_atomic_state *state)
 	for_each_oldnew_connector_in_state(state, connector, old_con_state, new_con_state, i) {
 		struct dm_connector_state *dm_new_con_state = to_dm_connector_state(new_con_state);
 		struct dm_connector_state *dm_old_con_state = to_dm_connector_state(old_con_state);
+		struct amdgpu_dm_connector *aconnector = to_amdgpu_dm_connector(connector);
 		struct amdgpu_crtc *acrtc = to_amdgpu_crtc(dm_new_con_state->base.crtc);
 		struct dc_surface_update *dummy_updates;
 		struct dc_stream_update stream_update;
@@ -10285,6 +10318,15 @@ static void amdgpu_dm_atomic_commit_tail(struct drm_atomic_state *state)
 			stream_update.hdr_static_metadata = &hdr_packet;
 		}
 
+		aconnector->disallow_edp_enter_psr = dm_new_con_state->psr_forbidden;
+
+		/* immediately disable PSR if disallowed */
+		if (aconnector->disallow_edp_enter_psr) {
+			mutex_lock(&dm->dc_lock);
+			amdgpu_dm_psr_disable(dm_new_crtc_state->stream, false);
+			mutex_unlock(&dm->dc_lock);
+		}
+
 		status = dc_stream_get_status(dm_new_crtc_state->stream);
 
 		if (WARN_ON(!status))
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
index d7d92f9911e46..7712639bd6a5c 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
@@ -968,6 +968,8 @@ struct dm_connector_state {
 	bool underscan_enable;
 	bool freesync_capable;
 	bool update_hdcp;
+	bool abm_forbidden;
+	bool psr_forbidden;
 	uint8_t abm_level;
 	int vcpi_slots;
 	uint64_t pbn;
-- 
2.43.0

