Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FECE566D82
	for <lists+dri-devel@lfdr.de>; Tue,  5 Jul 2022 14:25:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2CD010E4B1;
	Tue,  5 Jul 2022 12:25:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6502C10E30A;
 Tue,  5 Jul 2022 12:25:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657023903; x=1688559903;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ez4g0/LPC6LVLpM9YIfUBXO+wmd7mCxB16xqHAblQ70=;
 b=LU4wwL5pruGnmUe0kA/BPspnz/YFxIanFIniKI3qAT1fo/VKJvR1ljHE
 tpDLkxymgBZ4Z9w5fQ/W7LVYjV+NsVLncdiJGv4xQIcx3xFRNF9LJMFEk
 v5fdijQ6F+qeRF6S3ETBiy9UTp6N1SFNU//sWodd0L8glbULApkX8JPAk
 F8e3LsuyTZnpP6LGxT0dOSpUA6yl+uVbL31G0YKclG5TyNY/J9HQ4ZIU/
 156E3v6n446j1KWQVsopcQ7etG1eILCFKBnFMqL//Hme/MAws4frSwHw/
 FPWB+gNVFJVRjOkv91+0QPM7MUig+7tvMYZtlZJh+wY7I3MfkXLctLKC9 Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10398"; a="345019738"
X-IronPort-AV: E=Sophos;i="5.92,245,1650956400"; d="scan'208";a="345019738"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jul 2022 05:25:02 -0700
X-IronPort-AV: E=Sophos;i="5.92,245,1650956400"; d="scan'208";a="650119399"
Received: from mmckenzi-mobl.ger.corp.intel.com (HELO
 hades.ger.corp.intel.com) ([10.252.50.45])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jul 2022 05:24:59 -0700
From: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 0/7] Fixes integer overflow or integer truncation issues in
 page lookups, ttm place configuration and scatterlist creation
Date: Tue,  5 Jul 2022 15:24:48 +0300
Message-Id: <20220705122455.3866745-1-gwan-gyeong.mun@intel.com>
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
 matthew.auld@intel.com, nirmoy.das@intel.com
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

Testcase: igt@gem_create@create-massive
Testcase: igt@gem_userptr_blits@input-checking
Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/4991
Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/5411
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

 drivers/gpu/drm/i915/gem/i915_gem_internal.c  |  6 +-
 drivers/gpu/drm/i915/gem/i915_gem_object.c    |  7 +-
 drivers/gpu/drm/i915/gem/i915_gem_object.h    | 77 +++++++++++--------
 drivers/gpu/drm/i915/gem/i915_gem_pages.c     | 25 +++---
 drivers/gpu/drm/i915/gem/i915_gem_phys.c      |  4 +
 drivers/gpu/drm/i915/gem/i915_gem_shmem.c     | 14 +++-
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c       | 29 ++++++-
 drivers/gpu/drm/i915/gem/i915_gem_userptr.c   |  5 +-
 .../drm/i915/gem/selftests/i915_gem_context.c | 12 +--
 .../drm/i915/gem/selftests/i915_gem_mman.c    |  8 +-
 .../drm/i915/gem/selftests/i915_gem_object.c  |  8 +-
 drivers/gpu/drm/i915/gvt/dmabuf.c             |  9 ++-
 drivers/gpu/drm/i915/i915_gem.c               | 18 ++++-
 drivers/gpu/drm/i915/i915_scatterlist.h       |  8 ++
 drivers/gpu/drm/i915/i915_utils.h             |  5 +-
 drivers/gpu/drm/i915/i915_vma.c               |  8 +-
 drivers/gpu/drm/i915/intel_region_ttm.c       | 16 +++-
 include/drm/drm_util.h                        | 54 +++++++++++++
 18 files changed, 226 insertions(+), 87 deletions(-)

-- 
2.34.1

