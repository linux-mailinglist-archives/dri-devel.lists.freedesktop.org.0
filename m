Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 77E4C5AC79D
	for <lists+dri-devel@lfdr.de>; Sun,  4 Sep 2022 23:48:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 706D310E39A;
	Sun,  4 Sep 2022 21:43:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com
 [IPv6:2607:f8b0:4864:20::d2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3858D10E283;
 Sun,  4 Sep 2022 21:42:58 +0000 (UTC)
Received: by mail-io1-xd2a.google.com with SMTP id y187so5724154iof.0;
 Sun, 04 Sep 2022 14:42:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=0iGLn9xqCpcC4gcXCQSb7q1CfO8AItXp+UrSrC23ofg=;
 b=c4Kq7xloZvvHFQ9epBPNdcfT88slUONFGhsZx5MMGEMETHKqfUD9s2gzih6ALSi3wD
 RrSDXPBRasBgiwo4/u96iVTFZBqUgPsrGJ215FEXB49z7jnLyWi457WMuaGNd/EON1XH
 GyjBZNFnOS45dRu6gLJPWVkFsKVueCkOjPTRK+IINcSb2jbyp3YwEPuMkYNSzl/rirQM
 d5EwuNynlS8h4OY8pAJTaF7QeWBKZcUVuMJzzAnk0maYPeDvxCRYSxmx7XIOTzxGp1yV
 PLaexfCoB2wQoSDMH+kN17KC+TwYCpQd6YSNc7LXPW74NfB8khKnhZvXekFB8EQPRMeQ
 pFNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=0iGLn9xqCpcC4gcXCQSb7q1CfO8AItXp+UrSrC23ofg=;
 b=aGirrv5idrxju4T1Ra6aLfWXuLyB3C8gGa+ZR2liwgGB4Mohi10C60oL7fACKPaWOf
 l47dI8QQKqcVw0p5kQrjlBJ5uvYAeuJnMZrSUE4JZAvoxCZxT1L3Ui4V5v+r+SAhIO9T
 9KgvqIpyyiJboLMTiOYRY7z6w5BeCAjZlgt0MyJdA31TmpAp7YLUeBDGLm5jRK/UfV5h
 9Rp24FMHPUpOv+g0RNNOlI5a+2fWAxx4ujYy8sd9kd5RCYgCcrY0sQ6QoC81UjH2M7xj
 3D5JhWOfaFafvI/1pQrP/0vCezMhGTcjgfMTrRI+yiyL1CVI+EqcOuEhRkkXwmdOGvft
 VabA==
X-Gm-Message-State: ACgBeo2cOEWBgOcszjsVd2RwOwj6mdd36pX5t2AC7CYgLb2+Cs6pViNQ
 rA5Dk/+ZjtB3aPbGXwqQGH4=
X-Google-Smtp-Source: AA6agR5hVc9DnYKL0ZIAQuzKxXKG0S5DufyPzrHmQJwD8MfDjPFuhObXx/a4iT1L7ykoRUbvzDY2Pw==
X-Received: by 2002:a05:6638:1350:b0:349:f94d:5ea7 with SMTP id
 u16-20020a056638135000b00349f94d5ea7mr24681226jad.129.1662327777931; 
 Sun, 04 Sep 2022 14:42:57 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 e12-20020a056602044c00b006889ea7be7bsm3727688iov.29.2022.09.04.14.42.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Sep 2022 14:42:57 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, gregkh@linuxfoundation.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v6 50/57] dyndbg: count unique callsites
Date: Sun,  4 Sep 2022 15:41:27 -0600
Message-Id: <20220904214134.408619-51-jim.cromie@gmail.com>
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

Count de-duplicated callsites.  Since the _ddebug_site excludes
lineno, all callsites in a function are identical, and this
effectively counts functions in the module with callsites.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 lib/dynamic_debug.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index 91fe7fb5dda9..891d70d7fed4 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -1348,7 +1348,7 @@ static int __ddebug_add_module(struct _ddebug_info *di, unsigned int base,
 			       unsigned int *packed_base)
 {
 	struct ddebug_table *dt;
-	int i;
+	int i, num_funcs = 0;
 
 	v3pr_info("add-module: %s %d/%d sites, start: %d\n", modname, di->num_descs, di->num_sites, base);
 	if (!di->num_descs) {
@@ -1381,12 +1381,11 @@ static int __ddebug_add_module(struct _ddebug_info *di, unsigned int base,
 	//BUG_ON(di->num_descs != di->num_sites);
 
 	for (i = 0; i < di->num_descs; i++) {
-
-		if (di->sites[i]._function != packed_sites[(*packed_base)]._function)
-
+		if (di->sites[i]._function != packed_sites[(*packed_base)]._function) {
+			num_funcs++;
 			memcpy((void *) &packed_sites[++(*packed_base)],
 			       (void *) &di->sites[i], sizeof(struct _ddebug_site));
-
+		}
 		di->descs[i]._index = i + base;
 		di->descs[i]._map = *packed_base;
 
@@ -1397,7 +1396,7 @@ static int __ddebug_add_module(struct _ddebug_info *di, unsigned int base,
 	list_add_tail(&dt->link, &ddebug_tables);
 	mutex_unlock(&ddebug_lock);
 
-	vpr_info("%3u debug prints in module %s\n", di->num_descs, modname);
+	vpr_info("%3u debug prints in %d functions, in module %s\n", di->num_descs, num_funcs, modname);
 	return 0;
 }
 
-- 
2.37.2

