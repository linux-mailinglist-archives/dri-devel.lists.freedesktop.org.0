Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D7D9F76C10B
	for <lists+dri-devel@lfdr.de>; Wed,  2 Aug 2023 01:35:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E56F610E45C;
	Tue,  1 Aug 2023 23:35:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x132.google.com (mail-il1-x132.google.com
 [IPv6:2607:f8b0:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AD2910E44E
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Aug 2023 23:35:29 +0000 (UTC)
Received: by mail-il1-x132.google.com with SMTP id
 e9e14a558f8ab-3492c49c649so8052845ab.3
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Aug 2023 16:35:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690932929; x=1691537729;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=secnYeetnoN73Zbg5ZPtwWITn/xzYOQ6p+p+lCfsE3Y=;
 b=q8IcQXIyndqF9qUtO4AFbVVD3rl7G5ANpuV72J4Z9/r3acd4jAohdnX37E53MXl+PG
 g9l4iW+3lF3ubeOJCdR1TJzy1s98QH/Yc0hyW+nrgVDG0WvcB+5Y0lmYfjVXGN8tOkR3
 V7wIPfq4fsWeuI+knOAsL21ifmf7cbgE1VDbnjpMHgS9AIU8goHzT0L4vK11a6/8QFQW
 6Jo2ar3Gavco17bhlcS/bLZUuRNpAPVKjDgIAKU9NJLXUdmyehVi7tcjuXoZl0e6quB4
 IhqgKOoBCxmAPenBpt4XVxY/FKrk35w4zq9a/9MvT3nE+9xZOtVH7pdrTxr4J5pkba02
 sULw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690932929; x=1691537729;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=secnYeetnoN73Zbg5ZPtwWITn/xzYOQ6p+p+lCfsE3Y=;
 b=RR1INEpvUW5inJpmY48LA5/Nw81vK8pJww+nem1FjeXsenQMiTHtQWF67F+sB0vtnK
 ZCcQ6RgG7vK5CnAbHyHfJwct46tCQwMN5xXeI0Qi9MRnys5exyjSAJQNqKeQxYyjR6bn
 se838YvJ6GPZavEmkf89hDT/EB9DDQSLdjBQSwVP+LpQEP743C5Z25kOtE2hMSi6rEIY
 ehuQBqLrTROHABGFt7nragDAy12b2F1iK0Gic2eM5BJHihaF08Rl+1ukJdnIyHddCJ1s
 tK+gVoeypySkd222ceSzCJ8Q5QlFBQRDCXMdyKcBnxrZSFJC9HByqBveF5SAY5h1yrGD
 6L9g==
X-Gm-Message-State: ABy/qLaD512u70215cc/ISIZbBuIYm7XJ1UADBVxv8dbuWEdxvE9abDv
 ZV0YWobsVefUCm+RJkD0gFY=
X-Google-Smtp-Source: APBJJlE4lNuckHdkxUWRHaPtRFPUM+joOip9DDmN7Au/iaNTSz9wFv2CHaWpyRPuS8rQJzs1Pyv6Zw==
X-Received: by 2002:a05:6e02:1aa3:b0:346:6b6d:79a4 with SMTP id
 l3-20020a056e021aa300b003466b6d79a4mr14473411ilv.26.1690932928849; 
 Tue, 01 Aug 2023 16:35:28 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 t13-20020a92ca8d000000b00348d652a6b4sm4157967ilo.48.2023.08.01.16.35.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Aug 2023 16:35:28 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, daniel.vetter@ffwll.ch, dri-devel@lists.freedesktop.org
Subject: [PATCH v5 08/23] dyndbg: reduce verbose/debug clutter
Date: Tue,  1 Aug 2023 17:34:54 -0600
Message-ID: <20230801233515.166971-9-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230801233515.166971-1-jim.cromie@gmail.com>
References: <20230801233515.166971-1-jim.cromie@gmail.com>
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

currently, for verbose=3, these are logged (blank lines for clarity):

 dyndbg: query 0: "class DRM_UT_CORE +p" mod:*
 dyndbg: split into words: "class" "DRM_UT_CORE" "+p"

 dyndbg: op='+'
 dyndbg: flags=0x1
 dyndbg: *flagsp=0x1 *maskp=0xffffffff

 dyndbg: parsed: func="" file="" module="" format="" lineno=0-0 class=...
 dyndbg: no matches for query
 dyndbg: no-match: func="" file="" module="" format="" lineno=0-0 class=...
 dyndbg: processed 1 queries, with 0 matches, 0 errs

That is excessive, so this patch:
 - shrinks 3 lines of 2nd stanza to single line
 - drops 1st 2 lines of 3rd stanza
   3rd is like 1st, with result, not procedure.
   2nd is just status, retold in 4th, with more info.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 lib/dynamic_debug.c | 14 +++-----------
 1 file changed, 3 insertions(+), 11 deletions(-)

diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index 550d380f7690..4200c72fed09 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -265,9 +265,6 @@ static int ddebug_change(const struct ddebug_query *query,
 	}
 	mutex_unlock(&ddebug_lock);
 
-	if (!nfound && verbose)
-		pr_info("no matches for query\n");
-
 	return nfound;
 }
 
@@ -496,7 +493,6 @@ static int ddebug_parse_flags(const char *str, struct flag_settings *modifiers)
 		pr_err("bad flag-op %c, at start of %s\n", *str, str);
 		return -EINVAL;
 	}
-	v3pr_info("op='%c'\n", op);
 
 	for (; *str ; ++str) {
 		for (i = ARRAY_SIZE(opt_array) - 1; i >= 0; i--) {
@@ -510,7 +506,6 @@ static int ddebug_parse_flags(const char *str, struct flag_settings *modifiers)
 			return -EINVAL;
 		}
 	}
-	v3pr_info("flags=0x%x\n", modifiers->flags);
 
 	/* calculate final flags, mask based upon op */
 	switch (op) {
@@ -526,7 +521,7 @@ static int ddebug_parse_flags(const char *str, struct flag_settings *modifiers)
 		modifiers->flags = 0;
 		break;
 	}
-	v3pr_info("*flagsp=0x%x *maskp=0x%x\n", modifiers->flags, modifiers->mask);
+	v3pr_info("op='%c' flags=0x%x maskp=0x%x\n", op, modifiers->flags, modifiers->mask);
 
 	return 0;
 }
@@ -536,7 +531,7 @@ static int ddebug_exec_query(char *query_string, const char *modname)
 	struct flag_settings modifiers = {};
 	struct ddebug_query query = {};
 #define MAXWORDS 9
-	int nwords, nfound;
+	int nwords;
 	char *words[MAXWORDS];
 
 	nwords = ddebug_tokenize(query_string, words, MAXWORDS);
@@ -554,10 +549,7 @@ static int ddebug_exec_query(char *query_string, const char *modname)
 		return -EINVAL;
 	}
 	/* actually go and implement the change */
-	nfound = ddebug_change(&query, &modifiers);
-	vpr_info_dq(&query, nfound ? "applied" : "no-match");
-
-	return nfound;
+	return ddebug_change(&query, &modifiers);
 }
 
 /* handle multiple queries in query string, continue on error, return
-- 
2.41.0

