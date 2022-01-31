Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 744404A3DAE
	for <lists+dri-devel@lfdr.de>; Mon, 31 Jan 2022 07:32:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65ADE10E718;
	Mon, 31 Jan 2022 06:32:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam07on2041.outbound.protection.outlook.com [40.107.95.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EDBC10E235;
 Mon, 31 Jan 2022 06:32:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k3EiCoktLjFqX78PhwWJApCoMJ8OHAtzBLoaYz7Ri4gyTSw3FjSqaI7PFZhzVS3qKV+EiFvc+Ex1EaNQZFIH4WdN9xLYQdjAB30KF674erxTJndfHJfB5BdindF0VhSl5wFpE/VZ35DjS24+eBCeP6d9R7Uo+4NI41WcTcsmQuj6hHhKJTsWSaaE9xWOj7QFHSbC6fpInb0/gMDTmo7hvBk0SsPNo5mW6HXovMldqUr6aoyDiZHTVLQocGHxaIZA7brB9BIKFPj8JTkmDJaXWYhcfKAyhlfSUqtJ4OFsEXpV9cIG1dNxu8iBAWWnY5nLYLoYBBG7UC3XHIuR/kCj5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=07ZmxMef/UfRMy1Hg2dx8+w6Z4a5vQNaFpAa7lWQfek=;
 b=anp71xLvMgVbBX0uQLCeaH8vHO6iPjCYv5YFkJ24V9CEjSfRJKqeT3mJCKRVSckC7rxR5Qeub6cstlLxRNoAnQ2q21RjQENUndmRNEle7hPrhsrDVpf4vm1h9toTINaOoo+3h7t2H49XgMmSwZe08pTlIYSyig6WsqYPQ2RXcms2Fq01j2+BApN7ZTpHxR3CxAyj7BXUL5ep6BzBei/91VtU5enBs0LNPVCc0hJTvaVAo37f1TaxiDytIzCcYvStC8H4Npenro5/zaosLcu9KDmYUHot9Hsob/UTp+MWssCszT/IbEA7UimoDsmF2bzT3ioeNGUIRjacg1cX4Hlt9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.235) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=07ZmxMef/UfRMy1Hg2dx8+w6Z4a5vQNaFpAa7lWQfek=;
 b=HfsicyRuHv74sl6U9JZw5LxbL4T4E3Bk4sKWf3NXWHA+RJDVOSJPsRLAvBp8lKgxRPyLS26eMnKUKp9E84RWCnsMZTtFt6c4qcbBY3POHbsCX3ViSIyMDdsJMKhAlcw6lBCk5gg5tH4/hosOKvAy4T2wGsm7Liy/vdC+14cmoRQKKjuA7BJ1/4zZ9vmOEamk1NDcogCdHq8sr58qI+DrcOPMkdwA7oms95Z5tPc9PbQql/5LUHVYuysXQjGZicET4TEREFSGbKLUm8FaOcGqBwR8CcTk6zFksTVOs338vGVB8Gg3OruGbXuB4sJt9+UcVCSCLjJtqVDOxpFjo9tXXw==
Received: from DM3PR12CA0133.namprd12.prod.outlook.com (2603:10b6:0:51::29) by
 DM6PR12MB5551.namprd12.prod.outlook.com (2603:10b6:5:1bc::15) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4930.18; Mon, 31 Jan 2022 06:32:48 +0000
Received: from DM6NAM11FT032.eop-nam11.prod.protection.outlook.com
 (2603:10b6:0:51:cafe::30) by DM3PR12CA0133.outlook.office365.com
 (2603:10b6:0:51::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.15 via Frontend
 Transport; Mon, 31 Jan 2022 06:32:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.235)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.235 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.235; helo=mail.nvidia.com;
Received: from mail.nvidia.com (12.22.5.235) by
 DM6NAM11FT032.mail.protection.outlook.com (10.13.173.93) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4930.15 via Frontend Transport; Mon, 31 Jan 2022 06:32:48 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1497.18;
 Mon, 31 Jan 2022 06:32:47 +0000
