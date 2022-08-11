Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB8E258FF6B
	for <lists+dri-devel@lfdr.de>; Thu, 11 Aug 2022 17:30:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA85FADD05;
	Thu, 11 Aug 2022 15:30:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A94FB4302;
 Thu, 11 Aug 2022 15:30:06 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id ECEBDB82153;
 Thu, 11 Aug 2022 15:30:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7F4DC433C1;
 Thu, 11 Aug 2022 15:30:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1660231803;
 bh=TDZZwxVwyngwk48geYfv2U9/dcuIf5XnwjxGs8v7c1k=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=SCfooZLDxBa2N22n61MMaj1VZ5mIwYgARVhCuX9ZGvriORgD5Q/OZmo2QagOEv6P1
 rmLG696cRhmOPKvk75FwRhlVtdpNCLgJRhER+JPMhRS73mzoNnGawVbLxqtJt3ME1Z
 0Yp/8PdIeRfoY5yIRNucnhmI6h+TQL9McG/iQEkWy3hUi1QQA1KxbJ2zLl+mqhlX/z
 /edIEhIHuy87DJZHnVrpVIFn4qnNC7iQ6Zmmk2MiPtFYMWiuCJUaqFdoRA4h4a/42S
 OmONSQObn6jR2PxPfka3Y9FnV3MN2o2aqZl5weYyTsAGRq++V4IkJ2BJMfYj7ZabLT
 y0Z6UHRAeyccw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.19 012/105] drm/amd/display: Detect dpcd_rev when
 hotplug mst monitor
Date: Thu, 11 Aug 2022 11:26:56 -0400
Message-Id: <20220811152851.1520029-12-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220811152851.1520029-1-sashal@kernel.org>
References: <20220811152851.1520029-1-sashal@kernel.org>
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
index 2b9b095e5f03..1c02d873950d 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
@@ -361,12 +361,48 @@ dm_dp_mst_detect(struct drm_connector *connector,
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

