Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FD6F4B0C81
	for <lists+dri-devel@lfdr.de>; Thu, 10 Feb 2022 12:39:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35EFE10E808;
	Thu, 10 Feb 2022 11:39:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2082.outbound.protection.outlook.com [40.107.243.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A15510E808;
 Thu, 10 Feb 2022 11:39:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c1wem+Cmp5Pd9SLzgfS/Lo2KV+gitgWXEegFSDPwLw3XizOWEI+TS7hkTNlEjZhSODm7dKnpeuUC9zkmGzfOt71VOvS52fPC0UmlUYBVBQxeWZzibpl+TS3dh61uC781roChby75ZA1y37Juz2IePPV5oecO9UJliNvUgF0Htr5HlxIRvgEv4wgpS8DVOi1XCfPVZdHxr5OeNSvY6b0jc7FIYb2mSd1RV2+I8tVI/LXSncSi/PpSqExn077E2doGwbQ3ghpUquXeXCiWga6zd0WNi9p2UbjkGtdyOUApQuYBkFRiB9SjXRnAAGMZmSdlCDoZHSx0dd2XN5wsa3jegw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rrRq/xMsoEokzAdO8WVchrp0z7dpGiQ3Xj25Yw+pj54=;
 b=mXIhkNLAYOHGvQkOslk1iJqL20aWOJhOBhQH4ekCGxIOVXk40EcpaVm4t5jALVaGPi9xmrNE5pyvRiFe/FaCMr+k6w5Rek59cVDOS11fJSluLVrwdzjqjXz/ktaGgCoNiqJRQ38MAF81Hdlm0ndMgeVld1CLqvO2VYC5iLz5gsTnqLaZYethjXNNlYHlJw4SVSVvy0CqwOShenfrV7gOuoqXfMtyEHbl3lctRhWBXA8Rq4hAXIZMj8xtTFIcJKHWytwUnwtuzYoc8ZB417AgIbrHi2dvSZo6/wInK1kllcpweaKQvBJ1FH+l7Mpssq8KBVBfsG3Xak4I3Nt2k179KA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.234) smtp.rcpttodomain=lst.de smtp.mailfrom=nvidia.com; dmarc=pass
 (p=reject sp=reject pct=100) action=none header.from=nvidia.com; dkim=none
 (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rrRq/xMsoEokzAdO8WVchrp0z7dpGiQ3Xj25Yw+pj54=;
 b=ICrJ8CjbuUmFX8DUtM2T61H9wKfPu3hP8e+kcnQAsZTGmBx2JUfrQX/NojvgyrBYz0bZGvVMZBV3JjlIpzicnoVDzIou83CTAqOsUXexh+ZU0Gs0jTvW1S5uYeLatyFvj+ivTh2rgF2w/cL7TzVqb174RP01sPVnzCa0EfrHx/LoblVsaGpWTet/8jnN/ihhDrCAJGSwqgoRxTMetEuFvYFTwbyGooedWYTes7ewpuN3G5F4A3J8yp/Vl0wrvTmwSEVLKsbTxeYogIwFK6HYI76QrLcgaVC2EvwRZRmEGZ+Y+i/2Qa68cdIXVow/oxDgP07jeZwPPuJVurApTSyoTQ==
Received: from BN9PR03CA0357.namprd03.prod.outlook.com (2603:10b6:408:f6::32)
 by DS7PR12MB5886.namprd12.prod.outlook.com (2603:10b6:8:79::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4975.11; Thu, 10 Feb 2022 11:39:25 +0000
Received: from BN8NAM11FT032.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:f6:cafe::b8) by BN9PR03CA0357.outlook.office365.com
 (2603:10b6:408:f6::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.11 via Frontend
 Transport; Thu, 10 Feb 2022 11:39:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.234)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.234; helo=mail.nvidia.com;
Received: from mail.nvidia.com (12.22.5.234) by
 BN8NAM11FT032.mail.protection.outlook.com (10.13.177.88) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4975.11 via Frontend Transport; Thu, 10 Feb 2022 11:39:25 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by DRHQMAIL101.nvidia.com
 (10.27.9.10) with Microsoft SMTP Server (TLS) id 15.0.1497.18;
 Thu, 10 Feb 2022 11:39:24 +0000
Received: from nvdebian.localnet (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.9; Thu, 10 Feb 2022
 03:39:20 -0800
From: Alistair Popple <apopple@nvidia.com>
To: <akpm@linux-foundation.org>, <linux-mm@kvack.org>, David Hildenbrand
 <david@redhat.com>
Subject: Re: [PATCH v2 2/3] mm/gup.c: Migrate device coherent pages when
 pinning instead of failing
Date: Thu, 10 Feb 2022 22:39:18 +1100
Message-ID: <1894939.704c7Wv018@nvdebian>
In-Reply-To: <9117b387-3c73-0236-51d1-9e6baf43b34e@redhat.com>
References: <cover.0d3c846b1c6c294e055ff7ebe221fab9964c1436.1644207242.git-series.apopple@nvidia.com>
 <dd9960b327ca49a9103d9f97868ea7b0b81186c4.1644207242.git-series.apopple@nvidia.com>
 <9117b387-3c73-0236-51d1-9e6baf43b34e@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Originating-IP: [10.126.230.35]
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dfa76de3-00aa-4ec5-495d-08d9ec89fd4a
X-MS-TrafficTypeDiagnostic: DS7PR12MB5886:EE_
X-Microsoft-Antispam-PRVS: <DS7PR12MB5886677F60CE96DFA6D2FB28DF2F9@DS7PR12MB5886.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jpOXKQNCFGRobsLONo+QHet/JVcedciN0Deq8Pe3xEVnFsc4cj7Agn0zJi9fXI5kqMiV07w6rx2ahnjpP4OGHoY1x6ejrTXmhcJIlM2lL3rYWIzQIvKIB+9lV4VxdKZJkAt3YKH7WjG9Ps6zYPOgyx4HGk0SZQaqw7kzbWyETGOTqySNBtrWB7uopTCgZgvAs4XbBmVw0umjgN9PFJkk77gpW5S6QGp1/oUX4x3oyM8bCwhBvx0HODu0qnqpkmCc1pb7j7iBQYDaHiY3EGKVts+KhrEIRYghJNQw9tbkGCb+SpYa+MRbPI1fwKkqN8ZVskr1AlVBWxZVo5CcPAcGuwIVlqSGf64DbgbGVNszGmUaSCzdDcy0K1Zuq1hWeeh6WH/IZKyWGXuWiHS45TGY6XuuMCBPT3bQF6dGhNcqDpsIWFO45RmXWgWj9FXGGMxvzSE2YOwfJGeaEjIPNd7stUbI1q8MwrcL2lP4Z4B7MsJNSvrvvJ/7HKgvKOociFElul9GxYns/hUN8sRVIUc3xpwAWZHU7D90cql/sGZL9QBMtyA6KeK3hSh9Y1es+Cqoez7536ZHD2HMyBoCX2CVrNAq6xlXdAsixTgtrH2o4Jf0uvFXY8i+Tohr6ngwVAnJ1CkIZdO2gWeiLld87JCtsx4bUm12OuUZKO8cVlYZLLsGK7CLdQ9fuEzHCTZFyY+sodip5uX/pG23Xp96lorn7g==
X-Forefront-Antispam-Report: CIP:12.22.5.234; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:mail.nvidia.com; PTR:InfoNoRecords; CAT:NONE;
 SFS:(13230001)(4636009)(36840700001)(46966006)(40470700004)(54906003)(70586007)(40460700003)(86362001)(316002)(81166007)(70206006)(33716001)(356005)(186003)(26005)(336012)(82310400004)(4326008)(426003)(16526019)(36860700001)(8676002)(83380400001)(107886003)(8936002)(5660300002)(53546011)(2906002)(110136005)(9576002)(7416002)(47076005)(508600001)(9686003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2022 11:39:25.2095 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dfa76de3-00aa-4ec5-495d-08d9ec89fd4a
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[12.22.5.234];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT032.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5886
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

On Thursday, 10 February 2022 9:53:38 PM AEDT David Hildenbrand wrote:
> On 07.02.22 05:26, Alistair Popple wrote:
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
> > Acked-by: Felix Kuehling <Felix.Kuehling@amd.com>
> > ---
> > 
> > Changes for v2:
> > 
> >  - Added Felix's Acked-by
> >  - Fixed missing check for dpage == NULL
> > 
> >  mm/gup.c | 105 ++++++++++++++++++++++++++++++++++++++++++++++++++------
> >  1 file changed, 95 insertions(+), 10 deletions(-)
> > 
> > diff --git a/mm/gup.c b/mm/gup.c
> > index 56d9577..5e826db 100644
> > --- a/mm/gup.c
> > +++ b/mm/gup.c
> > @@ -1861,6 +1861,60 @@ struct page *get_dump_page(unsigned long addr)
> >  
> >  #ifdef CONFIG_MIGRATION
> >  /*
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
> >   * Check whether all pages are pinnable, if so return number of pages.  If some
> >   * pages are not pinnable, migrate them, and unpin all pages. Return zero if
> >   * pages were migrated, or if some pages were not successfully isolated.
> > @@ -1888,15 +1942,40 @@ static long check_and_migrate_movable_pages(unsigned long nr_pages,
> >  			continue;
> >  		prev_head = head;
> >  		/*
> > -		 * If we get a movable page, since we are going to be pinning
> > -		 * these entries, try to move them out if possible.
> > +		 * Device coherent pages are managed by a driver and should not
> > +		 * be pinned indefinitely as it prevents the driver moving the
> > +		 * page. So when trying to pin with FOLL_LONGTERM instead try
> > +		 * migrating page out of device memory.
> >  		 */
> >  		if (is_dev_private_or_coherent_page(head)) {
> > +			/*
> > +			 * device private pages will get faulted in during gup
> > +			 * so it shouldn't be possible to see one here.
> > +			 */
> >  			WARN_ON_ONCE(is_device_private_page(head));
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
> 
> For ordinary migrate_pages(), we'll unpin all pages and return 0 so the
> caller will retry pinning by walking the page tables again.
> 
> Why can't we apply the same mechanism here? This "let's avoid another
> walk" looks unnecessary complicated to me, but I might be wrong.

There's no reason we couldn't. I figured we have the page in the right spot
anyway so it was easy to do, and looking at this rebased on top of Christoph's
ZONE_DEVICE refcount simplification I'm not sure it would be any simpler
anyway.

It would remove the call to try_grab_page(), but we'd still have to return an
error on migration failures whilst also ensuring we putback any non-device
pages that may have been isolated. I might have overlooked something though,
so certainly happy for suggestions.



