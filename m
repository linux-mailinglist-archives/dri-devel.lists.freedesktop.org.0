Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34A6B5335DC
	for <lists+dri-devel@lfdr.de>; Wed, 25 May 2022 05:34:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8379D11211F;
	Wed, 25 May 2022 03:34:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D649E11211C;
 Wed, 25 May 2022 03:34:19 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id p189so11706122wmp.3;
 Tue, 24 May 2022 20:34:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ghTmliHJ1zlOIVen0TpVTdOTHI7IMPCtAuqivGtm1FA=;
 b=oWCLnghgdcyq4yUMAGTUGBPNNhyUsHEd8v9IT7LaU8iNh83h1n6qtnoeG5i4iAKzXX
 ADgYJXmUjBQHeilPutKRVDOzX/Ur9kjRqW3sv/dxybsCh57tSMXrywI09VIHvGQD5TDn
 x2zerml7MJk1DqAu+ft4MRmpxbzH+2Lzrrc4pRN/uhCw9TAWiMANxVmYIosTletuge8Y
 Kto1z6wkrZRQ390+Wy+bOD420m9KFkSrDKYP3F8h6THa0w9zeVvsx66+mClDPNPgu4nt
 7+7M2nXdJyyPf53HdtgRc5OHubtbUJKm7yinnQuk2AlXwnCA8DCOjFD8cZ4HszbwYcYp
 aJdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ghTmliHJ1zlOIVen0TpVTdOTHI7IMPCtAuqivGtm1FA=;
 b=xO+6pd2a07z8gNmKoiGBFcZNi0dcSRpggPE0jK0X9aoo/vbYB5GvoE8SHrYf/TKpdo
 rM7BmMq+L/7HI4LL4zRk96Eci1GRexyoaU+DHzePCBqPzXPgAQehuT/s++2WH8T4SN3C
 at00GMBAE2TnQ/OGq66cnWIpkx/LOZy/3R7id9ATQx0KgVYCaIGqg4BV1rs6vW/AA5ah
 AuLOhwFRmJWyWcV6WQ6DgpK2Y9fWPZMHVcYI4giNF+YHRMrxWeuUvJlDF5pZveU3tKCZ
 QCQdob5UqHcChbz3SWWg/TpAAW8HAydZUlg5/QBznsh5EY0OZX6xhLln9gTZZKxyq+7J
 +cPQ==
X-Gm-Message-State: AOAM533dbPHTTbHB/H59D0rWah36LjyR3K6ZvFlaMqegkU8evVVcNz07
 By6CSDzB0502hJO26vO8YRqjvXPrm4ML35oaaoQ=
X-Google-Smtp-Source: ABdhPJzisWPnePa2pcOTpW4mbLLsATmmpWfUtubqktbreIbKFQYGNlX90hGJB2Ao8zFa1A9xPxXl0vM8cdAq2oSgXgo=
X-Received: by 2002:a05:600c:3d89:b0:397:104:b1c9 with SMTP id
 bi9-20020a05600c3d8900b003970104b1c9mr6395333wmb.84.1653449658207; Tue, 24
 May 2022 20:34:18 -0700 (PDT)
MIME-Version: 1.0
References: <20210728010632.2633470-1-robdclark@gmail.com>
 <20210728010632.2633470-13-robdclark@gmail.com>
 <84e03c5f-a3af-6592-d19a-a2f5d20b92fb@linux.intel.com>
 <CAJs_Fx6Nc337LPNh=p2GT2d2yDTdLWH934o4Cof3urDGhUJB6A@mail.gmail.com>
 <904ae104-1c30-d130-129f-ccae381261d5@linux.intel.com>
 <CAF6AEGuVhXuX63Od+kcJ0QtfAZ2-wqZsN0KOuEzKbivJdouzog@mail.gmail.com>
In-Reply-To: <CAF6AEGuVhXuX63Od+kcJ0QtfAZ2-wqZsN0KOuEzKbivJdouzog@mail.gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 24 May 2022 20:34:15 -0700
Message-ID: <CAF6AEGvyiMGF-Him5VSHdBCufqoNF8kqMY5XhAic3mvpi_x75A@mail.gmail.com>
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

On Tue, May 24, 2022 at 7:57 AM Rob Clark <robdclark@gmail.com> wrote:
>
> On Tue, May 24, 2022 at 6:45 AM Tvrtko Ursulin
> <tvrtko.ursulin@linux.intel.com> wrote:
> >
> > On 23/05/2022 23:53, Rob Clark wrote:
> > >
> > > btw, one fun (but unrelated) issue I'm hitting with scheduler... I'm
> > > trying to add an igt test to stress shrinker/eviction, similar to the
> > > existing tests/i915/gem_shrink.c.  But we hit an unfortunate
> > > combination of circumstances:
> > > 1. Pinning memory happens in the synchronous part of the submit ioctl,
> > > before enqueuing the job for the kthread to handle.
> > > 2. The first run_job() callback incurs a slight delay (~1.5ms) while
> > > resuming the GPU
> > > 3. Because of that delay, userspace has a chance to queue up enough
> > > more jobs to require locking/pinning more than the available system
> > > RAM..
> >
> > Is that one or multiple threads submitting jobs?
>
> In this case multiple.. but I think it could also happen with a single
> thread (provided it didn't stall on a fence, directly or indirectly,
> from an earlier submit), because of how resume and actual job
> submission happens from scheduler kthread.
>
> > > I'm not sure if we want a way to prevent userspace from getting *too*
> > > far ahead of the kthread.  Or maybe at some point the shrinker should
> > > sleep on non-idle buffers?
> >
> > On the direct reclaim path when invoked from the submit ioctl? In i915
> > we only shrink idle objects on direct reclaim and leave active ones for
> > the swapper. It depends on how your locking looks like whether you could
> > do them, whether there would be coupling of locks and fs-reclaim context.
>
> I think the locking is more or less ok, although lockdep is unhappy
> about one thing[1] which is I think a false warning (ie. not
> recognizing that we'd already successfully acquired the obj lock via
> trylock).  We can already reclaim idle bo's in this path.  But the
> problem with a bunch of submits queued up in the scheduler, is that
> they are already considered pinned and active.  So at some point we
> need to sleep (hopefully interruptabley) until they are no longer
> active, ie. to throttle userspace trying to shove in more submits
> until some of the enqueued ones have a chance to run and complete.
>
> BR,
> -R
>
> [1] https://gitlab.freedesktop.org/drm/msm/-/issues/14
>

btw, one thing I'm thinking about is __GFP_RETRY_MAYFAIL for gem
bo's.. I'd need to think about the various code paths that could
trigger us to need to allocate pages, but short-circuiting the
out_of_memory() path deep in drm_gem_get_pages() ->
shmem_read_mapping_page() -> ... -> __alloc_pages_may_oom() and
letting the driver decide itself if there is queued work worth waiting
on (and if not, calling out_of_memory() directly itself) seems like a
possible solution.. that also untangles the interrupted-syscall case
so we don't end up having to block in a non-interruptible way.  Seems
like it might work?

BR,
-R
