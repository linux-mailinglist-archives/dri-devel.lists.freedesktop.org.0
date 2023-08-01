Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA9EC76C113
	for <lists+dri-devel@lfdr.de>; Wed,  2 Aug 2023 01:36:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B97D10E470;
	Tue,  1 Aug 2023 23:35:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com
 [IPv6:2607:f8b0:4864:20::d2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DC4010E45D
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Aug 2023 23:35:41 +0000 (UTC)
Received: by mail-io1-xd2d.google.com with SMTP id
 ca18e2360f4ac-7835c92c373so10470239f.0
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Aug 2023 16:35:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690932941; x=1691537741;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5kt/e/wLgCgbRMxUTUpBrdXwCbogCNuBNqkZRvRSfCI=;
 b=SiKpBfWQPx8lyji53ixw+5hUNr/BNTToiTJs7S5NO9z4sH+PnZ/lWiFynqUXailpzg
 7MIQuJ+qAsCRqOGhgyYsC3arpIEuVoHS39Acs+E2Z6hY+Hk9PKqT1vn+WBrkAwvI7HGr
 wk0BGcRf67QDbTsklYVVd/bJCnKcOtN+wAIkncK75V9NHGsztSvp7unguS+wpPSwNiLA
 PP6Mk1k21EPOiNLo3NyejAF6q0qbU7eJiEMP1iPvVS63sh0y8Fmimp8dWxpDAQlGvlTM
 LOYtdSXiHQwF3IvqtJwI2o4g4ymlCGWKuZEGb/5v6bliUhMR8DaucYx7HN57i7feYh3v
 oEYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690932941; x=1691537741;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5kt/e/wLgCgbRMxUTUpBrdXwCbogCNuBNqkZRvRSfCI=;
 b=asauyjH8W6fCA2fxJ6LEHyumtvk1lJSHEbgBNI2Ii+K+x39ivP5inNF8uxrRIPgqBn
 oR0eu2QHPnsGjePsH65P6UgH+V2U42QpfimOZjOggJrbF63a8sTvvdeuaOJiQlotTke0
 H3JzxGmjVuPQCc7tuZn+fMS1Jm2PQz3d59OHZ5ZOrtw82zciH7WWyhkycQvX1TbwoO1Q
 x9LKmhnCsPpSmtA274yrK1xWxCFrXdk8+IhrAdb8Bi8GhhyTWwGhgizkqBRFYHhqIDIt
 wYUToeoCewNcAO8l5jdlrGCu1Iti7cMvCkWzyE/uasYcDcj4WJtDwIIMVcoSpfbHD9B1
 kSqg==
X-Gm-Message-State: ABy/qLb6rayJxZpJjKkmq52M0WzFiiaEfL7nmDxulJHDH/3F6Btqq1+4
 psnQJgNu95W1koQAJtSevA8Wt7bNyC0xJg==
X-Google-Smtp-Source: APBJJlFisO1xnwX0PeSlNzBFez940nr3CMrhsD3Ot8SLHHRjIblT/oJ3YLRhljXj1uO4q1YD1lgE9g==
X-Received: by 2002:a05:6e02:547:b0:348:797d:169e with SMTP id
 i7-20020a056e02054700b00348797d169emr14497727ils.1.1690932940716; 
 Tue, 01 Aug 2023 16:35:40 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 t13-20020a92ca8d000000b00348d652a6b4sm4157967ilo.48.2023.08.01.16.35.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Aug 2023 16:35:40 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, daniel.vetter@ffwll.ch, dri-devel@lists.freedesktop.org
Subject: [PATCH v5 15/23] dyndbg: add for_each_boxed_vector
Date: Tue,  1 Aug 2023 17:35:02 -0600
Message-ID: <20230801233515.166971-17-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230801233515.166971-1-jim.cromie@gmail.com>
References: <20230801233515.166971-1-jim.cromie@gmail.com>
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

Add a for_each iterator to walk a counted vector member in a struct
(ie the box), and use it to replace 8 open-coded loops.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
v5- parens-on-box-force-precedence
---
 lib/dynamic_debug.c | 20 +++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index e10fe6ed29cc..63cf14dc3e9f 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -157,6 +157,9 @@ static void vpr_info_dq(const struct ddebug_query *query, const char *msg)
 		  _dt->num_class_users);				\
 	})
 
