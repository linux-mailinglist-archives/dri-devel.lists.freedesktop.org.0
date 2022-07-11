Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7624E5704D5
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jul 2022 16:00:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84F588E980;
	Mon, 11 Jul 2022 14:00:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D8AD8E987;
 Mon, 11 Jul 2022 14:00:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=rcQF7iugd2cu8An1gTYADBIF1lWVn+jc8HlNL1UeLoM=; b=gVStaT9Kg0MMbppoH83xjPscGs
 IFbnv81Y2Qux27iyh2Ytl5RYRUv/rrc/FF853SfUcRswpEscsP7xj4ckdRrrmFlKVPdCkfjDFWPJV
 a6BE4mHwC98MjNV7ILSxNmudVQYo/YACzEjfygVSi9TN8tlCjTOLQQUWznoWY739TfIIQPlyYa2mY
 OsowUrkakCcxofte6qfDxJ43ipH5CUD9JiHbZadiUR5ps47qHAgjlAHSPevIEYvLqBZsGOC2JKq8i
 KFOLAViCUYEoLKdytMRp4fnJce4T+X2CknDxNQzRotjz/y2NXtCO92RF15eLW0OoWR33g46bZ3vax
 fHzP8VIg==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1oAtxM-0060dO-5n; Mon, 11 Jul 2022 14:00:12 +0000
Date: Mon, 11 Jul 2022 15:00:12 +0100
From: Matthew Wilcox <willy@infradead.org>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v8 07/15] mm/gup: migrate device coherent pages when
 pinning instead of failing
Message-ID: <Ysws7LOirtQ07JG/@casper.infradead.org>
References: <20220707190349.9778-1-alex.sierra@amd.com>
 <20220707190349.9778-8-alex.sierra@amd.com>
 <2c4dd559-4fa9-f874-934f-d6b674543d0f@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2c4dd559-4fa9-f874-934f-d6b674543d0f@redhat.com>
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
Cc: Alex Sierra <alex.sierra@amd.com>, rcampbell@nvidia.com,
 Felix.Kuehling@amd.com, apopple@nvidia.com, amd-gfx@lists.freedesktop.org,
 linux-xfs@vger.kernel.org, linux-mm@kvack.org, jglisse@redhat.com,
 dri-devel@lists.freedesktop.org, jgg@nvidia.com, akpm@linux-foundation.org,
 linux-ext4@vger.kernel.org, hch@lst.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jul 11, 2022 at 03:35:42PM +0200, David Hildenbrand wrote:
> > +		/*
> > +		 * Device coherent pages are managed by a driver and should not
> > +		 * be pinned indefinitely as it prevents the driver moving the
> > +		 * page. So when trying to pin with FOLL_LONGTERM instead try
> > +		 * to migrate the page out of device memory.
> > +		 */
> > +		if (folio_is_device_coherent(folio)) {
> > +			WARN_ON_ONCE(PageCompound(&folio->page));
> 
> Maybe that belongs into migrate_device_page()?

... and should be simply WARN_ON_ONCE(folio_test_large(folio)).
No need to go converting it back into a page in order to test things
that can't possibly be true.
