Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B582312B408
	for <lists+dri-devel@lfdr.de>; Fri, 27 Dec 2019 11:39:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A91566E3FE;
	Fri, 27 Dec 2019 10:39:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 729EB6E0EB
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Dec 2019 09:19:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: eballetbo) with ESMTPSA id 03D5B283C07
Subject: Re: [PATCH v22 1/2] Documentation: bridge: Add documentation for
 ps8640 DT properties
To: Ezequiel Garcia <ezequiel@collabora.com>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>
References: <20191223143538.20327-1-enric.balletbo@collabora.com>
 <20191223143538.20327-2-enric.balletbo@collabora.com>
 <9fc5e30b8bc7e160ddc54a2056ca6e57eaebbab4.camel@collabora.com>
From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Message-ID: <9eee88d1-21d4-5571-038f-60bc7fa05d3f@collabora.com>
Date: Fri, 27 Dec 2019 10:19:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <9fc5e30b8bc7e160ddc54a2056ca6e57eaebbab4.camel@collabora.com>
Content-Language: en-US
X-Mailman-Approved-At: Fri, 27 Dec 2019 10:39:14 +0000
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
Cc: Mark Rutland <mark.rutland@arm.com>, drinkcat@chromium.org,
 Jitao Shi <jitao.shi@mediatek.com>, Ulrich Hecht <uli@fpond.eu>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org,
 hsinyi@chromium.org, matthias.bgg@gmail.com,
 Collabora Kernel ML <kernel@collabora.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Ezequiel,

On 26/12/19 15:27, Ezequiel Garcia wrote:
> Hi Enric, Rob,
> 
> On Mon, 2019-12-23 at 15:35 +0100, Enric Balletbo i Serra wrote:
>> From: Jitao Shi <jitao.shi@mediatek.com>
>>
>> Add documentation for DT properties supported by
>> ps8640 DSI-eDP converter.
>>
>> Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
>> Acked-by: Rob Herring <robh@kernel.org>
>> Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
>> Signed-off-by: Ulrich Hecht <uli@fpond.eu>
>> Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
> [..]
>> +
>> +  ports:
>> +    type: object
>> +    description:
>> +      A node containing DSI input & output port nodes with endpoint
>> +      definitions as documented in
>> +      Documentation/devicetree/bindings/media/video-interfaces.txt
>> +      Documentation/devicetree/bindings/graph.txt
>> +    properties:
>> +      port@0:
>> +        type: object
>> +        description: |
>> +          Video port for DSI input
>> +
>> +      port@1:
>> +        type: object
>> +        description: |
>> +          Video port for eDP output (panel or connector).
>> +
>> +    required:
>> +      - port@0
>> +
> 
> Is it correct to require port@0 ? This could be called port@1
> or port@2, and IIUC it should bind the same.
> 

My understanding is that at least the Video port for DSI input is required,
which makes sense, otherwise you have the chip connected nowhere. port@1 is
optional because it could be connected to a eDP panel or can just be a connector.

About your second question, I am not sure I understand you. You mean that have a
DT like this should work?

            ports {
                #address-cells = <1>;
                #size-cells = <0>;

                port@1 {
                    reg = <0>;
                    ps8640_in: endpoint {
                        remote-endpoint = <&dsi0_out>;
                    };
                };

                port@2 {
                    reg = <1>;
                    ps8640_out: endpoint {
                        remote-endpoint = <&panel_in>;
                   };
                };
            };


Probably yes, because the driver what really looks is the register value, but
that's odd and probably a bad practice. Also if I am not wrong the convention is
name the nodes with port@<reg property> (like we do in i2c devices for example)

port@0 is the label that has the register value to 0.
port@1 is the label that has the register value to 1.
...

Thanks,
 Enric

> Thanks,
> Ezequiel 
> 
>> +required:
>> +  - compatible
>> +  - reg
>> +  - powerdown-gpios
>> +  - reset-gpios
>> +  - vdd12-supply
>> +  - vdd33-supply
>> +  - ports
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/gpio/gpio.h>
>> +    i2c0 {
>> +        #address-cells = <1>;
>> +        #size-cells = <0>;
>> +
>> +        ps8640: edp-bridge@18 {
>> +            compatible = "parade,ps8640";
>> +            reg = <0x18>;
>> +            powerdown-gpios = <&pio 116 GPIO_ACTIVE_LOW>;
>> +            reset-gpios = <&pio 115 GPIO_ACTIVE_LOW>;
>> +            vdd12-supply = <&ps8640_fixed_1v2>;
>> +            vdd33-supply = <&mt6397_vgp2_reg>;
>> +
>> +            ports {
>> +                #address-cells = <1>;
>> +                #size-cells = <0>;
>> +
>> +                port@0 {
>> +                    reg = <0>;
>> +                    ps8640_in: endpoint {
>> +                        remote-endpoint = <&dsi0_out>;
>> +                    };
>> +                };
>> +
>> +                port@1 {
>> +                    reg = <1>;
>> +                    ps8640_out: endpoint {
>> +                        remote-endpoint = <&panel_in>;
>> +                   };
>> +                };
>> +            };
>> +        };
>> +    };
>> +
>> -- 
>> 2.20.1
>>
>>
> 
> 
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
