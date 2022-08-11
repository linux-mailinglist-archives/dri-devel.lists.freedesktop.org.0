Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0B0C59008A
	for <lists+dri-devel@lfdr.de>; Thu, 11 Aug 2022 17:44:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AC8999341;
	Thu, 11 Aug 2022 15:44:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C8D8A13C5;
 Thu, 11 Aug 2022 15:44:01 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 929F8B82150;
 Thu, 11 Aug 2022 15:44:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF677C433C1;
 Thu, 11 Aug 2022 15:43:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1660232638;
 bh=3rN/T8Jde922Nv2ildGBzsoOl8hKjx9VEx2KhnzC9Ik=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=a5oXq7iyJZtt1dv/Okh8oMUbuSBIZa7CLjt6UOd3oPQIFDZawk7ElocQnvfz7oHvA
 BW9hp7xRCVkXA+BJc55FE1WgbJJGz3WHq5WnrpkiUopzt8K9VIkHdRdEMBBKnuWDlS
 tPrkUnxVuWZZe6zKzWbWY70PpT9UwiLpAa0scF9N6YQF6xANOdmFASk8xd1TRlwIH+
 b+bVfvJqpWyTCD6hw8C3BQ0Jq0EeHYUDKFYh9Mr79/ZuMUG+IAyXShCHDcjtn+/sGi
 BCZj+9w1wzRhkzegY4bEdMaK4Byw2G9nS17O0WuAR2aCl+o4f81nCv12YDqyl5YGOO
 BC4eMoHdB6jJQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.18 12/93] drm/amd/display: Detect dpcd_rev when
 hotplug mst monitor
Date: Thu, 11 Aug 2022 11:41:06 -0400
Message-Id: <20220811154237.1531313-12-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220811154237.1531313-1-sashal@kernel.org>
References: <20220811154237.1531313-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Sasha Levin <sashal@kernel.org>, amd-gfx@lists.freedesktop.org,
 sunpeng.li@amd.com, dri-devel@lists.freedesktop.org, Xinhui.Pan@amd.com,
 Rodrigo.Siqueira@amd.com, Jerry.Zuo@amd.com, Hersen Wu <hersenwu@amd.com>,
 Roman.Li@amd.com, airlied@linux.ie, Daniel Wheeler <daniel.wheeler@amd.com>,
 Hamza Mahfooz <hamza.mahfooz@amd.com>, Wayne Lin <Wayne.Lin@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, nicholas.kazlauskas@amd.com,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Wayne Lin <Wayne.Lin@amd.com>

[ Upstream commit 453b0016a054df0f442fda8a145b97a33816cab9 ]

[Why]
Once mst topology is constructed, later on new connected monitors
are reported to source by CSN message. Within CSN, there is no
carried info of DPCD_REV comparing to LINK_ADDRESS reply. As the
result, we might leave some ports connected to DP but without DPCD
revision number which will affect us determining the capability of
the DP Rx.

[How]
Send out remote DPCD read when the port's dpcd_rev is 0x0 in
detect_ctx(). Firstly, read out the value from DPCD 0x2200. If the
return value is 0x0, it's likely the DP1.2 DP Rx then we reques
revision from DPCD 0x0 again.

Reviewed-by: Hersen Wu <hersenwu@amd.com>
Acked-by: Hamza Mahfooz <hamza.mahfooz@amd.com>
Signed-off-by: Wayne Lin <Wayne.Lin@amd.com>
Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 .../display/amdgpu_dm/amdgpu_dm_mst_types.c   | 38 ++++++++++++++++++-
 1 file changed, 37 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
index d864cae1af67..bcbb6f6f8c82 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
@@ -363,12 +363,48 @@ dm_dp_mst_detect(struct drm_connector *connector,
 {
 	struct amdgpu_dm_connector *aconnector = to_amdgpu_dm_connector(connector);
 	struct amdgpu_dm_connector *master = aconnector->mst_port;
+	struct drm_dp_mst_port *port = aconnector->port;
+	int connection_status;
 
 	if (drm_connector_is_unregistered(connector))
 		return connector_status_disconnected;
 
-	return drm_dp_mst_detect_port(connector, ctx, &master->mst_mgr,
+	connection_status = drm_dp_mst_detect_port(connector, ctx, &master->mst_mgr,
 				      aconnector->port);
+
+	if (port->pdt != DP_PEER_DEVICE_NONE && !port->dpcd_rev) {
+		uint8_t dpcd_rev;
+		int ret;
+
+		ret = drm_dp_dpcd_readb(&port->aux, DP_DP13_DPCD_REV, &dpcd_rev);
+
+		if (ret == 1) {
+			port->dpcd_rev = dpcd_rev;
+
+			/* Could be DP1.2 DP Rx case*/
+			if (!dpcd_rev) {
+				ret = drm_dp_dpcd_readb(&port->aux, DP_DPCD_REV, &dpcd_rev);
+
+				if (ret == 1)
+					port->dpcd_rev = dpcd_rev;
+			}
+
+			if (!dpcd_rev)
+				DRM_DEBUG_KMS("Can't decide DPCD revision number!");
+		}
+
+		/*
+		 * Could be legacy sink, logical port etc on DP1.2.
+		 * Will get Nack under these cases when issue remote
+		 * DPCD read.
+		 */
+		if (ret != 1)
+			DRM_DEBUG_KMS("Can't access DPCD");
+	} else if (port->pdt == DP_PEER_DEVICE_NONE) {
+		port->dpcd_rev = 0;
+	}
+
+	return connection_status;
 }
 
 static int dm_dp_mst_atomic_check(struct drm_connector *connector,
-- 
2.35.1

