Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F0C8A577BD1
	for <lists+dri-devel@lfdr.de>; Mon, 18 Jul 2022 08:41:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A845A9DF5;
	Mon, 18 Jul 2022 06:40:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x12f.google.com (mail-il1-x12f.google.com
 [IPv6:2607:f8b0:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE709A9DA4;
 Mon, 18 Jul 2022 06:39:31 +0000 (UTC)
Received: by mail-il1-x12f.google.com with SMTP id c16so4317778ils.7;
 Sun, 17 Jul 2022 23:39:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UI797gthTzsKQz4UC9U2UIsi1BTd/WhNl6933XAQbZ4=;
 b=f43LFaj608ze6ozZk4VKeO33ZLWMOOojxLUmJ7LEeiD+4x56rjGnPebHrfk3Cho/OK
 hofvFaByKVFqNznKwkziLToWE6HdxehJVMLzhmThEvwEK2CPTsyDOZR+oEoig7yqF1Ho
 hk4FtIIZvizYVvkdbEzeMfj5Cejy86Y1fctUrGdt62G2e/+GwanKeTXqIAJoL/hJL84y
 ERtq/dRQUQGw76Q3Cn1FsT2D73SfSOaKukhDpdzq7Bi9nuUmlzvXcGm10V6WuX3y8bJ0
 D3vsv4HDU4cY/fFSa9Pq4MioSvTiKky264nmif2VFFf3Etl3Zn1x1GRgnoBQ6n14v6hA
 xdrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UI797gthTzsKQz4UC9U2UIsi1BTd/WhNl6933XAQbZ4=;
 b=Vq++sLqoSCWanLjQqFcLnsObzWHIpY0UV+4QXmVoHpbWOKSXzfWin8TtSlmXStB3cL
 yIZov/WsgRFOxIeQ+jjo7unGZ0qSzcIJCcAAtw9rcCdhLEcggH6+PTsaE9YZb0CC6ooF
 twFJmvvUPl90GYXTvcQwRA0kBsWA8DHQwv4K3qWxAiRvo0Ub/UMlUWT1z6k7ySntYL4u
 cw7eiMAOYEXCsBWFpqScxHmtSPd96xUWMa62yxQtvTqd1y8T1vFaRxqfcJSI7ao2gJ93
 j0g5Y+EyPgS/4krckqUjx3vaWkoPr7dAWnCjHkmeoC5PYbIljXs30IYYC190uCksbrMF
 HDGQ==
X-Gm-Message-State: AJIora8w50K7OCEPWpx79lwLd2v9OT5dWIec7hXOv0irtvIGnDyq76WH
 q+k9VyzTd2dHqK/n0apJvvU=
X-Google-Smtp-Source: AGRyM1uU/W7sVgBywmdq4f7AYm2RGP2Prq92TcUVVy64b1LhMl2lBnCzJZwu6YempPq+3WxxY1KE7g==
X-Received: by 2002:a05:6e02:1583:b0:2d7:a75d:888f with SMTP id
 m3-20020a056e02158300b002d7a75d888fmr12678536ilu.13.1658126371511; 
 Sun, 17 Jul 2022 23:39:31 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 o12-20020a92a80c000000b002dcd35bb030sm2342604ilh.74.2022.07.17.23.39.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Jul 2022 23:39:30 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com
Subject: [PATCH v3 41/41] nouveau-dyndbg: wip subdev refine, breaks on use
Date: Mon, 18 Jul 2022 00:36:41 -0600
Message-Id: <20220718063641.9179-58-jim.cromie@gmail.com>
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

Change nvkm_subdev.debug to a ulong, so dyndbg can maybe use it.

Move macro decl from nv-drm.c to subdev.c, and add a struct
ddebug_classes_bitmap_param and a module_param_cb() that creates the
sysfs-knob.

Finally, in nvkm_subdev_ctor(), *attempt* to set dyndbg's pointer to
the debug address, so that dyndbg can observe the underlying debug
value, and make enable/disable decisions based upon it.

But Im not getting the ctor called, so the ptr is NULL when refd.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 .../drm/nouveau/include/nvkm/core/subdev.h    |  2 +-
 drivers/gpu/drm/nouveau/nouveau_drm.c         |  7 ------
 drivers/gpu/drm/nouveau/nvkm/core/subdev.c    | 23 +++++++++++++++++++
 3 files changed, 24 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/include/nvkm/core/subdev.h b/drivers/gpu/drm/nouveau/include/nvkm/core/subdev.h
index d5f6ca05d5fa..05807403fdd6 100644
--- a/drivers/gpu/drm/nouveau/include/nvkm/core/subdev.h
+++ b/drivers/gpu/drm/nouveau/include/nvkm/core/subdev.h
@@ -19,7 +19,7 @@ struct nvkm_subdev {
 	enum nvkm_subdev_type type;
 	int inst;
 	char name[16];
-	u32 debug;
+	unsigned long debug;
 	struct list_head head;
 
 	void **pself;
diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index 85b63b527877..d45c71ffc09e 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -90,13 +90,6 @@ DECLARE_DYNDBG_CLASSMAP(nv_cli_debug_verbose, DD_CLASS_TYPE_VERBOSE, 10,
 			"NV_CLI_DBG_TRACE",
 			"NV_CLI_DBG_SPAM");
 
-DECLARE_DYNDBG_CLASSMAP(nv_subdev_debug_verbose, DD_CLASS_TYPE_VERBOSE, 15,
-			"NV_SUBDEV_DBG_OFF",
-			"NV_SUBDEV_DBG_INFO",
-			"NV_SUBDEV_DBG_DEBUG",
-			"NV_SUBDEV_DBG_TRACE",
-			"NV_SUBDEV_DBG_SPAM");
-
 MODULE_PARM_DESC(config, "option string to pass to driver core");
 static char *nouveau_config;
 module_param_named(config, nouveau_config, charp, 0400);
diff --git a/drivers/gpu/drm/nouveau/nvkm/core/subdev.c b/drivers/gpu/drm/nouveau/nvkm/core/subdev.c
index a74b7acb6832..227871c3a749 100644
--- a/drivers/gpu/drm/nouveau/nvkm/core/subdev.c
+++ b/drivers/gpu/drm/nouveau/nvkm/core/subdev.c
@@ -26,6 +26,27 @@
 #include <core/option.h>
 #include <subdev/mc.h>
 
+#include <linux/dynamic_debug.h>
+#include <linux/module.h>
+
+#define DEBUG
+
+DECLARE_DYNDBG_CLASSMAP(nv_subdev_debug_verbose, DD_CLASS_TYPE_VERBOSE, 15,
+			"NV_SUBDEV_DBG_OFF",
+			"NV_SUBDEV_DBG_INFO",
+			"NV_SUBDEV_DBG_DEBUG",
+			"NV_SUBDEV_DBG_TRACE",
+			"NV_SUBDEV_DBG_SPAM");
+
+static struct ddebug_classes_bitmap_param nv_subdev_verbose = {
+	.bits = NULL, // wants &_subdev->debug
+	.flags = "p",
+	.map = &nv_subdev_debug_verbose,
+};
+module_param_cb(debug_subdev, &param_ops_dyndbg_classes, &nv_subdev_verbose, 0600);
+
+
+
 const char *
 nvkm_subdev_type[NVKM_SUBDEV_NR] = {
 #define NVKM_LAYOUT_ONCE(type,data,ptr,...) [type] = #ptr,
@@ -180,6 +201,8 @@ nvkm_subdev_ctor(const struct nvkm_subdev_func *func, struct nvkm_device *device
 	else
 		strscpy(subdev->name, nvkm_subdev_type[type], sizeof(subdev->name));
 	subdev->debug = nvkm_dbgopt(device->dbgopt, subdev->name);
+	nv_subdev_verbose.bits = &subdev->debug;
+	pr_debug("updated bitmap: %px\n", &nv_subdev_verbose.bits);
 	list_add_tail(&subdev->head, &device->subdev);
 }
 
-- 
2.36.1

