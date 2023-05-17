Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A29F9706BB5
	for <lists+dri-devel@lfdr.de>; Wed, 17 May 2023 16:53:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68AFF10E436;
	Wed, 17 May 2023 14:52:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF9E610E434
 for <dri-devel@lists.freedesktop.org>; Wed, 17 May 2023 14:52:47 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-3093a778089so629977f8f.1
 for <dri-devel@lists.freedesktop.org>; Wed, 17 May 2023 07:52:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1684335167; x=1686927167; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Nr7mrK+6tSYd8YQg8OUgoKT303dzmLPmQg+9F+7XGpw=;
 b=LzLDbCdcTBYtSEhd2l/0x+6iblcvk8LvzFbXOer3dStbScQfSb3AuwfX9ADL5SfoVx
 pNwu/FyIyTdKo5Y/nGSeJ6oIMO5SVb1fwjeTOz7WZH7dpFqcevDNsr7DO9F0ajlqtStV
 aOiDluo/V3mcJ3O294/tKHQOT4ksz4xkkM/+40IC0+wdldzn4e4TakwirwGaglzuMJiH
 wMd3cAteZqah/0CaQfSmGjvXbQgTga3WVxjUS4VtghXDsNIJWLb1azMix3Y5R9g/eaFv
 2TqANN3iwPyqD7KktB4CknbHn25Gr+kQga/PRZkcemKLIZQJCn1YNt7smLzS4EeDy8IK
 E9dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684335167; x=1686927167;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Nr7mrK+6tSYd8YQg8OUgoKT303dzmLPmQg+9F+7XGpw=;
 b=lZa/8AoBgScU/c6SnBse/M+Ok/WD/Bo9+snS4CIeEZ5MauXYRbiKqFRH6Vah8OLzm3
 94Wn+YLoUnWutTNr95JosDr7s2cCI1aD48BpwYjqdF3jSpPy35EEkF75+txSwmU1K6bO
 30SPyxOTsuKrB+851KU91DkxdS+7qSAsBnQBmtff0Km9mSQkRWr75dRUEwrLaWH4I1gs
 PpMM06H+wg2cnvi566cmc94vR6OelQbMirhnrbHeasy8O/K6Ih7exIddr1qCGDoYtiEd
 tlX0Zu6Q/EkgDkE7N+1Kx0yxZGtVfguqP5HuReMbXienUOMOsOeBNuNxRRatkcOMXdjg
 wvxw==
X-Gm-Message-State: AC+VfDy1+5Xjh7SsMLoroGp2/ER8fvc2AYwn+OoC0GeT4pa6M8HaEMkj
 TwwpyeQ5H3rr9QZfTQqCxG2Ohw==
X-Google-Smtp-Source: ACHHUZ6E9PDxwNASjWneyPfqsNbUMzas8Fc4Vnk/HvhbHQcmj7121Shzz9bplamcC/BeRNWcybflUw==
X-Received: by 2002:a5d:63c3:0:b0:306:321c:995b with SMTP id
 c3-20020a5d63c3000000b00306321c995bmr966382wrw.41.1684335167157; 
 Wed, 17 May 2023 07:52:47 -0700 (PDT)
Received: from blaptop.baylibre
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id
 v11-20020a5d678b000000b002f7780eee10sm2979098wru.59.2023.05.17.07.52.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 May 2023 07:52:46 -0700 (PDT)
From: Alexandre Bailon <abailon@baylibre.com>
To: airlied@gmail.com, daniel@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de
Subject: [PATCH 3/7] drm/apu: Add support of requests
Date: Wed, 17 May 2023 16:52:33 +0200
Message-Id: <20230517145237.295461-4-abailon@baylibre.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230517145237.295461-1-abailon@baylibre.com>
References: <20230517145237.295461-1-abailon@baylibre.com>
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
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, bero@baylibre.com,
 khilman@baylibre.com, jstephan@baylibre.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, christian.koenig@amd.com,
 linaro-mm-sig@lists.linaro.org, Alexandre Bailon <abailon@baylibre.com>,
 robh+dt@kernel.org, linux-mediatek@lists.infradead.org, nbelin@baylibre.com,
 krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
 linux-media@vger.kernel.org, sumit.semwal@linaro.org,
 linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This updates the APU driver to with two new ioctls
to queue and dequeue requests.
This uses DRM scheduler to manage the requests.
The requests allocation and send and receive operations
are platform specifics and must be implemented as callback.

