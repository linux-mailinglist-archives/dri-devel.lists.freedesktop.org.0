Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44108BB9108
	for <lists+dri-devel@lfdr.de>; Sat, 04 Oct 2025 20:36:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36E3310E23C;
	Sat,  4 Oct 2025 18:36:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Q6FexA7o";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 777C710E23C
 for <dri-devel@lists.freedesktop.org>; Sat,  4 Oct 2025 18:36:26 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 906AE60193;
 Sat,  4 Oct 2025 18:36:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D0D1C4CEF1;
 Sat,  4 Oct 2025 18:36:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1759602985;
 bh=xuFxxT3Xf9Ae9zNzJIfLsMGbHQLQmEnZm54x5U7nYO0=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Q6FexA7o8CEdDVeSTQY8IlJaNPgHu5gO4X5GnCtqDj9MymQLAdXlchKSd8H+pgyJQ
 NDjCWvXQMDVZg5rwqYqkvvaVBHJP6UD/pRqRPwKbvVsi89pyH0lecnDmBrwJHkBQxJ
 5wedxKBDVIY4it9TOT/C1fiuOjKaU/OmJS/yQ9SZf/SifPulbI+7ptENHlZTREl8ad
 LNyXqQvOGeB5VoFa8raezwq+CGPuOWhLZzUauKiTZD3EgzJFiA3XNDgljZsPe3KiuY
 q3OjqxsolQFsb7X0uaX8AM5C/WYA0BNuQ2okXyoCvKnPDgQ+Ml8jHGCxoxSgFiINj9
 mK/2SZgI3Y7ZA==
Message-ID: <7b281f10-f42c-454b-9c4d-96ea4f66c66f@kernel.org>
Date: Sat, 4 Oct 2025 19:36:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] misc: fastrpc: Update dma_mask for CDSP support on
 Kaanapali SoC
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
 Srinivas Kandagatla <srini@kernel.org>,
 Amol Maheshwari <amahesh@qti.qualcomm.com>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
 trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 Kumari Pallavi <kumari.pallavi@oss.qualcomm.com>
References: <20250924-knp-fastrpc-v1-0-4b40f8bfce1d@oss.qualcomm.com>
 <20250924-knp-fastrpc-v1-2-4b40f8bfce1d@oss.qualcomm.com>
Content-Language: en-US
From: Srinivas Kandagatla <srini@kernel.org>
In-Reply-To: <20250924-knp-fastrpc-v1-2-4b40f8bfce1d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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



On 9/25/25 12:46 AM, Jingyi Wang wrote:
> From: Kumari Pallavi <kumari.pallavi@oss.qualcomm.com>
> 
> DSP currently supports 32-bit IOVA (32-bit PA + 4-bit SID) for
> both Q6 and user DMA (uDMA) access. This is being upgraded to
> 34-bit PA + 4-bit SID due to a hardware revision in CDSP for
> Kaanapali SoC, which expands the DMA addressable range.
> Update DMA mask configuration in the driver to support CDSP on
> Kaanapali SoC. Set the default `dma_mask` to 32-bit and update
> it to 34-bit based on CDSP and SoC-specific compatible string.
> 
> Signed-off-by: Kumari Pallavi <kumari.pallavi@oss.qualcomm.com>
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> ---
>  drivers/misc/fastrpc.c | 14 ++++++++++----
>  1 file changed, 10 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> index db396241b8ce..e019163eb265 100644
> --- a/drivers/misc/fastrpc.c
> +++ b/drivers/misc/fastrpc.c
> @@ -275,6 +275,7 @@ struct fastrpc_session_ctx {
>  	bool used;
>  	bool valid;
>  	u32 sid_pos;
> +	u32 pa_bits;
same comments as in patch 1 move to channel ctx, also why do we even
need this  to be stored in the first place as dma mask is set in
probe,we will not need it after wards.
>  };
>  
>  struct fastrpc_channel_ctx {
> @@ -2179,9 +2180,9 @@ static int fastrpc_cb_probe(struct platform_device *pdev)
>  	sess->used = false;
>  	sess->valid = true;
>  	sess->dev = dev;
> +	sess->pa_bits = cctx->dma_mask;

>  	/* Configure where sid will be prepended to pa */
> -	sess->sid_pos =
> -		(cctx->iova_format ? SID_POS_IN_IOVA : DSP_DEFAULT_BUS_WIDTH);
> +	sess->sid_pos = (cctx->iova_format ? SID_POS_IN_IOVA : sess->pa_bits);
>  
>  	if (of_property_read_u32(dev->of_node, "reg", &sess->sid))
>  		dev_info(dev, "FastRPC Session ID not specified in DT\n");
> @@ -2198,9 +2199,9 @@ static int fastrpc_cb_probe(struct platform_device *pdev)
>  		}
>  	}
>  	spin_unlock_irqrestore(&cctx->lock, flags);
> -	rc = dma_set_mask(dev, DMA_BIT_MASK(32));
> +	rc = dma_set_mask(dev, DMA_BIT_MASK(sess->pa_bits));
>  	if (rc) {
> -		dev_err(dev, "32-bit DMA enable failed\n");
> +		dev_err(dev, "%u-bit DMA enable failed\n", sess->pa_bits);
>  		return rc;
>  	}
>  
> @@ -2287,10 +2288,12 @@ static int fastrpc_get_domain_id(const char *domain)
>  
>  struct fastrpc_soc_data {
>  	u32 dsp_iova_format;
> +	u32 cdsp_dma_mask;
>  };
>  
>  static const struct fastrpc_soc_data kaanapali_soc_data = {
>  	.dsp_iova_format = 1,
> +	.cdsp_dma_mask = 34,
>  };
>  
>  static const struct of_device_id qcom_soc_match_table[] = {
> @@ -2310,6 +2313,7 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
>  	const struct of_device_id *match;
>  	const struct fastrpc_soc_data *soc_data = NULL;
>  	u32 iova_format = 0;
> +	u32 ubs = DSP_DEFAULT_BUS_WIDTH;
>  
>  	root = of_find_node_by_path("/");
>  	if (!root)
> @@ -2322,6 +2326,7 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
>  	} else {
>  		soc_data = match->data;
>  		iova_format = soc_data->dsp_iova_format;
> +		ubs = soc_data->cdsp_dma_mask;
>  	}
>  
>  	err = of_property_read_string(rdev->of_node, "label", &domain);
> @@ -2404,6 +2409,7 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
>  	}
>  	/* determine where sid needs to be prepended to pa based on iova_format */
>  	data->iova_format = iova_format;
> +	data->dma_mask = (domain_id == CDSP_DOMAIN_ID ? ubs : DSP_DEFAULT_BUS_WIDTH);

set the default of 32 and move this inside switch case where we have
domain id checks.


>  	kref_init(&data->refcount);
>  
>  	dev_set_drvdata(&rpdev->dev, data);
> 

