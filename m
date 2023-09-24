Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 967677ACCBF
	for <lists+dri-devel@lfdr.de>; Mon, 25 Sep 2023 00:50:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D1E510E1B9;
	Sun, 24 Sep 2023 22:50:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38D4210E15D
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Sep 2023 22:50:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1695595828;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Tii+DbstlduWpNrVxfiDMWTWENA8qiMAt5c+WiPaGkY=;
 b=ClwrDqWSNLHKYElQz8SeOZnaz0XUL5rQCKi/XhkUaczvBgPCNwzCKvA10RJKfGx0gcW2DQ
 Z5TephLYxlSy1dtMzPRzZX/F4YdfxDJZHCMjWwlsjbhoP+PYJy7wB5PkvQUOmPTEr1k5Mg
 TFyfcXxj6Wkuu3Cz2BWEhTopDX+eLP8=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-650-g66T9dtxPyS84LbtaeK9_g-1; Sun, 24 Sep 2023 18:50:26 -0400
X-MC-Unique: g66T9dtxPyS84LbtaeK9_g-1
Received: by mail-ej1-f71.google.com with SMTP id
 a640c23a62f3a-997c891a88dso404596866b.3
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Sep 2023 15:50:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695595825; x=1696200625;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Tii+DbstlduWpNrVxfiDMWTWENA8qiMAt5c+WiPaGkY=;
 b=gXBp2nyihqGCSB063091tTaCo20EBLFJqU0IcOnZRZbxdFvQzjaS6vCaQO1UYSRKvE
 a9KTu4iNHW6IpmifoofbPhqe4mIOzIPvO8z8mdn4LqjphrSjV8CepPQi5xxvBgIXhTX2
 NbBJMpwDx2xcrdABAHuIJwDk2z+GcfqRg6PWd8TH/8mNhH8L5rs2xpig9Dq6+LsR/FX9
 IEci4XdAD/NIQs1/Q3ywOzD0UwGEj6uYctQ/3sSQe/Ru7Qi9fo8EccuVRr8WzyWUtV6U
 pfy2En8jMVTs7OHSj6MawdpGPsETaDXkFfjRqdMNILlaC0tsyJT61SWgF1Gfx+rXzmMc
 dPqg==
X-Gm-Message-State: AOJu0YwnirKGlBRApFZ1gphGAxGFF2mNXoxRA9cAmNxjLllltL7GlmZu
 MLEbhCKTOknQJYv13zh4fuAVpGn5bQmOKgulbXk6UvvldJy9ldrA7aJCGTdgO6Q+9kc2F0soipo
 9KX7zFib0cq6fj1MF/Xbnd9GVYQix
X-Received: by 2002:a17:907:2ccf:b0:9ae:5270:46d5 with SMTP id
 hg15-20020a1709072ccf00b009ae527046d5mr4397310ejc.73.1695595825372; 
 Sun, 24 Sep 2023 15:50:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF3P4/aha7Vz1hpsfe4qBL5Vd8qq3ii1Jiy+XAIFaMeyRPKpEDwD0/8PtuK+CnXgY8+Y0uP0Q==
X-Received: by 2002:a17:907:2ccf:b0:9ae:5270:46d5 with SMTP id
 hg15-20020a1709072ccf00b009ae527046d5mr4397302ejc.73.1695595825096; 
 Sun, 24 Sep 2023 15:50:25 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:de9c:642:1aff:fe31:a19f])
 by smtp.gmail.com with ESMTPSA id
 j26-20020a170906831a00b00997d7aa59fasm5570325ejx.14.2023.09.24.15.50.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Sep 2023 15:50:24 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: nouveau@lists.freedesktop.org
Subject: [PATCH drm-misc-next 2/2] drm/nouveau: enable dynamic job flow control
Date: Mon, 25 Sep 2023 00:49:09 +0200
Message-ID: <20230924225018.17701-2-dakr@redhat.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230924225018.17701-1-dakr@redhat.com>
References: <20230924225018.17701-1-dakr@redhat.com>
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
Cc: Danilo Krummrich <dakr@redhat.com>, dri-devel@lists.freedesktop.org,
 kherbst@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Make use of the scheduler's submission limit and scheduler job's
submission unit count to account for the actual size of a job, such that
we fill up the ring efficiently.

Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
This patch is based on Matt's scheduler work [1] and [2].

[1] https://lore.kernel.org/dri-devel/20230919050155.2647172-1-matthew.brost@intel.com/
[2] https://lore.kernel.org/nouveau/20230924224555.15595-1-dakr@redhat.com/T/#u
---
 drivers/gpu/drm/nouveau/nouveau_abi16.c | 3 ++-
 drivers/gpu/drm/nouveau/nouveau_drm.c   | 2 +-
 drivers/gpu/drm/nouveau/nouveau_exec.c  | 3 ++-
 drivers/gpu/drm/nouveau/nouveau_sched.c | 9 ++++-----
 drivers/gpu/drm/nouveau/nouveau_sched.h | 3 ++-
 5 files changed, 11 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_abi16.c b/drivers/gpu/drm/nouveau/nouveau_abi16.c