Signed-off-by: Alexandre Bailon <abailon@baylibre.com>
Reviewed-by: Julien Stephan <jstephan@baylibre.com>
---
 drivers/gpu/drm/apu/Kconfig        |   1 +
 drivers/gpu/drm/apu/Makefile       |   1 +
 drivers/gpu/drm/apu/apu_drv.c      |  52 +--
 drivers/gpu/drm/apu/apu_internal.h |  93 ++++-
 drivers/gpu/drm/apu/apu_sched.c    | 564 +++++++++++++++++++++++++++++
 include/uapi/drm/apu_drm.h         |  31 +-
 6 files changed, 697 insertions(+), 45 deletions(-)
 create mode 100644 drivers/gpu/drm/apu/apu_sched.c

diff --git a/drivers/gpu/drm/apu/Kconfig b/drivers/gpu/drm/apu/Kconfig
index 226dcf072115..a769df42091c 100644
--- a/drivers/gpu/drm/apu/Kconfig
+++ b/drivers/gpu/drm/apu/Kconfig
@@ -5,6 +5,7 @@ config DRM_APU
 	tristate "APU (AI Processor Unit)"
 	select DRM_GEM_DMA_HELPER
 	select DRM_KMS_HELPER
+	select DRM_SCHED
 	help
 	  This provides a DRM driver that provides some facilities to
 	  communicate with an AI Processor Unit (APU).
diff --git a/drivers/gpu/drm/apu/Makefile b/drivers/gpu/drm/apu/Makefile
index 91894250d4c1..fc8d6380fc38 100644
--- a/drivers/gpu/drm/apu/Makefile
+++ b/drivers/gpu/drm/apu/Makefile
@@ -2,5 +2,6 @@
 
 drm_apu-y += apu_drv.o
 drm_apu-y += apu_gem.o
+drm_apu-y += apu_sched.o
 
 obj-$(CONFIG_DRM_APU) += drm_apu.o
diff --git a/drivers/gpu/drm/apu/apu_drv.c b/drivers/gpu/drm/apu/apu_drv.c
index 323e267b0f53..b6bd340b2bc8 100644
--- a/drivers/gpu/drm/apu/apu_drv.c
+++ b/drivers/gpu/drm/apu/apu_drv.c
@@ -14,14 +14,15 @@
 
 static LIST_HEAD(apu_devices);
 
-static int ioctl_apu_state(struct drm_device *dev, void *data,
-			   struct drm_file *file_priv);
-
 static const struct drm_ioctl_desc ioctls[] = {
 	DRM_IOCTL_DEF_DRV(APU_STATE, ioctl_apu_state,
 			  DRM_RENDER_ALLOW),
 	DRM_IOCTL_DEF_DRV(APU_GEM_NEW, ioctl_gem_new,
 			  DRM_RENDER_ALLOW),
+	DRM_IOCTL_DEF_DRV(APU_GEM_QUEUE, ioctl_gem_queue,
+			  DRM_RENDER_ALLOW),
+	DRM_IOCTL_DEF_DRV(APU_GEM_DEQUEUE, ioctl_gem_dequeue,
+			  DRM_RENDER_ALLOW),
 };
 
 DEFINE_DRM_GEM_DMA_FOPS(apu_drm_ops);
@@ -134,7 +135,8 @@ struct apu_core *apu_core_alloc(struct apu_drm *apu, struct apu_core_ops *ops,
 {
 	struct apu_core *core;
 
-	if (!ops || !ops->is_ready)
+	if (!ops || !ops->alloc_prepare_request || !ops->send_request
+		|| !ops->handle_request || !ops->is_ready)
 		return NULL;
 
 	core = devm_kzalloc(apu->dev, sizeof(*core), GFP_KERNEL);
@@ -148,6 +150,8 @@ struct apu_core *apu_core_alloc(struct apu_drm *apu, struct apu_core_ops *ops,
 	core->apu = apu;
 	core->priv = priv;
 	core->ops = ops;
+	spin_lock_init(&core->ctx_lock);
+	INIT_LIST_HEAD(&core->requests);
 
 	list_add(&core->node, &apu->cores);
 
@@ -192,7 +196,7 @@ int apu_core_register(struct device *dev, struct apu_core *core, void *priv)
 			return ret;
 	}
 
-	return 0;
+	return apu_drm_job_init(core);
 }
 EXPORT_SYMBOL_GPL(apu_core_register);
 
@@ -203,6 +207,7 @@ EXPORT_SYMBOL_GPL(apu_core_register);
  */
 void apu_core_remove(struct apu_core *core)
 {
+	apu_sched_fini(core);
 	core->dev_priv = NULL;
 }
 EXPORT_SYMBOL_GPL(apu_core_remove);
@@ -233,42 +238,5 @@ struct apu_core *apu_find_core_by_priv(void *priv)
 }
 EXPORT_SYMBOL_GPL(apu_find_core_by_priv);
 
