Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B8D062CB60
	for <lists+dri-devel@lfdr.de>; Wed, 16 Nov 2022 21:48:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3CB910E0CE;
	Wed, 16 Nov 2022 20:48:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E54710E0CE
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Nov 2022 20:48:10 +0000 (UTC)
Received: by mail-lj1-x231.google.com with SMTP id a15so23407006ljb.7
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Nov 2022 12:48:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:date:from:from:to
 :cc:subject:date:message-id:reply-to;
 bh=6JrqJ6Sbn/mpwug3ot31DQ5jlBaAKyV9UfORVKR2Mss=;
 b=ae8G2P4a+COzSBWklcw0bHYPAGArR/ipKsW+u7fiYxLC5RpiZCMPR1nP6paPHPtTU+
 ixAtrPPkYXbQrKfG9JJYkVYljE/UarocqtY2NdpjfKE/yG+428aRbIWnx8d23Nbgngem
 03e0erDFegoKeZ43KUMQmwfav4coOnd7KBBFBNxo/+2jdxIkFW/kgI3aW8cwEaDubHWz
 VW6GaCciKF2TAdB14poivTQIW0ORCgyvavOMn59cxTTT7hkGEXlT1JRgnxxWahYX3oCj
 zFfb2hQCOlTpnhIxRLUJq3uz7DGJW4p/zHMlSmf1UqgBuzLCY3UyXYDvx9/fs5eBxPWR
 VBBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:date:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6JrqJ6Sbn/mpwug3ot31DQ5jlBaAKyV9UfORVKR2Mss=;
 b=V5WKLLTG75wtMWgbLq4NsDO0KzUm4SA8zUdgOQ/ucjbnaIJ9W0zPyIgf3xHN1+PXbQ
 wxa8lYOgiZQ+hS8u5Le+ciA+k574+tACQEJYdzWk+8wHLmPnv9ZEjOgc49ukOmqCOlcm
 aa/LSYWXWQMa/brTdv0yD6LC/sEc07J2FHV+a1v7Jkbmvds2g+4FHaC+AKFAB7nhI++f
 WRTkE5A1z08kp7Vm4gSpmnjPW2cSarlmbNjPzmx8m6hbEw4mtdjOJNSLUP+9Hl6DToIp
 2hcOK+46UyU6wD3q+XL2R0pmBHu06KbS8iOIH2kfJNE1696juNTj33wa++hd9Xek6pZz
 6Ouw==
X-Gm-Message-State: ANoB5pkVWmy0YYFRkY00gIFV4vgZGtywxQDIBhra73HVhtJg7IwzZB5z
 ueQdhRYfRFUrEAbEf31nHqE=
X-Google-Smtp-Source: AA0mqf7c2zjF447ne46/zGiLbIu4u1JQD5e98fP8HM3pjr3ANuBHPVYOBUVr94QMa4CkrW+Ny/1oPw==
X-Received: by 2002:a2e:9103:0:b0:278:fa62:bc90 with SMTP id
 m3-20020a2e9103000000b00278fa62bc90mr6506ljg.360.1668631688223; 
 Wed, 16 Nov 2022 12:48:08 -0800 (PST)
Received: from thinkpad-p72 (user-5-173-65-115.play-internet.pl.
 [5.173.65.115]) by smtp.gmail.com with ESMTPSA id
 n1-20020ac24901000000b004b4823f02b0sm2759613lfi.152.2022.11.16.12.48.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Nov 2022 12:48:07 -0800 (PST)
From: Lukasz Wiecaszek <lukasz.wiecaszek@googlemail.com>
X-Google-Original-From: Lukasz Wiecaszek <lukasz.wiecaszek@gmail.com>
Date: Wed, 16 Nov 2022 21:48:04 +0100
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Subject: Re: [PATCH v3] udmabuf: add vmap and vunmap methods to udmabuf_ops
Message-ID: <20221116204804.GA22663@thinkpad-p72>
References: <20221115200426.4801-1-lukasz.wiecaszek@gmail.com>
 <b715cb83-32f1-a33b-a0c2-b779011151c0@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b715cb83-32f1-a33b-a0c2-b779011151c0@amd.com>
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
Cc: kernel test robot <lkp@intel.com>,
 Lukasz Wiecaszek <lukasz.wiecaszek@googlemail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, Gerd Hoffmann <kraxel@redhat.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Nov 16, 2022 at 01:01:46PM +0100, Christian König wrote:
