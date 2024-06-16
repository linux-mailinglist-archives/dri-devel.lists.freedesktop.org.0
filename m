Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F921909C04
	for <lists+dri-devel@lfdr.de>; Sun, 16 Jun 2024 09:04:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED42E10E15E;
	Sun, 16 Jun 2024 07:04:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VtxqNsuT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 355D310E14B;
 Sun, 16 Jun 2024 07:04:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718521457; x=1750057457;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3yzp8HPJZs3AbDjyqABYx/hljOmgtItfu+wrI/YE590=;
 b=VtxqNsuTEMifbqEbQh6w5s3e98uwFBagEFbFtxKZRlfomq9yQSOequRS
 j/uUFpc7VO4Vz8sTSzUhLmA7kyTGB0f8pwSwUoA1OkiXEnMrS3lUThOcf
 VT8DeOzS94v0GRhN0rrLPluyOSaHgc8AxL5GDNiAJq6f2EMHBUcMak/+u
 ueF/thuYk8Xw7IB7x3tNbpldES4ai+9lPIjCVxZJhH8mYHmTx87tHKRgp
 NGN3gURE8YQuzKq35Y3QJ2rmYBceLabH2UdpfeZHKFCERP/KdL4mgnBU1
 7WKmFrvAJXKHRZ8L2fSzBGGbQdpie2Ye3wKShPAABfZ5/rVVqWEC+yQeT Q==;
X-CSE-ConnectionGUID: d0fvoxoXTt+7AQ8IYILmBg==
X-CSE-MsgGUID: c8U1GJCyQBe+A4DbG5v79w==
X-IronPort-AV: E=McAfee;i="6700,10204,11104"; a="15504756"
X-IronPort-AV: E=Sophos;i="6.08,241,1712646000"; d="scan'208";a="15504756"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2024 00:04:17 -0700
X-CSE-ConnectionGUID: 2Cl4e7pqQZWpBOuZGC96cQ==
X-CSE-MsgGUID: e/tfwd75TFGhO9feD6y6jg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,241,1712646000"; d="scan'208";a="78379889"
Received: from lfiedoro-mobl.ger.corp.intel.com (HELO intel.com)
 ([10.245.246.42])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2024 00:04:15 -0700
From: Andi Shyti <andi.shyti@linux.intel.com>
To: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Cc: Andi Shyti <andi.shyti@linux.intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>
Subject: [PATCH 1/2] drm/i915/gem: Return -EINVAL instead of '0'
Date: Sun, 16 Jun 2024 09:03:48 +0200
Message-ID: <20240616070349.250899-2-andi.shyti@linux.intel.com>
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
warning") returns '0' from i915_gem_stolen_lmem_setup(), but it's
supposed to return a pointer to the intel_memory_region
structure.

Sparse complains with the following message:

>> drivers/gpu/drm/i915/gem/i915_gem_stolen.c:943:32: sparse: sparse:
   Using plain integer as NULL pointer

The caller checks for errors, and if no error is returned, it
stores the address of the stolen memory. Therefore, we can't
return NULL. Since we are handling a case of out-of-bounds, it's
appropriate to treat the "lmem_size < dsm_base" case as an error.

Return -EINVAL embedded in a pointer instead of '0' (or NULL).

This way, we avoid a potential NULL pointer dereference.

Since we are returning an error, it makes sense to print an error
message with drm_err() instead of a debug message using
drm_dbg().

Fixes: 05da7d9f717b ("drm/i915/gem: Downgrade stolen lmem setup warning")
Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_stolen.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_stolen.c b/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
index 004471f60117..bd774ce713cf 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
@@ -937,10 +937,10 @@ i915_gem_stolen_lmem_setup(struct drm_i915_private *i915, u16 type,
 		/* Use DSM base address instead for stolen memory */
 		dsm_base = intel_uncore_read64(uncore, GEN6_DSMBASE) & GEN11_BDSM_MASK;
 		if (lmem_size < dsm_base) {
-			drm_dbg(&i915->drm,
+			drm_err(&i915->drm,
 				"Disabling stolen memory support due to OOB placement: lmem_size = %lli vs dsm_base = %lli\n",
 				lmem_size, dsm_base);
-			return 0;
+			return ERR_PTR(-EINVAL);
 		}
 		dsm_size = ALIGN_DOWN(lmem_size - dsm_base, SZ_1M);
 	}
-- 
2.45.1

