Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B6EAB0B2D9
	for <lists+dri-devel@lfdr.de>; Sun, 20 Jul 2025 02:02:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A39010E43E;
	Sun, 20 Jul 2025 00:02:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="LPMmFcIy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com
 [209.85.216.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80AB210E43F
 for <dri-devel@lists.freedesktop.org>; Sun, 20 Jul 2025 00:02:14 +0000 (UTC)
Received: by mail-pj1-f47.google.com with SMTP id
 98e67ed59e1d1-31332cff2d5so2602183a91.1
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Jul 2025 17:02:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752969734; x=1753574534; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=AIIypzxyxw4ilus6tCRx6o71Sqrl2VuTVaY8aIA09xM=;
 b=LPMmFcIyMkfXHHytaXp7wFpoaubx2Xu0Mb+7LCurFKaPj9u/pY/+AYGTXiiD+LIIhx
 oXHgq44c2+b8V0CQl//m9FE/FWObG97M09aE+E4J9iLFBDELf0TWAKwBaQG42LV23Kfl
 fNbfA/eRiTJe2xUzAWMVD86o0XpW58LmCSdxiaQR9N6Qa8aQ04klPZwNZJDzpB+8iYAb
 GwKHUgNmT6L7/t42IDnkQ2Ofy8WmAvGFdI9mFRu85/p56Zcff8paALJkB3dV1H7Nlxey
 5gdt96swfjT/OMeS5p0c3P9l3rbF5Bq9KgDYTlSMaZnPmJ4U1/2rUNQEeTCxm3QTuVxM
 Of8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752969734; x=1753574534;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AIIypzxyxw4ilus6tCRx6o71Sqrl2VuTVaY8aIA09xM=;
 b=j+jxNh+zS1LliUg3hqgovWVSIufQFC5ULz+RVTKvo7ZOBU9mNTlu9PuAXkNKPjr3Qr
 20fqxcx/A0q3aEkL+vBl60bCoDNpHnL1IdvVjXJIL7jBKX860bmhTusifoGW+Ve+mmwJ
 2PWoq6weqN/vDpYjauL+tX9qFvB1PIVH4v7GfcXhdnUS7AdTrispSXdo8WttVm3PlEoo
 vPRcWXEFXEFi55gIspFiNskCIBm2Swe8rh+LiOPXhOMxfZYgNZbp44NkRotjMzEsA5hU
 28WP4cZ9JT2ZeSNsN2vqRy4B522T3v4/K3E4qGNH13L7pQhl4tNI9dEp/Kx2D64kL5xs
 XIXw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWt2cARTO0Q4oaa9beOKMqHcdUjWNAzUvuz9ObycQTJUckCqxtAsNtYgRUdZfgZeA4UGAaHC+7bElc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwXZOLVDikKu+4jOTpYQX8+xhFRVSr0PJfPY0U4L/Jp6KFNgrTZ
 SgeNAKt8C3LWKZS1ettYVNpGeJFcOlY8SUpWOxyZ9zJ3a/zRUSMWq+wf
X-Gm-Gg: ASbGnctqpj5R6E/2M4a5MRMgEXaE8l6u7W7iLsePfoRoa8y3RbCyvcw8pz518J5PDUt
 BdJR3IuHaf/ENNppjBAu07KyOc2V2+5gbWAKopTxUvd4Q7LefVMX4najmd+51kaCIG+R0Uzddvr
 sZcTWoto/dwO3tM7/Po3lJjWEpuhN/PuQSi7lr224BV7xWLG8ASIo/s4MLCH5lyJmOz0dL5r6Z2
 PpndqF8b0dicdsuSJ/mL8yxhZTO3028nG7TLJGG6weCUAzcRYOwKIADS36lAPR4wO1MPoRkD648
 37fRxTlWto1YyH6jtmQw2CeJMLco7K+8HvQWkNHXwrq9OP8HdKVT9viEpfS31ABkm4OuAgsbSdr
 rpZ5+/tp5os36koheUuuc9gOGj4S0Y3TUSPnprybMaBgyqwYgOi0I
X-Google-Smtp-Source: AGHT+IENKAtKxiYYD9bXkKzeXW2rcn+4YIt1xanpaUa2JbcOsT+ugDOwm9jl0S5A1UNw1ayq7YzY0g==
X-Received: by 2002:a17:90b:4fcc:b0:312:e1ec:de44 with SMTP id
 98e67ed59e1d1-31c9e77050fmr23930785a91.27.1752969733978; 
 Sat, 19 Jul 2025 17:02:13 -0700 (PDT)
Received: from localhost (111-252-5-201.dynamic-ip.hinet.net. [111.252.5.201])
 by smtp.gmail.com with UTF8SMTPSA id
 98e67ed59e1d1-31cc3f2dbd9sm3583595a91.32.2025.07.19.17.02.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Jul 2025 17:02:13 -0700 (PDT)
From: Chia-I Wu <olvaffe@gmail.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH 6/9] drm/panthor: capture AS state for devcoredump
Date: Sat, 19 Jul 2025 17:01:43 -0700
Message-ID: <20250720000146.1405060-7-olvaffe@gmail.com>
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

