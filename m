Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3507528708B
	for <lists+dri-devel@lfdr.de>; Thu,  8 Oct 2020 10:13:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A80E6EA46;
	Thu,  8 Oct 2020 08:13:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com
 [IPv6:2607:f8b0:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5386B6EA46
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Oct 2020 08:13:18 +0000 (UTC)
Received: by mail-ot1-x341.google.com with SMTP id l4so4734345ota.7
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Oct 2020 01:13:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6GE5pSnNRg0KlyvewB9QKOrrd6/Nut8BwJvyodyZJd4=;
 b=hMW7zxgBaxDt7Z8CMDWn3cCXSOY5QqOrFQ/uoN1baUlAIhOFYy+4SzujzZvv4Ur9FN
 onPuYsY03fgo4HL/In06Uiy/3ynGYwzwiQV3wfZ6whnso50XlzhHTRy/QZJCTuip3uEr
 ueKV+xdznXeh2dJB78HPK0Klt6lkMJnLUSyGA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6GE5pSnNRg0KlyvewB9QKOrrd6/Nut8BwJvyodyZJd4=;
 b=oW8SWcsSPzAH4vh6d3QnvdVF0y66JIFXEW3dwON3H/Okk7hmPi2HSZHH8/4C7u46ZV
 vvnyCIb3lB95Op9yAHWy8CzI0vTjfPwx/R3I/DgsnjwRVIkiW3y6LSpuDMLK3cY9Ar8F
 8UJsFM1e5+GudzCC1eTzlbeGOYgw1vVMWz9G1Kr3evIag2VhHIIj+Xjds8lXhzjdI24f
 6jeOvRlbjwUCn5oAC7sA5sbrBw7eQRC6LI29lq5sgyQnyDCgjgC2qnONojpGfYpnkekv
 n0XZz3bIfwUOBuL/SfBq3xYj7oGOCSoXUUaMVkPJ8SG6nV6g+5+PuQsF9Y6MhZqITDq9
 0u5Q==
X-Gm-Message-State: AOAM532s0DSDQZ+SanA76aPwnAy9pb0mjj8hQGRvm9kEuC0JtXM/DAHQ
 1B9WXMcM0nTG16Zz5uV5hOESi7BgeGUZsfOdMsRf4A==
X-Google-Smtp-Source: ABdhPJzi+1LyDtM+RDWyhibTLQ/9o198dN3ibfXFnaztfI6BQhE6ckMA8Uych0T6Rb8ANf5SnQ1gmeZGjO89xISEbKU=
X-Received: by 2002:a05:6830:1647:: with SMTP id
 h7mr4572127otr.281.1602144797647; 
 Thu, 08 Oct 2020 01:13:17 -0700 (PDT)
MIME-Version: 1.0
References: <20201007164426.1812530-1-daniel.vetter@ffwll.ch>
 <20201007164426.1812530-11-daniel.vetter@ffwll.ch>
 <CAPcyv4hBL68A7CZa+YnooufDH2tevoxrx32DTJMQ6OHRnec7QQ@mail.gmail.com>
 <20201007232448.GC5177@ziepe.ca>
 <CAPcyv4jA9fe40r_2SfrCtOaeE85V88TA3NNQZOmQMNj=MdsPyw@mail.gmail.com>
In-Reply-To: <CAPcyv4jA9fe40r_2SfrCtOaeE85V88TA3NNQZOmQMNj=MdsPyw@mail.gmail.com>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Thu, 8 Oct 2020 10:13:06 +0200
Message-ID: <CAKMK7uHg48-fTR1L78p7q5vxD=Kgr_fBEj1pDLaYeuvTGSSFig@mail.gmail.com>
Subject: Re: [PATCH 10/13] PCI: revoke mappings like devmem
To: Dan Williams <dan.j.williams@intel.com>
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
 Jason Gunthorpe <jgg@ziepe.ca>, John Hubbard <jhubbard@nvidia.com>,
 LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Linux MM <linux-mm@kvack.org>,
 =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 Linux PCI <linux-pci@vger.kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 "Linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Oct 8, 2020 at 9:50 AM Dan Williams <dan.j.williams@intel.com> wrote:
>
> On Wed, Oct 7, 2020 at 4:25 PM Jason Gunthorpe <jgg@ziepe.ca> wrote:
> >
> > On Wed, Oct 07, 2020 at 12:33:06PM -0700, Dan Williams wrote:
> > > On Wed, Oct 7, 2020 at 11:11 AM Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
> > > >
> > > > Since 3234ac664a87 ("/dev/mem: Revoke mappings when a driver claims
> > > > the region") /dev/kmem zaps ptes when the kernel requests exclusive
> > > > acccess to an iomem region. And with CONFIG_IO_STRICT_DEVMEM, this is
> > > > the default for all driver uses.
> > > >
> > > > Except there's two more ways to access pci bars: sysfs and proc mmap
> > > > support. Let's plug that hole.
> > >
> > > Ooh, yes, lets.
> > >
> > > >
> > > > For revoke_devmem() to work we need to link our vma into the same
> > > > address_space, with consistent vma->vm_pgoff. ->pgoff is already
> > > > adjusted, because that's how (io_)remap_pfn_range works, but for the
> > > > mapping we need to adjust vma->vm_file->f_mapping. Usually that's done
> > > > at ->open time, but that's a bit tricky here with all the entry points
> > > > and arch code. So instead create a fake file and adjust vma->vm_file.
> > >
> > > I don't think you want to share the devmem inode for this, this should
> > > be based off the sysfs inode which I believe there is already only one
> > > instance per resource. In contrast /dev/mem can have multiple inodes
> > > because anyone can just mknod a new character device file, the same
> > > problem does not exist for sysfs.
> >
> > The inode does not come from the filesystem char/mem.c creates a
> > singular anon inode in devmem_init_inode()
>
> That's not quite right, An inode does come from the filesystem I just
> arranged for that inode's i_mapping to be set to a common instance.
>
> > Seems OK to use this more widely, but it feels a bit weird to live in
> > char/memory.c.
>
> Sure, now that more users have arrived it should move somewhere common.
>
> > This is what got me thinking maybe this needs to be a bit bigger
> > generic infrastructure - eg enter this scheme from fops mmap and
> > everything else is in mm/user_iomem.c
>
> It still requires every file that can map physical memory to have its
> ->open fop do
>
>        inode->i_mapping = devmem_inode->i_mapping;
>        filp->f_mapping = inode->i_mapping;
>
> I don't see how you can centralize that part.

btw, why are you setting inode->i_mapping? The inode is already
published, changing that looks risky. And I don't think it's needed,
vma_link() only looks at filp->f_mapping, and in our drm_open() we
only set that one.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
