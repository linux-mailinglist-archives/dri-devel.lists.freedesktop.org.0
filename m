Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4066529407
	for <lists+dri-devel@lfdr.de>; Tue, 17 May 2022 00:57:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DEE610E9A2;
	Mon, 16 May 2022 22:57:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x12f.google.com (mail-il1-x12f.google.com
 [IPv6:2607:f8b0:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95F2D10E8CF;
 Mon, 16 May 2022 22:57:08 +0000 (UTC)
Received: by mail-il1-x12f.google.com with SMTP id s6so6758330ilp.9;
 Mon, 16 May 2022 15:57:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FCcwbojewkLsQYvkUKvi9ZnuSdibkB/9h3rl9AlklQ0=;
 b=BeGrZc1yYBGXRQAvCajroJY45Q74LlURa0Ayje5jv28R3leJsPJbbYx/29IHtflt0j
 snhm4cXg8IF3NJ9cpM7XtI9fLxm4NYgdEPjk4txQ8yQVjk2+O7jljjqETHuZUwtJDsm5
 xWAXYRuk38aNOHxOcKllwLmeH+zvd7FACklgZhNSsZ79osTKBjvhiXgVclwoZqc2bpjE
 yelTlxzX/Ql/41MYJXeVU+/+QDchf/5JfDBfBDt4HwmxBYj1dPE0ut/Ixz0jldDIZRKo
 1zhjm7O4XnQNVRj1apdu3bYwT5J19T4lgLOKFIY25c2+q1MCCblGLIfqkzd5MTcbODwR
 soNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FCcwbojewkLsQYvkUKvi9ZnuSdibkB/9h3rl9AlklQ0=;
 b=wOn5ctlHbvyR6FujVVEZy9N1gy0AeY8qm8Cr6tWq1HWkS2G8YYeUyBKypoFcBaDE9U
 b1eFarl3k2UXU+Vf4897fCFijXTefof0QSNe6iDNJuZdzV/qWHErKPRs5iXrTyNOOklX
 kwOerK0S4uu3wsiCJTsBY05eB9t0JosJm3cFcCBBSwf9u/5ZqGk9CLJegItvgdQHoENz
 PlSRJ37qlGUVV44PvWHz1CHensoZg2ArFqKGR6TqSPR1c7/UOyKE75YAqxu9KnBzX3ai
 43zwUmt5Pp5q4JQizNkeyUlRZGnp55ItWfUVYOyu2X4pDVTZIURAEJKfwrTZDlc2bBKk
 nMjw==
X-Gm-Message-State: AOAM531QWPo8YDTLP/3nzzLn1DSiqaGLIdc+j4ePHgcZ6T7xEhdfU1Bu
 Tc1knGm+R7U++uxBcc7THVM=
X-Google-Smtp-Source: ABdhPJxVb768sz14W3aG69KflgqJ0KKyFVj6N0LZ3gnkCyX1Snc1VgNcUxaQiUqGSGOvtt6QMgsJEA==
X-Received: by 2002:a05:6e02:1187:b0:2cd:9df5:bfd2 with SMTP id
 y7-20020a056e02118700b002cd9df5bfd2mr11169744ili.121.1652741827704; 
 Mon, 16 May 2022 15:57:07 -0700 (PDT)
Received: from frodo.hsd1.co.comcast.net ([2601:284:8204:2010::dd9f])
 by smtp.googlemail.com with ESMTPSA id
 k26-20020a02661a000000b0032b74686763sm3133949jac.76.2022.05.16.15.57.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 15:57:07 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 06/27] dyndbg: add dynamic_debug_(un)register_classes
Date: Mon, 16 May 2022 16:56:19 -0600
Message-Id: <20220516225640.3102269-7-jim.cromie@gmail.com>
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

Add dynamic_debug_register_classes() to API, allowing user modules
(builtin and loadable) to register class_names for the .class_id's
they are using.  Knowing classes is 1st step to validating with them.
Add dynamic_debug_unregister_classes() also.

Add struct ddebug_known_classes_map: maps known class_name strings to
.class_id[0..N], where N<31.  .base allows sharing of that range.

A wrapper macro: DYNAMIC_DEBUG_CLASSES(_var, _modmatch, _base,
classes) defines and initializes that struct var, _maybe_unused is
added so the decl doesn't draw warnings when dyndbg is not enabled; a
small list of classnames is tolerable wasted space.

_var: user passes this into dynamic_debug_register_classes(var).

_base: usually 0, it allows splitting 31 classes into subranges, so
that multiple sysfs-nodes can share the module's class-id space.

classes: list of strings with classnames, mapped to class-id=idx(+_base)

mod_name: KBUILD_MODNAME, available for builtins, loadables
mod:	  ref to loadable module. allows ==, distinguishing loadables.

When modules register known classnames, they opt-in to permit dyndbg
to allow "class <name>" queries to manipulate their class'd pr_debugs
(if any), default class_id pr_debugs are still controllable as before.

dynamic_debug_register_classes(&map) finds the module's ddebug_table
record, and attaches the map to it.  This makes it available to
ddebug_change(), which will use it to validate class'd commands.

Sharing class-names across multiple modules is how those modules
coordinate; all drm* and drivers would respond to:

  #> echo class DRM_UT_CORE +p > /proc/dynamic_debug/control

Therefore no class-name uniqueness check is useful.

TODO: Eventually we need a list of registered classes, not just the
zero-or-one implemented here.  This will support multiple sysfs-nodes,
one each for print-to-syslog, print-to-tracefs, or subranges using
_base.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
. fix register_classes() for !CONFIG_MODULES
. add maybe-unused to var decl in DYNAMIC_DEBUG_CLASSES
. kdoc for DYNAMIC_DEBUG_CLASSES
. add dynamic_debug_unregister_classes
---
 include/linux/dynamic_debug.h | 36 ++++++++++++++++++++++++
 lib/dynamic_debug.c           | 53 +++++++++++++++++++++++++++++++++++
 2 files changed, 89 insertions(+)

diff --git a/include/linux/dynamic_debug.h b/include/linux/dynamic_debug.h
index 39550fefcf0f..328722ba2d8e 100644
--- a/include/linux/dynamic_debug.h
+++ b/include/linux/dynamic_debug.h
@@ -56,6 +56,34 @@ struct _ddebug {
 #endif
 } __attribute__((aligned(8)));
 
+struct ddebug_known_classes_map {
+	struct list_head link;
+	struct module *mod;
+	const char *mod_name;	/* needed for builtins */
+	const int base;		/* index of 1st .class_id, allows split/shared space */
+	const int length;
+	const char *classes[];	/* index maps .class_id */
+};
+
+#define NUM_TYPE_ARGS(eltype, ...) \
+	(sizeof((eltype[]) {__VA_ARGS__}) / sizeof(eltype))
+/**
+ * DYNAMIC_DEBUG_CLASSES - declare classnames known by a module
+ * @_var: passed to dynamic_debug_register_classes(_var)
+ * @_base: offset of 1st class-name. splits .class_id space
+ * @classes: class-names known/used by of .class_ids[_base.._base+length]
+ *
+ * @classes specifies names for the classids used by a module; dyndbg
+ * accepts "class <name>" commands if <name> is known and registered.
+ */
+#define DYNAMIC_DEBUG_CLASSES(_var, _base, ...)				\
+	static __maybe_unused struct ddebug_known_classes_map _var = {	\
+		.mod = THIS_MODULE,					\
+		.mod_name = KBUILD_MODNAME,				\
+		.base = _base,						\
+		.length = NUM_TYPE_ARGS(char*, __VA_ARGS__),		\
+		.classes = { __VA_ARGS__ }				\
+	}
 
 
 #if defined(CONFIG_DYNAMIC_DEBUG_CORE)
@@ -206,6 +234,9 @@ void __dynamic_ibdev_dbg(struct _ddebug *descriptor,
 				   KERN_DEBUG, prefix_str, prefix_type,	\
 				   rowsize, groupsize, buf, len, ascii)
 
+int  dynamic_debug_register_classes(struct ddebug_known_classes_map *map);
+void dynamic_debug_unregister_classes(struct ddebug_known_classes_map *map);
+
 #else /* !CONFIG_DYNAMIC_DEBUG_CORE */
 
 #include <linux/string.h>
@@ -247,6 +278,11 @@ static inline int ddebug_dyndbg_module_param_cb(char *param, char *val,
 	} while (0)
 
 
+static inline int dynamic_debug_register_classes(const struct ddebug_known_classes_map *map)
+{ return 0; }
+static inline void dynamic_debug_unregister_classes(struct ddebug_known_classes_map *map)
+{}
+
 #endif /* !CONFIG_DYNAMIC_DEBUG_CORE */
 
 #endif
diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index cdc0b03b1148..8f600c13048a 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -45,6 +45,8 @@ extern struct _ddebug __stop___dyndbg[];
 struct ddebug_table {
 	struct list_head link;
 	const char *mod_name;
+	/* a module can have multiple class-sets eventually, but not yet */
+	struct ddebug_known_classes_map const *map;
 	unsigned int num_ddebugs;
 	struct _ddebug *ddebugs;
 };
@@ -916,6 +918,57 @@ static const struct proc_ops proc_fops = {
 	.proc_write = ddebug_proc_write
 };
 
+/**
+ * dynamic_debug_register_classes - register a module's known classes
+ * @map:  &struct ddebug_known_classes_map
+ *
+ * modules using non-default pr_debug.class_id's should call this to
+ * inform dyndbg which classes they use (0..N), and what their
+ * classnames are.  They are then usable in ```echo $cmd >control```
+ */
+int dynamic_debug_register_classes(struct ddebug_known_classes_map *map)
+{
+	struct ddebug_table *dt;
+	int rc = -ENOENT;
+
+	mutex_lock(&ddebug_lock);
+#ifdef CONFIG_MODULES
+	if (map->mod) {
+		/* loadable module */
+		list_for_each_entry(dt, &ddebug_tables, link) {
+			if (dt->mod_name == map->mod->name) {
+				rc = 0;
+				dt->map = map;
+				break;
+			}
+		}
+	}
+#endif
+	if (!map->mod) {
+		/* builtin module */
+		list_for_each_entry(dt, &ddebug_tables, link) {
+			if (!strcmp(dt->mod_name, map->mod_name)) {
+				rc = 0;
+				dt->map = map;
+				break;
+			}
+		}
+	}
+	mutex_unlock(&ddebug_lock);
+	if (rc)
+		pr_warn("register_classes: module %s not found\n", map->mod_name);
+	else
+		vpr_info("register_classes: %s\n", map->mod_name);
+
+	return rc;
+}
+EXPORT_SYMBOL(dynamic_debug_register_classes);
+
+void dynamic_debug_unregister_classes(struct ddebug_known_classes_map *map)
+{
+	vpr_info("unregister_classes: %s\n", map->mod_name);
+}
+
 /*
  * Allocate a new ddebug_table for the given module
  * and add it to the global list.
-- 
2.35.3

