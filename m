Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C19827FDF22
	for <lists+dri-devel@lfdr.de>; Wed, 29 Nov 2023 19:12:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D20D10E21D;
	Wed, 29 Nov 2023 18:12:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A430A10E21D;
 Wed, 29 Nov 2023 18:12:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701281550; x=1732817550;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=R1Lr9uHQfHuA4q4I0DrIgWlieF9N1RNDCZSQwaAUZ4c=;
 b=OBZF52MDu1CEWSa9S6/wQr+UTbM6fxu/DEusgrDwA2S3P2Wyvud7KC3m
 jesgbsHYWF9lP9KZikbMYNZmOMPTuDVOVcZxtg/bhDYdWWDyr5S2Qu/DH
 OEiUVvsfl7tkEYWk3Li91j5pATKTqCfLTJPRQlB+iKHeDpfQtRHruoz8r
 2p32RMYJUzjMcWrtq/dCgwZUdCtf8vccFWZKh4fpRC9n3TvkWKNoPO8yB
 94VJcgWzQg7Hh/Ku+613pUbzMlUlYE9QO/+3DfKxvcuAHImD+gfiUXrkK
 5BS/G1/w9YAZQHXy64AvVOGnRUWaFtyxuCZZUQYm1dGWUdsAV+ydP7ezO g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="14762416"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; d="scan'208";a="14762416"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2023 10:12:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="745345455"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; d="scan'208";a="745345455"
Received: from dstavrak-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.60.61])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2023 10:12:23 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [RFC] drm: enable W=1 warnings by default across the subsystem
Date: Wed, 29 Nov 2023 20:12:19 +0200
Message-Id: <20231129181219.1237887-1-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
	Karol Herbst <kherbst@redhat.com>,
	Jani Nikula <jani.nikula@intel.com>, Sean Paul <sean@poorly.run>,
	intel-gfx@lists.freedesktop.org, Xinhui <Xinhui.Pan@amd.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Maxime Ripard <mripard@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Danilo Krummrich <dakr@redhat.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Pan@freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

At least the i915 and amd drivers enable a bunch more compiler warnings
than the kernel defaults.

Extend the W=1 warnings to the entire drm subsystem by default. Use the
copy-pasted warnings from scripts/Makefile.extrawarn with
s/KBUILD_CFLAGS/subdir-ccflags-y/ to make it easier to compare and keep
up with them in the future.

This is similar to the approach currently used in i915.

Some of the -Wextra warnings do need to be disabled, just like in
Makefile.extrawarn, but take care to not disable them for W=2 or W=3
builds, depending on the warning.

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
Signed-off-by: Jani Nikula <jani.nikula@intel.com>

---

With my admittedly limited and very much x86 focused kernel config, I
get some -Wunused-but-set-variable and -Wformat-truncation= warnings,
but nothing we can't handle.

We could fix them up front, or disable the extra warnings on a per
driver basis with a FIXME comment in their respective Makefiles.

With the experience from i915, I think this would significantly reduce
the constant loop of warnings added by people not using W=1 and
subsequently fixed by people using W=1.

Note: I've Cc'd the maintainers of drm, drm misc and some of the biggest
drivers.
---
 drivers/gpu/drm/Makefile | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index b4cb0835620a..6939e4ea13d5 100644
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
+subdir-ccflags-y += $(call cc-option, -Wformat-truncation)
+subdir-ccflags-y += $(call cc-option, -Wstringop-overflow)
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

