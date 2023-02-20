Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 342CE69D12B
	for <lists+dri-devel@lfdr.de>; Mon, 20 Feb 2023 17:15:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADCD610E6E2;
	Mon, 20 Feb 2023 16:15:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com
 [IPv6:2607:f8b0:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9438210E6DF;
 Mon, 20 Feb 2023 16:14:58 +0000 (UTC)
Received: by mail-oi1-x22e.google.com with SMTP id bm20so1008608oib.7;
 Mon, 20 Feb 2023 08:14:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=yucdNwlCfsGGEjZdnJPvfOZKmj3CAADyiPAf5hjswZg=;
 b=ZxnDUIK9eHPfiknVqJN5rt64dYRWzqsyM6ai87lOd3rGkYut+gJ/n+6Q60l5pl9X0m
 aA2xVnQMpHNtR7PQ8ZuDMhsvhBxEIA6RVe5PFIYbQHMt5hbHT4I1ZGY3ojxcWR/DON9r
 GtImPbcTfYDxbU1M08ylmtdGi/pU3DvNMyn9R6NvYbuui4FinXluI/67qPQjjefFcY4y
 btiSdrQHL2kv3JuRmJtxS7dpCBcfjo2n+2xcY02Nsbm6CRH6XFbnVzpgWu9oQybHP09j
 SAXeRZCUoim+iykMYQIdC3P3AY5/YPuVOE1HcjfjBHkoZWXNDqneQskNWo5Z0xJsKYRa
 TNMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yucdNwlCfsGGEjZdnJPvfOZKmj3CAADyiPAf5hjswZg=;
 b=U4pcwc7diMmuMBAwcM3sAidIuzCOwMb5rc4bH1wR2dGuX3ceh9IwSCxi28Ss6z+ulY
 T+bBo2yS+YhobJl/OevIWCJ0mNoUKa3fmGzd4Ii+r2qLLNW8q+4QJzpw71RqDmugO26G
 5Dhhlhetr3x7OxQ/g27LEdApPdrrs7h3uWxOGa2nsJUM2FPkcTHcTYecEuMs+xLwGqKh
 C302S7C0Az70yE6SewZe2gkrJVfl91nptsNKK7J1BoZVBFeP1vlrakZxstDH2zdSWHAf
 1xVMlqMSIFiKBItbTAPEpy0ZdBdEU9O9S9zDaXDUgnq6ecqmv7HDtKLtAU1PuO9MgiEl
 /gEg==
X-Gm-Message-State: AO0yUKX2CVH8L2JlJWxMa355+YRgAg1FmJmTFYYYu2dpDzH84B1y9XcE
 ofICmwlzAl0LE7JQqKxDWtrVDBlXNgfntPYUfT0=
X-Google-Smtp-Source: AK7set+n1QvPydxi+hQlZFC/9h20UVfLJWhf+ldIyg34MhCT3B1Lw/a7cCOBNd9D7mP6aZ3TpheYxEk8RFxISNtjFbE=
X-Received: by 2002:a05:6808:ec7:b0:364:c0a5:1fcf with SMTP id
 q7-20020a0568080ec700b00364c0a51fcfmr1104755oiv.58.1676909697815; Mon, 20 Feb
 2023 08:14:57 -0800 (PST)
MIME-Version: 1.0
References: <20230218211608.1630586-1-robdclark@gmail.com>
 <20230218211608.1630586-7-robdclark@gmail.com>
 <20230220105345.70e46fa5@eldfell>
In-Reply-To: <20230220105345.70e46fa5@eldfell>
From: Rob Clark <robdclark@gmail.com>
Date: Mon, 20 Feb 2023 08:14:47 -0800
Message-ID: <CAF6AEGv9fLQCD65ytRTGp=EkNB1QoZYH5ArphgGQALV9J08Cmw@mail.gmail.com>
Subject: Re: [PATCH v4 06/14] dma-buf/sync_file: Support (E)POLLPRI
To: Pekka Paalanen <ppaalanen@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>, Gustavo Padovan <gustavo@padovan.org>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel@daenzer.net>,
 open list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Alex Deucher <alexander.deucher@amd.com>, freedreno@lists.freedesktop.org,
 Sumit Semwal <sumit.semwal@linaro.org>,
 "open list:SYNC FILE FRAMEWORK" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Feb 20, 2023 at 12:53 AM Pekka Paalanen <ppaalanen@gmail.com> wrote:
>
> On Sat, 18 Feb 2023 13:15:49 -0800
> Rob Clark <robdclark@gmail.com> wrote:
>
> > From: Rob Clark <robdclark@chromium.org>
> >
> > Allow userspace to use the EPOLLPRI/POLLPRI flag to indicate an urgent
> > wait (as opposed to a "housekeeping" wait to know when to cleanup after
> > some work has completed).  Usermode components of GPU driver stacks
> > often poll() on fence fd's to know when it is safe to do things like
> > free or reuse a buffer, but they can also poll() on a fence fd when
> > waiting to read back results from the GPU.  The EPOLLPRI/POLLPRI flag
> > lets the kernel differentiate these two cases.
> >
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
>
> Hi,
>
> where would the UAPI documentation of this go?
> It seems to be missing.

Good question, I am not sure.  The poll() man page has a description,
but my usage doesn't fit that _exactly_ (but OTOH the description is a
bit vague).

> If a Wayland compositor is polling application fences to know which
> client buffer to use in its rendering, should the compositor poll with
> PRI or not? If a compositor polls with PRI, then all fences from all
> applications would always be PRI. Would that be harmful somehow or
> would it be beneficial?

I think a compositor would rather use the deadline ioctl and then poll
without PRI.  Otherwise you are giving an urgency signal to the fence
signaller which might not necessarily be needed.

The places where I expect PRI to be useful is more in mesa (things
like glFinish(), readpix, and other similar sorts of blocking APIs)

BR,
-R

>
>
> Thanks,
> pq
>
> > ---
> >  drivers/dma-buf/sync_file.c | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> >
> > diff --git a/drivers/dma-buf/sync_file.c b/drivers/dma-buf/sync_file.c
> > index fb6ca1032885..c30b2085ee0a 100644
> > --- a/drivers/dma-buf/sync_file.c
> > +++ b/drivers/dma-buf/sync_file.c
> > @@ -192,6 +192,14 @@ static __poll_t sync_file_poll(struct file *file, poll_table *wait)
> >  {
> >       struct sync_file *sync_file = file->private_data;
> >
> > +     /*
> > +      * The POLLPRI/EPOLLPRI flag can be used to signal that
> > +      * userspace wants the fence to signal ASAP, express this
> > +      * as an immediate deadline.
> > +      */
> > +     if (poll_requested_events(wait) & EPOLLPRI)
> > +             dma_fence_set_deadline(sync_file->fence, ktime_get());
> > +
> >       poll_wait(file, &sync_file->wq, wait);
> >
> >       if (list_empty(&sync_file->cb.node) &&
>
