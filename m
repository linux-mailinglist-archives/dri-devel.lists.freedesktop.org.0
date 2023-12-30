Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38020820325
	for <lists+dri-devel@lfdr.de>; Sat, 30 Dec 2023 01:12:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F325010E2EB;
	Sat, 30 Dec 2023 00:12:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1AB910E2EB
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Dec 2023 00:12:14 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-a235eb41251so825787266b.3
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Dec 2023 16:12:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1703895133; x=1704499933; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=wli4NoQY8VlNG56wC/hFOSwd6o8qeR4x0eMtWXnYdmQ=;
 b=SA3rf/ScGTwSqaxRhuOeswqqRN+FKytl4pPf2FoDIaDfgXAU5yy8IoelwFs0qLRi29
 4EUq0AVqqGLSk4N5kxPMGCDPSLTYccUOavMzlU6bdaGRNaqr+JE0DzM5U+6FAqP+ty3L
 dI3GPfJLcyqbdjEpxqKKl7pgLpexItZ4gDrwuI1+IfFmkckC1Ljxn65dU0d6FzkTI50O
 P6bh8CM+/dRpLTx9qrg1XSIRbLBsqKNCHVZ3le87ekMRz55mikYEqK59cvPxALwP4k83
 Z/8wRqUDCeSQE0pPOIqOpfJX+9TMjewkFtsPl70qHtr9P2yNN1ad7vvMBS5032tIhLkF
 tehA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703895133; x=1704499933;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wli4NoQY8VlNG56wC/hFOSwd6o8qeR4x0eMtWXnYdmQ=;
 b=n39ADQR5nMgXAmH3VyyDjvyYYsmsbf/891a1eRPRrlDiIVV3pplj/N92l5vw/Lrxu/
 tB+avuzLx0hVtXUyJP9jFB+MVrdftqlhov8mP6EE13uGZ8CrvdTiNuk85Vz3BpKaXeId
 rjkM3Bvh0Iwxo3gZK7iZkukOgnN7VVUyeucj1oSqZpw433i+c2cTiM+It2/DniUM1J2c
 hnL5iYDzyJLi+GJDY0sZxUAjmnZIAjoqcpC2S1/O+UwjisiV/LVdcqy1ouZq9hBDh1xN
 eejqtQ2M4W4NNhd2ikBoLet95mJ07rK6oR2NaM8+YBaRAeXV0+Id7enaY5rGC36JE0gm
 SnkQ==
X-Gm-Message-State: AOJu0YyfHQNGLwryH+P0jqURrU7XA3A0PDRenPpEl0GcrsbLBzCNgal9
 Qm1nveatSW2jL+EDw2gARJwjGyxNGVXUow==
X-Google-Smtp-Source: AGHT+IHZiC3cWCgcDM5IivmmRV2fLEapj83hqmUykJn7eVSI0oQ/gTSn3U43tM44wAyRS4KkNJn13A==
X-Received: by 2002:a17:906:3891:b0:a23:6edb:d394 with SMTP id
 q17-20020a170906389100b00a236edbd394mr3948964ejd.102.1703895133080; 
 Fri, 29 Dec 2023 16:12:13 -0800 (PST)
Received: from [192.168.199.125]
 (178235179036.dynamic-4-waw-k-1-3-0.vectranet.pl. [178.235.179.36])
 by smtp.gmail.com with ESMTPSA id
 d17-20020a170906175100b00a235b01886dsm8874452eje.10.2023.12.29.16.12.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Dec 2023 16:12:12 -0800 (PST)
Message-ID: <d6447285-5485-4a89-b8e9-43625f00f960@linaro.org>
Date: Sat, 30 Dec 2023 01:12:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/14] drm/msm/dp: fold dp_power into dp_ctrl module
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Sankeerth Billakanti <quic_sbillaka@quicinc.com>
References: <20231229225650.912751-1-dmitry.baryshkov@linaro.org>
 <20231229225650.912751-6-dmitry.baryshkov@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <20231229225650.912751-6-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, David Airlie <airlied@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 29.12.2023 23:56, Dmitry Baryshkov wrote:
> The dp_power submodule is limited to handling the clocks only following
> previous cleanups. Fold it into the dp_ctrl submodule, removing one
> unnecessary level of indirection.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
[...]

>  
> -	/* set dongle to D3 (power off) mode */
> +	/* set dongle to D3 (ctrl off) mode */
:thinking emoji:

[...]

> +int dp_ctrl_clk_enable(struct dp_ctrl *dp_ctrl,
> +		enum dp_pm_type pm_type, bool enable)
> +{
> +	int rc = 0;
> +	struct dp_ctrl_private *ctrl;
> +	struct dss_module_power *mp;
I haven't checked out the rest of the series yet, but cleaning
this up with rc->ret and reverse-Christmas-tree (merry late
Christmas!) would be nice

> +
> +	ctrl = container_of(dp_ctrl, struct dp_ctrl_private, dp_ctrl);
> +
> +	if (pm_type != DP_CORE_PM && pm_type != DP_CTRL_PM &&
> +			pm_type != DP_STREAM_PM) {
> +		DRM_ERROR("unsupported ctrl module: %s\n",
> +				dp_parser_pm_name(pm_type));
> +		return -EINVAL;
> +	}
> +
> +	if (enable) {
> +		if (pm_type == DP_CORE_PM && ctrl->core_clks_on) {
again, haven't yet looked through all the patches but this screams
"if (enable && pm_type == DP_CORE_PM)"


Konrad
