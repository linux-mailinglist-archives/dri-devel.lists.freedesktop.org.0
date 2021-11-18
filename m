Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C45545556F
	for <lists+dri-devel@lfdr.de>; Thu, 18 Nov 2021 08:19:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E12C6E9FC;
	Thu, 18 Nov 2021 07:19:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2068.outbound.protection.outlook.com [40.107.243.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4ACBC6E9F9;
 Thu, 18 Nov 2021 07:19:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YEnu6swC7LkALJLSPjNwKUJ4uODs1+TqCPKWCXov4+F2lA0gFOBnC4DQXQue23UJ9p4tPyY4M7BWFJ6YKOFnyPwjQ1lqjkvq3S1XJbS/sUqbAP85PKHrulg+Az2LCjPQcZPlEnZTysoTcA18CMbffIZH0gohPb2l5CmYUEVOScNxubc5Zj+kI+orfobfqs8g9fDMrTaCvyTY8OLS6+UA7IlDNywoY9foWHtJQ+SrtDuG/MVmE4gQLaxZsP4BV9nLDs+BQ8FBxFptWLCTf58Haczkz+5ZhWINuBFZI5sQCMPxG4et2nIs2WgOQhRIJmoU6I6uY+n0tbd4PUcENYs/Qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R5FN9rVbtB3KB6qRL22qazT7r2YHkinMizjwZcHDxVM=;
 b=SX58dz6TzLMCNNemIaQxNhXNiRInk2UHWHVE98lbpR+msiT4ibIxlkj2k3APIAsV/4ZgypOQetFt3KMPx3X3VsjmoPflSLU1GAVj/Le5H9zAjyjSRqy1koQ+ZtME8xvPeT6MJ+Snq1MmIQyh2GfQhuPcU/a1i78oiTjccu3R8IBNYO4jZdYgdMEXS/aNwfs1NLq2RtFzHFzHYvQ5rimlx6FWlh2ZO4QbtSU8j9Q8z5OYkGD+I+5rry5sp5k+GwTtrQooZKP1QGNj0mGUWJ8VDFQeF9Qno50VQaPQq5wJuEglV/y9Th62FkOWKir7919vlzcFsQPirTCxMQx/tCHKVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=quarantine sp=quarantine pct=100)
 action=none header.from=nvidia.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R5FN9rVbtB3KB6qRL22qazT7r2YHkinMizjwZcHDxVM=;
 b=gRgTmMrjeGWH5imoYHceR/9PUQMo8Uu2JnV8W7q7EkO4W7IIqsVhkTxVPICHNgup2UZ6DSSAFKpmzOMqtY0pXDhNRUxBtfSkcY+QR2YnAugpjy8iUBN5ZEs7aSzJ9+xoxEX/84NkwvWkJ6NSvDgrxPQOWVo46izXxQrl2uKqxrqPSoZPXAzVPmMAP2DFge2e7rpXa2Vz1O3nT0pmKhtceU7WVeCnxq7TgsOZzdKgbsvac51evX57nEs9Udom0omBhsR55GDxPaIQXDneWuS3CLFp5NEZmpteGo+mnnIA61Ub5D5ho694LGYn5JuzgiJghPKQBZqYm5qDymBybVcv3g==
