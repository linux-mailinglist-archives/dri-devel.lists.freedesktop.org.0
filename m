Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CCB2B0B2D8
	for <lists+dri-devel@lfdr.de>; Sun, 20 Jul 2025 02:02:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83DF910E43C;
	Sun, 20 Jul 2025 00:02:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="To/6NIU8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com
 [209.85.215.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 974BA10E378
 for <dri-devel@lists.freedesktop.org>; Sun, 20 Jul 2025 00:02:16 +0000 (UTC)
Received: by mail-pg1-f182.google.com with SMTP id
 41be03b00d2f7-7fd35b301bdso3320390a12.2
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Jul 2025 17:02:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752969736; x=1753574536; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=58f3tD8aPkmsl5w2Gd3Jc7Y+VkmK8hdA51D4qILTFqg=;
 b=To/6NIU8DO7OBWBrXEibnUgsBo1g/oJMReJ12BDsVA4CGC8T6mPg/7s4YnRCd+W4IR
 VWoSxadZsUeR0i6oAmMTXHmYIor+KFeVX36Xz+yByRwYytdYlBFzCbEc/G97Q1mhTnjO
 pq5t78dnqRIhP00fhQqHDE+lI0kxQiudsi3PKoBJdymy8utr8skiI+aLkGT6EsAFR0SN
 imni4UZL+1b1sa9T5o5S1X1OPN9xM/R7zWe4fDD9PSXRLBXA+pYADHra5Tr9rgj8dITn
 M6u9AJBvVNYKan4ikUEemf7aTWZyMvChX7JH71L0eZK+mJtZ10z6DUhgBhs5gYVEXT/G
 Dx0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752969736; x=1753574536;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=58f3tD8aPkmsl5w2Gd3Jc7Y+VkmK8hdA51D4qILTFqg=;
 b=YsWcNwwyXXPgHUXVPlwHw1nXCPzQUa4i9CE12M70AO8SnUv+3hKswDbjdBZcBM/eIz
 fPynMxnnHlqp4nkpaMWC1bZzN6GcHEYey+g07K4TIiVxdg7mv7fyiskPosZOq15mWU4M
 YfoJEHt9yQ0ZJy2j5JwKXzHu2m/dugV2BXcO9esOWkkCIdNDZ+dSvVa2WD3OZyfLmFAt
 YIt11cS1ByfA7lXBT2erACP6s6ziAyW/hSUZDQJGxk2He/AV4khxlw1nfN4CExmv7Zwe
 /lOikVnR1XEAVreJm3rsoVitBZXhI02Phlh77NxVmmBVJjnS99Vu7g6UX/BPhni2d5pQ
 DuTg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXWvUULj3lqfk+yNf/JKJhSP6KYIFt8ZE+AM2PrScj15FfUgr5iOsTHJloZXGK0HQaeezRD80ogDLU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyb/f90IcMzZjX1up9x8pECAB91qNJHFBF3GqDStzAn5j0CQa0j
 VGXnb0m2ndG8JLpDRkcxcFK9QkQWkGGdQTu0N0/G0zqw6HMdi6o8CT6M
X-Gm-Gg: ASbGncuXv8Lq5uCnh484+wvSIMzdNhU9YvdAmFtuMjqWX0O3Rf6VgLWY5H/xXuCe1Nv
 VBObe/MSQV6DLhDAk8itkw8lQQQTlo3mHxvw6Sag0Re47xEmQl03fiGiE9pfy+Z+cXXJo5D1LBq
 QDjSpqtcQICDU5Zji2UiWWY/WiLwgHZrGmA1+HEtXRIF2jGsLmwkYO2ioNs8rUcXqkV8QaX67xp
 y/nkz7Db/7czSTgKYvARPKoaQncsVbjc81i/B1hGrGQs/Bizyjr27JvQpV0W5kznQETuQCvTEKL
 xOWRfWz5cQCuHtvW1R4w0JCEGwfRjx5udXsPPxK3MAAPw3OahI9+WTXyVRRHKkyl6RDVBDTSL7t
 XU9FgvdaV1BG+qjEh7j5Dt7OVSCkGinec2b9UOmQBPKsEfKpZRo0/
X-Google-Smtp-Source: AGHT+IG7aiwX/LxwDcgqsWHtJ3RqmQqG9q/LvmOIMnalP+OJlsLNCbZzZqEvjL/4wT5Ii8TtkPIJvw==
X-Received: by 2002:a17:90b:2650:b0:311:baa0:89ce with SMTP id
 98e67ed59e1d1-31c9f3fc33bmr23604543a91.12.1752969736028; 
 Sat, 19 Jul 2025 17:02:16 -0700 (PDT)
Received: from localhost (111-252-5-201.dynamic-ip.hinet.net. [111.252.5.201])
 by smtp.gmail.com with UTF8SMTPSA id
 98e67ed59e1d1-31cc3f2e1fesm3575853a91.31.2025.07.19.17.02.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Jul 2025 17:02:15 -0700 (PDT)
From: Chia-I Wu <olvaffe@gmail.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH 7/9] drm/panthor: capture VMA state for devcoredump
Date: Sat, 19 Jul 2025 17:01:44 -0700
Message-ID: <20250720000146.1405060-8-olvaffe@gmail.com>
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
In-Reply-To: <20250720000146.1405060-1-olvaffe@gmail.com>
References: <20250720000146.1405060-1-olvaffe@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Capture interesting panthor_vma fields for devcoredump.

