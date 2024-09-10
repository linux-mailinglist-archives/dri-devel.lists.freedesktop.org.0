Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE97697388E
	for <lists+dri-devel@lfdr.de>; Tue, 10 Sep 2024 15:25:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46DB810E10A;
	Tue, 10 Sep 2024 13:25:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="ml6PPGQU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B13610E10A
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Sep 2024 13:25:01 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-53661a131b4so3648068e87.1
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Sep 2024 06:25:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1725974699; x=1726579499;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=eGZtZlbcVTuqfHipICSHcU4nVCOOqo16078EY8ojHwg=;
 b=ml6PPGQUvmhkzzEXynerFGDXDKndTO6i+9vA/rtjEfZFXGRwMsPGqppmTRuSbpzgHj
 twdGUumHyctjXcGsoZglCr/S5fxsYJuJOWV2D8xC0WYr9M8oBZm4erfi4wLW+gDqCQe0
 G66/fzYXZa82XQGG5ScU7gFaxBVPOfHQAZp+4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725974699; x=1726579499;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=eGZtZlbcVTuqfHipICSHcU4nVCOOqo16078EY8ojHwg=;
 b=VOxQQ6yCcILdWlUYL8GzH65xOZ0AhweT26Jx4v85Ng3q39yYVr5F0PLfFdWXAUXSAi
 zQv412aCwTRx4aUbMLKUObTGbvx3uUbKHqkS+ivJjILCNvsW+OLr3L2BOa0YXZ2Jo5Wn
 szeO0IFYj/tpGk6quVP0Su+XOonK5p2e7yr+xqTL3+ZCUpinQCkNiMnt36NKP+E5+h2Q
 DQLc307qXtLZbQGbEd/0EXPZeQX2gbuQ7KtWgJVT5MbQNbT+axZvTo9xSuzP9cQzA5yS
 n+s/hSd7Dw14uKQBkpGsb7kt/SSjQhnDOuw06knMW0zXfpY6F6CBu5XsbfWiFOOaSD0C
 yPoA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXKuzrGR7SSLx3WgnV7LWXbv0qwCn2xOO98TTwB+n4FgrW92ABxYKvf8jaMi6JjCHaxOyv++TIwXYU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzY1xxzh2NWvfe+dv1ItcXoDuEaGFJcqswfyokjfBfZN0mHtdLI
 m7Sefr3cXjjzt2RXt+Fbqk/nfc6Uwe9kRB1ao8EdgByqq9QDw6jJYST7Z5ZH9nw=
X-Google-Smtp-Source: AGHT+IHsmFPtrT1rSIk5RiTefYRMq3ghTe9BDIFfC44mu3CVeXviOQJGEyxWNRFR0JE7b31QmsEJrw==
X-Received: by 2002:a05:6512:1283:b0:533:4820:275a with SMTP id
 2adb3069b0e04-536588130c0mr11624002e87.52.1725974699152; 
 Tue, 10 Sep 2024 06:24:59 -0700 (PDT)
Received: from andrea-amarula.homenet.telecomitalia.it ([95.236.207.79])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c3ebd76ef0sm4274900a12.63.2024.09.10.06.24.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Sep 2024 06:24:58 -0700 (PDT)
From: Andrea Calabrese <andrea.calabrese@amarulasolutions.com>
To: gregkh@linuxfoundation.org, rafael@kernel.org,
 dri-devel@lists.freedesktop.org, l.stach@pengutronix.de
Cc: trivial@kernel.org, linux-amarula@amarulasolutions.com,
 andrea.calabrese@amarulasolutions.com
Subject: [RESEND PATCH v4] devres: Refactor using guards
Date: Tue, 10 Sep 2024 15:15:21 +0200
Message-ID: <20240910131520.150610-2-andrea.calabrese@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
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
Diff from V3: as Greg KH and Lucas Stach noticed, there was a
behavioural change between the two versions: I used guard(spinlock),
while the expected behaviour should have come from a spinlock_irqsave
guard. This has been fixed.

diff --git a/drivers/base/devres.c b/drivers/base/devres.c
index 3df0025d12aa..4872756426dd 100644
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
+	guard(spinlock_irqsave)(&dev->devres_lock);
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
+	guard(spinlock_irqsave)(&dev->devres_lock);
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
+	guard(spinlock_irqsave)(&dev->devres_lock);
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
+	scoped_guard(spinlock_irqsave, &dev->devres_lock) {
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
+	scoped_guard(spinlock_irqsave, &dev->devres_lock) {
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
+	scoped_guard(spinlock_irqsave, &dev->devres_lock) {
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
+	guard(spinlock_irqsave)(&dev->devres_lock);
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
+	guard(spinlock_irqsave)(&dev->devres_lock);
 
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
+	scoped_guard(spinlock_irqsave, &dev->devres_lock) {
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
+	guard(spinlock_irqsave)(&dev->devres_lock);
 
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
+	scoped_guard(spinlock_irqsave, &dev->devres_lock) {
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

