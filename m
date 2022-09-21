Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 766445BFC2B
	for <lists+dri-devel@lfdr.de>; Wed, 21 Sep 2022 12:19:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC52F89289;
	Wed, 21 Sep 2022 10:19:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64DDF89289
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Sep 2022 10:19:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663755544; x=1695291544;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=V9pNNXDgoRkNTxBw+8El8DcNlLwo7rLWGRxDzaXuHvA=;
 b=BYoj7vMTubrNZ1LhH192yfCjrEzzUOJ9cPiY124elYMneNOz+tNm9UEk
 TF+gUSo6NxJuNTsTjrp2KOzwxDTVjlTf5vQT6YTmwDTZR8G457ygwjnWc
 gpH6wEKeP1x5uWlmhV2JKmXmOkGDS+NlJYU1oeeafwwhylYyH1WfRUrIq
 5QEl8hvx32h3kTv57L+t2b9DQe0tjYK5hDRnY46aPlbNGr+Crf62UTwHc
 xwJTMN4HwmUwMzpldhFUDjS0qaumJw+sRVUB4S6eov9YQdyExO7as6/TP
 C+UgPNdjP5y8GTs6GRYR5WFtglEI5nKd485a5ORXkz89foeC33hhRCDu5 A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10476"; a="386247112"
X-IronPort-AV: E=Sophos;i="5.93,333,1654585200"; d="scan'208";a="386247112"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2022 03:19:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,333,1654585200"; d="scan'208";a="649996951"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.191])
 by orsmga008.jf.intel.com with SMTP; 21 Sep 2022 03:19:00 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 21 Sep 2022 13:18:59 +0300
Date: Wed, 21 Sep 2022 13:18:59 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 4/5] drm/damage-helper: Do partial updates if framebuffer
 has not been changed
Message-ID: <YyrlE22J4JT6bDu5@intel.com>
References: <20220920135619.9209-1-tzimmermann@suse.de>
 <20220920135619.9209-5-tzimmermann@suse.de>
 <YynOvpMGbVKWiO8p@intel.com>
 <92ae6ffe-9fdd-35bb-48d0-a7cfe221282a@suse.de>
 <YyrNXSoZJdidfF0T@intel.com>
 <17203390-af02-0934-9d9f-df68be78c3a4@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <17203390-af02-0934-9d9f-df68be78c3a4@suse.de>
X-Patchwork-Hint: comment
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
Cc: airlied@linux.ie, drawat.floss@gmail.com, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Sep 21, 2022 at 11:39:51AM +0200, Thomas Zimmermann wrote:
> Hi
> 
> Am 21.09.22 um 10:37 schrieb Ville Syrjälä:
> > On Wed, Sep 21, 2022 at 09:59:10AM +0200, Thomas Zimmermann wrote:
> >> Hi Ville
> >>
> >> Am 20.09.22 um 16:31 schrieb Ville Syrjälä:
> >>> On Tue, Sep 20, 2022 at 03:56:18PM +0200, Thomas Zimmermann wrote:
> >>>> Set partial updates on a plane if the framebuffer has not been changed
> >>>> on an atomic commit. If such a plane has damage clips, the driver will
> >>>> use them; otherwise the update is effectively empty. Planes that change
> >>>> their framebuffer still perform a full update.
> >>>
> >>> I have a feeling you're sort of papering over some inefficient
> >>> userspace that's asking updates on planes that don't actually
> >>> need them. I'm not sure adding more code for that is a particularly
> >>> great idea. Wouldn't it be better to just fix the userspace code?
> >>
> >> Some more context might be in order:
> >>
> >> The ast driver currently uses VRAM helpers, which leads to many
> >> problems; including blank screens from the low amount of video memory.
> >> The best solution is to switch SHMEM with BOs on system meory. The video
> >> memory is only the internal buffer for scanout. This update involves a
> >> mempcy from the BO to video memory.
> >>
> >> Ast's hardware is really slow, so it makes sense to reduce the updates
> >> to video memory to a minimum. There's support for cursor planes, which
> >> really makes a difference here.
> >>
> >> But doing any cursor-plane update (e.g., moving, animation) with SHMEM
> >> and the current damage helpers always results in a full-screen memcpy
> >> from the BO to the video memory for the primary plane. As the ast
> >> hardware is slow, performance goes down to a an estimated 5 frame per
> >> seconds. After moving the mouse, one can watch the mouse cursor follow
> >> along the screen for the next seconds. Userspace sends the movement
> >> information and DRM slowly processes them. The same can be observed for
> >> cursor animation.
> >>
> >> The problem is that each change to the cursor plane results in an
> >> atomic_update call for the primary plane. Not having damage information
> >> for the plane just means 'update everything'. Not a problem if redrawing
> >> consists of reprogramming the scanout address. For a memcpy it's not
> >> feasible.
> >>
> >> So can this be fixed in userspace? No realistically IMHO. I've seen this
> >> problem on Weston, Wayland-Gnome and X11-Gnome. And they are all
> >> problematic in their own way. (That's why there are multiple patches
> >> needed.) For example, X11 uses the legacy mouse ioctl, which one of the
> >> patches fixes. The other userspace needs the other heuristics. A
> >> potential userspace fix would mean to always set empty-damage
> >> information on all planes that don't get an update. And I don't consider
> >> X11 fixable TBH.
> >>
> >>>
> >>> Any property change on the plane could need a full plane
> >>> update as well (eg. some color mangement stuff etc.). So you'd
> >>> have to keep adding exceptions to that list whenever new
> >>> properties are added.
> >>
> >> It's not about the occasional change of a property. It's the constant
> >> sluggish redraw when the interface is supposed to be snappy, such as
> >> mouse interaction.
> >>
> >>>
> >>> And I think the semantics of the ioctl(s) has so far been that
> >>> basically any page flip (whether or not it actually changes
> >>> the fb) still ends up doing whatever flushing is needed to
> >>> guarantee the fb contents are up to date on the screen (if
> >>> someone sneaked in some front buffer rendering in between).
> >>> Ie. you could even use basically a nop page flip in place
> >>> of dirtyfb.
> >>
> >> That's why full updates are still the default. Only in cases where it's
> >> save to avoid an update of unaffected planes, we do so.
> > 
> > Umm. Maybe I misread the patch in my haste but it seemed
> > that you consider the thing undamaged if the fb pointer
> > was unchanged. That goes against what I wrote above.
> 
> I try to resolve that in patch 5. The fb_dirty flag signals that the 
> framebuffer's content changed in some way. Patches 4 and 5 could be seen 
> as one change, but that might overload the resulting patch. (Maybe it's 
> not well designed overall. :/)
> 
> > 
> > Though I don't really know if a there is software relying on
> > that behaviuor. I suppose one idea could be to keep that
> > behaviour for the legacy ioctls but not for atomic. Ee. any
> > fb directly specified in a legacy setcrtc/setplane/pageflip
> > is always considered fully damaged. But including an the same
> 
> Assuming the specified fb to be damaged seems like a non-issue to me.
> 
> The problem is with the other framebuffers: if userspace sends us a 
> CURSOR_MOVE ioctl, we can safely assume the cursor fb to be damaged. But 
> we don't want the primary plane's fb to be damaged. Or else we'd redraw 
> the full primary plane.
> 
> 
> > fb in the atomic ioctl does not imply damage. That would
> > mean atomic has to rely on specifying damage explicitly, and
> > any userspace that doesn't do that will be broken.
> 
> The problem again is not in the damage information on planes that 
> legitimately need a redraw. It's all the other planes that are being 
> redrawn as well. Or is there some scenario that I don't see?

