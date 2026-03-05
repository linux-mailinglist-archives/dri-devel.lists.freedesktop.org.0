Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YLcoGqE8qWkd3QAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 09:19:45 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B83720D5DA
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 09:19:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44A0110EB8B;
	Thu,  5 Mar 2026 08:19:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GLNrlK5k";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4211410E24A;
 Thu,  5 Mar 2026 08:19:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772698782; x=1804234782;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=uqkLOpL+p2a7c3BDnMaqpExf9MrKJtJJSWroasBN44Y=;
 b=GLNrlK5kcAYniO6PAcS3+eZPc0agcZRBygOVIQfJ+CkCAUOw+e7VbwbU
 KOM3cUH5DazrfOnSE0xlA4knnbEeL1pS6c6krzeFwjIOMhp6K6s0J/PZw
 87ajlaXOq8Tun3Jwkx1zyZprN+EKHVly1USsjNHYhponKqmiJBq85itKv
 i7VvOLB4ExZbCiqCxc7tQcets3Cbsxr9d5mNRmzbotXLZRSmowFT1BfO7
 nopTda+vHIxWNoSoAvuziVJp+CuN1IquhTvOXtWqmrbHmOjxi0mupXP1J
 a4cm8ZlQl9Zq/gACm7zR2FBfbrbwBodqbHvUsvr/ic/Rd5JXD2hOF/FZh g==;
X-CSE-ConnectionGUID: +98rPmSVRoyNj6/VrJJPjA==
X-CSE-MsgGUID: kVh2/CUzQLa2d5Mah0oNPw==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="91349152"
X-IronPort-AV: E=Sophos;i="6.21,325,1763452800"; d="scan'208";a="91349152"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2026 00:19:41 -0800
X-CSE-ConnectionGUID: 3QyRpGp4ReGDJQKqmQZdzw==
X-CSE-MsgGUID: z2qggC+CS0OfhuFOgdzICA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,325,1763452800"; d="scan'208";a="256492884"
Received: from srr4-3-linux-106-armuthy.iind.intel.com ([10.190.238.56])
 by orviesa001.jf.intel.com with ESMTP; 05 Mar 2026 00:19:39 -0800
From: Arun R Murthy <arun.r.murthy@intel.com>
Date: Thu, 05 Mar 2026 13:48:13 +0530
Subject: [PATCH RFC 3/4] drm/i915/dp: On HPD read LTTPR caps followed by
 DPRX caps
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260305-dp_aux-v1-3-54ee0b5f5158@intel.com>
References: <20260305-dp_aux-v1-0-54ee0b5f5158@intel.com>
In-Reply-To: <20260305-dp_aux-v1-0-54ee0b5f5158@intel.com>
To: Imre Deak <imre.deak@intel.com>, 
 =?utf-8?q?Ville_Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>, 
 Jani Nikula <jani.nikula@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org, Arun R Murthy <arun.r.murthy@intel.com>
X-Mailer: b4 0.15-dev
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
X-Rspamd-Queue-Id: 1B83720D5DA
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[arun.r.murthy@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,intel.com:dkim,intel.com:email,intel.com:mid];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	DKIM_TRACE(0.00)[intel.com:+]
X-Rspamd-Action: no action

