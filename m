Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 402C5BB90F3
	for <lists+dri-devel@lfdr.de>; Sat, 04 Oct 2025 20:25:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33B4989262;
	Sat,  4 Oct 2025 18:25:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="na/UNnPO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 715D489262
 for <dri-devel@lists.freedesktop.org>; Sat,  4 Oct 2025 18:25:36 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 5ED7E60193;
 Sat,  4 Oct 2025 18:25:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3D28C4CEF1;
 Sat,  4 Oct 2025 18:25:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1759602335;
 bh=dvoX9+/2ZkKZ6bUEKpbpRMnripCzPtEITdrIX91WpRQ=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=na/UNnPOaMdb4+MNBX4qFX/QhYMGkNkbkvd9PXulEzA/7N0I187bZfxz0iRHf+4Mr
 bD+EMn7Q6MY//0lnvu+jIC30xiA4j6cwO7OAQQnHWyRgqNEQDDfni09Cm1v6NWBhyR
 sl8U+TWAFZJO62OYR2rfuJ27dFjxzR9oBul26Xux0RK36mONeIZaJYOtM6EUquGNZ5
 xLrZ9JzclC2C8cIs3ZY6FdLzGbmgj1Sf42oOHbyNCYJFCFsRyBNJPMrn3yj/Lnoznj
 8FDeYob/m5eE/NxGCLj9zACLxb7ylIEeAfQqKZDbOvkWSb23/2MEfvTs6mYO2ab0YT
 PYvMljsu9lqgA==
Message-ID: <a36555b9-b2b4-41a3-bbf1-58701b9f4b1a@kernel.org>
Date: Sat, 4 Oct 2025 19:25:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] misc: fastrpc: Add support for new DSP IOVA formatting
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
 <20250924-knp-fastrpc-v1-1-4b40f8bfce1d@oss.qualcomm.com>
Content-Language: en-US
From: Srinivas Kandagatla <srini@kernel.org>
In-Reply-To: <20250924-knp-fastrpc-v1-1-4b40f8bfce1d@oss.qualcomm.com>
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
> Implement the new IOVA formatting required by the DSP architecture change
> on Kaanapali SoC. Place the SID for DSP DMA transactions at bit 56 in the
> physical address. This placement is necessary for the DSPs to correctly
> identify streams and operate as intended.
> To address this, add an iova-format flag which determines the SID position
> within the physical address. Set SID position to bit 56 when iova_format
> is enabled; otherwise, default to legacy 32-bit placement.
> Initialize the flag to 0 and update to 1 based on SoC-specific compatible
> string from the root node.
> This change ensures consistent SID placement across DSPs.
> 
> Signed-off-by: Kumari Pallavi <kumari.pallavi@oss.qualcomm.com>
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> ---
>  drivers/misc/fastrpc.c | 76 ++++++++++++++++++++++++++++++++++++++++++++------
>  1 file changed, 68 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> index 8e1d97873423..db396241b8ce 100644
> --- a/drivers/misc/fastrpc.c
> +++ b/drivers/misc/fastrpc.c
> @@ -33,7 +33,6 @@
>  #define FASTRPC_ALIGN		128
>  #define FASTRPC_MAX_FDLIST	16
>  #define FASTRPC_MAX_CRCLIST	64
> -#define FASTRPC_PHYS(p)	((p) & 0xffffffff)
>  #define FASTRPC_CTX_MAX (256)
>  #define FASTRPC_INIT_HANDLE	1
>  #define FASTRPC_DSP_UTILITIES_HANDLE	2
> @@ -105,6 +104,26 @@
>  
>  #define miscdev_to_fdevice(d) container_of(d, struct fastrpc_device, miscdev)
>  
> +/*
> + * By default, the sid will be prepended adjacent to smmu pa before sending
> + * to DSP. But if the compatible Soc found at root node specifies the new
> + * addressing format to handle pa's of longer widths, then the sid will be
> + * prepended at the position specified in this macro.
> + */
> +#define SID_POS_IN_IOVA 56
> +
> +/* Default width of pa bus from dsp */
> +#define DSP_DEFAULT_BUS_WIDTH 32
I dont see any point in defining these both here, this should be part of
the fastrpc_soc_data and a fallback fastrpc_soc_data.

