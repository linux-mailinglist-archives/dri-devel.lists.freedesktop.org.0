Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3128CC6B8E8
	for <lists+dri-devel@lfdr.de>; Tue, 18 Nov 2025 21:19:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 278E410E520;
	Tue, 18 Nov 2025 20:19:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Yfw3WP2q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f54.google.com (mail-io1-f54.google.com
 [209.85.166.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5536810E51A
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 20:19:19 +0000 (UTC)
Received: by mail-io1-f54.google.com with SMTP id
 ca18e2360f4ac-9490a482b7bso108349639f.1
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 12:19:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763497158; x=1764101958; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=57tC5fcXib20YlGSpjepRBmCcERyspoSOH53yUhNSS8=;
 b=Yfw3WP2qG+BDI8RDD6AIpoin4KLoFECjyGuxVoNkd4q/UpU0hzFBQPxPogkD/6fLkj
 eHn0wQMdxQ0LZ676gM7yp+aFNp07MRFW0uMIFnqd41qmhxMAyDUY/6KxyF0+06BU+OcM
 yhk/FGW8/0oLDdE7t85JlBWBuUeMkbpxJXC5wfYXjihVjQo2SLU25EO3AE5WaDPowag0
 BIiMNv2u+SKhFplqSeVK31aY7pDE3wgqiBTRLT955c+Bs6zmnotsEOB1sQU5edm1Kjql
 5VbcBKeowlEf5jutPTbbYfRSXg6oc6BSot1ZF0N3oURIi1jbll8crkb05H8m7qzcJOuf
 OJcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763497158; x=1764101958;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=57tC5fcXib20YlGSpjepRBmCcERyspoSOH53yUhNSS8=;
 b=bTuL9qT8CPvbW6MklZ5b40hoeI5u0bAhShz0/jl8DSKpmtNdGI7kKzJdLV7ZCEQfDE
 2rDr52IVFGSWLw/mPW0+QEarmI+oQ5dw1XN8WlAwsbx627KTqOzflgSp8Nb4ocaFiei4
 3ajE32A9zkkrDUgTRMO8xBneL01HEHz35qANFF9tNcYFfDp7vq77CyCob2+r4Xj3Guh4
 09jE7oQk67fnU4uQxqrUUL24QKalvPi8DF49DUv/xCrD+8CadfIeR9TlI+rQOF9l0b2Z
 AqoWdxi1eRfmP4a484BctefPFBe2T+xWPd9e2c1X3Rv99BiBQhyt2dSbL0yk464psTiY
 sPNQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWYtuAtENZKeOmCZmQnQpqeBDzVep0LMVYTsgsyIpEC46960lsXfLVBDO5UnS35zyNdyz8pGEb5MYA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzdxWQzqYsOWuBxJEAJRUG7J5y8dBn0gfBzrd8+PGdIKPT3McUE
 dms6txyiuAwu2uo0qxuG7I8sJ+VglcXoO+/ug+fd35xEHz1v9oL5zJnc
X-Gm-Gg: ASbGncv9oh5H8xGYaIsXBAImwdK7nthlwigVZ6e5SRIEF57DUtdd0SSjcUz8+SJwIkf
 sVPuX+Ct4ZUkXynIh13ivnnJMHHbFzpIEELXBlFfKl5EgvQ1go5biMGf7iyWjv8DjF7ywJYk3cX
 OCMy+g5WAv4wREoQhKgKYirgcIKECqcKK521qouCI0Ni5rrpKTSBQLMiNjRDc6rlKCIrALhB/P3
 jobFgduAQ68CaZlLwe33KZjtSnwnEgW7nNJ57yhMmhoSiwC2QbwTxN2Xof/prAi78uZPeThNttE
 eNH7QE8iAJamBmWTr5OMAXbK46cAZuDVjeWVQzJGYSFZTH0J+dAlGEpa8s0BAsJNUw3BEKNGY6r
 TDvfF293/iHm4yT9x8tdeR728gsMA+Nt87tXOVirN6b2txWHRqRRQtw2TS/q6bhtfYzFa8GIic9
 VbGJWy7CfKH2P0yfFukPvbYg7rMyE/RvMT1GBmxyRgEHb1qw6itcPb01dAruKeGPGR3tPuXHc3r
 IPryYApdkQ4F7tv
X-Google-Smtp-Source: AGHT+IHIJhkaq+ArqTWu43f/20jDi7p+m5ELZRQSWIDsTyPD3eZ+/5krpCWNcCzDlN6i90tbPAji5w==
X-Received: by 2002:a05:6602:15cb:b0:949:93e:bc0 with SMTP id
 ca18e2360f4ac-949093e267amr992147039f.8.1763497158526; 
 Tue, 18 Nov 2025 12:19:18 -0800 (PST)
Received: from godzilla.raven-morpho.ts.net
 (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
 by smtp.googlemail.com with ESMTPSA id
 ca18e2360f4ac-948fd4c273bsm419823939f.18.2025.11.18.12.19.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Nov 2025 12:19:17 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 gregkh@linuxfoundation.org, jbaron@akamai.com
Cc: ukaszb@chromium.org, louis.chauvet@bootlin.com,
 Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v6 16/31] dyndbg: hoist classmap-filter-by-modname up to
 ddebug_add_module
Date: Tue, 18 Nov 2025 13:18:26 -0700
Message-ID: <20251118201842.1447666-17-jim.cromie@gmail.com>
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
Ive review checkpatch complaints:
all are lvalues, and not issues.
CHECK: Macro argument reuse '_dst' - possible side-effects?
CHECK: Macro argument reuse '_sp' - possible side-effects?
CHECK: Macro argument reuse '_vec' - possible side-effects?
---
 lib/dynamic_debug.c | 57 ++++++++++++++++++++++++++-------------------
 1 file changed, 33 insertions(+), 24 deletions(-)

diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index c9377a444fc8..49de591f036a 100644
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
+#define dd_mark_vector_subrange(_i, _dst, _sp, _box, _vec) ({		\
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
 
+	dd_mark_vector_subrange(i, dt, cm, di, maps);
+
 	if (di->maps.len)
 		ddebug_attach_module_classes(dt, di);
 
-- 
2.51.1

