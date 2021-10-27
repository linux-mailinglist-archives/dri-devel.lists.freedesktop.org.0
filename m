Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3F0843C1BB
	for <lists+dri-devel@lfdr.de>; Wed, 27 Oct 2021 06:38:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 633A889739;
	Wed, 27 Oct 2021 04:37:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com
 [IPv6:2607:f8b0:4864:20::d35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D33ED895B4;
 Wed, 27 Oct 2021 04:37:26 +0000 (UTC)
Received: by mail-io1-xd35.google.com with SMTP id n67so2072117iod.9;
 Tue, 26 Oct 2021 21:37:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hUXw1OWc0bijNWeKRWwMm43lU8lNKntPX+8f8UwNPzs=;
 b=FUKXeYqxji29MCHeOLS1XcPak25DdjiAJQrrVp7Z1xiIyzrGUGSWc9DRHRC4DNLVH3
 M0ZD9wPlj8W36lJfQxAm6DpGANFbqKUD/9F4LhVQ2SnlxKnEECOChi3vbjG/uy+DiWyy
 AqchRPyAlFUgaMUf3lTMfOfh6dMXfTIdbZ2yW1m+wmHgmQ3+IxCXgKfQbjsWAUP1YDP1
 6R15jEXiNBfRq1a+xf62CpOaKDvFeNrGmN4kf4lfRQFRlgoMli3JsxU0JobVIfxAih49
 g/PGQ0FPCLPtA1RLiJ+5YceVQiH5R8kvjFi1utYo+fAP6GTn7D/FT7cDqD/0G07wBXiX
 GRHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hUXw1OWc0bijNWeKRWwMm43lU8lNKntPX+8f8UwNPzs=;
 b=2NedPFRaw7rr+tUiwcggaTFnmcADbPKObgEDwnj2DHBArxbj9Tz6p72DKsqnmeMk6V
 XHKjc73KSs8RLKO1t6wj3x3PoDyyLFKb/CE7l0HFM6KYLVO5CdnCrfQNVy0t0Rdv7ldb
 JLQGESKD+dabOijQqpAxhrJUiWap/Ml7F1wV/KZpbGOcA4XdNc7N37N6rui0lWSZll5T
 cjgy9F/ccx1MXqRGGphAL39sbmPC9rYp2jWkZDfqyQNkgd06pzUAFWMucPKlmulzo+Lm
 wA90Ad1qFxSuk66rrIk8/OI5LtOxPUqg+pKYR4lfe8hfrxgwIZLyeTY0mYgeW5QQixdj
 hYRQ==
X-Gm-Message-State: AOAM532V0ILrsUg+HAw+4C+7TCbo/sXbFX4Jna61u8sxAHCP609tn4gG
 aqBJRJbKLKTsafZuaL5yZoc=
X-Google-Smtp-Source: ABdhPJzSOzGqdoO8Gck7AAmi8O0Fyw83A48XDRgzWexMwCoillaHbIEX46dwmpBmfZYsImDFq0Kxxg==
X-Received: by 2002:a05:6602:2ac8:: with SMTP id
 m8mr18820933iov.112.1635309446157; 
 Tue, 26 Oct 2021 21:37:26 -0700 (PDT)
Received: from samwise.. (c-24-9-77-57.hsd1.co.comcast.net. [24.9.77.57])
 by smtp.googlemail.com with ESMTPSA id a15sm2030404ilj.81.2021.10.26.21.37.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Oct 2021 21:37:25 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, linux@rasmusvillemoes.dk,
 daniel.vetter@ffwll.ch, seanpaul@chromium.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Cc: Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v9 09/10] dyndbg: create DEFINE_DYNAMIC_DEBUG_TRACE_CATEGORIES
Date: Tue, 26 Oct 2021 22:36:44 -0600
Message-Id: <20211027043645.153133-10-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211027043645.153133-1-jim.cromie@gmail.com>
References: <20211027043645.153133-1-jim.cromie@gmail.com>
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

clone DEFINE_DYNAMIC_DEBUG_CATEGORIES interface to enable pr_debug
output to tracefs.

Extend DEFINE_DYNAMIC_DEBUG_CATEGORIES to work for tracing, by
renaming it (with _FLAGS suffix), adding _flags param, and using it
2x; in original and new names, with "p" and "T" flags respectively.

