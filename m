Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8492A6EA30
	for <lists+dri-devel@lfdr.de>; Tue, 25 Mar 2025 08:07:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E04D910E383;
	Tue, 25 Mar 2025 07:07:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="uGuI/gEN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 978E610E383
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Mar 2025 07:07:26 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id BD430A4A254;
 Tue, 25 Mar 2025 07:01:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7D46C4CEE8;
 Tue, 25 Mar 2025 07:07:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1742886445;
 bh=tg+CzT94V2KHL7cvcsv3BOAj9cqZ8YzAUgJ5W4z5H4c=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=uGuI/gENsIOfo9g5ssUpgXDjOcPi/XDvQ0rYWtHHZe1uUQrrQ8ebTZWvoWVg+18B+
 CFGPkLQOw+VRAO30/5q9eIme3Vkr4yH8NLyfqw1F6AFisurhS0oNLivQo9O3w5Uotr
 6GSqx3JjQ9kNBfeeJpGcV9Lw+w/WKlkf5+zKDRf5zOKgy2ST8honmAVIHVsoECIyrC
 SyjaBIh8m9eQQHuu1KsbRnzeG8y7nv4gh8X4RsMufU1N0p9Gd34AFsR8ZJpckY4+nb
 RRsOPpkVUIbVu1UswcBf11rCBapP0682sP1oFXtCXmeZFKj4CnGAlPxZblMVTRTLp6
 kwoVO1kXmRLyg==
Date: Tue, 25 Mar 2025 12:37:15 +0530
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
Subject: Re: [PATCH v6 08/10] optee: support restricted memory allocation
Message-ID: <Z-JWIyd8cKyXQR0H@sumit-X1>
References: <20250305130634.1850178-1-jens.wiklander@linaro.org>
 <20250305130634.1850178-9-jens.wiklander@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250305130634.1850178-9-jens.wiklander@linaro.org>
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

On Wed, Mar 05, 2025 at 02:04:14PM +0100, Jens Wiklander wrote:
> Add support in the OP-TEE backend driver for restricted memory
> allocation. The support is limited to only the SMC ABI and for secure
> video buffers.
> 
> OP-TEE is probed for the range of restricted physical memory and a
> memory pool allocator is initialized if OP-TEE have support for such
> memory.
> 
> Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> ---
>  drivers/tee/optee/core.c    |  1 +
>  drivers/tee/optee/smc_abi.c | 44 +++++++++++++++++++++++++++++++++++--
>  2 files changed, 43 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/tee/optee/core.c b/drivers/tee/optee/core.c
> index c75fddc83576..c7fd8040480e 100644
> --- a/drivers/tee/optee/core.c
> +++ b/drivers/tee/optee/core.c
> @@ -181,6 +181,7 @@ void optee_remove_common(struct optee *optee)
>  	tee_device_unregister(optee->supp_teedev);
>  	tee_device_unregister(optee->teedev);
>  
> +	tee_device_unregister_all_dma_heaps(optee->teedev);
>  	tee_shm_pool_free(optee->pool);
>  	optee_supp_uninit(&optee->supp);
>  	mutex_destroy(&optee->call_queue.mutex);
> diff --git a/drivers/tee/optee/smc_abi.c b/drivers/tee/optee/smc_abi.c
> index cfdae266548b..a14ff0b7d3b3 100644
> --- a/drivers/tee/optee/smc_abi.c
> +++ b/drivers/tee/optee/smc_abi.c
> @@ -1620,6 +1620,41 @@ static inline int optee_load_fw(struct platform_device *pdev,
>  }
>  #endif
>  
> +static int optee_sdp_pool_init(struct optee *optee)
> +{
> +	enum tee_dma_heap_id heap_id = TEE_DMA_HEAP_SECURE_VIDEO_PLAY;
> +	struct tee_rstmem_pool *pool;
> +	int rc;
> +
> +	if (optee->smc.sec_caps & OPTEE_SMC_SEC_CAP_SDP) {

Is this SDP capability an ABI yet since we haven't supported it in
upstream kernel? If no then can we rename it as
OPTEE_SMC_SEC_CAP_RSTMEM?

> +		union {
> +			struct arm_smccc_res smccc;
> +			struct optee_smc_get_sdp_config_result result;
> +		} res;
> +
> +		optee->smc.invoke_fn(OPTEE_SMC_GET_SDP_CONFIG, 0, 0, 0, 0, 0, 0,
> +				     0, &res.smccc);
> +		if (res.result.status != OPTEE_SMC_RETURN_OK) {
> +			pr_err("Secure Data Path service not available\n");
> +			return 0;
> +		}
> +
> +		pool = tee_rstmem_static_pool_alloc(res.result.start,
> +						    res.result.size);
> +		if (IS_ERR(pool))
> +			return PTR_ERR(pool);
> +
> +		rc = tee_device_register_dma_heap(optee->teedev, heap_id, pool);
> +		if (rc)
> +			goto err;
> +	}
> +
> +	return 0;
> +err:
> +	pool->ops->destroy_pool(pool);
> +	return rc;
> +}
> +
>  static int optee_probe(struct platform_device *pdev)
>  {
>  	optee_invoke_fn *invoke_fn;
> @@ -1715,7 +1750,7 @@ static int optee_probe(struct platform_device *pdev)
>  	optee = kzalloc(sizeof(*optee), GFP_KERNEL);
>  	if (!optee) {
>  		rc = -ENOMEM;
> -		goto err_free_pool;
> +		goto err_free_shm_pool;
>  	}
>  
>  	optee->ops = &optee_ops;
> @@ -1788,6 +1823,10 @@ static int optee_probe(struct platform_device *pdev)
>  		pr_info("Asynchronous notifications enabled\n");
>  	}
>  
> +	rc = optee_sdp_pool_init(optee);

s/optee_sdp_pool_init/optee_rstmem_pool_init/

-Sumit

> +	if (rc)
> +		goto err_notif_uninit;
> +
>  	/*
>  	 * Ensure that there are no pre-existing shm objects before enabling
>  	 * the shm cache so that there's no chance of receiving an invalid
> @@ -1823,6 +1862,7 @@ static int optee_probe(struct platform_device *pdev)
>  		optee_disable_shm_cache(optee);
>  	optee_smc_notif_uninit_irq(optee);
>  	optee_unregister_devices();
> +	tee_device_unregister_all_dma_heaps(optee->teedev);
>  err_notif_uninit:
>  	optee_notif_uninit(optee);
>  err_close_ctx:
> @@ -1839,7 +1879,7 @@ static int optee_probe(struct platform_device *pdev)
>  	tee_device_unregister(optee->teedev);
>  err_free_optee:
>  	kfree(optee);
> -err_free_pool:
> +err_free_shm_pool:
>  	tee_shm_pool_free(pool);
>  	if (memremaped_shm)
>  		memunmap(memremaped_shm);
> -- 
> 2.43.0
> 
