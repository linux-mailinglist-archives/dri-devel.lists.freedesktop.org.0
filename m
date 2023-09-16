Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6090D7A316A
	for <lists+dri-devel@lfdr.de>; Sat, 16 Sep 2023 18:28:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DD7510E151;
	Sat, 16 Sep 2023 16:28:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4FEB10E151
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Sep 2023 16:28:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1694881723;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=EzEI3xj+gOUgP5nEKp+6nJQsJsQAIFG2M2MSfcP5fDg=;
 b=URU5P9bLxAP+7wiM60+rdJx6msdz2Bfnm7yhEgT2PEn8aaJ3umAyS+vIhhlg5CFDERSTPx
 oG+p4xfWbKW/yfjp6PavLNbF99t9g66kEj0LiVrHxgqoJ5DD4cv2B4cKk3yT7MKwWA6VjF
 kNmcJRF8MGLMzFwk6G8y3lx1rm3fAqE=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-111-E8b1TQjmMZiTPm6G6o8Eqw-1; Sat, 16 Sep 2023 12:28:41 -0400
X-MC-Unique: E8b1TQjmMZiTPm6G6o8Eqw-1
Received: by mail-ed1-f71.google.com with SMTP id
 4fb4d7f45d1cf-52c55b44141so2137652a12.0
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Sep 2023 09:28:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694881720; x=1695486520;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=EzEI3xj+gOUgP5nEKp+6nJQsJsQAIFG2M2MSfcP5fDg=;
 b=WFva33bw8z3Zug1Web2QcSWNM2P+CAV5HmC/bR/bm/1vhjmr57xYl2uk3VPJF6eX/S
 b+Mnc8bTgjcLJefDC9z6Afejw4rGJ5lR5wsB5vmREatLPZxHQy04URYaQwFSChPsbioK
 PBSwNEefKNaRGL4fBJsLW1ZQ8nLU4h9Jzm+bWyhbEcMBJHURRm1k+Xy3XHZyDlzPRkT2
 XcIEPfKALC8Koiiv/pZWGMb4RyyCKevaWj86Wu2NkbHC6z8tUdg4RbHRWYNTwJzVqcD6
 ueuFt/ZgRejpHFWxCuw/SiQ0gaNvYAnEjXPKrhfcHsG6lw7dxKM8fl8gWtajDHvxj7Pg
 E7iw==
X-Gm-Message-State: AOJu0YyeJEXgUmq6tRSJAuqU1KnVqcthMdjBgU4Ye9udFYTpUguQw/hW
 yjTeebw+BuvsdkXO+TFI3z4GyCCPwL41njPtxWuPIeM2h9LqRrsYOOSdszUceFUY0jZz/wQBw6f
 A5xMs68I2k4/mXwyzgZhqJ6PViOhe
X-Received: by 2002:a05:6402:22ee:b0:530:db58:61c8 with SMTP id
 dn14-20020a05640222ee00b00530db5861c8mr954481edb.23.1694881720150; 
 Sat, 16 Sep 2023 09:28:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFlYPchwFlqQIz/rdAPhlutPoEjabhYgc7OxI5j/ZzoP6b6ZR4Gcr0BriDua40j8SSm3Ns67w==
X-Received: by 2002:a05:6402:22ee:b0:530:db58:61c8 with SMTP id
 dn14-20020a05640222ee00b00530db5861c8mr954470edb.23.1694881719851; 
 Sat, 16 Sep 2023 09:28:39 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:de9c:642:1aff:fe31:a19f])
 by smtp.gmail.com with ESMTPSA id
 k7-20020aa7c047000000b0052febc781bfsm3661604edo.36.2023.09.16.09.28.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 Sep 2023 09:28:39 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: nouveau@lists.freedesktop.org
Subject: [PATCH] drm/nouveau: sched: fix leaking memory of timedout job
Date: Sat, 16 Sep 2023 18:28:31 +0200
Message-ID: <20230916162835.5719-1-dakr@redhat.com>
X-Mailer: git-send-email 2.41.0
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

Always stop and re-start the scheduler in order to let the scheduler
free up the timedout job in case it got signaled. In case of exec jobs
the job type specific callback will take care to signal all fences and
tear down the channel.

Fixes: b88baab82871 ("drm/nouveau: implement new VM_BIND uAPI")
Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
 drivers/gpu/drm/nouveau/nouveau_exec.c  |  2 +-
 drivers/gpu/drm/nouveau/nouveau_sched.c | 12 +++++++++---
 2 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_exec.c b/drivers/gpu/drm/nouveau/nouveau_exec.c
index 9c031d15fe0b..49d83ac9e036 100644
--- a/drivers/gpu/drm/nouveau/nouveau_exec.c
+++ b/drivers/gpu/drm/nouveau/nouveau_exec.c
@@ -185,7 +185,7 @@ nouveau_exec_job_timeout(struct nouveau_job *job)
 
 	nouveau_sched_entity_fini(job->entity);
 
-	return DRM_GPU_SCHED_STAT_ENODEV;
+	return DRM_GPU_SCHED_STAT_NOMINAL;
 }
 
 static struct nouveau_job_ops nouveau_exec_job_ops = {
diff --git a/drivers/gpu/drm/nouveau/nouveau_sched.c b/drivers/gpu/drm/nouveau/nouveau_sched.c
index 88217185e0f3..3b7ea5221226 100644
--- a/drivers/gpu/drm/nouveau/nouveau_sched.c
+++ b/drivers/gpu/drm/nouveau/nouveau_sched.c
@@ -375,14 +375,20 @@ nouveau_sched_run_job(struct drm_sched_job *sched_job)
 static enum drm_gpu_sched_stat
 nouveau_sched_timedout_job(struct drm_sched_job *sched_job)
 {
+	struct drm_gpu_scheduler *sched = sched_job->sched;
 	struct nouveau_job *job = to_nouveau_job(sched_job);
+	enum drm_gpu_sched_stat stat = DRM_GPU_SCHED_STAT_NOMINAL;
 
-	NV_PRINTK(warn, job->cli, "Job timed out.\n");
+	drm_sched_stop(sched, sched_job);
 
 	if (job->ops->timeout)
-		return job->ops->timeout(job);
+		stat = job->ops->timeout(job);
+	else
+		NV_PRINTK(warn, job->cli, "Generic job timeout.\n");
+
+	drm_sched_start(sched, true);
 
-	return DRM_GPU_SCHED_STAT_ENODEV;
+	return stat;
 }
 
 static void
-- 
2.41.0

