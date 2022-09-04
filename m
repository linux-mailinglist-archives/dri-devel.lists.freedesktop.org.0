Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DC3555AC6E1
	for <lists+dri-devel@lfdr.de>; Sun,  4 Sep 2022 23:44:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5161C10E240;
	Sun,  4 Sep 2022 21:42:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com
 [IPv6:2607:f8b0:4864:20::d34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DF6210E13C;
 Sun,  4 Sep 2022 21:42:17 +0000 (UTC)
Received: by mail-io1-xd34.google.com with SMTP id b142so5642068iof.10;
 Sun, 04 Sep 2022 14:42:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=ysIiIQDuG3NPX9ftczW4ZGg58gUBI4jeSANScS140gM=;
 b=APgxhuRWpHrA5EiAcM6bPTAJX5sVjnKO8ZXN2+OQbTnNZthJ6+91rd6qMlpfQu96tK
 kU7buxw62MArc4SqmHlqi7ZnRepiJzi2ZjfY0l2reZS4c+bENNXL+q4MBcG6kmRIBJDg
 zjOTRGcunIJUea9k7GCkxnFakIoXTx5p4Q3YZsvD2JZKGgVLIqCxlvTVr6lLWopOQ5jg
 tM6aObbyHfQt4hKC15wVu4dtKTl7xSjSAHhGJrPEG7cERNokHi0L0ifYgGVAskmds7W2
 JuY57ATFtM+4aknCtkIxF/AXoHBg+QwEAv3LIU8kjqNqvJGhCXZbCxBDuxpyjqad4Plp
 4+iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=ysIiIQDuG3NPX9ftczW4ZGg58gUBI4jeSANScS140gM=;
 b=xxAh/p4UZJBypJZqqY73gzFANse80LflCsSkIrGHz1qL8U4cp5wnl8bUt1E1kiGV6y
 A1jifzp7w17bodu9KiRao1VV9WZQKfJUpyeiHrbMtA79kZrFlc7O5YO2KxNficVSO2Uz
 /j4dJGycKHNyGQf80NQWqcKXyH+ahUrHYYmrvjWV7xm3kpeyhHd+ZyElvZHSufstD3N5
 euXn9H7Q/Z6kskf/1aT2GFZ0AuRiNy5hb+M1VrPEgzuXkdvc80m4+bj6ytbr92j+NYjo
 Z9PfXEZEpaCGCj7IZLDzJ2pdztM/KVjy7o9XZiqeb4sP/SzRbK2wh7EnSMEs8qyvmB7F
 ZJmQ==
X-Gm-Message-State: ACgBeo1ZmE9n0Ohegy9JTFlPTNbiYVMJIO9ZQBccJ9RKoI146+YuoBui
 vYQVoyhHcBwH2OVXp5Lw+nDH5E9qb5M=
X-Google-Smtp-Source: AA6agR6afjzcErCVofVv8IgSNBB83b3vDq9Bdzagkl5cWOw7B+80htmvEYKRocJbPU12He1vQEZnCg==
X-Received: by 2002:a05:6602:2b81:b0:688:b897:13b8 with SMTP id
 r1-20020a0566022b8100b00688b89713b8mr21276933iov.43.1662327735766; 
 Sun, 04 Sep 2022 14:42:15 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 e12-20020a056602044c00b006889ea7be7bsm3727688iov.29.2022.09.04.14.42.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Sep 2022 14:42:15 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, gregkh@linuxfoundation.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v6 06/57] dyndbg: use ESCAPE_SPACE for cat control
Date: Sun,  4 Sep 2022 15:40:43 -0600
Message-Id: <20220904214134.408619-7-jim.cromie@gmail.com>
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

Acked-by: Jason Baron <jbaron@akamai.com>
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
2.37.2

