Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 482F0286837
	for <lists+dri-devel@lfdr.de>; Wed,  7 Oct 2020 21:25:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7A5D6E995;
	Wed,  7 Oct 2020 19:25:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com
 [IPv6:2607:f8b0:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFB506E995
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Oct 2020 19:25:02 +0000 (UTC)
Received: by mail-oi1-x242.google.com with SMTP id 16so3657023oix.9
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Oct 2020 12:25:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BZRP/YEUZ8RoSb8Ypgb3DGxVhdoAtHRN1N0p0L0pWpA=;
 b=IfegH4nwN/o6kcQDvfu01nenDUeNQgBkda4/dhczUdP0kMFXcvE572DUDzf1wvqGpa
 nyp1a/D73Mflnvnu40XfTC32OrNKnzCHp2mvGEYcnzK1KJ6+dezHuXb9vC5VNmLGIhTb
 kwAV9e9OpEVj4sQ6ggzRYYm32tqaPtdzoptpI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BZRP/YEUZ8RoSb8Ypgb3DGxVhdoAtHRN1N0p0L0pWpA=;
 b=jJmZJvYY8bvA8GgLwca+DpbmwNaaWqlqCKbe3848IsJYOqjEqYJaaNsl0uMGp5KSi9
 E7UBkJd9D8BIAimHizz0sRk0yzgVpX4Go4l6UZys9EWwdgH/JP/gEGYry7w508Qfuxke
 d92u9ZAtmpJcGALNlzls5apFPwbYjSzGyjG73hsCGqiZlj5rvwESS/bMwxz6SwtXNC0k
 gmrtUImo6PDys3Pu+MMcA8oiTm1vpiFGMV3pG6IiPwq/ouX3cmVNcQjuCnoNvQgaS+Js
 sViS9QUUyIIaAjAaBNZbwuAhOJxkoPH0s6ae8xn4Yr1Ow8vpvOFLEwVVQMSY25N/xqAp
 vPWQ==
X-Gm-Message-State: AOAM531ZnnrBYN9I+n5sMF2RHgo1NJXKeD2sVQY9Q9aIsUdKegiWRWNs
 JNZyXxpWzBaMc7J20Z9ySaPJuD6+Xxw8NokjP/fEyg==
X-Google-Smtp-Source: ABdhPJzhvBCanKpF9yHYf4rPvV3OgJoXcQ8bSZqPwzVGdWv0uBGdiJso5tL8awsEi+dW1GpdYavbUXQPpc/1p2uOTug=
X-Received: by 2002:aca:6083:: with SMTP id u125mr2929990oib.14.1602098701967; 
 Wed, 07 Oct 2020 12:25:01 -0700 (PDT)
MIME-Version: 1.0
References: <20201007164426.1812530-11-daniel.vetter@ffwll.ch>
 <20201007184131.GA3259154@bjorn-Precision-5520>
In-Reply-To: <20201007184131.GA3259154@bjorn-Precision-5520>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Wed, 7 Oct 2020 21:24:49 +0200
Message-ID: <CAKMK7uEi-PaoP2mSgg-aub49gctjTbwW6-X4nuRLnv1uzTh9dQ@mail.gmail.com>
Subject: Re: [PATCH 10/13] PCI: revoke mappings like devmem
To: Bjorn Helgaas <helgaas@kernel.org>
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
Cc: linux-s390@vger.kernel.org,
 linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Jan Kara <jack@suse.cz>,
 Kees Cook <keescook@chromium.org>, kvm@vger.kernel.org,
 Jason Gunthorpe <jgg@ziepe.ca>, John Hubbard <jhubbard@nvidia.com>,
 LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Linux MM <linux-mm@kvack.org>,
 =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 Linux PCI <linux-pci@vger.kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Oct 7, 2020 at 8:41 PM Bjorn Helgaas <helgaas@kernel.org> wrote:
>
> Capitalize subject, like other patches in this series and previous
> drivers/pci history.
>
> On Wed, Oct 07, 2020 at 06:44:23PM +0200, Daniel Vetter wrote:
> > Since 3234ac664a87 ("/dev/mem: Revoke mappings when a driver claims
> > the region") /dev/kmem zaps ptes when the kernel requests exclusive
> > acccess to an iomem region. And with CONFIG_IO_STRICT_DEVMEM, this is
> > the default for all driver uses.
> >
> > Except there's two more ways to access pci bars: sysfs and proc mmap
> > support. Let's plug that hole.
>
> s/pci/PCI/ in commit logs and comments.
>
> > For revoke_devmem() to work we need to link our vma into the same
> > address_space, with consistent vma->vm_pgoff. ->pgoff is already
> > adjusted, because that's how (io_)remap_pfn_range works, but for the
> > mapping we need to adjust vma->vm_file->f_mapping. Usually that's done
> > at ->open time, but that's a bit tricky here with all the entry points
> > and arch code. So instead create a fake file and adjust vma->vm_file.
> >
> > Note this only works for ARCH_GENERIC_PCI_MMAP_RESOURCE. But that
> > seems to be a subset of architectures support STRICT_DEVMEM, so we
> > should be good.
> >
> > The only difference in access checks left is that sysfs pci mmap does
> > not check for CAP_RAWIO. But I think that makes some sense compared to
> > /dev/mem and proc, where one file gives you access to everything and
> > no ownership applies.
>
> > --- a/drivers/char/mem.c
> > +++ b/drivers/char/mem.c
> > @@ -810,6 +810,7 @@ static loff_t memory_lseek(struct file *file, loff_t offset, int orig)
> >  }
> >
> >  static struct inode *devmem_inode;
> > +static struct vfsmount *devmem_vfs_mount;
> >
> >  #ifdef CONFIG_IO_STRICT_DEVMEM
> >  void revoke_devmem(struct resource *res)
> > @@ -843,6 +844,20 @@ void revoke_devmem(struct resource *res)
> >
> >       unmap_mapping_range(inode->i_mapping, res->start, resource_size(res), 1);
> >  }
> > +
> > +struct file *devmem_getfile(void)
> > +{
> > +     struct file *file;
> > +
> > +     file = alloc_file_pseudo(devmem_inode, devmem_vfs_mount, "devmem",
> > +                              O_RDWR, &kmem_fops);
> > +     if (IS_ERR(file))
> > +             return NULL;
> > +
> > +     file->f_mapping = devmem_indoe->i_mapping;
>
> "devmem_indoe"?  Obviously not compiled, I guess?

Yeah apologies, I forgot to compile this with CONFIG_IO_STRICT_DEVMEM
set. The entire series is more rfc about the overall problem really, I
need to also figure out how to even this this somehow. I guess there's
nothing really ready made here?
-Daniel

> > --- a/include/linux/ioport.h
> > +++ b/include/linux/ioport.h
> > @@ -304,8 +304,10 @@ struct resource *request_free_mem_region(struct resource *base,
> >
> >  #ifdef CONFIG_IO_STRICT_DEVMEM
> >  void revoke_devmem(struct resource *res);
> > +struct file *devm_getfile(void);
> >  #else
> >  static inline void revoke_devmem(struct resource *res) { };
> > +static inline struct file *devmem_getfile(void) { return NULL; };
>
> I guess these names are supposed to match?
>
> >  #endif
> >
> >  #endif /* __ASSEMBLY__ */
> > --
> > 2.28.0
> >



-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
