Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AFCC76495EA
	for <lists+dri-devel@lfdr.de>; Sun, 11 Dec 2022 19:50:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AB7210E06D;
	Sun, 11 Dec 2022 18:50:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30B7010E06D
 for <dri-devel@lists.freedesktop.org>; Sun, 11 Dec 2022 18:50:08 +0000 (UTC)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi
 [213.243.189.158])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id D0AAF6CF;
 Sun, 11 Dec 2022 19:50:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1670784606;
 bh=qSYapTDPtyayLaC5LWn696j2AIG+KcJzf5tWiP1kdEE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=iwQj/wtj7VLg6Z6MazaNPTQeQK07GgqY6le3qUP3xE8zscKR5eNp55KqX9ZciF8xy
 MQr46dzmAIxtNMeOVq/z+O8Yl46alYHBJauaoshzIkLRBVL0Gj8ed0534hbP+Nzpc4
 7r3QuAPhIjECBSpgEgPo8Nz3c8DDiGV65b634LWE=
Date: Sun, 11 Dec 2022 20:50:03 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Subject: Re: [PATCH 1/2] dt-bindings: drm/bridge: ti-sn65dsi83: Add enable
 delay property
Message-ID: <Y5YmW+KOmDL6Th20@pendragon.ideasonboard.com>
References: <20221209083339.3780776-1-alexander.stein@ew.tq-group.com>
 <3394586.QJadu78ljV@steina-w>
 <df7e4c0d-2e30-a808-584f-d302233c2931@denx.de>
 <45157029.fMDQidcC6G@steina-w>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <45157029.fMDQidcC6G@steina-w>
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
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jonas Karlman <jonas@kwiboo.se>, dri-devel@lists.freedesktop.org,
 Robert Foss <robert.foss@linaro.org>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, devicetree@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Alexander,

On Fri, Dec 09, 2022 at 01:21:36PM +0100, Alexander Stein wrote:
> Am Freitag, 9. Dezember 2022, 13:02:10 CET schrieb Marek Vasut:
> > On 12/9/22 10:36, Alexander Stein wrote:
> > > Am Freitag, 9. Dezember 2022, 10:07:45 CET schrieb Krzysztof Kozlowski:
> > >> On 09/12/2022 09:54, Alexander Stein wrote:
> > >>> Am Freitag, 9. Dezember 2022, 09:39:49 CET schrieb Krzysztof Kozlowski:
> > >>>> On 09/12/2022 09:33, Alexander Stein wrote:
> > >>>>> It takes some time until the enable GPIO has settled when turning on.
> > >>>>> This delay is platform specific and may be caused by e.g. voltage
> > >>>>> shifts, capacitors etc.
> > >>>>> 
> > >>>>> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> > >>>>> ---
> > >>>>> 
> > >>>>>   .../devicetree/bindings/display/bridge/ti,sn65dsi83.yaml      | 4 ++++
> > >>>>>   1 file changed, 4 insertions(+)
> > >>>>> 
> > >>>>> diff --git
> > >>>>> a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml
> > >>>>> b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml
> > >>>>> index 48a97bb3e2e0d..3f50d497cf8ac 100644
> > >>>>> --- a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml
> > >>>>> +++ b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml
> > >>>>> 
> > >>>>> @@ -32,6 +32,10 @@ properties:
> > >>>>>       maxItems: 1
> > >>>>>       description: GPIO specifier for bridge_en pin (active high).
> > >>>>> 
> > >>>>> +  ti,enable-delay-us:
> > >>>>> +    default: 10000
> > >>>>> +    description: Enable time delay for enable-gpios
> > >>>> 
> > >>>> Aren't you now mixing two separate delays? One for entire block on (I
> > >>>> would assume mostly fixed delay) and one depending on regulators
> > >>>> (regulator-ramp-delay, regulator-enable-ramp-delay). Maybe you miss the
> > >>>> second delays in your power supply? If so, the first one might be fixed
> > >>>> and hard-coded in the driver?
> > >>> 
> > >>> Apparently there are two different delays: reset time (t_reset) of 10ms as
> > >>> specified by datasheet. This is already ensured by a following delay after
> > >>> requesting enable_gpio as low and switching the GPIO to low in disable
> > >>> path.
> > >>> 
> > >>> When enabling this GPIO it takes some time until it is valid on the chip,
> > >>> this is what this series is about. It's highly platform specific.
> > >>> 
> > >>> Unfortunately this is completely unrelated to the vcc-supply regulator.
> > >>> This one has to be enabled before the enable GPIO can be enabled. So
> > >>> there is no regulator-ramp-delay.
> > >> 
> > >> Your driver does one after another - regulator followed immediately by
> > >> gpio - so this as well can be a delay from regulator (maybe not ramp but
> > >> enable delay).
> > 
> > The chip has two separate input pins:
> > 
> > VCC -- power supply that's regulator
> > EN -- reset line, that's GPIO
> > 
> > Alexander is talking about EN line here.
> > 
> > > But this will introduce a section which must not be interrupted or delayed.
> > > This is impossible as the enable gpio is attached to an i2c expander in my
> > > case.
> > > 
> > > Given the following time chart:
> > >   vcc                  set             EN
> > > 
> > > enable               GPIO             PAD
> > > 
> > >    |                    |<-- t_raise -->|
> > >    | 
> > >    | <-- t_vcc_gpio --> |               |
> > >    | <--        t_enable_delay      --> |
> > > 
> > > t_raise is the time from changing the GPIO output at the expander until
> > > voltage on the EN (input) pad from the bridge has reached high voltage
> > > level. This is an electrical characteristic I can not change and have to
> > > take into account.
> > > t_vcc_gpio is the time from enabling supply voltage to enabling the bridge
> > > (removing from reset). Minimum t_vcc_gpio is something which can be
> > > addressed by the regulator and is no problem so far. But there is no
> > > upper bound to it.
> >
> > What exactly is your EN signal rise time (should be ns or so)? Can you
> > look at that with a scope , maybe even with relation to the VCC regulator ?
> 
> I checked EN rise time using a scope, it's ~110ms. I not an expert in hardware 
> but on the mainboard there is some capacitor attached to this line, which 
> increased the time, independent from the internal pull-up.

This is board-specific, and not a property of the SND65DSI83. If the
same circuit was attached to any control input of any chip, you would
need to modify the corresponding driver in a similar way. I don't think
this is right.

How about adding ramp-up (and ramp-down I suppose) delay DT properties
to the GPIO provider instead ? This wouldn't scale very well if all GPIO
providers had to be patched, but with some luck it may be possible to
handle that in the GPIO core ?

Another option would be to add a "GPIO delay" node in DT, between the
GPIO provider and consumer. It could be handled with a small driver that
forwards the GPIO calls with a delay.

> > The DSI84 EN pin already has a built-in pullup per DSI84 datasheet (see
> > Table 5-1. Pin Functions), so that should make the signal rise fast,
> > certainly not for seconds.
> 
> Here it is >100ms, so the current waiting time is far too less. This results 
> in errors regarding PLL lock failure.

-- 
Regards,

Laurent Pinchart
