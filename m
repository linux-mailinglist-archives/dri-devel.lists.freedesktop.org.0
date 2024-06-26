Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D7779180EC
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2024 14:26:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BDFD10E890;
	Wed, 26 Jun 2024 12:26:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="X68oZrfa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E649A10E890
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2024 12:26:00 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-424720e73e1so53369305e9.1
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2024 05:26:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719404759; x=1720009559; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=fobPrBfxir7ssftZ7iNjyMP1Za2983l3LWtveC8izJ8=;
 b=X68oZrfax1xM7xjWGTRxB1E89LIfCMUErYnWxqN9GsOoh6p9PyyrAUPiBEZ9sGjfPx
 eMM3r6PjoqPfT91Ej9pxk+jnGtNqBTfmIF77EfGuUlLatggKaH6OOm+0KDMnUq8Mttbt
 5kN9ybkOnsVWr29UOj7ZtB/Sh8vmmKKhaDZ7coA4O398KqfVffRVoOXgyV9mK+9k9Pz/
 R5bqwHJVXFx1R4W2jVBbXRwNA4ypebkAAMrxx7fZLb8KYJggoogGAZs73XZj8ohJpD2b
 IpuySGOHC1bXMapINmFefn9mDhKcqaPGL5OKgp3lfPPejdld+2gIyqp3lSaNVJOd1Wrr
 Tmmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719404759; x=1720009559;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=fobPrBfxir7ssftZ7iNjyMP1Za2983l3LWtveC8izJ8=;
 b=AKKrfCwWrDdi9NdhqqJjOIBdjEqjHNbDMEaQ8GhCrDFYpr7rQFkOyVLAq0FjydcGsu
 LkOOrCMw4rnJNdAFHr53ZeEKZiVaMjM71CZ3Qlf+Q21ZPT+teVHftV8XoHUwQGhyatQv
 W3vj7NuyPWmbaPwsfrwDt/jzVjchZ2QuyMPZLuxKWVS8qh40weUvFkNnSLNtiyD9YkMK
 RQFONmitt7DHdCuPNHrB3NqSUf23J5OTil1Fjd32Ms7qmHRQ2i0muJkUV0K7dyP7VccA
 zW9mshtAY8xfTW+EktMF9aiK+74lkxOOG+d/NHIvJRuBQ+OIPkEfRePDpFSUjObjV7Z+
 dRWA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU8c77xVijj3AiHwNYR+8gU5v2VEllTPOf2bvl7SGBOzNT/VueHvnHVDxev6LtxfcKTF0V6+HT6rp3CwWaz6lO/7YhJXJn3N1IRqRaQGEQ5
X-Gm-Message-State: AOJu0Yx6l9DGL9Oiw9SSj/kPs4RfrWmD9itUd8XB0vEo/TnbVtLixWah
 W40L3Ar1jUgbGBUwp6e8c6HJjKiMJt9Ov61ETZJbZb+MCDlNKbEUHD12YySmt/w=
X-Google-Smtp-Source: AGHT+IEto1DLJQeEIPlrwSQLqooZfqyUEPmtJDY9zUBYQrPThRyN6dWE4aV4qDpi+2XCXbeKmzryZA==
X-Received: by 2002:a05:600c:1d23:b0:424:7780:ffc3 with SMTP id
 5b1f17b1804b1-4248cc177c7mr67428235e9.5.1719404758894; 
 Wed, 26 Jun 2024 05:25:58 -0700 (PDT)
Received: from ?IPV6:2a01:cb1c:fcf:4600:a281:d23c:1a8b:ab6?
 ([2a01:cb1c:fcf:4600:a281:d23c:1a8b:ab6])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-424c824ef19sm23865285e9.15.2024.06.26.05.25.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Jun 2024 05:25:58 -0700 (PDT)
Message-ID: <a4d33da3-2a2a-48ce-874d-95a5889f2f1f@linaro.org>
Date: Wed, 26 Jun 2024 14:25:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 1/3] dt-bindings: display: panel: Rename WL-355608-A8 panel
To: Ryan Walklin <ryan@testtoast.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org
Cc: Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg
 <sam@ravnborg.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Hironori KIKUCHI <kikuchan98@gmail.com>,
 Chris Morgan <macroalpha82@gmail.com>
References: <20240626112005.248576-1-ryan@testtoast.com>
 <20240626112005.248576-2-ryan@testtoast.com>
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
In-Reply-To: <20240626112005.248576-2-ryan@testtoast.com>
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

On 26/06/2024 13:17, Ryan Walklin wrote:
> The WL-355608-A8 is a 3.5" 640x480@60Hz RGB LCD display from an unknown
> OEM used in a number of handheld gaming devices made by Anbernic.
> Previously committed using the OEM serial without a vendor prefix,
> however the preference is to use the integrating device vendor and name
> where the OEM is unknown.
> 
> Alter the filename and compatible string to reflect the convention.
> 
> Fixes: f08aac40639c ("drm: panel: nv3052c: Add WL-355608-A8 panel")
> Signed-off-by: Ryan Walklin <ryan@testtoast.com>
> ---
>   .../{wl-355608-a8.yaml => anbernic,rg35xx-panel.yaml}     | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
>   rename Documentation/devicetree/bindings/display/panel/{wl-355608-a8.yaml => anbernic,rg35xx-panel.yaml} (81%)
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/wl-355608-a8.yaml b/Documentation/devicetree/bindings/display/panel/anbernic,rg35xx-panel.yaml
> similarity index 81%
> rename from Documentation/devicetree/bindings/display/panel/wl-355608-a8.yaml
> rename to Documentation/devicetree/bindings/display/panel/anbernic,rg35xx-panel.yaml
> index 397c26be9bda5..a7d5ad0f29389 100644
> --- a/Documentation/devicetree/bindings/display/panel/wl-355608-a8.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/anbernic,rg35xx-panel.yaml
> @@ -1,10 +1,10 @@
>   # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>   %YAML 1.2
>   ---
> -$id: http://devicetree.org/schemas/display/panel/wl-355608-a8.yaml#
> +$id: http://devicetree.org/schemas/display/panel/anbernic,rg35xx-panel.yaml#
>   $schema: http://devicetree.org/meta-schemas/core.yaml#
>   
> -title: WL-355608-A8 3.5" (640x480 pixels) 24-bit IPS LCD panel
> +title: Anbernic RG35XX (WL-355608-A8) 3.5" 640x480 24-bit IPS LCD panel
>   
>   maintainers:
>     - Ryan Walklin <ryan@testtoast.com>
> @@ -15,7 +15,7 @@ allOf:
>   
>   properties:
>     compatible:
> -    const: wl-355608-a8
> +    const: anbernic,rg35xx-panel
>   
>     reg:
>       maxItems: 1
> @@ -41,7 +41,7 @@ examples:
>           #size-cells = <0>;
>   
>           panel@0 {
> -            compatible = "wl-355608-a8";
> +            compatible = "anbernic,rg35xx-panel";

Can it be more specific ? because there's a lot of rg35xx defined in bindings:
  anbernic,rg351m
  anbernic,rg351v
  anbernic,rg353p
  anbernic,rg353ps
  anbernic,rg353v
  anbernic,rg353vs
  anbernic,rg35xx-2024
  anbernic,rg35xx-plus
  anbernic,rg35xx-h

Neil

>               reg = <0>;
>   
>               spi-3wire;

