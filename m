Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A9F75B5A31
	for <lists+dri-devel@lfdr.de>; Mon, 12 Sep 2022 14:34:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6BCF10E433;
	Mon, 12 Sep 2022 12:34:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B12B810E433
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Sep 2022 12:34:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662986081; x=1694522081;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=XwPatMYrk01yCGY1Bivmbdb6qmd5Rj2Fjyg5GT3ZnWk=;
 b=eFliwqJ69SZ3Wa3WLXHCce7JLoDa/fCmwiVvQorokiOqck3sQuq3v7M/
 K/ScbzWPLcezkyIX9vur5vCP4USF6lcR6taabFuaOm1eubHKJNQzkZtlm
 INd56OqTyOEkWfXZufh6EEGQG+oImv4cIMlHovJar5TVH0OQQrb7FCxOg
 8yLqTkbDQJzEq+34H17Lab/bbJPP5M/Kuw9pfFa8ls0dXpW9GTvH+/dK9
 02XhSjLOAFaQT3zVWILw8GHd7EwEXsJ6//jlbzXA2es9kBy6d8uBdEqCK
 g1/qEvbnBkv7Xt3YCLyKPn4cOA9jdgMsEFmnmIzI7iJBpiisnuucSh1FQ w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10468"; a="280870617"
X-IronPort-AV: E=Sophos;i="5.93,310,1654585200"; d="scan'208";a="280870617"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2022 05:34:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,310,1654585200"; d="scan'208";a="678074172"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.191])
 by fmsmga008.fm.intel.com with SMTP; 12 Sep 2022 05:34:37 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 12 Sep 2022 15:34:37 +0300
Date: Mon, 12 Sep 2022 15:34:37 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH] drm/plane-helper: Add a drm_plane_helper_atomic_check()
 helper
Message-ID: <Yx8nXZnTDEwuPEvP@intel.com>
References: <20220912101522.69482-1-javierm@redhat.com>
 <Yx8Ms2jhgwpiDqA6@intel.com>
 <c6ce4e99-571b-e046-6f03-ab87bd173869@suse.de>
 <Yx8Vo4x7frhbElPq@intel.com>
 <4002a4d6-04cb-b342-952f-b42ef3188df4@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4002a4d6-04cb-b342-952f-b42ef3188df4@suse.de>
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
Cc: David Airlie <airlied@linux.ie>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Sep 12, 2022 at 02:05:36PM +0200, Thomas Zimmermann wrote:
> Hi
> 
> Am 12.09.22 um 13:18 schrieb Ville Syrjälä:
> > On Mon, Sep 12, 2022 at 01:05:45PM +0200, Thomas Zimmermann wrote:
> >> Hi
> >>
> >> Am 12.09.22 um 12:40 schrieb Ville Syrjälä:
> >>> On Mon, Sep 12, 2022 at 12:15:22PM +0200, Javier Martinez Canillas wrote:
> >>>> Provides a default plane state check handler for primary planes that are a
> >>>> fullscreen scanout buffer and whose state scale and position can't change.
> >>>>
> >>>> There are some drivers that duplicate this logic in their helpers, such as
> >>>> simpledrm and ssd130x. Factor out this common code into a plane helper and
> >>>> make drivers use it.
> >>>>
> >>>> Suggested-by: Thomas Zimmermann <tzimmermann@suse.de>
> >>>> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
> >>>> ---
> >>>>
> >>>>    drivers/gpu/drm/drm_plane_helper.c | 29 +++++++++++++++++++++++++++++
> >>>>    drivers/gpu/drm/solomon/ssd130x.c  | 18 +-----------------
> >>>>    drivers/gpu/drm/tiny/simpledrm.c   | 25 +------------------------
> >>>>    include/drm/drm_plane_helper.h     |  2 ++
> >>>>    4 files changed, 33 insertions(+), 41 deletions(-)
> >>>>
> >>>> diff --git a/drivers/gpu/drm/drm_plane_helper.c b/drivers/gpu/drm/drm_plane_helper.c
> >>>> index c7785967f5bf..fb41eee74693 100644
> >>>> --- a/drivers/gpu/drm/drm_plane_helper.c
> >>>> +++ b/drivers/gpu/drm/drm_plane_helper.c
> >>>> @@ -278,3 +278,32 @@ void drm_plane_helper_destroy(struct drm_plane *plane)
> >>>>    	kfree(plane);
> >>>>    }
> >>>>    EXPORT_SYMBOL(drm_plane_helper_destroy);
> >>>> +
> >>>> +/**
> >>>> + * drm_plane_helper_atomic_check() - Helper to check primary planes states
> >>>> + * @plane: plane to check
> >>>> + * @new_state: plane state to check
> >>>
> >>> That is not a plane state. Also should s/new_// since it's just
> >>> the overall atomic state thing rather than some new or old state.
> >>
> >> Using only 'state' is non-intuitive and has lead to bugs where sub-state
> >> was retrieved from the wrong state information. So we've been using
> >> 'new_state' and 'old_state' explicitly in several places now.
> > 
> > There is no old or new drm_atomic_state. It contains both.
> 
> I (vaguely) remember a bug where a driver tried 
> drm_atomic_get_new_plane_state() with the (old) state that's passed to 
> atomic_update. It didn't return the expected results and modesetting 
> gave slightly wrong results. 

As there is no wrong drm_atomic_state to pass I don't think it could
have been the case. 

> So we began to be more precise about new 
> and old. And whatever is stored in 'plane->state' is then just 'the state'.

There were certainly a lot of confusion before the explicit new/old
state stuff was added whether foo->state/etc. was the old or the
new state. And labeling things as explicitly old vs. new when passing
in individual object states certainly makes sense. But that doesn't
really have anything to do with mislabeling the overall drm_atomic_state.

> 
> I understand that the semantics of atomic_check are different from 
> atomic_update, but it still doesn't hurt to talk of new_state IMHO.

IMO it's just confusing. Makes the reader think there is somehow
different drm_atomic_states for old vs. new states when there isn't.
I also wouldn't call it new_state for .atomic_update() either.

In both cases you have the old and new states in there and how
exactly they get used in the hooks is more of an implementation
detail. The only rules you would have to follow is that at the
end of .atomic_update() the hardware state matches the new state,
and .atomic_check() makes sure the transition from the old to the
new state is possible.

I've proposed renaming drm_atomic_state to eg. drm_atomic_transaction
a few times before but no one took the bait so far...

-- 
Ville Syrjälä
Intel
