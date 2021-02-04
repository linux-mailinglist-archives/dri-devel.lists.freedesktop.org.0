Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E463030EDAA
	for <lists+dri-devel@lfdr.de>; Thu,  4 Feb 2021 08:48:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1366A6ECE9;
	Thu,  4 Feb 2021 07:48:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqnvemgate24.nvidia.com (hqnvemgate24.nvidia.com
 [216.228.121.143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B06336ECE9
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Feb 2021 07:48:57 +0000 (UTC)
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate24.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B601ba6e90000>; Wed, 03 Feb 2021 23:48:57 -0800
Received: from [10.2.50.90] (172.20.145.6) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 4 Feb
 2021 07:48:48 +0000
Subject: Re: [PATCH v16 0/4] RDMA: Add dma-buf support
To: Jianxin Xiong <jianxin.xiong@intel.com>, <linux-rdma@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>
References: <1608067636-98073-1-git-send-email-jianxin.xiong@intel.com>
From: John Hubbard <jhubbard@nvidia.com>
Message-ID: <5e4ac17d-1654-9abc-9a14-bda223d62866@nvidia.com>
Date: Wed, 3 Feb 2021 23:48:48 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:85.0) Gecko/20100101
 Thunderbird/85.0
MIME-Version: 1.0
In-Reply-To: <1608067636-98073-1-git-send-email-jianxin.xiong@intel.com>
Content-Language: en-US
X-Originating-IP: [172.20.145.6]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1612424937; bh=alcGj/A8SKeiAR0MFZN9AYw8+7za61R+PH3RiAuD15w=;
 h=Subject:To:CC:References:From:Message-ID:Date:User-Agent:
 MIME-Version:In-Reply-To:Content-Type:Content-Language:
 Content-Transfer-Encoding:X-Originating-IP:X-ClientProxiedBy;
 b=SVrbdc1CDRz+lmunAKbsH85fK2fsA61ndMm0kioS6EWP6r/VroL39DWB9UZJmBXZu
 HEyeEH3h/4ZvWUBJrDxGBSKWjRZyHVS99Qac0tr5M3BCdt0vEI3wvT5bpfPGxv3nxu
 AQe/CDiEzz9OlHO2w8cHCpGn4rzHBbu/FcvygoiC8EAgL2VToKxOiaRnZMBTT5qR0g
 ajYpFGIwUWfsqrwI/eKB4KWzJH75+GqoHUPGL3h87rdlQH8GUxtCvBsNkFuTouExRs
 G6VfnYU8lT8x1XX5vBTnOUhcpfEtLFv6JuXhd6OLeAvCXz7uwZqKzdvyli4sRn4REI
 daDg9OI+PRUHQ==
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
Cc: Leon
 Romanovsky <leon@kernel.org>, Christian Koenig <christian.koenig@amd.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Doug Ledford <dledford@redhat.com>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/15/20 1:27 PM, Jianxin Xiong wrote:
> This patch series adds dma-buf importer role to the RDMA driver in
> attempt to support RDMA using device memory such as GPU VRAM. Dma-buf is
> chosen for a few reasons: first, the API is relatively simple and allows
> a lot of flexibility in implementing the buffer manipulation ops.
> Second, it doesn't require page structure. Third, dma-buf is already
> supported in many GPU drivers. However, we are aware that existing GPU
> drivers don't allow pinning device memory via the dma-buf interface.
> Pinning would simply cause the backing storage to migrate to system RAM.
> True peer-to-peer access is only possible using dynamic attach, which
> requires on-demand paging support from the NIC to work. For this reason,
> this series only works with ODP capable NICs.

Hi,

Looking ahead to after this patchset is merged...

Are there design thoughts out there, about the future of pinning to vidmem,
for this? It would allow a huge group of older GPUs and NICs and such to
do p2p with this approach, and it seems like a natural next step, right?


thanks,
-- 
John Hubbard
NVIDIA
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
