Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B481D486A44
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jan 2022 20:04:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1423610EDD8;
	Thu,  6 Jan 2022 19:04:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com
 [IPv6:2607:f8b0:4864:20::b32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80E9410EB1D
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jan 2022 19:04:52 +0000 (UTC)
Received: by mail-yb1-xb32.google.com with SMTP id p15so10148255ybk.10
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Jan 2022 11:04:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=LDX9Oxdy34nprJSdtavNtWS6MMXJ4D5m/gu0p9e0/V0=;
 b=I2ZBKR2wj/rx+O19aNr1Z2Diofe/8ICDJ+KX6YZzVuW6wyMvrmk3KhmzIFDtm5nDJN
 p0kM514QGhZsSQNbhUg5g4jfEPO15l/jPlWr+wVBDok8mpyUFYkPevqf3kIe7SbTL/ur
 64NY9CrbeJfeUma0HsCQzIP9AD6HE+j4fEDSCjUvJ/EryxMZpzi9AsOI9s+f59jKMiBQ
 hcUaQGhUTyNOw24caIzlrPbueYxoUIf17wfqC0G5a5r+/8sB8Ni6tc9ynvZHYWkrNqLI
 +N70FqHC5HzlxTinC2ojz8uqqkdfyD7cRAsvGMX4t+yPlOQ73ACeHWxOdusKyXwnuL4n
 9pOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=LDX9Oxdy34nprJSdtavNtWS6MMXJ4D5m/gu0p9e0/V0=;
 b=wxc0NTWFM+LGhYeW9M+yc99lQutJH9xKtQjSNSW1TjhPwufmw18iFr4gFLQKZTXbfn
 y9DGOIjHSb+Qc3+F9d+OhT0KVA2fxctnW0H8IWNCpKqbdOmF89rm0aZ/yb/4h2bdnjom
 p9F0C09BV1/XwVG40dLRXq4mXpaunP8HDCR7aOWBDzXy/vQq/jgyekkTa5nQfneXMBZN
 8YlT6f61+J+jpuhe//Cipyh4UnWdRIpFcB5LNLrnfnCL9fGP34hKB5VanNhBqJZmW/dG
 Xf5PSJWnEal5PwIv0QILblqVbp+9YNFSMjNupJymj6ONhGtOkbEzp/oZF27dG5L6GV26
 LxNA==
X-Gm-Message-State: AOAM53155CrijOSE7UqtxkRpBIoa6tjhmEe3toP4dv5LxoGZhTS9ffrq
 6QAzZxe1k/NRzfpMOkidhZMhDXAuhMzXXd+h5qnnGQ==
X-Google-Smtp-Source: ABdhPJxEB9UCC+i1lakdBQhDw6qqENNncummic94xLmk9kUQN6A/Lnab4xv370BYzuQQwL5i62s6cRzjd2FHHfzpl78=
X-Received: by 2002:a25:388a:: with SMTP id
 f132mr31430069yba.102.1641495891236; 
 Thu, 06 Jan 2022 11:04:51 -0800 (PST)
MIME-Version: 1.0
References: <20220104235148.21320-1-hridya@google.com>
 <49b29081-42df-ffcd-8fea-bd819499ff1b@amd.com>
In-Reply-To: <49b29081-42df-ffcd-8fea-bd819499ff1b@amd.com>
From: Hridya Valsaraju <hridya@google.com>
Date: Thu, 6 Jan 2022 11:04:15 -0800
Message-ID: <CA+wgaPMWT0s0KNo_wM7jU+bH626OAVtn77f7_WX=E1wyU8aBzg@mail.gmail.com>
Subject: Re: [PATCH] dma-buf: Move sysfs work out of DMA-BUF export/release
 path
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
Cc: keescook@google.com, Daniel Vetter <daniel.vetter@ffwll.ch>,
 kaleshsingh@google.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, tjmercier@google.com,
 linaro-mm-sig@lists.linaro.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, surenb@google.com,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 6, 2022 at 12:59 AM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> Am 05.01.22 um 00:51 schrieb Hridya Valsaraju:
> > Recently, we noticed an issue where a process went into direct reclaim
> > while holding the kernfs rw semaphore for sysfs in write(exclusive)
> > mode. This caused processes who were doing DMA-BUF exports and releases
> > to go into uninterruptible sleep since they needed to acquire the same
> > semaphore for the DMA-BUF sysfs entry creation/deletion. In order to av=
oid
> > blocking DMA-BUF export/release for an indeterminate amount of time
> > while another process is holding the sysfs rw semaphore in exclusive
> > mode, this patch moves the per-buffer sysfs file creation/deleteion to
> > a kthread.
>
> Well I absolutely don't think that this is justified.
>
> You adding tons of complexity here just to avoid the overhead of
> creating the sysfs files while exporting DMA-bufs which is an operation
> which should be done exactly once in the lifecycle for the most common
> use case.
>
> Please explain further why that should be necessary.

Hi Christian,

We noticed that the issue sometimes causes the exporting process to go
to the uninterrupted sleep state for tens of milliseconds which
unfortunately leads to user-perceptible UI jank. This is the reason
why we are trying to move the sysfs entry creation and deletion out of
the DMA-BUF export/release path. I will update the commit message to
include the same in the next revision.

Thanks,
Hridya


>
> Regards,
> Christian.
>
> >
> > Fixes: bdb8d06dfefd ("dmabuf: Add the capability to expose DMA-BUF stat=
s in sysfs")
> > Signed-off-by: Hridya Valsaraju <hridya@google.com>
> > ---
> >   drivers/dma-buf/dma-buf-sysfs-stats.c | 343 ++++++++++++++++++++++++-=
-
> >   include/linux/dma-buf.h               |  46 ++++
> >   2 files changed, 366 insertions(+), 23 deletions(-)
> >
> > diff --git a/drivers/dma-buf/dma-buf-sysfs-stats.c b/drivers/dma-buf/dm=
a-buf-sysfs-stats.c
> > index 053baadcada9..3251fdf2f05f 100644
> > --- a/drivers/dma-buf/dma-buf-sysfs-stats.c
> > +++ b/drivers/dma-buf/dma-buf-sysfs-stats.c
> > @@ -7,13 +7,39 @@
> >
> >   #include <linux/dma-buf.h>
> >   #include <linux/dma-resv.h>
> > +#include <linux/freezer.h>
> >   #include <linux/kobject.h>
> > +#include <linux/kthread.h>
> > +#include <linux/list.h>
> >   #include <linux/printk.h>
> > +#include <linux/sched/signal.h>
> >   #include <linux/slab.h>
> >   #include <linux/sysfs.h>
> >
> >   #include "dma-buf-sysfs-stats.h"
> >
> > +struct dmabuf_kobj_work {
> > +     struct list_head list;
> > +     struct dma_buf_sysfs_entry *sysfs_entry;
> > +     struct dma_buf_sysfs_entry_metadata *sysfs_metadata;
> > +     unsigned long uid;
> > +};
> > +
> > +/* Both kobject setup and teardown work gets queued on the list. */
> > +static LIST_HEAD(dmabuf_kobj_work_list);
> > +
> > +/* dmabuf_kobj_list_lock protects dmabuf_kobj_work_list. */
> > +static DEFINE_SPINLOCK(dmabuf_kobj_list_lock);
> > +
> > +/*
> > + * dmabuf_sysfs_show_lock prevents a race between a DMA-BUF sysfs file=
 being
> > + * read and the DMA-BUF being freed by protecting sysfs_entry->dmabuf.
> > + */
> > +static DEFINE_SPINLOCK(dmabuf_sysfs_show_lock);
> > +
> > +static struct task_struct *dmabuf_kobject_task;
> > +static wait_queue_head_t dmabuf_kobject_waitqueue;
> > +
> >   #define to_dma_buf_entry_from_kobj(x) container_of(x, struct dma_buf_=
sysfs_entry, kobj)
> >
> >   /**
> > @@ -64,15 +90,26 @@ static ssize_t dma_buf_stats_attribute_show(struct =
kobject *kobj,
> >       struct dma_buf_stats_attribute *attribute;
> >       struct dma_buf_sysfs_entry *sysfs_entry;
> >       struct dma_buf *dmabuf;
> > +     int ret;
> >
> >       attribute =3D to_dma_buf_stats_attr(attr);
> >       sysfs_entry =3D to_dma_buf_entry_from_kobj(kobj);
> > +
> > +     /*
> > +      * acquire dmabuf_sysfs_show_lock to prevent a race with the DMA-=
BUF
> > +      * being freed while sysfs_entry->dmabuf is being accessed.
> > +      */
> > +     spin_lock(&dmabuf_sysfs_show_lock);
> >       dmabuf =3D sysfs_entry->dmabuf;
> >
> > -     if (!dmabuf || !attribute->show)
> > +     if (!dmabuf || !attribute->show) {
> > +             spin_unlock(&dmabuf_sysfs_show_lock);
> >               return -EIO;
> > +     }
> >
> > -     return attribute->show(dmabuf, attribute, buf);
> > +     ret =3D attribute->show(dmabuf, attribute, buf);
> > +     spin_unlock(&dmabuf_sysfs_show_lock);
> > +     return ret;
> >   }
> >
> >   static const struct sysfs_ops dma_buf_stats_sysfs_ops =3D {
> > @@ -118,33 +155,275 @@ static struct kobj_type dma_buf_ktype =3D {
> >       .default_groups =3D dma_buf_stats_default_groups,
> >   };
> >
> > -void dma_buf_stats_teardown(struct dma_buf *dmabuf)
> > +/* Statistics files do not need to send uevents. */
> > +static int dmabuf_sysfs_uevent_filter(struct kset *kset, struct kobjec=
t *kobj)
> >   {
> > -     struct dma_buf_sysfs_entry *sysfs_entry;
> > +     return 0;
> > +}
> >
> > -     sysfs_entry =3D dmabuf->sysfs_entry;
> > -     if (!sysfs_entry)
> > -             return;
> > +static const struct kset_uevent_ops dmabuf_sysfs_no_uevent_ops =3D {
> > +     .filter =3D dmabuf_sysfs_uevent_filter,
> > +};
> > +
> > +/* setup of sysfs entries done asynchronously in the worker thread. */
> > +static void dma_buf_sysfs_stats_setup_work(struct dmabuf_kobj_work *ko=
bject_work)
> > +{
> > +     struct dma_buf_sysfs_entry *sysfs_entry =3D kobject_work->sysfs_e=
ntry;
> > +     struct dma_buf_sysfs_entry_metadata *sysfs_metadata =3D
> > +                     kobject_work->sysfs_metadata;
> > +     bool free_metadata =3D false;
> > +
> > +     int ret =3D kobject_init_and_add(&sysfs_entry->kobj, &dma_buf_kty=
pe, NULL,
> > +                                    "%lu", kobject_work->uid);
> > +     if (ret) {
> > +             kobject_put(&sysfs_entry->kobj);
> > +
> > +             spin_lock(&sysfs_metadata->sysfs_entry_lock);
> > +             if (sysfs_metadata->status =3D=3D SYSFS_ENTRY_INIT_ABORTE=
D) {
> > +                     /*
> > +                      * SYSFS_ENTRY_INIT_ABORTED means that the DMA-BU=
F has already
> > +                      * been freed. At this point, its safe to free th=
e memory for
> > +                      * the sysfs_metadata;
> > +                      */
> > +                     free_metadata =3D true;
> > +             } else {
> > +                     /*
> > +                      * The DMA-BUF has not yet been freed, set the st=
atus to
> > +                      * sysfs_entry_error so that when the DMA-BUF get=
s
> > +                      * freed, we know there is no need to teardown th=
e sysfs
> > +                      * entry.
> > +                      */
> > +                     sysfs_metadata->status =3D SYSFS_ENTRY_ERROR;
> > +             }
> > +             goto unlock;
> > +     }
> > +
> > +     /*
> > +      * If the DMA-BUF has not yet been released, status would still b=
e
> > +      * SYSFS_ENTRY_INIT_IN_PROGRESS. We set the status as initialized=
.
> > +      */
> > +     spin_lock(&sysfs_metadata->sysfs_entry_lock);
> > +     if (sysfs_metadata->status =3D=3D SYSFS_ENTRY_INIT_IN_PROGRESS) {
> > +             sysfs_metadata->status =3D SYSFS_ENTRY_INITIALIZED;
> > +             goto unlock;
> > +     }
> >
> > +     /*
> > +      * At this point the status is SYSFS_ENTRY_INIT_ABORTED which mea=
ns
> > +      * that the DMA-BUF has already been freed. Hence, we cleanup the
> > +      * sysfs_entry and its metadata since neither of them are needed
> > +      * anymore.
> > +      */
> > +     free_metadata =3D true;
> >       kobject_del(&sysfs_entry->kobj);
> >       kobject_put(&sysfs_entry->kobj);
> > +
> > +unlock:
> > +     spin_unlock(&sysfs_metadata->sysfs_entry_lock);
> > +     if (free_metadata) {
> > +             kfree(kobject_work->sysfs_metadata);
> > +             kobject_work->sysfs_metadata =3D NULL;
> > +     }
> >   }
> >
> > +/* teardown of sysfs entries done asynchronously in the worker thread.=
 */
> > +static void dma_buf_sysfs_stats_teardown_work(struct dmabuf_kobj_work =
*kobject_work)
> > +{
> > +     struct dma_buf_sysfs_entry *sysfs_entry =3D kobject_work->sysfs_e=
ntry;
> >
> > -/* Statistics files do not need to send uevents. */
> > -static int dmabuf_sysfs_uevent_filter(struct kset *kset, struct kobjec=
t *kobj)
> > +     kobject_del(&sysfs_entry->kobj);
> > +     kobject_put(&sysfs_entry->kobj);
> > +
> > +     kfree(kobject_work->sysfs_metadata);
> > +     kobject_work->sysfs_metadata =3D NULL;
> > +}
> > +
> > +/* do setup or teardown of sysfs entries as required */
> > +static void do_kobject_work(struct dmabuf_kobj_work *kobject_work)
> >   {
> > +     struct dma_buf_sysfs_entry_metadata *sysfs_metadata;
> > +     bool setup_needed =3D false;
> > +     bool teardown_needed =3D false;
> > +
> > +     sysfs_metadata =3D kobject_work->sysfs_metadata;
> > +     spin_lock(&sysfs_metadata->sysfs_entry_lock);
> > +     if (sysfs_metadata->status =3D=3D SYSFS_ENTRY_UNINITIALIZED) {
> > +             setup_needed =3D true;
> > +             sysfs_metadata->status =3D SYSFS_ENTRY_INIT_IN_PROGRESS;
> > +     } else if (sysfs_metadata->status =3D=3D SYSFS_ENTRY_INITIALIZED)=
 {
> > +             teardown_needed =3D true;
> > +     }
> > +
> > +     /*
> > +      * It is ok to release the sysfs_entry_lock here.
> > +      *
> > +      * If setup_needed is true, we check the status again after the k=
object
> > +      * initialization to see if it has been set to SYSFS_ENTRY_INIT_A=
BORTED
> > +      * and if so teardown the kobject.
> > +      *
> > +      * If teardown_needed is true, there are no more changes expected=
 to the
> > +      * status.
> > +      *
> > +      * If neither setup_needed nor teardown needed are true, it
> > +      * means the DMA-BUF was freed before we got around to setting up=
 the
> > +      * sysfs entry and hence we just need to release the metadata and
> > +      * return.
> > +      */
> > +     spin_unlock(&kobject_work->sysfs_metadata->sysfs_entry_lock);
> > +
> > +     if (setup_needed)
> > +             dma_buf_sysfs_stats_setup_work(kobject_work);
> > +     else if (teardown_needed)
> > +             dma_buf_sysfs_stats_teardown_work(kobject_work);
> > +     else
> > +             kfree(kobject_work->sysfs_metadata);
> > +
> > +     kfree(kobject_work);
> > +}
> > +
> > +static struct dmabuf_kobj_work *get_next_kobj_work(void)
> > +{
> > +     struct dmabuf_kobj_work *kobject_work;
> > +
> > +     spin_lock(&dmabuf_kobj_list_lock);
> > +     kobject_work =3D list_first_entry_or_null(&dmabuf_kobj_work_list,
> > +                                             struct dmabuf_kobj_work, =
list);
> > +     if (kobject_work)
> > +             list_del(&kobject_work->list);
> > +     spin_unlock(&dmabuf_kobj_list_lock);
> > +     return kobject_work;
> > +}
> > +
> > +static int kobject_work_thread(void *data)
> > +{
> > +     struct dmabuf_kobj_work *kobject_work;
> > +
> > +     while (1) {
> > +             wait_event_freezable(dmabuf_kobject_waitqueue,
> > +                                  (kobject_work =3D get_next_kobj_work=
()));
> > +             do_kobject_work(kobject_work);
> > +     }
> > +
> >       return 0;
> >   }
> >
> > -static const struct kset_uevent_ops dmabuf_sysfs_no_uevent_ops =3D {
> > -     .filter =3D dmabuf_sysfs_uevent_filter,
> > -};
> > +static int kobject_worklist_init(void)
> > +{
> > +     init_waitqueue_head(&dmabuf_kobject_waitqueue);
> > +     dmabuf_kobject_task =3D kthread_run(kobject_work_thread, NULL,
> > +                                       "%s", "dmabuf-kobject-worker");
> > +     if (IS_ERR(dmabuf_kobject_task)) {
> > +             pr_err("Creating thread for deferred sysfs entry creation=
/deletion failed\n");
> > +             return PTR_ERR(dmabuf_kobject_task);
> > +     }
> > +     sched_set_normal(dmabuf_kobject_task, MAX_NICE);
> > +
> > +     return 0;
> > +}
> > +
> > +static void deferred_kobject_create(struct dmabuf_kobj_work *kobject_w=
ork)
> > +{
> > +     INIT_LIST_HEAD(&kobject_work->list);
> > +
> > +     spin_lock(&dmabuf_kobj_list_lock);
> > +
> > +     list_add_tail(&kobject_work->list, &dmabuf_kobj_work_list);
> > +
> > +     spin_unlock(&dmabuf_kobj_list_lock);
> > +
> > +     wake_up(&dmabuf_kobject_waitqueue);
> > +}
> > +
> > +
> > +void dma_buf_stats_teardown(struct dma_buf *dmabuf)
> > +{
> > +     struct dma_buf_sysfs_entry *sysfs_entry;
> > +     struct dma_buf_sysfs_entry_metadata *sysfs_metadata;
> > +     struct dmabuf_kobj_work *kobj_work;
> > +
> > +     sysfs_entry =3D dmabuf->sysfs_entry;
> > +     if (!sysfs_entry)
> > +             return;
> > +
> > +     sysfs_metadata =3D dmabuf->sysfs_entry_metadata;
> > +     if (!sysfs_metadata)
> > +             return;
> > +
> > +     spin_lock(&sysfs_metadata->sysfs_entry_lock);
> > +
> > +     if (sysfs_metadata->status =3D=3D SYSFS_ENTRY_UNINITIALIZED ||
> > +         sysfs_metadata->status =3D=3D SYSFS_ENTRY_INIT_IN_PROGRESS) {
> > +             /*
> > +              * The sysfs entry for this buffer has not yet been initi=
alized,
> > +              * we set the status to SYSFS_ENTRY_INIT_ABORTED to abort=
 the
> > +              * initialization.
> > +              */
> > +             sysfs_metadata->status =3D SYSFS_ENTRY_INIT_ABORTED;
> > +             spin_unlock(&sysfs_metadata->sysfs_entry_lock);
> > +
> > +             /*
> > +              * In case kobject initialization completes right as we r=
elease
> > +              * the sysfs_entry_lock, disable show() for the sysfs ent=
ry by
> > +              * setting sysfs_entry->dmabuf to NULL to prevent a race.
> > +              */
> > +             spin_lock(&dmabuf_sysfs_show_lock);
> > +             sysfs_entry->dmabuf =3D NULL;
> > +             spin_unlock(&dmabuf_sysfs_show_lock);
> > +
> > +             return;
> > +     }
> > +
> > +     if (sysfs_metadata->status =3D=3D SYSFS_ENTRY_INITIALIZED) {
> > +             /*
> > +              * queue teardown work only if sysfs_entry is fully initi=
talized.
> > +              * It is ok to release the sysfs_entry_lock here since th=
e
> > +              * status can no longer change.
> > +              */
> > +             spin_unlock(&sysfs_metadata->sysfs_entry_lock);
> > +
> > +             /*
> > +              * Meanwhile disable show() for the sysfs entry to avoid =
a race
> > +              * between teardown and show().
> > +              */
> > +             spin_lock(&dmabuf_sysfs_show_lock);
> > +             sysfs_entry->dmabuf =3D NULL;
> > +             spin_unlock(&dmabuf_sysfs_show_lock);
> > +
> > +             kobj_work =3D kzalloc(sizeof(struct dmabuf_kobj_work), GF=
P_KERNEL);
> > +             if (!kobj_work) {
> > +                     /* do the teardown immediately. */
> > +                     kobject_del(&sysfs_entry->kobj);
> > +                     kobject_put(&sysfs_entry->kobj);
> > +                     kfree(sysfs_metadata);
> > +             } else {
> > +                     /* queue teardown work. */
> > +                     kobj_work->sysfs_entry =3D dmabuf->sysfs_entry;
> > +                     kobj_work->sysfs_metadata =3D dmabuf->sysfs_entry=
_metadata;
> > +                     deferred_kobject_create(kobj_work);
> > +             }
> > +
> > +             return;
> > +     }
> > +
> > +     /*
> > +      * status is SYSFS_ENTRY_INIT_ERROR so we only need to free the
> > +      * metadata.
> > +      */
> > +     spin_unlock(&sysfs_metadata->sysfs_entry_lock);
> > +     kfree(dmabuf->sysfs_entry_metadata);
> > +     dmabuf->sysfs_entry_metadata =3D NULL;
> > +}
> >
> >   static struct kset *dma_buf_stats_kset;
> >   static struct kset *dma_buf_per_buffer_stats_kset;
> >   int dma_buf_init_sysfs_statistics(void)
> >   {
> > +     int ret;
> > +
> > +     ret =3D kobject_worklist_init();
> > +     if (ret)
> > +             return ret;
> > +
> >       dma_buf_stats_kset =3D kset_create_and_add("dmabuf",
> >                                                &dmabuf_sysfs_no_uevent_=
ops,
> >                                                kernel_kobj);
> > @@ -171,7 +450,8 @@ void dma_buf_uninit_sysfs_statistics(void)
> >   int dma_buf_stats_setup(struct dma_buf *dmabuf)
> >   {
> >       struct dma_buf_sysfs_entry *sysfs_entry;
> > -     int ret;
> > +     struct dma_buf_sysfs_entry_metadata *sysfs_metadata;
> > +     struct dmabuf_kobj_work *kobj_work;
> >
> >       if (!dmabuf || !dmabuf->file)
> >               return -EINVAL;
> > @@ -188,18 +468,35 @@ int dma_buf_stats_setup(struct dma_buf *dmabuf)
> >       sysfs_entry->kobj.kset =3D dma_buf_per_buffer_stats_kset;
> >       sysfs_entry->dmabuf =3D dmabuf;
> >
> > +     sysfs_metadata =3D kzalloc(sizeof(struct dma_buf_sysfs_entry_meta=
data),
> > +                              GFP_KERNEL);
> > +     if (!sysfs_metadata) {
> > +             kfree(sysfs_entry);
> > +             return -ENOMEM;
> > +     }
> > +
> >       dmabuf->sysfs_entry =3D sysfs_entry;
> >
> > -     /* create the directory for buffer stats */
> > -     ret =3D kobject_init_and_add(&sysfs_entry->kobj, &dma_buf_ktype, =
NULL,
> > -                                "%lu", file_inode(dmabuf->file)->i_ino=
);
> > -     if (ret)
> > -             goto err_sysfs_dmabuf;
> > +     sysfs_metadata->status =3D SYSFS_ENTRY_UNINITIALIZED;
> > +     spin_lock_init(&sysfs_metadata->sysfs_entry_lock);
> >
> > -     return 0;
> > +     dmabuf->sysfs_entry_metadata =3D sysfs_metadata;
> >
> > -err_sysfs_dmabuf:
> > -     kobject_put(&sysfs_entry->kobj);
> > -     dmabuf->sysfs_entry =3D NULL;
> > -     return ret;
> > +     kobj_work =3D kzalloc(sizeof(struct dmabuf_kobj_work), GFP_KERNEL=
);
> > +     if (!kobj_work) {
> > +             kfree(sysfs_entry);
> > +             kfree(sysfs_metadata);
> > +             return -ENOMEM;
> > +     }
> > +
> > +     kobj_work->sysfs_entry =3D dmabuf->sysfs_entry;
> > +     kobj_work->sysfs_metadata =3D dmabuf->sysfs_entry_metadata;
> > +     /*
> > +      * stash the inode number in struct dmabuf_kobj_work since setup
> > +      * might race with DMA-BUF teardown.
> > +      */
> > +     kobj_work->uid =3D file_inode(dmabuf->file)->i_ino;
> > +
> > +     deferred_kobject_create(kobj_work);
> > +     return 0;
> >   }
> > diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
> > index 7ab50076e7a6..0597690023a0 100644
> > --- a/include/linux/dma-buf.h
> > +++ b/include/linux/dma-buf.h
> > @@ -287,6 +287,50 @@ struct dma_buf_ops {
> >       void (*vunmap)(struct dma_buf *dmabuf, struct dma_buf_map *map);
> >   };
> >
> > +#ifdef CONFIG_DMABUF_SYSFS_STATS
> > +enum sysfs_entry_status {
> > +     SYSFS_ENTRY_UNINITIALIZED,
> > +     SYSFS_ENTRY_INIT_IN_PROGRESS,
> > +     SYSFS_ENTRY_ERROR,
> > +     SYSFS_ENTRY_INIT_ABORTED,
> > +     SYSFS_ENTRY_INITIALIZED,
> > +};
> > +
> > +/*
> > + * struct dma_buf_sysfs_entry_metadata - Holds the current status for =
the
> > + * DMA-BUF sysfs entry.
> > + *
> > + * @status: holds the current status for the DMA-BUF sysfs entry. The =
status of
> > + * the sysfs entry has the following path.
> > + *
> > + *                   SYSFS_ENTRY_UNINITIALIZED
> > + *            __________________|____________________
> > + *           |                                       |
> > + *     SYSFS_ENTRY_INIT_IN_PROGRESS      SYSFS_ENTRY_INIT_ABORTED (DMA=
-BUF
> > + *           |                                                     get=
s freed
> > + *           |                                                     bef=
ore
> > + *           |                                                     ini=
t)
> > + *   ________|_____________________________________
> > + *   |                         |                   |
> > + * SYSFS_ENTRY_INITIALIZED     |       SYSFS_ENTRY_INIT_ABORTED
> > + *                             |               (DMA-BUF gets freed dur=
ing kobject
> > + *                             |               init)
> > + *                             |
> > + *                             |
> > + *                 SYSFS_ENTRY_ERROR
> > + *                 (error during kobject init)
> > + *
> > + * @sysfs_entry_lock: protects access to @status.
> > + */
> > +struct dma_buf_sysfs_entry_metadata {
> > +     enum sysfs_entry_status status;
> > +     /*
> > +      * Protects sysfs_entry_metadata->status
> > +      */
> > +     spinlock_t sysfs_entry_lock;
> > +};
> > +#endif
> > +
> >   /**
> >    * struct dma_buf - shared buffer object
> >    *
> > @@ -452,6 +496,8 @@ struct dma_buf {
> >               struct kobject kobj;
> >               struct dma_buf *dmabuf;
> >       } *sysfs_entry;
> > +
> > +     struct dma_buf_sysfs_entry_metadata *sysfs_entry_metadata;
> >   #endif
> >   };
> >
>
