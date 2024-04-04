Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FF92898FB1
	for <lists+dri-devel@lfdr.de>; Thu,  4 Apr 2024 22:34:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E5E81134F7;
	Thu,  4 Apr 2024 20:34:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Y1ZM2pH8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5E4F1134EC;
 Thu,  4 Apr 2024 20:34:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712262858; x=1743798858;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=G9S3x7bpTs89Idly1FZ8/uNUvNTqaVcuGxhGEuhjpiY=;
 b=Y1ZM2pH8Cs1QXhBZLlHXWPHuDrFOuVrltMRuRErSrsIH6EXmJegiYm12
 Xo2cF+D+BPqJRSy54T49Vg8vwVk7QY0r89pZDW5W9nTQ4GebKULTWKRXS
 0BdJvY8aoMa4duGNpCTgbheq+/rjs8XM2DSTAul7stqZQhJPs7wa0PVZk
 yh6NN6e02VQ541Wvmu1eFvaN22WFHOjEPl+gijE2EcQ8C3ZQMaNYLM2ri
 CYXgdplPPOXtjGsDJXlEp66T+P12tuHXdnkalEaYsRhitTfryfBg7MVzI
 4ihiWjAguohCswZ+/GQobYwfNQbm/i2dbcL5fWNXx0ObWb7yWM8jOrnLa A==;
X-CSE-ConnectionGUID: jrMvTaFBT+yam4Kt/UOvkQ==
X-CSE-MsgGUID: joVn3RRoSkW5o+suaYjmZw==
X-IronPort-AV: E=McAfee;i="6600,9927,11034"; a="25019761"
X-IronPort-AV: E=Sophos;i="6.07,180,1708416000"; d="scan'208";a="25019761"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2024 13:34:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11034"; a="827790589"
X-IronPort-AV: E=Sophos;i="6.07,180,1708416000"; d="scan'208";a="827790589"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orsmga001.jf.intel.com with SMTP; 04 Apr 2024 13:34:15 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 04 Apr 2024 23:34:14 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org
Subject: [PATCH 12/12] drm/probe-helper: Switch to per-device debugs
Date: Thu,  4 Apr 2024 23:33:36 +0300
Message-ID: <20240404203336.10454-13-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240404203336.10454-1-ville.syrjala@linux.intel.com>
References: <20240404203336.10454-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Switch to per-device debugs so that we know which
device we're dealing with.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/drm_probe_helper.c | 35 ++++++++++++++----------------
 1 file changed, 16 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/drm_probe_helper.c b/drivers/gpu/drm/drm_probe_helper.c
index 968a3ee66b1e..0860f7367511 100644
--- a/drivers/gpu/drm/drm_probe_helper.c
+++ b/drivers/gpu/drm/drm_probe_helper.c
@@ -567,8 +567,8 @@ int drm_helper_probe_single_connector_modes(struct drm_connector *connector,
 
 	drm_modeset_acquire_init(&ctx, 0);
 
-	DRM_DEBUG_KMS("[CONNECTOR:%d:%s]\n", connector->base.id,
-			connector->name);
+	drm_dbg_kms(dev, "[CONNECTOR:%d:%s]\n",
+		    connector->base.id, connector->name);
 
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
@@ -697,8 +696,8 @@ int drm_helper_probe_single_connector_modes(struct drm_connector *connector,
 
 	drm_mode_sort(&connector->modes);
 
-	DRM_DEBUG_KMS("[CONNECTOR:%d:%s] probed modes :\n", connector->base.id,
-			connector->name);
+	drm_dbg_kms(dev, "[CONNECTOR:%d:%s] probed modes :\n",
+		    connector->base.id, connector->name);
 	list_for_each_entry(mode, &connector->modes, head) {
 		drm_mode_set_crtcinfo(mode, CRTC_INTERLACE_HALVE_V);
 		drm_mode_debug_printmodeline(mode);
@@ -834,14 +833,12 @@ static void output_poll_execute(struct work_struct *work)
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
2.43.2

