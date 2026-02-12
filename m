Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mJy+KmkbjWm/zAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 12 Feb 2026 01:14:33 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CD211287BF
	for <lists+dri-devel@lfdr.de>; Thu, 12 Feb 2026 01:14:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B9CA10E674;
	Thu, 12 Feb 2026 00:14:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Y88Dfatx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com
 [209.85.160.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 903E210E678
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Feb 2026 00:14:29 +0000 (UTC)
Received: by mail-oa1-f44.google.com with SMTP id
 586e51a60fabf-408199852c5so2033850fac.0
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Feb 2026 16:14:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770855268; x=1771460068; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZwWG2viWBqZNBrC1b0Wdlv+2CQ41m1aVisRlPqYPYL8=;
 b=Y88Dfatx7EhLUvDNjL1047h5B8aSUkHQLm7js3c+HoASciQ2s8lUlY98lkyHUAhQmB
 5Dbw/0HUyvPtlMPTA50CcXJs9nbCa2MdsVO1qV3OwBAO4h3tpIqGVv5+6OR1IMaxhOKX
 IPgUPvQLbXqvybSVRkOxlK3hdWuTC4z2DZbDx3HugpozZlk+nTbVmYyreNkEWCwTvZNS
 e4civx2j61zjfZ67uT7PqBPXDTlILhuIY1tO/uq7cbRKEDYUgHeNKx8gqB6gpMULM6Da
 4FDAdaAu61NqxPE1FHHwrADXiPmY+pLCFndPwQCPmFRjiCRZZ2zlzBryVOpX7RbHsohD
 mSJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770855268; x=1771460068;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=ZwWG2viWBqZNBrC1b0Wdlv+2CQ41m1aVisRlPqYPYL8=;
 b=wBZjTbJLBGUDnU4NL1lNNZoYEBvYatVvEqo3Q8w4ullhbrUTgO1MMFL7vMUwRjcztx
 t2lx0PmfR7tOavu+4417yzK7ur5/ioMRw24+BVN8XzGculfBmkjrGOQngIQRF80bf6Ez
 ZAGBL8yjA6VbEaAKMYBOsCjdYckgXOgoDHJI1nMcEOi7DDE6KOqMezpjo4fPibiLfAh0
 OdM3efEWXpDIMjOvHCIZr1ku8UF4g6e09uCuTIQpKFhVH2c/UTb2U1nu2e3LvnLdjD+d
 rqnS1W561CROPLFCyj1jPbPi5F+bd0MqNjM2x6/4HfscWk5TRdPy2UwB98tnbMSlN58T
 CScg==
X-Gm-Message-State: AOJu0YwzwzKyIbWTAgfmgeUAh/ZaIAgss6WxCHpBK++ftHCKFx0wJEJr
 eJ2vBg/K0dGWkYnmXDYol1Kwi8GUkUtk3xgucBlhF1NtK/MOb5LUMmlBlmWtjA==
X-Gm-Gg: AZuq6aK91YJLMF5IZyD1V4ISpRdOofzBr58cS9vzn3qSYKhoIL0fxiB+uXMj/qGIBHT
 8byiIAx6BXx2luFexxFXG/jsAh3vWq99QvrT2yLxFKemdwNXQqZWNQS+8xjtgdVa3JEVjwZg+mh
 28qoR1QDgFF9hdwcIeICTrlK1NU0WIFIxIeV2kfTWSf+JrbttwKtvkWKf/apU73vTK902fw3kZO
 YWw83e5gizqZcNTgW5uMvZleP9yYIgiv2PFZCBxaXWw9tqxoe7gsI7YZbthvxtzp+hduyk8NFGG
 rNKPHcWAYfbyDGHcYGCN54GSVsdsxxlk+rEVQteRLEloZ8ba/4XPsR/zx3GMTOccNd/d9DrZ4q2
 4F2Q3RNsXbcZHMV6q3zGazD3FXd3ITsxWD0NwL/vMqKgGdjF+fkgaSZql51XeFR0JncUfb9uvJZ
 C7aWbvDmOn/L6WnJJ187TaTfpjCFU97i1dV667EXWLS0bEcr5y95hg
X-Received: by 2002:a05:6870:148a:b0:40a:65ee:d307 with SMTP id
 586e51a60fabf-40eca0728a8mr293049fac.26.1770855268596; 
 Wed, 11 Feb 2026 16:14:28 -0800 (PST)
Received: from godzilla (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
 by smtp.googlemail.com with ESMTPSA id
 586e51a60fabf-40eaf1062ffsm2331939fac.13.2026.02.11.16.14.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Feb 2026 16:14:27 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: dri-devel@lists.freedesktop.org,
	intel-gfx-trybot@lists.freedesktop.org
Cc: Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH 15/61] dyndbg: macrofy a 2-index for-loop pattern
Date: Wed, 11 Feb 2026 17:13:10 -0700
Message-ID: <20260212001359.97296-16-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260212001359.97296-15-jim.cromie@gmail.com>
References: <20260212001359.97296-1-jim.cromie@gmail.com>
 <20260212001359.97296-2-jim.cromie@gmail.com>
 <20260212001359.97296-3-jim.cromie@gmail.com>
 <20260212001359.97296-4-jim.cromie@gmail.com>
 <20260212001359.97296-5-jim.cromie@gmail.com>
 <20260212001359.97296-6-jim.cromie@gmail.com>
 <20260212001359.97296-7-jim.cromie@gmail.com>
 <20260212001359.97296-8-jim.cromie@gmail.com>
 <20260212001359.97296-9-jim.cromie@gmail.com>
 <20260212001359.97296-10-jim.cromie@gmail.com>
 <20260212001359.97296-11-jim.cromie@gmail.com>
 <20260212001359.97296-12-jim.cromie@gmail.com>
 <20260212001359.97296-13-jim.cromie@gmail.com>
 <20260212001359.97296-14-jim.cromie@gmail.com>
 <20260212001359.97296-15-jim.cromie@gmail.com>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[jimcromie@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_THREE(0.00)[3];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 5CD211287BF
X-Rspamd-Action: no action

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
index 7029c9c4bfbf..aed197f879f5 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -129,6 +129,28 @@ do {								\
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
@@ -156,7 +178,7 @@ static struct ddebug_class_map *ddebug_find_valid_class(struct ddebug_table cons
 	struct ddebug_class_map *map;
 	int i, idx;
 
-	for (map = dt->classes, i = 0; i < dt->num_classes; i++, map++) {
+	for_subvec(i, map, dt, classes) {
 		idx = match_string(map->class_names, map->length, class_string);
 		if (idx >= 0) {
 			*class_id = idx + map->base;
@@ -1232,8 +1254,7 @@ static void ddebug_attach_module_classes(struct ddebug_table *dt, struct _ddebug
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
2.53.0

