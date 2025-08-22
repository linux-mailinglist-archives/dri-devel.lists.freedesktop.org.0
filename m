Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9B84B31306
	for <lists+dri-devel@lfdr.de>; Fri, 22 Aug 2025 11:28:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2571F10E00C;
	Fri, 22 Aug 2025 09:28:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="ViUF1qfZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f74.google.com (mail-ed1-f74.google.com
 [209.85.208.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A402C10E00C
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Aug 2025 09:28:51 +0000 (UTC)
Received: by mail-ed1-f74.google.com with SMTP id
 4fb4d7f45d1cf-618b3c750baso1478899a12.1
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Aug 2025 02:28:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1755854930; x=1756459730;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=e+7jovikICPfeDBh9+sigj3WevDGgGN+HdnZFDA9m7c=;
 b=ViUF1qfZmByuvS7DaqXtdzm5X5ISkJo+CB3qdET8WhaDGtevZIsoztoy8S93bmfiHn
 yrSfMNTrudSizeAm2uHZE2XKvw3yNHXrI0kk6yw6WSHBDIPUpZeD9NpaNjbuGtShfe7X
 kvsCn4hQApXQG4hoTOS3bMD2zGNGROGiH5lSlS7N4roTEMogUoVM8mSKNwKZE+JfxIwW
 xRKb7evsv1u0lo39PX/PvEPtW3chDTV1T9WOAIUyaIglxEkhTco1wONRc0fd+IAqidG+
 HPwEBKlaXf1cZyy+sp4tt6fWJbMlQ+EhLuuJGp5G5praul2fIRO0bjTdtOshaUlllTG/
 h7iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755854930; x=1756459730;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=e+7jovikICPfeDBh9+sigj3WevDGgGN+HdnZFDA9m7c=;
 b=pbcF9r2jYrfb1y6k7kppUxm6oZVMnRcXEs5uiAXDuKd2pvdsykZeq54uBSpQ/zt+3y
 nnUi84qx6wdwFnCSY0dZqG3uunVfjBoVbz8e/qPm2wsj75qaF71syQ+aDA4b5cKyJsJd
 N8tDpLscBJhUgvYcLTWcN4qkCZgpPVeq8fV00Q53gUidlbwu2/4Sngn4KYpiWpL0UJDN
 JJhWuZc04OHN04jblMvQ4+KAHVSv2ht9Y1XyPaS8/UM+3F+ohsVZ7at1cC6tBZUi7WSJ
 QI5RYlbCNKkgjbz5sbP6sSIF0TdXUow2ZPJYjytZr9QXRRM8SOHiD9C5qnCS1TgauWUr
 YthA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX7rRmKEMeTSNjIM0QOAEhhlNIbB/+IzepY+2PHyi9e0oEKeCLcCfGM/6ayuqZuL0Q/nM4sPB6zv2I=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxz+wtnUqW1YY/3hXhQ0dSClFHJ+BQl2hci1PVV9Hb9dhSwiDrr
 YxVKFSG6JVEeDDC3GEo7SQJaTYXd/VFmq6JfQ1w608/BN+27JzrNFN7+vlTN9SQgsvfG0BU+yQ9
 xSf4VNsTLEBeDGfPRAA==
X-Google-Smtp-Source: AGHT+IE81vOe3lF3Q9HAiE1tAlqMVP84gxQgFX6xDbenk+VWIFgDGNBFMwKCHBju2vp5v0tvD1PRFr8A05p7R1A=
X-Received: from edo22.prod.google.com ([2002:a05:6402:52d6:b0:617:9713:6b2c])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:27c7:b0:617:b4ce:9d48 with SMTP id
 4fb4d7f45d1cf-61c1b708c8amr1890750a12.26.1755854930000; 
 Fri, 22 Aug 2025 02:28:50 -0700 (PDT)
Date: Fri, 22 Aug 2025 09:28:25 +0000
In-Reply-To: <20250822-gpuva-mutex-in-gem-v2-0-c41a10d1d3b9@google.com>
Mime-Version: 1.0
References: <20250822-gpuva-mutex-in-gem-v2-0-c41a10d1d3b9@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp;
 fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=4671; i=aliceryhl@google.com; 
 h=from:subject:message-id;
 bh=PXzH6D27ejnFW1kfBtz8z7koA1/45HNd1QgE8a5IH60=; 
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBoqDhNFkdUCFnLCzTxX9L1OCDaI309mAZ5aNQku
 U139j2Nfe2JAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaKg4TQAKCRAEWL7uWMY5
 RgsNEACi3Y6feRIY6sBuKb23tinwq23L8T+85OmKG7u2LpgibYo6zXf6cZAkNCedH+eTv8OtlM/
 UvY+RcQNvuD+7H1g1FIP1OEP7PSS7j/DXvkyHoTM7Z6yAdEQ1z8oMsm2SUHSS+/7K5X38PQ8Q0G
 HrLQKdbgsKBQPrT7/S7TjZl1WMX5+ZbynZXzewuwX7ceyVdMrWKDzqr3CohBPWv74i1sC1rKcR8
 VmjEWJ34BXDlqqBdwOArqb6gjq+ssFz6YMI3X0Wtc0lzXNhS0mNWG5E+JGod06Cf+dAfF09DL8q
 7XcfDO2n3xDQQvhfPGtO/+mb2liLFFAPmsYzWKOtQhx921pQ/kP13KfRw1vujIB14kVYDluj/e7
 2eHwR9puo4BYOozLSSxNL8xnnivse/4G8NWATIBYSIB8nt2Qxkyc7zdIS4QPes08NUcKnUIqIW6
 0P7rJLzEOYMVs0ouQUI1m4R+4kguLNxen/rmAxXASIYKjhcGbA7NaaMVYWKvcbtESmAic/vInzq
 C7Rv6daJSKKA4yQs0Kbs1Hekxfuny0Ni/Bnh8IyDsVEzQCEe9GjNgSEa91iJNT7IQEE0yAg0JuJ
 APJv4fwGP3NSqB7Y+YbLgS1i0t4uEoXlaCmDLa+EZCC9pMKckt36wZ6YyIgE+Rlr0RXmxSZh9FS
 l7g8Fk1KYpNbA/g==
X-Mailer: b4 0.14.2
Message-ID: <20250822-gpuva-mutex-in-gem-v2-2-c41a10d1d3b9@google.com>
Subject: [PATCH v2 2/3] panthor: use drm_gem_object.gpuva.lock instead of
 gpuva_list_lock
From: Alice Ryhl <aliceryhl@google.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Danilo Krummrich <dakr@kernel.org>,
 Boris Brezillon <boris.brezillon@collabora.com>, 
 Daniel Almeida <daniel.almeida@collabora.com>,
 Steven Price <steven.price@arm.com>, 
 Liviu Dudau <liviu.dudau@arm.com>, Rob Clark <robin.clark@oss.qualcomm.com>, 
 Rob Herring <robh@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, 
 "=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>
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

Now that drm_gem_object has a dedicated mutex for the gpuva list that is
intended to be used in cases that must be fence signalling safe, use it
in Panthor.

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 drivers/gpu/drm/panthor/panthor_gem.c |  4 +---
 drivers/gpu/drm/panthor/panthor_gem.h | 12 ------------
 drivers/gpu/drm/panthor/panthor_mmu.c | 16 ++++++++--------
 3 files changed, 9 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_gem.c b/drivers/gpu/drm/panthor/panthor_gem.c
index a123bc740ba1460f96882206f598b148b64dc5f6..c654a3377903cf7e067becdb481fb14895a4eaa5 100644
--- a/drivers/gpu/drm/panthor/panthor_gem.c
+++ b/drivers/gpu/drm/panthor/panthor_gem.c
@@ -74,7 +74,6 @@ static void panthor_gem_free_object(struct drm_gem_object *obj)
 	mutex_destroy(&bo->label.lock);
 
 	drm_gem_free_mmap_offset(&bo->base.base);
-	mutex_destroy(&bo->gpuva_list_lock);
 	drm_gem_shmem_free(&bo->base);
 	drm_gem_object_put(vm_root_gem);
 }
