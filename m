Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6674972479
	for <lists+dri-devel@lfdr.de>; Mon,  9 Sep 2024 23:23:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00C6710E6C8;
	Mon,  9 Sep 2024 21:22:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="LJsGXwku";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B019E10E6C8
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Sep 2024 21:22:57 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id E4F7DA43E1E;
 Mon,  9 Sep 2024 21:22:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 572A0C4CECC;
 Mon,  9 Sep 2024 21:22:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1725916976;
 bh=DHoBHitf6XqutCBUKBaXtWsNw566Wkx2sWsCIpIA5kg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LJsGXwkujv9FcaUCCoYZ1vb9KTSfWqsJj5ePQ1LmXJQcHAWA3W79P2JrqFeV2s/jv
 zNpo7fEkKTXdoeSE8pIwdUfkTDHUyGup96gAcEv8vcsFbzEJEdgJXB1bNHnHAoIdba
 79vNjt/214TimJH42afhMYFVIvEzsLuYsCmn5ovpua0UPfyX77+b8QBUGPNn+lqQiE
 UHgwigS7Ul8uJCa39r5p86jkELBsywN76Cy37sEQvhooGcOXXZRtIvp3UNN13g7MyK
 PGxRHlybeKE/Q2FRal8JAYjGqygbYThYS6i8M/3QPrO+dtYYbNnxt0UWDVzbTitAB3
 PwgfqJ860nxiw==
Date: Mon, 9 Sep 2024 23:22:51 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Carlos Song <carlos.song@nxp.com>
Cc: aisheng.dong@nxp.com, shawnguo@kernel.org, s.hauer@pengutronix.de, 
 kernel@pengutronix.de, festevam@gmail.com, sumit.semwal@linaro.org, 
 christian.koenig@amd.com, linux-i2c@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 Frank Li <frank.li@nxp.com>
Subject: Re: [PATCH V4] i2c: imx-lpi2c: add eDMA mode support for LPI2C
Message-ID: <7czathanmppyyw5bbno6gmsfqtn75py33lccyfu6klreh74n6o@d6347uzrxwj4>
References: <20240829093157.2714736-1-carlos.song@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240829093157.2714736-1-carlos.song@nxp.com>
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

Hi Carlos,

Thanks for your patch, sorry for having taken so much time, looks
good, just some nitpicks.

...

> diff --git a/drivers/i2c/busses/i2c-imx-lpi2c.c b/drivers/i2c/busses/i2c-imx-lpi2c.c
> index 976d43f73f38..530ca5d76403 100644
> --- a/drivers/i2c/busses/i2c-imx-lpi2c.c
> +++ b/drivers/i2c/busses/i2c-imx-lpi2c.c
> @@ -8,6 +8,8 @@
>  #include <linux/clk.h>
>  #include <linux/completion.h>
>  #include <linux/delay.h>
> +#include <linux/dmaengine.h>
> +#include <linux/dma-mapping.h>

please sort in alphabetical order

>  #include <linux/err.h>
>  #include <linux/errno.h>
>  #include <linux/i2c.h>

...

> +struct lpi2c_imx_dma {
> +	bool			using_pio_mode;
> +	u8			rx_cmd_buf_len;
> +	u8			*dma_buf;
> +	u16			*rx_cmd_buf;
> +	unsigned int	dma_len;
> +	unsigned int	tx_burst_num;
> +	unsigned int	rx_burst_num;
> +	unsigned long	dma_msg_flag;
> +	resource_size_t		phy_addr;
> +	dma_addr_t		dma_tx_addr;
> +	dma_addr_t		dma_addr;
> +	enum dma_data_direction dma_direction;
> +	struct dma_chan		*chan_tx;
> +	struct dma_chan		*chan_rx;
> +};

The alignment here is a bit off

...

