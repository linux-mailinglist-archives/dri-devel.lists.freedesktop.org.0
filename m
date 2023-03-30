Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D052D6D0188
	for <lists+dri-devel@lfdr.de>; Thu, 30 Mar 2023 12:43:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85C4310E1FE;
	Thu, 30 Mar 2023 10:43:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A1AE10E1FE;
 Thu, 30 Mar 2023 10:43:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680173018; x=1711709018;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=GqcGwxyn7j7iLNNmU5/jcjr9hX502H2AgCkR+SUtUOU=;
 b=SD5LNcgrSzvNtPEYb8/jLE5lRo1uZdZWqVYAKtieJagduAeK+XsbudLK
 c0qsZobJaOc21Lt6iK/qhiupEX+ntCh36TmrZjyrEdPyHtjKpZToi9Muc
 vic7sKEAoIdVfXtG4bubfFEBIX8OrpvMLeghginG9iajr8Z6DX+z7ce2T
 3O4HvS2xO1815w9tFm4s7z2LUeIcgHTdZqLwPUMrV4yQWKX4jKyYqVtyw
 DSeETKdZ0sselsEAlHLUNv/QS2VkbXjPHzwEowka8BHZhw5pUndh06Bpe
 AtV6SUqd44QG33DrZnF9jZNzrbowRdytEWKkIrpdRBrfbdaHeNtZVX0A4 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="321517781"
X-IronPort-AV: E=Sophos;i="5.98,303,1673942400"; d="scan'208";a="321517781"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2023 03:43:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="661951495"
X-IronPort-AV: E=Sophos;i="5.98,303,1673942400"; d="scan'208";a="661951495"
Received: from unknown (HELO localhost) ([10.237.66.160])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2023 03:43:35 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 4/4] drm/i915/reg: use is_power_of_2() from log2.h
Date: Thu, 30 Mar 2023 13:42:43 +0300
Message-Id: <20230330104243.2120761-5-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230330104243.2120761-1-jani.nikula@intel.com>
References: <20230330104243.2120761-1-jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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
Cc: jani.nikula@intel.com, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, David Gow <davidgow@google.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Now that log2.h is_power_of_2() supports constant expressions, use it.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/i915_reg_defs.h | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_reg_defs.h b/drivers/gpu/drm/i915/i915_reg_defs.h
index be43580a6979..44e99a9a381f 100644
--- a/drivers/gpu/drm/i915/i915_reg_defs.h
+++ b/drivers/gpu/drm/i915/i915_reg_defs.h
@@ -52,11 +52,6 @@
 				 __is_constexpr(__low) &&		\
 				 ((__low) < 0 || (__high) > 63 || (__low) > (__high)))))
 
-/*
- * Local integer constant expression version of is_power_of_2().
- */
-#define IS_POWER_OF_2(__x)		((__x) && (((__x) & ((__x) - 1)) == 0))
-
 /**
  * REG_FIELD_PREP() - Prepare a u32 bitfield value
  * @__mask: shifted mask defining the field's length and position
@@ -71,7 +66,7 @@
 	((u32)((((typeof(__mask))(__val) << __bf_shf(__mask)) & (__mask)) +	\
 	       BUILD_BUG_ON_ZERO(!__is_constexpr(__mask)) +		\
 	       BUILD_BUG_ON_ZERO((__mask) == 0 || (__mask) > U32_MAX) +		\
-	       BUILD_BUG_ON_ZERO(!IS_POWER_OF_2((__mask) + (1ULL << __bf_shf(__mask)))) + \
+	       BUILD_BUG_ON_ZERO(!is_power_of_2((__mask) + (1ULL << __bf_shf(__mask)))) + \
 	       BUILD_BUG_ON_ZERO(__builtin_choose_expr(__is_constexpr(__val), (~((__mask) >> __bf_shf(__mask)) & (__val)), 0))))
 
 /**
-- 
2.39.2

