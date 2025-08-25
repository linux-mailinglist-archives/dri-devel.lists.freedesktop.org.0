Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9AAAB33AAD
	for <lists+dri-devel@lfdr.de>; Mon, 25 Aug 2025 11:22:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DB2710E35C;
	Mon, 25 Aug 2025 09:22:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="ZCtt8+aF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com
 [209.85.128.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6A6410E35C
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 09:22:18 +0000 (UTC)
Received: by mail-wm1-f74.google.com with SMTP id
 5b1f17b1804b1-45b51baec92so9513455e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 02:22:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1756113737; x=1756718537;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=DxpyDWEEiXC8RbtTxDFHInIMZ/KB0uS5wOH557bgda8=;
 b=ZCtt8+aF3Ky24PU6sYJjAGecQw93LLgRR9h3R7yy1Ui05aWBT6PZNd4N7Z7KbkFeC8
 2PSqZcuH72DNy+Ybni3DA2Zterv6za/0EEq7L2u2xy85xPrRgAerBofDlI+mNT4woDSJ
 vPlXH7T8TEpaNBZYPDf5VMQQIHTjbnWWGzH0jOCs9u/3xsGf5bmSGARtAdyhPAxOOg51
 Nq0rUHIkAxG461aiAunV2imTyVnbw8aOiWcS3EIG9ImbNCkfLzflMXJ/SX3WOwXVABuT
 kXY3rsFH5dWiZXP4wCVJd6/36EXTGKT2UTHjMK1cA4VHpdYriX5K6jGfxyQHkr1EhpvV
 0+9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756113737; x=1756718537;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=DxpyDWEEiXC8RbtTxDFHInIMZ/KB0uS5wOH557bgda8=;
 b=dmbtOVha2bmwlY8tLKFiQ5UmQ9fMLvBxdggNs6EVG2FP4BZTCIur4Ebic0T7A8/Dr4
 S6Hq3knqjvP/6H4MIQCfqqLKEaZ574SYvmm6yHnEbUHHS20cc3HQ5gGU9Z5Au9ljllc8
 4x14fwOn3Ey5QMFCQ/PMTyWPw5Hmv+eP/JsHC95HrnXwoWlbNuE1RLHLrp3wW2MjFbL5
 ejQtvIud97SSV9ah1he4rliycLoObrI4WV4MPN+sMsyFk1XVjNgkhr2PJlYO6lT9EUex
 oeODkIDWBb2y+e9QIh9cHx75hwg5ft80W+IupBeqeJkEzZpgkl5UOP8x1Uqmhbf7P9mK
 8tag==
X-Gm-Message-State: AOJu0YwEpphQA9of01IBCV/szsQTCCU6XmsjjxVBQGJVeUJzRf/3UXww
 c2Cxm9di5Un0Rx/6fqTpm1OXpv7wbX/ul/+a5Ut/Cr6yS8jFjZOdoVtGaspL//MhkolHi6Nt0ny
 a5rVphhWaXPlB+tw0Lg==
X-Google-Smtp-Source: AGHT+IEsD7hEieOB0TZ/iZJGtI2HZhSYiwy5rAQ58zAxezg1OxYBcPYv1yDzkWSHxlrD2I4lXOtswTBTXEy4QYo=
X-Received: from wmga3.prod.google.com ([2002:a05:600c:2d43:b0:459:db87:c332])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4f03:b0:43c:f44c:72a6 with SMTP id
 5b1f17b1804b1-45b5daacd8bmr31737785e9.2.1756113736699; 
 Mon, 25 Aug 2025 02:22:16 -0700 (PDT)
Date: Mon, 25 Aug 2025 09:22:09 +0000
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAEArrGgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDCyMT3fSC0rJc3ZLKgnzdtMwK3WTDFHODREvz5DTzRCWgpoKiVKAw2MD
 o2NpaAGiZScZgAAAA
X-Change-Id: 20250824-gpuvm-typo-fix-c1d70a97cf7a
X-Developer-Key: i=aliceryhl@google.com; a=openpgp;
 fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=16753; i=aliceryhl@google.com; 
 h=from:subject:message-id;
 bh=tmSXeUMYd1y7I6Cud0Np8R2ZmALbpzeie/4wsApA4kQ=; 
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBorCtDpx3oOOh+EcHwwwc+ynTWChjdTjspYcPkk
 uII9Vq9lz2JAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaKwrQwAKCRAEWL7uWMY5
 RmbKD/wNdXcuRl0xcL+s/LWAJM+G8yYL5hkYC+2SvwjApshMidDUToWKTbru87JYNW8qj2phK5Q
 DXmNBOuD+9QieZUtPvHRsPwmPRSJ6jd3CmrhdYL9ASVIVcBXIg5O0vUSu42BcWH6F1EQLWwdXUS
 d0/8h1Y5urEIiDuzl/dOEJ1zcOVVUErx3Ki5HSRRImv3nJRXGmkCSBZHcAujJoPmOXrqBQUsKi3
 /AQzcDByQH8F2mwW5/oIbJ7rsT+94Rpw8UUJGKJOd7JgTFNHMnM4qoY2n2/cvPWVtL83rq4WUV9
 +G93t/5/gH6DVj+aZFQHz52jw51tSCq2clo/OjnjK1YdRKfwfyafYUpfIl0Y2cJt7RfG4BeRXzO
 ZiPxHcotNlwGF5YXdil9JU5FDu9YgzdaK4VYjpIEMY0AhFKZGAKCeEpw9bXT+jJuuRfBlMlUfbb
 LY4AiN2ZUS9l9EkeZWsF1ozX3xKz7DY7C7z22M/VI3vi1mRgNQUEgD07NFU9uRLCW8Mixao42OR
 59eQg7NKYIh3hgbyMfZVVdR33LJ1SSeGswAM2D21Xbu7YDH5ceqqb/swZu0c2BdSo+2bmDrL3tB
 hf7/88B93gucne9B0sN7o+htiSARCmOLqMUz+ob6FECT3c16q5nR/ICqC/Ge9BMNKnp+rEojzFw
 UMKXtv9KsxwLluQ==
X-Mailer: b4 0.14.2
Message-ID: <20250825-gpuvm-typo-fix-v1-1-14e9e78e28e6@google.com>
Subject: [PATCH] drm/gpuvm: fix various typos in .c and .h gpuvm file
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>, Matthew Brost <matthew.brost@intel.com>,
 "=?utf-8?q?Thomas_Hellstr=C3=B6m?=" <thomas.hellstrom@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"
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

After working with this code for a while, I came across several typos.
This patch fixes them.

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 drivers/gpu/drm/drm_gpuvm.c | 80 ++++++++++++++++++++++-----------------------
 include/drm/drm_gpuvm.h     | 10 +++---
 2 files changed, 45 insertions(+), 45 deletions(-)

diff --git a/drivers/gpu/drm/drm_gpuvm.c b/drivers/gpu/drm/drm_gpuvm.c
index d6bea8a4fffd7613fb9b9ed5c795df373da2e7b6..098cc6be1c8273a36178dbd08fafcba87c3338ec 100644
--- a/drivers/gpu/drm/drm_gpuvm.c
+++ b/drivers/gpu/drm/drm_gpuvm.c
@@ -40,7 +40,7 @@
  * mapping's backing &drm_gem_object buffers.
  *
  * &drm_gem_object buffers maintain a list of &drm_gpuva objects representing
- * all existent GPU VA mappings using this &drm_gem_object as backing buffer.
+ * all existing GPU VA mappings using this &drm_gem_object as backing buffer.
  *
  * GPU VAs can be flagged as sparse, such that drivers may use GPU VAs to also
  * keep track of sparse PTEs in order to support Vulkan 'Sparse Resources'.
@@ -72,7 +72,7 @@
  * but it can also be a 'dummy' object, which can be allocated with
  * drm_gpuvm_resv_object_alloc().
  *
- * In order to connect a struct drm_gpuva its backing &drm_gem_object each
+ * In order to connect a struct drm_gpuva to its backing &drm_gem_object each
  * &drm_gem_object maintains a list of &drm_gpuvm_bo structures, and each
  * &drm_gpuvm_bo contains a list of &drm_gpuva structures.
  *
@@ -81,7 +81,7 @@
  * This is ensured by the API through drm_gpuvm_bo_obtain() and
  * drm_gpuvm_bo_obtain_prealloc() which first look into the corresponding
  * &drm_gem_object list of &drm_gpuvm_bos for an existing instance of this
- * particular combination. If not existent a new instance is created and linked
+ * particular combination. If not present, a new instance is created and linked
  * to the &drm_gem_object.
  *
  * &drm_gpuvm_bo structures, since unique for a given &drm_gpuvm, are also used
@@ -108,7 +108,7 @@
  * sequence of operations to satisfy a given map or unmap request.
  *
  * Therefore the DRM GPU VA manager provides an algorithm implementing splitting
- * and merging of existent GPU VA mappings with the ones that are requested to
+ * and merging of existing GPU VA mappings with the ones that are requested to
  * be mapped or unmapped. This feature is required by the Vulkan API to
  * implement Vulkan 'Sparse Memory Bindings' - drivers UAPIs often refer to this
  * as VM BIND.
@@ -119,7 +119,7 @@
  * execute in order to integrate the new mapping cleanly into the current state
  * of the GPU VA space.
  *
- * Depending on how the new GPU VA mapping intersects with the existent mappings
+ * Depending on how the new GPU VA mapping intersects with the existing mappings
  * of the GPU VA space the &drm_gpuvm_ops callbacks contain an arbitrary amount
  * of unmap operations, a maximum of two remap operations and a single map
  * operation. The caller might receive no callback at all if no operation is
@@ -139,16 +139,16 @@
  * one unmap operation and one or two map operations, such that drivers can
  * derive the page table update delta accordingly.
  *
- * Note that there can't be more than two existent mappings to split up, one at
+ * Note that there can't be more than two existing mappings to split up, one at
  * the beginning and one at the end of the new mapping, hence there is a
  * maximum of two remap operations.
  *
  * Analogous to drm_gpuvm_sm_map() drm_gpuvm_sm_unmap() uses &drm_gpuvm_ops to
  * call back into the driver in order to unmap a range of GPU VA space. The
- * logic behind this function is way simpler though: For all existent mappings
+ * logic behind this function is way simpler though: For all existing mappings
  * enclosed by the given range unmap operations are created. For mappings which
- * are only partically located within the given range, remap operations are
- * created such that those mappings are split up and re-mapped partically.
+ * are only partially located within the given range, remap operations are
+ * created such that those mappings are split up and re-mapped partially.
  *
  * As an alternative to drm_gpuvm_sm_map() and drm_gpuvm_sm_unmap(),
  * drm_gpuvm_sm_map_ops_create() and drm_gpuvm_sm_unmap_ops_create() can be used
@@ -168,7 +168,7 @@
  * provided helper functions drm_gpuva_map(), drm_gpuva_remap() and
  * drm_gpuva_unmap() instead.
  *
- * The following diagram depicts the basic relationships of existent GPU VA
+ * The following diagram depicts the basic relationships of existing GPU VA
  * mappings, a newly requested mapping and the resulting mappings as implemented
  * by drm_gpuvm_sm_map() - it doesn't cover any arbitrary combinations of these.
  *
@@ -218,7 +218,7 @@
  *
  *
  * 4) Existent mapping is a left aligned subset of the requested one, hence
