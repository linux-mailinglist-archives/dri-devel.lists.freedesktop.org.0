Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FBE389BB91
	for <lists+dri-devel@lfdr.de>; Mon,  8 Apr 2024 11:24:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06C97112342;
	Mon,  8 Apr 2024 09:24:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VCnUkjlc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED321112341;
 Mon,  8 Apr 2024 09:24:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712568255; x=1744104255;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=XEWuX62a/l3KdI31tWTEEk4kK4AvMsgqUVuaqnA0T7E=;
 b=VCnUkjlcP9Sk8zZZpLByuMgqR0eAjicAmRXujJHXX3bYke9O7ZwPKOz1
 j2EmLNwUDShsHfP4LDc50SYKCpQZsKtVNhYjQefDFEDWIk0NQVNRaBBhE
 QiDQq1vz2B9JUKHWBINMyBN75cTb544To05SKqdIZ/LTCVnxP9KZzRMnP
 /gP6pdLYAwgtC+4H6LWeteHT+IrN132Vc3FDMbcugN71Pd9mlZbvIb8nB
 Pm920MVZlzdDgM3hbXRDE7AVq9DoBTJjKQmDc7/4l4sWzaCdOEFqJ+wZM
 91npn3fOKyxvFw/0EUXqJz2jn8HvO+etCL6aipd1cfoSdMyFBJKXg8Baj Q==;
X-CSE-ConnectionGUID: dqx9OdDJRKiAH8IPlDAFvw==
X-CSE-MsgGUID: qO7DpUD2TUSPPXEC5/WJyQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11037"; a="18557818"
X-IronPort-AV: E=Sophos;i="6.07,186,1708416000"; d="scan'208";a="18557818"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2024 02:24:15 -0700
X-CSE-ConnectionGUID: sLwTq/7XSRarT2HRzWf8rQ==
X-CSE-MsgGUID: Wk+Mwf88T8OIGfueMu8ZdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,186,1708416000"; d="scan'208";a="20261190"
Received: from bauinger-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.42.71])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2024 02:24:12 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 jani.nikula@intel.com, ville.syrjala@linux.intel.com,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 1/7] drm/probe-helper: switch to drm device based logging
Date: Mon,  8 Apr 2024 12:23:56 +0300
Message-Id: <8b6a83edd1c3896b9d652b5368702eba5f382a1c.1712568037.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1712568037.git.jani.nikula@intel.com>
References: <cover.1712568037.git.jani.nikula@intel.com>
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

Prefer drm_dbg_kms() over DRM_DEBUG_KMS() to debug log the drm device
info.

v2: Drop changes to mode printing (Ville)

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de> # v1
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_probe_helper.c | 36 ++++++++++++++----------------
 1 file changed, 17 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/drm_probe_helper.c b/drivers/gpu/drm/drm_probe_helper.c
index 968a3ee66b1e..19bf5d298257 100644
--- a/drivers/gpu/drm/drm_probe_helper.c
+++ b/drivers/gpu/drm/drm_probe_helper.c
@@ -567,8 +567,8 @@ int drm_helper_probe_single_connector_modes(struct drm_connector *connector,
 
 	drm_modeset_acquire_init(&ctx, 0);
 
-	DRM_DEBUG_KMS("[CONNECTOR:%d:%s]\n", connector->base.id,
-			connector->name);
+	drm_dbg_kms(dev, "[CONNECTOR:%d:%s]\n", connector->base.id,
+		    connector->name);
 
 retry:
 	ret = drm_modeset_lock(&dev->mode_config.connection_mutex, &ctx);
@@ -611,11 +611,10 @@ int drm_helper_probe_single_connector_modes(struct drm_connector *connector,
 	 * check here, and if anything changed start the hotplug code.
 	 */
 	if (old_status != connector->status) {
-		DRM_DEBUG_KMS("[CONNECTOR:%d:%s] status updated from %s to %s\n",
-			      connector->base.id,
-			      connector->name,
-			      drm_get_connector_status_name(old_status),
-			      drm_get_connector_status_name(connector->status));
+		drm_dbg_kms(dev, "[CONNECTOR:%d:%s] status updated from %s to %s\n",
+			    connector->base.id, connector->name,
+			    drm_get_connector_status_name(old_status),
+			    drm_get_connector_status_name(connector->status));
 
 		/*
 		 * The hotplug event code might call into the fb
@@ -638,8 +637,8 @@ int drm_helper_probe_single_connector_modes(struct drm_connector *connector,
 		drm_kms_helper_poll_enable(dev);
 
 	if (connector->status == connector_status_disconnected) {
-		DRM_DEBUG_KMS("[CONNECTOR:%d:%s] disconnected\n",
-			connector->base.id, connector->name);
+		drm_dbg_kms(dev, "[CONNECTOR:%d:%s] disconnected\n",
+			    connector->base.id, connector->name);
 		drm_connector_update_edid_property(connector, NULL);
 		drm_mode_prune_invalid(dev, &connector->modes, false);
 		goto exit;
@@ -697,8 +696,9 @@ int drm_helper_probe_single_connector_modes(struct drm_connector *connector,
 
 	drm_mode_sort(&connector->modes);
 
-	DRM_DEBUG_KMS("[CONNECTOR:%d:%s] probed modes :\n", connector->base.id,
-			connector->name);
+	drm_dbg_kms(dev, "[CONNECTOR:%d:%s] probed modes:\n",
+		    connector->base.id, connector->name);
+
 	list_for_each_entry(mode, &connector->modes, head) {
 		drm_mode_set_crtcinfo(mode, CRTC_INTERLACE_HALVE_V);
 		drm_mode_debug_printmodeline(mode);
@@ -834,14 +834,12 @@ static void output_poll_execute(struct work_struct *work)
 			old = drm_get_connector_status_name(old_status);
 			new = drm_get_connector_status_name(connector->status);
 
-			DRM_DEBUG_KMS("[CONNECTOR:%d:%s] "
-				      "status updated from %s to %s\n",
-				      connector->base.id,
-				      connector->name,
-				      old, new);
-			DRM_DEBUG_KMS("[CONNECTOR:%d:%s] epoch counter %llu -> %llu\n",
-				      connector->base.id, connector->name,
-				      old_epoch_counter, connector->epoch_counter);
+			drm_dbg_kms(dev, "[CONNECTOR:%d:%s] status updated from %s to %s\n",
+				    connector->base.id, connector->name,
+				    old, new);
+			drm_dbg_kms(dev, "[CONNECTOR:%d:%s] epoch counter %llu -> %llu\n",
+				    connector->base.id, connector->name,
+				    old_epoch_counter, connector->epoch_counter);
 
 			changed = true;
 		}
-- 
2.39.2

