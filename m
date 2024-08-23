Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9177995D3E9
	for <lists+dri-devel@lfdr.de>; Fri, 23 Aug 2024 19:02:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80D9D10EC89;
	Fri, 23 Aug 2024 17:02:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="UVC/33Wj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 2150 seconds by postgrey-1.36 at gabe;
 Fri, 23 Aug 2024 17:02:10 UTC
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A145D10EC89
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Aug 2024 17:02:10 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6FC2EE0002;
 Fri, 23 Aug 2024 17:02:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1724432528;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yjV8fvGUKvQ0PKOlH59LPYdpzdY/ME/bnot3BsBfMv8=;
 b=UVC/33WjvnxYYbgNwBTdBNOsaahjhy/tPSDI+U5yxDNetF/Ie9yz1qpF1kwlISEkYRmwLf
 5/meN+9IQsEKIk059wZjs90fQvxEr93avMbWQxS6HpttszzNMD6ODcE5vhXWq8ZH3H23Ru
 JIAW0Ljc87Ws58MaE0yUI4YdBZ/Acj6kZMR2FEeqnwyTzKvGKNjRFdKa7HFiQIdIMSc8Wz
 6z5iUPBB/O20DZdedWRd8BfuWABxQumpQuLk2A2oM/MlGKT5POkC0Vbn+b+ytkMhMtGZhB
 koDD7TkUycD3Zg0KytSCSHaDueKQYuF2OIFkABXTQLNe5sjz86fujdeKjiUbnQ==
Date: Fri, 23 Aug 2024 19:02:06 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Hui-Ping Chen <hpchen0nvt@gmail.com>
Cc: richard@nod.at, vigneshr@ti.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, sumit.semwal@linaro.org, christian.koenig@amd.com,
 esben@geanix.com, linux-arm-kernel@lists.infradead.org,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH v3 2/2] mtd: rawnand: nuvoton: add new driver for the
 Nuvoton MA35 SoC
Message-ID: <20240823190206.6cd76b43@xps-13>
In-Reply-To: <20240821071132.281018-3-hpchen0nvt@gmail.com>
References: <20240821071132.281018-1-hpchen0nvt@gmail.com>
 <20240821071132.281018-3-hpchen0nvt@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-GND-Sasl: miquel.raynal@bootlin.com
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

Hi Hui-Ping,

hpchen0nvt@gmail.com wrote on Wed, 21 Aug 2024 07:11:32 +0000:

> Nuvoton MA35 SoCs NAND Flash Interface Controller
> supports 2KB, 4KB and 8KB page size, and up to 8-bit,

Suffix is: kiB

> 12-bit, and 24-bit hardware ECC calculation circuit
> to protect data communication.

It's not the communication, it's the data itself.

>=20
> Signed-off-by: Hui-Ping Chen <hpchen0nvt@gmail.com>
> ---
>  drivers/mtd/nand/raw/Kconfig               |    8 +
>  drivers/mtd/nand/raw/Makefile              |    1 +
>  drivers/mtd/nand/raw/nuvoton_ma35d1_nand.c | 1068 ++++++++++++++++++++
>  3 files changed, 1077 insertions(+)
>  create mode 100644 drivers/mtd/nand/raw/nuvoton_ma35d1_nand.c
>=20
> diff --git a/drivers/mtd/nand/raw/Kconfig b/drivers/mtd/nand/raw/Kconfig
> index 614257308516..932bf2215470 100644
> --- a/drivers/mtd/nand/raw/Kconfig
> +++ b/drivers/mtd/nand/raw/Kconfig
> @@ -448,6 +448,14 @@ config MTD_NAND_RENESAS
>  	  Enables support for the NAND controller found on Renesas R-Car
>  	  Gen3 and RZ/N1 SoC families.
> =20
> +config MTD_NAND_NVT_MA35

Is NVT so common or is it just one opportunity to save 4 chars in a
Kconfig file?? I'd prefer something more easy to understand.

> +	tristate "Nuvoton MA35 SoC NAND controller"
> +	depends on ARCH_MA35 || COMPILE_TEST
> +	depends on OF
> +	help
> +	  Enables support for the NAND controller found on
> +	  the Nuvoton MA35 series SoCs.
> +
>  comment "Misc"
> =20
>  config MTD_SM_COMMON
> diff --git a/drivers/mtd/nand/raw/Makefile b/drivers/mtd/nand/raw/Makefile
> index 25120a4afada..cdfdfee3f5f3 100644
> --- a/drivers/mtd/nand/raw/Makefile
> +++ b/drivers/mtd/nand/raw/Makefile
> @@ -57,6 +57,7 @@ obj-$(CONFIG_MTD_NAND_INTEL_LGM)	+=3D intel-nand-contro=
ller.o
>  obj-$(CONFIG_MTD_NAND_ROCKCHIP)		+=3D rockchip-nand-controller.o
>  obj-$(CONFIG_MTD_NAND_PL35X)		+=3D pl35x-nand-controller.o
>  obj-$(CONFIG_MTD_NAND_RENESAS)		+=3D renesas-nand-controller.o
> +obj-$(CONFIG_MTD_NAND_NVT_MA35)	+=3D nuvoton_ma35d1_nand.o
> =20
>  nand-objs :=3D nand_base.o nand_legacy.o nand_bbt.o nand_timings.o nand_=
ids.o
>  nand-objs +=3D nand_onfi.o
> diff --git a/drivers/mtd/nand/raw/nuvoton_ma35d1_nand.c b/drivers/mtd/nan=
d/raw/nuvoton_ma35d1_nand.c
> new file mode 100644
> index 000000000000..b4586d7a7a45
> --- /dev/null
> +++ b/drivers/mtd/nand/raw/nuvoton_ma35d1_nand.c
> @@ -0,0 +1,1068 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2024 Nuvoton Technology Corp.
> + */
> +#include <linux/slab.h>
> +#include <linux/init.h>
> +#include <linux/module.h>
> +#include <linux/interrupt.h>
> +#include <linux/io.h>
> +#include <linux/platform_device.h>
> +#include <linux/delay.h>
> +#include <linux/clk.h>
> +#include <linux/err.h>
> +#include <linux/of.h>
> +

Not sure why you didn't sort the below includes with the ones above?

> +#include <linux/mtd/mtd.h>
> +#include <linux/mtd/partitions.h>
> +#include <linux/mtd/rawnand.h>
> +#include <linux/dma-mapping.h>
> +#include <linux/dmaengine.h>
> +
> +/* NFI DMA Registers */
> +#define MA35_NFI_REG_BUFFER0		(0x000)

You don't need all these parentheses

