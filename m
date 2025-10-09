Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3488DBCA777
	for <lists+dri-devel@lfdr.de>; Thu, 09 Oct 2025 19:59:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DE1610EAE2;
	Thu,  9 Oct 2025 17:59:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="kvku9NrO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f179.google.com (mail-il1-f179.google.com
 [209.85.166.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E816910EADE
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Oct 2025 17:59:00 +0000 (UTC)
Received: by mail-il1-f179.google.com with SMTP id
 e9e14a558f8ab-42d8bf52325so6007115ab.3
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Oct 2025 10:59:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760032740; x=1760637540; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FcE2j/B1mQgeocNkBmpDERPavffRGmULzplmDVYobd8=;
 b=kvku9NrOswRYsjlEgn1sl/NcjwrnxTEipeGx4frB/0HfVzZBIOZqHPdPVxLXt8PxFN
 tSyNiCe/vEgCGQBV1t2hEMHlomml4NPp6EAZm0SdjFY8Gj17luL16jIzW3OY5cSyGSpe
 aJh7eh68zGIs/FiLwk/b1NEgDmtZuGF5jNY0Fe2g1nVFVqlRczsCNqiwoiBpm8qhHgRp
 E32p4UMlIb1e9BnZpjrUp3j2xD7tMaVOxKgoyeKt5p6y7Hl7jzo6+IqK77KTqHeaqRrO
 rFu/6BwONCJ8UIWGGwtB8NnO84X5SZ2bf6imzkYKEddt+F/kHR2P4SssdfE3LQb8pTqF
 eEMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760032740; x=1760637540;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FcE2j/B1mQgeocNkBmpDERPavffRGmULzplmDVYobd8=;
 b=Oh5AETnGX4ylOMvUWYy3qgCKI7AXKyxFN7HHLnHpRdx7TX3aIqmpzmbQKu7tPYYIQF
 emzH7hqbOTdgp9+SyoGFme/RlyHi8EKYJ5WC+ma4zbMXKQtlexKWJSgWyfUIh8k+KB6x
 s8NF+nNPrdBBfL+4p9iR2+LYfoJodVddWNIF5mMzAmWss6D04FnxVGuab5EMiD2ntblR
 nBEXGYXYl/gI7GJRuLklTiffImjFp4e+PDTr240+QiS/1buBCngKhAQWRfiKStcAaX56
 1XWUbLH8AwOuLbXMPAaCA+Xk5ftGw5i3hFUnLFVgkOU0XU+phmxXm/w1YaTal4pgnc79
 fSTg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU5VYeGtGapXfFhH5MARpxSvn/PWI2DgcXXq48Mc1N7YXX6JgRiCDcsxm5GhhceMqLpTLM9S9prRl8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YydCFVFKt2lolTx2SaEw2RMONB3+MtrTRSYAcD/wlgGaEJMAll2
 kB2a4F0+4TzhKOsy3ojLHw0RXkqKlYP4AvQhZvxSvSly271v4cJ/FzNF
X-Gm-Gg: ASbGncvZr4XDtbnqYX006ME3NFWDsn2g3MiHamnt1pd9wHK83Ga4tYxrIIRWv0VQkTU
 40iornnwbivAjYYT5HQ7UKefBydjS87jk/PCnDCJUNiQ7cCguhrJUHWuJhchUE8AWsO7nHRXkib
 YvZJOWPy3TuMsHBF/a027tRcyF8XGPyA23UPSQRwFfAqvfGx+wH2jnVwf3+NxPHRMzCEDavedpU
 JJ9JPN22SzZ4/FNebG/O4iqZ7uyOvHsXkrHAU1Zes6+bdcuKjE2vLuwUfNdAeou7jDAJIBqKJkW
 4kzVpGtjxplCS0RtIXmcCuyT0NLjzQFXfwnuQJZ7xDfzJ4fmXXlOCzr5ikTN30N7BdrxNI7fPYJ
 RmK7/CpofufPxrBoliAkfvZJqgOx7HMkI7iGz8Ec+JRqdcnvpmSIcXkD8s05eUbwEyW7ogJWk0R
 Atwvbxu7vWopvzT/gegIgPN4VG5cM=
X-Google-Smtp-Source: AGHT+IHjqP+G+vhE18sYwPA5Xq+a2h4s4Xorq9ruFfYudOUTjoHfdl8X+oo47RIuEgvRTTKzlg/Fzg==
X-Received: by 2002:a05:6e02:2305:b0:426:7dd6:decd with SMTP id
 e9e14a558f8ab-42f873f4705mr67420995ab.28.1760032739929; 
 Thu, 09 Oct 2025 10:58:59 -0700 (PDT)
Received: from godzilla.raven-morpho.ts.net
 (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
 by smtp.googlemail.com with ESMTPSA id
 8926c6da1cb9f-58f7200c4afsm30256173.35.2025.10.09.10.58.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Oct 2025 10:58:59 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com
Cc: gregkh@linuxfoundation.org, ukaszb@chromium.org, louis.chauvet@bootlin.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, daniel.vetter@ffwll.ch,
 tvrtko.ursulin@linux.intel.com, jani.nikula@intel.com,
 ville.syrjala@linux.intel.com, Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v5 12/30] dyndbg: macrofy a 2-index for-loop pattern
Date: Thu,  9 Oct 2025 11:58:16 -0600
Message-ID: <20251009175834.1024308-13-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251009175834.1024308-1-jim.cromie@gmail.com>
References: <20251009175834.1024308-1-jim.cromie@gmail.com>
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
 lib/dynamic_debug.c | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index 283926530a43..ddcaa87f3b02 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -128,6 +128,20 @@ do {								\
 #define v3pr_info(fmt, ...)	vnpr_info(3, fmt, ##__VA_ARGS__)
 #define v4pr_info(fmt, ...)	vnpr_info(4, fmt, ##__VA_ARGS__)
 
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
@@ -155,7 +169,7 @@ static struct ddebug_class_map *ddebug_find_valid_class(struct ddebug_table cons
 	struct ddebug_class_map *map;
 	int i, idx;
 
-	for (map = dt->classes, i = 0; i < dt->num_classes; i++, map++) {
+	for_subvec(i, map, dt, classes) {
 		idx = match_string(map->class_names, map->length, class_string);
 		if (idx >= 0) {
 			*class_id = idx + map->base;
@@ -1220,8 +1234,7 @@ static void ddebug_attach_module_classes(struct ddebug_table *dt, struct _ddebug
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
2.51.0

