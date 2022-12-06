Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B48D643A32
	for <lists+dri-devel@lfdr.de>; Tue,  6 Dec 2022 01:36:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77B9510E2F8;
	Tue,  6 Dec 2022 00:35:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com
 [IPv6:2607:f8b0:4864:20::d2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58A2310E2DF;
 Tue,  6 Dec 2022 00:35:14 +0000 (UTC)
Received: by mail-io1-xd2d.google.com with SMTP id o189so3100064iof.0;
 Mon, 05 Dec 2022 16:35:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BIsPuu8JRVrrUSQ7469SzfHROG7s67Vxgu75j/Nltzk=;
 b=D/2mvIxLzCrVymNZPIHU/akrweDVsfKHAFVoGDktna/W6aUgQ4Hqd3ZffCokk6nJu7
 +g/WPmIAl4D5dD0SG/iomeH0w7jfPWfvi0kmEz7X8/LgdCZUEHoYvrMl8Us4IiW6GKSQ
 oPCLKdl3ke+IqzQioDR6GVWR9XZb1SmV4jRHREc9afB8KmDkf1n1R4bCilgOUaP2H0/t
 L9rDFuqySibq0YXjC95Rqns7uLdHZWPMPX8V0cu/l2wDJwBVhHKrssRrxuIW2brjvQgb
 Ag9FQB6OC4CuGJJhgeFtrLCIcyx0/ewNuRy09SnIqQYU/hQREZORqAI3NpYqN5ZX+B2H
 r33A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BIsPuu8JRVrrUSQ7469SzfHROG7s67Vxgu75j/Nltzk=;
 b=PLCnsS1duiRiLVrf2c8jKMywXU44g1nkc8KffmXQbPIeMAFFnAsyEHZpXCfTsfe6c3
 knepTc7IizG7jV9qIB4vKFrt1rbzFC5lgZlpQCzvGuqa1Nrn9RzCvz6JvBJEiz/2Km5E
 t9wbSJOLO+kQSu75e8Uxhf1874k5LWpmDnAy9EKrYh+40SHedcGBWlHcfsUsvdaa3jVh
 DOUlrAPB9EDN3/PPaJE8hS7OIHqWkfcuT7mWk48T2qyZWbJSIF2ka16Dw3chnMrOi0x8
 +/5uj0/LqCJsoAO8PaKMj4BOnWbxAR7OXel3aEIFmkTv5B0VoYZIaxyOcUOUPewIXHqF
 VNyA==
X-Gm-Message-State: ANoB5pm5Bol9+wRkFyUnbnGG661lhJQnaHGUmINEwO5bXY26YYt4YXkU
 BHywMyGDD5cxAQFAd7k65M4=
X-Google-Smtp-Source: AA0mqf7ri2gro9V9fgZrgNh7kkATJcL+NRGjXlDE9UObbzfVKd4AWSefSQfvOw6hkPTvUYcEK+T1MQ==
X-Received: by 2002:a05:6602:418b:b0:6dd:813a:bfaa with SMTP id
 bx11-20020a056602418b00b006dd813abfaamr30093591iob.146.1670286913920; 
 Mon, 05 Dec 2022 16:35:13 -0800 (PST)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 x3-20020a056602160300b006bba42f7822sm6408213iow.52.2022.12.05.16.35.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Dec 2022 16:35:13 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Subject: [RFC PATCH 14/17] dyndbg: unwrap __ddebug_add_module inner function
 NOTYET
Date: Mon,  5 Dec 2022 17:34:21 -0700
Message-Id: <20221206003424.592078-15-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221206003424.592078-1-jim.cromie@gmail.com>
References: <20221206003424.592078-1-jim.cromie@gmail.com>
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
Cc: jani.nikula@intel.com, daniel.vetter@ffwll.ch, jbaron@akamai.com,
 seanpaul@chromium.org, gregkh@linuxfoundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The inner func has a base arg which is unused in the body, so theres
no point in having the inner fn.  Its one-time purpose was subsumed
into the ddebug_info record, which is used in dynamic_debug_init() as
a cursor to load the builtin _ddebug[] table.

TODO: cited commit gives another reason for base, to provide an index
in support of de-duplicating column data.  Refresh that patchset to
see if its still true.

Fixes: 6afa31514977 ("dyndbg: unwrap __ddebug_add_module inner function")

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 lib/dynamic_debug.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index 45b8414fa130..02f36c553835 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -1329,8 +1329,7 @@ static void ddebug_attach_client_module_classes(struct ddebug_table *dt, struct
  * Allocate a new ddebug_table for the given module
  * and add it to the global list.
  */
-static int __ddebug_add_module(struct _ddebug_info *di, unsigned int base,
-			       const char *modname)
+int ddebug_add_module(struct _ddebug_info *di, const char *modname)
 {
 	struct ddebug_table *dt;
 
@@ -1372,11 +1371,6 @@ static int __ddebug_add_module(struct _ddebug_info *di, unsigned int base,
 	return 0;
 }
 
-int ddebug_add_module(struct _ddebug_info *di, const char *modname)
-{
-	return __ddebug_add_module(di, 0, modname);
-}
-
 /* helper for ddebug_dyndbg_(boot|module)_param_cb */
 static int ddebug_dyndbg_param_cb(char *param, char *val,
 				const char *modname, int on_err)
@@ -1519,7 +1513,7 @@ static int __init dynamic_debug_init(void)
 			mod_ct++;
 			di.num_descs = mod_sites;
 			di.descs = iter_mod_start;
-			ret = __ddebug_add_module(&di, i - mod_sites, modname);
+			ret = ddebug_add_module(&di, modname);
 			if (ret)
 				goto out_err;
 
@@ -1530,7 +1524,7 @@ static int __init dynamic_debug_init(void)
 	}
 	di.num_descs = mod_sites;
 	di.descs = iter_mod_start;
-	ret = __ddebug_add_module(&di, i - mod_sites, modname);
+	ret = ddebug_add_module(&di, modname);
 	if (ret)
 		goto out_err;
 
-- 
2.38.1

