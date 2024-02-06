Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06BBB84AFC9
	for <lists+dri-devel@lfdr.de>; Tue,  6 Feb 2024 09:18:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 348A2112A7B;
	Tue,  6 Feb 2024 08:18:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="f7eJWXND";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9454112A7B
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Feb 2024 08:18:02 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-33aea66a31cso3271408f8f.1
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Feb 2024 00:18:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1707207481; x=1707812281; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :references:cc:to:content-language:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=ecxK0OeSx8DU/V9lxqcdeUM2UFGv78q9j2Mxgkb5Lhg=;
 b=f7eJWXNDxhtCEmDpllR4Pg/veBxHYvJisRYDDoNJk9sq5U+OGS4PTSwQnugkKFzFud
 zjKF7Gf/xS0AEivTvA8XmdzCc7uuoiq1an2dggae6K7NfkdNFXhjtAPY6qAi5XyyYxa8
 PsXw152NZVt6CMp+QkyEn4a+i3/Bh2f/9fcDUHWY05DxqH0EeSj+YDMv6XtDv7JVlHkU
 /n6ruU7DijiCkkuE9OLW2NLYGq9UJD0UJPCJd9ZVtCXvQIf9ikyHYLEh7YLUMgPnq34z
 FjEiTChMCOLHcHfbe8ydLUgi6z6m73SK/aGDv9dDTUMLbieb3s1a7L+kJW0DkgxLHQMp
 7pjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707207481; x=1707812281;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :references:cc:to:content-language:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=ecxK0OeSx8DU/V9lxqcdeUM2UFGv78q9j2Mxgkb5Lhg=;
 b=A7zxuR1V9lgC88Jw5816GOrRZUAH9V8X78w3kf8poKM3silfO5/hxsZ01ocZ4NVkKE
 35HWQsjiNqfo72zj3jaDcLx3TyKjf6Zv4+60/Mp2s36iyQvNq5spVvb00iXSDUQbhEg2
 xQ27TbdApBgSbCh5pmInAFDscn/Djm9+g8WCjTtE5vmbpeEIxrLTc74/2Py+cU/Wevj9
 vRMDPQDr0I+2hYP0pAYHTrHY2G1CHTerns+mYBWMjYQPZ4CZwfltnlJAE3cyxvSSQ9LD
 1X/Ur5pEp5ns5lWSmUtzs7Sq6KYPO2QjoRhfMgxOBMoSWcXEivzbGwxxbd/LljP250uZ
 XywA==
X-Gm-Message-State: AOJu0YwwVo8Sv0p5K/NaYWNm/+Udm7/AStCrTu/ftbwLeUm165ylSn+3
 YG/rcGPvEfoH5M4/GnCtCkP7aSukETd9WXee9nGVeDall6vcjWZ2lQPX0IslPdA=
X-Google-Smtp-Source: AGHT+IEpMcoa6cfEkFvIfvzpfuQ8Yx+dGDw/vR+l5ulMZgEDkKNzC9S0nuR1ItidAKgMFW7/sDqpmA==
X-Received: by 2002:a5d:55c6:0:b0:33b:287d:412c with SMTP id
 i6-20020a5d55c6000000b0033b287d412cmr598635wrw.43.1707207481106; 
 Tue, 06 Feb 2024 00:18:01 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCWHbtH0YjwFLURKvvaj4m5/n5NPHSzvgoPcHOJvao8oQ289AiAyaZ5GlNthURTVrfwvxHGKwF/HByeoEpD+uZMQpctXoCfGsgiAyaEyYsTs6LfLhec/hMJIhdvM8RXPV+7wCwtHd8sZZgDd4GXS1jAHF5aui6uCObLAEYXcNNqdPt7J9g7TkUH/rxmx1DhYLT8uSV/U/hqzSL72p1q/aKrsVnkOXT7g8wHC1X7FkLKguFAX18M/M9Y62UGCDBCXsQaGxayBlRjZfLAfNfKon+27TgHHviOPrgxIyqs4hV+EekHxC8x5no4M0zewRa1C+jist3lT6cKCEGVn8HdYdujWfObaAUDD5wJz5kp/iEP6LSZ3hNfrXrTSlXcpfrrJhCAlqScMB3qMlxsf87phYRMPGVn4dUiydThdQmv21/QTuS03MvLDuTgufP3V8rsjNunlMsRUCF3He1FMwwC/nlBT1ttm5APCq6KNQy/rmWrRgJ4yWZUcGMYD31PLCggD2R2e0dxSEdgKUf40GI/sb4Na0qpZUpQdBMg/YGbf7UwG9Y3JawmduQdwiiNK3mEhXj3M0uJdPc96IrJsckfaO5aTaDfyWrkSqSoA1na0Ff6a0ipo/klDRxmO7jjBMZ0lYw==
Received: from ?IPV6:2a01:e0a:982:cbb0:ba23:8574:fa8:28dd?
 ([2a01:e0a:982:cbb0:ba23:8574:fa8:28dd])
 by smtp.gmail.com with ESMTPSA id
 n2-20020a5d67c2000000b0033b4335dce5sm1418976wrw.85.2024.02.06.00.17.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Feb 2024 00:18:00 -0800 (PST)
Message-ID: <b78d2ca4-9516-4d7e-9ec0-3fe93894523b@linaro.org>
Date: Tue, 6 Feb 2024 09:17:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 4/5] drm/panel: simple: fix flags on RK043FN48H
Content-Language: en-US, fr
To: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
References: <20240205-ltdc_mp13-v1-0-072d24bf1b36@foss.st.com>
 <20240205-ltdc_mp13-v1-4-072d24bf1b36@foss.st.com>
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
Organization: Linaro Developer Services
In-Reply-To: <20240205-ltdc_mp13-v1-4-072d24bf1b36@foss.st.com>
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

On 05/02/2024 10:06, Raphael Gallais-Pou wrote:
> DISPLAY_FLAGS_SYNC_POSEDGE is missing in the flags on the default
> timings. When overriding the default mode with one described in the
> device tree, the mode does not get acked because of this missing flag.
> Moreover since the panel is driven by the positive edge it makes sense
> to add it here.
> 
> Signed-off-by: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
> ---
>   drivers/gpu/drm/panel/panel-simple.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> index 2214cb09678c..7b286382ffb4 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -3523,7 +3523,8 @@ static const struct display_timing rocktech_rk043fn48h_timing = {
>   	.vfront_porch = { 1, 4, 4 },
>   	.vsync_len = { 1, 10, 10 },
>   	.flags = DISPLAY_FLAGS_VSYNC_LOW | DISPLAY_FLAGS_HSYNC_LOW |
> -		 DISPLAY_FLAGS_DE_HIGH | DISPLAY_FLAGS_PIXDATA_POSEDGE,
> +		 DISPLAY_FLAGS_DE_HIGH | DISPLAY_FLAGS_PIXDATA_POSEDGE |
> +		 DISPLAY_FLAGS_SYNC_POSEDGE,
>   };
>   
>   static const struct panel_desc rocktech_rk043fn48h = {
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
