Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1011968090
	for <lists+dri-devel@lfdr.de>; Mon,  2 Sep 2024 09:28:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F60710E20A;
	Mon,  2 Sep 2024 07:28:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PtXqko5T";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16AEE10E209;
 Mon,  2 Sep 2024 07:28:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725262102; x=1756798102;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=XV2spn+7q3CoqC5pi9lK1DJomCtje/1fM12P8EVUuG8=;
 b=PtXqko5TViG0nbX2PqC453ou7pT3Dccjvcw+C7VjqgVHH9EJhPYINTqa
 36SyUkJyE0njawKCAYQlQOT7RXTq8jm6etwNWT3Igbw4m6gnoyAv6xfXs
 V7MoNPwkIQNosdUC52lHT8sX+Qeu1+rMrZF0RfdhmN27xkNEstpTDpExA
 ofJqVvVtvI09Cj4ugWKXz2iMZc5IM7m/NK1+KIGWdF/J9daoGAB2JqwAH
 JeSU1Fr7utcQmuy7iGR5DIcSNuFb+tTXeSmfLy73cIHnwR3olfc60SMez
 M8yvVg3M3FDnyx4/8s9MLJDVfrGbfualHjew79/LlQkDO0L12n2yR4yGS A==;
X-CSE-ConnectionGUID: e3OlRwiARaC6HLnSs4Ekmw==
X-CSE-MsgGUID: HzZ40DfMT4+kMWqJcPyaHw==
X-IronPort-AV: E=McAfee;i="6700,10204,11182"; a="23990632"
X-IronPort-AV: E=Sophos;i="6.10,195,1719903600"; d="scan'208";a="23990632"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2024 00:28:22 -0700
X-CSE-ConnectionGUID: FHTAz+aJQYyWYKbzd9rydg==
X-CSE-MsgGUID: 3Sl6ipUMSjunDPPp35Mtaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,195,1719903600"; d="scan'208";a="68922595"
Received: from jraag-nuc8i7beh.iind.intel.com ([10.145.169.79])
 by fmviesa005.fm.intel.com with ESMTP; 02 Sep 2024 00:28:17 -0700
From: Raag Jadav <raag.jadav@intel.com>
To: airlied@gmail.com, daniel@ffwll.ch, lucas.demarchi@intel.com,
 thomas.hellstrom@linux.intel.com, rodrigo.vivi@intel.com,
 jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 tursulin@ursulin.net
Cc: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, himal.prasad.ghimiray@intel.com,
 francois.dugast@intel.com, aravind.iddamsetty@linux.intel.com,
 anshuman.gupta@intel.com, bellekallu.rajkiran@intel.com,
 saikishore.konda@intel.com, Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v3 1/3] drm: Introduce device wedged event
Date: Mon,  2 Sep 2024 13:18:57 +0530
Message-Id: <20240902074859.2992849-2-raag.jadav@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240902074859.2992849-1-raag.jadav@intel.com>
References: <20240902074859.2992849-1-raag.jadav@intel.com>
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

Signed-off-by: Raag Jadav <raag.jadav@intel.com>
---
 drivers/gpu/drm/drm_drv.c | 21 +++++++++++++++++++++
 include/drm/drm_drv.h     |  1 +
 2 files changed, 22 insertions(+)

diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
index 93543071a500..dc55cc237d89 100644
--- a/drivers/gpu/drm/drm_drv.c
+++ b/drivers/gpu/drm/drm_drv.c
@@ -499,6 +499,27 @@ void drm_dev_unplug(struct drm_device *dev)
 }
 EXPORT_SYMBOL(drm_dev_unplug);
 
+/**
+ * drm_dev_wedged - declare DRM device as wedged
+ * @dev: DRM device
+ *
+ * This declares a DRM device specified by @dev as wedged (hanged/unusable)
+ * and generates a uevent for it, on the basis of which, userspace may take
+ * respective action to recover the device.
+ * Currently we only set WEDGED=1 in the uevent environment, but this can
+ * be expanded in the future.
+ */
+void drm_dev_wedged(struct drm_device *dev)
+{
+	char *event_string = "WEDGED=1";
+	char *envp[] = { event_string, NULL };
+
+	DRM_INFO("%s: device wedged, generating uevent\n", dev_name(dev->dev));
+
+	kobject_uevent_env(&dev->primary->kdev->kobj, KOBJ_CHANGE, envp);
+}
+EXPORT_SYMBOL(drm_dev_wedged);
+
 /*
  * DRM internal mount
  * We want to be able to allocate our own "struct address_space" to control
diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h
index cd37936c3926..a0b2d1435b86 100644
--- a/include/drm/drm_drv.h
+++ b/include/drm/drm_drv.h
@@ -489,6 +489,7 @@ void drm_put_dev(struct drm_device *dev);
 bool drm_dev_enter(struct drm_device *dev, int *idx);
 void drm_dev_exit(int idx);
 void drm_dev_unplug(struct drm_device *dev);
+void drm_dev_wedged(struct drm_device *dev);
 
 /**
  * drm_dev_is_unplugged - is a DRM device unplugged
-- 
2.34.1