Capture interesting MMU_AS_CONTROL regs for devcoredump.

Signed-off-by: Chia-I Wu <olvaffe@gmail.com>
---
 drivers/gpu/drm/panthor/panthor_coredump.c | 33 ++++++++++++++++++++++
 drivers/gpu/drm/panthor/panthor_coredump.h | 11 ++++++++
 drivers/gpu/drm/panthor/panthor_sched.c    |  5 ++++
 drivers/gpu/drm/panthor/panthor_sched.h    |  2 ++
 4 files changed, 51 insertions(+)

diff --git a/drivers/gpu/drm/panthor/panthor_coredump.c b/drivers/gpu/drm/panthor/panthor_coredump.c
index 60d651a8468a..acc8ad4cc498 100644
--- a/drivers/gpu/drm/panthor/panthor_coredump.c
+++ b/drivers/gpu/drm/panthor/panthor_coredump.c
@@ -14,6 +14,7 @@
 #include "panthor_coredump.h"
 #include "panthor_device.h"
 #include "panthor_fw.h"
+#include "panthor_mmu.h"
 #include "panthor_regs.h"
 #include "panthor_sched.h"
 
@@ -26,6 +27,7 @@ enum panthor_coredump_mask {
 	PANTHOR_COREDUMP_GLB = BIT(2),
 	PANTHOR_COREDUMP_CSG = BIT(3),
 	PANTHOR_COREDUMP_CS = BIT(4),
+	PANTHOR_COREDUMP_AS = BIT(5),
 };
 
 /**
@@ -57,6 +59,7 @@ struct panthor_coredump {
 	struct panthor_coredump_glb_state glb;
 	struct panthor_coredump_csg_state csg;
 	struct panthor_coredump_cs_state cs[MAX_CS_PER_CSG];
+	struct panthor_coredump_as_state as;
 
 	/* @data: Serialized coredump data. */
 	void *data;
@@ -89,6 +92,15 @@ static const char *reason_str(enum panthor_coredump_reason reason)
 	}
 }
 
+static void print_as(struct drm_printer *p,
+		     const struct panthor_coredump_as_state *as, u32 as_id)
+{
+	drm_printf(p, "as%d:\n", as_id);
+	drm_printf(p, "  FAULTSTATUS: 0x%x\n", as->faultstatus);
+	drm_printf(p, "  FAULTADDRESS: 0x%llx\n", as->faultaddress);
+	drm_printf(p, "  FAULTEXTRA: 0x%llx\n", as->faultextra);
+}
+
 static void print_cs(struct drm_printer *p,
 		     const struct panthor_coredump_cs_state *cs, u32 cs_id)
 {
@@ -259,6 +271,12 @@ static void print_cd(struct drm_printer *p, const struct panthor_coredump *cd)
 		for (u32 i = 0; i < cd->group.queue_count; i++)
 			print_cs(p, &cd->cs[i], i);
 	}
