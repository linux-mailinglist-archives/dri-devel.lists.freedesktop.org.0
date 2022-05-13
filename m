Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54E9E52614D
	for <lists+dri-devel@lfdr.de>; Fri, 13 May 2022 13:46:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14B9410EC55;
	Fri, 13 May 2022 11:45:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2086.outbound.protection.outlook.com [40.107.223.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E707510EC55;
 Fri, 13 May 2022 11:45:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bLidYgyxsIzKqUgY+H+4+csp7XX6koYjysNfD09BCa2nuLlo6Z/lmTtbJ1bYBaW9Xl3ofzhywlTsmp8S4ijJQEmLCQd3s5GGIzxtEbeI+gn2yr3GlYeyWu5jJgUGGYOTaL6ajEc8kctlUWTTTJpa1Qm0gRVJn4OfsURth09+LO0Vmz6fuy+/Jt59jovRX4PnV1265rck54rLTU4UXxmb7fK0fr3KW6QM6XD8EmDNpL5ChtKqMgS++cUaSI8Q0vL4oYTi1dNrSSDPd9wpa6vgAy+Wrw97WsCsWkbcH0vsouMl2BlAwXQiXDBj12Q73z2WFpmIeO86fPzT/wpMocYu5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bI+3WFMPK3LpQmTop6JjHQVn1W3YT0UXvU3VTUNNEP0=;
 b=erD6qXyqQVSt01OpGoPGDmpIj5OFUwdaHDVXstrMH6xQgZHL7eZecQaRz29nuSgk65qLoK6SJ0Pp6ZnlHxkcGoUCn+ty/DLKFax5vlJFi+f+zCEHu/tQukDX91I/9vT+UprNTPeBwadlrhUrtNIbYuZE0VWBTSMd0+ZBDt+UEY2J7ZURniDTPxmiFskypWQ1XOfJRdmTZ7tOt5q0WsJuKReuZOXg0eacCO9UWNkGbbJXjU4z1fn0XymGTdCwdH7JNnEGHtA7iNOd5gKWCdCkTcBNijU7AJEFGvojd60vFPSeadZNqtntTx28toqNSmjhm1R2AbAZSNQ9nqQfW1roJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bI+3WFMPK3LpQmTop6JjHQVn1W3YT0UXvU3VTUNNEP0=;
 b=iXp9NX6QKpDxKHdeHUD7S+PhetnLAikdlJku+6U9Tv3mV7mRyNiAqmcgPMwNcAWrnzq12StIyLIk+I7DPYqxoRliI67fliebmAyoYxOuop6GjRu5ofw6/LExE+edb7wCuiJv/oUeVod8XRyMQw1rs/5t2h32qJA+KDT80wwv+lBhJ/PkTcRb/K82ajZX/gkczI1WKuuDUYWgxbLjmNs598iZIaUk3KpMA+YvAhlD3oWPafNoQVv/d2c7QkebvogJW7j1scqgOOONqBpwIe78AVbtqdQ4F9cE1Z1BKpSq+gfPTxC1/G0YjXhLNwsGhCodCRoOMO+craxz+p3AZvBbOg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB4192.namprd12.prod.outlook.com (2603:10b6:208:1d5::15)
 by MWHPR12MB1199.namprd12.prod.outlook.com (2603:10b6:300:10::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.23; Fri, 13 May
 2022 11:45:54 +0000
Received: from MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::ec2d:9167:1b47:2db2]) by MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::ec2d:9167:1b47:2db2%5]) with mapi id 15.20.5250.013; Fri, 13 May 2022
 11:45:54 +0000
Date: Fri, 13 May 2022 08:45:53 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: "Sierra Guiza, Alejandro (Alex)" <alex.sierra@amd.com>
Subject: Re: [PATCH v1 13/15] mm: handling Non-LRU pages returned by
 vm_normal_pages
Message-ID: <20220513114553.GK1343366@nvidia.com>
References: <20220505213438.25064-1-alex.sierra@amd.com>
 <20220505213438.25064-14-alex.sierra@amd.com>
 <20220511185012.GM49344@nvidia.com>
 <833a5eb1-f64c-0b1e-a318-051bde629ab2@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <833a5eb1-f64c-0b1e-a318-051bde629ab2@amd.com>
