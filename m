Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F313286F79
	for <lists+dri-devel@lfdr.de>; Thu,  8 Oct 2020 09:31:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED6D26EA45;
	Thu,  8 Oct 2020 07:31:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com
 [IPv6:2607:f8b0:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAC0E6EA3C
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Oct 2020 07:31:50 +0000 (UTC)
Received: by mail-oi1-x241.google.com with SMTP id 16so5327430oix.9
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Oct 2020 00:31:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ogkw1NmOSWleETzvxYwVZZIizSINMS0qQkiw0aowwRQ=;
 b=dAa4UrodoeKqvvGBic2n/ikfUtGXIrA84JDvhHoeTG0wQyvzwM6zRb58ASAp90bOAP
 Z0Gq9W2/rAIbo9tt/Rdw3PX+Bn1vOefBbbpajIIFIeMsYr0JsELM1frkf/Q6RzY+4q6w
 KwDjwJvmHbSV+DyPoGD+FRH2axWgRzr70NSco=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ogkw1NmOSWleETzvxYwVZZIizSINMS0qQkiw0aowwRQ=;
 b=VIPCmIaBsW31a5xmyYDFkL6q8QSKMLNSqlBG9mdR4LYGF4jD3cdv49LGBpxIPSPxvq
 1VZq8xF7I6gr+b/ZtQWbw8rEWjRQ7eCaJXPe/cNnMc9ql0XI4QCNBhG91X5/ifYeE/Tc
 4LObYT/EDsNmASSJEYVleXN8buWA9tI4j7ROwrGmiK6uL7jPFS0dW85AaYA7UjNEWKRo
 zdeLGn8capXHGAejxT4oQFN5XAh3JGFBMMguSaWopjmsW//Ys4HLfYmmWH92t3L75IAb
 0ejqXAOTP7nDCZdLsHzyuyTDbCpe8I1CvmrAILjukb2R9MO3zeJn19zItRka3mri43W9
 ZX0g==
X-Gm-Message-State: AOAM530zC2ehyfHmfVoBME1jcvNMbgLKY8aNOWnPK52rJj0Wqkn2H+Ih
 t3Cbe1QiuhEOoTeikH4+Jz5h19jQPk6bvJvo4hoLGg==
X-Google-Smtp-Source: ABdhPJx491RwkFJI9puzs4morldhkHhy8TQN885mw0wtSqvJNbvAlJbcViFwT+IWX3hheU/oD67HmER0Hab3kMQkGCo=
X-Received: by 2002:aca:6083:: with SMTP id u125mr4379406oib.14.1602142309051; 
 Thu, 08 Oct 2020 00:31:49 -0700 (PDT)
MIME-Version: 1.0
References: <20201007164426.1812530-1-daniel.vetter@ffwll.ch>
 <20201007164426.1812530-11-daniel.vetter@ffwll.ch>
 <CAPcyv4hBL68A7CZa+YnooufDH2tevoxrx32DTJMQ6OHRnec7QQ@mail.gmail.com>
 <20201007232448.GC5177@ziepe.ca>
In-Reply-To: <20201007232448.GC5177@ziepe.ca>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Thu, 8 Oct 2020 09:31:37 +0200
Message-ID: <CAKMK7uF6pdQScwcihBq+9BZ7bSrNXimi-ddN8w7zg2ANhSduWw@mail.gmail.com>
Subject: Re: [PATCH 10/13] PCI: revoke mappings like devmem
To: Jason Gunthorpe <jgg@ziepe.ca>
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
Cc: linux-s390 <linux-s390@vger.kernel.org>,
 linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Jan Kara <jack@suse.cz>,
 Kees Cook <keescook@chromium.org>, KVM list <kvm@vger.kernel.org>,
 John Hubbard <jhubbard@nvidia.com>, LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Linux MM <linux-mm@kvack.org>,
 =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 Linux PCI <linux-pci@vger.kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 "Linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Oct 8, 2020 at 1:24 AM Jason Gunthorpe <jgg@ziepe.ca> wrote:
>
> On Wed, Oct 07, 2020 at 12:33:06PM -0700, Dan Williams wrote:
> > On Wed, Oct 7, 2020 at 11:11 AM Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
> > >
> > > Since 3234ac664a87 ("/dev/mem: Revoke mappings when a driver claims
> > > the region") /dev/kmem zaps ptes when the kernel requests exclusive
> > > acccess to an iomem region. And with CONFIG_IO_STRICT_DEVMEM, this is
> > > the default for all driver uses.
> > >
> > > Except there's two more ways to access pci bars: sysfs and proc mmap
> > > support. Let's plug that hole.
> >
> > Ooh, yes, lets.
> >
> > >
> > > For revoke_devmem() to work we need to link our vma into the same
> > > address_space, with consistent vma->vm_pgoff. ->pgoff is already
> > > adjusted, because that's how (io_)remap_pfn_range works, but for the
> > > mapping we need to adjust vma->vm_file->f_mapping. Usually that's done
> > > at ->open time, but that's a bit tricky here with all the entry points
> > > and arch code. So instead create a fake file and adjust vma->vm_file.
> >
> > I don't think you want to share the devmem inode for this, this should
> > be based off the sysfs inode which I believe there is already only one
> > instance per resource. In contrast /dev/mem can have multiple inodes
> > because anyone can just mknod a new character device file, the same
> > problem does not exist for sysfs.
>
> The inode does not come from the filesystem char/mem.c creates a
> singular anon inode in devmem_init_inode()
>
> Seems OK to use this more widely, but it feels a bit weird to live in
> char/memory.c.
>
> This is what got me thinking maybe this needs to be a bit bigger
> generic infrastructure - eg enter this scheme from fops mmap and
> everything else is in mm/user_iomem.c

Yeah moving it to iomem and renaming it to have an iomem_prefix
instead of devmem sounds like a good idea.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
