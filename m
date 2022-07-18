Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 587CA577B4A
	for <lists+dri-devel@lfdr.de>; Mon, 18 Jul 2022 08:39:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BCB2A9CDA;
	Mon, 18 Jul 2022 06:38:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com
 [IPv6:2607:f8b0:4864:20::d2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19AA9A9C98;
 Mon, 18 Jul 2022 06:38:32 +0000 (UTC)
Received: by mail-io1-xd2a.google.com with SMTP id z132so8569933iof.0;
 Sun, 17 Jul 2022 23:38:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qFjsd1tLyZv1o9uQBK/fQBb5x3evkNzCgXvUiKZ53b8=;
 b=S8Aos+UX1MVH05MU6dIzE2Knx9P7cVp+RNBhYdcyE3n4G+7mtjH01LUEO0574YgdTA
 eakzSMztrZAnFzEleo4UiGyoV7/udkP5jg+fuo8TjVeZ3zZGwzqrkiey9UOApLH39h2Y
 AftZ3ouHuraT8H2GiBk8PaQogvUnqjSnBiFAgFMsv5nNZY4jtGWG3MC9RoUh0R4QORIm
 9WaaqBY8UzypAHPUCcQRN4spJizVp/D3/d2eQEKeYoyaNrW6X8lTGH3nCzhfI9OKdqWc
 vZIYhVI7NfPzA20fOGUs8L+pinh8bTL1Sl6m4m8gJsAe7jk28Bzbx6xuaKyr2D2g2UZg
 utCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qFjsd1tLyZv1o9uQBK/fQBb5x3evkNzCgXvUiKZ53b8=;
 b=slOVX5OHgdj6Vs1VdT8q2BFQZczx2GVQA9S1DOwtHZ2nCpBZH6ut8ufQ2YFRwauWPF
 kVLyncl/LT9mNUerinv9nbscn29kfjBpWORAJqpJEagY8fLO457Yb0JcSeshsDEfb4mC
 HG9JTkSslGV5uY7lWiRSExaG2iZyvOwSaQy7tBZ5v126xO2RGLGhqIu/mBGFQm51g1Ua
 PA54i/O2HDwxYfCj+Rzs9/+Mxb8cWTjh4YTqW0NWe6QlVsyg8gnabFRKykzq8JLZ6pIa
 7spt4KpMg9lRN+MgFWbiW7z9YmU2a8LnrY8xCVrqaM9l5v9ggNDIyq+Kf5zX7BjPWQTi
 7fAg==
X-Gm-Message-State: AJIora/q4mOlGpSgn1EbofamdLP3aZrIhcqCCOoBgAyq54QqKJEwukbc
 oQ4IgEUv9/o4UkZX83qgvdL/gBVUnQA=
X-Google-Smtp-Source: AGRyM1uXxAAIIz3FhBK+OUz7ifbm5GAb6mxjTVf+uk6USwDhUtIWsnTVLVdhYs7rumhNomhPWq3r7Q==
X-Received: by 2002:a02:a890:0:b0:33f:22b8:cb0b with SMTP id
 l16-20020a02a890000000b0033f22b8cb0bmr14223735jam.136.1658126311353; 
 Sun, 17 Jul 2022 23:38:31 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 o12-20020a92a80c000000b002dcd35bb030sm2342604ilh.74.2022.07.17.23.38.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Jul 2022 23:38:30 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com
Subject: [PATCH v3 12/41] dyndbg: add DECLARE_DYNDBG_CLASSMAP
Date: Mon, 18 Jul 2022 00:35:56 -0600
Message-Id: <20220718063641.9179-13-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220718063641.9179-1-jim.cromie@gmail.com>
References: <20220718063641.9179-1-jim.cromie@gmail.com>
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
Cc: nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DECLARE_DYNDBG_CLASSMAP lets modules declare a set of classnames, this
opt-in authorizes dyndbg to allow enabling of prdbgs by their class:

   :#> echo class DRM_UT_KMS +p > /proc/dynamic_debug/control

This is just the setup; following commits deliver.

The macro declares and initializes a static struct ddebug_class_map:

 - maps approved class-names to class_ids used in module,
   by array order. forex: DRM_UT_*
 - class-name vals allow validation of "class FOO" queries
   using macro is opt-in
 - enum class_map_type - determines interface, behavior

Each module has its own .class_id space, and only known class-names
will be authorized for a manipulation.  Only DRM stuff should know this:

  :#> echo class DRM_UT_CORE +p > control	# across all modules

pr_debugs (with default class_id) are still controllable as before.

DECLARE_DYNDBG_CLASSMAP(_var, _maptype, _base, classes...) is::

 _var: name of the static struct var. user passes to module_param_cb()
       if they want a sysfs node. (ive only done it this way).

 _maptype: this is hard-coded to DD_CLASS_TYPE_DISJOINT for now.

 _base: usually 0, it allows splitting 31 classes into subranges, so
 	that multiple classes / sysfs-nodes can share the module's
 	class-id space.

 classes: list of class_name strings, these are mapped to class-ids
 	  starting at _base.  This class-names list must have a
 	  corresponding ENUM, with SYMBOLS that match the literals,
 	  and 1st enum val = _base.

enum class_map_type has 4 values, on 2 factors::

 - classes are disjoint/independent vs relative/x<y/verbosity.
   disjoint is basis, verbosity by overlay.

 - input NUMBERS vs [+-]CLASS_NAMES
   uints, ideally hex.  vs  +DRM_UT_CORE,-DRM_UT_KMS

DD_CLASS_TYPE_DISJOINT: classes are separate, one per bit.
   expecting hex input. basis for others.

DD_CLASS_TYPE_SYMBOLIC: input is a CSV of [+-]CLASS_NAMES,
   classes are independent, like DISJOINT

DD_CLASS_TYPE_VERBOSE: input is numeric level, 0-N.
   0 implies silence. use printk to break that.
   relative levels applied on bitmaps.

DD_CLASS_TYPE_LEVELS: input is a CSV of [+-]CLASS_NAMES,
   names like: ERR,WARNING,NOTICE,INFO,DEBUG
   avoiding EMERG,ALERT,CRIT,ERR - no point.

NOTES:

The macro places the initialized struct ddebug_class_map into the
__dyndbg_classes section.  That draws a 'orphan' warning which we
handle in next commit.  The struct attributes are necessary:
__aligned(8) stopped null-ptr derefs (why?), __used is needed by drm
drivers, which declare class-maps, but don't also declare a
sysfs-param, and thus dont ref the classmap; __used insures that the
linkage is made, then the class-map is found at load-time.

While its possible to handle both NAMES and NUMBERS in the same
sys-interface, there is ambiguity to avoid, by disallowing them
together.  Later, if ambiguities are resolved, 2 new enums can permit
both inputs, on verbose & independent types separately, and authors
can select the interface they like.

RFC:

My plan is to implement LEVELS in the callbacks, outside of
ddebug_exec_query(), which for simplicity will treat the CLASSES in
the map as disjoint.  This should handle most situations.

The callbacks can see map-type, and apply ++/-- loops (or bitops) to
force the relative meanings across the class-bitmap.

That leaves 2 issues:

1. doing LEVELs in callbacks means that the native >control interface
doesn't enforce the LEVELS relationship, so you could confusingly have
V3 enabled, but V1 disabled.  OTOH, the control iface already allows
infinite variety in the underlying callsites, despite the veneer of
uniformity suggested by the bitmap overlay, and LEVELS over that.

2. All dyndbg >control reduces to a query/command, includes +/-, which
is at-root a kernel patching operation with +/- semantics.  And the
symbolic sys-node handling exposes it to the user:

Consider whether these are/should-be 'exactly' the same:

   # force both 2 "half-duplex" relations
   echo +V3,-V4 > /sys/module/test_dynamic_debug/p_VX

   # should these both do the same ?
   echo +V3 > /sys/module/test_dynamic_debug/p_VX
   echo -V4 > /sys/module/test_dynamic_debug/p_VX

IOW, half relations are suggested by the +/-, and enum control of
individual behaviors leaves some room for this, especially wrt
handling [+-]SYMBOLIC inputs from the user.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 include/linux/dynamic_debug.h | 55 +++++++++++++++++++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/include/linux/dynamic_debug.h b/include/linux/dynamic_debug.h
index 0f7ad6cecf05..84e97cd0e8c4 100644
--- a/include/linux/dynamic_debug.h
+++ b/include/linux/dynamic_debug.h
@@ -56,7 +56,62 @@ struct _ddebug {
 #endif
 } __attribute__((aligned(8)));
 
+enum class_map_type {
+	DD_CLASS_TYPE_DISJOINT,
+	/**
+	 * DD_CLASS_TYPE_DISJOINT: classes are independent, one per bit.
+	 * expecting hex input. basis for others.
+	 */
+	DD_CLASS_TYPE_VERBOSE,
+	/**
+	 * DD_CLASS_TYPE_VERBOSE: input is numeric level, 0-N.
+	 * 0 should be silent, use printk to break that.
+	 * (x<y) relationship on bitpos
+	 */
+	DD_CLASS_TYPE_SYMBOLIC,
+	/**
+	 * DD_CLASS_TYPE_SYMBOLIC: input is a CSV of [+-]CLASS_NAMES,
+	 * classes are independent, like DISJOINT
+	 */
+	DD_CLASS_TYPE_LEVELS,
+	/**
+	 * DD_CLASS_TYPE_LEVELS: input is a CSV of [+-]CLASS_NAMES,
+	 * intended for names like: ERR,WARNING,NOTICE,INFO,DEBUG
+	 * avoid ? EMERG,ALERT,CRIT,ERR,WARNING ??
+	 */
+};
+
+struct ddebug_class_map {
+	struct list_head link;
+	struct module *mod;
+	const char *mod_name;	/* needed for builtins */
+	const char **class_names;
+	const int length;
+	const int base;		/* index of 1st .class_id, allows split/shared space */
+	enum class_map_type map_type;
+};
+
+/**
+ * DECLARE_DYNDBG_CLASSMAP - declare classnames known by a module
+ * @_var:   a struct ddebug_class_map, passed to module_param_cb
+ * @_type:  enum class_map_type, chooses bits/verbose, numeric/symbolic
+ * @_base:  offset of 1st class-name. splits .class_id space
+ * @classes: class-names used to control class'd prdbgs
+ */
+#define DECLARE_DYNDBG_CLASSMAP(_var, _maptype, _base, ...)		\
+	static const char *_var##_classnames[] = { __VA_ARGS__ };	\
+	static struct ddebug_class_map __aligned(8) __used		\
+		__section("__dyndbg_classes") _var = {			\
+		.mod = THIS_MODULE,					\
+		.mod_name = KBUILD_MODNAME,				\
+		.base = _base,						\
+		.map_type = _maptype,					\
+		.length = NUM_TYPE_ARGS(char*, __VA_ARGS__),		\
+		.class_names = _var##_classnames,			\
+	}
 
+#define NUM_TYPE_ARGS(eltype, ...)				\
+	(sizeof((eltype[]) {__VA_ARGS__}) / sizeof(eltype))
 
 #if defined(CONFIG_DYNAMIC_DEBUG_CORE)
 
-- 
2.36.1

