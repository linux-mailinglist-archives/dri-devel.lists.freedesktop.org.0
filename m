Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66EFCBDDC2F
	for <lists+dri-devel@lfdr.de>; Wed, 15 Oct 2025 11:26:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CDAA10E766;
	Wed, 15 Oct 2025 09:26:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="eD/cc83R";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DF4D10E284
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Oct 2025 09:26:00 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 923A362555;
 Wed, 15 Oct 2025 09:25:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D325DC4CEF8;
 Wed, 15 Oct 2025 09:25:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1760520359;
 bh=bvqcJJFOJIybp82L1CiimY/fNVZarwQWHwIox/XMPn8=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=eD/cc83RNv4a6hP1K5ISJjiVUgRWv9jKWFiy4heVxspVrDqZCP4wjBccNd0lX9y3L
 7PWagmjEdACDf4lgtscrjeSxk8bVk0Acfi/hcyWmv6WR3tS3+QJl3vM+eNoxnkQzFH
 5xQopje5OxBiIef5ELHyuJ7u9nDSoMac11OFE0DQ/helhl7PynttpCjbFxxDdpsUgc
 FhnrMK52vtjRI/Ewjuy0lxHJK6/CtUO6SJvqi3bt9Q+mQp4o8OWHND943+sqIkqyRH
 7I62kiTglA3pF5t5QOhvWfTg933g/k0HV/g9nikipXZkA9H7m2T4h728UeKqZXcwYE
 3xG8YZnOyd5wg==
Message-ID: <2a6319e5-15e5-4cb7-a2f3-7521383fc30e@kernel.org>
Date: Wed, 15 Oct 2025 10:25:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] misc: fastrpc: Update dma_mask for CDSP support on
 Kaanapali SoC
To: Kumari Pallavi <kumari.pallavi@oss.qualcomm.com>,
 kpallavi@qti.qualcomm.com, srini@kernel.org, amahesh@qti.qualcomm.com,
 arnd@arndb.de, gregkh@linuxfoundation.org
Cc: quic_bkumar@quicinc.com, ekansh.gupta@oss.qualcomm.com,
 linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 jingyi.wang@oss.qualcomm.com, aiqun.yu@oss.qualcomm.com,
 ktadakam@qti.qualcomm.com
References: <20251015045702.3022060-1-kumari.pallavi@oss.qualcomm.com>
 <20251015045702.3022060-4-kumari.pallavi@oss.qualcomm.com>
Content-Language: en-US
From: Srinivas Kandagatla <srini@kernel.org>
In-Reply-To: <20251015045702.3022060-4-kumari.pallavi@oss.qualcomm.com>
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



On 10/15/25 5:57 AM, Kumari Pallavi wrote:
> DSP currently supports 32-bit IOVA (32-bit PA + 4-bit SID) for
> both Q6 and user DMA (uDMA) access. This is being upgraded to
> 34-bit PA + 4-bit SID due to a hardware revision in CDSP for
> Kaanapali SoC, which expands the DMA addressable range.
> Update DMA mask configuration in the driver to support CDSP on
> Kaanapali SoC. Set the default `dma_mask` to 32-bit and update
> it to 34-bit based on CDSP and SoC-specific compatible string.
> 
> Signed-off-by: Kumari Pallavi <kumari.pallavi@oss.qualcomm.com>
> ---
>  drivers/misc/fastrpc.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> index 1a5d620b23f2..f2e5e53e9067 100644
> --- a/drivers/misc/fastrpc.c
> +++ b/drivers/misc/fastrpc.c
> @@ -267,6 +267,7 @@ struct fastrpc_session_ctx {
>  
>  struct fastrpc_soc_data {
>  	u32 sid_pos;
> +	u32 cdsp_dma_mask;
How about making this an actual dmamask ex:

	u64 cdsp_dma_mask == DMA_BIT_MASK(64),
	u64 dma_mask == DMA_BIT_MASK(32),

This will give more clear picture of what is going on,

BTW, these values are not set in the patch for some reason for both
default and soc specific soc data>
>  struct fastrpc_channel_ctx {
> @@ -2178,6 +2179,7 @@ static int fastrpc_cb_probe(struct platform_device *pdev)
>  	int i, sessions = 0;
>  	unsigned long flags;
>  	int rc;
> +	u32 dma_mask = 32;this should come from default soc_data, do not hardcode this here.
	u64 dma_mask = default_soc_data->dma_mask;>
>  	cctx = dev_get_drvdata(dev->parent);
>  	if (!cctx)
> @@ -2197,6 +2199,9 @@ static int fastrpc_cb_probe(struct platform_device *pdev)
>  	sess->dev = dev;
>  	dev_set_drvdata(dev, sess);> +	if (cctx->domain_id == CDSP_DOMAIN_ID)
> +		dma_mask = cctx->soc_data->cdsp_dma_mask;
> +

>  	if (of_property_read_u32(dev->of_node, "reg", &sess->sid))
>  		dev_info(dev, "FastRPC Session ID not specified in DT\n");
>  
> @@ -2211,9 +2216,9 @@ static int fastrpc_cb_probe(struct platform_device *pdev)
>  		}
>  	}
>  	spin_unlock_irqrestore(&cctx->lock, flags);
> -	rc = dma_set_mask(dev, DMA_BIT_MASK(32));
> +	rc = dma_set_mask(dev, DMA_BIT_MASK(dma_mask));
>  	if (rc) {
> -		dev_err(dev, "32-bit DMA enable failed\n");
> +		dev_err(dev, "%u-bit DMA enable failed\n", dma_mask);
>  		return rc;
>  	}
>  

