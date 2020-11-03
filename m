Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3738E2A5663
	for <lists+dri-devel@lfdr.de>; Tue,  3 Nov 2020 22:28:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 381DD6E8F4;
	Tue,  3 Nov 2020 21:28:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 014C36E8F4
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Nov 2020 21:28:41 +0000 (UTC)
Received: from localhost (230.sub-72-107-127.myvzw.com [72.107.127.230])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8D35D2074B;
 Tue,  3 Nov 2020 21:28:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604438921;
 bh=8ytUCsyZVeF3ujFgYm5L1sW7UkyVhphiOKLK38YXOJo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=r3rNM/R7N18tFkDui7jKc1s7Rf1w4AGB0oy4QLfqljsFx0cgfbQoVLb4YXPv8FJ21
 3GOcK6tXRCXbaRCS5TJewrPlPhPnEk4+UMQFmaSlDABV6b/XkOfyrQcMw74G4iOpe0
 oHBd90d8NCZ7lRYb6RIVYqEyC0t2dJj32/rqukig=
Date: Tue, 3 Nov 2020 15:28:40 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH v5 11/15] PCI: Obey iomem restrictions for procfs mmap
Message-ID: <20201103212840.GA266427@bjorn-Precision-5520>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201030100815.2269-12-daniel.vetter@ffwll.ch>
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
Cc: linux-samsung-soc@vger.kernel.org, Jan Kara <jack@suse.cz>,
 Kees Cook <keescook@chromium.org>, kvm@vger.kernel.org,
 Jason Gunthorpe <jgg@ziepe.ca>, John Hubbard <jhubbard@nvidia.com>,
 LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>, linux-mm@kvack.org,
 =?iso-8859-1?B?Suly9G1l?= Glisse <jglisse@redhat.com>,
 linux-pci@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Oct 30, 2020 at 11:08:11AM +0100, Daniel Vetter wrote:
> There's three ways to access PCI BARs from userspace: /dev/mem, sysfs
> files, and the old proc interface. Two check against
> iomem_is_exclusive, proc never did. And with CONFIG_IO_STRICT_DEVMEM,
> this starts to matter, since we don't want random userspace having
> access to PCI BARs while a driver is loaded and using it.
> =

> Fix this by adding the same iomem_is_exclusive() check we already have
> on the sysfs side in pci_mmap_resource().
> =

> References: 90a545e98126 ("restrict /dev/mem to idle io memory ranges")
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>

This is OK with me but it looks like IORESOURCE_EXCLUSIVE is currently
only used in a few places:

  e1000_probe() calls pci_request_selected_regions_exclusive(),
  ne_pci_probe() calls pci_request_regions_exclusive(),
  vmbus_allocate_mmio() calls request_mem_region_exclusive()

which raises the question of whether it's worth keeping
IORESOURCE_EXCLUSIVE at all.  I'm totally fine with removing it
completely.

But if you want it,

Acked-by: Bjorn Helgaas <bhelgaas@google.com>

> Cc: Jason Gunthorpe <jgg@ziepe.ca>
> Cc: Kees Cook <keescook@chromium.org>
> Cc: Dan Williams <dan.j.williams@intel.com>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: John Hubbard <jhubbard@nvidia.com>
> Cc: J=E9r=F4me Glisse <jglisse@redhat.com>
> Cc: Jan Kara <jack@suse.cz>
> Cc: Dan Williams <dan.j.williams@intel.com>
> Cc: linux-mm@kvack.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-samsung-soc@vger.kernel.org
> Cc: linux-media@vger.kernel.org
> Cc: Bjorn Helgaas <bhelgaas@google.com>
> Cc: linux-pci@vger.kernel.org
> Signed-off-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> --
> v2: Improve commit message (Bjorn)
> ---
>  drivers/pci/proc.c | 5 +++++
>  1 file changed, 5 insertions(+)
> =

> diff --git a/drivers/pci/proc.c b/drivers/pci/proc.c
> index d35186b01d98..3a2f90beb4cb 100644
> --- a/drivers/pci/proc.c
> +++ b/drivers/pci/proc.c
> @@ -274,6 +274,11 @@ static int proc_bus_pci_mmap(struct file *file, stru=
ct vm_area_struct *vma)
>  		else
>  			return -EINVAL;
>  	}
> +
> +	if (dev->resource[i].flags & IORESOURCE_MEM &&
> +	    iomem_is_exclusive(dev->resource[i].start))
> +		return -EINVAL;
> +
>  	ret =3D pci_mmap_page_range(dev, i, vma,
>  				  fpriv->mmap_state, write_combine);
>  	if (ret < 0)
> -- =

> 2.28.0
> =

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
