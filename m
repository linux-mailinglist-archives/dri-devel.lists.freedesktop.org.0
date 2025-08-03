Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD099B191E6
	for <lists+dri-devel@lfdr.de>; Sun,  3 Aug 2025 05:59:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8931C10E4BA;
	Sun,  3 Aug 2025 03:59:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="CFIMvPEk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f175.google.com (mail-il1-f175.google.com
 [209.85.166.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AE1C10E4B3;
 Sun,  3 Aug 2025 03:59:04 +0000 (UTC)
Received: by mail-il1-f175.google.com with SMTP id
 e9e14a558f8ab-3e3f1e69090so8244685ab.0; 
 Sat, 02 Aug 2025 20:59:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754193543; x=1754798343; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mklWiZZXeNw0IAiROdlhKulcLq5JIjmrYvDuK+b6IIw=;
 b=CFIMvPEkLb4eJfRoXbd4jAW7GkS+iEbrpZPA0uUBiFu8s8ma4SU9fNsHFPWFcyAUZx
 BbgqTAm9uPqXisziDvIvRhHH9OkoERQQnFviqrxdmT8mXyHJPIRxYeXUWuEsqraUVGrC
 B4nbVyhm6R1IAbG1tTMAW0nRLvZuJVXhqjNf+6ewRh+zHaDaIFGQs8TkhFSUbWEcdL1f
 SicHFO1mcSPQKcOxebXMvCWF1NNBTCHRjg9lbofEFlEK1Zvbrvf8l429VJprKVc7jQkR
 3hLFhhBLVQtPAcpT0Erz8fu7vHWSZuvXP8CnWqY28Dw6mJtfh299Oecfsl8brmJor7mT
 p0qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754193543; x=1754798343;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mklWiZZXeNw0IAiROdlhKulcLq5JIjmrYvDuK+b6IIw=;
 b=MNQkaehyVLr4t1lfYo8ScLG5KmgFMjnaiLmlfiXMpyt98/veyz3Ffvg5B6+9UzExom
 vF/gvJXKdYOlSkdU63EdyZwYrbT3WxhHV9485sHj4iLU4BxBR60EB+CC0X7V4YBm6uEL
 Tm/pOk1fysUoT9B57lGu/mQlqUAt7QEbBXG8AoyBydqYotequUzm6y758PfMZYOnscCH
 N5y0hYx3plyoLHHOqyp/0hTMI90fVs2STCnPmOTHAMgpdiQgs+g7+Fja3yD1r4ShQwqN
 zihxwip3W7oMnhPPmZpM9YGEIM5ChrgFJvgANW+RosUi/5ByhLm7JJsxOl0bwXfn/OfL
 zaAA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVC9YSz4+3nQuu4bIu7EJSX0cq2i1+TYAJLX2Qx/KqW8IQHTF85Ji/B4iVc6Mv7XizGrFu067YOtRzp@lists.freedesktop.org,
 AJvYcCVwpn2Okk0RRrqCL4mP/Q20LiDtNj1/oONmoGWInYkuMRVDvig80jXKaloPu2gXYLhwE++TVJSk@lists.freedesktop.org,
 AJvYcCX13jRgpIzxob+XwhsZ9tuL9h+H4fFxwT3kp0YwamKz+lIjrjK6M5h4wRx4ABk9npI8cWOwjQaL6uuBo6D7qA==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwCLoJT3lnfssgCOHvsZv4piPJQtZAwI+Rqq84kgEm+YeKRQ1Li
 bTBEj0a/HlAh9xkJIV8KR2C0Er0BG+oC6sCb3rGim+5JtV9KNB5hL/JX
X-Gm-Gg: ASbGncuEdSkoY0G8QG1LAG1AUidt9JZMSSub1m408LgT7Ie5Mc+CtUUpC4SG2vWbi4h
 nTKGyW8OfRR1f9SPCNO5diYy8sd4W8mbfXV1s6R0ft6+D4M5+Bm+mXAXJ9WEIO/u3o6gjMWcB5h
 Jn72LchIeCjB47aHbgncKqYU5rA/kIXgd8gtnMjWoMcFkmYPqIuFj6/32DaAYz50BWeobQXb39O
 AVAar6jKw5ay7Tygq/Cnuocu65MOGskAbVI7vpQYVNF0ZyjgXi3a9S/dRzEmysuWbL/6IEjUIRu
 h3+DdYk1TiDOcJJnWMYp/x/QCq0QMmLtScsLHtWzwoQebs/II52vXWV3vCDuXYF0ktd0LddMITv
 2SBBpHpOYhoe40mqTZMyCH+hYGOa01MzS8WvFFZSFGzEQ7c2UmsfR5kLuInsxzv2h1ylfAbYwfY
 LU1A==
X-Google-Smtp-Source: AGHT+IFogGu9+LdtIzbyfZnfCUHN86E9vT1zZI6TQuyF240cWd9LVlFw1Za2fBbgX19XjcZHFKFMwQ==
X-Received: by 2002:a05:6e02:3e8b:b0:3e2:a472:2122 with SMTP id
 e9e14a558f8ab-3e416191f81mr84787815ab.14.1754193543320; 
 Sat, 02 Aug 2025 20:59:03 -0700 (PDT)
Received: from frodo.raven-morpho.ts.net (c-67-165-245-5.hsd1.co.comcast.net.
 [67.165.245.5]) by smtp.googlemail.com with ESMTPSA id
 8926c6da1cb9f-50a55df0940sm2268319173.106.2025.08.02.20.59.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Aug 2025 20:59:02 -0700 (PDT)
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
Subject: [PATCH v4 20/58] dyndbg: detect class_id reservation conflicts
Date: Sat,  2 Aug 2025 21:57:38 -0600
Message-ID: <20250803035816.603405-21-jim.cromie@gmail.com>
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

If a module _DEFINEs + _USEs 2 or more classmaps, it must devise them
to share the per-module 0..62 class-id space; ie their respective
base,+length reservations cannot overlap.

To detect conflicts at modprobe, add ddebug_class_range_overlap(),
call it from ddebug_add_module(), and WARN and return -EINVAL when
they're detected.

test_dynamic_debug.c:

If built with -DFORCE_CLASSID_CONFLICT, the test-modules get 2 bad
DYNDBG_CLASS_DEFINE declarations, into parent and the _submod.  These
conflict with one of the good ones in the parent (D2_CORE..etc),
causing the modprobe(s) to warn

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
---
 lib/dynamic_debug.c      | 29 +++++++++++++++++++++++++++++
 lib/test_dynamic_debug.c |  8 ++++++++
 2 files changed, 37 insertions(+)

diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index fa8d1ee214066..d6687623c5a96 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -1267,6 +1267,22 @@ static void ddebug_apply_class_users(const struct _ddebug_info *di)
 	(_dst)->info._vec.len = nc;					\
 })
 
