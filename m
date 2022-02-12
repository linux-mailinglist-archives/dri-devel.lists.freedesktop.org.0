Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 208574B32C7
	for <lists+dri-devel@lfdr.de>; Sat, 12 Feb 2022 03:51:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9307F10EBD5;
	Sat, 12 Feb 2022 02:51:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2040.outbound.protection.outlook.com [40.107.237.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17E3910EBD5;
 Sat, 12 Feb 2022 02:51:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jd+NRlTqhbpMVHDYwImviil0CpEZJeyWuh957b1YejY3Od0T1K8TYggKKcw8SOwc+axeIe3yl/qS2xeWAr/QOqjPe52Q3KEym53gWWOSnNXcErcw4e7lKWXqpYf2StB3ouS1C9lB+7YH6L9BON5vUL9wFINRRBiXN0OMDP1YmCLZHSLFqHmvuIuKbBIc827fgiqGBn/64VRhVzsQYArQ0hIezrP95QBolWRE0whGKjVkX98bNb4mD3fTzwNrNPFQjnZbfG5TQ50KwAE6zogP1GuedPNkdf/OZtkQbuujzOrDPYvnHRMuZzTS38SPYBsPr15o9kBq/x9nyQG7pdi/ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1hNkKlQ4npBFb4r7TUcva+pUn1aiISFT+LZQTOHLARk=;
 b=M9+CYbP996SNyf4b/lRUiGsDPR6x627yvVyrkaa+wRAu946tCO/yJ3IpnbTnEz8h2DAKpGlOls3jzvDK7tcHF80LuLRnLFlZOXQ1G1gwWxwei+xyiC8UWZed8aYcbU6OrEaNUKlm1YkKau3LLsYBecissc9UlyX8tBD5ZTfEakqzWOEOil/QyRlvDX0k41EsmE1OjiEoJ5u9CsR8qBo6OaZFvDahfPXuDDTDEhDbtvinePX0GiekgedN4VmqLsgt1uEPqX3Hr213ZL4qK7Mh1nG17PyPexvLtpyMid2hBZcpHu6tr0gba9c7pzE62V47OSb5B7m2/+xMNrnxn/Laxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.234) smtp.rcpttodomain=lst.de smtp.mailfrom=nvidia.com; dmarc=pass
 (p=reject sp=reject pct=100) action=none header.from=nvidia.com; dkim=none
 (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1hNkKlQ4npBFb4r7TUcva+pUn1aiISFT+LZQTOHLARk=;
 b=Elq5c7XKg48UOaH0Gp9tFgSh+shvpl2fZuJyga83bRvuYCUPUD7il+RKJL2w1ieXV59tWpO7hyo4fEpAGfQ6+stfh/6xxFJjMG3QdfiUwJ1kVpKjgbb/1Mj9d/bj5pk7ClEviavGDQcq53aliF99JpnPiu/6wUBP8/ybRWroPxLUp/wr1TksNx0hXNO4DCFPAhxviLvAZfUX8ZQg0khJxb7t9+rbR9sSAO3hGuCZhWPLwAxDyr51Pvyujfk2vr7OVdpJVbUtSYIEZU7G8TDSuKKNDZyeRcxpfbtGHxc+qsx+pC6YrO+aoD3bNLewC8/O7C1txyY1iMhiwOcbG/uhjA==
Received: from DM3PR12CA0045.namprd12.prod.outlook.com (2603:10b6:0:56::13) by
 DM4PR12MB5246.namprd12.prod.outlook.com (2603:10b6:5:399::17) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4951.12; Sat, 12 Feb 2022 02:51:22 +0000
Received: from DM6NAM11FT016.eop-nam11.prod.protection.outlook.com
 (2603:10b6:0:56:cafe::b2) by DM3PR12CA0045.outlook.office365.com
 (2603:10b6:0:56::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.12 via Frontend
 Transport; Sat, 12 Feb 2022 02:51:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.234)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.234; helo=mail.nvidia.com;
Received: from mail.nvidia.com (12.22.5.234) by
 DM6NAM11FT016.mail.protection.outlook.com (10.13.173.139) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4975.11 via Frontend Transport; Sat, 12 Feb 2022 02:51:21 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by DRHQMAIL101.nvidia.com
 (10.27.9.10) with Microsoft SMTP Server (TLS) id 15.0.1497.18;
 Sat, 12 Feb 2022 02:51:20 +0000
Received: from nvdebian.localnet (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.9; Fri, 11 Feb 2022
 18:51:17 -0800
From: Alistair Popple <apopple@nvidia.com>
To: <akpm@linux-foundation.org>, <linux-mm@kvack.org>, John Hubbard
 <jhubbard@nvidia.com>
Subject: Re: [PATCH v2 2/3] mm/gup.c: Migrate device coherent pages when
 pinning instead of failing
Date: Sat, 12 Feb 2022 13:51:15 +1100
Message-ID: <2315725.OX4gP1S1Nc@nvdebian>
In-Reply-To: <4b6b472d-07b6-0c96-22ed-9a77a878cf61@nvidia.com>
References: <cover.0d3c846b1c6c294e055ff7ebe221fab9964c1436.1644207242.git-series.apopple@nvidia.com>
 <dd9960b327ca49a9103d9f97868ea7b0b81186c4.1644207242.git-series.apopple@nvidia.com>
 <4b6b472d-07b6-0c96-22ed-9a77a878cf61@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Originating-IP: [10.126.230.35]
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e3069f3f-5ee0-4e89-22d3-08d9edd28d55
X-MS-TrafficTypeDiagnostic: DM4PR12MB5246:EE_
X-Microsoft-Antispam-PRVS: <DM4PR12MB5246A7E5C8E16E1F60D22419DF319@DM4PR12MB5246.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VldHcduqzQglZoC5qvPvXb/m+NVSB1zTCwN1a9yjDuTzOP5QWecrgdAVg46JarTfjECaoQgGhsoTn8Lgj69Vp3Vd5MnmWbBznsKq6gTKqw+3p1/IeBzgg/TirXbREzE2GMwWzUuDHS0nqrg29AHagZJ5WbUM85gRiFL2Q0br4D18k2aBMjsZ86WczrfGgiYvjfB5ItK02mlRmYGwypZSWSasMVYDWMOLsj8+FIM3Rtk2BM+iZN5EZUhMyo2r24rjX+kIGYPbefsbsEK5iOM8RtLSySpeJkc7AaiLsdhbC5FZUcNP9Q0v9/5mcWQTYpCsu5iPsahkfyXtuR/pZIYegqVcIsAUNc98R+5iPUjLijt92zWuSqTORX8nyaUjLt4x8QvUBx9BHxUUAPxJvUrA1jenEPBtyt3Ie6XKQggSJieN2iVkDHG7hQC3KN0MI/DysqJsXCpKAVlC9vQ9VtsOM1KsmFQuWi5ukNeKVWCeXNkn4/xQyYWvmCcRB0T+xfWNuK/gRndJyoA9jCC+9jyG3mkO5rSn62gwSyT1nCQnNxt93FQpygxYCFs76xtb48lqxlt7g9xtkAe12HlKyH4dROGqRq4tCJN1+Qb3vL4lUa38l9lzS6qYrpuOYW5Bo1w2LG+PX0dLccDoxO0OE/4BViHwObeqJXjSpWqcgJPApAtQtBhDsOsrUclDrS8domSOGDjwIYETV1K5SPuTevOEZeB+eeInt+X8xUwFsoB7l4HfhTvhilY0BgjJCPlnMRYP
X-Forefront-Antispam-Report: CIP:12.22.5.234; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:mail.nvidia.com; PTR:InfoNoRecords; CAT:NONE;
 SFS:(13230001)(4636009)(46966006)(40470700004)(36840700001)(8676002)(316002)(508600001)(6636002)(70586007)(33716001)(53546011)(82310400004)(40460700003)(5660300002)(4326008)(9686003)(47076005)(86362001)(8936002)(54906003)(70206006)(7416002)(2906002)(36860700001)(83380400001)(336012)(426003)(110136005)(16526019)(186003)(26005)(81166007)(356005)(9576002)(39026012)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2022 02:51:21.8467 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e3069f3f-5ee0-4e89-22d3-08d9edd28d55
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[12.22.5.234];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT016.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5246
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
 Felix.Kuehling@amd.com, dri-devel@lists.freedesktop.org,
 linux-xfs@vger.kernel.org, jglisse@redhat.com, amd-gfx@lists.freedesktop.org,
 jgg@nvidia.com, linux-ext4@vger.kernel.org, hch@lst.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Saturday, 12 February 2022 1:10:29 PM AEDT John Hubbard wrote:
> On 2/6/22 20:26, Alistair Popple wrote:
> > Currently any attempts to pin a device coherent page will fail. This is
> > because device coherent pages need to be managed by a device driver, and
> > pinning them would prevent a driver from migrating them off the device.
> > 
> > However this is no reason to fail pinning of these pages. These are
> > coherent and accessible from the CPU so can be migrated just like
> > pinning ZONE_MOVABLE pages. So instead of failing all attempts to pin
> > them first try migrating them out of ZONE_DEVICE.
> > 
> 
> Hi Alistair and all,
> 
> Here's a possible issue (below) that I really should have spotted the
> first time around, sorry for this late-breaking review. And maybe it's
> actually just my misunderstanding, anyway.

I think it might be a misunderstanding, see below.

> > Signed-off-by: Alistair Popple <apopple@nvidia.com>
> > Acked-by: Felix Kuehling <Felix.Kuehling@amd.com>
> > ---
> > 
> > Changes for v2:
> > 
> >   - Added Felix's Acked-by
> >   - Fixed missing check for dpage == NULL
> > 
> >   mm/gup.c | 105 ++++++++++++++++++++++++++++++++++++++++++++++++++------
> >   1 file changed, 95 insertions(+), 10 deletions(-)
> > 
> > diff --git a/mm/gup.c b/mm/gup.c
> > index 56d9577..5e826db 100644
> > --- a/mm/gup.c
> > +++ b/mm/gup.c
> > @@ -1861,6 +1861,60 @@ struct page *get_dump_page(unsigned long addr)
> >   
> >   #ifdef CONFIG_MIGRATION
> >   /*
> > + * Migrates a device coherent page back to normal memory. Caller should have a
> > + * reference on page which will be copied to the new page if migration is
> > + * successful or dropped on failure.
> > + */
> > +static struct page *migrate_device_page(struct page *page,
> > +					unsigned int gup_flags)
> > +{
> > +	struct page *dpage;
> > +	struct migrate_vma args;
> > +	unsigned long src_pfn, dst_pfn = 0;
> > +
> > +	lock_page(page);
> > +	src_pfn = migrate_pfn(page_to_pfn(page)) | MIGRATE_PFN_MIGRATE;
> > +	args.src = &src_pfn;
> > +	args.dst = &dst_pfn;
> > +	args.cpages = 1;
> > +	args.npages = 1;
> > +	args.vma = NULL;
> > +	migrate_vma_setup(&args);
> > +	if (!(src_pfn & MIGRATE_PFN_MIGRATE))
> > +		return NULL;
> > +
> > +	dpage = alloc_pages(GFP_USER | __GFP_NOWARN, 0);
> > +
> > +	/*
> > +	 * get/pin the new page now so we don't have to retry gup after
> > +	 * migrating. We already have a reference so this should never fail.
> > +	 */
> > +	if (dpage && WARN_ON_ONCE(!try_grab_page(dpage, gup_flags))) {
> > +		__free_pages(dpage, 0);
> > +		dpage = NULL;
> > +	}
> > +
> > +	if (dpage) {
> > +		lock_page(dpage);
> > +		dst_pfn = migrate_pfn(page_to_pfn(dpage));
> > +	}
> > +
> > +	migrate_vma_pages(&args);
> > +	if (src_pfn & MIGRATE_PFN_MIGRATE)
> > +		copy_highpage(dpage, page);
> > +	migrate_vma_finalize(&args);
> > +	if (dpage && !(src_pfn & MIGRATE_PFN_MIGRATE)) {
> > +		if (gup_flags & FOLL_PIN)
> > +			unpin_user_page(dpage);
> > +		else
> > +			put_page(dpage);
> > +		dpage = NULL;
> > +	}
> > +
> > +	return dpage;
> > +}
> > +
> > +/*
> >    * Check whether all pages are pinnable, if so return number of pages.  If some
> >    * pages are not pinnable, migrate them, and unpin all pages. Return zero if
> >    * pages were migrated, or if some pages were not successfully isolated.
> > @@ -1888,15 +1942,40 @@ static long check_and_migrate_movable_pages(unsigned long nr_pages,
> >   			continue;
> >   		prev_head = head;
> >   		/*
> > -		 * If we get a movable page, since we are going to be pinning
> > -		 * these entries, try to move them out if possible.
> > +		 * Device coherent pages are managed by a driver and should not
> > +		 * be pinned indefinitely as it prevents the driver moving the
> > +		 * page. So when trying to pin with FOLL_LONGTERM instead try
> > +		 * migrating page out of device memory.
> >   		 */
> >   		if (is_dev_private_or_coherent_page(head)) {
> > +			/*
> > +			 * device private pages will get faulted in during gup
> > +			 * so it shouldn't be possible to see one here.
> > +			 */
> >   			WARN_ON_ONCE(is_device_private_page(head));
> > -			ret = -EFAULT;
> > -			goto unpin_pages;
> > +			WARN_ON_ONCE(PageCompound(head));
> > +
> > +			/*
> > +			 * migration will fail if the page is pinned, so convert
> > +			 * the pin on the source page to a normal reference.
> > +			 */
> > +			if (gup_flags & FOLL_PIN) {
> > +				get_page(head);
> > +				unpin_user_page(head);
> 
> OK...but now gup_flags can no longer be used as a guide for how to
> release these pages, right? In other words, up until this point,
> FOLL_PIN meant "call unpin_user_page() in order to release". However,
> now this page must be released via put_page().

This is the source page (head). We are unpinning it because we can't migrate a
pinned page, however we still need a reference on it for migrate_vma hence the
get_page followed by unpin. In the non-FOLL_PIN case we already have a
reference from gup.

> See below...
> 
> > +			}
> > +
> > +			pages[i] = migrate_device_page(head, gup_flags);

migrate_device_page() will return a new page that has been correctly pinned
with gup_flags by try_grab_page(). Therefore this page can still be released
with unpin_user_page() or put_page() as appropriate for the given gup_flags.

The reference we had on the source page (head) always gets dropped in
migrate_vma_finalize().

> > +			if (!pages[i]) {
> > +				ret = -EBUSY;
> > +				break;
> > +			}
> > +			continue;
> >   		}
> >   
> > +		/*
> > +		 * If we get a movable page, since we are going to be pinning
> > +		 * these entries, try to move them out if possible.
> > +		 */
> >   		if (!is_pinnable_page(head)) {
> >   			if (PageHuge(head)) {
> >   				if (!isolate_huge_page(head, &movable_page_list))
> > @@ -1924,16 +2003,22 @@ static long check_and_migrate_movable_pages(unsigned long nr_pages,
> >   	 * If list is empty, and no isolation errors, means that all pages are
> >   	 * in the correct zone.
> >   	 */
> > -	if (list_empty(&movable_page_list) && !isolation_error_count)
> > +	if (!ret && list_empty(&movable_page_list) && !isolation_error_count)
> >   		return nr_pages;
> >   
> > -unpin_pages:
> > -	if (gup_flags & FOLL_PIN) {
> > -		unpin_user_pages(pages, nr_pages);
> > -	} else {
> > -		for (i = 0; i < nr_pages; i++)
> > +	for (i = 0; i < nr_pages; i++)
> > +		if (!pages[i])
> > +			continue;
> > +		else if (gup_flags & FOLL_PIN)
> > +			unpin_user_page(pages[i]);
> 
> ...and here, for example, we are still trusting gup_flags to decide how
> to release the pages.

Which unless I've missed something is still the correct thing to do.

> This reminds me: out of the many things to monitor, the FOLL_PIN counts
> in /proc/vmstat are especially helpful, whenever making changes to code
> that deals with this:
> 
> 	nr_foll_pin_acquired
> 	nr_foll_pin_released
> 
> ...and those should normally be equal to each other when "at rest".
> 
> 
> thanks,
> > +		else
> >   			put_page(pages[i]);
> > +
> > +	if (ret && !list_empty(&movable_page_list)) {
> > +		putback_movable_pages(&movable_page_list);
> > +		return ret;
> >   	}
> > +
> >   	if (!list_empty(&movable_page_list)) {
> >   		ret = migrate_pages(&movable_page_list, alloc_migration_target,
> >   				    NULL, (unsigned long)&mtc, MIGRATE_SYNC,
> 
> 




