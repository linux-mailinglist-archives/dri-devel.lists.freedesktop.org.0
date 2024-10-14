Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A36199C0BD
	for <lists+dri-devel@lfdr.de>; Mon, 14 Oct 2024 09:07:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9704910E38E;
	Mon, 14 Oct 2024 07:07:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="C3ppzk1m";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com
 [209.85.208.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D035910E38E
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2024 07:07:43 +0000 (UTC)
Received: by mail-lj1-f172.google.com with SMTP id
 38308e7fff4ca-2fb498a92f6so8458511fa.1
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2024 00:07:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1728889662; x=1729494462; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=6ARxFYsp7/+mIT7I9xZ45qotb71sWnmMERryPlBI39w=;
 b=C3ppzk1mgorzZGqidq8XE60YE86dAI/X7a6ZnaUbGNPhu5u7zp5VZVmCUOnAPKKnYp
 NJYTS+ivQBkjUmB1Yw/zWphKR/ICAQ0TTMnLsGYjbqPCFRKfgDg3VPU9gie7xG9W16c5
 OauaSzcaYjo07LuSGlVvbBfUTHcerXBjAAPNM++GNq+VnbcUQE1XCh8Jot+1B7jglQti
 9EP9j3wu+FtcllykLgPGW09R5Nkmpas4Ucjlnn7g/GJKYL/m0aBDxrS0Qt6tEEJ/PLl3
 AonP6o605Nredk18CmvQaejwpiRxv8/OW54+qMV9L/YLUlvaeKBcvm5ZH1vKaeRtUznq
 uH1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728889662; x=1729494462;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6ARxFYsp7/+mIT7I9xZ45qotb71sWnmMERryPlBI39w=;
 b=tVcQfSe4w2yjdjNaoK1ypGM4OtYB8p45ViTWdNmrXamj2hydXQAAc6d/F+E0K69884
 PAtcS9UMXUcsAOC84Xk7soZoNbu4x1jb5Snqt8/E4DMCcxyoWNi8oZF8l96tDt4RjSJP
 iQQMGPJg1/WUo2b0s4dXTJJRU3GgM1jfhACUWmITpg4ST+Hj7FLYSt1hgyxaU0W9CLMH
 kiQttaf9RHXKglMxZtq47o6d4NNAOy1KVGVG6sqDCzvInPx3qkd08ayUtzeePiV76tS/
 3uUwBSeNR7Lhr1txfOj/mAb/vGG3MifISqgTLeXYbvex90BsqkcTL86t9xonhxOBwl7Z
 avAA==
X-Gm-Message-State: AOJu0Yzr9nco3ygImwhtkNft6dt5AX6etK8DodlOaVI+ExKOeLUr3S/A
 JoYjnYVkq0IuI7DGToZK9eqMMOqkjVHr1XYDPBlTdO+B/1XHajIHWnMDHVyBub4=
X-Google-Smtp-Source: AGHT+IHg5VdHWDTDKmBccxvYSyWf447rZLJNrbiqpaN2aAdz+0hfweYHkTDkw1x/+cGFA4dpsrO50A==
X-Received: by 2002:a05:6512:3046:b0:539:8d9b:b61e with SMTP id
 2adb3069b0e04-539da552da0mr4604290e87.44.1728889661678; 
 Mon, 14 Oct 2024 00:07:41 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-539e32f8825sm1007521e87.121.2024.10.14.00.07.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Oct 2024 00:07:41 -0700 (PDT)
Date: Mon, 14 Oct 2024 10:07:38 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Liu Ying <victor.liu@nxp.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, 
 andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org, 
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, jernej.skrabec@gmail.com,
 airlied@gmail.com, 
 simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
 tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
 festevam@gmail.com, catalin.marinas@arm.com, will@kernel.org, 
 quic_bjorande@quicinc.com, geert+renesas@glider.be, arnd@arndb.de,
 nfraprado@collabora.com, 
 o.rempel@pengutronix.de, y.moog@phytec.de, marex@denx.de,
 isaac.scott@ideasonboard.com, biju.das.jz@bp.renesas.com
Subject: Re: [PATCH v2 5/9] dt-bindings: display: bridge: Add ITE IT6263 LVDS
 to HDMI converter
Message-ID: <lcogrc6uztckwwwsuag5tlk5otidmo7rudsl7zshe3wpfot3wc@ziljns5phhfe>
References: <20241012073543.1388069-1-victor.liu@nxp.com>
 <20241012073543.1388069-6-victor.liu@nxp.com>
 <4a7rwguypyaspgr5akpxgw4c45gph4h3lx6nkjv3znn32cldrk@k7qskts7ws73>
 <07b47f70-5dab-4813-97fa-388a0c0f42e9@nxp.com>
 <dvcdy32dig3w3r3a7eib576zaumsoxw4xb5iw6u6b2rds3zaov@lvdevbyl6skf>
 <90e0c4ac-1636-4936-ba40-2f7693bc6b32@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <90e0c4ac-1636-4936-ba40-2f7693bc6b32@nxp.com>
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

On Mon, Oct 14, 2024 at 01:33:44PM +0800, Liu Ying wrote:
> On 10/14/2024, Dmitry Baryshkov wrote:
> > On Sat, Oct 12, 2024 at 05:14:13PM +0800, Liu Ying wrote:
> >> On 10/12/2024, Dmitry Baryshkov wrote:
> >>> On Sat, Oct 12, 2024 at 03:35:39PM +0800, Liu Ying wrote:
> >>>> Document ITE IT6263 LVDS to HDMI converter.
> >>>>
> >>>> Product link:
> >>>> https://www.ite.com.tw/en/product/cate1/IT6263
> >>>>
> >>>> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> >>>> ---
> >>>> v2:
> >>>> * Document number of LVDS link data lanes.  (Biju)
> >>>> * Simplify ports property by dropping "oneOf".  (Rob)
> >>>>
> >>>>  .../bindings/display/bridge/ite,it6263.yaml   | 276 ++++++++++++++++++
> >>>>  1 file changed, 276 insertions(+)
> >>>>  create mode 100644 Documentation/devicetree/bindings/display/bridge/ite,it6263.yaml
> >>>>
> >>>> diff --git a/Documentation/devicetree/bindings/display/bridge/ite,it6263.yaml b/Documentation/devicetree/bindings/display/bridge/ite,it6263.yaml
> >>>> new file mode 100644
> >>>> index 000000000000..bc2bbec07623
> >>>> --- /dev/null
> >>>> +++ b/Documentation/devicetree/bindings/display/bridge/ite,it6263.yaml
> >>>> @@ -0,0 +1,276 @@
> >>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> >>>> +%YAML 1.2
> >>>> +---
> >>>> +$id: http://devicetree.org/schemas/display/bridge/ite,it6263.yaml#
> >>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> >>>> +
> >>>> +title: ITE IT6263 LVDS to HDMI converter
> >>>> +
> >>>> +maintainers:
> >>>> +  - Liu Ying <victor.liu@nxp.com>
> >>>> +
> >>>> +description: |
> >>>> +  The IT6263 is a high-performance single-chip De-SSC(De-Spread Spectrum) LVDS
> >>>> +  to HDMI converter.  Combined with LVDS receiver and HDMI 1.4a transmitter,
> >>>> +  the IT6263 supports LVDS input and HDMI 1.4 output by conversion function.
> >>>> +  The built-in LVDS receiver can support single-link and dual-link LVDS inputs,
> >>>> +  and the built-in HDMI transmitter is fully compliant with HDMI 1.4a/3D, HDCP
> >>>> +  1.2 and backward compatible with DVI 1.0 specification.
> >>>> +
> >>>> +  The IT6263 also encodes and transmits up to 8 channels of I2S digital audio,
> >>>> +  with sampling rate up to 192KHz and sample size up to 24 bits. In addition,
> >>>> +  an S/PDIF input port takes in compressed audio of up to 192KHz frame rate.
> >>>> +
> >>>> +  The newly supported High-Bit Rate(HBR) audio by HDMI specifications v1.3 is
> >>>> +  provided by the IT6263 in two interfaces: the four I2S input ports or the
> >>>> +  S/PDIF input port.  With both interfaces the highest possible HBR frame rate
> >>>> +  is supported at up to 768KHz.
> >>>> +
> >>>> +properties:
> >>>
> >>> No LVDS data-mapping support?
> >>
> >> It is enough to document number of LVDS link data lanes
> >> because OS should be able to determine the data-mapping
> >> by looking at the number and the data-mapping capability
> >> of the other side of the LVDS link. 
> > 
> > From what I can see, data-mapping is specified on the consumer sink side
> > of the LVDS link. This means it should go to the bridge's device node.
> 
> Then, I won't define data-lanes, because data-mapping implies it,
> e.g., jeida-24 implies data lanes 0/1/2/3, see lvds-data-mapping.yaml.
> 
> Please let me know which one you prefer.

I'd prefer data-mapping.

> 
> > 
> >>
> >>>
> >>>> +  compatible:
> >>>> +    const: ite,it6263
> >>>> +
> >>>> +  reg:
> >>>> +    maxItems: 1
> >>>> +
> >>>> +  clocks:
> >>>> +    maxItems: 1
> >>>> +    description: audio master clock
> >>>> +
> >>>> +  clock-names:
> >>>> +    const: mclk
> >>>> +
> >>>> +  reset-gpios:
> >>>> +    maxItems: 1
> >>>> +
> >>>> +  ivdd-supply:
> >>>> +    description: 1.8V digital logic power
> >>>> +
> >>>> +  ovdd-supply:
> >>>> +    description: 3.3V I/O pin power
> >>>> +
> >>>> +  txavcc18-supply:
> >>>> +    description: 1.8V HDMI analog frontend power
> >>>> +
> >>>> +  txavcc33-supply:
> >>>> +    description: 3.3V HDMI analog frontend power
> >>>> +
> >>>> +  pvcc1-supply:
> >>>> +    description: 1.8V HDMI frontend core PLL power
> >>>> +
> >>>> +  pvcc2-supply:
> >>>> +    description: 1.8V HDMI frontend filter PLL power
> >>>> +
> >>>> +  avcc-supply:
> >>>> +    description: 3.3V LVDS frontend power
> >>>> +
> >>>> +  anvdd-supply:
> >>>> +    description: 1.8V LVDS frontend analog power
> >>>> +
> >>>> +  apvdd-supply:
> >>>> +    description: 1.8V LVDS frontend PLL power
> >>>> +
> >>>> +  "#sound-dai-cells":
> >>>> +    const: 0
> >>>> +
> >>>> +  ite,lvds-link-num-data-lanes:
> >>>> +    $ref: /schemas/types.yaml#/definitions/uint8
> >>>> +    enum: [3, 4, 5]
> >>>> +    description: number of data lanes per LVDS link
> >>>
> >>> Please use data-lanes property inside the OF graph.
> >>
> >> In both port@0 and port@1?
> > 
> > Yes
> 
> I'm assuming if data-mapping is defined, then no need to
> define data-lanes.

Yes

> 
> > 
> >>
> >>>
> >>>> +
> >>>> +  ite,i2s-audio-fifo-sources:
> >>>> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> >>>> +    minItems: 1
> >>>> +    maxItems: 4
> >>>> +    items:
> >>>> +      enum: [0, 1, 2, 3]
> >>>> +    description:
> >>>> +      Each array element indicates the pin number of an I2S serial data input
> >>>> +      line which is connected to an audio FIFO, from audio FIFO0 to FIFO3.
> >>>
> >>> What does that mean from the board point of view? Routed audio links for
> >>> the multichannel audio?
> >>
> >> Yes, also for single channel audio.
> >>
> >>>
> >>>> +
> >>>> +  ite,rl-channel-swap-audio-sources:
> >>>> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> >>>> +    minItems: 1
> >>>> +    maxItems: 4
> >>>> +    uniqueItems: true
> >>>> +    items:
> >>>> +      enum: [0, 1, 2, 3]
> >>>> +    description:
> >>>> +      Each array element indicates an audio source whose right channel and left
> >>>> +      channel are swapped by this converter. For I2S, the element is the pin
> >>>> +      number of an I2S serial data input line. For S/PDIF, the element is always
> >>>> +      0.
> >>>
> >>> Why?
> >>
> >> Because this converter has the capability to swap right channel
> >> and left channel and S/PDIF always uses audio source0. 
> >>
> >>>
> >>>> +
> >>>> +  ports:
> >>>> +    $ref: /schemas/graph.yaml#/properties/ports
> >>>> +
> >>>> +    properties:
> >>>> +      port@0:
> >>>> +        $ref: /schemas/graph.yaml#/$defs/port-base
> >>>> +        unevaluatedProperties: false
> >>>> +        description:
> >>>> +          The first LVDS input link.
> >>>> +          In dual-link LVDS mode, this link works together with the second LVDS
> >>>> +          input link, and one link receives odd pixels while the other receives
> >>>> +          even pixels. Specify the pixels with one of the dual-lvds-odd-pixels
> >>>> +          and dual-lvds-even-pixels properties when and only when dual-link LVDS
> >>>> +          mode is used.
> >>>> +
> >>>> +        properties:
> >>>> +          dual-lvds-odd-pixels:
> >>>> +            type: boolean
> >>>> +            description: the first sink port for odd pixels
> >>>> +
> >>>> +          dual-lvds-even-pixels:
> >>>> +            type: boolean
> >>>> +            description: the first sink port for even pixels
> >>>> +
> >>>> +      port@1:
> >>>> +        $ref: /schemas/graph.yaml#/$defs/port-base
> >>>> +        unevaluatedProperties: false
> >>>> +        description: the second LVDS input link
> >>>> +
> >>>> +        properties:
> >>>> +          dual-lvds-even-pixels:
> >>>> +            type: boolean
> >>>> +            description: the second sink port for even pixels
> >>>> +
> >>>> +          dual-lvds-odd-pixels:
> >>>> +            type: boolean
> >>>> +            description: the second sink port for odd pixels
> >>>> +
> >>>> +        oneOf:
> >>>> +          - required: [dual-lvds-even-pixels]
> >>>> +          - required: [dual-lvds-odd-pixels]
> >>>
> >>> This still allows one to specify that both ports provide odd pixels. Is
> >>> that expected? Also why do you need two properties which specify the
> >>> same option.
> >>
> >> No, that is not expected. Description for port@0 already mentions
> >> one link receives odd pixels while the other receives even pixels.
> > 
> > That's not expected, but permitted by the bindings.
> 
> It is not permitted by port@1. If "dual-lvds-odd-pixels;" is added
> to port@1 in the dual-link LVDS example, the below warning will be
> generated by dt_binding_check.

It is permitted for both ports to have the same value (e.g. mark both
ports as odd or even).

> 
> Documentation/devicetree/bindings/display/bridge/ite,it6263.example.dtb: hdmi@4c: ports:port@1: {'reg': [[1]], 'dual-lvds-even-pixels': True, 'dual-lvds-odd-pixels': True, 'endpoint': {'remote-endpoint': [[4294967295]]}} is valid under each of {'required': ['dual-lvds-odd-pixels']}, {'required': ['dual-lvds-even-pixels']}
> 	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6263.yaml#
> 
> However, the binding for port@0 does allow DT writers to specify
> both even and odd pixels. I raised similar concerns in v1 discussion.
> According to Rob's comment in #devicetree IRC, the ports property
> is simplified to this form and more description for port@0 is added
> to tell when to specify the even/odd pixels.  If you know any better
> way to indicate the constraints, please shout.

I don't think we can express that in schema. I don't like the bindings
(and would have preferred a single property instead), but as the
bindings are already defined, let's use them.

> 
> > 
> >>
> >> Two options are supported for dual-link LVDS, not the same option:
> >> 1) LVDS link1(port@0) gets odd pixels
> >>    and
> >>    LVDS link2(port@1) gets even pixels.
> >>
> >> 2) LVDS link1(port@0) gets even pixels
> >>    and
> >>    LVDS link2(port@1) gets odd pixels.
> >> That's the reason why each port needs two properties to define
> >> odd/even pixels.
> >>
> >>>
> >>> My suggestion would be to add a single root-level property which
> >>> specifies which port provides even pixel data.
> >>
> >> That won't work.  The LVDS source side expects the ports of
> >> the sink side specify dual-lvds-{odd,even}-pixels properties.
> > 
> > I didn't notice that these properties are already defined.
> > 
> > As these properties are common between several schema files, please
> > extract them to a common schema file (like lvds.yaml).
> 
> I'm not sure how to do that. Is it obvious?
> Please shed some light. 
> 
> Only two panel schema files are defining even/odd pixels now -
> advantech,idk-2121wr.yaml and panel-simple-lvds-dual-ports.yaml.
> Maybe, extract them later when more schema files(especially for
> bridges) try to define the same?  I'd like to keep a low profile
> for now.

