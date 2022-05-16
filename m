Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B5FB528C96
	for <lists+dri-devel@lfdr.de>; Mon, 16 May 2022 20:09:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76ACD112517;
	Mon, 16 May 2022 18:09:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94E5C10E28B
 for <dri-devel@lists.freedesktop.org>; Mon, 16 May 2022 18:09:11 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id en5so5309760edb.1
 for <dri-devel@lists.freedesktop.org>; Mon, 16 May 2022 11:09:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=M1PljccbIAOAE9neWAHKLdafeOscED/K3xPR9tFDwk4=;
 b=PI7Q/iLr9MBJ1zVVAxdTHWye2DT/WcZy78H6wJG7W3W7GKo7sW3vIeF9XIrKQ9/FFy
 TYFhZ2gsRTL5XpZfqSQuwT4PhTWyDgRPtmIHvNY+BoONCJM5B6p29fX01gfCEQKx0Jkl
 Zsfi92aHCMCOePiGwZd0sQpgGOuk165Lvfd3bk+/jSd6WfAWUo7OXEVBlc8vWlKDzS14
 sTI2sYDm0IgECfq4gu+dpwQD6rFUgmPRfIX6MnRfReWMrMIuNyYtoOh9w0Yfi3HLH129
 Ejk14PJhA0y+oRpQx7MjXQezpymW0sd58wcZj4tTmwu7KXgIiOvCpP2EsCc4L2eCt+xr
 QLmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=M1PljccbIAOAE9neWAHKLdafeOscED/K3xPR9tFDwk4=;
 b=iTnMY/BKp4eOnZiI6LTDE7xPVGc/xK1Ty0M6cZeJY1u3AD1QluYMnsXUJwRzjNhGs0
 H8YnXAUJO/O6PvUdp6sop3WOCKbliWaGD15U0eVxtyHSowlZorQKEeXFOKLBueo87FzB
 ZB9Pw3bB71E8wtQQrK/Gw2WI2b1yNTpow4gjIg+TVWnHsa7/aSTsIXBKlW1WDFwUovCD
 2D+qoAXOYom1Ti9FEYkOcFlOlFb6IRP0XrbFEhEE1X3+fyAgGTehVXu4IN1ynOf1hPTd
 pgitpl2nkCHrPJSFhP+y+F9e2sBEIqTK1BvSrLHdFLpnoJgqBT5bpGsKV7I0ngue6Xgv
 vUrw==
X-Gm-Message-State: AOAM5334ZrRqWK/KP2uh2UOayUDVgFRwTDgpgHyKNZ2LpgKqOJsvvdTc
 CWRZd3x8j2IqC2yRjiShqGQfY9qgYaU90bF+qVPALg==
X-Google-Smtp-Source: ABdhPJybuxS4qikd73Kz3O+UugJ2dmVo1esTPFbqiEM0/0OxiI9stNtcymabcazgP7bTosofrHkTKIMCqGm0TzVKJDA=
X-Received: by 2002:a05:6402:354d:b0:428:19be:2447 with SMTP id
 f13-20020a056402354d00b0042819be2447mr14561320edd.308.1652724549859; Mon, 16
 May 2022 11:09:09 -0700 (PDT)
MIME-Version: 1.0
References: <20220516171315.2400578-1-tjmercier@google.com>
 <175c5af3-9224-9c8e-0784-349dad9a2954@amd.com>
In-Reply-To: <175c5af3-9224-9c8e-0784-349dad9a2954@amd.com>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Mon, 16 May 2022 11:08:57 -0700
Message-ID: <CABdmKX2GcgCs1xANYPBp8OEtk9qqH7AvCzpdppj9rHXvMqWSAw@mail.gmail.com>
Subject: Re: [PATCH v2] dma-buf: Move sysfs work out of DMA-BUF export path
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
Cc: kernel-team@android.com, Minchan Kim <minchan@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 John Stultz <jstultz@google.com>, Kalesh Singh <kaleshsingh@google.com>,
 Hridya Valsaraju <hridya@google.com>, Greg Kroah-Hartman <gregkh@google.com>,
 Suren Baghdasaryan <surenb@google.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, May 16, 2022 at 10:20 AM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> Am 16.05.22 um 19:13 schrieb T.J. Mercier:
