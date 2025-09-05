Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47264B45043
	for <lists+dri-devel@lfdr.de>; Fri,  5 Sep 2025 09:51:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FAFD10EB35;
	Fri,  5 Sep 2025 07:51:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Y9A9d4tB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com
 [209.85.218.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78FFF10EB35
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Sep 2025 07:51:43 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id
 a640c23a62f3a-aff0775410eso382920166b.0
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Sep 2025 00:51:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1757058702; x=1757663502; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=OTkMukFvFRGpUIaR3bcrLvyQUvlizTeZ6D8ftQ6ewB8=;
 b=Y9A9d4tBtSfRkB9iEE8WtZH42mcYRnH25QV/iig3AlSWpzGzXvVeUX2uWnEBKzpbvo
 yZRtzP8r31eSz8jtc1HG0JgadxKzrk2PKwEdnEV852XfHED2Fq7TXMP+loMUsm/Dl0gV
 j8FQJWEh4qto4d9Lw3DOxZ4atWgdBzFOvcs/XtEMS8vXoAMCtIlb6at+X2c1ZWLAgldd
 icUPICRqZ8mOmP7MbYTY5pEZHDyRNozBJ3sNppTv0/5Z8PCILBLjyPF3mLtqD/2fX1QU
 frqUdjLQMFCF8yuZlRl/+gu4z0crhwwMbkejp7zQ4GVjXU8W+bjtdYRyYpSpgJ80svPJ
 HATA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757058702; x=1757663502;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=OTkMukFvFRGpUIaR3bcrLvyQUvlizTeZ6D8ftQ6ewB8=;
 b=lbdIcAyky7n/42H6dGcP5wLUDtViH31CDAW6wqjIDLR5oZpchh5uqV74VcsCs6qEwS
 9foDhn0rfhSDJM57F69ASTaDQJCw18wWkwutGNx7QVhh5O5p+A7JnyVgU3/H5UAkJXay
 bHe2lA2gxwKtMzhdCL5UXOcDBh2tVUvJC+qPMmYWCkRoSc6t1xb9bdqI/cdoo2HK+/C3
 StKSDPxZaV7vlMFE61r4EWSYMMfgQ5IwdydIer5dMdTdb8yasc1GlKyGxxCm7piQq/P4
 o/fuWB1WJj89bZpqFgVruqzXz/6ThkYI3aX2UwRNU0waPIDrpttjO+1XLlxOXzXV4y1E
 LuSQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUU+jU5d02Bz0rBrt6gdqv0vxDWPYFqEfEuZX92o2YR6RCnml5t5tXpeIjx8wktqhYzt55OFTzsKr4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxnqQdMl9cz9YA/BOVnylXaWgp+WYJqTMIZIx7extmxoRM7a5VI
 tbiHTYYEs7noFPdUM6jtKpPc/Qr3meSbU7j4dS8dsqKfZoXCCE9u3XUXIeytcc8+OYI=
X-Gm-Gg: ASbGnctbvSDI6Q1qUUyJgson0Mh/gqvABK+3s4nHGXr6eCOFlqmC0Cv0MNhnthKPiU9
 0vDk0OM3aWFbqCEhDyBApES5QgWcY3dSeMpTXaJXtJLOIky8awM9qyfbocI5sRUXoHIcn3GQUL+
 rlqlm/IRHXMeq9gfEp3q9SKzLQ4gF4Dp0Lf+/PRFT7ySntRpJu59KuIH+gGKmdfqeeaZj7vJmp8
 IXD3SgoO9cX44E+5ogNGmCEjdhFL+RZCr1mCMRWw7cidDuiB27/pN/Mdu6KJxtt5+5bf7p2Qk01
 TUpgeRE6SxQLvJNbfNon6GncQODNpMRQmVOwfWgR333UGfkxfATFAJalN6cUeLe9xyyxx4u3BPZ
 vBi2eLszqQ5w+R4KvObsOhmYdjMpOf0Il2g+9T75iSM+7k/iNjEy8yOs=
X-Google-Smtp-Source: AGHT+IE9ONGaCVuMDUsDk5AMP12J/m85KDluThMZ0nObk2fo54w+Ym2od7+l60KIMrqn55YK25utpQ==
X-Received: by 2002:a17:906:eec3:b0:b04:3cd2:265b with SMTP id
 a640c23a62f3a-b0493084d84mr250335766b.5.1757058701824; 
 Fri, 05 Sep 2025 00:51:41 -0700 (PDT)
Received: from [192.168.7.190] ([212.114.21.58])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b01af44a01fsm1479647366b.23.2025.09.05.00.51.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Sep 2025 00:51:41 -0700 (PDT)
Message-ID: <25d043fa-a600-46df-b1e4-f24f715d9887@linaro.org>
Date: Fri, 5 Sep 2025 09:51:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 4/4] dt-bindings: display: bridge: renesas, dsi-csi2-tx:
 Allow panel@ subnode
