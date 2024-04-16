Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4B858A6C23
	for <lists+dri-devel@lfdr.de>; Tue, 16 Apr 2024 15:23:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB7CE10EE1C;
	Tue, 16 Apr 2024 13:23:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BYpkng3w";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A955A112C93
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Apr 2024 13:23:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713273792; x=1744809792;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/2eyRN2tFOLOyGvhEuQRmqO9TN7u+bw4aPtw6GuWg3U=;
 b=BYpkng3wti55Bdyv+eODdXv16Q1OypccrQk7oxMspl4zsIC0uiYPIlhy
 fpWgx+g2g5EN5fiU1UWz3JZT/gYgFpStScNm0cAAaE4NWY+9OCX3Hq9ql
 daSqbZ2zKzrvF+Ck+Qe2bsED5D5LTe1EIcpdfKkDGeUm0EIHuvV69GHMP
 9tDrpx+tAhE7PSAOUoqyjzxwfMS2n18PIWP7LRYQMbT/SUUNyeMgboTgz
 qduOZuzGnAFTqByJNJqnhjJdcwlKVEuoN+9BF/Hi210zFofwLWz+dTtsK
 ntp6KP7l7SVFxcGej2j30965ccMvBgmqBa5W5SGcrJgw3Xqkns7A+44sQ Q==;
X-CSE-ConnectionGUID: fFh/Yi0PQDOBiL0Wuq8yvw==
X-CSE-MsgGUID: ct2/rS5yRo+xEcm5Oxwn2Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="26169403"
X-IronPort-AV: E=Sophos;i="6.07,206,1708416000"; d="scan'208";a="26169403"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2024 06:23:12 -0700
X-CSE-ConnectionGUID: j7l4fJUrS0qkac29SAAxOQ==
X-CSE-MsgGUID: WNNQxbfKR8mu2nwlEMbMyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,206,1708416000"; d="scan'208";a="26929228"
Received: from martakit-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.44.100])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2024 06:23:10 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: Jani Nikula <jani.nikula@intel.com>, Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 07/15] drm/vc4: hdmi: switch to struct drm_edid
Date: Tue, 16 Apr 2024 16:22:21 +0300
Message-Id: <eabece3ca7fae28395dcad0d2c221113cd924180.1713273659.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1713273659.git.jani.nikula@intel.com>
References: <cover.1713273659.git.jani.nikula@intel.com>
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

Prefer struct drm_edid based functions over struct edid.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>

---

Cc: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 46 ++++++++++++++++++----------------
 1 file changed, 25 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 5f8d51b29370..d30f8e8e8967 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -412,15 +412,14 @@ static void vc4_hdmi_handle_hotplug(struct vc4_hdmi *vc4_hdmi,
 				    enum drm_connector_status status)
 {
 	struct drm_connector *connector = &vc4_hdmi->connector;
-	struct edid *edid;
+	const struct drm_edid *drm_edid;
 	int ret;
 
 	/*
-	 * NOTE: This function should really be called with
-	 * vc4_hdmi->mutex held, but doing so results in reentrancy
-	 * issues since cec_s_phys_addr_from_edid might call
-	 * .adap_enable, which leads to that funtion being called with
-	 * our mutex held.
+	 * NOTE: This function should really be called with vc4_hdmi->mutex
+	 * held, but doing so results in reentrancy issues since
+	 * cec_s_phys_addr() might call .adap_enable, which leads to that
+	 * funtion being called with our mutex held.
 	 *
 	 * A similar situation occurs with vc4_hdmi_reset_link() that
 	 * will call into our KMS hooks if the scrambling was enabled.
@@ -435,12 +434,16 @@ static void vc4_hdmi_handle_hotplug(struct vc4_hdmi *vc4_hdmi,
 		return;
 	}
 
-	edid = drm_get_edid(connector, vc4_hdmi->ddc);
-	if (!edid)
+	drm_edid = drm_edid_read_ddc(connector, vc4_hdmi->ddc);
+
+	drm_edid_connector_update(connector, drm_edid);
+	cec_s_phys_addr(vc4_hdmi->cec_adap,
+			connector->display_info.source_physical_address, false);
+
+	if (!drm_edid)
 		return;
 
-	cec_s_phys_addr_from_edid(vc4_hdmi->cec_adap, edid);
-	kfree(edid);
+	drm_edid_free(drm_edid);
 
 	for (;;) {
 		ret = vc4_hdmi_reset_link(connector, ctx);
@@ -492,28 +495,29 @@ static int vc4_hdmi_connector_get_modes(struct drm_connector *connector)
 {
 	struct vc4_hdmi *vc4_hdmi = connector_to_vc4_hdmi(connector);
 	struct vc4_dev *vc4 = to_vc4_dev(connector->dev);
+	const struct drm_edid *drm_edid;
 	int ret = 0;
-	struct edid *edid;
 
 	/*
-	 * NOTE: This function should really take vc4_hdmi->mutex, but
-	 * doing so results in reentrancy issues since
-	 * cec_s_phys_addr_from_edid might call .adap_enable, which
-	 * leads to that funtion being called with our mutex held.
+	 * NOTE: This function should really take vc4_hdmi->mutex, but doing so
+	 * results in reentrancy issues since cec_s_phys_addr() might call
+	 * .adap_enable, which leads to that funtion being called with our mutex
+	 * held.
 	 *
 	 * Concurrency isn't an issue at the moment since we don't share
 	 * any state with any of the other frameworks so we can ignore
 	 * the lock for now.
 	 */
 
-	edid = drm_get_edid(connector, vc4_hdmi->ddc);
-	cec_s_phys_addr_from_edid(vc4_hdmi->cec_adap, edid);
-	if (!edid)
+	drm_edid = drm_edid_read_ddc(connector, vc4_hdmi->ddc);
+	drm_edid_connector_update(connector, drm_edid);
+	cec_s_phys_addr(vc4_hdmi->cec_adap,
+			connector->display_info.source_physical_address, false);
+	if (!drm_edid)
 		return 0;
 
-	drm_connector_update_edid_property(connector, edid);
-	ret = drm_add_edid_modes(connector, edid);
-	kfree(edid);
+	ret = drm_edid_connector_add_modes(connector);
+	drm_edid_free(drm_edid);
 
 	if (!vc4->hvs->vc5_hdmi_enable_hdmi_20) {
 		struct drm_device *drm = connector->dev;
-- 
2.39.2

