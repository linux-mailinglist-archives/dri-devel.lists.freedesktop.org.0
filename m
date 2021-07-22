Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 480203D2C42
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jul 2021 21:02:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 512AC6EAD7;
	Thu, 22 Jul 2021 19:02:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 268C66EB91
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jul 2021 19:02:45 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id d2so7062782wrn.0
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jul 2021 12:02:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=NxAWTtoyjsf5ed4GT6Mn+COejMtj0Ij6Ef+0zC6Fp0I=;
 b=GlYfJXLDmHKYXvI8nkXkzG+gacX7+T76k4N1wPXrW28aQH7doyu/scQErhKLXXeT5j
 rjL1Zy95ogbryL7A6ufHOhbOYRJpkseGhqFKNJOtnO4d2rxbs/aeimJHRJADUojQ7bYT
 yW1mQ5ZWHeoMzezARa4AkB8kHrYLFWHY/XjdI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=NxAWTtoyjsf5ed4GT6Mn+COejMtj0Ij6Ef+0zC6Fp0I=;
 b=gnUXunMo9+k8rjGetcAsGjPMAVl4vJnyxE/pVa1lKC2cCKSm8E+GoLZvdgXPlWElMn
 o21oBUKjVsCvyfPgm/tY1FrE5qKCha77IZLVPjX9XPK/LOl6cMR16U9QsQ3ViUYiwu5H
 H0smTX45OVR2lhCjNXpJ72Ckrw5n5muBTSV5Dyzhdi/dZAcnyaKuQQENJCAh71Ybl1AV
 lzsF1hKt5PYnay18B8NbN30nVsW5Q6CvIia7xb2GPg0LYkWglckEUhavT9vOEJ+zdmMz
 ohiPbFCm/mxxjlKvMqK+0O5y/yQh5yxtLX1FDihEMI7uyv6Qbjl+b6GTEAdJ0xyCxiRZ
 Dluw==
X-Gm-Message-State: AOAM531GYH+LafulatwN/0v4P2ySuo2ZNJggDW4JApqflyPX844Wbgjs
 FXv2tJpuDrzUzwpIegx0pot12w==
X-Google-Smtp-Source: ABdhPJwVzmJqzAbTzUQiqbsqbtxeYf6pKuPCwR/7bRFDwV/F5EQMooRx31ZbsMvESwO+Xg8SvVqZWg==
X-Received: by 2002:adf:eb43:: with SMTP id u3mr1433153wrn.83.1626980563826;
 Thu, 22 Jul 2021 12:02:43 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id c10sm25624941wmb.40.2021.07.22.12.02.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Jul 2021 12:02:43 -0700 (PDT)
Date: Thu, 22 Jul 2021 21:02:41 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Boqun Feng <boqun.feng@gmail.com>
Subject: Re: [PATCH 1/3] drm: use the lookup lock in drm_is_current_master
Message-ID: <CAKMK7uGSc_YMf2e=oA23KeAvC8i_pqJBU82v8oRGfnwsT41WLQ@mail.gmail.com>
Mail-Followup-To: Boqun Feng <boqun.feng@gmail.com>,
 Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>,
 LKML <linux-kernel@vger.kernel.org>,
 Peter Zijlstra <peterz@infradead.org>,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Zack Rusin <zackr@vmware.com>, Dave Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 Shuah Khan <skhan@linuxfoundation.org>,
 Greg KH <gregkh@linuxfoundation.org>,
 linux-kernel-mentees@lists.linuxfoundation.org
References: <20210722092929.244629-1-desmondcheongzx@gmail.com>
 <20210722092929.244629-2-desmondcheongzx@gmail.com>
 <YPlKkvelm/mcnCj0@phenom.ffwll.local>
 <YPmJEYrnB0j17cZV@boqun-archlinux>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YPmJEYrnB0j17cZV@boqun-archlinux>
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
Cc: Peter Zijlstra <peterz@infradead.org>, Greg KH <gregkh@linuxfoundation.org>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>, Dave Airlie <airlied@linux.ie>,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Shuah Khan <skhan@linuxfoundation.org>,
 Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jul 22, 2021 at 6:00 PM Boqun Feng <boqun.feng@gmail.com> wrote:
