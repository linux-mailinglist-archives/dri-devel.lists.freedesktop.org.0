Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BDE1157A070
	for <lists+dri-devel@lfdr.de>; Tue, 19 Jul 2022 16:06:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33B5418B9BD;
	Tue, 19 Jul 2022 14:05:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 954F418B995;
 Tue, 19 Jul 2022 14:05:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1658239552; x=1689775552;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ERKbTLP6iW56Cz7C8ujDEJftZrTKtt9jBe6WWDAaJdc=;
 b=jK9a+rwtVsa/D9ONp0zkUwBvqhfgPhmZBz26rHEO9I9CznfkRYY5mT8Y
 PoX94e1JfAiTBLDq66w3K9ueAJrPiQrPOF1MHXc/KeocMNhELetaxGHP7
 4UoaCT/x9k+ppmwlPgIZxbZjjuOpJNVHkedJ4Uwr8GQvjgQURHM9rGA+X
 mN10YKJ7eNoaUQcoSbVx4JJuh8rR40rKgY9+U0F/8GgcB7W6U7myFch2g
 X8yXz5BA92+6U5Z2isV6dgAAa8IzyGoErNC7AG42Emm5M+yAzne2vDniL
 t7OuslDbFuwqE9AO4bBXcIawOI/s+ds/7t9PnKFxWY59JVsTCYwkePEy4 g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10412"; a="269523294"
X-IronPort-AV: E=Sophos;i="5.92,284,1650956400"; d="scan'208";a="269523294"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2022 07:05:28 -0700
X-IronPort-AV: E=Sophos;i="5.92,284,1650956400"; d="scan'208";a="655773670"
Received: from unknown (HELO hades.ger.corp.intel.com) ([10.252.55.53])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2022 07:05:25 -0700
From: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v4 0/7] Fixes integer overflow or integer truncation issues in
 page lookups, ttm place configuration and scatterlist creation
Date: Tue, 19 Jul 2022 17:04:17 +0300
Message-Id: <20220719140424.430572-1-gwan-gyeong.mun@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: thomas.hellstrom@linux.intel.com, jani.nikula@intel.com,
 dri-devel@lists.freedesktop.org, chris@chris-wilson.co.uk, airlied@linux.ie,
 matthew.auld@intel.com, mchehab@kernel.org, nirmoy.das@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch series fixes integer overflow or integer truncation issues in
page lookups, ttm place configuration and scatterlist creation, etc.
We need to check that we avoid integer overflows when looking up a page,
and so fix all the instances where we have mistakenly used a plain integer
instead of a more suitable long.
And there is an impedance mismatch between the scatterlist API using
unsigned int and our memory/page accounting in unsigned long. That is we
may try to create a scatterlist for a large object that overflows returning
a small table into which we try to fit very many pages. As the object size
is under the control of userspace, we have to be prudent and catch the
conversion errors. To catch the implicit truncation as we switch from
unsigned long into the scatterlist's unsigned int, we use our overflows_type
check and report E2BIG prior to the operation. This is already used in
our create ioctls to indicate if the uABI request is simply too large for
the backing store. 
And ttm place also has the same problem with scatterlist creation,
and we fix the integer truncation problem with the way approached by
scatterlist creation.
And It corrects the error code to return -E2BIG when creating gem objects
using ttm or shmem, if the size is too large in each case.
In order to provide a common macro, it moves and adds a few utility macros into drm util header

v3: Modify overflows_type() macro to consider signed data types and
	add is_type_unsigned() macro (Mauro)
    Make not use the same macro name on a function. (Mauro)
    For kernel-doc, macros and functions are handled in the same namespace,
    the same macro name on a function prevents ever adding documentation for it.
    Not to change execution inside a macro. (Mauro)
    Fix the problem that safe_conversion() macro always returns true (G.G)
    Add safe_conversion_gem_bug_on() macro and remove temporal SAFE_CONVERSION() macro. (G.G.)
v4: Fix build warnins that reported by kernel test robot. (kernel test robot <lkp@intel.com>)
    Add kernel-doc markups to the kAPI functions and macros (Mauoro)

Testcase: igt@gem_create@create-massive
Testcase: igt@gem_userptr_blits@input-checking
Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/4991
Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/5411
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Chris Wilson <chris@chris-wilson.co.uk>
Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Nirmoy Das <nirmoy.das@intel.com>
Cc: Jani Nikula <jani.nikula@intel.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>

Chris Wilson (3):
  drm/i915/gem: Typecheck page lookups
  drm/i915: Check for integer truncation on scatterlist creation
  drm/i915: Remove truncation warning for large objects

Gwan-gyeong Mun (4):
  drm: Move and add a few utility macros into drm util header
  drm/i915: Check for integer truncation on the configuration of ttm
    place
  drm/i915: Check if the size is too big while creating shmem file
  drm/i915: Use error code as -E2BIG when the size of gem ttm object is
    too large

 drivers/gpu/drm/i915/gem/i915_gem_internal.c  |   6 +-
 drivers/gpu/drm/i915/gem/i915_gem_object.c    |   7 +-
 drivers/gpu/drm/i915/gem/i915_gem_object.h    | 303 +++++++++++++++---
 drivers/gpu/drm/i915/gem/i915_gem_pages.c     |  27 +-
 drivers/gpu/drm/i915/gem/i915_gem_phys.c      |   4 +
 drivers/gpu/drm/i915/gem/i915_gem_shmem.c     |  19 +-
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c       |  23 +-
 drivers/gpu/drm/i915/gem/i915_gem_userptr.c   |   5 +-
 .../drm/i915/gem/selftests/i915_gem_context.c |  12 +-
 .../drm/i915/gem/selftests/i915_gem_mman.c    |   8 +-
 .../drm/i915/gem/selftests/i915_gem_object.c  |   8 +-
 drivers/gpu/drm/i915/gvt/dmabuf.c             |   9 +-
 drivers/gpu/drm/i915/i915_gem.c               |  18 +-
 drivers/gpu/drm/i915/i915_gem.h               |   4 +
 drivers/gpu/drm/i915/i915_scatterlist.h       |   8 +
 drivers/gpu/drm/i915/i915_utils.h             |   5 +-
 drivers/gpu/drm/i915/i915_vma.c               |   8 +-
 drivers/gpu/drm/i915/intel_region_ttm.c       |  20 +-
 include/drm/drm_util.h                        |  77 +++++
 19 files changed, 478 insertions(+), 93 deletions(-)

-- 
2.34.1

