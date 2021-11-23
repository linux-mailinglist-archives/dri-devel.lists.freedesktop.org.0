Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E294459C9C
	for <lists+dri-devel@lfdr.de>; Tue, 23 Nov 2021 08:10:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E1516E446;
	Tue, 23 Nov 2021 07:10:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2041.outbound.protection.outlook.com [40.107.244.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 021196E446;
 Tue, 23 Nov 2021 07:10:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QxKE2TzYq0LrgO1pjN1hGDmkJZVJPlSKehKb1QUZ4Vxn3uloCmV5AQ7A/areXWZ05D2QE9ItV87qUt0xZUPe2H2MbnjRAI4TjQkip4liKWWD5PkEuk4cYLZkKVd4oAkuXeO+9Yt7b7GejUIySY82F5zxgTp7OW5DAsqYLGEUeYng+qRPpYLcJ42mDFp54uwG4hRwb+JW75twXT9ZxHmO8L0i7FFvU0v8uQPoyouevm62wz6UWkb4G+SooFHl+BcVFdO6h0pcV7WGhYoxrucOFfrHliyMSHT25WgsjPHl+qiC50N6JT9mVfAPk71xzeScLqRRd1LJ5mt6ZHVZ7ES/7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g1EQ3lS4GUlnaqLKxXppjKUngcju3yxuA/lYgQo1uto=;
 b=URuuME57K65hSvVY67MhzWE7LhElv+06Q/ekThCr/lz23zIiLMLl6F/aIlNOwBmq/OEKmn9EJgk87yyk4PJfywi8LgBmQ11vQXKGUqGNZugIAgaVgWZo0bR3EwYiayE8qYQIbU7sOFEqe5yImJiAjouI8GMyOgDDrVDAsNdDAW8coZOM+ksHEkz+/YPrxuo3ao0p/tL7RZqsR5cC+XyfnRPWBbjf+u7VXrrx91NFmCu25U7lbiu0uuWy3+3INTPdzZjbTneTQIiUoQrzsbefN2RNpS3G2ctOSjdSLy+zerh1puncFAWw+kKnhUiW0Of066gvw7V9iOHQGSnhNM15Ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=quarantine sp=quarantine pct=100)
 action=none header.from=nvidia.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g1EQ3lS4GUlnaqLKxXppjKUngcju3yxuA/lYgQo1uto=;
 b=kHKCpLwatp46YuT2tiQRr7W6VMzZhGOl01zVN857978o2wy03jh74vFIq4KukhZ7JOWvz2okU36dk8p18zcAi82Ldx9WP5+EiwsvC8x/1FuSXC7lIutg5Bt95Wpr+NlsTqHPy0v0MdivxdTyZFFiztDuuGCwUtnfSWLx3A5BvLREjsdTiYOfNHTzgwf4hrjNHpkMuIcLEQQLks8kr+dolTzIrzJn6cgMLqQ4y2LrHSxjl2YUuomVNDPYn6ARfGufc3+nMDytU7JuAOhxTz/LkfmEhmSCYnxfDtfqhSrCTKv6M3SWNolCWotuFCL6v14n+xx8DtyNf5ETK4i7/cbpaw==
