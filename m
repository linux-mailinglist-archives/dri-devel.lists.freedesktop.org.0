Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F201B4353E9
	for <lists+dri-devel@lfdr.de>; Wed, 20 Oct 2021 21:38:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B21F6E2E6;
	Wed, 20 Oct 2021 19:38:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from desiato.infradead.org (desiato.infradead.org
 [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C18C89BEC;
 Wed, 20 Oct 2021 19:38:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=25uxvcU8Q6SEEyqa5u7IFHx2RyyudtDeLjhkROKSTUk=; b=h/oQA+oze8XD4yl/NvHbXK8Yd6
 jleU0NVVf9yFgu0+diJb00fWwZ6ggm3XO5xaRJK3EIYJrafTX9uvgSwRPGAXbbsn+j6xErrcU7Grw
 GCMgyBcIFMYxiXACw2uCW1ZWYNUTbtf+4VzM0RE9UbXFb2Mj2yNa6iAcjJ7IHn9WvNt+TN+RU3d0+
 Dg5FaZu3cm89n9GsUgsdDBQ3S1X0hhv/1QC6+tCDvIkFXRtP6+gOtHmMFQGyz22GEmgVziLI70eKJ
 g4cJ/k8aXUj0kGaUMMeXXbB0gWWbhSaiXOW5WOln24rM8nlbNRe5XJX5Pe2e395ee3UElWDAda/B0
 LPCKXCsg==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=worktop.programming.kicks-ass.net)
 by desiato.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mdHPL-00B0wV-BZ; Wed, 20 Oct 2021 19:37:51 +0000
Received: by worktop.programming.kicks-ass.net (Postfix, from userid 1000)
 id 6B710986DD9; Wed, 20 Oct 2021 21:37:51 +0200 (CEST)
Date: Wed, 20 Oct 2021 21:37:51 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Christoph Hellwig <hch@lst.de>, Andrew Morton <akpm@linux-foundation.org>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Chris Wilson <chris@chris-wilson.co.uk>, linux-mm@kvack.org,
 matthew.auld@intel.com
Subject: Re: [Intel-gfx] [PATCH 2/4] mm: add a io_mapping_map_user helper
Message-ID: <20211020193751.GS174703@worktop.programming.kicks-ass.net>
References: <20210326055505.1424432-1-hch@lst.de>
 <20210326055505.1424432-3-hch@lst.de>
 <20211020154005.uk6u4ovcmlhpyubk@ldmartin-desk2>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211020154005.uk6u4ovcmlhpyubk@ldmartin-desk2>
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

On Wed, Oct 20, 2021 at 08:40:05AM -0700, Lucas De Marchi wrote:
> On Fri, Mar 26, 2021 at 06:55:03AM +0100, Christoph Hellwig wrote:
> > Add a helper that calls remap_pfn_range for an struct io_mapping, relying
> > on the pgprot pre-validation done when creating the mapping instead of
> > doing it at runtime.
> > 
> > Signed-off-by: Christoph Hellwig <hch@lst.de>
> > ---
> > include/linux/io-mapping.h |  3 +++
> > mm/Kconfig                 |  3 +++
> > mm/Makefile                |  1 +
> > mm/io-mapping.c            | 29 +++++++++++++++++++++++++++++
> > 4 files changed, 36 insertions(+)
> > create mode 100644 mm/io-mapping.c
> > 
> > diff --git a/include/linux/io-mapping.h b/include/linux/io-mapping.h
> > index c093e81310a9b3..e9743cfd858527 100644
> > --- a/include/linux/io-mapping.h
> > +++ b/include/linux/io-mapping.h
> > @@ -220,3 +220,6 @@ io_mapping_free(struct io_mapping *iomap)
> > }
> > 
> > #endif /* _LINUX_IO_MAPPING_H */
> > +
> > +int io_mapping_map_user(struct io_mapping *iomap, struct vm_area_struct *vma,
> > +		unsigned long addr, unsigned long pfn, unsigned long size);
> 
> I'm not sure what exactly brought me to check this, but while debugging
> I noticed this outside the header guard. But then after some more checks I
> saw nothing actually selects CONFIG_IO_MAPPING because commit using
> it was reverted in commit 0e4fe0c9f2f9 ("Revert "i915: use io_mapping_map_user"")
> 
> Is this something we want to re-attempt moving to mm/ ?

Yes, it would be very good to unexport apply_to_page_range(), it's a
terrible interface to expose.
