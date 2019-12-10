Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 83E65117FF7
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2019 06:51:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F21EF6E479;
	Tue, 10 Dec 2019 05:51:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqnvemgate25.nvidia.com (hqnvemgate25.nvidia.com
 [216.228.121.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6D136E479
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2019 05:51:16 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5def324d0000>; Mon, 09 Dec 2019 21:51:10 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Mon, 09 Dec 2019 21:51:16 -0800
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Mon, 09 Dec 2019 21:51:16 -0800
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 10 Dec
 2019 05:51:15 +0000
Received: from [10.2.166.216] (10.124.1.5) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 10 Dec
 2019 05:51:14 +0000
Subject: Re: [PATCH v8 17/26] media/v4l2-core: set pages dirty upon releasing
 DMA buffers
To: Andrew Morton <akpm@linux-foundation.org>
References: <20191209225344.99740-1-jhubbard@nvidia.com>
 <20191209225344.99740-18-jhubbard@nvidia.com>
 <20191209165627.bf657cb8fdf660e8f91e966c@linux-foundation.org>
From: John Hubbard <jhubbard@nvidia.com>
X-Nvconfidentiality: public
Message-ID: <fc100f4b-2c14-b56b-488a-e2d54d61d575@nvidia.com>
Date: Mon, 9 Dec 2019 21:48:24 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <20191209165627.bf657cb8fdf660e8f91e966c@linux-foundation.org>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1575957070; bh=KRjfdSXWCfXtj0zEL6nFRN1GkUl6vp+XI3HBba/YpY8=;
 h=X-PGP-Universal:Subject:To:CC:References:From:X-Nvconfidentiality:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=jHN/De11w2qJ/2Whqsz+5DRlqwutNcV+vDNiSEKXdDcKWt78VSxoGM0nLPdizxgSb
 M4m/UOUskWnEyCPODO9f1DYcD6hEBbJk74+kHw/LlXQq1xUnySbFRplwJNaq5NrVaz
 jsqdkry+cVNaNaRw3VxAVr3+cs8cvcJ783ZVBXMfF/rtOeLzgMzsIx2ydS3WZJvth1
 OfB3+NCkepaNAqgI1WYky+kXprKnYMmI09kgA9JzYnAnbh34pgq9lGMtxcjGnUZ1yV
 PAP6rWIOB+cdLSKZhfV+SBX5T+eEKD+BSQbO+Vj2XcjLK4iwQtiCrGuqh1R5ggXhEY
 xtGKcG+Qp/n6Q==
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
 linux-mm@kvack.org, Paul
 Mackerras <paulus@samba.org>, linux-kselftest@vger.kernel.org,
 Ira Weiny <ira.weiny@intel.com>, Christoph Hellwig <hch@lst.de>,
 Jonathan Corbet <corbet@lwn.net>, linux-rdma@vger.kernel.org,
 Michael Ellerman <mpe@ellerman.id.au>, Christoph Hellwig <hch@infradead.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, Vlastimil Babka <vbabka@suse.cz>,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@intel.com>,
 linux-media@vger.kernel.org, Shuah Khan <shuah@kernel.org>,
 linux-block@vger.kernel.org, Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 Al Viro <viro@zeniv.linux.org.uk>, Dan Williams <dan.j.williams@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Magnus Karlsson <magnus.karlsson@intel.com>, Jens Axboe <axboe@kernel.dk>,
 netdev@vger.kernel.org, Alex Williamson <alex.williamson@redhat.com>,
 stable@vger.kernel.org, linux-fsdevel@vger.kernel.org, bpf@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, "David S . Miller" <davem@davemloft.net>,
 Mike Kravetz <mike.kravetz@oracle.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/9/19 4:56 PM, Andrew Morton wrote:
> On Mon, 9 Dec 2019 14:53:35 -0800 John Hubbard <jhubbard@nvidia.com> wrote:
> 
>> After DMA is complete, and the device and CPU caches are synchronized,
>> it's still required to mark the CPU pages as dirty, if the data was
>> coming from the device. However, this driver was just issuing a
>> bare put_page() call, without any set_page_dirty*() call.
>>
>> Fix the problem, by calling set_page_dirty_lock() if the CPU pages
>> were potentially receiving data from the device.
>>
>> Reviewed-by: Christoph Hellwig <hch@lst.de>
>> Acked-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
>> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
>> Cc: <stable@vger.kernel.org>
> 
> What are the user-visible effects of this change?

I'll have to defer to Hans or other experts, because I merely spotted
this by reading the code.

> 
> As it's cc:stable I'd normally send this to Linus within 1-2 weeks, or
> sooner.  Please confirm that this is a standalone fix, independent of
> the rest of this series.
> 
> 

Yes, this is a stand-alone fix. Of course, as part of this series, the
put_page() gets converted to put_user_pages_dirty() in the next patch,
and that in turn gets renamed to unpin_user_pages_dirty() in a later
patch. Just so we keep that in mind when moving patches around.


thanks,
-- 
John Hubbard
NVIDIA
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
