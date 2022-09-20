Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B8655BEAAF
	for <lists+dri-devel@lfdr.de>; Tue, 20 Sep 2022 18:01:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D84D10E701;
	Tue, 20 Sep 2022 16:01:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95DC510E700
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Sep 2022 16:01:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663689700; x=1695225700;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=F/WR4PhPPyZpXTtrT1P71fobUva9p2uIPWpSZJchOIw=;
 b=Uhstz184ylfqodwcj/TwUkHzWQyIMCQ3EhqLLl3zg8mEuYw40euAasOs
 Yg5AS58TR7YT4XoK7KRspXqYohDEAgkXMOkAgbYndnnm1HdT9i6FzBCyI
 fKzbIBU3eUBywYFl6exfR4zKLljRmHDcOlxy1GR3T65zbUoC5CLQRpjgR
 3hFbnGyoHzoCIulIyQy7PyS9q3CPXhRe6DJr6OG/cvUQL3+kw8lLsrq2w
 cqDE1FL8EYSVJ/OkhXm394d/kEVwZaKJzFBJixxCOnhijk20+4muXgR3i
 bOIrD5WRrxFaJqzD7ZhwqXX6xeRBeYp2sQ7/snHXdHhh06n1kcFL4Ft6X Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10476"; a="301116124"
X-IronPort-AV: E=Sophos;i="5.93,331,1654585200"; d="scan'208";a="301116124"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2022 09:01:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,331,1654585200"; d="scan'208";a="618963160"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.191])
 by orsmga002.jf.intel.com with SMTP; 20 Sep 2022 09:01:18 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 20 Sep 2022 19:01:18 +0300
Date: Tue, 20 Sep 2022 19:01:18 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Daniel Stone <daniel@fooishbar.org>
Subject: Re: [PATCH 4/5] drm/damage-helper: Do partial updates if framebuffer
 has not been changed
Message-ID: <YynjzjMI+IlJbgpe@intel.com>
References: <20220920135619.9209-1-tzimmermann@suse.de>
 <20220920135619.9209-5-tzimmermann@suse.de>
 <YynOvpMGbVKWiO8p@intel.com>
 <CAPj87rNi0iFuG10qFMc5g=XB94G99aCyOP+D_rJpOMOWrK_QKQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAPj87rNi0iFuG10qFMc5g=XB94G99aCyOP+D_rJpOMOWrK_QKQ@mail.gmail.com>
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
Cc: airlied@linux.ie, drawat.floss@gmail.com, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Sep 20, 2022 at 03:47:39PM +0100, Daniel Stone wrote:
> Hi,
> 
> On Tue, 20 Sept 2022 at 15:31, Ville Syrjälä <ville.syrjala@linux.intel.com>
> wrote:
> 
> > On Tue, Sep 20, 2022 at 03:56:18PM +0200, Thomas Zimmermann wrote:
> > > Set partial updates on a plane if the framebuffer has not been changed
> > > on an atomic commit. If such a plane has damage clips, the driver will
> > > use them; otherwise the update is effectively empty. Planes that change
> > > their framebuffer still perform a full update.
> >
> > I have a feeling you're sort of papering over some inefficient
> > userspace that's asking updates on planes that don't actually
> > need them. I'm not sure adding more code for that is a particularly
> > great idea. Wouldn't it be better to just fix the userspace code?
> >
> 
> I'm not sure why it would need to be 'fixed', when it's never been a
> property of the atomic API that you must minimise updates. Weston does this
> (dumps the full state in every time), and I know we're not the only ones.

Well, we've never tried to minimize in the kernel either, except
for a few special cases that have one of these ad-hoc "foo_changed"
flags. And I think those are more due to "I felt like adding one"
rather than any real overall design goal. We even have one that
is not used at all, except after this patch series (or at least
I think I saw it in there).

We could of course scan a lot more in the kernel to minimize stuff,
but at least I always end up wondering how many joules are being
wasted rescanning things when userspace might have already done
the same thing. Also at some point it just might be cheaper to
blast the hw with the stuff than to meticulously scan through
it all. At least as long as we can't to the 100% short circuit.

Side rant: I'm also not a huge fan of those current foo_changed
flags because their granularity is a bit weird, and dictated by
the core code rather than by the driver specific cost of updating
each property. Eg. color_mgmt_changed cover all of crtc level
color management, but at least for i915 there are both cheap and
expensive things in there. So not sure the current flag really
helps with anything. We do currently use it in i915, but maybe
we should not and just try to look at each property separately
instead.

> 
> 'Fixing' it would require doing a bunch of diffing in userspace, because
> maintaining a delta and trying to unwind that delta across multiple
> TEST_ONLY runs, isn't much fun. It's certainly a far bigger diff than this
> patch.

OK. If userspace doesn't want to do it at all, then maybe
the kernel should do at least a bit of it.

I wonder how far we should take that. In the olden pre-atomic
days i915 even automagically turned off the primary plane when
fully covered by an opaque sprite plane. I presume modern userspace
should at least try to use the available planes efficiently
and that kind of optimizations would be a waste of time?

> 
> > Any property change on the plane could need a full plane
> > update as well (eg. some color mangement stuff etc.). So you'd
> > have to keep adding exceptions to that list whenever new
> > properties are added.
> >
> 
> Eh, it's just a blob ID comparison.

Or some other integer, yes, but someone must remember to add it.
This patch series certainly seems to have forgotten most of it,
so perhaps a slightly shaky start :) OK, sorry bad pun, moving
along...

If we do this in some common code near the uapi level, then
the driver might still have to repeat a bunch of it due to
interactions with other stuff. But I already ranted about
color_mgmt_changed earlier in the mail, I guess this is
more of the same really.

What would make this sort of discussion really 
interesting would be actual power and/or performance
figures given some typical fixed workloads. But that
sounds like a lot of work...

> 
> 
> > And I think the semantics of the ioctl(s) has so far been that
> > basically any page flip (whether or not it actually changes
> > the fb) still ends up doing whatever flushing is needed to
> > guarantee the fb contents are up to date on the screen (if
> > someone sneaked in some front buffer rendering in between).
> > Ie. you could even use basically a nop page flip in place
> > of dirtyfb.
> >
> > Another thing the ioctls have always done is actually perform
> > the commit whether anything changed or nor. That is, they
> > still do all the same the same vblanky stuff and the commit
> > takes the same amount of time. Not sure if your idea is
> > to potentially short circuit the entire thing and make it
> > take no time at all?
> >
> 
> I would expect it to always perform a commit, though.
> 
> Cheers,
> Daniel

-- 
Ville Syrjälä
Intel
