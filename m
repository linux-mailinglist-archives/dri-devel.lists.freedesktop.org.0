Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4133C19697
	for <lists+dri-devel@lfdr.de>; Wed, 29 Oct 2025 10:40:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13FBA10E757;
	Wed, 29 Oct 2025 09:40:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="UnPN4LNL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF30910E757
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Oct 2025 09:40:28 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-471191ac79dso74235375e9.3
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Oct 2025 02:40:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761730827; x=1762335627; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=MpD8LIzdwjI+LuQZp/Ng/8pA8/EN8OIRE+rVL25JQdI=;
 b=UnPN4LNLXrXscAmq24sDSkTq2HcHluCflWElt4RbEs4U8W0WLPqCnT4VnlTNtrTL/+
 P5iCpQVrKbKEX/lJAyg6GsFWkeB0iGm99UXbnktOp2a3G3rrxC77FmiXGYPCVxNtGaob
 iQhan9Y27LP6DbTFu+Vf5E2j8ChaDiMJhIsgzvfENx+YNxICuscNsvW2cUer6iIa2I+q
 7OSCI41MP1BHsshuu3LwSjoNbRMvDfNWHi7GnyqjJSmBV24nfRmJNHownmVtwIzn7sH8
 jPSxTXgB1ADuuAfRxQMIpHE9XjTaKyjX+KRElmGpy+cnU7kwVj1s5n2TZAJtQ+voa6ce
 8qfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761730827; x=1762335627;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=MpD8LIzdwjI+LuQZp/Ng/8pA8/EN8OIRE+rVL25JQdI=;
 b=IxidIyNkNt6KXstv2xJL2sLa62V9KNK5jUvbmG87GX8mpgBTnRtyzfpHSEfZpC4/Tm
 AUFINdUoGbypcIhIekSeQNYKN+CTpqilA5SLP9foDRBfKkQukxB9iV6FDO4jx8LQneK0
 3uO/jIHl6McEL8E7zBul3+QvLiKaytybBgeUFvvFcf2nLizUczHnh35TPxDBYENWPD8B
 isEpjEwtd8LqsUBx/sxRl+R4XaDeMZAt/IppX5OmiZ2pf3eFOMttrGNLlRiGLoGq9oah
 SqIWyeTIZXZJsvqjNopjMA7nbhRRyL4CXq6xZyk/y+ThV9VJev1Z8vgbDa+/qxzhncyR
 v3pQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVNrYYIfl/I0Ebk2iZjfSrZ2G/tDqBdKDpYztSgpiB9nUwJvjltzjoI6CSA/dyeyVSGReZvOBBdZes=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzvhGG7HHOX7aT1xxC3eQSm/S59hIblCqvPNRu8GdyunPqvSjoE
 E/aZl//4yaLgnDUfoeDkX10aNOmhZhjdbqBZb0yYJRsbQB6u60APK0dvuppMoC2YZdk=
X-Gm-Gg: ASbGncsbMEBIP9KgkJcoQVYzZBnpYwhOmCB3iBx85v7bgMFQZ8XtAjo1DHCA4Bplo7K
 xjojkDS/01Mb2wgw9kkMuMS9O1Axv+p6/XGllPUMg+6eW+Av7q6TebpCfTuo4p8gG1iGJuVsoIL
 8/dj7XVSj22r6BV+ZkV1l/rrib5oiZUrLsF59JSMqy0wCcLNpGA5cd2CoClaA4xu9zzpYw1jZmf
 Gv1h1C7RAvTqMzDxiLPuUZqE8wU/mzrbCwOAr1D7Lgxtq0zTEJA92Y0Nsj9z4xyDuvXIX3iyp1n
 uRL6a/MfWDSckdkX3eJb0iNt/dlIB1/yQoKDN5Ss09aYquMI92PckI3Ge/+NI6suGEz/5rpL5ks
 mWXqVDjyHIJZhxEDZZzL7JcGi2X4qUK7CovfnQOBZYkNX3IelLkJIpmxIK5MvQ+uaLxzPIXWWBc
 97bU2uNM32gulgIoGxXCzQbO6O2JJ2+Ne423nEBH3BiTBbfU8OEw==
