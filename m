Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 958AF89FCF1
	for <lists+dri-devel@lfdr.de>; Wed, 10 Apr 2024 18:34:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6083110EBEF;
	Wed, 10 Apr 2024 16:34:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="WdGJ+FMW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31CB510EBEF
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Apr 2024 16:34:00 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 377FB616F4;
 Wed, 10 Apr 2024 16:33:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8EBAC43390;
 Wed, 10 Apr 2024 16:33:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1712766839;
 bh=+FUDvwQv/pjc3SPd6m6Xsh3tVWiCUKkTIowQBF/v+bo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WdGJ+FMWdhh0ULfdq8PAMBRkV2D07vdl12esxN36qRc7iBlgF3igm9UnHdW77OuFa
 R1W0JHu1+BnlUhglO03XjKxuV9Rt2mCMQCaSdrf4IRQD0U8D5g/dqXC0haKnWOYlx/
 Tpra8k4KGnwJ3YtphgLmFLiVaTX5TNMexFojRyJ3FaJEvmdbDTS+6N7skMgDaQOFuC
 eztJG/y+UXXqSBx5CDHVTVqVsnm+aGnXcRti6BXckFmR/c5/oCclxaYHn2HoTwNkOd
 FGC8MSUR8t8sqTz/1pWkII2Z0fI6j2RDG+Ademt/aK0H+PfBHKuXYMf9JZ5TszgGZX
 22ZZhsz28q9gg==
Date: Wed, 10 Apr 2024 11:33:55 -0500
From: Rob Herring <robh@kernel.org>
To: Yoshinori Sato <ysato@users.sourceforge.jp>
Cc: linux-sh@vger.kernel.org, Damien Le Moal <dlemoal@kernel.org>,
 Niklas Cassel <cassel@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Thomas Gleixner <tglx@linutronix.de>, Bjorn Helgaas <bhelgaas@google.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, Magnus Damm <magnus.damm@gmail.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Rich Felker <dalias@libc.org>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Lee Jones <lee@kernel.org>, Helge Deller <deller@gmx.de>,
 Heiko Stuebner <heiko.stuebner@cherry.de>,
 Shawn Guo <shawnguo@kernel.org>, Sebastian Reichel <sre@kernel.org>,
 Chris Morgan <macromorgan@hotmail.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Arnd Bergmann <arnd@arndb.de>, David Rientjes <rientjes@google.com>,
 Hyeonggon Yoo <42.hyeyoo@gmail.com>,
 Vlastimil Babka <vbabka@suse.cz>, Baoquan He <bhe@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Guenter Roeck <linux@roeck-us.net>,
 Kefeng Wang <wangkefeng.wang@huawei.com>,
 Stephen Rothwell <sfr@canb.auug.org.au>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Guo Ren <guoren@kernel.org>, Azeem Shaikh <azeemshaikh38@gmail.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Jonathan Corbet <corbet@lwn.net>,
 Jacky Huang <ychuang3@nuvoton.com>,
 Herve Codina <herve.codina@bootlin.com>,
 Manikanta Guntupalli <manikanta.guntupalli@amd.com>,
 Anup Patel <apatel@ventanamicro.com>,
 Biju Das <biju.das.jz@bp.renesas.com>,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
 Sam Ravnborg <sam@ravnborg.org>, Sergey Shtylyov <s.shtylyov@omp.ru>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 linux-ide@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-pci@vger.kernel.org, linux-serial@vger.kernel.org,
 linux-fbdev@vger.kernel.org
Subject: Re: [RESEND v7 22/37] dt-bindings: display: smi,sm501: SMI SM501
 binding json-schema
Message-ID: <20240410163355.GA386057-robh@kernel.org>
References: <cover.1712207606.git.ysato@users.sourceforge.jp>
 <9858ef1c149bd27b27594b3bd388601681d83460.1712207606.git.ysato@users.sourceforge.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9858ef1c149bd27b27594b3bd388601681d83460.1712207606.git.ysato@users.sourceforge.jp>
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

On Thu, Apr 04, 2024 at 02:14:33PM +0900, Yoshinori Sato wrote:
> Signed-off-by: Yoshinori Sato <ysato@users.sourceforge.jp>
> ---
>  .../bindings/display/smi,sm501.yaml           | 398 ++++++++++++++++++
>  1 file changed, 398 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/smi,sm501.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/smi,sm501.yaml b/Documentation/devicetree/bindings/display/smi,sm501.yaml
> new file mode 100644
> index 000000000000..06c6af4fa4a9
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/smi,sm501.yaml
> @@ -0,0 +1,398 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/smi,sm501.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Silicon Motion SM501 Mobile Multimedia Companion Chip
> +
> +maintainers:
> +  - Yoshinori Sato <ysato@user.sourceforge.jp>
> +
> +description: |

