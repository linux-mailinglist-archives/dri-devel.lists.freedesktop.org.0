Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7038295BD8A
	for <lists+dri-devel@lfdr.de>; Thu, 22 Aug 2024 19:43:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE50F10EBAD;
	Thu, 22 Aug 2024 17:43:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ft5IdTNU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2469310EBAB
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Aug 2024 17:43:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724348602; x=1755884602;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lq2ZDp6MTf10HE4gqxlSJaCI0iEPX29iqODst1YOJcc=;
 b=Ft5IdTNU+Hn5Y5cKrgl0Gc7itOIrb7PeQuD9Ee+P0G/ShfMe6JL1WfPt
 8hZuSgSGXqh8d1DFzF7Qh2TbkR+un4hGn02A8XaqJKU6LAuVioIFlGaXm
 2XxMueaz0lY5L7Y7lf6usbn+NrDGF6D0hkmpsnxGuFwzCAHDOmJUZE8po
 JxXIowsr8NUyI55+cRm6KjTymEw29IkoiRgmBhhaO5FuznnWdIjOOk4Cz
 aq2SnS/IRxTvloF+x8hbXsChZoK8aRqEGA51/CSe6gCgC2EK+/eU1fD9K
 PN7oW/kBoU0XTQnPriRlPEXBFH4tXSLiMoiz5M7FdRyHEGSvx85SQ9/8W w==;
X-CSE-ConnectionGUID: 7GvqWYGcQaeEbVFe2CilmQ==
X-CSE-MsgGUID: 57KQtnKdRrmeC+qRL5PUqw==
X-IronPort-AV: E=McAfee;i="6700,10204,11172"; a="22955396"
X-IronPort-AV: E=Sophos;i="6.10,167,1719903600"; d="scan'208";a="22955396"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2024 10:43:21 -0700
X-CSE-ConnectionGUID: 4rHKlYFvQ3KDlZAtBi6X3w==
X-CSE-MsgGUID: ZiejBel7QECrwpTufup+ng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,167,1719903600"; d="scan'208";a="65862367"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.121])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2024 10:43:17 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: jani.nikula@intel.com, Inki Dae <inki.dae@samsung.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Subject: [PATCH 3/6] drm/exynos: hdmi: convert to struct drm_edid
Date: Thu, 22 Aug 2024 20:42:49 +0300
Message-Id: <be15dce66a5373a7aed797a4ef63b0ba90b231e9.1724348429.git.jani.nikula@intel.com>
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

Prefer the struct drm_edid based functions for reading the EDID and
updating the connector.

The functional change is that the CEC physical address gets invalidated
when the EDID could not be read.

v2:
- display info usage was split to a separate patch
- check drm_edid_connector_update() return value

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
 drivers/gpu/drm/exynos/exynos_hdmi.c | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.c b/drivers/gpu/drm/exynos/exynos_hdmi.c
index 25d508b25921..c9d4b9146df9 100644
--- a/drivers/gpu/drm/exynos/exynos_hdmi.c
+++ b/drivers/gpu/drm/exynos/exynos_hdmi.c
@@ -884,14 +884,21 @@ static int hdmi_get_modes(struct drm_connector *connector)
 {
 	struct hdmi_context *hdata = connector_to_hdmi(connector);
 	const struct drm_display_info *info = &connector->display_info;
-	struct edid *edid;
+	const struct drm_edid *drm_edid;
 	int ret;
 
 	if (!hdata->ddc_adpt)
 		goto no_edid;
 
-	edid = drm_get_edid(connector, hdata->ddc_adpt);
-	if (!edid)
+	drm_edid = drm_edid_read_ddc(connector, hdata->ddc_adpt);
+
+	ret = drm_edid_connector_update(connector, drm_edid);
+	if (ret)
+		return 0;
+
+	cec_notifier_set_phys_addr(hdata->notifier, info->source_physical_address);
+
+	if (!drm_edid)
 		goto no_edid;
 
 	hdata->dvi_mode = !info->is_hdmi;
@@ -899,12 +906,9 @@ static int hdmi_get_modes(struct drm_connector *connector)
 			  (hdata->dvi_mode ? "dvi monitor" : "hdmi monitor"),
 			  info->width_mm / 10, info->height_mm / 10);
 
-	drm_connector_update_edid_property(connector, edid);
-	cec_notifier_set_phys_addr_from_edid(hdata->notifier, edid);
-
-	ret = drm_add_edid_modes(connector, edid);
+	ret = drm_edid_connector_add_modes(connector);
 
-	kfree(edid);
+	drm_edid_free(drm_edid);
 
 	return ret;
 
-- 
2.39.2

