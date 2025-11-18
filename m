Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CEEEC6B8F7
	for <lists+dri-devel@lfdr.de>; Tue, 18 Nov 2025 21:19:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C128610E522;
	Tue, 18 Nov 2025 20:19:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="LXRWdGWp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f54.google.com (mail-io1-f54.google.com
 [209.85.166.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C10E310E51A
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 20:19:15 +0000 (UTC)
Received: by mail-io1-f54.google.com with SMTP id
 ca18e2360f4ac-9490c3ac6ebso74893539f.2
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 12:19:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763497155; x=1764101955; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sinG7VNY3wU1UNNZMH5t/yVFvlHMG8pS2a7wiUGdlB8=;
 b=LXRWdGWpMPPp3V5L+ojbm0+F8fk/6P6Ul6+jiHVV4VdNhZlpYITqT+fHcEDJmP3fmv
 zIV/YPXLUykCZhDZO622Yfel+YlGKOqM1SqnH7CY/mZmmEdGDg7mBo8cM0qke3uQaId7
 FwdTc9XO85DqQFQuHLwXyEspcM2qOlpwFcw/0g8NOHVUJHUVLphh9Xk3ZfVuQ8AvtqdO
 i05UCwWShZqqlOhwMtEkH1fjV3fBWlViMn+SsBRFeL8UoI+p6iWmdAI+0vcby6d/In5c
 3ZXpqlvtoCq/JJ2xEOgkK7vCb9H9pXbVFQjtmKeFY5RBePqlzTpC9n0yNr74cL0cZqx3
 oPcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763497155; x=1764101955;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=sinG7VNY3wU1UNNZMH5t/yVFvlHMG8pS2a7wiUGdlB8=;
 b=Bk7h0ZqLCF1kvw5z6PZ8uyNEFQvHKC3Hkss+es5G5F4eU6P/g7C6iTmQPt+/vp693w
 hc0Wko+FU2jF2e7muo0jrQhGH3p9Kwgbj/HjwKHTwPWL1K/mp7DXRDI0kskEJoVNpvMb
 hxhJ0K1JUwtwwWFwUIO0X3JYAnqj/IYx8aMw8pKYHGyZSHi6+xXqadpP/3VitYMTVQBM
 8z+wevMFFCJBZuSRyt8KkkHsaKw1KWKx0OAbAh5NtAWpDyY/tE8yksLGmCVpGfrThZyd
 qAXvbS11dV2bPUytaB4D1Bv71BS9YXLyFQxSlcW/H8ljB+5wU6++m+Jc2OsuAI704zcP
 2X3A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWDMMUpDG89zpA81Z+DOMAmgySXymEHu+5pOsXoKthvPrnZajJrYCYiuJSDuN5ABoPYquBHVh4EJmk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzNlBvXZnZNa4SGk0P1ckEzLMRxKNdZ8HZSP9XEnpxEZNoajQIS
 +4y4IV7uuRI/U+8VlCaW9vKVxlzpKpDll8m+H1pABAAX9q+6aRqqFagMzSyFExwm
X-Gm-Gg: ASbGncunFz/pw40cGXRUU/tOuvI/kOldCZwfPXW8WhaZ/7VyIUYBgeb34eoVdtKyCMV
 4DmS2sp+YUoVv52D5eO0iz3PA60FcCWsWJygK2/rKx/sWQtf2m7CeQdCceRdJzuT5FJhIwqmDm4
 K2QG+z7vaEQPZb8t+tPEV6mwZ71y3mVpBKV6RnUbM8BkisJyMzM6jrNNAQs8L2ZTyRX3o5K5JfI
 DCRBDUXDcWVcptyNGYWSHsyWctwpY6jjMHIKAYLrsyeJq8tjHiYRl0uMc9f6CMSH9adC5EicNnZ
 kHLzZ+Ed4sHw/EmFYRxaCXkycDqDVJSyG3sp7L7EFXfhy1ctrfkjDU+DlVBcVragocmIxWkUSh7
 T03XlOSk51zZ0RXIlHqrMp1Ycx/T1e5ihSHy4f3N79ZjcBK/ifx+OszT2HutgEfQaN/R7VDuAwu
 6anod7/+EyxD5dRMyjIAhr7yWxJ7XZLQ/qWyU1bSvq3TY+BrhEcxdHDlkHuguGcmdcnnyamY4X1
 xL4nw==
X-Google-Smtp-Source: AGHT+IGLH8MW7sVNPOn75BPqpruphqjyrqoEjIYIdZ9n/nXMEfVigTO8hiXOfgareRNrHy3bHEKarw==
X-Received: by 2002:a05:6602:1551:b0:949:f77:4231 with SMTP id
 ca18e2360f4ac-9490f7747a1mr751322939f.3.1763497154983; 
 Tue, 18 Nov 2025 12:19:14 -0800 (PST)
Received: from godzilla.raven-morpho.ts.net
 (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
 by smtp.googlemail.com with ESMTPSA id
 ca18e2360f4ac-948fd4c273bsm419823939f.18.2025.11.18.12.19.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Nov 2025 12:19:14 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 gregkh@linuxfoundation.org, jbaron@akamai.com
Cc: ukaszb@chromium.org, louis.chauvet@bootlin.com,
 Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v6 13/31] dyndbg: replace classmap list with a vector
Date: Tue, 18 Nov 2025 13:18:23 -0700
Message-ID: <20251118201842.1447666-14-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251118201842.1447666-1-jim.cromie@gmail.com>
References: <20251118201842.1447666-1-jim.cromie@gmail.com>
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

Classmaps are stored in an elf section/array, but currently are
individually list-linked onto dyndbg's per-module ddebug_table for
operation. This is unnecessary.

Just like dyndbg's descriptors, classes are packed in compile order;
so even with many builtin modules employing multiple classmaps, each
modules' maps are packed contiguously, and can be treated as a
array-start-address & array-length.

So this drops the whole list building operation done in
ddebug_attach_module_classes(), and removes the list-head members.
The "select-by-modname" condition is reused to find the start,end of
the subrange.

NOTE: This "filter-by-modname" on classmaps should really be done in
ddebug_add_module(1); ie at least one step closer to ddebug_init(2),
which already splits up pr-debug descriptors into subranges by
modname, then calls (1) on each.  (2) knows nothing of classmaps
currently, and doesn't need to.  For now, just add comment.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
v3- drop __outvar as promising magic it doesnt have
---
 include/linux/dynamic_debug.h |  1 -
 lib/dynamic_debug.c           | 62 ++++++++++++++++++-----------------
 2 files changed, 32 insertions(+), 31 deletions(-)

diff --git a/include/linux/dynamic_debug.h b/include/linux/dynamic_debug.h
index c4ae79f934d9..51ed26e42032 100644
--- a/include/linux/dynamic_debug.h
+++ b/include/linux/dynamic_debug.h
@@ -83,7 +83,6 @@ enum class_map_type {
 };
 
 struct ddebug_class_map {
-	struct list_head link;
 	struct module *mod;
 	const char *mod_name;	/* needed for builtins */
 	const char **class_names;
diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index db0559763e60..e882e951d585 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -45,10 +45,11 @@ extern struct ddebug_class_map __start___dyndbg_classes[];
 extern struct ddebug_class_map __stop___dyndbg_classes[];
 
 struct ddebug_table {
-	struct list_head link, maps;
+	struct list_head link;
 	const char *mod_name;
-	unsigned int num_ddebugs;
 	struct _ddebug *ddebugs;
+	struct ddebug_class_map *classes;
+	unsigned int num_ddebugs, num_classes;
 };
 
 struct ddebug_query {
@@ -148,12 +149,13 @@ static void vpr_info_dq(const struct ddebug_query *query, const char *msg)
 }
 
 static struct ddebug_class_map *ddebug_find_valid_class(struct ddebug_table const *dt,
-							  const char *class_string, int *class_id)
+							const char *class_string,
+							int *class_id)
 {
 	struct ddebug_class_map *map;
-	int idx;
+	int i, idx;
 
-	list_for_each_entry(map, &dt->maps, link) {
+	for (map = dt->classes, i = 0; i < dt->num_classes; i++, map++) {
 		idx = match_string(map->class_names, map->length, class_string);
 		if (idx >= 0) {
 			*class_id = idx + map->base;
@@ -164,7 +166,6 @@ static struct ddebug_class_map *ddebug_find_valid_class(struct ddebug_table cons
 	return NULL;
 }
 
-#define __outvar /* filled by callee */
 /*
  * Search the tables for _ddebug's which match the given `query' and
  * apply the `flags' and `mask' to them.  Returns number of matching
@@ -226,7 +227,7 @@ static int ddebug_change(const struct ddebug_query *query,
 	unsigned int nfound = 0;
 	struct flagsbuf fbuf, nbuf;
 	struct ddebug_class_map *map = NULL;
-	int __outvar valid_class;
+	int valid_class;
 
 	/* search for matching ddebugs */
 	mutex_lock(&ddebug_lock);
@@ -1133,9 +1134,10 @@ static void *ddebug_proc_next(struct seq_file *m, void *p, loff_t *pos)
 
 static const char *ddebug_class_name(struct ddebug_iter *iter, struct _ddebug *dp)
 {
-	struct ddebug_class_map *map;
+	struct ddebug_class_map *map = iter->table->classes;
+	int i, nc = iter->table->num_classes;
 
-	list_for_each_entry(map, &iter->table->maps, link)
+	for (i = 0; i < nc; i++, map++)
 		if (class_in_range(dp->class_id, map))
 			return map->class_names[dp->class_id - map->base];
 
@@ -1219,30 +1221,31 @@ static const struct proc_ops proc_fops = {
 	.proc_write = ddebug_proc_write
 };
 
-static void ddebug_attach_module_classes(struct ddebug_table *dt,
-					 struct ddebug_class_map *classes,
-					 int num_classes)
+static void ddebug_attach_module_classes(struct ddebug_table *dt, struct _ddebug_info *di)
 {
 	struct ddebug_class_map *cm;
-	int i, j, ct = 0;
+	int i, nc = 0;
 
-	for (cm = classes, i = 0; i < num_classes; i++, cm++) {
+	/*
+	 * Find this module's classmaps in a subrange/wholerange of
+	 * the builtin/modular classmap vector/section.  Save the start
+	 * and length of the subrange at its edges.
+	 */
+	for (cm = di->classes, i = 0; i < di->num_classes; i++, cm++) {
 
 		if (!strcmp(cm->mod_name, dt->mod_name)) {
-
-			v2pr_info("class[%d]: module:%s base:%d len:%d ty:%d\n", i,
-				  cm->mod_name, cm->base, cm->length, cm->map_type);
-
-			for (j = 0; j < cm->length; j++)
-				v3pr_info(" %d: %d %s\n", j + cm->base, j,
-					  cm->class_names[j]);
-
-			list_add(&cm->link, &dt->maps);
-			ct++;
+			if (!nc) {
+				v2pr_info("start subrange, class[%d]: module:%s base:%d len:%d ty:%d\n",
+					  i, cm->mod_name, cm->base, cm->length, cm->map_type);
+				dt->classes = cm;
+			}
+			nc++;
 		}
 	}
-	if (ct)
-		vpr_info("module:%s attached %d classes\n", dt->mod_name, ct);
+	if (nc) {
+		dt->num_classes = nc;
+		vpr_info("module:%s attached %d classes\n", dt->mod_name, nc);
+	}
 }
 
 /*
@@ -1274,10 +1277,9 @@ static int ddebug_add_module(struct _ddebug_info *di, const char *modname)
 	dt->num_ddebugs = di->num_descs;
 
 	INIT_LIST_HEAD(&dt->link);
-	INIT_LIST_HEAD(&dt->maps);
 
 	if (di->classes && di->num_classes)
-		ddebug_attach_module_classes(dt, di->classes, di->num_classes);
+		ddebug_attach_module_classes(dt, di);
 
 	mutex_lock(&ddebug_lock);
 	list_add_tail(&dt->link, &ddebug_tables);
@@ -1390,8 +1392,8 @@ static void ddebug_remove_all_tables(void)
 	mutex_lock(&ddebug_lock);
 	while (!list_empty(&ddebug_tables)) {
 		struct ddebug_table *dt = list_entry(ddebug_tables.next,
-						      struct ddebug_table,
-						      link);
+						     struct ddebug_table,
+						     link);
 		ddebug_table_free(dt);
 	}
 	mutex_unlock(&ddebug_lock);
-- 
2.51.1

