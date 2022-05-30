Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FBEC538730
	for <lists+dri-devel@lfdr.de>; Mon, 30 May 2022 20:20:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35CDF10F7A0;
	Mon, 30 May 2022 18:20:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC50B10F79A;
 Mon, 30 May 2022 18:20:30 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id x17so6653240wrg.6;
 Mon, 30 May 2022 11:20:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ALLZipw00VqFyoGIsTsJK6QyjTVltKc85FS1BcRmMeU=;
 b=eb8v3CaFu7wALENbAfSO6gWKDRalxi7rh8oX69+gLSrvRujyCkBzXqzwAUkSjTyv35
 Oc1CkS2vl5bF5CWINhplp7O/ynkBrmwMJnbMVJ9UE5A41ffc/z8x9XpkxY3HHkSbmNSi
 9tVlt59ipkPiO8iUJaE40go+4/ogx3apgRti5HNRfroDflbSjozmvm4f66wVsvcQlNcR
 eZm4XRVVE1lsRP3JcH/FLi3CfufFJMEqrv70BPVfiCQrHKC5Y13zSzZtWHkmy9d3H3WT
 YekO6HQ6TcI7cfk68wUM5cE0C6f61TBRNIVpyvlA6D4GTArG98twS1fvTrzBWpA4oYc4
 FoTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ALLZipw00VqFyoGIsTsJK6QyjTVltKc85FS1BcRmMeU=;
 b=ryEWWqSateeWvQ6zU4VBknYhA0X6zmNsFRYdPYSL9v9PRI5uJpMj9PYShrMvWuojMO
 IJLx78E3ITa0K7+AeSIzHOga01icacC/VOdjae2ursOvg0FuVAspfknqqyLdxQ3ld+Tl
 Ivu0BFa0cERJFby2hz+R4nPzxxp/8Eg7pTmwFCF1p5UL5ZBFxW7Soudc5LlvOcIX5t+G
 7fOjjC1XgO3dCFrq3ys1H9m70bFIiMoLO81J4uNi+g+ERl1tsUDTuoPRMkGtNmBDGLCa
 yzJm4Nwlxw8S9hrOru3NEtT1+r0utVXdgSIjWtakBHLhTTlA0eB4aZ0NbQrNTONabd5i
 Arrg==
X-Gm-Message-State: AOAM532grC4g/ZK85XNx4EhnLbkEmhGenEHkaoirB+Bq7S+0LrAlp/RG
 MwoUEDQ3orjtMuJHxAqHWSFx6OHqDE/OaQYjonE=
X-Google-Smtp-Source: ABdhPJxxUJkA1Q45166szFe9btXwfDRUVihfDJGK7+dd9es5Z+W5G+0TA4WMX7fkss9EEKoPQnYmlWxdLQQbNcToAwM=
X-Received: by 2002:a05:6000:547:b0:20f:ca41:cc51 with SMTP id
 b7-20020a056000054700b0020fca41cc51mr37150554wrf.221.1653934829054; Mon, 30
 May 2022 11:20:29 -0700 (PDT)
MIME-Version: 1.0
References: <20220529162936.2539901-1-robdclark@gmail.com>
 <0bf230f4-c888-b9c9-f061-7450406baa4a@suse.de>
 <CAF6AEGthAfWyAvbuE4EP+u52LEKS2Fs6X=gG8qUjc7gci6oh-A@mail.gmail.com>
 <CAKMK7uG9=EcmD4hPqm4zYsDHiS9Mr=y_5tUa_R1veDxSSK-P-Q@mail.gmail.com>
 <CAF6AEGuLeLmD4m+yi5csGdb0XZbnAOfYOKx6c-wEgMGt6rj7Cw@mail.gmail.com>
 <df7de69a-47b3-1a28-f673-8f9a94f70a97@suse.de>
In-Reply-To: <df7de69a-47b3-1a28-f673-8f9a94f70a97@suse.de>
From: Rob Clark <robdclark@gmail.com>
Date: Mon, 30 May 2022 11:20:29 -0700
Message-ID: <CAF6AEGureUPNRR3GFfuPS4c3byM6aqxLm3QN9+SMtHgytKaNPA@mail.gmail.com>
Subject: Re: [PATCH] drm/prime: Ensure mmap offset is initialized
To: Thomas Zimmermann <tzimmermann@suse.de>
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
Cc: Rob Clark <robdclark@chromium.org>, David Airlie <airlied@linux.ie>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Gerd Hoffmann <kraxel@redhat.com>,
 freedreno <freedreno@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, May 30, 2022 at 10:20 AM Thomas Zimmermann <tzimmermann@suse.de> wr=
ote:
>
> Hi
>
> Am 30.05.22 um 17:41 schrieb Rob Clark:
> > On Mon, May 30, 2022 at 7:49 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> >>
> >> On Mon, 30 May 2022 at 15:54, Rob Clark <robdclark@gmail.com> wrote:
> >>>
> >>> On Mon, May 30, 2022 at 12:26 AM Thomas Zimmermann <tzimmermann@suse.=
de> wrote:
> >>>>
> >>>> Hi
> >>>>
> >>>> Am 29.05.22 um 18:29 schrieb Rob Clark:
> >>>>> From: Rob Clark <robdclark@chromium.org>
> >>>>>
> >>>>> If a GEM object is allocated, and then exported as a dma-buf fd whi=
ch is
> >>>>> mmap'd before or without the GEM buffer being directly mmap'd, the
> >>>>> vma_node could be unitialized.  This leads to a situation where the=
 CPU