- *    replace the existent one.
+ *    replace the existing one.
  *
  *    ::
  *
@@ -236,9 +236,9 @@
  *       and/or non-contiguous BO offset.
  *
  *
- * 5) Requested mapping's range is a left aligned subset of the existent one,
+ * 5) Requested mapping's range is a left aligned subset of the existing one,
  *    but backed by a different BO. Hence, map the requested mapping and split
- *    the existent one adjusting its BO offset.
+ *    the existing one adjusting its BO offset.
  *
  *    ::
  *
@@ -271,9 +271,9 @@
  *	new: |-----|-----| (a.bo_offset=n, a'.bo_offset=n+1)
  *
  *
- * 7) Requested mapping's range is a right aligned subset of the existent one,
+ * 7) Requested mapping's range is a right aligned subset of the existing one,
  *    but backed by a different BO. Hence, map the requested mapping and split
- *    the existent one, without adjusting the BO offset.
+ *    the existing one, without adjusting the BO offset.
  *
  *    ::
  *
@@ -304,7 +304,7 @@
  *
  * 9) Existent mapping is overlapped at the end by the requested mapping backed
  *    by a different BO. Hence, map the requested mapping and split up the
- *    existent one, without adjusting the BO offset.
+ *    existing one, without adjusting the BO offset.
  *
  *    ::
  *
