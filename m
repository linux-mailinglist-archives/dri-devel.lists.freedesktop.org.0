Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BB26A6EC0BC
	for <lists+dri-devel@lfdr.de>; Sun, 23 Apr 2023 17:13:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B0BF10E0CE;
	Sun, 23 Apr 2023 15:13:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A852610E0CE;
 Sun, 23 Apr 2023 15:13:02 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 070AF60C89;
 Sun, 23 Apr 2023 15:13:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B041C433D2;
 Sun, 23 Apr 2023 15:12:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1682262780;
 bh=AG9DJZKb5AXH2c0az9/0UlHgvcR2b85u+6yXwdK30HQ=;
 h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
 b=BSRWhPBhfSM03HuvQb+y4p1ndshuPczQ3mHWCR+WA4fQ5nDNHEaWh8JqgK5D3rkgS
 2DJE+sYAWgM0a7xj8Zx4jYjguuU6825y+HjVRV1Qc9UkEnOBFaEfBcNUrWXU+y3Qgq
 kgW7miXSbTIzjbjwUNrjqRDlfyc1qkiU8+MMAfcYBCYgiBwj9Yf/yEONL00FXIYo92
 4lcZ6kvGY+DRGol+2jEuvIsw9daS/r8WkkToPoPvxxoLRFeoES9rlKs6l81BxYBjoe
 ypYWeO+bidGIy58+24pHa7wGcTJLrMzULDe8M2YyuGga4evpEa62pFaO4I76LM18e+
 By/mijx/sgvtw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 23 Apr 2023 18:12:54 +0300
Message-Id: <CS48DTLH7UEG.1PX2N6DVS1UDR@suppilovahvero>
Subject: Re: [PATCH v4 1/6] mm/gup: remove unused vmas parameter from
 get_user_pages()
From: "Jarkko Sakkinen" <jarkko@kernel.org>
To: "Lorenzo Stoakes" <lstoakes@gmail.com>, <linux-mm@kvack.org>,
 <linux-kernel@vger.kernel.org>, "Andrew Morton" <akpm@linux-foundation.org>
X-Mailer: aerc 0.14.0
References: <cover.1681831798.git.lstoakes@gmail.com>
 <cd05b41d6d15ee9ff94273bc116ed3db3f5125bf.1681831798.git.lstoakes@gmail.com>
In-Reply-To: <cd05b41d6d15ee9ff94273bc116ed3db3f5125bf.1681831798.git.lstoakes@gmail.com>
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
Cc: Dimitri Sivanich <dimitri.sivanich@hpe.com>,
 Matthew Wilcox <willy@infradead.org>, Arnd Bergmann <arnd@arndb.de>,
 kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>,
 Xinhui Pan <Xinhui.Pan@amd.com>, x86@kernel.org, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, dri-devel@lists.freedesktop.org,
 Jason Gunthorpe <jgg@nvidia.com>, Ingo
 Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 amd-gfx@lists.freedesktop.org, "H . Peter
 Anvin" <hpa@zytor.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Gleixner <tglx@linutronix.de>, linux-sgx@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue Apr 18, 2023 at 6:49 PM EEST, Lorenzo Stoakes wrote:
