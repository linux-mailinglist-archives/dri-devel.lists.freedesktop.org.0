Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85A55C88631
	for <lists+dri-devel@lfdr.de>; Wed, 26 Nov 2025 08:18:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC95810E51A;
	Wed, 26 Nov 2025 07:18:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="CEIH1fQ+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE58210E51A
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Nov 2025 07:18:16 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id C42AD60137;
 Wed, 26 Nov 2025 07:18:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F3AFC113D0;
 Wed, 26 Nov 2025 07:18:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1764141495;
 bh=J54BQzE98MnLEmIufEMpAJUCEWke/kqnYm1g3RjsywA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=CEIH1fQ+ckjTqqcxiqglnl5IKzNcGbjRaLe4CTHvzENXvhzB85inuGiTMqk/X69M8
 aHOb5kqCN12pqzddIJGfE0O0ujFznYma5w7QqAMwEPAjgqNMu8UcRn/Ketobwd48q0
 8uqN2OoJv+thDRULWMny0kS504gyhFki8qeXoP1aXRRiU9Dz6ro9XTKIXnYZ9WL463
 D9JeIdZT2cMFWsi7DYdUUN2OLkN2tsz1Dm5+6h2sCwrP7U3+KmjrdqiDUzdW+Q3n0b
 2eQWFuoNPrs1jWBpt/ipKqhBABnIZ/E30cx+3yGshUz6/bV7qme5G227l42d0prK5l
 XHBESUpn/IPEw==
Date: Wed, 26 Nov 2025 09:18:10 +0200
From: Leon Romanovsky <leon@kernel.org>
To: Alex Mastro <amastro@fb.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Alex Williamson <alex@shazbot.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Kevin Tian <kevin.tian@intel.com>,
 Nicolin Chen <nicolinc@nvidia.com>, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
 Ankit Agrawal <ankita@nvidia.com>
Subject: Re: [PATCH] dma-buf: fix integer overflow in fill_sg_entry() for
 buffers >= 8GiB
Message-ID: <20251126071810.GF12483@unreal>
References: <20251125-dma-buf-overflow-v1-1-b70ea1e6c4ba@fb.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251125-dma-buf-overflow-v1-1-b70ea1e6c4ba@fb.com>
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

On Tue, Nov 25, 2025 at 05:11:18PM -0800, Alex Mastro wrote:
> fill_sg_entry() splits large DMA buffers into multiple scatter-gather
> entries, each holding up to UINT_MAX bytes. When calculating the DMA
> address for entries beyond the second one, the expression (i * UINT_MAX)
> causes integer overflow due to 32-bit arithmetic.
> 
> This manifests when the input arg length >= 8 GiB results in looping for
> i >= 2.
> 
> Fix by casting i to dma_addr_t before multiplication.
> 
> Fixes: 3aa31a8bb11e ("dma-buf: provide phys_vec to scatter-gather mapping routine")
> Signed-off-by: Alex Mastro <amastro@fb.com>
> ---
> More color about how I discovered this in [1] for the commit at [2]:
> 
> [1] https://lore.kernel.org/all/aSZHO6otK0Heh+Qj@devgpu015.cco6.facebook.com
> [2] https://lore.kernel.org/all/20251120-dmabuf-vfio-v9-6-d7f71607f371@nvidia.com
> ---
>  drivers/dma-buf/dma-buf-mapping.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Thanks,
Reviewed-by: Leon Romanovsky <leon@kernel.org>
