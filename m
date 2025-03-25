Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B2B2A6EAC6
	for <lists+dri-devel@lfdr.de>; Tue, 25 Mar 2025 08:45:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B986810E4F4;
	Tue, 25 Mar 2025 07:45:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="CmV8JNGH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09D6810E4F4
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Mar 2025 07:45:47 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 3EAD2A4A557;
 Tue, 25 Mar 2025 07:40:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C60B7C4CEE8;
 Tue, 25 Mar 2025 07:45:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1742888746;
 bh=COv3ALd0K+Klf9VX67K/rQCTmju5YgCqlTdzWPNwzUE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=CmV8JNGH7Vcd7sDcWXD3QdzPpQ44/Z4BDNs9o6G3stDLHsydKUsfaTkn5pVxB4LPA
 8bRlP+4KjK7bp+4NSt/vU8sD7VicmTvEh1mRkaPB4cHTWKjQ0erj5Whm43Hn4IR/lG
 n4FQx6G25IIjt6rmj2JZELJ4TH8vJ+Gc/no9tWf/ut0j83e6BRUaXIj+SrtahRx5Jc
 Xc14v+l0DLaqJDsqJrx3zrrK6WoAVXunGAC88ehMCShTerowJG2KDCV82MqmyX4lSJ
 eXJdt5BhH/qM4beSZDGs9q+xElFI6D7w7eRvIn1A57pPIG/DiyhT0zEF0hhLfU1bSv
 th6orop3f5Pjg==
Date: Tue, 25 Mar 2025 13:15:35 +0530
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
Subject: Re: [PATCH v6 10/10] optee: smc abi: dynamic restricted memory
 allocation
Message-ID: <Z-JfH7VAm0DTTbVg@sumit-X1>
References: <20250305130634.1850178-1-jens.wiklander@linaro.org>
 <20250305130634.1850178-11-jens.wiklander@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250305130634.1850178-11-jens.wiklander@linaro.org>
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

