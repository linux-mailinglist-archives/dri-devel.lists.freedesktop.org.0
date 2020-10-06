Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BBFB1284457
	for <lists+dri-devel@lfdr.de>; Tue,  6 Oct 2020 05:39:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD59F6E29D;
	Tue,  6 Oct 2020 03:39:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 604626E296;
 Tue,  6 Oct 2020 03:39:05 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id z1so11764929wrt.3;
 Mon, 05 Oct 2020 20:39:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FwIS/ZODNB8+XMrbGKPg2oqieogMxq8fh8uSfx5pWG4=;
 b=B7FrGuJXPfKUlJ9l0jfWv+Ve6A7XPPa6fZLOk+MgTpYpy87opySF+VYBHXl8tAWkLq
 T0Ajfb3FdHkB8xRyM9M8k4woBNNYq7XY4UWSMZxWK7q6R8ID3eRHMyGL0mPi/6n8KPjJ
 2oqXwKeIGY6tmS6L3ezN+eq/BTBxUA8NIi1NucgR5gDlda/jdgxTaBXDeWN8i1OyRmyN
 Qi7kQ6nGab3FHvez86AuOAAvB8OymEcQB6rCnJMOzeBtk3XcfuK9wbr/GVdcmtMP4WL0
 g5lAj4YiYVtYCScrJ2XPNLZoNI8SISpjm4U9gg8/o3NJ/4KkmLOjbWgttMYEgwWs0DHU
 OfiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FwIS/ZODNB8+XMrbGKPg2oqieogMxq8fh8uSfx5pWG4=;
 b=cC2BXbyVOFa4agwNU3YlyY0fj9/D/R3nJZ0/daneJJT/JxVnjgVvn4lvLUajLlJze5
 HJjUipMcxuJR8AFK4CAogQaQR6Exv8QkNzalLzKQWfPb0DDIQLjCCUV+Q/s8gJpp1/Zm
 53O46Ucinj6Pe4SVfa5U/cB+Lo5Xl8h1e6F+2PrVeTzTY8B26UDzLN4FDpUElnEAa0RO
 2fgv0KQLFqml/qZVp99176yPXZjEJZq1xs94bRxLvYH631G514ra6wN8ZMhai8a36ECM
 TAEMld0W05Bl0qddryeD6sk7K6KQdmxv4K4Smib4MFGr8Msw6zctq1MjoDw3/3s+9wj+
 Slyw==
X-Gm-Message-State: AOAM532B/YgeCb4z6Lzd71ZliUtXrwXVBe9mmYcYlL71WuPdiXFcotJJ
 EM3BzoJIHWD62bnzE2gC4nPEXg8oj+ELmQS6wvE=
X-Google-Smtp-Source: ABdhPJyUbdKz587egzViKBfukW+6sdOLD87D+e1o6XTSsYRkUVaQvH5UDDvnzcp5clV0wdx99mHgcD4zLyUIH+mnTcE=
X-Received: by 2002:a5d:640d:: with SMTP id z13mr2391517wru.28.1601955544026; 
 Mon, 05 Oct 2020 20:39:04 -0700 (PDT)
MIME-Version: 1.0
References: <20201004192152.3298573-1-robdclark@gmail.com>
 <20201005092419.15608-1-hdanton@sina.com>
 <20201005140203.GS438822@phenom.ffwll.local>
 <CAOeoa-cqyb8NZJnJdY+A2H680+C4H0WzXhp-uYj8Fg093BqAnw@mail.gmail.com>
 <20201006004416.15040-1-hdanton@sina.com>
In-Reply-To: <20201006004416.15040-1-hdanton@sina.com>
From: Rob Clark <robdclark@gmail.com>
Date: Mon, 5 Oct 2020 20:40:12 -0700
Message-ID: <CAF6AEGvyEYFa-RLrxqgXjxhiLgc-rB+dbscboROPHGPxoC-RMw@mail.gmail.com>
Subject: Re: [PATCH 13/14] drm/msm: Drop struct_mutex in shrinker path
To: Hillf Danton <hdanton@sina.com>
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
 freedreno <freedreno@lists.freedesktop.org>, David Airlie <airlied@linux.ie>,
 arm-msm <linux-arm-msm@vger.kernel.org>,
 "Kristian H . Kristensen" <hoegsberg@gmail.com>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Oct 5, 2020 at 5:44 PM Hillf Danton <hdanton@sina.com> wrote:
