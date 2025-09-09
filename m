Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF1B7B50064
	for <lists+dri-devel@lfdr.de>; Tue,  9 Sep 2025 16:58:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90EC610E761;
	Tue,  9 Sep 2025 14:58:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="CyBnTsH3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A84F10E761
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Sep 2025 14:58:05 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 200A660226;
 Tue,  9 Sep 2025 14:58:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76645C4CEF4;
 Tue,  9 Sep 2025 14:58:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1757429883;
 bh=AhYS1yMvT6UZY4gb3lSyTd7YEFXttTdUlw02kjzCzS8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=CyBnTsH3dRriP5kf2uS4+LiBcDagW9pxeN1obzP2gB0inxfxry/Tr2XjeGKUW34To
 T99k4lgGErOmGZ+5GPVORAWpL1vSJxJzxC80p4snLHbce4fxgizBofDswGSn5old7D
 gsiKG/wfauBHy+4x1ZIExll1W9M82wPu3zCrUo+lfQAd3CcPj5c6dr1Nx9ben30pVO
 sOLnRlunffd1xDbIzaJA6scW5bDrqNTizK5Nh2kNnJnjpJwmtDzYqVpXtlsjVarJFb
 YR8rsjMrb/2ZA1eH63dxmDTji8CxLgKB1K7qXwXE8HrAo/lfm1Lyf9HQ3Km/dHirQA
 rOZ2YeIhs9v1w==
Date: Tue, 9 Sep 2025 09:58:00 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Cc: Jens Wiklander <jens.wiklander@linaro.org>, 
 Sumit Garg <sumit.garg@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Apurupa Pattapu <quic_apurupa@quicinc.com>, 
 Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
 Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, 
 Harshal Dev <quic_hdev@quicinc.com>, linux-arm-msm@vger.kernel.org,
 op-tee@lists.trustedfirmware.org, 
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 linaro-mm-sig@lists.linaro.org, linux-doc@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v9 06/11] firmware: qcom: scm: add support for object
 invocation
Message-ID: <67c676glro2asxtavghtvczdjcvtxlb5yd6rg2y5ln7ahj2gfq@yqtkle5tnal6>
References: <20250901-qcom-tee-using-tee-ss-without-mem-obj-v9-0-a2af23f132d5@oss.qualcomm.com>
 <20250901-qcom-tee-using-tee-ss-without-mem-obj-v9-6-a2af23f132d5@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250901-qcom-tee-using-tee-ss-without-mem-obj-v9-6-a2af23f132d5@oss.qualcomm.com>
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

On Mon, Sep 01, 2025 at 09:55:53PM -0700, Amirreza Zarrabi wrote:
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
> Tested-by: Neil Armstrong <neil.armstrong@linaro.org>
> Tested-by: Harshal Dev <quic_hdev@quicinc.com>
> Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
> ---
>  drivers/firmware/qcom/qcom_scm.c       | 124 +++++++++++++++++++++++++++++++++
>  drivers/firmware/qcom/qcom_scm.h       |   7 ++
>  include/linux/firmware/qcom/qcom_scm.h |   6 ++
>  3 files changed, 137 insertions(+)
> 
> diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
> index edeae6cdcf31..739ee9819549 100644
> --- a/drivers/firmware/qcom/qcom_scm.c
> +++ b/drivers/firmware/qcom/qcom_scm.c
> @@ -2094,6 +2094,127 @@ static int qcom_scm_qseecom_init(struct qcom_scm *scm)
>  
>  #endif /* CONFIG_QCOM_QSEECOM */
>  
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
> +	if (response_type)
> +		*response_type = res.result[0];
> +
> +	if (result)
> +		*result = res.result[1];
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
> +	if (response_type)
> +		*response_type = res.result[0];
> +
> +	if (result)
> +		*result = res.result[1];
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
> +static void qcom_scm_qtee_init(struct qcom_scm *scm)
> +{
> +	struct platform_device *qtee_dev;
> +	u64 result, response_type;
> +	int ret;
> +
> +	/*
> +	 * Probe for smcinvoke support. This will fail due to invalid buffers,
> +	 * but first, it checks whether the call is supported in QTEE syscall
> +	 * handler. If it is not supported, -EIO is returned.
> +	 */
> +	ret = qcom_scm_qtee_invoke_smc(0, 0, 0, 0, &result, &response_type);
> +	if (ret == -EIO)
> +		return;
> +
> +	/* Setup QTEE interface device. */
> +	qtee_dev = platform_device_register_data(scm->dev, "qcomtee",
> +						 PLATFORM_DEVID_NONE, NULL, 0);
> +	if (IS_ERR(qtee_dev)) {
> +		dev_err(scm->dev, "qcomtee: register failed: %d\n",
> +			PTR_ERR(qtee_dev));

This isn't going to fail, and all expected paths that it would fail will
be -ENOMEM which already printed a warning. So, I'd suggest that you
resolve the LKP build warning by dropping the print.

> +		return;
> +	}
> +
> +	ret = devm_add_action_or_reset(scm->dev, qcom_scm_qtee_free, qtee_dev);
> +	if (ret)
> +		dev_err(scm->dev, "qcomtee: add action failed: %d\n", ret);

The only possible error here is -ENOMEM, so you can skip the print.

Regards,
Bjorn

> +}
> +
>  /**
>   * qcom_scm_is_available() - Checks if SCM is available
>   */
> @@ -2326,6 +2447,9 @@ static int qcom_scm_probe(struct platform_device *pdev)
>  	ret = qcom_scm_qseecom_init(scm);
>  	WARN(ret < 0, "failed to initialize qseecom: %d\n", ret);
>  
> +	/* Initialize the QTEE object interface. */
> +	qcom_scm_qtee_init(scm);
> +
>  	return 0;
>  }
>  
> diff --git a/drivers/firmware/qcom/qcom_scm.h b/drivers/firmware/qcom/qcom_scm.h
> index 0e8dd838099e..a56c8212cc0c 100644
> --- a/drivers/firmware/qcom/qcom_scm.h
> +++ b/drivers/firmware/qcom/qcom_scm.h
> @@ -156,6 +156,13 @@ int qcom_scm_shm_bridge_enable(struct device *scm_dev);
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
> index 0f667bf1d4d9..a55ca771286b 100644
> --- a/include/linux/firmware/qcom/qcom_scm.h
> +++ b/include/linux/firmware/qcom/qcom_scm.h
> @@ -175,4 +175,10 @@ static inline int qcom_scm_qseecom_app_send(u32 app_id,
>  
>  #endif /* CONFIG_QCOM_QSEECOM */
>  
> +int qcom_scm_qtee_invoke_smc(phys_addr_t inbuf, size_t inbuf_size,
> +			     phys_addr_t outbuf, size_t outbuf_size,
> +			     u64 *result, u64 *response_type);
> +int qcom_scm_qtee_callback_response(phys_addr_t buf, size_t buf_size,
> +				    u64 *result, u64 *response_type);
> +
>  #endif
> 
> -- 
> 2.34.1
> 
