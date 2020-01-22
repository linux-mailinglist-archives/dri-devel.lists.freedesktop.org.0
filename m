Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 872A9146352
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jan 2020 09:20:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C6A26FB30;
	Thu, 23 Jan 2020 08:20:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 670886F8FC
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jan 2020 21:34:06 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id z7so666986wrl.13
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jan 2020 13:34:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=5AA0XUXODI/L8mJeadUgLE1ZooEgY946Z+CYImjR0Bo=;
 b=rhNpP5GH6IwGF9InK44HSTBOCKI+4MGEf2e8H1AUlAbQdAdZZnYJ4ZGBdneJfRvtcd
 ZEWoY+Vw/bAB5AuSt1ZOnDJ92woUy9HjEzG2LJI9SDVTgCq0ZyZNQH71/w6xsvHgkrEc
 DB9f/xq12BvaAm0Brj9Uhc2aQyEY4uQ6D6rKyHUKtUkJxpUvza2jOWQduh9sn9TAEmXD
 FFsT2K6PNu8UeTOoMEWChy0SKSm6GUUBYShHKZpuiXXR5DeZu8DVeujbImWor1qJgrDh
 XRPbO8MZaQLynyzt/IxkN9Z6i6j0MX+2g6ZfHFt974XJ0Y54CDoc1IFz2tXUcUTJqd1W
 /vjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=5AA0XUXODI/L8mJeadUgLE1ZooEgY946Z+CYImjR0Bo=;
 b=gwB/CxSPxPIo9b2YwqbZeOQfCasxm640YrkrRufBDw6+uEzz6YrSrRfcHp9MCY3BvX
 NVhohy/5j+Re2BZA/A7POWW3ezxUQF4OgXm5dwZOQIChvFRXnjhX9ZtN75UtDD4COPWc
 0Nh4Qpt46akyg4RCHYSnSb+LU15gFJHPb6OqH82CzPgY8upbQtqDZFui8CSbcg4oxnR7
 ZOBxpdEtD/5oVv7a9lgdPFGhlrdCgSh2n6G3Bxu3dDMnPOAp+dfZtsIKnu6c8FiwgLCb
 HCMFaaUOSXAnFlKldOKaBPcZO3GmL4XeJyusE91fbUhzFqCaKwuSuWGNVRRdXfy1WnLm
 s1JQ==
X-Gm-Message-State: APjAAAW6qtIr58PkuwlOkvYPa9WFEfUphaoDEhcTBzfpHHpxi5F0ZxjC
 F0gTZIMsCXZYI0zYUYf5scs=
X-Google-Smtp-Source: APXvYqwkxUglEvCrCq48Z4nbpO9Iyp5fdvM2CIeiSaGlpb7AquulcT0oGUHZUvxEGlKmtys3SARd/A==
X-Received: by 2002:a5d:4d4a:: with SMTP id a10mr13984704wru.220.1579728845000; 
 Wed, 22 Jan 2020 13:34:05 -0800 (PST)
Received: from mail.broadcom.com ([192.19.231.250])
 by smtp.gmail.com with ESMTPSA id w8sm6474630wmd.2.2020.01.22.13.34.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Jan 2020 13:34:04 -0800 (PST)
From: Kamal Dasu <kdasu.kdev@gmail.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH V4 3/3] mtd: rawnand: brcmnand: Add support for flash-edu for
 dma transfers
Date: Wed, 22 Jan 2020 16:33:13 -0500
Message-Id: <20200122213313.35820-4-kdasu.kdev@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200122213313.35820-1-kdasu.kdev@gmail.com>
References: <20200122213313.35820-1-kdasu.kdev@gmail.com>
X-Mailman-Approved-At: Thu, 23 Jan 2020 08:19:47 +0000
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Florian Fainelli <f.fainelli@gmail.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Paul Burton <paulburton@kernel.org>, Kamal Dasu <kdasu.kdev@gmail.com>,
 Richard Weinberger <richard@nod.at>, linux-mips@vger.kernel.org,
 Ralf Baechle <ralf@linux-mips.org>, linaro-mm-sig@lists.linaro.org,
 Rob Herring <robh+dt@kernel.org>, linux-mtd@lists.infradead.org,
 dri-devel@lists.freedesktop.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 James Hogan <jhogan@kernel.org>, bcm-kernel-feedback-list@broadcom.com,
 Brian Norris <computersforpeace@gmail.com>, linux-media@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Legacy mips soc platforms that have controller v5.0 and 6.0 use
flash-edu block for dma transfers. This change adds support for
nand dma transfers using the EDU block.

