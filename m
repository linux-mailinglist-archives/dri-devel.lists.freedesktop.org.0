Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F0B436E1E8F
	for <lists+dri-devel@lfdr.de>; Fri, 14 Apr 2023 10:42:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1EB410EC88;
	Fri, 14 Apr 2023 08:42:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail11.truemail.it (mail11.truemail.it [IPv6:2001:4b7e:0:8::81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7C5110EC93
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Apr 2023 08:42:51 +0000 (UTC)
Received: from francesco-nb.int.toradex.com (93-49-2-63.ip317.fastwebnet.it
 [93.49.2.63])
 by mail11.truemail.it (Postfix) with ESMTPA id 81CE020B6B;
 Fri, 14 Apr 2023 10:42:45 +0200 (CEST)
Date: Fri, 14 Apr 2023 10:42:42 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v1 3/6] dt-bindings: display: bridge: toshiba,tc358768:
 add parallel input mode
Message-ID: <ZDkSAsdijlL7YzzV@francesco-nb.int.toradex.com>
References: <20230330095941.428122-1-francesco@dolcini.it>
 <20230330095941.428122-4-francesco@dolcini.it>
 <a924186c-31d3-b7f0-085f-97b849a4d751@linaro.org>
 <ZCaqcaq02VDsqCPJ@francesco-nb.int.toradex.com>
 <20230403210117.GA1722054-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230403210117.GA1722054-robh@kernel.org>
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
 devicetree@vger.kernel.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Francesco Dolcini <francesco.dolcini@toradex.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Rob and Krzysztof

On Mon, Apr 03, 2023 at 04:01:17PM -0500, Rob Herring wrote:
> On Fri, Mar 31, 2023 at 11:40:01AM +0200, Francesco Dolcini wrote:
> > On Fri, Mar 31, 2023 at 10:48:15AM +0200, Krzysztof Kozlowski wrote:
> > > On 30/03/2023 11:59, Francesco Dolcini wrote:
> > > > From: Francesco Dolcini <francesco.dolcini@toradex.com>
> > > > 
> > > > Add new toshiba,input-rgb-mode property to describe the actual signal
> > > > connection on the parallel RGB input interface.
> > > > 
> > > > Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
> > > > ---
> > > >  .../bindings/display/bridge/toshiba,tc358768.yaml | 15 +++++++++++++++
> > > >  1 file changed, 15 insertions(+)
> > > > 
> > > > diff --git a/Documentation/devicetree/bindings/display/bridge/toshiba,tc358768.yaml b/Documentation/devicetree/bindings/display/bridge/toshiba,tc358768.yaml
> > > > index 8f22093b61ae..2638121a2223 100644
> > > > --- a/Documentation/devicetree/bindings/display/bridge/toshiba,tc358768.yaml
> > > > +++ b/Documentation/devicetree/bindings/display/bridge/toshiba,tc358768.yaml
> > > > @@ -42,6 +42,21 @@ properties:
> > > >    clock-names:
> > > >      const: refclk
> > > >  
> > > > +  toshiba,input-rgb-mode:
> > > > +    description: |
> > > > +      Parallel Input (RGB) Mode.
> > > > +
> > > > +      RGB inputs (PD[23:0]) color arrangement as documented in the datasheet
> > > > +      and in the table below.
> > > > +
> > > > +      0 = R[7:0], G[7:0], B[7:0]
> > tc358768 is a parallel RGB to DSI bridge, it has 24 bit parallel input
> > line.
> > 
> > The way this lines are connected is configurable with this parameter, if you
> > look at mode 0 and 1 they all allow to have a RGB888 or a RGB666 or a
> > RGB565 mapping. This just configure some internal mux, it's not strictly
> > about the RGB mode.
> 
> This is the same as other cases. There's a need for describing the 
> interface. It keeps coming up and I keep saying to go create something 
> common.

Rob, Krzysztof: you both had concerns on this change and I am not sure how
to progress. Let me summarize my current understanding.

1. I do not think that this change is related to the media bus format
   topic, this is more like the internal bridge RGB pins mux
   configuration. This `input-rgb-mode` field I am proposing here is
   orthogonal to the bus format (e.g. linux media-bus-format.h). I can
   change the name, if we think this is the reason of the confusion, I
   just used something similar to the words used in the datasheet.
   
   Do we have agreement on that or not?

2. Rob asked for a generic solution, since according to him this is a
   recurring need. I would appreciate some pointer where to look at so I
   can propose something more generic.

Thanks,
Francesco

