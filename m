Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04058470704
	for <lists+dri-devel@lfdr.de>; Fri, 10 Dec 2021 18:26:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC4E410E65E;
	Fri, 10 Dec 2021 17:26:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D88A710E64C
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Dec 2021 17:26:47 +0000 (UTC)
X-UUID: cc5b368096fe44c9831be78be0aa153d-20211211
X-UUID: cc5b368096fe44c9831be78be0aa153d-20211211
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by
 mailgw02.mediatek.com (envelope-from <flora.fu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1342538033; Sat, 11 Dec 2021 01:26:45 +0800
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 11 Dec 2021 01:26:43 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Sat, 11 Dec 2021 01:26:43 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Sat, 11 Dec 2021 01:26:43 +0800
From: Flora Fu <flora.fu@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Sumit Semwal
 <sumit.semwal@linaro.org>, Yong Wu <yong.wu@mediatek.com>, Pi-Cheng Chen
 <pi-cheng.chen@mediatek.com>
Subject: [PATCH 06/17] mailbox: mediatek: add mtk-apu-mailbox driver
Date: Sat, 11 Dec 2021 01:25:54 +0800
Message-ID: <20211210172605.30618-7-flora.fu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20211210172605.30618-1-flora.fu@mediatek.com>
References: <20211210172605.30618-1-flora.fu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
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
Cc: JB Tsai <jb.tsai@mediatek.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 Flora Fu <flora.fu@mediatek.com>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add mtk-apu-mailbox driver to support communication with
APU remote microprocessor.

Signed-off-by: Pi-Cheng Chen <pi-cheng.chen@mediatek.com>
Signed-off-by: Flora Fu <flora.fu@mediatek.com>

---
 drivers/mailbox/Kconfig           |   9 ++
 drivers/mailbox/Makefile          |   2 +
 drivers/mailbox/mtk-apu-mailbox.c | 162 ++++++++++++++++++++++++++++++
 3 files changed, 173 insertions(+)
 create mode 100644 drivers/mailbox/mtk-apu-mailbox.c

diff --git a/drivers/mailbox/Kconfig b/drivers/mailbox/Kconfig
index d9cd3606040e..aeaaadd4cb8d 100644
--- a/drivers/mailbox/Kconfig
+++ b/drivers/mailbox/Kconfig
@@ -238,6 +238,15 @@ config STM32_IPCC
 	  with hardware for Inter-Processor Communication Controller (IPCC)
 	  between processors. Say Y here if you want to have this support.
 
+config MTK_APU_MBOX
+	tristate "MediaTek APU Mailbox Support"
+	depends on ARCH_MEDIATEK || COMPILE_TEST
+	help
+	  Say yes here to add support for the MediaTek APU Mailbox
+	  driver. The mailbox implementation provides access from the
+	  application processor to the MediaTek AI Processing Unit.
+	  If unsure say N.
+
 config MTK_CMDQ_MBOX
 	tristate "MediaTek CMDQ Mailbox Support"
 	depends on ARCH_MEDIATEK || COMPILE_TEST
diff --git a/drivers/mailbox/Makefile b/drivers/mailbox/Makefile
index 338cc05e5431..e24ad25c3378 100644
--- a/drivers/mailbox/Makefile
+++ b/drivers/mailbox/Makefile
@@ -49,6 +49,8 @@ obj-$(CONFIG_TEGRA_HSP_MBOX)	+= tegra-hsp.o
 
 obj-$(CONFIG_STM32_IPCC) 	+= stm32-ipcc.o
 
+obj-$(CONFIG_MTK_APU_MBOX)	+= mtk-apu-mailbox.o
+
 obj-$(CONFIG_MTK_CMDQ_MBOX)	+= mtk-cmdq-mailbox.o
 
 obj-$(CONFIG_ZYNQMP_IPI_MBOX)	+= zynqmp-ipi-mailbox.o
diff --git a/drivers/mailbox/mtk-apu-mailbox.c b/drivers/mailbox/mtk-apu-mailbox.c
new file mode 100644
index 000000000000..860db0504907
--- /dev/null
+++ b/drivers/mailbox/mtk-apu-mailbox.c
@@ -0,0 +1,162 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2021 MediaTek Inc.
+ */
+
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/interrupt.h>
+#include <linux/io.h>
+#include <linux/of_irq.h>
+#include <linux/of_platform.h>
+#include <linux/platform_device.h>
+#include <linux/mailbox_controller.h>
+
+#define INBOX		(0x0)
+#define OUTBOX		(0x20)
+#define INBOX_IRQ	(0xc0)
+#define OUTBOX_IRQ	(0xc4)
+#define INBOX_IRQ_MASK	(0xd0)
+
+#define MSG_MBOX_SLOTS	(4)
+
+struct mtk_apu_mailbox {
+	struct device *dev;
+	void __iomem *regs;
+	spinlock_t lock; /* register access lock */
+	struct mbox_controller controller;
+	u32 msgs[MSG_MBOX_SLOTS];
+};
+
+static irqreturn_t mtk_apu_mailbox_threaded_irq(int irq, void *dev_id)
+{
+	struct mtk_apu_mailbox *mbox = dev_id;
+	struct mbox_chan *link = &mbox->controller.chans[0];
+	int i;
+
+	for (i = 0; i < MSG_MBOX_SLOTS; i++)
+		mbox->msgs[i] = readl(mbox->regs + OUTBOX + i * sizeof(u32));
+
+	mbox_chan_received_data(link, &mbox->msgs);
+	writel(readl(mbox->regs + OUTBOX_IRQ), mbox->regs + OUTBOX_IRQ);
+
+	return IRQ_HANDLED;
+}
+
+static int mtk_apu_mailbox_send_data(struct mbox_chan *chan, void *data)
+{
+	struct mtk_apu_mailbox *mbox = container_of(chan->mbox,
+						    struct mtk_apu_mailbox,
+						    controller);
+	int i;
+
+	spin_lock(&mbox->lock);
+	writel(~BIT(MSG_MBOX_SLOTS - 1), mbox->regs + INBOX_IRQ_MASK);
+	for (i = 0; i < MSG_MBOX_SLOTS; i++)
+		writel(((u32 *)data)[i], mbox->regs + INBOX + i * sizeof(u32));
+	spin_unlock(&mbox->lock);
+
+	return 0;
+}
+
+static bool mtk_apu_mailbox_last_tx_done(struct mbox_chan *chan)
+{
+	struct mtk_apu_mailbox *mbox = container_of(chan->mbox,
+						    struct mtk_apu_mailbox,
+						    controller);
+
+	return readl(mbox->regs + INBOX_IRQ) == 0;
+}
+
+static const struct mbox_chan_ops mtk_apu_mailbox_ops = {
+	.send_data = mtk_apu_mailbox_send_data,
+	.last_tx_done = mtk_apu_mailbox_last_tx_done,
+};
+
+static int mtk_apu_mailbox_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct resource *res;
+	struct mtk_apu_mailbox *mbox;
+	int ret = 0;
+
+	mbox = devm_kzalloc(dev, sizeof(*mbox), GFP_KERNEL);
+	if (!mbox)
+		return -ENOMEM;
+
+	mbox->dev = dev;
+	platform_set_drvdata(pdev, mbox);
+	spin_lock_init(&mbox->lock);
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	if (!res)
+		return -ENODEV;
+
+	mbox->regs = devm_ioremap_resource(dev, res);
+	if (IS_ERR(mbox->regs))
+		return PTR_ERR(mbox->regs);
+
+	ret = devm_request_threaded_irq(dev,
+					irq_of_parse_and_map(dev->of_node, 0),
+					NULL, mtk_apu_mailbox_threaded_irq,
+					IRQF_ONESHOT, dev_name(dev), mbox);
+	if (ret) {
+		dev_err(dev, "Failed to register apu mailbox IRQ: %d\n", ret);
+		return -ENODEV;
+	}
+
+	mbox->controller.txdone_irq = false;
+	mbox->controller.txdone_poll = true;
+	mbox->controller.txpoll_period = 1;
+	mbox->controller.ops = &mtk_apu_mailbox_ops;
+	mbox->controller.dev = dev;
+	mbox->controller.num_chans = 1;
+	mbox->controller.chans = devm_kcalloc(dev, mbox->controller.num_chans,
+					      sizeof(*mbox->controller.chans),
+					      GFP_KERNEL);
+	if (!mbox->controller.chans)
+		return -ENOMEM;
+
+	ret = devm_mbox_controller_register(dev, &mbox->controller);
+	if (ret)
+		return ret;
+
+	dev_info(dev, "registered apu mailbox\n");
+
+	return 0;
+}
+
+static int mtk_apu_mailbox_remove(struct platform_device *pdev)
+{
+	return 0;
+}
+
+static const struct of_device_id mtk_apu_mailbox_of_match[] = {
+	{.compatible = "mediatek,mtk-apu-mailbox"},
+	{}
+};
+MODULE_DEVICE_TABLE(of, mtk_apu_mailbox_of_match);
+
+static struct platform_driver mtk_apu_mailbox_driver = {
+	.probe = mtk_apu_mailbox_probe,
+	.remove = mtk_apu_mailbox_remove,
+	.driver = {
+		.name = "mtk-apu-mailbox",
+		.of_match_table = mtk_apu_mailbox_of_match,
+	},
+};
+
+static int __init apu_mailbox_init(void)
+{
+	return platform_driver_register(&mtk_apu_mailbox_driver);
+}
+
+static void __exit apu_mailbox_exit(void)
+{
+	platform_driver_unregister(&mtk_apu_mailbox_driver);
+}
+
+module_init(apu_mailbox_init);
+module_exit(apu_mailbox_exit);
+MODULE_LICENSE("GPL v2");
+MODULE_DESCRIPTION("APU Mailbox Driver");
-- 
2.18.0

