Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B69EBDFD95
	for <lists+dri-devel@lfdr.de>; Wed, 15 Oct 2025 19:28:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC4E810E89B;
	Wed, 15 Oct 2025 17:28:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.b="O/AIKjGH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFBEE10E89A;
 Wed, 15 Oct 2025 17:28:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=OHD1PbWJgOF9XOuL5HA73G273J12JtIymtajQ7fqsQ4=; b=O/AIKjGH3q2vAiI35ZMnFpDXL9
 C+s4LMohbjn1T1gowDff1QATHCAKFtMlK/vQLkE6V3EMtM4PyVK7+qNjjH8p/SMgAOrlYDh7E5JNj
 s6YHmSgHX3PZeq5i2cQTrpXa6f/EsBMgS+kaQRLCyHVc51UqP5td4HDZnJ8pJHHOP2BQCs6Kdb3dl
 hDdhTVC23HoZ8cjO9DV1mJas9/6i26NP5x/fG5klzP8VqwqGrFQpNOM+S4KcTQZO8AUi9LAwkUeyi
 W84rWDUlfmhJWd6nz90Jtg0an/C/x6jqBk720u/RVEgVMVk7m7XzfqEOkFEtR41Jp2xUsiPZ+01/Z
 FUrLjK/g==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red
 Hat Linux)) id 1v95I1-00000002tYN-00lF;
 Wed, 15 Oct 2025 17:27:53 +0000
Date: Wed, 15 Oct 2025 18:27:52 +0100
From: Matthew Wilcox <willy@infradead.org>
To: =?iso-8859-1?Q?Lo=EFc?= Molinari <loic.molinari@collabora.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>,
 Liviu Dudau <liviu.dudau@arm.com>, Melissa Wen <mwen@igalia.com>,
 =?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>,
 Hugh Dickins <hughd@google.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Al Viro <viro@zeniv.linux.org.uk>,
 =?utf-8?Q?Miko=C5=82aj?= Wasiak <mikolaj.wasiak@intel.com>,
 Christian Brauner <brauner@kernel.org>,
 Nitin Gote <nitin.r.gote@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>, Jonathan Corbet <corbet@lwn.net>,
 Christopher Healy <healych@amazon.com>,
 Bagas Sanjaya <bagasdotme@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-mm@kvack.org, linux-doc@vger.kernel.org, kernel@collabora.com
Subject: Re: [PATCH v4 03/13] drm/shmem-helper: Map huge pages in fault
 handlers
Message-ID: <aO_ZmA6yoqbzTKt9@casper.infradead.org>
References: <20251015153018.43735-1-loic.molinari@collabora.com>
 <20251015153018.43735-4-loic.molinari@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251015153018.43735-4-loic.molinari@collabora.com>
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

On Wed, Oct 15, 2025 at 05:30:07PM +0200, Loïc Molinari wrote:

This looks fine, no need to resend to fix this, but if you'd written
the previous patch slightly differently, you'd've reduced the amount of
code you moved around in this patch, which would have made it easier to
review.

> +	/* Map a range of pages around the faulty address. */
> +	do {
> +		pfn = page_to_pfn(pages[start_pgoff]);
> +		ret = vmf_insert_pfn(vma, addr, pfn);
> +		addr += PAGE_SIZE;
> +	} while (++start_pgoff <= end_pgoff && ret == VM_FAULT_NOPAGE);

It looks to me like we have an opportunity to do better here by
adding a vmf_insert_pfns() interface.  I don't think we should delay
your patch series to add it, but let's not forget to do that; it can
have very good performnce effects on ARM to use contptes.

> @@ -617,8 +645,9 @@ static vm_fault_t drm_gem_shmem_fault(struct vm_fault *vmf)
[...]
>  
> -		ret = vmf_insert_pfn(vma, vmf->address, page_to_pfn(page));
> +	if (drm_gem_shmem_map_pmd(vmf, vmf->address, pages[page_offset])) {
> +		ret = VM_FAULT_NOPAGE;
> +		goto out;
>  	}

Does this actually work?
