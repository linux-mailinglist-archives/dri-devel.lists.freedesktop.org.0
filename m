Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 164CC827BD9
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jan 2024 01:07:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1435610E2D4;
	Tue,  9 Jan 2024 00:07:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CACE10E2D4
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jan 2024 00:07:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704758828; x=1736294828;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 in-reply-to:mime-version;
 bh=4vloqaXs+FPJLHQb0fKNm42pAlYqbiADqUG+BtXTRT4=;
 b=PzloZDJ9+uAvng5GnvRZB/Qcs1IY7p8+Py1/EcIc+8Y0I9lSrF4XTGJ+
 tBRQgpqRPiZaNsccTKze+tDjtRH8wIj2TjY3RhVztMIQQZdsv01SwyPn4
 xVKgWeZHBzCjdhLNWwr/nIsru8XVsy7xdqKl+AH2A5aGgcA+Xl5MoJ82M
 X0Ti7G3FDqiTJx0gUOgMTSsWPvXpzbKu8HrPM6QGYasOHpH80NIQV40O2
 XWxggwn8rlmTRL7+Lr4IPqAV5JwAGaed5WgIlgKmDJycE8SNYJMQE8QFN
 TfgrMVVFCwZ0gE93enr5kbvmOSupIqx9YgQX3O8D/fL/AurRR4WOz/89j g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="5404508"
X-IronPort-AV: E=Sophos;i="6.04,181,1695711600"; 
   d="scan'208";a="5404508"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jan 2024 16:07:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="1028554999"
X-IronPort-AV: E=Sophos;i="6.04,181,1695711600"; d="scan'208";a="1028554999"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Jan 2024 16:06:58 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 8 Jan 2024 16:06:58 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 8 Jan 2024 16:06:18 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 8 Jan 2024 16:06:18 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 8 Jan 2024 16:05:49 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H6IHROeMcyiFjObnXOOGTN4v1EB+XPGDPIBV3m/wL9x0p7e7JZ64YBy6OVG4vb8Z5ul4v+wuJmCIeqKpaNoxKmGuPGAFq4ITkCPGSz3rIOK/LMitf4llEKGtmHb/31w5ZSkkyvopbwP+B/btfcbAKAICRVGJyRmKMiAdH39Da4Q79f1QlFNqR7kQyPrzeTYHgaxjYqnv5e32Ezk/tiCFiMdIREq54rYyfJBnpblPDCGq7MZpWAa+VY9sB6TRulYCuaJqS0ytYjaA/dN1EzzjH3siIfPT0kiwxAakZApO0dbNBMdWYu5EPd7uEXNHNil2ZjqHHOY4dHxB2kVDcuz4hQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FjNv/Mx2B7aAHl8tldlnzBwXl6u+4m12lZFBWq7OnkQ=;
 b=FWXEq48lRsGhQAmtMZ1NvDEKw1GJ7JmIqBzIynuj+YTFpnA1hHgoAQdaO2uoqxZb/ZtfUJK5kywnpbCoyaYu5J8wWl1KPmJEoFqcq+PrjeWgNfgLjDjU5FyYgjiU0rtWIULpzvv+LKzD4ArEszx3UwHGejdQ1jTcS6vNZzCX+1PBC0KD8oqGeApx9n2+QO5cQnHwjUPDADY+ysbuS7coeDi24UNy75nzTjCueypQVSLDSKNQeXod0JYMNPMbMBeVXlrJ9Bl/Bo72pjwCRg5Tu0eWflv64cOwrW3G01HFUbSoToUhiYo42zg8g7e192Wm5D3Nyiql8kfT3SE20ope4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB5966.namprd11.prod.outlook.com (2603:10b6:8:71::6) by
 SJ0PR11MB5005.namprd11.prod.outlook.com (2603:10b6:a03:2d3::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.23; Tue, 9 Jan
 2024 00:05:47 +0000
Received: from DS7PR11MB5966.namprd11.prod.outlook.com
 ([fe80::32a9:54b8:4253:31d4]) by DS7PR11MB5966.namprd11.prod.outlook.com
 ([fe80::32a9:54b8:4253:31d4%4]) with mapi id 15.20.7159.020; Tue, 9 Jan 2024
 00:05:45 +0000
Date: Tue, 9 Jan 2024 07:36:22 +0800
From: Yan Zhao <yan.y.zhao@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH 0/4] KVM: Honor guest memory types for virtio GPU devices
Message-ID: <ZZyG9n0qZEr6dLlZ@yzhao56-desk.sh.intel.com>
References: <20240105091237.24577-1-yan.y.zhao@intel.com>
 <20240105195551.GE50406@nvidia.com>
 <ZZuQEQAVX28v7p9Z@yzhao56-desk.sh.intel.com>
 <20240108140250.GJ50406@nvidia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240108140250.GJ50406@nvidia.com>
