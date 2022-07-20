Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F3FC57BA7A
	for <lists+dri-devel@lfdr.de>; Wed, 20 Jul 2022 17:36:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84C938F5CB;
	Wed, 20 Jul 2022 15:34:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com
 [IPv6:2607:f8b0:4864:20::d2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91A248F49A;
 Wed, 20 Jul 2022 15:33:32 +0000 (UTC)
Received: by mail-io1-xd2c.google.com with SMTP id h145so14543470iof.9;
 Wed, 20 Jul 2022 08:33:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tAc5RKv+WWvf0AVXeW96W8inWeyrC9o7+W9TGpSg+s8=;
 b=Sg4IB9kGmmBPHRzIVUlrlhfbZfKHArauwcu6AiOjsnbSCBHhDwJ0MEUH5PF1c2/o0m
 2RExuMVSQ3Kosf2EGRNdLyl7D5DRoRdvDMEXATj4WDBuiWnPqemVqGDLvZol/Wc33XeE
 AB7Rh/2teOZ3UcCnzwpVWXLyj3NYn3Al4EAuB89kwN+w62KIo5QEYlt1BN6Zt+3WrdvK
 gLKrcdeF/CLMYm3Y1KBps2atZd34BvNsfVc5nQvoecAjKnBsIWh0Qh5m9EJ2gCPENXiW
 Wuj5b+3LlKvzbsd4t6UsSV/t5Nx0SPCXZS1WcDtvWWoy5E5+6jgrEt5FEyBSgvQVPApg
 +mzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tAc5RKv+WWvf0AVXeW96W8inWeyrC9o7+W9TGpSg+s8=;
 b=I5wFfwoAVJkvdkDrFThfY2nSCMm63R8pIR8oyW+m08uTj9Gzz1wqgSStNBl7zskDjI
 c8xb4X15KmM1AL0B69FEanohdFc0lzm63U7AwJkfH3myR/zb0XOVcTmaUP03DqZEod37
 QxtwKcew7ruTUv6PBRLx2ZcPPKCCSIm2NhjlkQ2wDXQZWSYdzwhpSD2VYCsMtNueDejl
 d74Opykbqj6SQtU/IA5FNVERtgNQI0+huxBeODWxJVQ9kt6Lu2Rp5RnLaEWKdHOt1Hjs
 3iViA6YBvOUuYE5RUEHTfZz/mk4bH6BbZGmpBQC1ZkzmONgFEavIjztkxx6ij9EvtJSc
 VAww==
X-Gm-Message-State: AJIora/OJtTcmGrXVK6FI1JvcZUYAVpf4a3ak1KZ9E1g6UWKcA0fa/NR
 Orh0hvso895/ESkiza6hSX0YuuvmYJ+OSQ==
X-Google-Smtp-Source: AGRyM1s3Jwm3E0k9SmEYSdLegsEXyEWU7kImD4jLAgMmt6/vVYvMXfIYEMuIQsTjuYpVq9aQrhwHaA==
X-Received: by 2002:a05:6602:486:b0:678:dad9:e56a with SMTP id
 y6-20020a056602048600b00678dad9e56amr17209191iov.97.1658331210548; 
 Wed, 20 Jul 2022 08:33:30 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 q1-20020a92d401000000b002dcdb4bbe87sm4579581ilm.22.2022.07.20.08.33.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Jul 2022 08:33:30 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 jbaron@akamai.com, gregkh@linuxfoundation.org, daniel.vetter@ffwll.ch,
 seanpaul@chromium.org, robdclark@gmail.com
Subject: [PATCH v4 31/41] dyndbg: add _DPRINTK_FLAGS_ENABLED
Date: Wed, 20 Jul 2022 09:32:23 -0600
Message-Id: <20220720153233.144129-32-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220720153233.144129-1-jim.cromie@gmail.com>
References: <20220720153233.144129-1-jim.cromie@gmail.com>
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
Cc: vincent.whitchurch@axis.com
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

