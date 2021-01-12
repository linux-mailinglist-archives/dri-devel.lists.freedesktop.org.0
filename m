Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C836F2F31AE
	for <lists+dri-devel@lfdr.de>; Tue, 12 Jan 2021 14:28:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 450486E217;
	Tue, 12 Jan 2021 13:28:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc2b.google.com (mail-oo1-xc2b.google.com
 [IPv6:2607:f8b0:4864:20::c2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8E226E217
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Jan 2021 13:28:16 +0000 (UTC)
Received: by mail-oo1-xc2b.google.com with SMTP id q6so579997ooo.8
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Jan 2021 05:28:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/5PClQYptOKzf4VGuYg6zpVPuHDySmC7+0H8PzNXzBk=;
 b=C11mfkBoxNn1MArI0Umb8nOkUtYdOxntZOXmnhseYbzmPd1+Beq9jgs/ZE4dUyW9Wy
 EBszhT9WOwiUvqu5UjpMPjCoIUnvX009RS4knk8Dc76w7NDI8tq1ViX8IT6w202QO9wA
 PDP9MvZL3ZssDHzqaEfuVOHw1KRw5KKKlWr40=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/5PClQYptOKzf4VGuYg6zpVPuHDySmC7+0H8PzNXzBk=;
 b=HjQOsRP/xEEDMAOlloFnjI7/nvR5bg795psAJZnSm8z6exEH3hyJ9ZlzdkP+LzlBmE
 FRBDObOLw9lz9BofKPCA/y8bao88w0vRTGqgulzLtW2YAY+M3a/Tf5/p0yLiBloJsYPn
 DYgk2S9/va7HGLIl2TtffspMKpo9QCBop6ZxkjsAfGz55Cfpd3MH5oecfpmwcrShIRsB
 X7gfAfeQOOa/OoV6QM622AxezK/5WwYehkLitGWIh/r3PViAG4KRY4xBvZJzenxp9fyQ
 EQuAk4ftsx0AIYmv+M2dxsh0bqg7w8ua0LJEliRd3jkuIIftswxV/nZGlKPGxahq9smF
 mE/A==
X-Gm-Message-State: AOAM5329lMBEqCFHUJnFiKQvYRWL/j7hTXnSppQnInUvHjv7GvKdvPcN
 TT8WHiyfGK5lJ/SM1hweDF+1FYa5quOO0kJy75wbJbMGb0zs6Q==
X-Google-Smtp-Source: ABdhPJyVQXbd3o888VMoH+BoaA1wz0JVD78ufYjTNXTQUKQEYRQd1kyAD91V/rdI3kY7T5DbkT7sXRCWoIshBiPnLQo=
X-Received: by 2002:a4a:9722:: with SMTP id u31mr2784698ooi.28.1610458095399; 
 Tue, 12 Jan 2021 05:28:15 -0800 (PST)
MIME-Version: 1.0
References: <20201127164131.2244124-1-daniel.vetter@ffwll.ch>
 <X/2jC9kBBQCfbC3d@phenom.ffwll.local>
In-Reply-To: <X/2jC9kBBQCfbC3d@phenom.ffwll.local>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Tue, 12 Jan 2021 14:28:03 +0100
Message-ID: <CAKMK7uH_H7EPo_5ZZ17xp+2Nc+ikRUY8Rm34np6t6Yt5VZCWzQ@mail.gmail.com>
Subject: Re: [PATCH v7 00/17] follow_pfn and other iomap races
To: DRI Development <dri-devel@lists.freedesktop.org>
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
 KVM list <kvm@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
 Linux MM <linux-mm@kvack.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jan 12, 2021 at 2:24 PM Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Fri, Nov 27, 2020 at 05:41:14PM +0100, Daniel Vetter wrote:
> > Hi all
> >
> > Another update of my patch series to clamp down a bunch of races and gaps
> > around follow_pfn and other access to iomem mmaps. Previous version:
> >
> > v1: https://lore.kernel.org/dri-devel/20201007164426.1812530-1-daniel.vetter@ffwll.ch/
> > v2: https://lore.kernel.org/dri-devel/20201009075934.3509076-1-daniel.vetter@ffwll.ch
> > v3: https://lore.kernel.org/dri-devel/20201021085655.1192025-1-daniel.vetter@ffwll.ch/
> > v4: https://lore.kernel.org/dri-devel/20201026105818.2585306-1-daniel.vetter@ffwll.ch/
> > v5: https://lore.kernel.org/dri-devel/20201030100815.2269-1-daniel.vetter@ffwll.ch/
> > v6: https://lore.kernel.org/dri-devel/20201119144146.1045202-1-daniel.vetter@ffwll.ch/
> >
> > And the discussion that sparked this journey:
> >
> > https://lore.kernel.org/dri-devel/20201007164426.1812530-1-daniel.vetter@ffwll.ch/
> >
> > I think the first 12 patches are ready for landing. The parts starting
> > with "mm: Add unsafe_follow_pfn" probably need more baking time.
> >
> > Andrew, can you please pick these up, or do you prefer I do a topic branch
> > and send them to Linus directly in the next merge window?
> >
> > Changes in v7:
> > - more acks/reviews
> > - reordered with the ready pieces at the front
> > - simplified the new follow_pfn function as Jason suggested
> >
> > Changes in v6:
> > - Tested v4l userptr as Tomasz suggested. No boom observed
> > - Added RFC for locking down follow_pfn, per discussion with Christoph and
> >   Jason.
> > - Explain why pup_fast is safe in relevant patches, there was a bit a
> >   confusion when discussing v5.
> > - Fix up the resource patch, with CONFIG_IO_STRICT_DEVMEM it crashed on
> >   boot due to an unintended change (reported by John)
> >
> > Changes in v5:
> > - Tomasz found some issues in the media patches
> > - Polish suggested by Christoph for the unsafe_follow_pfn patch
> >
> > Changes in v4:
> > - Drop the s390 patch, that was very stand-alone and now queued up to land
> >   through s390 trees.
> > - Comment polish per Dan's review.
> >
> > Changes in v3:
> > - Bunch of polish all over, no functional changes aside from one barrier
> >   in the resource code, for consistency.
> > - A few more r-b tags.
> >
> > Changes in v2:
> > - tons of small polish&fixes all over, thanks to all the reviewers who
> >   spotted issues
> > - I managed to test at least the generic_access_phys and pci mmap revoke
> >   stuff with a few gdb sessions using our i915 debug tools (hence now also
> >   the drm/i915 patch to properly request all the pci bar regions)
> > - reworked approach for the pci mmap revoke: Infrastructure moved into
> >   kernel/resource.c, address_space mapping is now set up at open time for
> >   everyone (which required some sysfs changes). Does indeed look a lot
> >   cleaner and a lot less invasive than I feared at first.
> >
> > Coments and review on the remaining bits very much welcome, especially
> > from the kvm and vfio side.
> >
> > Cheers, Daniel
> >
> > Daniel Vetter (17):
> >   drm/exynos: Stop using frame_vector helpers
> >   drm/exynos: Use FOLL_LONGTERM for g2d cmdlists
> >   misc/habana: Stop using frame_vector helpers
> >   misc/habana: Use FOLL_LONGTERM for userptr
> >   mm/frame-vector: Use FOLL_LONGTERM
> >   media: videobuf2: Move frame_vector into media subsystem
> >   mm: Close race in generic_access_phys
> >   PCI: Obey iomem restrictions for procfs mmap
> >   /dev/mem: Only set filp->f_mapping
> >   resource: Move devmem revoke code to resource framework
> >   sysfs: Support zapping of binary attr mmaps
> >   PCI: Revoke mappings like devmem
>
> As Jason suggested, I've pulled the first 1 patches into a topic branch.

Uh this was meant to read "first _12_ patches" ofc.
-Daniel

>
> Stephen, can you please add the below to linux-next for the 5.12 merge
> window?
>
> git://anongit.freedesktop.org/drm/drm topic/iomem-mmap-vs-gup
>
> Once this part has landed I'll see what to do with the below part.
>
> Thanks, Daniel
>
> >   mm: Add unsafe_follow_pfn
> >   media/videobuf1|2: Mark follow_pfn usage as unsafe
> >   vfio/type1: Mark follow_pfn as unsafe
> >   kvm: pass kvm argument to follow_pfn callsites
> >   mm: add mmu_notifier argument to follow_pfn
> >
> >  arch/powerpc/kvm/book3s_64_mmu_hv.c           |   2 +-
> >  arch/powerpc/kvm/book3s_64_mmu_radix.c        |   2 +-
> >  arch/powerpc/kvm/e500_mmu_host.c              |   2 +-
> >  arch/x86/kvm/mmu/mmu.c                        |   8 +-
> >  drivers/char/mem.c                            |  86 +-------------
> >  drivers/gpu/drm/exynos/Kconfig                |   1 -
> >  drivers/gpu/drm/exynos/exynos_drm_g2d.c       |  48 ++++----
> >  drivers/media/common/videobuf2/Kconfig        |   1 -
> >  drivers/media/common/videobuf2/Makefile       |   1 +
> >  .../media/common/videobuf2}/frame_vector.c    |  57 ++++-----
> >  .../media/common/videobuf2/videobuf2-memops.c |   3 +-
> >  drivers/media/platform/omap/Kconfig           |   1 -
> >  drivers/media/v4l2-core/videobuf-dma-contig.c |   2 +-
> >  drivers/misc/habanalabs/Kconfig               |   1 -
> >  drivers/misc/habanalabs/common/habanalabs.h   |   6 +-
> >  drivers/misc/habanalabs/common/memory.c       |  52 +++-----
> >  drivers/pci/pci-sysfs.c                       |   4 +
> >  drivers/pci/proc.c                            |   6 +
> >  drivers/vfio/vfio_iommu_type1.c               |   4 +-
> >  fs/sysfs/file.c                               |  11 ++
> >  include/linux/ioport.h                        |   6 +-
> >  include/linux/kvm_host.h                      |   9 +-
> >  include/linux/mm.h                            |  50 +-------
> >  include/linux/sysfs.h                         |   2 +
> >  include/media/frame_vector.h                  |  47 ++++++++
> >  include/media/videobuf2-core.h                |   1 +
> >  kernel/resource.c                             |  98 ++++++++++++++-
> >  mm/Kconfig                                    |   3 -
> >  mm/Makefile                                   |   1 -
> >  mm/memory.c                                   | 112 +++++++++++++++---
> >  mm/nommu.c                                    |  16 ++-
> >  security/Kconfig                              |  13 ++
> >  virt/kvm/kvm_main.c                           |  56 +++++----
> >  33 files changed, 413 insertions(+), 299 deletions(-)
> >  rename {mm => drivers/media/common/videobuf2}/frame_vector.c (84%)
> >  create mode 100644 include/media/frame_vector.h
> >
> > --
> > 2.29.2
> >
> > _______________________________________________
> > dri-devel mailing list
> > dri-devel@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/dri-devel
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch



-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
