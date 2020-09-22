Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A9C3275296
	for <lists+dri-devel@lfdr.de>; Wed, 23 Sep 2020 09:54:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BB076E463;
	Wed, 23 Sep 2020 07:53:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A59346E848;
 Tue, 22 Sep 2020 11:22:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=v+IUea/CGhLMdjL8zbCOPAxfGNu+qZhlo3dcebaU5kY=; b=iLgsfzwxwT611QKOl+WmOf2wbN
 /apXK6gTmDsVL/BXsA2nSeYw00AYm7of+qlZIT5seKhZdu6vVFYUh9VHKNyMaCNUtuxTWQsjq/fQb
 o+HH9FqL3yy9RUdN/gEnhHaw8zj6LjLVf/SMpazertMDW0M+AsMsYpsjEY6RqiGrpxc2TfV1v186b
 /dak9QRJGkXVmw5CYmBXsQSP0ryzf3Fj1FCPgdtdTrj8+Ud5C+5S63kHgzqMV4tMTbzbXE/7lodhh
 8x3U5eQq2tiq0PS1EC76b9HHLbxCqMbJHon71YuO6JArA0Hf33RL3+JVtd3CmHZv47m4GshGX8kOv
 xhVaWjtQ==;
Received: from willy by casper.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1kKgMi-000579-Gi; Tue, 22 Sep 2020 11:21:44 +0000
Date: Tue, 22 Sep 2020 12:21:44 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 3/6] drm/i915: use vmap in shmem_pin_map
Message-ID: <20200922112144.GB32101@casper.infradead.org>
References: <20200918163724.2511-1-hch@lst.de>
 <20200918163724.2511-4-hch@lst.de>
 <20200921191157.GX32101@casper.infradead.org>
 <20200922062249.GA30831@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200922062249.GA30831@lst.de>
X-Mailman-Approved-At: Wed, 23 Sep 2020 07:53:20 +0000
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
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, linux-mm@kvack.org,
 Peter Zijlstra <peterz@infradead.org>, intel-gfx@lists.freedesktop.org,
 x86@kernel.org, linux-kernel@vger.kernel.org, Minchan Kim <minchan@kernel.org>,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 xen-devel@lists.xenproject.org, Andrew Morton <akpm@linux-foundation.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Nitin Gupta <ngupta@vflare.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Sep 22, 2020 at 08:22:49AM +0200, Christoph Hellwig wrote:
> On Mon, Sep 21, 2020 at 08:11:57PM +0100, Matthew Wilcox wrote:
> > This is awkward.  I'd like it if we had a vfree() variant which called
> > put_page() instead of __free_pages().  I'd like it even more if we
> > used release_pages() instead of our own loop that called put_page().
> 
> Note that we don't need a new vfree variant, we can do this manually if
> we want, take a look at kernel/dma/remap.c.  But I thought this code
> intentionally doesn't want to do that to avoid locking in the memory
> for the pages array.  Maybe the i915 maintainers can clarify.

Actually, vfree() will work today; I cc'd you on a documentation update
to make it clear that this is permitted.

From my current experience with the i915 shmem code, I think that the
i915 maintainers are experts at graphics, and are unfamiliar with the MM.
There are a number of places where they do things the hard way.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
