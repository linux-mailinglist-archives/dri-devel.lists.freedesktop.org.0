Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3933A3F5A6F
	for <lists+dri-devel@lfdr.de>; Tue, 24 Aug 2021 11:06:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CE2D89369;
	Tue, 24 Aug 2021 09:06:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-fw-9103.amazon.com (smtp-fw-9103.amazon.com
 [207.171.188.200])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0968B89369
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Aug 2021 09:06:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1629795987; x=1661331987;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=rnUhlHPoIJ2Phd42u7TjZjB5NMBB69P1r79MOcj/MTY=;
 b=j1xf+0+15eAewZn+AnN9lMv89iu1epkfFIEhtU22g+o28qWfa/kB+cQb
 c2u13EH6VgUkcMs0Bh07QJKktao8uZIPi6xILrEfP8tSYAH9YkPAanKpa
 5laxIstYSiy6TkKIY3aWdg/928GoDzmB+q3klRng+Yb2p3YC27Fm15gUh Y=;
X-IronPort-AV: E=Sophos;i="5.84,346,1620691200"; d="scan'208";a="952569221"
Received: from pdx4-co-svc-p1-lb2-vlan2.amazon.com (HELO
 email-inbound-relay-1e-28209b7b.us-east-1.amazon.com) ([10.25.36.210])
 by smtp-border-fw-9103.sea19.amazon.com with ESMTP; 24 Aug 2021 09:06:18 +0000
Received: from EX13D19EUB003.ant.amazon.com
 (iad12-ws-svc-p26-lb9-vlan3.iad.amazon.com [10.40.163.38])
 by email-inbound-relay-1e-28209b7b.us-east-1.amazon.com (Postfix) with ESMTPS
 id 3FB57BFD9A; Tue, 24 Aug 2021 09:06:12 +0000 (UTC)
Received: from 8c85908914bf.ant.amazon.com (10.43.162.216) by
 EX13D19EUB003.ant.amazon.com (10.43.166.69) with Microsoft SMTP Server (TLS)
 id 15.0.1497.23; Tue, 24 Aug 2021 09:06:05 +0000
Subject: Re: [RFC] Make use of non-dynamic dmabuf in RDMA
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>, Jason
 Gunthorpe <jgg@ziepe.ca>
CC: Daniel Vetter <daniel@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>,
 Doug Ledford <dledford@redhat.com>, "open list:DMA BUFFER SHARING FRAMEWORK"
 <linux-media@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-rdma
 <linux-rdma@vger.kernel.org>, Oded Gabbay <ogabbay@habana.ai>, Tomer Tayar
 <ttayar@habana.ai>, Yossi Leybovich <sleybo@amazon.com>, Alexander
 Matushevsky <matua@amazon.com>, Leon Romanovsky <leonro@nvidia.com>, Jianxin
 Xiong <jianxin.xiong@intel.com>, John Hubbard <jhubbard@nvidia.com>
References: <20210818074352.29950-1-galpress@amazon.com>
 <CAKMK7uGZ_eX+XfYJU6EkKEOVrHz3q6QMxaEbyyD3_1iqj9YSjw@mail.gmail.com>
 <20210819230602.GU543798@ziepe.ca>
 <CAKMK7uGgQWcs4Va6TGN9akHSSkmTs1i0Kx+6WpeiXWhJKpasLA@mail.gmail.com>
 <20210820123316.GV543798@ziepe.ca>
 <0fc94ac0-2bb9-4835-62b8-ea14f85fe512@amazon.com>
 <20210820143248.GX543798@ziepe.ca>
 <da6364b7-9621-a384-23b0-9aa88ae232e5@amazon.com>
 <fa124990-ee0c-7401-019e-08109e338042@amd.com>
From: Gal Pressman <galpress@amazon.com>
Message-ID: <e2c47256-de89-7eaa-e5c2-5b96efcec834@amazon.com>
Date: Tue, 24 Aug 2021 12:06:00 +0300
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <fa124990-ee0c-7401-019e-08109e338042@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.43.162.216]
X-ClientProxiedBy: EX13D10UWA003.ant.amazon.com (10.43.160.248) To
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

On 23/08/2021 13:43, Christian König wrote:
> Am 21.08.21 um 11:16 schrieb Gal Pressman:
>> On 20/08/2021 17:32, Jason Gunthorpe wrote:
>>> On Fri, Aug 20, 2021 at 03:58:33PM +0300, Gal Pressman wrote:
>>>
>>>> Though it would've been nicer if we could agree on a solution that could work
>>>> for more than 1-2 RDMA devices, using the existing tools the RDMA subsystem
>>>> has.
>>> I don't think it can really be done, revoke is necessary, and isn't a
>>> primitive we have today.
>>>
>>> Revoke is sort of like rereg MR, but with a guaranteed no-change to
>>> the lkey/rkey
>>>
>>> Then there is the locking complexity of linking the mr creation and
>>> destruction to the lifecycle of the pages, which is messy and maybe
>>> not general. For instance mlx5 would call its revoke_mr, disconnect
>>> the dmabuf then destroy the mkey - but this is only safe because mlx5
>>> HW can handle concurrent revokes.
>> Thanks, that makes sense.
>>
>>>> That's why I tried to approach this by denying such attachments for non-ODP
>>>> importers instead of exposing a "limited" dynamic importer.
>>> That is fine if there is no revoke - once revoke exists we must have
>>> driver and HW support.
>> Agree.
>> IIUC, we're talking about three different exporter "types":
>> - Dynamic with move_notify (requires ODP)
>> - Dynamic with revoke_notify
>> - Static
>>
>> Which changes do we need to make the third one work?
> 
> Basically none at all in the framework.
> 
> You just need to properly use the dma_buf_pin() function when you start using a
> buffer (e.g. before you create an attachment) and the dma_buf_unpin() function
> after you are done with the DMA-buf.

I replied to your previous mail, but I'll ask again.
Doesn't the pin operation migrate the memory to host memory?