Don't need '|'

> +  These DT bindings describe the SM501.

Drop "These DT bindings describe" and just describe what the h/w is.

> +
> +properties:
> +  compatible:
> +    const:
> +      smi,sm501
> +
> +  reg:
> +    maxItems: 2
> +    description: |
> +     First entry: System Configuration register
> +     Second entry: IO space (Display Controller register)

items:
  - description: System Configuration register
  - description: IO space (Display Controller register)

Is it just 1 register in each or should be "registers"?


> +
> +  interrupts:
> +    description: SM501 interrupt to the cpu should be described here.
> +
> +  mode:
> +    $ref: /schemas/types.yaml#/definitions/string
> +    description: select a video mode
> +
> +  edid:
> +    description: |

Don't need '|'.

> +      verbatim EDID data block describing attached display.

s/verbatim/Verbatim/

> +      Data from the detailed timing descriptor will be used to
> +      program the display controller.
> +
> +  little-endian:
> +    $ref: /schemas/types.yaml#/definitions/flag
> +    description: available on big endian systems, to set different foreign endian.
> +  big-endian:
> +    $ref: /schemas/types.yaml#/definitions/flag
> +    description: available on little endian systems, to set different foreign endian.
> +
> +  swap-fb-endian:

All these custom properties need vendor prefix.

But really, why are so many custom properties needed? Other display 
controllers don't need so many, why does this one? Do you actually have 
users of all of them.

> +    $ref: /schemas/types.yaml#/definitions/flag
> +    description: swap framebuffer byteorder.
> +
> +  route-crt-panel:
> +    $ref: /schemas/types.yaml#/definitions/flag
> +    description: Panel output merge to CRT.
> +
> +  crt:
> +    type: object
> +    description: CRT output control
> +    properties:
> +      edid:

Huh? You already defined edid elsewhere.

> +        $ref: /schemas/types.yaml#/definitions/uint8-array
> +        description: |
> +          verbatim EDID data block describing attached display.
> +          Data from the detailed timing descriptor will be used to
> +          program the display controller.
> +
> +      smi,flags:
> +        $ref: /schemas/types.yaml#/definitions/string-array
> +        description: Display control flags.
> +        items:
> +          anyOf:
> +            - const: use-init-done
> +            - const: disable-at-exit
> +            - const: use-hwcursor
> +            - const: use-hwaccel
> +            - const: panel-no-fpen
> +            - const: panel-no-vbiasen
> +            - const: panel-inv-fpen
> +            - const: panel-inv-vbiasen
> +        maxItems: 8
> +
> +      bpp:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        description: Color depth
> +
> +  panel:

Isn't this just the same as 'crt'?

> +    type: object
> +    description: Panel output control
> +    properties:
> +      edid:
> +        $ref: /schemas/types.yaml#/definitions/uint8-array
> +        description: |
> +          verbatim EDID data block describing attached display.
> +          Data from the detailed timing descriptor will be used to
> +          program the display controller.
> +
> +      smi,flags:
> +        $ref: /schemas/types.yaml#/definitions/string-array
> +        description: Display control flags.
> +        items:
> +          anyOf:
> +            - const: use-init-done
> +            - const: disable-at-exit
> +            - const: use-hwcursor
> +            - const: use-hwaccel
> +            - const: panel-no-fpen
> +            - const: panel-no-vbiasen
> +            - const: panel-inv-fpen
> +            - const: panel-inv-vbiasen
> +        maxItems: 8
> +
> +      bpp:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        description: Color depth
> +
> +  smi,devices:
> +    $ref: /schemas/types.yaml#/definitions/string-array
> +    description: Select SM501 device functions.
> +    items:
> +      anyOf:
> +        - const: usb-host
> +        - const: usb-slave
> +        - const: ssp0
> +        - const: ssp1
> +        - const: uart0
> +        - const: uart1
> +        - const: fbaccel
> +        - const: ac97
> +        - const: i2s
> +        - const: gpio
> +    minItems: 1
> +    maxItems: 10
> +
> +  smi,mclk:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: mclk frequency.
> +
> +  smi,m1xclk:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: m1xclk frequency.

Clock stuff? Use the clock binding.

