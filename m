Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4E5BC1D43E
	for <lists+dri-devel@lfdr.de>; Wed, 29 Oct 2025 21:45:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A42E10E840;
	Wed, 29 Oct 2025 20:45:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="tVvm/k3n";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDE7910E840
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Oct 2025 20:45:37 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-471b80b994bso3456935e9.3
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Oct 2025 13:45:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761770736; x=1762375536; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=Ey7w7K3RTZ04w+y+uIDIFH1cBIW1mg9eOnArx4/wBFA=;
 b=tVvm/k3njJlvcJfki7pfpjFDsTuSZwP1laSD2E8BI8OCJ1ahMGa436sPlqdh7G4Rkk
 ChsSrXYyXeeXRSvg9FnVI+lflI7fVzYuwP2uMeSNSTbvimpxLFRKvpkxtsHuyJCXgXju
 RG+E9ZPweykBGrstgQlhvN+Ie/1u8fI1z/N1gMoIL9K2CIXP950FFm/tz5DVmn+32Z4O
 gtWDcD27HueqjkzhUJGdRcKveGEesYENpWmLRGrdGUxPYVCARHsGBF5L22J/RM7c9h4B
 v6Xpg0lqcuOzDcnbljxMJ7p8J+cREfcCdNeCI6QwFmSBtfxsMXgjFJG6v51J/+fiEM/3
 AU7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761770736; x=1762375536;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=Ey7w7K3RTZ04w+y+uIDIFH1cBIW1mg9eOnArx4/wBFA=;
 b=buMQfLh1b91wkSCB4uBsm2X8+zRQpsoWvMkz746ao0OSkVK8EbAe2Mlpbbe19BOjXW
 GEwOeOeZVFTYzXUFUN51nNMjUggdSlazv6PI0Cpm0VJCEa2KBWIymqvzxy/f+q3kjPXQ
 Z6vRw4CA2inEmRETR58itRLRFG16Ssir9658GTgyEC55lxf+9q3L+EEauhtP3Q6x8HoU
 JChVvGjAcPOx1OUoXX/U0kYKORNG+G+vd5SwAMTfTP4+mmHq4S+YtAZW4xd3f/h9tmY5
 ILydNKmPxOA7GboNkeHkobOBiuZOtX6eSDmabEfq02oeBjWoBK/o3y3NU0fUipxW9MCQ
 L95w==
X-Gm-Message-State: AOJu0Yzwyaa5HrTK8KLpjQAbHXQCkPFsL6MGV0VfPa8VIPx/qmuM8QVJ
 IvdO6R5gKMHCIVL+FLKc4ON7RaQOqYlqZg6GFFqj+gTiFp1W0gIGIaaNhVedwM4kD60=
X-Gm-Gg: ASbGncuH8eh/c0IsLs7cAD3EPwba6VN/Tx2MO0FXpomAS6CGEHnO90wB4QlEwKhwxL0
 t1ITlrCEQCZRII+YaML02Fu0vWrexfhDnuKFMkXa9I+If1saPL1H2VxsEumAeymc/IbKUV4hPjR
 //c1Nk0k+M2PehF214utJVOZ+1AeUUAciBv0dXQiACVyPvb+9la/Os4geK5caCgRqx8ZpyvpIYu
 9Afgzq0ykAfCBVU3540Qo00oznpSyg2lgi8U4NT9O1GfxjCHcLaQktGxevDP7uvezD+5B+w1MeW
 5fnbXwYzOYkSdftQPsaQOYqrE8lMocYZUInRhe2nrqEqd7oIxkiOJ9p5KjG0ijvVbWIHn8Y56Zr
 XCW65ZRVnI7PnY5kClSLzZhNwLlRtFNRs8nCypPT/92XxZSBRdX+9msl1hUi7piH+2KeP/HZ6V+
 oZQHxzrsMLamk8xxkVVBVhLsGpMshvLBRfkXkNzFTBvwynxdDVlQ==
X-Google-Smtp-Source: AGHT+IHi1ot8650JXICHh1jN6wJNDL624tOSuE6MQUiS0ahjtbdGicnNvGC8hvyGqPxoKLp4axy1yA==
X-Received: by 2002:a05:600c:4e0c:b0:477:58:7cf4 with SMTP id
 5b1f17b1804b1-477266f4079mr5627615e9.4.1761770736364; 
 Wed, 29 Oct 2025 13:45:36 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:cad:2140:3447:eb7a:cb9f:5e0?
 ([2a01:e0a:cad:2140:3447:eb7a:cb9f:5e0])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4771902fa8dsm50511675e9.8.2025.10.29.13.45.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Oct 2025 13:45:36 -0700 (PDT)
Message-ID: <148f0b63-124a-444b-9c61-921eef2f2207@linaro.org>
Date: Wed, 29 Oct 2025 21:45:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 3/3] MAINTAINERS: Add the Leadtek LTK028QV25BYL panel
 driver entry
To: Herve Codina <herve.codina@bootlin.com>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20251021073408.195959-1-herve.codina@bootlin.com>
 <20251021073408.195959-4-herve.codina@bootlin.com>
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
In-Reply-To: <20251021073408.195959-4-herve.codina@bootlin.com>
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

On 10/21/25 09:34, Herve Codina wrote:
> After contributing the driver, add myself as the maintainer for the
> Leadtek LTK028QV25BYL panel driver.
> 
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> ---
>   MAINTAINERS | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 46126ce2f968..67c085cd1dae 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -7811,6 +7811,13 @@ S:	Maintained
>   F:	Documentation/devicetree/bindings/display/panel/jadard,jd9365da-h3.yaml
>   F:	drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c
>   
> +DRM DRIVER FOR LEADTEK LTK028QV25BYL PANELS
> +M:	Herve Codina <herve.codina@bootlin.com>
> +S:	Maintained
> +T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
> +F:	Documentation/devicetree/bindings/display/panel/leadtek,ltk028qv25byl.yaml
> +F:	drivers/gpu/drm/panel/panel-leadtek-ltk028qv25byl.c
> +
>   DRM DRIVER FOR LG SW43408 PANELS
>   M:	Sumit Semwal <sumit.semwal@linaro.org>
>   M:	Casey Connolly <casey.connolly@linaro.org>

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
