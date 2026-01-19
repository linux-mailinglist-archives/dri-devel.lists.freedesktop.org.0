Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9542D3A9E9
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jan 2026 14:08:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F8E710E453;
	Mon, 19 Jan 2026 13:08:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="hZaAn8L8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com
 [209.85.218.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08D5C10E453
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 13:08:41 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id
 a640c23a62f3a-b87cc82fd85so184334466b.2
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 05:08:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1768828119; x=1769432919; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DAfYRQkT3Ezomz71v5iTAhW0+70GaCmS0ngv6YppkZI=;
 b=hZaAn8L8kbKb2kZEl/NZhJwAvRNVW8rjbhmhl4XPcxNDTq+0wjVVH71ucz/+qDIb/a
 av/UOHjQmfbp83dr/0Xt7RogT0Aaig6l830AD7SL8Y8MRwwajZY6F/Mot+EipEZHzXza
 Da/rTX2DtfvbkvCMnC7bPuCqh9ZQRXQBfadNoxKG+exgUrkSkhzIJ0IVrXD/972YoXws
 EgggZZb7+zfXMIBD0f4TPDIIvmV/7gPUzR5pk0DtVebbI3M6jpix7HuQ9fdtJ7CwemOw
 zl1Rmtq//hoqaWJMucRD7XsO6M2rPXj+uf1io8XPYIfjeAPWoRDqtlTnuPcNx25is7Ak
 8aIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768828119; x=1769432919;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=DAfYRQkT3Ezomz71v5iTAhW0+70GaCmS0ngv6YppkZI=;
 b=qYjOTrfZiNknk/nSMFEPNSovprfU3wiewmGD2q6jFuyikGas5PNXKGpU+x8KLE2amE
 QP9GckIz/Jf57Jlgi1S8N+7Ig/0yVerUGaQBG03IK1SSIMlmWOnch91/0NRSQ1sXGtUs
 3Y4Epkend8bguQhPzjgxWuAfJueQCDnD234xRzJT70wGiKiZzFfmZFCr2Ck6OdSh6kK6
 Lf3qJwYivlZHkTEYnUQ2E68EV4sb7u+Vhn3liVhU+KfURRIVpKLPQQA4g7Xyl0gaJTXm
 AfJ+fMSOCU9N6n9CJehPnvZOuISXOCkYUmSSd/v5HljNySbe3+6o4Y1R9PSp2Le62ZDG
 Yl8Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVd4Be1qe96pgnkapes+bu+f4Y1we/ATloikpRpGxe/DxLY8GylObOOTRS0LHHDk3FTprpV2fYXKRY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YywAP9dmSDoRE6KLzg4mG9v8Wgp/kd3elzra1EQBxFOn0Te5Yf5
 ta6iQjQ2TFcDs5aSeCnz/LH/IV2Tn/+igiX3CTPQb58L3tyM7QZVnypc9F3fRUcZdqX306ZiwHj
 S828cyYn5ITMYRyfq2gLx/ptaZR0YHCqOFKLYTTGErA==
X-Gm-Gg: AY/fxX6k8FN0hfkr29sgA1mHh04RWpcFk6qYWwGnvmJm7/oRPB/lLHE2ugxJDicLYBa
 99NtPdHZRGrvSoLg/Zp8LOQ5orMaKbxb/cw9Iww0mroX7UkpxoN1zGyTTCNE3dfVXyKKOhaJNlV
 Z/oxVm0hgaS81K6RnimhjkhHXVfbHmjewg83A/Gm86pKT0oY8TO4jUsmINBm4gvi7FLzL/W8bey
 nODZYXFxGSMpGPDpdDVrJS7iTHhYgqw1unEqv9nhIuC67t3BrC8qfQtbVoADL4MTVrHyMDlRJds
 Vu8Q3JOc1H4jyemp25hlpg9YZS0=
X-Received: by 2002:a17:906:730e:b0:b87:115c:4a30 with SMTP id
 a640c23a62f3a-b879690c497mr900814166b.16.1768828119105; Mon, 19 Jan 2026
 05:08:39 -0800 (PST)
MIME-Version: 1.0
References: <20260116190517.3268458-1-tjmercier@google.com>
 <4cd1ed61-0b19-45ef-a77c-7fccde818ae9@amd.com>
In-Reply-To: <4cd1ed61-0b19-45ef-a77c-7fccde818ae9@amd.com>
From: Sumit Semwal <sumit.semwal@linaro.org>
Date: Mon, 19 Jan 2026 18:38:27 +0530
X-Gm-Features: AZwV_QhnM8x45IrWjp5NER5n7vrxCzj5VjavxW9RTC9k9PvsskuNtL1BUJrWUho
Message-ID: <CAO_48GENCZrXNCgXnW4rujNMHk8d9QrXoACT1zpJhWR0r0jACw@mail.gmail.com>
Subject: Re: [PATCH] dma-buf: Remove DMA-BUF sysfs stats
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: "T.J. Mercier" <tjmercier@google.com>, Jonathan Corbet <corbet@lwn.net>,
 linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linaro-mm-sig@lists.linaro.org, linux-doc@vger.kernel.org
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi T J,

On Mon, 19 Jan 2026 at 15:15, Christian K=C3=B6nig <christian.koenig@amd.co=
m> wrote:
>
> On 1/16/26 20:05, T.J. Mercier wrote:
> > Commit bdb8d06dfefd ("dmabuf: Add the capability to expose DMA-BUF stat=
s
> > in sysfs") added dmabuf statistics to sysfs in 2021 under
> > CONFIG_DMABUF_SYSFS_STATS. After being used in production, performance
> > problems were discovered leading to its deprecation in 2022 in commit
> > e0a9f1fe206a ("dma-buf: deprecate DMABUF_SYSFS_STATS"). Some of the
> > problems with this interface were discussed in my LPC 2025 talk. [1][2]
> >
> > Android was probably the last user of the interface, which has since
> > been migrated to use the dmabuf BPF iterator [3] to obtain the same
> > information more cheaply. As promised in that series, now that the
> > longterm stable 6.18 kernel has been released let's remove the sysfs
> > dmabuf statistics from the kernel.
> >
> > [1] https://www.youtube.com/watch?v=3DD83qygudq9c
> > [2] https://lpc.events/event/19/contributions/2118/
> > [3] https://lore.kernel.org/all/20250522230429.941193-1-tjmercier@googl=
e.com/
> >
> > Signed-off-by: T.J. Mercier <tjmercier@google.com>
>
> Oh yes please :)
>
> Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd.com>
Thank you for your patch, LGTM :)