> +
> +  misc-timing:
> +    type: object
> +    description: Miscellaneous Timing register values.
> +    properties:
> +      ex:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        description: Extend bus holding time.
> +
> +      xc:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        description: Xscale clock input select.
> +
> +      usb-over-current-detect-disable:
> +        $ref: /schemas/types.yaml#/definitions/flag
> +        description: USB host current detection disable (Us=0).
> +
> +      usb-over-current-detect-enable:
> +        $ref: /schemas/types.yaml#/definitions/flag
> +        description: USB host current detection disable (Us=1).
> +
> +      sdram-clock-mode1-288mhz:
> +        $ref: /schemas/types.yaml#/definitions/flag
> +        description: SSM1 bit is clear.
> +
> +      sdram-clock-mode1-div:
> +        $ref: /schemas/types.yaml#/definitions/flag
> +        description: SSM1 bit is set.
> +
> +      sm1:
> +        $ref: /schemas/types.yaml#/definitions/flag
> +        description: SDRAM clock divider for PW mode 1.
> +
> +      sdram-clock-mode0-288mhz:
> +        $ref: /schemas/types.yaml#/definitions/flag
> +        description: SSM0 bit is clear.
> +
> +      sdram-clock-mode0-div:
> +        $ref: /schemas/types.yaml#/definitions/flag
> +        description: SSM0 bit is set.
> +
> +      sm0:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        description: SDRAM clock divider for PW mode 0.
> +
> +      pll-debug-input:
> +        $ref: /schemas/types.yaml#/definitions/flag
> +        description: 96MHz PLL debug input reference frequency (Deb=0).
> +
> +      pll-debug-output:
> +        $ref: /schemas/types.yaml#/definitions/flag
> +        description: 96MHz PLL debug output frequency (Deb=1).
> +
> +      no-acpi-control:
> +        $ref: /schemas/types.yaml#/definitions/flag
> +        description: No ACPI control (A=0).
> +
> +      acpi-control:
> +        $ref: /schemas/types.yaml#/definitions/flag
> +        description: No ACPI control (A=1).
> +
> +      divider:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        description: Second PLL output frequency.
> +
> +      usb-host-normal:
> +        $ref: /schemas/types.yaml#/definitions/flag
> +        description: USB Host normal mode.
> +
> +      usb-host-simulation:
> +        $ref: /schemas/types.yaml#/definitions/flag
> +        description: USB Host simulation mode.
> +
> +      delay:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        description: Delay time to latch read data. Set the value to 10x.
> +
> +  misc-control:
> +    type: object
> +    description: Miscellaneous Control register values.
> +    properties:
> +      pad:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        description: PCI Pad drive strength.
> +
> +      usbclk:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        description: USB Clcok Select.
> +
> +      uart1:
> +        $ref: /schemas/types.yaml#/definitions/flag
> +        description: UART1 (SSP=0)
> +
> +      ssp1:
> +        $ref: /schemas/types.yaml#/definitions/flag
> +        description: SSP1 (SSP=1)
> +
> +      latch-address-disable:
> +        $ref: /schemas/types.yaml#/definitions/flag
> +        description: 8051 Latch disable (Lat=0).
> +
> +      latch-address-enable:
> +        $ref: /schemas/types.yaml#/definitions/flag
> +        description: 8051 Latch enable (Lat=1).
> +
> +      panel-data-18bit:
> +        $ref: /schemas/types.yaml#/definitions/flag
> +        description: Flat Panel data 18bit (FP=0).
> +
> +      panel-data-24bit:
> +        $ref: /schemas/types.yaml#/definitions/flag
> +        description: Flat Panel data 24bit (FP=1).
> +

> +      xtal-freq-24mhz:
> +        $ref: /schemas/types.yaml#/definitions/flag
> +        description: Crystal frequency 24MHz (Freq=0).
> +
> +      xtal-freq-12mhz:
> +        $ref: /schemas/types.yaml#/definitions/flag
> +        description: Crystal frequency 12MHz (Freq=1).

What's the relationship between these 2 properties? What if neither is 
present? What if both are? Define properties such that you can't have 
invalid combinations. Yes, we could just handle that with constraints, 
but why start with a bad design. There's other cases of this same 
pattern here.


