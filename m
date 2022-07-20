Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE58957BA27
	for <lists+dri-devel@lfdr.de>; Wed, 20 Jul 2022 17:34:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB39F8F45A;
	Wed, 20 Jul 2022 15:33:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com
 [IPv6:2607:f8b0:4864:20::d2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD74D8F414;
 Wed, 20 Jul 2022 15:33:14 +0000 (UTC)
Received: by mail-io1-xd2c.google.com with SMTP id n138so13301270iod.4;
 Wed, 20 Jul 2022 08:33:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Bh0/DFoYhEptZ3Qmb/gPoAkKxPWthqE3Rxq7bl/8jnk=;
 b=JQTsaj5bsHW1A21441YtEzu8im412HFkWgrXGy5rx6TZLXeh+xN1vxXIl7uiyPsMk6
 d50DsIjRWy6nil/5OHeWAMuByA3KUmLG5riMo+sYYag0KGTq72nSpSCqyrmM5F5CdxGH
 25hFGl17GuwRwsLIEgnJBGRBWyHZpUaIwjW+147AMBBWk3fAYrYT/v3ZWndeAfcZuFIg
 biPUzTQcprbxUKROygS/LE/9Ev7oB1FoCxMCgq6IRiFraSmYsX6rHc9rwX/K1KPBtqP0
 Er6MH3MYgVqDdgklBAs3lzMh6PnC+uZVuKnqzi+SE/fYqh3pQIUDM0goWKmgVQctiKwD
 AhpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Bh0/DFoYhEptZ3Qmb/gPoAkKxPWthqE3Rxq7bl/8jnk=;
 b=Om9/KtS2F4BXJ5zmFzHXR/4kv7t4jvzlMw2xgacsTPao8nm5cXc58bqyxq35AgSHsv
 FlV78Cp8dn7GPPUoPb/bCBWSKwNO7fWCllcb85+PE0vlIG+eJjY+PkiyXr9G7vLhfTAU
 +L4cvD+V4+Ps286oes2Ei9BJTsm0tIcxGU9/oCL8UL0mwExG3IJDnH3DSVV24K/9hwsb
 S96dFZj1bqQY1htJVT2/mgg9MjtRmlXtrt9e9EfnrcUYQSfOvk/zG219haifj1iwT/SL
 tifuf8/kshKmmWNIyuQcerS04L0fARBIrIfAwte/+NgJCmUF/Jc5DX6KhxdFcjddLhEC
 rK2Q==
X-Gm-Message-State: AJIora864K+lsGpFkYfQLgVIIm1rsvoVyegVhGkmDjD29wE9ykQOKCZ7
 9b6yrVEF8DEuXidtOr+1aJzDoX+ua6F0gw==
X-Google-Smtp-Source: AGRyM1sPkm7XlD4wLqoEnILMc+uWfxvF071/Bv9kfUhYq3Fb4AKSc+MHYwZnLcSTMkXROAmESKm4tw==
X-Received: by 2002:a05:6602:15c8:b0:67c:45c7:40c9 with SMTP id
 f8-20020a05660215c800b0067c45c740c9mr1516208iow.138.1658331193907; 
 Wed, 20 Jul 2022 08:33:13 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 q1-20020a92d401000000b002dcdb4bbe87sm4579581ilm.22.2022.07.20.08.33.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Jul 2022 08:33:13 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 jbaron@akamai.com, gregkh@linuxfoundation.org, daniel.vetter@ffwll.ch,
 seanpaul@chromium.org, robdclark@gmail.com
Subject: [PATCH v4 15/41] dyndbg: validate class FOO by checking with module
Date: Wed, 20 Jul 2022 09:32:07 -0600
Message-Id: <20220720153233.144129-16-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220720153233.144129-1-jim.cromie@gmail.com>
References: <20220720153233.144129-1-jim.cromie@gmail.com>
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

