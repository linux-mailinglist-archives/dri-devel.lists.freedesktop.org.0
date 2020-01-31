Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4552814F13B
	for <lists+dri-devel@lfdr.de>; Fri, 31 Jan 2020 18:23:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B95376FBA8;
	Fri, 31 Jan 2020 17:23:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C32416FBA8;
 Fri, 31 Jan 2020 17:23:39 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id DA248295711;
 Fri, 31 Jan 2020 17:23:37 +0000 (GMT)
Date: Fri, 31 Jan 2020 18:23:34 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v10 09/12] dt-bindings: display: bridge: lvds-codec: Add
 new bus-width prop
Message-ID: <20200131182334.6b91f1b9@collabora.com>
In-Reply-To: <20200131171248.GB5464@ravnborg.org>
References: <20200128135514.108171-1-boris.brezillon@collabora.com>
 <20200128135514.108171-10-boris.brezillon@collabora.com>
 <20200131171248.GB5464@ravnborg.org>
Organization: Collabora
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
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
Cc: Nikita Yushchenko <nikita.yoush@cogentembedded.com>,
 Mark Rutland <mark.rutland@arm.com>, Jernej Skrabec <jernej.skrabec@siol.net>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 intel-gfx-trybot@lists.freedesktop.org, Jonas Karlman <jonas@kwiboo.se>,
 dri-devel@lists.freedesktop.org, Andrzej Hajda <a.hajda@samsung.com>,
 devicetree@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Rob Herring <robh+dt@kernel.org>, kernel@collabora.com,
 Chris Healy <cphealy@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 31 Jan 2020 18:12:48 +0100
Sam Ravnborg <sam@ravnborg.org> wrote:

> Hi Boris.
> 
> On Tue, Jan 28, 2020 at 02:55:11PM +0100, Boris Brezillon wrote:
> > Add the bus-width property to describe the input bus format.
> > 
> > v10:
> > * Add changelog to the commit message
> > * Add Rob's R-b
> > 
> > v8 -> v9:
> > * No changes
> > 
> > v7:
> > * Rebase on top of lvds-codec changes
> > * Drop the data-mapping property
> > 
> > v4 -> v6:
> > * Not part of the series
> > 
> > v3:
> > * New patch
> > 
> > Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> > Reviewed-by: Rob Herring <robh@kernel.org>
> > ---
> >  .../devicetree/bindings/display/bridge/lvds-codec.yaml    | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml b/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml
> > index 8f373029f5d2..7c4e42f4de61 100644
> > --- a/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml
> > +++ b/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml
> > @@ -55,6 +55,14 @@ properties:
> >          description: |
> >            For LVDS encoders, port 0 is the parallel input
> >            For LVDS decoders, port 0 is the LVDS input
> > +        properties:
> > +          bus-width:
> > +            allOf:
> > +              - $ref: /schemas/types.yaml#/definitions/uint32
> > +              - enum: [18, 24]
> > +              - default: 24
> > +          description:
> > +            Number of data lines used to transmit the RGB data.  
> 
> Would this be a candidate for a bridge-common.yaml?
> So we share the same definition across all bridges using it.

Could be, though the default and accepted values is likely to be
overloaded on a per-bridge basis. Anyway, looks like bridge-common.yaml
doesn't exists yet, so maybe we should merge this change and move the
field definition when another bridge starts using this property.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
