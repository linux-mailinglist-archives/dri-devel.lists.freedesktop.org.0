Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EE21577B79
	for <lists+dri-devel@lfdr.de>; Mon, 18 Jul 2022 08:40:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E341BA9D56;
	Mon, 18 Jul 2022 06:39:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x134.google.com (mail-il1-x134.google.com
 [IPv6:2607:f8b0:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 489D2A9CAE;
 Mon, 18 Jul 2022 06:38:36 +0000 (UTC)
Received: by mail-il1-x134.google.com with SMTP id w9so2043460ilg.1;
 Sun, 17 Jul 2022 23:38:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Bh0/DFoYhEptZ3Qmb/gPoAkKxPWthqE3Rxq7bl/8jnk=;
 b=K/N03qVc1QzIwf6M5NDJI4ORkODBkAgXm+R6M0pzFztLSNH2lxdUOr3Bdk22ZYFZv5
 sDl5rIy6kNaoz2BNwD/pzj57EVUtLhkipWZJqnfrV/L0VBnN0eh/2z8foMXlEJ0+Qgkl
 Sql2bmyd+cmxfwkWeGIDAhfrgSUq7RlNh5cM+tWoSkVtR3fjxGJy2KEUi/xwbmFB5nJn
 xleOLiyXScTiZkgKeoSnP25A5sprhtifuHlsIYnGA6EZOIrfNonifb+marff6kLexoQ6
 gEnt5ASK9MkJZhzQOxhFH/hjRmPOdX9JVRk/Knt/ZznS5ee9pO/KsQTiF0Y6/3RQrG6J
 Bh3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Bh0/DFoYhEptZ3Qmb/gPoAkKxPWthqE3Rxq7bl/8jnk=;
 b=qDu/sPhKORgF5xWS38h71ExrWoQyK+rX2uSPIcSqxWKtI/imUrrAPvFYKBxoC16BQi
 k7klOjBMwjUVkwPr0O2EIpGYEMnjnL5oGkta+w/qH+jHBoIbQ/0EvDE2sZKJHg56ZR0r
 SnLYO9O/OWwUwVCNhcD5al/9uIbseoPtJzYNn7tvs9Q+H0M1UMLMtqQZNQi2AzoiSv1Q
 xyniuxjr8DPHNXhiIXJxgJRItfl4uJ+VtLK+QBca0CCjqYINgethuzhgMEaTIZoO7WTB
 jHQuo6DVk0DXGlB9sNoUEfePeZZfx6YWdczLx9QpypD6MmlnOmVRXngRuzxYiCL+jeha
 JQDQ==
X-Gm-Message-State: AJIora+ckO5Kkw0qeEYGT347yL/+lh/JJq4l//BpR+VYgFFLKUF07xHt
 QSOZthnifq1ibxS+NTul81oMSCd6+GY=
X-Google-Smtp-Source: AGRyM1v2fbTo5fmEy4gFJ9UlFaZlXXEOOpfE4jwoyvAkD4TJOBnHASiczSSjOBILUXqmUAzKJBWjFQ==
X-Received: by 2002:a05:6e02:1bcb:b0:2dc:ec0e:9e7 with SMTP id
 x11-20020a056e021bcb00b002dcec0e09e7mr1749649ilv.213.1658126315309; 
 Sun, 17 Jul 2022 23:38:35 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 o12-20020a92a80c000000b002dcd35bb030sm2342604ilh.74.2022.07.17.23.38.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Jul 2022 23:38:34 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com
Subject: [PATCH v3 15/41] dyndbg: validate class FOO by checking with module
Date: Mon, 18 Jul 2022 00:35:59 -0600
Message-Id: <20220718063641.9179-16-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220718063641.9179-1-jim.cromie@gmail.com>
References: <20220718063641.9179-1-jim.cromie@gmail.com>
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
Cc: nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add module-to-class validation:

  #> echo class DRM_UT_KMS +p > /proc/dynamic_debug/control

If a query has "class FOO", then ddebug_find_valid_class(), called
from ddebug_change(), requires that FOO is known to module X,
otherwize the query is skipped entirely for X.  This protects each
module's class-space, other than the default:31.

The authors' choice of FOO is highly selective, giving isolation
and/or coordinated sharing of FOOs.  For example, only DRM modules
should know and respond to DRM_UT_KMS.

So this, combined with module's opt-in declaration of known classes,
effectively privatizes the .class_id space for each module (or
coordinated set of modules).

Notes:

For all "class FOO" queries, ddebug_find_valid_class() is called, it
returns the map matching the query, and sets valid_class via an
*outvar).

If no "class FOO" is supplied, valid_class = _CLASS_DFLT.  This
insures that legacy queries do not trample on new class'd callsites,
as they get added.

Also add a new column to control-file output, displaying non-default
class-name (when found) or the "unknown _id:", if it has not been
(correctly) declared with one of the declarator macros.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 lib/dynamic_debug.c | 76 ++++++++++++++++++++++++++++++++++++++++-----
 1 file changed, 68 insertions(+), 8 deletions(-)

diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index e29730686cfb..4c27bbe5187e 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -56,6 +56,7 @@ struct ddebug_query {
 	const char *module;
 	const char *function;
 	const char *format;
+	const char *class_string;
 	unsigned int first_lineno, last_lineno;
 };
 
@@ -136,15 +137,33 @@ static void vpr_info_dq(const struct ddebug_query *query, const char *msg)
 			fmtlen--;
 	}
 