@@ -246,8 +245,7 @@ struct drm_gem_object *panthor_gem_create_object(struct drm_device *ddev, size_t
 
 	obj->base.base.funcs = &panthor_gem_funcs;
 	obj->base.map_wc = !ptdev->coherent;
-	mutex_init(&obj->gpuva_list_lock);
-	drm_gem_gpuva_set_lock(&obj->base.base, &obj->gpuva_list_lock);
+	drm_gem_gpuva_set_lock(&obj->base.base, &obj->base.base.gpuva.lock);
 	mutex_init(&obj->label.lock);
 
 	panthor_gem_debugfs_bo_init(obj);
diff --git a/drivers/gpu/drm/panthor/panthor_gem.h b/drivers/gpu/drm/panthor/panthor_gem.h
index 8fc7215e9b900ed162e03aebeae999fda00eeb7a..80c6e24112d0bd0f1561ae4d2224842afb735a59 100644
--- a/drivers/gpu/drm/panthor/panthor_gem.h
+++ b/drivers/gpu/drm/panthor/panthor_gem.h
@@ -79,18 +79,6 @@ struct panthor_gem_object {
 	 */
 	struct drm_gem_object *exclusive_vm_root_gem;
 
-	/**
-	 * @gpuva_list_lock: Custom GPUVA lock.
-	 *
-	 * Used to protect insertion of drm_gpuva elements to the
-	 * drm_gem_object.gpuva.list list.
-	 *
-	 * We can't use the GEM resv for that, because drm_gpuva_link() is
-	 * called in a dma-signaling path, where we're not allowed to take
-	 * resv locks.
-	 */
-	struct mutex gpuva_list_lock;
-
 	/** @flags: Combination of drm_panthor_bo_flags flags. */
 	u32 flags;
 
diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/panthor/panthor_mmu.c
index 2003b91a84097d419484c284c2d6241a82b5cde2..2881942ab5115686803fb9d9036bc059d56b7fa3 100644
--- a/drivers/gpu/drm/panthor/panthor_mmu.c
+++ b/drivers/gpu/drm/panthor/panthor_mmu.c
@@ -1107,9 +1107,9 @@ static void panthor_vm_bo_put(struct drm_gpuvm_bo *vm_bo)
 	 * GEM vm_bo list.
 	 */
 	dma_resv_lock(drm_gpuvm_resv(vm), NULL);
-	mutex_lock(&bo->gpuva_list_lock);
+	mutex_lock(&bo->base.base.gpuva.lock);
 	unpin = drm_gpuvm_bo_put(vm_bo);
-	mutex_unlock(&bo->gpuva_list_lock);
+	mutex_unlock(&bo->base.base.gpuva.lock);
 	dma_resv_unlock(drm_gpuvm_resv(vm));
 
 	/* If the vm_bo object was destroyed, release the pin reference that
@@ -1282,9 +1282,9 @@ static int panthor_vm_prepare_map_op_ctx(struct panthor_vm_op_ctx *op_ctx,
 	 * calling this function.
 	 */
 	dma_resv_lock(panthor_vm_resv(vm), NULL);
-	mutex_lock(&bo->gpuva_list_lock);
+	mutex_lock(&bo->base.base.gpuva.lock);
 	op_ctx->map.vm_bo = drm_gpuvm_bo_obtain_prealloc(preallocated_vm_bo);
-	mutex_unlock(&bo->gpuva_list_lock);
+	mutex_unlock(&bo->base.base.gpuva.lock);
 	dma_resv_unlock(panthor_vm_resv(vm));
 
 	/* If the a vm_bo for this <VM,BO> combination exists, it already
@@ -2036,10 +2036,10 @@ static void panthor_vma_link(struct panthor_vm *vm,
 {
 	struct panthor_gem_object *bo = to_panthor_bo(vma->base.gem.obj);
 
-	mutex_lock(&bo->gpuva_list_lock);
+	mutex_lock(&bo->base.base.gpuva.lock);
 	drm_gpuva_link(&vma->base, vm_bo);
 	drm_WARN_ON(&vm->ptdev->base, drm_gpuvm_bo_put(vm_bo));
-	mutex_unlock(&bo->gpuva_list_lock);
+	mutex_unlock(&bo->base.base.gpuva.lock);
 }
 
 static void panthor_vma_unlink(struct panthor_vm *vm,
@@ -2048,9 +2048,9 @@ static void panthor_vma_unlink(struct panthor_vm *vm,
 	struct panthor_gem_object *bo = to_panthor_bo(vma->base.gem.obj);
 	struct drm_gpuvm_bo *vm_bo = drm_gpuvm_bo_get(vma->base.vm_bo);
 
-	mutex_lock(&bo->gpuva_list_lock);
+	mutex_lock(&bo->base.base.gpuva.lock);
 	drm_gpuva_unlink(&vma->base);
-	mutex_unlock(&bo->gpuva_list_lock);
+	mutex_unlock(&bo->base.base.gpuva.lock);
 
 	/* drm_gpuva_unlink() release the vm_bo, but we manually retained it
 	 * when entering this function, so we can implement deferred VMA

-- 
2.51.0.rc2.233.g662b1ed5c5-goog

