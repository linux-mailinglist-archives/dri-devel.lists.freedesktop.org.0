Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8359FA79409
	for <lists+dri-devel@lfdr.de>; Wed,  2 Apr 2025 19:42:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9E8610E888;
	Wed,  2 Apr 2025 17:42:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="gul6b28O";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f179.google.com (mail-il1-f179.google.com
 [209.85.166.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33AB010E87F;
 Wed,  2 Apr 2025 17:42:25 +0000 (UTC)
Received: by mail-il1-f179.google.com with SMTP id
 e9e14a558f8ab-3d589227978so261355ab.1; 
 Wed, 02 Apr 2025 10:42:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1743615744; x=1744220544; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=d71I99XtVy4797+iIGr5U+qSA7ZenkLyXc4Q7GcfPmk=;
 b=gul6b28OkrxpnLUYliQCqmvwCZyMHPsCFaS/WclAi6ayqByibZUi3xQ/rLNiFoAOvo
 jcN30jndmP+6LyHnfKmMGO6Ydu9ZcwHoZQOaL3L980Z1P1H953t2vX8WMudh3EOi2A8Y
 hJTum13kI2gOctbcLBCntSfarVPpYOmztqXP7CQZ6IpNv2+0e/rQprsjzbIcIW1ytjCA
 M2uHrrnzX55BEl8wz3PbHUB5bOLd9onum4QRWTugXJed5uHs6oGJDfYFjAG1mNbMeFUP
 d4SqvH14/t9JLW5iG6bGG/Pij67V5vO/C9FxKHziyORyVvU2yc77RiBeykovhgTTErBt
 pOgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743615744; x=1744220544;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=d71I99XtVy4797+iIGr5U+qSA7ZenkLyXc4Q7GcfPmk=;
 b=UZUCsdiVGZvEFe515283l8P/7f1A5bnbs/DEVP+cu/JoolbReVHwEURbryzNfweixJ
 Mjj1PY74kqLWFIkjs9fO8QOCoLdptWK1py4uZgFB2oJLqXMyjJ4gFdeFRV1XyUKc0La4
 PrH0SSLU/D1BhS3HWp2SltaDtylCubyfgInBfdySSyEBgb2LN9MP0xEpvHxwWnuoV1sD
 wbYXYVNKda6zBUeGDE2Zz5aDKt2PRmrXbLKDP87fgUkMFwn3aJqfBWqSEtcA+dsDs1vF
 +0pRBa1PGR0AzRIlS2/ct0qP31CaLOAQDcz4LVgh/WmwYmxiY77PE2zDPeUAHaE7vG2W
 iACw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUBC5vQPHF5CmIOq8BHDE0+VNGOikvWcsBdTHjIwLrM1co+CDfxlfWGMiEfp4zye4RUV+xDWsqhRoT/UAlVeQ==@lists.freedesktop.org,
 AJvYcCUUK144vITOaGIbR6xH9gS4qI20cNYiYg5r48kCEKDLdlHIencPCJz3vw2xFmLkmu/vEcNCsxqk@lists.freedesktop.org,
 AJvYcCWOCXBkBWXC7We8YTCssfMFhh5ZoaOKWNpfUj1Byn1Lsh9l/ri07D/2j2rSjF0UnkQ1QyvNuWXKkVng@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz9yfKclq9p/TQhPJ+KQSO7vb49Z0T5rW0qvWbvy1tBFaZlKmZx
 MRyhgPFZunc1GW/zcaSavJDKH5uF5crOYeLabqgkePlKlZBp54T4
X-Gm-Gg: ASbGnctH7ASZuw8ekqxOSf+ZXju4a9M+sAiTNJbB1dHi3D3a6hfJhKi1bj3FAPNMhNs
 hMz20NfzjBhUdqCjsB2aGIDRUKMJU8Niqe0cFot8uiBkZbE4ZrAP8H8g/EFEDNyhlwUWLTfIDQp
 D70nZn0Jh4CJUCcT7PzFDzJQt2K669hRVX4u92OjYmOnqrrFR39Cs5HRy9+EhGT0koZjXFQtOtJ
 i0Z6id2xpajAYtEtTWsd31ENQu6Whv22N3uXVufzc2o6rXq/DglckqKVQbKBuI2IjWTEGYiEE18
 R0MOrIXFz0erZ9wJm9DXLdckDTsxsjrKKeUxtu7qNUxLGXbVF3SXI5pPQ/MOllLwKQeqDxioPRJ
 OYQ==
X-Google-Smtp-Source: AGHT+IG+gSa1soX7/vjnYhv/X0CCHTfdsDvGdVc4Ac6El3VHxHpzKXqSuveJpX56mj/w47JbZdEjVQ==
X-Received: by 2002:a05:6e02:2148:b0:3d3:f15e:8e23 with SMTP id
 e9e14a558f8ab-3d6dcbc59d4mr6812745ab.10.1743615744434; 
 Wed, 02 Apr 2025 10:42:24 -0700 (PDT)
Received: from gandalf.. (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
 by smtp.googlemail.com with ESMTPSA id
 e9e14a558f8ab-3d5d5af8369sm33439725ab.71.2025.04.02.10.42.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Apr 2025 10:42:24 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, gregkh@linuxfoundation.org, ukaszb@chromium.org,
 louis.chauvet@bootlin.com, linux-kernel@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 daniel.vetter@ffwll.ch, tvrtko.ursulin@linux.intel.com,
 jani.nikula@intel.com, ville.syrjala@linux.intel.com,
 Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v3 11/54] dyndbg: replace classmap list with a vector
Date: Wed,  2 Apr 2025 11:41:13 -0600
Message-ID: <20250402174156.1246171-12-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250402174156.1246171-1-jim.cromie@gmail.com>
References: <20250402174156.1246171-1-jim.cromie@gmail.com>
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
index ac199293d203..e458d4b838ac 100644
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
index 621e04b1f28c..85b8d32742ec 100644
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
@@ -180,7 +181,7 @@ static int ddebug_change(const struct ddebug_query *query,
 	unsigned int nfound = 0;
 	struct flagsbuf fbuf, nbuf;
 	struct ddebug_class_map *map = NULL;
-	int __outvar valid_class;
+	int valid_class;
 
 	/* search for matching ddebugs */
 	mutex_lock(&ddebug_lock);
@@ -1122,9 +1123,10 @@ static void *ddebug_proc_next(struct seq_file *m, void *p, loff_t *pos)
 
 static const char *ddebug_class_name(struct ddebug_iter *iter, struct _ddebug *dp)
 {
-	struct ddebug_class_map *map;
+	struct ddebug_class_map *map = iter->table->classes;
+	int i, nc = iter->table->num_classes;
 
-	list_for_each_entry(map, &iter->table->maps, link)
+	for (i = 0; i < nc; i++, map++)
 		if (class_in_range(dp->class_id, map))
 			return map->class_names[dp->class_id - map->base];
 
@@ -1208,30 +1210,31 @@ static const struct proc_ops proc_fops = {
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
@@ -1263,10 +1266,9 @@ static int ddebug_add_module(struct _ddebug_info *di, const char *modname)
 	dt->num_ddebugs = di->num_descs;
 
 	INIT_LIST_HEAD(&dt->link);
-	INIT_LIST_HEAD(&dt->maps);
 
 	if (di->classes && di->num_classes)
-		ddebug_attach_module_classes(dt, di->classes, di->num_classes);
+		ddebug_attach_module_classes(dt, di);
 
 	mutex_lock(&ddebug_lock);
 	list_add_tail(&dt->link, &ddebug_tables);
@@ -1379,8 +1381,8 @@ static void ddebug_remove_all_tables(void)
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
2.49.0

