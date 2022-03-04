Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BB044CD846
	for <lists+dri-devel@lfdr.de>; Fri,  4 Mar 2022 16:49:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27D0010E3F1;
	Fri,  4 Mar 2022 15:49:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 510F910EDA7
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Mar 2022 15:49:37 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id ADAAC51C;
 Fri,  4 Mar 2022 16:49:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1646408975;
 bh=kLQmwl/+vPNRO8xx7xBk2B3LJG9VaxVZC9LOvPp9fQA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=EdNwZ6D9NPGyzWVZHNT3+8PqzH1cG8XCGrsEwPF9zKez8+LD3WlVUUqrrtrtOx54A
 dCXPwihgf1ooNsSdBbRsuFG+qXs9t/rmFSMKknrozGGzFEK4mx0e/Qy0CFJeiaWIE1
 Rdv0QW6BuC+NyBx7Xb2cXo38j1LlR8HHtHk3NmNA=
Date: Fri, 4 Mar 2022 17:49:23 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Doug Anderson <dianders@chromium.org>
Subject: Re: [RFC PATCH 10/11] drm/bridge: ti-sn65dsi86: Support DisplayPort
 (non-eDP) mode
Message-ID: <YiI1A+dtLXMQzkVf@pendragon.ideasonboard.com>
References: <20210322030128.2283-1-laurent.pinchart+renesas@ideasonboard.com>
 <20210322030128.2283-11-laurent.pinchart+renesas@ideasonboard.com>
 <CAD=FV=Wwayx1Y-xv=RPuJbG+Q1wHrUWgh4P7wuzy_bAL=_FN0g@mail.gmail.com>
 <YNM+JO4AAkPOLg7Y@pendragon.ideasonboard.com>
 <164563949999.4066078.2399611738908533224@Monstersaurus>
 <CAD=FV=WSHpu3Ub=0Gbq01o_s-SsUa_Q6uC7Z3PaxFL00eeJbdw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAD=FV=WSHpu3Ub=0Gbq01o_s-SsUa_Q6uC7Z3PaxFL00eeJbdw@mail.gmail.com>
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>,
 Neil Armstrong <narmstrong@baylibre.com>, Jonas Karlman <jonas@kwiboo.se>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Stephen Boyd <swboyd@chromium.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Andrzej Hajda <a.hajda@samsung.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Feb 23, 2022 at 10:20:18AM -0800, Doug Anderson wrote:
> On Wed, Feb 23, 2022 at 10:05 AM Kieran Bingham wrote:
> >
> > > > > +       /* For DisplayPort, disable scrambling mode. */
> > > > > +       if (pdata->bridge.type == DRM_MODE_CONNECTOR_DisplayPort)
> > > > > +               regmap_update_bits(pdata->regmap, SN_TRAINING_SETTING_REG,
> > > > > +                                  SCRAMBLE_DISABLE, SCRAMBLE_DISABLE);
> > > >
> > > > I'm assuming that this is the important part of your patch? Would be
> > > > sorta nice to include the "why" in your comment. Why do you want to
> > > > disable scrambling mode for DP but not for eDP? Maybe you care about
> > > > compatibility but not EMI if you're hooking up to random DP things?
> > >
> > > I'll investigate and include proper documentation in v2 (or drop the
> > > change altogether if it's not required).
> >
> > And indeed, this part is important. If I drop this hunk - then I get no
> > display output.
> >
> > I'm afraid I don't (yet) know the reasons 'why' to extend the comment,
> > beyond "Scrambling is not supported for DP".
> >
> > If anyone already does, please feel free to provide the text, and I'll
> > include it in the next revision, or I'll try to do some more digging
> > into this part.
> 
> I don't know _tons_ about it, but I later learned that the "alternate"
> scrambler is used for eDP and the normal scrambler is used for DP. I
> don't have any background about why they are different other than what
> looks to be intentionally making the two things incompatible.

I think it was done for DRM purpose, to prevent signals meant for a
panel to be connected to a device that could capture video from a DP
source.

> ...so I guess that would make it pretty clear why you can't use the
> alternate scrambler for DP. I haven't personally done the research to
> know if you can be officially DP compliant with the scrambler
> disabled. I also don't know why the ti-sn65dsi86 makes it so difficult
> to switch to the standard scrambler or if it works at all... ;-)

-- 
Regards,

Laurent Pinchart
