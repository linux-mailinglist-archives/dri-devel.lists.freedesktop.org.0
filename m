Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7763A43AD3C
	for <lists+dri-devel@lfdr.de>; Tue, 26 Oct 2021 09:34:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C04789DB2;
	Tue, 26 Oct 2021 07:34:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 480 seconds by postgrey-1.36 at gabe;
 Tue, 26 Oct 2021 06:18:32 UTC
Received: from out0.migadu.com (out0.migadu.com [94.23.1.103])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 447E06E2B4
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Oct 2021 06:18:32 +0000 (UTC)
Message-ID: <1d60192a-0eec-70ed-9c3c-8e6f3866d99c@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1635228629;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oBQbtnpH+00gV7mBGAxGI5OEydFCoAjp1v+/FzoQd1k=;
 b=J+BKMrUXFE4YEUzli0oDEhIbt38gYW1tEOzDBCtkYly1rEGQeGMsw8UvDnRTiDbVeiugqj
 fA6eoevDZXQa+EntqUz6Tjr9ZMV23IJQ3P/aTu3vyJDm4LOzFlrVPGXAUHj7QufCLzyQNX
 bsGXPfbtlWYVe8wBSURqPlQfF0UPRa0=
Date: Tue, 26 Oct 2021 09:10:26 +0300
MIME-Version: 1.0
Subject: Re: [PATCH for-next 0/3] EFA dmabuf memory regions
Content-Language: en-US
To: Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Doug Ledford <dledford@redhat.com>, Jason Gunthorpe <jgg@ziepe.ca>
Cc: linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-rdma@vger.kernel.org,
 Oded Gabbay <ogabbay@habana.ai>, Tomer Tayar <ttayar@habana.ai>,
 Yossi Leybovich <sleybo@amazon.com>, Alexander Matushevsky
 <matua@amazon.com>, Leon Romanovsky <leonro@nvidia.com>,
 Jianxin Xiong <jianxin.xiong@intel.com>, Firas Jahjah <firasj@amazon.com>
References: <20211012120903.96933-1-galpress@amazon.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Gal Pressman <gal.pressman@linux.dev>
In-Reply-To: <20211012120903.96933-1-galpress@amazon.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-Migadu-Auth-User: gal.pressman@linux.dev
X-Mailman-Approved-At: Tue, 26 Oct 2021 07:33:59 +0000
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

On 12/10/2021 15:09, Gal Pressman wrote:
> Hey all,
>
> This is a followup to my previous RFCs [1][2], which now adds a new api
> to the RDMA subsystem that allows drivers to get a pinned dmabuf memory
> region without requiring an implementation of the move_notify callback.
> The new api makes use of the dynamic attachment api implemented in the
> RDMA subsystem, but calls dma_buf_pin() in order to make sure that the
> callback will not be called, as suggested by Christian.
>
> As explained in the previous RFC, move_notify requires the RDMA device
> to support on-demand-paging (ODP) which is not common on most devices
> (only supported by mlx5).
>
> While the dynamic requirement makes sense for certain GPUs, some devices
> (such as habanalabs) have device memory that is always "pinned" and do
> not need/use the move_notify operation.
>
> Patch #1 changes the dmabuf documentation to make it clear that pinning
> does not necessarily mean the memory must be moved to system memory, it
> is up to the exporter to decide.
> Patch #2 adds the RDMA api that allows drivers to get pinned dmabuf
> memory regions.
> Patch #3 adds the EFA implementation of the dmabuf importer.
>
> The motivation of this submission is to use habanalabs as the dmabuf
> exporter, and EFA as the importer to allow for peer2peer access through
> libibverbs.
>
> [1] https://lore.kernel.org/linux-rdma/20210818074352.29950-1-galpress@amazon.com/
> [2] https://lore.kernel.org/linux-rdma/20211007104301.76693-1-galpress@amazon.com/
>
> Thanks


Hey Jason, did you get a chance to take a look?

