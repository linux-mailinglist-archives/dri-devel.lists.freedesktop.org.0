Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79F229C4DF4
	for <lists+dri-devel@lfdr.de>; Tue, 12 Nov 2024 05:56:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DFA010E0EB;
	Tue, 12 Nov 2024 04:56:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ibzlx+tH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A64ED10E0EB
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Nov 2024 04:56:07 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 40832A4067E;
 Tue, 12 Nov 2024 04:54:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 274B5C4CED0;
 Tue, 12 Nov 2024 04:56:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1731387366;
 bh=eCqCDcQt/nQo3meiWpf5P/Pt2SsWcJDk0rvn/UadRMo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ibzlx+tHh0YAOKeujomViYVQeCGIUvwaZmp837kCkZPXzpBQxtdkS6874Xp9EWKOH
 BbhtEocpR4Im2gFG5WfjWcjELUv6X7fAUhleTSZvdrgNDPEvVTXn+TP5U49c1AQgPE
 FwfIztAvX8oQD5baFeK5S9A1OrcUTHg8ZGhMe8592VVXV24ydz43ciSM9u0Ba0VrFD
 VtjGFmXdjAGnaALVWmohV59X2JIhsZlu8NI3nHWy6jBuMcJs1UaEBlUa/flxMVxeob
 ieKpy8szG6zemhgDMtMh/ni4jYStYmX055zkjdXL/BRYeuYE2DMBcNtlZLaDUea+eA
 ntXHXyevF3+Ew==
Date: Mon, 11 Nov 2024 22:56:03 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Jyothi Kumar Seerapu <quic_jseerapu@quicinc.com>
Cc: Vinod Koul <vkoul@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, 
 Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, 
 linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-kernel@vger.kernel.org, 
 linux-i2c@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 linaro-mm-sig@lists.linaro.org, quic_msavaliy@quicinc.com,
 quic_vtanuku@quicinc.com
Subject: Re: [PATCH v2 RESEND 1/3] dmaengine: qcom: gpi: Add GPI Block event
 interrupt support
Message-ID: <dpbultuqz3xjwchhlghzg7ih7v2zal2rzumdpgblx66h3ynhal@ypd75s7x73ie>
References: <20241111140244.13474-1-quic_jseerapu@quicinc.com>
 <20241111140244.13474-2-quic_jseerapu@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241111140244.13474-2-quic_jseerapu@quicinc.com>
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

On Mon, Nov 11, 2024 at 07:32:42PM +0530, Jyothi Kumar Seerapu wrote:
> GSI hardware generates an interrupt for each transfer completion.
> For multiple messages within a single transfer, this results
> in receiving N interrupts for N messages, which can introduce
> significant software interrupt latency.

Here's an excellent opportunity for splitting your problem description
and solution description in two easy to read paragraphs by adding some
newlines.

> To mitigate this latency,
> utilize Block Event Interrupt (BEI) only when an interrupt is necessary.
> When using BEI, consider splitting a single multi-message transfer into
> chunks of 8. This approach can enhance overall transfer time and

The reason for the number 8 must be documented.

"This approach..." wouldn't hurt from having it's own paragraph once
again.

