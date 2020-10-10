Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D54428A03A
	for <lists+dri-devel@lfdr.de>; Sat, 10 Oct 2020 13:39:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D67A6EEB7;
	Sat, 10 Oct 2020 11:39:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B155D6EEB7
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Oct 2020 11:39:36 +0000 (UTC)
Received: from coco.lan (ip5f5ad5ce.dynamic.kabel-deutschland.de
 [95.90.213.206])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 94619206CA;
 Sat, 10 Oct 2020 11:39:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1602329976;
 bh=zvaC51MIJ5mnwXcW69KrVi/GCWnhG/iJ2F+HsnvJrkQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=R9a0UrgTRfZqZ8ncmcLxisyO293sx9kk+A5/RTdjNrPEQZvao4pX99duCeK8IXOHM
 GxaX76wuoMd2Poh070hbs40Z+BFiq3DgHemYTZJIPLew1Qn7z56Yac9KD2ye+EcPfW
 5PBURPVocRppYhJa9U4CKOpjBIlbaweW0t94SxxE=
Date: Sat, 10 Oct 2020 13:39:29 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH v2 09/17] mm: Add unsafe_follow_pfn
Message-ID: <20201010133929.746d0529@coco.lan>
In-Reply-To: <CAKMK7uEKP5UMKeQHkTHWYUJkp=mz-Hvh-fJZy1KP3kT2xHpHrg@mail.gmail.com>
References: <20201009075934.3509076-1-daniel.vetter@ffwll.ch>
 <20201009075934.3509076-10-daniel.vetter@ffwll.ch>
 <20201009123421.67a80d72@coco.lan> <20201009122111.GN5177@ziepe.ca>
 <20201009143723.45609bfb@coco.lan> <20201009124850.GP5177@ziepe.ca>
 <CAKMK7uF-hrSwzFQkp6qEP88hM1Qg8TMQOunuRHh=f2+D8MaMRg@mail.gmail.com>
 <20201010112122.587f9945@coco.lan>
 <CAKMK7uEKP5UMKeQHkTHWYUJkp=mz-Hvh-fJZy1KP3kT2xHpHrg@mail.gmail.com>
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
 Linux MM <linux-mm@kvack.org>,
 =?UTF-8?B?SsOpcsO0bWU=?= Glisse <jglisse@redhat.com>,
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

Em Sat, 10 Oct 2020 12:53:49 +0200
Daniel Vetter <daniel.vetter@ffwll.ch> escreveu:

> Hi Mauro,
> 
> You might want to read the patches more carefully, because what you're
> demanding is what my patches do. Short summary:
> 
> - if STRICT_FOLLOW_PFN is set:
> a) normal memory is handled as-is (i.e. your example works) through
> the addition of FOLL_LONGTERM. This is the "pin the pages correctly"
> approach you're demanding
> b) for non-page memory (zerocopy sharing before dma-buf was upstreamed
> is the only use-case for this) it is correctly rejected with -EINVAL
> 
> - if you do have blobby userspace which requires the zero-copy using
> userptr to work, and doesn't have any of the fallbacks implemented
> that you describe, this would be a regression. That's why
> STRICT_FOLLOW_PFN can be unset. And yes there's a real security issue
> in this usage, Marek also confirmed that the removal of the vma copy
> code a few years ago essentially broke even the weak assumptions that
> made the code work 10+ years ago when it was merged.
> 
> so tdlr; Everything you described will keep working even with the new
> flag set, and everything you demand must be implemented _is_
> implemented in this patch series.
> 
> Also please keep in mind that we are _not_ talking about the general
> userptr support that was merge ~20 years ago. This patch series here
> is _only_ about the zerocpy userptr support merged with 50ac952d2263
> ("[media] videobuf2-dma-sg: Support io userptr operations on io
> memory") in 2013.

Ok, now it is making more sense. Please update the comments for
patch 10/17 to describe the above.

We need some time to test this though, in order to check if no
regressions were added (except the ones due to changeset 50ac952d2263).

> 
> Why this hack was merged in 2013 when we merged dma-buf almost 2 years
> before that I have no idea about. Imo that patch simply should never
> have landed, and instead dma-buf support prioritized.

If I recall correctly, we didn't have any DMABUF support
at the media subsystem, back on 2013.

It took some time for the DMA-BUF to arrive at media, as this
was not a top priority. Also, there aren't many developers that
understand the memory model well enough to implement DMA-BUF support
and touch the VB2 code, which is quite complex, as it supports
lots of different ways for I/O, plus works with vmalloc, DMA
contig and DMA scatter/gather. 

Changes there should carefully be tested against different
drivers, in order to avoid regressions on it.

> Cheers, Daniel

Thanks,
Mauro
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
