Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A74845AC732
	for <lists+dri-devel@lfdr.de>; Sun,  4 Sep 2022 23:45:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A15B510E292;
	Sun,  4 Sep 2022 21:42:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x12a.google.com (mail-il1-x12a.google.com
 [IPv6:2607:f8b0:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5473310E135;
 Sun,  4 Sep 2022 21:42:19 +0000 (UTC)
Received: by mail-il1-x12a.google.com with SMTP id a9so3885278ilh.1;
 Sun, 04 Sep 2022 14:42:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=774vPkNjj+tHobVK7wxTpiFngzuHiOZuQGU68liCSfs=;
 b=C7K+Yu8rS5CfqjlNHPHnOaD4zxwfuunfcvyOT5g9f9rMen9a6bVHcvqbwXA2+Y+9Kz
 RKQbD2pNaDWCYN70iNH05lkOWO4RBz/bQ8/cRwN6WEZcEvurKwq1+mOrxYFqPOqFAgqc
 jTojshygRsAzBiQhplkoP1HY15Ecq9/KjZAyKP3dmiszNKFO5leOY1ZvfEMxlgqXIOZd
 dYRX5/7LlkpgOOE5bEoz36HFy0JsAvZ+ng4hTn9uDioPYMM7Bu0T/tVRPEgpDqQID6iV
 nipB6JonPPNto+aq00YwjoQiAFGv/V/8G9n0DURSqGi4XiyI78KNHcGZM6RuJDkxs46Z
 26bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=774vPkNjj+tHobVK7wxTpiFngzuHiOZuQGU68liCSfs=;
 b=R2SoRJgSUlpl4QRrVWuV7ldF9UIQG4Z2TeOqAkDu6f0cD8aYkbzRF3LBFpK1hm/pC4
 +mwYbSZT96ebqajyPEpJ4UFoBZccDEm7Tp8nF6E2S85fHYYoD/8kFdQfwMA3uSL/6+fp
 iffQkFFQCAICGBKr/rR6tnHbgpfW22pmDKKPE6+KLxx4m8A5CWj4givl8jsoZT7m96J1
 nUWamMmDz51rR+NuLJbGoHFYYsb6fKaTWPG15OgV4no4p475URgFWKz6TTcxkZ/ETt2q
 GMUZxPM2BxiG8nTfszBOj7CRGZlQ0tIiWdfxc9hj3foy4IpC6wweyZaXWYK2gNcjPh4k
 2P+Q==
X-Gm-Message-State: ACgBeo0PfsByV8MLt2m3TrjcvY10AHV9EMrgLfsLryJ5bi4X5GacSQZO
 2a50DQ+4mvUbzV1ZhI2eTS4=
X-Google-Smtp-Source: AA6agR5dk7sIC47F0zJwtTKZLwCG1OGpPQGC5vGCcEQBykOFT3Gx9Uw/vzxF/89YxMKOB4dB9YkQUQ==
X-Received: by 2002:a05:6e02:148d:b0:2ee:82e:63fc with SMTP id
 n13-20020a056e02148d00b002ee082e63fcmr7362054ilk.289.1662327738560; 
 Sun, 04 Sep 2022 14:42:18 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 e12-20020a056602044c00b006889ea7be7bsm3727688iov.29.2022.09.04.14.42.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Sep 2022 14:42:18 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, gregkh@linuxfoundation.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v6 09/57] dyndbg: drop EXPORTed dynamic_debug_exec_queries
Date: Sun,  4 Sep 2022 15:40:46 -0600
Message-Id: <20220904214134.408619-10-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220904214134.408619-1-jim.cromie@gmail.com>
References: <20220904214134.408619-1-jim.cromie@gmail.com>
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
Cc: daniel.vetter@ffwll.ch, linux@rasmusvillemoes.dk, seanpaul@chromium.org,
 joe@perches.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This exported fn is unused, and will not be needed. Lets dump it.

The export was added to let drm control pr_debugs, as part of using
them to avoid drm_debug_enabled overheads.  But its better to just
implement the drm.debug bitmap interface, then its available for
everyone.

Fixes: a2d375eda771 ("dyndbg: refine export, rename to dynamic_debug_exec_queries()")
Fixes: 4c0d77828d4f ("dyndbg: export ddebug_exec_queries")
Acked-by: Jason Baron <jbaron@akamai.com>
Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 include/linux/dynamic_debug.h |  9 ---------
 lib/dynamic_debug.c           | 29 -----------------------------
 2 files changed, 38 deletions(-)

diff --git a/include/linux/dynamic_debug.h b/include/linux/dynamic_debug.h
index f30b01aa9fa4..8d9eec5f6d8b 100644
--- a/include/linux/dynamic_debug.h
+++ b/include/linux/dynamic_debug.h
@@ -55,9 +55,6 @@ struct _ddebug {
 
 #if defined(CONFIG_DYNAMIC_DEBUG_CORE)
 
-/* exported for module authors to exercise >control */
-int dynamic_debug_exec_queries(const char *query, const char *modname);
-
 int ddebug_add_module(struct _ddebug *tab, unsigned int n,
 				const char *modname);
 extern int ddebug_remove_module(const char *mod_name);
@@ -221,12 +218,6 @@ static inline int ddebug_dyndbg_module_param_cb(char *param, char *val,
 				rowsize, groupsize, buf, len, ascii);	\
 	} while (0)
 
-static inline int dynamic_debug_exec_queries(const char *query, const char *modname)
-{
-	pr_warn("kernel not built with CONFIG_DYNAMIC_DEBUG_CORE\n");
-	return 0;
-}
-
 #endif /* !CONFIG_DYNAMIC_DEBUG_CORE */
 
 #endif
diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index 5a849716220a..e96dc216463b 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -558,35 +558,6 @@ static int ddebug_exec_queries(char *query, const char *modname)
 	return nfound;
 }
 
-/**
- * dynamic_debug_exec_queries - select and change dynamic-debug prints
- * @query: query-string described in admin-guide/dynamic-debug-howto
- * @modname: string containing module name, usually &module.mod_name
- *
- * This uses the >/proc/dynamic_debug/control reader, allowing module
- * authors to modify their dynamic-debug callsites. The modname is
- * canonically struct module.mod_name, but can also be null or a
- * module-wildcard, for example: "drm*".
- */
-int dynamic_debug_exec_queries(const char *query, const char *modname)
-{
-	int rc;
-	char *qry; /* writable copy of query */
-
-	if (!query) {
-		pr_err("non-null query/command string expected\n");
-		return -EINVAL;
-	}
-	qry = kstrndup(query, PAGE_SIZE, GFP_KERNEL);
-	if (!qry)
-		return -ENOMEM;
-
-	rc = ddebug_exec_queries(qry, modname);
-	kfree(qry);
-	return rc;
-}
-EXPORT_SYMBOL_GPL(dynamic_debug_exec_queries);
-
 #define PREFIX_SIZE 64
 
 static int remaining(int wrote)
-- 
2.37.2

