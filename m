Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A022AC7D8B
	for <lists+dri-devel@lfdr.de>; Thu, 29 May 2025 14:02:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1BED10E088;
	Thu, 29 May 2025 12:02:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com
 [185.176.79.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEC5210E088
 for <dri-devel@lists.freedesktop.org>; Thu, 29 May 2025 12:02:23 +0000 (UTC)
Received: from mail.maildlp.com (unknown [172.18.186.231])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4b7PgR28wGz6L4tL;
 Thu, 29 May 2025 19:45:07 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
 by mail.maildlp.com (Postfix) with ESMTPS id AF2D9140519;
 Thu, 29 May 2025 19:46:22 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Thu, 29 May
 2025 13:46:21 +0200
Date: Thu, 29 May 2025 12:46:20 +0100
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: Alistair Popple <apopple@nvidia.com>
CC: <linux-mm@kvack.org>, <gerald.schaefer@linux.ibm.com>,
 <dan.j.williams@intel.com>, <jgg@ziepe.ca>, <willy@infradead.org>,
 <david@redhat.com>, <linux-kernel@vger.kernel.org>, <nvdimm@lists.linux.dev>, 
 <linux-fsdevel@vger.kernel.org>, <linux-ext4@vger.kernel.org>,
 <linux-xfs@vger.kernel.org>, <jhubbard@nvidia.com>, <hch@lst.de>,
 <zhang.lyra@gmail.com>, <debug@rivosinc.com>, <bjorn@kernel.org>,
 <balbirs@nvidia.com>, <lorenzo.stoakes@oracle.com>,
 <linux-arm-kernel@lists.infradead.org>, <loongarch@lists.linux.dev>,
 <linuxppc-dev@lists.ozlabs.org>, <linux-riscv@lists.infradead.org>,
 <linux-cxl@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <John@Groves.net>
Subject: Re: [PATCH 01/12] mm: Remove PFN_MAP, PFN_SG_CHAIN and PFN_SG_LAST
Message-ID: <20250529124620.00006ac7@huawei.com>
In-Reply-To: <cb45fa705b2eefa1228e262778e784e9b3646827.1748500293.git-series.apopple@nvidia.com>
References: <cover.541c2702181b7461b84f1a6967a3f0e823023fcc.1748500293.git-series.apopple@nvidia.com>
 <cb45fa705b2eefa1228e262778e784e9b3646827.1748500293.git-series.apopple@nvidia.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.66]
X-ClientProxiedBy: lhrpeml100004.china.huawei.com (7.191.162.219) To
 frapeml500008.china.huawei.com (7.182.85.71)
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

On Thu, 29 May 2025 16:32:02 +1000
Alistair Popple <apopple@nvidia.com> wrote:

> The PFN_MAP flag is no longer used for anything, so remove it. The
> PFN_SG_CHAIN and PFN_SG_LAST flags never appear to have been used so
> also remove them.

Superficial thing but you seem to be be removing PFN_SPECIAL as well and
this description and patche description don't mention that.

> 
> Signed-off-by: Alistair Popple <apopple@nvidia.com>
> Reviewed-by: Christoph Hellwig <hch@lst.de>

On superficial comment inline.

> ---
>  include/linux/pfn_t.h             | 31 +++----------------------------
>  mm/memory.c                       |  2 --
>  tools/testing/nvdimm/test/iomap.c |  4 ----
>  3 files changed, 3 insertions(+), 34 deletions(-)
> 
> diff --git a/include/linux/pfn_t.h b/include/linux/pfn_t.h
> index 2d91482..46afa12 100644
> --- a/include/linux/pfn_t.h
> +++ b/include/linux/pfn_t.h
> @@ -5,26 +5,13 @@



> diff --git a/tools/testing/nvdimm/test/iomap.c b/tools/testing/nvdimm/test/iomap.c
> index e431372..ddceb04 100644
> --- a/tools/testing/nvdimm/test/iomap.c
> +++ b/tools/testing/nvdimm/test/iomap.c
> @@ -137,10 +137,6 @@ EXPORT_SYMBOL_GPL(__wrap_devm_memremap_pages);
>  
>  pfn_t __wrap_phys_to_pfn_t(phys_addr_t addr, unsigned long flags)
>  {
> -	struct nfit_test_resource *nfit_res = get_nfit_res(addr);
> -
> -	if (nfit_res)
> -		flags &= ~PFN_MAP;
>          return phys_to_pfn_t(addr, flags);

Maybe not the time to point it out, but what is going on with indent here?
Looks like some spaces snuck in for that last line.



>  }
>  EXPORT_SYMBOL(__wrap_phys_to_pfn_t);

