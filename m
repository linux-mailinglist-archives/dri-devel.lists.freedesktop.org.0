Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9500529401
	for <lists+dri-devel@lfdr.de>; Tue, 17 May 2022 00:57:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C369710E974;
	Mon, 16 May 2022 22:57:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x136.google.com (mail-il1-x136.google.com
 [IPv6:2607:f8b0:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D80C10E66F;
 Mon, 16 May 2022 22:57:05 +0000 (UTC)
Received: by mail-il1-x136.google.com with SMTP id b11so7612973ilr.4;
 Mon, 16 May 2022 15:57:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JnVwspe5uVckeO1htOV0stxvFuwasrGdrVlM7tfSrfg=;
 b=OuCUf4sb69edJrEZ0gKdZzUlEGkHa8dxOXluIHFfd6mv5ISx7ldIjhYAFFNn02Uw07
 MObKaGN8fpxZnvPpJGBIwCuIiuR9IyeS7iH1uxXj/jhLQGhcfat661+qgzEFktP5seY8
 GiaibvoJ532MURzfeqBgThog2fe9DLO4A2hVL/DOhn/6IFDp+oBelBemRUpy55N0zLqI
 zER5IPos8OFUfpDFENsaqh+ouoKsLIvtcyA+eImWseUCcwepToR1grw0WW/uysyVvaIv
 1eJO5nP+NFljczTz12OqQvUpG1AJSUX1UZQUh7+ic0iZgws4hnpW+TgwNJvS24y6rqno
 m2mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JnVwspe5uVckeO1htOV0stxvFuwasrGdrVlM7tfSrfg=;
 b=JF+QmfswdUjeq+mCD3w8iCUf2iFRtRAptbjyZT6UnOPEBANzHS0aCO4h9oOyJ/sJbc
 I06EJ/eR8hlhA7qJpRrPK3wDAiB2qS8zvpwjeovrXI5ebYXqTcK5lm9j1wMJbhyEN4Eo
 gsvQRWRyzj+MoHJKx3a/gd6fHUf4Ps+fNmHbbq1Hb20zN9krkHkA7Al7w19A6uCpbMrn
 zns+CNe8vJITLjuVFo2u33txm8tTVltA0pGE7/uRFH0pqF4o0khWOhGz05Wo5+UuGST2
 9f5fg6wYb+oUWs1+m3I+FwDgJ74IXGekpC8gbHysVvmxrLFtODiaEeM8u81pfHz5S/cJ
 nMsg==
X-Gm-Message-State: AOAM531YPyzILZn1KiZvwjdNRU/oQWMO8yz6nSPQrOmUDHS7N/+8RdFe
 kjWCZqJ3KQtIl75NnOj0uqA=
X-Google-Smtp-Source: ABdhPJxwTzocvNIWCrH3mXf/01/smRYYOyx0fBIce2z2QYjkxLZMX7EQwEEWdjIctASlFEwNKAFkXw==
X-Received: by 2002:a05:6e02:16cf:b0:2cf:8ecb:c8d4 with SMTP id
 15-20020a056e0216cf00b002cf8ecbc8d4mr10064349ilx.174.1652741825259; 
 Mon, 16 May 2022 15:57:05 -0700 (PDT)
Received: from frodo.hsd1.co.comcast.net ([2601:284:8204:2010::dd9f])
 by smtp.googlemail.com with ESMTPSA id
 k26-20020a02661a000000b0032b74686763sm3133949jac.76.2022.05.16.15.57.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 15:57:04 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 04/27] dyndbg: drop EXPORTed dynamic_debug_exec_queries
Date: Mon, 16 May 2022 16:56:17 -0600
Message-Id: <20220516225640.3102269-5-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220516225640.3102269-1-jim.cromie@gmail.com>
References: <20220516225640.3102269-1-jim.cromie@gmail.com>
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
Cc: maz@kernel.org, quic_saipraka@quicinc.com, catalin.marinas@arm.com,
 arnd@arndb.de, gregkh@linuxfoundation.org, linux-arm-msm@vger.kernel.org,
 rostedt@goodmis.org, mingo@redhat.com, mathieu.desnoyers@efficios.com,
 quic_psodagud@quicinc.com, daniel.vetter@ffwll.ch, seanpaul@chromium.org,
 will@kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This exported fn is unused, and is effectively obsoleted by a
forthcoming commit, so remove it.

The export was added to let drm control pr_debugs, as part of using
them to avoid drm_debug_enabled overheads.  But following patches
implement the drm.debug interface, and adapt drm to just use it, so
nobody will never need the export.

This also drops the CONFIG_DYNAMIC_DEBUG=N stub-func, and its
pr_warn(), which I avoided in 2012, then added in 2020 :-/

Fixes: a2d375eda771 ("dyndbg: refine export, rename to dynamic_debug_exec_queries()")
Fixes: 4c0d77828d4f ("dyndbg: export ddebug_exec_queries")
Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 include/linux/dynamic_debug.h |  8 --------
 lib/dynamic_debug.c           | 29 -----------------------------
 2 files changed, 37 deletions(-)

diff --git a/include/linux/dynamic_debug.h b/include/linux/dynamic_debug.h
index f30b01aa9fa4..dd20e825c36f 100644
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
@@ -221,11 +218,6 @@ static inline int ddebug_dyndbg_module_param_cb(char *param, char *val,
 				rowsize, groupsize, buf, len, ascii);	\
 	} while (0)
 
-static inline int dynamic_debug_exec_queries(const char *query, const char *modname)
-{
-	pr_warn("kernel not built with CONFIG_DYNAMIC_DEBUG_CORE\n");
-	return 0;
-}
 
 #endif /* !CONFIG_DYNAMIC_DEBUG_CORE */
 
diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index ca2a28f1d51c..cdc0b03b1148 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -555,35 +555,6 @@ static int ddebug_exec_queries(char *query, const char *modname)
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
2.35.3

