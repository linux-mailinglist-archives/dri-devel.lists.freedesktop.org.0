Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 021F63EFF58
	for <lists+dri-devel@lfdr.de>; Wed, 18 Aug 2021 10:38:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BA606E4C5;
	Wed, 18 Aug 2021 08:38:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-fw-6001.amazon.com (smtp-fw-6001.amazon.com [52.95.48.154])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73B596E4C5
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Aug 2021 08:38:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1629275889; x=1660811889;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=Cs2eoNXPps/j86YzVA6CeH9OzMSl/g0AtoxGtzsYxzY=;
 b=qSapbQxehzaU32dJowTQiT9U5GMy1Wr/Wm99Ww4jPUbNgboz3Q6i9sRU
 M3T48yGXJWEUnzClJfY6llfwzINb++3ADoPka39soto670rtKrRl3Pmy+
 l08f/KN4DebOwXOq7TkM8UGxN2ykxof1Ll+lBfkVac4MJUYAzCPA6Rkxu E=;
X-IronPort-AV: E=Sophos;i="5.84,330,1620691200"; d="scan'208";a="134675497"
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-1d-38ae4ad2.us-east-1.amazon.com) ([10.43.8.6])
 by smtp-border-fw-6001.iad6.amazon.com with ESMTP; 18 Aug 2021 08:38:01 +0000
Received: from EX13D19EUB003.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1d-38ae4ad2.us-east-1.amazon.com (Postfix) with ESMTPS
 id E0809A299E; Wed, 18 Aug 2021 08:37:56 +0000 (UTC)
Received: from 8c85908914bf.ant.amazon.com (10.43.160.90) by
 EX13D19EUB003.ant.amazon.com (10.43.166.69) with Microsoft SMTP Server (TLS)
 id 15.0.1497.23; Wed, 18 Aug 2021 08:37:49 +0000
Subject: Re: [RFC] Make use of non-dynamic dmabuf in RDMA
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>, Sumit Semwal
 <sumit.semwal@linaro.org>, Doug Ledford <dledford@redhat.com>, Jason
 Gunthorpe <jgg@ziepe.ca>
CC: <linux-media@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <linux-rdma@vger.kernel.org>, Oded Gabbay
 <ogabbay@habana.ai>, Tomer Tayar <ttayar@habana.ai>, Yossi Leybovich
 <sleybo@amazon.com>, Alexander Matushevsky <matua@amazon.com>, Leon
 Romanovsky <leonro@nvidia.com>, Jianxin Xiong <jianxin.xiong@intel.com>
References: <20210818074352.29950-1-galpress@amazon.com>
 <3abaef49-2733-8b5e-3eaa-662a2a57b96e@amd.com>
From: Gal Pressman <galpress@amazon.com>
Message-ID: <01573693-cf7a-a160-2f60-5049dfba1ecd@amazon.com>
Date: Wed, 18 Aug 2021 11:37:31 +0300
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <3abaef49-2733-8b5e-3eaa-662a2a57b96e@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.43.160.90]
X-ClientProxiedBy: EX13D42UWB003.ant.amazon.com (10.43.161.45) To
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

On 18/08/2021 11:00, Christian König wrote:
> Am 18.08.21 um 09:43 schrieb Gal Pressman:
>> Hey all,
>>
>> Currently, the RDMA subsystem can only work with dynamic dmabuf
>> attachments, which requires the RDMA device to support on-demand-paging
>> (ODP) which is not common on most devices (only supported by mlx5).
>>
>> While the dynamic requirement makes sense for certain GPUs, some devices
>> (such as habanalabs) have device memory that is always "pinned" and do
>> not need/use the move_notify operation.
>>
>> The motivation of this RFC is to use habanalabs as the dmabuf exporter,
>> and EFA as the importer to allow for peer2peer access through libibverbs.
>>
>> This draft patch changes the dmabuf driver to differentiate between
>> static/dynamic attachments by looking at the move_notify op instead of
>> the importer_ops struct, and allowing the peer2peer flag to be enabled
>> in case of a static exporter.
> 
> Well NAK to the general approach, this can be solved much easier.
> 
> If you can't support dynamic moves while using the buffer then just pin all
> buffers during import/export.
> 
> This avoids the move notification and the framework/exporter can still correctly
> account for pinned buffers.
> 
> But please note that at least amdgpu never uses P2P support for pinned buffers
> since we want to avoid that unmoveable buffers clutter video memory and create
> conflicts with V4L and scanout.
> 
> If you don't have such concerns in habanalabs then you can implement the pinning
> there while keeping P2P still enabled.
Thanks Christian!

Are you suggesting to pass an empty move_notify callback instead of passing NULL?
Also, doesn't the pin operation move the memory from the device to host memory?
