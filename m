Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A9FCCF981B
	for <lists+dri-devel@lfdr.de>; Tue, 06 Jan 2026 18:00:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33C1110E529;
	Tue,  6 Jan 2026 17:00:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="BW1lSygR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F221910E524;
 Tue,  6 Jan 2026 17:00:28 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 10BC760144;
 Tue,  6 Jan 2026 17:00:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 349EEC116C6;
 Tue,  6 Jan 2026 17:00:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1767718827;
 bh=R5EcHisqsNmRcKPLC1SBKqzDw/CcfV6EcfzO2kI93hk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=BW1lSygRXc1ov2p2tDsTaWK3dNbZmJQOrdx5SEtJGWCgY3Wsw1g+aEbFOz/gbdBWI
 ENEVl1QmatWvV6t+cJiH49pBU/js687ASJJ8dU7huXqrWUttZW9H12PU11QOZbaSh9
 /zu47aXWUFaSiGJISJzPDAn2/gOYmpabeRmOkZpf1zQFEd3wFDj3Zxgnc8A8kdZYHH
 NZo1aRSVbdis2tCPNOiQm/aZWF+ejSR33cQomQGfCf4yySg2wSiJ8AWTrv+0kxhLBO
 nWOo8can5oixKvGVZ0BqsZfWxFzu1gQzUTHNYwkrRBfpod6zMkcvb2cR9nmJ2M0udG
 iqszutcw6tRYA==
From: "Mario Limonciello (AMD)" <superm1@kernel.org>
To: dri-devel@lists.freedesktop.org
Cc: amd-gfx@lists.freedesktop.org, harry.wentland@amd.com,
 Xaver Hugl <xaver.hugl@gmail.com>,
 "Mario Limonciello (AMD)" <superm1@kernel.org>
Subject: [PATCH 2/2] drm/amd/display: Attach OLED property to eDP panels
Date: Tue,  6 Jan 2026 11:00:17 -0600
Message-ID: <20260106170017.68158-3-superm1@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260106170017.68158-1-superm1@kernel.org>
References: <20260106170017.68158-1-superm1@kernel.org>
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

amdgpu verifies that a given panel is an OLED panel from extended caps
and can provide accurate information to userspace.  Attach a property
to the DRM connector.

Signed-off-by: Mario Limonciello (AMD) <superm1@kernel.org>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 35dbc6aba4dfc..1cac5ebf50a9d 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -91,6 +91,7 @@
 #include <drm/drm_fourcc.h>
 #include <drm/drm_edid.h>
 #include <drm/drm_eld.h>
+#include <drm/drm_mode.h>
 #include <drm/drm_utils.h>
 #include <drm/drm_vblank.h>
 #include <drm/drm_audio_component.h>
@@ -3739,6 +3740,10 @@ static void update_connector_ext_caps(struct amdgpu_dm_connector *aconnector)
 	caps->ext_caps = &aconnector->dc_link->dpcd_sink_ext_caps;
 	caps->aux_support = false;
 
+	drm_object_property_set_value(&conn_base->base,
+				      adev_to_drm(adev)->mode_config.panel_type_property,
+				      caps->ext_caps->bits.oled ? DRM_MODE_PANEL_TYPE_OLED : DRM_MODE_PANEL_TYPE_UNKNOWN);
+
 	if (caps->ext_caps->bits.oled == 1
 	    /*
 	     * ||
@@ -9020,6 +9025,8 @@ void amdgpu_dm_connector_init_helper(struct amdgpu_display_manager *dm,
 	if (connector_type == DRM_MODE_CONNECTOR_eDP) {
 		struct drm_privacy_screen *privacy_screen;
 
+		drm_connector_attach_panel_type_property(&aconnector->base);
+
 		privacy_screen = drm_privacy_screen_get(adev_to_drm(adev)->dev, NULL);
 		if (!IS_ERR(privacy_screen)) {
 			drm_connector_attach_privacy_screen_provider(&aconnector->base,
-- 
2.43.0

