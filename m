Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 259DF58B1CD
	for <lists+dri-devel@lfdr.de>; Fri,  5 Aug 2022 23:56:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1ABEA14BD;
	Fri,  5 Aug 2022 21:54:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x12c.google.com (mail-il1-x12c.google.com
 [IPv6:2607:f8b0:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F004A12A9F5;
 Fri,  5 Aug 2022 21:54:27 +0000 (UTC)
Received: by mail-il1-x12c.google.com with SMTP id b12so1975509ils.9;
 Fri, 05 Aug 2022 14:54:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=J+XMFiNX/q3LQYLLDUo59QkX1sLIyVqPUPsR4ifBrfo=;
 b=a3pE4rSuZD6ro/cAPZ0Z73WjsYUoQsEAbwyUOAqkxPwqOML8IMtCRzyMMjE6ZCJJCH
 4scGqqJcV3JdotbBSmD47jk7lpKPscKlF7ejCkueKNDZc62M5x6RByzui6UXS/yrhEB/
 Ma9VANyVI7k0Kt+62fIgtMkwlry0TtsgYx+JzzmG7zLU3gOw8u6v8GVHIOxS78S6ySuJ
 yQedjpXdXviU2c0CtSvX8JSMMrEMC2fuCmCJ3zZs+/tekpoFMtppdOD1KBHt6WoE6wSl
 TqyEco90VmD806y4HavPugyYKbr4gmKWihAk17UiplBB9FsIctcOWsPeNGNljMqQiUYj
 Ds8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=J+XMFiNX/q3LQYLLDUo59QkX1sLIyVqPUPsR4ifBrfo=;
 b=7aTbFk4hg14t1a0IndEcopuxYWgX9lmehm5KDNBdgshEdbO7enEc/EzW5ejl5zUq+f
 xf0O4dEp1LsU+7XkLy5Pb+7xVJc+xuHtwVQlkNk1LphE9XRIFdSeK9KrUl2KQLovAitx
 CRuODPaQM6pWo2HzmiLXuPMg0GejuQ2KhJIO3HGlGGlHjH5f1+rCqHzD+44iOBy39tvW
 vVqlH8ZpMO3CVOpzoc9oiRuk+FV+AXxrki6xyEbBBANpLK+Ifjl9oNPPc3Yl6PoqFrlN
 2njKoSDgs48E7TIADmw2NHgjg053BkElqEMCsfYVX2D8QAZ1NBIZnXYHe3HHcxxZf8XK
 ai+w==
X-Gm-Message-State: ACgBeo19oeODq/cdb2Z7K5F+SKRBKVrTZDYB6w3w4eWONEfbXrjYRxMr
 uaQm93DDekEyRA8yFTSE8dHYPxm5INro2A==
X-Google-Smtp-Source: AA6agR61kurKmG2CZ4QJXTnktlt/717WlcXUXKttKGA+qVbP2Lsxbsku+CON2rmb9ab1kZ1VnYNO8w==
X-Received: by 2002:a05:6e02:180a:b0:2de:20c8:572 with SMTP id
 a10-20020a056e02180a00b002de20c80572mr3819308ilv.213.1659736467233; 
 Fri, 05 Aug 2022 14:54:27 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 e12-20020a056602044c00b0067c09fd0b53sm1765532iov.21.2022.08.05.14.54.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Aug 2022 14:54:26 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, jbaron@akamai.com,
 gregkh@linuxfoundation.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-arm-msm@vger.kernel.org
Subject: [PATCH v5 06/33] dyndbg: use ESCAPE_SPACE for cat control
Date: Fri,  5 Aug 2022 15:53:28 -0600
Message-Id: <20220805215355.3509287-7-jim.cromie@gmail.com>
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
Acked-by: Jason Baron <jbaron@akamai.com>
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
2.37.1

