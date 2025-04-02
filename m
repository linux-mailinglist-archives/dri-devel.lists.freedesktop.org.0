Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10004A79406
	for <lists+dri-devel@lfdr.de>; Wed,  2 Apr 2025 19:42:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D15210E887;
	Wed,  2 Apr 2025 17:42:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="b3sLMge6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f46.google.com (mail-io1-f46.google.com
 [209.85.166.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 743E810E881;
 Wed,  2 Apr 2025 17:42:22 +0000 (UTC)
Received: by mail-io1-f46.google.com with SMTP id
 ca18e2360f4ac-85b4277d0fbso1642039f.0; 
 Wed, 02 Apr 2025 10:42:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1743615741; x=1744220541; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0gFevukveSt7PbWkbUevQGA0uvSXu+LT7vaKBaZctmY=;
 b=b3sLMge6PF/u/40OnvL/Vt1pviufzM4XfFMeaZBFwEk8ezVFmk5jhs1Pq1n221Q1Dn
 n0vRjxW/TT5H9HgpBLxhjBU9Q/QFpg3wZRxQlp1MYRxv1sxywfuzMKlcXwEQjTiQ4OG5
 tT+O46NdzsanSmxOQzHvprZ/OhdaPD+yNqK4OKMFwRbPwtLEhdfqr1sKklts/KluyubW
 PgDdMtz57jrZzpRei+eFKcACwWbBR8bsR86smO+2uuhO8W5apQn1WSDlYwc5XS/psTPO
 a2k9J428JzHPkaMYzPWWzhLEzN093evmzog5Fx0X7+LkxxaoXGCCUAHx0UysaD+ci+dP
 xWIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743615741; x=1744220541;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0gFevukveSt7PbWkbUevQGA0uvSXu+LT7vaKBaZctmY=;
 b=QSbc8glT3WSgzrdsweJLFx6mYwP6O4RgwqGl6UZY+SRd7qdO2VTYfOyP98GAxTO6gy
 7n1fMPNunOIVyJ7rjQYvCRX0sEiWFjfFELExHZXRLctSoZtXBW72Xep0d1eDwIvWsYIA
 6ucaCxjVCE8bVBUx6d3atbl/81qbos1Stv/O6dpdRKjnVJ6u/XDlM5/XqXIBlKOpSneJ
 TOJWCJTV8GhvlClLEQ66pjQ5+30Za29SeMRii0fdoAypMnVp8rZc2OBnp1mlCLuHWqko
 xzIF0miWbDJtNAN8YQIu5Mp2o6cFG+W3HFniEtbXnf4rhEvFIpHM6pDVa1AXh0cvjsff
 T5kg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUunmf0ZmsJEXsWZd3NX45lEYpPvKJIuW6nppEXt1fzcJg4/BXQPu1KKR8o9CR/omN8AjFs0B1R@lists.freedesktop.org,
 AJvYcCVv3you8wdqejjIgM9F/XPm5lbog6IpOaFBhToNzig2uEQpO0k9mR5OQAvfE+pWL2O14izxtMk3LHoz8ksMjQ==@lists.freedesktop.org,
 AJvYcCWB9MPE5ELrI4WqlYP2bj/w5SV1QyRQhzQMgipYZVVSq8yE71FTgl9iEkOqbPckBJQem+DwuhcBGy8A@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwvwbMGNVNz0cxXxSpsEbKasp74l5AkT3+MzPtbnf/EL5jnzFCy
 TgnKkU9LFE2qtiu99XYdfMAIV6kx/piGLTq/cZlHbouSfdvnozWs
X-Gm-Gg: ASbGncvkJGt2MRYpdeHAf22uK9H2EMTZyKyJ5QxIRKGXWfN82G7h0o7Aiy0hiNZmDlJ
 ZBM8qkTcmGkakc2/6yKMY+MUNSnX487qbUGtsShYaFQIAKSLyBHn5ToB4FhuBJ2oqnLroG8lnL+
 BEybBil19x+fSutyXpPw5WxMrzoK3yniHPVXgZPb1fn67/3/K68pUyb4lS/+6WyqH6rgDABD+EH
 b6S9Zq8m7QzvZi4mbZwc6I8vOwjNM5tKtFVlm3pN4sEii8eL/DPzW5JeMiynQ0+O9rpMbk+njeC
 0mnLxX+p4V8z78niXiKQTgCdgWIxOceKBrCpOOn81YJEtxe6AtTVYfJp9jF05iDibzGL/ILxFys
 gtA==
X-Google-Smtp-Source: AGHT+IEV2XIR0LN/wAE2n62Y1VoOctpEVbSfU4OWKQUPEpcCeuWBTEhGGJZ77uLyoEnBh82Q9kZt3g==
X-Received: by 2002:a05:6e02:3c85:b0:3d3:d994:e92e with SMTP id
 e9e14a558f8ab-3d5e09db5d3mr173946165ab.17.1743615741560; 
 Wed, 02 Apr 2025 10:42:21 -0700 (PDT)
Received: from gandalf.. (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
 by smtp.googlemail.com with ESMTPSA id
 e9e14a558f8ab-3d5d5af8369sm33439725ab.71.2025.04.02.10.42.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Apr 2025 10:42:21 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, gregkh@linuxfoundation.org, ukaszb@chromium.org,
 louis.chauvet@bootlin.com, linux-kernel@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 daniel.vetter@ffwll.ch, tvrtko.ursulin@linux.intel.com,
 jani.nikula@intel.com, ville.syrjala@linux.intel.com,
 Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v3 08/54] dyndbg: reduce verbose/debug clutter
Date: Wed,  2 Apr 2025 11:41:10 -0600
Message-ID: <20250402174156.1246171-9-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250402174156.1246171-1-jim.cromie@gmail.com>
References: <20250402174156.1246171-1-jim.cromie@gmail.com>
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
index 55df35df093b..c609ff873224 100644
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
2.49.0

