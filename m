Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 24DC82422C9
	for <lists+dri-devel@lfdr.de>; Wed, 12 Aug 2020 01:12:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63D976E2D5;
	Tue, 11 Aug 2020 23:12:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52ED36E2D5
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Aug 2020 23:12:54 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id A36689A8;
 Wed, 12 Aug 2020 01:12:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1597187572;
 bh=bsZIpSrl5v4vESB1vCsrKXg6WuAzyrOEr1BzCY32iLQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=v6Zyqzfyn28EmLyu13Soj9xSC/hbhe5clYZwLV0Ju6xkVKlMRrfI2V6ej2Zrsp5dN
 heGK+1ip4HSA9JBfRi3k8gBtOXVqcU8xKQdvbyQOZQLdgzzR5b7/ATlkVcld/p0TF1
 jbMzHQs3SXkfjcUSiVh00K0zrVZWzVtrygXCdX3w=
Date: Wed, 12 Aug 2020 02:12:38 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Venkateshwar Rao Gannavarapu <venkateshwar.rao.gannavarapu@xilinx.com>
Subject: Re: [RFC PATCH V2 1/2] dt-bindings: display: xlnx: dsi: This add a
 DT binding for Xilinx DSI TX subsystem.
Message-ID: <20200811231238.GA23600@pendragon.ideasonboard.com>
References: <1597106777-30913-1-git-send-email-venkateshwar.rao.gannavarapu@xilinx.com>
 <1597106777-30913-2-git-send-email-venkateshwar.rao.gannavarapu@xilinx.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1597106777-30913-2-git-send-email-venkateshwar.rao.gannavarapu@xilinx.com>
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
Cc: sandipk@xilinx.com, hyun.kwon@xilinx.com, airlied@linux.ie,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 vgannava@xilinx.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi GVRao,

Thank you for the patch.

On Tue, Aug 11, 2020 at 06:16:16AM +0530, Venkateshwar Rao Gannavarapu wrote:
> The Xilinx MIPI DSI (Display Serial Interface) Transmitter subsystem
> implements the Mobile Industry Processor Interface (MIPI) based display
> interface. It supports the interface with programmable logic (FPGA).
> 
> Signed-off-by: Venkateshwar Rao Gannavarapu <venkateshwar.rao.gannavarapu@xilinx.com>
> ---
>  .../devicetree/bindings/display/xlnx/xlnx,dsi.yaml | 147 +++++++++++++++++++++
>  1 file changed, 147 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/xlnx/xlnx,dsi.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/xlnx/xlnx,dsi.yaml b/Documentation/devicetree/bindings/display/xlnx/xlnx,dsi.yaml
> new file mode 100644
> index 0000000..73da0d8
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/xlnx/xlnx,dsi.yaml
> @@ -0,0 +1,147 @@
> +# SPDX-License-Identifier: GPL-2.0

New bindings must be licensed as (GPL-2.0-only OR BSD-2-Clause).

> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/xlnx/xlnx,dsi.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Xilinx Programmable DSI-TX Subsystem
> +
> +description: |
> +  The programmable MIPI DSI controller of Xilinx implements display pipeline
> +  based on DSI v1.3 specification. The subsystem includes multiple functional
> +  blocks as below
> +
> +  +---------------+                +-----------------------------------------------+
> +  |               |                |                      +------------------+     |
> +  |               |                |         v----------->+AXI CROSBAR       |XXX  |
> +  |FRAME BUFFER   | AXI STREAM     |         |            |                  X   X |
> +  |(DMA)          |       +------->+    +------------+    +------------------+  XX |
> +  |               +<------+        |    |MIPI        |                          X  |
> +  |               |                |    |DSI-TX      |                          X  |
> +  |               |                |    |Controller  |             +------------+  |
> +  |               |                |    |            +------------->D-PHY       |  |
> +  +---------------+                |    |            |             |            |  |
> +                  S_AXIS_ACLK      |    +-------------<------------+            |  |
> +                 +---------------->+                               |            |  |
> +                                   |                               |            |  |
> +                  DPHY_CLK_200M    |                               |            |  |
> +                 +---------------->+                               |            |  |
> +                 +                 |                               +------------+  |
> +                                   |                                               |
> +                                   | MIPI DSI TX SUBSYSTEM                         |
> +                                   +-----------------------------------------------+
> +
> +  The DSI TX controller consists of multiple layers such as lane management layer,
> +  low-level protocol and pixel-to-byte conversion. The DSI TX controller core
> +  receives stream of image data through an input stream interface. The subsystem
> +  driver supports upto 4 lane support and generates PPI trasfers towards DPHY

