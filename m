Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5B4B19F4C1
	for <lists+dri-devel@lfdr.de>; Mon,  6 Apr 2020 13:37:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E288C6E351;
	Mon,  6 Apr 2020 11:37:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14F346E351;
 Mon,  6 Apr 2020 11:37:43 +0000 (UTC)
IronPort-SDR: OxpI94RuzaUgsJhYbZrNkLJK+XklAjzJP9Vb5YUr0wJCdAGpzIC+G0e/XMHdLjOIG4Fqne0C1C
 PQPWQw48sphA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2020 04:37:42 -0700
IronPort-SDR: 5Q4vof3oTk6DR+QBMg3xKA/A2IaDznIRe8p62uFNIFbZFmGBZFAsy3j1Z22ORxHUBbW0xN1fcD
 /FbjQTFljM+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,350,1580803200"; d="scan'208";a="361192364"
Received: from plaxmina-desktop.iind.intel.com ([10.145.162.62])
 by fmsmga001.fm.intel.com with ESMTP; 06 Apr 2020 04:37:37 -0700
From: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>
To: jani.nikula@linux.intel.com, daniel@ffwll.ch,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@linux.ie>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Manasi Navare <manasi.d.navare@intel.com>, Imre Deak <imre.deak@intel.com>,
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
Subject: [PATCH 06/18] drm/i915/display/dp: Prefer drm_WARN* over WARN*
Date: Mon,  6 Apr 2020 16:57:48 +0530
Message-Id: <20200406112800.23762-7-pankaj.laxminarayan.bharadiya@intel.com>
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

Prefer drm_WARN* over WARN* at places where struct intel_dp struct
pointer is available.

Conversion is done with below sementic patch:

