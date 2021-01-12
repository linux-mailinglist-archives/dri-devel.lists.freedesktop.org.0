Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43D092F3134
	for <lists+dri-devel@lfdr.de>; Tue, 12 Jan 2021 14:24:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA9506E21B;
	Tue, 12 Jan 2021 13:24:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34CA16E21B
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Jan 2021 13:24:32 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id r3so2511585wrt.2
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Jan 2021 05:24:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=910ykGfQR9OTgKA6vCFnMHYhpzuWplH/2cTJtmBp2T4=;
 b=Ah/l+t33mmwDIGlBMFIZyKuV7qXcm9eDb12vI6vVfsUrYpUJ7a/uEpTRS1f5aK+cO/
 8eTGjuY/8GejCUk9XV0+gzotIvf8wR0G3lKhCLzwFKOPdosHO0Jg3sgDrr8NM9lhj4hZ
 DSlEwKVk7hsiyQHBm7B7rTp5gH6qDqjI1EK1k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=910ykGfQR9OTgKA6vCFnMHYhpzuWplH/2cTJtmBp2T4=;
 b=TpRw2ttV/NcpZ1mhbh+AJ5lGCHTdbdeCdH1twKDnDTBB65VKy80Go1dbgeYq4xZrJw
 BI11H8YdyYNRvb14v3nW9bsCKFGyzu1n8V2nIkctNbkJxq2W7i5u14QvoYPHG6IN7ySO
 8oXpy9GMzZJ+8lQ2KgMJ5uDBPx1y63GjEKNPXveJkHGt9VgeMsWg5twmka94ETuTDr6c
 2qPGyyKViaNYxukajQTRs3WQw6WENR5BT94BTb7FcZfYTJo7IasU3hpqcYw4pqcRSc5P
 9QdrGrgBKtu04RyiETKHBB6n8ajQd4tCyGz7agc2sPzOzC8rDzkucH8dVT4h7gKbFg3b
 Z+Ow==
X-Gm-Message-State: AOAM530Tg+Mf/Q+OoUGSFm3I5p/P67lg2Tkbvj0mawGs3/mO3S2y5U5b
 TNpen1klqlAl5k9sQrVBjF8RHOHCdThMQFTJ
X-Google-Smtp-Source: ABdhPJwktpfadpAuorK6LF+XqkHpBN5jTG/nc1ar3yG4HE88ZwI4eoXbc58CgFkM+yHvg3W2YwpYrg==
X-Received: by 2002:adf:ab5b:: with SMTP id r27mr1161193wrc.282.1610457870643; 
 Tue, 12 Jan 2021 05:24:30 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id j2sm5098461wrh.78.2021.01.12.05.24.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 05:24:29 -0800 (PST)
Date: Tue, 12 Jan 2021 14:24:27 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [PATCH v7 00/17] follow_pfn and other iomap races
Message-ID: <X/2jC9kBBQCfbC3d@phenom.ffwll.local>
Mail-Followup-To: DRI Development <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 Stephen Rothwell <sfr@canb.auug.org.au>,
 linux-samsung-soc@vger.kernel.org, kvm@vger.kernel.org,
 linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
References: <20201127164131.2244124-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201127164131.2244124-1-daniel.vetter@ffwll.ch>
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
Cc: linux-samsung-soc@vger.kernel.org, kvm@vger.kernel.org,
 Daniel Vetter <daniel.vetter@ffwll.ch>, linux-mm@kvack.org,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Nov 27, 2020 at 05:41:14PM +0100, Daniel Vetter wrote:
