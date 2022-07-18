Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 34835577B77
	for <lists+dri-devel@lfdr.de>; Mon, 18 Jul 2022 08:40:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5F80A9D2F;
	Mon, 18 Jul 2022 06:39:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com
 [IPv6:2607:f8b0:4864:20::d2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C86F9A9C7E;
 Mon, 18 Jul 2022 06:38:34 +0000 (UTC)
Received: by mail-io1-xd2b.google.com with SMTP id l24so8516815ion.13;
 Sun, 17 Jul 2022 23:38:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0keNK2iWc5vvIPQtHEufP+pJ7nMjLLdNpxSJECvJiok=;
 b=FxC846ClQVIi+f6PMtM9tRIoxL3e5paGcXhJwJWz/sjH6UiqFgNZ6DhU/PxJJacxqx
 oU8iwKjYgieiVTqtM856BZ+6MM7e4Ed1F04bSOTM+mxMGrKLFu3melGweyMyyOlS6IHS
 ABAjwrdrOV1BKjkLVt7T/mXqHF9FqY/3pfxFXHLc+1iQfRQAc6tmfaKGHOZATyrQBA8R
 ohxIBPzm3Iix72eObA6EqHH6bXAIsQcUjHe0thBhtJTIHkEUcYDqAI/IOSlXNd8C+LkF
 dbFjWYJ7h+uk6N+EJnlkFMJyCCpJGvTOGYoLSEalz9C73MdI9BuSU5BcnVX8qQP6M9eT
 rKoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0keNK2iWc5vvIPQtHEufP+pJ7nMjLLdNpxSJECvJiok=;
 b=00FAAdFKpZ0KAsvAXM2m3kZidjSlroqKIMwHB0+Pd1Zx0JTCijqq0i8nvYTOcuLLmo
 G9mwWzvy6U/X+AsFPIdkLeJa38UwlG/7mh2Uwcolk5YuzoSnoXfuD3EimiGh8VEooLaL
 PcfqermpnWHCBW93Pc1sQLVJh+CVPQUQMb4wwmzsOZKcupjbnes78ftVTVTkB+3BfpTj
 GlIcyE52nVbh5oIW2/CeA54a8j2Rdv1qAQLEtN35xeWxyELlkSagyVj2Njd1i1Og2UqE
 GFxhPp7cXETZKNB2cxzBxcQA93jD3YWXcc6nejdIuE8vC4hpQIp2sfNtXjG3kWRF5et3
 E4TQ==
X-Gm-Message-State: AJIora8EwmHk9/0REJWAJZUvIZuyERc/u3UbFgsNpwAJeMXgvWz0hIV0
 3ilzJ+PWK7cK7tVHL1Hmrds=
X-Google-Smtp-Source: AGRyM1sja1SHJIrCETpqnn0UQIv8wyl5xm/spjHbsIPj6nJIEkLF/62jjUUyRgNuCfdmCdhRCzdtlw==
X-Received: by 2002:a05:6638:1616:b0:341:6400:cccb with SMTP id
 x22-20020a056638161600b003416400cccbmr3871449jas.299.1658126314053; 
 Sun, 17 Jul 2022 23:38:34 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 o12-20020a92a80c000000b002dcd35bb030sm2342604ilh.74.2022.07.17.23.38.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Jul 2022 23:38:33 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com
Subject: [PATCH v3 14/41] dyndbg: add ddebug_attach_module_classes
Date: Mon, 18 Jul 2022 00:35:58 -0600
Message-Id: <20220718063641.9179-15-jim.cromie@gmail.com>
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

RFC:

Its (highly) likely that builtin classes will be ordered by module
name (just like prdbg descriptors are in the __dyndbg section).  So
the list can be replaced by a vector (ptr + length), which will work
for loaded modules too.  This would imitate whats currently done for
the _ddebug descriptors.

That said, converting to vector,len is close to pointless; a small
minority of modules will ever define a class-map, and almost all of
them will have only 1 or 2 class-maps, so theres only a couple dozen
pointers to save.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 lib/dynamic_debug.c | 34 +++++++++++++++++++++++++++++++++-
 1 file changed, 33 insertions(+), 1 deletion(-)

diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index b6d80ba25bf5..e29730686cfb 100644
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
@@ -946,6 +972,12 @@ int ddebug_add_module(struct _ddebug *tab, unsigned int num_debugs,
 	dt->num_ddebugs = num_debugs;
 	dt->ddebugs = tab;
 
+	INIT_LIST_HEAD(&dt->link);
+	INIT_LIST_HEAD(&dt->maps);
+
+	if (classes && num_classes)
+		ddebug_attach_module_classes(dt, classes, num_classes);
+
 	mutex_lock(&ddebug_lock);
 	list_add_tail(&dt->link, &ddebug_tables);
 	mutex_unlock(&ddebug_lock);
-- 
2.36.1

