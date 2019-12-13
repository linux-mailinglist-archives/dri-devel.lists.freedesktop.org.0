Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A057B11DB86
	for <lists+dri-devel@lfdr.de>; Fri, 13 Dec 2019 02:09:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF8896E252;
	Fri, 13 Dec 2019 01:09:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com
 [IPv6:2607:f8b0:4864:20::d42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A60486E252
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2019 01:09:17 +0000 (UTC)
Received: by mail-io1-xd42.google.com with SMTP id i11so647705ioi.12
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Dec 2019 17:09:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nQU22W9WJnbbQmtB77ahl6JXEP8mdY43dTUME0DD/50=;
 b=aCaygJm5jMyGAedb8AXiE6RCXr143j/1ZqXYRHLOzUJonWjpJRKxQcKcMsnNeEgZ1U
 8j1bS0+5uUAy+O2rfpyLyJDP/gVLcGSPqjtgnv7neRGrVL3LEJHearIVwthcUYA0HO4k
 +KbioyLuIEEXIBNd4xlAnfxvCcAZCx3SpO16SHFPhVT5RACeNVC1p5CfTUNlQ0QhcWvg
 e99BkAX4KkM41rtZmq2rPvC0YdOZwYUo+uxp/dgIsmxXd28IO+aiY//IOPMiOn9PqfXy
 KRHAJgvq8sLxiOV1y115sljIukpvrQDBXLxQs9ikFYV6m68qD1a/7msyNjDB97p2NKlT
 1wfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nQU22W9WJnbbQmtB77ahl6JXEP8mdY43dTUME0DD/50=;
 b=cjyprt7H6/YGpZw9JUbP9dMQ9fUGV1gCfFiHwVJBhUByKbusaWzyXbdpz5GscpQPwP
 gaU86IN2sXyxPsLohF4SkzILrgzQeOdQmTqarPBqpeFq4wz2BeQWjNtCtfwYUsXuyU8P
 vxU7uTRZg/uVygTmCUWe/y3qSThhzQqafITGwECnRmtn36iFOf7DsmS6IPa7C52SU5OH
 3qQbskBQwiVk/VAa7u4hZkegNaTYBi/I7GbW0cC8VbeuJcR0tPYHXxjvb/H7GcOtfxq2
 fDsk3Vjzxix/uaIbrPUOp8jG+yo4ovwzSy4GsfHPiTj3JU205RGlFVEPv+BB56PSO9nl
 M1vg==
X-Gm-Message-State: APjAAAXh7vwtbalwJ2CoLV6dcPthvy7ZGmENDcYG8tcKHuHcWWrvIsyR
 y2d8HhdUd8v6Wd7dnatLdHjKfGxMo13yyfMcX14KQ2Bycco=
X-Google-Smtp-Source: APXvYqxltZEkBov847kYdgaP/jZHEkNAcEho+KDIl2qtwHQSvxF0GrpStcpv+I09xvq80Dot2q9AoVTBF+BaDPteZMc=
X-Received: by 2002:a02:9f06:: with SMTP id z6mr10371509jal.2.1576199356562;
 Thu, 12 Dec 2019 17:09:16 -0800 (PST)
MIME-Version: 1.0
References: <20191203013627.85991-1-gurchetansingh@chromium.org>
 <20191203013627.85991-4-gurchetansingh@chromium.org>
 <CAPaKu7QePQjhaSApGptAO3e1F7-pj6kzyNbMVQTZ+8M9TvEkiA@mail.gmail.com>
In-Reply-To: <CAPaKu7QePQjhaSApGptAO3e1F7-pj6kzyNbMVQTZ+8M9TvEkiA@mail.gmail.com>
From: Chia-I Wu <olvaffe@gmail.com>
Date: Thu, 12 Dec 2019 17:09:05 -0800
Message-ID: <CAPaKu7RwErhYfhR5HV7V7pO0gdL_yHkbajGYdxBB6LdKC+1AMA@mail.gmail.com>
Subject: Re: [PATCH 4/4] udmabuf: implement begin_cpu_access/end_cpu_access
 hooks
To: Gurchetan Singh <gurchetansingh@chromium.org>
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
Cc: Gerd Hoffmann <kraxel@redhat.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>, hch@lst.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Mon, Dec 9, 2019 at 2:44 PM Chia-I Wu <olvaffe@gmail.com> wrote:
>
> On Mon, Dec 2, 2019 at 5:36 PM Gurchetan Singh
> <gurchetansingh@chromium.org> wrote:
> >
> > With the misc device, we should end up using the result of
> > get_arch_dma_ops(..) or dma-direct ops.
> >
> > This can allow us to have WC mappings in the guest after
> > synchronization.
> >
> > Signed-off-by: Gurchetan Singh <gurchetansingh@chromium.org>
> > ---
> >  drivers/dma-buf/udmabuf.c | 39 +++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 39 insertions(+)
> >
> > diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
> > index 0a610e09ae23..61b0a2cff874 100644
> > --- a/drivers/dma-buf/udmabuf.c
> > +++ b/drivers/dma-buf/udmabuf.c
> > @@ -18,6 +18,7 @@ static const size_t size_limit_mb = 64; /* total dmabuf size, in megabytes  */
> >  struct udmabuf {
> >         pgoff_t pagecount;
> >         struct page **pages;
> > +       struct sg_table *sg;
> >         struct miscdevice *device;
> >  };
> >
> > @@ -98,20 +99,58 @@ static void unmap_udmabuf(struct dma_buf_attachment *at,
> >  static void release_udmabuf(struct dma_buf *buf)
> >  {
> >         struct udmabuf *ubuf = buf->priv;
> > +       struct device *dev = ubuf->device->this_device;
> >         pgoff_t pg;
> >
> > +       if (ubuf->sg)
> > +               put_sg_table(dev, ubuf->sg, DMA_BIDIRECTIONAL);
> > +
> >         for (pg = 0; pg < ubuf->pagecount; pg++)
> >                 put_page(ubuf->pages[pg]);
> >         kfree(ubuf->pages);
> >         kfree(ubuf);
> >  }
> >
> > +static int begin_cpu_udmabuf(struct dma_buf *buf,
> > +                            enum dma_data_direction direction)
> > +{
> > +       struct udmabuf *ubuf = buf->priv;
> > +       struct device *dev = ubuf->device->this_device;
> > +
> > +       if (!ubuf->sg) {
> > +               ubuf->sg = get_sg_table(dev, buf, direction);
> > +               if (IS_ERR(ubuf->sg))
> > +                       return PTR_ERR(ubuf->sg);
> > +       } else {
> > +               dma_sync_sg_for_device(dev, ubuf->sg->sgl,
> > +                                      ubuf->sg->nents,
> > +                                      direction);
> I know this solves the issue (flush the CPU cache before WC access),
> but it looks like an abuse?  It is counter-intuitive that the buffer
> is synced for device when one wants CPU access.
I am skeptical about this change.

(1) Semantically, a dma-buf is in DMA domain.  CPU access from the
importer must be surrounded by {begin,end}_cpu_access.  This gives the
exporter a chance to move the buffer to the CPU domain temporarily.

(2) When the exporter itself has other means to do CPU access, it is
only reasonable for the exporter to move the buffer to the CPU domain
before access, and to the DMA domain after access.  The exporter can
potentially reuse {begin,end}_cpu_access for that purpose.

Because of (1), udmabuf does need to implement the
{begin,end}_cpu_access hooks.  But "begin" should mean
dma_sync_sg_for_cpu and "end" should mean dma_sync_sg_for_device.

Because of (2), if userspace wants to continuing accessing through the
memfd mapping, it should call udmabuf's {begin,end}_cpu_access to
avoid cache issues.




>
> > +       }
> > +
> > +       return 0;
> > +}
> > +
> > +static int end_cpu_udmabuf(struct dma_buf *buf,
> > +                          enum dma_data_direction direction)
> > +{
> > +       struct udmabuf *ubuf = buf->priv;
> > +       struct device *dev = ubuf->device->this_device;
> > +
> > +       if (!ubuf->sg)
> > +               return -EINVAL;
> > +
> > +       dma_sync_sg_for_cpu(dev, ubuf->sg->sgl, ubuf->sg->nents, direction);
> > +       return 0;
> > +}
> > +
> >  static const struct dma_buf_ops udmabuf_ops = {
> >         .cache_sgt_mapping = true,
> >         .map_dma_buf       = map_udmabuf,
> >         .unmap_dma_buf     = unmap_udmabuf,
> >         .release           = release_udmabuf,
> >         .mmap              = mmap_udmabuf,
> > +       .begin_cpu_access  = begin_cpu_udmabuf,
> > +       .end_cpu_access    = end_cpu_udmabuf,
> >  };
> >
> >  #define SEALS_WANTED (F_SEAL_SHRINK)
> > --
> > 2.24.0.393.g34dc348eaf-goog
> >
> > _______________________________________________
> > dri-devel mailing list
> > dri-devel@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
