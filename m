Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DE412B866B
	for <lists+dri-devel@lfdr.de>; Wed, 18 Nov 2020 22:15:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7833389C46;
	Wed, 18 Nov 2020 21:15:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AC3889C46
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Nov 2020 21:15:08 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id o15so3597048wru.6
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Nov 2020 13:15:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=tdBzVNnivsrsmumKP2FH1CaDwWIU3L2fph//ZoaedcM=;
 b=QojQSXUOSgk7TRACUs250A5jbyXDGXIlbIHxYTYkJJrlWz+X2mhoV1KGWPTrBZo3ho
 CVu+Sp4y8X/MpiLkuGzkPRgoNxyl7Znge6++VRy8EqZ0WJgX8P5mQJRmHXwXVssqDI++
 nsfBOgzPx68I8rk/TzolQgennHuQAtd96wbYw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=tdBzVNnivsrsmumKP2FH1CaDwWIU3L2fph//ZoaedcM=;
 b=YLdND0TJ1qcehUcg//5hRvLnyQNuiYmz/CWbdNO421lpDBiaIrhlCUmbaP6Z5Dg7Ue
 Z2GGwBXq9LdT/v30msfkFmaHYAmTIWjHulQUGgBTpOHeYa19RESeXYKnowzMXLk0Sbbq
 Y/T3fLsOahGSMnJGO+MF/S2OYCKFvuDvezR5912m5nQyGhe3o9N+W1ynnkfvW8kOKGmS
 Msyo7oDSHQ+jOq9Awk91fqW6bFm2OlcrE+/n2HIgO4fBfyWPUJPNe2IUI+/MrirHLEba
 KXGG/r7SxTrfmIa2C70PUShHCX0b9QwJ0OQCL7o5152CkUCgUcFrqoxiI27xd67Ic1SX
 Ytmg==
X-Gm-Message-State: AOAM533EreSKcrLNTvTi5TGHtoypABL8+3QtU35Qr0u601AP3tgeo3JR
 mrN6VQXxnaFsWpQlwOk4St3lOw==
X-Google-Smtp-Source: ABdhPJx6/huBU7yj9N+WTVitO4SZO39xOURv4xP9/reIsHVdxSUriefO75P8387DEHd6yCG0kCMjDQ==
X-Received: by 2002:adf:d84e:: with SMTP id k14mr6799831wrl.34.1605734106791; 
 Wed, 18 Nov 2020 13:15:06 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id q12sm32809054wrx.86.2020.11.18.13.15.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Nov 2020 13:15:05 -0800 (PST)
Date: Wed, 18 Nov 2020 22:15:04 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: christian.koenig@amd.com
Subject: Re: [PATCH 3/3] drm/ttm: make up to 90% of system memory available
Message-ID: <20201118211504.GY401619@phenom.ffwll.local>
References: <20201117140615.255887-1-christian.koenig@amd.com>
 <20201117140615.255887-3-christian.koenig@amd.com>
 <20201117171900.GM401619@phenom.ffwll.local>
 <9d6980c2-9429-f15c-7424-35e59bfcf063@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9d6980c2-9429-f15c-7424-35e59bfcf063@gmail.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: airlied@linux.ie, Felix.Kuehling@amd.com, sroland@vmware.com,
 dri-devel@lists.freedesktop.org, linux-graphics-maintainer@vmware.com
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Nov 18, 2020 at 02:35:24PM +0100, Christian K=F6nig wrote:
> Am 17.11.20 um 18:19 schrieb Daniel Vetter:
> > On Tue, Nov 17, 2020 at 03:06:15PM +0100, Christian K=F6nig wrote:
> > > Increase the ammount of system memory drivers can use to about 90% of
> > > the total available.
> > > =

> > > Signed-off-by: Christian K=F6nig <christian.koenig@amd.com>
> > > ---
> > >   drivers/gpu/drm/ttm/ttm_bo.c | 2 +-
> > >   1 file changed, 1 insertion(+), 1 deletion(-)
> > > =

> > > diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_b=
o.c
> > > index a958135cb3fe..0a93df93dba4 100644
> > > --- a/drivers/gpu/drm/ttm/ttm_bo.c
> > > +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> > > @@ -1267,7 +1267,7 @@ static int ttm_bo_global_init(void)
> > >   	 * the available system memory.
> > >   	 */
> > >   	num_pages =3D (u64)si.totalram * si.mem_unit;
> > > -	num_pages =3D (num_pages * 50 / 100) >> PAGE_SHIFT;
> > > +	num_pages =3D (num_pages * 90 / 100) >> PAGE_SHIFT;
> > I don't think this is the design we want. As long as it was set at "half
> > of system memory" it was clear that a) it's a hack b) precision didn't
> > matter.
> =

> Yeah, I'm also wondering what to do here exactly. In generally I would
> completely nuke that limit if possible.
> =

> > But if you go to the limit and still want to keep the "we make sure
> > there's no OOM", then precision starts to matter:
> > - memory hotplug and hotunplug is a thing
> > - userspace can mlock, and it's configureable
> > - drivers can pin_user_pages for IO and random other stuff. Some of it =
is
> >    accounted as some subsystem specific mlock (like rdma does iirc), so=
me
> >    is just yolo or short term enough (like)
> > - none of what we do here takes into considerations any interactions wi=
th
> >    core mm tracking (like cgroups or numa or anything like that)
> =

