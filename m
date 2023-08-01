Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FB0676C10A
	for <lists+dri-devel@lfdr.de>; Wed,  2 Aug 2023 01:35:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD35010E453;
	Tue,  1 Aug 2023 23:35:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x134.google.com (mail-il1-x134.google.com
 [IPv6:2607:f8b0:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 203A210E45A
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Aug 2023 23:35:33 +0000 (UTC)
Received: by mail-il1-x134.google.com with SMTP id
 e9e14a558f8ab-34932982295so4959995ab.2
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Aug 2023 16:35:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690932932; x=1691537732;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ytzcsfp5DozVQBADkroz6WvX9coPk+u0W43i9urQS+A=;
 b=QeOLQAWTIx6sLBI51yso0pUfmt4n1CE0pdVPqVvYFaRKgf84sE8bafhPsPyy2DuPYG
 ZhElkss0PCl78IC1UYvCzxztpJ496M++IFBqPSnuc4uY7O3UBKK/oo3aKpEEowrGM/QL
 9iIhYzbEkYXf9DwsMoJRBpO9X5PTCnLJQ82xagz8r5FjdHA9aIv8A/e9wOjIkZZYf5e5
 6ULDXUmOTRt08UoB1wkUkWEX9icqrQV9Kh5NuKlfS9BjpiOTMYNcwwZw8Rme+GzGpT++
 PcZKYUKItxTden5bTebXadUxgON9uJPs39qXd3kD5okFJ1u1nWhwinZlb1dGD6pmQXXa
 aQBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690932932; x=1691537732;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ytzcsfp5DozVQBADkroz6WvX9coPk+u0W43i9urQS+A=;
 b=e4MP/BcLJpvRwS99r2SUH6mv8tF2UT/yegk8q67oFu0RKTdXwQlABeypvjSXvHlTEU
 YmdfZsRhujJXIcosMgVfx0u/hXfkxuYHMQx0gyXUxyEXFZ5OC6PGMtBnNthi7hltBku1
 TxlOpc4oxFwd4VDkGQO5lPrIedeMjzFcxzvzFX8pLwFvIQq3peMJtVRQGSElf/zKiXoQ
 lYv2sTBWXL6MxVeXW8sXoqzMnSsmyx/t6E32kgeYgQ892ZzSfeZkZTp7lBdy5+CV9GER
 QQEAbx/ejRpobACjSzjbJQbuII9gldxP7O9VgToNak5S55Btc0fbUahQX8gJPkFemJuk
 KFfw==
X-Gm-Message-State: ABy/qLbSlWqFze65OR8lagOlV3MItch29lHWVrmFWszVI2NUQG/i9eFt
 FUBSotxrUTZsQlY+yVDUBTc=
X-Google-Smtp-Source: APBJJlGo27H/BJk/zUyWtTqLq72eHiQnhPTrd3ATrjOpCXzGstQV2PyQx9EQIJtVPUF8tMDxhEmfsg==
X-Received: by 2002:a05:6e02:1aad:b0:346:50ce:d602 with SMTP id
 l13-20020a056e021aad00b0034650ced602mr16448953ilv.1.1690932932410; 
 Tue, 01 Aug 2023 16:35:32 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 t13-20020a92ca8d000000b00348d652a6b4sm4157967ilo.48.2023.08.01.16.35.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Aug 2023 16:35:30 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, daniel.vetter@ffwll.ch, dri-devel@lists.freedesktop.org
Subject: [PATCH v5 10/23] dyndbg: tighten ddebug_class_name() 1st arg type
Date: Tue,  1 Aug 2023 17:34:56 -0600
Message-ID: <20230801233515.166971-11-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230801233515.166971-1-jim.cromie@gmail.com>
References: <20230801233515.166971-1-jim.cromie@gmail.com>
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

Change function's 1st arg-type, and deref in the caller.
The fn doesn't need any other fields in the struct.

no functional change.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 lib/dynamic_debug.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index 7430add36423..5139c8d45d12 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -1113,12 +1113,12 @@ static void *ddebug_proc_next(struct seq_file *m, void *p, loff_t *pos)
 #define class_in_range(class_id, map)					\
 	(class_id >= map->base && class_id < map->base + map->length)
 
-static const char *ddebug_class_name(struct ddebug_iter *iter, struct _ddebug *dp)
+static const char *ddebug_class_name(struct ddebug_table *dt, struct _ddebug *dp)
 {
-	struct ddebug_class_map *map = iter->table->classes;
-	int i, nc = iter->table->num_classes;
+	struct ddebug_class_map *map = dt->classes;
+	int i;
 
-	for (i = 0; i < nc; i++, map++)
+	for (i = 0; i < dt->num_classes; i++, map++)
 		if (class_in_range(dp->class_id, map))
 			return map->class_names[dp->class_id - map->base];
 
@@ -1152,7 +1152,7 @@ static int ddebug_proc_show(struct seq_file *m, void *p)
 	seq_puts(m, "\"");
 
 	if (dp->class_id != _DPRINTK_CLASS_DFLT) {
-		class = ddebug_class_name(iter, dp);
+		class = ddebug_class_name(iter->table, dp);
 		if (class)
 			seq_printf(m, " class:%s", class);
 		else
-- 
2.41.0

