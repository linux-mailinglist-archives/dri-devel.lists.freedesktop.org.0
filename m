Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06D8B7CE3AC
	for <lists+dri-devel@lfdr.de>; Wed, 18 Oct 2023 19:06:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 202B210E42A;
	Wed, 18 Oct 2023 17:06:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com
 [IPv6:2607:f8b0:4864:20::d33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 722BE10E41B;
 Wed, 18 Oct 2023 17:06:22 +0000 (UTC)
Received: by mail-io1-xd33.google.com with SMTP id
 ca18e2360f4ac-7a67bc84c87so22029539f.0; 
 Wed, 18 Oct 2023 10:06:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1697648782; x=1698253582; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=O4Nv87Lg2zXFTsrsMPJe4o1KQfKM5CR/Su7zfjGsbi8=;
 b=JUtE+4z38QP6Dxj9qU7t3/Y0f79ZnanYlM/KK54Xhs+2PjJeZgVnV4/GkUFB+lOafD
 MpLZBRXJFDIApC+OHHFWJzFrSgmvGXdTVVHsJ9WkMLvrRXSnrcENnEbYXpkPEAitrjIj
 4QXefPu6Tx7I0u4EUkoigHMtE94lXNxBnHpKNwMeThG6zTY4NB9rf+MqPZWwq2kO1CVM
 /ZK38zXRKCcY6WiS5mb+ew0HfdB4DVa9rsRDH/6pU8+M64KxzSo7d5gMZOeyk+HDNRF0
 BtpAW0Ah34mwE/mdueexQPejnXshRpz/1td90JFyaW+QmuAgNgouuJMUYeACp2bNtry3
 aQPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697648782; x=1698253582;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=O4Nv87Lg2zXFTsrsMPJe4o1KQfKM5CR/Su7zfjGsbi8=;
 b=iG19MKMjnrLBStw1pFluYKluHH+Nab3n2muaySOBaao3YZXja9NzRVl/5719tg2sxP
 BZl3WKwda9iGrQ+vvJILaFNDV4/B57waJvuMKHTw+jIBpzma32mzJsybnRHHteZCNSom
 C73ItHojPqZD7/0xujzK/iMH00G9EV4sUcuUmFVj4rsY6Y4SVHFR2ayr364FZQ8rjxzR
 P4L5ajWdZ3S23uosOyCDke7SeboDD3QGHrMf8kYVPz3uY2qKfqN7KZ96PEtBZ5bh3yhj
 ImmWRqAdh+asDJ7slOMEe3sCbGyKxQqabmUxbmWxtOncVCK2QTGaMFga9XxfxBIlZzd6
 NDSA==
X-Gm-Message-State: AOJu0Yxh3KiS0j8enniBCadko8aEZI8u3EZDxIH6/AE5AMVflyqVRG6m
 32k4Gi5deVlq9wsTGiN/3Nk=
X-Google-Smtp-Source: AGHT+IG6lZXzulci6YGFdscPrHiN4tISG8h2nXpy9EJZW1KW9NsOJNsFRiWgdpO0OyMO6nbCvvwZ2w==
X-Received: by 2002:a05:6602:3fc8:b0:795:c6f:59ff with SMTP id
 fc8-20020a0566023fc800b007950c6f59ffmr8247388iob.17.1697648781706; 
 Wed, 18 Oct 2023 10:06:21 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 n4-20020a5d8244000000b0079fa1a7cd36sm1228944ioo.30.2023.10.18.10.06.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Oct 2023 10:06:21 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, jbaron@akamai.com,
 gregkh@linuxfoundation.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Subject: [PATCH v7c 10/24] dyndbg: tighten ddebug_class_name() 1st arg type
Date: Wed, 18 Oct 2023 11:05:50 -0600
Message-ID: <20231018170604.569042-11-jim.cromie@gmail.com>
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

Change function's 1st arg-type, and deref in the caller.
The fn doesn't need any other fields in the struct.

no functional change.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 lib/dynamic_debug.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index b07aab422604..8158943b350d 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -1117,12 +1117,12 @@ static void *ddebug_proc_next(struct seq_file *m, void *p, loff_t *pos)
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
 
@@ -1156,7 +1156,7 @@ static int ddebug_proc_show(struct seq_file *m, void *p)
 	seq_puts(m, "\"");
 
 	if (dp->class_id != _DPRINTK_CLASS_DFLT) {
-		class = ddebug_class_name(iter, dp);
+		class = ddebug_class_name(iter->table, dp);
 		if (class)
 			seq_printf(m, " class:%s", class);
 		else
-- 
2.41.0

