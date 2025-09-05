Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA9C4B45CA2
	for <lists+dri-devel@lfdr.de>; Fri,  5 Sep 2025 17:34:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D78A10EBDC;
	Fri,  5 Sep 2025 15:34:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="LZf5dAID";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D7DB10EBDC
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Sep 2025 15:34:38 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 3570540BE0;
 Fri,  5 Sep 2025 15:34:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1FB7C4CEF1;
 Fri,  5 Sep 2025 15:34:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1757086478;
 bh=S2f4zsIVkSVZX6263AtP4FMC2mXV744EV7vcHdcxvFs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LZf5dAIDALZlpnlmorOcqX3O1MGgtWtRZyVieJ+6MsMxP5YD1Q4QFHkgp1Vmntr6C
 wvPgaa1NLQiDAngT9jt9lKUU1wIiwiuNyxnEOarNr5lRwAMQJ4aXAuUBXL3YNsLKhi
 dRxiXVQL7Bd7lIv8/Y8Vd/zbd6htZe8bktPgBmflpgd73LEOdGzpHUxeungKUbVvGU
 O3I7FiHp/ADxKKQHPvIXMKVZ3J/a97+jB5Pz92nJvsb7kuKequ1onDHT8CLiL4YHS/
 8r76zT7Emhrny/U3xZPoE9R228e0LdSFRJQpnIqCd1gx+HF2WjfhzOTYwLihlA1KK6
 bakXfsYfKkkKA==
Date: Fri, 5 Sep 2025 10:34:37 -0500
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
Message-ID: <20250905153437.GA970284-robh@kernel.org>
References: <20250905-leds-v2-0-ed8f66f56da8@vinarskis.com>
 <20250905-leds-v2-1-ed8f66f56da8@vinarskis.com>
 <20250905151739.GA953718-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250905151739.GA953718-robh@kernel.org>
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

On Fri, Sep 05, 2025 at 10:17:39AM -0500, Rob Herring wrote:
> On Fri, Sep 05, 2025 at 09:59:29AM +0200, Aleksandrs Vinarskis wrote:
> > Introduce common generic led consumer binding, where consumer defines
> > led(s) by phandle, as opposed to trigger-source binding where the
> > trigger source is defined in led itself.
> > 
> > Add already used in some schemas 'leds' parameter which expects
> > phandle-array. Additionally, introduce 'led-names' which could be used
> > by consumers to map LED devices to their respective functions.
> 
> Please update the existing user dropping the type $ref and indicate how 
> many entries (i.e. "maxItems: 1").

Nevermind, I see you did...

> 
> > 
> > Signed-off-by: Aleksandrs Vinarskis <alex@vinarskis.com>
> > ---
> >  .../devicetree/bindings/leds/leds-consumer.yaml    | 85 ++++++++++++++++++++++
> >  1 file changed, 85 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/leds/leds-consumer.yaml b/Documentation/devicetree/bindings/leds/leds-consumer.yaml
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..077dbe3ad9ff3fa15236b8dd1f448c00271e4810
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/leds/leds-consumer.yaml
> > @@ -0,0 +1,85 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/leds/leds-consumer.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Common leds consumer
> > +
> > +maintainers:
> > +  - Aleksandrs Vinarskis <alex@vinarskis.com>
> > +
> > +description:
> > +  Some LED defined in DT are required by other DT consumers, for example
> > +  v4l2 subnode may require privacy or flash LED. Unlike trigger-source
> > +  approach which is typically used as 'soft' binding, referencing LED
> > +  devices by phandle makes things simpler when 'hard' binding is desired.
> > +
> > +  Document LED properties that its consumers may define.
> > +
> 
> select: true
> 
> 
> > +properties:
> > +  leds:
> > +    $ref: /schemas/types.yaml#/definitions/phandle-array
> > +    description:
> > +      A list of LED device(s) required by a particular consumer.
> > +    items:
> > +      maxItems: 1

Also, the select is going to cause a problem with nodes named 'leds', so 
it will need to be:

leds:
  oneOf:
    - type: object
    - $ref: /schemas/types.yaml#/definitions/phandle-array
      ...

> > +
> > +  led-names:
> > +    description:
> > +      A list of device name(s). Used to map LED devices to their respective
> > +      functions, when consumer requires more than one LED.
> > +
> > +additionalProperties: true
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/gpio/gpio.h>
> > +    #include <dt-bindings/leds/common.h>
> > +
> > +    leds {
> > +        compatible = "gpio-leds";
> > +
> > +        privacy_led: privacy-led {
> > +            color = <LED_COLOR_ID_RED>;
> > +            default-state = "off";
> > +            function = LED_FUNCTION_INDICATOR;
> > +            gpios = <&tlmm 110 GPIO_ACTIVE_HIGH>;
> > +        };
> > +    };
> > +
> > +    i2c {
> > +      #address-cells = <1>;
> > +      #size-cells = <0>;
> > +
> > +      camera@36 {
> > +        compatible = "ovti,ov02c10";
> > +        reg = <0x36>;
> > +
> > +        reset-gpios = <&tlmm 237 GPIO_ACTIVE_LOW>;
> > +        pinctrl-names = "default";
> > +        pinctrl-0 = <&cam_rgb_default>;
> > +
> > +        led-names = "privacy-led";
> > +        leds = <&privacy_led>;
> > +
> > +        clocks = <&ov02e10_clk>;
> > +
> > +        assigned-clocks = <&ov02e10_clk>;
> > +        assigned-clock-rates = <19200000>;
> > +
> > +        avdd-supply = <&vreg_l7b_2p8>;
> > +        dvdd-supply = <&vreg_l7b_2p8>;
> > +        dovdd-supply = <&vreg_cam_1p8>;
> > +
> > +        port {
> > +          ov02e10_ep: endpoint {
> > +            data-lanes = <1 2>;
> > +            link-frequencies = /bits/ 64 <400000000>;
> > +            remote-endpoint = <&csiphy4_ep>;
> > +          };
> > +        };
> > +      };
> > +    };
> > +
> > +...
> > 
> > -- 
> > 2.48.1
> > 
