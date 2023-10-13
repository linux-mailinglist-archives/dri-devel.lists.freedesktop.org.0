Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E5E97C90DF
	for <lists+dri-devel@lfdr.de>; Sat, 14 Oct 2023 00:49:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A65410E665;
	Fri, 13 Oct 2023 22:48:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x12a.google.com (mail-il1-x12a.google.com
 [IPv6:2607:f8b0:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7C8910E664;
 Fri, 13 Oct 2023 22:48:48 +0000 (UTC)
Received: by mail-il1-x12a.google.com with SMTP id
 e9e14a558f8ab-35748b32d73so10075305ab.0; 
 Fri, 13 Oct 2023 15:48:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1697237328; x=1697842128; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tXsSOg8f2yCgJEL2pCIM6ReAyW7r5JJg4FpT0/i3350=;
 b=ZpyNQPrZnIX/SmHU/hK+hxBzIENsHYy+hD+6uL7dDYKkNZmyQk0cFmbnUdyx4orh7/
 TrYzFXGdGLEgTfkEnKihT8DCdvJ5KjGc4sPem6HzOjKVt52mmz38N6nOX3E2cgL2mN9S
 D1hT2s9XSw5/rpZak6YyvOONFjC66D7DJ5NcNIzfJpusyE9wrMVu/y4hZF5iIMRJ4JnN
 8EmK9Cv3BE1e6LCMFjR2UyxegSPno56rc08XjfJCGfsbELdPpbL1pBo0oU++NggZRsJF
 49aL6sIfIodigjciTEUymGlAHtNqxB3t3F2TCbXRuvCYTqUsfNgoQ041jnxrlaFTplgI
 tBCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697237328; x=1697842128;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tXsSOg8f2yCgJEL2pCIM6ReAyW7r5JJg4FpT0/i3350=;
 b=VCQuPZYFazl+FBmQL8JxvYJAUY0x1nTY2TBytH0pvagBMB1BDBeWk/C+SNqytMhgFw
 i+h/aoRC04uITxHX9sLoKNr0nzZrrir3JDZaEZ4HE8ovPTjKmElrMEL+4btOtFdVVhka
 atsngrTJOx3ZwtX+W7H0aji1scaYWc8Vr4p4w9MlYEndNXWqUY95JNr/rqVRoRKWY7ZK
 wOhtMd4xpExuVk5wE7jzy4vje1MoVntqveBC96A3Mh31LiQGpg6L3Wjga9bsZp+rJiJI
 2STQQFs5yr3FN00oavZSNTUll/8fJ2YMCTKEAPiCZgo/F0NBMt/OVFHaOP64gxQo74Ke
 Y8AQ==
X-Gm-Message-State: AOJu0Yy0Yck7JTOKZf3D0bPpwqb9nttBaWYzLbcY5FfRGJsZF57usptk
 KnNsveHM6Luf6/7mmbWIh10=
X-Google-Smtp-Source: AGHT+IE9rlOoTxWanAIhwXH3c3A7MPp5nT4G7OQtkPlxA2nnFxv/BQDSaMbqdKcAurhuWGzqbDPnaw==
X-Received: by 2002:a05:6e02:3201:b0:34f:ef94:c803 with SMTP id
 cd1-20020a056e02320100b0034fef94c803mr27776695ilb.25.1697237328040; 
 Fri, 13 Oct 2023 15:48:48 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 t10-20020a92dc0a000000b003512c3e8809sm1683071iln.71.2023.10.13.15.48.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Oct 2023 15:48:47 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, jbaron@akamai.com,
 gregkh@linuxfoundation.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Subject: [PATCH v7b 15/25] dyndbg: add for_each_boxed_vector
Date: Fri, 13 Oct 2023 16:48:07 -0600
Message-ID: <20231013224818.3456409-16-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231013224818.3456409-1-jim.cromie@gmail.com>
References: <20231013224818.3456409-1-jim.cromie@gmail.com>
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
Cc: lb@semihalf.com, groeck@google.com, linux-doc@vger.kernel.org,
 jani.nikula@intel.com, daniel.vetter@ffwll.ch, linux@rasmusvillemoes.dk,
 mcgrof@kernel.org, seanpaul@chromium.org, joe@perches.com, bleung@google.com,
 yanivt@google.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add a for_each iterator to walk a counted vector member in a struct
(ie the box), and use it to replace 8 open-coded loops.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
v5- parens-on-box-force-precedence
---
 lib/dynamic_debug.c | 20 +++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index be49e104ec76..c11feca70d6f 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -158,6 +158,9 @@ static void vpr_info_dq(const struct ddebug_query *query, const char *msg)
 		  _dt->num_class_users);				\
 	})
 