Because bo->label can change at anytime, we cap it to 32 chars to
simplify size estimation.

Signed-off-by: Chia-I Wu <olvaffe@gmail.com>
---
 drivers/gpu/drm/panthor/panthor_coredump.c | 78 ++++++++++++++++++++--
 drivers/gpu/drm/panthor/panthor_coredump.h | 15 +++++
 drivers/gpu/drm/panthor/panthor_mmu.c      | 43 ++++++++++++
 drivers/gpu/drm/panthor/panthor_mmu.h      |  4 ++
 4 files changed, 135 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_coredump.c b/drivers/gpu/drm/panthor/panthor_coredump.c
index acc8ad4cc498..5502452a5baa 100644
--- a/drivers/gpu/drm/panthor/panthor_coredump.c
+++ b/drivers/gpu/drm/panthor/panthor_coredump.c
@@ -14,6 +14,7 @@
 #include "panthor_coredump.h"
 #include "panthor_device.h"
 #include "panthor_fw.h"
+#include "panthor_gem.h"
 #include "panthor_mmu.h"
 #include "panthor_regs.h"
 #include "panthor_sched.h"
@@ -28,6 +29,7 @@ enum panthor_coredump_mask {
 	PANTHOR_COREDUMP_CSG = BIT(3),
 	PANTHOR_COREDUMP_CS = BIT(4),
 	PANTHOR_COREDUMP_AS = BIT(5),
+	PANTHOR_COREDUMP_VMA = BIT(6),
 };
 
 /**
@@ -45,6 +47,9 @@ struct panthor_coredump {
 	/** @ptdev: Device. */
 	struct panthor_device *ptdev;
 
+	/** @gfp: Allocation flags for panthor_coredump_capture. */
+	gfp_t gfp;
+
 	/** @work: Bottom half of panthor_coredump_capture. */
 	struct work_struct work;
 
@@ -60,6 +65,8 @@ struct panthor_coredump {
 	struct panthor_coredump_csg_state csg;
 	struct panthor_coredump_cs_state cs[MAX_CS_PER_CSG];
 	struct panthor_coredump_as_state as;
+	struct panthor_coredump_vma_state *vma;
+	u32 vma_count;
 
 	/* @data: Serialized coredump data. */
 	void *data;
@@ -92,6 +99,38 @@ static const char *reason_str(enum panthor_coredump_reason reason)
 	}
 }
 
