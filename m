Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C4B9A6AD6B
	for <lists+dri-devel@lfdr.de>; Thu, 20 Mar 2025 19:53:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF5DA10E6B5;
	Thu, 20 Mar 2025 18:53:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="iRE2N8+/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f46.google.com (mail-io1-f46.google.com
 [209.85.166.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B9D310E6A9;
 Thu, 20 Mar 2025 18:53:14 +0000 (UTC)
Received: by mail-io1-f46.google.com with SMTP id
 ca18e2360f4ac-85b4277d0fbso49340939f.0; 
 Thu, 20 Mar 2025 11:53:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742496793; x=1743101593; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=w+F+GnadhvpI9NV2I8vagHLeGPOa3WWFte+bwa7InHw=;
 b=iRE2N8+/pFoDysmMnBsXQE495PzZR9fyvRINvNEMAbqrsKBdjrdeBhllAy3t4Ik6yf
 1JbSI22ZJxEiJMS47i/rayrQq0dNGJhjBYUHw9ETXS0YNYBAE3qxtaOU9Hmg1UzgMkDS
 eJCqxemM7nf3YVkCf5RA3h6LV3WUzQXVNkj06d9OwE46X8RbeRTQ7kTB0qbCobOvhM+1
 Ig21294g6w/NZVKvwojI7kdAYVwKe5vHSGSWXnwJxtkgZzOzQBZURLHVx/SsPlJh8pOR
 NZgcybuX3VmRIDjGENb+Pf/xrQ6Ozmg+ZdrE7c182RaZETvP+z191/wjNGONucdKWPoF
 ncDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742496793; x=1743101593;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=w+F+GnadhvpI9NV2I8vagHLeGPOa3WWFte+bwa7InHw=;
 b=rRVLVT0G5khBCfMnErbAL2XB5YlNKTRCTzEeTdsKaYbPuOReD/hFIcwFlX4UZMOzc6
 XSs+Pi/jsykV4ZwWmji9l2bymTkNH9PD7lr1IVeDxb30VaQIuTr8Xaxy46SeeKumCnvr
 4CtSjsMq5U2A/JLLcV6nO4nXFVdjJL9hPRqzQx0bMFOs8EzYCJ01zvIwtL4MJNYPE4dg
 mCXsWRzE+Uzanvb9/xajQln+lFk17ZMUU7SfFWYPQ9To3Vj5mWQuXUuEtE0bXE4b93vY
 EEXMnnYA1Wr637AYNROXOBi3JFLVFnkOrF8/nAdV+PFPh8274xim0GehEGZxnrhyL6yW
 zXSQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU3+asQsGXrzZ8PcWq0qW6UmAezgNc8IXi1zSESQW1qal3y86ZawA1LEUzFOSEm8AurXr+ZWh3TelCBl8soOq5NIw==@lists.freedesktop.org,
 AJvYcCUaovmo7oqdIg4cXiIP4Mwpbn4hmx+sEfxwqrW66GYwIVl9ZW2PlsrBG3oMy5tM2H2WtUL3W4YF@lists.freedesktop.org,
 AJvYcCW4IHTmRqY8BVnm8C+FD1GECqYMsbxQ4eQM3bwQsNoJFLJE1KLrrS072ABjEXe1C4PN+4Kh5ueRHss9zsfquw==@lists.freedesktop.org,
 AJvYcCWYTH7ciz2KH+DgziIrB983BFJIMPwmVMf3vyHPFf6hF5vfPcETkpBJnqwMAgi5Apm6WRpAppTt4qoQ@lists.freedesktop.org,
 AJvYcCXmDbc9DrmX7VoiJrcsA/fq7Q3tK7cYVm7DzrTkCPX4e6t1bTjM08GxS4b8UGWRWb9k8N7XPArMVtuy@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwyFii0wiUXw+CJ+nt6lSb54pRmID2mhL5xGDMUCRROP9+uFxvI
 BVmwCWHAFLq+T4O1Tm1tLgYArRj6sZHmJcU0U6lyoVttLmVfsSlt
X-Gm-Gg: ASbGncsJ362oEN/jS3nPnM6Rn43ZFRboSQzLhbFHXqgU24Ofuqw0/cptSv+QfzldvSx
 Hi5Z/fPerSTjMCj63YLr/dEhsRdXsZbO8rgWSwakpV8zrLdTOS36fVsBPhNO0uFGp/ZVEU+EPyw
 fp5hZcmEDJy4fZxitaqsjULFc0fsr6NJgQOS40LLIXxb65bekgN+KRnoAC/O/woWPNvQ89PgCtf
 kVqdTSTM2N4y847Wq7hPr1aFrlGcxjmcNQuTNetyoGAIpubrkNK/WFWlmoCU07yVDnCmIm7+9Dz
 tNYDEE+GrF2mWIbBkynycgbBejDJrFv3OZYvCqB+2vPD3orFkNuiTA5dDC+LL0G3uFYqqNeSL+H
 VBA==
X-Google-Smtp-Source: AGHT+IGnG99MvFBv0aeAcenkC/9JJPmAdrK6Gv1t2I88hEhHRTs25Tm6iR+r0LaSw7twnnyVIIXtkg==
X-Received: by 2002:a05:6602:6cc6:b0:85e:21bd:8a00 with SMTP id
 ca18e2360f4ac-85e2ca8065dmr45249339f.8.1742496793240; 
 Thu, 20 Mar 2025 11:53:13 -0700 (PDT)
Received: from gandalf.. (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
 by smtp.googlemail.com with ESMTPSA id
 ca18e2360f4ac-85e2bc273e7sm7078039f.17.2025.03.20.11.53.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Mar 2025 11:53:12 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-gfx-trybot@lists.freedesktop.org
Cc: jbaron@akamai.com, gregkh@linuxfoundation.org, ukaszb@chromium.org,
 louis.chauvet@bootlin.com, daniel.vetter@ffwll.ch,
 tvrtko.ursulin@linux.intel.com, jani.nikula@intel.com,
 ville.syrjala@linux.intel.com, Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v2 10/59] dyndbg: replace classmap list with a vector
Date: Thu, 20 Mar 2025 12:51:48 -0600
Message-ID: <20250320185238.447458-11-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250320185238.447458-1-jim.cromie@gmail.com>
References: <20250320185238.447458-1-jim.cromie@gmail.com>
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
 include/linux/dynamic_debug.h |  1 -
 lib/dynamic_debug.c           | 61 ++++++++++++++++++-----------------
 2 files changed, 32 insertions(+), 30 deletions(-)

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
index dd7320b9616d..d5572712ce55 100644
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
@@ -1122,9 +1124,10 @@ static void *ddebug_proc_next(struct seq_file *m, void *p, loff_t *pos)
 
 static const char *ddebug_class_name(struct ddebug_iter *iter, struct _ddebug *dp)
 {
-	struct ddebug_class_map *map;
+	struct ddebug_class_map *map = iter->table->classes;
+	int i, nc = iter->table->num_classes;
 
-	list_for_each_entry(map, &iter->table->maps, link)
+	for (i = 0; i < nc; i++, map++)
 		if (class_in_range(dp->class_id, map))
 			return map->class_names[dp->class_id - map->base];
 
@@ -1208,30 +1211,31 @@ static const struct proc_ops proc_fops = {
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
@@ -1263,10 +1267,9 @@ static int ddebug_add_module(struct _ddebug_info *di, const char *modname)
 	dt->num_ddebugs = di->num_descs;
 
 	INIT_LIST_HEAD(&dt->link);
-	INIT_LIST_HEAD(&dt->maps);
 
 	if (di->classes && di->num_classes)
-		ddebug_attach_module_classes(dt, di->classes, di->num_classes);
+		ddebug_attach_module_classes(dt, di);
 
 	mutex_lock(&ddebug_lock);
 	list_add_tail(&dt->link, &ddebug_tables);
@@ -1379,8 +1382,8 @@ static void ddebug_remove_all_tables(void)
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