> >>>>> mapping is not correctly torn down in drm_vma_node_unmap().
> >>>>
> >>>> Which drivers are affected by this problem?
> >>>>
> >>>> I checked several drivers and most appear to be initializing the off=
set
> >>>> during object construction, such as GEM SHMEM. [1] TTM-based drivers
> >>>> also seem unaffected. [2]
> >>>>
> >>>>   From a quick grep, only etnaviv, msm and omapdrm appear to be affe=
cted?
> >>>> They only seem to run drm_gem_create_mmap_offset() from their
> >>>> ioctl-handling code.
> >>>>
> >>>> If so, I'd say it's preferable to fix these drivers and put a
> >>>> drm_WARN_ONCE() into drm_gem_prime_mmap().
> >>>
> >>> That is good if fewer drivers are affected, however I disagree with
> >>> your proposal.  At least for freedreno userspace, a lot of bo's never
> >>> get mmap'd (either directly of via dmabuf), so we should not be
> >>> allocating a mmap offset unnecessarily.
> >>
> >> Does this actually matter in the grand scheme of things? We originally
> >> allocated mmap offset only on demand because userspace only had 32bit
> >> loff_t support and so simply couldn't mmap anything if the offset
> >> ended up above 32bit (even if there was still va space available).
> >>
> >> But those days are long gone (about 10 years or so) and the allocation
> >> overhead for an mmap offset is tiny. So I think unless you can
> >> benchmark an impact allocating it at bo alloc seems like the simplest
> >> design overall, and hence what we should be doing. And if the vma
> >> offset allocation every gets too slow due to fragmentation we can lift
> >> the hole tree from i915 into drm_mm and the job should be done. At
> >> that point we could also allocate the offset unconditionally in the
> >> gem_init function and be done with it.
> >>
> >> Iow I concur with Thomas here, unless there's hard data contrary
> >> simplicity imo trumps here.
> >
> > 32b userspace is still alive and well, at least on arm chromebooks ;-)
>
> I mostly dislike the inconsistency among drivers. If we want to create
> the offset on-demand in the DRM helpers, we should do so for all
> drivers. At least our generic GEM helpers and TTM should implement this
> pattern.

Possibly we should have drm_gem_get_mmap_offset() which combines
drm_gem_create_mmap_offset() and drm_vma_node_start() calls, and use
that everywhere.

But I think we should fix this issue first, and then refactor on top,
so that a fix can be backported to stable kernels ;-)

BR,
-R

> Best regards
> Thomas
>
> >
> > BR,
> > -R
> >
> >> -Daniel
> >>
> >>>
> >>> BR,
> >>> -R
> >>>
> >>>> Best regards
> >>>> Thomas
> >>>>
> >>>> [1]
> >>>> https://elixir.bootlin.com/linux/v5.18/source/drivers/gpu/drm/drm_ge=
m_shmem_helper.c#L85
> >>>> [2]
> >>>> https://elixir.bootlin.com/linux/v5.18/source/drivers/gpu/drm/ttm/tt=
m_bo.c#L1002
> >>>>
> >>>>>
> >>>>> Fixes: e5516553999f ("drm: call drm_gem_object_funcs.mmap with fake=
 offset")
> >>>>> Signed-off-by: Rob Clark <robdclark@chromium.org>
> >>>>> ---
> >>>>> Note, it's possible the issue existed in some related form prior to=
 the
> >>>>> commit tagged with Fixes.
> >>>>>
> >>>>>    drivers/gpu/drm/drm_prime.c | 5 +++++
> >>>>>    1 file changed, 5 insertions(+)
> >>>>>
> >>>>> diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prim=
e.c
> >>>>> index e3f09f18110c..849eea154dfc 100644
> >>>>> --- a/drivers/gpu/drm/drm_prime.c
> >>>>> +++ b/drivers/gpu/drm/drm_prime.c
> >>>>> @@ -716,6 +716,11 @@ int drm_gem_prime_mmap(struct drm_gem_object *=
obj, struct vm_area_struct *vma)
> >>>>>        struct file *fil;
> >>>>>        int ret;
> >>>>>
> >>>>> +     /* Ensure that the vma_node is initialized: */
> >>>>> +     ret =3D drm_gem_create_mmap_offset(obj);
> >>>>> +     if (ret)
> >>>>> +             return ret;
> >>>>> +
> >>>>>        /* Add the fake offset */
> >>>>>        vma->vm_pgoff +=3D drm_vma_node_start(&obj->vma_node);
> >>>>>
> >>>>
> >>>> --
> >>>> Thomas Zimmermann
> >>>> Graphics Driver Developer
> >>>> SUSE Software Solutions Germany GmbH
> >>>> Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
> >>>> (HRB 36809, AG N=C3=BCrnberg)
> >>>> Gesch=C3=A4ftsf=C3=BChrer: Ivo Totev
> >>
> >>
> >>
> >> --
> >> Daniel Vetter
> >> Software Engineer, Intel Corporation
> >> http://blog.ffwll.ch
>
> --
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
> (HRB 36809, AG N=C3=BCrnberg)
> Gesch=C3=A4ftsf=C3=BChrer: Ivo Totev
