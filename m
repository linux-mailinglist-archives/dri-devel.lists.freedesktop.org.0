Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 694BDA1C142
	for <lists+dri-devel@lfdr.de>; Sat, 25 Jan 2025 07:46:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41EAD10E29D;
	Sat, 25 Jan 2025 06:46:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="JRmRxTf8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f176.google.com (mail-il1-f176.google.com
 [209.85.166.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FB5F10E296;
 Sat, 25 Jan 2025 06:46:47 +0000 (UTC)
Received: by mail-il1-f176.google.com with SMTP id
 e9e14a558f8ab-3ce6b289e43so25367665ab.3; 
 Fri, 24 Jan 2025 22:46:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737787606; x=1738392406; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=crImgp1y7IRXSUD7oHrqvuelp6vlR0pAkEGBI4jI/u4=;
 b=JRmRxTf8ubcfT7LdPcGRXpCOOM55TrWT9p3fOeBjMXqJEVgODp/fxYbS+4EbCUnQUw
 +ZlZJImJ4gDXN+tdFPWdn0Uz8xScIXwu3Gl3gbrVK0twjhFpQu8OxHBpwe0dWosBwxEb
 GvGmpTB2qoOATck2al+7X2NSCw5zq7dmIc4s8LTCML09BIM+0mePWxvnm/O85HfQN9+L
 mwaWEgwJDQQmxRA5xKn0BpBoEK8+Z7u1S1kwCDoFGQW/T/LIxytUqmKSOIKys4L+kaeo
 83r7HXsei6oYGWUSnuQRemdToN7Q6xaQUONC4Q0sm3zfmDzKoPZrdc8dHe1fi8iXwVVl
 tA/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737787606; x=1738392406;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=crImgp1y7IRXSUD7oHrqvuelp6vlR0pAkEGBI4jI/u4=;
 b=KeTLlOCeNW4JHrcjjc4oWLS5K0TWDbOcQj8Cv7pJYS7QeqQ/7s41+B6VHFTSngbQAv
 21QIqstOEWXN/5QyxHBU7gJkz/WIKvxoVLQ/X94F2YONyYPXRjns/WSOE/tWFCN/PhHJ
 6KeyVGeAb9+/mg/UF4eKWZQdBx/pcRpyrYJ+QSQnaIV0IiaoW2Izq1N5mNIwwNA6v6Ir
 /fST/Ll0JYYrMDStYoHSyZ3v8IvojUKkEFbMvWW1ziDSKXda7W/OE1h4/lpwtUr/Fg8l
 U1aokGWXEDbjMajx3wPmSxM87iM+NDtbRsx1lZsEKQQHT/cFtKRuS+pAL1yKLxUsh+9C
 bNfQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUZeAg8nug+yl6t0WJqP9KUson63ni+IPV2eARsN7kqD7W76/VK2rX7SwpbFNpZNzpcfIVBhmAwNLmd@lists.freedesktop.org,
 AJvYcCUveWsmfAythns4qHPUG9E3AdZ9OVeie6PaQQkCRXEPNS8x7csTq5ZOC0OgrHn5vpnq1AJhxezB@lists.freedesktop.org,
 AJvYcCWIsA7niLMMeeB+un1q2eBBSkrmEwRLrUGqFPVRDaIaPR58epAhb+yKKioFumE4F5ATuQMvFcVXCplM@lists.freedesktop.org,
 AJvYcCX6Lzh7roIlTGuur7/xCtMGUJrIxh39rSxOpmm9o7WOeJrZ3sTq1YgS3dn4QCzod+jNAiMiGpnUYDeEiNgZ+Q==@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxteruy3tR2pMy2sqf3qxrufeYEASG2gP3naSRkEYqnQA71Gh13
 mCCetWn5XhHxT+d+7uTqF3B2JNerP7IJSbfIgKByOsNxRClyTSZh
X-Gm-Gg: ASbGnctdNJt+/YvKm2g4S59e2kAypElEUoCxxZUGQP4SDk4xITrw88emmrn6OFIVtrC
 yS2E1J48JBslwyQbzYuTDonUxeLSSW1MUUeZXj7E/z/q6BJJ6ZkehDEue9QKwm6iV58eYKwFOC7
 mbamrrnOdITSNC6CiCsyxaz07LAae/djDSqoYtHIEsy1xZUbbD/uhnZL8GAoYJe9PgkCSitoaPt
 h4Pmcbr4+Ir0Awf9EUpcDc0GWJPEjW8SM7PpWDBj/WJrcG15cpqGw/HwaQi0v6lSNL+vQfWglyT
 MYX9qRBTANnWV80qLdD/JtfXOLZ/kqRo1Yu+kg==
X-Google-Smtp-Source: AGHT+IEjjwWoWaC2eqRVAIRwzEKW3d0rVEFuGJkXw2+P/hMoxb83M7t9s2BDslJJbs0hJxkgZgzZdQ==
X-Received: by 2002:a05:6e02:fc5:b0:3cf:c558:3594 with SMTP id
 e9e14a558f8ab-3cfc558384emr50346105ab.2.1737787606321; 
 Fri, 24 Jan 2025 22:46:46 -0800 (PST)
Received: from gandalf.. (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
 by smtp.googlemail.com with ESMTPSA id
 8926c6da1cb9f-4ec1da476fesm1174144173.58.2025.01.24.22.46.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jan 2025 22:46:45 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, jbaron@akamai.com,
 gregkh@linuxfoundation.org, ukaszb@chromium.org
Cc: intel-gfx-trybot@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, daniel.vetter@ffwll.ch,
 tvrtko.ursulin@linux.intel.com, jani.nikula@intel.com,
 ville.syrjala@linux.intel.com, Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH 09/63] dyndbg: reduce verbose/debug clutter
Date: Fri, 24 Jan 2025 23:45:23 -0700
Message-ID: <20250125064619.8305-10-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250125064619.8305-1-jim.cromie@gmail.com>
References: <20250125064619.8305-1-jim.cromie@gmail.com>
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

no functional change.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 lib/dynamic_debug.c | 14 +++-----------
 1 file changed, 3 insertions(+), 11 deletions(-)

diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index 9adcb9fa7110..1b2fb6502e61 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -266,9 +266,6 @@ static int ddebug_change(const struct ddebug_query *query,
 	}
 	mutex_unlock(&ddebug_lock);
 
-	if (!nfound && verbose)
-		pr_info("no matches for query\n");
-
 	return nfound;
 }
 