index f8e59cfb1d34..207945700c94 100644
--- a/drivers/gpu/drm/nouveau/nouveau_abi16.c
+++ b/drivers/gpu/drm/nouveau/nouveau_abi16.c
@@ -316,7 +316,8 @@ nouveau_abi16_ioctl_channel_alloc(ABI16_IOCTL_ARGS)
 	if (ret)
 		goto done;
 
-	ret = nouveau_sched_init(&chan->sched, drm, drm->sched_wq);
+	ret = nouveau_sched_init(&chan->sched, drm, drm->sched_wq,
+				 chan->chan->dma.ib_max);
 	if (ret)
 		goto done;
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index dbe1f08ac540..2b695c521821 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -317,7 +317,7 @@ nouveau_cli_init(struct nouveau_drm *drm, const char *sname,
 	 * locks which indirectly or directly are held for allocations
 	 * elsewhere.
 	 */
-	ret = nouveau_sched_init(&cli->sched, drm, NULL);
+	ret = nouveau_sched_init(&cli->sched, drm, NULL, 1);
 	if (ret)
 		goto done;
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_exec.c b/drivers/gpu/drm/nouveau/nouveau_exec.c
index 5a70fcf571f7..5d1533b413d3 100644
--- a/drivers/gpu/drm/nouveau/nouveau_exec.c
+++ b/drivers/gpu/drm/nouveau/nouveau_exec.c
@@ -253,10 +253,11 @@ nouveau_exec_job_init(struct nouveau_exec_job **pjob,
 		}
 	}
 
+	args.file_priv = __args->file_priv;
 	job->chan = __args->chan;
 
 	args.sched = __args->sched;
-	args.file_priv = __args->file_priv;
+	args.submission_units = job->push.count;
 
 	args.in_sync.count = __args->in_sync.count;
 	args.in_sync.s = __args->in_sync.s;
diff --git a/drivers/gpu/drm/nouveau/nouveau_sched.c b/drivers/gpu/drm/nouveau/nouveau_sched.c
index 0dbd0ea6d02e..6b32fd4eefb0 100644
--- a/drivers/gpu/drm/nouveau/nouveau_sched.c
+++ b/drivers/gpu/drm/nouveau/nouveau_sched.c
@@ -12,7 +12,6 @@
 #include "nouveau_abi16.h"
 #include "nouveau_sched.h"
 
-#define NOUVEAU_SCHED_HW_SUBMISSIONS		1
 #define NOUVEAU_SCHED_JOB_TIMEOUT_MS		10000
 
 int
@@ -77,10 +76,10 @@ nouveau_job_init(struct nouveau_job *job,
 			ret = -ENOMEM;
 			goto err_free_objs;
 		}
-
 	}
 
-	ret = drm_sched_job_init(&job->base, &sched->entity, 1, NULL);
+	ret = drm_sched_job_init(&job->base, &sched->entity,
+				 args->submission_units, NULL);
 	if (ret)
 		goto err_free_chains;
 
@@ -387,7 +386,7 @@ static const struct drm_sched_backend_ops nouveau_sched_ops = {
 };
 
 int nouveau_sched_init(struct nouveau_sched *sched, struct nouveau_drm *drm,
-		       struct workqueue_struct *wq)
+		       struct workqueue_struct *wq, u32 submission_limit)
 {
 	struct drm_gpu_scheduler *drm_sched = &sched->base;
 	struct drm_sched_entity *entity = &sched->entity;
@@ -404,7 +403,7 @@ int nouveau_sched_init(struct nouveau_sched *sched, struct nouveau_drm *drm,
 	}
 
 	ret = drm_sched_init(drm_sched, &nouveau_sched_ops, wq,
-			     NOUVEAU_SCHED_HW_SUBMISSIONS, 0, job_hang_limit,
+			     submission_limit, 0, job_hang_limit,
 			     NULL, NULL, "nouveau_sched",
 			     DRM_SCHED_POLICY_SINGLE_ENTITY, drm->dev->dev);
 	if (ret)
diff --git a/drivers/gpu/drm/nouveau/nouveau_sched.h b/drivers/gpu/drm/nouveau/nouveau_sched.h
index 026f33d9b70c..c1d603759914 100644
--- a/drivers/gpu/drm/nouveau/nouveau_sched.h
+++ b/drivers/gpu/drm/nouveau/nouveau_sched.h
@@ -27,6 +27,7 @@ enum nouveau_job_state {
 struct nouveau_job_args {
 	struct drm_file *file_priv;
 	struct nouveau_sched *sched;
+	u32 submission_units;
 
 	enum dma_resv_usage resv_usage;
 	bool sync;
@@ -112,7 +113,7 @@ struct nouveau_sched {
 };
 
 int nouveau_sched_init(struct nouveau_sched *sched, struct nouveau_drm *drm,
-		       struct workqueue_struct *wq);
+		       struct workqueue_struct *wq, u32 submission_limit);
 void nouveau_sched_fini(struct nouveau_sched *sched);
 
 #endif
-- 
2.41.0

