Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8060BC6B900
	for <lists+dri-devel@lfdr.de>; Tue, 18 Nov 2025 21:19:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E39A810E525;
	Tue, 18 Nov 2025 20:19:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="iH1VRGBX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f42.google.com (mail-io1-f42.google.com
 [209.85.166.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD44A10E51C
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 20:19:16 +0000 (UTC)
Received: by mail-io1-f42.google.com with SMTP id
 ca18e2360f4ac-9490c3ac6ebso74894439f.2
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 12:19:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763497156; x=1764101956; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Mom9p3QYL/HEnLm12XjQXHk1KtSfULxrp3u8JPNUlAU=;
 b=iH1VRGBXz4TJj7fSRfoXPhe1osmlJLi5Oyyi99AfkTYSHeiTwL1+mR/RW47mfCCVFe
 eVtoiixuzIAB5r9+L2LW1b+PXnl/xRAcuL591Q6ETVwhmZqf6x7JsWSWcwJuis47YnWy
 j67GSC/QQfIQZNYP9OgbObncKZxKWC58kIqIjoZTXf3PBT3jE0JyS4zF0vv4hrT9pNqR
 MHBQfDG2mJNdnimYVwzTHX30hsPMsmBzrno8W3JFKzlgMdKzS/wDFcD8pamXNTi1dXX4
 FX20s/qkjH0Wb19UN3w2MVDeR3F0QD4iIY43yUbx7GBuBMJEyqVXBpqOU/7gwjaHKbq/
 /Y9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763497156; x=1764101956;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Mom9p3QYL/HEnLm12XjQXHk1KtSfULxrp3u8JPNUlAU=;
 b=ki+d/KN2eO3gn+mBzccGp/3J0fqaybzMw0trwxvGVPPlUHi2zaJrFgzx8XHjFeI0kS
 5eg5zoEIzIt7E5dzi7kX3GaApElUWsZFMLtYYn8XUQISULCqeUtYDoAHQgfzFYwf4iSX
 hWKUK6PWMbu86VTLxYenzRBte08Q/uX2exJ8j0BRqCoOIl7/8p10sOXrj5q2WguxXtwj
 uEFMSRnxZzLmhwruwUZM3FGn0QpHP6k765qgU/TCxv2APLFmVrDlW1V35oL6pBlLcJyS
 HJ3znXp/wexvFrj2/BUgOEmT8+d3JMk9TCyVdbt03kaMM9yFR6LD8NqXX8xz/1F3XO6t
 yFoA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU1CxJhv0AJMTXlnqx7iUPBAP3qCZSH71140/FytnH0ZcgQBQwp7LmyzKekXA+LKGrishBbj8wRCL0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwMY5dL1BSYYmVW8GvuGAreb/pfJix7SYfZuhPiJpPmCMkV5xHb
 DblRp5lXRAVBcWCjdtjw0fFh9b3Ga3knultX/QxlJh0xL/u7umGYXIOo
X-Gm-Gg: ASbGncs35oz+5jgLxmRHMS5zRKatBB2RXaPPBCpQ3OVaLPgsFiVx1MjGE/ulXRrxR+r
 jdjRanL+/JsaaXExI1T/NUA/Q3bEfB7SZ2DMyvPRKZnISnEFo4kkifYYS9xvVIcJT0G8f7CzpRI
 hHyCqn97DfUCABWnGTPVWW/G9WzRMLPE863qyEhp2yZVF3Byr/z1Hi76SWBJYiizlDYVLGfoeTI
 Aj9w2j5pSErjiegO2xrio8gyZBEn47IcnC/bOwWTKdEJQ1BtgnZQfuRi1MpnDzzp2CycKoq5sa6
 21LxZEBQAaF7FO1b7mxxrGVTB1gfjwjpkaztftXMLNhw+11bfASASTpmKSxUWa5a/we3iHzN3EA
 BGnqTk5aNN3NFmmi+i9y0owS4xoFVWVZlSU7of38wztwYV1dlTD/KBchG7Fr+Zv/wSnVJRr/EyK
 FyXDTFIixzG33eseqwe3gRa2p/OQmez0YQwEQr6IErhcaK5mfuZO1KycyD1Ic2HNvxU2c=
X-Google-Smtp-Source: AGHT+IF9qxBwV/U/VSjF667XqOPS3S0CMKNPPtG91ifTzUkTzfrgNjJ7HC4VQQdW5SFo4/2/ImAGSw==
X-Received: by 2002:a05:6602:1344:b0:945:a1fc:a7a5 with SMTP id
 ca18e2360f4ac-948e0defd6amr1887003939f.11.1763497156071; 
 Tue, 18 Nov 2025 12:19:16 -0800 (PST)
Received: from godzilla.raven-morpho.ts.net
 (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
 by smtp.googlemail.com with ESMTPSA id
 ca18e2360f4ac-948fd4c273bsm419823939f.18.2025.11.18.12.19.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Nov 2025 12:19:15 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 gregkh@linuxfoundation.org, jbaron@akamai.com
Cc: ukaszb@chromium.org, louis.chauvet@bootlin.com,
 Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v6 14/31] dyndbg: macrofy a 2-index for-loop pattern
Date: Tue, 18 Nov 2025 13:18:24 -0700
Message-ID: <20251118201842.1447666-15-jim.cromie@gmail.com>
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

dynamic-debug currently has 2 __sections (__dyndbg, __dyndb_classes),
struct _ddebug_info keeps track of them both, with 2 members each:
_vec and _vec#_len.

We need to loop over these sections, with index and record pointer,
making ref to both _vec and _vec_len.  This is already fiddly and
error-prone, and will get worse as we add a 3rd section.

Lets instead embed/abstract the fiddly-ness in the `for_subvec()`
macro, and avoid repeating it going forward.

This is a for-loop macro expander, so it syntactically expects to
precede either a single statement or a { block } of them, and the
usual typeof or do-while-0 tricks are unavailable to fix the
multiple-expansion warning.

The macro needs a lot from its caller: it needs 2 local vars, 1 of
which is a ref to a contained struct with named members.  To support
these requirements, add:

1. __ASSERT_IS_LVALUE(_X):
   ie: ((void)sizeof((void)0, &(x)))

2. __ASSERT_HAS_VEC_MEMBERS(_X, _Y):
   compile-time check that the _Y "vector" exists
   ie: _X->_Y and _X->num##_Y are lvalues.

The for_subvec() macro then invokes these before the for-loop itself;
they disappear at runtime.  They do cause a "complex macro" CHECK from
checkpatch --strict.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>

---
-v5+
  add __ASSERT_*() macros
  add then drop __chkp_no_side_effects() macro
  due to changes v5+ drop Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>

this patch evokes these complaints,
the "reuses" are all lvalues, so not issues.
(vec) is incompatible with ## paste-up
do-while also wont work here.

CHECK: Macro argument '_vec' may be better as '(_vec)' to avoid precedence issues
WARNING: Non-declarative macros with multiple statements should be enclosed in a do - while loop
CHECK: Macro argument reuse '_i' - possible side-effects?
CHECK: Macro argument reuse '_sp' - possible side-effects?
CHECK: Macro argument reuse '_box' - possible side-effects?
CHECK: Macro argument reuse '_vec' - possible side-effects?
---
 lib/dynamic_debug.c | 27 ++++++++++++++++++++++++---
 1 file changed, 24 insertions(+), 3 deletions(-)

diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index e882e951d585..94d05d09a128 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -128,6 +128,28 @@ do {								\
 #define v3pr_info(fmt, ...)	vnpr_info(3, fmt, ##__VA_ARGS__)
 #define v4pr_info(fmt, ...)	vnpr_info(4, fmt, ##__VA_ARGS__)
 
+/*
+ * simplify a repeated for-loop pattern walking N steps in a T _vec
+ * member inside a struct _box.  It expects int i and T *_sp to be
+ * declared in the caller.
+ * @_i:  caller provided counter.
+ * @_sp: cursor into _vec, to examine each item.
+ * @_box: ptr to a struct containing @_vec member
+ * @_vec: name of a member in @_box
+ */
+#define __ASSERT_IS_LVALUE(x) ((void)sizeof((void)0, &(x)))
+#define __ASSERT_HAS_VEC_MEMBER(_box, _vec) ({	\
+	(void)sizeof((_box)->_vec);		\
+	(void)sizeof((_box)->num_##_vec);	\
+})
+#define for_subvec(_i, _sp, _box, _vec)			\
+	__ASSERT_IS_LVALUE(_i);				\
+	__ASSERT_IS_LVALUE(_sp);			\
+	__ASSERT_HAS_VEC_MEMBER(_box, _vec);		\
+	for ((_i) = 0, (_sp) = (_box)->_vec;		\
+	     (_i) < (_box)->num_##_vec;			\
+	     (_i)++, (_sp)++)
+
 static void vpr_info_dq(const struct ddebug_query *query, const char *msg)
 {
 	/* trim any trailing newlines */
@@ -155,7 +177,7 @@ static struct ddebug_class_map *ddebug_find_valid_class(struct ddebug_table cons
 	struct ddebug_class_map *map;
 	int i, idx;
 
-	for (map = dt->classes, i = 0; i < dt->num_classes; i++, map++) {
+	for_subvec(i, map, dt, classes) {
 		idx = match_string(map->class_names, map->length, class_string);
 		if (idx >= 0) {
 			*class_id = idx + map->base;
@@ -1231,8 +1253,7 @@ static void ddebug_attach_module_classes(struct ddebug_table *dt, struct _ddebug
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
2.51.1

