Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DC81140CA94
	for <lists+dri-devel@lfdr.de>; Wed, 15 Sep 2021 18:40:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 367016E991;
	Wed, 15 Sep 2021 16:40:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com
 [IPv6:2607:f8b0:4864:20::d29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51F2E6E98D;
 Wed, 15 Sep 2021 16:40:32 +0000 (UTC)
Received: by mail-io1-xd29.google.com with SMTP id n128so4272719iod.5;
 Wed, 15 Sep 2021 09:40:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CrEmSurYEG7f2fqsoHnKcSPyJETCI17u84wNRbn86Yg=;
 b=X58plaV+u4i/AQz3qqsdYb14mgslFnAIILm1w5lAP8p1OGsJF8M6YGcSU0dO3pux55
 uoGxlflDORPt6UwQnnlN/60M5q1AO7ABstRwLU0QgK9qI2puvTmbdAmOB9pLdgfLu0O0
 KlfAAmHpo1IoxFA5vHfyEchjpJAuutRPieevl8pSAV0QI9CjmJKx0Nw6/bl0iH4AhPrP
 OCG1JCQdyFen2XC5EWYZCErMkMtBu57A9ddhIrOyAfmjrEgJo6tN+cEDN11KsAWuQZoy
 kJhPeXEAqDA82qyePTQcL6Qk674DSOy7mf8wDT6lWhXqp+jRwx3kK+7ZdEyNgmSjmi1C
 dlwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CrEmSurYEG7f2fqsoHnKcSPyJETCI17u84wNRbn86Yg=;
 b=n8CKgtjD91/9H5oAmrNdbcDpwzbFaGSDF59Ulysh+s2F4l4HZSOO+cElbg49wN2Z48
 OYNLrmgBq9762VsQqcC+3JPSkpU1264XTsSVYBoe5mVa6Z2qywKX6QWlb09VG8nk3P93
 B+RZs0CyFMEHO4l5xzWlHDP74xM0qD+WR2yRVH4zcTGyT8xNvJ3TnzruKWlqVL6Me5RN
 U/nuKtsuj4/HUtL9suv0tmsvw9sSsnIaOfJNAavQc4WutOPuVedF2v3ntQ8LDwY6qzI/
 LL0+kNpBUkxbdg865mtrkCbRWWY1wiJkrUUdLy44V5rvXEx/xfDtmSY9jcxl5EQWiM2p
 Ou1w==
X-Gm-Message-State: AOAM530jsicfY8mgOaplc+uSAvGjqJ6Dkh3pI8hv+N1HEGUbR+kp3WHR
 7Ry0y78e9rJ1eWWsRvI1xrQ=
X-Google-Smtp-Source: ABdhPJwuRCcqyQ83k8sHPemNXwvsKtY8IR5LPWoVQGEgfaksqkBrIZJUOZqEEmE9SXkV37OOs0tepw==
X-Received: by 2002:a02:95ee:: with SMTP id b101mr774496jai.96.1631724031649; 
 Wed, 15 Sep 2021 09:40:31 -0700 (PDT)
Received: from frodo.. (c-24-9-77-57.hsd1.co.comcast.net. [24.9.77.57])
 by smtp.googlemail.com with ESMTPSA id a5sm299540ilf.27.2021.09.15.09.40.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Sep 2021 09:40:31 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, daniel@ffwll.ch
Cc: Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v8 03/16] dyndbg: rationalize verbosity
Date: Wed, 15 Sep 2021 10:39:44 -0600
Message-Id: <20210915163957.2949166-4-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210915163957.2949166-1-jim.cromie@gmail.com>
References: <20210915163957.2949166-1-jim.cromie@gmail.com>
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

change current v*pr_info() calls to fit this new scheme:

-1 module add/remove, callsite counts - a few v2s here now
-2 command ingest, splitting
-3 command parsing - many v1s here now
-4 per-site changes - was v2

2 is new, to isolate a problem where a stress-test script (which feeds
large multi-command strings) would produce short writes, truncating
last command and confusing test results.

4 gets per-callsite "changed:" pr-infos, which are very noisy during
stress tests, and obscure v1-3 messages.

Update docs verbose example to 3 per its comment

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 .../admin-guide/dynamic-debug-howto.rst       |  2 +-
 lib/dynamic_debug.c                           | 22 ++++++++++---------
 2 files changed, 13 insertions(+), 11 deletions(-)

diff --git a/Documentation/admin-guide/dynamic-debug-howto.rst b/Documentation/admin-guide/dynamic-debug-howto.rst
index b119b8277b3e..ab28d200f016 100644
--- a/Documentation/admin-guide/dynamic-debug-howto.rst
+++ b/Documentation/admin-guide/dynamic-debug-howto.rst
@@ -358,7 +358,7 @@ Examples
   // boot-args example, with newlines and comments for readability
   Kernel command line: ...
     // see whats going on in dyndbg=value processing
-    dynamic_debug.verbose=1
+    dynamic_debug.verbose=3
     // enable pr_debugs in 2 builtins, #cmt is stripped
     dyndbg="module params +p #cmt ; module sys +p"
     // enable pr_debugs in 2 functions in a module loaded later
diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index da91ff507117..fd5aca157aec 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -118,6 +118,8 @@ do {								\
 
 #define vpr_info(fmt, ...)	vnpr_info(1, fmt, ##__VA_ARGS__)
 #define v2pr_info(fmt, ...)	vnpr_info(2, fmt, ##__VA_ARGS__)
+#define v3pr_info(fmt, ...)	vnpr_info(3, fmt, ##__VA_ARGS__)
+#define v4pr_info(fmt, ...)	vnpr_info(4, fmt, ##__VA_ARGS__)
 
 static void vpr_info_dq(const struct ddebug_query *query, const char *msg)
 {
@@ -130,7 +132,7 @@ static void vpr_info_dq(const struct ddebug_query *query, const char *msg)
 			fmtlen--;
 	}
 
-	vpr_info("%s: func=\"%s\" file=\"%s\" module=\"%s\" format=\"%.*s\" lineno=%u-%u\n",
+	v3pr_info("%s: func=\"%s\" file=\"%s\" module=\"%s\" format=\"%.*s\" lineno=%u-%u\n",
 		 msg,
 		 query->function ?: "",
 		 query->filename ?: "",
@@ -213,7 +215,7 @@ static int ddebug_change(const struct ddebug_query *query,
 				static_branch_enable(&dp->key.dd_key_true);
 #endif
 			dp->flags = newflags;
-			v2pr_info("changed %s:%d [%s]%s =%s\n",
+			v4pr_info("changed %s:%d [%s]%s =%s\n",
 				 trim_prefix(dp->filename), dp->lineno,
 				 dt->mod_name, dp->function,
 				 ddebug_describe_flags(dp->flags, &fbuf));
@@ -273,7 +275,7 @@ static int ddebug_tokenize(char *buf, char *words[], int maxwords)
 		buf = end;
 	}
 
-	if (verbose) {
+	if (verbose >= 3) {
 		int i;
 		pr_info("split into words:");
 		for (i = 0; i < nwords; i++)
@@ -333,7 +335,7 @@ static int parse_linerange(struct ddebug_query *query, const char *first)
 	} else {
 		query->last_lineno = query->first_lineno;
 	}
-	vpr_info("parsed line %d-%d\n", query->first_lineno,
+	v3pr_info("parsed line %d-%d\n", query->first_lineno,
 		 query->last_lineno);
 	return 0;
 }
@@ -447,7 +449,7 @@ static int ddebug_parse_flags(const char *str, struct flag_settings *modifiers)
 		pr_err("bad flag-op %c, at start of %s\n", *str, str);
 		return -EINVAL;
 	}
-	vpr_info("op='%c'\n", op);
+	v3pr_info("op='%c'\n", op);
 
 	for (; *str ; ++str) {
 		for (i = ARRAY_SIZE(opt_array) - 1; i >= 0; i--) {
@@ -461,7 +463,7 @@ static int ddebug_parse_flags(const char *str, struct flag_settings *modifiers)
 			return -EINVAL;
 		}
 	}
-	vpr_info("flags=0x%x\n", modifiers->flags);
+	v3pr_info("flags=0x%x\n", modifiers->flags);
 
 	/* calculate final flags, mask based upon op */
 	switch (op) {
@@ -477,7 +479,7 @@ static int ddebug_parse_flags(const char *str, struct flag_settings *modifiers)
 		modifiers->flags = 0;
 		break;
 	}
-	vpr_info("*flagsp=0x%x *maskp=0x%x\n", modifiers->flags, modifiers->mask);
+	v3pr_info("*flagsp=0x%x *maskp=0x%x\n", modifiers->flags, modifiers->mask);
 
 	return 0;
 }
@@ -540,7 +542,7 @@ static int ddebug_exec_queries(char *query, const char *modname)
 		}
 		i++;
 	}
-	vpr_info("processed %d queries, with %d matches, %d errs\n",
+	v2pr_info("processed %d queries, with %d matches, %d errs\n",
 		 i, nfound, errs);
 
 	if (exitcode)
@@ -781,7 +783,7 @@ static ssize_t ddebug_proc_write(struct file *file, const char __user *ubuf,
 	tmpbuf = memdup_user_nul(ubuf, len);
 	if (IS_ERR(tmpbuf))
 		return PTR_ERR(tmpbuf);
-	vpr_info("read %d bytes from userspace\n", (int)len);
+	v2pr_info("read %u bytes from userspace <\n%s>\n", (unsigned)len, tmpbuf);
 
 	ret = ddebug_exec_queries(tmpbuf, NULL);
 	kfree(tmpbuf);
@@ -969,7 +971,7 @@ int ddebug_add_module(struct _ddebug *tab, unsigned int n,
 	list_add(&dt->link, &ddebug_tables);
 	mutex_unlock(&ddebug_lock);
 
-	v2pr_info("%3u debug prints in module %s\n", n, dt->mod_name);
+	vpr_info("%3u debug prints in module %s\n", n, dt->mod_name);
 	return 0;
 }
 
-- 
2.31.1