> > Recently, we noticed an issue where a process went into direct reclaim
> > while holding the kernfs rw semaphore for sysfs in write (exclusive)
> > mode. This caused processes who were doing DMA-BUF exports and releases
> > to go into uninterruptible sleep since they needed to acquire the same
> > semaphore for the DMA-BUF sysfs entry creation/deletion. In order to av=
oid
> > blocking DMA-BUF export for an indeterminate amount of time while
> > another process is holding the sysfs rw semaphore in exclusive mode,
> > this patch moves the per-buffer sysfs file creation to the default work
> > queue. Note that this can lead to a short-term inaccuracy in the dmabuf
> > sysfs statistics, but this is a tradeoff to prevent the hot path from
> > being blocked. A work_struct is added to dma_buf to achieve this, but a=
s
> > it is unioned with the kobject in the sysfs_entry, dma_buf does not
> > increase in size.
>
> I'm still not very keen of this approach as it strongly feels like we
> are working around shortcoming somewhere else.
>
My read of the thread for the last version is that we're running into
a situation where sysfs is getting used for something it wasn't
originally intended for, but we're also stuck with this sysfs
functionality for dmabufs.

> > Fixes: bdb8d06dfefd ("dmabuf: Add the capability to expose DMA-BUF stat=
s in sysfs")
> > Originally-by: Hridya Valsaraju <hridya@google.com>
> > Signed-off-by: T.J. Mercier <tjmercier@google.com>
> >
> > ---
> > See the originally submitted patch by Hridya Valsaraju here:
> > https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flkm=
l.org%2Flkml%2F2022%2F1%2F4%2F1066&amp;data=3D05%7C01%7Cchristian.koenig%40=
amd.com%7C5575fa6126d74ca4315408da375f618d%7C3dd8961fe4884e608e11a82d994e18=
3d%7C0%7C0%7C637883180063393649%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDA=
iLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=
=3D1PcZaUfsLhQZOW29yGUDxazzcyNoBrN2NjeN1Yb40hk%3D&amp;reserved=3D0
> >
> > v2 changes:
> > - Defer only sysfs creation instead of creation and teardown per
> > Christian K=C3=B6nig
> >
> > - Use a work queue instead of a kthread for deferred work per
> > Christian K=C3=B6nig
> > ---
> >   drivers/dma-buf/dma-buf-sysfs-stats.c | 56 ++++++++++++++++++++------=
-
> >   include/linux/dma-buf.h               | 14 ++++++-
> >   2 files changed, 54 insertions(+), 16 deletions(-)
> >
> > diff --git a/drivers/dma-buf/dma-buf-sysfs-stats.c b/drivers/dma-buf/dm=
a-buf-sysfs-stats.c
> > index 2bba0babcb62..67b0a298291c 100644
> > --- a/drivers/dma-buf/dma-buf-sysfs-stats.c
> > +++ b/drivers/dma-buf/dma-buf-sysfs-stats.c
> > @@ -11,6 +11,7 @@
> >   #include <linux/printk.h>
> >   #include <linux/slab.h>
> >   #include <linux/sysfs.h>
> > +#include <linux/workqueue.h>
> >
> >   #include "dma-buf-sysfs-stats.h"
> >
> > @@ -168,10 +169,46 @@ void dma_buf_uninit_sysfs_statistics(void)
> >       kset_unregister(dma_buf_stats_kset);
> >   }
> >
> > +static void sysfs_add_workfn(struct work_struct *work)
> > +{
> > +     struct dma_buf_sysfs_entry *sysfs_entry =3D
> > +             container_of(work, struct dma_buf_sysfs_entry, sysfs_add_=
work);
> > +     struct dma_buf *dmabuf =3D sysfs_entry->dmabuf;
> > +
> > +     /*
> > +      * A dmabuf is ref-counted via its file member. If this handler h=
olds the only
> > +      * reference to the dmabuf, there is no need for sysfs kobject cr=
eation. This is an
> > +      * optimization and a race; when the reference count drops to 1 i=
mmediately after
> > +      * this check it is not harmful as the sysfs entry will still get=
 cleaned up in
> > +      * dma_buf_stats_teardown, which won't get called until the final=
 dmabuf reference
> > +      * is released, and that can't happen until the end of this funct=
ion.
> > +      */
> > +     if (file_count(dmabuf->file) > 1) {
>
> Please completely drop that. I see absolutely no justification for this
> additional complexity.
>
This case gets hit around 5% of the time in my testing so the else is
not a completely unused branch. It's only 3 extra lines of actual
code. I'd prefer to keep it, but I'll remove it to reduce complexity.
This means doing work that we know is useless some of the time, and
adding contention for a global kernfs lock which this patch is aimed
at avoiding (on the hot path), but at least that work is on a worker
thread with this patch.

> > +             /*
> > +              * kobject_init_and_add expects kobject to be zero-filled=
, but we have populated it
> > +              * (the sysfs_add_work union member) to trigger this work=
 function.
> > +              */
> > +             memset(&dmabuf->sysfs_entry->kobj, 0, sizeof(dmabuf->sysf=
s_entry->kobj));
> > +             dmabuf->sysfs_entry->kobj.kset =3D dma_buf_per_buffer_sta=
ts_kset;
> > +             if (kobject_init_and_add(&dmabuf->sysfs_entry->kobj, &dma=
_buf_ktype, NULL,
> > +                                             "%lu", file_inode(dmabuf-=
>file)->i_ino)) {
> > +                     kobject_put(&dmabuf->sysfs_entry->kobj);
> > +                     dmabuf->sysfs_entry =3D NULL;
> > +             }
> > +     } else {
> > +             /*
> > +              * Free the sysfs_entry and reset the pointer so dma_buf_=
stats_teardown doesn't
> > +              * attempt to operate on it.
> > +              */
> > +             kfree(dmabuf->sysfs_entry);
> > +             dmabuf->sysfs_entry =3D NULL;
> > +     }
> > +     dma_buf_put(dmabuf);
> > +}
> > +
> >   int dma_buf_stats_setup(struct dma_buf *dmabuf)
> >   {
> >       struct dma_buf_sysfs_entry *sysfs_entry;
> > -     int ret;
> >
> >       if (!dmabuf || !dmabuf->file)
> >               return -EINVAL;
> > @@ -181,25 +218,16 @@ int dma_buf_stats_setup(struct dma_buf *dmabuf)
> >               return -EINVAL;
> >       }
> >
> > -     sysfs_entry =3D kzalloc(sizeof(struct dma_buf_sysfs_entry), GFP_K=
ERNEL);
> > +     sysfs_entry =3D kmalloc(sizeof(struct dma_buf_sysfs_entry), GFP_K=
ERNEL);
> >       if (!sysfs_entry)
> >               return -ENOMEM;
> >
> > -     sysfs_entry->kobj.kset =3D dma_buf_per_buffer_stats_kset;
> >       sysfs_entry->dmabuf =3D dmabuf;
> > -
> >       dmabuf->sysfs_entry =3D sysfs_entry;
> >
> > -     /* create the directory for buffer stats */
> > -     ret =3D kobject_init_and_add(&sysfs_entry->kobj, &dma_buf_ktype, =
NULL,
> > -                                "%lu", file_inode(dmabuf->file)->i_ino=
);
> > -     if (ret)
> > -             goto err_sysfs_dmabuf;
> > +     INIT_WORK(&dmabuf->sysfs_entry->sysfs_add_work, sysfs_add_workfn)=
;
> > +     get_dma_buf(dmabuf); /* This reference will be dropped in sysfs_a=
dd_workfn. */
> > +     schedule_work(&dmabuf->sysfs_entry->sysfs_add_work);
> >
> >       return 0;
> > -
> > -err_sysfs_dmabuf:
> > -     kobject_put(&sysfs_entry->kobj);
> > -     dmabuf->sysfs_entry =3D NULL;
> > -     return ret;
> >   }
> > diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
> > index 2097760e8e95..0200caa3c515 100644
> > --- a/include/linux/dma-buf.h
> > +++ b/include/linux/dma-buf.h
> > @@ -22,6 +22,7 @@
> >   #include <linux/fs.h>
> >   #include <linux/dma-fence.h>
> >   #include <linux/wait.h>
> > +#include <linux/workqueue.h>
> >
> >   struct device;
> >   struct dma_buf;
> > @@ -365,7 +366,7 @@ struct dma_buf {
> >        */
> >       const char *name;
> >
>
> > -     /** @name_lock: Spinlock to protect name acces for read access. *=
/
> > +     /** @name_lock: Spinlock to protect name access for read access. =
*/
> >       spinlock_t name_lock;
> >
> >       /**
> > @@ -441,6 +442,7 @@ struct dma_buf {
> >
> >               __poll_t active;
> >       } cb_in, cb_out;
> > +
>
> Those changes are unrelated.
>
I included it here because I thought it was bad form to submit a
typo-only patch. Will remove.




> Regards,
> Christian.
>
> >   #ifdef CONFIG_DMABUF_SYSFS_STATS
> >       /**
> >        * @sysfs_entry:
> > @@ -449,7 +451,15 @@ struct dma_buf {
> >        * `DMA-BUF statistics`_ for the uapi this enables.
> >        */
> >       struct dma_buf_sysfs_entry {
> > -             struct kobject kobj;
> > +             union {
> > +                     struct kobject kobj;
> > +
> > +                     /** @sysfs_add_work:
> > +                      *
> > +                      * For deferred sysfs kobject creation using a wo=
rkqueue.
> > +                      */
> > +                     struct work_struct sysfs_add_work;
> > +             };
> >               struct dma_buf *dmabuf;
> >       } *sysfs_entry;
> >   #endif
>
