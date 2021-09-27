Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A281841966F
	for <lists+dri-devel@lfdr.de>; Mon, 27 Sep 2021 16:31:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1E9789B7D;
	Mon, 27 Sep 2021 14:31:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DA7589581
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Sep 2021 14:31:34 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 136-20020a1c048e000000b0030d05169e9bso763194wme.4
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Sep 2021 07:31:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2mx71Ffj1LjI9dbNVEsMItvt4/c01TG+6Jn8XnjJkBA=;
 b=BnaCahteDxcsbqrbdc5Zu34nF/xoU1HeKj99e5MrhXbRLBb3eohTmHduzQ7Bvv7PlJ
 iHImPDIK81GUnxugHpzukmeRIYtnjuF2BfEtv4pVQhEVhr7Ow4OOhUq/+F6vItMlWsvV
 zbr7YpC6iVLD1oCoe+jdqBM4W7Y7IJr4Fc4deyeupJskOQkQprR4XLaTljPNIEIB0J/+
 jFD9iHjiKIpvH4ZRA741zvzAIMY1yB8HRvKOJGRbxRpxx44OKJ5O4j7e52tiGSRp88Ta
 a69wmF3jlTlNkSveRuD+7ERqrjt1l5BCsW6ZWTb4LXuoqgkviyhmSx3ZNNIiViQPxbb2
 cHXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2mx71Ffj1LjI9dbNVEsMItvt4/c01TG+6Jn8XnjJkBA=;
 b=fXNTUp2766eLxMAv28iUi0spQs+xxHTJBSPpJXtm0JoX+Z/7KrbUIQxcwhHN8v1C1o
 Cfb+gkM/EvxeeECV3w6iJZjuxFJvJ3P/AI7qsaqL5C6LTCfhNDEhwMI9b9B/PPltEAfT
 OGHjNK1SoJ339VjoUvOSUmf74KIXXZ5LZZMLsD3blSG2xvxk0YdLn92gmsnmHTeRX1mb
 jucRVoZ2ri6pIP6NaUeHpgtpj7thZVv1c+4pOh9SWuAZb/03VYdAQ+mfd8mx3Vjf7YIs
 UtEsR4RjQ1ge4z9YxoySaTFMq5bSJb7QMOUID5x/4H5xFdxa+ANnxGS9+nJ047wxjlQ7
 NB6g==
X-Gm-Message-State: AOAM533KltNvsG4tq3KOg5LDWmXIp2k1TrsWQSBcBN08trp+F2ArHtlz
 jFApMF7PtKz75EHGaEPXBh5QdzUD+OPab/ZnBv71QF1q
X-Google-Smtp-Source: ABdhPJxaMT5Ib0z3brv9yjSkdXxNC2Ep4DW2qUvpXe/nYwrumdJt3grX8mjdTKUoXXZV+xNfgBGfnHDh99X4mtG/+Wc=
X-Received: by 2002:a1c:f201:: with SMTP id s1mr4139651wmc.101.1632753092855; 
 Mon, 27 Sep 2021 07:31:32 -0700 (PDT)
MIME-Version: 1.0
References: <20210903184806.1680887-1-robdclark@gmail.com>
 <20210903184806.1680887-9-robdclark@gmail.com>
 <20210927114201.1f8fdc17@eldfell>
In-Reply-To: <20210927114201.1f8fdc17@eldfell>
From: Rob Clark <robdclark@gmail.com>
Date: Mon, 27 Sep 2021 07:36:05 -0700
Message-ID: <CAF6AEGudjfgN+x_KxyED+1XBod7yNqLN43or7vs8h7UKQmzK7Q@mail.gmail.com>
Subject: Re: [PATCH v3 8/9] dma-buf/sync_file: Add SET_DEADLINE ioctl
To: Pekka Paalanen <ppaalanen@gmail.com>
Cc: dri-devel <dri-devel@lists.freedesktop.org>, 
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Daniel Vetter <daniel@ffwll.ch>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>, 
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel@daenzer.net>, 
 Rob Clark <robdclark@chromium.org>, Sumit Semwal <sumit.semwal@linaro.org>, 
 Gustavo Padovan <gustavo@padovan.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 "open list:SYNC FILE FRAMEWORK" <linux-media@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Sep 27, 2021 at 1:42 AM Pekka Paalanen <ppaalanen@gmail.com> wrote:
