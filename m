Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AEBA479CF40
	for <lists+dri-devel@lfdr.de>; Tue, 12 Sep 2023 13:07:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DAB410E228;
	Tue, 12 Sep 2023 11:07:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EEEB10E3F2;
 Tue, 12 Sep 2023 11:07:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694516822; x=1726052822;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9UwxnqW0C6GtgncGriJ6DzgdXK71g3AJKZpFxXsvPeo=;
 b=KPLpAGHsncp9Bpz87LMO0kEJ77nWOvjzXK80E8cF0Vl/qC99RFW+heXl
 SbdazgRukRbxqJ2XUood953RVwqAoALnvCP5Er9kP2jhRjszwj8iwmXDF
 zzRwYh8BxnrjTyxe5sc1Bv6KZQ5Jo6t1fuh2tG9/NBgJcU79tbEq3u88U
 PkGoW2QJ/iQ3eDrI6ZOlzMrOJfQpCJ3dPJ32BzfLFhsbSu48usJPyvjmt
 I6f1noKDz8YelJw4+KvLa/5HjNV2yITqsnBDSI1OBDAFn1kxSemwe4Pc2
 PLZq1rLksq/vXlq5qOrh8ZWhNTVkjQ2tkcupHifngPqxTWF9saJ8eexM2 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="409295293"
X-IronPort-AV: E=Sophos;i="6.02,139,1688454000"; d="scan'208";a="409295293"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2023 04:07:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="743688002"
X-IronPort-AV: E=Sophos;i="6.02,139,1688454000"; d="scan'208";a="743688002"
Received: from kscholl-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.63.206])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2023 04:06:58 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 01/19] drm/i915: define I915 during i915 driver build
Date: Tue, 12 Sep 2023 14:06:28 +0300
Message-Id: <97558201836115b91cbe32840239df855d0c2e4c.1694514689.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1694514689.git.jani.nikula@intel.com>
References: <cover.1694514689.git.jani.nikula@intel.com>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, jani.nikula@intel.com,
 Lucas De Marchi <lucas.demarchi@intel.com>, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The xe driver will reuse i915 display code by compiling it separately as
part of xe. We'll want to be able to distinguish between building the
i915 display code for i915 and xe. Define I915 when building i915.

Cc: David Airlie <airlied@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/Makefile | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
index 1b2e02e9d92c..fa6aa71bb749 100644
--- a/drivers/gpu/drm/i915/Makefile
+++ b/drivers/gpu/drm/i915/Makefile
@@ -28,6 +28,10 @@ CFLAGS_i915_pci.o = $(call cc-disable-warning, override-init)
 CFLAGS_display/intel_display_device.o = $(call cc-disable-warning, override-init)
 CFLAGS_display/intel_fbdev.o = $(call cc-disable-warning, override-init)
 
+# Support compiling the display code separately for both i915 and xe
+# drivers. Define I915 when building i915.
+subdir-ccflags-y += -DI915
+
 subdir-ccflags-y += -I$(srctree)/$(src)
 
 # Please keep these build lists sorted!
-- 
2.39.2

