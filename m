Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EDE985AC766
	for <lists+dri-devel@lfdr.de>; Sun,  4 Sep 2022 23:47:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63EEC10E2A5;
	Sun,  4 Sep 2022 21:43:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com
 [IPv6:2607:f8b0:4864:20::d30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A509310E136;
 Sun,  4 Sep 2022 21:42:17 +0000 (UTC)
Received: by mail-io1-xd30.google.com with SMTP id q81so5653590iod.9;
 Sun, 04 Sep 2022 14:42:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=nL64tgfR3yuX9RW4VuAbZjo3bVMvuFZk7zY8MVD5bOI=;
 b=MCERlmgtJae24BInitcbNWrvVsK4E28qygPVO0EI6bkancXMheS04Tjo59+IeITlng
 jf5a49doi5XUUhgQrgt0RmWEG3xEjEu3z6ICYcIoTvGgQxKN8UUHK2ER+0LYVRq3FV20
 WucDDDHNaHkRRVFc33rm6kG1+UsezVvy9A3pW29Mq1niKl9lIkT8agZdaeX87NAWjUS1
 MYunE/FL5qWQueHrE71Nebq3OiS0fnNs9Cl3zzOr1/GBkEIemuvUKXl1uWUTCi/CRp7Y
 yFRVweG/UcdYXA9YY+/xnyx11VcNoG2ZRCFkTug07yb1tarb7cX3rZ4pliWCDznewiHQ
 YFdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=nL64tgfR3yuX9RW4VuAbZjo3bVMvuFZk7zY8MVD5bOI=;
 b=E2fnTGHeOWHazwEJcmnuRK/jxnZbxhxzvXEwOFQgtqcaj0I6GQSdfazbbT0cYeMJ2E
 bJr+264LosdHj+4kC2XBpdvmKAfjxdqXZonSNzXkbv8GbFmkuImQr+KzZBUBJR6Qz7CI
 hvYRJB4P3Z8ldNDUdTQ+tVh0Tg2WjFWW8Nb8XmH+Y25eEqn6pcFsAb5shX8p3+oVwgpB
 BlYBCujnLqnYyCKwpOOAVIGG3S7KIEamiZhN2Uc4hmTXPBS6EY2bvCUo9jZnbz8TNOJB
 FZqz0hznhyJnUYmmaIbLgR/NJWB02qTjsDR4kCpfZlp9yMkwes0WNnsxGQjWkVOKyUrb
 p2bg==
X-Gm-Message-State: ACgBeo0c8pN9+KmYS5+Sv2RXb+Sp4QLQFZ7+ZmPgGi24gnehAv6zJpEJ
 4WjoW4f/antesxR2Rq8axo4=
X-Google-Smtp-Source: AA6agR6mvknJtV6TiNBzpnOFVHbpLslD1LC4cvqoUjepqIcY8t7Gx+7cGEaleIov3kTIKLX0n/BTLQ==
X-Received: by 2002:a05:6602:13c8:b0:68a:db5d:269d with SMTP id
 o8-20020a05660213c800b0068adb5d269dmr20950589iov.209.1662327736752; 
 Sun, 04 Sep 2022 14:42:16 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 e12-20020a056602044c00b006889ea7be7bsm3727688iov.29.2022.09.04.14.42.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Sep 2022 14:42:16 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, gregkh@linuxfoundation.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v6 07/57] dyndbg: let query-modname override actual module name
Date: Sun,  4 Sep 2022 15:40:44 -0600
Message-Id: <20220904214134.408619-8-jim.cromie@gmail.com>
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
Acked-by: Jason Baron <jbaron@akamai.com>
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
2.37.2

