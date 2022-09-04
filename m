Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FF665AC763
	for <lists+dri-devel@lfdr.de>; Sun,  4 Sep 2022 23:47:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6022110E278;
	Sun,  4 Sep 2022 21:43:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com
 [IPv6:2607:f8b0:4864:20::d2e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5621F10E16D;
 Sun,  4 Sep 2022 21:42:25 +0000 (UTC)
Received: by mail-io1-xd2e.google.com with SMTP id p187so5652771iod.8;
 Sun, 04 Sep 2022 14:42:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=ygTuajbmVKRymZcTR8l4AYG1vTV31KkFalfQRqvEO70=;
 b=qb+eXUS2FeGvpVtJ7v+DpOZwxGybLXxNLvokvSQTdNFeUtdY8CsheY5eB/SHmPx4O9
 huSEsSDTQKrSj+0Puiw+lGBf49Y4J1xWJgf6Ap2MJoyUCbw2fAY5nQAAJERXo7vJ7beG
 uEy7TG4owjT8onLbXW0wMRyVFiQeDhNfDDdJsyJhbLqVj3VikXMuVtM2AfKuFTkruuIT
 ZEtn5PQ+tih96gGXNgsH2cVDPtvjPYgq/XfBF5eBzbkWlcn29wqz/HPJB8mdX0xxRHTF
 eqZ20NxASPafvwnESXcu++44WdfCGPEIGsJqdmjGZ4Ebkk3JbphMGW8Ilt+BN7LlYeLQ
 RQIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=ygTuajbmVKRymZcTR8l4AYG1vTV31KkFalfQRqvEO70=;
 b=wqyswgqSS+xjxhGFgvJszBg+HlA73UKzKlDubqKST3aa2GcfrSxGUyVPbJM8ELYkty
 zDiRUy3ZzFtvddHO1aHNwQzyZ9yzHqszranMyOCaNsBvrAsBNOGrDg1mtjq49SufJwa/
 Gi4IIn4K07Ro7GV8DFG2fMEMM1ySJWfIGkxZph2YzPoXn1d02uNlJTlQocom/QqomJT0
 u0yc3YWLypTLNweEICsH7G2+r+OFW5JuJS+5on2SkIOX2UqktQkQQs9GJ79UlZkLsomj
 7eiXP8eHwNu3KmdRtZ2eYeOIfzNMhlv26hXD1CKclxIvH2Xx+BQNdvZKMR903AqpJ2sc
 4i/w==
X-Gm-Message-State: ACgBeo1XsD8v5gJMF8LxRX/lxYzdJNh6/hAFelEYRgjq08/OvgjcURqr
 SRh2pLPzwgSVgahrgx72aj8=
X-Google-Smtp-Source: AA6agR6i2bEKl1Cs2088Bgc9CVI77OTinqvJI0IWGolf9NIA7tDBAIrKIIWBixVDBMgcEhK2nR9WNg==
X-Received: by 2002:a05:6638:4091:b0:342:e406:45d8 with SMTP id
 m17-20020a056638409100b00342e40645d8mr25310655jam.130.1662327744496; 
 Sun, 04 Sep 2022 14:42:24 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 e12-20020a056602044c00b006889ea7be7bsm3727688iov.29.2022.09.04.14.42.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Sep 2022 14:42:24 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, gregkh@linuxfoundation.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v6 15/57] kernel/module: add __dyndbg_classes section
Date: Sun,  4 Sep 2022 15:40:52 -0600
Message-Id: <20220904214134.408619-16-jim.cromie@gmail.com>
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

Add __dyndbg_classes section, using __dyndbg as a model. Use it:

vmlinux.lds.h:

KEEP the new section, which also silences orphan section warning on
loadable modules.  Add (__start_/__stop_)__dyndbg_classes linker
symbols for the c externs (below).

kernel/module/main.c:
- fill new fields in find_module_sections(), using section_objs()
- extend callchain prototypes
  to pass classes, length
  load_module(): pass new info to dynamic_debug_setup()
  dynamic_debug_setup(): new params, pass through to ddebug_add_module()

