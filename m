Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 298A5C6B924
	for <lists+dri-devel@lfdr.de>; Tue, 18 Nov 2025 21:20:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66FD210E52B;
	Tue, 18 Nov 2025 20:20:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="jmg0sHZc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f41.google.com (mail-io1-f41.google.com
 [209.85.166.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F08510E528
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 20:19:26 +0000 (UTC)
Received: by mail-io1-f41.google.com with SMTP id
 ca18e2360f4ac-949031532f9so8528639f.0
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 12:19:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763497165; x=1764101965; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Lf2KYKGZTZbOL5PiLrqZOpnGDaNeXmVBMrHOoH3mOwo=;
 b=jmg0sHZcrHcJJZ4jn41VqQgnnWnqPvTFYkGlLqaj2bTmbyeenQ3HsShMl7qiloJmrx
 ct+Im+iAotsNYbcdO93dXpmb6lfdwPwQjrTKC8KdgIDwNwkkx1UypE6inp7il12fDjyW
 yfvPyCtR4O7T8DgR2Zcq9bEVTyR2KgTL/9aYoY0MF4LO5A/xtSsHyUty2f9YSFvMtSWs
 pRbw4E1xuwCoxdJWqFXuWzsIF/bMIgALbSa15CiwkHdbJWwGhaKnDN3HB5ztY7JV0qDb
 Sh1BydO4C1CN4gUBCbOV30ZQ9PldBP1dgqsGSA6luA2LPMkH+ruyT42hLlxxeZRIcNDm
 Y1tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763497165; x=1764101965;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Lf2KYKGZTZbOL5PiLrqZOpnGDaNeXmVBMrHOoH3mOwo=;
 b=fAq8nIMK22t5Tdl8jF/zZzrgfVtV3yqQJemQ6xc7sot9AXsxUSOlXEqAQ8Ud8f4JuH
 heNUF+vyDq7LPq4Lt7Y++5QmAjfmTa048YYvOdnqA/3x3NkMFIiXLMWHetXGjiYGsHz9
 V308AjeB9bDuBNDuVKLkZW+zW5DLA57Q7luKMe2BcOPjmDsvRlpIrzbk/lzwxtABo9Fp
 8WSERtkjbmNL6KHx6wFBi23qKNALsnhxH9Uao/cNM9sRX8DrmaakRK7kxv8UfsqRbqhy
 qK27JizZsdFbX59SkcIwBwQN/AudqRlICcLOscjy+BNCklRS9ciFQN+tTVBn5oSRK3z+
 XSZg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUS9vNlmC7ltAI4DwiFFfUl7o2/B7UIFpti/4w6DsXtyfl3+hBftujg6rRhQ1zHB+/t7EUr3f4Q0C4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz0s5ikM4qhogpNDd3lb9P5knombFVpqlE+ipA8r5vWWQo1bhK/
 yUD/KsHLOOB9HpgTRcmncKKCin0+ChyH6CdV2Xw9vBbo+2IR8GcJjXI9
X-Gm-Gg: ASbGncswCGIN7SFeYO0w8WrZuOPpZYWz59TMOjg66+bbAKWS5qaEIE+nNsaHnAZHrEj
 ER5j5KL/36T2RNnSvxoWTdlUnPc0S//w1gdtafhMn3a06+Ym+BSVk2yDS9ulUbXhxFJ0uLfwCy/
 f/W6+FKTT944RSF6AaNvRQH/sX5leJ55Y0Y4Xhc6RNOCovoKK9Gf4ops55d1q2jx3qy1dySlwCg
 QhomMdkjfaMsNHS16Eij93zeZtBVqLLuvsOvJ+WGUUhCnYxdGSpUTFBpVmxerHqqasytVaYVfhw
 mwOj0TPOxXUTxQYaNOf53duKtJCGVoPItcTUWq7gtfPkRq11EE2b4oExhHlZWpXj7nNmT9AKZgL
 vX23/9YTin2+W4Z7HK6tFlfLg5iVvOGwMOmJZll4ipKJQq231ZMGI8EJ7pYQEpnEMqki5JKlLQK
 9Cx+lFIcIChSR47IsXvXhOb2BsORuJ3TmcbHYZRhHWEe/Mc/opljpSS/VepkFt/DwmXtcT4jklf
 XXa6w==
X-Google-Smtp-Source: AGHT+IGx1eNlZGV/xEbBO/tczptXELUHfkRxYaLx6Xv6FIVM3pmvNf0oeW2cq5nrxOsKyemhr0F/dw==
X-Received: by 2002:a05:6602:3f93:b0:949:66a:4d77 with SMTP id
 ca18e2360f4ac-9492b8a1422mr16324939f.5.1763497165261; 
 Tue, 18 Nov 2025 12:19:25 -0800 (PST)
Received: from godzilla.raven-morpho.ts.net
 (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
 by smtp.googlemail.com with ESMTPSA id
 ca18e2360f4ac-948fd4c273bsm419823939f.18.2025.11.18.12.19.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Nov 2025 12:19:24 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 gregkh@linuxfoundation.org, jbaron@akamai.com
Cc: ukaszb@chromium.org, louis.chauvet@bootlin.com,
 Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v6 22/31] dyndbg: detect class_id reservation conflicts
Date: Tue, 18 Nov 2025 13:18:32 -0700
Message-ID: <20251118201842.1447666-23-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251118201842.1447666-1-jim.cromie@gmail.com>
References: <20251118201842.1447666-1-jim.cromie@gmail.com>
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

If a module _DEFINEs 2 or more classmaps, it must devise them to share
the per-module 0..62 class-id space; ie their respective base,+length
reservations cannot overlap.

To detect conflicts at modprobe, add ddebug_class_range_overlap(),
call it from ddebug_add_module(), and WARN and return -EINVAL when
they're detected.

This insures that class_id -> classname lookup has just 1 answer, so
the 1st-found search in find-class-name works properly.

test_dynamic_debug.c:

If built with -DFORCE_CLASSID_CONFLICT, the test-modules invoke 2
conflicting DYNAMIC_DEBUG_CLASSMAP_DEFINE() declarations, into parent
and the _submod.  These conflict with one of the good ones in the
parent (D2_CORE..etc), causing the modprobe(s) to warn

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
- USE doesnt need conflict test against DEFINE
  infact its wrong-headed - of course theyd overlap.
---
 lib/dynamic_debug.c      | 40 +++++++++++++++++++++++++++++++++-------
 lib/test_dynamic_debug.c |  8 ++++++++
 2 files changed, 41 insertions(+), 7 deletions(-)

diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index c6b983f2324b..25b3932891e0 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -1292,6 +1292,22 @@ static void ddebug_apply_class_users(const struct _ddebug_info *di)
 	(__dst)->info._vec.len = __nc;					\
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
@@ -1301,6 +1317,7 @@ static int ddebug_add_module(struct _ddebug_info *di)
 	struct ddebug_table *dt;
 	struct _ddebug_class_map *cm;
 	struct _ddebug_class_user *cli;
+	u64 reserved_ids = 0;
 	int i;
 
 	if (!di->descs.len)
@@ -1315,15 +1332,20 @@ static int ddebug_add_module(struct _ddebug_info *di)
 	}
 	INIT_LIST_HEAD(&dt->link);
 	/*
-	 * For built-in modules, di-> referents live in .rodata and is
-	 * are immortal. For loaded modules, name points at the name[]
-	 * member of struct module, which lives at least as long as
-	 * this struct ddebug_table.
+	 * For built-in modules, di-> referents live in .*data and are
+	 * immortal. For loaded modules, di points at the dyndbg_info
+	 * member of its struct module, which lives at least as
+	 * long as this struct ddebug_table.
 	 */
 	dt->info = *di;
