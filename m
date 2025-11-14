Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40234C5DF7C
	for <lists+dri-devel@lfdr.de>; Fri, 14 Nov 2025 16:47:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48CD310EABA;
	Fri, 14 Nov 2025 15:47:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="JnGaZuMb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E632010EAB7
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Nov 2025 15:47:26 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 1786E60174;
 Fri, 14 Nov 2025 15:47:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC4EEC19425;
 Fri, 14 Nov 2025 15:47:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1763135245;
 bh=mSrps6kcUyjP6xL+n9Pn5QzmtYa8CEWHnNnezuhW5qc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JnGaZuMbaz84hdPUSNTlwoCwUgLNtmmN8SLbFpRUmTtmsInEvYkq8mUHBe5wkVmWQ
 ZnX4wLtyn+/pSHIvanFedENizggr+usjseA9Wl3w9OLD/Ue5DzTF8fY7T2Vf9Q9vJm
 VaZoqEoF8zBs+3yr0OA3XY29/GbRg/cmJAUgddXHUi+cglgnz7cnBwjxPRTkl5cU3U
 X6pUbWiQwT5Zthyu6++BZ0PiuIM/mvTqcWegx1f2XC7bXALLZTH4UGUVAtRtoFTJxt
 Y5o92F8L+3eDa3FJMHsK1ZBhOX3Zg6Une6CfO8xgI2Gt0D3BtmFeWXwxs0mSIZOBEi
 UI7BURzQ12V4Q==
Date: Fri, 14 Nov 2025 09:51:53 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Kumari Pallavi <kumari.pallavi@oss.qualcomm.com>
Cc: kpallavi@qti.qualcomm.com, srini@kernel.org, amahesh@qti.qualcomm.com, 
 arnd@arndb.de, gregkh@linuxfoundation.org, quic_bkumar@quicinc.com, 
 ekansh.gupta@oss.qualcomm.com, linux-kernel@vger.kernel.org,
 quic_chennak@quicinc.com, 
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 jingyi.wang@oss.qualcomm.com, 
 aiqun.yu@oss.qualcomm.com, ktadakam@qti.qualcomm.com
Subject: Re: [PATCH v3 3/4] misc: fastrpc: Add support for new DSP IOVA
 formatting
Message-ID: <di5fqyh4uygb72xov6zqvg2i2ujlllrnnzlsphlzvghgttdqpe@u6uwwa4rxiow>
References: <20251114084142.3386682-1-kumari.pallavi@oss.qualcomm.com>
 <20251114084142.3386682-4-kumari.pallavi@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251114084142.3386682-4-kumari.pallavi@oss.qualcomm.com>
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

On Fri, Nov 14, 2025 at 02:11:41PM +0530, Kumari Pallavi wrote:
> Implement the new IOVA formatting required by the DSP architecture change
> on Kaanapali SoC. Place the SID for DSP DMA transactions at bit 56 in the
> physical address. This placement is necessary for the DSPs to correctly
> identify streams and operate as intended.
> To address this, set SID position to bit 56 via OF matching on the fastrpc
> node; otherwise, default to legacy 32-bit placement.
> This change ensures consistent SID placement across DSPs.
> 

In patch 2 I said I think it would be a good idea to separate the two
perspectives (Linux/SMMU vs remote addresses).

Looking ta this patch I'm completely convinced that it's the right thing
to do!

> Signed-off-by: Kumari Pallavi <kumari.pallavi@oss.qualcomm.com>
> ---
>  drivers/misc/fastrpc.c | 46 +++++++++++++++++++++++++++++++++++-------
>  1 file changed, 39 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> index d6a7960fe716..bcf3c7f8d3e9 100644
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
> @@ -105,6 +104,15 @@
>  
>  #define miscdev_to_fdevice(d) container_of(d, struct fastrpc_device, miscdev)
>  
> +/* Extract smmu pa from consolidated iova */
> +#define IPA_TO_DMA_ADDR(iova, sid_pos) (iova & ((1ULL << sid_pos) - 1ULL))
> +/*
> + * Prepare the consolidated iova to send to dsp by prepending the sid
> + * to smmu pa at the appropriate position
> + */
> +#define IOVA_FROM_SID_PA(sid, phys, sid_pos) \
> +       (phys += sid << sid_pos)

This is a horrible macro. It looks just like a function taking values,
it's named to sound like it takes a sid and pa and return an iova, but
it has side effects.

And what's up with the ordering? Take argument 1 and 3, and put the
result in argument 2?!

