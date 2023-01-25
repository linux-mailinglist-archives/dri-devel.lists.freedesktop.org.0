Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D16A767BD00
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jan 2023 21:38:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C700D10E8AF;
	Wed, 25 Jan 2023 20:38:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x12b.google.com (mail-il1-x12b.google.com
 [IPv6:2607:f8b0:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBDAF10E873;
 Wed, 25 Jan 2023 20:38:06 +0000 (UTC)
Received: by mail-il1-x12b.google.com with SMTP id p12so1510ilq.10;
 Wed, 25 Jan 2023 12:38:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=g3mh2Po5S0GZ5nMRIdtsGUfg1b0n2GFzCmBwQMpYGZ8=;
 b=cwnxSD1lO2UoA3ND/8ysyNhK+m3hJUFQWyuvBlRWa3ZlcQ2vUivawFa2qHsdqd2Yxb
 I7nMhI5TmTzKD9jAxA6Qu/biaZfMCs9EmkGzHvA92NAS4EbAXJ1NaZXW4KbrV8dnidNy
 N0A1zoROSXBLzrheK2IiHKVOipyXsUyDdE5gj0Fr1dZoBHN2ZPfAupYgYMTdidok+rA8
 WnjE82WcAY72ZVd9FjJMiqhuMYBrcxeyiwyYYJ8S32I1XDKgV5ZE9gQwiyhSnL6+dqpp
 JQMHQGhjmB3LYMV7XT/5f/En0DBvTOU/WfLuXPUOp7NmmcSceISL9STkQB7JeGqZgiGX
 9Y6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=g3mh2Po5S0GZ5nMRIdtsGUfg1b0n2GFzCmBwQMpYGZ8=;
 b=Om7i5yC8t2UYFM3nG7aE6NE65jQzOBbM7Vi/8jie2y80rXxwsw8WZclcf7c7G1XlRo
 Vr1qO29FVM5SQ3mjnihrWjMDSwKh4KJ1m7ZhiTQ3TeI7lVBRevpSIFvrsi2KeCRtqPQN
 nNnkFyzSaC4bAyZtIarrYW7Fx+70PUd9L5AGo622xUNAuCdJyAO4iknzOXKzsBfsZKpg
 FLK6bk/sdExFzqHLWBjQBBH1BZXjcMR7vs78GhxzJeK6tt0T8Eq9kXmZfku4Q59cX6E5
 f5Kl3PEwpGpZBYMs1AnpSecK/0Bg5q2R0OAmlGLbmeGArqK1jsA8nTzLfOazC5tgA1bW
 nvww==
X-Gm-Message-State: AFqh2kp+4gNPhMkUVACJgOFP/XAvP9poBdQi2DuT0XyhCBmwvbXQhA9X
 9Y2j8435uTQRrphgqeOGl40=
X-Google-Smtp-Source: AMrXdXvPM8t3vFwyNndtrfyKS5vIOllgROIQouuVnZ3VU8nVIZJ2wrfXnDHR4gwh6+zL7uWEumkpXw==
X-Received: by 2002:a92:b007:0:b0:30e:f02f:f1bf with SMTP id
 x7-20020a92b007000000b0030ef02ff1bfmr31186264ilh.30.1674679085895; 
 Wed, 25 Jan 2023 12:38:05 -0800 (PST)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 y11-20020a056e02128b00b00310a599fd43sm665104ilq.46.2023.01.25.12.38.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Jan 2023 12:38:05 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Subject: [PATCH v3 08/19] dyndbg: tighten ddebug_class_name() 1st arg
Date: Wed, 25 Jan 2023 13:37:32 -0700
Message-Id: <20230125203743.564009-9-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230125203743.564009-1-jim.cromie@gmail.com>
References: <20230125203743.564009-1-jim.cromie@gmail.com>
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
Cc: jani.nikula@intel.com, daniel.vetter@ffwll.ch, seanpaul@chromium.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Change function's 1st arg-type, by derefing in the caller.
The fn doesn't need any other fields in the struct.

no functional change.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 lib/dynamic_debug.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index 2d4640479e5b..10c29bc19901 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -1110,12 +1110,12 @@ static void *ddebug_proc_next(struct seq_file *m, void *p, loff_t *pos)
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
 
@@ -1149,7 +1149,7 @@ static int ddebug_proc_show(struct seq_file *m, void *p)
 	seq_puts(m, "\"");
 
 	if (dp->class_id != _DPRINTK_CLASS_DFLT) {
-		class = ddebug_class_name(iter, dp);
+		class = ddebug_class_name(iter->table, dp);
 		if (class)
 			seq_printf(m, " class:%s", class);
 		else
-- 
2.39.1

