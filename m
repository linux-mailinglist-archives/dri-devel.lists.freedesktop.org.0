Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E02CD1C045
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jan 2026 02:59:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7884710E5AC;
	Wed, 14 Jan 2026 01:59:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="cnOOo7O0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com
 [209.85.210.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 953FB10E5AD
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jan 2026 01:59:40 +0000 (UTC)
Received: by mail-ot1-f52.google.com with SMTP id
 46e09a7af769-7c95936e43cso3184915a34.0
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 17:59:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768355980; x=1768960780; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BxdE6+GTYqwM0IzjlMegZ9h6k5RpMRRS5FRcIzbLHHk=;
 b=cnOOo7O0h9AVvqcGMIWMUoJ3gTpL5Wr6pUtm8MxOhkt3DIX7RncahKOW3lkmExu/Kb
 VAZHhNSca1ftd+Aqokfm5Z8oc/aYJh9x/EOqL4tx1dLrhIQ3REPlZZ99VN7zmH7vA2LQ
 2BzFgPh4M6aS+scZDUNRuYQjCLYrD9G0BpCRZR6KjVPOExpqu+6OL+IqKphsmJyj3VyY
 HdVgAYvabJuD8JHw7je1HA/aTJwDNMwTsafJ6Di8ykXuHnbMFbSrHNNHxtMc1oWy0Be+
 pm3YB4RbyoW0VBURIBiwARL/81OtpsimaHCR7xFnoBBJeAxJijT/uDXBtXODtF0/X0QE
 fqpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768355980; x=1768960780;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=BxdE6+GTYqwM0IzjlMegZ9h6k5RpMRRS5FRcIzbLHHk=;
 b=wu5/qZWs8nzy/B81cmpeRFhQ11AsKZuvinfZDlD8qW7DvR0BnvP50M186vITZ22kym
 rOT68oYLw04m/+fgFK29x6iw7bKtHTTMQnT2mpZ2EfzJ9G0+R+Ir83++Zgy+JT5VnfM4
 gucwKwi8pHPL+WLF500YwkbSuMXV4UgCMmo//l/hdFveS613rUElmDkFHRb/OasBmPG6
 eMLrdC1joR9KKq5UjmzrQ8FYOUDPjMEt+lBtcIlyh955Ygll4yNZCYqb4d4xlVUUmrjQ
 jLdgWfZNn4XVxFBdBryXUVcz+WkFoW/fHi7+T7SHcaa5LdWpXkrmiUd25bW9gINcYitB
 iXhA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWAZoGUQSv2UOhCSbFSNV5mLjqQZbt/nY0SNVUi1zzFBFfzGsjanLdBaVvx61I/xoCIx8tQzvzQzFk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YytLnxUwhfqOMddQS9dfTPQWmtzmzc34qwxhvKFLCBo2mHD7vxb
 4iwQtbNYZRZpgzZNl+b2wjKtIhpRblhYzFG70a2ROI3CX59U5u+XfbKJ
X-Gm-Gg: AY/fxX7d+e8NGIFoIVC0lqQaT9tqbsd+LJM4n1wBcdyP27+Ff9cXObnHJCDcZfbGyUT
 YKwm2RR1ofa4Zolh9hpVPt0N8nPFzJ0LTa0T6K3/4V3Kpl9gZZND9D0lemcf6TF3cnOz2lLKHgw
 FTt5xBMtxlTXcosKOxi0FtYrbjtmk40AppaQY77BnDH4WthLNjLQdXudxxEUg6E9Yt5G2TroGFU
 1ALrEMOgOtnYzRvmc6PIRurPvQTQAieN1/39GCVtdmJKbGY1RsVd8D/LfIORF37Bs+tyBf0/QR5
 0jSQVWCjatk1D3mlJ4m+R7nPyr0SoNcPlpTxL7kjhNgAUZmB2p0l1Fz5wC8MFSDbiVkFrDEuChk
 v8Q5WHDXx44sOHOdl6iMVUX2AHI9qmAEFVtEokJt2zwRzPCC6y2YUtPhPEd4JcMip8LpvjOxhjY
 5WZwM/Ae1rTdP1cWxqB9QHNzQU2gr0mEO8v1vg
X-Received: by 2002:a05:6830:6a14:b0:7bc:626c:3b30 with SMTP id
 46e09a7af769-7cfc8b69bdcmr827161a34.26.1768355979852; 
 Tue, 13 Jan 2026 17:59:39 -0800 (PST)
Received: from frodo (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
 by smtp.googlemail.com with ESMTPSA id
 46e09a7af769-7ce47802966sm16830435a34.4.2026.01.13.17.59.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jan 2026 17:59:39 -0800 (PST)
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
Subject: [PATCH v8 14/31] dyndbg: macrofy a 2-index for-loop pattern
Date: Tue, 13 Jan 2026 18:57:30 -0700
Message-ID: <20260114015815.1565725-15-jim.cromie@gmail.com>
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
2.52.0

