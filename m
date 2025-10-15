Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22FAABDC538
	for <lists+dri-devel@lfdr.de>; Wed, 15 Oct 2025 05:21:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B044F10E726;
	Wed, 15 Oct 2025 03:21:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.b="FbGRZ/rx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A35C110E726
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Oct 2025 03:21:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=+vZhghVmnJMheRu4WGt6Jm2AnYVQSqZVx2x8NSyWD+o=; b=FbGRZ/rxcOCURqJcLxsSF/pzLo
 L/v76Zh8y9EcucbcRxZQdiTEwOoRt9atY8AjoeGJovLqc3ZOFKV20A5wK0SYY60r+EKhk9mS2Laj9
 IK/r3Ed693yH/8skGzY3KRygDDWQr55qBEomc9oUWSYVpD772fJuGMjM0vX3TuVog4L9huuLy7t3u
 HYWrPYsdTu2zbRQGeh/qIKgySxuFOf5cHPmVD1MrIiad82QeJOoM0muj/rDGKxmA821nM0ABgA4Yc
 +9D/MgidcOyM5+c9Y3y51X50S26WlC3W73xgXGFsl3Ql9KaRRNlIf4L4Wl+pn2fsQZE822PkVo777
 Iru8YHkw==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red
 Hat Linux)) id 1v8s4g-00000006McQ-0QcF;
 Wed, 15 Oct 2025 03:21:14 +0000
Date: Wed, 15 Oct 2025 04:21:13 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Zhaoyang Huang <huangzhaoyang@gmail.com>
Cc: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Suren Baghdasaryan <surenb@google.com>, Petr Tesarik <ptesarik@suse.com>,
 "zhaoyang.huang" <zhaoyang.huang@unisoc.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@redhat.com>,
 Mel Gorman <mgorman@techsingularity.net>, Vlastimil Babka <vbabka@suse.cz>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>,
 "T . J . Mercier" <tjmercier@google.com>,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, steve.kang@unisoc.com
Subject: Re: [PATCH 2/2] driver: dma-buf: use alloc_pages_bulk_list for
 order-0 allocation
Message-ID: <aO8TKQN6ifOSMRSC@casper.infradead.org>
References: <20251014083230.1181072-1-zhaoyang.huang@unisoc.com>
 <20251014083230.1181072-3-zhaoyang.huang@unisoc.com>
 <87953097-a105-4775-88a5-9b3a676ff139@amd.com>
 <CAGWkznGN7W-txq_G+xpZ6DtH_1DNorYc=CxqUjebo7qfB4Sxsw@mail.gmail.com>
 <ecba7133-699c-4f3e-927c-bad5bd4c36a3@amd.com>
 <20251014171003.57bbfd63@mordecai.tesarici.cz>
 <97da9924-9489-4d30-a858-8ee5c87bc031@amd.com>
 <CAGWkznGnmb=8GgcrfDvY2REHdRZYVXZy=F3thXhK0FaSoiK7tw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGWkznGnmb=8GgcrfDvY2REHdRZYVXZy=F3thXhK0FaSoiK7tw@mail.gmail.com>
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

On Wed, Oct 15, 2025 at 09:12:07AM +0800, Zhaoyang Huang wrote:
> > Could be that we need to make this behavior conditional, but somebody would need to come up with some really good arguments to justify the complexity.
> ok, should we use CONFIG_DMA_BUF_BULK_ALLOCATION or a variable
> controlled by sysfs interface?

No.  Explain what you're trying to solve, because you haven't yet.
