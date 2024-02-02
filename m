Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B553B8464D8
	for <lists+dri-devel@lfdr.de>; Fri,  2 Feb 2024 01:06:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B235210E534;
	Fri,  2 Feb 2024 00:06:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Yt0JbvG5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91D9110E534
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Feb 2024 00:06:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1706832372;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=E3CJiMNs4ugkpjLFrDvRR7BQuWqPEMuBpVE7vPmdHD4=;
 b=Yt0JbvG5839JBTKy3YuwPOG2dD11Re9iB2opihj2eUTHxT/GHmo0468xjoFzqxzXY1EFih
 Dl/JnnJqrU5wGAk2KRcAfX3bW8IqUhn+uhk2pg7uJbg0qFlQdTFmOqGBSZXjoomAQJMvAM
 kt9SNVCU3g8Aw6IWRimLk6/S2DVOxcc=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-503-HAQnFISgNIG0HdPY7CQpYg-1; Thu, 01 Feb 2024 19:06:11 -0500
X-MC-Unique: HAQnFISgNIG0HdPY7CQpYg-1
Received: by mail-ej1-f70.google.com with SMTP id
 a640c23a62f3a-a2f71c83b7eso92745666b.1
 for <dri-devel@lists.freedesktop.org>; Thu, 01 Feb 2024 16:06:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706832370; x=1707437170;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=E3CJiMNs4ugkpjLFrDvRR7BQuWqPEMuBpVE7vPmdHD4=;
 b=l2dffsMmB8wC04SFkfFQBsXi8D0g5IkhZDBLR/02oox4lpvm2WuaJ7kLRf12nsmx9h
 hjPJvmXKfsVOpFjK/mDtsn+cQ+syACoBsoP5B+OgHT/brerlBqjT1Q94TZT/ZbU9RWgd
 M9y4wQLXN639ZIGwY46uL2IyXh+wh/GUYerFT5FXywebmQaHGxVC08iFwPNrypfwcx6C
 UX+kZpf5IpoGqPoM+8uaj52ZSh6PO4jm4KM9YHkqKuGywNV2qFKKr2C8uZnlRVVxCqQL
 quc1hznFXc/I6lbuy6kzjikmMT+zd9iMzM019MwSndKdamlZQE4biWJu5wGFg4dBFjSB
 OArQ==
X-Gm-Message-State: AOJu0Yz2u9zS2r4mu9GUhMDJeiumhtnb/ZL4rtIjyJX+KqgW8zhE41o5
 VMPty4iy3hB8QGs5vJcAkKO1I6F8n2VL7eNRiq/3DibP3TMI+M31CcsZoe7akg/gscVBWJTH0kH
 +nE53DgZ05HAB5DJSYrtOAlp6UVzj2L3PAnvBSc1JAl4+PM4FJD4R3Q/ofstRh59FPg==
X-Received: by 2002:a17:906:f8cd:b0:a35:a71d:81fe with SMTP id
 lh13-20020a170906f8cd00b00a35a71d81femr2670248ejb.43.1706832369855; 
 Thu, 01 Feb 2024 16:06:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFWHGhR6q0dC6KwkKvQ+4/Y2FQBr8d6rvG7fkyezcA4RHD3MTUmjFD/7HadrmyFyd8vNpBWiA==
X-Received: by 2002:a17:906:f8cd:b0:a35:a71d:81fe with SMTP id
 lh13-20020a170906f8cd00b00a35a71d81femr2670238ejb.43.1706832369422; 
 Thu, 01 Feb 2024 16:06:09 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCW2KxX1NIB2pd/1K2DpT2qO9jLIH3aYLznMYbo1PpNIa7VpVx8P3B4MfwOLEwwp+EynPTtHzul/JZwWjV7TcmiszyFvuZ+Gw1Cq9FhF8UAN0KEgwTmTSOPmKmD3BW3DIBonztgtVCW0/b5fSGy1H0/ZEpKrmBzgRNHRrSyUgleb9XcIeMcs/DSvLqUmN5N0S1TAowroKu2A6e4=
Received: from cassiopeiae.. ([2a02:810d:4b3f:ee94:642:1aff:fe31:a19f])
 by smtp.gmail.com with ESMTPSA id
 s12-20020a170906454c00b00a360eb62afdsm286025ejq.32.2024.02.01.16.06.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Feb 2024 16:06:08 -0800 (PST)
From: Danilo Krummrich <dakr@redhat.com>
To: nouveau@lists.freedesktop.org
Cc: lyude@redhat.com, kherbst@redhat.com, airlied@gmail.com, ttabi@nvidia.com,
 dri-devel@lists.freedesktop.org, Danilo Krummrich <dakr@redhat.com>
Subject: [PATCH 1/2] drm/nouveau: don't fini scheduler if not initialized
Date: Fri,  2 Feb 2024 01:05:50 +0100
Message-ID: <20240202000606.3526-1-dakr@redhat.com>
X-Mailer: git-send-email 2.43.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

