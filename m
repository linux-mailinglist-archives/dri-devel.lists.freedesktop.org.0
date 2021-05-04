Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59A84372A84
	for <lists+dri-devel@lfdr.de>; Tue,  4 May 2021 14:59:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 752836E214;
	Tue,  4 May 2021 12:59:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FC0B6E214
 for <dri-devel@lists.freedesktop.org>; Tue,  4 May 2021 12:59:10 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9E030613B4;
 Tue,  4 May 2021 12:59:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1620133150;
 bh=VKrAeZZpludZjTm6WuzJcgg7371nyGiXlt3bsLCkX3c=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=1RVOhA+xUnttg6X+/OXWdWei9lFiPRvoAUP4JZ66jwCl3Fwz8Y9JcIZ2dWfl4AXDh
 Mg7CS6WUOwTfkw4umLIPAtPqY5sJ9P6hfLWa3HEE2n4liAZAnteKFXFxaUW5xREyNd
 jljZ143srAqD73QuO6fQW2meQYvxR3Y6pcFbbX8Q=
Date: Tue, 4 May 2021 14:59:07 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Greg Kurz <groug@kaod.org>
Subject: Re: remove the nvlink2 pci_vfio subdriver v2
Message-ID: <YJFFG1tSP0dUCxcX@kroah.com>
References: <20210326061311.1497642-1-hch@lst.de>
 <20210504142236.76994047@bahia.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210504142236.76994047@bahia.lan>
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
Cc: kvm@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Michael Ellerman <mpe@ellerman.id.au>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, qemu-devel@nongnu.org,
 Alex Williamson <alex.williamson@redhat.com>,
 Paul Mackerras <paulus@samba.org>, Jason Gunthorpe <jgg@nvidia.com>,
 linux-api@vger.kernel.org, qemu-ppc@nongnu.org, linuxppc-dev@lists.ozlabs.org,
 Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, May 04, 2021 at 02:22:36PM +0200, Greg Kurz wrote:
> On Fri, 26 Mar 2021 07:13:09 +0100
> Christoph Hellwig <hch@lst.de> wrote:
> 
> > Hi all,
> > 
> > the nvlink2 vfio subdriver is a weird beast.  It supports a hardware
> > feature without any open source component - what would normally be
> > the normal open source userspace that we require for kernel drivers,
> > although in this particular case user space could of course be a
> > kernel driver in a VM.  It also happens to be a complete mess that
> > does not properly bind to PCI IDs, is hacked into the vfio_pci driver
> > and also pulles in over 1000 lines of code always build into powerpc
> > kernels that have Power NV support enabled.  Because of all these
> > issues and the lack of breaking userspace when it is removed I think
> > the best idea is to simply kill.
> > 
> > Changes since v1:
> >  - document the removed subtypes as reserved
> >  - add the ACK from Greg
> > 
> > Diffstat:
> >  arch/powerpc/platforms/powernv/npu-dma.c     |  705 ---------------------------
> >  b/arch/powerpc/include/asm/opal.h            |    3 
> >  b/arch/powerpc/include/asm/pci-bridge.h      |    1 
> >  b/arch/powerpc/include/asm/pci.h             |    7 
> >  b/arch/powerpc/platforms/powernv/Makefile    |    2 
> >  b/arch/powerpc/platforms/powernv/opal-call.c |    2 
> >  b/arch/powerpc/platforms/powernv/pci-ioda.c  |  185 -------
> >  b/arch/powerpc/platforms/powernv/pci.c       |   11 
> >  b/arch/powerpc/platforms/powernv/pci.h       |   17 
> >  b/arch/powerpc/platforms/pseries/pci.c       |   23 
> >  b/drivers/vfio/pci/Kconfig                   |    6 
> >  b/drivers/vfio/pci/Makefile                  |    1 
> >  b/drivers/vfio/pci/vfio_pci.c                |   18 
> >  b/drivers/vfio/pci/vfio_pci_private.h        |   14 
> >  b/include/uapi/linux/vfio.h                  |   38 -
> 
> 
> Hi Christoph,
> 
> FYI, these uapi changes break build of QEMU.

What uapi changes?

What exactly breaks?

Why does QEMU require kernel driver stuff?

thanks,

greg k-h
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
