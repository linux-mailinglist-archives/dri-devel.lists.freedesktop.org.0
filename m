Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7724534934
	for <lists+dri-devel@lfdr.de>; Thu, 26 May 2022 05:15:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68E4B10E0F2;
	Thu, 26 May 2022 03:15:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9A4010E0A4;
 Thu, 26 May 2022 03:15:52 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 i82-20020a1c3b55000000b003974edd7c56so1827214wma.2; 
 Wed, 25 May 2022 20:15:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=eGeMotmHD5kcwokKadCBWqHPNlO0Qvs0CVZPqUnOIwU=;
 b=STPbaruw09QCXES5FDI15P7EnfhRJv83ICkhIygnvPTFFztNE3QMp+2HkzKr0MHCCL
 vA13P4G9M+1adv/QOdjA4zKguI6NfBb99Puhm/tqNrB5bbfpnVqbXcxKrH+kH32KOrFo
 HMFF7e4t//YJWSQez1Oune1sW8RhYrJZ1/DAvNr9nAFb5N2QrdmPgaD1/51V2R3Oc2M5
 4JSjqZQAsd+Ss3GDdMJoEPIuDNkdvFOzpc222fcM/EhXyoxrHdZl+bcrqKhb3IoHjjmk
 XQfHM6d95nts0V5Lo5/Zn7+uX+M0Qq1/53NK5LM62BqbRnif39q/O+EM7n0+iU8ahDcW
 4MZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eGeMotmHD5kcwokKadCBWqHPNlO0Qvs0CVZPqUnOIwU=;
 b=rXIrd/fnM0w3VYq9Tbids5VswQTnybuxfk89wo1Gh4vi0JVWeuZ06l5qay7CG5bG8K
 X2D/en6Tehk40NJaL4if1pdcwtqorOBlTx1bEye5t+J4iaaop8aiMsw7iJ6w/GBx/jtk
 e3U43GGUfo0HE4u/OcthEvfMkyKyphTQnyIzqWAUhjt95LOFzd/QZngUdAH3iA55A95i
 5UA2A2bNSm5z/rDoOGt9vmc+J3swgNJ0npWeBIJ/lyPnwnoCitEOfeel0um0DUlS4X94
 rgyOw/UD9LWlPebWP3q6l1/i6ADoW45vY4C2ds3K53KqMZ678+HElBbcDR2yx65r+hY/
 AecA==
X-Gm-Message-State: AOAM5317PvrgpRRFaPzrFjQVPrc8p3WdKnViYimPujcDAcgXQg2Q3qWw
 exo5jSAVGGV9JXWfDWLgz/OUnGZB+8wSm9CDMV8=
X-Google-Smtp-Source: ABdhPJxM/y4CWGrksx4gNScQ00GELDhe/3yND60YFdXQhe2SiNRzSPQjRttu0dMdsWj00S1f+XPDEvscDu7F5r9UUA0=
X-Received: by 2002:a05:600c:3843:b0:397:476f:ceb8 with SMTP id
 s3-20020a05600c384300b00397476fceb8mr234025wmr.200.1653534950360; Wed, 25 May
 2022 20:15:50 -0700 (PDT)
MIME-Version: 1.0
References: <20210728010632.2633470-1-robdclark@gmail.com>
 <20210728010632.2633470-13-robdclark@gmail.com>
 <84e03c5f-a3af-6592-d19a-a2f5d20b92fb@linux.intel.com>
 <CAJs_Fx6Nc337LPNh=p2GT2d2yDTdLWH934o4Cof3urDGhUJB6A@mail.gmail.com>
 <904ae104-1c30-d130-129f-ccae381261d5@linux.intel.com>
 <CAF6AEGuVhXuX63Od+kcJ0QtfAZ2-wqZsN0KOuEzKbivJdouzog@mail.gmail.com>
 <1972f50b-d71a-9e2e-d10b-cc4f13bb208f@linux.intel.com>
In-Reply-To: <1972f50b-d71a-9e2e-d10b-cc4f13bb208f@linux.intel.com>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 25 May 2022 20:15:47 -0700
Message-ID: <CAF6AEGsvmQYjzoFgEMTer3oDmb62y2Hq_unDbq2UEoZ6CA3CSw@mail.gmail.com>
Subject: Re: [PATCH v4 12/13] drm/msm: Utilize gpu scheduler priorities
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Rob Clark <robdclark@chromium.org>,
 Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 Jonathan Marek <jonathan@marek.ca>, David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Sharat Masetty <smasetty@codeaurora.org>,
 Akhil P Oommen <akhilpo@codeaurora.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>, Sean Paul <sean@poorly.run>,
 freedreno <freedreno@lists.freedesktop.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 open list <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, May 25, 2022 at 9:11 AM Tvrtko Ursulin
