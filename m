Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EEE08396DB
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jan 2024 18:49:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CA8810E644;
	Tue, 23 Jan 2024 17:49:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1583 seconds by postgrey-1.36 at gabe;
 Tue, 23 Jan 2024 17:49:45 UTC
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4205910E644
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jan 2024 17:49:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Type:MIME-Version:Message-ID:
 Subject:To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=zTQsORFLC6fYhfsfPEKgNKuKiXnrjQDCNN/vaGQwoOc=; b=HtFk/wxXzP3j+1B+UYOoNdpJVC
 lKb66WmeXCRmhmb61slllPnGtUpZbEqXvKc+PhLaySfvnQjOKBdYgIAUDsWr/cgw64g2fL80FEZGc
 tPKgJ+2nUN7lU+BkYthbINdNEPNHqdFXeX2P3nOV5ryObtY1reTQ7Jci8zqbmEEXjq7ghNt65n13y
 SbHatvktIyzyeOh2Nkezoj6cciPDhkjybwL9OPkf4lz/62b2mmchurI+bmrNvo7TkRJ/ZbRiruNIg
 WT5aSIfZRl7W6B1SuggIdsrNnoAeYZqFAbCBknLpv+Zu5rrygJD1os/Vei31TbKtcSusBVD8Y7aJo
 OY9HZJfg==;
Received: from willy by casper.infradead.org with local (Exim 4.97.1 #2 (Red
 Hat Linux)) id 1rSKSF-00000003oVe-1WZ9;
 Tue, 23 Jan 2024 17:20:55 +0000
Date: Tue, 23 Jan 2024 17:20:55 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Helge Deller <deller@gmx.de>, Thomas Zimmermann <tzimmermann@suse.de>,
 Jaya Kumar <jayalk@intworks.biz>, Daniel Vetter <daniel@ffwll.ch>,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org
Subject: fb_defio and page->mapping
Message-ID: <Za_1d4MVxKeQOP9B@casper.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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

We're currently trying to remove page->mapping from the entire kernel.
This has me interested in fb_defio and since I made such a mess of it
with commits ccf953d8f3d6 / 0b78f8bcf495, I'd like to discuss what to
do before diving in.

Folios continue to have a mapping.  So we can effectively do
page_folio(page)->mapping (today that's calling compound_head() to get
to the head page; eventually it's a separate allocation).

But now I look at commit 56c134f7f1b5, I'm a little scared.
Apparently pages are being allocated from shmem and being mapped by
fb_deferred_io_fault()?  This line:

                page->mapping = vmf->vma->vm_file->f_mapping;

initially appears harmless for shmem files (because that's presumably
a noop), but it's only a noop for head pages.  If shmem allocates a
compound page (ie a 2MB THP today), you'll overlay some information
stored in the second and third pages; looks like _entire_mapcount
and _deferred_list.prev (but we do shift those fields around without
regard to what the fb_defio driver is doing).  Even if you've disabled
THP today, setting page->mapping to NULL in fb_deferred_io_lastclose()
for a shmem page is a really bad idea.

I'd like to avoid fb_defio playing with page->mapping at all.
As I understand it, the only reason to set page->mapping is so that
page_mkclean() works.  But there are all kinds of assumptions in
page_mkclean() (now essentially folio_mkclean()) that we're dealing with
file-backed or anonymous memory.  I wonder if we might be better off
calling pfn_mkclean_range() for each VMA which maps these allocations?
You'd have to keep track of each VMA yourself (I think?)  but it would
avoid messing with page->mapping.

Anyway, I don't know enough about DRM.  There might be something
unutterably obvious we could do to fix this.
