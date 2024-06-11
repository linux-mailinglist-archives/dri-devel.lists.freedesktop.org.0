Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 864F5903DA6
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jun 2024 15:39:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BBFB10E658;
	Tue, 11 Jun 2024 13:39:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dV2EcTz6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBE2A10E654;
 Tue, 11 Jun 2024 13:39:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718113175; x=1749649175;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=SHwuFHzzuuY/Z4NVxhj+TjLfZsXMqwNT+yZ7Pw0xkQ4=;
 b=dV2EcTz6DqcsDNee0VVXBrYx6rLVDHQUwQTnGQzoH+PEJ7hLMkT4EspP
 j3t8UrdvO1mDIBZ1QESiqH3N2suBLyy1wm3j/GA3oIOKJ7mrdqmuwN94a
 0l2i3i8VYH+0h47mprdELEEei8lqZzVIDriT0x0hjY+rOUQkX831kAb/4
 FGU4owAs+aqts9L6OgeuyTjV53MpZ+Lt74YYJ0Ba47aA1qmFUkYEq4Z2X
 u8Izjl15tpnlGkWWH3VfeqYBrYPGE0Gu3J4hPi9WqLZceyvEaQ6bnOwWj
 LEEp2UYjQq6qWBwnUBKW1v8gno/MpyIhiUvu69RnjdDonYJ4qYgHucvO+ A==;
X-CSE-ConnectionGUID: G4Dt85E1Rg+TTkHA9/0mgg==
X-CSE-MsgGUID: Fz593zY0SrGcx4EUclUtUA==
X-IronPort-AV: E=McAfee;i="6600,9927,11099"; a="25495680"
X-IronPort-AV: E=Sophos;i="6.08,230,1712646000"; d="scan'208";a="25495680"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2024 06:32:04 -0700
X-CSE-ConnectionGUID: Lo+7YCVNTAWxXNdxeSRLVg==
X-CSE-MsgGUID: +11mErGHS7aByOpCpVDqtQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,230,1712646000"; d="scan'208";a="76901248"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.245.246.250])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2024 06:32:01 -0700
Date: Tue, 11 Jun 2024 15:31:57 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Andi Shyti <andi.shyti@linux.intel.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 John Harrison <John.C.Harrison@intel.com>,
 Andi Shyti <andi.shyti@kernel.org>,
 Matthew Brost <matthew.brost@intel.com>, stable@vger.kernel.org
Subject: Re: [PATCH] drm/i915/gt/uc: Evaluate GuC priority within locks
Message-ID: <ZmhRzRa9axjlaIl3@ashyti-mobl2.lan>
References: <20240606001702.59005-1-andi.shyti@linux.intel.com>
 <185a4d70-4f1b-4b95-acc2-d2e26cb0052b@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <185a4d70-4f1b-4b95-acc2-d2e26cb0052b@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Daniele,

thanks for checking this patch.

> > diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> > index 0eaa1064242c..1181043bc5e9 100644
> > --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> > +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> > @@ -4267,13 +4267,18 @@ static void guc_bump_inflight_request_prio(struct i915_request *rq,
> >   	u8 new_guc_prio = map_i915_prio_to_guc_prio(prio);
> >   	/* Short circuit function */
> > -	if (prio < I915_PRIORITY_NORMAL ||
> > -	    rq->guc_prio == GUC_PRIO_FINI ||
> > -	    (rq->guc_prio != GUC_PRIO_INIT &&
> > -	     !new_guc_prio_higher(rq->guc_prio, new_guc_prio)))
> > +	if (prio < I915_PRIORITY_NORMAL)
> >   		return;
> 
> My understanding was that those checks are purposely done outside of the
> lock to avoid taking it when not needed and that the early exit is not racy.
> In particular:
> 
> - GUC_PRIO_FINI is the end state for the priority, so if we're there that's
> not changing anymore and therefore the lock is not required.

yeah... then I thought that the lock should either remove it
completely or have everything inside the lock.

> - the priority only goes up with the bumping, so if new_guc_prio_higher() is
> false that's not going to be changed by a different thread running at the
> same time and increasing the priority even more.
> 
> I think there is still a possible race is if new_guc_prio_higher() is true
> when we check it outside the lock but then changes before we execute the
> protected chunk inside, so a fix would still be required for that.

This is the reason why I made the patch :-)

> All this said, I don't really have anything against moving the whole thing
> inside the lock since this isn't on a critical path, just wanted to point
> out that it's not all strictly required.
> 
> One nit on the code below.
> 
> >   	spin_lock(&ce->guc_state.lock);
> > +
> > +	if (rq->guc_prio == GUC_PRIO_FINI)
> > +		goto exit;
> > +
> > +	if (rq->guc_prio != GUC_PRIO_INIT &&
> > +	    !new_guc_prio_higher(rq->guc_prio, new_guc_prio))
> > +		goto exit;
> > +
> >   	if (rq->guc_prio != GUC_PRIO_FINI) {
> 
> You're now checking for rq->guc_prio == GUC_PRIO_FINI inside the lock, so no
> need to check it again here as it can't have changed.

True, will resend.

Thanks, Daniele!

Andi
