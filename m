Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E642767BCEE
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jan 2023 21:38:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9293410E894;
	Wed, 25 Jan 2023 20:38:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x12a.google.com (mail-il1-x12a.google.com
 [IPv6:2607:f8b0:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A630110E866;
 Wed, 25 Jan 2023 20:38:05 +0000 (UTC)
Received: by mail-il1-x12a.google.com with SMTP id b15so7117535ils.11;
 Wed, 25 Jan 2023 12:38:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+GZxyiBPwjVVw5bY+5L1X1rDI1qOdjAKyHdasBC3ULQ=;
 b=Pcm5M1jZT5rDnxcOuBf1EHnK+chJTeNxSetfhfy3aAneipKuw7P/qqJEYUu1PfXVDn
 ourG/Oc62k1oVHB3Jc45ggCT4sdFo1fdyqeHpzpGfSCaRIK13rosa2fPqwk4FoS1YksD
 0ZprA/6L3TU1PLwDorZXYuVM0tt3VrJNnGLKM84l9lZkPZjFb3PhhPROQhkMi+PUacQH
 sdTPnHOOba8rz18+MYnwdJYT+7SxGlH2Z0fTVQBFpRqQu+SR4yj/7f85t7eK6+tpIeWc
 L3HG7ieWv0v7O+p9/p3p6h+zOm/eZmBAb2484Xb7sGNyur0c06GJN8KiSIwxxHLYJMbH
 o+fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+GZxyiBPwjVVw5bY+5L1X1rDI1qOdjAKyHdasBC3ULQ=;
 b=3ox9ZYtTIdemBWjNxUKurC2HGSitA7czNEN8UCC8SEgDoG4ovYu7S/jcy+aXW1nmhU
 a/VVsi10ypz4UBM/zATjgMdUqvA+v+HPKgX4Ko5uIrCqBRyn2qkZF9JZWy3jq6XSM1G2
 y+3Mk69BpNqbVgwyZhkeDn4PWnY65xs8CtlDp5TwQWF1v7o+iEnQZsYRkRcI23Uvr9em
 bBoKl71rg3Us1I90t+eaUkzBqffOffQgMyBfz+ujUsmMEvs9ZgZBFpRth1uNvZlNdOju
 CJiVMJMNVO91OycgP0Q34bAQKI5HU7VEHvAc67LDMDRnQgPDJ/dJTPMMiOnu24HNjsdY
 L2Tw==
X-Gm-Message-State: AFqh2kqVCJdDXvCDFQqRnSL0fxUyv6DbH/BVJd0wIvdc+hdynALp12Je
 UKsxd/uOBOxQf7lxAgl+nNo=
X-Google-Smtp-Source: AMrXdXssegA9kYKRjlrOctGbbeJm4011Wdthjge82j3e0r523u23oEz8BG/Sm+GZIoGEVbQv9Xy7ug==
X-Received: by 2002:a92:1a50:0:b0:30f:3ea9:79f9 with SMTP id
 z16-20020a921a50000000b0030f3ea979f9mr16985406ill.3.1674679084893; 
 Wed, 25 Jan 2023 12:38:04 -0800 (PST)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 y11-20020a056e02128b00b00310a599fd43sm665104ilq.46.2023.01.25.12.38.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Jan 2023 12:38:04 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Subject: [PATCH v3 07/19] dyndbg: reduce verbose/debug clutter
Date: Wed, 25 Jan 2023 13:37:31 -0700
Message-Id: <20230125203743.564009-8-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230125203743.564009-1-jim.cromie@gmail.com>
References: <20230125203743.564009-1-jim.cromie@gmail.com>
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
Cc: jani.nikula@intel.com, daniel.vetter@ffwll.ch, seanpaul@chromium.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

currently, for verbose=3, this is logged:

 dyndbg: query 0: "class DRM_UT_CORE +p" mod:*
 dyndbg: split into words: "class" "DRM_UT_CORE" "+p"

 dyndbg: op='+'
 dyndbg: flags=0x1
 dyndbg: *flagsp=0x1 *maskp=0xffffffff

 dyndbg: parsed: func="" file="" module="" format="" lineno=0-0 class=DRM_UT_CORE
 dyndbg: no matches for query
 dyndbg: no-match: func="" file="" module="" format="" lineno=0-0 class=DRM_UT_CORE
 dyndbg: processed 1 queries, with 0 matches, 0 errs

This patch:

shrinks 3 lines of 2nd stanza to single line

drops 2 middle lines of 3rd stanza
 3 differs from 1 only by status
 2 is just status, retold in 4, with more info.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 lib/dynamic_debug.c | 14 +++-----------
 1 file changed, 3 insertions(+), 11 deletions(-)

diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index 0a5efc735b36..2d4640479e5b 100644
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
2.39.1

