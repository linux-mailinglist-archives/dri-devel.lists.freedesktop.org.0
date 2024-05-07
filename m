Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 986E18BEE1D
	for <lists+dri-devel@lfdr.de>; Tue,  7 May 2024 22:28:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C03A10F76D;
	Tue,  7 May 2024 20:28:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="s/7Z6wOs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B160210F76A
 for <dri-devel@lists.freedesktop.org>; Tue,  7 May 2024 20:28:39 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 8540C61985;
 Tue,  7 May 2024 20:28:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDD7FC2BBFC;
 Tue,  7 May 2024 20:28:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1715113718;
 bh=TCF7hOj8TOI1UmjmvR3q0z4EpIMUXu7CfZrmz7GNu74=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=s/7Z6wOsYQeEg/baJMeFadmC3zvVzz2BSK+Ay9HgDzGibFrhHxxlM11/WYZnhIh4p
 0PD9QrrfR1KEkjXnOcNwgNf+/RmqTZ6NKoqNJZjbAtBA+vZGHTpunRuQqDyZi6knoC
 WOjIK42YJOnIk2VNva+KVBUSwdvDJZzoiYfXqV1pk1E8/sI9cWCBaiepHZzw2cDtEE
 A1CORuNuRBxuMEQ+6ue9qY9jJzjYieLKHsQ3SI5vxdHT7BT5Bur/tHhLfE3lLmrWLe
 8VwHu9kmqIJXTSyDXuBnHcHV6ihNU7fAmedPF7X07estjZELV33Sxd3GWQc/xSbwr3
 3RgrJAdZOKBZw==
Date: Tue, 7 May 2024 15:28:36 -0500
From: Rob Herring <robh@kernel.org>
To: Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>,
 Tommaso Merciai <tommaso.merciai@amarulasolutions.com>
Subject: Re: [PATCH 1/5] dt-bindings: display: panel: mipi-dbi-spi: Add a
 pixel format property
Message-ID: <20240507202836.GA997432-robh@kernel.org>
References: <20240507-panel-mipi-dbi-rgb666-v1-0-6799234afa3e@tronnes.org>
 <20240507-panel-mipi-dbi-rgb666-v1-1-6799234afa3e@tronnes.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240507-panel-mipi-dbi-rgb666-v1-1-6799234afa3e@tronnes.org>
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

On Tue, May 07, 2024 at 11:57:26AM +0200, Noralf Trønnes wrote:
> The MIPI DBI 2.0 specification (2005) lists only two pixel formats for
> the Type C Interface (SPI) and that is 3-bits/pixel RGB111 with
> 2 options for bit layout.
> 
> For Type A and B (parallel) the following formats are listed: RGB332,
> RGB444, RGB565, RGB666 and RGB888 (some have 2 options for the bit layout).
> 
> Many MIPI DBI compatible controllers support all interface types on the
> same chip and often the manufacturers have chosen to provide support for
> the Type A/B interface pixel formats also on the Type C interface.
> 
> Some chips provide many pixel formats with optional bit layouts over SPI,
> but the most common by far are RGB565 and RGB666. So even if the
> specification doesn't list these formats for the Type C interface, the
> industry has chosen to include them.
> 
> The MIPI DCS specification lists the standard commands that can be sent
> over the MIPI DBI interface. The set_address_mode (36h) command has one
> bit in the parameter that controls RGB/BGR order:
>     This bit controls the RGB data latching order transferred from the
>     peripheral’s frame memory to the display device.
> This means that each supported RGB format also has a BGR variant.
> 
> Based on this rationale document the following pixel formats describing
> the bit layout going over the wire:
> - RGB111 (option 1): x2r1g1b1r1g1b1 (2 pixels per byte)
> - BGR111 (option 1): x2b1g1r1b1g1r1 (2 pixels per byte)
> - RGB111 (option 2): x1r1g1b1x1r1g1b1 (2 pixels per byte)
> - BGR111 (option 2): x1b1g1r1x1b1g1r1 (2 pixels per byte)
> - RGB565: r5g6b5 (2 bytes)
> - BGR565: b5g6r5 (2 bytes)
> - RGB666: r6x2g6x2b6x2 (3 bytes)
> - BGR666: b6x2g6x2r6x2 (3 bytes)
> (x: don't care)
> 
> Signed-off-by: Noralf Trønnes <noralf@tronnes.org>
> ---
>  .../bindings/display/panel/panel-mipi-dbi-spi.yaml | 31 ++++++++++++++++++++++
>  1 file changed, 31 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/panel-mipi-dbi-spi.yaml b/Documentation/devicetree/bindings/display/panel/panel-mipi-dbi-spi.yaml
> index e808215cb39e..dac8f9af100e 100644
> --- a/Documentation/devicetree/bindings/display/panel/panel-mipi-dbi-spi.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/panel-mipi-dbi-spi.yaml
> @@ -50,6 +50,12 @@ description: |
>        |        Command or data         |
>        |<D7><D6><D5><D4><D3><D2><D1><D0>|
>  
> +  The standard defines one pixel format for type C: RGB111. The industry
> +  however has decided to provide the type A/B interface pixel formats also on
> +  the Type C interface and most common among these are RGB565 and RGB666.
> +  The MIPI DCS command set_address_mode (36h) has one bit that controls RGB/BGR
> +  order. This gives each supported RGB format a BGR variant.
> +
>    The panel resolution is specified using the panel-timing node properties
>    hactive (width) and vactive (height). The other mandatory panel-timing
>    properties should be set to zero except clock-frequency which can be
> @@ -90,6 +96,29 @@ properties:
>  
>    spi-3wire: true
>  
> +  format:
> +    description: >
> +      Pixel format in bit order as going on the wire:
> +        * `x2r1g1b1r1g1b1` - RGB111, 2 pixels per byte
> +        * `x2b1g1r1b1g1r1` - BGR111, 2 pixels per byte
> +        * `x1r1g1b1x1r1g1b1` - RGB111, 2 pixels per byte
> +        * `x1b1g1r1x1b1g1r1` - BGR111, 2 pixels per byte
> +        * `r5g6b5` - RGB565, 2 bytes
> +        * `b5g6r5` - BGR565, 2 bytes
> +        * `r6x2g6x2b6x2` - RGB666, 3 bytes
> +        * `b6x2g6x2r6x2` - BGR666, 3 bytes
> +      This property is optional for backwards compatibility and `r5g6b5` is
> +      assumed in its absence.

Use schemas, not free form text:

default: r5g6b5

> +    enum:
> +      - x2r1g1b1r1g1b1
> +      - x2b1g1r1b1g1r1
> +      - x1r1g1b1x1r1g1b1
> +      - x1b1g1r1x1b1g1r1
> +      - r5g6b5
> +      - b5g6r5
> +      - r6x2g6x2b6x2
> +      - b6x2g6x2r6x2
> +
>  required:
>    - compatible
>    - reg
> @@ -116,6 +145,8 @@ examples:
>              reset-gpios = <&gpio 25 GPIO_ACTIVE_HIGH>;
>              write-only;
>  
> +            format = "r5g6b5";
> +
>              backlight = <&backlight>;
>  
>              width-mm = <35>;
> 
> -- 
> 2.45.0
> 
