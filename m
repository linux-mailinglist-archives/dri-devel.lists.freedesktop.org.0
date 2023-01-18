Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6070D6713B0
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jan 2023 07:14:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AC8910E69E;
	Wed, 18 Jan 2023 06:14:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A3BD10E6A3
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jan 2023 06:14:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674022461;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hXHmTxbGZruPdr+kQujRuMeeWZGFqvkt+mVQWkiSsWQ=;
 b=f8AfNqLAnVVGpI1zpvRelY9gRBZuded8UCWJHqIEwju9IqlG6B1YUad+DkS2ZfhTJ+PJmj
 w4+oUx0QBvmE1lpOU5XL6vTrTe/8IFEQ7uoaY7iNQIYhKQTdNSLz7O3OqW8LbWMi29rb0w
 O6hzEvSo4Jsb9cR4w+p/kSBhS1Gvp1U=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-605-821K5NB3NYW3kS8sQj-v0Q-1; Wed, 18 Jan 2023 01:14:20 -0500
X-MC-Unique: 821K5NB3NYW3kS8sQj-v0Q-1
Received: by mail-ej1-f70.google.com with SMTP id
 wz4-20020a170906fe4400b0084c7e7eb6d0so23203640ejb.19
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Jan 2023 22:14:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hXHmTxbGZruPdr+kQujRuMeeWZGFqvkt+mVQWkiSsWQ=;
 b=CqN29g9u5QSr1yKAUlHDXsxErYLIz2F7ct5ffKOqoZkdQMVcBVEW/P8n/TviT6u1s7
 wUMTbXlzs7xFNI8wjpZHmdudw+kBU5BpcN4SPlSQEYU4wEv3jUdXxNs4X/gdCvjC+SPR
 XUn/h5RIF2WFFtlI5Z8CHeFT3xeS+z2ivOFezr/N4upeeDaOnhLLvTRo4Lfob6kAbysV
 BTTPG4rInyTg4qJ29vyb5ZQv+Z6HoCH1jXnzCF3ONPQxkOWH6rPXVbAmkVKY1tdrWVQX
 UBCeaBSCkZzNIZ3haTg0wMtbvvB1LNFzd5PLPrvk9Rx3bnir7Yn1PQwtNK6KYvTiGdc6
 1jSA==
X-Gm-Message-State: AFqh2krn2AbVpry58sq8TYVOCEsYDGp1Qd6qQWaiM/2g1JpniK6/ntZ9
 N3HttopgzM0gOohCf0svVhSpwR4O0JFhylkWS46q+AlH5afFfrdkKQe+oA1n9oVLJa6JehS4Cy1
 fMzXCtvBUZjQoHjNdvM+VElRALLYt
X-Received: by 2002:a17:906:f1d6:b0:86e:7896:80d4 with SMTP id
 gx22-20020a170906f1d600b0086e789680d4mr5740879ejb.49.1674022458915; 
 Tue, 17 Jan 2023 22:14:18 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsIBZSzt+M0AKtqZ1cxJejvIMaLgAOQtuuGHyjelVR9Naz3PxuvOM4pLQTrks0ksLel/sSfUg==
X-Received: by 2002:a17:906:f1d6:b0:86e:7896:80d4 with SMTP id
 gx22-20020a170906f1d600b0086e789680d4mr5740850ejb.49.1674022458437; 
 Tue, 17 Jan 2023 22:14:18 -0800 (PST)
Received: from cassiopeiae.. ([2a02:810d:4b3f:de78:642:1aff:fe31:a19f])
 by smtp.gmail.com with ESMTPSA id
 k15-20020a17090632cf00b0087120324712sm3114542ejk.23.2023.01.17.22.14.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Jan 2023 22:14:17 -0800 (PST)
From: Danilo Krummrich <dakr@redhat.com>
To: daniel@ffwll.ch, airlied@redhat.com, christian.koenig@amd.com,
 bskeggs@redhat.com, jason@jlekstrand.net, tzimmermann@suse.de,
 mripard@kernel.org, corbet@lwn.net
Subject: [PATCH drm-next 13/14] drm/nouveau: implement new VM_BIND UAPI
Date: Wed, 18 Jan 2023 07:12:55 +0100
Message-Id: <20230118061256.2689-14-dakr@redhat.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230118061256.2689-1-dakr@redhat.com>
References: <20230118061256.2689-1-dakr@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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
Cc: nouveau@lists.freedesktop.org, Danilo Krummrich <dakr@redhat.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This commit provides the implementation for the new uapi motivated by the
Vulkan API. It allows user mode drivers (UMDs) to:

1) Initialize a GPU virtual address (VA) space via the new
   DRM_IOCTL_NOUVEAU_VM_INIT ioctl for UMDs to specify the portion of VA
   space managed by the kernel and userspace, respectively.

2) Allocate and free a VA space region as well as bind and unbind memory
   to the GPUs VA space via the new DRM_IOCTL_NOUVEAU_VM_BIND ioctl.
   UMDs can request the named operations to be processed either
   synchronously or asynchronously. It supports DRM syncobjs
   (incl. timelines) as synchronization mechanism. The management of the
   GPU VA mappings is implemented with the DRM GPU VA manager.

3) Execute push buffers with the new DRM_IOCTL_NOUVEAU_EXEC ioctl. The
   execution happens asynchronously. It supports DRM syncobj (incl.
   timelines) as synchronization mechanism. DRM GEM object locking is
   handled with drm_exec.

Both, DRM_IOCTL_NOUVEAU_VM_BIND and DRM_IOCTL_NOUVEAU_EXEC, use the DRM
GPU scheduler for the asynchronous paths.

Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
 Documentation/gpu/driver-uapi.rst       |   3 +
 drivers/gpu/drm/nouveau/Kbuild          |   2 +
 drivers/gpu/drm/nouveau/Kconfig         |   2 +
 drivers/gpu/drm/nouveau/nouveau_abi16.c |  16 +
 drivers/gpu/drm/nouveau/nouveau_abi16.h |   1 +
 drivers/gpu/drm/nouveau/nouveau_drm.c   |  23 +-
 drivers/gpu/drm/nouveau/nouveau_drv.h   |   9 +-
 drivers/gpu/drm/nouveau/nouveau_exec.c  | 310 ++++++++++
 drivers/gpu/drm/nouveau/nouveau_exec.h  |  55 ++
 drivers/gpu/drm/nouveau/nouveau_sched.c | 780 ++++++++++++++++++++++++
 drivers/gpu/drm/nouveau/nouveau_sched.h |  98 +++
 11 files changed, 1295 insertions(+), 4 deletions(-)
 create mode 100644 drivers/gpu/drm/nouveau/nouveau_exec.c
 create mode 100644 drivers/gpu/drm/nouveau/nouveau_exec.h
 create mode 100644 drivers/gpu/drm/nouveau/nouveau_sched.c
 create mode 100644 drivers/gpu/drm/nouveau/nouveau_sched.h

