Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 449F0B5565A
	for <lists+dri-devel@lfdr.de>; Fri, 12 Sep 2025 20:38:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95A4D10ECBA;
	Fri, 12 Sep 2025 18:38:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="DHnEXedC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E35AB10ECC7
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 18:38:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1757702282; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=CTK4IlOZfrx5lkLZiPBtQfD/IFk3xvh5kq1hq8wW9Kb3MXa0tHf/pmZS4VyH7jmHh6k1bjeWy2tCFOtJu0GT4ocGjWV4JNHDdFKWkAo4Q6cpVoAc4ICoY5MDsrdP7O7841ydEskNyfTneNR+/6FqUyXEppWfCgiDv2LcWAH15sM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1757702282;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=KRoz3AX/4l3gWWUh8JeDx86LKRzfv5ckDkbWkGw7YwU=; 
 b=jKzTLZx6BcwMTwZEzslRlF1vqYnaWia+RsNvd+8y0LwYlelgt11n0caEubruPzJE/bFGo6+l6r7vnrQASotkJsDwmlbu8XVX/YaBnBdalpJMdYYNTjKgIhKC1gWfHBUXY/PuIJj2TVBMEaHIs1r3yDtf8aefrqRi5hoj6Q+iu5g=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
 dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1757702282; 
 s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
 h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
 bh=KRoz3AX/4l3gWWUh8JeDx86LKRzfv5ckDkbWkGw7YwU=;
 b=DHnEXedCTtfVglePlmUcurWs0h/SY6P/r2VTOsAdP7YpuhEJW6GlUdnoZbRp4JMj
 qmwFZ6FdCyEd770OBpz7qgZieawR5lDp6W5nRFVb8Ru0EUIzA+0bJAhwQH0bHyG/t5F
 peZWZ9ak5CH6FKAiFyezny/OSFhzRav1lYlU5Gps=
Received: by mx.zohomail.com with SMTPS id 1757702281064219.21425668198083;
 Fri, 12 Sep 2025 11:38:01 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Fri, 12 Sep 2025 20:37:04 +0200
Subject: [PATCH v2 05/10] mailbox: add MediaTek GPUEB IPI mailbox
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250912-mt8196-gpufreq-v2-5-779a8a3729d9@collabora.com>
References: <20250912-mt8196-gpufreq-v2-0-779a8a3729d9@collabora.com>
In-Reply-To: <20250912-mt8196-gpufreq-v2-0-779a8a3729d9@collabora.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Boris Brezillon <boris.brezillon@collabora.com>, 
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 MyungJoo Ham <myungjoo.ham@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Jassi Brar <jassisinghbrar@gmail.com>, 
 Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
 Chia-I Wu <olvaffe@gmail.com>, Chen-Yu Tsai <wenst@chromium.org>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-pm@vger.kernel.org, linux-hardening@vger.kernel.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
X-Mailer: b4 0.14.2
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

The MT8196 SoC uses an embedded MCU to control frequencies and power of
the GPU. This controller is referred to as "GPUEB".

It communicates to the application processor, among other ways, through
a mailbox.

The mailbox exposes one interrupt, which appears to only be fired when a
response is received, rather than a transaction is completed. For us,
this means we unfortunately need to poll for txdone.

The mailbox also requires the EB clock to be on when touching any of the
mailbox registers.

Add a simple driver for it based on the common mailbox framework.

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 drivers/mailbox/Kconfig             |  10 ++
 drivers/mailbox/Makefile            |   2 +
 drivers/mailbox/mtk-gpueb-mailbox.c | 337 ++++++++++++++++++++++++++++++++++++
 3 files changed, 349 insertions(+)

diff --git a/drivers/mailbox/Kconfig b/drivers/mailbox/Kconfig
index 02432d4a5ccd46a16156a09c7f277fb03e4013f5..2016defda1fabb5c0fcc8078f84a52d4e4e00167 100644
--- a/drivers/mailbox/Kconfig
+++ b/drivers/mailbox/Kconfig
@@ -294,6 +294,16 @@ config MTK_CMDQ_MBOX
 	  critical time limitation, such as updating display configuration
 	  during the vblank.
 
