Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE77568D40A
	for <lists+dri-devel@lfdr.de>; Tue,  7 Feb 2023 11:25:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E035210E4DF;
	Tue,  7 Feb 2023 10:25:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1DA510E4B5
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Feb 2023 10:25:50 +0000 (UTC)
Received: from pendragon.ideasonboard.com (unknown [109.136.43.56])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id D6B284AF;
 Tue,  7 Feb 2023 11:25:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1675765549;
 bh=qnK+yo1byMfwvcnkmhPwEP9KrG9mojeUdyRH0ZsBiuw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JY9nJZtir0n+FDvtpRtIYZZoUVdFH0vGrgiklgbdMyn5t5202bKNR6A+twZW1QMTx
 uw7TzIvdyZSVOViRLRVKxJPHWmrjvUS1ZJFQz96tMbWKEFGHUVIVkHquI9xSJibpCC
 X3yFiUZT613Ab4NRpspto+lBZz4Hga7uvWXuQ38I=
Date: Tue, 7 Feb 2023 12:25:47 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Pin-yen Lin <treapking@chromium.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: display: bridge: Add GPIO display
 mux binding
Message-ID: <Y+InK8qF0Izlv6s6@pendragon.ideasonboard.com>
References: <20230116110820.2615650-1-treapking@chromium.org>
 <20230116110820.2615650-2-treapking@chromium.org>
 <20230117201703.GA3555326-robh@kernel.org>
 <CAEXTbpdOg_un9rWD+QeS1rJLW8wHzDOnkJ-i6R0WNvAU4THEGQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAEXTbpdOg_un9rWD+QeS1rJLW8wHzDOnkJ-i6R0WNvAU4THEGQ@mail.gmail.com>
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
Cc: Nicolas Boichat <drinkcat@chromium.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jonas Karlman <jonas@kwiboo.se>, dri-devel@lists.freedesktop.org,
 Neil Armstrong <neil.armstrong@linaro.org>, linux-kernel@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>, devicetree@vger.kernel.org,
 Robert Foss <robert.foss@linaro.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Feb 07, 2023 at 06:07:44PM +0800, Pin-yen Lin wrote:
> On Wed, Jan 18, 2023 at 4:17 AM Rob Herring wrote:
> > On Mon, Jan 16, 2023 at 07:08:19PM +0800, Pin-yen Lin wrote:
> > > From: Nicolas Boichat <drinkcat@chromium.org>
> > >
> > > Add bindings for Generic GPIO mux driver.
> > >
> > > Signed-off-by: Nicolas Boichat <drinkcat@chromium.org>
> > > Signed-off-by: Pin-yen Lin <treapking@chromium.org>
> > > ---
> > >
> > > Changes in v2:
> > > - Referenced existing dt-binding schemas from graph.yaml
> > > - Added ddc-i2c-bus into the bindings
> > >
> > >  .../bindings/display/bridge/gpio-mux.yaml     | 95 +++++++++++++++++++
> > >  1 file changed, 95 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/display/bridge/gpio-mux.yaml
> > >
> > > diff --git a/Documentation/devicetree/bindings/display/bridge/gpio-mux.yaml b/Documentation/devicetree/bindings/display/bridge/gpio-mux.yaml
> > > new file mode 100644
> > > index 000000000000..da29ba078f05
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/display/bridge/gpio-mux.yaml
> > > @@ -0,0 +1,95 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/display/bridge/gpio-mux.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: Generic display mux (1 input, 2 outputs)
> > > +
> > > +maintainers:
> > > +  - Nicolas Boichat <drinkcat@chromium.org>
> > > +
> > > +description: |
> > > +  This bindings describes a simple display (e.g. HDMI) mux, that has 1
> > > +  input, and 2 outputs. The mux status is controlled by hardware, and
> > > +  its status is read back using a GPIO.
> > > +
> > > +properties:
> > > +  compatible:
> > > +    const: gpio-display-mux
> > > +
> > > +  detect-gpios:
> > > +    maxItems: 1
> > > +    description: GPIO that indicates the active output
> >
> > What are we detecting? That implies an input, but this is selecting the
> > output path, right? Or what does 'mux status is controlled by hardware'
> > mean exactly? Something else? That does not sound very generic.
> 
> The GPIO (or any kind of MUX) is an input that indicates where the
> output should go. The actual "output selection" procedure is done in
> the driver. That is, the driver monitors this GPIO and selects the
> output path accordingly. In our use case, the GPIO is reported by the
> embedded controller on the device.
> 
> [1] listed other similar bridges that can leverage this driver, so we
> called this driver "generic".
> 
> [1]: https://lore.kernel.org/all/CAJMQK-jGw8kJFNjoHjeZUL+3NCiOS2hgGERnAnMwNsL_cm_J=Q@mail.gmail.com/
> 
> > In any case, we have a common mux binding so any kind of mux control
> > could be used here, not just GPIO. Then you can make this just a generic
> > display mux.
> 
> Thanks for sharing this, I'll update the binding in the next version.
>
> > > +
> > > +  ddc-i2c-bus:
> > > +    description: phandle link to the I2C controller used for DDC EDID probing
> > > +    $ref: /schemas/types.yaml#/definitions/phandle
> >
> > This belongs in the connector node(s).
> 
> The HDMI bridge before the MUX doesn't (and doesn't have to) know that
> its next bridge is a MUX. We put it here so that the HDMI bridge can
> parse the phandle and get the bus node.

