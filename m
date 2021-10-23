Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EC8F243848E
	for <lists+dri-devel@lfdr.de>; Sat, 23 Oct 2021 19:36:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5351A6E839;
	Sat, 23 Oct 2021 17:36:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 530536E826
 for <dri-devel@lists.freedesktop.org>; Sat, 23 Oct 2021 11:15:00 +0000 (UTC)
X-UUID: e15606ad513f4228a88fd5376143f505-20211023
X-UUID: e15606ad513f4228a88fd5376143f505-20211023
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by
 mailgw01.mediatek.com (envelope-from <flora.fu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 658101389; Sat, 23 Oct 2021 19:14:55 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Sat, 23 Oct 2021 19:14:54 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Sat, 23 Oct 2021 19:14:54 +0800
From: Flora Fu <flora.fu@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Mark Brown
 <broonie@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-media@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linaro-mm-sig@lists.linaro.org>, Flora Fu
 <flora.fu@mediatek.com>, Yong Wu <yong.wu@mediatek.com>, Pi-Cheng Chen
 <pi-cheng.chen@mediatek.com>
Subject: [RFC 06/13] soc: mediatek: apu: Add apu core driver
Date: Sat, 23 Oct 2021 19:14:02 +0800
Message-ID: <20211023111409.30463-7-flora.fu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20211023111409.30463-1-flora.fu@mediatek.com>
References: <20211023111409.30463-1-flora.fu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-Mailman-Approved-At: Sat, 23 Oct 2021 17:35:54 +0000
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

Add apu core driver.
The core driver will init the reset part of apu functions.

Signed-off-by: Flora Fu <flora.fu@mediatek.com>
---
 drivers/soc/mediatek/Kconfig           | 18 +++++
 drivers/soc/mediatek/apusys/Makefile   |  3 +
 drivers/soc/mediatek/apusys/apu-core.c | 91 ++++++++++++++++++++++++++
 drivers/soc/mediatek/apusys/apu-core.h | 11 ++++
 4 files changed, 123 insertions(+)
 create mode 100644 drivers/soc/mediatek/apusys/apu-core.c
 create mode 100644 drivers/soc/mediatek/apusys/apu-core.h

diff --git a/drivers/soc/mediatek/Kconfig b/drivers/soc/mediatek/Kconfig
index d9bac2710494..074b0cf24c44 100644
--- a/drivers/soc/mediatek/Kconfig
+++ b/drivers/soc/mediatek/Kconfig
@@ -24,6 +24,24 @@ config MTK_APU_PM
 	  APU power domain shall be enabled before accessing the
 	  internal sub modules.
 
+config MTK_APU
+	tristate "MediaTek APUSYS Support"
+	select REGMAP
+	select MTK_APU_PM
+	select MTK_SCP
+	help
+	  Say yes here to add support for the APU tinysys. The tinsys is
+	  running on a micro processor in APU.
+	  Its firmware is load and boot from Kernel side. Kernel and tinysys use
+	  IPI to tx/rx messages.
+
+config MTK_APU_DEBUG
+	tristate "MediaTek APUSYS debug functions"
+	depends on MTK_APU
+	help
+	  Say yes here to enalbe debug on APUSYS.
+	  Disable it if you don't need them.
+
 config MTK_CMDQ
 	tristate "MediaTek CMDQ Support"
 	depends on ARCH_MEDIATEK || COMPILE_TEST
diff --git a/drivers/soc/mediatek/apusys/Makefile b/drivers/soc/mediatek/apusys/Makefile
index 8821c0f0b7b7..6b5249ec7064 100644
--- a/drivers/soc/mediatek/apusys/Makefile
+++ b/drivers/soc/mediatek/apusys/Makefile
@@ -1,2 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0
 obj-$(CONFIG_MTK_APU_PM) += mtk-apu-pm.o
+
+obj-$(CONFIG_MTK_APU) += apu.o
+apu-objs += apu-core.o
diff --git a/drivers/soc/mediatek/apusys/apu-core.c b/drivers/soc/mediatek/apusys/apu-core.c
new file mode 100644
index 000000000000..c1db2394307f
--- /dev/null
+++ b/drivers/soc/mediatek/apusys/apu-core.c
@@ -0,0 +1,91 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2021 MediaTek Inc.
+ */
+
+#include <linux/debugfs.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+
+#include "apu-core.h"
+
+#define APUSYS_DEV_NAME "apusys"
+
+static struct apusys_core_info g_core_info;
+
+/*
+ * init function at other modulses
+ * call init function in order at apu.ko init stage
+ */
+static int (*apusys_init_func[])(struct apusys_core_info *) = {
+};
+
+/*
+ * exit function at other modulses
+ * call exit function in order at apu.ko exit stage
+ */
+static void (*apusys_exit_func[])(void) = {
+};
+
+static void create_dbg_root(void)
+{
+	g_core_info.dbg_root = debugfs_create_dir(APUSYS_DEV_NAME, NULL);
+
+	/* check dbg root create status */
+	if (IS_ERR_OR_NULL(g_core_info.dbg_root))
+		pr_info("failed to create debug dir.\n");
+}
+
+static void destroy_dbg_root(void)
+{
+	debugfs_remove_recursive(g_core_info.dbg_root);
+}
+
+static int __init apusys_init(void)
+{
+	int i, j, ret = 0;
+	int func_num = sizeof(apusys_init_func) / sizeof(int *);
+
+	/* init apusys_dev */
+	create_dbg_root();
+
+	/* call init func */
+	for (i = 0; i < func_num; i++) {
+		if (!apusys_init_func[i])
+			break;
+
+		ret = apusys_init_func[i](&g_core_info);
+		if (ret) {
+			pr_info("init function(%d) fail(%d)", i, ret);
+
+			/* exit device */
+			for (j = i - 1; j >= 0; j--)
+				apusys_exit_func[j]();
+
+			destroy_dbg_root();
+			break;
+		}
+	}
+
+	return 0;
+}
+
+static void __exit apusys_exit(void)
+{
+	int func_num = sizeof(apusys_exit_func) / sizeof(int *);
+	int i;
+
+	/* call release func */
+	for (i = 0; i < func_num; i++) {
+		if (!apusys_exit_func[i])
+			break;
+
+		apusys_exit_func[i]();
+	}
+
+	destroy_dbg_root();
+}
+
+module_init(apusys_init);
+module_exit(apusys_exit);
+MODULE_LICENSE("GPL");
diff --git a/drivers/soc/mediatek/apusys/apu-core.h b/drivers/soc/mediatek/apusys/apu-core.h
new file mode 100644
index 000000000000..bac730bbc7ea
--- /dev/null
+++ b/drivers/soc/mediatek/apusys/apu-core.h
@@ -0,0 +1,11 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2021 MediaTek Inc.
+ */
+#ifndef APU_CORE_H
+#define APU_CORE_H
+
+struct apusys_core_info {
+	struct dentry *dbg_root;
+};
+#endif
-- 
2.18.0