TODO: rethink this, consider combined trace/debug declaration.
good: single bitmap-spec for both trace,debug, no chance of divergence.
bad: arg-type & count checks are hard, and bitmap follows too!

to combine both, we need 4 args:
  sysfs_debug_name, __debug_var
  sysfs_trace_name, __trace_var	// these may be NULL, IFF !CONFIG_TRACE ??
then a bitmap:
  [0] = { "category1" }, ...)

My BUILD_BUG-fu is insufficient to protect a naive macro.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 include/linux/dynamic_debug.h | 19 ++++++++++++++-----
 lib/dynamic_debug.c           |  4 ++--
 2 files changed, 16 insertions(+), 7 deletions(-)

diff --git a/include/linux/dynamic_debug.h b/include/linux/dynamic_debug.h
index 896848f546e6..f273ba82cbb0 100644
--- a/include/linux/dynamic_debug.h
+++ b/include/linux/dynamic_debug.h
@@ -254,11 +254,20 @@ struct dyndbg_bitdesc {
 
 struct dyndbg_bitmap_param {
 	unsigned long *bits;		/* ref to shared state */
+	const char *flags;
 	struct dyndbg_bitdesc map[];	/* indexed by bitpos */
 };
 
 #if defined(CONFIG_DYNAMIC_DEBUG) || \
 	(defined(CONFIG_DYNAMIC_DEBUG_CORE) && defined(DYNAMIC_DEBUG_MODULE))
+
+#define DEFINE_DYNAMIC_DEBUG_CATEGORIES_FLAGS(fsname, _var, _flags, desc, ...) \
+	MODULE_PARM_DESC(fsname, desc);					\
+	static struct dyndbg_bitmap_param ddcats_##_var =		\
+	{ .bits = &(_var), .flags = (_flags),				\
+	  .map = { __VA_ARGS__, { .match = NULL }}};			\
+	module_param_cb(fsname, &param_ops_dyndbg, &ddcats_##_var, 0644)
+
 /**
  * DEFINE_DYNAMIC_DEBUG_CATEGORIES() - bitmap control of categorized pr_debugs
  * @fsname: parameter basename under /sys
@@ -271,11 +280,11 @@ struct dyndbg_bitmap_param {
  * modules calling pr_debugs to control them in groups according to
  * those prefixes, and map them to bits 0-N of a sysfs control point.
  */
-#define DEFINE_DYNAMIC_DEBUG_CATEGORIES(fsname, _var, desc, ...)	\
-	MODULE_PARM_DESC(fsname, desc);					\
-	static struct dyndbg_bitmap_param ddcats_##_var =		\
-	{ .bits = &(_var), .map = { __VA_ARGS__, { .match = NULL }}};	\
-	module_param_cb(fsname, &param_ops_dyndbg, &ddcats_##_var, 0644)
+#define DEFINE_DYNAMIC_DEBUG_CATEGORIES(fsname, _var, desc, ...) \
+	DEFINE_DYNAMIC_DEBUG_CATEGORIES_FLAGS(fsname, _var, "p", desc, ##__VA_ARGS__)
+
+#define DEFINE_DYNAMIC_DEBUG_TRACE_CATEGORIES(fsname, _var, desc, ...) \
+	DEFINE_DYNAMIC_DEBUG_CATEGORIES_FLAGS(fsname, _var, "T", desc, ##__VA_ARGS__)
 
 extern const struct kernel_param_ops param_ops_dyndbg;
 
diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index f19465b114cd..b4146178780f 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -629,8 +629,8 @@ int param_set_dyndbg(const char *instr, const struct kernel_param *kp)
 	for (i = 0; map->match && i < BITS_PER_LONG; map++, i++) {
 		if (test_bit(i, &inbits) == test_bit(i, p->bits))
 			continue;
-		snprintf(query, FMT_QUERY_SIZE, "format '%s' %cp", map->match,
-			 test_bit(i, &inbits) ? '+' : '-');
+		snprintf(query, FMT_QUERY_SIZE, "format '%s' %c%s", map->match,
+			 test_bit(i, &inbits) ? '+' : '-', p->flags);
 
 		matches = ddebug_exec_queries(query, KP_MOD_NAME);
 
-- 
2.31.1

