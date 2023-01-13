Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D128566A32F
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jan 2023 20:31:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13A1810EAE3;
	Fri, 13 Jan 2023 19:31:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x135.google.com (mail-il1-x135.google.com
 [IPv6:2607:f8b0:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57B9910EAC2;
 Fri, 13 Jan 2023 19:30:50 +0000 (UTC)
Received: by mail-il1-x135.google.com with SMTP id u8so11213931ilq.13;
 Fri, 13 Jan 2023 11:30:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lwGmRROjyglOeSoFqRG5imAXV3+5VTAH53vaW+53Odw=;
 b=A3HDe4nbCJ4aCNqOKtRPCFTfVuiuvhgXH9F+UoYsIB+aY6CSBSbXf0vrAqpewP471x
 HmjH4546ZKYNNDXXDIawZ0FDak6IdRz/gLYqC4lTzCvai2ZLX1bCOFXF+Jt+Qa7UQ+sc
 NhAmnTm1Jk3A0Lxj0ch1S+KT9Th9t6kJtXZ0p6V4Kyc4EwyHAHRp08ZPCP7Ze4UqoNY7
 0g9RzBzxz6QlQsSiMtc/2le+UF4O1cy7w47fw8zKe4VbIZ6ryF5EfvVz+NThI6ny3v/u
 BjS7ItVQJ4595l8/qQWVuf2CihOfJmIDHnA802ONMuyjGoZeZlfO2isRMr9LlBJixA6U
 5Yqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lwGmRROjyglOeSoFqRG5imAXV3+5VTAH53vaW+53Odw=;
 b=dp3K6lkMgJcTNeIJWATqpOv4Uzz/Wbfk9pQtM0zJ5450Vv4Lm9mYedVvu+TLZodeEz
 VFZHw/kzfQeRb2PSAAQIdVQ3XiHFaTyizRfjvOmCCmMrkqAXZEt8f7PaD3vGVH1csF8h
 xlXPpqLC3TSYtpUKMrr7dcNuNo5uqbTldCKZoHitDPcN1jcQhkrhr6rOVHGPLDOudP8h
 cA5fJvUsaGKu+ETswIHSaBF/0bl1ehL59mRVwPHgIWukrdeA19vt/22gt+SB/Q8CGIl1
 9/er/q1cOUDb9wwIfJ4YXekuzIrqwsI8M3ST0WxK8rbJnZ7D4XUxKUy0HhpB1LGLMFnB
 3u/w==
X-Gm-Message-State: AFqh2krSZJVTEp5X4rG9qAq3ToCnWyURbpboDdUqhsF2SW8RuqxGj9nI
 9Cyzl/uqg+McWJ8qus17+9Y=
X-Google-Smtp-Source: AMrXdXsS+qp0ff9HeyA41fJjrhFgXevOlox2A1mtYYscRCcks+mT48KcI/kNjwYKXbQuXDyUlJFs0g==
X-Received: by 2002:a05:6e02:1b8e:b0:30d:7451:a58f with SMTP id
 h14-20020a056e021b8e00b0030d7451a58fmr10482235ili.0.1673638249189; 
 Fri, 13 Jan 2023 11:30:49 -0800 (PST)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 e32-20020a026d60000000b0039e583abceasm6497289jaf.68.2023.01.13.11.30.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Jan 2023 11:30:48 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 07/20] dyndbg: reduce verbose/debug clutter
Date: Fri, 13 Jan 2023 12:30:03 -0700
Message-Id: <20230113193016.749791-8-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230113193016.749791-1-jim.cromie@gmail.com>
References: <20230113193016.749791-1-jim.cromie@gmail.com>
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
Cc: jani.nikula@intel.com, daniel.vetter@ffwll.ch, jbaron@akamai.com,
 seanpaul@chromium.org, gregkh@linuxfoundation.org
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
2.39.0

