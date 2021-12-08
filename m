Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5703046D2B3
	for <lists+dri-devel@lfdr.de>; Wed,  8 Dec 2021 12:47:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B91C86F509;
	Wed,  8 Dec 2021 11:47:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2058.outbound.protection.outlook.com [40.107.220.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98BAC6F509;
 Wed,  8 Dec 2021 11:47:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c4IdQ4foTuev6i3X6jdm2V1TDDYF+0BEZGj/YQ+IWmJcjTjfAqWdy7o0hRrWIZOljJZJkS4mVgOcVT4qPQWk0r2cClkiAaPLwzr4/PfzamvXFnj1ZhbOW4FBm2iRKxyJ51TZnOhWEtnaWLbBCtDffD8Rlh9X5T5H5t0bSaNgU1S9P3kikLuSALUbUWzwKQVmgGr+deG7x69ATHIN4sd0UACg+UxfHN8OXEKZZz46v39xiABXxg00bfvXhKlF9DV6LU3RTufbOLzeA366UsTUFRvUfbqOSPSAwBHArh11BNVx7FqNQRZujk+mfioPi9ur9J8A/1+mbzFXfnZjeZMRdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yUQIir228oQzs9R1fKVGbVGxSNeX9feRzyUi549+7Rw=;
 b=jMUIvL+DyhisfQ6LNJEcKGNSIaSkDG2Bpvzo8o/dgvgBtFI8kMO4Wfa9HKgFNv59RTjQVpkHQfRXjfft221zgzUAfgwlV7lgp5royhWQR1yn/WiUGFXyBq5SF8eZEIhVr5CYWyAnzxkVlZcyX65OOoZ7c/+JTLekgY9cICaFIFY9IjgsW+7zp1Np6oIG/U21eHyoD/lXx3vcmyRkRw9mlFwfVrux2goqMcmo2tZMUgjFYS8Py67SZql2Z29WvBrQsJb6qvJI1Av1wIgXd/H90nLCsomYQ7ihxGInJAc2NHqO4pWAkr1ibw278uYsdS5no2UIRfPLcpJiIDKsNy3+Yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 203.18.50.14) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=quarantine sp=quarantine pct=100)
 action=none header.from=nvidia.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yUQIir228oQzs9R1fKVGbVGxSNeX9feRzyUi549+7Rw=;
 b=CsatU5lq8afQdRlRI6zlKepfDuJTIQ5+coy7VHUU+JIexPEfMuz63TKiImKgf4vH17cY+5S3hWtikd+CsTtEBdyO9dVWAiGBL5F41SQIP+Xyv0t1QbLB50zyWfTYR5rN6pq0V48LYbJq+rUQ1AB+LSiE4/id+f+dndfkLiackE+7Or+LHFOd7CpWyXRtKE2KOk9YI27iNhrKE0ni2teDpVN1I5iw/qlJX4+9/hDqhxwncgmAfDCtOF5DlnCWn3w36QQrS5SiLl8i1uayZRlaJIU8rW//1jRTFyQ2SEvDP3TX8kjPCC/LkTHdd2g+rzKoacC/jDSihqAi1avq7uQt0g==
Received: from BN1PR13CA0021.namprd13.prod.outlook.com (2603:10b6:408:e2::26)
 by DM8PR12MB5495.namprd12.prod.outlook.com (2603:10b6:8:33::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.21; Wed, 8 Dec
 2021 11:32:12 +0000
Received: from BN8NAM11FT033.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:e2:cafe::e1) by BN1PR13CA0021.outlook.office365.com
 (2603:10b6:408:e2::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.10 via Frontend
 Transport; Wed, 8 Dec 2021 11:32:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 203.18.50.14)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 203.18.50.14 as permitted sender) receiver=protection.outlook.com;
 client-ip=203.18.50.14; helo=mail.nvidia.com;
Received: from mail.nvidia.com (203.18.50.14) by
 BN8NAM11FT033.mail.protection.outlook.com (10.13.177.149) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4755.13 via Frontend Transport; Wed, 8 Dec 2021 11:32:11 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by HKMAIL103.nvidia.com
 (10.18.16.12) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Wed, 8 Dec
 2021 11:32:06 +0000
Received: from nvdebian.localnet (172.20.187.6) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.986.9; Wed, 8 Dec 2021
 03:32:02 -0800
