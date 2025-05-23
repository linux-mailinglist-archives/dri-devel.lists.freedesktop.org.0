Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E806CAC232F
	for <lists+dri-devel@lfdr.de>; Fri, 23 May 2025 14:56:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 764D810E2DD;
	Fri, 23 May 2025 12:56:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="CPZe4foU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com
 [209.85.208.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E825510E2D3;
 Fri, 23 May 2025 12:56:48 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id
 4fb4d7f45d1cf-6023cf146d3so6099130a12.3; 
 Fri, 23 May 2025 05:56:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1748005007; x=1748609807; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=cseUNXTQin4+UpfHnQxalvARIuUoYZ0bHLcpHO0h4nY=;
 b=CPZe4foUpTCVE2yOUmBOeaq89pKe/GWuGp5zGAsY2kTSbi5kwl0e0t20A186j+oJHt
 nuxDc7Y8KVpjpY1JL96fut7oxsMYqyB7/s1KN8RDnyiVCPLf9kWBKgwrp2ssb8jGZdci
 Cdodp0w1d03biIrjtPY+yQWIe+dSYBEgZkLq8npY4uMH4tJZAwSBwhbxD4YIqfs21U+q
 Y6gzSoi70LmGkF/g6S/nBvzBADRrR8UqZekt8AR7VnuSNpWR1LPpOJQch0HdDZNHqGkb
 7JIR593rWZxCXddLzl4cADHsDRroLPlkZNhEQqeN4c5MIPl5SDqydt/Ue0uoLbzP4YGS
 pXPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748005007; x=1748609807;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cseUNXTQin4+UpfHnQxalvARIuUoYZ0bHLcpHO0h4nY=;
 b=VFvBciiK7C0gG5cXWEIq6EWJoRIzph2MLKJbA7E+jXakBCnGLdcOdpm0UEDsS9bOaY
 k9xhIQJW6L7vKcAL4YRJMtJ33Qjg/PhRe+Uml8J8j8QM+W31Hv974f54XpYjPnBpkZdb
 NdgPMZBa39fEfGTLfxGhtBRuCVoZdXkTF9eR2vFUWDdv3PUY4n3AD8EbLHWEldjwiXSl
 ELr0L9hE7+q58ZpkraMI3q4QvKOZEeXw51CbfS1zSdNaN28TS3f64PKT7Fyxuxw5H3gZ
 wKQFENcUrhEPPiVEEPM3ROAgS/vYA4G2qc5aXkfxvjMKk1x1dUM0j7uv+C5Ny6CDbgUN
 vs4w==
X-Forwarded-Encrypted: i=1;
 AJvYcCV6qkc+4Rjwu5uQHgjlFii6TqYFV5oOLOICWHyIMH8ehID5iIE834TirAs2uz/svZxkFGZV+U6j@lists.freedesktop.org,
 AJvYcCVZ5WjHGptUbwxTVJjRjGMmWjzyYFz8VfUAVExPJTS0PZCgJ9MgEJzZgkVMmP187DontVlEFuCX241e@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw597jwRYQ+VmHG19ity0VxdPLqh9/wTO90pNsedFpYNh1nftDj
 oVL/JJbutr3AcVM/ZJBnfNRAf5gPmQ6JuGQo+raaQGMjCUp8IfY78lrB
X-Gm-Gg: ASbGncuohPC0b/L7KRCXEg6P2b/u29rnVh6UxM8X3TQEucOuNLnQET4ViWMNi1lPdae
 Bz3SweX3OSpZvVxS4DDBp7nAB5/clXWXet1dOUjvuuVgLif/krx1+CKadYaUMqgWT8WZxZ0nav8
 Sg38aTGNlDVR3HDuNYp1211yiaKx9jJKf0wjoKK1OwAWTkNg8ZxCHQ+4yjsVP4fLDGTnCtR/YHi
 ZzJht/wRMBaBjY1Gfx3S12J9ObGHFaf389+2UjKPNUk0+96IgURRde5gzej8sGIYX6fcWuf/kVJ
 RbAVvmpN/g7jexZyGCGA6S3diAJIolRDegq67zCQ657dScYaxmvHMj2mVal1j+g8
X-Google-Smtp-Source: AGHT+IG7R1Z9rdU7c/kAjJ7sMuRuAZ4YBL8Mf2kHc2Y9NhgRC9ootzxBUbuhV6RSxk+sNoXpPOeanQ==
X-Received: by 2002:a05:6402:5189:b0:600:2af6:d933 with SMTP id
 4fb4d7f45d1cf-6008a392324mr27254066a12.3.1748005007158; 
 Fri, 23 May 2025 05:56:47 -0700 (PDT)
Received: from able.fritz.box ([2a00:e180:1544:9c00:c200:979c:6701:1954])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6020e441c84sm5863302a12.38.2025.05.23.05.56.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 May 2025 05:56:46 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: tursulin@ursulin.net, phasta@mailbox.org, dakr@kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [PATCH 2/4] drm/sched: add drm_sched_prealloc_dependency_slots
Date: Fri, 23 May 2025 14:56:41 +0200
Message-Id: <20250523125643.7540-3-christian.koenig@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250523125643.7540-1-christian.koenig@amd.com>
References: <20250523125643.7540-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Sometimes drivers need to be able to submit multiple jobs which depend on
each other to different schedulers at the same time, but using
drm_sched_job_add_dependency() can't fail any more after the first job is
initialized.

This function preallocate memory for dependency slots so that no ENOMEM
can come later while adding dependencies.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/scheduler/sched_main.c | 42 +++++++++++++++++++++++++-
 include/drm/gpu_scheduler.h            |  2 ++
 2 files changed, 43 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index cf200b1b643e..37082f52f43f 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -858,6 +858,43 @@ void drm_sched_job_arm(struct drm_sched_job *job)
 }
 EXPORT_SYMBOL(drm_sched_job_arm);
 
