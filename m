Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AE9824FE9E1
	for <lists+dri-devel@lfdr.de>; Tue, 12 Apr 2022 23:18:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A4C010E7E5;
	Tue, 12 Apr 2022 21:18:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0C1B10E7E5
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Apr 2022 21:18:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=cyVUQoF5FLTGwJesMJ+yRkVIcAvwZ1zngJkSXYEZEGQ=; b=UwYHSgvbWSCe4hdu6JlE+pm8qv
 JHQ1/ncPQlLB8arQQ+NKk/zUTQ49AdGC2JvwBuQnVoLeBtlzUohb8EGBkqP3Aj5GwKUllmOABLofu
 nJGC50eEyhXehObrFHzsXDsyVeUqmgvYK2Gi+4Vza1l8KsXJ9EZPCz/x9ZhTqZVk4hdsMYWn/K/Mn
 veKVfx7PCj7Z7cvPXDlGX0UOvP5DTb3uH5D5tspjoRh+sCxWEWvbFe1cezmwmUE3lCWgmpBvTJA9E
 FS9xRv9GX8FgyUMfsFS74hPDNYZy0tBS4nGo7yn4AZAmgmqSZ0hGJF8Gnxsw6NRq9leh5uTjvvea/
 bgNCIkzA==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1neNta-00DhXR-V7; Tue, 12 Apr 2022 21:17:54 +0000
Date: Tue, 12 Apr 2022 22:17:54 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [Bug 215807] Bad page state in process systemd-udevd
Message-ID: <YlXsgjmjrkvnjXQB@casper.infradead.org>
References: <bug-215807-27@https.bugzilla.kernel.org/>
 <bug-215807-27-EqWyiHqWrc@https.bugzilla.kernel.org/>
 <20220412140804.e73d55d5d192f2198c9278ec@linux-foundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220412140804.e73d55d5d192f2198c9278ec@linux-foundation.org>
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
Cc: linux-mm@kvack.org, parag.lkml@gmail.com, bugzilla-daemon@kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Apr 12, 2022 at 02:08:04PM -0700, Andrew Morton wrote:
> hm, that's my third `bad page' report in three emails.  But I'm not
> seeing a pattern - this one might be a DRM thing.

I noticed it was an order-9 page and was set to take responsibility
for it, but it's clearly not a filesystem page, but a DRM page.
Let me help decode this for the benefit of the DRM folks.

> > [    8.453363] amdgpu: Topology: Add CPU node
> > [    8.467169] BUG: Bad page state in process systemd-udevd  pfn:11b403
> > [    8.467180] fbcon: Taking over console
> > [    8.467188] page:000000002cc06944 refcount:0 mapcount:0
> > mapping:0000000000000000 index:0x3 pfn:0x11b403
> > [    8.467195] head:00000000aa25e58e order:9 compound_mapcount:0
> > compound_pincount:0
> > [    8.467198] flags: 0x17ffffc0010000(head|node=0|zone=2|lastcpupid=0x1fffff)
> > [    8.467205] raw: 0017ffffc0000000 fffff2da846d0001 fffff2da846d00c8
> > 0000000000000000
> > [    8.467208] raw: 0000000000000000 0000000000000000 00000000ffffffff
> > 0000000000000000
> > [    8.467210] head: 0017ffffc0010000 0000000000000000 dead000000000122
> > 0000000000000000
> > [    8.467212] head: 0000000000000000 0000000000000000 00000000ffffffff
> > 0000000000000000
> > [    8.467214] page dumped because: corrupted mapping in tail page

Tail pages are all supposed to have page->mapping == TAIL_MAPPING
(0x400 + POISON_POINTER_DELTA).  This one has page->mapping == NULL.
I say "all", but tail pages 1 and 2 aren't checked because those
get other useful things stored in them instead.  This is tail page
number 3, so it's the first one checked.

So DRM has probably been overly enthusiastic about cleaning up
something.  Hope that's helpful!
