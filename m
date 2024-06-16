Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2F28909C05
	for <lists+dri-devel@lfdr.de>; Sun, 16 Jun 2024 09:04:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4F9410E158;
	Sun, 16 Jun 2024 07:04:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cfu/5EXM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDE7F10E164;
 Sun, 16 Jun 2024 07:04:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718521463; x=1750057463;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=z+Y0gvIoMUjU1pMDYQnweJSrbpXtsBroGjE0fuBTLqM=;
 b=cfu/5EXMvUE6lRo9HSEEMpAMm9anEzqj9Un4qgIq+COMiQitULEu6aVd
 pMxmscwf6kKS1VM/GMiWi84it1O6iyzvmwvYZIzdWeGvRUiwLm7TnO/ih
 RF2n6k50wIuhUQmGQOdEgJCD0CWPrEW0UHPEkjAFKXAu0k2Nkk7lHnKdU
 5t8ELwzfOwGWKprVqln6nf0SvKY9CHvCLuWrNSWFxZKm1ARJ6WffVKjLl
 MeYqUVIL9j7PPBm76/xfCQbCIKRO+lNdvTNZQjU+PrFpJkxcGQHOYQLmY
 WG8yKORz9e7DydCOV5SUv3Su4Xfltg/mie03yDVSQpXJiIiYjsnFjY56w w==;
X-CSE-ConnectionGUID: Tb0fiLwuTcGf7BbV43nG/w==
X-CSE-MsgGUID: fRmrzEBVQj2GJwk09J8z/w==
X-IronPort-AV: E=McAfee;i="6700,10204,11104"; a="15504766"
X-IronPort-AV: E=Sophos;i="6.08,241,1712646000"; d="scan'208";a="15504766"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2024 00:04:23 -0700
X-CSE-ConnectionGUID: uzGyd0WdT0GFJxwsa6sbFQ==
X-CSE-MsgGUID: 6cPC8UbBQyCtKJ2XY+xucw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,241,1712646000"; d="scan'208";a="78379930"
Received: from lfiedoro-mobl.ger.corp.intel.com (HELO intel.com)
 ([10.245.246.42])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2024 00:04:22 -0700
From: Andi Shyti <andi.shyti@linux.intel.com>
To: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Cc: Andi Shyti <andi.shyti@linux.intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>
Subject: [PATCH 2/2] drm/i915/gem: Use the correct format specifier for
 resource_size_t
Date: Sun, 16 Jun 2024 09:03:49 +0200
Message-ID: <20240616070349.250899-3-andi.shyti@linux.intel.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240616070349.250899-1-andi.shyti@linux.intel.com>
References: <20240616070349.250899-1-andi.shyti@linux.intel.com>
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
 drivers/gpu/drm/i915/gem/i915_gem_stolen.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_stolen.c b/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
index bd774ce713cf..d78afdcbe0fe 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
@@ -938,8 +938,8 @@ i915_gem_stolen_lmem_setup(struct drm_i915_private *i915, u16 type,
 		dsm_base = intel_uncore_read64(uncore, GEN6_DSMBASE) & GEN11_BDSM_MASK;
 		if (lmem_size < dsm_base) {
 			drm_err(&i915->drm,
-				"Disabling stolen memory support due to OOB placement: lmem_size = %lli vs dsm_base = %lli\n",
-				lmem_size, dsm_base);
+				"Disabling stolen memory support due to OOB placement: lmem_size = %pa vs dsm_base = %pa\n",
+				&lmem_size, &dsm_base);
 			return ERR_PTR(-EINVAL);
 		}
 		dsm_size = ALIGN_DOWN(lmem_size - dsm_base, SZ_1M);
-- 
2.45.1