+#define for_each_boxed_vector(_box, _vec, _len, _ct, _curs)		\
+	for (_ct = 0, _curs = (_box)->_vec; _ct < (_box)->_len; _ct++, _curs++)
+
 #define __outvar /* filled by callee */
 static struct ddebug_class_map *ddebug_find_valid_class(struct ddebug_table const *dt,
 							const char *class_string,
@@ -167,7 +170,7 @@ static struct ddebug_class_map *ddebug_find_valid_class(struct ddebug_table cons
 	struct ddebug_class_user *cli;
 	int i, idx;
 
-	for (i = 0, map = dt->classes; i < dt->num_classes; i++, map++) {
+	for_each_boxed_vector(dt, classes, num_classes, i, map) {
 		idx = match_string(map->class_names, map->length, class_string);
 		if (idx >= 0) {
 			*class_id = idx + map->base;
@@ -175,7 +178,7 @@ static struct ddebug_class_map *ddebug_find_valid_class(struct ddebug_table cons
 			return map;
 		}
 	}
-	for (i = 0, cli = dt->class_users; i < dt->num_class_users; i++, cli++) {
+	for_each_boxed_vector(dt, class_users, num_class_users, i, cli) {
 		idx = match_string(cli->map->class_names, cli->map->length, class_string);
 		if (idx >= 0) {
 			*class_id = idx + cli->map->base;
@@ -1058,11 +1061,11 @@ static const char *ddebug_class_name(struct ddebug_table *dt, struct _ddebug *dp
 	struct ddebug_class_user *cli = dt->class_users;
 	int i;
 
-	for (i = 0; i < dt->num_classes; i++, map++)
+	for_each_boxed_vector(dt, classes, num_classes, i, map)
 		if (class_in_range(dp->class_id, map))
 			return map->class_names[dp->class_id - map->base];
 
-	for (i = 0; i < dt->num_class_users; i++, cli++)
+	for_each_boxed_vector(dt, class_users, num_class_users, i, cli)
 		if (class_in_range(dp->class_id, cli->map))
 			return cli->map->class_names[dp->class_id - cli->map->base];
 
@@ -1216,7 +1219,7 @@ static void ddebug_attach_module_classes(struct ddebug_table *dt, struct _ddebug
 	struct ddebug_class_map *cm;
 	int i, nc = 0;
 
-	for (i = 0, cm = di->classes; i < di->num_classes; i++, cm++) {
+	for_each_boxed_vector(di, classes, num_classes, i, cm) {
 
 		if (!strcmp(cm->mod_name, dt->mod_name)) {
 			vpr_cm_info(cm, "classes[%d]:", i);
@@ -1230,7 +1233,7 @@ static void ddebug_attach_module_classes(struct ddebug_table *dt, struct _ddebug
 	vpr_info("module:%s attached %d classes\n", dt->mod_name, nc);
 	dt->num_classes = nc;
 
-	for (i = 0, cm = dt->classes; i < dt->num_classes; i++, cm++)
+	for_each_boxed_vector(di, classes, num_classes, i, cm)
 		ddebug_apply_params(cm, cm->mod_name);
 }
 
@@ -1250,7 +1253,7 @@ static void ddebug_attach_user_module_classes(struct ddebug_table *dt,
 	 * module's refs, save to dt.  For loadables, this is the
 	 * whole array.
 	 */
-	for (i = 0, cli = di->class_users; i < di->num_class_users; i++, cli++) {
+	for_each_boxed_vector(di, class_users, num_class_users, i, cli) {
 
 		if (WARN_ON(!cli || !cli->map || !cli->user_mod_name))
 			continue;
@@ -1268,8 +1271,7 @@ static void ddebug_attach_user_module_classes(struct ddebug_table *dt,
 
 	dt->num_class_users = nc;
 
-	/* now iterate dt */
-	for (i = 0, cli = dt->class_users; i < dt->num_class_users; i++, cli++)
+	for_each_boxed_vector(di, class_users, num_class_users, i, cli)
 		ddebug_apply_params(cli->map, cli->user_mod_name);
 
 	vpr_dt_info(dt, "attach-client-module: ");
-- 
2.41.0

