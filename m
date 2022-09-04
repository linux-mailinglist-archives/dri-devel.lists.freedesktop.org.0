Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA2015AC738
	for <lists+dri-devel@lfdr.de>; Sun,  4 Sep 2022 23:46:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13EB710E27A;
	Sun,  4 Sep 2022 21:42:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x12d.google.com (mail-il1-x12d.google.com
 [IPv6:2607:f8b0:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D46F110E163;
 Sun,  4 Sep 2022 21:42:29 +0000 (UTC)
Received: by mail-il1-x12d.google.com with SMTP id s11so3868108ilt.7;
 Sun, 04 Sep 2022 14:42:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=ER34tpiRxpxrqbyeNfK9kTxedh1cey5Wd7+bTMMeAt0=;
 b=gUiSZYP/k1pFS83DqE+EmB82be55p+NVZac494a9x4xvG65y6FIZ6bn2Dug8vAHY9q
 qzJdTJ0xaj0Tydn2YUrikCBWFQcFjSz5g9K7vIAtbjGAnIZi4K/jJs2sHNZBJ+baoA8l
 URtbxytNiVq1d9Gu6B/r7QOd6vTqF0GZqhWye1MbM7fFBWlQFQAJXor/wBXat4Nk7Et/
 pEIU7EQnt5M5neYGmrgk6SH/GT1IUmqsTEaBMUPKKfJBHtQW3Zxu7sdHRGllR577eVYj
 MSfDzcicu+qbF1uZp/QhiDLJS0y/yQR5YspuuKz5kZ2xpPb3n6kFqaSM4iSEEbLHVncg
 ltBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=ER34tpiRxpxrqbyeNfK9kTxedh1cey5Wd7+bTMMeAt0=;
 b=Ms/hYuY3s3IdUKrfA5eCvB1j6J2LzRsgu/rS9Jta2V81XDKBFJRungciE6007ckQEz
 52pSIsBwnH0F/KgpTA08hfY2Jy/k45ulHF/oguvXRXlArNNynbto+9ke4mXIiU1PFNqX
 yDfPzQOU/5mrDz0hlBlub4CVN9bP+wzYKxsvweumA0svRCww2XSFm/vEozboXRfekNCp
 sWeywDtR3tarXFRqmql+e/eZils8dEo8ZcVbS4mu4U6jtwgeLaL4eP3IIcfwi2FVEtG3
 83W0L3P3GpAOe63d92tAFZ6VT8UTvV5zXC0Lr58XSfzTtpMC0gGhjNEvvTrx6a7kt0X4
 TBLA==
X-Gm-Message-State: ACgBeo1iXc0A/p6TcE8f/M5azp6h0zSGykQHOFkJjwPBu5NQ4Yrgqcw/
 Z/ZtYdny5Ll1LXmiuzlXLkA=
X-Google-Smtp-Source: AA6agR58q6IyXd9WZ12hKcbIiqtMN6VqpqX1EWImJSjgdussO16aRw1Y1NKPghl79c/vNyaNEGfwGw==
X-Received: by 2002:a92:2c0e:0:b0:2ea:c3b8:433c with SMTP id
 t14-20020a922c0e000000b002eac3b8433cmr19399396ile.107.1662327749404; 
 Sun, 04 Sep 2022 14:42:29 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 e12-20020a056602044c00b006889ea7be7bsm3727688iov.29.2022.09.04.14.42.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Sep 2022 14:42:29 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, gregkh@linuxfoundation.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v6 20/57] dyndbg: add drm.debug style (drm/parameters/debug)
 bitmap support
Date: Sun,  4 Sep 2022 15:40:57 -0600
Message-Id: <20220904214134.408619-21-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220904214134.408619-1-jim.cromie@gmail.com>
References: <20220904214134.408619-1-jim.cromie@gmail.com>
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
Cc: daniel.vetter@ffwll.ch, linux@rasmusvillemoes.dk, seanpaul@chromium.org,
 joe@perches.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add kernel_param_ops and callbacks to use a class-map to validate and
apply input to a sysfs-node, which allows users to control classes
defined in that class-map.  This supports uses like:

  echo 0x3 > /sys/module/drm/parameters/debug

IE add these:

 - int param_set_dyndbg_classes()
 - int param_get_dyndbg_classes()
 - struct kernel_param_ops param_ops_dyndbg_classes

Following the model of kernel/params.c STANDARD_PARAM_DEFS, these are
non-static and exported.  This might be unnecessary here.

get/set use an augmented kernel_param; the arg refs a new struct
ddebug_class_param, which contains:

- A ptr to user's state-store; a union of &ulong for drm.debug, &int
  for nouveau level debug.  By ref'g the client's bit-state _var, code
  coordinates with existing code (like drm_debug_enabled) which uses
  it, so existing/remaining calls can work unchanged.  Changing
  drm.debug to a ulong allows use of BIT() etc.

- FLAGS: dyndbg.flags toggled by changes to bitmap. Usually just "p".

- MAP: a pointer to struct ddebug_classes_map, which maps those
  class-names to .class_ids 0..N that the module is using.  This
  class-map is declared & initialized by DECLARE_DYNDBG_CLASSMAP.

- map-type: 4 enums DD_CLASS_TYPE_* select 2 input forms and 2 meanings.

numeric input:
  DD_CLASS_TYPE_DISJOINT_BITS	integer input, independent bits. ie: drm.debug
  DD_CLASS_TYPE_LEVEL_NUM	integer input, 0..N levels

classnames-list (comma separated) input:
  DD_CLASS_TYPE_DISJOINT_NAMES	each name affects a bit, others preserved
  DD_CLASS_TYPE_LEVEL_NAMES	names have level meanings, like kern_levels.h

_NAMES    - comma-separated classnames (with optional +-)
_NUM      - numeric input, 0-N expected
_BITS     - numeric input, 0x1F bitmap form expected

_DISJOINT - bits are independent
_LEVEL    - (x<y) on bit-pos.

_DISJOINT treats input like a bit-vector (ala drm.debug), and sets
each bit accordingly.  LEVEL is layered on top of this.

_LEVEL treats input like a bit-pos:N, then sets bits(0..N)=1, and
bits(N+1..max)=0.  This applies (bit<N) semantics on top of disjoint
bits.

USAGES:

A potentially typical _DISJOINT_NAMES use:

  echo +DRM_UT_CORE,+DRM_UT_KMS,-DRM_UT_DRIVER,-DRM_UT_ATOMIC \
       > /sys/module/drm/parameters/debug_catnames

A naive _LEVEL_NAMES use, with one class, that sets all in the
class-map according to (x<y):

  : problem seen
  echo +L7 > /sys/module/test_dynamic_debug/parameters/p_level_names
  : problem solved
  echo -L1 > /sys/module/test_dynamic_debug/parameters/p_level_names

Note this artifact:

  : this is same as prev cmd (due to +/-)
  echo L0 > /sys/module/test_dynamic_debug/parameters/p_level_names

  : this is "even-more" off, but same wo __pr_debug_class(L0, "..").
  echo -L0 > /sys/module/test_dynamic_debug/parameters/p_level_names

A stress-test/make-work usage (kid toggling a light switch):

  echo +L7,L0,L7,L0,L7,L0,L7,L0,L7,L0,L7,L0,L7 \
       > /sys/module/test_dynamic_debug/parameters/p_level_names

ddebug_apply_class_bitmap(): inside-fn, works on bitmaps, receives
new-bits, finds diffs vs client-bitvector holding "current" state,
and issues exec_query to commit the adjustment.

param_set_dyndbg_classes(): interface fn, sends _NAMES to
param_set_dyndbg_classnames() and returns, falls thru to handle _BITS,
_NUM internally, and calls ddebug_apply_class_bitmap().  Finishes by
updating state.

param_set_dyndbg_classnames(): handles classnames-list in loop, calls
ddebug_apply_class_bitmap for each, then updates state.

NOTES:

_LEVEL_ is overlay on _DISJOINT_; inputs are converted to a bitmask,
by the callbacks.  IOW this is possible, and possibly confusing:

  echo class V3 +p > control
  echo class V1 -p > control

IMO thats ok, relative verbosity is an interface property.

_LEVEL_NUM maps still need class-names, even though the names are not
usable at the sysfs interface (unlike with _NAMES style).  The names
are the only way to >control the classes.

 - It must have a "V0" name,
   something below "V1" to turn "V1" off.
   __pr_debug_cls(V0,..) is printk, don't do that.

 - "class names" is required at the >control interface.
 - relative levels are not enforced at >control

_LEVEL_NAMES bear +/- signs, which alters the on-bit-pos by 1.  IOW,
+L2 means L0,L1,L2, and -L2 means just L0,L1.  This kinda spoils the
readback fidelity, since the L0 bit gets turned on by any use of any
L*, except "-L0".

All the interface uncertainty here pertains to the _NAMES features.
Nobody has actually asked for this, so its practical (if a little
tedious) to split it out.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
. drop kp->mod->name as unneeded (build-dependent) <lkp>
. param_set_dyndbg_classnames, not _class_strings
. DD_CLASS_TYPE_* name changes, per Jason
. callbacks:
  extend comments on DD_CLASS_TYPE_* handling, flow notes
  varname changes
. kdoc tweaks
. add stub macro: #define KP_NAME(kp)	kp->name
  later, add "$module." prefix when config doesn't do it
. s/struct ddebug_classes_bitmap_param/struct ddebug_class_param/
. fix levels state handling

v4 had trouble where level-type's state was fouled by conversion to
bitmap form given to apply-bitmap.  fix by:

   (simplify/clarify)
   add old-bits, new-bits to sysfs-iface&support
   use CLASSMAP_BITMASK more
   in param_set_dyndbg_class{es,names}():
      move state-saving inside switches, and tailor it to type.
      this preserves lvl-state, vs -v4 which didnt.

I could "hack" in an offset, but the problem feels deeper.

The root-problem may be the ambiguity wrt 0x0 > knob; per a
input-is-assert-bitpos interpretation, it turns on bit 0.

Thus far, code has avoided this ambiguity, by recommending against
coding pr_dbg_cls(V0|L0, ""), which makes "+L0" & "-L0" equivalent,
and "0" silent.

That might be "too clever by 1/2"; accepting an int, so -1 means
all-bits-off as well as verbosity-off, might be the better way.

fix-lvl-sz
---
 include/linux/dynamic_debug.h |  21 ++++
 lib/dynamic_debug.c           | 212 ++++++++++++++++++++++++++++++++++
 2 files changed, 233 insertions(+)

diff --git a/include/linux/dynamic_debug.h b/include/linux/dynamic_debug.h
index 9073a43a2039..41682278d2e8 100644
--- a/include/linux/dynamic_debug.h
+++ b/include/linux/dynamic_debug.h
@@ -119,6 +119,15 @@ struct _ddebug_info {
 	unsigned int num_classes;
 };
 
+struct ddebug_class_param {
+	union {
+		unsigned long *bits;
+		unsigned int *lvl;
+	};
+	char flags[8];
+	const struct ddebug_class_map *map;
+};
+
 #if defined(CONFIG_DYNAMIC_DEBUG_CORE)
 
 int ddebug_add_module(struct _ddebug_info *dyndbg, const char *modname);
@@ -278,6 +287,10 @@ void __dynamic_ibdev_dbg(struct _ddebug *descriptor,
 				   KERN_DEBUG, prefix_str, prefix_type,	\
 				   rowsize, groupsize, buf, len, ascii)
 
+struct kernel_param;
+int param_set_dyndbg_classes(const char *instr, const struct kernel_param *kp);
+int param_get_dyndbg_classes(char *buffer, const struct kernel_param *kp);
+
 /* for test only, generally expect drm.debug style macro wrappers */
 #define __pr_debug_cls(cls, fmt, ...) do {			\
 	BUILD_BUG_ON_MSG(!__builtin_constant_p(cls),		\
@@ -324,6 +337,14 @@ static inline int ddebug_dyndbg_module_param_cb(char *param, char *val,
 				rowsize, groupsize, buf, len, ascii);	\
 	} while (0)
 
+struct kernel_param;
+static inline int param_set_dyndbg_classes(const char *instr, const struct kernel_param *kp)
+{ return 0; }
+static inline int param_get_dyndbg_classes(char *buffer, const struct kernel_param *kp)
+{ return 0; }
+
 #endif /* !CONFIG_DYNAMIC_DEBUG_CORE */
 
+extern const struct kernel_param_ops param_ops_dyndbg_classes;
+
 #endif
diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index db96ded78c3f..009f2ead09c1 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -596,6 +596,218 @@ static int ddebug_exec_queries(char *query, const char *modname)
 	return nfound;
 }
 
