Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70241282E76
	for <lists+dri-devel@lfdr.de>; Mon,  5 Oct 2020 02:09:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51DD089C17;
	Mon,  5 Oct 2020 00:09:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31E7989C16;
 Mon,  5 Oct 2020 00:09:41 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id m6so7606580wrn.0;
 Sun, 04 Oct 2020 17:09:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1ANfg3S5CC8bE/UKRRj/hwXpqbswu89gsCaaWsI1hDQ=;
 b=PxyPAEdNh2qvXFbWkKrPJ8KPmnWPmT2SKIgNwuRYb6MAJMExP204dfriEl7lNANvyM
 kCCkSVC0jEhQ8FFZ9A3AfzgoVrxvx1zas1vgNuzUqMbbYW4ft+FAQaPT6zHxDkUtkOTP
 BKLbMytpzm8gXlYZDx8qx1E7gRTrPNn2LzQLo1b+4rkh4RqoVIe6LrIrde3q+OyBUF0r
 D2GDsBqQChiQCDKtNEY1CC8u9+WpHdh4jSUZW3znxLcEUgFmObnlWyn2MFSWd+cEN8+I
 tcLnulGKwxsrUC0cMd2LIKC6Lla/3JlCEwaTC62nTsxY3+ynPHXC8si7l1P8g4zZPnOU
 9+ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1ANfg3S5CC8bE/UKRRj/hwXpqbswu89gsCaaWsI1hDQ=;
 b=j9a9hCWOJ7ZwHK83qEdzvtBnlrsKeoKIz+G3uTbjlThGW/OfgsHvLZB/iYvhlSZrAF
 AGHIpaSqK8pwUemM+SPcUx7Y8dDhknXICAGrmvOL+EqEt2lnDh2KWUjDg2ye6bM8TvDB
 24u7AQ+FSvBNZyp/oS2BwoVitlyTO0jN53IVT958NRNJFmrv/nnVUMKyCBxr+fchNC22
 K1B3RlT4zgcD1z0ACnkSoWVbMsiDh0FB9M7iQ5t1hcUZe+T6Gx0M8EoNT9ioWmfuMBih
 vLsVF/XHPhiYDtO8bK6ckIPvDWehiC8Q/RY/QTgWvXyMtIkxOC35x3bWEOhXsc4dV6Dc
 htjQ==
X-Gm-Message-State: AOAM531QKoZfQmcKIGJY3Xu3H/8VEMvZnMEKvRJXG2yU+c5NuQY97TXk
 D6kgtep4IGeuwOejZUKelryCb/0Yw1yh4fwuUmY=
X-Google-Smtp-Source: ABdhPJxwaxtwbgp9uz+hPQ7cBIRm3omXtyo+Lk87n93lkMddrksV668Q71MQgWfc2epKqbRNNChU/GIZ6VBDT0u7sBI=
X-Received: by 2002:a5d:4bcf:: with SMTP id l15mr14775799wrt.132.1601856579631; 
 Sun, 04 Oct 2020 17:09:39 -0700 (PDT)
MIME-Version: 1.0
References: <20201004192152.3298573-1-robdclark@gmail.com>
 <20201004192152.3298573-5-robdclark@gmail.com>
 <CAKMK7uHrP1ijVORpW0xvMX4M_0HQpfzUk2bE576gpzSPug-M6A@mail.gmail.com>
In-Reply-To: <CAKMK7uHrP1ijVORpW0xvMX4M_0HQpfzUk2bE576gpzSPug-M6A@mail.gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Sun, 4 Oct 2020 17:10:47 -0700
Message-ID: <CAF6AEGv49O97YQXJeUYzxRDUTE8fhtRKeKT6RXaEcJUo79mXQw@mail.gmail.com>
Subject: Re: [PATCH 04/14] drm/msm: Add priv->mm_lock to protect
 active/inactive lists
To: Daniel Vetter <daniel@ffwll.ch>
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
 Sean Paul <sean@poorly.run>, open list <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Oct 4, 2020 at 3:15 PM Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Sun, Oct 4, 2020 at 9:21 PM Rob Clark <robdclark@gmail.com> wrote:
> >
> > From: Rob Clark <robdclark@chromium.org>
> >
> > Rather than relying on the big dev->struct_mutex hammer, introduce a
> > more specific lock for protecting the bo lists.
> >
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > ---
> >  drivers/gpu/drm/msm/msm_debugfs.c      |  7 +++++++
> >  drivers/gpu/drm/msm/msm_drv.c          |  1 +
> >  drivers/gpu/drm/msm/msm_drv.h          | 13 +++++++++++-
> >  drivers/gpu/drm/msm/msm_gem.c          | 28 +++++++++++++++-----------
> >  drivers/gpu/drm/msm/msm_gem_shrinker.c | 12 +++++++++++
> >  drivers/gpu/drm/msm/msm_gpu.h          |  5 ++++-
> >  6 files changed, 52 insertions(+), 14 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/msm_debugfs.c b/drivers/gpu/drm/msm/msm_debugfs.c
> > index ee2e270f464c..64afbed89821 100644
> > --- a/drivers/gpu/drm/msm/msm_debugfs.c
> > +++ b/drivers/gpu/drm/msm/msm_debugfs.c
> > @@ -112,6 +112,11 @@ static int msm_gem_show(struct drm_device *dev, struct seq_file *m)
> >  {
> >         struct msm_drm_private *priv = dev->dev_private;
> >         struct msm_gpu *gpu = priv->gpu;
> > +       int ret;
> > +
> > +       ret = mutex_lock_interruptible(&priv->mm_lock);
> > +       if (ret)
> > +               return ret;
> >
> >         if (gpu) {
> >                 seq_printf(m, "Active Objects (%s):\n", gpu->name);
> > @@ -121,6 +126,8 @@ static int msm_gem_show(struct drm_device *dev, struct seq_file *m)
> >         seq_printf(m, "Inactive Objects:\n");
> >         msm_gem_describe_objects(&priv->inactive_list, m);
> >
> > +       mutex_unlock(&priv->mm_lock);
> > +
> >         return 0;
> >  }
> >
> > diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
> > index 49685571dc0e..dc6efc089285 100644
> > --- a/drivers/gpu/drm/msm/msm_drv.c
> > +++ b/drivers/gpu/drm/msm/msm_drv.c
> > @@ -441,6 +441,7 @@ static int msm_drm_init(struct device *dev, struct drm_driver *drv)
> >         init_llist_head(&priv->free_list);
> >
> >         INIT_LIST_HEAD(&priv->inactive_list);
> > +       mutex_init(&priv->mm_lock);
>
> I highly recommend you drop a
>
> fs_reclaim_acquire(GFP_KERNEL);
> might_lock(&priv->mm_lock);
> fs_reclaim_release(GFP_KERNEL);
>
> in here to teach lockdep about your ordering against the shrinker.
> Gives you full testing every boot, even if your shrinker never gets
> called.

Good idea..

(tbf, I have tested this with android+lockdep which pretty is great
shrinker exercise.. but immediate notification of future problems is a
good plan)

BR,
-R
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
