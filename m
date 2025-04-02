Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E9EDA7940F
	for <lists+dri-devel@lfdr.de>; Wed,  2 Apr 2025 19:42:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8382010E88C;
	Wed,  2 Apr 2025 17:42:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="i9sMANgy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f53.google.com (mail-io1-f53.google.com
 [209.85.166.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CD1110E87F;
 Wed,  2 Apr 2025 17:42:28 +0000 (UTC)
Received: by mail-io1-f53.google.com with SMTP id
 ca18e2360f4ac-85b3f92c8dfso528739f.2; 
 Wed, 02 Apr 2025 10:42:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1743615747; x=1744220547; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1HVCxpeKRFzeSI1AhmlyvBuPBqCCJEuta9afFF5qwQI=;
 b=i9sMANgyVawnzvrGjLqJPRGhs70gYkBi3JzhvTanyLeyoafr/ZnrScrAvW55vsYQIE
 OxjBofEUizXY09mVfYTJ0W1B4hjmJ3w/oxo/O8qDsXsyzjul7eOXfum903jB47pVM06g
 /U5kIATMnmHj0Dr520kpGSKoTKS92g8Z9nvTdNcGY0Zc/5bQqCh8TX8lgxWXFY6ZOrjo
 gid+43N7xWNYaLPuk5V9gWtmmMwfWu7oLJlmF/IBnUkDEuPRng5WCts4i0CSiR5B3HF/
 9x/QIdhPq39yGmP7D3YdYIA3t42mOFOXKSWUEmqxQwgU/IEpsaR29huUKqZoMQeewxb4
 FRlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743615747; x=1744220547;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1HVCxpeKRFzeSI1AhmlyvBuPBqCCJEuta9afFF5qwQI=;
 b=KJAnAO5GgFarUjLz93tXRL47xXzlXFuEfmOjCbYu29NmQ7pmJRjJfoXLEbywDvUoh5
 yiW6xiYbqoBHaXYMMywNhqUFluDxPZKvrIam2Gcr/hwvGVxoXCARHmfoRCV/9cP+SUU6
 4/5aDXNKyqR0hE/2oE9WPZ532P7FXsEybPXkfWPb6QcIE9ooBiK68zAO6PPNaWsURRtV
 I+RWtcyPdy1hF8bIkhhf05tnnMWjtNhBgSVeBJK6WN5cglw7+pOkcaedDZwOeeH2CKgq
 p4EeQ9eEgHKVK9W3N0/2GVJPrk70OmA+urEDTMmGdGjs01w5bba8+a0MHnnaowyEUxgz
 IKXg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV5bWSGRJL9kYHl781wII5MLwivP1bJ1iucwlyoLK0gT04pGcx1biEo+xyLqaBJa5O3y9Y9F5gfcuqnYDxx9Q==@lists.freedesktop.org,
 AJvYcCVFPKCdiuu27Gw83FnLiiDMwu9ICvcgvUQ6JDIqnf/vuQn7D4EyEtuJcyE+nZiV/uwH0c+pkFRZ@lists.freedesktop.org,
 AJvYcCXpF9GdD9DqFUkmZ/uijTixd2yD8y6/6yAGvpddnkSQ+6Z2tLAYvLH4E8qjrX7rSttmjK6HOE+nN0m9@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwRLtsJ9T61eeF6+P1K2CPlTt770VY9WaicQ5qom+/g2ud+mPtR
 P1HNYibyC3KGWFM9vaKqZbgc4EkgGv8eJQXOypOv92VgijIJ+aJa
X-Gm-Gg: ASbGncvotkdih/uHx2LV0o1lDRmrITeJL7hZ/FT6wEo8BhoUuDnLifd+qXNX0FADVkw
 w2td+cMsiZf2IEtXwivPZFaWT0APirjYaYKJYzHBOCwrmxUIkO7n4BvAV8zQBhO0GWuyQtxKE1t
 T0nBpoAF5JUGVjx7GTb6OiGo0oPm+puQ1ZBizWIZ2w5gZ5fPPHNi4Nqjg+MATwQWA2OqOsxzRUd
 0vj4TB2+Rzoris6ZvblomlCrD2B37bR7HcySNGl2ZBt7GpiGmuX9BdWUBTZcyWjz8yXTUPcmZ7t
 iyptTP6+6StkNyUN18VvK3CuoErzzJWtoFXiYhqnNWoe4B6t8WbiRz6FtRryuLNb9S/Ejb01Ror
 1Yg==
X-Google-Smtp-Source: AGHT+IGlzPv/lWLR6oQjYV5JPNtW8nNh4plsjoqpQBkDo3jtIwkHZqjbr7e+0JVOkoajzQcuo3mWrg==
X-Received: by 2002:a05:6e02:3c85:b0:3d3:d994:e92e with SMTP id
 e9e14a558f8ab-3d5e09db5d3mr173949595ab.17.1743615747396; 
 Wed, 02 Apr 2025 10:42:27 -0700 (PDT)
Received: from gandalf.. (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
 by smtp.googlemail.com with ESMTPSA id
 e9e14a558f8ab-3d5d5af8369sm33439725ab.71.2025.04.02.10.42.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Apr 2025 10:42:26 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, gregkh@linuxfoundation.org, ukaszb@chromium.org,
 louis.chauvet@bootlin.com, linux-kernel@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 daniel.vetter@ffwll.ch, tvrtko.ursulin@linux.intel.com,
 jani.nikula@intel.com, ville.syrjala@linux.intel.com,
 Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v3 14/54] dyndbg: hoist classmap-filter-by-modname up to
 ddebug_add_module
Date: Wed,  2 Apr 2025 11:41:16 -0600
Message-ID: <20250402174156.1246171-15-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250402174156.1246171-1-jim.cromie@gmail.com>
References: <20250402174156.1246171-1-jim.cromie@gmail.com>
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

The body of ddebug_attach_module_classes() is dominated by a
code-block that finds the contiguous subrange of classmaps matching on
modname, and saves it into the ddebug_table's info record.

Implement this block in a macro to accommodate different component
vectors in the "box" (as named in the for_subvec macro).

And hoist its invocation out of ddebug_attach_module_classes() up into
ddebug_add_module().  This moves the filtering step up closer to
dynamic_debug_init(), which effectively does the same for builtin
pr_debug descriptors; segmenting them into subranges by modname.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 lib/dynamic_debug.c | 56 ++++++++++++++++++++++++++-------------------
 1 file changed, 32 insertions(+), 24 deletions(-)

diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index 104cf8abdf33..046c4ffb38f8 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -161,8 +161,8 @@ static void vpr_info_dq(const struct ddebug_query *query, const char *msg)
 }
 
 static struct _ddebug_class_map *ddebug_find_valid_class(struct ddebug_table const *dt,
-							const char *class_string,
-							int *class_id)
+							 const char *class_string,
+							 int *class_id)
 {
 	struct _ddebug_class_map *map;
 	int i, idx;
@@ -1224,30 +1224,34 @@ static const struct proc_ops proc_fops = {
 
 static void ddebug_attach_module_classes(struct ddebug_table *dt, struct _ddebug_info *di)
 {
-	struct _ddebug_class_map *cm;
-	int i, nc = 0;
-
-	/*
-	 * Find this module's classmaps in a subrange/wholerange of
-	 * the builtin/modular classmap vector/section.  Save the start
-	 * and length of the subrange at its edges.
-	 */
-	for_subvec(i, cm, di, maps) {
-		if (!strcmp(cm->mod_name, dt->mod_name)) {
-			if (!nc) {
-				v2pr_info("start subrange, class[%d]: module:%s base:%d len:%d ty:%d\n",
-					  i, cm->mod_name, cm->base, cm->length, cm->map_type);
-				dt->info.maps.start = cm;
-			}
-			nc++;
-		}
-	}
-	if (nc) {
-		dt->info.maps.len = nc;
-		vpr_info("module:%s attached %d classes\n", dt->mod_name, nc);
-	}
+	vpr_info("module:%s attached %d classes\n", dt->mod_name, dt->info.maps.len);
 }
 
+/*
+ * Walk the @_box->@_vec member, over @_vec.start[0..len], and find
+ * the contiguous subrange of elements matching on ->mod_name.  Copy
+ * the subrange into @_dst.  This depends on vars defd by caller.
+ *
+ * @_i:   caller provided counter var, init'd by macro
+ * @_sp:  cursor into @_vec.
+ * @_box: contains member named @_vec
+ * @_vec: an array-ref, with: .start .len fields.
+ * @_dst: an array-ref: to remember the module's subrange
+ */
+#define dd_mark_vector_subrange(_i, _dst, _sp, _box, _vec) ({		\
+	int nc = 0;							\
+	for_subvec(_i, _sp, _box, _vec) {				\
+		if (!strcmp((_sp)->mod_name, (_dst)->mod_name)) {	\
+			if (!nc++)					\
+				(_dst)->info._vec.start = (_sp);	\
+		} else {						\
+			if (nc)						\
+				break; /* end of consecutive matches */ \
+		}							\
+	}								\
+	(_dst)->info._vec.len = nc;					\
+})
+
 /*
  * Allocate a new ddebug_table for the given module
  * and add it to the global list.
@@ -1255,6 +1259,8 @@ static void ddebug_attach_module_classes(struct ddebug_table *dt, struct _ddebug
 static int ddebug_add_module(struct _ddebug_info *di, const char *modname)
 {
 	struct ddebug_table *dt;
+	struct _ddebug_class_map *cm;
+	int i;
 
 	if (!di->descs.len)
 		return 0;
@@ -1277,6 +1283,8 @@ static int ddebug_add_module(struct _ddebug_info *di, const char *modname)
 
 	INIT_LIST_HEAD(&dt->link);
 
+	dd_mark_vector_subrange(i, dt, cm, di, maps);
+
 	if (di->maps.len)
 		ddebug_attach_module_classes(dt, di);
 
-- 
2.49.0