@@ -334,9 +334,9 @@
  *	 new: |-----|-----------| (a'.bo_offset=n, a.bo_offset=n+1)
  *
  *
- * 11) Requested mapping's range is a centered subset of the existent one
+ * 11) Requested mapping's range is a centered subset of the existing one
  *     having a different backing BO. Hence, map the requested mapping and split
- *     up the existent one in two mappings, adjusting the BO offset of the right
+ *     up the existing one in two mappings, adjusting the BO offset of the right
  *     one accordingly.
  *
  *     ::
@@ -351,7 +351,7 @@
  *	 new: |-----|-----|-----| (a.bo_offset=n,b.bo_offset=m,a'.bo_offset=n+2)
  *
  *
- * 12) Requested mapping is a contiguous subset of the existent one. Split it
+ * 12) Requested mapping is a contiguous subset of the existing one. Split it
  *     up, but indicate that the backing PTEs could be kept.
  *
  *     ::
@@ -367,7 +367,7 @@
  *
  *
  * 13) Existent mapping is a right aligned subset of the requested one, hence
- *     replace the existent one.
+ *     replace the existing one.
  *
  *     ::
  *
@@ -386,7 +386,7 @@
  *
  *
  * 14) Existent mapping is a centered subset of the requested one, hence
- *     replace the existent one.
+ *     replace the existing one.
  *
  *     ::
  *
