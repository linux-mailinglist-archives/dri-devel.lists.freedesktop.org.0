Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 086A448AF0C
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jan 2022 15:01:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DFED10EA1E;
	Tue, 11 Jan 2022 14:01:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E0C110EA1E
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jan 2022 14:01:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=LF/mpBO5j1rUYISJ5kTuyMtADrx3r6gpROrYNypLtkw=; b=ve3hDqC3IqQ2LgppYwfdzXoY6L
 94cU5qrji9ovRx53/JbeLkUzFgUGK/W5Ml4v53FUWv9U64eXrdTIFJjrlU50FtLUjA0HLjJukmRgP
 oSiTNGxKDnbCl1OcOgro86+aPljLxTeQf7TUyiQldEqqNwih2GdrvLilg3TIf1m0UOaQlpNfJ6nz4
 GTzVHHf8oeSCEvM4W5SHosSz4c7kAW9OtkN3pugOIguBCf4/YzktoWpU0xZpi/4EWan+TDW8LS2zQ
 v8KaAtChv4JZF7/TsQ3TVSBIKkMEb48fzI/9DBiN0KYxGZc2Rx9IVODfiXezpHiOc0ns/oOiiS7I5
 TCQdL+ag==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1n7Hi9-003Ipl-Pe; Tue, 11 Jan 2022 14:01:17 +0000
Date: Tue, 11 Jan 2022 14:01:17 +0000
From: Matthew Wilcox <willy@infradead.org>
To: John Hubbard <jhubbard@nvidia.com>
Subject: Re: Phyr Starter
Message-ID: <Yd2NraXh3ka8PdrQ@casper.infradead.org>
References: <YdyKWeU0HTv8m7wD@casper.infradead.org>
 <82989486-3780-f0aa-c13d-994e97d4ac89@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <82989486-3780-f0aa-c13d-994e97d4ac89@nvidia.com>
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
Cc: nvdimm@lists.linux.dev, linux-rdma@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Ming Lei <ming.lei@redhat.com>, linux-block@vger.kernel.org,
 linux-mm@kvack.org, Jason Gunthorpe <jgg@nvidia.com>,
 Joao Martins <joao.m.martins@oracle.com>,
 Logan Gunthorpe <logang@deltatee.com>, Christoph Hellwig <hch@lst.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jan 11, 2022 at 12:17:18AM -0800, John Hubbard wrote:
> Zooming in on the pinning aspect for a moment: last time I attempted to
> convert O_DIRECT callers from gup to pup, I recall wanting very much to
> record, in each bio_vec, whether these pages were acquired via FOLL_PIN,
> or some non-FOLL_PIN method. Because at the end of the IO, it is not
> easy to disentangle which pages require put_page() and which require
> unpin_user_page*().
> 
> And changing the bio_vec for *that* purpose was not really acceptable.
> 
> But now that you're looking to change it in a big way (and with some
> spare bits avaiable...oohh!), maybe I can go that direction after all.
> 
> Or, are you looking at a design in which any phyr is implicitly FOLL_PIN'd
> if it exists at all?

That.  I think there's still good reasons to keep a single-page (or
maybe dual-page) GUP around, but no reason to mix it with ranges.

> Or any other thoughts in this area are very welcome.

That's there's no support for unpinning part of a range.  You pin it,
do the IO, unpin it.  That simplifies the accounting.

