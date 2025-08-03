Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FA86B191D5
	for <lists+dri-devel@lfdr.de>; Sun,  3 Aug 2025 05:58:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8424B10E4B5;
	Sun,  3 Aug 2025 03:58:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="c0mwkvCd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f172.google.com (mail-il1-f172.google.com
 [209.85.166.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B22A910E4B1;
 Sun,  3 Aug 2025 03:58:54 +0000 (UTC)
Received: by mail-il1-f172.google.com with SMTP id
 e9e14a558f8ab-3e3f449fa6fso30579335ab.3; 
 Sat, 02 Aug 2025 20:58:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754193534; x=1754798334; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=On0sP/gRX6jcjl/izeb41d+iaYm4WT2VrxWSOrwNZ0U=;
 b=c0mwkvCduQzQ+YyKqUEbZlXV9uKstj+299CXo0a+NP9Xig/MC13ANM/jE3asMkQxMj
 NWHUUruRgyOOknJ5ztfL0Xt5Zm3GD+/sFLkf5QNJdaz9nZf7YSp2jm7sLHsibq+I3LsI
 aP4PtRSd+9rbS+lHU+HKs82Fw/UHfWoXAAJFHQPEtPl/VBBvsyGQfM5Kp+bSUx7akOcR
 DrzaDo0uOIylYsfk1zpC0aiE4nJPQYdQ4lkTtGpm6udJ2qNc0ElDKdfy7RhQLlrIrKwc
 sXJj3znGEyb7U/Wj4zZbOtyYoVs8wKsT94e1eCg9ZZBJo4tepfS+q3A7ymGhBiCKALq7
 0SGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754193534; x=1754798334;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=On0sP/gRX6jcjl/izeb41d+iaYm4WT2VrxWSOrwNZ0U=;
 b=xKrDmksucimok8Kp6VXSrW/aluq4GE+YiC/kbgTkhgGpvVb0hmk1tweY4HBKuVc0Sp
 JRjUwpT6HX7kocWOuA4xU6W0WKaq7w/2yYOVUXdJj9Wto4v9Qk24RyF4Lr8DKfLtoIul
 974woMk9wYH6Cv1VikGz0SO7Nm4m8TQ5F2xCB/ekEBLX+Yr3eCRFPOsSev2zcUitQPlb
 gVuZNDM34JRqte9AbJAC/nCFlhom6Qw5I3/MV9pxutYHHJ4A7E6xAHuWIl92Tj4Uwv0n
 SVW9i1/GGR58TgzfIBamxGtqGlDyLI+oyPcbm3aH5U/4rz/JqMzeqA76n8FGMMtQ16Yb
 DINA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU6QgWT8VD5TAIIVBbFR9IrlcDFwRA7mDlcUugkL4vxQYxzEA3GarhwXHHQRV+tzbjA952Jb8DRH+0zHfR5pg==@lists.freedesktop.org,
 AJvYcCUfh2FQ8DwYXcr8hIhHkKPH8bib1r65D6frKBTqAn/tWinbFxiZDXO0nrRymTyLSbc7Zl9U9Uirvj77@lists.freedesktop.org,
 AJvYcCXwtmJPgNJ9raccqkmoVbdAVyXZtcW/XjQVNkhQVR/9ktns80QTqNWYNK3Y3O5F1tr/MeKzgu0L@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxnYuZEgEkm8m+QpRLnLtNf3m2OJKUZxxAd6SMUF3RTgJbYByFq
 7dalr77fdRW0/+Xi7SY3UICSqNa4WVMtH1A/mSjojrBqCUxMSt9Apg+N
X-Gm-Gg: ASbGncuR1Qh/UqFw++zoHbKs5whnW06d1XO6u1s7K2wJEucLCxUuz3qRq8GHL5EnFho
 lYwMEUHJ8sOB1BhLQ0Nl3L3aegHCdEL6yOon/WbnjKiQlkUHKOTf8KTqjMq18RPzOxWtGgO2Rj+
 WEBRLKmy9QZISdDnD6zi3Aw1B7dtjsictV8jHVAZkIIhbUNDp7Cdej4XSdDONH7lbJVWIXv0kuF
 Q/eKORJmG8MSp7ft4Hk7RMiWpT6cdqh5UR/gy5JQwrw/OYDJwjGTo1MYJgNU2Iyk+P3CJIxnPnL
 V8udDfmOl8G/XjwzrveT9J1Tb4s4HI+nG4E0CpFYh15fVrPzst93TUqXItO8Ia/RV+hKd0koKd4
 Qdug7WeLdOQlJF1ddZ19jhySsqBXXJf8OT01bBy3+iuVpKXFATzNDBMA7XOMm8XRVzYXFASkYrw
 BkhA==
X-Google-Smtp-Source: AGHT+IFH+mtyxnkEPDbV4MUz0swiDqyakmO8hLW0D4nl3KXQPrEDdogoDGroqUg609kTHFJlSLTDsA==
X-Received: by 2002:a05:6e02:e:b0:3e3:fd25:f6a with SMTP id
 e9e14a558f8ab-3e41618bf21mr94866305ab.11.1754193533929; 
 Sat, 02 Aug 2025 20:58:53 -0700 (PDT)
Received: from frodo.raven-morpho.ts.net (c-67-165-245-5.hsd1.co.comcast.net.
 [67.165.245.5]) by smtp.googlemail.com with ESMTPSA id
 8926c6da1cb9f-50a55df0940sm2268319173.106.2025.08.02.20.58.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Aug 2025 20:58:53 -0700 (PDT)
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
Subject: [PATCH v4 14/58] dyndbg: hoist classmap-filter-by-modname up to
 ddebug_add_module
Date: Sat,  2 Aug 2025 21:57:32 -0600
Message-ID: <20250803035816.603405-15-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250803035816.603405-1-jim.cromie@gmail.com>
References: <20250803035816.603405-1-jim.cromie@gmail.com>
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
index 53ce282554266..bbbdb8aba0716 100644
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
2.50.1

