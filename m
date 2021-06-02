Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E257D398D36
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jun 2021 16:37:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E31C66ECC4;
	Wed,  2 Jun 2021 14:37:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3C066ECC3
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Jun 2021 14:37:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622644657;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=m/QwAefnsRXdsP3/z6cvtajoG5iQ+RdDqTRbmixBgeQ=;
 b=PZxBvMZW1FC2WzalZzxVNddLZQ7A8lL3M9+gn5JxFs8gcOsXl4jp+uwZDmEFGcycCV1aA1
 NoZlD+OkmC94VOE5IPfx/QXX28A0TiS8Mw3SEqtfGaRF686w4LNvdDX6MiWP+qgmDDEMZx
 mVG1cOH2v/Ksqd7KRdLI0kLj1dN0lZ8=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-493-Psi5f8dbNQavRuv1HAP-Sw-1; Wed, 02 Jun 2021 10:37:33 -0400
X-MC-Unique: Psi5f8dbNQavRuv1HAP-Sw-1
Received: by mail-qk1-f197.google.com with SMTP id
 d15-20020a05620a136fb02902e9e93c69c8so1733727qkl.23
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Jun 2021 07:37:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=m/QwAefnsRXdsP3/z6cvtajoG5iQ+RdDqTRbmixBgeQ=;
 b=pDslxloBDVKRsMl2+/UChyZDUEfMThQyyVa+DU/x9UimO+4GP8UzNv7lIylKUvoNbe
 Ya9mFbm1x2fkzotSk+T+XLDe0EHXNiRuGChyIB5/hnt5U5TlDJ/f/f1anyW8cMdaDfhf
 lsatZV1VTvddtjoP/7PZKRrxzhrFVXlPyEpujbcobAk5THQpJVDxdL90u8pDeDWF+bHO
 jYtTiNXfY3EtoOF37RidKWDualp5wszqtlSbiCtTAAFZ2bosTKdL4ogpZ9EcxdDRXMQx
 T/pz6iimQesljshk+Adu38nC2dWb2klKJMv6zyGrXevlMQB15zCqmKKXFrDmM0Bof1LX
 iCGg==
X-Gm-Message-State: AOAM531JcIW+x0qHSsNNJYiO6k+7CK3BJ4HFbSN6JZ5RkXraR7/KUd83
 cnnzK6pj7hEy6DKNzw5Fxg6+NG/kK/wTdpKYnBTq9Mi92bs4zZoSoDSAyS4WcSqM7cK/CbRFHxU
 aaI20l3TA8HLH6Sleh1Gq3xPD4JS5
X-Received: by 2002:ac8:5b81:: with SMTP id a1mr24760222qta.303.1622644653346; 
 Wed, 02 Jun 2021 07:37:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxTs6tJ8uqmSORfD2Z3iGZv/0i+S2lgFtI+HHVdQRE2EuDI89DE3ak/M7GvRJs9513WyidOxA==
X-Received: by 2002:ac8:5b81:: with SMTP id a1mr24760200qta.303.1622644652986; 
 Wed, 02 Jun 2021 07:37:32 -0700 (PDT)
Received: from t490s
 (bras-base-toroon474qw-grc-61-184-147-118-108.dsl.bell.ca. [184.147.118.108])
 by smtp.gmail.com with ESMTPSA id e127sm87950qkf.62.2021.06.02.07.37.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Jun 2021 07:37:32 -0700 (PDT)
Date: Wed, 2 Jun 2021 10:37:30 -0400
From: Peter Xu <peterx@redhat.com>
To: Balbir Singh <bsingharora@gmail.com>
Subject: Re: [PATCH v9 07/10] mm: Device exclusive memory access
Message-ID: <YLeXqp/U0DgylI/u@t490s>
References: <20210524132725.12697-1-apopple@nvidia.com>
 <20210524132725.12697-8-apopple@nvidia.com>
 <20210524151157.2dc5d2bb510ff86dc449bf0c@linux-foundation.org>
 <YKzk0ILRsyazMs2W@balbir-desktop>
 <8844f8c1-d78c-e0f9-c046-592bd75d4c07@nvidia.com>
 <YLdGXSw0zdiovn4i@balbir-desktop>
