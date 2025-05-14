Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B404AB6D1A
	for <lists+dri-devel@lfdr.de>; Wed, 14 May 2025 15:46:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD24B10E64E;
	Wed, 14 May 2025 13:46:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="f5fRy+W2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A907B10E64E
 for <dri-devel@lists.freedesktop.org>; Wed, 14 May 2025 13:46:46 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id A54DAA4C7F2;
 Wed, 14 May 2025 13:46:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18C78C4CEE9;
 Wed, 14 May 2025 13:46:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1747230405;
 bh=soV23LpLMRcDs8ch1d5Uq0u/djhhR8uze10Cw4+6j3Q=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=f5fRy+W208P1eN/R7e+TwDGkgj4EabQOmIgCE/oaRy9FgCGizqkGUMwdBwtFSNHMJ
 aMgBL2biGq2scJANHI1MGxgH4sLDJuqphQfmUCmRbrXtunZW02lKYMqY+ylgaUkUOO
 PotFIJfRykg/8CnF87KF9umbPYB4rdNTUe65qZs/DpNxNqLT3in8p7djHd7kDZ3akk
 rKR6RjgWFYsg6gvhuaAEbW1D7BH+tIUMh3Yn2jjAQbF0VYnWENA7HMG/3GgF5ByzVb
 qhHwBWFNkvH9pZHrdrVIBYyhXnJXsL9hx4CQrWjR51WgNwRGO74jNmR1KgoJtUbDWd
 chA8HtxlASy7w==
Date: Wed, 14 May 2025 19:16:37 +0530
From: Sumit Garg <sumit.garg@kernel.org>
To: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Cc: Jens Wiklander <jens.wiklander@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Apurupa Pattapu <quic_apurupa@quicinc.com>, Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 linux-arm-msm@vger.kernel.org, op-tee@lists.trustedfirmware.org,
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-doc@vger.kernel.org
Subject: Re: [PATCH v4 03/11] tee: add TEE_IOCTL_PARAM_ATTR_TYPE_UBUF
Message-ID: <aCSevYV7G6P-pqJd@sumit-X1>
References: <20250428-qcom-tee-using-tee-ss-without-mem-obj-v4-0-6a143640a6cb@oss.qualcomm.com>
 <20250428-qcom-tee-using-tee-ss-without-mem-obj-v4-3-6a143640a6cb@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250428-qcom-tee-using-tee-ss-without-mem-obj-v4-3-6a143640a6cb@oss.qualcomm.com>
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

On Mon, Apr 28, 2025 at 11:06:24PM -0700, Amirreza Zarrabi wrote:
> For drivers that can transfer data to the TEE without using shared
> memory from client, it is necessary to receive the user address
> directly, bypassing any processing by the TEE subsystem. Introduce
> TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_INPUT/OUTPUT/INOUT to represent
> userspace buffers.
> 
> Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
> ---
>  drivers/tee/tee_core.c   | 33 +++++++++++++++++++++++++++++++++
>  include/linux/tee_drv.h  |  6 ++++++
>  include/uapi/linux/tee.h | 22 ++++++++++++++++------
>  3 files changed, 55 insertions(+), 6 deletions(-)

Reviewed-by: Sumit Garg <sumit.garg@oss.qualcomm.com>

-Sumit

