Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BD12E19F4CE
	for <lists+dri-devel@lfdr.de>; Mon,  6 Apr 2020 13:38:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A68346E36F;
	Mon,  6 Apr 2020 11:38:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 839A66E369;
 Mon,  6 Apr 2020 11:38:20 +0000 (UTC)
IronPort-SDR: 9mD6gCNbMtqixFvPvL/RRsBxOo5l62NfI/GqKRGqPf9Tx89hNPCbPsu0wDifbm+AE1mSwp88F4
 qL8sBXL/vBig==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2020 04:38:19 -0700
IronPort-SDR: 9kGxgwzpqanac3qBDOtpm0aCOwVSDlvhVRmLDASgeCyPfRoJM79PcDps+wB3D/Fs6xRxHHShRa
 pbJS4vl/0XpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,350,1580803200"; d="scan'208";a="361192473"
Received: from plaxmina-desktop.iind.intel.com ([10.145.162.62])
 by fmsmga001.fm.intel.com with ESMTP; 06 Apr 2020 04:38:16 -0700
From: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>
To: jani.nikula@linux.intel.com, daniel@ffwll.ch,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@linux.ie>,
 Imre Deak <imre.deak@intel.com>,
 =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>
Subject: [PATCH 12/18] drm/i915/display/tc: Prefer drm_WARN_ON over WARN_ON
Date: Mon,  6 Apr 2020 16:57:54 +0530
Message-Id: <20200406112800.23762-13-pankaj.laxminarayan.bharadiya@intel.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200406112800.23762-1-pankaj.laxminarayan.bharadiya@intel.com>
References: <20200406112800.23762-1-pankaj.laxminarayan.bharadiya@intel.com>
MIME-Version: 1.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

struct drm_device specific drm_WARN* macros include device information
in the backtrace, so we know what device the warnings originate from.

Prefer drm_WARN_ON over WARN_ON.

Conversion is done with below sementic patch:

@@
identifier func, T;
@@
func(struct intel_digital_port *T,...) {
<+...
-WARN_ON(
+drm_WARN_ON(T->base.base.dev,
...)
...+>

}

Signed-off-by: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>
---
 drivers/gpu/drm/i915/display/intel_tc.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_tc.c b/drivers/gpu/drm/i915/display/intel_tc.c
index 9b850c11aa78..7d4172498320 100644
--- a/drivers/gpu/drm/i915/display/intel_tc.c
+++ b/drivers/gpu/drm/i915/display/intel_tc.c
@@ -295,12 +295,12 @@ static void icl_tc_phy_connect(struct intel_digital_port *dig_port,
 	}
 
 	if (!icl_tc_phy_set_safe_mode(dig_port, false) &&
-	    !WARN_ON(dig_port->tc_legacy_port))
+	    !drm_WARN_ON(dig_port->base.base.dev, dig_port->tc_legacy_port))
 		goto out_set_tbt_alt_mode;
 
 	max_lanes = intel_tc_port_fia_max_lane_count(dig_port);
 	if (dig_port->tc_legacy_port) {
-		WARN_ON(max_lanes != 4);
+		drm_WARN_ON(dig_port->base.base.dev, max_lanes != 4);
 		dig_port->tc_mode = TC_PORT_LEGACY;
 
 		return;
@@ -381,14 +381,16 @@ intel_tc_port_get_current_mode(struct intel_digital_port *dig_port)
 	bool in_safe_mode = icl_tc_phy_is_in_safe_mode(dig_port);
 	enum tc_port_mode mode;
 
-	if (in_safe_mode || WARN_ON(!icl_tc_phy_status_complete(dig_port)))
+	if (in_safe_mode || drm_WARN_ON(dig_port->base.base.dev,
+					!icl_tc_phy_status_complete(dig_port)))
 		return TC_PORT_TBT_ALT;
 
 	mode = dig_port->tc_legacy_port ? TC_PORT_LEGACY : TC_PORT_DP_ALT;
 	if (live_status_mask) {
 		enum tc_port_mode live_mode = fls(live_status_mask) - 1;
 
-		if (!WARN_ON(live_mode == TC_PORT_TBT_ALT))
+		if (!drm_WARN_ON(dig_port->base.base.dev,
+				 live_mode == TC_PORT_TBT_ALT))
 			mode = live_mode;
 	}
 
@@ -432,7 +434,7 @@ static void
 intel_tc_port_link_init_refcount(struct intel_digital_port *dig_port,
 				 int refcount)
 {
-	WARN_ON(dig_port->tc_link_refcount);
+	drm_WARN_ON(dig_port->base.base.dev, dig_port->tc_link_refcount);
 	dig_port->tc_link_refcount = refcount;
 }
 
-- 
2.23.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
