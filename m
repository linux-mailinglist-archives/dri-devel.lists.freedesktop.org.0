Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB0B22A56BB
	for <lists+dri-devel@lfdr.de>; Tue,  3 Nov 2020 22:30:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9D226E902;
	Tue,  3 Nov 2020 21:30:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDB546E902
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Nov 2020 21:30:49 +0000 (UTC)
Received: from localhost (230.sub-72-107-127.myvzw.com [72.107.127.230])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 44A0721534;
 Tue,  3 Nov 2020 21:30:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604439049;
 bh=gFAgHCJWNmyQv8XlwrCh9kp3qGCPYDz+IyZljoQ6Ups=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=HPIF3XrIciMDdSu7IGKOJ2VjSvbDSacEXORbsIuVGj6fyf3x9OQrRmMY+UbQhcHod
 S0PweedIfoil4rWheiyrbxThkEJx6xR3EmK7UER4Lwppn2I8mdb/JZGIaxfx9sH5wo
 Y1sD3IWMwbGA0osqLFzmB0xss30QQlrpQVsT0BXs=
Date: Tue, 3 Nov 2020 15:30:47 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH v5 15/15] PCI: Revoke mappings like devmem
Message-ID: <20201103213047.GA267004@bjorn-Precision-5520>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201030100815.2269-16-daniel.vetter@ffwll.ch>
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
 linux-pci@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>, linux-mm@kvack.org,
 =?iso-8859-1?B?Suly9G1l?= Glisse <jglisse@redhat.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Bjorn Helgaas <bhelgaas@google.com>, Daniel Vetter <daniel.vetter@intel.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Oct 30, 2020 at 11:08:15AM +0100, Daniel Vetter wrote:
> Since 3234ac664a87 ("/dev/mem: Revoke mappings when a driver claims
> the region") /dev/kmem zaps ptes when the kernel requests exclusive
> acccess to an iomem region. And with CONFIG_IO_STRICT_DEVMEM, this is
> the default for all driver uses.
> =

> Except there's two more ways to access PCI BARs: sysfs and proc mmap
> support. Let's plug that hole.
> =

> For revoke_devmem() to work we need to link our vma into the same
> address_space, with consistent vma->vm_pgoff. ->pgoff is already
> adjusted, because that's how (io_)remap_pfn_range works, but for the
> mapping we need to adjust vma->vm_file->f_mapping. The cleanest way is
> to adjust this at at ->open time:
> =

> - for sysfs this is easy, now that binary attributes support this. We
>   just set bin_attr->mapping when mmap is supported
> - for procfs it's a bit more tricky, since procfs pci access has only
>   one file per device, and access to a specific resources first needs
>   to be set up with some ioctl calls. But mmap is only supported for
>   the same resources as sysfs exposes with mmap support, and otherwise
>   rejected, so we can set the mapping unconditionally at open time
>   without harm.
> =

> A special consideration is for arch_can_pci_mmap_io() - we need to
> make sure that the ->f_mapping doesn't alias between ioport and iomem
> space. There's only 2 ways in-tree to support mmap of ioports: generic
> pci mmap (ARCH_GENERIC_PCI_MMAP_RESOURCE), and sparc as the single
> architecture hand-rolling. Both approach support ioport mmap through a
> special pfn range and not through magic pte attributes. Aliasing is
> therefore not a problem.
> =

> The only difference in access checks left is that sysfs PCI mmap does
> not check for CAP_RAWIO. I'm not really sure whether that should be
> added or not.
> =

> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Jason Gunthorpe <jgg@ziepe.ca>
> Cc: Kees Cook <keescook@chromium.org>
> Cc: Dan Williams <dan.j.williams@intel.com>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: John Hubbard <jhubbard@nvidia.com>
> Cc: J=E9r=F4me Glisse <jglisse@redhat.com>
> Cc: Jan Kara <jack@suse.cz>
> Cc: Dan Williams <dan.j.williams@intel.com>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: linux-mm@kvack.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-samsung-soc@vger.kernel.org
> Cc: linux-media@vger.kernel.org
> Cc: Bjorn Helgaas <bhelgaas@google.com>
> Cc: linux-pci@vger.kernel.org
> Signed-off-by: Daniel Vetter <daniel.vetter@ffwll.ch>

Acked-by: Bjorn Helgaas <bhelgaas@google.com>

> --
> v2:
> - Totally new approach: Adjust filp->f_mapping at open time. Note that
>   this now works on all architectures, not just those support
>   ARCH_GENERIC_PCI_MMAP_RESOURCE
> ---
>  drivers/pci/pci-sysfs.c | 4 ++++
>  drivers/pci/proc.c      | 1 +
>  2 files changed, 5 insertions(+)
> =

> diff --git a/drivers/pci/pci-sysfs.c b/drivers/pci/pci-sysfs.c
> index d15c881e2e7e..3f1c31bc0b7c 100644
> --- a/drivers/pci/pci-sysfs.c
> +++ b/drivers/pci/pci-sysfs.c
> @@ -929,6 +929,7 @@ void pci_create_legacy_files(struct pci_bus *b)
>  	b->legacy_io->read =3D pci_read_legacy_io;
>  	b->legacy_io->write =3D pci_write_legacy_io;
>  	b->legacy_io->mmap =3D pci_mmap_legacy_io;
> +	b->legacy_io->mapping =3D iomem_get_mapping();
>  	pci_adjust_legacy_attr(b, pci_mmap_io);
>  	error =3D device_create_bin_file(&b->dev, b->legacy_io);
>  	if (error)
> @@ -941,6 +942,7 @@ void pci_create_legacy_files(struct pci_bus *b)
>  	b->legacy_mem->size =3D 1024*1024;
>  	b->legacy_mem->attr.mode =3D 0600;
>  	b->legacy_mem->mmap =3D pci_mmap_legacy_mem;
> +	b->legacy_io->mapping =3D iomem_get_mapping();
>  	pci_adjust_legacy_attr(b, pci_mmap_mem);
>  	error =3D device_create_bin_file(&b->dev, b->legacy_mem);
>  	if (error)
> @@ -1156,6 +1158,8 @@ static int pci_create_attr(struct pci_dev *pdev, in=
t num, int write_combine)
>  			res_attr->mmap =3D pci_mmap_resource_uc;
>  		}
>  	}
> +	if (res_attr->mmap)
> +		res_attr->mapping =3D iomem_get_mapping();
>  	res_attr->attr.name =3D res_attr_name;
>  	res_attr->attr.mode =3D 0600;
>  	res_attr->size =3D pci_resource_len(pdev, num);
> diff --git a/drivers/pci/proc.c b/drivers/pci/proc.c
> index 3a2f90beb4cb..9bab07302bbf 100644
> --- a/drivers/pci/proc.c
> +++ b/drivers/pci/proc.c
> @@ -298,6 +298,7 @@ static int proc_bus_pci_open(struct inode *inode, str=
uct file *file)
>  	fpriv->write_combine =3D 0;
>  =

>  	file->private_data =3D fpriv;
> +	file->f_mapping =3D iomem_get_mapping();
>  =

>  	return 0;
>  }
> -- =

> 2.28.0
> =

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