-	dd_mark_vector_subrange(i, dt, cm, di, maps);
-	dd_mark_vector_subrange(i, dt, cli, di, users);
-	/* now di may be stale */
+	dd_mark_vector_subrange(i, dt, cm, &dt->info, maps);
+	dd_mark_vector_subrange(i, dt, cli, &dt->info, users);
+	/* now di is stale */
+
+	/* insure 2+ classmaps share the per-module 0..62 class_id space */
+	for_subvec(i, cm, &dt->info, maps)
+		if (ddebug_class_range_overlap(cm, &reserved_ids))
+			goto cleanup;
 
 	mutex_lock(&ddebug_lock);
 	list_add_tail(&dt->link, &ddebug_tables);
@@ -1337,6 +1359,10 @@ static int ddebug_add_module(struct _ddebug_info *di)
 	vpr_info("%3u debug prints in module %s\n",
 		 dt->info.descs.len, dt->info.mod_name);
 	return 0;
+cleanup:
+	WARN_ONCE("dyndbg multi-classmap conflict in %s\n", di->mod_name);
+	kfree(dt);
+	return -EINVAL;
 }
 
 /* helper for ddebug_dyndbg_(boot|module)_param_cb */
diff --git a/lib/test_dynamic_debug.c b/lib/test_dynamic_debug.c
index 6c4548f63512..1ba4be9a403a 100644
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
2.51.1

