Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C7C34AD329
	for <lists+dri-devel@lfdr.de>; Tue,  8 Feb 2022 09:24:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7DF210E446;
	Tue,  8 Feb 2022 08:23:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1142 seconds by postgrey-1.36 at gabe;
 Tue, 08 Feb 2022 03:22:42 UTC
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 785CD10E280;
 Tue,  8 Feb 2022 03:22:42 +0000 (UTC)
Received: from canpemm500002.china.huawei.com (unknown [172.30.72.57])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4Jt78W1rN6z9rvT;
 Tue,  8 Feb 2022 11:02:03 +0800 (CST)
Received: from [10.174.177.76] (10.174.177.76) by
 canpemm500002.china.huawei.com (7.192.104.244) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Tue, 8 Feb 2022 11:03:33 +0800
Subject: Re: start sorting out the ZONE_DEVICE refcount mess
To: Christoph Hellwig <hch@lst.de>
References: <20220207063249.1833066-1-hch@lst.de>
From: Miaohe Lin <linmiaohe@huawei.com>
Message-ID: <8efd8321-8f0b-e5c3-8837-b0fe62f36c14@huawei.com>
Date: Tue, 8 Feb 2022 11:03:32 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20220207063249.1833066-1-hch@lst.de>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.177.76]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 canpemm500002.china.huawei.com (7.192.104.244)
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Tue, 08 Feb 2022 08:23:40 +0000
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
Cc: nvdimm@lists.linux.dev, Ralph Campbell <rcampbell@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, dri-devel@lists.freedesktop.org,
 Karol Herbst <kherbst@redhat.com>, linux-mm@kvack.org,
 nouveau@lists.freedesktop.org, Felix Kuehling <Felix.Kuehling@amd.com>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, Dan Williams <dan.j.williams@intel.com>,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Jason Gunthorpe <jgg@ziepe.ca>, Ben Skeggs <bskeggs@redhat.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Logan Gunthorpe <logang@deltatee.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2022/2/7 14:32, Christoph Hellwig wrote:
> Hi all,
> 
> this series removes the offset by one refcount for ZONE_DEVICE pages
> that are freed back to the driver owning them, which is just device
> private ones for now, but also the planned device coherent pages
> and the ehanced p2p ones pending.
> 

Many thanks for doing this, I remember the hard time when I read the relevant code. :)

> It does not address the fsdax pages yet, which will be attacked in a
> follow on series.
> 
> Diffstat:
>  arch/arm64/mm/mmu.c                      |    1 
>  arch/powerpc/kvm/book3s_hv_uvmem.c       |    1 
>  drivers/gpu/drm/amd/amdkfd/kfd_migrate.c |    2 
>  drivers/gpu/drm/amd/amdkfd/kfd_priv.h    |    1 
>  drivers/gpu/drm/drm_cache.c              |    2 
>  drivers/gpu/drm/nouveau/nouveau_dmem.c   |    3 -
>  drivers/gpu/drm/nouveau/nouveau_svm.c    |    1 
>  drivers/infiniband/core/rw.c             |    1 
>  drivers/nvdimm/pmem.h                    |    1 
>  drivers/nvme/host/pci.c                  |    1 
>  drivers/nvme/target/io-cmd-bdev.c        |    1 
>  fs/Kconfig                               |    2 
>  fs/fuse/virtio_fs.c                      |    1 
>  include/linux/hmm.h                      |    9 ----
>  include/linux/memremap.h                 |   22 +++++++++-
>  include/linux/mm.h                       |   59 ++++-------------------------
>  lib/test_hmm.c                           |    4 +
>  mm/Kconfig                               |    4 -
>  mm/internal.h                            |    2 
>  mm/memcontrol.c                          |   11 +----
>  mm/memremap.c                            |   63 ++++++++++++++++---------------
>  mm/migrate.c                             |    6 --
>  mm/swap.c                                |   49 ++----------------------
>  23 files changed, 90 insertions(+), 157 deletions(-)
> 
> .
> 

