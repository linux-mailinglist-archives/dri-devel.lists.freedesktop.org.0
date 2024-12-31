Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25C289FEE9A
	for <lists+dri-devel@lfdr.de>; Tue, 31 Dec 2024 10:49:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD4A310E62A;
	Tue, 31 Dec 2024 09:49:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="qMawAHvU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 073C010E62A
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Dec 2024 09:49:05 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-4361fe642ddso104518855e9.2
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Dec 2024 01:49:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1735638483; x=1736243283; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=HeRwnqhfF+7/JAAgCsoF3hFLXg3W1APinrWGayK28XY=;
 b=qMawAHvU8GjtGDJ7fWIeIN4UmwjiMKR6c6iVf8PyLcED2pkcIXjZIrZGPu67tSij17
 XOk75YqxeSuunSd7RmjDdZPzkyjJIJTyPt0d3h2P7azoNu4nftfFyHkE2SocNR5f/cmk
 K6PZTlpFKPuFzUgMrZfh5Gx6NOllk8AjF7PZCL/mTiaLEg1m0/u/x71cWlqY2DsHb+7g
 DFH3yoa9cjoXhJfj+YwIJMfDjPrH7WYttEKtK6we59YIa8qSy3tO+QLieee9sKfX3hVq
 4l9XpQQvmlNMf4HIJgIiDDrVklurz5ioWlEYku/olSYKJ6QaRCcsU34jVw3sshcbI3ml
 IqLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735638483; x=1736243283;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=HeRwnqhfF+7/JAAgCsoF3hFLXg3W1APinrWGayK28XY=;
 b=K0tOMoqYWpc6lrIab9Sibyp4csAUmUuoFuGtcJeopvNpnnGDbp4NxQwnYSb2vicd5n
 yLnf5bBg78k9qf6mRHoNJ+zMdY2ECKmtXrf2rweKJK4BEarEf2m2pEY9a5rfb3iVo2dq
 903DVPLw0MGChrIb7XP86D+pvNQxdczQ2k858a+36dN9AqgHjrNJyNxbzrjpu9D8/0U2
 KvhMNX5LjLDvt5sWoXSvYzcPohoo4/LKkOW080niAu/YCAJZ15HqPsEPdE/0iecGc49k
 nqLwW0ZtfnUKn2BCUIoEcMUjfV6B0qP1BKtuUlUYqYTsjlbVdBhj8OWss+7IKhTaTfky
 AXzg==
X-Forwarded-Encrypted: i=1;
 AJvYcCURYmzAGGF5wGz+bz3n2gW5hsgg/6/LaMrSTLItdIRtfaUsBz6e1FQ2bTGH4/yYxmBRXGZQ/iGdBaM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx79zwKL19gcSeoGBBkC83MJ3P39M4znuH0ZBAYmg2gfEcL9dcH
 L4JTwN7L47BwP8EgrjU9gwwO9xCbekVT2fI0jGP04s4SezpedIshADEsTkq3980=
X-Gm-Gg: ASbGnctcCG9jf3IQLil0RJAkEwm1dGnaLVB0MGY5l64uee6Vpx+i5Rzm8YuxlTaD+x0
 9Fii5YTVDDHOCUcE0WSF5Uw/jVdkhLYfgv3yKglOHZzY+kr69lNwkQ25UlxJ1j2FpT+zvc/o+mr
 fQlZ5Tbj4mrZD3tFQFxzBCMxD2Z2YvoSVgkohbvfIv3uacVLWCIR2l6pecEqqT8weKGtiC9qGsW
 Clw7TA0OJ/XDO69ORAhfj1J376qEEjFb6tgLu4cU1X2WFpjIJMTTr0905/xLRzz3kWDJ40gEKDQ
 JJVQewqk8Sqy7jXOQB3K9rD+d+5u1E58Zw==
X-Google-Smtp-Source: AGHT+IEGg6YSZQT43oiZ32HhVcPdM98GCfS5GJPSKrOlCvZn4fYTA3U+3B7+/7dEhUB5UITV+Oy6hA==
X-Received: by 2002:a05:600c:35cb:b0:434:a386:6cf with SMTP id
 5b1f17b1804b1-43668548b49mr298952635e9.2.1735638482765; 
 Tue, 31 Dec 2024 01:48:02 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:add3:e25d:7204:9ee5?
 ([2a01:e0a:982:cbb0:add3:e25d:7204:9ee5])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4366127c4b0sm383297725e9.35.2024.12.31.01.48.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 31 Dec 2024 01:48:01 -0800 (PST)
Message-ID: <ae360497-84d5-4153-8bc4-b3943fb30dc5@linaro.org>
Date: Tue, 31 Dec 2024 10:48:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH v3 1/6] drm/msm/adreno: Add support for ACD
To: Akhil P Oommen <quic_akhilpo@quicinc.com>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, devicetree@vger.kernel.org
References: <20241231-gpu-acd-v3-0-3ba73660e9ca@quicinc.com>
 <20241231-gpu-acd-v3-1-3ba73660e9ca@quicinc.com>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <20241231-gpu-acd-v3-1-3ba73660e9ca@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Reply-To: neil.armstrong@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 30/12/2024 22:11, Akhil P Oommen wrote:
