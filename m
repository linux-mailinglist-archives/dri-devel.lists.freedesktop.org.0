Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C8B9C6D0182
	for <lists+dri-devel@lfdr.de>; Thu, 30 Mar 2023 12:43:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54CEC10EDB8;
	Thu, 30 Mar 2023 10:43:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEC6B10E208;
 Thu, 30 Mar 2023 10:43:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680173008; x=1711709008;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CDN8ZE/1vjjcivVa5naMdgZ0tYuSIPBlqDkTp4fXFOE=;
 b=LX6PrKnKVL8xkZzJLAA+f6mI7z0dj+c1K0wgBzJX9CWRZ6a8uaNcuHI5
 iCmZPmJXwt463U0dq6Yo/08ig5/i8njWEgqNJ4sb6MiHA3GwHmEc4Zagc
 nPhAR8d9bIO+o27U21oHvo5LnEZl5xCl+pnRfNimuIER07PbKifpu+0he
 dCh4zJzn9rArGjgs7ANfc7Q3mKDvMBHxkRoxiFjugnCt8ZGMFv6/HVnH5
 iSDgbaKMCYdGWiM3RcbOiPZVPCLdKawEbLUpUhbiy5OvgMSQNB02qPxep
 qLoBFeAYfswMRQ56GVBrEzKeRLLJcmY2s67Tq/5XO8/Vzz6Wtm/zKCUeT g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="406096371"
X-IronPort-AV: E=Sophos;i="5.98,303,1673942400"; d="scan'208";a="406096371"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2023 03:43:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="687197245"
X-IronPort-AV: E=Sophos;i="5.98,303,1673942400"; d="scan'208";a="687197245"
Received: from unknown (HELO localhost) ([10.237.66.160])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2023 03:43:26 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 2/4] log2: have is_power_of_2() support bigger types than
 unsigned long
Date: Thu, 30 Mar 2023 13:42:41 +0300
Message-Id: <20230330104243.2120761-3-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230330104243.2120761-1-jani.nikula@intel.com>
References: <20230330104243.2120761-1-jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

is_power_of_2() does not work properly for e.g. u64 in 32-bit
builds. Choose an unsigned long long version if the argument is bigger
than unsigned long.

Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Christian König <christian.koenig@amd.com>
Cc: David Gow <davidgow@google.com>
Link: https://lore.kernel.org/r/20230329065532.2122295-2-davidgow@google.com
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 include/linux/log2.h | 21 ++++++++++++++++-----
 1 file changed, 16 insertions(+), 5 deletions(-)

diff --git a/include/linux/log2.h b/include/linux/log2.h
index 19e773116ae3..4027d1eecd7f 100644
--- a/include/linux/log2.h
+++ b/include/linux/log2.h
@@ -35,6 +35,18 @@ int __ilog2_u64(u64 n)
 
 #define __IS_POWER_OF_2(n) ((n) != 0 && (((n) & ((n) - 1)) == 0))
 
+static inline __attribute__((const))
+bool __is_power_of_2_ull(unsigned long long n)
+{
+	return __IS_POWER_OF_2(n);
+}
+
+static inline __attribute__((const))
+bool __is_power_of_2(unsigned long n)
+{
+	return __IS_POWER_OF_2(n);
+}
+
 /**
  * is_power_of_2() - check if a value is a power of two
  * @n: the value to check
@@ -43,11 +55,10 @@ int __ilog2_u64(u64 n)
  * *not* considered a power of two.
  * Return: true if @n is a power of 2, otherwise false.
  */
-static inline __attribute__((const))
-bool is_power_of_2(unsigned long n)
-{
-	return __IS_POWER_OF_2(n);
-}
+#define is_power_of_2(n)						\
+	__builtin_choose_expr(sizeof(n) > sizeof(unsigned long),	\
+			      __is_power_of_2_ull(n),			\
+			      __is_power_of_2(n))
 
 /**
  * __roundup_pow_of_two() - round up to nearest power of two
-- 
2.39.2

