Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D20F512571B
	for <lists+dri-devel@lfdr.de>; Wed, 18 Dec 2019 23:45:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC35E6EA9B;
	Wed, 18 Dec 2019 22:45:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DD8F6EA9B
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Dec 2019 22:45:09 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id n12so2891422lfe.3
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Dec 2019 14:45:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=shutemov-name.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=YrrQW+o6yoR9HJnH1mwKSC9v5iWno6eigHp0EBk4LR0=;
 b=bdF7Zv0VTafIoorJswX48t2yxXJBYxcvjHgrT2SGIIMh8SxTaUWksloPDk4hj8pN+b
 8Wy7ZGVYH0fWsHmH/IMJnBSfIeVts/sOmiy4I/nlOeq68AiZoaQ1Mqh2e43FlXq9gRLG
 KshnO+IUvlyZD7e2bgfiCpZOkUn91XMsyCwRx9hGVqlfs3W1si7CDXXM3vtqSXuMWY78
 Tae1sOhSYoNDJLrJgal+3cpj+/6xa05u+pWrMRgdVnIo9FZyRNB0aI0+sHon8/zGouR0
 pqwpw4LUVoV4NK9FktzSrs+SeQWsHdxx0QqmCUwextJEn9FOXazhfjjyb53FWNWWcUXk
 GNTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=YrrQW+o6yoR9HJnH1mwKSC9v5iWno6eigHp0EBk4LR0=;
 b=fU/EiS3MZAqqVCD/f9kcWgq8ub+b6PEOWDa4YSmk3HsGffr58ghcNzqSZrD9tQY1v4
 l52H53RcZo8VNeghparv9wfAbBJv0KQ16Cek1UCnNHop3hb6ORQn3+FqvciIuBT6psmU
 G0p42zyTvp4EWr+QMMKq88ZLbwIA3LZbmmL/PipZA6dO8SLFceG48fwgJ+osgmhHGyOK
 ruFVTKC/o9z+DV0mnJXaB1FQ7wX2VvT3QaUchTwHSsuUrT3irdVg8JgytWVinyjsmVpB
 h9nauhExr2pVEB3Wa2BG8WRs1ggMl1wJq5ZaPkQWx5AcCtHvA5JvA/bAi8qlQ+yo3Z0y
 UAnw==
X-Gm-Message-State: APjAAAUjZnLnpF2gcPnEOYi1K8xFIewpT8vo+BQkiVmPkMxFv17UtpW5
 H8BYCTrM1UJiL1uIT1iiAOji2w==
X-Google-Smtp-Source: APXvYqwPbC3mnICecXB2mktdTfANDFTtD1oSKWMGw8lhRk6/u/eXjGq156/mWoszLGq/OpGErs59TQ==
X-Received: by 2002:a19:6a06:: with SMTP id u6mr3341913lfu.187.1576709107276; 
 Wed, 18 Dec 2019 14:45:07 -0800 (PST)
Received: from box.localdomain ([86.57.175.117])
 by smtp.gmail.com with ESMTPSA id t6sm1792834ljj.62.2019.12.18.14.45.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Dec 2019 14:45:06 -0800 (PST)
Received: by box.localdomain (Postfix, from userid 1000)
 id 380451012E3; Thu, 19 Dec 2019 01:45:07 +0300 (+03)
Date: Thu, 19 Dec 2019 01:45:07 +0300
From: "Kirill A. Shutemov" <kirill@shutemov.name>
To: John Hubbard <jhubbard@nvidia.com>
Subject: Re: [PATCH v11 01/25] mm/gup: factor out duplicate code from four
 routines
Message-ID: <20191218224507.nayxmx7vvsjvyzsc@box>
References: <20191216222537.491123-1-jhubbard@nvidia.com>
 <20191216222537.491123-2-jhubbard@nvidia.com>
 <20191218155211.emcegdp5uqgorfwe@box>
 <5719efc4-e560-b3d9-8d1f-3ae289bed289@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5719efc4-e560-b3d9-8d1f-3ae289bed289@nvidia.com>
User-Agent: NeoMutt/20180716
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
 Christoph Hellwig <hch@lst.de>, Jonathan Corbet <corbet@lwn.net>,
 linux-rdma@vger.kernel.org, Michael Ellerman <mpe@ellerman.id.au>,
 Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Vlastimil Babka <vbabka@suse.cz>,
 =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@intel.com>,
 linux-media@vger.kernel.org, Shuah Khan <shuah@kernel.org>,
 linux-block@vger.kernel.org,
 =?utf-8?B?SsOpcsO0bWU=?= Glisse <jglisse@redhat.com>,
 Al Viro <viro@zeniv.linux.org.uk>, Dan Williams <dan.j.williams@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, bpf@vger.kernel.org,
 Magnus Karlsson <magnus.karlsson@intel.com>, Jens Axboe <axboe@kernel.dk>,
 netdev@vger.kernel.org, Alex Williamson <alex.williamson@redhat.com>,
 "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org, "David S . Miller" <davem@davemloft.net>,
 Mike Kravetz <mike.kravetz@oracle.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Dec 18, 2019 at 02:15:53PM -0800, John Hubbard wrote:
> On 12/18/19 7:52 AM, Kirill A. Shutemov wrote:
> > On Mon, Dec 16, 2019 at 02:25:13PM -0800, John Hubbard wrote:
> > > +static void put_compound_head(struct page *page, int refs)
> > > +{
> > > +	/* Do a get_page() first, in case refs == page->_refcount */
> > > +	get_page(page);
> > > +	page_ref_sub(page, refs);
> > > +	put_page(page);
> > > +}
> > 
> > It's not terribly efficient. Maybe something like:
> > 
> > 	VM_BUG_ON_PAGE(page_ref_count(page) < ref, page);
> > 	if (refs > 2)
> > 		page_ref_sub(page, refs - 1);
> > 	put_page(page);
> > 
> > ?
> 
> OK, but how about this instead? I don't see the need for a "2", as that
> is a magic number that requires explanation. Whereas "1" is not a magic
> number--here it means: either there are "many" (>1) refs, or not.

Yeah, it's my thinko. Sure, it has to be '1' (or >= 2, which is less readable).

> And the routine won't be called with refs less than about 32 (2MB huge
> page, 64KB base page == 32 subpages) anyway.

It's hard to make predictions about future :P

> 	VM_BUG_ON_PAGE(page_ref_count(page) < refs, page);
> 	/*
> 	 * Calling put_page() for each ref is unnecessarily slow. Only the last
> 	 * ref needs a put_page().
> 	 */
> 	if (refs > 1)
> 		page_ref_sub(page, refs - 1);
> 	put_page(page);

Looks good to me.

-- 
 Kirill A. Shutemov
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
