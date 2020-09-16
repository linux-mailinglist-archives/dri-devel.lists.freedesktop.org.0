Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D721F26C12B
	for <lists+dri-devel@lfdr.de>; Wed, 16 Sep 2020 11:54:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51A916E3A4;
	Wed, 16 Sep 2020 09:54:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B33B6E3A4
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Sep 2020 09:54:04 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id y15so2326397wmi.0
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Sep 2020 02:54:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to; bh=2iYj6uXZfdILOqgogXly8EZQExVDmJHzJxebCj3FO2Y=;
 b=kLEN0BssrrGNNSneN66oFCjjAadmKcUDJz92qqA1hlRweOfcEvHYpQdfeRRtwkF4EQ
 dcUsTbuHAmwH/0mnTlAiojEnwfsHgztTx14z7ldzdOZ3sB9zWn6RU/pryOBlEtk4a/OV
 Z84xyaG+7QYeXaJ7WzDVD282q5e3iYHLjHFlY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to;
 bh=2iYj6uXZfdILOqgogXly8EZQExVDmJHzJxebCj3FO2Y=;
 b=HNPpoA2G0zb9oCHWlc0CrqNih1kT8bW7zNxyzVLRiuKeCSPuwpuSFZuVRwlFXzdCeE
 TdgAoSF6Tr5Lh4KeCUOSl2YZdu07T5u7xri2vwe4lSKjBJxNeRNkOdA4ahYN5xdNfPfT
 FqVx9ftvlf33dN2GQsTrC3A2JChZVue84WGUcDBEjXOKqFX0hgN+ajSJBEJw+xte3CsC
 nXTDbop8Owd16oHk9bSoRnY9WON69wpDOnxC5iBqMxsdD2H0G3kLMt+WpxXDTHcWqfsb
 OVVfYUV9f8sVZhGZXUB3MwPdyWD9dseWIasgT5UP7uO7LYzdLeJXQLYJJbQfvSxn9KsR
 Lxwg==
X-Gm-Message-State: AOAM530ggrcv6VIqdZaoZmqLJXgjo22Y1VqRjaMYAU3OpIlp3UIIx8/Z
 Uj6It3cXjOdOCjWGmKzOJ7dMwQ==
X-Google-Smtp-Source: ABdhPJx8T8vv6SboEWDzt863SflX4VsUCD5E76qf3ZL+BjSfaIFA4+TQRt4D0/rFrg4RphT0bDAcYQ==
X-Received: by 2002:a1c:7912:: with SMTP id l18mr3807909wme.124.1600250042604; 
 Wed, 16 Sep 2020 02:54:02 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id i83sm4609049wma.22.2020.09.16.02.54.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Sep 2020 02:54:01 -0700 (PDT)
Date: Wed, 16 Sep 2020 11:53:59 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: christian.koenig@amd.com
Subject: Re: Changing vma->vm_file in dma_buf_mmap()
Message-ID: <20200916095359.GD438822@phenom.ffwll.local>
Mail-Followup-To: christian.koenig@amd.com, Jason Gunthorpe <jgg@ziepe.ca>,
 akpm@linux-foundation.org, sumit.semwal@linaro.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org
References: <20200914132920.59183-1-christian.koenig@amd.com>
 <40cd26ae-b855-4627-5a13-4dcea5d622f6@gmail.com>
 <20200914140632.GD1221970@ziepe.ca>
 <9302e4e0-0ff0-8b00-ada1-85feefb49e88@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9302e4e0-0ff0-8b00-ada1-85feefb49e88@gmail.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: linux-mm@kvack.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, Jason Gunthorpe <jgg@ziepe.ca>,
 akpm@linux-foundation.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Sep 14, 2020 at 08:26:47PM +0200, Christian K=F6nig wrote:
> Am 14.09.20 um 16:06 schrieb Jason Gunthorpe:
> > On Mon, Sep 14, 2020 at 03:30:47PM +0200, Christian K=F6nig wrote:
> > > Am 14.09.20 um 15:29 schrieb Christian K=F6nig:
> > > > Hi Andrew,
> > > > =

> > > > I'm the new DMA-buf maintainer and Daniel and others came up with
> > > > patches extending the use of the dma_buf_mmap() function.
> > > > =

> > > > Now this function is doing something a bit odd by changing the
> > > > vma->vm_file while installing a VMA in the mmap() system call
> > It doesn't look obviously safe as mmap_region() has an interesting mix
> > of file and vma->file
> > =

> > Eg it calls mapping_unmap_writable() using both routes
> =

> Thanks for the hint, going to take a look at that code tomorrow.
> =

> > What about security? Is it OK that some other random file, maybe in
> > another process, is being linked to this mmap?
> =

> Good question, I have no idea. That's why I send out this mail.
> =

> > > > The background here is that DMA-buf allows device drivers to
> > > > export buffer which are then imported into another device
> > > > driver. The mmap() handler of the importing device driver then
> > > > find that the pgoff belongs to the exporting device and so
> > > > redirects the mmap() call there.
> > So the pgoff is some virtualized thing?
> =

> Yes, absolutely.

Maybe notch more context. Conceptually the buffer objects we use to manage
gpu memory are all stand-alone objects, internally refcounted and
everything. And if you export them as a dma-buf, then they are indeed
stand-alone file descriptors like any other.

But within the driver, we generally need thousands of these, and that
tends to bring fd exhaustion problems with it. That's why all the private
buffer objects which aren't shared with other process or other drivers are
handles only valid for a specific fd instance of the drm chardev (each
open gets their own namespace), and only for ioctls done on that chardev.
And for mmap we assign fake (but unique across all open fd on it) offsets
within the overall chardev. Hence all the pgoff mangling and re-mangling.

Now for unmap_mapping_range we'd like it to find all such fake offset
aliases pointing at the one underlying buffer object:
- mmap on the dma-buf fd, at offset 0
- mmap on the drm chardev where the buffer was originally allocated, at som=
e unique offset
- mmap on the drm chardev where the buffer was imported, again at some
  (likely) different unique (for that chardev) offset.

So to make unmap_mapping_range work across the entire delegation change
we'd actually need to change the vma->vma_file and pgoff twice:
- once when forwarding from the importing drm chardev to the dma-buf
- once when forwarding from the dma-buf to the exported drm chardev fake
  offset, which (mostly for historical reasons) is considered the
  canonical fake offset

We can't really do the delegation in userspace because:
- the importer might not have access to the exporters drm chardev, it only
  gets the dma-buf. If we'd give it the underlying drm chardev it could do
  stuff like issue rendering commands, breaking the access model.
- the dma-buf fd is only used to establish the sharing, once it's imported
  everywhere it generally gets closed. Userspace could re-export it and
  then call mmap on that, but feels a bit contrived.
- especially on SoC platforms this has already become uapi. It's not a big
  problem because the drivers that really need unmap_mapping_range to work
  are the big gpu drivers with discrete vram, where mappings need to be
  invalidate when moving buffer objects in/out of vram.

Hence why we'd like to be able to forward aliasing mappings and adjust the
file and pgoff, while hopefully everything keeps working. I thought this
would work, but Christian noticed it doesn't really.

Cheers, Daniel


> =

> Christian.
> =

> > =

> > Jason
> =


-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