+static void print_vma(struct drm_printer *p,
+		      const struct panthor_coredump_vma_state *vma, u32 vma_id,
+		      size_t *max_dyn_size)
+{
+	struct panthor_gem_object *bo = vma->bo;
+
+	if (!vma_id)
+		drm_puts(p, "vma:\n");
+
+	drm_printf(p, "  - flags: 0x%x\n", vma->flags);
+	drm_printf(p, "    iova: 0x%llx\n", vma->iova);
+	drm_printf(p, "    size: 0x%llx\n", vma->size);
+
+	if (!bo)
+		return;
+
+	/* bo->label is dynamic */
+	if (max_dyn_size) {
+		drm_puts(p, "    label: |\n");
+		drm_puts(p, "      \n");
+		*max_dyn_size += 32;
+	} else {
+		scoped_guard(mutex, &bo->label.lock)
+		{
+			if (bo->label.str) {
+				drm_puts(p, "    label: |\n");
+				drm_printf(p, "      %.32s\n", bo->label.str);
+			}
+		}
+	}
+}
+
 static void print_as(struct drm_printer *p,
 		     const struct panthor_coredump_as_state *as, u32 as_id)
 {
@@ -247,7 +286,8 @@ static void print_header(struct drm_printer *p,
 	drm_printf(p, "  timestamp: %lld\n", ktime_to_ns(header->timestamp));
 }
 
-static void print_cd(struct drm_printer *p, const struct panthor_coredump *cd)
+static void print_cd(struct drm_printer *p, const struct panthor_coredump *cd,
+		     size_t *max_dyn_size)
 {
 	/* in YAML format */
 	drm_puts(p, "---\n");
@@ -277,6 +317,11 @@ static void print_cd(struct drm_printer *p, const struct panthor_coredump *cd)
 
 		print_as(p, &cd->as, as_id);
 	}
+
+	if (cd->mask & PANTHOR_COREDUMP_VMA) {
+		for (u32 i = 0; i < cd->vma_count; i++)
+			print_vma(p, &cd->vma[i], i, max_dyn_size);
+	}
 }
 
 static void process_cd(struct panthor_device *ptdev,
@@ -286,10 +331,13 @@ static void process_cd(struct panthor_device *ptdev,
 		.remain = SSIZE_MAX,
 	};
 	struct drm_printer p = drm_coredump_printer(&iter);
+	size_t max_dyn_size = 0;
 
-	print_cd(&p, cd);
+	print_cd(&p, cd, &max_dyn_size);
+	if (max_dyn_size > iter.remain)
+		return;
 
-	iter.remain = SSIZE_MAX - iter.remain;
+	iter.remain = SSIZE_MAX - iter.remain + max_dyn_size;
 	iter.data = kvmalloc(iter.remain, GFP_USER);
 	if (!iter.data)
 		return;
@@ -297,10 +345,25 @@ static void process_cd(struct panthor_device *ptdev,
 	cd->data = iter.data;
 	cd->size = iter.remain;
 
-	drm_info(&ptdev->base, "generating coredump of size %zu\n", cd->size);
+	drm_info(&ptdev->base, "generating coredump of estimated size %zu\n",
+		 cd->size);
 
 	p = drm_coredump_printer(&iter);
-	print_cd(&p, cd);
+	print_cd(&p, cd, NULL);
+
+	cd->size -= iter.remain;
+
+	/* free vma now */
+	if (cd->mask & PANTHOR_COREDUMP_VMA) {
+		for (u32 i = 0; i < cd->vma_count; i++) {
+			struct panthor_coredump_vma_state *vma = &cd->vma[i];
+
+			drm_gem_object_put(&vma->bo->base.base);
+		}
+		kfree(cd->vma);
+
+		cd->mask &= ~PANTHOR_COREDUMP_VMA;
+	}
 }
 
 static void capture_as(struct panthor_device *ptdev,
@@ -434,6 +497,10 @@ static void capture_cd(struct panthor_device *ptdev,
 
 	capture_as(ptdev, &cd->as, panthor_vm_as(vm));
 	cd->mask |= PANTHOR_COREDUMP_AS;
+
+	cd->vma = panthor_vm_capture_coredump(vm, &cd->vma_count, cd->gfp);
+	if (cd->vma_count)
+		cd->mask |= PANTHOR_COREDUMP_VMA;
 }
 
 static void panthor_coredump_free(void *data)
@@ -504,6 +571,7 @@ panthor_coredump_alloc(struct panthor_device *ptdev,
 	}
 
 	cd->ptdev = ptdev;
+	cd->gfp = gfp;
 	INIT_WORK(&cd->work, panthor_coredump_process_work);
 
 	cd->header.reason = reason;
diff --git a/drivers/gpu/drm/panthor/panthor_coredump.h b/drivers/gpu/drm/panthor/panthor_coredump.h
index 8aceb0c7d0d4..8a89c39cf2f5 100644
--- a/drivers/gpu/drm/panthor/panthor_coredump.h
+++ b/drivers/gpu/drm/panthor/panthor_coredump.h
@@ -10,6 +10,7 @@
 
 struct panthor_coredump;
 struct panthor_device;
+struct panthor_gem_object;
 struct panthor_group;
 
 /**
@@ -135,6 +136,20 @@ struct panthor_coredump_as_state {
 	u64 faultextra;
 };
 
+/**
+ * struct panthor_coredump_vma_state - Coredump VMA state
+ *
+ * Interesting panthor_vma fields.
+ */
+struct panthor_coredump_vma_state {
+	u32 flags;
+	u64 iova;
+	u64 size;
+
+	struct panthor_gem_object *bo;
+	u64 bo_offset;
+};
+
 #ifdef CONFIG_DEV_COREDUMP
 
 struct panthor_coredump *
diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/panthor/panthor_mmu.c
index b39ea6acc6a9..a857a0dd1099 100644
--- a/drivers/gpu/drm/panthor/panthor_mmu.c
+++ b/drivers/gpu/drm/panthor/panthor_mmu.c
@@ -27,6 +27,7 @@
 #include <linux/shmem_fs.h>
 #include <linux/sizes.h>
 
+#include "panthor_coredump.h"
 #include "panthor_device.h"
 #include "panthor_gem.h"
 #include "panthor_heap.h"
@@ -2694,6 +2695,48 @@ int panthor_vm_prepare_mapped_bos_resvs(struct drm_exec *exec, struct panthor_vm
 	return drm_gpuvm_prepare_objects(&vm->base, exec, slot_count);
 }
 
+struct panthor_coredump_vma_state *
+panthor_vm_capture_coredump(struct panthor_vm *vm, u32 *vma_count, gfp_t gfp)
+{
+	struct drm_gpuva *gpuva;
+	u32 count;
+
+	guard(mutex)(&vm->op_lock);
+
+	count = 0;
+	drm_gpuvm_for_each_va(gpuva, &vm->base)
+		count++;
+
+	struct panthor_coredump_vma_state *states =
+		kcalloc(count, sizeof(*states), gfp);
+	if (!states) {
+		*vma_count = 0;
+		return NULL;
+	}
+
+	count = 0;
+	drm_gpuvm_for_each_va(gpuva, &vm->base) {
+		const struct panthor_vma *vma =
+			container_of(gpuva, struct panthor_vma, base);
+		struct panthor_coredump_vma_state *state = &states[count];
+
+		state->flags = vma->flags;
+		state->iova = vma->base.va.addr;
+		state->size = vma->base.va.range;
+		if (vma->base.gem.obj) {
+			state->bo = to_panthor_bo(vma->base.gem.obj);
+			state->bo_offset = vma->base.gem.offset;
+			drm_gem_object_get(&state->bo->base.base);
+		}
+
+		count++;
+	}
+
+	*vma_count = count;
+
+	return states;
+}
+
 /**
  * panthor_mmu_unplug() - Unplug the MMU logic
  * @ptdev: Device.
diff --git a/drivers/gpu/drm/panthor/panthor_mmu.h b/drivers/gpu/drm/panthor/panthor_mmu.h
index fc274637114e..c775b92d0502 100644
--- a/drivers/gpu/drm/panthor/panthor_mmu.h
+++ b/drivers/gpu/drm/panthor/panthor_mmu.h
@@ -10,6 +10,7 @@
 struct drm_exec;
 struct drm_sched_job;
 struct drm_memory_stats;
+struct panthor_coredump_vma_state;
 struct panthor_gem_object;
 struct panthor_heap_pool;
 struct panthor_vm;
@@ -97,6 +98,9 @@ void panthor_vm_update_resvs(struct panthor_vm *vm, struct drm_exec *exec,
 			     enum dma_resv_usage private_usage,
 			     enum dma_resv_usage extobj_usage);
 
+struct panthor_coredump_vma_state *
+panthor_vm_capture_coredump(struct panthor_vm *vm, u32 *vma_count, gfp_t gfp);
+
 int panthor_mmu_pt_cache_init(void);
 void panthor_mmu_pt_cache_fini(void);
 
-- 
2.50.0.727.gbf7dc18ff4-goog

