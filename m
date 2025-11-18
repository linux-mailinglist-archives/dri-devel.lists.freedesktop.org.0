Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0963BC6B930
	for <lists+dri-devel@lfdr.de>; Tue, 18 Nov 2025 21:20:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23B5B10E52F;
	Tue, 18 Nov 2025 20:20:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="XPU4MNRy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f176.google.com (mail-il1-f176.google.com
 [209.85.166.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 228EA10E526
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 20:19:35 +0000 (UTC)
Received: by mail-il1-f176.google.com with SMTP id
 e9e14a558f8ab-4331b4d5c6eso23907935ab.2
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 12:19:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763497174; x=1764101974; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Pzl7FKRTTqXJnEcqZYC3kmINB8k+XvKVj8HTxhUS64o=;
 b=XPU4MNRyGBzgu2BL6F6aNmFA1VYZbspphU0iikhUbaCWI8Emym22DtUdls5wbfonp3
 2ZgxG6rMZzWoX2kJPppmvy6LNsgLhfeJs2jl1Pansg/3NgCAY4SsgSvy2KXIowPpWl/X
 Sw2X7Jail75mjC2noBPa/d30YoDPvgjfGxkRGHrhMhtbu+NE7Mc76UHQ5DW43MxMg2Nr
 KxZD9gTQdktCDOeGTuMswUc6c9aAUBEYQ2UpT8M1banwSTxBEoqQ1G76IyKWxRhEOtM3
 SM3iEep5urWqF038C3mPsDcw1G/QCXc6CFHFjJaX2yFqyW37H6OCgQdTJn/dMN8CGpbs
 EiuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763497174; x=1764101974;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Pzl7FKRTTqXJnEcqZYC3kmINB8k+XvKVj8HTxhUS64o=;
 b=ppv3HA94lsCRbwVxWWZ0+EFyI46PyDSzz15nxCncL85BSBMF6V112pcWZzra20sMYc
 p0ioh/P+NqNsmuZn+qas5hNsYBEEw0zkswa8Ceaj4h6S6X7vQ15niDJJMG9jaRigBya0
 9uRoctPtof2fsF8rR0KRczfXjCMjHxAAhOEIHZiFhszOgIygDpVKLl+G1eTflVWnqseF
 zmDF9irCSA7tivYrQRB5xgNXRmFSJUkAENI0Sd1yxHCOATN3PolIdkM9gQhlbu0Z9lv4
 BtFoKlHpamZ2ejufjZ/pSYa0jzp3z/ckz1zc8FpWPA7bBN45gh5BCeOXiweXK1mF9qeF
 ElUA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUYHINM/x2g2WPw9HIBBX7cvq7FDZOesUdsz7ty+/ey+jO1dX0dw3Yb/A/GBcjtzmiSEQwAdHUu7Zs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyYvdUBmNOjcs/j0WPscE2MxEFEDT1HdP4eU/gOqfFg9vGHNZKd
 ABxPdLh2aL0T5legy7Tqj/GfPPjwtP4ZYpShd6wpw0hcdximuNrJ2s3G
X-Gm-Gg: ASbGnctEuESgaBnI+9bdRktCiGWOrb6y30ANBLxPt9IiLafiDqWw99pdgsZ3f2bT00B
 gGFVjhVHlLE1RGTg6QN7tzLgiSDHaESKVWJk5YHtxwNZA1yxw8qQEMa1BEKrkQr6vEkepTl7NMK
 WCkzO3mruAjf3wvGKJLHjrYnpj6FGKUOAsL2Wm8q3OEJiw0AqhgYCg/tOU4YZk4l7Ac4pN2ctm3
 ai7owSLvr2dJrB8PXOL5bFky4jpPUvj8y178HwyW22n0SK6Zr2MmWhpzvySAQwZssbzSsp6x/KM
 SaBF+5NyJ0vMyUSbiWANCaZThBQu1h6/Ln5p0N+LuJZxqtOZDRkSN1uVL+ThGuQxzG3VeLSKGOz
 G8H33rt/5Y6Bl4+48Efc2bEuMgpioq387xX+P6CM8pyt7QXjo5kQIBHS9yei0x87iZNypF7lQEt
 vWzuSN7x33Zox8ogKAHZX29kfn90FaHwOShy01tPEoVzus882l0uy9Zke+oz+yu/+TrDQ=
X-Google-Smtp-Source: AGHT+IHrOtzMdyakNuObdh3/HwiaoIGSX4ghGN1icypqK5mgUjKfASizUVusxgNRAZI5rl5+uPN7mA==
X-Received: by 2002:a05:6e02:1527:b0:433:30e0:6f68 with SMTP id
 e9e14a558f8ab-4348c94e1bdmr189470205ab.24.1763497174345; 
 Tue, 18 Nov 2025 12:19:34 -0800 (PST)
Received: from godzilla.raven-morpho.ts.net
 (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
 by smtp.googlemail.com with ESMTPSA id
 ca18e2360f4ac-948fd4c273bsm419823939f.18.2025.11.18.12.19.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Nov 2025 12:19:33 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 gregkh@linuxfoundation.org, jbaron@akamai.com
Cc: ukaszb@chromium.org, louis.chauvet@bootlin.com,
 Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v6 30/31] dyndbg: add
 DYNAMIC_DEBUG_CLASSMAP_USE_(dd_class_name, offset)
Date: Tue, 18 Nov 2025 13:18:40 -0700
Message-ID: <20251118201842.1447666-31-jim.cromie@gmail.com>
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
re-ref of an lvalue is fine.
CHECK: Macro argument reuse '_var' - possible side-effects?

-v5+ less hand-wavy
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
index 1082e0273f0e..bf1ff29cca95 100644
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
2.51.1