> +#define MA35_NFI_REG_DMACTL		(0x400)
> +#define   DMA_EN				BIT(0)
> +#define   DMA_RST				BIT(1)
> +#define   DMA_BUSY				BIT(9)
> +
> +#define MA35_NFI_REG_DMASA		(0x408)
> +#define MA35_NFI_REG_DMABCNT		(0x40C)
> +#define MA35_NFI_REG_DMAINTEN		(0x410)
> +#define MA35_NFI_REG_DMAINTSTS	(0x414)
> +
> +/* NFI Global Registers */
> +#define MA35_NFI_REG_GCTL		(0x800)
> +#define   NAND_EN				BIT(3)
> +#define MA35_NFI_REG_GINTEN		(0x804)
> +#define MA35_NFI_REG_GINTSTS		(0x808)
> +
> +/* NAND-type Flash Registers */
> +#define MA35_NFI_REG_NANDCTL		(0x8A0)
> +#define   SWRST				BIT(0)
> +#define   DMA_W_EN				BIT(1)
> +#define   DMA_R_EN				BIT(2)
> +#define   ECC_CHK				BIT(7)
> +#define   PROT3BEN				BIT(8)
> +#define   PSIZE_2K				(1 << 16)
> +#define   PSIZE_4K				(2 << 16)
> +#define   PSIZE_8K				(3 << 16)
> +#define   PSIZE_MASK				(3 << 16)
> +#define   BCH_T24				BIT(18)
> +#define   BCH_T8				BIT(20)
> +#define   BCH_T12				BIT(21)
> +#define   BCH_NONE				(0x0)
> +#define   BCH_MASK				(0x1f << 18)
> +#define   ECC_EN				BIT(23)
> +#define   DISABLE_CS0				BIT(25)
> +
> +#define MA35_NFI_REG_NANDTMCTL	(0x8A4)
> +#define MA35_NFI_REG_NANDINTEN	(0x8A8)
> +#define MA35_NFI_REG_NANDINTSTS	(0x8AC)
> +#define   INT_DMA				BIT(0)
> +#define   INT_ECC				BIT(2)
> +#define   INT_RB0				BIT(10)
> +#define   INT_RB0_STS				BIT(18)
> +
> +#define MA35_NFI_REG_NANDCMD		(0x8B0)
> +#define MA35_NFI_REG_NANDADDR		(0x8B4)
> +#define   ENDADDR				BIT(31)
> +
> +#define MA35_NFI_REG_NANDDATA		(0x8B8)
> +#define MA35_NFI_REG_NANDRACTL	(0x8BC)
> +#define MA35_NFI_REG_NANDECTL		(0x8C0)
> +#define   ENABLE_WP				(0x0)
> +#define   DISABLE_WP				BIT(0)
> +
> +#define MA35_NFI_REG_NANDECCES0	(0x8D0)
> +#define   ECC_STATUS_MASK			(0x3)
> +#define   ECC_ERR_CNT_MASK			(0x1f)
> +
> +#define MA35_NFI_REG_NANDECCES1	(0x8D4)
> +#define MA35_NFI_REG_NANDECCES2	(0x8D8)
> +#define MA35_NFI_REG_NANDECCES3	(0x8DC)
> +
> +/* NAND-type Flash BCH Error Address Registers */
> +#define MA35_NFI_REG_NANDECCEA0	(0x900)
> +#define MA35_NFI_REG_NANDECCEA1	(0x904)
> +#define MA35_NFI_REG_NANDECCEA2	(0x908)
> +#define MA35_NFI_REG_NANDECCEA3	(0x90C)
> +#define MA35_NFI_REG_NANDECCEA4	(0x910)
> +#define MA35_NFI_REG_NANDECCEA5	(0x914)
> +#define MA35_NFI_REG_NANDECCEA6	(0x918)
> +#define MA35_NFI_REG_NANDECCEA7	(0x91C)
> +#define MA35_NFI_REG_NANDECCEA8	(0x920)
> +#define MA35_NFI_REG_NANDECCEA9	(0x924)
> +#define MA35_NFI_REG_NANDECCEA10	(0x928)
> +#define MA35_NFI_REG_NANDECCEA11	(0x92C)
> +
> +/* NAND-type Flash BCH Error Data Registers */
> +#define MA35_NFI_REG_NANDECCED0	(0x960)
> +#define MA35_NFI_REG_NANDECCED1	(0x964)
> +#define MA35_NFI_REG_NANDECCED2	(0x968)
> +#define MA35_NFI_REG_NANDECCED3	(0x96C)
> +#define MA35_NFI_REG_NANDECCED4	(0x970)
> +#define MA35_NFI_REG_NANDECCED5	(0x974)
> +
> +/* NAND-type Flash Redundant Area Registers */
> +#define MA35_NFI_REG_NANDRA0		(0xA00)
> +#define MA35_NFI_REG_NANDRA1		(0xA04)
> +
> +#define SKIP_SPARE_BYTES	4
> +
> +/* BCH algorithm related constants and variables */
> +static const int ma35_parity[3][4] =3D {
> +	{0,  60,  92,  90},  /* for 2K */
> +	{0, 120, 184, 180},  /* for 4K */
> +	{0, 240, 368, 360},  /* for 8K */

Can you please create definitions for the matrix rows? (using
an enum seems appropriate)

And maybe an array of three structures would be best because I believe
you're defining offsets for something which is not clear to the reader.

> +};
> +
> +struct ma35_nand_info {
> +	struct nand_controller controller;
> +	struct device *dev;
> +	void __iomem *regs;
> +	int irq;
> +	struct clk *clk;
> +	struct completion complete;
> +
> +	struct mtd_info mtd;

Please have a look at nand_to_mtd()

> +	struct nand_chip chip;

Is there a single CS supported? Is there a single RB supported?=20

> +	struct mtd_partition *parts;

No, this has nothing to do here.

> +	struct nand_ecclayout_user nand_oob;

Deprecated structure

> +	int nr_parts;
> +
> +	u32 bch;
> +	u8 *dma_buf;
> +	spinlock_t dma_lock;
> +	dma_addr_t dma_addr;
> +};
> +
> +static int ma35_ooblayout_ecc(struct mtd_info *mtd, int section,
> +			      struct mtd_oob_region *oobregion)
> +{
> +	struct nand_chip *chip =3D mtd_to_nand(mtd);
> +
> +	if (section)
> +		return -ERANGE;
> +
> +	oobregion->length =3D chip->ecc.total;
> +	oobregion->offset =3D mtd->oobsize - oobregion->length;
> +
> +	return 0;
> +}
> +
> +static int ma35_ooblayout_free(struct mtd_info *mtd, int section,
> +			       struct mtd_oob_region *oobregion)
> +{
> +	struct nand_chip *chip =3D mtd_to_nand(mtd);
> +
> +	if (section)
> +		return -ERANGE;
> +
> +	oobregion->length =3D mtd->oobsize - chip->ecc.total - 2;
> +	oobregion->offset =3D 2;
> +
> +	return 0;
> +}
> +
> +static const struct mtd_ooblayout_ops ma35_ooblayout_ops =3D {
> +	.free =3D ma35_ooblayout_free,
> +	.ecc =3D ma35_ooblayout_ecc,
> +};
> +
> +/*
> + * Initialize hardware ECC
> + */
> +static void ma35_nand_hwecc_init(struct ma35_nand_info *nand)
> +{
> +	struct mtd_info *mtd =3D nand_to_mtd(&nand->chip);
> +
> +	/* reset nand controller */

	   Reset NAND

> +	writel(readl(nand->regs + MA35_NFI_REG_NANDCTL) | SWRST,
> +		nand->regs + MA35_NFI_REG_NANDCTL);

I believe it's fine to do it on several lines and probably clearer.

	u32 reg =3D readl();
	reg |=3D SOMETHING;
	writel();

No wait after the reset?

> +	/* Redundant area size */
> +	writel(mtd->oobsize, nand->regs + MA35_NFI_REG_NANDRACTL);
> +
> +	/* Protect redundant 3 bytes */

What does that mean?

> +	writel(readl(nand->regs + MA35_NFI_REG_NANDCTL) | PROT3BEN,
> +		nand->regs + MA35_NFI_REG_NANDCTL);
> +
> +	/* Write the ECC parity codes automatically to NAND Flash */
> +	writel(readl(nand->regs + MA35_NFI_REG_NANDCTL) | ECC_CHK,
> +		nand->regs + MA35_NFI_REG_NANDCTL);

No, by default you should disabled the ECC engine. Then when you need
it you enable/use/disable it.

> +
> +	if (nand->bch =3D=3D BCH_NONE) {
> +		/* Disable H/W ECC, ECC parity check enable bit during read page */
> +		writel(readl(nand->regs + MA35_NFI_REG_NANDCTL) & (~ECC_EN),
> +			nand->regs + MA35_NFI_REG_NANDCTL);
> +	} else {
> +		/* Set BCH algorithm */
> +		writel((readl(nand->regs + MA35_NFI_REG_NANDCTL) & (~BCH_MASK)) |
> +			nand->bch, nand->regs + MA35_NFI_REG_NANDCTL);
> +
> +		/* Enable H/W ECC, ECC parity check enable bit during read page */
> +		writel(readl(nand->regs + MA35_NFI_REG_NANDCTL) | ECC_EN,
> +			nand->regs + MA35_NFI_REG_NANDCTL);
> +	}
> +	spin_lock_init(&nand->dma_lock);
> +}
> +
> +static void ma35_nand_initialize(struct ma35_nand_info *nand)
> +{
> +	writel(NAND_EN, nand->regs + MA35_NFI_REG_GCTL);
> +}
> +
> +
> +/* Define some constants for BCH */

			for the BCH hardware ECC engine

