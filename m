Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A0C9928A603
	for <lists+dri-devel@lfdr.de>; Sun, 11 Oct 2020 08:36:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 598086E071;
	Sun, 11 Oct 2020 06:36:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68EC86E071
 for <dri-devel@lists.freedesktop.org>; Sun, 11 Oct 2020 06:36:50 +0000 (UTC)
Received: from coco.lan (ip5f5ad5a3.dynamic.kabel-deutschland.de
 [95.90.213.163])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 85DE0207F7;
 Sun, 11 Oct 2020 06:36:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1602398210;
 bh=MR/RMyKCclUPPVflq9R7vQAnP0HHAB+V0k+M/bUhRS4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=jvBUfU4lcFH5iYVZHi3aofMRqu0bNvwHTxzGNNkxsyXYWj1btiksG20/jfbPQvvqv
 dVJGVqnV9hei4ZzzcKLtrrL3N/xYb6tuVCokS0XC+GSZbVjKBxNL+vnz8aAokYiVaa
 RWkpl0Kn6+L8/zgpVMrCrzOooLkal8LZO9av0isI=
Date: Sun, 11 Oct 2020 08:36:42 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH v2 09/17] mm: Add unsafe_follow_pfn
Message-ID: <20201011083642.06ea8062@coco.lan>
In-Reply-To: <20201011082741.6bed4d71@coco.lan>
References: <20201009075934.3509076-1-daniel.vetter@ffwll.ch>
 <20201009075934.3509076-10-daniel.vetter@ffwll.ch>
 <20201009123421.67a80d72@coco.lan> <20201009122111.GN5177@ziepe.ca>
 <20201009143723.45609bfb@coco.lan> <20201009124850.GP5177@ziepe.ca>
 <CAKMK7uF-hrSwzFQkp6qEP88hM1Qg8TMQOunuRHh=f2+D8MaMRg@mail.gmail.com>
 <CAAFQd5CTT0re4ssj9NNTxhejFX_v_rCjy6=mX7C+dc=Lw9GOHw@mail.gmail.com>
 <20201010213554.GD3939@pendragon.ideasonboard.com>
 <CAKMK7uGhq+BiaJ5jD+bkO4VOaCPuUZ_empA3Ojr1AsvwNef6QQ@mail.gmail.com>
 <20201011082741.6bed4d71@coco.lan>
X-Mailer: Claws Mail 3.17.6 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
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
 Tomasz Figa <tfiga@chromium.org>, Hans Verkuil <hverkuil@xs4all.nl>,
 Linux MM <linux-mm@kvack.org>,
 =?UTF-8?B?SsOpcsO0bWU=?= Glisse <jglisse@redhat.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, "Lad,
 Prabhakar" <prabhakar.csengg@gmail.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Em Sun, 11 Oct 2020 08:27:41 +0200
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> escreveu:

> Em Sat, 10 Oct 2020 23:50:27 +0200
> Daniel Vetter <daniel.vetter@ffwll.ch> escreveu:
> 
> > On Sat, Oct 10, 2020 at 11:36 PM Laurent Pinchart
> > <laurent.pinchart@ideasonboard.com> wrote:
> > >
> 
> > > > We probably still have a few legacy drivers using videobuf (non-2),
> > > > but IMHO those should be safe to put behind some disabled-by-default
> > > > Kconfig symbol or even completely drop, as the legacy framework has
> > > > been deprecated for many years already.  
> > >
> > > There's 8 drivers left, and they support a very large number of devices.
> > > I expect unhappy users distros stop shipping them. On the other hand,
> > > videobuf has been deprecated for a loooooooong time, so there has been
> > > plenty of time to convert the remaining drivers to videobuf2. If nobody
> > > can do it, then we'll have to drop support for these devices given the
> > > security issues.  
> > 
> > Again, the issue here is _only_ with follow_pfn. For videobuf1 this
> > means videbuf-dma-contig.c userptr support is broken. Unlike videobuf2
> > it means it's broken for all usage (not just zero-copy userptr),
> > because videbuf-dma-contig.c lacks the pin_user_pages path.
> 
> Well, follow_pfn() is used only by videbuf-dma-contig.c. If this is 
> the only part of VB1 that will have userptr broken, then there's
> just one driver that might be affected: davinci.
> 
> Yet, taking a deeper look:
> 
> 	$ git grep include drivers/media/platform/davinci/|grep -i videobuf
> 	drivers/media/platform/davinci/vpif_capture.h:#include <media/videobuf2-dma-contig.h>
> 	drivers/media/platform/davinci/vpif_display.h:#include <media/videobuf2-dma-contig.h>
> 
> It sounds to me that it was already converted to VB2, but some VB1
> symbols were not converted at its Kconfig.
> 
> It sounds to me that there are other drivers with some VB1 left overs
> at Kconfig, as those are the only ones using VB1 those days:
> 
> 	$ for i in $(git grep media/videobuf drivers |grep -v videobuf2 |grep -v v4l2-core|cut -d: -f1); do dirname $i; done|sort|uniq
> 	drivers/media/pci/bt8xx
> 	drivers/media/pci/cx18
> 	drivers/media/platform
> 	drivers/media/usb/tm6000
> 	drivers/media/usb/zr364xx
> 	drivers/staging/media/atomisp/pci

This is incomplete. There are two drivers that include videobuf
indirectly:

	include/media/davinci/vpfe_capture.h
	include/media/drv-intf/saa7146_vv.h

I double-checked that DaVinci still uses VB1. There are 
actually two clients for videbuf-dma-contig.c: davinci and fsl-viu.

Those two will be affected, if we don't add pin_user_pages_fast()
support to VB1 or convert them to VB2.

> 
> > But that
> > would be easy to add if this poses a  problem I think - we just need
> > to carry over the pin_user_pages_fast logic from videbuf2, no driver
> > changes required. But of course I don't think we should do that before
> > someone reports the regression, since videobuf1 userptr is doubly
> > deprecated :-)
> 
> I think otherwise. Keeping a broken component at the Kernel is 
> a bad idea. 
> 
> Yet, from my quick search above, it sounds to me that it is time for 
> us to retire the VB1 DMA contig support as a hole, as there's no client 
> for it anymore.
> 
> I'll work on some patches cleaning up the VB1 left overs at
> Kconfig and removing videbuf-dma-contig.c for good, if there's
> no hidden dependency on it.
> 
> 
> Thanks,
> Mauro



Thanks,
Mauro
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
