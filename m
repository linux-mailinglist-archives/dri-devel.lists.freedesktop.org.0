Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 16F0B5EAB48
	for <lists+dri-devel@lfdr.de>; Mon, 26 Sep 2022 17:40:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68EB610E6F3;
	Mon, 26 Sep 2022 15:40:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D831110E6F4;
 Mon, 26 Sep 2022 15:40:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1664206833; x=1695742833;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=a15giGE9U8MfRV7QFZGLrBfnIa+lhGBT+wMMe9HhDqQ=;
 b=OqDVvX/1aqyWRoYQRkvkd8LWGjAhj0makgHyCGKJH2WP4kWEfmp22oad
 onznlwkQObRgeVp4Zb9Egz6SubgctQgehmCZV7ZKmvtSbqS+23J7unf0g
 mt6qPNHzM11OgyqUcMLJMw+/mPsZaZPW7i20J50+FVMcO3OOJsOTrwf9M
 8TmyEXkiOWnmreGGwSqAEcfKpxwwAJrIolvJWw89DpQPc5SqAgtrrBTPh
 22GvRPzolvEt0mqIm8vpeU10+lWIC32hWcg4Ru8pcuy5wC0l6t905bcaR
 HVczWP91w+gHF2QpEdI1HXiJxVmc15sY9XqLcj69+3wt6/Nl+9HTP/2/A A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10482"; a="288199344"
X-IronPort-AV: E=Sophos;i="5.93,346,1654585200"; d="scan'208";a="288199344"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2022 08:40:33 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10482"; a="763480870"
X-IronPort-AV: E=Sophos;i="5.93,346,1654585200"; d="scan'208";a="763480870"
Received: from bsochack-mobl2.ger.corp.intel.com (HELO
 paris.ger.corp.intel.com) ([10.249.128.215])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2022 08:40:24 -0700
From: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v12 2/9] overflow: Introduce check_assign() and
 check_assign_user_ptr()
Date: Mon, 26 Sep 2022 18:39:46 +0300
Message-Id: <20220926153953.3836470-3-gwan-gyeong.mun@intel.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220926153953.3836470-1-gwan-gyeong.mun@intel.com>
References: <20220926153953.3836470-1-gwan-gyeong.mun@intel.com>
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

Add check_assign() macro which performs an assigning source value into
destination pointer along with an overflow check and
check_assign_user_ptr() macro which performs an assigning source value into
destination pointer type variable along with an overflow check. If an
explicit overflow check is required while assigning to a user-space ptr,
assign_user_ptr() can be used instead of u64_to_user_ptr() to assign
integers into __user pointers along with an overflow check.

v3: Add is_type_unsigned() macro (Mauro)
    Modify overflows_type() macro to consider signed data types (Mauro)
    Fix the problem that safe_conversion() macro always returns true
v4: Fix kernel-doc markups
v6: Move macro addition location so that it can be used by other than drm
    subsystem (Jani, Mauro, Andi)
    Change is_type_unsigned to is_unsigned_type to have the same name form
    as is_signed_type macro
v8: Add check_assign() and remove safe_conversion() (Kees)
    Fix overflows_type() to use gcc's built-in overflow function (Andrzej)
    Add overflows_ptr() to allow overflow checking when assigning a value
    into a pointer variable (G.G.)
v9: Fix overflows_type() to use __builtin_add_overflow() instead of
    __builtin_add_overflow_p() (Andrzej)
    Fix overflows_ptr() to use overflows_type() with the unsigned long type
    (Andrzej)
v10: Remove a redundant type checking for a pointer. (Andrzej)
     Use updated check_add_overflow macro instead of __builtin_add_overflow
     (G.G)
     Add check_assign_user_ptr() macro and drop overflows_ptr() macro(Kees)
v11: Fix incorrect type assignment between different address spaces caused
     by the wrong use of __user macro. (kernel test robot)
     Update macro description (G.G)
v12: Remove overflows_type() macro here. updated overflows_type() macro
     will be added in a subsequent patch (G.G)

