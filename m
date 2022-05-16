Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32CE8529430
	for <lists+dri-devel@lfdr.de>; Tue, 17 May 2022 00:57:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 056EE10ECF9;
	Mon, 16 May 2022 22:57:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com
 [IPv6:2607:f8b0:4864:20::d29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FF1510ECF9;
 Mon, 16 May 2022 22:57:13 +0000 (UTC)
Received: by mail-io1-xd29.google.com with SMTP id s23so17572216iog.13;
 Mon, 16 May 2022 15:57:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bt4oL+4NDueQ7IK1/UaXo6CBgL/asEIgenKpiK57T5o=;
 b=p80yQOTShj3uaqG5IpCE93ONCxQVqEljr+raFPdtHx7yza8I7Auwkg5j2bxHF4QmZX
 7hDsop8LQgJklHsh5NkBvkY/Vv8QLfXg5SzbSHGjtdLtbZS6bge7Mfp37N/nQDAHXOHM
 DPSmpfdT+xo8fvilpnKL0BCPW7hwI/SSmleqzr8ho7kXo3B0ASzSYnKK0mMYayL9WCYn
 cBZ3uQMTJeKfIA+aCsijIrndP9wv2WrojahrrzikMZAaomnxQM3ix8Zh+kdX6NUgSMFq
 Oo3etlEqkzn/ITkV3Vhx1R+9yMgYpJtQWoPPh3lpxfowVmBH/+IwqUvtVbCpN1Ioe4Gs
 YaHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bt4oL+4NDueQ7IK1/UaXo6CBgL/asEIgenKpiK57T5o=;
 b=jxxak5YU7VNlAESUAPZRBMN79fpFBB6/N4Z/RSFQjbTq6Wneg1EPk6nQyQcolpkGeM
 ormlVacNOem8w319KzH0bDoyOuoK7KdKFpANb0flhMxdvmGyNJvLAujN3AbbjnENbEDo
 Dief01wuo+KwcTVDSYVhTb0Oc8cw3sO9j6R0spgt62l5Pe1S4QGZD/FTshOL++sSHDr9
 x/dtkFCpGUVivqlELAeyRNzg5U9W7guTYA2QZvQozc7rUGav4ziJnHfuH33aH3qPmIQe
 go6wEgY/fp34MTCzQsCP+BYhH66LkVjkAU/d5vbUgJDPw1goYmZCh9Dm663tLPoecrN5
 OmGA==
X-Gm-Message-State: AOAM531XfmPFW/EAP7Bpym9Oqx7hunSBVm1xHV7CyMvCr5va/s1xxQW9
 rEYFGooWJbRqNU49jeVkRXeh6G9HKS8=
X-Google-Smtp-Source: ABdhPJy66MckGQDyLsJIvF4VToS5sqJd0myJwjL9fDBA20NLuZbxaWNutVsSqrmALyzEJvTgqsIHSA==
X-Received: by 2002:a05:6638:2185:b0:32b:73ff:ef16 with SMTP id
 s5-20020a056638218500b0032b73ffef16mr11024498jaj.192.1652741832638; 
 Mon, 16 May 2022 15:57:12 -0700 (PDT)
Received: from frodo.hsd1.co.comcast.net ([2601:284:8204:2010::dd9f])
 by smtp.googlemail.com with ESMTPSA id
 k26-20020a02661a000000b0032b74686763sm3133949jac.76.2022.05.16.15.57.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 15:57:12 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 10/27] dyndbg: let query-modname override defaulting modname
Date: Mon, 16 May 2022 16:56:23 -0600
Message-Id: <20220516225640.3102269-11-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220516225640.3102269-1-jim.cromie@gmail.com>
References: <20220516225640.3102269-1-jim.cromie@gmail.com>
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
Cc: maz@kernel.org, quic_saipraka@quicinc.com, catalin.marinas@arm.com,
 arnd@arndb.de, gregkh@linuxfoundation.org, linux-arm-msm@vger.kernel.org,
 rostedt@goodmis.org, mingo@redhat.com, mathieu.desnoyers@efficios.com,
 quic_psodagud@quicinc.com, daniel.vetter@ffwll.ch, seanpaul@chromium.org,
 will@kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

dyndbg's control-parser: ddebug_parse_query(), requires that search
terms: module, func, file, lineno, are not used 2x in a query; a thing
cannot be named both foo and bar (not even wildcards, no OR is
contemplated).

Amend the treatment of module; while still enforcing the 2x rule on
it, set the default module at end, if none was given in the query
itself, so the preset doesn't spoil the check.

Background:

ddebug_parse_query() got a modname arg to support boot-args with
compound queries, all with "module aMod" added by default.

  aMod.dyndbg="func foo +p; func bar +p"

With default module at end, this becomes possible; "module *" in the
query overrides the default "module aMod".

  aMod.dyndbg="module * class FOO +p"

This means aMod can modify (by explicit means) any FOO class'd
pr_debugs in other modules.  It is intended for use by DRM, which
generally would want sub-system wide coordination.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 lib/dynamic_debug.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index b67bf9efec07..42dce2e76014 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -425,10 +425,6 @@ static int ddebug_parse_query(char *words[], int nwords,
 		return -EINVAL;
 	}
 
-	if (modname)
-		/* support $modname.dyndbg=<multiple queries> */
-		query->module = modname;
-
 	for (i = 0; i < nwords; i += 2) {
 		char *keyword = words[i];
 		char *arg = words[i+1];
@@ -471,6 +467,13 @@ static int ddebug_parse_query(char *words[], int nwords,
 		if (rc)
 			return rc;
 	}
+	if (!query->module && modname)
+		/*
+		 * support $modname.dyndbg=<multiple queries>,
+		 * allowing query.module to override $modname
+		 */
+		query->module = modname;
+
 	vpr_info_dq(query, "parsed");
 	return 0;
 }
-- 
2.35.3

