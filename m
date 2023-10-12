Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6FDE7C7443
	for <lists+dri-devel@lfdr.de>; Thu, 12 Oct 2023 19:22:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3018110E537;
	Thu, 12 Oct 2023 17:21:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com
 [IPv6:2607:f8b0:4864:20::d33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1C8810E534;
 Thu, 12 Oct 2023 17:21:55 +0000 (UTC)
Received: by mail-io1-xd33.google.com with SMTP id
 ca18e2360f4ac-7a5d26511f7so36199939f.2; 
 Thu, 12 Oct 2023 10:21:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1697131315; x=1697736115; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=m2Hn5pT28/jZmYZLDxW0t8SHXvPdNDH+Olrk3yFtzgY=;
 b=AzYPRZEQSjiUsKJuNPSav9nz7GiL5fo1oOnAXvchgDg8Ez+bEHBMjO8ufni8hUhPhO
 Pl7AH5kt2aI+M3kbqXmwiqjVYUPR902ONq3dR2tUNuEDkg6yTaqkf5blByqPUiClqBHc
 1Y5h18HaV1Q+SjqFH+YNOUeIwVvKDIa5udrssMSC3G4CYETtETsn/EtXwRvcBq7O6nPF
 rmEvZyIjIGy95C+G+OKJeM3y7UViENLU4WB8+dTqSQD8YsreFl8mrANY3LaFZVN0T5Bi
 wjKUw3cB7Jr+9WGj4S5UtHRoaltu4pr33OMRQWDiyVqoSEKeRAvtMIqGUvfaZwFBC/U0
 GmAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697131315; x=1697736115;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=m2Hn5pT28/jZmYZLDxW0t8SHXvPdNDH+Olrk3yFtzgY=;
 b=cJduJEE6XfHFOQaeVKgHwzOg1jcHhsZSakds4PCY2EcQdJPz92xB2KDChljUxgPqss
 +0A4h0WZW0C9F4z/Wr01Pk8O5KGpHHklp7SLgO/br9ueDHUc8c+747cj4GO0pAyfN7x3
 lt9ITmzZCwRJRKauaTUHot2vUR4zv2ltfCKCnCx7N4Qn0BrUUVf0EfG7UtE9hFkxCUpo
 0DLD3e62tlo0J3+yGYUvInzNkIT6Tb0W4vqct2M2tu6oJc0+Q603XIah8LAvUHAGdsho
 MNdCxX+CtMTb/Tbnq2+UHYir77ARnjY35wuWmqxdbyHu/YCF2RxrukgHUzKtQMXFYW6g
 fyrw==
X-Gm-Message-State: AOJu0YyfpBcAyjwHNye/MHpUIDlkG8FzEOBu/OYpHL2lYXcSKkzskkcR
 ieIG+vtld/g0BHWGI1nwG4E=
X-Google-Smtp-Source: AGHT+IGdTcFiK6g1n4MsWov4T5md8KkZ4+Ar5bmmxOEjQ+pRBg2eB+R9NvTFAE3OrPxAOb8JxX8TgQ==
X-Received: by 2002:a6b:5908:0:b0:798:312a:5403 with SMTP id
 n8-20020a6b5908000000b00798312a5403mr27180775iob.19.1697131315143; 
 Thu, 12 Oct 2023 10:21:55 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 r25-20020a028819000000b0043cef0711c1sm3992211jai.158.2023.10.12.10.21.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Oct 2023 10:21:54 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, jbaron@akamai.com,
 gregkh@linuxfoundation.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Subject: [PATCH v7 08/25] dyndbg: reduce verbose/debug clutter
Date: Thu, 12 Oct 2023 11:21:19 -0600
Message-ID: <20231012172137.3286566-9-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231012172137.3286566-1-jim.cromie@gmail.com>
References: <20231012172137.3286566-1-jim.cromie@gmail.com>
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
Cc: groeck@google.com, linux-doc@vger.kernel.org, jani.nikula@intel.com,
 daniel.vetter@ffwll.ch, yanivt@google.com, seanpaul@chromium.org,
 bleung@google.com
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

