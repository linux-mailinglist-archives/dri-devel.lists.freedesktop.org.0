Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AAAE18877A
	for <lists+dri-devel@lfdr.de>; Tue, 17 Mar 2020 15:27:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CAC66E145;
	Tue, 17 Mar 2020 14:27:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD8016E145
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Mar 2020 14:27:08 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 2158F20031;
 Tue, 17 Mar 2020 15:27:04 +0100 (CET)
Date: Tue, 17 Mar 2020 15:27:02 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Vinay Simha B N <simhavcs@gmail.com>
Subject: Re: [PATCH 1/2] dt-binding: Add DSI/LVDS tc358775 bridge bindings
Message-ID: <20200317142702.GA16338@ravnborg.org>
References: <1583920112-2680-1-git-send-email-simhavcs@gmail.com>
 <20200312151752.GA7490@bogus>
 <CAGWqDJ7DP3DuR7EWT6Ni8YxN3Adg3RgJZut6+AtpAak_HB=QCQ@mail.gmail.com>
 <CAGWqDJ4cAU98_xMk6f-bsT5LF5cD2JJk8_JCykwM=cd6CCfWtw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAGWqDJ4cAU98_xMk6f-bsT5LF5cD2JJk8_JCykwM=cd6CCfWtw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=eMA9ckh1 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=gEfo2CItAAAA:8
 a=pGLkceISAAAA:8 a=KY18R1YYeKRrVLQ61OwA:9 a=5V_uxFQuYriqKHR4:21
 a=H5yeRiyAWD2ozbk7:21 a=CjuIK1q_8ugA:10 a=sptkURWiP4Gy88Gu7hUp:22
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Vinay.

On Tue, Mar 17, 2020 at 12:25:42PM +0530, Vinay Simha B N wrote:
> sam,
> 
> i need some inputs on the below  error. I had created this file
> Documentation/devicetree/bindings/display/bridge/toshiba-tc358775.yaml
> by using vim editor. Do we have any tool to create yaml file?

I use vim myself, but is careful to follow the right syntax.

> 
> i do not get the error when running 'make dt_binding_check' in my
> build environment
> Documentation/devicetree/bindings/display/bridge/toshiba-tc358775.yaml
> 
> is there any tool available similar to  scripts/checkpatch.pl -f
> <file> , for yaml files?

Please read Documentation/devicetree/writing-schema.
Here you can find general info + instruction how to install the tools
required for "make dt_binding_check".

I could reproduce the error reported by Rob.
I gave your binding file a shot - there were a lot of smaller issues:

- do not use tabs in yaml files
- be consistent in indent
- vendor prefixed properties needed some extra care
- example was full of bugs
  - "..."
  - no need for status = "okay";
  - properties spelled wrong

For the example I adjusted it to use indent of 4 spaces, which IMO
is more readable than the two spaces used in the other parts of the 
file.

I have attached the updated binding file - please review and fix.
This is just a quick shot, I did not do a proper review.

Please rename the file, other files in same dir are named "toshiba,xxx",
so replace '-' with ','.

And try to introduce bugs in the example - and check that the tooling
catches the bug.

hint:

    make DT=.../foo.yaml dt_binding_check

is a qucik way to check only your binding.

And for new bindings the preferred license is: (GPL-2.0-only OR BSD-2-Clause)

	Sam

# SPDX-License-Identifier: GPL-2.0
%YAML 1.2
---
$id: http://devicetree.org/schemas/display/bridge/toshiba-tc358775.yaml#
$schema: http://devicetree.org/meta-schemas/core.yaml#


title: Toshiba TC358775 DSI to LVDS bridge bindings

maintainers:
  - Vinay Simha BN <simhavcs@gmail.com>

description: |
  This binding supports DSI to LVDS bridge TC358775

properties:
  compatible:
    const: toshiba,tc358775

  reg:
    maxItems: 1
    description: i2c address of the bridge, 0x0f

  toshiba,dsi-lanes:
    allOf:
      - $ref: /schemas/types.yaml#/definitions/uint32
      - minimum: 1
        maximum: 4
        default: 1
    description: bla bla

  toshiba,dual-link:
    $ref: /schemas/types.yaml#definitions/flag
    description: bla bla

  vdd-supply:
    maxItems: 1
    description: 1.2V LVDS Power Supply

  vddio-supply:
    maxItems: 1
    description: 1.8V IO Power Supply

  stby-gpios:
    maxItems: 1
    description: Standby pin, Low active

  reset-gpios:
    maxItems: 1
    description: Hardware reset, Low active

  ports:
    type: object

    properties:
      port@0:
        type: object
        description: |
          DSI Input. The remote endpoint phandle should be a
          reference to a valid mipi_dsi_host device node.
      port@1:
        type: object
        description: |
          Video port for LVDS output (panel or connector).

    required:
      - port@0
      - port@1

required:
 - compatible
 - reg
 - tc,dsi-lanes
 - vdd-supply
 - vddio-supply
 - stby-gpios
 - reset-gpios
 - ports

examples:
  - |+
    #include <dt-bindings/gpio/gpio.h>

    i2c@78b8000 {
        #address-cells = <1>;
        #size-cells = <0>;

        /* On High speed expansion */
        label = "HS-I2C2";
        status = "okay";

        tc_bridge: bridge@f {
            compatible = "toshiba,tc358775";
            reg = <0x0f>;

            tc,dsi-lanes = <4>;
            tc,dual-link = <0>;

            vdd-supply = <&pm8916_l2>;
            vddio-supply = <&pm8916_l6>;

            stby-gpios = <&msmgpio 99 GPIO_ACTIVE_LOW>;
            reset-gpios = <&msmgpio 72 GPIO_ACTIVE_LOW>;

            ports {
                #address-cells = <1>;
                #size-cells = <0>;

                port@0 {
                    reg = <0>;
                    d2l_in: endpoint {
                        remote-endpoint = <&dsi0_out>;
                    };
                };

                port@1 {
                    reg = <1>;
                    d2l_out: endpoint {
                        remote-endpoint = <&panel_in>;
                    };
                };
            };
        };
    };

    panel: auo,b101xtn01 {
        status = "okay";
        compatible = "auo,b101xtn01", "panel-lvds";
        power-supply = <&pm8916_l14>;

        width-mm = <223>;
        height-mm = <125>;

        data-mapping = "jeida-24";

        panel-timing {
            /* 1366x768 @60Hz */
            clock-frequency = <72000000>;
            hactive = <1366>;
            vactive = <768>;
            hsync-len = <70>;
            hfront-porch = <20>;
            hback-porch = <0>;
            vsync-len = <42>;
            vfront-porch = <14>;
            vback-porch = <0>;
        };

        port {
            panel_in: endpoint {
                remote-endpoint = <&d2l_out>;
            };
        };
    };

    mdss {
        dsi@1a98000 {
            ports {
                port@1 {
                    dsi0_out: endpoint {
                        remote-endpoint = <&d2l_in>;
                        data-lanes = <0 1 2 3>;
                    };
                };
            };
        };
    };

...
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
