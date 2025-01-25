Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 535B4A1C160
	for <lists+dri-devel@lfdr.de>; Sat, 25 Jan 2025 07:47:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62BFE10E2C3;
	Sat, 25 Jan 2025 06:47:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="g75/UTEp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f45.google.com (mail-io1-f45.google.com
 [209.85.166.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6127D10E120;
 Sat, 25 Jan 2025 06:46:57 +0000 (UTC)
Received: by mail-io1-f45.google.com with SMTP id
 ca18e2360f4ac-844ce6d0716so215094939f.1; 
 Fri, 24 Jan 2025 22:46:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737787616; x=1738392416; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4426qb3gIsTZka2SxcS2AqXLzVLPKaaERHnBDYOLWSA=;
 b=g75/UTEphoKyiJ8Z8X3Yne7KBOgxmZFkAFx3aX67VQ+W1ybrMxPDFMl10TtCsloGz5
 m2a8UBy31HaIAI+pQ+bHDZU9EKOAkin7M4pUGhRwKyVCZr+Lvp/mKn2r2nUvqHP8ovqg
 XVaakPQVtiBoyze1x/h1WpZYIyCt/0L4XSycmvKYN/iM20vuK7FLuerivQHUf283cLHR
 EyT2Lty66pMgEvbVxLOMGyH25oqKzsFSNVvvD3B51IAPw7hFAlLey2rBAsKxGCdy+1Zy
 VS92dGv/p09PxR5swatj87F0KVPhmMYupaOVMFAuo1JAD0sSRjzTk8sb+/QAuFXlxTS0
 NYqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737787616; x=1738392416;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4426qb3gIsTZka2SxcS2AqXLzVLPKaaERHnBDYOLWSA=;
 b=w6a82B7M2Hb6/plnngcM8zkZCz7nOEAkVL1+HgdS+2ZuYWjJTvTGo3laQKDW8dfXf/
 7OY59QVnJ3F1cYPCfOsQ5wf3bi/8uTwZ7B5SUpBFWhUSh1F/BWpcDll/RM3VFJpINSZo
 FZGurnkVtKntlDeUi/rZuPyAco6f5nm5nYG0Bx6l3zinV+mx/35LctMSnvCfBUQgJNYl
 cwCH9INUT01KaIjcEsag7SYoGD3Dw6QmML1kb3dL8z5JISKa6AQr1+kGSUruoFSs7Da3
 SwydzWAX9RiA1zbDrbl70zZwqv4pEaY+5JYU2kllAfh9ufUrlSskRzBo946zm1pp57CN
 z8Pw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVH8rqyjqnQFpe4Ouo++bJ0ASgC3IJsq0I1oyTTzTI2mmprbI2gqgOZNYb2EU1OFOidVG0xZE5ZGKsTdiFgSg==@lists.freedesktop.org,
 AJvYcCVW+9Ftkv3SIpMxAgipmrvONeaisuwiv2xKD+aPbVJH2zAX5sTXM/hUZoVmFD9/vSmGlASDmG+F@lists.freedesktop.org,
 AJvYcCVtQ/Ikdjd46OMDM4kPRiJigsvGhuO+q6a7NWp3G/xzPSHbRbQ7MUpVQPZU5Jx6bPCnIjPk+ZwQOOjv@lists.freedesktop.org,
 AJvYcCXhOlOleWPRqPZYmpAhKj5A3IrQoKfhq05sRKUq6JhBAwBz9p4vTckqvR0+fQ2jNstz0ejJsG6wnpX1@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwNYRerLC7GLE16bJPglCYNbE0JPwvvGYGcRgXOvBo6hHWnKVgi
 XoF2QwEgiEUw1LsOS+yGHS2wdYTNTHFLC5Wv9918vfEWt+jM5RsS
X-Gm-Gg: ASbGncuJPzpTkQcgjYMlsvRszrCO/uFgAKaKMF8Ah52llw9KtqkhzotLfbBQA/M7vyv
 G1HhRmTEyDIe+TLSg7gRfzSbut+ytoDaLJSh0wg59vcQ4x8R3XMYhz4D03/vZVokyTtuhfrRe9z
 geY7f8UF8jqhHRIDg4ZGd6peBcgc7LXO6s+Nmj+FPol5pSjvNOJjgrrD/XpuLqwv00uZ2sis+r8
 HFyi9lYpzq1tcpW6DROFpaFfHJC4KEHEzKyDsQks7Obz9ZuN6ue2t+7Zh12K/slCdDxX7tReFS0
 Yoyqp8SyHOxIsJxUGyD8eOT2sO6Dph9CkNCHBCbph8MTwBGA
X-Google-Smtp-Source: AGHT+IHPcwCIcEeaDfvcsC8Y0hmazgAlIp69PtLu+D2gBA3Q65N9zrEn328wJ16fD3PoHPmaHxXlww==
X-Received: by 2002:a05:6602:2d91:b0:835:4cb5:4fa7 with SMTP id
 ca18e2360f4ac-851b62b1c79mr3161173639f.12.1737787616655; 
 Fri, 24 Jan 2025 22:46:56 -0800 (PST)
Received: from gandalf.. (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
 by smtp.googlemail.com with ESMTPSA id
 8926c6da1cb9f-4ec1da476fesm1174144173.58.2025.01.24.22.46.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jan 2025 22:46:56 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, jbaron@akamai.com,
 gregkh@linuxfoundation.org, ukaszb@chromium.org
Cc: intel-gfx-trybot@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, daniel.vetter@ffwll.ch,
 tvrtko.ursulin@linux.intel.com, jani.nikula@intel.com,
 ville.syrjala@linux.intel.com, Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH 18/63] dyndbg: add/use for_subvec() to reduce boilerplate
Date: Fri, 24 Jan 2025 23:45:32 -0700
Message-ID: <20250125064619.8305-19-jim.cromie@gmail.com>
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

add for_subvec() macro to encapsulate a for-loop pattern thats used
repeatedly to iterate over a boxed.vector of N elements.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 lib/dynamic_debug.c | 30 ++++++++++++++++++++++--------
 1 file changed, 22 insertions(+), 8 deletions(-)

diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index 6bca0c6727d4..08b6e4e7489f 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -158,20 +158,34 @@ static void vpr_info_dq(const struct ddebug_query *query, const char *msg)
 		  _dt->num_class_users);				\
 	})
 
