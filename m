Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40FD64B19AE
	for <lists+dri-devel@lfdr.de>; Fri, 11 Feb 2022 00:41:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E234210E1C8;
	Thu, 10 Feb 2022 23:41:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2088.outbound.protection.outlook.com [40.107.243.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9A8B10E1AA;
 Thu, 10 Feb 2022 23:41:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YJV60lBE4e69NXJgK6CVz3vhGbhRhPGG2y4kTEDfo+vR6ZabXJczbLSmBcfowc6fZG2KjbMgso/Gr/PXs8ZU1QmqLRJSKjKxuEEfN7e4+SL5yaQUPahbTnKnMhcPYMBpMJB87Lne0dXy5CA8ovSdPAGKNl69RlAzzFZm+sB0Cmixwf6+lZvlOZaXJTWCXm9+jev7NhCK0MlKqomVkrARsBFJsGpp54jqAAif+kzo0j9Owj1Eaunm9ZtKwzQFWB1xu6HyIWglLD0HV8HJeLs2kLlphLGLsoHBlQhrEYrg7ONbUrj21f176Ee/EETuu48n61VYm0wLC723D4FnW5fLUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2+8KdbZKYBF8Be+CMwXZ0qBJPfP9sEca8pm7JJU7UhA=;
 b=l+1fSIL9sykquceQQnRPLmGT80XvOLDDO+9G3ek+qOrzH/gp3hVhnmOVEmrC3Et13YM7qd6ZgOSWlFUQcRE5EEgq6o4HPlcncz/tZahg9nmWP0+7vA8FJqu2fd0HDlBahTDvDm9VmeRnXZRjYzYdq1OSnlD4KEWNsSNs4WESWsOmlwd+8j9T0G+6No6uC35EVJLmIhHe987Z+yf+n7L0WE58Lgh5H61NxQ6Z+Xqd0QyEhl6xOD+TglxAoV+m6FrjGLZwdID4w5tENGbGGb7RpKBtGd8xZnYyMgYdwuthJ7jquV+OdlML6AusOZBOn8+obQHz8+r9zNZadsYbk8vEpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.234) smtp.rcpttodomain=lst.de smtp.mailfrom=nvidia.com; dmarc=pass
 (p=reject sp=reject pct=100) action=none header.from=nvidia.com; dkim=none
 (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2+8KdbZKYBF8Be+CMwXZ0qBJPfP9sEca8pm7JJU7UhA=;
 b=sxQFb1B+yRGfaGgosFf7SQ/UOnAD4A7YCetXcAKJ+t6C90pURTWus6TQpM+2EwpwSee6NSzWZG/jHQ7UtI3Wzv865uwRWGFji3AgnknQr0LVtuOXQK8c+KuZcCOriQG99BCm9cCsbnJo8Xg2XiA5RFcBr/PAPVYRZCVcbiPvYDPgtl1euL03NxKtCjrP1M3li//hUZB0S+MiQaD+kQzw0Z6AbCnY/DWHDhQDW8shr4WYNceZ5dbRSaSzmYL2XAMXbIgEMxUnu9l7+NC3HZIHGAHAn+UjEWoXt/G+OKoSuIhPQxENInNExQ16FnoWbvQQvxzg6TK3IVurlMzcGIIR5Q==
Received: from BN0PR04CA0076.namprd04.prod.outlook.com (2603:10b6:408:ea::21)
 by DM6PR12MB2908.namprd12.prod.outlook.com (2603:10b6:5:185::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Thu, 10 Feb
 2022 23:41:18 +0000
Received: from BN8NAM11FT066.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:ea:cafe::bd) by BN0PR04CA0076.outlook.office365.com
 (2603:10b6:408:ea::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.14 via Frontend
 Transport; Thu, 10 Feb 2022 23:41:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.234)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.234; helo=mail.nvidia.com;
Received: from mail.nvidia.com (12.22.5.234) by
 BN8NAM11FT066.mail.protection.outlook.com (10.13.177.138) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4975.11 via Frontend Transport; Thu, 10 Feb 2022 23:41:17 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by DRHQMAIL101.nvidia.com
 (10.27.9.10) with Microsoft SMTP Server (TLS) id 15.0.1497.18;
 Thu, 10 Feb 2022 23:41:11 +0000
Received: from nvdebian.localnet (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.9; Thu, 10 Feb 2022
 15:41:07 -0800
From: Alistair Popple <apopple@nvidia.com>
To: <akpm@linux-foundation.org>, <linux-mm@kvack.org>, David Hildenbrand
 <david@redhat.com>
Subject: Re: [PATCH v2 2/3] mm/gup.c: Migrate device coherent pages when
 pinning instead of failing
Date: Fri, 11 Feb 2022 10:41:05 +1100
Message-ID: <5251686.PpEh1BJ82l@nvdebian>
In-Reply-To: <fb557284-bcab-6d95-ac60-acd7459e9e80@redhat.com>
References: <cover.0d3c846b1c6c294e055ff7ebe221fab9964c1436.1644207242.git-series.apopple@nvidia.com>
 <1894939.704c7Wv018@nvdebian>
 <fb557284-bcab-6d95-ac60-acd7459e9e80@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Originating-IP: [10.126.230.35]
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 16a4bd5f-504c-415c-b966-08d9eceed59d
X-MS-TrafficTypeDiagnostic: DM6PR12MB2908:EE_
X-Microsoft-Antispam-PRVS: <DM6PR12MB2908AE34AF904ECA76BD5441DF2F9@DM6PR12MB2908.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: f7wouD2riYtPX8E7ommPm+4sskDUXU1K+YsZMo4idADVG/Tj5GhYiliNjcH/xE9Q7W/dJoBWxcQwbaXvBnHalPtrr0lknho1MKDTuqZcbBk19b/hRMDjiPqe+KSDvT+qE+1qll7rYX9vVsS4nPW9YlrZJVh79rUfQnkn/+xRe2xAkTAx9BTxfTbY5QjzzhAK3yu4aDfjyVRUdLfEdCPM9v/HF+VgB5TTB5Mm9aVpe5Kf/zc2MTh1KMv6M/tuLZ0VayoPauZQqv+hgbmD+VZUGXcxuHQpc6Ebm96MFrVYHfNedKcfyxfzhPGiB9vtX0/kTORRKVSuyS1JJdf+ohz8UbZbj4hAFvubkUg0CE9YZ970koOC4I0Cbv/kgEisXEYbr5dMdZNi9awgN+lDQHrj6qXqMCh1pZwKsne/JCy+wuEmNg6ScXA2w4NwGh8OVkQdAIbOiP3wljXBIcn8uaBK/yym8pssOUP3becXsA5aiyXl3oAo248q92sc2Sue9AE5alZDHTEDbdJAdmKW7Wc8WQbSDlt6/e5Sgb3Og7fUBfpP7+T7VCwBjdN6rhSjzXBiJNfqP8c+MtbztOwtoE8J2HV7UBNJiWK/S9sjmAC+i8nBc1D73Hs+KlqH32gr3mXgghRnSlw4bFPOvnsjfzpzGQIphQZiggavup8fAGgwsiDXmxzY7/pxmS6qSiRR5ehJawjN4YbI/zx5L2fJC9IDychkoBr8qCFrFGVqYCmQwK7sxiaiIP0JJuQPbLxE0hDv
X-Forefront-Antispam-Report: CIP:12.22.5.234; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:mail.nvidia.com; PTR:InfoNoRecords; CAT:NONE;
 SFS:(13230001)(4636009)(40470700004)(46966006)(36840700001)(26005)(186003)(81166007)(5660300002)(2906002)(336012)(316002)(16526019)(426003)(40460700003)(7416002)(36860700001)(107886003)(54906003)(110136005)(9686003)(70206006)(53546011)(70586007)(47076005)(83380400001)(4326008)(8936002)(8676002)(33716001)(356005)(9576002)(508600001)(82310400004)(86362001)(39026012)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2022 23:41:17.8172 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 16a4bd5f-504c-415c-b966-08d9eceed59d
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[12.22.5.234];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT066.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2908
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
Cc: alex.sierra@amd.com, rcampbell@nvidia.com, willy@infradead.org,
 jhubbard@nvidia.com, Felix.Kuehling@amd.com, dri-devel@lists.freedesktop.org,
 linux-xfs@vger.kernel.org, jglisse@redhat.com, amd-gfx@lists.freedesktop.org,
 jgg@nvidia.com, linux-ext4@vger.kernel.org, hch@lst.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thursday, 10 February 2022 10:47:35 PM AEDT David Hildenbrand wrote:
> On 10.02.22 12:39, Alistair Popple wrote:
> > On Thursday, 10 February 2022 9:53:38 PM AEDT David Hildenbrand wrote:
> >> On 07.02.22 05:26, Alistair Popple wrote:
> >>> Currently any attempts to pin a device coherent page will fail. This is
> >>> because device coherent pages need to be managed by a device driver, and
> >>> pinning them would prevent a driver from migrating them off the device.
> >>>
> >>> However this is no reason to fail pinning of these pages. These are
> >>> coherent and accessible from the CPU so can be migrated just like
> >>> pinning ZONE_MOVABLE pages. So instead of failing all attempts to pin
> >>> them first try migrating them out of ZONE_DEVICE.
> >>>
> >>> Signed-off-by: Alistair Popple <apopple@nvidia.com>
> >>> Acked-by: Felix Kuehling <Felix.Kuehling@amd.com>
> >>> ---
> >>>
> >>> Changes for v2:
> >>>
> >>>  - Added Felix's Acked-by
> >>>  - Fixed missing check for dpage == NULL
> >>>
> >>>  mm/gup.c | 105 ++++++++++++++++++++++++++++++++++++++++++++++++++------
> >>>  1 file changed, 95 insertions(+), 10 deletions(-)
> >>>
> >>> diff --git a/mm/gup.c b/mm/gup.c
> >>> index 56d9577..5e826db 100644
> >>> --- a/mm/gup.c
> >>> +++ b/mm/gup.c
> >>> @@ -1861,6 +1861,60 @@ struct page *get_dump_page(unsigned long addr)
> >>>  
> >>>  #ifdef CONFIG_MIGRATION
> >>>  /*
> >>> + * Migrates a device coherent page back to normal memory. Caller should have a
> >>> + * reference on page which will be copied to the new page if migration is
> >>> + * successful or dropped on failure.
> >>> + */
> >>> +static struct page *migrate_device_page(struct page *page,
> >>> +					unsigned int gup_flags)
> >>> +{
> >>> +	struct page *dpage;
> >>> +	struct migrate_vma args;
> >>> +	unsigned long src_pfn, dst_pfn = 0;
> >>> +
> >>> +	lock_page(page);
> >>> +	src_pfn = migrate_pfn(page_to_pfn(page)) | MIGRATE_PFN_MIGRATE;
> >>> +	args.src = &src_pfn;
> >>> +	args.dst = &dst_pfn;
> >>> +	args.cpages = 1;
> >>> +	args.npages = 1;
> >>> +	args.vma = NULL;
> >>> +	migrate_vma_setup(&args);
> >>> +	if (!(src_pfn & MIGRATE_PFN_MIGRATE))
> >>> +		return NULL;
> >>> +
> >>> +	dpage = alloc_pages(GFP_USER | __GFP_NOWARN, 0);
> >>> +
> >>> +	/*
> >>> +	 * get/pin the new page now so we don't have to retry gup after
> >>> +	 * migrating. We already have a reference so this should never fail.
> >>> +	 */
> >>> +	if (dpage && WARN_ON_ONCE(!try_grab_page(dpage, gup_flags))) {
> >>> +		__free_pages(dpage, 0);
> >>> +		dpage = NULL;
> >>> +	}
> >>> +
> >>> +	if (dpage) {
> >>> +		lock_page(dpage);
> >>> +		dst_pfn = migrate_pfn(page_to_pfn(dpage));
> >>> +	}
> >>> +
> >>> +	migrate_vma_pages(&args);
> >>> +	if (src_pfn & MIGRATE_PFN_MIGRATE)
> >>> +		copy_highpage(dpage, page);
> >>> +	migrate_vma_finalize(&args);
> >>> +	if (dpage && !(src_pfn & MIGRATE_PFN_MIGRATE)) {
> >>> +		if (gup_flags & FOLL_PIN)
> >>> +			unpin_user_page(dpage);
> >>> +		else
> >>> +			put_page(dpage);
> >>> +		dpage = NULL;
> >>> +	}
> >>> +
> >>> +	return dpage;
> >>> +}
> >>> +
> >>> +/*
> >>>   * Check whether all pages are pinnable, if so return number of pages.  If some
> >>>   * pages are not pinnable, migrate them, and unpin all pages. Return zero if
> >>>   * pages were migrated, or if some pages were not successfully isolated.
> >>> @@ -1888,15 +1942,40 @@ static long check_and_migrate_movable_pages(unsigned long nr_pages,
> >>>  			continue;
> >>>  		prev_head = head;
> >>>  		/*
> >>> -		 * If we get a movable page, since we are going to be pinning
> >>> -		 * these entries, try to move them out if possible.
> >>> +		 * Device coherent pages are managed by a driver and should not
> >>> +		 * be pinned indefinitely as it prevents the driver moving the
> >>> +		 * page. So when trying to pin with FOLL_LONGTERM instead try
> >>> +		 * migrating page out of device memory.
> >>>  		 */
> >>>  		if (is_dev_private_or_coherent_page(head)) {
> >>> +			/*
> >>> +			 * device private pages will get faulted in during gup
> >>> +			 * so it shouldn't be possible to see one here.
> >>> +			 */
> >>>  			WARN_ON_ONCE(is_device_private_page(head));
> >>> -			ret = -EFAULT;
> >>> -			goto unpin_pages;
> >>> +			WARN_ON_ONCE(PageCompound(head));
> >>> +
> >>> +			/*
> >>> +			 * migration will fail if the page is pinned, so convert
> >>> +			 * the pin on the source page to a normal reference.
> >>> +			 */
> >>> +			if (gup_flags & FOLL_PIN) {
> >>> +				get_page(head);
> >>> +				unpin_user_page(head);
> >>> +			}
> >>> +
> >>> +			pages[i] = migrate_device_page(head, gup_flags);
> >>
> >> For ordinary migrate_pages(), we'll unpin all pages and return 0 so the
> >> caller will retry pinning by walking the page tables again.
> >>
> >> Why can't we apply the same mechanism here? This "let's avoid another
> >> walk" looks unnecessary complicated to me, but I might be wrong.
> > 
> > There's no reason we couldn't. I figured we have the page in the right spot
> > anyway so it was easy to do, and looking at this rebased on top of Christoph's
> > ZONE_DEVICE refcount simplification I'm not sure it would be any simpler
> > anyway.
> > 
> > It would remove the call to try_grab_page(), but we'd still have to return an
> > error on migration failures whilst also ensuring we putback any non-device
> > pages that may have been isolated. I might have overlooked something though,
> > so certainly happy for suggestions.
> 
> Staring at the code, I was wondering if we could either
> 
> * build a second list of device coherent pages to migrate and call a
>   migrate_device_pages() bulk function
> * simply use movable_page_list() and teach migrate_pages() how to handle
>   them.

I did consider that approach. The problem is zone device pages are not LRU
pages. In particular page->lru is not available to add the page to a list, and
as an external API and internally migrate_pages() relies heavily on moving
pages between lists.

> I'd really appreciate as little special casing as possible for the ever
> growing list of new DEVICE types all over the place. E.g., just staring
> at fork even before the new device coherent made my head spin.

That's fair. We could pull the checks for device pages out into a self
contained function (eg. check_and_migrate_device_pages()) called before
check_and_migrate_movable_pages(). The down side of that is we'd always have an
extra loop over all the pages just to scan for device pages, but perhaps that's
not a concern?



