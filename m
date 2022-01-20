Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C6AD49464D
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jan 2022 05:09:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2538010E351;
	Thu, 20 Jan 2022 04:09:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2073.outbound.protection.outlook.com [40.107.94.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98F0B10E351;
 Thu, 20 Jan 2022 04:09:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VQbezYFUX7jX2oWrWjAB71Hj9/WM+lDuYpkSk87EjbtKqtG5h4/9DasVqIXCLIcMvJGe5RUQbia7xfLqLIGBaT6kpTBQ7MWHXBGAleeBtN9/hJWaD34cZsW6O4zsrQQTPC/Dl0jg0xBUFf911EXBT4P5opoYN8x74RY8f+GXuCDJHlBd9CnnqkolifyDR7XlqTBSpAGpeJT90FIy98UiRQWNVeFaf3EueW3Y5zO1KNbTvWtg+2Bz8DDAvHt5nUXD2rYvmgANxwp0bezS4SfVHc4f9bzVmrVzRJ8HLO1aQB0CcS8twbtRa+s2MzRE9CGXU3YwItj4AZZ39oWWmxFHKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bxkg+qIwCptWddUzl0PUjXe9A2yyPzhXBQM/exoYHgg=;
 b=JsBs9HsHHGOVfehAZ+oKUFzG+HkGHCIcw76Ha1ePxOiwDTnf9KM1pzYq8WiZjUVfKsPV4C880Qk1GUFfny6YC9WDGghWh+W8+YWjX9kpfO5qPel/xnOoS09D0Jb7m9YYAOtnDgS/n2cQlbwFlXd0mbAofjZd6W27RmG2lcOLy4wu2y2to2jnc/5dH10lljantWXnTj0kf4+y3v4Cpajp1bYYX6kSdqgvG5P8RzabByZFKkoTHvicYxqwJZxBNZhbmoPVRq/KNz7iT12gt09u2drJgYkX8xshUD6GCT26YDeGnZx1SAFAvPxSeDUUrNFyznt3/Wz4+PChwRqWgUJBNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.236) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bxkg+qIwCptWddUzl0PUjXe9A2yyPzhXBQM/exoYHgg=;
 b=DukAuc76nsQup9QepgJOMRsadXemrn/QEKw43lNUBxjhZQzM7MLZm/eiHbZZZ8KWNNd7FudpY1kUczR3Um0e7aQu0aaH9a2a/SeKFU1gF8nrYL5b7MR1yS1hfLul4xJWrHIVIdmTzVinKVx2tV4HCMiTI3+/1mqvNwrLmSwvRI5J2Ye1EgVUfq9OHhcEpwCoDxrxWNrDLLtzQK8ltHICQtkxCeXc6PXmp0U+rq6MXZO4nqpNolWh5dGUUGqatAMavBlRzv4EDiygNIswIklgsyW5XS6oqxk2KDuKodtxknKZwqHarsYvRNvWJGw7BtLZqFVoWPKpLynhV7XJ0ZgrVA==
