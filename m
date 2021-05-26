Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EF9C83919BA
	for <lists+dri-devel@lfdr.de>; Wed, 26 May 2021 16:16:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABEFD6ED87;
	Wed, 26 May 2021 14:15:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E34CA6ED24;
 Wed, 26 May 2021 14:15:39 +0000 (UTC)
IronPort-SDR: zpb1Pn0qt7YJfmDrjaruVgxHOsqMFMUDnv/oQBr1wmeuyNbzSJMveAAwu/F75+Tu1n0QPp+BcF
 eHr0AFADm4HA==
X-IronPort-AV: E=McAfee;i="6200,9189,9996"; a="223660660"
X-IronPort-AV: E=Sophos;i="5.82,331,1613462400"; d="scan'208";a="223660660"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2021 07:15:21 -0700
IronPort-SDR: Ztoq+FPS0EJtYKtUNXclkCJKRXubtn3d0hUDx1/5piivjpiiHnweFk8R94zPltXHtPtg/tCiVJ
 9qjiRLY3Daig==
X-IronPort-AV: E=Sophos;i="5.82,331,1613462400"; d="scan'208";a="547206445"
Received: from wardmich-mobl.ger.corp.intel.com (HELO tursulin-mobl2.home)
 ([10.213.209.181])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2021 07:15:20 -0700
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org
Subject: [PATCH 10/12] drm/i915/selftests: Replace an unbounded set-domain
 wait with a timeout
Date: Wed, 26 May 2021 15:14:54 +0100
Message-Id: <20210526141456.2334192-11-tvrtko.ursulin@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210526141456.2334192-1-tvrtko.ursulin@linux.intel.com>
References: <20210526141456.2334192-1-tvrtko.ursulin@linux.intel.com>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 Matthew Auld <matthew.auld@intel.com>, dri-devel@lists.freedesktop.org,
 Chris Wilson <chris@chris-wilson.co.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Chris Wilson <chris@chris-wilson.co.uk>

After the memory-region test completes, it flushes the test by calling
set-to-cpu-domain. Use the igt_flush_test as it includes a timeout,
recovery and reports and error for miscreant tests.

Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
---
 drivers/gpu/drm/i915/selftests/intel_memory_region.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/selftests/intel_memory_region.c b/drivers/gpu/drm/i915/selftests/intel_memory_region.c
index f85fd8cbfbf5..7a3f71e83140 100644
--- a/drivers/gpu/drm/i915/selftests/intel_memory_region.c
+++ b/drivers/gpu/drm/i915/selftests/intel_memory_region.c
@@ -826,11 +826,10 @@ static int igt_lmem_write_cpu(void *arg)
 	if (err)
 		goto out_unpin;
 
-	i915_gem_object_lock(obj, NULL);
-	err = i915_gem_object_set_to_wc_domain(obj, true);
-	i915_gem_object_unlock(obj);
-	if (err)
+	if (igt_flush_test(engine->i915)) {
+		err = -EIO;
 		goto out_unpin;
+	}
 
 	count = ARRAY_SIZE(bytes);
 	order = i915_random_order(count * count, &prng);
-- 
2.30.2

