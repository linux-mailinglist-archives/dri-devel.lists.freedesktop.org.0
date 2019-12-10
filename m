Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 475E4118528
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2019 11:33:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5717D6E890;
	Tue, 10 Dec 2019 10:33:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9016E6E890
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2019 10:33:48 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 99CB6AD4A;
 Tue, 10 Dec 2019 10:17:42 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
 id 8681F1E0B23; Tue, 10 Dec 2019 11:17:38 +0100 (CET)
Date: Tue, 10 Dec 2019 11:17:38 +0100
From: Jan Kara <jack@suse.cz>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH v8 17/26] media/v4l2-core: set pages dirty upon releasing
 DMA buffers
Message-ID: <20191210101738.GE1551@quack2.suse.cz>
References: <20191209225344.99740-1-jhubbard@nvidia.com>
 <20191209225344.99740-18-jhubbard@nvidia.com>
 <20191209165627.bf657cb8fdf660e8f91e966c@linux-foundation.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191209165627.bf657cb8fdf660e8f91e966c@linux-foundation.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
 =?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn.topel@intel.com>,
 linux-media@vger.kernel.org, Shuah Khan <shuah@kernel.org>,
 John Hubbard <jhubbard@nvidia.com>, linux-block@vger.kernel.org,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 =?iso-8859-1?B?Suly9G1l?= Glisse <jglisse@redhat.com>,
 Al Viro <viro@zeniv.linux.org.uk>, Dan Williams <dan.j.williams@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Magnus Karlsson <magnus.karlsson@intel.com>, Jens Axboe <axboe@kernel.dk>,
 netdev@vger.kernel.org, Alex Williamson <alex.williamson@redhat.com>,
 stable@vger.kernel.org, linux-fsdevel@vger.kernel.org, bpf@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, "David S . Miller" <davem@davemloft.net>,
 Mike Kravetz <mike.kravetz@oracle.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon 09-12-19 16:56:27, Andrew Morton wrote:
> On Mon, 9 Dec 2019 14:53:35 -0800 John Hubbard <jhubbard@nvidia.com> wrote:
> 
> > After DMA is complete, and the device and CPU caches are synchronized,
> > it's still required to mark the CPU pages as dirty, if the data was
> > coming from the device. However, this driver was just issuing a
> > bare put_page() call, without any set_page_dirty*() call.
> > 
> > Fix the problem, by calling set_page_dirty_lock() if the CPU pages
> > were potentially receiving data from the device.
> > 
> > Reviewed-by: Christoph Hellwig <hch@lst.de>
> > Acked-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> > Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> > Cc: <stable@vger.kernel.org>
> 
> What are the user-visible effects of this change?

Presumably loss of captured video data if the page writeback hits in the
wrong moment (i.e., after the page was faulted in but before the video HW
stored data in the page) and the page then gets evicted from the page cache.

								Honza

-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
