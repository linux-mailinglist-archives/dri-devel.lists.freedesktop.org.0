Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8A79D1C036
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jan 2026 02:59:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 340BD10E5A3;
	Wed, 14 Jan 2026 01:59:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="PigMi4QW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com
 [209.85.160.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EF1910E587
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jan 2026 01:59:24 +0000 (UTC)
Received: by mail-oa1-f46.google.com with SMTP id
 586e51a60fabf-3ec3cdcda4eso5918984fac.1
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 17:59:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768355964; x=1768960764; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kB9XGvfi6ObodyigSZBf40IoYnb1xkrL/FFwh/sfSnM=;
 b=PigMi4QWvD+AdxISXJ5vTbcd//FsZLTEkhlJuGO1U9iePm6EEw1g62uJVuWNYmzg3U
 RtsbIK2VWoPgf7Jdp8uXcMTXjD5cT7WHDQy3DFpclxhBzFvoTWjoRm0q3poYxQm18g7r
 WVxYrHR1LJ4sKKvHSELfSVpCyUv+XcI4lW2NZCq8z4qbnim51ryhFI1jwZF3scRV2YhY
 SUPuYPkxikmEM/JNM0yPWghlaSXtFL17WHQWLN9yhFWfkepLgjd/Vpdehj3TTAwqce1n
 zs/c9OdpmjoxDiAtDuNdSinrpcCCiJj7i2N2htXrn3is4IP7pgqhXHD3s538DCAy5nfJ
 zpNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768355964; x=1768960764;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=kB9XGvfi6ObodyigSZBf40IoYnb1xkrL/FFwh/sfSnM=;
 b=keGg8kmFtQujY4Kq6NZhegvAlJ1l6c51g+RpqEeo8VkVepQfTpjQdgfRR//WovLzH9
 NhSVTU/7us9/hp1lIR3kxQwm6GlBu0I/s3uLK/oLiOQcodrMeel41gLdPmLKJ4MSaLTf
 F3UHMdP0TbAsgiIi9G8EmZB0IiWxM5aB8ttIWXZTpSSgnSTKSXRw8QpJq/rcDfATk4Jy
 V0UU81gaqIiNn6kSMISpYcvbuh9xPtm5kssocooWeL58AYHmfrqB+Prv5NRZZUMU4NKc
 IOKZjrJox9kBE/eISA2AzYNYIt7eAtT2+HyKLYeEBiNd78AevvnD13dIBp7bBQ8blqEF
 mWxA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUpoycMsrAe8pH6uBLp+DXNVtNWcycfuM76IOH6CnXO6Uecwp8QK9+6MFXi+n8ZeN0AMRiPjmu0svM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyfs9xiNvtzvL0qaa62NUATW/MIxoF+BESuaIo5WEbh7CFohQLW
 dowB+JZCZhGAld+m95uH5sDZPGuKJWV11u+1Urw+aeWmdb7aCQnFejNe
X-Gm-Gg: AY/fxX4LVoY46JoDFierd8TyGxp1QYHT7XIzkvC6ouAlH39unnZml7X8sv8nstMuWfZ
 FsXQL56Lpk2gw2IoiJJz4ZJTDaTKbJsno/GqVARpUAfwnooiazkBlNVWSmfiJELJJ4lMPt6umd6
 NndYcpy26fr6hEUO1dabWUHpgcvtoJLZtbz2S0MVSqSnu7W7IcR+q4X+JTC55rFEzWKlRbBE16D
 LEyUi0/qLwvk4oPbKIUUpeURfAhrWr6epqTVkRCZLSrWhC82HtYqO4atUOE1ZJPPke7r695v/gE
 2iSju03dIjkaZxjBIvgPuNy9FXFkpSL1b8ttQCKE8YjTIZZVL9EH84SjyPqzbL5q6bOjMGst78K
 6nA3Rau4J8+t8cBLRpg6x3jS+Y5y0xJdTqyrYtvX/ZU/1ZB/UQc53DTKzCEPTex1N4JfEYz5alN
 mUYSXGnkrAGcNwRP2smgCKybU3XDQ1TuM5K6DP
X-Received: by 2002:a05:6820:430e:b0:65d:4d4:e7c4 with SMTP id
 006d021491bc7-661006d3539mr639488eaf.38.1768355963839; 
 Tue, 13 Jan 2026 17:59:23 -0800 (PST)
Received: from frodo (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
 by smtp.googlemail.com with ESMTPSA id
 006d021491bc7-65f48ccf24esm9067492eaf.14.2026.01.13.17.59.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jan 2026 17:59:23 -0800 (PST)
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
Subject: [PATCH v8 10/31] dyndbg: reduce verbose/debug clutter
Date: Tue, 13 Jan 2026 18:57:26 -0700
Message-ID: <20260114015815.1565725-11-jim.cromie@gmail.com>
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

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
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
2.52.0