> +
> +/* Extract smmu pa from consolidated iova */
> +#define IOVA_TO_PHYS(iova, sid_pos) (iova & ((1ULL << sid_pos) - 1ULL))
> +
> +/*
> + * Prepare the consolidated iova to send to dsp by prepending the sid
> + * to smmu pa at the appropriate position
> + */
> +#define IOVA_FROM_SID_PA(sid, phys, sid_pos) (phys += sid << sid_pos)
> +
>  struct fastrpc_phy_page {
>  	u64 addr;		/* physical address */
>  	u64 size;		/* size of contiguous region */
> @@ -255,6 +274,7 @@ struct fastrpc_session_ctx {
>  	int sid;
>  	bool used;
>  	bool valid;
> +	u32 sid_pos;
Why is this in session context? are you expecting this to be different
for each session? move it to channel_ctx.

>  };
>  
>  struct fastrpc_channel_ctx {
> @@ -278,6 +298,7 @@ struct fastrpc_channel_ctx {
>  	bool secure;
>  	bool unsigned_support;
>  	u64 dma_mask;
> +	u32 iova_format;
Format is very much misleading, And this is totally redundant if you add
sid_pos to soc_data.

Please add soc_data struct here, so that we dont have to keep adding
members to this and it also makes it clear what are soc specific bits in
this.

>  };
>  
>  struct fastrpc_device {
> @@ -391,8 +412,11 @@ static int fastrpc_map_lookup(struct fastrpc_user *fl, int fd,
>  
>  static void fastrpc_buf_free(struct fastrpc_buf *buf)
>  {
> +	uint32_t sid_pos = (buf->fl->sctx ? buf->fl->sctx->sid_pos :
> +					    DSP_DEFAULT_BUS_WIDTH);

Why this new check added?
> +

>  	dma_free_coherent(buf->dev, buf->size, buf->virt,
> -			  FASTRPC_PHYS(buf->phys));
> +			  IOVA_TO_PHYS(buf->phys, sid_pos));
>  	kfree(buf);
>  }
>  
> @@ -442,7 +466,7 @@ static int fastrpc_buf_alloc(struct fastrpc_user *fl, struct device *dev,
>  	buf = *obuf;
>  
>  	if (fl->sctx && fl->sctx->sid)
> -		buf->phys += ((u64)fl->sctx->sid << 32);
> +		IOVA_FROM_SID_PA((u64)fl->sctx->sid, buf->phys, fl->sctx->sid_pos);
>  
>  	return 0;
>  }
> @@ -687,7 +711,8 @@ static int fastrpc_dma_buf_attach(struct dma_buf *dmabuf,
>  		return -ENOMEM;
>  
>  	ret = dma_get_sgtable(buffer->dev, &a->sgt, buffer->virt,
> -			      FASTRPC_PHYS(buffer->phys), buffer->size);
> +			      IOVA_TO_PHYS(buffer->phys, buffer->fl->sctx->sid_pos),
> +			      buffer->size);
>  	if (ret < 0) {
>  		dev_err(buffer->dev, "failed to get scatterlist from DMA API\n");
>  		kfree(a);
> @@ -736,7 +761,7 @@ static int fastrpc_mmap(struct dma_buf *dmabuf,
>  	dma_resv_assert_held(dmabuf->resv);
>  
>  	return dma_mmap_coherent(buf->dev, vma, buf->virt,
> -				 FASTRPC_PHYS(buf->phys), size);
> +				 IOVA_TO_PHYS(buf->phys, buf->fl->sctx->sid_pos), size);
>  }
>  
>  static const struct dma_buf_ops fastrpc_dma_buf_ops = {
> @@ -793,7 +818,8 @@ static int fastrpc_map_create(struct fastrpc_user *fl, int fd,
>  		map->phys = sg_phys(map->table->sgl);
>  	} else {
>  		map->phys = sg_dma_address(map->table->sgl);
> -		map->phys += ((u64)fl->sctx->sid << 32);
> +		IOVA_FROM_SID_PA((u64)fl->sctx->sid, map->phys,
> +				 fl->sctx->sid_pos);
>  	}
>  	map->size = len;
>  	map->va = sg_virt(map->table->sgl);
> @@ -2153,11 +2179,14 @@ static int fastrpc_cb_probe(struct platform_device *pdev)
>  	sess->used = false;
>  	sess->valid = true;
>  	sess->dev = dev;
> -	dev_set_drvdata(dev, sess);
> +	/* Configure where sid will be prepended to pa */
unnessary comment here.

> +	sess->sid_pos =
> +		(cctx->iova_format ? SID_POS_IN_IOVA : DSP_DEFAULT_BUS_WIDTH);

as commented eariler, replace iova_format from soc_data with pos.
>  
>  	if (of_property_read_u32(dev->of_node, "reg", &sess->sid))
>  		dev_info(dev, "FastRPC Session ID not specified in DT\n");
>  
> +	dev_set_drvdata(dev, sess);

why this line moved in this patch?

>  	if (sessions > 0) {
>  		struct fastrpc_session_ctx *dup_sess;
>  
> @@ -2256,6 +2285,19 @@ static int fastrpc_get_domain_id(const char *domain)
>  	return -EINVAL;
>  }
>  
> +struct fastrpc_soc_data {
> +	u32 dsp_iova_format;

s/dsp_iova_format/sid_pos

> +};
> +
> +static const struct fastrpc_soc_data kaanapali_soc_data = {
> +	.dsp_iova_format = 1,
	.sid_pos = 54,
> +};
> +
> +static const struct of_device_id qcom_soc_match_table[] = {
> +	{ .compatible = "qcom,kaanapali", .data = &kaanapali_soc_data },
> +	{},
> +};
> +
>  static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
>  {
>  	struct device *rdev = &rpdev->dev;
> @@ -2264,6 +2306,23 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
>  	const char *domain;
