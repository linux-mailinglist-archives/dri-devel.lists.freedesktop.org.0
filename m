Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89AA0B4503E
	for <lists+dri-devel@lfdr.de>; Fri,  5 Sep 2025 09:51:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E724F10E184;
	Fri,  5 Sep 2025 07:51:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="SwDLRLYN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com
 [209.85.208.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52EEC10E2C7
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Sep 2025 07:51:11 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id
 4fb4d7f45d1cf-6188b5ae1e8so2511902a12.0
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Sep 2025 00:51:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1757058670; x=1757663470; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=8Fek3hgFv14ByAC4ENYyA/aKvGhAef+q+BWE8UMW+V8=;
 b=SwDLRLYNTF7TNxdlZjQgOvo+x3rxctw/MdsIALUelMu1e2MsUR6rkZbQNJYeoy5rgA
 bRlLi9T3oQE2uUS0azuLpLwPfeS97iTuucZ8ZofIIcDJRqDfoNJg8LSQqgTSaXDy421f
 kak9rs1zgVW7cMkn7QVoBjB/wV6VEgAZwMJowGCGii1Kyme4wP6ZCfkpWPtP8oyhzEVA
 Si+8QsLl67A/U6gAjQwJdB9Dbd1VivckDUq4YIjpArexX6QWg0rNQSQN4AXYRXsbIDM2
 1YVL+MpquZn9az7McsrFx284rNwhrFyhEh0qOBowo4+mjj4zEPXsDztdUoCWCeE74qJr
 M+uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757058670; x=1757663470;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=8Fek3hgFv14ByAC4ENYyA/aKvGhAef+q+BWE8UMW+V8=;
 b=msMgfo1YixSvAEYagjuinzjOcwo57gAZlGjDVnaTM1dGJ8hmGCv9ZB1L8o60SGzKsP
 JAbxeYX88gxcPE2+o7o+E0yi4x3qE5ubDZjsIkEXJULNieBEXLUiP12DdSclBDjWuPkt
 TIzvMIDS0A80gQeqrDZFMSGNWSKdkyf4z4gUkK0WEbef+FMZpiN8vZ9OyQWGyQ1epGcX
 B4Nc46QhkA1mbxwRDzff2KsDxts2Has+ddN3FbNYrQrmaTd1AfoHpOrb2y0ucPlMDDha
 PkFLpFmaxnKKHf3RG/jka5fs/jkFuebleEEOXTUi/leKrAVphpxFNCAFat+KzMEfqb7c
 0UpQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVNRay5WIz897vQ33eFZWzy73iQ2WoYoJCJl6fmRvJEMpQkkf2ex2gvm//2ELXDYNzSyI7r2jZKTjU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywt7SflwhHPwg9gcNnp81hM/8ds0tDSoI4aeFTXQnD6iZvtjBLP
 5RrdfOYEpVbejIllG0RKmiAREJIzi0mtE8pc+zFQuU4eALWMhiMH+tinNSHQWfxttm0=
X-Gm-Gg: ASbGncvBpC/bARL6CKJ+1aBlICVb+OWwlyBC+90fTyEw09xPh2pm/mE0hbhEQq5IbdK
 6QOONqS5GYyiTUpPiNPzrBp31EeoUrdSrJXi3zYnBTTXtwJDBLK3fWtLKUMtYGdY5K1uw8ZqDSO
 YkFZbp2WyRnyV1/wjOb0TQok43Yz0HHwywhKA7LCGtwG6LTEMYBydcwjrhbCjeGQ6eVXsptR5Ch
 37rMaOfkXbg3twCoSdOUKyPXDeEaUMYg6lwSjtVznDyGuOQlxb0Mn1M5sl+bgQTHF9ZhR+qoz0c
 qSZ1NJq8lFDNVlJKs3qdMWV2rvMntJHWP3eQbhHMSJxmEZ7GrdlUFORlI/4EzdSl/LLMRYSZeg3
 TqGIEq26WsUYZA0mw4c0znWrDXqqKIGMFsG1JRWtpilRE
X-Google-Smtp-Source: AGHT+IFgzgqr54lyZk759VB+wCuCumNakupjTyV8q7KH49ewQeYz3V4LPh1SGAWQQZu32+3dH/7N+w==
X-Received: by 2002:a17:907:da9:b0:b04:7880:3e88 with SMTP id
 a640c23a62f3a-b04788056a3mr725297266b.18.1757058669532; 
 Fri, 05 Sep 2025 00:51:09 -0700 (PDT)
Received: from [192.168.7.190] ([212.114.21.58])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b042fcae867sm1132057866b.58.2025.09.05.00.51.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Sep 2025 00:51:09 -0700 (PDT)
Message-ID: <a0d85f06-a87b-40f6-a74a-27b148f309fd@linaro.org>
Date: Fri, 5 Sep 2025 09:51:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] dt-bindings: ili9881c: Allow port subnode
To: Marek Vasut <marek.vasut+renesas@mailbox.org>,
 dri-devel@lists.freedesktop.org
Cc: Conor Dooley <conor+dt@kernel.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 David Airlie <airlied@gmail.com>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Rob Herring <robh@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <20250904200130.168263-1-marek.vasut+renesas@mailbox.org>
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
In-Reply-To: <20250904200130.168263-1-marek.vasut+renesas@mailbox.org>
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

On 04/09/2025 22:01, Marek Vasut wrote:
> The ILI9881C is a DSI panel, which can be tied to a DSI controller
> using OF graph port/endpoint. Allow the port subnode in the binding.
> 
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> ---
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Simona Vetter <simona@ffwll.ch>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: devicetree@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-renesas-soc@vger.kernel.org
> ---
>   .../devicetree/bindings/display/panel/ilitek,ili9881c.yaml       | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/ilitek,ili9881c.yaml b/Documentation/devicetree/bindings/display/panel/ilitek,ili9881c.yaml
> index 434cc6af9c954..cf0aa996e072d 100644
> --- a/Documentation/devicetree/bindings/display/panel/ilitek,ili9881c.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/ilitek,ili9881c.yaml
> @@ -30,6 +30,7 @@ properties:
>       maxItems: 1
>   
>     backlight: true
> +  port: true
>     power-supply: true
>     reset-gpios: true
>     rotation: true

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
