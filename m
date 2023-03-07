Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE9B16ADC55
	for <lists+dri-devel@lfdr.de>; Tue,  7 Mar 2023 11:49:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2172C10E488;
	Tue,  7 Mar 2023 10:48:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3D3810E478;
 Tue,  7 Mar 2023 10:48:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678186124; x=1709722124;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8Mu1PYjGW2s/WLRmT/+xzjXgFhwKvONBND9x8er3acQ=;
 b=h1scpi6dMS1Jzv08XIP9zELCqcNe5uivsrwe1z639S+7n7rn1b8rmh8M
 ieIhMHQFgIBdHSedPxYKu/FhZBrT+XeYf7HAzkmavmR/OcyqNmVgNv2Rn
 O86K8IMj2HZC2qMDgYRwZQYS8jGTnmRIn1onsUSHnaqcCp7vjgFP2jMfr
 0TLLkWeuQ+fBQ6iVkdKKFh+m+EGBCx0XOunscDczKYe4dPJA4cFga8/St
 w6/Ihrl80PkcfeboEIJYr+AelnOdazh3ETKSuzkPSpR8rKtDSN+RhXNXe
 cgLpv+LOD5gf5usrrvMslvefPLSbDQc5W8YdcvbIfsJPkoHyX0bFVwTRa A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="400643434"
X-IronPort-AV: E=Sophos;i="5.98,240,1673942400"; d="scan'208";a="400643434"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2023 02:48:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="819712871"
X-IronPort-AV: E=Sophos;i="5.98,240,1673942400"; d="scan'208";a="819712871"
Received: from tanzeelu-mobl1.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.213.205.53])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2023 02:48:41 -0800
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [RFC 06/12] dma-fence: Export __dma_fence_add_callback
Date: Tue,  7 Mar 2023 10:48:18 +0000
Message-Id: <20230307104824.231094-7-tvrtko.ursulin@linux.intel.com>
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

...

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
---
 drivers/dma-buf/dma-fence.c | 9 +++++----
 include/linux/dma-fence.h   | 3 +++
 2 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
index bdba5a8e21b1..5607acdb6ccf 100644
--- a/drivers/dma-buf/dma-fence.c
+++ b/drivers/dma-buf/dma-fence.c
@@ -656,8 +656,8 @@ void dma_fence_enable_sw_signaling(struct dma_fence *fence)
 }
 EXPORT_SYMBOL(dma_fence_enable_sw_signaling);
 
-static int add_callback(struct dma_fence *fence, struct dma_fence_cb *cb,
-			dma_fence_func_t func, bool wait)
+int __dma_fence_add_callback(struct dma_fence *fence, struct dma_fence_cb *cb,
+			     dma_fence_func_t func, bool wait)
 {
 	unsigned long flags;
 	int ret = 0;
@@ -686,6 +686,7 @@ static int add_callback(struct dma_fence *fence, struct dma_fence_cb *cb,
 
 	return ret;
 }
+EXPORT_SYMBOL(__dma_fence_add_callback);
 
 /**
  * dma_fence_add_callback - add a callback to be called when the fence
@@ -712,7 +713,7 @@ static int add_callback(struct dma_fence *fence, struct dma_fence_cb *cb,
 int dma_fence_add_callback(struct dma_fence *fence, struct dma_fence_cb *cb,
 			   dma_fence_func_t func)
 {
-	return add_callback(fence, cb, func, false);
+	return __dma_fence_add_callback(fence, cb, func, false);
 }
 EXPORT_SYMBOL(dma_fence_add_callback);
 
@@ -720,7 +721,7 @@ int dma_fence_add_wait_callback(struct dma_fence *fence,
 				struct dma_fence_cb *cb,
 				dma_fence_func_t func)
 {
-	return add_callback(fence, cb, func, true);
+	return __dma_fence_add_callback(fence, cb, func, true);
 }
 EXPORT_SYMBOL(dma_fence_add_wait_callback);
 
diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
index 2b696f9de276..1f41d60ce6f7 100644
--- a/include/linux/dma-fence.h
+++ b/include/linux/dma-fence.h
@@ -384,6 +384,9 @@ int dma_fence_signal_timestamp_locked(struct dma_fence *fence,
 				      ktime_t timestamp);
 signed long dma_fence_default_wait(struct dma_fence *fence,
 				   bool intr, signed long timeout);
+int __dma_fence_add_callback(struct dma_fence *fence,
+			     struct dma_fence_cb *cb,
+			     dma_fence_func_t func, bool wait);
 int dma_fence_add_callback(struct dma_fence *fence,
 			   struct dma_fence_cb *cb,
 			   dma_fence_func_t func);
-- 
2.37.2

