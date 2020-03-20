Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 68DC318DF89
	for <lists+dri-devel@lfdr.de>; Sat, 21 Mar 2020 11:44:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 466AB6E2F8;
	Sat, 21 Mar 2020 10:44:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A2D46EB3F
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Mar 2020 13:41:11 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id f20so4877851qtq.6
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Mar 2020 06:41:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=rSXMnA8Bh+EyZeJfpwZeazUxxET567SafNKmRBbaqJE=;
 b=IRiBcy01pez/c8Esw6ABdeGlubYq6UBTvnqE08m54TPmYJSk0iZY8NRy4Imfi9RCkq
 pgYtuxDrHqPgjM1o0KyPLUcQQOMmsp/8AwWKrGmPWY2V2zTpecXI1Hmww1TRzifRUqv1
 DX4dzAVbSR13Fo7jjIz8YUYee5enxM6pJW/X6pJz59lxOjUg+6nvHnnEaT8pcTz55OMt
 jRul4tANsV8+/6/1gFaPw67m4l9Hc++lvsRpUhKs8JRwfn579xSKiU2xI9uEr0dnW7Fr
 mnPY+dq6nTjmuQ5ZDgFDKjScE6rkcwbkGcsH6sXXBgbbcYl+h27ZHv6LeQTB09f7WjYe
 iTaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=rSXMnA8Bh+EyZeJfpwZeazUxxET567SafNKmRBbaqJE=;
 b=NJk0oFBHHwevgrNj94O4wMjmsG2+oZOIDnbzk8tw6Qq9iQ4sXAKnxIjvmTeYIFKb0I
 ie4wHCFRkUA73BGh6X3KnagGfA8pr7WNFVC7d0wdTBt9taUqW6HXgk+VweVltbtL6kk3
 nJ9tZV7Kc0s8AYcVMcvda3B24mh/+Mao+a6AqQUIcCQV85hNBc0Kdm9/Qi+qvNXzf6ao
 bDzYXWsqmMxE2aU8oEITGgIIqPgrUWGJk2eb37+edYIP6oUATyt0CGp0RiHG5n8i8Vyi
 NjXRvgYoBOLGAB7hu1+19aDcrk6LwvXAstCo+peH5kRJbRKKWhNFfih7o12szaHANUgS
 5NNQ==
X-Gm-Message-State: ANhLgQ06eVEPOGkXNygjkcfAw8GNezbdf2rtrcRADOY2/rQ5i7KdIJku
 oWHhWtfiC6MxNX+15Ov/ICmcJA==
X-Google-Smtp-Source: ADFU+vuEJLxLBoH+558rgkm+/X3kgiU5w6V/n0Oh7c+Ro7Jb1c7KonYggFNpdI58VU/1xg85hzcxdQ==
X-Received: by 2002:ac8:4782:: with SMTP id k2mr8138084qtq.1.1584711670687;
 Fri, 20 Mar 2020 06:41:10 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-142-68-57-212.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.68.57.212])
 by smtp.gmail.com with ESMTPSA id p23sm4024398qkm.39.2020.03.20.06.41.09
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 20 Mar 2020 06:41:10 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1jFHtd-0007xE-Gf; Fri, 20 Mar 2020 10:41:09 -0300
Date: Fri, 20 Mar 2020 10:41:09 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 4/4] mm: check the device private page owner in
 hmm_range_fault
Message-ID: <20200320134109.GA30230@ziepe.ca>
References: <20200316193216.920734-1-hch@lst.de>
 <20200316193216.920734-5-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200316193216.920734-5-hch@lst.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Approved-At: Sat, 21 Mar 2020 10:44:25 +0000
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
Cc: amd-gfx@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, kvm-ppc@vger.kernel.org,
 Bharata B Rao <bharata@linux.ibm.com>, linux-mm@kvack.org,
 Jerome Glisse <jglisse@redhat.com>, Ben Skeggs <bskeggs@redhat.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Mar 16, 2020 at 08:32:16PM +0100, Christoph Hellwig wrote:
> diff --git a/mm/hmm.c b/mm/hmm.c
> index cfad65f6a67b..b75b3750e03d 100644
> +++ b/mm/hmm.c
> @@ -216,6 +216,14 @@ int hmm_vma_handle_pmd(struct mm_walk *walk, unsigned long addr,
>  		unsigned long end, uint64_t *pfns, pmd_t pmd);
>  #endif /* CONFIG_TRANSPARENT_HUGEPAGE */
>  
> +static inline bool hmm_is_device_private_entry(struct hmm_range *range,
> +		swp_entry_t entry)
> +{
> +	return is_device_private_entry(entry) &&
> +		device_private_entry_to_page(entry)->pgmap->owner ==
> +		range->dev_private_owner;
> +}

Thinking about this some more, does the locking work out here?

hmm_range_fault() runs with mmap_sem in read, and does not lock any of
the page table levels.

So it relies on accessing stale pte data being safe, and here we
introduce for the first time a page pointer dereference and a pgmap
dereference without any locking/refcounting.

The get_dev_pagemap() worked on the PFN and obtained a refcount, so it
created safety.

Is there some tricky reason this is safe, eg a DEVICE_PRIVATE page
cannot be removed from the vma without holding mmap_sem in write or
something?

Jason
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
