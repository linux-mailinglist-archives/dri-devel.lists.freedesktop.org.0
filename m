Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 771EB46EE84
	for <lists+dri-devel@lfdr.de>; Thu,  9 Dec 2021 17:57:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3F1510E3D8;
	Thu,  9 Dec 2021 16:53:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2084.outbound.protection.outlook.com [40.107.243.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFB9C10E119;
 Thu,  9 Dec 2021 10:53:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NJIk6BJ0Pz8UO5lPwvuID/PmNIisSBpR9iLooc4XbLGfPEpC4yz6H9otMi5IH4tQgbbLzGGLzCJQp4kGr00+FvwKIw/6XHfJbpQMPi9MAtpiOprvoCGV3lEpfYVpUe3gQPrWLnqqxAs2gZDxH6Mt5BjdHJddR5NKkWZSKXWPC331QSPrvQYPZD7hkWmi6Xi/cM4ObFDA7WUbKy8dlTMoKGdBxlC8owGKJuXGmQpq1HZAskPvMYn9XyxgcsNaQbkPEKV5Xi4yt7yORNA06tF95rsTGiT1bSOu8koS4Rpfvh7ZOI7rX6Jb7ZycFQOImzPnY8Get0R6M/orz55UpHAF5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OxkNY6q++y/FT9Sq+BwUn4Q3sk8rLT1vE6MTEsaT3NA=;
 b=aNfuTtj3FaM/MupmpciL1Sw6P0alRT9SlaQHvWjiLDbnPXmlKL5zcL7mpJ1o0kq/jdxzr3IlHnZBF0w0l2f7dAt63obdpZHdt6QNijKqIvkcPGr+fmPQiv4YAsPGN1VivdEmDonHBQ5tghZWpOm9MjaQ6Vt5sBEYjYvfu+a3h8RnxmpIGIpovcJifuYflW8irSIxzdrcobeDeLtIT7qVlRXQMdhY1U4q5iqJFTnHXyDtCbDWuveNKllO7NJ5sJiuWvtGmKsevEw/zeGwrsdufM1hItTVkbPYRG0OvItTcz92uaI/BHPpo2l3nPfyHkEsUZSXCwOUedi2VT3jhRP/yA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 203.18.50.13) smtp.rcpttodomain=infradead.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OxkNY6q++y/FT9Sq+BwUn4Q3sk8rLT1vE6MTEsaT3NA=;
 b=G7sZF/AvwcFSyL+5RasI2whs4YB6lpNEGKWH8E5izeda/ydQATe1uzRGyASLtI613ppqPtSNt0TX0RaJoNVjoeu/ZwljtRz3GpVuyhTw7S7oXvw1GBXM8CWzGxpSAXz4rU5KKl4iwNGEtPsP1TzeJTTVEetZKD9I9VNjUi26HzDw8CIt5O2RYJic69F8pUeQcNXkZfHNHdTBcu6npU4B9Gx5jFCoKchUDbSp/SU95xE/Nj1vJGrMe0LTKi+eROhwKMVVdPive5t7og/qfj8xKIvjPDXMbb89pRM0nNzK2W/qrmUw7MFXL7P5RW+fkA16wjJwFHBbM9r2kAWXWg5LIQ==
Received: from CO2PR06CA0071.namprd06.prod.outlook.com (2603:10b6:104:3::29)
 by DM5PR12MB1228.namprd12.prod.outlook.com (2603:10b6:3:74::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.16; Thu, 9 Dec
 2021 10:53:21 +0000
Received: from CO1NAM11FT063.eop-nam11.prod.protection.outlook.com
 (2603:10b6:104:3:cafe::1a) by CO2PR06CA0071.outlook.office365.com
 (2603:10b6:104:3::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.12 via Frontend
 Transport; Thu, 9 Dec 2021 10:53:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 203.18.50.13)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 203.18.50.13 as permitted sender) receiver=protection.outlook.com;
 client-ip=203.18.50.13; helo=mail.nvidia.com;
Received: from mail.nvidia.com (203.18.50.13) by
 CO1NAM11FT063.mail.protection.outlook.com (10.13.175.37) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4755.13 via Frontend Transport; Thu, 9 Dec 2021 10:53:20 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by HKMAIL102.nvidia.com
 (10.18.16.11) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Thu, 9 Dec
 2021 10:53:20 +0000
