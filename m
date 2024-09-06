Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AE9B96EFD7
	for <lists+dri-devel@lfdr.de>; Fri,  6 Sep 2024 11:43:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7C6A10E9D5;
	Fri,  6 Sep 2024 09:43:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Kk7Mts3f";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AC3110E9D3;
 Fri,  6 Sep 2024 09:43:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725615782; x=1757151782;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=67MkjNbsItLfB5eRBWR9KkJZ6hke9S0Mf9UKUTZEb9Y=;
 b=Kk7Mts3fy3yShwGqcaPYnsdVT8l7A1sFGCBZFCNCQjmI0uDcyuIc78zP
 wqfntqVVya17QUH8iL2OXo8jm1qn7PI2WGH5e7lgF+YOHzHrxX5ipkaxP
 ko7FZ76xL/SFM4D7O/MMlNW/hUAbMi63472VJpRppbPMBIrQ65ZHjSNol
 GnbgteXIv8uHY1OBdQQni+VPGA+7HCO4uvq4dqJdoZ1UUiQjXPDH3X45T
 xlf1+bl8Qq4X7SKy56v4T8QBhogvYdnAZgsKWjKpomJUCICBhy7u71OrR
 ndxOa2/aAQMyHJNsFYKByyNeHtqoNGjW/74fh6JNOmxRTD+85bgFhc93i g==;
X-CSE-ConnectionGUID: 2zM3W1z/QlC3lWS0dW/bog==
X-CSE-MsgGUID: iOupzCfIS9iI9gCw9W8eXQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11186"; a="34965490"
X-IronPort-AV: E=Sophos;i="6.10,207,1719903600"; d="scan'208";a="34965490"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2024 02:43:01 -0700
X-CSE-ConnectionGUID: rNUMqbvtSQK3eYHkxJ1B1Q==
X-CSE-MsgGUID: GpcMPjwwRluRBa8Fuaw3ow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,207,1719903600"; d="scan'208";a="103377552"
Received: from jraag-nuc8i7beh.iind.intel.com ([10.145.169.79])
 by orviesa001.jf.intel.com with ESMTP; 06 Sep 2024 02:42:57 -0700
From: Raag Jadav <raag.jadav@intel.com>
To: airlied@gmail.com, daniel@ffwll.ch, lucas.demarchi@intel.com,
 thomas.hellstrom@linux.intel.com, rodrigo.vivi@intel.com,
 jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 tursulin@ursulin.net
Cc: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, himal.prasad.ghimiray@intel.com,
 francois.dugast@intel.com, aravind.iddamsetty@linux.intel.com,
 anshuman.gupta@intel.com, Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v4 1/3] drm: Introduce device wedged event
Date: Fri,  6 Sep 2024 15:12:23 +0530
Message-Id: <20240906094225.3082162-2-raag.jadav@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240906094225.3082162-1-raag.jadav@intel.com>
References: <20240906094225.3082162-1-raag.jadav@intel.com>
MIME-Version: 1.0
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

Introduce device wedged event, which will notify userspace of wedged
(hanged/unusable) state of the DRM device through a uevent. This is
useful especially in cases where the device is in unrecoverable state
and requires userspace intervention for recovery.

Purpose of this implementation is to be vendor agnostic. Userspace
consumers (sysadmin) can define udev rules to parse this event and
take respective action to recover the device.

Consumer expectations:
----------------------
1) Unbind driver
2) Reset bus device
3) Re-bind driver

v4: s/drm_dev_wedged/drm_dev_wedged_event
    Use drm_info() (Jani)
    Kernel doc adjustment (Aravind)

Signed-off-by: Raag Jadav <raag.jadav@intel.com>
---
 drivers/gpu/drm/drm_drv.c | 20 ++++++++++++++++++++
 include/drm/drm_drv.h     |  1 +
 2 files changed, 21 insertions(+)

diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
index 93543071a500..cca5d8295eb7 100644
--- a/drivers/gpu/drm/drm_drv.c
+++ b/drivers/gpu/drm/drm_drv.c
@@ -499,6 +499,26 @@ void drm_dev_unplug(struct drm_device *dev)
 }
 EXPORT_SYMBOL(drm_dev_unplug);
 
+/**
+ * drm_dev_wedged_event - generate a device wedged uevent
+ * @dev: DRM device
+ *
+ * This generates a device wedged uevent for the DRM device specified by @dev,
+ * on the basis of which, userspace may take respective action to recover the
+ * device. Currently we only set WEDGED=1 in the uevent environment, but this
+ * can be expanded in the future.
+ */
+void drm_dev_wedged_event(struct drm_device *dev)
+{
+	char *event_string = "WEDGED=1";
+	char *envp[] = { event_string, NULL };
+
+	drm_info(dev, "device wedged, generating uevent\n");
+
+	kobject_uevent_env(&dev->primary->kdev->kobj, KOBJ_CHANGE, envp);
+}
+EXPORT_SYMBOL(drm_dev_wedged_event);
+
 /*
  * DRM internal mount
  * We want to be able to allocate our own "struct address_space" to control
diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h
index cd37936c3926..eed5e54c74fd 100644
--- a/include/drm/drm_drv.h
+++ b/include/drm/drm_drv.h
@@ -489,6 +489,7 @@ void drm_put_dev(struct drm_device *dev);
 bool drm_dev_enter(struct drm_device *dev, int *idx);
 void drm_dev_exit(int idx);
 void drm_dev_unplug(struct drm_device *dev);
+void drm_dev_wedged_event(struct drm_device *dev);
 
 /**
  * drm_dev_is_unplugged - is a DRM device unplugged
-- 
2.34.1

