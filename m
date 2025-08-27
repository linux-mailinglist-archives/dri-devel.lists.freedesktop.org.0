Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19071B383C8
	for <lists+dri-devel@lfdr.de>; Wed, 27 Aug 2025 15:38:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D147710E821;
	Wed, 27 Aug 2025 13:38:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="Kw13wE8P";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com
 [209.85.221.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D90A810E821
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Aug 2025 13:38:50 +0000 (UTC)
Received: by mail-wr1-f73.google.com with SMTP id
 ffacd0b85a97d-3c6abcfd303so496703f8f.3
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Aug 2025 06:38:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1756301929; x=1756906729;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=H0LUjaJNCERfnIpEXLt7qPeqC8Z8QMcmQ0x5DWubTsE=;
 b=Kw13wE8PHwT8ridgTqlCXEtC6c+9InXw0yKBAxNSwJzw7DzF4vLK9/4g6gn9urmmjo
 iDSbaG0FzJw3vkHyaDEv+00tSw7TE4Jlb6RjNGex73bgSMnITFjSNtDUG/HveY9gtsIC
 Vrhb2TfY9G6olNuS2+fihwFrF7BrI+BXKHia2UTd/8EZORBOdes5kWqJAuxm40zEyvjd
 KUcLWVweV8I9HvTKAOYcUW+2jsCGEPezo1YugCKu2h/XuBe592VLIVAHa3onDc26cJIi
 b53i26vC1Dd+2MAtX20GFmBL6ZgUMqIgUpoAWNLMqyx4fLeBDwAfHF65aLkdMfqlIQGh
 t8OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756301929; x=1756906729;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=H0LUjaJNCERfnIpEXLt7qPeqC8Z8QMcmQ0x5DWubTsE=;
 b=HZv0NsasFOSli7W/lKlfYz689ncgZfRM0CFi3rDn620QgVhszMWCjUMTQMnml2RS5Z
 DQcVPPLuLptM2ME6NVIpD1ov07MczGexY0WsRnMEhN8nk6AMs/YiFHc4oK52RI7EecYq
 L8Wj8cZHKg+nZ3KuvdkFTp23KTIs74h/QAiFD1fYHLapGfpPdALrE2S/PGEJFtm60z1A
 erT4BWnNIAzUlDvpGwp/ah7KKw2xSQbmRArIwjAh5SN2psJgXgL//PNtFUeBvWxL3Ya4
 Hso6E33a6fXkj23kXHTbPZZ3m0XhrG/d1h/kKhAWsY1T3ab3v3hNj9/AB2FQmDROu43k
 T6sw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUSitLq7wWI9CADJbHIKrr5k7TlFnyAk1oQbWFwsjKAaZP9QumQyakJ39tRuaB3GQKFGaTK3XL7wyo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YweT5SuzVui4j6Q6bf6YdWyRSHqnLQybnXiofBG7YODaE7OwGts
 bGZeQZXP91fAK6nD/FGkq4FW27dtblP52oizPe9f4JUzscV+M5hTaNan+qiLV393lFdRj+WA+jH
 IsqNdHZRvXYEM6KDyKQ==
X-Google-Smtp-Source: AGHT+IGVa7PVy7PXjMz+41KLvLfZ57z1pdtrUqa1nAKHnMHdUPl5XgMWkTXVPv1ZKDQNau4tVBq+F8KPCgsVFPo=
X-Received: from wrsa14.prod.google.com ([2002:adf:face:0:b0:3bb:8d5d:f554])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:adf:f249:0:b0:3cd:4936:7222 with SMTP id
 ffacd0b85a97d-3cd49367a57mr844329f8f.32.1756301929456; 
 Wed, 27 Aug 2025 06:38:49 -0700 (PDT)
Date: Wed, 27 Aug 2025 13:38:38 +0000
In-Reply-To: <20250827-gpuva-mutex-in-gem-v3-0-bd89f5a82c0d@google.com>
Mime-Version: 1.0
References: <20250827-gpuva-mutex-in-gem-v3-0-bd89f5a82c0d@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp;
 fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=4667; i=aliceryhl@google.com; 
 h=from:subject:message-id;
 bh=fxqCLepdjJoG2i/XMA26WTvgMhHanXo5UFmP/6SmsUc=; 
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBorwplBwqLgr6P1T9aVSwRfXFaYBCf/imiAkWRB
 GK0A7i8iw+JAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaK8KZQAKCRAEWL7uWMY5
 Rj52D/wLX0TgtsFem9qRKwgampx8gBAoARjToXXgEsXq4iETGWCHsmsHkLXw15V6qgAz8heVyjb
 gQA417sWwug0le+2dg/dYL5wpWsEFZfC0xAQuWW0LBORi9EWfww3IFU5Ek3R6Z3FME/7cqcJr0P
 ecKJbLGlOeDS4+OrMkfgNsOOzQbXoJuojnlWn2aMDbOnSV2TZvIbZzEn2dbtpVHh2uI+u0+8WvL
 4Nq+GwThibopA8/vsa1W64m03ys0skYBrhRk/z/F4RIDQaWigH8N8NaA9yEG0zQTaqi2sADSgYI
 ktfDbR8tikcbRyPG7IO+nQHtRpxSh5avxWYxfX8nmaPCMyGT/MW8ptpNZZ/YTS2PGPuCnwt/pco
 02tgrWzHzZaf/6SDLjexaadzjgzyrPqRp1YIcaf73NOL+oAnx0PiQa932dn3aK9uJzrjGm221di
 AZjWf6KajMziBCDDb+OhyhLtHCvHdQoMxs2V10I3NdvM78EosQoQieMMs7UYsrjStlVF7PoM7zg
 6A/QfckmicXhdRxmj1k9Z1porMrNMq7W/RHkV0Hrz1xgwCeexTww+OavJUZkHHFpn/nV074vFRK
 s3RWXt6MknVJc+YWFwK5/qJBQlQd129OOlAHBoiupO01wH+25GCYe83ihVJGn04NjJX6AQZSDeW
 TEUQbFa9rodBQiw==
X-Mailer: b4 0.14.2
Message-ID: <20250827-gpuva-mutex-in-gem-v3-2-bd89f5a82c0d@google.com>
Subject: [PATCH v3 2/3] panthor: use drm_gem_object.gpuva.lock instead of
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
2.51.0.261.g7ce5a0a67e-goog

