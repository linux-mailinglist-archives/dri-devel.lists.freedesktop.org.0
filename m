Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8D0aJoIMq2k/ZgEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 18:18:58 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E886225D7C
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 18:18:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2A1C10EDB4;
	Fri,  6 Mar 2026 17:18:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FVBg+1/r";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAE4910E3EF;
 Fri,  6 Mar 2026 17:18:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772817535; x=1804353535;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=69Wi4wEiA1UdOvrR2K6q5w4nAmADP7A36k0mQNr+xOY=;
 b=FVBg+1/re7HLQOJ38jDGBtgS5IVH2hCwRi98Ka6E3vZStavCK1YkTS3l
 3gj5qZOHx/hVOcQAH0Fi6HjEY5sWoIUFc8ibdxkvJEDag1gMA1ATRHdAO
 1zhHh73PadrgMVEr8LJYE49RwTI6SIzVB3diUaJOECtMSvpNWOx2gtfvn
 cBLhawO+ctDNBt2qbHHeZRI/l5RIzPQko4mYge0up1Dfmh2CbAg58DnO0
 Dwi12wkonXrJcXyxRofbaf3cBS93Zzzej4QEMruRHivVL9RRoGVCeB4mc
 8qadu34xRkM8IOoyGfoKtq+pRxZwVdR0gabiZrExs7rceakP2QOrarZjS w==;
X-CSE-ConnectionGUID: JNy4Ri3RShaqKROlMymSTw==
X-CSE-MsgGUID: Ap9IzdPeQB+kle5qYXvBUw==
X-IronPort-AV: E=McAfee;i="6800,10657,11721"; a="77530795"
X-IronPort-AV: E=Sophos;i="6.23,105,1770624000"; d="scan'208";a="77530795"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2026 09:18:54 -0800
X-CSE-ConnectionGUID: MDSE/Z1cQjSRI1ux0xjQug==
X-CSE-MsgGUID: sPy9YRUgRu6AY5tv0FSp0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,105,1770624000"; d="scan'208";a="216175133"
Received: from dut-2a59.iind.intel.com ([10.190.239.113])
 by fmviesa010.fm.intel.com with ESMTP; 06 Mar 2026 09:18:50 -0800
From: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Cc: harry.wentland@amd.com, louis.chauvet@bootlin.com, mwen@igalia.com,
 contact@emersion.fr, alex.hung@amd.com, daniels@collabora.com,
 uma.shankar@intel.com, maarten.lankhorst@intel.com,
 pekka.paalanen@collabora.com, pranay.samala@intel.com,
 swati2.sharma@intel.com,
 Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Subject: [PATCH 04/10] drm/i915/color: Add support for 1D LUT in SDR planes
Date: Fri,  6 Mar 2026 22:23:01 +0530
Message-Id: <20260306165307.3233194-5-chaitanya.kumar.borah@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260306165307.3233194-1-chaitanya.kumar.borah@intel.com>
References: <20260306165307.3233194-1-chaitanya.kumar.borah@intel.com>
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
X-Rspamd-Queue-Id: 6E886225D7C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[chaitanya.kumar.borah@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.982];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,intel.com:email,intel.com:mid,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

Extend the SDR plane color pipeline to include pre- and post-CSC
1D LUT blocks.

SDR planes use a smaller LUT size than HDR planes and therefore
initialize the 1D LUT colorops with the appropriate hardware
capacity.

Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
---
 drivers/gpu/drm/i915/display/intel_color_pipeline.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_color_pipeline.c b/drivers/gpu/drm/i915/display/intel_color_pipeline.c
index f368a896d2fc..47b3bcec7b18 100644
--- a/drivers/gpu/drm/i915/display/intel_color_pipeline.c
+++ b/drivers/gpu/drm/i915/display/intel_color_pipeline.c
@@ -15,6 +15,7 @@
 #define MAX_COLOROP 4
 #define PLANE_DEGAMMA_SIZE 128
 #define PLANE_GAMMA_SIZE 32
+#define PLANE_DEGAMMA_SIZE_SDR 32
 
 static const struct drm_colorop_funcs intel_colorop_funcs = {
 	.destroy = intel_colorop_destroy,
@@ -44,7 +45,9 @@ static const enum intel_color_block hdr_plane_pipeline[] = {
 };
 
 static const enum intel_color_block sdr_plane_pipeline[] = {
+	INTEL_PLANE_CB_PRE_CSC_LUT,
 	INTEL_PLANE_CB_CSC_FF,
+	INTEL_PLANE_CB_POST_CSC_LUT,
 };
 
 static const u64 intel_plane_supported_csc_ff =
@@ -67,8 +70,10 @@ struct intel_colorop *intel_color_pipeline_plane_add_colorop(struct drm_plane *p
 							     enum intel_color_block id)
 {
 	struct drm_device *dev = plane->dev;
+	struct intel_display *display = to_intel_display(dev);
 	struct intel_colorop *colorop;
 	int ret;
+	bool is_hdr = icl_is_hdr_plane(display, to_intel_plane(plane)->id);
 
 	colorop = intel_colorop_create(id);
 
@@ -80,7 +85,9 @@ struct intel_colorop *intel_color_pipeline_plane_add_colorop(struct drm_plane *p
 		ret = drm_plane_colorop_curve_1d_lut_init(dev,
 							  &colorop->base, plane,
 							  &intel_colorop_funcs,
-							  PLANE_DEGAMMA_SIZE,
+							  is_hdr ?
+							  PLANE_DEGAMMA_SIZE :
+							  PLANE_DEGAMMA_SIZE_SDR,
 							  DRM_COLOROP_LUT1D_INTERPOLATION_LINEAR,
 							  DRM_COLOROP_FLAG_ALLOW_BYPASS);
 		break;
-- 
2.25.1

