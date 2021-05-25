Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1606B390B26
	for <lists+dri-devel@lfdr.de>; Tue, 25 May 2021 23:18:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 012176EB4C;
	Tue, 25 May 2021 21:18:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com
 [IPv6:2607:f8b0:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9670C6EB4C
 for <dri-devel@lists.freedesktop.org>; Tue, 25 May 2021 21:18:05 +0000 (UTC)
Received: by mail-pl1-x62b.google.com with SMTP id s4so15473888plg.12
 for <dri-devel@lists.freedesktop.org>; Tue, 25 May 2021 14:18:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zBYlG0TQXh3M5UESnQyBpw3BPZcYPcdHje/svqKqnqU=;
 b=joO78nT0dLZnb9w8eJniqsx2G2+4nlTVNaMzBydbNFULqXWjGkN1/BRY/qv7FCnti/
 6WpO1ZY1f24gsAypfay6zclPnXbIx0Uhq4wkIbvDmiGWw4aC1kTa0LHdOiPRwECeQfSc
 fXJQemjfhPwgR0wHoMJ0Ctk7voPZalLEUSkqst6hLUWN6ZlfKgFVesc7WEhr/o/T8NUp
 Me93Qf0dwaGpk6mnmkMYw3R3mPAvjWYJbExUyH5K0wNBBUEVc/5BBU9okb0Rhe+K63vN
 nHC3+04sGcsb5Aeer69/sCkqHywz6EIayTdzoA7fz0VY4HE89D8fPKdjXZBWZbvYUllZ
 phAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zBYlG0TQXh3M5UESnQyBpw3BPZcYPcdHje/svqKqnqU=;
 b=UEiZEn4z7wcyEvt9psds51yfkFgZaVQUc+6E4SXmO0pzpWD/uJIx1ArhNmpPjonppL
 eE57XYyVfhkoAP6VOF6ud8g75mx/MoXyctzXhtkBDG/sK58rjQL+X1o2uL++H8paeUgp
 Bf9D3/CTst8+1ByEhTKJCd/s6aMnZ0QvpKGMVWuyGLLeBBGcWB9Xqi6wftOMqaAQHVu9
 75HedgP8pd4b0R38KKjhK1ggBAICk2bKq0LaZcVQyANit5WT8uBP2xXNwUGx9bkVITkg
 +QvxFAYsTiiWdQ+KPZ3Ysm4bEcUEtxcdWxJ31n9pgCVgIruHESdwX8EjuFE3sYNZycvN
 C+eg==
X-Gm-Message-State: AOAM533vM5ZlGPerHAkMfgkg02fA0FKyZ15asnxoNtgLkxWmOdir7XbY
 DAdASAFj0KPDWlBbRAFhrXldh025uoZAJg==
X-Google-Smtp-Source: ABdhPJypms8hHhyEWPWO7Fvw22wMDzBbdTdTOjyDpDW478qXFko1qswyGQJ8BnFot6xxq/p6vsdzAw==
X-Received: by 2002:a17:90b:3781:: with SMTP id
 mz1mr326902pjb.234.1621977484492; 
 Tue, 25 May 2021 14:18:04 -0700 (PDT)
Received: from omlet.lan ([134.134.139.83])
 by smtp.gmail.com with ESMTPSA id e186sm14342278pfa.145.2021.05.25.14.18.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 May 2021 14:18:03 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH 2/7] dma-buf: Rename dma_resv helpers from _rcu to _unlocked
 (v2)
Date: Tue, 25 May 2021 16:17:48 -0500
Message-Id: <20210525211753.1086069-3-jason@jlekstrand.net>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210525211753.1086069-1-jason@jlekstrand.net>
References: <20210525211753.1086069-1-jason@jlekstrand.net>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Huang Rui <ray.huang@amd.com>,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Jason Ekstrand <jason@jlekstrand.net>,
 Sean Paul <sean@poorly.run>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

None of these helpers actually leak any RCU details to the caller.  They
all assume you have a genuine reference, take the RCU read lock, and
retry if needed.  Naming them with an _rcu is likely to cause callers
more panic than needed.

