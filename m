Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F664A06348
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jan 2025 18:25:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F10210EC2C;
	Wed,  8 Jan 2025 17:25:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.b="DPeZlbq2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE68910EC2C
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jan 2025 17:25:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=f+VrhCVA0I2IukdomGe2XOJrgKQEjDIDWoIRbh28hMQ=; b=DPeZlbq2fcSMzeFGGMmizeZU+5
 CH9miax6p7gZPvrEvaZ5/y+rkTfOZObHy6a3N6jX0UeqWQhG8SB0ucrnXAikteceS2Vb09Ob44pDD
 /0y1qQkx0vnBcRu/iJocMGvdMa6toIcdz+pkbxCM393o2Rbe3T+v/nKGyCrvBKgQbAlp5Nd1qyV4D
 R3iiJDlkpOc1KRDj+K3Hs5XZOgzGxhzwNp6HaC0Wf5tcUJ6bl91aLfOjvQuHDZzdnOyV8q2Do+nbH
 z5KaHsddfG1YGZLC724DamnGEHPjJrSTWXxdKRFrT3xTOzU+1AEPie2u9z3pX4/DWly18nmpkolgU
 XC7+EAHQ==;
Received: from willy by casper.infradead.org with local (Exim 4.98 #2 (Red Hat
 Linux)) id 1tVZnh-00000002DWW-3y85; Wed, 08 Jan 2025 17:25:02 +0000
Date: Wed, 8 Jan 2025 17:25:01 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Jaya Kumar <jayalk@intworks.biz>, Simona Vetter <simona@ffwll.ch>,
 Helge Deller <deller@gmx.de>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, David Hildenbrand <david@redhat.com>
Subject: Re: [RFC PATCH 2/3] mm: provide rmap_wrprotect_file_page() function
Message-ID: <Z3607T2A-pukkuQj@casper.infradead.org>
References: <cover.1736352361.git.lorenzo.stoakes@oracle.com>
 <701a67692d5bf9c8424cdbda103c988bbb278e38.1736352361.git.lorenzo.stoakes@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <701a67692d5bf9c8424cdbda103c988bbb278e38.1736352361.git.lorenzo.stoakes@oracle.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 08, 2025 at 04:18:41PM +0000, Lorenzo Stoakes wrote:
> +++ b/include/linux/rmap.h
> @@ -754,6 +754,26 @@ unsigned long page_address_in_vma(const struct folio *folio,
>   */
>  int folio_mkclean(struct folio *);
>  
> +/**

The kerneldoc comment should be with the implementation, not the
prototype.

> + * rmap_wrprotect_file_page() - Traverses the reverse mapping, finding all VMAs
> + * which contain a shared mapping of the single page at PFN @pfn in @mapping at
> + * offset @pgoff and write-protecting the mappings.

After the '-' should come a _short_ description ... maybe "Write protect
all mappings of this page".

> + * The PFN mapped does not have to be a folio, but rather can be a kernel
> + * allocation that is mapped into userland. We therefore do not require that the
> + * PFN maps to a folio with a valid mapping or index field, rather these are
> + * specified in @mapping and @pgoff.
> + *
> + * @mapping:	The mapping whose reverse mapping should be traversed.
> + * @pgoff:	The page offset at which @pfn is mapped within @mapping.
> + * @nr_pages:	The number of physically contiguous base pages spanned.
> + * @pfn:	The PFN of the memory mapped in @mapping at @pgoff.

The description of the params comes between the short and full
description of the function.

> + * Return the number of write-protected PTEs, or an error.

colon after Return: so it becomes a section.

> +int rmap_wrprotect_file_page(struct address_space *mapping, pgoff_t pgoff,
> +		unsigned long nr_pages, unsigned long pfn)
> +{
> +	struct wrprotect_file_state state = {
> +		.cleaned = 0,
> +		.pgoff = pgoff,
> +		.pfn = pfn,
> +		.nr_pages = nr_pages,
> +	};
> +	struct rmap_walk_control rwc = {
> +		.arg = (void *)&state,
> +		.rmap_one = rmap_wrprotect_file_one,
> +		.invalid_vma = invalid_mkclean_vma,
> +	};
> +
> +	if (!mapping)
> +		return 0;

Should it be valid to pass in NULL?

