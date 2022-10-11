Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C241F5FB3C7
	for <lists+dri-devel@lfdr.de>; Tue, 11 Oct 2022 15:51:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DCBF10E80B;
	Tue, 11 Oct 2022 13:50:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0A5B10E3A7;
 Tue, 11 Oct 2022 13:50:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1665496226; x=1697032226;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=baKS1cZhrgdRmsytgQGpv2jCiTHnzjHr6bqMesLkxV4=;
 b=WQUrXaOjXp5WwyaORNUYfgbQONI3xaj1MwWFGFidpDKYxLC8Na6BC4uI
 RGM/b6h/QY8HHHiJjC77CaA7MTm4Bnko16ALwhNHUxN7c5LW6q9Naq36o
 U9CbhAp05YFSHaNrAxYId2INIAlQBJ9IvtoEa7tB3dL4a3i3rrcHhKj5R
 nGE9cXHoJD4hg08Tlv0OS2nq2TKItxQNNxQVe8FdyLIego29/iNLJXEhx
 TpcsapBw+qqoNJTdPjysbbboJ9+aOLLtFofPv48hPSNeKj8Kg8QJPMaXi
 baWRcrw3wcTbap5fLpxl+QZ2gBMebJusgpt+EH4RVJ7caqCzLp+Awj5t4 w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10497"; a="302116569"
X-IronPort-AV: E=Sophos;i="5.95,176,1661842800"; d="scan'208";a="302116569"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2022 06:50:03 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10497"; a="871510006"
X-IronPort-AV: E=Sophos;i="5.95,176,1661842800"; d="scan'208";a="871510006"
Received: from milawils-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.40.183])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2022 06:50:01 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 02/15] drm/i915/hdmi: stop using connector->override_edid
Date: Tue, 11 Oct 2022 16:49:36 +0300
Message-Id: <98759771776c57e31c1e673dca651d2892738f63.1665496046.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1665496046.git.jani.nikula@intel.com>
References: <cover.1665496046.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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
Cc: jani.nikula@intel.com, intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The connector->override_edid flag is strictly for EDID override debugfs
management, and drivers have no business using it.

The check for override_edid was added in commit 301906290553 ("drm/i915:
Ignore TMDS clock limit for DP++ when EDID override is set") to
facilitate mode list cross-checking against modes in override EDID when
the connector in question isn't even connected. The dual mode detect
fallback would do VBT based limiting in this case.

Instead of override EDID, check for connector forcing in the fallback.

Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/display/intel_hdmi.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.c b/drivers/gpu/drm/i915/display/intel_hdmi.c
index a332eaac86cd..878a65c887f7 100644
--- a/drivers/gpu/drm/i915/display/intel_hdmi.c
+++ b/drivers/gpu/drm/i915/display/intel_hdmi.c
@@ -2374,10 +2374,8 @@ intel_hdmi_dp_dual_mode_detect(struct drm_connector *connector)
 	 * if the port is a dual mode capable DP port.
 	 */
 	if (type == DRM_DP_DUAL_MODE_UNKNOWN) {
-		/* An overridden EDID imply that we want this port for testing.
-		 * Make sure not to set limits for that port.
-		 */
-		if (!connector->override_edid &&
+		if (connector->force != DRM_FORCE_ON &&
+		    connector->force != DRM_FORCE_ON_DIGITAL &&
 		    intel_bios_is_port_dp_dual_mode(dev_priv, port)) {
 			drm_dbg_kms(&dev_priv->drm,
 				    "Assuming DP dual mode adaptor presence based on VBT\n");
-- 
2.34.1