+/*
+ * simplify a repeated for-loop pattern walking N steps in a T _vec
+ * member inside a struct _box.  It expects int i and T *_sp to be
+ * declared in the caller.
+ * @_i:  caller provided counter.
+ * @_sp: cursor into _vec, to examine each item.
+ * @_box: ptr to a struct containing @_vec member
+ * @_vec: name of a sub-struct member in _box, with array-ref and length
+ */
+#define for_subvec(_i, _sp, _box, _vec)				       \
+	for ((_i) = 0, (_sp) = (_box)->_vec;			       \
+	     (_i) < (_box)->num_##_vec;				       \
+	     (_i)++, (_sp)++)
+
 static int ddebug_find_valid_class(struct ddebug_table const *dt, const char *class_string)
 {
 	struct ddebug_class_map *map;
 	struct ddebug_class_user *cli;
 	int i, idx;
 
-	for (i = 0, map = dt->classes; i < dt->num_classes; i++, map++) {
+	for_subvec(i, map, dt, classes) {
 		idx = match_string(map->class_names, map->length, class_string);
 		if (idx >= 0) {
 			vpr_dt_info(dt, "good-class: %s.%s ", map->mod_name, class_string);
 			return idx + map->base;
 		}
 	}
-	for (i = 0, cli = dt->class_users; i < dt->num_class_users; i++, cli++) {
+	for_subvec(i, cli, dt, class_users) {
 		idx = match_string(cli->map->class_names, cli->map->length, class_string);
 		if (idx >= 0) {
 			vpr_dt_info(dt, "class-ref: %s -> %s.%s ",
@@ -1190,7 +1204,7 @@ static void ddebug_apply_params(const struct ddebug_class_map *cm, const char *m
 	if (cm->mod) {
 		vpr_cm_info(cm, "loaded classmap: %s", modnm);
 		/* ifdef protects the cm->mod->kp deref */
-		for (i = 0, kp = cm->mod->kp; i < cm->mod->num_kp; i++, kp++)
+		for_subvec(i, kp, cm->mod, kp)
 			ddebug_match_apply_kparam(kp, cm, modnm);
 	}
 #endif
@@ -1212,7 +1226,7 @@ static void ddebug_attach_module_classes(struct ddebug_table *dt,
 	struct ddebug_class_map *cm;
 	int i, nc = 0;
 
-	for (i = 0, cm = di->classes; i < di->num_classes; i++, cm++) {
+	for_subvec(i, cm, di, classes) {
 		if (!strcmp(cm->mod_name, dt->mod_name)) {
 			vpr_cm_info(cm, "classes[%d]:", i);
 			if (!nc++)
@@ -1225,7 +1239,7 @@ static void ddebug_attach_module_classes(struct ddebug_table *dt,
 	vpr_info("module:%s attached %d classes\n", dt->mod_name, nc);
 	dt->num_classes = nc;
 
-	for (i = 0, cm = dt->classes; i < dt->num_classes; i++, cm++)
+	for_subvec(i, cm, dt, classes)
 		ddebug_apply_params(cm, cm->mod_name);
 }
 
@@ -1245,7 +1259,7 @@ static void ddebug_attach_user_module_classes(struct ddebug_table *dt,
 	 * module's refs, save to dt.  For loadables, this is the
 	 * whole array.
 	 */
-	for (i = 0, cli = di->class_users; i < di->num_class_users; i++, cli++) {
+	for_subvec(i, cli, di, class_users) {
 		if (WARN_ON_ONCE(!cli || !cli->map || !cli->mod_name))
 			continue;
 		if (!strcmp(cli->mod_name, dt->mod_name)) {
@@ -1261,7 +1275,7 @@ static void ddebug_attach_user_module_classes(struct ddebug_table *dt,
 	dt->num_class_users = nc;
 
 	/* now iterate dt */
-	for (i = 0, cli = dt->class_users; i < dt->num_class_users; i++, cli++)
+	for_subvec(i, cli, di, class_users)
 		ddebug_apply_params(cli->map, cli->mod_name);
 
 	vpr_dt_info(dt, "attach-client-module: ");
@@ -1299,7 +1313,7 @@ static int ddebug_add_module(struct _ddebug_info *di, const char *modname)
 
 	INIT_LIST_HEAD(&dt->link);
 
-	for (i = 0, iter = di->descs; i < di->num_descs; i++, iter++)
+	for_subvec(i, iter, di, descs)
 		if (iter->class_id != _DPRINTK_CLASS_DFLT)
 			class_ct++;
 
-- 
2.48.1

