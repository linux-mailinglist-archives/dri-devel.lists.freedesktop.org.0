Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F1AC90B9F2
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jun 2024 20:43:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F23610E4B6;
	Mon, 17 Jun 2024 18:43:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="baTqwTHg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C6F410E4B2;
 Mon, 17 Jun 2024 18:43:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718649783; x=1750185783;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WSWDaeP5xjeda75dldf75dbBeBpk6nASmv6UBXIRI9Q=;
 b=baTqwTHgma/M7e7Q6RV8wHVCGmvmnvT8Yk5VD1P4nDZFHkUUnt+yT9EH
 rmArPx38ZUsywR1FqqAqYePqNwbdC73VozcPS/Gdg8gfO7t5WQ5X1evXY
 XgzV1or4TkHrpB4wjWJ5jPrrFFgxqm8Hi7yEz75J8OhJbMTjeqssv8CBA
 wTNF85MFgtqpHH1hF0M5vbb5HEfXWpCcMVNHstHcA7bfRYVMnz0XCIRP/
 GiqtBA6/ks6/Ged37qNmOXE0xG7TJ6EzRqHnCNZUvj1+ukKRyozco/Ptw
 OueeMiDb/62x8JWInezKShNrng66v3MqTybE+EMxDv4iSguxamQ8RwvgG w==;
X-CSE-ConnectionGUID: 4BdiyYuwTZW8WUajY9GO+w==
X-CSE-MsgGUID: N2PWz3NDSaSAjp0l00QOow==
X-IronPort-AV: E=McAfee;i="6700,10204,11106"; a="15726671"
X-IronPort-AV: E=Sophos;i="6.08,245,1712646000"; d="scan'208";a="15726671"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2024 11:43:02 -0700
X-CSE-ConnectionGUID: 5I/Yqcm0SyyXqa3qtERM6g==
X-CSE-MsgGUID: xKVsw96gRSascWybF4fqGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,245,1712646000"; d="scan'208";a="41213606"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO intel.com)
 ([10.245.246.127])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2024 11:43:00 -0700
From: Andi Shyti <andi.shyti@linux.intel.com>
To: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Cc: Andi Shyti <andi.shyti@linux.intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v2 1/2] drm/i915/gem: Return NULL instead of '0'
Date: Mon, 17 Jun 2024 20:42:42 +0200
Message-ID: <20240617184243.330231-2-andi.shyti@linux.intel.com>
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
warning") returns '0' from i915_gem_stolen_lmem_setup(), but it's
supposed to return a pointer to the intel_memory_region
structure.

Sparse complains with the following message:

>> drivers/gpu/drm/i915/gem/i915_gem_stolen.c:943:32: sparse: sparse:
   Using plain integer as NULL pointer

Return NULL.

Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
---
Cc: Lucas De Marchi <lucas.demarchi@intel.com>

 drivers/gpu/drm/i915/gem/i915_gem_stolen.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_stolen.c b/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
index 004471f60117..9ca73936dc5e 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
@@ -940,7 +940,7 @@ i915_gem_stolen_lmem_setup(struct drm_i915_private *i915, u16 type,
 			drm_dbg(&i915->drm,
 				"Disabling stolen memory support due to OOB placement: lmem_size = %lli vs dsm_base = %lli\n",
 				lmem_size, dsm_base);
-			return 0;
+			return NULL;
 		}
 		dsm_size = ALIGN_DOWN(lmem_size - dsm_base, SZ_1M);
 	}
-- 
2.45.1

