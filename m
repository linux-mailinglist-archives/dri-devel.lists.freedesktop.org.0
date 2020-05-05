Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 899341C632C
	for <lists+dri-devel@lfdr.de>; Tue,  5 May 2020 23:37:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3E9F6E105;
	Tue,  5 May 2020 21:37:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEA936E105
 for <dri-devel@lists.freedesktop.org>; Tue,  5 May 2020 21:37:35 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 173BD542;
 Tue,  5 May 2020 23:37:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1588714654;
 bh=eiuReEMJvpjUWPLJO8Z2JmwStFJTrhUwSJ4qmcopXVk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DFGlFtj9VhJcu1wOKP6KnWvWsjIs3FSYmk0YczbGWyMQx69YEoLTxxR0ujvuY9Pgn
 KqGv0OicNnqblZPJsokIZJ3IGqr7JtbJPH4shlXZxOigKF87teIlnOQvei+XhuuRP+
 ogoGIucAmf/m06c/sx7YSYH7XfAkghbjOKk/55sk=
Date: Wed, 6 May 2020 00:37:28 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Douglas Anderson <dianders@chromium.org>
Subject: Re: [PATCH v4 5/6] dt-bindings: drm/bridge: ti-sn65dsi86: Document
 no-hpd
Message-ID: <20200505213728.GB8640@pendragon.ideasonboard.com>
References: <20200430194617.197510-1-dianders@chromium.org>
 <20200430124442.v4.5.I72892d485088e57378a4748c86bc0f6c2494d807@changeid>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200430124442.v4.5.I72892d485088e57378a4748c86bc0f6c2494d807@changeid>
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
Cc: robdclark@chromium.org, devicetree@vger.kernel.org, jernej.skrabec@siol.net,
 narmstrong@baylibre.com, airlied@linux.ie, linux-arm-msm@vger.kernel.org,
 jonas@kwiboo.se, jeffrey.l.hugo@gmail.com, spanda@codeaurora.org,
 dri-devel@lists.freedesktop.org, bjorn.andersson@linaro.org,
 a.hajda@samsung.com, bgolaszewski@baylibre.com, robh+dt@kernel.org,
 linux-gpio@vger.kernel.org, swboyd@chromium.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Doug,

Thank you for the patch.

On Thu, Apr 30, 2020 at 12:46:16PM -0700, Douglas Anderson wrote:
> The ti-sn65dsi86 MIPI DSI to eDP bridge chip has a dedicated hardware
> HPD (Hot Plug Detect) pin on it, but it's mostly useless for eDP
> because of excessive debouncing in hardware.  Specifically there is no
> way to disable the debouncing and for eDP debouncing hurts you because
> HPD is just used for knowing when the panel is ready, not for
> detecting physical plug events.
> 
> Currently the driver in Linux just assumes that nobody has HPD hooked
> up.  It relies on folks setting the "no-hpd" property in the panel
> node to specify that HPD isn't hooked up and then the panel driver
> using this to add some worst case delays when turning on the panel.
> 
> Apparently it's also useful to specify "no-hpd" in the bridge node so
> that the bridge driver can make sure it's doing the right thing
> without peeking into the panel [1].  This would be used if anyone ever
> found it useful to implement support for the HW HPD pin on the bridge.
> Let's add this property to the bindings.
> 
> NOTES:
> - This is somewhat of a backward-incompatible change.  All current
>   known users of ti-sn65dsi86 didn't have "no-hpd" specified in the
>   bridge node yet none of them had HPD hooked up.  This worked because
>   the current Linux driver just assumed that HPD was never hooked up.
>   We could make it less incompatible by saying that for this bridge
>   it's assumed HPD isn't hooked up _unless_ a property is defined, but
>   "no-hpd" is much more standard and it's unlikely to matter unless
>   someone quickly goes and implements HPD in the driver.
> - It is sensible to specify "no-hpd" at the bridge chip level and
>   specify "hpd-gpios" at the panel level.  That would mean HPD is
>   hooked up to some other GPIO in the system, just not the hardware
>   HPD pin on the bridge chip.
> 
> [1] https://lore.kernel.org/r/20200417180819.GE5861@pendragon.ideasonboard.com
> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
> 
> Changes in v4:
> - Tacked on "or is otherwise unusable." to description.
> 
> Changes in v3:
> - useful implement => useful to implement
> 
> Changes in v2:
> - ("dt-bindings: drm/bridge: ti-sn65dsi86: Document no-hpd") new for v2.
> 
>  .../devicetree/bindings/display/bridge/ti,sn65dsi86.yaml  | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.yaml b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.yaml
> index 6d7d40ad45ac..75c4e8b8e4b7 100644
> --- a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.yaml
> @@ -28,6 +28,12 @@ properties:
>      maxItems: 1
>      description: GPIO specifier for GPIO1 pin on bridge (active low).
>  
> +  no-hpd:
> +    type: boolean
> +    description:
> +      Set if the HPD line on the bridge isn't hooked up to anything or is
> +      otherwise unusable.
> +
>    vccio-supply:
>      description: A 1.8V supply that powers the digital IOs.
>  
> @@ -207,6 +213,8 @@ examples:
>          clocks = <&rpmhcc RPMH_LN_BB_CLK2>;
>          clock-names = "refclk";
>  
> +        no-hpd;
> +
>          ports {
>            #address-cells = <1>;
>            #size-cells = <0>;

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
