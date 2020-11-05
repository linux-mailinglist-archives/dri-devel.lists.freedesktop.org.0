Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57DD02A7AA6
	for <lists+dri-devel@lfdr.de>; Thu,  5 Nov 2020 10:34:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95D726E9FD;
	Thu,  5 Nov 2020 09:34:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 164BD6E9FD
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Nov 2020 09:34:14 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id a65so536267wme.1
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Nov 2020 01:34:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=dhezt058VYAXUzsmT6wFAloMyt6Frs+cE6TCkSAcHPs=;
 b=ST87g3boTQObR5JxsvDJGIfMAlcgsXvr+F3JKuft7VsNKm+GuZmFkRWYBz/N9m+nP5
 gUOFOdjErnnQz3ZNReWuFokDdnl7uPc7ZMOj6kqNide21CEbt+Pus48kXLDRURvnNC2N
 3RAKhoWa6Hje1zG3vURpcraCOdJW7Q+XZ+t28=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=dhezt058VYAXUzsmT6wFAloMyt6Frs+cE6TCkSAcHPs=;
 b=bpamCdyOXqAbLEyVXvvzNlLIXt7E13ZmchSSrXWl+MW1utdsU85Cd2wlctWSXcJevf
 Z2Lq0FwOjuuT2CbDUaaRM7c69Jz9ZbgJfcXfE7SEFZzAtKbn8TA649Vc0en65MTKSkYU
 uBwQ/7WOXp6o8TOU7jteYsnX155NcPgCRANa+9wv5SDUll6OK2v2EbqEngB27SL4FGw9
 dLYcIZ0pkH2oyJHNDFiQYNFULKwUEtUs7llfQaXU6PCzs7BXKtIXArJo1gjE1VUW4+XF
 r8DolZHoI2DjlEoNOV29cukWrf6eMgPsh+kNwkmQFia4RdFqQFlle1/h2nLwAQa8jD1l
 0aSw==
X-Gm-Message-State: AOAM532+rcfFQJffkrkB2RTGjg8oVJQOZRpP+ZaSlK6cP8RZtCC6CA0+
 UvblCA5pkkQ/j1vSCHLN0uak9w==
X-Google-Smtp-Source: ABdhPJwBx2+thaZ4Z7KLrdw1GbhrDGTHyh3vgC78jGbXnmbFtcgLmot8B2SlqilS+tbAOr47w4H/Mg==
X-Received: by 2002:a1c:21c1:: with SMTP id h184mr1802586wmh.106.1604568852772; 
 Thu, 05 Nov 2020 01:34:12 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id s202sm1648809wme.39.2020.11.05.01.34.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Nov 2020 01:34:11 -0800 (PST)
Date: Thu, 5 Nov 2020 10:34:09 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Dan Williams <dan.j.williams@intel.com>
Subject: Re: [PATCH v5 11/15] PCI: Obey iomem restrictions for procfs mmap
Message-ID: <20201105093409.GR401619@phenom.ffwll.local>
Mail-Followup-To: Dan Williams <dan.j.williams@intel.com>,
 Bjorn Helgaas <helgaas@kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>, KVM list <kvm@vger.kernel.org>,
 Linux MM <linux-mm@kvack.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
 "Linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Kees Cook <keescook@chromium.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 John Hubbard <jhubbard@nvidia.com>,
 =?iso-8859-1?B?Suly9G1l?= Glisse <jglisse@redhat.com>,
 Jan Kara <jack@suse.cz>, Bjorn Helgaas <bhelgaas@google.com>,
 Linux PCI <linux-pci@vger.kernel.org>
References: <CAKMK7uF0QjesaNs97N-G8cZkXuAmFgcmTfHvoCP94br_WVcV6Q@mail.gmail.com>
 <20201104165017.GA352206@bjorn-Precision-5520>
 <CAPcyv4idORJzHVD2vCOnO3REqWHKVn_-otOzTBf0HhcWq4iJRQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAPcyv4idORJzHVD2vCOnO3REqWHKVn_-otOzTBf0HhcWq4iJRQ@mail.gmail.com>
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
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
 Jan Kara <jack@suse.cz>, Kees Cook <keescook@chromium.org>,
 KVM list <kvm@vger.kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Linux PCI <linux-pci@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Linux MM <linux-mm@kvack.org>,
 =?iso-8859-1?B?Suly9G1l?= Glisse <jglisse@redhat.com>,
 Bjorn Helgaas <helgaas@kernel.org>, John Hubbard <jhubbard@nvidia.com>,
 Bjorn Helgaas <bhelgaas@google.com>, Daniel Vetter <daniel.vetter@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 "Linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Nov 04, 2020 at 12:12:15PM -0800, Dan Williams wrote:
