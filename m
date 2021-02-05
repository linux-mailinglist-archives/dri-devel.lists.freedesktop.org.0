Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EB563311250
	for <lists+dri-devel@lfdr.de>; Fri,  5 Feb 2021 21:24:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 049D66F4C7;
	Fri,  5 Feb 2021 20:24:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqnvemgate25.nvidia.com (hqnvemgate25.nvidia.com
 [216.228.121.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 148A46F4C7
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Feb 2021 20:24:49 +0000 (UTC)
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate25.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B601da9900000>; Fri, 05 Feb 2021 12:24:48 -0800
Received: from MacBook-Pro-10.local (172.20.145.6) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 5 Feb
 2021 20:24:39 +0000
Subject: Re: [PATCH v16 0/4] RDMA: Add dma-buf support
To: Daniel Vetter <daniel@ffwll.ch>, Jason Gunthorpe <jgg@nvidia.com>
References: <1608067636-98073-1-git-send-email-jianxin.xiong@intel.com>
 <5e4ac17d-1654-9abc-9a14-bda223d62866@nvidia.com>
 <CADnq5_M2YuOv16E2DG6sCPtL=z5SDDrN+y7iwD_pHVc7Omyrmw@mail.gmail.com>
 <20210204182923.GL4247@nvidia.com>
 <CADnq5_N9QvgAKQMLeutA7oBo5W5XyttvNOMK_siOc6QL+H07jQ@mail.gmail.com>
 <8e731fce-95c1-4ace-d8bc-dc0df7432d22@nvidia.com>
 <YB1mw/uYwueFwUdh@phenom.ffwll.local> <20210205154319.GT4247@nvidia.com>
 <YB1p4Bpmz0yFcbEf@phenom.ffwll.local>
From: John Hubbard <jhubbard@nvidia.com>
Message-ID: <4c339fc3-087b-1008-fb99-7117bf326470@nvidia.com>
Date: Fri, 5 Feb 2021 12:24:38 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:78.0)
 Gecko/20100101 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <YB1p4Bpmz0yFcbEf@phenom.ffwll.local>
Content-Language: en-US
X-Originating-IP: [172.20.145.6]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1612556688; bh=ZGMznwvj1qqDWeGew4C5B7fXOw8LwrqPvnzl+1M1wGQ=;
 h=Subject:To:CC:References:From:Message-ID:Date:User-Agent:
 MIME-Version:In-Reply-To:Content-Type:Content-Language:
 Content-Transfer-Encoding:X-Originating-IP:X-ClientProxiedBy;
 b=rac3tdz3hfQn/kJ44D4FHG4dUgYb1x7VFyiTFED7lB0vBsz4wdruqNLy6TqpIKZzZ
 FuxJ2cvW0K5DIjQvbDxVDFFooDwpuB+gguVFVBCPa9wEiCOySBq5dE00BQ9+Ryxhld
 TideXe2p+NkD1PCv+2Vkubwrf4CZkV9L4mzt8G22XWpqE4iTGb7YUJIfyDohqi7GbX
 NgRnxnAzHu+r2w5ZTj9aCrHZj9dOoi8nX6ml5G9IXchHw5zc34KNF5Pby5nD56gPxf
 xv31Sc5X60lbGuIqYmbd3T/KX5xUYO0dXB9oGZhXubEu01JTKyID6NZXX47I7counu
 rTp2/jZhjO3iw==
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
Cc: Leon Romanovsky <leon@kernel.org>, linux-rdma <linux-rdma@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Doug Ledford <dledford@redhat.com>, Daniel Vetter <daniel.vetter@intel.com>,
 Christian Koenig <christian.koenig@amd.com>,
 Jianxin Xiong <jianxin.xiong@intel.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2/5/21 7:53 AM, Daniel Vetter wrote:
> On Fri, Feb 05, 2021 at 11:43:19AM -0400, Jason Gunthorpe wrote:
>> On Fri, Feb 05, 2021 at 04:39:47PM +0100, Daniel Vetter wrote:
>>
>>>> And again, for slightly older hardware, without pinning to VRAM there is
>>>> no way to use this solution here for peer-to-peer. So I'm glad to see that
>>>> so far you're not ruling out the pinning option.
>>>
>>> Since HMM and ZONE_DEVICE came up, I'm kinda tempted to make ZONE_DEVICE
>>> ZONE_MOVEABLE (at least if you don't have a pinned vram contigent in your
>>> cgroups) or something like that, so we could benefit from the work to make
>>> sure pin_user_pages and all these never end up in there?
>>
>> ZONE_DEVICE should already not be returned from GUP.
>>
>> I've understood in the hmm casse the idea was a CPU touch of some
>> ZONE_DEVICE pages would trigger a migration to CPU memory, GUP would
>> want to follow the same logic, presumably it comes for free with the
>> fault handler somehow
> 
> Oh I didn't know this, I thought the proposed p2p direct i/o patches would
> just use the fact that underneath ZONE_DEVICE there's "normal" struct
> pages. And so I got worried that maybe also pin_user_pages can creep in.
> But I didn't read the patches in full detail:
> 
> https://lore.kernel.org/linux-block/20201106170036.18713-12-logang@deltatee.com/
> 
> But if you're saying that this all needs specific code and all the gup/pup
> code we have is excluded, I think we can make sure that we're not ever
> building features that requiring time-unlimited pinning of ZONE_DEVICE.
> Which I think we want.
> 

 From an HMM perspective, the above sounds about right. HMM relies on the
GPU/device memory being ZONE_DEVICE, *and* on that memory *not* being pinned.
(HMM's mmu notifier callbacks act as a sort of virtual pin, but not a refcount
pin.)

It's a nice clean design point that we need to preserve, and fortunately it
doesn't conflict with anything I'm seeing here. But I want to say this out
loud because I see some doubt about it creeping into the discussion.

thanks,
-- 
John Hubbard
NVIDIA
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
