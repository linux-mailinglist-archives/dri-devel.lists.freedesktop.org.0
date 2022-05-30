Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 698F2537E3D
	for <lists+dri-devel@lfdr.de>; Mon, 30 May 2022 15:54:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16E2B10ECBD;
	Mon, 30 May 2022 13:54:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 396 seconds by postgrey-1.36 at gabe;
 Mon, 30 May 2022 13:54:34 UTC
Received: from mail-wm1-x32a.google.com (unknown [IPv6:2a00:1450:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AE3010ECAC;
 Mon, 30 May 2022 13:54:34 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 l188-20020a1c25c5000000b003978df8a1e2so4408159wml.1; 
 Mon, 30 May 2022 06:54:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=1pogo+Rv5tv/SQVuIFRfnUxU3Jbc6+ErgEhXQlEuH7Q=;
 b=EgKmyAppjZbMOVnfQCO9MvfkDvMr+4bRewuD6ZUn/bdV7ecI0uWF5Wck1N/xzVzGBP
 q1aP+cC6TzWU0T7V406WfklMmWpdBDC2YcH0XIULHHAw/CG9lgeFrjbJCQcmWgTFVXFE
 ShI/kvcxCFcDEPze5rWor+yDkJ/nOqiI5MNP6mK6yW0bW/uvzOHoKL6RTkOdeROje5O7
 CtBl+wvl+mi6mUuSpQoJsZPcLNyrZZQHM7XFSWten5gD91Mzm8Ki6pMPBgX8hlzPrDWx
 kW/ASef/d62eot597BBs1qtCQsRLwhsjVWWR9SGads+97s4WmlryGoKH9rAke9OyIoH1
 3u9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=1pogo+Rv5tv/SQVuIFRfnUxU3Jbc6+ErgEhXQlEuH7Q=;
 b=7hREDtA+6Vg77ULJPVfIGUxAaRcwZ5YThsM8ivzv4QhyRUXdNoHnqMQzAbIdeuVBVx
 FGt+joUyYBXA4/MbE/sj7i0ShD9nYik7ctLzEhuPEEkUc7CXW4qMvnmLkfxB5EPyPBwf
 hn61DnhM9qFl3jSzkpDmkiviUkmqo8dTkAuufnXgE+KcwjUU9q6LCgPQ2EZhT4YITBik
 90shT+K9x0agrWLB9wNpi46fydPIy2X5FTxjvg3HYuh1wFTOuGldjsniwlWeFog98eMA
 /xepfWBpvxksUpxjp42HUzjMtABE19oibRtrMbyH3Cm4UvWqE9A3Knw0T4SAuSRRVwpR
 qjoQ==
X-Gm-Message-State: AOAM532TjHtcc6KxFzLYRcrLkhFZC4B1oY0b3qr4ZDbmN+cQ9TSlt4g8
 pnxLxwkfB7+vPsOKl2M+Uw6FwRR4gbZCQX2D03oJGuKS
X-Google-Smtp-Source: ABdhPJxKwfq4ycqFXAM+C8AheHuI+NB1Jymb9X57td3iSrPCizEAfyrJbVEDX+hf+1fVrrb5pR/iFCEG7v/503K0ua8=
X-Received: by 2002:a05:600c:6011:b0:398:fa3:c02d with SMTP id
 az17-20020a05600c601100b003980fa3c02dmr12803839wmb.183.1653918476657; Mon, 30
 May 2022 06:47:56 -0700 (PDT)
MIME-Version: 1.0
References: <20220529162936.2539901-1-robdclark@gmail.com>
 <0bf230f4-c888-b9c9-f061-7450406baa4a@suse.de>
In-Reply-To: <0bf230f4-c888-b9c9-f061-7450406baa4a@suse.de>
From: Rob Clark <robdclark@gmail.com>
Date: Mon, 30 May 2022 06:47:55 -0700
Message-ID: <CAF6AEGthAfWyAvbuE4EP+u52LEKS2Fs6X=gG8qUjc7gci6oh-A@mail.gmail.com>
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

On Mon, May 30, 2022 at 12:26 AM Thomas Zimmermann <tzimmermann@suse.de> wr=
ote:
>
> Hi
>
> Am 29.05.22 um 18:29 schrieb Rob Clark:
> > From: Rob Clark <robdclark@chromium.org>
> >
> > If a GEM object is allocated, and then exported as a dma-buf fd which i=
s
> > mmap'd before or without the GEM buffer being directly mmap'd, the
> > vma_node could be unitialized.  This leads to a situation where the CPU
> > mapping is not correctly torn down in drm_vma_node_unmap().
>
> Which drivers are affected by this problem?
>
> I checked several drivers and most appear to be initializing the offset
> during object construction, such as GEM SHMEM. [1] TTM-based drivers
> also seem unaffected. [2]
>
>  From a quick grep, only etnaviv, msm and omapdrm appear to be affected?
> They only seem to run drm_gem_create_mmap_offset() from their
> ioctl-handling code.
>
> If so, I'd say it's preferable to fix these drivers and put a
> drm_WARN_ONCE() into drm_gem_prime_mmap().

That is good if fewer drivers are affected, however I disagree with
your proposal.  At least for freedreno userspace, a lot of bo's never
get mmap'd (either directly of via dmabuf), so we should not be
allocating a mmap offset unnecessarily.

BR,
-R

> Best regards
> Thomas
>
> [1]
> https://elixir.bootlin.com/linux/v5.18/source/drivers/gpu/drm/drm_gem_shm=
em_helper.c#L85
> [2]
> https://elixir.bootlin.com/linux/v5.18/source/drivers/gpu/drm/ttm/ttm_bo.=
c#L1002
>
> >
> > Fixes: e5516553999f ("drm: call drm_gem_object_funcs.mmap with fake off=
set")
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > ---
> > Note, it's possible the issue existed in some related form prior to the
> > commit tagged with Fixes.
> >
> >   drivers/gpu/drm/drm_prime.c | 5 +++++
> >   1 file changed, 5 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
> > index e3f09f18110c..849eea154dfc 100644
> > --- a/drivers/gpu/drm/drm_prime.c
> > +++ b/drivers/gpu/drm/drm_prime.c
> > @@ -716,6 +716,11 @@ int drm_gem_prime_mmap(struct drm_gem_object *obj,=
 struct vm_area_struct *vma)
> >       struct file *fil;
> >       int ret;
> >
> > +     /* Ensure that the vma_node is initialized: */
> > +     ret =3D drm_gem_create_mmap_offset(obj);
> > +     if (ret)
> > +             return ret;
> > +
> >       /* Add the fake offset */
> >       vma->vm_pgoff +=3D drm_vma_node_start(&obj->vma_node);
> >
>
> --
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
> (HRB 36809, AG N=C3=BCrnberg)
> Gesch=C3=A4ftsf=C3=BChrer: Ivo Totev