> ACD a.k.a Adaptive Clock Distribution is a feature which helps to reduce
> the power consumption. In some chipsets, it is also a requirement to
> support higher GPU frequencies. This patch adds support for GPU ACD by
> sending necessary data to GMU and AOSS. The feature support for the
> chipset is detected based on devicetree data.
> 
> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> ---
>   drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 84 ++++++++++++++++++++++++++++++-----
>   drivers/gpu/drm/msm/adreno/a6xx_gmu.h |  1 +
>   drivers/gpu/drm/msm/adreno/a6xx_hfi.c | 36 +++++++++++++++
>   drivers/gpu/drm/msm/adreno/a6xx_hfi.h | 21 +++++++++
>   4 files changed, 132 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> index 14db7376c712..2689e79aefa5 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> @@ -1021,14 +1021,6 @@ int a6xx_gmu_resume(struct a6xx_gpu *a6xx_gpu)
>   
>   	gmu->hung = false;
>   
> -	/* Notify AOSS about the ACD state (unimplemented for now => disable it) */
> -	if (!IS_ERR(gmu->qmp)) {
> -		ret = qmp_send(gmu->qmp, "{class: gpu, res: acd, val: %d}",
> -			       0 /* Hardcode ACD to be disabled for now */);
> -		if (ret)
> -			dev_err(gmu->dev, "failed to send GPU ACD state\n");
> -	}
> -
>   	/* Turn on the resources */
>   	pm_runtime_get_sync(gmu->dev);
>   
> @@ -1476,6 +1468,68 @@ static int a6xx_gmu_pwrlevels_probe(struct a6xx_gmu *gmu)
>   	return a6xx_gmu_rpmh_votes_init(gmu);
>   }
>   
> +static int a6xx_gmu_acd_probe(struct a6xx_gmu *gmu)
> +{
> +	struct a6xx_gpu *a6xx_gpu = container_of(gmu, struct a6xx_gpu, gmu);
> +	struct a6xx_hfi_acd_table *cmd = &gmu->acd_table;
> +	struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
> +	struct msm_gpu *gpu = &adreno_gpu->base;
> +	int ret, i, cmd_idx = 0;
> +
> +	cmd->version = 1;
> +	cmd->stride = 1;
> +	cmd->enable_by_level = 0;
> +
> +	/* Skip freq = 0 and parse acd-level for rest of the OPPs */
> +	for (i = 1; i < gmu->nr_gpu_freqs; i++) {
> +		struct dev_pm_opp *opp;
> +		struct device_node *np;
> +		unsigned long freq;
> +		u32 val;
> +
> +		freq = gmu->gpu_freqs[i];
> +		opp = dev_pm_opp_find_freq_exact(&gpu->pdev->dev, freq, true);
> +		np = dev_pm_opp_get_of_node(opp);
> +
> +		ret = of_property_read_u32(np, "qcom,opp-acd-level", &val);
> +		of_node_put(np);
> +		dev_pm_opp_put(opp);
> +		if (ret == -EINVAL)
> +			continue;
> +		else if (ret) {
> +			DRM_DEV_ERROR(gmu->dev, "Unable to read acd level for freq %lu\n", freq);
> +			return ret;
> +		}
> +
> +		cmd->enable_by_level |= BIT(i);
> +		cmd->data[cmd_idx++] = val;
> +	}
> +
> +	cmd->num_levels = cmd_idx;
> +
> +	/* It is a problem if qmp node is unavailable when ACD is required */
> +	if (cmd->enable_by_level && IS_ERR_OR_NULL(gmu->qmp)) {
> +		DRM_DEV_ERROR(gmu->dev, "Unable to send ACD state to AOSS\n");
> +		return -EINVAL;
> +	}
> +
> +	/* Otherwise, nothing to do if qmp is unavailable */
> +	if (IS_ERR_OR_NULL(gmu->qmp))
> +		return 0;
> +
> +	/*
> +	 * Notify AOSS about the ACD state. AOSS is supposed to assume that ACD is disabled on
> +	 * system reset. So it is harmless if we couldn't notify 'OFF' state
> +	 */
> +	ret = qmp_send(gmu->qmp, "{class: gpu, res: acd, val: %d}", !!cmd->enable_by_level);
> +	if (ret && cmd->enable_by_level) {
> +		DRM_DEV_ERROR(gmu->dev, "Failed to send ACD state to AOSS\n");
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
>   static int a6xx_gmu_clocks_probe(struct a6xx_gmu *gmu)
>   {
>   	int ret = devm_clk_bulk_get_all(gmu->dev, &gmu->clocks);
> @@ -1793,7 +1847,7 @@ int a6xx_gmu_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
>   	gmu->qmp = qmp_get(gmu->dev);
>   	if (IS_ERR(gmu->qmp) && adreno_is_a7xx(adreno_gpu)) {
>   		ret = PTR_ERR(gmu->qmp);
> -		goto remove_device_link;
> +		goto detach_gxpd;
>   	}
>   
>   	init_completion(&gmu->pd_gate);
> @@ -1809,6 +1863,10 @@ int a6xx_gmu_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
>   	/* Get the power levels for the GMU and GPU */
>   	a6xx_gmu_pwrlevels_probe(gmu);
>   
> +	ret = a6xx_gmu_acd_probe(gmu);
> +	if (ret)
> +		goto detach_gxpd;
> +
>   	/* Set up the HFI queues */
>   	a6xx_hfi_init(gmu);
>   
> @@ -1819,7 +1877,13 @@ int a6xx_gmu_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
>   
>   	return 0;
>   
> -remove_device_link:
> +detach_gxpd:
> +	if (!IS_ERR_OR_NULL(gmu->gxpd))
> +		dev_pm_domain_detach(gmu->gxpd, false);
> +
> +	if (!IS_ERR_OR_NULL(gmu->qmp))
> +		qmp_put(gmu->qmp);
> +
>   	device_link_del(link);
>   
>   detach_cxpd:
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
> index b4a79f88ccf4..87d225b08e9b 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
> @@ -81,6 +81,7 @@ struct a6xx_gmu {
>   	int nr_gpu_freqs;
>   	unsigned long gpu_freqs[16];
>   	u32 gx_arc_votes[16];
> +	struct a6xx_hfi_acd_table acd_table;
>   
>   	int nr_gmu_freqs;
>   	unsigned long gmu_freqs[4];
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_hfi.c b/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
> index cb8844ed46b2..3c183c1c6266 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
> @@ -702,6 +702,38 @@ static int a6xx_hfi_send_bw_table(struct a6xx_gmu *gmu)
>   		NULL, 0);
>   }
>   
> +#define HFI_FEATURE_ACD 12
> +
> +static int a6xx_hfi_enable_acd(struct a6xx_gmu *gmu)
> +{
> +	struct a6xx_hfi_acd_table *acd_table = &gmu->acd_table;
> +	struct a6xx_hfi_msg_feature_ctrl msg = {
> +		.feature = HFI_FEATURE_ACD,
> +		.enable = 1,
> +		.data = 0,
> +	};
> +	int ret;
> +
> +	if (!acd_table->enable_by_level)
> +		return 0;
> +
> +	/* Enable ACD feature at GMU */
> +	ret = a6xx_hfi_send_msg(gmu, HFI_H2F_FEATURE_CTRL, &msg, sizeof(msg), NULL, 0);
> +	if (ret) {
> +		DRM_DEV_ERROR(gmu->dev, "Unable to enable ACD (%d)\n", ret);
> +		return ret;
> +	}
> +
> +	/* Send ACD table to GMU */
> +	ret = a6xx_hfi_send_msg(gmu, HFI_H2F_MSG_ACD, &msg, sizeof(msg), NULL, 0);


Seems you still don't send the proper acd_table

Neil

> +	if (ret) {
> +		DRM_DEV_ERROR(gmu->dev, "Unable to ACD table (%d)\n", ret);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
>   static int a6xx_hfi_send_test(struct a6xx_gmu *gmu)
>   {
>   	struct a6xx_hfi_msg_test msg = { 0 };
> @@ -799,6 +831,10 @@ int a6xx_hfi_start(struct a6xx_gmu *gmu, int boot_state)
>   	if (ret)
>   		return ret;
>   
> +	ret = a6xx_hfi_enable_acd(gmu);
> +	if (ret)
> +		return ret;
> +
>   	ret = a6xx_hfi_send_core_fw_start(gmu);
>   	if (ret)
>   		return ret;
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_hfi.h b/drivers/gpu/drm/msm/adreno/a6xx_hfi.h
> index 528110169398..51864c8ad0e6 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_hfi.h
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_hfi.h
> @@ -151,12 +151,33 @@ struct a6xx_hfi_msg_test {
>   	u32 header;
>   };
>   
> +#define HFI_H2F_MSG_ACD 7
> +#define MAX_ACD_STRIDE 2
> +
> +struct a6xx_hfi_acd_table {
> +	u32 header;
> +	u32 version;
> +	u32 enable_by_level;
> +	u32 stride;
> +	u32 num_levels;
> +	u32 data[16 * MAX_ACD_STRIDE];
> +};
> +
>   #define HFI_H2F_MSG_START 10
>   
>   struct a6xx_hfi_msg_start {
>   	u32 header;
>   };
>   
> +#define HFI_H2F_FEATURE_CTRL 11
> +
> +struct a6xx_hfi_msg_feature_ctrl {
> +	u32 header;
> +	u32 feature;
> +	u32 enable;
> +	u32 data;
> +};
> +
>   #define HFI_H2F_MSG_CORE_FW_START 14
>   
>   struct a6xx_hfi_msg_core_fw_start {
> 

