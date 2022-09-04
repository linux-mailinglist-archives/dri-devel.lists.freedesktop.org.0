Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D1FA85AC7CE
	for <lists+dri-devel@lfdr.de>; Sun,  4 Sep 2022 23:50:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E84610EA56;
	Sun,  4 Sep 2022 21:44:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x131.google.com (mail-il1-x131.google.com
 [IPv6:2607:f8b0:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2F4E10E273;
 Sun,  4 Sep 2022 21:42:54 +0000 (UTC)
Received: by mail-il1-x131.google.com with SMTP id e7so3873386ilc.5;
 Sun, 04 Sep 2022 14:42:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=H201e8MxjjTWEZ5tX/zGuFZYDJJzszurQVKd2l3pA3I=;
 b=D5hVd8nWFbqRRkXkdpXZg4jOmNIfneov3THSYEMdUbvWnNl8Ne1nblV6QviWBWEGUg
 2zMyuA7+zIirnNTNheDbR8jO4BMAl558jaE/EZxKR7+4koCB4I8+25Qe/kL8kQDF2Sho
 9kDP0guazA6Lb4dxbqmjP5mGHurmuwBcuEMnuT3go1J7kq5fY3n584tb1fc7uABf1zin
 bHRRoPHY51s4kfci15ECF8xV6cBQQdgXuN4xECAP+d7JlGSq0KHUrs/nvlXcdLRTejSg
 qoOn5DPm1HXTaLGGK4GTAQmXYSy4e+uxehju05I6ClOoAcojZ1q7+CbFrz/rCbP0Qb06
 zY5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=H201e8MxjjTWEZ5tX/zGuFZYDJJzszurQVKd2l3pA3I=;
 b=XZkW/1LH0a8PA4OD7L5L1wCd8v+fbA0eo/ZHwjYlUcqm+7rWXs3LBfog9gAqSGl9lC
 LGmso6HwhKIorGzNGSGUbvOWEShFZf4y6TxftNfQw1JhpWOPeN4lY6aKCZloZAmjwRJA
 x4MdfLRAC61VDQR9e6YDML3l0yITQ4D2/6yisPjLxinQOFF0HpJhABcDGZ6iyhVn7Q0k
 FpP7nHHRb27dsZFPj14kXf9yKeKORqZH5H4WXdbfD59V8ZKIek6BybX7vPxn4UcOPh4C
 YJYjdyRc5x7/t7w0A8fvdvfxcwUW3hFhrEgvuQhZ5yPqISv1X11MLEgz105P+c+RpCpT
 1Nyw==
X-Gm-Message-State: ACgBeo0gTa1asBKdAAnv8dvnnavyII5dLOIbVdVeMu0H3cznC8PV4E+8
 AhLTXF/lSPjirpjUQ8pT9Y/dOXWRcZY=
X-Google-Smtp-Source: AA6agR6fMqZIkP1YOEGKlykQp2j5uHw/5o/cVx4vJBZLBlUDQYIi3bLhanGx4QpvBqJmpIkwB4O4Nw==
X-Received: by 2002:a05:6e02:19ca:b0:2df:68c:4a6d with SMTP id
 r10-20020a056e0219ca00b002df068c4a6dmr24133939ill.32.1662327774363; 
 Sun, 04 Sep 2022 14:42:54 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 e12-20020a056602044c00b006889ea7be7bsm3727688iov.29.2022.09.04.14.42.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Sep 2022 14:42:54 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, gregkh@linuxfoundation.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v6 46/57] dyndbg: drop site-> in add-module, more needed
Date: Sun,  4 Sep 2022 15:41:23 -0600
Message-Id: <20220904214134.408619-47-jim.cromie@gmail.com>
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

---
 lib/dynamic_debug.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index 41c23ec979f4..059212df68f9 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -1347,7 +1347,7 @@ static int __ddebug_add_module(struct _ddebug_info *di, unsigned int base,
 	struct ddebug_table *dt;
 	int i;
 
-	v3pr_info("add-module: %s.%d sites, start: %d\n", modname, di->num_descs, base);
+	v3pr_info("add-module: %s %d/%d sites, start: %d\n", modname, di->num_descs, di->num_sites, base);
 	if (!di->num_descs) {
 		v3pr_info(" skip %s\n", modname);
 		return 0;
@@ -1375,19 +1375,20 @@ static int __ddebug_add_module(struct _ddebug_info *di, unsigned int base,
 	if (di->classes && di->num_classes)
 		ddebug_attach_module_classes(dt, di->classes, di->num_classes);
 
+	//BUG_ON(di->num_descs != di->num_sites);
+
 	for (i = 0; i < di->num_descs; i++) {
 
-		if (di->descs[i].site->_function != packed_sites[(*packed_base)]._function)
+		if (di->sites[i]._function != packed_sites[(*packed_base)]._function)
+
 			memcpy((void *) &packed_sites[++(*packed_base)],
-			       (void *) di->descs[i].site, sizeof(struct _ddebug_site));
-		else
-			di->descs[i].site = &packed_sites[(*packed_base)];
+			       (void *) &di->sites[i], sizeof(struct _ddebug_site));
 
 		di->descs[i]._index = i + base;
 		di->descs[i]._map = *packed_base;
 
-		v3pr_info(" %d %d %s.%s.%d - %d\n", i, *packed_base, modname,
-			  di->descs[i].site->_function, di->descs[i].lineno, *packed_base);
+		v3pr_info(" %d %d %s.%s.%d\n", i, *packed_base, modname,
+			  packed_sites[*packed_base]._function, di->descs[i].lineno);
 	}
 	mutex_lock(&ddebug_lock);
 	list_add_tail(&dt->link, &ddebug_tables);
-- 
2.37.2

