Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E09F590AE1D
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jun 2024 14:41:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C8EC10E398;
	Mon, 17 Jun 2024 12:41:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VQlRM+Bf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E994210E398;
 Mon, 17 Jun 2024 12:41:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718628090; x=1750164090;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=bc1sUn8jrPqgaACKCCuasIWiYGrSLmqPWWMJYMwe/lg=;
 b=VQlRM+BfVipGSuGTZbk0KuaraiV37f82EF/XSg7yb+QwTxwf2EdhXTFZ
 gN7p7s4+Dmrg4t5+626JGKgBdXtHRDRCovb78vD9ACg+Fvej0xiaos9t7
 d58g1mdLiQnsaGA+a0V72Ha0iqMeXmuu5fwdeaGkv9odEBsBPDvf4U58a
 38kh0dl2b1Fru/uEmODKKfJWpfVNuRY/Ru412hsib4XZFyMcf06rQfYnn
 +119W1O+TOgBS2c3x4bxQnvNvKk1rz9XdBeg1EwZeZ+wB3bWk/XBbQFEe
 omRju6bsxkcJHonn+GwgC27gc7WWLBU4FB7JrLH9HDHSzXBZCRVikUE6v Q==;
X-CSE-ConnectionGUID: LH8iJTuPQlOVzbMM3M/lBg==
X-CSE-MsgGUID: 6ZAWCZwDTpiMmC3FB44VUw==
X-IronPort-AV: E=McAfee;i="6700,10204,11105"; a="26565329"
X-IronPort-AV: E=Sophos;i="6.08,244,1712646000"; d="scan'208";a="26565329"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2024 05:41:30 -0700
X-CSE-ConnectionGUID: cJZAlpTdTieUgHHfSQL7Uw==
X-CSE-MsgGUID: c8Vl27g1SY6mBnLaHsrH9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,244,1712646000"; d="scan'208";a="46110485"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO intel.com)
 ([10.245.246.76])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2024 05:41:26 -0700
From: Andi Shyti <andi.shyti@linux.intel.com>
To: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Cc: Nirmoy Das <nirmoy.das@intel.com>,
 Chris Wilson <chris.p.wilson@linux.intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>
Subject: [PATCH] drm/i915/gem: Return SIGBUS for wrong mapping parameters
Date: Mon, 17 Jun 2024 14:41:15 +0200
Message-ID: <20240617124115.260250-1-andi.shyti@linux.intel.com>
X-Mailer: git-send-email 2.45.1
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

We normally issue a warning when incorrect memory parameters are
provided. Typically, providing erroneous addresses to mmap,
results in a segmentation fault, and the default behavior
is to return VM_FAULT_SIGBUS.

This can happen for example when remap_io_mapping() or
remap_io_sg() return -EINVAL.

Because VM_FAULT_SIGBUS is already returned when memory
boundaries are improperly handled and numerous warnings are
already generated, avoid redundant logging to prevent
overprinting by translating -EINVAL to VM_FAULT_SIGBUS in the
i915_error_to_vmf_fault() helper.

Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_mman.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_mman.c b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
index a2195e28b625..698ff42b004a 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_mman.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
@@ -223,6 +223,7 @@ static vm_fault_t i915_error_to_vmf_fault(int err)
 	default:
 		WARN_ONCE(err, "unhandled error in %s: %i\n", __func__, err);
 		fallthrough;
+	case -EINVAL: /* the memory parameters provided are wrong */
 	case -EIO: /* shmemfs failure from swap device */
 	case -EFAULT: /* purged object */
 	case -ENODEV: /* bad object, how did you get here! */
-- 
2.45.1

