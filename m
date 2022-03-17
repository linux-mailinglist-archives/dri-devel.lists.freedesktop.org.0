Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA7034DC786
	for <lists+dri-devel@lfdr.de>; Thu, 17 Mar 2022 14:25:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AD2E10EBB2;
	Thu, 17 Mar 2022 13:25:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2069.outbound.protection.outlook.com [40.107.93.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46E0B10EBB2;
 Thu, 17 Mar 2022 13:25:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W3cofmZ885Q0Y1VfmZtGnNbZU4TTJkFb2A2RKuO8h+1YUqQvq2RDxS5aJEdhDveMxSLjltUmvdntdACWNocK78Nc6X7fb0sHyGOOGoRPttiAsNyhm7rAkqIxTLBFr3foQi5ZVzk0tZvy24BdxE2K0JVhYPv+NNWsmMZ9GRmabSKTJZSpnltzm1CMXoVo+4OGIaknfCiEhO/Qn3O6z6b8hVU/9VnauNQ4SJbk1A/9qRFdRzPjrXWTImPFmlnJB79WLBX9J/20btsgMJhJZBpX+A5daA1NXdxRZRr7GBw4bpW3z/Tg4vCRXsRzb6EBwyghZ+qFzTz8Z4v5KKDJ989UUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5q1hlJk5vkR5cy+4asI2+SK2NR5fwLevVDj792uRsmk=;
 b=Za3Sbp/YAGXdA0dM+wnLwFxmA5A9EXNaSrUmqA8GZwjoxW81jjSSAiZ/VzgXtYbAKpzpAMQxwzSlgdWSkEWa6cOnibLH0ZBPLDJyQkvupMgOI77hYIRs1N+c1JVZ+Ok9O4XMSqAyoUmryheS61xLRpaux1UCcrpNctTbR+QrtySB4wQ35Rh5NcjSzinzyc1EhTKMkOAluYo6v9QyLfcBe8anYfizqhHklNjUdh9iz+OxIVV9EdegEiahv+Hd6Wz5nG+0idxRzxJuIquQZVwWWvaHvCIbIPs/KK6603E4hcghYmSTwDcV4mKzENr219LxRKkc76K4mx72MBLgA8PkIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5q1hlJk5vkR5cy+4asI2+SK2NR5fwLevVDj792uRsmk=;
 b=THqUeqt06pBkzWp4mv3TXlfD+6Z3F7Zzje8AJQyc2ajEOm78YwBy3C8z7KO2RWV9Gc7DC897YiQOcECMx9eJxwZ0fbJcOeo7gFb0sPlobxBvR+JqdJlJ8dyyL7kXCwMnqetYjHiXBQZKKt/jjfQIvJ8p/09TPgP4DkvoZ8hGGOthP/YW/6/yqZlqI7/AVf5urVQ+pYjo7IMZbx3PsIJ78ok7L9By2p0zd3Y6ojndNJGpUC/gnOTKf4//8jaEtTJfZJIfce3yornEiseBp6AK1cYBOUYHIPaEuilnN1/tsjCZKc0MQCiBFsk1DoBJEmdt3+xN5LBzs8/d7bRLfnHDSQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB4192.namprd12.prod.outlook.com (2603:10b6:208:1d5::15)
 by BL1PR12MB5320.namprd12.prod.outlook.com (2603:10b6:208:314::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.14; Thu, 17 Mar
 2022 13:25:44 +0000
Received: from MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::11a0:970a:4c24:c70c]) by MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::11a0:970a:4c24:c70c%5]) with mapi id 15.20.5081.017; Thu, 17 Mar 2022
 13:25:44 +0000
Date: Thu, 17 Mar 2022 10:25:43 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v1 1/3] mm: split vm_normal_pages for LRU and non-LRU
 handling
Message-ID: <20220317132543.GW11336@nvidia.com>
References: <20220310172633.9151-1-alex.sierra@amd.com>
 <20220310172633.9151-2-alex.sierra@amd.com>
 <07401a0a-6878-6af2-f663-9f0c3c1d88e5@redhat.com>
 <1747447c-202d-9195-9d44-57f299be48c4@amd.com>
 <87lex98dtg.fsf@nvdebian.thelocal>
 <ab26f7a0-728e-9627-796b-e8e850402aae@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ab26f7a0-728e-9627-796b-e8e850402aae@redhat.com>
