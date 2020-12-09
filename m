Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 605EA2D46BE
	for <lists+dri-devel@lfdr.de>; Wed,  9 Dec 2020 17:29:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB9E16EAB4;
	Wed,  9 Dec 2020 16:29:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-40133.protonmail.ch (mail-40133.protonmail.ch
 [185.70.40.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D72A6EAB4
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Dec 2020 16:29:10 +0000 (UTC)
Date: Wed, 09 Dec 2020 16:29:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1607531347;
 bh=J05NypzM6Y25ScFVRomQMBOOvW2L55+qWp3yLtsWxCw=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=bnIJyyXcfHPdm3mziG88MiqfwLJpOVjMoABfiJjgOim2PYnJ5Vd2blL0E8+CxFs7m
 2A1hB49lxHwVi+quMsXoGNZOT7Cqq6DqCH6vD9Cs5kRO+2cZquv9JQM041bElh7Hat
 UWMZJ0xs1gS6ovGoZ/TUeWfe0psrmWwvYZyNNl43OgFe5uprHMFsbXqiOwj5A5RF0z
 I8f3MdGPbHrSwGlFLx9mU3ZAD7W3cVB7Z+lSS1RylJX6qbMObGR8JLraSsdsJxyZsp
 SilR7P4aDQz63dwIheg9/LOEaYyMWu42MOerBYY9TtEP/OpFp2AYjRx+HxnZOUblXm
 RT1Kk9mssb84g==
To: Daniel Vetter <daniel@ffwll.ch>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH] drm: rework description of primary and cursor planes
Message-ID: <bO04K9yKix_WKPi_kWNVG89Byfn59pvY1OKaXbB0gQeAAEyuUDaVGX_PIgzNcLRU83SCzPe4Vm7V2O1-sm8X65CkoU3nmKcM5plDntx6FtU=@emersion.fr>
In-Reply-To: <20201209160223.GT401619@phenom.ffwll.local>
References: <wrDqxEGdxtotWKrfQH8W8tl2Z8JgdHzUs3wuTth4@cp4-web-027.plabs.ch>
 <20201209004223.GL401619@phenom.ffwll.local>
 <0zedd9O9Bp0DfEH26xBTGvZtqA5bdE2EJDN3z5TXiDIyiwfTnRapgDy69MjAlhMWrzqKTzoYwovpGANNhp1PmneSCrm-xzw9DIeauv1SkgM=@emersion.fr>
 <20201209160223.GT401619@phenom.ffwll.local>
MIME-Version: 1.0
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
 mailout.protonmail.ch
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
Reply-To: Simon Ser <contact@emersion.fr>
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wednesday, December 9th, 2020 at 5:02 PM, Daniel Vetter <daniel@ffwll.ch> wrote:

> On Wed, Dec 09, 2020 at 03:58:17PM +0000, Simon Ser wrote:
> > Thanks for the review!
> >
> > On Wednesday, December 9th, 2020 at 1:42 AM, Daniel Vetter <daniel@ffwll.ch> wrote:
> >
> > > I think maybe a follow up patch should document how userspace should
> > > figure out how to line up the primary planes with the right crtcs (if it
> > > wishes to know that information, it's not super useful aside from probably
> > > good choice for a fullscreen fallback plane). See my reply on the old
> > > thread.
> >
> > Yeah, as I've already replied, I won't volunteer to document legacy bits,
> > documenting atomic is already enough. :P
>
> This is also somewhat useful as a hint for atomic userspace.

How so? Atomic can just pick the first compatible primary plane for CRTC 1,
the first available primary plane from the rest for CRTC 2, and so on.

> > > And that patch should also add the code to drm_mode_config_validate() to
> > > validate the possible_crtc masks for these. Something like
> > >
> > > 	num_primary = 0; num_cursor = 0;
> > >
> > > 	for_each_plane(plane) {
> > > 		if (plane->type == primary) {
> > > 			WARN_ON(!(plane->possible_crtcs & BIT(num_primary)));
> > > 			num_primary++;
> > > 		}
> > >
> > > 		/* same for cursor */
> > > 	}
> > >
> > > 	WARN_ON(num_primary != dev->mode_config.num_crtcs);
> > > }
> >
> > Thanks for the suggestion. However I don't see why a driver should ensure
> > this. Isn't it perfectly fine for a driver to use primary plane 2 for CRTC 1,
> > and primary plane 1 for CRTC 2, for the purposes of legacy uAPI?
>
> Yeah but it's a mess. Messes don't make good uapi.
>
> > If we're trying here to invent a new uAPI to let user-space discover the
> > internal legacy primary/cursor pointers, I'm not signing up for this. The
> > requirement you're describing seems like something current drivers ensure
> > "by chance", not an established uAPI. In other words, writing a new driver
> > that doesn't do the same wouldn't break uAPI contracts.
>
> I'm more seeing this as general uapi lock-down. "Everything goes" doesn't
> work great. And it's all the same topic really. Like if your userspace
> really doesn't care about what the primary plane is (like you seem to
> imply), then ofc none of this matters to you, but then also your doc patch
> here doesn't matter.

My patch makes it clear the "one primary plane per CRTC" requirement is just
for legacy uAPI. See the commit message.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