+/**
+ * drm_sched_job_prealloc_dependency_slots - avoid ENOMEM on adding dependencies
+ * @job: scheduler job where dependencies will be added
+ * @num_slots: number of slots to reserve
+  *
+ * Sometimes drivers need to be able to submit multiple jobs which depend on
+ * each other to different schedulers at the same time, but using
+ * drm_sched_job_add_dependency() can't fail any more after the first job is
+ * initialized.
+ *
+ * This function preallocate memory for dependency slots so that no ENOMEM can
+ * come later while adding dependencies.
+ *
+ * Return:
+ * 0 on success, or an error on failing to expand the array.
+ */
+int drm_sched_job_prealloc_dependency_slots(struct drm_sched_job *job,
+					    unsigned int num_slots)
+{
+	int ret;
+	u32 id;
+
+	/*
+	 * This works because NULL entries are not returned by xa_for_each. So
+	 * drm_sched_job_add_dependency() will ignore those while checking for
+	 * duplicates, but can then use the entry when storing the new fence.
+	 */
+	while (num_slots--) {
+		ret = xa_alloc(&job->dependencies, &id, NULL, xa_limit_32b,
+			       GFP_KERNEL);
+		if (ret)
+			return ret;
+	}
+	return 0;
+}
+EXPORT_SYMBOL(drm_sched_job_prealloc_dependency_slots);
+
 /**
  * drm_sched_job_add_dependency - adds the fence as a job dependency
  * @job: scheduler job to add the dependencies to
@@ -883,6 +920,9 @@ int drm_sched_job_add_dependency(struct drm_sched_job *job,
 	 */
 	xa_lock(&job->dependencies);
 	xas_for_each(&xas, entry, ULONG_MAX) {
+		if (xa_is_zero(entry))
+		    break;
+
 		if (entry->context != fence->context)
 			continue;
 
@@ -909,7 +949,7 @@ int drm_sched_job_add_dependency(struct drm_sched_job *job,
 	if (xas_error(&xas))
 		dma_fence_put(fence);
 	else
-		WARN_ON(entry);
+		WARN_ON(entry && !xa_is_zero(entry));
 
 	return xas_error(&xas);
 }
diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
index d860db087ea5..a560a00c6275 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -632,6 +632,8 @@ int drm_sched_job_init(struct drm_sched_job *job,
 		       u32 credits, void *owner);
 void drm_sched_job_arm(struct drm_sched_job *job);
 void drm_sched_entity_push_job(struct drm_sched_job *sched_job);
+int drm_sched_job_prealloc_dependency_slots(struct drm_sched_job *job,
+					    unsigned int num_slots);
 int drm_sched_job_add_dependency(struct drm_sched_job *job,
 				 struct dma_fence *fence);
 int drm_sched_job_add_syncobj_dependency(struct drm_sched_job *job,
-- 
2.34.1

