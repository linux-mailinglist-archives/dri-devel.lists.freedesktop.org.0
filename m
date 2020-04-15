Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D5E0B1AAE68
	for <lists+dri-devel@lfdr.de>; Wed, 15 Apr 2020 18:44:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A77876E23F;
	Wed, 15 Apr 2020 16:44:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19BD16EA2E
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Apr 2020 16:44:31 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 2C2B420029;
 Wed, 15 Apr 2020 18:44:29 +0200 (CEST)
Date: Wed, 15 Apr 2020 18:44:27 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH v1 2/4] dt-bindings: display: convert atmel lcdc to DT
 Schema
Message-ID: <20200415164427.GC7965@ravnborg.org>
References: <20200412182012.27515-1-sam@ravnborg.org>
 <20200412182012.27515-3-sam@ravnborg.org>
 <20200414083010.qztgtj6v6b53qgjh@gilmour.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200414083010.qztgtj6v6b53qgjh@gilmour.lan>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=eMA9ckh1 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=7gkXJVJtAAAA:8
 a=gEfo2CItAAAA:8 a=RbiIcWlLEm7qebYksE4A:9 a=lY2CcFOP5-NMkQJD:21
 a=2MuC6EUYW_woJX5b:21 a=CjuIK1q_8ugA:10 a=E9Po1WZjFZOl8hwRPBS3:22
 a=sptkURWiP4Gy88Gu7hUp:22
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
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Boris Brezillon <bbrezillon@kernel.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, dri-devel@lists.freedesktop.org,
 Hans Verkuil <hverkuil@xs4all.nl>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maxime.

On Tue, Apr 14, 2020 at 10:30:10AM +0200, Maxime Ripard wrote:
> On Sun, Apr 12, 2020 at 08:20:10PM +0200, Sam Ravnborg wrote:
> > Add a new binding file to describe the bindings
> > for the Atmel LCDC IP.
> > This replaces the old txt based binding.
> >
> > The binding file describes the current binding,
> > including properties to specify register values etc.
> > The binding will be updated in a follow-up patch,
> > the current binding describes the actual situation.
> >
> > This new binding file replaces the old .txt based
> > binding which is deleted.
> >
> > Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> > ---
> >  .../bindings/display/atmel,lcdc.txt           |  88 -----------
> >  .../bindings/display/atmel/lcdc.yaml          | 137 ++++++++++++++++++
> >  2 files changed, 137 insertions(+), 88 deletions(-)
> >  delete mode 100644 Documentation/devicetree/bindings/display/atmel,lcdc.txt
> >  create mode 100644 Documentation/devicetree/bindings/display/atmel/lcdc.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/display/atmel,lcdc.txt b/Documentation/devicetree/bindings/display/atmel,lcdc.txt
> > deleted file mode 100644
> > index acb5a0132127..000000000000
> > --- a/Documentation/devicetree/bindings/display/atmel,lcdc.txt
> > +++ /dev/null
> > @@ -1,88 +0,0 @@
> > -Atmel LCDC Framebuffer
> > ------------------------------------------------------
> > -
> > -Required properties:
> > -- compatible :
> > -	"atmel,at91sam9261-lcdc" ,
> > -	"atmel,at91sam9263-lcdc" ,
> > -	"atmel,at91sam9g10-lcdc" ,
> > -	"atmel,at91sam9g45-lcdc" ,
> > -	"atmel,at91sam9g45es-lcdc" ,
> > -	"atmel,at91sam9rl-lcdc" ,
> > -	"atmel,at32ap-lcdc"
> > -- reg : Should contain 1 register ranges(address and length).
> > -	Can contain an additional register range(address and length)
> > -	for fixed framebuffer memory. Useful for dedicated memories.
> > -- interrupts : framebuffer controller interrupt
> > -- display: a phandle pointing to the display node
> > -
> > -Required nodes:
> > -- display: a display node is required to initialize the lcd panel
> > -	This should be in the board dts.
> > -- default-mode: a videomode within the display with timing parameters
> > -	as specified below.
> > -
> > -Optional properties:
> > -- lcd-supply: Regulator for LCD supply voltage.
> > -
> > -Example:
> > -
> > -	fb0: fb@00500000 {
> > -		compatible = "atmel,at91sam9g45-lcdc";
> > -		reg = <0x00500000 0x1000>;
> > -		interrupts = <23 3 0>;
> > -		pinctrl-names = "default";
> > -		pinctrl-0 = <&pinctrl_fb>;
> > -		display = <&display0>;
> > -		#address-cells = <1>;
> > -		#size-cells = <1>;
> > -
> > -	};
> > -
> > -Example for fixed framebuffer memory:
> > -
> > -	fb0: fb@00500000 {
> > -		compatible = "atmel,at91sam9263-lcdc";
> > -		reg = <0x00700000 0x1000 0x70000000 0x200000>;
> > -		[...]
> > -	};
> > -
> > -Atmel LCDC Display
> > ------------------------------------------------------
> > -Required properties (as per of_videomode_helper):
> > -
> > - - atmel,dmacon: dma controller configuration
> > - - atmel,lcdcon2: lcd controller configuration
> > - - atmel,guard-time: lcd guard time (Delay in frame periods)
> > - - bits-per-pixel: lcd panel bit-depth.
> > -
> > -Optional properties (as per of_videomode_helper):
> > - - atmel,lcdcon-backlight: enable backlight
> > - - atmel,lcdcon-backlight-inverted: invert backlight PWM polarity
> > - - atmel,lcd-wiring-mode: lcd wiring mode "RGB" or "BRG"
> > - - atmel,power-control-gpio: gpio to power on or off the LCD (as many as needed)
> > -
> > -Example:
> > -	display0: display {
> > -		bits-per-pixel = <32>;
> > -		atmel,lcdcon-backlight;
> > -		atmel,dmacon = <0x1>;
> > -		atmel,lcdcon2 = <0x80008002>;
> > -		atmel,guard-time = <9>;
> > -		atmel,lcd-wiring-mode = <1>;
> > -
> > -		display-timings {
> > -			native-mode = <&timing0>;
> > -			timing0: timing0 {
> > -				clock-frequency = <9000000>;
> > -				hactive = <480>;
> > -				vactive = <272>;
> > -				hback-porch = <1>;
> > -				hfront-porch = <1>;
> > -				vback-porch = <40>;
> > -				vfront-porch = <1>;
> > -				hsync-len = <45>;
> > -				vsync-len = <1>;
> > -			};
> > -		};
> > -	};
> > diff --git a/Documentation/devicetree/bindings/display/atmel/lcdc.yaml b/Documentation/devicetree/bindings/display/atmel/lcdc.yaml
> > new file mode 100644
> > index 000000000000..7dcb9a4d5902
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/display/atmel/lcdc.yaml
> > @@ -0,0 +1,137 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/display/atmel/lcdc.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Atmel LCDC (LCD Controller) display controller with PWM
> > +
> > +maintainers:
> > +  - Sam Ravnborg <sam@ravnborg.org>
> > +
> > +description: |
> > +  The Atmel LCDC Display Controller is display controller that
> > +  includes a PWM for backlight/contrast.
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - atmel,at91sam9261-lcdc
> > +      - atmel,at91sam9263-lcdc
> > +      - atmel,at91sam9g10-lcdc
> > +      - atmel,at91sam9g45-lcdc
> > +      - atmel,at91sam9g45es-lcdc
> > +      - atmel,at91sam9g46-lcdc
> > +      - atmel,at91sam9m10-lcdc
> > +      - atmel,at91sam9m11-lcdc
> > +      - atmel,at91sam9rl-lcdc
> > +
> > +  "#address-cells":
> > +    const: 1
> > +  "#size-cells":
> > +    const: 0
> > +
> > +  reg:
> > +    description: |
> > +      Contains 1 register range (address and length).
> > +      Can contain an additional register range (address and length)
> > +      for fixed framebuffer memory
> 
> So, minItems: 1 , maxItems: 2?
The syntax is either:
    
    reg = <0x00700000 0x1000>;

