Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A59035ED73A
	for <lists+dri-devel@lfdr.de>; Wed, 28 Sep 2022 10:13:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0D3F10E303;
	Wed, 28 Sep 2022 08:13:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F55B10E303;
 Wed, 28 Sep 2022 08:13:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1664352803; x=1695888803;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=WB6T+yJXx+m1nIR3FdvolGa4A9+LMo8MXrdYv+JxSW8=;
 b=eLB4/mgLhulGtEkDCHOqnXqoyOD+ptZp4vS4AXHeQWAwaUJwkyoICAN1
 2ipKZ/G3g1XpkMSu4EECkjDknN9zyVGT0WZMcw74kIX/a3HJ46Z0ULqvx
 CGzFJCo+LhnQd5s1zCMfvF44eE0K9uTg1Itif1OT0hyVZPth75bPvWtdU
 UdXnVs8oTgdnntg8TAApiZn4xJoqPUNJU9pGocy8NhrwQQnhHJGKVHcPG
 6Y6Z28Yg1Pk0PK2PuinF8VHKijx44erG6nBU6PNlJg42i7UqSdx0WNBzg
 IMKVPLASUqv13RcFoEq4YCg8l4KY3Bvzfu49fQfu37tLvD5e8RpZN7AIv A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10483"; a="281257588"
X-IronPort-AV: E=Sophos;i="5.93,351,1654585200"; d="scan'208";a="281257588"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2022 01:13:22 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10483"; a="621836042"
X-IronPort-AV: E=Sophos;i="5.93,351,1654585200"; d="scan'208";a="621836042"
Received: from maciejos-mobl.ger.corp.intel.com (HELO
 paris.ger.corp.intel.com) ([10.249.147.47])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2022 01:13:13 -0700
From: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v13 0/9] Fixes integer overflow or integer truncation issues
 in page lookups, ttm place configuration and scatterlist creation
Date: Wed, 28 Sep 2022 11:12:51 +0300
Message-Id: <20220928081300.101516-1-gwan-gyeong.mun@intel.com>
X-Mailer: git-send-email 2.37.1
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
Cc: gustavoars@kernel.org, trix@redhat.com, dlatypov@google.com,
 llvm@lists.linux.dev, linux@rasmusvillemoes.dk,
 dri-devel@lists.freedesktop.org, chris@chris-wilson.co.uk,
 linux-hardening@vger.kernel.org, andrzej.hajda@intel.com,
 linux-sparse@vger.kernel.org, matthew.auld@intel.com,
 andi.shyti@linux.intel.com, airlied@redhat.com,
 thomas.hellstrom@linux.intel.com, keescook@chromium.org, jani.nikula@intel.com,
 nathan@kernel.org, mchehab@kernel.org, mauro.chehab@linux.intel.com,
 ndesaulniers@google.com, linux-kernel@vger.kernel.org, vitor@massaru.org,
 luc.vanoostenryck@gmail.com, nirmoy.das@intel.com
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
unsigned long into the scatterlist's unsigned int, we use improved
overflows_type check and report E2BIG prior to the operation. This is
already used in our create ioctls to indicate if the uABI request is simply
too large for the backing store. 
And ttm place also has the same problem with scatterlist creation,
and we fix the integer truncation problem with the way approached by
scatterlist creation.
And It corrects the error code to return -E2BIG when creating gem objects
using ttm or shmem, if the size is too large in each case.
In order to provide a common macro, it adds a few utility macros
into overflow header.
Introduce check_assign() and check_assign_user_ptr(). the check_assign()
macro which performs an assigning source value into destination pointer
along with an overflow check and check_assign_user_ptr() macro which
performs an assigning source value into destination pointer type variable
along with an overflow check. If an explicit overflow check is required
while assigning to a user-space ptr, assign_user_ptr() can be used instead
of u64_to_user_ptr() to assign integers into __user pointers along with an
overflow check. check_assign(), overflows_type() are implemented on top of
updated check_add_overflow() macro [1], and it also uses updated
overflows_type() and castable_to_type() macro [2].
Therefore this series include the patch which came from Kees [1][2]
(the both patches are under reviewing from other patch mails).

[1] https://lore.kernel.org/all/202208311040.C6CA8253@keescook/
[2] https://lore.kernel.org/lkml/20220926191109.1803094-1-keescook@chromium.org/

Chris Wilson (3):
  drm/i915/gem: Typecheck page lookups
  drm/i915: Check for integer truncation on scatterlist creation
  drm/i915: Remove truncation warning for large objects

Gwan-gyeong Mun (4):
  overflow: Introduce check_assign() and check_assign_user_ptr()
  drm/i915: Check for integer truncation on the configuration of ttm
    place
  drm/i915: Check if the size is too big while creating shmem file
  drm/i915: Use error code as -E2BIG when the size of gem ttm object is
    too large

Kees Cook (2):
  overflow: Allow mixed type arguments
  overflow: Introduce overflows_type() and castable_to_type()

 drivers/gpu/drm/i915/gem/i915_gem_internal.c  |   6 +-
 drivers/gpu/drm/i915/gem/i915_gem_object.c    |   7 +-
 drivers/gpu/drm/i915/gem/i915_gem_object.h    | 303 +++++++++--
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
 drivers/gpu/drm/i915/i915_scatterlist.h       |  11 +
 drivers/gpu/drm/i915/i915_user_extensions.c   |   6 +-
 drivers/gpu/drm/i915/i915_utils.h             |   4 -
 drivers/gpu/drm/i915/i915_vma.c               |   8 +-
 drivers/gpu/drm/i915/intel_region_ttm.c       |  17 +-
 include/linux/compiler.h                      |   1 +
 include/linux/overflow.h                      | 166 ++++--
 lib/overflow_kunit.c                          | 489 ++++++++++++++++--
 21 files changed, 993 insertions(+), 158 deletions(-)

-- 
2.37.1