On Wed, Mar 05, 2025 at 02:04:16PM +0100, Jens Wiklander wrote:
> Add support in the OP-TEE backend driver for dynamic restricted memory
> allocation using the SMC ABI.
> 
> Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> ---
>  drivers/tee/optee/smc_abi.c | 96 +++++++++++++++++++++++++++++++------
>  1 file changed, 81 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/tee/optee/smc_abi.c b/drivers/tee/optee/smc_abi.c
> index a14ff0b7d3b3..aa574ee6e277 100644
> --- a/drivers/tee/optee/smc_abi.c
> +++ b/drivers/tee/optee/smc_abi.c
> @@ -1001,6 +1001,69 @@ static int optee_smc_do_call_with_arg(struct tee_context *ctx,
>  	return rc;
>  }
>  
> +static int optee_smc_lend_rstmem(struct optee *optee, struct tee_shm *rstmem,
> +				 u16 *end_points, unsigned int ep_count,
> +				 u32 use_case)
> +{
> +	struct optee_shm_arg_entry *entry;
> +	struct optee_msg_arg *msg_arg;
> +	struct tee_shm *shm;
> +	u_int offs;
> +	int rc;
> +
> +	msg_arg = optee_get_msg_arg(optee->ctx, 2, &entry, &shm, &offs);
> +	if (IS_ERR(msg_arg))
> +		return PTR_ERR(msg_arg);
> +
> +	msg_arg->cmd = OPTEE_MSG_CMD_LEND_RSTMEM;
> +	msg_arg->params[0].attr = OPTEE_MSG_ATTR_TYPE_VALUE_INPUT;
> +	msg_arg->params[0].u.value.a = use_case;
> +	msg_arg->params[1].attr = OPTEE_MSG_ATTR_TYPE_TMEM_INPUT;
> +	msg_arg->params[1].u.tmem.buf_ptr = rstmem->paddr;
> +	msg_arg->params[1].u.tmem.size = rstmem->size;
> +	msg_arg->params[1].u.tmem.shm_ref = (u_long)rstmem;
> +
> +	rc = optee->ops->do_call_with_arg(optee->ctx, shm, offs, false);
> +	if (rc)
> +		goto out;
> +	if (msg_arg->ret != TEEC_SUCCESS) {
> +		rc = -EINVAL;
> +		goto out;
> +	}
> +	rstmem->sec_world_id = (u_long)rstmem;
> +
> +out:
> +	optee_free_msg_arg(optee->ctx, entry, offs);
> +	return rc;
> +}
> +
> +static int optee_smc_reclaim_rstmem(struct optee *optee, struct tee_shm *rstmem)
> +{
> +	struct optee_shm_arg_entry *entry;
> +	struct optee_msg_arg *msg_arg;
> +	struct tee_shm *shm;
> +	u_int offs;
> +	int rc;
> +
> +	msg_arg = optee_get_msg_arg(optee->ctx, 1, &entry, &shm, &offs);
> +	if (IS_ERR(msg_arg))
> +		return PTR_ERR(msg_arg);
> +
> +	msg_arg->cmd = OPTEE_MSG_CMD_RECLAIM_RSTMEM;
> +	msg_arg->params[0].attr = OPTEE_MSG_ATTR_TYPE_RMEM_INPUT;
> +	msg_arg->params[0].u.rmem.shm_ref = (u_long)rstmem;
> +
> +	rc = optee->ops->do_call_with_arg(optee->ctx, shm, offs, false);
> +	if (rc)
> +		goto out;
> +	if (msg_arg->ret != TEEC_SUCCESS)
> +		rc = -EINVAL;
> +
> +out:
> +	optee_free_msg_arg(optee->ctx, entry, offs);
> +	return rc;
> +}
> +
>  /*
>   * 5. Asynchronous notification
>   */
> @@ -1252,6 +1315,8 @@ static const struct optee_ops optee_ops = {
>  	.do_call_with_arg = optee_smc_do_call_with_arg,
>  	.to_msg_param = optee_to_msg_param,
>  	.from_msg_param = optee_from_msg_param,
> +	.lend_rstmem = optee_smc_lend_rstmem,
> +	.reclaim_rstmem = optee_smc_reclaim_rstmem,
>  };
>  
>  static int enable_async_notif(optee_invoke_fn *invoke_fn)
> @@ -1622,11 +1687,13 @@ static inline int optee_load_fw(struct platform_device *pdev,
>  
>  static int optee_sdp_pool_init(struct optee *optee)
>  {
> +	bool sdp = optee->smc.sec_caps & OPTEE_SMC_SEC_CAP_SDP;
> +	bool dyn_sdp = optee->smc.sec_caps & OPTEE_SMC_SEC_CAP_DYNAMIC_RSTMEM;
>  	enum tee_dma_heap_id heap_id = TEE_DMA_HEAP_SECURE_VIDEO_PLAY;
> -	struct tee_rstmem_pool *pool;
> -	int rc;
> +	struct tee_rstmem_pool *pool = ERR_PTR(-EINVAL);
> +	int rc = -EINVAL;
>  
> -	if (optee->smc.sec_caps & OPTEE_SMC_SEC_CAP_SDP) {
> +	if (sdp) {
>  		union {
>  			struct arm_smccc_res smccc;
>  			struct optee_smc_get_sdp_config_result result;
> @@ -1634,25 +1701,24 @@ static int optee_sdp_pool_init(struct optee *optee)
>  
>  		optee->smc.invoke_fn(OPTEE_SMC_GET_SDP_CONFIG, 0, 0, 0, 0, 0, 0,
>  				     0, &res.smccc);
> -		if (res.result.status != OPTEE_SMC_RETURN_OK) {
> -			pr_err("Secure Data Path service not available\n");
> -			return 0;
> -		}
> +		if (res.result.status == OPTEE_SMC_RETURN_OK)
> +			pool = tee_rstmem_static_pool_alloc(res.result.start,
> +							    res.result.size);
> +	}
>  
> -		pool = tee_rstmem_static_pool_alloc(res.result.start,
> -						    res.result.size);
> -		if (IS_ERR(pool))
> -			return PTR_ERR(pool);
> +	if (dyn_sdp && IS_ERR(pool))
> +		pool = optee_rstmem_alloc_cma_pool(optee, heap_id);
>  
> +	if (!IS_ERR(pool)) {
>  		rc = tee_device_register_dma_heap(optee->teedev, heap_id, pool);
>  		if (rc)
> -			goto err;
> +			pool->ops->destroy_pool(pool);
>  	}
>  
> +	if (rc && (sdp || dyn_sdp))
> +		pr_err("Secure Data Path service not available\n");

Rather than an error message we should just use pr_info().

-Sumit

> +
>  	return 0;
> -err:
> -	pool->ops->destroy_pool(pool);
> -	return rc;
>  }
>  
>  static int optee_probe(struct platform_device *pdev)
> -- 
> 2.43.0
> 
