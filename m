Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D2D969AD05
	for <lists+dri-devel@lfdr.de>; Fri, 17 Feb 2023 14:49:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0266E10F005;
	Fri, 17 Feb 2023 13:49:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE3BD10EFFD
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Feb 2023 13:49:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676641745;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1gEEEVEriS4+00Hosnu6p0Wtu19O1LPFPG0fsqoPCf8=;
 b=jMbjqfanDV0Bk2Y9V65av+fG1Hk/JXvHJ/OJpNGPfcQtSWtviPdajoZPFpt8fdSjf7iBSs
 4zOqOriZjYFRwO+6A/1tlT+Fit1DPOoGHfWedlOydjzeq953aKB4lg2aTdarl/2fgRz9wG
 7Rnhv26ta1tZaUSVwHn4GJpRGEiIhqU=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-641-_FdWCFVFOvuPY5CXr9blgg-1; Fri, 17 Feb 2023 08:49:04 -0500
X-MC-Unique: _FdWCFVFOvuPY5CXr9blgg-1
Received: by mail-ed1-f69.google.com with SMTP id
 z17-20020a05640240d100b004acc6cf6322so2014817edb.18
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Feb 2023 05:49:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1gEEEVEriS4+00Hosnu6p0Wtu19O1LPFPG0fsqoPCf8=;
 b=NHjMMXxMF6q+4y+ny2SLojmLOFhJRB3/4XWiAq2kCyr6GK2ahdTVTd9YpLdrJlSsGL
 5kARQ/hM86lgUhk44IW4W/A/H8FzfhEQode5tCvS/gs9vSoS2+PgTcR3G5bNkLZFGPGk
 g2RfDYThsQXhWEu5V63xiR/Y+b9BkUbrtxIr2bTXXPvXYZmHmuVoa+ZVRNa6c+stlB9M
 GAMGGh1dOlyCldNZZDFLAxd5VAA05XiB2M4/gSFl7ilRkRf/EwZDKZQFzuftEeeOxud5
 HIiLPZub19FYwO4G2sbvdxGd9YpoiFaUK96WIErsuRW1QSRW0ShEazVfvLIeGfg8bJRT
 PnJQ==
X-Gm-Message-State: AO0yUKUYQiCBs9gx9kA2DnJWTyCeMVa91rU7FjdKfXyPL60+YsXl8Quw
 tUzIoCN/ndPWy0Bc9G4KdXOondsO2Zj3/iVLfwwXJMUafBfUm7lwgzUSeLZ6C8bN+gIvqdonePl
 +aBDlSsb77fyfquQowuPqkTAGcOEL
X-Received: by 2002:a17:906:374d:b0:886:ec6e:4c1 with SMTP id
 e13-20020a170906374d00b00886ec6e04c1mr633424ejc.59.1676641743201; 
 Fri, 17 Feb 2023 05:49:03 -0800 (PST)
X-Google-Smtp-Source: AK7set/r/69ni+Mba8zkIatb38Z/tPHhrGIr7lvXbTHyyRyCQvluYDtYhE4iPQaBSZPM3iki4Tqzrg==
X-Received: by 2002:a17:906:374d:b0:886:ec6e:4c1 with SMTP id
 e13-20020a170906374d00b00886ec6e04c1mr633385ejc.59.1676641742698; 
 Fri, 17 Feb 2023 05:49:02 -0800 (PST)
Received: from cassiopeiae.. ([2a02:810d:4b3f:de78:642:1aff:fe31:a19f])
 by smtp.gmail.com with ESMTPSA id
 um6-20020a170906cf8600b008b13b0dabcasm2154793ejb.182.2023.02.17.05.49.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Feb 2023 05:49:02 -0800 (PST)
From: Danilo Krummrich <dakr@redhat.com>
To: airlied@gmail.com, daniel@ffwll.ch, tzimmermann@suse.de,
 mripard@kernel.org, corbet@lwn.net, christian.koenig@amd.com,
 bskeggs@redhat.com, Liam.Howlett@oracle.com, matthew.brost@intel.com,
 boris.brezillon@collabora.com, alexdeucher@gmail.com, ogabbay@kernel.org,
 bagasdotme@gmail.com, willy@infradead.org, jason@jlekstrand.net
Subject: [PATCH drm-next v2 15/16] drm/nouveau: implement new VM_BIND UAPI
Date: Fri, 17 Feb 2023 14:48:19 +0100
Message-Id: <20230217134820.14672-10-dakr@redhat.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230217134422.14116-1-dakr@redhat.com>
References: <20230217134422.14116-1-dakr@redhat.com>
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
Cc: linux-doc@vger.kernel.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, Danilo Krummrich <dakr@redhat.com>
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
 drivers/gpu/drm/nouveau/nouveau_drm.c   |  24 +-
 drivers/gpu/drm/nouveau/nouveau_drv.h   |   9 +-
 drivers/gpu/drm/nouveau/nouveau_exec.c  | 322 ++++++++++++++++
 drivers/gpu/drm/nouveau/nouveau_exec.h  |  39 ++
 drivers/gpu/drm/nouveau/nouveau_sched.c | 467 ++++++++++++++++++++++++
 drivers/gpu/drm/nouveau/nouveau_sched.h |  96 +++++
 drivers/gpu/drm/nouveau/nouveau_uvmm.c  | 446 ++++++++++++++++++++++
 drivers/gpu/drm/nouveau/nouveau_uvmm.h  |  28 ++
 13 files changed, 1451 insertions(+), 4 deletions(-)
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
index a70bd65e1400..c52e8096cca4 100644
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
index cde843156700..a5b1c7e7d24f 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -68,7 +68,9 @@
 #include "nouveau_platform.h"
 #include "nouveau_svm.h"
 #include "nouveau_dmem.h"
