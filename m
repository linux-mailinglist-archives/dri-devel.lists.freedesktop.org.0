Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 188A5A98B95
	for <lists+dri-devel@lfdr.de>; Wed, 23 Apr 2025 15:43:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AAB910E1FA;
	Wed, 23 Apr 2025 13:43:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="o2DfBPbs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D135B10E1FA
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Apr 2025 13:43:13 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-43cfba466b2so64701565e9.3
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Apr 2025 06:43:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1745415792; x=1746020592; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=FfrnhMcNKf5rCGWHGoNIZp7mNgbnWoHESdB7RpEhfqo=;
 b=o2DfBPbsTb6WQzDDhgJAjpc/FLyC3hLAGsmMkeovpZDTdE9O3zkXBIg+6J2CV7H6Pg
 mj7kfR/IfC8/IY0DKw/z32OK/JUjO6Gk8oAOUYz5V5fwL1WeoDvwZI4D4hIoRDGcKnIb
 xte59wRXFW6Nm6Ui3n8HKtp8cIp4QB5E7s+iVQ9KVw/DZjYlgeUYus6fTx4GKJiUX4q7
 zdGY4EB5TDNPuJgr19SauNgg7WMVHxiFIGtV1pEkKE8znSvtJsYhIfdMIYXApzZsmysp
 vw5ySNUcJFShD6gMI4tPzuTA69rhU+zikmfYFYTn/YlPLawxa0GckpQ5xW6X85b2LRHo
 cbTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745415792; x=1746020592;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=FfrnhMcNKf5rCGWHGoNIZp7mNgbnWoHESdB7RpEhfqo=;
 b=XpwKex2KtJ8Ur0S1FfCgShwp7CEKp1BcrkuWt9uR3hr+pP4Hp+XnMS2pSTbEULjv1y
 A7UXUdOSCC9HhZMIfDYURAwTzL12tO4j+PSXwGymuMCcwzgCKPfkzXEu0ul5fWXAUhwP
 qrkmJ8bdS5Q1k/CTNhzIyd614ArsBgseEoOgJ+L97w7+ixE9BymmvBALxp8gQmuxbqFt
 i5W9K2w6LNrtomSO4nQWx/4Sbqz+gSfMUujIjAfhJ9h7wsGycsffsMzVL5zK2s6ZZzAe
 XfYrKRQSR/jpaNIGzb86xX769sjPDhl2zOYBCylbFyj+2C5D43RSPAw92NMxL0XV6wFi
 fwXg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUfwHFCxfXgRxEB2DqmZCx38nBwq37uiVFEsyrat99VsbB5aH097L18VkDe6glidHFmZNOIQt6Z9jo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxMzyrIsXJsiMZYOut2gxlO0ub/F3kO4QfDZtFMGO5AvBULfEsH
 +zqLoc6c489uDHVjs81FAANhlkoOnTu4oPJOxoRAWs72L9hYHk/W/4meZYzmLy0=
X-Gm-Gg: ASbGncuGz3jtLhPMhTRQXMaQyODYiQ3RAvhtGYKVUrJtwJjOu62Iq97oAnnyNR6GUpH
 tK9TL3uhuWBe7axnVJtjKDDEMwVfWYRD7gUvzMgdiiKaJRElr9MCaejp9PHhF8SMGUGseQw/Y0Y
 PfJdCEJ3gG7LKsSURA8xmfjP33v9AUNHuHNZ0NWEzvFO26Aey5nMafztYdQR+BPRbmaY4uM5RPB
 ltPE6bUiMFGT+Chg0gYAMkxGDfKw6AxRzEsXnvX9UVHVO1wS0YHnpkQ2QL9/3wk3U57i+G7Gvy/
 S17K0KmkhOVp+g1/Qa8OokhokSZFEvNDbQ1qol0KrpnJrzEytVX+2scGaDgx+L2hTwhKpZ+ZMgG
 FFRrBVpjGlG7Oogq2Sg==
X-Google-Smtp-Source: AGHT+IHnS/+w8vgB7Qer4VFmmeqW2fg9vqIPQjMtQu2PKuXwZePY3kDPFYEnC2G7XWePQ888jen21Q==
X-Received: by 2002:a05:600c:5027:b0:43c:fa52:7d2d with SMTP id
 5b1f17b1804b1-4406abfa6bcmr157183955e9.20.1745415792377; 
 Wed, 23 Apr 2025 06:43:12 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:2835:c2f4:c226:77dd?
 ([2a01:e0a:3d9:2080:2835:c2f4:c226:77dd])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-44092db2ba6sm26108245e9.31.2025.04.23.06.43.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Apr 2025 06:43:11 -0700 (PDT)
Message-ID: <1acbe9dc-02ca-4233-a79a-901e714f5c9c@linaro.org>
Date: Wed, 23 Apr 2025 15:43:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 32/33] dt-bindings: display: panel: samsung,ams581vf01:
 Add google,sunfish
To: Danila Tikhonov <danila@jiaxyga.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-watchdog@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-mmc@vger.kernel.org,
 netdev@vger.kernel.org, linux-scsi@vger.kernel.org,
 dmaengine@vger.kernel.org, linux-crypto@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
 linux-remoteproc@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-hardening@vger.kernel.org, linux@mainlining.org,
 ~postmarketos/upstreaming@lists.sr.ht
References: <20250422213137.80366-1-danila@jiaxyga.com>
 <20250422213137.80366-16-danila@jiaxyga.com>
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
In-Reply-To: <20250422213137.80366-16-danila@jiaxyga.com>
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

On 22/04/2025 23:31, Danila Tikhonov wrote:
> This panel is used in Google Pixel 4a (google,sunfish). Document the
> corresponding string.
> 
> Signed-off-by: Danila Tikhonov <danila@jiaxyga.com>
> ---
>   .../bindings/display/panel/samsung,ams581vf01.yaml        | 8 +++++++-
>   1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/samsung,ams581vf01.yaml b/Documentation/devicetree/bindings/display/panel/samsung,ams581vf01.yaml
> index 70dff9c0ef2b..a3a1de32d8be 100644
> --- a/Documentation/devicetree/bindings/display/panel/samsung,ams581vf01.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/samsung,ams581vf01.yaml
> @@ -17,7 +17,13 @@ allOf:
>   
>   properties:
>     compatible:
> -    const: samsung,ams581vf01
> +    oneOf:
> +      - enum:
> +          - samsung,ams581vf01
> +      - items:
> +          - enum:
> +              - google,ams581vf01-sunfish
> +          - const: samsung,ams581vf01


Why do you introduce a new compatible ? using samsung,ams581vf01 is prefectly fine
if it's same panel.

Neil

>   
>     reg:
>       maxItems: 1