> Am 15.11.22 um 21:04 schrieb Lukasz Wiecaszek:
> > The reason behind that patch is associated with videobuf2 subsystem
> > (or more genrally with v4l2 framework) and user created
> > dma buffers (udmabuf). In some circumstances
> > when dealing with V4L2_MEMORY_DMABUF buffers videobuf2 subsystem
> > wants to use dma_buf_vmap() method on the attached dma buffer.
> > As udmabuf does not have .vmap operation implemented,
> > such dma_buf_vmap() natually fails.
> > 
> > videobuf2_common: __vb2_queue_alloc: allocated 3 buffers, 1 plane(s) each
> > videobuf2_common: __prepare_dmabuf: buffer for plane 0 changed
> > videobuf2_common: __prepare_dmabuf: failed to map dmabuf for plane 0
> > videobuf2_common: __buf_prepare: buffer preparation failed: -14
> > 
> > The patch itself seems to be strighforward.
> > It adds implementation of .vmap and .vunmap methods
> > to 'struct dma_buf_ops udmabuf_ops'.
> > .vmap method itself uses vm_map_ram() to map pages linearly
> > into the kernel virtual address space.
> > .vunmap removes mapping created earlier by .vmap.
> > All locking and 'vmapping counting' is done in dma_buf.c
> > so it seems to be redundant/unnecessary in .vmap/.vunmap.
> > 
> > Signed-off-by: Lukasz Wiecaszek <lukasz.wiecaszek@gmail.com>
> 
> > Reported-by: kernel test robot <lkp@intel.com>
> 
> Please drop this line, the kernel test robot should only be mentioned if the
> original report came from it.
> 
> And keep in mind that it might be necessary to implement begin/end cpu
> access callbacks as well.
> 
> Apart from that the patch is Acked-by: Christian König
> <christian.koenig@amd.com>.
> 
> Regards,
> Christian.

Thanks for that lesson with the 'kernel test robot' line.
The second issue with begin/end cpu access callbacks is more complicated
to me. My understaning is that memory allocated for udambuf will be the 
memory obtained most likely (if not always) by memfd_create(). 
So this will be the anonymous system memory which is 'by definition' 
coherent for cpu access. So no need for begin/end callbacks.
But if I miss something, plese let me/us know.

> 
> > ---
> > v1: https://lore.kernel.org/linux-media/202211120352.G7WPASoP-lkp@intel.com/T/#t
> > v2: https://lore.kernel.org/linux-media/20221114052944.GA7264@thinkpad-p72/T/#t
> > 
> > v2 -> v3: Added .vunmap to 'struct dma_buf_ops udmabuf_ops'
> > v1 -> v2: Patch prepared and tested against 6.1.0-rc2+
> > 
> >   drivers/dma-buf/udmabuf.c | 28 ++++++++++++++++++++++++++++
> >   1 file changed, 28 insertions(+)
> > 
> > diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
> > index 283816fbd72f..740d6e426ee9 100644
> > --- a/drivers/dma-buf/udmabuf.c
> > +++ b/drivers/dma-buf/udmabuf.c
> > @@ -13,6 +13,8 @@
> >   #include <linux/slab.h>
> >   #include <linux/udmabuf.h>
> >   #include <linux/hugetlb.h>
> > +#include <linux/vmalloc.h>
> > +#include <linux/iosys-map.h>
> >   static int list_limit = 1024;
> >   module_param(list_limit, int, 0644);
> > @@ -60,6 +62,30 @@ static int mmap_udmabuf(struct dma_buf *buf, struct vm_area_struct *vma)
> >   	return 0;
> >   }
> > +static int vmap_udmabuf(struct dma_buf *buf, struct iosys_map *map)
> > +{
> > +	struct udmabuf *ubuf = buf->priv;
> > +	void *vaddr;
> > +
> > +	dma_resv_assert_held(buf->resv);
> > +
> > +	vaddr = vm_map_ram(ubuf->pages, ubuf->pagecount, -1);
> > +	if (!vaddr)
> > +		return -EINVAL;
> > +
> > +	iosys_map_set_vaddr(map, vaddr);
> > +	return 0;
> > +}
> > +
> > +static void vunmap_udmabuf(struct dma_buf *buf, struct iosys_map *map)
> > +{
> > +	struct udmabuf *ubuf = buf->priv;
> > +
> > +	dma_resv_assert_held(buf->resv);
> > +
> > +	vm_unmap_ram(map->vaddr, ubuf->pagecount);
> > +}
> > +
> >   static struct sg_table *get_sg_table(struct device *dev, struct dma_buf *buf,
> >   				     enum dma_data_direction direction)
> >   {
> > @@ -162,6 +188,8 @@ static const struct dma_buf_ops udmabuf_ops = {
> >   	.unmap_dma_buf	   = unmap_udmabuf,
> >   	.release	   = release_udmabuf,
> >   	.mmap		   = mmap_udmabuf,
> > +	.vmap		   = vmap_udmabuf,
> > +	.vunmap		   = vunmap_udmabuf,
> >   	.begin_cpu_access  = begin_cpu_udmabuf,
> >   	.end_cpu_access    = end_cpu_udmabuf,
> >   };
> 
