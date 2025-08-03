Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B58FB191D1
	for <lists+dri-devel@lfdr.de>; Sun,  3 Aug 2025 05:58:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEA1E10E4AE;
	Sun,  3 Aug 2025 03:58:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="WFEmtTfX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f178.google.com (mail-il1-f178.google.com
 [209.85.166.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1EF410E4B2;
 Sun,  3 Aug 2025 03:58:51 +0000 (UTC)
Received: by mail-il1-f178.google.com with SMTP id
 e9e14a558f8ab-3e3e926fdeaso12248215ab.1; 
 Sat, 02 Aug 2025 20:58:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754193531; x=1754798331; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1JCLCVuCy1Iq9Gw35PtEgUXRGWUdACaICRLzJa5akkQ=;
 b=WFEmtTfXLyutBznVKdPW/YCr846CGP+iWIa0NExplO1lqlaHMEASu3ZVvdcPiKcVBk
 LOXngOlfr7BRjv2ZSXq7qbSP6oSG8n+WrpZ7pFMU3+bf43gkKendHYkQl/YPiVX0fK/U
 xtxd/xEfjlWJJbXMgBLLJN0HZ6UEWfdBfWfuTBpAp//OIVB7WhObH87TnImHgR3I/KcP
 QyF+sskfRpD+g8uaCdELCoL9/X6ADPKNcKMdy9i/v494+GgJv5QlHaNw/s6TU3rAVAfR
 fr2x+WKw63Tb8cnSiVAsWbUfwM6z3YTF6S4XhxujHZJNHSeccUUkVOGstl0FdhIboo4C
 NSlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754193531; x=1754798331;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1JCLCVuCy1Iq9Gw35PtEgUXRGWUdACaICRLzJa5akkQ=;
 b=jlBNHAi8wgXul3vuLcZnagxwtsYpmZKR90Q3wEgsAseqr5pYWjyPUi4OMEbBJOnp0c
 dw+DB3/nYS2+PylZq0f/KubiR0d99Pndbgb7gsrepEf8FhB9O8k6GBLNinC8bKkU+PaE
 MFWDZqwSToJqTeZyPLO4pm6IdOmTwEofjGeTAbn5gydFQ6p+posezSOmNAcAcEig17be
 Wr3CfmSWqn2sXEn8W41LdEx0llzztPIP+naYpcaLct4Wj9KYJIFprvg8EiGnVzHt5Xt1
 INA4kphAd23AajyujOFJX5eL93kcxBbhQeycs3KwNtUpX3o05gC8GBaxdUVXnVSeLTOn
 Q7Fg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVFikGs2YeITCWilyuRyNsUnkVvfpDGRbXF7ahINqNfts0uNQrvcTxzFUv6RF2if7tswggKTsf3sbc1OPQB1g==@lists.freedesktop.org,
 AJvYcCW3DA/1bUN/Hh6Z1OrXtTplZ8G9SGvGk5PHdUQVc2mqE7c72Jk0NU9+u6dieU/nnb9udMNiYDw1AQvB@lists.freedesktop.org,
 AJvYcCXqe/9GPre0jQb4SdefKRv46E0RjU3nBg4v1UoJq0bpLJSgDell3C2nUdBOtxAflw8MX6zCz3JS@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzbMrNJxuum3TSAUK8EKObJvrQVVTCWJPNkVIrlkll8+jxemikX
 dWxcN5jSRPCG903+um+Ku6bTp8TNGiaFTNp685MUEo1Yh/3r1zWvdyM8
X-Gm-Gg: ASbGnctuBIxfYNUh3VoxLTRCuswZ93aS0ns5xR4MsN6RxC6mcJ1M4L26x47spvxTcKN
 0a1j605feWC4WHQUi8AgSbylyt+YEw5xHyecbEQTKsZ4vpENW0CIGtgKs4Gc6AcLx8EoQgY+3CL
 RQDNu0gD/Kld6NfPTiN6RCTdCQEu+s2hjpGR4mApb+ybrMWU5jJDDUzDvL++oHIjfSruR9B4VXS
 b23d2ACGBjo/LUIVf+chEkYGfK1tHjXKM2UJIm8M7u+dO+WGoo0c4P5gDb98ucrfafWeRcnVIZh
 EzFQAkp8czi8L30c5HfQl8YQi8W4kOibJZ/zWjbTJ8OIn+7WOyqTLhdq+JBJ7UsoovXA+qFMtx2
 hXiSBT65Kd/9fxjyRV4e320queiFMe8+78ji8uCbfaD8XMCkqHqMkXpq9+hLCRI3OyPavpOlEK8
 wohw==
X-Google-Smtp-Source: AGHT+IELdpv7uUZAZBrGCo6vRMKsduTbeRMcIYAoxynvAlTrmV87SOcUm0eDA5nlXTZa0W/xhKLP5A==
X-Received: by 2002:a92:cda6:0:b0:3e2:a8d7:cbc0 with SMTP id
 e9e14a558f8ab-3e41610d612mr96883205ab.2.1754193530845; 
 Sat, 02 Aug 2025 20:58:50 -0700 (PDT)
Received: from frodo.raven-morpho.ts.net (c-67-165-245-5.hsd1.co.comcast.net.
 [67.165.245.5]) by smtp.googlemail.com with ESMTPSA id
 8926c6da1cb9f-50a55df0940sm2268319173.106.2025.08.02.20.58.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Aug 2025 20:58:50 -0700 (PDT)
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
Subject: [PATCH v4 12/58] dyndbg: macrofy a 2-index for-loop pattern
Date: Sat,  2 Aug 2025 21:57:30 -0600
Message-ID: <20250803035816.603405-13-jim.cromie@gmail.com>
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
index 283926530a43b..7c5a1ae2c0a65 100644
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
2.50.1

