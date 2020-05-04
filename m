Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92B2C1C45C2
	for <lists+dri-devel@lfdr.de>; Mon,  4 May 2020 20:24:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46A2F6E459;
	Mon,  4 May 2020 18:24:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F7AE6E457;
 Mon,  4 May 2020 18:24:31 +0000 (UTC)
IronPort-SDR: u6U0jcSFODoRAPHPNDYaHLTiOGohl4XJbkMXgb0KKH3SSSnaof5e3XqikSxSImk9r3Zj/TRHol
 qXq+8YgDNqMw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2020 11:24:31 -0700
IronPort-SDR: /b68/7D1FhLYcpyIBYf2zJAIDgWVsaIF5qUbSuwN0sodaLVX/u5W07NdpjzJENbYApYKy7ITY4
 /crJMGO/JyoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,352,1583222400"; d="scan'208";a="369172161"
Received: from plaxmina-desktop.iind.intel.com ([10.145.162.62])
 by fmsmga001.fm.intel.com with ESMTP; 04 May 2020 11:24:25 -0700
From: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>
To: jani.nikula@linux.intel.com, daniel@ffwll.ch,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@linux.ie>,
 Imre Deak <imre.deak@intel.com>,
 =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>
Subject: [PATCH v2 4/9] drm/i915/display/tc: Prefer drm_WARN_ON over WARN_ON
Date: Mon,  4 May 2020 23:45:55 +0530
Message-Id: <20200504181600.18503-5-pankaj.laxminarayan.bharadiya@intel.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200504181600.18503-1-pankaj.laxminarayan.bharadiya@intel.com>
References: <20200504181600.18503-1-pankaj.laxminarayan.bharadiya@intel.com>
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
func(...) {
...
struct drm_i915_private *T = ...;
<+...
-WARN_ON(
+drm_WARN_ON(&T->drm,
...)
...+>
}

@@
identifier func, T;
@@
func(struct intel_digital_port *T,...) {
+struct drm_i915_private *i915 = to_i915(T->base.base.dev);
<+...
-WARN_ON(
+drm_WARN_ON(&i915->drm,
...)
...+>

}

changes since v1:
- Add i915 local variable and use it in drm_WARN_ON (Jani)

Signed-off-by: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>
---
 drivers/gpu/drm/i915/display/intel_tc.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_tc.c b/drivers/gpu/drm/i915/display/intel_tc.c
index d3bd5e798fbc..a2ffc991bc0e 100644
--- a/drivers/gpu/drm/i915/display/intel_tc.c
+++ b/drivers/gpu/drm/i915/display/intel_tc.c
@@ -360,12 +360,12 @@ static void icl_tc_phy_connect(struct intel_digital_port *dig_port,
 	}
 
 	if (!icl_tc_phy_set_safe_mode(dig_port, false) &&
-	    !WARN_ON(dig_port->tc_legacy_port))
+	    !drm_WARN_ON(&i915->drm, dig_port->tc_legacy_port))
 		goto out_set_tbt_alt_mode;
 
 	max_lanes = intel_tc_port_fia_max_lane_count(dig_port);
 	if (dig_port->tc_legacy_port) {
-		WARN_ON(max_lanes != 4);
+		drm_WARN_ON(&i915->drm, max_lanes != 4);
 		dig_port->tc_mode = TC_PORT_LEGACY;
 
 		return;
@@ -445,18 +445,20 @@ static bool icl_tc_phy_is_connected(struct intel_digital_port *dig_port)
 static enum tc_port_mode
 intel_tc_port_get_current_mode(struct intel_digital_port *dig_port)
 {
+	struct drm_i915_private *i915 = to_i915(dig_port->base.base.dev);
 	u32 live_status_mask = tc_port_live_status_mask(dig_port);
 	bool in_safe_mode = icl_tc_phy_is_in_safe_mode(dig_port);
 	enum tc_port_mode mode;
 
-	if (in_safe_mode || WARN_ON(!icl_tc_phy_status_complete(dig_port)))
+	if (in_safe_mode ||
+	    drm_WARN_ON(&i915->drm, !icl_tc_phy_status_complete(dig_port)))
 		return TC_PORT_TBT_ALT;
 
 	mode = dig_port->tc_legacy_port ? TC_PORT_LEGACY : TC_PORT_DP_ALT;
 	if (live_status_mask) {
 		enum tc_port_mode live_mode = fls(live_status_mask) - 1;
 
-		if (!WARN_ON(live_mode == TC_PORT_TBT_ALT))
+		if (!drm_WARN_ON(&i915->drm, live_mode == TC_PORT_TBT_ALT))
 			mode = live_mode;
 	}
 
@@ -505,7 +507,9 @@ static void
 intel_tc_port_link_init_refcount(struct intel_digital_port *dig_port,
 				 int refcount)
 {
-	WARN_ON(dig_port->tc_link_refcount);
+	struct drm_i915_private *i915 = to_i915(dig_port->base.base.dev);
+
+	drm_WARN_ON(&i915->drm, dig_port->tc_link_refcount);
 	dig_port->tc_link_refcount = refcount;
 }
 
-- 
2.23.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
