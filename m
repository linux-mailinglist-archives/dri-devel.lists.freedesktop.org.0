Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E5CD111A032
	for <lists+dri-devel@lfdr.de>; Wed, 11 Dec 2019 01:49:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 508E16EA2B;
	Wed, 11 Dec 2019 00:49:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F5526EA2B
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2019 00:49:31 +0000 (UTC)
Received: from localhost.localdomain (c-73-231-172-41.hsd1.ca.comcast.net
 [73.231.172.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2ACEC206D5;
 Wed, 11 Dec 2019 00:49:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1576025371;
 bh=mS7zyk9RzK8MLQp+5nvdMy6P3ysyYQCDC3Bah6kmlfs=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=UvC0RIny6iqVEumpqrPw6rq1+xZGMHezDVxIFrfIHyEiEEKaKQc5hGaYaeoZSLVqv
 OiKjZB9JvOrs5D8lM5PO+WX7OQOLW/u0awaO48QIwAJPLeFa0zJF2HELO5AISWbm2x
 nMOoibFNiErcex5Kfzt1sOkhZk08/M0uQclzXbn4=
Date: Tue, 10 Dec 2019 16:49:29 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: John Hubbard <jhubbard@nvidia.com>
Subject: Re: [PATCH v8 20/26] powerpc: book3s64: convert to pin_user_pages()
 and put_user_page()
Message-Id: <20191210164929.b3f54fe95c3fc4b6c756e65e@linux-foundation.org>
In-Reply-To: <61e0c3a5-992e-4571-e22d-d63286ce10ec@nvidia.com>
References: <20191209225344.99740-1-jhubbard@nvidia.com>
 <20191209225344.99740-21-jhubbard@nvidia.com>
 <08f5d716-8b31-b016-4994-19fbe829dc28@nvidia.com>
 <61e0c3a5-992e-4571-e22d-d63286ce10ec@nvidia.com>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
Mime-Version: 1.0
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
 Jonathan Corbet <corbet@lwn.net>, linux-rdma@vger.kernel.org,
 Michael Ellerman <mpe@ellerman.id.au>, Christoph Hellwig <hch@infradead.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, Vlastimil Babka <vbabka@suse.cz>,
 =?ISO-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn.topel@intel.com>,
 linux-media@vger.kernel.org, Shuah Khan <shuah@kernel.org>,
 linux-block@vger.kernel.org,
 =?ISO-8859-1?Q?J=E9r?= =?ISO-8859-1?Q?=F4me?= Glisse <jglisse@redhat.com>,
 Al Viro <viro@zeniv.linux.org.uk>, Dan Williams <dan.j.williams@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Magnus Karlsson <magnus.karlsson@intel.com>, Jens Axboe <axboe@kernel.dk>,
 netdev@vger.kernel.org, Alex Williamson <alex.williamson@redhat.com>,
 linux-fsdevel@vger.kernel.org, bpf@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, "David S . Miller" <davem@davemloft.net>,
 Mike Kravetz <mike.kravetz@oracle.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 9 Dec 2019 21:53:00 -0800 John Hubbard <jhubbard@nvidia.com> wrote:

> > Correction: this is somehow missing the fixes that resulted from Jan Kara's review (he
> > noted that we can't take a page lock in this context). I must have picked up the
> > wrong version of it, when I rebased for -rc1.
> > 
> 
> Andrew, given that the series is now in -mm, what's the preferred way for me to fix this?
> Send a v9 version of the whole series? Or something else?

I think a full resend is warranted at this time - it's only been in
there a day and there seem to be quite a number of changes to be made.

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