From: Alistair Popple <apopple@nvidia.com>
To: <akpm@linux-foundation.org>, <Felix.Kuehling@amd.com>,
 <linux-mm@kvack.org>, <rcampbell@nvidia.com>, <linux-ext4@vger.kernel.org>,
 <linux-xfs@vger.kernel.org>, Alex Sierra <alex.sierra@amd.com>
Subject: Re: [PATCH v2 03/11] mm/gup: migrate PIN_LONGTERM dev coherent pages
 to system
Date: Wed, 8 Dec 2021 22:31:58 +1100
Message-ID: <2858338.J0npWUQLIM@nvdebian>
In-Reply-To: <20211206185251.20646-4-alex.sierra@amd.com>
References: <20211206185251.20646-1-alex.sierra@amd.com>
 <20211206185251.20646-4-alex.sierra@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Originating-IP: [172.20.187.6]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ca4b1442-ca8a-499a-d6e2-08d9ba3e6094
X-MS-TrafficTypeDiagnostic: DM8PR12MB5495:EE_
X-Microsoft-Antispam-PRVS: <DM8PR12MB5495BE72270D21ECECAFC46EDF6F9@DM8PR12MB5495.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3383;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: R6tx79LbC8Wj0QHT2szrljkS4Y+jFRpcQwymbsC+9b+g2xXDrzAJjF05k/YzejipBmajsQM8+voqB37vcXQgYb+OPNuxQMKLZ9d3d/ag1rTn/b8EDAJ5oh6lSsF6F7ivEeE99kOPHriqt5rAHtJpoUb8ZPmPZjCu1/zusXrr8zvWJDNfw079sVhZPepxt+rR+o7eLjMjvNS0f8aWYnl7PAMcGhROyhUo72siDQ09Z1lJRJNM13D4OUl91S02guuiYTMrev4S1QDkTXEgGS9h4dpZ8GjXZwnskUuNg9F84U92nXBFCUmn2hEXBru9QkSbZf5DGvD/i7WduLacqwhfU5CQDtA2J0c/n6KycxKOIn/O+m1jSIyppwL7eEMDPysVi+TnC3lZ5OJR6yzo0VZaubr1mrJrIhZ3nOD49omIkEL7j3rJitv7j4y2Oqq3DqWf+ydvIBEZGmKU4IrxRlC62plQt3NDmpNGtzbBTnO0sTJN35Z1pwbg65znrYQpEEJJLxscKfzrSDRaxs4x2UK5euxnwb8Pf9jT8+xlDjljCNSTHNLeI9WhxcNIrh1ElemBkhPdnBUZzONoDRfof2r6GBi96irOfFugzteVOK2T6zoGHVjG7VwwT/HvJwgb/wky0230/TMxx4AwC+0zgMPwg5piIjSLxmWZDeMSLfdoUUobS8Rkc3g2qFTFZb+r4wg25c6BJRFHGMepbD98pnEO51Pw6oEMnN3824HZDRjmC1YfVG+Pv7NQ5sQ6DhWj17rYQgSJSG4Bfuc4MV851iqvup3kUjHzkraIvzkH0ICfa1SB2X4PFLj6gqx0rtuIRJQnHbR0BWmYPaVAiEk8tdJkrA==
X-Forefront-Antispam-Report: CIP:203.18.50.14; CTRY:HK; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:hkhybrid03.nvidia.com; CAT:NONE;
 SFS:(4636009)(46966006)(36840700001)(40470700001)(2906002)(70586007)(36860700001)(70206006)(316002)(47076005)(5660300002)(54906003)(26005)(9576002)(33716001)(83380400001)(16526019)(7636003)(110136005)(186003)(8936002)(4326008)(336012)(426003)(9686003)(6666004)(7416002)(8676002)(508600001)(356005)(86362001)(34070700002)(82310400004)(40460700001)(39026012);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2021 11:32:11.5741 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ca4b1442-ca8a-499a-d6e2-08d9ba3e6094
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[203.18.50.14];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT033.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR12MB5495
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

