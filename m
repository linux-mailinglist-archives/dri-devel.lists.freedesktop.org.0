Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EAE263F39AC
	for <lists+dri-devel@lfdr.de>; Sat, 21 Aug 2021 11:16:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E7606EB5A;
	Sat, 21 Aug 2021 09:16:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-fw-9102.amazon.com (smtp-fw-9102.amazon.com
 [207.171.184.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65C166EB5A
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Aug 2021 09:16:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1629537391; x=1661073391;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=6zdtuD4K5LXWMKHYbnVqH1TC+OHwCabeh7riv5NUDRU=;
 b=DsRAjwkrxN52eO2kC6ZXR+YbiIeFkxBK2OIDxybnREXpac63sPFK4hmD
 +U12HkvOdSQ7B+HKHrhxV9jrvvB2fnLg2OaEr6unw4r4nm/Mu/ze3g4ZL
 fe9mpLxPPmjct+CqAGYK+5O751gmTv3fEEm8hyxj94kaIhW+EC4cCFmtX k=;
X-IronPort-AV: E=Sophos;i="5.84,340,1620691200"; d="scan'208";a="154103456"
Received: from pdx4-co-svc-p1-lb2-vlan3.amazon.com (HELO
 email-inbound-relay-2a-1c1b5cdd.us-west-2.amazon.com) ([10.25.36.214])
 by smtp-border-fw-9102.sea19.amazon.com with ESMTP; 21 Aug 2021 09:16:24 +0000
Received: from EX13D19EUB003.ant.amazon.com
 (pdx1-ws-svc-p6-lb9-vlan2.pdx.amazon.com [10.236.137.194])
 by email-inbound-relay-2a-1c1b5cdd.us-west-2.amazon.com (Postfix) with ESMTPS
 id 493B4A26F2; Sat, 21 Aug 2021 09:16:21 +0000 (UTC)
Received: from 8c85908914bf.ant.amazon.com (10.43.160.41) by
 EX13D19EUB003.ant.amazon.com (10.43.166.69) with Microsoft SMTP Server (TLS)
 id 15.0.1497.23; Sat, 21 Aug 2021 09:16:13 +0000
Subject: Re: [RFC] Make use of non-dynamic dmabuf in RDMA
To: Jason Gunthorpe <jgg@ziepe.ca>
CC: Daniel Vetter <daniel@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>, Doug Ledford
 <dledford@redhat.com>, "open list:DMA BUFFER SHARING FRAMEWORK"
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
From: Gal Pressman <galpress@amazon.com>
Message-ID: <da6364b7-9621-a384-23b0-9aa88ae232e5@amazon.com>
Date: Sat, 21 Aug 2021 12:16:08 +0300
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210820143248.GX543798@ziepe.ca>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.43.160.41]
X-ClientProxiedBy: EX13P01UWA001.ant.amazon.com (10.43.160.213) To
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

On 20/08/2021 17:32, Jason Gunthorpe wrote:
> On Fri, Aug 20, 2021 at 03:58:33PM +0300, Gal Pressman wrote:
> 
>> Though it would've been nicer if we could agree on a solution that could work
>> for more than 1-2 RDMA devices, using the existing tools the RDMA subsystem has.
> 
> I don't think it can really be done, revoke is necessary, and isn't a
> primitive we have today.
> 
> Revoke is sort of like rereg MR, but with a guaranteed no-change to
> the lkey/rkey
> 
> Then there is the locking complexity of linking the mr creation and
> destruction to the lifecycle of the pages, which is messy and maybe
> not general. For instance mlx5 would call its revoke_mr, disconnect
> the dmabuf then destroy the mkey - but this is only safe because mlx5
> HW can handle concurrent revokes.

Thanks, that makes sense.

>> That's why I tried to approach this by denying such attachments for non-ODP
>> importers instead of exposing a "limited" dynamic importer.
> 
> That is fine if there is no revoke - once revoke exists we must have
> driver and HW support.

Agree.
IIUC, we're talking about three different exporter "types":
- Dynamic with move_notify (requires ODP)
- Dynamic with revoke_notify
- Static

Which changes do we need to make the third one work?
