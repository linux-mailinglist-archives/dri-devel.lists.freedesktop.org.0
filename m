Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SCxUKJ48qWkd3QAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 09:19:42 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5605620D5CB
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 09:19:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0D1110EB82;
	Thu,  5 Mar 2026 08:19:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AOBi/OlM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D453A10EB83;
 Thu,  5 Mar 2026 08:19:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772698779; x=1804234779;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=+eMmmkRMyp0eRQeliM1jYCNWn0WWAuBQOKKDmv5oqNY=;
 b=AOBi/OlMArhXPJF/eRQnHuoLjMYRj0tav/B0NHrvXGAOG4Il1HcsVnAu
 vwoV0cQFptjtzxna6gv39+tlOYAGaOFdoRSjRCOy1j3T8uHLqcwNXdXJr
 MD773CqrzdihF8o3uARj6HNPVKhBmVBtRgRXfah/aeDIh0QaGoxfqht+N
 jbqDGRnXZUwyUvaYhcf8XQc24vJuLeu36sn3nYwA2RGEyRfvn571DM9Ac
 V+bZug7T/dRP9955u0J5kxrn16XQtEZXLSZHFbSfJBuepLiySEaAU3pTu
 K7BjwlBR4FeAfImzHtqJ8oijXnZJk58eI46jEs0P98s9OQV4PxwO+Wc+T w==;
X-CSE-ConnectionGUID: pxGSBbHESR2AnlytMVSNnw==
X-CSE-MsgGUID: H16EXZbYSy+a+tzpAp/vkw==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="91349147"
X-IronPort-AV: E=Sophos;i="6.21,325,1763452800"; d="scan'208";a="91349147"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2026 00:19:38 -0800
X-CSE-ConnectionGUID: gT979iGOQ6WPgC5Cw617Xg==
X-CSE-MsgGUID: 8n69XC2WTUaSuIn77zZOng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,325,1763452800"; d="scan'208";a="256492872"
Received: from srr4-3-linux-106-armuthy.iind.intel.com ([10.190.238.56])
 by orviesa001.jf.intel.com with ESMTP; 05 Mar 2026 00:19:36 -0800
From: Arun R Murthy <arun.r.murthy@intel.com>
Date: Thu, 05 Mar 2026 13:48:12 +0530
Subject: [PATCH RFC 2/4] drm/i915/dp: Read LTTPR caps followed by DPRX caps
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260305-dp_aux-v1-2-54ee0b5f5158@intel.com>
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
X-Rspamd-Queue-Id: 5605620D5CB
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

As per the DP spec DP2.1 section 3.6.8.6.1, section 2.12.1,
section 2.12.3 (Link Policy) the LTTPR caps is to be read first followed
by the DPRX capability.
Read the LTTPR capabilities followed by the DPRX capabilities and then
the ULP capabilities.

Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
---
 .../gpu/drm/i915/display/intel_dp_link_training.c  | 35 ++++++++++------------
 1 file changed, 15 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp_link_training.c b/drivers/gpu/drm/i915/display/intel_dp_link_training.c
index 54c585c59b900eb3c480502d89736fefa111eba4..68ab938f18f3b6f3c889f408cd1901041834fe82 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_link_training.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_link_training.c
@@ -93,13 +93,11 @@ static void intel_dp_read_lttpr_phy_caps(struct intel_dp *intel_dp,
 	       phy_caps);
 }
 
-static bool intel_dp_read_lttpr_common_caps(struct intel_dp *intel_dp,
-					    const u8 dpcd[DP_RECEIVER_CAP_SIZE])
+static bool intel_dp_read_lttpr_common_caps(struct intel_dp *intel_dp)
 {
 	int ret;
 
-	ret = drm_dp_read_lttpr_common_caps(&intel_dp->aux, dpcd,
-					    intel_dp->lttpr_common_caps);
+	ret = drm_dp_read_lttpr_caps(&intel_dp->aux, intel_dp->lttpr_common_caps);
 	if (ret < 0)
 		goto reset_caps;
 
@@ -145,12 +143,12 @@ bool intel_dp_lttpr_transparent_mode_enabled(struct intel_dp *intel_dp)
  * Return the number of detected LTTPRs in non-transparent mode or 0 if the
  * LTTPRs are in transparent mode or the detection failed.
  */
-static int intel_dp_init_lttpr_phys(struct intel_dp *intel_dp, const u8 dpcd[DP_RECEIVER_CAP_SIZE])
+static int intel_dp_init_lttpr(struct intel_dp *intel_dp)
 {
 	int lttpr_count;
 	int ret;
 
-	if (!intel_dp_read_lttpr_common_caps(intel_dp, dpcd))
+	if (!intel_dp_read_lttpr_common_caps(intel_dp))
 		return 0;
 
 	lttpr_count = drm_dp_lttpr_count(intel_dp->lttpr_common_caps);
@@ -195,19 +193,16 @@ static int intel_dp_init_lttpr_phys(struct intel_dp *intel_dp, const u8 dpcd[DP_
 	return 0;
 }
 
-static int intel_dp_init_lttpr(struct intel_dp *intel_dp, const u8 dpcd[DP_RECEIVER_CAP_SIZE])
+static int intel_dp_init_lttpr_phys(struct intel_dp *intel_dp, int lttpr_count)
 {
-	int lttpr_count;
 	int i;
 
-	lttpr_count = intel_dp_init_lttpr_phys(intel_dp, dpcd);
-
 	for (i = 0; i < lttpr_count; i++) {
-		intel_dp_read_lttpr_phy_caps(intel_dp, dpcd, DP_PHY_LTTPR(i));
+		intel_dp_read_lttpr_phy_caps(intel_dp, intel_dp->dpcd, DP_PHY_LTTPR(i));
 		drm_dp_dump_lttpr_desc(&intel_dp->aux, DP_PHY_LTTPR(i));
 	}
 
-	return lttpr_count;
+	return 0;
 }
 
 int intel_dp_read_dprx_caps(struct intel_dp *intel_dp, u8 dpcd[DP_RECEIVER_CAP_SIZE])
@@ -261,23 +256,23 @@ int intel_dp_init_lttpr_and_dprx_caps(struct intel_dp *intel_dp)
 	 */
 	if (!intel_dp_is_edp(intel_dp) &&
 	    (DISPLAY_VER(display) >= 10 && !display->platform.geminilake)) {
-		u8 dpcd[DP_RECEIVER_CAP_SIZE];
-		int err = intel_dp_read_dprx_caps(intel_dp, dpcd);
-
-		if (err != 0)
-			return err;
-
-		lttpr_count = intel_dp_init_lttpr(intel_dp, dpcd);
+		/*
+		 * Spec DP2.1 section 3.6.8.6.1, section 2.12.1, section 2.12.3
+		 * (Link Policy) the LTTPR caps is to be read first followed by
+		 * the DPRX capability
+		 */
+		lttpr_count = intel_dp_init_lttpr(intel_dp);
 	}
 
 	/*
 	 * The DPTX shall read the DPRX caps after LTTPR detection, so re-read
 	 * it here.
 	 */
-	if (drm_dp_read_dpcd_caps(&intel_dp->aux, intel_dp->dpcd)) {
+	if (intel_dp_read_dprx_caps(intel_dp, intel_dp->dpcd)) {
 		intel_dp_reset_lttpr_common_caps(intel_dp);
 		return -EIO;
 	}
+	intel_dp_init_lttpr_phys(intel_dp, lttpr_count);
 
 	return lttpr_count;
 }

-- 
2.25.1

