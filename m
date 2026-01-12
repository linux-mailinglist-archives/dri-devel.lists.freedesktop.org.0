Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BCB0D14222
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jan 2026 17:45:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F42310E210;
	Mon, 12 Jan 2026 16:45:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="Pc/RSIN9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A550410E210
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jan 2026 16:45:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1768236315;
 bh=0sxm3kDDzgJmwS8ewdPqvTDhvUSiRdHGqlzFqGWGru0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Pc/RSIN9wiADI9+wlqBLwrafhEWw+fn3LIKM4n7vS7xjoQ2dWS2RtNLDF2q3tyh3L
 Bi/Hh7tSEzxoMaLedT/vwykdqCGYiiP8gXyMNeY+l5bc2GP5DoaxR2+gRljwNyS3in
 hSmH7LthJ0a14O4WySukF2kIMzg/4e/dCcmj3A7A1RZYbr7OawO9RUkx7ki1FRJ7Ov
 82jv2SZxnA6R6DddiXW+eZXzyC/NYaBGEYWg3pErjfOoCmD5FvXzTzQU2SKN6h5633
 Z6BzEM1VZvGJFkwCzbkHDfZMYmmyqkMSyVk6kz2khL8RbS8+XI/jT+24/wdj6l51ly
 1OxBNiA72JJyg==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 6774017E0699;
 Mon, 12 Jan 2026 17:45:14 +0100 (CET)
Date: Mon, 12 Jan 2026 17:45:07 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Steven Price <steven.price@arm.com>
Cc: Liviu Dudau <liviu.dudau@arm.com>, =?UTF-8?B?QWRyacOhbg==?= Larumbe
 <adrian.larumbe@collabora.com>, dri-devel@lists.freedesktop.org, David
 Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Akash Goel
 <akash.goel@arm.com>, Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul
 <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>, Akhil P Oommen
 <akhilpo@oss.qualcomm.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Dmitry Osipenko
 <dmitry.osipenko@collabora.com>, Chris Diamand <chris.diamand@arm.com>,
 Danilo Krummrich <dakr@kernel.org>, Matthew Brost
 <matthew.brost@intel.com>, Thomas =?UTF-8?B?SGVsbHN0csO2bQ==?=
 <thomas.hellstrom@linux.intel.com>, Alice Ryhl <aliceryhl@google.com>,
 kernel@collabora.com
Subject: Re: [PATCH v1 5/9] drm/panthor: Part ways with drm_gem_shmem_object
Message-ID: <20260112174507.1ef006b9@fedora>
In-Reply-To: <00c89251-5d2e-4a50-a99b-cf09cde85264@arm.com>
References: <20260109130801.1239558-1-boris.brezillon@collabora.com>
 <20260109130801.1239558-6-boris.brezillon@collabora.com>
 <f55ecaa7-0695-4cdc-94f4-4769e1b72bb0@arm.com>
 <20260112151714.4461d045@fedora>
 <00c89251-5d2e-4a50-a99b-cf09cde85264@arm.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Mon, 12 Jan 2026 16:03:18 +0000
Steven Price <steven.price@arm.com> wrote:

