Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B972D87589B
	for <lists+dri-devel@lfdr.de>; Thu,  7 Mar 2024 21:40:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D50810F540;
	Thu,  7 Mar 2024 20:40:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QLm7eKGm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F33CE10F549;
 Thu,  7 Mar 2024 20:39:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709843999; x=1741379999;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=D9ezw7a6RuvAHuN/B3QRoStIbWAL7JrC2Ww3zH8czl0=;
 b=QLm7eKGm8yljDXRN5aGuj63WYTeI1Yv/WPG0eKkVUrmUtOhpBhiyOL5T
 vQVEFaAW/tW2bRhywjTp1qcgb+L/11G2mjS+L5k+mwR/O7GFeyb/DknMu
 ngXA1LnH/Leufp71nJwDQ+oBB+Dfr5JKTGv2Ok9NagENUINdsd1biqLDw
 2uunXnmzko9eSPGGg3aYMuVNdWqp88FlEPnErpuUQ2tyUhZClI/Nb8KEV
 5AnNh9BNnSHMkkjt5bvhTKZhdnEskkb1BwXp5t6Qh7frM/b/cSCB+y7EX
 p4pXtqXnk1Gvrjf8n5WJuFzD/X/b7r8wCekxMlmvJu4HSmYCh9AM4gW6q Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11006"; a="4664232"
X-IronPort-AV: E=Sophos;i="6.07,107,1708416000"; 
   d="scan'208";a="4664232"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2024 12:39:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,107,1708416000"; d="scan'208";a="10675532"
Received: from tofferse-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.33.212])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2024 12:39:56 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 jani.nikula@intel.com
Subject: [PATCH 2/6] drm/probe-helper: switch to drm device based logging
Date: Thu,  7 Mar 2024 22:39:34 +0200
Message-Id: <033203265a6db8a34655741ee51d92abf5b899ef.1709843865.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1709843865.git.jani.nikula@intel.com>
References: <cover.1709843865.git.jani.nikula@intel.com>
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
info. Also use drm_mode_print() for drm device specific debug logging
the probed modes.

This changes the probed modes output from the format:

[drm:drm_helper_probe_single_connector_modes] [CONNECTOR:290:DP-5] probed modes :
[drm:drm_mode_debug_printmodeline] Modeline "3840x2160": 60 533250 3840 3888 3920 4000 2160 2163 2168 2222 0x48 0x9

to format:

i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_modes] [CONNECTOR:290:DP-5] probed modes:
i915 0000:00:02.0: [drm] Probed mode: "3840x2160": 60 533250 3840 3888 3920 4000 2160 2163 2168 2222 0x48 0x9

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_probe_helper.c | 41 +++++++++++++++---------------
 1 file changed, 21 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/drm_probe_helper.c b/drivers/gpu/drm/drm_probe_helper.c
index 4d60cc810b57..af754fbac3f4 100644
--- a/drivers/gpu/drm/drm_probe_helper.c
+++ b/drivers/gpu/drm/drm_probe_helper.c
@@ -554,13 +554,14 @@ int drm_helper_probe_single_connector_modes(struct drm_connector *connector,
 	int count = 0, ret;
 	enum drm_connector_status old_status;
 	struct drm_modeset_acquire_ctx ctx;
+	struct drm_printer p;
 
 	WARN_ON(!mutex_is_locked(&dev->mode_config.mutex));
 
 	drm_modeset_acquire_init(&ctx, 0);
 
-	DRM_DEBUG_KMS("[CONNECTOR:%d:%s]\n", connector->base.id,
-			connector->name);
+	drm_dbg_kms(dev, "[CONNECTOR:%d:%s]\n", connector->base.id,
+		    connector->name);
 
 retry:
 	ret = drm_modeset_lock(&dev->mode_config.connection_mutex, &ctx);
@@ -603,11 +604,10 @@ int drm_helper_probe_single_connector_modes(struct drm_connector *connector,
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
@@ -630,8 +630,8 @@ int drm_helper_probe_single_connector_modes(struct drm_connector *connector,
 		drm_kms_helper_poll_enable(dev);
 
 	if (connector->status == connector_status_disconnected) {
-		DRM_DEBUG_KMS("[CONNECTOR:%d:%s] disconnected\n",
-			connector->base.id, connector->name);
+		drm_dbg_kms(dev, "[CONNECTOR:%d:%s] disconnected\n",
+			    connector->base.id, connector->name);
 		drm_connector_update_edid_property(connector, NULL);
 		drm_mode_prune_invalid(dev, &connector->modes, false);
 		goto exit;
@@ -689,11 +689,14 @@ int drm_helper_probe_single_connector_modes(struct drm_connector *connector,
 
 	drm_mode_sort(&connector->modes);
 
-	DRM_DEBUG_KMS("[CONNECTOR:%d:%s] probed modes :\n", connector->base.id,
-			connector->name);
+	drm_dbg_kms(dev, "[CONNECTOR:%d:%s] probed modes:\n",
+		    connector->base.id, connector->name);
+
+	p = drm_dbg_printer(dev, DRM_UT_KMS, "Probed mode:");
+
 	list_for_each_entry(mode, &connector->modes, head) {
 		drm_mode_set_crtcinfo(mode, CRTC_INTERLACE_HALVE_V);
-		drm_mode_debug_printmodeline(mode);
+		drm_mode_print(&p, mode);
 	}
 
 	return count;
@@ -826,14 +829,12 @@ static void output_poll_execute(struct work_struct *work)
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

