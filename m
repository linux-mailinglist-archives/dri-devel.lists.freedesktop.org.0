Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A7C878C368
	for <lists+dri-devel@lfdr.de>; Tue, 29 Aug 2023 13:39:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81ABD10E25D;
	Tue, 29 Aug 2023 11:39:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A21BC10E259;
 Tue, 29 Aug 2023 11:39:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693309173; x=1724845173;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Nnj8haFxn3HzzojBrTVKbu4hofRA9xbrV2mxGrHYRxo=;
 b=eY14VkAo4+ZCHpygv9l5FR2iRWjTlkCnI2L58RGAkDO5j0O0UCQ++W53
 UiRmddpXfCFPowcfX4Np2pOVG1le1pEYngZZEZ7tsyqcUiofSHNFLItLC
 OMwi/FcLpzbYBYwP+aspWUnwJjWraLyAb8zMlCTMTsnVWlfdmSrHt2G76
 gvGpaSdEZ8ki2/mYHopT7yRQE9zfyLSeGyOs/irwflXRWKQHP+ng8IQZ9
 4IuyE+L7B6l2VstTg5gyooMDkg5h8J3efan3SVoNG+Ix9SftFkD/p0ncT
 ZDozgTdT1u56nfAoKM8AbPyD9ML1lKXlvr02uenjrHiUY8ORQPz02OkH+ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10816"; a="378063909"
X-IronPort-AV: E=Sophos;i="6.02,210,1688454000"; d="scan'208";a="378063909"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2023 04:39:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10816"; a="738669012"
X-IronPort-AV: E=Sophos;i="6.02,210,1688454000"; d="scan'208";a="738669012"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.153])
 by orsmga002.jf.intel.com with SMTP; 29 Aug 2023 04:39:29 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 29 Aug 2023 14:39:27 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 02/12] drm/sysfs: Register "ddc" symlink later
Date: Tue, 29 Aug 2023 14:39:10 +0300
Message-ID: <20230829113920.13713-3-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230829113920.13713-1-ville.syrjala@linux.intel.com>
References: <20230829113920.13713-1-ville.syrjala@linux.intel.com>
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
Cc: Neil Armstrong <narmstrong@baylibre.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org,
 Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
 Andrzej Hajda <a.hajda@samsung.com>, Sam Ravnborg <sam@ravnborg.org>,
 Emil Velikov <emil.velikov@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Currently drm_sysfs_connector_add() attempts to register
the "ddc" symlink (based one connector->ddc) before the
driver's .early_register() hook has been called. That is
too early for i915 which only fully registers the aux ch
and associated i2c bus from said hook (to prevent half
initialized stuff getting exposed to userspace). This
causes my attempt at using drm_connector_init_with_ddc()
to fail, and the entire connector disappears from sysfs
on account of sysfs_create_link() failing.

To fix that split the sysfs symlink stuff into separate
functions (drm_sysfs_connector_add_late() and
drm_sysfs_connector_remove_early()) which are called
on the opposite side of the .later_register() and
.early_unregister() hooks.

Cc: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Andrzej Hajda <a.hajda@samsung.com>
Cc: Emil Velikov <emil.velikov@collabora.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Neil Armstrong <narmstrong@baylibre.com>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/drm_connector.c |  9 +++++++++
 drivers/gpu/drm/drm_internal.h  |  2 ++
 drivers/gpu/drm/drm_sysfs.c     | 22 +++++++++++++++-------
 3 files changed, 26 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index 988996cf6da5..9d4c7b0c5c05 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -631,6 +631,10 @@ int drm_connector_register(struct drm_connector *connector)
 			goto err_debugfs;
 	}
 
+	ret = drm_sysfs_connector_add_late(connector);
+	if (ret)
+		goto err_late_register;
+
 	drm_mode_object_register(connector->dev, &connector->base);
 
 	connector->registration_state = DRM_CONNECTOR_REGISTERED;
@@ -647,6 +651,9 @@ int drm_connector_register(struct drm_connector *connector)
 	mutex_unlock(&connector_list_lock);
 	goto unlock;
 
+err_late_register:
+	if (connector->funcs->early_unregister)
+		connector->funcs->early_unregister(connector);
 err_debugfs:
 	drm_debugfs_connector_remove(connector);
 	drm_sysfs_connector_remove(connector);
@@ -681,6 +688,8 @@ void drm_connector_unregister(struct drm_connector *connector)
 					connector->privacy_screen,
 					&connector->privacy_screen_notifier);
 
+	drm_sysfs_connector_remove_early(connector);
+
 	if (connector->funcs->early_unregister)
 		connector->funcs->early_unregister(connector);
 
diff --git a/drivers/gpu/drm/drm_internal.h b/drivers/gpu/drm/drm_internal.h
index ba12acd55139..4053cf8105ce 100644
--- a/drivers/gpu/drm/drm_internal.h
+++ b/drivers/gpu/drm/drm_internal.h
@@ -153,6 +153,8 @@ int drm_sysfs_init(void);
 void drm_sysfs_destroy(void);
 struct device *drm_sysfs_minor_alloc(struct drm_minor *minor);
 int drm_sysfs_connector_add(struct drm_connector *connector);
+int drm_sysfs_connector_add_late(struct drm_connector *connector);
+void drm_sysfs_connector_remove_early(struct drm_connector *connector);
 void drm_sysfs_connector_remove(struct drm_connector *connector);
 
 void drm_sysfs_lease_event(struct drm_device *dev);
diff --git a/drivers/gpu/drm/drm_sysfs.c b/drivers/gpu/drm/drm_sysfs.c
index b169b3e44a92..a953f69a34b6 100644
--- a/drivers/gpu/drm/drm_sysfs.c
+++ b/drivers/gpu/drm/drm_sysfs.c
@@ -400,10 +400,6 @@ int drm_sysfs_connector_add(struct drm_connector *connector)
 			drm_err(dev, "failed to add component to create link to typec connector\n");
 	}
 
-	if (connector->ddc)
-		return sysfs_create_link(&connector->kdev->kobj,
-				 &connector->ddc->dev.kobj, "ddc");
-
 	return 0;
 
 err_free:
@@ -411,14 +407,26 @@ int drm_sysfs_connector_add(struct drm_connector *connector)
 	return r;
 }
 
+int drm_sysfs_connector_add_late(struct drm_connector *connector)
+{
+	if (connector->ddc)
+		return sysfs_create_link(&connector->kdev->kobj,
+					 &connector->ddc->dev.kobj, "ddc");
+
+	return 0;
+}
+
+void drm_sysfs_connector_remove_early(struct drm_connector *connector)
+{
+	if (connector->ddc)
+		sysfs_remove_link(&connector->kdev->kobj, "ddc");
+}
+
 void drm_sysfs_connector_remove(struct drm_connector *connector)
 {
 	if (!connector->kdev)
 		return;
 
-	if (connector->ddc)
-		sysfs_remove_link(&connector->kdev->kobj, "ddc");
-
 	if (dev_fwnode(connector->kdev))
 		component_del(connector->kdev, &typec_connector_ops);
 
-- 
2.41.0

