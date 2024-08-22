Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B158E95BD89
	for <lists+dri-devel@lfdr.de>; Thu, 22 Aug 2024 19:43:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFAAD10EBAC;
	Thu, 22 Aug 2024 17:43:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eGHjYo9q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7C6110EBAC
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Aug 2024 17:43:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724348601; x=1755884601;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=E7weO86RaaW0WwgTg3wIfhJ+GMQh3XUa23negJ/H4uk=;
 b=eGHjYo9qxPBxeLJfxXXF7KZc1ejTnDoOIfWIbhyO065TiOPNe0+j6oG+
 vo3osOsK2jXar+FHDRWFaNKkBT89xRKut+vpL78wTN3gG5Tedl7MDQAHy
 bI5aMXAVulWJsEbJK37zlAnQCLftrvgLXgRhRtrnobR0JJtFkKGizPr7n
 q2lHp5JyYJDHyh8IiI/FEuTXjBqMe9fwvl978BgXkSDetkc0MYc52hsGz
 GL6jFXk7giJNpQCHyTlcS+Ra+7v9l9aLEuKFFkTJuxQ/F+tIj1o9F9ZVe
 8keoyhV20kMaiWYgZdhKnApG5c2T1eeakAClLwVhxy0XOq2AmCb5TBxDo g==;
X-CSE-ConnectionGUID: mrHHPo95S0+w/gxGTPrmFg==
X-CSE-MsgGUID: t3ZsUoN4SJ+zaMWDqWJgXg==
X-IronPort-AV: E=McAfee;i="6700,10204,11172"; a="22955371"
X-IronPort-AV: E=Sophos;i="6.10,167,1719903600"; d="scan'208";a="22955371"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2024 10:43:15 -0700
X-CSE-ConnectionGUID: s3uJDQv4SrKmVtyLgQ7tmQ==
X-CSE-MsgGUID: UbB7lboWTFCHCoz7CG6Bgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,167,1719903600"; d="scan'208";a="65862350"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.121])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2024 10:43:11 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: jani.nikula@intel.com, Inki Dae <inki.dae@samsung.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Subject: [PATCH 2/6] drm/exynos: hdmi: use display_info for printing display
 dimensions
Date: Thu, 22 Aug 2024 20:42:48 +0300
Message-Id: <8a6fd6de1853dbc337c5c26c65268604d3e91fe2.1724348429.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1724348429.git.jani.nikula@intel.com>
References: <cover.1724348429.git.jani.nikula@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Look up display dimensions from display_info instead of the EDID
directly. This will be helpful for the follow-up work.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>

---

Cc: Inki Dae <inki.dae@samsung.com>
Cc: Seung-Woo Kim <sw0312.kim@samsung.com>
Cc: Kyungmin Park <kyungmin.park@samsung.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org
---
 drivers/gpu/drm/exynos/exynos_hdmi.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.c b/drivers/gpu/drm/exynos/exynos_hdmi.c
index 1e26cd4f8347..25d508b25921 100644
--- a/drivers/gpu/drm/exynos/exynos_hdmi.c
+++ b/drivers/gpu/drm/exynos/exynos_hdmi.c
@@ -883,6 +883,7 @@ static const struct drm_connector_funcs hdmi_connector_funcs = {
 static int hdmi_get_modes(struct drm_connector *connector)
 {
 	struct hdmi_context *hdata = connector_to_hdmi(connector);
+	const struct drm_display_info *info = &connector->display_info;
 	struct edid *edid;
 	int ret;
 
@@ -893,10 +894,10 @@ static int hdmi_get_modes(struct drm_connector *connector)
 	if (!edid)
 		goto no_edid;
 
-	hdata->dvi_mode = !connector->display_info.is_hdmi;
+	hdata->dvi_mode = !info->is_hdmi;
 	DRM_DEV_DEBUG_KMS(hdata->dev, "%s : width[%d] x height[%d]\n",
 			  (hdata->dvi_mode ? "dvi monitor" : "hdmi monitor"),
-			  edid->width_cm, edid->height_cm);
+			  info->width_mm / 10, info->height_mm / 10);
 
 	drm_connector_update_edid_property(connector, edid);
 	cec_notifier_set_phys_addr_from_edid(hdata->notifier, edid);
-- 
2.39.2

