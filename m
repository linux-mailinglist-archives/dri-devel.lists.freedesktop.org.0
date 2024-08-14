Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 217D7951825
	for <lists+dri-devel@lfdr.de>; Wed, 14 Aug 2024 12:00:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39AD610E221;
	Wed, 14 Aug 2024 10:00:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cxiTa8MA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBEBE10E21D;
 Wed, 14 Aug 2024 10:00:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723629650; x=1755165650;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=+3bm3qAXRhIk14a/ZVhcXtY4VT/IWncFvTwGUHAz/Wk=;
 b=cxiTa8MAmuypfbKMcU4tuIaO0P0uILqcfggGHI4o8WrVJ1fKhYOLjmRv
 oPejx8Wq4hOGlm/ytuCuMd2o0ChWVJRdQYZ7vqnDY6motjZIWTbf+oi9j
 yVnuOar3kv9+bHmbJFMtRzas4MH73KnyVpsrrJJd1W9Qxm1VZWpPfXLRm
 W2foFWvuydei9W9MNLnlGguRS7iB8uOvLvyLdc5P4iUBYXoE3CerPCjq1
 9K49N8jbHsyFeG0D+IjS9tw/ezPdjeFUsTeGeL0HprExFaHUj1iyVgMCX
 aUBTCjfW/mgaGvYCGH/okyeN87yG5B29WcsHLOfVjygFtGkTtVbZoNzOk g==;
X-CSE-ConnectionGUID: T7TKO82TTEeOvdvj/jr24Q==
X-CSE-MsgGUID: ogW13fkKQdqBjrdn69jvFw==
X-IronPort-AV: E=McAfee;i="6700,10204,11163"; a="44355137"
X-IronPort-AV: E=Sophos;i="6.09,145,1716274800"; d="scan'208";a="44355137"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2024 03:00:49 -0700
X-CSE-ConnectionGUID: GONln07nRUaVUHd6sNRnTw==
X-CSE-MsgGUID: +qU923aYRgKL1ChpRIvXBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,145,1716274800"; d="scan'208";a="58922107"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.246.65])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2024 03:00:47 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, jani.nikula@intel.com,
 Kees Cook <keescook@chromium.org>, Andy Shevchenko <andy@kernel.org>
Subject: [PATCH v2 1/2] string: add mem_is_zero() helper to check if memory
 area is all zeros
Date: Wed, 14 Aug 2024 13:00:34 +0300
Message-Id: <20240814100035.3100852-1-jani.nikula@intel.com>
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
index 9edace076ddb..5855c5626b4b 100644
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

