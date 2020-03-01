Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 405F4175569
	for <lists+dri-devel@lfdr.de>; Mon,  2 Mar 2020 09:18:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA0A96E106;
	Mon,  2 Mar 2020 08:18:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from r3-20.sinamail.sina.com.cn (r3-20.sinamail.sina.com.cn
 [202.108.3.20])
 by gabe.freedesktop.org (Postfix) with SMTP id 16E2F6E20F
 for <dri-devel@lists.freedesktop.org>; Sun,  1 Mar 2020 13:49:43 +0000 (UTC)
Received: from unknown (HELO localhost.localdomain)([114.246.226.1])
 by sina.com with ESMTP
 id 5E5BBD7100006F9A; Sun, 1 Mar 2020 21:49:38 +0800 (CST)
X-Sender: hdanton@sina.com
X-Auth-ID: hdanton@sina.com
X-SMAIL-MID: 62609615073823
From: Hillf Danton <hdanton@sina.com>
To: Thomas Hellstrom <thomas_os@shipmail.org>
Subject: Re: [PATCH v4 5/9] drm/ttm, drm/vmwgfx: Support huge TTM pagefaults
Date: Sun,  1 Mar 2020 21:49:28 +0800
Message-Id: <20200301134928.16128-1-hdanton@sina.com>
In-Reply-To: <20200220122719.4302-1-thomas_os@shipmail.org>
References: <20200220122719.4302-1-thomas_os@shipmail.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 02 Mar 2020 08:17:47 +0000
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
Cc: Thomas Hellstrom <thellstrom@vmware.com>, pv-drivers@vmware.com,
 Roland Scheidegger <sroland@vmware.com>,
 Dan Williams <dan.j.williams@intel.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 linux-graphics-maintainer@vmware.com,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Ralph Campbell <rcampbell@nvidia.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Thu, 20 Feb 2020 13:27:15 +0100 Thomas Hellstrom wrote:
> +
> +static vm_fault_t ttm_bo_vm_huge_fault(struct vm_fault *vmf,
> +				       enum page_entry_size pe_size)
> +{
> +	struct vm_area_struct *vma = vmf->vma;
> +	pgprot_t prot;
> +	struct ttm_buffer_object *bo = vma->vm_private_data;
> +	vm_fault_t ret;
> +	pgoff_t fault_page_size = 0;
> +	bool write = vmf->flags & FAULT_FLAG_WRITE;
> +
> +	switch (pe_size) {
> +	case PE_SIZE_PMD:
> +		fault_page_size = HPAGE_PMD_SIZE >> PAGE_SHIFT;
> +		break;
> +#ifdef CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD
> +	case PE_SIZE_PUD:
> +		fault_page_size = HPAGE_PUD_SIZE >> PAGE_SHIFT;
> +		break;
> +#endif
> +	default:
> +		WARN_ON_ONCE(1);
> +		return VM_FAULT_FALLBACK;
> +	}
> +
> +	/* Fallback on write dirty-tracking or COW */
> +	if (write && ttm_pgprot_is_wrprotecting(vma->vm_page_prot))
> +		return VM_FAULT_FALLBACK;
> +
> +	ret = ttm_bo_vm_reserve(bo, vmf);
> +	if (ret)
> +		return ret;
> +
> +	prot = vm_get_page_prot(vma->vm_flags);
> +	ret = ttm_bo_vm_fault_reserved(vmf, prot, 1, fault_page_size);
> +	if (ret == VM_FAULT_RETRY && !(vmf->flags & FAULT_FLAG_RETRY_NOWAIT))
> +		return ret;

Seems it does not make much sense to check VM_FAULT_RETRY and return as
at least resv lock is left behind without care.

> +
> +	dma_resv_unlock(bo->base.resv);
> +
> +	return ret;
> +}

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
