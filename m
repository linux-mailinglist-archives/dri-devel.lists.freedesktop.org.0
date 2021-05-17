Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B240386D7D
	for <lists+dri-devel@lfdr.de>; Tue, 18 May 2021 01:03:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87CE76E096;
	Mon, 17 May 2021 23:03:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E36676E096
 for <dri-devel@lists.freedesktop.org>; Mon, 17 May 2021 23:03:35 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id DB4383EE;
 Tue, 18 May 2021 01:03:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1621292614;
 bh=q4yY3n9hZ2VxETa7/eH4aDzwXNWvvrz8wQ7+sxGHyzI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PnFCxGoe//B5kCoVPr7Tu9YHf2ruUd+PILzIuvjYMiqOsfeEyUp2DWiA7mCLq99i/
 WGpbifIiZir4tDpsiiL68puJDlE1pQAEf3WMpkLaUA5NP0NUMCV8tuEEwOz4s0FkPa
 fc5XcqfggeyVRqxWWcw8um/5v/VkIm2UhbF97zE0=
Date: Tue, 18 May 2021 02:03:32 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH 1/2] dt-bindings: display: bridge: lvds-codec: Document
 LVDS data mapping select
Message-ID: <YKL2RGM1GRkceo/2@pendragon.ideasonboard.com>
References: <20210515204656.367442-1-marex@denx.de>
 <YKL1//4p/voXAR1q@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YKL1//4p/voXAR1q@pendragon.ideasonboard.com>
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
Cc: devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Sam Ravnborg <sam@ravnborg.org>, ch@denx.de, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

And another thing:

On Tue, May 18, 2021 at 02:02:24AM +0300, Laurent Pinchart wrote:
> On Sat, May 15, 2021 at 10:46:55PM +0200, Marek Vasut wrote:
> > Decoder input LVDS format is a property of the decoder chip or even
> > its strapping. Add DT property data-mapping the same way lvds-panel
> > does, to define the LVDS data mapping.
> 
> The information could also be derived by the driver from the compatible
> string in the case when this is an intrinsic property of the device (or
> when it's configurable by software), but the fact that it can also be
> controlled by strapping makes a DT property needed. We may want to limit
> the usage of the DT property to the strapping case though, but I don't
> have a real preference here, so I'm fine with this approach.
> 
> > Signed-off-by: Marek Vasut <marex@denx.de>
> > Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Cc: Rob Herring <robh+dt@kernel.org>
> > Cc: Sam Ravnborg <sam@ravnborg.org>
> > Cc: devicetree@vger.kernel.org
> > To: dri-devel@lists.freedesktop.org
> > ---
> >  .../bindings/display/bridge/lvds-codec.yaml   | 19 +++++++++++++++++++
> >  1 file changed, 19 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml b/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml
> > index f4dd16bd69d2..f0abb94f8f2e 100644
> > --- a/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml
> > +++ b/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml
> > @@ -64,6 +64,15 @@ properties:
> >        - port@0
> >        - port@1
> >  
> > +  data-mapping:
> > +    enum:
> > +      - jeida-18
> > +      - jeida-24
> > +      - vesa-24
> > +    description: |
> > +      The color signals mapping order. See details in
> > +      Documentation/devicetree/bindings/display/panel/lvds.yaml
> > +
> >    pclk-sample:
> >      description:
> >        Data sampling on rising or falling edge.
> > @@ -79,6 +88,16 @@ properties:
> >  
> >    power-supply: true
> >  
> > +if:
> > +  not:
> > +    properties:
> > +      compatible:
> > +        contains:
> > +          const: lvds-decoder
> > +then:
> > +  properties:
> > +    data-mapping: false

Should we make the property required for lvds-decoder ? We need to
support backward compatibility in the driver, but from a DT bindings
point of view, should all new DTs require the property ?

> > +
> >  if:
> >    not:
> >      properties:
> 
> Unless I'm mistaken, you can't have identically named properties at the
> same level (multiple 'if' at the root level). You can group them in a
> 'allOf' property.

-- 
Regards,

Laurent Pinchart
