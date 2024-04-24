Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88B818B12F9
	for <lists+dri-devel@lfdr.de>; Wed, 24 Apr 2024 20:54:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4BC6113D4A;
	Wed, 24 Apr 2024 18:54:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lp6Wy8RN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FBAE113D3F;
 Wed, 24 Apr 2024 18:54:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713984853; x=1745520853;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=GikbtI5WEgpdpKq4J2V86o8LE62vIZZ0akUfI+/zIIU=;
 b=lp6Wy8RNX0Ttkq6oTewCB4W8mYtRjyJP45UtTgafnAwLEHXW2rsWReF9
 TixhFFnw75xnpi0UZR+XiopJ+9fzPeWlYwKw32i+riS+XpthAfx7lngKP
 OhKgbde/tDEUjNkLgKg28VRBjoLRLYwbr76/tCGa9dsJLTanufkN+uG7c
 hAFQCsS7MZsCQ5Mn68GcbPqzj9UHajHNZcnWOWqpLUECVgAO1gDpq0Hc6
 ibsf5fq0M8ybWusqw2nfFqgg+TDNNbhw0OhLkkw/2XEFQ3YVzPR89Y6xN
 OIubP/VmkFLm8PWQxLf4N8uxW7htF7fZBzaA7vcmI6Em57cIr9D1bfY0B w==;
X-CSE-ConnectionGUID: aNUqYHRoQhCWYEqRjJHXoQ==
X-CSE-MsgGUID: 52WfPrF9QgGh+RAT/O5A9Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11054"; a="21061131"
X-IronPort-AV: E=Sophos;i="6.07,227,1708416000"; d="scan'208";a="21061131"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2024 11:54:13 -0700
X-CSE-ConnectionGUID: A/jtES/1QHSy4gCaB1CnDQ==
X-CSE-MsgGUID: o52q6CtTRZCODkTu0HqhPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,227,1708416000"; d="scan'208";a="25240509"
Received: from srr4-3-linux-101-amanna.iind.intel.com ([10.223.74.76])
 by orviesa006.jf.intel.com with ESMTP; 24 Apr 2024 11:54:11 -0700
From: Animesh Manna <animesh.manna@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, jani.nikula@intel.com,
 jouni.hogander@intel.com, arun.r.murthy@intel.com,
 Animesh Manna <animesh.manna@intel.com>
Subject: [PATCH v3 5/6] drm/i915/alpm: Enable lobf from source in ALPM_CTL
Date: Thu, 25 Apr 2024 00:08:19 +0530
Message-Id: <20240424183820.3591593-6-animesh.manna@intel.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20240424183820.3591593-1-animesh.manna@intel.com>
References: <20240424183820.3591593-1-animesh.manna@intel.com>
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

Set the Link Off Between Frames Enable bit in ALPM_CTL register.

Note: Lobf need to be enabled adaptive sync fixed refresh mode
where vmin = vmax = flipline, which will arise after cmmr feature
enablement. Will add enabling sequence in a separate patch.

Signed-off-by: Animesh Manna <animesh.manna@intel.com>
---
 drivers/gpu/drm/i915/display/intel_alpm.c | 13 +++++++++----
 drivers/gpu/drm/i915/display/intel_alpm.h |  4 ++--
 drivers/gpu/drm/i915/display/intel_psr.c  |  2 +-
 3 files changed, 12 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_alpm.c b/drivers/gpu/drm/i915/display/intel_alpm.c
index 3bb69ed16aab..b08799586b58 100644
--- a/drivers/gpu/drm/i915/display/intel_alpm.c
+++ b/drivers/gpu/drm/i915/display/intel_alpm.c
@@ -290,10 +290,11 @@ void intel_alpm_compute_lobf_config(struct intel_dp *intel_dp,
 	}
 }
 
-static void lnl_alpm_configure(struct intel_dp *intel_dp)
+static void lnl_alpm_configure(struct intel_dp *intel_dp,
+			       const struct intel_crtc_state *crtc_state)
 {
 	struct drm_i915_private *dev_priv = dp_to_i915(intel_dp);
-	enum transcoder cpu_transcoder = intel_dp->psr.transcoder;
+	enum transcoder cpu_transcoder = crtc_state->cpu_transcoder;
 	u32 alpm_ctl;
 
 	if (DISPLAY_VER(dev_priv) < 20 || (!intel_dp->psr.psr2_enabled &&
@@ -329,12 +330,16 @@ static void lnl_alpm_configure(struct intel_dp *intel_dp)
 			   ALPM_CTL_EXTENDED_FAST_WAKE_TIME(intel_dp->alpm_parameters.fast_wake_lines);
 	}
 
+	if (crtc_state->has_lobf)
+		alpm_ctl |= ALPM_CTL_LOBF_ENABLE;
+
 	alpm_ctl |= ALPM_CTL_ALPM_ENTRY_CHECK(intel_dp->alpm_parameters.check_entry_lines);
 
 	intel_de_write(dev_priv, ALPM_CTL(cpu_transcoder), alpm_ctl);
 }
 
-void intel_alpm_configure(struct intel_dp *intel_dp)
+void intel_alpm_configure(struct intel_dp *intel_dp,
+			  const struct intel_crtc_state *crtc_state)
 {
-	lnl_alpm_configure(intel_dp);
+	lnl_alpm_configure(intel_dp, crtc_state);
 }
diff --git a/drivers/gpu/drm/i915/display/intel_alpm.h b/drivers/gpu/drm/i915/display/intel_alpm.h
index b9602b71d28f..a9ca190da3e4 100644
--- a/drivers/gpu/drm/i915/display/intel_alpm.h
+++ b/drivers/gpu/drm/i915/display/intel_alpm.h
@@ -18,6 +18,6 @@ bool intel_alpm_compute_params(struct intel_dp *intel_dp,
 void intel_alpm_compute_lobf_config(struct intel_dp *intel_dp,
 				    struct intel_crtc_state *crtc_state,
 				    struct drm_connector_state *conn_state);
-void intel_alpm_configure(struct intel_dp *intel_dp);
-
+void intel_alpm_configure(struct intel_dp *intel_dp,
+			  const struct intel_crtc_state *crtc_state);
 #endif
diff --git a/drivers/gpu/drm/i915/display/intel_psr.c b/drivers/gpu/drm/i915/display/intel_psr.c
index c4ab289dbc15..4eb45df20ad2 100644
--- a/drivers/gpu/drm/i915/display/intel_psr.c
+++ b/drivers/gpu/drm/i915/display/intel_psr.c
@@ -1611,7 +1611,7 @@ static void intel_psr_enable_source(struct intel_dp *intel_dp,
 			     IGNORE_PSR2_HW_TRACKING : 0);
 
 	if (intel_dp_is_edp(intel_dp))
-		intel_alpm_configure(intel_dp);
+		intel_alpm_configure(intel_dp, crtc_state);
 
 	/*
 	 * Wa_16013835468
-- 
2.29.0