> No invocation of get_user_pages() uses the vmas parameter, so remove
> it.
>
> The GUP API is confusing and caveated. Recent changes have done much to
> improve that, however there is more we can do. Exporting vmas is a prime
> target as the caller has to be extremely careful to preclude their use
> after the mmap_lock has expired or otherwise be left with dangling
> pointers.
>
> Removing the vmas parameter focuses the GUP functions upon their primary
> purpose - pinning (and outputting) pages as well as performing the action=
s
> implied by the input flags.
>
> This is part of a patch series aiming to remove the vmas parameter
> altogether.
>
> Suggested-by: Matthew Wilcox (Oracle) <willy@infradead.org>
> Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Acked-by: David Hildenbrand <david@redhat.com>
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> Signed-off-by: Lorenzo Stoakes <lstoakes@gmail.com>
> ---
>  arch/x86/kernel/cpu/sgx/ioctl.c     | 2 +-
>  drivers/gpu/drm/radeon/radeon_ttm.c | 2 +-
>  drivers/misc/sgi-gru/grufault.c     | 2 +-
>  include/linux/mm.h                  | 3 +--
>  mm/gup.c                            | 9 +++------
>  mm/gup_test.c                       | 5 ++---
>  virt/kvm/kvm_main.c                 | 2 +-
>  7 files changed, 10 insertions(+), 15 deletions(-)
>
> diff --git a/arch/x86/kernel/cpu/sgx/ioctl.c b/arch/x86/kernel/cpu/sgx/io=
ctl.c
> index 21ca0a831b70..5d390df21440 100644
> --- a/arch/x86/kernel/cpu/sgx/ioctl.c
> +++ b/arch/x86/kernel/cpu/sgx/ioctl.c
> @@ -214,7 +214,7 @@ static int __sgx_encl_add_page(struct sgx_encl *encl,
>  	if (!(vma->vm_flags & VM_MAYEXEC))
>  		return -EACCES;
> =20
> -	ret =3D get_user_pages(src, 1, 0, &src_page, NULL);
> +	ret =3D get_user_pages(src, 1, 0, &src_page);
>  	if (ret < 1)
>  		return -EFAULT;
> =20
> diff --git a/drivers/gpu/drm/radeon/radeon_ttm.c b/drivers/gpu/drm/radeon=
/radeon_ttm.c
> index 1e8e287e113c..0597540f0dde 100644
> --- a/drivers/gpu/drm/radeon/radeon_ttm.c
> +++ b/drivers/gpu/drm/radeon/radeon_ttm.c
> @@ -362,7 +362,7 @@ static int radeon_ttm_tt_pin_userptr(struct ttm_devic=
e *bdev, struct ttm_tt *ttm
>  		struct page **pages =3D ttm->pages + pinned;
> =20
>  		r =3D get_user_pages(userptr, num_pages, write ? FOLL_WRITE : 0,
> -				   pages, NULL);
> +				   pages);
>  		if (r < 0)
>  			goto release_pages;
> =20
> diff --git a/drivers/misc/sgi-gru/grufault.c b/drivers/misc/sgi-gru/grufa=
ult.c
> index b836936e9747..378cf02a2aa1 100644
> --- a/drivers/misc/sgi-gru/grufault.c
> +++ b/drivers/misc/sgi-gru/grufault.c
> @@ -185,7 +185,7 @@ static int non_atomic_pte_lookup(struct vm_area_struc=
t *vma,
>  #else
>  	*pageshift =3D PAGE_SHIFT;
>  #endif
> -	if (get_user_pages(vaddr, 1, write ? FOLL_WRITE : 0, &page, NULL) <=3D =
0)
> +	if (get_user_pages(vaddr, 1, write ? FOLL_WRITE : 0, &page) <=3D 0)
>  		return -EFAULT;
>  	*paddr =3D page_to_phys(page);
>  	put_page(page);
> diff --git a/include/linux/mm.h b/include/linux/mm.h
> index 37554b08bb28..b14cc4972d0b 100644
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@ -2380,8 +2380,7 @@ long pin_user_pages_remote(struct mm_struct *mm,
>  			   unsigned int gup_flags, struct page **pages,
>  			   struct vm_area_struct **vmas, int *locked);
>  long get_user_pages(unsigned long start, unsigned long nr_pages,
> -			    unsigned int gup_flags, struct page **pages,
> -			    struct vm_area_struct **vmas);
> +		    unsigned int gup_flags, struct page **pages);
>  long pin_user_pages(unsigned long start, unsigned long nr_pages,
>  		    unsigned int gup_flags, struct page **pages,
>  		    struct vm_area_struct **vmas);
> diff --git a/mm/gup.c b/mm/gup.c
> index 1f72a717232b..7e454d6b157e 100644
> --- a/mm/gup.c
> +++ b/mm/gup.c
> @@ -2251,8 +2251,6 @@ long get_user_pages_remote(struct mm_struct *mm,
>   * @pages:      array that receives pointers to the pages pinned.
>   *              Should be at least nr_pages long. Or NULL, if caller
>   *              only intends to ensure the pages are faulted in.
> - * @vmas:       array of pointers to vmas corresponding to each page.
> - *              Or NULL if the caller does not require them.
>   *
>   * This is the same as get_user_pages_remote(), just with a less-flexibl=
e
>   * calling convention where we assume that the mm being operated on belo=
ngs to
> @@ -2260,16 +2258,15 @@ long get_user_pages_remote(struct mm_struct *mm,
>   * obviously don't pass FOLL_REMOTE in here.
>   */
>  long get_user_pages(unsigned long start, unsigned long nr_pages,
> -		unsigned int gup_flags, struct page **pages,
> -		struct vm_area_struct **vmas)
> +		    unsigned int gup_flags, struct page **pages)
>  {
>  	int locked =3D 1;
> =20
> -	if (!is_valid_gup_args(pages, vmas, NULL, &gup_flags, FOLL_TOUCH))
> +	if (!is_valid_gup_args(pages, NULL, NULL, &gup_flags, FOLL_TOUCH))
>  		return -EINVAL;
> =20
>  	return __get_user_pages_locked(current->mm, start, nr_pages, pages,
> -				       vmas, &locked, gup_flags);
> +				       NULL, &locked, gup_flags);
>  }
>  EXPORT_SYMBOL(get_user_pages);
> =20
> diff --git a/mm/gup_test.c b/mm/gup_test.c
> index 8ae7307a1bb6..9ba8ea23f84e 100644
> --- a/mm/gup_test.c
> +++ b/mm/gup_test.c
> @@ -139,8 +139,7 @@ static int __gup_test_ioctl(unsigned int cmd,
>  						 pages + i);
>  			break;
>  		case GUP_BASIC_TEST:
> -			nr =3D get_user_pages(addr, nr, gup->gup_flags, pages + i,
> -					    NULL);
> +			nr =3D get_user_pages(addr, nr, gup->gup_flags, pages + i);
>  			break;
>  		case PIN_FAST_BENCHMARK:
>  			nr =3D pin_user_pages_fast(addr, nr, gup->gup_flags,
> @@ -161,7 +160,7 @@ static int __gup_test_ioctl(unsigned int cmd,
>  						    pages + i, NULL);
>  			else
>  				nr =3D get_user_pages(addr, nr, gup->gup_flags,
> -						    pages + i, NULL);
> +						    pages + i);
>  			break;
>  		default:
>  			ret =3D -EINVAL;
> diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> index d255964ec331..7f31e0a4adb5 100644
> --- a/virt/kvm/kvm_main.c
> +++ b/virt/kvm/kvm_main.c
> @@ -2474,7 +2474,7 @@ static inline int check_user_page_hwpoison(unsigned=
 long addr)
>  {
>  	int rc, flags =3D FOLL_HWPOISON | FOLL_WRITE;
> =20
> -	rc =3D get_user_pages(addr, 1, flags, NULL, NULL);
> +	rc =3D get_user_pages(addr, 1, flags, NULL);
>  	return rc =3D=3D -EHWPOISON;
>  }
> =20
> --=20
> 2.40.0


Acked-by: Jarkko Sakkinen <jarkko@kernel.org>

BR, Jarkko
