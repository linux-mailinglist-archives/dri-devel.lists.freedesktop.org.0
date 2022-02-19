Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6591C4BC90B
	for <lists+dri-devel@lfdr.de>; Sat, 19 Feb 2022 16:25:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 814C310FC96;
	Sat, 19 Feb 2022 15:25:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.smtp.larsendata.com (mx2.smtp.larsendata.com
 [91.221.196.228])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F07B10FC96
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Feb 2022 15:25:29 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx2.smtp.larsendata.com (Halon) with ESMTPS
 id 35db18a9-9198-11ec-b2df-0050568cd888;
 Sat, 19 Feb 2022 15:25:46 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id 8100D194C5E;
 Sat, 19 Feb 2022 16:25:26 +0100 (CET)
Date: Sat, 19 Feb 2022 16:25:22 +0100
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>
Subject: Re: [PATCH v4 1/3] dt-bindings: display: add bindings for MIPI DBI
 compatible SPI panels
Message-ID: <YhEL4hgArpjFbcBx@ravnborg.org>
References: <20220218151110.11316-1-noralf@tronnes.org>
 <20220218151110.11316-2-noralf@tronnes.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220218151110.11316-2-noralf@tronnes.org>
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
Cc: devicetree@vger.kernel.org, david@lechnology.com,
 dave.stevenson@raspberrypi.com, dri-devel@lists.freedesktop.org,
 robh+dt@kernel.org, thierry.reding@gmail.com, maxime@cerno.tech
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Noralf,

On Fri, Feb 18, 2022 at 04:11:08PM +0100, Noralf Trønnes wrote:
> Add binding for MIPI DBI compatible SPI panels.
> 
> v4:
> - There should only be two compatible (Maxime)
> - s/panel-dbi-spi/panel-mipi-dbi-spi/in compatible
> 
> v3:
> - Move properties to Device Tree (Maxime)
> - Use contains for compatible (Maxime)
> - Add backlight property to example
> - Flesh out description
> 
> v2:
> - Fix path for panel-common.yaml
> - Use unevaluatedProperties
> - Drop properties which are in the allOf section
> - Drop model property (Rob)
> 
> Acked-by: Maxime Ripard <maxime@cerno.tech>
> Signed-off-by: Noralf Trønnes <noralf@tronnes.org>
> ---
>  .../display/panel/panel-mipi-dbi-spi.yaml     | 125 ++++++++++++++++++
>  1 file changed, 125 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/panel-mipi-dbi-spi.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/panel-mipi-dbi-spi.yaml b/Documentation/devicetree/bindings/display/panel/panel-mipi-dbi-spi.yaml
> new file mode 100644
> index 000000000000..748c09113168
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/panel-mipi-dbi-spi.yaml
> @@ -0,0 +1,125 @@
> +# SPDX-License-Identifier: (GPL-2.0-only or BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/panel/panel-mipi-dbi-spi.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MIPI DBI SPI Panel
> +
> +maintainers:
> +  - Noralf Trønnes <noralf@tronnes.org>
> +
> +description: |
> +  This binding is for display panels using a MIPI DBI compatible controller
> +  in SPI mode.
> +
> +  The MIPI Alliance Standard for Display Bus Interface defines the electrical
> +  and logical interfaces for display controllers historically used in mobile
> +  phones. The standard defines 4 display architecture types and this binding is
> +  for type 1 which has full frame memory. There are 3 interface types in the
> +  standard and type C is the serial interface.
> +
> +  The standard defines the following interface signals for type C:
> +  - Power:
> +    - Vdd: Power supply for display module
> +    - Vddi: Logic level supply for interface signals
> +    Combined into one in this binding called: power-supply
> +  - Interface:
> +    - CSx: Chip select
> +    - SCL: Serial clock
> +    - Dout: Serial out
> +    - Din: Serial in
> +    - SDA: Bidrectional in/out
> +    - D/CX: Data/command selection, high=data, low=command
> +      Called dc-gpios in this binding.
> +    - RESX: Reset when low
> +      Called reset-gpios in this binding.
> +
> +  The type C interface has 3 options:
> +
> +    - Option 1: 9-bit mode and D/CX as the 9th bit
> +      |              Command              |  the next command or following data  |
> +      |<0><D7><D6><D5><D4><D3><D2><D1><D0>|<D/CX><D7><D6><D5><D4><D3><D2><D1><D0>|
> +
> +    - Option 2: 16-bit mode and D/CX as a 9th bit
> +      |              Command or data                              |
> +      |<X><X><X><X><X><X><X><D/CX><D7><D6><D5><D4><D3><D2><D1><D0>|
> +
> +    - Option 3: 8-bit mode and D/CX as a separate interface line
> +      |        Command or data         |
> +      |<D7><D6><D5><D4><D3><D2><D1><D0>|
> +
> +  The panel resolution is specified using the panel-timing node properties
> +  hactive (width) and vactive (height). The other mandatory panel-timing
> +  properties should be set to zero except clock-frequency which can be
> +  optionally set to inform about the actual pixel clock frequency.
> +
> +  If the panel is wired to the controller at an offset specify this using
> +  hback-porch (x-offset) and vback-porch (y-offset).
Very informative description - well done.

> +
> +allOf:
> +  - $ref: panel-common.yaml#
> +  - $ref: /schemas/spi/spi-peripheral-props.yaml#
> +
> +properties:
> +  compatible:
> +    items:
> +      - {} # Panel Specific Compatible
> +      - const: panel-mipi-dbi-spi
> +
> +  write-only:
> +    type: boolean
> +    description:
> +      Controller is not readable (ie. MISO is not wired up).
It would be easier to understand if this comment refers to one of the
pins on the display described above. So maybe something like
(ie. Din (MSIO on the SPI interface) is not wired up).

With the comment updated to include a reference to Din,
Acked-by: Sam Ravnborg <sam@ravnborg.org>
