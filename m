Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1679903803
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jun 2024 11:40:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77C3210E06B;
	Tue, 11 Jun 2024 09:39:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="lzOxuyFK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com
 [209.85.218.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5470A10E06B
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2024 09:39:56 +0000 (UTC)
Received: by mail-ej1-f48.google.com with SMTP id
 a640c23a62f3a-a6f0c3d0792so94783966b.3
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2024 02:39:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1718098793; x=1718703593;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=zq+3CFIfjIb9rGw65SQ2yKXGNgqBWOhUmk2QFO4Sg54=;
 b=lzOxuyFK9kAbD5uVjqLpHCgu8mHJPTe+4PSFfABjjT2s9ziJqaQlyMQ8xr9ujCr6Ef
 LUkE+48TQd8AA6F53e+O+lNH3CsljLXlsVlepuaO55ahPof51kioM0MrEWuC//czbBe9
 DA+JFuFg/tqUD/6CQeamq2TgT6AoUiiQkl7dw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718098793; x=1718703593;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zq+3CFIfjIb9rGw65SQ2yKXGNgqBWOhUmk2QFO4Sg54=;
 b=MPZCjXnj7e294DN0FdKrUdh+dVPsxTTZlMPfwvqXOlmZPOAnTZgT1zPI34RqlLWoZT
 1a+aEVpEG3CIFHWWyS0faDbnbaTKgldQi8t/oHIOnPrZx1Bkuon7GUb+VLidYvTYe1oh
 +VFX+GRJyfbF3w5wyEBMCzE8TtkvSupH5++oLyNqWeGgvVTdcM+6XvxJhZDGrPL7Pon3
 ieAQIks60Zk/TyjjbISC8kJfeIsvw068Al4UOGVzQFJpDJW9lJc3xuZGL0NLn7GL1FRb
 XOiXT4ciVyyea5ND1OuhYPXNDPVB6BplCrghHgb5jR/o0MFn3hHNjV169EWnBdwVel0U
 LlfQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX2RYlChDeVvRmy8k6m0NZdZLRnNINbhxTxlLMNQkvSYKmKMziC++3ChKDEXBuPnwWTDa9nZXH2ktCsHOJ7peol+LSctbrDjm1I03XN2MU8
X-Gm-Message-State: AOJu0Yxi7zuyWbE4YR6RmppErfTIy5wEk2WY7cgRQUZVLSlX5ZOCYRfi
 +JYlE9goMI7+RVYrup3tjLwamqe+6Qmm1BFetByYrY4Ege0oyLGCr48suj5WTM8=
X-Google-Smtp-Source: AGHT+IGt3AN1cHSg8nRm07fjdzGI6uynnoqyiMOefjN2y8iG4ssEr3UQqKFszhEbF66xDPqhgsAszA==
X-Received: by 2002:a17:906:bc4e:b0:a6f:20ed:8b3d with SMTP id
 a640c23a62f3a-a6f20ed8c4cmr336140266b.33.1718098793027; 
 Tue, 11 Jun 2024 02:39:53 -0700 (PDT)
Received: from andrea-amarula.amarulasolutions.com ([85.148.28.6])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6f118dd6e6sm360133166b.206.2024.06.11.02.39.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Jun 2024 02:39:52 -0700 (PDT)
From: Andrea Calabrese <andrea.calabrese@amarulasolutions.com>
To: regkh@linuxfoundation.org, rafael@kernel.org,
 dri-devel@lists.freedesktop.org
Cc: trivial@kernel.org, linux-amarula@amarulasolutions.com,
 andrea.calabrese@amarulasolutions.com
Subject: [PATCH v3] devres: Refactor using guards
Date: Tue, 11 Jun 2024 11:37:12 +0200
Message-Id: <20240611093710.1066510-1-andrea.calabrese@amarulasolutions.com>
X-Mailer: git-send-email 2.34.1
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

Code refactoring using the recent guard and scoped_guard macros
for automatic cleanup of the spinlocks. This does not change the
effective behaviour of the kernel, but guarantees a cleaned-up exit from
each lock, automatically avoiding potential deadlocks.

Signed-off-by: Andrea Calabrese <andrea.calabrese@amarulasolutions.com>

---
Changed commit message from V2. Also changed title, shortened the file
name.

diff --git a/drivers/base/devres.c b/drivers/base/devres.c
index 3df0025d12aa..a98720e0cb2b 100644
--- a/drivers/base/devres.c
+++ b/drivers/base/devres.c
@@ -194,14 +194,12 @@ void devres_for_each_res(struct device *dev, dr_release_t release,
 {
 	struct devres_node *node;
 	struct devres_node *tmp;
-	unsigned long flags;
 
 	if (!fn)
 		return;
 
-	spin_lock_irqsave(&dev->devres_lock, flags);
-	list_for_each_entry_safe_reverse(node, tmp,
-			&dev->devres_head, entry) {
+	guard(spinlock)(&dev->devres_lock);
+	list_for_each_entry_safe_reverse(node, tmp, &dev->devres_head, entry) {
 		struct devres *dr = container_of(node, struct devres, node);
 
 		if (node->release != release)
@@ -210,7 +208,6 @@ void devres_for_each_res(struct device *dev, dr_release_t release,
 			continue;
 		fn(dev, dr->data, data);
 	}
-	spin_unlock_irqrestore(&dev->devres_lock, flags);
 }
 EXPORT_SYMBOL_GPL(devres_for_each_res);
 
@@ -243,11 +240,9 @@ EXPORT_SYMBOL_GPL(devres_free);
 void devres_add(struct device *dev, void *res)
 {
 	struct devres *dr = container_of(res, struct devres, data);
-	unsigned long flags;
 
-	spin_lock_irqsave(&dev->devres_lock, flags);
+	guard(spinlock)(&dev->devres_lock);
 	add_dr(dev, &dr->node);
-	spin_unlock_irqrestore(&dev->devres_lock, flags);
 }
 EXPORT_SYMBOL_GPL(devres_add);
 
@@ -287,11 +282,8 @@ void * devres_find(struct device *dev, dr_release_t release,
 		   dr_match_t match, void *match_data)
 {
 	struct devres *dr;
-	unsigned long flags;
-
-	spin_lock_irqsave(&dev->devres_lock, flags);
+	guard(spinlock)(&dev->devres_lock);
 	dr = find_dr(dev, release, match, match_data);
-	spin_unlock_irqrestore(&dev->devres_lock, flags);
 
 	if (dr)
 		return dr->data;
@@ -318,16 +310,14 @@ void * devres_get(struct device *dev, void *new_res,
 {
 	struct devres *new_dr = container_of(new_res, struct devres, data);
 	struct devres *dr;
-	unsigned long flags;
-
-	spin_lock_irqsave(&dev->devres_lock, flags);
-	dr = find_dr(dev, new_dr->node.release, match, match_data);
-	if (!dr) {
-		add_dr(dev, &new_dr->node);
-		dr = new_dr;
-		new_res = NULL;
+	scoped_guard(spinlock, &dev->devres_lock) {
+		dr = find_dr(dev, new_dr->node.release, match, match_data);
+		if (!dr) {
+			add_dr(dev, &new_dr->node);
+			dr = new_dr;
+			new_res = NULL;
+		}
 	}
-	spin_unlock_irqrestore(&dev->devres_lock, flags);
 	devres_free(new_res);
 
 	return dr->data;
@@ -353,15 +343,13 @@ void * devres_remove(struct device *dev, dr_release_t release,
 		     dr_match_t match, void *match_data)
 {
 	struct devres *dr;
-	unsigned long flags;
-
-	spin_lock_irqsave(&dev->devres_lock, flags);
-	dr = find_dr(dev, release, match, match_data);
-	if (dr) {
-		list_del_init(&dr->node.entry);
-		devres_log(dev, &dr->node, "REM");
+	scoped_guard(spinlock, &dev->devres_lock) {
+		dr = find_dr(dev, release, match, match_data);
+		if (dr) {
+			list_del_init(&dr->node.entry);
+			devres_log(dev, &dr->node, "REM");
+		}
 	}
-	spin_unlock_irqrestore(&dev->devres_lock, flags);
 
 	if (dr)
 		return dr->data;
@@ -516,7 +504,6 @@ static void release_nodes(struct device *dev, struct list_head *todo)
  */
 int devres_release_all(struct device *dev)
 {
-	unsigned long flags;
 	LIST_HEAD(todo);
 	int cnt;
 
@@ -528,9 +515,9 @@ int devres_release_all(struct device *dev)
 	if (list_empty(&dev->devres_head))
 		return 0;
 
-	spin_lock_irqsave(&dev->devres_lock, flags);
-	cnt = remove_nodes(dev, dev->devres_head.next, &dev->devres_head, &todo);
-	spin_unlock_irqrestore(&dev->devres_lock, flags);
+	scoped_guard(spinlock, &dev->devres_lock) {
+		cnt = remove_nodes(dev, dev->devres_head.next, &dev->devres_head, &todo);
+	}
 
 	release_nodes(dev, &todo);
 	return cnt;
@@ -552,7 +539,6 @@ int devres_release_all(struct device *dev)
 void * devres_open_group(struct device *dev, void *id, gfp_t gfp)
 {
 	struct devres_group *grp;
-	unsigned long flags;
 
 	grp = kmalloc(sizeof(*grp), gfp);
 	if (unlikely(!grp))
@@ -568,9 +554,8 @@ void * devres_open_group(struct device *dev, void *id, gfp_t gfp)
 	if (id)
 		grp->id = id;
 
-	spin_lock_irqsave(&dev->devres_lock, flags);
+	guard(spinlock)(&dev->devres_lock);
 	add_dr(dev, &grp->node[0]);
-	spin_unlock_irqrestore(&dev->devres_lock, flags);
 	return grp->id;
 }
 EXPORT_SYMBOL_GPL(devres_open_group);
@@ -609,17 +594,14 @@ static struct devres_group * find_group(struct device *dev, void *id)
 void devres_close_group(struct device *dev, void *id)
 {
 	struct devres_group *grp;
-	unsigned long flags;
 
-	spin_lock_irqsave(&dev->devres_lock, flags);
+	guard(spinlock)(&dev->devres_lock);
 
 	grp = find_group(dev, id);
 	if (grp)
 		add_dr(dev, &grp->node[1]);
 	else
 		WARN_ON(1);
-
-	spin_unlock_irqrestore(&dev->devres_lock, flags);
 }
 EXPORT_SYMBOL_GPL(devres_close_group);
 
@@ -635,19 +617,16 @@ EXPORT_SYMBOL_GPL(devres_close_group);
 void devres_remove_group(struct device *dev, void *id)
 {
 	struct devres_group *grp;
-	unsigned long flags;
-
-	spin_lock_irqsave(&dev->devres_lock, flags);
-
-	grp = find_group(dev, id);
-	if (grp) {
-		list_del_init(&grp->node[0].entry);
-		list_del_init(&grp->node[1].entry);
-		devres_log(dev, &grp->node[0], "REM");
-	} else
-		WARN_ON(1);
 
-	spin_unlock_irqrestore(&dev->devres_lock, flags);
+	scoped_guard(spinlock, &dev->devres_lock) {
+		grp = find_group(dev, id);
+		if (grp) {
+			list_del_init(&grp->node[0].entry);
+			list_del_init(&grp->node[1].entry);
+			devres_log(dev, &grp->node[0], "REM");
+		} else
+			WARN_ON(1);
+	}
 
 	kfree(grp);
 }
@@ -668,11 +647,10 @@ EXPORT_SYMBOL_GPL(devres_remove_group);
 int devres_release_group(struct device *dev, void *id)
 {
 	struct devres_group *grp;
-	unsigned long flags;
 	LIST_HEAD(todo);
 	int cnt = 0;
 
-	spin_lock_irqsave(&dev->devres_lock, flags);
+	guard(spinlock)(&dev->devres_lock);
 
 	grp = find_group(dev, id);
 	if (grp) {
@@ -683,12 +661,9 @@ int devres_release_group(struct device *dev, void *id)
 			end = grp->node[1].entry.next;
 
 		cnt = remove_nodes(dev, first, end, &todo);
-		spin_unlock_irqrestore(&dev->devres_lock, flags);
-
 		release_nodes(dev, &todo);
 	} else {
 		WARN_ON(1);
-		spin_unlock_irqrestore(&dev->devres_lock, flags);
 	}
 
 	return cnt;
@@ -860,7 +835,6 @@ void *devm_krealloc(struct device *dev, void *ptr, size_t new_size, gfp_t gfp)
 {
 	size_t total_new_size, total_old_size;
 	struct devres *old_dr, *new_dr;
-	unsigned long flags;
 
 	if (unlikely(!new_size)) {
 		devm_kfree(dev, ptr);
@@ -906,20 +880,17 @@ void *devm_krealloc(struct device *dev, void *ptr, size_t new_size, gfp_t gfp)
 	 * The spinlock protects the linked list against concurrent
 	 * modifications but not the resource itself.
 	 */
-	spin_lock_irqsave(&dev->devres_lock, flags);
+	scoped_guard(spinlock, &dev->devres_lock) {
+		old_dr = find_dr(dev, devm_kmalloc_release, devm_kmalloc_match, ptr);
+		if (!old_dr) {
+			kfree(new_dr);
+			WARN(1, "Memory chunk not managed or managed by a different device.");
+			return NULL;
+		}
 
-	old_dr = find_dr(dev, devm_kmalloc_release, devm_kmalloc_match, ptr);
-	if (!old_dr) {
-		spin_unlock_irqrestore(&dev->devres_lock, flags);
-		kfree(new_dr);
-		WARN(1, "Memory chunk not managed or managed by a different device.");
-		return NULL;
+		replace_dr(dev, &old_dr->node, &new_dr->node);
 	}
 
-	replace_dr(dev, &old_dr->node, &new_dr->node);
-
-	spin_unlock_irqrestore(&dev->devres_lock, flags);
-
 	/*
 	 * We can copy the memory contents after releasing the lock as we're
 	 * no longer modifying the list links.
-- 
2.34.1

