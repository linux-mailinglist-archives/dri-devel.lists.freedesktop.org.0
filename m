Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6B87AB67AE
	for <lists+dri-devel@lfdr.de>; Wed, 14 May 2025 11:37:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAD7C10E5FC;
	Wed, 14 May 2025 09:37:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="HpBpenUJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B89F10E2BC
 for <dri-devel@lists.freedesktop.org>; Wed, 14 May 2025 09:37:29 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 64613A4C85B;
 Wed, 14 May 2025 09:37:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0193C4CEEB;
 Wed, 14 May 2025 09:37:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1747215442;
 bh=avleXqFdRiHvr/nv0iuJrbDTjUHK6V3QXiYtGVW87k4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HpBpenUJfwFge/x8Pqj6VQG9zPiPfjmW9I+3aewe0J8ufh5Oy8t9z8i5D6DXzrVco
 25Hdku+wKOcb8AaMF/UVFwk3jC0VIDnN7RtUmYkQ1kQ7ReojJdAatHfzMj0JNs1lbU
 pNaKvpAxXi8reY1IsHoxn65gQGZZrGRSZ6pINFiJIebod1BRlzEs+54w0ePUTqwaVE
 a3VxZvR/FVtjwuDav1JUbeL3KUlo1W9Own5EnOcWEu0q1knabx8vPohF42tHxBQumx
 JrrKxeCNzNUAFej808sqGsnAwic6ZeFRSi57o+IepkdIH7TfGFWOMnCG/fb1xCY4FH
 xaIQZeP0H9EWQ==
Date: Wed, 14 May 2025 15:07:09 +0530
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
Subject: Re: [PATCH v4 05/11] firmware: qcom: scm: add support for object
 invocation
Message-ID: <aCRkRTMFi65zBODh@sumit-X1>
References: <20250428-qcom-tee-using-tee-ss-without-mem-obj-v4-0-6a143640a6cb@oss.qualcomm.com>
 <20250428-qcom-tee-using-tee-ss-without-mem-obj-v4-5-6a143640a6cb@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250428-qcom-tee-using-tee-ss-without-mem-obj-v4-5-6a143640a6cb@oss.qualcomm.com>
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

Hi Amir,