diff --git a/Documentation/gpu/driver-uapi.rst b/Documentation/gpu/driver-uapi.rst
index 9c7ca6e33a68..c08bcbb95fb3 100644
--- a/Documentation/gpu/driver-uapi.rst
+++ b/Documentation/gpu/driver-uapi.rst
@@ -13,4 +13,7 @@ drm/nouveau uAPI
 VM_BIND / EXEC uAPI
 -------------------
 
+.. kernel-doc:: drivers/gpu/drm/nouveau/nouveau_exec.c
+    :doc: Overview
+
 .. kernel-doc:: include/uapi/drm/nouveau_drm.h
diff --git a/drivers/gpu/drm/nouveau/Kbuild b/drivers/gpu/drm/nouveau/Kbuild
index ee281bb76463..cf6b3a80c0c8 100644
--- a/drivers/gpu/drm/nouveau/Kbuild
+++ b/drivers/gpu/drm/nouveau/Kbuild
@@ -47,6 +47,8 @@ nouveau-y += nouveau_prime.o
 nouveau-y += nouveau_sgdma.o
 nouveau-y += nouveau_ttm.o
 nouveau-y += nouveau_vmm.o
+nouveau-y += nouveau_exec.o
+nouveau-y += nouveau_sched.o
 nouveau-y += nouveau_uvmm.o
 
 # DRM - modesetting
diff --git a/drivers/gpu/drm/nouveau/Kconfig b/drivers/gpu/drm/nouveau/Kconfig
index a0bb3987bf63..59e5c13be9b6 100644
--- a/drivers/gpu/drm/nouveau/Kconfig
+++ b/drivers/gpu/drm/nouveau/Kconfig
@@ -10,6 +10,8 @@ config DRM_NOUVEAU
 	select DRM_KMS_HELPER
 	select DRM_TTM
 	select DRM_TTM_HELPER
+	select DRM_EXEC
+	select DRM_SCHED
 	select I2C
 	select I2C_ALGOBIT
 	select BACKLIGHT_CLASS_DEVICE if DRM_NOUVEAU_BACKLIGHT
diff --git a/drivers/gpu/drm/nouveau/nouveau_abi16.c b/drivers/gpu/drm/nouveau/nouveau_abi16.c
index 36cc80eb0e20..694777a58bca 100644
--- a/drivers/gpu/drm/nouveau/nouveau_abi16.c
+++ b/drivers/gpu/drm/nouveau/nouveau_abi16.c
@@ -35,6 +35,7 @@
 #include "nouveau_chan.h"
 #include "nouveau_abi16.h"
 #include "nouveau_vmm.h"
+#include "nouveau_sched.h"
 
 static struct nouveau_abi16 *
 nouveau_abi16(struct drm_file *file_priv)
