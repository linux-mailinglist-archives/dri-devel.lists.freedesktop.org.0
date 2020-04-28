Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F92C1BCC3A
	for <lists+dri-devel@lfdr.de>; Tue, 28 Apr 2020 21:21:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EEEA6E83C;
	Tue, 28 Apr 2020 19:21:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F31DE890C9
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Apr 2020 19:21:21 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id B949680441;
 Tue, 28 Apr 2020 21:21:18 +0200 (CEST)
Date: Tue, 28 Apr 2020 21:21:17 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Ricardo =?iso-8859-1?Q?Ca=F1uelo?= <ricardo.canuelo@collabora.com>
Subject: Re: [RFC PATCH] dt-bindings: display: ti,tfp410.txt: convert to yaml
Message-ID: <20200428192117.GA13894@ravnborg.org>
References: <20200428092048.14939-1-ricardo.canuelo@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200428092048.14939-1-ricardo.canuelo@collabora.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=MOBOZvRl c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=8nJEP1OIZ-IA:10 a=QX4gbG5DAAAA:8 a=gEfo2CItAAAA:8 a=sozttTNsAAAA:8
 a=e5mUnYsNAAAA:8 a=5Q1QhKhd6o2KWyfzDbIA:9 a=FI4-JCA4KLYWKuIK:21
 a=vwSoZJe330k_mNyO:21 a=wPNLvfGTeEIA:10 a=AbAUZ8qAyYyZVLSsDulk:22
 a=sptkURWiP4Gy88Gu7hUp:22 a=aeg5Gbbo78KNqacMgKqU:22
 a=Vxmtnl_E_bksehYqCbjh:22
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
Cc: devicetree@vger.kernel.org, jason@lakedaemon.net, robh+dt@kernel.org,
 tomi.valkeinen@ti.com, dri-devel@lists.freedesktop.org, kernel@collabora.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Ricardo.

Thanks for looking into this bridge binding.
Some comments in the following.

	Sam

On Tue, Apr 28, 2020 at 11:20:48AM +0200, Ricardo Ca=F1uelo wrote:
> Convert the DT binding documentation for the TI TFP410 DPI-to-DVI
> encoder to json-schema.
> =

> Signed-off-by: Ricardo Ca=F1uelo <ricardo.canuelo@collabora.com>
> ---
> Hi all,
> =

> I found some issues while converting this binding and I'd like to know
> your opinions on how to tackle them.
> =

> 1) dtbs_check fails for arch/arm/boot/dts/dove-sbc-a510.dts
> =

>   This board uses the TFP410 encoder but it doesn't define any ports for
>   it. I can't find any suitable remote endpoints in its description
>   either. Maybe this board description should be reworked? The current
>   driver won't handle the device if it doesn't define any ports or
>   endpoints anyway.
> =


It is expected that there are a few DT files that will need an update
when they are checked more fomally.
So post a sepearate patch to fix it - preferably before the
conversion.

>   It also uses the 'powerdown-gpio' property instead of
>   'powerdown-gpios'. AFAICT this shouldn't be a problem from the driver
>   point of view, but the general standard in DT bindings is to use the
>   plural. This is trivial to fix.
Use the plural form as everyone else.

> 2) The definition of ti,deskew in the original binding seems to be
> tailored to the current driver and the way it's defined may not be very
> DT-friendly.
> =

>   This parameter maps to a 3-bit field in a hardware register that takes
>   a value from 0 to 7, so the [-4, 3] range described for this would map
>   to [000, 111]: -4 -> 000, -3 -> 001, -2 -> 010, ... 3 -> 111.
> =

>   Then, the driver parses the parameter (unsigned) and casts it to a
>   signed integer to get a number in the [-4, 3] range.
> =

>   A vendor-specific property must have a type definition in json-schema,
>   so if I translate the original bindings semantics directly, I should
>   define ti,deskew as an int32, but this makes dt_binding_check fail if
>   the property has a negative value in the example because of the
>   internal representation of cells as unsigned integers:
> =

