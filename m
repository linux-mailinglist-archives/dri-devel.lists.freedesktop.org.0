Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37629AD35C5
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jun 2025 14:14:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DBBD10E523;
	Tue, 10 Jun 2025 12:14:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="eqCiA3VQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DF2210E51B
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jun 2025 12:14:29 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-450ce3a2dd5so47938955e9.3
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jun 2025 05:14:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1749557668; x=1750162468; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=/DPVdSZMDklf6mtDF12nzBZep9SyWTS1DC6wAFg2MeE=;
 b=eqCiA3VQ2tbMoO/lgnm3J5eIqo5Oj2gLXDBvz/fnB+PQPQX09ZzQOxDZCGUoy9HN9b
 XkS4Vt+8RGFfgzlkKk+9ZaZs3+pzjvRCDTDxVyZZEC25On6Xxdc04cYf9DJerRYJbwxv
 3RSAFv+Vtuws0VELuhlweC8RfAwXOBYccDmw92i/Ao8lDvtARUfhcUs1rn+BBimaALKf
 3gsdn8xi/vqagOS8z5eQFSwh/Jx2b+OV4FrR5R/ETX6OvZatvUwhi4MbRCjLOV+7dNrd
 pCPpLgeAYuso5fjMeYyLNkQRJeOwjuFbuzNZbeKTe6jo2esVhEuCK+CKPIe6+31/GAm1
 bopA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749557668; x=1750162468;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=/DPVdSZMDklf6mtDF12nzBZep9SyWTS1DC6wAFg2MeE=;
 b=I1laL2weUFrgIzcRlXCptlit+aqntWYUOVUcOoGnKqCdwh1hc2kPao0RZ8g4ltbtw5
 oX0F/nlgnks+giWoeYTzC1G+HXxYM1N4lqib6jRUNaaHSrAbXsgn6ZiQuX67EYL4JY24
 pZanZxpA4EVE3sSIaxcnTCqw2S/itdKnbZlos4CxoCrcPS9vklt2DfFJ/gWY+cmq75LE
 AInwJteqFh+ENT48YolHgY17cCdOLm4742oxkyLF26IdRIOWStCAFeqP231unbD62Cds
 zUMOCSdqfrr9nvLhaFRg6ad7i6rK2HGxh25DEYnUjASsKbakC7L90+Eo3UUvXHzmZI+l
 MLIw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVfC769lH1EGfIGSwYlHEaOnumZh4oYTmP53qIns3LmQjt0CirschOhxyOOdmeJKs717YFqlV6EPoc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzNGtepT9ItmZUcoL20YRngGB3CiYdjMdK0Vp5r57CbqG0hm1Fm
 4Z/04N9yQUsKY17+svPM5f/eU2LbZCQ5yQyzc3VAY57Jkx5MW5wfP/ws1zQQOWLYtd+0Kk69uMT
 juSW7v84=
X-Gm-Gg: ASbGnctOEM4c16mOY/O7gB9aCxqxpiDH2S1ZvmdowzB1q8VlIUCenVYm1m68wnrCovt
 PmZsZ+Bzv/r3djcouo0U2d7Y5CZgFJj0/3p7ys51rRYR3+hbR6IaJ+5RTZNw/WyQyDxyMuhhh3V
 RumPQ+En2YkAkYUwzu7mQ4rT53g48FvdeFOEZKnZt1WLgcbA2Hrt+4UKoaAcZl8rwJifTyDMKvn
 6BO7qQOKy8/wio7B0eKRgyRbjpD5yRlPXarYpbZIx8M3Q5m2vV9GO5Ihcbf7gm6ZLH4pq9nArC/
 Y80NodOuSawyef74OViV6e5b+plEv4eeL1s9IXbN4zfZzopt0kH9V51BrHX6dr9I51/JyiJ/cqm
 I+DiLzsJiK6aj7+QbYqzq0rrtVbVquReoSVk5ZIOxVIY5KxQ=
