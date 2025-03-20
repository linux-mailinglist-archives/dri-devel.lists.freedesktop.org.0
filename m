Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 650FEA6AD79
	for <lists+dri-devel@lfdr.de>; Thu, 20 Mar 2025 19:53:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A607310E6D4;
	Thu, 20 Mar 2025 18:53:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="JOFXjl4t";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f52.google.com (mail-io1-f52.google.com
 [209.85.166.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36E5E10E6AD;
 Thu, 20 Mar 2025 18:53:15 +0000 (UTC)
Received: by mail-io1-f52.google.com with SMTP id
 ca18e2360f4ac-85dac9728cdso28590439f.0; 
 Thu, 20 Mar 2025 11:53:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742496794; x=1743101594; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ur6z9vuL/Wl0h5x6aY6sqJ81bhBxaoHzCCJFlunb8r4=;
 b=JOFXjl4twfXpjaQKJmqJj5obGxyCsaP9G0e4ejc4pqaH7rSFi1Eo3Pp1b4HTp8hNTw
 VfcY2mi+vRlNqkjq3iGOEgs+Ca4liwrh5h8bJw3gOpifXKXtGzQpekchoyT9sRqJinGT
 a3PsRaPzGulYfvAPDDXMLCrewtXFvVSX4YFmJUyWQXlA5huwgZOAXx+ugB/w9r4A12SQ
 6oHZo64LHoOFPa/XxG04b/dD7ujQwfF5NkCx9nCv81yU8AEnBjw2U2+sXI8VrQgzrXED
 aGXbdqQSl4egEjAhWSPKyuygRZ5Ha2Lp/00XL4RxLKNqqzl24Hc/HHD1wfGU4st5vzwm
 DtJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742496794; x=1743101594;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ur6z9vuL/Wl0h5x6aY6sqJ81bhBxaoHzCCJFlunb8r4=;
 b=NxrhOPpMUeDqRJGlVfuv9u6w+CbCMsXK/F8SG9cxwokPPOs4QDjmQ7geYxV1nFv6NU
 NT4z89cFRmTmnFbo9zON0PYQkCjnnA6exCG2+AWINkKGltpZ146uMRl0QfRdGPievOYy
 833hYRIyTFtdfvLAUs2k6vVxXMurdbAJKRMv64mRIt5oYu0Tn+F2ZARRDJVafRBVFwJg
 BJGtgwQRDsvPaDtZESPmUpsbVu36o8n9g3Sr+o9t2wH8OZzA6gmUVBo8FxrU2Nf1myGg
 mv2Pz6MUQHUk4G6sEKU0wFX09RRD2wp8USXQvr3y55ncQ5AnnBRhRIhPAyylXb0cpRlA
 OA/g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUH8GsCMt3p8cX8A00oyh7G+wYDnml2lE/2EQBXlQx3IwEy93cAnrG5MYwnFRDSclXjVzIK0K/7LJc+@lists.freedesktop.org,
 AJvYcCUaSTSlCkE51PPizuWbTl7FdAPxoKzGRG4Sm8cTj9jacNO7hC09yklPZ2pMcM33VG+H7SdQdkqhPDz9UfLWsw==@lists.freedesktop.org,
 AJvYcCVLebMOFJKWU+JHkhAGR7PACP8RgcB1yMXz+3RMMeL77Mf1GaRRkJ5mdIzh8ihC6d9wvx3kx+mUwtkp@lists.freedesktop.org,
 AJvYcCWpWfkg8KwuprAQNXplR5s4MwgjhYzvvvFJwfWKTs/9oZCNjom8431O+qoV3xQ3er9juBBoBlecsUI8Vhrffb97aQ==@lists.freedesktop.org,
 AJvYcCX4sBo52Eop2sZLk8M2bVBbV6XMWQoo+x3MKP3NZYENGBFECffJYRqCaXSwxQ0GmbnRcC3OaWae@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxt7QG1PH9wEkO93e9D35UM6hQw9GKz6/GL82Ch6fyBkD2RS6bp
 CxQ5JyRAhVC25zrPgRTJdBzkn7syH1OswF6TxVnPewmjibv2ERvH
X-Gm-Gg: ASbGncviCCNTBCCxk0uesEew2zHgcpbM5LimICeSxu97+yfMRq67D8QZ/BG/zfuaL/5
 5D9xslN4rtBgpljy6RKP3t6KlTh0bWS+zj9V2sKdz++4G5qjMge0PjmFC0u9+FW2YVLB8aLvU9o
 oKKIJSnjKMdCe486Zmb+EMi7JaJ70hOiVaqFGktdNFqCLM2KxPrb2MElmW2qvhqz99hWJCVFEdH
 gJUxngpNTeymgC//hFd+4R+U3XjDqOWmMILX+NmwIgR1uCL9dmy/DAA0VsCQ4TdR1HuVyYxl9vk
 lqiqsWYxcQ5qQjCqD3Eq9bPh0A9XbGj9kRIj9rWFCnm71yTSiLKjgxttNllNfbS6KLjeMtdrP/Y
 NVg==
X-Google-Smtp-Source: AGHT+IESYenQHMzRBHYonFjmp7r3ksmfWrw+L2hl6Qv939KfXIhSdVM5EOYoDB82ETAAu/GcYHzYNA==
X-Received: by 2002:a05:6602:488b:b0:85e:1879:c708 with SMTP id
 ca18e2360f4ac-85e2ca388bbmr48518039f.1.1742496794435; 
 Thu, 20 Mar 2025 11:53:14 -0700 (PDT)
Received: from gandalf.. (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
 by smtp.googlemail.com with ESMTPSA id
 ca18e2360f4ac-85e2bc273e7sm7078039f.17.2025.03.20.11.53.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Mar 2025 11:53:13 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-gfx-trybot@lists.freedesktop.org
Cc: jbaron@akamai.com, gregkh@linuxfoundation.org, ukaszb@chromium.org,
 louis.chauvet@bootlin.com, daniel.vetter@ffwll.ch,
 tvrtko.ursulin@linux.intel.com, jani.nikula@intel.com,
 ville.syrjala@linux.intel.com, Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v2 11/59] dyndbg: macrofy a 2-index for-loop pattern
Date: Thu, 20 Mar 2025 12:51:49 -0600
Message-ID: <20250320185238.447458-12-jim.cromie@gmail.com>
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

dynamic-debug has several __sections, each with <vecname>,
num_<vecname>, and it iterates over these with a 2-index for-loop.
These loops are fiddly with the 2 names.

We have only 2 such loops now, but are getting more soon; lets
embed/abstract the fiddlyness in the for_subvec() macro, and avoid
repeating it going forward.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 lib/dynamic_debug.c | 20 +++++++++++++++++---
 1 file changed, 17 insertions(+), 3 deletions(-)

diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index d5572712ce55..94f6c8fd787b 100644
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
@@ -156,7 +171,7 @@ static struct ddebug_class_map *ddebug_find_valid_class(struct ddebug_table cons
 	struct ddebug_class_map *map;
 	int i, idx;
 
-	for (map = dt->classes, i = 0; i < dt->num_classes; i++, map++) {
+	for_subvec(i, map, dt, classes) {
 		idx = match_string(map->class_names, map->length, class_string);
 		if (idx >= 0) {
 			*class_id = idx + map->base;
@@ -1221,8 +1236,7 @@ static void ddebug_attach_module_classes(struct ddebug_table *dt, struct _ddebug
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

