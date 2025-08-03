Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1179FB191CF
	for <lists+dri-devel@lfdr.de>; Sun,  3 Aug 2025 05:58:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1273110E4AC;
	Sun,  3 Aug 2025 03:58:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="JLGm7UjR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f173.google.com (mail-il1-f173.google.com
 [209.85.166.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFF1C10E4A9;
 Sun,  3 Aug 2025 03:58:49 +0000 (UTC)
Received: by mail-il1-f173.google.com with SMTP id
 e9e14a558f8ab-3e3d238b3a7so39928075ab.0; 
 Sat, 02 Aug 2025 20:58:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754193529; x=1754798329; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=j+IM0NsWJ5A9C8Bm0HIX5NiHGnXi4xS02uXX3BN3rSA=;
 b=JLGm7UjRX4HhI2yRRwPEFFbn48yqYuSAPBl5SG2bKHohiYkNsNX5+cRX6xe28ay0E+
 L0T34K5aqw1CffxmLhI5MTxsUl7W3MstwdosShd2GgTqKOab3niuCtJNzObRd+m31t1x
 nZSLCE6daWey0Jthy0ziKAX+xJX4IOtO3ZQEMDE+c+JOtdZip5ZkvuZ+hspia/ijiMrr
 2C2l+92O7nbyA+GFcJI93xRflnzlN62LBTjTjFJvw9Ip8VYqr7cNKTfKJiWfA04KP6BR
 zmX1lvLaDuLrzJdsXpEiSb9DJA49tZKkrMiLt3ZJWs+pFLX62O7BqU9955Hq7wIughW5
 TrPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754193529; x=1754798329;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=j+IM0NsWJ5A9C8Bm0HIX5NiHGnXi4xS02uXX3BN3rSA=;
 b=HJTm+1sw83Dv4bxWxgyEYJ+w3gyq8HBxdvpMUhZ7QkcFNR4hV3Dp5uRBXPt+NIDwRV
 BRF0O1BzLsl6bBvbGR+srcW2oD7Bxfjr6esZGWim2R9OGzwqoAm6xOVzNV/LaYmMNelk
 EIdAPfEZwsKaF8IA40MpETGYf+oUhQAw2RRYKkrapdD0ESpH7F/dC0tz7NYOb83Jz7hX
 zJQPlBLTH1ZQRUU8QB5xPi8eQb55Mlg+qr3FWikJ71ARgmEwD7mQazURqF379U2sPc6+
 fyQZptT5dBuLchn/tl4AakNASPWRf3BM8FdfkR+YAuOvSfl+N1ZDQ449AWpvh6AIUhsm
 YzFQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUHFsis8Wf1g2EpRmWo7z6WTJFsgOO+evqSuWC/ZwpM/aeURP3CbDbi3U4dxDOlMcm5nVaHeLk1VWQJ@lists.freedesktop.org,
 AJvYcCVXzx1f8DkBH41hNzHS0qC9EglAVhXW98Ctys3q71Yyoe9jX5wIaxCeTLr2dDsA0o1V63h58wZl@lists.freedesktop.org,
 AJvYcCXYe8ygi3a+oE9bqZUYB9JcnVeZ9vOXOsBHvYFhey2tIc6KRwPl36NGXjsRGkxl9tNdT2Ruq3t3eh9Llrfmaw==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyiLEYTTXEo/crtUP6VSVxq70zw3efJlcB0a//maERlQuauHaqx
 9INr9PBPfT9pO/+PsYo+oDXf+pUbtNgwb0Ka4eGbsrIHDZLJfL0hLS0n
X-Gm-Gg: ASbGnctpyfyqmeg7wC8+if7ysLbzLYwcdfPPHc9eR3/jdVEgnvW4Xr7n98qFbo0k7Wq
 /oJ9gx7f1r2tkH5OfKGxfAXdCbl3uLCCQ+SAZPjEyHDdg+98jyizCSY0LJx9Lm+vGPENsFpwS60
 McAmOPBDdKlrS4fZKqOrDT5NBv3sbAmFfu3c4pJep2UdkBq+nl3VJ/RzCIPDbgJM15Ps+sdqvIz
 4q6RW4Aj/dkwz05wI9rg4AxXC91ss0xjO0VE8lfOmfwoelxNZvjXjxyJSZmx2yHOmPwAOjgV/S/
 dTWPX+yX0HLZNeYwDkX1k8djWUUwFhlGzoIUGSNmosFy86ZrR86jegOBMdJ4+typXeSxHor99Mi
 FiPBavZTvuhf4T0LtxpSQ+HjZUfTN9YymdLP+5Oqkic4p6tSQa9ztyNFDiuToGig3twTsKaRtVj
 uQydrTct6gKv+U
X-Google-Smtp-Source: AGHT+IGM7OSUipX6+Z/C4hvdpT/EoYheE+z0u0a3sHNA7VxTBFGUiEplXS+T9MpT5CIry67A8qS+LA==
X-Received: by 2002:a05:6e02:3191:b0:3dd:e7d6:18bb with SMTP id
 e9e14a558f8ab-3e4161cca21mr84220835ab.17.1754193529107; 
 Sat, 02 Aug 2025 20:58:49 -0700 (PDT)
Received: from frodo.raven-morpho.ts.net (c-67-165-245-5.hsd1.co.comcast.net.
 [67.165.245.5]) by smtp.googlemail.com with ESMTPSA id
 8926c6da1cb9f-50a55df0940sm2268319173.106.2025.08.02.20.58.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Aug 2025 20:58:48 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, jbaron@akamai.com,
 gregkh@linuxfoundation.org, ukaszb@chromium.org, louis.chauvet@bootlin.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 daniel.vetter@ffwll.ch, tvrtko.ursulin@linux.intel.com,
 jani.nikula@intel.com, ville.syrjala@linux.intel.com,
 seanpaul@chromium.org, robdclark@gmail.com, groeck@google.com,
 yanivt@google.com, bleung@google.com, quic_saipraka@quicinc.com,
 will@kernel.org, catalin.marinas@arm.com, quic_psodagud@quicinc.com,
 maz@kernel.org, arnd@arndb.de, linux-arm-kernel@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, mingo@redhat.com, jim.cromie@gmail.com
Subject: [PATCH v4 11/58] dyndbg: replace classmap list with a vector
Date: Sat,  2 Aug 2025 21:57:29 -0600
Message-ID: <20250803035816.603405-12-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250803035816.603405-1-jim.cromie@gmail.com>
References: <20250803035816.603405-1-jim.cromie@gmail.com>
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
index ac199293d2032..e458d4b838ac3 100644
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
index 08d095dd19ef4..283926530a43b 100644
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
2.50.1

