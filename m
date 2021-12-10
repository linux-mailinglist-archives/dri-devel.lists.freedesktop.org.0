Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 029C346F87B
	for <lists+dri-devel@lfdr.de>; Fri, 10 Dec 2021 02:31:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EB6210E219;
	Fri, 10 Dec 2021 01:31:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2049.outbound.protection.outlook.com [40.107.220.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F92E10E21C;
 Fri, 10 Dec 2021 01:31:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T2mtbLSQnK82s+ztIkH2fFx3o+Phq+Nk+Lunt79pmJliY3Vg+g5ayxmRUTUUE6OQ6yfzSZfxv391lFpAMx4IrEENV44JMfVMbxvt38+Jy2/XuQQUnVacWn1OpSwy9SJDYiYXE4AFhzO7aRDs+xvkVm34onjzAKg0Ig8ZfD43o02nhYGJ75o0AkJM8jGwpv38VheN8x1e0bnCcafs4MUDuFOnIeYIp1dHQ/79xG6xisnOzclx4Qch6FvBaOEWmhZXNo5HsIM2PqVgYlVfeFbx8w+ksw+nfBRhe5QlG/NntNxmI4YmFFTu+i0UnmioJzZ+fjrdhcyZjSxAx4hPxjXjiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kRUERGP/r4mfsM90iVb6uapP2tjnvD0Pv+HZbhR2xJc=;
 b=kD4w3CT3+lxWs+GDRlXcC75VWuZD1kD2pl62gFxY4ozvN62WTiAf/c6MoHiHaz7ce86BhzcYhk5cnQZovE7CbYP+GAha85LR47z8mmSeWu0frBuxQzaF8kKc2afu034SBya3AwGHT7D4vE4zmdo04mgwSPxTIuwBUO1i03Iul0Z0GSEn6JsecxS2DAUgPyedzKvpuIulV4FmbMElVV+BlRg6+1+3sIsUT4D/M1baFI84pO0sdGLqOLtOBx/9EyyDql8Nl8DzghAk4Lfuf0L4doiAxviaI93nYqcgXWziMNzC1NDBhePuWOXgjhGHMeVCrsN5U7fXP85RV5cAaL3DnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 203.18.50.13) smtp.rcpttodomain=infradead.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kRUERGP/r4mfsM90iVb6uapP2tjnvD0Pv+HZbhR2xJc=;
 b=F2xlmMwYLPjCKnV38gXEhTJ5Fegk6YVEBWybi8mu27OMttYUydRQQf+m2vxVW5mIzJSrjgIRNo2R91p4krtYn41A3v/+oz1Je1MaE2vO4C8cJ1f0hMqfDLsgUtVVIo7PDBnSrmRYzCJAp97ttrFt+asqBSYU5aEcqDbvlT80JS3nOiyJCCcsmj8rSAFnhlmfsuLBzevNZuTrv7M103iTB6csRmDn8RS6dbc56x9OVdF+/CJViDplD2kUlSi74yilaUYm0Dyr7W6cfXHFU/hIOcBTHPsHJpv6OFbgeYgHtQDAt73EHXQwtkQiyAdyexGVczLzPDJ74xXn8zSUHdTX7g==
Received: from BN8PR04CA0024.namprd04.prod.outlook.com (2603:10b6:408:70::37)
 by SA0PR12MB4384.namprd12.prod.outlook.com (2603:10b6:806:9f::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.11; Fri, 10 Dec
 2021 01:31:18 +0000
Received: from BN8NAM11FT057.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:70:cafe::24) by BN8PR04CA0024.outlook.office365.com
 (2603:10b6:408:70::37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.20 via Frontend
 Transport; Fri, 10 Dec 2021 01:31:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 203.18.50.13)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 203.18.50.13 as permitted sender) receiver=protection.outlook.com;
 client-ip=203.18.50.13; helo=mail.nvidia.com;
Received: from mail.nvidia.com (203.18.50.13) by
 BN8NAM11FT057.mail.protection.outlook.com (10.13.177.49) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4755.13 via Frontend Transport; Fri, 10 Dec 2021 01:31:17 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by HKMAIL102.nvidia.com
 (10.18.16.11) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Fri, 10 Dec
 2021 01:31:16 +0000
Received: from nvdebian.localnet (172.20.187.5) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.986.9; Thu, 9 Dec 2021
 17:31:12 -0800
From: Alistair Popple <apopple@nvidia.com>
To: Felix Kuehling <felix.kuehling@amd.com>, <akpm@linux-foundation.org>,
 <linux-mm@kvack.org>, <rcampbell@nvidia.com>, <linux-ext4@vger.kernel.org>,
 <linux-xfs@vger.kernel.org>, "Sierra Guiza, Alejandro (Alex)"
 <alex.sierra@amd.com>
