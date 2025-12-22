Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D02DCD4FCF
	for <lists+dri-devel@lfdr.de>; Mon, 22 Dec 2025 09:23:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D09D810E57B;
	Mon, 22 Dec 2025 08:23:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="iBdB1a5O";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
 [209.85.210.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDB0010E578
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Dec 2025 08:23:21 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id
 d2e1a72fcca58-7aab7623f42so4295683b3a.2
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Dec 2025 00:23:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1766391801; x=1766996601; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=esuoUN/X0OUOWwx+QdeV/Q9GgUdfEO6lTOhgSGNn33g=;
 b=iBdB1a5OXuwfQPGdsIaNpdxKB+YPCKkUd7D/jR0kp8PIWzkiJzAGv/UINbK7CBIXWr
 h2wKmWchRa85klM4MR4O4ndzudQXm5aZatNxEai95+CRJ4/ZHBRQY3HvLQFT5uEDBkmR
 NKhw6ULUWsdqIwTams+Yx3kgM64/iD3Dj99H21BIBTIxv+9C0r1Q9Y17hFzV0LUKoI15
 T3GlPdE4plk/c9kPT2HOtp5moLdG4XKFZr4AiInSgGOELv/SZNSLkvNtNIAreTvtPBVL
 wygpaX7N13tJwydu5ThD1Riie8Qc0//kfNlfVI3maej4O4mo/mjUlC1l6hmo9gty3TIH
 hwFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766391801; x=1766996601;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=esuoUN/X0OUOWwx+QdeV/Q9GgUdfEO6lTOhgSGNn33g=;
 b=b7PnNZxMe4fo1a8BfozJsdMkDcLsxvtfsRgiNjy0X/L/PZk9EH9TTj1FNMVPk4Qxrp
 QOyDFsSi1/9CzUR7FrxN9+gX8PrGSWDX8quoMEqxL5CUFNx/07teHq2QJDS+lkQkW1FG
 kfS9IJlIWj7dG1lU75mLjY9f2zsW6w+TcmqxOmvjo1YQC353gtrN5W206FUmVHu83XTL
 cUabCLaT01Z2SGJK+EPefPsnA3BvDpamSI6E3Cj2RMAesW8kxLFZbqZL51b+Vz/iRMYL
 g/SoC63tpMFJ/fGjKodNcBkwB4Od0k8lWlxQiXb5aCu5/sgfZduHsNtofjDwlA5/vdQ3
 SR5A==
X-Gm-Message-State: AOJu0Yzc7cYE1dKxlsROoZqNogFNtrEdgXw0K2xNj+OwD3sDL+ttyBQ0
 dq8o1TullAZLvUlYmRIFM81uf+3IFtBLqmItLBGgMRtf/1kFYnxnhIsS
X-Gm-Gg: AY/fxX5j64rOx42yDr+MozqpHaXVQJUumBXvFSSiieo6R/uXduuTIIiP9vNmCCCXe69
 x+mhUUbmx3nl748bSTi5VkaXancP00LRdAgNvxATccmI2I8lFlpr6Rq2BdjElZyi4ubCYXWbnfo
 J7W6gXWx2atPSW/R3Q4qf7vhhWje1LHvbNVNB3gjaNIUjp42DyhYxVkxAq1baf+AQt/HXP9PMiJ
 HcMpkH5xnprTtmjIg1wUugM+TAYYYR/lpL8f4gg1Ilg8URpWpwKhyOsYXtt3uWAbqZkQNbAOgKY
 LwrBo4ucuEtgzUxBV1k2JKdkzlFDdYvaMLM9yZC79g4kOgzcFwSTeReQmpOIl4OasX9Ooj+ssST
 3Hs0NQ7oIN9Si//t79+ck9+EHAZzlmJDLfHx7khOjIMUPEdunZV5REpVEf7+Sg+m3sRHQBOdMuk
 KifxFWwFWe
X-Google-Smtp-Source: AGHT+IGzQX0tN2JfceE4PO7awRUVxocYlOqPauoRRHBHZG89mr58gOjfvOVdijtg0YzN15AwLAVPpw==
X-Received: by 2002:a05:6a00:1d27:b0:7f7:1857:8456 with SMTP id
 d2e1a72fcca58-7ff6667cdb2mr8429960b3a.55.1766391801376; 
 Mon, 22 Dec 2025 00:23:21 -0800 (PST)
Received: from frodo ([2404:4400:417e:3d00:8b90:7f55:1261:772f])
 by smtp.googlemail.com with ESMTPSA id
 d2e1a72fcca58-7ff7e493123sm9540699b3a.50.2025.12.22.00.23.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Dec 2025 00:23:20 -0800 (PST)
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
Subject: [PATCH v7 11/31] dyndbg: refactor param_set_dyndbg_classes and below
Date: Mon, 22 Dec 2025 21:20:28 +1300
Message-ID: <20251222082049.1782440-12-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251222082049.1782440-3-jim.cromie@gmail.com>
References: <20251222082049.1782440-3-jim.cromie@gmail.com>
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

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 lib/dynamic_debug.c | 65 ++++++++++++++++++++++++++++-----------------
 1 file changed, 40 insertions(+), 25 deletions(-)

diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index 1db2f627237a..64d69f5cba1b 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -604,9 +604,10 @@ static int ddebug_exec_queries(char *query, const char *modname)
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
@@ -614,7 +615,9 @@ static int ddebug_apply_class_bitmap(const struct ddebug_class_param *dcp,
 	int matches = 0;
 	int bi, ct;
 
-	v2pr_info("apply: 0x%lx to: 0x%lx\n", *new_bits, *old_bits);
+	if (*new_bits != *old_bits)
+		v2pr_info("apply bitmap: 0x%lx to: 0x%lx for %s\n", *new_bits,
+			  *old_bits, query_modname ?: "'*'");
 
 	for (bi = 0; bi < map->length; bi++) {
 		if (test_bit(bi, new_bits) == test_bit(bi, old_bits))
@@ -623,12 +626,16 @@ static int ddebug_apply_class_bitmap(const struct ddebug_class_param *dcp,
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
 
@@ -683,7 +690,7 @@ static int param_set_dyndbg_classnames(const char *instr, const struct kernel_pa
 				continue;
 			}
 			curr_bits ^= BIT(cls_id);
-			totct += ddebug_apply_class_bitmap(dcp, &curr_bits, dcp->bits);
+			totct += ddebug_apply_class_bitmap(dcp, &curr_bits, dcp->bits, NULL);
 			*dcp->bits = curr_bits;
 			v2pr_info("%s: changed bit %d:%s\n", KP_NAME(kp), cls_id,
 				  map->class_names[cls_id]);
@@ -693,7 +700,7 @@ static int param_set_dyndbg_classnames(const char *instr, const struct kernel_pa
 			old_bits = CLASSMAP_BITMASK(*dcp->lvl);
 			curr_bits = CLASSMAP_BITMASK(cls_id + (wanted ? 1 : 0 ));
 
-			totct += ddebug_apply_class_bitmap(dcp, &curr_bits, &old_bits);
+			totct += ddebug_apply_class_bitmap(dcp, &curr_bits, &old_bits, NULL);
 			*dcp->lvl = (cls_id + (wanted ? 1 : 0));
 			v2pr_info("%s: changed bit-%d: \"%s\" %lx->%lx\n", KP_NAME(kp), cls_id,
 				  map->class_names[cls_id], old_bits, curr_bits);
@@ -707,18 +714,9 @@ static int param_set_dyndbg_classnames(const char *instr, const struct kernel_pa
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
+					   const char *mod_name)
 {
 	const struct ddebug_class_param *dcp = kp->arg;
 	const struct ddebug_class_map *map = dcp->map;
@@ -755,8 +753,8 @@ int param_set_dyndbg_classes(const char *instr, const struct kernel_param *kp)
 				KP_NAME(kp), inrep, CLASSMAP_BITMASK(map->length));
 			inrep &= CLASSMAP_BITMASK(map->length);
 		}
-		v2pr_info("bits:%lx > %s\n", inrep, KP_NAME(kp));
-		totct += ddebug_apply_class_bitmap(dcp, &inrep, dcp->bits);
+		v2pr_info("bits:0x%lx > %s.%s\n", inrep, mod_name ?: "*", KP_NAME(kp));
+		totct += ddebug_apply_class_bitmap(dcp, &inrep, dcp->bits, mod_name);
 		*dcp->bits = inrep;
 		break;
 	case DD_CLASS_TYPE_LEVEL_NUM:
@@ -769,7 +767,7 @@ int param_set_dyndbg_classes(const char *instr, const struct kernel_param *kp)
 		old_bits = CLASSMAP_BITMASK(*dcp->lvl);
 		new_bits = CLASSMAP_BITMASK(inrep);
 		v2pr_info("lvl:%ld bits:0x%lx > %s\n", inrep, new_bits, KP_NAME(kp));
-		totct += ddebug_apply_class_bitmap(dcp, &new_bits, &old_bits);
+		totct += ddebug_apply_class_bitmap(dcp, &new_bits, &old_bits, mod_name);
 		*dcp->lvl = inrep;
 		break;
 	default:
@@ -778,16 +776,33 @@ int param_set_dyndbg_classes(const char *instr, const struct kernel_param *kp)
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
2.52.0

