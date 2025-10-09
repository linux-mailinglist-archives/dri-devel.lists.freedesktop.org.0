Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83185BCA7C5
	for <lists+dri-devel@lfdr.de>; Thu, 09 Oct 2025 19:59:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1685910EAE9;
	Thu,  9 Oct 2025 17:59:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Rd4+GEPL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f49.google.com (mail-io1-f49.google.com
 [209.85.166.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E3F410EAEF
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Oct 2025 17:59:18 +0000 (UTC)
Received: by mail-io1-f49.google.com with SMTP id
 ca18e2360f4ac-91f6ccdbfc8so61513939f.1
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Oct 2025 10:59:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760032758; x=1760637558; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8VajdNQuLfTy6JC5i23P0vLrTfj2xqzSxVhIl0k/ENk=;
 b=Rd4+GEPLIpR/ck8zyXD7uV+JiKvB/PPCNcMqVmK0MQhIE2OIpXKRSVOQbUT7spKVY7
 OdBsDCsqxuXREPU5dGVSeaJOMrx1v1o26stN+Ikh+913FAZmxDE5eTfndJXMmLYimfYc
 M+xgQbZuc/v3PTB+AI3myAZw2DxnpyeuYDy2moSxGxkWxQPyKJ93beMucPckk/ylo1em
 dK671aV1sh/TfMV9CPVowbIAX7rn24nHDdUGAJzl7ZHZYICq75JKo7l3CH03sWpw2KZt
 smUVIRM15i3sH45calrkBw3HW9NHtO2IvrPtl8i3I0hs1DPNa2XFH0NAiQoS7gWJ3voA
 nZ0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760032758; x=1760637558;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8VajdNQuLfTy6JC5i23P0vLrTfj2xqzSxVhIl0k/ENk=;
 b=pXh4G8dPQOZJQ4kpycrEel5kAgdnyJaXXUp+UED4yU81+gqQV2L5J1KyrM6I8KUdCv
 MV0KGEBjjYNu2RKWyFoV5PDH2niSwkiHy7GCCacG0l06z5ZlBmJQYZdZtQObUlvOQc8r
 +JEcdAsx77BrpcJY26dXRnZ1Vb+2s+4Q0DZ4X8S7n1DSEJJcYIENB6bXvzTuzbPQU/fw
 KUxsjRdA731h4qP3tmaTwP7t86U9bzx6LrFyEZ3UmTBBwzoBzePXZGyCiMTZuTmtAI4h
 jrINTANgmxLUd1jDbOmjb7SMz8XAJB9+negXO7TZKwTXA1I5JgFAx7Bn2/e3DHgHAofM
 LFuQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUub6eV2gV1oa6RWVHXV877RHWDYpJtQjYRql0pIRnnRludixF2LeFVd/7YvhzEGU83m7m2jQqdqgs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxQl7qWydR+M048hGzwyKEUGBMoQ3Q3Yi11Via0v77vCQ6LfYxx
 s1omYEptZ3ZdVm4PkgEw3Shm5OATgjgSI71reCNoRWU45CBFH65kVGyB
X-Gm-Gg: ASbGnctJ2P23tZ4ReEHcVtvwqOHXAQ8dxQRQ+KuB0gkS/5BkWGGXmIrpeHXtmUwIf7D
 rfO4lvMRqIScIZgDXLqEtOOReWC6FeKkM0e2RyicLXyCbh1FskSAAeuAzTbozpwCWVuWQNScLrW
 pypheQG+4Yre/pYiRd5endNWRmf8TJBHcmV/1nTWUxcyEpkg9IoC1QLIBPHsWXAC2RZR3A1sm4B
 egytsWwOVJvif6ImaqhTnBgRLaCRSq/MSB9xx7KWnZO+MDB/mPqoLwMVFSEjYSk+xTdlBBw0Q90
 2uYerwnQ49dAY7tHDqxL4t5zkft3tEmu6qJKmrkQ+8n9KwWjgqgKVTqRQNEtm2tE+y82aihG9wy
 kabK1yoj7+oYKUxPG16H9oDlljhS++aXLqoitHbfXq/7yZDqgg1YILQeL4Y6iA7ooyLW8pKrSxG
 CSoR6LoEElkPfCdH0DoY4B95CYVLX0QRg6g8rCCg==
X-Google-Smtp-Source: AGHT+IHpelhUUjBbXbV/tkucdrvQF0I4wn6cw0zbj09I+oz7mYy+7LPEtXoCeX7tvm1TS2dpSseiwg==
X-Received: by 2002:a05:6e02:1847:b0:425:73c6:9042 with SMTP id
 e9e14a558f8ab-42f873fae8cmr70739435ab.24.1760032757618; 
 Thu, 09 Oct 2025 10:59:17 -0700 (PDT)
Received: from godzilla.raven-morpho.ts.net
 (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
 by smtp.googlemail.com with ESMTPSA id
 8926c6da1cb9f-58f7200c4afsm30256173.35.2025.10.09.10.59.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Oct 2025 10:59:17 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com
Cc: gregkh@linuxfoundation.org, ukaszb@chromium.org, louis.chauvet@bootlin.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, daniel.vetter@ffwll.ch,
 tvrtko.ursulin@linux.intel.com, jani.nikula@intel.com,
 ville.syrjala@linux.intel.com, Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v5 28/30] dyndbg: resolve "protection" of class'd pr_debugs
Date: Thu,  9 Oct 2025 11:58:32 -0600
Message-ID: <20251009175834.1024308-29-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251009175834.1024308-1-jim.cromie@gmail.com>
References: <20251009175834.1024308-1-jim.cromie@gmail.com>
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

classmap-v1 code protected class'd pr_debugs from unintended
changes by unclassed/_DFLT queries:

  # IOW this doesn't disable all of DRM_UT_* categories
  echo "-p" > /proc/dynamic_debug/control

  # Instead, must name the class to change it.
  # Protective but tedious
  echo "class DRM_UT_CORE +p" > /proc/dynamic_debug/control

  # Or do it the (old school) subsystem way
  echo 1 > /sys/module/drm/parameters/debug

This "name the class to change it" behavior gave a modicum of
protection to classmap users (ie DRM) so their debug settings aren't
trivially and unintentionally altered underneath them.

Doing so was 2-step:
a- all existing pr-debugs got .class_id = DEFAULT - ints need a val.
b- "class DEFAULT" was inferred unless a class was explicitly given

This allowed all previously conceived queries to work the way they
always had; ie select the same set of pr_debugs, despite the inclusion
of whole new classes of pr_debugs.

But that choice had 2 downsides:

1. "name the class to change it" makes a tedious long-winded
interface, needing many commands to set DRM_UT_* one at a time.

2. It made the class keyword special in some sense; the other keywords
skip only on explicit mismatch, otherwise the code falls thru to
adjust the pr-debug site.

Jason Baron	didn't like v1 on point 2.  Im not sure he's changed view.
Louis Chauvet	didn't like recent rev on point 1 tedium.

My view has crystalized: drm.debug is ABI and API. Therefore dyndbg
"doing" drm.debug must deliver the same operational guarantees; namely
that drm.debug=VAL is accurate and true.  Convenience or wishes for
no-special-cases does not matter.

The new resolution:

If ABI is the blocking issue, then no ABI means no blocking issue.
IOW, if the classmap has no associated sysfs/kparam, ie no PARAM,
there is no ABI to guard, no reason to enforce a tedious interface.

In the future, if DRM wants to drop or qualify this protection at
compile or modally at runtime, we could talk.  But thats their call
for convenience.

So classes without a PARAM are unprotected at >control, allowing
admins their shortcuts.  No such classmap usages exist yet.

Anyway, this patch does:

1. adds link field from _ddebug_class_map to the .controlling_param

2. sets it in ddebug_match_apply_kparam(), during modprobe/init,
   when options like drm.debug=VAL are handled.

3. ddebug_class_has_param() checks .controlling_param

4. ddebug_class_wants_protection() macro renames 3.
   this frames it as a separable policy decision

5. ddebug_change() calls 4 when needed.
   IE when applying a class-less query to a class'd pr_debug
   here we need a new fn to find the classmap with this .class_id

6. new ddebug_find_classmap_by_class_id().  called when class-less
   query looks at a class'd pr_debug.  finds classmap, which can then
   decide, currently by PARAM existence.

Historical Summary:

-v0 - before classmaps.  no special case keywords
-v1 - "class DEFAULT" is assumed if not mentioned.
      this protects classes from class-less queries

-v2.pre-this-patch - protection macro'd to false
-v2.with-this-patch - sysfs knob decides
-v2.speculative - module decides wrt classmap protection
		  seems unneeded now, TBD

NOTE: protection is only against class-less queries, explicit "class
FOO" adjustments are allowed (that is the mechanism).

CC: Jason Baron <jbaron@akamai.com>
Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
v3 - new patch
v4
- drop fn-scope map var, with 2 local vars, renamed to purpose
- fix for NULL ptr case.
- Add loop-var to reduce many "&dt->info." exprs to "di->"
- add 1-liner postcondition comments
---
 include/linux/dynamic_debug.h |  14 +++--
 lib/dynamic_debug.c           | 114 +++++++++++++++++++++++++++-------
 2 files changed, 100 insertions(+), 28 deletions(-)

diff --git a/include/linux/dynamic_debug.h b/include/linux/dynamic_debug.h
index 4ceb69f0e493..588e03e8d157 100644
--- a/include/linux/dynamic_debug.h
+++ b/include/linux/dynamic_debug.h
@@ -75,6 +75,7 @@ enum ddebug_class_map_type {
  * map @class_names 0..N to consecutive constants starting at @base.
  */
 struct _ddebug_class_map {
+	struct _ddebug_class_param *controlling_param;
 	const struct module *mod;	/* NULL for builtins */
 	const char *mod_name;
 	const char **class_names;
@@ -259,7 +260,12 @@ struct _ddebug_class_param {
  *
  * Creates a sysfs-param to control the classes defined by the
  * exported classmap, with bits 0..N-1 mapped to the classes named.
- * This version keeps class-state in a private long int.
+ *
+ * Since sysfs-params are ABI, this also protects the classmap'd
+ * pr_debugs from un-class'd `echo -p > /proc/dynamic_debug/control`
+ * changes.
+ *
+ * This keeps class-state in a private long int.
  */
 #define DYNAMIC_DEBUG_CLASSMAP_PARAM(_name, _var, _flags)		\
 	static unsigned long _name##_bvec;				\
@@ -272,10 +278,8 @@ struct _ddebug_class_param {
  * @_var:   name of the (exported) classmap var defining the classes/bits
  * @_flags: flags to be toggled, typically just 'p'
  *
- * Creates a sysfs-param to control the classes defined by the
- * exported clasmap, with bits 0..N-1 mapped to the classes named.
- * This version keeps class-state in user @_bits.  This lets drm check
- * __drm_debug elsewhere too.
+ * Like DYNAMIC_DEBUG_CLASSMAP_PARAM, but maintains param-state in
+ * extern @_bits.  This lets DRM check __drm_debug elsewhere too.
  */
 #define DYNAMIC_DEBUG_CLASSMAP_PARAM_REF(_name, _bits, _var, _flags)	\
 	__DYNAMIC_DEBUG_CLASSMAP_PARAM(_name, _bits, _var, _flags)
diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index 5de74a1be4e5..6e0c978bc7c4 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -197,6 +197,48 @@ ddebug_find_valid_class(struct _ddebug_info const *di, const char *query_class,
 	return NULL;
 }
 
+#define class_in_range(class_id, map)					\
+	(class_id >= map->base && class_id < map->base + map->length)
+
+static struct _ddebug_class_map *
+ddebug_find_map_by_class_id(struct _ddebug_info *di, int class_id)
+{
+	struct _ddebug_class_map *map;
+	struct _ddebug_class_user *cli;
+	int i;
+
+	for_subvec(i, map, di, maps)
+		if (class_in_range(class_id, map))
+			return map;
+
+	for_subvec(i, cli, di, users)
+		if (class_in_range(class_id, cli->map))
+			return cli->map;
+
+	return NULL;
+}
+
+/*
+ * classmaps-V1 protected classes from changes by legacy commands
+ * (those selecting _DPRINTK_CLASS_DFLT by omission).  This had the
+ * downside that saying "class FOO" for every change can get tedious.
+ *
+ * V2 is smarter, it protects class-maps if the defining module also
+ * calls DYNAMIC_DEBUG_CLASSMAP_PARAM to create a sysfs parameter.
+ * Since they want the knob, we should assume they intend to use it
+ * (in preference to "class FOO +p" >control), and want to trust its
+ * settings.
+ * This gives protection when its useful, and not when its just tedious.
+ */
+static inline bool ddebug_class_has_param(const struct _ddebug_class_map *map)
+{
+	return !!(map->controlling_param);
+}
+
+/* re-framed as a policy choice */
+#define ddebug_class_wants_protection(map) \
+	ddebug_class_has_param(map)
+
 /*
  * Search the tables for _ddebug's which match the given `query' and
  * apply the `flags' and `mask' to them.  Returns number of matching
@@ -210,35 +252,45 @@ static int ddebug_change(const struct ddebug_query *query, struct flag_settings
 	unsigned int newflags;
 	unsigned int nfound = 0;
 	struct flagsbuf fbuf, nbuf;
-	struct _ddebug_class_map *map = NULL;
-	int valid_class;
+	int selected_class;
 
 	/* search for matching ddebugs */
 	mutex_lock(&ddebug_lock);
 	list_for_each_entry(dt, &ddebug_tables, link) {
+		struct _ddebug_info *di = &dt->info;
 
 		/* match against the module name */
 		if (query->module &&
-		    !match_wildcard(query->module, dt->info.mod_name))
+		    !match_wildcard(query->module, di->mod_name))
 			continue;
 
 		if (query->class_string) {
-			map = ddebug_find_valid_class(&dt->info, query->class_string,
-						      &valid_class);
-			if (!map)
+			struct _ddebug_class_map *mods_map =
+				ddebug_find_valid_class(di, query->class_string,
+							&selected_class);
+			if (!mods_map)
 				continue;
 		} else {
-			/* constrain query, do not touch class'd callsites */
-			valid_class = _DPRINTK_CLASS_DFLT;
+			selected_class = _DPRINTK_CLASS_DFLT;
 		}
+		/* module knows "class FOO", if given, else class _DFLT */
 
-		for (i = 0; i < dt->info.descs.len; i++) {
-			struct _ddebug *dp = &dt->info.descs.start[i];
-
-			/* match site against query-class */
-			if (dp->class_id != valid_class)
-				continue;
+		for (i = 0; i < di->descs.len; i++) {
+			struct _ddebug *dp = &di->descs.start[i];
 
+			if (dp->class_id != selected_class) {
+				if (query->class_string) {
+					/* site.class != class FOO */
+					continue;
+				} else {
+					/* class-less query, class'd site */
+					struct _ddebug_class_map *site_map =
+						ddebug_find_map_by_class_id(di, dp->class_id);
+					if (site_map && ddebug_class_wants_protection(site_map))
+						continue;
+					/* allow change on class'd site */
+				}
+			}
 			/* match against the source filename */
 			if (query->filename &&
 			    !match_wildcard(query->filename, dp->filename) &&
@@ -635,6 +687,7 @@ static int ddebug_exec_queries(char *query, const char *modname)
 }
 
 /* apply a new class-param setting */
+
 static int ddebug_apply_class_bitmap(const struct _ddebug_class_param *dcp,
 				     const unsigned long *new_bits,
 				     const unsigned long old_bits,
@@ -1086,9 +1139,6 @@ static void *ddebug_proc_next(struct seq_file *m, void *p, loff_t *pos)
 	return dp;
 }
 
-#define class_in_range(class_id, map)					\
-	(class_id >= map->base && class_id < map->base + map->length)
-
 static const char *ddebug_class_name(struct _ddebug_info *di, struct _ddebug *dp)
 {
 	struct _ddebug_class_map *map;
@@ -1213,25 +1263,36 @@ static void ddebug_sync_classbits(const struct kernel_param *kp, const char *mod
 	}
 }
 
-static void ddebug_match_apply_kparam(const struct kernel_param *kp,
-				      const struct _ddebug_class_map *map,
-				      const char *mod_name)
+static struct _ddebug_class_param *
+ddebug_get_classmap_kparam(const struct kernel_param *kp,
+			   const struct _ddebug_class_map *map)
 {
 	struct _ddebug_class_param *dcp;
 
 	if (kp->ops != &param_ops_dyndbg_classes)
-		return;
+		return false;
 
 	dcp = (struct _ddebug_class_param *)kp->arg;
 
-	if (map == dcp->map) {
+	return (map == dcp->map)
+		? dcp : (struct _ddebug_class_param *)NULL;
+}
+
+static void ddebug_match_apply_kparam(const struct kernel_param *kp,
+				      struct _ddebug_class_map *map,
+				      const char *mod_name)
+{
+	struct _ddebug_class_param *dcp = ddebug_get_classmap_kparam(kp, map);
+
+	if (dcp) {
+		map->controlling_param = dcp;
 		v2pr_info(" kp:%s.%s =0x%lx", mod_name, kp->name, *dcp->bits);
 		vpr_cm_info(map, " %s maps ", mod_name);
 		ddebug_sync_classbits(kp, mod_name);
 	}
 }
 
-static void ddebug_apply_params(const struct _ddebug_class_map *cm, const char *mod_name)
+static void ddebug_apply_params(struct _ddebug_class_map *cm, const char *mod_name)
 {
 	const struct kernel_param *kp;
 #if IS_ENABLED(CONFIG_MODULES)
@@ -1251,6 +1312,13 @@ static void ddebug_apply_params(const struct _ddebug_class_map *cm, const char *
 	}
 }
 
+/*
+ * called from add_module, ie early. it can find controlling kparams,
+ * which can/does? enable protection of this classmap from class-less
+ * queries, on the grounds that the user created the kparam, means to
+ * use it, and expects it to reflect reality.  We should oblige him,
+ * and protect those classmaps from classless "-p" changes.
+ */
 static void ddebug_apply_class_maps(const struct _ddebug_info *di)
 {
 	struct _ddebug_class_map *cm;
-- 
2.51.0

