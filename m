Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 693A77A688A
	for <lists+dri-devel@lfdr.de>; Tue, 19 Sep 2023 18:03:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A019A10E27F;
	Tue, 19 Sep 2023 16:03:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BE5F10E27F;
 Tue, 19 Sep 2023 16:03:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=dZMuR0d3fMuzTTg9AbhRGR2xkVbdfI0ojr0EnSeYVZs=; b=nNc6yhOtVNP+puR0lYFU0ZIT0s
 0XPpHQJ/LVJwC13oib4Qqkf3m8XKUagH7maED5JTQb786bFBCmxX3SqbkCk8UK4PZyaiceOf96NLi
 keLbH+TfFQNorG6OTLMcfZCwjxtLeechmefl7gvPQ6XARJjNcMJQPUqrc++9JfWafDIu5gODO+M6o
 ViopTh0QbLShwC3C+onnAmVxezWMNRXpLGEvPi2Wb7JhPwM+fjGtTIJupOd9pWkmeiFACxEQCdqPp
 cxVIwioSzdha0hIz2vp2TFnaGfF8CbCX0AyHBQJ77A5glt5Ty4nGvJfnwrj/pe8HFiSx4yGieBKAs
 l/6a7d2w==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1qidBi-000VvE-KN; Tue, 19 Sep 2023 16:02:58 +0000
Date: Tue, 19 Sep 2023 17:02:58 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Oleksandr Natalenko <oleksandr@natalenko.name>
Subject: Re: [REGRESSION] [BISECTED] Panic in gen8_ggtt_insert_entries() with
 v6.5
Message-ID: <ZQnGMtm7zJ9E9a8R@casper.infradead.org>
References: <4857570.31r3eYUQgx@natalenko.name>
 <6287208.lOV4Wx5bFT@natalenko.name>
 <ZQnBrLCPnZfG0A1s@casper.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZQnBrLCPnZfG0A1s@casper.infradead.org>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Aravind Iddamsetty <aravind.iddamsetty@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Matt Roper <matthew.d.roper@intel.com>, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Chris Wilson <chris@chris-wilson.co.uk>,
 Nathan Chancellor <nathan@kernel.org>, linux-mm@kvack.org,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>, Fei Yang <fei.yang@intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Sep 19, 2023 at 04:43:41PM +0100, Matthew Wilcox wrote:
> Could I ask you to try this patch?  I'll follow up with another patch
> later because I think I made another assumption that may not be valid.

Ah, no, never mind.  I thought we could start in the middle of a folio,
but we always start constructing the sg list from index 0 of the file,
so we always start at the first page of a folio.  If this patch solves
your problem, then I think we're done.
