Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DF8589FC9A
	for <lists+dri-devel@lfdr.de>; Wed, 10 Apr 2024 18:13:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B80A410EAC0;
	Wed, 10 Apr 2024 16:13:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="WpP1ch0S";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CED810EAC0
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Apr 2024 16:13:18 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id B749ECE2A67;
 Wed, 10 Apr 2024 16:13:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5010C433C7;
 Wed, 10 Apr 2024 16:13:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1712765594;
 bh=EiSUT6z9f9FKUZqNR3GwiGyw/VHRO7l/LNdz3P1SDkU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WpP1ch0SaSPGqADO/wz+U7251Hp2PvvVvKW3o5OGz2sAjFN8M4eqv6xhubA5c286k
 jH8WRpKYI4llFfR5H1HTcZOSSgKylMdFHXwYRWp2DK+RkR+mAGVUVpnbkg0yv27bfq
 AA/i12+sfnAVW3bILXKbaj7cn9CAzaRA29TmyFTMK5SW92HSbc1d4A1aUTMJ26+zur
 TxcJyfdH91dgzX5mj9meW8+re4ZdXLDQ1TJjGwNED925jj+hZm5P9+83Dss7/By2dt
 3RTSoy9kHo5FYnuzeE74kEZuuSlsq+KKKcaa8zhSUWwrRSwNZyLHp0E3bNpBww/1hi
 2DmIvn+c6gPiw==
Date: Wed, 10 Apr 2024 11:13:11 -0500
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
Subject: Re: [RESEND v7 13/37] dt-bindings: clock: sh7750-cpg: Add
 renesas,sh7750-cpg header.
Message-ID: <20240410161311.GA4074406-robh@kernel.org>
References: <cover.1712207606.git.ysato@users.sourceforge.jp>
 <1db8627e4ca50b9d2d27e95d245518cac1cd62dc.1712207606.git.ysato@users.sourceforge.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1db8627e4ca50b9d2d27e95d245518cac1cd62dc.1712207606.git.ysato@users.sourceforge.jp>
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

On Thu, Apr 04, 2024 at 02:14:24PM +0900, Yoshinori Sato wrote:
> SH7750 CPG Clock output define.

This and the subject don't match what the patch does.

> 
> Signed-off-by: Yoshinori Sato <ysato@users.sourceforge.jp>
> ---
>  .../bindings/clock/renesas,sh7750-cpg.yaml    | 105 ++++++++++++++++++
>  include/dt-bindings/clock/sh7750-cpg.h        |  26 +++++
>  2 files changed, 131 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/renesas,sh7750-cpg.yaml
>  create mode 100644 include/dt-bindings/clock/sh7750-cpg.h
> 
> diff --git a/Documentation/devicetree/bindings/clock/renesas,sh7750-cpg.yaml b/Documentation/devicetree/bindings/clock/renesas,sh7750-cpg.yaml
> new file mode 100644
> index 000000000000..04c10b0834ee
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/renesas,sh7750-cpg.yaml
> @@ -0,0 +1,105 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/renesas,sh7750-cpg.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Renesas SH7750/7751 Clock Pulse Generator (CPG)
> +
> +maintainers:
> +  - Yoshinori Sato <ysato@users.sourceforge.jp>
> +
> +description:
> +  The Clock Pulse Generator (CPG) generates core clocks for the SoC.  It
> +  includes PLLs, and variable ratio dividers.
> +
> +  The CPG may also provide a Clock Domain for SoC devices, in combination with
> +  the CPG Module Stop (MSTP) Clocks.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - renesas,sh7750-cpg             # SH7750
> +      - renesas,sh7750s-cpg            # SH775S
> +      - renesas,sh7750r-cpg            # SH7750R
> +      - renesas,sh7751-cpg             # SH7751
> +      - renesas,sh7751r-cpg            # SH7751R
> +
> +  reg: true
> +
> +  reg-names: true
> +
> +  clocks:
> +    maxItems: 1
> +
> +  clock-names:
> +    const: extal
> +
> +  '#clock-cells':
> +    const: 1
> +
> +  renesas,mode:
> +    description: Board-specific settings of the MD[0-2] pins on SoC
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    minimum: 0
> +    maximum: 6
> +
> +  '#power-domain-cells':
> +    const: 0
> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - clocks
> +  - clock-names
> +  - '#clock-cells'
> +
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - renesas,sh7750-cpg
> +              - renesas,sh7750s-cpg
> +    then:
> +      properties:
> +        reg:
> +          maxItems: 1
> +        reg-names:
> +          items:
> +            - const: FRQCR
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - renesas,sh7750r-cpg
> +              - renesas,sh7751-cpg
> +              - renesas,sh7751r-cpg
> +    then:
> +      properties:
> +        reg:
> +          maxItems: 2

minItems: 2 (instead)

> +        reg-names:
> +          items:
> +            - const: FRQCR
> +            - const: CLKSTP00

Move this to the top-level and add 'minItems: 1'. Then above you just 
need 'maxItems: 1' and here 'minItems: 2'.


> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/sh7750-cpg.h>
> +    cpg: clock-controller@ffc00000 {
> +        #clock-cells = <1>;
> +        #power-domain-cells = <0>;
> +        compatible = "renesas,sh7751r-cpg";
> +        clocks = <&extal>;
> +        clock-names = "extal";
> +        reg = <0xffc00000 20>, <0xfe0a0000 16>;
> +        reg-names = "FRQCR", "CLKSTP00";
> +        renesas,mode = <0>;
> +    };
> diff --git a/include/dt-bindings/clock/sh7750-cpg.h b/include/dt-bindings/clock/sh7750-cpg.h
> new file mode 100644
> index 000000000000..ec267be91adf
> --- /dev/null
> +++ b/include/dt-bindings/clock/sh7750-cpg.h
> @@ -0,0 +1,26 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> + *
> + * Copyright 2023 Yoshinori Sato
> + */
> +
> +#ifndef __DT_BINDINGS_CLOCK_SH7750_H__
> +#define __DT_BINDINGS_CLOCK_SH7750_H__
> +
> +#define SH7750_CPG_PLLOUT	0
> +
> +#define SH7750_CPG_PCK		1
> +#define SH7750_CPG_BCK		2
> +#define SH7750_CPG_ICK		3
> +
> +#define SH7750_MSTP_SCI		4
> +#define SH7750_MSTP_RTC		5
> +#define SH7750_MSTP_TMU012	6
> +#define SH7750_MSTP_SCIF	7
> +#define SH7750_MSTP_DMAC	8
> +#define SH7750_MSTP_UBC		9
> +#define SH7750_MSTP_SQ		10
> +#define SH7750_CSTP_INTC	11
> +#define SH7750_CSTP_TMU34	12
> +#define SH7750_CSTP_PCIC	13
> +
> +#endif
> -- 
> 2.39.2
> 
