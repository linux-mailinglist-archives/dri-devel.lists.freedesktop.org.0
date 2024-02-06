Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28BF584AFC7
	for <lists+dri-devel@lfdr.de>; Tue,  6 Feb 2024 09:17:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 982B5112A7A;
	Tue,  6 Feb 2024 08:17:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="vsq2n5V1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D00F5112A7A
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Feb 2024 08:17:50 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-33b130f605eso3442815f8f.1
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Feb 2024 00:17:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1707207469; x=1707812269; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=UyN5OHMQS53X20sOXqYyX0W/PsIbBopkeWbqDFzNQLU=;
 b=vsq2n5V1CYaKXY3cEfx3cVvKoM/CApgKW6hQfKnHPK+Zme4b1iDgqZYT/1JpPbXPbx
 uQshB2dN9fz2NIcPjb3bVNVL6Xwrf0bL0CMXW0sS6CoAzD7WLBC4Ef5tLQAflK1ittrW
 qUhLzYDAOFSe3INqajFu4LwI0w+74G+G+M4fiFf4YNpVInTvki8GDYuOcgA4Hk+9QWgp
 i7uyvKt6RUHog4LGtOaKuh4E709aH3LMBDdnxS4PmmND7VDzVKBPrQl/4AvBFKBN48+k
 kHNMJrNgOCjJidhKPm3lhtwyiLl77ZQWB7Qf6qybmr3jCYcQIH2NmckLiBELW5qQAqcP
 B25Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707207469; x=1707812269;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=UyN5OHMQS53X20sOXqYyX0W/PsIbBopkeWbqDFzNQLU=;
 b=ItMJf8irhjO6Dy3LwEEELDI73HAgtDQ16r9xTgmnvy+6BkpO6O4+BEkSvDn6ZC570Z
 mHBRoAsnF7tFi2IC1uSO2YdKnd5LZUx/fbBL59lJFtnbT11plwJZCv+gugQAI1NVh+zE
 /0aJM9TfnDnSbM/fNuBJM6E6Hboq1oW9d8PushcpsZHTvE4rR+3OX26IDpmJap+c6NK/
 FD0N+9TGX7pt+61S5p5Vv9WrnQkSASNn7jbXJG3Xbyb5QOJyzxSmp/TG13lz35IuGjVf
 f90gxrg9fMEhtIoP/JrI0b64kwOtxwZiEb46rbSashnq047TxjfF6eXDy099c454vcfJ
 dT7w==
X-Gm-Message-State: AOJu0Yz65aoERlhVBaBJ3b+xdnAZl6RuPIOS6T4iTKOL2AQ0N5Q4pPmb
 HZPrkckIFCKlNimrAdOv8Fpnelp96BQHEwiq+0G9UOmh3a5grImqFpx00vvQcyY=
X-Google-Smtp-Source: AGHT+IHAWrg8qRK6AZYhEs+t47vN/8OCCIixVZWOXrnHnOpCitooPhNhs+moVNdSthDRAt8USHwP1w==
X-Received: by 2002:a5d:4986:0:b0:33b:139e:9110 with SMTP id
 r6-20020a5d4986000000b0033b139e9110mr603630wrq.36.1707207468752; 
 Tue, 06 Feb 2024 00:17:48 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCU3BzcUEkoM6juRR1EGp+PLKZxtOtBug1EJ4C0nP92GLAnLGzemAa2sr+2UeW8SX+HXIm5tAGSssUiSqoCjdq773ZxesH70yJdiR2w5jvn5nn1wScia8XUAUuznbFN8g4Y+jyjgXHrRPYleYecfBWF8eTghG8EgqaKlAGX5CikZbjOh5NUHhxmZ72HITcqKM/bjSICAdflkffgroAavUHFrMxcMoTnTd892daW+i5iN9Y//8nEMHlBtLqsxUYrRcphJqn5WVISWqu5aN4+9ga9VExroHbyLDVlsb8jyhC44RgvYZZhsgKLPEJ1pKHeh/0vCjpOh4VCLKGBPO1DaDN0ATLQ+geriTMo1NkVCpk6HJR8AcIwykzU4MaQ7/Z+rDgGuMTH7hyn8ngRd8bKQVuE/JwxmJ1/ZDq6HlZBzNxsPyZ5wjE2q8jfyaBFfSvLh3j2BuK40JSzeIaL/GMfzVRyprYfLf/ewWEM4MN9u0292Bzvx0g5/kxXqxkY3BVcVQIXuecNtOxj7nd+PmjzkqqzeZSM8HMKT2OANFevPDAQI2/o16li6V/8pRFLBJbGQ7OnCSCoWZDAVtUo7Qkc4VORA+PUQgAXIWOfMdfLG1iAS7n1gRj6aAQbfiIwRl3/OGA==
Received: from ?IPV6:2a01:e0a:982:cbb0:ba23:8574:fa8:28dd?
 ([2a01:e0a:982:cbb0:ba23:8574:fa8:28dd])
 by smtp.gmail.com with ESMTPSA id
 n2-20020a5d67c2000000b0033b4335dce5sm1418976wrw.85.2024.02.06.00.17.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Feb 2024 00:17:48 -0800 (PST)
Message-ID: <30648f19-f25b-49cc-94f1-213bc96c67f4@linaro.org>
Date: Tue, 6 Feb 2024 09:17:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 5/5] drm/panel: simple: push blanking limit on RK32FN48H
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
References: <20240205-ltdc_mp13-v1-0-116d43ebba75@foss.st.com>
 <20240205-ltdc_mp13-v1-5-116d43ebba75@foss.st.com>
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
In-Reply-To: <20240205-ltdc_mp13-v1-5-116d43ebba75@foss.st.com>
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

On 05/02/2024 10:26, Raphael Gallais-Pou wrote:
> Push horizontal front porch and vertical back porch blanking limit.
> This allows to get a 60 fps sharp.
> 
> Signed-off-by: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
> ---
>   drivers/gpu/drm/panel/panel-simple.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> index 7b286382ffb4..10b361d603be 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -3516,10 +3516,10 @@ static const struct display_timing rocktech_rk043fn48h_timing = {
>   	.pixelclock = { 6000000, 9000000, 12000000 },
>   	.hactive = { 480, 480, 480 },
>   	.hback_porch = { 8, 43, 43 },
> -	.hfront_porch = { 2, 8, 8 },
> +	.hfront_porch = { 2, 8, 10 },
>   	.hsync_len = { 1, 1, 1 },
>   	.vactive = { 272, 272, 272 },
> -	.vback_porch = { 2, 12, 12 },
> +	.vback_porch = { 2, 12, 26 },
>   	.vfront_porch = { 1, 4, 4 },
>   	.vsync_len = { 1, 10, 10 },
>   	.flags = DISPLAY_FLAGS_VSYNC_LOW | DISPLAY_FLAGS_HSYNC_LOW |
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