nouveau_abi16_ioctl_channel_alloc() and nouveau_cli_init() simply call
their corresponding *_fini() counterpart. This can lead to
nouveau_sched_fini() being called without struct nouveau_sched ever
being initialized in the first place.

Instead of embedding struct nouveau_sched into struct nouveau_cli and
struct nouveau_chan_abi16, allocate struct nouveau_sched separately,
such that we can check for the corresponding pointer to be NULL in the
particular *_fini() functions.

It makes sense to allocate struct nouveau_sched separately anyway, since
in a subsequent commit we can also avoid to allocate a struct
nouveau_sched in nouveau_abi16_ioctl_channel_alloc() at all, if the
VM_BIND uAPI has been disabled due to the legacy uAPI being used.

Fixes: 5f03a507b29e ("drm/nouveau: implement 1:1 scheduler - entity relationship")
Reported-by: Timur Tabi <ttabi@nvidia.com>
Closes: https://lore.kernel.org/nouveau/20240131213917.1545604-1-ttabi@nvidia.com/
Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
 drivers/gpu/drm/nouveau/nouveau_abi16.c | 10 ++++---
 drivers/gpu/drm/nouveau/nouveau_abi16.h |  2 +-
 drivers/gpu/drm/nouveau/nouveau_drm.c   |  7 +++--
 drivers/gpu/drm/nouveau/nouveau_drv.h   |  2 +-
 drivers/gpu/drm/nouveau/nouveau_exec.c  |  2 +-
 drivers/gpu/drm/nouveau/nouveau_sched.c | 38 +++++++++++++++++++++++--
 drivers/gpu/drm/nouveau/nouveau_sched.h |  6 ++--
 drivers/gpu/drm/nouveau/nouveau_uvmm.c  |  2 +-
 8 files changed, 53 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_abi16.c b/drivers/gpu/drm/nouveau/nouveau_abi16.c
