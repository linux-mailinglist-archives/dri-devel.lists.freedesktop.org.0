Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9F7AA1C183
	for <lists+dri-devel@lfdr.de>; Sat, 25 Jan 2025 07:47:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E113310EA6E;
	Sat, 25 Jan 2025 06:47:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="LWT+GB5J";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f43.google.com (mail-io1-f43.google.com
 [209.85.166.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFC3110E2A0;
 Sat, 25 Jan 2025 06:47:01 +0000 (UTC)
Received: by mail-io1-f43.google.com with SMTP id
 ca18e2360f4ac-84cdacbc373so84589139f.1; 
 Fri, 24 Jan 2025 22:47:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737787621; x=1738392421; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ke4SvBesy7HOPaleQwpGGG+LJLBeY9FJV6nhVnr7e/A=;
 b=LWT+GB5JyQqoh+J0Q4BMx1uuwpUizu0QxA7xrbucxbrfHSz4ayv2+WKXsJXc0i3/3s
 8B15B0bNhQCcBndpnTK5NzzGPjTyBc0QhKZht7vrk19IZtUbSGo6ckUJB+necYPejD+s
 nBrByC/T+NBW1QNtF71l1TSuDX8VD5BW8/7IyOgkY9Uh6GpkkuQ3j5jU752/JXY7eeC9
 3Tp+/BmTVUWIb0zKwCRLpcAm7kVfrVdBQ7dRX/Oh6dbHlaDdlsmynfOpKi/cnRZdRS6S
 cF0ygbdRXE2/b3/NALb6TxCAmHGD0dyRABfrtyX2F+m84vd85TxLM9wn6I+oe/8L+c+p
 HHeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737787621; x=1738392421;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ke4SvBesy7HOPaleQwpGGG+LJLBeY9FJV6nhVnr7e/A=;
 b=Pgasn7/IcxLZ9NjDTEUYMVK67zn9bpG0DBwbLS2hLVdwma1Q9zGzzb15q83xmFniLp
 KQ/fV6HL4efbd/vM2Z6+IDMug3TxUKoSwBMKasKRKEluDD4dAbws1+n1UsFwKikqD7wW
 67rH30ZxhNjZ6mloWK01kcBK/02xJUgvWMb9SBdMpMxUtdrAh96I5960b5HSIcyYv1+h
 fK2zKICVrLvD6UoTc3MKOQNA+Lt/kZL8ye6d9f0VUCRkWOufEg/89d3GIr4SGzQUFH06
 guBQAfKOhCA+lRetKXJ+r3ZFhOsM77/vyq01991bVh6ieSNQWrEmpXfZVrgnWUlstzI5
 JM5g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUCJU9MXaEp1NhjIneSZtAyEv3URbRpl1BQZ1uJpn95aQ7+0936jVLm7zjQC7TIzgDPC3nW1Kg2@lists.freedesktop.org,
 AJvYcCVJ2SxBiolCbmxEsJodLZ6Jm6TZj8qm59Iyrzqe5kC0mEJeZXMJ2Mw3tisBCTM3ZArSfDUVhSdGtSVIWlLU4w==@lists.freedesktop.org,
 AJvYcCVWx8mY2s4iy+2nRLChNJeSNam4Sy1JwLzb8vFqyzKFp37VzRU9xWaF8QTdvmZ7TygjUv2RzpkHltTa@lists.freedesktop.org,
 AJvYcCX1c2/fdhE3MIJ+H0jzENw1d4UyrWlXgfvXr1dC2NhjvinKhrxUh2bxtJhO0JtA7cn8n2kO42+SSeza@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwIcyP8g8v14ITnNVMRZTkB9ylRsfWX97IS9dsqTLv5FY0BRmIK
 jJCGAv2SY1g9Mcgvz8WLOmVXtHHNz3gLdCkpmxO1dGfGGFdlBSmm
X-Gm-Gg: ASbGncsuO+EWfxGSojxt4XVfNRxdaot+fxk5ZvjZW05AafG+3OBcoP9O9keN2SLPo17
 l4Pk0/fDx+xAXAVZ2vfnKzz/cU8AnP7Zr1moGDgrJnYBun1vbPY7VqZaqOmQaSolYH77rMaGbAi
 Tqlh9gt7oZJunQP/tFfxRuYOyXELFXQ8IQ8ZoRpCS05GmGfYZvdrBZZJ73UQEo4RsA0jExlUd/f
 0OYEM2pYb7XoWfc+tjIhFK7HiAYfT7HMCvZEpjEqQnsaamhOmJZMeRxfH6th9lwVXqjeQjdragw
 xoUA6WI995S971p7md5mNgynjrp5V3lBguAZFA==
X-Google-Smtp-Source: AGHT+IHEFU3echceWmiA4eLPNghqGqyfiHEPHKsu8QESTZXaHS27iWJhMF9tECXmhlWc+hFhQTlaGQ==
X-Received: by 2002:a05:6602:3a8b:b0:84a:51e2:9f93 with SMTP id
 ca18e2360f4ac-851b6285d20mr2848702339f.9.1737787620929; 
 Fri, 24 Jan 2025 22:47:00 -0800 (PST)
Received: from gandalf.. (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
 by smtp.googlemail.com with ESMTPSA id
 8926c6da1cb9f-4ec1da476fesm1174144173.58.2025.01.24.22.47.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jan 2025 22:47:00 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, jbaron@akamai.com,
 gregkh@linuxfoundation.org, ukaszb@chromium.org
Cc: intel-gfx-trybot@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, daniel.vetter@ffwll.ch,
 tvrtko.ursulin@linux.intel.com, jani.nikula@intel.com,
 ville.syrjala@linux.intel.com, Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH 22/63] dyndbg: rework ddebug_attach_*module_classes()
Date: Fri, 24 Jan 2025 23:45:36 -0700
Message-ID: <20250125064619.8305-23-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250125064619.8305-1-jim.cromie@gmail.com>
References: <20250125064619.8305-1-jim.cromie@gmail.com>
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

These 2 fns both start with a codeblock which cleans up the classmaps
arrays, finding the few that pertain to the module being added.

Reduce this repetition to a macro: dd_mark_vector_subrange() and call
it 2x.  This macro finds the matching-on-modname subrange of a linker
ordered array of builtin classmaps/users, and saves the subrange into
the dt/debug-table's ddebug-info record.

Then hoist those calls from ddebug_attach*() up to ddebug_add_module().
This puts the "cleanup" of class* arrays into ddebug_add_module(), not
cluttering the original purpose of the 2 routines.

And with ddebug_add_module() now updating dt with the classmaps for
the module, the di arg to ddebug_attach_{,user}module_classes() is no
longer needed, so drop it.

Finally, rename the 2 functions, from *attach* (describing the dt
update in the macro) to module_apply_class_{maps,users} to reflect the
tighter focus.

NB: The macro's main purpose is to handle multiple builtin classmaps
or users, which is the only circumstance where less than the full
array of classmaps is pertinent.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
---
 lib/dynamic_debug.c | 104 ++++++++++++++++++++------------------------
 1 file changed, 48 insertions(+), 56 deletions(-)

diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index 0ef243e30663..8afcd4111531 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -1212,72 +1212,54 @@ static void ddebug_apply_params(const struct ddebug_class_map *cm, const char *m
 }
 
 /*
- * Find this module's classmaps in a sub/whole-range of the builtin/
- * modular classmap vector/section.  Save the start and length of the
- * subrange at its edges.
+ * scan the named array: @_vec, ref'd from inside @_box, for the
+ * start,len of the sub-array of elements matching on ->mod_name;
+ * remember them in _dst.  Macro depends upon the fields being in both
+ * _box and _dst.
+ * @_i:   caller provided counter var.
+ * @_sp:  cursor into @_vec.
+ * @_box: ptr to a struct with @_vec, num__##@_vec, mod_name fields.
+ * @_vec: name of ref into array[T] of builtin/modular __section data.
+ * @_dst: ptr to struct with @_vec and num__##@_vec fields, both updated.
  */
-static int ddebug_attach_module_classes(struct ddebug_table *dt,
-					const struct _ddebug_info *di,
-					u64 *reserved_ids)
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
+static int ddebug_module_apply_class_maps(struct ddebug_table *dt,
+					  u64 *reserved_ids)
 {
 	struct ddebug_class_map *cm;
-	int i, nc = 0;
-
-	for_subvec(i, cm, di, maps) {
-		if (!strcmp(cm->mod_name, dt->mod_name)) {
-			vpr_cm_info(cm, "classes[%d]:", i);
-			if (!nc++)
-				dt->info.maps.start = cm;
-		}
-	}
-	if (!nc)
-		return 0;
-
-	vpr_info("module:%s attached %d classes\n", dt->mod_name, nc);
-	dt->info.maps.len = nc;
+	int i;
 
 	for_subvec(i, cm, &dt->info, maps)
 		ddebug_apply_params(cm, cm->mod_name);
+
+	vpr_info("module:%s attached %d classmaps\n", dt->mod_name, dt->info.maps.len);
 	return 0;
 }
 
-/*
- * propagates class-params thru their classmaps to class-users.  this
- * means a query against the dt/module, which means it must be on the
- * list to be seen by ddebug_change.
- */
-static int ddebug_attach_user_module_classes(struct ddebug_table *dt,
-					      const struct _ddebug_info *di,
-					      u64 *reserved_ids)
+static int ddebug_module_apply_class_users(struct ddebug_table *dt,
+					   u64 *reserved_ids)
 {
 	struct ddebug_class_user *cli;
-	int i, nc = 0;
-
-	/*
-	 * For builtins: scan the array, find start/length of this
-	 * module's refs, save to dt.  For loadables, this is the
-	 * whole array.
-	 */
-	for_subvec(i, cli, di, users) {
-		if (WARN_ON_ONCE(!cli || !cli->map || !cli->mod_name))
-			continue;
-		if (!strcmp(cli->mod_name, dt->mod_name)) {
-			vpr_cm_info(cli->map, "class_ref[%d] %s -> %s", i,
-				    cli->mod_name, cli->map->mod_name);
-			if (!nc++)
-				dt->info.users.start = cli;
-		}
-	}
-	if (!nc)
-		return 0;
-
-	dt->info.users.len = nc;
+	int i;
 
 	/* now iterate dt */
-	for_subvec(i, cli, di, users)
+	for_subvec(i, cli, &dt->info, users)
 		ddebug_apply_params(cli->map, cli->mod_name);
 
-	vpr_dt_info(dt, "attach-client-module: ");
+	vpr_info("module:%s attached %d classmap uses\n", dt->mod_name, dt->info.users.len);
 	return 0;
 }
 
@@ -1288,8 +1270,10 @@ static int ddebug_attach_user_module_classes(struct ddebug_table *dt,
 static int ddebug_add_module(struct _ddebug_info *di, const char *modname)
 {
 	struct ddebug_table *dt;
+	struct ddebug_class_map *cm;
+	struct ddebug_class_user *cli;
 	u64 reserved_ids = 0;
-	int rc;
+	int rc, i;
 
 	if (!di->descs.len)
 		return 0;
@@ -1311,9 +1295,17 @@ static int ddebug_add_module(struct _ddebug_info *di, const char *modname)
 	dt->info.descs = di->descs;
 
 	INIT_LIST_HEAD(&dt->link);
+	/*
+	 * for builtin modules, ddebug_init() insures that the di
+	 * cursor marks just the module's descriptors, but it doesn't
+	 * do so for the builtin class _maps & _users.  find the
+	 * start,len of the vectors by mod_name, save to dt.
+	 */
+	dd_mark_vector_subrange(i, dt, cm, di, maps);
+	dd_mark_vector_subrange(i, dt, cli, di, users);
 
-	if (di->maps.len) {
-		rc = ddebug_attach_module_classes(dt, di, &reserved_ids);
+	if (dt->info.maps.len) {
+		rc = ddebug_module_apply_class_maps(dt, &reserved_ids);
 		if (rc) {
 			kfree(dt);
 			return rc;
@@ -1324,8 +1316,8 @@ static int ddebug_add_module(struct _ddebug_info *di, const char *modname)
 	mutex_unlock(&ddebug_lock);
 
 
-	if (di->users.len) {
-		rc = ddebug_attach_user_module_classes(dt, di, &reserved_ids);
+	if (dt->info.users.len) {
+		rc = ddebug_module_apply_class_users(dt, &reserved_ids);
 		if (rc)
 			return rc;
 	}
-- 
2.48.1

