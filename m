Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA7792A5FC8
	for <lists+dri-devel@lfdr.de>; Wed,  4 Nov 2020 09:44:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77FB589E26;
	Wed,  4 Nov 2020 08:44:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com
 [IPv6:2607:f8b0:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAFD889E26
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Nov 2020 08:44:15 +0000 (UTC)
Received: by mail-oi1-x244.google.com with SMTP id 9so21395613oir.5
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Nov 2020 00:44:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ycqoIkcF9lPtiJBVMgjq7zwCX8Gyu6JCtVXT12jKTV8=;
 b=SO6a9eIH6r+EzFThZ6MTARjwHEtx6LFHOpOvFgwKmnw7LjZXHcgycyhZfUmdSwXoni
 9VPCbgc6ODqmZSPJVN4eXwn3IqpRr3uXKNjrMKGfBOBHLutZLHhso+mS3OiPqxM7Q6/l
 K5a5NNqZWoxju2yJSN+OURI61y0XID3dk0Roo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ycqoIkcF9lPtiJBVMgjq7zwCX8Gyu6JCtVXT12jKTV8=;
 b=dGanibfMB/qAO+TBMPtC2ZEIXPvLS71CgRCRMXSL9ulVs+/V9SZTq2pIauD5K9VbSD
 mr0zxr4Gj3y0xpaRMM2ICwpxGr4C0mo8BX0sAOG+iAdMIIs60ffer7qrrLzxvIC2QBY0
 k43JfW7L/leeT8ngTAWv9WaxwF+tUqfrOnJAaFPWXsKxJ1jqKNqNm+dSb10HBo390wtP
 uJ/kkKLPghSllvjZUUcUMmcdn9Q1cnDW8O7yAxyfIO2bh42xMZLF/OJ6V/PyDqyiLRZY
 GY3JQC6R02SE1VjlBHRmFmoHzK7nnJbJiyBhKUBB79e5aE38bgAT98ueXvOkZ70PritL
 Yjsw==
X-Gm-Message-State: AOAM531g1/XGx7A9JDLLs11Fbor33cf4g2n71xeAb2soJ8cfqmylqGzK
 TpjgMysaMsK2UnvW6pDDlZpJxyVhfWt9eIwPGCjiNTN+eeDFag==
X-Google-Smtp-Source: ABdhPJzFeuCQlV5NJZ+3HUxdvXgtCAFGX/0rEF7qnn1uI6qUI3Z5/MsHqFAcH2CxUPAQE20CBPAAF7SeJ5phPHzYaRc=
X-Received: by 2002:aca:b141:: with SMTP id a62mr1813813oif.101.1604479455139; 
 Wed, 04 Nov 2020 00:44:15 -0800 (PST)
MIME-Version: 1.0
References: <20201030100815.2269-12-daniel.vetter@ffwll.ch>
 <20201103212840.GA266427@bjorn-Precision-5520>
 <CAPcyv4jCGxWG0opLv4VzBRk5iLwu6CRse4DwF-otWkfXoGWe6A@mail.gmail.com>
In-Reply-To: <CAPcyv4jCGxWG0opLv4VzBRk5iLwu6CRse4DwF-otWkfXoGWe6A@mail.gmail.com>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Wed, 4 Nov 2020 09:44:04 +0100
Message-ID: <CAKMK7uF0QjesaNs97N-G8cZkXuAmFgcmTfHvoCP94br_WVcV6Q@mail.gmail.com>
Subject: Re: [PATCH v5 11/15] PCI: Obey iomem restrictions for procfs mmap
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
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
 Jan Kara <jack@suse.cz>, Kees Cook <keescook@chromium.org>,
 KVM list <kvm@vger.kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 John Hubbard <jhubbard@nvidia.com>, LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Linux MM <linux-mm@kvack.org>,
 =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 Bjorn Helgaas <helgaas@kernel.org>, Linux PCI <linux-pci@vger.kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>, Daniel Vetter <daniel.vetter@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 "Linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Nov 3, 2020 at 11:09 PM Dan Williams <dan.j.williams@intel.com> wrote:
> On Tue, Nov 3, 2020 at 1:28 PM Bjorn Helgaas <helgaas@kernel.org> wrote:
> > On Fri, Oct 30, 2020 at 11:08:11AM +0100, Daniel Vetter wrote:
> > > There's three ways to access PCI BARs from userspace: /dev/mem, sysfs
> > > files, and the old proc interface. Two check against
> > > iomem_is_exclusive, proc never did. And with CONFIG_IO_STRICT_DEVMEM,
> > > this starts to matter, since we don't want random userspace having
> > > access to PCI BARs while a driver is loaded and using it.
> > >
> > > Fix this by adding the same iomem_is_exclusive() check we already have
> > > on the sysfs side in pci_mmap_resource().
> > >
> > > References: 90a545e98126 ("restrict /dev/mem to idle io memory ranges")
> > > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> >
> > This is OK with me but it looks like IORESOURCE_EXCLUSIVE is currently
> > only used in a few places:
> >
> >   e1000_probe() calls pci_request_selected_regions_exclusive(),
> >   ne_pci_probe() calls pci_request_regions_exclusive(),
> >   vmbus_allocate_mmio() calls request_mem_region_exclusive()
> >
> > which raises the question of whether it's worth keeping
> > IORESOURCE_EXCLUSIVE at all.  I'm totally fine with removing it
> > completely.
>
> Now that CONFIG_IO_STRICT_DEVMEM upgrades IORESOURCE_BUSY to
> IORESOURCE_EXCLUSIVE semantics the latter has lost its meaning so I'd
> be in favor of removing it as well.

Still has some value since it enforces exclusive access even if the
config isn't enabled, and iirc e1000 had some fun with userspace tools
clobbering the firmware and bricking the chip.

Another thing I kinda wondered, since pci maintainer is here: At least
in drivers/gpu I see very few drivers explicitly requestion regions
(this might be a historical artifact due to the shadow attach stuff
before we had real modesetting drivers). And pci core doesn't do that
either, even when a driver is bound. Is this intentional, or
should/could we do better? Since drivers work happily without
reserving regions I don't think "the drivers need to remember to do
this" will ever really work out well.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
