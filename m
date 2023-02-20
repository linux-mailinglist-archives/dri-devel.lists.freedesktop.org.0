Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2526C69D11A
	for <lists+dri-devel@lfdr.de>; Mon, 20 Feb 2023 17:09:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C64F10E6AD;
	Mon, 20 Feb 2023 16:09:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com
 [IPv6:2607:f8b0:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 285C510E144;
 Mon, 20 Feb 2023 16:09:16 +0000 (UTC)
Received: by mail-oi1-x22f.google.com with SMTP id bb6so1594371oib.11;
 Mon, 20 Feb 2023 08:09:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5qKwgEmFMvHxp8bhwKryOQIDMT3gDmSzeZYz7HFGi0A=;
 b=mcwIt39UTsOH/VD2CWB0f3XpfojSkJOsoHINEprOWCQfhExKIq9ldl6m1/7kJxUMJE
 g2ReIRbkPxlH8TDlSVNoy2zlDUBCWenL+AQSSKunKqtko03Q8eruiXp1s2mNTNfxxjAP
 5p1Qh6HvyEvUDwdiURvsx+ioU1hJKOg4Q8C+NQFppWyjKXeiL4RqqGHdwJFuwTmzKsp4
 OTVREXLeRILTF/F1FE9MTvoo4Vx2Zz5iU2OP+DwxW7sl6Y1JuWFjuLElVqkdLhCjrEFJ
 +WvBKHUtxeIuBOp/j/kuq4B2yS35No16DshXpt/B8oBI+93LUFEkYrYRD4R0U/fe1KsZ
 647A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5qKwgEmFMvHxp8bhwKryOQIDMT3gDmSzeZYz7HFGi0A=;
 b=kiEyx+JJpw3JGLyz0Wt6/zb+k/yXJKQLwcR+vlaIk0x1WmaAARBMo0OWdTrov1JYSx
 pXRQW3I83b5fYtVFyiEb4z2+U+BgtrofzFRy4yzCKqIBANv5hUtrDTKsclle6Xrw4FrO
 StHhnPLBhuGcVoU/LTtWaERUirz7YwYoxl0wy65yF4KQBi4jTSVqLvSprV/r1JKBxEZ6
 it/PeoEhHqA7w/zGi7Wx7NnSx86pibkyF/wkzhhh7r0RpoELbJqeDLOLCusij8mA/Fbv
 gaQLwyAQsGlLOg16PTCJk1m9xXDfIc7xgBByDdhg96HEltytU58ias+oKONWi/E40PkI
 OK2A==
X-Gm-Message-State: AO0yUKVC1mf0zGqywZzet9UYwKxK/6WULjO1I2m45IpyZljodPs7Dh2w
 kSCkYoKqpY6fQk3S7tilgPTSv5dJSR1EA5vWR+o=
X-Google-Smtp-Source: AK7set+aFRYNQDGiaDd/8xtOQGQcGZhiqPbhDzJH2jTmHgUMuPs3oBV9oiMJLS3mZRVOrAjR6iKZ0/p6GM5gSm52s04=
X-Received: by 2002:a05:6808:ec7:b0:364:c0a5:1fcf with SMTP id
 q7-20020a0568080ec700b00364c0a51fcfmr1103306oiv.58.1676909355341; Mon, 20 Feb
 2023 08:09:15 -0800 (PST)
MIME-Version: 1.0
References: <20230218211608.1630586-1-robdclark@gmail.com>
 <20230218211608.1630586-6-robdclark@gmail.com>
 <37ec0125-8d0b-7d87-321d-ed4c7c7b32a7@amd.com>
In-Reply-To: <37ec0125-8d0b-7d87-321d-ed4c7c7b32a7@amd.com>
From: Rob Clark <robdclark@gmail.com>
Date: Mon, 20 Feb 2023 08:09:04 -0800
Message-ID: <CAF6AEGtAHXQ05tWoXdbx3_TK+11+XN6J9wuXssSh3PswUhvwgg@mail.gmail.com>
Subject: Re: [PATCH v4 05/14] dma-buf/sync_file: Add SET_DEADLINE ioctl
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
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel@daenzer.net>,
 open list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Pekka Paalanen <ppaalanen@gmail.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Alex Deucher <alexander.deucher@amd.com>, freedreno@lists.freedesktop.org,
 Sumit Semwal <sumit.semwal@linaro.org>,
 "open list:SYNC FILE FRAMEWORK" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Feb 20, 2023 at 12:27 AM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> Am 18.02.23 um 22:15 schrieb Rob Clark:
> > From: Rob Clark <robdclark@chromium.org>
> >
> > The initial purpose is for igt tests, but this would also be useful for
> > compositors that wait until close to vblank deadline to make decisions
> > about which frame to show.
> >
> > The igt tests can be found at:
> >
> > https://gitlab.freedesktop.org/robclark/igt-gpu-tools/-/commits/fence-d=
eadline
> >
> > v2: Clarify the timebase, add link to igt tests
> >
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > ---
> >   drivers/dma-buf/sync_file.c    | 19 +++++++++++++++++++
> >   include/uapi/linux/sync_file.h | 22 ++++++++++++++++++++++
> >   2 files changed, 41 insertions(+)
> >
> > diff --git a/drivers/dma-buf/sync_file.c b/drivers/dma-buf/sync_file.c
> > index af57799c86ce..fb6ca1032885 100644
> > --- a/drivers/dma-buf/sync_file.c
> > +++ b/drivers/dma-buf/sync_file.c
> > @@ -350,6 +350,22 @@ static long sync_file_ioctl_fence_info(struct sync=
_file *sync_file,
> >       return ret;
> >   }
> >
> > +static int sync_file_ioctl_set_deadline(struct sync_file *sync_file,
> > +                                     unsigned long arg)
> > +{
> > +     struct sync_set_deadline ts;
> > +
> > +     if (copy_from_user(&ts, (void __user *)arg, sizeof(ts)))
> > +             return -EFAULT;
> > +
> > +     if (ts.pad)
> > +             return -EINVAL;
> > +
> > +     dma_fence_set_deadline(sync_file->fence, ktime_set(ts.tv_sec, ts.=
tv_nsec));
> > +
> > +     return 0;
> > +}
> > +
> >   static long sync_file_ioctl(struct file *file, unsigned int cmd,
> >                           unsigned long arg)
> >   {
> > @@ -362,6 +378,9 @@ static long sync_file_ioctl(struct file *file, unsi=
gned int cmd,
> >       case SYNC_IOC_FILE_INFO:
> >               return sync_file_ioctl_fence_info(sync_file, arg);
> >
> > +     case SYNC_IOC_SET_DEADLINE:
> > +             return sync_file_ioctl_set_deadline(sync_file, arg);
> > +
> >       default:
> >               return -ENOTTY;
> >       }
> > diff --git a/include/uapi/linux/sync_file.h b/include/uapi/linux/sync_f=
ile.h
> > index ee2dcfb3d660..c8666580816f 100644
> > --- a/include/uapi/linux/sync_file.h
> > +++ b/include/uapi/linux/sync_file.h
> > @@ -67,6 +67,20 @@ struct sync_file_info {
> >       __u64   sync_fence_info;
> >   };
> >
> > +/**
> > + * struct sync_set_deadline - set a deadline on a fence
> > + * @tv_sec:  seconds elapsed since epoch
> > + * @tv_nsec: nanoseconds elapsed since the time given by the tv_sec
> > + * @pad:     must be zero
> > + *
> > + * The timebase for the deadline is CLOCK_MONOTONIC (same as vblank)
> > + */
> > +struct sync_set_deadline {
> > +     __s64   tv_sec;
> > +     __s32   tv_nsec;
> > +     __u32   pad;
>
> IIRC struct timespec defined this as time_t/long (which is horrible for
> an UAPI because of the sizeof(long) dependency), one possible
> alternative is to use 64bit nanoseconds from CLOCK_MONOTONIC (which is
> essentially ktime).
>
> Not 100% sure if there is any preferences documented, but I think the
> later might be better.

The original thought is that this maps directly to clock_gettime()
without extra conversion needed, and is similar to other pre-ktime_t
UAPI.  But OTOH if userspace wants to add an offset, it is maybe
better to convert completely to ns in userspace and use a u64 (as that
is what ns_to_ktime() uses).. (and OFC whatever decision here also
applies to the syncobj wait ioctls)

I'm leaning towards u64 CLOCK_MONOTONIC ns if no one has a good
argument against that.

BR,
-R

> Either way the patch is Acked-by: Christian K=C3=B6nig
> <christian.koenig@amd.com> for this patch.
>
> Regards,
> Christian.
>
> > +};
> > +
> >   #define SYNC_IOC_MAGIC              '>'
> >
> >   /**
> > @@ -95,4 +109,12 @@ struct sync_file_info {
> >    */
> >   #define SYNC_IOC_FILE_INFO  _IOWR(SYNC_IOC_MAGIC, 4, struct sync_file=
_info)
> >
> > +
> > +/**
> > + * DOC: SYNC_IOC_SET_DEADLINE - set a deadline on a fence
> > + *
> > + * Allows userspace to set a deadline on a fence, see dma_fence_set_de=
adline()
> > + */
> > +#define SYNC_IOC_SET_DEADLINE        _IOW(SYNC_IOC_MAGIC, 5, struct sy=
nc_set_deadline)
> > +
> >   #endif /* _UAPI_LINUX_SYNC_H */
>