I'd say, please extract those now. Adding third is more than enough and
should be avoided. Extracting is pretty simple. One patch to move the
definition and descriptions from panel-simple-lvds-dual-ports to a
common location (e.g. lvds-dual-ports.yaml). Leave the required
constrains in place. Second patch is to add oneOf constraints to the
ports. port@0 might get the same oneOf + the
dual-lvds-{odd,even}-pixels:false case, allowing a single-port
definition.

> 
> > 
> >>
> >>>
> >>>> +
> >>>> +      port@2:
> >>>> +        $ref: /schemas/graph.yaml#/properties/port
> >>>> +        description: video port for the HDMI output
> >>>> +
> >>>> +      port@3:
> >>>> +        $ref: /schemas/graph.yaml#/properties/port
> >>>> +        description: sound input port
> >>>> +
> >>>> +    required:
> >>>> +      - port@0
> >>>> +      - port@2
> >>>> +
> >>>> +required:
> >>>> +  - compatible
> >>>> +  - reg
> >>>> +  - ivdd-supply
> >>>> +  - ovdd-supply
> >>>> +  - txavcc18-supply
> >>>> +  - txavcc33-supply
> >>>> +  - pvcc1-supply
> >>>> +  - pvcc2-supply
> >>>> +  - avcc-supply
> >>>> +  - anvdd-supply
> >>>> +  - apvdd-supply
> >>>> +  - ite,lvds-link-num-data-lanes
> >>>> +  - ports
> >>>> +
> >>>> +additionalProperties: false
> >>>> +
> >>>> +examples:
> >>>> +  - |
> >>>> +    /* single-link LVDS input */
> >>>> +    #include <dt-bindings/gpio/gpio.h>
> >>>> +
> >>>> +    i2c {
> >>>> +        #address-cells = <1>;
> >>>> +        #size-cells = <0>;
> >>>> +
> >>>> +        hdmi@4c {
> >>>> +            compatible = "ite,it6263";
> >>>> +            reg = <0x4c>;
> >>>> +            reset-gpios = <&gpio1 10 GPIO_ACTIVE_LOW>;
> >>>> +            ivdd-supply = <&reg_buck5>;
> >>>> +            ovdd-supply = <&reg_vext_3v3>;
> >>>> +            txavcc18-supply = <&reg_buck5>;
> >>>> +            txavcc33-supply = <&reg_vext_3v3>;
> >>>> +            pvcc1-supply = <&reg_buck5>;
> >>>> +            pvcc2-supply = <&reg_buck5>;
> >>>> +            avcc-supply = <&reg_vext_3v3>;
> >>>> +            anvdd-supply = <&reg_buck5>;
> >>>> +            apvdd-supply = <&reg_buck5>;
> >>>> +            ite,lvds-link-num-data-lanes = /bits/ 8 <4>;
> >>>> +
> >>>> +            ports {
> >>>> +                #address-cells = <1>;
> >>>> +                #size-cells = <0>;
> >>>> +
> >>>> +                port@0 {
> >>>> +                    reg = <0>;
> >>>> +
> >>>> +                    it6263_lvds_link1: endpoint {
> >>>> +                        remote-endpoint = <&ldb_lvds_ch0>;
> >>>> +                    };
> >>>> +                };
> >>>> +
> >>>> +                port@2 {
> >>>> +                    reg = <2>;
> >>>> +
> >>>> +                    it6263_out: endpoint {
> >>>> +                        remote-endpoint = <&hdmi_in>;
> >>>> +                    };
> >>>> +                };
> >>>> +            };
> >>>> +        };
> >>>> +    };
> >>>> +
> >>>> +  - |
> >>>> +    /* dual-link LVDS input */
> >>>> +    #include <dt-bindings/gpio/gpio.h>
> >>>> +
> >>>> +    i2c {
> >>>> +        #address-cells = <1>;
> >>>> +        #size-cells = <0>;
> >>>> +
> >>>> +        hdmi@4c {
> >>>> +            compatible = "ite,it6263";
> >>>> +            reg = <0x4c>;
> >>>> +            reset-gpios = <&gpio1 10 GPIO_ACTIVE_LOW>;
> >>>> +            ivdd-supply = <&reg_buck5>;
> >>>> +            ovdd-supply = <&reg_vext_3v3>;
> >>>> +            txavcc18-supply = <&reg_buck5>;
> >>>> +            txavcc33-supply = <&reg_vext_3v3>;
> >>>> +            pvcc1-supply = <&reg_buck5>;
> >>>> +            pvcc2-supply = <&reg_buck5>;
> >>>> +            avcc-supply = <&reg_vext_3v3>;
> >>>> +            anvdd-supply = <&reg_buck5>;
> >>>> +            apvdd-supply = <&reg_buck5>;
> >>>> +            ite,lvds-link-num-data-lanes = /bits/ 8 <4>;
> >>>> +
> >>>> +            ports {
> >>>> +                #address-cells = <1>;
> >>>> +                #size-cells = <0>;
> >>>> +
> >>>> +                port@0 {
> >>>> +                    reg = <0>;
> >>>> +                    dual-lvds-odd-pixels;
> >>>> +
> >>>> +                    it6263_lvds_link1_dual: endpoint {
> >>>> +                        remote-endpoint = <&ldb_lvds_ch0>;
> >>>> +                    };
> >>>> +                };
> >>>> +
> >>>> +                port@1 {
> >>>> +                    reg = <1>;
> >>>> +                    dual-lvds-even-pixels;
> >>>> +
> >>>> +                    it6263_lvds_link2_dual: endpoint {
> >>>> +                        remote-endpoint = <&ldb_lvds_ch1>;
> >>>> +                    };
> >>>> +                };
> >>>> +
> >>>> +                port@2 {
> >>>> +                    reg = <2>;
> >>>> +
> >>>> +                    it6263_out_dual: endpoint {
> >>>> +                        remote-endpoint = <&hdmi_in>;
> >>>> +                    };
> >>>> +                };
> >>>> +            };
> >>>> +        };
> >>>> +    };
> >>>> -- 
> >>>> 2.34.1
> >>>>
> >>>
> >>
> >> -- 
> >> Regards,
> >> Liu Ying
> >>
> > 
> 
> -- 
> Regards,
> Liu Ying
> 

-- 
With best wishes
Dmitry
