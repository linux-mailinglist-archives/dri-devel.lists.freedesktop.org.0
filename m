Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 10DD7577B4C
	for <lists+dri-devel@lfdr.de>; Mon, 18 Jul 2022 08:39:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5B55A9CEC;
	Mon, 18 Jul 2022 06:38:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com
 [IPv6:2607:f8b0:4864:20::d33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E651A9CA7;
 Mon, 18 Jul 2022 06:38:37 +0000 (UTC)
Received: by mail-io1-xd33.google.com with SMTP id y2so8523711ior.12;
 Sun, 17 Jul 2022 23:38:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SGsxNGoyeS6i6viq97Hpi9t+LziL3Bicz8xpppAaUyQ=;
 b=CTklXbUHN/RqwJtsTXWNf8kER4L41lqgco4x1FbZplXaOxaWcMWYmcC/OiCS8hRlRi
 XromEI9R7iJaei8N7bAEH6uft4snrGJ73FYiJ4btA4o5/UfJ6+xQ45KtxYT0lQja3ykC
 wqVCvplLyP79ViD2DY10baxQoJD8WzptnFZV5JrdrNw/wZVuTXp6MyDFfXiJ7/N6R0qn
 5CIxhsbNlmoQ4v2tON+O89Z7IwfPVAr4tKmXM42E20K1lTifgeE1QZ8TKS/saOM/QTbQ
 ANgKEyAubDF+STrKkQY3Pq2rFPD8PiUJS7e7LDMPBS+XRuMSTIgOXWUh8QBGbbtVlC9H
 wRPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SGsxNGoyeS6i6viq97Hpi9t+LziL3Bicz8xpppAaUyQ=;
 b=sziuNTUhgCAzGypN1S/sXIw2BD4fqrF6D8FZ/wIbLXsSeG3fnrYJqN+3u+IlC2CBYa
 xG22+PRpRI0ASlWqGQH3l95KKoJ84NB9pGdbuLj/IKBpuG7+grQeKdvpiWfrYK1KUFFN
 T21tDgqaROP07M24Xbe1BJFZ4iHYZH69cPEVc3OjdNIVciYLpB/omJL2P8QswnmST9ve
 2Mxmb4AUO0g8czYc5fHzUL+E6L9/IUTr3nbNDjHizQ4ludYvcrv/GTHFwx6r5ftTT06L
 b43c3drZjxSMxBqgg67l8zxYZTZvEImKV66jMBv6vHLV1EsIVBvvp6vWFY+CDTB1dPCV
 tNMA==
X-Gm-Message-State: AJIora+KenxLi18JZkNNlDpwYga1pKLzb0sNpedyNwQwvrkuILRY7RRC
 sN+ia2o7YpitSBbECa0OyfQ=
X-Google-Smtp-Source: AGRyM1uza3edZ9sVrrdHQT1pY7JVdKYWz1SqRx7/VRjkWV5CWONYdnSRzN/CqICxCw89oPeEx2f42Q==
X-Received: by 2002:a05:6638:d52:b0:341:40ca:b21f with SMTP id
 d18-20020a0566380d5200b0034140cab21fmr10374091jak.35.1658126316349; 
 Sun, 17 Jul 2022 23:38:36 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 o12-20020a92a80c000000b002dcd35bb030sm2342604ilh.74.2022.07.17.23.38.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Jul 2022 23:38:35 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com
Subject: [PATCH v3 16/41] dyndbg: add drm.debug style bitmap support
Date: Mon, 18 Jul 2022 00:36:00 -0600
Message-Id: <20220718063641.9179-17-jim.cromie@gmail.com>
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

Add kernel_param_ops and callbacks to apply a class-map to a
sysfs-node, which then can control classes defined in that class-map.
This supports uses like:

  echo 0x3 > /sys/module/drm/parameters/debug

IE add these:

 - int param_set_dyndbg_classes()
 - int param_get_dyndbg_classes()
 - struct kernel_param_ops param_ops_dyndbg_classes

Following the model of kernel/params.c STANDARD_PARAM_DEFS, these are
non-static and exported.  This might be unnecessary here.

get/set use an augmented kernel_param; the arg refs a new struct
ddebug_classes_bitmap_param, initialized by DYNAMIC_DEBUG_CLASSBITS
macro, which contains:

BITS: a pointer to the user module's ulong holding the bits/state.  By
ref'g the client's bit-state _var, we coordinate with existing code
(such as drm_debug_enabled) which uses the _var, so it works
unchanged, even as the foundation is switched out underneath it..
Using a ulong allows use of BIT() etc.

FLAGS: dyndbg.flags toggled by changes to bitmap. Usually just "p".

MAP: a pointer to struct ddebug_classes_map, which maps those
class-names to .class_ids 0..N that the module is using.  This
class-map is declared & initialized by DEFINE_DYNDBG_CLASSMAP.

map-type: add support here for DD_CLASS_DISJOINT, DD_CLASS_VERBOSE.

These 2 class-types both expect an integer; _DISJOINT treats input
like a bit-vector (ala drm.debug), and sets each bit accordingly.

_VERBOSE treats input like a bit-pos:N, then sets bits(0..N)=1, and
bits(N+1..max)=0.  This applies (bit<N) semantics on top of disjoint
bits.

cases DD_CLASS_SYMBOLIC, DD_CLASS_LEVELS are included for the complete
picture, with commented out call to a following commit.

NOTES:

this now includes SYMBOLIC/LEVELS support, too tedious to keep
separate thru all the tweaking.

get-param undoes the bit-pos -> bitmap transform that set-param does
on VERBOSE inputs, this gives the read-what-was-written property.

_VERBOSE is overlay on _DISJOINT:

verbose-maps still need class-names, even though theyre not usable at
the sysfs interface (unlike with _SYMBOLIC/_LEVELS).

 - It must have a "V0" name,
   something below "V1" to turn "V1" off.
   __pr_debug_cls(V0,..) is printk, don't do that.

 - "class names" is required at the >control interface.
 - relative levels are not enforced at >control

IOW this is possible, and maybe confusing:

  echo class V3 +p > control
  echo class V1 -p > control

IMO thats ok, relative verbosity is an interface property.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
. drop kp->mod->name as unneeded (build-dependent) <lkp>
---
 include/linux/dynamic_debug.h |  18 ++++
 lib/dynamic_debug.c           | 193 ++++++++++++++++++++++++++++++++++
 2 files changed, 211 insertions(+)

diff --git a/include/linux/dynamic_debug.h b/include/linux/dynamic_debug.h
index f57076e02767..b50bdd5c8184 100644
--- a/include/linux/dynamic_debug.h
+++ b/include/linux/dynamic_debug.h
@@ -113,6 +113,12 @@ struct ddebug_class_map {
 #define NUM_TYPE_ARGS(eltype, ...)				\
 	(sizeof((eltype[]) {__VA_ARGS__}) / sizeof(eltype))
 
+struct ddebug_classes_bitmap_param {
+	unsigned long *bits;
+	char flags[8];
+	const struct ddebug_class_map *map;
+};
+
 #if defined(CONFIG_DYNAMIC_DEBUG_CORE)
 
 int ddebug_add_module(struct _ddebug *tab, unsigned int num_debugs,
@@ -274,6 +280,10 @@ void __dynamic_ibdev_dbg(struct _ddebug *descriptor,
 				   KERN_DEBUG, prefix_str, prefix_type,	\
 				   rowsize, groupsize, buf, len, ascii)
 
+struct kernel_param;
+int param_set_dyndbg_classes(const char *instr, const struct kernel_param *kp);
+int param_get_dyndbg_classes(char *buffer, const struct kernel_param *kp);
+
 /* for test only, generally expect drm.debug style macro wrappers */
 #define __pr_debug_cls(cls, fmt, ...) do {			\
 	BUILD_BUG_ON_MSG(!__builtin_constant_p(cls),		\
@@ -322,6 +332,14 @@ static inline int ddebug_dyndbg_module_param_cb(char *param, char *val,
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
index 4c27bbe5187e..dd27dc514aa3 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -596,6 +596,199 @@ static int ddebug_exec_queries(char *query, const char *modname)
 	return nfound;
 }
 
+static int ddebug_apply_class_bitmap(const struct ddebug_classes_bitmap_param *dcp,
+				     unsigned long inbits)
+{
+#define QUERY_SIZE 128
+	char query[QUERY_SIZE];
+	const struct ddebug_class_map *map = dcp->map;
+	int matches = 0;
+	int bi, ct;
+
+	v2pr_info("in: 0x%lx on: 0x%lx\n", inbits, *dcp->bits);
+
+	for (bi = 0; bi < map->length; bi++) {
+		if (test_bit(bi, &inbits) == test_bit(bi, dcp->bits))
+			continue;
+
+		snprintf(query, QUERY_SIZE, "class %s %c%s", map->class_names[bi],
+			 test_bit(bi, &inbits) ? '+' : '-', dcp->flags);
+
+		ct = ddebug_exec_queries(query, NULL);
+		matches += ct;
+
+		v2pr_info("bit_%d: %d matches on class: %s -> 0x%lx\n", bi,
+			  ct, map->class_names[bi], inbits);
+	}
+	return matches;
+}
+
+/* support for [+-] symbolic-name boolean list */
+static int param_set_dyndbg_class_strings(const char *instr, const struct kernel_param *kp)
+{
+	const struct ddebug_classes_bitmap_param *dcp = kp->arg;
+	const struct ddebug_class_map *map = dcp->map;
+	unsigned long inbits;
+	int idx, totct = 0;
+	bool wanted;
+	char *cls, *p;
+
+	cls = kstrdup(instr, GFP_KERNEL);
+	p = strchr(cls, '\n');
+	if (p)
+		*p = '\0';
+
+	vpr_info("\"%s\" > %s\n", cls, kp->name);
+	inbits = *dcp->bits;
+
+	for (; cls; cls = p) {
+		p = strchr(cls, ',');
+		if (p)
+			*p++ = '\0';
+
+		if (*cls == '-') {
+			wanted = false;
+			cls++;
+		} else {
+			wanted = true;
+			if (*cls == '+')
+				cls++;
+		}
+		idx = match_string(map->class_names, map->length, cls);
+		if (idx < 0) {
+			pr_err("%s unknown to %s\n", cls, kp->name);
+			continue;
+		}
+
+		switch (map->map_type) {
+		case DD_CLASS_TYPE_SYMBOLIC:
+			if (test_bit(idx, &inbits) == wanted) {
+				v3pr_info("no change on %s\n", cls);
+				continue;
+			}
+			inbits ^= BIT(idx);
+			break;
+		case DD_CLASS_TYPE_LEVELS:
+			/* bitmask must respect classmap ranges, this does not */
+			inbits = (1 << (idx + wanted));
+			break;
+		default:
+			pr_err("illegal map-type value %d\n", map->map_type);
+		}
+		v2pr_info("%s: bit %d: %s\n", kp->name, idx, map->class_names[idx]);
+		totct += ddebug_apply_class_bitmap(dcp, inbits);
+	}
+	kfree(cls);
+	*dcp->bits = inbits;
+	vpr_info("total matches: %d\n", totct);
+	return 0;
+}
+
+#define CLASSMAP_BITMASK(width) ((1UL << (width)) - 1)
+
+/**
+ * param_set_dyndbg_classes - bits => categories >control setter
+ * @instr: string echo>d to sysfs
+ * @kp:    kp->arg has state: bits, map
+ *
+ * Enable/disable prdbgs by their "category", as given in the
+ * arguments to DYNAMIC_DEBUG_CLASSES.
+ *
+ * Returns: 0 or <0 if error.
+ */
+int param_set_dyndbg_classes(const char *instr, const struct kernel_param *kp)
+{
+	const struct ddebug_classes_bitmap_param *dcp = kp->arg;
+	const struct ddebug_class_map *map = dcp->map;
+	unsigned long inrep;
+	int rc, totct = 0;
+
+	switch (map->map_type) {
+
+	case DD_CLASS_TYPE_SYMBOLIC:
+	case DD_CLASS_TYPE_LEVELS:
+		/* CSV list of [+-]classnames */
+		return param_set_dyndbg_class_strings(instr, kp);
+
+	case DD_CLASS_TYPE_DISJOINT:
+	case DD_CLASS_TYPE_VERBOSE:
+		/* numeric input */
+		rc = kstrtoul(instr, 0, &inrep);
+		if (rc) {
+			pr_err("expecting numeric input: %s > %s\n", instr, kp->name);
+			return -EINVAL;
+		}
+		break;
+	default:
+		pr_err("%s: bad map type: %d\n", kp->name, map->map_type);
+		return -EINVAL;
+	}
+
+	switch (map->map_type) {
+	case DD_CLASS_TYPE_DISJOINT:
+		/* expect bits. mask and warn if too many */
+		if (inrep & ~CLASSMAP_BITMASK(map->length)) {
+			pr_warn("%s: input: 0x%lx exceeds mask: 0x%lx, masking\n",
+				kp->name, inrep, CLASSMAP_BITMASK(map->length));
+			inrep &= CLASSMAP_BITMASK(map->length);
+		}
+		break;
+	case DD_CLASS_TYPE_VERBOSE:
+		/* input is bitpos, of highest verbosity enabled */
+		if (inrep > map->length) {
+			pr_warn("%s: verbosity:%ld exceeds range:%d, clamping\n",
+				kp->name, inrep, map->length);
+			inrep = map->length;
+		}
+		v2pr_info("VERBOSE: %ld > %s\n", inrep, kp->name);
+		inrep = CLASSMAP_BITMASK(inrep + 1);
+		break;
+	default:
+		pr_warn("%s: bad map type: %d\n", kp->name, map->map_type);
+	}
+	totct += ddebug_apply_class_bitmap(dcp, inrep);
+	*dcp->bits = inrep;
+
+	vpr_info("%s: total matches: %d\n", kp->name, totct);
+	return 0;
+}
+EXPORT_SYMBOL(param_set_dyndbg_classes);
+
+/**
+ * param_get_dyndbg_classes - classes reader
+ * @buffer: string description of controlled bits -> classes
+ * @kp:     kp->arg has state: bits, map
+ *
+ * Reads last written bits, underlying prdbg state may have changed since.
+ * Returns: #chars written or <0 on error
+ */
+int param_get_dyndbg_classes(char *buffer, const struct kernel_param *kp)
+{
+	const struct ddebug_classes_bitmap_param *dcp = kp->arg;
+	const struct ddebug_class_map *map = dcp->map;
+	unsigned long val = *dcp->bits;
+
+	switch (map->map_type) {
+	case DD_CLASS_TYPE_SYMBOLIC:
+	case DD_CLASS_TYPE_DISJOINT:
+	case DD_CLASS_TYPE_LEVELS:
+		return scnprintf(buffer, PAGE_SIZE, "0x%lx\n", val);
+	case DD_CLASS_TYPE_VERBOSE:
+		/* convert internal bits to a level */
+		return scnprintf(buffer, PAGE_SIZE, "%lu\n",
+				 find_first_zero_bit(&val, map->length) - 1);
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
2.36.1

