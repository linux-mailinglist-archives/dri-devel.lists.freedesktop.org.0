Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B816C845A5B
	for <lists+dri-devel@lfdr.de>; Thu,  1 Feb 2024 15:33:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 395E410E054;
	Thu,  1 Feb 2024 14:33:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VUU3H9+2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADB6F10E10E;
 Thu,  1 Feb 2024 14:33:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706798007; x=1738334007;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9OUifbAspOGjq7k7QTVmKzbh6EAuhhFqytRTXSbOeYI=;
 b=VUU3H9+2Rh1al05HdJjaywvMqEWG4M4jBIu1+EaK8JzTfwVlYjBpJ+qa
 z9ix9mVqgQO2K2RzHq2JhLED1OU+D5DjWcSvkz4YahMdaT/wvyIu60vw3
 T+nl3ZX1+ovcui4emn85gqoFA491KNUYAlM1dWKCfCz0gwJZWt8VoGpEM
 6M728O82AUE1z7d8sFzbCvyj32KULsX3oFlKdKMfQdNqPB9amL+Bxi0Sj
 pcGW+IAu393DUFbUTalHKdpA17g1RJoW02li7GnGTIrGbPFKKXyleEv7B
 TYAXuvtAzANuBCR6i/36b/BMMLQWbTLC0ENJ3RVZ8Wubr9m9bYi4zV8XF Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="401036906"
X-IronPort-AV: E=Sophos;i="6.05,234,1701158400"; d="scan'208";a="401036906"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2024 06:33:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,234,1701158400"; 
   d="scan'208";a="4425729"
Received: from unknown (HELO localhost) ([10.237.66.162])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2024 06:33:19 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
	jani.nikula@intel.com, David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Alex Deucher <alexander.deucher@amd.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Pan@freedesktop.org, Xinhui <Xinhui.Pan@amd.com>,
	Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
	Danilo Krummrich <dakr@redhat.com>, Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Hamza Mahfooz <hamza.mahfooz@amd.com>,
	Javier Martinez Canillas <javierm@redhat.com>,
	Sui Jingfeng <sui.jingfeng@linux.dev>
Subject: [PATCH v3 1/2] drm: enable (most) W=1 warnings by default across the
 subsystem
Date: Thu,  1 Feb 2024 16:33:08 +0200
Message-Id: <b3f9cfa3304e4db1a964ec962dc0974857c0edf0.1706797803.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1706797803.git.jani.nikula@intel.com>
References: <cover.1706797803.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

At least the i915 and amd drivers enable a bunch more compiler warnings
than the kernel defaults.

Extend most of the W=1 warnings to the entire drm subsystem by
default. Use the copy-pasted warnings from scripts/Makefile.extrawarn
with s/KBUILD_CFLAGS/subdir-ccflags-y/ to make it easier to compare and
keep up with them in the future.

This is similar to the approach currently used in i915.

Some of the -Wextra warnings do need to be disabled, just like in
Makefile.extrawarn, but take care to not disable them for W=2 or W=3
builds, depending on the warning.

There are too many -Wformat-truncation warnings to cleanly fix up front;
leave that warning disabled for now.

v3:
- Drop -Wmissing-declarations (already enabled by default)
- Drop -Wmissing-prototypes (already enabled by default)

v2:
- Drop -Wformat-truncation (too many warnings)
- Drop -Wstringop-overflow (already enabled by default)

Cc: David Airlie <airlied@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Pan, Xinhui <Xinhui.Pan@amd.com>
Cc: Karol Herbst <kherbst@redhat.com>
Cc: Lyude Paul <lyude@redhat.com>
Cc: Danilo Krummrich <dakr@redhat.com>
Cc: Rob Clark <robdclark@gmail.com>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Sean Paul <sean@poorly.run>
Cc: Marijn Suijten <marijn.suijten@somainline.org>
Cc: Hamza Mahfooz <hamza.mahfooz@amd.com>
Acked-by: Javier Martinez Canillas <javierm@redhat.com>
Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
Acked-by: Sui Jingfeng <sui.jingfeng@linux.dev>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/Makefile | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index 104b42df2e95..04722a5dfb78 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -5,6 +5,31 @@
 
 CFLAGS-$(CONFIG_DRM_USE_DYNAMIC_DEBUG)	+= -DDYNAMIC_DEBUG_MODULE
 
+# Unconditionally enable W=1 warnings locally
+# --- begin copy-paste W=1 warnings from scripts/Makefile.extrawarn
+subdir-ccflags-y += -Wextra -Wunused -Wno-unused-parameter
+subdir-ccflags-y += $(call cc-option, -Wrestrict)
+subdir-ccflags-y += -Wmissing-format-attribute
+subdir-ccflags-y += -Wold-style-definition
+subdir-ccflags-y += -Wmissing-include-dirs
+subdir-ccflags-y += $(call cc-option, -Wunused-but-set-variable)
+subdir-ccflags-y += $(call cc-option, -Wunused-const-variable)
+subdir-ccflags-y += $(call cc-option, -Wpacked-not-aligned)
+subdir-ccflags-y += $(call cc-option, -Wformat-overflow)
+# FIXME: fix -Wformat-truncation warnings and uncomment
+#subdir-ccflags-y += $(call cc-option, -Wformat-truncation)
+subdir-ccflags-y += $(call cc-option, -Wstringop-truncation)
+# The following turn off the warnings enabled by -Wextra
+ifeq ($(findstring 2, $(KBUILD_EXTRA_WARN)),)
+subdir-ccflags-y += -Wno-missing-field-initializers
+subdir-ccflags-y += -Wno-type-limits
+subdir-ccflags-y += -Wno-shift-negative-value
+endif
+ifeq ($(findstring 3, $(KBUILD_EXTRA_WARN)),)
+subdir-ccflags-y += -Wno-sign-compare
+endif
+# --- end copy-paste
+
 drm-y := \
 	drm_aperture.o \
 	drm_atomic.o \
-- 
2.39.2

