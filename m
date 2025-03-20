Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FD22A6AD75
	for <lists+dri-devel@lfdr.de>; Thu, 20 Mar 2025 19:53:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA7B110E6CB;
	Thu, 20 Mar 2025 18:53:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="f13kwGIp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f41.google.com (mail-io1-f41.google.com
 [209.85.166.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D58110E6B6;
 Thu, 20 Mar 2025 18:53:19 +0000 (UTC)
Received: by mail-io1-f41.google.com with SMTP id
 ca18e2360f4ac-85dac9729c3so88951039f.2; 
 Thu, 20 Mar 2025 11:53:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742496799; x=1743101599; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+kaCTiwhJayt1JlAfm8DPKyx6wcUxQmldJtN5HWBOOw=;
 b=f13kwGIpGr/6j/bafRLwW4Ij1vZodunc7Y+1jvJi6H2di2JaHsUwDGrAv6WEXu9uZp
 Js13T+55lOoiCD9ErrHzws9sRrKe7e4x4xm65y1weRz08jRmz9NyKjvKuUottIFwlzcl
 32KQC5wF4iIxiNE6a23umj1bAm0p/F7UqhsYPrrDY4BQ0M8Ej/jq3KswLge2sjPtEtrx
 vnijD0nleUIJqIy/swv19v0WH0ecmlulqLnUuHt/iGk0rnEJXdCzAYwEutWS7GIb9XGs
 4yx+rlXGTYHWrJ6gLKgHN1+jqX49s0sJ5a0ZfFeV078NzHvw3nVgYDDVWVr9xwP5Q1+N
 Eu3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742496799; x=1743101599;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+kaCTiwhJayt1JlAfm8DPKyx6wcUxQmldJtN5HWBOOw=;
 b=Gs+me8rxM300oDp1/9kPWPnozTulTuYOM5vJeMEFVqgF+JA0u/cGu4AEQ2Yhye7XTw
 GDWFQsp8Opm3w1MaIpic40VcjsXyDWQfCa4nnEvIow3wDtObq4Ud3lwkQaWgjS/vlb7O
 s+Yvwlx3NGsJD0p1arB6yzir6D9z9MblXFfnxzW6ZcOY4FCEYpcukwio2ZNf/H2oAdzQ
 1OV9ryaa48RbxntOiwpLZDctj719lDIghU3OaDgQm1m94CBQPJzv0AV+YgP3P2rYS1fn
 3FXhoEnuadXGVLJ/JBHIkiS1u+WrU8jMTXW+l/+8nhKn/rOIg8gY6Uw9Ogu0izSasTCr
 P2eA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU3pNGDkdh3w0g/+eEtLt7F7ou5ixI0PCGV9VfUiCyv7LIIaOHbyaHGWAwFup/pV1HeZMgYxvULCNooVQFqFEYMTw==@lists.freedesktop.org,
 AJvYcCUS+x6sWOTx9B4IbtZueapgJw4iQc961Sns6+ELA9FcZOA03HMkEAbux5y0IBOXTviwe1tAWbCvHM2q@lists.freedesktop.org,
 AJvYcCUdihUtF0nS1Tow5VWCjjtFQldiHI8gOhHYNI8oP0KtaLCFGAlSj1ST/EfhndOyvf5SU7rcOKsjg4AcqKxAnA==@lists.freedesktop.org,
 AJvYcCV0NYllTUzy/rXZxm+Ni8MVpJdVgsbYFiKXhpVGk3vqEQWDCuYXiGSRpOYOouJflYDB4m6fmBHcYHfs@lists.freedesktop.org,
 AJvYcCVnnBoZKfluyM7jkLKujSL4lYiZ58KVOb4FRbTpHCsxRqc81oXMr/qKuXpQeC6nKkqpaLAUgfJ6@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwLpjx9HxdeJZx8nr/ifs9oQmeeVk5/XmCu7jC9wbmF6Rx6BeWJ
 88oJo33ahYqtgM+qgCxUnYXWcxXObcmxrz0Umh27ZH57x8UI0Tyr
X-Gm-Gg: ASbGnctbEYBQkPAG0p7SiaH+9UllTAacYSBceFKJLXfGlo3ltwsFOtw5NzTMF5isGEI
 biyxgXiQEbLWwGIoUverXmzO4oPSX1KI/+CtE4bR280kal6qwz5EHfm6Rk69cHLiGMj48IIh0bd
 js5oWahQ6g333bVC8nl71YrteoveJ7LRa+Vy9LFTzKbU768EsO9XftgC2uhTdQNiQYUEMnK76Qg
 r3LDmQQHVLn1A3EQUPUaDFeqKSVaJOkab2LURZKvC8adGHoJYoM6vRHbGPHRlAOnbOCM3yWTSfg
 HedzPYYEOX2y47gcJBt650XTARqPqMlC/zXeH8mmkYEzPgRjcnJH0RXIfvVNZvn5+dJwiIraedQ
 N9Q==
X-Google-Smtp-Source: AGHT+IG+eXZQew9Zz3S46b21hITOH+yZSzgsGUgOD50otkztworp1cnBoNHaVXECO8PqrRp10phT8Q==
X-Received: by 2002:a05:6602:3587:b0:85c:c7f9:9a1c with SMTP id
 ca18e2360f4ac-85e2cc5fee2mr44402139f.13.1742496798829; 
 Thu, 20 Mar 2025 11:53:18 -0700 (PDT)
Received: from gandalf.. (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
 by smtp.googlemail.com with ESMTPSA id
 ca18e2360f4ac-85e2bc273e7sm7078039f.17.2025.03.20.11.53.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Mar 2025 11:53:18 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-gfx-trybot@lists.freedesktop.org
Cc: jbaron@akamai.com, gregkh@linuxfoundation.org, ukaszb@chromium.org,
 louis.chauvet@bootlin.com, daniel.vetter@ffwll.ch,
 tvrtko.ursulin@linux.intel.com, jani.nikula@intel.com,
 ville.syrjala@linux.intel.com, Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v2 15/59] dyndbg: hoist classmap-filter-by-modname up to
 ddebug_add_module
Date: Thu, 20 Mar 2025 12:51:53 -0600
Message-ID: <20250320185238.447458-16-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250320185238.447458-1-jim.cromie@gmail.com>
References: <20250320185238.447458-1-jim.cromie@gmail.com>
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
 lib/dynamic_debug.c | 57 ++++++++++++++++++++++++++++-----------------
 1 file changed, 35 insertions(+), 22 deletions(-)

diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index f7ec2365ab40..192783ff7b98 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -1242,30 +1242,34 @@ static const struct proc_ops proc_fops = {
 
 static void ddebug_attach_module_classes(struct ddebug_table *dt, struct _ddebug_info *di)
 {
-	struct ddebug_class_map *cm;
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
+ * scan the named array: @_vec, ref'd from inside @_box, for the
+ * start,len of the sub-array of elements matching on ->mod_name;
+ * remember them in _dst.  Macro depends upon the fields being in both
+ * _box and _dst.
+ * @_i:   caller provided counter var, init'd by macro
+ * @_sp:  cursor into @_vec.
+ * @_box: ptr to a struct with @_vec, num__##@_vec, mod_name fields.
+ * @_vec: name of ref into array[T] of builtin/modular __section data.
+ * @_dst: ptr to struct with @_vec and num__##@_vec fields, both updated.
+ */
+#define dd_mark_vector_subrange(_i, _dst, _sp, _box, _vec) ({	\
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
@@ -1273,6 +1277,8 @@ static void ddebug_attach_module_classes(struct ddebug_table *dt, struct _ddebug
 static int ddebug_add_module(struct _ddebug_info *di, const char *modname)
 {
 	struct ddebug_table *dt;
+	struct ddebug_class_map *cm;
+	int i;
 
 	if (!di->descs.len)
 		return 0;
@@ -1294,6 +1300,13 @@ static int ddebug_add_module(struct _ddebug_info *di, const char *modname)
 	dt->info = *di;
 
 	INIT_LIST_HEAD(&dt->link);
+	/*
+	 * for builtin modules, ddebug_init() insures that the di
+	 * cursor marks just the module's descriptors, but it doesn't
+	 * do so for the builtin class _maps & _users.  find the
+	 * start,len of the vectors by mod_name, save to dt.
+	 */
+	dd_mark_vector_subrange(i, dt, cm, di, maps);
 
 	if (di->maps.len)
 		ddebug_attach_module_classes(dt, di);
-- 
2.49.0