X-Google-Smtp-Source: AGHT+IFrXuEadreb3Ra0ecFZUmb9l900iFMIt+FWoBtiuGQI7QU2cCtR641w8MO4Bqrq58Be6Fu0vw==
X-Received: by 2002:a05:600c:3848:b0:43c:eeee:b713 with SMTP id
 5b1f17b1804b1-452013d7cc8mr141430515e9.20.1749557667674; 
 Tue, 10 Jun 2025 05:14:27 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:f0b:a9b6:d508:9d14?
 ([2a01:e0a:3d9:2080:f0b:a9b6:d508:9d14])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-452669ada25sm141140855e9.0.2025.06.10.05.14.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Jun 2025 05:14:27 -0700 (PDT)
Message-ID: <ec36d5e5-5aef-4d0f-8596-96ef3e674ad7@linaro.org>
Date: Tue, 10 Jun 2025 14:14:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH v1] drm/meson: fix more rounding issues with 59.94Hz modes
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org, dri-devel@lists.freedesktop.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Christian Hewitt <christianshewitt@gmail.com>
References: <20250609202751.962208-1-martin.blumenstingl@googlemail.com>
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
In-Reply-To: <20250609202751.962208-1-martin.blumenstingl@googlemail.com>
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

On 09/06/2025 22:27, Martin Blumenstingl wrote:
> Commit 1017560164b6 ("drm/meson: use unsigned long long / Hz for
> frequency types") attempts to resolve video playback using 59.94Hz.
>   using YUV420 by changing the clock calculation to use
> Hz instead of kHz (thus yielding more precision).
> 
> The basic calculation itself is correct, however the comparisions in
> meson_vclk_vic_supported_freq() and meson_vclk_setup() don't work
> anymore for 59.94Hz modes (using the freq * 1000 / 1001 logic). For
> example, drm/edid specifies a 593407kHz clock for 3840x2160@59.94Hz.
> With the mentioend commit we convert this to Hz. Then meson_vclk
> tries to find a matchig "params" entry (as the clock setup code
> currently only supports specific frequencies) by taking the venc_freq
> from the params and calculating the "alt frequency" (used for the
> 59.94Hz modes) from it, which is:
>    (594000000Hz * 1000) / 1001 = 593406593Hz
> 
> Similar calculation is applied to the phy_freq (TMDS clock), which is 10
> times the pixel clock.
> 
> Implement a new meson_vclk_freqs_are_matching_param() function whose
> purpose is to compare if the requested and calculated frequencies. They
> may not match exactly (for the reasons mentioned above). Allow the
> clocks to deviate slightly to make the 59.94Hz modes again.
> 
> Fixes: 1017560164b6 ("drm/meson: use unsigned long long / Hz for frequency types")
> Reported-by: Christian Hewitt <christianshewitt@gmail.com>
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
> Special thanks to Christian for testing (off-list) and managing so I
> can do better testing myself in the future!
> 
> This is meant to be applied on top of "drm/meson: use vclk_freq instead
> of pixel_freq in debug print" from [0]
> 
> 
> [0] https://lore.kernel.org/dri-devel/20250606221031.3419353-1-martin.blumenstingl@googlemail.com/
> 
> 
>   drivers/gpu/drm/meson/meson_vclk.c | 55 ++++++++++++++++++------------
>   1 file changed, 34 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/gpu/drm/meson/meson_vclk.c b/drivers/gpu/drm/meson/meson_vclk.c
> index c4123bb958e4..dfe0c28a0f05 100644
> --- a/drivers/gpu/drm/meson/meson_vclk.c
> +++ b/drivers/gpu/drm/meson/meson_vclk.c
> @@ -110,10 +110,7 @@
>   #define HDMI_PLL_LOCK		BIT(31)
>   #define HDMI_PLL_LOCK_G12A	(3 << 30)
>   
> -#define PIXEL_FREQ_1000_1001(_freq)	\
> -	DIV_ROUND_CLOSEST_ULL((_freq) * 1000ULL, 1001ULL)
> -#define PHY_FREQ_1000_1001(_freq)	\
> -	(PIXEL_FREQ_1000_1001(DIV_ROUND_DOWN_ULL(_freq, 10ULL)) * 10)
> +#define FREQ_1000_1001(_freq)	DIV_ROUND_CLOSEST_ULL((_freq) * 1000ULL, 1001ULL)
>   
>   /* VID PLL Dividers */
>   enum {
> @@ -772,6 +769,36 @@ static void meson_hdmi_pll_generic_set(struct meson_drm *priv,
>   		  pll_freq);
>   }
>   
> +static bool meson_vclk_freqs_are_matching_param(unsigned int idx,
> +						unsigned long long phy_freq,
> +						unsigned long long vclk_freq)
> +{
> +	DRM_DEBUG_DRIVER("i = %d vclk_freq = %lluHz alt = %lluHz\n",
> +			 idx, params[idx].vclk_freq,
> +			 FREQ_1000_1001(params[idx].vclk_freq));
> +	DRM_DEBUG_DRIVER("i = %d phy_freq = %lluHz alt = %lluHz\n",
> +			 idx, params[idx].phy_freq,
> +			 FREQ_1000_1001(params[idx].phy_freq));
> +
> +	/* Match strict frequency */
> +	if (phy_freq == params[idx].phy_freq &&
> +	    vclk_freq == params[idx].vclk_freq)
> +		return true;
> +
> +	/* Match 1000/1001 variant: vclk deviation has to be less than 1kHz
> +	 * (drm EDID is defined in 1kHz steps, so everything smaller must be
> +	 * rounding error) and the PHY freq deviation has to be less than
> +	 * 10kHz (as the TMDS clock is 10 times the pixel clock, so anything
> +	 * smaller must be rounding error as well).
> +	 */
> +	if (abs(vclk_freq - FREQ_1000_1001(params[idx].vclk_freq)) < 1000 &&
> +	    abs(phy_freq - FREQ_1000_1001(params[idx].phy_freq)) < 10000)
> +		return true;
> +
> +	/* no match */
> +	return false;
> +}
> +
>   enum drm_mode_status
>   meson_vclk_vic_supported_freq(struct meson_drm *priv,
>   			      unsigned long long phy_freq,
> @@ -790,19 +817,7 @@ meson_vclk_vic_supported_freq(struct meson_drm *priv,
>   	}
>   
>   	for (i = 0 ; params[i].pixel_freq ; ++i) {
> -		DRM_DEBUG_DRIVER("i = %d vclk_freq = %lluHz alt = %lluHz\n",
> -				 i, params[i].vclk_freq,
> -				 PIXEL_FREQ_1000_1001(params[i].vclk_freq));
> -		DRM_DEBUG_DRIVER("i = %d phy_freq = %lluHz alt = %lluHz\n",
> -				 i, params[i].phy_freq,
> -				 PHY_FREQ_1000_1001(params[i].phy_freq));
> -		/* Match strict frequency */
> -		if (phy_freq == params[i].phy_freq &&
> -		    vclk_freq == params[i].vclk_freq)
> -			return MODE_OK;
> -		/* Match 1000/1001 variant */
> -		if (phy_freq == PHY_FREQ_1000_1001(params[i].phy_freq) &&
> -		    vclk_freq == PIXEL_FREQ_1000_1001(params[i].vclk_freq))
> +		if (meson_vclk_freqs_are_matching_param(i, phy_freq, vclk_freq))
>   			return MODE_OK;
>   	}
>   
> @@ -1075,10 +1090,8 @@ void meson_vclk_setup(struct meson_drm *priv, unsigned int target,
>   	}
>   
>   	for (freq = 0 ; params[freq].pixel_freq ; ++freq) {
> -		if ((phy_freq == params[freq].phy_freq ||
> -		     phy_freq == PHY_FREQ_1000_1001(params[freq].phy_freq)) &&
> -		    (vclk_freq == params[freq].vclk_freq ||
> -		     vclk_freq == PIXEL_FREQ_1000_1001(params[freq].vclk_freq))) {
> +		if (meson_vclk_freqs_are_matching_param(freq, phy_freq,
> +							vclk_freq)) {
>   			if (vclk_freq != params[freq].vclk_freq)
>   				vic_alternate_clock = true;
>   			else

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