-	v3pr_info("%s: func=\"%s\" file=\"%s\" module=\"%s\" format=\"%.*s\" lineno=%u-%u\n",
-		 msg,
-		 query->function ?: "",
-		 query->filename ?: "",
-		 query->module ?: "",
-		 fmtlen, query->format ?: "",
-		 query->first_lineno, query->last_lineno);
+	v3pr_info("%s: func=\"%s\" file=\"%s\" module=\"%s\" format=\"%.*s\" lineno=%u-%u class=%s\n",
+		  msg,
+		  query->function ?: "",
+		  query->filename ?: "",
+		  query->module ?: "",
+		  fmtlen, query->format ?: "",
+		  query->first_lineno, query->last_lineno, query->class_string);
 }
 
+static struct ddebug_class_map *ddebug_find_valid_class(struct ddebug_table const *dt,
+							  const char *class_string, int *class_id)
+{
+	struct ddebug_class_map *map;
+	int idx;
+
+	list_for_each_entry(map, &dt->maps, link) {
+		idx = match_string(map->class_names, map->length, class_string);
+		if (idx >= 0) {
+			*class_id = idx + map->base;
+			return map;
+		}
+	}
+	*class_id = -ENOENT;
+	return NULL;
+}
+
+#define __outvar /* filled by callee */
 /*
  * Search the tables for _ddebug's which match the given `query' and
  * apply the `flags' and `mask' to them.  Returns number of matching
@@ -159,6 +178,8 @@ static int ddebug_change(const struct ddebug_query *query,
 	unsigned int newflags;
 	unsigned int nfound = 0;
 	struct flagsbuf fbuf, nbuf;
+	struct ddebug_class_map *map = NULL;
+	int __outvar valid_class;
 
 	/* search for matching ddebugs */
 	mutex_lock(&ddebug_lock);
@@ -169,9 +190,22 @@ static int ddebug_change(const struct ddebug_query *query,
 		    !match_wildcard(query->module, dt->mod_name))
 			continue;
 
+		if (query->class_string) {
+			map = ddebug_find_valid_class(dt, query->class_string, &valid_class);
+			if (!map)
+				continue;
+		} else {
+			/* constrain query, do not touch class'd callsites */
+			valid_class = _DPRINTK_CLASS_DFLT;
+		}
+
 		for (i = 0; i < dt->num_ddebugs; i++) {
 			struct _ddebug *dp = &dt->ddebugs[i];
 
+			/* match site against query-class */
+			if (dp->class_id != valid_class)
+				continue;
+
 			/* match against the source filename */
 			if (query->filename &&
 			    !match_wildcard(query->filename, dp->filename) &&
@@ -420,6 +454,8 @@ static int ddebug_parse_query(char *words[], int nwords,
 		} else if (!strcmp(keyword, "line")) {
 			if (parse_linerange(query, arg))
 				return -EINVAL;
+		} else if (!strcmp(keyword, "class")) {
+			rc = check_set(&query->class_string, arg, "class");
 		} else {
 			pr_err("unknown keyword \"%s\"\n", keyword);
 			return -EINVAL;
@@ -854,6 +890,20 @@ static void *ddebug_proc_next(struct seq_file *m, void *p, loff_t *pos)
 	return dp;
 }
 
+#define class_in_range(class_id, map)					\
+	(class_id >= map->base && class_id < map->base + map->length)
+
+static const char *ddebug_class_name(struct ddebug_iter *iter, struct _ddebug *dp)
+{
+	struct ddebug_class_map *map;
+
+	list_for_each_entry(map, &iter->table->maps, link)
+		if (class_in_range(dp->class_id, map))
+			return map->class_names[dp->class_id - map->base];
+
+	return NULL;
+}
+
 /*
  * Seq_ops show method.  Called several times within a read()
  * call from userspace, with ddebug_lock held.  Formats the
@@ -865,6 +915,7 @@ static int ddebug_proc_show(struct seq_file *m, void *p)
 	struct ddebug_iter *iter = m->private;
 	struct _ddebug *dp = p;
 	struct flagsbuf flags;
+	char const *class;
 
 	if (p == SEQ_START_TOKEN) {
 		seq_puts(m,
@@ -877,7 +928,16 @@ static int ddebug_proc_show(struct seq_file *m, void *p)
 		   iter->table->mod_name, dp->function,
 		   ddebug_describe_flags(dp->flags, &flags));
 	seq_escape_str(m, dp->format, ESCAPE_SPACE, "\t\r\n\"");
-	seq_puts(m, "\"\n");
+	seq_puts(m, "\"");
+
+	if (dp->class_id != _DPRINTK_CLASS_DFLT) {
+		class = ddebug_class_name(iter, dp);
+		if (class)
+			seq_printf(m, " class:%s", class);
+		else
+			seq_printf(m, " class unknown, _id:%d", dp->class_id);
+	}
+	seq_puts(m, "\n");
 
 	return 0;
 }
-- 
2.36.1

