Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FED23C7791
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jul 2021 21:58:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D05AC89FD1;
	Tue, 13 Jul 2021 19:58:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com
 [IPv6:2607:f8b0:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB4D989FD1
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jul 2021 19:58:14 +0000 (UTC)
Received: by mail-ot1-x330.google.com with SMTP id
 f12-20020a056830204cb029048bcf4c6bd9so40765otp.8
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jul 2021 12:58:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=pz8q3VIqFRU6Z/Otup9y1fbrbnHC3h9yRwEFMSVd4po=;
 b=DGnT4aaklkuoh4XMDUeZRq//7mSWFtV3A0L+iDHT1S+iVnLosPSNCkAyO/1rZQCrSE
 UZ/WJLPpsbZpEl741Nu13cBhXe603O65KeMnC6vjyY7W/tca69MCJW+GDo33EM2wHLLU
 uSb9A0+ximsKFnDz9J4vm+HTRu+BGvxTUIUw4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=pz8q3VIqFRU6Z/Otup9y1fbrbnHC3h9yRwEFMSVd4po=;
 b=WIsCdgL2cxMNC7kINDs4uDz6mXYETm2bcY53jMEi8H8Bhkja0yd0puP89ohGd64FzO
 uVs/QBJ42D/9SNrHyePlHJl1pTnQNzTrCRuWgf51Fi2vKFm2paq+w+k8QS91FClbh5uX
 XRtVl28DzXiWDryt2BF6kc0z17LpBhGyBYGMom/B3/DJ+vwmhB9rAmrfB3RSuK++u2gz
 k03wslo7WwurH71IVPAVSfCwQjH23WRZrIbDSFYNNmvKrsgfI5zgqLMrGDyC3rEWDk+S
 rbkFmLITC51irc1k+5IQAydGc0x7R7q+oh9whFLL7Mjs85BWfP57cVo9vL+0wJdVpwUK
 aEng==
X-Gm-Message-State: AOAM530s36V8JsjGCAaHuL0BBsz3Xeva2VtW6pUqi+3T7gwfoy6nntnu
 0lvpMC+AIbua1rD3rLcGjALqO+S+/ActmSJg9GE+9w==
X-Google-Smtp-Source: ABdhPJz9CiL//Tji/Cm8MAeN5UlQhpYrnRkpw3wA2Mbq0SpzZIBAEWBX0CbMXD846uBx7jrpmnzX3myPs/Aypjc7HYs=
X-Received: by 2002:a05:6830:2366:: with SMTP id
 r6mr4902260oth.188.1626206294340; 
 Tue, 13 Jul 2021 12:58:14 -0700 (PDT)
MIME-Version: 1.0
References: <20210630164413.25481-1-ville.syrjala@linux.intel.com>
 <2edf584b-3835-53ed-f6e3-76c7e8d581ed@linux.intel.com>
In-Reply-To: <2edf584b-3835-53ed-f6e3-76c7e8d581ed@linux.intel.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Tue, 13 Jul 2021 21:58:03 +0200
Message-ID: <CAKMK7uFTYgK9rmXTNSczPdBWPTNaLBp-GitzBQb0-gX5wZWHNQ@mail.gmail.com>
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

On Thu, Jul 1, 2021 at 9:07 AM Maarten Lankhorst
<maarten.lankhorst@linux.intel.com> wrote:
> Op 30-06-2021 om 18:44 schreef Ville Syrjala:
> > From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> >
> > The conversion to ww mutexes failed to address the fence code which
> > already returns -EDEADLK when we run out of fences. Ww mutexes on
> > the other hand treat -EDEADLK as an internal errno value indicating
> > a need to restart the operation due to a deadlock. So now when the
> > fence code returns -EDEADLK the higher level code erroneously
> > restarts everything instead of returning the error to userspace
> > as is expected.
> >
> > To remedy this let's switch the fence code to use a different errno
> > value for this. -ENOBUFS seems like a semi-reasonable unique choice.
> > Apart from igt the only user of this I could find is sna, and even
> > there all we do is dump the current fence registers from debugfs
> > into the X server log. So no user visible functionality is affected.
> > If we really cared about preserving this we could of course convert
> > back to -EDEADLK higher up, but doesn't seem like that's worth
> > the hassle here.
> >
> > Not quite sure which commit specifically broke this, but I'll
> > just attribute it to the general gem ww mutex work.
> >
> > Cc: stable@vger.kernel.org
> > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > Cc: Thomas Hellstr=C3=B6m <thomas.hellstrom@intel.com>
> > Testcase: igt/gem_pread/exhaustion
> > Testcase: igt/gem_pwrite/basic-exhaustion
> > Testcase: igt/gem_fenced_exec_thrash/too-many-fences
> > Fixes: 80f0b679d6f0 ("drm/i915: Add an implementation for i915_gem_ww_c=
tx locking, v2.")
> > Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> > ---
> >  drivers/gpu/drm/i915/gt/intel_ggtt_fencing.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/i915/gt/intel_ggtt_fencing.c b/drivers/gpu=
/drm/i915/gt/intel_ggtt_fencing.c
> > index cac7f3f44642..f8948de72036 100644
> > --- a/drivers/gpu/drm/i915/gt/intel_ggtt_fencing.c
> > +++ b/drivers/gpu/drm/i915/gt/intel_ggtt_fencing.c
> > @@ -348,7 +348,7 @@ static struct i915_fence_reg *fence_find(struct i91=
5_ggtt *ggtt)
> >       if (intel_has_pending_fb_unpin(ggtt->vm.i915))
> >               return ERR_PTR(-EAGAIN);
> >
> > -     return ERR_PTR(-EDEADLK);
> > +     return ERR_PTR(-ENOBUFS);
> >  }
> >
> >  int __i915_vma_pin_fence(struct i915_vma *vma)
>
> Makes sense..
>
> Reviewed-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>
> Is it a slightly more reent commit? Might probably be the part that conve=
rts execbuffer to use ww locks.

- please cc: dri-devel on anything gem/gt related.
- this should probably be ENOSPC or something like that for at least a
seeming retention of errno consistentcy:

https://dri.freedesktop.org/docs/drm/gpu/drm-uapi.html#recommended-ioctl-re=
turn-values

Cheers, Daniel
--=20
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
