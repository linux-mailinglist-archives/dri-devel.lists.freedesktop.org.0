Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D6C956AE312
	for <lists+dri-devel@lfdr.de>; Tue,  7 Mar 2023 15:47:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB4A910E4D0;
	Tue,  7 Mar 2023 14:47:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54F8410E4CF;
 Tue,  7 Mar 2023 14:47:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678200441; x=1709736441;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CRPgf1xKFHcWA658lNSuu7NuieJPDoSzR7ZpHSl0A/0=;
 b=ZYw/RT3V+B+7AcYIokAXsBG0OIDAPqmeEP2UQEcxyuqA5lawGSwJJCJj
 Elx2T/1pYKIgKE/5FIu6aotSCxG2KhegcdYDC97sbOF4aqXHAY4lcHXTS
 AtjLop9W4T9HEpCccvDQQyGr9mhea+EVn0ywMz3rSRbHzf153zUQR5Ec2
 h6Kbht/THoQJWuFGBSxGUyLxlOe0fXeZm9UcEOlpgmJ/wxyFNgoUxSEeV
 9Bk8ugYxuigBgcz0WhuirpEkWIkVckM+62Cp/JK+knck8Oskp33Ujt93/
 NugZi8vW294mNjNAtQHH5yPT8VXbeTtYYQNcNwVKCbKFrB4SxKQLIbGxy Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="400687279"
X-IronPort-AV: E=Sophos;i="5.98,241,1673942400"; d="scan'208";a="400687279"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2023 06:47:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="800414395"
X-IronPort-AV: E=Sophos;i="5.98,241,1673942400"; d="scan'208";a="800414395"
Received: from peiwangc-mobl1.ccr.corp.intel.com (HELO
 thellstr-mobl1.intel.com) ([10.249.254.10])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2023 06:47:19 -0800
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 3/7] drm/ttm: Use the BIT macro for the TTM_TT_FLAGs
Date: Tue,  7 Mar 2023 15:46:17 +0100
Message-Id: <20230307144621.10748-4-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230307144621.10748-1-thomas.hellstrom@linux.intel.com>
References: <20230307144621.10748-1-thomas.hellstrom@linux.intel.com>
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
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, Christian Koenig <christian.koenig@amd.com>,
 Matthew Auld <matthew.auld@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

New code is recommended to use the BIT macro instead of the explicit
shifts. Change the older defines so that we can keep the style consistent
with upcoming changes.

v2:
- Also change the value of the _PRIV_POPULATED bit (Christian König)

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 include/drm/ttm/ttm_tt.h | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/include/drm/ttm/ttm_tt.h b/include/drm/ttm/ttm_tt.h
index b7d3f3843f1e..977ca195a536 100644
--- a/include/drm/ttm/ttm_tt.h
+++ b/include/drm/ttm/ttm_tt.h
@@ -83,12 +83,12 @@ struct ttm_tt {
 	 * set by TTM after ttm_tt_populate() has successfully returned, and is
 	 * then unset when TTM calls ttm_tt_unpopulate().
 	 */
-#define TTM_TT_FLAG_SWAPPED		(1 << 0)
-#define TTM_TT_FLAG_ZERO_ALLOC		(1 << 1)
-#define TTM_TT_FLAG_EXTERNAL		(1 << 2)
-#define TTM_TT_FLAG_EXTERNAL_MAPPABLE	(1 << 3)
+#define TTM_TT_FLAG_SWAPPED		BIT(0)
+#define TTM_TT_FLAG_ZERO_ALLOC		BIT(1)
+#define TTM_TT_FLAG_EXTERNAL		BIT(2)
+#define TTM_TT_FLAG_EXTERNAL_MAPPABLE	BIT(3)
 
-#define TTM_TT_FLAG_PRIV_POPULATED  (1U << 31)
+#define TTM_TT_FLAG_PRIV_POPULATED	BIT(4)
 	uint32_t page_flags;
 	/** @num_pages: Number of pages in the page array. */
 	uint32_t num_pages;
-- 
2.39.2

