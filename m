Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AF356D09FB
	for <lists+dri-devel@lfdr.de>; Thu, 30 Mar 2023 17:40:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C048D10EEEF;
	Thu, 30 Mar 2023 15:40:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AEB610EEE8;
 Thu, 30 Mar 2023 15:40:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680190831; x=1711726831;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=uIurp6EJax5lb5cv527b4HQfjuvAUskbrTIcagNT4rc=;
 b=iw4TJ6Wl38QyQhWLQbQcflzgORE9EAFwD4JRSvfNjz+Qtkq7sqfsoxsV
 1BVE4LdqAG/cY3FffNQw7e/1NIqiXbpFhERdwWrHo2mjQQvOxjOOEEfhJ
 RFMNFtBvTzLBFb/qo7s/HFc47QjRrsj3VqzT55izpVntGuLxagf/4oFUU
 nSeUmslbBPNP7cOtFzuxQS3x2QUMj9sYdbHlB1E9A9/nq2jIfJpR6Un+w
 sUI1JY9k1Zb8acEYYHKnBUB2AvX7GsnhLMbKjNVkohvR+hleBVrgKqfvM
 eaaqnS24iCwGIt737ywnaE1kGEKZjvFZuE3FPSSAg+QgsAMOfnWPcQR4e g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="329722199"
X-IronPort-AV: E=Sophos;i="5.98,305,1673942400"; d="scan'208";a="329722199"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2023 08:40:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="687294910"
X-IronPort-AV: E=Sophos;i="5.98,305,1673942400"; d="scan'208";a="687294910"
Received: from unknown (HELO localhost) ([10.237.66.160])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2023 08:40:29 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 07/12] drm/exynos: fix is_hdmi usage
Date: Thu, 30 Mar 2023 18:39:44 +0300
Message-Id: <c56e228b8867434554d2fdd3995bfe7f4d8cbb9a.1680190534.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1680190534.git.jani.nikula@intel.com>
References: <cover.1680190534.git.jani.nikula@intel.com>
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
Cc: jani.nikula@intel.com, intel-gfx@lists.freedesktop.org,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

drm_connector_update_edid_property() must have been called before to
ensure is_hdmi has been populated.

Cc: Inki Dae <inki.dae@samsung.com>
Cc: Seung-Woo Kim <sw0312.kim@samsung.com>
Cc: Kyungmin Park <kyungmin.park@samsung.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/exynos/exynos_hdmi.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.c b/drivers/gpu/drm/exynos/exynos_hdmi.c
index b7c11bdce2c8..d53d511bcc63 100644
--- a/drivers/gpu/drm/exynos/exynos_hdmi.c
+++ b/drivers/gpu/drm/exynos/exynos_hdmi.c
@@ -893,12 +893,13 @@ static int hdmi_get_modes(struct drm_connector *connector)
 	if (!edid)
 		return -ENODEV;
 
+	drm_connector_update_edid_property(connector, edid);
+
 	hdata->dvi_mode = !connector->display_info.is_hdmi;
 	DRM_DEV_DEBUG_KMS(hdata->dev, "%s : width[%d] x height[%d]\n",
 			  (hdata->dvi_mode ? "dvi monitor" : "hdmi monitor"),
 			  edid->width_cm, edid->height_cm);
 
-	drm_connector_update_edid_property(connector, edid);
 	cec_notifier_set_phys_addr_from_edid(hdata->notifier, edid);
 
 	ret = drm_add_edid_modes(connector, edid);
-- 
2.39.2

