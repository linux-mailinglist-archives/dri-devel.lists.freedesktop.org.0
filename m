Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DE0C819F4BF
	for <lists+dri-devel@lfdr.de>; Mon,  6 Apr 2020 13:37:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D55C96E34C;
	Mon,  6 Apr 2020 11:37:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAD2C6E34C;
 Mon,  6 Apr 2020 11:37:36 +0000 (UTC)
IronPort-SDR: b6cL355yc0D49/Pcp6BUhg4uH5loEePrSvwivnXTPlMexMHfz//IzaXk6zRLBYrIdyB9WPxT3I
 g4cusZmqhyHQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2020 04:37:36 -0700
IronPort-SDR: XleHSHifGGDBMBsJcCim8KeAEXpHDIX3/mIzDwv5fF5wxlVrP1zM5sPXU4wVJfY1lR3ybrFAV9
 sld9xBLqW2Ow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,350,1580803200"; d="scan'208";a="361192347"
Received: from plaxmina-desktop.iind.intel.com ([10.145.162.62])
 by fmsmga001.fm.intel.com with ESMTP; 06 Apr 2020 04:37:31 -0700
From: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>
To: jani.nikula@linux.intel.com, daniel@ffwll.ch,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@linux.ie>,
 Chris Wilson <chris@chris-wilson.co.uk>, Imre Deak <imre.deak@intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Subject: [PATCH 05/18] drm/i915/display/display: Prefer drm_WARN_ON over
 WARN_ON
Date: Mon,  6 Apr 2020 16:57:47 +0530
Message-Id: <20200406112800.23762-6-pankaj.laxminarayan.bharadiya@intel.com>
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
Cc: pankaj.laxminarayan.bharadiya@intel.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

struct drm_device specific drm_WARN* macros include device information
in the backtrace, so we know what device the warnings originate from.

Prefer drm_WARN_ON over WARN_ON at places where struct i915_power_domains
struct is available.

Conversion is done with below sementic patch:

@@
identifier func, T;
@@
func(struct i915_power_domains *T,...) {
+ struct drm_i915_private *i915 = container_of(T, struct drm_i915_private, power_domains);
<+...
-WARN_ON(
+drm_WARN_ON(&i915->drm,
...)
...+>

}

Signed-off-by: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>
---
 .../drm/i915/display/intel_display_power.c    | 35 +++++++++++++------
 1 file changed, 24 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_power.c b/drivers/gpu/drm/i915/display/intel_display_power.c
index 433e5a81dd4d..5475f989df4c 100644
--- a/drivers/gpu/drm/i915/display/intel_display_power.c
+++ b/drivers/gpu/drm/i915/display/intel_display_power.c
@@ -1850,22 +1850,29 @@ static u64 __async_put_domains_mask(struct i915_power_domains *power_domains)
 static bool
 assert_async_put_domain_masks_disjoint(struct i915_power_domains *power_domains)
 {
-	return !WARN_ON(power_domains->async_put_domains[0] &
-			power_domains->async_put_domains[1]);
+	struct drm_i915_private *i915 = container_of(power_domains,
+						     struct drm_i915_private,
+						     power_domains);
+	return !drm_WARN_ON(&i915->drm, power_domains->async_put_domains[0] &
+			    power_domains->async_put_domains[1]);
 }
 
 static bool
 __async_put_domains_state_ok(struct i915_power_domains *power_domains)
 {
+	struct drm_i915_private *i915 = container_of(power_domains,
+						     struct drm_i915_private,
+						     power_domains);
 	enum intel_display_power_domain domain;
 	bool err = false;
 
 	err |= !assert_async_put_domain_masks_disjoint(power_domains);
-	err |= WARN_ON(!!power_domains->async_put_wakeref !=
-		       !!__async_put_domains_mask(power_domains));
+	err |= drm_WARN_ON(&i915->drm, !!power_domains->async_put_wakeref !=
+			   !!__async_put_domains_mask(power_domains));
 
 	for_each_power_domain(domain, __async_put_domains_mask(power_domains))
-		err |= WARN_ON(power_domains->domain_use_count[domain] != 1);
+		err |= drm_WARN_ON(&i915->drm,
+				   power_domains->domain_use_count[domain] != 1);
 
 	return !err;
 }
@@ -2107,11 +2114,14 @@ static void
 queue_async_put_domains_work(struct i915_power_domains *power_domains,
 			     intel_wakeref_t wakeref)
 {
-	WARN_ON(power_domains->async_put_wakeref);
+	struct drm_i915_private *i915 = container_of(power_domains,
+						     struct drm_i915_private,
+						     power_domains);
+	drm_WARN_ON(&i915->drm, power_domains->async_put_wakeref);
 	power_domains->async_put_wakeref = wakeref;
-	WARN_ON(!queue_delayed_work(system_unbound_wq,
-				    &power_domains->async_put_work,
-				    msecs_to_jiffies(100)));
+	drm_WARN_ON(&i915->drm, !queue_delayed_work(system_unbound_wq,
+						    &power_domains->async_put_work,
+						    msecs_to_jiffies(100)));
 }
 
 static void
@@ -4318,6 +4328,9 @@ __set_power_wells(struct i915_power_domains *power_domains,
 		  const struct i915_power_well_desc *power_well_descs,
 		  int power_well_count)
 {
+	struct drm_i915_private *i915 = container_of(power_domains,
+						     struct drm_i915_private,
+						     power_domains);
 	u64 power_well_ids = 0;
 	int i;
 
@@ -4337,8 +4350,8 @@ __set_power_wells(struct i915_power_domains *power_domains,
 		if (id == DISP_PW_ID_NONE)
 			continue;
 
-		WARN_ON(id >= sizeof(power_well_ids) * 8);
-		WARN_ON(power_well_ids & BIT_ULL(id));
+		drm_WARN_ON(&i915->drm, id >= sizeof(power_well_ids) * 8);
+		drm_WARN_ON(&i915->drm, power_well_ids & BIT_ULL(id));
 		power_well_ids |= BIT_ULL(id);
 	}
 
-- 
2.23.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
