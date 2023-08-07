Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A72A0772814
	for <lists+dri-devel@lfdr.de>; Mon,  7 Aug 2023 16:44:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B2FC10E200;
	Mon,  7 Aug 2023 14:43:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F4D610E200
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Aug 2023 14:43:53 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-98377c5d53eso635311066b.0
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Aug 2023 07:43:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1691419432; x=1692024232;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=L1PRpPGj/okj0DH5NoLyIrETcRf3Xmh3P5Svli7tqw0=;
 b=n8W/IB+waUCBHlDebG2sL7PwDbHqSKrYnLX2qCQEfAa+yjZ1toRcI6O1vv/I8vwZYM
 2dz0WRe+/QSuxjNHa7dTgrgXx6SS2aHEs1126bU4sgoh4mT7MYhNNhVB9UPxtJx7xbsW
 WrYzYEkflwJQbBWtLcEyiLWXilVqBqqMSvsmgZZtOcoMJDxedbtx5EIJ96mh0H5GyX9u
 S+bp9T2oPlhoutNv1YMmPe9+gfxCPqEEy2faFVy+zQ2NqnNPr+FOOM8XQ/cI8JM2CpXQ
 tGw54Hh462P9nHaApd2X6OsPzK4T1mdtVW2EmLNp1A5EP+f25Z1YDfAd90pIZZ+8+OYC
 VyuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691419432; x=1692024232;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=L1PRpPGj/okj0DH5NoLyIrETcRf3Xmh3P5Svli7tqw0=;
 b=SDsa+9cBv/85u4HiUV8zoEshVDKj47jvaJLwo6Ldcr2LT0fkNb4GURS+To41NT+ImH
 02oAJx9DlLdpyFsapJnvlw1nFwxQ5U8Rfer8iv7Q8R1othie59ulMplOCaCZA/X4ogvN
 pq299N3YJT3zuLF9+ati2qx3wLvAfeV21cgNqZKzqg8uSEPMDgvUunvVj+/5hfVO051r
 r/66zL3WvDWDpCTAq3EAAF41NjI2s7JPUz9IoWKA3mEPwGFuFuWvgOpYlEJNMQc2Aiw3
 m+gLJUPQCbpZKhNGmbO5FokrrpNbJcBf6F2N946SEdMS5q4otD0eXfe3BaR0pkpLgTM0
 JPoQ==
X-Gm-Message-State: AOJu0YyiCMfxqkvaczrKSbBp+TpEDBox8IC7ecxCuqIYwf+cArYMmhHF
 GXw0YKJTbVR8gmw6LXjhyeH1OQ==
X-Google-Smtp-Source: AGHT+IE/RsFkKCYso/wVpSORIJMMxCGv+JpBmuVOlZM5EjWw1Xq0EXFbSQ5WqyohLcqr7jwCYL42jA==
X-Received: by 2002:a17:906:5388:b0:99c:3b4:9407 with SMTP id
 g8-20020a170906538800b0099c03b49407mr7054887ejo.5.1691419432026; 
 Mon, 07 Aug 2023 07:43:52 -0700 (PDT)
Received: from localhost (h3221.n1.ips.mtn.co.ug. [41.210.178.33])
 by smtp.gmail.com with ESMTPSA id
 l7-20020a1709066b8700b0099c53c4407dsm5326347ejr.78.2023.08.07.07.43.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Aug 2023 07:43:51 -0700 (PDT)
Date: Mon, 7 Aug 2023 17:43:47 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Jeffrey Hugo <quic_jhugo@quicinc.com>
Subject: Re: [PATCH v5] accel/qaic: tighten integer overflow checking in
 map_user_pages()
Message-ID: <67e728b4-7d3f-447d-bbaa-2f69f65bb63e@kadam.mountain>
References: <e6cbc8a3-c2ae-46be-a731-494470c0a21c@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e6cbc8a3-c2ae-46be-a731-494470c0a21c@moroto.mountain>
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
Cc: linux-arm-msm@vger.kernel.org, Oded Gabbay <ogabbay@kernel.org>,
 kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>,
 Carl Vanderlip <quic_carlv@quicinc.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Aug 07, 2023 at 05:09:34PM +0300, Dan Carpenter wrote:
