Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 039AF87190A
	for <lists+dri-devel@lfdr.de>; Tue,  5 Mar 2024 10:08:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86369112963;
	Tue,  5 Mar 2024 09:08:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fSq7sZoy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9FEA112961;
 Tue,  5 Mar 2024 09:08:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709629694; x=1741165694;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wzYFNtx7zLeQY6iBKd0/CpOTEBO8l6cBYy3paFEeuXM=;
 b=fSq7sZoys3PsdArtUnKnhyy7FTWEmIS0oICYGEkhYZ6T96FSlKwkk/l/
 vX7PoLHAzjK6pw/s5z9NgLSSjoOx3/GBIKBSwYqzwVNfO9cERcFtCYc9c
 A86ny45VlxaCv05GFUjH/HS9/Mx0GDSnyd8GioD/bs8UyP5OFNvtH6M2/
 TkVpZxwg5hi3mXuAV5j6EYTa2WD4BX4Igk0cIlUjaz8+fAITSG3GKK0gt
 dHMjm0lGKUR7rwJ+DBjW/4IqTSY3RciVAgRuvGDKWdP34/rKJKaccLqoa
 iqoBghTfht7oKr/3x6JKDLHZLZmmCxCOtxLyPryTcN+KfdP+eP6wIYgo3 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11003"; a="4027070"
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; 
   d="scan'208";a="4027070"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2024 01:08:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; 
   d="scan'208";a="9427404"
Received: from omakhlou-mobl4.amr.corp.intel.com (HELO localhost)
 ([10.252.51.143])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2024 01:07:50 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: Jani Nikula <jani.nikula@intel.com>,
	intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Alex Deucher <alexander.deucher@amd.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	"Pan, Xinhui" <Xinhui.Pan@amd.com>,
	Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
	Danilo Krummrich <dakr@redhat.com>, Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Hamza Mahfooz <hamza.mahfooz@amd.com>,
	Javier Martinez Canillas <javierm@redhat.com>,
	Sui Jingfeng <sui.jingfeng@linux.dev>, Pan@freedesktop.org
Subject: [RESEND v3 1/2] drm: enable (most) W=1 warnings by default across the
 subsystem
Date: Tue,  5 Mar 2024 11:07:35 +0200
Message-Id: <a50f1a69d5af72e913996179a75bc3a71d81ebea.1709629403.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1709629403.git.jani.nikula@intel.com>
References: <cover.1709629403.git.jani.nikula@intel.com>
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
Cc: Rob Clark <robdclark@gmail.com>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Sean Paul <sean@poorly.run>
Cc: Marijn Suijten <marijn.suijten@somainline.org>
Cc: Hamza Mahfooz <hamza.mahfooz@amd.com>
Acked-by: Javier Martinez Canillas <javierm@redhat.com>
Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
Acked-by: Sui Jingfeng <sui.jingfeng@linux.dev>
Acked-by: Danilo Krummrich <dakr@redhat.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/Makefile | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index 6eb2b553a163..ea456f057e8a 100644
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

