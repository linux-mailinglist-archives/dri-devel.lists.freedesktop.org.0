Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E1FC878C370
	for <lists+dri-devel@lfdr.de>; Tue, 29 Aug 2023 13:39:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA99610E264;
	Tue, 29 Aug 2023 11:39:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62A2610E290;
 Tue, 29 Aug 2023 11:39:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693309186; x=1724845186;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YeE9dxdlwLm/2+MBrx63dQP80Hb/3tAvGNwYjeaLeX4=;
 b=jSr7sxz1IeLljHbrn7nltmMMM8hQG47FlNaJe/c8Fm/lXez3IN+6oWUe
 xPBFjYU/XAyXSSAiXlqqpAguHXxiNvlSXDtzj8abeZrXvt18RASYvT/o2
 lxnviZHrT4Vitskc0ATO4xuvacFtSPemJx34QDjpiSTeRRF8oXDwm6QEM
 ex9EYaPxrTTO+xxh/Ak0nwKEKiaUajQ94aU9WZZH+mFWPUPjMju986BFA
 MIT/90aFXaYVeRC4jmQgJ2ByaVNZradDiNy2CCTr6GV7ft6wb01Fg1qHG
 WmnxCrl5aPWZZVKL0rZcL0IZfwKzZ+xgCted8YorLayFZVGzXaDKr+3CF g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10816"; a="378063936"
X-IronPort-AV: E=Sophos;i="6.02,210,1688454000"; d="scan'208";a="378063936"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2023 04:39:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10816"; a="738669059"
X-IronPort-AV: E=Sophos;i="6.02,210,1688454000"; d="scan'208";a="738669059"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.153])
 by orsmga002.jf.intel.com with SMTP; 29 Aug 2023 04:39:44 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 29 Aug 2023 14:39:43 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 06/12] drm/i915/dvo: Populate connector->ddc
Date: Tue, 29 Aug 2023 14:39:14 +0300
Message-ID: <20230829113920.13713-7-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230829113920.13713-1-ville.syrjala@linux.intel.com>
References: <20230829113920.13713-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Populate connector->ddc, and thus create the "ddc" symlink
in sysfs for DVO connectors.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_dvo.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dvo.c b/drivers/gpu/drm/i915/display/intel_dvo.c
index b386894c3a6d..d9f427856fb8 100644
--- a/drivers/gpu/drm/i915/display/intel_dvo.c
+++ b/drivers/gpu/drm/i915/display/intel_dvo.c
@@ -328,7 +328,6 @@ intel_dvo_detect(struct drm_connector *_connector, bool force)
 static int intel_dvo_get_modes(struct drm_connector *_connector)
 {
 	struct intel_connector *connector = to_intel_connector(_connector);
-	struct drm_i915_private *i915 = to_i915(connector->base.dev);
 	int num_modes;
 
 	/*
@@ -337,8 +336,7 @@ static int intel_dvo_get_modes(struct drm_connector *_connector)
 	 * (TV-out, for example), but for now with just TMDS and LVDS,
 	 * that's not the case.
 	 */
-	num_modes = intel_ddc_get_modes(&connector->base,
-					intel_gmbus_get_adapter(i915, GMBUS_PIN_DPC));
+	num_modes = intel_ddc_get_modes(&connector->base, connector->base.ddc);
 	if (num_modes)
 		return num_modes;
 
@@ -533,9 +531,10 @@ void intel_dvo_init(struct drm_i915_private *i915)
 		connector->polled = DRM_CONNECTOR_POLL_CONNECT |
 			DRM_CONNECTOR_POLL_DISCONNECT;
 
-	drm_connector_init(&i915->drm, &connector->base,
-			   &intel_dvo_connector_funcs,
-			   intel_dvo_connector_type(&intel_dvo->dev));
+	drm_connector_init_with_ddc(&i915->drm, &connector->base,
+				    &intel_dvo_connector_funcs,
+				    intel_dvo_connector_type(&intel_dvo->dev),
+				    intel_gmbus_get_adapter(i915, GMBUS_PIN_DPC));
 
 	drm_connector_helper_add(&connector->base,
 				 &intel_dvo_connector_helper_funcs);
-- 
2.41.0