@@ -501,7 +498,6 @@ static int ddebug_parse_flags(const char *str, struct flag_settings *modifiers)
 		pr_err("bad flag-op %c, at start of %s\n", *str, str);
 		return -EINVAL;
 	}
-	v3pr_info("op='%c'\n", op);
 
 	for (; *str ; ++str) {
 		for (i = ARRAY_SIZE(opt_array) - 1; i >= 0; i--) {
@@ -515,7 +511,6 @@ static int ddebug_parse_flags(const char *str, struct flag_settings *modifiers)
 			return -EINVAL;
 		}
 	}
-	v3pr_info("flags=0x%x\n", modifiers->flags);
 
 	/* calculate final flags, mask based upon op */
 	switch (op) {
@@ -531,7 +526,7 @@ static int ddebug_parse_flags(const char *str, struct flag_settings *modifiers)
 		modifiers->flags = 0;
 		break;
 	}
-	v3pr_info("*flagsp=0x%x *maskp=0x%x\n", modifiers->flags, modifiers->mask);
+	v3pr_info("op='%c' flags=0x%x maskp=0x%x\n", op, modifiers->flags, modifiers->mask);
 
 	return 0;
 }
@@ -541,7 +536,7 @@ static int ddebug_exec_query(char *query_string, const char *modname)
 	struct flag_settings modifiers = {};
 	struct ddebug_query query = {};
 #define MAXWORDS 9
-	int nwords, nfound;
+	int nwords;
 	char *words[MAXWORDS];
 
 	nwords = ddebug_tokenize(query_string, words, MAXWORDS);
@@ -559,10 +554,7 @@ static int ddebug_exec_query(char *query_string, const char *modname)
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
2.48.1

