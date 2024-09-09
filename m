Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4972971CFF
	for <lists+dri-devel@lfdr.de>; Mon,  9 Sep 2024 16:46:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 268EE10E441;
	Mon,  9 Sep 2024 14:46:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Qz5KutUY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81F5A10E3AE;
 Mon,  9 Sep 2024 14:46:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725893188; x=1757429188;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=cgF9oSQeLyPiU8t6rpcfi9t/dGWgkEeYsf1tSU7qppA=;
 b=Qz5KutUYF0I7RS3Mg/2P9IEOs1Cx7g36XvLuLkzL5k1GAfk22kaBMrvB
 6RJ3+W1WdXVw3ySagSKNNvT+MWkw7iMk1zMkSpu5saUwDNXlxpV8OMtbn
 QTO8lsy90X+jeWpJ3+TGHfJpmpQbq+HJv+gdKvDuIBsdU6qtzQI79ZVYb
 P0idtsD11U/lTx9Ioq+Qcz5j/Zc8ywo3P+Ps755OxX+VGdjfS4q0JTzNB
 bzWZF4AMqIUn5GMAmYg4EahTAxEBLx2Ce4dmSNV2tz+r0RFLFVw9nlltM
 1lO3X5gE/BeWKC1UhXtt3onKvmVDbuqALoKegx1SAo/M8GprlI165L21a A==;
X-CSE-ConnectionGUID: k+B5O/4rRmuGLsHY4CLZnQ==
X-CSE-MsgGUID: amu7DY1fTbiigTpgAbvJCA==
X-IronPort-AV: E=McAfee;i="6700,10204,11190"; a="24738118"
X-IronPort-AV: E=Sophos;i="6.10,214,1719903600"; d="scan'208";a="24738118"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2024 07:46:27 -0700
X-CSE-ConnectionGUID: nTlM4mL9RXSwKNKlTHp6/w==
X-CSE-MsgGUID: dQKltezgTRyzrnx0NIQpPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,214,1719903600"; d="scan'208";a="66325002"
Received: from ideak-desk.fi.intel.com ([10.237.72.78])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2024 07:46:26 -0700
From: Imre Deak <imre.deak@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: Lyude Paul <lyude@redhat.com>
Subject: [PATCH] drm/dp_mst: Fix DSC decompression detection in Synaptics
 branch devices
Date: Mon,  9 Sep 2024 17:46:50 +0300
Message-ID: <20240909144650.2931258-1-imre.deak@intel.com>
X-Mailer: git-send-email 2.44.2
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

Atm it's assumed that all Synaptics MST branch devices support DSC,
which is not exposed via a DP-to-DP peer device, rather a control flag
in the branch device's UFP DPCD applying to all the streams going
through it. This isn't true for all adapters with this branch device
though (for instance the Cakitte USBC->2xHDMI adapter reported in the
Closes link below doesn't support DSC).

Fix the above by advertising the DSC decompression support only if the
capability flag for this in the UFP DPCD is actually set.

Cc: Lyude Paul <lyude@redhat.com>
Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12047
Signed-off-by: Imre Deak <imre.deak@intel.com>
---
 drivers/gpu/drm/display/drm_dp_mst_topology.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c b/drivers/gpu/drm/display/drm_dp_mst_topology.c
index a040d7dfced17..ac90118b9e7a8 100644
--- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
@@ -6083,6 +6083,7 @@ struct drm_dp_aux *drm_dp_mst_dsc_aux_for_port(struct drm_dp_mst_port *port)
 	struct drm_dp_aux *immediate_upstream_aux;
 	struct drm_dp_mst_port *fec_port;
 	struct drm_dp_desc desc = {};
+	u8 upstream_dsc;
 	u8 endpoint_fec;
 	u8 endpoint_dsc;
 
@@ -6109,8 +6110,6 @@ struct drm_dp_aux *drm_dp_mst_dsc_aux_for_port(struct drm_dp_mst_port *port)
 
 	/* DP-to-DP peer device */
 	if (drm_dp_mst_is_virtual_dpcd(immediate_upstream_port)) {
-		u8 upstream_dsc;
-
 		if (drm_dp_dpcd_read(&port->aux,
 				     DP_DSC_SUPPORT, &endpoint_dsc, 1) != 1)
 			return NULL;
@@ -6156,6 +6155,13 @@ struct drm_dp_aux *drm_dp_mst_dsc_aux_for_port(struct drm_dp_mst_port *port)
 	if (drm_dp_has_quirk(&desc, DP_DPCD_QUIRK_DSC_WITHOUT_VIRTUAL_DPCD)) {
 		u8 dpcd_ext[DP_RECEIVER_CAP_SIZE];
 
+		if (drm_dp_dpcd_read(immediate_upstream_aux,
+				     DP_DSC_SUPPORT, &upstream_dsc, 1) != 1)
+			return NULL;
+
+		if (!(upstream_dsc & DP_DSC_DECOMPRESSION_IS_SUPPORTED))
+			return NULL;
+
 		if (drm_dp_read_dpcd_caps(immediate_upstream_aux, dpcd_ext) < 0)
 			return NULL;
 
-- 
2.44.2

