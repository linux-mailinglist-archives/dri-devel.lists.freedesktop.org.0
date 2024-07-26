Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 523A293D3DC
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jul 2024 15:13:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB16210E97C;
	Fri, 26 Jul 2024 13:13:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="c/JOYlGf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AF9410E97B
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jul 2024 13:13:57 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id
 ffacd0b85a97d-367963ea053so1510070f8f.2
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jul 2024 06:13:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1721999635; x=1722604435; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=9azynhyEIv7gjWRDwglaDMiOV6j4zfrdOibDd2jjuA0=;
 b=c/JOYlGfnEmAH2BiPsBLSlbChhQRlFmOfURzh0+fu6905T0v2dXUetq/xyMKcvLul4
 sOQyuw7Soi9CrfwbLdYCcXaS4lO+idEsDaaVWnsXxzQvzRIAcPlvaNwPIHEyAkxCW9dW
 JTP/+6Wq2ZTTGUZfyPiIS2d6F98nN5IPcrFlBntQxtznn0JmW8M/Q905HLCdHBZ9D02x
 R68361iWsY95kQYOe0j3i1oA4A4tk7v4Q7osVmCSJBWLGYyDIc/B6mLxmg+9tMKMT/ci
 TMn/Ip2LUR+OVJ7alZdOwjpYkHqEQfVf0XIEVUpZ+yO0k9AZpEYoFPr85rBpb8g0i4e4
 4pIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721999635; x=1722604435;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=9azynhyEIv7gjWRDwglaDMiOV6j4zfrdOibDd2jjuA0=;
 b=atoBYriebIDGpkuibrMgcTDVymu2/cCqp12Q/9s7Xff61fTSJvdVLR/ovDquYiVOMB
 AJGT/q0nysTZIF7oP+RKEowGGREQWc2tcxldLLRd+8YVsZoEsFP6OPcF9+eSiE03IsPo
 OjjZx2fGMQQq7OEH8JoNGvMEU5GCwtulctCZYLZCBJA1o98B5Sp1mRUp0zSPakYUGTbX
 +a4AJ94P1Hj4o1Yh5dJ9GrfjHvRI6v/omC/CoestAS/z9mOQl13kKrRAEXpjMO1W4W6s
 1NocduVDJJsQQWjOaN8qhw0lcqpwhQqrZRvF1SISNzVp5sQ2h35B2CLyGJ1Pnq3norsQ
 PMDA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV+i/j0pFDAbSBGw89xK7fhl/0v6VsOZRlhntrljNP5op7ke/6dpC4XnLPIH7HGTjb4enxYTGEuj3rnV287Rw2wZydcNn9LIGuMkIYR0IXt
X-Gm-Message-State: AOJu0YxG9ONUkxZMijryKWYfrVbuneKUXiTcLpkOoC1ZWLpJpjdv4swq
 GaUoQwVH3DPN+Bzmy1lg2VUSfZ0qTtd8uWuWqhXVHBFOqLAWtulMx+6yMDkCF+4=
X-Google-Smtp-Source: AGHT+IFYFvUqydDA1IhhpeDf3coci+AwNSrGJucxAODHhP4+wvMCDNWfwzzxwPzjvhRpI/Srd3Dybg==
X-Received: by 2002:a5d:588a:0:b0:367:9903:a91 with SMTP id
 ffacd0b85a97d-36b363ad791mr5579706f8f.11.1721999635029; 
 Fri, 26 Jul 2024 06:13:55 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:414f:cfed:daba:4cb?
 ([2a01:e0a:982:cbb0:414f:cfed:daba:4cb])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4280574a8a2sm80575835e9.23.2024.07.26.06.13.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Jul 2024 06:13:54 -0700 (PDT)
Message-ID: <9bdd46a7-c018-4dc9-89e4-20377b5e6570@linaro.org>
Date: Fri, 26 Jul 2024 15:13:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH 2/3] MAINTAINERS: Update Konrad Dybcio's email address
To: Konrad Dybcio <konrad.dybcio@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-pm@vger.kernel.org, iommu@lists.linux.dev, linux-gpio@vger.kernel.org,
 linux-remoteproc@vger.kernel.org, Konrad Dybcio <konradybcio@kernel.org>
References: <20240726-topic-konrad_email-v1-0-f94665da2919@kernel.org>
 <20240726-topic-konrad_email-v1-2-f94665da2919@kernel.org>
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
In-Reply-To: <20240726-topic-konrad_email-v1-2-f94665da2919@kernel.org>
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

On 26/07/2024 13:18, Konrad Dybcio wrote:
> Use my @kernel.org address everywhere.
> 
> Signed-off-by: Konrad Dybcio <konradybcio@kernel.org>
> ---
>   MAINTAINERS | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 9200d953868e..6c7d3951192f 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2745,7 +2745,7 @@ F:	include/linux/soc/qcom/
>   
>   ARM/QUALCOMM SUPPORT
>   M:	Bjorn Andersson <andersson@kernel.org>
> -M:	Konrad Dybcio <konrad.dybcio@linaro.org>
> +M:	Konrad Dybcio <konradybcio@kernel.org>
>   L:	linux-arm-msm@vger.kernel.org
>   S:	Maintained
>   T:	git git://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git
> @@ -7107,7 +7107,7 @@ F:	drivers/gpu/drm/tiny/panel-mipi-dbi.c
>   DRM DRIVER for Qualcomm Adreno GPUs
>   M:	Rob Clark <robdclark@gmail.com>
>   R:	Sean Paul <sean@poorly.run>
> -R:	Konrad Dybcio <konrad.dybcio@linaro.org>
> +R:	Konrad Dybcio <konradybcio@kernel.org>
>   L:	linux-arm-msm@vger.kernel.org
>   L:	dri-devel@lists.freedesktop.org
>   L:	freedreno@lists.freedesktop.org
> @@ -18765,7 +18765,7 @@ F:	include/uapi/drm/qaic_accel.h
>   
>   QUALCOMM CORE POWER REDUCTION (CPR) AVS DRIVER
>   M:	Bjorn Andersson <andersson@kernel.org>
> -M:	Konrad Dybcio <konrad.dybcio@linaro.org>
> +M:	Konrad Dybcio <konradybcio@kernel.org>
>   L:	linux-pm@vger.kernel.org
>   L:	linux-arm-msm@vger.kernel.org
>   S:	Maintained
> 

Acked-by: Neil Armstrong <neil.armstrong@linaro.org>
