Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CC88296F0C
	for <lists+dri-devel@lfdr.de>; Fri, 23 Oct 2020 14:26:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 389E36E578;
	Fri, 23 Oct 2020 12:26:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EC676E578
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Oct 2020 12:26:09 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id a72so1236670wme.5
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Oct 2020 05:26:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to; bh=PAFtVAQ3tChjSUzKujX9wl7xWmpuDPW53yjWkRt+YX4=;
 b=K/MlvxqbXxKBD7NtxzEVlnQQgEo8R7jzzQ6d8aTKu/t7mVOfhin25s4agcsW7aC9Fm
 Dg+jn2+aY9gWuXi7wduTHjxE/oiqtUmeSjJS9d5bV3rltqi1wTiNFP2rJPUUFWgVs7E6
 gRtIWzD7wrVKYbLUc6keZxA0hqL4l6D2l+jUk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to;
 bh=PAFtVAQ3tChjSUzKujX9wl7xWmpuDPW53yjWkRt+YX4=;
 b=tINMNFhbyZMgV2mCFa8SJo2pPV62L14eDl/D8gGX0JlSm3+BsIatrubJLFEwMh1S6e
 wyndFzisbM6dCXlydFqMqC0tAA/R5xsr137f4u6Ns5cN94SCEsUsVh7E6xQI8Ppv7snb
 HXPKeLZnzKvknU1fG2W2GMQH6THhv1QMjvu6TMh91zcBhe08xEg2kjZFws4+cVImkD7I
 Nvg7mK3JzS6dbJP8Kh40HHZALmMFOZPizPF0kZDwfC6uTESsOXCwtUma6/WCe1RPK8qH
 hdDMuC50zY0QbMuD6xgekfFteL6RRfdaU093EbVXLg5Hm3Un5Onp3SkfWmibZ/h5xQ0n
 5J4w==
X-Gm-Message-State: AOAM530maMYsSXtxdhSAuqxro/UanW3AtaF0J5+XP/0u9eAIPoAZWp/7
 aPT3hrWRN2FaU4+yHVXIrjOOA8Gqk/69seNH
X-Google-Smtp-Source: ABdhPJzmCXFy0gj+CVwTI7L79a3sWTdS3hTTu9nmTWuT4VCd2/G9Mq4Y+61MqYgpQ+yiCjJ3FCfC5Q==
X-Received: by 2002:a7b:c015:: with SMTP id c21mr2044322wmb.22.1603455964962; 
 Fri, 23 Oct 2020 05:26:04 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id k203sm3232158wmb.37.2020.10.23.05.26.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Oct 2020 05:26:04 -0700 (PDT)
Date: Fri, 23 Oct 2020 14:26:02 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH 29/65] s390/pci: Remove races against pte updates
Message-ID: <20201023122602.GB401619@phenom.ffwll.local>
Mail-Followup-To: DRI Development <dri-devel@lists.freedesktop.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Jason Gunthorpe <jgg@ziepe.ca>,
 Dan Williams <dan.j.williams@intel.com>,
 Kees Cook <keescook@chromium.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 John Hubbard <jhubbard@nvidia.com>,
 =?iso-8859-1?B?Suly9G1l?= Glisse <jglisse@redhat.com>,
 Jan Kara <jack@suse.cz>, linux-mm@kvack.org,
 linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-media@vger.kernel.org,
 Niklas Schnelle <schnelle@linux.ibm.com>,
 linux-s390@vger.kernel.org
References: <20201021163242.1458885-1-daniel.vetter@ffwll.ch>
 <20201023122216.2373294-1-daniel.vetter@ffwll.ch>
 <20201023122216.2373294-29-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201023122216.2373294-29-daniel.vetter@ffwll.ch>
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
Cc: linux-s390@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 Jan Kara <jack@suse.cz>, Kees Cook <keescook@chromium.org>, linux-mm@kvack.org,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Niklas Schnelle <schnelle@linux.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 =?iso-8859-1?B?Suly9G1l?= Glisse <jglisse@redhat.com>,
 John Hubbard <jhubbard@nvidia.com>, Daniel Vetter <daniel.vetter@intel.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Oct 23, 2020 at 02:21:40PM +0200, Daniel Vetter wrote:
> Way back it was a reasonable assumptions that iomem mappings never
> change the pfn range they point at. But this has changed:
> =

> - gpu drivers dynamically manage their memory nowadays, invalidating
> ptes with unmap_mapping_range when buffers get moved
> =

> - contiguous dma allocations have moved from dedicated carvetouts to
> cma regions. This means if we miss the unmap the pfn might contain
> pagecache or anon memory (well anything allocated with GFP_MOVEABLE)
> =

