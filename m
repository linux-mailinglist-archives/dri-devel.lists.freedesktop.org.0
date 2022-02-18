Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6EA74BC03C
	for <lists+dri-devel@lfdr.de>; Fri, 18 Feb 2022 20:26:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDE6F10E7D9;
	Fri, 18 Feb 2022 19:26:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2082.outbound.protection.outlook.com [40.107.93.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4208110E7D9;
 Fri, 18 Feb 2022 19:26:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OXco4mtZCexNPuCUKIYdB77FuG+cKG0y9StoNuGcwoMFA4rPupQGq2vdpm1Ae+Txl1veytHiFvWEU/jHMtoLec/H1fHMGjpIAEAVcNW2aN0WMlHfBHiE+/n7HuxBFpnGpH7P2Q5uJpFrEjBAgss3K9QBF6fkQaM0wXft21dM0zrL1xGW0xWcpRePTXXUv8VXDu6pjSmxodFucIABm/0P0f5dMbl2prQZC/+t+nAzYZ4t7dtjykGnbts4X0xH+sf+yWazRrKiEXmeDKl2rArUVQt/Pk8cVrpzFUUuliiWscjsEHNohAR9U6c0utP2L/uFehc8/pbZ1rlK2pItAmR4rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UKBthWE7b0PXKanAXIjdOu4soILyu1q9J0ijEfmeGm4=;
 b=S4+Si9nukOAk5h7gJ+ihSmNouH2l2QTrnP5kqAhQYHXrUt11AAsrvCtL4CAEM5DTIDeP0loVc5INyGqF7t7seFex480q6BRoH2ojbawSy7VUjz2GWC3KRx5tfQsrpuCuOIifmPY1yGC/BHLTblYAAuGCaCYuNHJOqIRPy74X5itjsXkCpCSzXPHT9Oo+oGevSwJoqNmqj5g8ozrD5iutUD6u1Gfb57mrFwAvccvCCwwGW2cr0QO1yieOMqeQ3Qs9hQfzLjnSPYTeTNWVgvFFC6/htA/yr/ruSj6OY5rahIdXSHLcU29zba2X88MCTfozKnkEYW6IWr3111QgBQHKJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UKBthWE7b0PXKanAXIjdOu4soILyu1q9J0ijEfmeGm4=;
 b=tr313h1k5qwLPu4jI9Oeg+uDbJtEyceXTAj+ABD9x3fx0r1WydNjbgVX3C40GhGzSxgqoOculxPaCR8cao5Th6tC8mlENyJ3oBgLrb6XesgsXcIJd5208Tfaqbuz2qCSj4z/XvNlcOewrOPpHYUlmPumRK9YGsxve258vltMq+xCuhyArFYzTgmNDQZl5gwrL3XjkVoY1UwvkbvYQSIzf94eqkYngyRNBfRFoaUIm/tIUK7iKD6q5WBgWXyK6R3U4d4Fed45vidJV6S7VowuKdDUsdJUF2E7xDdqhGd9h0qCTSy8HMoUxmHgAnUXvoLj5xqBtL7afBjtJyIHQuBw/A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB4192.namprd12.prod.outlook.com (2603:10b6:208:1d5::15)
 by MN2PR12MB4608.namprd12.prod.outlook.com (2603:10b6:208:fd::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.16; Fri, 18 Feb
 2022 19:26:41 +0000
Received: from MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::e8f4:9793:da37:1bd3]) by MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::e8f4:9793:da37:1bd3%5]) with mapi id 15.20.4995.024; Fri, 18 Feb 2022
 19:26:41 +0000
Date: Fri, 18 Feb 2022 15:26:40 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: Felix Kuehling <felix.kuehling@amd.com>
Subject: Re: [PATCH v6 01/10] mm: add zone device coherent type memory support
Message-ID: <20220218192640.GV4160@nvidia.com>
References: <beb38138-2266-1ff8-cc82-8fe914bed862@redhat.com>
 <877d9vd10u.fsf@nvdebian.thelocal>
 <20220216020357.GD4160@nvidia.com> <6156515.kVgMqSaHHm@nvdebian>
 <98d8bbc5-ffc2-8966-fdc1-a844874e7ae8@redhat.com>
 <20220216122600.GG4160@nvidia.com>
 <bf16195e-2570-3687-2b53-3f597ebfcfec@amd.com>
 <20220218001935.GN4160@nvidia.com>
 <2f2569d5-df0d-7975-7f4a-2d85ceaf29ef@amd.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2f2569d5-df0d-7975-7f4a-2d85ceaf29ef@amd.com>
