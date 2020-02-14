Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9293515DFFE
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2020 17:12:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99A5B6FA87;
	Fri, 14 Feb 2020 16:12:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FCA36FA87
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2020 16:12:05 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 34CB980477;
 Fri, 14 Feb 2020 17:11:58 +0100 (CET)
Date: Fri, 14 Feb 2020 17:11:56 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH 2/4] dt-bindings: panel: lvds: Add properties for clock
 and data polarities
Message-ID: <20200214161156.GA18287@ravnborg.org>
References: <cover.b12a054012ce067fa2094894147f953ab816d8d0.1581682983.git-series.maxime@cerno.tech>
 <620a740cec4186177ce346b092d4ba451e1420dc.1581682983.git-series.maxime@cerno.tech>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <620a740cec4186177ce346b092d4ba451e1420dc.1581682983.git-series.maxime@cerno.tech>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=XpTUx2N9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10
 a=Tpc6Fu3lJ6wmHEW927AA:9 a=CjuIK1q_8ugA:10
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>,
 Sean Paul <seanpaul@chromium.org>, Thierry Reding <thierry.reding@gmail.com>,
 Daniel Vetter <daniel.vetter@intel.com>, Frank Rowand <frowand.list@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maxime.

On Fri, Feb 14, 2020 at 01:24:39PM +0100, Maxime Ripard wrote:
> Some LVDS encoders can support multiple polarities on the data and
> clock lanes, and similarly some panels require a given polarity on
> their inputs. Add a property on the panel to configure the encoder
> properly.
> 
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Not a fan of this binding...
In display-timing.txt we have a specification/description of
the panel-timing node.

The panel-timing node already include information such as:
- hsync-active:
- vsync-active:
- de-active:
- pixelclk-active:
- syncclk-active:

But clock-active-low and data-active-low refer to the bus
more than an individual timing.
So maybe OK not to have it in a panel-timing node.
But then it would IMO be better to include
this in the display-timing node - so we make
this available and standard for all users of the
display-timing node.

I will dig up my patchset to make proper bindings for panel-timing and
display-timing this weeked and resend them.
Then we can discuss if this goes on top or this is specific for the
lvds binding.


> ---
>  Documentation/devicetree/bindings/display/panel/lvds.yaml | 10 ++++++++-
>  1 file changed, 10 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/lvds.yaml b/Documentation/devicetree/bindings/display/panel/lvds.yaml
> index d0083301acbe..4a1111a1ab38 100644
> --- a/Documentation/devicetree/bindings/display/panel/lvds.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/lvds.yaml
> @@ -90,6 +90,16 @@ properties:
>        CTL2: Data Enable
>        CTL3: 0
>  
> +  clock-active-low:
> +    type: boolean
> +    description: >

Should this be "|" and not ">"?
Did this pass dt_binding_check?

> +      If set, reverse the clock polarity on the clock lane.
This text could be a bit more specific. If this is set then
what?
And it seems strange that a clock is active low.
For a clock we often talk about raising or falling edge.

> +
> +  data-active-low:
> +    type: boolean
> +    description: >
Same comment with ">"

> +      If set, reverse the bit polarity on all data lanes.
Same comment about a more explicit description.


	Sam


>    data-mirror:
>      type: boolean
>      description:
> -- 
> git-series 0.9.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
