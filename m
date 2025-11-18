Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 856ACC6B8E2
	for <lists+dri-devel@lfdr.de>; Tue, 18 Nov 2025 21:19:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD34310E51E;
	Tue, 18 Nov 2025 20:19:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="F52Fg5jx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f53.google.com (mail-io1-f53.google.com
 [209.85.166.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C63A10E516
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 20:19:12 +0000 (UTC)
Received: by mail-io1-f53.google.com with SMTP id
 ca18e2360f4ac-949042bca69so109147039f.1
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 12:19:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763497152; x=1764101952; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HugTGWvRZIP85YVvSycVedsiX938Xu07Q7rlJ5dV9Ug=;
 b=F52Fg5jxAbO4J40Cpb5o1+tu6khzY3yPdVahMkd/QQwV47H4qFQKkge4lr/Tahtoe/
 uy8jwFAEjLXT9CwfwMmzRfzDck39cdxzhO3nruUayX3T0+pVgaw9Y9oj1MUdvVbda1M9
 vjR75pfRU3XokoEVIMWsZ7UpmWQWpH4J7QJ6hef/azA+5mfPmYWkmQtXF6DxMeuZfJGg
 sLkE4nn8g1pUYemLUCT2IfH1eSVUSmvGqRx+Upgbg+shgZfbdxc4XpclT8bpPO1dQXx2
 h4BiKIGwIMX2V9Tj2zK+OUlv4G71w8fOUdsWi+bAGdc+DT2L0g7FIKgX6JCnH4YEcB+0
 YGLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763497152; x=1764101952;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=HugTGWvRZIP85YVvSycVedsiX938Xu07Q7rlJ5dV9Ug=;
 b=JtVwz0631Z0rShs09qRgZafvByYsobpiG5vZWsIJmIAZpq17YkrD+dMiPGPu72f+gn
 pXwe/ukg6DQ1yeNr8ZHIQGJLKGwtt3pXZ7N8ByqBGMT08fHb1F0kSgtE38NOyd0KE3bL
 a11hFyCosPy3C/ayb4MrzosQygxbhIKMEl5TQ7YdX3LPKtu8tqnk82oEJh442vxFpu4l
 IKLme40jXRAVYvZh2YoOZur98KuheuxMNPt80UOUuvEcjKCh/1J7GlUjAvmPoguNaMB+
 nFAh0fHNCYkCj4FpKk+m+wqNp4Q9Fk89e6+F/cQmTJ405CuHJWdPfW5JOnWER9cUGEqv
 wKCw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXL+cjb9WVcmHqI7GPEM7KW6RC6dxWfceFXVM+6aLOLaTyEWmo7SpeLp4JVvms4xR5u3J5hBLUb9YI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwDljUbD+xu6R8EH8XmwMxFeubBgeesLO/U48lHUK8Ao+siv516
 upxDgfFvPfspzmKJb81BuwV0KK5YhBqI54tfjl5MbehxEiiTMsfqGAer
X-Gm-Gg: ASbGnctDnoQgoJ7qMYu/KCszK7wnmPflW1W8MX8X7/ESZ52dyhFLQxZv66jblYiH/xo
 dm1LulgSPHHxWtkQOHoLa3sDHo9KhSeClprIyH8UUsMw/kkzQXc8l0CnVeSY5EPwBWXQ7C+7GBR
 7M+2sfohvY7S5Qia/0Rjdm4JJYVVP61kTKECc35kXNxce38XCIlmAIAw8cJD75MNeVK8cYXiWH0
 brH3HLYQgZ1QzmRWVBUsUlYAUcfwyuPL/2EanL6cZhjdZVgJzNzIOyjwLKlHBLevG5gKvh81Qfg
 OnA8beraqQ6wwu2dzOP8o9YHBB226wkpx03oWm5PRuHxPinqezAAYPwxSehVkK7YBqDCDZ81EzP
 VmehI2+G4f5azbdiAhhs8spknNBcdDZXGPrOpNvmlWUFMjvp4TLg0AO+3h8gkwKL2KsnlG3Yqfa
 vIhHxIgJ4YzpfoKVah4YQybLVYozDfHP2ayjFcHJfvK40MOCYxlLKzd7+CGlIJsVTqJSbaxErcZ
 669sMhmEc6sUbSF
X-Google-Smtp-Source: AGHT+IECWQbKajGsqhe9QxBChIn5TDnSeh/Y4LdT/nK7CygIVpJSPa9upZN/tzTEvHgyVA3Qskpj5w==
X-Received: by 2002:a05:6602:6406:b0:949:d7:734b with SMTP id
 ca18e2360f4ac-94900d77599mr1197783939f.13.1763497151646; 
 Tue, 18 Nov 2025 12:19:11 -0800 (PST)
Received: from godzilla.raven-morpho.ts.net
 (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
 by smtp.googlemail.com with ESMTPSA id
 ca18e2360f4ac-948fd4c273bsm419823939f.18.2025.11.18.12.19.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Nov 2025 12:19:11 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 gregkh@linuxfoundation.org, jbaron@akamai.com
Cc: ukaszb@chromium.org, louis.chauvet@bootlin.com,
 Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v6 10/31] dyndbg: reduce verbose/debug clutter
Date: Tue, 18 Nov 2025 13:18:20 -0700
Message-ID: <20251118201842.1447666-11-jim.cromie@gmail.com>
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
   3rd line is like 1st, with result, not procedure.
   2nd line is just status, retold in 4th, with more info.

New output:

 dyndbg: query 0: "class DRM_UT_CORE +p" mod:*
 dyndbg: split into words: "class" "DRM_UT_CORE" "+p"
 dyndbg: op='+' flags=0x1 *flagsp=0x1 *maskp=0xffffffff
 dyndbg: no-match: func="" file="" module="" format="" lineno=0-0 class=...
 dyndbg: processed 1 queries, with 0 matches, 0 errs

Also reduce verbose=3 messages in ddebug_add_module

When modprobing a module, dyndbg currently logs/says "add-module", and
then "skipping" if the module has no prdbgs.  Instead just check 1st
and return quietly.

no functional change

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
-v2 squash several verbose cleanups together
---
 lib/dynamic_debug.c | 21 ++++++---------------
 1 file changed, 6 insertions(+), 15 deletions(-)

diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index 21c1db7e8705..1db2f627237a 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -275,9 +275,6 @@ static int ddebug_change(const struct ddebug_query *query,
 	}
 	mutex_unlock(&ddebug_lock);
 
-	if (!nfound && verbose)
-		pr_info("no matches for query\n");
-
 	return nfound;
 }
 
