Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FEEC11BEAF
	for <lists+dri-devel@lfdr.de>; Wed, 11 Dec 2019 21:57:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBB2A6E0B8;
	Wed, 11 Dec 2019 20:57:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A83E96E0B8
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2019 20:57:40 +0000 (UTC)
Received: from lwn.net (localhost [127.0.0.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ms.lwn.net (Postfix) with ESMTPSA id 7D799739;
 Wed, 11 Dec 2019 20:57:38 +0000 (UTC)
Date: Wed, 11 Dec 2019 13:57:37 -0700
From: Jonathan Corbet <corbet@lwn.net>
To: John Hubbard <jhubbard@nvidia.com>
Subject: Re: [PATCH v9 10/25] mm/gup: introduce pin_user_pages*() and FOLL_PIN
Message-ID: <20191211135737.581add2f@lwn.net>
In-Reply-To: <20191211025318.457113-11-jhubbard@nvidia.com>
References: <20191211025318.457113-1-jhubbard@nvidia.com>
 <20191211025318.457113-11-jhubbard@nvidia.com>
Organization: LWN.net
MIME-Version: 1.0
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
Cc: Michal Hocko <mhocko@suse.com>, Jan Kara <jack@suse.cz>,
 kvm@vger.kernel.org, linux-doc@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Dave Chinner <david@fromorbit.com>,
 dri-devel@lists.freedesktop.org, LKML <linux-kernel@vger.kernel.org>,
 linux-mm@kvack.org, Paul Mackerras <paulus@samba.org>,
 linux-kselftest@vger.kernel.org, Ira Weiny <ira.weiny@intel.com>,
 linux-rdma@vger.kernel.org, Michael Ellerman <mpe@ellerman.id.au>,
 Mike Rapoport <rppt@linux.ibm.com>, Christoph Hellwig <hch@infradead.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, Vlastimil Babka <vbabka@suse.cz>,
 =?UTF-8?B?QmrDtnJuIFQ=?= =?UTF-8?B?w7ZwZWw=?= <bjorn.topel@intel.com>,
 linux-media@vger.kernel.org, Shuah Khan <shuah@kernel.org>,
 linux-block@vger.kernel.org,
 =?UTF-8?B?SsOpcsO0bWU=?= Glisse <jglisse@redhat.com>,
 Al Viro <viro@zeniv.linux.org.uk>, Dan Williams <dan.j.williams@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, bpf@vger.kernel.org,
 Magnus Karlsson <magnus.karlsson@intel.com>, Jens Axboe <axboe@kernel.dk>,
 netdev@vger.kernel.org, Alex Williamson <alex.williamson@redhat.com>,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org, "David S . Miller" <davem@davemloft.net>,
 Mike Kravetz <mike.kravetz@oracle.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 10 Dec 2019 18:53:03 -0800
John Hubbard <jhubbard@nvidia.com> wrote:

> Introduce pin_user_pages*() variations of get_user_pages*() calls,
> and also pin_longterm_pages*() variations.

Just a couple of nits on the documentation patch

> +++ b/Documentation/core-api/pin_user_pages.rst
> @@ -0,0 +1,232 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +====================================================
> +pin_user_pages() and related calls
> +====================================================
> +
> +.. contents:: :local:
> +
> +Overview
> +========
> +
> +This document describes the following functions: ::
> +
> + pin_user_pages
> + pin_user_pages_fast
> + pin_user_pages_remote

You could just say "the following functions::" and get the result you're
after with a slightly less alien plain-text reading experience.

Of course, you could also just say "This document describes
pin_user_pages(), pin_user_pages_fast(), and pin_user_pages_remote()." But
that's a matter of personal taste, I guess.  Using the function() notation
will cause the docs system to automatically link to the kerneldoc info,
though.  

> +Basic description of FOLL_PIN
> +=============================
> +
> +FOLL_PIN and FOLL_LONGTERM are flags that can be passed to the get_user_pages*()
> +("gup") family of functions. FOLL_PIN has significant interactions and
> +interdependencies with FOLL_LONGTERM, so both are covered here.
> +
> +FOLL_PIN is internal to gup, meaning that it should not appear at the gup call
> +sites. This allows the associated wrapper functions  (pin_user_pages*() and
> +others) to set the correct combination of these flags, and to check for problems
> +as well.
> +
> +FOLL_LONGTERM, on the other hand, *is* allowed to be set at the gup call sites.
> +This is in order to avoid creating a large number of wrapper functions to cover
> +all combinations of get*(), pin*(), FOLL_LONGTERM, and more. Also, the
> +pin_user_pages*() APIs are clearly distinct from the get_user_pages*() APIs, so
> +that's a natural dividing line, and a good point to make separate wrapper calls.
> +In other words, use pin_user_pages*() for DMA-pinned pages, and
> +get_user_pages*() for other cases. There are four cases described later on in
> +this document, to further clarify that concept.
> +
> +FOLL_PIN and FOLL_GET are mutually exclusive for a given gup call. However,
> +multiple threads and call sites are free to pin the same struct pages, via both
> +FOLL_PIN and FOLL_GET. It's just the call site that needs to choose one or the
> +other, not the struct page(s).
> +
> +The FOLL_PIN implementation is nearly the same as FOLL_GET, except that FOLL_PIN
> +uses a different reference counting technique.
> +
> +FOLL_PIN is a prerequisite to FOLL_LONGTGERM. Another way of saying that is,

FOLL_LONGTERM typoed there.

Thanks,

jon
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