+
+	if (cd->mask & PANTHOR_COREDUMP_AS) {
+		const u32 as_id = cd->csg.config & 0xf;
+
+		print_as(p, &cd->as, as_id);
+	}
 }
 
 static void process_cd(struct panthor_device *ptdev,
@@ -285,6 +303,14 @@ static void process_cd(struct panthor_device *ptdev,
 	print_cd(&p, cd);
 }
 
+static void capture_as(struct panthor_device *ptdev,
+		       struct panthor_coredump_as_state *as, u32 as_id)
+{
+	as->faultstatus = gpu_read(ptdev, AS_FAULTSTATUS(as_id));
+	as->faultaddress = gpu_read64(ptdev, AS_FAULTADDRESS(as_id));
+	as->faultextra = gpu_read64(ptdev, AS_FAULTEXTRA(as_id));
+}
+
 static void capture_cs(struct panthor_device *ptdev,
 		       struct panthor_coredump_cs_state *cs, u32 csg_id,
 		       u32 cs_id, const struct panthor_group *group)
@@ -374,6 +400,8 @@ static void capture_gpu(struct panthor_device *ptdev,
 static void capture_cd(struct panthor_device *ptdev,
 		       struct panthor_coredump *cd, struct panthor_group *group)
 {
+	struct panthor_vm *vm;
+
 	drm_info(&ptdev->base, "capturing coredump states\n");
 
 	if (group) {
@@ -401,6 +429,11 @@ static void capture_cd(struct panthor_device *ptdev,
 	for (u32 i = 0; i < cd->group.queue_count; i++)
 		capture_cs(ptdev, &cd->cs[i], cd->group.csg_id, i, group);
 	cd->mask |= PANTHOR_COREDUMP_CS;
+
+	vm = panthor_group_vm(group);
+
+	capture_as(ptdev, &cd->as, panthor_vm_as(vm));
+	cd->mask |= PANTHOR_COREDUMP_AS;
 }
 
 static void panthor_coredump_free(void *data)
diff --git a/drivers/gpu/drm/panthor/panthor_coredump.h b/drivers/gpu/drm/panthor/panthor_coredump.h
index 44402c6142cb..8aceb0c7d0d4 100644
--- a/drivers/gpu/drm/panthor/panthor_coredump.h
+++ b/drivers/gpu/drm/panthor/panthor_coredump.h
@@ -124,6 +124,17 @@ struct panthor_coredump_cs_state {
 	u32 active;
 };
 
+/**
+ * struct panthor_coredump_as_state - Coredump AS state
+ *
+ * Interesting MMU_AS_CONTROL regs.
+ */
+struct panthor_coredump_as_state {
+	u32 faultstatus;
+	u64 faultaddress;
+	u64 faultextra;
+};
+
 #ifdef CONFIG_DEV_COREDUMP
 
 struct panthor_coredump *
diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
index 4bc31c5f667d..82e43b7ca7aa 100644
--- a/drivers/gpu/drm/panthor/panthor_sched.c
+++ b/drivers/gpu/drm/panthor/panthor_sched.c
@@ -3726,6 +3726,11 @@ void panthor_group_get_ringbuf_iface(
 	*output_iface = queue->iface.output;
 }
 
+struct panthor_vm *panthor_group_vm(struct panthor_group *group)
+{
+	return group->vm;
+}
+
 int panthor_group_pool_create(struct panthor_file *pfile)
 {
 	struct panthor_group_pool *gpool;
diff --git a/drivers/gpu/drm/panthor/panthor_sched.h b/drivers/gpu/drm/panthor/panthor_sched.h
index 284ba39f958a..0cb58212fd44 100644
--- a/drivers/gpu/drm/panthor/panthor_sched.h
+++ b/drivers/gpu/drm/panthor/panthor_sched.h
@@ -38,6 +38,8 @@ void panthor_group_get_ringbuf_iface(
 	const struct panthor_fw_ringbuf_input_iface **input_iface,
 	const struct panthor_fw_ringbuf_output_iface **output_iface);
 
+struct panthor_vm *panthor_group_vm(struct panthor_group *group);
+
 struct drm_sched_job *
 panthor_job_create(struct panthor_file *pfile,
 		   u16 group_handle,
-- 
2.50.0.727.gbf7dc18ff4-goog

