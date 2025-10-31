Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5EADC23D89
	for <lists+dri-devel@lfdr.de>; Fri, 31 Oct 2025 09:38:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03F6F10E3AF;
	Fri, 31 Oct 2025 08:38:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="XwNrq2NZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C8DF10E044
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Oct 2025 08:38:19 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-3f99ac9acc4so1957924f8f.3
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Oct 2025 01:38:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761899898; x=1762504698; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=f6lvlxZOeNShZGHSRhU6n7ci4eXoYPRCi1nv1xhCxuA=;
 b=XwNrq2NZLuE6un+JbJJdzvVcwbqHCxIziSJsfUPz8m4jhRiQpiG2k6wpYX+Givvefa
 UnPPn43cKazdYVBLIZWWVwyYRat9BUm8+NkklODd1DsndGi80Z19z0+UHOquuy1zNmXz
 DTS0AjAfi9OhOMviRXluUOMT+k1umK0gu0tfKbaOmcE64Q171/k1kpuf6jlaiju62CDD
 P7FtYqpXAkos1DkMrWzqYcXDVvcQH4SMpEMxMDe75swjzwpb0CFiUzK7ATBgEnICCgQR
 513xaIM87i/hnC2gwn91tArzIv1F83ikQjbIoqt0wyShD8CdKVcA5nZXM1k8BkL7YeBl
 tDHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761899898; x=1762504698;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=f6lvlxZOeNShZGHSRhU6n7ci4eXoYPRCi1nv1xhCxuA=;
 b=cEh0De221dhpx/4PInp3pDcTvJu++m6GTKpuP5UtYpIEcftPITEJ3ulm7fPr3n8uWX
 Drr5Z2mq+QvGOHnU4whn2Gdg/tzY13IbPkYf2wmHPN/ZEPBylQjYQuWKiVZBUNmj1dYN
 Y8hJXa/N2/8gWRywi/6eYdX38kUpe5ndcAQnU4XmAS2q18Ba2W5s4ySLBLBlo6HCE6Ph
 x8hbq6hs4lPtZvltpZUkDYP6V55s/39IZOllrdYs7Kqp9YYTz7s69LLfXcz4fK/4OUnU
 GZIqHK+k7MCwKZTz393X2mwhbi04n4i5Xb9ib0J+msgaVSagha5xjOw7zXx8K69j1HtW
 Uh0Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUUetbHq2DN/T0f7Yw0FuZG7jrvrnXwTWoWPz4AxSsGWZYRhwsDVP9VnYi1Ooa3jiGwZUwHdF6ZGdg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxvyPSAqYieH2CH+F8edoUWcAZF0eqZAJzAxM6rNHNAN19ohlac
 dQOITqAJ4s40j2odI2LmpEFnS6LDIt/7Iz2vMUFSXeFODrqbk8Y2NROEldiBknjfn5Q=
X-Gm-Gg: ASbGncuVMLtOw3VdC9gSRwSThQtTLbpddA0EDg2kxUeisd2bh8Mzo22l09M7NMhYdJl
 M7WTRi6LmDO7PZjCotRL8oB50lQXOCbaKok08EtyIpPDnW1QM4qB/wC6U0WLUfsNOUNjoD9TJx4
 sJMc6ULrDL4ATX+2kVDL/C+WM6qL2gQmCLfrKz4IQgCR/r4T1XWQFzA+y2EKh+Jj4oOzFInvNuI
 GrR/uK4vHmdjpOkckTr8mKGuEa3mA+YWy2SOliseono04Elh2Iyh02NelyYf63DV03994fjQITV
 4iDFilpHlHczmxYDw0hueFEGbmguUczAmeFfW62CCVhk4DNwQLgbk+gJHDx/fFF73C7BAToUHnk
 z2Bxf24Me/qau0gnlHeL4NjJWq0jrFp7IYiGmX0yQN6VW4AZhByJH/+6B2LTdjZW2ma87QB96Cz
 RItVfNRCsR0yRSTDPqWy4Rw49TFKLjL6d5S8r2/T1pDTdL1sJIo74yBEDFH20+g2Q=
X-Google-Smtp-Source: AGHT+IErXLg/QmSgzOAE18wcz9HH6P7fSPY03Id1jjTfataBPrbX11spvWK9xxIDtFbQtBn/mPn0cA==
X-Received: by 2002:a05:6000:2489:b0:429:b751:7929 with SMTP id
 ffacd0b85a97d-429bd6ae1f4mr2336595f8f.45.1761899897805; 
 Fri, 31 Oct 2025 01:38:17 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:cad:2140:d967:2bcf:d2d0:b324?
 ([2a01:e0a:cad:2140:d967:2bcf:d2d0:b324])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429c13edc36sm2278703f8f.37.2025.10.31.01.38.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 31 Oct 2025 01:38:17 -0700 (PDT)