-static struct apu_core *get_apu_core(struct apu_drm *apu, int device_id)
-{
-	struct apu_core *core;
-
-	list_for_each_entry(core, &apu->cores, node) {
-		if (core->device_id == device_id)
-			return core;
-	}
-
-	return NULL;
-}
-
-static void apu_core_update_state(struct apu_core *core)
-{
-	if (!core->ops->is_ready(core))
-		core->flags &= ~APU_ONLINE;
-}
-
-static int ioctl_apu_state(struct drm_device *dev, void *data,
-			   struct drm_file *file_priv)
-{
-	struct apu_drm *apu = dev->dev_private;
-	struct drm_apu_state *args = data;
-	struct apu_core *core;
-
-	args->flags = 0;
-
-	core = get_apu_core(apu, args->device);
-	if (!core)
-		return -ENODEV;
-
-	apu_core_update_state(core);
-	args->flags |= core->flags;
-
-	return 0;
-}
-
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Alexandre Bailon");
diff --git a/drivers/gpu/drm/apu/apu_internal.h b/drivers/gpu/drm/apu/apu_internal.h
index 203aadc58b72..021a3efdedf2 100644
--- a/drivers/gpu/drm/apu/apu_internal.h
+++ b/drivers/gpu/drm/apu/apu_internal.h
@@ -4,6 +4,7 @@
 
 #include <drm/drm_drv.h>
 #include <drm/drm_gem_dma_helper.h>
