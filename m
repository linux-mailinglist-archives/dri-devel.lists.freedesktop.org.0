Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E96AB383CA
	for <lists+dri-devel@lfdr.de>; Wed, 27 Aug 2025 15:39:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5A0810E826;
	Wed, 27 Aug 2025 13:38:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="t5cJRkJW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com
 [209.85.128.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D82C910E821
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Aug 2025 13:38:49 +0000 (UTC)
Received: by mail-wm1-f73.google.com with SMTP id
 5b1f17b1804b1-45a1b0098c0so47060855e9.0
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Aug 2025 06:38:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1756301928; x=1756906728;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=bQfNPALqYK2vuHk+KHixItNQWnKvg0esLykXcwvhImI=;
 b=t5cJRkJWRav491G2vaEl8o7lYeK4zWzKhIDgIkcxA9p0h1XYqvwLZtYMkzs9HcvnV5
 dzct86Vl/7vAocryhXt/LUldH8OenUF1XRVQEXfIAemZj6xQ9NX+aeJAeflMUoM/N/+5
 vG5UVeD7+vVCMxhu3qjQiDfX2nIi7oYWK2TlqmUy66Hz1OihDn94e31q6mWcogxh+fX8
 s+nsu8f8dnmbEu/094Lc62wS55bkRZ4aSVchIdX43s40Vbfh1UMqt7ut1/pE3+Hu3IOB
 1xSfR/k9woDNT31VTbIW8QYeQTShOXFJ+60aIzFm6vRMHnatx1NnKHUNM6fniggK4Cwq
 DqGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756301928; x=1756906728;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bQfNPALqYK2vuHk+KHixItNQWnKvg0esLykXcwvhImI=;
 b=VPw+qxs/+ZX5ZDdJ/Ce6kI+S8qFUfydGsPZrx9OIrjN8ExUobh8ybWVrepX5k4U436
 ma90VsyYxsFIrMdjJoJJ6bKIrKx++Bt7iQaD44eka20VN4dE6jcek3kveKNZiOdu8beO
 cV2p5lQxc851g0wc1+tqO9kUEHoD7101wgPAsn7n7BwhK2GyH6r969pmPkm5uql00SG1
 xgl8nD2avsj+sn/FIeOl6ByAuImIVTbR7rXc5TrYq6JJIa35uNc6wVpp8P4/xPepgE6C
 1EO4ftw8P5biotMxw5VffDmIFLFHyGx97vgsyLhmg0YeG9mc/Oyf6bs0spzmLF8CpVen
 PHoA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUa8uhVv2pdTnMsp+Awp/IWY8TwHX9IifsqqlnQtA60Iv48gyzvdFiOJT9ld2tnzup2kv6YSHOjAbk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxlvFIAyDpqiAWQMNh73UyZWP2YTLEMgQKqtI/fbVD4vd9A9lnU
 NzEyt3k57BbsYZAOfHhdwIqSs1i3Rsi7lwL2fGfBydANPLovl2ZXY/5iHz9pkxedfBDGbMOmMo+
 9ZOosVdYQk+NTx2PUww==
X-Google-Smtp-Source: AGHT+IFPZWyvgMauxlJCBZKG51BQuD0rK7uUxpmPXaWTo5px4hek1IeITTzy5FZDFZFtg2EjVIQLfDcGnZLxnBQ=
X-Received: from wmnj6.prod.google.com ([2002:a05:600c:746:b0:45b:7243:7e17])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3b93:b0:459:d780:3604 with SMTP id
 5b1f17b1804b1-45b75d6049dmr1493745e9.3.1756301928171; 
 Wed, 27 Aug 2025 06:38:48 -0700 (PDT)
Date: Wed, 27 Aug 2025 13:38:37 +0000
In-Reply-To: <20250827-gpuva-mutex-in-gem-v3-0-bd89f5a82c0d@google.com>
Mime-Version: 1.0
References: <20250827-gpuva-mutex-in-gem-v3-0-bd89f5a82c0d@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp;
 fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=4138; i=aliceryhl@google.com; 
 h=from:subject:message-id;
 bh=KwFYll6+s4nlGHPxUp1+qnAKQ5iyOSPmtnFxynZNuFE=; 
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBorwplavqOFRjfJ447BgNpHjo5GjbzOko8NDcjI
 d/+jyDq8cGJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaK8KZQAKCRAEWL7uWMY5
 Rn15D/4zkmBMFMYN9f5D+2qu/UJz9DT56FDBe3we7NrQJKXSuwUTQUHFM1tv5Y3Pqrblw9eg5ZE
 U1pWxrWMVemYlF6yGvoddGUjFyOxrj8pMPk2vcsHX+F3DoiW12+Ld+s1eXpdj5KgbLcrMVQsvVU
 E/Ny8EUKE7BCyT60NveKnu9DyrPFhXJpjOQ384isZJaOzboz07gXy6WYkctg0lniNhjQN1eMyGY
 zA8KK1WNI5dDeuc1M6C497NoKEtGW+DXpG+KtK9LM/S/NJRjwW9hiGtHXtOs/nRKWSbrI+tV6lK
 SCfb3cgqSdNz4Wo/bdSAFY2u5mr5EYCZKj3FUvKOLiDTCwprdzRX6QwXwVs+pC6xb0S/lmv2jG1
 IjDVdjYmSiz9kna2EvWy//9iCciKF9J0t4FK/wED5QHhvOB4kzerg646JonH4ehsKzDNHk1uOhb
 xayI8vCoeYFHzwFcWwnHwlRbw3lUwd9tFzsdBgw8xOtdw9G8pKcWXFAqwon7YArrPUQRg9qgCbq
 FcR1MEh6ELJXo85P/JMIsF8NWAK2E+bRaMZDRSarZtTrie6ulS4h9Gn7mq9XDXz1Jf4QjLIwsb/
 zQhybh4eEiHCYo9dRoeOUFLaTdJ5ZItfXH2aGB7/qITwCXI9O/QyviGsZUZ2purEpx26JNovAkG
 MW9kxFiag2/Uq8g==
X-Mailer: b4 0.14.2
Message-ID: <20250827-gpuva-mutex-in-gem-v3-1-bd89f5a82c0d@google.com>
Subject: [PATCH v3 1/3] drm_gem: add mutex to drm_gem_object.gpuva
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

There are two main ways that GPUVM might be used:

* staged mode, where VM_BIND ioctls update the GPUVM immediately so that
  the GPUVM reflects the state of the VM *including* staged changes that
  are not yet applied to the GPU's virtual address space.
* immediate mode, where the GPUVM state is updated during run_job(),
  i.e., in the DMA fence signalling critical path, to ensure that the
  GPUVM and the GPU's virtual address space has the same state at all
  times.

Currently, only Panthor uses GPUVM in immediate mode, but the Rust
drivers Tyr and Nova will also use GPUVM in immediate mode, so it is
worth to support both staged and immediate mode well in GPUVM. To use
immediate mode, the GEMs gpuva list must be modified during the fence
signalling path, which means that it must be protected by a lock that is
fence signalling safe.

For this reason, a mutex is added to struct drm_gem_object that is
intended to achieve this purpose. Adding it directly in the GEM object
both makes it easier to use GPUVM in immediate mode, but also makes it
possible to take the gpuva lock from core drm code.

As a follow-up, another change that should probably be made to support
immediate mode is a mechanism to postpone cleanup of vm_bo objects, as
dropping a vm_bo object in the fence signalling path is problematic for
two reasons:

* When using DRM_GPUVM_RESV_PROTECTED, you cannot remove the vm_bo from
  the extobj/evicted lists during the fence signalling path.
* Dropping a vm_bo could lead to the GEM object getting destroyed.
  The requirement that GEM object cleanup is fence signalling safe is
  dubious and likely to be violated in practice.

Panthor already has its own custom implementation of postponing vm_bo
cleanup.

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 drivers/gpu/drm/drm_gem.c |  2 ++
 include/drm/drm_gem.h     | 24 ++++++++++++++++++------
 2 files changed, 20 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
index 4a89b6acb6af39720451ac24033b89e144d282dc..8d25cc65707d5b44d931beb0207c9d08a3e2de5a 100644
--- a/drivers/gpu/drm/drm_gem.c
+++ b/drivers/gpu/drm/drm_gem.c
@@ -187,6 +187,7 @@ void drm_gem_private_object_init(struct drm_device *dev,
 	kref_init(&obj->refcount);
 	obj->handle_count = 0;
 	obj->size = size;
+	mutex_init(&obj->gpuva.lock);
 	dma_resv_init(&obj->_resv);
 	if (!obj->resv)
 		obj->resv = &obj->_resv;
@@ -210,6 +211,7 @@ void drm_gem_private_object_fini(struct drm_gem_object *obj)
 	WARN_ON(obj->dma_buf);
 
 	dma_resv_fini(&obj->_resv);
+	mutex_destroy(&obj->gpuva.lock);
 }
 EXPORT_SYMBOL(drm_gem_private_object_fini);
 
diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
index d3a7b43e2c637b164eba5af7cc2fc8ef09d4f0a4..a995c0c1b63c5946b1659cec08c360a5bb9e9fba 100644
--- a/include/drm/drm_gem.h
+++ b/include/drm/drm_gem.h
@@ -398,16 +398,28 @@ struct drm_gem_object {
 	struct dma_resv _resv;
 
 	/**
-	 * @gpuva:
-	 *
-	 * Provides the list of GPU VAs attached to this GEM object.
-	 *
-	 * Drivers should lock list accesses with the GEMs &dma_resv lock
-	 * (&drm_gem_object.resv) or a custom lock if one is provided.
+	 * @gpuva: Fields used by GPUVM to manage mappings pointing to this GEM object.
 	 */
 	struct {
+		/**
+		 * @gpuva.list: list of GPUVM mappings attached to this GEM object.
+		 *
+		 * Drivers should lock list accesses with either the GEMs
+		 * &dma_resv lock (&drm_gem_object.resv) or the
+		 * &drm_gem_object.gpuva.lock mutex.
+		 */
 		struct list_head list;
 
+		/**
+		 * @gpuva.lock: lock protecting access to &drm_gem_object.gpuva.list
+		 * when the resv lock can't be used.
+		 *
+		 * Should only be used when the VM is being modified in a fence
+		 * signalling path, otherwise you should use &drm_gem_object.resv to
+		 * protect accesses to &drm_gem_object.gpuva.list.
+		 */
+		struct mutex lock;
+
 #ifdef CONFIG_LOCKDEP
 		struct lockdep_map *lock_dep_map;
 #endif

-- 
2.51.0.261.g7ce5a0a67e-goog

