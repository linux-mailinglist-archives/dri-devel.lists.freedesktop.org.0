Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38EF489FD18
	for <lists+dri-devel@lfdr.de>; Wed, 10 Apr 2024 18:37:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5428610E4C5;
	Wed, 10 Apr 2024 16:37:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="bnxnT+lH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DBC810E3E8
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Apr 2024 16:37:42 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 1F64661DF0;
 Wed, 10 Apr 2024 16:37:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73D7BC433C7;
 Wed, 10 Apr 2024 16:37:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1712767061;
 bh=6OUj44vZFwVj92r42Hpe1Vt84hfOsxOHWO/kw7h9fI0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bnxnT+lHlpR7zjZ7nbs32PKFsecWWxj8QxZPHZzeepoo4DgJSJN7oWS6UQzlr+JuX
 v/kvc7+0ho9YbKGfYrAsQyfsrcsmZb/2LXWbC+gj57mEPQbjvlKAM5pP8cYh6JKRkR
 LK+9XAHXGUEdsdu5k2J0SWJJWk5SiM0YMqLQExQoPhrQnli75f7ez5FepFCc75cOe/
 3GUIfji5/mY5RlVjflzoc3MniWevQso5i1uv7tvUb6JuxvfH4d9J+bBT+EGelqWv3N
 80mIjjNRmNxcKuJaPJJtCrquUTEpt18OVhRhmROuS4u0U1Eo/fxqp6GTL+t5uSQZAs
 7yzvaFYlsi1Fw==
Date: Wed, 10 Apr 2024 11:37:39 -0500
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
Subject: Re: [RESEND v7 25/37] dt-binding: sh: cpus: Add SH CPUs json-schema
Message-ID: <20240410163739.GA406756-robh@kernel.org>
References: <cover.1712207606.git.ysato@users.sourceforge.jp>
 <7731111c9e383c41173ac08f3a040a18449ac542.1712207606.git.ysato@users.sourceforge.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7731111c9e383c41173ac08f3a040a18449ac542.1712207606.git.ysato@users.sourceforge.jp>
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

On Thu, Apr 04, 2024 at 02:14:36PM +0900, Yoshinori Sato wrote:
> Renesas SH series and compatible ISA CPUs.
> 
> Signed-off-by: Yoshinori Sato <ysato@users.sourceforge.jp>
> ---
>  .../devicetree/bindings/sh/cpus.yaml          | 63 +++++++++++++++++++
>  1 file changed, 63 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sh/cpus.yaml
> 
> diff --git a/Documentation/devicetree/bindings/sh/cpus.yaml b/Documentation/devicetree/bindings/sh/cpus.yaml
> new file mode 100644
> index 000000000000..9e5640793d76
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sh/cpus.yaml
> @@ -0,0 +1,63 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sh/cpus.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Renesas SuperH CPUs
> +
> +maintainers:
> +  - Yoshinori Sato <ysato@users.sourceforge.jp>
> +
> +description: |+
> +  Definition of CPU core with Renesas SuperH and compatible instruction set.
> +
> +properties:
> +  compatible:
> +    anyOf:

oneOf

> +      - items:
> +          - enum:
> +              - renesas,sh2a
> +              - renesas,sh3
> +              - renesas,sh4
> +              - renesas,sh4a
> +              - jcore,j2
> +          - const: renesas,sh2
> +      - const: renesas,sh2
> +
> +  clocks:
> +    maxItems: 1
> +
> +  reg:
> +    maxItems: 1
> +
> +  device_type:
> +    const: cpu
> +
> +required:
> +  - compatible
> +  - reg
> +  - device_type
> +
> +additionalProperties: true

This is a problem with the other cpu bindings, but should not be copied 
here. Add a $ref to schemas/cpu.yaml and make this 
'unevaluatedProperties: false'.

> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/sh7750-cpg.h>
> +    cpus {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        cpu: cpu@0 {
> +            compatible = "renesas,sh4", "renesas,sh2";
> +            device_type = "cpu";
> +            reg = <0>;
> +            clocks = <&cpg SH7750_CPG_ICK>;
> +            clock-names = "ick";
> +            icache-size = <16384>;
> +            icache-line-size = <32>;
> +            dcache-size = <32768>;
> +            dcache-line-size = <32>;
> +        };
> +    };
> +...
> -- 
> 2.39.2
> 