Signed-off-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Nirmoy Das <nirmoy.das@intel.com>
Cc: Jani Nikula <jani.nikula@intel.com>
Cc: Andi Shyti <andi.shyti@linux.intel.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Cc: Kees Cook <keescook@chromium.org>
Reviewed-by: Mauro Carvalho Chehab <mchehab@kernel.org> (v5)
Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com> (v9)
Acked-by: Kees Cook <keescook@chromium.org>
Reported-by: kernel test robot <lkp@intel.com>
---
 drivers/gpu/drm/i915/i915_user_extensions.c |  6 +--
 include/linux/overflow.h                    | 44 +++++++++++++++++++++
 2 files changed, 47 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_user_extensions.c b/drivers/gpu/drm/i915/i915_user_extensions.c
index c822d0aafd2d..80ec8390b0d8 100644
--- a/drivers/gpu/drm/i915/i915_user_extensions.c
+++ b/drivers/gpu/drm/i915/i915_user_extensions.c
@@ -50,11 +50,11 @@ int i915_user_extensions(struct i915_user_extension __user *ext,
 		if (err)
 			return err;
 
-		if (get_user(next, &ext->next_extension) ||
-		    overflows_type(next, ext))
+		if (get_user(next, &ext->next_extension))
 			return -EFAULT;
 
-		ext = u64_to_user_ptr(next);
+		if (check_assign_user_ptr(next, ext))
+			return -EFAULT;
 	}
 
 	return 0;
diff --git a/include/linux/overflow.h b/include/linux/overflow.h
index 19dfdd74835e..8ccbfa46f0ed 100644
--- a/include/linux/overflow.h
+++ b/include/linux/overflow.h
@@ -5,6 +5,7 @@
 #include <linux/compiler.h>
 #include <linux/limits.h>
 #include <linux/const.h>
+#include <linux/types.h>
 
 /*
  * We need to compute the minimum and maximum values representable in a given
@@ -127,6 +128,49 @@ static inline bool __must_check __must_check_overflow(bool overflow)
 	(*_d >> _to_shift) != _a);					\
 }))
 
+/**
+ * check_assign - perform an assigning source value into destination pointer
+ *                along with an overflow check.
+ *
+ * @value: source value
+ * @ptr: Destination pointer address
+ *
+ * Returns:
+ * If the value would overflow the destination, it returns true. If not return
+ * false. When overflow does not occur, the assigning into destination from
+ * value succeeds. It follows the return policy as other check_*_overflow()
+ * functions return non-zero as a failure.
+ */
+#define check_assign(value, ptr) __must_check_overflow(({	\
+	check_add_overflow(0, value, ptr);			\
+}))
+
+/**
+ * check_assign_user_ptr - perform an assigning source value into destination
+ *                         pointer type variable along with an overflow check
+ *
+ * @value: source value; a source value is expected to have a value of a size
+ *         that can be stored in a pointer-type variable.
+ * @ptr: destination pointer type variable
+ *
+ * u64_to_user_ptr can be used in the kernel to avoid warnings about integers
+ * and pointers of different sizes. But u64_to_user_ptr is not performing the
+ * checking of overflow. If you need an explicit overflow check while
+ * assigning, check_assign_user_ptr() can be used to assign integers into
+ * pointers along with an overflow check. If ptr is not a pointer type,
+ * a warning message outputs while compiling.
+ *
+ * Returns:
+ * If the value would overflow the destination, it returns true. If not return
+ * false. When overflow does not occur, the assigning into ptr from value
+ * succeeds. It follows the return policy as other check_*_overflow() functions
+ * return non-zero as a failure.
+ */
+#define check_assign_user_ptr(value, ptr) __must_check_overflow(({		\
+	uintptr_t kptr;								\
+	check_assign(value, &kptr) ? 1 : (({ ptr = (void __user *)kptr; }), 0);	\
+}))
+
 /**
  * size_mul() - Calculate size_t multiplication with saturation at SIZE_MAX
  *
-- 
2.37.1

