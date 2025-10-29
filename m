Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C94E9C1D3A5
	for <lists+dri-devel@lfdr.de>; Wed, 29 Oct 2025 21:38:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2230B10E839;
	Wed, 29 Oct 2025 20:38:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="WwmFo32b";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EA2810E839
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Oct 2025 20:38:32 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-426fc536b5dso172819f8f.3
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Oct 2025 13:38:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761770311; x=1762375111; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=QZZWPacVTome8i/td23ATqpr5fxPQl52SGeEOJvaFRk=;
 b=WwmFo32bU3emvfbknmyhWkRlMKriVh00W7+nEceau0QS3JDCXSMJr61FOujBzXO58S
 ASwJ2MbATpq367j5C6Zw2DMvNNyT4YVNtWXs48ZN4VDbG5uIvxXeO7fJ7zMvzmG9Mjtr
 +qX/m7BMrJrpdhPXMpne1jUlriosgoOOFcR2ZlGUnlQ47mt28BXbSFddddKS3aBxiBXq
 Y7BQuxsVk0urlOl6jVbGNDD/OdPf0OXHwCTB3bpGgs71OSr0td4r3HBLboV+JnVXsscs
 aywDeTay5bo84PJzZYV5FQOWGftVibjbOLRueMlTKIYd+g1EByTyAPOs7J4gDTS2vnMM
 Yf9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761770311; x=1762375111;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=QZZWPacVTome8i/td23ATqpr5fxPQl52SGeEOJvaFRk=;
 b=PdzwWzbNSrkoUbiTxRDIGUj7hw/p/+JcuXLxNlQQYR/6HcYasKlC1IwQinnuT5CKrX
 CmIO+yHoIifaCACBte6emnKY/z+5CQkD+uFnLoCQoH3XFSekSCTGZY/SpB1bsZum3LzK
 Jeyh1ig6jLj+5L3mz9YCtRGHDFKZ1gDLPeHeTZqF4Ij+MzM32VH6xWr8wjKo7RApw3yk
 DC3bMugccRrcCQdy+g4yR00HOGFqjrGWcSAyYvyuJXJthLaa+3ws25PFRsXuugAfhQ8z
 wqo1LYcgiibeHVY9IgKRhuYKEgkG9RqPaIF6qAJ3gIHMSHTTq9QyMYtUXRVa9cyxBPBd
 2jEw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU1MD8YQg+saF8/2ukVsQdMG+JXqdkxga0CwCsdmuIneg0cbhcsbn4hzvYYqSwkhb6FgK47HBt3Z4o=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzMiBy8dPhKBc1rcNxi5GfvXA/DKjSwsNEQwKVaurbNBxtnXb/D
 aKn4XlnhEkXNvY9+Mn8kgB05DJ6ctK9lunveHuAhaTkLruPDBKr7SNl8HsJRka2abp4=
X-Gm-Gg: ASbGnctV/vCndWwatWoMJWqYInRHKNz72Vp1t+kxZIpyliRbsQfpKuKAD08+Jtvi0IS
 Pt9P73Fe0JJGvu9Kiy64blQzSq2zChahi7Bo42eZ9GS/EpEEeANxXZ5+4KJLpp1Mz++aHNxgORR
 ERdPC51/0BAhWhftW2PX0FYc+2VQKcwrDhc+vFTMpYiBSBSkmxCgMH7WFJ0RM7AkpEeoKepQD+F
 1Q0PgDJhDwQvhy6TVvgRLNLBXOeveuZrgEqsOZKBaP+dpoqhxvAjnla6ckx62GZP+O6a4iRXHZs
 VmqLTNUMJn+QT0mecjEEP87SNlBQuefDmv3+PhHjG5B431woMg9vAEPGwqgzhfCIHZ8JbRYeBTo
 XljeYCVz1+gYLzkDsxZl8ZljZ6YFnGz/mUVqifUxA2HuOtnEbUPiUIQ8KFRx3pdtcp2E+Vpy+Tm
 kFsw/I6+gLEXIzIhsCHIpAoCnMT8cCTU+VUN4vrLe2AETsecllmQ==
X-Google-Smtp-Source: AGHT+IEql7WhgFE2ZyhRhdguRGYBWDwfbeIdgbMOHnGRkmwfrCwTcZSg+FoIVVzr5qW+ZqxN0Ht5cw==
X-Received: by 2002:a05:6000:4211:b0:429:8c31:84b7 with SMTP id
 ffacd0b85a97d-429aefd6aa2mr3537391f8f.39.1761770311185; 
 Wed, 29 Oct 2025 13:38:31 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:cad:2140:3447:eb7a:cb9f:5e0?
 ([2a01:e0a:cad:2140:3447:eb7a:cb9f:5e0])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-477289e8139sm2028605e9.15.2025.10.29.13.38.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Oct 2025 13:38:30 -0700 (PDT)
Message-ID: <74dbab41-a46a-464f-98ae-c478b4afd6b9@linaro.org>
Date: Wed, 29 Oct 2025 21:38:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] dt-bindings: display: bridge: renesas, dsi-csi2-tx: Align
 panel example with ili9881c binding
To: Marek Vasut <marek.vasut+renesas@mailbox.org>, devicetree@vger.kernel.org
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Rob Herring <robh@kernel.org>,
 Robert Foss <rfoss@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org
References: <20251029200519.214548-1-marek.vasut+renesas@mailbox.org>
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
In-Reply-To: <20251029200519.214548-1-marek.vasut+renesas@mailbox.org>
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

On 10/29/25 21:04, Marek Vasut wrote:
> Update the panel example in this DT schema to match requirements in binding
> display/panel/ilitek,ili9881c.yaml . This fixes the following schema check
> warnings:
> 
> "
> /tmp/dtx/Documentation/devicetree/bindings/display/bridge/renesas,dsi-csi2-tx.example.dtb: panel@0 (raspberrypi,dsi-7inch): compatible: ['raspberrypi,dsi-7inch'] is too short
>          from schema $id: http://devicetree.org/schemas/display/panel/ilitek,ili9881c.yaml
> /tmp/dtx/Documentation/devicetree/bindings/display/bridge/renesas,dsi-csi2-tx.example.dtb: panel@0 (raspberrypi,dsi-7inch): 'power-supply' is a required property
>          from schema $id: http://devicetree.org/schemas/display/panel/ilitek,ili9881c.yaml
> "
> 
> Fixes: c376a6943741 ("dt-bindings: display: bridge: renesas,dsi-csi2-tx: Allow panel@ subnode")
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> ---
> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
> Cc: Jonas Karlman <jonas@kwiboo.se>
> Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Robert Foss <rfoss@kernel.org>
> Cc: Simona Vetter <simona@ffwll.ch>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> Cc: devicetree@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-renesas-soc@vger.kernel.org
> ---
>   .../bindings/display/bridge/renesas,dsi-csi2-tx.yaml           | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/renesas,dsi-csi2-tx.yaml b/Documentation/devicetree/bindings/display/bridge/renesas,dsi-csi2-tx.yaml
> index 51d685ed82891..b95f10edd3a29 100644
> --- a/Documentation/devicetree/bindings/display/bridge/renesas,dsi-csi2-tx.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/renesas,dsi-csi2-tx.yaml
> @@ -157,7 +157,8 @@ examples:
>   
>           panel@0 {
>               reg = <0>;
> -            compatible = "raspberrypi,dsi-7inch";
> +            compatible = "raspberrypi,dsi-7inch", "ilitek,ili9881c";
> +            power-supply = <&vcc_lcd_reg>;
>   
>               port {
>                   panel_in: endpoint {

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
