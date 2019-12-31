Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 166FB12DAA1
	for <lists+dri-devel@lfdr.de>; Tue, 31 Dec 2019 18:34:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C4A96E25D;
	Tue, 31 Dec 2019 17:34:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 424546E25D
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Dec 2019 17:34:20 +0000 (UTC)
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com
 [209.85.222.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id DE1FA2072A
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Dec 2019 17:34:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1577813660;
 bh=Ubol+ZGU8I4XwjYgID2dzkX13k4qieKCPvZKaGiNPk8=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=TlpWPubXziGZTlzh6vZ8vAHgxyk+pmzNan+cIz7d2+X3ZGCfuwKcP3oov9j61O+9v
 J5TeTgeeBYE+ZW6PzcHgH3nYgIKP9/fEJvg/C840KOFDofHCEcnVMrbkxn/t5qs189
 3YqryjVxvDPo/VagOAaj1U5zSD30K+K3k/IvBwi8=
Received: by mail-qk1-f169.google.com with SMTP id a203so29028570qkc.3
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Dec 2019 09:34:19 -0800 (PST)
X-Gm-Message-State: APjAAAWStBg55N3iuIhkKhQf94DBTp/lAqTcm9wZ9cAPnX/u+ct4iBih
 suC1P6gSzrHgh0IQYfD7xmk+rcYObGb3GSoMsQ==
X-Google-Smtp-Source: APXvYqylznp1w41TRmEbV6098m/uRQMYL2IrzKtJTBmuX+S4z65S6oayY8srI9hmWTHPYp3Vxpg73ZSg3+I9IIYm53I=
X-Received: by 2002:a37:a70b:: with SMTP id q11mr59234429qke.393.1577813658959; 
 Tue, 31 Dec 2019 09:34:18 -0800 (PST)
MIME-Version: 1.0
References: <20191231132126.GA13365@ravnborg.org>
In-Reply-To: <20191231132126.GA13365@ravnborg.org>
From: Rob Herring <robh@kernel.org>
Date: Tue, 31 Dec 2019 10:34:07 -0700
X-Gmail-Original-Message-ID: <CAL_Jsq+Agt6dOkq_E_ky7c0x-QtsWgi4os+NXZV73gtNHCAo3w@mail.gmail.com>
Message-ID: <CAL_Jsq+Agt6dOkq_E_ky7c0x-QtsWgi4os+NXZV73gtNHCAo3w@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] dt-bindings: one binding file for all simple panels
To: Sam Ravnborg <sam@ravnborg.org>
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Yannick Fertre <yannick.fertre@st.com>,
 Thierry Reding <thierry.reding@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Dec 31, 2019 at 6:21 AM Sam Ravnborg <sam@ravnborg.org> wrote:
>
> Thierry - I would appreciate feedback from you on this approach!

For the record, I'm in favor of this.

>
> There is an increasing number of new simple panels.
> Common for all simple panels are that they have a
> mandatory power-supply and some of them have backlight and / or
> an enable gpio.

This is the key part I think. It must be clear that only panels with a
single supply meet the definition of 'simple panel'. The main
variation for current bindings are what properties are required or
not. Both backlight and enable gpio could be tied off on any given
platform so they can never really be required.

We'll also probably want to do a version for DSI panels which add 'reg'.

