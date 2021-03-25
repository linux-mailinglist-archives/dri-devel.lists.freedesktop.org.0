Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AC925348957
	for <lists+dri-devel@lfdr.de>; Thu, 25 Mar 2021 07:48:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD92A6EB1F;
	Thu, 25 Mar 2021 06:48:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com
 [IPv6:2607:f8b0:4864:20::735])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B10F56EB1F
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Mar 2021 06:48:44 +0000 (UTC)
Received: by mail-qk1-x735.google.com with SMTP id c4so820886qkg.3
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Mar 2021 23:48:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=T5CjvFYDEtZ3kZrOVFQv//2YoZQXvV6dPPPaR37s0/M=;
 b=u42vQyq9npwV6wo2mn8Gb/P1O4BKWJjfNNG5ECMFoYSDSFss54BNtiHnMhfRKhUqzx
 VMQCcv1pQTcH8MdxkNVnqDbVq4Z0DO+M7qeBayVDyGX5HK9ZmMOoZ7nycbQxHf79vHe2
 +9pax28kyxhcroqAnfSj991jH1gDW3lfFsbaUVCeoNqFgfWfGxCxfm6dNfeko+wTgFqK
 6ilRMOP5Mfxv7VRmSYnoA0BiqAiEZz5PcHw7MnG5SK5op6YdIneMsomUX+zeElFgHuNS
 6HA92jwaWhlLcgJ7NKQUlyi8XTPkn9vKtRr0pOZozf1btzfuN9pPRza+fSwitlcwvoWU
 bQww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=T5CjvFYDEtZ3kZrOVFQv//2YoZQXvV6dPPPaR37s0/M=;
 b=eg978Fk3WDBljAo0zxI2j+NNomJoV0e79oBXQ5bWO8UAr4mjn6BZ46vWI1ZXWZVatJ
 jRr1it+pizOjqCNYLiylXF0eqaadRp5os0SPOseNQymhzZ3pe03twvaMxqoAHU19xIkn
 9kgR9XU/i5D+l3bR/dl1IDZgtsdO3mKDlWUYCjpucMUbXffenF6cCnZ8UfVgfqwLiGVG
 zWHNHlnDeEG5SJIOUYjVH2nYs3dzLkv+NvhdeAnK8OvoyvY7SaLL5L1EZ1tV793iLVgK
 tXq1MgrQFDRBCL8WjgjbMDaGuvsyIYg8Uf3ys69YNIqqdwhbGdNOh/lsyn/i2poYZNUA
 SZaQ==
X-Gm-Message-State: AOAM532hNeQMaegL0ieMZW6i/Fy4RaPiK4WWh+Aw7NcoZKVHS8EWFGxO
 w6BgJVMGqSAN+h+FjZkdZ+9Jp+kuvqPfFmYNEtsH9w==
X-Google-Smtp-Source: ABdhPJzvuHIQMu8gosf36fWYs8QS4hqDSnRtedbl/Y969KzsphbiRmzb3t2DsUCOrDtiq1damp2ZtQBFoes/LA2xwVA=
X-Received: by 2002:a05:620a:410f:: with SMTP id
 j15mr6771758qko.424.1616654923419; 
 Wed, 24 Mar 2021 23:48:43 -0700 (PDT)
MIME-Version: 1.0
References: <20210320132840.1315853-1-dvyukov@google.com>
 <20210324220008.nqwwwfugyfngbn3x@smtp.gmail.com>
In-Reply-To: <20210324220008.nqwwwfugyfngbn3x@smtp.gmail.com>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Thu, 25 Mar 2021 07:48:32 +0100
Message-ID: <CACT4Y+bDcd+hdgkQyEvPRM1eSWSoud4EDhq4tLKS8wxFjr1F6w@mail.gmail.com>
Subject: Re: [PATCH] drm/vkms: fix misuse of WARN_ON
To: Melissa Wen <melissa.srw@gmail.com>
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
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 David Airlie <airlied@linux.ie>,
 syzbot+4fc21a003c8332eb0bdd@syzkaller.appspotmail.com,
 LKML <linux-kernel@vger.kernel.org>, DRI <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Mar 24, 2021 at 11:00 PM Melissa Wen <melissa.srw@gmail.com> wrote:
>
> On 03/20, Dmitry Vyukov wrote:
> > vkms_vblank_simulate() uses WARN_ON for timing-dependent condition
> > (timer overrun). This is a mis-use of WARN_ON, WARN_ON must be used
> > to denote kernel bugs. Use pr_warn() instead.
> >
> > Signed-off-by: Dmitry Vyukov <dvyukov@google.com>
> > Reported-by: syzbot+4fc21a003c8332eb0bdd@syzkaller.appspotmail.com
> > Cc: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
> > Cc: Melissa Wen <melissa.srw@gmail.com>
> > Cc: Haneen Mohammed <hamohammed.sa@gmail.com>
> > Cc: Daniel Vetter <daniel@ffwll.ch>
> > Cc: David Airlie <airlied@linux.ie>
> > Cc: dri-devel@lists.freedesktop.org
> > Cc: linux-kernel@vger.kernel.org
> > Change-Id: I7f01c288092bc7e472ec63af198f93ce3d8c49f7
> > ---
> >  drivers/gpu/drm/vkms/vkms_crtc.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/vkms/vkms_crtc.c b/drivers/gpu/drm/vkms/vkms_crtc.c
> > index 0443b7deeaef6..758d8a98d96b3 100644
> > --- a/drivers/gpu/drm/vkms/vkms_crtc.c
> > +++ b/drivers/gpu/drm/vkms/vkms_crtc.c
> > @@ -18,7 +18,8 @@ static enum hrtimer_restart vkms_vblank_simulate(struct hrtimer *timer)
> >
> >       ret_overrun = hrtimer_forward_now(&output->vblank_hrtimer,
> >                                         output->period_ns);
> > -     WARN_ON(ret_overrun != 1);
> > +     if (ret_overrun != 1)
> > +             pr_warn("%s: vblank timer overrun\n", __func__);
>
> Hi Dmitry,
>
> Thanks for your patch.
>
> Looks good to me.
> The Change-Id tag just seems a little noisy to me, but can be
> fixed while applying.

Yes, please drop Change-Id when applying if possible. Sorry for that.
Thanks for the review, Melissa.

> Acked-by: Melissa Wen <melissa.srw@gmail.com>
>
> >
> >       spin_lock(&output->lock);
> >       ret = drm_crtc_handle_vblank(crtc);
> >
> > base-commit: e94c55b8e0a0bbe9a026250cf31e2fa45957d776
> > --
> > 2.31.0.291.g576ba9dcdaf-goog
> >
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
