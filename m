Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CF6A9E2C5A
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2024 20:51:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C21910EB2E;
	Tue,  3 Dec 2024 19:51:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.b="ErvReudg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D19B10E040
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Dec 2024 19:51:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Type:MIME-Version:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=jH4yBcVS3NQ7YkkW1qJk55K1usaBZKjmOXquBiHvrjw=; b=ErvReudgtvG3n8VmPJznERacAO
 gk4Pf7scNBorVKH+1cqmdv4JTXWzGWn6Z7UR3F+AKQQdw5sW9CvvuH/qyFrioEEHA9EXYAkTIpFlQ
 4WwWrH5W42VQ9qww9hisV7KI/8I3kNMbEaIQ12EtZV1tXER59AzgH9QeQfKzG1jPWWvSGwNHrkhy+
 jqL9McfbrBzW114zT7FxBIpz7GluKjAaN93e/oqUNJKo71VCXXzMQiSsU3aNx/CW9v8HgxwgesSiP
 NGnPSE6o75ToxpjENiORz5dboTDi0j4hnCTHJ0gawMr82M86Twip69sZ+Wpt2o10YUCyVFDXRsfdc
 dil90xNw==;
Received: from willy by casper.infradead.org with local (Exim 4.98 #2 (Red Hat
 Linux)) id 1tIYvb-0000000A9oE-25ro; Tue, 03 Dec 2024 19:51:23 +0000
Date: Tue, 3 Dec 2024 19:51:23 +0000
From: Matthew Wilcox <willy@infradead.org>
To: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-s390@vger.kernel.org
Subject: Removing page->index
Message-ID: <Z09hOy-UY9KC8WMb@casper.infradead.org>
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

I've pushed out a new tree to
git://git.infradead.org/users/willy/pagecache.git shrunk-page
aka
http://git.infradead.org/?p=users/willy/pagecache.git;a=shortlog;h=refs/heads/shrunk-page

The observant will notice that it doesn't actually shrink struct page
yet.  However, we're getting close.  What it does do is rename
page->index to page->__folio_index to prevent new users of page->index
from showing up.

There are (I believe) three build failures in that tree:

 - fb_defio
 - fbtft
 - s390's gmap (and vsie?  is that the same thing?)

Other than that, allmodconfig builds on x86 and I'm convinced the build
bots will tell me about anything else I missed.

Lorenzo is working on fb_defio and fbtft will come along for the ride
(it's a debug printk, so could just be deleted).

s390 is complicated.  I'd really appreciate some help.

The next step is to feed most of the patches through the appropriate
subsystems.  Some have already gone into various maintainer trees
(thanks!)


There are still many more steps to go after this; eliminating memcg_data
is closest to complete, and after that will come (in some order)
eliminating ->lru, ->mapping, ->refcount and ->mapcount.  We also need
to move page_pool out into its own structure.
