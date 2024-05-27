Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 966B48CFD55
	for <lists+dri-devel@lfdr.de>; Mon, 27 May 2024 11:43:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FE7810F9DB;
	Mon, 27 May 2024 09:43:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NTd9Ovw7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0339510F9DA;
 Mon, 27 May 2024 09:43:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716803012; x=1748339012;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=V7W+PZvSNN60O9e3tJb1hk9bjQ3NW3P32Xw/JTV/pUQ=;
 b=NTd9Ovw7NLmfLq1ecFQNsFE/0AtFsx2+RCxV8ry2nU+D2e9fNiZl0ilX
 kzxnI673QTMZ9sChTpU0oElTDYiqaHCa1H1RCitDonYo2tIQWFhVZ1hUN
 UjVQ5ZXSB52tmcr1dFfknp+qTgoHfNv+SalOM4ehIy6Ctz8M2/oagYmou
 DHnGXKInJgiu5YktXSZWmB/cdCKJL81JxAP0T8bU/DWvZprZyvgi+mb4M
 4JT0WYDUD6ozZjWYYZ7m/80Ifww9DzFht2U3PizrBje6kpO2o693PN7iG
 GYpGrktKDEoujiWknNTMi526Ow81+PrIywLex+Ibq4AJmUI7TT7eAN3r0 g==;
X-CSE-ConnectionGUID: gu+GO2FdQY6CoX53UeLXFw==
X-CSE-MsgGUID: ggc55xGlQx2VGFrfuragOg==
X-IronPort-AV: E=McAfee;i="6600,9927,11084"; a="30621981"
X-IronPort-AV: E=Sophos;i="6.08,192,1712646000"; d="scan'208";a="30621981"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2024 02:43:31 -0700
X-CSE-ConnectionGUID: AwnyfvCXQgWn9JMdt8o7SA==
X-CSE-MsgGUID: YJPCK6WAQ8a7+D1XJxu9CA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,192,1712646000"; d="scan'208";a="35187606"
Received: from lfiedoro-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.246.200])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2024 02:43:28 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, jani.nikula@intel.com,
 Kees Cook <keescook@chromium.org>, Andy Shevchenko <andy@kernel.org>
Subject: [PATCH 1/2] string: add mem_is_zero() helper to check if memory area
 is all zeros
Date: Mon, 27 May 2024 12:43:19 +0300
Message-Id: <20240527094320.2653177-1-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Almost two thirds of the memchr_inv() usages check if the memory area is
all zeros, with no interest in where in the buffer the first non-zero
byte is located. Checking for !memchr_inv(s, 0, n) is also not very
intuitive or discoverable. Add an explicit mem_is_zero() helper for this
use case.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>

---

Cc: Kees Cook <keescook@chromium.org>
Cc: Andy Shevchenko <andy@kernel.org>
---
 include/linux/string.h | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/include/linux/string.h b/include/linux/string.h
index 60168aa2af07..3da305dab927 100644
--- a/include/linux/string.h
+++ b/include/linux/string.h
@@ -279,6 +279,18 @@ static inline void memcpy_flushcache(void *dst, const void *src, size_t cnt)
 void *memchr_inv(const void *s, int c, size_t n);
 char *strreplace(char *str, char old, char new);
 
+/**
+ * mem_is_zero - Check if an area of memory is all 0's.
+ * @s: The memory area
+ * @n: The size of the area
+ *
+ * Return: True if the area of memory is all 0's.
+ */
+static inline bool mem_is_zero(const void *s, size_t n)
+{
+	return !memchr_inv(s, 0, n);
+}
+
 extern void kfree_const(const void *x);
 
 extern char *kstrdup(const char *s, gfp_t gfp) __malloc;
-- 
2.39.2

