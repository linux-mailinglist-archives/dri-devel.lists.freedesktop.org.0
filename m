Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7083E89BB94
	for <lists+dri-devel@lfdr.de>; Mon,  8 Apr 2024 11:24:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADB8011234B;
	Mon,  8 Apr 2024 09:24:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g2FtIXTG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99765112348;
 Mon,  8 Apr 2024 09:24:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712568267; x=1744104267;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rVZrsnu5pfG6WESGBX2rWNNLZZcaVhJlh8r/DAhgDSY=;
 b=g2FtIXTG3NonC4vZ7nIdAOJwdCrJM7XZr2LVivfLX1aejx83BLwPAbW+
 aHfXErcUWY20oLGqwRmRVzaCvVoD6XQepZ1xMLIYL+NVRxKnXleolw4aw
 BbMCLwuiLwg6lwIRsY47rnBncgDnsmBOw1s711xcONQCmpoOx/CqWN92Q
 YTiEdzugL7CjqJKAcNf+ZqETKImh1SYsvQuty10RWOiicL569jGN6BBeR
 0HeT4zfn/caWXlpdU7hZp2RrxBrK6lbeb1mSeAKTcbL2ECl/5+QYncCqO
 3vgBIEODJVEXlmDoIwDS5KxYQTft1K3PkaHcr03N6MqRzLdIgbkjhgeEm g==;
X-CSE-ConnectionGUID: EIRhQW34RF2L0BavmokvKw==
X-CSE-MsgGUID: qA4xT5lIRqSf3iIp73RoUg==
X-IronPort-AV: E=McAfee;i="6600,9927,11037"; a="10807365"
X-IronPort-AV: E=Sophos;i="6.07,186,1708416000"; d="scan'208";a="10807365"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2024 02:24:26 -0700
X-CSE-ConnectionGUID: VMVndV5uS6az2NfSxK14UQ==
X-CSE-MsgGUID: Ic9oQvBuQEy1xl1BUofRnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,186,1708416000"; d="scan'208";a="20261234"
Received: from bauinger-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.42.71])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2024 02:24:23 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 jani.nikula@intel.com, ville.syrjala@linux.intel.com,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 3/7] drm/sysfs: switch to drm device based logging
Date: Mon,  8 Apr 2024 12:23:58 +0300
Message-Id: <7f3dd5b4a33f964c6903c7a964da5397f4084aeb.1712568037.git.jani.nikula@intel.com>
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

Prefer drm_dbg_kms() and drm_dbg_lease() over DRM_DEBUG_KMS() and
DRM_DEBUG() to debug log the drm device info. Fix some debug categories
and unify connector logging while at it.

v2: Drop superfluous newline

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_sysfs.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/drm_sysfs.c b/drivers/gpu/drm/drm_sysfs.c
index a953f69a34b6..bd9b8ab4f82b 100644
--- a/drivers/gpu/drm/drm_sysfs.c
+++ b/drivers/gpu/drm/drm_sysfs.c
@@ -209,10 +209,9 @@ static ssize_t status_store(struct device *device,
 		ret = -EINVAL;
 
 	if (old_force != connector->force || !connector->force) {
-		DRM_DEBUG_KMS("[CONNECTOR:%d:%s] force updated from %d to %d or reprobing\n",
-			      connector->base.id,
-			      connector->name,
-			      old_force, connector->force);
+		drm_dbg_kms(dev, "[CONNECTOR:%d:%s] force updated from %d to %d or reprobing\n",
+			    connector->base.id, connector->name,
+			    old_force, connector->force);
 
 		connector->funcs->fill_modes(connector,
 					     dev->mode_config.max_width,
@@ -383,8 +382,8 @@ int drm_sysfs_connector_add(struct drm_connector *connector)
 	if (r)
 		goto err_free;
 
-	DRM_DEBUG("adding \"%s\" to sysfs\n",
-		  connector->name);
+	drm_dbg_kms(dev, "[CONNECTOR:%d:%s] adding connector to sysfs\n",
+		    connector->base.id, connector->name);
 
 	r = device_add(kdev);
 	if (r) {
@@ -430,8 +429,9 @@ void drm_sysfs_connector_remove(struct drm_connector *connector)
 	if (dev_fwnode(connector->kdev))
 		component_del(connector->kdev, &typec_connector_ops);
 
-	DRM_DEBUG("removing \"%s\" from sysfs\n",
-		  connector->name);
+	drm_dbg_kms(connector->dev,
+		    "[CONNECTOR:%d:%s] removing connector from sysfs\n",
+		    connector->base.id, connector->name);
 
 	device_unregister(connector->kdev);
 	connector->kdev = NULL;
@@ -442,7 +442,7 @@ void drm_sysfs_lease_event(struct drm_device *dev)
 	char *event_string = "LEASE=1";
 	char *envp[] = { event_string, NULL };
 
-	DRM_DEBUG("generating lease event\n");
+	drm_dbg_lease(dev, "generating lease event\n");
 
 	kobject_uevent_env(&dev->primary->kdev->kobj, KOBJ_CHANGE, envp);
 }
@@ -463,7 +463,7 @@ void drm_sysfs_hotplug_event(struct drm_device *dev)
 	char *event_string = "HOTPLUG=1";
 	char *envp[] = { event_string, NULL };
 
-	DRM_DEBUG("generating hotplug event\n");
+	drm_dbg_kms(dev, "generating hotplug event\n");
 
 	kobject_uevent_env(&dev->primary->kdev->kobj, KOBJ_CHANGE, envp);
 }
-- 
2.39.2