dynamic_debug.c:
- add externs to the linker symbols.

ddebug_add_module():
- It currently builds a debug_table, and *will* find and attach classes.

dynamic_debug_init():
- add class fields to the _ddebug_info cursor var: di.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 include/asm-generic/vmlinux.lds.h | 3 +++
 include/linux/dynamic_debug.h     | 2 ++
 kernel/module/main.c              | 2 ++
 lib/dynamic_debug.c               | 7 +++++++
 4 files changed, 14 insertions(+)

diff --git a/include/asm-generic/vmlinux.lds.h b/include/asm-generic/vmlinux.lds.h
index 7515a465ec03..9b8bd5504ad9 100644
--- a/include/asm-generic/vmlinux.lds.h
+++ b/include/asm-generic/vmlinux.lds.h
@@ -345,6 +345,9 @@
 	*(__tracepoints)						\
 	/* implement dynamic printk debug */				\
 	. = ALIGN(8);							\
+	__start___dyndbg_classes = .;					\
+	KEEP(*(__dyndbg_classes))					\
+	__stop___dyndbg_classes = .;					\
 	__start___dyndbg = .;						\
 	KEEP(*(__dyndbg))						\
 	__stop___dyndbg = .;						\
diff --git a/include/linux/dynamic_debug.h b/include/linux/dynamic_debug.h
index 98dbf1d49984..9073a43a2039 100644
--- a/include/linux/dynamic_debug.h
+++ b/include/linux/dynamic_debug.h
@@ -114,7 +114,9 @@ struct ddebug_class_map {
 /* encapsulate linker provided built-in (or module) dyndbg data */
 struct _ddebug_info {
 	struct _ddebug *descs;
+	struct ddebug_class_map *classes;
 	unsigned int num_descs;
+	unsigned int num_classes;
 };
 
 #if defined(CONFIG_DYNAMIC_DEBUG_CORE)
diff --git a/kernel/module/main.c b/kernel/module/main.c
index 4c20bc3ff203..6aa6153aa6e0 100644
--- a/kernel/module/main.c
+++ b/kernel/module/main.c
@@ -2113,6 +2113,8 @@ static int find_module_sections(struct module *mod, struct load_info *info)
 
 	info->dyndbg.descs = section_objs(info, "__dyndbg",
 					sizeof(*info->dyndbg.descs), &info->dyndbg.num_descs);
+	info->dyndbg.classes = section_objs(info, "__dyndbg_classes",
+					sizeof(*info->dyndbg.classes), &info->dyndbg.num_classes);
 
 	return 0;
 }
diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index c358ccdf4a39..fb31a1a2fc3f 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -41,6 +41,8 @@
 
 extern struct _ddebug __start___dyndbg[];
 extern struct _ddebug __stop___dyndbg[];
+extern struct ddebug_class_map __start___dyndbg_classes[];
+extern struct ddebug_class_map __stop___dyndbg_classes[];
 
 struct ddebug_table {
 	struct list_head link;
@@ -1079,7 +1081,9 @@ static int __init dynamic_debug_init(void)
 
 	struct _ddebug_info di = {
 		.descs = __start___dyndbg,
+		.classes = __start___dyndbg_classes,
 		.num_descs = __stop___dyndbg - __start___dyndbg,
+		.num_classes = __stop___dyndbg_classes - __start___dyndbg_classes,
 	};
 
 	if (&__start___dyndbg == &__stop___dyndbg) {
@@ -1122,6 +1126,9 @@ static int __init dynamic_debug_init(void)
 		 i, mod_ct, (int)((mod_ct * sizeof(struct ddebug_table)) >> 10),
 		 (int)((i * sizeof(struct _ddebug)) >> 10));
 
+	if (di.num_classes)
+		v2pr_info("  %d builtin ddebug class-maps\n", di.num_classes);
+
 	/* now that ddebug tables are loaded, process all boot args
 	 * again to find and activate queries given in dyndbg params.
 	 * While this has already been done for known boot params, it
-- 
2.37.2

