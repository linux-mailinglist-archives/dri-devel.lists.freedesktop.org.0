Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4383E577B8C
	for <lists+dri-devel@lfdr.de>; Mon, 18 Jul 2022 08:40:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D535AA9D3C;
	Mon, 18 Jul 2022 06:39:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com
 [IPv6:2607:f8b0:4864:20::d2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E614A9D0D;
 Mon, 18 Jul 2022 06:39:00 +0000 (UTC)
Received: by mail-io1-xd2f.google.com with SMTP id h145so8530727iof.9;
 Sun, 17 Jul 2022 23:39:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tAc5RKv+WWvf0AVXeW96W8inWeyrC9o7+W9TGpSg+s8=;
 b=cQr9k1H8iad5zjqxiurQQhAkK2EaCHXCH6lbPSj88lnOJCZy38rWuKztrtG0Mil0gt
 lnoCFsUORnKhi9gFzfkWONztPOZP7q9RyPTyl7Zmim1yGSZretD45e+wHTkEZAvW64kN
 cE0FfuGmRG7HLo4cAyDFscqIZytFoCbWz1UJZlUAUBW2xq47ju17n4Uu20QkEsDwNa2M
 Fu400RI0MEE3po+gsQ6uOwJ+tFs7gJLWLktSUtbU2bNHObOtXjhU3ks3GJb/H7zq0G1j
 T1oJTvJKAfp9k756DAbXtWYztN6DjJImxkwhO09PJNGvahk6E6eSham84iaeSCu1Q4BT
 LpuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tAc5RKv+WWvf0AVXeW96W8inWeyrC9o7+W9TGpSg+s8=;
 b=4fnjJ7db4TQ6UIpYMdy0SPgru0nL5lk/Oh8oNHvH370SNxQBtxtytTtKSkUIi6vE5Z
 qexjv8bf2Dt2UiFcZVsLiiRrASZ0horF/k12G5VE8XPWvTzx0C0dM2j78l3EUoi2Ye3/
 d5uA0J2kHEec8zfrJAh7K+V2vRUB3ryXlyAubvLF+W6+iR4XrxEG7hfvFEu44AP80h4D
 UaK8OjbEE4kPJ5Iq7Hag+QScKK3XYMXNomyOkowroQ5Vvf23X7Pn+8pWwOT+nyPlNMYo
 8RmGSCHFWFCH7huFydk4CAoUYhb500b4v32EOvG0AUsnN4s7PBo+IqChpyI4FkvPsBcv
 XDcw==
X-Gm-Message-State: AJIora8o8yrWyIi2XFVOFtUjKpiCdvLFALLynhCNuLKRD3mDED2+E3Zg
 u1wTTV9lcfJ28Zf414ZQS3wKUgpsmTI=
X-Google-Smtp-Source: AGRyM1s2PWYRu4hIiUytSMiCQx/5k9YsTGjdy2ZNBioTIxOhR1wYQD6VOkpplBhqGvxIw0TlSQNreA==
X-Received: by 2002:a05:6602:154f:b0:67c:1de0:33b6 with SMTP id
 h15-20020a056602154f00b0067c1de033b6mr349852iow.87.1658126340225; 
 Sun, 17 Jul 2022 23:39:00 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 o12-20020a92a80c000000b002dcd35bb030sm2342604ilh.74.2022.07.17.23.38.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Jul 2022 23:38:59 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com
Subject: [PATCH v3 29/39] dyndbg: add _DPRINTK_FLAGS_ENABLED
Date: Mon, 18 Jul 2022 00:36:18 -0600
Message-Id: <20220718063641.9179-35-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220718063641.9179-1-jim.cromie@gmail.com>
References: <20220718063641.9179-1-jim.cromie@gmail.com>
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
Cc: nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 vincent.whitchurch@axis.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Distinguish the condition: _DPRINTK_FLAGS_ENABLED from the bit:
_DPRINTK_FLAGS_PRINT, and re-define former in terms of latter, in
preparation to add a 2nd bit: _DPRINTK_FLAGS_TRACE

Update JUMP_LABEL code block to check _DPRINTK_FLAGS_ENABLED symbol.
Also add a 'K' to get new symbol _DPRINTK_FLAGS_PRINTK, in order to
break any stale uses.

CC: vincent.whitchurch@axis.com
Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 include/linux/dynamic_debug.h | 10 ++++++----
 lib/dynamic_debug.c           |  8 ++++----
 2 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/include/linux/dynamic_debug.h b/include/linux/dynamic_debug.h
index b50bdd5c8184..38cfdd5c0bdc 100644
--- a/include/linux/dynamic_debug.h
+++ b/include/linux/dynamic_debug.h
@@ -32,7 +32,7 @@ struct _ddebug {
 	 * writes commands to <debugfs>/dynamic_debug/control
 	 */
 #define _DPRINTK_FLAGS_NONE	0
-#define _DPRINTK_FLAGS_PRINT	(1<<0) /* printk() a message using the format */
+#define _DPRINTK_FLAGS_PRINTK	(1 << 0) /* printk() a message using the format */
 #define _DPRINTK_FLAGS_INCL_MODNAME	(1<<1)
 #define _DPRINTK_FLAGS_INCL_FUNCNAME	(1<<2)
 #define _DPRINTK_FLAGS_INCL_LINENO	(1<<3)
@@ -42,8 +42,10 @@ struct _ddebug {
 	(_DPRINTK_FLAGS_INCL_MODNAME | _DPRINTK_FLAGS_INCL_FUNCNAME |\
 	 _DPRINTK_FLAGS_INCL_LINENO  | _DPRINTK_FLAGS_INCL_TID)
 
+#define _DPRINTK_FLAGS_ENABLED		_DPRINTK_FLAGS_PRINTK
+
 #if defined DEBUG
-#define _DPRINTK_FLAGS_DEFAULT _DPRINTK_FLAGS_PRINT
+#define _DPRINTK_FLAGS_DEFAULT _DPRINTK_FLAGS_PRINTK
 #else
 #define _DPRINTK_FLAGS_DEFAULT 0
 #endif
@@ -191,10 +193,10 @@ void __dynamic_ibdev_dbg(struct _ddebug *descriptor,
 
 #ifdef DEBUG
 #define DYNAMIC_DEBUG_BRANCH(descriptor) \
-	likely(descriptor.flags & _DPRINTK_FLAGS_PRINT)
+	likely(descriptor.flags & _DPRINTK_FLAGS_ENABLED)
 #else
 #define DYNAMIC_DEBUG_BRANCH(descriptor) \
-	unlikely(descriptor.flags & _DPRINTK_FLAGS_PRINT)
+	unlikely(descriptor.flags & _DPRINTK_FLAGS_ENABLED)
 #endif
 
 #endif /* CONFIG_JUMP_LABEL */
diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index dd27dc514aa3..2a46c642373a 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -89,7 +89,7 @@ static inline const char *trim_prefix(const char *path)
 }
 
 static struct { unsigned flag:8; char opt_char; } opt_array[] = {
-	{ _DPRINTK_FLAGS_PRINT, 'p' },
+	{ _DPRINTK_FLAGS_PRINTK, 'p' },
 	{ _DPRINTK_FLAGS_INCL_MODNAME, 'm' },
 	{ _DPRINTK_FLAGS_INCL_FUNCNAME, 'f' },
 	{ _DPRINTK_FLAGS_INCL_LINENO, 'l' },
@@ -246,10 +246,10 @@ static int ddebug_change(const struct ddebug_query *query,
 			if (newflags == dp->flags)
 				continue;
 #ifdef CONFIG_JUMP_LABEL
-			if (dp->flags & _DPRINTK_FLAGS_PRINT) {
-				if (!(newflags & _DPRINTK_FLAGS_PRINT))
+			if (dp->flags & _DPRINTK_FLAGS_ENABLED) {
+				if (!(newflags & _DPRINTK_FLAGS_ENABLED))
 					static_branch_disable(&dp->key.dd_key_true);
-			} else if (newflags & _DPRINTK_FLAGS_PRINT) {
+			} else if (newflags & _DPRINTK_FLAGS_ENABLED) {
 				static_branch_enable(&dp->key.dd_key_true);
 			}
 #endif
-- 
2.36.1

