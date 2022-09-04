Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 162EE5AC799
	for <lists+dri-devel@lfdr.de>; Sun,  4 Sep 2022 23:48:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2886E10E39F;
	Sun,  4 Sep 2022 21:43:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x12e.google.com (mail-il1-x12e.google.com
 [IPv6:2607:f8b0:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE70710E26D;
 Sun,  4 Sep 2022 21:42:53 +0000 (UTC)
Received: by mail-il1-x12e.google.com with SMTP id m16so861593ilg.3;
 Sun, 04 Sep 2022 14:42:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=2DUNNF4TyZPmUhIDyquoFTYgxu+2+I569ry9sz7h+V8=;
 b=mQmCZeXOpRyxBBvjbWVrCXsXx7gHTM8N/UQTvxQw6KuXSPexo1h3FD1ucxeyNJT+xH
 FCrl38VbY4XTggjAdID94f6qwWEzanDmr/mM2z9ppbD2bi++cdR0KFPdSDwIzMEdviuE
 T7rb8LW++Dfbale5om0KJkTeWydx42PLJzEbIaIRUShArRNRdH3N5bm567jsKFUoVvyE
 yNkTMgfq+82gXrYwwjc07JfVO8XbjrtDoDwJo5YA9vGk40vjd+duz80CzMwmFoM7NXkY
 5BL2wv2zhIlR6b9Vj7PAu5z7gJVid5GmJmcNvK4vsfDXHVxr7IqKWTFLJl2NVdYInAfp
 DlOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=2DUNNF4TyZPmUhIDyquoFTYgxu+2+I569ry9sz7h+V8=;
 b=P9UxYs+vdSRaDLgDMePw14aG49ApFnpkoZH047gxjVPTOYlmH9fPIHjjhOzWMHgUU6
 39r30woLq9JGhIpDDl2pumg9fNMhSsX4VQO0TmXtyiOGVny9M2qwV0JQENUvkYJSBV9v
 2fRkojIdmoZ8++TvgE9x2LVuqFzy8t4XMQYgokixj9PePcUkU0HJi53AfDVoE5NK5M+V
 sOM22xLBWpQtZIG8AALI2qAHscuMCIZN3PCL3u+xwTwGFdElpieGC2u+BwmjfBdxMPuE
 ZqBbgrSuMNP+AVeXk63CUzs8KdoTcXn6U+UXtT+nQz97FFePrw6orv/9cJQ3NUGgar0D
 5VHg==
X-Gm-Message-State: ACgBeo1UM2ej9AQ1r/cYAEQvzuZt0x1m5xk6M7AX+vJn8GXzyCGfCrn0
 PLAlxLc742leoyScudY8Yqk=
X-Google-Smtp-Source: AA6agR7R7ppBFr3r3vC4WEGb4c102hUehmHvwf5LRPNlvppZUrjQH2NK84HPqLyTxmmaZ5tAXemtqA==
X-Received: by 2002:a05:6e02:b2d:b0:2ec:b5eb:cd63 with SMTP id
 e13-20020a056e020b2d00b002ecb5ebcd63mr9305275ilu.291.1662327773546; 
 Sun, 04 Sep 2022 14:42:53 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 e12-20020a056602044c00b006889ea7be7bsm3727688iov.29.2022.09.04.14.42.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Sep 2022 14:42:53 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, gregkh@linuxfoundation.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v6 45/57] dyndbg: de-duplicate sites
Date: Sun,  4 Sep 2022 15:41:22 -0600
Message-Id: <20220904214134.408619-46-jim.cromie@gmail.com>
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

In __ddebug_add_module(), detect repeated site records (by function
name changes), and push changes onto the stack/vector passed in
from dynamic_debug_init().

For ddebug_add_module(), this transparently de-duplicates the local
sites vector (passed in recently added stack-base, and offset 0).

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 lib/dynamic_debug.c | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index 1b57e43e9c31..41c23ec979f4 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -1347,7 +1347,7 @@ static int __ddebug_add_module(struct _ddebug_info *di, unsigned int base,
 	struct ddebug_table *dt;
 	int i;
 
-	v3pr_info("add-module: %s.%d sites\n", modname, di->num_descs);
+	v3pr_info("add-module: %s.%d sites, start: %d\n", modname, di->num_descs, base);
 	if (!di->num_descs) {
 		v3pr_info(" skip %s\n", modname);
 		return 0;
@@ -1376,11 +1376,19 @@ static int __ddebug_add_module(struct _ddebug_info *di, unsigned int base,
 		ddebug_attach_module_classes(dt, di->classes, di->num_classes);
 
 	for (i = 0; i < di->num_descs; i++) {
-		di->descs[i]._index = base + i;
-		v3pr_info(" %d %d %s.%s.%d\n", i, base, modname,
-			  di->descs[i].site->_function, di->descs[i].lineno);
-	}
 
+		if (di->descs[i].site->_function != packed_sites[(*packed_base)]._function)
+			memcpy((void *) &packed_sites[++(*packed_base)],
+			       (void *) di->descs[i].site, sizeof(struct _ddebug_site));
+		else
+			di->descs[i].site = &packed_sites[(*packed_base)];
+
+		di->descs[i]._index = i + base;
+		di->descs[i]._map = *packed_base;
+
+		v3pr_info(" %d %d %s.%s.%d - %d\n", i, *packed_base, modname,
+			  di->descs[i].site->_function, di->descs[i].lineno, *packed_base);
+	}
 	mutex_lock(&ddebug_lock);
 	list_add_tail(&dt->link, &ddebug_tables);
 	mutex_unlock(&ddebug_lock);
@@ -1539,7 +1547,7 @@ static int __init dynamic_debug_init(void)
 	iter = iter_mod_start = __start___dyndbg;
 	site = site_mod_start = __start___dyndbg_sites;
 	modname = iter->site->_modname;
-	i = mod_sites = mod_ct = 0;
+	i = mod_sites = mod_ct = site_base = 0;
 
 	for (; iter < __stop___dyndbg; iter++, site++, i++, mod_sites++) {
 
-- 
2.37.2

