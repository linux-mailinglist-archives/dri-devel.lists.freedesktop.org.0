Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17EDCCD50AE
	for <lists+dri-devel@lfdr.de>; Mon, 22 Dec 2025 09:28:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6347110E5DF;
	Mon, 22 Dec 2025 08:28:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Mzs2Cly6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
 [209.85.210.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23A7210E5D6
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Dec 2025 08:28:18 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id
 d2e1a72fcca58-7b8bbf16b71so3693858b3a.2
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Dec 2025 00:28:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1766392098; x=1766996898; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8P0CFiKDyHYpNA2hwruS1Ng/YcTesu5+S1IYSukvEWU=;
 b=Mzs2Cly62l0Hxlp/nqXqOaiweX+DteRDw9bMzHvDR4gq5PiJyDwtK6DExR2c55COVl
 Fync1WNS0Jq+mQR6cCt1nCf6g1m8H9a+8UxhqKpA7ReRrud2SKfmixtXsE5MGwwcCxvt
 UD0xd/5Mz353p6OjUZ2XruQXhSKubCtqRNpSXvzXfLcWWV/RvnURUtw+H4RpEbKvOAs2
 oAPx30vIY0roIjtMOB0UkLj3SaeYwThwHirUGkH8kv2sRoLRn7PzpBJ9UWdzI6WT+SiY
 9CcoD6+XQAkyotpMktBDrdGA4Wb3oEfwnsKkbQldeaYalk5QCES4lLacVLQi5AZdiY2n
 1uaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766392098; x=1766996898;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=8P0CFiKDyHYpNA2hwruS1Ng/YcTesu5+S1IYSukvEWU=;
 b=YoT+znZQhFk3HJTlOhBTtdO0l2hJ0RApq/MdzKBTXVJfXag/WBVbbasizgwCtvFf1g
 riuYN5tsYc57/svnDZz6Aa8rtqgyhuViLbuzglv4LivUuD8IC9EjikLQ2zhZ7ViK6xoC
 nV1P1WiglWJkZnGgcZwqRNSTCiMM6uPx9XXiyMfZTu42MirFoJqtO/+nx0hOM5D3g9zp
 LpEYdO3me63cnDyW26YmC2r4RzZ/CpqWX0ykBkBoYIu0ant8MNpNUO83YUzl9bPRILq1
 aq3HpLki3VVzENrFOOmaw3flAkgk1caSBry2wWSeUWhwY9RykHwZY6Uni04XLJipmrpw
 ZYJA==
X-Gm-Message-State: AOJu0YxU3tIMbRQU8EqV7+n4h0yf9GBm2Cc6huyeYB49tSIweimljWqo
 w/O711ytd7Kmk/mA/eMAIT4qYsEUlnasziiznQCufKvW9rTB+msSPPGx
X-Gm-Gg: AY/fxX7bEx35ITyFlhKVcGQkNVuNqDy5lzTqQ9gd5nNqtnwHu8+xnDs98KEgWTj7NeK
 Ot1C3ljC4yHispced3dHsTX0YG2nSAtGuR8IMirxOoc4nAL7V60qEkZ+qqMcBhkNIEFmU+7fyXe
 9ZwfeSGT7jQYLePG00HTM/cdJtmKPFhsFMBBFHy8RbStcw9Lw4DzCY9l/HQUsSK39d2TAm0GT8a
 kCWnOaRNyq/EIm6RrkkA+QBepgACWKuzMkztUB4d9fR8V3r2OU2+TAy2CT9/qDvmAST5RpGliJ7
 Jldb3n2/Qoi+nUuwuuJNNUzrwHHtJ3NnWCQlngd+phpAPjmCDqOeabElhR3ciVeBOnAvfNAutcB
 4bVA5fA2w+/4IGnJTJR7jpR6Ldq5ZQTjd9LmzfTp+/fSRe0HiJ0jyB9zePoKheA/mw5yj+vBDxI
 I5nLXXn8EL
X-Google-Smtp-Source: AGHT+IEq8X6Bf+OWPyqj+l6muxtsExzlcI9be65S5oPokexgEe5xk3Q6PIlmP0iqLo1vmkdJvgYYyA==
X-Received: by 2002:a05:6a00:a386:b0:7aa:17f0:f63c with SMTP id
 d2e1a72fcca58-7ff64eca463mr9195347b3a.29.1766392097555; 
 Mon, 22 Dec 2025 00:28:17 -0800 (PST)
Received: from frodo ([2404:4400:417e:3d00:8b90:7f55:1261:772f])
 by smtp.googlemail.com with ESMTPSA id
 d2e1a72fcca58-7ff7e493123sm9540699b3a.50.2025.12.22.00.28.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Dec 2025 00:28:17 -0800 (PST)
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
Subject: [PATCH v7 30/31] dyndbg: add
 DYNAMIC_DEBUG_CLASSMAP_USE_(dd_class_name, offset)
Date: Mon, 22 Dec 2025 21:20:47 +1300
Message-ID: <20251222082049.1782440-31-jim.cromie@gmail.com>
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

Allow a module to use 2 classmaps together that would otherwise have a
class_id range conflict.

Suppose drm-driver does:

  DYNAMIC_DEBUG_CLASSMAP_USE(drm_debug_classes);
  DYNAMIC_DEBUG_CLASSMAP_USE(drm_accel_xfer_debug);

And (for some reason) drm-accel will not define their constants to
avoid DRM's 0..10 reservations (seems a long stretch).

So I dont think this potential conflict would become an issue until we
have at least a 3-X-3 of classmap-defns X classmap-users

So drop this if its too speculative, knowing theres at least a
notional solution should the situation arise.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 include/linux/dynamic_debug.h | 30 +++++++++++++++++++++++-------
 lib/dynamic_debug.c           | 19 ++++++++++++-------
 2 files changed, 35 insertions(+), 14 deletions(-)

diff --git a/include/linux/dynamic_debug.h b/include/linux/dynamic_debug.h
index b22da40e2583..5307be8da5c1 100644
--- a/include/linux/dynamic_debug.h
+++ b/include/linux/dynamic_debug.h
@@ -87,7 +87,7 @@ struct _ddebug_class_map {
 struct _ddebug_class_user {
 	char *mod_name;
 	struct _ddebug_class_map *map;
-	const int base;		/* user offset to re-number the used map */
+	const int offset;	/* offset from map->base */
 };
 
 /*
@@ -235,21 +235,37 @@ struct _ddebug_class_param {
 /**
  * DYNAMIC_DEBUG_CLASSMAP_USE - refer to a classmap, DEFINEd elsewhere.
  * @_var: name of the exported classmap var
- * @_not_yet: _base-like, but applies only to this USEr. (if needed)
  *
  * This tells dyndbg that the module has prdbgs with classids defined
  * in the named classmap.  This qualifies "class NAME" >controls on
- * the user module, and ignores unknown names.
+ * the user module, and ignores unknown names. This is a wrapper for
+ * DYNAMIC_DEBUG_CLASSMAP_USE_() with a base offset of 0.
  */
-#define DYNAMIC_DEBUG_CLASSMAP_USE(_var)				\
-	DYNAMIC_DEBUG_CLASSMAP_USE_(_var, 0, __UNIQUE_ID(_ddebug_class_user))
-#define DYNAMIC_DEBUG_CLASSMAP_USE_(_var, _base, _uname)		\
+#define DYNAMIC_DEBUG_CLASSMAP_USE(_var) \
+	DYNAMIC_DEBUG_CLASSMAP_USE_(_var, 0)
+
+/**
+ * DYNAMIC_DEBUG_CLASSMAP_USE_ - refer to a classmap with a manual offset.
+ * @_var:   name of the exported classmap var to use.
+ * @_offset:  an integer offset to add to the class IDs of the used map.
+ *
+ * This is an extended version of DYNAMIC_DEBUG_CLASSMAP_USE(). It should
+ * only be used to resolve class ID conflicts when a module uses multiple
+ * classmaps that have overlapping ID ranges.
+ *
+ * The final class IDs for the used map will be calculated as:
+ * original_map_base + class_index + @_base.
+ */
+#define DYNAMIC_DEBUG_CLASSMAP_USE_(_var, _offset)			\
+	__DYNAMIC_DEBUG_CLASSMAP_USE(_var, _offset, __UNIQUE_ID(_ddebug_class_user))
+
+#define __DYNAMIC_DEBUG_CLASSMAP_USE(_var, _offset, _uname)		\
 	extern struct _ddebug_class_map _var;				\
 	static struct _ddebug_class_user __aligned(8) __used		\
 	__section("__dyndbg_class_users") _uname = {			\
 		.mod_name = KBUILD_MODNAME,				\
 		.map = &(_var),						\
-		.base = _base						\
+		.offset = _offset						\
 	}
 
 /**
diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index f60a723a441b..b0da3dd4ac44 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -198,7 +198,7 @@ ddebug_find_valid_class(struct _ddebug_info const *di, const char *query_class,
 		if (idx >= 0) {
 			vpr_di_info(di, "class-ref: %s -> %s.%s ",
 				    cli->mod_name, cli->map->mod_name, query_class);
-			*class_id = idx + cli->map->base;
+			*class_id = idx + cli->map->base - cli->offset;
 			return cli->map;
 		}
 	}
@@ -206,12 +206,17 @@ ddebug_find_valid_class(struct _ddebug_info const *di, const char *query_class,
 	return NULL;
 }
 
-static bool ddebug_class_in_range(const int class_id, const struct _ddebug_class_map *map)
+static bool ddebug_class_map_in_range(const int class_id, const struct _ddebug_class_map *map)
 {
 	return (class_id >= map->base &&
 		class_id < map->base + map->length);
 }
 
+static bool ddebug_class_user_in_range(const int class_id, const struct _ddebug_class_user *user)
+{
+	return ddebug_class_map_in_range(class_id - user->offset, user->map);
+}
+
 static struct _ddebug_class_map *
 ddebug_find_map_by_class_id(struct _ddebug_info *di, int class_id)
 {
@@ -220,11 +225,11 @@ ddebug_find_map_by_class_id(struct _ddebug_info *di, int class_id)
 	int i;
 
 	for_subvec(i, map, di, maps)
-		if (ddebug_class_in_range(class_id, map))
+		if (ddebug_class_map_in_range(class_id, map))
 			return map;
 
 	for_subvec(i, cli, di, users)
-		if (ddebug_class_in_range(class_id, cli->map))
+		if (ddebug_class_user_in_range(class_id, cli))
 			return cli->map;
 
 	return NULL;
@@ -1177,12 +1182,12 @@ static const char *ddebug_class_name(struct _ddebug_info *di, struct _ddebug *dp
 	int i;
 
 	for_subvec(i, map, di, maps)
-		if (ddebug_class_in_range(dp->class_id, map))
+		if (ddebug_class_map_in_range(dp->class_id, map))
 			return map->class_names[dp->class_id - map->base];
 
 	for_subvec(i, cli, di, users)
-		if (ddebug_class_in_range(dp->class_id, cli->map))
-			return cli->map->class_names[dp->class_id - cli->map->base];
+		if (ddebug_class_user_in_range(dp->class_id, cli))
+			return cli->map->class_names[dp->class_id - cli->map->base - cli->offset];
 
 	return NULL;
 }
-- 
2.52.0

