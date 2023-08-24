Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73A0D78710E
	for <lists+dri-devel@lfdr.de>; Thu, 24 Aug 2023 16:07:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5FAE10E559;
	Thu, 24 Aug 2023 14:07:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 315FF10E557;
 Thu, 24 Aug 2023 14:07:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692886046; x=1724422046;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MglY81mYDGaMoyIFxCair+EvjWxNiFw45aMMSA3BClI=;
 b=Oe6Ys1WAcTvH8H3e1hthRtwmOJiFTeUROS7+MWe1ZJe7RGZilzTHeVZn
 xA0CE2FcNu6Ttivznn7viqDb2pNPeKsS8MXqgFNoK8MV1vphSekdjs5Cf
 wb9ziu5Ry7RboffJB8bqLoB1QronIANizrED06eWQ94WZs+wfBJjTmuQ7
 R+K8zIhxb4dQZig3LWiB0pYUQ9Rm8Xj4l6JiXHuB4TirV/nK5NovhPklD
 j/2q+usHECdbZmZAB1bbTzJUDEvv3wDQm8mxPdiYuF+pORU6kFOlmvMy2
 2OnZ9LaNa5Gbv91PloTOOsiamUrUzPKOtmA2PLkb7OJMyuShXClV+1AFn Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10812"; a="364633857"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; d="scan'208";a="364633857"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2023 06:46:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10812"; a="766545246"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; d="scan'208";a="766545246"
Received: from jnikula-mobl4.fi.intel.com (HELO localhost) ([10.237.66.162])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2023 06:46:39 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 5/6] drm/i915/cec: switch to setting physical address directly
Date: Thu, 24 Aug 2023 16:46:06 +0300
Message-Id: <01a90c82c8a4f2fd945e0181ffeaca595928d19e.1692884619.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1692884619.git.jani.nikula@intel.com>
References: <cover.1692884619.git.jani.nikula@intel.com>
MIME-Version: 1.0
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
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Jani Nikula <jani.nikula@intel.com>, intel-gfx@lists.freedesktop.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Avoid parsing the EDID again for source physical address. Also gets rids
of a few remaining raw EDID usages.

Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: linux-media@vger.kernel.org
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c   | 7 ++-----
 drivers/gpu/drm/i915/display/intel_hdmi.c | 5 ++---
 2 files changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 7067ee3a4bd3..c4b8e0e74c15 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -5198,7 +5198,6 @@ intel_dp_set_edid(struct intel_dp *intel_dp)
 	struct drm_i915_private *i915 = dp_to_i915(intel_dp);
 	struct intel_connector *connector = intel_dp->attached_connector;
 	const struct drm_edid *drm_edid;
-	const struct edid *edid;
 	bool vrr_capable;
 
 	intel_dp_unset_edid(intel_dp);
@@ -5216,10 +5215,8 @@ intel_dp_set_edid(struct intel_dp *intel_dp)
 	intel_dp_update_dfp(intel_dp, drm_edid);
 	intel_dp_update_420(intel_dp);
 
-	/* FIXME: Get rid of drm_edid_raw() */
-	edid = drm_edid_raw(drm_edid);
-
-	drm_dp_cec_set_edid(&intel_dp->aux, edid);
+	drm_dp_cec_attach(&intel_dp->aux,
+			  connector->base.display_info.source_physical_address);
 }
 
 static void
diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.c b/drivers/gpu/drm/i915/display/intel_hdmi.c
index aa9915098dda..5d6255ee8b54 100644
--- a/drivers/gpu/drm/i915/display/intel_hdmi.c
+++ b/drivers/gpu/drm/i915/display/intel_hdmi.c
@@ -2482,9 +2482,8 @@ intel_hdmi_set_edid(struct drm_connector *connector)
 
 	intel_display_power_put(dev_priv, POWER_DOMAIN_GMBUS, wakeref);
 
-	/* FIXME: Get rid of drm_edid_raw() */
-	cec_notifier_set_phys_addr_from_edid(intel_hdmi->cec_notifier,
-					     drm_edid_raw(drm_edid));
+	cec_notifier_set_phys_addr(intel_hdmi->cec_notifier,
+				   connector->display_info.source_physical_address);
 
 	return connected;
 }
-- 
2.39.2

