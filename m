Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99EE9964A70
	for <lists+dri-devel@lfdr.de>; Thu, 29 Aug 2024 17:46:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D19210E708;
	Thu, 29 Aug 2024 15:46:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IQvP27/r";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0858010E708
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Aug 2024 15:46:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724946408; x=1756482408;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=KjcErCEgCmDjl43vjboJGBw0hPNn9Yt8aen+PL1k2vA=;
 b=IQvP27/rmafsmdLHtCitfBhOMfqbf7qxZvRzyz3PVwfYqNfSlLAsKQMw
 v3t9ikOf+QU7ZxO4FdR1eeQZ2m9pSQXM5NMd8LhAtElqT5n/6XtkU7mBh
 uIqOcmPmwrvX74YCLpKt3gg3lCz58/vlRHe/0AI/KOXb3w8F95IJdXOiH
 JKbFhMhhFT6Wu/PLTMV53HFHcO66SYqOdToiqZKx/ptXz/FVMOEueSpPZ
 572OddefSaKKTMh4pSYQrNsB0yBKSgZkC0drxyYfsNRnMneeH+DMw2OGZ
 mlpJbnBJLU+NF2DTK9DqYDE0AcPsrRLqiMFgzI9rjqcLYf3Pt7XeXtlLN Q==;
X-CSE-ConnectionGUID: giBkCOhVSYmwY8wh7JSlnw==
X-CSE-MsgGUID: p0Ca8++wR9C+3xQgJbghIA==
X-IronPort-AV: E=McAfee;i="6700,10204,11179"; a="34122433"
X-IronPort-AV: E=Sophos;i="6.10,186,1719903600"; d="scan'208";a="34122433"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2024 08:46:47 -0700
X-CSE-ConnectionGUID: hE6iAtNqSb2ZkFN3oIwmHA==
X-CSE-MsgGUID: PKjTB9JzRMiu/SdC9mViRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,186,1719903600"; d="scan'208";a="86845941"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmviesa002.fm.intel.com with ESMTP; 29 Aug 2024 08:46:45 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id 803C6610; Thu, 29 Aug 2024 18:46:44 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v1 1/1] drm/mm: Mark drm_mm_interval_tree*() functions with
 __maybe_unused
Date: Thu, 29 Aug 2024 18:46:40 +0300
Message-ID: <20240829154640.1120050-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The INTERVAL_TREE_DEFINE() uncoditionally provides a bunch of helper
functions which in some cases may be not used. This, in particular,
prevents kernel builds with `make W=1` and CONFIG_WERROR=y:

.../drm/drm_mm.c:152:1: error: unused function 'drm_mm_interval_tree_insert' [-Werror,-Wunused-function]
  152 | INTERVAL_TREE_DEFINE(struct drm_mm_node, rb,
      | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  153 |                      u64, __subtree_last,
      |                      ~~~~~~~~~~~~~~~~~~~~
  154 |                      START, LAST, static inline, drm_mm_interval_tree)
      |                      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Fix this by marking drm_mm_interval_tree*() functions with __maybe_unused.

Fixes: 202b52b7fbf7 ("drm: Track drm_mm nodes with an interval tree")
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpu/drm/drm_mm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_mm.c b/drivers/gpu/drm/drm_mm.c
index 5ace481c1901..1ed68d3cd80b 100644
--- a/drivers/gpu/drm/drm_mm.c
+++ b/drivers/gpu/drm/drm_mm.c
@@ -151,7 +151,7 @@ static void show_leaks(struct drm_mm *mm) { }
 
 INTERVAL_TREE_DEFINE(struct drm_mm_node, rb,
 		     u64, __subtree_last,
-		     START, LAST, static inline, drm_mm_interval_tree)
+		     START, LAST, static inline __maybe_unused, drm_mm_interval_tree)
 
 struct drm_mm_node *
 __drm_mm_interval_first(const struct drm_mm *mm, u64 start, u64 last)
-- 
2.43.0.rc1.1336.g36b5255a03ac

