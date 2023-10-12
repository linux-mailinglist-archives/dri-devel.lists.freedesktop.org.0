Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 467387C746A
	for <lists+dri-devel@lfdr.de>; Thu, 12 Oct 2023 19:22:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EB2910E54F;
	Thu, 12 Oct 2023 17:22:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com
 [IPv6:2607:f8b0:4864:20::d35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3933010E546;
 Thu, 12 Oct 2023 17:22:00 +0000 (UTC)
Received: by mail-io1-xd35.google.com with SMTP id
 ca18e2360f4ac-79fa7e33573so47578639f.0; 
 Thu, 12 Oct 2023 10:22:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1697131319; x=1697736119; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mLvXeLnsRUQ3/TUrQnBU04ibB7JIWTVa6JOjlgQ9hVM=;
 b=eBBQJkU5Kjh5hwWCGhmLFatrk80h2gBgbRNXydkO8qHF7pLsRsiud6CQM8XnMslS+p
 QAHrRmftWzGzNJ5wCF5I8zktKziBdlo9BEDNBZen17M8bmP3O8jVemkWyseaXf+HudMB
 /rnS1TNUPGGXWa997ugPYq/HlJNk2fQD0TEw/Pt7jUjGTWMbh+P2nQALjG9RxFFr7EJU
 QpS2IBDibOKPiOJu5BCkd1cYqcVUT7GTyO8oAskoU12UxcjINhplE1fWWpclh+wGQLz7
 Fon6sW55def8f/SBWNYDZ7zIrDwgVHSEgk1NrYiqXUwWEnMlTvo7w/0g2N+ABVtkciuh
 gbgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697131319; x=1697736119;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mLvXeLnsRUQ3/TUrQnBU04ibB7JIWTVa6JOjlgQ9hVM=;
 b=ejq/Cd8OTCeg+0TiBhVeKrHt2+CJDC+fW/6D1XZwj9P3aNqTkIc9IqfHnu+7/2zvc7
 VffARxBRRIdP1btjXAkVcK8pd9bi+9s2SEm8/NoHhMPZ3NE6FFAyshxLWKnI7FJ2qKr8
 YXsyjPGEoJnvng7Ysxx1CUchzDQrRaNPejt0AT4TPdSj3FzUaJIIr4s4RiU9CfdzYFaT
 cGtvdpTGgr1oEZ/j5U2Pda2YMFWNoctzxrRFtHjwhIOvkYLs7sw/oHl/OswXTUgnU1Ku
 doQg0DXHUPWpkf1sXoltTlRhF0eArOWM2FM8eQi19bLK47ZUzgyNpstAqJmzndQ+/o7r
 kIDg==
X-Gm-Message-State: AOJu0YwRiSWAJ3Ofv35/D8M9TwYX7HVGXuQbWLiacfKPIipj5jkTfvHG
 I596HL/WbRTJqW00Y9kijF8=
X-Google-Smtp-Source: AGHT+IE2tJWSIJx2OKiUKOKA8OGPuZNoC8ZMOC/9GzKy2gHun+n4J8zu0A2UicwUk/2jPgQyNDrSRw==
X-Received: by 2002:a5e:dd0d:0:b0:786:7100:72de with SMTP id
 t13-20020a5edd0d000000b00786710072demr25476578iop.16.1697131319452; 
 Thu, 12 Oct 2023 10:21:59 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 r25-20020a028819000000b0043cef0711c1sm3992211jai.158.2023.10.12.10.21.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Oct 2023 10:21:59 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, jbaron@akamai.com,
 gregkh@linuxfoundation.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Subject: [PATCH v7 12/25] dyndbg: reduce verbose=3 messages in
 ddebug_add_module
Date: Thu, 12 Oct 2023 11:21:23 -0600
Message-ID: <20231012172137.3286566-13-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231012172137.3286566-1-jim.cromie@gmail.com>
References: <20231012172137.3286566-1-jim.cromie@gmail.com>
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
Cc: groeck@google.com, linux-doc@vger.kernel.org, jani.nikula@intel.com,
 daniel.vetter@ffwll.ch, yanivt@google.com, seanpaul@chromium.org,
 bleung@google.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The fn currently says "add-module", then "skipping" if the module has
no prdbgs.  Just check 1st and return quietly.

no functional change

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 lib/dynamic_debug.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index 8beb98a831f5..45870a699507 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -1242,11 +1242,10 @@ static int ddebug_add_module(struct _ddebug_info *di, const char *modname)
 {
 	struct ddebug_table *dt;
 
-	v3pr_info("add-module: %s.%d sites\n", modname, di->num_descs);
-	if (!di->num_descs) {
-		v3pr_info(" skip %s\n", modname);
+	if (!di->num_descs)
 		return 0;
-	}
+
+	v3pr_info("add-module: %s %d sites\n", modname, di->num_descs);
 
 	dt = kzalloc(sizeof(*dt), GFP_KERNEL);
 	if (dt == NULL) {
-- 
2.41.0