> +/* define the total padding bytes for 512/1024 data segment */
> +#define BCH_PADDING_LEN_512	32
> +#define BCH_PADDING_LEN_1024	64
> +/* define the BCH parity code length for 512 bytes data pattern */
> +#define BCH_PARITY_LEN_T8	15
> +#define BCH_PARITY_LEN_T12	23
> +/* define the BCH parity code length for 1024 bytes data pattern */
> +#define BCH_PARITY_LEN_T24	45
> +

Is T the strength? Can we name it strength instead?

Please move the definitions at the top

> +/* Correct data by BCH alrogithm */
> +static void ma35_nfi_correctdata(struct ma35_nand_info *nand, u8 index,
> +				 u8 err_cnt, u8 *addr)

correctdata vs correct, the naming needs to be improved

> +{
> +	u8 *ptr =3D (u8 *)((long)nand->regs + MA35_NFI_REG_NANDRA0);

Haha, no, never.

Please compile with C=3D1 and see how this explodes.

Also, you can enable W=3D1

> +	u32 field_len, padding_len, parity_len;
> +	u32 temp_data[24], temp_addr[24];
> +	u32 total_field_num, page;
> +	u32 err_data[6];
> +	u8  *smra_index;
> +	u8  i, j;
> +
> +	/* assign parameters for different BCH and page size */

					   configurations

> +	switch (readl(nand->regs + MA35_NFI_REG_NANDCTL) & BCH_MASK) {
> +	case BCH_T24:
> +		field_len =3D 1024;
> +		parity_len =3D BCH_PARITY_LEN_T24;
> +		padding_len =3D BCH_PADDING_LEN_1024;
> +		break;
> +	case BCH_T12:
> +		field_len =3D 512;
> +		parity_len =3D BCH_PARITY_LEN_T12;
> +		padding_len =3D BCH_PADDING_LEN_512;
> +		break;
> +	case BCH_T8:
> +		field_len =3D 512;
> +		parity_len =3D BCH_PARITY_LEN_T8;
> +		padding_len =3D BCH_PADDING_LEN_512;
> +		break;
> +	default:
> +		pr_warn("NAND ERROR: invalid SMCR_BCH_TSEL =3D 0x%08X\n",
> +			(u32)(readl(nand->regs + MA35_NFI_REG_NANDCTL) & BCH_MASK));
> +		return;
> +	}
> +
> +	page =3D readl(nand->regs + MA35_NFI_REG_NANDCTL) & PSIZE_MASK;
> +	switch (page) {
> +	case PSIZE_8K:
> +		total_field_num =3D 8192 / field_len; break;
> +	case PSIZE_4K:
> +		total_field_num =3D 4096 / field_len; break;
> +	case PSIZE_2K:
> +		total_field_num =3D 2048 / field_len; break;

Break on a new line

> +	default:
> +		pr_warn("NAND ERROR: invalid SMCR_PSIZE =3D 0x%08X\n", page);
> +		return;
> +	}
> +
> +	/* got valid BCH_ECC_DATAx and parse them to temp_data[]
> +	 * got the valid register number of BCH_ECC_DATAx since
> +	 * one register include 4 error bytes
> +	 */
> +	j =3D err_cnt / 4;
> +	j++;
> +	if (j > 6)
> +		j =3D 6;	/* there are 6 BCH_ECC_DATAx registers to support BCH T24 */
> +
> +	for (i =3D 0; i < j; i++)
> +		err_data[i] =3D readl(nand->regs + MA35_NFI_REG_NANDECCED0 + i*4);
> +
> +	for (i =3D 0; i < j; i++) {
> +		temp_data[i*4+0] =3D err_data[i] & 0xff;
> +		temp_data[i*4+1] =3D (err_data[i] >> 8) & 0xff;
> +		temp_data[i*4+2] =3D (err_data[i] >> 16) & 0xff;
> +		temp_data[i*4+3] =3D (err_data[i] >> 24) & 0xff;
> +	}
> +
> +	/* got valid REG_BCH_ECC_ADDRx and parse them to temp_addr[]
> +	 * got the valid register number of REG_BCH_ECC_ADDRx since
> +	 * one register include 2 error addresses
> +	 */
> +	j =3D err_cnt / 2;
> +	j++;
> +	if (j > 12)
> +		j =3D 12; /* there are 12 REG_BCH_ECC_ADDRx registers to support BCH T=
24 */
> +
> +	for (i =3D 0; i < j; i++) {
> +		/* 11 bits for error address */
> +		temp_addr[i*2+0] =3D readl(nand->regs + MA35_NFI_REG_NANDECCEA0 + i*4)=
 & 0x07ff;
> +		temp_addr[i*2+1] =3D (readl(nand->regs + MA35_NFI_REG_NANDECCEA0 + i*4=
)>>16) & 0x07ff;
> +	}
> +
> +	/* pointer to begin address of field that with data error */
> +	addr +=3D (index-1) * field_len;
> +
> +	/* correct each error bytes */
> +	for (i =3D 0; i < err_cnt; i++) {
> +		/* for wrong data in field */
> +		if (temp_addr[i] < field_len)
> +			*(addr+temp_addr[i]) ^=3D temp_data[i];
> +
> +		/* for wrong first-3-bytes in redundancy area */
> +		else if (temp_addr[i] < (field_len+3)) {
> +			temp_addr[i] -=3D field_len;
> +			temp_addr[i] +=3D (parity_len * (index-1));	/* field offset */
> +
> +			*(ptr + temp_addr[i]) ^=3D temp_data[i];
> +		}
> +		/* for wrong parity code in redundancy area */
> +		/* BCH_ERR_ADDRx =3D [data in field] + [3 bytes] + [xx] + [parity code=
]          */
> +		/*                                   |<--     padding bytes      -->| =
         */
> +		/* The BCH_ERR_ADDRx for last parity code always =3D field size + padd=
ing size.  */
> +		/* So, the first parity code =3D field size + padding size - parity co=
de length. */
> +		/* For example, for BCH T12, the first parity code =3D 512 + 32 - 23 =
=3D 521.      */
> +		/* That is, error byte address offset within field is                 =
         */
> +		else {
> +			temp_addr[i] =3D temp_addr[i] - (field_len + padding_len - parity_len=
);
> +
> +			/* smra_index point to the first parity code of
> +			 * first field in register SMRA0~n
> +			 */
> +			smra_index =3D (u8 *)(ptr +
> +				(readl(nand->regs+MA35_NFI_REG_NANDRACTL) & 0x1ff) -
> +				(parity_len * total_field_num));
> +
> +			/* final address =3D first parity code of first field + */
> +			/*                 offset of fields +                 */
> +			/*                 offset within field                */

Coding style

> +
> +			*((u8 *)smra_index + (parity_len * (index - 1)) + temp_addr[i])
> +				^=3D temp_data[i];

-ENOPARSE

> +		}
> +	} /* end of for (i < err_cnt) */

Useless comment

> +}
> +
> +static int ma35_nfi_correct(struct nand_chip *chip, unsigned long addr)
> +{
> +	struct ma35_nand_info *nand =3D nand_get_controller_data(chip);
> +	struct mtd_info *mtd =3D nand_to_mtd(chip);
> +	int status, i, j, field =3D 0;
> +	int report_err =3D 0;
> +	int err_cnt =3D 0;
> +
> +	if ((readl(nand->regs + MA35_NFI_REG_NANDCTL) & BCH_MASK) =3D=3D BCH_T2=
4)
> +		field =3D mtd->writesize / 1024;

Can we call this a nchunks? Also, you're supposed to expect some DT
properties (based on your bindings) and you're not using their values,
it's strange.

> +	else
> +		field =3D mtd->writesize / 512;
> +
> +	if (field < 4)
> +		field =3D 1;
> +	else
> +		field /=3D 4;
> +
> +	for (j =3D 0; j < field; j++) {
> +		status =3D readl(nand->regs + MA35_NFI_REG_NANDECCES0 + j*4);
> +		if (!status)
> +			continue;

Is this case relevant? Isn't it treated below?

> +
> +		for (i =3D 1; i < 5; i++) {

=46rom 1 to 5? That's strange.

> +			if (!(status & ECC_STATUS_MASK)) {
> +				/* No error */
> +				status >>=3D 8;

You can't do that 5 times on a int.

> +				continue;
> +
> +			} else if ((status & ECC_STATUS_MASK) =3D=3D 0x01) {
> +				/* Correctable error */
> +				err_cnt =3D (status >> 2) & ECC_ERR_CNT_MASK;

Please use FIELD_GET()

> +				pr_warn("Field (%d, %d) have %d error!\n", j, i, err_cnt);

dev_warn()

> +				ma35_nfi_correctdata(nand, j*4+i, err_cnt, (u8 *)addr);
> +				report_err +=3D err_cnt;
> +
> +			} else {
> +				/* uncorrectable error */
> +				pr_warn("uncorrectable error! 0x%4x\n", status);
> +				return -1;
> +			}
> +			status >>=3D 8;
> +		}
> +	}
> +	return report_err;
> +}
> +
> +
> +static int ma35_nand_correct_data(struct nand_chip *chip, u_char *dat,
> +				  u_char *read_ecc, u_char *calc_ecc)
> +{
> +	return 0;

?

> +}
> +
> +
> +static void ma35_nand_enable_hwecc(struct nand_chip *chip, int mode)
> +{

?

> +
> +}
> +
> +/*
> + * Initial dma controller

Initialize DMA

> + */
> +static void ma35_nand_dmac_init(struct ma35_nand_info *nand)
> +{
> +	/* DMAC reset and enable */
> +	writel(DMA_RST | DMA_EN, nand->regs + MA35_NFI_REG_DMACTL);
> +	writel(DMA_EN, nand->regs + MA35_NFI_REG_DMACTL);
> +
> +	/* Clear DMA finished flag */
> +	writel(INT_DMA | INT_ECC, nand->regs + MA35_NFI_REG_NANDINTSTS);
> +
> +	init_completion(&nand->complete);
> +}
> +
> +/*
> + * read a byte from NAND controller

      Read (same below)

> + */
> +static u8 ma35_nand_read_byte(struct nand_chip *chip)
> +{
> +	struct ma35_nand_info *nand =3D nand_get_controller_data(chip);
> +	u8 ret;
> +
> +	writel(readl(nand->regs + MA35_NFI_REG_NANDCTL) & (~DISABLE_CS0),
> +		nand->regs+MA35_NFI_REG_NANDCTL);
> +	ret =3D (u8)readl(nand->regs + MA35_NFI_REG_NANDDATA);

readb? maybe you need to handle endianness?

> +	writel(readl(nand->regs + MA35_NFI_REG_NANDCTL) | DISABLE_CS0,
> +		nand->regs + MA35_NFI_REG_NANDCTL);
> +
> +	return ret;
> +}
> +
> +
> +/*
> + * read data from NAND controller
> + */
> +static void ma35_nand_read_buf(struct nand_chip *chip, u8 *buf, int len)
> +{
> +	struct ma35_nand_info *nand =3D nand_get_controller_data(chip);
> +	int i;
> +
> +	writel(readl(nand->regs + MA35_NFI_REG_NANDCTL) & (~DISABLE_CS0),
> +		nand->regs + MA35_NFI_REG_NANDCTL);
> +	for (i =3D 0; i < len; i++)
> +		buf[i] =3D (u8)readl(nand->regs + MA35_NFI_REG_NANDDATA);
> +	writel(readl(nand->regs + MA35_NFI_REG_NANDCTL) | DISABLE_CS0,
> +		nand->regs + MA35_NFI_REG_NANDCTL);
> +}
> +/*
> + * write data to NAND controller
> + */
> +
> +static void ma35_nand_write_buf(struct nand_chip *chip, const u8 *buf, i=
nt len)
> +{
> +	struct ma35_nand_info *nand =3D nand_get_controller_data(chip);
> +	int i;
> +
> +	writel(readl(nand->regs + MA35_NFI_REG_NANDCTL) & (~DISABLE_CS0),
> +		nand->regs + MA35_NFI_REG_NANDCTL);
> +	for (i =3D 0; i < len; i++)
> +		writel(buf[i], nand->regs + MA35_NFI_REG_NANDDATA);
> +	writel(readl(nand->regs + MA35_NFI_REG_NANDCTL) | DISABLE_CS0,
> +		nand->regs + MA35_NFI_REG_NANDCTL);
> +}
> +
> +/*
> + * configure and start dma transfer
> + */
> +static inline int ma35_nand_dma_transfer(struct nand_chip *chip,
> +					  const u_char *addr, u32 len, int is_write)
> +{
> +	struct ma35_nand_info *nand =3D nand_get_controller_data(chip);
> +	struct mtd_info *mtd =3D nand_to_mtd(chip);
> +	unsigned long timeo =3D jiffies + HZ/2;
> +	dma_addr_t dma_addr;
> +	int ret;
> +
> +	writel(readl(nand->regs + MA35_NFI_REG_NANDCTL) & (~DISABLE_CS0),
> +		nand->regs+MA35_NFI_REG_NANDCTL);
> +	/* For save, wait DMAC to ready */

Please rework this comment

> +	while (1) {
> +		if ((readl(nand->regs + MA35_NFI_REG_DMACTL) & DMA_BUSY) =3D=3D 0)
> +			break;
> +		if (time_after(jiffies, timeo))
> +			return -ETIMEDOUT;

readl_poll_timeout()

> +	}
> +
> +	/* Reinitial dmac */
> +	ma35_nand_dmac_init(nand);
> +
> +	writel(mtd->oobsize, nand->regs + MA35_NFI_REG_NANDRACTL);
> +
> +	/* setup and start DMA using dma_addr */
> +	if (is_write) {
> +		u8 *ptr =3D (u8 *)((long)nand->regs + MA35_NFI_REG_NANDRA0);
> +
> +		writel(INT_DMA, nand->regs + MA35_NFI_REG_NANDINTEN);
> +		/* To mark this page as dirty. */
> +		if (ptr[3] =3D=3D 0xFF)
> +			ptr[3] =3D 0;
> +		if (ptr[2] =3D=3D 0xFF)
> +			ptr[2] =3D 0;
> +
> +		/* Fill dma_addr */
> +		dma_addr =3D dma_map_single(nand->dev, (void *)addr, len, DMA_TO_DEVIC=
E);
> +		dma_sync_single_for_device(nand->dev, dma_addr, len, DMA_TO_DEVICE);
> +		ret =3D dma_mapping_error(nand->dev, dma_addr);
> +		if (ret) {
> +			dev_err(nand->dev, "dma mapping error\n");
> +			return -EINVAL;
> +		}
> +
> +		writel((unsigned long)dma_addr, nand->regs + MA35_NFI_REG_DMASA);
> +		writel(readl(nand->regs + MA35_NFI_REG_NANDCTL) | DMA_W_EN,
> +			nand->regs + MA35_NFI_REG_NANDCTL);
> +		wait_for_completion_timeout(&nand->complete, msecs_to_jiffies(1000));
> +
> +		dma_unmap_single(nand->dev, dma_addr, len, DMA_TO_DEVICE);
> +	} else {
> +		writel(INT_DMA | INT_ECC, nand->regs + MA35_NFI_REG_NANDINTEN);
> +		/* Fill dma_addr */
> +		dma_addr =3D dma_map_single(nand->dev, (void *)addr, len, DMA_FROM_DEV=
ICE);
> +		ret =3D dma_mapping_error(nand->dev, dma_addr);
> +		if (ret) {
> +			dev_err(nand->dev, "dma mapping error\n");
> +			return -EINVAL;
> +		}
> +		nand->dma_buf =3D (u8 *) addr;

the cast should not be neede

> +		nand->dma_addr =3D dma_addr;
> +
> +		writel((unsigned long)dma_addr, nand->regs + MA35_NFI_REG_DMASA);
> +		writel(readl(nand->regs + MA35_NFI_REG_NANDCTL) | DMA_R_EN,
> +			nand->regs + MA35_NFI_REG_NANDCTL);
> +		wait_for_completion_timeout(&nand->complete, msecs_to_jiffies(1000));

Always check return values.

> +
> +		dma_sync_single_for_cpu(nand->dev, dma_addr, len, DMA_FROM_DEVICE);
> +		dma_unmap_single(nand->dev, dma_addr, len, DMA_FROM_DEVICE);
> +	}
> +
> +	writel(readl(nand->regs + MA35_NFI_REG_NANDCTL) | DISABLE_CS0,
> +		nand->regs + MA35_NFI_REG_NANDCTL);
> +
> +	return 0;
> +}
> +
> +static void ma35_read_buf_dma(struct nand_chip *chip, u_char *buf, int l=
en)
> +{
> +	struct mtd_info *mtd =3D nand_to_mtd(chip);
> +
> +	if (len =3D=3D mtd->writesize)
> +		ma35_nand_dma_transfer(chip, buf, len, 0x0);
> +	else
> +		ma35_nand_read_buf(chip, buf, len);
> +}
> +
> +static void ma35_write_buf_dma(struct nand_chip *chip, const u_char *buf=
, int len)
> +{
> +	struct mtd_info *mtd =3D nand_to_mtd(chip);
> +
> +	if (len =3D=3D mtd->writesize)
> +		ma35_nand_dma_transfer(chip, (u_char *)buf, len, 0x1);
> +	else
> +		ma35_nand_write_buf(chip, buf, len);
> +}
> +

