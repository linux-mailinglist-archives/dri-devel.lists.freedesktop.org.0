Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 002E77DD9E6
	for <lists+dri-devel@lfdr.de>; Wed,  1 Nov 2023 01:27:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2F6710E60A;
	Wed,  1 Nov 2023 00:26:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x130.google.com (mail-il1-x130.google.com
 [IPv6:2607:f8b0:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDBF510E5E3;
 Wed,  1 Nov 2023 00:26:28 +0000 (UTC)
Received: by mail-il1-x130.google.com with SMTP id
 e9e14a558f8ab-3574f99d260so24333405ab.3; 
 Tue, 31 Oct 2023 17:26:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698798388; x=1699403188; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=m2Hn5pT28/jZmYZLDxW0t8SHXvPdNDH+Olrk3yFtzgY=;
 b=eN0wRE05+9adrNPHOsWddjpp4CiSJo1FetulLy30ceC1gPvL9pRdQYtbt6O6hvg0F/
 bNUMPm1SkHB2cnPnXcocuyyCq3MbAuqYMfrZmEnbT+s/Gv4Q3Ks04F/b2SFfJLIjZxii
 z/QqBmHI/U7HTokRI99R/+iQCs+RLWEc4Ksr6Q1Dp8kOp1vBFSfmNA5SbRBVxAG/sGpJ
 UsIqGY5IR0O2QCFIu60rDrKVv7+5XKUOC5basuQOS6QF0BhaPAEQvLc/4+PnPyrDjMcx
 83Gd6PAkOLcrqrbtRaIvaTSjvqRFp+K5CajGTgSW/nyLHhWjGGBjvvjdCBekqwEPu4rh
 n9rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698798388; x=1699403188;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=m2Hn5pT28/jZmYZLDxW0t8SHXvPdNDH+Olrk3yFtzgY=;
 b=jjRiNMLYqH+OazZzU8VQAfZ/+KMu96NH7czJBpQZIr0r7lOjWoMX3z5PtSYUXKiGZA
 8/XStxjI2zce+HX3osn5ALjYnXpshhVKRejR3J8StORF6Ov+lKNSk4MxJhCbvWCXZgUj
 PBJ6JqHo9ieOXVRyzfHloGEpckVKiHjqgRmS3e/4KQvO9RJMh/6WMnW0Y7J3G4iv346+
 UbtYi2Zrm2afOm4y4v2KLIByFxxW7mpvkZGgXj04mYFu/iAoUirA74E2hYLemgI/QHJ4
 qEqbXhmHMgvYYxhyZg8Y/PP55pPSTtccYQbkW8kn4h2GPh06klMAhhwtT+AnLawKGMtY
 d+gw==
X-Gm-Message-State: AOJu0Yzr/dsmNy38lKmLC0tWhO7oayt25qGoDAUp4cHKfUy/qlUw7Axu
 o57v5L8HbuFXPjMUnRfTHrk=
X-Google-Smtp-Source: AGHT+IFvuPGBkNbFf/fTVtSst2LwZG2A9Fm+Bj7H59AMN11vAl9xnIK4MAmI8QEipNT2dqX9XpGkzg==
X-Received: by 2002:a05:6e02:2143:b0:357:549f:eca2 with SMTP id
 d3-20020a056e02214300b00357549feca2mr19697911ilv.5.1698798388096; 
 Tue, 31 Oct 2023 17:26:28 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 t1-20020a92c901000000b00357cc8df1d5sm141701ilp.68.2023.10.31.17.26.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Oct 2023 17:26:27 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, jbaron@akamai.com,
 gregkh@linuxfoundation.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Subject: [PATCH v7d 08/23] dyndbg: reduce verbose/debug clutter
Date: Tue, 31 Oct 2023 18:25:54 -0600
Message-ID: <20231101002609.3533731-9-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231101002609.3533731-1-jim.cromie@gmail.com>
References: <20231101002609.3533731-1-jim.cromie@gmail.com>
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
Cc: quic_saipraka@quicinc.com, linux-doc@vger.kernel.org,
 daniel.vetter@ffwll.ch, linux@rasmusvillemoes.dk, will@kernel.org,
 groeck@google.com, maz@kernel.org, mcgrof@kernel.org, mingo@redhat.com,
 catalin.marinas@arm.com, arnd@arndb.de, jani.nikula@intel.com,
 linux-arm-msm@vger.kernel.org, seanpaul@chromium.org,
 linux-arm-kernel@lists.infradead.org, lb@semihalf.com, yanivt@google.com,
 quic_psodagud@quicinc.com, joe@perches.com, bleung@google.com
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
index b67c9b137447..b0e11f6bfaa2 100644
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
 
@@ -497,7 +494,6 @@ static int ddebug_parse_flags(const char *str, struct flag_settings *modifiers)
 		pr_err("bad flag-op %c, at start of %s\n", *str, str);
 		return -EINVAL;
 	}
-	v3pr_info("op='%c'\n", op);
 
 	for (; *str ; ++str) {
 		for (i = ARRAY_SIZE(opt_array) - 1; i >= 0; i--) {
@@ -511,7 +507,6 @@ static int ddebug_parse_flags(const char *str, struct flag_settings *modifiers)
 			return -EINVAL;
 		}
 	}
-	v3pr_info("flags=0x%x\n", modifiers->flags);
 
 	/* calculate final flags, mask based upon op */
 	switch (op) {
@@ -527,7 +522,7 @@ static int ddebug_parse_flags(const char *str, struct flag_settings *modifiers)
 		modifiers->flags = 0;
 		break;
 	}
-	v3pr_info("*flagsp=0x%x *maskp=0x%x\n", modifiers->flags, modifiers->mask);
+	v3pr_info("op='%c' flags=0x%x maskp=0x%x\n", op, modifiers->flags, modifiers->mask);
 
 	return 0;
 }
@@ -537,7 +532,7 @@ static int ddebug_exec_query(char *query_string, const char *modname)
 	struct flag_settings modifiers = {};
 	struct ddebug_query query = {};
 #define MAXWORDS 9
-	int nwords, nfound;
+	int nwords;
 	char *words[MAXWORDS];
 
 	nwords = ddebug_tokenize(query_string, words, MAXWORDS);
@@ -555,10 +550,7 @@ static int ddebug_exec_query(char *query_string, const char *modname)
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