How does that work, does the HDMI encoder driver parse the ddc-i2c-bus
property of the next DT node in the OF graph ?

> > > +
> > > +  ports:
> > > +    $ref: /schemas/graph.yaml#/properties/ports
> > > +
> > > +    properties:
> > > +      port@0:
> > > +        $ref: /schemas/graph.yaml#/properties/port
> > > +        description: |
> > > +          Video port for input.
> > > +
> > > +      port@1:
> > > +        $ref: /schemas/graph.yaml#/properties/port
> > > +        description: |
> > > +          2 video ports for output.
> > > +          The reg value in the endpoints matches the GPIO status: when
> > > +          GPIO is asserted, endpoint with reg value <1> is selected.
> > > +
> > > +    required:
> > > +      - port@0
> > > +      - port@1
> > > +
> > > +required:
> > > +  - compatible
> > > +  - detect-gpios
> > > +  - ports
> > > +
> > > +unevaluatedProperties: false
> > > +
> > > +examples:
> > > +  - |
> > > +    #include <dt-bindings/gpio/gpio.h>
> > > +    hdmi_mux: hdmi_mux {
> > > +      compatible = "gpio-display-mux";
> > > +      detect-gpios = <&pio 36 GPIO_ACTIVE_HIGH>;
> > > +      pinctrl-names = "default";
> > > +      pinctrl-0 = <&hdmi_mux_pins>;
> > > +      ddc-i2c-bus = <&hdmiddc0>;
> > > +
> > > +      ports {
> > > +        #address-cells = <1>;
> > > +        #size-cells = <0>;
> > > +
> > > +        port@0 { /* input */
> > > +          reg = <0>;
> > > +
> > > +          hdmi_mux_in: endpoint {
> > > +            remote-endpoint = <&hdmi0_out>;
> > > +          };
> > > +        };
> > > +
> > > +        port@1 { /* output */
> > > +          reg = <1>;
> > > +
> > > +          #address-cells = <1>;
> > > +          #size-cells = <0>;
> > > +
> > > +          hdmi_mux_out_anx: endpoint@0 {
> > > +            reg = <0>;
> > > +            remote-endpoint = <&dp_bridge_in>;
> > > +          };
> > > +
> > > +          hdmi_mux_out_hdmi: endpoint@1 {
> > > +            reg = <1>;
> > > +            remote-endpoint = <&hdmi_connector_in>;
> > > +          };
> > > +        };
> > > +      };
> > > +    };

-- 
Regards,

Laurent Pinchart
