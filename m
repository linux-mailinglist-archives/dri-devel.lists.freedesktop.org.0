Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1B57AE268D
	for <lists+dri-devel@lfdr.de>; Sat, 21 Jun 2025 01:51:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E67D10E23F;
	Fri, 20 Jun 2025 23:51:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="d9zFbmvE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
 [209.85.214.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11E9610E253
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Jun 2025 23:51:12 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id
 d9443c01a7336-235e1d710d8so33603995ad.1
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Jun 2025 16:51:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1750463471; x=1751068271; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=A/sf8SbFL98/l1BPYcZBxqcTMjZT2nYTK7eVnC4HqoA=;
 b=d9zFbmvEEXsMLzZCz5C21whHkDQV1o2+g78WRRJx6MspAXkmwydsS+su2qAhKh1e0z
 cA63xbRLhhrRUd9lqXfdDvFRNyFtQE2KyngMDgpC6Lq/PVssGMw8PH21juAy1k1mL0Tq
 x8lsPsXeqeYw3QP+A+OvSsfnJj91wKnXRL1oV7wDnmAEkZb5kFJMrjt9l1QtpPjjT/2e
 DVvkjEs6fd6ajB7I/KMkX/27vDkmvq5qe/wiDnkT11teV5NovKxqsPZuGxX3X6mU827o
 cJe+ZrYHeXD1/jNZepJoPRsyE6KzkKBOHtOT86/lfnE/YvuRCsOY3KgmVoEa06BMIQf8
 I7Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750463471; x=1751068271;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=A/sf8SbFL98/l1BPYcZBxqcTMjZT2nYTK7eVnC4HqoA=;
 b=gKlaZjmjJBtUcyJiKPClnQ2A3p7dl4ZWwycx6aUTm7902dbceLyY69VSlWh8LuCJKz
 ciUyLR6dcOw6tVkX4XMOnKDH/OUcF5ddP4u9cPl+r5MmyfKVDtJaId9fWSvZ1b1gP/qN
 O3PTdMBHb4xAIzKZ7Y2T8bEWi1auHcJsr5fyvX8wwD0cWBQQfkE58ufMCr4QlRTHxSgS
 uwY/yyk1L/ciurapal6gHWuWb8OgGgq/XGr9j4a3YbVTOHqglOgX7TWHmTbewyCrTBaK
 FrgRlLX3wVb9E8gPXKUnGo3PT2HsZkg9pX2ES/SNdiA3InnOMx28noGdF11YyDV2Tv7M
 p4Yw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVJLydDqKX2U5pzcCm8wsu7U5my73s607LZstBP0UgvXd5Ndc+S+CXsgO1aPdTJ8vMoA3UKA7rYLao=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyX8Nc/9ZHS8qoQN2eK5E7pVeuiiylEwnz85bHvs/eJ593UNox0
 b+lKrZ1oAdGMME0qeotLwR7oW3oMJdHof9MhwVZe1dnmWItSPHP6usTO
X-Gm-Gg: ASbGncuee2IQnfbAKyrP6PLSeruSogeu6hO0Z0W5DYLDxB9sjQjPc9aZPm7KnhLsqBo
 HYzw5xo4gbetGMOEAADOsL9UL7f2Y/+t9Gb7wb3x/kYj+qa3G4cPMgLT5maXWQdgKNHZekYxL5+
 W2g/BtU/4++s0GwtIOJibHQZbgIImeS56uewdcpjmuIuDh820uyiF+EBAXB6rnTCrIzVwg7ojJX
 Ase3VYLdSrBrm9u1qufjOhUIdSoUUzIMM8RAnv4iZcgdCotQtnTwjHBKRoMYaoMmVqYKcwJCU/Q
 n/tqvgG4dw3bk26Iq86WupoRsWGdr6qUuQ8iF/stSLK10Vm7Re4AifgGziqzgw0CO06BNXY1mAQ
 3uhRv9ZSy3yycE0X36PWS
X-Google-Smtp-Source: AGHT+IFvpIeAyqoZmp4SoLpGagaWJW0y7zfMsAUf01waB/2UFM4r/d7TohfyBmPEFSr+3rivC9nOtw==
X-Received: by 2002:a17:902:d50a:b0:236:748f:541f with SMTP id
 d9443c01a7336-237d9891ca5mr74419055ad.33.1750463471427; 
 Fri, 20 Jun 2025 16:51:11 -0700 (PDT)
Received: from localhost (212.18.125.34.bc.googleusercontent.com.
 [34.125.18.212]) by smtp.gmail.com with UTF8SMTPSA id
 d9443c01a7336-237d86635e0sm27040475ad.157.2025.06.20.16.51.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Jun 2025 16:51:11 -0700 (PDT)
From: Chia-I Wu <olvaffe@gmail.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 2/4] panthor: save panthor_file in panthor_group
Date: Fri, 20 Jun 2025 16:50:51 -0700
Message-ID: <20250620235053.164614-3-olvaffe@gmail.com>
X-Mailer: git-send-email 2.50.0.714.g196bf9f422-goog
In-Reply-To: <20250620235053.164614-1-olvaffe@gmail.com>
References: <20250620235053.164614-1-olvaffe@gmail.com>
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

