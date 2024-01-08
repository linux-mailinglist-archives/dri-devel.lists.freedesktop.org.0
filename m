Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B056C827091
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jan 2024 15:03:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02E1310E0B9;
	Mon,  8 Jan 2024 14:02:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20608.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5a::608])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B70BE10E0B9
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jan 2024 14:02:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HnO9tuj59zffV7oaVyXez4Xv0eQDC89PP979Md9QTDEnCC1hPcOfLZ0dbeLhg6mOsaavJ0yIg8NunKLeU9PrcwBvUANYbjn/GxNisslEiMfWA9UIjAYIEVJoijMqb/6S27OQAH6KCXV3ofXHILqXI7TVTA60m4D5zN5okDEDChujLyXDfyr2xHbJwivEBLc/2jyezPs4GNtEl2JHG8ppi7z3NX/U7zyMPEOSH8SwVj33TqP2Kp60xqCCpJIlc3FDQ2hD9YlKIc+0BvPSPLmqanzq3UJg7GzugdZEUVU0Jnn4M06fhEtvUKKqWfVB9iaDJ0b6Leg/I2whdnWfDbGZGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O3H/scIysDbHkCk+GFipvvZr68uuJqZfyJMhhpu6AHo=;
 b=Az8YMW1erLhFdkJZrsupjL5k7AWQcDdoXDl5rUbH8dMDD2FWOvdfIP8TdoAjuoBIfStFRCQTbSqpTCVbaLOW2HebagHDBkMPeskaDUiesEGTrlQk9ys8xFx/W/xCedeUZFvOGEDAYPvNsXa6IKy1263a7O+wefiEMYcnw0b0POeZQBDU23K4qNVENa42uYHVul9JUF/wJZpmIlm7CksjmJp3Wx/RRwSaokrL6CrwyPODSKeQLY8cXDiaEyQ+78OJ4uZMWlYHjMfHoJxf5tLnTUJpePFxk75lIq5UXadyXsSxXG66bqdWKCIPO6RO1dkSLwLzSECXDJBewS4cSf+bdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O3H/scIysDbHkCk+GFipvvZr68uuJqZfyJMhhpu6AHo=;
 b=q+UC/JV//GyQO82iHnS6t6n1RrCxsB7JK6Q+wZdrpG7MhWIOUIW4bq5j86d4pUPt6O1+Fqg7XS/tiXfzZP9xlyIxpuFG0NrkGyd8uApSn+PrYPWExC6xCmZGWAr1Vgh6XLgc27gJAKC75kxEuCVrNwsp3W5sUwueJOjWmv66LxeLjDkSQX6of9Nwl3GruSgygNX2LS+pHNqgJ1RrkIe2ZkP0padvzf9PClLR3OvHplI1+pHVnokNtTDQoOZ9Dr7OovV05ZjfCEd6RpfHLoAu4FRmhYjEpqG1X4z3O51GqqbANy0Pz3xTZ3LH3qiLwRmuZ7aI31pjLLQHCBGkcH/ysA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by CH3PR12MB8850.namprd12.prod.outlook.com (2603:10b6:610:167::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.23; Mon, 8 Jan
 2024 14:02:52 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::60d4:c1e3:e1aa:8f93]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::60d4:c1e3:e1aa:8f93%4]) with mapi id 15.20.7159.020; Mon, 8 Jan 2024
 14:02:51 +0000
Date: Mon, 8 Jan 2024 10:02:50 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: Yan Zhao <yan.y.zhao@intel.com>
Subject: Re: [PATCH 0/4] KVM: Honor guest memory types for virtio GPU devices
Message-ID: <20240108140250.GJ50406@nvidia.com>
References: <20240105091237.24577-1-yan.y.zhao@intel.com>
 <20240105195551.GE50406@nvidia.com>
 <ZZuQEQAVX28v7p9Z@yzhao56-desk.sh.intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZZuQEQAVX28v7p9Z@yzhao56-desk.sh.intel.com>
X-ClientProxiedBy: MN2PR05CA0021.namprd05.prod.outlook.com
 (2603:10b6:208:c0::34) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|CH3PR12MB8850:EE_
