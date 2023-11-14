Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 426637EB8F8
	for <lists+dri-devel@lfdr.de>; Tue, 14 Nov 2023 22:55:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CB6110E420;
	Tue, 14 Nov 2023 21:55:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCFC010E420
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Nov 2023 21:55:05 +0000 (UTC)
Received: from i53875a73.versanet.de ([83.135.90.115] helo=diego.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1r31N6-0006uH-5s; Tue, 14 Nov 2023 22:55:00 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Andy Yan <andyshrk@163.com>
Subject: Re: [PATCH 08/11] dt-bindings: display: vop2: Add rk3588 support
Date: Tue, 14 Nov 2023 22:54:59 +0100
Message-ID: <11331566.rMLUfLXkoz@diego>
In-Reply-To: <20231114112841.1771312-1-andyshrk@163.com>
References: <20231114112534.1770731-1-andyshrk@163.com>
 <20231114112841.1771312-1-andyshrk@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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
Cc: devicetree@vger.kernel.org, s.hauer@pengutronix.de,
 chris.obbard@collabora.com, hjc@rock-chips.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kever.yang@rock-chips.com, linux-rockchip@lists.infradead.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 Andy Yan <andy.yan@rock-chips.com>, sebastian.reichel@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am Dienstag, 14. November 2023, 12:28:41 CET schrieb Andy Yan:
> From: Andy Yan <andy.yan@rock-chips.com>
> 
> The vop2 on rk3588 is similar to which on rk356x
> but with 4 video outputs and need to reference
> more grf modules.
> 
> Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
> ---
> 
>  .../display/rockchip/rockchip-vop2.yaml       | 25 +++++++++++++++++++
>  1 file changed, 25 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip-vop2.yaml b/Documentation/devicetree/bindings/display/rockchip/rockchip-vop2.yaml
> index b60b90472d42..c333c651da1a 100644
> --- a/Documentation/devicetree/bindings/display/rockchip/rockchip-vop2.yaml
> +++ b/Documentation/devicetree/bindings/display/rockchip/rockchip-vop2.yaml
> @@ -20,6 +20,7 @@ properties:
>      enum:
>        - rockchip,rk3566-vop
>        - rockchip,rk3568-vop
> +      - rockchip,rk3588-vop
>  
>    reg:
>      items:
> @@ -48,6 +49,8 @@ properties:
>        - description: Pixel clock for video port 0.
>        - description: Pixel clock for video port 1.
>        - description: Pixel clock for video port 2.
> +      - description: Pixel clock for video port 4.
> +      - description: Peripheral clock for vop on rk3588.
>  
>    clock-names:
>      items:
> @@ -56,12 +59,29 @@ properties:
>        - const: dclk_vp0
>        - const: dclk_vp1
>        - const: dclk_vp2
> +      - const: dclk_vp3
> +      - const: pclk_vop

with the error Rob's bot reported, I guess both clocks and clock-names
need a minItems element to mark these new clocks essentially as optional?


>    rockchip,grf:
>      $ref: /schemas/types.yaml#/definitions/phandle
>      description:
>        Phandle to GRF regs used for misc control
>  
> +  rockchip,vo-grf:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      Phandle to VO GRF regs used for misc control, required for rk3588
> +
> +  rockchip,vop-grf:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      Phandle to VOP GRF regs used for misc control, required for rk3588
> +
> +  rockchip,pmu:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      Phandle to PMU regs used for misc control, required for rk3588
> +
>    ports:
>      $ref: /schemas/graph.yaml#/properties/ports
>  
> @@ -81,6 +101,11 @@ properties:
>          description:
>            Output endpoint of VP2
>  
> +      port@3:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description:
> +          Output endpoint of VP3
> +
>    iommus:
>      maxItems: 1
>  
> 




