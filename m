Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EDC94C90B6
	for <lists+dri-devel@lfdr.de>; Tue,  1 Mar 2022 17:47:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16EFB10E69B;
	Tue,  1 Mar 2022 16:46:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x134.google.com (mail-il1-x134.google.com
 [IPv6:2607:f8b0:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7123B10E67D;
 Tue,  1 Mar 2022 16:46:53 +0000 (UTC)
Received: by mail-il1-x134.google.com with SMTP id i1so13002577ila.7;
 Tue, 01 Mar 2022 08:46:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AbSflc6torbg6et0qHRbYffNYt1UwJtGJnvXLb74Egg=;
 b=a8NcLGv6QnSm81bZgtybm/3TJdwwz3ps9+oLhVSAoJ+G/F66Z5LI3EaMGrmwmMwoY/
 yN0K1Zb0IC09OPzL/6RZfTa+5oVdKazhzZQAWYbJD37M9x+9oeYMawEilUhvtLM0WXcR
 ZC7jzMONS65JLV4KjlMIrdW70fQNiig+49kQLkE5W2ssRsp3JG87GZa+4v5Oxybm2Ywb
 AhcIV856HuWZVHbBZ/SDoDMxW523jT/3sASvL1zw2zqCXBR9R8KGCF+2yklmEIb7dkEO
 DT+moribozBiXnVturfKp/uYzSgSWReXJDmNfjVA1A3shp+SX+48AxB1tRVWLd7KWQBa
 EkAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AbSflc6torbg6et0qHRbYffNYt1UwJtGJnvXLb74Egg=;
 b=tI+d4hUOiEv0VY5P0u79+p39B4BKJQDHKo3v8n6SvDfxMx2MMEdeNRrtpM+OLoQ68b
 DfQAw+gnhDHHndlonbdZCASRS9BSJhPWs+MqYpyICDi7BmYodwQa9TJyIjP4ZSMg0PPk
 1/xjx9DHnswFjQ6hx02//c+Tyeb0xF3enQavzQ88LDSCldGsC19Oj/MQMQJ3DFZAN27/
 8BKUmYWaploUJCS0XXCoo+SQ7/4dvmJYi3/q2E/kWs1hkGdQsH9O7/PCMkiH467A7B6F
 TYgxbsyShJzQT/fLL6XbBaChIEO55s5MPOQT62oNyB/GHec7OAaBa2xQP7YQcS75mcgI
 I+ZQ==
X-Gm-Message-State: AOAM533KVS3hq1+f1GjCbQmzPHrBGeA9QycZONgET62hm5ShZ56tRRTJ
 BSOoYVBCYY9hkaO9zm+C7rk=
X-Google-Smtp-Source: ABdhPJy6L6EDsvK7PBArj9g4nyI0AQq/wSqykPlUuAfjt8JbLKlKA0YR9SYeFaMso7gOJB6AzgaOww==
X-Received: by 2002:a92:dd86:0:b0:2bc:805c:23c7 with SMTP id
 g6-20020a92dd86000000b002bc805c23c7mr23352416iln.279.1646153212757; 
 Tue, 01 Mar 2022 08:46:52 -0800 (PST)
Received: from frodo.hsd1.co.comcast.net ([2601:284:8204:2010::f10e])
 by smtp.googlemail.com with ESMTPSA id
 o3-20020a6b5a03000000b00640a33c5b0dsm7272411iob.17.2022.03.01.08.46.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Mar 2022 08:46:52 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, gregkh@linuxfoundation.org, daniel.vetter@ffwll.ch,
 seanpaul@chromium.org, robdclark@gmail.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Subject: [PATCH 04/13] dyndbg: drop EXPORTed dynamic_debug_exec_queries
Date: Tue,  1 Mar 2022 09:46:20 -0700
Message-Id: <20220301164629.3814634-5-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220301164629.3814634-1-jim.cromie@gmail.com>
References: <20220301164629.3814634-1-jim.cromie@gmail.com>
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
index 7eb1c31f870d..60b2572e64f0 100644
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