X-Google-Smtp-Source: AGHT+IGnoupx3oh4ehhHWev6na4HNe4UnW8e6EUSqdzNJvKIIl1nuletM5oT3QUF4LOjqh0ytQBULQ==
X-Received: by 2002:a05:600c:1d1c:b0:475:da1a:5418 with SMTP id
 5b1f17b1804b1-4771e1c9da8mr18311955e9.1.1761730827171; 
 Wed, 29 Oct 2025 02:40:27 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:cad:2140:3447:eb7a:cb9f:5e0?
 ([2a01:e0a:cad:2140:3447:eb7a:cb9f:5e0])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429952cb7e8sm25577436f8f.19.2025.10.29.02.40.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Oct 2025 02:40:26 -0700 (PDT)
Message-ID: <09cbf40d-6536-4bda-94d6-5b45a5746962@linaro.org>
Date: Wed, 29 Oct 2025 10:40:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2] drm/msm/dpu: Filter modes based on adjusted mode clock
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Rob Clark <robdclark@gmail.com>, Dmitry Baryshkov <lumag@kernel.org>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20250506-filter-modes-v2-1-c20a0b7aa241@oss.qualcomm.com>
 <6381550a-4c1a-429d-b6c1-8c7ae77bf325@linaro.org>
 <da56lghirjcwesz4usdlfpttwcmvoql2h6bvjommoyfskjdkgk@hrlgx4ukt4aa>
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
In-Reply-To: <da56lghirjcwesz4usdlfpttwcmvoql2h6bvjommoyfskjdkgk@hrlgx4ukt4aa>
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

On 10/28/25 20:52, Dmitry Baryshkov wrote:
> On Tue, Oct 28, 2025 at 09:42:57AM +0100, neil.armstrong@linaro.org wrote:
>> On 5/7/25 03:38, Jessica Zhang wrote:
>>> Filter out modes that have a clock rate greater than the max core clock
>>> rate when adjusted for the perf clock factor
>>>
>>> This is especially important for chipsets such as QCS615 that have lower
>>> limits for the MDP max core clock.
>>>
>>> Since the core CRTC clock is at least the mode clock (adjusted for the
>>> perf clock factor) [1], the modes supported by the driver should be less
>>> than the max core clock rate.
>>>
>>> [1] https://elixir.bootlin.com/linux/v6.12.4/source/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c#L83
>>>
>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
>>> ---
>>> Changes in v2:
>>> - *crtc_clock -> *mode_clock (Dmitry)
>>> - Changed adjusted_mode_clk check to use multiplication (Dmitry)
>>> - Switch from quic_* email to OSS email
>>> - Link to v1: https://lore.kernel.org/lkml/20241212-filter-mode-clock-v1-1-f4441988d6aa@quicinc.com/
>>> ---
>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 35 ++++++++++++++++++---------
>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h |  3 +++
>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c      | 12 +++++++++
>>>    3 files changed, 39 insertions(+), 11 deletions(-)
>>>
>>
>> This test doesn't take in account if the mode is for a bonded DSI mode, which
>> is the same mode on 2 interfaces doubled, but it's valid since we could literally
>> set both modes separately. In bonded DSI this mode_clk must be again divided bv 2
>> in addition to the fix:
>> https://lore.kernel.org/linux-arm-msm/20250923-modeclk-fix-v2-1-01fcd0b2465a@oss.qualcomm.com/
> 
>  From the docs:
> 
>           * Since this function is both called from the check phase of an atomic
>           * commit, and the mode validation in the probe paths it is not allowed
>           * to look at anything else but the passed-in mode, and validate it
>           * against configuration-invariant hardware constraints. Any further
>           * limits which depend upon the configuration can only be checked in
>           * @mode_fixup or @atomic_check.
> 
> Additionally, I don't think it is correct to divide mode_clk by two. In
> the end, the DPU processes the mode in a single pass, so the perf
> constrains applies as is, without additional dividers.

Sorry but this is not correct, the current check means nothing. If you
enable 2 separate DSI outputs or enable then in bonded mode, the DPU
processes it the same so the bonded doubled mode should be valid.

The difference between separate or bonded DSI DPU-wise is only the
synchronisation of vsyncs between interfaces.

So this check against the max frequency means nothing and should be
removed, but we should solely rely on the bandwidth calculation instead.

Neil

> 
> 
>> I'm trying to find a correct way to handle that, I have tried that:
>> ===========================><========================================
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
>> index 48c3aef1cfc2..6aa5db1996e3 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> 