> The encode_dma() function has some validation on in_trans->size but it's
> not complete and it would be more clear to move those checks to
> find_and_map_user_pages().
> 
> The encode_dma() had two checks:
> 
> 	if (in_trans->addr + in_trans->size < in_trans->addr || !in_trans->size)
> 		return -EINVAL;
> 
> It's not sufficeint to just check if in_trans->size is zero.  The
> resources->xferred_dma_size variable represent the number of bytes
> already transferred.  If we have already transferred more bytes than
> in_trans->size then there are negative bytes remaining which doesn't
> make sense.  Check for that as well.
> 
> I introduced a new variable "remaining" which represents the amount
> we want to transfer (in_trans->size) minus the ammount we have already
> transferred (resources->xferred_dma_size).
> 
> The check in encode_dma() checked that "addr + size" could not overflow
> however we may already have transferred some bytes so the real starting
> address is "xfer_start_addr" so check that "xfer_start_addr + size"
> cannot overflow instead.  Also check that "addr +
> resources->xferred_dma_size cannot overflow.
> 
> My other concern was that we are dealing with u64 values but on 32bit
> systems the kmalloc() function will truncate the sizes to 32 bits.  So
> I calculated "total = in_trans->size + offset_in_page(xfer_start_addr);"
> and returned -EINVAL if it were >= SIZE_MAX.  This will not affect 64bit
> systems.
> 
> Fixes: 129776ac2e38 ("accel/qaic: Add control path")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
> This is re-write re-write of the previous version.
> 
> I am not necessarily sure it is correct.  Please review carefully.  In
> particular, please check how "total" is calculated.  Maybe it would make
> more sense to write that as:
> 
> 	total = remaining + offset_in_page(xfer_start_addr);
> 
> The other question I had is should we add a check:
> 
> 	if (remaining == 0)
> 		return 0;
> 
>  drivers/accel/qaic/qaic_control.c | 23 +++++++++++++++--------
>  1 file changed, 15 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/accel/qaic/qaic_control.c b/drivers/accel/qaic/qaic_control.c
> index cfbc92da426f..d64505bcf4ae 100644
> --- a/drivers/accel/qaic/qaic_control.c
> +++ b/drivers/accel/qaic/qaic_control.c
> @@ -392,18 +392,28 @@ static int find_and_map_user_pages(struct qaic_device *qdev,
>  				   struct qaic_manage_trans_dma_xfer *in_trans,
>  				   struct ioctl_resources *resources, struct dma_xfer *xfer)
>  {
> +	u64 xfer_start_addr, remaining, end, total;
>  	unsigned long need_pages;
>  	struct page **page_list;
>  	unsigned long nr_pages;
>  	struct sg_table *sgt;
> -	u64 xfer_start_addr;
>  	int ret;
>  	int i;
>  
> -	xfer_start_addr = in_trans->addr + resources->xferred_dma_size;
> +	if (check_add_overflow(in_trans->addr, resources->xferred_dma_size, &xfer_start_addr))
> +		return -EINVAL;
> +
> +	if (in_trans->size == 0 ||
> +	    in_trans->size < resources->xferred_dma_size ||
> +	    check_add_overflow(xfer_start_addr, in_trans->size, &end))
                                                ^^^^^^^^^^^^^^
This should be remaining.  So maybe it should be something like this
with a return 0 for no bytes remaining and total calculated differently.

	if (check_add_overflow(in_trans->addr, resources->xferred_dma_size, &xfer_start_addr))
		return -EINVAL;

	if (in_trans->size < resources->xferred_dma_size)
		return -EINVAL;
	remaining = in_trans->size - resources->xferred_dma_size;
	if (remaining == 0)
		return 0;

	if (check_add_overflow(xfer_start_addr, remaining, &end))
		return -EINVAL;

	/* Still not really sure why total is calculated this way */
	total = remaining + offset_in_page(xfer_start_addr);
	if (total >= SIZE_MAX)
		return -EINVAL;

	need_pages = DIV_ROUND_UP(total, PAGE_SIZE);

regards,
dan carpenter

> +		return -EINVAL;
>  
> -	need_pages = DIV_ROUND_UP(in_trans->size + offset_in_page(xfer_start_addr) -
> -				  resources->xferred_dma_size, PAGE_SIZE);
> +	remaining = in_trans->size - resources->xferred_dma_size;
> +	total = in_trans->size + offset_in_page(xfer_start_addr);
> +	if (total >= SIZE_MAX)
> +		return -EINVAL;
> +
> +	need_pages = DIV_ROUND_UP(total - resources->xferred_dma_size, PAGE_SIZE);
>  
>  	nr_pages = need_pages;
>  
> @@ -435,7 +445,7 @@ static int find_and_map_user_pages(struct qaic_device *qdev,
>  
>  	ret = sg_alloc_table_from_pages(sgt, page_list, nr_pages,
>  					offset_in_page(xfer_start_addr),
> -					in_trans->size - resources->xferred_dma_size, GFP_KERNEL);
> +					remaining, GFP_KERNEL);
>  	if (ret) {
>  		ret = -ENOMEM;
>  		goto free_sgt;
> @@ -566,9 +576,6 @@ static int encode_dma(struct qaic_device *qdev, void *trans, struct wrapper_list
>  	    QAIC_MANAGE_EXT_MSG_LENGTH)
>  		return -ENOMEM;
>  
> -	if (in_trans->addr + in_trans->size < in_trans->addr || !in_trans->size)
> -		return -EINVAL;
> -
>  	xfer = kmalloc(sizeof(*xfer), GFP_KERNEL);
>  	if (!xfer)
>  		return -ENOMEM;
> -- 
> 2.39.2
