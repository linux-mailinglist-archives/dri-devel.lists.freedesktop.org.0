Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 81E2053748A
	for <lists+dri-devel@lfdr.de>; Mon, 30 May 2022 09:20:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73D7110E155;
	Mon, 30 May 2022 07:20:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 148F410E155
 for <dri-devel@lists.freedesktop.org>; Mon, 30 May 2022 07:20:08 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8FC0760C48;
 Mon, 30 May 2022 07:20:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E19BC385B8;
 Mon, 30 May 2022 07:20:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1653895207;
 bh=1GYA8xwv8A4OqTuRcvepVUWnBfaqueLUV3X+63p62wc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=diUdxC945pZi7kYjRRgZ6CCIy0vTU1t+fzn7OE9jq9w6nFWV6yQUmm586Hjc577U9
 i005489veZivrUZugT4493xRmjZWtgG/veGtA7YpESbCkCUlr2nFpxZNEiJl9NjsuZ
 YoG8nMiISWICfLF6QHIY+o5Hjm7Z8j4shZol2Ssk=
Date: Mon, 30 May 2022 09:20:03 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH v3] dma-buf: Add a capabilities directory
Message-ID: <YpRwI7xm5Wtxyiz8@kroah.com>
References: <20220527073422.367910-1-contact@emersion.fr>
 <dbee55fd-37ac-d7cd-dc78-d72776dfdfac@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <dbee55fd-37ac-d7cd-dc78-d72776dfdfac@amd.com>
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
Cc: Jason Ekstrand <jason.ekstrand@collabora.com>,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@ffwll.ch>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, May 30, 2022 at 09:09:30AM +0200, Christian König wrote:
> Am 27.05.22 um 09:34 schrieb Simon Ser:
> > To discover support for new DMA-BUF IOCTLs, user-space has no
> > choice but to try to perform the IOCTL on an existing DMA-BUF.
> > However, user-space may want to figure out whether or not the
> > IOCTL is available before it has a DMA-BUF at hand, e.g. at
> > initialization time in a Wayland compositor.
> > 
> > Add a /sys/kernel/dmabuf/caps directory which allows the DMA-BUF
> > subsystem to advertise supported features. Add a
> > sync_file_import_export entry which indicates that importing and
> > exporting sync_files from/to DMA-BUFs is supported.
> 
> I find a separate directory rather unusual, but can't come up with any
> better idea either.
> 
> IIRC the security module had a mask file with names for the supported
> capabilities.
> 
> > 
> > v2: Add missing files lost in a rebase
> > 
> > v3:
> > - Create separate file in Documentation/ABI/testing/, add it to
> >    MAINTAINERS
> > - Fix kernel version (Daniel)
> > - Remove unnecessary brackets (Jason)
> > - Fix SPDX comment style
> > 
> > Signed-off-by: Simon Ser <contact@emersion.fr>
> > Reviewed-by: Jason Ekstrand <jason.ekstrand@collabora.com>
> > Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> > Cc: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
> > Cc: Christian König <christian.koenig@amd.com>
> > Cc: Greg KH <greg@kroah.com>
> > ---
> >   .../ABI/testing/sysfs-kernel-dmabuf-caps      | 13 +++++
> >   MAINTAINERS                                   |  1 +
> >   drivers/dma-buf/Makefile                      |  2 +-
> >   drivers/dma-buf/dma-buf-sysfs-caps.c          | 51 +++++++++++++++++++
> >   drivers/dma-buf/dma-buf-sysfs-caps.h          | 16 ++++++
> >   drivers/dma-buf/dma-buf-sysfs-stats.c         | 16 ++----
> >   drivers/dma-buf/dma-buf-sysfs-stats.h         |  6 ++-
> >   drivers/dma-buf/dma-buf.c                     | 43 ++++++++++++++--
> >   include/uapi/linux/dma-buf.h                  |  6 +++
> >   9 files changed, 134 insertions(+), 20 deletions(-)
> >   create mode 100644 Documentation/ABI/testing/sysfs-kernel-dmabuf-caps
> >   create mode 100644 drivers/dma-buf/dma-buf-sysfs-caps.c
> >   create mode 100644 drivers/dma-buf/dma-buf-sysfs-caps.h
> > 
> > diff --git a/Documentation/ABI/testing/sysfs-kernel-dmabuf-caps b/Documentation/ABI/testing/sysfs-kernel-dmabuf-caps
> > new file mode 100644
> > index 000000000000..f83af422fd18
> > --- /dev/null
> > +++ b/Documentation/ABI/testing/sysfs-kernel-dmabuf-caps
> > @@ -0,0 +1,13 @@
> > +What:		/sys/kernel/dmabuf/caps
> > +Date:		May 2022
> > +KernelVersion:	v5.20
> > +Contact:	Simon Ser <contact@emersion.fr>
> > +Description:	This directory advertises DMA-BUF capabilities supported by the
> > +		kernel.
> > +
> > +What:		/sys/kernel/dmabuf/caps/sync_file_import_export
> > +Date:		May 2022
> > +KernelVersion:	v5.20
> > +Contact:	Simon Ser <contact@emersion.fr>
> > +Description:	This file is read-only and advertises support for importing and
> > +		exporting sync_files from/to DMA-BUFs.
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 11da16bfa123..8966686f7231 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -5871,6 +5871,7 @@ L:	dri-devel@lists.freedesktop.org
> >   L:	linaro-mm-sig@lists.linaro.org (moderated for non-subscribers)
> >   S:	Maintained
> >   T:	git git://anongit.freedesktop.org/drm/drm-misc
> > +F:	Documentation/ABI/testing/sysfs-kernel-dmabuf-caps
> >   F:	Documentation/driver-api/dma-buf.rst
> >   F:	drivers/dma-buf/
> >   F:	include/linux/*fence.h
> > diff --git a/drivers/dma-buf/Makefile b/drivers/dma-buf/Makefile
> > index 4c9eb53ba3f8..afc874272710 100644
> > --- a/drivers/dma-buf/Makefile
> > +++ b/drivers/dma-buf/Makefile
> > @@ -1,6 +1,6 @@
> >   # SPDX-License-Identifier: GPL-2.0-only
> >   obj-y := dma-buf.o dma-fence.o dma-fence-array.o dma-fence-chain.o \
> > -	 dma-resv.o
> > +	 dma-resv.o dma-buf-sysfs-caps.o
> >   obj-$(CONFIG_DMABUF_HEAPS)	+= dma-heap.o
> >   obj-$(CONFIG_DMABUF_HEAPS)	+= heaps/
> >   obj-$(CONFIG_SYNC_FILE)		+= sync_file.o
> > diff --git a/drivers/dma-buf/dma-buf-sysfs-caps.c b/drivers/dma-buf/dma-buf-sysfs-caps.c
> > new file mode 100644
> > index 000000000000..82b91eb874a9
> > --- /dev/null
> > +++ b/drivers/dma-buf/dma-buf-sysfs-caps.c
> > @@ -0,0 +1,51 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * DMA-BUF sysfs capabilities.
> > + *
> > + * Copyright (C) 2022 Simon Ser
> > + */
> > +
> > +#include <linux/kobject.h>
> > +#include <linux/sysfs.h>
> > +
> > +#include "dma-buf-sysfs-caps.h"
> > +
> > +static ssize_t sync_file_import_export_show(struct kobject *kobj,
> > +					    struct kobj_attribute *attr,
> > +					    char *buf)
> > +{
> > +	return sysfs_emit(buf, "1\n");
> > +}
> > +
> > +static struct kobj_attribute dma_buf_sync_file_import_export_attr =
> > +	__ATTR_RO(sync_file_import_export);
> > +
> > +static struct attribute *dma_buf_caps_attrs[] = {
> > +	&dma_buf_sync_file_import_export_attr.attr,
> > +	NULL,
> > +};
> > +
> > +static const struct attribute_group dma_buf_caps_attr_group = {
> > +	.attrs = dma_buf_caps_attrs,
> > +};
> 
> Didn't we had macros for those? I think I have seen something for that.

Yes, please use ATTRIBUTE_GROUPS()

> > +
> > +static struct kobject *dma_buf_caps_kobj;
> > +
> > +int dma_buf_init_sysfs_capabilities(struct kset *kset)
> > +{
> > +	int ret;
> > +
> > +	dma_buf_caps_kobj = kobject_create_and_add("caps", &kset->kobj);
> > +	if (!dma_buf_caps_kobj)
> > +		return -ENOMEM;
> > +
> > +	ret = sysfs_create_group(dma_buf_caps_kobj, &dma_buf_caps_attr_group);

Why do we have "raw" kobjects here?

A group can have a name, which puts it in the subdirectory of the object
it is attached to.  Please do that and do not create a new kobject.

thanks,

greg k-h