+static int __maybe_unused
+ddebug_class_range_overlap(struct _ddebug_class_map *cm,
+			   u64 *reserved_ids)
+{
+	u64 range = (((1ULL << cm->length) - 1) << cm->base);
+
+	if (range & *reserved_ids) {
+		pr_err("[%d..%d] on %s conflicts with %llx\n", cm->base,
+		       cm->base + cm->length - 1, cm->class_names[0],
+		       *reserved_ids);
+		return -EINVAL;
+	}
+	*reserved_ids |= range;
+	return 0;
+}
+
 /*
  * Allocate a new ddebug_table for the given module
  * and add it to the global list.
@@ -1276,6 +1292,7 @@ static int ddebug_add_module(struct _ddebug_info *di)
 	struct ddebug_table *dt;
 	struct _ddebug_class_map *cm;
 	struct _ddebug_class_user *cli;
+	u64 reserved_ids = 0;
 	int i;
 
 	if (!di->descs.len)
@@ -1301,6 +1318,13 @@ static int ddebug_add_module(struct _ddebug_info *di)
 	dd_mark_vector_subrange(i, dt, cm, di, maps);
 	dd_mark_vector_subrange(i, dt, cli, di, users);
 
+	for_subvec(i, cm, &dt->info, maps)
+		if (ddebug_class_range_overlap(cm, &reserved_ids))
+			goto cleanup;
+	for_subvec(i, cli, &dt->info, users)
+		if (ddebug_class_range_overlap(cli->map, &reserved_ids))
+			goto cleanup;
+
 	if (dt->info.maps.len)
 		ddebug_apply_class_maps(&dt->info);
 
@@ -1313,6 +1337,11 @@ static int ddebug_add_module(struct _ddebug_info *di)
 
 	vpr_info("%3u debug prints in module %s\n", di->descs.len, di->mod_name);
 	return 0;
+cleanup:
+	WARN_ONCE("dyndbg multi-classmap conflict in %s\n", di->mod_name);
+	kfree(dt);
+	return -EINVAL;
+
 }
 
 /* helper for ddebug_dyndbg_(boot|module)_param_cb */
diff --git a/lib/test_dynamic_debug.c b/lib/test_dynamic_debug.c
index 6c4548f635128..1ba4be9a403ae 100644
--- a/lib/test_dynamic_debug.c
+++ b/lib/test_dynamic_debug.c
@@ -128,6 +128,14 @@ DYNAMIC_DEBUG_CLASSMAP_DEFINE(map_level_num, DD_CLASS_TYPE_LEVEL_NUM,
 DYNAMIC_DEBUG_CLASSMAP_PARAM(disjoint_bits, p);
 DYNAMIC_DEBUG_CLASSMAP_PARAM(level_num, p);
 
+#ifdef FORCE_CLASSID_CONFLICT
+/*
+ * Enable with -Dflag on compile to test overlapping class-id range
+ * detection.  This should warn on modprobes.
+ */
+DYNDBG_CLASSMAP_DEFINE(classid_range_conflict, 0, D2_CORE + 1, "D3_CORE");
+#endif
+
 #else /* TEST_DYNAMIC_DEBUG_SUBMOD */
 
 /*
-- 
2.50.1