Received: from MWHPR17CA0073.namprd17.prod.outlook.com (2603:10b6:300:c2::11)
 by MW2PR12MB2378.namprd12.prod.outlook.com (2603:10b6:907:f::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.26; Thu, 18 Nov
 2021 07:19:35 +0000
Received: from CO1NAM11FT068.eop-nam11.prod.protection.outlook.com
 (2603:10b6:300:c2:cafe::65) by MWHPR17CA0073.outlook.office365.com
 (2603:10b6:300:c2::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19 via Frontend
 Transport; Thu, 18 Nov 2021 07:19:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 CO1NAM11FT068.mail.protection.outlook.com (10.13.175.142) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4713.20 via Frontend Transport; Thu, 18 Nov 2021 07:19:34 +0000
Received: from nvdebian.localnet (172.20.187.6) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Thu, 18 Nov
 2021 07:19:28 +0000
From: Alistair Popple <apopple@nvidia.com>
To: <akpm@linux-foundation.org>, <Felix.Kuehling@amd.com>,
 <linux-mm@kvack.org>, <rcampbell@nvidia.com>, <linux-ext4@vger.kernel.org>,
 <linux-xfs@vger.kernel.org>, Alex Sierra <alex.sierra@amd.com>
Subject: Re: [PATCH v1 1/9] mm: add zone device coherent type memory support
Date: Thu, 18 Nov 2021 17:53:49 +1100
Message-ID: <1997502.P62F5Z1OZk@nvdebian>
In-Reply-To: <20211115193026.27568-2-alex.sierra@amd.com>
References: <20211115193026.27568-1-alex.sierra@amd.com>
 <20211115193026.27568-2-alex.sierra@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Originating-IP: [172.20.187.6]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: da5e6be7-9372-4c0a-fce2-08d9aa63c5f2
X-MS-TrafficTypeDiagnostic: MW2PR12MB2378:
X-Microsoft-Antispam-PRVS: <MW2PR12MB237862FA1BA3E95157E38CFEDF9B9@MW2PR12MB2378.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mnq0/Vv7gEdbC7I6H2gzQr0YxA2KhcsvUWsZyMyOL4osAHHEfu5u6Uqo/EIlCv1p4Ap0BGKdRWzu1CZ4c87Yy/hhsn1t5qLkHUmyzSu8iKuQKfmZkyqo8yY2AuQS4c1TRa8d/aYE0zF84YV9w1c0tPu9caDP5zItP+rLiP+3ojDKdx+vuWOcvyarlQLx+uRGYalBegkQpuYvD2CQJnk2flZfhumK3SEzDTMznY0qLowbJTfIlWqCjoS0ayUE0t30oRmZ0p/bv5I2fb72WoffFlaSFpVLERjL8EwGwtjlMpGQp6S6UkbNaVRyP+V0GRK+w4QP/lL7QW+Pl55kr5XJs7wXcF4teYwRmAZGGa7B5PilSGONPiAV/y45973FWT3zVniKb+E6w1A2fECMhdvZsVkbMFz+YeHZ3uhJ/BlkHaGJFxXnpQoQIAyiqdQi8ruIbJeE3SoGxPKQCP94bsR9PPg7n18MSbh6ImyKT1j+H0jQ2s1r+ortWgI1kb8JlHEKYY3IdPw5AbKQrn3iOD/vEXOai2mQ6mdnxUKHewD8Gb1OHvTAYhG59njNwlqUGqv7LVQSKA1aS3Ps+JPktd+vpoe78EhDHFA2//pxoIJKQPAYkMwdtKr52S+mu0d0Zg+TTM8Qs7X9PwaGsDdOvmVHQSKKHFcq80pltoFN9p/nbVQrroiIkccnrDfNDXqIISd96XZwiTeN78DJOlc28F04JYsIxINgNI4yCh6svd3gTWdnVE3q15NS5O6GD1LL6CXwOIPmUipWTV5360iC9DEjlLf/6M9XFdgF6D4My2Ht7r2OZ9SQLw571hYsw5GWQZ3B
X-Forefront-Antispam-Report: CIP:216.228.112.34; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid03.nvidia.com; CAT:NONE;
 SFS:(4636009)(46966006)(36840700001)(6666004)(70586007)(7636003)(70206006)(356005)(186003)(16526019)(82310400003)(83380400001)(33716001)(26005)(8936002)(9576002)(5660300002)(966005)(508600001)(426003)(316002)(47076005)(36860700001)(8676002)(86362001)(2906002)(4326008)(7416002)(54906003)(9686003)(336012)(110136005)(39026012);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2021 07:19:34.7816 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: da5e6be7-9372-4c0a-fce2-08d9aa63c5f2
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.34];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT068.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR12MB2378
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

On Tuesday, 16 November 2021 6:30:18 AM AEDT Alex Sierra wrote:
> Device memory that is cache coherent from device and CPU point of view.
> This is used on platforms that have an advanced system bus (like CAPI
> or CXL). Any page of a process can be migrated to such memory. However,
> no one should be allowed to pin such memory so that it can always be
> evicted.
> 
> Signed-off-by: Alex Sierra <alex.sierra@amd.com>
> ---
>  include/linux/memremap.h |  8 ++++++++
>  include/linux/mm.h       |  9 +++++++++
>  mm/memcontrol.c          |  6 +++---
>  mm/memory-failure.c      |  6 +++++-
>  mm/memremap.c            |  5 ++++-
>  mm/migrate.c             | 21 +++++++++++++--------
>  6 files changed, 42 insertions(+), 13 deletions(-)
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
> index 73a52aba448f..d23b6ebd2177 100644
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
> @@ -1191,6 +1192,14 @@ static inline bool is_device_private_page(const struct page *page)
>  		page->pgmap->type == MEMORY_DEVICE_PRIVATE;
>  }
>  
> +static inline bool is_device_page(const struct page *page)
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
> index 6da5020a8656..e0275ebe1198 100644
> --- a/mm/memcontrol.c
> +++ b/mm/memcontrol.c
> @@ -5695,8 +5695,8 @@ static int mem_cgroup_move_account(struct page *page,
>   *   2(MC_TARGET_SWAP): if the swap entry corresponding to this pte is a
>   *     target for charge migration. if @target is not NULL, the entry is stored
>   *     in target->ent.
> - *   3(MC_TARGET_DEVICE): like MC_TARGET_PAGE  but page is MEMORY_DEVICE_PRIVATE
> - *     (so ZONE_DEVICE page and thus not on the lru).
> + *   3(MC_TARGET_DEVICE): like MC_TARGET_PAGE  but page is MEMORY_DEVICE_COHERENT
> + *     or MEMORY_DEVICE_PRIVATE (so ZONE_DEVICE page and thus not on the lru).
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
> index 3e6449f2102a..51b55fc5172c 100644
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
>  		 * TODO: Handle HMM pages which may need coordination
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
>  			WARN(1, "Device private memory not supported\n");
>  			return ERR_PTR(-EINVAL);
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
> index 1852d787e6ab..f74422a42192 100644
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

Note that I have posted a patch to fix this - see
https://lore.kernel.org/all/20211118020754.954425-1-apopple@nvidia.com/. This
looks ok for now assuming coherent pages can never be pinned.

However that raises a question - what happens when something calls
get_user_pages() on a pfn pointing to a coherent device page? I can't see
anything in this series that prevents pinning of coherent device pages, so we
can't just assume they aren't pinned.

In the case of device-private pages this is enforced by the fact they never
have present pte's, so any attempt to GUP them results in a fault. But if I'm
understanding this series correctly that won't be the case for coherent device
pages right?

> -		return is_device_private_page(page);
> +		return is_device_page(page);
>  	}
>  
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
> +		} else if (is_device_page(page)) {

How about adding an explicit `is_device_coherent_page()` helper? It would make
the test more explicit that this is expected to handle just coherent pages and
I bet there will be future changes that need to differentiate between private
and coherent pages anyway.

> +			entry = pte_mkold(mk_pte(page,
> +						 READ_ONCE(vma->vm_page_prot)));
> +			if (vma->vm_flags & VM_WRITE)
> +				entry = pte_mkwrite(pte_mkdirty(entry));
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




