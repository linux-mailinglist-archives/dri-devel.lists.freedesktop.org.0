Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60A1C57BA64
	for <lists+dri-devel@lfdr.de>; Wed, 20 Jul 2022 17:35:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 239DC8F42E;
	Wed, 20 Jul 2022 15:34:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x12f.google.com (mail-il1-x12f.google.com
 [IPv6:2607:f8b0:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A75508F515;
 Wed, 20 Jul 2022 15:33:41 +0000 (UTC)
Received: by mail-il1-x12f.google.com with SMTP id l11so7322724ilf.11;
 Wed, 20 Jul 2022 08:33:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UI797gthTzsKQz4UC9U2UIsi1BTd/WhNl6933XAQbZ4=;
 b=Poas9gejc/b0A8dAg0bmZULf8ICEokfcNYpJEm09owl4HGVqEUefiujLlAhXL+LupH
 Ete2bN5SFEI+aVfScM6EXw89Cssp4j3sjXV78gQh/592OEgFrHFEKFDsGnrGUeIEJUK+
 EygsDXs3ZN7AZHWYZoWmtcfJe3nRw0wTAxk13HpS5a8Qe6qPQA1PXLlVhngW5TbdLkX3
 YuA9hTFyyiCXC7dd/ZRc7UZgc33hwYgOjSFqt5ZG07ePvP4o/7Tbk5gbajCuOSlUNEEF
 zHnZxfQHWkUvbwenvdI4SSckIZb44yjFweu6AtjqTQ6qaJ+t9Zrbo7Z5M8MNeHE84B3z
 Y6bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UI797gthTzsKQz4UC9U2UIsi1BTd/WhNl6933XAQbZ4=;
 b=RX0R6tY0AUZM59/6oYuBiD0sSk+NOFvHJpaLRXzlRHczuEdllvnibzYnZP9lHlO1gT
 pbDAJUw4vWvG4vwyydGIb36q81KG5DQXlKeNOcJDg/qv1VGQ2HZ3PK1MWCF9nBRKdOJT
 3W/xqrO85lrFi53DI23UtH+X9HoDv4pzeGA16oTpki7fZbQaFu+X5ZcjGO6L808qzxzh
 PtR8RucAlYgcXz5CFtdhXZa8Kxz21/MwUdDFnhtXeRKy/TvxC+8skVMp0NSuv8CIdP4D
 49ZB2k1xBfZd2ObwT+NGk+2N9W0X1Wc7a/DBtmdGI5h7ZX1f8kuLrMj8GbyU5Mm0WNKv
 4F+A==
X-Gm-Message-State: AJIora918S2+2yTBW0wFc6aMsy14ACJ8WovVKK1q9370EhS/qYBLVURg
 7RFuoCBMKU6HqSavXrKJjtMO/K+0eDoobQ==
X-Google-Smtp-Source: AGRyM1tjGaF+LBdpRzSIiB7MSLS9Q90hG9GQK5slIiSavX77twFwLzBhz09TrbQz6+FEHxmkbwWFHA==
X-Received: by 2002:a05:6e02:1c4c:b0:2dd:bfd:f2d8 with SMTP id
 d12-20020a056e021c4c00b002dd0bfdf2d8mr1333390ilg.106.1658331220606; 
 Wed, 20 Jul 2022 08:33:40 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 q1-20020a92d401000000b002dcdb4bbe87sm4579581ilm.22.2022.07.20.08.33.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Jul 2022 08:33:40 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 jbaron@akamai.com, gregkh@linuxfoundation.org, daniel.vetter@ffwll.ch,
 seanpaul@chromium.org, robdclark@gmail.com
Subject: [PATCH v4 41/41] nouveau-dyndbg: wip subdev refine, breaks on use
Date: Wed, 20 Jul 2022 09:32:33 -0600
Message-Id: <20220720153233.144129-42-jim.cromie@gmail.com>
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

