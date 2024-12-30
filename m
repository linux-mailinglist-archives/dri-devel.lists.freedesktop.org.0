Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 055639FEEC0
	for <lists+dri-devel@lfdr.de>; Tue, 31 Dec 2024 11:35:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 427C710E637;
	Tue, 31 Dec 2024 10:34:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 302 seconds by postgrey-1.36 at gabe;
 Mon, 30 Dec 2024 09:36:24 UTC
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
 by gabe.freedesktop.org (Postfix) with ESMTP id 1F5AF10E055
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Dec 2024 09:36:23 +0000 (UTC)
Received: from loongson.cn (unknown [223.64.68.63])
 by gateway (Coremail) with SMTP id _____8Dx2uGBaHJnc89bAA--.52560S3;
 Mon, 30 Dec 2024 17:31:45 +0800 (CST)
Received: from localhost.localdomain (unknown [223.64.68.63])
 by front1 (Coremail) with SMTP id qMiowMCxbcd5aHJnyL4NAA--.3877S2;
 Mon, 30 Dec 2024 17:31:38 +0800 (CST)
From: Binbin Zhou <zhoubinbin@loongson.cn>
To: Binbin Zhou <zhoubb.aaron@gmail.com>, Huacai Chen <chenhuacai@loongson.cn>,
 Lee Jones <lee@kernel.org>, Corey Minyard <minyard@acm.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: Huacai Chen <chenhuacai@kernel.org>, linux-kernel@vger.kernel.org,
 openipmi-developer@lists.sourceforge.net, dri-devel@lists.freedesktop.org,
 Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev,
 Binbin Zhou <zhoubinbin@loongson.cn>, Chong Qiao <qiaochong@loongson.cn>
Subject: [PATCH v1 4/4] drm/ls2kbmc: Add Loongson-2K BMC reset function support
Date: Mon, 30 Dec 2024 17:31:36 +0800
Message-ID: <b0ac8b81fbb8955ed8ada27aba423cff45aad9f6.1735550269.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <cover.1735550269.git.zhoubinbin@loongson.cn>
References: <cover.1735550269.git.zhoubinbin@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: qMiowMCxbcd5aHJnyL4NAA--.3877S2
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoWxKw4UZrWDJrW3AF1DZr4xAFc_yoWfuF1rpF
 W5Aa4rtrWUtr1YgrZrX3WUCwsxKwn0qay7GFyIq3Zaya1avryDZFyrtF1fZF1fJrWkAr13
 X3ySkFW7uFyDA3gCm3ZEXasCq-sJn29KB7ZKAUJUUUU7529EdanIXcx71UUUUU7KY7ZEXa
 sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
 0xBIdaVrnRJUUUBvb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
 IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
 e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
 0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAF
 wI0_Gr1j6F4UJwAaw2AFwI0_Jrv_JF1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2
 xF0cIa020Ex4CE44I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_
 Wrv_ZF1lYx0Ex4A2jsIE14v26F4j6r4UJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2
 Ij64vIr41lc7CjxVAaw2AFwI0_JF0_Jw1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Y
 z7v_Jr0_Gr1l4IxYO2xFxVAFwI0_Jrv_JF1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x
 8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r4a6rW5MIIYrxkI7VAKI48JMIIF0xvE
 2Ix0cI8IcVAFwI0_Ar0_tr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26F4j6r4UJwCI42IY6x
 AIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Cr0_Gr1UMIIF0xvEx4A2jsIE
 c7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07jVeHDUUUUU=
X-Mailman-Approved-At: Tue, 31 Dec 2024 10:34:56 +0000
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

Since the display is a sub-function of the Loongson-2K BMC, when the
BMC reset, the entire BMC PCIe is disconnected, including the display
which is interrupted.

Not only do you need to save/restore the relevant PCIe registers
throughout the reset process, but you also need to re-push the display
to the monitor at the end.

Co-developed-by: Chong Qiao <qiaochong@loongson.cn>
Signed-off-by: Chong Qiao <qiaochong@loongson.cn>
Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
---
 drivers/gpu/drm/tiny/ls2kbmc.c | 284 ++++++++++++++++++++++++++++++++-
 1 file changed, 283 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tiny/ls2kbmc.c b/drivers/gpu/drm/tiny/ls2kbmc.c
