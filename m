Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88540C926A6
	for <lists+dri-devel@lfdr.de>; Fri, 28 Nov 2025 16:10:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 812BA10E0B5;
	Fri, 28 Nov 2025 15:09:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.b="nAZtPLjV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B14510E0B5
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Nov 2025 15:09:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=deXTwbDIKs9JQLaQPnholrd8uRGRoXWWQE0vJWC870s=; b=nAZtPLjV8PFjQDFEYcBUeJl4cx
 sUhx+y7Yk8L6G787cH2nx2wVLFyNpxdWD0ERiN3dK4tFZR2wgSyEnW5gitBxk/69XNE2pLbLR9gJZ
 rhDhKLd3shzKnQZRZ7uu7huJUVTwBVM80/EErs4R38LJ2Q0WSkV1pBxoBsKRZQxCr1cqE680IZ7Dt
 oEQwqfo3ScvTk5SBwsKUNAr8kHCYIMqmQ4YYYbpruVX9FfzGoJyGFf5YxUeBLjt3qM6xYWhdcBjxb
 YI/7cNQQfbE7NF9MfemZQ5+EQeZKRYVjkJzsYUvRe4zMoytWH46VhJ9vfUbs1eiJLETqo4U9Co47E
 6ZbLcNSA==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red
 Hat Linux)) id 1vP06Q-0000000DM7x-0Atr;
 Fri, 28 Nov 2025 15:09:42 +0000
Date: Fri, 28 Nov 2025 15:09:41 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Jordan Niethe <jniethe@nvidia.com>
Cc: linux-mm@kvack.org, balbirs@nvidia.com, matthew.brost@intel.com,
 akpm@linux-foundation.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, david@redhat.com, ziy@nvidia.com,
 apopple@nvidia.com, lorenzo.stoakes@oracle.com, lyude@redhat.com,
 dakr@kernel.org, airlied@gmail.com, simona@ffwll.ch,
 rcampbell@nvidia.com, mpenttil@redhat.com, jgg@nvidia.com
Subject: Re: [RFC PATCH 0/6] Remove device private pages from physical
 address space
Message-ID: <aSm7NTtNfGcXbuwr@casper.infradead.org>
References: <20251128044146.80050-1-jniethe@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251128044146.80050-1-jniethe@nvidia.com>
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

On Fri, Nov 28, 2025 at 03:41:40PM +1100, Jordan Niethe wrote:
> A consequence of placing the device private pages outside of the
> physical address space is that they no longer have a PFN. However, it is
> still necessary to be able to look up a corresponding device private
> page from a device private PTE entry, which means that we still require
> some way to index into this device private address space. This leads to
> the idea of a device private PFN. This is like a PFN but instead of

Don't call it a "device private PFN".  That's going to lead to
confusion.  Device private index?  Device memory index?

> By removing the device private pages from the physical address space,
> this RFC also opens up the possibility to moving away from tracking
> device private memory using struct pages in the future. This is
> desirable as on systems with large amounts of memory these device
> private struct pages use a signifiant amount of memory and take a
> significant amount of time to initialize.

I did tell Jerome he was making a huge mistake with his design, but
he forced it in anyway.
