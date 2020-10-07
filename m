Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C40B72867A4
	for <lists+dri-devel@lfdr.de>; Wed,  7 Oct 2020 20:46:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBA896E97C;
	Wed,  7 Oct 2020 18:46:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF5F26E0E9
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Oct 2020 18:46:36 +0000 (UTC)
Received: from localhost (170.sub-72-107-125.myvzw.com [72.107.125.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 302572173E;
 Wed,  7 Oct 2020 18:46:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1602096396;
 bh=ku8/7a2SrweIxThK5zG5QJDipURplqu8mO6h2koIIVc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=yGYWT03mT20e+akOD8V3aUmT+NyGjr7bgLmgu9ySTSASz+Md94zSiKtM93/z0+0sL
 I3c3vVZGcJsLXlm+ZoUqyLsz8Cd5moqzmTGlgBtkwCaTbh8SP5WyTjiZ42UF86RDsd
 vY1hTupOSF5ue42FE0IOxR9jnpK4Wp1Jv+Hagbrk=
Date: Wed, 7 Oct 2020 13:46:34 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH 09/13] PCI: obey iomem restrictions for procfs mmap
Message-ID: <20201007184634.GA3259641@bjorn-Precision-5520>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201007164426.1812530-10-daniel.vetter@ffwll.ch>
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
Cc: linux-s390@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 Jan Kara <jack@suse.cz>, Kees Cook <keescook@chromium.org>,
 kvm@vger.kernel.org, Jason Gunthorpe <jgg@ziepe.ca>,
 John Hubbard <jhubbard@nvidia.com>, LKML <linux-kernel@vger.kernel.org>,
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

On Wed, Oct 07, 2020 at 06:44:22PM +0200, Daniel Vetter wrote:
> There's three ways to access pci bars from userspace: /dev/mem, sysfs
> files, and the old proc interface. Two check against
> iomem_is_exclusive, proc never did. And with CONFIG_IO_STRICT_DEVMEM,
> this starts to matter, since we don't want random userspace having
> access to pci bars while a driver is loaded and using it.
> =

> Fix this.

Please mention *how* you're fixing this.  I know you can sort of
deduce it from the first paragraph, but it's easy to save readers the
trouble.

s/pci/PCI/
s/bars/BARs/
Capitalize subject to match other patches.

> References: 90a545e98126 ("restrict /dev/mem to idle io memory ranges")
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
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