To: Marek Vasut <marek.vasut+renesas@mailbox.org>,
 dri-devel@lists.freedesktop.org
Cc: Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Rob Herring <robh@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <20250904210147.186728-1-marek.vasut+renesas@mailbox.org>
 <20250904210147.186728-4-marek.vasut+renesas@mailbox.org>
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
In-Reply-To: <20250904210147.186728-4-marek.vasut+renesas@mailbox.org>
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

On 04/09/2025 23:01, Marek Vasut wrote:
> This controller can have both bridges and panels connected to it. In
> order to describe panels properly in DT, pull in dsi-controller.yaml
> and disallow only unevaluatedProperties, because the panel node is
> optional. Include example binding with panel.
> 
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> ---
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Robert Foss <rfoss@kernel.org>
> Cc: Simona Vetter <simona@ffwll.ch>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> Cc: devicetree@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-renesas-soc@vger.kernel.org
> ---
> V2: Drop the dsi0: and dsi1: controller labels
> ---
>   .../display/bridge/renesas,dsi-csi2-tx.yaml   | 53 ++++++++++++++++++-
>   1 file changed, 51 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/renesas,dsi-csi2-tx.yaml b/Documentation/devicetree/bindings/display/bridge/renesas,dsi-csi2-tx.yaml
> index c167795c63f64..51d685ed82891 100644
> --- a/Documentation/devicetree/bindings/display/bridge/renesas,dsi-csi2-tx.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/renesas,dsi-csi2-tx.yaml
> @@ -14,6 +14,9 @@ description: |
>     R-Car Gen4 SoCs. The encoder can operate in either DSI or CSI-2 mode, with up
>     to four data lanes.
>   
> +allOf:
> +  - $ref: /schemas/display/dsi-controller.yaml#
> +
>   properties:
>     compatible:
>       enum:
> @@ -80,14 +83,14 @@ required:
>     - resets
>     - ports
>   
> -additionalProperties: false
> +unevaluatedProperties: false
>   
>   examples:
>     - |
>       #include <dt-bindings/clock/r8a779a0-cpg-mssr.h>
>       #include <dt-bindings/power/r8a779a0-sysc.h>
>   
> -    dsi0: dsi-encoder@fed80000 {
> +    dsi@fed80000 {
>           compatible = "renesas,r8a779a0-dsi-csi2-tx";
>           reg = <0xfed80000 0x10000>;
>           power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
> @@ -117,4 +120,50 @@ examples:
>               };
>           };
>       };
> +
> +  - |
> +    #include <dt-bindings/clock/r8a779g0-cpg-mssr.h>
> +    #include <dt-bindings/power/r8a779g0-sysc.h>
> +
> +    dsi@fed80000 {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +        compatible = "renesas,r8a779g0-dsi-csi2-tx";
> +        reg = <0xfed80000 0x10000>;
> +        clocks = <&cpg CPG_MOD 415>,
> +                 <&cpg CPG_CORE R8A779G0_CLK_DSIEXT>,
> +                 <&cpg CPG_CORE R8A779G0_CLK_DSIREF>;
> +        clock-names = "fck", "dsi", "pll";
> +        power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
> +        resets = <&cpg 415>;
> +
> +        ports {
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +
> +            port@0 {
> +                reg = <0>;
> +            };
> +
> +            port@1 {
> +                reg = <1>;
> +
> +                dsi0port1_out: endpoint {
> +                    remote-endpoint = <&panel_in>;
> +                    data-lanes = <1 2>;
> +                };
> +            };
> +        };
> +
> +        panel@0 {
> +            reg = <0>;
> +            compatible = "raspberrypi,dsi-7inch";
> +
> +            port {
> +                panel_in: endpoint {
> +                    remote-endpoint = <&dsi0port1_out>;
> +                };
> +            };
> +        };
> +    };
>   ...

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
