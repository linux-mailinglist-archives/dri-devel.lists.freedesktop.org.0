Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D0F6A2EA506
	for <lists+dri-devel@lfdr.de>; Tue,  5 Jan 2021 06:49:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 817E589E9E;
	Tue,  5 Jan 2021 05:49:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C853189E9E
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Jan 2021 05:49:34 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 053063D7;
 Tue,  5 Jan 2021 06:49:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1609825773;
 bh=1EEOOS4lg9W4FSPSZBOHCVx854ulabOPqVw1L4HByaQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LBzgQOlSXBFHTKhRHgbK+V8t2KFKOGl0xliWsbeQri9RVQ9nFYw7pUToRpDJHoYtk
 ACN9n1iUvutIWSeo7zdN8Sbp7lN5hMZKrbB+TFkScBhG0w8t00n95FFXprRrI8O9Ew
 xq9ut5BtHFHEZ9IVwgm56sQfIrNOU1WENPv2KrtM=
Date: Tue, 5 Jan 2021 07:49:20 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH v2 3/6] dt-bindings: display: imx: hdmi: Convert binding
 to YAML
Message-ID: <X/P94CIrNtGkoZ4k@pendragon.ideasonboard.com>
References: <20201220195005.26438-1-laurent.pinchart+renesas@ideasonboard.com>
 <20201220195005.26438-4-laurent.pinchart+renesas@ideasonboard.com>
 <810947ea1a18e06db1f36a4a8013fbca17e0ea89.camel@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <810947ea1a18e06db1f36a4a8013fbca17e0ea89.camel@pengutronix.de>
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
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Sandy Huang <hjc@rock-chips.com>, dri-devel@lists.freedesktop.org,
 linux-renesas-soc@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>, Maxime Ripard <maxime@cerno.tech>,
 Mark Yao <mark.yao@rock-chips.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Philipp,

On Mon, Jan 04, 2021 at 04:30:36PM +0100, Philipp Zabel wrote:
> On Sun, 2020-12-20 at 21:50 +0200, Laurent Pinchart wrote:
> > Convert the i.MX6 HDMI TX text binding to YAML.
> > 
> > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > ---
> > Changes since v1:
> > 
> > - Only specify maxItems for clocks
> > - Drop reg and interrupts as they're checked in the base schema
> > - Rebase on top of OF graph schema, dropped redundant properties
> > - Fix identation for enum entries
> > - Drop clock-names items, use maxItems only
> > ---
> >  .../bindings/display/imx/fsl,imx6-hdmi.yaml   | 130 ++++++++++++++++++
> >  .../devicetree/bindings/display/imx/hdmi.txt  |  65 ---------
> >  2 files changed, 130 insertions(+), 65 deletions(-)
> >  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx6-hdmi.yaml
> >  delete mode 100644 Documentation/devicetree/bindings/display/imx/hdmi.txt
> > 
> > diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx6-hdmi.yaml b/Documentation/devicetree/bindings/display/imx/fsl,imx6-hdmi.yaml
> > new file mode 100644
> > index 000000000000..f9b131bb3339
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/display/imx/fsl,imx6-hdmi.yaml
> > @@ -0,0 +1,130 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/display/imx/fsl,imx6-hdmi.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Freescale i.MX6 DWC HDMI TX Encoder
> > +
> > +maintainers:
> > +  - Philipp Zabel <p.zabel@pengutronix.de>
> > +
> > +description: |
> > +  The HDMI transmitter is a Synopsys DesignWare HDMI 1.4 TX controller IP
> > +  with a companion PHY IP.
> > +
> > +allOf:
> > +  - $ref: ../bridge/synopsys,dw-hdmi.yaml#
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - fsl,imx6dl-hdmi
> > +      - fsl,imx6q-hdmi
> > +
> > +  reg-io-width:
> > +    const: 1
> > +
> > +  clocks:
> > +    maxItems: 2
> > +
> > +  clock-names:
> > +    maxItems: 2
> > +
> > +  ddc-i2c-bus:
> > +    $ref: /schemas/types.yaml#/definitions/phandle
> > +    description:
> > +      The HDMI DDC bus can be connected to either a system I2C master or the
> > +      functionally-reduced I2C master contained in the DWC HDMI. When connected
> > +      to a system I2C master this property contains a phandle to that I2C
> > +      master controller.
> > +
> > +  gpr:
> > +    $ref: /schemas/types.yaml#/definitions/phandle
> > +    description:
> > +      phandle to the iomuxc-gpr region containing the HDMI multiplexer control
> > +      register.
> > +
> > +  ports:
> > +    $ref: /schemas/graph.yaml#/properties/ports
> > +    description: |
> > +      This device has four video ports, corresponding to the four inputs of the
> > +      HDMI multiplexer. Each port shall have a single endpoint.
> > +
> > +    properties:
> > +      port@0:
> > +        $ref: /schemas/graph.yaml#/$defs/port-base
> > +        unevaluatedProperties: false
> > +        description: First input of the HDMI multiplexer
> > +
> > +      port@1:
> > +        $ref: /schemas/graph.yaml#/$defs/port-base
> > +        unevaluatedProperties: false
> > +        description: Second input of the HDMI multiplexer
> > +
> > +      port@2:
> > +        $ref: /schemas/graph.yaml#/$defs/port-base
> > +        unevaluatedProperties: false
> > +        description: Third input of the HDMI multiplexer
> > +
> > +      port@3:
> > +        $ref: /schemas/graph.yaml#/$defs/port-base
> > +        unevaluatedProperties: false
> > +        description: Fourth input of the HDMI multiplexer
> > +
> > +    anyOf:
> > +      - required:
> > +          - port@0
> > +      - required:
> > +          - port@1
> > +      - required:
> > +          - port@2
> > +      - required:
> > +          - port@3
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - clocks
> > +  - clock-names
> > +  - gpr
> > +  - interrupts
> > +  - ports
> 
> Won't this break validation of current i.MX6 DTs, which don't use the
> ports node (in imx6q(dl).dtsi)?

I may be missing something, but in imx6qdl.dtsi, we have

		hdmi: hdmi@120000 {
			#address-cells = <1>;
			#size-cells = <0>;
			reg = <0x00120000 0x9000>;
			interrupts = <0 115 0x04>;
			gpr = <&gpr>;
			clocks = <&clks IMX6QDL_CLK_HDMI_IAHB>,
				 <&clks IMX6QDL_CLK_HDMI_ISFR>;
			clock-names = "iahb", "isfr";
			status = "disabled";

			port@0 {
				reg = <0>;

				hdmi_mux_0: endpoint {
					remote-endpoint = <&ipu1_di0_hdmi>;
				};
			};

			port@1 {
				reg = <1>;

				hdmi_mux_1: endpoint {
					remote-endpoint = <&ipu1_di1_hdmi>;
				};
			};
		};

and in imx6q.dtsi,

&hdmi {
	compatible = "fsl,imx6q-hdmi";

	port@2 {
		reg = <2>;

		hdmi_mux_2: endpoint {
			remote-endpoint = <&ipu2_di0_hdmi>;
		};
	};

	port@3 {
		reg = <3>;

		hdmi_mux_3: endpoint {
			remote-endpoint = <&ipu2_di1_hdmi>;
		};
	};
};

There are no other occurrences of "fsl,imx6q-hdmi" than in imx6q.dtsi
(and no occurrences of "fsl,imx6qdl-hdmi" at all).

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
