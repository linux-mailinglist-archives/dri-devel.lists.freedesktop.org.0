Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23C88350AC1
	for <lists+dri-devel@lfdr.de>; Thu,  1 Apr 2021 01:28:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC34B6EBA3;
	Wed, 31 Mar 2021 23:28:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 658EE6EBA1;
 Wed, 31 Mar 2021 23:28:15 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 a132-20020a1c668a0000b029010f141fe7c2so1959544wmc.0; 
 Wed, 31 Mar 2021 16:28:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yXf9Lz5xugU13zm2GDio05xCri5WRi3ZI0/gGGK/ITQ=;
 b=fVjZh8q01HKLd3XrQLCnxpKNiMRzQX+a1JQXv8fkJnQjTcBMsXnXyVOXyDZyS3V6uO
 IGjXnGRcRH9PIJiv7/Ak7i8AKnYxURDYQGqztJrHF46iNSaJQEjooPTTuMQdzDhVGsGf
 MqJfa+jnylGy2eAO93pXaWDFTk2wFeCVhEkOlFDNzjO0pc9Rq+Z79CcSStZSpFtPQ4t8
 bc2HC1mPkhnSlo9XH/DSt1Itw/XCsriVs0WALJxXBme1S4Ka2WVMe9bs0Ck15Q7lmgZS
 hX/WIsJRvgCqfu6//hoCIYI1lhUco0UFkOmLvphvdn9bNPkVCAIP1HcwNzajIwwvzUQU
 CHEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yXf9Lz5xugU13zm2GDio05xCri5WRi3ZI0/gGGK/ITQ=;
 b=n2xb8/dDh9P3sQqSgyj4f2nRoAxzUWGoj82dZSoL5gQt4H8ifT3z4kXGV3qCIL1cKn
 1EgqIRQcds89WL87Q+NjYYN8y2gvdRw/zCzJB7IRv0PxBrvholUCEmArjJ17wYK+R7S7
 sZtBl+y4h7LTRu4w4grim+J8pkzS70h3l5w2D1UBSHrFOPD8OBPDbTWysnhKz6G2ha8o
 SLiMbXjdA44zv/VwKGuz58QEN1BNe8NR67wzfe7HgXeEQgNrIbeWqpbB3ZimHY0SGJvx
 oVO4c194MTPGKSq1FGlsAv+YPYsu0Dk53NEyXXlvfM2pUAkSxL2cWbgDFqH7kGU9/Exm
 ZhcQ==
X-Gm-Message-State: AOAM532iKYW8DgrKbV+H0rcczgqZTbVqPuPQP9e6i5c1OVgwwfDbntLL
 UXp/rePL4W3M4mLE7UpqcgLOuy+AETD13bR2h8Y=
X-Google-Smtp-Source: ABdhPJzjFPQTyLhGljm6gJsAPnH6mW7novnsekkyUIiwUjDDyh8Y4UydMqboFr1dAzMj69qcE1HCQB+lNhV2IEowvZI=
X-Received: by 2002:a05:600c:21d2:: with SMTP id
 x18mr5239495wmj.175.1617233293967; 
 Wed, 31 Mar 2021 16:28:13 -0700 (PDT)
MIME-Version: 1.0
References: <20210331221630.488498-1-robdclark@gmail.com>
 <20210331221630.488498-4-robdclark@gmail.com>
 <CAD=FV=UECYxLXQa_L572eLSVHq7pbxuA0zLvHzYHhCKy8K=9TA@mail.gmail.com>
In-Reply-To: <CAD=FV=UECYxLXQa_L572eLSVHq7pbxuA0zLvHzYHhCKy8K=9TA@mail.gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 31 Mar 2021 16:31:38 -0700
Message-ID: <CAF6AEGvxQeTFHn_ztzP=4eTQa_B106+SZ-8NjFk2RGYgRYJgSw@mail.gmail.com>
Subject: Re: [PATCH 3/4] drm/msm: Fix debugfs deadlock
To: Doug Anderson <dianders@chromium.org>
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
 "open list:DRM DRIVER FOR MSM ADRENO GPU"
 <freedreno@lists.freedesktop.org>, David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 "Kristian H. Kristensen" <hoegsberg@google.com>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Mar 31, 2021 at 4:13 PM Doug Anderson <dianders@chromium.org> wrote:
>
> Hi,
>
> On Wed, Mar 31, 2021 at 3:14 PM Rob Clark <robdclark@gmail.com> wrote:
> >
> > @@ -111,23 +111,15 @@ static const struct file_operations msm_gpu_fops = {
> >  static int msm_gem_show(struct drm_device *dev, struct seq_file *m)
> >  {
> >         struct msm_drm_private *priv = dev->dev_private;
> > -       struct msm_gpu *gpu = priv->gpu;
> >         int ret;
> >
> > -       ret = mutex_lock_interruptible(&priv->mm_lock);
> > +       ret = mutex_lock_interruptible(&priv->obj_lock);
> >         if (ret)
> >                 return ret;
> >
> > -       if (gpu) {
> > -               seq_printf(m, "Active Objects (%s):\n", gpu->name);
> > -               msm_gem_describe_objects(&gpu->active_list, m);
> > -       }
> > -
> > -       seq_printf(m, "Inactive Objects:\n");
> > -       msm_gem_describe_objects(&priv->inactive_dontneed, m);
> > -       msm_gem_describe_objects(&priv->inactive_willneed, m);
> > +       msm_gem_describe_objects(&priv->objects, m);
>
> I guess we no longer sort the by Active and Inactive but that doesn't
> really matter?

It turned out to be less useful to sort by active/inactive, as much as
just having the summary at the bottom that the last patch adds.  We
can already tell from the per-object entries whether it is
active/purgable/purged.

I did initially try to come up with an approach that let me keep this,
but it would basically amount to re-writing the gem_submit path
(because you cannot do any memory allocation under mm_lock)

>
> > @@ -174,7 +174,13 @@ struct msm_drm_private {
> >         struct msm_rd_state *hangrd;   /* debugfs to dump hanging submits */
> >         struct msm_perf_state *perf;
> >
> > -       /*
> > +       /**
> > +        * List of all GEM objects (mainly for debugfs, protected by obj_lock
>
> It wouldn't hurt to talk about lock ordering here? Like: "If we need
> the "obj_lock" and a "gem_lock" at the same time we always grab the
> "obj_lock" first.

good point

>
> > @@ -60,13 +60,20 @@ struct msm_gem_object {
> >          */
> >         uint8_t vmap_count;
> >
> > -       /* And object is either:
> > -        *  inactive - on priv->inactive_list
> > +       /**
> > +        * Node in list of all objects (mainly for debugfs, protected by
> > +        * struct_mutex
>
> Not "struct_mutex" in comment, right? Maybe "obj_lock" I think?

oh, right, forgot to fix that from an earlier iteration

BR,
-R
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
