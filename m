Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EC198C6DA7
	for <lists+dri-devel@lfdr.de>; Wed, 15 May 2024 23:16:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C05D10E1B5;
	Wed, 15 May 2024 21:16:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Yj5c9Hg7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE44710E1B5
 for <dri-devel@lists.freedesktop.org>; Wed, 15 May 2024 21:16:02 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-41fd5dc04f0so47636675e9.0
 for <dri-devel@lists.freedesktop.org>; Wed, 15 May 2024 14:16:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1715807761; x=1716412561; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=ypQ5i7zn3O21lrbNCHNY91mwYYndLzCRxfIgm5nCfGQ=;
 b=Yj5c9Hg7gLxaVjXyyeGx94KceUxRSyxZ0s17/BxqOj2usHisW8GeF7ZeR2ZDG6zGd6
 hw24/1NNk/YBng0xfDmRaZoROTkCiVotST9fij5L1YjvQQRTggyc9JSb1pT123zOAiUT
 ESF1qjk2fGcngVpoaxP1Y/biKjNl+MRbl/YYYBpaNZ4315jEjD4ri4MVMVPZHoZ8Tqi+
 16WtBj/a6vIK3OCaLXNMEALb6QKCggTHrDayGIshT2oSeeIxxQuQpkce3Kxj73q6YcVL
 c81X6bfi088ghJcVbbGBPHOUsKG8kJ/UXN0SIzlVvE4VBfGkAteAVPc2hLUjjThWjEg0
 U9tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715807761; x=1716412561;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=ypQ5i7zn3O21lrbNCHNY91mwYYndLzCRxfIgm5nCfGQ=;
 b=X2mZj8eX5E2cIhjB+y30ArziLjkzGxPVThDsdf/c25bk8bF8sVlo0YrMx3cP6Hc8lz
 yAz7q8ihqQkxQrEEjxlPjtwKoBP1fx7ShqH4OUzM0h7ksIcJH7kSU/phftDAPqB/Iqxd
 1vZT/bf7bZP3Y3Ciw5ai4iigbUcqZG1mFeBIk9qbMF2PsntWLZndd7EF6dI8xsksEqdv
 hZ2e1brfxrNbAdFyYEtXf9A219uRdzTu86O4sUIMtM2P4osNbWRwErtqjFj7m32mMatx
 EuieQZtQw3gao6KbA8d8yeeXeFv8qArwQ6In1YWdmknIs/mjMMUilStqb0vakUtUNiZ+
 TO5g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXlPxl6UJobZwf1J7obYev9XAyF/Mddwqej9V9hDTDUbz0Pn6wPMIPwVaPZL0kEhGMUaFasC1l8NgMnF9u6YMoPQi+5yk779TZN18NxoL32
X-Gm-Message-State: AOJu0YyNX01boSqYctPiNr78ph0W5H17GUw9WvwNH95Wgh/FZaUlinD0
 wOmDx3Sy+QCWi6WdOlmUlao2GQGEWqLlP1Nqw/UCiajmDNb58CpVkFub4Pi83lc=
X-Google-Smtp-Source: AGHT+IGgcTqIf5m/0zVxc5RASNVotZp2IA/3mSrwEWRVdJbbedxdDEmum4mS9MjHSIt3r+bMIZ6N1A==
X-Received: by 2002:adf:e586:0:b0:34f:3293:85c6 with SMTP id
 ffacd0b85a97d-3504a96b7c9mr18524413f8f.64.1715807761057; 
 Wed, 15 May 2024 14:16:01 -0700 (PDT)
Received: from [10.1.2.176] ([149.14.240.163])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3502b79be1dsm17462785f8f.10.2024.05.15.14.15.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 May 2024 14:16:00 -0700 (PDT)
Message-ID: <0fcdb0ac-2e4a-44b2-a5d6-a67a1d747df8@linaro.org>
Date: Wed, 15 May 2024 23:15:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [v7 3/7] arm64: defconfig: Enable HIMAX_HX83102 panel
To: Cong Yang <yangcong5@huaqin.corp-partner.google.com>, sam@ravnborg.org,
 daniel@ffwll.ch, dianders@chromium.org, linus.walleij@linaro.org,
 krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org, conor+dt@kernel.org,
 airlied@gmail.com
Cc: dmitry.baryshkov@linaro.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 xuxinxiong@huaqin.corp-partner.google.com
References: <20240515014643.2715010-1-yangcong5@huaqin.corp-partner.google.com>
 <20240515014643.2715010-4-yangcong5@huaqin.corp-partner.google.com>
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
In-Reply-To: <20240515014643.2715010-4-yangcong5@huaqin.corp-partner.google.com>
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

Hi,

On 15/05/2024 03:46, Cong Yang wrote:
> DRM_PANEL_HIMAX_HX83102 is being split out from DRM_PANEL_BOE_TV101WUM_NL6.
> Since the arm64 defconfig had the BOE panel driver enabled, let's also
> enable the himax driver.
> 
> Signed-off-by: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> ---
>   arch/arm64/configs/defconfig | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index 2c30d617e180..687c86ddaece 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -864,6 +864,7 @@ CONFIG_DRM_PANEL_BOE_TV101WUM_NL6=m
>   CONFIG_DRM_PANEL_LVDS=m
>   CONFIG_DRM_PANEL_SIMPLE=m
>   CONFIG_DRM_PANEL_EDP=m
> +CONFIG_DRM_PANEL_HIMAX_HX83102=m
>   CONFIG_DRM_PANEL_ILITEK_ILI9882T=m
>   CONFIG_DRM_PANEL_MANTIX_MLAF057WE51=m
>   CONFIG_DRM_PANEL_RAYDIUM_RM67191=m

You should probably sent this one separately since only an ARM SoC maintainer
can apply this, probably via the qcom tree.

Thanks,
Neil
