Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC96EB45486
	for <lists+dri-devel@lfdr.de>; Fri,  5 Sep 2025 12:24:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 158C610EB71;
	Fri,  5 Sep 2025 10:24:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="VB5WpbeV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CD2810EB71
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Sep 2025 10:24:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1757067846; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=JX35byA9/31dFhHnrRz/D2hMPGhtfj5bKvVKaBQcQhd23r1uvJE0iICriuvKcing7/FVfPuFv+xkwManz4AIqS2irpNi+gQ+ft1+AI/o48V1j4jintBAL//pYYCy8yq3kR5MkVUyM+aofY4SCGdGSB5W+ziEWZROk5gaHzco3Qo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1757067846;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=jm3XtT05t/JfcT2cGOwXkftDzpRsXc43Ryjsa/YEQAg=; 
 b=DwKxdrsE3n5lFDwzP8USUaMg1feuyf351l0O0VVTJuVNp7oPMxLoVP2NVZQ07n0187+TtzAcdQd2af1Tcf7xSqNuez2UY817C2eJT9t/hxb+FQniPFJv53EANdwe89Ffy87ggkQ8Ic5Tgd3eOmS+QlGpHjAOpQZtvWfC+KzZfsQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
 dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1757067846; 
 s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
 h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
 bh=jm3XtT05t/JfcT2cGOwXkftDzpRsXc43Ryjsa/YEQAg=;
 b=VB5WpbeVRSBNeVbRoIVQWTtPjOoQKkXMpkCfNus20HVLPABfGoEzdFWfsjiN6XhM
 BEjfaT9kHP9NzDq1gfDtaa9yYp5rKPiEAQlz2Qwgh7Ge8B0WbYb7gY6eratF82B6TVu
 VSQh/csebEQBbKq7eMPxEvvcyICBYpbij9ZH34c8=
Received: by mx.zohomail.com with SMTPS id 1757067845420698.0762341560868;
 Fri, 5 Sep 2025 03:24:05 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Fri, 05 Sep 2025 12:23:01 +0200
