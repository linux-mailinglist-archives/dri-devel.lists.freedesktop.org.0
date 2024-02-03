Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53F648486BB
	for <lists+dri-devel@lfdr.de>; Sat,  3 Feb 2024 15:40:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC4F210F3C6;
	Sat,  3 Feb 2024 14:40:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="zIYl0FUo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CA1F10F3C6
 for <dri-devel@lists.freedesktop.org>; Sat,  3 Feb 2024 14:40:12 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-3394ca0c874so2022361f8f.2
 for <dri-devel@lists.freedesktop.org>; Sat, 03 Feb 2024 06:40:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1706971211; x=1707576011; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=h1khyXsl2uQ49TZZlX5GEuEsN6onRhf1Nq/aqOzPdR8=;
 b=zIYl0FUoapzbCLrgyJbYsWx28uGuPZsOHlI8sx8gOf8lI05T7HAFD4ByE6+ws4b3Xr
 yEYOAoxHyLH3hEtElA0i0rOxLviVfx72yiLWp93FDNpAyLUS/gKPBOUckAkKhhxsOmXC
 ff7JbCssvp/k3UtcmbO2k6tkL7d+u0J6/ix3dXQ7HtOU3JwD5Fx8mAa/QGwVui5rl8RL
 XHKBFCXuiBwWlw3ikq9KVBo71u35eBZqDCYJTXqtrbQCok0EnAEA7620VbzbHfcx+aeH
 VaH2G3+RGajpz4sePifKYyrQhHCQoVwbBXDAGnsp1RTx1/4q/NfkCBdUzy03gntdO9Nj
 gCFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706971211; x=1707576011;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=h1khyXsl2uQ49TZZlX5GEuEsN6onRhf1Nq/aqOzPdR8=;
 b=PMQQ9cvHzuKHuoUDW6fY0bf4abk/lEfvQih6yOkz1ZAunzJOVVb9UmdgqsSr/8AmwF
 VllUXeAOxvh8jyBMYHPXi00jsTPz7kf1hIW9VTOAm8c9JPZKS+wdueOr7c+Jl6Dwg8Ek
 EDg7YzfZTAK4XQ+4L/DrycOhyGwwEk+0zibNzpSKo5ukzMSaUBBU0Iu9XXXOb5FflCBb
 O7Qprgz6gpFzgbBzqKfuUVBOwo9DGvd/Xc/jjwEra5f76AnpxWrpkxeXM1y/wsBW/ZHj
 MU2+2/QJJNosY3+ELnRx+FNJp1Xn6BjNIPMoV+BcaeAZ+M9EPcuNNEjgIOyjnWBfPNqR
 NpJA==
X-Gm-Message-State: AOJu0YxkqJPdjGHmia8iUMIU73qZWPiLGBP6HWD+89zFBoiwBNWWWfkM
 0PtQsD4l1E/ls+CVUQ7G9NShsX7CTUPHVHca99hYvoqHX3l0eP+XIbTDelbaXPU=
X-Google-Smtp-Source: AGHT+IHucqBcbd7A6063P89orNXrIPGag7RoLfpbjPD9TY5rWT1EfDXZtJKNfg0qA2jLSUSQGTk1hQ==
X-Received: by 2002:adf:a356:0:b0:33b:17e0:6715 with SMTP id
 d22-20020adfa356000000b0033b17e06715mr2588485wrb.3.1706971210955; 
 Sat, 03 Feb 2024 06:40:10 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCUMNVG1WycuTAj8wRGLZn7wbOvvXpe4wN+VM2kUHIUnDnE3/4gqkOECkS+gYOILh2kb/WDBQCGP/rI9ABnf4wcdLylJfQfml3+PTBKUmttLiMC7IzQOSfJaqYvCzXNdET56BVpnFz+NHyANa5NhwLL3IfEdeWqeknyf1lQNYTIcAr1a5IiCN9DBftduFXUJSYKXgrYVRHGYMb/Q6nvSbTIbSwsq+e45Ied6lQy/7FcFTabp++6J6V6Q57SO1rQf0+EdvlI5JAKsVmOIKxWR9VE2g5bi/Js8UKzXfz6476TBjP/vPduBLkzH4T+2ErtvQA==
Received: from ?IPV6:2001:67c:1810:f055:5044:617a:60fb:ed01?
 ([2001:67c:1810:f055:5044:617a:60fb:ed01])
 by smtp.gmail.com with ESMTPSA id
 x16-20020adff0d0000000b0033b1ab837e1sm4181260wro.71.2024.02.03.06.40.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 03 Feb 2024 06:40:10 -0800 (PST)
Message-ID: <a3169686-31a4-4029-bc74-6c38b77680a3@linaro.org>
Date: Sat, 3 Feb 2024 15:40:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] drm/panel: visionox-r66451: Set prepare_prev_first flag
To: Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg
 <sam@ravnborg.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: quic_abhinavk@quicinc.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20240202-visionox-r66451-prev-first-v1-1-c267dc889284@quicinc.com>
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
Organization: Linaro Developer Services
In-Reply-To: <20240202-visionox-r66451-prev-first-v1-1-c267dc889284@quicinc.com>
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

On 02/02/2024 22:50, Jessica Zhang wrote:
> The DSI host needs to be enabled for the panel to be initialized in
> prepare(). Ensure this happens by setting prepare_prev_first.
> 
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>   drivers/gpu/drm/panel/panel-visionox-r66451.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/panel/panel-visionox-r66451.c b/drivers/gpu/drm/panel/panel-visionox-r66451.c
> index fbb73464de332..493f2a6076f8d 100644
> --- a/drivers/gpu/drm/panel/panel-visionox-r66451.c
> +++ b/drivers/gpu/drm/panel/panel-visionox-r66451.c
> @@ -322,6 +322,7 @@ static int visionox_r66451_probe(struct mipi_dsi_device *dsi)
>   	dsi->lanes = 4;
>   	dsi->format = MIPI_DSI_FMT_RGB888;
>   	dsi->mode_flags = MIPI_DSI_MODE_LPM | MIPI_DSI_CLOCK_NON_CONTINUOUS;
> +	ctx->panel.prepare_prev_first = true;
>   
>   	drm_panel_init(&ctx->panel, dev, &visionox_r66451_funcs, DRM_MODE_CONNECTOR_DSI);
>   	ctx->panel.backlight = visionox_r66451_create_backlight(dsi);
> 
> ---
> base-commit: 51b70ff55ed88edd19b080a524063446bcc34b62
> change-id: 20230717-visionox-r66451-prev-first-67b036160e32
> 
> Best regards,

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
