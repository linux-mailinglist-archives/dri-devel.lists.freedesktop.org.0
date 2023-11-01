Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F288A7DDF8B
	for <lists+dri-devel@lfdr.de>; Wed,  1 Nov 2023 11:36:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BAD810E6C2;
	Wed,  1 Nov 2023 10:36:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A58B10E6BD
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Nov 2023 10:36:22 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id C75FB21A66;
 Wed,  1 Nov 2023 10:36:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1698834980; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EUVYYbUyXJL0XRkyglVlc+0v4swk/i9r6dKVunIozEQ=;
 b=XgOQk+cOGfA7P225cA1bbF+bvEqYsoFEvyHbSe9JMVb1ykQJkhAqdvX45w3Ed+9+RRQv4f
 ba7ItVcSPpK0nPJ7FyS3RKKyHa8RHAIxrb6azaQ612izIK+3bpZ9p1IRz+GodPNl9O7Yuy
 fVHQ7k3cGkm/0lR9aiqsitYP4tThG6Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1698834980;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EUVYYbUyXJL0XRkyglVlc+0v4swk/i9r6dKVunIozEQ=;
 b=yCnFEjxy/RdyQf28Pm5Ne/h1j1zGUnWLyrPsiXal/Vh15S58ja1eSfZfhpc+wZDnKD2qe4
 uH3NWr4wRzdBRMAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 9C77713A92;
 Wed,  1 Nov 2023 10:36:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id gLlGJSQqQmVfJAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 01 Nov 2023 10:36:20 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: bbrezillon@kernel.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@gmail.com, daniel@ffwll.ch
Subject: [PATCH v2 1/2] drm: Remove struct drm_flip_task from DRM interfaces
Date: Wed,  1 Nov 2023 11:35:42 +0100
Message-ID: <20231101103618.23806-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231101103618.23806-1-tzimmermann@suse.de>
References: <20231101103618.23806-1-tzimmermann@suse.de>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Contain struct drm_flip_task and its helper functions
drm_flip_work_allocate_task() and drm_flip_work_queue_task() within
drm_flip_work.c There are no callers outside of the flip-work code.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 drivers/gpu/drm/drm_flip_work.c | 27 +++++++--------------------
 include/drm/drm_flip_work.h     | 18 ++----------------
 2 files changed, 9 insertions(+), 36 deletions(-)

diff --git a/drivers/gpu/drm/drm_flip_work.c b/drivers/gpu/drm/drm_flip_work.c
index 060b753881a27..8c6090a90d564 100644
--- a/drivers/gpu/drm/drm_flip_work.c
+++ b/drivers/gpu/drm/drm_flip_work.c
@@ -27,14 +27,12 @@
 #include <drm/drm_print.h>
 #include <drm/drm_util.h>
 
-/**
- * drm_flip_work_allocate_task - allocate a flip-work task
- * @data: data associated to the task
- * @flags: allocator flags
- *
- * Allocate a drm_flip_task object and attach private data to it.
- */
-struct drm_flip_task *drm_flip_work_allocate_task(void *data, gfp_t flags)
+struct drm_flip_task {
+	struct list_head node;
+	void *data;
+};
+
+static struct drm_flip_task *drm_flip_work_allocate_task(void *data, gfp_t flags)
 {
 	struct drm_flip_task *task;
 
@@ -44,18 +42,8 @@ struct drm_flip_task *drm_flip_work_allocate_task(void *data, gfp_t flags)
 
 	return task;
 }
-EXPORT_SYMBOL(drm_flip_work_allocate_task);
 
-/**
- * drm_flip_work_queue_task - queue a specific task
- * @work: the flip-work
- * @task: the task to handle
- *
- * Queues task, that will later be run (passed back to drm_flip_func_t
- * func) on a work queue after drm_flip_work_commit() is called.
- */
-void drm_flip_work_queue_task(struct drm_flip_work *work,
-			      struct drm_flip_task *task)
+static void drm_flip_work_queue_task(struct drm_flip_work *work, struct drm_flip_task *task)
 {
 	unsigned long flags;
 
@@ -63,7 +51,6 @@ void drm_flip_work_queue_task(struct drm_flip_work *work,
 	list_add_tail(&task->node, &work->queued);
 	spin_unlock_irqrestore(&work->lock, flags);
 }
-EXPORT_SYMBOL(drm_flip_work_queue_task);
 
 /**
  * drm_flip_work_queue - queue work
diff --git a/include/drm/drm_flip_work.h b/include/drm/drm_flip_work.h
index 21c3d512d25c4..6be4ba6f35143 100644
--- a/include/drm/drm_flip_work.h
+++ b/include/drm/drm_flip_work.h
@@ -33,9 +33,8 @@
  *
  * Util to queue up work to run from work-queue context after flip/vblank.
  * Typically this can be used to defer unref of framebuffer's, cursor
- * bo's, etc until after vblank.  The APIs are all thread-safe.
- * Moreover, drm_flip_work_queue_task and drm_flip_work_queue can be called
- * in atomic context.
+ * bo's, etc until after vblank.  The APIs are all thread-safe. Moreover,
+ * drm_flip_work_queue can be called in atomic context.
  */
 
 struct drm_flip_work;
@@ -51,16 +50,6 @@ struct drm_flip_work;
  */
 typedef void (*drm_flip_func_t)(struct drm_flip_work *work, void *val);
 
-/**
- * struct drm_flip_task - flip work task
- * @node: list entry element
- * @data: data to pass to &drm_flip_work.func
- */
-struct drm_flip_task {
-	struct list_head node;
-	void *data;
-};
-
 /**
  * struct drm_flip_work - flip work queue
  * @name: debug name
@@ -79,9 +68,6 @@ struct drm_flip_work {
 	spinlock_t lock;
 };
 
-struct drm_flip_task *drm_flip_work_allocate_task(void *data, gfp_t flags);
-void drm_flip_work_queue_task(struct drm_flip_work *work,
-			      struct drm_flip_task *task);
 void drm_flip_work_queue(struct drm_flip_work *work, void *val);
 void drm_flip_work_commit(struct drm_flip_work *work,
 		struct workqueue_struct *wq);
-- 
2.42.0

