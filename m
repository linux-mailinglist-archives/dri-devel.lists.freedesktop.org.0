Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 019057CC2F9
	for <lists+dri-devel@lfdr.de>; Tue, 17 Oct 2023 14:21:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 326B710E2DA;
	Tue, 17 Oct 2023 12:21:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E723B10E2D9
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Oct 2023 12:21:17 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 90D3A1FF0E;
 Tue, 17 Oct 2023 12:21:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1697545276; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=OMT1zsGuXc6gVAsms+N0NH9iBwyi2M6wSdXWTHSQLQU=;
 b=nqgfnkcpxZb7rZHQLpiiOKNryy4k9k4JL58988oUpQHzPnp4D6OcTiXAP21v6CjYH8Xxh/
 mpf50UwGVEaTLIbtLfB6UWDAYsww5fOmgsFb3ioJQASsxBy/g8htH9LWmYE4yOaW69Tri4
 7XCBuwrBZSdaChXkpv4bihkZANA8Zq0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1697545276;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=OMT1zsGuXc6gVAsms+N0NH9iBwyi2M6wSdXWTHSQLQU=;
 b=MHxM5Kx8yiR61SgClGZUd146KSjFN+BjpuTQkgHuyWarqvb6dADm42Dc+U6LZjzx/VKTPE
 HemCHrEg+k9FLBAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6669B13597;
 Tue, 17 Oct 2023 12:21:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id WQoiGDx8LmXnTwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 17 Oct 2023 12:21:16 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: bbrezillon@kernel.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@gmail.com, daniel@ffwll.ch
Subject: [PATCH] drm: Remove struct drm_flip_task from DRM interfaces
Date: Tue, 17 Oct 2023 14:20:53 +0200
Message-ID: <20231017122114.17247-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out2.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: -2.10
X-Spamd-Result: default: False [-2.10 / 50.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 R_MISSING_CHARSET(2.50)[]; MIME_GOOD(-0.10)[text/plain];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]; BROKEN_CONTENT_TYPE(1.50)[];
 NEURAL_HAM_LONG(-3.00)[-1.000];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-1.00)[-1.000]; RCPT_COUNT_SEVEN(0.00)[7];
 MID_CONTAINS_FROM(1.00)[];
 FREEMAIL_TO(0.00)[kernel.org,linux.intel.com,gmail.com,ffwll.ch];
 FROM_EQ_ENVFROM(0.00)[]; MIME_TRACE(0.00)[0:+];
 RCVD_COUNT_TWO(0.00)[2]; RCVD_TLS_ALL(0.00)[];
 BAYES_HAM(-3.00)[100.00%]
X-Spam-Flag: NO
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Contain struct drm_flip_task and its helper functions
drm_flip_work_allocate_task() and drm_flip_work_queue_task() within
drm_flip_work.c There are no callers outside of the flip-work code.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
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

