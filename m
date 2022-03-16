Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 646BA4DAE9B
	for <lists+dri-devel@lfdr.de>; Wed, 16 Mar 2022 12:01:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CB0210E64F;
	Wed, 16 Mar 2022 11:01:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E48AE10E64F
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Mar 2022 11:01:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647428487; x=1678964487;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=6ZX+rPq9AqlrVu86TK6oN1TCm8C0AgZGtHJrxC4/0HA=;
 b=lMaNmKII1R1CVfFVfwU31+doVU7B7JzPOA+dSkhSKL9Ymag9owTcu1Tr
 w8BAjW2UvBANLjmpKQtOVr34YMNDNKkyL+gd39fOdc1jVYidt+TqwBz/a
 pKCRzDPmEV0nQrEwWJkRUx1y8yUiwdE3pHcQ/EzaWXX7Flh0Hz1/OMlOa
 aeccdT/mYTgoFHHCKig9xiDT5CbUsKm7Cou5+ZidLy7D1CeiGyVUnGNOa
 LpJI8lBZeU9IPZdJR2DTn9PpYq5uxpVNgJx8M9/rKwdT9PzqF6VPwq+oc
 1cV/WyIMbEs9zny1sGbCcljBhLxLyJh5rqe9qumSTu1GrYovczr+t1wdp w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10286"; a="256738804"
X-IronPort-AV: E=Sophos;i="5.90,186,1643702400"; d="scan'208";a="256738804"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2022 04:01:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,186,1643702400"; d="scan'208";a="512974912"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.151])
 by orsmga002.jf.intel.com with SMTP; 16 Mar 2022 04:01:24 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 16 Mar 2022 13:01:23 +0200
Date: Wed, 16 Mar 2022 13:01:23 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Lyude Paul <lyude@redhat.com>
Subject: Re: Parallel modesets and private state objects broken, where to go
 with MST?
Message-ID: <YjHDg3WTYgMDOzLF@intel.com>
References: <3c8a7bec021ba663cc0a55bdedb7030a555457dd.camel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3c8a7bec021ba663cc0a55bdedb7030a555457dd.camel@redhat.com>
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
Cc: Daniel Vetter <daniel.vetter@intel.com>, Maxime Ripard <maxime@cerno.tech>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Mar 14, 2022 at 06:16:36PM -0400, Lyude Paul wrote:
> Hi! First a little bit of background: I've recently been trying to get rid of
> all of the non-atomic payload bandwidth management code in the MST helpers in
> order to make it easier to implement DSC and fallback link rate retraining
> support down the line. Currently bandwidth information is stored in two
> places, partially in the MST atomic state and partially in the mst manager's
> payload table (which exists outside of the atomic state and has its own
> locking). The portions in the atomic state are used to try to determine if a
> given display configuration can fit within the given bandwidth limitations
> during the atomic check phase, and are implemented through the use of private
> state objects.
> 
> My current goal has been to move as much of this as possible over to the
> atomic state and entirely get rid of the payload table along with it's locks.
> My main reason for doing this is that it both decomplicates things quite a
> bit, and I'm really also hoping that getting rid of that payload code will
> make it clearer to others how it works - and stop the influx of bandaid
> patches (e.g. adding more and more special cases to MST to fix poorly
> understood issues being hit in one specific driver and nowhere else) that I've
> had to spend way more time then I'd like trying to investigate and review.
> 
> So, the actual problem: following a conversation with Daniel Vetter today I've
> gotten the impression that private modesetting objects are basically just
> broken with parallel modesets? I'm still wrapping my head around all of this
> honestly, but from what I've gathered: CRTC atomic infra knows how to do waits
> in the proper places for when other CRTCs need to be waited on to continue a
> modeset, but there's no such tracking with private objects. If I understand
> this correctly, that means that even if two CRTC modesets require pulling in
> the same private object state for the MST mgr: we're only provided a guarantee
> that the atomic checks pulling in that private object state won't
> concurrently. But when it comes to commits, it doesn't sound like there's any
> actual tracking for this and as such - two CRTC modesets which have both
> pulled in the MST private state object are not prevented from running
> concurrently.
> 
> This unfortunately throws an enormous wrench into the MST atomic conversion
> I've been working on - as I was under the understanding while writing the code
> for this that all objects in an atomic state are blocked from being used in
> any new atomic commits (not checks, as parallel checks should be fine in my
> case) until there's no commits active with said object pulled into the atomic
> state. I certainly am not aware of any way parallel modesetting could actually
> be supported on MST, so it's not really a feature we want to deal with at all
> besides stopping it from happening. This also unfortunately means that the
> current atomic modesetting code we have for MST is potentially broken,
> although I assume we've never hit any real world issues with it because of the
> non-atomic locking we currently have for the payload table.
> 
> So, Daniel had mentioned that supposedly you've been dealing with similar
> issues with VC4 and might have already made progress on coming up with ways to
> deal with it. If this is all correct, I'd definitely appreciate being able to
> take a look at your work on this to see how I can help move things forward.
> I've got a WIP of my atomic only MST branch as well:
> 
> https://gitlab.freedesktop.org/lyudess/linux/-/commits/wip/mst-atomic-only-v1
> 
> However it's very certainly broken right now (it compiles and I had thought it
> worked already, but I realized I totally forgot to come up with a way of doing
> bookkeeping for VC start slots atomically - which is what led me down this
> current rabbit hole), but it should at least give a general idea of what I'm
> trying to do.
> 
> Anyway, let me know what you think.

For MST in particular parallel modeset on the same physical link sounds
pretty crazy to me. Trying to make sure everything happens in the right
order would not be pleasant. I think a simple solution would be just to
add all the crtcs on the affected link to the state and call it a day.

i915 already does that on modern platforms actually because the
hardware architecture kinda needs it. Although we could perhaps
optimize it a bit to skip it in some cases, but not sure the
extra complexity would really be justified.

In i915 we also serialize *all* modesets by running them on a
ordered wq (+ explicit flush_workqueue() to serialize non-blocking
vs. blocking modesets). We did semi-accidentally enable parallel
modesets once but I undid that because there was just way too much
pre-existing code that wasn't even considering the possibility of
a parallel modeset, and I didn't really feel like reviewing the
entire codebase to find all of it.

-- 
Ville Syrjälä
Intel