X-ClientProxiedBy: MN2PR22CA0020.namprd22.prod.outlook.com
 (2603:10b6:208:238::25) To MN2PR12MB4192.namprd12.prod.outlook.com
 (2603:10b6:208:1d5::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e22f5591-89e3-47ce-c4c5-08d9f314974e
X-MS-TrafficTypeDiagnostic: MN2PR12MB4608:EE_
X-Microsoft-Antispam-PRVS: <MN2PR12MB4608A46701325C179C5F5AAFC2379@MN2PR12MB4608.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Y0OIxtCs1P6rtqKJJWCyGpmdHo1Lk+xX2d6Zav0QIChLo59Gexy8pE9W6hZ+V+fC7Urd46cmkJa/DwackBNxBWnqQIuzxrAyA+jJHtHK+hw088vJOhu35CdTdFaLu1o88kHyehZb1cu+5Tzof68JQ8q/hB+yMng+zN0EkhhDD45qFfa8+TxMb4+DHIfHUXNH8YHweyhXLIQEBu0ihGRo3k2sQzZwBWE+2U63OhT6HFtQGGPx3j1hTo7SEW5GeAeVXvKhHQyB/Zor0mOTqbQYD+tEcBQKfWohrRCAnWtDQYXkg6PgrMMGDiJySLF3gwlsy+5jTC93kylyLcSI5U3wm+MOYhE4aFGhHVY5y02gX1Uv3bETlG/6/1v43ekGKhC5mu1axEKb8KnYqf2z23lyD9ZLGREQnwFmnpWKPIyjKGZBcBFPmNiHXGabC8C4fp6/je2Z3kZBgm2lSdGskAApu9j81hmQ09rT62pLtu4hhQvBwyjoFK5bwvjjAN/tm/UsSVTe8yH66ZzI6nUjDUuAr8nUf91j//oJ86YwdE50rhZWX0BqzhIBMszuU+esEmeCPJkLgKVJZtDL7uTwcdOG6sa+kKVtRlC1d9fkb3n34uzWdFlHHApLMZTl2whf0F0Jff2do1KqwCFi2l8+yn+ObQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6916009)(54906003)(66476007)(316002)(83380400001)(26005)(36756003)(6486002)(508600001)(6512007)(6506007)(4326008)(7416002)(8676002)(2616005)(5660300002)(66556008)(66946007)(2906002)(33656002)(1076003)(86362001)(8936002)(186003)(38100700002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?tb8Ss23B/5GGqLSWKUKtwJNhQOXNDDNVa/1vtJiJImH+RpGh+1Zh2IkcT4iq?=
 =?us-ascii?Q?ZDGEPBTPP6H3/RqQV5u/Ilw2//ArBxI1GDDGzDU3D09MUV033GGTv+yxMd3p?=
 =?us-ascii?Q?r8bDEr9RwBq/fjZKf2Qz3rfa+YRuDl0P8e2+O7VFx75xWaficXNqpt1zM+8P?=
 =?us-ascii?Q?jkQ8Z6bqL5I6I9O9YpcAp0Vxxhjr1DawU9lVVn3vP0IKdiY/xaUvdO/7cIVr?=
 =?us-ascii?Q?x1+TMlOlKPvjmg1Lb0tlb7x2rTlUzJpc7y2vW5tJoX9B3NxcxyZuDM5r4ZWf?=
 =?us-ascii?Q?0lOyFbKwVMWKIi/ATGiQPPxPI5SHXZ4coCG4+vM0K55mJ4nO/Q6huCST/GVr?=
 =?us-ascii?Q?3yD6dfZGaLP5vxpRLwSqw5sdTlS9q1w7AlH3a+LiBlvgUGmmQmsDTkEtBQ6Q?=
 =?us-ascii?Q?/BJl8U5TySYgFfBCwapelJVtK+hzrZpxMlApMA6RH2bhdHDgFnfaQ5MrMNcx?=
 =?us-ascii?Q?7Ixzr9WNc+HXsyzsbXycP0F7vzp+p6Fs92iCQUrdbuYfvTu7y8ZsPXOn+mr2?=
 =?us-ascii?Q?NK/Ba4dryMo7c9Lx638D1SpWinrVsK+fwnwv52JTRxbs5YSGnYzTADK3EeQ3?=
 =?us-ascii?Q?raDTgXc97ycUnqjaQI/rYkbcVcDWvv1KdmElylr8h0G7MgmZlVeTO5ZxLDzB?=
 =?us-ascii?Q?5Bge2JdwNQGETqbpX4jSgTeQgG1oDCcejA4/UBmxCrd3CJf8+aavlvzgrQQV?=
 =?us-ascii?Q?dF8CpcUnXV9HIhkaBkR2fzC6C7vCDOobja3KY641OaNI+OZarVEgCHHdCnYt?=
 =?us-ascii?Q?742ECnrbKkwJqHBKU0ao8UBD0krkUfYMDQPyCWAOFF/OZGE186mCvb5THDFR?=
 =?us-ascii?Q?a1Gtt2qPJJUKCCv0aKQKWH17W2UUcXjrCyN/apn+tFlyVA88Vmo3nn7A244w?=
 =?us-ascii?Q?khzrj28tNPiRss8GFtAZAFcWQDbDElBa194xayTrBSsusTZz06XBxxvneNcE?=
 =?us-ascii?Q?h+qbvPTMZjV969jk5H2wmJt6osK1cdmMhzI7nzXUm0Vj/97VfKSOHqf2vPQF?=
 =?us-ascii?Q?/Ib1GJrLiu9IOFnx5WVBKmhzDHYQonEdQCRL1VeYWKbr+ZdN1MNebhQoJYxO?=
 =?us-ascii?Q?ZjC+U8T4mVlTnoAdRTBQQnRaP4vAqE7PPp4mJnVxeNcuH64s6pYQd0JP9kha?=
 =?us-ascii?Q?ovyJK+9gBA9hVb2P3tcJosiLliqfRTfDU6icFfojf20SbiSM/TgtAwhZMpqg?=
 =?us-ascii?Q?3zFKNAtuq1yRdF5m289ascyBqvGos831W+740aJxcC72g4R1lvI1yFrY5DCN?=
 =?us-ascii?Q?erIO7bLQNU9QAFPbyJf/I3HNTeHnQOA4noDjbb9XMzZ1jUbhnZpIcjMIQ8pZ?=
 =?us-ascii?Q?b8Px2Hx4ktdJXD654Zp5OAcXoTb0YC6E2bynCs12L/B3zsGqcC9aof/GvTV8?=
 =?us-ascii?Q?/TW5IT38QNO3hjZM1r5ME4PGvq19MI9Gqs7tzHMe3GAftExPOjC5tn9Pmfhb?=
 =?us-ascii?Q?jIc+Xv6WCN7nFnSBn+BBZbqUGerG8X56GJo4fIrJhHdBdukChqjo7H21hwbQ?=
 =?us-ascii?Q?6eW1OiAFaE91icjEXbJkuTL825q7Rh6LPKmGxszYTLoHdMkf9kAXn5YlkC+e?=
 =?us-ascii?Q?xlxjGIzCh6KlUj/qfzs=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e22f5591-89e3-47ce-c4c5-08d9f314974e
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2022 19:26:41.4459 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: otEe4ccNStw3oaFmyA1DVOCwzgwUd2Gv3li4CPtcuOKLBemYT6N08bAlV3m5MZ5y
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4608
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
 willy@infradead.org, David Hildenbrand <david@redhat.com>,
 Alistair Popple <apopple@nvidia.com>, amd-gfx@lists.freedesktop.org,
 linux-xfs@vger.kernel.org, linux-mm@kvack.org, jglisse@redhat.com,
 dri-devel@lists.freedesktop.org, akpm@linux-foundation.org,
 linux-ext4@vger.kernel.org, Christoph Hellwig <hch@lst.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Feb 18, 2022 at 02:20:45PM -0500, Felix Kuehling wrote:
> Am 2022-02-17 um 19:19 schrieb Jason Gunthorpe:
> > On Thu, Feb 17, 2022 at 04:12:20PM -0500, Felix Kuehling wrote:
> > 
> > > I'm thinking of a more theoretical approach: Instead of auditing all users,
> > > I'd ask, what are the invariants that a vm_normal_page should have. Then
> > > check, whether our DEVICE_COHERENT pages satisfy them. But maybe the concept
> > > of a vm_normal_page isn't defined clearly enough for that.
> > I would say the expectation is that only 'page cache and anon' pages
> > are returned - ie the first union in struct page
> > 
> > This is because the first file in your list I looked at:
> > 
> > static int madvise_cold_or_pageout_pte_range(pmd_t *pmd,
> > 				unsigned long addr, unsigned long end,
> > 				struct mm_walk *walk)
> > 
> > {
> > 		page = vm_normal_page(vma, addr, ptent);
> > [..]
> > 		if (pageout) {
> > 			if (!isolate_lru_page(page)) {
> > 
> > Uses the LRU field, so this is incompatible with all the other page
> > types.
> > 
> > One mitigation of this might be to formally make vm_normal_page() ==
> > 'pte to page cache and anon page' and add a new function that is 'pte
> > to any struct page'
> > 
> > Then go through and sort callers as appropriate.
> > 
> > The 'pte to page cache and anon page' can detect ZONE_DEVICE by
> > calling is_zone_device_page() insted of pte_devmap() and then continue
> > to return NULL. This same trick will fix GUP_fast.
> 
> Sounds good to me. What about vm_normal_page_pmd? Should we remove the
> pmd_devmap check from that function as well. I'm not even sure what a huge
> zone_device page would look like, but maybe that's a worthwhile future
> optimization for our driver.

IIRC there are other problems here as PMDs are currently wired to THPs
and not general at all..

We have huge zone_device pages, it is just any compound page of
contiguous pfns - you should be aggregating any contiguous string of
logical PFNs together into a folio for performance. If the folio is
stuffed into a PMD or not is a different question..

> I'd propose the function names vm_normal_page and vm_normal_or_device_page
> for the two functions you described. 

I wouldn't say device_page, it should be any type of page - though
device_page is the only other option ATM, AFIAK.

> current vm_normal_page with the pte_devmap check removed. vm_normal_page
> could be implemented as a wrapper around vm_normal_or_device_page, which
> just adds the !is_zone_device_page() check.

Yes

Jason
