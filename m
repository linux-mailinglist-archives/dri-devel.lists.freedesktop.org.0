Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E267457BA1D
	for <lists+dri-devel@lfdr.de>; Wed, 20 Jul 2022 17:34:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DD018F4C6;
	Wed, 20 Jul 2022 15:33:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x132.google.com (mail-il1-x132.google.com
 [IPv6:2607:f8b0:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A48DB8F24F;
 Wed, 20 Jul 2022 15:33:10 +0000 (UTC)
Received: by mail-il1-x132.google.com with SMTP id h16so9464252ila.2;
 Wed, 20 Jul 2022 08:33:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qFjsd1tLyZv1o9uQBK/fQBb5x3evkNzCgXvUiKZ53b8=;
 b=Rr+nBQ4hcIXj1spJEUx7XZkEQOruMqwjNnWGpMrG7tRCa/9vtfLE5HUP0A4sasuq+M
 SJvNC5zSLXQdJ7Ehm1HBDV8nUUJnnQs5s9nElS3h6/ME/ubq9A6YWs7ajrLrjdtA5HEB
 KE6q1Vynk2WDDKIhq8lm/ABHVQSFBynFmKqD5J7kfmip3hCbt49y6JMdEslAY2AGdMXc
 5giEq/5a2m4sk8SLcqFC/2iQloHH+hB9nGC0JBcI//8NsI4EHXhTRtHBXNVzj7vw9uch
 +Fl/Ys5G8lwdtJZam132E2wuPOCk0kBT2fCYZGyX5GV2daWxeDodctfVKXpAsuse8yx5
 V8aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qFjsd1tLyZv1o9uQBK/fQBb5x3evkNzCgXvUiKZ53b8=;
 b=phnvwEZAnX40sU4S8BBTXKhaHQFyLX/d0UfSx2eDE3PeikXS8N++y3OIDlHWFLSzH6
 F5PkgdugY140BMFiEzN4xfLgwNp6IvE6WmfLCGaAY6BvTSykEA7XazWNn4lyiGCtq4kU
 +M6alfF2DgJb1YkpucfrIA4LugL4WIFbOOT9NGzgW3BAh5fv9mGZcmNID+JaIzQWdFdy
 D2iltm5nspv05RfwZquR0Kf1zD5ozCw3GcRt408frukXTaksqavsc12UOQk9JSsjyrco
 L62AbrKAI9++JRo2wLw86x8fSVr1SeWAfYwDw55PmBDJySsp6HA3Sg8rlF1bGF+6aC68
 5Hvw==
X-Gm-Message-State: AJIora8WgsoZo+oixwaBrvQ/IEEw7no9gW8rEgCP1Xqwr88raF5H2TZd
 Wq2lEORwpvDWEvVxLH9C6OB/D9IToldztQ==
X-Google-Smtp-Source: AGRyM1tdOBeCZwNZ3h4fFcbdbCyTnQzQjxsqx1rwWeJ3Qvj2UnXzt/IlKlfkOFkHru6ogI4m58mUUw==
X-Received: by 2002:a05:6e02:102:b0:2dc:8fa:5f9d with SMTP id
 t2-20020a056e02010200b002dc08fa5f9dmr19271597ilm.231.1658331189200; 
 Wed, 20 Jul 2022 08:33:09 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 q1-20020a92d401000000b002dcdb4bbe87sm4579581ilm.22.2022.07.20.08.33.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Jul 2022 08:33:08 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 jbaron@akamai.com, gregkh@linuxfoundation.org, daniel.vetter@ffwll.ch,
 seanpaul@chromium.org, robdclark@gmail.com
Subject: [PATCH v4 12/41] dyndbg: add DECLARE_DYNDBG_CLASSMAP
Date: Wed, 20 Jul 2022 09:32:04 -0600
Message-Id: <20220720153233.144129-13-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220720153233.144129-1-jim.cromie@gmail.com>
References: <20220720153233.144129-1-jim.cromie@gmail.com>
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

