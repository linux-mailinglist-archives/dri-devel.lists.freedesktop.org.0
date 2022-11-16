Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A016262BBB3
	for <lists+dri-devel@lfdr.de>; Wed, 16 Nov 2022 12:26:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BCDB10E484;
	Wed, 16 Nov 2022 11:26:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 590D510E478;
 Wed, 16 Nov 2022 11:25:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668597959; x=1700133959;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9RcXpzp2jK/yGykS8Id+3Adle5bDDZsqw2k/4otRQ+w=;
 b=Aak3nyx/lvitfD+PFJua77MWakygiEvAnBggRrUCAy0V4PAPZS6kY5lC
 ZK5kwCTHUJKJ/n0lrg3Tbf+YW55Vt4nZjoPYqs994CXsT/eoNaypB0sGb
 nIYxSt3Yoym5u1IcX3yNAQtTlkqmv30LlVkgzZp4ccV3zOaXE+93bCEVD
 iJNCEGMFzHvWFMbEYaDqiDQi1IGRLaNCrZU0PlyiZFYnkS2o4BqhjIgXx
 ai+G2pr3w0UUd6VveKtWoE9El0TWZjYClG8nELf/UKg8zouFyaH3BfPNe
 cjjM/wfwwGecNpPYpJqH7ozE9Vxyy8sDnghpTyC28ATOwp//3aT44j2qW g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10532"; a="295885150"
X-IronPort-AV: E=Sophos;i="5.96,167,1665471600"; d="scan'208";a="295885150"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2022 03:25:59 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10532"; a="670468932"
X-IronPort-AV: E=Sophos;i="5.96,167,1665471600"; d="scan'208";a="670468932"
Received: from jkrzyszt-mobl1.ger.corp.intel.com ([10.213.12.208])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2022 03:25:56 -0800
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Subject: [PATCH 1/3] drm/i915: Fix negative remaining time after retire
 requests
Date: Wed, 16 Nov 2022 12:25:30 +0100
Message-Id: <20221116112532.36253-2-janusz.krzysztofik@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221116112532.36253-1-janusz.krzysztofik@linux.intel.com>
References: <20221116112532.36253-1-janusz.krzysztofik@linux.intel.com>
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
Cc: Matthew Brost <matthew.brost@intel.com>, intel-gfx@lists.freedesktop.org,
 Chris Wilson <chris.p.wilson@intel.com>, dri-devel@lists.freedesktop.org,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 John Harrison <John.C.Harrison@Intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Commit b97060a99b01 ("drm/i915/guc: Update intel_gt_wait_for_idle to work
with GuC") extended the API of intel_gt_retire_requests_timeout() with an
extra argument 'remaining_timeout', intended for passing back unconsumed
portion of requested timeout when 0 (success) is returned.  However, when
request retirement happens to succeed despite an error returned by
dma_fence_wait_timeout(), the error code (a negative value) is passed back
instead of remaining time.  If a user then passes that negative value
forward as requested timeout to another wait, an explicit WARN or BUG can
be triggered.

Instead of copying the value of timeout variable to *remaining_timeout
before return, update the *remaining_timeout after each DMA fence wait.
Set it to 0 on -ETIME, -EINTR or -ERESTARTSYS, and assume no time has been
consumed on other errors returned from the wait.

Fixes: b97060a99b01 ("drm/i915/guc: Update intel_gt_wait_for_idle to work with GuC")
Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Cc: stable@vger.kernel.org # v5.15+
---
 drivers/gpu/drm/i915/gt/intel_gt_requests.c | 23 ++++++++++++++++++---
 1 file changed, 20 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_gt_requests.c b/drivers/gpu/drm/i915/gt/intel_gt_requests.c
index edb881d756309..ccaf2fd80625b 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_requests.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt_requests.c
@@ -138,6 +138,9 @@ long intel_gt_retire_requests_timeout(struct intel_gt *gt, long timeout,
 	unsigned long active_count = 0;
 	LIST_HEAD(free);
 
+	if (remaining_timeout)
+		*remaining_timeout = timeout;
+
 	flush_submission(gt, timeout); /* kick the ksoftirqd tasklets */
 	spin_lock(&timelines->lock);
 	list_for_each_entry_safe(tl, tn, &timelines->active_list, link) {
@@ -163,6 +166,23 @@ long intel_gt_retire_requests_timeout(struct intel_gt *gt, long timeout,
 								 timeout);
 				dma_fence_put(fence);
 
+				if (remaining_timeout) {
+					/*
+					 * If we get an error here but request
+					 * retirement succeeds anyway
+					 * (!active_count) and we return 0, the
+					 * caller may want to spend remaining
+					 * time on waiting for other events.
+					 */
+					if (timeout == -ETIME ||
+					    timeout == -EINTR ||
+					    timeout == -ERESTARTSYS)
+						*remaining_timeout = 0;
+					else if (timeout >= 0)
+						*remaining_timeout = timeout;
+					/* else assume no time consumed */
+				}
+
 				/* Retirement is best effort */
 				if (!mutex_trylock(&tl->mutex)) {
 					active_count++;
@@ -196,9 +216,6 @@ out_active:	spin_lock(&timelines->lock);
 	if (flush_submission(gt, timeout)) /* Wait, there's more! */
 		active_count++;
 
-	if (remaining_timeout)
-		*remaining_timeout = timeout;
-
 	return active_count ? timeout : 0;
 }
 
-- 
2.25.1