If its not pushed yet, I'll push it tonight.

Best,
Sumit
>
> > ---
> >  .../ABI/testing/sysfs-kernel-dmabuf-buffers   |  24 ---
> >  Documentation/driver-api/dma-buf.rst          |   5 -
> >  drivers/dma-buf/Kconfig                       |  15 --
> >  drivers/dma-buf/Makefile                      |   1 -
> >  drivers/dma-buf/dma-buf-sysfs-stats.c         | 202 ------------------
> >  drivers/dma-buf/dma-buf-sysfs-stats.h         |  35 ---
> >  drivers/dma-buf/dma-buf.c                     |  18 --
> >  include/linux/dma-buf.h                       |  12 --
> >  8 files changed, 312 deletions(-)
> >  delete mode 100644 Documentation/ABI/testing/sysfs-kernel-dmabuf-buffe=
rs
> >  delete mode 100644 drivers/dma-buf/dma-buf-sysfs-stats.c
> >  delete mode 100644 drivers/dma-buf/dma-buf-sysfs-stats.h
> >
> > diff --git a/Documentation/ABI/testing/sysfs-kernel-dmabuf-buffers b/Do=
cumentation/ABI/testing/sysfs-kernel-dmabuf-buffers
> > deleted file mode 100644
> > index 5d3bc997dc64..000000000000
> > --- a/Documentation/ABI/testing/sysfs-kernel-dmabuf-buffers
> > +++ /dev/null
> > @@ -1,24 +0,0 @@
> > -What:                /sys/kernel/dmabuf/buffers
> > -Date:                May 2021
> > -KernelVersion:       v5.13
> > -Contact:     Hridya Valsaraju <hridya@google.com>
> > -Description: The /sys/kernel/dmabuf/buffers directory contains a
> > -             snapshot of the internal state of every DMA-BUF.
> > -             /sys/kernel/dmabuf/buffers/<inode_number> will contain th=
e
> > -             statistics for the DMA-BUF with the unique inode number
> > -             <inode_number>
> > -Users:               kernel memory tuning/debugging tools
> > -
> > -What:                /sys/kernel/dmabuf/buffers/<inode_number>/exporte=
r_name
> > -Date:                May 2021
> > -KernelVersion:       v5.13
> > -Contact:     Hridya Valsaraju <hridya@google.com>
> > -Description: This file is read-only and contains the name of the expor=
ter of
> > -             the DMA-BUF.
> > -
> > -What:                /sys/kernel/dmabuf/buffers/<inode_number>/size
> > -Date:                May 2021
> > -KernelVersion:       v5.13
> > -Contact:     Hridya Valsaraju <hridya@google.com>
> > -Description: This file is read-only and specifies the size of the DMA-=
BUF in
> > -             bytes.
> > diff --git a/Documentation/driver-api/dma-buf.rst b/Documentation/drive=
r-api/dma-buf.rst
> > index 29abf1eebf9f..2f36c21d9948 100644
> > --- a/Documentation/driver-api/dma-buf.rst
> > +++ b/Documentation/driver-api/dma-buf.rst
> > @@ -125,11 +125,6 @@ Implicit Fence Poll Support
> >  .. kernel-doc:: drivers/dma-buf/dma-buf.c
> >     :doc: implicit fence polling
> >
> > -DMA-BUF statistics
> > -~~~~~~~~~~~~~~~~~~
> > -.. kernel-doc:: drivers/dma-buf/dma-buf-sysfs-stats.c
> > -   :doc: overview
> > -
> >  DMA Buffer ioctls
> >  ~~~~~~~~~~~~~~~~~
> >
> > diff --git a/drivers/dma-buf/Kconfig b/drivers/dma-buf/Kconfig
> > index fdd823e446cc..012d22e941d6 100644
> > --- a/drivers/dma-buf/Kconfig
> > +++ b/drivers/dma-buf/Kconfig
> > @@ -75,21 +75,6 @@ menuconfig DMABUF_HEAPS
> >         allows userspace to allocate dma-bufs that can be shared
> >         between drivers.
> >
> > -menuconfig DMABUF_SYSFS_STATS
> > -     bool "DMA-BUF sysfs statistics (DEPRECATED)"
> > -     depends on DMA_SHARED_BUFFER
> > -     help
> > -        Choose this option to enable DMA-BUF sysfs statistics
> > -        in location /sys/kernel/dmabuf/buffers.
> > -
> > -        /sys/kernel/dmabuf/buffers/<inode_number> will contain
> > -        statistics for the DMA-BUF with the unique inode number
> > -        <inode_number>.
> > -
> > -        This option is deprecated and should sooner or later be remove=
d.
> > -        Android is the only user of this and it turned out that this r=
esulted
> > -        in quite some performance problems.
> > -
> >  source "drivers/dma-buf/heaps/Kconfig"
> >
> >  endmenu
> > diff --git a/drivers/dma-buf/Makefile b/drivers/dma-buf/Makefile
> > index 2008fb7481b3..7a85565d906b 100644
> > --- a/drivers/dma-buf/Makefile
> > +++ b/drivers/dma-buf/Makefile
> > @@ -6,7 +6,6 @@ obj-$(CONFIG_DMABUF_HEAPS)    +=3D heaps/
> >  obj-$(CONFIG_SYNC_FILE)              +=3D sync_file.o
> >  obj-$(CONFIG_SW_SYNC)                +=3D sw_sync.o sync_debug.o
> >  obj-$(CONFIG_UDMABUF)                +=3D udmabuf.o
> > -obj-$(CONFIG_DMABUF_SYSFS_STATS) +=3D dma-buf-sysfs-stats.o
> >
> >  dmabuf_selftests-y :=3D \
> >       selftest.o \
> > diff --git a/drivers/dma-buf/dma-buf-sysfs-stats.c b/drivers/dma-buf/dm=
a-buf-sysfs-stats.c
> > deleted file mode 100644
> > index b5b62e40ccc1..000000000000
> > --- a/drivers/dma-buf/dma-buf-sysfs-stats.c
> > +++ /dev/null
> > @@ -1,202 +0,0 @@
> > -// SPDX-License-Identifier: GPL-2.0-only
> > -/*
> > - * DMA-BUF sysfs statistics.
> > - *
> > - * Copyright (C) 2021 Google LLC.
> > - */
> > -
> > -#include <linux/dma-buf.h>
> > -#include <linux/dma-resv.h>
> > -#include <linux/kobject.h>
> > -#include <linux/printk.h>
> > -#include <linux/slab.h>
> > -#include <linux/sysfs.h>
> > -
> > -#include "dma-buf-sysfs-stats.h"
> > -
> > -#define to_dma_buf_entry_from_kobj(x) container_of(x, struct dma_buf_s=
ysfs_entry, kobj)
> > -
> > -/**
> > - * DOC: overview
> > - *
> > - * ``/sys/kernel/debug/dma_buf/bufinfo`` provides an overview of every=
 DMA-BUF
> > - * in the system. However, since debugfs is not safe to be mounted in
> > - * production, procfs and sysfs can be used to gather DMA-BUF statisti=
cs on
> > - * production systems.
> > - *
> > - * The ``/proc/<pid>/fdinfo/<fd>`` files in procfs can be used to gath=
er
> > - * information about DMA-BUF fds. Detailed documentation about the int=
erface
> > - * is present in Documentation/filesystems/proc.rst.
> > - *
> > - * Unfortunately, the existing procfs interfaces can only provide info=
rmation
> > - * about the DMA-BUFs for which processes hold fds or have the buffers=
 mmapped
> > - * into their address space. This necessitated the creation of the DMA=
-BUF sysfs
> > - * statistics interface to provide per-buffer information on productio=
n systems.
> > - *
> > - * The interface at ``/sys/kernel/dmabuf/buffers`` exposes information=
 about
> > - * every DMA-BUF when ``CONFIG_DMABUF_SYSFS_STATS`` is enabled.
> > - *
> > - * The following stats are exposed by the interface:
> > - *
> > - * * ``/sys/kernel/dmabuf/buffers/<inode_number>/exporter_name``
> > - * * ``/sys/kernel/dmabuf/buffers/<inode_number>/size``
> > - *
> > - * The information in the interface can also be used to derive per-exp=
orter
> > - * statistics. The data from the interface can be gathered on error co=
nditions
> > - * or other important events to provide a snapshot of DMA-BUF usage.
> > - * It can also be collected periodically by telemetry to monitor vario=
us metrics.
> > - *
> > - * Detailed documentation about the interface is present in
> > - * Documentation/ABI/testing/sysfs-kernel-dmabuf-buffers.
> > - */
> > -
> > -struct dma_buf_stats_attribute {
> > -     struct attribute attr;
> > -     ssize_t (*show)(struct dma_buf *dmabuf,
> > -                     struct dma_buf_stats_attribute *attr, char *buf);
> > -};
> > -#define to_dma_buf_stats_attr(x) container_of(x, struct dma_buf_stats_=
attribute, attr)
> > -
> > -static ssize_t dma_buf_stats_attribute_show(struct kobject *kobj,
> > -                                         struct attribute *attr,
> > -                                         char *buf)
> > -{
> > -     struct dma_buf_stats_attribute *attribute;
> > -     struct dma_buf_sysfs_entry *sysfs_entry;
> > -     struct dma_buf *dmabuf;
> > -
> > -     attribute =3D to_dma_buf_stats_attr(attr);
> > -     sysfs_entry =3D to_dma_buf_entry_from_kobj(kobj);
> > -     dmabuf =3D sysfs_entry->dmabuf;
> > -
> > -     if (!dmabuf || !attribute->show)
> > -             return -EIO;
> > -
> > -     return attribute->show(dmabuf, attribute, buf);
> > -}
> > -
> > -static const struct sysfs_ops dma_buf_stats_sysfs_ops =3D {
> > -     .show =3D dma_buf_stats_attribute_show,
> > -};
> > -
> > -static ssize_t exporter_name_show(struct dma_buf *dmabuf,
> > -                               struct dma_buf_stats_attribute *attr,
> > -                               char *buf)
> > -{
> > -     return sysfs_emit(buf, "%s\n", dmabuf->exp_name);
> > -}
> > -
> > -static ssize_t size_show(struct dma_buf *dmabuf,
> > -                      struct dma_buf_stats_attribute *attr,
> > -                      char *buf)
> > -{
> > -     return sysfs_emit(buf, "%zu\n", dmabuf->size);
> > -}
> > -
> > -static struct dma_buf_stats_attribute exporter_name_attribute =3D
> > -     __ATTR_RO(exporter_name);
> > -static struct dma_buf_stats_attribute size_attribute =3D __ATTR_RO(siz=
e);
> > -
> > -static struct attribute *dma_buf_stats_default_attrs[] =3D {
> > -     &exporter_name_attribute.attr,
> > -     &size_attribute.attr,
> > -     NULL,
> > -};
> > -ATTRIBUTE_GROUPS(dma_buf_stats_default);
> > -
> > -static void dma_buf_sysfs_release(struct kobject *kobj)
> > -{
> > -     struct dma_buf_sysfs_entry *sysfs_entry;
> > -
> > -     sysfs_entry =3D to_dma_buf_entry_from_kobj(kobj);
> > -     kfree(sysfs_entry);
> > -}
> > -
> > -static const struct kobj_type dma_buf_ktype =3D {
> > -     .sysfs_ops =3D &dma_buf_stats_sysfs_ops,
> > -     .release =3D dma_buf_sysfs_release,
> > -     .default_groups =3D dma_buf_stats_default_groups,
> > -};
> > -
> > -void dma_buf_stats_teardown(struct dma_buf *dmabuf)
> > -{
> > -     struct dma_buf_sysfs_entry *sysfs_entry;
> > -
> > -     sysfs_entry =3D dmabuf->sysfs_entry;
> > -     if (!sysfs_entry)
> > -             return;
> > -
> > -     kobject_del(&sysfs_entry->kobj);
> > -     kobject_put(&sysfs_entry->kobj);
> > -}
> > -
> > -
> > -/* Statistics files do not need to send uevents. */
> > -static int dmabuf_sysfs_uevent_filter(const struct kobject *kobj)
> > -{
> > -     return 0;
> > -}
> > -
> > -static const struct kset_uevent_ops dmabuf_sysfs_no_uevent_ops =3D {
> > -     .filter =3D dmabuf_sysfs_uevent_filter,
> > -};
> > -
> > -static struct kset *dma_buf_stats_kset;
> > -static struct kset *dma_buf_per_buffer_stats_kset;
> > -int dma_buf_init_sysfs_statistics(void)
> > -{
> > -     dma_buf_stats_kset =3D kset_create_and_add("dmabuf",
> > -                                              &dmabuf_sysfs_no_uevent_=
ops,
> > -                                              kernel_kobj);
> > -     if (!dma_buf_stats_kset)
> > -             return -ENOMEM;
> > -
> > -     dma_buf_per_buffer_stats_kset =3D kset_create_and_add("buffers",
> > -                                                         &dmabuf_sysfs=
_no_uevent_ops,
> > -                                                         &dma_buf_stat=
s_kset->kobj);
> > -     if (!dma_buf_per_buffer_stats_kset) {
> > -             kset_unregister(dma_buf_stats_kset);
> > -             return -ENOMEM;
> > -     }
> > -
> > -     return 0;
> > -}
> > -
> > -void dma_buf_uninit_sysfs_statistics(void)
> > -{
> > -     kset_unregister(dma_buf_per_buffer_stats_kset);
> > -     kset_unregister(dma_buf_stats_kset);
> > -}
> > -
> > -int dma_buf_stats_setup(struct dma_buf *dmabuf, struct file *file)
> > -{
> > -     struct dma_buf_sysfs_entry *sysfs_entry;
> > -     int ret;
> > -
> > -     if (!dmabuf->exp_name) {
> > -             pr_err("exporter name must not be empty if stats needed\n=
");
> > -             return -EINVAL;
> > -     }
> > -
> > -     sysfs_entry =3D kzalloc(sizeof(struct dma_buf_sysfs_entry), GFP_K=
ERNEL);
> > -     if (!sysfs_entry)
> > -             return -ENOMEM;
> > -
> > -     sysfs_entry->kobj.kset =3D dma_buf_per_buffer_stats_kset;
> > -     sysfs_entry->dmabuf =3D dmabuf;
> > -
> > -     dmabuf->sysfs_entry =3D sysfs_entry;
> > -
> > -     /* create the directory for buffer stats */
> > -     ret =3D kobject_init_and_add(&sysfs_entry->kobj, &dma_buf_ktype, =
NULL,
> > -                                "%lu", file_inode(file)->i_ino);
> > -     if (ret)
> > -             goto err_sysfs_dmabuf;
> > -
> > -     return 0;
> > -
> > -err_sysfs_dmabuf:
> > -     kobject_put(&sysfs_entry->kobj);
> > -     dmabuf->sysfs_entry =3D NULL;
> > -     return ret;
> > -}
> > diff --git a/drivers/dma-buf/dma-buf-sysfs-stats.h b/drivers/dma-buf/dm=
a-buf-sysfs-stats.h
> > deleted file mode 100644
> > index 7a8a995b75ba..000000000000
> > --- a/drivers/dma-buf/dma-buf-sysfs-stats.h
> > +++ /dev/null
> > @@ -1,35 +0,0 @@
> > -/* SPDX-License-Identifier: GPL-2.0-only */
> > -/*
> > - * DMA-BUF sysfs statistics.
> > - *
> > - * Copyright (C) 2021 Google LLC.
> > - */
> > -
> > -#ifndef _DMA_BUF_SYSFS_STATS_H
> > -#define _DMA_BUF_SYSFS_STATS_H
> > -
> > -#ifdef CONFIG_DMABUF_SYSFS_STATS
> > -
> > -int dma_buf_init_sysfs_statistics(void);
> > -void dma_buf_uninit_sysfs_statistics(void);
> > -
> > -int dma_buf_stats_setup(struct dma_buf *dmabuf, struct file *file);
> > -
> > -void dma_buf_stats_teardown(struct dma_buf *dmabuf);
> > -#else
> > -
> > -static inline int dma_buf_init_sysfs_statistics(void)
> > -{
> > -     return 0;
> > -}
> > -
> > -static inline void dma_buf_uninit_sysfs_statistics(void) {}
> > -
> > -static inline int dma_buf_stats_setup(struct dma_buf *dmabuf, struct f=
ile *file)
> > -{
> > -     return 0;
> > -}
> > -
> > -static inline void dma_buf_stats_teardown(struct dma_buf *dmabuf) {}
> > -#endif
> > -#endif // _DMA_BUF_SYSFS_STATS_H
> > diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> > index a4d8f2ff94e4..8e23580f1754 100644
> > --- a/drivers/dma-buf/dma-buf.c
> > +++ b/drivers/dma-buf/dma-buf.c
> > @@ -33,8 +33,6 @@
> >  #include <uapi/linux/dma-buf.h>
> >  #include <uapi/linux/magic.h>
> >
> > -#include "dma-buf-sysfs-stats.h"
> > -
> >  #define CREATE_TRACE_POINTS
> >  #include <trace/events/dma_buf.h>
> >
> > @@ -184,7 +182,6 @@ static void dma_buf_release(struct dentry *dentry)
> >        */
> >       BUG_ON(dmabuf->cb_in.active || dmabuf->cb_out.active);
> >
> > -     dma_buf_stats_teardown(dmabuf);
> >       dmabuf->ops->release(dmabuf);
> >
> >       if (dmabuf->resv =3D=3D (struct dma_resv *)&dmabuf[1])
> > @@ -765,10 +762,6 @@ struct dma_buf *dma_buf_export(const struct dma_bu=
f_export_info *exp_info)
> >               dmabuf->resv =3D resv;
> >       }
> >
> > -     ret =3D dma_buf_stats_setup(dmabuf, file);
> > -     if (ret)
> > -             goto err_dmabuf;
> > -
> >       file->private_data =3D dmabuf;
> >       file->f_path.dentry->d_fsdata =3D dmabuf;
> >       dmabuf->file =3D file;
> > @@ -779,10 +772,6 @@ struct dma_buf *dma_buf_export(const struct dma_bu=
f_export_info *exp_info)
> >
> >       return dmabuf;
> >
> > -err_dmabuf:
> > -     if (!resv)
> > -             dma_resv_fini(dmabuf->resv);
> > -     kfree(dmabuf);
> >  err_file:
> >       fput(file);
> >  err_module:
> > @@ -1802,12 +1791,6 @@ static inline void dma_buf_uninit_debugfs(void)
> >
> >  static int __init dma_buf_init(void)
> >  {
> > -     int ret;
> > -
> > -     ret =3D dma_buf_init_sysfs_statistics();
> > -     if (ret)
> > -             return ret;
> > -
> >       dma_buf_mnt =3D kern_mount(&dma_buf_fs_type);
> >       if (IS_ERR(dma_buf_mnt))
> >               return PTR_ERR(dma_buf_mnt);
> > @@ -1821,6 +1804,5 @@ static void __exit dma_buf_deinit(void)
> >  {
> >       dma_buf_uninit_debugfs();
> >       kern_unmount(dma_buf_mnt);
> > -     dma_buf_uninit_sysfs_statistics();
> >  }
> >  __exitcall(dma_buf_deinit);
> > diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
> > index 0bc492090237..91f4939db89b 100644
> > --- a/include/linux/dma-buf.h
> > +++ b/include/linux/dma-buf.h
> > @@ -429,18 +429,6 @@ struct dma_buf {
> >
> >               __poll_t active;
> >       } cb_in, cb_out;
> > -#ifdef CONFIG_DMABUF_SYSFS_STATS
> > -     /**
> > -      * @sysfs_entry:
> > -      *
> > -      * For exposing information about this buffer in sysfs. See also
> > -      * `DMA-BUF statistics`_ for the uapi this enables.
> > -      */
> > -     struct dma_buf_sysfs_entry {
> > -             struct kobject kobj;
> > -             struct dma_buf *dmabuf;
> > -     } *sysfs_entry;
> > -#endif
> >  };
> >
> >  /**
> >
> > base-commit: 26b4309a3ab82a0697751cde52eb336c29c19035
>
