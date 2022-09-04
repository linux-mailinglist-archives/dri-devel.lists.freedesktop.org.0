Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C73F55AC7D2
	for <lists+dri-devel@lfdr.de>; Sun,  4 Sep 2022 23:50:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4592C10EA5A;
	Sun,  4 Sep 2022 21:44:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x136.google.com (mail-il1-x136.google.com
 [IPv6:2607:f8b0:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7762810E183;
 Sun,  4 Sep 2022 21:43:01 +0000 (UTC)
Received: by mail-il1-x136.google.com with SMTP id h14so3864060ilh.10;
 Sun, 04 Sep 2022 14:43:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=e3ozCdACMZmIXizqK002HFm7hj6BkwsMmmCq1NgZ3+4=;
 b=BbbFDk5Ds3TKsvXVbegzI7CpK80eT1rLEmQAVhGGmkbjefDTu1gcIWX3uZ+Gm3W16k
 3S2yBAZFyR4M8ryCfllvuDfTEF5RipMBjPts8hfi0pV7bgB3wzkcHuY4zKj4khhmKXMX
 pSl1t58XXxStJLZnSVd/tYgQeSDea1W2Q0b2Yjqp1FxlZFqw6LWpNqFhC6szuGaRu8dl
 5KSWJpEvt20IxDYiChjLMX8wBoKwHlILNtfzF8+iMXyfBHmY6aJSuvXzt1gP3PkSoi/Q
 ObHbdHfGYhfOUrMIzj4dzek2gnNfsuuTirJYodRLuPa4LRKsvPAHjppmK36ztUBZgFy/
 TBLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=e3ozCdACMZmIXizqK002HFm7hj6BkwsMmmCq1NgZ3+4=;
 b=4H7/K/9dwxSeIR+S0Ua6L8yAegt1yf4fTq5J+ZJwIEx8hJ797nmNsfkxA/89Fclx4+
 DR/eUB8puQcM+F4FD+aQl8pvXSyyRnbTR+r3mM+bMjKieJWGHtoNpPOuQDLA/O1od8lx
 L7vFvSCFJVKMuE4bf59XFU/9TiCy4E/1jRdomZ9jEbWsQ5IjTgniw5woHOHr5FVg24pl
 WZI1kIzBiuuc7xw4FJgdwys0LndOubm9ZFM7P+8RIg054C0S6nrNCS1JLEIbPPKqAHJ7
 m4XShX1zPnbxzMRmCYoMIVV4brMrbt1Ext6pKGq1EQ1ghzyVMtLPPkrvbgXMDfCHMLkJ
 XNTg==
X-Gm-Message-State: ACgBeo2+r+F+6NGrJvMwMBZx0DKMkMVk8tocVFTEePz6ymA+LXc8ANcM
 Cxqh/KESSHPaGZtjnPPEYYo=
X-Google-Smtp-Source: AA6agR5Ky+BjL0NnfIX4cYKS1KnsINOXh0NpNlMijj01ekGHcYdvtJWlYQecsvf47LfzeAoLHEZ2MA==
X-Received: by 2002:a05:6e02:1524:b0:2ec:71c6:7b85 with SMTP id
 i4-20020a056e02152400b002ec71c67b85mr9725292ilu.237.1662327781031; 
 Sun, 04 Sep 2022 14:43:01 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 e12-20020a056602044c00b006889ea7be7bsm3727688iov.29.2022.09.04.14.43.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Sep 2022 14:43:00 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, gregkh@linuxfoundation.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v6 53/57] dyndbg: add/use is_dyndbg_header then set _uplink
Date: Sun,  4 Sep 2022 15:41:30 -0600
Message-Id: <20220904214134.408619-54-jim.cromie@gmail.com>
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

Add static int is_dyndbg_header(d), which verifies that the arg is
initialized as expected; that it points to the _ddebug_hdr &
_ddebug_site_hdr records initialized by DYNAMIC_DEBUG_TABLE().

That init macro sets the _uplink fields in the 2 records to point at
each other.  This is an impossible situation for the regular callsite
record pairs built by *_METADATA_CLS(), so it provides a robust
verification that linkage happened as we require/depend upon.

In dynamic_debug_init(), is_dyndbg_header() validates the header, and
sets _uplink to builtin_state.

Thereafter, ddebug_map_site() can use it, and we can drop the
_ddebug.site member, and shrink the DATA footprint.
---
 include/linux/dynamic_debug.h |  1 +
 lib/dynamic_debug.c           | 38 +++++++++++++++++++++++++++++++++--
 2 files changed, 37 insertions(+), 2 deletions(-)

diff --git a/include/linux/dynamic_debug.h b/include/linux/dynamic_debug.h
index 23d3d2882882..ed3e1e1c08eb 100644
--- a/include/linux/dynamic_debug.h
+++ b/include/linux/dynamic_debug.h
@@ -149,6 +149,7 @@ struct _ddebug_site_hdr {
 /* encapsulate linker provided built-in (or module) dyndbg vectors */
 struct _ddebug_info {
 	struct _ddebug_hdr *hdr;
+	struct _ddebug_site_hdr *site_hdr;
 	struct _ddebug *descs;
 	struct _ddebug_site *sites;
 	struct ddebug_class_map *classes;
diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index 891d70d7fed4..0a68fbfd8432 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -1339,6 +1339,25 @@ static void ddebug_attach_module_classes(struct ddebug_table *dt,
 		vpr_info("module:%s attached %d classes\n", dt->mod_name, ct);
 }
 
+/*
+ * detect the hardwired loopback initialized into the header pairs'
+ * _uplink member.  In dynamic_debug_init(), it verifies the presence
+ * of the header, before setting its _uplink to either &builtin_state
+ * or the module's embedded _ddebug_info.  __ddebug_add_module() will
+ * also use it..
+ */
+static int is_dyndbg_header(struct _ddebug_hdr *hdr)
+{
+	struct _ddebug_site_hdr *sp;
+
+	if (!hdr || !hdr->_uplink)
+		return 0;
+
+	sp = (struct _ddebug_site_hdr *) ((struct _ddebug_hdr *)hdr)->_uplink;
+	return hdr == (struct _ddebug_hdr *)
+		((struct _ddebug_site_hdr *)sp)->_uplink;
+}
+
 /*
  * Allocate a new ddebug_table for the given module
  * and add it to the global list.
@@ -1351,6 +1370,15 @@ static int __ddebug_add_module(struct _ddebug_info *di, unsigned int base,
 	int i, num_funcs = 0;
 
 	v3pr_info("add-module: %s %d/%d sites, start: %d\n", modname, di->num_descs, di->num_sites, base);
+
+	if (is_dyndbg_header((struct _ddebug_hdr *)&di->descs[0])) {
+		pr_info("module header\n");
+		di->hdr = (struct _ddebug_hdr *) di->descs;
+		di->descs++;
+		di->sites++;
+		di->num_descs--;
+		di->num_sites--;
+	}
 	if (!di->num_descs) {
 		v3pr_info(" skip %s\n", modname);
 		return 0;
@@ -1525,6 +1553,7 @@ static int __init dynamic_debug_init(void)
 
 	struct _ddebug_info di = {
 		.hdr = __dyndbg_header,
+		.site_hdr = __dyndbg_site_header,
 		.descs = __start___dyndbg,
 		.sites = __start___dyndbg_sites,
 		.classes = __start___dyndbg_classes,
@@ -1548,11 +1577,16 @@ static int __init dynamic_debug_init(void)
 		pr_err("unequal vectors: descs/sites %d/%d\n", di.num_descs, di.num_sites);
 		return 1;
 	}
-
 	/* these 2 print the same, until _TABLE is added */
-	v2pr_info("%px %px \n", __dyndbg_header, __dyndbg_site_header);
+	v2pr_info("%px %px \n", di.hdr, __dyndbg_site_header);
 	v2pr_info("%px %px \n", di.descs, di.sites);
 
+	if (is_dyndbg_header(di.hdr)) {
+		di.hdr->_uplink = &builtin_state;
+	} else {
+		pr_err("missing header records: cannot continue!\n");
+		return 1;
+	}
 	iter = iter_mod_start = __start___dyndbg;
 	site = site_mod_start = __start___dyndbg_sites;
 	modname = site->_modname;
-- 
2.37.2