> Hi all
> 
> Another update of my patch series to clamp down a bunch of races and gaps
> around follow_pfn and other access to iomem mmaps. Previous version:
> 
> v1: https://lore.kernel.org/dri-devel/20201007164426.1812530-1-daniel.vetter@ffwll.ch/
> v2: https://lore.kernel.org/dri-devel/20201009075934.3509076-1-daniel.vetter@ffwll.ch
> v3: https://lore.kernel.org/dri-devel/20201021085655.1192025-1-daniel.vetter@ffwll.ch/
> v4: https://lore.kernel.org/dri-devel/20201026105818.2585306-1-daniel.vetter@ffwll.ch/
> v5: https://lore.kernel.org/dri-devel/20201030100815.2269-1-daniel.vetter@ffwll.ch/
> v6: https://lore.kernel.org/dri-devel/20201119144146.1045202-1-daniel.vetter@ffwll.ch/
> 
> And the discussion that sparked this journey:
> 
> https://lore.kernel.org/dri-devel/20201007164426.1812530-1-daniel.vetter@ffwll.ch/
> 
> I think the first 12 patches are ready for landing. The parts starting
> with "mm: Add unsafe_follow_pfn" probably need more baking time.
> 
> Andrew, can you please pick these up, or do you prefer I do a topic branch
> and send them to Linus directly in the next merge window?
> 
> Changes in v7:
> - more acks/reviews
> - reordered with the ready pieces at the front
> - simplified the new follow_pfn function as Jason suggested
> 
> Changes in v6:
> - Tested v4l userptr as Tomasz suggested. No boom observed
> - Added RFC for locking down follow_pfn, per discussion with Christoph and
>   Jason.
> - Explain why pup_fast is safe in relevant patches, there was a bit a
>   confusion when discussing v5.
> - Fix up the resource patch, with CONFIG_IO_STRICT_DEVMEM it crashed on
>   boot due to an unintended change (reported by John)
> 
> Changes in v5:
> - Tomasz found some issues in the media patches
> - Polish suggested by Christoph for the unsafe_follow_pfn patch
> 
> Changes in v4:
> - Drop the s390 patch, that was very stand-alone and now queued up to land
>   through s390 trees.
> - Comment polish per Dan's review.
> 
> Changes in v3:
> - Bunch of polish all over, no functional changes aside from one barrier
>   in the resource code, for consistency.
> - A few more r-b tags.
> 
> Changes in v2:
> - tons of small polish&fixes all over, thanks to all the reviewers who
>   spotted issues
> - I managed to test at least the generic_access_phys and pci mmap revoke
>   stuff with a few gdb sessions using our i915 debug tools (hence now also
>   the drm/i915 patch to properly request all the pci bar regions)
> - reworked approach for the pci mmap revoke: Infrastructure moved into
>   kernel/resource.c, address_space mapping is now set up at open time for
>   everyone (which required some sysfs changes). Does indeed look a lot
>   cleaner and a lot less invasive than I feared at first.
> 
> Coments and review on the remaining bits very much welcome, especially
> from the kvm and vfio side.
> 
> Cheers, Daniel
> 
> Daniel Vetter (17):
>   drm/exynos: Stop using frame_vector helpers
>   drm/exynos: Use FOLL_LONGTERM for g2d cmdlists
>   misc/habana: Stop using frame_vector helpers
>   misc/habana: Use FOLL_LONGTERM for userptr
>   mm/frame-vector: Use FOLL_LONGTERM
>   media: videobuf2: Move frame_vector into media subsystem
>   mm: Close race in generic_access_phys
>   PCI: Obey iomem restrictions for procfs mmap
>   /dev/mem: Only set filp->f_mapping
>   resource: Move devmem revoke code to resource framework
>   sysfs: Support zapping of binary attr mmaps
>   PCI: Revoke mappings like devmem

As Jason suggested, I've pulled the first 1 patches into a topic branch.

Stephen, can you please add the below to linux-next for the 5.12 merge
window?

git://anongit.freedesktop.org/drm/drm topic/iomem-mmap-vs-gup

Once this part has landed I'll see what to do with the below part.

Thanks, Daniel

>   mm: Add unsafe_follow_pfn
>   media/videobuf1|2: Mark follow_pfn usage as unsafe
>   vfio/type1: Mark follow_pfn as unsafe
>   kvm: pass kvm argument to follow_pfn callsites
>   mm: add mmu_notifier argument to follow_pfn
> 
>  arch/powerpc/kvm/book3s_64_mmu_hv.c           |   2 +-
>  arch/powerpc/kvm/book3s_64_mmu_radix.c        |   2 +-
>  arch/powerpc/kvm/e500_mmu_host.c              |   2 +-
>  arch/x86/kvm/mmu/mmu.c                        |   8 +-
>  drivers/char/mem.c                            |  86 +-------------
>  drivers/gpu/drm/exynos/Kconfig                |   1 -
>  drivers/gpu/drm/exynos/exynos_drm_g2d.c       |  48 ++++----
>  drivers/media/common/videobuf2/Kconfig        |   1 -
>  drivers/media/common/videobuf2/Makefile       |   1 +
>  .../media/common/videobuf2}/frame_vector.c    |  57 ++++-----
>  .../media/common/videobuf2/videobuf2-memops.c |   3 +-
>  drivers/media/platform/omap/Kconfig           |   1 -
>  drivers/media/v4l2-core/videobuf-dma-contig.c |   2 +-
>  drivers/misc/habanalabs/Kconfig               |   1 -
>  drivers/misc/habanalabs/common/habanalabs.h   |   6 +-
>  drivers/misc/habanalabs/common/memory.c       |  52 +++-----
>  drivers/pci/pci-sysfs.c                       |   4 +
>  drivers/pci/proc.c                            |   6 +
>  drivers/vfio/vfio_iommu_type1.c               |   4 +-
>  fs/sysfs/file.c                               |  11 ++
>  include/linux/ioport.h                        |   6 +-
>  include/linux/kvm_host.h                      |   9 +-
>  include/linux/mm.h                            |  50 +-------
>  include/linux/sysfs.h                         |   2 +
>  include/media/frame_vector.h                  |  47 ++++++++
>  include/media/videobuf2-core.h                |   1 +
>  kernel/resource.c                             |  98 ++++++++++++++-
>  mm/Kconfig                                    |   3 -
>  mm/Makefile                                   |   1 -
>  mm/memory.c                                   | 112 +++++++++++++++---
>  mm/nommu.c                                    |  16 ++-
>  security/Kconfig                              |  13 ++
>  virt/kvm/kvm_main.c                           |  56 +++++----
>  33 files changed, 413 insertions(+), 299 deletions(-)
>  rename {mm => drivers/media/common/videobuf2}/frame_vector.c (84%)
>  create mode 100644 include/media/frame_vector.h
> 
> -- 
> 2.29.2
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
