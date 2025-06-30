Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 434A1AEE28E
	for <lists+dri-devel@lfdr.de>; Mon, 30 Jun 2025 17:32:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C03310E48F;
	Mon, 30 Jun 2025 15:32:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="D23HwksN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A83B610E490
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Jun 2025 15:32:47 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-3a536ecbf6fso2660778f8f.2
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Jun 2025 08:32:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751297566; x=1751902366; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=atA/KC1m61iI/EQIA0gGrqTkbU+o+kg8hTMAb8HLbKE=;
 b=D23HwksNSA9xdQniWc6ZFKNGd6FJ4vb7ZrFZaXZQe5aJWNyOzXXLU3wq8Ub6PKIb8S
 q1LF0cgpsuPyCwIiDDPvjZLZOKBVfSW4Rb5X3aD0z9bQQqHQHqvB/IadN4xa54zL1UeN
 bzScdque68Uh0PpikqESoD28Byh91U0LrNIkX/TIOPQCyAdZlJ7u/QpInO3jM+1ZrUMi
 TVeJRmoW+77IFqc8ExVtm2WMx1Rbpwa1PcLV4PBYCNMPZHexY2MlQAYvgsvy7qCc+N3J
 Urek283aNB/3kkx7+PxHw77VtjtdPowXyL57QjtVsa76sqUr3oS3QE8NenMHBsJy4cOX
 QkmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751297566; x=1751902366;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=atA/KC1m61iI/EQIA0gGrqTkbU+o+kg8hTMAb8HLbKE=;
 b=cEFd+VCcbxNtlZELc2fI1LIKNwP5yvL9vxNMnuU/TNazImDZ3cNXMbRJbwqC17N6eq
 /D/IrvDpM+9nTxppU31935LReTZbXdk98ycyg4qcSapVs+pJI51ZDElm5I8Z8LIWrjYO
 i0eefYS1EBUdkASKo0TxlxcG2fadckjjI0dtY6BO6mCkgAjiHpiJxBb+LXhQFoRI7ExD
 4PNMK+e1KsaefRFXPWtcVCtJ8usTtKtZft7SqulxKIvQgB6HCtx0644Nx8T/qcEsdJ1O
 vkGB2QCbg5VQ8W/RQh63u2sgIVAiOF83/tc5SrYMtUk11/wrjOTB89RYJMhjGE/KQIrC
 +bXA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWKC54IKHa95gFEZ16JvWfFQ6CDvtOJfg7cYAuxzPWEVIHBKI0qOLYTM46Xuge6Da/WUP/Rrif+KuE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyq8TjXXLFGPHyrOEPH1aHzt8cEPXtijQVFKgVk0+qfR4CEcAio
 Sy1T9AZtbKcgLMkqZ22SeFkDanCJr9qkCDmUeatMpl2ajKomm+4mxdz3kSP1z4n6KCY=
X-Gm-Gg: ASbGncuvnTkeBD+navCPX9gR5FEq7eQLPR+wMA0vWf1LWyiEYXfvNdOpdZirl6qQIx7
 QrzIzljCxfBYwIGoipzdV7k57AqhyDvqweKs2Vuvd4llt6pcwtHoLETXYsApUnut0pc6329wGDk
 gXo8wYvFLddCgmNsPPNLMF1K0J3nYRg+j9f30phFOHvAtHZCoWF1m8OYv3mGLbnFr5btXM85KFG
 Knjw+jS1sx8iE8mp+ZodAfcDu4Cx8ZjJssLyHjChrnaYUWVbflc0VKNdJvysiPAuaPZVYeyynyc
 s0g3qo1X4+I6l1SmFXF53ENp1dcgH8nnNMxtzaPYm8MtIjNRaVytflQDAcKvRoKZwfhHBP8gm74
 Eb8NuiF3/GlAPtth4fl9tBFdTmqRu/UJGyQU8zuo=
X-Google-Smtp-Source: AGHT+IF1MxZOvenNiix21YlE5Sm5JmNj/5PZM5XXAtE+bWTuEZDv9V6ZtvTAasrMlYozwOUVfjtjdw==
X-Received: by 2002:a5d:55c9:0:b0:3a4:dd02:f724 with SMTP id
 ffacd0b85a97d-3a900575c7amr9522396f8f.43.1751297566132; 
 Mon, 30 Jun 2025 08:32:46 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:abe8:a49c:efe7:4dfb?
 ([2a01:e0a:3d9:2080:abe8:a49c:efe7:4dfb])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a892e5f8e1sm10573229f8f.88.2025.06.30.08.32.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Jun 2025 08:32:45 -0700 (PDT)
Message-ID: <2f317041-bdab-4cc1-a45e-952c97398687@linaro.org>
Date: Mon, 30 Jun 2025 17:32:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH] drm/panel: raydium-rm67200: Add missing drm_display_mode
 flags
To: Andy Yan <andyshrk@163.com>
Cc: quic_jesszhan@quicinc.com, mripard@kernel.org, simona@ffwll.ch,
 tzimmermann@suse.de, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Andy Yan <andy.yan@rock-chips.com>
References: <20250618080955.691048-1-andyshrk@163.com>
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
In-Reply-To: <20250618080955.691048-1-andyshrk@163.com>
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

On 18/06/2025 10:09, Andy Yan wrote:
> From: Andy Yan <andy.yan@rock-chips.com>
> 
> Add missing drm_display_mode DRM_MODE_FLAG_NVSYNC | DRM_MODE_FLAG_NHSYNC
> flags. Those are used by various bridges(e.g. dw-mipi-dsi) in the
> pipeline to correctly configure its sync signals polarity.
> 
> Tested on rk3568/rk3576/rk3588 EVB.
> 
> Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
> ---
> 
>   drivers/gpu/drm/panel/panel-raydium-rm67200.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/panel/panel-raydium-rm67200.c b/drivers/gpu/drm/panel/panel-raydium-rm67200.c
> index add6099ae8a64..92c3e20b903f0 100644
> --- a/drivers/gpu/drm/panel/panel-raydium-rm67200.c
> +++ b/drivers/gpu/drm/panel/panel-raydium-rm67200.c
> @@ -478,6 +478,7 @@ static const struct raydium_rm67200_panel_info w552793baa_info = {
>   		.vtotal = 1952,
>   		.width_mm = 68, /* 68.04mm */
>   		.height_mm = 121, /* 120.96mm */
> +		.flags = DRM_MODE_FLAG_NVSYNC | DRM_MODE_FLAG_NHSYNC,
>   		.type = DRM_MODE_TYPE_DRIVER,
>   	},
>   	.regulators = w552793baa_regulators,

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
