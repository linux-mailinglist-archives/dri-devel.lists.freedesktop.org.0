Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4B47D1C08D
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jan 2026 03:00:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CB5510E5C4;
	Wed, 14 Jan 2026 02:00:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="bM3AaALf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com
 [209.85.210.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D569C10E5C4
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jan 2026 02:00:47 +0000 (UTC)
Received: by mail-ot1-f67.google.com with SMTP id
 46e09a7af769-7c6da42fbd4so4576008a34.1
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 18:00:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768356047; x=1768960847; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EtGFYvkXzuLDBdoPBBG7Nml2rAKHXpifaucUiL+T8bk=;
 b=bM3AaALfvLE9YP21yDNRrgF7M+fRHYzhlz4hmYNu4QMskRigs6m4P+D6uFpzSfP8CK
 B/5BgOH+7D/GLV7JARFTFJMq+6eklMeSc6A/KvmwVi0vNW/ib4qLhq0lDG0+gaPeaL8r
 PXb4LYIZK4JZa/RvSyisXNOYRoGEB3ySPAFcc32PuxtM/CK+THnl5IpHngQc6JOugy/b
 6JVxLA7TsmNJhS976npm3H24LfR2e5iulVQHNzoE8puNj6dDe1o16JD9jL7C/tq1JkDU
 hqiHjOgBuHGImWxlYckYBQ5AkWeeHGzlnstfqzOhAaJRXhOjAvAh6mAnwo6pyQkdD0b2
 X96Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768356047; x=1768960847;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=EtGFYvkXzuLDBdoPBBG7Nml2rAKHXpifaucUiL+T8bk=;
 b=dzqoWhw6RrMK6N+sSUV0skBWVQ7c8B6qND9jYAuUxk9ud/1XxRWUUIGUbGcosfRVEC
 VfC7qSY6613j+cl0OezxxafbrX/SiH2UrVxlzVRlFVBVopbRCMNB4u+wSSFYrU9GmO+s
 XkA9exkOhTiLbLMGVhcT090LtDpSU9/TvZDbXiaOHOl58AJta7L0LAYRQpCdG2uliSaT
 +YVc7RrQgXhgyAJRzlVbaFJ3ZGXxejq3Us8dv5Qric6vpE5yFTHD96J84PWZAsMNaaYy
 vh4Bhc5Og2CLCfiSidTZPryaZluLA6dCXK/cU0S4yAFO9pmr8PCYWy+yTpN6CqxXtxrN
 FuoA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUvIB6ZWqb85ciG6dWs9rbM57JsKePqSTpiR6jnX6FKukJqJrzTYMKxh3R4a4H5lfvmRqAraqcoi2U=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwV9EQ8FuxfFiGX+fOFOrMv2HiZoPTLXbOoq5NXzxX4mvx4igRh
 cEXKk8ezsduER4CBmamCI2+GRuwu4lfnhYFvOx16z66g/UobSPr3/vHp
X-Gm-Gg: AY/fxX7DeR0cK++TCTQDMcE4cqbEgQNPVJssKF/tohX2+WQbpaBkg6di9duF4SEeWGk
 SkHjEymcCf8vdjptJFuGWHNfS+uy5TvUx8qMLAGAseRdEi/XHoH7JoOIIXqNI1eH5iJ8tXHuOi5
 KgxEy7pbiFWr3fxZUxCzd98G5LnDzEu3twuhGQCXlxy6q1ep8cMRWbBD1O8rjLN9oDCFd3xLEhd
 lXpP5nadjuhYjhIOuBkCSXLkEdO8viUGUYm6lLzIW5nd5I8ieevqEWXpjpfF0DjmIU8S68Fwcur
 oszk3RWq8zRRFKLfrrI6zj1Opz/KMuo5DO8P/PfmCxBv/Du4cF8RLL3GmZIKsMhjRXXHJuPDv61
 81zxJgOw5LPh13mHbGuK/lyLbobF7gMALZcvSOExgSKZm3YF9GKPQ+WCqUqBUlVuEO5t2i7bsVK
 pukRANAyUPXzPrC+m6TknZoTIn94NOl7JJeQob
X-Received: by 2002:a05:6820:229b:b0:65f:5c73:e350 with SMTP id
 006d021491bc7-6610064699amr803336eaf.30.1768356046602; 
 Tue, 13 Jan 2026 18:00:46 -0800 (PST)
Received: from frodo (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
 by smtp.googlemail.com with ESMTPSA id
 006d021491bc7-65f48ced969sm8999238eaf.17.2026.01.13.18.00.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jan 2026 18:00:46 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org
Cc: Jim Cromie <jim.cromie@gmail.com>, Jason Baron <jbaron@akamai.com>,
 =?UTF-8?q?=C5=81ukasz=20Bartosik?= <ukaszb@chromium.org>,
 Louis Chauvet <louis.chauvet@bootlin.com>,
 Bagas Sanjaya <bagasdotme@gmail.com>, Dave Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 Petr Mladek <pmladek@suse.com>, Shuah Khan <skhan@linuxfoundation.org>,
 linux-doc@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>
Subject: [PATCH v8 30/31] dyndbg: add
 DYNAMIC_DEBUG_CLASSMAP_USE_(dd_class_name, offset)
Date: Tue, 13 Jan 2026 18:57:46 -0700
Message-ID: <20260114015815.1565725-31-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260114015815.1565725-1-jim.cromie@gmail.com>
References: <20260114015815.1565725-1-jim.cromie@gmail.com>
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

Suppose a drm-driver does:

  DYNAMIC_DEBUG_CLASSMAP_USE(drm_debug_classes);
  DYNAMIC_DEBUG_CLASSMAP_USE(drm_accel_xfer_debug);

If (for some reason) drm-accel will not define their constants to
avoid DRM's 0..10 reservations, we have a reserved-ids conflict.  This
seems unlikely.

I don't think this potential conflict would become an issue until we
have at least a 3-X-3 of classmap-defns X classmap-users.

This is an untested interface extension, so drop this patch if it
feels too speculative, knowing theres at least a notional solution
should the situation arise.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 include/linux/dynamic_debug.h | 27 ++++++++++++++++++++++-----
 lib/dynamic_debug.c           | 19 ++++++++++++-------
 2 files changed, 34 insertions(+), 12 deletions(-)

diff --git a/include/linux/dynamic_debug.h b/include/linux/dynamic_debug.h
index 315050507fd3..1ec5d8a44deb 100644
--- a/include/linux/dynamic_debug.h
+++ b/include/linux/dynamic_debug.h
@@ -87,7 +87,7 @@ struct _ddebug_class_map {
 struct _ddebug_class_user {
 	char *mod_name;
 	struct _ddebug_class_map *map;
-	const int offset;	/* user offset to re-number the used map */
+	const int offset;	/* offset from map->base */
 };
 
 /*
@@ -238,11 +238,28 @@ struct _ddebug_class_param {
  *
  * This tells dyndbg that the module has prdbgs with classids defined
  * in the named classmap.  This qualifies "class NAME" >controls on
- * the user module, and ignores unknown names.
+ * the user module, and ignores unknown names. This is a wrapper for
+ * DYNAMIC_DEBUG_CLASSMAP_USE_() with a base offset of 0.
  */
-#define DYNAMIC_DEBUG_CLASSMAP_USE(_var)				\
-	DYNAMIC_DEBUG_CLASSMAP_USE_(_var, 0, __UNIQUE_ID(_ddebug_class_user))
-#define DYNAMIC_DEBUG_CLASSMAP_USE_(_var, _offset, _uname)		\
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
+ * original_map_base + class_index + @_offset.
+ */
+#define DYNAMIC_DEBUG_CLASSMAP_USE_(_var, _offset)			\
+	__DYNAMIC_DEBUG_CLASSMAP_USE(_var, _offset, __UNIQUE_ID(_ddebug_class_user))
+
+#define __DYNAMIC_DEBUG_CLASSMAP_USE(_var, _offset, _uname)		\
 	extern struct _ddebug_class_map _var;				\
 	static struct _ddebug_class_user __aligned(8) __used		\
 	__section("__dyndbg_class_users") _uname = {			\
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