Received: from nvdebian.localnet (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.9; Sun, 30 Jan 2022
 22:32:44 -0800
From: Alistair Popple <apopple@nvidia.com>
To: <akpm@linux-foundation.org>, <Felix.Kuehling@amd.com>,
 <linux-mm@kvack.org>, <rcampbell@nvidia.com>, <linux-ext4@vger.kernel.org>,
 <linux-xfs@vger.kernel.org>, Alex Sierra <alex.sierra@amd.com>
Subject: Re: [PATCH v5 01/10] mm: add zone device coherent type memory support
Date: Mon, 31 Jan 2022 17:20:54 +1100
Message-ID: <1898385.DmbL8g47rR@nvdebian>
In-Reply-To: <20220128200825.8623-2-alex.sierra@amd.com>
References: <20220128200825.8623-1-alex.sierra@amd.com>
 <20220128200825.8623-2-alex.sierra@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Originating-IP: [10.126.230.35]
X-ClientProxiedBy: drhqmail202.nvidia.com (10.126.190.181) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a0ead978-7366-4090-c47f-08d9e4837fa1
X-MS-TrafficTypeDiagnostic: DM6PR12MB5551:EE_
X-Microsoft-Antispam-PRVS: <DM6PR12MB5551B4775F942488EC3F4EC9DF259@DM6PR12MB5551.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 31hbhzqK89QGQSYjCO85o3hAvEr4B76eOjBVQFrvN2K17LKFZsuuTsKO67pdODZxOZZHykvZUXjZlNjbUPYAo9yXP86spomZJki9xkaGDm86w8XS4OIQT6IzqvO2DNxaX9wNcxYGN1hJsym9bPq/ywe2ambzr/XRd+MEBnBnJJnpwqr/oqLQXErrzHgYqkXiPG9OnpidiyDRtG8Q7QNZzL3JoCYfQ0D/99Tpyso9OJud+Ss7VElSsdXubb2nPJIk5IOSEnf+Y1qWp1H9MVLdfgDes9JMgMSI+RDFqvTfERr9UDhgck69BeGlw2hYJht7qhTgPz/gKz1y4A0jbACDk+l+mVUroOGixo1dbkmFeIwQl+KGiWoN/0wkKbsbSwdvAozknzJFPSNFIiXnHLTUCNOSAd1X246D16gjSQohok8q5Lj/GL7z1JIxopcpoq8iTMR0oJKYFi4Bnz35Ic7OaSYzfI/ilrB9aY8WCJg6cUWqgwb1F7f19uNBQyaZwDvWhqUxwVpKJ7wwYJ7FvuLr6nuhXkkoRYNSRrA5YPQTW8YE+IkH7bZR+gMub/MidvNaVo4/9YMl4hEyfWsA+5FjJ85BB4OJ/iEDYg5UYXExIEwEbn4DWsjTzbsVf9Vond+JXriJvZBmGHYMKk0rhec0AGWu1gnN4hCFUHXXexLfRD9m1M/e3sojvewxp24J4KqMnabl2Br4/jmtCQO2jwfkEgW7Y2KkOWo/wCnGfMjgi7M=
X-Forefront-Antispam-Report: CIP:12.22.5.235; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:mail.nvidia.com; PTR:InfoNoRecords; CAT:NONE;
 SFS:(13230001)(4636009)(36840700001)(40470700004)(46966006)(9686003)(426003)(47076005)(82310400004)(336012)(16526019)(26005)(186003)(33716001)(86362001)(508600001)(36860700001)(30864003)(5660300002)(83380400001)(6666004)(2906002)(70206006)(4326008)(8676002)(8936002)(70586007)(40460700003)(9576002)(7416002)(316002)(54906003)(81166007)(110136005)(356005)(39026012)(36900700001)(20210929001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2022 06:32:48.1230 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a0ead978-7366-4090-c47f-08d9e4837fa1
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[12.22.5.235];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT032.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB5551
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

Looks good, feel free to add:

Reviewed-by: Alistair Popple <apopple@nvidia.com>

On Saturday, 29 January 2022 7:08:16 AM AEDT Alex Sierra wrote:
> Device memory that is cache coherent from device and CPU point of view.
> This is used on platforms that have an advanced system bus (like CAPI
> or CXL). Any page of a process can be migrated to such memory. However,
> no one should be allowed to pin such memory so that it can always be
> evicted.
> 
> Signed-off-by: Alex Sierra <alex.sierra@amd.com>
> Acked-by: Felix Kuehling <Felix.Kuehling@amd.com>
> ---
> v4:
> - use the same system entry path for coherent device pages at
> migrate_vma_insert_page.
> 
> - Add coherent device type support for try_to_migrate /
> try_to_migrate_one.
> ---
>  include/linux/memremap.h |  8 +++++++
>  include/linux/mm.h       | 16 ++++++++++++++
>  mm/memcontrol.c          |  6 +++---
>  mm/memory-failure.c      |  8 +++++--
>  mm/memremap.c            | 14 ++++++++++++-
>  mm/migrate.c             | 45 ++++++++++++++++++++--------------------
>  mm/rmap.c                |  5 +++--
>  7 files changed, 71 insertions(+), 31 deletions(-)
> 
> diff --git a/include/linux/memremap.h b/include/linux/memremap.h
> index 1fafcc38acba..727b8c789193 100644
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
> index e1a84b1e6787..0c61bf40edef 100644
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@ -1106,6 +1106,7 @@ static inline bool page_is_devmap_managed(struct page *page)
>  		return false;
>  	switch (page->pgmap->type) {
>  	case MEMORY_DEVICE_PRIVATE:
> +	case MEMORY_DEVICE_COHERENT:
>  	case MEMORY_DEVICE_FS_DAX:
>  		return true;
>  	default:
> @@ -1135,6 +1136,21 @@ static inline bool is_device_private_page(const struct page *page)
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
> +static inline bool is_dev_private_or_coherent_page(const struct page *page)
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
> index 09d342c7cbd0..0882b5b2a857 100644
> --- a/mm/memcontrol.c
> +++ b/mm/memcontrol.c
> @@ -5691,8 +5691,8 @@ static int mem_cgroup_move_account(struct page *page,
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
> @@ -5726,7 +5726,7 @@ static enum mc_target_type get_mctgt_type(struct vm_area_struct *vma,
>  		 */
>  		if (page_memcg(page) == mc.from) {
>  			ret = MC_TARGET_PAGE;
> -			if (is_device_private_page(page))
> +			if (is_dev_private_or_coherent_page(page))
>  				ret = MC_TARGET_DEVICE;
>  			if (target)
>  				target->page = page;
> diff --git a/mm/memory-failure.c b/mm/memory-failure.c
> index 14ae5c18e776..e83740f7f05e 100644
> --- a/mm/memory-failure.c
> +++ b/mm/memory-failure.c
> @@ -1611,12 +1611,16 @@ static int memory_failure_dev_pagemap(unsigned long pfn, int flags,
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
> index 6aa5f0c2d11f..354c8027823f 100644
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
> @@ -327,6 +329,16 @@ void *memremap_pages(struct dev_pagemap *pgmap, int nid)
>  			return ERR_PTR(-EINVAL);
>  		}
>  		break;
> +	case MEMORY_DEVICE_COHERENT:
> +		if (!pgmap->ops->page_free) {
> +			WARN(1, "Missing page_free method\n");
> +			return ERR_PTR(-EINVAL);
> +		}
> +		if (!pgmap->owner) {
> +			WARN(1, "Missing owner\n");
> +			return ERR_PTR(-EINVAL);
> +		}
> +		break;
>  	case MEMORY_DEVICE_FS_DAX:
>  		if (!IS_ENABLED(CONFIG_ZONE_DEVICE) ||
>  		    IS_ENABLED(CONFIG_FS_DAX_LIMITED)) {
> @@ -469,7 +481,7 @@ EXPORT_SYMBOL_GPL(get_dev_pagemap);
>  void free_devmap_managed_page(struct page *page)
>  {
>  	/* notify page idle for dax */
> -	if (!is_device_private_page(page)) {
> +	if (!is_dev_private_or_coherent_page(page)) {
>  		wake_up_var(&page->_refcount);
>  		return;
>  	}
> diff --git a/mm/migrate.c b/mm/migrate.c
> index c7da064b4781..cd137aedcfe5 100644
> --- a/mm/migrate.c
> +++ b/mm/migrate.c
> @@ -345,7 +345,7 @@ static int expected_page_refs(struct address_space *mapping, struct page *page)
>  	 * Device private pages have an extra refcount as they are
>  	 * ZONE_DEVICE pages.
>  	 */
> -	expected_count += is_device_private_page(page);
> +	expected_count += is_dev_private_or_coherent_page(page);
>  	if (mapping)
>  		expected_count += compound_nr(page) + page_has_private(page);
>  
> @@ -2611,7 +2611,7 @@ EXPORT_SYMBOL(migrate_vma_setup);
>   *     handle_pte_fault()
>   *       do_anonymous_page()
>   * to map in an anonymous zero page but the struct page will be a ZONE_DEVICE
> - * private page.
> + * private or coherent page.
>   */
>  static void migrate_vma_insert_page(struct migrate_vma *migrate,
>  				    unsigned long addr,
> @@ -2676,25 +2676,24 @@ static void migrate_vma_insert_page(struct migrate_vma *migrate,
>  	 */
>  	__SetPageUptodate(page);
>  
> -	if (is_zone_device_page(page)) {
> -		if (is_device_private_page(page)) {
> -			swp_entry_t swp_entry;
> +	if (is_device_private_page(page)) {
> +		swp_entry_t swp_entry;
>  
> -			if (vma->vm_flags & VM_WRITE)
> -				swp_entry = make_writable_device_private_entry(
> -							page_to_pfn(page));
> -			else
> -				swp_entry = make_readable_device_private_entry(
> -							page_to_pfn(page));
> -			entry = swp_entry_to_pte(swp_entry);
> -		} else {
> -			/*
> -			 * For now we only support migrating to un-addressable
> -			 * device memory.
> -			 */
> -			pr_warn_once("Unsupported ZONE_DEVICE page type.\n");
> -			goto abort;
> -		}
> +		if (vma->vm_flags & VM_WRITE)
> +			swp_entry = make_writable_device_private_entry(
> +						page_to_pfn(page));
> +		else
> +			swp_entry = make_readable_device_private_entry(
> +						page_to_pfn(page));
> +		entry = swp_entry_to_pte(swp_entry);
> +	} else if (is_zone_device_page(page) &&
> +		   !is_device_coherent_page(page)) {
> +		/*
> +		 * We support migrating to private and coherent types
> +		 * for device zone memory.
> +		 */
> +		pr_warn_once("Unsupported ZONE_DEVICE page type.\n");
> +		goto abort;
>  	} else {
>  		entry = mk_pte(page, vma->vm_page_prot);
>  		if (vma->vm_flags & VM_WRITE)
> @@ -2796,10 +2795,10 @@ void migrate_vma_pages(struct migrate_vma *migrate)
>  		mapping = page_mapping(page);
>  
>  		if (is_zone_device_page(newpage)) {
> -			if (is_device_private_page(newpage)) {
> +			if (is_dev_private_or_coherent_page(newpage)) {
>  				/*
> -				 * For now only support private anonymous when
> -				 * migrating to un-addressable device memory.
> +				 * For now only support private and coherent
> +				 * anonymous when migrating to device memory.
>  				 */
>  				if (mapping) {
>  					migrate->src[i] &= ~MIGRATE_PFN_MIGRATE;
> diff --git a/mm/rmap.c b/mm/rmap.c
> index 6a1e8c7f6213..f2bd5a3da72c 100644
> --- a/mm/rmap.c
> +++ b/mm/rmap.c
> @@ -1835,7 +1835,7 @@ static bool try_to_migrate_one(struct page *page, struct vm_area_struct *vma,
>  		/* Update high watermark before we lower rss */
>  		update_hiwater_rss(mm);
>  
> -		if (is_zone_device_page(page)) {
> +		if (is_device_private_page(page)) {
>  			unsigned long pfn = page_to_pfn(page);
>  			swp_entry_t entry;
>  			pte_t swp_pte;
> @@ -1976,7 +1976,8 @@ void try_to_migrate(struct page *page, enum ttu_flags flags)
>  					TTU_SYNC)))
>  		return;
>  
> -	if (is_zone_device_page(page) && !is_device_private_page(page))
> +	if (is_zone_device_page(page) &&
> +	    !is_dev_private_or_coherent_page(page))
>  		return;
>  
>  	/*
> 