+#include "nouveau_exec.h"
 #include "nouveau_uvmm.h"
+#include "nouveau_sched.h"
 
 DECLARE_DYNDBG_CLASSMAP(drm_debug_classes, DD_CLASS_TYPE_DISJOINT_BITS, 0,
 			"DRM_UT_CORE",
@@ -190,6 +192,7 @@ nouveau_cli_fini(struct nouveau_cli *cli)
 	flush_work(&cli->work);
 	WARN_ON(!list_empty(&cli->worker));
 
+	nouveau_sched_entity_fini(&cli->sched_entity);
 	usif_client_fini(cli);
 	nouveau_uvmm_fini(&cli->uvmm);
 	nouveau_vmm_fini(&cli->svm);
@@ -297,6 +300,11 @@ nouveau_cli_init(struct nouveau_drm *drm, const char *sname,
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
@@ -609,8 +617,13 @@ nouveau_drm_device_init(struct drm_device *dev)
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
@@ -635,6 +648,8 @@ nouveau_drm_device_fini(struct drm_device *dev)
 	struct nouveau_cli *cli, *temp_cli;
 	struct nouveau_drm *drm = nouveau_drm(dev);
 
+	nouveau_sched_fini(&drm->sched);
+
 	if (nouveau_pmops_runtime()) {
 		pm_runtime_get_sync(dev->dev);
 		pm_runtime_forbid(dev->dev);
@@ -1175,6 +1190,9 @@ nouveau_ioctls[] = {
 	DRM_IOCTL_DEF_DRV(NOUVEAU_GEM_CPU_PREP, nouveau_gem_ioctl_cpu_prep, DRM_RENDER_ALLOW),
 	DRM_IOCTL_DEF_DRV(NOUVEAU_GEM_CPU_FINI, nouveau_gem_ioctl_cpu_fini, DRM_RENDER_ALLOW),
 	DRM_IOCTL_DEF_DRV(NOUVEAU_GEM_INFO, nouveau_gem_ioctl_info, DRM_RENDER_ALLOW),
+	DRM_IOCTL_DEF_DRV(NOUVEAU_VM_INIT, nouveau_uvmm_ioctl_vm_init, DRM_RENDER_ALLOW),
+	DRM_IOCTL_DEF_DRV(NOUVEAU_VM_BIND, nouveau_uvmm_ioctl_vm_bind, DRM_RENDER_ALLOW),
+	DRM_IOCTL_DEF_DRV(NOUVEAU_EXEC, nouveau_exec_ioctl_exec, DRM_RENDER_ALLOW),
 };
 
 long
@@ -1223,7 +1241,9 @@ static struct drm_driver
 driver_stub = {
 	.driver_features = DRIVER_GEM |
 			   DRIVER_MODESET |
-			   DRIVER_RENDER,
+			   DRIVER_RENDER |
+			   DRIVER_SYNCOBJ | DRIVER_SYNCOBJ_TIMELINE |
+			   DRIVER_GEM_GPUVA,
 	.open = nouveau_drm_open,
 	.postclose = nouveau_drm_postclose,
 	.lastclose = nouveau_vga_lastclose,
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
index 000000000000..536956a79279
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/nouveau_exec.c
@@ -0,0 +1,322 @@
+/* SPDX-License-Identifier: MIT */
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
+ * Since VM_BIND jobs update the GPU's VA space on job submit, EXEC jobs do have
+ * an up to date view of the VA space. However, the actual mappings might still
+ * be pending. Hence, EXEC jobs require to have the particular fences - of
+ * the corresponding VM_BIND jobs they depent on - attached to them.
+ */
+
+static int
+nouveau_exec_job_submit(struct nouveau_job *job)
+{
+	struct nouveau_exec_job *exec_job = to_nouveau_exec_job(job);
+	struct nouveau_cli *cli = exec_job->base.cli;
+	struct nouveau_uvmm *uvmm = nouveau_cli_uvmm(cli);
+	struct drm_exec *exec = &job->exec;
+	int ret;
+
+	nouveau_uvmm_lock(uvmm);
+	drm_exec_while_not_all_locked(exec) {
+		DRM_GPUVA_ITER(it, &uvmm->umgr);
+
+		drm_gpuva_iter_for_each(it) {
+			struct drm_gpuva *va = it.va;
+
+			ret = drm_exec_prepare_obj(exec, va->gem.obj, 1);
+			drm_exec_break_on_contention(exec);
+			if (ret)
+				return ret;
+		}
+	}
+	nouveau_uvmm_unlock(uvmm);
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
+static enum drm_gpu_sched_stat
+nouveau_exec_job_timeout(struct nouveau_job *job)
+{
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
+static struct nouveau_job_ops nouveau_exec_job_ops = {
+	.submit = nouveau_exec_job_submit,
+	.run = nouveau_exec_job_run,
+	.free = nouveau_exec_job_free,
+	.timeout = nouveau_exec_job_timeout,
+};
+
+int
+nouveau_exec_job_init(struct nouveau_exec_job **pjob,
+		      struct nouveau_exec_job_args *args)
+{
+	struct nouveau_exec_job *job;
+	int ret;
+
+	job = *pjob = kzalloc(sizeof(*job), GFP_KERNEL);
+	if (!job)
+		return -ENOMEM;
+
+	job->push.count = args->push.count;
+	job->push.s = kmemdup(args->push.s,
+			      sizeof(*args->push.s) *
+			      args->push.count,
+			      GFP_KERNEL);
+	if (!job->push.s) {
+		ret = -ENOMEM;
+		goto err_free_job;
+	}
+
+	job->base.ops = &nouveau_exec_job_ops;
+	job->base.resv_usage = DMA_RESV_USAGE_WRITE;
+
+	ret = nouveau_base_job_init(&job->base, &args->base);
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
+static int
+nouveau_exec(struct nouveau_exec_job_args *args)
+{
+	struct nouveau_exec_job *job;
+	int ret;
+
+	ret = nouveau_exec_job_init(&job, args);
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
+nouveau_exec_ioctl_exec(struct drm_device *dev,
+			void *data,
+			struct drm_file *file_priv)
+{
+	struct nouveau_abi16 *abi16 = nouveau_abi16_get(file_priv);
+	struct nouveau_cli *cli = nouveau_cli(file_priv);
+	struct nouveau_abi16_chan *chan16;
+	struct nouveau_channel *chan = NULL;
+	struct nouveau_exec_job_args args = {};
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
+	args.push.count = req->push_count;
+	args.push.s = u_memcpya(req->push_ptr, req->push_count,
+				sizeof(*args.push.s));
+	if (IS_ERR(args.push.s)) {
+		ret = PTR_ERR(args.push.s);
+		goto out;
+	}
+
+	ret = nouveau_job_ucopy_syncs(&args.base,
+				      req->wait_count, req->wait_ptr,
+				      req->sig_count, req->sig_ptr);
+	if (ret)
+		goto out_free_pushs;
+
+	args.base.sched_entity = &chan16->sched_entity;
+	args.base.chan = chan;
+	args.base.file_priv = file_priv;
+
+	ret = nouveau_exec(&args);
+	if (ret)
+		goto out_free_syncs;
+
+out_free_syncs:
+	u_free(args.base.out_sync.s);
+	u_free(args.base.in_sync.s);
+out_free_pushs:
+	u_free(args.push.s);
+out:
+	return nouveau_abi16_put(abi16, ret);
+}
diff --git a/drivers/gpu/drm/nouveau/nouveau_exec.h b/drivers/gpu/drm/nouveau/nouveau_exec.h
new file mode 100644
index 000000000000..5bca1f9aba74
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/nouveau_exec.h
@@ -0,0 +1,39 @@
+/* SPDX-License-Identifier: MIT */
+
+#ifndef __NOUVEAU_EXEC_H__
+#define __NOUVEAU_EXEC_H__
+
+#include <drm/drm_exec.h>
+
+#include "nouveau_drv.h"
+#include "nouveau_sched.h"
+
+struct nouveau_exec_job_args {
+	struct nouveau_job_args base;
+	struct drm_exec exec;
+
+	struct {
+		struct drm_nouveau_exec_push *s;
+		u32 count;
+	} push;
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
+#define to_nouveau_exec_job(job)		\
+		container_of((job), struct nouveau_exec_job, base)
+
+int nouveau_exec_job_init(struct nouveau_exec_job **job,
+			  struct nouveau_exec_job_args *args);
+
+int nouveau_exec_ioctl_exec(struct drm_device *dev, void *data,
+			    struct drm_file *file_priv);
+
+#endif
diff --git a/drivers/gpu/drm/nouveau/nouveau_sched.c b/drivers/gpu/drm/nouveau/nouveau_sched.c
new file mode 100644
index 000000000000..8e32fcbc09ab
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/nouveau_sched.c
@@ -0,0 +1,467 @@
+/* SPDX-License-Identifier: MIT */
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
+ * timeouts just because of too many clients submitting too many jobs. We don't
+ * want jobs to time out because of system load, but because of the job being
+ * too bulky.
+ *
+ * For now allow for up to 16 concurrent jobs in flight until we know how many
+ * rings the hardware can process in parallel.
+ */
+#define NOUVEAU_SCHED_HW_SUBMISSIONS		16
+#define NOUVEAU_SCHED_JOB_TIMEOUT_MS		10000
+
+int
+nouveau_job_ucopy_syncs(struct nouveau_job_args *args,
+			u32 inc, u64 ins,
+			u32 outc, u64 outs)
+{
+	struct drm_nouveau_sync **s;
+	int ret;
+
+	if (inc) {
+		s = &args->in_sync.s;
+
+		args->in_sync.count = inc;
+		*s = u_memcpya(ins, inc, sizeof(**s));
+		if (IS_ERR(*s)) {
+			ret = PTR_ERR(*s);
+			goto err_out;
+		}
+	}
+
+	if (outc) {
+		s = &args->out_sync.s;
+
+		args->out_sync.count = outc;
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
+	u_free(args->in_sync.s);
+err_out:
+	return ret;
+}
+
+int
+nouveau_base_job_init(struct nouveau_job *job,
+		      struct nouveau_job_args *args)
+{
+	struct nouveau_sched_entity *entity = args->sched_entity;
+	int ret;
+
+	job->file_priv = args->file_priv;
+	job->cli = nouveau_cli(args->file_priv);
+	job->chan = args->chan;
+	job->entity = entity;
+
+	job->in_sync.count = args->in_sync.count;
+	if (job->in_sync.count) {
+		if (job->sync)
+			return -EINVAL;
+
+		job->in_sync.data = kmemdup(args->in_sync.s,
+					 sizeof(*args->in_sync.s) *
+					 args->in_sync.count,
+					 GFP_KERNEL);
+		if (!job->in_sync.data)
+			return -ENOMEM;
+	}
+
+	job->out_sync.count = args->out_sync.count;
+	if (job->out_sync.count) {
+		if (job->sync) {
+			ret = -EINVAL;
+			goto err_free_in_sync;
+		}
+
+		job->out_sync.data = kmemdup(args->out_sync.s,
+					  sizeof(*args->out_sync.s) *
+					  args->out_sync.count,
+					  GFP_KERNEL);
+		if (!job->out_sync.data) {
+			ret = -ENOMEM;
+			goto err_free_in_sync;
+		}
+
+		job->out_sync.objs = kcalloc(job->out_sync.count,
+					     sizeof(*job->out_sync.objs),
+					     GFP_KERNEL);
+		if (!job->out_sync.objs) {
+			ret = -ENOMEM;
+			goto err_free_out_sync;
+		}
+
+		job->out_sync.chains = kcalloc(job->out_sync.count,
+					       sizeof(*job->out_sync.chains),
+					       GFP_KERNEL);
+		if (!job->out_sync.chains) {
+			ret = -ENOMEM;
+			goto err_free_objs;
+		}
+
+	}
+
+	ret = drm_sched_job_init(&job->base, &entity->base, NULL);
+	if (ret)
+		goto err_free_chains;
+
+	return 0;
+
+err_free_chains:
+	kfree(job->out_sync.chains);
+err_free_objs:
+	kfree(job->out_sync.objs);
+err_free_out_sync:
+	kfree(job->out_sync.data);
+err_free_in_sync:
+	kfree(job->in_sync.data);
+return ret;
+}
+
+void
+nouveau_base_job_free(struct nouveau_job *job)
+{
+	kfree(job->in_sync.data);
+	kfree(job->out_sync.data);
+	kfree(job->out_sync.objs);
+	kfree(job->out_sync.chains);
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
+nouveau_job_add_deps(struct nouveau_job *job)
+{
+	struct dma_fence *in_fence = NULL;
+	int ret, i;
+
+	for (i = 0; i < job->in_sync.count; i++) {
+		struct drm_nouveau_sync *sync = &job->in_sync.data[i];
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
+nouveau_job_fence_attach_prepare(struct nouveau_job *job)
+{
+	int i, ret;
+
+	for (i = 0; i < job->out_sync.count; i++) {
+		struct drm_nouveau_sync *sync = &job->out_sync.data[i];
+		struct drm_syncobj **pobj = &job->out_sync.objs[i];
+		struct dma_fence_chain **pchain = &job->out_sync.chains[i];
+		u32 stype = sync->flags & DRM_NOUVEAU_SYNC_TYPE_MASK;
+
+		if (stype != DRM_NOUVEAU_SYNC_SYNCOBJ &&
+		    stype != DRM_NOUVEAU_SYNC_TIMELINE_SYNCOBJ) {
+			ret = -EINVAL;
+			goto err_sync_cleanup;
+		}
+
+		*pobj = drm_syncobj_find(job->file_priv, sync->handle);
+		if (!*pobj) {
+			NV_PRINTK(warn, job->cli,
+				  "Failed to find syncobj (-> out): handle=%d\n",
+				  sync->handle);
+			ret = -ENOENT;
+			goto err_sync_cleanup;
+		}
+
+		if (stype == DRM_NOUVEAU_SYNC_TIMELINE_SYNCOBJ) {
+			*pchain = dma_fence_chain_alloc();
+			if (!*pchain) {
+				ret = -ENOMEM;
+				goto err_sync_cleanup;
+			}
+		}
+	}
+
+	return 0;
+
+err_sync_cleanup:
+	for (i = 0; i < job->out_sync.count; i++) {
+		struct drm_syncobj *obj = job->out_sync.objs[i];
+		struct dma_fence_chain *chain = job->out_sync.chains[i];
+
+		if (obj)
+			drm_syncobj_put(obj);
+
+		if (chain)
+			dma_fence_chain_free(chain);
+	}
+	return ret;
+}
+
+static void
+nouveau_job_fence_attach(struct nouveau_job *job)
+{
+	struct dma_fence *fence = job->done_fence;
+	int i;
+
+	for (i = 0; i < job->out_sync.count; i++) {
+		struct drm_nouveau_sync *sync = &job->out_sync.data[i];
+		struct drm_syncobj *obj = job->out_sync.objs[i];
+		struct dma_fence_chain *chain = job->out_sync.chains[i];
+		u32 stype = sync->flags & DRM_NOUVEAU_SYNC_TYPE_MASK;
+
+		if (stype == DRM_NOUVEAU_SYNC_TIMELINE_SYNCOBJ) {
+			drm_syncobj_add_point(obj, chain, fence,
+					      sync->timeline_value);
+		} else {
+			drm_syncobj_replace_fence(obj, fence);
+		}
+
+		drm_syncobj_put(obj);
+	}
+}
+
+static int
+nouveau_job_validate(struct nouveau_job *job)
+{
+	struct drm_exec *exec = &job->exec;
+	struct drm_gem_object *obj;
+	unsigned long index;
+	int ret;
+
+	drm_exec_for_each_locked_object(exec, index, obj) {
+		struct nouveau_bo *nvbo = nouveau_gem_object(obj);
+
+		ret = nouveau_bo_validate(nvbo, true, false);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+static void
+nouveau_job_resv_add_fence(struct nouveau_job *job)
+{
+	struct drm_exec *exec = &job->exec;
+	struct drm_gem_object *obj;
+	unsigned long index;
+
+	drm_exec_for_each_locked_object(exec, index, obj) {
+		struct dma_resv *resv = obj->resv;
+
+		dma_resv_add_fence(resv, job->done_fence, job->resv_usage);
+	}
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
+	/* Make sure the job appears on the sched_entity's queue in the same
+	 * order as it was submitted.
+	 */
+	mutex_lock(&entity->job.mutex);
+
+	if (job->ops->submit) {
+		ret = job->ops->submit(job);
+		if (ret)
+			goto err;
+	}
+
+	ret = nouveau_job_validate(job);
+	if (ret)
+		goto err;
+
+	ret = nouveau_job_add_deps(job);
+	if (ret)
+		goto err;
+
+	ret = nouveau_job_fence_attach_prepare(job);
+	if (ret)
+		goto err;
+
+	drm_sched_job_arm(&job->base);
+	job->done_fence = dma_fence_get(&job->base.s_fence->finished);
+
+	nouveau_job_fence_attach(job);
+	nouveau_job_resv_add_fence(job);
+
+	drm_exec_fini(&job->exec);
+
+	drm_sched_entity_push_job(&job->base);
+
+	mutex_unlock(&entity->job.mutex);
+
+	if (job->sync)
+		dma_fence_wait(job->done_fence, true);
+
+	return 0;
+
+err:
+	mutex_unlock(&entity->job.mutex);
+	drm_exec_fini(&job->exec);
+	return ret;
+}
+
+static struct dma_fence *
+nouveau_job_run(struct nouveau_job *job)
+{
+	return job->ops->run(job);
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
+
+	if (job->ops->timeout)
+		return job->ops->timeout(job);
+
+	NV_PRINTK(warn, job->cli, "Job timed out.\n");
+
+	return DRM_GPU_SCHED_STAT_ENODEV;
+}
+
+static void
+nouveau_sched_free_job(struct drm_sched_job *sched_job)
+{
+	struct nouveau_job *job = to_nouveau_job(sched_job);
+
+	nouveau_job_fini(job);
+}
+
+int nouveau_sched_entity_init(struct nouveau_sched_entity *entity,
+			      struct drm_gpu_scheduler *sched)
+{
+
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
index 000000000000..407a62b18788
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/nouveau_sched.h
@@ -0,0 +1,96 @@
+/* SPDX-License-Identifier: MIT */
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
+
+#define to_nouveau_job(sched_job)		\
+		container_of((sched_job), struct nouveau_job, base)
+
+struct nouveau_job_args {
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
+struct nouveau_job {
+	struct drm_sched_job base;
+
+	struct nouveau_sched_entity *entity;
+
+	struct drm_file *file_priv;
+	struct nouveau_cli *cli;
+	struct nouveau_channel *chan;
+
+	struct drm_exec exec;
+	enum dma_resv_usage resv_usage;
+	struct dma_fence *done_fence;
+
+	bool sync;
+
+	struct {
+		struct drm_nouveau_sync *data;
+		u32 count;
+	} in_sync;
+
+	struct {
+		struct drm_nouveau_sync *data;
+		struct drm_syncobj **objs;
+		struct dma_fence_chain **chains;
+		u32 count;
+	} out_sync;
+
+	struct nouveau_job_ops {
+		int (*submit)(struct nouveau_job *);
+		struct dma_fence *(*run)(struct nouveau_job *);
+		void (*free)(struct nouveau_job *);
+		enum drm_gpu_sched_stat (*timeout)(struct nouveau_job *);
+	} *ops;
+};
+
+int nouveau_job_ucopy_syncs(struct nouveau_job_args *args,
+			    u32 inc, u64 ins,
+			    u32 outc, u64 outs);
+
+int nouveau_base_job_init(struct nouveau_job *job,
+			  struct nouveau_job_args *args);
+void nouveau_base_job_free(struct nouveau_job *job);
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
diff --git a/drivers/gpu/drm/nouveau/nouveau_uvmm.c b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
index 2f7747a5a917..a23b71c31021 100644
--- a/drivers/gpu/drm/nouveau/nouveau_uvmm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
@@ -57,6 +57,40 @@
 #define NOUVEAU_VA_SPACE_START		0x0
 #define NOUVEAU_VA_SPACE_END		(1ULL << NOUVEAU_VA_SPACE_BITS)
 
+#define list_for_each_op(_op, _ops) list_for_each_entry(_op, _ops, entry)
+#define list_for_each_op_continue_reverse(_op, _ops) \
+	list_for_each_entry_continue_reverse(_op, _ops, entry)
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
+
+	struct nouveau_uvma_region *reg;
+	struct nouveau_uvma_alloc new;
+	struct drm_gpuva_ops *ops;
+};
+
 struct uvmm_map_args {
 	u64 addr;
 	u64 range;
@@ -953,6 +987,418 @@ nouveau_uvmm_sm_unmap_cleanup(struct nouveau_uvmm *uvmm,
 	uvmm_sm_cleanup(uvmm, new, ops, true);
 }
 
+static int
+bind_validate_op(struct nouveau_job *job,
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
+static int
+uvmm_bind_job_submit(struct nouveau_job *job)
+{
+	struct nouveau_uvmm *uvmm = nouveau_cli_uvmm(job->cli);
+	struct nouveau_uvmm_bind_job *bind_job = to_uvmm_bind_job(job);
+	struct drm_exec *exec = &job->exec;
+	struct bind_job_op *op;
+	int ret;
+
+	/* We need to keep holding the uvmm lock until this function can't fail
+	 * anymore, since we need to be able to unind all GPUVA space changes on
+	 * failure.
+	 */
+	nouveau_uvmm_lock(uvmm);
+	list_for_each_op(op, &bind_job->ops) {
+
+		if (op->op == OP_MAP) {
+			op->gem.obj = drm_gem_object_lookup(job->file_priv,
+							    op->gem.handle);
+			if (!op->gem.obj) {
+				ret = -ENOENT;
+				goto unwind;
+			}
+		}
+
+		ret = bind_validate_op(job, op);
+		if (ret)
+			goto unwind;
+
+		switch (op->op) {
+		case OP_ALLOC: {
+			bool sparse = op->flags & DRM_NOUVEAU_VM_BIND_SPARSE;
+
+			ret = nouveau_uvma_region_create(uvmm,
+							 op->va.addr,
+							 op->va.range,
+							 sparse);
+			if (ret)
+				goto unwind;
+
+			break;
+		}
+		case OP_FREE:
+			op->reg = nouveau_uvma_region_find(uvmm, op->va.addr,
+							   op->va.range);
+			if (!op->reg)
+				goto unwind;
+
+			op->ops = nouveau_uvmm_sm_unmap_ops(uvmm,
+							    op->va.addr,
+							    op->va.range);
+			if (IS_ERR(op->ops)) {
+				ret = PTR_ERR(op->ops);
+				goto unwind;
+			}
+
+			ret = nouveau_uvmm_sm_unmap_prepare(uvmm, &op->new,
+							    op->ops);
+			if (ret)
+				goto unwind;
+
+			nouveau_uvma_region_remove(op->reg);
+
+			break;
+		case OP_MAP:
+			op->ops = nouveau_uvmm_sm_map_ops(uvmm,
+							  op->va.addr,
+							  op->va.range,
+							  op->gem.obj,
+							  op->gem.offset);
+			if (IS_ERR(op->ops)) {
+				ret = PTR_ERR(op->ops);
+				goto unwind;
+			}
+
+			ret = nouveau_uvmm_sm_map_prepare(uvmm, &op->new,
+							  op->ops, op->va.addr,
+							  op->va.range,
+							  op->flags && 0xff);
+			if (ret)
+				goto unwind;
+
+			break;
+		case OP_UNMAP:
+			op->ops = nouveau_uvmm_sm_unmap_ops(uvmm,
+							    op->va.addr,
+							    op->va.range);
+			if (IS_ERR(op->ops)) {
+				ret = PTR_ERR(op->ops);
+				goto unwind;
+			}
+
+			ret = nouveau_uvmm_sm_unmap_prepare(uvmm, &op->new,
+							    op->ops);
+			if (ret)
+				goto unwind;
+
+			break;
+		default:
+			ret = -EINVAL;
+			goto unwind;
+		}
+	}
+
+	drm_exec_while_not_all_locked(exec) {
+		list_for_each_op(op, &bind_job->ops) {
+			if (op->op != OP_MAP)
+				continue;
+
+			ret = drm_exec_prepare_obj(exec, op->gem.obj, 1);
+			drm_exec_break_on_contention(exec);
+			if (ret)
+				goto unwind;
+		}
+	}
+	nouveau_uvmm_unlock(uvmm);
+
+	return 0;
+
+unwind:
+	list_for_each_op_continue_reverse(op, &bind_job->ops) {
+		switch (op->op) {
+		case OP_ALLOC:
+			nouveau_uvma_region_destroy(uvmm, op->va.addr,
+						    op->va.range);
+			break;
+		case OP_FREE:
+			__nouveau_uvma_region_insert(uvmm, op->reg);
+			nouveau_uvmm_sm_unmap_prepare_unwind(uvmm, &op->new,
+							     op->ops);
+			break;
+		case OP_MAP:
+			nouveau_uvmm_sm_map_prepare_unwind(uvmm, &op->new,
+							   op->ops,
+							   op->va.addr,
+							   op->va.range);
+			break;
+		case OP_UNMAP:
+			nouveau_uvmm_sm_unmap_prepare_unwind(uvmm, &op->new,
+							     op->ops);
+			break;
+		}
+
+		drm_gpuva_ops_free(&uvmm->umgr, op->ops);
+		op->ops = NULL;
+		op->reg = NULL;
+	}
+
+	nouveau_uvmm_unlock(uvmm);
+	return ret;
+}
+
+static struct dma_fence *
+uvmm_bind_job_run(struct nouveau_job *job)
+{
+	struct nouveau_uvmm_bind_job *bind_job = to_uvmm_bind_job(job);
+	struct nouveau_uvmm *uvmm = nouveau_cli_uvmm(job->cli);
+	struct bind_job_op *op;
+	int ret = 0;
+
+	list_for_each_op(op, &bind_job->ops) {
+		switch (op->op) {
+		case OP_ALLOC:
+			/* noop */
+			break;
+		case OP_MAP:
+			ret = nouveau_uvmm_sm_map(uvmm, &op->new, op->ops);
+			if (ret)
+				goto out;
+			break;
+		case OP_FREE:
+			fallthrough;
+		case OP_UNMAP:
+			ret = nouveau_uvmm_sm_unmap(uvmm, &op->new, op->ops);
+			if (ret)
+				goto out;
+			break;
+		}
+	}
+
+out:
+	if (ret)
+		NV_PRINTK(err, job->cli, "bind job failed: %d\n", ret);
+	return ERR_PTR(ret);
+}
+
+static void
+uvmm_bind_job_free(struct nouveau_job *job)
+{
+	struct nouveau_uvmm_bind_job *bind_job = to_uvmm_bind_job(job);
+	struct nouveau_uvmm *uvmm = nouveau_cli_uvmm(job->cli);
+	struct bind_job_op *op, *next;
+
+	list_for_each_op_safe(op, next, &bind_job->ops) {
+		struct drm_gem_object *obj = op->gem.obj;
+
+		/* When uvmm_bind_job_submit() failed op->ops and op->reg will
+		 * be NULL, hence we correctly skip the cleanup.
+		 */
+		switch (op->op) {
+		case OP_ALLOC:
+			/* noop */
+			break;
+		case OP_FREE:
+			if (!IS_ERR_OR_NULL(op->ops))
+				nouveau_uvmm_sm_unmap_cleanup(uvmm, &op->new,
+							      op->ops);
+
+			if (op->reg) {
+				nouveau_uvma_region_sparse_unref(op->reg);
+				nouveau_uvma_region_free(op->reg);
+			}
+
+			break;
+		case OP_MAP:
+			if (!IS_ERR_OR_NULL(op->ops))
+				nouveau_uvmm_sm_map_cleanup(uvmm, &op->new,
+							    op->ops);
+			break;
+		case OP_UNMAP:
+			if (!IS_ERR_OR_NULL(op->ops))
+				nouveau_uvmm_sm_unmap_cleanup(uvmm, &op->new,
+							      op->ops);
+			break;
+		}
+
+		if (!IS_ERR_OR_NULL(op->ops))
+			drm_gpuva_ops_free(&uvmm->umgr, op->ops);
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
+	.submit = uvmm_bind_job_submit,
+	.run = uvmm_bind_job_run,
+	.free = uvmm_bind_job_free,
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
+	op->gem.handle = uop->handle;
+	op->gem.offset = uop->bo_offset;
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
+nouveau_uvmm_bind_job_init(struct nouveau_uvmm_bind_job **pjob,
+			   struct nouveau_uvmm_bind_job_args *args)
+{
+	struct nouveau_uvmm_bind_job *job;
+	struct bind_job_op *op;
+	int i, ret;
+
+	job = *pjob = kzalloc(sizeof(*job), GFP_KERNEL);
+	if (!job)
+		return -ENOMEM;
+
+	INIT_LIST_HEAD(&job->ops);
+
+	for (i = 0; i < args->op.count; i++) {
+		ret = bind_job_op_from_uop(&op, &args->op.s[i]);
+		if (ret)
+			goto err_free;
+
+		list_add_tail(&op->entry, &job->ops);
+	}
+
+	job->base.sync = !(args->flags & DRM_NOUVEAU_VM_BIND_RUN_ASYNC);
+	job->base.ops = &nouveau_bind_job_ops;
+	job->base.resv_usage = DMA_RESV_USAGE_BOOKKEEP;
+
+	ret = nouveau_base_job_init(&job->base, &args->base);
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
+int
+nouveau_uvmm_ioctl_vm_init(struct drm_device *dev,
+			   void *data,
+			   struct drm_file *file_priv)
+{
+	struct nouveau_cli *cli = nouveau_cli(file_priv);
+	struct drm_nouveau_vm_init *init = data;
+
+	return nouveau_uvmm_init(&cli->uvmm, cli, init);
+}
+
+static int
+nouveau_uvmm_vm_bind(struct nouveau_uvmm_bind_job_args *args)
+{
+	struct nouveau_uvmm_bind_job *job;
+	int ret;
+
+	ret = nouveau_uvmm_bind_job_init(&job, args);
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
+nouveau_uvmm_ioctl_vm_bind(struct drm_device *dev,
+			   void *data,
+			   struct drm_file *file_priv)
+{
+	struct nouveau_cli *cli = nouveau_cli(file_priv);
+	struct nouveau_uvmm_bind_job_args args = {};
+	struct drm_nouveau_vm_bind *req = data;
+	int ret = 0;
+
+	if (unlikely(!nouveau_cli_uvmm_locked(cli)))
+		return -ENOSYS;
+
+	args.flags = req->flags;
+
+	args.op.count = req->op_count;
+	args.op.s = u_memcpya(req->op_ptr, req->op_count,
+			      sizeof(*args.op.s));
+	if (IS_ERR(args.op.s))
+		return PTR_ERR(args.op.s);
+
+	ret = nouveau_job_ucopy_syncs(&args.base,
+				      req->wait_count, req->wait_ptr,
+				      req->sig_count, req->sig_ptr);
+	if (ret)
+		goto out_free_ops;
+
+	args.base.sched_entity = &cli->sched_entity;
+	args.base.file_priv = file_priv;
+
+	ret = nouveau_uvmm_vm_bind(&args);
+	if (ret)
+		goto out_free_syncs;
+
+out_free_syncs:
+	u_free(args.base.out_sync.s);
+	u_free(args.base.in_sync.s);
+out_free_ops:
+	u_free(args.op.s);
+	return ret;
+}
+
 void
 nouveau_uvmm_bo_map_all(struct nouveau_bo *nvbo, struct nouveau_mem *mem)
 {
diff --git a/drivers/gpu/drm/nouveau/nouveau_uvmm.h b/drivers/gpu/drm/nouveau/nouveau_uvmm.h
index 858840e9e0c5..d86a521100fa 100644
--- a/drivers/gpu/drm/nouveau/nouveau_uvmm.h
+++ b/drivers/gpu/drm/nouveau/nouveau_uvmm.h
@@ -36,6 +36,25 @@ struct nouveau_uvma_alloc {
 	struct nouveau_uvma *next;
 };
 
+struct nouveau_uvmm_bind_job {
+	struct nouveau_job base;
+
+	/* struct bind_job_op */
+	struct list_head ops;
+};
+
+struct nouveau_uvmm_bind_job_args {
+	struct nouveau_job_args base;
+	unsigned int flags;
+
+	struct {
+		struct drm_nouveau_vm_bind_op *s;
+		u32 count;
+	} op;
+};
+
+#define to_uvmm_bind_job(job) container_of((job), struct nouveau_uvmm_bind_job, base)
+
 #define uvmm_from_mgr(x) container_of((x), struct nouveau_uvmm, umgr)
 #define uvma_from_va(x) container_of((x), struct nouveau_uvma, va)
 #define uvma_region_from_va_region(x) container_of((x), struct nouveau_uvma_region, region)
@@ -97,6 +116,15 @@ void nouveau_uvmm_sm_unmap_cleanup(struct nouveau_uvmm *uvmm,
 				   struct nouveau_uvma_alloc *new,
 				   struct drm_gpuva_ops *ops);
 
+int nouveau_uvmm_bind_job_init(struct nouveau_uvmm_bind_job **pjob,
+			       struct nouveau_uvmm_bind_job_args *args);
+
+int nouveau_uvmm_ioctl_vm_init(struct drm_device *dev, void *data,
+			       struct drm_file *file_priv);
+
+int nouveau_uvmm_ioctl_vm_bind(struct drm_device *dev, void *data,
+			       struct drm_file *file_priv);
+
 static inline void nouveau_uvmm_lock(struct nouveau_uvmm *uvmm)
 {
 	mutex_lock(&uvmm->mutex);
-- 
2.39.1

