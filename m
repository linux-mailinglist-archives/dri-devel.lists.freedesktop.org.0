Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A94DB191C7
	for <lists+dri-devel@lfdr.de>; Sun,  3 Aug 2025 05:58:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5682810E4A8;
	Sun,  3 Aug 2025 03:58:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="FLz5vNV4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f177.google.com (mail-il1-f177.google.com
 [209.85.166.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E90910E3DD;
 Sun,  3 Aug 2025 03:58:45 +0000 (UTC)
Received: by mail-il1-f177.google.com with SMTP id
 e9e14a558f8ab-3e3f152700fso12486925ab.0; 
 Sat, 02 Aug 2025 20:58:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754193524; x=1754798324; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=w11iTWBqUyUmFQ/xlqpJdlubct7P9lvcZ8FTN2uj0dc=;
 b=FLz5vNV4FoANABeZX5/OQen/YZMc0jbkgwMAigNg4sqSMhERl6IcnD4miGMiAtfpYd
 G+5uRE2AqujH9g1dwu34oOQx9oqUuZ5RlXypaJNPuxxaXhkuRQvmcj/dC5Bq9yZ/M6Lp
 zQabVwx4iTzS9ddg/QR4WRTmPYSkWKAiW5EyWbZjPPeGEv5796Cbk9v8mPaSn49f72r6
 xqbdzdxyudgzIBACGxyLeETTpCFU887plAaJ7H+NiHCnMmyF85sXray+TFMJTF4NVGcS
 ZIEGjJbFEVrRhwwr1X0ZBhQJyaWGy1u8ZbhIAs3dWuumK049D5JNuPypx77kOk9JraSU
 tV2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754193524; x=1754798324;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=w11iTWBqUyUmFQ/xlqpJdlubct7P9lvcZ8FTN2uj0dc=;
 b=jLC6jzj0R05vvysLhmtNXTKRoIjT2bn7gblYn1ytyhz3GmfnmDgNsDpMmgyGJrPDeo
 7AJXjVyQhQp1Q8iqxn7hBcHy145vytZYRcdI+4MqCLw0tvr+RXlcQCv7xK0IM+5F2YVg
 9ixw8e2SceS6H+fTZussIoQKyrtD3zuVrjaKUT1QDIFzSm9HB25SUEjixoDlous8tJt+
 c2sMl4fX9I0Agz/4+vD9dGy3r/nmLkvXzpoihQcAivwdFCsT38X6hr5k5WC9mMiGlp0I
 glOoXDuCVBtVNBH4rqlpGKXMUEA4okk4jn5Sj6CdVaj8qxPSDB5LRrhFvela3yfEkiNF
 Qr0w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVJSsHwSwen4evhiI2bgUT4/TDhrpjWBhkfFlFA2vUkbx9xSB+gy/ibau0PYljqrs6YMa/BR8+PKzYWVMunYw==@lists.freedesktop.org,
 AJvYcCWsbMUQ76A8NM05Ia6950JAvqk1UknVW9IIbceufqfpKCyYyPYgl2lYDcZ0ep5KxiLKyA0/z6vqk7AB@lists.freedesktop.org,
 AJvYcCXmwzTu3SFBFrol8yWx9bd3zuPta5oX519RK6mr1AkfbLuYabq968Zty8kK2EsIzB5z9Sph9k+3@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwDyGR8k9AK8P8JWk2rdP+GSyRmyWqQILpwQQqW3uzKo+d9CGni
 rGUmUQtzz1NWKGGnPhj4Fh9z4xuYlrdW0UNwu66L2mKqF8O1mfkWodbe
X-Gm-Gg: ASbGnctYeWSUNWVAB2YZzUw2b/vfh7LHIZSlSCagi0H1Y6svkFZv9e0D25958hdCnIG
 voemydYFUgM0lPLZPUpoMebCG0cpgRKuRKfIJUfAk2Ec5zaGClXQWssyVSyj/9TyJIZGVeWfRv7
 8Pe3fHU1POhHcG+kcGgp1r+v0GASt1A78O/QbIEpD+ZdiLiaf5bikWkXWkIyCX8QKd1dQ1hBe/w
 DgSjQEx1sByvvTQ4IzrvE6KHXZ9B7+rsMktN5oyM8i2e32arzyJSUDmv8MyVy+sjNHfnIqNUu1r
 Pfqzc48PFhUKac8QpKlZN3JQiLwi/pdABs3KsXzfX++KIl0e1wRLabcW5L9eZXal5XuVSvkmgVr
 6pno3NuXPThYtlD5zE0RfhwfCjb99IrzXBFd1pJjlqrtkckhqu6RnX0HJCPe0jO1osGK74rp/lb
 5VKpjJrMaW3FvR
X-Google-Smtp-Source: AGHT+IGMOals5COhIioa7WIuP+hDvHPdqL2k/g/lRnDo5cgFfZ32l9pYAvRqMJUqo71V4g8mlLwHfg==
X-Received: by 2002:a05:6e02:370d:b0:3e4:17c1:3fdb with SMTP id
 e9e14a558f8ab-3e417c142cfmr83851035ab.0.1754193524519; 
 Sat, 02 Aug 2025 20:58:44 -0700 (PDT)
Received: from frodo.raven-morpho.ts.net (c-67-165-245-5.hsd1.co.comcast.net.
 [67.165.245.5]) by smtp.googlemail.com with ESMTPSA id
 8926c6da1cb9f-50a55df0940sm2268319173.106.2025.08.02.20.58.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Aug 2025 20:58:44 -0700 (PDT)
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
Subject: [PATCH v4 08/58] dyndbg: reduce verbose/debug clutter
Date: Sat,  2 Aug 2025 21:57:26 -0600
Message-ID: <20250803035816.603405-9-jim.cromie@gmail.com>
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
index 2751056a5240d..d9268d051a106 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -264,9 +264,6 @@ static int ddebug_change(const struct ddebug_query *query,
 	}
 	mutex_unlock(&ddebug_lock);
 
-	if (!nfound && verbose)
-		pr_info("no matches for query\n");
-
 	return nfound;
 }
 
