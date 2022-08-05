Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 314C558B1F2
	for <lists+dri-devel@lfdr.de>; Fri,  5 Aug 2022 23:57:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53512A50E4;
	Fri,  5 Aug 2022 21:55:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com
 [IPv6:2607:f8b0:4864:20::d29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC40A12A287;
 Fri,  5 Aug 2022 21:54:38 +0000 (UTC)
Received: by mail-io1-xd29.google.com with SMTP id v185so2831621ioe.11;
 Fri, 05 Aug 2022 14:54:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=03YfOG/DYkz2iArGNb3db5n/xIxeb8G0N8JzLa+YgtM=;
 b=Ef8WxDG6NyTqC1EZi34gpAEnT+rPZyUcpKaupYnsastTiTGt/Zml/WC2ZzmjZbPHJd
 phHYyJnYLo6WNB7AlpKLXeN7qbGd1YhUzPvz54QZqQHrtKcLgdsPeyn5+iu9TjI7SjCc
 Qt/6C50I1yy1ZjGFAU+VCo8OEqIPU+1me4r5nevY5orszEf7tJIjZit7XmergLU/BhIS
 ORDvsxyCYrTMPQgMLi5PvpsAC4TmoxZwKTf11WtCzm1JE0tcK5kecwMswiOh5HEtMNgs
 rPlk4sTnLuYzZlm/RO3Nt/CpOY5B3amJFFyJpZOUJOsMWYTIJo5Bn0xeyqAHZ46Benmm
 PB+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=03YfOG/DYkz2iArGNb3db5n/xIxeb8G0N8JzLa+YgtM=;
 b=H9j5ysJeydsvvaDAsiJGDC3i6p2gY42S1i2d8qEofn+0uLfwQz9aObXa6R2LRSP9et
 D+4+nUKCNsAfm7m88ayQ7ZbYG98Kmxt5lVt1krpEyyWGNZCuW8QgmxerbJhgmaCuZc8M
 1wMRqdXYz3LrIyUNiWk7lk4o4CWddNz7ZpSrY3uVW4QDYuTklUVRsmpQJfTv/gJvBhsu
 ZDdlawkW1oSsm+b9Pj5KEyEkAJeNhcmtJ2TKGkBa7Pz/1IrsRYYNxP3UBtk3y3M/XuFC
 7ypgoVuoTUMPcSZJguVlMNgH5L2SvkgulS3KTLOyVT5zqIc6IkRl5NjNXNecwLAt4pdF
 5afQ==
X-Gm-Message-State: ACgBeo136hg02A1/SF1eNbVyX2Qp9xa5pTJ1MRyJytWYR2yTeAOQxnUu
 WcyLxZjisf8DXC0UHZrHOf4SmVcmDNj5Sg==
X-Google-Smtp-Source: AA6agR55/RU9MHoTbUutY3ptQmA/V1qzWroUOdNy6Xs+Ay1Qupqmyek5BzBPcr17ZMFLvPmsNZWM3A==
X-Received: by 2002:a05:6638:d86:b0:341:4ece:3c4 with SMTP id
 l6-20020a0566380d8600b003414ece03c4mr3708242jaj.235.1659736477900; 
 Fri, 05 Aug 2022 14:54:37 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 e12-20020a056602044c00b0067c09fd0b53sm1765532iov.21.2022.08.05.14.54.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Aug 2022 14:54:37 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, jbaron@akamai.com,
 gregkh@linuxfoundation.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-arm-msm@vger.kernel.org
Subject: [PATCH v5 16/33] dyndbg: add ddebug_attach_module_classes
Date: Fri,  5 Aug 2022 15:53:38 -0600
Message-Id: <20220805215355.3509287-17-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220805215355.3509287-1-jim.cromie@gmail.com>
References: <20220805215355.3509287-1-jim.cromie@gmail.com>
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
Cc: daniel.vetter@ffwll.ch, seanpaul@chromium.org
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
pointers to save.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 lib/dynamic_debug.c | 34 +++++++++++++++++++++++++++++++++-
 1 file changed, 33 insertions(+), 1 deletion(-)

diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index 0d6cb6b258bd..a3ace5866f1b 100644
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
@@ -953,6 +979,12 @@ static int __ddebug_add_module(struct _ddebug_info *di, unsigned int base,
 
 	INIT_LIST_HEAD(&dt->link);
 
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
2.37.1

