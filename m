Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FFB6455D5A
	for <lists+dri-devel@lfdr.de>; Thu, 18 Nov 2021 15:05:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF03E6EB84;
	Thu, 18 Nov 2021 14:05:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCE1F6EB84
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Nov 2021 14:05:26 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id A48323E5;
 Thu, 18 Nov 2021 15:05:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1637244324;
 bh=EsamhzVuXX3YEy0k91hEwA8EXqH3aaab9haLwq+oakA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YP8q7PaENd0SMS0a5L6uefKyMtiRyx5q4VZLsFGY9hz20T+WBxIhq/Lx1Fhy4PUTT
 llYfjD2WMAAzKQTjxKBqE3ewsuPhgWSRHE8RL4QZq4To5u1liqW8zFsT84wHLxbPjG
 j7eQD2NvjiT5bC5lXYaCjsr4Zu8VYJeAZyUKfybQ=
Date: Thu, 18 Nov 2021 16:05:02 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Daniel Stone <daniel@fooishbar.org>
Subject: Re: [PATCH] drm: rcar-du: add modifiers support
Message-ID: <YZZdjlzFPDCbAfQU@pendragon.ideasonboard.com>
References: <20190509054518.10781-1-etom@igel.co.jp>
 <20190509071429.GA4773@pendragon.ideasonboard.com>
 <20217791-f912-0864-48a9-dfacadfb3650@igel.co.jp>
 <20190511181027.GC13043@pendragon.ideasonboard.com>
 <YZZHuNgGr0kZXzyl@pendragon.ideasonboard.com>
 <CAPj87rNPiLve14H85ZBbn-oozqgeS26DGUCg2oJ8LupAdYcEqA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAPj87rNPiLve14H85ZBbn-oozqgeS26DGUCg2oJ8LupAdYcEqA@mail.gmail.com>
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
Cc: linux-renesas-soc@vger.kernel.org, Esaki Tomohito <etom@igel.co.jp>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Daniel,

On Thu, Nov 18, 2021 at 01:02:11PM +0000, Daniel Stone wrote:
> Hi all,
> Thanks for this Laurent. Esaki-san, could you please CC dri-devel@ on
> discussions like this?
> 
> On Thu, 18 Nov 2021 at 12:32, Laurent Pinchart wrote:
> > On Sat, May 11, 2019 at 09:10:27PM +0300, Laurent Pinchart wrote:
> > > On Thu, May 09, 2019 at 06:25:19PM +0900, Esaki Tomohito wrote:
> > > > Weston compositor (v5.0.0 or later) uses the DRM API to get the
> > > > supported modifiers and determines if the sprite plane can be used by
> > > > comparing the modifiers with the client specified modifier.
> > > > In currently driver, since the weston doesn't know supported modifiers,
> > > > that cannot determine if the received dmabuf can be passed through to
> > > > sprite plane.
> > > > Since there are R-Car GPU which support linear modifier, the sprite
> > > > plane cannot be used in a compositor similar to the weston if client
> > > > specify linear modifier.
> > >
> > > I don't think the right solution is to expose the linear modifier from
> > > all drivers that don't otherwise support modifiers. We should instead
> > > fix it either in Weston, and treat drivers that don't support the
> > > modifiers API as supporting the linear modifier only, or in the DRM/KMS
> > > core by reporting the linear modifier for drivers that don't explicitly
> > > support modifiers.
> >
> > I've been pointed to
> > https://gitlab.freedesktop.org/wlroots/wlroots/-/merge_requests/3350#note_1161827,
> > and we had a discussion on the #dri-devel IRC channel today on this
> > topic. It turns out I was wrong, not specifying modifiers in userspace
> > is different than specifying a linear modifier. This is true for some
> > legacy drivers only (e.g. radeon) that pre-date the modifiers API, and
> > which select a tiling format internally based on some heuristics.
> >
> > I still don't like this patch though, as it would need to be replicated
> > in most drivers. It would be better if we could handle this in the DRM
> > core. Daniel kindly offered to summarize the IRC discussion in a reply
> > to this e-mail.
> 
> Just quickly, I believe the check for the linear modifier in fb_create
> is unnecessary, as this should already be checked in the core through
> format_mod_supported().
> 
> There is indeed a difference between LINEAR and INVALID. Linear is an
> explicit declaration of the layout; INVALID (i.e. no modifier) means
> 'I don't know what this is, so you should guess'. Guessing is
> obviously not reliable, so Weston only passes buffers with no modifier
> to KMS in two cases. The first case is when we allocate a dumb buffer
> and the driver does not support modifiers; this is safe since it's the
> same driver. The second case is when either the GPU driver or KMS
> driver do not support modifiers and we allocate a buffer via GBM with
> USE_SCANOUT; in this case, it is GBM's responsibility to select the
> 'right' layout.
> 
> We will never create a DRM framebuffer with no modifiers when the
> original buffer comes from a client. If the client does not support
> modifiers but the KMS driver does, then we do not know that the client
> has allocated a suitable layout, so this is not safe. If the client
> does explicitly declare a modifier but the KMS driver does not support
> modifiers, then we also do not know that this is safe to use. So
> unless both sides (client/GPU and KMS) support modifiers, we do not do
> direct scanout from client buffers.
> 
> This patch would enable this usecase by declaring support for the
> linear modifier from KMS; when used with a PVR driver which explicitly
> declares the linear modifier, we know it is safe to pass that client
> buffer to KMS.
> 
> Laurent's concern is that the DRM core should handle this rather than
> open-coding in every driver, which I agree with. Some drivers (e.g.
> radeon, maybe legacy NV?) do not support modifiers, and _also_ do
> magic inference of the actual layout of the underlying buffer.
> However, these drivers are legacy and we do not accept any new
> addition of inferring layout without modifiers.
> 
> I think the best way forward here is:
>   - add a new mode_config.cannot_support_modifiers flag, and enable
> this in radeon (plus any other drivers in the same boat)

Is there an easy way to identify the drivers that need this ?

>   - change drm_universal_plane_init() to advertise the LINEAR modifier
> when NULL is passed as the modifier list (including installing a
> default .format_mod_supported hook)
>   - remove the mode_config.allow_fb_modifiers hook and always
> advertise modifier support, unless
> mode_config.cannot_support_modifiers is set

Looks good to me.

> FWIW, the effective modifier API and also valid usage is documented
> here, which should be finished and merged shortly:
>     https://lore.kernel.org/dri-devel/20210905122742.86029-1-daniels@collabora.com/

-- 
Regards,

Laurent Pinchart
