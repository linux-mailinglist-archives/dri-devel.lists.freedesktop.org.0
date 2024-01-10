Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D88E0829F63
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jan 2024 18:39:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F71C10E7AD;
	Wed, 10 Jan 2024 17:39:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13BA510E7A6;
 Wed, 10 Jan 2024 17:39:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704908395; x=1736444395;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=KlhZEsRS8HyPqI6a++6efvWqQGxaFytOCSZdWefcYD8=;
 b=T1/0Iy3Eh35UjFH+xN0KCjYpU0gZTH5P8waKyWZKmynB9PED/Yb0MQ/P
 BWxQAXrVVioDDXUEUsVjjn9sYLVFTcBPe3dGcbD5Z9sMJNvsD25LwMuAF
 cxGowUS7VriB6K9IkBGBLP0WhyDimSY82iX0K3Yyd8TPwsMX9H1D8y5IL
 o1AbOMv93gRNxdtEjPcQTlpGn4HuB5ENc10vt4rHE3rgE3TlLYP95uLyJ
 paASDKjeUrpWvzZZOv1+yL6qielEGyZlcKRH1jwBxrJCkOSh3lXrT1ZKp
 y0c5/ry4mhsAuFJeNaY4jKFufxHZNjGld82c0BhyQ2KPEyOhYStDKjzjT g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10949"; a="389029388"
X-IronPort-AV: E=Sophos;i="6.04,184,1695711600"; d="scan'208";a="389029388"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jan 2024 09:39:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10949"; a="785676093"
X-IronPort-AV: E=Sophos;i="6.04,184,1695711600"; d="scan'208";a="785676093"
Received: from fpallare-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.252.36.240])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jan 2024 09:39:46 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 5/6] drm: enable (most) W=1 warnings by default across the
 subsystem
Date: Wed, 10 Jan 2024 19:39:15 +0200
Message-Id: <1291306bedfd6297d4bf0fca5daa5bac46dde1ad.1704908087.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1704908087.git.jani.nikula@intel.com>
References: <cover.1704908087.git.jani.nikula@intel.com>
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
Cc: Sui Jingfeng <sui.jingfeng@linux.dev>,
	Karol Herbst <kherbst@redhat.com>,
	Hamza Mahfooz <hamza.mahfooz@amd.com>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Javier Martinez Canillas <javierm@redhat.com>,
	Danilo Krummrich <dakr@redhat.com>, Pan@freedesktop.org,
	jani.nikula@intel.com, intel-gfx@lists.freedesktop.org,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Maxime Ripard <mripard@kernel.org>,
	Alex Deucher <alexander.deucher@amd.com>,
	Sean Paul <sean@poorly.run>, Xinhui <Xinhui.Pan@amd.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
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

v2:
- Drop -Wformat-truncation (too many warnings)
- Drop -Wstringop-overflow (enabled by default upstream)

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
 drivers/gpu/drm/Makefile | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index 104b42df2e95..8b6be830f7c3 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -5,6 +5,33 @@
 
 CFLAGS-$(CONFIG_DRM_USE_DYNAMIC_DEBUG)	+= -DDYNAMIC_DEBUG_MODULE
 
+# Unconditionally enable W=1 warnings locally
+# --- begin copy-paste W=1 warnings from scripts/Makefile.extrawarn
+subdir-ccflags-y += -Wextra -Wunused -Wno-unused-parameter
+subdir-ccflags-y += -Wmissing-declarations
+subdir-ccflags-y += $(call cc-option, -Wrestrict)
+subdir-ccflags-y += -Wmissing-format-attribute
+subdir-ccflags-y += -Wmissing-prototypes
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

