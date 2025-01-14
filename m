Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57EC3A107F6
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jan 2025 14:36:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3439710E2B2;
	Tue, 14 Jan 2025 13:35:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="HHO8JSa+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20612.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2418::612])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9ECA810E2B2
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jan 2025 13:35:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uYjD65Ums/z5lq44ly2oAZG7BA/0D0WQKuwF5tdbLqcT/wM9XKtRJXvFlp/a0izU9oVHbHhpgykYg2JEmvGQCfGxh9sJogXY7tS+K4z2vdmUCcYIsb1yVaJ1HfnZsK0rbix42NDXWqEwxf4MNz40jk+ybvepFDGhzFzkfDsql9vKKAdysEVV5r/9vgXHILt4fX9zXDeGPwKJEDMkpGi7xJE3xb56ZvJvSS6jdoWSNSKhgPFJHuPYG02fpmw31m4FprPQTTnNbdeVs2slVCdq27a+CgtIhASRZO6hkirPI54IGl3yEvoyD5N1j7KuJdH0lrPU0vaqVKhag0gBcNQS2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bCU+np2FymwmOa/p/iANc4AkUige0f+/xzS42iKYUNM=;
 b=duz/c0GNeIovZdyp+sWcDnDFhow9ZKc9ciN4WxILB151Ty/C/+JDUbwJooIpaaQ9toVvhq+cH7QC0Mm5DmmpKBHxmFpmi2hB6+TjcIDSs/muwJ44Roq9hr3YvwLBy+sDATGGpndMkChiQTeR1C44wDkkPCfLWked8vPxXHPNF7vfHud0lzDVBDBN6bwHqI/9YiRea3CWYo1L8x4YUXhmM7tDgBBHAuufRHjlkvPsm0n4Hrst84qQnktnOkYsHdV+xUYYaqYE9QzxO0Q0D+qw5Vy0/5Nnxj1hoscVGFP1Z4/r+NNkcBAZtc7L17FHSoRpn6ZSFf8a05eM4LB02QkbaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bCU+np2FymwmOa/p/iANc4AkUige0f+/xzS42iKYUNM=;
 b=HHO8JSa+3GYVq8kR0hAVXF1o4f7yBSLnp45+myO/kqOfgDiQocqQvtrBCidKqcoruzqmpD9JEHPxDrR74ZaHI/NoKyYUzumxWpVzfP9UTG/9MxL7cE9ZEuWjX7aeeOZ5OB1ICkdP/fDaOVcFMn4YwPF5b5+mmFm1sAYjzPIcNUBqDJcmI7p33+cN1om79rcRn2xDvchr4tpTOL09xraEZ0/dLNpTI4U1s17JBwXkTyeO66F9ykIQ+bJiPs2C5ABm8TalD2rgiFVre04O/iyXPMruxbzYo0532GPQHAbEE4fAmokz4HWp2TTOt7ABAa4mkr2O8NkXGZek4g/NJd1XLA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB8659.namprd12.prod.outlook.com (2603:10b6:610:17c::13)
 by MW4PR12MB7429.namprd12.prod.outlook.com (2603:10b6:303:21b::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Tue, 14 Jan
 2025 13:35:54 +0000
Received: from CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732]) by CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732%5]) with mapi id 15.20.8335.017; Tue, 14 Jan 2025
 13:35:54 +0000
Date: Tue, 14 Jan 2025 09:35:53 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: Xu Yilun <yilun.xu@linux.intel.com>
Cc: kvm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 sumit.semwal@linaro.org, christian.koenig@amd.com,
 pbonzini@redhat.com, seanjc@google.com, alex.williamson@redhat.com,
 vivek.kasireddy@intel.com, dan.j.williams@intel.com, aik@amd.com,
 yilun.xu@intel.com, linux-coco@lists.linux.dev,
 linux-kernel@vger.kernel.org, lukas@wunner.de, yan.y.zhao@intel.com,
 daniel.vetter@ffwll.ch, leon@kernel.org, baolu.lu@linux.intel.com,
 zhenzhong.duan@intel.com, tao1.su@intel.com
