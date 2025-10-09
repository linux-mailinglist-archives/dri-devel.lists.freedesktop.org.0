Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 830EABCA79C
	for <lists+dri-devel@lfdr.de>; Thu, 09 Oct 2025 19:59:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA16910EAE7;
	Thu,  9 Oct 2025 17:59:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ZmrsmXZI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f179.google.com (mail-il1-f179.google.com
 [209.85.166.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A7DE10EAD9
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Oct 2025 17:59:04 +0000 (UTC)
Received: by mail-il1-f179.google.com with SMTP id
 e9e14a558f8ab-42486ed0706so7397595ab.0
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Oct 2025 10:59:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760032743; x=1760637543; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=foiN7sqtth4khBjBEFbfAhEsiysHlMC95zuU+aZAUrk=;
 b=ZmrsmXZIwxH7onGRN1uEo3NMUGEe5jy7UL2cMC78zBIkApFxTAMAe8Fx8uKQb4g+aD
 +bIfEsh2zEMGn/FYQ4Jr7iIPumahLVr5UAT8RV1uaQUjhRReKVf5PXXoY0gzI+XJHgOZ
 dmrdhyXbKIWpD5h+KnY2gA+6X33fwVkPzHm/zHKtOwSZLbrPBLRHdiZSkwNBOUj3TVuP
 h5cQYNbnL0TowJnDHwMSD56L3OXokriNqBXsM+FdHcTS+/k1TSSK4NzTjSdvrmUERNIL
 si7d4a92Gn4z+Y0aKaA2gvzJVMOgU/CBahJpHJO0pVXNxgz/8HJ+pgErY96Oy93/vCGC
 mKkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760032743; x=1760637543;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=foiN7sqtth4khBjBEFbfAhEsiysHlMC95zuU+aZAUrk=;
 b=A5R+Nj2dJi4QYrFjH8TWxoOkmG7Y7FAuU1h5gc2dlm/NOWf/E+KV+wTcVEBv4gJmDh
 LIYoiNDJJdVm0nodBD7f2Na+tsFOQb8OZRuRML2mGMTRj8lDi+r64cMErlEGcDqH0Pvt
 Qz3YHmfzOLK4pHwWZOYH6SRG55AcBTl9sQtx6lQ0nN18raUDRVsXYlIgJ+afY1ag1pGm
 6Nsiw03m1VvDBwgCQnU1WEOOEazg1etRmLArPX5IxU5b81N2Fkowu4GXfQ7kjqn63z/k
 hNk8MxX0Q6sy2mcMw0NEwW2CTVbP4igMyEGeAI8PFVy2Fd15wzD8yCr7nE+ZjsSP2qGA
 oPCg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVap2kCGv2R+iEPrt2PTtblSEWdwsyOxXapAyTJEW2UDZPcVZ6NYSrW8IJPNHD8NNsfGEXsBaQFJnc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx6zDARvoOOd6FsMkEU3X7xt6eKCSednYwbjjRAW/2COTR8mR7J
 DwIFBXrIKTLosElyDualryfmpodmA3v2X/rNWtlMQ5zkSz97Es9J6N91A7wm1A==
X-Gm-Gg: ASbGncs827RONJVvTiq/uuiPpFHN43RqTcen5VSZuOI3x2WNriPjVTmAGsjek6MYhLp
 uF5sK71LVMNDRsaJQAbcFP4nWqnvfVEHJieGK4uT1iOkq4Igeg/MdMNfwx1oqMM6Sd/1hTEgbph
 HvqUAAVHpMSqiuBAe+df+gUgE53IuS8+AkuPF3Zt8pydDlgvn/PXNp83Axp6HL4DszATuekrUI4
 18hsDcbcubkE+IQBUJVanjAHR62HETEHbjjcbhG+aVmDmFBJZCm4d1JbRqAPSAINCwSGSTbpqzI
 YPU3MZ4V1hwcpFZDS789+ZVgoPljMIgc21xSxTDnFHh4xO47Cr9d3wiE3i1lWKmlUK0WXzv+8Ss
 eRcIQhBuiWeGjapclqX0cSPAI0Qsr6tav9jIZ9ScH5TWtHRvhjPBNlb9nqg0531vS4NORu9ZvPI
 zEAytAItOoK7yCE2wG2XHeDZIIsBHjrO40VJjM8g==
X-Google-Smtp-Source: AGHT+IEXrf0bXn6pOGAetXvcTVTItgA/41FlLlYPAXC+Ci3frkzz6F6WaNaH9mI22d7vbWJNi23HhQ==
X-Received: by 2002:a05:6e02:216d:b0:42f:8eeb:499d with SMTP id
 e9e14a558f8ab-42f8eeb4a47mr41838465ab.8.1760032743223; 
 Thu, 09 Oct 2025 10:59:03 -0700 (PDT)
Received: from godzilla.raven-morpho.ts.net
 (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
 by smtp.googlemail.com with ESMTPSA id
 8926c6da1cb9f-58f7200c4afsm30256173.35.2025.10.09.10.59.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Oct 2025 10:59:02 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com
Cc: gregkh@linuxfoundation.org, ukaszb@chromium.org, louis.chauvet@bootlin.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, daniel.vetter@ffwll.ch,
 tvrtko.ursulin@linux.intel.com, jani.nikula@intel.com,
 ville.syrjala@linux.intel.com, Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v5 15/30] dyndbg: hoist classmap-filter-by-modname up to
 ddebug_add_module
Date: Thu,  9 Oct 2025 11:58:19 -0600
Message-ID: <20251009175834.1024308-16-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251009175834.1024308-1-jim.cromie@gmail.com>
References: <20251009175834.1024308-1-jim.cromie@gmail.com>
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
index 53ce28255426..bbbdb8aba071 100644
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
2.51.0