X-ClientProxiedBy: BL1P223CA0020.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:208:2c4::25) To MN2PR12MB4192.namprd12.prod.outlook.com
 (2603:10b6:208:1d5::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0ab39593-c216-40ba-8e25-08da0819a41c
X-MS-TrafficTypeDiagnostic: BL1PR12MB5320:EE_
X-Microsoft-Antispam-PRVS: <BL1PR12MB5320F31E2397F9D87599EBAEC2129@BL1PR12MB5320.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wuXxRXQw2uvIO/ueBQo2HOSvO1aNWpDL9X2Mu8qL+ENFj4PxHOdoxSxugTgqaGOrFyOkDduhPx3b7qe7VgxlctEGLqRBXJ1QIhaD0nVSEZ0onEBexb4MWJqnS4FdYBptUSlXmG/cC8aPiNkBEX2A2AOwS419cWaF3UV3I8ivLCvjKvpXIUx2Z3D97CHFvjuO79Vwa+QWc0TQBRoSWDU+ua4Vra/bD7qvNPBVFTne4kyWhtJw7/VvK5GsCutuIvydlmCZ0Km13J9+P5zdnORIp6xD80sXKI6lt5aB2NRtoFbtt/IrAFPkU/d5LR2ZUMNa6p1txwGvCDJOAZhSOtRVFhdl3d3+sacxO+WsfY8tq84P5uyx4K/y3+nNLcKOHUU6m329uxoWjcL4fQxfrztLjUrnfs1ukFUSIoiPeCaLnc1RfOxCdK/loDMv8H3gf4u7tDnI1Y+vRYG0nvCwd6RpxC3ryjfX9KbHUDM8XXWAYY7JwsbZMNcngQ3+S54r22aPFLdKzaRixsv81JEOc9WzxCMaWwD+AHUgM5cWThL71hOzocsBn3+oozcEhO5wluSBA5ENFaz+L68TK25e2OsV1rIs4HUhW/XLvT653EwSUCNoGzM8wWPEHaqmvJrORh4PTr9gvdNyMxrTShHKXvCjag==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(38100700002)(4326008)(5660300002)(6512007)(53546011)(66946007)(36756003)(54906003)(6486002)(66556008)(66476007)(8676002)(316002)(6916009)(8936002)(86362001)(508600001)(33656002)(83380400001)(1076003)(7416002)(6506007)(2906002)(26005)(186003)(2616005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?J6C8pjwvlzu66CRyYH4zIwtwRe/07xVd9RIPYw0+hpOLXlxCNb+dAg+ZZpF1?=
 =?us-ascii?Q?pG8x4uFfUwPdAWiUnlC6Hos08lqW5d62Qv0oT5iEFG5lt+rHLLCpkY7A5hx9?=
 =?us-ascii?Q?WFarAi2/3He4Jg6g2BCixkgMdTVnpfwKSIACkeukOKJGs/ATU/uoevs72LIp?=
 =?us-ascii?Q?2iCZAQtTcSN4QJ0zz9xOWrE2AxZeUFx4yQ/eGHHfae9WnQ99U4PKSodCyPl2?=
 =?us-ascii?Q?YHeGUMlGV5Nvlq5SevX0FpbKiTMoZAFpdGucbs9AtqAf52F1pdYLMDVcC0k/?=
 =?us-ascii?Q?XavpJ7qsIWqrYX9LM3heocf1mg48XyvVWq9bcCeRyTnz+fib9/i7qd+JKc2P?=
 =?us-ascii?Q?gKfztUXfN1tqUryfKKwh7RJ9XlQM1CE9dgGqH/ymHoFUjO880hYbA8tLjYUJ?=
 =?us-ascii?Q?ibAhc2Mgfx/WeKCx2rhLnrV9EEkR2JfrNDvlu5rlldTDmaDOMV9PK2CXYk8M?=
 =?us-ascii?Q?RUS9Me0FzikNKSUfGclpz/4SdzNsuBEH4k/HvEeX2oWqFAdNaU53Yb2Zq1H5?=
 =?us-ascii?Q?f6mebYnN/mT8Rll8QHk9ha0xyrBlp58e4QTDaLi+z30kAlsMwwxlRXM7ym2R?=
 =?us-ascii?Q?GcYAwdBB0YsFf5GV1pvLc8k93zS97ipJlwmq3O2aFyHx5Y42aqaGyJqmGSxH?=
 =?us-ascii?Q?6dht6QXlGJgN68223EIRxBv4xz8F/hNyn/+gD3hHtZDvoCzSyGEYk8RO9yJN?=
 =?us-ascii?Q?UYFle6vPXc8t/UzZtwhoV+pCH42VYHWomaYIW7XOwOBkeVuqMjvNEs+Nxa1i?=
 =?us-ascii?Q?WqI4gXvaTmpHxTkuS19HVjdzWbhCFOyDmdwnPe4BmM/900klhSD1HiW4DLFj?=
 =?us-ascii?Q?olgZPAIXI5giO63oJQRZScnsa+/5oDGXF1wKRmfoju02CGTSqVvT+LlOA1kf?=
 =?us-ascii?Q?+JZ1ZOT7Hhf9bzdyS1oeMq2XiFCfWPyVbtwRAUd/KJg3vlena4s8hmv9X9cC?=
 =?us-ascii?Q?n9SBERaixAxmOiRVJszYFFZvdPF9fhsV7NImpSpdbj5kkM86sVh8Yyt+IJyV?=
 =?us-ascii?Q?Xy8TSImliVSRsVFjYtoAjaH/5F0TlM/oDI51anb7JnqmBYs52Rx1Wd5GSPdR?=
 =?us-ascii?Q?3O7yzbXgtnPkh/KUBnAjjdxrfYxLXwoxcc3XK17TBbiRcQZmGOf/Ii6neLkv?=
 =?us-ascii?Q?95XqpsT+m+RMh7ITGMRsuVqr8udW1mitvzX5AfNhVOWPA/Y3zCJi9IBX5Pg8?=
 =?us-ascii?Q?sjVz7mYdQ8dv8upB93topqyernO/uUEFGb5ky4t++qgEk/YAc2bS80SCdATs?=
 =?us-ascii?Q?5KBkE/MMIDc2J5G8X8VDIm4AfZS8dnEAPOiyAVOUH2+eHZqrTon8IqN/1gdi?=
 =?us-ascii?Q?oAUJU7hb0/UguReKTYxXcC8q6hULsTnsgLDxycF8YSZWvNS24co+7b00qYzM?=
 =?us-ascii?Q?6t2L6KAEe5T4Fe0NW6TyUsKvYYhNADGi4JF9cch5Ev1RMcR4QEqnRVnaVbMR?=
 =?us-ascii?Q?WxmQ+qVDQKJhcckhFtsAmoCxkSWzdgwg?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ab39593-c216-40ba-8e25-08da0819a41c
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2022 13:25:44.8604 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Hni5aDahCsZ/0yMzVaTKlXbKvgsD3Ei6AZ42yBUoWl8J30aqzjEoaTCafl8vZHMy
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5320
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
Cc: Alex Sierra <alex.sierra@amd.com>, rcampbell@nvidia.com,
 willy@infradead.org, Felix Kuehling <felix.kuehling@amd.com>,
 Alistair Popple <apopple@nvidia.com>, amd-gfx@lists.freedesktop.org,
 linux-xfs@vger.kernel.org, linux-mm@kvack.org, jglisse@redhat.com,
 dri-devel@lists.freedesktop.org, akpm@linux-foundation.org,
 linux-ext4@vger.kernel.org, hch@lst.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Mar 17, 2022 at 09:13:50AM +0100, David Hildenbrand wrote:
> On 17.03.22 03:54, Alistair Popple wrote:
> > Felix Kuehling <felix.kuehling@amd.com> writes:
> > 
> >> On 2022-03-11 04:16, David Hildenbrand wrote:
> >>> On 10.03.22 18:26, Alex Sierra wrote:
> >>>> DEVICE_COHERENT pages introduce a subtle distinction in the way
> >>>> "normal" pages can be used by various callers throughout the kernel.
> >>>> They behave like normal pages for purposes of mapping in CPU page
> >>>> tables, and for COW. But they do not support LRU lists, NUMA
> >>>> migration or THP. Therefore we split vm_normal_page into two
> >>>> functions vm_normal_any_page and vm_normal_lru_page. The latter will
> >>>> only return pages that can be put on an LRU list and that support
> >>>> NUMA migration, KSM and THP.
> >>>>
> >>>> We also introduced a FOLL_LRU flag that adds the same behaviour to
> >>>> follow_page and related APIs, to allow callers to specify that they
> >>>> expect to put pages on an LRU list.
> >>>>
> >>> I still don't see the need for s/vm_normal_page/vm_normal_any_page/. And
> >>> as this patch is dominated by that change, I'd suggest (again) to just
> >>> drop it as I don't see any value of that renaming. No specifier implies any.
> >>
> >> OK. If nobody objects, we can adopts that naming convention.
> > 
> > I'd prefer we avoid the churn too, but I don't think we should make
> > vm_normal_page() the equivalent of vm_normal_any_page(). It would mean
> > vm_normal_page() would return non-LRU device coherent pages, but to me at least
> > device coherent pages seem special and not what I'd expect from a function with
> > "normal" in the name.
> > 
> > So I think it would be better to s/vm_normal_lru_page/vm_normal_page/ and keep
> > vm_normal_any_page() (or perhaps call it vm_any_page?). This is basically what
> > the previous incarnation of this feature did:
> > 
> > struct page *_vm_normal_page(struct vm_area_struct *vma, unsigned long addr,
> >                             pte_t pte, bool with_public_device);
> > #define vm_normal_page(vma, addr, pte) _vm_normal_page(vma, addr, pte, false)
> > 
> > Except we should add:
> > 
> > #define vm_normal_any_page(vma, addr, pte) _vm_normal_page(vma, addr, pte, true)
> > 
> 
> "normal" simply tells us that this is not a special mapping -- IOW, we
> want the VM to take a look at the memmap and not treat it like a PFN
> map. What we're changing is that we're now also returning non-lru pages.
> Fair enough, that's why we introduce vm_normal_lru_page() as a
> replacement where we really can only deal with lru pages.
> 
> vm_normal_page vs vm_normal_lru_page is good enough. "lru" further
> limits what we get via vm_normal_page, that's even how it's implemented.

This naming makes sense to me.

Jason
