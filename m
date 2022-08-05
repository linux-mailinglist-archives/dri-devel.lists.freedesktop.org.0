Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DADE58B1FB
	for <lists+dri-devel@lfdr.de>; Fri,  5 Aug 2022 23:58:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5946BA5BF0;
	Fri,  5 Aug 2022 21:55:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com
 [IPv6:2607:f8b0:4864:20::d32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FC7712ADB2;
 Fri,  5 Aug 2022 21:54:37 +0000 (UTC)
Received: by mail-io1-xd32.google.com with SMTP id q124so2869935iod.3;
 Fri, 05 Aug 2022 14:54:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=T7Gv4hwZzTdpj2N7T4svMFG77jA8WU8rV9TsGh2u6B0=;
 b=DjCGd7nja7GLoKs/YEi+AypGd/X5RUZGGqxDmaVd6Ctsnq6XlGUVNUtvQyQJ/w8ejL
 pZ7HppMOc0bnl8TstfhIQgOAyWPXRR+4KnI/LumnfLg5LQ2p7ucvrwj3RD3UE6Nqy/l8
 65NtEWs5YCTXHe58FpUirbUlfw69LWASsPbeV2MQZXNhwNO7rDaZEDU2eS3I1W6qvAJn
 kaBxgCvuGWYxhtv44ILt5Ei88UZauIudeV3qaEOW7BcnWe0lp5cwMuja93PlcWYM9p4u
 PGvF3xS9gVgb4jDLgtRqZyQpMz+4eB9SSWkfPHFL6dfZ8OD5XWLDteNzMQg8vIKXGYfj
 hH1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=T7Gv4hwZzTdpj2N7T4svMFG77jA8WU8rV9TsGh2u6B0=;
 b=iEofSBycU2oVXxxPgn++AXxDF1ZNX52IkZBNtLVS7ed0xwUk1IAFlEMc0V2OhKhXER
 HnC3TRG3nyV0vz2O8+Yu7h6jn6jlB0EHb6/lLCwdjpBkH2vcJZGb0LoKviishOuJ830k
 wxLZaNz7u0j7DJ/qM0VDacBHPmDrXK9bNzW8+WXK5m/w99IaSB3shw28WGj7v4PfjApt
 69IJDpNCENvQU/dXyGrCLjjHuVOHp1SSj9DHmLSPS5O2+mfDlzEcVT7NnCf9a2pxAUpL
 1g6zjukDS/piB+mYcVtd3MmEsRH04RmTK4P0VzfjXFZcppT9tg3IWIF8SFP1F8Tnq5nt
 rG/g==
X-Gm-Message-State: ACgBeo3lX+klQoe2g6w8QsB8Gia0WqifxaI/M7wr8yKz3mSP+mTPrU60
 9xZ+XC0Ie5aY1fkTPlsbq6k=
X-Google-Smtp-Source: AA6agR6ZuhPO2oFawvVRsW7GJ9C/KsGqggvTjGHRxhiW0IA8Nx9Nnyq3ipyOdpphdUyK/Rp71ztUcA==
X-Received: by 2002:a05:6638:300e:b0:335:c73c:3d25 with SMTP id
 r14-20020a056638300e00b00335c73c3d25mr3886676jak.77.1659736476898; 
 Fri, 05 Aug 2022 14:54:36 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 e12-20020a056602044c00b0067c09fd0b53sm1765532iov.21.2022.08.05.14.54.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Aug 2022 14:54:36 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, jbaron@akamai.com,
 gregkh@linuxfoundation.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-arm-msm@vger.kernel.org
Subject: [PATCH v5 15/33] kernel/module: add __dyndbg_classes section
Date: Fri,  5 Aug 2022 15:53:37 -0600
Message-Id: <20220805215355.3509287-16-jim.cromie@gmail.com>
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
index 71cdc8612257..46ed10682e87 100644
--- a/include/linux/dynamic_debug.h
+++ b/include/linux/dynamic_debug.h
@@ -115,7 +115,9 @@ struct ddebug_class_map {
 /* encapsulate linker provided built-in (or module) dyndbg data */
 struct _ddebug_info {
 	struct _ddebug *descs;
+	struct ddebug_class_map *classes;
 	unsigned int num_descs;
+	unsigned int num_classes;
 };
 
 #if defined(CONFIG_DYNAMIC_DEBUG_CORE)
diff --git a/kernel/module/main.c b/kernel/module/main.c
index cfe10356793d..f68f331c867d 100644
--- a/kernel/module/main.c
+++ b/kernel/module/main.c
@@ -2095,6 +2095,8 @@ static int find_module_sections(struct module *mod, struct load_info *info)
 
 	info->dyndbg.descs = section_objs(info, "__dyndbg",
 					sizeof(*info->dyndbg.descs), &info->dyndbg.num_descs);
+	info->dyndbg.classes = section_objs(info, "__dyndbg_classes",
+					sizeof(*info->dyndbg.classes), &info->dyndbg.num_classes);
 
 	return 0;
 }
diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index 457ce936191a..0d6cb6b258bd 100644
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
2.37.1

