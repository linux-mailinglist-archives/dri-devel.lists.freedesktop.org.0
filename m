Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 34ED8780E37
	for <lists+dri-devel@lfdr.de>; Fri, 18 Aug 2023 16:46:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C983C10E52D;
	Fri, 18 Aug 2023 14:45:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E4A010E52D
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Aug 2023 14:45:55 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-52256241c50so1262199a12.3
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Aug 2023 07:45:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1692369953; x=1692974753;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9oUM9/mBxM/fM3PWNRCfa8g7S6tbN21j4///WI8j9MA=;
 b=XUGggOyAVqYBg+LKTIOOoLrvqedtadFT9Wxpp8uGtRFYgF9inZ9wwKPs06WRsw8mL1
 D9wAXq3yz+iL/pGpyNTTUBlkVsbOtWnBISvfW2xGMyUIBCxbXQtKfUuGgT5zeuw0NykK
 Ep7lMLYvKDimIUFTLTY3llQA0eS6bI9aRahqSOBogCaeRgb4zZL6KxoVERCXWUbfjpPY
 lDPpqxFxIPcyRTCgZ012DxS1tUauC6AHgaHtFj3B4mWmVLHsdROM+DlRR4L4zPWIRPJz
 ghWXvanXke4z1+Pzrr5O2suyj6jNq1NuRG7dPSTu3Mb3QfrjzlsRa34MswmktumK2KfV
 n7kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692369953; x=1692974753;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9oUM9/mBxM/fM3PWNRCfa8g7S6tbN21j4///WI8j9MA=;
 b=XBZ0u+ZUCJgv0hthoDCZAmpb3w1IeObEbP47rsstJFK4BwujvtI/Oq3k/7t1GqvdZ1
 Jj9RqcQd8f+Xzl2h3mZ5FhBL9fOLETNbftITS06+TXbOcnfwxDdOmYNGX0wSLir6RRt2
 43MunqvRpyQjLK9u7B7raoIbOSMQWyGKgvecThjPbEqF/Ey6QhUbWXu2qNbpBTOPASyc
 bA24jmTh7a8AQ8u7EZGVuL3pC2vZknDIsn/MaSaN4LdD1+hedY7NANaSqylOB/wcKYxF
 7SJEAfX6jfO2MtxH9D8/5J9gbLcvG+UYEtoMJZAGyAkqioVwh4I2x6QtyS6++egblUh1
 YgjA==
X-Gm-Message-State: AOJu0YzsqNDC/mWtK1EPPDogKq5IcCeEtguVqpDUge/ZmPCMIbXwmL/p
 XHn1xumGVXWKLyFi3D0t26w3pamxBRbi0bQ+sCk=
X-Google-Smtp-Source: AGHT+IHQicJnj+KzstlocxgU0S0SH4NUFafCvFaQE46hysnluGxLLtzMIAhK6qT5mNxk3Mz55kg2ixMzO/vTb2wjhqM=
X-Received: by 2002:a17:907:2c6a:b0:99b:cfda:eded with SMTP id
 ib10-20020a1709072c6a00b0099bcfdaededmr2389993ejc.52.1692369953290; Fri, 18
 Aug 2023 07:45:53 -0700 (PDT)
MIME-Version: 1.0
References: <20230817213729.110087-1-robdclark@gmail.com>
 <647d3838-0d9a-d9d0-b057-87cb4b0f9c16@amd.com>
In-Reply-To: <647d3838-0d9a-d9d0-b057-87cb4b0f9c16@amd.com>
From: Rob Clark <robdclark@gmail.com>
Date: Fri, 18 Aug 2023 07:45:41 -0700
Message-ID: <CAF6AEGuW7thT9qvWwapPcgDUbCKiWOigMMS3Bj5EMAZZyT0enQ@mail.gmail.com>
Subject: Re: [Linaro-mm-sig] [PATCH] dma-buf/sw_sync: Avoid recursive lock
 during fence signal
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
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
Cc: Rob Clark <robdclark@chromium.org>, Gustavo Padovan <gustavo@padovan.org>,
 open list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 Chris Wilson <chris@chris-wilson.co.uk>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 "open list:SYNC FILE FRAMEWORK" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Aug 18, 2023 at 2:09=E2=80=AFAM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> Am 17.08.23 um 23:37 schrieb Rob Clark:
> > From: Rob Clark <robdclark@chromium.org>
> >
> > If a signal callback releases the sw_sync fence, that will trigger a
> > deadlock as the timeline_fence_release recurses onto the fence->lock
> > (used both for signaling and the the timeline tree).
> >
> > To avoid that, temporarily hold an extra reference to the signalled
> > fences until after we drop the lock.
> >
> > (This is an alternative implementation of https://patchwork.kernel.org/=
patch/11664717/
> > which avoids some potential UAF issues with the original patch.)
> >
> > Reported-by: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
> > Fixes: d3c6dd1fb30d ("dma-buf/sw_sync: Synchronize signal vs syncpt fre=
e")
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > ---
> >   drivers/dma-buf/sw_sync.c | 10 ++++++++++
> >   1 file changed, 10 insertions(+)
> >
> > diff --git a/drivers/dma-buf/sw_sync.c b/drivers/dma-buf/sw_sync.c
> > index 63f0aeb66db6..ceb6a0408624 100644
> > --- a/drivers/dma-buf/sw_sync.c
> > +++ b/drivers/dma-buf/sw_sync.c
> > @@ -191,6 +191,7 @@ static const struct dma_fence_ops timeline_fence_op=
s =3D {
> >    */
> >   static void sync_timeline_signal(struct sync_timeline *obj, unsigned =
int inc)
> >   {
> > +     LIST_HEAD(signalled);
> >       struct sync_pt *pt, *next;
> >
> >       trace_sync_timeline(obj);
> > @@ -203,9 +204,13 @@ static void sync_timeline_signal(struct sync_timel=
ine *obj, unsigned int inc)
> >               if (!timeline_fence_signaled(&pt->base))
> >                       break;
> >
> > +             dma_fence_get(&pt->base);
>
> Question is why don't have the fences a reference on the list in the
> first place?

As best I can tell, it is because the fences hold a reference to the
timeline, so a reference in the other direction would cause a loop.

BR,
-R

> > +
> >               list_del_init(&pt->link);
> >               rb_erase(&pt->node, &obj->pt_tree);
> >
> > +             list_add_tail(&pt->link, &signalled);
>
> Instead of list_del()/list_add_tail() you could also use
> list_move_tail() here.
>
> > +
> >               /*
> >                * A signal callback may release the last reference to th=
is
> >                * fence, causing it to be freed. That operation has to b=
e
> > @@ -218,6 +223,11 @@ static void sync_timeline_signal(struct sync_timel=
ine *obj, unsigned int inc)
> >       }
> >
> >       spin_unlock_irq(&obj->lock);
> > +
> > +     list_for_each_entry_safe(pt, next, &signalled, link) {
> > +             list_del(&pt->link);
>
> You must use list_del_init() here or otherwise the pt->link will keep
> pointing to the prev/next entries and the list_empty() check in
> timeline_fence_release() will fail and potentially corrupt things.
>
> Regards,
> Christian.
>
> > +             dma_fence_put(&pt->base);
> > +     }
> >   }
> >
> >   /**
>
