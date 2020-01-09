Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F187136302
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jan 2020 23:07:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A79C96E971;
	Thu,  9 Jan 2020 22:07:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqnvemgate26.nvidia.com (hqnvemgate26.nvidia.com
 [216.228.121.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4913F6E971
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jan 2020 22:07:40 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5e17a4190000>; Thu, 09 Jan 2020 14:07:21 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Thu, 09 Jan 2020 14:07:39 -0800
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Thu, 09 Jan 2020 14:07:39 -0800
Received: from [10.110.48.28] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 9 Jan
 2020 22:07:38 +0000
Subject: Re: [PATCH v12 00/22] mm/gup: prereqs to track dma-pinned pages:
 FOLL_PIN
To: Andrew Morton <akpm@linux-foundation.org>
References: <20200107224558.2362728-1-jhubbard@nvidia.com>
From: John Hubbard <jhubbard@nvidia.com>
X-Nvconfidentiality: public
Message-ID: <2a9145d4-586e-6489-64e4-0c54f47afaa1@nvidia.com>
Date: Thu, 9 Jan 2020 14:07:38 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <20200107224558.2362728-1-jhubbard@nvidia.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1578607641; bh=+NEvkiCKN4muU9xEMv7O0vL5DDgA+srq0dD5KyM2g5Y=;
 h=X-PGP-Universal:Subject:To:CC:References:From:X-Nvconfidentiality:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=pAGT+6E4t/5Sgzls83W8rrhD73PbNnbQX0v+uLgN6NdK6ox1s0YILXA5+Q9WkB7U5
 Qgdq4MfQKXM00HXiVUvw/MN1+0Npjsn2yckDImY4OPUy9vKTHUQrRr5b/32qyPv6Y4
 G8uphKhloBfTQ9ova5uKctNKv/z/ybtCLuSP2dniMP6oLwVdc9frqv+uSdiahegES7
 HZtKpaUzMnUGCyRfUKLB2LXhSyGZIEwOR/UkaAhKUOx0B4NaRtt8Qz56svVPCLTYZD
 6dBjR9cwNa9He9WTH1/ZpC5nBgZ5v8YIJX6cYUd/1MLjMgnC8wrJfdT7uC+HoO76Fq
 StnhQb6FNJNXA==
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
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@intel.com>,
 linux-media@vger.kernel.org, Shuah Khan <shuah@kernel.org>,
 linux-block@vger.kernel.org,
 =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 Al Viro <viro@zeniv.linux.org.uk>,
 "Kirill A . Shutemov" <kirill@shutemov.name>,
 Dan Williams <dan.j.williams@intel.com>,
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

On 1/7/20 2:45 PM, John Hubbard wrote:
> Hi,
> 
> The "track FOLL_PIN pages" would have been the very next patch, but it is
> not included here because I'm still debugging a bug report from Leon.
> Let's get all of the prerequisite work (it's been reviewed) into the tree
> so that future reviews are easier. It's clear that any fixes that are
> required to the tracking patch, won't affect these patches here.
> 
> This implements an API naming change (put_user_page*() -->
> unpin_user_page*()), and also adds FOLL_PIN page support, up to
> *but not including* actually tracking FOLL_PIN pages. It extends
> the FOLL_PIN support to a few select subsystems. More subsystems will
> be added in follow up work.
> 

Hi Andrew and all,

To clarify: I'm hoping that this series can go into 5.6.

Meanwhile, I'm working on tracking down and solving the problem that Leon
reported, in the "track FOLL_PIN pages" patch, and that patch is not part of
this series.

thanks,
-- 
John Hubbard
NVIDIA
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
