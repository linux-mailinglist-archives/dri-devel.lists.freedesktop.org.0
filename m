Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2362B6ADC59
	for <lists+dri-devel@lfdr.de>; Tue,  7 Mar 2023 11:49:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83F5A10E49A;
	Tue,  7 Mar 2023 10:48:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8378310E478;
 Tue,  7 Mar 2023 10:48:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678186125; x=1709722125;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HtfxNZ6V0OO/oxYVWnwzHilLqxmn1cFyQg7zcTM8kRg=;
 b=bTnFPl0gPFccIYAQbzDoHc69oiXjabwGF6UKF3D5tLHiJV0ZVHheBd9u
 AkNKhiQxsj4UNsCC39Obq4eExAf/RTl0knPE1CiZvn9ScRpRO4o0W+UFT
 O0c/MveJSP7rcZ8fKeVlbVtuJIXW35Gq1Q3DjJfRiXp6/TuoQglNTyAln
 DKAo6qqDHhVQW56qZ8uJB2O+i+zJxb9dnbEP39M5aAvaVJ11lHlCJPR9j
 02GE6c//nFJKreUduHDJeC2NCoHXNFa8S805+8RKK4xowva+a4D3XuKS3
 E/wc1TKzm4LPib0woYxgehvxyQVO7f65Fae4crHqCwqJ1blMmWAiGJTSj Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="400643441"
X-IronPort-AV: E=Sophos;i="5.98,240,1673942400"; d="scan'208";a="400643441"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2023 02:48:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="819712889"
X-IronPort-AV: E=Sophos;i="5.98,240,1673942400"; d="scan'208";a="819712889"
Received: from tanzeelu-mobl1.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.213.205.53])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2023 02:48:43 -0800
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [RFC 07/12] dma-fence-array: Propagate wait status to contained fences
Date: Tue,  7 Mar 2023 10:48:19 +0000
Message-Id: <20230307104824.231094-8-tvrtko.ursulin@linux.intel.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230307104824.231094-1-tvrtko.ursulin@linux.intel.com>
References: <20230307104824.231094-1-tvrtko.ursulin@linux.intel.com>
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
Cc: Matt Turner <mattst88@gmail.com>, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

As signaling is enabled on the container fence we need to propagate any
external waiting status to individual fences in order to enable owning
drivers see it.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
---
 drivers/dma-buf/dma-fence-array.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/dma-buf/dma-fence-array.c b/drivers/dma-buf/dma-fence-array.c
index 5c8a7084577b..e732adc230d1 100644
--- a/drivers/dma-buf/dma-fence-array.c
+++ b/drivers/dma-buf/dma-fence-array.c
@@ -84,8 +84,9 @@ static bool dma_fence_array_enable_signaling(struct dma_fence *fence)
 		 * insufficient).
 		 */
 		dma_fence_get(&array->base);
-		if (dma_fence_add_callback(array->fences[i], &cb[i].cb,
-					   dma_fence_array_cb_func)) {
+		if (__dma_fence_add_callback(array->fences[i], &cb[i].cb,
+					     dma_fence_array_cb_func,
+					     fence->waitcount > 0)) {
 			int error = array->fences[i]->error;
 
 			dma_fence_array_set_pending_error(array, error);
-- 
2.37.2

