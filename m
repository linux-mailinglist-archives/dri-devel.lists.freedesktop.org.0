Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E97C8758A4
	for <lists+dri-devel@lfdr.de>; Thu,  7 Mar 2024 21:40:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3B2910F555;
	Thu,  7 Mar 2024 20:40:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aQYjnogs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6A6B10F54A;
 Thu,  7 Mar 2024 20:40:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709844012; x=1741380012;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Gk6ZVmaHBaEkSrB+mkN7Ku8YoTc8fxI9mzl5FGbhlBg=;
 b=aQYjnogsFo5G/8EiKh+RPJPOj8epCHiOMHfahkHglf5PpUrhHYNpC0oZ
 0CvyS/SNGAktis6cF918zfiJ7tHSojai8kJGfdNWDlCDSz6YXDOY7D/MF
 6ig8os2rmK7BSLqMsffMLtuPEvjhneTooq/ZrW6/Kka5HdZFlGY7GE5b9
 2unTLwED5lHxXd9lo6oZZvbCK8F74M3+BifXQBmL2MuzJCb25ddWSwHio
 HvG00XmDyzcMg2ut933WmVS7IWGYITwZU/7vpLkYyBkGoGCvX2d1xq6RZ
 RHhpnetvO8JDmj8VqSz4ONvsjTDPiBTpvKCLbSGaJNkIC7i8LVvo7dWup A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11006"; a="4680443"
X-IronPort-AV: E=Sophos;i="6.07,107,1708416000"; 
   d="scan'208";a="4680443"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2024 12:40:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,107,1708416000"; d="scan'208";a="10362486"
Received: from tofferse-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.33.212])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2024 12:40:09 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 jani.nikula@intel.com
Subject: [PATCH 5/6] drm/sysfs: switch to drm device based logging
Date: Thu,  7 Mar 2024 22:39:37 +0200
Message-Id: <baae2d1e432ed9657857d3681c773e0373ddd9ad.1709843865.git.jani.nikula@intel.com>
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

Prefer drm_dbg_kms() and drm_dbg_lease() over DRM_DEBUG_KMS() and
DRM_DEBUG() to debug log the drm device info. Fix some debug categories
and unify connector logging while at it.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_sysfs.c | 21 ++++++++++-----------
 1 file changed, 10 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/drm_sysfs.c b/drivers/gpu/drm/drm_sysfs.c
index a953f69a34b6..6cfd888beadd 100644
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
@@ -489,7 +489,6 @@ void drm_sysfs_connector_hotplug_event(struct drm_connector *connector)
 	drm_dbg_kms(connector->dev,
 		    "[CONNECTOR:%d:%s] generating connector hotplug event\n",
 		    connector->base.id, connector->name);
-
 	kobject_uevent_env(&dev->primary->kdev->kobj, KOBJ_CHANGE, envp);
 }
 EXPORT_SYMBOL(drm_sysfs_connector_hotplug_event);
-- 
2.39.2