> +
>  struct fastrpc_phy_page {
>  	u64 addr;		/* physical or dma address */
>  	u64 size;		/* size of contiguous region */
> @@ -257,6 +265,10 @@ struct fastrpc_session_ctx {
>  	bool valid;
>  };
>  
> +struct fastrpc_soc_data {
> +	u32 sid_pos;
> +};
> +
>  struct fastrpc_channel_ctx {
>  	int domain_id;
>  	int sesscount;
> @@ -278,6 +290,7 @@ struct fastrpc_channel_ctx {
>  	bool secure;
>  	bool unsigned_support;
>  	u64 dma_mask;
> +	const struct fastrpc_soc_data *soc_data;
>  };
>  
>  struct fastrpc_device {
> @@ -390,7 +403,7 @@ static int fastrpc_map_lookup(struct fastrpc_user *fl, int fd,
>  static void fastrpc_buf_free(struct fastrpc_buf *buf)
>  {
>  	dma_free_coherent(buf->dev, buf->size, buf->virt,
> -			  FASTRPC_PHYS(buf->dma_addr));
> +			  IPA_TO_DMA_ADDR(buf->dma_addr, buf->fl->cctx->soc_data->sid_pos));
>  	kfree(buf);
>  }
>  
> @@ -440,7 +453,8 @@ static int fastrpc_buf_alloc(struct fastrpc_user *fl, struct device *dev,
>  	buf = *obuf;
>  
>  	if (fl->sctx && fl->sctx->sid)
> -		buf->dma_addr += ((u64)fl->sctx->sid << 32);
> +		IOVA_FROM_SID_PA((u64)fl->sctx->sid, buf->dma_addr,
> +				 fl->cctx->soc_data->sid_pos);

There's no way _you_ can look at this statement and feel that it's going
to add the first argument shifted by the third argument, to the second
argument.

Please write that is easy to read, follow and possible to maintain!

Regards,
Bjorn

>  
>  	return 0;
>  }
> @@ -685,7 +699,8 @@ static int fastrpc_dma_buf_attach(struct dma_buf *dmabuf,
>  		return -ENOMEM;
>  
>  	ret = dma_get_sgtable(buffer->dev, &a->sgt, buffer->virt,
> -			      FASTRPC_PHYS(buffer->dma_addr), buffer->size);
> +			      IPA_TO_DMA_ADDR(buffer->dma_addr,
> +			      buffer->fl->cctx->soc_data->sid_pos), buffer->size);
>  	if (ret < 0) {
>  		dev_err(buffer->dev, "failed to get scatterlist from DMA API\n");
>  		kfree(a);
> @@ -734,7 +749,8 @@ static int fastrpc_mmap(struct dma_buf *dmabuf,
>  	dma_resv_assert_held(dmabuf->resv);
>  
>  	return dma_mmap_coherent(buf->dev, vma, buf->virt,
> -				 FASTRPC_PHYS(buf->dma_addr), size);
> +				 IPA_TO_DMA_ADDR(buf->dma_addr,
> +				 buf->fl->cctx->soc_data->sid_pos), size);
>  }
>  
>  static const struct dma_buf_ops fastrpc_dma_buf_ops = {
> @@ -789,7 +805,8 @@ static int fastrpc_map_attach(struct fastrpc_user *fl, int fd,
>  		map->dma_addr = sg_phys(map->table->sgl);
>  	} else {
>  		map->dma_addr = sg_dma_address(map->table->sgl);
> -		map->dma_addr += ((u64)fl->sctx->sid << 32);
> +		IOVA_FROM_SID_PA((u64)fl->sctx->sid,
> +				 map->dma_addr, fl->cctx->soc_data->sid_pos);
>  	}
>  	for_each_sg(map->table->sgl, sgl, map->table->nents,
>  		sgl_index)
> @@ -2289,6 +2306,14 @@ static int fastrpc_get_domain_id(const char *domain)
>  	return -EINVAL;
>  }
>  
> +static const struct fastrpc_soc_data kaanapali_soc_data = {
> +	.sid_pos = 56,
> +};
> +
> +static const struct fastrpc_soc_data default_soc_data = {
> +	.sid_pos = 32,
> +};
> +
>  static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
>  {
>  	struct device *rdev = &rpdev->dev;
> @@ -2297,6 +2322,11 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
>  	const char *domain;
>  	bool secure_dsp;
>  	unsigned int vmids[FASTRPC_MAX_VMIDS];
> +	const struct fastrpc_soc_data *soc_data = NULL;
> +
> +	soc_data = device_get_match_data(rdev);
> +	if (!soc_data)
> +		soc_data = &default_soc_data;
>  
>  	err = of_property_read_string(rdev->of_node, "label", &domain);
>  	if (err) {
> @@ -2349,6 +2379,7 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
>  
>  	secure_dsp = !(of_property_read_bool(rdev->of_node, "qcom,non-secure-domain"));
>  	data->secure = secure_dsp;
> +	data->soc_data = soc_data;
>  
>  	switch (domain_id) {
>  	case ADSP_DOMAIN_ID:
> @@ -2486,7 +2517,8 @@ static int fastrpc_rpmsg_callback(struct rpmsg_device *rpdev, void *data,
>  }
>  
>  static const struct of_device_id fastrpc_rpmsg_of_match[] = {
> -	{ .compatible = "qcom,fastrpc" },
> +	{ .compatible = "qcom,kaanapali-fastrpc", .data = &kaanapali_soc_data },
> +	{ .compatible = "qcom,fastrpc", .data = &default_soc_data },
>  	{ },
>  };
>  MODULE_DEVICE_TABLE(of, fastrpc_rpmsg_of_match);
> -- 
> 2.34.1
> 
> 