> OOM is perfectly fine with me, we should just not run into an OOM killer
> situation because we call shmem_read_mapping_page_gfp() in the shrinker
> callback.
> =

> Any idea how we could guarantee that?

Uh ...

I just realized I missed something between how ttm works and how i915
works.  With i915 directly using shmem, all we do in the shrinker is unpin
the shmem pages. With ttm we have the page pool in the middle. And it's
needed for dma coherent and other things. This is rather fundamental.

btw I don't think you'll get OOM, you get lockdep splat because you're
recusring on fs_reclaim fake lock. We should probably put a might_alloc()
into shmem_read_mapping_page_gfp().

> > If we want to drop the "half of system ram" limit (and yes that makes
> > sense) I think the right design is:
> > =

> > - we give up on the "no OOM" guarantee.
> > =

> > - This means if you want real isolation of tasks, we need cgroups, and =
we
> >    need to integrate ttm cgroups with system memory cgroups somehow. Un=
like
> >    randomly picked hardcoded limits this should work a lot more reliably
> >    and be a lot more useful in practical use in the field.
> > =

> > - This also means that drivers start to fail in interesting ways. I thi=
nk
> >    locking headaches are covered with all the lockdep annotations I've
> >    pushed, plus some of the things I still have in-flight (I have a
> >    might_alloc() annotations somewhere). That leaves validation of error
> >    paths for when allocations fail. Ime a very effective way we used in
> >    i915 is (ab)using EINTR restarting, which per drmIoctl uapi spec is
> >    requried. We could put a debug mode into ttm_tt which randomly fails
> >    with -EINTR to make sure it's all working correctly (plus anything e=
lse
> >    that allocates memory), and unlike real out-of-memory injection pigl=
it
> >    and any other cts will complete without failure. Which gives us an
> >    excellent metric for "does it work". Actualy OOM, even injected one,
> >    tends to make stuff blow up in a way that's very hard to track and m=
ake
> >    sure you've got good coverage, since all your usual tests die pretty
> >    quickly.
> > =

> > - ttm_tt needs to play fair with every other system memory user. We need
> >    to register a shrinker for each ttm_tt (so usually one per device I
> >    guess), which walks the lru (in shrink_count) and uses dma_resv_tryl=
ock
> >    for actual shrinking. We probably want to move it to SYSTEM first for
> >    that shrinker to pick up, so that there's some global fairness across
> >    all ttm_tt.
> =

> I already have patches for this.
> =

> What's still missing is teaching the OOM killer which task is using the
> memory since memory referenced through the file descriptors are currently
> not accounted towards any process resources.

Yeah I don't think we've fixed that problem for i915 either. It loves to
kill randome other stuff. In igt we solve this by marking any igt testcase
as "pls kill this first". Well "solve".

> > - for GFP_DMA32 that means zone aware shrinkers. We've never used those,
> >    because thus far i915 didn't have any big need for low memory, so we
> >    haven't used this in practice. But it's supposed to be a thing.
> =

> I think we can mostly forget about GFP_DMA32, this should only be used for
> AGP and other ancient hardware.

Ok, that's good. So having an arbitrary "only half of GFP_DMA32" for these
should also be acceptable, since back then gpus didn't really have
gigabytes of vram yet. Biggest r500 seems to have topped out at 512MB.

How much do we require the dma page pool? Afaiui it's only when there's
bounce buffers or something nasty like that present. Are there more use
cases?

For fixing the TT -> SYSTEM problem of calling shmem_read_mapping_page_gfp
from shrinker I think there's 3 solutions:

1)Call shmem_read_mapping_page_gfp with GFP_IO. This way we should not be
  calling back into our shrinker, which are at GFP_FS level. This isn't
  great, but since page reclaim is a giantic loop which repeats as long as
  we're making meaningful forward progress, we should be able to trickle
  TT pages to SYSTEM pages even under severe memory pressure.

2)For the normal page pool (i.e. neither GFP_DMA32 nor dma_alloc_coherent
  or write-combine) we stop copying the pages for TT <-> SYSTEM, but just
  directly pin the pages we get from shmem. Like all the shmem based soc
  drivers do. No copying, no need for allocations, no problem in
  shrinkers.

3)For the remaining page pools we'd need ttmfs so that we can control the
  address_space_operations and directly swap out from our pages to
  swapout, bypassing shmem and the copying. Iirc Chris Wilson had a
  prototype once somewhere under gemfs for this. Only needed if 1) isn't
  fast enough for these because there's too many such cases where we care.

At least on intel hw the direction is very much towards fully coherent,
so 1&2 should be good enough.
-Daniel

> =

> Christian.
> =

> > It's a bit more code than the oneliner above, but I also think it's a l=
ot
> > more solid. Plus it would resolve the last big issue where i915 gem is
> > fairly fundamentally different compared to ttm. For that question I thi=
nk
> > once Maarten's locking rework for i915 has landed and all the other ttm
> > rework from you and Dave is in, we've resolved them all.
> > =

> > =

> > >   	/* But for DMA32 we limit ourself to only use 2GiB maximum. */
> > >   	num_dma32_pages =3D (u64)(si.totalram - si.totalhigh) * si.mem_uni=
t;
> > > -- =

> > > 2.25.1
> > > =

> =


-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
