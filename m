Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31C7FB191F7
	for <lists+dri-devel@lfdr.de>; Sun,  3 Aug 2025 05:59:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8592210E4BC;
	Sun,  3 Aug 2025 03:59:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="SordUsod";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f50.google.com (mail-io1-f50.google.com
 [209.85.166.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AACFE10E4B0;
 Sun,  3 Aug 2025 03:59:16 +0000 (UTC)
Received: by mail-io1-f50.google.com with SMTP id
 ca18e2360f4ac-8811ab2b559so242683739f.3; 
 Sat, 02 Aug 2025 20:59:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754193556; x=1754798356; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HXquqH7KII4sF+LJ1AfrwTmzreYTzxHzyyy3sHAB95g=;
 b=SordUsod2m8UoNCIFjHQtmpIk47OHQ/w1hVhSIXrm6LXjVx9ywmPS9OdQnTguZjymI
 M6nHsiGs32g8oc9x6Tx0F+SKT9lWqMc9cAwg45UAs/aeMDqxOSLuJl2qIW19H4TA6ZAf
 7jIWVXrbdkHhLwwHjm9khITIvEvQACbkTbaoABJx4F6E6FXI0DudpVTeft2zgqr5yq9t
 Swlw/mpryPAGJWwEj7Fx9JwNAblSCmE2OhaD9J+HdgCnbzhQ+xg1vrpzIJTfCsw+wcEP
 KsFhK8Agyk6IZKo/gTpyj3wbMN6zbQOx80oTvLXvAO1vzNXWcm2fkt+ZXlslmhGRq7Om
 USWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754193556; x=1754798356;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HXquqH7KII4sF+LJ1AfrwTmzreYTzxHzyyy3sHAB95g=;
 b=mBssTXCRCc04QsLrI5xK/A4WUQzVrPPunzpOTFeHn+slz3E7302Fft64fGjUsenbFH
 +embEOM1XpAuUSUsHMi1D/Zzl9NUPUzSKzgECRebFFV/UIGIdbqSRNhpCxWiOTMFWopV
 3xy5Aa80aC5d8lczTMsiq0PtVn0Cq0pOaQL8KymqOfVRKXdzPJff11nsQw2f0NJG+ZzR
 V082jG7C+hE99bfcQh7QdiB+yl5Ximon0252ElRwAKLYVtnCr5vpNfoVA/5PlzzzYke7
 IuJ7RbqRtxj726lk4ksvCq5onbkmDdtd95vapyck7oRLCVNlvbmrsExVD7l//d1Xk5mo
 Tk5w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUMOuYRemdHWK/slY2nm2+CXwyhHhFeGHwK3BdZzeQrBeGFKMVhy/krrWpJAUcf1zKCmZHGe2t+@lists.freedesktop.org,
 AJvYcCVLqot1yDpQpqu119EAt7kT1K+9deToj0zVHG3EV++bXCMa06wCMl1HoE6GVuXUwkEo/fQTbIY64eyXIH7uAQ==@lists.freedesktop.org,
 AJvYcCVcdyty5mkXfSs5YivOk45eF5dXZJ4TGtdMAV/yJ9OdOtWeB9y2YFl1zK2p/t3yb5H6Wgd7kNNE6LWn@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx14qDYfqdKH1YWxJ2eYI2TIQcEHVPyJdWscu6mLoEzSqv4jo/T
 kO8f+9HacualViWoh3yfV0PcsevzDkfgqy+1IY2vOqwTs5nSComnjquZ
X-Gm-Gg: ASbGncvqvU30nvlSBqYd2xRHmh7qpshSjxszawsQpBDsQngcPyPaPYew4peHQfjLwVt
 5L87LgdsgH1VW9pqYy+swJAnRQhhb/mkL6DFnygLlTv8OFjlmyhdg4xIZ9dbYyDi2Uqyode+th3
 QXRW92eeSCogkQphhiMeP6gP5zM3Pm2ZoQ0kU0zO9JrYgeQt5nB1mw4RN724fFz1xEMW+dvMmtO
 mpN7ey5ORxb9gGoiQHPJSs+C9uXY+3evpjLNpvOqWXKh6LQHhT3ajefn5Gp7Yc4y22V53pYmztz
 UJ0P+hZ8QMWqVNWzV+CnCyprjgrpJlVkMVH89Swq8b5YY5KgiNzZ7cuYwzfp8eijJgK0uGove/B
 0KhvrSBTMRO6GAIhyE3UybYhEGjSLGSIT3jM5Dx2o0DnRsXGvGQZF/QQMbZRx+wDNMJDAlYYC+3
 BBcw==
X-Google-Smtp-Source: AGHT+IHEnyztiCzMLSKzxMv0/iqEKnGgfqHvaJUwVU2gtBDtmGy6WUb/KQqWprxWVGQiSsEBcFCLfQ==
X-Received: by 2002:a05:6602:6b81:b0:87c:34e3:1790 with SMTP id
 ca18e2360f4ac-88168313db5mr806307439f.1.1754193555783; 
 Sat, 02 Aug 2025 20:59:15 -0700 (PDT)
Received: from frodo.raven-morpho.ts.net (c-67-165-245-5.hsd1.co.comcast.net.
 [67.165.245.5]) by smtp.googlemail.com with ESMTPSA id
 8926c6da1cb9f-50a55df0940sm2268319173.106.2025.08.02.20.59.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Aug 2025 20:59:15 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, jbaron@akamai.com,
 gregkh@linuxfoundation.org, ukaszb@chromium.org, louis.chauvet@bootlin.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 daniel.vetter@ffwll.ch, tvrtko.ursulin@linux.intel.com,
 jani.nikula@intel.com, ville.syrjala@linux.intel.com,
 seanpaul@chromium.org, robdclark@gmail.com, groeck@google.com,
 yanivt@google.com, bleung@google.com, quic_saipraka@quicinc.com,
 will@kernel.org, catalin.marinas@arm.com, quic_psodagud@quicinc.com,
 maz@kernel.org, arnd@arndb.de, linux-arm-kernel@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, mingo@redhat.com, jim.cromie@gmail.com
Subject: [PATCH v4 28/58] dyndbg: restore classmap protection when theres a
 controlling_param
Date: Sat,  2 Aug 2025 21:57:46 -0600
Message-ID: <20250803035816.603405-29-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250803035816.603405-1-jim.cromie@gmail.com>
References: <20250803035816.603405-1-jim.cromie@gmail.com>
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
 include/linux/dynamic_debug.h | 16 ++++++----
 lib/dynamic_debug.c           | 55 ++++++++++++++++++++++++++---------
 2 files changed, 52 insertions(+), 19 deletions(-)

diff --git a/include/linux/dynamic_debug.h b/include/linux/dynamic_debug.h
index 2d959f1f8cd30..bc26bc9128c1c 100644
--- a/include/linux/dynamic_debug.h
+++ b/include/linux/dynamic_debug.h
@@ -100,8 +100,9 @@ enum ddebug_class_map_type {
  * __pr_debug_cls(0, "fake CORE msg") in any part of DRM would "work"
  * __pr_debug_cls(22, "no such class") would compile, but not "work"
  */
-
+struct _ddebug_class_param;
 struct _ddebug_class_map {
+	struct _ddebug_class_param *controlling_param;
 	const struct module *mod;		/* NULL for builtins */
 	const char *mod_name;
 	const char **class_names;
@@ -231,7 +232,12 @@ struct _ddebug_class_param {
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
@@ -244,10 +250,8 @@ struct _ddebug_class_param {
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
index 548a82a178d49..c3e27637d9357 100644
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
2.50.1

