Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 14F6E578C2B
	for <lists+dri-devel@lfdr.de>; Mon, 18 Jul 2022 22:52:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68D7C10E210;
	Mon, 18 Jul 2022 20:52:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay4-1.pub.mailoutpod1-cph3.one.com
 (mailrelay4-1.pub.mailoutpod1-cph3.one.com [46.30.210.185])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C10810E1AF
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Jul 2022 20:52:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=m59mFweSACbtEVtNRiaM6yLsqbG4SIsgi9xUu0Z2h6w=;
 b=Ml7G9+y+460WIKHkzme5/GoQ28vPE7U/z6SyTm+8h0rJE6c897lxfWSo8gOKh1Xk0Z8MqR9/C4gOf
 F8/dJcw33aIsiAniA8yH/W2abLbykjXFgjllBi58pS3YdnzZv6mJz0cAousJd7S3GKSUwQdKGD/77X
 8ZSy0X54CeH3Wx67Le8Zhdm4VUb/5Spa6AZJFmZt+bifIC226JgZ8yH/rIK52G3/ap6SbgAyhiLEh3
 UiflmSug72YR7x7IRcOY6cfFu1XSTuYuNDW2ZP+WHxJ559oFC1kBQFk6N/k3lgjsWOT8oOXNwM/3gu
 N8z2V0/5p1rlVSAd2BU/rDt8VmKMgyQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=m59mFweSACbtEVtNRiaM6yLsqbG4SIsgi9xUu0Z2h6w=;
 b=H7bvAp9By+D52E7RD66gemgoUZxJ6Z6dQRs2LJSSVcIvoIT27j7nARsDpSK62XoKpYsywKV8yIUv4
 z+cWYR9Cg==
X-HalOne-Cookie: c112762819002504ad05bc4da79cdf00bddbc1ff
X-HalOne-ID: 8d37a933-06db-11ed-823f-d0431ea8bb10
Received: from mailproxy2.cst.dirpod3-cph3.one.com
 (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay4.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
 id 8d37a933-06db-11ed-823f-d0431ea8bb10;
 Mon, 18 Jul 2022 20:52:35 +0000 (UTC)
Date: Mon, 18 Jul 2022 22:52:34 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: Re: [PATCH V2 0/3] DSI host and peripheral initialisation ordering
Message-ID: <YtXIEg0rRZLLYS75@ravnborg.org>
References: <cover.1646406653.git.dave.stevenson@raspberrypi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1646406653.git.dave.stevenson@raspberrypi.com>
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
Cc: Marek Vasut <marex@denx.de>, Jagan Teki <jagan@amarulasolutions.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, Robert Foss <robert.foss@linaro.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, andrzej.hajda@gmail.com,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave,

a long overdue reply on this series.

On Fri, Mar 04, 2022 at 03:17:55PM +0000, Dave Stevenson wrote:
> Hi All
> 
> Changes from v1:
> - New patch to refactor drm_bridge_chain_post_disable and drm_bridge_chain_pre_enable
>   to reuse drm_atomic_bridge_chain_post_disable / drm_atomic_bridge_chain_pre_enable
>   but with a NULL state.
> - New patch that adds a pre_enable_upstream_first to drm_panel.
> - changed from an OPS flag to a bool "pre_enable_upstream_first" in drm_bridge.
> - Followed Andrzej's suggestion of using continue in the main loop to avoid
>   needing 2 additional loops (one forward to find the last bridge wanting
>   upstream first, and the second backwards again).
> - Actioned Laurent's review comments on docs patch.
> 
> Original cover letter: 
> 
> Hopefully I've cc'ed all those that have bashed this problem around previously,
> or are otherwise linked to DRM bridges.
> 
> There have been numerous discussions around how DSI support is currently broken
> as it doesn't support initialising the PHY to LP-11 and potentially the clock
> lane to HS prior to configuring the DSI peripheral. There is no op where the
> interface is initialised but HS video isn't also being sent.
> Currently you have:
> - peripheral pre_enable (host not initialised yet)
> - host pre_enable
> - encoder enable
> - host enable
> - peripheral enable (video already running)
> 
> vc4 and exynos currently implement the DSI host as an encoder, and split the
> bridge_chain. This fails if you want to switch to being a bridge and/or use
> atomic calls as the state of all the elements split off are not added by
> drm_atomic_add_encoder_bridges.

A typically chain looks like this:

CRTC => Encoder => Bridge A => Bridge B

We have in DRM bridges established what is the "next" bridge - indicated
with the direction of the arrows in the drawing.

This set of patches introduces the concept of "upstream" bridges.

pre_enable_prev_bridge_first would be easier to understand as it uses
the current terminology.
I get that "upstream" is used in the DSI specification - but we are
dealing with bridges that happens to support DSI and more, and mixing
the two terminologies is not good.

Note: Upstream is also used in a bridge doc section - here it should
      most likely be updated too.

The current approach set a flag that magically makes the core do something
else. Have you considered a much more explicit approach?

A few helpers like:

	drm_bridge_pre_enable_prev_bridge()
	drm_bridge_enable_prev_bridge()
	drm_bridge_disable_prev_bridge()
	drm_bridge_post_disable_prev_bridge()

And then update the core so the relevant function is only called once
for a bridge.
Then the need for DSI lanes in LP-11 can be archived by a call to

	drm_bridge_pre_enable_prev_bridge()

This is more explicit than a flag that triggers some magic behaviour.
It may even see uses we have not realised yet.

It is late here - so maybe the above is not a good idea tomorrow - but
right now I like the simplicity of it.

Other than the above I read that a mipi_dsi_host_init() is planned,
which is also explicit and simple - good.

Have we seen a new revision of some of these?
Chances are high that I have missed it then.

	Sam
