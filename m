Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C0AA7CE3B8
	for <lists+dri-devel@lfdr.de>; Wed, 18 Oct 2023 19:06:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A63210E42C;
	Wed, 18 Oct 2023 17:06:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com
 [IPv6:2607:f8b0:4864:20::d34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06D3F10E422;
 Wed, 18 Oct 2023 17:06:25 +0000 (UTC)
Received: by mail-io1-xd34.google.com with SMTP id
 ca18e2360f4ac-77acb04309dso284292939f.2; 
 Wed, 18 Oct 2023 10:06:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1697648784; x=1698253584; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mLvXeLnsRUQ3/TUrQnBU04ibB7JIWTVa6JOjlgQ9hVM=;
 b=dY88Gg0N5yczLUXx9HGiGuKcqx/7UPqmZ/X4kC87ECzvh0QC6W8IPDK/oWkun6s2RB
 wuHzZlOyUFU1uNUMVmHCUqF8Earjbq5XrJm+a83oZcmHBgIbS27hwkNvOcdND91moLVo
 ZkfhtV8JsORRpG/kpjHrv3O3Xztgu0p7cXzkWzMdCpGLxEcZ5lAjWt/xW0U9XCAlAOMZ
 GllHUPnthS7AELmTdKGLTlWWq5XYuPPf0EwHBOIjaTLwC5G81GayC51W37SAoUAblbqR
 bHsrUtjkQcq+AQyNyT2E8bmcY2NefQ47pLSdWDwgPK5JFu8+n/ODkFHWDQWsybUVZgFU
 exAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697648784; x=1698253584;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mLvXeLnsRUQ3/TUrQnBU04ibB7JIWTVa6JOjlgQ9hVM=;
 b=J2iVJdhvHY0O9mvzwGG9yqkBHa9Iln01ob7m81dy+CJiN5diuv9UPs2CCDsjr3fvy9
 kUKxEjGkCDeKO4/hUNrh8+mGzJ9Hc/HpCEsDLB5dCQ1+Z2UjZ97dywYCvLKFnH3dKO0H
 wBkRbX+1dup8QuqFJLp5nWudbKw9xAqoAFS4lTDnB96rC5s8jCpHGK2bxWM2XQdPcScU
 81LxkjTgFDUdLbMGCqYTE1IIMAxCu0qVJ0V56vY05XkbVzlYl/Uc4sWFMSFGIw7Vb0zc
 NT+89VRI7Tcm5Qrq/+/7fcmKZF60+OVpRdNdQYYqH5rKzLEZdoeFpxrKawzEDUdKmMBV
 48fA==
X-Gm-Message-State: AOJu0YyPxE6kBvfiwnmpcozfLtf2aeMBV49HY84/8hA1DVkSEbrV6Bnz
 f4g1dgoQbUPKvOiXzCFGwQs=
X-Google-Smtp-Source: AGHT+IHXn5aDSBWQ4yV+ZfP2Q8uwJsUM84jyQKFm2T659/qUKTQfbS6h1rfjfndzbeqO5bduFZlWHg==
X-Received: by 2002:a05:6602:1611:b0:791:2db5:c779 with SMTP id
 x17-20020a056602161100b007912db5c779mr6946727iow.10.1697648784315; 
 Wed, 18 Oct 2023 10:06:24 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 n4-20020a5d8244000000b0079fa1a7cd36sm1228944ioo.30.2023.10.18.10.06.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Oct 2023 10:06:23 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, jbaron@akamai.com,
 gregkh@linuxfoundation.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Subject: [PATCH v7c 12/24] dyndbg: reduce verbose=3 messages in
 ddebug_add_module
Date: Wed, 18 Oct 2023 11:05:52 -0600
Message-ID: <20231018170604.569042-13-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231018170604.569042-1-jim.cromie@gmail.com>
References: <20231018170604.569042-1-jim.cromie@gmail.com>
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
Cc: lb@semihalf.com, groeck@google.com, linux-doc@vger.kernel.org,
 jani.nikula@intel.com, daniel.vetter@ffwll.ch, linux@rasmusvillemoes.dk,
 rostedt@goodmis.org, mcgrof@kernel.org, seanpaul@chromium.org, joe@perches.com,
 bleung@google.com, yanivt@google.com
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

