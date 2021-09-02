Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D37323FE996
	for <lists+dri-devel@lfdr.de>; Thu,  2 Sep 2021 08:57:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 447106E459;
	Thu,  2 Sep 2021 06:57:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-fw-80007.amazon.com (smtp-fw-80007.amazon.com
 [99.78.197.218])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B91F76E459
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Sep 2021 06:57:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1630565837; x=1662101837;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=XBXHWrVSJO9nDb98gdSK+8+MX1E89cWhhkrCj5FfjoM=;
 b=sqbXDH4bk6CjE89I/6roygexM24wzPPTXoszYX76lAknjnBWhgZNR5GX
 S+EAQxTAwM87mymzQaEonParZr6aktdu2AixZ8JRGWEkLeGOYPn4kSWnE
 9HQkNQa9HbYQ0FHdFhHGP69Pi+Fw1Eev+AokQcNVimCTPt8WTKgOSeuhe I=;
X-IronPort-AV: E=Sophos;i="5.84,371,1620691200"; d="scan'208";a="23868928"
Received: from pdx4-co-svc-p1-lb2-vlan2.amazon.com (HELO
 email-inbound-relay-1e-42f764a0.us-east-1.amazon.com) ([10.25.36.210])
 by smtp-border-fw-80007.pdx80.corp.amazon.com with ESMTP;
 02 Sep 2021 06:57:09 +0000
Received: from EX13D19EUB003.ant.amazon.com
 (iad12-ws-svc-p26-lb9-vlan3.iad.amazon.com [10.40.163.38])
 by email-inbound-relay-1e-42f764a0.us-east-1.amazon.com (Postfix) with ESMTPS
 id 68570C00DC; Thu,  2 Sep 2021 06:57:04 +0000 (UTC)
Received: from 8c85908914bf.ant.amazon.com (10.43.162.216) by
 EX13D19EUB003.ant.amazon.com (10.43.166.69) with Microsoft SMTP Server (TLS)
 id 15.0.1497.23; Thu, 2 Sep 2021 06:56:55 +0000
Subject: Re: [RFC] Make use of non-dynamic dmabuf in RDMA
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>, Jason
 Gunthorpe <jgg@ziepe.ca>, John Hubbard <jhubbard@nvidia.com>
CC: Daniel Vetter <daniel@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>,
 Doug Ledford <dledford@redhat.com>, "open list:DMA BUFFER SHARING FRAMEWORK"
 <linux-media@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-rdma
 <linux-rdma@vger.kernel.org>, Oded Gabbay <ogabbay@habana.ai>, Tomer Tayar
 <ttayar@habana.ai>, Yossi Leybovich <sleybo@amazon.com>, Alexander
 Matushevsky <matua@amazon.com>, Leon Romanovsky <leonro@nvidia.com>, Jianxin
 Xiong <jianxin.xiong@intel.com>
References: <20210819230602.GU543798@ziepe.ca>
 <CAKMK7uGgQWcs4Va6TGN9akHSSkmTs1i0Kx+6WpeiXWhJKpasLA@mail.gmail.com>
 <20210820123316.GV543798@ziepe.ca>
 <0fc94ac0-2bb9-4835-62b8-ea14f85fe512@amazon.com>
 <20210820143248.GX543798@ziepe.ca>
 <da6364b7-9621-a384-23b0-9aa88ae232e5@amazon.com>
 <fa124990-ee0c-7401-019e-08109e338042@amd.com>
 <e2c47256-de89-7eaa-e5c2-5b96efcec834@amazon.com>
 <6b819064-feda-b70b-ea69-eb0a4fca6c0c@amd.com>
 <a9604a39-d08f-6263-4c5b-a2bc9a70583d@nvidia.com>
 <20210824173228.GE543798@ziepe.ca>
 <b961e093-b14c-fcdc-e2fc-6ca00cde000c@amazon.com>
 <98463545-c27a-77e6-0a5c-a658743ce86e@amd.com>
