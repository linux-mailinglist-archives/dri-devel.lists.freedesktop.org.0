Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE17560A653
	for <lists+dri-devel@lfdr.de>; Mon, 24 Oct 2022 14:34:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A61E210E47C;
	Mon, 24 Oct 2022 12:34:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05FEE10E432;
 Mon, 24 Oct 2022 12:33:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666614840; x=1698150840;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5FhWzpbCfTqX/0XsegqtptYTrVV0gv79v9w1yd4cKzk=;
 b=jatgj/t5HX1aT0BTZfYxMR7VYeOIPzfpAfbr9PWsozLhkC3+5CVpBHYX
 R62PeYMZRfL0mzAFw+6F6kkakdM7llT50/sBkpctOHw+kiA5v+8l2rHc2
 dh4zYA+bd1m4f1LPHJawJKfGhamLEyC6YjsSx0lfWPCSkzC98lbwYtHD3
 iae7fGwyyQ6tKlsqyhU3ZzsUrp6/VKlDhBz1B/v2pEc2AVTnHb1MWle6v
 qDYtAGy4srV0r42+DZvoDzLIyRrfyhzzsWZRmKHdTJz0WQE9z+ishUO9n
 xXXDkArNqvlJ22Okpqri50dW9gVOnscv6wGZMGMNzpclbsLFGK9HP1s8B w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10509"; a="309091356"
X-IronPort-AV: E=Sophos;i="5.95,209,1661842800"; d="scan'208";a="309091356"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2022 05:33:59 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10509"; a="626055618"
X-IronPort-AV: E=Sophos;i="5.95,209,1661842800"; d="scan'208";a="626055618"
Received: from emontau-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.252.52.221])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2022 05:33:57 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 02/16] drm/i915/hdmi: stop using connector->override_edid
Date: Mon, 24 Oct 2022 15:33:30 +0300
Message-Id: <c8b45867cf37134ab40be23e22825ca45adc6041.1666614699.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1666614699.git.jani.nikula@intel.com>
References: <cover.1666614699.git.jani.nikula@intel.com>
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

v2: Simply use !connector->force (Ville)

Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/display/intel_hdmi.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.c b/drivers/gpu/drm/i915/display/intel_hdmi.c
index a332eaac86cd..02f8374ea51f 100644
--- a/drivers/gpu/drm/i915/display/intel_hdmi.c
+++ b/drivers/gpu/drm/i915/display/intel_hdmi.c
@@ -2374,10 +2374,7 @@ intel_hdmi_dp_dual_mode_detect(struct drm_connector *connector)
 	 * if the port is a dual mode capable DP port.
 	 */
 	if (type == DRM_DP_DUAL_MODE_UNKNOWN) {
-		/* An overridden EDID imply that we want this port for testing.
-		 * Make sure not to set limits for that port.
-		 */
-		if (!connector->override_edid &&
+		if (!connector->force &&
 		    intel_bios_is_port_dp_dual_mode(dev_priv, port)) {
 			drm_dbg_kms(&dev_priv->drm,
 				    "Assuming DP dual mode adaptor presence based on VBT\n");
-- 
2.34.1

