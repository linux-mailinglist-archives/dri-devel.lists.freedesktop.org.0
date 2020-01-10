Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C2FC137479
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jan 2020 18:12:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DED476EA65;
	Fri, 10 Jan 2020 17:12:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93ECF6EA65
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jan 2020 17:12:29 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 5463420053;
 Fri, 10 Jan 2020 18:12:27 +0100 (CET)
Date: Fri, 10 Jan 2020 18:12:26 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Icenowy Zheng <icenowy@aosc.io>
Subject: Re: [PATCH 2/5] dt-bindings: panel: add Feixin K101 IM2BA02 MIPI-DSI
 panel
Message-ID: <20200110171226.GB25099@ravnborg.org>
References: <20200110155225.1051749-1-icenowy@aosc.io>
 <20200110155225.1051749-3-icenowy@aosc.io>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200110155225.1051749-3-icenowy@aosc.io>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=eMA9ckh1 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=gEfo2CItAAAA:8
 a=q9ad5_0hBVDqaoZWYP0A:9 a=AFdBQuwNfT9Z_ji9:21 a=HW4JGcA6RQc568Jt:21
 a=CjuIK1q_8ugA:10 a=sptkURWiP4Gy88Gu7hUp:22 a=pHzHmUro8NiASowvMSCR:22
 a=6VlIyEUom7LUIeUMNQJH:22
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-sunxi@googlegroups.com, linux-kernel@vger.kernel.org,
 Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Icenowy.

On Fri, Jan 10, 2020 at 11:52:22PM +0800, Icenowy Zheng wrote:
> Feixin K101 IM2BA02 is a 10.1" 800x1280 4-lane MIPI-DSI panel.
> 
> Add device tree binding for it.
Thanks for using the new meta-schema format and with the correct
license.


The example fails dt_binding_check - I had to do the following to make
it pass:

diff --git a/Documentation/devicetree/bindings/display/panel/feixin,k101-im2ba02.yaml b/Documentation/devicetree/bindings/display/panel/feixin,k101-im2ba02.yaml
index 7176d14893ff..c43f884de6ac 100644
--- a/Documentation/devicetree/bindings/display/panel/feixin,k101-im2ba02.yaml
+++ b/Documentation/devicetree/bindings/display/panel/feixin,k101-im2ba02.yaml
@@ -37,7 +37,9 @@ additionalProperties: false
 
 examples:
   - |
-    &dsi {
+    #include <dt-bindings/gpio/gpio.h>
+
+    dsi {
         #address-cells = <1>;
         #size-cells = <0>;
         panel@0 {

Added include to get definition of GPIO_...
And dropped the "&" as it is not OK in the example here.

And please consider if backlight really is a required property.

	Sam
> 
> Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
> ---
>  .../display/panel/feixin,k101-im2ba02.yaml    | 54 +++++++++++++++++++
>  1 file changed, 54 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/feixin,k101-im2ba02.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/feixin,k101-im2ba02.yaml b/Documentation/devicetree/bindings/display/panel/feixin,k101-im2ba02.yaml
> new file mode 100644
> index 000000000000..7176d14893ff
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/feixin,k101-im2ba02.yaml
> @@ -0,0 +1,54 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/panel/feixin,k101-im2ba02.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Feixin K101 IM2BA02 10.1" MIPI-DSI LCD panel
> +
> +maintainers:
> +  - Icenowy Zheng <icenowy@aosc.io>
> +
> +allOf:
> +  - $ref: panel-common.yaml#
> +
> +properties:
> +  compatible:
> +    const: feixin,k101-im2ba02
> +  reg: true
> +  backlight: true
> +  reset-gpios: true
> +  avdd-supply:
> +     description: regulator that supplies the AVDD voltage
> +  dvdd-supply:
> +     description: regulator that supplies the DVDD voltage
> +  cvdd-supply:
> +     description: regulator that supplies the CVDD voltage
> +
> +required:
> +  - compatible
> +  - reg
> +  - backlight
> +  - avdd-supply
> +  - dvdd-supply
> +  - cvdd-supply
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    &dsi {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +        panel@0 {
> +            compatible = "feixin,k101-im2ba02";
> +            reg = <0>;
> +            avdd-supply = <&reg_dc1sw>;
> +            dvdd-supply = <&reg_dc1sw>;
> +            cvdd-supply = <&reg_ldo_io1>;
> +            reset-gpios = <&pio 3 24 GPIO_ACTIVE_HIGH>;
> +            backlight = <&backlight>;
> +        };
> +    };
> +
> +...
> -- 
> 2.23.0
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