<tvrtko.ursulin@linux.intel.com> wrote:
>
>
> On 24/05/2022 15:57, Rob Clark wrote:
> > On Tue, May 24, 2022 at 6:45 AM Tvrtko Ursulin
> > <tvrtko.ursulin@linux.intel.com> wrote:
> >>
> >> On 23/05/2022 23:53, Rob Clark wrote:
> >>>
> >>> btw, one fun (but unrelated) issue I'm hitting with scheduler... I'm
> >>> trying to add an igt test to stress shrinker/eviction, similar to the
> >>> existing tests/i915/gem_shrink.c.  But we hit an unfortunate
> >>> combination of circumstances:
> >>> 1. Pinning memory happens in the synchronous part of the submit ioctl,
> >>> before enqueuing the job for the kthread to handle.
> >>> 2. The first run_job() callback incurs a slight delay (~1.5ms) while
> >>> resuming the GPU
> >>> 3. Because of that delay, userspace has a chance to queue up enough
> >>> more jobs to require locking/pinning more than the available system
> >>> RAM..
> >>
> >> Is that one or multiple threads submitting jobs?
> >
> > In this case multiple.. but I think it could also happen with a single
> > thread (provided it didn't stall on a fence, directly or indirectly,
> > from an earlier submit), because of how resume and actual job
> > submission happens from scheduler kthread.
> >
> >>> I'm not sure if we want a way to prevent userspace from getting *too*
> >>> far ahead of the kthread.  Or maybe at some point the shrinker should
> >>> sleep on non-idle buffers?
> >>
> >> On the direct reclaim path when invoked from the submit ioctl? In i915
> >> we only shrink idle objects on direct reclaim and leave active ones for
> >> the swapper. It depends on how your locking looks like whether you could
> >> do them, whether there would be coupling of locks and fs-reclaim context.
> >
> > I think the locking is more or less ok, although lockdep is unhappy
> > about one thing[1] which is I think a false warning (ie. not
> > recognizing that we'd already successfully acquired the obj lock via
> > trylock).  We can already reclaim idle bo's in this path.  But the
> > problem with a bunch of submits queued up in the scheduler, is that
> > they are already considered pinned and active.  So at some point we
> > need to sleep (hopefully interruptabley) until they are no longer
> > active, ie. to throttle userspace trying to shove in more submits
> > until some of the enqueued ones have a chance to run and complete.
>
> Odd I did not think trylock could trigger that. Looking at your code it
> indeed seems two trylocks. I am pretty sure we use the same trylock
> trick to avoid it. I am confused..

The sequence is,

1. kref_get_unless_zero()
2. trylock, which succeeds
3. attempt to evict or purge (which may or may not have succeeded)
4. unlock

 ... meanwhile this has raced with submit (aka execbuf) finishing and
retiring and dropping *other* remaining reference to bo...

5. drm_gem_object_put() which triggers drm_gem_object_free()
6. in our free path we acquire the obj lock again and then drop it.
Which arguably is unnecessary and only serves to satisfy some
GEM_WARN_ON(!msm_gem_is_locked(obj)) in code paths that are also used
elsewhere

lockdep doesn't realize the previously successful trylock+unlock
sequence so it assumes that the code that triggered recursion into
shrinker could be holding the objects lock.

>
> Otherwise if you can afford to sleep you can of course throttle
> organically via direct reclaim. Unless I am forgetting some key gotcha -
> it's been a while I've been active in this area.

So, one thing that is awkward about sleeping in this path is that
there is no way to propagate back -EINTR, so we end up doing an
uninterruptible sleep in something that could be called indirectly
from userspace syscall.. i915 seems to deal with this by limiting it
to shrinker being called from kswapd.  I think in the shrinker we want
to know whether it is ok to sleep (ie. not syscall trigggered
codepath, and whether we are under enough memory pressure to justify
sleeping).  For the syscall path, I'm playing with something that lets
me pass __GFP_RETRY_MAYFAIL | __GFP_NOWARN to
shmem_read_mapping_page_gfp(), and then stall after the shrinker has
failed, somewhere where we can make it interruptable.  Ofc, that
doesn't help with all the other random memory allocations which can
fail, so not sure if it will turn out to be a good approach or not.
But I guess pinning the GEM bo's is the single biggest potential
consumer of pages in the submit path, so maybe it will be better than
nothing.

BR,
-R

>
> Regards,
>
> Tvrtko
>
> >
> > BR,
> > -R
> >
> > [1] https://gitlab.freedesktop.org/drm/msm/-/issues/14
> >