This...

> +static int ma35_nand_devready(struct nand_chip *chip)
> +{
> +	struct ma35_nand_info *nand =3D nand_get_controller_data(chip);
> +	unsigned int val;
> +
> +	writel(readl(nand->regs + MA35_NFI_REG_NANDCTL) & (~DISABLE_CS0),
> +		nand->regs+MA35_NFI_REG_NANDCTL);
> +	val =3D (readl(nand->regs + MA35_NFI_REG_NANDINTSTS) & INT_RB0_STS) ? 1=
 : 0;
> +	writel(readl(nand->regs + MA35_NFI_REG_NANDCTL) | DISABLE_CS0,
> +		nand->regs+MA35_NFI_REG_NANDCTL);
> +
> +	return val;
> +}
> +
> +static int ma35_waitfunc(struct nand_chip *chip)
> +{
> +	struct ma35_nand_info *nand =3D nand_get_controller_data(chip);
> +	unsigned long timeo =3D jiffies;
> +	int status =3D -1;
> +
> +	timeo +=3D msecs_to_jiffies(400);
> +
> +	writel(readl(nand->regs + MA35_NFI_REG_NANDCTL) & (~DISABLE_CS0),
> +		nand->regs + MA35_NFI_REG_NANDCTL);
> +	while (time_before(jiffies, timeo)) {
> +		status =3D readl(nand->regs + MA35_NFI_REG_NANDINTSTS);
> +		if (status & INT_RB0) {
> +			writel(INT_RB0, nand->regs + MA35_NFI_REG_NANDINTSTS);
> +			status =3D 0;
> +			break;
> +		}
> +		cond_resched();
> +	}
> +	writel(readl(nand->regs + MA35_NFI_REG_NANDCTL) | DISABLE_CS0,
> +		nand->regs + MA35_NFI_REG_NANDCTL);
> +
> +	return status;
> +}
> +
> +static void ma35_nand_command(struct nand_chip *chip, u32 command, int c=
olumn, int page_addr)
> +{
> +	struct ma35_nand_info *nand =3D nand_get_controller_data(chip);
> +	struct mtd_info *mtd =3D nand_to_mtd(chip);
> +
> +	writel(readl(nand->regs + MA35_NFI_REG_NANDCTL) & (~DISABLE_CS0),
> +		nand->regs + MA35_NFI_REG_NANDCTL);
> +	writel(INT_RB0, nand->regs + MA35_NFI_REG_NANDINTSTS);
> +
> +	if (command =3D=3D NAND_CMD_READOOB) {
> +		command =3D NAND_CMD_READ0;
> +		column +=3D mtd->writesize;
> +	}
> +
> +	switch (command) {
> +	case NAND_CMD_RESET:
> +		writel(command, nand->regs + MA35_NFI_REG_NANDCMD);
> +		break;
> +
> +	case NAND_CMD_READID:
> +		writel(command, nand->regs + MA35_NFI_REG_NANDCMD);
> +		writel(ENDADDR|column, nand->regs + MA35_NFI_REG_NANDADDR);
> +		break;
> +
> +	case NAND_CMD_PARAM:
> +		writel(command, nand->regs + MA35_NFI_REG_NANDCMD);
> +		writel(ENDADDR|column, nand->regs + MA35_NFI_REG_NANDADDR);
> +		ma35_waitfunc(chip);
> +		break;
> +
> +	case NAND_CMD_READ0:
> +		writel(ENABLE_WP, nand->regs + MA35_NFI_REG_NANDECTL);
> +		writel(command, nand->regs + MA35_NFI_REG_NANDCMD);
> +		if (column !=3D -1) {
> +			writel(column & 0xff, nand->regs + MA35_NFI_REG_NANDADDR);
> +			writel((column >> 8) & 0xff, nand->regs + MA35_NFI_REG_NANDADDR);
> +		}
> +		if (page_addr !=3D -1) {
> +			writel(page_addr & 0xff, nand->regs + MA35_NFI_REG_NANDADDR);
> +			if (chip->options & NAND_ROW_ADDR_3) {
> +				writel((page_addr >> 8) & 0xff,
> +					nand->regs + MA35_NFI_REG_NANDADDR);
> +				writel(((page_addr >> 16) & 0xff) | ENDADDR,
> +					nand->regs + MA35_NFI_REG_NANDADDR);
> +			} else {
> +				writel(((page_addr >> 8) & 0xff) | ENDADDR,
> +					nand->regs + MA35_NFI_REG_NANDADDR);
> +			}
> +		}
> +		writel(NAND_CMD_READSTART, nand->regs + MA35_NFI_REG_NANDCMD);
> +		ma35_waitfunc(chip);
> +		break;
> +
> +	case NAND_CMD_ERASE1:
> +		writel(DISABLE_WP, nand->regs + MA35_NFI_REG_NANDECTL);
> +		writel(command, nand->regs + MA35_NFI_REG_NANDCMD);
> +		writel(page_addr & 0xff, nand->regs + MA35_NFI_REG_NANDADDR);
> +		if (chip->options & NAND_ROW_ADDR_3) {
> +			writel((page_addr >> 8) & 0xff,
> +				nand->regs + MA35_NFI_REG_NANDADDR);
> +			writel(((page_addr >> 16) & 0xff) | ENDADDR,
> +				nand->regs + MA35_NFI_REG_NANDADDR);
> +		} else {
> +			writel(((page_addr >> 8) & 0xff) | ENDADDR,
> +				nand->regs + MA35_NFI_REG_NANDADDR);
> +		}
> +		break;
> +
> +	case NAND_CMD_SEQIN:
> +		writel(DISABLE_WP, nand->regs + MA35_NFI_REG_NANDECTL);
> +		writel(command, nand->regs + MA35_NFI_REG_NANDCMD);
> +		writel(column & 0xff, nand->regs + MA35_NFI_REG_NANDADDR);
> +		writel(column >> 8, nand->regs + MA35_NFI_REG_NANDADDR);
> +		writel(page_addr & 0xff, nand->regs + MA35_NFI_REG_NANDADDR);
> +		if (chip->options & NAND_ROW_ADDR_3) {
> +			writel((page_addr >> 8) & 0xff,
> +				nand->regs + MA35_NFI_REG_NANDADDR);
> +			writel(((page_addr >> 16) & 0xff) | ENDADDR,
> +				nand->regs + MA35_NFI_REG_NANDADDR);
> +		} else {
> +			writel(((page_addr >> 8) & 0xff) | ENDADDR,
> +				nand->regs + MA35_NFI_REG_NANDADDR);
> +		}
> +		break;
> +
> +	case NAND_CMD_STATUS:
> +		writel(DISABLE_WP, nand->regs + MA35_NFI_REG_NANDECTL);
> +		writel(command, nand->regs + MA35_NFI_REG_NANDCMD);
> +		break;
> +
> +	default:
> +		writel(command, nand->regs + MA35_NFI_REG_NANDCMD);
> +	}
> +	writel(readl(nand->regs + MA35_NFI_REG_NANDCTL) | DISABLE_CS0,
> +		nand->regs + MA35_NFI_REG_NANDCTL);
> +}