Received: from DM6PR04CA0008.namprd04.prod.outlook.com (2603:10b6:5:334::13)
 by MW3PR12MB4491.namprd12.prod.outlook.com (2603:10b6:303:5c::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.22; Tue, 23 Nov
 2021 07:10:15 +0000
Received: from DM6NAM11FT035.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:334:cafe::b8) by DM6PR04CA0008.outlook.office365.com
 (2603:10b6:5:334::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19 via Frontend
 Transport; Tue, 23 Nov 2021 07:10:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 DM6NAM11FT035.mail.protection.outlook.com (10.13.172.100) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4713.20 via Frontend Transport; Tue, 23 Nov 2021 07:10:14 +0000
Received: from nvdebian.localnet (172.20.187.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Tue, 23 Nov
 2021 07:10:07 +0000
From: Alistair Popple <apopple@nvidia.com>
To: <akpm@linux-foundation.org>, <linux-mm@kvack.org>, <rcampbell@nvidia.com>, 
 <linux-ext4@vger.kernel.org>, <linux-xfs@vger.kernel.org>, Alex Sierra
 <alex.sierra@amd.com>, Felix Kuehling <felix.kuehling@amd.com>
Subject: Re: [PATCH v1 1/9] mm: add zone device coherent type memory support
Date: Tue, 23 Nov 2021 18:10:05 +1100
Message-ID: <3642425.Elj8dHrGez@nvdebian>
In-Reply-To: <f45fb007-ccc4-4d09-b609-09faa81d3b81@amd.com>
References: <20211115193026.27568-1-alex.sierra@amd.com>
 <4157439.BacSOyMZPU@nvdebian> <f45fb007-ccc4-4d09-b609-09faa81d3b81@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Originating-IP: [172.20.187.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d7b75513-7706-40d2-2c5a-08d9ae504bfb
X-MS-TrafficTypeDiagnostic: MW3PR12MB4491:
X-Microsoft-Antispam-PRVS: <MW3PR12MB4491EF45ECA03FBD3AF02265DF609@MW3PR12MB4491.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: //JE034FD5qUB66AdQlzsHwOx1xdA5IZaKWwL2ANQQ6vxh/CEcCDSFIAhzOQZ9vRGjBKNjw2yegeC0fNdotyNrnL29jDKfk0GXnBCQhSNfHd6tTwtMGQV/30H4p5JDUKlM05cEdw21BnRafKjWURANy2M7PLz4Jkg4O9FmiugnmwIjpowmYab/SDEwuFOSv0w+ZHvykdhwF7K9AKD4TKWxPT95k+PysWxscI5qTdzUb3Qjh2lOscvLlqfa/4xHVpL69SsXzflchPtEGHN8dF5dWNPZUDI0zloCwrKDUzElsqwVeoIes39OrIYCjuf5d/LEUShBlqSZLg91El4/Ya4wwwZdciIS4PnA9zdxBslhzjoRkM6EVsx5x1lxutYcDvaSKLzidC8/ZfMlK7DtSMjhWL8A+lxaJ6wyTuAX5StZd3ls+c6Ky6zc+bSgs1MDRkU0Ch1bwgPT+6eYUboQ0N64NGWPSzJj4CTRFR3G6qwxIwI2dxG1BH+KqdYYILZxU1nEtpR3y+m4CH97AjCZUD2JomkZSWGbBBZ+8fDnr9IOE6lhYHuxw3P+iAhFc5EQXTBz6bBfuNQy359fNuyiudd2iISAWp4CZLbcJzuh0tbNyWjoU967rX6nTIGAnzykMfucz/IDou/A7G2LYkwoBfZ0r7UJN7hYYMQFOwo3wKSBExrYAPXK4ckw9SPChzD+wvs7GRHW86PLs25+7ddWsZvNR4Im1ApGI5PZpm4CEfNyc=
X-Forefront-Antispam-Report: CIP:216.228.112.34; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid03.nvidia.com; CAT:NONE;
 SFS:(4636009)(46966006)(36840700001)(356005)(8936002)(86362001)(33716001)(508600001)(82310400004)(110136005)(8676002)(2906002)(9576002)(47076005)(5660300002)(336012)(426003)(4326008)(36860700001)(9686003)(26005)(7416002)(16526019)(70586007)(7636003)(83380400001)(70206006)(316002)(54906003)(186003)(39026012);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2021 07:10:14.3885 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d7b75513-7706-40d2-2c5a-08d9ae504bfb
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.34];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT035.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4491
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

On Tuesday, 23 November 2021 4:16:55 AM AEDT Felix Kuehling wrote:

[...]

> > Right, so long as my fix goes in I don't think there is anything wrong with
> > pinning device public pages. Agree that we should avoid FOLL_LONGTERM pins for
> > device memory though. I think the way to do that is update is_pinnable_page()
> > so we treat device pages the same as other unpinnable pages ie. long-term pins
> > will migrate the page.
> 
> I'm trying to understand check_and_migrate_movable_pages in gup.c. It
> doesn't look like the right way to migrate device pages. We may have to
> do something different there as well. So instead of changing
> is_pinnable_page, it maybe better to explicitly check for is_device_page
> or is_device_coherent_page in check_and_migrate_movable_pages to migrate
> it correctly, or just fail outright.

Yes, I think you're right. I was thinking check_and_migrate_movable_pages()
would work for coherent device pages. Now I see it won't because it assumes
they are lru pages and it tries to isolate them which will never succeed
because device pages aren't on a lru.

I think migrating them is the right thing to do for FOLL_LONGTERM though.

 - Alistair

> Thanks,
>   Felix
> 
> >
> >>> In the case of device-private pages this is enforced by the fact they never
> >>> have present pte's, so any attempt to GUP them results in a fault. But if I'm
> >>> understanding this series correctly that won't be the case for coherent device
> >>> pages right?
> >> Right.
> >>
> >> Regards,
> >>   Felix
> >>
> >>
> >>>> -		return is_device_private_page(page);
> >>>> +		return is_device_page(page);
> >>>>  	}
> >>>>  
> >>>>  	/* For file back page */
> >>>> @@ -2791,7 +2791,7 @@ EXPORT_SYMBOL(migrate_vma_setup);
> >>>>   *     handle_pte_fault()
> >>>>   *       do_anonymous_page()
> >>>>   * to map in an anonymous zero page but the struct page will be a ZONE_DEVICE
> >>>> - * private page.
> >>>> + * private or coherent page.
> >>>>   */
> >>>>  static void migrate_vma_insert_page(struct migrate_vma *migrate,
> >>>>  				    unsigned long addr,
> >>>> @@ -2867,10 +2867,15 @@ static void migrate_vma_insert_page(struct migrate_vma *migrate,
> >>>>  				swp_entry = make_readable_device_private_entry(
> >>>>  							page_to_pfn(page));
> >>>>  			entry = swp_entry_to_pte(swp_entry);
> >>>> +		} else if (is_device_page(page)) {
> >>> How about adding an explicit `is_device_coherent_page()` helper? It would make
> >>> the test more explicit that this is expected to handle just coherent pages and
> >>> I bet there will be future changes that need to differentiate between private
> >>> and coherent pages anyway.
> >>>
> >>>> +			entry = pte_mkold(mk_pte(page,
> >>>> +						 READ_ONCE(vma->vm_page_prot)));
> >>>> +			if (vma->vm_flags & VM_WRITE)
> >>>> +				entry = pte_mkwrite(pte_mkdirty(entry));
> >>>>  		} else {
> >>>>  			/*
> >>>> -			 * For now we only support migrating to un-addressable
> >>>> -			 * device memory.
> >>>> +			 * We support migrating to private and coherent types
> >>>> +			 * for device zone memory.
> >>>>  			 */
> >>>>  			pr_warn_once("Unsupported ZONE_DEVICE page type.\n");
> >>>>  			goto abort;
> >>>> @@ -2976,10 +2981,10 @@ void migrate_vma_pages(struct migrate_vma *migrate)
> >>>>  		mapping = page_mapping(page);
> >>>>  
> >>>>  		if (is_zone_device_page(newpage)) {
> >>>> -			if (is_device_private_page(newpage)) {
> >>>> +			if (is_device_page(newpage)) {
> >>>>  				/*
> >>>> -				 * For now only support private anonymous when
> >>>> -				 * migrating to un-addressable device memory.
> >>>> +				 * For now only support private and coherent
> >>>> +				 * anonymous when migrating to device memory.
> >>>>  				 */
> >>>>  				if (mapping) {
> >>>>  					migrate->src[i] &= ~MIGRATE_PFN_MIGRATE;
> >>>>
> >
> >
> 




