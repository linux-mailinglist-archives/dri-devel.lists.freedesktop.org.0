Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DF4BD1C052
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jan 2026 02:59:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F43410E587;
	Wed, 14 Jan 2026 01:59:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="cBjaOtVN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com
 [209.85.210.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B324710E5AE
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jan 2026 01:59:48 +0000 (UTC)
Received: by mail-ot1-f68.google.com with SMTP id
 46e09a7af769-7cfcbf34124so68190a34.0
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 17:59:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768355988; x=1768960788; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=saj8Myj0AXkSu5hKZJBWN47Kb5BefKCe0HbhKcuaxLQ=;
 b=cBjaOtVNWel0myHG4Kb3B0nw3WnWjSRWAfSIngBxrhlCXxNrZ6c42lxdJgmuGdxjxE
 ZG6kGQTG0tB1IpwwdEOOcYDffxLPAl4ma4vKghwTaL4nKPr1yergYd7UgboOf+rNRRO2
 LkRqLMknGwKnoM8UMqR+1CSjYrTKsnJYu9xJbuIbte84DSVcgBR4obWPu8+/WbLVUdTY
 u3LukVWhXoatdy0UeU+bKPn/pyeBewij4wSBLwDfheoblCGkf43OVxWjz7D3Uz3tGk8o
 E0cpdsVgU32vN4WBmVNdQpsWU7IwGp1ZQqn9kuEJ65oVE5ppHmO+86w3q6puLY3fv/dJ
 XSEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768355988; x=1768960788;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=saj8Myj0AXkSu5hKZJBWN47Kb5BefKCe0HbhKcuaxLQ=;
 b=WHSLUv4oPv0Hb5TRZ31tRQy3CpVuV8EW/a3rBUUPU5SmXop35idLCNJpNug17ENch9
 YnZwd+6rzjQip23vGetWi1eS78ayoRHapoIMiAxq6lb7ezikgJBDaTSz+rKMO/oDUrR+
 4DYuwzhlkvKdKNb0UVgRsKcvRvfnTOpMMdUyHVkeqz0ezCtVxEQBINb4ixXk8b78ekCU
 yuY8QpkXw1dUUsYpGrs/9PwZxTQkblxfts9bhOv73Sr1fcpcLh/Hi2kpF7lcJlaznmy8
 4KKLDJPzgPmvxXi0DCFPy1TtrIqfXzt7Kluwa4+LW20A22dd3xz2PEILi0Jv3uoFGvhG
 ABQw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU41bcrSJeYoNcQEjTtEQhm1YODf6OARTM0EYlm2cM9YqIOrXCnUD7G6o2FaL3aieW1Z6uM1pkW4Zw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxh5GSAts03agvfEZrZ09YM2WcMPtPF8bmplROxD2qGvT098C8v
 2EVE54G7QK1GayJ6wi0mpxia8HLQXppvGKbJPbj/hUXNTs/UnFERR3i4
X-Gm-Gg: AY/fxX4uz5CgODuiXGeSCkbugRZ8zZ3VlKxre5Kaq1xyFNbai8o817HgjULiCUa6uNN
 1k+f8pKr7lF/heK8O77xNkZWLZxsZ3XnBiG8GN8aLsh++AIJd6ojvrKpohvh6TR+DSdJ2LHdLZQ
 5W6MWuGIqHi1ANhsT1MgkOZCn2+oLanHXLwI7beFXSNYl+ITOfOF1np/8eLRlhjA9FnRpbYqxqM
 qcqACh/yY5hems8O+UkXHPTzkyjgbYp2yYVGMB+zOmTL8AHz2ctZBWM0uhyJNROU/0Sy/u+3pBC
 fwGNdyFb81TzndBK0eimddLd7XM5qw/JXog1UF4sFY5hpOwSOB0ZilP8+VbUa5SQp9Aviop8y85
 UhpJTgXN9nywSNAy1whzMAsuiT6W67M5PeTn31DjPldcIgxxcSnrlPjQ+k3r0KUZlHoGcGb6PBs
 mLSqIHbq/V4wugetZ08XMwQp9VQGbPN0I2l3Og
X-Received: by 2002:a05:6830:90f:b0:7ca:c7b0:17eb with SMTP id
 46e09a7af769-7cfcb5d58f9mr497841a34.10.1768355987913; 
 Tue, 13 Jan 2026 17:59:47 -0800 (PST)
Received: from frodo (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
 by smtp.googlemail.com with ESMTPSA id
 46e09a7af769-7ce47820f06sm16693548a34.11.2026.01.13.17.59.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jan 2026 17:59:47 -0800 (PST)
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
Subject: [PATCH v8 16/31] dyndbg: hoist classmap-filter-by-modname up to
 ddebug_add_module
Date: Tue, 13 Jan 2026 18:57:32 -0700
Message-ID: <20260114015815.1565725-17-jim.cromie@gmail.com>
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

The body of ddebug_attach_module_classes() is dominated by a
code-block that finds the contiguous subrange of classmaps matching on
modname, and saves it into the ddebug_table's info record.

Implement this block in a macro to accommodate different component
vectors in the "box" (as named in the for_subvec macro).  We will
reuse this macro shortly.

And hoist its invocation out of ddebug_attach_module_classes() up into
ddebug_add_module().  This moves the filtering step up closer to
dynamic_debug_init(), which already segments the builtin pr_debug
descriptors on their mod_name boundaries.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
reordered params to match kdoc
---
 lib/dynamic_debug.c | 57 ++++++++++++++++++++++++++-------------------
 1 file changed, 33 insertions(+), 24 deletions(-)

diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index c9377a444fc8..d668140794ac 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -170,8 +170,8 @@ static void vpr_info_dq(const struct ddebug_query *query, const char *msg)
 }
 
 static struct _ddebug_class_map *ddebug_find_valid_class(struct ddebug_table const *dt,
-							const char *class_string,
-							int *class_id)
+							 const char *class_string,
+							 int *class_id)
 {
 	struct _ddebug_class_map *map;
 	int i, idx;
@@ -1247,30 +1247,35 @@ static const struct proc_ops proc_fops = {
 
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
+ * @_vec: member-name of a type with: .start .len fields.
+ * @_dst: an array-ref: to remember the module's subrange
+ */
+#define dd_mark_vector_subrange(_i, _sp, _box, _vec, _dst) ({		\
+	typeof(_dst) __dst = (_dst);					\
+	int __nc = 0;							\
+	for_subvec(_i, _sp, _box, _vec) {				\
+		if (!strcmp((_sp)->mod_name, (_dst)->mod_name)) {	\
+			if (!__nc++)					\
+				(__dst)->info._vec.start = (_sp);	\
+		} else {						\
+			if (__nc)					\
+				break; /* end of consecutive matches */ \
+		}							\
+	}								\
+	(__dst)->info._vec.len = __nc;					\
+})
+
 /*
  * Allocate a new ddebug_table for the given module
  * and add it to the global list.
@@ -1278,6 +1283,8 @@ static void ddebug_attach_module_classes(struct ddebug_table *dt, struct _ddebug
 static int ddebug_add_module(struct _ddebug_info *di, const char *modname)
 {
 	struct ddebug_table *dt;
+	struct _ddebug_class_map *cm;
+	int i;
 
 	if (!di->descs.len)
 		return 0;
@@ -1300,6 +1307,8 @@ static int ddebug_add_module(struct _ddebug_info *di, const char *modname)
 
 	INIT_LIST_HEAD(&dt->link);
 
+	dd_mark_vector_subrange(i, cm, di, maps, dt);
+
 	if (di->maps.len)
 		ddebug_attach_module_classes(dt, di);
 
-- 
2.52.0