... is totally legacy. ->exec_op() is the API to implement instead.

> +
> +/* select chip */
> +static void ma35_nand_select_chip(struct nand_chip *chip, int cs)
> +{
> +	struct ma35_nand_info *nand =3D nand_get_controller_data(chip);
> +
> +	if (cs =3D=3D 0)
> +		writel(readl(nand->regs + MA35_NFI_REG_NANDCTL) & (~DISABLE_CS0),
> +			nand->regs + MA35_NFI_REG_NANDCTL);
> +	else
> +		writel(readl(nand->regs + MA35_NFI_REG_NANDCTL) | DISABLE_CS0,
> +			nand->regs + MA35_NFI_REG_NANDCTL);
> +}
> +
> +static int ma35_nand_calculate_ecc(struct nand_chip *chip, const u_char =
*dat,
> +				   u_char *ecc_code)
> +{
> +	return 0;
> +}
> +
> +static int ma35_nand_write_page_hwecc(struct nand_chip *chip, const u8 *=
buf,
> +				      int oob_required, int page)
> +{
> +	struct ma35_nand_info *nand =3D nand_get_controller_data(chip);
> +	u8 *ptr =3D (u8 *)((long)nand->regs + MA35_NFI_REG_NANDRA0);
> +	struct mtd_info *mtd =3D nand_to_mtd(chip);
> +	u8 *ecc_calc =3D chip->ecc.calc_buf;
> +
> +	memset((void *)ptr, 0xFF, mtd->oobsize);
> +	memcpy((void *)ptr, (void *)chip->oob_poi, mtd->oobsize - chip->ecc.tot=
al);
> +
> +	ma35_nand_command(chip, NAND_CMD_SEQIN, 0, page);
> +	ma35_nand_dma_transfer(chip, buf, mtd->writesize, 0x1);
> +	ma35_nand_command(chip, NAND_CMD_PAGEPROG, -1, -1);
> +	ma35_waitfunc(chip);
> +
> +	/* Copy parity code in NANDRA to calc */
> +	memcpy((void *)ecc_calc,
> +		(void *)(ptr + (mtd->oobsize - chip->ecc.total)),
> +		chip->ecc.total);
> +
> +	/* Copy parity code in calc to oob_poi */
> +	memcpy((void *)(chip->oob_poi + (mtd->oobsize - chip->ecc.total)),
> +		(void *)ecc_calc, chip->ecc.total);
> +
> +	return 0;
> +}
> +
> +static int ma35_nand_read_page_hwecc_oob_first(struct nand_chip *chip, u=
8 *buf,
> +						int oob_required, int page)
> +{
> +	struct ma35_nand_info *nand =3D nand_get_controller_data(chip);
> +	char *ptr =3D (char *)((long)nand->regs + MA35_NFI_REG_NANDRA0);
> +	struct mtd_info *mtd =3D nand_to_mtd(chip);
> +
> +	/* 1. read the OOB area  */
> +	ma35_nand_command(chip, NAND_CMD_READOOB, 0, page);
> +	ma35_nand_read_buf(chip, chip->oob_poi, mtd->oobsize);
> +
> +	/* 2. copy OOB data to NANDRA for page read */
> +	memcpy((void *)ptr, (void *)chip->oob_poi, mtd->oobsize);
> +
> +	if ((*(ptr+2) !=3D 0) && (*(ptr+3) !=3D 0))
> +		memset((void *)buf, 0xff, mtd->writesize);
> +	else {
> +		/* 3. read data from nand */
> +		ma35_nand_command(chip, NAND_CMD_READ0, 0, page);
> +		ma35_nand_dma_transfer(chip, buf, mtd->writesize, 0x0);
> +
> +		/* 4. restore OOB data from SMRA */
> +		memcpy((void *)chip->oob_poi, (void *)ptr, mtd->oobsize);
> +	}
> +
> +	return 0;
> +}
> +

