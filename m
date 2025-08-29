Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F901B3C200
	for <lists+dri-devel@lfdr.de>; Fri, 29 Aug 2025 19:46:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EA6C10EC1D;
	Fri, 29 Aug 2025 17:46:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jkvWDz1i";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5AF610EC1C;
 Fri, 29 Aug 2025 17:46:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756489582; x=1788025582;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=F+vDjpHX0nPQPXfZIZXWFZn3sfiMw9Otqkj/ZFDb4Yc=;
 b=jkvWDz1iw8v2PKr4t49vgTwXI30KCOVO1RraiTkPhsstzgZRkI9OSd0K
 mWIw8mW+ijO5lkF8WMmUaXBc0/ym52dQsw6/bAjhBnrzsiOcADl3WYobd
 81rnxb7lk1Pvo4/fzXj8pW5KulGmeVTOM5qTF6fm0rdK4KuzyoVi/F9pg
 6CaR5ALcxQmHKInE1MHPiC/avC/GQHvi5vlwxW5cpcTlztwdGh2sUn2ty
 cQElLu3PSn1Lm0Fo9vjH96ekwlFrfDrTo3ytsq2W02u+/Hg9ktsPdTVil
 2azpv8TrAjCBoSSLdKPRRA3Rm4fS4VpgBnEIeyDC9jVds3zbxTXpTR+sD A==;
X-CSE-ConnectionGUID: TCO5hCbPTcKR6iQAtUV9/g==
X-CSE-MsgGUID: QdMjHUBMQKyGZrFenoBlKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="58851392"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="58851392"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2025 10:46:22 -0700
X-CSE-ConnectionGUID: Ww1TxfqpSsWhnAjfT7raRg==
X-CSE-MsgGUID: OKPQqQP+Td2CnAwwDdpsrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; d="scan'208";a="175716541"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.58])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2025 10:46:19 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org, jani.nikula@intel.com,
 Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 linux-hardening@vger.kernel.org
Subject: [PATCH 2/3] drm/i915: document range_overflows() and
 range_end_overflows() macros
Date: Fri, 29 Aug 2025 20:46:00 +0300
Message-ID: <20250829174601.2163064-2-jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250829174601.2163064-1-jani.nikula@intel.com>
References: <20250829174601.2163064-1-jani.nikula@intel.com>
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

Document the macros in preparation for making them more generally
available.

Cc: Kees Cook <kees@kernel.org>
Cc: Gustavo A. R. Silva <gustavoars@kernel.org>
Cc: linux-hardening@vger.kernel.org
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/i915_utils.h | 46 +++++++++++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/drivers/gpu/drm/i915/i915_utils.h b/drivers/gpu/drm/i915/i915_utils.h
index fdac9a158b53..968dae941532 100644
--- a/drivers/gpu/drm/i915/i915_utils.h
+++ b/drivers/gpu/drm/i915/i915_utils.h
@@ -67,6 +67,18 @@ bool i915_error_injected(void);
 		drm_err(&(i915)->drm, fmt, ##__VA_ARGS__); \
 })
 
+/**
+ * range_overflows() - Check if a range is out of bounds
+ * @start: Start of the range.
+ * @size:  Size of the range.
+ * @max:   Exclusive upper boundary.
+ *
+ * A strict check to determine if the range [@start, @start + @size) is
+ * invalid with respect to the allowable range [0, @max). Any range
+ * starting at or beyond @max is considered an overflow, even if @size is 0.
+ *
+ * Returns: true if the range is out of bounds.
+ */
 #define range_overflows(start, size, max) ({ \
 	typeof(start) start__ = (start); \
 	typeof(size) size__ = (size); \
@@ -76,9 +88,32 @@ bool i915_error_injected(void);
 	start__ >= max__ || size__ > max__ - start__; \
 })
 
+/**
+ * range_overflows_t() - Check if a range is out of bounds
+ * @type:  Data type to use.
+ * @start: Start of the range.
+ * @size:  Size of the range.
+ * @max:   Exclusive upper boundary.
+ *
+ * Same as range_overflows() but forcing the parameters to @type.
+ *
+ * Returns: true if the range is out of bounds.
+ */
 #define range_overflows_t(type, start, size, max) \
 	range_overflows((type)(start), (type)(size), (type)(max))
 
+/**
+ * range_end_overflows() - Check if a range's endpoint is out of bounds
+ * @start: Start of the range.
+ * @size:  Size of the range.
+ * @max:   Exclusive upper boundary.
+ *
+ * Checks only if the endpoint of a range (@start + @size) exceeds @max.
+ * Unlike range_overflows(), a zero-sized range at the boundary (@start == @max)
+ * is not considered an overflow. Useful for iterator-style checks.
+ *
+ * Returns: true if the endpoint exceeds the boundary.
+ */
 #define range_end_overflows(start, size, max) ({ \
 	typeof(start) start__ = (start); \
 	typeof(size) size__ = (size); \
@@ -88,6 +123,17 @@ bool i915_error_injected(void);
 	start__ > max__ || size__ > max__ - start__; \
 })
 
+/**
+ * range_end_overflows_t() - Check if a range's endpoint is out of bounds
+ * @type:  Data type to use.
+ * @start: Start of the range.
+ * @size:  Size of the range.
+ * @max:   Exclusive upper boundary.
+ *
+ * Same as range_end_overflows() but forcing the parameters to @type.
+ *
+ * Returns: true if the endpoint exceeds the boundary.
+ */
 #define range_end_overflows_t(type, start, size, max) \
 	range_end_overflows((type)(start), (type)(size), (type)(max))
 
-- 
2.47.2

