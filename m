Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8F8F5EAB45
	for <lists+dri-devel@lfdr.de>; Mon, 26 Sep 2022 17:40:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A66B10E0D0;
	Mon, 26 Sep 2022 15:40:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4904810E0D0;
 Mon, 26 Sep 2022 15:40:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1664206822; x=1695742822;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=4XhPcRJh4ka65SQONH+kTJV7Dl3Cx9q/CZr71E/oqUk=;
 b=PK4IEjYNkL+p3seKQzQOhxFxt2TDvDRiTqJh3q92x2qnZqvPTey16oMU
 u/AWDZUj4oXaDa0wSASUr5F8NMx85Wo0R4ZIWdA4MaFK+tmJtkWBCV/yt
 AA1WpNcfTjO89m7xHN7tgh1CEO9RELeMBcEXr68cuCO9IrWRkunazPN0G
 tBox34PCiVoeqQxwLcqTglkqAkVKwG2TdwiQipUFYHsmeQvHIwujFd/G4
 T2Iu+VlEwJ6B7RtT5B2Qcs4bHxPSn1pM9UkPAObKmhjWNwO2nEPKJHQ1r
 vD37hKUanxw7yqy0GidaJo5dhaCaQYXF0MmVVn1DHs4VPBJk24Tm593Vf A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10482"; a="387352277"
X-IronPort-AV: E=Sophos;i="5.93,346,1654585200"; d="scan'208";a="387352277"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2022 08:40:16 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10482"; a="763480818"
X-IronPort-AV: E=Sophos;i="5.93,346,1654585200"; d="scan'208";a="763480818"
Received: from bsochack-mobl2.ger.corp.intel.com (HELO
 paris.ger.corp.intel.com) ([10.249.128.215])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2022 08:40:07 -0700
From: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v12 0/9] Fixes integer overflow or integer truncation issues
 in page lookups, ttm place configuration and scatterlist creation
Date: Mon, 26 Sep 2022 18:39:44 +0300
Message-Id: <20220926153953.3836470-1-gwan-gyeong.mun@intel.com>
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
In order to provide a common macro, it moves and adds a few utility macros
into overflow/compiler header.
Introduces overflows_type() and __castable_to_type(). overflows_type()
tests if a variable or constant value would  overflow another variable or
type. This can be used as a constant expression for static_assert() (which
requires a constant expression[2][3]) when used on constant values. This
must be constructed manually, since __builtin_add_overflow() does not
produce a constant expression[4]. Additionally adds __castable_to_type(),
similar to __same_type(), for checking if a constant value will fit in a
given type (i.e. it could be cast to the type without overflow). Add unit
tests for overflows_type(), __same_type(), and __castable_to_type() to the
existing KUnit "overflow" test. And Introduce check_assign() and
check_assign_user_ptr(). the check_assign() macro which performs an
assigning source value into destination pointer along with an overflow
check and check_assign_user_ptr() macro which performs an assigning source
value into destination pointer type variable along with an overflow check.
If an explicit overflow check is required while assigning to a user-space
ptr, assign_user_ptr() can be used instead of u64_to_user_ptr() to assign
integers into __user pointers along with an overflow check.
In order to implement check_assign(), overflows_type() on top of updated
check_add_overflow() macro, this series include the patch which came from
Kees [1] (this patch is under reviewing from other patch mail). 

[1] https://lore.kernel.org/all/202208311040.C6CA8253@keescook/
[2] https://en.cppreference.com/w/c/language/_Static_assert
[3] C11 standard (ISO/IEC 9899:2011): 6.7.10 Static assertions
[4] https://gcc.gnu.org/onlinedocs/gcc/Integer-Overflow-Builtins.html
    6.56 Built-in Functions to Perform Arithmetic with Overflow Checking
    Built-in Function: bool __builtin_add_overflow (type1 a, type2 b,
                                                    type3 *res)

v12: Introduce updated overflows_type() and __castable_to_type() (Kees)
     Change to use static_assert(__castable_to_type(n ,T)) style since the
     assert_same_typable() macro has been dropped. (G.G)
v11: Update macro description (Andi)
     Change _Static_assert to static_assert (Rasmus)
     Rename assert_type to assert_same_type and  assert_typable to
     assert_same_typable (Rasmus)
     Update assert_same_typable macro to handle an overflow check on the
     target type when a constant value is used. (Kees)
     Add overflows_type_ret_const_expr which returns constant-expression
     value (G.G)
     Add is_unsigned_type (G.G)
     Add unit tests for overflows_type, overflows_type_ret_const_expr,
     assert_same_type and assert_same_typable. (Kees)
     Fix incorrect type assignment between different address spaces caused
     by the wrong use of __user macro. (kernel test robot)
v10: Add check_assign_user_ptr() macro and drop overflows_ptr() macro(Kees) 
     Use assert_typable instead of exactly_pgoff_t() macro (Kees)
     Remove a redundant type checking for a pointer. (Andrzej)
     Add patch "compiler_types.h: Add assert_type to catch type mis-match while compiling" and
     drop patch "util_macros: Add exact_type macro to catch type mis-match while compiling" from patch series (G.G.)
     (adding of assert_type(t1, t2) and assert_typable(t, n) were suggested by Kees v9's comments)
v9: Fix overflows_type() to use __builtin_add_overflow() instead of
    __builtin_add_overflow_p() (Andrzej)
    Fix overflows_ptr() to use overflows_type() with the unsigned long type (Andrzej)
v8: Add check_assign() and remove safe_conversion() (Kees)
    Replace safe_conversion() with check_assign() (Kees)
    Fix overflows_type() to use gcc's built-in overflow function (Andrzej)
    Add overflows_ptr() to allow overflow checking when assigning a value
    into a pointer variable (G.G.)
v7: Fix to use WARN_ON() macro where GEM_BUG_ON() macro was used. (Jani)
v6: Move macro addition location so that it can be used by other than drm subsystem (Jani, Mauro, Andi)
    Fix to follow general use case for GEM_BUG_ON(). (Jani)
v5: Fix an alignment to match open parenthesis
    Fix macros to be enclosed in parentheses for complex values
    Fix too long line warning
v4: Fix build warnins that reported by kernel test robot. (kernel test robot <lkp@intel.com>)
    Add kernel-doc markups to the kAPI functions and macros (Mauoro)
v3: Modify overflows_type() macro to consider signed data types and
	add is_type_unsigned() macro (Mauro)
    Make not use the same macro name on a function. (Mauro)
    For kernel-doc, macros and functions are handled in the same namespace,
    the same macro name on a function prevents ever adding documentation for it.
    Not to change execution inside a macro. (Mauro)
    Fix the problem that safe_conversion() macro always returns true (G.G)
    Add safe_conversion_gem_bug_on() macro and remove temporal SAFE_CONVERSION() macro. (G.G.)

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
  overflow: Introduce overflows_type() and __castable_to_type()

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
 drivers/gpu/drm/i915/i915_utils.h             |   6 +-
 drivers/gpu/drm/i915/i915_vma.c               |   8 +-
 drivers/gpu/drm/i915/intel_region_ttm.c       |  17 +-
 include/linux/compiler.h                      |   1 +
 include/linux/overflow.h                      | 166 ++++--
 lib/overflow_kunit.c                          | 494 ++++++++++++++++--
 21 files changed, 1000 insertions(+), 158 deletions(-)

-- 
2.37.1

