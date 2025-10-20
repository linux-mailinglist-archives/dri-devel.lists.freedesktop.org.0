Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A38D3BF1C83
	for <lists+dri-devel@lfdr.de>; Mon, 20 Oct 2025 16:16:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C177410E455;
	Mon, 20 Oct 2025 14:16:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Or52ul8U";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C027C10E451
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Oct 2025 14:16:19 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-47112edf9f7so19157945e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Oct 2025 07:16:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1760969778; x=1761574578; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=Fh25uPGmMGtjwugJOpAW21MuxERzASNAZ/okxFq7s0w=;
 b=Or52ul8UjtBQCJw12nkASPUk1DBJjPBdlSMGqtJiYgPuWPdtTfsxlG5I1Uy94Eilda
 JCVxe7iloQvbaJyhILSxttZUVTdwNBIlZ+S/cIbFhWGjyX3AgnyPxeZTJFACMLWl/hva
 6nuYyCHMJac++vFcX64NMn6BEIxqO1XjjK98nm+n/N9FZh75DCYwz8jAjFhJW5bVNwCF
 aUhYIftH7MsCCz0lgbHke2Nw7EM6YK99IWucKaJ5Etoa9xv17SpHc1MEoUenbD/iIU3d
 RvQwkQbi6Q4vRtl8yXZ7cKQDTHJmVAeFqt0TqqgCV5TmHRfi4JkNEmV+Eog11zt2Rpfv
 EMow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760969778; x=1761574578;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=Fh25uPGmMGtjwugJOpAW21MuxERzASNAZ/okxFq7s0w=;
 b=KbXBbCelvBWACuO1o1SSpNr/eymUrlDxV51GsPGzPB1dHLS3RSIWb9QUfqVKQWcsJD
 6RCawEepv2OHCPYT5FLC+gCmQbFfIDGj8wx6sTrHfpJG9200QucWd7OKKvgA68T6oDdc
 h45RTXM1Vd0sZk8cul7ds21uflo6DMyLpA0BgHCpyT4MJIqyEkvQDPEyEezgClJ3gEyY
 z4RPbitmA747aZr44+KdoriY751skP4/f8Yq3C7NEsUTkwxZPyPoXFAnatIG3+Ik1zJt
 R4zFU2dJ57MYOavUss34nfa5JaJBkY5wNJVF1t6CyGajOJnnWDcwZYP3g3hWAFBusxwq
 csLA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXA2amCJEhqItK6fr0iCIdKtEWTajfrV6Zz6r1u603po0BRsk1O0z2eQunhqTjfwqHznQ2sqKRzkF0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz5czV5SqFcFhoZQPQDo3Ga4cfhC/QrpHFBnx5fzWKu0yukt/lC
 qAGcQZW6ibIsYZ9UQENqTQjEEnR/x1MxfHyoAwS91YXsuqkcWVqeIrPSO7ME1TW3z5Q=
X-Gm-Gg: ASbGncv0UQT3CrOimCzvPaSEriB3gsCwQhqxK06fi20Dq+KJwq4Jg/zCjEEJ70awORD
 EfN8vUy8dMfgw5auXIpfc2GlbyyCR8+EdUKhPX8+Qz/Xk6RXeqc2nR23LXKLqudpVLrk1/+VL0G
 bqu7xqOek7zyWnQln7iJSCRbw2aDniTvRG0Jc1HuCveirzoR8N9pFrnf3VbgpWXv/KJXPdV8SFD
 lQOGhfBcPah8EpkbJzWvlbcnDWQJgmDnah5OfdHu6VFg/XZtpO7X9f8Un/mKPsHBhJVccJQSA+L
 FXdNwZ8yIiw2yrhoXko51+DCZ2kBncdKM/WSqO0MGBvzkSB6V1h2YKtxVhThXZuEmSWIzAyPUyl
 2MNEndG99hiLKGgbubc+R4DKjEIqwwBYaVva+UH5bMaomLCVXiHYkQRXBtsnaP4SQapV/3hhn8J
 Tgj3Re+bjM5VOEFca8/6QDdNN7rmIDLced8zfXO4WyGFszbdC13Wwi1zuQ16kl
X-Google-Smtp-Source: AGHT+IH4rwpSS/RaY2Oa3ZwU3XyWBckH6u90hy8FRnIVp3cW7pD6Y7xTDa7CDM9oadtybkKsYlMFwg==
X-Received: by 2002:a05:600c:1907:b0:46e:206a:78cc with SMTP id
 5b1f17b1804b1-4711791c3b0mr110392435e9.28.1760969777956; 
 Mon, 20 Oct 2025 07:16:17 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:4f9c:f978:568:7b9c?
 ([2a01:e0a:3d9:2080:4f9c:f978:568:7b9c])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4711442d3ddsm228773055e9.5.2025.10.20.07.16.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Oct 2025 07:16:17 -0700 (PDT)
Message-ID: <e87a6ea4-dc88-485c-bee3-1d2e99081b6f@linaro.org>
Date: Mon, 20 Oct 2025 16:16:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2] drm/msm/dpu: Filter modes based on adjusted mode clock
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Rob Clark <robdclark@gmail.com>, Dmitry Baryshkov <lumag@kernel.org>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20250506-filter-modes-v2-1-c20a0b7aa241@oss.qualcomm.com>
 <1b783a60-39c7-49b5-8932-e77230f6cddd@linaro.org>
 <88f04334-8d73-4ced-9c46-e69c3e6cbc72@oss.qualcomm.com>
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
In-Reply-To: <88f04334-8d73-4ced-9c46-e69c3e6cbc72@oss.qualcomm.com>
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

On 10/20/25 16:15, Konrad Dybcio wrote:
> On 10/20/25 4:05 PM, neil.armstrong@linaro.org wrote:
>> Hi,
>>
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
>>
>> This change breaks the T14s OLED display, no modes are reported on the eDP connector.
>> msm_dpu ae01000.display-controller: [drm:update_display_info.part.0 [drm]] [CONNECTOR:41:eDP-1] Assigning EDID-1.4 digital sink color depth as 10 bpc.
>> msm_dpu ae01000.display-controller: [drm:update_display_info.part.0 [drm]] [CONNECTOR:41:eDP-1] ELD monitor
>> msm_dpu ae01000.display-controller: [drm:update_display_info.part.0 [drm]] [CONNECTOR:41:eDP-1] ELD size 20, SAD count 0
>> [drm:drm_mode_object_put.part.0 [drm]] OBJ ID: 113 (1)
>> msm_dpu ae01000.display-controller: [drm:drm_mode_prune_invalid [drm]] Rejected mode: "2880x1800": 120 652260 2880 2912 2920 2980 1800 1808 1816 1824 0x48 0x9 (CLOCK_HIGH)
>> msm_dpu ae01000.display-controller: [drm:drm_mode_prune_invalid [drm]] Rejected mode: "2880x1800": 60 652260 2880 2888 2920 2980 1800 1808 1816 3648 0x40 0x9 (CLOCK_HIGH)
>>
>> With this reverted on v6.18-rc, display works again.
> 
> https://lore.kernel.org/linux-arm-msm/20250923-modeclk-fix-v2-1-01fcd0b2465a@oss.qualcomm.com/

Thanks,
Neil

> 
> Konrad

