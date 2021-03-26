Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EB18349E59
	for <lists+dri-devel@lfdr.de>; Fri, 26 Mar 2021 02:02:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE09D6EE95;
	Fri, 26 Mar 2021 01:02:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC6F86EE95
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Mar 2021 01:02:28 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id EBEC5443;
 Fri, 26 Mar 2021 02:02:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1616720547;
 bh=mSy6v/pmSuKkHHCJgekfe0uCrYrOMXd+/Xdd5V+A4GY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RgevzU3x9LecEhwbZgL1gkb869v7LzAfTHSl8mrV+bAyqYjSisHMzcxzuxIaxqb1/
 0aMwsNdvhCGYK+Ld0kgamhykI5f0V/In+C6SN+86EkmHpqyaY740mGPZy2R+8M7L/a
 B7lyOPnPZGfLWmVpg/n2bgFdcy//Iup11zwhf4Yc=
Date: Fri, 26 Mar 2021 03:01:44 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Doug Anderson <dianders@chromium.org>
Subject: Re: [RFC PATCH 03/11] drm/bridge: ti-sn65dsi86: Unregister AUX
 adapter in remove()
Message-ID: <YF0yeN2NFlD8MYJE@pendragon.ideasonboard.com>
References: <20210322030128.2283-1-laurent.pinchart+renesas@ideasonboard.com>
 <20210322030128.2283-4-laurent.pinchart+renesas@ideasonboard.com>
 <CAD=FV=W-+aS25wtnSmF8tWSDHTdNCjbFj0x02-1iqZ2p5qYzyA@mail.gmail.com>
 <YFpgfBW+U5R6urk0@pendragon.ideasonboard.com>
 <CAD=FV=W76DXDsy_Ug5cQUVUfz18MzYp92hPKOiRm3Hf1jknPgQ@mail.gmail.com>
 <YFpznvA/m3KfEEqz@pendragon.ideasonboard.com>
 <CAD=FV=WoivERNCXtCa6UFix6e+K5JZpXca_ipnEwtA4rkSLgZA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAD=FV=WoivERNCXtCa6UFix6e+K5JZpXca_ipnEwtA4rkSLgZA@mail.gmail.com>
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>,
 Neil Armstrong <narmstrong@baylibre.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Stephen Boyd <swboyd@chromium.org>, linux-renesas-soc@vger.kernel.org,
 Andrzej Hajda <a.hajda@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Doug,

On Thu, Mar 25, 2021 at 05:43:22PM -0700, Doug Anderson wrote:
> On Tue, Mar 23, 2021 at 4:03 PM Laurent Pinchart wrote:
> > On Tue, Mar 23, 2021 at 03:55:05PM -0700, Doug Anderson wrote:
> > > On Tue, Mar 23, 2021 at 2:42 PM Laurent Pinchart wrote:
> > > > On Tue, Mar 23, 2021 at 02:08:42PM -0700, Doug Anderson wrote:
> > > > > On Sun, Mar 21, 2021 at 8:02 PM Laurent Pinchart wrote:
> > > > > >
> > > > > > The AUX adapter registered in probe() need to be unregistered in
> > > > > > remove(). Do so.
> > > > > >
> > > > > > Fixes: b814ec6d4535 ("drm/bridge: ti-sn65dsi86: Implement AUX channel")
> > > > > > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > > > > > ---
> > > > > >  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 3 +++
> > > > > >  1 file changed, 3 insertions(+)
> > > > > >
> > > > > > diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> > > > > > index da78a12e58b5..c45420a50e73 100644
> > > > > > --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> > > > > > +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> > > > > > @@ -1307,6 +1307,9 @@ static int ti_sn_bridge_remove(struct i2c_client *client)
> > > > > >                 return -EINVAL;
> > > > > >
> > > > > >         kfree(pdata->edid);
> > > > > > +
> > > > > > +       drm_dp_aux_unregister(&pdata->aux);
> > > > > > +
> > > > > >         ti_sn_debugfs_remove(pdata);
> > > > > >
> > > > > >         of_node_put(pdata->host_node);
> > > > >
> > > > > Good catch. One question, though. I know DRM sometimes has different
> > > > > conventions than the rest of the kernel, but I always look for the
> > > > > "remove" to be backwards of probe. That means that your code (and
> > > > > probably most of the remove function) should come _after_ the
> > > > > drm_bridge_remove(), right?  ...since drm_bridge_add() was the last
> > > > > thing in probe then drm_bridge_remove() should be the first thing in
> > > > > remove?
> > > >
> > > > I agree in theory, yes. However, in practice, if you remove a bridge
> > > > that is currently in use, all hell will break lose. And if the bridge
> > > > isn't being used, it makes no difference. Still, it's worth changing the
> > > > order of operations to move drm_bridge_remove() first, as it won't hurt
> > > > in any case and is logically better. It's not an issue introduced by
> > > > this series though, so how how about it on top, or in parallel ?
> > >
> > > Sure, it can be a separate patch. I'd kinda prefer it be a patch
> > > _before_ ${SUBJECT} patch, though. Specifically it's harder for me to
> > > reason about whether your new function call is in the right place and
> > > won't cause any problems with the order being all jumbled. If we fix
> > > the order first then it's easy to reason about your patch.
> > >
> > > > You can
> > > > even submit a patch if you want :-)
> > >
> > > Happy to post it up if it won't cause more confusion w/ you posting
> > > your next version and trying to figure out what to base it on (since
> > > it will definitely conflict with your series).
> >
> > I'll need quite a bit of time before v2, as I'd like to test it, and
> > that requires finishing support for the DSI bridge and the display
> > controller :-) Please feel free to post a patch if you have time, I
> > think it could get merged in drm-misc quite quickly.
> 
> I haven't forgotten about this and I've got it written, but I'm trying
> to put it together with the work I'm doing to fix EDID reading and
> that's still going to take me a while longer. I'm out tomorrow but
> _hoping_ that I'll be able to at least get a new patch series (at
> least RFC quality) next week...

No worries at all, it will take a few weeks at least before I get the
display controller and DSI working on my board, so you're not blocking
me :-)

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
