Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BE66577B47
	for <lists+dri-devel@lfdr.de>; Mon, 18 Jul 2022 08:39:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BAD5A9C98;
	Mon, 18 Jul 2022 06:38:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x135.google.com (mail-il1-x135.google.com
 [IPv6:2607:f8b0:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D83D0A9C69;
 Mon, 18 Jul 2022 06:38:22 +0000 (UTC)
Received: by mail-il1-x135.google.com with SMTP id c17so4570084ilq.5;
 Sun, 17 Jul 2022 23:38:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xDusQunCB1rc2oGhl0qVh9zuKvB3DHnmYV8dCnPm/ic=;
 b=QBmwiTAygjYwOGyLXfZnQ7+tgROCdo7WLKV3CS+Nkeg+qHGI5PIoe//gZdNziToi9U
 WCOgMFAWanQu3DmFeDJeK8ckOESEWNYWDTDsWkXuNNmuQJ6NZxGiQXAPcwjGl99lSONQ
 cS06aFE6EWyujgJjGLDVVcXcmFZyGAnTKhg0e9+y6aESbTu4CKeFe6Fh9YaDT7FZyDVf
 K8HVbM2UHJrOFlxbmgWhWtKgMolD8xvXfm/afGV01RMuH2kk90GmqVmZ4sJZsKHznlS9
 NjfXUYCIUu9iqEoDsoKRb+6qP6TdZmQvULxj6r88goughpY4G+Ku6hLLxbid36JJmxZX
 A1Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xDusQunCB1rc2oGhl0qVh9zuKvB3DHnmYV8dCnPm/ic=;
 b=DJkPJ2+72yaCQ+JULuvGwM8+fmCRCLXkb2nPfT7/byhaQh2ZjOQQbKADEDG8/Rcdng
 0AaiGdn7JLGgjFYuTQ4KMmoQgGApJwjz9FwmqwmPot1wdfusEBp24y9+EOp6YFhX2d5M
 xloyMiNEf39Zpismqvu1ySMEs2lZYkE33m5fyUJbaXGt1cwWn4mvDCO4QDza6YQ5mnR4
 UpdHwNog/3htlpaxPJ8lLoO3UINkKt3Ltq2qvgmuT82BML/EabMmSp9oOLbqmf+x4SWk
 W0XeG1jnGDBzmnBUyJAw2geJg/SIUXb5dsNGN6qYkI3p+mzvKGKdWtxEHZunaw5CJjqK
 w2Vw==
X-Gm-Message-State: AJIora9Z/sSSvnoUh2kPcVJT/HHXbMLvtXGAx9rT8cBAfH4cCTF00rNb
 eQbltZMEx1osm1dzzFNi/qIJj7ka6Go=
X-Google-Smtp-Source: AGRyM1vKYY6576VwMmsyR1CUHrmLTA4c14Fe979lzcjYjRVhOStfT2UlsS1okWAU7cG0ZKDLhV52JA==
X-Received: by 2002:a05:6e02:194b:b0:2dc:a05f:d911 with SMTP id
 x11-20020a056e02194b00b002dca05fd911mr13730387ilu.92.1658126302100; 
 Sun, 17 Jul 2022 23:38:22 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 o12-20020a92a80c000000b002dcd35bb030sm2342604ilh.74.2022.07.17.23.38.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Jul 2022 23:38:21 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com
Subject: [PATCH v3 05/41] dyndbg: reverse module.callsite walk in cat control
Date: Mon, 18 Jul 2022 00:35:49 -0600
Message-Id: <20220718063641.9179-6-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220718063641.9179-1-jim.cromie@gmail.com>
References: <20220718063641.9179-1-jim.cromie@gmail.com>
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
Cc: nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
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
2.36.1

