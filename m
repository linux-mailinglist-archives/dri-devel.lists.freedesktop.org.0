Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 57DAF5AC795
	for <lists+dri-devel@lfdr.de>; Sun,  4 Sep 2022 23:48:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C913910E394;
	Sun,  4 Sep 2022 21:43:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x129.google.com (mail-il1-x129.google.com
 [IPv6:2607:f8b0:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62E6110E1C5;
 Sun,  4 Sep 2022 21:42:57 +0000 (UTC)
Received: by mail-il1-x129.google.com with SMTP id l16so3889251ilj.2;
 Sun, 04 Sep 2022 14:42:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=Ghge3Dg1q/uGEuUESUrEdkwsT+z6CpJtuRfuq34U0Ug=;
 b=FLT5bN9bU1jESQsj9wEWPf6TBBHS0oph0LypFJwzq/K+zCkxyteteH2bTqZQBcNzRk
 mSR3h7PMvUN4YMVkvnO87hK2EpNkCDlGSKyeeqjogwoe6lhs1W0j8NVv5K50LsJtZg06
 R92M/cvFSPip9b/dMAktsgXw9ub1l1yxpBS3OvRLmDew3VfDVMnqQ0y++Z8JirN4wlxB
 lJnxEt70v9wGz0k/jpVu8dHy7KvJOhLu72eHep8RD2rQzQKX8nJI5JvRr6ZFWV/vp1QA
 rb8QvbLzf2xps15VlW8JMp2QgHnpXqCAJLTT4tXeVn3zK7n/t3dqhX+s0crDVymyRVVS
 JLpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=Ghge3Dg1q/uGEuUESUrEdkwsT+z6CpJtuRfuq34U0Ug=;
 b=2vq/Sf2AYTWsYnnXigthBYr5v68eNsVG6irNp3hzww6JuTAzAcHicpYhyqSFYIc/PK
 3SYvGLsA4aIsRG2E09dUZ17h7cX8zEJwsnjp4H7E7PgXjKtO55O7CENuEKj1ei9HCW01
 uSWGYpKpOKqaf1b86edVRk6JemkGoHyDA1N0QnoK22P9HS4Dc3LMsMHAjxhT2uLuO56M
 6DVZkmKb8H/DvCBSJVoQxH0iVmJ2boRG8oN88hiE+0Ch/FPcpefkpbHFiatLrDZ/3gun
 WjorBdWQ70H23Sq1tXp9Onpu/LmONP5JJ0q4LGvYyBtj5FZeR8sTP9V62i4krRAJfrVH
 lnKg==
X-Gm-Message-State: ACgBeo0odY3/dXdk6DrlhTt6VMgeg5kZxafaDbnqMvURcUwu+Ys7nyQY
 8JIfm4JKC8k+LJRCRR/RzcWjq5zZ9lM=
X-Google-Smtp-Source: AA6agR7yrIYfyzVDzlMev9fxaOVFcrN/YRY+eo0Bb7o+kB7gpv9wc7uwho5jDTzaHbxaUMbJjOU49g==
X-Received: by 2002:a92:ad0d:0:b0:2e6:4294:bc45 with SMTP id
 w13-20020a92ad0d000000b002e64294bc45mr24581884ilh.278.1662327777020; 
 Sun, 04 Sep 2022 14:42:57 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 e12-20020a056602044c00b006889ea7be7bsm3727688iov.29.2022.09.04.14.42.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Sep 2022 14:42:56 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, gregkh@linuxfoundation.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v6 49/57] dyndbg: add structs _ddebug_hdr, _ddebug_site_hdr
Date: Sun,  4 Sep 2022 15:41:26 -0600
Message-Id: <20220904214134.408619-50-jim.cromie@gmail.com>
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

Add new structs _ddebug_hdr and _ddebug_site_hdr, latter for symmetry.

The job of the struct _ddebug_hdr is to:

Contain an _uplink member, which points up to the _ddebug_info
record that keeps builtin and module's dyndbg state.  That record is
init'd (by dynamic_debug_init for builtins, or find_module_sections
for loadables).