From: Gal Pressman <galpress@amazon.com>
Message-ID: <fc0e7327-a669-9870-b325-f7940ad912ee@amazon.com>
Date: Thu, 2 Sep 2021 09:56:50 +0300
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <98463545-c27a-77e6-0a5c-a658743ce86e@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.43.162.216]
X-ClientProxiedBy: EX13D32UWA001.ant.amazon.com (10.43.160.4) To
 EX13D19EUB003.ant.amazon.com (10.43.166.69)
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 01/09/2021 14:24, Christian König wrote:
> 
> 
> Am 01.09.21 um 13:20 schrieb Gal Pressman:
>> On 24/08/2021 20:32, Jason Gunthorpe wrote:
>>> On Tue, Aug 24, 2021 at 10:27:23AM -0700, John Hubbard wrote:
>>>> On 8/24/21 2:32 AM, Christian König wrote:
>>>>> Am 24.08.21 um 11:06 schrieb Gal Pressman:
>>>>>> On 23/08/2021 13:43, Christian König wrote:
>>>>>>> Am 21.08.21 um 11:16 schrieb Gal Pressman:
>>>>>>>> On 20/08/2021 17:32, Jason Gunthorpe wrote:
>>>>>>>>> On Fri, Aug 20, 2021 at 03:58:33PM +0300, Gal Pressman wrote:
>>>> ...
>>>>>>>> IIUC, we're talking about three different exporter "types":
>>>>>>>> - Dynamic with move_notify (requires ODP)
>>>>>>>> - Dynamic with revoke_notify
>>>>>>>> - Static
>>>>>>>>
>>>>>>>> Which changes do we need to make the third one work?
>>>>>>> Basically none at all in the framework.
>>>>>>>
>>>>>>> You just need to properly use the dma_buf_pin() function when you start
>>>>>>> using a
>>>>>>> buffer (e.g. before you create an attachment) and the dma_buf_unpin()
>>>>>>> function
>>>>>>> after you are done with the DMA-buf.
>>>>>> I replied to your previous mail, but I'll ask again.
>>>>>> Doesn't the pin operation migrate the memory to host memory?
>>>>> Sorry missed your previous reply.
>>>>>
>>>>> And yes at least for the amdgpu driver we migrate the memory to host
>>>>> memory as soon as it is pinned and I would expect that other GPU drivers
>>>>> do something similar.
>>>> Well...for many topologies, migrating to host memory will result in a
>>>> dramatically slower p2p setup. For that reason, some GPU drivers may
>>>> want to allow pinning of video memory in some situations.
>>>>
>>>> Ideally, you've got modern ODP devices and you don't even need to pin.
>>>> But if not, and you still hope to do high performance p2p between a GPU
>>>> and a non-ODP Infiniband device, then you would need to leave the pinned
>>>> memory in vidmem.
>>>>
>>>> So I think we don't want to rule out that behavior, right? Or is the
>>>> thinking more like, "you're lucky that this old non-ODP setup works at
>>>> all, and we'll make it work by routing through host/cpu memory, but it
>>>> will be slow"?
>>> I think it depends on the user, if the user creates memory which is
>>> permanently located on the GPU then it should be pinnable in this way
>>> without force migration. But if the memory is inherently migratable
>>> then it just cannot be pinned in the GPU at all as we can't
>>> indefinately block migration from happening eg if the CPU touches it
>>> later or something.
>> So are we OK with exporters implementing dma_buf_pin() without migrating the
>> memory?
> 
> I think so, yes.
> 
>> If so, do we still want a move_notify callback for non-dynamic importers? A noop?
> 
> Well we could make the move_notify callback optional, e.g. so that you get the
> new locking approach but still pin the buffers manually with dma_buf_pin().

Thanks Christian!
So the end result will look similar to the original patch I posted, where
peer2peer can be enabled without providing move_notify, correct?
