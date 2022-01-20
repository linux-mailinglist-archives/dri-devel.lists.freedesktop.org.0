Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AA4D49470E
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jan 2022 07:01:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CB9210E85A;
	Thu, 20 Jan 2022 06:01:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2086.outbound.protection.outlook.com [40.107.92.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1616510E871;
 Thu, 20 Jan 2022 06:01:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mTMFuQbcxyjkH7jUmVSVBT1j2pECBkROmtV26kq4ERoX6I9RLSVRuscD7MbAjB+Qoo1TcD4/tAgtARhq8778DwrLtxe+ozsYM1q7+hWLam6M6A8AIApb0HT4TQpsJvHNe5MkEyaB1Bcs/Ajm98mZqcG5uWAFQioqtIgDkiUCg0KqGQ2onsuw48ZrVVRtyeIgExItiZlnrUteWQrWygvcZdzK6loG8pjwNkomdn4mfIL1OR+N/nfUqEIWxoz5QIyDnM1inAGhb6+OaqO5r3s4XWmCFqNkOJ0tZO1tOzQQ+dTWfsbyRuNzRRdt7iBhlk7De5Wa3ZQ//H19N+BQh5ebjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mfymyn3v9d63TSKU8J2Ha809mmaIox002jniTrzIwHA=;
 b=GHTMKIx1991BnR6O0smuqSMVSlr0hM2g5FlO5xUka1Fle7eF1YM+PS85qVCxyt4k8ChwDdZE/d2VP0s+qpvWcZOgxWvUDPJUsXXc7BsmGw36G0Zf+Pyc1Ks6YiMp+7zcSyr2RzioiE9YDI3O6+HppL3g77L4dGyt3C9HPf7UdJTMdHJhUc+OFmzHc9MKfa4h37NPhkr0e4819nD8jafOENITmCOc+76sunVJAb3674zGHqkmm2/HOHCQiJTgfAemt6f4NsDnDYX1PonyaWbZBYMgOZ5Tryf15sQXoCg3PUwP4H+HZK9cgAUwQZ94BpvS+5pEy04dFEWILvhPK/Gx5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.235) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mfymyn3v9d63TSKU8J2Ha809mmaIox002jniTrzIwHA=;
 b=LYdGRyFn46ZV+V2BVGTv75GGnwBmrWZ2jLfVlu9hcJ3gqBH+snyZKcS5ripwfTJdir6z7PaO+el2p1ptS2RlG6OK+psdcQ/fgiLIHPlqELRp1mP0IYHhTNBKhKEcFSRfdJwOkGcsV8KEJ3XnaZ0w5sWucJWXORY0kYpKbH9wqE8CLQtZk7IVdm38HLtenLdAM0MH6lfNoUOVusAbSITpuym6y/ZZ91RuPa1ct+2a+OlO3EPAUB3Dj2+P/fMU35t6vdM+YlkxO9ejNmPjTg0Cbgyghg1llUkXqntLJ+zC3YSDvXvfl64nvvmS+jTtc/VQ+FIllqNnMPQojEGc7iVJ2w==
