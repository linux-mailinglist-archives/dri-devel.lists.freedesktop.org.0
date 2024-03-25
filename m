Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 103F3889B0A
	for <lists+dri-devel@lfdr.de>; Mon, 25 Mar 2024 11:42:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 362C410E738;
	Mon, 25 Mar 2024 10:42:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="UHf2Tqji";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com
 [209.85.208.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A77CF10E27E
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Mar 2024 10:42:32 +0000 (UTC)
Received: by mail-lj1-f176.google.com with SMTP id
 38308e7fff4ca-2d4360ab3daso69060371fa.3
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Mar 2024 03:42:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711363351; x=1711968151; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=iOyhJ8rAPLYOCfRnEKGEvdSoCo5896ILr4qRRRARoVc=;
 b=UHf2TqjiIOm0dW3fH/isRAb76bk3Imrxb7tkGLNDmA7+D63H1XXg3jMklX5yFssTSr
 jeY/S5krw+KdZ+OKnx9UUgwbORLfdpFZ5LsOXcACHUajoCox2/isSALhfOsCxI3piP3T
 OArAJZhJOauR8MWP6lAfW4JQNWY0RJfRXLT8EUE4rYZ/709aXjY3e8nIrMHwAikiASM+
 vvU/IgTL5sHOiR7KR7zLg7nRqF6q+6fYWgVPa2wwTeZyaNmqTDVMBt05t7Eby2fiFDpU
 zOZ0EDMMVP7tumtJISKjmo9Zgrk5T+HJrWGiVp2TeCxj2LjJArdG+VVbWN3kEbqa1yIO
 ZIqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711363351; x=1711968151;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=iOyhJ8rAPLYOCfRnEKGEvdSoCo5896ILr4qRRRARoVc=;
 b=SGQsEry1s2oGv2oORYtXUSZFhq2XiOp432+NKUNw9xBKNb/PbGCVPo7jcrjn1yRUzM
 KJIstKemW0kkbx3RFoYW1CjSFULvwGcqNwRBA8fMh4V7FeYfy/5XqkMshf2txWJvYdt4
 ndtu9T0pt6HveBiEBz4kbuQCDHlvcR6Uvyy6QhZPDY0ei41z8UeGOaxjVFNdZaG8AwV8
 okxJvYnG52ZlVrD2zoN414/S21yHIdJrTTVB1b9qfUPjg+UcMK6sSyU78RFihFkai2rY
 2WsVsgu/XBmekGkfywUM5SpUhmnifg7bkXr3+s4CfQnj6z5OcqmEe+1B1gSFVUzoA7iC
 mFmw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVYSInjYO63zdscf71MzvqRD5/Aqyx0i3+uiANO26crB7KVS+DQhT0tZuayGr1FNKdnLRRJ324XM5ye3qfVchXF4f1/5/C0+jOPxjKAmoCm
X-Gm-Message-State: AOJu0YwJhEYWzOaJHr6eVJkrkwsiYyetDINPoIM5DS3+wICq1nGTwz8M
 PJgP5nv5q7F4eeHzYsUWPIwJIW25nTe1nnORCDgI75lqW+6bir66bm/mVV3oeRw=
X-Google-Smtp-Source: AGHT+IEkazFjPYmnkVqhUvfoXOqndNVNCbAA3D/6nQdgwXxrCZrD8CKfZeKA1WL1eeJ/mcYqddYPBQ==
X-Received: by 2002:a2e:8ecb:0:b0:2d6:bf39:46d5 with SMTP id
 e11-20020a2e8ecb000000b002d6bf3946d5mr3938623ljl.31.1711363350503; 
 Mon, 25 Mar 2024 03:42:30 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:5176:2c0a:cfc0:1ada?
 ([2a01:e0a:982:cbb0:5176:2c0a:cfc0:1ada])
 by smtp.gmail.com with ESMTPSA id
 v6-20020a05600c470600b00414896bb1e0sm3166333wmo.36.2024.03.25.03.42.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Mar 2024 03:42:30 -0700 (PDT)
Message-ID: <e2d0e6cb-5dda-49d0-b14e-5e50e4184ce7@linaro.org>
Date: Mon, 25 Mar 2024 11:42:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [RESEND PATCH] dt-bindings: display: sony,td4353-jdi: allow
 width-mm and height-mm
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: Conor Dooley <conor.dooley@microchip.com>
References: <20240325103227.27474-1-krzysztof.kozlowski@linaro.org>
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
In-Reply-To: <20240325103227.27474-1-krzysztof.kozlowski@linaro.org>
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

On 25/03/2024 11:32, Krzysztof Kozlowski wrote:
> Allow width and height properties from panel-common.yaml, already used
> on some boards:
> 
>    sdm845-sony-xperia-tama-apollo.dtb: panel@0: 'height-mm', 'width-mm' do not match any of the regexes: 'pinctrl-[0-9]+'
> 
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
> 
> Rob, could you pick up this one? Was on the list for almost a year.

I'll take it,

Neil

> 
> 
>   .../devicetree/bindings/display/panel/sony,td4353-jdi.yaml      | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/sony,td4353-jdi.yaml b/Documentation/devicetree/bindings/display/panel/sony,td4353-jdi.yaml
> index b6b885b4c22d..07bce556ad40 100644
> --- a/Documentation/devicetree/bindings/display/panel/sony,td4353-jdi.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/sony,td4353-jdi.yaml
> @@ -23,6 +23,8 @@ properties:
>     reg: true
>   
>     backlight: true
> +  width-mm: true
> +  height-mm: true
>   
>     vddio-supply:
>       description: VDDIO 1.8V supply

