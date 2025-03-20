Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C5EFA6AD65
	for <lists+dri-devel@lfdr.de>; Thu, 20 Mar 2025 19:53:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6087110E6A5;
	Thu, 20 Mar 2025 18:53:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="kxcUhE4K";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f45.google.com (mail-io1-f45.google.com
 [209.85.166.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43DDD10E697;
 Thu, 20 Mar 2025 18:53:11 +0000 (UTC)
Received: by mail-io1-f45.google.com with SMTP id
 ca18e2360f4ac-85b5e49615aso98786939f.1; 
 Thu, 20 Mar 2025 11:53:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742496790; x=1743101590; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=u2HtmGhNDb2dhJFTvWNt0DX2Cb95hP6h9cGXGSWFAjo=;
 b=kxcUhE4KFQIfS3LabCZQTIRDUcL8x6GvpybDynDS4HJ2nOmjm2DMrVDnIx1Jxqb7Nr
 y+n//FTqQGtvx6vTTirrfoZTCBaDMCXIjqMxmr2jAhyP/YDja1jdz9fEH6OC/dzanU+q
 2pWU3U4uqqfz1Iu2WnbpxcEddn/+PkPaOLa0uEC0R3BaNEsuWBvrRFAzXaLd5rDs0Ckp
 d75wmIMkonIjaaFdaqQi5LK72GT3bs0FZhUK0qZp/tZMfKJjCysbcHX3TeYw44JpCFz4
 KGzrpN5J+MRNbss6cQKen79jAzVTa6WxqenzGahkxXscQPzOWef9qtq7xoY6YLTlisBW
 ZnRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742496790; x=1743101590;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=u2HtmGhNDb2dhJFTvWNt0DX2Cb95hP6h9cGXGSWFAjo=;
 b=FAo877/yN6kzlY2peJ/FTL6lF5VYh27F2ka5/SK2a1CXiWx1A4Q59HH4PYsJt/Fi5b
 KppRp0wc2W2/10BdFRAv9yDW7myfL4Ij2LwATC7OlI4wdR1+ydtOWrCX/CZMDwCbmD5z
 oEGi+l79E6+qhXWqM6fDG8HUDE66cv92bbdRH2nqfgKTjGD25xRgXGCKowcl1rfhaM4Q
 RQsYF6FkrmXBY9O4xYeJ15fotoMSOY5rdr7C7xkeniOqS634IHYK7Wobkj10wZdWgqKx
 yNIvrNHpfKl/JT6PuK2dFx/ZGFonrALFa8oCsaR6jEadi0cy7LDRbWvjE2vEG8dz8ghl
 DPcg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUA2/EZrzP6zN0QjAILsaSTX82kyReIxX/JkmsdaYy1AT7WFpfLyf6OhJMtPbM3wjXEFcNPNEt81LkN@lists.freedesktop.org,
 AJvYcCVeDXU+rGuDBayGw8KuHx6DFODHOo699FcAf25+U9IQcrizV9FmWTnv9ashvX2exxJ1V0SBIyirNnSU@lists.freedesktop.org,
 AJvYcCVxRNYMdlpxvWXTUAc2i1GbyYN/CawD8JFK7s7SQ0ngZDU0gwkoMtjxUFD54Sj0rYb65+3hgw07ZxocUgYWsQ==@lists.freedesktop.org,
 AJvYcCW2sgfDc9GDc43sYbmfs+NxeKCpWOLy6QzpjG7p8bUDC8cAUqOqzMgaqspTn6/TbdUdaoe62iZvGXQPJtT/yzOaqw==@lists.freedesktop.org,
 AJvYcCXynmhxGX9xgRjn2OLpd4Ia06nfDnJwZ3Hr1b/yj0HFyEB9kczeh3rfhUC3WbtnJ4a2wnDaJyvB@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy/WaJm6T2G+Jw7bBDXL2KHd4X/HwKD8kMjbi8PiKNJhKsqWnwV
 qws1V0bcPPSt3sXjVXDEtzfeGzufqsbboc0K4rUc+xSDITcUYlJL
X-Gm-Gg: ASbGncuRKzwV3+bkM9BG7Oa4S9Gz0uZw5fMCdJ104EZN/l9Nv/12IBOVOKUXlBH+Cra
 v+C/VYQldxILKScJ2rKWArwLo1rF86uX+Wf5ISdx+AGk5uPSmKHpmap09RDNkxEZTOq84wcGOBa
 q/YZ7QOSHf4efbnYvsHuz/5E6lUQLaTZHrgPOXSrhYNIriIOiLVVyBSrcYCq9v/O/H2HhNQHyvZ
 Npe+he97Dd/fc8q4umFlm4RHWoTGwNbrgWqhseIgKV9bFZTbz7qM4SJ/ktC2p+4gLuvXGo4NNM6
 bX2ZwLJTdZJeVTTPQXJI/ZYXJOXr5OPqzqkHYDNGkXHe48qsXJxQAM7pXR9R0wm8RTn5MLYWuWv
 ehQ==
X-Google-Smtp-Source: AGHT+IHFmzaE8OjiXBilCCpn8tJrXh3VWK7hgJl2zF7aDNWxvGFoPJOxkzRXw9OGMWWU4yVFOqB6iQ==
X-Received: by 2002:a05:6602:3786:b0:85b:5869:b5b with SMTP id
 ca18e2360f4ac-85e2ca899f5mr52484239f.6.1742496790456; 
 Thu, 20 Mar 2025 11:53:10 -0700 (PDT)
Received: from gandalf.. (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
 by smtp.googlemail.com with ESMTPSA id
 ca18e2360f4ac-85e2bc273e7sm7078039f.17.2025.03.20.11.53.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Mar 2025 11:53:10 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-gfx-trybot@lists.freedesktop.org
Cc: jbaron@akamai.com, gregkh@linuxfoundation.org, ukaszb@chromium.org,
 louis.chauvet@bootlin.com, daniel.vetter@ffwll.ch,
 tvrtko.ursulin@linux.intel.com, jani.nikula@intel.com,
 ville.syrjala@linux.intel.com, Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v2 08/59] dyndbg: refactor param_set_dyndbg_classes and below
Date: Thu, 20 Mar 2025 12:51:46 -0600
Message-ID: <20250320185238.447458-9-jim.cromie@gmail.com>
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

Refactor callchain below param_set_dyndbg_classes(1) to allow mod-name
specific settings.  Split (1) into upper/lower fns, adding modname
param to lower, and passing NULL in from upper.  Below that, add the
same param to ddebug_apply_class_bitmap(), and pass it thru to
_ddebug_queries(), replacing NULL with the param.

This allows the callchain to update the classmap in just one module,
vs just all as currently done.  While the sysfs param is unlikely to
ever update just one module, the callchain will be used for modprobe
handling, which should update only that just-probed module.

In ddebug_apply_class_bitmap(), also check for actual changes to the
bits before announcing them, to declutter logs.

No functional change.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
---
 lib/dynamic_debug.c | 65 ++++++++++++++++++++++++++++-----------------
 1 file changed, 40 insertions(+), 25 deletions(-)

diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index c609ff873224..4b001309bb6a 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -593,9 +593,10 @@ static int ddebug_exec_queries(char *query, const char *modname)
 	return nfound;
 }
 
-/* apply a new bitmap to the sys-knob's current bit-state */
+/* apply a new class-param setting */
 static int ddebug_apply_class_bitmap(const struct ddebug_class_param *dcp,
-				     unsigned long *new_bits, unsigned long *old_bits)
+				     unsigned long *new_bits, unsigned long *old_bits,
+				     const char *query_modname)
 {
 #define QUERY_SIZE 128
 	char query[QUERY_SIZE];
@@ -603,7 +604,9 @@ static int ddebug_apply_class_bitmap(const struct ddebug_class_param *dcp,
 	int matches = 0;
 	int bi, ct;
 
-	v2pr_info("apply: 0x%lx to: 0x%lx\n", *new_bits, *old_bits);
+	if (*new_bits != *old_bits)
+		v2pr_info("apply bitmap: 0x%lx to: 0x%lx for %s\n", *new_bits,
+			  *old_bits, query_modname ?: "'*'");
 
 	for (bi = 0; bi < map->length; bi++) {
 		if (test_bit(bi, new_bits) == test_bit(bi, old_bits))
@@ -612,12 +615,16 @@ static int ddebug_apply_class_bitmap(const struct ddebug_class_param *dcp,
 		snprintf(query, QUERY_SIZE, "class %s %c%s", map->class_names[bi],
 			 test_bit(bi, new_bits) ? '+' : '-', dcp->flags);
 
-		ct = ddebug_exec_queries(query, NULL);
+		ct = ddebug_exec_queries(query, query_modname);
 		matches += ct;
 
 		v2pr_info("bit_%d: %d matches on class: %s -> 0x%lx\n", bi,
 			  ct, map->class_names[bi], *new_bits);
 	}
+	if (*new_bits != *old_bits)
+		v2pr_info("applied bitmap: 0x%lx to: 0x%lx for %s\n", *new_bits,
+			  *old_bits, query_modname ?: "'*'");
+
 	return matches;
 }
 
@@ -672,7 +679,7 @@ static int param_set_dyndbg_classnames(const char *instr, const struct kernel_pa
 				continue;
 			}
 			curr_bits ^= BIT(cls_id);
-			totct += ddebug_apply_class_bitmap(dcp, &curr_bits, dcp->bits);
+			totct += ddebug_apply_class_bitmap(dcp, &curr_bits, dcp->bits, NULL);
 			*dcp->bits = curr_bits;
 			v2pr_info("%s: changed bit %d:%s\n", KP_NAME(kp), cls_id,
 				  map->class_names[cls_id]);
@@ -682,7 +689,7 @@ static int param_set_dyndbg_classnames(const char *instr, const struct kernel_pa
 			old_bits = CLASSMAP_BITMASK(*dcp->lvl);
 			curr_bits = CLASSMAP_BITMASK(cls_id + (wanted ? 1 : 0 ));
 
-			totct += ddebug_apply_class_bitmap(dcp, &curr_bits, &old_bits);
+			totct += ddebug_apply_class_bitmap(dcp, &curr_bits, &old_bits, NULL);
 			*dcp->lvl = (cls_id + (wanted ? 1 : 0));
 			v2pr_info("%s: changed bit-%d: \"%s\" %lx->%lx\n", KP_NAME(kp), cls_id,
 				  map->class_names[cls_id], old_bits, curr_bits);
@@ -696,18 +703,9 @@ static int param_set_dyndbg_classnames(const char *instr, const struct kernel_pa
 	return 0;
 }
 
-/**
- * param_set_dyndbg_classes - class FOO >control
- * @instr: string echo>d to sysfs, input depends on map_type
- * @kp:    kp->arg has state: bits/lvl, map, map_type
- *
- * Enable/disable prdbgs by their class, as given in the arguments to
- * DECLARE_DYNDBG_CLASSMAP.  For LEVEL map-types, enforce relative
- * levels by bitpos.
- *
- * Returns: 0 or <0 if error.
- */
-int param_set_dyndbg_classes(const char *instr, const struct kernel_param *kp)
+static int param_set_dyndbg_module_classes(const char *instr,
+					   const struct kernel_param *kp,
+					   const char *modnm)
 {
 	const struct ddebug_class_param *dcp = kp->arg;
 	const struct ddebug_class_map *map = dcp->map;
@@ -744,8 +742,8 @@ int param_set_dyndbg_classes(const char *instr, const struct kernel_param *kp)
 				KP_NAME(kp), inrep, CLASSMAP_BITMASK(map->length));
 			inrep &= CLASSMAP_BITMASK(map->length);
 		}
-		v2pr_info("bits:%lx > %s\n", inrep, KP_NAME(kp));
-		totct += ddebug_apply_class_bitmap(dcp, &inrep, dcp->bits);
+		v2pr_info("bits:0x%lx > %s.%s\n", inrep, modnm ?: "*", KP_NAME(kp));
+		totct += ddebug_apply_class_bitmap(dcp, &inrep, dcp->bits, modnm);
 		*dcp->bits = inrep;
 		break;
 	case DD_CLASS_TYPE_LEVEL_NUM:
@@ -758,7 +756,7 @@ int param_set_dyndbg_classes(const char *instr, const struct kernel_param *kp)
 		old_bits = CLASSMAP_BITMASK(*dcp->lvl);
 		new_bits = CLASSMAP_BITMASK(inrep);
 		v2pr_info("lvl:%ld bits:0x%lx > %s\n", inrep, new_bits, KP_NAME(kp));
-		totct += ddebug_apply_class_bitmap(dcp, &new_bits, &old_bits);
+		totct += ddebug_apply_class_bitmap(dcp, &new_bits, &old_bits, modnm);
 		*dcp->lvl = inrep;
 		break;
 	default:
@@ -767,16 +765,33 @@ int param_set_dyndbg_classes(const char *instr, const struct kernel_param *kp)
 	vpr_info("%s: total matches: %d\n", KP_NAME(kp), totct);
 	return 0;
 }
+
+/**
+ * param_set_dyndbg_classes - classmap kparam setter
+ * @instr: string echo>d to sysfs, input depends on map_type
+ * @kp:    kp->arg has state: bits/lvl, map, map_type
+ *
+ * enable/disable all class'd pr_debugs in the classmap. For LEVEL
+ * map-types, enforce * relative levels by bitpos.
+ *
+ * Returns: 0 or <0 if error.
+ */
+int param_set_dyndbg_classes(const char *instr, const struct kernel_param *kp)
+{
+	return param_set_dyndbg_module_classes(instr, kp, NULL);
+}
 EXPORT_SYMBOL(param_set_dyndbg_classes);
 
 /**
- * param_get_dyndbg_classes - classes reader
+ * param_get_dyndbg_classes - classmap kparam getter
  * @buffer: string description of controlled bits -> classes
  * @kp:     kp->arg has state: bits, map
  *
- * Reads last written state, underlying prdbg state may have been
- * altered by direct >control.  Displays 0x for DISJOINT, 0-N for
- * LEVEL Returns: #chars written or <0 on error
+ * Reads last written state, underlying pr_debug states may have been
+ * altered by direct >control.  Displays 0x for DISJOINT classmap
+ * types, 0-N for LEVEL types.
+ *
+ * Returns: ct of chars written or <0 on error
  */
 int param_get_dyndbg_classes(char *buffer, const struct kernel_param *kp)
 {
-- 
2.49.0

