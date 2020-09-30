Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D49B527FB3F
	for <lists+dri-devel@lfdr.de>; Thu,  1 Oct 2020 10:16:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB83D6E868;
	Thu,  1 Oct 2020 08:15:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqnvemgate24.nvidia.com (hqnvemgate24.nvidia.com
 [216.228.121.143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23AF089BBD;
 Wed, 30 Sep 2020 11:54:12 +0000 (UTC)
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate24.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B5f74717c0003>; Wed, 30 Sep 2020 04:52:28 -0700
Received: from [172.27.13.156] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 30 Sep
 2020 11:54:01 +0000
Subject: Re: [PATCH rdma-next v4 4/4] RDMA/umem: Move to allocate SG table
 from pages
To: Jason Gunthorpe <jgg@nvidia.com>, Leon Romanovsky <leon@kernel.org>
References: <20200927064647.3106737-1-leon@kernel.org>
 <20200927064647.3106737-5-leon@kernel.org>
 <20200929195929.GA803555@nvidia.com> <20200930095321.GL3094@unreal>
 <20200930114527.GE816047@nvidia.com>
From: Maor Gottlieb <maorg@nvidia.com>
Message-ID: <80c49ff1-52c7-638f-553f-9de8130b188d@nvidia.com>
Date: Wed, 30 Sep 2020 14:53:58 +0300
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.2.2
MIME-Version: 1.0
In-Reply-To: <20200930114527.GE816047@nvidia.com>
Content-Language: en-US
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1601466748; bh=JrI2d4YXJ+ZJzjvNkbDB4ae47+R0rDj3IRn0QrupftE=;
 h=Subject:To:CC:References:From:Message-ID:Date:User-Agent:
 MIME-Version:In-Reply-To:Content-Type:Content-Transfer-Encoding:
 Content-Language:X-Originating-IP:X-ClientProxiedBy;
 b=DjIqutJWn/y5vqmm+F2zgD3Ixz/8fSMX3REWMs9bRFv3zCf7HHOv860pefzmHelab
 IwuLVcprYTQ7cnNyelJq0g3Qt63DXytSdX6pRVHwOYeq3Dl+XeYFqFCp+T/LQzlLQr
 GGWGWlVCcNJCaTgBB+V67t6kiaOoAOv5ELsu9N/zXPclP/Ado1L8nCrjRNb+I2ImiI
 c5s5FZTmrFLTsFRphu+wdQsTw2eTd5XeZWPlKJJHx+1e7T1KAcX+GKHfbNCkCI5j7O
 y6JYiuNVKDNS6zEYGFaMswMBr0QOxCqJJcoffkt9MZm4eULAdfxZiR5wHB0851d8LS
 dJDsIwJ3rGjZA==
X-Mailman-Approved-At: Thu, 01 Oct 2020 08:15:43 +0000
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>, David Airlie <airlied@linux.ie>,
 intel-gfx@lists.freedesktop.org, Roland
 Scheidegger <sroland@vmware.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-rdma@vger.kernel.org,
 Doug Ledford <dledford@redhat.com>,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Christoph Hellwig <hch@lst.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 9/30/2020 2:45 PM, Jason Gunthorpe wrote:
> On Wed, Sep 30, 2020 at 12:53:21PM +0300, Leon Romanovsky wrote:
>> On Tue, Sep 29, 2020 at 04:59:29PM -0300, Jason Gunthorpe wrote:
>>> On Sun, Sep 27, 2020 at 09:46:47AM +0300, Leon Romanovsky wrote:
>>>> @@ -296,11 +223,17 @@ static struct ib_umem *__ib_umem_get(struct ib_device *device,
>>>>   			goto umem_release;
>>>>
>>>>   		cur_base += ret * PAGE_SIZE;
>>>> -		npages   -= ret;
>>>> -
>>>> -		sg = ib_umem_add_sg_table(sg, page_list, ret,
>>>> -			dma_get_max_seg_size(device->dma_device),
>>>> -			&umem->sg_nents);
>>>> +		npages -= ret;
>>>> +		sg = __sg_alloc_table_from_pages(
>>>> +			&umem->sg_head, page_list, ret, 0, ret << PAGE_SHIFT,
>>>> +			dma_get_max_seg_size(device->dma_device), sg, npages,
>>>> +			GFP_KERNEL);
>>>> +		umem->sg_nents = umem->sg_head.nents;
>>>> +		if (IS_ERR(sg)) {
>>>> +			unpin_user_pages_dirty_lock(page_list, ret, 0);
>>>> +			ret = PTR_ERR(sg);
>>>> +			goto umem_release;
>>>> +		}
>>>>   	}
>>>>
>>>>   	sg_mark_end(sg);
>>> Does it still need the sg_mark_end?
>> It is preserved here for correctness, the release logic doesn't rely on
>> this marker, but it is better to leave it.
> I mean, my read of __sg_alloc_table_from_pages() is that it already
> placed it, the final __alloc_table() does it?
>
> Jason


It marks the last allocated sge, but not the last populated sge (with page).

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
