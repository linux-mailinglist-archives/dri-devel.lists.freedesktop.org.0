Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E5B557BA35
	for <lists+dri-devel@lfdr.de>; Wed, 20 Jul 2022 17:35:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF3AA8F48E;
	Wed, 20 Jul 2022 15:33:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x12f.google.com (mail-il1-x12f.google.com
 [IPv6:2607:f8b0:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23E0F8EF80;
 Wed, 20 Jul 2022 15:33:06 +0000 (UTC)
Received: by mail-il1-x12f.google.com with SMTP id i5so2085704ila.6;
 Wed, 20 Jul 2022 08:33:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FoeJSfQYjtngvo4HHZBab6bwAds3V3lbp5eX2URtnSI=;
 b=Y5HEVETahfPBl0XuDwNcpwbhDtxLka2FBUl1Z72oJMgVTwzrLu8aGTIJII/PLLLWOt
 IEzaoJWuVneUEwYdvIn8hzksyGwpo8HcQB5gXRO3IWmdpJ5N6RgL/wzKfK0Ti6+E9FME
 WW+N6YnAzvRTUnmgFu9UoAUHMQEn4GumKs6lF56PlnClB+//8PlihsT7Vj3XIPRL7K8z
 P5oPirbf8NnIYbDQbM3fh+QLpAqOpHduxnBzkRch4+qnPvetAvWmLIq7kDtzM/+LlE/8
 R9CKpQs7yTJYiJsgngEkktYlbXkNyagr3m3t7QKq1sjtM69CWpnosSkqjNlOi5YxBEUS
 UtRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FoeJSfQYjtngvo4HHZBab6bwAds3V3lbp5eX2URtnSI=;
 b=DUPJmqJOWcYKJdJEzp+/1sSbzV1yG8ws6Y9j6g3RV4S9JYHNt2di8RHwyykjKLr3XH
 2HqtYGHiNmeZmI6KOEtq6hN0KCB5z20i17zp3VniUanhyINGbAIPDSLS5s4qAapJ5Git
 Ca8GtBUGb6H2yqggTWrO0Nn9oMoh0dx8ZJiXksI3KhuNATxH7OTFQmGJ6gMBGJOE+xoP
 pa7iRwVCpvytgMUQwMm/2X0RV1j4qp3rAeXt17GYMrrfxNmf77HUMI4GlAMn90/siJBV
 W565v4TW3OChMp8YbnMxXB+5O1YG9ZBFZtr68gE7FDE6Der/uxrnqi+/3B6s/GngPvLE
 Iycg==
X-Gm-Message-State: AJIora9fCkOSKkZ/KlVjf0rLux1MYBvsIEZsyqu9xEr1RmKGATwi2wix
 w/40ygKQHoE8ZqvdcBy/xH4tw6xFy9Kudg==
X-Google-Smtp-Source: AGRyM1vQFjF1U+du0qqojqZ58ujUSrOID0TD0O2Q+WyDu8O1EdEbRTeqyziPe+0d2bXVupAt9xeSyA==
X-Received: by 2002:a05:6e02:1405:b0:2da:c72f:e3a7 with SMTP id
 n5-20020a056e02140500b002dac72fe3a7mr19021150ilo.113.1658331184363; 
 Wed, 20 Jul 2022 08:33:04 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 q1-20020a92d401000000b002dcdb4bbe87sm4579581ilm.22.2022.07.20.08.33.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Jul 2022 08:33:04 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 jbaron@akamai.com, gregkh@linuxfoundation.org, daniel.vetter@ffwll.ch,
 seanpaul@chromium.org, robdclark@gmail.com
Subject: [PATCH v4 07/41] dyndbg: let query-modname override actual module name
Date: Wed, 20 Jul 2022 09:31:59 -0600
Message-Id: <20220720153233.144129-8-jim.cromie@gmail.com>
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

dyndbg's control-parser: ddebug_parse_query(), requires that search
terms: module, func, file, lineno, are used only once in a query; a
thing cannot be named both foo and bar.

The cited commit added an overriding module modname, taken from the
module loader, which is authoritative.  So it set query.module 1st,
which disallowed its use in the query-string.

But now, its useful to allow a module-load to enable classes across a
whole (or part of) a subsystem at once.

  # enable (dynamic-debug in) drm only
  modprobe drm dyndbg="class DRM_UT_CORE +p"

  # get drm_helper too
  modprobe drm dyndbg="class DRM_UT_CORE module drm* +p"

  # get everything that knows DRM_UT_CORE
  modprobe drm dyndbg="class DRM_UT_CORE module * +p"

  # also for boot-args:
  drm.dyndbg="class DRM_UT_CORE module * +p"

So convert the override into a default, by filling it only when/after
the query-string omitted the module.

NB: the query class FOO handling is forthcoming.

Fixes: 8e59b5cfb9a6 dynamic_debug: add modname arg to exec_query callchain
Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 lib/dynamic_debug.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index e5cbe603000c..5a849716220a 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -385,10 +385,6 @@ static int ddebug_parse_query(char *words[], int nwords,
 		return -EINVAL;
 	}
 
-	if (modname)
-		/* support $modname.dyndbg=<multiple queries> */
-		query->module = modname;
-
 	for (i = 0; i < nwords; i += 2) {
 		char *keyword = words[i];
 		char *arg = words[i+1];
@@ -429,6 +425,13 @@ static int ddebug_parse_query(char *words[], int nwords,
 		if (rc)
 			return rc;
 	}
+	if (!query->module && modname)
+		/*
+		 * support $modname.dyndbg=<multiple queries>, when
+		 * not given in the query itself
+		 */
+		query->module = modname;
+
 	vpr_info_dq(query, "parsed");
 	return 0;
 }
-- 
2.36.1

