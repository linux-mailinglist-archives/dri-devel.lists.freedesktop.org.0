Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09211284746
	for <lists+dri-devel@lfdr.de>; Tue,  6 Oct 2020 09:32:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92F4D6E423;
	Tue,  6 Oct 2020 07:31:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf41.google.com (mail-qv1-xf41.google.com
 [IPv6:2607:f8b0:4864:20::f41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 137456E1B3
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Oct 2020 23:41:06 +0000 (UTC)
Received: by mail-qv1-xf41.google.com with SMTP id w5so2975180qvn.12
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Oct 2020 16:41:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=leFIXUGGn9SrvRUt+tSmZlGo2xUCkAybN0CLyh7hEVg=;
 b=WQTRkabULDUNXgUOMkqWCf8k/DuyDViVSLHiUwqLBS7jFU4O4kB9U8Yezw3zLkcX+0
 N74emMID/Nf/tIrzUG3xn5IudsmLDLLSfJSFNjC86EZW2YCNxrAJ6Va1u5MyccDsjLiF
 PgIrU2vJ9V3he09nNerOKw2ijrvUXY3LxxxlUgWu78keT9R0r1XG2jEorE9lghUJYBq0
 HDLVZIOGBufu8D7pIs8xJwLhuITDMBS+p/adlJyEPM0KYtmP3MPKnG7vX+ZYICLgx/+H
 9Y3UojthIzYzht7NXCY0SCY8mLxjKGEXcgRu9Wjs6CR48TRqBN9ftH6xE+L/pIZNkLOu
 J6cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=leFIXUGGn9SrvRUt+tSmZlGo2xUCkAybN0CLyh7hEVg=;
 b=CRFPPbRuaNQbwN97IDQ/hmYqmqxigGstOYhgoiMg2dr+IpwAGEmXUee7IbmQgkX6Yz
 c0APD4hbtb0AvDdmhqNyjnG9Od2RvCHOHJBrqO9XMhrIgzv35EkS5JSXSlBqAdhDY3/c
 QwhFWoTeEn7Xodn735IVCRGzsaS1LzL8aaPj055xiXRbYmihJwnSDODzvajM2chiT+4R
 rCx7Qf61K61vbK3+bzDHWK+Fcu1c8ZbDQiKPr8mzKxh8BncFmJlncwpM+6cyCPc+GRCa
 XGEYF2QInCVbHBsNsIFewnmM/zKiuBv8asAb1OBS9pCf2FTLDag1C4fuN8Q9kYRSaeR9
 vVbw==
X-Gm-Message-State: AOAM531sbAzwM4v0sIdbRx8dhkQ6zl08fo9KfWjqUtP+YNk6wef+1s7D
 Pgov0TfNeMZXx7hzDIUBHLSmfg==
X-Google-Smtp-Source: ABdhPJyH6Hj9DkTwkBpIGRlKmZqLkjKrSkdKR0kLJjsKJY55CJeobeIMUeExf41YR/ICDJqmfiJ9Hw==
X-Received: by 2002:a05:6214:136f:: with SMTP id
 c15mr2074483qvw.57.1601941266028; 
 Mon, 05 Oct 2020 16:41:06 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-156-34-48-30.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.48.30])
 by smtp.gmail.com with ESMTPSA id v30sm1069485qtj.52.2020.10.05.16.41.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Oct 2020 16:41:05 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.94) (envelope-from <jgg@ziepe.ca>)
 id 1kPa6K-000DCJ-94; Mon, 05 Oct 2020 20:41:04 -0300
Date: Mon, 5 Oct 2020 20:41:04 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH 2/2] mm/frame-vec: use FOLL_LONGTERM
Message-ID: <20201005234104.GD5177@ziepe.ca>
References: <CAKMK7uGF+y-r4swLXmodhduRMy0NPa=ASBY8JOXS_g=9Rq9XQw@mail.gmail.com>
 <20201002233118.GM9916@ziepe.ca>
 <CAKMK7uFP-XQHUPYeRhPx7tjvjARQiF-os9z9jx6WANV6sgSf6g@mail.gmail.com>
 <20201004125059.GP9916@ziepe.ca>
 <CAKMK7uF0AfuYGsHzKXhF=k-mAW=Wx_APf9fY9M9ormnwypoxZA@mail.gmail.com>
 <20201005172854.GA5177@ziepe.ca>
 <CAKMK7uFzxWF7V=7vkeNC-8shsPZRgdz9fYTsn0ayENv2BpnFEg@mail.gmail.com>
 <20201005183704.GC5177@ziepe.ca>
 <CAKMK7uH97Yb2JFviG_ynGC1hbQ69h9hcyFVFd2PFYHCDzfBN6g@mail.gmail.com>
 <CAKMK7uHRxK3yNrvX=+n-XpSv7PDCz8w+mwof3pkUUJq3TpmiuQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKMK7uHRxK3yNrvX=+n-XpSv7PDCz8w+mwof3pkUUJq3TpmiuQ@mail.gmail.com>
X-Mailman-Approved-At: Tue, 06 Oct 2020 07:31:05 +0000
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
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
 Jan Kara <jack@suse.cz>, Joonyoung Shim <jy0922.shim@samsung.com>,
 Pawel Osciak <pawel@osciak.com>, John Hubbard <jhubbard@nvidia.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Tomasz Figa <tfiga@chromium.org>, Kyungmin Park <kyungmin.park@samsung.com>,
 Linux MM <linux-mm@kvack.org>,
 =?utf-8?B?SsOpcsO0bWU=?= Glisse <jglisse@redhat.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>,
 Dan Williams <dan.j.williams@intel.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Oct 06, 2020 at 12:43:31AM +0200, Daniel Vetter wrote:

> > iow I think I can outright delete the frame vector stuff.
> 
> Ok this doesn't work, because dma_mmap always uses a remap_pfn_range,
> which is a VM_IO | VM_PFNMAP vma and so even if it's cma backed and
> not a carveout, we can't get the pages.

If CMA memory has struct pages it probably should be mmap'd with
different flags, and the lifecycle of the CMA memory needs to respect
the struct page refcount?

> Plus trying to move the cma pages out of cma for FOLL_LONGTERM would
> be kinda bad when they've been allocated as a contig block by
> dma_alloc_coherent :-)

Isn't holding a long term reference to a CMA page one of those really
scary use-after-free security issues I've been talking about?

I know nothing about CMA, so can't say too much, sorry

Jason
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