X-ClientProxiedBy: MN2PR10CA0008.namprd10.prod.outlook.com
 (2603:10b6:208:120::21) To MN2PR12MB4192.namprd12.prod.outlook.com
 (2603:10b6:208:1d5::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 10283047-c990-41cb-9cd1-08da34d62323
X-MS-TrafficTypeDiagnostic: MWHPR12MB1199:EE_
X-Microsoft-Antispam-PRVS: <MWHPR12MB11995C8A985BBC17C940B337C2CA9@MWHPR12MB1199.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oilYfJUFZ4/g3muhpAPopOwcMwr6YRzf9dEtQJT3HQvj1z5gI12duKHHfm/oq8JNWUvHurUTpnmgQ3sXWG5CVa/x0h68CycReFQOQW8099ilczY5QQHUqgK+PLP81EJECwAI2/mKJkKJpLhQ4BG5RpOa2z+ZeaZ32WxNqBV+Up4yGNoHqOZlR5kB0OnMCHqRwmk+UQrYwftHK4B/9I24mbBZOaL2irIDZuPaG4XQhOtBbm4zLFhiU/XSlqeUCWQRErb57f5qHUMl3ydlngo2ijEzIVe6ply1EHDgushzndmvKs2lQbo6JKO9mjpijYheZz0k+6laOtaHPsLQwymmprESo8Gs1DU/DwUvTruQGE1QXrK2RB6M1SoV7Ld8BEU3MxE9DMajADoM/rIPpluE5CvHq9M4SsKD1VVHHLQNJp4oJArFCmJXOjwC1vnQ1nnisp2sWMWunZhh7gpnSiIopvuXvVC0vMwrn2w8hpbPD129scnHioJl6JYEdb08Z68AHqtWXu2IrUfkRNvW7KC/uoWfAWVmu24iuhTk2WT1ZO/gzDVd284bIW5fzQ4XokQ7Mw36ynvN6vgmSdFdOltQfwYSXu93H/Ra700W6yK+LfhBjzTnvgOKWz+wShC/AmY/5xRj/A05fE2Z2/R05SSWHA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6486002)(5660300002)(66946007)(7416002)(8936002)(86362001)(38100700002)(186003)(2906002)(6916009)(8676002)(66556008)(66476007)(2616005)(1076003)(4326008)(508600001)(53546011)(6506007)(26005)(6512007)(316002)(33656002)(36756003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dVBBOCtocmRmUnEybi9IWDcrdnFrU0NvWG9VZU55YytMUTlnRUNOcEl4Q3pX?=
 =?utf-8?B?Y0NVUHFmTXJZRExGaFNoZ2w2QlExaXBJTUlDNCtCZmRENklHZit4S1pkanRI?=
 =?utf-8?B?dUdweVBPc056Z3lUWDNEWXB2L3hkOWVPbllYM3hXK2RWWUxSN2FrUDkrZzVT?=
 =?utf-8?B?bkF3K1NaNWsvcytONTArSkliYTc1TktKN0FkQStmSUh3aVg0bU00S1NUQmdu?=
 =?utf-8?B?enlyeDgxME5jUFhBalNyNHFDUmdwUlYvNHIyWFBFaHZQZUlWdjc0SVpEQ2U1?=
 =?utf-8?B?bVVGdDQvelliNXZ0bk1SWkh2b3V2RjU2bkthd1FJSkhEL3NteDNDbThCS0hI?=
 =?utf-8?B?eXR0UXd5U3NOSEVmcyttckpmZ3EwQkw5SjBoVDVHSzI4QnVJSkYyRmhhREda?=
 =?utf-8?B?RWlXV1NGbkMyWWVNTWY2dkFaeVJJbUN1UElwN201V3dhaFZRenBRR3E4SERO?=
 =?utf-8?B?SjY3T0pXVnRZQU1CM2pKL0RWTDkwRlRIOE8wZ3NmVEFya3o0dzBUY2F2NGxx?=
 =?utf-8?B?eFhzVkFDdkwzZTZBZnloVmk1UmFPOGVmTzU3dytIUFFnVjFFR1pSdlRuVFBG?=
 =?utf-8?B?MEVXVXZxYVFIajA1bk4xK3hXK21VMWV6M2hTWWhMVThpbDZCNVFBNkI5a2FY?=
 =?utf-8?B?akNUYkF0YUZXVm9JelVoQlkwbzgzTThYbkpycEo3WG9xbmNhLzZUak83dExQ?=
 =?utf-8?B?NVNyL0pJUUQ0RS9wR3RhY1FxbkF6Q2hteTBZZ2lPRlpyMWJCZk5weVVzdm9o?=
 =?utf-8?B?UmVTdE5EQzRhMk1rOEVNamVVcyt4UzE4ZDljQjZxRGVOUmN1ZDQwUVhWUWRX?=
 =?utf-8?B?dzlLQXdNOWk2VTVTeDNKaGhEVVp0N2l4STVaMTQzRFBsc1FmL1Vna3VtaE4y?=
 =?utf-8?B?dDcrSUk2T3c4QmRScHpvQ004ZlB5RlFRTVhQbE5RYTd5MmIxSUtodWl5ZVJ5?=
 =?utf-8?B?MTJvbXZMTTBOdDRucWp0YVBXOEk5bGV4OUwzQkkyaG1VbXpYRFBHelBUeWY3?=
 =?utf-8?B?SEdVYktvczRuTUxKUEg0U1NScXZrU1YvU1NDaVYzSUhlRUsycjJ0clhGNXBn?=
 =?utf-8?B?NVJ4dUFKUjhTYThLM1BiTUtqbURySWt6R2lHaW1udndPbG1LbWl3dnRuc2dN?=
 =?utf-8?B?VU5DdkcxWTR5QUY5bWUrakhjUkxaRWZZYTVwYmNPVUIyZVovY1ZZQ2trZ1hU?=
 =?utf-8?B?M3VQSi9UMmdLV0VUN1ZrU2JKT0ZuK0dROEhoOGtaVEVScTVjbTdzS2JtT2ds?=
 =?utf-8?B?Ty9yRldCYlg5R2tvVTM4bmpXV2RqTXBBNWVtK3lPd0g3c0d1ckdMclE5Zmdt?=
 =?utf-8?B?bTVuVVJCZ2N4b3NhcFBPbE5kazNoMThBY3JJcTllVVkxNzNDZHNQSFBYWEZq?=
 =?utf-8?B?bmhidXBwRzNXN2RkZlhJUkV5R2ZBWnM0UTJadThka3A0REFrRkRZd25NelRO?=
 =?utf-8?B?akthc3hLQTdid3QyZEZVblRyU2R2S1Zid2RpWnArSi9LQW1CaktPNmJyeFFJ?=
 =?utf-8?B?ZVAxZ29HT1QwQWt3b1AyVHdUTHZFUndmU1lCbU1ZMmlBQ0dlUnYydS83K3g2?=
 =?utf-8?B?YnhVYjJwTElldmVaa2JPcE9MbUNXQnpJM1FQOUkrRUpqaW1ZdXZPNU5Qdzlj?=
 =?utf-8?B?UzdYUG03dEMwOVpacWhJWHNUdjRJQVlTK1E3N0pyeDVXYnhGdDVocWsxQkRp?=
 =?utf-8?B?cmtoYVVwSGtqRGRhU2YzcCtBb1VRYmNvZEE1eTRubUgrUjFwc2VEcTBVQTZ6?=
 =?utf-8?B?bkdka3pubkppRFZYVkZ2TnBacjFxS1hrRktQYlUzb09kYitWMmNpRlRqampQ?=
 =?utf-8?B?THhjcDNBVFNxdGEyVHBHMFgrMlZQd1lRWVEzdUp3VDFuMElIQTBrRi85Lyta?=
 =?utf-8?B?VlZ3YWt0Q0FEbUdTMDdqcWkwR1JuMDJpY1J3V0RFS1IxU3U4eUtQVi9VUWhO?=
 =?utf-8?B?bWk0SU1MZ3NqNWJnc2xsdnplTGVSNlEzWDlZWXpaU1ltZjNzRjFaZm1uQldo?=
 =?utf-8?B?djFIeFJQUlVWOGVrMys4OVZWaGZIVndPZ1Z3cVRPdldRbFN3dXFFbDIyTWhW?=
 =?utf-8?B?cWY2Z3UvK0o3U1FxTGoxQ3orWVRpbUlZVy84RTlpVXJBKzF4UHdUVzlITTBB?=
 =?utf-8?B?ZlUrZHFtYm1SN2VNeGc2VkdpOE1ENWI5UXI1dUxrVThhQWl6ZG4yNms2QWZ2?=
 =?utf-8?B?WWhCcXpTL1lWa3N1YmwranRmZlZmMkw1TU5HQ0RUUWkrZlZwdGhvS1A0eUVO?=
 =?utf-8?B?MWVxUVk1SFAvdVBuNk91RVFIemNsMFZKdG9xakxMYzMwR2NwQlBuYVNEZ21l?=
 =?utf-8?B?Y0diZE8yR2JKeU9zYkFybjZpYkhWRTJqdjA1QU5KSHlTUHZiNkZUUT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 10283047-c990-41cb-9cd1-08da34d62323
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2022 11:45:54.6652 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HwjAmmtlji6T6/BjIMfec89uqxJYwq0Omp5WObc1/Wo+KgaYhQkhEiVlyzn5FEW0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1199
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
Cc: rcampbell@nvidia.com, willy@infradead.org, david@redhat.com,
 Felix.Kuehling@amd.com, apopple@nvidia.com, amd-gfx@lists.freedesktop.org,
 linux-xfs@vger.kernel.org, linux-mm@kvack.org, jglisse@redhat.com,
 dri-devel@lists.freedesktop.org, akpm@linux-foundation.org,
 linux-ext4@vger.kernel.org, hch@lst.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, May 12, 2022 at 05:33:44PM -0500, Sierra Guiza, Alejandro (Alex) wrote:
> 
> On 5/11/2022 1:50 PM, Jason Gunthorpe wrote:
> > On Thu, May 05, 2022 at 04:34:36PM -0500, Alex Sierra wrote:
> > 
> > > diff --git a/mm/memory.c b/mm/memory.c
> > > index 76e3af9639d9..892c4cc54dc2 100644
> > > +++ b/mm/memory.c
> > > @@ -621,6 +621,13 @@ struct page *vm_normal_page(struct vm_area_struct *vma, unsigned long addr,
> > >   		if (is_zero_pfn(pfn))
> > >   			return NULL;
> > >   		if (pte_devmap(pte))
> > > +/*
> > > + * NOTE: Technically this should goto check_pfn label. However, page->_mapcount
> > > + * is never incremented for device pages that are mmap through DAX mechanism
> > > + * using pmem driver mounted into ext4 filesystem. When these pages are unmap,
> > > + * zap_pte_range is called and vm_normal_page return a valid page with
> > > + * page_mapcount() = 0, before page_remove_rmap is called.
> > > + */
> > >   			return NULL;
> > ? Where does this series cause device coherent to be returned?
> In our case, device coherent pages could be obtained as a result of
> migration(Patches 6/7 of 15), ending up mapped in CPU page tables. Later on,
> these pages might need to be returned by get_user_pages or other callers
> through vm_normal_pages. Our approach in this series, is to handle
> device-coherent-managed pages returned by vm_normal_pages, inside each
> caller. EX. device coherent pages don’t support LRU lists, NUMA migration or
> THP.
> > 
> > Wasn't the plan to not set pte_devmap() ?
> 
> amdgpu does not set pte_devmap for our DEVICE_COHERENT pages. DEVMAP flags
> are set by drivers like virtio_fs or pmem, where MEMORY_DEVICE_FS_DAX type
> is used.
> This patch series deals with DEVICE_COHERENT pages. My understanding was,
> that the DAX code and DEVICE_GENERIC would be fixed up later by someone more
> familiar with it. Were you expecting that we'd fix the DAX usage of
> pte_devmap flags in this patch series as well?

No, I was just trying to find where the pages got inserted and
understand the comment above. I think the comment should be clarified
more like you explained:

  New uers of ZONE_DEVICE will not set pte_devmap() and will have
  refcounts incremented on their struct pages when they are inserted
  into PTEs, thus they are safe to return here. Legacy ZONE_DEVICE
  pages that set pte_devmap() do not have refcounts. ....

Jason
