Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3D6F4B0F35
	for <lists+dri-devel@lfdr.de>; Thu, 10 Feb 2022 14:51:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C89D610E86F;
	Thu, 10 Feb 2022 13:51:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFCD410E86F
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Feb 2022 13:51:21 +0000 (UTC)
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88]
 helo=diego.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <heiko@sntech.de>)
 id 1nI9qu-0001Hw-96; Thu, 10 Feb 2022 14:51:16 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Johan Jonker <jbx6244@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>
Subject: Re: [PATCH v5 19/23] arm64: dts: rockchip: rk3568-evb: Enable VOP2
 and hdmi
Date: Thu, 10 Feb 2022 14:51:15 +0100
Message-ID: <2434650.DyAAmxEfAj@diego>
In-Reply-To: <20220210133759.GZ18637@pengutronix.de>
References: <20220209095350.2104049-1-s.hauer@pengutronix.de>
 <2fa2e53d-da1c-6957-33ed-f3e9806347cf@gmail.com>
 <20220210133759.GZ18637@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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
Cc: devicetree@vger.kernel.org,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Peter Geis <pgwipeout@gmail.com>, Sandy Huang <hjc@rock-chips.com>,
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 Michael Riesch <michael.riesch@wolfvision.net>, kernel@pengutronix.de,
 Andy Yan <andy.yan@rock-chips.com>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am Donnerstag, 10. Februar 2022, 14:37:59 CET schrieb Sascha Hauer:
> On Thu, Feb 10, 2022 at 02:15:17PM +0100, Johan Jonker wrote:
> > 
> > 
> > On 2/10/22 12:47, Sascha Hauer wrote:
> > > On Thu, Feb 10, 2022 at 01:10:32AM +0100, Johan Jonker wrote:
> > >> Hi Sascha,
> > >>
> > >> Something with port and endpoint gives notifications.
> > >> Somehow with the conversion of rockchip,dw-hdmi.txt to YAML not all SoC
> > >> options were checked/covered (see rk3328 and rk3568).
> > >>
> > >> Allow multiple vop:
> > >> port or
> > >> port@0
> > >> 1x vop -> endpoint
> > >>
> > >> 2x vop -> endpoint@0
> > >>        -> endpoint@1
> > >>
> > >> Also allow for connector:
> > >> (not all existing DT have this yet)
> > >> port@1
> > >>       -> endpoint
> > >>
> > >> See also at graph.yaml
> > > 
> > > Ok, let me see if I get this right. The HDMI can either have one or two
> > > ports. It has one when the HDMI connector is not described in the device
> > > tree and two when it is. Also the first (or only) port can have one or
> > > two endpoints. It has one endpoint when the SoC has a single VOP and two
> > > endpoints when the SoC has two VOPs.
> > > 
> > > It's been a painful morning because my YAML knowledge is fairly limited,
> > > but here's what I came up with:
> > > 
> > >   ports:
> > >     $ref: /schemas/graph.yaml#/properties/ports
> > >     unevaluatedProperties: false
> > >     patternProperties:
> > >       "^port(@0)?$":
> > >         $ref: /schemas/graph.yaml#/properties/port
> > >         description: Input of the DWC HDMI TX
> > >         properties:
> > >           endpoint:
> > >             description: Connection to the VOP
> > >           endpoint@0:
> > >             description: Connection to the VOPB
> > >           endpoint@1:
> > >             description: Connection to the VOPL
> > >     properties:
> > >       port@1:
> > >         $ref: /schemas/graph.yaml#/properties/port
> > >         description: Output of the DWC HDMI TX
> > > 
> > > Does this look sane to you? With this a make dtbs_check on this binding
> > > doesn't generate warnings anymore, and even better it does generate
> > > warnings when I add some wrong nodes/properties to the dts files.
> > 
> > Hi,
> > 
> > Send a patch to rob+dt and he will let you know... ;)
> 
> ;)
> 
> > 
> > Also could you test the ARM branch as well just for sure with:
> > ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- make  dtbs_check
> > DT_SCHEMA_FILES=Documentation/devicetree/bindings/display/rockchip/rockchip,dw-hdmi.yaml
> 
> That works fine except for iahb and isfr clocks in the wrong order in
> arch/arm/boot/dts/rk322x.dtsi.
> 
> > 
> > Could you group your serie a bit:
> > dt-bindings
> > drm patches
> > dts changes
> 
> That's the order I originally had. Heiko asked me to put the
> bindings, dts changes and driver patches together dor each topic.

with the background being that I can judge which parts are essentially
ready and possibly apply parts of a larger series without waiting
for everything to be ready.


