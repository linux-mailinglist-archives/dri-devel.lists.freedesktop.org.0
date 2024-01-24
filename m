Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EDFF283A0E1
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jan 2024 06:03:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DABC010F627;
	Wed, 24 Jan 2024 05:02:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B212A10F61E;
 Wed, 24 Jan 2024 05:02:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706072550; x=1737608550;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ThgMTkix4es6j5rky2OKrHCglG8hdtZ/YRFkq6PjGxQ=;
 b=K2hOH1ehA6oHW6gPDBMHPNQRBnH4CFETqjnA+v7muKb0YL4C5bGgAB/c
 Z+eq9N77u3fyzcPhUFjPAFxVYEnTNSzUJt8A9OLisIUjkBSii16/gJnlX
 oGMTMoiXNhfKEtAAD3HhJx2km/ZCfBxpgvE/3RLwkBtlIcf9M+y/kK1Uj
 9tWbl3RoMTxrEn8qkgwNoa2stCcB2ceu2+oLdKLsocRM4iut3aMfQcOXQ
 Kaf3YnHT5imPhe77x8LpqLBJc/Ktir+/d6gWTiICOAImAvYUlToWjHT47
 G+MSLKGe8gjQciL54Vae7dP6cMPVpUTQV6THvZv1lw98/mwpvx/iHFQrO A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="401399358"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; d="scan'208";a="401399358"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2024 21:02:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="909551509"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; d="scan'208";a="909551509"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2024 21:02:23 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Yury Norov <yury.norov@gmail.com>
Subject: [PATCH 2/3] bits: Introduce fixed-type BIT
Date: Tue, 23 Jan 2024 21:02:04 -0800
Message-ID: <20240124050205.3646390-3-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240124050205.3646390-1-lucas.demarchi@intel.com>
References: <20240124050205.3646390-1-lucas.demarchi@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, Lucas De Marchi <lucas.demarchi@intel.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 intel-xe@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Implement fixed-type BIT() to help drivers add stricter checks, like was
done for GENMASK.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 include/linux/bits.h | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/include/linux/bits.h b/include/linux/bits.h
index cb94128171b2..5754a1251078 100644
--- a/include/linux/bits.h
+++ b/include/linux/bits.h
@@ -24,12 +24,16 @@
 #define GENMASK_INPUT_CHECK(h, l) \
 	(BUILD_BUG_ON_ZERO(__builtin_choose_expr( \
 		__is_constexpr((l) > (h)), (l) > (h), 0)))
+#define BIT_INPUT_CHECK(type, b) \
+	((BUILD_BUG_ON_ZERO(__builtin_choose_expr( \
+		__is_constexpr(b), (b) >= BITS_PER_TYPE(type), 0))))
 #else
 /*
  * BUILD_BUG_ON_ZERO is not available in h files included from asm files,
  * disable the input check if that is the case.
  */
 #define GENMASK_INPUT_CHECK(h, l) 0
+#define BIT_INPUT_CHECK(type, b) 0
 #endif
 
 #define __GENMASK(t, h, l) \
@@ -44,4 +48,9 @@
 #define GENMASK_U32(h, l)	__GENMASK(u32, h, l)
 #define GENMASK_U64(h, l)	__GENMASK(u64, h, l)
 
+#define BIT_U8(b)		((u8)(BIT_INPUT_CHECK(u8, b) + BIT(b)))
+#define BIT_U16(b)		((u16)(BIT_INPUT_CHECK(u16, b) + BIT(b)))
+#define BIT_U32(b)		((u32)(BIT_INPUT_CHECK(u32, b) + BIT(b)))
+#define BIT_U64(b)		((u64)(BIT_INPUT_CHECK(u64, b) + BIT(b)))
+
 #endif	/* __LINUX_BITS_H */
-- 
2.43.0

