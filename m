Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6E694AB37C
	for <lists+dri-devel@lfdr.de>; Mon,  7 Feb 2022 05:20:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57E4910E664;
	Mon,  7 Feb 2022 04:19:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2042.outbound.protection.outlook.com [40.107.93.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F145110E664;
 Mon,  7 Feb 2022 04:19:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jN2uCGMTsLJmBvGQ+sP8/TWMoZ9YQABqaXGIx01JGC+B4jo89h7iAlu0Bt0KquRjf+SY1m6s4uhkkc4s4zs2WXweyxW4Sf8PFLyYmjFtbyAF4q8dSyWg6CycD4is9V1vv57SVrQvutkekwFkbGdjs2aHZpt5CK/lKpi+sh1uCo0FEnt09RIdkEDr9Pabv2YV+MjNwdOeackLMKvryhUjkXLx7Ejekr58WfyiJLC86q6z3d6CuXzJ/+C6I0LptoxeMR46v2yUiz0Zeo1VQRnicLSxkEQZjF5GWHB0DqPb2QO2P6WMt1Fs1lHAT9l8bXLHY2jBtHdeh/jPvifc6Fy5Jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=58q3SUYYcRBjqn2nhtqFaVfHOSkcmtUauefhKpCTCjg=;
 b=EY7OaVj3j8vwYZK+znGyRZRQoUrbmI2uKCE447nBPaYKJ1MxNz86ywBS/YmI/Q4nUlbvCvlrixnfZtSfeu9DmtuAd/3nFpU7+nHZ3R0HWgBvZrAc1IxYBeJenfH9dDNn4mb6YLiH574IYDozW4nRiv75BTIt4VbVfhsRB9+JJHn0Mk8p8k/r4GFMb5zg7Oa2Zr+TMzYO8YiZ1e1YW/QIeZmMjUmQmoJPp2omsKWjS5UKsMPE787y70oD0WeMIH155cddYOjXItWh1EZws5QuFHyKpMz/ip4xoKIUoCPj5Qxmm7p1N/QyS3tEEZBxJFHSEGO7CaNzc7YVpW+AZEejKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.234) smtp.rcpttodomain=lst.de smtp.mailfrom=nvidia.com; dmarc=pass
 (p=reject sp=reject pct=100) action=none header.from=nvidia.com; dkim=none
 (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=58q3SUYYcRBjqn2nhtqFaVfHOSkcmtUauefhKpCTCjg=;
 b=hzRq/8q6VWO0XWyC9X1qpdowRGTl3yWTBKWFn8sYdXnvykWo55Xkmzw7nc2CIZVtON4buIUNmWMbFnfuAB7c4v/arNn29yGMqxw2MX94Tg4fKQOMjME97MikpXaAU/QosLqqL6cJujfh1TNj5eCqFpyKtC5QMli9l3DJ4J2lSZTlJVzAEbfGkWejH4lnVsUqFElCqcQcu+M6GQz51y9ymY2r9PssbYAc9kVK8O/HXbZ2qr2W/2fE42xqBCBpo767qxlJDo+vZHn9RMB/fSCccPKv/MxSpz17xlF3OgsP14XxMnSbPOxidRNL3FpV+KYNJPoVKk+kA5mYFxUihx4y2g==
Received: from BN9PR03CA0482.namprd03.prod.outlook.com (2603:10b6:408:130::7)
 by BY5PR12MB4818.namprd12.prod.outlook.com (2603:10b6:a03:1b4::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.11; Mon, 7 Feb
 2022 04:19:52 +0000
Received: from BN8NAM11FT059.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:130:cafe::a6) by BN9PR03CA0482.outlook.office365.com
 (2603:10b6:408:130::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12 via Frontend
 Transport; Mon, 7 Feb 2022 04:19:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.234)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.234; helo=mail.nvidia.com;
Received: from mail.nvidia.com (12.22.5.234) by
 BN8NAM11FT059.mail.protection.outlook.com (10.13.177.120) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4951.12 via Frontend Transport; Mon, 7 Feb 2022 04:19:51 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by DRHQMAIL101.nvidia.com
 (10.27.9.10) with Microsoft SMTP Server (TLS) id 15.0.1497.18;
 Mon, 7 Feb 2022 04:19:49 +0000
Received: from nvdebian.localnet (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.9; Sun, 6 Feb 2022
 20:19:46 -0800
From: Alistair Popple <apopple@nvidia.com>
To: <akpm@linux-foundation.org>, <linux-mm@kvack.org>, Felix Kuehling
 <felix.kuehling@amd.com>
Subject: Re: [PATCH 2/3] mm/gup.c: Migrate device coherent pages when pinning
 instead of failing
Date: Mon, 7 Feb 2022 15:19:44 +1100
Message-ID: <2160866.MLLZV48HG3@nvdebian>
In-Reply-To: <49253aca-5c0b-84d4-4b2a-13426b1064ec@amd.com>
References: <cover.516a938ce97eb805791da6e2df508eb0dce413b8.1643698773.git-series.apopple@nvidia.com>
 <d4d399492b2ba09f4c551fa2261fbd22172886d8.1643698773.git-series.apopple@nvidia.com>
 <49253aca-5c0b-84d4-4b2a-13426b1064ec@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Originating-IP: [10.126.230.35]
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 327cb50a-3f6b-488a-3351-08d9e9f115e0
X-MS-TrafficTypeDiagnostic: BY5PR12MB4818:EE_
X-Microsoft-Antispam-PRVS: <BY5PR12MB4818CC6924D77108996A085ADF2C9@BY5PR12MB4818.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ic4VkvzabhKe9rzCZLg1MKIXum1YiAcNnvj3fWFsYlkoRU/w9jBEYqQ0g7vWd2xRdMf2TqLZBroCOYmIEoe1Z2m7HaVkZU28WUjiOVsMrqNMPYqFTtpWCorPUuGm+PSGyu2Xv5Q6kqBtpJV8cwS3yB/5/I+bV+nY4SGzYlQLb/wdIPJ4TPPehVTKlLHNmGwnJNu7g5NDVOD+WNI0lB97UCu32MxRZCrovkcGayNKbj63WsxCdA8Wi7U5kir080AqCgmLEtHyRAt4g03va6NXP0jOELiT73FzRAE9ojfSA5CVO/NYozfFZ/zCEisVnKzkQUjXVofFHJ+phWelhWmxsLkyr3uy1AlimBOML7UMpyqyiekWogJ6xzCBxyMEiTVp9AQp873a2fAvi/4eE45N9bBmHvW5xJnqbp9vklNoEbNAyYwDhSeAGYow8ZUsuAwCVJSYL4PNIlAaQ/SXpyrSn4wHt9I5bVE0H8B+g/ViozN4spMcJORiHdKLywVE2bDHO7+/c5KBfhbqVi8ZtIUXWSNsrRWsHYlsWZ+FCsH8KsQwd62OR5JHXA8CXYQwz8ohoMt9uWxe6KndvYy3gPvUD3NNFof/5Cxal8hjCqBEivndf9j2BYWK2Hly96mwIadO7rIm/bGUJtqOEjkptu6KnE3y0coaRjfOqDAJwPkHRQlPSvJc4Fi6+elHUSYAFFswkqWnMr9tvC70FRN95CqyzQ==
X-Forefront-Antispam-Report: CIP:12.22.5.234; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:mail.nvidia.com; PTR:InfoNoRecords; CAT:NONE;
 SFS:(13230001)(4636009)(46966006)(36840700001)(40470700004)(9686003)(2906002)(33656002)(16526019)(82310400004)(356005)(47076005)(107886003)(83380400001)(81166007)(33716001)(86362001)(336012)(8936002)(40460700003)(7416002)(426003)(508600001)(5660300002)(70586007)(110136005)(54906003)(70206006)(26005)(8676002)(186003)(316002)(4326008)(9576002)(36860700001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2022 04:19:51.1322 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 327cb50a-3f6b-488a-3351-08d9e9f115e0
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[12.22.5.234];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT059.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4818
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
 jhubbard@nvidia.com, dri-devel@lists.freedesktop.org,
 linux-xfs@vger.kernel.org, jglisse@redhat.com, amd-gfx@lists.freedesktop.org,
 jgg@nvidia.com, linux-ext4@vger.kernel.org, hch@lst.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wednesday, 2 February 2022 2:03:01 AM AEDT Felix Kuehling wrote:
> 
> Am 2022-02-01 um 02:05 schrieb Alistair Popple:
> > Currently any attempts to pin a device coherent page will fail. This is
> > because device coherent pages need to be managed by a device driver, and
> > pinning them would prevent a driver from migrating them off the device.
> >
> > However this is no reason to fail pinning of these pages. These are
> > coherent and accessible from the CPU so can be migrated just like
> > pinning ZONE_MOVABLE pages. So instead of failing all attempts to pin
> > them first try migrating them out of ZONE_DEVICE.
> >
> > Signed-off-by: Alistair Popple <apopple@nvidia.com>
> 
> Thank you for working on this. I have two questions inline.
> 
> Other than that, patches 1 and 2 are
> 
> Acked-by: Felix Kuehling <Felix.Kuehling@amd.com>
> 
> 
> > ---
> >   mm/gup.c | 105 ++++++++++++++++++++++++++++++++++++++++++++++++++------
> >   1 file changed, 95 insertions(+), 10 deletions(-)
> >
> > diff --git a/mm/gup.c b/mm/gup.c
> > index f596b93..2cbef54 100644
> > --- a/mm/gup.c
> > +++ b/mm/gup.c
> > @@ -1834,6 +1834,60 @@ struct page *get_dump_page(unsigned long addr)
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
> 
> Don't you need to check dpage for NULL before the try_grab_page call below?

Yes, thanks for pointing that out. Will fix for v2.

> > +
> > +	/*
> > +	 * get/pin the new page now so we don't have to retry gup after
> > +	 * migrating. We already have a reference so this should never fail.
> > +	 */
> > +	if (WARN_ON_ONCE(!try_grab_page(dpage, gup_flags))) {
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
> 
> Can't dpage can be NULL here as well?

No - migrate_vma_pages() will clear src_pfn & MIGRATE_PFN_MIGRATE if no
destination page is provided in dst_pfn.

> Regards,
>    Felix
> 
> 
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
> > @@ -1861,15 +1915,40 @@ static long check_and_migrate_movable_pages(unsigned long nr_pages,
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
> > +			}
> > +
> > +			pages[i] = migrate_device_page(head, gup_flags);
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
> > @@ -1897,16 +1976,22 @@ static long check_and_migrate_movable_pages(unsigned long nr_pages,
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