> +static bool is_use_dma(struct lpi2c_imx_struct *lpi2c_imx, struct i2c_msg *msg)
> +{
> +	if (!lpi2c_imx->can_use_dma)
> +		return false;
> +
> +	/*
> +	 * When the length of data is less than I2C_DMA_THRESHOLD,
> +	 * cpu mode is used directly to avoid low performance.
> +	 */
> +	if (msg->len < I2C_DMA_THRESHOLD)
> +		return false;
> +
> +	return true;

You could do

	return !(msg->len < I2C_DMA_THRESHOLD);

Just a matter of taste, your choice.

> +}
> +
> +static int lpi2c_imx_pio_xfer(struct lpi2c_imx_struct *lpi2c_imx,
> +				 struct i2c_msg *msg)
> +{
> +	int ret;
> +
> +	reinit_completion(&lpi2c_imx->complete);
> +
> +	if (msg->flags & I2C_M_RD)
> +		lpi2c_imx_read(lpi2c_imx, msg);
> +	else
> +		lpi2c_imx_write(lpi2c_imx, msg);
> +
> +	ret = lpi2c_imx_pio_msg_complete(lpi2c_imx);
> +	if (ret)
> +		return ret;
> +
> +	return 0;

You could do

	return lpi2c_imx_pio_msg_complete(lpi2c_imx);

Purely taste, your choice, still.

> +}

...

> +static void lpi2c_cleanup_rx_cmd_dma(struct lpi2c_imx_dma *dma)
> +{
> +	dmaengine_terminate_sync(dma->chan_tx);
> +	dma_unmap_single(dma->chan_tx->device->dev, dma->dma_tx_addr,
> +				dma->rx_cmd_buf_len, DMA_TO_DEVICE);

alignment

> +}

...

