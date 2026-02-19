Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id exjQF6GWlmlXhwIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 19 Feb 2026 05:50:41 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A229015C0E6
	for <lists+dri-devel@lfdr.de>; Thu, 19 Feb 2026 05:50:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6D9A10E067;
	Thu, 19 Feb 2026 04:50:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="kcP4+gNS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 418 seconds by postgrey-1.36 at gabe;
 Thu, 19 Feb 2026 04:50:33 UTC
Received: from out-170.mta0.migadu.com (out-170.mta0.migadu.com
 [91.218.175.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8118110E067
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Feb 2026 04:50:33 +0000 (UTC)
Message-ID: <7b4d9e08-122b-4c4b-868e-d48ec0f59dce@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1771476212;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MzIYd8Bu6oYmjdq1gkTQwThMj3+Mr0OUwvt9JYbMgDg=;
 b=kcP4+gNSFzT9Ojfg+u/nAE86J7X1YCQaUm0MRgc4M1bbjaYv/sUhB2LoobSiDSzjlxTWYK
 cq1k7BbKRZCoRq80TBaGDCvJFTcp1jqbhrIUqKDk6pGLptfmyFaHzocLljJ1A5I4KeSLFf
 KYzXLrMumHfN0sB8IyBtf5Df95DLUeI=
Date: Wed, 18 Feb 2026 20:43:26 -0800
MIME-Version: 1.0
Subject: Re: [RFC PATCH v4 0/2] RDMA/rxe: Add dma-buf support
To: Shunsuke Mie <mie@igel.co.jp>, Zhu Yanjun <zyjzyj2000@gmail.com>
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Doug Ledford <dledford@redhat.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Jianxin Xiong <jianxin.xiong@intel.com>,
 Leon Romanovsky <leon@kernel.org>, Maor Gottlieb <maorg@nvidia.com>,
 Sean Hefty <sean.hefty@intel.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-rdma@vger.kernel.org, dhobsong@igel.co.jp, taki@igel.co.jp,
 etom@igel.co.jp
References: <20211122110817.33319-1-mie@igel.co.jp>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Zhu Yanjun <yanjun.zhu@linux.dev>
In-Reply-To: <20211122110817.33319-1-mie@igel.co.jp>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[linux.dev,none];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[linux.dev:s=key1];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:mie@igel.co.jp,m:zyjzyj2000@gmail.com,m:christian.koenig@amd.com,m:alexander.deucher@amd.com,m:daniel.vetter@ffwll.ch,m:dledford@redhat.com,m:jgg@ziepe.ca,m:jianxin.xiong@intel.com,m:leon@kernel.org,m:maorg@nvidia.com,m:sean.hefty@intel.com,m:sumit.semwal@linaro.org,m:linaro-mm-sig@lists.linaro.org,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-rdma@vger.kernel.org,m:dhobsong@igel.co.jp,m:taki@igel.co.jp,m:etom@igel.co.jp,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[igel.co.jp,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORGED_SENDER(0.00)[yanjun.zhu@linux.dev,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[linux.dev:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yanjun.zhu@linux.dev,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.dev:mid,linux.dev:dkim,spinics.net:url,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: A229015C0E6
X-Rspamd-Action: no action

在 2021/11/22 3:08, Shunsuke Mie 写道:
> This patch series add a dma-buf support for rxe driver.
> 
> A dma-buf based memory registering has beed introduced to use the memory
> region that lack of associated page structures (e.g. device memory and CMA
> managed memory) [1]. However, to use the dma-buf based memory, each rdma
> device drivers require add some implementation. The rxe driver has not
> support yet.
> 
> [1] https://www.spinics.net/lists/linux-rdma/msg98592.html
> 
> To enable to use the dma-buf memory in rxe rdma device, add some changes
> and implementation in this patch series.
> 
> This series consists of two patches. The first patch changes the IB core
> to support for rdma drivers that has not dma device. The secound patch adds
> the dma-buf support to rxe driver.
> 
Hi, Shunsuke Mie

I was revisiting your 2021 proposal around dma-buf integration with RDMA 
and the related discussions at the time.

As you know, dma-buf usage in RDMA-related workflows has gained more 
traction recently, and we are seeing increasing interest in 
heterogeneous memory and cross-device buffer sharing. Given the changes 
in the ecosystem since then, I’m wondering whether you think the 
original direction might be worth reconsidering.

Do you have any interest in continuing that line of work, or updating 
the design based on today’s context? If not, I’d still appreciate your 
perspective on what you see as the main blockers from the previous 
discussions, and whether you think the landscape has changed enough to 
justify another attempt.

Depending on the direction, we may consider exploring dma-buf support in 
rxe or at the core level, but I’d prefer to first understand your view 
before moving forward.

Zhu Yanjun

> Related user space RDMA library changes are provided as a separate patch.
> 
> v4:
> * Fix warnings, unused variable and casting
> v3: https://www.spinics.net/lists/linux-rdma/msg106776.html
> * Rebase to the latest linux-rdma 'for-next' branch (5.15.0-rc6+)
> * Fix to use dma-buf-map helpers
> v2: https://www.spinics.net/lists/linux-rdma/msg105928.html
> * Rebase to the latest linux-rdma 'for-next' branch (5.15.0-rc1+)
> * Instead of using a dummy dma_device to attach dma-buf, just store
>    dma-buf to use software RDMA driver
> * Use dma-buf vmap() interface
> * Check to pass tests of rdma-core
> v1: https://www.spinics.net/lists/linux-rdma/msg105376.html
> * The initial patch set
> * Use ib_device as dma_device.
> * Use dma-buf dynamic attach interface
> * Add dma-buf support to rxe device
> 
> Shunsuke Mie (2):
>    RDMA/umem: Change for rdma devices has not dma device
>    RDMA/rxe: Add dma-buf support
> 
>   drivers/infiniband/core/umem_dmabuf.c |  20 ++++-
>   drivers/infiniband/sw/rxe/rxe_loc.h   |   2 +
>   drivers/infiniband/sw/rxe/rxe_mr.c    | 113 ++++++++++++++++++++++++++
>   drivers/infiniband/sw/rxe/rxe_verbs.c |  34 ++++++++
>   include/rdma/ib_umem.h                |   1 +
>   5 files changed, 166 insertions(+), 4 deletions(-)
> 

