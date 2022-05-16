Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23691529436
	for <lists+dri-devel@lfdr.de>; Tue, 17 May 2022 00:57:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBECB10EAE3;
	Mon, 16 May 2022 22:57:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x12e.google.com (mail-il1-x12e.google.com
 [IPv6:2607:f8b0:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8541710EAE3;
 Mon, 16 May 2022 22:57:16 +0000 (UTC)
Received: by mail-il1-x12e.google.com with SMTP id i15so1654318ilk.5;
 Mon, 16 May 2022 15:57:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6Wk014TwyjnrOaQ2i3WNMMRKpv2e+mMH/KYOzUNpIOE=;
 b=NbC3sbmxQ0gNlrzlR6q30F5DeIDupJtg/rWawsgTFkINjdCXcKwcQjJ+80AMWIsf38
 8LFB7eLOgSryfGffVVoVbm6DUrrP/Ea2cEe2zYmQCl5zQw04DDTNTUdyoN/Z1QUuFMPC
 tC7D4LPtwPgOaRl6JXoEqld602TZ50DbL8yu61BZUzG6TQ4Dv+vC+K35WGFouu1Elsbu
 eeVoIPCbMW7zL3ymZ6nhdNZ+j+U2ej6XMf6WKb0i63W9YVL7MgNCv4nTLgDywQnl8irm
 ow6CNlSYNmujeLBprx1idrRFeRo6Nj9U1IyTMWAvarnXzuWDJDI1xLEIfdhu0yDJjf9C
 q41Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6Wk014TwyjnrOaQ2i3WNMMRKpv2e+mMH/KYOzUNpIOE=;
 b=pKbYDwGclICRevpRJE+0Rz+JGGtnl1oBpPK/DgvkJEn4IKmlIptJX3zES/cFeWp1ZU
 78K73Z7aIy3bxvkLFSNI9QBeduLp0PDU6uQP/BfB75NxzqhDctUzkVoqCnezek/mjwgx
 mcpJ6HWXDjEwWDQO6d6wFN8CGBr5oq3jiDZvVCklMYm5yZ6uwTgym+hFLXM8XM4YzPgG
 ZlJ8AvqT6csUnJC+ZX5ndCBoWo3fbvfoONwhxsqU2qZRG6f1G6RoVPbYCBMFaVPcHnqi
 VrEM3BuanyzmkX+kCF8KAOvayBHl6Cv9klyiS6fOPimmp/VJTyMP5k7ZUpSusTGrAXrO
 eciQ==
X-Gm-Message-State: AOAM530yncZp7p6cksoUjUw0GphNw3jeU1af4h+jRWoR12dL4PB8GIOF
 njEmcpVDwqwraBXyZnuru+M=
X-Google-Smtp-Source: ABdhPJzsYhdemnsNa7jolhgES0cXpVtGwAcCj/g475kUSD5yZiac8pvgAJmKVJyqTCsdFP4vD4XH9A==
X-Received: by 2002:a05:6e02:1788:b0:2cf:3150:f26c with SMTP id
 y8-20020a056e02178800b002cf3150f26cmr10109037ilu.214.1652741835464; 
 Mon, 16 May 2022 15:57:15 -0700 (PDT)
Received: from frodo.hsd1.co.comcast.net ([2601:284:8204:2010::dd9f])
 by smtp.googlemail.com with ESMTPSA id
 k26-20020a02661a000000b0032b74686763sm3133949jac.76.2022.05.16.15.57.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 15:57:15 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 12/27] dyndbg: change zero-or-one classes-map to maps list
Date: Mon, 16 May 2022 16:56:25 -0600
Message-Id: <20220516225640.3102269-13-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220516225640.3102269-1-jim.cromie@gmail.com>
References: <20220516225640.3102269-1-jim.cromie@gmail.com>
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
Cc: maz@kernel.org, quic_saipraka@quicinc.com, catalin.marinas@arm.com,
 arnd@arndb.de, gregkh@linuxfoundation.org, linux-arm-msm@vger.kernel.org,
 rostedt@goodmis.org, mingo@redhat.com, mathieu.desnoyers@efficios.com,
 quic_psodagud@quicinc.com, daniel.vetter@ffwll.ch, seanpaul@chromium.org,
 will@kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Upgrade single classes-map to list of them:

This allows multiple DYNAMIC_DEBUG_CLASSES(class-map)s per module,
using _base to segment the 0..30 classid space.

alter struct ddebug table:
 replace .classes (a &map) with maps (list-head)

dynamic_debug_register_classes(map) - adds new map to maps list.

dynamic_debug_unregister_classes(map) - deletes map after ID-check.

ddebug_validate_classname() - check all maps in list before failing.

ddebug_class_name() - which supports ```cat control``` now walks maps
list, finds the map whose sub-range of .class_id's spans the one in
the callsite, and returns that class-name.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
. split out validate_classnames()
. fold in fixes for multi class-maps
---
 lib/dynamic_debug.c | 76 +++++++++++++++++++++++++++++++--------------
 1 file changed, 52 insertions(+), 24 deletions(-)

diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index 8e1b9159e881..f9c5bbf9d43b 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -43,10 +43,8 @@ extern struct _ddebug __start___dyndbg[];
 extern struct _ddebug __stop___dyndbg[];
 
 struct ddebug_table {
-	struct list_head link;
+	struct list_head link, maps;
 	const char *mod_name;
-	/* a module can have multiple class-sets eventually, but not yet */
-	struct ddebug_known_classes_map const *map;
 	unsigned int num_ddebugs;
 	struct _ddebug *ddebugs;
 };
@@ -149,28 +147,18 @@ static void vpr_info_dq(const struct ddebug_query *query, const char *msg)
 /* return <0 if class-name is unknown/invalid, 0..CLASS_DFLT otherwise */
 static int ddebug_validate_classname(struct ddebug_table *dt, const char *class_string)
 {
-	int query_class = -ENOENT;
+	struct ddebug_known_classes_map *map;
 	int idx;
 
 	if (!class_string)
-		/* all queries w/o class given work only on default class */
 		return _DPRINTK_CLASS_DFLT;
 
-	/*
-	 * XXX single list will need to be a for-list
-	 * so that modules can have 2 sets of class-decls
-	 */
-	if (!dt->map)
-		return -ENOENT;
-
-	idx = match_string(dt->map->classes, dt->map->length, class_string);
-	if (idx < 0) {
-		v3pr_info("class: %s.%s unknown\n", dt->mod_name, class_string);
-		return -ENOENT;
+	list_for_each_entry(map, &dt->maps, link) {
+		idx = match_string(map->classes, map->length, class_string);
+		if (idx >= 0)
+			return idx + map->base;
 	}
-	query_class = idx + dt->map->base;
-
-	return query_class;
+	return -ENOENT;
 }
 
 /*
@@ -1032,8 +1020,14 @@ static void *ddebug_proc_next(struct seq_file *m, void *p, loff_t *pos)
 
 static const char *ddebug_class_name(struct ddebug_iter *iter, struct _ddebug *dp)
 {
-	if (iter->table->map)
-		return iter->table->map->classes[dp->class_id];
+	struct ddebug_known_classes_map *map;
+
+	list_for_each_entry(map, &iter->table->maps, link) {
+		if (dp->class_id < map->base ||
+		    dp->class_id >= map->base + map->length)
+			continue;
+		return map->classes[dp->class_id - map->base];
+	}
 	return NULL;
 }
 
@@ -1124,6 +1118,7 @@ int dynamic_debug_register_classes(struct ddebug_known_classes_map *map)
 	struct ddebug_table *dt;
 	int rc = -ENOENT;
 
+	INIT_LIST_HEAD(&map->link);
 	mutex_lock(&ddebug_lock);
 #ifdef CONFIG_MODULES
 	if (map->mod) {
@@ -1131,7 +1126,7 @@ int dynamic_debug_register_classes(struct ddebug_known_classes_map *map)
 		list_for_each_entry(dt, &ddebug_tables, link) {
 			if (dt->mod_name == map->mod->name) {
 				rc = 0;
-				dt->map = map;
+				list_add(&map->link, &dt->maps);
 				break;
 			}
 		}
@@ -1142,7 +1137,7 @@ int dynamic_debug_register_classes(struct ddebug_known_classes_map *map)
 		list_for_each_entry(dt, &ddebug_tables, link) {
 			if (!strcmp(dt->mod_name, map->mod_name)) {
 				rc = 0;
-				dt->map = map;
+				list_add(&map->link, &dt->maps);
 				break;
 			}
 		}
@@ -1159,8 +1154,38 @@ EXPORT_SYMBOL(dynamic_debug_register_classes);
 
 void dynamic_debug_unregister_classes(struct ddebug_known_classes_map *map)
 {
-	vpr_info("unregister_classes: %s\n", map->mod_name);
+	int rc = -ENOENT;
+
+	mutex_lock(&ddebug_lock);
+#ifdef CONFIG_MODULES
+	if (map->mod) {
+		struct ddebug_known_classes_map *dmap;
+		struct ddebug_table *dt;
+
+		list_for_each_entry(dt, &ddebug_tables, link) {
+			if (dt->mod_name != map->mod->name)
+				continue;
+			list_for_each_entry(dmap, &dt->maps, link) {
+				if (dmap != map)
+					continue;
+				rc = 0;
+				list_del(&map->link);
+				break;
+			}
+		}
+	}
+#endif
+	if (!map->mod) {
+		pr_err("shouldn't be unloading a builtin module: %s\n",
+		       map->mod_name);
+	}
+	mutex_unlock(&ddebug_lock);
+	if (rc)
+		pr_warn("unregister_classes: module %s not found\n", map->mod_name);
+	else
+		vpr_info("unregister_classes: %s\n", map->mod_name);
 }
+EXPORT_SYMBOL(dynamic_debug_unregister_classes);
 
 /*
  * Allocate a new ddebug_table for the given module
@@ -1186,6 +1211,9 @@ int ddebug_add_module(struct _ddebug *tab, unsigned int n,
 	dt->num_ddebugs = n;
 	dt->ddebugs = tab;
 
+	INIT_LIST_HEAD(&dt->link);
+	INIT_LIST_HEAD(&dt->maps);
+
 	mutex_lock(&ddebug_lock);
 	list_add(&dt->link, &ddebug_tables);
 	mutex_unlock(&ddebug_lock);
-- 
2.35.3