Received: from nvdebian.localnet (172.20.187.6) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.986.9; Thu, 9 Dec 2021
 02:53:15 -0800
From: Alistair Popple <apopple@nvidia.com>
To: Felix Kuehling <felix.kuehling@amd.com>, <akpm@linux-foundation.org>,
 <linux-mm@kvack.org>, <rcampbell@nvidia.com>, <linux-ext4@vger.kernel.org>,
 <linux-xfs@vger.kernel.org>, "Sierra Guiza, Alejandro (Alex)"
 <alex.sierra@amd.com>
Subject: Re: [PATCH v2 03/11] mm/gup: migrate PIN_LONGTERM dev coherent pages
 to system
Date: Thu, 9 Dec 2021 21:53:12 +1100
Message-ID: <2497746.4npHOaMrmn@nvdebian>
In-Reply-To: <3f8a48d6-7ee7-fb30-5942-29054c34aac5@amd.com>
References: <20211206185251.20646-1-alex.sierra@amd.com>
 <2b996383-ebe6-e9d8-d794-58ecfd4a16e8@amd.com>
 <3f8a48d6-7ee7-fb30-5942-29054c34aac5@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Originating-IP: [172.20.187.6]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 67640458-1c38-42ff-80f8-08d9bb021da8
X-MS-TrafficTypeDiagnostic: DM5PR12MB1228:EE_
X-Microsoft-Antispam-PRVS: <DM5PR12MB1228B442E6B148341F5CE1C9DF709@DM5PR12MB1228.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CS7Ti9uliB2LOKuv4TVrRzPIi6xamrevZU0k7KufNpKtXED7Ip6cX36RpxqFHAKGxXOEGoS5I5y1FygeY723zg7m4tpNPh6RAFF1LLuKobY35L0U0IjKPrdA3BllcCEJh8w0Me26P4B2D1idPoKbeGnsZutMcWdWSV5ZFZuBGsJU9ntjZkzKDQBMBxtQxfRzapBva7c0izYs8Pdr6nOjVZeRinqlpSd5X1aDkAl2cvz/DPgAgKHPcIWlpFa52VvFVwzDHXsmCrvAG2rjH6aW85AbEamJ25h16fDwQdC3SvYnBmBclzjH11myzwvB6XN48lMtwlenflcIMjXFiOS00pcIL2LMPIDMPqCduJpzLVTHzYuzXTnUhlmSQbmdUQJeZ5UjOaIiMihR9PdfSpMEArTSlEDDCi4B3GLS5BKPRbEJ6rSr3o6bab9cInevibSwgg7BTHW2526D/A8IG1z553hPOQrgS3vdTix/ostlPMwtbR1D4268eiWbkZX5ziBrNs1RCO0Csgipf9awjoC03d0O1MmzxBU4WU66D64S7ERn3WT1dNbibRXtnsoNJEkPmXic06Wi59K9kGayxh60/uj96ZFGBVEjI+y8qTiUXQGgtjYsEV6q2LJao9gCyq+kXZ9WIOCdhjQz00TGfhZOMG/3GoJD4iM/2qK/yqiztMbxu6HZd6+6rEHTxWHbbfbtr1CZxvVx1p/Qs6BEmPpNl1+kyNs0m5Z1H5kaygW33IfKMUvT17bheQcWBxbhi8gi79IcWefDVNC+kp3Fhv+EEUHS3kezMdTxx1qCvclT43S3X18N6iL4XLsOiLJkbp0waNYgtEIxAHOu5LwOKG6sow==
X-Forefront-Antispam-Report: CIP:203.18.50.13; CTRY:HK; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:hkhybrid02.nvidia.com; CAT:NONE;
 SFS:(4636009)(46966006)(36840700001)(40470700001)(7416002)(356005)(110136005)(54906003)(6666004)(86362001)(47076005)(336012)(5660300002)(7636003)(9576002)(426003)(26005)(8676002)(2906002)(53546011)(33716001)(36860700001)(8936002)(186003)(16526019)(34070700002)(70206006)(508600001)(9686003)(316002)(70586007)(82310400004)(40460700001)(83380400001)(4326008)(39026012);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2021 10:53:20.8109 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 67640458-1c38-42ff-80f8-08d9bb021da8
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[203.18.50.13];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT063.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1228
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
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 jglisse@redhat.com, willy@infradead.org, jgg@nvidia.com, hch@lst.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thursday, 9 December 2021 5:55:26 AM AEDT Sierra Guiza, Alejandro (Alex) wrote:
> 
> On 12/8/2021 11:30 AM, Felix Kuehling wrote:
> > Am 2021-12-08 um 11:58 a.m. schrieb Felix Kuehling:
> >> Am 2021-12-08 um 6:31 a.m. schrieb Alistair Popple:
> >>> On Tuesday, 7 December 2021 5:52:43 AM AEDT Alex Sierra wrote:
> >>>> Avoid long term pinning for Coherent device type pages. This could
> >>>> interfere with their own device memory manager.
> >>>> If caller tries to get user device coherent pages with PIN_LONGTERM flag
> >>>> set, those pages will be migrated back to system memory.
> >>>>
> >>>> Signed-off-by: Alex Sierra <alex.sierra@amd.com>
> >>>> ---
> >>>>   mm/gup.c | 32 ++++++++++++++++++++++++++++++--
> >>>>   1 file changed, 30 insertions(+), 2 deletions(-)
> >>>>
> >>>> diff --git a/mm/gup.c b/mm/gup.c
> >>>> index 886d6148d3d0..1572eacf07f4 100644
> >>>> --- a/mm/gup.c
> >>>> +++ b/mm/gup.c
> >>>> @@ -1689,17 +1689,37 @@ struct page *get_dump_page(unsigned long addr)
> >>>>   #endif /* CONFIG_ELF_CORE */
> >>>>   
> >>>>   #ifdef CONFIG_MIGRATION
> >>>> +static int migrate_device_page(unsigned long address,
> >>>> +				struct page *page)
> >>>> +{
> >>>> +	struct vm_area_struct *vma = find_vma(current->mm, address);
> >>>> +	struct vm_fault vmf = {
> >>>> +		.vma = vma,
> >>>> +		.address = address & PAGE_MASK,
> >>>> +		.flags = FAULT_FLAG_USER,
> >>>> +		.pgoff = linear_page_index(vma, address),
> >>>> +		.gfp_mask = GFP_KERNEL,
> >>>> +		.page = page,
> >>>> +	};
> >>>> +	if (page->pgmap && page->pgmap->ops->migrate_to_ram)
> >>>> +		return page->pgmap->ops->migrate_to_ram(&vmf);
> >>> How does this synchronise against pgmap being released? As I understand things
> >>> at this point we're not holding a reference on either the page or pgmap, so
> >>> the page and therefore the pgmap may have been freed.
> >>>
> >>> I think a similar problem exists for device private fault handling as well and
> >>> it has been on my list of things to fix for a while. I think the solution is to
> >>> call try_get_page(), except it doesn't work with device pages due to the whole
> >>> refcount thing. That issue is blocking a fair bit of work now so I've started
> >>> looking into it.
> >> At least the page should have been pinned by the __get_user_pages_locked
> >> call in __gup_longterm_locked. That refcount is dropped in
> >> check_and_migrate_movable_pages when it returns 0 or an error.
> > Never mind. We unpin the pages first. Alex, would the migration work if
> > we unpinned them afterwards? Also, the normal CPU page fault code path
> > seems to make sure the page is locked (check in pfn_swap_entry_to_page)
> > before calling migrate_to_ram.

I don't think that's true. The check in pfn_swap_entry_to_page() is only for
migration entries:

	BUG_ON(is_migration_entry(entry) && !PageLocked(p));

As this is coherent memory though why do we have to call into a device driver
to do the migration? Couldn't this all be done in the kernel?

> No, you can not unpinned after migration. Due to the expected_count VS 
> page_count condition at migrate_page_move_mapping, during migrate_page call.
> 
> Regards,
> Alex Sierra
> 
> > Regards,
> >    Felix
> >
> >
> 