Not sure why you need these two implementations? Usually there is only
one per controller and fully depends on your controller
capabilities/limitations. If you have no limitation, just support the
simple case.

> +static void ma35_layout_oob_table(struct nand_ecclayout_user *oobtable,
> +				  int oobsize, int eccbytes)
> +{
> +	oobtable->eccbytes =3D eccbytes;
> +	oobtable->oobavail =3D oobsize - SKIP_SPARE_BYTES - eccbytes;
> +	oobtable->oobfree[0].offset =3D SKIP_SPARE_BYTES;
> +	oobtable->oobfree[0].length =3D oobsize - eccbytes - oobtable->oobfree[=
0].offset;
> +
> +	oobtable->oobfree[1].offset =3D 0;
> +	oobtable->oobfree[1].length =3D 0;
> +}

I'm not sure why you would need that.

> +
> +static int ma35_nand_read_oob_hwecc(struct nand_chip *chip, int page)
> +{
> +	struct ma35_nand_info *nand =3D nand_get_controller_data(chip);
> +	char *ptr =3D (char *)((long)nand->regs + MA35_NFI_REG_NANDRA0);
> +	struct mtd_info *mtd =3D nand_to_mtd(chip);
> +
> +	ma35_nand_command(chip, NAND_CMD_READOOB, 0, page);
> +	ma35_nand_read_buf(chip, chip->oob_poi, mtd->oobsize);
> +
> +	/* copy OOB data to NANDRA for page read */
> +	memcpy((void *)ptr, (void *)chip->oob_poi, mtd->oobsize);
> +
> +	if ((*(ptr+2) !=3D 0) && (*(ptr+3) !=3D 0))
> +		memset((void *)chip->oob_poi, 0xff, mtd->oobsize);
> +
> +	return 0;
> +}
> +
> +static irqreturn_t ma35_nand_irq(int irq, void *id)
> +{
> +	struct ma35_nand_info *nand =3D (struct ma35_nand_info *)id;
> +	struct mtd_info *mtd =3D nand_to_mtd(&nand->chip);
> +	int stat =3D 0;
> +	u32 isr;
> +
> +	spin_lock(&nand->dma_lock);
> +
> +	isr =3D readl(nand->regs + MA35_NFI_REG_NANDINTSTS);
> +	if (isr & INT_ECC) {
> +		dma_sync_single_for_cpu(nand->dev, nand->dma_addr, mtd->writesize,
> +					DMA_FROM_DEVICE);
> +		stat =3D ma35_nfi_correct(&nand->chip, (unsigned long)nand->dma_buf);
> +		if (stat < 0) {
> +			mtd->ecc_stats.failed++;
> +			writel(DMA_RST | DMA_EN, nand->regs + MA35_NFI_REG_DMACTL);
> +			writel(readl(nand->regs + MA35_NFI_REG_NANDCTL) | SWRST,
> +				nand->regs + MA35_NFI_REG_NANDCTL);
> +		} else if (stat > 0) {
> +			mtd->ecc_stats.corrected +=3D stat;   /* Add corrected bit count */
> +		}
> +		writel(INT_ECC, nand->regs + MA35_NFI_REG_NANDINTSTS);
> +	}
> +	if (isr & INT_DMA) {
> +		writel(INT_DMA, nand->regs + MA35_NFI_REG_NANDINTSTS);
> +		complete(&nand->complete);
> +	}
> +	spin_unlock(&nand->dma_lock);
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static int ma35_nand_attach_chip(struct nand_chip *chip)
> +{
> +	struct ma35_nand_info *nand =3D nand_get_controller_data(chip);
> +	struct mtd_info *mtd =3D nand_to_mtd(chip);
> +	unsigned int reg;
> +

Please have a look at other controller drivers. You need to allow:

- no correction
- sw correction
- hw BCH correction

> +	/* Set PSize */
> +	reg =3D readl(nand->regs + MA35_NFI_REG_NANDCTL) & (~PSIZE_MASK);
> +	if (mtd->writesize =3D=3D 2048)
> +		writel(reg | PSIZE_2K, nand->regs + MA35_NFI_REG_NANDCTL);
> +	else if (mtd->writesize =3D=3D 4096)
> +		writel(reg | PSIZE_4K, nand->regs + MA35_NFI_REG_NANDCTL);
> +	else if (mtd->writesize =3D=3D 8192)
> +		writel(reg | PSIZE_8K, nand->regs + MA35_NFI_REG_NANDCTL);
> +
> +	if (chip->ecc.strength =3D=3D 0) {
> +		nand->bch =3D BCH_NONE; /* No ECC */
> +		ma35_layout_oob_table(&nand->nand_oob, mtd->oobsize,
> +					ma35_parity[mtd->writesize>>12][0]);
> +
> +	} else if (chip->ecc.strength <=3D 8) {
> +		nand->bch =3D BCH_T8; /* T8 */
> +		ma35_layout_oob_table(&nand->nand_oob, mtd->oobsize,
> +					ma35_parity[mtd->writesize>>12][1]);
> +
> +	} else if (chip->ecc.strength <=3D 12) {
> +		nand->bch =3D BCH_T12; /* T12 */
> +		ma35_layout_oob_table(&nand->nand_oob, mtd->oobsize,
> +					ma35_parity[mtd->writesize>>12][2]);
> +
> +	} else if (chip->ecc.strength <=3D 24) {
> +		nand->bch =3D BCH_T24; /* T24 */
> +		ma35_layout_oob_table(&nand->nand_oob, mtd->oobsize,
> +					ma35_parity[mtd->writesize>>12][3]);
> +
> +	} else {
> +		pr_warn("NAND Controller is not support this flash. (%d, %d)\n",
> +			mtd->writesize, mtd->oobsize);
> +	}
> +
> +	chip->ecc.steps =3D mtd->writesize / chip->ecc.size;
> +	chip->ecc.bytes =3D nand->nand_oob.eccbytes / chip->ecc.steps;
> +	chip->ecc.total =3D nand->nand_oob.eccbytes;
> +	mtd_set_ooblayout(mtd, &ma35_ooblayout_ops);
> +
> +	/* add mtd-id. The string should same as uboot definition */
> +	mtd->name =3D "nand0";
> +
> +	ma35_nand_hwecc_init(nand);
> +
> +	writel(ENABLE_WP, nand->regs + MA35_NFI_REG_NANDECTL);
> +
> +	return 0;
> +}
> +
> +static const struct nand_controller_ops ma35_nand_controller_ops =3D {
> +	.attach_chip =3D ma35_nand_attach_chip,
> +};
> +
> +static int ma35_nand_probe(struct platform_device *pdev)
> +{
> +	struct ma35_nand_info *nand;
> +	struct nand_chip *chip;
> +	struct mtd_info *mtd;
> +	int retval =3D 0;
> +
> +	nand =3D devm_kzalloc(&pdev->dev, sizeof(*nand), GFP_KERNEL);
> +	if (!nand)
> +		return -ENOMEM;
> +
> +	nand_controller_init(&nand->controller);
> +
> +	nand->regs =3D devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(nand->regs))
> +		return PTR_ERR(nand->regs);
> +
> +	nand->dev =3D &pdev->dev;
> +	chip =3D &nand->chip;
> +	mtd =3D nand_to_mtd(chip);
> +	nand_set_controller_data(chip, nand);
> +	nand_set_flash_node(chip, pdev->dev.of_node);
> +
> +	mtd->priv =3D chip;
> +	mtd->owner =3D THIS_MODULE;
> +	mtd->dev.parent =3D &pdev->dev;
> +
> +	nand->clk =3D devm_clk_get(&pdev->dev, "nand_gate");

devm_clk_get_enabled()

> +	if (IS_ERR(nand->clk))
> +		return dev_err_probe(&pdev->dev, PTR_ERR(nand->clk),
> +				     "failed to find nand clock\n");
> +
> +	retval =3D clk_prepare_enable(nand->clk);
> +	if (retval < 0) {
> +		dev_err(&pdev->dev, "failed to enable clock\n");
> +		retval =3D -ENXIO;
> +	}
> +
> +	nand->chip.controller    =3D &nand->controller;
> +
> +	chip->legacy.cmdfunc     =3D ma35_nand_command;
> +	chip->legacy.waitfunc    =3D ma35_waitfunc;
> +	chip->legacy.read_byte   =3D ma35_nand_read_byte;
> +	chip->legacy.select_chip =3D ma35_nand_select_chip;
> +	chip->legacy.read_buf    =3D ma35_read_buf_dma;
> +	chip->legacy.write_buf   =3D ma35_write_buf_dma;
> +	chip->legacy.dev_ready   =3D ma35_nand_devready;
> +	chip->legacy.chip_delay  =3D 25; /* us */

Please convert this driver to ->exec_op().

No introduce of legacy hooks will be accepted.

> +
> +	/* Read OOB data first, then HW read page */
> +	chip->ecc.hwctl      =3D ma35_nand_enable_hwecc;
> +	chip->ecc.calculate  =3D ma35_nand_calculate_ecc;
> +	chip->ecc.correct    =3D ma35_nand_correct_data;
> +	chip->ecc.write_page =3D ma35_nand_write_page_hwecc;
> +	chip->ecc.read_page  =3D ma35_nand_read_page_hwecc_oob_first;
> +	chip->ecc.read_oob   =3D ma35_nand_read_oob_hwecc;
> +	chip->options |=3D (NAND_NO_SUBPAGE_WRITE | NAND_USES_DMA);
> +
> +	ma35_nand_initialize(nand);
> +	platform_set_drvdata(pdev, nand);
> +
> +	nand->controller.ops =3D &ma35_nand_controller_ops;
> +
> +	nand->irq =3D platform_get_irq(pdev, 0);
> +	if (nand->irq < 0)
> +		return dev_err_probe(&pdev->dev, nand->irq,
> +				     "failed to get platform irq\n");
> +
> +	retval =3D devm_request_irq(&pdev->dev, nand->irq, ma35_nand_irq,
> +				  IRQF_TRIGGER_HIGH, "ma35d1-nand", nand);
> +	if (retval) {
> +		dev_err(&pdev->dev, "failed to request NAND irq\n");
> +		clk_disable_unprepare(nand->clk);
> +		return -ENXIO;
> +	}
> +
> +	retval =3D nand_scan(chip, 1);

s/retval/ret/

> +	if (retval)
> +		return retval;
> +
> +	if (mtd_device_register(mtd, nand->parts, nand->nr_parts)) {

ret =3D=20
if (ret)

> +		nand_cleanup(chip);
> +		devm_kfree(&pdev->dev, nand);
> +		return retval;
> +	}
> +
> +	return retval;
> +}
> +
> +static void ma35_nand_remove(struct platform_device *pdev)
> +{
> +	struct ma35_nand_info *nand =3D platform_get_drvdata(pdev);
> +	int ret;
> +
> +	devm_free_irq(&pdev->dev, nand->irq, nand);
> +	ret =3D mtd_device_unregister(nand_to_mtd(&nand->chip));
> +	WARN_ON(ret);
> +	nand_cleanup(&nand->chip);
> +	clk_disable_unprepare(nand->clk);
> +}
> +
> +/* PM Support */
> +#ifdef CONFIG_PM
> +static int ma35_nand_suspend(struct platform_device *pdev, pm_message_t =
pm)
> +{
> +	struct ma35_nand_info *nand =3D platform_get_drvdata(pdev);
> +	unsigned long timeo =3D jiffies + HZ/2;
> +
> +	/* wait DMAC to ready */
> +	while (1) {
> +		if ((readl(nand->regs + MA35_NFI_REG_DMACTL) & DMA_BUSY) =3D=3D 0)
> +			break;
> +		if (time_after(jiffies, timeo))
> +			return -ETIMEDOUT;
> +	}
> +
> +	clk_disable(nand->clk);
> +
> +	return 0;
> +}
> +
> +static int ma35_nand_resume(struct platform_device *pdev)
> +{
> +	struct ma35_nand_info *nand =3D platform_get_drvdata(pdev);
> +
> +	clk_enable(nand->clk);
> +	ma35_nand_hwecc_init(nand);
> +	ma35_nand_dmac_init(nand);
> +
> +	return 0;
> +}
> +
> +#else
> +#define ma35_nand_suspend NULL
> +#define ma35_nand_resume NULL
> +#endif
> +
> +static const struct of_device_id ma35_nfi_of_match[] =3D {
> +	{ .compatible =3D "nuvoton,ma35d1-nand" },
> +	{},
> +};
> +MODULE_DEVICE_TABLE(of, ma35_nfi_of_match);
> +
> +static struct platform_driver ma35_nand_driver =3D {
> +	.driver =3D {
> +		.name =3D "ma35d1-nand",
> +		.of_match_table =3D ma35_nfi_of_match,
> +	},
> +	.probe =3D ma35_nand_probe,
> +	.remove_new =3D ma35_nand_remove,
> +	.suspend =3D ma35_nand_suspend,
> +	.resume =3D ma35_nand_resume,
> +};
> +
> +module_platform_driver(ma35_nand_driver);
> +
> +MODULE_DESCRIPTION("Nuvoton ma35 NAND driver");
> +MODULE_AUTHOR("Hui-Ping Chen <hpchen0nvt@gmail.com>");
> +MODULE_LICENSE("GPL");


Thanks,
Miqu=C3=A8l
