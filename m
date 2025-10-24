Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78BB3C05427
	for <lists+dri-devel@lfdr.de>; Fri, 24 Oct 2025 11:11:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73FA910E1A1;
	Fri, 24 Oct 2025 09:11:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="D/lg06mC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC14110E1A1
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Oct 2025 09:11:24 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-47117e75258so13719445e9.2
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Oct 2025 02:11:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761297083; x=1761901883; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=4sHf7DaVRvXThSGqd+JD4fjtwa2CQ9M1CafBcPaGRls=;
 b=D/lg06mCkCG+n552wfzdTkfz63SzQJW7Z6ZYETOmEp7HcQtnbXPYtXXTFX+G4C+WeX
 XkheRJ6RuDQIjtBhJNxERwmNRUP42CWYinktADRv9rUwqfwxlZRe3A88RT3Gv/V2ttR7
 dZSOSPKvk7JVrjHSIE7gFAn6XwPe3cTXQZGpSiffW5YyLA5nOdbLoEXzrY5MQom/15ID
 kd6yj2e4D9Lb0+/GIoBp/bKfZhy8YaBeOlrWKQLY+tzTHIAKxc7uOJm9E2HpZBMgv70J
 lmk/pBXuBm8liVDKcV+PhOx7orvKEAjUSwDh/AZYk+YCt0p2RbUC5dA0vJLagGjpCfkV
 kdJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761297083; x=1761901883;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=4sHf7DaVRvXThSGqd+JD4fjtwa2CQ9M1CafBcPaGRls=;
 b=w7azrWNumpK9BZzuA4iI40NWyPoXTksRKtjSUOAI3qAlVq31bQshrbDLH5c/j8uK7s
 mMJo7ZxWvJ5hUPSsBiN1iUpVXU+GEmArV2Z01nMr0KofPEs4fJMR9xzA+AeDvq0XuaUO
 l2iQXb+2Uu9OTftbG8AkfvmpaZWkZXsH25jnuQDQ/Lvjy8YFY/h4OXZgrISC8XeX98OX
 cbz0UQlvs4+9enR2syTDvR4+2aQmczsAsRS0uRWwOXCk9lxtThJtMo7u39f0/uefQybZ
 bxSq8d1wzdYChLCh4fLAYkap2s48Bcs6aKf3sKiHJI5uwOyigoxLA3O66kzLeAIa6i9s
 pb4w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVsnV8sbDCYsDoaFFYD/xPX3UW4S9AvFJgGu3LmXdff7jDu9MrGjDaKV47vHlP+AQIILcVLoOSBqfo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxP3d2Trc0BER777Vm43twKvHAj4TpVLZ5TYtUrbFIrGPB/iNMu
 hLFYFbgHCECd+b8lqZ5fbek3DPpMP2+jPW7ttmsum+XduKPM0Ynk9eAsEalD3ZT+bD0=
X-Gm-Gg: ASbGncs4uxZrUiZjma8MuotJ/fzJ7PoU/YdHm3PpXRNMBdDKDC+KN34uL1NTP6Pzjd+
 5GYl4OipMJ8/zOkrka0SyeGfF9il+JFqei4tIVVOky3Rer5fer7YfYX+MR9uwKX4fRYGSc7CO2d
 lP08GU57jzcpnbSQCtGipSxTW2e7M1cMy6+RXCPVTuuiNIlrLbmsuETBJ/NeAF4qYlpeYtUSHtI
 hqYO+lHAHC95nB9EUMKtoDnUdmOfgobL9bXEcSv4Bi5jn4vVe6yPXBD9hIOuMcMCxXo4qUa4RZ3
 xdfNXaTBpPhFmSGq3NLbmRFBlKts0OZ/814Z/AE7OdEinrOpTN01a0t/H3YidQ8WucawdcxMRvX
 A9kcbjkR6JpJ6P0zpLlSMXH25fEyvpjuRmrv6xTd+ejwmcJ9wBKBSDVMPBJeSvbTgqygIivB8Aw
 ttssAgai+U5LGpmap8qppK24ZTj+dvQ7tZNbVK4loU789AtGMI+PW/Ism6sVeR/aw=
