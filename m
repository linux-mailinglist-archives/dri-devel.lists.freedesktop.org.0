Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A34DB3C7797
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jul 2021 21:59:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3977D89A98;
	Tue, 13 Jul 2021 19:59:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com
 [IPv6:2607:f8b0:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE47C89A98
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jul 2021 19:59:29 +0000 (UTC)
Received: by mail-oi1-x236.google.com with SMTP id c197so2253262oib.11
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jul 2021 12:59:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=xnQQUXc3QMGZAz8RD89dQUszF69iaN4BV55ilY+w0jw=;
 b=Hby+7cPnaRos0wbhI1gC0V3k/Lk5NljyIb3hHXs6gjvazDu81hEtlnv0YZr4b4SWjT
 un2oVRUTl89CKhW0dKwOmlu3gInGtcaINyWcXZJQ/80lJpYDIH6Qjvnbp82LPFwxp8j6
 gu9OE1T5mqIWZ6na7GLnEPxB3HkYgNIjLFNww=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=xnQQUXc3QMGZAz8RD89dQUszF69iaN4BV55ilY+w0jw=;
 b=ZuY7cZq76bVdBvBetA8tAWAaT9AhdHu9QrejREE+eah1DMyB4/tX6d0MtPgwMWQba2
 VDvqXNL5bvMHDGxA97CD2JUhFZQSlXmd01br3xm5UitDyQLJt1FRK26PivUJsETZqL6K
 Wgz3xkcGuhnwarwsOBmV4U/YWxI/XqPcP3aYMANoaT8fC/4I5IfT4wRUWPapjMRnVPne
 eUN+UsSk/uz5AJkLpdSZIfTlyETDD9E4pLQD2LOe4zDAbhR8Mxl2lGV4KTOpRdjV+l8G
 +6BgpPg9SAs+YwU/nNof/kiyY8IxlMuJ2hvYwufsclIFEBwcnek/ORm1yCTLUKR70d+r
 IQQg==
X-Gm-Message-State: AOAM532RVek+LAfS0p7wh6ZOHxbqnQuL4cCFlF3rBDWTGmyMQad2qe2K
 KKVWsjIpmR41Dv5jJsUaMxWYJdZbjzlkeroK5tjhLA==
X-Google-Smtp-Source: ABdhPJyKWw9l5Jy4vGJ871uTbkCaIb4FsSAwkk9RDaqxUotmeEunyw2fH3DRu0oMkTSlg4DTK2iLVS9OyKmOmkJJqu4=
X-Received: by 2002:aca:d4cf:: with SMTP id l198mr866791oig.14.1626206369052; 
 Tue, 13 Jul 2021 12:59:29 -0700 (PDT)
MIME-Version: 1.0
References: <20210630164413.25481-1-ville.syrjala@linux.intel.com>
 <2edf584b-3835-53ed-f6e3-76c7e8d581ed@linux.intel.com>
 <CAKMK7uFTYgK9rmXTNSczPdBWPTNaLBp-GitzBQb0-gX5wZWHNQ@mail.gmail.com>
In-Reply-To: <CAKMK7uFTYgK9rmXTNSczPdBWPTNaLBp-GitzBQb0-gX5wZWHNQ@mail.gmail.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Tue, 13 Jul 2021 21:59:18 +0200
Message-ID: <CAKMK7uFjgu_TkPFYs0DTdAh9tdDbdpUc0S1n5XUfHJaq_0FHVw@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH] drm/i915/gt: Fix -EDEADLK handling regression
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@intel.com>,
 stable <stable@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jul 13, 2021 at 9:58 PM Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Thu, Jul 1, 2021 at 9:07 AM Maarten Lankhorst
> <maarten.lankhorst@linux.intel.com> wrote:
> > Op 30-06-2021 om 18:44 schreef Ville Syrjala:
> > > From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> > >
> > > The conversion to ww mutexes failed to address the fence code which
> > > already returns -EDEADLK when we run out of fences. Ww mutexes on
> > > the other hand treat -EDEADLK as an internal errno value indicating
> > > a need to restart the operation due to a deadlock. So now when the
> > > fence code returns -EDEADLK the higher level code erroneously
> > > restarts everything instead of returning the error to userspace
> > > as is expected.
> > >
> > > To remedy this let's switch the fence code to use a different errno
> > > value for this. -ENOBUFS seems like a semi-reasonable unique choice.
> > > Apart from igt the only user of this I could find is sna, and even
> > > there all we do is dump the current fence registers from debugfs
> > > into the X server log. So no user visible functionality is affected.
> > > If we really cared about preserving this we could of course convert
> > > back to -EDEADLK higher up, but doesn't seem like that's worth
> > > the hassle here.
> > >
> > > Not quite sure which commit specifically broke this, but I'll
> > > just attribute it to the general gem ww mutex work.
> > >
> > > Cc: stable@vger.kernel.org
> > > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > > Cc: Thomas Hellstr=C3=B6m <thomas.hellstrom@intel.com>
> > > Testcase: igt/gem_pread/exhaustion
> > > Testcase: igt/gem_pwrite/basic-exhaustion
> > > Testcase: igt/gem_fenced_exec_thrash/too-many-fences
> > > Fixes: 80f0b679d6f0 ("drm/i915: Add an implementation for i915_gem_ww=
_ctx locking, v2.")
> > > Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com=
>
> > > ---
> > >  drivers/gpu/drm/i915/gt/intel_ggtt_fencing.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/gpu/drm/i915/gt/intel_ggtt_fencing.c b/drivers/g=
pu/drm/i915/gt/intel_ggtt_fencing.c
> > > index cac7f3f44642..f8948de72036 100644
> > > --- a/drivers/gpu/drm/i915/gt/intel_ggtt_fencing.c
> > > +++ b/drivers/gpu/drm/i915/gt/intel_ggtt_fencing.c
> > > @@ -348,7 +348,7 @@ static struct i915_fence_reg *fence_find(struct i=
915_ggtt *ggtt)
> > >       if (intel_has_pending_fb_unpin(ggtt->vm.i915))
> > >               return ERR_PTR(-EAGAIN);
> > >
> > > -     return ERR_PTR(-EDEADLK);
> > > +     return ERR_PTR(-ENOBUFS);
> > >  }
> > >
> > >  int __i915_vma_pin_fence(struct i915_vma *vma)
> >
> > Makes sense..
> >
> > Reviewed-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> >
> > Is it a slightly more reent commit? Might probably be the part that con=
verts execbuffer to use ww locks.
>
> - please cc: dri-devel on anything gem/gt related.
> - this should probably be ENOSPC or something like that for at least a
> seeming retention of errno consistentcy:
>
> https://dri.freedesktop.org/docs/drm/gpu/drm-uapi.html#recommended-ioctl-=
return-values

Other option would be to map that back to EDEADLK in the execbuf ioctl
somewhere, so we retain a distinct errno code.
-Daniel
--=20
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
