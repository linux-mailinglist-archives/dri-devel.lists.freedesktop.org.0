Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26FFB857BB7
	for <lists+dri-devel@lfdr.de>; Fri, 16 Feb 2024 12:31:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E7CC10E24B;
	Fri, 16 Feb 2024 11:31:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="asg5P2d3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com
 [209.85.215.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2678F10EB03
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Feb 2024 11:31:24 +0000 (UTC)
Received: by mail-pg1-f182.google.com with SMTP id
 41be03b00d2f7-5c6bd3100fcso447983a12.3
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Feb 2024 03:31:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1708083083; x=1708687883; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lyWfSKTdRSu/XPOYIRliEz8xFdTfpgDKmLuvOF0Pin8=;
 b=asg5P2d3yhTLr075pms2WJyl+s612YAUAjhHNfuk6kvHaxRU5IrOTwIS6Xmj+zhovd
 5+mza9c3+arduRcpM5rOHyZm29VJWG5Vu9dNt2YFsM5a42eprHj1FdhqDzfLnVJ/gM+K
 TmLB27brqqDqvOh1tSyom2oo18Au3SPM8v/umR26SHiUrX6hvuckeuCg2WvCJmGs5k1b
 uTT/EPyvq3zjaSWPOR9lPZB8t2kgsRhlr4qK1EgoaoIYhn7Z9Yt1+toaTGRctPg7pDbI
 h9piyiV865vJg6mYd+QjzHhzdzS+PxCR4s4cFiWP/dGGlQ3fLM2+1ZgNGDdIt3oxo3dl
 uXOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708083083; x=1708687883;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lyWfSKTdRSu/XPOYIRliEz8xFdTfpgDKmLuvOF0Pin8=;
 b=YPhfCzDTVBAr7JLUChtNVHnMBlMVMCKVeBlnlczXdFYEJieLCAGflfN1MhNdF5/DG0
 BmPwCNuPHZscXiLPoojHwl4IZCTYKcOnRIHkAsycJHCDDf3cJIjwPpakJv1ygv6mNhS6
 MPmIDPjkJhqMCxtKGC+Ydy56Sqok0mQjnsQpvYaia8B/KHDu3NtcAuclScfjVdwXSj7J
 AZ1fKrPcGr19/f9xh9lT2f6J0thhtDHQpP8lMHWfdqLVlUi1LoYdwYanlFnP1Ft04JRU
 UoSJGTHSTi+VpiHjmL/3w/rwRRXzCl/pQKjZg7rMRkLhCJ9bVo4QLiCh6hb3DDQGd2Dw
 0NQQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU/2Uhepzv056zGUlxA2RR2GFAGS9RxbLmev+tmsJlrIFKoV2DsFisnNhdAeEnO9Jw4HCbQ/W5q3EjVYjg6WbPft6raiUN8v48ZlPD1jGdA
X-Gm-Message-State: AOJu0YyvZPMLRq7uGrMQ5lSGIkePX4eSaWjRxRJSBkenEGzNpJIn6es4
 M5JdRTrtrAtHVM9AkHlUPCkBowHJV9ezxRD2Nws8glA2fbHQs9abcXldVz7gB3eg2nJ/H61IcU2
 VyVHbtrgcFBPgdB2+NhI8EcLt9SE=
X-Google-Smtp-Source: AGHT+IEvROAdajvDaGhJmYch+/Aub0Z04uX1ZnjW2ApKdi35HTbO5+Uw3JnvWpTAQ1JVmcbINMpElpvcdSPaIErNnAE=
X-Received: by 2002:a17:90a:d702:b0:299:273c:7331 with SMTP id
 y2-20020a17090ad70200b00299273c7331mr2771398pju.41.1708083083212; Fri, 16 Feb
 2024 03:31:23 -0800 (PST)
MIME-Version: 1.0
References: <20240203165307.7806-1-aford173@gmail.com>
 <20240203165307.7806-10-aford173@gmail.com>
 <5916132.MhkbZ0Pkbq@steina-w>
In-Reply-To: <5916132.MhkbZ0Pkbq@steina-w>
From: Adam Ford <aford173@gmail.com>
Date: Fri, 16 Feb 2024 05:31:12 -0600
Message-ID: <CAHCN7x+80iw0PWa4F4dMA=3RRaChNEO534LPACXd6FK0ndAHpw@mail.gmail.com>
Subject: Re: [PATCH V8 09/12] dt-bindings: display: imx: add binding for
 i.MX8MP HDMI TX
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, 
 marex@denx.de, frieder.schrempf@kontron.de, 
 Lucas Stach <l.stach@pengutronix.de>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, 
 NXP Linux Team <linux-imx@nxp.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Liu Ying <victor.liu@nxp.com>, 
 Ulf Hansson <ulf.hansson@linaro.org>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Fri, Feb 16, 2024 at 3:05=E2=80=AFAM Alexander Stein
<alexander.stein@ew.tq-group.com> wrote:
>
> Hi all,
>
> Am Samstag, 3. Februar 2024, 17:52:49 CET schrieb Adam Ford:
> > From: Lucas Stach <l.stach@pengutronix.de>
> >
> > The HDMI TX controller on the i.MX8MP SoC is a Synopsys designware IP
> > core with a little bit of SoC integration around it.
> >
> > Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> > Signed-off-by: Adam Ford <aford173@gmail.com>
> >
> > ---
> > V3:  Change name and location to better idenfity as a bridge and
> >      HDMI 2.0a transmitter
> >
> >      Fix typos and feedback from Rob and added ports.
> > ---
> >  .../display/bridge/fsl,imx8mp-hdmi-tx.yaml    | 102 ++++++++++++++++++
> >  1 file changed, 102 insertions(+)
> >  create mode 100644
> > Documentation/devicetree/bindings/display/bridge/fsl,imx8mp-hdmi-tx.yam=
l
> >
> > diff --git
> > a/Documentation/devicetree/bindings/display/bridge/fsl,imx8mp-hdmi-tx.y=
aml
> > b/Documentation/devicetree/bindings/display/bridge/fsl,imx8mp-hdmi-tx.y=
aml
> > new file mode 100644
> > index 000000000000..3791c9f4ebab
> > --- /dev/null
> > +++
> > b/Documentation/devicetree/bindings/display/bridge/fsl,imx8mp-hdmi-tx.y=
aml
> > @@ -0,0 +1,102 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/display/bridge/fsl,imx8mp-hdmi-tx.y=
aml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Freescale i.MX8MP DWC HDMI TX Encoder
> > +
> > +maintainers:
> > +  - Lucas Stach <l.stach@pengutronix.de>
> > +
> > +description:
> > +  The i.MX8MP HDMI transmitter is a Synopsys DesignWare
> > +  HDMI 2.0a TX controller IP.
> > +
> > +allOf:
> > +  - $ref: /schemas/display/bridge/synopsys,dw-hdmi.yaml#
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - fsl,imx8mp-hdmi-tx
> > +
> > +  reg-io-width:
> > +    const: 1
> > +
> > +  clocks:
> > +    maxItems: 4
> > +
> > +  clock-names:
> > +    items:
> > +      - const: iahb
> > +      - const: isfr
> > +      - const: cec
> > +      - const: pix
> > +
> > +  power-domains:
> > +    maxItems: 1
> > +
> > +  ports:
> > +    $ref: /schemas/graph.yaml#/properties/ports
> > +
> > +    properties:
> > +      port@0:
> > +        $ref: /schemas/graph.yaml#/properties/port
> > +        description: Parallel RGB input port
> > +
> > +      port@1:
> > +        $ref: /schemas/graph.yaml#/properties/port
> > +        description: HDMI output port
> > +
> > +    required:
> > +      - port@0
> > +      - port@1
>
> Is this really correct that port@1 is required? AFAICS this host already
> supports HPD and DDC by itself, so there is no need for a dedicated HDMI
> connector.
> With the current state of the drivers this output port is completely igno=
red
> anyway. Yet it works for a lot of people.

One of the feedback responses Lucas got was that it was missing the
reference to the HDMI connector, so I added it as a response to that
feedback.  I have tried device trees with and without it, and it
doesn't impact anything, but It seems like there may be a requirement
for it.

adam
>
> Best regards,
> Alexander
>
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - clocks
> > +  - clock-names
> > +  - interrupts
> > +  - power-domains
> > +  - ports
> > +
> > +unevaluatedProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/clock/imx8mp-clock.h>
> > +    #include <dt-bindings/interrupt-controller/irq.h>
> > +    #include <dt-bindings/power/imx8mp-power.h>
> > +
> > +    hdmi@32fd8000 {
> > +        compatible =3D "fsl,imx8mp-hdmi-tx";
> > +        reg =3D <0x32fd8000 0x7eff>;
> > +        interrupts =3D <0 IRQ_TYPE_LEVEL_HIGH>;
> > +        clocks =3D <&clk IMX8MP_CLK_HDMI_APB>,
> > +                 <&clk IMX8MP_CLK_HDMI_REF_266M>,
> > +                 <&clk IMX8MP_CLK_32K>,
> > +                 <&hdmi_tx_phy>;
> > +        clock-names =3D "iahb", "isfr", "cec", "pix";
> > +        power-domains =3D <&hdmi_blk_ctrl IMX8MP_HDMIBLK_PD_HDMI_TX>;
> > +        reg-io-width =3D <1>;
> > +        ports {
> > +           #address-cells =3D <1>;
> > +           #size-cells =3D <0>;
> > +           port@0 {
> > +             reg =3D <0>;
> > +
> > +             hdmi_tx_from_pvi: endpoint {
> > +               remote-endpoint =3D <&pvi_to_hdmi_tx>;
> > +             };
> > +          };
> > +
> > +          port@1 {
> > +            reg =3D <1>;
> > +              hdmi_tx_out: endpoint {
> > +                remote-endpoint =3D <&hdmi0_con>;
> > +              };
> > +          };
> > +        };
> > +    };
>
>
> --
> TQ-Systems GmbH | M=C3=BChlstra=C3=9Fe 2, Gut Delling | 82229 Seefeld, Ge=
rmany
> Amtsgericht M=C3=BCnchen, HRB 105018
> Gesch=C3=A4ftsf=C3=BChrer: Detlef Schneider, R=C3=BCdiger Stahl, Stefan S=
chneider
> http://www.tq-group.com/
>
>