DT bindings shouldn't mention drivers, you can just say "The subsystem
supports up to 4 data lanes ...".

s/trasfers/transfers/

> +  with continuous clock. It supports Burst, non-burst modes and command modes.
> +
> +maintainers:
> +  - Venkateshwar Rao Gannavarapu <venkateshwar.rao.gannavarapu@xilinx.com>
> +
> +properties:
> +  compatible:
> +    const: xlnx,dsi-1.0

I think calling it just "dsi-1.0" isn't specific enough, as it could
also be a DSI RX. "xlnx,dsi-tx-1.0" would be a better value.

Is this binding for v1.0 of the IP core ? There's a v2.0 too. Only v2.0
supports command mode as far as I can tell, so with the
xlnx,dsi-cmd-mode property below, this seems to match v2.0.

> +
> +  reg:
> +    maxItems: 1

This should specify in the description if only the DSI TX registers are
covered, or if the D-PHY registers are included too.

> +
> +  clocks:
> +    description: List of clock specifiers
> +    items:
> +      - description: AXI Lite clock
> +      - description: Video DPHY clock
> +
> +  clock-names:
> +    items:
> +      - const: s_axis_aclk
> +      - const: dphy_clk_200M
> +
> +  xlnx,dsi-num-lanes:
> +    description: Maximum number of lanes that IP configured with.
> +           possible values are 1, 2, 4.

You can drop the second sentence as it's implied by the enum below.

> +
> +    allOf:
> +      - $ref: /schemas/types.yaml#/definitions/uint32
> +      - enum: [1, 2, 4]

Do we need this property ? The protocol configuration register has an
Active Lanes field that reports the number of lanes. Could we read the
information from the register, and drop this property ?

> +
> +  xlnx,dsi-data-type:
> +    description: MIPI DSI pixel format.
> +           possible values are 0, 1, 2, 3.

Same here.

> +
> +    allOf:
> +      - $ref: /schemas/types.yaml#/definitions/uint32
> +      - enum: [0, 1, 2, 3]

Same comment as above, should this be read from the Pixel Format field
instead of being specified in DT ?

> +
> +  xlnx,dsi-cmd-mode:
> +    description: denotes command mode support
> +
> +    allOf:
> +      - $ref: /schemas/types.yaml#/definitions/uint32
> +      - enum: [0, 1]

I don't see a command mode user parameter in the datasheet, it seems
that command mode is a runtime configuration parameter (bit 3 in the
Core Configuration Register). It shouldn't be specified in DT, but
queried at runtime from the connected panel.

> +
> +  ports:
> +    type: object
> +
> +    properties:
> +      port@0:
> +        type: object
> +        description: |
> +          output / source port node, endpoint describing modules
> +          connected the DSI TX subsystem
> +
> +        properties:
> +          reg:
> +            const: 0
> +
> +          endpoint:
> +            type: object
> +
> +            properties:
> +
> +              remote-endpoint: true
> +
> +            required:
> +              - remote-endpoint
> +
> +            additionalProperties: false
> +
> +        additionalProperties: false

There should also be a port for the AXI4-Stream interface. The common
practice is to number the input port@0 and the output port@1.

Shouldn't ports specify

    required:
      - port@0
      - port@1

?

> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - xlnx,dsi-num-lanes
> +  - xlnx,dsi-data-type
> +  - xlnx,dsi-cmd-mode
> +  - ports
> +
> +additionalProperties: false
> +
> +examples:
> + -  |
> +    mipi_dsi_tx_subsystem@80000000 {
> +      compatible = "xlnx,dsi-1.0";
> +      reg = <0x0 0x80000000 0x0 0x10000>;

DT examples are compiled in a context where #address-cells and
#size-cells are both set to 1. The reg property should thus be
<0x80000000 0x10000>; in the example, even if it doesn't match the
hardware.

Could you please validate the bindings with

	make dt_binding_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/display/xlnx/xlnx,dsi.yaml

as explained in Documentation/devicetree/writing-schema.rst ? This will
also compile the example to make sure that everything is right.

> +      clocks = <&misc_clk_0>, <&misc_clk_1>;
> +      clock-names = "s_axis_aclk", "dphy_clk_200M";
> +      xlnx,dsi-num-lanes = <4>;
> +      xlnx,dsi-data-type = <1>;
> +      xlnx,dsi-cmd-mode = <0>;
> +      ports {
> +          #address-cells = <1>;
> +          #size-cells = <0>;
> +
> +          port@0 {
> +              reg = <0x0>;
> +              dsi_tx_out: endpoint {
> +                   remote-endpoint = <&panel_in>;
> +              };
> +          };
> +      };
> +    };
> +
> +...

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