I thought we're talking about eg. a cursor update that also
includes the primary plane because apparently userspace is lazy.

I think what you're saying is that currently there is no
damage information for the primary plane so you're attempting
to infer it based on whether the fb property changed or not.

And what I was saying is that IIRC historically specifying
the same fb again has still implied full damage. Changing
that behaviour may or may not break exising userspace.

> 
> > 
> > Or we could introduce a client cap for it I guess, but that
> > would require (minimal) userspace changes.
> > 
> >>
> >> I know that we don't give performance guarantees to userspace. But using
> >> cursor/overlay planes should be faster then not using them. I think
> >> that's a reasonable assumption for userspace to make.
> >>
> >>>
> >>> Another thing the ioctls have always done is actually perform
> >>> the commit whether anything changed or nor. That is, they
> >>> still do all the same the same vblanky stuff and the commit
> >>> takes the same amount of time. Not sure if your idea is
> >>> to potentially short circuit the entire thing and make it
> >>> take no time at all?
> >>
> >> The patches don't change the overall commit logics. All they do is to
> >> set damage updates to a size of 0 if a plane reliably does not need an
> >> update.
> > 
> > What I gathered is that you seemed to only consider the fb
> > contents as something that needs damage handling. That is not
> > the case for stuff like eDP PSR and DSI command mode displays
> > where we need to upload a new full frame whenever also the
> > non-damaged fb contents would get transformed by the hardware
> > on the way to the remote frambuffer. That would mean any change
> > in eg. scanout coordinates, color management, etc.
> 
> There is support for changing scanout coordinates in 
> drm_atomic_helper_damage_iter_init() in patch 2. In general, maybe the 
> heuristic needs to be stricter to only handle updates that only change 
> damage.
> 
> For now, the problem only happens after converting ast to SHMEM. All the 
> other SHMEM-based drivers use a single plane where the problem doesn't 
> happen; or only reprogram the scanout address, which is fast. If the 
> damage-handling logic imposes problems on other drivers, some of it 
> could possibly be moved into ast itself.

Maybe we have two clearly separate classes of uses case:
1. devices where only damage to the fb contents matter (eg. some kind of
   shadow fb that is the same size as the real fb).
2. devices where everything about the scanout process matters (eg. PSR)
?

Maybe there should be helpers to deal with just the first case,
and then some more helpers (or just driver code) to pile the rest
on top as well when needed?

-- 
Ville Syrjälä
Intel
