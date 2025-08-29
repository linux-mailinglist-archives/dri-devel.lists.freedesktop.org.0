Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75178B3C571
	for <lists+dri-devel@lfdr.de>; Sat, 30 Aug 2025 01:03:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C02110E096;
	Fri, 29 Aug 2025 23:02:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="YhrxCKZL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
 [209.85.214.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED56110E096
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Aug 2025 23:02:56 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id
 d9443c01a7336-2491f6b39a1so6873165ad.0
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Aug 2025 16:02:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1756508576; x=1757113376; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=eiZs08gbE9JnURBm0lL4iNGpq9sFgFW6HUiD8BlVrlw=;
 b=YhrxCKZL6+uQ5RvSfMyYYm/KVoipBz42r5wjRV3RaRmQeOsQZvaqCfCgVFRN2fTgAS
 GzVA4244UZnWTz3trdmuk5RIYAihMXYfpx1N8FifgXW6b57JZO1DqOcL8ZFA4cGjzvVN
 U3ctjvlmU1U9Z/vBQg98CRxGbwW4xfoWMVeI1qy5Qff6i+xztooK39/e0mbWF7U6EyAL
 yq6LZpNWPG/igawtEj8ty6/H8H2DzdHeV+F/voUHTPWSHkARWcqkb10EdZi464j+h+UV
 m/qIpvZV2oQKs94yyCcWw9ULbRAP+orcKL6cn/7z21aOlbkOx+jYxl4APbbHMASP4DbB
 uS1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756508576; x=1757113376;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=eiZs08gbE9JnURBm0lL4iNGpq9sFgFW6HUiD8BlVrlw=;
 b=eVpvfgUpW0nz3Pv9Dqq+rpCRB+LwQ5tBnBEZqnBCk/c4zD27fJ0HIWI75OUSO+qEaY
 3V0sleQaElHMsx1UsPyCdokSLJVFdbTe3X7V4oXIqlsUBsJSlYtaOm9qOCvMTJmQdDFJ
 /astqwdjTNOxp5aXLJSSunm0o/RaThjQf6fmKITo7gEcn20NeVK0mQtl9z0OiiAo9b5j
 0efquJ+/0ZRmrbzvjTyMz2lIvq6Fc6TmxJUDu8xe6/9D7WwTV5vNKuBRuEQBXuZIAL05
 ApD+GQKFcHT+4W+AgqfjEpJ7+/xhKa+XI/A3aAPuWejCPkXYanFhf3TRvEWjeJWNlmCy
 m27w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVeFNu5l2BA6ZxR0hVyF85zRfZBcuOw5/t/Pjhw3B+ALekmjmpwXhkr5HlpTmZVSlRGQu+zM8Oq4mg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxIPT9IaYhPcGzH6yHeGmGkxHoDpTPIygdcKRlPc+/XmDMlSmsR
 41b6t+LRAUlHrSURdkhPPTs5QMTbfO0HI8gg+R2iekMmgxGPl/WbmWX3
X-Gm-Gg: ASbGnctmhsojc54GojjZliyTrxzGgdRtI27KdgC7RPb+VD8PFT8IXFh7MtxKjNg56Hd
 z18p73pKpKAywFSkKLnw56P+s3MT2ggR/b9F402qbFn0ibNPn7FS6mLn+oHXGYIg20tXW7zy0do
 gvTNC21NnwYkCAiv9qXgMOn+5KbBfYve51ps3nih08WqsExr1zPwVS0WpMNVaA8fTZY8y9g1I56
 /4GjScYNEKkxpO0qDO25EWadoQ1UDDU+TzYVBvb5AslYi0vjBuWvZf9GLPur1yIwr5s4X2x+h7g
 KHOb+T/uN6d7DP3GPgU1OlZt2vzBGZRK+yxUF3b8IWvU4azNgs7FV4sc7fdgiC0FgdoYgvQfxd1
 UCpEz8ztW0MRpb/ChwzfIYJcl8y44j7cnFOATNw+mnFzUDfIPvI9mN04Ij2p1fLud
X-Google-Smtp-Source: AGHT+IH9Z0nhUvfFISk3Go+jkDUVMeGGU/M48/XQwo59p9hMYpOasjzBuT2f02Ym5btzFrtOClfPgA==
X-Received: by 2002:a17:902:e888:b0:248:79d4:93ae with SMTP id
 d9443c01a7336-24944a98674mr3531185ad.33.1756508576211; 
 Fri, 29 Aug 2025 16:02:56 -0700 (PDT)
Received: from localhost (185.3.125.34.bc.googleusercontent.com.
 [34.125.3.185]) by smtp.gmail.com with UTF8SMTPSA id
 d9443c01a7336-249067de9f1sm34714485ad.151.2025.08.29.16.02.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Aug 2025 16:02:55 -0700 (PDT)
From: Chia-I Wu <olvaffe@gmail.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2] drm/panthor: assign unique names to queues
Date: Fri, 29 Aug 2025 16:02:50 -0700
Message-ID: <20250829230251.3095911-1-olvaffe@gmail.com>
X-Mailer: git-send-email 2.51.0.318.gd7df087d1a-goog
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

