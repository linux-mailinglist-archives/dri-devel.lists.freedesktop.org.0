Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18AD7577B3E
	for <lists+dri-devel@lfdr.de>; Mon, 18 Jul 2022 08:38:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40596A9CA5;
	Mon, 18 Jul 2022 06:38:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com
 [IPv6:2607:f8b0:4864:20::d2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 609CBA9C82;
 Mon, 18 Jul 2022 06:38:25 +0000 (UTC)
Received: by mail-io1-xd2c.google.com with SMTP id p81so8561647iod.2;
 Sun, 17 Jul 2022 23:38:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FoeJSfQYjtngvo4HHZBab6bwAds3V3lbp5eX2URtnSI=;
 b=X2f6sCQ2JRSk+fUJO7Nra8A1HMfSqGlt50uTDYJIxRDm3NOLuOYBhNjeieRDWfJ8kT
 lmgtv7TqzyfD9s4Ddw3sx33rx084kmxt0Y54swOyyxqw4xht1DCXTZbH8aN8On/WnmK+
 pHoZ5MqA5fveqY6EuMEwvTPEUEMzGBSEXrPfJYqa1gZlOgNnUxb06More6ouP3sMmQU5
 XI0NcPaQr42/zf9mWH9L72JSvwHqe6AZqISlLDT0ZwfSnv2rFGqUbgiVIBKgkmT4DSya
 PrfLMPhza9CzdxoCX9/behOKPV83ig3WKFvW+VSK1/oLsW8K0nrKPCBWNk3QRvFFk7n6
 ZIeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FoeJSfQYjtngvo4HHZBab6bwAds3V3lbp5eX2URtnSI=;
 b=63AgF6sQ/4PEa9AuXXaljoj8/dPT890mLw8e3OzJ6Kt6Oohfy4j6uW9Yif0PGT/wvM
 5URHLROOvbo3NjDXALOSennF7txZWZclOPJvPk3sH+MM+L9tzk0wZSqCGZqBa6+uMitf
 Hk/hSEwZT3ZO9LguaiUy4u+EhX3Kg21IsCN9TuoYIKmmYD6cLjwg1sEMxXpTeQkYf4Xt
 IuK7fcoRFu8TB6FxVrZJGBnEw80Q5t+OyOjh3FIKFUz4OsyGAWM3vSIn7p6Ht+q04coO
 W2Ry0865/O3G1mzegAn6D3IKPFqYdRG1pDgZ2OLI/wcIsLWo77Sg68sW/v8lI6jWkLzE
 lvBA==
X-Gm-Message-State: AJIora+IucsiSSIozjrgFS0bJRjh02rIqx9DhNlLda+XNdTJ3OArmydv
 v8+qd9MBvPLHfSc2VCo0Bcr06zvtvpk=
X-Google-Smtp-Source: AGRyM1sJWv/v1SiTswsiqDJid+8tng0kQ4djmligdCecd3CMIBbROr2frroe0rHfQVMtf45Ph7MMSQ==
X-Received: by 2002:a02:9384:0:b0:33f:4f23:f268 with SMTP id
 z4-20020a029384000000b0033f4f23f268mr13052051jah.213.1658126304656; 
 Sun, 17 Jul 2022 23:38:24 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 o12-20020a92a80c000000b002dcd35bb030sm2342604ilh.74.2022.07.17.23.38.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Jul 2022 23:38:24 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com
Subject: [PATCH v3 07/41] dyndbg: let query-modname override actual module name
Date: Mon, 18 Jul 2022 00:35:51 -0600
Message-Id: <20220718063641.9179-8-jim.cromie@gmail.com>
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
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
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