Subject: Re: [PATCH v2 03/11] mm/gup: migrate PIN_LONGTERM dev coherent pages
 to system
Date: Fri, 10 Dec 2021 12:31:09 +1100
Message-ID: <2613033.KcdVtnzQgr@nvdebian>
In-Reply-To: <72fe6b48-4aa5-b766-3f33-8c3445fdcc99@amd.com>
References: <20211206185251.20646-1-alex.sierra@amd.com>
 <b9163ccc-829e-9939-8177-a66ab41187e7@amd.com>
 <72fe6b48-4aa5-b766-3f33-8c3445fdcc99@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Originating-IP: [172.20.187.5]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4ccd7cb9-74b2-4a87-f269-08d9bb7cc3b2
X-MS-TrafficTypeDiagnostic: SA0PR12MB4384:EE_
X-Microsoft-Antispam-PRVS: <SA0PR12MB43841272CCA2E91EBC93FC87DF719@SA0PR12MB4384.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HbjuLz1SyuelH0RScmtCQMbGteIPV2+haDWbxjyP/9zXMfKntsxfnUpzqESWtiWh2skgrZyqkM6JeMB12gZWO7rnjizgjJgawLK0zNLiGTr0JaLHMKL9fG8rBYgDpnbqo9VcJKkPF+Ki862PbUXqwMpyIYs9NfdWM2mGOvyHQJj80CVBYFoZWX4h0hpoy34wok2Hy4eOojPAsmFH39F+3nhFYitmDAuh/CwuKhthdc0SY/1csRktLpRHxMy69zxnvQTbVdlOiMgFsneQgfhsqIQLPv+6i3Qc75x3p7eqKI/dRvIGjVaKGa9is7A/S5zx8b3fEWnJm33BrxiyrxFX927fkGc23eFG0EfEm7pvf2jxkBPRq16CssE/3iSi7ObhtMAQql7H8xTB8oST3A3WvzN8My8nb76VVW8vZck8r4RoZBNuNsM6llS3qLhFezvowbm/Vrifkbhu8w5TpjrzUP9673pGaV4wdajphzivndDRwfyI867v7nhHjjT3KX1+wLX5JREyUpi9bmzWELBrXsWK6b7Cm9Yt+v0GUZKVkQFy4lwxgevIn50l+6G67RsNusprlJ7rzvnMb16A1jXoSJQAesWlYwCsr/5QtoolzgNULlAa+hSltJBKKk/MfkNYmeC/Sh9RDCQCAZ0XWG4Zxgl6/gKGqm6u4WbxMzhzy6PXq76HQ0YsFwq7Hch8qSbOurrOa9uH1wYBeHE7PR+ZEMJzG76NtR9/NwrTksN71wcgZGHVbzOsZ//q/S/L7ws0kGrX2ZV0DPoUlIIPm6+ROdIbXYWq6er/+9bi75+blsg=
X-Forefront-Antispam-Report: CIP:203.18.50.13; CTRY:HK; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:hkhybrid02.nvidia.com; CAT:NONE;
 SFS:(4636009)(36840700001)(46966006)(40470700001)(4326008)(53546011)(7416002)(186003)(16526019)(426003)(36860700001)(9686003)(508600001)(70206006)(336012)(26005)(70586007)(33716001)(5660300002)(316002)(83380400001)(6666004)(40460700001)(34020700004)(356005)(7636003)(47076005)(86362001)(110136005)(54906003)(8676002)(82310400004)(8936002)(9576002)(2906002);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2021 01:31:17.8415 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ccd7cb9-74b2-4a87-f269-08d9bb7cc3b2
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[203.18.50.13];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT057.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4384
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

