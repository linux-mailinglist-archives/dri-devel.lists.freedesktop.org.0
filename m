Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B6EE5E75B0
	for <lists+dri-devel@lfdr.de>; Fri, 23 Sep 2022 10:27:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A0B910E4FC;
	Fri, 23 Sep 2022 08:26:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E483910E4FC;
 Fri, 23 Sep 2022 08:26:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663921611; x=1695457611;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=A1SfIwDPy0JQXB0sK0hI7tDxlA2G9LbCtWyHjRWJmcQ=;
 b=To0tKGnu3lAV4pgubev0LxVSYYukgHWFEeRCg1NoRvdjYChnbM+EOT6D
 MR5NqLiSm1nXkg1ol7giDTKoepRCclA1kfuqeaKuVt54pptGL3sF6+aV4
 nld5P890qz5vaXLG5vbYVXNX3PaGUDeuMvgzrlF3/n3t6NqDI8y/pnOE0
 2VrIXjAtoa7B5Mj2ycECpZvIlYM22dqzc9/fL6r1/R/X4qclfjnWG4BxD
 7nPctwmUdtiatm91g6mrnC2SMP8xddrXIJtKy3FeVmIB6NfQfMRuwTzRR
 ylh+I0VN8ICxT43bUNOGiL3hvf+T3XilwplMU8+y70h8P7V05D7ZcitAe w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10478"; a="362354244"
X-IronPort-AV: E=Sophos;i="5.93,337,1654585200"; d="scan'208";a="362354244"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2022 01:26:50 -0700
X-IronPort-AV: E=Sophos;i="5.93,337,1654585200"; d="scan'208";a="622444104"
Received: from ngoncia-mobl2.ger.corp.intel.com (HELO
 paris.ger.corp.intel.com) ([10.249.143.58])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2022 01:26:44 -0700
From: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v11 0/9] Fixes integer overflow or integer truncation issues
 in page lookups, ttm place configuration and scatterlist creation
Date: Fri, 23 Sep 2022 11:26:19 +0300
Message-Id: <20220923082628.3061408-1-gwan-gyeong.mun@intel.com>
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
Cc: thomas.hellstrom@linux.intel.com, mauro.chehab@linux.intel.com,
 andi.shyti@linux.intel.com, keescook@chromium.org, jani.nikula@intel.com,
 ndesaulniers@google.com, dlatypov@google.com, linux@rasmusvillemoes.dk,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 chris@chris-wilson.co.uk, andrzej.hajda@intel.com, matthew.auld@intel.com,
 airlied@redhat.com, mchehab@kernel.org, vitor@massaru.org,
 nirmoy.das@intel.com
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
into overflow/compiler_types header.
It introduces assert_same_type() assert_same_typable() macros to catch type
mismatch while compiling. The existing typecheck() macro outputs build
warnings, but the newly added assert_same_type() macro uses the
static_assert macro (which uses _Static_assert keyword and it introduced in
C11) to generate a build break when the types are different and can be used
to detect explicit build errors. Unlike the assert_same_type() macro,
assert_same_typable() macro allows a constant value as the second argument.
Since static_assert is used at compile time and it requires
constant-expression as an argument [2][3], overflows_type_ret_const_expr()
is newly added. the overflows_type() has the same behavior, but the macro
uses __builtin_add_overflow() internally, and __builtin_add_overflows
returns a bool type [4], so it is difficult to use as an argument of
_Static_assert. The assert_same_type and assert_same_typable macros have
been added to compiler_types.h, but the overflows_type_ret_const_expr macro
has been added to overflow.h So, overflow.h has to be included to use
assert_same_typable which internally uses overflows_type_ret_const_expr.
And it adds unit tests for overflows_type, overflows_type_ret_const_expr,
assert_same_type and assert_same_typable. The overflows_type has been added
as well to compare whether the overflows_type_ret_const_expr unit test has
the same as the result. And it also introduces check_assign() and
check_assign_user_ptr() macros to perform an assigning source value into
the destination pointer along with an overflow check.
In order to implemente check_assign(), overflows_type() on top of updated
check_add_overflow() macro, this series include the patch which came from
Kees [1] (this patch is under reviewing from other patch mail). 

[1] https://lore.kernel.org/all/202208311040.C6CA8253@keescook/
[2] https://en.cppreference.com/w/c/language/_Static_assert
[3] C11 standard (ISO/IEC 9899:2011): 6.7.10 Static assertions
[4] https://gcc.gnu.org/onlinedocs/gcc/Integer-Overflow-Builtins.html
    6.56 Built-in Functions to Perform Arithmetic with Overflow Checking
    Built-in Function: bool __builtin_add_overflow (type1 a, type2 b,
                                                    type3 *res)

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

Gwan-gyeong Mun (5):
  overflow: Move and add few utility macros into overflow
  compiler_types.h: Add assert_same_type to catch type mis-match while
    compiling
  drm/i915: Check for integer truncation on the configuration of ttm
    place
  drm/i915: Check if the size is too big while creating shmem file
  drm/i915: Use error code as -E2BIG when the size of gem ttm object is
    too large

Kees Cook (1):
  overflow: Allow mixed type arguments

 drivers/gpu/drm/i915/gem/i915_gem_internal.c  |   6 +-
 drivers/gpu/drm/i915/gem/i915_gem_object.c    |   7 +-
 drivers/gpu/drm/i915/gem/i915_gem_object.h    | 303 ++++++++++++--
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
 include/linux/compiler_types.h                |  43 ++
 include/linux/overflow.h                      | 165 ++++++--
 lib/overflow_kunit.c                          | 384 ++++++++++++++++--
 22 files changed, 933 insertions(+), 157 deletions(-)

-- 
2.37.1

