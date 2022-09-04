Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C7FD5AC6DB
	for <lists+dri-devel@lfdr.de>; Sun,  4 Sep 2022 23:44:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A665A10E133;
	Sun,  4 Sep 2022 21:42:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com
 [IPv6:2607:f8b0:4864:20::d31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3479510E134;
 Sun,  4 Sep 2022 21:42:21 +0000 (UTC)
Received: by mail-io1-xd31.google.com with SMTP id d68so5628836iof.11;
 Sun, 04 Sep 2022 14:42:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=JzdXJQgZbXW3FjxRfc8LeNnI2jIQsEPwZbCx/pElNeM=;
 b=FUv8NBMgLulwhhEoMyLnxfYB3+uPNeLFEo5/TLMiSZjR94roddKbiqTTG31unDiBV2
 koej5AIOTpgc4Fj75xhV1jWGKl/5CM8q7EieivOlV5/b+BYdXa9pALtMLQe6QZEuohs8
 uc4jHbPW01pKLaccj4L/SBD9SF3hrWMDpeLoGgRrvCEUQKX8JmTlITp0J8QvdPavHfqS
 KpCN89/psw628tV7ylJY71laqV2x/K4y1PPoettY5lY6Kg7pmI05/DzTkiDbBqcz1dnc
 NsgFPB4IEgajS8Toc7/PVXqE2pPIC6p3Ibe6XKVfl3deYBS708mMbxWmh4z8Z7N8CYIi
 UccQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=JzdXJQgZbXW3FjxRfc8LeNnI2jIQsEPwZbCx/pElNeM=;
 b=d4S2pnbdzUOoPKcZncPHOSSHUvWo/+KbanleMYrdWSW3P8zHEdmkgxQDlTyvuTQHqf
 vLM+4Sj+rGPPnAIr/mUb95gdKrF7c/AZmdSI1G5f0ZfFZRpK3Pd+87AQLb3/1ol8YCgx
 OsfQypMtJ4nGvq72mB0Kbr0QsjgS3HwyL3kSxN0lQMadm+/0iAd99QkxX5Xe9AH7yUGy
 xcT9wt0V3fLlGRPheLYMaGXfWw05nbytSfuuSMRgkz+iMHZKk5lmxCXdq5AYmw1KmA3n
 5AtkrZ/hdISL5/8whQiq0bUyB2Q6c/yivW/NehlswPW0VqZOiMpK5bIhOqePoDp4EtNd
 9WUg==
X-Gm-Message-State: ACgBeo0VeZ0v5MFjtI36CfpUbPk4o/v0icWZCu3XhV+P7TH/QciNaNek
 /V4+or3JAl41IGqDHTNASYQ=
X-Google-Smtp-Source: AA6agR69LwdoHmp66Z3rxXxBJJ0Vec0ZLNH/n+zC6VNVydFgIRnTRHkjqAX0L8kf28KEk70mHqw2jw==
X-Received: by 2002:a5e:8414:0:b0:689:e3c:308a with SMTP id
 h20-20020a5e8414000000b006890e3c308amr21338651ioj.29.1662327739611; 
 Sun, 04 Sep 2022 14:42:19 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 e12-20020a056602044c00b006889ea7be7bsm3727688iov.29.2022.09.04.14.42.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Sep 2022 14:42:19 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, gregkh@linuxfoundation.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v6 10/57] dyndbg: cleanup auto vars in dynamic_debug_init
Date: Sun,  4 Sep 2022 15:40:47 -0600
Message-Id: <20220904214134.408619-11-jim.cromie@gmail.com>
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

rework var-names for clarity, regularity
rename variables
  - n to mod_sites - it counts sites-per-module
  - entries to i - display only
  - iter_start to iter_mod_start - marks start of each module's subrange
  - modct to mod_ct - stylistic

new iterator var:
  - site - cursor parallel to iter
    1st step towards 'demotion' of iter->site, for removal later

treat vars as iters:
  - drop init at top
    init just above for-loop, in a textual block

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 lib/dynamic_debug.c | 33 +++++++++++++++++----------------
 1 file changed, 17 insertions(+), 16 deletions(-)

diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index e96dc216463b..2e8ebef3bd0d 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -1059,11 +1059,10 @@ static int __init dynamic_debug_init_control(void)
 
 static int __init dynamic_debug_init(void)
 {
-	struct _ddebug *iter, *iter_start;
-	const char *modname = NULL;
+	struct _ddebug *iter, *iter_mod_start;
+	int ret, i, mod_sites, mod_ct;
+	const char *modname;
 	char *cmdline;
-	int ret = 0;
-	int n = 0, entries = 0, modct = 0;
 
 	if (&__start___dyndbg == &__stop___dyndbg) {
 		if (IS_ENABLED(CONFIG_DYNAMIC_DEBUG)) {
@@ -1074,30 +1073,32 @@ static int __init dynamic_debug_init(void)
 		ddebug_init_success = 1;
 		return 0;
 	}
-	iter = __start___dyndbg;
+
+	iter = iter_mod_start = __start___dyndbg;
 	modname = iter->modname;
-	iter_start = iter;
-	for (; iter < __stop___dyndbg; iter++) {
-		entries++;
+	i = mod_sites = mod_ct = 0;
+
+	for (; iter < __stop___dyndbg; iter++, i++, mod_sites++) {
+
 		if (strcmp(modname, iter->modname)) {
-			modct++;
-			ret = ddebug_add_module(iter_start, n, modname);
+			mod_ct++;
+			ret = ddebug_add_module(iter_mod_start, mod_sites, modname);
 			if (ret)
 				goto out_err;
-			n = 0;
+
+			mod_sites = 0;
 			modname = iter->modname;
-			iter_start = iter;
+			iter_mod_start = iter;
 		}
-		n++;
 	}
-	ret = ddebug_add_module(iter_start, n, modname);
+	ret = ddebug_add_module(iter_mod_start, mod_sites, modname);
 	if (ret)
 		goto out_err;
 
 	ddebug_init_success = 1;
 	vpr_info("%d prdebugs in %d modules, %d KiB in ddebug tables, %d kiB in __dyndbg section\n",
-		 entries, modct, (int)((modct * sizeof(struct ddebug_table)) >> 10),
-		 (int)((entries * sizeof(struct _ddebug)) >> 10));
+		 i, mod_ct, (int)((mod_ct * sizeof(struct ddebug_table)) >> 10),
+		 (int)((i * sizeof(struct _ddebug)) >> 10));
 
 	/* now that ddebug tables are loaded, process all boot args
 	 * again to find and activate queries given in dyndbg params.
-- 
2.37.2