>
> On Fri,  3 Sep 2021 11:47:59 -0700
> Rob Clark <robdclark@gmail.com> wrote:
>
> > From: Rob Clark <robdclark@chromium.org>
> >
> > The initial purpose is for igt tests, but this would also be useful for
> > compositors that wait until close to vblank deadline to make decisions
> > about which frame to show.
> >
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > ---
> >  drivers/dma-buf/sync_file.c    | 19 +++++++++++++++++++
> >  include/uapi/linux/sync_file.h | 20 ++++++++++++++++++++
> >  2 files changed, 39 insertions(+)
> >
> > diff --git a/drivers/dma-buf/sync_file.c b/drivers/dma-buf/sync_file.c
> > index 394e6e1e9686..f295772d5169 100644
> > --- a/drivers/dma-buf/sync_file.c
> > +++ b/drivers/dma-buf/sync_file.c
> > @@ -459,6 +459,22 @@ static long sync_file_ioctl_fence_info(struct sync_file *sync_file,
> >       return ret;
> >  }
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
> > +     dma_fence_set_deadline(sync_file->fence, ktime_set(ts.tv_sec, ts.tv_nsec));
> > +
> > +     return 0;
> > +}
> > +
> >  static long sync_file_ioctl(struct file *file, unsigned int cmd,
> >                           unsigned long arg)
> >  {
> > @@ -471,6 +487,9 @@ static long sync_file_ioctl(struct file *file, unsigned int cmd,
> >       case SYNC_IOC_FILE_INFO:
> >               return sync_file_ioctl_fence_info(sync_file, arg);
> >
> > +     case SYNC_IOC_SET_DEADLINE:
> > +             return sync_file_ioctl_set_deadline(sync_file, arg);
> > +
> >       default:
> >               return -ENOTTY;
> >       }
> > diff --git a/include/uapi/linux/sync_file.h b/include/uapi/linux/sync_file.h
> > index ee2dcfb3d660..f67d4ffe7566 100644
> > --- a/include/uapi/linux/sync_file.h
> > +++ b/include/uapi/linux/sync_file.h
> > @@ -67,6 +67,18 @@ struct sync_file_info {
> >       __u64   sync_fence_info;
> >  };
> >
> > +/**
> > + * struct sync_set_deadline - set a deadline on a fence
> > + * @tv_sec:  seconds elapsed since epoch
> > + * @tv_nsec: nanoseconds elapsed since the time given by the tv_sec
> > + * @pad:     must be zero
>
> Hi Rob,
>
> I think you need to specify which clock this timestamp must be in.
>
> Which epoch? Sounds a bit like CLOCK_REALTIME to me which would not
> make sense.

It should be monotonic.. same clock as is used for vblank timestamps,
which I assume that would be the most straightforward thing for
compositors to use

BR,
-R

> Also I cannot guess how a compositor should be using this, so
> explaining the expected usage would be really good, with reasons for
> why should userspace bother.
>
>
> Thanks,
> pq
>
> > + */
> > +struct sync_set_deadline {
> > +     __s64   tv_sec;
> > +     __s32   tv_nsec;
> > +     __u32   pad;
> > +};
> > +
> >  #define SYNC_IOC_MAGIC               '>'
> >
> >  /**
> > @@ -95,4 +107,12 @@ struct sync_file_info {
> >   */
> >  #define SYNC_IOC_FILE_INFO   _IOWR(SYNC_IOC_MAGIC, 4, struct sync_file_info)
> >
> > +
> > +/**
> > + * DOC: SYNC_IOC_SET_DEADLINE - set a deadline on a fence
> > + *
> > + * Allows userspace to set a deadline on a fence, see dma_fence_set_deadline()
> > + */
> > +#define SYNC_IOC_SET_DEADLINE        _IOW(SYNC_IOC_MAGIC, 5, struct sync_set_deadline)
> > +
> >  #endif /* _UAPI_LINUX_SYNC_H */
>
