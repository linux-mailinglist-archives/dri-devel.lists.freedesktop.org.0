Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38D1A28678B
	for <lists+dri-devel@lfdr.de>; Wed,  7 Oct 2020 20:41:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CC196E976;
	Wed,  7 Oct 2020 18:41:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 446996E976
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Oct 2020 18:41:34 +0000 (UTC)
Received: from localhost (170.sub-72-107-125.myvzw.com [72.107.125.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7E5DE2168B;
 Wed,  7 Oct 2020 18:41:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1602096093;
 bh=jybj9lxB9HDSUiFTDfX0tbqIYHCI2WD8V2Srcj/Y2q0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=fvTSDoaSFaR5f+GW+1VfPgc/eLGyZstXFPM0Pbbd72KBA+ecoTEtBddTdYZhtlYj3
 bsFSSKkvJi72PjhGp9tmM7ZEtUUSjRP9PU6yME2u3FWvCct89TVsvj/po3TnsMWfeR
 J1+3vx2h0ip+tE/J1MK3LQud3yRzf+O7RxgCuZrk=
Date: Wed, 7 Oct 2020 13:41:31 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH 10/13] PCI: revoke mappings like devmem
Message-ID: <20201007184131.GA3259154@bjorn-Precision-5520>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201007164426.1812530-11-daniel.vetter@ffwll.ch>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Capitalize subject, like other patches in this series and previous
drivers/pci history.

On Wed, Oct 07, 2020 at 06:44:23PM +0200, Daniel Vetter wrote:
> Since 3234ac664a87 ("/dev/mem: Revoke mappings when a driver claims
> the region") /dev/kmem zaps ptes when the kernel requests exclusive
> acccess to an iomem region. And with CONFIG_IO_STRICT_DEVMEM, this is
> the default for all driver uses.
> 
> Except there's two more ways to access pci bars: sysfs and proc mmap
> support. Let's plug that hole.

s/pci/PCI/ in commit logs and comments.

> For revoke_devmem() to work we need to link our vma into the same
> address_space, with consistent vma->vm_pgoff. ->pgoff is already
> adjusted, because that's how (io_)remap_pfn_range works, but for the
> mapping we need to adjust vma->vm_file->f_mapping. Usually that's done
> at ->open time, but that's a bit tricky here with all the entry points
> and arch code. So instead create a fake file and adjust vma->vm_file.
> 
> Note this only works for ARCH_GENERIC_PCI_MMAP_RESOURCE. But that
> seems to be a subset of architectures support STRICT_DEVMEM, so we
> should be good.
> 
> The only difference in access checks left is that sysfs pci mmap does
> not check for CAP_RAWIO. But I think that makes some sense compared to
> /dev/mem and proc, where one file gives you access to everything and
> no ownership applies.

> --- a/drivers/char/mem.c
> +++ b/drivers/char/mem.c
> @@ -810,6 +810,7 @@ static loff_t memory_lseek(struct file *file, loff_t offset, int orig)
>  }
>  
>  static struct inode *devmem_inode;
> +static struct vfsmount *devmem_vfs_mount;
>  
>  #ifdef CONFIG_IO_STRICT_DEVMEM
>  void revoke_devmem(struct resource *res)
> @@ -843,6 +844,20 @@ void revoke_devmem(struct resource *res)
>  
>  	unmap_mapping_range(inode->i_mapping, res->start, resource_size(res), 1);
>  }
> +
> +struct file *devmem_getfile(void)
> +{
> +	struct file *file;
> +
> +	file = alloc_file_pseudo(devmem_inode, devmem_vfs_mount, "devmem",
> +				 O_RDWR, &kmem_fops);
> +	if (IS_ERR(file))
> +		return NULL;
> +
> +	file->f_mapping = devmem_indoe->i_mapping;

"devmem_indoe"?  Obviously not compiled, I guess?

> --- a/include/linux/ioport.h
> +++ b/include/linux/ioport.h
> @@ -304,8 +304,10 @@ struct resource *request_free_mem_region(struct resource *base,
>  
>  #ifdef CONFIG_IO_STRICT_DEVMEM
>  void revoke_devmem(struct resource *res);
> +struct file *devm_getfile(void);
>  #else
>  static inline void revoke_devmem(struct resource *res) { };
> +static inline struct file *devmem_getfile(void) { return NULL; };

I guess these names are supposed to match?

>  #endif
>  
>  #endif /* __ASSEMBLY__ */
> -- 
> 2.28.0
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