+/* apply a new bitmap to the sys-knob's current bit-state */
+static int ddebug_apply_class_bitmap(const struct ddebug_class_param *dcp,
+				     unsigned long *new_bits, unsigned long *old_bits)
+{
+#define QUERY_SIZE 128
+	char query[QUERY_SIZE];
+	const struct ddebug_class_map *map = dcp->map;
+	int matches = 0;
+	int bi, ct;
+
+	v2pr_info("apply: 0x%lx to: 0x%lx\n", *new_bits, *old_bits);
+
+	for (bi = 0; bi < map->length; bi++) {
+		if (test_bit(bi, new_bits) == test_bit(bi, old_bits))
+			continue;
+
+		snprintf(query, QUERY_SIZE, "class %s %c%s", map->class_names[bi],
+			 test_bit(bi, new_bits) ? '+' : '-', dcp->flags);
+
+		ct = ddebug_exec_queries(query, NULL);
+		matches += ct;
+
+		v2pr_info("bit_%d: %d matches on class: %s -> 0x%lx\n", bi,
+			  ct, map->class_names[bi], *new_bits);
+	}
+	return matches;
+}
+
+/* stub to later conditionally add "$module." prefix where not already done */
+#define KP_NAME(kp)	kp->name
+
+#define CLASSMAP_BITMASK(width) ((1UL << (width)) - 1)
+
+/* accept comma-separated-list of [+-] classnames */
+static int param_set_dyndbg_classnames(const char *instr, const struct kernel_param *kp)
+{
+	const struct ddebug_class_param *dcp = kp->arg;
+	const struct ddebug_class_map *map = dcp->map;
+	unsigned long curr_bits, old_bits;
+	char *cl_str, *p, *tmp;
+	int cls_id, totct = 0;
+	bool wanted;
+
+	cl_str = tmp = kstrdup(instr, GFP_KERNEL);
+	p = strchr(cl_str, '\n');
+	if (p)
+		*p = '\0';
+
+	/* start with previously set state-bits, then modify */
+	curr_bits = old_bits = *dcp->bits;
+	vpr_info("\"%s\" > %s:0x%lx\n", cl_str, KP_NAME(kp), curr_bits);
+
+	for (; cl_str; cl_str = p) {
+		p = strchr(cl_str, ',');
+		if (p)
+			*p++ = '\0';
+
+		if (*cl_str == '-') {
+			wanted = false;
+			cl_str++;
+		} else {
+			wanted = true;
+			if (*cl_str == '+')
+				cl_str++;
+		}
+		cls_id = match_string(map->class_names, map->length, cl_str);
+		if (cls_id < 0) {
+			pr_err("%s unknown to %s\n", cl_str, KP_NAME(kp));
+			continue;
+		}
+
+		/* have one or more valid class_ids of one *_NAMES type */
+		switch (map->map_type) {
+		case DD_CLASS_TYPE_DISJOINT_NAMES:
+			/* the +/- pertains to a single bit */
+			if (test_bit(cls_id, &curr_bits) == wanted) {
+				v3pr_info("no change on %s\n", cl_str);
+				continue;
+			}
+			curr_bits ^= BIT(cls_id);
+			totct += ddebug_apply_class_bitmap(dcp, &curr_bits, dcp->bits);
+			*dcp->bits = curr_bits;
+			v2pr_info("%s: changed bit %d:%s\n", KP_NAME(kp), cls_id,
+				  map->class_names[cls_id]);
+			break;
+		case DD_CLASS_TYPE_LEVEL_NAMES:
+			/* cls_id = N in 0..max. wanted +/- determines N or N-1 */
+			old_bits = CLASSMAP_BITMASK(*dcp->lvl);
+			curr_bits = CLASSMAP_BITMASK(cls_id + (wanted ? 1 : 0 ));
+
+			totct += ddebug_apply_class_bitmap(dcp, &curr_bits, &old_bits);
+			*dcp->lvl = (cls_id + (wanted ? 1 : 0));
+			v2pr_info("%s: changed bit-%d: \"%s\" %lx->%lx\n", KP_NAME(kp), cls_id,
+				  map->class_names[cls_id], old_bits, curr_bits);
+			break;
+		default:
+			pr_err("illegal map-type value %d\n", map->map_type);
+		}
+	}
+	kfree(tmp);
+	vpr_info("total matches: %d\n", totct);
+	return 0;
+}
+
+/**
+ * param_set_dyndbg_classes - class FOO >control
+ * @instr: string echo>d to sysfs, input depends on map_type
+ * @kp:    kp->arg has state: bits/lvl, map, map_type
+ *
+ * Enable/disable prdbgs by their class, as given in the arguments to
+ * DECLARE_DYNDBG_CLASSMAP.  For LEVEL map-types, enforce relative
+ * levels by bitpos.
+ *
+ * Returns: 0 or <0 if error.
+ */
+int param_set_dyndbg_classes(const char *instr, const struct kernel_param *kp)
+{
+	const struct ddebug_class_param *dcp = kp->arg;
+	const struct ddebug_class_map *map = dcp->map;
+	unsigned long inrep, new_bits, old_bits;
+	int rc, totct = 0;
+
+	switch (map->map_type) {
+
+	case DD_CLASS_TYPE_DISJOINT_NAMES:
+	case DD_CLASS_TYPE_LEVEL_NAMES:
+		/* handle [+-]classnames list separately, we are done here */
+		return param_set_dyndbg_classnames(instr, kp);
+
+	case DD_CLASS_TYPE_DISJOINT_BITS:
+	case DD_CLASS_TYPE_LEVEL_NUM:
+		/* numeric input, accept and fall-thru */
+		rc = kstrtoul(instr, 0, &inrep);
+		if (rc) {
+			pr_err("expecting numeric input: %s > %s\n", instr, KP_NAME(kp));
+			return -EINVAL;
+		}
+		break;
+	default:
+		pr_err("%s: bad map type: %d\n", KP_NAME(kp), map->map_type);
+		return -EINVAL;
+	}
+
+	/* only _BITS,_NUM (numeric) map-types get here */
+	switch (map->map_type) {
+	case DD_CLASS_TYPE_DISJOINT_BITS:
+		/* expect bits. mask and warn if too many */
+		if (inrep & ~CLASSMAP_BITMASK(map->length)) {
+			pr_warn("%s: input: 0x%lx exceeds mask: 0x%lx, masking\n",
+				KP_NAME(kp), inrep, CLASSMAP_BITMASK(map->length));
+			inrep &= CLASSMAP_BITMASK(map->length);
+		}
+		v2pr_info("bits:%lx > %s\n", inrep, KP_NAME(kp));
+		totct += ddebug_apply_class_bitmap(dcp, &inrep, dcp->bits);
+		*dcp->bits = inrep;
+		break;
+	case DD_CLASS_TYPE_LEVEL_NUM:
+		/* input is bitpos, of highest verbosity to be enabled */
+		if (inrep > map->length) {
+			pr_warn("%s: level:%ld exceeds max:%d, clamping\n",
+				KP_NAME(kp), inrep, map->length);
+			inrep = map->length;
+		}
+		old_bits = CLASSMAP_BITMASK(*dcp->lvl);
+		new_bits = CLASSMAP_BITMASK(inrep);
+		v2pr_info("lvl:%ld bits:0x%lx > %s\n", inrep, new_bits, KP_NAME(kp));
+		totct += ddebug_apply_class_bitmap(dcp, &new_bits, &old_bits);
+		*dcp->lvl = inrep;
+		break;
+	default:
+		pr_warn("%s: bad map type: %d\n", KP_NAME(kp), map->map_type);
+	}
+	vpr_info("%s: total matches: %d\n", KP_NAME(kp), totct);
+	return 0;
+}
+EXPORT_SYMBOL(param_set_dyndbg_classes);
+
+/**
+ * param_get_dyndbg_classes - classes reader
+ * @buffer: string description of controlled bits -> classes
+ * @kp:     kp->arg has state: bits, map
+ *
+ * Reads last written state, underlying prdbg state may have been
+ * altered by direct >control.  Displays 0x for DISJOINT, 0-N for
+ * LEVEL Returns: #chars written or <0 on error
+ */
+int param_get_dyndbg_classes(char *buffer, const struct kernel_param *kp)
+{
+	const struct ddebug_class_param *dcp = kp->arg;
+	const struct ddebug_class_map *map = dcp->map;
+
+	switch (map->map_type) {
+
+	case DD_CLASS_TYPE_DISJOINT_NAMES:
+	case DD_CLASS_TYPE_DISJOINT_BITS:
+		return scnprintf(buffer, PAGE_SIZE, "0x%lx\n", *dcp->bits);
+
+	case DD_CLASS_TYPE_LEVEL_NAMES:
+	case DD_CLASS_TYPE_LEVEL_NUM:
+		return scnprintf(buffer, PAGE_SIZE, "%d\n", *dcp->lvl);
+	default:
+		return -1;
+	}
+}
+EXPORT_SYMBOL(param_get_dyndbg_classes);
+
+const struct kernel_param_ops param_ops_dyndbg_classes = {
+	.set = param_set_dyndbg_classes,
+	.get = param_get_dyndbg_classes,
+};
+EXPORT_SYMBOL(param_ops_dyndbg_classes);
+
 #define PREFIX_SIZE 64
 
 static int remaining(int wrote)
-- 
2.37.2