index a04156ca8390..ca4b5ab3e59e 100644
--- a/drivers/gpu/drm/nouveau/nouveau_abi16.c
+++ b/drivers/gpu/drm/nouveau/nouveau_abi16.c
@@ -128,12 +128,14 @@ nouveau_abi16_chan_fini(struct nouveau_abi16 *abi16,
 	struct nouveau_abi16_ntfy *ntfy, *temp;
 
 	/* Cancel all jobs from the entity's queue. */
-	drm_sched_entity_fini(&chan->sched.entity);
+	if (chan->sched)
+		drm_sched_entity_fini(&chan->sched->entity);
 
 	if (chan->chan)
 		nouveau_channel_idle(chan->chan);
 
-	nouveau_sched_fini(&chan->sched);
+	if (chan->sched)
+		nouveau_sched_destroy(&chan->sched);
 
 	/* cleanup notifier state */
 	list_for_each_entry_safe(ntfy, temp, &chan->notifiers, head) {
@@ -337,8 +339,8 @@ nouveau_abi16_ioctl_channel_alloc(ABI16_IOCTL_ARGS)
 	if (ret)
 		goto done;
 
-	ret = nouveau_sched_init(&chan->sched, drm, drm->sched_wq,
-				 chan->chan->dma.ib_max);
+	ret = nouveau_sched_create(&chan->sched, drm, drm->sched_wq,
+				   chan->chan->dma.ib_max);
 	if (ret)
 		goto done;
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_abi16.h b/drivers/gpu/drm/nouveau/nouveau_abi16.h
index 1f5e243c0c75..11c8c4a80079 100644
--- a/drivers/gpu/drm/nouveau/nouveau_abi16.h
+++ b/drivers/gpu/drm/nouveau/nouveau_abi16.h
@@ -26,7 +26,7 @@ struct nouveau_abi16_chan {
 	struct nouveau_bo *ntfy;
 	struct nouveau_vma *ntfy_vma;
 	struct nvkm_mm  heap;
-	struct nouveau_sched sched;
+	struct nouveau_sched *sched;
 };
 
 struct nouveau_abi16 {
diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index 6f6c31a9937b..a947e1d5f309 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -201,7 +201,8 @@ nouveau_cli_fini(struct nouveau_cli *cli)
 	WARN_ON(!list_empty(&cli->worker));
 
 	usif_client_fini(cli);
-	nouveau_sched_fini(&cli->sched);
+	if (cli->sched)
+		nouveau_sched_destroy(&cli->sched);
 	if (uvmm)
 		nouveau_uvmm_fini(uvmm);
 	nouveau_vmm_fini(&cli->svm);
@@ -311,7 +312,7 @@ nouveau_cli_init(struct nouveau_drm *drm, const char *sname,
 	cli->mem = &mems[ret];
 
 	/* Don't pass in the (shared) sched_wq in order to let
-	 * nouveau_sched_init() create a dedicated one for VM_BIND jobs.
+	 * nouveau_sched_create() create a dedicated one for VM_BIND jobs.
 	 *
 	 * This is required to ensure that for VM_BIND jobs free_job() work and
 	 * run_job() work can always run concurrently and hence, free_job() work
@@ -320,7 +321,7 @@ nouveau_cli_init(struct nouveau_drm *drm, const char *sname,
 	 * locks which indirectly or directly are held for allocations
 	 * elsewhere.
 	 */
-	ret = nouveau_sched_init(&cli->sched, drm, NULL, 1);
+	ret = nouveau_sched_create(&cli->sched, drm, NULL, 1);
 	if (ret)
 		goto done;
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_drv.h b/drivers/gpu/drm/nouveau/nouveau_drv.h
index 8a6d94c8b163..e239c6bf4afa 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drv.h
+++ b/drivers/gpu/drm/nouveau/nouveau_drv.h
@@ -98,7 +98,7 @@ struct nouveau_cli {
 		bool disabled;
 	} uvmm;
 
-	struct nouveau_sched sched;
+	struct nouveau_sched *sched;
 
 	const struct nvif_mclass *mem;
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_exec.c b/drivers/gpu/drm/nouveau/nouveau_exec.c
index bc5d71b79ab2..e65c0ef23bc7 100644
--- a/drivers/gpu/drm/nouveau/nouveau_exec.c
+++ b/drivers/gpu/drm/nouveau/nouveau_exec.c
@@ -389,7 +389,7 @@ nouveau_exec_ioctl_exec(struct drm_device *dev,
 	if (ret)
 		goto out;
 
-	args.sched = &chan16->sched;
+	args.sched = chan16->sched;
 	args.file_priv = file_priv;
 	args.chan = chan;
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_sched.c b/drivers/gpu/drm/nouveau/nouveau_sched.c
index dd98f6910f9c..32fa2e273965 100644
--- a/drivers/gpu/drm/nouveau/nouveau_sched.c
+++ b/drivers/gpu/drm/nouveau/nouveau_sched.c
@@ -398,7 +398,7 @@ static const struct drm_sched_backend_ops nouveau_sched_ops = {
 	.free_job = nouveau_sched_free_job,
 };
 
-int
+static int
 nouveau_sched_init(struct nouveau_sched *sched, struct nouveau_drm *drm,
 		   struct workqueue_struct *wq, u32 credit_limit)
 {
@@ -453,7 +453,30 @@ nouveau_sched_init(struct nouveau_sched *sched, struct nouveau_drm *drm,
 	return ret;
 }
 
-void
+int
+nouveau_sched_create(struct nouveau_sched **psched, struct nouveau_drm *drm,
+		     struct workqueue_struct *wq, u32 credit_limit)
+{
+	struct nouveau_sched *sched;
+	int ret;
+
+	sched = kzalloc(sizeof(*sched), GFP_KERNEL);
+	if (!sched)
+		return -ENOMEM;
+
+	ret = nouveau_sched_init(sched, drm, wq, credit_limit);
+	if (ret) {
+		kfree(sched);
+		return ret;
+	}
+
+	*psched = sched;
+
+	return 0;
+}
+
+
+static void
 nouveau_sched_fini(struct nouveau_sched *sched)
 {
 	struct drm_gpu_scheduler *drm_sched = &sched->base;
@@ -471,3 +494,14 @@ nouveau_sched_fini(struct nouveau_sched *sched)
 	if (sched->wq)
 		destroy_workqueue(sched->wq);
 }
+
+void
+nouveau_sched_destroy(struct nouveau_sched **psched)
+{
+	struct nouveau_sched *sched = *psched;
+
+	nouveau_sched_fini(sched);
+	kfree(sched);
+
+	*psched = NULL;
+}
diff --git a/drivers/gpu/drm/nouveau/nouveau_sched.h b/drivers/gpu/drm/nouveau/nouveau_sched.h
index a6528f5981e6..e1f01a23e6f6 100644
--- a/drivers/gpu/drm/nouveau/nouveau_sched.h
+++ b/drivers/gpu/drm/nouveau/nouveau_sched.h
@@ -111,8 +111,8 @@ struct nouveau_sched {
 	} job;
 };
 
-int nouveau_sched_init(struct nouveau_sched *sched, struct nouveau_drm *drm,
-		       struct workqueue_struct *wq, u32 credit_limit);
-void nouveau_sched_fini(struct nouveau_sched *sched);
+int nouveau_sched_create(struct nouveau_sched **psched, struct nouveau_drm *drm,
+			 struct workqueue_struct *wq, u32 credit_limit);
+void nouveau_sched_destroy(struct nouveau_sched **psched);
 
 #endif
diff --git a/drivers/gpu/drm/nouveau/nouveau_uvmm.c b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
index 4f223c972c6a..0a0a11dc9ec0 100644
--- a/drivers/gpu/drm/nouveau/nouveau_uvmm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
@@ -1740,7 +1740,7 @@ nouveau_uvmm_ioctl_vm_bind(struct drm_device *dev,
 	if (ret)
 		return ret;
 
-	args.sched = &cli->sched;
+	args.sched = cli->sched;
 	args.file_priv = file_priv;
 
 	ret = nouveau_uvmm_vm_bind(&args);

base-commit: 041261ac4c365e03b07427569d6735f8adfd21c8
-- 
2.43.0