> The binding file to describe these panels adds overhead
> that really do not add value.
> The binding are known and there is nothing gained from a specific
> example as they all look alike.
>
> The following patch introduces a single panel-simple.yaml
> and converts two ampire bindings over to the new file.
>
> The conversion - if applied will have following effects:
>
> - The maintainer for the individual file will change
>     There is no need for many different maintainers for a simple binding.
>     We have the same situation with the panel-simple driver in the kernel.
>
> - The license will change to (GPL-2.0-only OR BSD-2-Clause)
>     There is usually only a single line copied from the original
>     file, a line that is often copied from a datasheet.
>     This license change should be acceptable considered what little
>     is copied.
>     If the license change is not OK we can use a dedicated binding
>     file in these cases.
>
> This is a follow-up on Rob's big patch converting a lot of panel bindings
> to individual files:
>
> "dt-bindings: display: Convert a bunch of panels to DT schema"
> https://patchwork.ozlabs.org/patch/1197683/
>
> The objectives with one file for all the simple panles are:
> - Make it simpler to add bindings for simple panels
> - Keep the number of bindings file lower and thus easier to find a
>   relevant file to copy from when adding new panels.
> - Keep the binding documentation for simple panels more consistent
> - Make it simpler to add support for new panels
>
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Yannick Fertre <yannick.fertre@st.com>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: dri-devel@lists.freedesktop.org
> Cc: devicetree@vger.kernel.org
> ---
>  .../panel/ampire,am-480272h3tmqw-t01h.yaml    | 42 --------------
>  .../panel/ampire,am800480r3tmqwa1h.txt        |  7 ---
>  .../bindings/display/panel/panel-simple.yaml  | 56 +++++++++++++++++++
>  3 files changed, 56 insertions(+), 49 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/panel/ampire,am-480272h3tmqw-t01h.yaml
>  delete mode 100644 Documentation/devicetree/bindings/display/panel/ampire,am800480r3tmqwa1h.txt
>  create mode 100644 Documentation/devicetree/bindings/display/panel/panel-simple.yaml
>
> diff --git a/Documentation/devicetree/bindings/display/panel/ampire,am-480272h3tmqw-t01h.yaml b/Documentation/devicetree/bindings/display/panel/ampire,am-480272h3tmqw-t01h.yaml
> deleted file mode 100644
> index c6e33e7f36d0..000000000000
> --- a/Documentation/devicetree/bindings/display/panel/ampire,am-480272h3tmqw-t01h.yaml
> +++ /dev/null
> @@ -1,42 +0,0 @@
> -# SPDX-License-Identifier: GPL-2.0
> -%YAML 1.2
> ----
> -$id: http://devicetree.org/schemas/display/panel/ampire,am-480272h3tmqw-t01h.yaml#
> -$schema: http://devicetree.org/meta-schemas/core.yaml#
> -
> -title: Ampire AM-480272H3TMQW-T01H 4.3" WQVGA TFT LCD panel
> -
> -maintainers:
> -  - Yannick Fertre <yannick.fertre@st.com>
> -  - Thierry Reding <treding@nvidia.com>
> -
> -allOf:
> -  - $ref: panel-common.yaml#
> -
> -properties:
> -  compatible:
> -    const: ampire,am-480272h3tmqw-t01h
> -
> -  power-supply: true
> -  enable-gpios: true
> -  backlight: true
> -  port: true
> -
> -required:
> -  - compatible
> -
> -additionalProperties: false
> -
> -examples:
> -  - |
> -    panel_rgb: panel {
> -      compatible = "ampire,am-480272h3tmqw-t01h";
> -      enable-gpios = <&gpioa 8 1>;
> -      port {
> -        panel_in_rgb: endpoint {
> -          remote-endpoint = <&controller_out_rgb>;
> -        };
> -      };
> -    };
> -
> -...
> diff --git a/Documentation/devicetree/bindings/display/panel/ampire,am800480r3tmqwa1h.txt b/Documentation/devicetree/bindings/display/panel/ampire,am800480r3tmqwa1h.txt
> deleted file mode 100644
> index 83e2cae1cc1b..000000000000
> --- a/Documentation/devicetree/bindings/display/panel/ampire,am800480r3tmqwa1h.txt
> +++ /dev/null
> @@ -1,7 +0,0 @@
> -Ampire AM-800480R3TMQW-A1H 7.0" WVGA TFT LCD panel
> -
> -Required properties:
> -- compatible: should be "ampire,am800480r3tmqwa1h"
> -
> -This binding is compatible with the simple-panel binding, which is specified
> -in simple-panel.txt in this directory.
> diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> new file mode 100644
> index 000000000000..711fac0a4d12
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> @@ -0,0 +1,56 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/panel/panel-simple.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Simple panels
> +
> +maintainers:
> +  - Thierry Reding <thierry.reding@gmail.com>
> +  - Sam Ravnborg <sam@ravnborg.org>
> +
> +description: |
> +  This binding file is a collection of the simple (dump) panels that

s/dump/dumb/

> +  requires only a power-supply.
> +  There are optionally a backlight and an enable GPIO.
> +  If the panel is more andvanced a dedicated binding file is required.

typo.

I'd move this sentence down and be its own paragraph. We want it to be
very clear to not add new properties here.

> +  The panel may use a port binding for the association to the display,

s/port/OF graph/

> +  or it may be a direct child node of the display.
> +
> +allOf:
> +  - $ref: panel-common.yaml#
> +
> +properties:
> +
> +  compatible:
> +    enum:
> +    # compatible must be listed in alphabetical order, ordered by compatible.
> +    # The description in the comment is mandatory for each compatible.
> +
> +    # Ampire AM-480272H3TMQW-T01H 4.3" WQVGA TFT LCD panel
> +    - ampire,am-480272h3tmqw-t01h
> +    # Ampire AM-800480R3TMQW-A1H 7.0" WVGA TFT LCD panel
> +    - ampire,am800480r3tmqwa1h
> +
> +  backlight: true
> +  enable-gpios: true
> +  power-supply: true
> +  port: true
> +
> +additionalProperties: false
> +
> +required:
> +  - compatible
> +  - power-supply
> +
> +examples:
> +  - |
> +    panel_rgb: panel-rgb {
> +      compatible = "ampire,am-480272h3tmqw-t01h";

This will fail validation as power-supply is missing. :) I suspect we
will have some real failures too and those will need to add
fixed-regulator to fix.

> +      port {
> +        panel_in_rgb: endpoint {
> +          remote-endpoint = <&ltdc_out_rgb>;
> +        };
> +      };
> +    };
> --
> 2.20.1
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
