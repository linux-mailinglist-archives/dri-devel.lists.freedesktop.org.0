Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 209AD4DDC69
	for <lists+dri-devel@lfdr.de>; Fri, 18 Mar 2022 16:06:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FAAC10E9E2;
	Fri, 18 Mar 2022 15:06:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5D5A10E9E2;
 Fri, 18 Mar 2022 15:06:16 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id r10so12145269wrp.3;
 Fri, 18 Mar 2022 08:06:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pG68kiu/++U7tqyFs9qijXM9HYdZLbHBS4VEGs1eM0I=;
 b=Ri+IYudXxdnlsvQY3QJh6kMqmIlSISE8BeVr71HKzveKdHoyllvY4vjSlZ+UIprX1B
 a4Bj0KhALFAKV0/HsLKSQG9e2x0CC3wRfiHZGOdJw3kxRDSfkTPF9s43Ej5kpLglcqor
 MV00SYcOTvVClsd430MSmdDKE4I0ninaxZCvuX3Bgt2G8/F+FI1Ig69vrN5tl9jutDju
 ku7QfWoq8zvVra0rWjwOJNVzYZFBbjG1KW5g1wXNSVryszIVjSXSHTdr5jb/gxQvD7Ur
 nKUFT+/VVHXeM551HxsZ6Ggn9o/RvpuSgYjyVJnWNRwHOULYiQff2EBRtWd0vYLWDHnp
 F5VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pG68kiu/++U7tqyFs9qijXM9HYdZLbHBS4VEGs1eM0I=;
 b=sxFJcXLFWcdvq62tXJ5BYPqB9O3hU9S5hB1LN9sqY3fQ2b4OcGnU1tuncxiwqbRSkq
 08Uuf/vxfv8u4LA2ORz9wn7T4yVRTN1OnB4eCdbyTZVgL1jHZ2qykrzcNe+d7/l8nnZD
 99XN/qWEC2OA8qLBOCDPtMzZHfK9FAVh78zMl7T1BeqkJVnDqOJso7WIAK7RzUYcNahs
 NWPc6nL5kHO0LIi+jdlOo0T8Wz896SOj/IxOjuD79GKTc06WTn5g+wI0RLyGnI1cbmsq
 glvIFekF2Za+SXIhMFNyqOVGfqKp0c+WVJF5CFodXTLEeuh9Gx8j/Q6s6fLcekbjM2Mm
 +NNA==
X-Gm-Message-State: AOAM532tJH6NBFkOVPjfAxueSpktF7cY7ECZQXlZqiFl2k4d5ZwzzGrY
 Pr0vxDl57FyzKabXP+VexUA1l0OsIgBRKoAizjY=
X-Google-Smtp-Source: ABdhPJwM9l/MXHGIr1umxgGzV4s9hhgx8LJL7YXtZMHDO2SJbjgrcaNg81bfFHjfTAsi9Ohk3p2Obnd4dTBWS37CRLU=
X-Received: by 2002:adf:dd4d:0:b0:203:f178:b78b with SMTP id
 u13-20020adfdd4d000000b00203f178b78bmr5002998wrm.93.1647615975124; Fri, 18
 Mar 2022 08:06:15 -0700 (PDT)
MIME-Version: 1.0
References: <20220317002950.193449-1-robdclark@gmail.com>
 <20220317002950.193449-4-robdclark@gmail.com>
 <20220317082121.GH1841@kadam>
 <CAF6AEGsnXz05fCnYAvFk+Hp-2z7N1kdVS0kYKn7+ejohLp8H7w@mail.gmail.com>
 <20220318071843.GF336@kadam>
In-Reply-To: <20220318071843.GF336@kadam>
From: Rob Clark <robdclark@gmail.com>
Date: Fri, 18 Mar 2022 08:06:57 -0700
Message-ID: <CAF6AEGs+yfLHzFag4dMNiBxO7fcVQFSP+4n8zdfttwXpeS+X5w@mail.gmail.com>
Subject: Re: [PATCH 3/3] drm/msm: Add a way to override processes comm/cmdline
To: Dan Carpenter <dan.carpenter@oracle.com>
Content-Type: text/plain; charset="UTF-8"
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
 freedreno <freedreno@lists.freedesktop.org>, Emma Anholt <emma@anholt.net>,
 Jonathan Marek <jonathan@marek.ca>, David Airlie <airlied@linux.ie>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, Sean Paul <sean@poorly.run>,
 open list <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Mar 18, 2022 at 12:19 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> On Thu, Mar 17, 2022 at 08:03:59AM -0700, Rob Clark wrote:
> > > > diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
> > > > index 4ec62b601adc..68f3f8ade76d 100644
> > > > --- a/drivers/gpu/drm/msm/msm_gpu.c
> > > > +++ b/drivers/gpu/drm/msm/msm_gpu.c
> > > > @@ -364,14 +364,21 @@ static void retire_submits(struct msm_gpu *gpu);
> > > >
> > > >  static void get_comm_cmdline(struct msm_gem_submit *submit, char **comm, char **cmd)
> > > >  {
> > > > +     struct msm_file_private *ctx = submit->queue->ctx;
> > > >       struct task_struct *task;
> > > >
> > > > +     *comm = kstrdup(ctx->comm, GFP_KERNEL);
> > > > +     *cmd  = kstrdup(ctx->cmdline, GFP_KERNEL);
> > > > +
> > > >       task = get_pid_task(submit->pid, PIDTYPE_PID);
> > > >       if (!task)
> > > >               return;
> > > >
> > > > -     *comm = kstrdup(task->comm, GFP_KERNEL);
> > > > -     *cmd = kstrdup_quotable_cmdline(task, GFP_KERNEL);
> > > > +     if (!*comm)
> > > > +             *comm = kstrdup(task->comm, GFP_KERNEL);
> > >
> > > What?
> > >
> > > If the first allocation failed, then this one is going to fail as well.
> > > Just return -ENOMEM.  Or maybe this is meant to be checking for an empty
> > > string?
> >
> > fwiw, if ctx->comm is NULL, the kstrdup() will return NULL, so this
> > isn't intended to deal with OoM, but the case that comm and/or cmdline
> > is not overridden.
>
> Ah, I should have thought about that.  Thanks!

np, I realized it was fairly non-obvious so I added a comment in v2 to
hopefully make it more clear

BR,
-R

> regards,
> dan carpenter
>
