Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D829A6AD9B
	for <lists+dri-devel@lfdr.de>; Thu, 20 Mar 2025 19:53:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F57910E6A9;
	Thu, 20 Mar 2025 18:53:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Hb38ITGF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f46.google.com (mail-io1-f46.google.com
 [209.85.166.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B769610E69E;
 Thu, 20 Mar 2025 18:53:29 +0000 (UTC)
Received: by mail-io1-f46.google.com with SMTP id
 ca18e2360f4ac-85da5a3667bso37825039f.1; 
 Thu, 20 Mar 2025 11:53:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742496809; x=1743101609; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=miAnMW+G7+NaoZuEayKbHBb91/weN+swVxu5PtIC79I=;
 b=Hb38ITGFB3xPAedBDBm01DNAO8RKjqTGNKHLfe1r8wgUKUpCgBHTEHQmJpx9+Quizc
 xiYYKr9tWRAjWaUHV2NZjaoyS1HSXnA2e1eJqCL5LA/dEktScFuJ5F94Q4H2L5ZBR381
 ZB2zP5QvPFltLBN4Fi15Wn03nb4PgRQ26IX2o5u5sTMKbqRrQfWLugAErSarW1fsKkvz
 Ael1ysHGtfG7QV3RUKOengXfhXdq0Nadb/Wc7bml7TRVvuElXpUixT2hbxVv9xtxQt1Z
 gx7XJL4uHkc8BKfw0MK1Fw94ynL5mldPu4UIUSe3mO56PaafEakI9EZWRgBR3leqEyOS
 0NBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742496809; x=1743101609;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=miAnMW+G7+NaoZuEayKbHBb91/weN+swVxu5PtIC79I=;
 b=jYaktK0tD3RMpmwr6QeGmkdHg8QsLBlvJRaKCpv5VCQGXZmPkAAZJjxPPHtvMLpraA
 ck6hvmcPljL+VOwU6d8b1PiP9wd1IX3QAYsA6I3R7VAuJBZJrgWexn21R+NCPsceXel7
 J0slu4kCAVck2KRKsyDBOPnk+ptaky/PNn6PbU5Ivvv+ql7TGZTybrVtiRMHYsrFw4h9
 bd5Ks8fDRSePOzYjJoiV5pz+tPb/ZVdtTsWCa/B7WBb1MC5EUGLcQGqpIO/hM8KtlfPm
 dBKtPeut4X64R8ZTF+8BEltSq4eHlgsPd1y1l2Xuef/3ybYQKkArRaSsLNRxc5s1GzC1
 shxA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVBI0B66tq3ufhymG0zhTgLPhojpvHsDZBrVApTfzif81kKDBCVd6RY1py20OfiBNIzMTkn5bDnc5XrF6WvmA==@lists.freedesktop.org,
 AJvYcCVJoGIlP/RLCD+mAJpc7WokZ/ENk1le9MuTiRs0TG+WFCG8FFZxU/BwJBdTvCZZ5WSsZUbFCI86CQzm@lists.freedesktop.org,
 AJvYcCVoqrDLNKInECbdw0UIH65zr4WNOXruO1D78kAqR5Mim7lBLaHRlXUorIMiLBjKMoT7nS521VTA7apB134FmKhagA==@lists.freedesktop.org,
 AJvYcCWwCpcizeSG7145uUPXMCUMVfwWBlTPhgaIpM6gU7S0pR3vxzQKE5uRXllTfSlSaXrW7O9O6/w6Aft/@lists.freedesktop.org,
 AJvYcCXdcyoLchuau4lcX+pZauTnIuSPh4w+bkDLFTvFmw5ohGCvP/r1o5RwZgJMCxGVIEUUqz0rhYXh@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzBQv1d9kPzKsSPEMIwVHpvd5SoyIrQHkxlqTGffqQ2145SmrDT
 fIoy0YaMNggxHnZcJMyE8o0uvJkrTeqO3i7r/QU0oKJNKsJac8d9
X-Gm-Gg: ASbGncuEeGApqSVV/4XTIG7s7hfXc2K3RsoyH00meCcjiTIoobkYs5iZpJ9seYPs7B8
 s30rSSX48PbC2f2XAuX2LfFm9HFxcim96kYjWx777B+MgzDeUff2u5q7GzEiNeVGP+/vUru4QCZ
 eo6eb/RTPQtGLoeKbwCxNg1sFPQuhMzYuYXMhv3dzcEBP+2rwFVwMzUG9fZgJ1JQoRchni/pWfV
 P1wAynUJQrmtPFV58pAc1h+2+i4VrCWoVWlAUZHFUsGuRC/weR3f1JxlBH2tufA+G4gyBHDqH5T
 3L8VUy5X5yp9j+YySQAIFyN/z5sTO4Vu6UOkFW+6n0wuyv3HR0/r7Ow2c575u9Kl3jIwh8KpPOU
 VyQ==
X-Google-Smtp-Source: AGHT+IH8NGUJWZDIAw9cJiX8xKNRxEy2HrBp//+fKWV20TsAyodyKB+bj0tCWt8XGY6BDeLYkZ+T1g==
X-Received: by 2002:a05:6602:488b:b0:85e:1879:c708 with SMTP id
 ca18e2360f4ac-85e2ca388bbmr48595939f.1.1742496808909; 
 Thu, 20 Mar 2025 11:53:28 -0700 (PDT)
Received: from gandalf.. (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
 by smtp.googlemail.com with ESMTPSA id
 ca18e2360f4ac-85e2bc273e7sm7078039f.17.2025.03.20.11.53.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Mar 2025 11:53:28 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-gfx-trybot@lists.freedesktop.org
Cc: jbaron@akamai.com, gregkh@linuxfoundation.org, ukaszb@chromium.org,
 louis.chauvet@bootlin.com, daniel.vetter@ffwll.ch,
 tvrtko.ursulin@linux.intel.com, jani.nikula@intel.com,
 ville.syrjala@linux.intel.com, Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v2 23/59] dyndbg: move .mod_name from/to structs
 ddebug_table/_ddebug_info
Date: Thu, 20 Mar 2025 12:52:01 -0600
Message-ID: <20250320185238.447458-24-jim.cromie@gmail.com>
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

struct _ddebug_info already has almost all dyndbg's info for a module,
so finish the encapsulation.  This puts the datum closer to where its
needed, improving the chance that we can obsolete the _ddebug.modame
field with a desc_modname(dp) accessor fn.

In static ddebug_add_module(&_ddebug_info_cursor..), force the
cursor-model by dropping the modname arg, and setting it explicitly
into the cursor before the 3 calls to it.

struct ddebug_table only uses .mod_name when applying >control
changes, and it has a _ddebug_info member anyway, so it keeps access
to the field, just with a different offset.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 include/linux/dynamic_debug.h |  1 +
 lib/dynamic_debug.c           | 41 ++++++++++++++++++-----------------
 2 files changed, 22 insertions(+), 20 deletions(-)

diff --git a/include/linux/dynamic_debug.h b/include/linux/dynamic_debug.h
index 03a83a83b621..8043966a0fd6 100644
--- a/include/linux/dynamic_debug.h
+++ b/include/linux/dynamic_debug.h
@@ -198,6 +198,7 @@ struct _ddebug_class_users {
 } __packed;
 
 struct _ddebug_info {
+	const char *mod_name;
 	struct _ddebug_descs descs;
 	struct _ddebug_class_maps maps;
 	struct _ddebug_class_users users;
diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index 3c9fb8324ad6..cd3eec5bb81c 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -49,7 +49,6 @@ extern struct _ddebug_class_user __stop___dyndbg_class_users[];
 
 struct ddebug_table {
 	struct list_head link;
-	const char *mod_name;
 	struct _ddebug_info info;
 };
 
@@ -166,7 +165,7 @@ static void vpr_info_dq(const struct ddebug_query *query, const char *msg)
 #define vpr_dt_info(dt_p, msg_p, ...) ({				\
 	struct ddebug_table const *_dt = dt_p;				\
 	v2pr_info(msg_p " module:%s nd:%d nc:%d nu:%d\n", ##__VA_ARGS__, \
-		  _dt->mod_name, _dt->info.descs.len, _dt->info.maps.len, \
+		  _dt->info.mod_name, _dt->info.descs.len, _dt->info.maps.len, \
 		  _dt->info.users.len);					\
 	})
 
@@ -215,7 +214,7 @@ static int ddebug_change(const struct ddebug_query *query, struct flag_settings
 
 		/* match against the module name */
 		if (query->module &&
-		    !match_wildcard(query->module, dt->mod_name))
+		    !match_wildcard(query->module, dt->info.mod_name))
 			continue;
 
 		if (query->class_string) {
@@ -283,7 +282,7 @@ static int ddebug_change(const struct ddebug_query *query, struct flag_settings
 #endif
 			v4pr_info("changed %s:%d [%s]%s %s => %s\n",
 				  trim_prefix(dp->filename), dp->lineno,
-				  dt->mod_name, dp->function,
+				  dt->info.mod_name, dp->function,
 				  ddebug_describe_flags(dp->flags, &fbuf),
 				  ddebug_describe_flags(newflags, &nbuf));
 			dp->flags = newflags;
@@ -1123,7 +1122,7 @@ static int ddebug_proc_show(struct seq_file *m, void *p)
 
 	seq_printf(m, "%s:%u [%s]%s =%s \"",
 		   trim_prefix(dp->filename), dp->lineno,
-		   iter->table->mod_name, dp->function,
+		   iter->table->info.mod_name, dp->function,
 		   ddebug_describe_flags(dp->flags, &flags));
 	seq_escape_str(m, dp->format, ESCAPE_SPACE, "\t\r\n\"");
 	seq_putc(m, '"');
@@ -1283,7 +1282,7 @@ static void ddebug_apply_class_users(const struct ddebug_table *dt)
 #define dd_mark_vector_subrange(_i, _dst, _sp, _box, _vec) ({	\
 	int nc = 0;							\
 	for_subvec(_i, _sp, _box, _vec) {				\
-		if (!strcmp((_sp)->mod_name, (_dst)->mod_name)) {	\
+		if (!strcmp((_sp)->mod_name, (_dst)->info.mod_name)) {	\
 			if (!nc++)					\
 				(_dst)->info._vec.start = (_sp);	\
 		} else {						\
@@ -1314,7 +1313,7 @@ ddebug_class_range_overlap(struct _ddebug_class_map *cm,
  * Allocate a new ddebug_table for the given module
  * and add it to the global list.
  */
-static int ddebug_add_module(struct _ddebug_info *di, const char *modname)
+static int ddebug_add_module(struct _ddebug_info *di)
 {
 	struct ddebug_table *dt;
 	struct _ddebug_class_map *cm;
@@ -1325,20 +1324,19 @@ static int ddebug_add_module(struct _ddebug_info *di, const char *modname)
 	if (!di->descs.len)
 		return 0;
 
-	v3pr_info("add-module: %s %d sites\n", modname, di->descs.len);
+	v3pr_info("add-module: %s %d sites\n", di->mod_name, di->descs.len);
 
 	dt = kzalloc(sizeof(*dt), GFP_KERNEL);
 	if (dt == NULL) {
-		pr_err("error adding module: %s\n", modname);
+		pr_err("error adding module: %s\n", di->mod_name);
 		return -ENOMEM;
 	}
 	/*
-	 * For built-in modules, name lives in .rodata and is
-	 * immortal. For loaded modules, name points at the name[]
-	 * member of struct module, which lives at least as long as
-	 * this struct ddebug_table.
+	 * For built-in modules, name (as supplied in di by its
+	 * callers) lives in .rodata and is immortal. For loaded
+	 * modules, name points at the name[] member of struct module,
+	 * which lives at least as long as this struct ddebug_table.
 	 */
-	dt->mod_name = modname;
 	dt->info = *di;
 
 	INIT_LIST_HEAD(&dt->link);
@@ -1368,10 +1366,10 @@ static int ddebug_add_module(struct _ddebug_info *di, const char *modname)
 	if (dt->info.users.len)
 		ddebug_apply_class_users(dt);
 
-	vpr_info("%3u debug prints in module %s\n", di->descs.len, modname);
+	vpr_info("%3u debug prints in module %s\n", di->descs.len, di->mod_name);
 	return 0;
 cleanup:
-	WARN_ONCE("dyndbg multi-classmap conflict in %s\n", modname);
+	WARN_ONCE("dyndbg multi-classmap conflict in %s\n", di->mod_name);
 	kfree(dt);
 	return -EINVAL;
 
@@ -1436,7 +1434,7 @@ static int ddebug_remove_module(const char *mod_name)
 
 	mutex_lock(&ddebug_lock);
 	list_for_each_entry_safe(dt, nextdt, &ddebug_tables, link) {
-		if (dt->mod_name == mod_name) {
+		if (dt->info.mod_name == mod_name) {
 			ddebug_table_free(dt);
 			ret = 0;
 			break;
@@ -1456,7 +1454,8 @@ static int ddebug_module_notify(struct notifier_block *self, unsigned long val,
 
 	switch (val) {
 	case MODULE_STATE_COMING:
-		ret = ddebug_add_module(&mod->dyndbg_info, mod->name);
+		mod->dyndbg_info.mod_name = mod->name;
+		ret = ddebug_add_module(&mod->dyndbg_info);
 		if (ret)
 			WARN(1, "Failed to allocate memory: dyndbg may not work properly.\n");
 		break;
@@ -1556,7 +1555,8 @@ static int __init dynamic_debug_init(void)
 			mod_ct++;
 			di.descs.len = mod_sites;
 			di.descs.start = iter_mod_start;
-			ret = ddebug_add_module(&di, modname);
+			di.mod_name = modname;
+			ret = ddebug_add_module(&di);
 			if (ret)
 				goto out_err;
 
@@ -1567,7 +1567,8 @@ static int __init dynamic_debug_init(void)
 	}
 	di.descs.len = mod_sites;
 	di.descs.start = iter_mod_start;
-	ret = ddebug_add_module(&di, modname);
+	di.mod_name = modname;
+	ret = ddebug_add_module(&di);
 	if (ret)
 		goto out_err;
 
-- 
2.49.0

