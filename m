Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1075F1BF168
	for <lists+dri-devel@lfdr.de>; Thu, 30 Apr 2020 09:32:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B469E6EB4F;
	Thu, 30 Apr 2020 07:31:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from crapouillou.net (outils.crapouillou.net [89.234.176.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D89CB6E853
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Apr 2020 12:21:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1588162894; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FKkgFmxpN+MKyPoHJp2q8jKr/zPjuo5QgcSt5/FFYlM=;
 b=BJYD6VCvJr5NwVsS7cOFPVRIp+PL1rfh/JKRMIwhc70MxSxy6RmNeVJyTjDxI2otmwhfoF
 5QbtopHXuozSQsDjZN9F9OWwYTZd5UwfXQ0K+IvDlG+ysvlppxwmEpMfsvZG77b8cbJhN1
 I+8+e8MCoetpBc/ro4H5h+TdvwLBKYA=
Date: Tue, 28 Apr 2020 16:12:21 +0200
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH 8/8] dt-bindings: display: Convert ingenic, lcd.txt to YAML
To: Rob Herring <robh+dt@kernel.org>
Message-Id: <LS4I9Q.A1ZGRSEVADNN1@crapouillou.net>
In-Reply-To: <20200426185856.38826-8-paul@crapouillou.net>
References: <20200426185856.38826-1-paul@crapouillou.net>
 <20200426185856.38826-8-paul@crapouillou.net>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 30 Apr 2020 07:31:56 +0000
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
 dri-devel@lists.freedesktop.org,
 =?UTF-8?b?5ZGo55Cw5p2w?= <zhouyanjie@wanyeetech.com>,
 linux-gpio@vger.kernel.org, od@zcrc.me, linux-mtd@lists.infradead.org,
 linux-i2c@vger.kernel.org, linux-serial@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-clk@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This one patch will need a V2, I messed up with the clocks.

-Paul


Le dim. 26 avril 2020 =E0 20:58, Paul Cercueil <paul@crapouillou.net> a =

=E9crit :
> Convert the ingenic,lcd.txt to a new ingenic,lcd.yaml file.
> =

> In the process, the new ingenic,jz4780-lcd compatible string has been
> added.
> =

> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
>  .../bindings/display/ingenic,lcd.txt          |  45 -------
>  .../bindings/display/ingenic,lcd.yaml         | 113 =

> ++++++++++++++++++
>  2 files changed, 113 insertions(+), 45 deletions(-)
>  delete mode 100644 =

> Documentation/devicetree/bindings/display/ingenic,lcd.txt
>  create mode 100644 =

> Documentation/devicetree/bindings/display/ingenic,lcd.yaml
> =

> diff --git =

> a/Documentation/devicetree/bindings/display/ingenic,lcd.txt =

> b/Documentation/devicetree/bindings/display/ingenic,lcd.txt
> deleted file mode 100644
> index 01e3261defb6..000000000000
> --- a/Documentation/devicetree/bindings/display/ingenic,lcd.txt
> +++ /dev/null
> @@ -1,45 +0,0 @@
> -Ingenic JZ47xx LCD driver
> -
> -Required properties:
> -- compatible: one of:
> -  * ingenic,jz4740-lcd
> -  * ingenic,jz4725b-lcd
> -  * ingenic,jz4770-lcd
> -- reg: LCD registers location and length
> -- clocks: LCD pixclock and device clock specifiers.
> -	   The device clock is only required on the JZ4740.
> -- clock-names: "lcd_pclk" and "lcd"
> -- interrupts: Specifies the interrupt line the LCD controller is =

> connected to.
> -
> -Example:
> -
> -panel {
> -	compatible =3D "sharp,ls020b1dd01d";
> -
> -	backlight =3D <&backlight>;
> -	power-supply =3D <&vcc>;
> -
> -	port {
> -		panel_input: endpoint {
> -			remote-endpoint =3D <&panel_output>;
> -		};
> -	};
> -};
> -
> -
> -lcd: lcd-controller@13050000 {
> -	compatible =3D "ingenic,jz4725b-lcd";
> -	reg =3D <0x13050000 0x1000>;
> -
> -	interrupt-parent =3D <&intc>;
> -	interrupts =3D <31>;
> -
> -	clocks =3D <&cgu JZ4725B_CLK_LCD>;
> -	clock-names =3D "lcd";
> -
> -	port {
> -		panel_output: endpoint {
> -			remote-endpoint =3D <&panel_input>;
> -		};
> -	};
> -};
> diff --git =

> a/Documentation/devicetree/bindings/display/ingenic,lcd.yaml =

> b/Documentation/devicetree/bindings/display/ingenic,lcd.yaml
> new file mode 100644
> index 000000000000..8e9c851dc7c5
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/ingenic,lcd.yaml
> @@ -0,0 +1,113 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/ingenic,lcd.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Ingenic SoCs LCD controller devicetree bindings
> +
> +maintainers:
> +  - Paul Cercueil <paul@crapouillou.net>
> +
> +properties:
> +  $nodename:
> +    pattern: "^lcd-controller@[0-9a-f]+$"
> +
> +  compatible:
> +    enum:
> +      - ingenic,jz4740-lcd
> +      - ingenic,jz4725b-lcd
> +      - ingenic,jz4770-lcd
> +      - ingenic,jz4780-lcd
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: Module clock
> +      - description: Pixel clock
> +    minItems: 1
> +
> +  clock-names:
> +    items:
> +      - const: lcd
> +      - const: lcd_pclk
> +    minItems: 1
> +
> +  port:
> +    type: object
> +    description:
> +      A port node with endpoint definitions as defined in
> +      Documentation/devicetree/bindings/media/video-interfaces.txt
> +
> +required:
> +    - compatible
> +    - reg
> +    - interrupts
> +    - clocks
> +    - clock-names
> +
> +if:
> +  properties:
> +    compatible:
> +      contains:
> +        enum:
> +          - ingenic,jz4740-lcd
> +          - ingenic,jz4780-lcd
> +then:
> +  properties:
> +    clocks:
> +      minItems: 2
> +    clock-names:
> +      minItems: 2
> +else:
> +  properties:
> +    clocks:
> +      maxItems: 1
> +    clock-names:
> +      maxItems: 1
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/jz4740-cgu.h>
> +    lcd-controller@13050000 {
> +      compatible =3D "ingenic,jz4740-lcd";
> +      reg =3D <0x13050000 0x1000>;
> +
> +      interrupt-parent =3D <&intc>;
> +      interrupts =3D <30>;
> +
> +      clocks =3D <&cgu JZ4740_CLK_LCD>, <&cgu JZ4740_CLK_LCD_PCLK>;
> +      clock-names =3D "lcd", "lcd_pclk";
> +
> +      port {
> +        endpoint {
> +          remote-endpoint =3D <&panel_input>;
> +        };
> +      };
> +    };
> +
> +  - |
> +    #include <dt-bindings/clock/jz4725b-cgu.h>
> +    lcd-controller@13050000 {
> +      compatible =3D "ingenic,jz4725b-lcd";
> +      reg =3D <0x13050000 0x1000>;
> +
> +      interrupt-parent =3D <&intc>;
> +      interrupts =3D <31>;
> +
> +      clocks =3D <&cgu JZ4725B_CLK_LCD>;
> +      clock-names =3D "lcd";
> +
> +      port {
> +        endpoint {
> +          remote-endpoint =3D <&panel_input>;
> +        };
> +      };
> +    };
> --
> 2.26.2
> =



_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
