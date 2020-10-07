Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 990F6286252
	for <lists+dri-devel@lfdr.de>; Wed,  7 Oct 2020 17:40:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D90C06E924;
	Wed,  7 Oct 2020 15:39:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09DD66E0B6
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Oct 2020 13:14:31 +0000 (UTC)
Received: by mail-qt1-x842.google.com with SMTP id c5so1721688qtw.3
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Oct 2020 06:14:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=MmLkeDGPsMUHS0xvj3eEHFFmVdpcqhu0PPjOEhkFDRw=;
 b=E2hqgrVAYT0hzmQlUY2vSFECyG02KQklk4Q7aygEUVLS/VVeb3Tt27E/79H/UOl+9G
 SJBQ/lGMxMqipGbxoj7lfw0USKf2Sj6n3xYaQY9FvYamgoh5eKN5yzmXYMdRJ0LcIIqz
 VwpDBuIBc7R3DFnysJ6dY3hWBTL2Armw0wdMzfr++A3aRDehnCNFpI553/T5UM+DRyuQ
 Oek61rl8sZvLcPOv1smXPcbXY2ExA/erB9R5Jr+rymqCoLjWHjzuaE4tUHHAgHy+quP5
 QhDpDcvG1j+JZTxnHpIfusLhcypJ7HAV8RlkRBnFjKu3NO5ifvRL25XEKGsOMPhDPufR
 tnZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=MmLkeDGPsMUHS0xvj3eEHFFmVdpcqhu0PPjOEhkFDRw=;
 b=D5ijApWjVOGMXMiB1TmSEApxBOtZf9TwMdm23QoNSA+fL5NsSmYrJrETPZsKH3QOd0
 dAFcIProUmJdEKjhnVoeHQRBNxMaCKudJLN+vYQgWCqQhAuI0lC/AMj7tmhqGAwcgw6l
 tQ+Ae02Dw+MMYZhGUrmOUBzHSxV4GblpdFYGKE2GhHpACf4F/RjD/aPz/hx7sfy/JylC
 N4dwvvjWtvaAhLasjzot06+PjgP7Ksz7A03xeLERg6jFvyukYtcm+DzfEWgsoddUbWiQ
 IoJjEL1FbNDpfY/KPpKJ0ysYgewymVS9REt0ce7mppqVZI32sVoxo4D9oY3Y6v0d2v1v
 MI5Q==
X-Gm-Message-State: AOAM530mPOc6f1rvFT1NNDbUS4KFlI0U7T+8isbtqP4rkux4HQKCibEA
 51+iAQfHTBUaBC2yAcipkVvx+w==
X-Google-Smtp-Source: ABdhPJz8yWeQeFkSjjqVWhH1mXFkaZDdDkKqUssPTxNJCo0OrdjKtKBs9eNFjrd0s56SqUYqYVTBxw==
X-Received: by 2002:ac8:71c6:: with SMTP id i6mr3077500qtp.318.1602076469886; 
 Wed, 07 Oct 2020 06:14:29 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-156-34-48-30.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.48.30])
 by smtp.gmail.com with ESMTPSA id m15sm352795qtc.90.2020.10.07.06.14.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Oct 2020 06:14:29 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.94) (envelope-from <jgg@ziepe.ca>)
 id 1kQ9H2-000u0D-Lc; Wed, 07 Oct 2020 10:14:28 -0300
Date: Wed, 7 Oct 2020 10:14:28 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Tomasz Figa <tfiga@chromium.org>
Subject: Re: [PATCH 2/2] mm/frame-vec: use FOLL_LONGTERM
Message-ID: <20201007131428.GQ5177@ziepe.ca>
References: <20201002175303.390363-1-daniel.vetter@ffwll.ch>
 <20201002175303.390363-2-daniel.vetter@ffwll.ch>
 <20201002180603.GL9916@ziepe.ca>
 <CAKMK7uGF+y-r4swLXmodhduRMy0NPa=ASBY8JOXS_g=9Rq9XQw@mail.gmail.com>
 <20201002233118.GM9916@ziepe.ca>
 <CAAFQd5DkzxeHmHvipMR2YgDVC1uZrvVWgyWWYdyEM=yCOM7HwQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAAFQd5DkzxeHmHvipMR2YgDVC1uZrvVWgyWWYdyEM=yCOM7HwQ@mail.gmail.com>
X-Mailman-Approved-At: Wed, 07 Oct 2020 15:39:39 +0000
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
 Pawel Osciak <pawel@osciak.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Kyungmin Park <kyungmin.park@samsung.com>, Linux MM <linux-mm@kvack.org>,
 =?utf-8?B?SsOpcsO0bWU=?= Glisse <jglisse@redhat.com>,
 John Hubbard <jhubbard@nvidia.com>, Daniel Vetter <daniel.vetter@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>,
 Dan Williams <dan.j.williams@intel.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Oct 07, 2020 at 03:06:17PM +0200, Tomasz Figa wrote:

> Note that vb2_vmalloc is only used for in-kernel CPU usage, e.g. the
> contents being copied by the driver between vb2 buffers and some
> hardware FIFO or other dedicated buffers. The memory does not go to
> any hardware DMA.

That is even worse, the CPU can't just blindly touch VM_IO pages, that
isn't portable.

> Could you elaborate on what "the REQUIRED behavior is"? I can see that
> both follow the get_vaddr_frames() -> frame_vector_to_pages() flow, as
> you mentioned. Perhaps the only change needed is switching to
> pin_user_pages after all?

It is the comment right on top of get_vaddr_frames():

  if @start belongs to VM_IO | VM_PFNMAP vma, we don't
  touch page structures and the caller must make sure pfns aren't
  reused for anything else while he is using them.

Which means excluding every kind of VMA that is not something this
driver understands and then using special knowledge of the
driver-specific VMA to assure the above.

For instance if you could detect the VMA is from a carevout and do
something special like hold the fget() while knowning that the struct
file guarentees the carveout remains reserved - then you could use
follow_pfn.

But it would be faster and better to ask the carveout FD for the vaddr
range.

Jason
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