We would like to access panthor_file from panthor_group on gpu errors.
Because panthour_group can outlive drm_file, add refcount to
panthor_file to ensure its lifetime.

Signed-off-by: Chia-I Wu <olvaffe@gmail.com>
---
 drivers/gpu/drm/panthor/panthor_device.h | 16 ++++++++++++++++
 drivers/gpu/drm/panthor/panthor_drv.c    | 15 ++++++++++++++-
 drivers/gpu/drm/panthor/panthor_mmu.c    |  1 +
 drivers/gpu/drm/panthor/panthor_sched.c  |  6 ++++++
 4 files changed, 37 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panthor/panthor_device.h b/drivers/gpu/drm/panthor/panthor_device.h
index 4fc7cf2aeed57..75ae6fd3a5128 100644
--- a/drivers/gpu/drm/panthor/panthor_device.h
+++ b/drivers/gpu/drm/panthor/panthor_device.h
@@ -256,8 +256,24 @@ struct panthor_file {
 
 	/** @stats: cycle and timestamp measures for job execution. */
 	struct panthor_gpu_usage stats;
+
+	/** @refcount: ref count of this file */
+	struct kref refcount;
 };
 
+static inline struct panthor_file *panthor_file_get(struct panthor_file *pfile)
+{
+	kref_get(&pfile->refcount);
+	return pfile;
+}
+
+void panthor_file_release(struct kref *kref);
+
+static inline void panthor_file_put(struct panthor_file *pfile)
+{
+	kref_put(&pfile->refcount, panthor_file_release);
+}
+
 int panthor_device_init(struct panthor_device *ptdev);
 void panthor_device_unplug(struct panthor_device *ptdev);
 
diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/panthor/panthor_drv.c
index 775a66c394544..aea9609684b77 100644
--- a/drivers/gpu/drm/panthor/panthor_drv.c
+++ b/drivers/gpu/drm/panthor/panthor_drv.c
@@ -1393,6 +1393,16 @@ static int panthor_ioctl_set_user_mmio_offset(struct drm_device *ddev,
 	return 0;
 }
 
+void panthor_file_release(struct kref *kref)
+{
+	struct panthor_file *pfile =
+		container_of(kref, struct panthor_file, refcount);
+
+	WARN_ON(pfile->vms || pfile->groups);
+
+	kfree(pfile);
+}
+
 static int
 panthor_open(struct drm_device *ddev, struct drm_file *file)
 {
@@ -1426,6 +1436,8 @@ panthor_open(struct drm_device *ddev, struct drm_file *file)
 	if (ret)
 		goto err_destroy_vm_pool;
 
+	kref_init(&pfile->refcount);
+
 	file->driver_priv = pfile;
 	return 0;
 
@@ -1442,10 +1454,11 @@ panthor_postclose(struct drm_device *ddev, struct drm_file *file)
 {
 	struct panthor_file *pfile = file->driver_priv;
 
+	/* destroy vm and group handles now to avoid circular references */
 	panthor_group_pool_destroy(pfile);
 	panthor_vm_pool_destroy(pfile);
 
-	kfree(pfile);
+	panthor_file_put(pfile);
 }
 
 static const struct drm_ioctl_desc panthor_drm_driver_ioctls[] = {
diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/panthor/panthor_mmu.c
index b39ea6acc6a96..ccbcfe11420ac 100644
--- a/drivers/gpu/drm/panthor/panthor_mmu.c
+++ b/drivers/gpu/drm/panthor/panthor_mmu.c
@@ -1604,6 +1604,7 @@ void panthor_vm_pool_destroy(struct panthor_file *pfile)
 
 	xa_destroy(&pfile->vms->xa);
 	kfree(pfile->vms);
+	pfile->vms = NULL;
 }
 
 /**
diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
index a2248f692a030..485072904cd7d 100644
--- a/drivers/gpu/drm/panthor/panthor_sched.c
+++ b/drivers/gpu/drm/panthor/panthor_sched.c
@@ -535,6 +535,9 @@ struct panthor_group {
 	/** @ptdev: Device. */
 	struct panthor_device *ptdev;
 
+	/** @pfile: File this group is created from. */
+	struct panthor_file *pfile;
+
 	/** @vm: VM bound to the group. */
 	struct panthor_vm *vm;
 
@@ -919,6 +922,7 @@ static void group_release_work(struct work_struct *work)
 	panthor_kernel_bo_destroy(group->syncobjs);
 
 	panthor_vm_put(group->vm);
+	panthor_file_put(group->pfile);
 	kfree(group);
 }
 
@@ -3467,6 +3471,8 @@ int panthor_group_create(struct panthor_file *pfile,
 	INIT_WORK(&group->tiler_oom_work, group_tiler_oom_work);
 	INIT_WORK(&group->release_work, group_release_work);
 
+	group->pfile = panthor_file_get(pfile);
+
 	group->vm = panthor_vm_pool_get_vm(pfile->vms, group_args->vm_id);
 	if (!group->vm) {
 		ret = -EINVAL;
-- 
2.50.0.714.g196bf9f422-goog

