Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BB646D08FC
	for <lists+dri-devel@lfdr.de>; Thu, 30 Mar 2023 17:02:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFF7E10E070;
	Thu, 30 Mar 2023 15:02:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail11.truemail.it (mail11.truemail.it [IPv6:2001:4b7e:0:8::81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2F4210E070
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 15:02:19 +0000 (UTC)
Received: from francesco-nb.int.toradex.com (93-49-2-63.ip317.fastwebnet.it
 [93.49.2.63])
 by mail11.truemail.it (Postfix) with ESMTPA id AECEA20378;
 Thu, 30 Mar 2023 17:02:17 +0200 (CEST)
Date: Thu, 30 Mar 2023 17:02:13 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: Jagan Teki <jagan@amarulasolutions.com>
Subject: Re: [PATCH v1 1/2] dt-bindings: display: bridge: sn65dsi83: Add DSI
 video mode
Message-ID: <ZCWkdc+x0LXDSohj@francesco-nb.int.toradex.com>
References: <20230330101752.429804-1-francesco@dolcini.it>
 <20230330101752.429804-2-francesco@dolcini.it>
 <CAMty3ZAQPEnCgj9r+tsuqiOzRzHPnKSEXcDqE7LKHH16Zu2Wvw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMty3ZAQPEnCgj9r+tsuqiOzRzHPnKSEXcDqE7LKHH16Zu2Wvw@mail.gmail.com>
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
Cc: Marek Vasut <marex@denx.de>, Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Francesco Dolcini <francesco@dolcini.it>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jonas Karlman <jonas@kwiboo.se>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Francesco Dolcini <francesco.dolcini@toradex.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Mar 30, 2023 at 07:56:26PM +0530, Jagan Teki wrote:
> On Thu, Mar 30, 2023 at 3:48 PM Francesco Dolcini <francesco@dolcini.it> wrote:
> >
> > From: Francesco Dolcini <francesco.dolcini@toradex.com>
> >
> > SN65DSI8[34] device supports burst video mode and non-burst video mode
> > with sync events or with sync pulses packet transmission as described in
> > the DSI specification.
> >
> > Add property to select the expected mode, this allows for example to
> > select a mode that is compatible with the DSI host interface.
> >
> > Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
> > ---
> >  .../devicetree/bindings/display/bridge/ti,sn65dsi83.yaml  | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml
> > index 48a97bb3e2e0..ebee16726b02 100644
> > --- a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml
> > +++ b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml
> > @@ -35,6 +35,14 @@ properties:
> >    vcc-supply:
> >      description: A 1.8V power supply (see regulator/regulator.yaml).
> >
> > +  dsi-video-mode:
> > +    description: |
> > +      0 - burst-mode
> > +      1 - non-burst with sync event
> > +      2 - non-burst with sync pulse
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    enum: [0, 1, 2]
> 
> I'm thinking this can go to dsi common code since the video modes are
> common across all controllers and make the core initialize the default
> and update if any sink devices are willing to change the modes. Sound
> like a big move but worth useful.

Not sure I understood where do you want to move this.

In any case this is something about the display side of the DSI video
connection, with the bridge as a special case, not about the controller.
To my understanding the controller is supposed to support all the modes.

Francesco

