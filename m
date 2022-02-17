Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D7F44B970C
	for <lists+dri-devel@lfdr.de>; Thu, 17 Feb 2022 04:49:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24AB610E799;
	Thu, 17 Feb 2022 03:48:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com
 [IPv6:2607:f8b0:4864:20::d2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71CA710E789;
 Thu, 17 Feb 2022 03:48:46 +0000 (UTC)
Received: by mail-io1-xd2b.google.com with SMTP id q8so2225760iod.2;
 Wed, 16 Feb 2022 19:48:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cv79QYaUsMAAW7S/s1dtOMu7WJ+uJ1+n4LJB7u+qFpQ=;
 b=dKgXzlD3UZyGeg9LfmO72MXogRWhEZS2KgD9Ny8xfRLtb8Z5bKD9lA3kZkFSI91Vbz
 Q65LdonvyeE2wmCVSYSgWkh2CvnZyHORYp9iYjjydxqtAFVEHOzZhi/8pcGTOj7qXRpj
 DeHvqoFfNamaUr46tuAOy0X/O2rz4vbFD0JZdEg7C9s3V79ErcXFC6hX0hF++2z7HK9G
 fw2dLHdl4ktkYuBfcUfFpxm8Y8L/SRSOdE9Slb4ul1wW2Uff+wtsh39mwB1tCLWjRkyU
 wM6a3PWLRZFfiT78Afc0X7WSLIxynX2x1rsFRTsoRJEFMrFUbL5+z1SsPolWyBtYL3lR
 r2Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cv79QYaUsMAAW7S/s1dtOMu7WJ+uJ1+n4LJB7u+qFpQ=;
 b=23LFuMmUimGSErhda3d3fOvTn2MJCd9Y1oPmL6jY05Mfc/SFjNS+kV73wmo9ALPTDF
 niuSpKb/s6ArnUW+o8QekqEPxjB3k6s7jUrmpiku5WYhTZJ6ESauwNnPONcD2tT2v7Av
 FZy32TDDsoP1MznE0taL19FVjmxxuPVYrnzlpppRScubQcqWCuE4BU24T0y/atbvTrtq
 QS3SZgyLoL6uohXH+96sE1Fh72G/SFB7d6S2giCfeha7TGTYkCJhRaotJiUBNdD/I6eU
 u77+J/mEtALuI4DCsTQ8Q7cUmWq1gGhCR4E2cosjgTYvppQFoMitocqjHSUNaeRHp/Kb
 r/zA==
X-Gm-Message-State: AOAM532rm6n8b3V0g+JAEHVvKBwsVSQ2U+8ZGepyhmpihBhPF/JOL5xY
 TPdfSoAmSahqsohprxsPAfQ=
X-Google-Smtp-Source: ABdhPJw97wYH8FJ7BpO7tlo6qMx3uqv2AZ/tNfoqW4OM6ihOD9Tnv+wrk2lKNzvVE03mCxmq0Bugog==
X-Received: by 2002:a05:6638:1489:b0:30c:b8a4:90a5 with SMTP id
 j9-20020a056638148900b0030cb8a490a5mr772639jak.8.1645069725780; 
 Wed, 16 Feb 2022 19:48:45 -0800 (PST)
Received: from frodo.hsd1.co.comcast.net ([2601:284:8204:2010::1b19])
 by smtp.googlemail.com with ESMTPSA id l16sm1127874ilc.54.2022.02.16.19.48.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Feb 2022 19:48:45 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Subject: [PATCH 04/13] dyndbg: drop EXPORTed dynamic_debug_exec_queries
Date: Wed, 16 Feb 2022 20:48:20 -0700
Message-Id: <20220217034829.64395-5-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220217034829.64395-1-jim.cromie@gmail.com>
References: <20220217034829.64395-1-jim.cromie@gmail.com>
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

This exported fn is effectively obsoleted by Commit:HEAD~2, so remove it.

The export was added here:
  commit a2d375eda771 ("dyndbg: refine export, rename to dynamic_debug_exec_queries()")
  commit 4c0d77828d4f ("dyndbg: export ddebug_exec_queries")

Its intent was to allow drm.debug to use the exported function to
implement its drm.debug bitmap api using dynamic_debug.

Instead, HEAD~2 implements the bitmap inside dyndbg, and exposes it in
a macro declarator, and HEAD~1 uses the macro to connect __drm_debug
to the supporting callbacks.

Since there are no other expected users, and any prospects would
likely reuse the bitmap or a straightforward extension of it, we can
drop this function until its really needed.

This also drops the CONFIG_DYNAMIC_DEBUG=N stub-func, and its
pr_warn(), which I avoided in 2012, then added in 2020 :-/

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 include/linux/dynamic_debug.h |  9 ---------
 lib/dynamic_debug.c           | 29 -----------------------------
 2 files changed, 38 deletions(-)

diff --git a/include/linux/dynamic_debug.h b/include/linux/dynamic_debug.h
index e83c4e36ad29..664bb83778d2 100644
--- a/include/linux/dynamic_debug.h
+++ b/include/linux/dynamic_debug.h
@@ -60,9 +60,6 @@ struct _ddebug {
 
 #if defined(CONFIG_DYNAMIC_DEBUG_CORE)
 
-/* exported for module authors to exercise >control */
-int dynamic_debug_exec_queries(const char *query, const char *modname);
-
 int ddebug_add_module(struct _ddebug *tab, unsigned int n,
 				const char *modname);
 extern int ddebug_remove_module(const char *mod_name);
@@ -253,12 +250,6 @@ static inline int ddebug_dyndbg_module_param_cb(char *param, char *val,
 				rowsize, groupsize, buf, len, ascii);	\
 	} while (0)
 
-static inline int dynamic_debug_exec_queries(const char *query, const char *modname)
-{
-	pr_warn("kernel not built with CONFIG_DYNAMIC_DEBUG_CORE\n");
-	return 0;
-}
-
 struct kernel_param;
 static inline int param_set_dyndbg_classbits(const char *instr, const struct kernel_param *kp)
 { return 0; }
diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index 262178167358..b72632212a65 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -582,35 +582,6 @@ static int ddebug_exec_queries(char *query, const char *modname)
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
 #ifdef CONFIG_MODULES
 #define KP_MOD_NAME kp->mod->name
 #else
-- 
2.35.1