MIME-Version: 1.0
In-Reply-To: <YLdGXSw0zdiovn4i@balbir-desktop>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
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
Cc: rcampbell@nvidia.com, willy@infradead.org, linux-doc@vger.kernel.org,
 nouveau@lists.freedesktop.org, Alistair Popple <apopple@nvidia.com>,
 hughd@google.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, hch@infradead.org, linux-mm@kvack.org,
 jglisse@redhat.com, bskeggs@redhat.com, jgg@nvidia.com,
 John Hubbard <jhubbard@nvidia.com>, Andrew Morton <akpm@linux-foundation.org>,
 Christoph Hellwig <hch@lst.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jun 02, 2021 at 06:50:37PM +1000, Balbir Singh wrote:
> On Wed, May 26, 2021 at 12:17:18AM -0700, John Hubbard wrote:
> > On 5/25/21 4:51 AM, Balbir Singh wrote:
> > ...
> > > > How beneficial is this code to nouveau users?  I see that it permits a
> > > > part of OpenCL to be implemented, but how useful/important is this in
> > > > the real world?
> > > 
> > > That is a very good question! I've not reviewed the code, but a sample
> > > program with the described use case would make things easy to parse.
> > > I suspect that is not easy to build at the moment?
> > > 
> > 
> > The cover letter says this:
> > 
> > This has been tested with upstream Mesa 21.1.0 and a simple OpenCL program
> > which checks that GPU atomic accesses to system memory are atomic. Without
> > this series the test fails as there is no way of write-protecting the page
> > mapping which results in the device clobbering CPU writes. For reference
> > the test is available at https://ozlabs.org/~apopple/opencl_svm_atomics/
> > 
> > Further testing has been performed by adding support for testing exclusive
> > access to the hmm-tests kselftests.
> > 
> > ...so that seems to cover the "sample program" request, at least.
> 
> Thanks, I'll take a look
> 
> > 
> > > I wonder how we co-ordinate all the work the mm is doing, page migration,
> > > reclaim with device exclusive access? Do we have any numbers for the worst
> > > case page fault latency when something is marked away for exclusive access?
> > 
> > CPU page fault latency is approximately "terrible", if a page is resident on
> > the GPU. We have to spin up a DMA engine on the GPU and have it copy the page
> > over the PCIe bus, after all.
> > 
> > > I presume for now this is anonymous memory only? SWP_DEVICE_EXCLUSIVE would
> > 
> > Yes, for now.
> > 
> > > only impact the address space of programs using the GPU. Should the exclusively
> > > marked range live in the unreclaimable list and recycled back to active/in-active
> > > to account for the fact that
> > > 
> > > 1. It is not reclaimable and reclaim will only hurt via page faults?
> > > 2. It ages the page correctly or at-least allows for that possibility when the
> > >     page is used by the GPU.
> > 
> > I'm not sure that that is *necessarily* something we can conclude. It depends upon
> > access patterns of each program. For example, a "reduction" parallel program sends
> > over lots of data to the GPU, and only a tiny bit of (reduced!) data comes back
> > to the CPU. In that case, freeing the physical page on the CPU is actually the
> > best decision for the OS to make (if the OS is sufficiently prescient).
> >
> 
> With a shared device or a device exclusive range, it would be good to get the device
> usage pattern and update the mm with that knowledge, so that the LRU can be better
> maintained. With your comment you seem to suggest that a page used by the GPU might
> be a good candidate for reclaim based on the CPU's understanding of the age of
> the page should not account for use by the device
> (are GPU workloads - access once and discard?) 

Hmm, besides the aging info, this reminded me: do we need to isolate the page
from lru too when marking device exclusive access?

Afaict the current patch didn't do that so I think it's reclaimable.  If we
still have the rmap then we'll get a mmu notify CLEAR when unmapping that
special pte, so device driver should be able to drop the ownership.  However we
dropped the rmap when marking exclusive.  Now I don't know whether and how
it'll work if page reclaim runs with the page being exclusively owned if
without isolating the page..

-- 
Peter Xu

