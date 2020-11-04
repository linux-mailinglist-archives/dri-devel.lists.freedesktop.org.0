Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E7D82A7916
	for <lists+dri-devel@lfdr.de>; Thu,  5 Nov 2020 09:22:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7289F6EA14;
	Thu,  5 Nov 2020 08:21:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6205789F08
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Nov 2020 18:17:10 +0000 (UTC)
Received: by mail-qt1-x844.google.com with SMTP id t5so4295323qtp.2
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Nov 2020 10:17:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=0IlAXzxWFTQTUuhmHtEVnKs2xhR6KwI7WPZxiLpUe5M=;
 b=nBv9S+jwc5JdfLlq4RL/YRGMRQsYfNmjawGrU9GxIfERfAzcpQgZP7hrv69Mesc6M+
 quTXVEbUxyGRkpm9rbsP8azSm9DhVnbhxJgRfZltG0yrlTEb9tUc276PX/VzeI4+sRFb
 4r/IU25uiRBU2ueg3BK2D1b5dzTlQrhsuR29PTFyGpgIBwSarkIUR8LSQBS70hi2P/nX
 3m9r9pQVhoUF1DKe/otBAG1Rv7Kcrglv3VfUI2ehd7bNrMEt5ljYuJ0XfoYPWDc7w4EG
 xr2aRwLmdjA9s+hlno1U0yOoQqyB/mpuAfQuUyKvK6M+DNWEL6fkUm6gwdGKM5MFyxPD
 3ciQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=0IlAXzxWFTQTUuhmHtEVnKs2xhR6KwI7WPZxiLpUe5M=;
 b=o3sxe3+l61H9zY76ToYZaaKCzHM+dIThDe95UXiGneB9wHo3WponGUm5SoP2Y500tW
 0ieC8YRaTRjN4/YByd1eUS0Kwqmal8OGZmKfSY7YBX9gMOrF7Qx63ZMEIZN1cWNieWdE
 rDkDiBKAxlT4/Ln8eFgVfTgtv9y05wMAg460Vcu0708wJdxcXbIW03dUIhVB6NCSfsQJ
 yigqyZTpYpueI8FrMRhuVozqBcjll+qqPKv5Em72kKfs/TrQR8ZuE6kwu/q8Vi70Hv9u
 IezXU/PvuX2GebX+hEC3IdjdsuGG+NWSbHag4o4jKmjvLDEIR5aP6o7KethSn8NPlkwC
 xWQw==
X-Gm-Message-State: AOAM532xF5d5OYsvbcn6XEmgPPnOZ6Q4qZ51ueauPUIKQt+uLURBnWO7
 /cBnhCTy/rU+iHGmqA4Zem0aPg==
X-Google-Smtp-Source: ABdhPJzbeLbokY3xWw1ad4Wlq96Bw2Ur+AXtnppBcNVDAcKLM++yGsaQXPWFUe04HeoITS7ilZQ2EA==
X-Received: by 2002:ac8:590c:: with SMTP id 12mr12840139qty.28.1604513829572; 
 Wed, 04 Nov 2020 10:17:09 -0800 (PST)
Received: from ziepe.ca
 (hlfxns017vw-156-34-48-30.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.48.30])
 by smtp.gmail.com with ESMTPSA id a30sm701698qtn.55.2020.11.04.10.17.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Nov 2020 10:17:08 -0800 (PST)
Received: from jgg by mlx with local (Exim 4.94) (envelope-from <jgg@ziepe.ca>)
 id 1kaNLI-00GaUi-BN; Wed, 04 Nov 2020 14:17:08 -0400
Date: Wed, 4 Nov 2020 14:17:08 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH v5 05/15] mm/frame-vector: Use FOLL_LONGTERM
Message-ID: <20201104181708.GU36674@ziepe.ca>
References: <1f7cf690-35e2-c56f-6d3f-94400633edd2@nvidia.com>
 <CAKMK7uFYDSqnNp_xpohzCEidw_iLufNSoX4v55sNZj-nwTckSg@mail.gmail.com>
 <7f29a42a-c408-525d-90b7-ef3c12b5826c@nvidia.com>
 <CAKMK7uEw701AWXNJbRNM8Z+FkyUB5FbWegmSzyWPy9cG4W7OLA@mail.gmail.com>
 <20201104140023.GQ36674@ziepe.ca>
 <CAKMK7uH69hsFjYUkjg1aTh5f=q_3eswMSS5feFs6+ovz586+0A@mail.gmail.com>
 <20201104162125.GA13007@infradead.org>
 <CAKMK7uH=0+3FSR4LxP7bJUB4BsCcnCzfK2=D+2Am9QNmfZEmfw@mail.gmail.com>
 <20201104163758.GA17425@infradead.org>
 <20201104164119.GA18218@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201104164119.GA18218@infradead.org>
X-Mailman-Approved-At: Thu, 05 Nov 2020 08:20:02 +0000
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
 Jan Kara <jack@suse.cz>, Pawel Osciak <pawel@osciak.com>,
 KVM list <kvm@vger.kernel.org>, Daniel Vetter <daniel.vetter@intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Tomasz Figa <tfiga@chromium.org>, Linux MM <linux-mm@kvack.org>,
 J??r??me Glisse <jglisse@redhat.com>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>,
 John Hubbard <jhubbard@nvidia.com>, Kyungmin Park <kyungmin.park@samsung.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Dan Williams <dan.j.williams@intel.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Nov 04, 2020 at 04:41:19PM +0000, Christoph Hellwig wrote:
> On Wed, Nov 04, 2020 at 04:37:58PM +0000, Christoph Hellwig wrote:
> > On Wed, Nov 04, 2020 at 05:26:58PM +0100, Daniel Vetter wrote:
> > > What we're discussing is whether gup_fast and pup_fast also obey this,
> > > or fall over and can give you the struct page that's backing the
> > > dma_mmap_* memory. Since the _fast variant doesn't check for
> > > vma->vm_flags, and afaict that's the only thing which closes this gap.
> > > And like you restate, that would be a bit a problem. So where's that
> > > check which Jason&me aren't spotting?
> > 
> > remap_pte_range uses pte_mkspecial to set up the PTEs, and gup_pte_range
> > errors out on pte_special.  Of course this only works for the
> > CONFIG_ARCH_HAS_PTE_SPECIAL case, for other architectures we do have
> > a real problem.
> 
> Except that we don't really support pte-level gup-fast without
> CONFIG_ARCH_HAS_PTE_SPECIAL, and in fact all architectures selecting
> HAVE_FAST_GUP also select ARCH_HAS_PTE_SPECIAL, so we should be fine.

Mm, I thought it was probably the special flag..

Knowing that CONFIG_HAVE_FAST_GUP can't be set without
CONFIG_ARCH_HAS_PTE_SPECIAL is pretty insightful, can we put that in
the Kconfig?

config HAVE_FAST_GUP
        depends on MMU
        depends on ARCH_HAS_PTE_SPECIAL
        bool

?

Jason
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
