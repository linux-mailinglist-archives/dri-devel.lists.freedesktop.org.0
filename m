Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21B96C07E44
	for <lists+dri-devel@lfdr.de>; Fri, 24 Oct 2025 21:22:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC30510E224;
	Fri, 24 Oct 2025 19:22:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="s/jCUmPp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-171.mta0.migadu.com (out-171.mta0.migadu.com
 [91.218.175.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6BC910EB30
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Oct 2025 19:22:48 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1761333448;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+Hv9cQ6qRRi2vVHLXfvCFJ0ztNKP7yXxJBYCkVumGr0=;
 b=s/jCUmPp0JFWxmvc6dD3Mv6HLCLd0hsNa8sA/9O/qtRJTalPT8D0Itf6d0vwStc+JdTvnz
 qBETiCc1v4TKQZI7qjE/mSHbkZOPxZrzfWOiZS/TS4U0RpaCxYbx8wRyzRHNjrVRUQ9+Mh
 zQBWT7LkOD8hAy/5PQM2bNTYA18BYGo=
From: Sean Anderson <sean.anderson@linux.dev>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org, David Airlie <airlied@gmail.com>,
 Hyun Kwon <hyun.kwon@xilinx.com>, Simona Vetter <simona@ffwll.ch>,
 Michal Simek <michal.simek@amd.com>, linux-arm-kernel@lists.infradead.org,
 Sean Anderson <sean.anderson@linux.dev>
Subject: [PATCH 1/3] drm: zynqmp_dp: Update connector state before AUX
 transfers
Date: Fri, 24 Oct 2025 15:17:05 -0400
Message-Id: <20251024191707.2310589-2-sean.anderson@linux.dev>
In-Reply-To: <20251024191707.2310589-1-sean.anderson@linux.dev>
References: <20251024191707.2310589-1-sean.anderson@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
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

We still want to retry AUX transfers even when the connector is first
plugged in. Update the connector state before reading the DPDC to ensure
the AUX bus sees the most-recent state.

Fixes: d76271d22694 ("drm: xlnx: DRM/KMS driver for Xilinx ZynqMP DisplayPort Subsystem")
Signed-off-by: Sean Anderson <sean.anderson@linux.dev>
---

 drivers/gpu/drm/xlnx/zynqmp_dp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xlnx/zynqmp_dp.c b/drivers/gpu/drm/xlnx/zynqmp_dp.c
index 34ddbf98e81d..f39c78b08e6a 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_dp.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_dp.c
@@ -1697,6 +1697,7 @@ static enum drm_connector_status __zynqmp_dp_bridge_detect(struct zynqmp_dp *dp)
 	}
 
 	if (state & ZYNQMP_DP_INTERRUPT_SIGNAL_STATE_HPD) {
+		dp->status = connector_status_connected;
 		ret = drm_dp_dpcd_read(&dp->aux, 0x0, dp->dpcd,
 				       sizeof(dp->dpcd));
 		if (ret < 0) {
@@ -1711,7 +1712,6 @@ static enum drm_connector_status __zynqmp_dp_bridge_detect(struct zynqmp_dp *dp)
 					       drm_dp_max_lane_count(dp->dpcd),
 					       dp->num_lanes);
 
-		dp->status = connector_status_connected;
 		return connector_status_connected;
 	}
 
-- 
2.35.1.1320.gc452695387.dirty

