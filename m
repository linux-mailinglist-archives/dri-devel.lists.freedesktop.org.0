Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BFEBE8202CF
	for <lists+dri-devel@lfdr.de>; Sat, 30 Dec 2023 00:26:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C94510E2D5;
	Fri, 29 Dec 2023 23:26:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E40610E2D5
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Dec 2023 23:26:37 +0000 (UTC)
Received: from i53875a56.versanet.de ([83.135.90.86] helo=diego.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1rJMFD-0004hv-JM; Sat, 30 Dec 2023 00:26:23 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Sandy Huang <hjc@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Alex Bee <knaerzche@gmail.com>
Subject: Re: [PATCH v4 01/29] dt-bindings: display: rockchip,
 inno-hdmi: Document RK3128 compatible
Date: Sat, 30 Dec 2023 00:26:22 +0100
Message-ID: <18743278.sWSEgdgrri@diego>
In-Reply-To: <20231222174220.55249-2-knaerzche@gmail.com>
References: <20231222174220.55249-1-knaerzche@gmail.com>
 <20231222174220.55249-2-knaerzche@gmail.com>
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Alex Bee <knaerzche@gmail.com>,
 linux-rockchip@lists.infradead.org, Conor Dooley <conor.dooley@microchip.com>,
 David Airlie <airlied@gmail.com>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am Freitag, 22. Dezember 2023, 18:41:52 CET schrieb Alex Bee:
> The integration for this SoC is different from the currently existing: It
> needs it's PHY's reference clock rate to calculate the DDC bus frequency
> correctly. The controller is also part of a powerdomain, so this gets added
> as an mandatory property for this variant.
> 
> Signed-off-by: Alex Bee <knaerzche@gmail.com>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

this is just a note to myself:

The binding conversion to yaml was picked by Rob in [0], so will most 
likely be part of 6.8-rc1, so this will need to wait until 6.8-rc1 gets into
drm-misc-next .


Heiko


[0] https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git/commit/?h=for-next&id=7048708fec3a401f9a70e4a74e2e12aa7f88c132

> ---
> changes in v2:
>  - clarify that the controller itself is part of the powerdomain
>  - simplify clock-names
>  - made power-domains property only allowed (and required) for new variant
> 
> changes in v3:
>  - collect RB
> 
> changes in v4:
>  - none
> 
>  .../display/rockchip/rockchip,inno-hdmi.yaml  | 40 ++++++++++++++++++-
>  1 file changed, 38 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip,inno-hdmi.yaml b/Documentation/devicetree/bindings/display/rockchip/rockchip,inno-hdmi.yaml
> index 96889c86849a..be78dcfa1c76 100644
> --- a/Documentation/devicetree/bindings/display/rockchip/rockchip,inno-hdmi.yaml
> +++ b/Documentation/devicetree/bindings/display/rockchip/rockchip,inno-hdmi.yaml
> @@ -14,6 +14,7 @@ properties:
>    compatible:
>      enum:
>        - rockchip,rk3036-inno-hdmi
> +      - rockchip,rk3128-inno-hdmi
>  
>    reg:
>      maxItems: 1
> @@ -22,10 +23,19 @@ properties:
>      maxItems: 1
>  
>    clocks:
> -    maxItems: 1
> +    minItems: 1
> +    items:
> +      - description: The HDMI controller main clock
> +      - description: The HDMI PHY reference clock
>  
>    clock-names:
> -    const: pclk
> +    minItems: 1
> +    items:
> +      - const: pclk
> +      - const: ref
> +
> +  power-domains:
> +    maxItems: 1
>  
>    ports:
>      $ref: /schemas/graph.yaml#/properties/ports
> @@ -55,6 +65,32 @@ required:
>    - pinctrl-names
>    - ports
>  
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: rockchip,rk3036-inno-hdmi
> +
> +    then:
> +      properties:
> +        power-domains: false
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: rockchip,rk3128-inno-hdmi
> +
> +    then:
> +      properties:
> +        clocks:
> +          minItems: 2
> +        clock-names:
> +          minItems: 2
> +      required:
> +        - power-domains
> +
>  additionalProperties: false
>  
>  examples:
> 