@@ -499,7 +496,6 @@ static int ddebug_parse_flags(const char *str, struct flag_settings *modifiers)
 		pr_err("bad flag-op %c, at start of %s\n", *str, str);
 		return -EINVAL;
 	}
-	v3pr_info("op='%c'\n", op);
 
 	for (; *str ; ++str) {
 		for (i = ARRAY_SIZE(opt_array) - 1; i >= 0; i--) {
@@ -513,7 +509,6 @@ static int ddebug_parse_flags(const char *str, struct flag_settings *modifiers)
 			return -EINVAL;
 		}
 	}
-	v3pr_info("flags=0x%x\n", modifiers->flags);
 
 	/* calculate final flags, mask based upon op */
 	switch (op) {
@@ -529,7 +524,7 @@ static int ddebug_parse_flags(const char *str, struct flag_settings *modifiers)
 		modifiers->flags = 0;
 		break;
 	}
-	v3pr_info("*flagsp=0x%x *maskp=0x%x\n", modifiers->flags, modifiers->mask);
+	v3pr_info("op='%c' flags=0x%x maskp=0x%x\n", op, modifiers->flags, modifiers->mask);
 
 	return 0;
 }
@@ -539,7 +534,7 @@ static int ddebug_exec_query(char *query_string, const char *modname)
 	struct flag_settings modifiers = {};
 	struct ddebug_query query = {};
 #define MAXWORDS 9
-	int nwords, nfound;
+	int nwords;
 	char *words[MAXWORDS];
 
 	nwords = ddebug_tokenize(query_string, words, MAXWORDS);
@@ -557,10 +552,7 @@ static int ddebug_exec_query(char *query_string, const char *modname)
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
@@ -1234,11 +1226,10 @@ static int ddebug_add_module(struct _ddebug_info *di, const char *modname)
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
2.50.1

