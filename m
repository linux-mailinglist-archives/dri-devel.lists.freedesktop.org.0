Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B70845AC6EE
	for <lists+dri-devel@lfdr.de>; Sun,  4 Sep 2022 23:44:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB7D910E254;
	Sun,  4 Sep 2022 21:42:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com
 [IPv6:2607:f8b0:4864:20::d35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2A3910E140;
 Sun,  4 Sep 2022 21:42:25 +0000 (UTC)
Received: by mail-io1-xd35.google.com with SMTP id r141so5678400iod.4;
 Sun, 04 Sep 2022 14:42:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=bV2pbi1NEnXBIYceq2iCnojYvMw47Sm5P0bDatZE/qY=;
 b=DRCAFhL8qizXn9QBOsMZO6CWk737/iorbRJ4AxHGEgMlW1XjBcP+vkmFKNoyTUK0Mj
 RgDgR2Ync4KORGyKwN45XuxZ3LCgDHh7aM7gIcdOLcttBFR6Un79bJyvT2V/T+t1uwET
 tHeAl0kEFnMLN5umqFTSN7rOVhAj0XWVzl/y6lz8DsbMtgZKngpwCHlWQPaVdjC6LyHL
 qSLUkoUXTZ6m9J5MpZDXz12M3aHFBVeTnL/qP7lUD45vpjehf2aOfxyxGF8UMp8S8D8U
 hKvmKb7U5FALDSB3abvwTeqDsOg4bgbNnzuU9E1pJLb4XrIdrdIzUyRn++u3pSGOKqBq
 6ETw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=bV2pbi1NEnXBIYceq2iCnojYvMw47Sm5P0bDatZE/qY=;
 b=yMlJ5eaqZCr1helUhuL3NXet4g6Ua8XMvah6x4I9G5zSYMoRQLoxLSj5mnsTsyuhDK
 cqwclGqbovebeO8qBE/STq+EWTz+cqEaz9GVfoFgVhpAUTkVUGmnqEz9pf1JyowWAp5F
 RnBSkjGU7aqMdW6mEzHcWz3wzFb5dfc29V1aIcJC934gPzwo38FQk+jFpVFclA+x1Knu
 NrUBvKUWj/8T43Zhy/sT0W+ChR+VWp0+6gOIjvgCCoxJ+gcN1lR5W5mR9U8iCltel7cJ
 AioWNNdgGDiShdRPMSXzBcaHl0fsiY0ZMNr6Si7y9zagsBHXHVY+p3wrJLAXJ37j+0Mk
 1RnQ==
X-Gm-Message-State: ACgBeo2fstDQJzouGUFMUXEj6DvPzmI2pQoCq2pvHZQxdmVtsWlVgPza
 lO38VMFCNbmPIP8yKJJv0qs=
X-Google-Smtp-Source: AA6agR4Eiudl3FZhHqIH1u+1kjDcwObHAsibzo+7iq3K3aAIOXK9LPSM3GGiI3JaBRbAwyq3KZU0rA==
X-Received: by 2002:a6b:3e06:0:b0:68b:7524:f342 with SMTP id
 l6-20020a6b3e06000000b0068b7524f342mr15398868ioa.149.1662327745421; 
 Sun, 04 Sep 2022 14:42:25 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 e12-20020a056602044c00b006889ea7be7bsm3727688iov.29.2022.09.04.14.42.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Sep 2022 14:42:25 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, gregkh@linuxfoundation.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v6 16/57] dyndbg: add ddebug_attach_module_classes
Date: Sun,  4 Sep 2022 15:40:53 -0600
Message-Id: <20220904214134.408619-17-jim.cromie@gmail.com>
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

Add ddebug_attach_module_classes(), call it from ddebug_add_module().
It scans the classes/section its given, finds records where the
module-name matches the module being added, and adds them to the
module's maps list.  No locking here, since the record
isn't yet linked into the ddebug_tables list.

It is called indirectly from 2 sources:

 - from load_module(), where it scans the module's __dyndbg_classes
   section, which contains DYNAMIC_DEBUG_CLASSES definitions from just
   the module.

 - from dynamic_debug_init(), where all DYNAMIC_DEBUG_CLASSES
   definitions of each builtin module have been packed together.
   This is why ddebug_attach_module_classes() checks module-name.

NOTES

Its (highly) likely that builtin classes will be ordered by module
name (just like prdbg descriptors are in the __dyndbg section).  So
the list can be replaced by a vector (ptr + length), which will work
for loaded modules too.  This would imitate whats currently done for
the _ddebug descriptors.

That said, converting to vector,len is close to pointless; a small
minority of modules will ever define a class-map, and almost all of
them will have only 1 or 2 class-maps, so theres only a couple dozen
pointers to save.  TODO: re-evaluate for lines removable.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
v6
. fix compile err due to reorderd commits, and missed lkp report.
. init dt->maps in ddebug_add_module, prior to ddebug_attach_module_classes
---
 lib/dynamic_debug.c | 32 +++++++++++++++++++++++++++++++-
 1 file changed, 31 insertions(+), 1 deletion(-)

diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index fb31a1a2fc3f..b71efd0b491d 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -45,7 +45,7 @@ extern struct ddebug_class_map __start___dyndbg_classes[];
 extern struct ddebug_class_map __stop___dyndbg_classes[];
 
 struct ddebug_table {
-	struct list_head link;
+	struct list_head link, maps;
 	const char *mod_name;
 	unsigned int num_ddebugs;
 	struct _ddebug *ddebugs;
@@ -921,6 +921,32 @@ static const struct proc_ops proc_fops = {
 	.proc_write = ddebug_proc_write
 };
 
+static void ddebug_attach_module_classes(struct ddebug_table *dt,
+					 struct ddebug_class_map *classes,
+					 int num_classes)
+{
+	struct ddebug_class_map *cm;
+	int i, j, ct = 0;
+
+	for (cm = classes, i = 0; i < num_classes; i++, cm++) {
+
+		if (!strcmp(cm->mod_name, dt->mod_name)) {
+
+			v2pr_info("class[%d]: module:%s base:%d len:%d ty:%d\n", i,
+				  cm->mod_name, cm->base, cm->length, cm->map_type);
+
+			for (j = 0; j < cm->length; j++)
+				v3pr_info(" %d: %d %s\n", j + cm->base, j,
+					  cm->class_names[j]);
+
+			list_add(&cm->link, &dt->maps);
+			ct++;
+		}
+	}
+	if (ct)
+		vpr_info("module:%s attached %d classes\n", dt->mod_name, ct);
+}
+
 /*
  * Allocate a new ddebug_table for the given module
  * and add it to the global list.
@@ -952,6 +978,10 @@ static int __ddebug_add_module(struct _ddebug_info *di, unsigned int base,
 	dt->num_ddebugs = di->num_descs;
 
 	INIT_LIST_HEAD(&dt->link);
+	INIT_LIST_HEAD(&dt->maps);
+
+	if (di->classes && di->num_classes)
+		ddebug_attach_module_classes(dt, di->classes, di->num_classes);
 
 	mutex_lock(&ddebug_lock);
 	list_add_tail(&dt->link, &ddebug_tables);
-- 
2.37.2