@@ -510,7 +507,6 @@ static int ddebug_parse_flags(const char *str, struct flag_settings *modifiers)
 		pr_err("bad flag-op %c, at start of %s\n", *str, str);
 		return -EINVAL;
 	}
-	v3pr_info("op='%c'\n", op);
 
 	for (; *str ; ++str) {
 		for (i = ARRAY_SIZE(opt_array) - 1; i >= 0; i--) {
@@ -524,7 +520,6 @@ static int ddebug_parse_flags(const char *str, struct flag_settings *modifiers)
 			return -EINVAL;
 		}
 	}
-	v3pr_info("flags=0x%x\n", modifiers->flags);
 
 	/* calculate final flags, mask based upon op */
 	switch (op) {
@@ -540,7 +535,7 @@ static int ddebug_parse_flags(const char *str, struct flag_settings *modifiers)
 		modifiers->flags = 0;
 		break;
 	}
-	v3pr_info("*flagsp=0x%x *maskp=0x%x\n", modifiers->flags, modifiers->mask);
+	v3pr_info("op='%c' flags=0x%x maskp=0x%x\n", op, modifiers->flags, modifiers->mask);
 
 	return 0;
 }
@@ -550,7 +545,7 @@ static int ddebug_exec_query(char *query_string, const char *modname)
 	struct flag_settings modifiers = {};
 	struct ddebug_query query = {};
 #define MAXWORDS 9
-	int nwords, nfound;
+	int nwords;
 	char *words[MAXWORDS];
 
 	nwords = ddebug_tokenize(query_string, words, MAXWORDS);
@@ -568,10 +563,7 @@ static int ddebug_exec_query(char *query_string, const char *modname)
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
@@ -1245,11 +1237,10 @@ static int ddebug_add_module(struct _ddebug_info *di, const char *modname)
 {
 	struct ddebug_table *dt;
 
-	v3pr_info("add-module: %s.%d sites\n", modname, di->num_descs);
-	if (!di->num_descs) {
-		v3pr_info(" skip %s\n", modname);
+	if (!di->num_descs)
 		return 0;
-	}
+
+	v3pr_info("add-module: %s %d sites\n", modname, di->num_descs);
 
 	dt = kzalloc(sizeof(*dt), GFP_KERNEL);
 	if (dt == NULL) {
-- 
2.51.1

