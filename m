Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4104958B1B7
	for <lists+dri-devel@lfdr.de>; Fri,  5 Aug 2022 23:56:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8FB79FC95;
	Fri,  5 Aug 2022 21:54:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x134.google.com (mail-il1-x134.google.com
 [IPv6:2607:f8b0:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB14810E418;
 Fri,  5 Aug 2022 21:54:31 +0000 (UTC)
Received: by mail-il1-x134.google.com with SMTP id t15so1973157ilm.7;
 Fri, 05 Aug 2022 14:54:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=5COrt8+UBE4dlO0UmlrrMAl6VEmhHXEe2GHU1HbZD24=;
 b=L043JNA8z+12v91PFQd8hIfM8uLiFmV8nj9LHoJBfI1kLPvGkDEWdC8Wd4p2KZld9S
 0zgoUdIOwejHnh294RaTF25kbIywgsTuWesIWEnfzflxvdXVQIAddSszCjlNNai4Gx1q
 aELRYlSetyNwLJ5JVno+H1ojMessgxxdhaeujBNZAqFX86C5Jlnp2Yar7EKLEJZAJXQe
 LmE5+fFjVKQ88KmWSEcy8Z5jBLBebC2GIYPGeOBqprLtN2V97uCEmS6KH7wQli+TWOG4
 ReT8K1fFGIxKxlacyunZgm/oj5Aa5dKOX7xqDbqNIYwO60YKAUqFdODkz5xKVK64LxEo
 FUoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=5COrt8+UBE4dlO0UmlrrMAl6VEmhHXEe2GHU1HbZD24=;
 b=u6qQ0nHGRqqIeg5M/jdo0LGL6OGQLvDhnM1Gm5Coi5m4ziFUiPtWvODszOtwA5a8sv
 xGyE8r1c31VrmvH8yo350fYhsmpco1ClrcBUMWW3M4+UV6cLshKlpvEnrnZ/qbn+gMAg
 6N3FPpXpLcPFUSffBrZKWpIqvnna953hZ/ed0JfagG95QFO0k2zyiA/num/qGs2a4yAs
 Ubfm2nbRBgk6lfx+dT16PJ7pNfQYFqKoqh0K1Av2WPJiNbV1ws20S4/IpWxD5KJ8HgRe
 3RnD5UvfioeAcGJV3tJQ9OSwLNiUegCr/eQfpi8OSiHmpFdB6yL7yULwv/oZOa/GGq+1
 /3bA==
X-Gm-Message-State: ACgBeo314LedcWKZH5Ug49IgBiOqNCH+5a7jNC4MJxQIP86keCmwTSkY
 uZeTfeeIjtD7A8/o3G1FnTQ=
X-Google-Smtp-Source: AA6agR7Up2wCnebNs4iDSz5YId5lNZX4AQVQrMH/DVsNi85YXM9aZ5Sbsa3AlT3EPXU6THVv5XJyNA==
X-Received: by 2002:a92:cc04:0:b0:2de:1abf:7414 with SMTP id
 s4-20020a92cc04000000b002de1abf7414mr3982054ilp.119.1659736470528; 
 Fri, 05 Aug 2022 14:54:30 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 e12-20020a056602044c00b0067c09fd0b53sm1765532iov.21.2022.08.05.14.54.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Aug 2022 14:54:30 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, jbaron@akamai.com,
 gregkh@linuxfoundation.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-arm-msm@vger.kernel.org
Subject: [PATCH v5 09/33] dyndbg: drop EXPORTed dynamic_debug_exec_queries
Date: Fri,  5 Aug 2022 15:53:31 -0600
Message-Id: <20220805215355.3509287-10-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220805215355.3509287-1-jim.cromie@gmail.com>
References: <20220805215355.3509287-1-jim.cromie@gmail.com>
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
Cc: daniel.vetter@ffwll.ch, seanpaul@chromium.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This exported fn is unused, and will not be needed. Lets dump it.

The export was added to let drm control pr_debugs, as part of using
them to avoid drm_debug_enabled overheads.  But its better to just
implement the drm.debug bitmap interface, then its available for
everyone.

Fixes: a2d375eda771 ("dyndbg: refine export, rename to dynamic_debug_exec_queries()")
Fixes: 4c0d77828d4f ("dyndbg: export ddebug_exec_queries")
Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
Acked-by: Jason Baron <jbaron@akamai.com>
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
2.37.1