+config MTK_GPUEB_MBOX
+	tristate "MediaTek GPUEB Mailbox Support"
+	depends on ARCH_MEDIATEK || COMPILE_TEST
+	help
+	  The MediaTek GPUEB mailbox is used to communicate with the embedded
+	  controller in charge of GPU frequency and power management on some
+	  MediaTek SoCs, such as the MT8196.
+	  Say Y or m here if you want to support the MT8196 SoC in your kernel
+	  build.
+
 config ZYNQMP_IPI_MBOX
 	tristate "Xilinx ZynqMP IPI Mailbox"
 	depends on ARCH_ZYNQMP && OF
diff --git a/drivers/mailbox/Makefile b/drivers/mailbox/Makefile
index 98a68f838486eed117d24296138bf59fda3f92e4..564d06e71313e6d1972e4a6036e1e78c8c7ec450 100644
--- a/drivers/mailbox/Makefile
+++ b/drivers/mailbox/Makefile
@@ -63,6 +63,8 @@ obj-$(CONFIG_MTK_ADSP_MBOX)	+= mtk-adsp-mailbox.o
 
 obj-$(CONFIG_MTK_CMDQ_MBOX)	+= mtk-cmdq-mailbox.o
 
+obj-$(CONFIG_MTK_GPUEB_MBOX)	+= mtk-gpueb-mailbox.o
+
 obj-$(CONFIG_ZYNQMP_IPI_MBOX)	+= zynqmp-ipi-mailbox.o
 
 obj-$(CONFIG_SUN6I_MSGBOX)	+= sun6i-msgbox.o
