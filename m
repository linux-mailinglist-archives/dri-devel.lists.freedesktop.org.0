Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 387DB286AE2
	for <lists+dri-devel@lfdr.de>; Thu,  8 Oct 2020 00:29:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDE8E6E9BA;
	Wed,  7 Oct 2020 22:29:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C84716E9BA
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Oct 2020 22:29:33 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id b12so3819379edz.11
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Oct 2020 15:29:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CTESbqWcckMo/4i92TzIl4y3TmAuiek3Eq/3qJ27aVE=;
 b=C9Ia3VCKylLvch2Mm4CFE1Tgnfv5R+vpt+Gkie2pCUYaMg+MkmANBvB5fv/6gLxHxE
 bqKJ+r7mFS4NA8UmxE4KYJZ33h0CYTX0aZwWDh5/vd1BekkHTnqpnKypSF28zWn4K8H0
 LKnkgKM1Z6rkuZBOAzYfh5nH/xOSDZ3VaVqsFGiTKhdbNpRTH5LDgJn++bCaD2RQJ9I2
 b/yb82cHyyvSeJ6CHCNH7JIYmVCxoXypsBHBMmGij+CrG19A8lbexSM+QLvs1Sqc47pm
 mzhEavRU8o1d5Wa2DTKdErhBCi8bj8r7+t/oYkUYIZbU0ZApbdX2cmoy5guFURB/fOut
 NK3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CTESbqWcckMo/4i92TzIl4y3TmAuiek3Eq/3qJ27aVE=;
 b=F3C9hGQhrEsmH/AgnUcDPqHphU+UJ3m+GKgXW/qxHH+PmA5gzjJfQpGg7SKASfvdes
 LEfa2C3v8lGgmnHLr4HWjIEtuLOtHzWnH/dpCgQ0u6N/KYDl4fiVDs69SwRpW3WIFtiz
 UfovHCKzuPMvCqfh2+czHfJvJ/yoB6Il9RQRhhN+kdGOsBM7WtWzd6dgcBGnn9EWQDJj
 ZBTUmI+JBxachJT23KGQq0dqddE8R7iDLaCUIgGUI+xhkqoBZ2w+2oLxZ8GeJo6m3W6G
 P9muaOJWOLAVegzKnGfPhATDtrgml6uW8Plh8jSP1uwWaRxKGcL3W0gNrO5RBT8n+X5d
 Nk+g==
X-Gm-Message-State: AOAM531n1/NgUsTE5ixyW64RVAdy/tcfuqWq9PSVpeNFse9jh9+3wDda
 UizL36BRMLL9N48wGkLqTNhFMqqnrRTaPCXfioT5jw==
X-Google-Smtp-Source: ABdhPJz1RyJuGe8nKXGB7ItsvvZPLSvoGDx42NmD5N6TVh8ahpXgSpJt+qJCvPDzRQV+I/1aLUWOgK4iRugm3Y5SJFU=
X-Received: by 2002:a50:9ea6:: with SMTP id a35mr6269472edf.52.1602109772370; 
 Wed, 07 Oct 2020 15:29:32 -0700 (PDT)
MIME-Version: 1.0
References: <20201007164426.1812530-1-daniel.vetter@ffwll.ch>
 <20201007164426.1812530-11-daniel.vetter@ffwll.ch>
 <CAPcyv4hBL68A7CZa+YnooufDH2tevoxrx32DTJMQ6OHRnec7QQ@mail.gmail.com>
 <CAKMK7uFoxiPdjO-yhd-mKqumnTpjcENEReb1sOYhOwRRCL0wpQ@mail.gmail.com>
 <CAPcyv4jGxsB5so8mKqYrsn2CEc7nO2yPvzZZ_mvM_-R=BZfKHg@mail.gmail.com>
In-Reply-To: <CAPcyv4jGxsB5so8mKqYrsn2CEc7nO2yPvzZZ_mvM_-R=BZfKHg@mail.gmail.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Wed, 7 Oct 2020 15:29:21 -0700
Message-ID: <CAPcyv4iN1q0LUVTO6igMKPe-8hnR5ULF+mBnWy6bdXfY2M6YmA@mail.gmail.com>
Subject: Re: [PATCH 10/13] PCI: revoke mappings like devmem
To: Daniel Vetter <daniel.vetter@ffwll.ch>
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

On Wed, Oct 7, 2020 at 3:23 PM Dan Williams <dan.j.williams@intel.com> wrote:
>
> On Wed, Oct 7, 2020 at 12:49 PM Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
> >
> > On Wed, Oct 7, 2020 at 9:33 PM Dan Williams <dan.j.williams@intel.com> wrote:
> > >
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
> > But then I need to find the right one, plus I also need to find the
> > right one for the procfs side. That gets messy, and I already have no
> > idea how to really test this. Shared address_space is the same trick
> > we're using in drm (where we have multiple things all pointing to the
> > same underlying resources, through different files), and it gets the
> > job done. So that's why I figured the shared address_space is the
> > cleaner solution since then unmap_mapping_range takes care of
> > iterating over all vma for us. I guess I could reimplement that logic
> > with our own locking and everything in revoke_devmem, but feels a bit
> > silly. But it would also solve the problem of having mutliple
> > different mknod of /dev/kmem with different address_space behind them.
> > Also because of how remap_pfn_range works, all these vma do use the
> > same pgoff already anyway.
>
> True, remap_pfn_range() makes sure that ->pgoff is an absolute
> physical address offset for all use cases. So you might be able to
> just point proc_bus_pci_open() at the shared devmem address space. For
> sysfs it's messier. I think you would need to somehow get the inode
> from kernfs_fop_open() to adjust its address space, but only if the
> bin_file will ultimately be used for PCI memory.

To me this seems like a new sysfs_create_bin_file() flavor that
registers the file with the common devmem address_space.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
