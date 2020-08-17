Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E01C2245A2F
	for <lists+dri-devel@lfdr.de>; Mon, 17 Aug 2020 02:04:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 462586E227;
	Mon, 17 Aug 2020 00:04:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 064D56E227
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Aug 2020 00:04:24 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7990AF9;
 Mon, 17 Aug 2020 02:04:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1597622662;
 bh=Osusw+izUNrAmOEtzq1RB1qpF6rnUbzPz1Lw1TxdgP4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=CL5AvQ5MvcT0iFtM5YiYFaU6cp5mQ0E1EJTV8BK7qo5iOV0lMYhqLJxBsxe/a52uD
 4feOIqe2/bEhkkootjhvJsS52eL9tCa9J/jeL1SMUG+px7lW7WWzSy70r/GDLhHj02
 NwmNWw1l+Kem06si58mXYjoeyb3SZJlaVMdoLLao=
Date: Mon, 17 Aug 2020 03:04:06 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH 2/8] dt-bindings: display: mxsfb: Add and fix compatible
 strings
Message-ID: <20200817000406.GC7729@pendragon.ideasonboard.com>
References: <20200813012910.13576-1-laurent.pinchart@ideasonboard.com>
 <20200813012910.13576-3-laurent.pinchart@ideasonboard.com>
 <20200816063933.GC1201814@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200816063933.GC1201814@ravnborg.org>
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

On Sun, Aug 16, 2020 at 08:39:33AM +0200, Sam Ravnborg wrote:
> On Thu, Aug 13, 2020 at 04:29:04AM +0300, Laurent Pinchart wrote:
> > Additional compatible strings have been added in DT source for the
> > i.MX6SL, i.MX6SLL, i.MX6UL and i.MX7D without updating the bindings.
> > Most of the upstream DT sources use the fsl,imx28-lcdif compatible
> > string, which mostly predates the realization that the LCDIF in the
> > i.MX6 and newer SoCs have extra features compared to the i.MX28.
> > 
> > Update the bindings to add the missing compatible strings, with the
> > correct fallback values. This fails to validate some of the upstream DT
> > sources. Instead of adding the incorrect compatible fallback to the
> > binding, the sources should be updated separately.
> > 
> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > ---
> >  .../devicetree/bindings/display/mxsfb.yaml     | 18 +++++++++++++-----
> >  1 file changed, 13 insertions(+), 5 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/display/mxsfb.yaml b/Documentation/devicetree/bindings/display/mxsfb.yaml
> > index 202381ec5bb7..ec6533b1d4a3 100644
> > --- a/Documentation/devicetree/bindings/display/mxsfb.yaml
> > +++ b/Documentation/devicetree/bindings/display/mxsfb.yaml
> > @@ -15,11 +15,19 @@ description: |
> >  
> >  properties:
> >    compatible:
> > -    enum:
> > -      - fsl,imx23-lcdif
> > -      - fsl,imx28-lcdif
> > -      - fsl,imx6sx-lcdif
> > -      - fsl,imx8mq-lcdif
> > +    oneOf:
> > +      - enum:
> > +          - fsl,imx23-lcdif
> > +          - fsl,imx28-lcdif
> > +          - fsl,imx6sx-lcdif
>
> Indent correct.
> 
> > +      - items:
> > +        - enum:
> > +          - fsl,imx6sl-lcdif
> > +          - fsl,imx6sll-lcdif
> > +          - fsl,imx6ul-lcdif
> > +          - fsl,imx7d-lcdif
> > +          - fsl,imx8mq-lcdif
>
> Indent shall be two more spaces like above.
> (This is at least my best uderstanding)

I think you're right. I wonder why dt_binding_check doesn't complain.
I'll fix it anyway.

> > +        - const: fsl,imx6sx-lcdif
> 
> With the above the following compatibles are supported:
> 
> 	"fsl,imx23-lcdif"
> 	"fsl,imx28-lcdif"
> 	"fsl,imx6sx-lcdif"
> 	"fsl,imx8mq-lcdif"
> 
> 	"fsl,imx6sl-lcdif", "fsl,imx6sx-lcdif"
> 	"fsl,imx6sll-lcdif", "fsl,imx6sx-lcdif"
> 	"fsl,imx6ul-lcdif", "fsl,imx6sx-lcdif"
> 	"fsl,imx7d-lcdif", "fsl,imx6sx-lcdif"
> 	"fsl,imx8mq-lcdif", "fsl,imx6sx-lcdif"
> 
> So the fallback value is the later "fsl,imx6sx-lcdif" which looks ok.
> 
> With indent fixed (or explained why I am wrong):
> Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
> 
> >  
> >    reg:
> >      maxItems: 1

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