@@ -406,7 +406,7 @@
  *
  * 15) Existent mappings is overlapped at the beginning by the requested mapping
  *     backed by a different BO. Hence, map the requested mapping and split up
- *     the existent one, adjusting its BO offset accordingly.
+ *     the existing one, adjusting its BO offset accordingly.
  *
  *     ::
  *
@@ -534,8 +534,8 @@
  * make use of them.
  *
  * The below code is strictly limited to illustrate the generic usage pattern.
- * To maintain simplicitly, it doesn't make use of any abstractions for common
- * code, different (asyncronous) stages with fence signalling critical paths,
+ * To maintain simplicity, it doesn't make use of any abstractions for common
+ * code, different (asynchronous) stages with fence signalling critical paths,
  * any other helpers or error handling in terms of freeing memory and dropping
  * previously taken locks.
  *
@@ -544,7 +544,7 @@
  *	// Allocates a new &drm_gpuva.
  *	struct drm_gpuva * driver_gpuva_alloc(void);
  *
- *	// Typically drivers would embedd the &drm_gpuvm and &drm_gpuva
+ *	// Typically drivers would embed the &drm_gpuvm and &drm_gpuva
  *	// structure in individual driver structures and lock the dma-resv with
  *	// drm_exec or similar helpers.
  *	int driver_mapping_create(struct drm_gpuvm *gpuvm,
@@ -652,7 +652,7 @@
  *		.sm_step_unmap = driver_gpuva_unmap,
  *	};
  *
