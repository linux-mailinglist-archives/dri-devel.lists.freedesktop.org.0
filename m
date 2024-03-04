Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E02E870FAD
	for <lists+dri-devel@lfdr.de>; Mon,  4 Mar 2024 23:02:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BFC5112634;
	Mon,  4 Mar 2024 22:01:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="kzwDgspQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57039112636
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Mar 2024 22:01:57 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 80F23611DE;
 Mon,  4 Mar 2024 22:01:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0715DC433C7;
 Mon,  4 Mar 2024 22:01:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1709589716;
 bh=cqXMB5LaH1/xbA9ssgEQZjW69NwMDww1M1qLrr+EmDM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kzwDgspQIO25NArRMwENJ9Lcj00WGdi2KhrHvwxCo7fsbV2LTA9bHtNHbfhvYoF65
 o0E8Ccy9lQEJZB2GDGnvUvBfpSXFffA8u3NCkWeqpiRllSvP4R6t6DQbAcHi2Mqe3a
 BiI2jYmtfugdMRsHeeeIUriNJCJaT/rZBgM+tCz6t+hkbrYX7SnBjZ5B3O9qGV9VJc
 /HvYp6ur22G2Im0S0T39SDa4rsiUYQLooEGFoHWLsE99i8kOpMGmtIbUksbhbwltZd
 Rs3TR++2GxK/f3kGwAmAL/RE305D06Xtj4QdC9jjgICE1O3FTofrPr+4JkWuZIu97b
 c0inMgWAuyrgA==
Date: Mon, 4 Mar 2024 16:01:54 -0600
From: Rob Herring <robh@kernel.org>
To: Dharma Balasubiramani <dharma.b@microchip.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] dt-bindings: display: atmel,lcdc: convert to dtschema
Message-ID: <20240304220154.GA1115739-robh@kernel.org>
References: <20240304-lcdc-fb-v3-1-8b616fbb0199@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240304-lcdc-fb-v3-1-8b616fbb0199@microchip.com>
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

On Mon, Mar 04, 2024 at 08:00:03PM +0530, Dharma Balasubiramani wrote:
> Convert the atmel,lcdc bindings to DT schema.
> Changes during conversion: add missing clocks and clock-names properties.
> 
> Signed-off-by: Dharma Balasubiramani <dharma.b@microchip.com>
> ---
> This patch converts the existing lcdc display text binding to JSON schema.
> The binding is split into two namely
> lcdc.yaml
> - Holds the frame buffer properties
> lcdc-display.yaml
> - Holds the display panel properties which is a phandle to the display
> property in lcdc fb node.
> 
> These bindings are tested using the following command.
> 'make DT_CHECKER_FLAGS=-m dt_binding_check'
> ---
> Changes in v3:
> - Remove the generic property "bits-per-pixel"
> - Link to v2: https://lore.kernel.org/r/20240304-lcdc-fb-v2-1-a14b463c157a@microchip.com
> 
> Changes in v2:
> - Run checkpatch and remove whitespace errors.
> - Add the standard interrupt flags.
> - Split the binding into two, namely lcdc.yaml and lcdc-display.yaml.
> - Link to v1: https://lore.kernel.org/r/20240223-lcdc-fb-v1-1-4c64cb6277df@microchip.com
> ---
>  .../bindings/display/atmel,lcdc-display.yaml       | 97 ++++++++++++++++++++++
>  .../devicetree/bindings/display/atmel,lcdc.txt     | 87 -------------------
>  .../devicetree/bindings/display/atmel,lcdc.yaml    | 70 ++++++++++++++++
>  3 files changed, 167 insertions(+), 87 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/atmel,lcdc-display.yaml b/Documentation/devicetree/bindings/display/atmel,lcdc-display.yaml
> new file mode 100644
> index 000000000000..5e0b706d695d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/atmel,lcdc-display.yaml
> @@ -0,0 +1,97 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/atmel,lcdc-display.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Microchip's LCDC Display
> +
> +maintainers:
> +  - Nicolas Ferre <nicolas.ferre@microchip.com>
> +  - Dharma Balasubiramani <dharma.b@microchip.com>
> +
> +description:
> +  The LCD Controller (LCDC) consists of logic for transferring LCD image data
> +  from an external display buffer to a TFT LCD panel. The LCDC has one display
> +  input buffer per layer that fetches pixels through the single bus host
> +  interface and a look-up table to allow palletized display configurations. The
> +  LCDC is programmable on a per layer basis, and supports different LCD
> +  resolutions, window sizes, image formats and pixel depths.
> +
> +# We need a select here since this schema is applicable only for nodes with the
> +# following properties
> +
> +select:
> +  anyOf:
> +    - required: [ 'atmel,dmacon' ]
> +    - required: [ 'atmel,lcdcon2' ]
> +    - required: [ 'atmel,guard-time' ]
> +
> +properties:
> +  atmel,dmacon:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: dma controller configuration
> +
> +  atmel,lcdcon2:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: lcd controller configuration
> +
> +  atmel,guard-time:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: lcd guard time (Delay in frame periods)

Is there a maximum?

> +
> +  bits-per-pixel:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: lcd panel bit-depth.

Constraints?

> +
> +  atmel,lcdcon-backlight:
> +    $ref: /schemas/types.yaml#/definitions/flag
> +    description: enable backlight
> +
> +  atmel,lcdcon-backlight-inverted:
> +    $ref: /schemas/types.yaml#/definitions/flag
> +    description: invert backlight PWM polarity
> +
> +  atmel,lcd-wiring-mode:
> +    $ref: /schemas/types.yaml#/definitions/non-unique-string-array

Isn't this just a single string rather than an array?

> +    description: lcd wiring mode "RGB" or "BRG"

enum:
  - RGB
  - BRG

No BGR?

But wait, the example shows the value is '1'. That should fail testing. 
It didn't, but I've now fixed that.

> +
> +  atmel,power-control-gpio:
> +    description: gpio to power on or off the LCD (as many as needed)

maxItems: 1

> +
> +  display-timings:
> +    $ref: panel/display-timings.yaml#
> +
> +required:
> +  - atmel,dmacon
> +  - atmel,lcdcon2
> +  - atmel,guard-time
> +  - bits-per-pixel
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    display: panel {
> +      bits-per-pixel = <32>;
> +      atmel,lcdcon-backlight;
> +      atmel,dmacon = <0x1>;
> +      atmel,lcdcon2 = <0x80008002>;
> +      atmel,guard-time = <9>;
> +      atmel,lcd-wiring-mode = <1>;
> +
> +      display-timings {
> +        native-mode = <&timing0>;
> +        timing0: timing0 {
> +          clock-frequency = <9000000>;
> +          hactive = <480>;
> +          vactive = <272>;
> +          hback-porch = <1>;
> +          hfront-porch = <1>;
> +          vback-porch = <40>;
> +          vfront-porch = <1>;
> +          hsync-len = <45>;
> +          vsync-len = <1>;
> +        };
> +      };
> +    };