> efficiency.
> 
> Signed-off-by: Jyothi Kumar Seerapu <quic_jseerapu@quicinc.com>
> ---
> 
> v1 -> v2: 
>    - Changed dma_addr type from array of pointers to array.
>    - To support BEI functionality with the TRE size of 64 defined in GPI driver,
>      updated QCOM_GPI_MAX_NUM_MSGS to 16 and NUM_MSGS_PER_IRQ to 8.
>  
>  drivers/dma/qcom/gpi.c           | 49 ++++++++++++++++++++++++++++++++
>  include/linux/dma/qcom-gpi-dma.h | 37 ++++++++++++++++++++++++
>  2 files changed, 86 insertions(+)
> 
> diff --git a/drivers/dma/qcom/gpi.c b/drivers/dma/qcom/gpi.c
> index 52a7c8f2498f..a98de3178764 100644
> --- a/drivers/dma/qcom/gpi.c
> +++ b/drivers/dma/qcom/gpi.c
> @@ -1693,6 +1693,9 @@ static int gpi_create_i2c_tre(struct gchan *chan, struct gpi_desc *desc,
>  
>  		tre->dword[3] = u32_encode_bits(TRE_TYPE_DMA, TRE_FLAGS_TYPE);
>  		tre->dword[3] |= u32_encode_bits(1, TRE_FLAGS_IEOT);
> +
> +		if (i2c->flags & QCOM_GPI_BLOCK_EVENT_IRQ)
> +			tre->dword[3] |= u32_encode_bits(1, TRE_FLAGS_BEI);
>  	}
>  
>  	for (i = 0; i < tre_idx; i++)
> @@ -2098,6 +2101,52 @@ static int gpi_find_avail_gpii(struct gpi_dev *gpi_dev, u32 seid)
>  	return -EIO;
>  }
>  
> +/**
> + * gpi_multi_desc_process() - Process received transfers from GSI HW
> + * @dev: pointer to the corresponding dev node
> + * @multi_xfer: pointer to the gpi_multi_xfer
> + * @num_xfers: total number of transfers
> + * @transfer_timeout_msecs: transfer timeout value
> + * @transfer_comp: completion object of the transfer
> + *
> + * This function is used to process the received transfers based on the
> + * completion events

As far as I can tell it doesn't "process" anything. All it does is
reinit the completion (n + 7) / 8 times, and for the first n / 8
iterations it will wait for an externally defined completion.

Why is this function even defined here, it solely operates on parameters
coming from the I2C driver?

> + *
> + * Return: On success returns 0, otherwise return error code
> + */
> +int gpi_multi_desc_process(struct device *dev, struct gpi_multi_xfer *multi_xfer,
> +			   u32 num_xfers, u32 transfer_timeout_msecs,
> +			   struct completion *transfer_comp)
> +{
> +	int i;
> +	u32 max_irq_cnt, time_left;
> +
> +	max_irq_cnt = num_xfers / NUM_MSGS_PER_IRQ;
> +	if (num_xfers % NUM_MSGS_PER_IRQ)
> +		max_irq_cnt++;
> +
> +	/*
> +	 * Wait for the interrupts of the processed transfers in multiple
> +	 * of 64 and for the last transfer. If the hardware is fast and

I'm confused, where does this 64 come from?

> +	 * already processed all the transfers then no need to wait.
> +	 */
> +	for (i = 0; i < max_irq_cnt; i++) {
> +		reinit_completion(transfer_comp);

I'm trying to convince myself that this isn't racey, but the split
ownership of updating and checking multi_xfer->irq_cnt between the GPI
and I2C drivers is just too hard for me to follow.

> +		if (max_irq_cnt != multi_xfer->irq_cnt) {
> +			time_left = wait_for_completion_timeout(transfer_comp,
> +								transfer_timeout_msecs);
> +			if (!time_left) {
> +				dev_err(dev, "%s: Transfer timeout\n", __func__);
> +				return -ETIMEDOUT;
> +			}
> +		}
> +		if (num_xfers > multi_xfer->msg_idx_cnt)
> +			return 0;
> +	}
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(gpi_multi_desc_process);

The dmaengine framework is expected to provide an abstraction between
clients and DMA engines, so this doesn't look right.

> +
>  /* gpi_of_dma_xlate: open client requested channel */
>  static struct dma_chan *gpi_of_dma_xlate(struct of_phandle_args *args,
>  					 struct of_dma *of_dma)
> diff --git a/include/linux/dma/qcom-gpi-dma.h b/include/linux/dma/qcom-gpi-dma.h
> index 6680dd1a43c6..1341ff0db808 100644
> --- a/include/linux/dma/qcom-gpi-dma.h
> +++ b/include/linux/dma/qcom-gpi-dma.h
> @@ -15,6 +15,12 @@ enum spi_transfer_cmd {
>  	SPI_DUPLEX,
>  };
>  
> +#define QCOM_GPI_BLOCK_EVENT_IRQ	BIT(0)
> +
> +#define QCOM_GPI_MAX_NUM_MSGS		16
> +#define NUM_MSGS_PER_IRQ		8
> +#define MIN_NUM_OF_MSGS_MULTI_DESC	4

Prefixing these QCOM_GPI_ seems like an excellent idea. Still puzzled
about the numbers 8 and 4 though, are they universal for all variants of
GPI or are they just arbitrary numbers picked by experimentation?

> +
>  /**
>   * struct gpi_spi_config - spi config for peripheral
>   *
> @@ -51,6 +57,29 @@ enum i2c_op {
>  	I2C_READ,
>  };
>  
> +/**
> + * struct gpi_multi_xfer - Used for multi transfer support
> + *
> + * @msg_idx_cnt: message index for the transfer
> + * @buf_idx: dma buffer index
> + * @unmap_msg_cnt: unampped transfer index

s/unampped/unmapped

> + * @freed_msg_cnt: freed transfer index
> + * @irq_cnt: received interrupt count
> + * @irq_msg_cnt: transfer message count for the received irqs
> + * @dma_buf: virtual address of the buffer
> + * @dma_addr: dma address of the buffer

"the buffer"? There's up to 16 of them...


As mentioned above, I'm skeptical about this custom API - but if we
were to go this route, the exact responsibilities and semantics should
be documented.

Regards,
Bjorn

> + */
> +struct gpi_multi_xfer {
> +	u32 msg_idx_cnt;
> +	u32 buf_idx;
> +	u32 unmap_msg_cnt;
> +	u32 freed_msg_cnt;
> +	u32 irq_cnt;
> +	u32 irq_msg_cnt;
> +	void *dma_buf[QCOM_GPI_MAX_NUM_MSGS];
> +	dma_addr_t dma_addr[QCOM_GPI_MAX_NUM_MSGS];
> +};
> +
>  /**
>   * struct gpi_i2c_config - i2c config for peripheral
>   *
> @@ -65,6 +94,8 @@ enum i2c_op {
>   * @rx_len: receive length for buffer
>   * @op: i2c cmd
>   * @muli-msg: is part of multi i2c r-w msgs
> + * @flags: true for block event interrupt support
> + * @multi_xfer: indicates transfer has multi messages
>   */
>  struct gpi_i2c_config {
>  	u8 set_config;
> @@ -78,6 +109,12 @@ struct gpi_i2c_config {
>  	u32 rx_len;
>  	enum i2c_op op;
>  	bool multi_msg;
> +	u8 flags;
> +	struct gpi_multi_xfer multi_xfer;
>  };
>  
> +int gpi_multi_desc_process(struct device *dev, struct gpi_multi_xfer *multi_xfer,
> +			   u32 num_xfers, u32 tranfer_timeout_msecs,
> +			   struct completion *transfer_comp);
> +
>  #endif /* QCOM_GPI_DMA_H */
> -- 
> 2.17.1
> 
> 
