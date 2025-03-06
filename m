Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0D57A54651
	for <lists+dri-devel@lfdr.de>; Thu,  6 Mar 2025 10:30:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3DBE10E923;
	Thu,  6 Mar 2025 09:30:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="JhYcXHuV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B637B10E923
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Mar 2025 09:30:26 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-390e3b3d432so234954f8f.2
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Mar 2025 01:30:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741253425; x=1741858225; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=z79m0LRwylL1TUcFIowHlysw5aOIkiMWOUVmjSLVUX0=;
 b=JhYcXHuVpeLxmQzTdNVxodq9TzkE4oyXjW/dnGAJJ9GQEUZxIzlAcIpyUo1pe7NwTm
 3iQwerAwuJ7fM7uCFPDNKpQ/I85n9stmOfDXYiNYTyzNSiEGnIi4cwGRVIvcnBwNGk8H
 aztKZ62TS0EHE7cywYDoxWoFZ12VVypPrpKgeGgg6fRbktRA4SsFGkzGkUMRAXLxinwF
 VlNXhj1GbQZx817hnLulH0nztxs3v2f+kUH8YKMKEAyxU2I22wZukYhIB6sjAglVUWdF
 kZuBRp2pJ7PaOL9o1T+cCl8YCJBk1avd21Biwmr4+shNhTe2UiZZbwYVLOTywv8UH23F
 cL0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741253425; x=1741858225;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=z79m0LRwylL1TUcFIowHlysw5aOIkiMWOUVmjSLVUX0=;
 b=EktZJLsF3Bs2SDyvE/h7eIEuDOQa/NvTX0R/26TwEMuCECCx+f60wESE0Wjd1Ja5dt
 Yw1/cy0DmejL6lv5JsptBSVziQhf5MSUkp18I1LvjQD4Y2oMs980Iv0m2hCN+9r/AZEJ
 e0kdiVuN3LSroxJSHNhYdLvfeQ57e80B8oioG3yaFR1MOJHEBDBjsBkyw+n5rQskrr4J
 KpMUwA+SydSZysy4oG1D5ubenUtDs4JTYs0uiCx0qnaZLahiZ2/BNiEDZdTbx38xAMoR
 r0XeDkLW+/3m5xI/VoPQJoYZnGor2tyu9TNo/E9Rqmuzle3rKTKNhSC2Kpzkijx7GRTu
 hdMw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUXngorqAU5ATpWD6Kx2zZ302Fd9AJ5WDdYqCfjfEbQl7Ju6OH1M6rUuyHuBq2S3VsqgKCRlLqwJjI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyYlh5t35kAcKuf9IZe7ST0tC245plMZt/CGq72DdhB91gs/zHT
 nhUimRjqL4vsqGH8RwiLB09MTLiEeQv3NAjogAJcQDc6dLrCUp0ncIUB94pmx+w=
X-Gm-Gg: ASbGncsNfJOtgq3INhr2RmebluuRswVy86RSyxKdiIdR3DLRD39FwWBxom/Pa9LbcHa
 XiPL39MtHQ4mEU2/3zHiDa1a5TdjWjhoOQiWhcEnc5YRFw5N9/0RM4XecqEzVaH4DtcnlfRkN8j
 aP0dlWibYHOYr0SVKQk4lISGHpmoaapUdlU906ojLCDf9fuyqe5u/qHgNkg8SF+YRoWsycJyvRh
 1eHxWDRZgmOVthU3xam+GByFGAQjMqn1ful5THi9BnTjCr/VRgYNk6B19NSEMAF8CiyPLMngHmf
 ocmT12udYwF0SMPImXAwXvSDslQcdqg8WC2zuhUeybBg/M62EbOtMsbZ
X-Google-Smtp-Source: AGHT+IGnpFmsJBY/qEamoUmfbMXLuOWckaWioHNi22rQde52T2IvnSzLx8zdUb49jRIT4IcdS2vy1A==
X-Received: by 2002:a05:6000:1f88:b0:390:ed04:a676 with SMTP id
 ffacd0b85a97d-3911f7491a1mr4619791f8f.22.1741253425200; 
 Thu, 06 Mar 2025 01:30:25 -0800 (PST)
Received: from [192.168.1.101] ([37.167.199.63])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3912c0e2b8bsm1440616f8f.64.2025.03.06.01.30.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Mar 2025 01:30:24 -0800 (PST)
Message-ID: <16130141-2cb0-4f28-b0ad-fee5be061dd3@linaro.org>
Date: Thu, 6 Mar 2025 10:30:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH 2/2] mailmap: remap all addresses to kernel.org alias
To: Dmitry Baryshkov <lumag@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Cc: freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250306-update-email-v1-0-9a231571e905@kernel.org>
 <20250306-update-email-v1-2-9a231571e905@kernel.org>
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
In-Reply-To: <20250306-update-email-v1-2-9a231571e905@kernel.org>
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

On 05/03/2025 23:44, Dmitry Baryshkov wrote:
> Remap all historical and non-historical entries to my kernel.org email.
> 
> Signed-off-by: Dmitry Baryshkov <lumag@kernel.org>
> ---
>   .mailmap | 9 +++++----
>   1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/.mailmap b/.mailmap
> index 01145c078838bf9348e8d0e5e48b7b0954248dc5..a5c80ef0b7800519f3124e0d85294f34d6b275ca 100644
> --- a/.mailmap
> +++ b/.mailmap
> @@ -198,10 +198,11 @@ Dengcheng Zhu <dzhu@wavecomp.com> <dengcheng.zhu@imgtec.com>
>   Dengcheng Zhu <dzhu@wavecomp.com> <dengcheng.zhu@mips.com>
>   <dev.kurt@vandijck-laurijssen.be> <kurt.van.dijck@eia.be>
>   Dikshita Agarwal <quic_dikshita@quicinc.com> <dikshita@codeaurora.org>
> -Dmitry Baryshkov <dbaryshkov@gmail.com>
> -Dmitry Baryshkov <dbaryshkov@gmail.com> <[dbaryshkov@gmail.com]>
> -Dmitry Baryshkov <dbaryshkov@gmail.com> <dmitry_baryshkov@mentor.com>
> -Dmitry Baryshkov <dbaryshkov@gmail.com> <dmitry_eremin@mentor.com>
> +Dmitry Baryshkov <lumag@kernel.org> <dbaryshkov@gmail.com>
> +Dmitry Baryshkov <lumag@kernel.org> <[dbaryshkov@gmail.com]>
> +Dmitry Baryshkov <lumag@kernel.org> <dmitry_baryshkov@mentor.com>
> +Dmitry Baryshkov <lumag@kernel.org> <dmitry_eremin@mentor.com>
> +Dmitry Baryshkov <lumag@kernel.org> <dmitry.baryshkov@linaro.org>
>   Dmitry Safonov <0x7f454c46@gmail.com> <dima@arista.com>
>   Dmitry Safonov <0x7f454c46@gmail.com> <d.safonov@partner.samsung.com>
>   Dmitry Safonov <0x7f454c46@gmail.com> <dsafonov@virtuozzo.com>
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
