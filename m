Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12D5876BA90
	for <lists+dri-devel@lfdr.de>; Tue,  1 Aug 2023 19:04:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C19510E443;
	Tue,  1 Aug 2023 17:03:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com
 [IPv6:2607:f8b0:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A90310E436;
 Tue,  1 Aug 2023 17:03:37 +0000 (UTC)
Received: by mail-ot1-x335.google.com with SMTP id
 46e09a7af769-6b9e478e122so5168234a34.1; 
 Tue, 01 Aug 2023 10:03:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690909416; x=1691514216;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=F1qxtL28qFpEv5tjq5E0J9oH4XrNxsFVniuDXF72/f4=;
 b=iY2lO+tSKTdIIpIKLeh0hvOSJa3JrjyeYoRVTnezwv4Y8WFIeqBoTrIG+12Mg+Ta2p
 kFTu77QOYHp04cNMr1qVvty3YwZ2C470s41+vnCK5dSAl1vEuqkkzBoO5MjTOlaRCFIG
 o/jTVLCDBPxewt+4Mh9SFEqHTUvYpeU6mbnRdT5IU4y9SSTlrd0f63or6qwuqpXqhMmd
 KNkgFTudXzWehq7zSSc0GrTOxb5JFXy6EvwHOxyVpF6QYM+sZ/a8KeuS69u9O664oKLP
 9rGOY8/gPm0RhQjLFs0Y0jI6Id7dWUdWs60CK/9m5WlM1VJIoPFg3B9NF2KQYDrnIvLm
 S7GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690909416; x=1691514216;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=F1qxtL28qFpEv5tjq5E0J9oH4XrNxsFVniuDXF72/f4=;
 b=fxabGGM4TnSz6Z1VcMHUNJ1JEavcLnbIG6bVx/vyC72kJomy/qH4+TRBj9Yb5y7cgQ
 OXucJt7kc3ZmYH+cfDZhKdQc/Ctjg1MxZfhrYN9+uR1e0s4/L0lFnlL0YUrRuNx4KleY
 EV4Tq8tyeuVJVEogqdDvULYCAeHnXVLaY8NFv2YX5Vg6wms+cVmjBeW26qd84j7jLcYb
 D/uNuc/OR6QWlKyywRIjsJ8lbJSQuyPZ5lgIhNWDwaYQgTD04MDYvJPQMneals3AB+fo
 HtwlzNKUgJZyfaTzm1y+qqPBq7qTdPd7Gtz707uqacYcXb93j+EiHCNhinlxP6JzWS6h
 h+UA==
X-Gm-Message-State: ABy/qLZ0415h8xfb06gvKZaEdrKv9uB0O7DV8vjm2kp+zjARcmA64GJ0
 GjWjgS3lgM+20CilBBwz28E=
X-Google-Smtp-Source: APBJJlGCYlVfv/sDt+StfVsOSfK7k0IR0izFIadz5vnVfXT7zcBrlD6BUQWkJxBa+vF5i6CF/m9PDg==
X-Received: by 2002:a05:6870:f102:b0:1bb:7e37:ff1b with SMTP id
 k2-20020a056870f10200b001bb7e37ff1bmr13869537oac.30.1690909416477; 
 Tue, 01 Aug 2023 10:03:36 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 o20-20020a02c6b4000000b0042b144abf71sm3768577jan.179.2023.08.01.10.03.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Aug 2023 10:03:36 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: daniel.vetter@ffwll.ch, daniel@ffwll.ch, jbaron@akamai.com,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Subject: [PATCH v5 15/22] dyndbg: add for_each_boxed_vector
Date: Tue,  1 Aug 2023 11:02:48 -0600
Message-ID: <20230801170255.163237-17-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230801170255.163237-1-jim.cromie@gmail.com>
References: <20230801170255.163237-1-jim.cromie@gmail.com>
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
Cc: jani.nikula@intel.com, linux@rasmusvillemoes.dk, seanpaul@chromium.org,
 joe@perches.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add a for_each iterator to walk a counted vector member in a struct
(ie the box), and use it to replace 8 open-coded loops.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 lib/dynamic_debug.c | 20 +++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index d78e48d3af1c..c4d7a70a0723 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -157,6 +157,9 @@ static void vpr_info_dq(const struct ddebug_query *query, const char *msg)
 		  _dt->num_class_users);				\
 	})
 
+#define for_each_boxed_vector(_box, _vec, _len, _ct, _curs)		\
+	for (_ct = 0, _curs = _box->_vec; _ct < _box->_len; _ct++, _curs++)
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
@@ -1053,11 +1056,11 @@ static const char *ddebug_class_name(struct ddebug_table *dt, struct _ddebug *dp
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
 
@@ -1211,7 +1214,7 @@ static void ddebug_attach_module_classes(struct ddebug_table *dt, struct _ddebug
 	struct ddebug_class_map *cm;
 	int i, nc = 0;
 
-	for (i = 0, cm = di->classes; i < di->num_classes; i++, cm++) {
+	for_each_boxed_vector(di, classes, num_classes, i, cm) {
 
 		if (!strcmp(cm->mod_name, dt->mod_name)) {
 			vpr_cm_info(cm, "classes[%d]:", i);
@@ -1224,7 +1227,7 @@ static void ddebug_attach_module_classes(struct ddebug_table *dt, struct _ddebug
 		vpr_info("module:%s attached %d classes\n", dt->mod_name, nc);
 
 	/* now iterate dt */
-	for (i = 0, cm = dt->classes; i < dt->num_classes; i++, cm++)
+	for_each_boxed_vector(di, classes, num_classes, i, cm)
 		ddebug_apply_params(cm, cm->mod_name);
 }
 
@@ -1244,7 +1247,7 @@ static void ddebug_attach_user_module_classes(struct ddebug_table *dt,
 	 * module's refs, save to dt.  For loadables, this is the
 	 * whole array.
 	 */
-	for (i = 0, cli = di->class_users; i < di->num_class_users; i++, cli++) {
+	for_each_boxed_vector(di, class_users, num_class_users, i, cli) {
 
 		if (WARN_ON(!cli || !cli->map || !cli->user_mod_name))
 			continue;
@@ -1259,8 +1262,7 @@ static void ddebug_attach_user_module_classes(struct ddebug_table *dt,
 	}
 	dt->num_class_users = nc;
 
-	/* now iterate dt */
-	for (i = 0, cli = dt->class_users; i < dt->num_class_users; i++, cli++)
+	for_each_boxed_vector(di, class_users, num_class_users, i, cli)
 		ddebug_apply_params(cli->map, cli->user_mod_name);
 
 	vpr_dt_info(dt, "attach-client-module: ");
-- 
2.41.0