> - even /dev/mem now invalidates mappings when the kernel requests that
> iomem region when CONFIG_IO_STRICT_DEVMEM is set, see commit
> 3234ac664a87 ("/dev/mem: Revoke mappings when a driver claims the
> region")
> =

> Accessing pfns obtained from ptes without holding all the locks is
> therefore no longer a good idea. Fix this.
> =

> Since zpci_memcpy_from|toio seems to not do anything nefarious with
> locks we just need to open code get_pfn and follow_pfn and make sure
> we drop the locks only after we're done. The write function also needs
> the copy_from_user move, since we can't take userspace faults while
> holding the mmap sem.
> =

> v2: Move VM_IO | VM_PFNMAP checks around so they keep returning EINVAL
> like before (Gerard)
> =

> v3: Polish commit message (Niklas)
> =

> Reviewed-by: Gerald Schaefer <gerald.schaefer@linux.ibm.com>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Jason Gunthorpe <jgg@ziepe.ca>
> Cc: Dan Williams <dan.j.williams@intel.com>
> Cc: Kees Cook <keescook@chromium.org>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: John Hubbard <jhubbard@nvidia.com>
> Cc: J=E9r=F4me Glisse <jglisse@redhat.com>
> Cc: Jan Kara <jack@suse.cz>
> Cc: linux-mm@kvack.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-samsung-soc@vger.kernel.org
> Cc: linux-media@vger.kernel.org
> Cc: Niklas Schnelle <schnelle@linux.ibm.com>
> Cc: Gerald Schaefer <gerald.schaefer@linux.ibm.com>
> Cc: linux-s390@vger.kernel.org
> Cc: Niklas Schnelle <schnelle@linux.ibm.com>
> Signed-off-by: Daniel Vetter <daniel.vetter@ffwll.ch>

Apologies for this random patch bomb, typoed git send-email command :-/

v4 of this will come properly on Monday or so.
-Daniel

> ---
>  arch/s390/pci/pci_mmio.c | 98 +++++++++++++++++++++++-----------------
>  1 file changed, 57 insertions(+), 41 deletions(-)
> =

> diff --git a/arch/s390/pci/pci_mmio.c b/arch/s390/pci/pci_mmio.c
> index 401cf670a243..1a6adbc68ee8 100644
> --- a/arch/s390/pci/pci_mmio.c
> +++ b/arch/s390/pci/pci_mmio.c
> @@ -119,33 +119,15 @@ static inline int __memcpy_toio_inuser(void __iomem=
 *dst,
>  	return rc;
>  }
>  =

> -static long get_pfn(unsigned long user_addr, unsigned long access,
> -		    unsigned long *pfn)
> -{
> -	struct vm_area_struct *vma;
> -	long ret;
> -
> -	mmap_read_lock(current->mm);
> -	ret =3D -EINVAL;
> -	vma =3D find_vma(current->mm, user_addr);
> -	if (!vma)
> -		goto out;
> -	ret =3D -EACCES;
> -	if (!(vma->vm_flags & access))
> -		goto out;
> -	ret =3D follow_pfn(vma, user_addr, pfn);
> -out:
> -	mmap_read_unlock(current->mm);
> -	return ret;
> -}
> -
>  SYSCALL_DEFINE3(s390_pci_mmio_write, unsigned long, mmio_addr,
>  		const void __user *, user_buffer, size_t, length)
>  {
>  	u8 local_buf[64];
>  	void __iomem *io_addr;
>  	void *buf;
> -	unsigned long pfn;
> +	struct vm_area_struct *vma;
> +	pte_t *ptep;
> +	spinlock_t *ptl;
>  	long ret;
>  =

>  	if (!zpci_is_enabled())
> @@ -158,7 +140,7 @@ SYSCALL_DEFINE3(s390_pci_mmio_write, unsigned long, m=
mio_addr,
>  	 * We only support write access to MIO capable devices if we are on
>  	 * a MIO enabled system. Otherwise we would have to check for every
>  	 * address if it is a special ZPCI_ADDR and would have to do
> -	 * a get_pfn() which we don't need for MIO capable devices.  Currently
> +	 * a pfn lookup which we don't need for MIO capable devices.  Currently
>  	 * ISM devices are the only devices without MIO support and there is no
>  	 * known need for accessing these from userspace.
>  	 */
> @@ -176,21 +158,37 @@ SYSCALL_DEFINE3(s390_pci_mmio_write, unsigned long,=
 mmio_addr,
>  	} else
>  		buf =3D local_buf;
>  =

> -	ret =3D get_pfn(mmio_addr, VM_WRITE, &pfn);
> +	ret =3D -EFAULT;
> +	if (copy_from_user(buf, user_buffer, length))
> +		goto out_free;
> +
> +	mmap_read_lock(current->mm);
> +	ret =3D -EINVAL;
> +	vma =3D find_vma(current->mm, mmio_addr);
> +	if (!vma)
> +		goto out_unlock_mmap;
> +	if (!(vma->vm_flags & (VM_IO | VM_PFNMAP)))
> +		goto out_unlock_mmap;
> +	ret =3D -EACCES;
> +	if (!(vma->vm_flags & VM_WRITE))
> +		goto out_unlock_mmap;
> +
> +	ret =3D follow_pte_pmd(vma->vm_mm, mmio_addr, NULL, &ptep, NULL, &ptl);
>  	if (ret)
> -		goto out;
> -	io_addr =3D (void __iomem *)((pfn << PAGE_SHIFT) |
> +		goto out_unlock_mmap;
> +
> +	io_addr =3D (void __iomem *)((pte_pfn(*ptep) << PAGE_SHIFT) |
>  			(mmio_addr & ~PAGE_MASK));
>  =

> -	ret =3D -EFAULT;
>  	if ((unsigned long) io_addr < ZPCI_IOMAP_ADDR_BASE)
> -		goto out;
> -
> -	if (copy_from_user(buf, user_buffer, length))
> -		goto out;
> +		goto out_unlock_pt;
>  =

>  	ret =3D zpci_memcpy_toio(io_addr, buf, length);
> -out:
> +out_unlock_pt:
> +	pte_unmap_unlock(ptep, ptl);
> +out_unlock_mmap:
> +	mmap_read_unlock(current->mm);
> +out_free:
>  	if (buf !=3D local_buf)
>  		kfree(buf);
>  	return ret;
> @@ -274,7 +272,9 @@ SYSCALL_DEFINE3(s390_pci_mmio_read, unsigned long, mm=
io_addr,
>  	u8 local_buf[64];
>  	void __iomem *io_addr;
>  	void *buf;
> -	unsigned long pfn;
> +	struct vm_area_struct *vma;
> +	pte_t *ptep;
> +	spinlock_t *ptl;
>  	long ret;
>  =

>  	if (!zpci_is_enabled())
> @@ -287,7 +287,7 @@ SYSCALL_DEFINE3(s390_pci_mmio_read, unsigned long, mm=
io_addr,
>  	 * We only support read access to MIO capable devices if we are on
>  	 * a MIO enabled system. Otherwise we would have to check for every
>  	 * address if it is a special ZPCI_ADDR and would have to do
> -	 * a get_pfn() which we don't need for MIO capable devices.  Currently
> +	 * a pfn lookup which we don't need for MIO capable devices.  Currently
>  	 * ISM devices are the only devices without MIO support and there is no
>  	 * known need for accessing these from userspace.
>  	 */
> @@ -306,22 +306,38 @@ SYSCALL_DEFINE3(s390_pci_mmio_read, unsigned long, =
mmio_addr,
>  		buf =3D local_buf;
>  	}
>  =

> -	ret =3D get_pfn(mmio_addr, VM_READ, &pfn);
> +	mmap_read_lock(current->mm);
> +	ret =3D -EINVAL;
> +	vma =3D find_vma(current->mm, mmio_addr);
> +	if (!vma)
> +		goto out_unlock_mmap;
> +	if (!(vma->vm_flags & (VM_IO | VM_PFNMAP)))
> +		goto out_unlock_mmap;
> +	ret =3D -EACCES;
> +	if (!(vma->vm_flags & VM_WRITE))
> +		goto out_unlock_mmap;
> +
> +	ret =3D follow_pte_pmd(vma->vm_mm, mmio_addr, NULL, &ptep, NULL, &ptl);
>  	if (ret)
> -		goto out;
> -	io_addr =3D (void __iomem *)((pfn << PAGE_SHIFT) | (mmio_addr & ~PAGE_M=
ASK));
> +		goto out_unlock_mmap;
> +
> +	io_addr =3D (void __iomem *)((pte_pfn(*ptep) << PAGE_SHIFT) |
> +			(mmio_addr & ~PAGE_MASK));
>  =

>  	if ((unsigned long) io_addr < ZPCI_IOMAP_ADDR_BASE) {
>  		ret =3D -EFAULT;
> -		goto out;
> +		goto out_unlock_pt;
>  	}
>  	ret =3D zpci_memcpy_fromio(buf, io_addr, length);
> -	if (ret)
> -		goto out;
> -	if (copy_to_user(user_buffer, buf, length))
> +
> +out_unlock_pt:
> +	pte_unmap_unlock(ptep, ptl);
> +out_unlock_mmap:
> +	mmap_read_unlock(current->mm);
> +
> +	if (!ret && copy_to_user(user_buffer, buf, length))
>  		ret =3D -EFAULT;
>  =

> -out:
>  	if (buf !=3D local_buf)
>  		kfree(buf);
>  	return ret;
> -- =

> 2.28.0
> =


-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
