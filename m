Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69CFC8FE5BC
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jun 2024 13:47:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 099E310E911;
	Thu,  6 Jun 2024 11:47:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="NlmD6fyT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com
 [209.85.218.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71E4910E7B1
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jun 2024 09:18:11 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id
 a640c23a62f3a-a63359aaacaso107203866b.1
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Jun 2024 02:18:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1717665489; x=1718270289;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=DGCDNuV5Wxf1msp9DdaUofsh3V4TE8UdX3IrHzhfbR4=;
 b=NlmD6fyTWgJH270OAeZztnpRC5yob381q/1Wv9YLtuYOtnjW57jE2LAvsf7a3B6+kZ
 5bP14uQZ6o5erB+vXlyg+bb9mpxeNVE9uuTGBCKC7VbxUF1pmguDhlMPywy49hSlO8cD
 dAQV9d/VAFCPd7Cia+HvcUDAqJ1f99RO7Z2PU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717665489; x=1718270289;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DGCDNuV5Wxf1msp9DdaUofsh3V4TE8UdX3IrHzhfbR4=;
 b=Et/OeoxteESWrLMhALA0NgssYrSUWnoOzIFwW+KRvvOY4hpUPHsW9nCLVfGRYS0jcI
 0FvliNoArUuTLeDeJb+rxeL8J8R3AH/UAdKkxLUzmrEkNY2BRHCrKpLj/vf8KpSA9RmI
 UY1WxW4445+nW9VWSUiz8oaYaOhfKOrFBN36aJ+atoiuaSs8My7b65grInl4LRCmczp0
 M0sUBNOPIGmQL9wrG2HXVQX3RW3PLc2UOgpZWV364IBWUgJWz2cHEYIEsgqz7cbxUCy9
 U1QO9u/vmRsXHYIll2kNopIlojUo5DSvApfL9b1fQ5y3Ydzx4iQJwRFga+eFvzS2ha8b
 iTLg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXEUS1Kwado5EN5kkPIcjedFTVmXIPVP8Wfu7t6+/JU2XWEk5ojAUTARuSY3uT5tGK7x7U8C4I4nJ+IgB5Kv9khhKYgUU1ZiD865qSBF4ot
X-Gm-Message-State: AOJu0Yzmsd6LvjwNbbEwJrJQvsBt2Ka62x7OsZqlkIHRNPXiP+Juky+J
 h8asCFNUge4mmoixDS/N4sCQmIvmEP/9+QB41l5MpDlWpoxXpFLri+k/INCtxvQ=
X-Google-Smtp-Source: AGHT+IEH2AC9zY4ib65UyD7r8TfXIZYfgksCLJm27SmgT2qJSM+rX5/rm2vSje8lz38uXvUDvMc+YA==
X-Received: by 2002:a17:906:38d1:b0:a5a:1562:518c with SMTP id
 a640c23a62f3a-a69a02363f3mr302062566b.48.1717665489344; 
 Thu, 06 Jun 2024 02:18:09 -0700 (PDT)
Received: from andrea-amarula.ipgroup.local (212-57-59-66.xdsl.deanconnect.nl.
 [212.57.59.66]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6c80581716sm69673866b.19.2024.06.06.02.18.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Jun 2024 02:18:09 -0700 (PDT)
From: Andrea Calabrese <andrea.calabrese@amarulasolutions.com>
To: regkh@linuxfoundation.org, rafael@kernel.org,
 dri-devel@lists.freedesktop.org
Cc: trivial@kernel.org, linux-amarula@amarulasolutions.com,
 andrea.calabrese@amarulasolutions.com
Subject: [PATCH] drivers/base/devres.c: refactor using guards
Date: Thu,  6 Jun 2024 11:17:44 +0200
Message-Id: <20240606091744.1115656-1-andrea.calabrese@amarulasolutions.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 06 Jun 2024 11:47:05 +0000
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

Refactored devres.c using lock guards and scoped locks.
Changed functions:
- devres_for_each_res
- devres_add
- devres_find
- devres_get
- devres_remove
- release_nodes
- release_all
- devres_open_group
- find_group
- devres_remove_group
- devres_release_group
- devm_krealloc

Signed-off-by: Andrea Calabrese <andrea.calabrese@amarulasolutions.com>

diff --git a/drivers/base/devres.c b/drivers/base/devres.c
index 3df0025d12aa..8f72426ac0b6 100644
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
@@ -318,16 +310,15 @@ void * devres_get(struct device *dev, void *new_res,
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
+	{
+		guard(spinlock)(&dev->devres_lock);
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
@@ -353,15 +344,20 @@ void * devres_remove(struct device *dev, dr_release_t release,
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
+	}
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
@@ -516,7 +512,6 @@ static void release_nodes(struct device *dev, struct list_head *todo)
  */
 int devres_release_all(struct device *dev)
 {
-	unsigned long flags;
 	LIST_HEAD(todo);
 	int cnt;
 
@@ -528,9 +523,9 @@ int devres_release_all(struct device *dev)
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
@@ -552,7 +547,6 @@ int devres_release_all(struct device *dev)
 void * devres_open_group(struct device *dev, void *id, gfp_t gfp)
 {
 	struct devres_group *grp;
-	unsigned long flags;
 
 	grp = kmalloc(sizeof(*grp), gfp);
 	if (unlikely(!grp))
@@ -568,9 +562,8 @@ void * devres_open_group(struct device *dev, void *id, gfp_t gfp)
 	if (id)
 		grp->id = id;
 
-	spin_lock_irqsave(&dev->devres_lock, flags);
+	guard(spinlock)(&dev->devres_lock);
 	add_dr(dev, &grp->node[0]);
-	spin_unlock_irqrestore(&dev->devres_lock, flags);
 	return grp->id;
 }
 EXPORT_SYMBOL_GPL(devres_open_group);
@@ -609,17 +602,14 @@ static struct devres_group * find_group(struct device *dev, void *id)
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
 
@@ -635,19 +625,16 @@ EXPORT_SYMBOL_GPL(devres_close_group);
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
@@ -668,11 +655,10 @@ EXPORT_SYMBOL_GPL(devres_remove_group);
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
@@ -683,12 +669,9 @@ int devres_release_group(struct device *dev, void *id)
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
@@ -860,7 +843,6 @@ void *devm_krealloc(struct device *dev, void *ptr, size_t new_size, gfp_t gfp)
 {
 	size_t total_new_size, total_old_size;
 	struct devres *old_dr, *new_dr;
-	unsigned long flags;
 
 	if (unlikely(!new_size)) {
 		devm_kfree(dev, ptr);
@@ -906,20 +888,17 @@ void *devm_krealloc(struct device *dev, void *ptr, size_t new_size, gfp_t gfp)
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