@@
identifier func, T;
@@
func(struct intel_dp *T,...) {
+ struct drm_i915_private *i915 = dp_to_i915(T);
<+...
(
-WARN_ON(
+drm_WARN_ON(&i915->drm,
...)
|
-WARN_ON_ONCE(
+drm_WARN_ON_ONCE(&i915->drm,
...)
)
...+>

}

@@
identifier func, T;
@@
func(...) {
...
struct intel_dp *T = ...;
+ struct drm_i915_private *i915 = dp_to_i915(T);
<+...
(
-WARN_ON(
+drm_WARN_ON(&i915->drm,
...)
|
-WARN_ON_ONCE(
+drm_WARN_ON_ONCE(&i915->drm,
...)
)
...+>

}

Signed-off-by: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c | 26 ++++++++++++++++---------
 1 file changed, 17 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index db6ae8e9af6e..5076a7cfe0e5 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -410,7 +410,10 @@ static int intel_dp_rate_index(const int *rates, int len, int rate)
 
 static void intel_dp_set_common_rates(struct intel_dp *intel_dp)
 {
-	WARN_ON(!intel_dp->num_source_rates || !intel_dp->num_sink_rates);
+	struct drm_i915_private *i915 = dp_to_i915(intel_dp);
+
+	drm_WARN_ON(&i915->drm,
+		    !intel_dp->num_source_rates || !intel_dp->num_sink_rates);
 
 	intel_dp->num_common_rates = intersect_rates(intel_dp->source_rates,
 						     intel_dp->num_source_rates,
@@ -419,7 +422,7 @@ static void intel_dp_set_common_rates(struct intel_dp *intel_dp)
 						     intel_dp->common_rates);
 
 	/* Paranoia, there should always be something in common. */
-	if (WARN_ON(intel_dp->num_common_rates == 0)) {
+	if (drm_WARN_ON(&i915->drm, intel_dp->num_common_rates == 0)) {
 		intel_dp->common_rates[0] = 162000;
 		intel_dp->num_common_rates = 1;
 	}
@@ -1549,6 +1552,7 @@ static ssize_t
 intel_dp_aux_transfer(struct drm_dp_aux *aux, struct drm_dp_aux_msg *msg)
 {
 	struct intel_dp *intel_dp = container_of(aux, struct intel_dp, aux);
+	struct drm_i915_private *i915 = dp_to_i915(intel_dp);
 	u8 txbuf[20], rxbuf[20];
 	size_t txsize, rxsize;
 	int ret;
@@ -1562,10 +1566,10 @@ intel_dp_aux_transfer(struct drm_dp_aux *aux, struct drm_dp_aux_msg *msg)
 		txsize = msg->size ? HEADER_SIZE + msg->size : BARE_ADDRESS_SIZE;
 		rxsize = 2; /* 0 or 1 data bytes */
 
-		if (WARN_ON(txsize > 20))
+		if (drm_WARN_ON(&i915->drm, txsize > 20))
 			return -E2BIG;
 
-		WARN_ON(!msg->buffer != !msg->size);
+		drm_WARN_ON(&i915->drm, !msg->buffer != !msg->size);
 
 		if (msg->buffer)
 			memcpy(txbuf + HEADER_SIZE, msg->buffer, msg->size);
@@ -1590,7 +1594,7 @@ intel_dp_aux_transfer(struct drm_dp_aux *aux, struct drm_dp_aux_msg *msg)
 		txsize = msg->size ? HEADER_SIZE : BARE_ADDRESS_SIZE;
 		rxsize = msg->size + 1;
 
-		if (WARN_ON(rxsize > 20))
+		if (drm_WARN_ON(&i915->drm, rxsize > 20))
 			return -E2BIG;
 
 		ret = intel_dp_aux_xfer(intel_dp, txbuf, txsize,
@@ -1864,10 +1868,11 @@ static void intel_dp_print_rates(struct intel_dp *intel_dp)
 int
 intel_dp_max_link_rate(struct intel_dp *intel_dp)
 {
+	struct drm_i915_private *i915 = dp_to_i915(intel_dp);
 	int len;
 
 	len = intel_dp_common_len_rate_limit(intel_dp, intel_dp->max_link_rate);
-	if (WARN_ON(len <= 0))
+	if (drm_WARN_ON(&i915->drm, len <= 0))
 		return 162000;
 
 	return intel_dp->common_rates[len - 1];
@@ -1875,10 +1880,11 @@ intel_dp_max_link_rate(struct intel_dp *intel_dp)
 
 int intel_dp_rate_select(struct intel_dp *intel_dp, int rate)
 {
+	struct drm_i915_private *i915 = dp_to_i915(intel_dp);
 	int i = intel_dp_rate_index(intel_dp->sink_rates,
 				    intel_dp->num_sink_rates, rate);
 
-	if (WARN_ON(i < 0))
+	if (drm_WARN_ON(&i915->drm, i < 0))
 		i = 0;
 
 	return i;
@@ -5404,6 +5410,7 @@ static void intel_dp_handle_test_request(struct intel_dp *intel_dp)
 static int
 intel_dp_check_mst_status(struct intel_dp *intel_dp)
 {
+	struct drm_i915_private *i915 = dp_to_i915(intel_dp);
 	bool bret;
 
 	if (intel_dp->is_mst) {
@@ -5412,7 +5419,7 @@ intel_dp_check_mst_status(struct intel_dp *intel_dp)
 		int retry;
 		bool handled;
 
-		WARN_ON_ONCE(intel_dp->active_mst_links < 0);
+		drm_WARN_ON_ONCE(&i915->drm, intel_dp->active_mst_links < 0);
 		bret = intel_dp_get_sink_irq_esi(intel_dp, esi);
 go_again:
 		if (bret == true) {
@@ -5695,11 +5702,12 @@ intel_dp_short_pulse(struct intel_dp *intel_dp)
 static enum drm_connector_status
 intel_dp_detect_dpcd(struct intel_dp *intel_dp)
 {
+	struct drm_i915_private *i915 = dp_to_i915(intel_dp);
 	struct intel_lspcon *lspcon = dp_to_lspcon(intel_dp);
 	u8 *dpcd = intel_dp->dpcd;
 	u8 type;
 
-	if (WARN_ON(intel_dp_is_edp(intel_dp)))
+	if (drm_WARN_ON(&i915->drm, intel_dp_is_edp(intel_dp)))
 		return connector_status_connected;
 
 	if (lspcon->active)
-- 
2.23.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