On Tuesday, 7 December 2021 5:52:43 AM AEDT Alex Sierra wrote:
> Avoid long term pinning for Coherent device type pages. This could
> interfere with their own device memory manager.
> If caller tries to get user device coherent pages with PIN_LONGTERM flag
> set, those pages will be migrated back to system memory.
> 
> Signed-off-by: Alex Sierra <alex.sierra@amd.com>
> ---
>  mm/gup.c | 32 ++++++++++++++++++++++++++++++--
>  1 file changed, 30 insertions(+), 2 deletions(-)
> 
> diff --git a/mm/gup.c b/mm/gup.c
> index 886d6148d3d0..1572eacf07f4 100644
> --- a/mm/gup.c
> +++ b/mm/gup.c
> @@ -1689,17 +1689,37 @@ struct page *get_dump_page(unsigned long addr)
>  #endif /* CONFIG_ELF_CORE */
>  
>  #ifdef CONFIG_MIGRATION
> +static int migrate_device_page(unsigned long address,
> +				struct page *page)
> +{
> +	struct vm_area_struct *vma = find_vma(current->mm, address);
> +	struct vm_fault vmf = {
> +		.vma = vma,
> +		.address = address & PAGE_MASK,
> +		.flags = FAULT_FLAG_USER,
> +		.pgoff = linear_page_index(vma, address),
> +		.gfp_mask = GFP_KERNEL,
> +		.page = page,
> +	};
> +	if (page->pgmap && page->pgmap->ops->migrate_to_ram)
> +		return page->pgmap->ops->migrate_to_ram(&vmf);

How does this synchronise against pgmap being released? As I understand things
at this point we're not holding a reference on either the page or pgmap, so
the page and therefore the pgmap may have been freed.

I think a similar problem exists for device private fault handling as well and
it has been on my list of things to fix for a while. I think the solution is to
call try_get_page(), except it doesn't work with device pages due to the whole
refcount thing. That issue is blocking a fair bit of work now so I've started
looking into it.

> +
> +	return -EBUSY;
> +}
> +
>  /*
>   * Check whether all pages are pinnable, if so return number of pages.  If some
>   * pages are not pinnable, migrate them, and unpin all pages. Return zero if
>   * pages were migrated, or if some pages were not successfully isolated.
>   * Return negative error if migration fails.
>   */
> -static long check_and_migrate_movable_pages(unsigned long nr_pages,
> +static long check_and_migrate_movable_pages(unsigned long start,
> +					    unsigned long nr_pages,
>  					    struct page **pages,
>  					    unsigned int gup_flags)
>  {
>  	unsigned long i;
> +	unsigned long page_index;
>  	unsigned long isolation_error_count = 0;
>  	bool drain_allow = true;
>  	LIST_HEAD(movable_page_list);
> @@ -1720,6 +1740,10 @@ static long check_and_migrate_movable_pages(unsigned long nr_pages,
>  		 * If we get a movable page, since we are going to be pinning
>  		 * these entries, try to move them out if possible.
>  		 */
> +		if (is_device_page(head)) {
> +			page_index = i;
> +			goto unpin_pages;
> +		}
>  		if (!is_pinnable_page(head)) {
>  			if (PageHuge(head)) {
>  				if (!isolate_huge_page(head, &movable_page_list))
> @@ -1750,12 +1774,16 @@ static long check_and_migrate_movable_pages(unsigned long nr_pages,
>  	if (list_empty(&movable_page_list) && !isolation_error_count)
>  		return nr_pages;
>  
> +unpin_pages:
>  	if (gup_flags & FOLL_PIN) {
>  		unpin_user_pages(pages, nr_pages);
>  	} else {
>  		for (i = 0; i < nr_pages; i++)
>  			put_page(pages[i]);
>  	}
> +	if (is_device_page(head))
> +		return migrate_device_page(start + page_index * PAGE_SIZE, head);

This isn't very optimal - if a range contains more than one device page (which
seems likely) we will have to go around the whole gup/check_and_migrate loop
once for each device page which seems unnecessary. You should be able to either
build a list or migrate them as you go through the loop. I'm also currently
looking into how to extend migrate_pages() to support device pages which might
be useful here too.

> +
>  	if (!list_empty(&movable_page_list)) {
>  		ret = migrate_pages(&movable_page_list, alloc_migration_target,
>  				    NULL, (unsigned long)&mtc, MIGRATE_SYNC,
> @@ -1798,7 +1826,7 @@ static long __gup_longterm_locked(struct mm_struct *mm,
>  					     NULL, gup_flags);
>  		if (rc <= 0)
>  			break;
> -		rc = check_and_migrate_movable_pages(rc, pages, gup_flags);
> +		rc = check_and_migrate_movable_pages(start, rc, pages, gup_flags);
>  	} while (!rc);
>  	memalloc_pin_restore(flags);
>  
> 




