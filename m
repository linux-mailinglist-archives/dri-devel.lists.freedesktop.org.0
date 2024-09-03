Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF0A796A57B
	for <lists+dri-devel@lfdr.de>; Tue,  3 Sep 2024 19:35:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43F8010E05A;
	Tue,  3 Sep 2024 17:35:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HO7SRGxz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 573F210E05A
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Sep 2024 17:35:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725384910; x=1756920910;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=O8h218KSYzFJ7ytdusPeiz4McpB/2x8TF2/ID7soWz8=;
 b=HO7SRGxzbZp0i87bAa4fNyDnyS5jdBJaXwN4zL3hadX4d6TCJWKlyE5W
 NHZeNi4d7XwO9bA2AXHsiF1XwIgbif4OSGqVNEJcXlvM6+ihUydlM6bLw
 hf3fDLG6zw9u4GgpevT9yIImpOd7qvVufWruMHAcOMJ42HGYSLGjjjTqr
 r7942abC2j08TVbi4716A2Q28iDHqRIQvwJ1cCYMv4CIw7nW/vjd76qar
 bv5RKuDb6Y5eSU+i3r7WO3LMsjcJ35fIWv15xA8gE958CbCDwhZsAG3Yh
 ooVkwUPkZwEGsKhDtvqZO/OLeAgKM20wW9MVKnKE6DTqtBwK/B5wXpMYL A==;
X-CSE-ConnectionGUID: x0TKXKnKTdOa4Nrc+6Nu4g==
X-CSE-MsgGUID: I696AF0gRVykrWqUWfa/Dg==
X-IronPort-AV: E=McAfee;i="6700,10204,11184"; a="46528580"
X-IronPort-AV: E=Sophos;i="6.10,199,1719903600"; d="scan'208";a="46528580"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2024 10:35:09 -0700
X-CSE-ConnectionGUID: mkdkZB6pQea5sqJ442/vaQ==
X-CSE-MsgGUID: BGcdTzdGQkWy1P1YXpX1GA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,199,1719903600"; d="scan'208";a="69845336"
Received: from sschumil-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.148])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2024 10:35:08 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: Jani Nikula <jani.nikula@intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH] drm/mm: annotate drm_mm_node_scanned_block() with
 __maybe_unused
Date: Tue,  3 Sep 2024 20:34:37 +0300
Message-Id: <20240903173437.3212437-1-jani.nikula@intel.com>
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

Clang build with CONFIG_DRM_DEBUG_MM=n, CONFIG_WERROR=y, and W=1 leads
to:

  CC [M]  drivers/gpu/drm/drm_mm.o
../drivers/gpu/drm/drm_mm.c:614:20: error: function 'drm_mm_node_scanned_block' is not needed and will not be emitted [-Werror,-Wunneeded-internal-declaration]
static inline bool drm_mm_node_scanned_block(const struct drm_mm_node *node)
                   ^

Fix this by annotating drm_mm_node_scanned_block() with __maybe_unused.

Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_mm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_mm.c b/drivers/gpu/drm/drm_mm.c
index 1ed68d3cd80b..ca254611b382 100644
--- a/drivers/gpu/drm/drm_mm.c
+++ b/drivers/gpu/drm/drm_mm.c
@@ -611,7 +611,7 @@ int drm_mm_insert_node_in_range(struct drm_mm * const mm,
 }
 EXPORT_SYMBOL(drm_mm_insert_node_in_range);
 
-static inline bool drm_mm_node_scanned_block(const struct drm_mm_node *node)
+static inline __maybe_unused bool drm_mm_node_scanned_block(const struct drm_mm_node *node)
 {
 	return test_bit(DRM_MM_NODE_SCANNED_BIT, &node->flags);
 }
-- 
2.39.2