diff --git a/drivers/mailbox/mtk-gpueb-mailbox.c b/drivers/mailbox/mtk-gpueb-mailbox.c
new file mode 100644
index 0000000000000000000000000000000000000000..ac7530c6e71b3a3b39f956d6976c02eabdd4bb71
--- /dev/null
+++ b/drivers/mailbox/mtk-gpueb-mailbox.c
@@ -0,0 +1,337 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * MediaTek GPUEB mailbox driver for SoCs such as the MT8196
+ *
+ * Copyright (C) 2025, Collabora Ltd.
+ *
+ * Developers harmed in the making of this driver:
+ *  - Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
+ */
+
+#include <linux/atomic.h>
+#include <linux/clk.h>
+#include <linux/device.h>
+#include <linux/interrupt.h>
+#include <linux/io.h>
+#include <linux/iopoll.h>
+#include <linux/mailbox_controller.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+
+#define MBOX_CTL_TX_STS 0x0000
+#define MBOX_CTL_IRQ_SET 0x0004
+#define MBOX_CTL_IRQ_CLR 0x0074
+#define MBOX_CTL_RX_STS 0x0078
+
+#define MBOX_FULL BIT(0) /* i.e. we've received data */
+#define MBOX_CLOGGED BIT(1) /* i.e. the channel is shutdown */
+
+struct mtk_gpueb_mbox {
+	struct device *dev;
+	struct clk *clk;
+	void __iomem *mbox_mmio;
+	void __iomem *mbox_ctl;
+	struct mbox_controller mbox;
+	struct mtk_gpueb_mbox_chan *ch;
+	int irq;
+	const struct mtk_gpueb_mbox_variant *v;
+};
+
+/**
+ * struct mtk_gpueb_mbox_chan - per-channel runtime data
+ * @ebm: pointer to the parent &struct mtk_gpueb_mbox mailbox
+ * @full_name: descriptive name of channel for IRQ subsystem
+ * @num: channel number, starting at 0
+ * @rx_buf: pointer to memory where received data is copied from MMIO
+ * @rx_status: signifies whether channel reception is turned off, or full
+ * @c: pointer to the constant &struct mtk_gpueb_mbox_chan_desc channel data
+ */
+struct mtk_gpueb_mbox_chan {
+	struct mtk_gpueb_mbox *ebm;
+	char *full_name;
+	u8 num;
+	void *rx_buf;
+	atomic_t rx_status;
+	const struct mtk_gpueb_mbox_chan_desc *c;
+};
+
+/**
+ * struct mtk_gpueb_mbox_chan_desc - per-channel constant data
+ * @name: name of this channel
+ * @num: index of this channel, starting at 0
+ * @tx_offset: byte offset measured from mmio base for outgoing data
+ * @tx_len: size, in bytes, of the outgoing data on this channel
+ * @rx_offset: bytes offset measured from mmio base for incoming data
+ * @rx_len: size, in bytes, of the incoming data on this channel
+ */
+struct mtk_gpueb_mbox_chan_desc {
+	const char *name;
+	const u8 num;
+	const u16 tx_offset;
+	const u8 tx_len;
+	const u16 rx_offset;
+	const u8 rx_len;
+};
+
+struct mtk_gpueb_mbox_variant {
+	const u8 num_channels;
+	const struct mtk_gpueb_mbox_chan_desc channels[] __counted_by(num_channels);
+};
+
+/**
+ * mtk_gpueb_mbox_read_rx - read RX buffer from MMIO into channel's RX buffer
+ * @chan: pointer to the channel to read
+ */
+static void mtk_gpueb_mbox_read_rx(struct mtk_gpueb_mbox_chan *chan)
+{
+	memcpy_fromio(chan->rx_buf, chan->ebm->mbox_mmio + chan->c->rx_offset,
+		      chan->c->rx_len);
+}
+
+static irqreturn_t mtk_gpueb_mbox_isr(int irq, void *data)
+{
+	struct mtk_gpueb_mbox_chan *ch = data;
+	u32 rx_sts;
+
+	rx_sts = readl(ch->ebm->mbox_ctl + MBOX_CTL_RX_STS);
+
+	if (rx_sts & BIT(ch->num)) {
+		if (!atomic_cmpxchg(&ch->rx_status, 0, MBOX_FULL | MBOX_CLOGGED))
+			return IRQ_WAKE_THREAD;
+	}
+
+	return IRQ_NONE;
+}
+
+static irqreturn_t mtk_gpueb_mbox_thread(int irq, void *data)
+{
+	struct mtk_gpueb_mbox_chan *ch = data;
+	int status;
+
+	status = atomic_cmpxchg(&ch->rx_status,
+				MBOX_FULL | MBOX_CLOGGED, MBOX_FULL);
+	if (status == (MBOX_FULL | MBOX_CLOGGED)) {
+		mtk_gpueb_mbox_read_rx(ch);
+		writel(BIT(ch->num), ch->ebm->mbox_ctl + MBOX_CTL_IRQ_CLR);
+		mbox_chan_received_data(&ch->ebm->mbox.chans[ch->num],
+					ch->rx_buf);
+		atomic_set(&ch->rx_status, 0);
+		return IRQ_HANDLED;
+	}
+
+	return IRQ_NONE;
+}
+
+static int mtk_gpueb_mbox_send_data(struct mbox_chan *chan, void *data)
+{
+	struct mtk_gpueb_mbox_chan *ch = chan->con_priv;
+	int i;
+	u32 *values = data;
+
+	if (atomic_read(&ch->rx_status))
+		return -EBUSY;
+
+	/*
+	 * We don't want any fancy nonsense, just write the 32-bit values in
+	 * order. memcpy_toio/__iowrite32_copy don't work here, because fancy.
+	 */
+	for (i = 0; i < ch->c->tx_len; i += 4)
+		writel(values[i / 4], ch->ebm->mbox_mmio + ch->c->tx_offset + i);
+
+	writel(BIT(ch->num), ch->ebm->mbox_ctl + MBOX_CTL_IRQ_SET);
+
+	return 0;
+}
+
+static int mtk_gpueb_mbox_startup(struct mbox_chan *chan)
+{
+	struct mtk_gpueb_mbox_chan *ch = chan->con_priv;
+	int ret;
+
+	atomic_set(&ch->rx_status, 0);
+
+	ret = clk_enable(ch->ebm->clk);
+	if (ret) {
+		dev_err(ch->ebm->dev, "Failed to enable EB clock: %pe\n",
+			ERR_PTR(ret));
+		goto err_clog;
+	}
+
+	writel(BIT(ch->num), ch->ebm->mbox_ctl + MBOX_CTL_IRQ_CLR);
+
+	ret = devm_request_threaded_irq(ch->ebm->dev, ch->ebm->irq, mtk_gpueb_mbox_isr,
+					mtk_gpueb_mbox_thread, IRQF_SHARED | IRQF_ONESHOT,
+					ch->full_name, ch);
+	if (ret) {
+		dev_err(ch->ebm->dev, "Failed to request IRQ: %pe\n",
+			ERR_PTR(ret));
+		goto err_unclk;
+	}
+
+	return 0;
+
+err_unclk:
+	clk_disable(ch->ebm->clk);
+err_clog:
+	atomic_set(&ch->rx_status, MBOX_CLOGGED);
+
+	return ret;
+}
+
+static void mtk_gpueb_mbox_shutdown(struct mbox_chan *chan)
+{
+	struct mtk_gpueb_mbox_chan *ch = chan->con_priv;
+
+	atomic_set(&ch->rx_status, MBOX_CLOGGED);
+
+	devm_free_irq(ch->ebm->dev, ch->ebm->irq, ch);
+
+	clk_disable(ch->ebm->clk);
+}
+
+static bool mtk_gpueb_mbox_last_tx_done(struct mbox_chan *chan)
+{
+	struct mtk_gpueb_mbox_chan *ch = chan->con_priv;
+
+	return !(readl(ch->ebm->mbox_ctl + MBOX_CTL_TX_STS) & BIT(ch->num));
+}
+
+const struct mbox_chan_ops mtk_gpueb_mbox_ops = {
+	.send_data = mtk_gpueb_mbox_send_data,
+	.startup = mtk_gpueb_mbox_startup,
+	.shutdown = mtk_gpueb_mbox_shutdown,
+	.last_tx_done = mtk_gpueb_mbox_last_tx_done,
+};
+
+static struct mbox_chan *
+mtk_gpueb_mbox_of_xlate(struct mbox_controller *mbox,
+			const struct of_phandle_args *sp)
+{
+	struct mtk_gpueb_mbox *ebm = dev_get_drvdata(mbox->dev);
+
+	if (!sp->args_count)
+		return ERR_PTR(-EINVAL);
+
+	if (sp->args[0] >= ebm->v->num_channels)
+		return ERR_PTR(-ECHRNG);
+
+	return &mbox->chans[sp->args[0]];
+}
+
+static int mtk_gpueb_mbox_probe(struct platform_device *pdev)
+{
+	struct mtk_gpueb_mbox *ebm;
+	unsigned int rx_buf_sz;
+	void *buf;
+	unsigned int i;
+
+	ebm = devm_kzalloc(&pdev->dev, sizeof(*ebm), GFP_KERNEL);
+	if (!ebm)
+		return -ENOMEM;
+
+	ebm->dev = &pdev->dev;
+	ebm->v = of_device_get_match_data(ebm->dev);
+
+	ebm->irq = platform_get_irq(pdev, 0);
+	if (ebm->irq < 0)
+		return ebm->irq;
+
+	ebm->clk = devm_clk_get_prepared(ebm->dev, NULL);
+	if (IS_ERR(ebm->clk))
+		return dev_err_probe(ebm->dev, PTR_ERR(ebm->clk),
+				     "Failed to get 'eb' clock\n");
+
+	ebm->mbox_mmio = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(ebm->mbox_mmio))
+		return dev_err_probe(ebm->dev, PTR_ERR(ebm->mbox_mmio),
+				     "Couldn't map mailbox data registers\n");
+
+	ebm->mbox_ctl = devm_platform_ioremap_resource(pdev, 1);
+	if (IS_ERR(ebm->mbox_ctl))
+		return dev_err_probe(
+			ebm->dev, PTR_ERR(ebm->mbox_ctl),
+			"Couldn't map mailbox control registers\n");
+
+	rx_buf_sz = (ebm->v->channels[ebm->v->num_channels - 1].rx_offset +
+		     ebm->v->channels[ebm->v->num_channels - 1].rx_len -
+		     ebm->v->channels[0].rx_offset);
+
+	buf = devm_kzalloc(ebm->dev, rx_buf_sz, GFP_KERNEL);
+	if (!buf)
+		return -ENOMEM;
+
+	ebm->ch = devm_kmalloc_array(ebm->dev, ebm->v->num_channels,
+				     sizeof(*ebm->ch), GFP_KERNEL);
+	if (!ebm->ch)
+		return -ENOMEM;
+
+	ebm->mbox.chans = devm_kcalloc(ebm->dev, ebm->v->num_channels,
+				       sizeof(struct mbox_chan), GFP_KERNEL);
+	if (!ebm->mbox.chans)
+		return -ENOMEM;
+
+	for (i = 0; i < ebm->v->num_channels; i++) {
+		ebm->ch[i].c = &ebm->v->channels[i];
+		ebm->ch[i].full_name = devm_kasprintf(ebm->dev, GFP_KERNEL, "%s:%s",
+						      dev_name(ebm->dev), ebm->ch[i].c->name);
+		if (!ebm->ch[i].full_name)
+			return -ENOMEM;
+
+		ebm->ch[i].ebm = ebm;
+		ebm->ch[i].num = i;
+		ebm->ch[i].rx_buf = buf + ebm->ch[i].c->rx_offset -
+				    ebm->v->channels[0].rx_offset;
+		spin_lock_init(&ebm->mbox.chans[i].lock);
+		ebm->mbox.chans[i].con_priv = &ebm->ch[i];
+		atomic_set(&ebm->ch[i].rx_status, MBOX_CLOGGED);
+	}
+
+	ebm->mbox.dev = ebm->dev;
+	ebm->mbox.num_chans = ebm->v->num_channels;
+	ebm->mbox.txdone_poll = true;
+	ebm->mbox.txpoll_period = 0; /* minimum hrtimer interval */
+	ebm->mbox.of_xlate = mtk_gpueb_mbox_of_xlate;
+	ebm->mbox.ops = &mtk_gpueb_mbox_ops;
+
+	dev_set_drvdata(ebm->dev, ebm);
+
+	return devm_mbox_controller_register(ebm->dev, &ebm->mbox);
+}
+
+static const struct mtk_gpueb_mbox_variant mtk_gpueb_mbox_mt8196 = {
+	.num_channels = 12,
+	.channels = {
+		{ "fast-dvfs-event", 0, 0x0000, 16, 0x00e0, 16 },
+		{ "gpufreq",         1, 0x0010, 32, 0x00f0, 32 },
+		{ "sleep",           2, 0x0030, 12, 0x0110,  4 },
+		{ "timer",           3, 0x003c, 24, 0x0114,  4 },
+		{ "fhctl",           4, 0x0054, 36, 0x0118,  4 },
+		{ "ccf",             5, 0x0078, 16, 0x011c, 16 },
+		{ "gpumpu",          6, 0x0088, 24, 0x012c,  4 },
+		{ "fast-dvfs",       7, 0x00a0, 24, 0x0130, 24 },
+		{ "ipir-c-met",      8, 0x00b8,  4, 0x0148, 16 },
+		{ "ipis-c-met",      9, 0x00bc, 16, 0x0158,  4 },
+		{ "brisket",        10, 0x00cc, 16, 0x015c, 16 },
+		{ "ppb",            11, 0x00dc,  4, 0x016c,  4 },
+	},
+};
+
+static const struct of_device_id mtk_gpueb_mbox_of_ids[] = {
+	{ .compatible = "mediatek,mt8196-gpueb-mbox", .data = &mtk_gpueb_mbox_mt8196 },
+	{ /* Sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, mtk_gpueb_mbox_of_ids);
+
+static struct platform_driver mtk_gpueb_mbox_drv = {
+	.probe = mtk_gpueb_mbox_probe,
+	.driver = {
+		.name = "mtk-gpueb-mbox",
+		.of_match_table = mtk_gpueb_mbox_of_ids,
+	}
+};
+module_platform_driver(mtk_gpueb_mbox_drv);
+
+MODULE_AUTHOR("Nicolas Frattaroli <nicolas.frattaroli@collabora.com>");
+MODULE_DESCRIPTION("MediaTek GPUEB mailbox driver");
+MODULE_LICENSE("GPL");

-- 
2.51.0