Received: from DM5PR20CA0031.namprd20.prod.outlook.com (2603:10b6:3:13d::17)
 by MWHPR1201MB0030.namprd12.prod.outlook.com (2603:10b6:301:53::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.11; Thu, 20 Jan
 2022 06:00:57 +0000
Received: from DM6NAM11FT033.eop-nam11.prod.protection.outlook.com
 (2603:10b6:3:13d:cafe::8a) by DM5PR20CA0031.outlook.office365.com
 (2603:10b6:3:13d::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.8 via Frontend
 Transport; Thu, 20 Jan 2022 06:00:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.235)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.235 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.235; helo=mail.nvidia.com;
Received: from mail.nvidia.com (12.22.5.235) by
 DM6NAM11FT033.mail.protection.outlook.com (10.13.172.221) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4909.7 via Frontend Transport; Thu, 20 Jan 2022 06:00:57 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1497.18;
 Thu, 20 Jan 2022 06:00:56 +0000
Received: from nvdebian.localnet (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.986.9; Wed, 19 Jan 2022
 22:00:52 -0800
From: Alistair Popple <apopple@nvidia.com>
To: <akpm@linux-foundation.org>, <Felix.Kuehling@amd.com>,
 <linux-mm@kvack.org>, <rcampbell@nvidia.com>, <linux-ext4@vger.kernel.org>,
 <linux-xfs@vger.kernel.org>, Alex Sierra <alex.sierra@amd.com>
Subject: Re: [PATCH v3 08/10] lib: add support for device coherent type in
 test_hmm
Date: Thu, 20 Jan 2022 17:00:50 +1100
Message-ID: <2108807.GxKChsLC2Z@nvdebian>
In-Reply-To: <20220110223201.31024-9-alex.sierra@amd.com>
References: <20220110223201.31024-1-alex.sierra@amd.com>
 <20220110223201.31024-9-alex.sierra@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bb8395f3-21af-4e61-c610-08d9dbda3a14
X-MS-TrafficTypeDiagnostic: MWHPR1201MB0030:EE_
X-Microsoft-Antispam-PRVS: <MWHPR1201MB003053F47E55C2682869CD6BDF5A9@MWHPR1201MB0030.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1KZNAUWA2YMWbGkDw5nDFR9SL0zIOb8xm39zwkdjN5vsuW5BJhFUAB1m7Cg2qpAm33De3h1GjTRCHdUL/eCP9el2WI0cTnlAcPUCWodKIPzSU+mPMGQcMZ4+UaZsNFv3qMW1ds6BVnrQfVIuCQ50wi11MZWvoCMDn4eEhCZgWAdCclmZ0rwhEbDhnJ612o4zSD8iwLxIyPgza/XzfeZJHf3eWsoUehvIAYbGPWMj6CLqE8is3gSoPYfqunrOBRp+4HBQ8be44ZbYxdowWBsLtQZLsOHXgchSawgX30eXr5xq/uJxPFZOBEZeCVlrVJKHyEtViSgtikPEQcN3Z219U9yLoHr4LYMgOIxBDTYn3vpUVZiJ2G+6BsgHEMLuzi3F9MMku5S8vW+nvVXOpT5KBwlmz7EAGQ6xznSVLgpCMhrDi3YR7hULODfEP7MHBz5YumowHFwW5CaQdyWzimqohTq3/yvA8eG2DbvGZhVTexF0KIOCPyt1pJwS136eWRln83JQ81qVIxkSQKLKMIB8d++xAi63ov2d9UF8mcmpV6oUO/OoIWWCLJ4fpe3knOWoi6XwEbhIpHTXnhCSWuQzdF4QrtMqR/ikAe25LR3EXkFGrDRyaEr/tNpbextSrHU/mrj9wb17M7XwniHaO02EmSiFRWuw4U9bxtGC6+45EO7toqVErsUKKsqwGOFNrGR3/NnZfpGg/H7XZ7bltrfS9ZE45DywDRWRigxkbuOFuXBCE2ZHOaFfmfMQTcmNnzbESX3VqO4zQkznY98cpnW98I/yjODKnIFDFkj2zJ27/1fRZ4oDDYGlv2nlsxD/IRWo8C1gqaLIiLtwGqLKzwa7dA==
X-Forefront-Antispam-Report: CIP:12.22.5.235; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:mail.nvidia.com; PTR:InfoNoRecords; CAT:NONE;
 SFS:(4636009)(36840700001)(40470700002)(46966006)(33716001)(7416002)(36860700001)(336012)(426003)(8676002)(186003)(40460700001)(508600001)(9576002)(4326008)(54906003)(30864003)(47076005)(8936002)(26005)(16526019)(356005)(9686003)(316002)(2906002)(70206006)(81166007)(82310400004)(5660300002)(110136005)(70586007)(86362001)(83380400001)(39026012)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2022 06:00:57.1710 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bb8395f3-21af-4e61-c610-08d9dbda3a14
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[12.22.5.235];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT033.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1201MB0030
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
Cc: amd-gfx@lists.freedesktop.org, willy@infradead.org, jglisse@redhat.com,
 dri-devel@lists.freedesktop.org, jgg@nvidia.com, hch@lst.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tuesday, 11 January 2022 9:31:59 AM AEDT Alex Sierra wrote:
> Device Coherent type uses device memory that is coherently accesible by
> the CPU. This could be shown as SP (special purpose) memory range
> at the BIOS-e820 memory enumeration. If no SP memory is supported in
> system, this could be faked by setting CONFIG_EFI_FAKE_MEMMAP.
> 
> Currently, test_hmm only supports two different SP ranges of at least
> 256MB size. This could be specified in the kernel parameter variable
> efi_fake_mem. Ex. Two SP ranges of 1GB starting at 0x100000000 &
> 0x140000000 physical address. Ex.
> efi_fake_mem=1G@0x100000000:0x40000,1G@0x140000000:0x40000
> 
> Private and coherent device mirror instances can be created in the same
> probed. This is done by passing the module parameters spm_addr_dev0 &
> spm_addr_dev1. In this case, it will create four instances of
> device_mirror. The first two correspond to private device type, the
> last two to coherent type. Then, they can be easily accessed from user
> space through /dev/hmm_mirror<num_device>. Usually num_device 0 and 1
> are for private, and 2 and 3 for coherent types. If no module
> parameters are passed, two instances of private type device_mirror will
> be created only.
> 
> Signed-off-by: Alex Sierra <alex.sierra@amd.com>
> ---
>  lib/test_hmm.c      | 247 ++++++++++++++++++++++++++++++++------------
>  lib/test_hmm_uapi.h |  15 ++-
>  2 files changed, 193 insertions(+), 69 deletions(-)
> 
> diff --git a/lib/test_hmm.c b/lib/test_hmm.c
> index 9edeff52302e..7c641c5a9cfa 100644
> --- a/lib/test_hmm.c
> +++ b/lib/test_hmm.c
> @@ -29,11 +29,22 @@
>  
>  #include "test_hmm_uapi.h"
>  
> -#define DMIRROR_NDEVICES		2
> +#define DMIRROR_NDEVICES		4
>  #define DMIRROR_RANGE_FAULT_TIMEOUT	1000
>  #define DEVMEM_CHUNK_SIZE		(256 * 1024 * 1024U)
>  #define DEVMEM_CHUNKS_RESERVE		16
>  
> +/*
> + * For device_private pages, dpage is just a dummy struct page
> + * representing a piece of device memory. dmirror_devmem_alloc_page
> + * allocates a real system memory page as backing storage to fake a
> + * real device. zone_device_data points to that backing page. But
> + * for device_coherent memory, the struct page represents real
> + * physical CPU-accessible memory that we can use directly.
> + */
> +#define BACKING_PAGE(page) (is_device_private_page((page)) ? \
> +			   (page)->zone_device_data : (page))
> +
>  static unsigned long spm_addr_dev0;
>  module_param(spm_addr_dev0, long, 0644);
>  MODULE_PARM_DESC(spm_addr_dev0,
> @@ -122,6 +133,21 @@ static int dmirror_bounce_init(struct dmirror_bounce *bounce,
>  	return 0;
>  }
>  
> +static bool dmirror_is_private_zone(struct dmirror_device *mdevice)
> +{
> +	return (mdevice->zone_device_type ==
> +		HMM_DMIRROR_MEMORY_DEVICE_PRIVATE) ? true : false;
> +}
> +
> +static enum migrate_vma_direction
> +	dmirror_select_device(struct dmirror *dmirror)
> +{
> +	return (dmirror->mdevice->zone_device_type ==
> +		HMM_DMIRROR_MEMORY_DEVICE_PRIVATE) ?
> +		MIGRATE_VMA_SELECT_DEVICE_PRIVATE :
> +		MIGRATE_VMA_SELECT_DEVICE_COHERENT;
> +}
> +
>  static void dmirror_bounce_fini(struct dmirror_bounce *bounce)
>  {
>  	vfree(bounce->ptr);
> @@ -572,16 +598,19 @@ static int dmirror_allocate_chunk(struct dmirror_device *mdevice,
>  static struct page *dmirror_devmem_alloc_page(struct dmirror_device *mdevice)
>  {
>  	struct page *dpage = NULL;
> -	struct page *rpage;
> +	struct page *rpage = NULL;
>  
>  	/*
> -	 * This is a fake device so we alloc real system memory to store
> -	 * our device memory.
> +	 * For ZONE_DEVICE private type, this is a fake device so we alloc real
> +	 * system memory to store our device memory.
> +	 * For ZONE_DEVICE coherent type we use the actual dpage to store the data
> +	 * and ignore rpage.
>  	 */
> -	rpage = alloc_page(GFP_HIGHUSER);
> -	if (!rpage)
> -		return NULL;
> -
> +	if (dmirror_is_private_zone(mdevice)) {
> +		rpage = alloc_page(GFP_HIGHUSER);
> +		if (!rpage)
> +			return NULL;
> +	}
>  	spin_lock(&mdevice->lock);
>  
>  	if (mdevice->free_pages) {
> @@ -601,7 +630,8 @@ static struct page *dmirror_devmem_alloc_page(struct dmirror_device *mdevice)
>  	return dpage;
>  
>  error:
> -	__free_page(rpage);
> +	if (rpage)
> +		__free_page(rpage);
>  	return NULL;
>  }
>  
> @@ -627,12 +657,15 @@ static void dmirror_migrate_alloc_and_copy(struct migrate_vma *args,
>  		 * unallocated pte_none() or read-only zero page.
>  		 */
>  		spage = migrate_pfn_to_page(*src);
> +		WARN(spage && is_zone_device_page(spage),
> +		     "page already in device spage pfn: 0x%lx\n",
> +		     page_to_pfn(spage));

This should also lead to test failure because we are only supposed to be
selecting system pages. Ie.

if (WARN_ON_ONCE()) {
	dpage = NULL;
	continue;
}

>  		dpage = dmirror_devmem_alloc_page(mdevice);
>  		if (!dpage)
>  			continue;
>  
> -		rpage = dpage->zone_device_data;
> +		rpage = BACKING_PAGE(dpage);
>  		if (spage)
>  			copy_highpage(rpage, spage);
>  		else
> @@ -646,6 +679,8 @@ static void dmirror_migrate_alloc_and_copy(struct migrate_vma *args,
>  		 */
>  		rpage->zone_device_data = dmirror;
>  
> +		pr_debug("migrating from sys to dev pfn src: 0x%lx pfn dst: 0x%lx\n",
> +			 page_to_pfn(spage), page_to_pfn(dpage));
>  		*dst = migrate_pfn(page_to_pfn(dpage)) |
>  			    MIGRATE_PFN_LOCKED;
>  		if ((*src & MIGRATE_PFN_WRITE) ||
> @@ -724,11 +759,7 @@ static int dmirror_migrate_finalize_and_map(struct migrate_vma *args,
>  		if (!dpage)
>  			continue;
>  
> -		/*
> -		 * Store the page that holds the data so the page table
> -		 * doesn't have to deal with ZONE_DEVICE private pages.
> -		 */
> -		entry = dpage->zone_device_data;
> +		entry = BACKING_PAGE(dpage);
>  		if (*dst & MIGRATE_PFN_WRITE)
>  			entry = xa_tag_pointer(entry, DPT_XA_TAG_WRITE);
>  		entry = xa_store(&dmirror->pt, pfn, entry, GFP_ATOMIC);
> @@ -808,8 +839,101 @@ static int dmirror_exclusive(struct dmirror *dmirror,
>  	return ret;
>  }
>  
> -static int dmirror_migrate(struct dmirror *dmirror,
> -			   struct hmm_dmirror_cmd *cmd)
> +static vm_fault_t dmirror_devmem_fault_alloc_and_copy(struct migrate_vma *args,
> +						      struct dmirror *dmirror)
> +{
> +	const unsigned long *src = args->src;
> +	unsigned long *dst = args->dst;
> +	unsigned long start = args->start;
> +	unsigned long end = args->end;
> +	unsigned long addr;
> +
> +	for (addr = start; addr < end; addr += PAGE_SIZE,
> +				       src++, dst++) {
> +		struct page *dpage, *spage;
> +
> +		spage = migrate_pfn_to_page(*src);
> +		if (!spage || !(*src & MIGRATE_PFN_MIGRATE))
> +			continue;
> +
> +		WARN_ON(!is_device_page(spage));

Same - the test should fail in this case (ie. by not migrating the page).

> +		spage = BACKING_PAGE(spage);
> +		dpage = alloc_page_vma(GFP_HIGHUSER_MOVABLE, args->vma, addr);
> +		if (!dpage)
> +			continue;
> +		pr_debug("migrating from dev to sys pfn src: 0x%lx pfn dst: 0x%lx\n",
> +			 page_to_pfn(spage), page_to_pfn(dpage));
> +
> +		lock_page(dpage);
> +		xa_erase(&dmirror->pt, addr >> PAGE_SHIFT);
> +		copy_highpage(dpage, spage);
> +		*dst = migrate_pfn(page_to_pfn(dpage)) | MIGRATE_PFN_LOCKED;
> +		if (*src & MIGRATE_PFN_WRITE)
> +			*dst |= MIGRATE_PFN_WRITE;
> +	}
> +	return 0;
> +}
> +
> +static int dmirror_migrate_to_system(struct dmirror *dmirror,
> +				     struct hmm_dmirror_cmd *cmd)
> +{
> +	unsigned long start, end, addr;
> +	unsigned long size = cmd->npages << PAGE_SHIFT;
> +	struct mm_struct *mm = dmirror->notifier.mm;
> +	struct vm_area_struct *vma;
> +	unsigned long src_pfns[64];
> +	unsigned long dst_pfns[64];
> +	struct migrate_vma args;
> +	unsigned long next;
> +	int ret;
> +
> +	start = cmd->addr;
> +	end = start + size;
> +	if (end < start)
> +		return -EINVAL;
> +
> +	/* Since the mm is for the mirrored process, get a reference first. */
> +	if (!mmget_not_zero(mm))
> +		return -EINVAL;
> +
> +	mmap_read_lock(mm);
> +	for (addr = start; addr < end; addr = next) {
> +		vma = vma_lookup(mm, addr);
> +		if (!vma || !(vma->vm_flags & VM_READ)) {
> +			ret = -EINVAL;
> +			goto out;
> +		}
> +		next = min(end, addr + (ARRAY_SIZE(src_pfns) << PAGE_SHIFT));
> +		if (next > vma->vm_end)
> +			next = vma->vm_end;
> +
> +		args.vma = vma;
> +		args.src = src_pfns;
> +		args.dst = dst_pfns;
> +		args.start = addr;
> +		args.end = next;
> +		args.pgmap_owner = dmirror->mdevice;
> +		args.flags = dmirror_select_device(dmirror);
> +
> +		ret = migrate_vma_setup(&args);
> +		if (ret)
> +			goto out;
> +
> +		pr_debug("Migrating from device mem to sys mem\n");
> +		dmirror_devmem_fault_alloc_and_copy(&args, dmirror);
> +
> +		migrate_vma_pages(&args);
> +		migrate_vma_finalize(&args);
> +	}
> +out:
> +	mmap_read_unlock(mm);
> +	mmput(mm);
> +	return ret;

I think you need to return the number of pages successfully migrated otherwise
failures migrating back to system memory will go unnoticed. This isn't a
problem for device private pages because in that case pages are migrated back
in response to a fault, and if they fail the process will get killed with
SIGBUS.

> +}
> +
> +static int dmirror_migrate_to_device(struct dmirror *dmirror,
> +				struct hmm_dmirror_cmd *cmd)
>  {
>  	unsigned long start, end, addr;
>  	unsigned long size = cmd->npages << PAGE_SHIFT;
> @@ -853,6 +977,7 @@ static int dmirror_migrate(struct dmirror *dmirror,
>  		if (ret)
>  			goto out;
>  
> +		pr_debug("Migrating from sys mem to device mem\n");
>  		dmirror_migrate_alloc_and_copy(&args, dmirror);
>  		migrate_vma_pages(&args);
>  		dmirror_migrate_finalize_and_map(&args, dmirror);
> @@ -861,7 +986,7 @@ static int dmirror_migrate(struct dmirror *dmirror,
>  	mmap_read_unlock(mm);
>  	mmput(mm);
>  
> -	/* Return the migrated data for verification. */
> +	/* Return the migrated data for verification. only for pages in device zone */
>  	ret = dmirror_bounce_init(&bounce, start, size);
>  	if (ret)
>  		return ret;
> @@ -898,12 +1023,22 @@ static void dmirror_mkentry(struct dmirror *dmirror, struct hmm_range *range,
>  	}
>  
>  	page = hmm_pfn_to_page(entry);
> -	if (is_device_private_page(page)) {
> -		/* Is the page migrated to this device or some other? */
> -		if (dmirror->mdevice == dmirror_page_to_device(page))
> +	if (is_device_page(page)) {
> +		/* Is page ZONE_DEVICE coherent? */
> +		if (!is_device_private_page(page)) {

This would read more clearly without the negation -
ie. `if (is_device_coherent_page(page))`.

> +			if (dmirror->mdevice == dmirror_page_to_device(page))
> +				*perm = HMM_DMIRROR_PROT_DEV_COHERENT_LOCAL;
> +			else
> +				*perm = HMM_DMIRROR_PROT_DEV_COHERENT_REMOTE;
> +		/*
> +		 * Is page ZONE_DEVICE private migrated to
> +		 * this device or some other?
> +		 */
> +		} else if (dmirror->mdevice == dmirror_page_to_device(page)) {
>  			*perm = HMM_DMIRROR_PROT_DEV_PRIVATE_LOCAL;
> -		else
> +		} else {
>  			*perm = HMM_DMIRROR_PROT_DEV_PRIVATE_REMOTE;
> +		}
>  	} else if (is_zero_pfn(page_to_pfn(page)))
>  		*perm = HMM_DMIRROR_PROT_ZERO;
>  	else
> @@ -1100,8 +1235,12 @@ static long dmirror_fops_unlocked_ioctl(struct file *filp,
>  		ret = dmirror_write(dmirror, &cmd);
>  		break;
>  
> -	case HMM_DMIRROR_MIGRATE:
> -		ret = dmirror_migrate(dmirror, &cmd);
> +	case HMM_DMIRROR_MIGRATE_TO_DEV:
> +		ret = dmirror_migrate_to_device(dmirror, &cmd);
> +		break;
> +
> +	case HMM_DMIRROR_MIGRATE_TO_SYS:
> +		ret = dmirror_migrate_to_system(dmirror, &cmd);
>  		break;
>  
>  	case HMM_DMIRROR_EXCLUSIVE:
> @@ -1142,14 +1281,13 @@ static const struct file_operations dmirror_fops = {
>  
>  static void dmirror_devmem_free(struct page *page)
>  {
> -	struct page *rpage = page->zone_device_data;
> +	struct page *rpage = BACKING_PAGE(page);
>  	struct dmirror_device *mdevice;
>  
> -	if (rpage)
> +	if (rpage != page)
>  		__free_page(rpage);
>  
>  	mdevice = dmirror_page_to_device(page);
> -
>  	spin_lock(&mdevice->lock);
>  	mdevice->cfree++;
>  	page->zone_device_data = mdevice->free_pages;
> @@ -1157,38 +1295,6 @@ static void dmirror_devmem_free(struct page *page)
>  	spin_unlock(&mdevice->lock);
>  }
>  
> -static vm_fault_t dmirror_devmem_fault_alloc_and_copy(struct migrate_vma *args,
> -						      struct dmirror *dmirror)
> -{
> -	const unsigned long *src = args->src;
> -	unsigned long *dst = args->dst;
> -	unsigned long start = args->start;
> -	unsigned long end = args->end;
> -	unsigned long addr;
> -
> -	for (addr = start; addr < end; addr += PAGE_SIZE,
> -				       src++, dst++) {
> -		struct page *dpage, *spage;
> -
> -		spage = migrate_pfn_to_page(*src);
> -		if (!spage || !(*src & MIGRATE_PFN_MIGRATE))
> -			continue;
> -		spage = spage->zone_device_data;
> -
> -		dpage = alloc_page_vma(GFP_HIGHUSER_MOVABLE, args->vma, addr);
> -		if (!dpage)
> -			continue;
> -
> -		lock_page(dpage);
> -		xa_erase(&dmirror->pt, addr >> PAGE_SHIFT);
> -		copy_highpage(dpage, spage);
> -		*dst = migrate_pfn(page_to_pfn(dpage)) | MIGRATE_PFN_LOCKED;
> -		if (*src & MIGRATE_PFN_WRITE)
> -			*dst |= MIGRATE_PFN_WRITE;
> -	}
> -	return 0;
> -}
> -
>  static vm_fault_t dmirror_devmem_fault(struct vm_fault *vmf)
>  {
>  	struct migrate_vma args;
> @@ -1203,7 +1309,7 @@ static vm_fault_t dmirror_devmem_fault(struct vm_fault *vmf)
>  	 * the mirror but here we use it to hold the page for the simulated
>  	 * device memory and that page holds the pointer to the mirror.
>  	 */
> -	rpage = vmf->page->zone_device_data;
> +	rpage = BACKING_PAGE(vmf->page);

Note that as I understand things this isn't strictly required because this will
never be called for device coherent pages.

>  	dmirror = rpage->zone_device_data;
>  
>  	/* FIXME demonstrate how we can adjust migrate range */
> @@ -1213,7 +1319,7 @@ static vm_fault_t dmirror_devmem_fault(struct vm_fault *vmf)
>  	args.src = &src_pfns;
>  	args.dst = &dst_pfns;
>  	args.pgmap_owner = dmirror->mdevice;
> -	args.flags = MIGRATE_VMA_SELECT_DEVICE_PRIVATE;
> +	args.flags = dmirror_select_device(dmirror);
>  
>  	if (migrate_vma_setup(&args))
>  		return VM_FAULT_SIGBUS;
> @@ -1279,14 +1385,26 @@ static void dmirror_device_remove(struct dmirror_device *mdevice)
>  static int __init hmm_dmirror_init(void)
>  {
>  	int ret;
> -	int id;
> +	int id = 0;
> +	int ndevices = 0;
>  
>  	ret = alloc_chrdev_region(&dmirror_dev, 0, DMIRROR_NDEVICES,
>  				  "HMM_DMIRROR");
>  	if (ret)
>  		goto err_unreg;
>  
> -	for (id = 0; id < DMIRROR_NDEVICES; id++) {
> +	memset(dmirror_devices, 0, DMIRROR_NDEVICES * sizeof(dmirror_devices[0]));
> +	dmirror_devices[ndevices++].zone_device_type =
> +				HMM_DMIRROR_MEMORY_DEVICE_PRIVATE;
> +	dmirror_devices[ndevices++].zone_device_type =
> +				HMM_DMIRROR_MEMORY_DEVICE_PRIVATE;
> +	if (spm_addr_dev0 && spm_addr_dev1) {
> +		dmirror_devices[ndevices++].zone_device_type =
> +					HMM_DMIRROR_MEMORY_DEVICE_COHERENT;
> +		dmirror_devices[ndevices++].zone_device_type =
> +					HMM_DMIRROR_MEMORY_DEVICE_COHERENT;
> +	}
> +	for (id = 0; id < ndevices; id++) {
>  		ret = dmirror_device_init(dmirror_devices + id, id);
>  		if (ret)
>  			goto err_chrdev;
> @@ -1308,7 +1426,8 @@ static void __exit hmm_dmirror_exit(void)
>  	int id;
>  
>  	for (id = 0; id < DMIRROR_NDEVICES; id++)
> -		dmirror_device_remove(dmirror_devices + id);
> +		if (dmirror_devices[id].zone_device_type)

Oh, I understand why you reserved 0 for zone_device_type now. But I still
thinks it's unnecessary - hmm_dmirror_exit() getting called implies
hmm_dmirror_init() was successful which implies zone_device_type was
initialised for all devices.

> +			dmirror_device_remove(dmirror_devices + id);
>  	unregister_chrdev_region(dmirror_dev, DMIRROR_NDEVICES);
>  }
>  
> diff --git a/lib/test_hmm_uapi.h b/lib/test_hmm_uapi.h
> index 625f3690d086..e190b2ab6f19 100644
> --- a/lib/test_hmm_uapi.h
> +++ b/lib/test_hmm_uapi.h
> @@ -33,11 +33,12 @@ struct hmm_dmirror_cmd {
>  /* Expose the address space of the calling process through hmm device file */
>  #define HMM_DMIRROR_READ		_IOWR('H', 0x00, struct hmm_dmirror_cmd)
>  #define HMM_DMIRROR_WRITE		_IOWR('H', 0x01, struct hmm_dmirror_cmd)
> -#define HMM_DMIRROR_MIGRATE		_IOWR('H', 0x02, struct hmm_dmirror_cmd)
> -#define HMM_DMIRROR_SNAPSHOT		_IOWR('H', 0x03, struct hmm_dmirror_cmd)
> -#define HMM_DMIRROR_EXCLUSIVE		_IOWR('H', 0x04, struct hmm_dmirror_cmd)
> -#define HMM_DMIRROR_CHECK_EXCLUSIVE	_IOWR('H', 0x05, struct hmm_dmirror_cmd)
> -#define HMM_DMIRROR_GET_MEM_DEV_TYPE	_IOWR('H', 0x06, struct hmm_dmirror_cmd)
> +#define HMM_DMIRROR_MIGRATE_TO_DEV	_IOWR('H', 0x02, struct hmm_dmirror_cmd)
> +#define HMM_DMIRROR_MIGRATE_TO_SYS	_IOWR('H', 0x03, struct hmm_dmirror_cmd)
> +#define HMM_DMIRROR_SNAPSHOT		_IOWR('H', 0x04, struct hmm_dmirror_cmd)
> +#define HMM_DMIRROR_EXCLUSIVE		_IOWR('H', 0x05, struct hmm_dmirror_cmd)
> +#define HMM_DMIRROR_CHECK_EXCLUSIVE	_IOWR('H', 0x06, struct hmm_dmirror_cmd)
> +#define HMM_DMIRROR_GET_MEM_DEV_TYPE	_IOWR('H', 0x07, struct hmm_dmirror_cmd)
>  
>  /*
>   * Values returned in hmm_dmirror_cmd.ptr for HMM_DMIRROR_SNAPSHOT.
> @@ -52,6 +53,8 @@ struct hmm_dmirror_cmd {
>   *					device the ioctl() is made
>   * HMM_DMIRROR_PROT_DEV_PRIVATE_REMOTE: Migrated device private page on some
>   *					other device
> + * HMM_DMIRROR_PROT_DEV_COHERENT: Migrate device coherent page on the device
> + *				  the ioctl() is made
>   */
>  enum {
>  	HMM_DMIRROR_PROT_ERROR			= 0xFF,
> @@ -63,6 +66,8 @@ enum {
>  	HMM_DMIRROR_PROT_ZERO			= 0x10,
>  	HMM_DMIRROR_PROT_DEV_PRIVATE_LOCAL	= 0x20,
>  	HMM_DMIRROR_PROT_DEV_PRIVATE_REMOTE	= 0x30,
> +	HMM_DMIRROR_PROT_DEV_COHERENT_LOCAL	= 0x40,
> +	HMM_DMIRROR_PROT_DEV_COHERENT_REMOTE	= 0x50,
>  };
>  
>  enum {
> 




