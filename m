Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A97C7320F1
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jun 2023 22:34:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E9F210E073;
	Thu, 15 Jun 2023 20:34:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1133 seconds by postgrey-1.36 at gabe;
 Thu, 15 Jun 2023 20:34:37 UTC
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1EA010E073;
 Thu, 15 Jun 2023 20:34:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=6qVMM2snJT/z1+3q7iOllvvHpkI+bKo+0q0jsxvpBjg=; b=Q2dCQ3JGnKDklQMM57TVbFGdFB
 iDGe7FLLBCsANC19XWYQ2qW/dNzVqxNq5XPk92wix9OFK5mgAnfgy1+fWIFnkISpM/gOGTi+prEl1
 ceyIQ+XAblDZIvGCF+1NRxMwN36PI6oUI5ZhF761FfZRKc2aWY7XW2BARpsgWMsRGQX8ACRgD9Va8
 BNuZmSrnUVV4YqLAfYEGOhUTVSK/AgQzzblIWTISlsNkQTNYBgzoFtmNM3iShP16ZzhFXbGeQbViW
 uDoO6tR2eXpmKWfU9e0r/PR7TbvfT8gd/swGNbUHGJko93EmkO7jpEhdB8hZNvUHwYKXLo0vQo0+t
 IXJ7iVPg==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1q9tNO-0082yB-UE; Thu, 15 Jun 2023 20:15:26 +0000
Date: Thu, 15 Jun 2023 21:15:26 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH v9 02/14] mm: move page zone helpers from mm.h to mmzone.h
Message-ID: <ZItxXny9kRDq/ryf@casper.infradead.org>
References: <20220715150521.18165-1-alex.sierra@amd.com>
 <20220715150521.18165-3-alex.sierra@amd.com> <ZItneGX+sqg7WApF@x1n>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZItneGX+sqg7WApF@x1n>
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
Cc: Alex Sierra <alex.sierra@amd.com>, rcampbell@nvidia.com, david@redhat.com,
 Felix.Kuehling@amd.com, apopple@nvidia.com, amd-gfx@lists.freedesktop.org,
 linux-xfs@vger.kernel.org, linux-mm@kvack.org, jglisse@redhat.com,
 dri-devel@lists.freedesktop.org, jgg@nvidia.com, akpm@linux-foundation.org,
 linux-ext4@vger.kernel.org, hch@lst.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jun 15, 2023 at 03:33:12PM -0400, Peter Xu wrote:
> My question is whether page_zonenum() is ready for taking all kinds of tail
> pages?
> 
> Zone device tail pages all look fine, per memmap_init_zone_device().  The
> question was other kinds of usual compound pages, like either thp or
> hugetlb.  IIUC page->flags can be uninitialized for those tail pages.

I don't think that's true.  It's my understanding that page->flags is
initialised for all pages in memmap at boot / hotplug / delayed-init
time.  So you can check things like zone, node, etc on literally any
page.  Contrariwise, those flags are not available in tail pages for
use by the entity that has allocated a compound page / large folio.

Also, I don't believe zone device pages support compound allocation.
I think they're always allocated as order-0.