v2 (Jason Ekstrand):
 - Fix function argument indentation

Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
Suggested-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Christian König <christian.koenig@amd.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Lucas Stach <l.stach@pengutronix.de>
Cc: Rob Clark <robdclark@gmail.com>
Cc: Sean Paul <sean@poorly.run>
Cc: Huang Rui <ray.huang@amd.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: VMware Graphics <linux-graphics-maintainer@vmware.com>
---
 drivers/dma-buf/dma-buf.c                     |  4 +--
 drivers/dma-buf/dma-resv.c                    | 28 +++++++++----------
 drivers/gpu/drm/amd/amdgpu/amdgpu_display.c   |  6 ++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c   |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c       |  4 +--
 drivers/gpu/drm/amd/amdgpu/amdgpu_ids.c       |  6 ++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c        |  4 +--
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c    |  4 +--
 drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c       |  6 ++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c        | 14 +++++-----
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  6 ++--
 drivers/gpu/drm/drm_gem.c                     | 10 +++----
 drivers/gpu/drm/drm_gem_atomic_helper.c       |  2 +-
 drivers/gpu/drm/etnaviv/etnaviv_gem.c         |  7 ++---
 drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c  |  8 +++---
 drivers/gpu/drm/i915/display/intel_display.c  |  2 +-
 drivers/gpu/drm/i915/dma_resv_utils.c         |  2 +-
 drivers/gpu/drm/i915/gem/i915_gem_busy.c      |  2 +-
 .../gpu/drm/i915/gem/i915_gem_execbuffer.c    |  2 +-
 drivers/gpu/drm/i915/gem/i915_gem_object.h    |  2 +-
 drivers/gpu/drm/i915/gem/i915_gem_userptr.c   |  4 +--
 drivers/gpu/drm/i915/gem/i915_gem_wait.c      | 10 +++----
 drivers/gpu/drm/i915/i915_request.c           |  6 ++--
 drivers/gpu/drm/i915/i915_sw_fence.c          |  4 +--
 drivers/gpu/drm/msm/msm_gem.c                 |  3 +-
 drivers/gpu/drm/nouveau/dispnv50/wndw.c       |  2 +-
 drivers/gpu/drm/nouveau/nouveau_gem.c         |  4 +--
 drivers/gpu/drm/panfrost/panfrost_drv.c       |  4 +--
 drivers/gpu/drm/panfrost/panfrost_job.c       |  2 +-
 drivers/gpu/drm/radeon/radeon_gem.c           |  6 ++--
 drivers/gpu/drm/radeon/radeon_mn.c            |  4 +--
 drivers/gpu/drm/ttm/ttm_bo.c                  | 18 ++++++------
 drivers/gpu/drm/vgem/vgem_fence.c             |  4 +--
 drivers/gpu/drm/virtio/virtgpu_ioctl.c        |  6 ++--
 drivers/gpu/drm/vmwgfx/vmwgfx_bo.c            |  2 +-
 include/linux/dma-resv.h                      | 18 ++++++------
 36 files changed, 108 insertions(+), 110 deletions(-)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index f264b70c383eb..ed6451d55d663 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -1147,8 +1147,8 @@ static int __dma_buf_begin_cpu_access(struct dma_buf *dmabuf,
 	long ret;
 
 	/* Wait on any implicit rendering fences */
-	ret = dma_resv_wait_timeout_rcu(resv, write, true,
-						  MAX_SCHEDULE_TIMEOUT);
+	ret = dma_resv_wait_timeout_unlocked(resv, write, true,
+					     MAX_SCHEDULE_TIMEOUT);
 	if (ret < 0)
 		return ret;
 
diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
index 6ddbeb5dfbf65..d6f1ed4cd4d55 100644
--- a/drivers/dma-buf/dma-resv.c
+++ b/drivers/dma-buf/dma-resv.c
@@ -417,7 +417,7 @@ int dma_resv_copy_fences(struct dma_resv *dst, struct dma_resv *src)
 EXPORT_SYMBOL(dma_resv_copy_fences);
 
 /**
- * dma_resv_get_fences_rcu - Get an object's shared and exclusive
+ * dma_resv_get_fences_unlocked - Get an object's shared and exclusive
  * fences without update side lock held
  * @obj: the reservation object
  * @pfence_excl: the returned exclusive fence (or NULL)
@@ -429,10 +429,10 @@ EXPORT_SYMBOL(dma_resv_copy_fences);
  * exclusive fence is not specified the fence is put into the array of the
  * shared fences as well. Returns either zero or -ENOMEM.
  */
-int dma_resv_get_fences_rcu(struct dma_resv *obj,
-			    struct dma_fence **pfence_excl,
-			    unsigned *pshared_count,
-			    struct dma_fence ***pshared)
+int dma_resv_get_fences_unlocked(struct dma_resv *obj,
+				 struct dma_fence **pfence_excl,
+				 unsigned *pshared_count,
+				 struct dma_fence ***pshared)
 {
 	struct dma_fence **shared = NULL;
 	struct dma_fence *fence_excl;
@@ -515,10 +515,10 @@ int dma_resv_get_fences_rcu(struct dma_resv *obj,
 	*pshared = shared;
 	return ret;
 }
-EXPORT_SYMBOL_GPL(dma_resv_get_fences_rcu);
+EXPORT_SYMBOL_GPL(dma_resv_get_fences_unlocked);
 
 /**
- * dma_resv_wait_timeout_rcu - Wait on reservation's objects
+ * dma_resv_wait_timeout_unlocked - Wait on reservation's objects
  * shared and/or exclusive fences.
  * @obj: the reservation object
  * @wait_all: if true, wait on all fences, else wait on just exclusive fence
@@ -529,9 +529,9 @@ EXPORT_SYMBOL_GPL(dma_resv_get_fences_rcu);
  * Returns -ERESTARTSYS if interrupted, 0 if the wait timed out, or
  * greater than zer on success.
  */
-long dma_resv_wait_timeout_rcu(struct dma_resv *obj,
-			       bool wait_all, bool intr,
-			       unsigned long timeout)
+long dma_resv_wait_timeout_unlocked(struct dma_resv *obj,
+				    bool wait_all, bool intr,
+				    unsigned long timeout)
 {
 	struct dma_fence *fence;
 	unsigned seq, shared_count;
@@ -602,7 +602,7 @@ long dma_resv_wait_timeout_rcu(struct dma_resv *obj,
 	rcu_read_unlock();
 	goto retry;
 }
-EXPORT_SYMBOL_GPL(dma_resv_wait_timeout_rcu);
+EXPORT_SYMBOL_GPL(dma_resv_wait_timeout_unlocked);
 
 
 static inline int dma_resv_test_signaled_single(struct dma_fence *passed_fence)
@@ -622,7 +622,7 @@ static inline int dma_resv_test_signaled_single(struct dma_fence *passed_fence)
 }
 
 /**
- * dma_resv_test_signaled_rcu - Test if a reservation object's
+ * dma_resv_test_signaled_unlocked - Test if a reservation object's
  * fences have been signaled.
  * @obj: the reservation object
  * @test_all: if true, test all fences, otherwise only test the exclusive
@@ -631,7 +631,7 @@ static inline int dma_resv_test_signaled_single(struct dma_fence *passed_fence)
  * RETURNS
  * true if all fences signaled, else false
  */
-bool dma_resv_test_signaled_rcu(struct dma_resv *obj, bool test_all)
+bool dma_resv_test_signaled_unlocked(struct dma_resv *obj, bool test_all)
 {
 	unsigned seq, shared_count;
 	int ret;
@@ -680,4 +680,4 @@ bool dma_resv_test_signaled_rcu(struct dma_resv *obj, bool test_all)
 	rcu_read_unlock();
 	return ret;
 }
-EXPORT_SYMBOL_GPL(dma_resv_test_signaled_rcu);
+EXPORT_SYMBOL_GPL(dma_resv_test_signaled_unlocked);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
index 8a1fb8b6606e5..b8e24f199be9a 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
@@ -203,9 +203,9 @@ int amdgpu_display_crtc_page_flip_target(struct drm_crtc *crtc,
 		goto unpin;
 	}
 
-	r = dma_resv_get_fences_rcu(new_abo->tbo.base.resv, &work->excl,
-					      &work->shared_count,
-					      &work->shared);
+	r = dma_resv_get_fences_unlocked(new_abo->tbo.base.resv, &work->excl,
+					 &work->shared_count,
+					 &work->shared);
 	if (unlikely(r != 0)) {
 		DRM_ERROR("failed to get fences for buffer\n");
 		goto unpin;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
index baa980a477d94..0d0319bc51577 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
@@ -98,7 +98,7 @@ __dma_resv_make_exclusive(struct dma_resv *obj)
 	if (!dma_resv_get_list(obj)) /* no shared fences to convert */
 		return 0;
 
-	r = dma_resv_get_fences_rcu(obj, NULL, &count, &fences);
+	r = dma_resv_get_fences_unlocked(obj, NULL, &count, &fences);
 	if (r)
 		return r;
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
index 18974bd081f00..8e2996d6ba3ad 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
@@ -471,8 +471,8 @@ int amdgpu_gem_wait_idle_ioctl(struct drm_device *dev, void *data,
 		return -ENOENT;
 	}
 	robj = gem_to_amdgpu_bo(gobj);
-	ret = dma_resv_wait_timeout_rcu(robj->tbo.base.resv, true, true,
-						  timeout);
+	ret = dma_resv_wait_timeout_unlocked(robj->tbo.base.resv, true, true,
+					     timeout);
 
 	/* ret == 0 means not signaled,
 	 * ret > 0 means signaled
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ids.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ids.c
index b4971e90b98cf..38e1b32dd2cef 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ids.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ids.c
@@ -112,7 +112,7 @@ void amdgpu_pasid_free_delayed(struct dma_resv *resv,
 	unsigned count;
 	int r;
 
-	r = dma_resv_get_fences_rcu(resv, NULL, &count, &fences);
+	r = dma_resv_get_fences_unlocked(resv, NULL, &count, &fences);
 	if (r)
 		goto fallback;
 
@@ -156,8 +156,8 @@ void amdgpu_pasid_free_delayed(struct dma_resv *resv,
 	/* Not enough memory for the delayed delete, as last resort
 	 * block for all the fences to complete.
 	 */
-	dma_resv_wait_timeout_rcu(resv, true, false,
-					    MAX_SCHEDULE_TIMEOUT);
+	dma_resv_wait_timeout_unlocked(resv, true, false,
+				       MAX_SCHEDULE_TIMEOUT);
 	amdgpu_pasid_free(pasid);
 }
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c
index 828b5167ff128..0319c8b547c48 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c
@@ -75,8 +75,8 @@ static bool amdgpu_mn_invalidate_gfx(struct mmu_interval_notifier *mni,
 
 	mmu_interval_set_seq(mni, cur_seq);
 
-	r = dma_resv_wait_timeout_rcu(bo->tbo.base.resv, true, false,
-				      MAX_SCHEDULE_TIMEOUT);
+	r = dma_resv_wait_timeout_unlocked(bo->tbo.base.resv, true, false,
+					   MAX_SCHEDULE_TIMEOUT);
 	mutex_unlock(&adev->notifier_lock);
 	if (r <= 0)
 		DRM_ERROR("(%ld) failed to wait for user bo\n", r);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
index 0adffcace3263..de1c7c5501683 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
@@ -791,8 +791,8 @@ int amdgpu_bo_kmap(struct amdgpu_bo *bo, void **ptr)
 		return 0;
 	}
 
-	r = dma_resv_wait_timeout_rcu(bo->tbo.base.resv, false, false,
-						MAX_SCHEDULE_TIMEOUT);
+	r = dma_resv_wait_timeout_unlocked(bo->tbo.base.resv, false, false,
+					   MAX_SCHEDULE_TIMEOUT);
 	if (r < 0)
 		return r;
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c
index c6dbc08016045..4a2196404fb69 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c
@@ -1115,9 +1115,9 @@ static int amdgpu_uvd_send_msg(struct amdgpu_ring *ring, struct amdgpu_bo *bo,
 	ib->length_dw = 16;
 
 	if (direct) {
-		r = dma_resv_wait_timeout_rcu(bo->tbo.base.resv,
-							true, false,
-							msecs_to_jiffies(10));
+		r = dma_resv_wait_timeout_unlocked(bo->tbo.base.resv,
+						   true, false,
+						   msecs_to_jiffies(10));
 		if (r == 0)
 			r = -ETIMEDOUT;
 		if (r < 0)
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
index 4a3e3f72e1277..7ba1c537d6584 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
@@ -2007,14 +2007,14 @@ static void amdgpu_vm_prt_fini(struct amdgpu_device *adev, struct amdgpu_vm *vm)
 	unsigned i, shared_count;
 	int r;
 
-	r = dma_resv_get_fences_rcu(resv, &excl,
-					      &shared_count, &shared);
+	r = dma_resv_get_fences_unlocked(resv, &excl,
+					 &shared_count, &shared);
 	if (r) {
 		/* Not enough memory to grab the fence list, as last resort
 		 * block for all the fences to complete.
 		 */
-		dma_resv_wait_timeout_rcu(resv, true, false,
-						    MAX_SCHEDULE_TIMEOUT);
+		dma_resv_wait_timeout_unlocked(resv, true, false,
+					       MAX_SCHEDULE_TIMEOUT);
 		return;
 	}
 
@@ -2625,7 +2625,7 @@ bool amdgpu_vm_evictable(struct amdgpu_bo *bo)
 		return true;
 
 	/* Don't evict VM page tables while they are busy */
-	if (!dma_resv_test_signaled_rcu(bo->tbo.base.resv, true))
+	if (!dma_resv_test_signaled_unlocked(bo->tbo.base.resv, true))
 		return false;
 
 	/* Try to block ongoing updates */
@@ -2805,8 +2805,8 @@ void amdgpu_vm_adjust_size(struct amdgpu_device *adev, uint32_t min_vm_size,
  */
 long amdgpu_vm_wait_idle(struct amdgpu_vm *vm, long timeout)
 {
-	timeout = dma_resv_wait_timeout_rcu(vm->root.base.bo->tbo.base.resv,
-					    true, true, timeout);
+	timeout = dma_resv_wait_timeout_unlocked(vm->root.base.bo->tbo.base.resv,
+						 true, true, timeout);
 	if (timeout <= 0)
 		return timeout;
 
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 9ca517b658546..0121d2817fa26 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -8276,9 +8276,9 @@ static void amdgpu_dm_commit_planes(struct drm_atomic_state *state,
 		 * deadlock during GPU reset when this fence will not signal
 		 * but we hold reservation lock for the BO.
 		 */
-		r = dma_resv_wait_timeout_rcu(abo->tbo.base.resv, true,
-							false,
-							msecs_to_jiffies(5000));
+		r = dma_resv_wait_timeout_unlocked(abo->tbo.base.resv, true,
+						   false,
+						   msecs_to_jiffies(5000));
 		if (unlikely(r <= 0))
 			DRM_ERROR("Waiting for fences timed out!");
 
diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
index 9989425e9875a..1241a421b9e81 100644
--- a/drivers/gpu/drm/drm_gem.c
+++ b/drivers/gpu/drm/drm_gem.c
@@ -770,8 +770,8 @@ long drm_gem_dma_resv_wait(struct drm_file *filep, u32 handle,
 		return -EINVAL;
 	}
 
-	ret = dma_resv_wait_timeout_rcu(obj->resv, wait_all,
-						  true, timeout);
+	ret = dma_resv_wait_timeout_unlocked(obj->resv, wait_all,
+					     true, timeout);
 	if (ret == 0)
 		ret = -ETIME;
 	else if (ret > 0)
@@ -1375,13 +1375,13 @@ int drm_gem_fence_array_add_implicit(struct xarray *fence_array,
 
 	if (!write) {
 		struct dma_fence *fence =
-			dma_resv_get_excl_rcu(obj->resv);
+			dma_resv_get_excl_unlocked(obj->resv);
 
 		return drm_gem_fence_array_add(fence_array, fence);
 	}
 
-	ret = dma_resv_get_fences_rcu(obj->resv, NULL,
-						&fence_count, &fences);
+	ret = dma_resv_get_fences_unlocked(obj->resv, NULL,
+					   &fence_count, &fences);
 	if (ret || !fence_count)
 		return ret;
 
diff --git a/drivers/gpu/drm/drm_gem_atomic_helper.c b/drivers/gpu/drm/drm_gem_atomic_helper.c
index a005c5a0ba46a..a27135084ae5c 100644
--- a/drivers/gpu/drm/drm_gem_atomic_helper.c
+++ b/drivers/gpu/drm/drm_gem_atomic_helper.c
@@ -147,7 +147,7 @@ int drm_gem_plane_helper_prepare_fb(struct drm_plane *plane, struct drm_plane_st
 		return 0;
 
 	obj = drm_gem_fb_get_obj(state->fb, 0);
-	fence = dma_resv_get_excl_rcu(obj->resv);
+	fence = dma_resv_get_excl_unlocked(obj->resv);
 	drm_atomic_set_fence_for_plane(state, fence);
 
 	return 0;
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem.c b/drivers/gpu/drm/etnaviv/etnaviv_gem.c
index db69f19ab5bca..4e6f5346e84e4 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gem.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gem.c
@@ -390,14 +390,13 @@ int etnaviv_gem_cpu_prep(struct drm_gem_object *obj, u32 op,
 	}
 
 	if (op & ETNA_PREP_NOSYNC) {
-		if (!dma_resv_test_signaled_rcu(obj->resv,
-							  write))
+		if (!dma_resv_test_signaled_unlocked(obj->resv, write))
 			return -EBUSY;
 	} else {
 		unsigned long remain = etnaviv_timeout_to_jiffies(timeout);
 
-		ret = dma_resv_wait_timeout_rcu(obj->resv,
-							  write, true, remain);
+		ret = dma_resv_wait_timeout_unlocked(obj->resv,
+						     write, true, remain);
 		if (ret <= 0)
 			return ret == 0 ? -ETIMEDOUT : ret;
 	}
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c b/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
index d05c359945799..6617fada4595d 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
@@ -189,13 +189,13 @@ static int submit_fence_sync(struct etnaviv_gem_submit *submit)
 			continue;
 
 		if (bo->flags & ETNA_SUBMIT_BO_WRITE) {
-			ret = dma_resv_get_fences_rcu(robj, &bo->excl,
-								&bo->nr_shared,
-								&bo->shared);
+			ret = dma_resv_get_fences_unlocked(robj, &bo->excl,
+							   &bo->nr_shared,
+							   &bo->shared);
 			if (ret)
 				return ret;
 		} else {
-			bo->excl = dma_resv_get_excl_rcu(robj);
+			bo->excl = dma_resv_get_excl_unlocked(robj);
 		}
 
 	}
diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 422b59ebf6dce..5f0b85a102159 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -11040,7 +11040,7 @@ intel_prepare_plane_fb(struct drm_plane *_plane,
 		if (ret < 0)
 			goto unpin_fb;
 
-		fence = dma_resv_get_excl_rcu(obj->base.resv);
+		fence = dma_resv_get_excl_unlocked(obj->base.resv);
 		if (fence) {
 			add_rps_boost_after_vblank(new_plane_state->hw.crtc,
 						   fence);
diff --git a/drivers/gpu/drm/i915/dma_resv_utils.c b/drivers/gpu/drm/i915/dma_resv_utils.c
index 9e508e7d4629f..bdfc6bf16a4e9 100644
--- a/drivers/gpu/drm/i915/dma_resv_utils.c
+++ b/drivers/gpu/drm/i915/dma_resv_utils.c
@@ -10,7 +10,7 @@
 void dma_resv_prune(struct dma_resv *resv)
 {
 	if (dma_resv_trylock(resv)) {
-		if (dma_resv_test_signaled_rcu(resv, true))
+		if (dma_resv_test_signaled_unlocked(resv, true))
 			dma_resv_add_excl_fence(resv, NULL);
 		dma_resv_unlock(resv);
 	}
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_busy.c b/drivers/gpu/drm/i915/gem/i915_gem_busy.c
index 25235ef630c10..754ad6d1bace9 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_busy.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_busy.c
@@ -105,7 +105,7 @@ i915_gem_busy_ioctl(struct drm_device *dev, void *data,
 	 * Alternatively, we can trade that extra information on read/write
 	 * activity with
 	 *	args->busy =
-	 *		!dma_resv_test_signaled_rcu(obj->resv, true);
+	 *		!dma_resv_test_signaled_unlocked(obj->resv, true);
 	 * to report the overall busyness. This is what the wait-ioctl does.
 	 *
 	 */
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
index 297143511f99b..e8f323564e57b 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
@@ -1481,7 +1481,7 @@ static inline bool use_reloc_gpu(struct i915_vma *vma)
 	if (DBG_FORCE_RELOC)
 		return false;
 
-	return !dma_resv_test_signaled_rcu(vma->resv, true);
+	return !dma_resv_test_signaled_unlocked(vma->resv, true);
 }
 
 static unsigned long vma_phys_addr(struct i915_vma *vma, u32 offset)
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.h b/drivers/gpu/drm/i915/gem/i915_gem_object.h
index 2ebd79537aea9..7c0eb425cb3b3 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_object.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_object.h
@@ -500,7 +500,7 @@ i915_gem_object_last_write_engine(struct drm_i915_gem_object *obj)
 	struct dma_fence *fence;
 
 	rcu_read_lock();
-	fence = dma_resv_get_excl_rcu(obj->base.resv);
+	fence = dma_resv_get_excl_unlocked(obj->base.resv);
 	rcu_read_unlock();
 
 	if (fence && dma_fence_is_i915(fence) && !dma_fence_is_signaled(fence))
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_userptr.c b/drivers/gpu/drm/i915/gem/i915_gem_userptr.c
index a657b99ec7606..44df18dc9669f 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_userptr.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_userptr.c
@@ -85,8 +85,8 @@ static bool i915_gem_userptr_invalidate(struct mmu_interval_notifier *mni,
 		return true;
 
 	/* we will unbind on next submission, still have userptr pins */
-	r = dma_resv_wait_timeout_rcu(obj->base.resv, true, false,
-				      MAX_SCHEDULE_TIMEOUT);
+	r = dma_resv_wait_timeout_unlocked(obj->base.resv, true, false,
+					   MAX_SCHEDULE_TIMEOUT);
 	if (r <= 0)
 		drm_err(&i915->drm, "(%ld) failed to wait for idle\n", r);
 
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_wait.c b/drivers/gpu/drm/i915/gem/i915_gem_wait.c
index 4b9856d5ba14f..5b6c52659ad4d 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_wait.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_wait.c
@@ -45,7 +45,7 @@ i915_gem_object_wait_reservation(struct dma_resv *resv,
 		unsigned int count, i;
 		int ret;
 
-		ret = dma_resv_get_fences_rcu(resv, &excl, &count, &shared);
+		ret = dma_resv_get_fences_unlocked(resv, &excl, &count, &shared);
 		if (ret)
 			return ret;
 
@@ -73,7 +73,7 @@ i915_gem_object_wait_reservation(struct dma_resv *resv,
 		 */
 		prune_fences = count && timeout >= 0;
 	} else {
-		excl = dma_resv_get_excl_rcu(resv);
+		excl = dma_resv_get_excl_unlocked(resv);
 	}
 
 	if (excl && timeout >= 0)
@@ -158,8 +158,8 @@ i915_gem_object_wait_priority(struct drm_i915_gem_object *obj,
 		unsigned int count, i;
 		int ret;
 
-		ret = dma_resv_get_fences_rcu(obj->base.resv,
-					      &excl, &count, &shared);
+		ret = dma_resv_get_fences_unlocked(obj->base.resv,
+						   &excl, &count, &shared);
 		if (ret)
 			return ret;
 
@@ -170,7 +170,7 @@ i915_gem_object_wait_priority(struct drm_i915_gem_object *obj,
 
 		kfree(shared);
 	} else {
-		excl = dma_resv_get_excl_rcu(obj->base.resv);
+		excl = dma_resv_get_excl_unlocked(obj->base.resv);
 	}
 
 	if (excl) {
diff --git a/drivers/gpu/drm/i915/i915_request.c b/drivers/gpu/drm/i915/i915_request.c
index 970d8f4986bbe..f1ed03ced7dd1 100644
--- a/drivers/gpu/drm/i915/i915_request.c
+++ b/drivers/gpu/drm/i915/i915_request.c
@@ -1594,8 +1594,8 @@ i915_request_await_object(struct i915_request *to,
 		struct dma_fence **shared;
 		unsigned int count, i;
 
-		ret = dma_resv_get_fences_rcu(obj->base.resv,
-							&excl, &count, &shared);
+		ret = dma_resv_get_fences_unlocked(obj->base.resv,
+						   &excl, &count, &shared);
 		if (ret)
 			return ret;
 
@@ -1611,7 +1611,7 @@ i915_request_await_object(struct i915_request *to,
 			dma_fence_put(shared[i]);
 		kfree(shared);
 	} else {
-		excl = dma_resv_get_excl_rcu(obj->base.resv);
+		excl = dma_resv_get_excl_unlocked(obj->base.resv);
 	}
 
 	if (excl) {
diff --git a/drivers/gpu/drm/i915/i915_sw_fence.c b/drivers/gpu/drm/i915/i915_sw_fence.c
index 2744558f30507..0bcb7ea44201e 100644
--- a/drivers/gpu/drm/i915/i915_sw_fence.c
+++ b/drivers/gpu/drm/i915/i915_sw_fence.c
@@ -582,7 +582,7 @@ int i915_sw_fence_await_reservation(struct i915_sw_fence *fence,
 		struct dma_fence **shared;
 		unsigned int count, i;
 
-		ret = dma_resv_get_fences_rcu(resv, &excl, &count, &shared);
+		ret = dma_resv_get_fences_unlocked(resv, &excl, &count, &shared);
 		if (ret)
 			return ret;
 
@@ -606,7 +606,7 @@ int i915_sw_fence_await_reservation(struct i915_sw_fence *fence,
 			dma_fence_put(shared[i]);
 		kfree(shared);
 	} else {
-		excl = dma_resv_get_excl_rcu(resv);
+		excl = dma_resv_get_excl_unlocked(resv);
 	}
 
 	if (ret >= 0 && excl && excl->ops != exclude) {
diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 56df86e5f7400..1aca60507bb14 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -915,8 +915,7 @@ int msm_gem_cpu_prep(struct drm_gem_object *obj, uint32_t op, ktime_t *timeout)
 		op & MSM_PREP_NOSYNC ? 0 : timeout_to_jiffies(timeout);
 	long ret;
 
-	ret = dma_resv_wait_timeout_rcu(obj->resv, write,
-						  true,  remain);
+	ret = dma_resv_wait_timeout_unlocked(obj->resv, write, true, remain);
 	if (ret == 0)
 		return remain == 0 ? -EBUSY : -ETIMEDOUT;
 	else if (ret < 0)
diff --git a/drivers/gpu/drm/nouveau/dispnv50/wndw.c b/drivers/gpu/drm/nouveau/dispnv50/wndw.c
index 0cb1f9d848d3e..8d048bacd6f02 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/wndw.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/wndw.c
@@ -561,7 +561,7 @@ nv50_wndw_prepare_fb(struct drm_plane *plane, struct drm_plane_state *state)
 			asyw->image.handle[0] = ctxdma->object.handle;
 	}
 
-	asyw->state.fence = dma_resv_get_excl_rcu(nvbo->bo.base.resv);
+	asyw->state.fence = dma_resv_get_excl_unlocked(nvbo->bo.base.resv);
 	asyw->image.offset[0] = nvbo->offset;
 
 	if (wndw->func->prepare) {
diff --git a/drivers/gpu/drm/nouveau/nouveau_gem.c b/drivers/gpu/drm/nouveau/nouveau_gem.c
index a70e82413fa75..bc6b09ee9b552 100644
--- a/drivers/gpu/drm/nouveau/nouveau_gem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_gem.c
@@ -928,8 +928,8 @@ nouveau_gem_ioctl_cpu_prep(struct drm_device *dev, void *data,
 		return -ENOENT;
 	nvbo = nouveau_gem_object(gem);
 
-	lret = dma_resv_wait_timeout_rcu(nvbo->bo.base.resv, write, true,
-						   no_wait ? 0 : 30 * HZ);
+	lret = dma_resv_wait_timeout_unlocked(nvbo->bo.base.resv, write, true,
+					      no_wait ? 0 : 30 * HZ);
 	if (!lret)
 		ret = -EBUSY;
 	else if (lret > 0)
diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
index ca07098a61419..eef5b632ee0ce 100644
--- a/drivers/gpu/drm/panfrost/panfrost_drv.c
+++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
@@ -311,8 +311,8 @@ panfrost_ioctl_wait_bo(struct drm_device *dev, void *data,
 	if (!gem_obj)
 		return -ENOENT;
 
-	ret = dma_resv_wait_timeout_rcu(gem_obj->resv, true,
-						  true, timeout);
+	ret = dma_resv_wait_timeout_unlocked(gem_obj->resv, true,
+					     true, timeout);
 	if (!ret)
 		ret = timeout ? -ETIMEDOUT : -EBUSY;
 
diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
index 6003cfeb13221..2df3e999a38d0 100644
--- a/drivers/gpu/drm/panfrost/panfrost_job.c
+++ b/drivers/gpu/drm/panfrost/panfrost_job.c
@@ -203,7 +203,7 @@ static void panfrost_acquire_object_fences(struct drm_gem_object **bos,
 	int i;
 
 	for (i = 0; i < bo_count; i++)
-		implicit_fences[i] = dma_resv_get_excl_rcu(bos[i]->resv);
+		implicit_fences[i] = dma_resv_get_excl_unlocked(bos[i]->resv);
 }
 
 static void panfrost_attach_object_fences(struct drm_gem_object **bos,
diff --git a/drivers/gpu/drm/radeon/radeon_gem.c b/drivers/gpu/drm/radeon/radeon_gem.c
index 05ea2f39f6261..1a38b0bf36d11 100644
--- a/drivers/gpu/drm/radeon/radeon_gem.c
+++ b/drivers/gpu/drm/radeon/radeon_gem.c
@@ -125,7 +125,7 @@ static int radeon_gem_set_domain(struct drm_gem_object *gobj,
 	}
 	if (domain == RADEON_GEM_DOMAIN_CPU) {
 		/* Asking for cpu access wait for object idle */
-		r = dma_resv_wait_timeout_rcu(robj->tbo.base.resv, true, true, 30 * HZ);
+		r = dma_resv_wait_timeout_unlocked(robj->tbo.base.resv, true, true, 30 * HZ);
 		if (!r)
 			r = -EBUSY;
 
@@ -474,7 +474,7 @@ int radeon_gem_busy_ioctl(struct drm_device *dev, void *data,
 	}
 	robj = gem_to_radeon_bo(gobj);
 
-	r = dma_resv_test_signaled_rcu(robj->tbo.base.resv, true);
+	r = dma_resv_test_signaled_unlocked(robj->tbo.base.resv, true);
 	if (r == 0)
 		r = -EBUSY;
 	else
@@ -503,7 +503,7 @@ int radeon_gem_wait_idle_ioctl(struct drm_device *dev, void *data,
 	}
 	robj = gem_to_radeon_bo(gobj);
 
-	ret = dma_resv_wait_timeout_rcu(robj->tbo.base.resv, true, true, 30 * HZ);
+	ret = dma_resv_wait_timeout_unlocked(robj->tbo.base.resv, true, true, 30 * HZ);
 	if (ret == 0)
 		r = -EBUSY;
 	else if (ret < 0)
diff --git a/drivers/gpu/drm/radeon/radeon_mn.c b/drivers/gpu/drm/radeon/radeon_mn.c
index e37c9a57a7c36..a19be3f8a218c 100644
--- a/drivers/gpu/drm/radeon/radeon_mn.c
+++ b/drivers/gpu/drm/radeon/radeon_mn.c
@@ -66,8 +66,8 @@ static bool radeon_mn_invalidate(struct mmu_interval_notifier *mn,
 		return true;
 	}
 
-	r = dma_resv_wait_timeout_rcu(bo->tbo.base.resv, true, false,
-				      MAX_SCHEDULE_TIMEOUT);
+	r = dma_resv_wait_timeout_unlocked(bo->tbo.base.resv, true, false,
+					   MAX_SCHEDULE_TIMEOUT);
 	if (r <= 0)
 		DRM_ERROR("(%ld) failed to wait for user bo\n", r);
 
diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index ca1b098b6a561..215cad3149621 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -294,7 +294,7 @@ static int ttm_bo_cleanup_refs(struct ttm_buffer_object *bo,
 	struct dma_resv *resv = &bo->base._resv;
 	int ret;
 
-	if (dma_resv_test_signaled_rcu(resv, true))
+	if (dma_resv_test_signaled_unlocked(resv, true))
 		ret = 0;
 	else
 		ret = -EBUSY;
@@ -306,8 +306,8 @@ static int ttm_bo_cleanup_refs(struct ttm_buffer_object *bo,
 			dma_resv_unlock(bo->base.resv);
 		spin_unlock(&bo->bdev->lru_lock);
 
-		lret = dma_resv_wait_timeout_rcu(resv, true, interruptible,
-						 30 * HZ);
+		lret = dma_resv_wait_timeout_unlocked(resv, true, interruptible,
+						      30 * HZ);
 
 		if (lret < 0)
 			return lret;
@@ -409,8 +409,8 @@ static void ttm_bo_release(struct kref *kref)
 			/* Last resort, if we fail to allocate memory for the
 			 * fences block for the BO to become idle
 			 */
-			dma_resv_wait_timeout_rcu(bo->base.resv, true, false,
-						  30 * HZ);
+			dma_resv_wait_timeout_unlocked(bo->base.resv, true, false,
+						       30 * HZ);
 		}
 
 		if (bo->bdev->funcs->release_notify)
@@ -420,7 +420,7 @@ static void ttm_bo_release(struct kref *kref)
 		ttm_mem_io_free(bdev, &bo->mem);
 	}
 
-	if (!dma_resv_test_signaled_rcu(bo->base.resv, true) ||
+	if (!dma_resv_test_signaled_unlocked(bo->base.resv, true) ||
 	    !dma_resv_trylock(bo->base.resv)) {
 		/* The BO is not idle, resurrect it for delayed destroy */
 		ttm_bo_flush_all_fences(bo);
@@ -1116,14 +1116,14 @@ int ttm_bo_wait(struct ttm_buffer_object *bo,
 	long timeout = 15 * HZ;
 
 	if (no_wait) {
-		if (dma_resv_test_signaled_rcu(bo->base.resv, true))
+		if (dma_resv_test_signaled_unlocked(bo->base.resv, true))
 			return 0;
 		else
 			return -EBUSY;
 	}
 
-	timeout = dma_resv_wait_timeout_rcu(bo->base.resv, true,
-						      interruptible, timeout);
+	timeout = dma_resv_wait_timeout_unlocked(bo->base.resv, true,
+						 interruptible, timeout);
 	if (timeout < 0)
 		return timeout;
 
diff --git a/drivers/gpu/drm/vgem/vgem_fence.c b/drivers/gpu/drm/vgem/vgem_fence.c
index 2902dc6e64faf..010a82405e374 100644
--- a/drivers/gpu/drm/vgem/vgem_fence.c
+++ b/drivers/gpu/drm/vgem/vgem_fence.c
@@ -151,8 +151,8 @@ int vgem_fence_attach_ioctl(struct drm_device *dev,
 
 	/* Check for a conflicting fence */
 	resv = obj->resv;
-	if (!dma_resv_test_signaled_rcu(resv,
-						  arg->flags & VGEM_FENCE_WRITE)) {
+	if (!dma_resv_test_signaled_unlocked(resv,
+					     arg->flags & VGEM_FENCE_WRITE)) {
 		ret = -EBUSY;
 		goto err_fence;
 	}
diff --git a/drivers/gpu/drm/virtio/virtgpu_ioctl.c b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
index 669f2ee395154..ab010c8e32816 100644
--- a/drivers/gpu/drm/virtio/virtgpu_ioctl.c
+++ b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
@@ -451,10 +451,10 @@ static int virtio_gpu_wait_ioctl(struct drm_device *dev, void *data,
 		return -ENOENT;
 
 	if (args->flags & VIRTGPU_WAIT_NOWAIT) {
-		ret = dma_resv_test_signaled_rcu(obj->resv, true);
+		ret = dma_resv_test_signaled_unlocked(obj->resv, true);
 	} else {
-		ret = dma_resv_wait_timeout_rcu(obj->resv, true, true,
-						timeout);
+		ret = dma_resv_wait_timeout_unlocked(obj->resv, true, true,
+						     timeout);
 	}
 	if (ret == 0)
 		ret = -EBUSY;
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c b/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
index 04dd49c4c2572..19e1ce23842a9 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
@@ -743,7 +743,7 @@ static int vmw_user_bo_synccpu_grab(struct vmw_user_buffer_object *user_bo,
 	if (flags & drm_vmw_synccpu_allow_cs) {
 		long lret;
 
-		lret = dma_resv_wait_timeout_rcu
+		lret = dma_resv_wait_timeout_unlocked
 			(bo->base.resv, true, true,
 			 nonblock ? 0 : MAX_SCHEDULE_TIMEOUT);
 		if (!lret)
diff --git a/include/linux/dma-resv.h b/include/linux/dma-resv.h
index d44a77e8a7e34..99cfb7af966b8 100644
--- a/include/linux/dma-resv.h
+++ b/include/linux/dma-resv.h
@@ -246,7 +246,7 @@ dma_resv_get_excl(struct dma_resv *obj)
 }
 
 /**
- * dma_resv_get_excl_rcu - get the reservation object's
+ * dma_resv_get_excl_unlocked - get the reservation object's
  * exclusive fence, without lock held.
  * @obj: the reservation object
  *
@@ -257,7 +257,7 @@ dma_resv_get_excl(struct dma_resv *obj)
  * The exclusive fence or NULL if none
  */
 static inline struct dma_fence *
-dma_resv_get_excl_rcu(struct dma_resv *obj)
+dma_resv_get_excl_unlocked(struct dma_resv *obj)
 {
 	struct dma_fence *fence;
 
@@ -278,16 +278,16 @@ void dma_resv_add_shared_fence(struct dma_resv *obj, struct dma_fence *fence);
 
 void dma_resv_add_excl_fence(struct dma_resv *obj, struct dma_fence *fence);
 
-int dma_resv_get_fences_rcu(struct dma_resv *obj,
-			    struct dma_fence **pfence_excl,
-			    unsigned *pshared_count,
-			    struct dma_fence ***pshared);
+int dma_resv_get_fences_unlocked(struct dma_resv *obj,
+				 struct dma_fence **pfence_excl,
+				 unsigned *pshared_count,
+				 struct dma_fence ***pshared);
 
 int dma_resv_copy_fences(struct dma_resv *dst, struct dma_resv *src);
 
-long dma_resv_wait_timeout_rcu(struct dma_resv *obj, bool wait_all, bool intr,
-			       unsigned long timeout);
+long dma_resv_wait_timeout_unlocked(struct dma_resv *obj, bool wait_all, bool intr,
+				    unsigned long timeout);
 
-bool dma_resv_test_signaled_rcu(struct dma_resv *obj, bool test_all);
+bool dma_resv_test_signaled_unlocked(struct dma_resv *obj, bool test_all);
 
 #endif /* _LINUX_RESERVATION_H */
-- 
2.31.1

