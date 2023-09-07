Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DC58797272
	for <lists+dri-devel@lfdr.de>; Thu,  7 Sep 2023 14:58:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E5CC10E23B;
	Thu,  7 Sep 2023 12:58:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13C2410E23B;
 Thu,  7 Sep 2023 12:58:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694091503; x=1725627503;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=j51BA7kqQudn8G5lUWbaJjY6jJgEDW/RLjDQ4gNes2M=;
 b=Lx/kglrmz0QCe0hXpwLRVNG0Zjvky1I9dvKQXuZ5hmFgkUaCYRP3iEVv
 +a8lABxFrFKoOmnLjtgZOSS54aDrFrnTBgHC0tRLE+mV2cx0ZXuHx92os
 vrJO8LEnN4FN29FRe9KHd29N2bp1qdBylo4TP+A8R/2kY3fiaFZykllTE
 7Ho/07FQx5MMiM/ZE7AUieFCwnndu0vXvkkDE64eTk7kbJ1XH4fM5TwF8
 wXno8gXbwAjxBcI7ixIwxI0EQVNxLned5auWXska3iebQxYsawtRz2ggQ
 U11QxJuE3ipmv4FP+VMioLk6J04hTp3KrN34wmeJz+mZWhPmdJ0jeYNaL w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="408344282"
X-IronPort-AV: E=Sophos;i="6.02,235,1688454000"; d="scan'208";a="408344282"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2023 05:58:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="915719773"
X-IronPort-AV: E=Sophos;i="6.02,235,1688454000"; d="scan'208";a="915719773"
Received: from mmalyshx-mobl.ger.corp.intel.com (HELO intel.com)
 ([10.252.35.13])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2023 05:58:20 -0700
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>
Subject: [PATCH v3] drm/i915: Run relevant bits of debugfs drop_caches per GT
Date: Thu,  7 Sep 2023 14:58:08 +0200
Message-Id: <20230907125808.186088-1-andi.shyti@linux.intel.com>
X-Mailer: git-send-email 2.40.1
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
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Walk all GTs when doing the respective bits of drop_caches work.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
---
Hi,

I'm proposing this new version of the series I sent here[*].
Patch 1 from that series is not necessary so taht I'm going to
propose the original version proposed by Tvrtko when we were
young.

Andi

Changelog
=========
v2 -> v3:
 - fix the "for_each_gt()" parameter order.
v1 -> v2:
 - drop the gt idling and the cache flushing decoupling and stick
   to the original version.

[*] https://patchwork.freedesktop.org/series/123301/

 drivers/gpu/drm/i915/i915_debugfs.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_debugfs.c b/drivers/gpu/drm/i915/i915_debugfs.c
index 7a90a2e32c9f1..e9b79c2c37d84 100644
--- a/drivers/gpu/drm/i915/i915_debugfs.c
+++ b/drivers/gpu/drm/i915/i915_debugfs.c
@@ -740,15 +740,19 @@ static int
 i915_drop_caches_set(void *data, u64 val)
 {
 	struct drm_i915_private *i915 = data;
+	struct intel_gt *gt;
 	unsigned int flags;
+	unsigned int i;
 	int ret;
 
 	drm_dbg(&i915->drm, "Dropping caches: 0x%08llx [0x%08llx]\n",
 		val, val & DROP_ALL);
 
-	ret = gt_drop_caches(to_gt(i915), val);
-	if (ret)
-		return ret;
+	for_each_gt(gt, i915, i) {
+		ret = gt_drop_caches(gt, val);
+		if (ret)
+			return ret;
+	}
 
 	fs_reclaim_acquire(GFP_KERNEL);
 	flags = memalloc_noreclaim_save();
-- 
2.40.1

