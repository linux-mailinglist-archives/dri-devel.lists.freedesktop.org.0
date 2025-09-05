Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88AE8B45C2A
	for <lists+dri-devel@lfdr.de>; Fri,  5 Sep 2025 17:17:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EC4310EBEF;
	Fri,  5 Sep 2025 15:17:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="l4j9yTlN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58A2510EBEC
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Sep 2025 15:17:41 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 4AFA660218;
 Fri,  5 Sep 2025 15:17:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D300FC4CEF1;
 Fri,  5 Sep 2025 15:17:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1757085460;
 bh=ZDMZmwFVprdwP6uIwZJxxoRillFdVRRDd7v74bXNSqs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=l4j9yTlNkRclcDOMxYQ51YiZTtuXyRpFfmApayK9UpqbnK7mKINjELxwpt025Rwgc
 hIiEycQUINH8zlkSysf2YUWw1QfNsz8TyB48qeJH3KBbRaSmVCUBc66E1bS24mrlBp
 Z/2A33HLUhSvsPeU82bXzMCuoKgYmT25+F8qIcE8WOw3R5txSIzMx12TLzhHe3q0QK
 dKsRqd0pe1S64LygZFQQf8ktvgyTtLyTwzEegqdrKr9dEqKmoW9gNxfPc0DTmSuHMw
 myoGcE6Pcv5U8cz7M3FI5jOWoKzjjRuNkhISiau3dMlnEzPEBZQekkMM7naAoAJr3P
 AdGhzjrkEh+TA==
Date: Fri, 5 Sep 2025 10:17:39 -0500
From: Rob Herring <robh@kernel.org>
To: Aleksandrs Vinarskis <alex@vinarskis.com>
Cc: Hans de Goede <hansg@kernel.org>, Lee Jones <lee@kernel.org>,
 Pavel Machek <pavel@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Daniel Thompson <danielt@kernel.org>, Jingoo Han <jingoohan1@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Jean-Jacques Hiblot <jjhiblot@traphandler.com>,
 Jacopo Mondi <jacopo@jmondi.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, linux-leds@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Daniel Thompson <daniel.thompson@linaro.org>,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 1/4] dt-bindings: leds: add generic LED consumer
 documentation
Message-ID: <20250905151739.GA953718-robh@kernel.org>
References: <20250905-leds-v2-0-ed8f66f56da8@vinarskis.com>
 <20250905-leds-v2-1-ed8f66f56da8@vinarskis.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250905-leds-v2-1-ed8f66f56da8@vinarskis.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Sep 05, 2025 at 09:59:29AM +0200, Aleksandrs Vinarskis wrote:
> Introduce common generic led consumer binding, where consumer defines
> led(s) by phandle, as opposed to trigger-source binding where the
> trigger source is defined in led itself.
> 
> Add already used in some schemas 'leds' parameter which expects
> phandle-array. Additionally, introduce 'led-names' which could be used
> by consumers to map LED devices to their respective functions.

Please update the existing user dropping the type $ref and indicate how 
many entries (i.e. "maxItems: 1").

> 
> Signed-off-by: Aleksandrs Vinarskis <alex@vinarskis.com>
> ---
>  .../devicetree/bindings/leds/leds-consumer.yaml    | 85 ++++++++++++++++++++++
>  1 file changed, 85 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/leds/leds-consumer.yaml b/Documentation/devicetree/bindings/leds/leds-consumer.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..077dbe3ad9ff3fa15236b8dd1f448c00271e4810
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/leds-consumer.yaml
> @@ -0,0 +1,85 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/leds/leds-consumer.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Common leds consumer
> +
> +maintainers:
> +  - Aleksandrs Vinarskis <alex@vinarskis.com>
> +
> +description:
> +  Some LED defined in DT are required by other DT consumers, for example
> +  v4l2 subnode may require privacy or flash LED. Unlike trigger-source
> +  approach which is typically used as 'soft' binding, referencing LED
> +  devices by phandle makes things simpler when 'hard' binding is desired.
> +
> +  Document LED properties that its consumers may define.
> +

select: true


> +properties:
> +  leds:
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    description:
> +      A list of LED device(s) required by a particular consumer.
> +    items:
> +      maxItems: 1
> +
> +  led-names:
> +    description:
> +      A list of device name(s). Used to map LED devices to their respective
> +      functions, when consumer requires more than one LED.
> +
> +additionalProperties: true
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +    #include <dt-bindings/leds/common.h>
> +
> +    leds {
> +        compatible = "gpio-leds";
> +
> +        privacy_led: privacy-led {
> +            color = <LED_COLOR_ID_RED>;
> +            default-state = "off";
> +            function = LED_FUNCTION_INDICATOR;
> +            gpios = <&tlmm 110 GPIO_ACTIVE_HIGH>;
> +        };
> +    };
> +
> +    i2c {
> +      #address-cells = <1>;
> +      #size-cells = <0>;
> +
> +      camera@36 {
> +        compatible = "ovti,ov02c10";
> +        reg = <0x36>;
> +
> +        reset-gpios = <&tlmm 237 GPIO_ACTIVE_LOW>;
> +        pinctrl-names = "default";
> +        pinctrl-0 = <&cam_rgb_default>;
> +
> +        led-names = "privacy-led";
> +        leds = <&privacy_led>;
> +
> +        clocks = <&ov02e10_clk>;
> +
> +        assigned-clocks = <&ov02e10_clk>;
> +        assigned-clock-rates = <19200000>;
> +
> +        avdd-supply = <&vreg_l7b_2p8>;
> +        dvdd-supply = <&vreg_l7b_2p8>;
> +        dovdd-supply = <&vreg_cam_1p8>;
> +
> +        port {
> +          ov02e10_ep: endpoint {
> +            data-lanes = <1 2>;
> +            link-frequencies = /bits/ 64 <400000000>;
> +            remote-endpoint = <&csiphy4_ep>;
> +          };
> +        };
> +      };
> +    };
> +
> +...
> 
> -- 
> 2.48.1
> 
