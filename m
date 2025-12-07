Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF88ECAB47D
	for <lists+dri-devel@lfdr.de>; Sun, 07 Dec 2025 13:39:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D593610E355;
	Sun,  7 Dec 2025 12:39:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="b27Kl7gF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6C4110E355
 for <dri-devel@lists.freedesktop.org>; Sun,  7 Dec 2025 12:39:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1765111164;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to; bh=EsBQW8HxAVAKrwqsykmMqSqPHf2ZEI/TGurllEoeIZc=;
 b=b27Kl7gFUBry20XCMTBJRjjOTBsQ0NxYUeYOHc9fBcbQvEySwYRiVGeNl/bZeZL8Rf+xQP
 +a9fXK+MoXpuXvCQJy5v3JDPxT30QlaMII5pGkhhqFGggorjvMV45EK4R8i74nCY3j3Uob
 eAO/iLuoMZxTplFDsksGq9YGq9UsjwI=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-576-mgcHMoYVOeuGRxXPF14XEQ-1; Sun,
 07 Dec 2025 07:39:18 -0500
X-MC-Unique: mgcHMoYVOeuGRxXPF14XEQ-1
X-Mimecast-MFC-AGG-ID: mgcHMoYVOeuGRxXPF14XEQ_1765111155
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 61B691956053; Sun,  7 Dec 2025 12:39:14 +0000 (UTC)
Received: from fedora (unknown [10.44.32.50])
 by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP
 id E641B1953986; Sun,  7 Dec 2025 12:39:03 +0000 (UTC)
Received: by fedora (nbSMTP-1.00) for uid 1000
 oleg@redhat.com; Sun,  7 Dec 2025 13:39:16 +0100 (CET)
Date: Sun, 7 Dec 2025 13:39:04 +0100
From: Oleg Nesterov <oleg@redhat.com>
To: Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>,
 Joel Fernandes <joelagnelf@nvidia.com>,
 Christian Brauner <brauner@kernel.org>,
 Carlos Llamas <cmllamas@google.com>,
 Suren Baghdasaryan <surenb@google.com>,
 Felix Kuehling <Felix.Kuehling@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>,
 =?iso-8859-1?Q?Adri=E1n?= Larumbe <adrian.larumbe@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Liviu Dudau <liviu.dudau@arm.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 Leon Romanovsky <leon@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-rdma@vger.kernel.org,
 netdev@vger.kernel.org
Subject: [PATCH 1/7] android/binder: don't abuse current->group_leader
Message-ID: <aTV1aJVZ8B8_n2LE@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aTV1KYdcDGvjXHos@redhat.com>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
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

Cleanup and preparation to simplify the next changes.

- Use current->tgid instead of current->group_leader->pid

- Use the value returned by get_task_struct() to initialize proc->tsk

Signed-off-by: Oleg Nesterov <oleg@redhat.com>
---
 drivers/android/binder.c       | 7 +++----
 drivers/android/binder_alloc.c | 2 +-
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/android/binder.c b/drivers/android/binder.c
index a3a1b5c33ba3..a00f6678f04d 100644
--- a/drivers/android/binder.c
+++ b/drivers/android/binder.c
@@ -6044,7 +6044,7 @@ static int binder_open(struct inode *nodp, struct file *filp)
 	bool existing_pid = false;
 
 	binder_debug(BINDER_DEBUG_OPEN_CLOSE, "%s: %d:%d\n", __func__,
-		     current->group_leader->pid, current->pid);
+		     current->tgid, current->pid);
 
 	proc = kzalloc(sizeof(*proc), GFP_KERNEL);
 	if (proc == NULL)
@@ -6053,8 +6053,8 @@ static int binder_open(struct inode *nodp, struct file *filp)
 	dbitmap_init(&proc->dmap);
 	spin_lock_init(&proc->inner_lock);
 	spin_lock_init(&proc->outer_lock);
-	get_task_struct(current->group_leader);
-	proc->tsk = current->group_leader;
+	proc->tsk = get_task_struct(current->group_leader);
+	proc->pid = current->tgid;
 	proc->cred = get_cred(filp->f_cred);
 	INIT_LIST_HEAD(&proc->todo);
 	init_waitqueue_head(&proc->freeze_wait);
@@ -6073,7 +6073,6 @@ static int binder_open(struct inode *nodp, struct file *filp)
 	binder_alloc_init(&proc->alloc);
 
 	binder_stats_created(BINDER_STAT_PROC);
-	proc->pid = current->group_leader->pid;
 	INIT_LIST_HEAD(&proc->delivered_death);
 	INIT_LIST_HEAD(&proc->delivered_freeze);
 	INIT_LIST_HEAD(&proc->waiting_threads);
diff --git a/drivers/android/binder_alloc.c b/drivers/android/binder_alloc.c
index 979c96b74cad..145ed5f14cdb 100644
--- a/drivers/android/binder_alloc.c
+++ b/drivers/android/binder_alloc.c
@@ -1233,7 +1233,7 @@ static struct shrinker *binder_shrinker;
 VISIBLE_IF_KUNIT void __binder_alloc_init(struct binder_alloc *alloc,
 					  struct list_lru *freelist)
 {
-	alloc->pid = current->group_leader->pid;
+	alloc->pid = current->tgid;
 	alloc->mm = current->mm;
 	mmgrab(alloc->mm);
 	mutex_init(&alloc->mutex);
-- 
2.52.0

