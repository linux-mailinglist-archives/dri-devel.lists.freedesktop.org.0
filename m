Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A7F957BA10
	for <lists+dri-devel@lfdr.de>; Wed, 20 Jul 2022 17:34:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53E878F4BD;
	Wed, 20 Jul 2022 15:33:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com
 [IPv6:2607:f8b0:4864:20::d2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27B618EE21;
 Wed, 20 Jul 2022 15:33:05 +0000 (UTC)
Received: by mail-io1-xd2b.google.com with SMTP id 125so14556038iou.6;
 Wed, 20 Jul 2022 08:33:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=A6KV4Yr3V4yuuH339Tx2aFB9MqcN4deLUMaEAUIDYPE=;
 b=ljJGguNYdzxwliGDHO25qtJ7jl001/i8YC68RT72qz6hZiDbL6evwhZErqKVX8ap4i
 8cnP+VAK+jzSk5q1AvyQ0TZug9W3sMz/28CISJhYvwbGCrVnQj4DlY1MPRQBxFo7TdNX
 XhEaCPATtEsmuHS20InSzMW8DNgIAOgZwHOdUJYGWqlWP33gS9z6QUKoDOXtYmt5EhTQ
 TOIO6w3+SUhMfE7/7tQUmzTfmhxEaZyIwIjPMwhdg5wd6m5fHnxYbsiyq+TgAiCz+7dH
 w0e+huU9fkFmNIdlxpOyRnyuc9g1C9gougLJU4hiHTAeKw3Wl1ptJTsmyQhOBtlbNPle
 1Jtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=A6KV4Yr3V4yuuH339Tx2aFB9MqcN4deLUMaEAUIDYPE=;
 b=WuBs1Empqgf5ZwSiESeBRy5Sh23lwLWS3pdkSEa0UlnwefyBaU9gp+U8wMUergPbQk
 V7z/COD551qeUtOHnsbkodvCGV5Pkri+qAXWZig5KsJxJKZUX6q7nmE3JzJgsAhfRzso
 HXTYpN6oavaS9HRYGUACaik/CRzPeDtqliGfiofPGprgFnZEKArp4/kIvOMrXfWpmNvr
 3J1xoHhKjV25/DcaXfNG/YgZkuiLM/JJgAoGSQs1lRAeelehH768X329yQSQpspjDKam
 Nhwf6Ivgjp3tAjlIG69SKne0aHtRVTgzWgIcjljH7tAOJ5Bnr1kr7SOji3Yv3+SguJKj
 PkhA==
X-Gm-Message-State: AJIora/Tg6RNiZilWZdOobebpDkyFglSTYGcNyLEHJxooNsCXwJNZZzJ
 VfvOYNy6FrJcDJWTs6HkWPUlNQo7mIuN5g==
X-Google-Smtp-Source: AGRyM1v7DUkk4EHmeKhjWlh5biZ93mNX5sA47PTufiNg61QMlCQIg8RbUGyENSV/FwOYHMvBT7b17g==
X-Received: by 2002:a05:6638:1907:b0:33f:50c0:a870 with SMTP id
 p7-20020a056638190700b0033f50c0a870mr19803125jal.154.1658331183445; 
 Wed, 20 Jul 2022 08:33:03 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 q1-20020a92d401000000b002dcdb4bbe87sm4579581ilm.22.2022.07.20.08.33.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Jul 2022 08:33:03 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 jbaron@akamai.com, gregkh@linuxfoundation.org, daniel.vetter@ffwll.ch,
 seanpaul@chromium.org, robdclark@gmail.com
Subject: [PATCH v4 06/41] dyndbg: use ESCAPE_SPACE for cat control
Date: Wed, 20 Jul 2022 09:31:58 -0600
Message-Id: <20220720153233.144129-7-jim.cromie@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

`cat control` currently does octal escape, so '\n' becomes "\012".
Change this to display as "\n" instead, which reads much cleaner.

   :#> head -n7 /proc/dynamic_debug/control
   # filename:lineno [module]function flags format
   init/main.c:1179 [main]initcall_blacklist =_ "blacklisting initcall %s\n"
   init/main.c:1218 [main]initcall_blacklisted =_ "initcall %s blacklisted\n"
   init/main.c:1424 [main]run_init_process =_ "  with arguments:\n"
   init/main.c:1426 [main]run_init_process =_ "    %s\n"
   init/main.c:1427 [main]run_init_process =_ "  with environment:\n"
   init/main.c:1429 [main]run_init_process =_ "    %s\n"

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 lib/dynamic_debug.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index 8ff11977b8bd..e5cbe603000c 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -900,7 +900,7 @@ static int ddebug_proc_show(struct seq_file *m, void *p)
 		   trim_prefix(dp->filename), dp->lineno,
 		   iter->table->mod_name, dp->function,
 		   ddebug_describe_flags(dp->flags, &flags));
-	seq_escape(m, dp->format, "\t\r\n\"");
+	seq_escape_str(m, dp->format, ESCAPE_SPACE, "\t\r\n\"");
 	seq_puts(m, "\"\n");
 
 	return 0;
-- 
2.36.1

