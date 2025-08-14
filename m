Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93088B26815
	for <lists+dri-devel@lfdr.de>; Thu, 14 Aug 2025 15:53:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0E6710E1FD;
	Thu, 14 Aug 2025 13:53:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="1KLYLVbY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f74.google.com (mail-ed1-f74.google.com
 [209.85.208.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CDEC10E1FD
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Aug 2025 13:53:30 +0000 (UTC)
Received: by mail-ed1-f74.google.com with SMTP id
 4fb4d7f45d1cf-6188b5f947cso826308a12.0
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Aug 2025 06:53:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1755179609; x=1755784409;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=eOHsmkNZ6ajiFO4LnWXyqljxEE3s9K8Dypjb6+pFT1w=;
 b=1KLYLVbYDtTuxYLMXHnfCYGezC1B/BJFT0FD2L8SYm76m865+QKOok9UEuTL2d8tFe
 J9N9nu7HOUqEvpfyHE7BOQwg688G5YlMnovtPPtz4kP9Efm79iznQzN05WbRZ7RCtnTw
 dqbqENLQeinbQeNsdeLAYF4TLtQxYoqAB5y5bZMVTuxEE+HmsE+cfzEid7KK/l8Eprt9
 DIChiBQ9lJn41mdVpShxkRTqQQUUkUiWsp4JZ5VwNk1UOI+wwuUL3T/YrAen2+7PtffE
 00jRMr/m90sJXsF8g/pqivef5QbINF43jH8dPdTOrVaXLGuhsEk4ImaPVWPcp17QElZF
 DhFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755179609; x=1755784409;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=eOHsmkNZ6ajiFO4LnWXyqljxEE3s9K8Dypjb6+pFT1w=;
 b=DX56hlVSWL3jml64zh8EVYJ8Fisexj/rGafquL+a5sGs43NPyv8CxcjBC3e0RPGhmW
 PFl232O2GRVrXshtHHoHQPGAPbit547RA6Rw0O7CE1bpBbQUDPtbqhqgbqW523di2kTY
 MRKhfYYfjNVstu6f3nm2qiyL4eLfuqSKS9qO96utVPP4B97o9NT1xqD5KMmxWpDbf3re
 lzmdkukWir+Ktw4EGQj1pTHdK+er1sAttTe4JuL/jrKDdG1rlK99LAp3eV2vGdW9dM4a
 kKUU0UMfJOk5eB77r19okuprd+gsxSjERImW8U6OjaJ4p9pJ/9cO/RTgyCJFyq9LelTM
 VS6w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVU98tVeo9JFIGb7Lak40u17n4L+iCRmZxDjCoMNHsuRri/mJSdwvJOGH2IZZi/q0lxUHRJkn4lHBE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyLussbFApovZBjBtFT2k3yB4IfEoYj0Fcy+FjuMCLNL4fvfqLR
 z5IqFDbJ2zLCI13WT2NzwbYKM4tBSGDntPhBEByABBhrp+kDfKgMyFjKDvKQNoorpZ8ojJTyMrc
 pYug2gYfWhcpBFkR12Q==
X-Google-Smtp-Source: AGHT+IGbuvX24KRWZ6BDbArlEBg7fmfllPH+dSU87Bq+ZSteDZmPgx1B2ORVZuBFNuAwNPDP9arsBIXuELAxObY=
X-Received: from ejbs11.prod.google.com ([2002:a17:906:60b:b0:afc:aee2:e5da])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:906:dc90:b0:af9:acc3:823f with SMTP id
 a640c23a62f3a-afcb995ef91mr274963466b.58.1755179609031; 
 Thu, 14 Aug 2025 06:53:29 -0700 (PDT)
Date: Thu, 14 Aug 2025 13:53:14 +0000
In-Reply-To: <20250814-gpuva-mutex-in-gem-v1-0-e202cbfe6d77@google.com>
Mime-Version: 1.0
References: <20250814-gpuva-mutex-in-gem-v1-0-e202cbfe6d77@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp;
 fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=3449; i=aliceryhl@google.com; 
 h=from:subject:message-id;
 bh=LR+wrgMUBZJQVPTupv5LRDIZs0SCFocRvp1imSI22LU=; 
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBonepU63zgWq1jyZcLcDi0DX7eH+EAfW46ZdNlP
 8SCm8KSwyuJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaJ3qVAAKCRAEWL7uWMY5
 RlqsD/4+7Y/iv8bYMd0BjxVyNgatNJPVJAFR+qKXoPveykuk7AXM2x+xiCFS3vfWHYcIpjBD6Oy
 6T2EDV0Jqy+kgXYsRAbq8pTYZWldvqK7Fwukdva5AxF5CRdICX2Grb6giEi5aa4MRT+ta9RYefp
 EpEb5ID7iY2EltD4VTC0OKmWaYtUmcy2Qp3GvdxPXqv8q2o7CA5en8K6UX2nDo7F1wIvbomS6eC
 IAIc9RRJYDPrnXTu04BFtYtC33QEojuaFc2vrQQB9BrxFmHv+9c6s24k9oXtCqSdm9MB6coB9AQ
 /b8vk2wEWMJOjQFIeM6jji2dlDPVhc54JzslQTFpwImr1LIRfbNHtN+L0dob9obXG0FJ3FT6JWH
 LPTL2QpcNPj3oZbou4DnngHGhy4wbjmhwdRq3pVv0ortoPRYWeGtVC2J6ALbEZgRnZThKYzOEAv
 6rjCsIyf2d/Fc3YSo1+b20qPj2KwC8FpIxsdQHAR/1v7dXi1ipYTINbio00blE4NLdM/gwe6MDm
 DwcOlTyrD34tM2KxYB4Vfeavw7fgZcGbK8T8F+Q+Y22mmalWYLTGDHE1EWaJ+HAbpvSdZd+kWob
 tPH+UQ8J7oNbaUPX5cw65NcVeeul9u1Rx68XKmQu4S0nCcG2MBnQ0sLmF+n0homLUZqjo9nNQCt
 mt1mwbpwiRnhGUQ==
X-Mailer: b4 0.14.2
Message-ID: <20250814-gpuva-mutex-in-gem-v1-1-e202cbfe6d77@google.com>
Subject: [PATCH 1/2] drm_gem: add mutex to drm_gem_object.gpuva
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

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 drivers/gpu/drm/drm_gem.c | 2 ++
 include/drm/drm_gem.h     | 4 +++-
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
index 6a44351e58b7741c358406c8a576b6660b5ca904..24c109ab3fadd5af2e5d9de3fe330b105217a9ce 100644
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
@@ -1057,6 +1058,7 @@ drm_gem_object_free(struct kref *kref)
 	if (WARN_ON(!obj->funcs->free))
 		return;
 
+	mutex_destroy(&obj->gpuva.lock);
 	obj->funcs->free(obj);
 }
 EXPORT_SYMBOL(drm_gem_object_free);
diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
index d3a7b43e2c637b164eba5af7cc2fc8ef09d4f0a4..5934d8dc267a65aaf62d2d025869221cd110b325 100644
--- a/include/drm/drm_gem.h
+++ b/include/drm/drm_gem.h
@@ -403,11 +403,13 @@ struct drm_gem_object {
 	 * Provides the list of GPU VAs attached to this GEM object.
 	 *
 	 * Drivers should lock list accesses with the GEMs &dma_resv lock
-	 * (&drm_gem_object.resv) or a custom lock if one is provided.
+	 * (&drm_gem_object.resv) or a custom lock if one is provided. The
+	 * mutex inside this struct may be used as the custom lock.
 	 */
 	struct {
 		struct list_head list;
 
+		struct mutex lock;
 #ifdef CONFIG_LOCKDEP
 		struct lockdep_map *lock_dep_map;
 #endif

-- 
2.51.0.rc0.215.g125493bb4a-goog

