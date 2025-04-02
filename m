Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D74A7A79430
	for <lists+dri-devel@lfdr.de>; Wed,  2 Apr 2025 19:42:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 570F410E88E;
	Wed,  2 Apr 2025 17:42:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Ecnm/EgJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f54.google.com (mail-io1-f54.google.com
 [209.85.166.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A6A110E899;
 Wed,  2 Apr 2025 17:42:43 +0000 (UTC)
Received: by mail-io1-f54.google.com with SMTP id
 ca18e2360f4ac-85517db52a2so223739f.3; 
 Wed, 02 Apr 2025 10:42:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1743615762; x=1744220562; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3hWaDK0EyUbVT4OX3HvU/+LKgntx8pUOZGP1ac6BsDE=;
 b=Ecnm/EgJVob5A7Y/szFbtyRzPv8CpIV3zfNZTEaDyzIQ5Z2/g2TLVs0bHFbr76DpZu
 kIkAadj1NB4zhBijvMKuXcj2OJjgL5CaeV7eQwVYCofHD2xCBERsZzR6Gpbsqi6+k0wD
 h6fkojPlxKMtof5UWcjuMDWv9kwy6HH48+RJkq+aqlVhhHbLWrgpCVxhosYEYqiznqlk
 UgWCgCkwutazbiILn9ck51IcuiYEuox1FQe5ct4MG2yrYw4lYBiuHU4MIiAlZlksY3n6
 v06y/DeIPTXk2QKLRlNPdLClklqGqUSwIHF3HoZv+Qfxd79xjTJ9DASSlK0wSWJq3YH2
 nFAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743615762; x=1744220562;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3hWaDK0EyUbVT4OX3HvU/+LKgntx8pUOZGP1ac6BsDE=;
 b=nEqYMFQZVv6PKa6/wDfdpJydle6tuX/NjyBt1+71nnd3YTwb+Kk5HJhtxqgraIpanf
 ebuSFhCrOoUiCjsLKKYVIld0u0jHk7KBhUClU7yZramDYauOum4MI/ZbLtW6X4jR0K8c
 2TG2UvhRs/fiLk3RroxGuICNWAU0982rYM0M9sivFTvsq9zSw5EuNHbC6C06pu625Bfm
 Lnvy2tf2WDwEYg69RRYiaHaVKnj7onhdtMGiJaV0Kazef3kSJ5a3GDp31mSvRe76HYpk
 lnPpeZttDkGQ5StSatyi5mrvwYdmUv/iT1e0Xkd0YssNhV9Jl4XFgmjcHGlg2GNAgHGl
 VlcQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUgVA7CVpE+fj9DIpDwijkn/cc9WvQhasG6DvxXzUixkz8q3E4kTGijC9qZ6JRKDSLsC8CARAn1Pj9G@lists.freedesktop.org,
 AJvYcCV1iUuAR/CDfVunxVghqixdxMNAM6loSuwRsBch40I9LcxjSAJJAa0nRST/jpyPFERwy72sllUxiyUshae3aA==@lists.freedesktop.org,
 AJvYcCX3ermHKkWOgROWbzkt24qa3KVzKtFcxQ/Mk70LY2SE9wlU6tV2CM2orkGjO5i5lLSGQfWjKwwq@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyh78okuUTzOq6XgJhsR21jFrQjahi5xWkO7Cc8ntcRt7cNdsc3
 VcePpyMvs91R1og6OMHgKWnPgDR0GfLAdseSGBVxiFVUEpGp8fnm
X-Gm-Gg: ASbGncvJEIyehYhJhQ7273r+cw5G7D5GHtrnUelPtFMod4vMocOF5AyjkMDJ98UQFS2
 tg5s1yx3LBu41Kr6mVOEpXGGNxSrHwat6AETA1rutAEqcMztKDurwHL4uXbtbe7tADw/ruUdm7Z
 gHxsM3XpKDwonBugFpuTpNyjim7nrDJuH4F0D9gjN4UWxRsw1f3aVbBh74n/QnsQd3t3jnEmqSH
 cEErSPZyglv7hL/P3EnIR0xQZgUNuG8EOZBZKzCwjwFMsUDE0xrqN4jcRkk+xKaeLFNjnn8TNL5
 0o/wulvVv+/VSiBf6k0ogga6k/Eox9YDgPTdLpcZhxLo6oltF1qbmN/iwgak8NFY3fZEkNZpje7
 CDw==
X-Google-Smtp-Source: AGHT+IE26Lvgy1sz8+/s+cZ/TgAmF79C63fY2ih6ts7b4QxKP/HjJZzZedKoG0eLTxzU2s+MwTib5Q==
X-Received: by 2002:a05:6e02:746:b0:3d3:f27a:9101 with SMTP id
 e9e14a558f8ab-3d5e08e9ec2mr217926285ab.1.1743615762203; 
 Wed, 02 Apr 2025 10:42:42 -0700 (PDT)
Received: from gandalf.. (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
 by smtp.googlemail.com with ESMTPSA id
 e9e14a558f8ab-3d5d5af8369sm33439725ab.71.2025.04.02.10.42.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Apr 2025 10:42:41 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, gregkh@linuxfoundation.org, ukaszb@chromium.org,
 louis.chauvet@bootlin.com, linux-kernel@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 daniel.vetter@ffwll.ch, tvrtko.ursulin@linux.intel.com,
 jani.nikula@intel.com, ville.syrjala@linux.intel.com,
 Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v3 28/54] dyndbg: restore classmap protection when theres a
 controlling_param
Date: Wed,  2 Apr 2025 11:41:30 -0600
Message-ID: <20250402174156.1246171-29-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250402174156.1246171-1-jim.cromie@gmail.com>
References: <20250402174156.1246171-1-jim.cromie@gmail.com>
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

DRM has always had /sys/module/drm/parameters/debug (ie drm.debug).
Without dyndbg, this is their only control point.  One could presume
they like it - in any case its a system/user interface, ie ABI.

With dyndbg enabled, drm calls DYNAMIC_DEBUG_CLASSMAP_PARAM() to
create the drm.debug kparam, wired to our param-handler, which writes
a "class FOO" query for each bit in the classmap.  Since no new
interface was ever contemplated, this is using >control.

Since drm.debug is ABI, we should not allow class-less queries to
alter our implementation of its settings.

This patch provides that protection, *only* when theres a PARAM.  This
is the user, expressing their wish for easy control of their entire
classmap.  They also wish to trust its settings.

Classes without a PARAM are unprotected, allowing admins their
shortcuts.  No such use-cases exist yet.

Anyway, this patch does:

1. adds struct _ddebug_class_map.controlling_param

2. set it in ddebug_match_apply_kparam(), during modprobe/init,
   when options like drm.debug are handled.

3. ddebug_class_has_param() checks .controlling_param

4. ddebug_class_wants_protection() macro renames 3.

5. ddebug_change() calls 4 when needed.
   IE when applying a class-less query to a class'd pr_debug / drm_dbg_<T>

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

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
v3 - new patch
---
 include/linux/dynamic_debug.h |  3 +-
 lib/dynamic_debug.c           | 55 ++++++++++++++++++++++++++---------
 2 files changed, 44 insertions(+), 14 deletions(-)

diff --git a/include/linux/dynamic_debug.h b/include/linux/dynamic_debug.h
index 2d87cca27544..d34a44ff961a 100644
--- a/include/linux/dynamic_debug.h
+++ b/include/linux/dynamic_debug.h
@@ -89,8 +89,9 @@ enum ddebug_class_map_type {
  * usually by stringifying the enum-vals.  Modules with multiple
  * classmaps must arrange to share the 0..62 class_id space.
  */
-
+struct _ddebug_class_param;
 struct _ddebug_class_map {
+	struct _ddebug_class_param *controlling_param;
 	const struct module *mod;		/* NULL for builtins */
 	const char *mod_name;
 	const char **class_names;
diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index 54f462cf41b0..3eb4a8abeb33 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -198,16 +198,26 @@ ddebug_find_valid_class(struct _ddebug_info const *di, const char *query_class,
 }
 
 /*
- * classmaps-v1 protected classes from changes by legacy commands
- * (those selecting _DPRINTK_CLASS_DFLT by omission), v2 undoes that
- * special treatment.  State so explicitly.  Later we could give
- * modules the choice to protect their classes or to keep v2 behavior.
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
  */
-static inline bool ddebug_client_module_protects_classes(const struct ddebug_table *dt)
+static inline bool ddebug_class_has_param(const struct _ddebug_class_map *map)
 {
-	return false;
+	return !!(map->controlling_param);
 }
 
+/* re-framed as a policy choice */
+#define ddebug_class_wants_protection(map) \
+	ddebug_class_has_param(map)
+
 /*
  * Search the tables for _ddebug's which match the given `query' and
  * apply the `flags' and `mask' to them.  Returns number of matching
@@ -250,7 +260,7 @@ static int ddebug_change(const struct ddebug_query *query, struct flag_settings
 					/* site.class != given class */
 					continue;
 				/* legacy query, class'd site */
-				else if (ddebug_client_module_protects_classes(dt))
+				else if (ddebug_class_wants_protection(map))
 					continue;
 				/* allow change on class'd pr_debug */
 			}
@@ -650,6 +660,7 @@ static int ddebug_exec_queries(char *query, const char *modname)
 }
 
 /* apply a new class-param setting */
+
 static int ddebug_apply_class_bitmap(const struct _ddebug_class_param *dcp,
 				     const unsigned long *new_bits,
 				     const unsigned long old_bits,
@@ -1228,25 +1239,36 @@ static void ddebug_sync_classbits(const struct kernel_param *kp, const char *mod
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
 		vpr_cm_info(map, " %s mapped to: ", mod_name);
 		ddebug_sync_classbits(kp, mod_name);
 	}
 }
 
-static void ddebug_apply_params(const struct _ddebug_class_map *cm, const char *mod_name)
+static void ddebug_apply_params(struct _ddebug_class_map *cm, const char *mod_name)
 {
 	const struct kernel_param *kp;
 #if IS_ENABLED(CONFIG_MODULES)
@@ -1266,6 +1288,13 @@ static void ddebug_apply_params(const struct _ddebug_class_map *cm, const char *
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
2.49.0

