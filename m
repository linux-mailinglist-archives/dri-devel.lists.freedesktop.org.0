Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E04B13952F5
	for <lists+dri-devel@lfdr.de>; Sun, 30 May 2021 23:14:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23E026E40B;
	Sun, 30 May 2021 21:14:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 154D06E40B
 for <dri-devel@lists.freedesktop.org>; Sun, 30 May 2021 21:14:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=yW68hQEkpPiNL7uFDxA39zvaW5WfzJ0CVb//k2zxdsE=; b=SvD1BTau2uhxHeBp7pn7JMUXfw
 08wnL7Y1tXf9cpMlwCv5fEUriKCRdaRXANNmc+4lPHvrdbvhJ5GRsWYFfqV/myItaPLvSEyqBdchZ
 6YkKnb560Zk4AGx5nfjel1cWtxU5EEBuRHQrmMoYeaJdfsDNKDpamtsROTId1ZH1KKkHDT+6hBgyU
 +clUPI2COgBZSDGLDYRaW15YSbK3OoeBjICDjc5J1nBvRZWaql0tuDdB0m0cekw13zxgtdo0UW9eb
 TAc0qGlgR1cjgkXYcCzDqE2DDKJLSoylZhoD3fgtglvLEEEzBPax465sN9mpqRZVA0izr6+yi4l+h
 roYFS5/w==;
Received: from willy by casper.infradead.org with local (Exim 4.94 #2 (Red Hat
 Linux)) id 1lnSlK-008Pdd-7c; Sun, 30 May 2021 21:14:25 +0000
Date: Sun, 30 May 2021 22:14:22 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Nathan Chancellor <nathan@kernel.org>
Subject: Re: [PATCH v2] fb_defio: Remove custom address_space_operations
Message-ID: <YLQALv2YENIDh77N@casper.infradead.org>
References: <20210310185530.1053320-1-willy@infradead.org>
 <YLPjwUUmHDRjyPpR@Ryzen-9-3900X.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YLPjwUUmHDRjyPpR@Ryzen-9-3900X.localdomain>
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
Cc: linux-fbdev@vger.kernel.org, linux-mm@kvack.org,
 Jani Nikula <jani.nikula@intel.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 William Kucharski <william.kucharski@oracle.com>,
 Ian Campbell <ijc@hellion.org.uk>, linux-fsdevel@vger.kernel.org,
 Jaya Kumar <jayakumar.lkml@gmail.com>, Christoph Hellwig <hch@lst.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, May 30, 2021 at 12:13:05PM -0700, Nathan Chancellor wrote:
> Hi Matthew,
> 
> On Wed, Mar 10, 2021 at 06:55:30PM +0000, Matthew Wilcox (Oracle) wrote:
> > There's no need to give the page an address_space.  Leaving the
> > page->mapping as NULL will cause the VM to handle set_page_dirty()
> > the same way that it's handled now, and that was the only reason to
> > set the address_space in the first place.
> > 
> > Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
> > Reviewed-by: Christoph Hellwig <hch@lst.de>
> > Reviewed-by: William Kucharski <william.kucharski@oracle.com>
> 
> This patch in mainline as commit ccf953d8f3d6 ("fb_defio: Remove custom
> address_space_operations") causes my Hyper-V based VM to no longer make
> it to a graphical environment.

Hi Nathan,

Thanks for the report.  I sent Daniel a revert patch with a full
explanation last week, which I assume he'll queue up for a pull soon.
You can just git revert ccf953d8f3d6 for yourself until that shows up.
Sorry for the inconvenience.