- *	// Typically drivers would embedd the &drm_gpuvm and &drm_gpuva
+ *	// Typically drivers would embed the &drm_gpuvm and &drm_gpuva
  *	// structure in individual driver structures and lock the dma-resv with
  *	// drm_exec or similar helpers.
  *	int driver_mapping_create(struct drm_gpuvm *gpuvm,
@@ -750,7 +750,7 @@
  *
  * This helper is here to provide lockless list iteration. Lockless as in, the
  * iterator releases the lock immediately after picking the first element from
- * the list, so list insertion deletion can happen concurrently.
+ * the list, so list insertion and deletion can happen concurrently.
  *
  * Elements popped from the original list are kept in a local list, so removal
  * and is_empty checks can still happen while we're iterating the list.
@@ -1230,7 +1230,7 @@ drm_gpuvm_prepare_objects_locked(struct drm_gpuvm *gpuvm,
 }
 
 /**
- * drm_gpuvm_prepare_objects() - prepare all assoiciated BOs
+ * drm_gpuvm_prepare_objects() - prepare all associated BOs
  * @gpuvm: the &drm_gpuvm
  * @exec: the &drm_exec locking context
  * @num_fences: the amount of &dma_fences to reserve
@@ -1300,13 +1300,13 @@ drm_gpuvm_prepare_range(struct drm_gpuvm *gpuvm, struct drm_exec *exec,
 EXPORT_SYMBOL_GPL(drm_gpuvm_prepare_range);
 
 /**
- * drm_gpuvm_exec_lock() - lock all dma-resv of all assoiciated BOs
+ * drm_gpuvm_exec_lock() - lock all dma-resv of all associated BOs
  * @vm_exec: the &drm_gpuvm_exec wrapper
  *
  * Acquires all dma-resv locks of all &drm_gem_objects the given
  * &drm_gpuvm contains mappings of.
  *
- * Addionally, when calling this function with struct drm_gpuvm_exec::extra
+ * Additionally, when calling this function with struct drm_gpuvm_exec::extra
  * being set the driver receives the given @fn callback to lock additional
  * dma-resv in the context of the &drm_gpuvm_exec instance. Typically, drivers
  * would call drm_exec_prepare_obj() from within this callback.
@@ -1363,7 +1363,7 @@ fn_lock_array(struct drm_gpuvm_exec *vm_exec)
 }
 
 /**
- * drm_gpuvm_exec_lock_array() - lock all dma-resv of all assoiciated BOs
+ * drm_gpuvm_exec_lock_array() - lock all dma-resv of all associated BOs
  * @vm_exec: the &drm_gpuvm_exec wrapper
  * @objs: additional &drm_gem_objects to lock
  * @num_objs: the number of additional &drm_gem_objects to lock
@@ -1658,7 +1658,7 @@ drm_gpuvm_bo_find(struct drm_gpuvm *gpuvm,
 EXPORT_SYMBOL_GPL(drm_gpuvm_bo_find);
 
 /**
- * drm_gpuvm_bo_obtain() - obtains and instance of the &drm_gpuvm_bo for the
+ * drm_gpuvm_bo_obtain() - obtains an instance of the &drm_gpuvm_bo for the
  * given &drm_gpuvm and &drm_gem_object
  * @gpuvm: The &drm_gpuvm the @obj is mapped in.
  * @obj: The &drm_gem_object being mapped in the @gpuvm.
@@ -1694,7 +1694,7 @@ drm_gpuvm_bo_obtain(struct drm_gpuvm *gpuvm,
 EXPORT_SYMBOL_GPL(drm_gpuvm_bo_obtain);
 
 /**
- * drm_gpuvm_bo_obtain_prealloc() - obtains and instance of the &drm_gpuvm_bo
+ * drm_gpuvm_bo_obtain_prealloc() - obtains an instance of the &drm_gpuvm_bo
  * for the given &drm_gpuvm and &drm_gem_object
  * @__vm_bo: A pre-allocated struct drm_gpuvm_bo.
  *
@@ -1758,7 +1758,7 @@ EXPORT_SYMBOL_GPL(drm_gpuvm_bo_extobj_add);
  * @vm_bo: the &drm_gpuvm_bo to add or remove
  * @evict: indicates whether the object is evicted
  *
- * Adds a &drm_gpuvm_bo to or removes it from the &drm_gpuvms evicted list.
+ * Adds a &drm_gpuvm_bo to or removes it from the &drm_gpuvm's evicted list.
  */
 void
 drm_gpuvm_bo_evict(struct drm_gpuvm_bo *vm_bo, bool evict)
@@ -1860,7 +1860,7 @@ __drm_gpuva_remove(struct drm_gpuva *va)
  * drm_gpuva_remove() - remove a &drm_gpuva
  * @va: the &drm_gpuva to remove
  *
- * This removes the given &va from the underlaying tree.
+ * This removes the given &va from the underlying tree.
  *
  * It is safe to use this function using the safe versions of iterating the GPU
  * VA space, such as drm_gpuvm_for_each_va_safe() and
@@ -2464,7 +2464,7 @@ EXPORT_SYMBOL_GPL(drm_gpuvm_sm_map);
  *
  * This function iterates the given range of the GPU VA space. It utilizes the
  * &drm_gpuvm_ops to call back into the driver providing the operations to
- * unmap and, if required, split existent mappings.
+ * unmap and, if required, split existing mappings.
  *
  * Drivers may use these callbacks to update the GPU VA space right away within
  * the callback. In case the driver decides to copy and store the operations for
@@ -2574,7 +2574,7 @@ static const struct drm_gpuvm_ops lock_ops = {
  *    required without the earlier DRIVER_OP_MAP.  This is safe because we've
  *    already locked the GEM object in the earlier DRIVER_OP_MAP step.
  *
- * Returns: 0 on success or a negative error codec
+ * Returns: 0 on success or a negative error code
  */
 int
 drm_gpuvm_sm_map_exec_lock(struct drm_gpuvm *gpuvm,
@@ -2746,12 +2746,12 @@ __drm_gpuvm_sm_map_ops_create(struct drm_gpuvm *gpuvm,
  * @req: map request arguments
  *
  * This function creates a list of operations to perform splitting and merging
- * of existent mapping(s) with the newly requested one.
+ * of existing mapping(s) with the newly requested one.
  *
  * The list can be iterated with &drm_gpuva_for_each_op and must be processed
  * in the given order. It can contain map, unmap and remap operations, but it
  * also can be empty if no operation is required, e.g. if the requested mapping
- * already exists is the exact same way.
+ * already exists in the exact same way.
  *
  * There can be an arbitrary amount of unmap operations, a maximum of two remap
  * operations and a single map operation. The latter one represents the original
@@ -2788,7 +2788,7 @@ EXPORT_SYMBOL_GPL(drm_gpuvm_sm_map_ops_create);
  * The list can be iterated with &drm_gpuva_for_each_op and must be processed
  * in the given order. It can contain map and remap operations, but it
  * also can be empty if no operation is required, e.g. if the requested mapping
- * already exists is the exact same way.
+ * already exists in the exact same way.
  *
  * There will be no unmap operations, a maximum of two remap operations and two
  * map operations. The two map operations correspond to: one from start to the
diff --git a/include/drm/drm_gpuvm.h b/include/drm/drm_gpuvm.h
index 4a22b9d848f7b3d5710ca554f5b01556abf95985..757d071275e5125522deaa0ed2adb7dcbe1314a5 100644
--- a/include/drm/drm_gpuvm.h
+++ b/include/drm/drm_gpuvm.h
@@ -103,7 +103,7 @@ struct drm_gpuva {
 	} va;
 
 	/**
-	 * @gem: structure containing the &drm_gem_object and it's offset
+	 * @gem: structure containing the &drm_gem_object and its offset
 	 */
 	struct {
 		/**
@@ -834,7 +834,7 @@ struct drm_gpuva_op_map {
 	} va;
 
 	/**
-	 * @gem: structure containing the &drm_gem_object and it's offset
+	 * @gem: structure containing the &drm_gem_object and its offset
 	 */
 	struct {
 		/**
@@ -1195,11 +1195,11 @@ struct drm_gpuvm_ops {
 
 	/**
 	 * @sm_step_unmap: called from &drm_gpuvm_sm_map and
-	 * &drm_gpuvm_sm_unmap to unmap an existent mapping
+	 * &drm_gpuvm_sm_unmap to unmap an existing mapping
 	 *
-	 * This callback is called when existent mapping needs to be unmapped.
+	 * This callback is called when existing mapping needs to be unmapped.
 	 * This is the case when either a newly requested mapping encloses an
-	 * existent mapping or an unmap of an existent mapping is requested.
+	 * existing mapping or an unmap of an existing mapping is requested.
 	 *
 	 * The &priv pointer matches the one the driver passed to
 	 * &drm_gpuvm_sm_map or &drm_gpuvm_sm_unmap, respectively.

---
base-commit: efe927b9702643a1d80472664c2642f0304cb608
change-id: 20250824-gpuvm-typo-fix-c1d70a97cf7a

Best regards,
-- 
Alice Ryhl <aliceryhl@google.com>