>      ti,deskew:0:0: 4294967293 is greater than the maximum of 2147483647

Can you define it as an enum like this:

	enum: [-4, -3, -2, -1, 0, 1, 2, 3]

And then maybe in the descrition describe how they map to 0..7.
The problem is that the binding is an API so we cannot just change
the interpretation of the value 0 etc.


> =

>   So I can think of two solutions to this:
> =

>   a) Keep the ti,deskew property as an uint32 and document the valid
>   range ([-4, 3]) in the property description (this is what this patch
>   does currently).
> =

>   b) Redefine this property to be closer to the datasheet description
>   (ie. unsigned integers from 0 to 7) and adapt the driver accordingly.
>   This would also let us define its range properly using minimum and
>   maximum properties for it.
> =

>   I think (b) is the right thing to do but I want to know your
>   opinion. Besides, I don't have this hardware at hand and if I updated
>   the driver I wouldn't be able to test it.
> =

> Thanks.
> =

> Patch tested with:
> =

> make dt_binding_check ARCH=3Darm DT_SCHEMA_FILES=3D<.../ti,tfp410.yaml>
> make dtbs_check ARCH=3Darm DT_SCHEMA_FILES=3D<.../ti,tfp410.yaml>
> =

>  .../bindings/display/bridge/ti,tfp410.txt     |  66 ----------
>  .../bindings/display/bridge/ti,tfp410.yaml    | 121 ++++++++++++++++++
>  2 files changed, 121 insertions(+), 66 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/bridge/ti,t=
fp410.txt
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/ti,t=
fp410.yaml
> =

> diff --git a/Documentation/devicetree/bindings/display/bridge/ti,tfp410.t=
xt b/Documentation/devicetree/bindings/display/bridge/ti,tfp410.txt
> deleted file mode 100644
> index 5ff4f64ef8e8..000000000000
> --- a/Documentation/devicetree/bindings/display/bridge/ti,tfp410.txt
> +++ /dev/null
> @@ -1,66 +0,0 @@
> -TFP410 DPI to DVI encoder
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
> -
> -Required properties:
> -- compatible: "ti,tfp410"
> -
> -Optional properties:
> -- powerdown-gpios: power-down gpio
> -- reg: I2C address. If and only if present the device node should be pla=
ced
> -  into the I2C controller node where the TFP410 I2C is connected to.
> -- ti,deskew: data de-skew in 350ps increments, from -4 to +3, as configu=
red
> -  through th DK[3:1] pins. This property shall be present only if the TF=
P410
> -  is not connected through I2C.
> -
> -Required nodes:
> -
> -This device has two video ports. Their connections are modeled using the=
 OF
> -graph bindings specified in [1]. Each port node shall have a single endp=
oint.
> -
> -- Port 0 is the DPI input port. Its endpoint subnode shall contain a
> -  pclk-sample and bus-width property and a remote-endpoint property as s=
pecified
> -  in [1].

> -  - If pclk-sample is not defined, pclk-sample =3D 0 should be assumed f=
or
> -    backward compatibility.
> -  - If bus-width is not defined then bus-width =3D 24 should be assumed =
for
> -    backward compatibility.
> -    bus-width =3D 24: 24 data lines are connected and single-edge mode
> -    bus-width =3D 12: 12 data lines are connected and dual-edge mode
These comments are missing in the new binding.