>
>
> On Mon, 5 Oct 2020 18:17:01 Kristian H. Kristensen wrote:
> > On Mon, Oct 5, 2020 at 4:02 PM Daniel Vetter <daniel@ffwll.ch> wrote:
> > >
> > > On Mon, Oct 05, 2020 at 05:24:19PM +0800, Hillf Danton wrote:
> > > >
> > > > On Sun,  4 Oct 2020 12:21:45
> > > > > From: Rob Clark <robdclark@chromium.org>
> > > > >
> > > > > Now that the inactive_list is protected by mm_lock, and everything
> > > > > else on per-obj basis is protected by obj->lock, we no longer depend
> > > > > on struct_mutex.
> > > > >
> > > > > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > > > > ---
> > > > >  drivers/gpu/drm/msm/msm_gem.c          |  1 -
> > > > >  drivers/gpu/drm/msm/msm_gem_shrinker.c | 54 --------------------------
> > > > >  2 files changed, 55 deletions(-)
> > > > >
> > > > [...]
> > > >
> > > > > @@ -71,13 +33,8 @@ msm_gem_shrinker_scan(struct shrinker *shrinker, struct shrink_control *sc)
> > > > >  {
> > > > >     struct msm_drm_private *priv =
> > > > >             container_of(shrinker, struct msm_drm_private, shrinker);
> > > > > -   struct drm_device *dev = priv->dev;
> > > > >     struct msm_gem_object *msm_obj;
> > > > >     unsigned long freed = 0;
> > > > > -   bool unlock;
> > > > > -
> > > > > -   if (!msm_gem_shrinker_lock(dev, &unlock))
> > > > > -           return SHRINK_STOP;
> > > > >
> > > > >     mutex_lock(&priv->mm_lock);
> > > >
> > > > Better if the change in behavior is documented that SHRINK_STOP will
> > > > no longer be needed.
> > >
> > > btw I read through this and noticed you have your own obj lock, plus
> > > mutex_lock_nested. I strongly recommend to just cut over to dma_resv_lock
> > > for all object lock needs (soc drivers have been terrible with this
> > > unfortuntaly), and in the shrinker just use dma_resv_trylock instead of
> > > trying to play clever games outsmarting lockdep.
>
> The trylock makes page reclaimers turn to their next target e.g. inode
> cache instead of waiting for the mutex to be released. It makes sense
> for instance in scenarios of mild memory pressure.

is there some behind-the-scenes signalling for this, or is this just
down to what the shrinker callbacks return?  Generally when we get
into shrinking, there are a big set of purgable bo's to consider, so
the shrinker callback return wouldn't be considering just one
potentially lock contended bo (buffer object).  Ie failing one
trylock, we just move on to the next.

fwiw, what I've seen on the userspace bo cache vs shrinker (anything
that is shrinker potential is in userspace bo cache and
MADV(WONTNEED)) is that in steady state I see a very strong recycling
of bo's (which avoids allocating and mmap'ing or mapping to gpu a new
buffer object), so it is definitely a win in mmap/realloc bandwidth..
in steady state there is a lot of free and realloc of same-sized
buffers from frame to frame.

But in transient situations like moving to new game level when there
is a heavy memory pressure and lots of freeing old
buffers/textures/etc and then allocating new ones, I see shrinker
kicking in hard (in android situations, not so much so with
traditional linux userspace)

BR,
-R

>
> > >
> > > I recently wrote an entire blog length rant on why I think
> > > mutex_lock_nested is too dangerous to be useful:
> > >
> > > https://blog.ffwll.ch/2020/08/lockdep-false-positives.html
> > >
> > > Not anything about this here, just general comment. The problem extends to
> > > shmem helpers and all that also having their own locks for everything.
> >
> > This is definitely a tangible improvement though - very happy to see
> > msm_gem_shrinker_lock() go.
> >
> > Reviewed-by: Kristian H. Kristensen <hoegsberg@google.com>
> >
> > > -Daniel
> > > --
> > > Daniel Vetter
> > > Software Engineer, Intel Corporation
> > > http://blog.ffwll.ch
> > > _______________________________________________
> > > dri-devel mailing list
> > > dri-devel@lists.freedesktop.org
> > > https://lists.freedesktop.org/mailman/listinfo/dri-devel
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
