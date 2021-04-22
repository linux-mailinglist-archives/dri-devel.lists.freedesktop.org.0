Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DA3CF3681D0
	for <lists+dri-devel@lfdr.de>; Thu, 22 Apr 2021 15:49:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A85766EA98;
	Thu, 22 Apr 2021 13:49:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DE156EA98
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Apr 2021 13:49:45 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4FQzLS4gwsz9sW5;
 Thu, 22 Apr 2021 23:49:36 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1619099380;
 bh=PhzqVOhEd/h/0Fbbb3BAwftaycIPw8RDL50QyqE12IM=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=opAHDFQP4CkPQG2bXglbuqBieFuhtxeywVbuoUy6F6KRrIYll/aQ4VCFGZ+1SK9ww
 qkC27cYMIYRHgi8TycPRBwvXaDwBGTnXMQvEVQhwKjswSnF0TiXP9XoXJJH8uAMdxR
 lMSsBJYzwnLenDSlSt5RcjvvzILAWNdsjd3NeCn1uh6z9wZ4h29Ve3grGN/tFByXrh
 laZUoPJjgJvzIviuLVCQoLLfZr/DN4nqji6OiiVCjJx3TKVyz53aJyIcQrAkkTTzmJ
 lKYWFa+XMX4Vq2TMF7e9f3rRkMEJ3MQkjQhp4H2W940Tex0j4MPNi8CrUl2AaEhvuK
 7NueaXiSceWgg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Alex Williamson <alex.williamson@redhat.com>
Subject: Re: [PATCH 1/2] vfio/pci: remove vfio_pci_nvlink2
In-Reply-To: <20210412082304.5e7c0a80@omen>
References: <20210326061311.1497642-1-hch@lst.de>
 <20210326061311.1497642-2-hch@lst.de> <20210406133805.715120bd@omen>
 <87y2dndelm.fsf@mpe.ellerman.id.au> <20210412082304.5e7c0a80@omen>
Date: Thu, 22 Apr 2021 23:49:31 +1000
Message-ID: <87h7jybf9w.fsf@mpe.ellerman.id.au>
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
Cc: Jason Gunthorpe <jgg@nvidia.com>, kvm@vger.kernel.org,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Paul Mackerras <paulus@samba.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-api@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Alex Williamson <alex.williamson@redhat.com> writes:
> On Mon, 12 Apr 2021 19:41:41 +1000
> Michael Ellerman <mpe@ellerman.id.au> wrote:
>
>> Alex Williamson <alex.williamson@redhat.com> writes:
>> > On Fri, 26 Mar 2021 07:13:10 +0100
>> > Christoph Hellwig <hch@lst.de> wrote:
>> >  
>> >> This driver never had any open userspace (which for VFIO would include
>> >> VM kernel drivers) that use it, and thus should never have been added
>> >> by our normal userspace ABI rules.
>> >> 
>> >> Signed-off-by: Christoph Hellwig <hch@lst.de>
>> >> Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>> >> ---
>> >>  drivers/vfio/pci/Kconfig            |   6 -
>> >>  drivers/vfio/pci/Makefile           |   1 -
>> >>  drivers/vfio/pci/vfio_pci.c         |  18 -
>> >>  drivers/vfio/pci/vfio_pci_nvlink2.c | 490 ----------------------------
>> >>  drivers/vfio/pci/vfio_pci_private.h |  14 -
>> >>  include/uapi/linux/vfio.h           |  38 +--
>> >>  6 files changed, 4 insertions(+), 563 deletions(-)
>> >>  delete mode 100644 drivers/vfio/pci/vfio_pci_nvlink2.c  
>> >
>> > Hearing no objections, applied to vfio next branch for v5.13.  Thanks,  
>> 
>> Looks like you only took patch 1?
>> 
>> I can't take patch 2 on its own, that would break the build.
>> 
>> Do you want to take both patches? There's currently no conflicts against
>> my tree. It's possible one could appear before the v5.13 merge window,
>> though it would probably just be something minor.
>> 
>> Or I could apply both patches to my tree, which means patch 1 would
>> appear as two commits in the git history, but that's not a big deal.
>
> I've already got a conflict in my next branch with patch 1, so it's
> best to go through my tree.  Seems like a shared branch would be
> easiest to allow you to merge and manage potential conflicts against
> patch 2, I've pushed a branch here:
>
> https://github.com/awilliam/linux-vfio.git v5.13/vfio/nvlink

Thanks.

My next is based on rc2, so I won't pull that in directly, because I
don't want to pull all of rc6 in with it.

I'll put it in a topic branch and merge it into my next after my first
pull has gone to Linus.

cheers
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