On HPD for DP read LTTPR caps and then read the DPRX caps. Dont directly
read the DPRX caps at first as per Spec DP2.1 Sec 3.6.8.1

Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c               | 3 +--
 drivers/gpu/drm/i915/display/intel_dp_link_training.c | 2 +-
 drivers/gpu/drm/i915/display/intel_dp_link_training.h | 1 -
 drivers/gpu/drm/i915/display/intel_dp_tunnel.c        | 3 +--
 4 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 0c03b6fb6fd82b0b010fe5f7591ce5e0d8d2d04c..956099e90b32aae5ae21d472ab5dc9dd7d110f60 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -6811,7 +6811,6 @@ intel_dp_hpd_pulse(struct intel_digital_port *dig_port, bool long_hpd)
 {
 	struct intel_display *display = to_intel_display(dig_port);
 	struct intel_dp *intel_dp = &dig_port->dp;
-	u8 dpcd[DP_RECEIVER_CAP_SIZE];
 
 	if (dig_port->base.type == INTEL_OUTPUT_EDP &&
 	    (long_hpd ||
@@ -6847,7 +6846,7 @@ intel_dp_hpd_pulse(struct intel_digital_port *dig_port, bool long_hpd)
 	if (long_hpd) {
 		intel_dp_dpcd_set_probe(intel_dp, true);
 
-		intel_dp_read_dprx_caps(intel_dp, dpcd);
+		intel_dp_init_lttpr_and_dprx_caps(intel_dp);
 
 		intel_dp->reset_link_params = true;
 		intel_dp_invalidate_source_oui(intel_dp);
diff --git a/drivers/gpu/drm/i915/display/intel_dp_link_training.c b/drivers/gpu/drm/i915/display/intel_dp_link_training.c
index 68ab938f18f3b6f3c889f408cd1901041834fe82..76a5bfb507c34733db09cd7c2ba9895afcbf6b10 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_link_training.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_link_training.c
@@ -205,7 +205,7 @@ static int intel_dp_init_lttpr_phys(struct intel_dp *intel_dp, int lttpr_count)
 	return 0;
 }
 
-int intel_dp_read_dprx_caps(struct intel_dp *intel_dp, u8 dpcd[DP_RECEIVER_CAP_SIZE])
+static int intel_dp_read_dprx_caps(struct intel_dp *intel_dp, u8 dpcd[DP_RECEIVER_CAP_SIZE])
 {
 	struct intel_display *display = to_intel_display(intel_dp);
 
diff --git a/drivers/gpu/drm/i915/display/intel_dp_link_training.h b/drivers/gpu/drm/i915/display/intel_dp_link_training.h
index 1ba22ed6db087b73d2ec479c6f31104e97243061..d5f35637b7f375bdc7bdd01c25137fb9f0de37dc 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_link_training.h
+++ b/drivers/gpu/drm/i915/display/intel_dp_link_training.h
@@ -13,7 +13,6 @@ struct intel_connector;
 struct intel_crtc_state;
 struct intel_dp;
 
-int intel_dp_read_dprx_caps(struct intel_dp *intel_dp, u8 dpcd[DP_RECEIVER_CAP_SIZE]);
 int intel_dp_init_lttpr_and_dprx_caps(struct intel_dp *intel_dp);
 bool intel_dp_lttpr_transparent_mode_enabled(struct intel_dp *intel_dp);
 
diff --git a/drivers/gpu/drm/i915/display/intel_dp_tunnel.c b/drivers/gpu/drm/i915/display/intel_dp_tunnel.c
index 1fd1ac8d556d84bd794b965ba6f513ee4550f060..6fe9ff757f264a1064ca3e77e4a2bb8c1228214a 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_tunnel.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_tunnel.c
@@ -337,7 +337,6 @@ void intel_dp_tunnel_resume(struct intel_dp *intel_dp,
 	struct intel_display *display = to_intel_display(intel_dp);
 	struct intel_connector *connector = intel_dp->attached_connector;
 	struct intel_encoder *encoder = &dp_to_dig_port(intel_dp)->base;
-	u8 dpcd[DP_RECEIVER_CAP_SIZE];
 	u8 pipe_mask;
 	int err = 0;
 
@@ -360,7 +359,7 @@ void intel_dp_tunnel_resume(struct intel_dp *intel_dp,
 	 * capabilities were updated already during resume.
 	 */
 	if (!dpcd_updated) {
-		err = intel_dp_read_dprx_caps(intel_dp, dpcd);
+		err = intel_dp_init_lttpr_and_dprx_caps(intel_dp);
 
 		if (err) {
 			drm_dp_tunnel_set_io_error(intel_dp->tunnel);

-- 
2.25.1