@@ -125,6 +126,17 @@ nouveau_abi16_chan_fini(struct nouveau_abi16 *abi16,
 {
 	struct nouveau_abi16_ntfy *ntfy, *temp;
 
+	/* When a client exits without waiting for it's queued up jobs to
+	 * finish it might happen that we fault the channel. This is due to
+	 * drm_file_free() calling drm_gem_release() before the postclose()
+	 * callback. Hence, we can't tear down this scheduler entity before
+	 * uvmm mappings are unmapped. Currently, we can't detect this case.
+	 *
+	 * However, this should be rare and harmless, since the channel isn't
+	 * needed anymore.
+	 */
+	nouveau_sched_entity_fini(&chan->sched_entity);
+
 	/* wait for all activity to stop before cleaning up */
 	if (chan->chan)
 		nouveau_channel_idle(chan->chan);
@@ -311,6 +323,10 @@ nouveau_abi16_ioctl_channel_alloc(ABI16_IOCTL_ARGS)
 	if (ret)
 		goto done;
 
+	ret = nouveau_sched_entity_init(&chan->sched_entity, &drm->sched);
+	if (ret)
+		goto done;
+
 	init->channel = chan->chan->chid;
 
 	if (device->info.family >= NV_DEVICE_INFO_V0_TESLA)
diff --git a/drivers/gpu/drm/nouveau/nouveau_abi16.h b/drivers/gpu/drm/nouveau/nouveau_abi16.h
index 27eae85f33e6..8209eb28feaf 100644
--- a/drivers/gpu/drm/nouveau/nouveau_abi16.h
+++ b/drivers/gpu/drm/nouveau/nouveau_abi16.h
@@ -26,6 +26,7 @@ struct nouveau_abi16_chan {
 	struct nouveau_bo *ntfy;
 	struct nouveau_vma *ntfy_vma;
 	struct nvkm_mm  heap;
+	struct nouveau_sched_entity sched_entity;
 };
 
 struct nouveau_abi16 {
diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index 989f30a31ba9..5d018207ff92 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -71,6 +71,7 @@
 #include "nouveau_svm.h"
 #include "nouveau_dmem.h"
 #include "nouveau_uvmm.h"
+#include "nouveau_sched.h"
 
 DECLARE_DYNDBG_CLASSMAP(drm_debug_classes, DD_CLASS_TYPE_DISJOINT_BITS, 0,
 			"DRM_UT_CORE",
@@ -192,6 +193,7 @@ nouveau_cli_fini(struct nouveau_cli *cli)
 	flush_work(&cli->work);
 	WARN_ON(!list_empty(&cli->worker));
 
+	nouveau_sched_entity_fini(&cli->sched_entity);
 	usif_client_fini(cli);
 	nouveau_uvmm_fini(&cli->uvmm);
 	nouveau_vmm_fini(&cli->svm);
@@ -299,6 +301,11 @@ nouveau_cli_init(struct nouveau_drm *drm, const char *sname,
 	}
 
 	cli->mem = &mems[ret];
+
+	ret = nouveau_sched_entity_init(&cli->sched_entity, &drm->sched);
+	if (ret)
+		goto done;
+
 	return 0;
 done:
 	if (ret)
@@ -611,8 +618,13 @@ nouveau_drm_device_init(struct drm_device *dev)
 		pm_runtime_put(dev->dev);
 	}
 
-	return 0;
+	ret = nouveau_sched_init(&drm->sched, drm);
+	if (ret)
+		goto fail_sched_init;
 
+	return 0;
+fail_sched_init:
+	nouveau_display_fini(dev, false, false);
 fail_dispinit:
 	nouveau_display_destroy(dev);
 fail_dispctor:
@@ -637,6 +649,8 @@ nouveau_drm_device_fini(struct drm_device *dev)
 	struct nouveau_cli *cli, *temp_cli;
 	struct nouveau_drm *drm = nouveau_drm(dev);
 
+	nouveau_sched_fini(&drm->sched);
+
 	if (nouveau_pmops_runtime()) {
 		pm_runtime_get_sync(dev->dev);
 		pm_runtime_forbid(dev->dev);
@@ -1177,6 +1191,9 @@ nouveau_ioctls[] = {
 	DRM_IOCTL_DEF_DRV(NOUVEAU_GEM_CPU_PREP, nouveau_gem_ioctl_cpu_prep, DRM_RENDER_ALLOW),
 	DRM_IOCTL_DEF_DRV(NOUVEAU_GEM_CPU_FINI, nouveau_gem_ioctl_cpu_fini, DRM_RENDER_ALLOW),
 	DRM_IOCTL_DEF_DRV(NOUVEAU_GEM_INFO, nouveau_gem_ioctl_info, DRM_RENDER_ALLOW),
+	DRM_IOCTL_DEF_DRV(NOUVEAU_VM_INIT, nouveau_ioctl_vm_init, DRM_RENDER_ALLOW),
+	DRM_IOCTL_DEF_DRV(NOUVEAU_VM_BIND, nouveau_ioctl_vm_bind, DRM_RENDER_ALLOW),
+	DRM_IOCTL_DEF_DRV(NOUVEAU_EXEC, nouveau_ioctl_exec, DRM_RENDER_ALLOW),
 };
 
 long
@@ -1224,7 +1241,9 @@ nouveau_driver_fops = {
 static struct drm_driver
 driver_stub = {
 	.driver_features =
-		DRIVER_GEM | DRIVER_MODESET | DRIVER_RENDER
+		DRIVER_GEM | DRIVER_MODESET | DRIVER_RENDER |
+		DRIVER_SYNCOBJ | DRIVER_SYNCOBJ_TIMELINE |
+		DRIVER_GEM_GPUVA
 #if defined(CONFIG_NOUVEAU_LEGACY_CTX_SUPPORT)
 		| DRIVER_KMS_LEGACY_CONTEXT
 #endif
diff --git a/drivers/gpu/drm/nouveau/nouveau_drv.h b/drivers/gpu/drm/nouveau/nouveau_drv.h
index d634f1054d65..94de792ef3ca 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drv.h
+++ b/drivers/gpu/drm/nouveau/nouveau_drv.h
@@ -10,8 +10,8 @@
 #define DRIVER_DATE		"20120801"
 
 #define DRIVER_MAJOR		1
-#define DRIVER_MINOR		3
-#define DRIVER_PATCHLEVEL	1
+#define DRIVER_MINOR		4
+#define DRIVER_PATCHLEVEL	0
 
 /*
  * 1.1.1:
@@ -63,6 +63,7 @@ struct platform_device;
 
 #include "nouveau_fence.h"
 #include "nouveau_bios.h"
+#include "nouveau_sched.h"
 #include "nouveau_vmm.h"
 #include "nouveau_uvmm.h"
 
@@ -94,6 +95,8 @@ struct nouveau_cli {
 	struct nouveau_vmm svm;
 	struct nouveau_uvmm uvmm;
 
+	struct nouveau_sched_entity sched_entity;
+
 	const struct nvif_mclass *mem;
 
 	struct list_head head;
@@ -305,6 +308,8 @@ struct nouveau_drm {
 		struct mutex lock;
 		bool component_registered;
 	} audio;
+
+	struct drm_gpu_scheduler sched;
 };
 
 static inline struct nouveau_drm *
diff --git a/drivers/gpu/drm/nouveau/nouveau_exec.c b/drivers/gpu/drm/nouveau/nouveau_exec.c
new file mode 100644
index 000000000000..512120bdb8a8
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/nouveau_exec.c
@@ -0,0 +1,310 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright (c) 2022 Red Hat.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
+ * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
+ * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+ * OTHER DEALINGS IN THE SOFTWARE.
+ *
+ * Authors:
+ *     Danilo Krummrich <dakr@redhat.com>
+ *
+ */
+
+#include <drm/drm_exec.h>
+
+#include "nouveau_drv.h"
+#include "nouveau_gem.h"
+#include "nouveau_mem.h"
+#include "nouveau_dma.h"
+#include "nouveau_exec.h"
+#include "nouveau_abi16.h"
+#include "nouveau_chan.h"
+#include "nouveau_sched.h"
+#include "nouveau_uvmm.h"
+
+
+/**
+ * DOC: Overview
+ *
+ * Nouveau's VM_BIND / EXEC UAPI consists of three ioctls: DRM_NOUVEAU_VM_INIT,
+ * DRM_NOUVEAU_VM_BIND and DRM_NOUVEAU_EXEC.
+ *
+ * In order to use the UAPI firstly a user client must initialize the VA space
+ * using the DRM_NOUVEAU_VM_INIT ioctl specifying which region of the VA space
+ * should be managed by the kernel and which by the UMD.
+ *
+ * The DRM_NOUVEAU_VM_BIND ioctl provides clients an interface to manage the
+ * userspace-managable portion of the VA space. It provides operations to
+ * allocate and free a VA space regions and operations to map and unmap memory
+ * within such a region. Bind operations crossing region boundaries are not
+ * permitted.
+ *
+ * When allocating a VA space region userspace may flag this region as sparse.
+ * If a region is flagged as sparse the kernel will take care that for the whole
+ * region sparse mappings are created. Subsequently requested actual memory
+ * backed mappings for a sparse region will take precedence over the sparse
+ * mappings. If the memory backed mappings are unmapped the kernel will make
+ * sure that sparse mappings will take their place again.
+ *
+ * When using the VM_BIND ioctl to request the kernel to map memory to a given
+ * virtual address in the GPU's VA space there is no guarantee that the actual
+ * mappings are created in the GPU's MMU. If the given memory is swapped out
+ * at the time the bind operation is executed the kernel will stash the mapping
+ * details into it's internal alloctor and create the actual MMU mappings once
+ * the memory is swapped back in. While this is transparent for userspace, it is
+ * guaranteed that all the backing memory is swapped back in and all the memory
+ * mappings, as requested by userspace previously, are actually mapped once the
+ * DRM_NOUVEAU_EXEC ioctl is called to submit an exec job.
+ *
+ * Contrary to VM_BIND map requests, unmap requests are allowed to span over VA
+ * space regions and completely untouched areas of the VA space.
+ *
+ * Generally, all rules for constellations like mapping and unmapping over
+ * boundaries of existing mappings are documented in the &drm_gpuva_manager.
+ *
+ * When a VA space region is freed, all existing mappings within this region are
+ * unmapped automatically.
+ *
+ * A VM_BIND job can be executed either synchronously or asynchronously. If
+ * exectued asynchronously, userspace may provide a list of syncobjs this job
+ * will wait for and/or a list of syncobj the kernel will trigger once the
+ * VM_BIND finished execution. If executed synchronously the ioctl will block
+ * until the bind job is finished and no syncobjs are permitted by the kernel.
+ *
+ * To execute a push buffer the UAPI provides the DRM_NOUVEAU_EXEC ioctl. EXEC
+ * jobs are always executed asynchronously, and, equal to VM_BIND jobs, provide
+ * the option to synchronize them with syncobjs.
+ *
+ * Besides that EXEC job can be scheduled for a specified channel to execute on.
+ *
+ * EXEC jobs wait for VM_BIND jobs they depend on when userspace submitts the
+ * EXEC job rather than when this EXEC job actually executes. This is due to the
+ * fact that at submission time of the EXEC job we'd otherwise not have the
+ * correct view of the VA space for this EXEC job, since VM_BIND jobs, this EXEC
+ * job depends on might still be in the queue. Without a recent (and hence
+ * for this particular job correct) view of the VA space, we'd potentially miss
+ * to lock, swap in and re-bind BOs that have been evicted previously.
+ */
+
+static int
+nouveau_exec_ucopy_syncs(struct nouveau_exec_base *base,
+			u32 inc, u64 ins,
+			u32 outc, u64 outs)
+{
+	struct drm_nouveau_sync **s;
+	int ret;
+
+	if (inc) {
+		s = &base->in_sync.s;
+
+		base->in_sync.count = inc;
+		*s = u_memcpya(ins, inc, sizeof(**s));
+		if (IS_ERR(*s)) {
+			ret = PTR_ERR(*s);
+			goto err_out;
+		}
+	}
+
+	if (outc) {
+		s = &base->out_sync.s;
+
+		base->out_sync.count = outc;
+		*s = u_memcpya(outs, outc, sizeof(**s));
+		if (IS_ERR(*s)) {
+			ret = PTR_ERR(*s);
+			goto err_free_ins;
+		}
+	}
+
+	return 0;
+
+err_free_ins:
+	u_free(base->in_sync.s);
+err_out:
+	return ret;
+}
+
+int
+nouveau_ioctl_vm_init(struct drm_device *dev,
+		      void *data,
+		      struct drm_file *file_priv)
+{
+	struct nouveau_cli *cli = nouveau_cli(file_priv);
+	struct drm_nouveau_vm_init *init = data;
+
+	return nouveau_uvmm_init(&cli->uvmm, cli, init);
+}
+
+int nouveau_vm_bind(struct nouveau_exec_bind *bind)
+{
+	struct nouveau_bind_job *job;
+	int ret;
+
+	ret = nouveau_bind_job_init(&job, bind);
+	if (ret)
+		return ret;
+
+	ret = nouveau_job_submit(&job->base);
+	if (ret)
+		goto err_job_fini;
+
+	return 0;
+
+err_job_fini:
+	nouveau_job_fini(&job->base);
+	return ret;
+}
+
+int
+nouveau_ioctl_vm_bind(struct drm_device *dev,
+		      void *data,
+		      struct drm_file *file_priv)
+{
+	struct nouveau_cli *cli = nouveau_cli(file_priv);
+	struct nouveau_exec_bind bind = {};
+	struct drm_nouveau_vm_bind *req = data;
+	int ret = 0;
+
+	if (unlikely(!nouveau_cli_uvmm_locked(cli)))
+		return -ENOSYS;
+
+	bind.flags = req->flags;
+
+	bind.op.count = req->op_count;
+	bind.op.s = u_memcpya(req->op_ptr, req->op_count,
+			      sizeof(*bind.op.s));
+	if (IS_ERR(bind.op.s))
+		return PTR_ERR(bind.op.s);
+
+	ret = nouveau_exec_ucopy_syncs(&bind.base,
+				       req->wait_count, req->wait_ptr,
+				       req->sig_count, req->sig_ptr);
+	if (ret)
+		goto out_free_ops;
+
+	bind.base.sched_entity = &cli->sched_entity;
+	bind.base.file_priv = file_priv;
+
+	ret = nouveau_vm_bind(&bind);
+	if (ret)
+		goto out_free_syncs;
+
+out_free_syncs:
+	u_free(bind.base.out_sync.s);
+	u_free(bind.base.in_sync.s);
+out_free_ops:
+	u_free(bind.op.s);
+	return ret;
+}
+
+static int
+nouveau_exec(struct nouveau_exec *exec)
+{
+	struct nouveau_exec_job *job;
+	int ret;
+
+	ret = nouveau_exec_job_init(&job, exec);
+	if (ret)
+		return ret;
+
+	ret = nouveau_job_submit(&job->base);
+	if (ret)
+		goto err_job_fini;
+
+	return 0;
+
+err_job_fini:
+	nouveau_job_fini(&job->base);
+	return ret;
+}
+
+int
+nouveau_ioctl_exec(struct drm_device *dev,
+		   void *data,
+		   struct drm_file *file_priv)
+{
+	struct nouveau_abi16 *abi16 = nouveau_abi16_get(file_priv);
+	struct nouveau_cli *cli = nouveau_cli(file_priv);
+	struct nouveau_abi16_chan *chan16;
+	struct nouveau_channel *chan = NULL;
+	struct nouveau_exec exec = {};
+	struct drm_nouveau_exec *req = data;
+	int ret = 0;
+
+	if (unlikely(!abi16))
+		return -ENOMEM;
+
+	/* abi16 locks already */
+	if (unlikely(!nouveau_cli_uvmm(cli)))
+		return nouveau_abi16_put(abi16, -ENOSYS);
+
+	list_for_each_entry(chan16, &abi16->channels, head) {
+		if (chan16->chan->chid == req->channel) {
+			chan = chan16->chan;
+			break;
+		}
+	}
+
+	if (!chan)
+		return nouveau_abi16_put(abi16, -ENOENT);
+
+	if (unlikely(atomic_read(&chan->killed)))
+		return nouveau_abi16_put(abi16, -ENODEV);
+
+	if (!chan->dma.ib_max)
+		return nouveau_abi16_put(abi16, -ENOSYS);
+
+	if (unlikely(req->push_count == 0))
+		goto out;
+
+	if (unlikely(req->push_count > NOUVEAU_GEM_MAX_PUSH)) {
+		NV_PRINTK(err, cli, "pushbuf push count exceeds limit: %d max %d\n",
+			 req->push_count, NOUVEAU_GEM_MAX_PUSH);
+		return nouveau_abi16_put(abi16, -EINVAL);
+	}
+
+	exec.push.count = req->push_count;
+	exec.push.s = u_memcpya(req->push_ptr, req->push_count,
+				sizeof(*exec.push.s));
+	if (IS_ERR(exec.push.s)) {
+		ret = PTR_ERR(exec.push.s);
+		goto out;
+	}
+
+	ret = nouveau_exec_ucopy_syncs(&exec.base,
+				       req->wait_count, req->wait_ptr,
+				       req->sig_count, req->sig_ptr);
+	if (ret)
+		goto out_free_pushs;
+
+	exec.base.sched_entity = &chan16->sched_entity;
+	exec.base.chan = chan;
+	exec.base.file_priv = file_priv;
+
+	ret = nouveau_exec(&exec);
+	if (ret)
+		goto out_free_syncs;
+
+out_free_syncs:
+	u_free(exec.base.out_sync.s);
+	u_free(exec.base.in_sync.s);
+out_free_pushs:
+	u_free(exec.push.s);
+out:
+	return nouveau_abi16_put(abi16, ret);
+}
diff --git a/drivers/gpu/drm/nouveau/nouveau_exec.h b/drivers/gpu/drm/nouveau/nouveau_exec.h
new file mode 100644
index 000000000000..3774fc338f5d
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/nouveau_exec.h
@@ -0,0 +1,55 @@
+// SPDX-License-Identifier: MIT
+
+#ifndef __NOUVEAU_EXEC_H__
+#define __NOUVEAU_EXEC_H__
+
+#include <drm/drm_exec.h>
+
+#include "nouveau_drv.h"
+
+struct nouveau_exec_base {
+	struct nouveau_channel *chan;
+	struct drm_file *file_priv;
+	struct nouveau_sched_entity *sched_entity;
+
+	struct {
+		struct drm_nouveau_sync *s;
+		u32 count;
+	} in_sync;
+
+	struct {
+		struct drm_nouveau_sync *s;
+		u32 count;
+	} out_sync;
+};
+
+struct nouveau_exec_bind {
+	struct nouveau_exec_base base;
+	unsigned int flags;
+
+	struct {
+		struct drm_nouveau_vm_bind_op *s;
+		u32 count;
+	} op;
+};
+
+struct nouveau_exec {
+	struct nouveau_exec_base base;
+	struct drm_exec exec;
+
+	struct {
+		struct drm_nouveau_exec_push *s;
+		u32 count;
+	} push;
+};
+
+int nouveau_ioctl_vm_init(struct drm_device *dev, void *data,
+			  struct drm_file *file_priv);
+
+int nouveau_ioctl_vm_bind(struct drm_device *dev, void *data,
+			  struct drm_file *file_priv);
+
+int nouveau_ioctl_exec(struct drm_device *dev, void *data,
+		       struct drm_file *file_priv);
+
+#endif
diff --git a/drivers/gpu/drm/nouveau/nouveau_sched.c b/drivers/gpu/drm/nouveau/nouveau_sched.c
new file mode 100644
index 000000000000..2749aa1908ad
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/nouveau_sched.c
@@ -0,0 +1,780 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright (c) 2022 Red Hat.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
+ * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
+ * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+ * OTHER DEALINGS IN THE SOFTWARE.
+ *
+ * Authors:
+ *     Danilo Krummrich <dakr@redhat.com>
+ *
+ */
+
+#include <linux/slab.h>
+#include <drm/gpu_scheduler.h>
+#include <drm/drm_syncobj.h>
+
+#include "nouveau_drv.h"
+#include "nouveau_gem.h"
+#include "nouveau_mem.h"
+#include "nouveau_dma.h"
+#include "nouveau_exec.h"
+#include "nouveau_abi16.h"
+#include "nouveau_chan.h"
+#include "nouveau_sched.h"
+
+/* FIXME
+ *
+ * We want to make sure that jobs currently executing can't be deferred by
+ * other jobs competing for the hardware. Otherwise we might end up with job
+ * timouts just because of too many clients submitting too many jobs. We don't
+ * want jobs to time out because of system load, but because of the job being
+ * too bulky.
+ *
+ * For now allow for up to 16 concurrent jobs in flight until we know how many
+ * rings the hardware can process in parallel.
+ */
+#define NOUVEAU_SCHED_HW_SUBMISSIONS		16
+#define NOUVEAU_SCHED_JOB_TIMEOUT_MS		10000
+
+#define list_for_each_op(_op, _ops) list_for_each_entry(_op, _ops, entry)
+#define list_for_each_op_safe(_op, _n, _ops) list_for_each_entry_safe(_op, _n, _ops, entry)
+
+enum bind_op {
+	OP_ALLOC = DRM_NOUVEAU_VM_BIND_OP_ALLOC,
+	OP_FREE = DRM_NOUVEAU_VM_BIND_OP_FREE,
+	OP_MAP = DRM_NOUVEAU_VM_BIND_OP_MAP,
+	OP_UNMAP = DRM_NOUVEAU_VM_BIND_OP_UNMAP,
+};
+
+struct bind_job_op {
+	struct list_head entry;
+
+	enum bind_op op;
+	u32 flags;
+
+	struct {
+		u64 addr;
+		u64 range;
+	} va;
+
+	struct {
+		u32 handle;
+		u64 offset;
+		struct drm_gem_object *obj;
+	} gem;
+};
+
+static int
+nouveau_base_job_init(struct nouveau_job *job,
+		      struct nouveau_exec_base *base)
+{
+	struct nouveau_sched_entity *entity = base->sched_entity;
+	int ret;
+
+	INIT_LIST_HEAD(&job->head);
+	job->file_priv = base->file_priv;
+	job->cli = nouveau_cli(base->file_priv);
+	job->chan = base->chan;
+	job->entity = entity;
+
+	job->in_sync.count = base->in_sync.count;
+	if (job->in_sync.count) {
+		if (job->sync)
+			return -EINVAL;
+
+		job->in_sync.s = kmemdup(base->in_sync.s,
+					 sizeof(*base->in_sync.s) *
+					 base->in_sync.count,
+					 GFP_KERNEL);
+		if (!job->in_sync.s)
+			return -ENOMEM;
+	}
+
+	job->out_sync.count = base->out_sync.count;
+	if (job->out_sync.count) {
+		if (job->sync) {
+			ret = -EINVAL;
+			goto err_free_in_sync;
+		}
+
+		job->out_sync.s = kmemdup(base->out_sync.s,
+					  sizeof(*base->out_sync.s) *
+					  base->out_sync.count,
+					  GFP_KERNEL);
+		if (!job->out_sync.s) {
+			ret = -ENOMEM;
+			goto err_free_in_sync;
+		}
+	}
+
+	ret = drm_sched_job_init(&job->base, &entity->base, NULL);
+	if (ret)
+		goto err_free_out_sync;
+
+	return 0;
+
+err_free_out_sync:
+	if (job->out_sync.s)
+		kfree(job->out_sync.s);
+err_free_in_sync:
+	if (job->in_sync.s)
+		kfree(job->in_sync.s);
+return ret;
+}
+
+static void
+nouveau_base_job_free(struct nouveau_job *job)
+{
+	if (job->in_sync.s)
+		kfree(job->in_sync.s);
+
+	if (job->out_sync.s)
+		kfree(job->out_sync.s);
+}
+
+static int
+bind_submit_validate_op(struct nouveau_job *job,
+			struct bind_job_op *op)
+{
+	struct nouveau_uvmm *uvmm = nouveau_cli_uvmm(job->cli);
+	struct drm_gem_object *obj = op->gem.obj;
+
+	if (op->op == OP_MAP) {
+		if (op->gem.offset & ~PAGE_MASK)
+			return -EINVAL;
+
+		if (obj->size <= op->gem.offset)
+			return -EINVAL;
+
+		if (op->va.range > (obj->size - op->gem.offset))
+			return -EINVAL;
+	}
+
+	return nouveau_uvmm_validate_range(uvmm, op->va.addr, op->va.range);
+}
+
+int
+nouveau_bind_job_submit(struct nouveau_job *job)
+{
+	struct nouveau_bind_job *bind_job = to_nouveau_bind_job(job);
+	struct bind_job_op *op;
+	int ret;
+
+	list_for_each_op(op, &bind_job->ops) {
+		switch (op->op) {
+		case OP_ALLOC:
+		case OP_FREE:
+		case OP_MAP:
+		case OP_UNMAP:
+			break;
+		default:
+			return -EINVAL;
+		}
+
+		if (op->op == OP_MAP) {
+			op->gem.obj = drm_gem_object_lookup(job->file_priv,
+							    op->gem.handle);
+			if (!op->gem.obj)
+				return -ENOENT;
+		}
+
+		ret = bind_submit_validate_op(job, op);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+static struct dma_fence *
+nouveau_bind_job_run(struct nouveau_job *job)
+{
+	struct nouveau_bind_job *bind_job = to_nouveau_bind_job(job);
+	struct nouveau_uvmm *uvmm = nouveau_cli_uvmm(job->cli);
+	struct bind_job_op *op;
+	int ret = 0;
+
+	nouveau_uvmm_lock(uvmm);
+	list_for_each_op(op, &bind_job->ops) {
+		switch (op->op) {
+		case OP_ALLOC: {
+			bool sparse = op->flags & DRM_NOUVEAU_VM_BIND_SPARSE;
+
+			ret = nouveau_uvma_region_new(uvmm,
+						      op->va.addr,
+						      op->va.range,
+						      sparse);
+			if (ret)
+				goto out_unlock;
+			break;
+		}
+		case OP_FREE:
+			ret = nouveau_uvma_region_destroy(uvmm,
+							  op->va.addr,
+							  op->va.range);
+			if (ret)
+				goto out_unlock;
+			break;
+		case OP_MAP:
+			ret = nouveau_uvmm_sm_map(uvmm,
+						  op->va.addr, op->va.range,
+						  op->gem.obj, op->gem.offset,
+						  op->flags && 0xff);
+			if (ret)
+				goto out_unlock;
+			break;
+		case OP_UNMAP:
+			ret = nouveau_uvmm_sm_unmap(uvmm,
+						    op->va.addr,
+						    op->va.range);
+			if (ret)
+				goto out_unlock;
+			break;
+		}
+	}
+
+out_unlock:
+	nouveau_uvmm_unlock(uvmm);
+	if (ret)
+		NV_PRINTK(err, job->cli, "bind job failed: %d\n", ret);
+	return ERR_PTR(ret);
+}
+
+static void
+nouveau_bind_job_free(struct nouveau_job *job)
+{
+	struct nouveau_bind_job *bind_job = to_nouveau_bind_job(job);
+	struct bind_job_op *op, *next;
+
+	list_for_each_op_safe(op, next, &bind_job->ops) {
+		struct drm_gem_object *obj = op->gem.obj;
+
+		if (obj)
+			drm_gem_object_put(obj);
+
+		list_del(&op->entry);
+		kfree(op);
+	}
+
+	nouveau_base_job_free(job);
+	kfree(bind_job);
+}
+
+static struct nouveau_job_ops nouveau_bind_job_ops = {
+	.submit = nouveau_bind_job_submit,
+	.run = nouveau_bind_job_run,
+	.free = nouveau_bind_job_free,
+};
+
+static int
+bind_job_op_from_uop(struct bind_job_op **pop,
+		     struct drm_nouveau_vm_bind_op *uop)
+{
+	struct bind_job_op *op;
+
+	op = *pop = kzalloc(sizeof(*op), GFP_KERNEL);
+	if (!op)
+		return -ENOMEM;
+
+	op->op = uop->op;
+	op->flags = uop->flags;
+	op->va.addr = uop->addr;
+	op->va.range = uop->range;
+
+	if (op->op == DRM_NOUVEAU_VM_BIND_OP_MAP) {
+		op->gem.handle = uop->handle;
+		op->gem.offset = uop->bo_offset;
+	}
+
+	return 0;
+}
+
+static void
+bind_job_ops_free(struct list_head *ops)
+{
+	struct bind_job_op *op, *next;
+
+	list_for_each_op_safe(op, next, ops) {
+		list_del(&op->entry);
+		kfree(op);
+	}
+}
+
+int
+nouveau_bind_job_init(struct nouveau_bind_job **pjob,
+		      struct nouveau_exec_bind *bind)
+{
+	struct nouveau_bind_job *job;
+	struct bind_job_op *op;
+	int i, ret;
+
+	job = *pjob = kzalloc(sizeof(*job), GFP_KERNEL);
+	if (!job)
+		return -ENOMEM;
+
+	INIT_LIST_HEAD(&job->ops);
+
+	for (i = 0; i < bind->op.count; i++) {
+		ret = bind_job_op_from_uop(&op, &bind->op.s[i]);
+		if (ret)
+			goto err_free;
+
+		list_add_tail(&op->entry, &job->ops);
+	}
+
+	job->base.sync = !(bind->flags & DRM_NOUVEAU_VM_BIND_RUN_ASYNC);
+	job->base.ops = &nouveau_bind_job_ops;
+
+	ret = nouveau_base_job_init(&job->base, &bind->base);
+	if (ret)
+		goto err_free;
+
+	return 0;
+
+err_free:
+	bind_job_ops_free(&job->ops);
+	kfree(job);
+	*pjob = NULL;
+
+	return ret;
+}
+
+static int
+sync_find_fence(struct nouveau_job *job,
+		struct drm_nouveau_sync *sync,
+		struct dma_fence **fence)
+{
+	u32 stype = sync->flags & DRM_NOUVEAU_SYNC_TYPE_MASK;
+	u64 point = 0;
+	int ret;
+
+	if (stype != DRM_NOUVEAU_SYNC_SYNCOBJ &&
+	    stype != DRM_NOUVEAU_SYNC_TIMELINE_SYNCOBJ)
+		return -EOPNOTSUPP;
+
+	if (stype == DRM_NOUVEAU_SYNC_TIMELINE_SYNCOBJ)
+		point = sync->timeline_value;
+
+	ret = drm_syncobj_find_fence(job->file_priv,
+				     sync->handle, point,
+				     sync->flags, fence);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static int
+exec_job_binds_wait(struct nouveau_job *job)
+{
+	struct nouveau_exec_job *exec_job = to_nouveau_exec_job(job);
+	struct nouveau_cli *cli = exec_job->base.cli;
+	struct nouveau_sched_entity *bind_entity = &cli->sched_entity;
+	signed long ret;
+	int i;
+
+	for (i = 0; i < job->in_sync.count; i++) {
+		struct nouveau_job *it;
+		struct drm_nouveau_sync *sync = &job->in_sync.s[i];
+		struct dma_fence *fence;
+		bool found;
+
+		ret = sync_find_fence(job, sync, &fence);
+		if (ret)
+			return ret;
+
+		mutex_lock(&bind_entity->job.mutex);
+		found = false;
+		list_for_each_entry(it, &bind_entity->job.list, head) {
+			if (fence == it->done_fence) {
+				found = true;
+				break;
+			}
+		}
+		mutex_unlock(&bind_entity->job.mutex);
+
+		/* If the fence is not from a VM_BIND job, don't wait for it. */
+		if (!found)
+			continue;
+
+		ret = dma_fence_wait_timeout(fence, true,
+					     msecs_to_jiffies(500));
+		if (ret < 0)
+			return ret;
+		else if (ret == 0)
+			return -ETIMEDOUT;
+	}
+
+	return 0;
+}
+
+int
+nouveau_exec_job_submit(struct nouveau_job *job)
+{
+	struct nouveau_exec_job *exec_job = to_nouveau_exec_job(job);
+	struct nouveau_cli *cli = exec_job->base.cli;
+	struct nouveau_uvmm *uvmm = nouveau_cli_uvmm(cli);
+	struct drm_exec *exec = &job->exec;
+	struct drm_gem_object *obj;
+	unsigned long index;
+	int ret;
+
+	ret = exec_job_binds_wait(job);
+	if (ret)
+		return ret;
+
+	nouveau_uvmm_lock(uvmm);
+	drm_exec_while_not_all_locked(exec) {
+		struct drm_gpuva *va;
+
+		drm_gpuva_for_each_va(va, &uvmm->umgr) {
+			ret = drm_exec_prepare_obj(exec, va->gem.obj, 1);
+			drm_exec_break_on_contention(exec);
+			if (ret)
+				return ret;
+		}
+	}
+	nouveau_uvmm_unlock(uvmm);
+
+	drm_exec_for_each_locked_object(exec, index, obj) {
+		struct dma_resv *resv = obj->resv;
+		struct nouveau_bo *nvbo = nouveau_gem_object(obj);
+
+		ret = nouveau_bo_validate(nvbo, true, false);
+		if (ret)
+			return ret;
+
+		dma_resv_add_fence(resv, job->done_fence, DMA_RESV_USAGE_WRITE);
+	}
+
+	return 0;
+}
+
+static struct dma_fence *
+nouveau_exec_job_run(struct nouveau_job *job)
+{
+	struct nouveau_exec_job *exec_job = to_nouveau_exec_job(job);
+	struct nouveau_fence *fence;
+	int i, ret;
+
+	ret = nouveau_dma_wait(job->chan, exec_job->push.count + 1, 16);
+	if (ret) {
+		NV_PRINTK(err, job->cli, "nv50cal_space: %d\n", ret);
+		return ERR_PTR(ret);
+	}
+
+	for (i = 0; i < exec_job->push.count; i++) {
+		nv50_dma_push(job->chan, exec_job->push.s[i].va,
+			      exec_job->push.s[i].va_len);
+	}
+
+	ret = nouveau_fence_new(job->chan, false, &fence);
+	if (ret) {
+		NV_PRINTK(err, job->cli, "error fencing pushbuf: %d\n", ret);
+		WIND_RING(job->chan);
+		return ERR_PTR(ret);
+	}
+
+	return &fence->base;
+}
+static void
+nouveau_exec_job_free(struct nouveau_job *job)
+{
+	struct nouveau_exec_job *exec_job = to_nouveau_exec_job(job);
+
+	nouveau_base_job_free(job);
+
+	kfree(exec_job->push.s);
+	kfree(exec_job);
+}
+
+static struct nouveau_job_ops nouveau_exec_job_ops = {
+	.submit = nouveau_exec_job_submit,
+	.run = nouveau_exec_job_run,
+	.free = nouveau_exec_job_free,
+};
+
+int
+nouveau_exec_job_init(struct nouveau_exec_job **pjob,
+		      struct nouveau_exec *exec)
+{
+	struct nouveau_exec_job *job;
+	int ret;
+
+	job = *pjob = kzalloc(sizeof(*job), GFP_KERNEL);
+	if (!job)
+		return -ENOMEM;
+
+	job->push.count = exec->push.count;
+	job->push.s = kmemdup(exec->push.s,
+			      sizeof(*exec->push.s) *
+			      exec->push.count,
+			      GFP_KERNEL);
+	if (!job->push.s) {
+		ret = -ENOMEM;
+		goto err_free_job;
+	}
+
+	job->base.ops = &nouveau_exec_job_ops;
+	ret = nouveau_base_job_init(&job->base, &exec->base);
+	if (ret)
+		goto err_free_pushs;
+
+	return 0;
+
+err_free_pushs:
+	kfree(job->push.s);
+err_free_job:
+	kfree(job);
+	*pjob = NULL;
+
+	return ret;
+}
+
+void nouveau_job_fini(struct nouveau_job *job)
+{
+	dma_fence_put(job->done_fence);
+	drm_sched_job_cleanup(&job->base);
+	job->ops->free(job);
+}
+
+static int
+nouveau_job_add_deps(struct nouveau_job *job)
+{
+	struct dma_fence *in_fence = NULL;
+	int ret, i;
+
+	for (i = 0; i < job->in_sync.count; i++) {
+		struct drm_nouveau_sync *sync = &job->in_sync.s[i];
+
+		ret = sync_find_fence(job, sync, &in_fence);
+		if (ret) {
+			NV_PRINTK(warn, job->cli,
+				  "Failed to find syncobj (-> in): handle=%d\n",
+				  sync->handle);
+			return ret;
+		}
+
+		ret = drm_sched_job_add_dependency(&job->base, in_fence);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+static int
+nouveau_job_fence_attach(struct nouveau_job *job, struct dma_fence *fence)
+{
+	struct drm_syncobj *out_sync;
+	int i;
+
+	for (i = 0; i < job->out_sync.count; i++) {
+		struct drm_nouveau_sync *sync = &job->out_sync.s[i];
+		u32 stype = sync->flags & DRM_NOUVEAU_SYNC_TYPE_MASK;
+
+		if (stype != DRM_NOUVEAU_SYNC_SYNCOBJ &&
+		    stype != DRM_NOUVEAU_SYNC_TIMELINE_SYNCOBJ)
+			return -EOPNOTSUPP;
+
+		out_sync = drm_syncobj_find(job->file_priv, sync->handle);
+		if (!out_sync) {
+			NV_PRINTK(warn, job->cli,
+				  "Failed to find syncobj (-> out): handle=%d\n",
+				  sync->handle);
+			return -ENOENT;
+		}
+
+		if (stype == DRM_NOUVEAU_SYNC_TIMELINE_SYNCOBJ) {
+			struct dma_fence_chain *chain;
+
+			chain = dma_fence_chain_alloc();
+			if (!chain) {
+				drm_syncobj_put(out_sync);
+				return -ENOMEM;
+			}
+
+			drm_syncobj_add_point(out_sync, chain, fence,
+					      sync->timeline_value);
+		} else {
+			drm_syncobj_replace_fence(out_sync, fence);
+		}
+
+		drm_syncobj_put(out_sync);
+	}
+
+	return 0;
+}
+
+static struct dma_fence *
+nouveau_job_run(struct nouveau_job *job)
+{
+	return job->ops->run(job);
+}
+
+static int
+nouveau_job_run_sync(struct nouveau_job *job)
+{
+	struct dma_fence *fence;
+	int ret;
+
+	fence = nouveau_job_run(job);
+	if (IS_ERR(fence)) {
+		return PTR_ERR(fence);
+	} else if (fence) {
+		ret = dma_fence_wait(fence, true);
+		if (ret)
+			return ret;
+	}
+
+	dma_fence_signal(job->done_fence);
+
+	return 0;
+}
+
+int
+nouveau_job_submit(struct nouveau_job *job)
+{
+	struct nouveau_sched_entity *entity = to_nouveau_sched_entity(job->base.entity);
+	int ret;
+
+	drm_exec_init(&job->exec, true);
+
+	ret = nouveau_job_add_deps(job);
+	if (ret)
+		goto out;
+
+	drm_sched_job_arm(&job->base);
+	job->done_fence = dma_fence_get(&job->base.s_fence->finished);
+
+	ret = nouveau_job_fence_attach(job, job->done_fence);
+	if (ret)
+		goto out;
+
+	if (job->ops->submit) {
+		ret = job->ops->submit(job);
+		if (ret)
+			goto out;
+	}
+
+	if (job->sync) {
+		drm_exec_fini(&job->exec);
+
+		/* We're requested to run a synchronous job, hence don't push
+		 * the job, bypassing the job scheduler, and execute the jobs
+		 * run() function right away.
+		 *
+		 * As a consequence of bypassing the job scheduler we need to
+		 * handle fencing and job cleanup ourselfes.
+		 */
+		ret = nouveau_job_run_sync(job);
+
+		/* If the job fails, the caller will do the cleanup for us. */
+		if (!ret)
+			nouveau_job_fini(job);
+
+		return ret;
+	} else {
+		mutex_lock(&entity->job.mutex);
+		drm_sched_entity_push_job(&job->base);
+		list_add_tail(&job->head, &entity->job.list);
+		mutex_unlock(&entity->job.mutex);
+	}
+
+out:
+	drm_exec_fini(&job->exec);
+	return ret;
+}
+
+static struct dma_fence *
+nouveau_sched_run_job(struct drm_sched_job *sched_job)
+{
+	struct nouveau_job *job = to_nouveau_job(sched_job);
+
+	return nouveau_job_run(job);
+}
+
+static enum drm_gpu_sched_stat
+nouveau_sched_timedout_job(struct drm_sched_job *sched_job)
+{
+	struct nouveau_job *job = to_nouveau_job(sched_job);
+	struct nouveau_channel *chan = job->chan;
+
+	if (unlikely(!atomic_read(&chan->killed)))
+		nouveau_channel_kill(chan);
+
+	NV_PRINTK(warn, job->cli, "job timeout, channel %d killed!\n",
+		  chan->chid);
+
+	nouveau_sched_entity_fini(job->entity);
+
+	return DRM_GPU_SCHED_STAT_ENODEV;
+}
+
+static void
+nouveau_sched_free_job(struct drm_sched_job *sched_job)
+{
+	struct nouveau_job *job = to_nouveau_job(sched_job);
+	struct nouveau_sched_entity *entity = job->entity;
+
+	mutex_lock(&entity->job.mutex);
+	list_del(&job->head);
+	mutex_unlock(&entity->job.mutex);
+
+	nouveau_job_fini(job);
+}
+
+int nouveau_sched_entity_init(struct nouveau_sched_entity *entity,
+			      struct drm_gpu_scheduler *sched)
+{
+
+	INIT_LIST_HEAD(&entity->job.list);
+	mutex_init(&entity->job.mutex);
+
+	return drm_sched_entity_init(&entity->base,
+				     DRM_SCHED_PRIORITY_NORMAL,
+				     &sched, 1, NULL);
+}
+
+void
+nouveau_sched_entity_fini(struct nouveau_sched_entity *entity)
+{
+	drm_sched_entity_destroy(&entity->base);
+}
+
+static const struct drm_sched_backend_ops nouveau_sched_ops = {
+	.run_job = nouveau_sched_run_job,
+	.timedout_job = nouveau_sched_timedout_job,
+	.free_job = nouveau_sched_free_job,
+};
+
+int nouveau_sched_init(struct drm_gpu_scheduler *sched,
+		       struct nouveau_drm *drm)
+{
+	long job_hang_limit = msecs_to_jiffies(NOUVEAU_SCHED_JOB_TIMEOUT_MS);
+
+	return drm_sched_init(sched, &nouveau_sched_ops,
+			      NOUVEAU_SCHED_HW_SUBMISSIONS, 0, job_hang_limit,
+			      NULL, NULL, "nouveau", drm->dev->dev);
+}
+
+void nouveau_sched_fini(struct drm_gpu_scheduler *sched)
+{
+	drm_sched_fini(sched);
+}
diff --git a/drivers/gpu/drm/nouveau/nouveau_sched.h b/drivers/gpu/drm/nouveau/nouveau_sched.h
new file mode 100644
index 000000000000..7fc5b7eea810
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/nouveau_sched.h
@@ -0,0 +1,98 @@
+// SPDX-License-Identifier: MIT
+
+#ifndef NOUVEAU_SCHED_H
+#define NOUVEAU_SCHED_H
+
+#include <linux/types.h>
+
+#include <drm/drm_exec.h>
+#include <drm/gpu_scheduler.h>
+
+#include "nouveau_drv.h"
+#include "nouveau_exec.h"
+
+#define to_nouveau_job(sched_job)		\
+		container_of((sched_job), struct nouveau_job, base)
+
+#define to_nouveau_exec_job(job)		\
+		container_of((job), struct nouveau_exec_job, base)
+
+#define to_nouveau_bind_job(job)		\
+		container_of((job), struct nouveau_bind_job, base)
+
+struct nouveau_job {
+	struct drm_sched_job base;
+	struct list_head head;
+
+	struct nouveau_sched_entity *entity;
+
+	struct drm_file *file_priv;
+	struct nouveau_cli *cli;
+	struct nouveau_channel *chan;
+
+	struct drm_exec exec;
+	struct dma_fence *done_fence;
+
+	bool sync;
+
+	struct {
+		struct drm_nouveau_sync *s;
+		u32 count;
+	} in_sync;
+
+	struct {
+		struct drm_nouveau_sync *s;
+		u32 count;
+	} out_sync;
+
+	struct nouveau_job_ops {
+		int (*submit)(struct nouveau_job *);
+		struct dma_fence *(*run)(struct nouveau_job *);
+		void (*free)(struct nouveau_job *);
+	} *ops;
+};
+
+struct nouveau_exec_job {
+	struct nouveau_job base;
+
+	struct {
+		struct drm_nouveau_exec_push *s;
+		u32 count;
+	} push;
+};
+
+struct nouveau_bind_job {
+	struct nouveau_job base;
+
+	/* struct bind_job_op */
+	struct list_head ops;
+};
+
+int nouveau_bind_job_init(struct nouveau_bind_job **job,
+			  struct nouveau_exec_bind *bind);
+int nouveau_exec_job_init(struct nouveau_exec_job **job,
+			  struct nouveau_exec *exec);
+
+int nouveau_job_submit(struct nouveau_job *job);
+void nouveau_job_fini(struct nouveau_job *job);
+
+#define to_nouveau_sched_entity(entity)		\
+		container_of((entity), struct nouveau_sched_entity, base)
+
+struct nouveau_sched_entity {
+	struct drm_sched_entity base;
+	struct {
+		struct list_head list;
+		struct mutex mutex;
+	} job;
+};
+
+int nouveau_sched_entity_init(struct nouveau_sched_entity *entity,
+			      struct drm_gpu_scheduler *sched);
+void nouveau_sched_entity_fini(struct nouveau_sched_entity *entity);
+
+int nouveau_sched_init(struct drm_gpu_scheduler *sched,
+		       struct nouveau_drm *drm);
+void nouveau_sched_fini(struct drm_gpu_scheduler *sched);
+
+#endif
-- 
2.39.0

