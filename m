Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9011E3C3400
	for <lists+dri-devel@lfdr.de>; Sat, 10 Jul 2021 11:43:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 001596EB12;
	Sat, 10 Jul 2021 09:43:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8EF16EB12
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Jul 2021 09:43:05 +0000 (UTC)
Date: Sat, 10 Jul 2021 10:42:53 +0100
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH 1/2] dt-bindings: display/panel: Add Innolux EJ030NA
To: Sam Ravnborg <sam@ravnborg.org>
Message-Id: <HBW0WQ.NHPOJDIT9XWR1@crapouillou.net>
In-Reply-To: <YOk60yTP9L1gT3+W@ravnborg.org>
References: <20210625121045.81711-1-paul@crapouillou.net>
 <YOk60yTP9L1gT3+W@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
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
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, list@opendingux.net,
 Christophe Branchereau <cbranchereau@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sam, thanks for the review.

Le sam., juil. 10 2021 at 08:14:43 +0200, Sam Ravnborg=20
<sam@ravnborg.org> a =E9crit :
> Hi Paul,
>=20
> On Fri, Jun 25, 2021 at 01:10:44PM +0100, Paul Cercueil wrote:
>>  Add binding for the Innolux EJ030NA panel, which is a 320x480 3.0"=20
>> 4:3
>>  24-bit TFT LCD panel with non-square pixels and a delta-RGB 8-bit
>>  interface.
>>=20
>>  Signed-off-by: Paul Cercueil <paul@crapouillou.net>
>>  ---
>>   .../display/panel/innolux,ej030na.yaml        | 62=20
>> +++++++++++++++++++
>>   1 file changed, 62 insertions(+)
>>   create mode 100644=20
>> Documentation/devicetree/bindings/display/panel/innolux,ej030na.yaml
>>=20
>>  diff --git=20
>> a/Documentation/devicetree/bindings/display/panel/innolux,ej030na.yaml=20
>> b/Documentation/devicetree/bindings/display/panel/innolux,ej030na.yaml
>>  new file mode 100644
>>  index 000000000000..cda36c04e85c
>>  --- /dev/null
>>  +++=20
>> b/Documentation/devicetree/bindings/display/panel/innolux,ej030na.yaml
>>  @@ -0,0 +1,62 @@
>>  +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>>  +%YAML 1.2
>>  +---
>>  +$id:=20
>> http://devicetree.org/schemas/display/panel/innolux,ej030na.yaml#
>>  +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>  +
>>  +title: Innolux EJ030NA 3.0" (320x480 pixels) 24-bit TFT LCD panel
>>  +
>>  +description: |
>>  +  The panel must obey the rules for a SPI slave device as=20
>> specified in
>>  +  spi/spi-controller.yaml
>>  +
>>  +maintainers:
>>  +  - Paul Cercueil <paul@crapouillou.net>
>>  +
>>  +allOf:
>>  +  - $ref: panel-common.yaml#
>>  +
>>  +properties:
>>  +  compatible:
>>  +    const: innolux,ej030na
>>  +
>>  +  backlight: true
>>  +  port: true
>>  +  power-supply: true
>>  +  reg: true
>>  +  reset-gpios: true
>>  +
>>  +required:
>>  +  - compatible
>>  +  - reg
>>  +  - power-supply
>>  +  - reset-gpios
>>  +
>>  +unevaluatedProperties: false
> I had expected:
> additionalProperties: false
>=20
> With this fixed:
> Reviewed-by: Sam Ravnborg <sam@ravnborg.org>

I am not sure; the doc states that this (additionalProperties: false)=20
"can't be used in case where another schema is referenced", which is=20
the case here, as we include "panel-common.yaml".

Cheers,
-Paul

>>  +
>>  +examples:
>>  +  - |
>>  +    #include <dt-bindings/gpio/gpio.h>
>>  +
>>  +    spi {
>>  +        #address-cells =3D <1>;
>>  +        #size-cells =3D <0>;
>>  +
>>  +        panel@0 {
>>  +            compatible =3D "innolux,ej030na";
>>  +            reg =3D <0>;
>>  +
>>  +            spi-max-frequency =3D <10000000>;
>>  +
>>  +            reset-gpios =3D <&gpe 4 GPIO_ACTIVE_LOW>;
>>  +            power-supply =3D <&lcd_power>;
>>  +
>>  +            backlight =3D <&backlight>;
>>  +
>>  +            port {
>>  +                panel_input: endpoint {
>>  +                    remote-endpoint =3D <&panel_output>;
>>  +                };
>>  +            };
>>  +        };
>>  +    };
>>  --
>>  2.30.2


