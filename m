Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 681BC14BFD1
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jan 2020 19:29:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1D546F378;
	Tue, 28 Jan 2020 18:29:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC5AD6F378;
 Tue, 28 Jan 2020 18:29:25 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 28 Jan 2020 10:29:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,374,1574150400"; d="scan'208";a="310823091"
Received: from plaxmina-desktop.iind.intel.com ([10.145.162.62])
 by fmsmga001.fm.intel.com with ESMTP; 28 Jan 2020 10:29:21 -0800
From: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>
To: jani.nikula@linux.intel.com, daniel@ffwll.ch,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@linux.ie>,
 Imre Deak <imre.deak@intel.com>,
 =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [Intel-gfx] [PATCH v5 18/21] drm/i915/display/tc: Make WARN* drm
 specific where drm_priv ptr is available
Date: Tue, 28 Jan 2020 23:46:00 +0530
Message-Id: <20200128181603.27767-19-pankaj.laxminarayan.bharadiya@intel.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200128181603.27767-1-pankaj.laxminarayan.bharadiya@intel.com>
References: <20200128181603.27767-1-pankaj.laxminarayan.bharadiya@intel.com>
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
Cc: pankaj.laxminarayan.bharadiya@intel.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

drm specific WARN* calls include device information in the
backtrace, so we know what device the warnings originate from.

Covert all the calls of WARN* with device specific drm_WARN*
variants in functions where drm_i915_private struct pointer is readily
available.

The conversion was done automatically with below coccinelle semantic
patch. checkpatch errors/warnings are fixed manually.

@rule1@
identifier func, T;
@@
func(...) {
...
struct drm_i915_private *T = ...;
<+...
(
-WARN(
+drm_WARN(&T->drm,
...)
|
-WARN_ON(
+drm_WARN_ON(&T->drm,
...)
|
-WARN_ONCE(
+drm_WARN_ONCE(&T->drm,
...)
|
-WARN_ON_ONCE(
+drm_WARN_ON_ONCE(&T->drm,
...)
)
...+>
}

@rule2@
identifier func, T;
@@
func(struct drm_i915_private *T,...) {
<+...
(
-WARN(
+drm_WARN(&T->drm,
...)
|
-WARN_ON(
+drm_WARN_ON(&T->drm,
...)
|
-WARN_ONCE(
+drm_WARN_ONCE(&T->drm,
...)
|
-WARN_ON_ONCE(
+drm_WARN_ON_ONCE(&T->drm,
...)
)
...+>
}

Signed-off-by: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>
---
 drivers/gpu/drm/i915/display/intel_tc.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_tc.c b/drivers/gpu/drm/i915/display/intel_tc.c
index 7773169b7331..c47f3a1fa73d 100644
--- a/drivers/gpu/drm/i915/display/intel_tc.c
+++ b/drivers/gpu/drm/i915/display/intel_tc.c
@@ -61,7 +61,7 @@ u32 intel_tc_port_get_lane_mask(struct intel_digital_port *dig_port)
 	lane_mask = intel_uncore_read(uncore,
 				      PORT_TX_DFLEXDPSP(dig_port->tc_phy_fia));
 
-	WARN_ON(lane_mask == 0xffffffff);
+	drm_WARN_ON(&i915->drm, lane_mask == 0xffffffff);
 
 	lane_mask &= DP_LANE_ASSIGNMENT_MASK(dig_port->tc_phy_fia_idx);
 	return lane_mask >> DP_LANE_ASSIGNMENT_SHIFT(dig_port->tc_phy_fia_idx);
@@ -76,7 +76,7 @@ u32 intel_tc_port_get_pin_assignment_mask(struct intel_digital_port *dig_port)
 	pin_mask = intel_uncore_read(uncore,
 				     PORT_TX_DFLEXPA1(dig_port->tc_phy_fia));
 
-	WARN_ON(pin_mask == 0xffffffff);
+	drm_WARN_ON(&i915->drm, pin_mask == 0xffffffff);
 
 	return (pin_mask & DP_PIN_ASSIGNMENT_MASK(dig_port->tc_phy_fia_idx)) >>
 	       DP_PIN_ASSIGNMENT_SHIFT(dig_port->tc_phy_fia_idx);
@@ -120,7 +120,8 @@ void intel_tc_port_set_fia_lane_count(struct intel_digital_port *dig_port,
 	struct intel_uncore *uncore = &i915->uncore;
 	u32 val;
 
-	WARN_ON(lane_reversal && dig_port->tc_mode != TC_PORT_LEGACY);
+	drm_WARN_ON(&i915->drm,
+		    lane_reversal && dig_port->tc_mode != TC_PORT_LEGACY);
 
 	val = intel_uncore_read(uncore,
 				PORT_TX_DFLEXDPMLE1(dig_port->tc_phy_fia));
@@ -195,7 +196,7 @@ static u32 tc_port_live_status_mask(struct intel_digital_port *dig_port)
 		mask |= BIT(TC_PORT_LEGACY);
 
 	/* The sink can be connected only in a single mode. */
-	if (!WARN_ON(hweight32(mask) > 1))
+	if (!drm_WARN_ON(&i915->drm, hweight32(mask) > 1))
 		tc_port_fixup_legacy_flag(dig_port, mask);
 
 	return mask;
@@ -409,8 +410,9 @@ static void intel_tc_port_reset_mode(struct intel_digital_port *dig_port,
 	enum tc_port_mode old_tc_mode = dig_port->tc_mode;
 
 	intel_display_power_flush_work(i915);
-	WARN_ON(intel_display_power_is_enabled(i915,
-					       intel_aux_power_domain(dig_port)));
+	drm_WARN_ON(&i915->drm,
+		    intel_display_power_is_enabled(i915,
+					intel_aux_power_domain(dig_port)));
 
 	icl_tc_phy_disconnect(dig_port);
 	icl_tc_phy_connect(dig_port, required_lanes);
@@ -503,7 +505,7 @@ static void __intel_tc_port_lock(struct intel_digital_port *dig_port,
 	    intel_tc_port_needs_reset(dig_port))
 		intel_tc_port_reset_mode(dig_port, required_lanes);
 
-	WARN_ON(dig_port->tc_lock_wakeref);
+	drm_WARN_ON(&i915->drm, dig_port->tc_lock_wakeref);
 	dig_port->tc_lock_wakeref = wakeref;
 }
 
@@ -550,7 +552,7 @@ void intel_tc_port_init(struct intel_digital_port *dig_port, bool is_legacy)
 	enum port port = dig_port->base.port;
 	enum tc_port tc_port = intel_port_to_tc(i915, port);
 
-	if (WARN_ON(tc_port == PORT_TC_NONE))
+	if (drm_WARN_ON(&i915->drm, tc_port == PORT_TC_NONE))
 		return;
 
 	snprintf(dig_port->tc_port_name, sizeof(dig_port->tc_port_name),
-- 
2.23.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
