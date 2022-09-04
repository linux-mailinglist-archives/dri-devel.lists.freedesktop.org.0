Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CDB215AC6DC
	for <lists+dri-devel@lfdr.de>; Sun,  4 Sep 2022 23:44:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F4D910E207;
	Sun,  4 Sep 2022 21:42:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com
 [IPv6:2607:f8b0:4864:20::d29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9A7E10E135;
 Sun,  4 Sep 2022 21:42:15 +0000 (UTC)
Received: by mail-io1-xd29.google.com with SMTP id 10so5685068iou.2;
 Sun, 04 Sep 2022 14:42:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=86ewCwjQW9i1kYjMVzcHXeBvyH4rTaXf6X7Uwlu5n+M=;
 b=GXl1s6xju+1eOoRqJRl5q8cmU4AqdZG79xuy+4LJGCEiw/Hpm6hcED/kqRFHo3q+gu
 qamuPL9FDFXp54vbLn1D/b404KlO7XolhPIJPAhLWpnmuPX+sSGTlZLE8h+zZqYnQIrO
 WQv5lca1ZofQjJIzLmrQTtiUPEYKCY216cU1ZnpHg+6ZUjNnIOjcVxlqwiL58RevVO8D
 pGUHsa6tvLQW+hC5jGjp1KE581rAtx4OqvJE4X3qwKJoz1fNkj+HyJpZ/66sdZUCD24D
 Mz7y6TAL9Xr3pr/ZW5qptrtm61mPi57w9KyBOC6mMX4UYP+bimaAR2CSopw3oHJTZyoA
 VPjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=86ewCwjQW9i1kYjMVzcHXeBvyH4rTaXf6X7Uwlu5n+M=;
 b=Bx1Lor4eUSlER3ZAJnCUd2rGH7NkMMjjpa4aVqnnJfLl2GjVISEmVN+d2yjOpRVxQz
 qMDl8tjfo6dhwj5xDgKsWj5wcchMnJqYW1ZVitEGsZ9czOKsOeT+fKl67gobkVaX5/uo
 84jVaDzZSB4BBMLZJI+CR8v11tn/GgpMq1M8WnOWS0UoSq+9iaFQ9TTkE7jvvHORrn6+
 i2ChJhwuGTpgwwR9sTfEK2IbBQCQXqRtXYANdnB4o/qWQtWrwMhgsvblJ2sYHA8p36Ey
 hJgnSv74laxQo8DCAEifSMrbKqPVwzJoGZZ0vrnd83+W90mGn/mGLFhUx4n2Ag/WRF+T
 FSwQ==
X-Gm-Message-State: ACgBeo0cQm065/jTywIMn9uhylLsI6wavHukszHz5UYvFlDVqpOHtRz2
 lJY41PsacCsz1yXfgHDlJRA=
X-Google-Smtp-Source: AA6agR6667/lK+w05CI7BYagBtCSm/gCmvjQy5HHxRwHWCtcxf7YniB8McshMO9sqao4Jd/ymXysNA==
X-Received: by 2002:a05:6638:1607:b0:34a:105c:7204 with SMTP id
 x7-20020a056638160700b0034a105c7204mr24730394jas.216.1662327734786; 
 Sun, 04 Sep 2022 14:42:14 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 e12-20020a056602044c00b006889ea7be7bsm3727688iov.29.2022.09.04.14.42.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Sep 2022 14:42:14 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, gregkh@linuxfoundation.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v6 05/57] dyndbg: reverse module.callsite walk in cat control
Date: Sun,  4 Sep 2022 15:40:42 -0600
Message-Id: <20220904214134.408619-6-jim.cromie@gmail.com>
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

Walk the module's vector of callsites backwards; ie N..0.  This
"corrects" the backwards appearance of a module's prdbg vector when
walked 0..N.  I think this is due to linker mechanics, which I'm
inclined to treat as immutable, and the order is fixable in display.

No functional changes.

Combined with previous commit, which reversed tables-list, we get:

  :#> head -n7 /proc/dynamic_debug/control
  # filename:lineno [module]function flags format
  init/main.c:1179 [main]initcall_blacklist =_ "blacklisting initcall %s\012"
  init/main.c:1218 [main]initcall_blacklisted =_ "initcall %s blacklisted\012"
  init/main.c:1424 [main]run_init_process =_ "  with arguments:\012"
  init/main.c:1426 [main]run_init_process =_ "    %s\012"
  init/main.c:1427 [main]run_init_process =_ "  with environment:\012"
  init/main.c:1429 [main]run_init_process =_ "    %s\012"

Acked-by: Jason Baron <jbaron@akamai.com>
Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 lib/dynamic_debug.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index 7fb99492c16f..8ff11977b8bd 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -59,7 +59,7 @@ struct ddebug_query {
 
 struct ddebug_iter {
 	struct ddebug_table *table;
-	unsigned int idx;
+	int idx;
 };
 
 struct flag_settings {
@@ -805,13 +805,12 @@ static struct _ddebug *ddebug_iter_first(struct ddebug_iter *iter)
 {
 	if (list_empty(&ddebug_tables)) {
 		iter->table = NULL;
-		iter->idx = 0;
 		return NULL;
 	}
 	iter->table = list_entry(ddebug_tables.next,
 				 struct ddebug_table, link);
-	iter->idx = 0;
-	return &iter->table->ddebugs[iter->idx];
+	iter->idx = iter->table->num_ddebugs;
+	return &iter->table->ddebugs[--iter->idx];
 }
 
 /*
@@ -824,15 +823,16 @@ static struct _ddebug *ddebug_iter_next(struct ddebug_iter *iter)
 {
 	if (iter->table == NULL)
 		return NULL;
-	if (++iter->idx == iter->table->num_ddebugs) {
+	if (--iter->idx < 0) {
 		/* iterate to next table */
-		iter->idx = 0;
 		if (list_is_last(&iter->table->link, &ddebug_tables)) {
 			iter->table = NULL;
 			return NULL;
 		}
 		iter->table = list_entry(iter->table->link.next,
 					 struct ddebug_table, link);
+		iter->idx = iter->table->num_ddebugs;
+		--iter->idx;
 	}
 	return &iter->table->ddebugs[iter->idx];
 }
-- 
2.37.2

