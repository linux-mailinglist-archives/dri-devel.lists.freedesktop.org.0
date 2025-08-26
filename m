Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34DDFB36EC4
	for <lists+dri-devel@lfdr.de>; Tue, 26 Aug 2025 17:52:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0D4B10E691;
	Tue, 26 Aug 2025 15:52:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="JGLVLMMH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B838310E691
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Aug 2025 15:52:29 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 9E8BA5C63F2;
 Tue, 26 Aug 2025 15:52:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A04CBC4CEF1;
 Tue, 26 Aug 2025 15:52:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756223543;
 bh=Xk1Dlrwmt/FVCoeY2SvxmUUDznt0F17TZQXVNjpXqaU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JGLVLMMH8ToLx3JZ3Wu5MMVqVpd3pqTHaNkGmbIW11w+Cctctg0L+EftbXxoqQp7M
 BkEtZ5E7mvulvAYs7ZyNCxi4QPewhNjI7788w5UEasFD/bUZUSrQvA4VkUXawbNu+w
 jw/ejM1zYsqaKpxR44FdQGFW+Iw/uooWovn1xpglrBqoYDv77E6VZS9AiMl3Ci0Pu4
 HveOQ3TLXDTgMa83RV1/NKHhnV3pNYObIF3mvg4Yjm8LgdUCiBKnaiB9lG1oSPp/ff
 JnjdXkx6QWQCDEAKFzgXuYKtH74rSfCeKSm611ugEfh6yZ2glKo//2Zj7Fk4iwEuUq
 aXp5m/y0d4Zlw==
Date: Tue, 26 Aug 2025 10:52:20 -0500
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
Subject: Re: [PATCH v8 06/11] firmware: qcom: scm: add support for object
 invocation
Message-ID: <itpdolgmxp4ofdv3vf2ghulo7slj5wjby2tvawehihwvenbep2@ub5sdgf6gxeh>
References: <20250820-qcom-tee-using-tee-ss-without-mem-obj-v8-0-7066680f138a@oss.qualcomm.com>
 <20250820-qcom-tee-using-tee-ss-without-mem-obj-v8-6-7066680f138a@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250820-qcom-tee-using-tee-ss-without-mem-obj-v8-6-7066680f138a@oss.qualcomm.com>
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

On Wed, Aug 20, 2025 at 04:38:53PM -0700, Amirreza Zarrabi wrote:
> diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
[..]
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
> +	u64 result, response_type;
> +	int ret;
> +
> +	/*
> +	 * Check if QTEE supports smcinvoke:
> +	 * This will fail due to invalid buffers, but first, it checks whether
> +	 * the call is supported in QTEE syscall handler.
> +	 * If not supported, -EIO is returned.
> +	 */
> +	ret = qcom_scm_qtee_invoke_smc(0, 0, 0, 0, &result, &response_type);
> +	if (ret == -EIO)
> +		return -EIO;
> +
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

Wouldn't this work instead of the alloc + parent + add?

	qtee_dev = platform_device_alloc_data(scm->dev, "qcomtee", -1, NULL, 0);
	if (IS_ERR(qtee_dev))
		return PTR_ERR(qtee_dev);

> +
> +	return devm_add_action_or_reset(scm->dev, qcom_scm_qtee_free, qtee_dev);
> +}
> +
>  /**
>   * qcom_scm_is_available() - Checks if SCM is available
>   */
> @@ -2326,6 +2450,16 @@ static int qcom_scm_probe(struct platform_device *pdev)
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
> +	dev_warn_probe(scm->dev, ret, "Failed to initialize qcomtee\n");

A successful boot of db410c (APQ8016) now has the following in the log:

[    0.161437] qcom_scm firmware:scm: error -EIO: Failed to initialize qcomtee

If the target doesn't implement qtee, I'd expect that you tell me that -
or preferably stay silent.

Looking at the other error conditions, we find -ENOMEM, for which you
should also avoid printing. In fact, I believe all other error paths of
qcom_scm_qtee_init() will have printed an error already (if not, please
move the error print to the place(s) where it's needed).

As you're ignoring the return value, please then also change the return
type of the function to void.

Regards,
Bjorn

> +
>  	return 0;
>  }