On Mon, Apr 28, 2025 at 11:06:26PM -0700, Amirreza Zarrabi wrote:
> Qualcomm TEE (QTEE) hosts Trusted Applications (TAs) and services in
> the secure world, accessed via objects. A QTEE client can invoke these
> objects to request services. Similarly, QTEE can request services from
> the nonsecure world using objects exported to the secure world.
> 
> Add low-level primitives to facilitate the invocation of objects hosted
> in QTEE, as well as those hosted in the nonsecure world.
> 
> If support for object invocation is available, the qcom_scm allocates
> a dedicated child platform device. The driver for this device communicates
> with QTEE using low-level primitives.
> 
> Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
> ---
>  drivers/firmware/qcom/qcom_scm.c       | 128 +++++++++++++++++++++++++++++++++
>  drivers/firmware/qcom/qcom_scm.h       |   7 ++
>  include/linux/firmware/qcom/qcom_scm.h |  27 +++++++
>  3 files changed, 162 insertions(+)
> 
> diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
> index fc4d67e4c4a6..bff1b0d3306e 100644
> --- a/drivers/firmware/qcom/qcom_scm.c
> +++ b/drivers/firmware/qcom/qcom_scm.c
> @@ -2084,6 +2084,124 @@ static int qcom_scm_qseecom_init(struct qcom_scm *scm)
>  
>  #endif /* CONFIG_QCOM_QSEECOM */
>  
> +#ifdef CONFIG_QCOMTEE
> +
> +/**
> + * qcom_scm_qtee_invoke_smc() - Invoke a QTEE object.
> + * @inbuf: start address of memory area used for inbound buffer.
> + * @inbuf_size: size of the memory area used for inbound buffer.
> + * @outbuf: start address of memory area used for outbound buffer.
> + * @outbuf_size: size of the memory area used for outbound buffer.
> + * @result: result of QTEE object invocation.
> + * @response_type: response type returned by QTEE.
> + *
> + * @response_type determines how the contents of @inbuf and @outbuf
> + * should be processed.
> + *
> + * Return: On success, return 0 or <0 on failure.
> + */
> +int qcom_scm_qtee_invoke_smc(phys_addr_t inbuf, size_t inbuf_size,
> +			     phys_addr_t outbuf, size_t outbuf_size,
> +			     u64 *result, u64 *response_type)
> +{
> +	struct qcom_scm_desc desc = {
> +		.svc = QCOM_SCM_SVC_SMCINVOKE,
> +		.cmd = QCOM_SCM_SMCINVOKE_INVOKE,
> +		.owner = ARM_SMCCC_OWNER_TRUSTED_OS,
> +		.args[0] = inbuf,
> +		.args[1] = inbuf_size,
> +		.args[2] = outbuf,
> +		.args[3] = outbuf_size,
> +		.arginfo = QCOM_SCM_ARGS(4, QCOM_SCM_RW, QCOM_SCM_VAL,
> +					 QCOM_SCM_RW, QCOM_SCM_VAL),
> +	};
> +	struct qcom_scm_res res;
> +	int ret;
> +
> +	ret = qcom_scm_call(__scm->dev, &desc, &res);
> +	if (ret)
> +		return ret;
> +
> +	*response_type = res.result[0];
> +	*result = res.result[1];
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL(qcom_scm_qtee_invoke_smc);
> +
> +/**
> + * qcom_scm_qtee_callback_response() - Submit response for callback request.
> + * @buf: start address of memory area used for outbound buffer.
> + * @buf_size: size of the memory area used for outbound buffer.
> + * @result: Result of QTEE object invocation.
> + * @response_type: Response type returned by QTEE.
> + *
> + * @response_type determines how the contents of @buf should be processed.
> + *
> + * Return: On success, return 0 or <0 on failure.
> + */
> +int qcom_scm_qtee_callback_response(phys_addr_t buf, size_t buf_size,
> +				    u64 *result, u64 *response_type)
> +{
> +	struct qcom_scm_desc desc = {
> +		.svc = QCOM_SCM_SVC_SMCINVOKE,
> +		.cmd = QCOM_SCM_SMCINVOKE_CB_RSP,
> +		.owner = ARM_SMCCC_OWNER_TRUSTED_OS,
> +		.args[0] = buf,
> +		.args[1] = buf_size,
> +		.arginfo = QCOM_SCM_ARGS(2, QCOM_SCM_RW, QCOM_SCM_VAL),
> +	};
> +	struct qcom_scm_res res;
> +	int ret;
> +
> +	ret = qcom_scm_call(__scm->dev, &desc, &res);
> +	if (ret)
> +		return ret;
> +
> +	*response_type = res.result[0];
> +	*result = res.result[1];
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL(qcom_scm_qtee_callback_response);
> +
> +static void qcom_scm_qtee_free(void *data)
> +{
> +	struct platform_device *qtee_dev = data;
> +
> +	platform_device_unregister(qtee_dev);
> +}
> +
> +static int qcom_scm_qtee_init(struct qcom_scm *scm)
> +{
> +	struct platform_device *qtee_dev;
> +	int ret;
> +

I am still unable to get the QCOMTEE driver to work on db845c. As I can
see machine: "qcom,sdm845" is not supported for tzmem based on SHM
brigde here: drivers/firmware/qcom/qcom_tzmem.c +81. I am still seeing
following logs from userspace:

# /mnt/unittest -d
[test_print_diagnostics_info][31] test_get_client_env_object.
[test_supplicant_release][65] test_supplicant_worker killed.

I think you should first check here for SHM bridge support. If available
then only add a QTEE platform device.

-Sumit

> +	/* Setup QTEE interface device. */
> +	qtee_dev = platform_device_alloc("qcomtee", -1);
> +	if (!qtee_dev)
> +		return -ENOMEM;
> +
> +	qtee_dev->dev.parent = scm->dev;
> +
> +	ret = platform_device_add(qtee_dev);
> +	if (ret) {
> +		platform_device_put(qtee_dev);
> +		return ret;
> +	}
> +
> +	return devm_add_action_or_reset(scm->dev, qcom_scm_qtee_free, qtee_dev);
> +}
> +
> +#else
> +
> +static int qcom_scm_qtee_init(struct qcom_scm *scm)
> +{
> +	return 0;
> +}
> +
> +#endif /* CONFIG_QCOMTEE */
> +
>  /**
>   * qcom_scm_is_available() - Checks if SCM is available
>   */
> @@ -2319,6 +2437,16 @@ static int qcom_scm_probe(struct platform_device *pdev)
>  	ret = qcom_scm_qseecom_init(scm);
>  	WARN(ret < 0, "failed to initialize qseecom: %d\n", ret);
>  
> +	/*
> +	 * Initialize the QTEE object interface.
> +	 *
> +	 * This only represents the availability for QTEE object invocation
> +	 * and callback support. On failure, ignore the result. Any subsystem
> +	 * depending on it may fail if it tries to access this interface.
> +	 */
> +	ret = qcom_scm_qtee_init(scm);
> +	WARN(ret < 0, "failed to initialize qcomtee: %d\n", ret);
> +
>  	return 0;
>  
>  err:
> diff --git a/drivers/firmware/qcom/qcom_scm.h b/drivers/firmware/qcom/qcom_scm.h
> index 097369d38b84..a25202e99f7c 100644
> --- a/drivers/firmware/qcom/qcom_scm.h
> +++ b/drivers/firmware/qcom/qcom_scm.h
> @@ -152,6 +152,13 @@ struct qcom_tzmem_pool *qcom_scm_get_tzmem_pool(void);
>  #define QCOM_SCM_SVC_GPU			0x28
>  #define QCOM_SCM_SVC_GPU_INIT_REGS		0x01
>  
> +/* ARM_SMCCC_OWNER_TRUSTED_OS calls */
> +
> +#define QCOM_SCM_SVC_SMCINVOKE			0x06
> +#define QCOM_SCM_SMCINVOKE_INVOKE_LEGACY	0x00
> +#define QCOM_SCM_SMCINVOKE_CB_RSP		0x01
> +#define QCOM_SCM_SMCINVOKE_INVOKE		0x02
> +
>  /* common error codes */
>  #define QCOM_SCM_V2_EBUSY	-12
>  #define QCOM_SCM_ENOMEM		-5
> diff --git a/include/linux/firmware/qcom/qcom_scm.h b/include/linux/firmware/qcom/qcom_scm.h
> index 983e1591bbba..bf5e64f6deba 100644
> --- a/include/linux/firmware/qcom/qcom_scm.h
> +++ b/include/linux/firmware/qcom/qcom_scm.h
> @@ -176,4 +176,31 @@ static inline int qcom_scm_qseecom_app_send(u32 app_id,
>  
>  #endif /* CONFIG_QCOM_QSEECOM */
>  
> +#ifdef CONFIG_QCOMTEE
> +
> +int qcom_scm_qtee_invoke_smc(phys_addr_t inbuf, size_t inbuf_size,
> +			     phys_addr_t outbuf, size_t outbuf_size,
> +			     u64 *result, u64 *response_type);
> +int qcom_scm_qtee_callback_response(phys_addr_t buf, size_t buf_size,
> +				    u64 *result, u64 *response_type);
> +
> +#else /* CONFIG_QCOMTEE */
> +
> +static inline int qcom_scm_qtee_invoke_smc(phys_addr_t inbuf, size_t inbuf_size,
> +					   phys_addr_t outbuf,
> +					   size_t outbuf_size, u64 *result,
> +					   u64 *response_type)
> +{
> +	return -EINVAL;
> +}
> +
> +static inline int qcom_scm_qtee_callback_response(phys_addr_t buf,
> +						  size_t buf_size, u64 *result,
> +						  u64 *response_type)
> +{
> +	return -EINVAL;
> +}
> +
> +#endif /* CONFIG_QCOMTEE */
> +
>  #endif
> 
> -- 
> 2.34.1
> 
> 
