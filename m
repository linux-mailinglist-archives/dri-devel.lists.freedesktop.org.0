Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D63D95327F5
	for <lists+dri-devel@lfdr.de>; Tue, 24 May 2022 12:40:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9660510F4C8;
	Tue, 24 May 2022 10:40:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BFFC10F4C8;
 Tue, 24 May 2022 10:40:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1653388827; x=1684924827;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QKDt+ISNfdiq3NT4I1s3a2U1I/RYvsSExH0MxbfAk6Y=;
 b=WNUpwYrW/Y9jw4VATP4R06cx9rOfM+tmBVpWu+xSEhqyJ74bF2/aJdTT
 kG33DOim7/rgEsTBKIOd9NE4wnTPO3k+LRIQXWcT/qE8ryXdFPfoiAgvI
 PSmHsPqgxF3T75Ibh/RdLo1RMF9G9u1kGbiOo9RyPIjHHwIOqWCFwkBRu
 h9hrLNCPZUw5dSII0pZSddz1PeSkBh2vKsxYWgN3MLBKszgnhGwwbFvhK
 wN8hzAhS0D1mjxrP9sR5xOLTx0NxgJF3WFtZ+4EKxWMXmJz/veg0tolV/
 GMdJHYBtnelMmHYohANJRiTGoXLoyXaXZ7GjpunlzQTUkstvqWxvfjm82 Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10356"; a="271068210"
X-IronPort-AV: E=Sophos;i="5.91,248,1647327600"; d="scan'208";a="271068210"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2022 03:40:26 -0700
X-IronPort-AV: E=Sophos;i="5.91,248,1647327600"; d="scan'208";a="572562179"
Received: from zychseba-mobl.ger.corp.intel.com (HELO localhost)
 ([10.249.136.104])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2022 03:40:23 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH v1 05/13] drm/probe-helper: abstract .get_modes() connector
 helper call
Date: Tue, 24 May 2022 13:39:27 +0300
Message-Id: <aa90d514a6f34192ec796f92c8c2f6d084e8b63e.1653381821.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1653381821.git.jani.nikula@intel.com>
References: <cover.1653381821.git.jani.nikula@intel.com>
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
Cc: jani.nikula@intel.com, David Airlie <airlied@linux.ie>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Abstract the .get_modes() connector helper call, including the
override/firmware EDID fallback, to make it easier to extend it.

Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_probe_helper.c | 29 +++++++++++++++++++----------
 1 file changed, 19 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/drm_probe_helper.c b/drivers/gpu/drm/drm_probe_helper.c
index 425f56280d51..836bcd5b4cb6 100644
--- a/drivers/gpu/drm/drm_probe_helper.c
+++ b/drivers/gpu/drm/drm_probe_helper.c
@@ -354,6 +354,24 @@ drm_helper_probe_detect(struct drm_connector *connector,
 }
 EXPORT_SYMBOL(drm_helper_probe_detect);
 
+static int drm_helper_probe_get_modes(struct drm_connector *connector)
+{
+	const struct drm_connector_helper_funcs *connector_funcs =
+		connector->helper_private;
+	int count;
+
+	count = connector_funcs->get_modes(connector);
+
+	/*
+	 * Fallback for when DDC probe failed in drm_get_edid() and thus skipped
+	 * override/firmware EDID.
+	 */
+	if (count == 0 && connector->status == connector_status_connected)
+		count = drm_add_override_edid_modes(connector);
+
+	return count;
+}
+
 static int __drm_helper_update_and_validate(struct drm_connector *connector,
 					    uint32_t maxX, uint32_t maxY,
 					    struct drm_modeset_acquire_ctx *ctx)
@@ -473,8 +491,6 @@ int drm_helper_probe_single_connector_modes(struct drm_connector *connector,
 {
 	struct drm_device *dev = connector->dev;
 	struct drm_display_mode *mode;
-	const struct drm_connector_helper_funcs *connector_funcs =
-		connector->helper_private;
 	int count = 0, ret;
 	enum drm_connector_status old_status;
 	struct drm_modeset_acquire_ctx ctx;
@@ -559,14 +575,7 @@ int drm_helper_probe_single_connector_modes(struct drm_connector *connector,
 		goto exit;
 	}
 
-	count = (*connector_funcs->get_modes)(connector);
-
-	/*
-	 * Fallback for when DDC probe failed in drm_get_edid() and thus skipped
-	 * override/firmware EDID.
-	 */
-	if (count == 0 && connector->status == connector_status_connected)
-		count = drm_add_override_edid_modes(connector);
+	count = drm_helper_probe_get_modes(connector);
 
 	if (count == 0 && (connector->status == connector_status_connected ||
 			   connector->status == connector_status_unknown))
-- 
2.30.2