X-ClientProxiedBy: SG2PR03CA0105.apcprd03.prod.outlook.com
 (2603:1096:4:7c::33) To DS7PR11MB5966.namprd11.prod.outlook.com
 (2603:10b6:8:71::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB5966:EE_|SJ0PR11MB5005:EE_
X-MS-Office365-Filtering-Correlation-Id: 04712176-8e25-4ecc-99f4-08dc10a6ba37
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ddlkNxDyhExQxVqCfCSCmNwBXwpAm7ZA2mnVn+77E1zsGXrYy+V0RPftRrYK/8QIRWi7Axd6u7Q7agWnGOqI7kVNDVYJK9KKnifOJaZ000C/4AwFRrH+vBupggZnUt9PlvZRl/u9+O95eMNAZm9bBVc82s+/pjw8ubfnEXjKrJr4dv7ojmXTasnuG5Vyw0wCRLxnfEsY/soTfKll9sfDzA1wu+U9YT24hHTWgvIWsSg8Hph/ogWVQBEwBO+7OvW4qOxOsAnejPSVHmQ02FWYuPCTy5AfkrcOglVWc47uMAG3Ih04fCyvaOGjGlCm5ViWo8oPRkJaUByFlI7y4pajti8+02J6spC2LQzcIU+xTKo3aCbHxJfyeiCqf84SEmRID3tZ/KvSWfDgRY2d0tSB3lihbYDu0ii/b47mM4UVYR1K6WIQ+3jsM/ua4qjkdbx1PJZ+xJhQ2FO46CV/fe9wj9yNTLNqN0tLWjb+jTbVNFC9KD02+l/dtEdrnls9kyouup07i8Hd/5B9hUUXXRX3EzEPYhi9UKLsJhkrBlRE0oAQWRNHysVKQSl3grW4U15M
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB5966.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(136003)(376002)(396003)(366004)(346002)(230922051799003)(64100799003)(1800799012)(186009)(451199024)(38100700002)(7416002)(82960400001)(4326008)(41300700001)(3450700001)(6916009)(2906002)(5660300002)(54906003)(6486002)(86362001)(6666004)(6512007)(6506007)(316002)(8676002)(8936002)(66556008)(66946007)(66476007)(83380400001)(26005)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?tMWWZQ/9cgMYQZP+dixDdkrkN9jjXKl7D3w3BUh2odfcaGnf42wxInpwKn8m?=
 =?us-ascii?Q?KQINpPKATuXTuT12fwcMtnwiNeurtc43nTVQXredzPii2y9hnV/+TJrbrfaL?=
 =?us-ascii?Q?9g0dAKe9/qCDTnXqM7C5yoPkD4UE/s+oQiTLu/bEDS/O0NAK+G8y3262AZqq?=
 =?us-ascii?Q?iqbEPyKSaVQjSdZBil28QaH3MQX45KnCPXcTb18sVSfNoeI/q2xeP8fK62Rj?=
 =?us-ascii?Q?e2x2+VKDMsIeuWXu77CRumdoU6Qb7u3Bn/yS5EhLQWPvITCQ/x2dt3zmQTbR?=
 =?us-ascii?Q?TBHBaEiOlORglxS+1XbFfZLAt351QdByzDkJjQFXnI6lvVuqoL/u2j7aDPwD?=
 =?us-ascii?Q?cq4bfeVqQk51lTrTmxaRqVbBMdigjtwaxpAE66ZazAAhghO9sZaftPdu13Qp?=
 =?us-ascii?Q?R2N1bqSPo1sh8db3p0o5TgBbm0eqvWOALyiFSZ0m/sc3paeidtYU1sO5dBIR?=
 =?us-ascii?Q?LOADrgQKXmV6GyOMebnxraY+1N7ISDjIa+Bbswgw1oCdv5VtNSA3Wwlznl3q?=
 =?us-ascii?Q?V2A7Qe4zWyCjjpkq9c585a7BdPwftWtD8Z/SXAB01R5YXWrBc8LuVZHlkm+Y?=
 =?us-ascii?Q?fFeBYRxhA2QJ+ufCTwN6ymGFpBJcIvCYTjx7j/rr2787+i6n+YNLiiVLTg3n?=
 =?us-ascii?Q?Eo7feGS5qOm31VLFjlvOKgm7eloqyLf91DvUsZOHRMZOlV5u6We6Y1ppuRju?=
 =?us-ascii?Q?X6N4hnOYl5OPLebl1dyS5qGdwP2Q7F4TMYOnikv0n4Uq7x9y/nbZ7lneJNKt?=
 =?us-ascii?Q?ssh7mrOYxqfePY4SaT8jO9VYDlYqhXecOnEg8GrhL1k9mefPo8uunbYva1wd?=
 =?us-ascii?Q?WLdjAxKyOUzIMTBfcpfc46MS8H6DLo5DaOYnqSVJ1ce3hWpQVCsA9ESEuNdR?=
 =?us-ascii?Q?KrIBRq1qfHnaLc7D4GHH1/4M6DEB9fZLW7L7dGBQGcrPvau5sEae5TsA7CO7?=
 =?us-ascii?Q?zHvCz5cGI4WWNMIX+e+qzb3ASnOdr10jNxHFqh2Vq5uYmcEqsTYTM5yfAJJB?=
 =?us-ascii?Q?4biK6zxudP5WiIyoC+/l9F1MhugFFaKsDdYAPw+PT33eM7ZnxqHYrf1eFF6p?=
 =?us-ascii?Q?2SPpNEm03icdoHGMzLYrd6dm+nvhuo7123bRz3VtLq1Md3tcic7RjXympu3g?=
 =?us-ascii?Q?ZMvaSGtYTOHA3rFk6Hp78nsz+oBhmy1Z84rkzYdj3+ssHIS0Nu5nIVPMqaM/?=
 =?us-ascii?Q?6c/26nxzEWKcqiXcoDa4bi9uBlF50DQjD2dBcjLy8mhpZi5rDa+vTW3+KWDJ?=
 =?us-ascii?Q?apS6aF9hi5E8Lcopl9YAJIeFGpGNJLGDYojkKEDdKXphABM3J8C5mEU9nchw?=
 =?us-ascii?Q?jCYOxsARi5AO0beuuvXqWrpvY33f0bhK3J8IcxWCqXToodDEm4eVmN3OTBto?=
 =?us-ascii?Q?KRecZN/gesGQmB2VdZheWL51oH7ksxr8aSgeMgoqRTc+NV3yRCEh1mW2Fqg5?=
 =?us-ascii?Q?RyvqPpGAG//3e2iO7WBwGiMR54oPCYp+Uj/k7SXlfWqb6yABhAWXox4btDI3?=
 =?us-ascii?Q?j3HyP/K1C5cl/4CqAE9pV73wQENLaxrnBm8bQKo2AJ3JgByas2E6L9TNyenp?=
 =?us-ascii?Q?2+qsqcYHG6IHrFdRHmADopFJ9754MWHK3xYlHgvn?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 04712176-8e25-4ecc-99f4-08dc10a6ba37
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB5966.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2024 00:05:45.7184 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uc5IoAkvdNXW0EIgdh6hVmh+tY0uNks9dQmZ6arcsOJ3EIE2lOAGfturXaP9KLD5j3Lkwkgl8atg8niL/c8PMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5005
X-OriginatorOrg: intel.com
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
Reply-To: Yan Zhao <yan.y.zhao@intel.com>
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

On Mon, Jan 08, 2024 at 10:02:50AM -0400, Jason Gunthorpe wrote:
> On Mon, Jan 08, 2024 at 02:02:57PM +0800, Yan Zhao wrote:
> > On Fri, Jan 05, 2024 at 03:55:51PM -0400, Jason Gunthorpe wrote:
> > > On Fri, Jan 05, 2024 at 05:12:37PM +0800, Yan Zhao wrote:
> > > > This series allow user space to notify KVM of noncoherent DMA status so as
> > > > to let KVM honor guest memory types in specified memory slot ranges.
> > > > 
> > > > Motivation
> > > > ===
> > > > A virtio GPU device may want to configure GPU hardware to work in
> > > > noncoherent mode, i.e. some of its DMAs do not snoop CPU caches.
> > > 
> > > Does this mean some DMA reads do not snoop the caches or does it
> > > include DMA writes not synchronizing the caches too?
> > Both DMA reads and writes are not snooped.
> 
> Oh that sounds really dangerous.
>
But the IOMMU for Intel GPU does not do force-snoop, no matter KVM
honors guest memory type or not.

> > > > This is generally for performance consideration.
> > > > In certain platform, GFX performance can improve 20+% with DMAs going to
> > > > noncoherent path.
> > > > 
> > > > This noncoherent DMA mode works in below sequence:
> > > > 1. Host backend driver programs hardware not to snoop memory of target
> > > >    DMA buffer.
> > > > 2. Host backend driver indicates guest frontend driver to program guest PAT
> > > >    to WC for target DMA buffer.
> > > > 3. Guest frontend driver writes to the DMA buffer without clflush stuffs.
> > > > 4. Hardware does noncoherent DMA to the target buffer.
> > > > 
> > > > In this noncoherent DMA mode, both guest and hardware regard a DMA buffer
> > > > as not cached. So, if KVM forces the effective memory type of this DMA
> > > > buffer to be WB, hardware DMA may read incorrect data and cause misc
> > > > failures.
> > > 
> > > I don't know all the details, but a big concern would be that the
> > > caches remain fully coherent with the underlying memory at any point
> > > where kvm decides to revoke the page from the VM.
> > Ah, you mean, for page migration, the content of the page may not be copied
> > correctly, right?
> 
> Not just migration. Any point where KVM revokes the page from the
> VM. Ie just tearing down the VM still has to make the cache coherent
> with physical or there may be problems.
Not sure what's the mentioned problem during KVM revoking.
In host,
- If the memory type is WB, as the case in intel GPU passthrough,
  the mismatch can only happen when guest memory type is UC/WC/WT/WP, all
  stronger than WB.
  So, even after KVM revoking the page, the host will not get delayed
  data from cache.
- If the memory type is WC, as the case in virtio GPU, after KVM revoking
  the page, the page is still hold in the virtio host side.
  Even though a incooperative guest can cause wrong data in the page,
  the guest can achieve the purpose in a more straight-forward way, i.e.
  writing a wrong data directly to the page.
  So, I don't see the problem in this case too.

>  
> > Currently in x86, we have 2 ways to let KVM honor guest memory types:
> > 1. through KVM memslot flag introduced in this series, for virtio GPUs, in
> >    memslot granularity.
> > 2. through increasing noncoherent dma count, as what's done in VFIO, for
> >    Intel GPU passthrough, for all guest memory.
> 
> And where does all this fixup the coherency problem?
> 
> > This page migration issue should not be the case for virtio GPU, as both host
> > and guest are synced to use the same memory type and actually the pages
> > are not anonymous pages.
> 
> The guest isn't required to do this so it can force the cache to
> become incoherent.
> 
> > > If you allow an incoherence of cache != physical then it opens a
> > > security attack where the observed content of memory can change when
> > > it should not.
> > 
> > In this case, will this security attack impact other guests?
> 
> It impacts the hypervisor potentially. It depends..
Could you elaborate more on how it will impact hypervisor?
We can try to fix it if it's really a case.

