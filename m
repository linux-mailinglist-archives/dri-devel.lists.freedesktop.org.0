Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C19EE3C287C
	for <lists+dri-devel@lfdr.de>; Fri,  9 Jul 2021 19:33:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 255276E93B;
	Fri,  9 Jul 2021 17:33:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.smtp.larsendata.com (mx1.smtp.larsendata.com
 [91.221.196.215])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B04C76E93B
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jul 2021 17:33:51 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx1.smtp.larsendata.com (Halon) with ESMTPS
 id cf01f94f-e0db-11eb-9082-0050568c148b;
 Fri, 09 Jul 2021 17:33:44 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id DFCC1194B06;
 Fri,  9 Jul 2021 19:33:57 +0200 (CEST)
Date: Fri, 9 Jul 2021 19:33:46 +0200
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/2 v3] drm/panel: Add DT bindings for Samsung LMS380KF01
Message-ID: <YOiIeoHuv5ZlB7bU@ravnborg.org>
References: <20210707234315.242663-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210707234315.242663-1-linus.walleij@linaro.org>
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
Cc: devicetree@vger.kernel.org,
 Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>,
 Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org,
 Thierry Reding <thierry.reding@gmail.com>, phone-devel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Linus,

On Thu, Jul 08, 2021 at 01:43:14AM +0200, Linus Walleij wrote:
> This adds device tree bindings for the Samsung Mobile Displays
> LMS380KF01 RGB DPI display panel.
> 
> Cc: devicetree@vger.kernel.org
> Cc: phone-devel@vger.kernel.org
> Cc: Douglas Anderson <dianders@chromium.org>
> Cc: Noralf Trønnes <noralf@tronnes.org>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> ChangeLog v2->v3:
> - No changes just resending with the series.
> ChangeLog v1->v2:
> - Expect SPI bindings to be pulled in for the client and state
>   spi-cpha: true etc.
> - Make port a required node.
> - Update the example to use a proper SPI controller (spi-gpio)
>   so we get full validation of the example.
> ---
>  .../display/panel/samsung,lms380kf01.yaml     | 97 +++++++++++++++++++
>  1 file changed, 97 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/samsung,lms380kf01.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/samsung,lms380kf01.yaml b/Documentation/devicetree/bindings/display/panel/samsung,lms380kf01.yaml
> new file mode 100644
> index 000000000000..ebc33c36c124
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/samsung,lms380kf01.yaml
> @@ -0,0 +1,97 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/panel/samsung,lms380kf01.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Samsung LMS380KF01 display panel
> +
> +description: The LMS380KF01 is a 480x800 DPI display panel from Samsung Mobile
> +  Displays (SMD) utilizing the WideChips WS2401 display controller. It can be
> +  used with internal or external backlight control.
Other bindings using spi properties has the followign text:
     The panel must obey the rules for a SPI slave device as specified in
     spi/spi-controller.yaml

Maybe add this here?

> +
> +maintainers:
> +  - Linus Walleij <linus.walleij@linaro.org>
> +
> +allOf:
> +  - $ref: panel-common.yaml#
> +
> +properties:
> +  compatible:
> +    const: samsung,lms380kf01
> +
> +  reg: true
> +
> +  interrupts:
> +    description: provides an optional ESD (electrostatic discharge)
> +      interrupt that signals abnormalities in the display hardware.
> +      This can also be raised for other reasons like erroneous
> +      configuration.
> +    maxItems: 1
> +
> +  reset-gpios: true
> +
> +  vci-supply:
> +    description: regulator that supplies the VCI analog voltage
> +      usually around 3.0 V
> +
> +  vccio-supply:
> +    description: regulator that supplies the VCCIO voltage usually
> +      around 1.8 V
> +
> +  backlight: true
> +
> +  spi-cpha: true
> +
> +  spi-cpol: true
> +
> +  spi-max-frequency:
> +    maximum: 1200000
> +
> +  port: true
> +
> +required:
> +  - compatible
> +  - reg
> +  - spi-cpha
> +  - spi-cpol
> +  - port
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +    spi {
> +      compatible = "spi-gpio";
> +      sck-gpios = <&gpio 0 GPIO_ACTIVE_HIGH>;
> +      miso-gpios = <&gpio 1 GPIO_ACTIVE_HIGH>;
> +      mosi-gpios = <&gpio 2 GPIO_ACTIVE_HIGH>;
> +      cs-gpios = <&gpio 3 GPIO_ACTIVE_HIGH>;
> +      num-chipselects = <1>;
> +      #address-cells = <1>;
> +      #size-cells = <0>;
> +
Most panel/samsung* bindings uses 4 spaces indent.

> +      panel@0 {
> +        compatible = "samsung,lms380kf01";
> +        spi-max-frequency = <1200000>;
> +        spi-cpha;
> +        spi-cpol;
> +        reg = <0>;
> +        vci-supply = <&lcd_3v0_reg>;
> +        vccio-supply = <&lcd_1v8_reg>;
> +        reset-gpios = <&gpio 4 GPIO_ACTIVE_LOW>;
> +        interrupt-parent = <&gpio>;
> +        interrupts = <5 IRQ_TYPE_EDGE_RISING>;
> +
> +        port {
> +          panel_in: endpoint {
> +            remote-endpoint = <&display_out>;
> +          };
> +        };
> +      };
> +    };
> +
> +...

Whith my commnets considered (but not necessary followed):
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