X-Google-Smtp-Source: AGHT+IG251T5Qj3BqvF34o9YaMYzBuZbQcHBuf37b4a3JGAgb4AOgBBu3wgzWQl6UMZBIMPOtQ1JDA==
X-Received: by 2002:a05:600c:5296:b0:471:1774:3003 with SMTP id
 5b1f17b1804b1-475cb044f10mr45397935e9.29.1761297082977; 
 Fri, 24 Oct 2025 02:11:22 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:b4ee:479d:354c:6970?
 ([2a01:e0a:3d9:2080:b4ee:479d:354c:6970])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-475d8a38038sm2816935e9.16.2025.10.24.02.11.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Oct 2025 02:11:22 -0700 (PDT)
Message-ID: <bed92353-da4e-4447-97d2-10e8a333e4e0@linaro.org>
Date: Fri, 24 Oct 2025 11:11:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH RFC RFT] drm/msm: adreno: attach the GMU device to a driver
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20251022-topic-adreno-attach-gmu-to-driver-v1-1-999037f7c83e@linaro.org>
 <5d6e7303-cc57-4a50-a9ad-b45d3c89d045@oss.qualcomm.com>
 <25e829f8-60b2-4b69-8d57-ded846b5206a@linaro.org>
 <c79c55fb-3aaa-4256-a71b-fa86cd0166f7@oss.qualcomm.com>
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
In-Reply-To: <c79c55fb-3aaa-4256-a71b-fa86cd0166f7@oss.qualcomm.com>
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

On 10/24/25 10:55, Konrad Dybcio wrote:
> On 10/23/25 10:27 AM, Neil Armstrong wrote:
>> On 10/22/25 19:09, Konrad Dybcio wrote:
>>> On 10/22/25 2:44 PM, Neil Armstrong wrote:
>>>> Due to the sync_state is enabled by default in pmdomain & CCF since v6.17,
>>>> the GCC and GPUCC sync_state would stay pending, leaving the resources in
>>>> full performance:
>>>> gcc-x1e80100 100000.clock-controller: sync_state() pending due to 3d6a000.gmu
>>>> gpucc-x1e80100 3d90000.clock-controller: sync_state() pending due to 3d6a000.gmu
>>>
>>> Does this *actually* cause any harm, by the way?
>>
>> ?
>>
>>>
>>> For example on x1e, GMU refers to 2 GPU_CC GDSCs, GPU_CC refers
>>> to a pair of GCC clocks and GCC refers to VDD_CX
>>>
>>> and I see these prints, yet:
>>>
>>> /sys/kernel/debug/pm_genpd/gpu_cx_gdsc/current_state:off-0
>>> /sys/kernel/debug/pm_genpd/gpu_gx_gdsc/current_state:off-0
>>>
>>> /sys/kernel/debug/pm_genpd/cx/current_state:on
>>> /sys/kernel/debug/pm_genpd/cx/perf_state:256 # because of USB3 votes
>>>
>>> I'm not super sure where that sync_state comes from either (maybe
>>> dev_set_drv_sync_state in pmdomain/core?)
>>
>> The way we handle the GMU so far is wrong, it abuses the driver model.
>>
>> And this is a symptom, whatever the impact it has, it needs to be fixed
>> in a proper way.
>>
>> The sync_state is retained because the gmu device is never probed but
>> has some clocks and power domains attached to it, which is clearly wrong.
> 
> Yes I agree, however I'm only debating the commit message claims of
> 'leaving the resources in full performance', which doesn't seem to be
> true

OK so the wording may be a little bit extreme, perhaps something like:
the GCC and GPUCC sync_state would stay pending, leaving the unused
power domains enabled for the lifetime of the system.

Neil

> 
> Konrad

