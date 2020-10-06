Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BB9F6285951
	for <lists+dri-devel@lfdr.de>; Wed,  7 Oct 2020 09:22:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1A686E037;
	Wed,  7 Oct 2020 07:22:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from r3-22.sinamail.sina.com.cn (r3-22.sinamail.sina.com.cn
 [202.108.3.22])
 by gabe.freedesktop.org (Postfix) with SMTP id 8139F89D49
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Oct 2020 08:24:37 +0000 (UTC)
Received: from unknown (HELO localhost.localdomain)([123.123.27.212])
 by sina.com with ESMTP
 id 5F7C29BC000087BB; Tue, 6 Oct 2020 16:24:33 +0800 (CST)
X-Sender: hdanton@sina.com
X-Auth-ID: hdanton@sina.com
X-SMAIL-MID: 189489628917
From: Hillf Danton <hdanton@sina.com>
To: Rob Clark <robdclark@gmail.com>
Subject: Re: [PATCH 13/14] drm/msm: Drop struct_mutex in shrinker path
Date: Tue,  6 Oct 2020 16:24:19 +0800
Message-Id: <20201006082419.2412-1-hdanton@sina.com>
In-Reply-To: <CAF6AEGvyEYFa-RLrxqgXjxhiLgc-rB+dbscboROPHGPxoC-RMw@mail.gmail.com>
References: <20201004192152.3298573-1-robdclark@gmail.com>
 <20201005092419.15608-1-hdanton@sina.com>
 <20201005140203.GS438822@phenom.ffwll.local>
 <CAOeoa-cqyb8NZJnJdY+A2H680+C4H0WzXhp-uYj8Fg093BqAnw@mail.gmail.com>
 <20201006004416.15040-1-hdanton@sina.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 07 Oct 2020 07:22:33 +0000
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
 freedreno <freedreno@lists.freedesktop.org>, Hillf Danton <hdanton@sina.com>,
 David Airlie <airlied@linux.ie>, arm-msm <linux-arm-msm@vger.kernel.org>,
 "Kristian H. Kristensen" <hoegsberg@gmail.com>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Dave Chinner <dchinner@redhat.com>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Mon, 5 Oct 2020 20:40:12 Rob Clark <robdclark@gmail.com> wrote:
> On Mon, Oct 5, 2020 at 5:44 PM Hillf Danton <hdanton@sina.com> wrote:
> > On Mon, 5 Oct 2020 18:17:01 Kristian H. Kristensen wrote:
> > > On Mon, Oct 5, 2020 at 4:02 PM Daniel Vetter <daniel@ffwll.ch> wrote:
> > > >
> > > > On Mon, Oct 05, 2020 at 05:24:19PM +0800, Hillf Danton wrote:
> > > > >
> > > > > On Sun,  4 Oct 2020 12:21:45
> > > > > > From: Rob Clark <robdclark@chromium.org>
> > > > > >
> > > > > > Now that the inactive_list is protected by mm_lock, and everything
> > > > > > else on per-obj basis is protected by obj->lock, we no longer depend
> > > > > > on struct_mutex.
> > > > > >
> > > > > > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > > > > > ---
> > > > > >  drivers/gpu/drm/msm/msm_gem.c          |  1 -
> > > > > >  drivers/gpu/drm/msm/msm_gem_shrinker.c | 54 --------------------------
> > > > > >  2 files changed, 55 deletions(-)
> > > > > >
> > > > > [...]
> > > > >
> > > > > > @@ -71,13 +33,8 @@ msm_gem_shrinker_scan(struct shrinker *shrinker, struct shrink_control *sc)
> > > > > >  {
> > > > > >     struct msm_drm_private *priv =
> > > > > >             container_of(shrinker, struct msm_drm_private, shrinker);
> > > > > > -   struct drm_device *dev = priv->dev;
> > > > > >     struct msm_gem_object *msm_obj;
> > > > > >     unsigned long freed = 0;
> > > > > > -   bool unlock;
> > > > > > -
> > > > > > -   if (!msm_gem_shrinker_lock(dev, &unlock))
> > > > > > -           return SHRINK_STOP;
> > > > > >
> > > > > >     mutex_lock(&priv->mm_lock);
> > > > >
> > > > > Better if the change in behavior is documented that SHRINK_STOP will
> > > > > no longer be needed.
> > > >
> > > > btw I read through this and noticed you have your own obj lock, plus
> > > > mutex_lock_nested. I strongly recommend to just cut over to dma_resv_lock
> > > > for all object lock needs (soc drivers have been terrible with this
> > > > unfortuntaly), and in the shrinker just use dma_resv_trylock instead of
> > > > trying to play clever games outsmarting lockdep.
> >
> > The trylock makes page reclaimers turn to their next target e.g. inode
> > cache instead of waiting for the mutex to be released. It makes sense
> > for instance in scenarios of mild memory pressure.
> 
> is there some behind-the-scenes signalling for this, or is this just
> down to what the shrinker callbacks return?

Lets see what Dave may have in his mind about your questions.

> Generally when we get
> into shrinking, there are a big set of purgable bo's to consider, so
> the shrinker callback return wouldn't be considering just one
> potentially lock contended bo (buffer object).  Ie failing one
> trylock, we just move on to the next.
> 
> fwiw, what I've seen on the userspace bo cache vs shrinker (anything
> that is shrinker potential is in userspace bo cache and
> MADV(WONTNEED)) is that in steady state I see a very strong recycling
> of bo's (which avoids allocating and mmap'ing or mapping to gpu a new
> buffer object), so it is definitely a win in mmap/realloc bandwidth..
> in steady state there is a lot of free and realloc of same-sized
> buffers from frame to frame.
> 
> But in transient situations like moving to new game level when there
> is a heavy memory pressure and lots of freeing old
> buffers/textures/etc and then allocating new ones, I see shrinker
> kicking in hard (in android situations, not so much so with
> traditional linux userspace)
> 
> BR,
> -R
> 
> >
> > > >
> > > > I recently wrote an entire blog length rant on why I think
> > > > mutex_lock_nested is too dangerous to be useful:
> > > >
> > > > https://blog.ffwll.ch/2020/08/lockdep-false-positives.html
> > > >
> > > > Not anything about this here, just general comment. The problem extends to
> > > > shmem helpers and all that also having their own locks for everything.
> > >
> > > This is definitely a tangible improvement though - very happy to see
> > > msm_gem_shrinker_lock() go.
> > >
> > > Reviewed-by: Kristian H. Kristensen <hoegsberg@google.com>
> > >
> > > > -Daniel
> > > > --
> > > > Daniel Vetter
> > > > Software Engineer, Intel Corporation
> > > > http://blog.ffwll.ch
> > > > _______________________________________________
> > > > dri-devel mailing list
> > > > dri-devel@lists.freedesktop.org
> > > > https://lists.freedesktop.org/mailman/listinfo/dri-devel

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