Received: from BN6PR19CA0111.namprd19.prod.outlook.com (2603:10b6:404:a0::25)
 by BYAPR12MB3592.namprd12.prod.outlook.com (2603:10b6:a03:db::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.7; Thu, 20 Jan
 2022 04:09:04 +0000
Received: from BN8NAM11FT054.eop-nam11.prod.protection.outlook.com
 (2603:10b6:404:a0:cafe::ad) by BN6PR19CA0111.outlook.office365.com
 (2603:10b6:404:a0::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.7 via Frontend
 Transport; Thu, 20 Jan 2022 04:09:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.236)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.236 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.236; helo=mail.nvidia.com;
Received: from mail.nvidia.com (12.22.5.236) by
 BN8NAM11FT054.mail.protection.outlook.com (10.13.177.102) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4909.7 via Frontend Transport; Thu, 20 Jan 2022 04:09:03 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by DRHQMAIL109.nvidia.com
 (10.27.9.19) with Microsoft SMTP Server (TLS) id 15.0.1497.18;
 Thu, 20 Jan 2022 04:09:01 +0000
Received: from nvdebian.localnet (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.986.9; Wed, 19 Jan 2022
 20:08:58 -0800
From: Alistair Popple <apopple@nvidia.com>
To: <akpm@linux-foundation.org>, <Felix.Kuehling@amd.com>,
 <linux-mm@kvack.org>, <rcampbell@nvidia.com>, <linux-ext4@vger.kernel.org>,
 <linux-xfs@vger.kernel.org>, Alex Sierra <alex.sierra@amd.com>
Subject: Re: [PATCH v3 01/10] mm: add zone device coherent type memory support
Date: Thu, 20 Jan 2022 15:08:56 +1100
Message-ID: <29335901.2ltahdNQJ0@nvdebian>
In-Reply-To: <20220110223201.31024-2-alex.sierra@amd.com>
References: <20220110223201.31024-1-alex.sierra@amd.com>
 <20220110223201.31024-2-alex.sierra@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Originating-IP: [10.126.230.35]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2261f8c5-810a-4515-cf89-08d9dbca9852
X-MS-TrafficTypeDiagnostic: BYAPR12MB3592:EE_
X-Microsoft-Antispam-PRVS: <BYAPR12MB359279FC4D59C4F014AEFFE8DF5A9@BYAPR12MB3592.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XHXxKWgasEKsapzexEM0Glomj8BqYdAqCu0LXiOTpkculJdQoVRilT/Le4f4uS/aSCkOBa+SuZSD/aX6XDZtQTIJS+b/z2g+KtDVpZ9RofydNHAVPetowGHXbTgAFrK3a+b3KzP+XVYy/CL0j35mwSZm+Jea8m+077a1rPUoCGoZoP7sUeL+D83eiS7RPYGeEQz4TNrTxkqJl+dqqLPOBC4luFRUWmaGu8r2dwOJB45cdMd072DRv1ISZte0yI1NF0YGU3hv+66DsHdurLNtfe0xDMxnaYPa6Fe+X2e3/wNjB/ymOA3f6LFWWDC1si7BAn0WO4foV9Sn5sjUBPAA57Bo77f2tHLiqy9dmP0xd8+/vG5up9HgqhwF3TFLq7/VXrF8gWj8SfX2imDctSr4uoLwJZDGYUZ2hqYlBufXMTh++FyxVj2wXOwRevikVDH5Zmr2H8gZymKmq0jNwgAiv/CnGTx6rnuNVPRWpvaYe/3o2Y51wZPc1RzM9iLhKp2qzT88FWRUZDFvH2qpwZvC7z/oCUT6um6zuDSnBlcYtdP8jFb9wOJ2C289iHr289Azej3BFvJWbEZv5vZYU/hCba0/MlMPBHQCB49oxYUkKnkyWu1CShhi9JLiIKNo73VnSFhJC8jp+oiTGaXGv1E86fPDw5zFIJsbjHRQdn/KAgjdAMiCv6KBwhWLkp9viSpzxw3CYgFVBVkvSBYRfdJWsbgt0Lgyz0Z1mZpAuJXv2tu1Jcfwsm+O+jdqB9TXcHXPrQQq2iJ7WmKlSHo+qHQvcr0xhXlNnrBJOjAwMgIioT5UBYPiCLsA0BGXjAfU7jIL3YePJxUz0CBcvKU1OX0mYA==
X-Forefront-Antispam-Report: CIP:12.22.5.236; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:mail.nvidia.com; PTR:InfoNoRecords; CAT:NONE;
 SFS:(4636009)(36840700001)(40470700002)(46966006)(110136005)(81166007)(9576002)(8676002)(9686003)(36860700001)(70586007)(86362001)(426003)(83380400001)(8936002)(356005)(336012)(40460700001)(70206006)(82310400004)(316002)(7416002)(54906003)(4326008)(33716001)(16526019)(2906002)(508600001)(5660300002)(186003)(47076005)(26005)(39026012)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2022 04:09:03.3357 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2261f8c5-810a-4515-cf89-08d9dbca9852
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[12.22.5.236];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT054.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3592
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

On Tuesday, 11 January 2022 9:31:52 AM AEDT Alex Sierra wrote:
> Device memory that is cache coherent from device and CPU point of view.
> This is used on platforms that have an advanced system bus (like CAPI
> or CXL). Any page of a process can be migrated to such memory. However,
> no one should be allowed to pin such memory so that it can always be
> evicted.
> 
> Signed-off-by: Alex Sierra <alex.sierra@amd.com>
> ---
>  include/linux/memremap.h |  8 ++++++++
>  include/linux/mm.h       | 16 ++++++++++++++++
>  mm/memcontrol.c          |  6 +++---
>  mm/memory-failure.c      |  8 ++++++--
>  mm/memremap.c            |  5 ++++-
>  mm/migrate.c             | 21 +++++++++++++--------
>  6 files changed, 50 insertions(+), 14 deletions(-)
> 
> diff --git a/include/linux/memremap.h b/include/linux/memremap.h
> index c0e9d35889e8..ff4d398edf35 100644
> --- a/include/linux/memremap.h
> +++ b/include/linux/memremap.h
> @@ -39,6 +39,13 @@ struct vmem_altmap {
>   * A more complete discussion of unaddressable memory may be found in
>   * include/linux/hmm.h and Documentation/vm/hmm.rst.
>   *
> + * MEMORY_DEVICE_COHERENT:
> + * Device memory that is cache coherent from device and CPU point of view. This
> + * is used on platforms that have an advanced system bus (like CAPI or CXL). A
> + * driver can hotplug the device memory using ZONE_DEVICE and with that memory
> + * type. Any page of a process can be migrated to such memory. However no one
> + * should be allowed to pin such memory so that it can always be evicted.
> + *
>   * MEMORY_DEVICE_FS_DAX:
>   * Host memory that has similar access semantics as System RAM i.e. DMA
>   * coherent and supports page pinning. In support of coordinating page
> @@ -59,6 +66,7 @@ struct vmem_altmap {
>  enum memory_type {
>  	/* 0 is reserved to catch uninitialized type fields */
>  	MEMORY_DEVICE_PRIVATE = 1,
> +	MEMORY_DEVICE_COHERENT,
>  	MEMORY_DEVICE_FS_DAX,
>  	MEMORY_DEVICE_GENERIC,
>  	MEMORY_DEVICE_PCI_P2PDMA,
> diff --git a/include/linux/mm.h b/include/linux/mm.h
> index 73a52aba448f..fcf96c0fc918 100644
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@ -1162,6 +1162,7 @@ static inline bool page_is_devmap_managed(struct page *page)
>  		return false;
>  	switch (page->pgmap->type) {
>  	case MEMORY_DEVICE_PRIVATE:
> +	case MEMORY_DEVICE_COHERENT:
>  	case MEMORY_DEVICE_FS_DAX:
>  		return true;
>  	default:
> @@ -1191,6 +1192,21 @@ static inline bool is_device_private_page(const struct page *page)
>  		page->pgmap->type == MEMORY_DEVICE_PRIVATE;
>  }
>  
> +static inline bool is_device_coherent_page(const struct page *page)
> +{
> +	return IS_ENABLED(CONFIG_DEV_PAGEMAP_OPS) &&
> +		is_zone_device_page(page) &&
> +		page->pgmap->type == MEMORY_DEVICE_COHERENT;
> +}
> +
> +static inline bool is_device_page(const struct page *page)

I wish we could think of a better name for this - it's too similar to
is_zone_device_page() so I can never remember if it includes FS_DAX pages or
not. Unfortunately I don't have any better suggestions though.

> +{
> +	return IS_ENABLED(CONFIG_DEV_PAGEMAP_OPS) &&
> +		is_zone_device_page(page) &&
> +		(page->pgmap->type == MEMORY_DEVICE_PRIVATE ||
> +		page->pgmap->type == MEMORY_DEVICE_COHERENT);
> +}
> +
>  static inline bool is_pci_p2pdma_page(const struct page *page)
>  {
>  	return IS_ENABLED(CONFIG_DEV_PAGEMAP_OPS) &&
> diff --git a/mm/memcontrol.c b/mm/memcontrol.c
> index 6da5020a8656..d0bab0747c73 100644
> --- a/mm/memcontrol.c
> +++ b/mm/memcontrol.c
> @@ -5695,8 +5695,8 @@ static int mem_cgroup_move_account(struct page *page,
>   *   2(MC_TARGET_SWAP): if the swap entry corresponding to this pte is a
>   *     target for charge migration. if @target is not NULL, the entry is stored
>   *     in target->ent.
> - *   3(MC_TARGET_DEVICE): like MC_TARGET_PAGE  but page is MEMORY_DEVICE_PRIVATE
> - *     (so ZONE_DEVICE page and thus not on the lru).
> + *   3(MC_TARGET_DEVICE): like MC_TARGET_PAGE  but page is device memory and
> + *   thus not on the lru.
>   *     For now we such page is charge like a regular page would be as for all
>   *     intent and purposes it is just special memory taking the place of a
>   *     regular page.
> @@ -5730,7 +5730,7 @@ static enum mc_target_type get_mctgt_type(struct vm_area_struct *vma,
>  		 */
>  		if (page_memcg(page) == mc.from) {
>  			ret = MC_TARGET_PAGE;
> -			if (is_device_private_page(page))
> +			if (is_device_page(page))
>  				ret = MC_TARGET_DEVICE;
>  			if (target)
>  				target->page = page;
> diff --git a/mm/memory-failure.c b/mm/memory-failure.c
> index 3e6449f2102a..4cf212e5f432 100644
> --- a/mm/memory-failure.c
> +++ b/mm/memory-failure.c
> @@ -1554,12 +1554,16 @@ static int memory_failure_dev_pagemap(unsigned long pfn, int flags,
>  		goto unlock;
>  	}
>  
> -	if (pgmap->type == MEMORY_DEVICE_PRIVATE) {
> +	switch (pgmap->type) {
> +	case MEMORY_DEVICE_PRIVATE:
> +	case MEMORY_DEVICE_COHERENT:
>  		/*
> -		 * TODO: Handle HMM pages which may need coordination
> +		 * TODO: Handle device pages which may need coordination
>  		 * with device-side memory.
>  		 */
>  		goto unlock;
> +	default:
> +		break;
>  	}
>  
>  	/*
> diff --git a/mm/memremap.c b/mm/memremap.c
> index ed593bf87109..94d6a1e01d42 100644
> --- a/mm/memremap.c
> +++ b/mm/memremap.c
> @@ -44,6 +44,7 @@ EXPORT_SYMBOL(devmap_managed_key);
>  static void devmap_managed_enable_put(struct dev_pagemap *pgmap)
>  {
>  	if (pgmap->type == MEMORY_DEVICE_PRIVATE ||
> +	    pgmap->type == MEMORY_DEVICE_COHERENT ||
>  	    pgmap->type == MEMORY_DEVICE_FS_DAX)
>  		static_branch_dec(&devmap_managed_key);
>  }
> @@ -51,6 +52,7 @@ static void devmap_managed_enable_put(struct dev_pagemap *pgmap)
>  static void devmap_managed_enable_get(struct dev_pagemap *pgmap)
>  {
>  	if (pgmap->type == MEMORY_DEVICE_PRIVATE ||
> +	    pgmap->type == MEMORY_DEVICE_COHERENT ||
>  	    pgmap->type == MEMORY_DEVICE_FS_DAX)
>  		static_branch_inc(&devmap_managed_key);
>  }
> @@ -328,6 +330,7 @@ void *memremap_pages(struct dev_pagemap *pgmap, int nid)
>  
>  	switch (pgmap->type) {
>  	case MEMORY_DEVICE_PRIVATE:
> +	case MEMORY_DEVICE_COHERENT:
>  		if (!IS_ENABLED(CONFIG_DEVICE_PRIVATE)) {

This will fail if device private support isn't enabled. Does device coherent
need to depend on that?

>  			WARN(1, "Device private memory not supported\n");
>  			return ERR_PTR(-EINVAL);

Also there is this check further down:

                if (!pgmap->ops || !pgmap->ops->migrate_to_ram) {

Device coherent pages don't use the migrate_to_ram() callback, so this should
check for migrate_to_ram == NULL in that case.

                        WARN(1, "Missing migrate_to_ram method\n");
                        return ERR_PTR(-EINVAL);
                }


> @@ -498,7 +501,7 @@ EXPORT_SYMBOL_GPL(get_dev_pagemap);
>  void free_devmap_managed_page(struct page *page)
>  {
>  	/* notify page idle for dax */
> -	if (!is_device_private_page(page)) {
> +	if (!is_device_page(page)) {
>  		wake_up_var(&page->_refcount);
>  		return;
>  	}
> diff --git a/mm/migrate.c b/mm/migrate.c
> index 1852d787e6ab..91018880dc7f 100644
> --- a/mm/migrate.c
> +++ b/mm/migrate.c
> @@ -362,7 +362,7 @@ static int expected_page_refs(struct address_space *mapping, struct page *page)
>  	 * Device private pages have an extra refcount as they are
>  	 * ZONE_DEVICE pages.
>  	 */
> -	expected_count += is_device_private_page(page);
> +	expected_count += is_device_page(page);
>  	if (mapping)
>  		expected_count += thp_nr_pages(page) + page_has_private(page);
>  
> @@ -2503,7 +2503,7 @@ static bool migrate_vma_check_page(struct page *page)
>  		 * FIXME proper solution is to rework migration_entry_wait() so
>  		 * it does not need to take a reference on page.
>  		 */
> -		return is_device_private_page(page);
> +		return is_device_page(page);
>  	}
>  	/* For file back page */
> @@ -2791,7 +2791,7 @@ EXPORT_SYMBOL(migrate_vma_setup);
>   *     handle_pte_fault()
>   *       do_anonymous_page()
>   * to map in an anonymous zero page but the struct page will be a ZONE_DEVICE
> - * private page.
> + * private or coherent page.
>   */
>  static void migrate_vma_insert_page(struct migrate_vma *migrate,
>  				    unsigned long addr,
> @@ -2867,10 +2867,15 @@ static void migrate_vma_insert_page(struct migrate_vma *migrate,
>  				swp_entry = make_readable_device_private_entry(
>  							page_to_pfn(page));
>  			entry = swp_entry_to_pte(swp_entry);
> +		} else if (is_device_coherent_page(page)) {
> +			entry = pte_mkold(mk_pte(page,
> +						 READ_ONCE(vma->vm_page_prot)));
> +			if (vma->vm_flags & VM_WRITE)
> +				entry = pte_mkwrite(pte_mkdirty(entry));

As I understand things device coherent pages use normal PTEs, so it would be
good if you could consolidate this to use the same code path as for normal
pages.

>  		} else {
>  			/*
> -			 * For now we only support migrating to un-addressable
> -			 * device memory.
> +			 * We support migrating to private and coherent types
> +			 * for device zone memory.
>  			 */
>  			pr_warn_once("Unsupported ZONE_DEVICE page type.\n");
>  			goto abort;
> @@ -2976,10 +2981,10 @@ void migrate_vma_pages(struct migrate_vma *migrate)
>  		mapping = page_mapping(page);
>  
>  		if (is_zone_device_page(newpage)) {
> -			if (is_device_private_page(newpage)) {
> +			if (is_device_page(newpage)) {
>  				/*
> -				 * For now only support private anonymous when
> -				 * migrating to un-addressable device memory.
> +				 * For now only support private and coherent
> +				 * anonymous when migrating to device memory.
>  				 */
>  				if (mapping) {
>  					migrate->src[i] &= ~MIGRATE_PFN_MIGRATE;
> 