> -
> -- Port 1 is the DVI output port. Its endpoint subnode shall contain a
> -  remote-endpoint property is specified in [1].
> -
> -[1] Documentation/devicetree/bindings/media/video-interfaces.txt
> -
> -
> -Example
> --------
> -
> -tfp410: encoder@0 {
> -	compatible =3D "ti,tfp410";
> -	powerdown-gpios =3D <&twl_gpio 2 GPIO_ACTIVE_LOW>;
> -	ti,deskew =3D <4>;
> -
> -	ports {
> -		#address-cells =3D <1>;
> -		#size-cells =3D <0>;
> -
> -		port@0 {
> -			reg =3D <0>;
> -
> -			tfp410_in: endpoint@0 {
> -				pclk-sample =3D <1>;
> -				bus-width =3D <24>;
> -				remote-endpoint =3D <&dpi_out>;
> -			};
> -		};
> -
> -		port@1 {
> -			reg =3D <1>;
> -
> -			tfp410_out: endpoint@0 {
> -				remote-endpoint =3D <&dvi_connector_in>;
> -			};
> -		};
> -	};
> -};
> diff --git a/Documentation/devicetree/bindings/display/bridge/ti,tfp410.y=
aml b/Documentation/devicetree/bindings/display/bridge/ti,tfp410.yaml
> new file mode 100644
> index 000000000000..79666ee540f9
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/bridge/ti,tfp410.yaml
> @@ -0,0 +1,121 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
You need to obtain approval to change the license to include BSD.
The current binfing is GPL-2-0-only as it is default in the tree.

> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/bridge/ti,tfp410.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: TFP410 DPI to DVI encoder
> +
> +maintainers:
> +  - Tomi Valkeinen <tomi.valkeinen@ti.com>
> +  - Jyri Sarha <jsarha@ti.com>
> +
> +properties:
> +  compatible:
> +    const: "ti,tfp410"
No "" around the compatible name

> +
> +  reg:
> +    description: I2C address of the device.
> +    maxItems: 1
> +
> +  powerdown-gpios:
> +    maxItems: 1
> +
> +  ti,deskew:
> +    description:
> +      Data de-skew in 350ps increments, from -4 to +3, as configured
> +      through the DK[3:1] pins. This property shall be present only if
> +      the TFP410 is not connected through I2C.
> +    maxItems: 1
> +    allOf:
> +      - $ref: /schemas/types.yaml#/definitions/uint32
No need for the allOf: - $ref.
Just use a plain $ref


> +
> +  ports:
> +    description:
> +      A node containing input and output port nodes with endpoint
> +      definitions as documented in
> +      Documentation/devicetree/bindings/media/video-interfaces.txt
> +    type: object
> +
> +    properties:
> +      port@0:
> +        description: DPI input port.
> +        type: object
> +
> +        properties:
> +          reg:
> +            const: 0
> +
> +          endpoint:
> +            type: object
> +
> +            properties:
> +              pclk-sample:
> +                description: Endpoint sampling edge.
> +                enum:
> +                  - 0  # Falling edge
> +                  - 1  # Rising edge
> +
> +              bus-width:
> +                description: Endpoint bus width.
> +                enum: [ 12, 24 ]
> +
> +        required:
> +          - endpoint
> +
> +      port@1:
> +        description: DVI output port.
> +        type: object
> +
> +        properties:
> +          reg:
> +            const: 1
> +
> +          endpoint:
> +            type: object
> +
> +        required:
> +          - endpoint
> +
> +    required:
> +      - port@0
> +      - port@1
> +
> +required:
> +  - compatible
> +  - ports
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    tfp410: encoder {
> +        compatible =3D "ti,tfp410";
> +        powerdown-gpios =3D <&twl_gpio 2 GPIO_ACTIVE_LOW>;
> +        ti,deskew =3D <3>;
> +
> +        ports {
> +            #address-cells =3D <1>;
> +            #size-cells =3D <0>;
> +
> +            port@0 {
> +                reg =3D <0>;
> +                tfp410_in: endpoint {
> +                    pclk-sample =3D <1>;
> +                    bus-width =3D <24>;
> +                    remote-endpoint =3D <&dpi_out>;
> +                };
> +            };
> +
> +            port@1 {
> +                reg =3D <1>;
> +                tfp410_out: endpoint {
> +                    remote-endpoint =3D <&dvi_connector_in>;
> +                };
> +            };
> +        };
> +    };
> +
> +...
> -- =

> 2.18.0
> =

> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
