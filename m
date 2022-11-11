Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4936862646C
	for <lists+dri-devel@lfdr.de>; Fri, 11 Nov 2022 23:18:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04A4110E8DB;
	Fri, 11 Nov 2022 22:17:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com
 [IPv6:2607:f8b0:4864:20::d2e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 317E110E1D8;
 Fri, 11 Nov 2022 22:17:33 +0000 (UTC)
Received: by mail-io1-xd2e.google.com with SMTP id r81so4554826iod.2;
 Fri, 11 Nov 2022 14:17:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=F1nnNzLyOQaNdQjTSelqCaCQVWgchkSOBQNAWoookCY=;
 b=R/dmMJSnvo3JvYhowpvogSf5QpEl7v8YF8JAaIjOpQTvTDoTOrApegwux3Yoq0y0n+
 0gS++fqHKvaUSpqewyoQzZpzvaL+eyLTj5qAAGQIp3Z9Kbw+dowLRc43YwpLCD2QljKg
 +ZoWes4dlStEdNF9tZUDLaCmN56saFjWJsFsBdLh0tIaBJue3Q/lvB5ib2nRfXLCrnGr
 dwnd3tMfpkQp0GvWQoeqOvw1WwQAaQww9QNGuJDKXI28EqgJtsArYSTT4MKuQZSN8GYX
 LSDmpzv1cAypRKvlGUtFtpIyFe8/qf2sHahZdyP0A6lqzy+5cwizjBZ2RkCoVYSWRs0G
 /4lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=F1nnNzLyOQaNdQjTSelqCaCQVWgchkSOBQNAWoookCY=;
 b=wCoiG9WEoPdk9J2DWeswyYfYRNQRUg0W9MhwuvO3TUPYJ0ZAV1f+KzjcQKdiL8ERD7
 kGtoKskWb/8BV2drSQoO3xrp/HtO/K02KsJ3F+iRcvXQ+HryxOOqiuEJN6EWV55tKyMH
 gKS02vA4rx3/w8lWzmnIzGZlQwzRY/V1COurMUT+NxUl0wJGG/6sJv2B7ntcO4ZHcFru
 nHULu4puL4z5BmMWzz5xhCgE9M/NJ6ePRG6P6vqJ49+tJGGUTqecJFwVFm09ICIhJbcZ
 IjNuUyX7Tp9MG8h9KwHIfU/ceOkdhmqZ2X1xK/QVCcRwsRBSJu0vv9bYosECJcojY+8C
 NH/Q==
X-Gm-Message-State: ANoB5pmvv6YjJD9/FHGpDDYgZAVZ5gG9u34YyqGjoujGcx8ZpQ7KNLCd
 yg8aGedN3IElYkJiUfwFlE8=
X-Google-Smtp-Source: AA0mqf7/uebvjHaXzOuR9KmBtqEyWpoBDGuBq7hNs4k6T6ENKCAlbBhTg518gBmwcglR002h5YjB0g==
X-Received: by 2002:a05:6638:3e90:b0:370:a45d:f2e4 with SMTP id
 ch16-20020a0566383e9000b00370a45df2e4mr1701464jab.268.1668205052026; 
 Fri, 11 Nov 2022 14:17:32 -0800 (PST)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 c5-20020a928e05000000b002f611806ae9sm1113457ild.60.2022.11.11.14.17.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Nov 2022 14:17:31 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, gregkh@linuxfoundation.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 7/7] dyndbg: replace classmap list with a vector
Date: Fri, 11 Nov 2022 15:17:15 -0700
Message-Id: <20221111221715.563020-8-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221111221715.563020-1-jim.cromie@gmail.com>
References: <20220912052852.1123868-1-jim.cromie@gmail.com>
 <20221111221715.563020-1-jim.cromie@gmail.com>
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
Cc: daniel.vetter@ffwll.ch, linux@rasmusvillemoes.dk, seanpaul@chromium.org,
 joe@perches.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Classmaps are stored/linked in a section/array, but are each added to
the module's ddebug_table.maps list-head.

This is unnecessary; even when ddebug_attach_classmap() is handling
the builtin section (with classmaps for multiple builtin modules), its
contents are ordered, so a module's possibly multiple classmaps will
be consecutive in the section, and could be treated as a vector/block,
since both start-addy and subrange length are in the ddebug_info arg.

So this changes:

struct ddebug_table gets: classes for the start-addy, num_classes for
the length (placed to improve struct packing).

The loading: in ddebug_attach_module_classes(), replace the
for-the-modname list-add loop, with a forloop that finds the module's
subrange (start,length) of matching classmaps within the possibly
builtin classmaps vector, and saves those to the ddebug_table.

The reading/using: change list-foreach loops in ddebug_class_name() &
ddebug_find_valid_class() to walk the array from start to length.

Also move #define __outvar up, above an added use in a fn-prototype.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 lib/dynamic_debug.c | 61 ++++++++++++++++++++++++---------------------
 1 file changed, 32 insertions(+), 29 deletions(-)

diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index 48ca1387a409..fd5296dbb40f 100644
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
@@ -146,13 +147,15 @@ static void vpr_info_dq(const struct ddebug_query *query, const char *msg)
 		  query->first_lineno, query->last_lineno, query->class_string);
 }
 
+#define __outvar /* filled by callee */
 static struct ddebug_class_map *ddebug_find_valid_class(struct ddebug_table const *dt,
-							  const char *class_string, int *class_id)
+							const char *class_string,
+							__outvar int *class_id)
 {
 	struct ddebug_class_map *map;
-	int idx;
+	int i, idx;
 
-	list_for_each_entry(map, &dt->maps, link) {
+	for (map = dt->classes, i = 0; i < dt->num_classes; i++, map++) {
 		idx = match_string(map->class_names, map->length, class_string);
 		if (idx >= 0) {
 			*class_id = idx + map->base;
@@ -163,7 +166,6 @@ static struct ddebug_class_map *ddebug_find_valid_class(struct ddebug_table cons
 	return NULL;
 }
 
-#define __outvar /* filled by callee */
 /*
  * Search the tables for _ddebug's which match the given `query' and
  * apply the `flags' and `mask' to them.  Returns number of matching
@@ -1109,9 +1111,10 @@ static void *ddebug_proc_next(struct seq_file *m, void *p, loff_t *pos)
 
 static const char *ddebug_class_name(struct ddebug_iter *iter, struct _ddebug *dp)
 {
-	struct ddebug_class_map *map;
+	struct ddebug_class_map *map = iter->table->classes;
+	int i, nc = iter->table->num_classes;
 
-	list_for_each_entry(map, &iter->table->maps, link)
+	for (i = 0; i < nc; i++, map++)
 		if (class_in_range(dp->class_id, map))
 			return map->class_names[dp->class_id - map->base];
 
@@ -1195,30 +1198,31 @@ static const struct proc_ops proc_fops = {
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
@@ -1252,10 +1256,9 @@ static int __ddebug_add_module(struct _ddebug_info *di, unsigned int base,
 	dt->num_ddebugs = di->num_descs;
 
 	INIT_LIST_HEAD(&dt->link);
-	INIT_LIST_HEAD(&dt->maps);
 
 	if (di->classes && di->num_classes)
-		ddebug_attach_module_classes(dt, di->classes, di->num_classes);
+		ddebug_attach_module_classes(dt, di);
 
 	mutex_lock(&ddebug_lock);
 	list_add_tail(&dt->link, &ddebug_tables);
@@ -1344,8 +1347,8 @@ static void ddebug_remove_all_tables(void)
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
2.38.1