Subject: [PATCH RFC 05/10] mailbox: add MediaTek GPUEB IPI mailbox
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250905-mt8196-gpufreq-v1-5-7b6c2d6be221@collabora.com>
References: <20250905-mt8196-gpufreq-v1-0-7b6c2d6be221@collabora.com>
In-Reply-To: <20250905-mt8196-gpufreq-v1-0-7b6c2d6be221@collabora.com>
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
 Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: Chia-I Wu <olvaffe@gmail.com>, Chen-Yu Tsai <wenst@chromium.org>, 
 kernel@collabora.com, dri-devel@lists.freedesktop.org, 
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
 drivers/mailbox/mtk-gpueb-mailbox.c | 330 ++++++++++++++++++++++++++++++++++++
 3 files changed, 342 insertions(+)

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
index 0000000000000000000000000000000000000000..0236fb358136e434a09a21ef293fe949ced94123
--- /dev/null
+++ b/drivers/mailbox/mtk-gpueb-mailbox.c
@@ -0,0 +1,330 @@
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
+	void **rx_buf;
+	atomic_t *rx_status;
+	struct mbox_controller mbox;
+	unsigned int *chn;
+	int irq;
+	const struct mtk_gpueb_mbox_variant *v;
+};
+
+struct mtk_gpueb_mbox_ch {
+	const char *name;
+	const int num;
+	const unsigned int tx_offset;
+	const unsigned int tx_len;
+	const unsigned int rx_offset;
+	const unsigned int rx_len;
+	const bool no_response;
+};
+
+struct mtk_gpueb_mbox_variant {
+	unsigned int num_channels;
+	const struct mtk_gpueb_mbox_ch channels[] __counted_by(num_channels);
+};
+
+/**
+ * mtk_gpueb_mbox_read_rx - read RX buffer from MMIO into ebm's RX buffer
+ * @ebm: pointer to &struct mtk_gpueb_mbox instance
+ * @channel: number of channel to read
+ */
+static void mtk_gpueb_mbox_read_rx(struct mtk_gpueb_mbox *ebm,
+				   unsigned int channel)
+{
+	const struct mtk_gpueb_mbox_ch *ch;
+
+	ch = &ebm->v->channels[channel];
+
+	memcpy_fromio(ebm->rx_buf[channel], ebm->mbox_mmio + ch->rx_offset,
+		      ch->rx_len);
+
+}
+
+static irqreturn_t mtk_gpueb_mbox_isr(int irq, void *data)
+{
+	struct mtk_gpueb_mbox *ebm = data;
+	u32 rx_handled = 0;
+	u32 rx_sts;
+	int i;
+
+	rx_sts = readl(ebm->mbox_ctl + MBOX_CTL_RX_STS);
+
+	for (i = 0; i < ebm->v->num_channels; i++) {
+		if (rx_sts & BIT(i)) {
+			if (!atomic_cmpxchg(&ebm->rx_status[i], 0,
+					    MBOX_FULL | MBOX_CLOGGED))
+				rx_handled |= BIT(i);
+		}
+	}
+
+	writel(rx_handled, ebm->mbox_ctl + MBOX_CTL_IRQ_CLR);
+
+	if (!(rx_sts ^ rx_handled))
+		return IRQ_WAKE_THREAD;
+
+	dev_warn_ratelimited(ebm->dev, "spurious interrupts on 0x%04X\n",
+			     rx_sts ^ rx_handled);
+	return IRQ_NONE;
+}
+
+static irqreturn_t mtk_gpueb_mbox_thread(int irq, void *data)
+{
+	struct mtk_gpueb_mbox *ebm = data;
+	irqreturn_t ret = IRQ_NONE;
+	int status;
+	int i;
+
+	for (i = 0; i < ebm->v->num_channels; i++) {
+		status = atomic_cmpxchg(&ebm->rx_status[i],
+					MBOX_FULL | MBOX_CLOGGED, MBOX_FULL);
+		if (status == (MBOX_FULL | MBOX_CLOGGED)) {
+			mtk_gpueb_mbox_read_rx(ebm, i);
+			mbox_chan_received_data(&ebm->mbox.chans[i],
+						ebm->rx_buf[i]);
+			/* FIXME: When does MBOX_FULL get cleared? Here? */
+			atomic_set(&ebm->rx_status[i], 0);
+			ret = IRQ_HANDLED;
+		}
+	}
+
+	return ret;
+}
+
+static int mtk_gpueb_mbox_send_data(struct mbox_chan *chan, void *data)
+{
+	struct mtk_gpueb_mbox *ebm = dev_get_drvdata(chan->mbox->dev);
+	unsigned int *num = chan->con_priv;
+	int i;
+	u32 *values = data;
+
+	if (*num >= ebm->v->num_channels)
+		return -ECHRNG;
+
+	if (!ebm->v->channels[*num].no_response &&
+	    atomic_read(&ebm->rx_status[*num]))
+		return -EBUSY;
+
+	writel(BIT(*num), ebm->mbox_ctl + MBOX_CTL_IRQ_CLR);
+
+	/*
+	 * We don't want any fancy nonsense, just write the 32-bit values in
+	 * order. memcpy_toio/__iowrite32_copy don't work here, because fancy.
+	 */
+	for (i = 0; i < ebm->v->channels[*num].tx_len; i += 4) {
+		writel(values[i / 4],
+		       ebm->mbox_mmio + ebm->v->channels[*num].tx_offset + i);
+	}
+
+	writel(BIT(*num), ebm->mbox_ctl + MBOX_CTL_IRQ_SET);
+
+	return 0;
+}
+
+static int mtk_gpueb_mbox_startup(struct mbox_chan *chan)
+{
+	struct mtk_gpueb_mbox *ebm = dev_get_drvdata(chan->mbox->dev);
+	unsigned int *num = chan->con_priv;
+
+	if (*num >= ebm->v->num_channels)
+		return -ECHRNG;
+
+	atomic_set(&ebm->rx_status[*num], 0);
+
+	return 0;
+}
+
+static void mtk_gpueb_mbox_shutdown(struct mbox_chan *chan)
+{
+	struct mtk_gpueb_mbox *ebm = dev_get_drvdata(chan->mbox->dev);
+	unsigned int *num = chan->con_priv;
+
+	atomic_set(&ebm->rx_status[*num], MBOX_CLOGGED);
+}
+
+static bool mtk_gpueb_mbox_last_tx_done(struct mbox_chan *chan)
+{
+	struct mtk_gpueb_mbox *ebm = dev_get_drvdata(chan->mbox->dev);
+	unsigned int *num = chan->con_priv;
+
+	return !(readl(ebm->mbox_ctl + MBOX_CTL_TX_STS) & BIT(*num));
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
+	int ret;
+
+	ebm = devm_kzalloc(&pdev->dev, sizeof(*ebm), GFP_KERNEL);
+	if (!ebm)
+		return -ENOMEM;
+
+	ebm->dev = &pdev->dev;
+	ebm->v = of_device_get_match_data(ebm->dev);
+
+	dev_set_drvdata(ebm->dev, ebm);
+
+	ebm->clk = devm_clk_get_enabled(ebm->dev, NULL);
+	if (IS_ERR(ebm->clk))
+		return dev_err_probe(ebm->dev, PTR_ERR(ebm->clk),
+				     "Failed to get 'eb' clock\n");
+
+	ebm->mbox_mmio = devm_platform_ioremap_resource_byname(pdev, "mbox");
+	if (IS_ERR(ebm->mbox_mmio))
+		return dev_err_probe(ebm->dev, PTR_ERR(ebm->mbox_mmio),
+				     "Couldn't map mailbox registers\n");
+
+	ebm->mbox_ctl = devm_platform_ioremap_resource_byname(pdev, "mbox_ctl");
+	if (IS_ERR(ebm->mbox_ctl))
+		return dev_err_probe(
+			ebm->dev, PTR_ERR(ebm->mbox_ctl),
+			"Couldn't map mailbox control registers\n");
+
+	rx_buf_sz = (ebm->v->channels[ebm->v->num_channels - 1].rx_offset +
+		     ebm->v->channels[ebm->v->num_channels - 1].rx_len);
+
+	buf = devm_kzalloc(ebm->dev, rx_buf_sz, GFP_KERNEL);
+	if (!buf)
+		return -ENOMEM;
+
+	ebm->rx_buf = devm_kmalloc_array(ebm->dev, ebm->v->num_channels,
+					 sizeof(*ebm->rx_buf), GFP_KERNEL);
+	if (!ebm->rx_buf)
+		return -ENOMEM;
+
+	ebm->mbox.chans = devm_kcalloc(ebm->dev, ebm->v->num_channels,
+				       sizeof(struct mbox_chan), GFP_KERNEL);
+	if (!ebm->mbox.chans)
+		return -ENOMEM;
+
+	ebm->rx_status = devm_kcalloc(ebm->dev, ebm->v->num_channels,
+				      sizeof(atomic_t), GFP_KERNEL);
+	if (!ebm->rx_status)
+		return -ENOMEM;
+
+	ebm->chn = devm_kcalloc(ebm->dev, ebm->v->num_channels,
+				sizeof(*ebm->chn), GFP_KERNEL);
+
+	for (i = 0; i < ebm->v->num_channels; i++) {
+		ebm->rx_buf[i] = buf + ebm->v->channels[i].rx_offset;
+		spin_lock_init(&ebm->mbox.chans[i].lock);
+		/* the things you do to avoid explicit casting void* */
+		ebm->chn[i] = i;
+		ebm->mbox.chans[i].con_priv = &ebm->chn[i];
+		atomic_set(&ebm->rx_status[i], MBOX_CLOGGED);
+	}
+
+	ebm->mbox.dev = ebm->dev;
+	ebm->mbox.num_chans = ebm->v->num_channels;
+	ebm->mbox.txdone_poll = true;
+	ebm->mbox.txpoll_period = 0; /* minimum hrtimer interval */
+	ebm->mbox.of_xlate = mtk_gpueb_mbox_of_xlate;
+	ebm->mbox.ops = &mtk_gpueb_mbox_ops;
+
+	ebm->irq = platform_get_irq(pdev, 0);
+	if (ebm->irq < 0)
+		return ebm->irq;
+
+	ret = devm_request_threaded_irq(ebm->dev, ebm->irq, mtk_gpueb_mbox_isr,
+					mtk_gpueb_mbox_thread, 0, NULL, ebm);
+	if (ret)
+		return dev_err_probe(ebm->dev, ret, "failed to request IRQ\n");
+
+	ret = devm_mbox_controller_register(ebm->dev, &ebm->mbox);
+
+	return 0;
+}
+
+static const struct mtk_gpueb_mbox_variant mtk_gpueb_mbox_mt8196 = {
+	.num_channels = 12,
+	.channels = {
+		{ "fast_dvfs_event", 0, 0x0000, 16, 0x00e0, 16, false },
+		{ "gpufreq",         1, 0x0010, 32, 0x00f0, 32, false },
+		{ "sleep",           2, 0x0030, 12, 0x0110,  4, true  },
+		{ "timer",           3, 0x003c, 24, 0x0114,  4, false },
+		{ "fhctl",           4, 0x0054, 36, 0x0118,  4, false },
+		{ "ccf",             5, 0x0078, 16, 0x011c, 16, false },
+		{ "gpumpu",          6, 0x0088, 24, 0x012c,  4, false },
+		{ "fast_dvfs",       7, 0x00a0, 24, 0x0130, 24, false },
+		{ "ipir_c_met",      8, 0x00b8,  4, 0x0148, 16, false },
+		{ "ipis_c_met",      9, 0x00bc, 16, 0x0158,  4, false },
+		{ "brisket",        10, 0x00cc, 16, 0x015c, 16, false },
+		{ "ppb",            11, 0x00dc,  4, 0x016c,  4, false },
+	},
+};
+
+static const struct of_device_id mtk_gpueb_mbox_of_ids[] = {
+	{ .compatible = "mediatek,mt8196-gpueb-mbox",
+	  .data = &mtk_gpueb_mbox_mt8196 },
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
+MODULE_DESCRIPTION("MediaTek GPUEB mailbox driver for SoCs such as the MT8196");
+MODULE_LICENSE("GPL");

-- 
2.51.0

