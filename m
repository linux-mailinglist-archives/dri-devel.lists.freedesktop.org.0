Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A369357BA32
	for <lists+dri-devel@lfdr.de>; Wed, 20 Jul 2022 17:34:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 978F78F46E;
	Wed, 20 Jul 2022 15:33:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x135.google.com (mail-il1-x135.google.com
 [IPv6:2607:f8b0:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06F0A8EE21;
 Wed, 20 Jul 2022 15:33:12 +0000 (UTC)
Received: by mail-il1-x135.google.com with SMTP id f1so3671756ilu.3;
 Wed, 20 Jul 2022 08:33:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0keNK2iWc5vvIPQtHEufP+pJ7nMjLLdNpxSJECvJiok=;
 b=d+67njnWDelpHaqOD26340pTCyqzyEICJmMm4QUPE12KYfp2LZeBJr7m7AcDyUEbOn
 lHjM4lnOAp9hej2anoPoBYC7lRQ8r6aP0oFPx0ijIlV62GZwlSqYRDmAX9NwXaiUy0Be
 v1vO2IkQTpJWJTm0q/0QY7ggte0Jn0PPp130Ms5NixpFh1wELDJ4o5VpYftq65zxxHqF
 jmLKvidj0PqnopGNco5fN1IjDk5X0jVWnX1hhRRBlVg9htZHLPMpXdwi4wQ0kXseHeKj
 ZAfCf8kN/zW0yUkR/vWnAsN94Wlcm9k4r/qWwFp8vt4bT661KNdqq507Kji+mWuYYMQ/
 14xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0keNK2iWc5vvIPQtHEufP+pJ7nMjLLdNpxSJECvJiok=;
 b=NtLas1tPidw7dcFiuwIigsLCAqAhpcdWN5tm0ldLj86fpGkQjSd0/55aHUh7aNlq9a
 RmtfvaYAe+KjS/5BF7svztJPBB71BaCVNcggUC8dk3PdwoHm1mFNYcrhvuHfKh+YX2ze
 TftmHz3TJT71XhgASWtab5WLav3c/a8nnjVeB9Ef1FYE62uZ4buGvQflZwnA1Cfm2P8B
 VBNI1o+LsCf6nUxNJ6TofZkECfByb4ag4JsemZ+FaeLidQjmonfTDgKj6yRF5p5DjLJh
 DJ/irwJljGCKBOxnWvfu1vn7LRAwYx4eOfj2IuwyWZYZjiO2QUnAknGVmJMQtvQWpXPT
 ivzg==
X-Gm-Message-State: AJIora+csAnM3E2LKxUmTLrERB2mgfS99fzUCPGiL1Ku7K5J8cRfTLnm
 lUlYC2/k20f5nWiFw0Soi8jWqC1jCzb7TA==
X-Google-Smtp-Source: AGRyM1s4EXyRHWLAXXSXnUPQRetY3sLBQCIRzQd0Zg6vDllrcgW8/C0Gh2tsl3MCdLpW7MnR3nt6TQ==
X-Received: by 2002:a92:2a0a:0:b0:2d9:2571:f57e with SMTP id
 r10-20020a922a0a000000b002d92571f57emr18809012ile.154.1658331191870; 
 Wed, 20 Jul 2022 08:33:11 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 q1-20020a92d401000000b002dcdb4bbe87sm4579581ilm.22.2022.07.20.08.33.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Jul 2022 08:33:11 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 jbaron@akamai.com, gregkh@linuxfoundation.org, daniel.vetter@ffwll.ch,
 seanpaul@chromium.org, robdclark@gmail.com
Subject: [PATCH v4 14/41] dyndbg: add ddebug_attach_module_classes
Date: Wed, 20 Jul 2022 09:32:06 -0600
Message-Id: <20220720153233.144129-15-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220720153233.144129-1-jim.cromie@gmail.com>
References: <20220720153233.144129-1-jim.cromie@gmail.com>
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