Message-ID: <f5041496-ee83-479a-995f-79b6952bcafe@linaro.org>
Date: Fri, 31 Oct 2025 09:38:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH RFC RFT] drm/msm: adreno: attach the GMU device to a driver
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
References: <20251022-topic-adreno-attach-gmu-to-driver-v1-1-999037f7c83e@linaro.org>
 <c8058713-b126-461b-8ae6-19c4574a8105@oss.qualcomm.com>
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
In-Reply-To: <c8058713-b126-461b-8ae6-19c4574a8105@oss.qualcomm.com>
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
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 10/30/25 22:29, Akhil P Oommen wrote:
> On 10/22/2025 6:14 PM, Neil Armstrong wrote:
>> Due to the sync_state is enabled by default in pmdomain & CCF since v6.17,
>> the GCC and GPUCC sync_state would stay pending, leaving the resources in
>> full performance:
>> gcc-x1e80100 100000.clock-controller: sync_state() pending due to 3d6a000.gmu
>> gpucc-x1e80100 3d90000.clock-controller: sync_state() pending due to 3d6a000.gmu
>>
>> In order to fix this state and allow the GMU to be properly
>> probed, let's add a proper driver for the GMU and add it to
>> the MSM driver components.
>>
>> Only the proper GMU has been tested since I don't have
>> access to hardware with a GMU wrapper.
>>
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>> ---
>>   drivers/gpu/drm/msm/adreno/a6xx_gmu.c      | 354 ++++++++++++++---------------
>>   drivers/gpu/drm/msm/adreno/a6xx_gpu.c      |   6 -
>>   drivers/gpu/drm/msm/adreno/a6xx_gpu.h      |   3 -
>>   drivers/gpu/drm/msm/adreno/adreno_device.c |   4 +
>>   drivers/gpu/drm/msm/adreno/adreno_gpu.h    |   4 +
>>   drivers/gpu/drm/msm/msm_drv.c              |  16 +-
>>   6 files changed, 192 insertions(+), 195 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>> index fc62fef2fed8..6e7c3e627509 100644
>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>> @@ -1859,11 +1859,14 @@ void a6xx_gmu_sysprof_setup(struct msm_gpu *gpu)
>>   	pm_runtime_put(&gpu->pdev->dev);
>>   }
>>   
>> -void a6xx_gmu_remove(struct a6xx_gpu *a6xx_gpu)
>> +static void a6xx_gmu_unbind(struct device *dev, struct device *master, void *data)
>>   {
> 
> I feel we should keep gmu and gmu_wrapper implementations separate. It
> is already overloaded. How about adding a separate gmu_wrapper_bind_ops
> and keep it in the match data?

Good idea, will try something like that.

> 
>> -	struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
>> +	struct platform_device *pdev = to_platform_device(dev);
>> +	struct msm_drm_private *priv = dev_get_drvdata(master);
>> +	struct msm_gpu *gpu = priv->gpu;
> 
> << snip >>
> 
>>   static inline uint32_t get_wptr(struct msm_ringbuffer *ring)
>>   {
>> diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
>> index 7e977fec4100..0618da7e8b40 100644
>> --- a/drivers/gpu/drm/msm/msm_drv.c
>> +++ b/drivers/gpu/drm/msm/msm_drv.c
>> @@ -998,18 +998,30 @@ static const struct of_device_id msm_gpu_match[] = {
>>   	{ },
>>   };
>>   
>> +static const struct of_device_id msm_gmu_match[] = {
>> +	{ .compatible = "qcom,adreno-gmu" },
>> +	{ .compatible = "qcom,adreno-gmu-wrapper" },
>> +	{ },
>> +};
>> +
>>   static int add_gpu_components(struct device *dev,
>>   			      struct component_match **matchptr)
>>   {
>> -	struct device_node *np;
>> +	struct device_node *np, *gmu;
>>   
>>   	np = of_find_matching_node(NULL, msm_gpu_match);
>>   	if (!np)
>>   		return 0;
>>   
>> -	if (of_device_is_available(np) && adreno_has_gpu(np))
>> +	if (of_device_is_available(np) && adreno_has_gpu(np)) {
>>   		drm_of_component_match_add(dev, matchptr, component_compare_of, np);
>>   
>> +		gmu = of_find_matching_node(NULL, msm_gmu_match);
> 
> Instead of this, we can probably use the gmu phandle from "qcom,gmu"
> property? That is quicker and also doesn't assume that there is only a
> single GPU.

Ack you're right, let's do this since we have the GPU node already.

> 
>> +		if (of_device_is_available(gmu))
>> +			drm_of_component_match_add(dev, matchptr, component_compare_of, gmu);
>> +		of_node_put(gmu);
> I think you missed the recently added headless support. Please check
> separate_gpu_kms modparam and msm_gpu_probe().

I saw it but seems I probably forgot the check if it's still functional,
will double check.

Thanks,
Neil

> 
> -Akhil
> 
>> +	}
>> +
>>   	of_node_put(np);
>>   
>>   	return 0;
>>
>> ---
>> base-commit: 211ddde0823f1442e4ad052a2f30f050145ccada
>> change-id: 20251022-topic-adreno-attach-gmu-to-driver-e47025fd7ebb
>>
>> Best regards,

