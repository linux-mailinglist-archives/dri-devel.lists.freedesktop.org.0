Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E2C0E174AF6
	for <lists+dri-devel@lfdr.de>; Sun,  1 Mar 2020 05:04:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD8926E378;
	Sun,  1 Mar 2020 04:04:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D61846E378
 for <dri-devel@lists.freedesktop.org>; Sun,  1 Mar 2020 04:04:46 +0000 (UTC)
Received: from localhost.localdomain (c-73-231-172-41.hsd1.ca.comcast.net
 [73.231.172.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4FF7221744;
 Sun,  1 Mar 2020 04:04:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1583035486;
 bh=TgI4hILERXIbASCXQEv8m6ZbXiQzeEGpPNVCww6wUgA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Givj2+KydQ8xlFIvRDz9loCRvtP0C5bnCTqVnyw+n/qUa4g6LYurSEEgQcrkOaTue
 MYM7EHAyvH+fS6UTeE/IrDk/WxWsyPYl4VrUBBg0BPIx7JIJ6p9sPL7t6wD4CyNm/D
 pix0u1MqRp3kUOTITj6DWpnIfsdjGPMAl/0i4ktE=
Date: Sat, 29 Feb 2020 20:04:45 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= (VMware) <thomas_os@shipmail.org>
Subject: Re: [PATCH 1/8] mm: Introduce vma_is_special_huge
Message-Id: <20200229200445.a30567add92de324fd1987f0@linux-foundation.org>
In-Reply-To: <20191203132239.5910-2-thomas_os@shipmail.org>
References: <20191203132239.5910-1-thomas_os@shipmail.org>
 <20191203132239.5910-2-thomas_os@shipmail.org>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
Mime-Version: 1.0
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
Cc: Thomas Hellstrom <thellstrom@vmware.com>, Michal Hocko <mhocko@suse.com>,
 pv-drivers@vmware.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 =?ISO-8859-1?Q?J=E9r=F4me?= Glisse <jglisse@redhat.com>,
 linux-graphics-maintainer@vmware.com,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 Ralph Campbell <rcampbell@nvidia.com>,
 Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue,  3 Dec 2019 14:22:32 +0100 Thomas Hellstr=F6m (VMware) <thomas_os@s=
hipmail.org> wrote:

> From: Thomas Hellstrom <thellstrom@vmware.com>
> =

> For VM_PFNMAP and VM_MIXEDMAP vmas that want to support transhuge pages
> and -page table entries, introduce vma_is_special_huge() that takes the
> same codepaths as vma_is_dax().
> =

> The use of "special" follows the definition in memory.c, vm_normal_page():
> "Special" mappings do not wish to be associated with a "struct page"
> (either it doesn't exist, or it exists but they don't want to touch it)
> =

> For PAGE_SIZE pages, "special" is determined per page table entry to be
> able to deal with COW pages. But since we don't have huge COW pages,
> we can classify a vma as either "special huge" or "normal huge".
> =

> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@ -2822,6 +2822,12 @@ extern long copy_huge_page_from_user(struct page *=
dst_page,
>  				const void __user *usr_src,
>  				unsigned int pages_per_huge_page,
>  				bool allow_pagefault);
> +static inline bool vma_is_special_huge(struct vm_area_struct *vma)
> +{
> +	return vma_is_dax(vma) || (vma->vm_file &&
> +				   (vma->vm_flags & (VM_PFNMAP | VM_MIXEDMAP)));
> +}

Some documetnation would be nice.  Not only what it does, but why it
does it.  ie, what is the *meaning* of vma_is_spacial_huge(vma)=3D=3Dtrue?


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