>
> On Thu, Jul 22, 2021 at 12:38:10PM +0200, Daniel Vetter wrote:
> > On Thu, Jul 22, 2021 at 05:29:27PM +0800, Desmond Cheong Zhi Xi wrote:
> > > Inside drm_is_current_master, using the outer drm_device.master_mutex
> > > to protect reads of drm_file.master makes the function prone to creating
> > > lock hierarchy inversions. Instead, we can use the
> > > drm_file.master_lookup_lock that sits at the bottom of the lock
> > > hierarchy.
> > >
> > > Reported-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> > > Signed-off-by: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
> > > ---
> > >  drivers/gpu/drm/drm_auth.c | 9 +++++----
> > >  1 file changed, 5 insertions(+), 4 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/drm_auth.c b/drivers/gpu/drm/drm_auth.c
> > > index f00354bec3fb..9c24b8cc8e36 100644
> > > --- a/drivers/gpu/drm/drm_auth.c
> > > +++ b/drivers/gpu/drm/drm_auth.c
> > > @@ -63,8 +63,9 @@
> > >
> > >  static bool drm_is_current_master_locked(struct drm_file *fpriv)
> > >  {
> > > -   lockdep_assert_held_once(&fpriv->minor->dev->master_mutex);
> > > -
> > > +   /* Either drm_device.master_mutex or drm_file.master_lookup_lock
> > > +    * should be held here.
> > > +    */
> >
> > Disappointing that lockdep can't check or conditions for us, a
> > lockdep_assert_held_either would be really neat in some cases.
> >
>
> The implementation is not hard but I don't understand the usage, for
> example, if we have a global variable x, and two locks L1 and L2, and
> the function
>
>         void do_something_to_x(void)
>         {
>                 lockdep_assert_held_either(L1, L2);
>                 x++;
>         }
>
> and two call sites:
>
>         void f(void)
>         {
>                 lock(L1);
>                 do_something_to_x();
>                 unlock(L1);
>         }
>
>         void g(void)
>         {
>                 lock(L2);
>                 do_something_to_x();
>                 unlock(L2);
>         }
>
> , wouldn't it be racy if f() and g() called by two threads at the same
> time? Usually I would expect there exists a third synchronazition
> mechanism (say M), which synchronizes the calls to f() and g(), and we
> put M in the lockdep_assert_held() check inside do_something_to_x()
> like:
>
>         void do_something_to_x(void)
>         {
>                 lockdep_assert_held_once(M);
>                 x++;
>         }
>
> But of course, M may not be a lock, so we cannot put the assert there.
>
> My cscope failed to find ->master_lookup_lock in -rc2 and seems it's not
> introduced in the patchset either, could you point me the branch this
> patchset is based on, so that I could understand this better, and maybe
> come up with a solution? Thanks ;-)

The use case is essentially 2 nesting locks, and only the innermost is
used to update a field. So when you only read this field, it's safe if
either of these two locks are held. Essentially this is a read/write lock
type of thing, except for various reasons the two locks might not be of
the same type (like here where the write lock is a mutex, but the read
lock is a spinlock).

It's a bit like the rcu_derefence macro where it's ok to either be in a
rcu_read_lock() section, or holding the relevant lock that's used to
update the value. We do _not_ have two different locks that allow writing
to the same X.

Does that make it clearer what's the use-case here?

In an example:

void * interesting_pointer.

do_update_interesting_pointer()
{
	mutex_lock(A);
	/* do more stuff to prepare things */
	spin_lock(B);
	interesting_pointer = new_value;
	spin_unlock(B);
	mutex_unlock(A);
}

read_interesting_thing_locked()
{
	lockdep_assert_held_either(A, B);

	return interesting_pointer->thing;
}

read_interesting_thing()
{
	int thing;
	spin_lock(B);
	thing = interesting_pointer->thing;
	spin_unlock(B);

	return B;
}

spinlock might also be irqsafe here if this can be called from irq
context.

Cheers, Daniel

> Regards,
> Boqun
>
> > Adding lockdep folks, maybe they have ideas.
> >
> > On the patch:
> >
> > Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> >
> > >     return fpriv->is_master && drm_lease_owner(fpriv->master) == fpriv->minor->dev->master;
> > >  }
> > >
> > > @@ -82,9 +83,9 @@ bool drm_is_current_master(struct drm_file *fpriv)
> > >  {
> > >     bool ret;
> > >
> > > -   mutex_lock(&fpriv->minor->dev->master_mutex);
> > > +   spin_lock(&fpriv->master_lookup_lock);
> > >     ret = drm_is_current_master_locked(fpriv);
> > > -   mutex_unlock(&fpriv->minor->dev->master_mutex);
> > > +   spin_unlock(&fpriv->master_lookup_lock);
> > >
> > >     return ret;
> > >  }
> > > --
> > > 2.25.1
> > >
> >
> > --
> > Daniel Vetter
> > Software Engineer, Intel Corporation
> > http://blog.ffwll.ch



-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
