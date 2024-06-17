Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80AC990B9F4
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jun 2024 20:43:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C7D810E4BA;
	Mon, 17 Jun 2024 18:43:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FRhbV00O";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 792F910E4B9;
 Mon, 17 Jun 2024 18:43:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718649789; x=1750185789;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=yuygjAhYKn4Hc233ao6B5BgQp2ulQztEsYf2DIp6rkw=;
 b=FRhbV00OeW0weK9zjud/nNg/5vlYTqHp6aCwXG1QB/SDzkOG516fb6lN
 W7vDI9rTjQ6McZza8GG4Q2evY7593ohtleFYNqEHH8BQJLPiPyy3osjhL
 wnaInLifvIBo/WcwZDzh4vTWOAw3SV6ksY6g79ntjG0JXAD7W0stlOhtD
 Ce0Cpfwe2YLkSgiDM4xuycXLbYnu7ExewITcu8vSZK4YWr7WsKCNk4Sov
 krIf3Z1qWd4WVLXZB7OlqFDBrY2nWqwMlcc56PJ7tQ8b49QzeOLAKToCy
 KYz3sjeRjdiltInx7Owrpzm8nii2Ec34Ufgl/WVAfRsKkgF96PR+rgo3J g==;
X-CSE-ConnectionGUID: L3f/FA7pT4OM+q+TYzknwA==
X-CSE-MsgGUID: /2+r1clgSoWR1kHg3VS0ww==
X-IronPort-AV: E=McAfee;i="6700,10204,11106"; a="15726690"
X-IronPort-AV: E=Sophos;i="6.08,245,1712646000"; d="scan'208";a="15726690"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2024 11:43:08 -0700
X-CSE-ConnectionGUID: PlO+AN+mQEyyctBsmS4W9w==
X-CSE-MsgGUID: pp+5bcpURqyvR0pfvLIUSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,245,1712646000"; d="scan'208";a="41213641"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO intel.com)
 ([10.245.246.127])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2024 11:43:06 -0700
From: Andi Shyti <andi.shyti@linux.intel.com>
To: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Cc: Andi Shyti <andi.shyti@linux.intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v2 2/2] drm/i915/gem: Use the correct format specifier for
 resource_size_t
Date: Mon, 17 Jun 2024 20:42:43 +0200
Message-ID: <20240617184243.330231-3-andi.shyti@linux.intel.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240617184243.330231-1-andi.shyti@linux.intel.com>
References: <20240617184243.330231-1-andi.shyti@linux.intel.com>
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

Commit 05da7d9f717b ("drm/i915/gem: Downgrade stolen lmem setup
warning") adds a debug message where the "lmem_size" and
"dsm_base" variables are printed using the %lli identifier.

However, these variables are defined as resource_size_t, which
are unsigned long for 32-bit machines and unsigned long long for
64-bit machines.

The documentation (core-api/printk-formats.rst) recommends using
the %pa specifier for printing addresses and sizes of resources.

Replace %lli with %pa.

This patch also mutes the following sparse warning when compiling
with:

   make W=1 ARCH=i386 drivers/gpu/drm/i915

>> drivers/gpu/drm/i915/gem/i915_gem_stolen.c:941:5: error: format '%lli'
   expects argument of type 'long long int', but argument 5 has type
   'resource_size_t' {aka 'unsigned int'} [-Werror=format=]

Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
---
Cc: Lucas De Marchi <lucas.demarchi@intel.com>

 drivers/gpu/drm/i915/gem/i915_gem_stolen.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_stolen.c b/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
index 9ca73936dc5e..d29005980806 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
@@ -938,8 +938,8 @@ i915_gem_stolen_lmem_setup(struct drm_i915_private *i915, u16 type,
 		dsm_base = intel_uncore_read64(uncore, GEN6_DSMBASE) & GEN11_BDSM_MASK;
 		if (lmem_size < dsm_base) {
 			drm_dbg(&i915->drm,
-				"Disabling stolen memory support due to OOB placement: lmem_size = %lli vs dsm_base = %lli\n",
-				lmem_size, dsm_base);
+				"Disabling stolen memory support due to OOB placement: lmem_size = %pa vs dsm_base = %pa\n",
+				&lmem_size, &dsm_base);
 			return NULL;
 		}
 		dsm_size = ALIGN_DOWN(lmem_size - dsm_base, SZ_1M);
-- 
2.45.1

