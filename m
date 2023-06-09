Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 96C12729935
	for <lists+dri-devel@lfdr.de>; Fri,  9 Jun 2023 14:12:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 282EA10E6A6;
	Fri,  9 Jun 2023 12:11:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75B7110E6A4;
 Fri,  9 Jun 2023 12:11:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686312713; x=1717848713;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=k2u68uLaytbU9h5AePwzc9VLikp1n7IigFMkwxC4lR0=;
 b=kmiiAVvpVoqiMHKsN0nNX3uKNKg4dgWrOwAQzJoAJjoTTiQR/Qip0aSN
 QXWONBO91/30SiR8oGl2gnSPy/L8MF6ir2xzcpCoX3WwXJk1o8gE/fTKk
 W7WS3mTcT+YzoBhPU+O+VmRAmVym7XQnSqHB6SwTaRB0VDDazS8gxycwu
 +9xsuueiBYV4nHrQk/2nyXjAl8JbtE1cVAE/VyNCAKUKWITD+pUIsRe/S
 DJ4/WJ/YhqzBboay4u2EJRPi2Zza41+2TXxnKBsCDLinK7yIRhch1eoag
 ItiKJEDmtafmPm7nPYG55CZ4e783JKHogF7GZfzoidUfm5e/AbjUGdQBC g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10735"; a="356474742"
X-IronPort-AV: E=Sophos;i="6.00,229,1681196400"; d="scan'208";a="356474742"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2023 05:11:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10735"; a="740150834"
X-IronPort-AV: E=Sophos;i="6.00,229,1681196400"; d="scan'208";a="740150834"
Received: from pjdillon-mobl1.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.213.210.241])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2023 05:11:51 -0700
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 1/8] dma-fence: Bypass signaling annotation from
 dma_fence_is_signaled
Date: Fri,  9 Jun 2023 13:11:36 +0100
Message-Id: <20230609121143.1232420-2-tvrtko.ursulin@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230609121143.1232420-1-tvrtko.ursulin@linux.intel.com>
References: <20230609121143.1232420-1-tvrtko.ursulin@linux.intel.com>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

For dma_fence_is_signaled signaling critical path annotations are an
annoying cause of false positives when using dma_fence_is_signaled and
indirectly higher level helpers such as dma_resv_test_signaled etc.

Drop the critical path annotation since the "is signaled" API does not
guarantee to ever change the signaled status anyway.

We do that by adding a low level _dma_fence_signal helper and use it from
dma_fence_is_signaled.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 drivers/dma-buf/dma-fence.c | 26 ++++++++++++++++++++------
 include/linux/dma-fence.h   |  3 ++-
 2 files changed, 22 insertions(+), 7 deletions(-)

diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
index f177c56269bb..f216a189a755 100644
--- a/drivers/dma-buf/dma-fence.c
+++ b/drivers/dma-buf/dma-fence.c
@@ -444,6 +444,25 @@ int dma_fence_signal_locked(struct dma_fence *fence)
 }
 EXPORT_SYMBOL(dma_fence_signal_locked);
 
+/**
+ * _dma_fence_signal - signal completion of a fence bypassing critical section annotation
+ * @fence: the fence to signal
+ *
+ * This low-level helper should not be used by code external to dma-fence.h|c!
+ */
+int _dma_fence_signal(struct dma_fence *fence)
+{
+	unsigned long flags;
+	int ret;
+
+	spin_lock_irqsave(fence->lock, flags);
+	ret = dma_fence_signal_timestamp_locked(fence, ktime_get());
+	spin_unlock_irqrestore(fence->lock, flags);
+
+	return ret;
+}
+EXPORT_SYMBOL(_dma_fence_signal);
+
 /**
  * dma_fence_signal - signal completion of a fence
  * @fence: the fence to signal
@@ -459,7 +478,6 @@ EXPORT_SYMBOL(dma_fence_signal_locked);
  */
 int dma_fence_signal(struct dma_fence *fence)
 {
-	unsigned long flags;
 	int ret;
 	bool tmp;
 
@@ -467,11 +485,7 @@ int dma_fence_signal(struct dma_fence *fence)
 		return -EINVAL;
 
 	tmp = dma_fence_begin_signalling();
-
-	spin_lock_irqsave(fence->lock, flags);
-	ret = dma_fence_signal_timestamp_locked(fence, ktime_get());
-	spin_unlock_irqrestore(fence->lock, flags);
-
+	ret = _dma_fence_signal(fence);
 	dma_fence_end_signalling(tmp);
 
 	return ret;
diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
index d54b595a0fe0..d94768ad70e4 100644
--- a/include/linux/dma-fence.h
+++ b/include/linux/dma-fence.h
@@ -387,6 +387,7 @@ static inline void dma_fence_end_signalling(bool cookie) {}
 static inline void __dma_fence_might_wait(void) {}
 #endif
 
+int _dma_fence_signal(struct dma_fence *fence);
 int dma_fence_signal(struct dma_fence *fence);
 int dma_fence_signal_locked(struct dma_fence *fence);
 int dma_fence_signal_timestamp(struct dma_fence *fence, ktime_t timestamp);
@@ -452,7 +453,7 @@ dma_fence_is_signaled(struct dma_fence *fence)
 		return true;
 
 	if (fence->ops->signaled && fence->ops->signaled(fence)) {
-		dma_fence_signal(fence);
+		_dma_fence_signal(fence);
 		return true;
 	}
 
-- 
2.39.2