> +static int lpi2c_dma_rx_cmd_submit(struct lpi2c_imx_struct *lpi2c_imx)
> +{
> +	struct lpi2c_imx_dma *dma = lpi2c_imx->dma;
> +	struct dma_chan *txchan = dma->chan_tx;
> +	struct dma_async_tx_descriptor *rx_cmd_desc;
> +	dma_cookie_t cookie;
> +
> +	dma->dma_tx_addr = dma_map_single(txchan->device->dev,
> +						 dma->rx_cmd_buf,
> +						 dma->rx_cmd_buf_len, DMA_TO_DEVICE);
> +	if (dma_mapping_error(txchan->device->dev, dma->dma_tx_addr)) {
> +		dev_err(&lpi2c_imx->adapter.dev, "dma map failed, use pio\n");

/dma/DMA/ and it's valid for every time you have used "dma".

> +		return -EINVAL;
> +	}
> +
> +	rx_cmd_desc = dmaengine_prep_slave_single(txchan, dma->dma_tx_addr,
> +				 dma->rx_cmd_buf_len, DMA_MEM_TO_DEV,
> +				 DMA_PREP_INTERRUPT | DMA_CTRL_ACK);

alignment.

> +	if (!rx_cmd_desc) {
> +		dma_unmap_single(txchan->device->dev, dma->dma_tx_addr,
> +				 dma->rx_cmd_buf_len, DMA_TO_DEVICE);

put dma_unmap_single() in a goto exit path.

> +		dev_err(&lpi2c_imx->adapter.dev, "dma prep slave sg failed, use pio\n");
> +		return -EINVAL;
> +	}
> +
> +	cookie = dmaengine_submit(rx_cmd_desc);
> +	if (dma_submit_error(cookie)) {
> +		dma_unmap_single(txchan->device->dev, dma->dma_tx_addr,
> +				 dma->rx_cmd_buf_len, DMA_TO_DEVICE);
> +		dmaengine_desc_free(rx_cmd_desc);
> +		dev_err(&lpi2c_imx->adapter.dev, "submitting dma failed, use pio\n");
> +		return -EINVAL;
> +	}
> +
> +	dma_async_issue_pending(txchan);
> +
> +	return 0;
> +}
> +
> +static int lpi2c_dma_submit(struct lpi2c_imx_struct *lpi2c_imx)
> +{
> +	struct lpi2c_imx_dma *dma = lpi2c_imx->dma;
> +	bool read = dma->dma_msg_flag & I2C_M_RD;
> +	enum dma_data_direction dir = read ? DMA_FROM_DEVICE : DMA_TO_DEVICE;
> +	struct dma_chan *chan = read ? dma->chan_rx : dma->chan_tx;

I generally prefer the assignment to be done after the
declaration. It looks more clear.

> +	struct dma_async_tx_descriptor *desc;
> +	dma_cookie_t cookie;
> +
> +	dma->dma_direction = dir;
> +	dma->dma_addr = dma_map_single(chan->device->dev,
> +					     dma->dma_buf,
> +					     dma->dma_len, dir);

alignment is off.

> +	if (dma_mapping_error(chan->device->dev, dma->dma_addr)) {
> +		dev_err(&lpi2c_imx->adapter.dev, "dma map failed, use pio\n");

/dma/DMA/

> +		return -EINVAL;
> +	}
> +
> +	desc = dmaengine_prep_slave_single(chan, dma->dma_addr,
> +					 dma->dma_len, read ?
> +					 DMA_DEV_TO_MEM : DMA_MEM_TO_DEV,
> +					 DMA_PREP_INTERRUPT | DMA_CTRL_ACK);

alignment off.

> +	if (!desc) {
> +		dev_err(&lpi2c_imx->adapter.dev, "dma prep slave sg failed, use pio\n");
> +		lpi2c_dma_unmap(dma);

put lpi2c_dma_unmape under a goto exit path.

> +		return -EINVAL;
> +	}
> +
> +	reinit_completion(&lpi2c_imx->complete);
> +	desc->callback = lpi2c_dma_callback;
> +	desc->callback_param = (void *)lpi2c_imx;

the cast is not needed.

> +	cookie = dmaengine_submit(desc);
> +	if (dma_submit_error(cookie)) {
> +		dev_err(&lpi2c_imx->adapter.dev, "submitting dma failed, use pio\n");
> +		lpi2c_dma_unmap(dma);
> +		dmaengine_desc_free(desc);
> +		return -EINVAL;
> +	}
> +
> +	/* Can't switch to PIO mode when DMA have started transfer */
> +	dma->using_pio_mode = false;
> +
> +	dma_async_issue_pending(chan);
> +
> +	return 0;
> +}
> +
> +static int lpi2c_imx_find_max_burst_num(unsigned int fifosize, unsigned int len)
> +{
> +	unsigned int i;
> +
> +	for (i = fifosize / 2; i > 0; i--) {
> +		if (!(len % i))
> +			break;
> +	}

braces are not needed

> +
> +	return i;
> +}
> +
> +/*
> + * For a highest DMA efficiency, tx/rx burst number should be calculated according
> + * to the FIFO depth.
> + */
> +static void lpi2c_imx_dma_burst_num_calculate(struct lpi2c_imx_struct *lpi2c_imx)
> +{
> +	struct lpi2c_imx_dma *dma = lpi2c_imx->dma;
> +	unsigned int cmd_num;
> +
> +	if (dma->dma_msg_flag & I2C_M_RD) {
> +		/*
> +		 * One RX cmd word can trigger DMA receive no more than 256 bytes.
> +		 * The number of RX cmd words should be calculated based on the data
> +		 * length.
> +		 */
> +		cmd_num = DIV_ROUND_UP(dma->dma_len, CHUNK_DATA);
> +		dma->tx_burst_num = lpi2c_imx_find_max_burst_num(lpi2c_imx->txfifosize,
> +				 cmd_num);
> +		dma->rx_burst_num = lpi2c_imx_find_max_burst_num(lpi2c_imx->rxfifosize,
> +				 dma->dma_len);
> +	} else {
> +		dma->tx_burst_num = lpi2c_imx_find_max_burst_num(lpi2c_imx->txfifosize,
> +				 dma->dma_len);

Alignment is off.

> +	}
> +}

...

> +/*
> + * When lpi2c in TX DMA mode we can use one DMA TX channel to write

/in/is in/

> + * data word into TXFIFO, but in RX DMA mode it is different.
> + *
> + * LPI2C MTDR register is a command data and transmit data register.

/LPI2C/The LPI2C/

> + * Bit 8-10 is command data field and Bit 0-7 is transmit data field.

/Bit 8-10 is/Bits 8-10 are the/
/Bit 0-7 is/ Bits 0-7 are the/

> + * When the LPI2C master needs to read data, the data number to read

/data number/number of bytes/

> + * should be set in transmit data field and RECV_DATA should be set
> + * into the command data field to receive (DATA[7:0] + 1) bytes. The
> + * recv data command word is made of RECV_DATA in command data field

/in command/in the command/

> + * and the data number to read in transmit data field. When the length

/data number/number of bytes/

> + * of data that needs to be read exceeds 256 bytes, recv data command

/data that needs to be read/data to be read/

> + * word needs to be written to TXFIFO multiple times.
> + *
> + * So when in RX DMA mode, the TX channel also needs to be configured
> + * additionally to send RX command words and the RX command word need

/additionally//
/need/must/

> + * be set in advance before transmitting.
> + */
> +static int lpi2c_imx_dma_xfer(struct lpi2c_imx_struct *lpi2c_imx,
> +			 struct i2c_msg *msg)