Signed-off-by: Kamal Dasu <kdasu.kdev@gmail.com>
---
 drivers/mtd/nand/raw/brcmnand/brcmnand.c | 293 ++++++++++++++++++++++-
 1 file changed, 287 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/nand/raw/brcmnand/brcmnand.c b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
index 1a66b1cd51c0..2185ff1c3fee 100644
--- a/drivers/mtd/nand/raw/brcmnand/brcmnand.c
+++ b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
@@ -102,6 +102,45 @@ struct brcm_nand_dma_desc {
 #define NAND_CTRL_RDY			(INTFC_CTLR_READY | INTFC_FLASH_READY)
 #define NAND_POLL_STATUS_TIMEOUT_MS	100
 
+#define EDU_CMD_WRITE          0x00
+#define EDU_CMD_READ           0x01
+#define EDU_STATUS_ACTIVE      BIT(0)
+#define EDU_ERR_STATUS_ERRACK  BIT(0)
+#define EDU_DONE_MASK		GENMASK(1, 0)
+
+#define EDU_CONFIG_MODE_NAND   BIT(0)
+#define EDU_CONFIG_SWAP_BYTE   BIT(1)
+#ifdef CONFIG_CPU_BIG_ENDIAN
+#define EDU_CONFIG_SWAP_CFG     EDU_CONFIG_SWAP_BYTE
+#else
+#define EDU_CONFIG_SWAP_CFG     0
+#endif
+
+/* edu registers */
+enum edu_reg {
+	EDU_CONFIG = 0,
+	EDU_DRAM_ADDR,
+	EDU_EXT_ADDR,
+	EDU_LENGTH,
+	EDU_CMD,
+	EDU_STOP,
+	EDU_STATUS,
+	EDU_DONE,
+	EDU_ERR_STATUS,
+};
+
+static const u16  edu_regs[] = {
+	[EDU_CONFIG] = 0x00,
+	[EDU_DRAM_ADDR] = 0x04,
+	[EDU_EXT_ADDR] = 0x08,
+	[EDU_LENGTH] = 0x0c,
+	[EDU_CMD] = 0x10,
+	[EDU_STOP] = 0x14,
+	[EDU_STATUS] = 0x18,
+	[EDU_DONE] = 0x1c,
+	[EDU_ERR_STATUS] = 0x20,
+};
+
 /* flash_dma registers */
 enum flash_dma_reg {
 	FLASH_DMA_REVISION = 0,
@@ -167,6 +206,8 @@ enum {
 	BRCMNAND_HAS_WP				= BIT(3),
 };
 
+struct brcmnand_host;
+
 struct brcmnand_controller {
 	struct device		*dev;
 	struct nand_controller	controller;
@@ -185,17 +226,32 @@ struct brcmnand_controller {
 
 	int			cmd_pending;
 	bool			dma_pending;
+	bool                    edu_pending;
 	struct completion	done;
 	struct completion	dma_done;
+	struct completion       edu_done;
 
 	/* List of NAND hosts (one for each chip-select) */
 	struct list_head host_list;
 
+	/* EDU info, per-transaction */
+	const u16               *edu_offsets;
+	void __iomem            *edu_base;
+	int			edu_irq;
+	int                     edu_count;
+	u64                     edu_dram_addr;
+	u32                     edu_ext_addr;
+	u32                     edu_cmd;
+	u32                     edu_config;
+
 	/* flash_dma reg */
 	const u16		*flash_dma_offsets;
 	struct brcm_nand_dma_desc *dma_desc;
 	dma_addr_t		dma_pa;
 
+	int (*dma_trans)(struct brcmnand_host *host, u64 addr, u32 *buf,
+			 u32 len, u8 dma_cmd);
+
 	/* in-memory cache of the FLASH_CACHE, used only for some commands */
 	u8			flash_cache[FC_BYTES];
 
@@ -216,6 +272,7 @@ struct brcmnand_controller {
 	u32			nand_cs_nand_xor;
 	u32			corr_stat_threshold;
 	u32			flash_dma_mode;
+	u32                     flash_edu_mode;
 	bool			pio_poll_mode;
 };
 
@@ -657,6 +714,22 @@ static inline void brcmnand_write_fc(struct brcmnand_controller *ctrl,
 	__raw_writel(val, ctrl->nand_fc + word * 4);
 }
 
+static inline void edu_writel(struct brcmnand_controller *ctrl,
+			      enum edu_reg reg, u32 val)
+{
+	u16 offs = ctrl->edu_offsets[reg];
+
+	brcmnand_writel(val, ctrl->edu_base + offs);
+}
+
+static inline u32 edu_readl(struct brcmnand_controller *ctrl,
+			    enum edu_reg reg)
+{
+	u16 offs = ctrl->edu_offsets[reg];
+
+	return brcmnand_readl(ctrl->edu_base + offs);
+}
+
 static void brcmnand_clear_ecc_addr(struct brcmnand_controller *ctrl)
 {
 
@@ -926,6 +999,16 @@ static inline bool has_flash_dma(struct brcmnand_controller *ctrl)
 	return ctrl->flash_dma_base;
 }
 
+static inline bool has_edu(struct brcmnand_controller *ctrl)
+{
+	return ctrl->edu_base;
+}
+
+static inline bool use_dma(struct brcmnand_controller *ctrl)
+{
+	return has_flash_dma(ctrl) || has_edu(ctrl);
+}
+
 static inline void disable_ctrl_irqs(struct brcmnand_controller *ctrl)
 {
 	if (ctrl->pio_poll_mode)
@@ -1299,6 +1382,52 @@ static int write_oob_to_regs(struct brcmnand_controller *ctrl, int i,
 	return tbytes;
 }
 
+static void brcmnand_edu_init(struct brcmnand_controller *ctrl)
+{
+	/* initialize edu */
+	edu_writel(ctrl, EDU_ERR_STATUS, 0);
+	edu_readl(ctrl, EDU_ERR_STATUS);
+	edu_writel(ctrl, EDU_DONE, 0);
+	edu_writel(ctrl, EDU_DONE, 0);
+	edu_writel(ctrl, EDU_DONE, 0);
+	edu_writel(ctrl, EDU_DONE, 0);
+	edu_readl(ctrl, EDU_DONE);
+}
+
+/* edu irq */
+static irqreturn_t brcmnand_edu_irq(int irq, void *data)
+{
+	struct brcmnand_controller *ctrl = data;
+
+	if (ctrl->edu_count) {
+		ctrl->edu_count--;
+		while (!(edu_readl(ctrl, EDU_DONE) & EDU_DONE_MASK))
+			udelay(1);
+		edu_writel(ctrl, EDU_DONE, 0);
+		edu_readl(ctrl, EDU_DONE);
+	}
+
+	if (ctrl->edu_count) {
+		ctrl->edu_dram_addr += FC_BYTES;
+		ctrl->edu_ext_addr += FC_BYTES;
+
+		edu_writel(ctrl, EDU_DRAM_ADDR, (u32)ctrl->edu_dram_addr);
+		edu_readl(ctrl, EDU_DRAM_ADDR);
+		edu_writel(ctrl, EDU_EXT_ADDR, ctrl->edu_ext_addr);
+		edu_readl(ctrl, EDU_EXT_ADDR);
+
+		mb(); /* flush previous writes */
+		edu_writel(ctrl, EDU_CMD, ctrl->edu_cmd);
+		edu_readl(ctrl, EDU_CMD);
+
+		return IRQ_HANDLED;
+	}
+
+	complete(&ctrl->edu_done);
+
+	return IRQ_HANDLED;
+}
+
 static irqreturn_t brcmnand_ctlrdy_irq(int irq, void *data)
 {
 	struct brcmnand_controller *ctrl = data;
@@ -1307,6 +1436,16 @@ static irqreturn_t brcmnand_ctlrdy_irq(int irq, void *data)
 	if (ctrl->dma_pending)
 		return IRQ_HANDLED;
 
+	/* check if you need to piggy back on the ctrlrdy irq */
+	if (ctrl->edu_pending) {
+		if (irq == ctrl->irq && ((int)ctrl->edu_irq >= 0))
+	/* Discard interrupts while using dedicated edu irq */
+			return IRQ_HANDLED;
+
+	/* no registered edu irq, call handler */
+		return brcmnand_edu_irq(irq, data);
+	}
+
 	complete(&ctrl->done);
 	return IRQ_HANDLED;
 }
@@ -1644,6 +1783,81 @@ static void brcmnand_write_buf(struct nand_chip *chip, const uint8_t *buf,
 	}
 }
 
+/**
+ *  Kick EDU engine
+ */
+static int brcmnand_edu_trans(struct brcmnand_host *host, u64 addr, u32 *buf,
+			      u32 len, u8 cmd)
+{
+	struct brcmnand_controller *ctrl = host->ctrl;
+	unsigned long timeo = msecs_to_jiffies(200);
+	int ret = 0;
+	int dir = (cmd == CMD_PAGE_READ ? DMA_FROM_DEVICE : DMA_TO_DEVICE);
+	u8 edu_cmd = (cmd == CMD_PAGE_READ ? EDU_CMD_READ : EDU_CMD_WRITE);
+	unsigned int trans = len >> FC_SHIFT;
+	dma_addr_t pa;
+
+	pa = dma_map_single(ctrl->dev, buf, len, dir);
+	if (dma_mapping_error(ctrl->dev, pa)) {
+		dev_err(ctrl->dev, "unable to map buffer for EDU DMA\n");
+		return -ENOMEM;
+	}
+
+	ctrl->edu_pending = true;
+	ctrl->edu_dram_addr = pa;
+	ctrl->edu_ext_addr = addr;
+	ctrl->edu_cmd = edu_cmd;
+	ctrl->edu_count = trans;
+
+	edu_writel(ctrl, EDU_DRAM_ADDR, (u32)ctrl->edu_dram_addr);
+	edu_readl(ctrl,  EDU_DRAM_ADDR);
+	edu_writel(ctrl, EDU_EXT_ADDR, ctrl->edu_ext_addr);
+	edu_readl(ctrl, EDU_EXT_ADDR);
+	edu_writel(ctrl, EDU_LENGTH, FC_BYTES);
+	edu_readl(ctrl, EDU_LENGTH);
+
+	/* Start edu engine */
+	mb(); /* flush previous writes */
+	edu_writel(ctrl, EDU_CMD, ctrl->edu_cmd);
+	edu_readl(ctrl, EDU_CMD);
+
+	if (wait_for_completion_timeout(&ctrl->edu_done, timeo) <= 0) {
+		dev_err(ctrl->dev,
+			"timeout waiting for EDU; status %#x, error status %#x\n",
+			edu_readl(ctrl, EDU_STATUS),
+			edu_readl(ctrl, EDU_ERR_STATUS));
+	}
+
+	dma_unmap_single(ctrl->dev, pa, len, dir);
+
+	/* for program page check NAND status */
+	if (((brcmnand_read_reg(ctrl, BRCMNAND_INTFC_STATUS) &
+	      INTFC_FLASH_STATUS) & NAND_STATUS_FAIL) &&
+	    edu_cmd == EDU_CMD_WRITE) {
+		dev_info(ctrl->dev, "program failed at %llx\n",
+			 (unsigned long long)addr);
+		ret = -EIO;
+	}
+
+	/* Make sure the EDU status is clean */
+	if (edu_readl(ctrl, EDU_STATUS) & EDU_STATUS_ACTIVE)
+		dev_warn(ctrl->dev, "EDU still active: %#x\n",
+			 edu_readl(ctrl, EDU_STATUS));
+
+	if (unlikely(edu_readl(ctrl, EDU_ERR_STATUS) & EDU_ERR_STATUS_ERRACK)) {
+		dev_warn(ctrl->dev, "EDU RBUS error at addr %llx\n",
+			 (unsigned long long)addr);
+		ret = -EIO;
+	}
+
+	ctrl->edu_pending = false;
+	brcmnand_edu_init(ctrl);
+	edu_writel(ctrl, EDU_STOP, 0); /* force stop */
+	edu_readl(ctrl, EDU_STOP);
+
+	return ret;
+}
+
 /**
  * Construct a FLASH_DMA descriptor as part of a linked list. You must know the
  * following ahead of time:
@@ -1850,9 +2064,11 @@ static int brcmnand_read(struct mtd_info *mtd, struct nand_chip *chip,
 try_dmaread:
 	brcmnand_clear_ecc_addr(ctrl);
 
-	if (has_flash_dma(ctrl) && !oob && flash_dma_buf_ok(buf)) {
-		err = brcmnand_dma_trans(host, addr, buf, trans * FC_BYTES,
-					     CMD_PAGE_READ);
+	if (ctrl->dma_trans && !oob && flash_dma_buf_ok(buf)) {
+		err = ctrl->dma_trans(host, addr, buf,
+				      trans * FC_BYTES,
+				      CMD_PAGE_READ);
+
 		if (err) {
 			if (mtd_is_bitflip_or_eccerr(err))
 				err_addr = addr;
@@ -1988,10 +2204,12 @@ static int brcmnand_write(struct mtd_info *mtd, struct nand_chip *chip,
 	for (i = 0; i < ctrl->max_oob; i += 4)
 		oob_reg_write(ctrl, i, 0xffffffff);
 
-	if (has_flash_dma(ctrl) && !oob && flash_dma_buf_ok(buf)) {
-		if (brcmnand_dma_trans(host, addr, (u32 *)buf,
-					mtd->writesize, CMD_PROGRAM_PAGE))
+	if (use_dma(ctrl) && !oob && flash_dma_buf_ok(buf)) {
+		if (ctrl->dma_trans(host, addr, (u32 *)buf, mtd->writesize,
+				    CMD_PROGRAM_PAGE))
+
 			ret = -EIO;
+
 		goto out;
 	}
 
@@ -2494,6 +2712,8 @@ static int brcmnand_suspend(struct device *dev)
 
 	if (has_flash_dma(ctrl))
 		ctrl->flash_dma_mode = flash_dma_readl(ctrl, FLASH_DMA_MODE);
+	else if (has_edu(ctrl))
+		ctrl->edu_config = edu_readl(ctrl, EDU_CONFIG);
 
 	return 0;
 }
@@ -2508,6 +2728,14 @@ static int brcmnand_resume(struct device *dev)
 		flash_dma_writel(ctrl, FLASH_DMA_ERROR_STATUS, 0);
 	}
 
+	if (has_edu(ctrl))
+		ctrl->edu_config = edu_readl(ctrl, EDU_CONFIG);
+	else {
+		edu_writel(ctrl, EDU_CONFIG, ctrl->edu_config);
+		edu_readl(ctrl, EDU_CONFIG);
+		brcmnand_edu_init(ctrl);
+	}
+
 	brcmnand_write_reg(ctrl, BRCMNAND_CS_SELECT, ctrl->nand_cs_nand_select);
 	brcmnand_write_reg(ctrl, BRCMNAND_CS_XOR, ctrl->nand_cs_nand_xor);
 	brcmnand_write_reg(ctrl, BRCMNAND_CORR_THRESHOLD,
@@ -2553,6 +2781,49 @@ MODULE_DEVICE_TABLE(of, brcmnand_of_match);
 /***********************************************************************
  * Platform driver setup (per controller)
  ***********************************************************************/
+static int brcmnand_edu_setup(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct brcmnand_controller *ctrl = dev_get_drvdata(&pdev->dev);
+	struct resource *res;
+	int ret;
+
+	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "flash-edu");
+	if (res) {
+		ctrl->edu_base = devm_ioremap_resource(dev, res);
+		if (IS_ERR(ctrl->edu_base))
+			return PTR_ERR(ctrl->edu_base);
+
+		ctrl->edu_offsets = edu_regs;
+
+		edu_writel(ctrl, EDU_CONFIG, EDU_CONFIG_MODE_NAND |
+			   EDU_CONFIG_SWAP_CFG);
+		edu_readl(ctrl, EDU_CONFIG);
+
+		/* initialize edu */
+		brcmnand_edu_init(ctrl);
+
+		ctrl->edu_irq = platform_get_irq_optional(pdev, 1);
+		if (ctrl->edu_irq < 0) {
+			dev_warn(dev,
+				 "FLASH EDU enabled, using ctlrdy irq\n");
+		} else {
+			ret = devm_request_irq(dev, ctrl->edu_irq,
+					       brcmnand_edu_irq, 0,
+					       "brcmnand-edu", ctrl);
+			if (ret < 0) {
+				dev_err(ctrl->dev, "can't allocate IRQ %d: error %d\n",
+					ctrl->edu_irq, ret);
+				return ret;
+			}
+
+			dev_info(dev, "FLASH EDU enabled using irq %u\n",
+				 ctrl->edu_irq);
+		}
+	}
+
+	return 0;
+}
 
 int brcmnand_probe(struct platform_device *pdev, struct brcmnand_soc *soc)
 {
@@ -2578,6 +2849,7 @@ int brcmnand_probe(struct platform_device *pdev, struct brcmnand_soc *soc)
 
 	init_completion(&ctrl->done);
 	init_completion(&ctrl->dma_done);
+	init_completion(&ctrl->edu_done);
 	nand_controller_init(&ctrl->controller);
 	ctrl->controller.ops = &brcmnand_controller_ops;
 	INIT_LIST_HEAD(&ctrl->host_list);
@@ -2665,6 +2937,15 @@ int brcmnand_probe(struct platform_device *pdev, struct brcmnand_soc *soc)
 		}
 
 		dev_info(dev, "enabling FLASH_DMA\n");
+		/* set flash dma transfer function to call */
+		ctrl->dma_trans = brcmnand_dma_trans;
+	} else	{
+		ret = brcmnand_edu_setup(pdev);
+		if (ret < 0)
+			goto err;
+
+		/* set edu transfer function to call */
+		ctrl->dma_trans = brcmnand_edu_trans;
 	}
 
 	/* Disable automatic device ID config, direct addressing */
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
