Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AF5AB26817
	for <lists+dri-devel@lfdr.de>; Thu, 14 Aug 2025 15:53:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D468510E891;
	Thu, 14 Aug 2025 13:53:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="IqGBdVx3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com
 [209.85.221.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E21C210E891
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Aug 2025 13:53:31 +0000 (UTC)
Received: by mail-wr1-f73.google.com with SMTP id
 ffacd0b85a97d-3b9e418a883so393188f8f.3
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Aug 2025 06:53:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1755179610; x=1755784410;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=XYenbqOTOpUfkHsfqbO9ECo5eK5dIeNTgWkJCZso5Iw=;
 b=IqGBdVx3WZrlWm99UtZXDfji9CaTn0ViNzi028PRxuI+IFisgLV/UjUZp9ecxEFJHo
 C7iVmIRprJX8Y52WRNa2C3ZEazB9JN7+KPrDz7VNuY0I0ZpFQgmgHBeFIgxnJjfGqNzL
 85ty0lWQzPTu9paECz8y8Ol8TWPbBUI2vSnKACW9IvaIdW2DeJTFtOWVIji38uaBNkfR
 FyCtVf42kA1gpXiznNdRArhTnZ/W3zuKgzdb1uYnWd/dz2//rlF3kwcCYMzk3dHpsA3K
 fpX/LmlvbN0ltddGj8bWxqpgGZCcQFOwjE67NxgRt6VI67N5tqZWslinBgHJx7ZUq2Ud
 YG4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755179610; x=1755784410;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=XYenbqOTOpUfkHsfqbO9ECo5eK5dIeNTgWkJCZso5Iw=;
 b=APGbSNxX9Q9jjqIgLgJF8CvTIOAf/qZaECySutVctupG/eRNv3PZy2QEJl6nevdqqW
 SfQnyqEQiUsyOK8G0o9RjGk8OLvkcBARypDMUcAcaFrFpUPcj9Je21AVykJ9+Sd/lAMA
 3oQMz9aNrjFR2jWwWy0A0K7iT+44AuCbA/J1XNzIzyaE30LxHzTnGaB3vRs1HiGuhAiC
 9bKuaCrqYtqorWeuhu/UZHpblSdmryALQVeFRoCgDzZXL0FEhqsX/jbjqN/lJ9FIiHvQ
 4VTi/NShtsLgnhnGhhubUoQo9HMNPda8crvGiyP2EJciC6VJJKX9P+9VIrnYU72e+hEl
 cDfg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVsbtJ+vIColN+wCJOCexqo9SZVyKh/cGLhLILQglmOGnEQhs8V7Zfi4WITkai8cbORT24wTDJ4TUg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyz+JqhNLPOmZ9iTQ76icR6u0H0ptsBS7QlEDlJynNGmC0wI+Ga
 4E+/3YdyE9zzWexyQjxnqOKFpF9TbuvNGPpUcoOQThVaQw6V2tIcInhenmWUhhKSlEkJiKpQe0q
 vJy9FLO4jdGZaNmNwMg==
X-Google-Smtp-Source: AGHT+IHjFvugaaT39rs+Few2Au2DyR4dI8P3XYhfyJjMtCWojx1WUn1zy0tKslkpao2uUAls3VBSCjMA5LAW2EI=
X-Received: from wmbez13.prod.google.com
 ([2002:a05:600c:83cd:b0:456:1194:a7e7])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:4382:b0:3a4:f70e:abda with SMTP id
 ffacd0b85a97d-3ba50c8c664mr2477873f8f.10.1755179610295; 
 Thu, 14 Aug 2025 06:53:30 -0700 (PDT)
Date: Thu, 14 Aug 2025 13:53:15 +0000
In-Reply-To: <20250814-gpuva-mutex-in-gem-v1-0-e202cbfe6d77@google.com>
Mime-Version: 1.0
References: <20250814-gpuva-mutex-in-gem-v1-0-e202cbfe6d77@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp;
 fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=4609; i=aliceryhl@google.com; 
 h=from:subject:message-id;
 bh=Ys8zr7p5E/pxehMYheQ03XdY7hgmdwtMJ8X4xdLEP5w=; 
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBonepUMfvSgfkIDEOYXLox3MvOXoRh14yydHLxA
 wjofl+zw32JAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaJ3qVAAKCRAEWL7uWMY5
 RhO0D/wIMga8/2gOGjfBWqD3J9KldnWfbEhUcZdZ4xADV9l6DG/tL6UIizHx5cuq1iI7cAAffeA
 mNPzj6dy8gV5M3SOWI9y1rl1KQNm2alIpwbmiy7KlW2hKD4GksUhiDsxN0NiK8z4XtIDal++j1P
 3Z798SG1xAtbDL7AEHIiZX9STsE6cuv7TzAPUCTHCaYj/Ga7DJgHzNXDxm9YiM4vAh1p7i8B6sb
 EPoDCQb+V9I2R4UwYkwJD+rV68Qgk2xhmhvzOCQu3DxrGw1heQzNU5bd/41FlxhwbcqHEWthgop
 AmlCQhu0c1p9tg4q4tiyptNOTVg+fcApUWeDnbmFgJAM2iOmpxokgPitKFqNdoig85rv/VaCx/G
 InxlcCs4i305CnGVQ7SAyMXXAcsr0CqGYmDRUMq+407wGRNIwVgC+zMQ6VOrvNIIJtFePylIaN0
 RhXZ+eRtY8cQd7b0vE1WxlEylKNEsQh9qNFr6DV5o9D7aKfXLaMEe1j8Xi/07lenbd0EFtSnfkd
 eTT0dnAIN9JLSTIePU4tviyIbNMYNGlpY6aYqrNJtZQzU9tPQKqmWYmExN5EELuzJxDa6qNi1ey
 cRUPSI/3gFuX9iOZ42gEDbB6qHhCWgR3x8eUS99kx9N5gF170kLP+tc52Jc5kwdfP2bV2FKvW7v
 upQapiheJ/4rk/A==
X-Mailer: b4 0.14.2
Message-ID: <20250814-gpuva-mutex-in-gem-v1-2-e202cbfe6d77@google.com>
Subject: [PATCH 2/2] panthor: use drm_gem_object.gpuva.lock instead of
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
index 4140f697ba5af5769492d3bbb378e18aec8ade98..49ca416c7c2c5a01ab0513029697ba9c7a35832d 100644
--- a/drivers/gpu/drm/panthor/panthor_mmu.c
+++ b/drivers/gpu/drm/panthor/panthor_mmu.c
@@ -1074,9 +1074,9 @@ static void panthor_vm_bo_put(struct drm_gpuvm_bo *vm_bo)
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
@@ -1249,9 +1249,9 @@ static int panthor_vm_prepare_map_op_ctx(struct panthor_vm_op_ctx *op_ctx,
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
@@ -2003,10 +2003,10 @@ static void panthor_vma_link(struct panthor_vm *vm,
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
@@ -2015,9 +2015,9 @@ static void panthor_vma_unlink(struct panthor_vm *vm,
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
2.51.0.rc0.215.g125493bb4a-goog

