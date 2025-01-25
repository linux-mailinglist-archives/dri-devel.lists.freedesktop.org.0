Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71326A1C141
	for <lists+dri-devel@lfdr.de>; Sat, 25 Jan 2025 07:46:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C270810E288;
	Sat, 25 Jan 2025 06:46:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="mpHCCYVs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f177.google.com (mail-il1-f177.google.com
 [209.85.166.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DD1D10E29F;
 Sat, 25 Jan 2025 06:46:43 +0000 (UTC)
Received: by mail-il1-f177.google.com with SMTP id
 e9e14a558f8ab-3cfc79a8a95so4738005ab.2; 
 Fri, 24 Jan 2025 22:46:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737787603; x=1738392403; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sV/JSNgUN2kOhspoJIscYn3MOHKykltv8W9GFMXLDKA=;
 b=mpHCCYVsEwG+0tLFm6iuPVTVoLsFRlfEzQdFGWeIEodk0KkgSWHux/9tLocfDOcmef
 rssxNulKNe/FmOaBhl4L/X0pGWhAf+1rvvb8wi2gx5H1ON8j6rrcP0w+0YhwQwl01H08
 obRpvPKEp2iYO5hz9ojXQNpqthLyLr+LCNHNut3usIJyMfHzWQuFWXNkG2b1vOYI3Zw1
 Q+OYdTchTy5ojt8wJOUlIarU21xuT6y/bby3++MUzHBgYemq6sz/L94EIP2NG9pJioS9
 72H/UrMqMKl8H1gYHbFhFZHHFWGet71ORMrkp5ikp10y0pgSYzgl4bsVSM3kKBM3OGli
 lkmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737787603; x=1738392403;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sV/JSNgUN2kOhspoJIscYn3MOHKykltv8W9GFMXLDKA=;
 b=G6Laa9Qxzs/il7SwtSqRS2m41umKk8B5lqtpPjf3P9MHvPCo2c/th8p594nhZhrc+w
 n1P3LCAIuE09TM0av8Ke+0xf1gbrzfFwrmR+4igWNSZKyXYVJ0dIrRo/5kvJYLQ00qu2
 qkHwl2u4zvW4Vc6HVK1fFWS6hhvgtbU2cimtj+RJ/LzVe1qcs8vjJvo5BdBk3y+GqQDQ
 nkbabJgV3dhUgUPVVPO7Q6TWsWDN55/4qtbzOhduJC3SU1MVNwn2WORULy3Gk5XRi+Mt
 ROyNjIiN4+Rf9f86Zz7zjMLCYOgm8SxxEJdWGpZrswgTX1W41VajTXan/SynnO/cKuQO
 44QQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUZCeVP7uNnHC7MqKn4ZARUTL9W6Sokjc80QzXkU+oO0riDBOs3cbJeFPXvj+d+pskN7M5QBC7VRRgR@lists.freedesktop.org,
 AJvYcCUatQZuBMBXHcpYYJD7XjnQR2Y13wzl187EG6LJPEEuETKRMuDWPHzNhaFiK7cTIlB6cbYNmbD76/Vl@lists.freedesktop.org,
 AJvYcCW8gOGtYk0fvpn/ncpgBYgCAmWlGClSej6nguN2IxI01Hr5dI0hgNn+Tgwq+Ix7PpIL6wmurdMifpzu8zkgrw==@lists.freedesktop.org,
 AJvYcCXlCZakiZfLNowhoOIYZF10WhVQnmm38o9o/KXMbWbBH1GQbzXxrSic1EKD9EB/lScHueNoL4Qy@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzT/QzTQ2Na97JwG/X5rJeh2olUH15VyJ7CsA6d3zTiJRZ2YRQY
 MgJVoEfQuthrkMBpnMG8FEXqV+ne7YDAsOZrO/4j7EkenXjQAfkz
X-Gm-Gg: ASbGncsieL2krkIbDNw63+2ez0MSC5ZbOizmKqj4B3p9YVEk8Vjkir0K+4b1+VTuXph
 NMi6qz26i4cLwsHqzXFreK1NzE35vQOEb26Iv1SoHWyikqjQG8JRj3lzJAcbuY8pnt75zqccXh8
 4A0jS5EyMF6M5nAs7cuMRz+aTsUskv5hIq1/b4IkLU6xMMjlKtJPIq/Pz7CKrT3/EwceXS0xQhA
 3IW5t4HZ4hwXSIHxGGH33WArpcRILWenEPUCs372OLjEJXQmPRqi+lJi+54woXrRJLPzAaA28Zq
 AWXkp7hx+Dm8bc4EO2ALjys5Tqe3TtnXsqcwzA==
X-Google-Smtp-Source: AGHT+IH54SsfpEYFO4ra8A4an4dLcvoG9wSBjoRiIYetoUV1RolCgaxWz0ul0FtpQ0GQuZ5n6MM7Gg==
X-Received: by 2002:a05:6602:2d83:b0:847:22a7:2412 with SMTP id
 ca18e2360f4ac-851b623bb6cmr3299746039f.8.1737787601748; 
 Fri, 24 Jan 2025 22:46:41 -0800 (PST)
Received: from gandalf.. (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
 by smtp.googlemail.com with ESMTPSA id
 8926c6da1cb9f-4ec1da476fesm1174144173.58.2025.01.24.22.46.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jan 2025 22:46:41 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, jbaron@akamai.com,
 gregkh@linuxfoundation.org, ukaszb@chromium.org
Cc: intel-gfx-trybot@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, daniel.vetter@ffwll.ch,
 tvrtko.ursulin@linux.intel.com, jani.nikula@intel.com,
 ville.syrjala@linux.intel.com, Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH 05/63] dyndbg: replace classmap list with a vector
Date: Fri, 24 Jan 2025 23:45:19 -0700
Message-ID: <20250125064619.8305-6-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250125064619.8305-1-jim.cromie@gmail.com>
References: <20250125064619.8305-1-jim.cromie@gmail.com>
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

Classmaps are stored in an elf section/array, but are individually
list-linked onto dyndbg's per-module ddebug_table for operation.

This is unnecessary; even when ddebug_attach_classmap() is handling
the builtin section (with classmaps for multiple builtin modules), its
contents are ordered, so a module's possibly multiple classmaps will
be consecutive in the section, and could be treated as a vector/block,
since both start-address and subrange length are in the ddebug_info arg.

IOW, this treats classmaps similarly to _ddebugs, which are already
kept as vector-refs (address+len).

So this changes:

struct ddebug_class_map drops list-head link.

struct ddebug_table drops the list-head maps, and gets: classes &
num_classes for the start-address and num_classes, placed to improve
struct packing.

The loading: in ddebug_attach_module_classes(), replace the
for-the-modname list-add loop, with a forloop that finds the module's
subrange (start,length) of matching classmaps within the possibly
builtin classmaps vector, and saves those to the ddebug_table.

The reading/using: change list-foreach loops in ddebug_class_name() &
ddebug_find_valid_class() to walk the array from start to length.

Also:
Move #define __outvar up, above an added use in a fn-prototype.
Simplify ddebug_attach_module_classes args, ref has both address & len.

no functional changes

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 include/linux/dynamic_debug.h |  1 -
 lib/dynamic_debug.c           | 61 ++++++++++++++++++-----------------
 2 files changed, 32 insertions(+), 30 deletions(-)

diff --git a/include/linux/dynamic_debug.h b/include/linux/dynamic_debug.h
index b9afc7731b7c..2b0057058ecf 100644
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
index 55df35df093b..41cbaa96f83d 100644
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
@@ -147,13 +148,15 @@ static void vpr_info_dq(const struct ddebug_query *query, const char *msg)
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
@@ -164,7 +167,6 @@ static struct ddebug_class_map *ddebug_find_valid_class(struct ddebug_table cons
 	return NULL;
 }
 
-#define __outvar /* filled by callee */
 /*
  * Search the tables for _ddebug's which match the given `query' and
  * apply the `flags' and `mask' to them.  Returns number of matching
@@ -1114,9 +1116,10 @@ static void *ddebug_proc_next(struct seq_file *m, void *p, loff_t *pos)
 
 static const char *ddebug_class_name(struct ddebug_iter *iter, struct _ddebug *dp)
 {
-	struct ddebug_class_map *map;
+	struct ddebug_class_map *map = iter->table->classes;
+	int i, nc = iter->table->num_classes;
 
-	list_for_each_entry(map, &iter->table->maps, link)
+	for (i = 0; i < nc; i++, map++)
 		if (class_in_range(dp->class_id, map))
 			return map->class_names[dp->class_id - map->base];
 
@@ -1200,30 +1203,31 @@ static const struct proc_ops proc_fops = {
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
@@ -1256,10 +1260,9 @@ static int ddebug_add_module(struct _ddebug_info *di, const char *modname)
 	dt->num_ddebugs = di->num_descs;
 
 	INIT_LIST_HEAD(&dt->link);
-	INIT_LIST_HEAD(&dt->maps);
 
 	if (di->classes && di->num_classes)
-		ddebug_attach_module_classes(dt, di->classes, di->num_classes);
+		ddebug_attach_module_classes(dt, di);
 
 	mutex_lock(&ddebug_lock);
 	list_add_tail(&dt->link, &ddebug_tables);
@@ -1372,8 +1375,8 @@ static void ddebug_remove_all_tables(void)
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
2.48.1

