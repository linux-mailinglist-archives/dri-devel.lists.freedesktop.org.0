Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06134B8973F
	for <lists+dri-devel@lfdr.de>; Fri, 19 Sep 2025 14:29:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 380A310E99C;
	Fri, 19 Sep 2025 12:29:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="sSCclHYk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BN8PR05CU002.outbound.protection.outlook.com
 (mail-eastus2azon11011025.outbound.protection.outlook.com [52.101.57.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E23510E99A;
 Fri, 19 Sep 2025 12:29:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=COrLehb6n88nC1xv9N9qFopXYhvx722g591vNxHww+qvR8f0PbCc6Kbt/KsI5RO9K30YaqR6SRXnndrfE9LbVTruiDm/Z167FtpEbp6/qfdV9DBeRnstCKvs21jx8sJs360PLr8f4j6G9G8koNPNB4rCKzEa8qYjAMLYpRyEyhQJgkBoBEZkB8vQRryfA6WolFFjnKLwdgocbgnJ2IfbO+q0Zfk2CXZ/0lCft1euKcXXvQi20dyGMmhioeOQvCr+ZNYBxY7aFo8ze0R/j4LqFNedQftp1uqcXEwkJwFV881dKofVvEdQlbjw91zk3iUmUAILwTICyEwXcvtT+FY6ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XbhceQlyG/Q1W52CwRtaKpUp/7E3zpGmb9IZZ7QvGh4=;
 b=LcqxCfGT4/TwAtQi95gm1hmEuHdpT5h6kpm4JeRfzO6ETaafalDMyv7LSTU7WAMiZTaprjLk8n1DHb/F687GWCndfzn13KLJsq+xNFk4iMx3GbPmQ9s46WfLO8VIN5dzxbHg0u/AimyClfnhKYb1QdunykxMIjgAlPAD3IAr64muWlC3SqIaJP/LjaN2SeHbu23p2zhIWprJtFMzgtSvtivgNAnOe5p7M620WQa1csgYD9tVQorp5l88KQyZ48q9+HG2JjXq7VlpScBFsj8YWggvZjmwsRraVsdOKtIvCJ6ZJISju2AIjh5FSYPHYL+qOTIIaQK/4Kv/ENS+O2S4vQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XbhceQlyG/Q1W52CwRtaKpUp/7E3zpGmb9IZZ7QvGh4=;
 b=sSCclHYkHvMVXxA+Z+zpYzyljU0pHY9tfTSjxhzloL5jSaZU1m582E3QFVTDPk09gFDgOMQLbG+ccd+7ucZvBCKUncEzVXHUjenxgLIqBUgUD1U2z4vnnPiT7FcLQ/q+Ht7OvszGCtQ5o6n666yr85oyZh1lL/9/wBMPwyDuCsmVdhspUTdqbdY6w3jo9bycQWrxj3sXXtPONfbXw3uXpFJcXog9Wlfb5eTUOD/cExZA1Xz/35IJOOzRUX9ivX9pzyfrj8fBYcTM4UERB6y6H5fnwDtQs5mx/yXKm41RhryI8K0oYWHeQhpsZYenXdwWSgy+8cqbOFuoVrakNwY3lg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH7PR12MB5757.namprd12.prod.outlook.com (2603:10b6:510:1d0::13)
 by DS0PR12MB8220.namprd12.prod.outlook.com (2603:10b6:8:f5::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.14; Fri, 19 Sep
 2025 12:29:32 +0000
Received: from PH7PR12MB5757.namprd12.prod.outlook.com
 ([fe80::f012:300c:6bf4:7632]) by PH7PR12MB5757.namprd12.prod.outlook.com
 ([fe80::f012:300c:6bf4:7632%2]) with mapi id 15.20.9137.012; Fri, 19 Sep 2025
 12:29:32 +0000
Date: Fri, 19 Sep 2025 09:29:31 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 Bjorn Helgaas <bhelgaas@google.com>, Logan Gunthorpe <logang@deltatee.com>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>
Subject: Re: [PATCH v4 1/5] PCI/P2PDMA: Don't enforce ACS check for device
 functions of Intel GPUs
Message-ID: <20250919122931.GR1391379@nvidia.com>
References: <20250915072428.1712837-1-vivek.kasireddy@intel.com>
 <20250915072428.1712837-2-vivek.kasireddy@intel.com>
 <20250916175709.GA1324871@nvidia.com>
 <IA0PR11MB7185186F6AB160AA7F8F0FF3F816A@IA0PR11MB7185.namprd11.prod.outlook.com>
 <20250918120431.GL1391379@nvidia.com>
 <IA0PR11MB7185C96268ADB5530B343ABBF811A@IA0PR11MB7185.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <IA0PR11MB7185C96268ADB5530B343ABBF811A@IA0PR11MB7185.namprd11.prod.outlook.com>
X-ClientProxiedBy: BN9PR03CA0262.namprd03.prod.outlook.com
 (2603:10b6:408:ff::27) To PH7PR12MB5757.namprd12.prod.outlook.com
 (2603:10b6:510:1d0::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5757:EE_|DS0PR12MB8220:EE_
X-MS-Office365-Filtering-Correlation-Id: 18c4ed32-1687-440f-7f96-08ddf7782fba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?PmhFApZEJbt9GLD1ffHpS+4jE9wzFpL458+Vs3UEHRLSOrPxET/TXM09W7pD?=
 =?us-ascii?Q?xA5kZQmDbeznq0w37Bq+81tT8bGkVvabARIzi9czdUeKVA5BsfQJ4ZPWU5Mp?=
 =?us-ascii?Q?qugHFxKo3f7uYtUErfvXE3phnzl5XdHp3D0Fp4olf8KpkpYFii5bTJ61gBLv?=
 =?us-ascii?Q?W2bqB/R/cjvTwXqhdJTrq2gs4v0a9YUsHvSjIyDzMEEwrB6hf4EY6kKaNtu7?=
 =?us-ascii?Q?djWJJ6lstR+vcdxBP5okmFBTw9Ks8DBc5ZNLYMYskJPHNkXbsfKMZaAWvUba?=
 =?us-ascii?Q?iB/jTmxJ5KGPWYQ7flg8Hn4UZvPqYD2JCWDin/S4mp4JGHDYiuCCX9D3rT3Z?=
 =?us-ascii?Q?TWgCYkYHXVA5DTSXssapU6qbk9ANgVDMIqMrYSbTTPUM55klHN0rFS4eRpQE?=
 =?us-ascii?Q?vmavGvDkt/tAqBVamuk8w2kAS8ZIOvsLMiwmlIzFDFsrShn4k9IRvN8fq+5T?=
 =?us-ascii?Q?wd3gY2BpT4g0JXEFDPCWzzoZmdOImg3l+FwvUf9QZyokhcI026kbhglmd0gG?=
 =?us-ascii?Q?lLQa7Kk5Xemtn1GLGWAkIdyFwDiWSR+tdFWmfRKQC5bQkEW7yjahSml02f7g?=
 =?us-ascii?Q?ElwllM2gdGo5tfzspHY2XZtf8cGO37GZcppVGrk+DOKZ09jy0Is0TYP7VFjx?=
 =?us-ascii?Q?xnndwsoUjpM+cSNAJOZpoNGdaWm0VgQU5qvtPtMmiBHTZSNK5Ti25yQ+p6jW?=
 =?us-ascii?Q?kKBNNRgdVNwXDmGHaGSAIoJR0XqrxbQ875HaAsms1GronO9Fw/yMw6+tlceK?=
 =?us-ascii?Q?MVpOQIXsZumGT3mJOYDiHUcPlN1G/mXiLsyxhODCaqNe95hocG1/FI75x5Nq?=
 =?us-ascii?Q?8GtVs8ckCWoZVCrmbwiffZkY4uPeIfrqUSKl6g5WkyVhA5/xzVSuLzKUlhZT?=
 =?us-ascii?Q?SO+NlSiSBj+x43RoifqUmi+b+RZiBLn9czuKXhb5wO9K17fGTlGb1P9J4Ljx?=
 =?us-ascii?Q?q37OesJPJBG0poNW6PllV1Fo78O7fhdd1AILQWxzG4MfqqE1gNiKbng2lqaF?=
 =?us-ascii?Q?1YSZFaPA/izXoXEi+gyBhT4iVhPbUL1LcH0YEJ8/MoILwrsudNDEoPenSOBc?=
 =?us-ascii?Q?DZDOElUcsO/n1IkzWiFRvXCifISTA/fQpU4f22DX07HlHzjViHiHdf0Ngrxj?=
 =?us-ascii?Q?HYWqQAE1ZORbgOkBPpH7W5vaGVi2lON8rTCYpZRLZo6u0BJqrOybqlT80zn/?=
 =?us-ascii?Q?NroYG/TXLF3qMXXqbGVrzELfTLrKaIMHCUWYmGT5P3c2eerjLltkcbQ1eKPa?=
 =?us-ascii?Q?uDfdqCA73SS13XsHgw7SriPiOHIaQS55MMlpvodmAMiMhe2J2MjNM8X5nnGK?=
 =?us-ascii?Q?zZDf9ILPqe2+6uTXjWo7SD8ls6ulXX9nqbaFJVh4n61bdXw5Irgr2GfPG1dn?=
 =?us-ascii?Q?Kc3uMgivYLd6KAbTN32QfMD3O1nOwts4Ojut34VWfGaosn8P/hKNNvJReeND?=
 =?us-ascii?Q?nkm1E3U+BIg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5757.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?uWuEvI0rMXuQTxhDqJn60CA392pu5hujtKmcV0292LQ7Ih5xjUStcXPU0lZw?=
 =?us-ascii?Q?6Xd9cpnRlgj2ozqRZ+ejIhirCzj3Kmvg6N1ULQbTGkf/yQrEZzU9F3gdMZyN?=
 =?us-ascii?Q?2/ZagOUvJQHMTeWw+7iq0d8H8dv1K9WyQe5QYo0ZY+hzu9+ss5fMv6UNXO81?=
 =?us-ascii?Q?Bh9Zde7ncKzihJwesIakEdkzC0XPIcPyfCSTS9QtbAirDxmYobHNN0qQidiC?=
 =?us-ascii?Q?soTJfD71u0ToxTmpbfvyuftqvVIEyoUASu4NkkpxKg0eTY7GQZT+5WMqro+2?=
 =?us-ascii?Q?g2+o+5A+aNiCeEEF8rX2Kyp1p61oisG+I1o+yZpSDBwJ6BFJbkY6AQIghmpa?=
 =?us-ascii?Q?E2CGepScJjosUHX4m1rQT+XsvahcPdd4xNtfiM+F1VC79kmheJu8M5kBGidb?=
 =?us-ascii?Q?hkD8rqBx3pExsjpMaWdBK3HuA7nqSXn8DAeoByoa9qUZ+5jMGGGNLnBlbU93?=
 =?us-ascii?Q?W9eRuIvwf9A+PFzWxz/snO9bL9zlu9DFKkV00rFOy2Pk7Mu67V8+9qXC5yzT?=
 =?us-ascii?Q?2BgpGe5+S2yoHhsMdk9SIZgobLtENrBtnJXrUGnHKxMGBfN9LmKkzJ7DaJfN?=
 =?us-ascii?Q?f9c5et5F2w3vY5OSerTs+REcLHjYKABSfMwdx+D5DNoXF9k18pdppkWeDNHz?=
 =?us-ascii?Q?Lh7d0x4b8gPPf+hbYxkcl8tMEzCvfNBeRBe3mC4yaL3tyFjewJIC3FmMj3fR?=
 =?us-ascii?Q?zYjJ9Mp0XEv3jQBUhIVAbXsNwfwEDZHoRgioGo0xTNEzafg4fYwhNMMRyWQl?=
 =?us-ascii?Q?sNb5b87mWCHIY/sw6qRQOut8q/hfpixFRsw9p40I10Rnp2PCox0Mp6FDeUWB?=
 =?us-ascii?Q?EU7jLw0T9cU8vE1jYbIvhqCajsV4IbZDfyalJ49W+7eMNLlFLCnimOEGhnFL?=
 =?us-ascii?Q?kMuw9vb9W+HbMy+IBjnVd6HNiKB7FXLrJIauEcQbpAvYYY42QgebfUR/5egt?=
 =?us-ascii?Q?qVD0abB19lJg8zwK0C6OMs1wajTkGCmDcq5VIA3JxXZS6JSwWvW54eyxYwba?=
 =?us-ascii?Q?/r7f+4W6o9R/tysATeS9DDH6QDEiPotZ+zP8AxK2XT7t+0PWWhUcuyB0HHa9?=
 =?us-ascii?Q?1XSiS5G9Xnr2HByyqGhuFAQvG/O73mnrpfITehaCSjNrth8XyQTNPpVrdjpN?=
 =?us-ascii?Q?j5Q1ksudAw5vGjhmZ/ZhwAxRttTl+QOQOejy22e+8hbyNcTB+7BjsKsXFaka?=
 =?us-ascii?Q?vQwUCU0aDq5790uP1HGxOwZ3u4X8aPSyW6gOzINe5nsu2gkw4f2BhYjiM4R3?=
 =?us-ascii?Q?Km9uBiED0Ew5LTR23uDaMpYr+AvoK9JGOy9Pb3H2AyEKa95r2uEqxUcztJFx?=
 =?us-ascii?Q?JWEJEJliYWxmWI8eCownY5x1xoU7VmPcRMHLiGO8ENJUOSTXO4Vqtrk6Hc/b?=
 =?us-ascii?Q?Z4USgcacI79HtkDgRHhEWoZNH8fsIuCYltMwrP0xAsbLGEQwbFDkRUx1DdPk?=
 =?us-ascii?Q?gmBekpPudeGX8K1dFjQTEXtPIF+PHWizzzS97K/rXIOyZnBqpnMxuI4VAL3U?=
 =?us-ascii?Q?ZawGwk477CVdQUUSNK5Qw8vRq2xmSqdLwRaw4nA//E034gj14IzD9Jf58loa?=
 =?us-ascii?Q?+wC/+Tlt5GQ1lLMpuUvPktGVUOWm/dVk85ewFCd6?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 18c4ed32-1687-440f-7f96-08ddf7782fba
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5757.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2025 12:29:32.7396 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OzFI2WH2f3uQyCkxlTiRjm9O7ohAwuj531XI/d3s6JPbhdWNbdwlg37uXDaI3hz1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8220
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

On Fri, Sep 19, 2025 at 06:22:45AM +0000, Kasireddy, Vivek wrote:
> > In this case messing with ACS is completely wrong. If the intention is
> > to convay a some kind of "private" address representing the physical
> > VRAM then you need to use a DMABUF mechanism to do that, not deliver a
> > P2P address that the other side cannot access.

> I think using a PCI BAR Address works just fine in this case because the Xe
> driver bound to PF on the Host can easily determine that it belongs to one
> of the VFs and translate it into VRAM Address.

That isn't how the P2P or ACS mechansim works in Linux, it is about
the actual address used for DMA.

You can't translate a dma_addr_t to anything in the Xe PF driver
anyhow, once it goes through the IOMMU the necessary information is
lost. This is a fundamentally broken design to dma map something and
then try to reverse engineer the dma_addr_t back to something with
meaning.

> > Christian told me dmabuf has such a private address mechanism, so
> > please figure out a way to use it..
>
> Even if such as a mechanism exists, we still need a way to prevent
> pci_p2pdma_map_type() from failing when invoked by the exporter (vfio-pci).
> Does it make sense to move this quirk into the exporter?

When you export a private address through dmabuf the VFIO exporter
will not call p2pdma paths when generating it.

> Also, AFAICS, translating BAR Address to VRAM Address can only be
> done by the Xe driver bound to PF because it has access to provisioning
> data. In other words, vfio-pci would not be able to share any other
> address other than the BAR Address because it wouldn't know how to
> translate it to VRAM Address.

If you have a vfio varient driver then the VF vfio driver could call
the Xe driver to create a suitable dmabuf using the private
addressing. This is probably what is required here if this is what you
are trying to do.

> > No, don't, it is completely wrong to mess with ACS flags for the
> > problem you are trying to solve.

> But I am not messing with any ACS flags here. I am just adding a quirk to
> sidestep the ACS enforcement check given that the PF to VF access does
> not involve the PCIe fabric in this case.

Which is completely wrong. These are all based on fabric capability,
not based on code in drivers to wrongly "translate" the dma_addr_t.

Jason