The alignemnt here is off (did you run checkpatch.pl?)

> +{
> +	struct lpi2c_imx_dma *dma = lpi2c_imx->dma;
> +	int ret;
> +
> +	/* When DMA mode failed before transferring, CPU mode can be used. */

/failed/fails/

> +	dma->using_pio_mode = true;
> +
> +	dma->dma_len = msg->len;
> +	dma->dma_msg_flag = msg->flags;
> +	dma->dma_buf = i2c_get_dma_safe_msg_buf(msg, I2C_DMA_THRESHOLD);
> +	if (!dma->dma_buf)
> +		return -ENOMEM;
> +
> +	ret = lpi2c_dma_config(lpi2c_imx);
> +	if (ret) {
> +		dev_err(&lpi2c_imx->adapter.dev, "DMA Config Fail, error %d\n", ret);

Please rephrase as:

	... "Failed to configure DMA (%d)\n", ret);

> +		goto disable_dma;
> +	}
> +
> +	lpi2c_dma_enable(lpi2c_imx);
> +
> +	ret = lpi2c_dma_submit(lpi2c_imx);
> +	if (ret) {
> +		dev_err(&lpi2c_imx->adapter.dev, "DMA submit Fail, error %d\n", ret);

Please rephrase as:

	... "DMA submission failed (%d)\n", ret);

> +		goto disable_dma;
> +	}
> +
> +	if (dma->dma_msg_flag & I2C_M_RD) {
> +		ret = lpi2c_imx_alloc_rx_cmd_buf(lpi2c_imx);
> +		if (ret) {
> +			lpi2c_cleanup_dma(dma);
> +			goto disable_dma;
> +		}
> +
> +		ret = lpi2c_dma_rx_cmd_submit(lpi2c_imx);
> +		if (ret) {
> +			lpi2c_cleanup_dma(dma);
> +			goto disable_dma;
> +		}
> +	}
> +
> +	ret = lpi2c_imx_dma_msg_complete(lpi2c_imx);
> +	if (ret) {
> +		if (dma->dma_msg_flag & I2C_M_RD)
> +			lpi2c_cleanup_rx_cmd_dma(dma);
> +		lpi2c_cleanup_dma(dma);
> +		goto disable_dma;
> +	}
> +
> +	/* When meet NACK in transfer, cleanup all DMA transfer */

Please rephrase as:

/* When encountering NACK in transfer, clean up all DMA transfers */

> +	if ((readl(lpi2c_imx->base + LPI2C_MSR) & MSR_NDF) && !ret) {
> +		if (dma->dma_msg_flag & I2C_M_RD)
> +			lpi2c_cleanup_rx_cmd_dma(dma);
> +		lpi2c_cleanup_dma(dma);
> +		ret = -EIO;
> +		goto disable_dma;
> +	}
> +
> +	if (dma->dma_msg_flag & I2C_M_RD)
> +		dma_unmap_single(dma->chan_tx->device->dev, dma->dma_tx_addr,
> +					 dma->rx_cmd_buf_len, DMA_TO_DEVICE);
> +	lpi2c_dma_unmap(dma);
> +

you could add here:

disable_cleanup_dma:
	lpi2c_cleanup_dma(dma);

and goto here instead of calling lpi2c_cleanup_dma(dma) at each
phase.

> +disable_dma:
> +	/* Disable I2C DMA function */
> +	writel(0, lpi2c_imx->base + LPI2C_MDER);
> +
> +	if (dma->dma_msg_flag & I2C_M_RD)
> +		kfree(dma->rx_cmd_buf);
> +
> +	if (ret)
> +		i2c_put_dma_safe_msg_buf(dma->dma_buf, msg, false);
> +	else
> +		i2c_put_dma_safe_msg_buf(dma->dma_buf, msg, true);

I could leave a blank line here to put some space between
if...else and return.

> +	return ret;
> +}

...

Thanks,
Andi
