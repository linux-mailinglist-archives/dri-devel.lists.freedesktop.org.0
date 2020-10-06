Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55340284970
	for <lists+dri-devel@lfdr.de>; Tue,  6 Oct 2020 11:36:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DCEE6E14C;
	Tue,  6 Oct 2020 09:36:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EF266E435
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Oct 2020 09:36:02 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id p15so2195743wmi.4
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Oct 2020 02:36:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=jfHRjgUc3yWmaMNP8V6npRHveQSEaYznJy9xDxqdq5Y=;
 b=V4AlHabOmn6H1w4iRNEGS0B70b8dv2DIEZuurCYdgOgzzKGxgOH6LDi0oU30jzagKc
 nRxT2MEZyLjf9RvcqMiFjcPOZKT5cchMQIVnFpIyJjAAlzwzNA+seFw9c0nwVP6J/wG+
 dE4STfKprpfEiAUbFdH0mQqVPGuDeexiySSD4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=jfHRjgUc3yWmaMNP8V6npRHveQSEaYznJy9xDxqdq5Y=;
 b=geDt27S2GWhSPp0aZffQlLhhgsXy4lFKOL7zZSQZas0ABKFIMacIkjkG3gMyCGebzQ
 D01HMEaBK1cGV2TcnTz6Mv5wqfPgvX0S8L1ZDtllYtDpDlAPpPa4tqI6HTHJRye6Zxau
 T+10iLGgjbMSM85L2X6ZS968NRDJNEsh4N42Had2bnwa1x4zmTWevrmcg6FrfkGDXnJ4
 zi18Rf2u7rNNWEqblO4/5z33f5lQPmStWbCbe+XR+JfvjWxkcK+JeCa3zwe54+P+4qMw
 4o30608CJE3CwT3AJulqh4H3MO10wgJlycbrNomzlQUnxeforMwjsV8SNqyzbPPDnSUQ
 WE0Q==
X-Gm-Message-State: AOAM531vXHFkBvf3hrLlBEknI17N/YjpEmOYrTLUd9S2Cjd5mJdWErJN
 /eISGVcTBR8ur7mzObJTbtsI0g==
X-Google-Smtp-Source: ABdhPJzEaJYL1QdJ5uR4JBld7BCAOyXdwCbFSfIsfUiUeAGtF+t3pE5ORpDjMh0kMl0i7jqARrQBkA==
X-Received: by 2002:a7b:c95a:: with SMTP id i26mr4006324wml.25.1601976960896; 
 Tue, 06 Oct 2020 02:36:00 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id k15sm3880199wrv.90.2020.10.06.02.35.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Oct 2020 02:36:00 -0700 (PDT)
Date: Tue, 6 Oct 2020 11:35:58 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Rob Clark <robdclark@gmail.com>
Subject: Re: [PATCH 13/14] drm/msm: Drop struct_mutex in shrinker path
Message-ID: <20201006093558.GZ438822@phenom.ffwll.local>
Mail-Followup-To: Rob Clark <robdclark@gmail.com>,
 Hillf Danton <hdanton@sina.com>, Rob Clark <robdclark@chromium.org>,
 freedreno <freedreno@lists.freedesktop.org>,
 David Airlie <airlied@linux.ie>,
 arm-msm <linux-arm-msm@vger.kernel.org>,
 "Kristian H . Kristensen" <hoegsberg@gmail.com>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Sean Paul <sean@poorly.run>
References: <20201004192152.3298573-1-robdclark@gmail.com>
 <20201005092419.15608-1-hdanton@sina.com>
 <20201005140203.GS438822@phenom.ffwll.local>
 <CAOeoa-cqyb8NZJnJdY+A2H680+C4H0WzXhp-uYj8Fg093BqAnw@mail.gmail.com>
 <20201006004416.15040-1-hdanton@sina.com>
 <CAF6AEGvyEYFa-RLrxqgXjxhiLgc-rB+dbscboROPHGPxoC-RMw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAF6AEGvyEYFa-RLrxqgXjxhiLgc-rB+dbscboROPHGPxoC-RMw@mail.gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>, Hillf Danton <hdanton@sina.com>,
 David Airlie <airlied@linux.ie>, arm-msm <linux-arm-msm@vger.kernel.org>,
 "Kristian H . Kristensen" <hoegsberg@gmail.com>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Sean Paul <sean@poorly.run>,
 freedreno <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Oct 05, 2020 at 08:40:12PM -0700, Rob Clark wrote:
> On Mon, Oct 5, 2020 at 5:44 PM Hillf Danton <hdanton@sina.com> wrote:
> >
> >
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
> down to what the shrinker callbacks return?  Generally when we get
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

Yeah per-buffer trylock is fine. Trylock on the mm_lock (or anything else
device-global, like struct_mutex and msm_gem_shrinker_lock) I think isn't
fine, since if you're unlucky you're hogging a ton of memory and that's
the only freeable resource in the system. Going to other shrinkers won't
help when it's the gpu shrinker that has all the freeable memory.

Also other shrinkers (inode and all these) also do lots of per-object
trylocking. I think there's a canonical threshold of shrinker rounds where
you're supposed to try harder (if possible), but that doesn't apply to
dma_resv_lock.
-Daniel

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
> >
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
