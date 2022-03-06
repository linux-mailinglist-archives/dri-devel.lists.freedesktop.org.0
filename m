Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02DEB4CEE40
	for <lists+dri-devel@lfdr.de>; Sun,  6 Mar 2022 23:44:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87A5610E066;
	Sun,  6 Mar 2022 22:44:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4882710E039;
 Sun,  6 Mar 2022 22:44:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=+i9vRmNI7+eHzPPl/RuOFsNSwoWFlLZKj3k3cgvkPwE=; b=C7wEujQbkNSEL8UesYZpUV1Owu
 5y5vzvRLA9jhhEy3AtVVgWpwbbHaPsCo5A/wYRNy+lJDxAg7gPm6kHeHB+b/2X7tVihHQ1+Wh72Tn
 RvWNFEYZgum5b1z+ZKpf0mF4Ge8XXlI5X+rbSBmslYhDGMc0PNpXt+zDNP/3EVJ9hDcAybpYQ5Zyb
 j5j7LEGQZHGR1bi8fvYz+db4QRDs6k/aVLppY9CfeBfPvoevFmwRReAxGu2Vd0KABcvks6N6sdx1d
 XfJe7O5Zo0QKkhB+1K1wyL3WV9NaZ5ZaZp8DQ7CGhzYQ8Dh7QzNM2aGJ5dYTiP9YgNsYWT9a8BGUI
 LjpaIgfQ==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1nQzb9-00EfoG-RJ; Sun, 06 Mar 2022 22:43:32 +0000
Date: Sun, 6 Mar 2022 22:43:31 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Jarkko Sakkinen <jarkko@kernel.org>
Subject: Re: [PATCH RFC 1/3] mm: Add f_ops->populate()
Message-ID: <YiU5E6qqYAI+WPw9@casper.infradead.org>
References: <20220306053211.135762-1-jarkko@kernel.org>
 <20220306053211.135762-2-jarkko@kernel.org>
 <YiSGgCV9u9NglYsM@kroah.com> <YiTpQTM+V6rlDy6G@iki.fi>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YiTpQTM+V6rlDy6G@iki.fi>
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
Cc: zhangyiru <zhangyiru3@huawei.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Dave Hansen <dave.hansen@linux.intel.com>, dri-devel@lists.freedesktop.org,
 Chris Wilson <chris@chris-wilson.co.uk>, linux-mm@kvack.org,
 Jason Ekstrand <jason@jlekstrand.net>,
 Alexander Mikhalitsyn <alexander.mikhalitsyn@virtuozzo.com>,
 Florian Fainelli <f.fainelli@gmail.com>, linux-unionfs@vger.kernel.org,
 codalist@coda.cs.cmu.edu, Matthew Auld <matthew.auld@intel.com>,
 Vasily Averin <vvs@virtuozzo.com>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, linux-mips@vger.kernel.org,
 Shakeel Butt <shakeelb@google.com>,
 Reinette Chatre <reinette.chatre@intel.com>, linux-sgx@vger.kernel.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Nathaniel McCallum <nathaniel@profian.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>, linux-kernel@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Alexey Gladkov <legion@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Mar 06, 2022 at 07:02:57PM +0200, Jarkko Sakkinen wrote:
> So can I conclude from this that in general having populate available for
> device memory is something horrid, or just the implementation path?

You haven't even attempted to explain what the problem is you're trying
to solve.  You've shown up with some terrible code and said "Hey, is
this a good idea".  No, no, it's not.