On Friday, 10 December 2021 3:54:31 AM AEDT Sierra Guiza, Alejandro (Alex) wrote:
> 
> On 12/9/2021 10:29 AM, Felix Kuehling wrote:
> > Am 2021-12-09 um 5:53 a.m. schrieb Alistair Popple:
> >> On Thursday, 9 December 2021 5:55:26 AM AEDT Sierra Guiza, Alejandro (Alex) wrote:
> >>> On 12/8/2021 11:30 AM, Felix Kuehling wrote:
> >>>> Am 2021-12-08 um 11:58 a.m. schrieb Felix Kuehling:
> >>>>> Am 2021-12-08 um 6:31 a.m. schrieb Alistair Popple:
> >>>>>> On Tuesday, 7 December 2021 5:52:43 AM AEDT Alex Sierra wrote:
> >>>>>>> Avoid long term pinning for Coherent device type pages. This could
> >>>>>>> interfere with their own device memory manager.
> >>>>>>> If caller tries to get user device coherent pages with PIN_LONGTERM flag
> >>>>>>> set, those pages will be migrated back to system memory.
> >>>>>>>
> >>>>>>> Signed-off-by: Alex Sierra<alex.sierra@amd.com>
> >>>>>>> ---
> >>>>>>>    mm/gup.c | 32 ++++++++++++++++++++++++++++++--
> >>>>>>>    1 file changed, 30 insertions(+), 2 deletions(-)
> >>>>>>>
> >>>>>>> diff --git a/mm/gup.c b/mm/gup.c
> >>>>>>> index 886d6148d3d0..1572eacf07f4 100644
> >>>>>>> --- a/mm/gup.c
> >>>>>>> +++ b/mm/gup.c
> >>>>>>> @@ -1689,17 +1689,37 @@ struct page *get_dump_page(unsigned long addr)
> >>>>>>>    #endif /* CONFIG_ELF_CORE */
> >>>>>>>    
> >>>>>>>    #ifdef CONFIG_MIGRATION
> >>>>>>> +static int migrate_device_page(unsigned long address,
> >>>>>>> +				struct page *page)
> >>>>>>> +{
> >>>>>>> +	struct vm_area_struct *vma = find_vma(current->mm, address);
> >>>>>>> +	struct vm_fault vmf = {
> >>>>>>> +		.vma = vma,
> >>>>>>> +		.address = address & PAGE_MASK,
> >>>>>>> +		.flags = FAULT_FLAG_USER,
> >>>>>>> +		.pgoff = linear_page_index(vma, address),
> >>>>>>> +		.gfp_mask = GFP_KERNEL,
> >>>>>>> +		.page = page,
> >>>>>>> +	};
> >>>>>>> +	if (page->pgmap && page->pgmap->ops->migrate_to_ram)
> >>>>>>> +		return page->pgmap->ops->migrate_to_ram(&vmf);
> >>>>>> How does this synchronise against pgmap being released? As I understand things
> >>>>>> at this point we're not holding a reference on either the page or pgmap, so
> >>>>>> the page and therefore the pgmap may have been freed.
> >>>>>>
> >>>>>> I think a similar problem exists for device private fault handling as well and
> >>>>>> it has been on my list of things to fix for a while. I think the solution is to
> >>>>>> call try_get_page(), except it doesn't work with device pages due to the whole
> >>>>>> refcount thing. That issue is blocking a fair bit of work now so I've started
> >>>>>> looking into it.
> >>>>> At least the page should have been pinned by the __get_user_pages_locked
> >>>>> call in __gup_longterm_locked. That refcount is dropped in
> >>>>> check_and_migrate_movable_pages when it returns 0 or an error.
> >>>> Never mind. We unpin the pages first. Alex, would the migration work if
> >>>> we unpinned them afterwards? Also, the normal CPU page fault code path
> >>>> seems to make sure the page is locked (check in pfn_swap_entry_to_page)
> >>>> before calling migrate_to_ram.
> >> I don't think that's true. The check in pfn_swap_entry_to_page() is only for
> >> migration entries:
> >>
> >> 	BUG_ON(is_migration_entry(entry) && !PageLocked(p));
> >>
> >> As this is coherent memory though why do we have to call into a device driver
> >> to do the migration? Couldn't this all be done in the kernel?
> > I think you're right. I hadn't thought of that mainly because I'm even
> > less familiar with the non-device migration code. Alex, can you give
> > that a try? As long as the driver still gets a page-free callback when
> > the device page is freed, it should work.

Yes, you should still get the page-free callback when the migration code drops
the last page reference.

> ACK.Will do

There is currently not really any support for migrating device pages based on
pfn. What I think is needed is something like migrate_pages(), but that API
won't work for a couple of reasons - main one being that it relies on pages
being LRU pages.

I've been working on a series to implement an equivalent of migrate_pages() for
device-private (and by extension device-coherent) pages. It might also be useful
here so I will try and get it posted as an RFC next week.

 - Alistair

> Alex Sierra
> 
> > Regards,
> >    Felix
> >
> >
> >>> No, you can not unpinned after migration. Due to the expected_count VS
> >>> page_count condition at migrate_page_move_mapping, during migrate_page call.
> >>>
> >>> Regards,
> >>> Alex Sierra
> >>>
> >>>> Regards,
> >>>>     Felix
> >>>>
> >>>>
> >>




