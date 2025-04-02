Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70C59A7940B
	for <lists+dri-devel@lfdr.de>; Wed,  2 Apr 2025 19:42:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04AC910E882;
	Wed,  2 Apr 2025 17:42:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Qn1nIFBh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f177.google.com (mail-il1-f177.google.com
 [209.85.166.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1332010E888;
 Wed,  2 Apr 2025 17:42:26 +0000 (UTC)
Received: by mail-il1-f177.google.com with SMTP id
 e9e14a558f8ab-3d6d6d82633so489545ab.0; 
 Wed, 02 Apr 2025 10:42:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1743615745; x=1744220545; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=c83dBzoIbcIM0DNfA5gVIyrKxy+OBEXIBjZPEG9Pdjo=;
 b=Qn1nIFBhgv+lBXQgCI34cdH8eO30+ViuDZFozjEtiDyUaVWpojH6jdYVuwi9ARhG0Z
 Vj8o6h6cQQIINSTeiibgXg5bmb4Lztk777/MgrEGkokKkiqML+QGB0a8z69Q44uM3/5+
 XfXMOEn9M7umzBW6EsPiozjQqQIYqKbYszi6h43BTIIbjOhd4q0N7cPp643BlZULfW1b
 UR+8T0oJt5RtibDngUrsUGkn8gY+P2BPRWF4NdOhbnEsLyZlWR7W1qkzrAcD7PUQCWVa
 1YqCi3WJ8N/djRnHWBtSuodVuwvII+1WrGdDGA5lMSa/u3VIf5AXvKdj9s2DF7yGPUnw
 MJNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743615745; x=1744220545;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=c83dBzoIbcIM0DNfA5gVIyrKxy+OBEXIBjZPEG9Pdjo=;
 b=aMdbKKWm0fPby2wHuu5SHsf5Ul3uESg8YD6ewlljlQ3+mV9h6LaRhBEIHuxTNU71TM
 w3ScQvtaCCFf4l9WJ9DZZOlOrXIy4TqS5/bt57WknKyeGFfRZktEhh04k1l7IzrgLKEx
 1sbFPwDd0IsXyDzrlJRQ00pISYjd+c29zBbgwnNcbmPrvVBFMtzhVklTpzchU1ghTk4k
 cmFybYfqJiJBtAAy6N4lA+Kl/Y0ajgucSDMBPH55OR2VzsNAdU48455tDFIxJvhAMTfO
 kA+XFLD2KMLjVKNgrYznNamWQ0pj/7d9PWI2fy9bdZ0H0UKiHaaGY1r4eII/S8j21Wko
 Lizw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUob73jBe/JbYz5tRX/3MMxHKeQXtc2UlddXSlgQdB7QNJJKFUi8+pxuYepqR5e4ELhiYZnkYYOackM@lists.freedesktop.org,
 AJvYcCVaJbxc//lY7VDOfbtJsatdI3APkEems5mhLZWrgbCeAYaZ/9a6Yc1zwgqTHrdpVw8RnkkiHbWKkoxBguUQ2w==@lists.freedesktop.org,
 AJvYcCWmBXMcYxzPWL1vkC8tePlIM/6u7UBnC4iAaR8DfJPP1dIqAnxnGOKnfrvVC+HGIDDUmBNJv7Yz@lists.freedesktop.org
X-Gm-Message-State: AOJu0YysvAc0VsjkZCBKjTImI3uyn6qoKeSicTv9KtA21dCXgosjSx5v
 FVpPr5SUO7HBuJuo5REh5cQzbk36WNkWk259BRHMFeihRaW3RxyY
X-Gm-Gg: ASbGnct8c8k7GesgKdOL8xtTl0ETs3EKz20XCOqt+qNLkudungmIXoeYM50rnQWudM3
 OhbaAeDETLyxcur3PfEvzFR10NtWXN0dev++ZEoBdlZDuRiD1hrM6OCN4PE5NiZ3otn2sBJ7I/M
 ouarTRpBWoSElbUbgsCnhuvWcZKGHS+oCrbq8mn4wMyaVt0lj7tZgjWuSGVtfTsxuXIz6TBTfnB
 mWW8+VimYSGvB86kLu1hFeAJi8aiKRu79WYpAs2xbGHxY/s9Jybo5xLwurIJ4CsHljlc5BevZcD
 tYdv9F+dqIfQiW5SIiDBMjLaa3tJNnURnIfjKLr28XegIJXFLnrNtqB6gVe4GCkS63Mc3OwGnZ8
 57w==
X-Google-Smtp-Source: AGHT+IG4VkEFZ5GxM5DWtdCptwmL6vD+yFvCbb5TkjAwVoCHsiKcA6mXmOduxT46XIJtI0tZSFL2lA==
X-Received: by 2002:a05:6e02:1848:b0:3d0:443d:a5c3 with SMTP id
 e9e14a558f8ab-3d6d546a3e6mr38861015ab.3.1743615745299; 
 Wed, 02 Apr 2025 10:42:25 -0700 (PDT)
Received: from gandalf.. (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
 by smtp.googlemail.com with ESMTPSA id
 e9e14a558f8ab-3d5d5af8369sm33439725ab.71.2025.04.02.10.42.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Apr 2025 10:42:24 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, gregkh@linuxfoundation.org, ukaszb@chromium.org,
 louis.chauvet@bootlin.com, linux-kernel@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 daniel.vetter@ffwll.ch, tvrtko.ursulin@linux.intel.com,
 jani.nikula@intel.com, ville.syrjala@linux.intel.com,
 Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v3 12/54] dyndbg: macrofy a 2-index for-loop pattern
Date: Wed,  2 Apr 2025 11:41:14 -0600
Message-ID: <20250402174156.1246171-13-jim.cromie@gmail.com>
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

dynamic-debug has several __sections, each with <vecname>,
num_<vecname>, and it iterates over these with a 2-index for-loop.
These loops are fiddly with the 2 names.

We have only 2 such loops now, but are getting more soon; lets
embed/abstract the fiddlyness in the for_subvec() macro, and avoid
repeating it going forward.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 lib/dynamic_debug.c | 20 +++++++++++++++++---
 1 file changed, 17 insertions(+), 3 deletions(-)

diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index 85b8d32742ec..253eaf0a9bd6 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -128,6 +128,21 @@ do {								\
 #define v3pr_info(fmt, ...)	vnpr_info(3, fmt, ##__VA_ARGS__)
 #define v4pr_info(fmt, ...)	vnpr_info(4, fmt, ##__VA_ARGS__)
 
+
+/*
+ * simplify a repeated for-loop pattern walking N steps in a T _vec
+ * member inside a struct _box.  It expects int i and T *_sp to be
+ * declared in the caller.
+ * @_i:  caller provided counter.
+ * @_sp: cursor into _vec, to examine each item.
+ * @_box: ptr to a struct containing @_vec member
+ * @_vec: name of a sub-struct member in _box, with array-ref and length
+ */
+#define for_subvec(_i, _sp, _box, _vec)				       \
+	for ((_i) = 0, (_sp) = (_box)->_vec;			       \
+	     (_i) < (_box)->num_##_vec;				       \
+	     (_i)++, (_sp)++)
+
 static void vpr_info_dq(const struct ddebug_query *query, const char *msg)
 {
 	/* trim any trailing newlines */
@@ -155,7 +170,7 @@ static struct ddebug_class_map *ddebug_find_valid_class(struct ddebug_table cons
 	struct ddebug_class_map *map;
 	int i, idx;
 
-	for (map = dt->classes, i = 0; i < dt->num_classes; i++, map++) {
+	for_subvec(i, map, dt, classes) {
 		idx = match_string(map->class_names, map->length, class_string);
 		if (idx >= 0) {
 			*class_id = idx + map->base;
@@ -1220,8 +1235,7 @@ static void ddebug_attach_module_classes(struct ddebug_table *dt, struct _ddebug
 	 * the builtin/modular classmap vector/section.  Save the start
 	 * and length of the subrange at its edges.
 	 */
-	for (cm = di->classes, i = 0; i < di->num_classes; i++, cm++) {
-
+	for_subvec(i, cm, di, classes) {
 		if (!strcmp(cm->mod_name, dt->mod_name)) {
 			if (!nc) {
 				v2pr_info("start subrange, class[%d]: module:%s base:%d len:%d ty:%d\n",
-- 
2.49.0

