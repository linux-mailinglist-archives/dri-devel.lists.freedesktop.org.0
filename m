Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DF2186D1CAB
	for <lists+dri-devel@lfdr.de>; Fri, 31 Mar 2023 11:40:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E3B110F191;
	Fri, 31 Mar 2023 09:40:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail11.truemail.it (mail11.truemail.it [IPv6:2001:4b7e:0:8::81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B2F310F191
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Mar 2023 09:40:05 +0000 (UTC)
Received: from francesco-nb.int.toradex.com (93-49-2-63.ip317.fastwebnet.it
 [93.49.2.63])
 by mail11.truemail.it (Postfix) with ESMTPA id C99BA207CC;
 Fri, 31 Mar 2023 11:40:02 +0200 (CEST)
Date: Fri, 31 Mar 2023 11:40:01 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v1 3/6] dt-bindings: display: bridge: toshiba,tc358768:
 add parallel input mode
Message-ID: <ZCaqcaq02VDsqCPJ@francesco-nb.int.toradex.com>
References: <20230330095941.428122-1-francesco@dolcini.it>
 <20230330095941.428122-4-francesco@dolcini.it>
 <a924186c-31d3-b7f0-085f-97b849a4d751@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a924186c-31d3-b7f0-085f-97b849a4d751@linaro.org>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Francesco Dolcini <francesco@dolcini.it>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jonas Karlman <jonas@kwiboo.se>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Peter Ujfalusi <peter.ujfalusi@ti.com>, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Francesco Dolcini <francesco.dolcini@toradex.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Mar 31, 2023 at 10:48:15AM +0200, Krzysztof Kozlowski wrote:
> On 30/03/2023 11:59, Francesco Dolcini wrote:
> > From: Francesco Dolcini <francesco.dolcini@toradex.com>
> > 
> > Add new toshiba,input-rgb-mode property to describe the actual signal
> > connection on the parallel RGB input interface.
> > 
> > Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
> > ---
> >  .../bindings/display/bridge/toshiba,tc358768.yaml | 15 +++++++++++++++
> >  1 file changed, 15 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/display/bridge/toshiba,tc358768.yaml b/Documentation/devicetree/bindings/display/bridge/toshiba,tc358768.yaml
> > index 8f22093b61ae..2638121a2223 100644
> > --- a/Documentation/devicetree/bindings/display/bridge/toshiba,tc358768.yaml
> > +++ b/Documentation/devicetree/bindings/display/bridge/toshiba,tc358768.yaml
> > @@ -42,6 +42,21 @@ properties:
> >    clock-names:
> >      const: refclk
> >  
> > +  toshiba,input-rgb-mode:
> > +    description: |
> > +      Parallel Input (RGB) Mode.
> > +
> > +      RGB inputs (PD[23:0]) color arrangement as documented in the datasheet
> > +      and in the table below.
> > +
> > +      0 = R[7:0], G[7:0], B[7:0]
> 
> RGB888?

Or anything else - like a RGB666 - just connecting to GND the unused
pins.

> > +      1 = R[1:0], G[1:0], B[1:0], R[7:2], G[7:2], B[7:2]
> > +      2 = 8’b0, R[4:0], G[5:0], B[4:0]
> 
> Isn't this RGB565?
> 
> Don't we have already properties like this? e.g. colorspace?

It's not really the colorspace this property.

tc358768 is a parallel RGB to DSI bridge, it has 24 bit parallel input
line.

The way this lines are connected is configurable with this parameter, if you
look at mode 0 and 1 they all allow to have a RGB888 or a RGB666 or a
RGB565 mapping. This just configure some internal mux, it's not strictly
about the RGB mode.

The description for mode 2 was copied from the datasheet, and I agree
this is really about having a RGB565 on the first 16 parallel input
pins.

Honestly I do not know what is going to happen with PD[23-16] if they
are not connected to GND, given that the component does not know the
parallel input bus width it might as well sample those pins in some
un-documented way.

Francesco

