Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BBD9AA58EB7
	for <lists+dri-devel@lfdr.de>; Mon, 10 Mar 2025 09:57:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0879310E3C0;
	Mon, 10 Mar 2025 08:57:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="GZJ4VUDA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEC9A10E3C1
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Mar 2025 08:57:34 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id EB391A451B8;
 Mon, 10 Mar 2025 08:52:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BA1FC4CEE5;
 Mon, 10 Mar 2025 08:57:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741597054;
 bh=z3HdFE82Z/4RXvpeoyqLFCEFSfIoebqZu/6FnbCAKPM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GZJ4VUDAQQIR20H8jXi0mJDIV4ID0WB2CwAbFjl2aHinP/A02XERw7A32F808dODs
 Ms6hnBnhEkluGmKGSr8CotjSnHmRNbh6spwMl0xPpc4m1ZbrJ5sMUMpM+G67mVGhNx
 X35Ch+E+1og6Qz9xslNfPzGlCEzjGoqxovfOr6rpQ4l+iN4iH6KtKWOsR6iiWCpABE
 7iCsRWsmE2MoCl4HDhknfBYhB3nQAsy5aKnVZIr8ZEmis/9NTWXTZiKwL+oDaCW0hn
 HJoOTn/s2hUF4+PFutLzlgPuxCrTbs9/Iw3T32MkFrgUqH2fvnHex6a0zaVKKCS62R
 EAYuC89BVv8Bg==
Date: Mon, 10 Mar 2025 14:27:24 +0530
From: Sumit Garg <sumit.garg@kernel.org>
To: Jens Wiklander <jens.wiklander@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 op-tee@lists.trustedfirmware.org, linux-arm-kernel@lists.infradead.org,
 Olivier Masse <olivier.masse@nxp.com>,
 Thierry Reding <thierry.reding@gmail.com>, Yong Wu <yong.wu@mediatek.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>,
 "T . J . Mercier" <tjmercier@google.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 azarrabi@qti.qualcomm.com, Simona Vetter <simona.vetter@ffwll.ch>,
 Daniel Stone <daniel@fooishbar.org>
Subject: Re: [PATCH v6 02/10] optee: pass parent device to tee_device_alloc()
Message-ID: <Z86pdKQY440edHNx@sumit-X1>
References: <20250305130634.1850178-1-jens.wiklander@linaro.org>
 <20250305130634.1850178-3-jens.wiklander@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250305130634.1850178-3-jens.wiklander@linaro.org>
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

On Wed, Mar 05, 2025 at 02:04:08PM +0100, Jens Wiklander wrote:
> During probing of the OP-TEE driver, pass the parent device to
> tee_device_alloc() so the dma_mask of the new devices can be updated
> accordingly.
> 
> Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> ---
>  drivers/tee/optee/ffa_abi.c | 8 ++++----
>  drivers/tee/optee/smc_abi.c | 4 ++--
>  2 files changed, 6 insertions(+), 6 deletions(-)
> 

Reviewed-by: Sumit Garg <sumit.garg@kernel.org>

-Sumit

> diff --git a/drivers/tee/optee/ffa_abi.c b/drivers/tee/optee/ffa_abi.c
> index f3af5666bb11..4ca1d5161b82 100644
> --- a/drivers/tee/optee/ffa_abi.c
> +++ b/drivers/tee/optee/ffa_abi.c
> @@ -914,16 +914,16 @@ static int optee_ffa_probe(struct ffa_device *ffa_dev)
>  	    (sec_caps & OPTEE_FFA_SEC_CAP_RPMB_PROBE))
>  		optee->in_kernel_rpmb_routing = true;
>  
> -	teedev = tee_device_alloc(&optee_ffa_clnt_desc, NULL, optee->pool,
> -				  optee);
> +	teedev = tee_device_alloc(&optee_ffa_clnt_desc, &ffa_dev->dev,
> +				  optee->pool, optee);
>  	if (IS_ERR(teedev)) {
>  		rc = PTR_ERR(teedev);
>  		goto err_free_pool;
>  	}
>  	optee->teedev = teedev;
>  
> -	teedev = tee_device_alloc(&optee_ffa_supp_desc, NULL, optee->pool,
> -				  optee);
> +	teedev = tee_device_alloc(&optee_ffa_supp_desc, &ffa_dev->dev,
> +				  optee->pool, optee);
>  	if (IS_ERR(teedev)) {
>  		rc = PTR_ERR(teedev);
>  		goto err_unreg_teedev;
> diff --git a/drivers/tee/optee/smc_abi.c b/drivers/tee/optee/smc_abi.c
> index f0c3ac1103bb..165fadd9abc9 100644
> --- a/drivers/tee/optee/smc_abi.c
> +++ b/drivers/tee/optee/smc_abi.c
> @@ -1691,14 +1691,14 @@ static int optee_probe(struct platform_device *pdev)
>  	    (sec_caps & OPTEE_SMC_SEC_CAP_RPMB_PROBE))
>  		optee->in_kernel_rpmb_routing = true;
>  
> -	teedev = tee_device_alloc(&optee_clnt_desc, NULL, pool, optee);
> +	teedev = tee_device_alloc(&optee_clnt_desc, &pdev->dev, pool, optee);
>  	if (IS_ERR(teedev)) {
>  		rc = PTR_ERR(teedev);
>  		goto err_free_optee;
>  	}
>  	optee->teedev = teedev;
>  
> -	teedev = tee_device_alloc(&optee_supp_desc, NULL, pool, optee);
> +	teedev = tee_device_alloc(&optee_supp_desc, &pdev->dev, pool, optee);
>  	if (IS_ERR(teedev)) {
>  		rc = PTR_ERR(teedev);
>  		goto err_unreg_teedev;
> -- 
> 2.43.0
> 