> On 12/01/2026 14:17, Boris Brezillon wrote:
> > On Mon, 12 Jan 2026 12:06:17 +0000
> > Steven Price <steven.price@arm.com> wrote:
> >   
> >> On 09/01/2026 13:07, Boris Brezillon wrote:  
> >>> While drm_gem_shmem_object does most of the job we need it to do, the
> >>> way sub-resources (pages, sgt, vmap) are handled and their lifetimes
> >>> gets in the way of BO reclaim. There has been attempts to address
> >>> that [1], but in the meantime, new gem_shmem users were introduced
> >>> (accel drivers), and some of them manually free some of these resources.
> >>> This makes things harder to control/sanitize/validate.
> >>>
> >>> Thomas Zimmerman is not a huge fan of enforcing lifetimes of sub-resources
> >>> and forcing gem_shmem users to go through new gem_shmem helpers when they
> >>> need manual control of some sort, and I believe this is a dead end if
> >>> we don't force users to follow some stricter rules through carefully
> >>> designed helpers, because there will always be one user doing crazy things
> >>> with gem_shmem_object internals, which ends up tripping out the common
> >>> helpers when they are called.
> >>>
> >>> The consensus we reached was that we would be better off forking
> >>> gem_shmem in panthor. So here we are, parting ways with gem_shmem. The
> >>> current transition tries to minimize the changes, but there are still
> >>> some aspects that are different, the main one being that we no longer
> >>> have a pages_use_count, and pages stays around until the GEM object is
> >>> destroyed (or when evicted once we've added a shrinker). The sgt also
> >>> no longer retains pages. This is losely based on how msm does things by
> >>> the way.    
> >>
> >> From a reviewing perspective it's a little tricky trying to match up the
> >> implementation to shmem because of these changes. I don't know how
> >> difficult it would be to split the changes to a patch which literally
> >> copies (with renames) from shmem, followed by simplifying out the parts
> >> we don't want.  
> > 
> > It's a bit annoying as the new implementation is not based on shmem at
> > all, but if you think it helps the review, I can try what you're
> > suggesting. I mean, I'm not convinced it will be significantly easier
> > to review with this extra step, since the new logic is different enough
> > (especially when it comes to resource refcounting) that it needs a
> > careful review anyway (which you started doing here).  
> 
> I wasn't sure how much you had originally based it on shmem. I noticed
> some comments were copied over and in some places it was easy to match
> up. But in others it's much less clear.
> 
> If you haven't actually started from a direct copy of shmem then it's
> probably not going to be much clearer doing that as an extra step. It's
> just in places it looked like you had.

The reason both look similar has more to do with the fact they both
use shmem for their memory allocation than one being a copy of the
other. That's not to say I didn't pick bits and pieces here and there
(including comments), but it didn't start as a full copy followed by
incremental modifications.

> >>  
> >>> +	}
> >>> +
> >>> +	return 0;
> >>> +}
> >>> +
> >>> +static int panthor_gem_backing_pin_locked(struct panthor_gem_object *bo)
> >>> +{
> >>> +	int ret;
> >>> +
> >>> +	dma_resv_assert_held(bo->base.resv);
> >>> +	drm_WARN_ON_ONCE(bo->base.dev, drm_gem_is_imported(&bo->base));
> >>> +
> >>> +	if (refcount_inc_not_zero(&bo->backing.pin_count))
> >>> +		return 0;
> >>> +
> >>> +	ret = panthor_gem_backing_get_pages_locked(bo);
> >>> +	if (!ret)
> >>> +		refcount_set(&bo->backing.pin_count, 1);
> >>> +
> >>> +	return ret;
> >>> +}
> >>> +
> >>> +static void panthor_gem_backing_unpin_locked(struct panthor_gem_object *bo)
> >>> +{
> >>> +	dma_resv_assert_held(bo->base.resv);
> >>> +	drm_WARN_ON_ONCE(bo->base.dev, drm_gem_is_imported(&bo->base));
> >>> +
> >>> +	/* We don't release anything when pin_count drops to zero.
> >>> +	 * Pages stay there until an explicit cleanup is requested.
> >>> +	 */
> >>> +	if (!refcount_dec_not_one(&bo->backing.pin_count))
> >>> +		refcount_set(&bo->backing.pin_count, 0);    
> >>
> >> Why not just refcount_dec()?  
> > 
> > Because refcount_dec() complains when it's passed a value that's less
> > than 2. The rational being that you need to do something special
> > (release resources) when you reach zero. In our case we don't, because
> > pages are lazily reclaimed, so we just set the counter back to zero.  
> 
> Ah, yes I'd misread the "old <= 1" check as "old < 1". Hmm, I dislike it
> because it's breaking the atomicity - if another thread does a increment
> between the two operations then we lose a reference count.

I don't think we do, because any 0 <-> 1 transition needs to happen
with the resv lock held (see the dma_resv_assert_held() in both
panthor_gem_backing_unpin_locked() and
panthor_gem_backing_pin_locked()).

> 
> It does make me think that perhaps the refcount APIs are not designed
> for this case and perhaps we should just use atomics directly.

It's the lazy/deferred put_pages() that makes it look weird I think,
but for the rest, refcount_t looks like the right tool (!locked variants
and even _pin_locked() look sane).