X-MS-Office365-Filtering-Correlation-Id: d5470f08-9acf-4ffa-ff62-08dc105280ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kT/puTJLBLM29Q0S9eLOLKwZlVKbblJHmAN8EGWkxkt/5hbMxi3f5PUsKECpfLz60/HEUAMH8rDoeDnzJrf9c2DkPtnKMBgRsn893Oaccgs6rXiDpFWRyU73fEdfKS0bv1cmjg0HH5CKQRUS0nrSd779jG580QE7yKklpuFfCa8FWlqp+7/VtveaLtik0vggvvVcbgpGWBKTbEMEJgoFnL7QQUbAHNAgZrnv2nUXbYdCmHQ71XfI5HzXqr48wCgcXAWrJFUbUAV24l8lo9iDN4rOGVK7w8X+3Ns2WrMBLmcpRcUk+GNicU+P/Y2OKH+e01DHQ/mYRzqalm0taSuG/qWsaH3Zgriy0VCEJRi3d/ofsWAio/xGME5vTmJG5YOBKbQTaWWDQ56OIFc4s3ye/QxL7zL4jUM8Z9rPgkLC2RyT1D6XH1WmBmfSmsvxdAqscGFmmEEeo1zO7k+xmisduGHYfJTv9xPCDHTVlIWJNlzEy9UKGpMIogV7EDbB8LB3w/rfxHrikl2mYTi114vi1zCWW80KSLij88jWgw718SZeLLk+vwib7EmnMUFqWO+y
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR12MB5869.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(376002)(346002)(396003)(39860400002)(136003)(230922051799003)(1800799012)(451199024)(186009)(64100799003)(41300700001)(33656002)(1076003)(6506007)(83380400001)(6916009)(66556008)(66476007)(66946007)(6486002)(2906002)(316002)(38100700002)(478600001)(2616005)(6512007)(26005)(86362001)(36756003)(7416002)(5660300002)(4326008)(8676002)(8936002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?yZdrbHtVdZTlo9p770wHbM5ynm45cNtKRGfI0+EOPpRh0UcxpyHUmDEHPfOI?=
 =?us-ascii?Q?asDD+k0OMLcXAxP6im4qngoFeedOg4wQWQZB41NGTMIHZohlDrCPxyoaZ8od?=
 =?us-ascii?Q?PmhPVMe0pWUXjK9Q/tlox2AKQ6MKlo6/z6R0wKP+wRvGPaeTvqNJcD6S0JyM?=
 =?us-ascii?Q?hmUkG/mUE7XJHPaDzucPCeOwvUNRM14k3teaEEdrKqs6ZUfr2pE+HHJv2yAe?=
 =?us-ascii?Q?xX65RhDeYY9uPfEupcr6lQ3tamHwPY/wbk32pQMU3JTcSiuFbV44JhhS73CP?=
 =?us-ascii?Q?MLmSmuEMZef5rN7Fxe0Nh2i3ciiimy58aIsUj8jMegGlVh++y9iE6qDk9af3?=
 =?us-ascii?Q?pGtDFzoKE2a7IcCZ83fjPaQRlFJehUyEcXRdsmXceoOdMk+VaHnmhzFHc3ep?=
 =?us-ascii?Q?c0BJ8WzEJ1jyYCKTRw0S0tpjfoO5bajhoHSFXY+MuH17twn0kRDaBaE42Nwz?=
 =?us-ascii?Q?AOk6LSyYeVr2atr2jSt+v7cNMjN/fHJSXLanQigR2LvR3P5mc27JAfjTLyAa?=
 =?us-ascii?Q?QcO6JeomoSfL5lNp/Pri7NYRfqv6qab9nMOig0LBWJqM76w+17qRo97WfLr0?=
 =?us-ascii?Q?AzU4s1PmdX36dcAKdB+mDTkybNDe4c5sH3ULfC5LAFeRC5iVSLEKms1xAUl8?=
 =?us-ascii?Q?BbJEdviNvWR59AZiusv7mqVDAww2ZeBGe9irTjvAHnMdx62TIEO30PH+lTHu?=
 =?us-ascii?Q?4vgjNB0+TrtJjZK+VTYcGJEtRq23ipuh4rVK53AUKF/CsUj2694AGH0QrxWe?=
 =?us-ascii?Q?CZh10xGyLoqWz2kLjrIsl22Nb8xZdPSHyxbUabGVNaQdyGpbKJSIU+CwcrkD?=
 =?us-ascii?Q?SLG4DtnBaHiOb/rUIuLSSOyv+lXxP2x2h8dlISUhTc+Tk/gXsLnT8uBnmK6R?=
 =?us-ascii?Q?XQME5QD+u0POWGNFJwvnJV0jmdudjDQ1ReLfDNkDVcGT3bZyXyecP8pw3Oxu?=
 =?us-ascii?Q?DBq8Ka34Deh8zyeu2cOmw1OWSoONnaFlQUB12VW+Xpe3Hgx65T0OwSaAi4iu?=
 =?us-ascii?Q?XTCn3K39s3pXiRbpkziLdh/F+NOD8MshcjYtFkjzfH9brf9Dl3BmPA3/tQNq?=
 =?us-ascii?Q?6xzzSgHHXej1lBZjvyhHpgmatOUzVqy5IWT5oISdZrVudqL5UAbWQxj7AgOt?=
 =?us-ascii?Q?iac7+2NVGP4UAgG0TA8uPk4W/9Ts/ewl9ZvdDqpyI+kvIzW1BbvontVu4SIx?=
 =?us-ascii?Q?x3GI7a+g0x5xE49DEwYLoUmE27LBaGdfXPpD+4BBmrWCGH4mA8FmO6EqIx6B?=
 =?us-ascii?Q?J8PDaKTLDsUzCCVHpZixWMKoh6Q79GOT+BxeyrvqUB7BWdC19WfNp5jjokHp?=
 =?us-ascii?Q?S67gXXk1f8Z4Bhvt+QXXzck/qoF9reyh3YNPpEyUIFbcdUcT3cBfOpkrk71X?=
 =?us-ascii?Q?se8ehsENuRWckR2UfI242zGhUMYvJ36iFjRPigcUrmNfRh2mN5Q50R07S+pp?=
 =?us-ascii?Q?8CLqTf4NXa9KJ7Nx9jmUXZ0qSrRARD+ZOtLEv8bPZKZ9V8zM/4c23HbjjAjD?=
 =?us-ascii?Q?EoEDspwK3zUuQhI2VFIoDRWeqkLvZPH1wW23Z3DP4WR4lqREk01XQdsILc+9?=
 =?us-ascii?Q?sWX5PdmphtpmPZA1gAk=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d5470f08-9acf-4ffa-ff62-08dc105280ff
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2024 14:02:51.8568 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: quCpi6jGKLPyaxu7749lyKefDo7m3ng9s4njVWLD8Rk8FPdYYzCd/ccP8jG3Wbma
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8850
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
Cc: wanpengli@tencent.com, kvm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, kraxel@redhat.com, maz@kernel.org,
 joro@8bytes.org, zzyiwei@google.com, yuzenghui@huawei.com, olvaffe@gmail.com,
 kevin.tian@intel.com, suzuki.poulose@arm.com, alex.williamson@redhat.com,
 yongwei.ma@intel.com, zhiyuan.lv@intel.com, gurchetansingh@chromium.org,
 jmattson@google.com, zhenyu.z.wang@intel.com, seanjc@google.com,
 ankita@nvidia.com, oliver.upton@linux.dev, james.morse@arm.com,
 pbonzini@redhat.com, vkuznets@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jan 08, 2024 at 02:02:57PM +0800, Yan Zhao wrote:
> On Fri, Jan 05, 2024 at 03:55:51PM -0400, Jason Gunthorpe wrote:
> > On Fri, Jan 05, 2024 at 05:12:37PM +0800, Yan Zhao wrote:
> > > This series allow user space to notify KVM of noncoherent DMA status so as
> > > to let KVM honor guest memory types in specified memory slot ranges.
> > > 
> > > Motivation
> > > ===
> > > A virtio GPU device may want to configure GPU hardware to work in
> > > noncoherent mode, i.e. some of its DMAs do not snoop CPU caches.
> > 
> > Does this mean some DMA reads do not snoop the caches or does it
> > include DMA writes not synchronizing the caches too?
> Both DMA reads and writes are not snooped.

Oh that sounds really dangerous.

> > > This is generally for performance consideration.
> > > In certain platform, GFX performance can improve 20+% with DMAs going to
> > > noncoherent path.
> > > 
> > > This noncoherent DMA mode works in below sequence:
> > > 1. Host backend driver programs hardware not to snoop memory of target
> > >    DMA buffer.
> > > 2. Host backend driver indicates guest frontend driver to program guest PAT
> > >    to WC for target DMA buffer.
> > > 3. Guest frontend driver writes to the DMA buffer without clflush stuffs.
> > > 4. Hardware does noncoherent DMA to the target buffer.
> > > 
> > > In this noncoherent DMA mode, both guest and hardware regard a DMA buffer
> > > as not cached. So, if KVM forces the effective memory type of this DMA
> > > buffer to be WB, hardware DMA may read incorrect data and cause misc
> > > failures.
> > 
> > I don't know all the details, but a big concern would be that the
> > caches remain fully coherent with the underlying memory at any point
> > where kvm decides to revoke the page from the VM.
> Ah, you mean, for page migration, the content of the page may not be copied
> correctly, right?

Not just migration. Any point where KVM revokes the page from the
VM. Ie just tearing down the VM still has to make the cache coherent
with physical or there may be problems.
 
> Currently in x86, we have 2 ways to let KVM honor guest memory types:
> 1. through KVM memslot flag introduced in this series, for virtio GPUs, in
>    memslot granularity.
> 2. through increasing noncoherent dma count, as what's done in VFIO, for
>    Intel GPU passthrough, for all guest memory.

And where does all this fixup the coherency problem?

> This page migration issue should not be the case for virtio GPU, as both host
> and guest are synced to use the same memory type and actually the pages
> are not anonymous pages.

The guest isn't required to do this so it can force the cache to
become incoherent.

> > If you allow an incoherence of cache != physical then it opens a
> > security attack where the observed content of memory can change when
> > it should not.
> 
> In this case, will this security attack impact other guests?

It impacts the hypervisor potentially. It depends..

Jason