> +
> +      refresh:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        description: Internal memory refresh timing.
> +
> +      hold:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        description: BUS Hold time.
> +
> +      sh-ready-low:
> +        $ref: /schemas/types.yaml#/definitions/flag
> +        description: SuperH ready polarity active low (SH=0).
> +
> +      sh-ready-high:
> +        $ref: /schemas/types.yaml#/definitions/flag
> +        description: SuperH ready polarity active high (SH=1).
> +
> +      interrupt-normal:
> +        $ref: /schemas/types.yaml#/definitions/flag
> +        description: Interrupt normal (II=0).
> +
> +      interrupt-inverted:
> +        $ref: /schemas/types.yaml#/definitions/flag
> +        description: Interrupt Inverting (II=1).
> +
> +      pll-clock-count-disable:
> +        $ref: /schemas/types.yaml#/definitions/flag
> +        description: PLL clock count disable.
> +
> +      pll-clock-count-enaable:
> +        $ref: /schemas/types.yaml#/definitions/flag
> +        description: PLL clock count enable.
> +
> +      dac-power-enable:
> +        $ref: /schemas/types.yaml#/definitions/flag
> +        description: DAC Power enable (DAC=0).
> +
> +      dac-power-disable:
> +        $ref: /schemas/types.yaml#/definitions/flag
> +        description: DAC Power disable (DAC=1).
> +
> +      usb-slave-cpu:
> +        $ref: /schemas/types.yaml#/definitions/flag
> +        description: USB slave controller cpu (MC=0).
> +
> +      usb-slave-8051:
> +        $ref: /schemas/types.yaml#/definitions/flag
> +        description: USB slave controller 8051MCU (MC=1).
> +
> +      burst-length-8:
> +        $ref: /schemas/types.yaml#/definitions/flag
> +        description: CPU Master burst length 8 (BL=0).
> +
> +      burst-length-1:
> +        $ref: /schemas/types.yaml#/definitions/flag
> +        description: CPU Master burst length 1 (BL=1).
> +
> +      usb-port-master:
> +        $ref: /schemas/types.yaml#/definitions/flag
> +        description: USB port master.
> +
> +      usb-port-slave:
> +        $ref: /schemas/types.yaml#/definitions/flag
> +        description: USB port slave.
> +
> +      vr-mmio-30mb:
> +        $ref: /schemas/types.yaml#/definitions/flag
> +        description: NEC VR Memory map MMIO locatedat 30MB (VR=0)
> +
> +      vr-mmio-62mb:
> +        $ref: /schemas/types.yaml#/definitions/flag
> +        description: NEC VR Memory map MMIO locatedat 62MB (VR=1)
> +
> +  gpio-pin-control:
> +    type: object
> +    description: GPIO control configuration.
> +    properties:
> +      pin:
> +        type: object
> +        properties:
> +          gpio:

'gpio' is already in use as a property name.

> +            $ref: /schemas/types.yaml#/definitions/flag
> +            description: pin in/out use GPIO.
> +          function:
> +            $ref: /schemas/types.yaml#/definitions/flag
> +            description: pin in/out use function.

Why do you need 2 nodes and 2 properties to define 3 possible states? 
There is not present, 'gpio', or 'function'. That's a single 
tri-state property. What does not present mean?

> +
> +  gpio-i2c:
> +    type: object
> +    description: GPIO I2C definition.
> +    properties:
> +      i2c:
> +        type: object
> +        properties:
> +          bus:
> +            $ref: /schemas/types.yaml#/definitions/uint32
> +            description: I2C bus number.

How is bus number a property of the h/w?

> +
> +          sda:
> +            $ref: /schemas/types.yaml#/definitions/uint32
> +            description: I2C SDA pin port number.
> +
> +          scl:
> +            $ref: /schemas/types.yaml#/definitions/uint32
> +            description: I2C SCL pin port number.
> +
> +          delay:
> +            $ref: /schemas/types.yaml#/definitions/uint32
> +            description: bit transmission delay.
> +
> +          timeout:
> +            $ref: /schemas/types.yaml#/definitions/uint32
> +            description: transmission timeout.
> +
> +additionalProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +
> +
> +examples:
> +  # MPC5200
> +  - |
> +    display@1,0 {

Not a correct unit address.

> +        compatible = "smi,sm501";
> +        reg = <0x00000000 0x00800000
> +               0x03e00000 0x00200000>;
> +        interrupts = <1 1 3>;
> +        mode = "640x480-32@60";
> +        edid = [00 ff ff ff ff ff ff 00 00 00 00 00 00 00 00 00
> +                00 00 01 04 00 00 00 00 00 00 00 00 00 00 00 00
> +                00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> +                00 00 00 00 00 00 f0 0a 80 fb 20 e0 25 10 32 60
> +                02 00 00 00 00 00 00 06 00 00 00 00 00 00 00 00
> +                00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> +                00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> +                00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 bd];

Kind of a sparse example. Please make examples using optional 
properties.

> +    };
> -- 
> 2.39.2
> 