index 909d6c687193..4b440f20cb4d 100644
--- a/drivers/gpu/drm/tiny/ls2kbmc.c
+++ b/drivers/gpu/drm/tiny/ls2kbmc.c
@@ -8,10 +8,12 @@
  */
 
 #include <linux/aperture.h>
+#include <linux/delay.h>
 #include <linux/minmax.h>
 #include <linux/pci.h>
 #include <linux/platform_data/simplefb.h>
 #include <linux/platform_device.h>
+#include <linux/stop_machine.h>
 
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_state_helper.h>
@@ -32,9 +34,27 @@
 #include <drm/drm_panic.h>
 #include <drm/drm_probe_helper.h>
 
+#define BMC_RESET_DELAY	(60 * HZ)
+#define BMC_RESET_WAIT	10000
+
+static const u32 index[] = { 0x4, 0x10, 0x14, 0x18, 0x1c, 0x20, 0x24,
+			     0x30, 0x3c, 0x54, 0x58, 0x78, 0x7c, 0x80 };
+static const u32 cindex[] = { 0x4, 0x10, 0x3c };
+
+struct ls2kbmc_pci_data {
+	u32 d80c;
+	u32 d71c;
+	u32 data[14];
+	u32 cdata[3];
+};
+
 struct ls2kbmc_pdata {
 	struct pci_dev *pdev;
+	struct drm_device *ddev;
+	struct work_struct bmc_work;
+	unsigned long reset_time;
 	struct simplefb_platform_data pd;
+	struct ls2kbmc_pci_data pci_data;
 };
 
 /*
@@ -583,6 +603,265 @@ static struct ls2kbmc_device *ls2kbmc_device_create(struct drm_driver *drv,
 	return sdev;
 }
 
+static bool ls2kbmc_bar0_addr_is_set(struct pci_dev *ppdev)
+{
+	u32 addr;
+
+	pci_read_config_dword(ppdev, PCI_BASE_ADDRESS_0, &addr);
+	addr &= PCI_BASE_ADDRESS_MEM_MASK;
+
+	return addr ? true : false;
+}
+
+static void ls2kbmc_save_pci_data(struct ls2kbmc_pdata *priv)
+{
+	struct pci_dev *pdev = priv->pdev;
+	struct pci_dev *parent = pdev->bus->self;
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(index); i++)
+		pci_read_config_dword(parent, index[i], &priv->pci_data.data[i]);
+
+	for (i = 0; i < ARRAY_SIZE(cindex); i++)
+		pci_read_config_dword(pdev, cindex[i], &priv->pci_data.cdata[i]);
+
+	pci_read_config_dword(parent, 0x80c, &priv->pci_data.d80c);
+	priv->pci_data.d80c = (priv->pci_data.d80c & ~(3 << 17)) | (1 << 17);
+
+	pci_read_config_dword(parent, 0x71c, &priv->pci_data.d71c);
+	priv->pci_data.d71c |= 1 << 26;
+}
+
+static bool ls2kbmc_check_pcie_connected(struct pci_dev *parent, struct drm_device *dev)
+{
+	void __iomem *mmio;
+	int sts, timeout = 10000;
+
+	mmio = pci_iomap(parent, 0, 0x100);
+	if (!mmio)
+		return false;
+
+	writel(readl(mmio) | 0x8, mmio);
+	while (timeout) {
+		sts = readl(mmio + 0xc);
+		if ((sts & 0x11) == 0x11)
+			break;
+		mdelay(1);
+		timeout--;
+	}
+
+	pci_iounmap(parent, mmio);
+
+	if (!timeout) {
+		drm_err(dev, "pcie train failed status=0x%x\n", sts);
+		return false;
+	}
+
+	return true;
+}
+
+static int ls2kbmc_recove_pci_data(void *data)
+{
+	struct ls2kbmc_pdata *priv = data;
+	struct pci_dev *pdev = priv->pdev;
+	struct drm_device *dev = priv->ddev;
+	struct pci_dev *parent = pdev->bus->self;
+	u32 i, timeout, retry = 0;
+	bool ready;
+
+	pci_write_config_dword(parent, PCI_BASE_ADDRESS_2, 0);
+	pci_write_config_dword(parent, PCI_BASE_ADDRESS_3, 0);
+	pci_write_config_dword(parent, PCI_BASE_ADDRESS_4, 0);
+
+	timeout = 10000;
+	while (timeout) {
+		ready = ls2kbmc_bar0_addr_is_set(parent);
+		if (!ready)
+			break;
+		mdelay(1);
+		timeout--;
+	};
+
+	if (!timeout)
+		drm_warn(dev, "bar not clear 0\n");
+
+retrain:
+	for (i = 0; i < ARRAY_SIZE(index); i++)
+		pci_write_config_dword(parent, index[i], priv->pci_data.data[i]);
+
+	pci_write_config_dword(parent, 0x80c, priv->pci_data.d80c);
+	pci_write_config_dword(parent, 0x71c, priv->pci_data.d71c);
+
+	/* Check if the pcie is connected */
+	ready = ls2kbmc_check_pcie_connected(parent, dev);
+	if (!ready)
+		return ready;
+
+	for (i = 0; i < ARRAY_SIZE(cindex); i++)
+		pci_write_config_dword(pdev, cindex[i], priv->pci_data.cdata[i]);
+
+	drm_info(dev, "pcie recovered done\n");
+
+	if (!retry) {
+		/*wait u-boot ddr config */
+		mdelay(BMC_RESET_WAIT);
+		ready = ls2kbmc_bar0_addr_is_set(parent);
+		if (!ready) {
+			retry = 1;
+			goto retrain;
+		}
+	}
+
+	return 0;
+}
+
+static int ls2kbmc_push_drm_mode(struct drm_device *dev)
+{
+	struct ls2kbmc_device *sdev = ls2kbmc_device_of_dev(dev);
+	struct drm_crtc *crtc = &sdev->crtc;
+	struct drm_plane *plane = crtc->primary;
+	struct drm_connector *connector = &sdev->connector;
+	struct drm_framebuffer *fb = NULL;
+	struct drm_mode_set set;
+	struct drm_modeset_acquire_ctx ctx;
+	int ret;
+
+	mutex_lock(&dev->mode_config.mutex);
+	connector->funcs->fill_modes(connector, 4096, 4096);
+	mutex_unlock(&dev->mode_config.mutex);
+
+	DRM_MODESET_LOCK_ALL_BEGIN(dev, ctx,
+				   DRM_MODESET_ACQUIRE_INTERRUPTIBLE, ret);
+
+	if (plane->state)
+		fb = plane->state->fb;
+	else
+		fb = plane->fb;
+
+	if (!fb) {
+		drm_dbg(dev, "CRTC doesn't have current FB\n");
+		ret = -EINVAL;
+		goto out;
+	}
+
+	drm_framebuffer_get(fb);
+
+	set.crtc = crtc;
+	set.x = 0;
+	set.y = 0;
+	set.mode = &sdev->mode;
+	set.connectors = &connector;
+	set.num_connectors = 1;
+	set.fb = fb;
+
+	ret = crtc->funcs->set_config(&set, &ctx);
+
+out:
+	DRM_MODESET_LOCK_ALL_END(dev, ctx, ret);
+
+	return ret;
+}
+
+static void ls2kbmc_events_fn(struct work_struct *work)
+{
+	struct ls2kbmc_pdata *priv = container_of(work, struct ls2kbmc_pdata, bmc_work);
+
+	/*
+	 * The pcie is lost when the BMC resets,
+	 * at which point access to the pcie from other CPUs
+	 * is suspended to prevent a crash.
+	 */
+	stop_machine(ls2kbmc_recove_pci_data, priv, NULL);
+
+	drm_info(priv->ddev, "redraw console\n");
+
+	/* We need to re-push the display due to previous pcie loss. */
+	ls2kbmc_push_drm_mode(priv->ddev);
+}
+
+static irqreturn_t ls2kbmc_interrupt(int irq, void *arg)
+{
+	struct ls2kbmc_pdata *priv = arg;
+
+	if (system_state != SYSTEM_RUNNING)
+		return IRQ_HANDLED;
+
+	/* skip interrupt in BMC_RESET_DELAY */
+	if (time_after(jiffies, priv->reset_time + BMC_RESET_DELAY))
+		schedule_work(&priv->bmc_work);
+
+	priv->reset_time = jiffies;
+
+	return IRQ_HANDLED;
+}
+
+#define BMC_RESET_GPIO			14
+#define LOONGSON_GPIO_REG_BASE		0x1fe00500
+#define LOONGSON_GPIO_REG_SIZE		0x18
+#define LOONGSON_GPIO_OEN		0x0
+#define LOONGSON_GPIO_FUNC		0x4
+#define LOONGSON_GPIO_INTPOL		0x10
+#define LOONGSON_GPIO_INTEN		0x14
+
+/* The gpio interrupt is a watchdog interrupt that is triggered when the BMC resets. */
+static int ls2kbmc_gpio_reset_handler(struct ls2kbmc_pdata *priv)
+{
+	int irq, ret = 0;
+	int gsi = 16 + (BMC_RESET_GPIO & 7);
+	void __iomem *gpio_base;
+
+	/* Since Loongson-3A hardware does not support GPIO interrupt cascade,
+	 * chip->gpio_to_irq() cannot be implemented,
+	 * here acpi_register_gsi() is used to get gpio irq.
+	 */
+	irq = acpi_register_gsi(NULL, gsi, ACPI_EDGE_SENSITIVE, ACPI_ACTIVE_LOW);
+	if (irq < 0)
+		return irq;
+
+	gpio_base = ioremap(LOONGSON_GPIO_REG_BASE, LOONGSON_GPIO_REG_SIZE);
+	if (!gpio_base) {
+		acpi_unregister_gsi(gsi);
+		return PTR_ERR(gpio_base);
+	}
+
+	writel(readl(gpio_base + LOONGSON_GPIO_OEN) | BIT(BMC_RESET_GPIO),
+	       gpio_base + LOONGSON_GPIO_OEN);
+	writel(readl(gpio_base + LOONGSON_GPIO_FUNC) & ~BIT(BMC_RESET_GPIO),
+	       gpio_base + LOONGSON_GPIO_FUNC);
+	writel(readl(gpio_base + LOONGSON_GPIO_INTPOL) & ~BIT(BMC_RESET_GPIO),
+	       gpio_base + LOONGSON_GPIO_INTPOL);
+	writel(readl(gpio_base + LOONGSON_GPIO_INTEN) | BIT(BMC_RESET_GPIO),
+	       gpio_base + LOONGSON_GPIO_INTEN);
+
+	ret = request_irq(irq, ls2kbmc_interrupt, IRQF_SHARED | IRQF_TRIGGER_FALLING,
+			  "ls2kbmc gpio", priv);
+
+	acpi_unregister_gsi(gsi);
+	iounmap(gpio_base);
+
+	return ret;
+}
+
+static int ls2kbmc_pdata_initial(struct platform_device *pdev, struct ls2kbmc_pdata *priv)
+{
+	int ret;
+
+	priv->pdev = *(struct pci_dev **)dev_get_platdata(&pdev->dev);
+
+	ls2kbmc_save_pci_data(priv);
+
+	INIT_WORK(&priv->bmc_work, ls2kbmc_events_fn);
+
+	ret = request_irq(priv->pdev->irq, ls2kbmc_interrupt,
+			  IRQF_SHARED | IRQF_TRIGGER_RISING, "ls2kbmc pcie", priv);
+	if (ret) {
+		pr_err("request_irq(%d) failed\n", priv->pdev->irq);
+		return ret;
+	}
+
+	return ls2kbmc_gpio_reset_handler(priv);
+}
+
 /*
  * Platform driver
  */
@@ -598,12 +877,15 @@ static int ls2kbmc_probe(struct platform_device *pdev)
 	if (IS_ERR(priv))
 		return -ENOMEM;
 
-	priv->pdev = *(struct pci_dev **)dev_get_platdata(&pdev->dev);
+	ret = ls2kbmc_pdata_initial(pdev, priv);
+	if (ret)
+		return ret;
 
 	sdev = ls2kbmc_device_create(&ls2kbmc_driver, pdev, priv);
 	if (IS_ERR(sdev))
 		return PTR_ERR(sdev);
 	dev = &sdev->dev;
+	priv->ddev = &sdev->dev;
 
 	ret = drm_dev_register(dev, 0);
 	if (ret)
-- 
2.43.5