> On Wed, Nov 4, 2020 at 8:50 AM Bjorn Helgaas <helgaas@kernel.org> wrote:
> >
> > On Wed, Nov 04, 2020 at 09:44:04AM +0100, Daniel Vetter wrote:
> > > On Tue, Nov 3, 2020 at 11:09 PM Dan Williams <dan.j.williams@intel.com> wrote:
> > > > On Tue, Nov 3, 2020 at 1:28 PM Bjorn Helgaas <helgaas@kernel.org> wrote:
> > > > > On Fri, Oct 30, 2020 at 11:08:11AM +0100, Daniel Vetter wrote:
> > > > > > There's three ways to access PCI BARs from userspace: /dev/mem, sysfs
> > > > > > files, and the old proc interface. Two check against
> > > > > > iomem_is_exclusive, proc never did. And with CONFIG_IO_STRICT_DEVMEM,
> > > > > > this starts to matter, since we don't want random userspace having
> > > > > > access to PCI BARs while a driver is loaded and using it.
> > > > > >
> > > > > > Fix this by adding the same iomem_is_exclusive() check we already have
> > > > > > on the sysfs side in pci_mmap_resource().
> > > > > >
> > > > > > References: 90a545e98126 ("restrict /dev/mem to idle io memory ranges")
> > > > > > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > > > >
> > > > > This is OK with me but it looks like IORESOURCE_EXCLUSIVE is currently
> > > > > only used in a few places:
> > > > >
> > > > >   e1000_probe() calls pci_request_selected_regions_exclusive(),
> > > > >   ne_pci_probe() calls pci_request_regions_exclusive(),
> > > > >   vmbus_allocate_mmio() calls request_mem_region_exclusive()
> > > > >
> > > > > which raises the question of whether it's worth keeping
> > > > > IORESOURCE_EXCLUSIVE at all.  I'm totally fine with removing it
> > > > > completely.
> > > >
> > > > Now that CONFIG_IO_STRICT_DEVMEM upgrades IORESOURCE_BUSY to
> > > > IORESOURCE_EXCLUSIVE semantics the latter has lost its meaning so I'd
> > > > be in favor of removing it as well.
> > >
> > > Still has some value since it enforces exclusive access even if the
> > > config isn't enabled, and iirc e1000 had some fun with userspace tools
> > > clobbering the firmware and bricking the chip.
> >
> > There's *some* value; I'm just skeptical since only three drivers use
> > it.
> >
> > IORESOURCE_EXCLUSIVE is from e8de1481fd71 ("resource: allow MMIO
> > exclusivity for device drivers"), and the commit message says this is
> > only active when CONFIG_STRICT_DEVMEM is set.  I didn't check to see
> > whether that's still true.
> >
> > That commit adds a bunch of wrappers and "__"-prefixed functions to
> > pass the IORESOURCE_EXCLUSIVE flag around.  That's a fair bit of
> > uglification for three drivers.
> >
> > > Another thing I kinda wondered, since pci maintainer is here: At least
> > > in drivers/gpu I see very few drivers explicitly requestion regions
> > > (this might be a historical artifact due to the shadow attach stuff
> > > before we had real modesetting drivers). And pci core doesn't do that
> > > either, even when a driver is bound. Is this intentional, or
> > > should/could we do better? Since drivers work happily without
> > > reserving regions I don't think "the drivers need to remember to do
> > > this" will ever really work out well.
> >
> > You're right, many drivers don't call pci_request_regions().  Maybe we
> > could do better, but I haven't looked into that recently.  There is a
> > related note in Documentation/PCI/pci.rst that's been there for a long
> > time (it refers to "pci_request_resources()", which has never existed
> > AFAICT).  I'm certainly open to proposals.
> 
> It seems a bug that the kernel permits MMIO regions with side effects
> to be ioremap()'ed without request_mem_region() on the resource. I
> wonder how much log spam would happen if ioremap() reported whenever a
> non-IORESOURE_BUSY range was passed to it? The current state of
> affairs to trust *remap users to have claimed their remap target seems
> too ingrained to unwind now.

Yeah I think that's hopeless. I think the only feasible approach is if bus
drivers claim resources by default when a driver is bound (it should nest,
so if the driver claims again, I think that should all keep working), just
using the driver name. Probably with some special casing for legacy io
(vgaarb.c should claim these I guess). Still probably tons of fallout.

Once that's rolled out to all bus drivers we could perhaps add the ioremap
check without drowning in log spam. Still a multi-year project I think :-/
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
