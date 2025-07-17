Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0118B0839C
	for <lists+dri-devel@lfdr.de>; Thu, 17 Jul 2025 05:58:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE6A710E69C;
	Thu, 17 Jul 2025 03:58:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="TZc6t/iO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0C2610E2E5;
 Thu, 17 Jul 2025 03:58:49 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 591585C56A3;
 Thu, 17 Jul 2025 03:58:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57E08C4CEE3;
 Thu, 17 Jul 2025 03:58:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1752724728;
 bh=OuzF5v3J010RWFCaX1BImq3F2ytx3Yt7cAPBVFMCgwA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TZc6t/iOUPrx1jgNt6AXw3o4wPg1rnkVvRyhIbCAqIENC21mapwgWhtL0CRwS9Tdp
 osMfg81OVk1GlQ7YpnH/1b62mNW/JONAZsLyKLv6oEpkWPa4wpN8elDO6Nsj47AhK2
 zlBJuwMbLh/GiDesEYM98Nplw5bqxwvldyVQx4jRlxOHmkD80Yds5OSVs7t29INr7x
 p4mr+sAAcPF/IggBgdEAueqZr062YbKGHCzWDw3NldjkCa73n4CZiTXjr/88voHI8S
 UKdKAbElEjp1fLMJSCL6zSUWNsH37e7IphDxFQsF0rgxebYqCSNlsAYb6zrGx36iPF
 dVOoKtlvAXjKw==
Date: Wed, 16 Jul 2025 22:58:45 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, 
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] soc: qcom: ubwc: provide no-UBWC configuration
Message-ID: <i3fezbte3sdfs4sjbf3bahooodx3u5dyiiqee5cvns2xpbjhoy@cs2eyiwfpagk>
References: <20250706-ubwc-no-ubwc-v1-1-e39552aa04df@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250706-ubwc-no-ubwc-v1-1-e39552aa04df@oss.qualcomm.com>
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

On Sun, Jul 06, 2025 at 02:01:03PM +0300, Dmitry Baryshkov wrote:
> After the commit 45a2974157d2 ("drm/msm: Use the central UBWC config
> database") the MDSS driver errors out if UBWC database didn't provide it
> with the UBWC configuration. Make UBWC database return zero data for
> MSM8916 / APQ8016, MSM8974 / APQ8074, MSM8226 and MSM8939.
> 
> Fixes: 1924272b9ce1 ("soc: qcom: Add UBWC config provider")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Acked-by: Bjorn Andersson <andersson@kernel.org>

> ---
> Note: the driver is a part of drivers/soc, but as it got merged through
> drm/msm tree, this fix should also go through the drm/msm tree.
> ---
>  drivers/soc/qcom/ubwc_config.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/drivers/soc/qcom/ubwc_config.c b/drivers/soc/qcom/ubwc_config.c
> index bd0a98aad9f3b222abcf0a7af85a318caffa9841..df074520a8cae1a202a14ca094903bb1e7389066 100644
> --- a/drivers/soc/qcom/ubwc_config.c
> +++ b/drivers/soc/qcom/ubwc_config.c
> @@ -12,6 +12,10 @@
>  
>  #include <linux/soc/qcom/ubwc.h>
>  
> +static const struct qcom_ubwc_cfg_data no_ubwc_data = {
> +	/* no UBWC, no HBB */
> +};
> +
>  static const struct qcom_ubwc_cfg_data msm8937_data = {
>  	.ubwc_enc_version = UBWC_1_0,
>  	.ubwc_dec_version = UBWC_1_0,
> @@ -215,11 +219,17 @@ static const struct qcom_ubwc_cfg_data x1e80100_data = {
>  };
>  
>  static const struct of_device_id qcom_ubwc_configs[] __maybe_unused = {
> +	{ .compatible = "qcom,apq8016", .data = &no_ubwc_data },
> +	{ .compatible = "qcom,apq8074", .data = &no_ubwc_data },
>  	{ .compatible = "qcom,apq8096", .data = &msm8998_data },
> +	{ .compatible = "qcom,msm8226", .data = &no_ubwc_data },
> +	{ .compatible = "qcom,msm8916", .data = &no_ubwc_data },
>  	{ .compatible = "qcom,msm8917", .data = &msm8937_data },
>  	{ .compatible = "qcom,msm8937", .data = &msm8937_data },
> +	{ .compatible = "qcom,msm8939", .data = &no_ubwc_data },
>  	{ .compatible = "qcom,msm8953", .data = &msm8937_data },
>  	{ .compatible = "qcom,msm8956", .data = &msm8937_data },
> +	{ .compatible = "qcom,msm8974", .data = &no_ubwc_data },
>  	{ .compatible = "qcom,msm8976", .data = &msm8937_data },
>  	{ .compatible = "qcom,msm8996", .data = &msm8998_data },
>  	{ .compatible = "qcom,msm8998", .data = &msm8998_data },
> 
> ---
> base-commit: 8290d37ad2b087bbcfe65fa5bcaf260e184b250a
> change-id: 20250706-ubwc-no-ubwc-3c5919273e03
> 
> Best regards,
> -- 
> With best wishes
> Dmitry
> 
