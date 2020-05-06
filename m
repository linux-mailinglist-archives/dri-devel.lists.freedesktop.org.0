Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2805E1C757B
	for <lists+dri-devel@lfdr.de>; Wed,  6 May 2020 17:56:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5945C891B1;
	Wed,  6 May 2020 15:56:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFD22891B1
 for <dri-devel@lists.freedesktop.org>; Wed,  6 May 2020 15:56:54 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id E30A9542;
 Wed,  6 May 2020 17:56:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1588780613;
 bh=JqP+SOCphmyvR7LY5kOsdyerYHIGqof5vTW6QMlbE0I=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JSCJRr1YjHYhNJEGPipbcitzN44oikeZK4tjqwRcMKFUE4bUrDOMma8NIzvzBgk0S
 5gJAR9gGYZ7ytOiUKewbJSais47zFkOxx0YnkZW8MXmf+cT8rRSO/PxqG9mwqEQD+v
 AjYuBY3gGFlLCdse5mLMf21yRvmsRIJ/EgkXX6ME=
Date: Wed, 6 May 2020 18:56:47 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH] drm/bridge: ti-sn65dsi86: Implement lane reordering +
 polarity
Message-ID: <20200506155647.GD15206@pendragon.ideasonboard.com>
References: <20200504213624.1.Ibc8eeddcee94984a608d6900b46f9ffde4045da4@changeid>
 <20200505082436.GD9658@pendragon.ideasonboard.com>
 <CAD=FV=WjUpwu5204K8yHzqsJv4vQX5S5CArH1Kj_kqjhZzTc9A@mail.gmail.com>
 <20200505210609.GA6094@pendragon.ideasonboard.com>
 <CAD=FV=UnGOYh8JX2=fEAqPN7wqANc0QevTirNO-WUDYMPqXcrg@mail.gmail.com>
 <20200505211401.GC6094@pendragon.ideasonboard.com>
 <CAD=FV=WgRC-HViMxttF4VK+n48HNRuqAau8S7mgx6oSWsbZcgA@mail.gmail.com>
 <CAD=FV=U8_Krob9oftJjzrYs1zrbLr9WZ-HSStv5_rbq9MpTChw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAD=FV=U8_Krob9oftJjzrYs1zrbLr9WZ-HSStv5_rbq9MpTChw@mail.gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Andrzej Hajda <a.hajda@samsung.com>, Sean Paul <seanpaul@chromium.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Doug,

On Tue, May 05, 2020 at 05:18:48PM -0700, Doug Anderson wrote:
> On Tue, May 5, 2020 at 2:24 PM Doug Anderson wrote:
> > On Tue, May 5, 2020 at 2:14 PM Laurent Pinchart wrote:
> > >
> > > > I'll add this documentation into the comments of the yaml, but I'm not
> > > > going to try to implement enforcement at the yaml level.
> > >
> > > Why not ? :-)
> >
> > Because trying to describe anything in the yaml bindings that doesn't
> > fit in the exact pattern of things that the yaml bindings are designed
> > to check is like constructing the empire state building with only
> > toothpicks.
> >
> > If you want to suggest some syntax that would actually make this
> > doable without blowing out the yaml bindings then I'm happy to add it.
> > Me being naive would assume that we'd need to do an exhaustive list of
> > the OK combinations.  That would be fine for the 1-land and 2-lane
> > cases, but for 4 lanes that means adding 256 entries to the bindings.
> >
> > I think the correct way to do this would require adding code in the
> > <https://github.com/devicetree-org/dt-schema> project but that's
> > really only done for generic subsystem-level concepts and not for a
> > single driver.
> 
> OK.  Looked at your review of the .yaml and the "uniqueItems" is
> probably the bit I didn't think of.  With that I can limit this but
> it's still a little awkward.  I still haven't figured out how to force
> data-lanes and lane-polarities to have the same number of items, too.
> I'll add this as an add-on patch to my v2 and folks can decide if they
> like it or hate it.

Thanks for looking into it. Looks good to me. Regarding the same number
of items I would assume it should be possible, I would be surprised if
the schemas allowed a different number of items for clocks and
clock-names for instance, but maybe that's not implemented yet. In any
case, no big deal.

> # See ../../media/video-interface.txt for details.
> data-lanes:
>   oneOf:
>     - minItems: 1
>       maxItems: 1
>       uniqueItems: true
>       items:
>         enum:
>           - 0
>           - 1
>       description:
>         If you have 1 logical lane it can go to either physical
>         port 0 or port 1.  Port 0 is suggested.
> 
>     - minItems: 2
>       maxItems: 2
>       uniqueItems: true
>       items:
>         enum:
>           - 0
>           - 1
>       description:
>         If you have 2 logical lanes they can be reordered on
>         physical ports 0 and 1.
> 
>     - minItems: 4
>       maxItems: 4
>       uniqueItems: true
>       items:
>         enum:
>           - 0
>           - 1
>           - 2
>           - 3
>       description:
>         If you have 4 logical lanes they can be reordered on
>         in any way.

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
