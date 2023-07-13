Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F0707528AF
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jul 2023 18:37:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BD4210E742;
	Thu, 13 Jul 2023 16:36:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x133.google.com (mail-il1-x133.google.com
 [IPv6:2607:f8b0:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED70710E726;
 Thu, 13 Jul 2023 16:36:54 +0000 (UTC)
Received: by mail-il1-x133.google.com with SMTP id
 e9e14a558f8ab-34611de0ee4so3812125ab.0; 
 Thu, 13 Jul 2023 09:36:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1689266213; x=1691858213;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eS1btezZJmO6646IVhZCBtkTQXCDHPYW6DChhQHTMq0=;
 b=GCcI/UWj8CxfCMWWznCrZnu11IHWFaO0TxxIGE+HeOaazd5KjGV8lt+aEBObp8TLUC
 rI5kiGZahMdxoRmynsV5ZxvJKOx9DGPD+Uj175OI8Rol+ETtdx2uQgWEy1WWKlIMuVDD
 FZQOOSxJvdmMsCNur7/ErNmaEk70HZOXpqgZl65onmI/wFdjp6ZkfjDG7Uq1etcidsPq
 qDY87Hdi4KQd6xKLL6ENp03oJzph+Oe2XeGT7q/rDzZlXUTgzU2CCagOcm5hS1fk+bQ5
 K0BDpyBx5IEQorTxYGgYNrJZOXM26R5wwkAp7OmslkYO3rz+aid8LQ7sR8uA7M34idRO
 E8yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689266213; x=1691858213;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eS1btezZJmO6646IVhZCBtkTQXCDHPYW6DChhQHTMq0=;
 b=hAMJZ0pOm8hJS9IZk9q+WDqVg2HpzZ7lzTN13Dg3e7cOxf6CVTu4rHFpigMxXrD3fr
 RuoqdQ3rr2CekeAqxc16cIh29Sct/Gp6hNl7xZx+Rr5XHGTAPfW0j4iBp1BdFqtP027k
 JA2kPlicyFw7TkDyK1qgxhWOaGAoVnjw01eds+fEU0uzM8e+YQvHPyWrHoAcd9XWHPok
 d9mw/PE5jt3CHNpr4Uc11N5TlYOFtVKtF59h2DeyHsgvNehkrbBcseqHVD+2EsMbTz+k
 hqHBiQAic+aogTZF7OmTRkOVa6kv1roAfmsdnUEj4o0nQ9V3OO1+UiSeOStbGmpVWaCq
 Gp0w==
X-Gm-Message-State: ABy/qLbzU5jwDlycJoOnDmz2aUurW7qgfiCRQN92+X49ECKn6FBMlWkC
 WLWA4o+lvZNDLmxrRd9HeF4=
X-Google-Smtp-Source: APBJJlG9TwXHjNMEkPK4Zzc9arVsxUgT26nEqB6uzhn//X0Xk5NRwmyeZebvERH96XfDA5H3tNmTtg==
X-Received: by 2002:a92:d687:0:b0:33e:7552:3fd5 with SMTP id
 p7-20020a92d687000000b0033e75523fd5mr1921511iln.4.1689266213618; 
 Thu, 13 Jul 2023 09:36:53 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 s7-20020a92d907000000b00345950d7e94sm2147571iln.20.2023.07.13.09.36.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Jul 2023 09:36:53 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, daniel.vetter@ffwll.ch, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Subject: [PATCH v4 08/21] dyndbg: reduce verbose/debug clutter
Date: Thu, 13 Jul 2023 10:36:13 -0600
Message-ID: <20230713163626.31338-9-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230713163626.31338-1-jim.cromie@gmail.com>
References: <20230713163626.31338-1-jim.cromie@gmail.com>
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
Cc: jani.nikula@intel.com, gregkh@linuxfoundation.org, seanpaul@chromium.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

currently, for verbose=3, these are logged (blank lines for clarity):

 dyndbg: query 0: "class DRM_UT_CORE +p" mod:*
 dyndbg: split into words: "class" "DRM_UT_CORE" "+p"

 dyndbg: op='+'
 dyndbg: flags=0x1
 dyndbg: *flagsp=0x1 *maskp=0xffffffff

 dyndbg: parsed: func="" file="" module="" format="" lineno=0-0 class=DRM_UT_CORE
 dyndbg: no matches for query
 dyndbg: no-match: func="" file="" module="" format="" lineno=0-0 class=DRM_UT_CORE
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
index 6070d37c24ac..2a5cbb68d88d 100644
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

