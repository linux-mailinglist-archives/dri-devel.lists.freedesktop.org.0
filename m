Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB760C55AA5
	for <lists+dri-devel@lfdr.de>; Thu, 13 Nov 2025 05:39:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87F8710E094;
	Thu, 13 Nov 2025 04:39:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G4owzO1g";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18D5510E00C;
 Thu, 13 Nov 2025 04:39:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763008770; x=1794544770;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=6ySzKxF21pJAtPaLKd3nSGIjAIVEHg876CdA6gZTlbs=;
 b=G4owzO1g4YSrY62w8RwnVpO3mV3MPqOA+Fgyw72t4sVNnddB4BubOchU
 DL+WbIx1AydbIzkXXR3YzEcj5V/tkRS9vn7WJrhBqbzjQG3Zd6BN1Fsed
 3aSuNiFa+AFoy9Z9XBbpRKQQIhKbLUA0bjnWlwud9qEINq6Th/YoGO89L
 oliqSKrxYCqNtjpUxsuXEZrgWgsRPAsCSJb7cy6d5hrWwEjJ6Bw3Yn7Ml
 1qDAbGKmKRWoeC/CTeAwhIXJXDcvHr01kffHcwGaxakJ4zIZ452D1R6dk
 lQVjoh89LMsSnMU7CT2YISV0kYja82/lMrjha7/DwqGi4CcEPBj2+Cu2L Q==;
X-CSE-ConnectionGUID: g0Vycg8rT9Os6kWOn59HRQ==
X-CSE-MsgGUID: JFhP80+xSB2T7s3mxxiRag==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="65017591"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="65017591"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2025 20:39:29 -0800
X-CSE-ConnectionGUID: VIpm9iLeQ/qT3fmcoO6jpA==
X-CSE-MsgGUID: aUJdkIPuT5qJLUwIlTNR9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,301,1754982000"; d="scan'208";a="189824561"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by fmviesa009.fm.intel.com with ESMTP; 12 Nov 2025 20:39:27 -0800
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, arun.r.murthy@intel.com, imre.deak@intel.com,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH] drm/display/dp_mst: Add protection against 0 vcpi
Date: Thu, 13 Nov 2025 10:09:19 +0530
Message-Id: <20251113043918.716367-1-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.34.1
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

When releasing a timeslot there is a slight chance we may end up
with the wrong payload mask due to overflow if the delayed_destroy_work
ends up coming into play after a DP 2.1 monitor gets disconnected
which causes vcpi to become 0 then we try to make the payload =
~BIT(vcpi - 1) which is a negative shift.

Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 drivers/gpu/drm/display/drm_dp_mst_topology.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c b/drivers/gpu/drm/display/drm_dp_mst_topology.c
index 64e5c176d5cc..3cf1eafcfcb5 100644
--- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
@@ -4531,6 +4531,7 @@ int drm_dp_atomic_release_time_slots(struct drm_atomic_state *state,
 	struct drm_dp_mst_atomic_payload *payload;
 	struct drm_connector_state *old_conn_state, *new_conn_state;
 	bool update_payload = true;
+	int bit;
 
 	old_conn_state = drm_atomic_get_old_connector_state(state, port->connector);
 	if (!old_conn_state->crtc)
@@ -4572,7 +4573,8 @@ int drm_dp_atomic_release_time_slots(struct drm_atomic_state *state,
 	if (!payload->delete) {
 		payload->pbn = 0;
 		payload->delete = true;
-		topology_state->payload_mask &= ~BIT(payload->vcpi - 1);
+		bit = payload->vcpi ? payload->vcpi - 1 : 0;
+		topology_state->payload_mask &= ~BIT(bit);
 	}
 
 	return 0;
-- 
2.34.1

