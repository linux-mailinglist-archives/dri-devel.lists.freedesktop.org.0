Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A02B06FBE95
	for <lists+dri-devel@lfdr.de>; Tue,  9 May 2023 07:15:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8048B10E32B;
	Tue,  9 May 2023 05:14:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BB6210E1AE;
 Tue,  9 May 2023 05:14:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683609291; x=1715145291;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/zV+bBMFzqzEbY+zzFUi37/thW9CxZ9azFDevSUQdV0=;
 b=EJ0ErFeEMyLQqq7fhYPEDJ3JavD+UZ6nsYN0jo+wFtG/8j9vC3B4qCKO
 q5eDVBBu88+Jn7ei73QVeKL0UglOiHpHGEFoUa974ZbJS5fO/EdV9nAgW
 280en2mHw28wbh+QE5u/23rPriVgzNbyd9UA8ZV1VUhBYJrFR+EG8FcMO
 i6SdvdGPFADoE6YEQu9W2MvfPYPmmLjvuAKzdyOMfdCX+kqkFN0A2gz2h
 mvVYNCDhydf6CT+21fdBcPsddhaSuDunot18XTHOH9eIQ7LFcZBO2R9WI
 5Y5QHRshjhU9vmvjMEdYyyOveH+wMY6As8YuqyuB+bWkmPCnIJhMSkXlv A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="339037125"
X-IronPort-AV: E=Sophos;i="5.99,261,1677571200"; d="scan'208";a="339037125"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2023 22:14:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="873033256"
X-IronPort-AV: E=Sophos;i="5.99,261,1677571200"; d="scan'208";a="873033256"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2023 22:14:45 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH 3/3] drm/i915: Temporary conversion to new GENMASK/BIT macros
Date: Mon,  8 May 2023 22:14:03 -0700
Message-Id: <20230509051403.2748545-4-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230509051403.2748545-1-lucas.demarchi@intel.com>
References: <20230509051403.2748545-1-lucas.demarchi@intel.com>
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
Cc: Masahiro Yamada <masahiroy@kernel.org>,
 Kevin Brodsky <kevin.brodsky@arm.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, linux-kernel@vger.kernel.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Andrew Morton <akpm@linux-foundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Convert the REG_* macros from i915_reg_defs.h to use the new macros
defined in linux/bits.h. This is just to help on the implementation
of the new macros and not intended to be applied.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/i915/i915_reg_defs.h | 28 +++++-----------------------
 1 file changed, 5 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_reg_defs.h b/drivers/gpu/drm/i915/i915_reg_defs.h
index 622d603080f9..61fbb8d62b25 100644
--- a/drivers/gpu/drm/i915/i915_reg_defs.h
+++ b/drivers/gpu/drm/i915/i915_reg_defs.h
@@ -17,10 +17,7 @@
  *
  * @return: Value with bit @__n set.
  */
-#define REG_BIT(__n)							\
-	((u32)(BIT(__n) +						\
-	       BUILD_BUG_ON_ZERO(__is_constexpr(__n) &&		\
-				 ((__n) < 0 || (__n) > 31))))
+#define REG_BIT(__n) BIT_U32(__n)
 
 /**
  * REG_BIT8() - Prepare a u8 bit value
@@ -30,10 +27,7 @@
  *
  * @return: Value with bit @__n set.
  */
-#define REG_BIT8(__n)                                                   \
-	((u8)(BIT(__n) +                                                \
-	       BUILD_BUG_ON_ZERO(__is_constexpr(__n) &&         \
-				 ((__n) < 0 || (__n) > 7))))
+#define REG_BIT8(__n) BIT_U8(__n)
 
 /**
  * REG_GENMASK() - Prepare a continuous u32 bitmask
@@ -44,11 +38,7 @@
  *
  * @return: Continuous bitmask from @__high to @__low, inclusive.
  */
-#define REG_GENMASK(__high, __low)					\
-	((u32)(GENMASK(__high, __low) +					\
-	       BUILD_BUG_ON_ZERO(__is_constexpr(__high) &&	\
-				 __is_constexpr(__low) &&		\
-				 ((__low) < 0 || (__high) > 31 || (__low) > (__high)))))
+#define REG_GENMASK(__high, __low) GENMASK_U32(__high, __low)
 
 /**
  * REG_GENMASK64() - Prepare a continuous u64 bitmask
@@ -59,11 +49,7 @@
  *
  * @return: Continuous bitmask from @__high to @__low, inclusive.
  */
-#define REG_GENMASK64(__high, __low)					\
-	((u64)(GENMASK_ULL(__high, __low) +				\
-	       BUILD_BUG_ON_ZERO(__is_constexpr(__high) &&		\
-				 __is_constexpr(__low) &&		\
-				 ((__low) < 0 || (__high) > 63 || (__low) > (__high)))))
+#define REG_GENMASK64(__high, __low) GENMASK_ULL(__high, __low)
 
 /**
  * REG_GENMASK8() - Prepare a continuous u8 bitmask
@@ -74,11 +60,7 @@
  *
  * @return: Continuous bitmask from @__high to @__low, inclusive.
  */
-#define REG_GENMASK8(__high, __low)                                     \
-	((u8)(GENMASK(__high, __low) +                                  \
-	       BUILD_BUG_ON_ZERO(__is_constexpr(__high) &&      \
-				 __is_constexpr(__low) &&               \
-				 ((__low) < 0 || (__high) > 7 || (__low) > (__high)))))
+#define REG_GENMASK8(__high, __low) GENMASK_U8(__high, __low)
 
 /*
  * Local integer constant expression version of is_power_of_2().
-- 
2.40.1