> 
> diff --git a/drivers/tee/tee_core.c b/drivers/tee/tee_core.c
> index 721522fe5c63..7bf265c4ac65 100644
> --- a/drivers/tee/tee_core.c
> +++ b/drivers/tee/tee_core.c
> @@ -386,6 +386,17 @@ static int params_from_user(struct tee_context *ctx, struct tee_param *params,
>  			params[n].u.value.b = ip.b;
>  			params[n].u.value.c = ip.c;
>  			break;
> +		case TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_INPUT:
> +		case TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_OUTPUT:
> +		case TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_INOUT:
> +			params[n].u.ubuf.uaddr = u64_to_user_ptr(ip.a);
> +			params[n].u.ubuf.size = ip.b;
> +
> +			if (!access_ok(params[n].u.ubuf.uaddr,
> +				       params[n].u.ubuf.size))
> +				return -EFAULT;
> +
> +			break;
>  		case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INPUT:
>  		case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_OUTPUT:
>  		case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INOUT:
> @@ -454,6 +465,11 @@ static int params_to_user(struct tee_ioctl_param __user *uparams,
>  			    put_user(p->u.value.c, &up->c))
>  				return -EFAULT;
>  			break;
> +		case TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_OUTPUT:
> +		case TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_INOUT:
> +			if (put_user((u64)p->u.ubuf.size, &up->b))
> +				return -EFAULT;
> +			break;
>  		case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_OUTPUT:
>  		case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INOUT:
>  			if (put_user((u64)p->u.memref.size, &up->b))
> @@ -654,6 +670,13 @@ static int params_to_supp(struct tee_context *ctx,
>  			ip.b = p->u.value.b;
>  			ip.c = p->u.value.c;
>  			break;
> +		case TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_INPUT:
> +		case TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_OUTPUT:
> +		case TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_INOUT:
> +			ip.a = (u64)p->u.ubuf.uaddr;
> +			ip.b = p->u.ubuf.size;
> +			ip.c = 0;
> +			break;
>  		case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INPUT:
>  		case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_OUTPUT:
>  		case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INOUT:
> @@ -756,6 +779,16 @@ static int params_from_supp(struct tee_param *params, size_t num_params,
>  			p->u.value.b = ip.b;
>  			p->u.value.c = ip.c;
>  			break;
> +		case TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_OUTPUT:
> +		case TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_INOUT:
> +			p->u.ubuf.uaddr = u64_to_user_ptr(ip.a);
> +			p->u.ubuf.size = ip.b;
> +
> +			if (!access_ok(params[n].u.ubuf.uaddr,
> +				       params[n].u.ubuf.size))
> +				return -EFAULT;
> +
> +			break;
>  		case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_OUTPUT:
>  		case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INOUT:
>  			/*
> diff --git a/include/linux/tee_drv.h b/include/linux/tee_drv.h
> index a54c203000ed..78bbf12f02f0 100644
> --- a/include/linux/tee_drv.h
> +++ b/include/linux/tee_drv.h
> @@ -82,6 +82,11 @@ struct tee_param_memref {
>  	struct tee_shm *shm;
>  };
>  
> +struct tee_param_ubuf {
> +	void * __user uaddr;
> +	size_t size;
> +};
> +
>  struct tee_param_value {
>  	u64 a;
>  	u64 b;
> @@ -92,6 +97,7 @@ struct tee_param {
>  	u64 attr;
>  	union {
>  		struct tee_param_memref memref;
> +		struct tee_param_ubuf ubuf;
>  		struct tee_param_value value;
>  	} u;
>  };
> diff --git a/include/uapi/linux/tee.h b/include/uapi/linux/tee.h
> index d0430bee8292..3e9b1ec5dfde 100644
> --- a/include/uapi/linux/tee.h
> +++ b/include/uapi/linux/tee.h
> @@ -151,6 +151,13 @@ struct tee_ioctl_buf_data {
>  #define TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_OUTPUT	6
>  #define TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INOUT	7	/* input and output */
>  
> +/*
> + * These defines userspace buffer parameters.
> + */
> +#define TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_INPUT	8
> +#define TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_OUTPUT	9
> +#define TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_INOUT	10	/* input and output */
> +
>  /*
>   * Mask for the type part of the attribute, leaves room for more types
>   */
> @@ -186,14 +193,17 @@ struct tee_ioctl_buf_data {
>  /**
>   * struct tee_ioctl_param - parameter
>   * @attr: attributes
> - * @a: if a memref, offset into the shared memory object, else a value parameter
> - * @b: if a memref, size of the buffer, else a value parameter
> + * @a: if a memref, offset into the shared memory object,
> + *     else if a ubuf, address of the user buffer,
> + *     else a value parameter
> + * @b: if a memref or ubuf, size of the buffer, else a value parameter
>   * @c: if a memref, shared memory identifier, else a value parameter
>   *
> - * @attr & TEE_PARAM_ATTR_TYPE_MASK indicates if memref or value is used in
> - * the union. TEE_PARAM_ATTR_TYPE_VALUE_* indicates value and
> - * TEE_PARAM_ATTR_TYPE_MEMREF_* indicates memref. TEE_PARAM_ATTR_TYPE_NONE
> - * indicates that none of the members are used.
> + * @attr & TEE_PARAM_ATTR_TYPE_MASK indicates if memref, ubuf, or value is
> + * used in the union. TEE_PARAM_ATTR_TYPE_VALUE_* indicates value,
> + * TEE_PARAM_ATTR_TYPE_MEMREF_* indicates memref, and TEE_PARAM_ATTR_TYPE_UBUF_*
> + * indicates ubuf. TEE_PARAM_ATTR_TYPE_NONE indicates that none of the members
> + * are used.
>   *
>   * Shared memory is allocated with TEE_IOC_SHM_ALLOC which returns an
>   * identifier representing the shared memory object. A memref can reference
> 
> -- 
> 2.34.1
> 