+#include <drm/gpu_scheduler.h>
 
 struct apu_gem_object {
 	struct drm_gem_dma_object base;
@@ -12,16 +13,21 @@ struct apu_gem_object {
 	u32 offset;
 };
 
+struct apu_sched;
 struct apu_core {
 	int device_id;
 	struct device *dev;
 	struct apu_core_ops *ops;
 	struct apu_drm *apu;
 
+	spinlock_t ctx_lock;
+	struct list_head requests;
+
 	struct list_head node;
 	void *priv;
 	void *dev_priv;
 
+	struct apu_sched *sched;
 	u32 flags;
 };
 
@@ -35,6 +41,43 @@ struct apu_drm {
 	struct ida ida;
 };
 
+struct apu_job {
+	struct drm_sched_job base;
+
+	struct kref refcount;
+
+	struct apu_core *core;
+	struct apu_drm *apu;
+
+	/* Fence to be signaled by IRQ handler when the job is complete. */
+	struct dma_fence *done_fence;
+
+	__u32 cmd;
+
+	/* Exclusive fences we have taken from the BOs to wait for */
+	struct dma_fence **implicit_fences;
+	struct drm_gem_object **bos;
+	u32 bo_count;
+
+	/* Fence to be signaled by drm-sched once its done with the job */
+	struct dma_fence *render_done_fence;
+
+	void *data_in;
+	uint16_t size_in;
+	void *data_out;
+	uint16_t size_out;
+	uint16_t result;
+	uint16_t id;
+
+	struct list_head node;
+	struct drm_syncobj *sync_out;
+
+	struct apu_event *event;
+
+	void *request_data;
+	int request_len;
+};
+
 /**
  * @apu_core_ops: Provides platform specific callbacks
  */
@@ -46,6 +89,40 @@ struct apu_core_ops {
 	 */
 	int (*register_core)(struct apu_core *core);
 
+	/**
+	 * @alloc_prepare_request:
+	 *
+	 * Allocate and initialize the data to be sent to the APU.
+	 * Basically, this must convert the job object to something
+	 * that could be understand by the hardware accelerator.
+	 *
+	 * Returns:
+	 *
+	 * Zero on success, non-zero value on failure.
+	 */
+	int (*alloc_prepare_request)(struct apu_job *job);
+
+	/**
+	 * @send_data:
+	 *
+	 * Implements platform specific code to send the data previously
+	 * allocated using @alloc_data.
+	 *
+	 * Returns:
+	 *
+	 * Zero on success, non-zero value on failure.
+	 */
+	int (*send_request)(struct apu_job *job);
+
+	/**
+	 * @handle_request:
+	 *
+	 * Implements platform specific code to handle incoming request.
+	 * This must decode the data encoded using platform specific format
+	 * and convert it to generic format.
+	 */
+	int (*handle_request)(struct apu_job *job, void *data, int len);
+
 	/**
 	 * @is_ready:
 	 *
@@ -68,9 +145,9 @@ static inline struct apu_gem_object *to_apu_bo(struct drm_gem_object *obj)
 			    base);
 }
 
-static inline void *apu_drm_priv(struct apu_core *apu_core)
+static inline void *apu_drm_priv(struct apu_core *core)
 {
-	return apu_core->dev_priv;
+	return core->dev_priv;
 }
 
 struct apu_drm *apu_dev_alloc(struct device *dev);
@@ -94,5 +171,17 @@ int ioctl_gem_user_new(struct drm_device *dev, void *data,
 		       struct drm_file *file_priv);
 struct dma_buf *apu_gem_prime_export(struct drm_gem_object *gem,
 				     int flags);
+int ioctl_gem_queue(struct drm_device *dev, void *data,
+		    struct drm_file *file_priv);
+int ioctl_gem_dequeue(struct drm_device *dev, void *data,
+		      struct drm_file *file_priv);
+int ioctl_apu_state(struct drm_device *dev, void *data,
+		    struct drm_file *file_priv);
+int apu_drm_callback(struct apu_core *core, uint16_t job_id, void *data, int len);
+
+struct apu_job;
+
+int apu_drm_job_init(struct apu_core *core);
+void apu_sched_fini(struct apu_core *core);
 
 #endif /* __APU_INTERNAL_H__ */
diff --git a/drivers/gpu/drm/apu/apu_sched.c b/drivers/gpu/drm/apu/apu_sched.c
new file mode 100644
index 000000000000..13b6fbd00bd8
--- /dev/null
+++ b/drivers/gpu/drm/apu/apu_sched.c
@@ -0,0 +1,564 @@
+// SPDX-License-Identifier: GPL-2.0
+//
+// Copyright 2020 BayLibre SAS
+
+#include <drm/apu_drm.h>
+#include <drm/drm_syncobj.h>
+#include <drm/gpu_scheduler.h>
+
+#include "apu_internal.h"
+
+struct apu_queue_state {
+	struct drm_gpu_scheduler sched;
+	u64 fence_context;
+	u64 seqno;
+};
+
+struct apu_request {
+	struct list_head node;
+	struct apu_job *job;
+};
+
+struct apu_sched {
+	struct apu_queue_state apu_queue;
+	spinlock_t job_lock;
+	struct drm_sched_entity sched_entity;
+};
+
+struct apu_event {
+	struct drm_pending_event pending_event;
+	union {
+		struct drm_event base;
+		struct apu_job_event job_event;
+	};
+};
+
+static DEFINE_IDA(req_ida);
+static LIST_HEAD(complete_node);
+
+static void apu_core_update_state(struct apu_core *core)
+{
+	if (!core->ops->is_ready(core))
+		core->flags &= ~APU_ONLINE;
+}
+
+static int apu_core_is_running(struct apu_core *core)
+{
+	apu_core_update_state(core);
+
+	return core->flags & APU_ONLINE;
+}
+
+static void apu_set_online(struct apu_core *core)
+{
+	core->flags |= APU_ONLINE;
+}
+
+static void apu_set_offline(struct apu_core *core)
+{
+	core->flags &= ~APU_ONLINE;
+}
+
+/*
+ * apu_drm_callback() - Handle the data coming from accelerator
+ *
+ * @core: The pointer to the APU core
+ * @job_id: The job id
+ * @data: The data coming from the accelerator
+ * @len: The size of the data
+ *
+ * Returns: Zero on success, non-zero value on failure.
+ */
+int apu_drm_callback(struct apu_core *core, uint16_t job_id, void *data, int len)
+{
+	struct apu_request *apu_req, *tmp;
+	unsigned long flags;
+	int ret = -EINVAL;
+
+	spin_lock_irqsave(&core->ctx_lock, flags);
+	list_for_each_entry_safe(apu_req, tmp, &core->requests, node) {
+		struct apu_job *job = apu_req->job;
+
+		if (job && job_id == job->id) {
+			kref_get(&job->refcount);
+			ret = core->ops->handle_request(job, data, len);
+			list_add(&job->node, &complete_node);
+			list_del(&apu_req->node);
+			ida_simple_remove(&req_ida, job->id);
+			kfree(apu_req);
+			drm_send_event(&job->apu->base,
+				       &job->event->pending_event);
+			dma_fence_signal_locked(job->done_fence);
+			break;
+		}
+	}
+	spin_unlock_irqrestore(&core->ctx_lock, flags);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(apu_drm_callback);
+
+static void apu_job_cleanup(struct kref *ref)
+{
+	struct apu_job *job = container_of(ref, struct apu_job,
+					   refcount);
+	unsigned int i;
+
+	if (job->implicit_fences) {
+		for (i = 0; i < job->bo_count; i++)
+			dma_fence_put(job->implicit_fences[i]);
+		kvfree(job->implicit_fences);
+	}
+	dma_fence_put(job->done_fence);
+	dma_fence_put(job->render_done_fence);
+
+	if (job->bos) {
+		for (i = 0; i < job->bo_count; i++) {
+			struct apu_gem_object *apu_obj;
+
+			apu_obj = to_apu_bo(job->bos[i]);
+			drm_gem_object_put(job->bos[i]);
+		}
+
+		kvfree(job->bos);
+	}
+
+	kfree(job->data_out);
+	kfree(job->data_in);
+	kfree(job);
+}
+
+static void apu_job_put(struct apu_job *job)
+{
+	kref_put(&job->refcount, apu_job_cleanup);
+}
+
+static void apu_acquire_object_fences(struct drm_gem_object **bos,
+				      int bo_count,
+				      struct dma_fence **implicit_fences)
+{
+	int i;
+
+	for (i = 0; i < bo_count; i++)
+		dma_resv_get_singleton(bos[i]->resv, DMA_RESV_USAGE_KERNEL,
+				       &implicit_fences[i]);
+}
+
+static void apu_attach_object_fences(struct drm_gem_object **bos,
+				     int bo_count, struct dma_fence *fence)
+{
+	int i;
+
+	for (i = 0; i < bo_count; i++) {
+		dma_resv_reserve_fences(bos[i]->resv, 1);
+		dma_resv_add_fence(bos[i]->resv, fence, DMA_RESV_USAGE_KERNEL);
+	}
+}
+
+static int apu_job_push(struct apu_job *job)
+{
+	struct drm_sched_entity *entity = &job->core->sched->sched_entity;
+	struct ww_acquire_ctx acquire_ctx;
+	int ret = 0;
+	int i;
+
+	ret = drm_gem_lock_reservations(job->bos, job->bo_count, &acquire_ctx);
+	if (ret)
+		return ret;
+
+	ret = drm_sched_job_init(&job->base, entity, NULL);
+	if (ret)
+		goto unlock;
+
+	drm_sched_job_arm(&job->base);
+	job->render_done_fence = dma_fence_get(&job->base.s_fence->finished);
+
+	kref_get(&job->refcount);	/* put by scheduler job completion */
+	apu_acquire_object_fences(job->bos, job->bo_count,
+				  job->implicit_fences);
+
+	drm_sched_entity_push_job(&job->base);
+
+	apu_attach_object_fences(job->bos, job->bo_count,
+				 job->render_done_fence);
+
+	for (i = 0; i < job->bo_count; i++)
+		ret = drm_sched_job_add_implicit_dependencies(&job->base, job->bos[i],
+							      true);
+unlock:
+	drm_gem_unlock_reservations(job->bos, job->bo_count, &acquire_ctx);
+
+	return ret;
+}
+
+static const char *apu_fence_get_driver_name(struct dma_fence *fence)
+{
+	return "apu";
+}
+
+static const char *apu_fence_get_timeline_name(struct dma_fence *fence)
+{
+	return "apu-0";
+}
+
+static void apu_fence_release(struct dma_fence *f)
+{
+	kfree(f);
+}
+
+static const struct dma_fence_ops apu_fence_ops = {
+	.get_driver_name = apu_fence_get_driver_name,
+	.get_timeline_name = apu_fence_get_timeline_name,
+	.release = apu_fence_release,
+};
+
+static struct dma_fence *apu_fence_create(struct apu_sched *sched)
+{
+	struct dma_fence *fence;
+	struct apu_queue_state *apu_queue = &sched->apu_queue;
+
+	fence = kzalloc(sizeof(*fence), GFP_KERNEL);
+	if (!fence)
+		return ERR_PTR(-ENOMEM);
+
+	dma_fence_init(fence, &apu_fence_ops, &sched->job_lock,
+		       apu_queue->fence_context, apu_queue->seqno++);
+
+	return fence;
+}
+
+static struct apu_job *to_apu_job(struct drm_sched_job *sched_job)
+{
+	return container_of(sched_job, struct apu_job, base);
+}
+
+static int apu_job_hw_submit(struct apu_job *job)
+{
+	int ret;
+	struct apu_core *core = job->core;
+	struct apu_request *apu_req;
+	unsigned long flags;
+
+	ret = ida_simple_get(&req_ida, 0, 0xffff, GFP_KERNEL);
+	if (ret < 0)
+		return ret;
+	job->id = ret;
+
+	ret = core->ops->alloc_prepare_request(job);
+	if (ret || !job->request_data || !job->request_len) {
+		ret = -ENOMEM;
+		goto err_ida_remove;
+	}
+
+	apu_req = kzalloc(sizeof(*apu_req), GFP_KERNEL);
+	if (!apu_req) {
+		ret = -ENOMEM;
+		goto err_free_data;
+	}
+
+	apu_req->job = job;
+	spin_lock_irqsave(&core->ctx_lock, flags);
+	list_add(&apu_req->node, &core->requests);
+	spin_unlock_irqrestore(&core->ctx_lock, flags);
+	ret = core->ops->send_request(job);
+	if (ret < 0)
+		goto err;
+	kfree(job->request_data);
+
+	return 0;
+
+err:
+	list_del(&apu_req->node);
+	kfree(apu_req);
+err_free_data:
+	kfree(job->request_data);
+err_ida_remove:
+	ida_simple_remove(&req_ida, job->id);
+
+	return ret;
+}
+
+static struct dma_fence *apu_job_run(struct drm_sched_job *sched_job)
+{
+	struct apu_job *job = to_apu_job(sched_job);
+	struct dma_fence *fence = NULL;
+
+	if (unlikely(job->base.s_fence->finished.error))
+		return NULL;
+
+	fence = apu_fence_create(job->core->sched);
+	if (IS_ERR(fence))
+		return NULL;
+
+	job->done_fence = dma_fence_get(fence);
+
+	apu_job_hw_submit(job);
+
+	return fence;
+}
+
+static enum drm_gpu_sched_stat apu_job_timedout(struct drm_sched_job *sched_job)
+{
+	struct apu_request *apu_req, *tmp;
+	struct apu_job *job = to_apu_job(sched_job);
+
+	if (dma_fence_is_signaled(job->done_fence))
+		return DRM_GPU_SCHED_STAT_NOMINAL;
+
+	list_for_each_entry_safe(apu_req, tmp, &job->core->requests, node) {
+		/* Remove the request and notify user about timeout */
+		if (apu_req->job == job) {
+			kref_get(&job->refcount);
+			job->result = ETIMEDOUT;
+			list_add(&job->node, &complete_node);
+			list_del(&apu_req->node);
+			ida_simple_remove(&req_ida, job->id);
+			kfree(apu_req);
+			drm_send_event(&job->apu->base,
+				       &job->event->pending_event);
+			dma_fence_signal_locked(job->done_fence);
+		}
+	}
+
+	return DRM_GPU_SCHED_STAT_NOMINAL;
+}
+
+static void apu_job_free(struct drm_sched_job *sched_job)
+{
+	struct apu_job *job = to_apu_job(sched_job);
+
+	drm_sched_job_cleanup(sched_job);
+
+	apu_job_put(job);
+}
+
+static const struct drm_sched_backend_ops apu_sched_ops = {
+	.run_job = apu_job_run,
+	.timedout_job = apu_job_timedout,
+	.free_job = apu_job_free
+};
+
+int apu_drm_job_init(struct apu_core *core)
+{
+	int ret;
+	struct apu_sched *apu_sched;
+	struct drm_gpu_scheduler *sched;
+
+	apu_sched = devm_kzalloc(core->dev, sizeof(*apu_sched), GFP_KERNEL);
+	if (!apu_sched)
+		return -ENOMEM;
+
+	sched = &apu_sched->apu_queue.sched;
+	apu_sched->apu_queue.fence_context = dma_fence_context_alloc(1);
+	ret = drm_sched_init(sched, &apu_sched_ops,
+			     1, 0, msecs_to_jiffies(500),
+			     NULL, NULL, "apu_js", core->dev);
+	if (ret) {
+		dev_err(core->dev, "Failed to create scheduler");
+		return ret;
+	}
+
+	ret = drm_sched_entity_init(&apu_sched->sched_entity,
+				    DRM_SCHED_PRIORITY_NORMAL,
+				    &sched, 1, NULL);
+	if (ret) {
+		dev_err(core->dev, "Failed to initialize scheduler entity");
+		drm_sched_fini(&core->sched->apu_queue.sched);
+		return ret;
+	}
+
+	core->sched = apu_sched;
+	apu_set_online(core);
+
+	return 0;
+}
+
+void apu_sched_fini(struct apu_core *core)
+{
+	apu_set_offline(core);
+	drm_sched_fini(&core->sched->apu_queue.sched);
+	devm_kfree(core->dev, core->sched);
+	core->sched = NULL;
+}
+
+static struct apu_core *get_apu_core(struct apu_drm *apu, int device_id)
+{
+	struct apu_core *core;
+
+	list_for_each_entry(core, &apu->cores, node) {
+		if (core->device_id == device_id)
+			return core;
+	}
+
+	return NULL;
+}
+
+static int apu_lookup_bos(struct drm_device *dev, struct drm_file *file_priv,
+			  struct drm_apu_gem_queue *args, struct apu_job *job)
+{
+	void __user *bo_handles;
+	int ret;
+
+	job->bo_count = args->bo_handle_count;
+
+	if (!job->bo_count)
+		return 0;
+
+	job->implicit_fences = kvmalloc_array(job->bo_count,
+					      sizeof(struct dma_fence *),
+					      GFP_KERNEL | __GFP_ZERO);
+	if (!job->implicit_fences)
+		return -ENOMEM;
+
+	bo_handles = (void __user *)(uintptr_t) args->bo_handles;
+	ret = drm_gem_objects_lookup(file_priv, bo_handles,
+				     job->bo_count, &job->bos);
+
+	return ret;
+}
+
+int ioctl_gem_queue(struct drm_device *dev, void *data,
+		    struct drm_file *file_priv)
+{
+	struct apu_drm *apu = dev->dev_private;
+	struct drm_apu_gem_queue *args = data;
+	struct apu_event *event;
+	struct apu_core *core;
+	struct drm_syncobj *sync_out = NULL;
+	struct apu_job *job;
+	int ret = 0;
+
+	core = get_apu_core(apu, args->device);
+	if (!apu_core_is_running(core))
+		return -ENODEV;
+
+	if (args->out_sync > 0) {
+		sync_out = drm_syncobj_find(file_priv, args->out_sync);
+		if (!sync_out)
+			return -ENODEV;
+	}
+
+	job = kzalloc(sizeof(*job), GFP_KERNEL);
+	if (!job) {
+		ret = -ENOMEM;
+		goto fail_out_sync;
+	}
+
+	kref_init(&job->refcount);
+
+	job->apu = apu;
+	job->core = core;
+	job->cmd = args->cmd;
+	job->size_in = args->size_in;
+	job->size_out = args->size_out;
+	job->sync_out = sync_out;
+	if (job->size_in) {
+		job->data_in = kmalloc(job->size_in, GFP_KERNEL);
+		if (!job->data_in) {
+			ret = -ENOMEM;
+			goto fail_job;
+		}
+
+		ret =
+		    copy_from_user(job->data_in,
+				   (void __user *)(uintptr_t) args->data,
+				   job->size_in);
+		if (ret)
+			goto fail_job;
+	}
+
+	if (job->size_out) {
+		job->data_out = kmalloc(job->size_out, GFP_KERNEL);
+		if (!job->data_out) {
+			ret = -ENOMEM;
+			goto fail_job;
+		}
+	}
+
+	ret = apu_lookup_bos(dev, file_priv, args, job);
+	if (ret)
+		goto fail_job;
+
+	event = kzalloc(sizeof(*event), GFP_KERNEL);
+	event->base.length = sizeof(struct apu_job_event);
+	event->base.type = APU_JOB_COMPLETED;
+	event->job_event.out_sync = args->out_sync;
+	job->event = event;
+	ret = drm_event_reserve_init(dev, file_priv, &job->event->pending_event,
+				     &job->event->base);
+	if (ret)
+		goto fail_job;
+
+	ret = apu_job_push(job);
+	if (ret) {
+		drm_event_cancel_free(dev, &job->event->pending_event);
+		goto fail_job;
+	}
+
+	if (sync_out)
+		drm_syncobj_replace_fence(sync_out, job->render_done_fence);
+
+fail_job:
+	apu_job_put(job);
+fail_out_sync:
+	if (sync_out)
+		drm_syncobj_put(sync_out);
+
+	return ret;
+}
+
+int ioctl_gem_dequeue(struct drm_device *dev, void *data,
+		      struct drm_file *file_priv)
+{
+	struct drm_apu_gem_dequeue *args = data;
+	struct drm_syncobj *sync_out = NULL;
+	struct apu_job *job;
+	int ret = 0;
+
+	if (args->out_sync > 0) {
+		sync_out = drm_syncobj_find(file_priv, args->out_sync);
+		if (!sync_out)
+			return -ENODEV;
+	}
+
+	list_for_each_entry(job, &complete_node, node) {
+		if (job->sync_out == sync_out) {
+			if (job->data_out) {
+				ret = copy_to_user((void __user *)(uintptr_t)
+						   args->data, job->data_out,
+						   job->size_out);
+				args->size = job->size_out;
+			}
+			args->result = job->result;
+			list_del(&job->node);
+			apu_job_put(job);
+			drm_syncobj_put(sync_out);
+
+			return ret;
+		}
+	}
+
+	if (sync_out)
+		drm_syncobj_put(sync_out);
+
+	return 0;
+}
+
+int ioctl_apu_state(struct drm_device *dev, void *data,
+			   struct drm_file *file_priv)
+{
+	struct apu_drm *apu = dev->dev_private;
+	struct drm_apu_state *args = data;
+	struct apu_core *core;
+
+	args->flags = 0;
+
+	core = get_apu_core(apu, args->device);
+	if (!core)
+		return -ENODEV;
+
+	apu_core_update_state(core);
+	args->flags |= core->flags;
+
+	return 0;
+}
diff --git a/include/uapi/drm/apu_drm.h b/include/uapi/drm/apu_drm.h
index 14fc478f45dc..c47000097040 100644
--- a/include/uapi/drm/apu_drm.h
+++ b/include/uapi/drm/apu_drm.h
@@ -9,6 +9,8 @@
 extern "C" {
 #endif
 
+#define APU_JOB_COMPLETED 0x80000000
+
 /*
  * Please note that modifications to all structs defined here are
  * subject to backwards-compatibility constraints.
@@ -21,6 +23,29 @@ struct drm_apu_gem_new {
 	__u64 offset;			/* out */
 };
 
+struct drm_apu_gem_queue {
+	__u32 device;
+	__u32 cmd;
+	__u32 out_sync;
+	__u64 bo_handles;
+	__u32 bo_handle_count;
+	__u16 size_in;
+	__u16 size_out;
+	__u64 data;
+};
+
+struct drm_apu_gem_dequeue {
+	__u32 out_sync;
+	__u16 result;
+	__u16 size;
+	__u64 data;
+};
+
+struct apu_job_event {
+	struct drm_event base;
+	__u32 out_sync;
+};
+
 #define APU_ONLINE		BIT(0)
 
 struct drm_apu_state {
@@ -30,10 +55,14 @@ struct drm_apu_state {
 
 #define DRM_APU_STATE			0x00
 #define DRM_APU_GEM_NEW			0x01
-#define DRM_APU_NUM_IOCTLS		0x02
+#define DRM_APU_GEM_QUEUE		0x02
+#define DRM_APU_GEM_DEQUEUE		0x03
+#define DRM_APU_NUM_IOCTLS		0x04
 
 #define DRM_IOCTL_APU_STATE		DRM_IOWR(DRM_COMMAND_BASE + DRM_APU_STATE, struct drm_apu_state)
 #define DRM_IOCTL_APU_GEM_NEW		DRM_IOWR(DRM_COMMAND_BASE + DRM_APU_GEM_NEW, struct drm_apu_gem_new)
+#define DRM_IOCTL_APU_GEM_QUEUE		DRM_IOWR(DRM_COMMAND_BASE + DRM_APU_GEM_QUEUE, struct drm_apu_gem_queue)
+#define DRM_IOCTL_APU_GEM_DEQUEUE	DRM_IOWR(DRM_COMMAND_BASE + DRM_APU_GEM_DEQUEUE, struct drm_apu_gem_dequeue)
 
 #if defined(__cplusplus)
 }
-- 
2.39.2