+#define for_each_boxed_vector(_box, _vec, _len, _ct, _curs)		\
+	for (_ct = 0, _curs = (_box)->_vec; _ct < (_box)->_len; _ct++, _curs++)
+
 #define __outvar /* filled by callee */
 static struct ddebug_class_map *ddebug_find_valid_class(struct ddebug_table const *dt,
 							const char *class_string,
@@ -166,7 +169,7 @@ static struct ddebug_class_map *ddebug_find_valid_class(struct ddebug_table cons
 	struct ddebug_class_user *cli;
 	int i, idx;
 
-	for (i = 0, map = dt->classes; i < dt->num_classes; i++, map++) {
+	for_each_boxed_vector(dt, classes, num_classes, i, map) {
 		idx = match_string(map->class_names, map->length, class_string);
 		if (idx >= 0) {
 			*class_id = idx + map->base;
@@ -174,7 +177,7 @@ static struct ddebug_class_map *ddebug_find_valid_class(struct ddebug_table cons
 			return map;
 		}
 	}
-	for (i = 0, cli = dt->class_users; i < dt->num_class_users; i++, cli++) {
+	for_each_boxed_vector(dt, class_users, num_class_users, i, cli) {
 		idx = match_string(cli->map->class_names, cli->map->length, class_string);
 		if (idx >= 0) {
 			*class_id = idx + cli->map->base;
@@ -1054,11 +1057,11 @@ static const char *ddebug_class_name(struct ddebug_table *dt, struct _ddebug *dp
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
 
@@ -1212,7 +1215,7 @@ static void ddebug_attach_module_classes(struct ddebug_table *dt, struct _ddebug
 	struct ddebug_class_map *cm;
 	int i, nc = 0;
 
-	for (i = 0, cm = di->classes; i < di->num_classes; i++, cm++) {
+	for_each_boxed_vector(di, classes, num_classes, i, cm) {
 
 		if (!strcmp(cm->mod_name, dt->mod_name)) {
 			vpr_cm_info(cm, "classes[%d]:", i);
@@ -1225,7 +1228,7 @@ static void ddebug_attach_module_classes(struct ddebug_table *dt, struct _ddebug
 		vpr_info("module:%s attached %d classes\n", dt->mod_name, nc);
 
 	/* now iterate dt */
-	for (i = 0, cm = dt->classes; i < dt->num_classes; i++, cm++)
+	for_each_boxed_vector(di, classes, num_classes, i, cm)
 		ddebug_apply_params(cm, cm->mod_name);
 }
 
@@ -1245,7 +1248,7 @@ static void ddebug_attach_user_module_classes(struct ddebug_table *dt,
 	 * module's refs, save to dt.  For loadables, this is the
 	 * whole array.
 	 */
-	for (i = 0, cli = di->class_users; i < di->num_class_users; i++, cli++) {
+	for_each_boxed_vector(di, class_users, num_class_users, i, cli) {
 
 		if (WARN_ON(!cli || !cli->map || !cli->user_mod_name))
 			continue;
@@ -1260,8 +1263,7 @@ static void ddebug_attach_user_module_classes(struct ddebug_table *dt,
 	}
 	dt->num_class_users = nc;
 
-	/* now iterate dt */
-	for (i = 0, cli = dt->class_users; i < dt->num_class_users; i++, cli++)
+	for_each_boxed_vector(di, class_users, num_class_users, i, cli)
 		ddebug_apply_params(cli->map, cli->user_mod_name);
 
 	vpr_dt_info(dt, "attach-client-module: ");
-- 
2.41.0

