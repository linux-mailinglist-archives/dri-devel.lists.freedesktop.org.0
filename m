Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kIEZAnsbjWm/zAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 12 Feb 2026 01:14:51 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB055128816
	for <lists+dri-devel@lfdr.de>; Thu, 12 Feb 2026 01:14:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2CD610E677;
	Thu, 12 Feb 2026 00:14:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="lu18UWrz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f67.google.com (mail-oa1-f67.google.com
 [209.85.160.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FEA110E682
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Feb 2026 00:14:47 +0000 (UTC)
Received: by mail-oa1-f67.google.com with SMTP id
 586e51a60fabf-40438380b88so1683342fac.3
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Feb 2026 16:14:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770855286; x=1771460086; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mwCX39ijX+1xlnsqe9VVh/2SgJwGqAQFSfRq2pRz5+c=;
 b=lu18UWrzCPGn87hUGfpgmJq3SRVrFVVxoEWUB1Oy5Ub2gXddIDcgBcFVgAHj/1dvRK
 kk/Ak4ro4jxkmpkD3LqefBM952HYJ3gOP83ti3cGlYcQ//ZvBsy7Zz6LvefCUwvuPdz6
 iitqjYhMEPdzyPTkpEQOAC3qBNvr2Dn6C6eYz6tpby0boVQEX3IEDTmVYCVEjYWAFOhF
 e1vqhEWl36ftkDHuD/9FBtkapMF7yDbpzvTKN9hgEbXopzB0ncceKFop13lMwE/bapMa
 EyzW4XTt4E76JEd3gW2AhFlFXr1zeu3RIi2vq2NDpy4gSH8nRCbS+Dlqbp7wNfpjqLS2
 Gcyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770855286; x=1771460086;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=mwCX39ijX+1xlnsqe9VVh/2SgJwGqAQFSfRq2pRz5+c=;
 b=A57BP87pYaVuMIB2ZnGrFApbQfM+q7COaxVgGsV3UcMgOF7MXGQRRDr2cDX15Em6Zw
 C5HFo6Vl+aK625C/lbqKw82ntDYESxKhp+73A5Gieo1T4VvjDWQoPGmcOAyWoRplfB5a
 ffGHduG5oU6CPr3D5eb1uC1W1flhFsUs3SctiCqvOccwwXb9++vOB2+IQ0QEIzvVzeGw
 onrASgvC+WfY2MU/ZJQStd19QNJl7FTK8GE7SaDGhM/bMwqPvUuUfxOnix/4aRSTq+bn
 zf9TRV1lRJ8YXahjZJ1mT+yDY1udfRHtmTgRZL5aH+3KE8w2eKp/NDV/FAbcLQOj+osl
 HNog==
X-Gm-Message-State: AOJu0YxqCUVqrm+v5sUDljeXh2ZWcUlttkyJOmwft6u1+UMgffj72drN
 mLugpM5RyyCm+24lpMg/gv0tBVY4WmU8b6H1RTlLcWaE+cVQnr0V5olWUyYP/o47
X-Gm-Gg: AZuq6aJyDMUtTmaCzNACjhZ657wCq1znIULC9aLP/o+xqHV3nrLBWp0Rs7Pt3h5p3s3
 RGhw9s9R0N5/1on4a7MpkMMxNXFsBSZ99xiqYChb9hesFHgElWrXj93IqZruqBI3lofFPE82WOF
 ui82qtotdkbaccnumNqC5wEGS6WnSUWLRT00cqyphDwKL1N/q+dYLWCpVr4Ms7/W5Wj5Z5ilN70
 1Z9lGUsq8j/gYJMOJpVw2CzTUygBMaBdmv9Cdx74ansSLQVT8CFnolY1YclOiN2+F/WihIMC795
 wY/XxvIoLKJilKa75DI7U88OI5rcq7NDxNjhJG57M/ZqzBjRQIlXfR4/6Pg/iV5b/16Gk7HKpsW
 OIlUj6RiB8/LEbCY7GT+l72Fno/GUPEIXUDlSfvSkEdlgZ0Q2DokUyPfogVU0obaiKHBiFLkFnc
 zUwbMrowu3IBDjCP1u6Rmq3rUcpppedSb258ceg7ay8uXxvc3knE7e
X-Received: by 2002:a05:6870:89a8:b0:409:86bc:f8a2 with SMTP id
 586e51a60fabf-40eca3ab432mr294378fac.58.1770855286621; 
 Wed, 11 Feb 2026 16:14:46 -0800 (PST)
Received: from godzilla (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
 by smtp.googlemail.com with ESMTPSA id
 586e51a60fabf-40eaf1062ffsm2331939fac.13.2026.02.11.16.14.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Feb 2026 16:14:45 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: dri-devel@lists.freedesktop.org,
	intel-gfx-trybot@lists.freedesktop.org
Cc: Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH 31/61] dyndbg: add DYNAMIC_DEBUG_CLASSMAP_USE_(dd_class_name,
 offset)
Date: Wed, 11 Feb 2026 17:13:26 -0700
Message-ID: <20260212001359.97296-32-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260212001359.97296-31-jim.cromie@gmail.com>
References: <20260212001359.97296-1-jim.cromie@gmail.com>
 <20260212001359.97296-2-jim.cromie@gmail.com>
 <20260212001359.97296-3-jim.cromie@gmail.com>
 <20260212001359.97296-4-jim.cromie@gmail.com>
 <20260212001359.97296-5-jim.cromie@gmail.com>
 <20260212001359.97296-6-jim.cromie@gmail.com>
 <20260212001359.97296-7-jim.cromie@gmail.com>
 <20260212001359.97296-8-jim.cromie@gmail.com>
 <20260212001359.97296-9-jim.cromie@gmail.com>
 <20260212001359.97296-10-jim.cromie@gmail.com>
 <20260212001359.97296-11-jim.cromie@gmail.com>
 <20260212001359.97296-12-jim.cromie@gmail.com>
 <20260212001359.97296-13-jim.cromie@gmail.com>
 <20260212001359.97296-14-jim.cromie@gmail.com>
 <20260212001359.97296-15-jim.cromie@gmail.com>
 <20260212001359.97296-16-jim.cromie@gmail.com>
 <20260212001359.97296-17-jim.cromie@gmail.com>
 <20260212001359.97296-18-jim.cromie@gmail.com>
 <20260212001359.97296-19-jim.cromie@gmail.com>
 <20260212001359.97296-20-jim.cromie@gmail.com>
 <20260212001359.97296-21-jim.cromie@gmail.com>
 <20260212001359.97296-22-jim.cromie@gmail.com>
 <20260212001359.97296-23-jim.cromie@gmail.com>
 <20260212001359.97296-24-jim.cromie@gmail.com>
 <20260212001359.97296-25-jim.cromie@gmail.com>
 <20260212001359.97296-26-jim.cromie@gmail.com>
 <20260212001359.97296-27-jim.cromie@gmail.com>
 <20260212001359.97296-28-jim.cromie@gmail.com>
 <20260212001359.97296-29-jim.cromie@gmail.com>
 <20260212001359.97296-30-jim.cromie@gmail.com>
 <20260212001359.97296-31-jim.cromie@gmail.com>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[jimcromie@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_THREE(0.00)[3];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: AB055128816
X-Rspamd-Action: no action

Allow a module to use 2 classmaps together that would otherwise have a
class_id range conflict.

Suppose a drm-driver does:

  DYNAMIC_DEBUG_CLASSMAP_USE(drm_debug_classes);
  DYNAMIC_DEBUG_CLASSMAP_USE(drm_accel_xfer_debug);

If (for some reason) drm-accel cannot define their constants to avoid
DRM's drm_debug_category 0..10 reservations, we would have a conflict
with reserved-ids.

In this case a driver needing to use both would _USE_ one of them with
an offset to avoid the conflict.  This will handle most forseeable
cases; perhaps a 3-X-3 of classmap-defns X classmap-users would get
too awkward and fiddly.

This is an untested interface extension, so drop this patch if it
feels too speculative, knowing theres at least a notional solution
should the situation arise.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 include/linux/dynamic_debug.h | 27 ++++++++++++++++++++++-----
 lib/dynamic_debug.c           | 19 ++++++++++++-------
 2 files changed, 34 insertions(+), 12 deletions(-)

diff --git a/include/linux/dynamic_debug.h b/include/linux/dynamic_debug.h
index a1454db1bcb0..0d1245aefc69 100644
--- a/include/linux/dynamic_debug.h
+++ b/include/linux/dynamic_debug.h
@@ -88,7 +88,7 @@ struct _ddebug_class_map {
 struct _ddebug_class_user {
 	char *mod_name;
 	struct _ddebug_class_map *map;
-	const int offset;	/* user offset to re-number the used map */
+	const int offset;	/* offset from map->base */
 };
 
 /*
@@ -239,11 +239,28 @@ struct _ddebug_class_param {
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
index 4d42e857cc75..5568db8451af 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -199,7 +199,7 @@ ddebug_find_valid_class(struct _ddebug_info const *di, const char *query_class,
 		if (idx >= 0) {
 			vpr_di_info(di, "class-ref: %s -> %s.%s ",
 				    cli->mod_name, cli->map->mod_name, query_class);
-			*class_id = idx + cli->map->base;
+			*class_id = idx + cli->map->base - cli->offset;
 			return cli->map;
 		}
 	}
@@ -207,12 +207,17 @@ ddebug_find_valid_class(struct _ddebug_info const *di, const char *query_class,
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
@@ -221,11 +226,11 @@ ddebug_find_map_by_class_id(struct _ddebug_info *di, int class_id)
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
@@ -1178,12 +1183,12 @@ static const char *ddebug_class_name(struct _ddebug_info *di, struct _ddebug *dp
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
2.53.0

