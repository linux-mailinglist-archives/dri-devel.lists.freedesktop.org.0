Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 08EDB6D0185
	for <lists+dri-devel@lfdr.de>; Thu, 30 Mar 2023 12:43:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2532110EDA3;
	Thu, 30 Mar 2023 10:43:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 135C110EDAA;
 Thu, 30 Mar 2023 10:43:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680173014; x=1711709014;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=iwNGwoGN+a9lCmnr/S987s6PbvaC/3YLfUXCi5FqKd8=;
 b=Cw8NRigOA7YqNN42FwH4y7P486xudgbazPqXXk5IHftV05+HkP8hQJc/
 2QLayJuSj3fq5t8eymsQJH7H4W5tnPpsPd4Za5cq4SlJkgnT2O1oLEu/L
 p0PqZKAQ8nd83PbNDzSHB6SQgA0snPsPWnjRp8T2hWVp8KbkCK/7xj/xP
 S5zyNgKUjxnjITxy8tIBVsZ1tznQsdRddc85BLzKJSjRaKLAuqJ0x5un9
 gUDQYQ9AJa0lU1+iAAEO2HWBHC20XqzcZeSaJxgUgzgnQHyUkD2RtHOOx
 ikkaBsY8p+nszldAqL+WlE63WgSHfcTlQpGA/7Mk5ymOJeSlkqv2g251W g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="321517760"
X-IronPort-AV: E=Sophos;i="5.98,303,1673942400"; d="scan'208";a="321517760"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2023 03:43:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="661951481"
X-IronPort-AV: E=Sophos;i="5.98,303,1673942400"; d="scan'208";a="661951481"
Received: from unknown (HELO localhost) ([10.237.66.160])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2023 03:43:31 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 3/4] log2: allow use of is_power_of_2() in constant expressions
Date: Thu, 30 Mar 2023 13:42:42 +0300
Message-Id: <20230330104243.2120761-4-jani.nikula@intel.com>
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

Even though the static inline functions are __attribute__((const)) you
can't use them in constant expressions. Make is_power_of_2() a constant
expression if possible.

Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Christian König <christian.koenig@amd.com>
Cc: David Gow <davidgow@google.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 include/linux/log2.h | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/include/linux/log2.h b/include/linux/log2.h
index 4027d1eecd7f..447a85102de0 100644
--- a/include/linux/log2.h
+++ b/include/linux/log2.h
@@ -56,9 +56,11 @@ bool __is_power_of_2(unsigned long n)
  * Return: true if @n is a power of 2, otherwise false.
  */
 #define is_power_of_2(n)						\
-	__builtin_choose_expr(sizeof(n) > sizeof(unsigned long),	\
-			      __is_power_of_2_ull(n),			\
-			      __is_power_of_2(n))
+	__builtin_choose_expr(__is_constexpr(n),			\
+			      __IS_POWER_OF_2(n),			\
+			      __builtin_choose_expr(sizeof(n) > sizeof(unsigned long), \
+						    __is_power_of_2_ull(n), \
+						    __is_power_of_2(n)))
 
 /**
  * __roundup_pow_of_two() - round up to nearest power of two
-- 
2.39.2