Be declared in .gnu.linkonce.dyndbg section, which places it just
before the __dyndbg section; a fixed relative offset.

This allows _ddebug_map_site(desc) to cheaply compute
&descs[desc._index], &descs[0], then container_of() to get the header
and its ._uplink, to the _ddebug_info, which gives access to
->sites[desc->_map].

Structurally, the header has a single unnamed union (which exposes its
field names upward) containing an embedded struct _ddebug{,_site}
(this forces the size to be compatible with the array/section its
destined for), shared with our new struct _ddebug_info * _uplink
member, which is also inside an unnamed struct, to allow adding other
fields later to use the remaining space.

In dynamic_debug.c: ref the linker symbols for the headers, print them
to confirm expected linkages; things look proper.  Add a header ref to
struct _ddebug_info, to facilitate the validity checks.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 include/linux/dynamic_debug.h | 23 ++++++++++++++++++++++-
 lib/dynamic_debug.c           |  9 +++++++++
 2 files changed, 31 insertions(+), 1 deletion(-)

diff --git a/include/linux/dynamic_debug.h b/include/linux/dynamic_debug.h
index 268e903b7c4e..f23608c38a79 100644
--- a/include/linux/dynamic_debug.h
+++ b/include/linux/dynamic_debug.h
@@ -126,8 +126,29 @@ struct ddebug_class_map {
 #define NUM_TYPE_ARGS(eltype, ...)				\
         (sizeof((eltype[]){__VA_ARGS__}) / sizeof(eltype))
 
-/* encapsulate linker provided built-in (or module) dyndbg data */
+/* define header record, linker inserts it at descs[0] */
+struct _ddebug_hdr {
+	union {
+		struct _ddebug __;  /* force sizeof this */
+		struct {
+			struct _ddebug_info * _uplink;
+			/* space available */
+		};
+	};
+};
+/* here for symmetry, extra storage */
+struct _ddebug_site_hdr {
+	union {
+		struct _ddebug_site __;  /* force sizeof this */
+		struct {
+			struct _ddebug_info  * _uplink;
+		};
+	};
+};
+
+/* encapsulate linker provided built-in (or module) dyndbg vectors */
 struct _ddebug_info {
+	struct _ddebug_hdr *hdr;
 	struct _ddebug *descs;
 	struct _ddebug_site *sites;
 	struct ddebug_class_map *classes;
diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index 65b0a1025ddf..91fe7fb5dda9 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -49,6 +49,9 @@ extern struct _ddebug_site __stop___dyndbg_sites[];
 extern struct ddebug_class_map __start___dyndbg_classes[];
 extern struct ddebug_class_map __stop___dyndbg_classes[];
 
+extern struct _ddebug_hdr __dyndbg_header[];
+extern struct _ddebug_site_hdr __dyndbg_site_header[];
+
 struct ddebug_table {
 	struct list_head link, maps;
 	const char *mod_name;
@@ -1522,6 +1525,7 @@ static int __init dynamic_debug_init(void)
 	char *cmdline;
 
 	struct _ddebug_info di = {
+		.hdr = __dyndbg_header,
 		.descs = __start___dyndbg,
 		.sites = __start___dyndbg_sites,
 		.classes = __start___dyndbg_classes,
@@ -1545,6 +1549,11 @@ static int __init dynamic_debug_init(void)
 		pr_err("unequal vectors: descs/sites %d/%d\n", di.num_descs, di.num_sites);
 		return 1;
 	}
+
+	/* these 2 print the same, until _TABLE is added */
+	v2pr_info("%px %px \n", __dyndbg_header, __dyndbg_site_header);
+	v2pr_info("%px %px \n", di.descs, di.sites);
+
 	iter = iter_mod_start = __start___dyndbg;
 	site = site_mod_start = __start___dyndbg_sites;
 	modname = site->_modname;
-- 
2.37.2