or

    reg = <0x00700000 0x1000 0x70000000 0x200000>;

So always minItems: 1

> 
> > +  interrupts:
> > +    maxItems: 1
> > +
> > +  lcd-supply:
> > +    description: Regulator for LCD supply voltage.
> > +
> > +  display:
> > +    $ref: /schemas/types.yaml#/definitions/phandle
> > +    description: phandle to display node
> > +
> > +patternProperties:
> > +  "^display[0-9]$":
> > +    type: object
> > +    description: |
> > +      Display node is required to initialize the lcd panel.
> > +      This should be in the board dts
> > +
> > +    properties:
> > +
> > +      atmel,dmacon:
> > +        $ref: /schemas/types.yaml#/definitions/uint32
> > +        description: DMA controller configuration
> > +
> > +      atmel,lcdcon2:
> > +        $ref: /schemas/types.yaml#/definitions/uint32
> > +        description: LCD controller configuration
> > +
> > +      atmel,guard-time:
> > +        $ref: /schemas/types.yaml#/definitions/uint32
> > +        description: LCD guard time (Delay in frame periods)
> > +
> > +      bits-per-pixel:
> > +        $ref: /schemas/types.yaml#/definitions/uint32
> > +        description: LCD panel bit-depth.
> 
> Those properties aren't documented anywhere?
Not more than this and then by their use in the driver(s).

In the current patchset the node is deprecated in next patch.
I plan to do in two patches:
  - delete properites which is not used in kernel, barebox, u-boot)
  - Mark all the old properties deprecated

And for the soon-to-be deprecated properties we need no detailed
description.

	Sam
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
