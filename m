Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59406245A39
	for <lists+dri-devel@lfdr.de>; Mon, 17 Aug 2020 02:18:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DC0C89E39;
	Mon, 17 Aug 2020 00:18:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07D3089E39
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Aug 2020 00:18:05 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id F3DBAF9;
 Mon, 17 Aug 2020 02:18:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1597623483;
 bh=z7ZkF/UGtlwF2klPzyzYz70nGJVgRLeH6o8XLIQWnfI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=U6kWgKL0BYS8XZCeRN8LJrzSETrcoazHGMLyZescS0XCpJzK11npnJXNqyx91LlhJ
 zEeQ0X1p1FBLJDzN5154elRs9rJOHOJfbmltsC4RBDM819uaYj31k1aCLJZxgzpCYe
 CDCGQicUxFKKQG3AVnVC0r9b2BM6Oqpxpnb1VHu8=
Date: Mon, 17 Aug 2020 03:17:47 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH 3/8] dt-bindings: display: mxsfb: Add a bus-width
 endpoint property
Message-ID: <20200817001747.GE7729@pendragon.ideasonboard.com>
References: <20200813012910.13576-1-laurent.pinchart@ideasonboard.com>
 <20200813012910.13576-4-laurent.pinchart@ideasonboard.com>
 <20200816072520.GD1201814@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200816072520.GD1201814@ravnborg.org>
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
Cc: Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org,
 Guido =?utf-8?Q?G=C3=BCnther?= <agx@sigxcpu.org>,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sam,

On Sun, Aug 16, 2020 at 09:25:20AM +0200, Sam Ravnborg wrote:
> On Thu, Aug 13, 2020 at 04:29:05AM +0300, Laurent Pinchart wrote:
> > When the PCB routes the display data signals in an unconventional way,
> > the output bus width may differ from the bus width of the connected
> > panel or encoder. For instance, when a 18-bit RGB panel has its R[5:0],
> > G[5:0] and B[5:0] signals connected to LCD_DATA[7:2], LCD_DATA[15:10]
> > and LCD_DATA[23:18], the output bus width is 24 instead of 18 when the
> > signals are routed to LCD_DATA[5:0], LCD_DATA[11:6] and LCD_DATA[17:12].
> > 
> > Add a bus-width property to describe this data routing.
> > 
> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> Some general comments.
> We have the bus format - for example MEDIA_BUS_FMT_RGB666_1X18.
> I was under the impression that the bus format defined the wiring used,
> so for example the bus format would tell if on used 18 bits as above.
> So with the bus format available the bus-width is not needed.
> 
> Today this detail is not expressed in DT but comes based on the
> compatible for the panel - so what this patch does is to add the bus
> format information to DT.
> 
> But then to do so would we not need to have something so we can specify
> all relevant MEDIA_BUS_FMT's? bus-width will not cut it.

Different formats can be transported with a given wiring (for instance
when the full 24-bit RGB bus is wired, the display controller can ouput
24-bit RGB, or 18-bit RGB on the MSB with dithering enabled), and
different wirings can transport the same format
(MEDIA_BUS_FMT_RGB666_1X18 can be transported with a 24 bits wiring, or
a 18 bits wiring as described in the commit message). While we may in
this case be able to express the information through bus formats
(specifying MEDIA_BUS_FMT_RGB666_1X18 would imply that only 18 bits are
wired), I think it's conceptually speaking the wrong information to
provide, and would be confusing in some cases.

> Also the bus-width property (and data-shift property you accidentally
> reference) are both described in media/video-interfaces.txt.
> If we need bus-witdh - is it possible to re-use video-interfaces?
> It may need a conversion to yaml to get full validation, but a lot
> of .yaml files refer to the text file today so conversion can come later.

How do you mean reuse ? I can reference the file in the description, but
as video-interfaces.txt documents the property just as "number of data
lines actively used, valid for the parallel busses", I would need a
description here anyway, to explain how it applies to this device in
particular, even after video-interfaces.txt gets converted to YAML.

> > ---
> >  Documentation/devicetree/bindings/display/mxsfb.yaml | 12 ++++++++++++
> >  1 file changed, 12 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/display/mxsfb.yaml b/Documentation/devicetree/bindings/display/mxsfb.yaml
> > index ec6533b1d4a3..d15bb8edc29f 100644
> > --- a/Documentation/devicetree/bindings/display/mxsfb.yaml
> > +++ b/Documentation/devicetree/bindings/display/mxsfb.yaml
> > @@ -58,6 +58,18 @@ properties:
> >          type: object
> >  
> >          properties:
> > +          data-shift:
> > +            enum: [16, 18, 24]
> > +            description: |
> > +              The output bus width. This value overrides the configuration
> > +              derived from the connected device (encoder or panel). It should
> > +              only be specified when PCB routing of the data signals require a
> > +              different bus width on the LCDIF and the connected device. For
> > +              instance, when a 18-bit RGB panel has its R[5:0], G[5:0] and
> > +              B[5:0] signals connected to LCD_DATA[7:2], LCD_DATA[15:10] and
> > +              LCD_DATA[23:18] instead of LCD_DATA[5:0], LCD_DATA[11:6] and
> > +              LCD_DATA[17:12], bus-width should be set to 24.
> > +
> >            remote-endpoint:
> >              $ref: /schemas/types.yaml#/definitions/phandle
> >  

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
