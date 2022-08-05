Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B89BA58B1D3
	for <lists+dri-devel@lfdr.de>; Fri,  5 Aug 2022 23:56:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F06CA1694;
	Fri,  5 Aug 2022 21:54:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x130.google.com (mail-il1-x130.google.com
 [IPv6:2607:f8b0:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD44412ACB2;
 Fri,  5 Aug 2022 21:54:32 +0000 (UTC)
Received: by mail-il1-x130.google.com with SMTP id p9so732939ilq.13;
 Fri, 05 Aug 2022 14:54:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=EnuR+keQjXA7ZwTiZJLhSmBlKaThlIrTj1y/b6sKDaY=;
 b=WV0zPfyg/e+rsqNwIWECvFc+AIdD4kBWBYrI3REAb15JmdHrO7Z4sZ+8Y98wIfVcNp
 6H4OUpTUflLeUpZqHc0qKyj0AuCamG+jV3B+T0/IcTG3KqfFKlTp7WK+FQaO1fOBKa+p
 fB+CyTyxfUEXySNwKwJ5RqkFU6dIOyNkirVrBk4EqcO2wEZBH8yvNpU0DCVkDsEZeH11
 BilrfS+JrpJV2XJlPcXEcafAT4MH4qkjF6J/6NuQxClOqon/i4Y6Sr4CHnI59ALSTq2u
 Zip4eCTxKfWCTC9KjWBePNFD9XrebuEVPMvsv6WMddjhuXe+NxkM0z/jJMAuoVnkY4Bg
 OBzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=EnuR+keQjXA7ZwTiZJLhSmBlKaThlIrTj1y/b6sKDaY=;
 b=TTPP5FUGQ6vrAjgM3hwnioGw94dX52KsZSqp11d3S0vB55nqZQHfVWmofsEpiwXsi4
 OpXfFdym04HF2UaI8eF26gODBCs93QKxJs/zBtGTzM985yUpqibl+dWqrMvwgeCNsNDL
 tL6POwwU/709OV/ICrjR14FpIvPj6fLVKfPeuZVJV4doCoHTuuINhC/jhQnvN3Fp5zfu
 V/9KopZhIxEnNyWOMsO/Atz8ODLaE6b2tC4THi/MyUmF9j5/YoVo+Ns+N2lmZ4D45z18
 64ABC+WPqjhp6UH3ZLhMk43rqS9yDomASanUiUXN5LglFMS2w3u5VTCx0jWzM3OxC1MD
 i2iQ==
X-Gm-Message-State: ACgBeo0l+9xl/9f7J7HouQASV2MntNtViw8n3YWujSvRA2mcXMN+qOff
 QVB84nFZNVgQvw6QYk2Gczg=
X-Google-Smtp-Source: AA6agR7RQl6/i8GZ2VkpSGkaEeOT5qr6Gt8uEvpPBs6KmrImmuonAI1Jpb/Qf/zJbkDoHLbSiMTXzA==
X-Received: by 2002:a05:6e02:1a07:b0:2de:9742:a426 with SMTP id
 s7-20020a056e021a0700b002de9742a426mr4136925ild.274.1659736471616; 
 Fri, 05 Aug 2022 14:54:31 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 e12-20020a056602044c00b0067c09fd0b53sm1765532iov.21.2022.08.05.14.54.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Aug 2022 14:54:31 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, jbaron@akamai.com,
 gregkh@linuxfoundation.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-arm-msm@vger.kernel.org
Subject: [PATCH v5 10/33] dyndbg: cleanup local vars in ddebug_init
Date: Fri,  5 Aug 2022 15:53:32 -0600
Message-Id: <20220805215355.3509287-11-jim.cromie@gmail.com>
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

rework var-names for clarity, regularity
rename variables
  - n to mod_sites - it counts sites-per-module
  - entries to i - display only
  - iter_start to iter_mod_start - marks start of each module's subrange
  - modct to mod_ct - stylistic

new iterator var:
  - site - cursor parallel to iter
    this allows 'demotion' of iter->site (for removal later)

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
2.37.1