Userspace relies on the ring field of gpu_scheduler tracepoints to
identify a drm_gpu_scheduler.  The value of the ring field is taken from
sched->name.

Because we typically have multiple schedulers running in parallel in
each process, assign unique names to schedulers such that userspace can
distinguish them.

Signed-off-by: Chia-I Wu <olvaffe@gmail.com>

---

v2:
 - include drm_client_id in the name to be truly unique
 - remove unnecessary NULL in drm_sched_init_args initialization
 - reformat to column width 100
---
 drivers/gpu/drm/panthor/panthor_drv.c   |  2 +-
 drivers/gpu/drm/panthor/panthor_sched.c | 32 +++++++++++++++++--------
 drivers/gpu/drm/panthor/panthor_sched.h |  3 ++-
 3 files changed, 25 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/panthor/panthor_drv.c
index 9256806eb6623..be962b1387f03 100644
--- a/drivers/gpu/drm/panthor/panthor_drv.c
+++ b/drivers/gpu/drm/panthor/panthor_drv.c
@@ -1105,7 +1105,7 @@ static int panthor_ioctl_group_create(struct drm_device *ddev, void *data,
 	if (ret)
 		goto out;
 
-	ret = panthor_group_create(pfile, args, queue_args);
+	ret = panthor_group_create(pfile, args, queue_args, file->client_id);
 	if (ret < 0)
 		goto out;
 	args->group_handle = ret;
diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
index ba5dc3e443d9c..62f17476e5852 100644
--- a/drivers/gpu/drm/panthor/panthor_sched.c
+++ b/drivers/gpu/drm/panthor/panthor_sched.c
@@ -360,6 +360,9 @@ struct panthor_queue {
 	/** @entity: DRM scheduling entity used for this queue. */
 	struct drm_sched_entity entity;
 
+	/** @name: DRM scheduler name for this queue. */
+	char name[32];
+
 	/**
 	 * @remaining_time: Time remaining before the job timeout expires.
 	 *
@@ -3308,9 +3311,10 @@ static u32 calc_profiling_ringbuf_num_slots(struct panthor_device *ptdev,
 
 static struct panthor_queue *
 group_create_queue(struct panthor_group *group,
-		   const struct drm_panthor_queue_create *args)
+		   const struct drm_panthor_queue_create *args,
+		   u64 drm_client_id, u32 gid, u32 qid)
 {
-	const struct drm_sched_init_args sched_args = {
+	struct drm_sched_init_args sched_args = {
 		.ops = &panthor_queue_sched_ops,
 		.submit_wq = group->ptdev->scheduler->wq,
 		.num_rqs = 1,
@@ -3323,7 +3327,6 @@ group_create_queue(struct panthor_group *group,
 		.credit_limit = args->ringbuf_size / sizeof(u64),
 		.timeout = msecs_to_jiffies(JOB_TIMEOUT_MS),
 		.timeout_wq = group->ptdev->reset.wq,
-		.name = "panthor-queue",
 		.dev = group->ptdev->base.dev,
 	};
 	struct drm_gpu_scheduler *drm_sched;
@@ -3398,6 +3401,11 @@ group_create_queue(struct panthor_group *group,
 	if (ret)
 		goto err_free_queue;
 
+	/* assign a unique name */
+	snprintf(queue->name, sizeof(queue->name), "panthor-queue-%llu-%u-%u",
+		 drm_client_id, gid, qid);
+	sched_args.name = queue->name;
+
 	ret = drm_sched_init(&queue->scheduler, &sched_args);
 	if (ret)
 		goto err_free_queue;
@@ -3447,7 +3455,8 @@ static void add_group_kbo_sizes(struct panthor_device *ptdev,
 
 int panthor_group_create(struct panthor_file *pfile,
 			 const struct drm_panthor_group_create *group_args,
-			 const struct drm_panthor_queue_create *queue_args)
+			 const struct drm_panthor_queue_create *queue_args,
+			 u64 drm_client_id)
 {
 	struct panthor_device *ptdev = pfile->ptdev;
 	struct panthor_group_pool *gpool = pfile->groups;
@@ -3540,12 +3549,16 @@ int panthor_group_create(struct panthor_file *pfile,
 	memset(group->syncobjs->kmap, 0,
 	       group_args->queues.count * sizeof(struct panthor_syncobj_64b));
 
+	ret = xa_alloc(&gpool->xa, &gid, group, XA_LIMIT(1, MAX_GROUPS_PER_POOL), GFP_KERNEL);
+	if (ret)
+		goto err_put_group;
+
 	for (i = 0; i < group_args->queues.count; i++) {
-		group->queues[i] = group_create_queue(group, &queue_args[i]);
+		group->queues[i] = group_create_queue(group, &queue_args[i], drm_client_id, gid, i);
 		if (IS_ERR(group->queues[i])) {
 			ret = PTR_ERR(group->queues[i]);
 			group->queues[i] = NULL;
-			goto err_put_group;
+			goto err_erase_gid;
 		}
 
 		group->queue_count++;
@@ -3553,10 +3566,6 @@ int panthor_group_create(struct panthor_file *pfile,
 
 	group->idle_queues = GENMASK(group->queue_count - 1, 0);
 
-	ret = xa_alloc(&gpool->xa, &gid, group, XA_LIMIT(1, MAX_GROUPS_PER_POOL), GFP_KERNEL);
-	if (ret)
-		goto err_put_group;
-
 	mutex_lock(&sched->reset.lock);
 	if (atomic_read(&sched->reset.in_progress)) {
 		panthor_group_stop(group);
@@ -3575,6 +3584,9 @@ int panthor_group_create(struct panthor_file *pfile,
 
 	return gid;
 
+err_erase_gid:
+	xa_erase(&gpool->xa, gid);
+
 err_put_group:
 	group_put(group);
 	return ret;
diff --git a/drivers/gpu/drm/panthor/panthor_sched.h b/drivers/gpu/drm/panthor/panthor_sched.h
index 742b0b4ff3a3c..f4a475aa34c0a 100644
--- a/drivers/gpu/drm/panthor/panthor_sched.h
+++ b/drivers/gpu/drm/panthor/panthor_sched.h
@@ -21,7 +21,8 @@ struct panthor_job;
 
 int panthor_group_create(struct panthor_file *pfile,
 			 const struct drm_panthor_group_create *group_args,
-			 const struct drm_panthor_queue_create *queue_args);
+			 const struct drm_panthor_queue_create *queue_args,
+			 u64 drm_client_id);
 int panthor_group_destroy(struct panthor_file *pfile, u32 group_handle);
 int panthor_group_get_state(struct panthor_file *pfile,
 			    struct drm_panthor_group_get_state *get_state);
-- 
2.51.0.318.gd7df087d1a-goog

