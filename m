Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 530BB6A5FC8
	for <lists+dri-devel@lfdr.de>; Tue, 28 Feb 2023 20:38:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF24E10E04C;
	Tue, 28 Feb 2023 19:38:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2c.google.com (mail-oa1-x2c.google.com
 [IPv6:2001:4860:4864:20::2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6604410E04C;
 Tue, 28 Feb 2023 19:38:09 +0000 (UTC)
Received: by mail-oa1-x2c.google.com with SMTP id
 586e51a60fabf-17235c8dab9so12038777fac.7; 
 Tue, 28 Feb 2023 11:38:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1677613088;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=PVieRPuEMOm+nHzPuq4QMxD7wCV7l2uEG4OOeeLhgTo=;
 b=YtdcuiZxfo3pvq1EBxEjMVDJt7xsOjpqKK7yjHlMcKGm6zRNFa8DLgbRUNG4TbT9y8
 XBtvslNJByhKIrCLCJ23dQtmvnnfDLVDIhXj9f4NY/5OOBLv/Ytd1iSF79T3BzW5W7gf
 RyWZgAVw7X/hmAyac+viOivzUgUIbQfEsDOripCar4FpJ2USzdD75I/gsz34YJuJsqKd
 zfv+jcd7iZL9mLzhuXjg9fWxY8yszD6D0pDwdFXqwUcZQ9RUrilpBISJTAytSXVEF2Mo
 vsBsKEdDYIyfnZXBwZPog4D0jmkYANALCDhl7UVWnQDtkfLNVfzJXZ/SzceH9dd0BMUJ
 cojA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677613088;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PVieRPuEMOm+nHzPuq4QMxD7wCV7l2uEG4OOeeLhgTo=;
 b=4M5Dnrop2mg5ikIuqoK0d2KaRPVg4rKlblOOV/dPG0Xwxzh2Z18BCV9qfGMTzdR8TO
 En2rdJyVbKmE00pB5b2gVdhx8cGOM71LqgnKABMXV0PwX9I3IVNMqYby/e5IK8tdfUen
 UJ1rEWlH9B3Z1BEW9sF9oqh3sLhIMRcMEgF3H3v29UJwkqtLxwteZzNYRbsGhzk94M/N
 iX96yoErEXlh8dx8gRbS2f1vMEncEvkZijBFCEqCF0OOo6LJxTVeYCAJZ9jX8vNj9uhW
 K9pC/f6WeK+CyC1RXyZmpvtJ81ao3TpSkAfpjCaqZry2T91KD9Lf7BX9r+iTLFiGVHbJ
 h9KA==
X-Gm-Message-State: AO0yUKVBI4vV2z3NCkAfZLSvBfoDkhTBce0uiGjrvvmiNTogKZja/eKg
 BnnlA9pjX49WL6/1T+VnmaEO/ugt1V4WOIkGJ7QbgKdWEMg=
X-Google-Smtp-Source: AK7set8/X1E/XPetbsmctxmF0pvmxBCTcKKMQYCtY5r6xSJk5qanEEVUtccQFCDLkVD6xABYiPhsKBl7fbBep2x+JN4=
X-Received: by 2002:a05:6871:6a9e:b0:16e:873e:b06b with SMTP id
 zf30-20020a0568716a9e00b0016e873eb06bmr869979oab.3.1677613088636; Tue, 28 Feb
 2023 11:38:08 -0800 (PST)
MIME-Version: 1.0
References: <20230227193535.2822389-1-robdclark@gmail.com>
 <20230227193535.2822389-6-robdclark@gmail.com>
 <20230228112215.6d3f1f3d@eldfell>
In-Reply-To: <20230228112215.6d3f1f3d@eldfell>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 28 Feb 2023 11:37:57 -0800
Message-ID: <CAF6AEGt01HQ7kJmTWrycwDG=Rc_vy1dQ+SPFeX7vD19e+69hBw@mail.gmail.com>
Subject: Re: [PATCH v7 05/15] dma-buf/sync_file: Add SET_DEADLINE ioctl
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
 Luben Tuikov <luben.tuikov@amd.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Alex Deucher <alexander.deucher@amd.com>, freedreno@lists.freedesktop.org,
 Sumit Semwal <sumit.semwal@linaro.org>,
 "open list:SYNC FILE FRAMEWORK" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Feb 28, 2023 at 1:22 AM Pekka Paalanen <ppaalanen@gmail.com> wrote:
>
> On Mon, 27 Feb 2023 11:35:11 -0800
> Rob Clark <robdclark@gmail.com> wrote:
>
> > From: Rob Clark <robdclark@chromium.org>
> >
> > The initial purpose is for igt tests, but this would also be useful for
> > compositors that wait until close to vblank deadline to make decisions
> > about which frame to show.
> >
> > The igt tests can be found at:
> >
> > https://gitlab.freedesktop.org/robclark/igt-gpu-tools/-/commits/fence-deadline
> >
> > v2: Clarify the timebase, add link to igt tests
> > v3: Use u64 value in ns to express deadline.
> > v4: More doc
> >
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > ---
> >  drivers/dma-buf/dma-fence.c    |  3 ++-
> >  drivers/dma-buf/sync_file.c    | 19 +++++++++++++++++++
> >  include/uapi/linux/sync_file.h | 22 ++++++++++++++++++++++
> >  3 files changed, 43 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
> > index e103e821d993..7761ceeae620 100644
> > --- a/drivers/dma-buf/dma-fence.c
> > +++ b/drivers/dma-buf/dma-fence.c
> > @@ -933,7 +933,8 @@ EXPORT_SYMBOL(dma_fence_wait_any_timeout);
> >   *   the GPU's devfreq to reduce frequency, when in fact the opposite is what is
> >   *   needed.
> >   *
> > - * To this end, deadline hint(s) can be set on a &dma_fence via &dma_fence_set_deadline.
> > + * To this end, deadline hint(s) can be set on a &dma_fence via &dma_fence_set_deadline
> > + * (or indirectly via userspace facing ioctls like &SYNC_IOC_SET_DEADLINE).
> >   * The deadline hint provides a way for the waiting driver, or userspace, to
> >   * convey an appropriate sense of urgency to the signaling driver.
>
> Hi,
>
> when the kernel HTML doc is generated, I assume the above becomes a
> link to "DOC: SYNC_IOC_SET_DEADLINE - set a deadline on a fence", right?

Heh, kernel docs completely miss the sync_file uABI.. I'll add a patch
to correct that in order to make these links work properly.

BR,
-R

> >   *
> > diff --git a/drivers/dma-buf/sync_file.c b/drivers/dma-buf/sync_file.c
> > index af57799c86ce..418021cfb87c 100644
> > --- a/drivers/dma-buf/sync_file.c
> > +++ b/drivers/dma-buf/sync_file.c
> > @@ -350,6 +350,22 @@ static long sync_file_ioctl_fence_info(struct sync_file *sync_file,
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
> > +     dma_fence_set_deadline(sync_file->fence, ns_to_ktime(ts.deadline_ns));
> > +
> > +     return 0;
> > +}
> > +
> >  static long sync_file_ioctl(struct file *file, unsigned int cmd,
> >                           unsigned long arg)
> >  {
> > @@ -362,6 +378,9 @@ static long sync_file_ioctl(struct file *file, unsigned int cmd,
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
> > index ee2dcfb3d660..49325cf6749b 100644
> > --- a/include/uapi/linux/sync_file.h
> > +++ b/include/uapi/linux/sync_file.h
> > @@ -67,6 +67,21 @@ struct sync_file_info {
> >       __u64   sync_fence_info;
> >  };
> >
> > +/**
> > + * struct sync_set_deadline - set a deadline hint on a fence
> > + * @deadline_ns: absolute time of the deadline
>
> Is it legal to pass zero as deadline_ns?
>
> > + * @pad:     must be zero
> > + *
> > + * The timebase for the deadline is CLOCK_MONOTONIC (same as vblank)
>
> Does something here provide doc links to "DOC: SYNC_IOC_SET_DEADLINE -
> set a deadline on a fence" and to the "DOC: deadline hints"?
>
> > + */
> > +struct sync_set_deadline {
> > +     __u64   deadline_ns;
> > +     /* Not strictly needed for alignment but gives some possibility
> > +      * for future extension:
> > +      */
> > +     __u64   pad;
> > +};
> > +
> >  #define SYNC_IOC_MAGIC               '>'
> >
> >  /**
> > @@ -95,4 +110,11 @@ struct sync_file_info {
> >   */
> >  #define SYNC_IOC_FILE_INFO   _IOWR(SYNC_IOC_MAGIC, 4, struct sync_file_info)
> >
> > +/**
> > + * DOC: SYNC_IOC_SET_DEADLINE - set a deadline on a fence
> > + *
> > + * Allows userspace to set a deadline on a fence, see dma_fence_set_deadline()
>
> Does something here provide doc links to struct sync_set_deadline and
> to the "DOC: deadline hints"?
>
> > + */
> > +#define SYNC_IOC_SET_DEADLINE        _IOW(SYNC_IOC_MAGIC, 5, struct sync_set_deadline)
> > +
> >  #endif /* _UAPI_LINUX_SYNC_H */
>
> With all those links added:
> Acked-by: Pekka Paalanen <pekka.paalanen@collabora.com>
>
>
> Thanks,
> pq