Subject: Re: [RFC PATCH 08/12] vfio/pci: Create host unaccessible dma-buf for
 private device
Message-ID: <20250114133553.GB5556@nvidia.com>
References: <20250107142719.179636-1-yilun.xu@linux.intel.com>
 <20250107142719.179636-9-yilun.xu@linux.intel.com>
 <20250108133026.GQ5556@nvidia.com>
 <Z36ulpCoJAllp4fP@yilunxu-OptiPlex-7050>
 <20250109144051.GX5556@nvidia.com>
 <Z3/7/PQCLi1GE5Ry@yilunxu-OptiPlex-7050>
 <20250110133116.GF5556@nvidia.com>
 <Z4Hp9jvJbhW0cqWY@yilunxu-OptiPlex-7050>
 <20250113164935.GP5556@nvidia.com>
 <ZnDGqww5SLbVD6ET@yilunxu-OptiPlex-7050>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZnDGqww5SLbVD6ET@yilunxu-OptiPlex-7050>
X-ClientProxiedBy: MN0P221CA0009.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:208:52a::27) To CH3PR12MB8659.namprd12.prod.outlook.com
 (2603:10b6:610:17c::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8659:EE_|MW4PR12MB7429:EE_
X-MS-Office365-Filtering-Correlation-Id: 30ba289e-ccc0-4a70-1139-08dd34a05e4e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7416014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?0yFuPRrd9VkmSwtFfxP0buZGCgzV7B6x9HMKz9XE5h1KvsM3RrPN93YyIP5/?=
 =?us-ascii?Q?zEPYh48AxWac2IfMadmTwwqPanzXErE0h7uHX0Bm9H6OZrRKiFPLf6yLOE36?=
 =?us-ascii?Q?iJprNXof8uqj2xG9Oa/ztpKYpYAwUJHm4S0UWeY6IZafgPergArPCJxVBMhT?=
 =?us-ascii?Q?aLKm6gVTvWY/0g6vT4i/CgzEG5aOxPR615zKinbw9JejTlH6GpldXvSoBmVt?=
 =?us-ascii?Q?+T674ftnbDPveDvsFCRt/Tjr0PAtG4MSXiUHYs4xJBr7Lj0agOhLzd5a5yFp?=
 =?us-ascii?Q?VgpgBlEtEggrfvxV7i2w5pB9UBtIj5XbzPPg4ZhOZBIMh95vA5ZUZCrxXwOq?=
 =?us-ascii?Q?gfZhs6ct26OjzPdHwzsxU/o4oVHquQyTxO220rsKvaHCJNCg+O/m3hTM1SMF?=
 =?us-ascii?Q?TCUVObnsJVf8ht4bAnI0iSfzAP1Wnxdtg8F6aNNJAc7X7L9qc63QlG/bk98+?=
 =?us-ascii?Q?fdVn/Ca1R1LRVOVoQTIG68KSvud9MsY7GhtnMT6veicc5/ZGNqMlaEVuDzGO?=
 =?us-ascii?Q?NtIuSikp82bMy9az2eXAbMwtnSMkE8xm1f3twyo7Sxy8ouLd/Y4qRJvDkunZ?=
 =?us-ascii?Q?0ujVZLpcMY5AtkE1aQSlri6Nsu8N8QAnAj2izCrVzEa/e5Coe4+B8+fyBXkh?=
 =?us-ascii?Q?TPgjgB58e/LI0QSSUV0uTULQK0zRBHez8LiAESvxbxTArAQIVDAgr5QFjBTJ?=
 =?us-ascii?Q?ONFrRQOTv0Z6WVRCsfhcRfoYvLR9ptwUVfeW1xrSwGSpxTnPwQalxdT/9bQg?=
 =?us-ascii?Q?p4viL9abA8R/T+zh+SxoLvyVG5CGQvmwyOstmxvZyAn7b1DpXE5zVKmIUXC/?=
 =?us-ascii?Q?PhnXC3Bgq/BrL45HsPksxKE7jCPECss17jzs6OFBPweXPZyogeWtlLwX+xqk?=
 =?us-ascii?Q?q2ErhpoCSQagfUN58Bt8QrbONg3JKu6p0ljBeumMcTbw+317Q/Zf1Wa9RSX5?=
 =?us-ascii?Q?yO7NiItkBChi6u4M1Gb6KY2pKE1c90pkTa7x5+J9oDdBQq8RX2awxDB3UQNF?=
 =?us-ascii?Q?YEvdyjri8ByVcGw8N5zDy65CzTK5OqKB/8gdIgWictfISTj5Q7tio9XaBaLa?=
 =?us-ascii?Q?LNzfPSPnZBET4hrRehWg4oMg85GZO92jNhJSldNoQ8bF0j2ErIZ90iobF43V?=
 =?us-ascii?Q?l+eeE/iupftGrG0o5XqXQnvMjb0LCVvZGl2Ddw/XmVbtvSBG/lkmlLrrjUQm?=
 =?us-ascii?Q?TO1W/0qM5/jN+CHhb1pbK7qi/vvhr+Kt1njllRaocfjhHZcJtw4JXx/aaFWC?=
 =?us-ascii?Q?j6/Ae30A7vlAgaxFfLB6k7rNvs485fdfmYkGmJCGKkOyYbG5am/IlQImKvBe?=
 =?us-ascii?Q?AYIr2ou2gPzyuZ6yeq2oRaFMHssTWP/ML3sqSDoX47GIOge7IcLZCeiq463+?=
 =?us-ascii?Q?21vKoGdauCNnj8r6o++Ett5scjn0?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR12MB8659.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5UXR6/W3S0tjJrCmeutoNh8JhYu5M8+4SPOkHpWRqEauki9bQT4V37vwUdTS?=
 =?us-ascii?Q?SDMC9zZCoaxdFb6cifJntqtvePmpDFGS4acHfwNwjaBw0TrMqlimoeHJBZsl?=
 =?us-ascii?Q?0mm4aAIBr0uk5V3y5pDtDV/4Vrbckc62j1F5A+J/hTh+YiFMpp3+RWDcj3LI?=
 =?us-ascii?Q?ygjK9fH832DrDgXF6cwZ/YYqp/rX66vD2Dm17CRpUaUscGKHLNjq2Nfn/2Om?=
 =?us-ascii?Q?6Sd2im5TzFQW+HFm0/RZjl43wa1df8VRfWSIPcCgUDX7qDezKG4pPb/YBkob?=
 =?us-ascii?Q?N9fs1qY6N9GaGyWNffKdYRoqBN7k6he54tzviouToZptQVNZLd2yPVwZOg4O?=
 =?us-ascii?Q?CmbhRNpQIn/LwIE3WeamWh1wuXMcpSLHzPauajurqHyc0E7dd7FTxFyWMMt8?=
 =?us-ascii?Q?uBFTwkStk1/nHHSqT6zYV4b88aBKKq/ZAEoWooqxYQCLX9VriGQQnmRXunHG?=
 =?us-ascii?Q?pdZwebZ7egYekyLR32cjY3wt121yrH0xHEeklCSTBdouzMn4HMgTyjDekQ+s?=
 =?us-ascii?Q?vpXJvM+0ozVbmpBKuFe0szgxsvaAK3iR4VUlZDzar2c4b7QbdqvTLgWa2u/s?=
 =?us-ascii?Q?8auJhJIfJPgrIlrin1YOWyQuDHGKG0X4bxYA63k68/Oj/vg9e5lgB+t0qlbO?=
 =?us-ascii?Q?GCo5a/sKjhb/YHFN6QTBwZZvBBFlLsCWDXsr+oHmTQ2y7tyfGCL0SEtt+LfI?=
 =?us-ascii?Q?VDTcBAhfe07ezatyfYE8LK1OZf7OI+/EUZAutF5qUK4XuiXzqxk9O5vY4hGH?=
 =?us-ascii?Q?IBmUvqhodBVfqF16FeuBuaYFwmVNT0Gsu9kvrqlNM3oKUIhhlbHp5LjbaLKO?=
 =?us-ascii?Q?nAlQr23cwrEYWIwUh6VN/V/k9t5RyDMfihWI3jA2emRuZokjotNZkH9qcEX7?=
 =?us-ascii?Q?FsXX4WB3dza0gyFjph61yGe/ZkCbdXtWTO2zfRgtIRNbpZjtS7Hkvryu3334?=
 =?us-ascii?Q?N/hMSPd9YM8UDQZUlsixVRxOyV84qoX+tElgi2MsQ3xq0Reuyf8dy5xGW4rB?=
 =?us-ascii?Q?TQxJ7FguUvXNhud7tIXofrQUSeDHOC5j0nm1V+CPRCRIpeY3y8RNegVTpxDs?=
 =?us-ascii?Q?PDxHssHsL8Kpu3qBb34iP1hDjYvbyGyvfIyyT/vDXq8bN7mTLD7uX95BUWbT?=
 =?us-ascii?Q?kl283gtPcR2ONnbrP7eQjFlEg1cZOvZh08N7op18rOAv2YyOkd+NsTOGkhEz?=
 =?us-ascii?Q?C8Y09NOv2AXtBkz4rrEzNi8TlJa0D7nTlbKXOQ2iy81D++J4E1A78euyz/rH?=
 =?us-ascii?Q?T9RX14yKUnR9BxLlFrUZHw196h1d8OcL5rHNzY+HNx6a5ny0uwXdaejhNcJU?=
 =?us-ascii?Q?kqizxeyT1ayiUeGbZtkLTcbR+CCpmjeco+T5ORWbGOHw7thRYPhKUXmmhgLR?=
 =?us-ascii?Q?DU+g7XwUlKK0ku+aF3HqIIPtlejOwjKF1uTIdpDPAo7qFS3/JvTQIEE3aEys?=
 =?us-ascii?Q?M1hNG2Jt2wuG1Qeq0+kqeglELavgeORS1mqlsXO/mnxc7CPlUVM6933NxB9w?=
 =?us-ascii?Q?p1e714V/x6jIMfp5dB8dwcqDnnHE8CyTKA896oVQmMOPnzicGLAh7VLytN0g?=
 =?us-ascii?Q?PHCH49jkYj6oOz6gjDgzOTwLcTeBvk0YgzbcF1Ek?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 30ba289e-ccc0-4a70-1139-08dd34a05e4e
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8659.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2025 13:35:53.9649 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7zzE58AxLoYG8JOAVdk6cXd374T3Zu8pDLga+4TU4RT/EWnHF5Cys8Jt/6EY0Ahu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7429
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jun 18, 2024 at 07:28:43AM +0800, Xu Yilun wrote:

> > is needed so the secure world can prepare anything it needs prior to
> > starting the VM.
> 
> OK. From Dan's patchset there are some touch point for vendor tsm
> drivers to do secure world preparation. e.g. pci_tsm_ops::probe().
> 
> Maybe we could move to Dan's thread for discussion.
> 
> https://lore.kernel.org/linux-coco/173343739517.1074769.13134786548545925484.stgit@dwillia2-xfh.jf.intel.com/

I think Dan's series is different, any uapi from that series should
not be used in the VMM case. We need proper vfio APIs for the VMM to
use. I would expect VFIO to be calling some of that infrastructure.

Really, I don't see a clear sense of how this will look yet. AMD
provided some patches along these lines, I have not seem ARM and Intel
proposals yet, not do I sense there is alignment.

> > Setting up secure vIOMMU emulation, for instance. I
> 
> I think this could be done at VM late bind time.

The vIOMMU needs to be setup before the VM boots

> > secure. This should all be pre-arranged as possible before starting
> 
> But our current implementation is not to prepare as much as possible,
> but only necessary, so most of the secure work for vPCI function is done
> at late bind time.

That's fine too, but both options need to be valid.

Jason
