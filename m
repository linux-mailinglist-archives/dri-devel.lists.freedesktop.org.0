Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05CE7A15072
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jan 2025 14:25:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E9B410EAEE;
	Fri, 17 Jan 2025 13:25:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="ijaUI5S6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2042.outbound.protection.outlook.com [40.107.223.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F0E110EAEE
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jan 2025 13:25:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LUf33mAjvV9iUWs2aJ2ysoRMlapcVUkCH9+FzVj93Vt9J7Rsk7x3pdWnrWsz+I8dR0bowul4EbEYPBPFuAIChxvNAEjwviUIf+3u6EY2RziJfOmuO9AKKsN3NHeZfwcg/hzHBF/BAhlNlN/rnzruGuvp3TnYoJYSb76z32aTjSqHMnmLYGBEmTq8GyESxq+w+134kYO/qY01QStG2jMbEPrIZl/F/Lwrm3IfNAfJWCeN0+ptr2x6i3OLxvg2yhCgvtAQls4Y8jLTPKfMzrQHo8cp14rmD+ODxEdNg8lE8rZFKz+tdRbM73L0I4KULO4D1sCijZnpR3ePI7YsRbdgWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xGKHYR2Fwq47SysFbNURAgV3dgkEo0+vqBpFfprqJtM=;
 b=wyIk4DY2xTSfMQmnHYf7ugEPOfOfgqaMfo2XSLmJqAh0I1RxkTQwkvoKMpZuP8HpXFjxfazw0ZUt73Qak7eJKnuGVzIRGmYAWWoXU6Zz0wDxpWnnPbmQVVvKgSmWb4J1Jf7xe+FZRhWGjscc2te95r3OIB497Aj/dkTqQCwltb+FA+vE+0FpOkZ6D/vjp1kB9jzEqGNTBscXWAvTDvwF3fmJyENGU6WqyrbRZk28bL9PxQZXKF8OZHYr/Vpd4ZiP1D9pVCeC+3WXlss2NXilLsYsc1qdXtUfHHkV14SJEo/GGr791QlRQK6XtIw6OVoHojQ35rrOQxeybNVMQ7ExnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xGKHYR2Fwq47SysFbNURAgV3dgkEo0+vqBpFfprqJtM=;
 b=ijaUI5S66ypPdFXIWat7BqN0bWU/LidpPQ5+Yzv1wuNkCglhM/vdACatR7Dhv0CU5N/OgaaYt5/UMYzPYViGme3XdjNlkN1SU6ogLN9EhpyJ6G2zB2Hhvzxn/ctGET3/LCMcH/r+ZQzue9DJcybAcrR5wY5LzcgKmZwf+/w0yZi+fhimaGQye4q1g5zNZR1ZBn+VtPNmFHWOqz8WagMDLjAc0NMdYClTh/py6RIuQLXBr97DkqO9L02QRfQStHhFBLQoFcYZ7i8jnsRZvFoJAbA0J634jr/gn2r1aSjo7CRHxbcCxvRAlHX2Kfjd3BEHMORG0VuBe+UmDz8VXqyfgw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB8659.namprd12.prod.outlook.com (2603:10b6:610:17c::13)
 by MN2PR12MB4111.namprd12.prod.outlook.com (2603:10b6:208:1de::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.16; Fri, 17 Jan
 2025 13:25:28 +0000
Received: from CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732]) by CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732%5]) with mapi id 15.20.8356.010; Fri, 17 Jan 2025
 13:25:28 +0000
Date: Fri, 17 Jan 2025 09:25:23 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: Baolu Lu <baolu.lu@linux.intel.com>
Cc: Alexey Kardashevskiy <aik@amd.com>, Xu Yilun <yilun.xu@linux.intel.com>,
 kvm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 sumit.semwal@linaro.org, christian.koenig@amd.com,
 pbonzini@redhat.com, seanjc@google.com, alex.williamson@redhat.com,
 vivek.kasireddy@intel.com, dan.j.williams@intel.com,
 yilun.xu@intel.com, linux-coco@lists.linux.dev,
 linux-kernel@vger.kernel.org, lukas@wunner.de, yan.y.zhao@intel.com,
 daniel.vetter@ffwll.ch, leon@kernel.org, zhenzhong.duan@intel.com,
 tao1.su@intel.com
Subject: Re: [RFC PATCH 08/12] vfio/pci: Create host unaccessible dma-buf for
 private device
Message-ID: <20250117132523.GA5556@nvidia.com>
References: <20250109144051.GX5556@nvidia.com>
 <Z3/7/PQCLi1GE5Ry@yilunxu-OptiPlex-7050>
 <20250110133116.GF5556@nvidia.com>
 <Z4Hp9jvJbhW0cqWY@yilunxu-OptiPlex-7050>
 <20250113164935.GP5556@nvidia.com>
 <ZnDGqww5SLbVD6ET@yilunxu-OptiPlex-7050>
 <20250114133553.GB5556@nvidia.com>
 <17cd9b77-4620-4883-9a6a-8d1cab822c88@amd.com>
 <20250115130102.GM5556@nvidia.com>
 <f1ac048f-64b1-4343-ab86-ad98c24a44f5@linux.intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f1ac048f-64b1-4343-ab86-ad98c24a44f5@linux.intel.com>
X-ClientProxiedBy: BN9PR03CA0349.namprd03.prod.outlook.com
 (2603:10b6:408:f6::24) To CH3PR12MB8659.namprd12.prod.outlook.com
 (2603:10b6:610:17c::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8659:EE_|MN2PR12MB4111:EE_
X-MS-Office365-Filtering-Correlation-Id: 5194aaf6-1eae-47a4-842b-08dd36fa68a2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?WyqtTFj6IDOuupI86eM4qY3jDDe/AiXl34OaxMTlWTGSGf42EwBxaR9rFBmQ?=
 =?us-ascii?Q?QD9Or2H9Xd/5IdDNbMQ1+ceXQVyYCS3AWwPgDjI7jno3wGdgMrLq+SXN41xg?=
 =?us-ascii?Q?ZP8zy3y+66L5GhXmOFtsfiuiXriWejjXmaRS34oxuZKIwEspQUbHN0rx6TWA?=
 =?us-ascii?Q?AmgWcErg7lc63vUAzh6zPOhPMDIgglNN88YAdbjL4IaK29lHaGCg8wNUWLFX?=
 =?us-ascii?Q?Mt6V6nmYJhtZz+3BTIokJrwej1LZmGRJf3BUu8II2uAQ1yLjyKI/qUEKbk4C?=
 =?us-ascii?Q?pJLy2i0oMFyzwxRJ10qPjpt8PiFNQCkzCxt69yGd8dgxHDPBLxZ7CV2HkEzM?=
 =?us-ascii?Q?+OH6SUthHdqaB9OVzKSANUu/slpL78jw/irXGLQQoWLNaWiX639lVdJSRETK?=
 =?us-ascii?Q?F5WErGmbNqOyCc91z4kzQSPtMDW8lS8RXyB8IUed7zqeLwobHT/YYP0oRA2o?=
 =?us-ascii?Q?b6Dj0ka6KvtxNJW1g0voD7I2fsZ0hyL3qyk9doK+PyPHnTiF8bLISZvchJ1G?=
 =?us-ascii?Q?9Yqu8oO1WxdQRc1GCn830+pDVT6fRJP9nTxnlh5xAkLi7C86el+XoIH8Qmdk?=
 =?us-ascii?Q?D11DxS/NFUI28kCOgiOpoG/gei0deihnpu57k9B8tIcjd6gK5YOXlJBL3lr7?=
 =?us-ascii?Q?cNyP3i41r308xyF6jYMvShKABpEN3HeNMFGKqjlNpMugBKLIZ53FXjwnyUSH?=
 =?us-ascii?Q?3II5eMJ2dGjJNeVS2sdIRFejxTIk1GkSeMcGtPPG8NxVyvIiRnoAwnLYIrNy?=
 =?us-ascii?Q?QycN3tgPUjDLHZbryEcqFl8+3IICRAzVUJkKGWXyoCBQp8pDBsrm9ZhL79Zo?=
 =?us-ascii?Q?g7garkwbOhmWE698WGzvqeAGABp8TP3H7oRh9+5ODACw9Y81AXy7raU0G+KF?=
 =?us-ascii?Q?k8HaUaSb91KrjKv88DKHbt2jeTijqIZdJoJyxKxXo2nHmPFXVNYpv5yZVD2D?=
 =?us-ascii?Q?Y8OzF/KFplLBpK1XsV5Kt8IRHO8aIlP0wWZsZmrhATeL67xKzlN6w13uEGyO?=
 =?us-ascii?Q?yIpr4jQ4Z5ANU6tLdRemNaMnYYvmh0uxNrZoootnyWRkagz2qXBFJI4scYq4?=
 =?us-ascii?Q?7sQKcPamkSetmMNnbg05RJNEPqeh7CJNpOyqRZl4BPKDz+pE7DxfsioQD3zy?=
 =?us-ascii?Q?lBglnvFSfy1uDVvElElD5B29YJK0vBmphY6/O6+JBcTS+L2igF9B/nGlvHNt?=
 =?us-ascii?Q?n82ZaemEQMa7DByw844F61KQaTF6MVCfdeFiL+aDhHGMCe4kt6W7FH/lWu0Y?=
 =?us-ascii?Q?tnd2d4U+eqd3+DsJlBoNTUMtp7Y/m3OgisWzw6ZVtnp7/dVcOGHgf1+2c4zl?=
 =?us-ascii?Q?DbvUFAPx9aDeorqlYfwkPWh2C9w57w/yMuEQ5MOdbs0hsC2DlcP9liidNObk?=
 =?us-ascii?Q?vuK598Rn6aWSVOJV0UUhLpd8Glco?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR12MB8659.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?LxXTCOiFJ/KmafP0Tydh7mBV3eFn4Qv8Z96UVMhkGR90aB+wL+INV9pGf+vC?=
 =?us-ascii?Q?5vL4cOOoJaLBIYZ6dd9OMtpHwL9BAxBEvsjo2SOoUaJSoWt9ijYGcRkgaH2j?=
 =?us-ascii?Q?lM3Krg89L2flqWs7yrKXzmK/6/BINgPn18K2QyvCJw2egNqjBI7lxCtTkBCR?=
 =?us-ascii?Q?FgYfCl0EJ6FK/T8aZPdWT3e3YsN3AWK0122Pyf/AOuAAELU6DEVoGN42ZiZW?=
 =?us-ascii?Q?sfQKqW+nJtcskDKTYlt3mvtYUFjVKpsjTQR6HmVb/VAoFob22cMbqTQmNbgY?=
 =?us-ascii?Q?GfOH7XB1E+XHlD5Ld7wQ4SV9wsd668OnsxI2JU4VTcNnS6+l9ek2tbGOWFzk?=
 =?us-ascii?Q?mAhPrxY1D0I5zRVm/thQzUxAVQa+LUDWE8dXtM1y8129fclCe4urFyq8RpZL?=
 =?us-ascii?Q?8VBnKjj9ONpwqvxwZCvhX/iyEcuiklcv90e8owBSRIlH0P60AiXwwRyJFPBe?=
 =?us-ascii?Q?i9C2CWA0OkaRU4gt0HprHRWwE2t9p23iD7AlB+S5w2G/MSZ7FUVeoKWBxS5Q?=
 =?us-ascii?Q?KwCIvSBwWbNWHXwoPootdyUl9G36iF9qjw8ARuH2JgkBpogkZtL1SXCvgbBG?=
 =?us-ascii?Q?gJoX3xTIo7Q2T0iIvF8fiBqiLW5H9yuMJxtCnK+a9PD2vlwgRP3KE1d6MjzQ?=
 =?us-ascii?Q?ULYg8qOJSQDgTxFicROtCeUkjV4b0isy8+0YCGV11EpYqR7EmaeRSrsz8z6U?=
 =?us-ascii?Q?caRxlTclbF22y3YgoWVdE3NNHY9/9oKWogVYy9ABxjvrHMN8DO3XNvmn0oTf?=
 =?us-ascii?Q?P32DShxCbZkYl6MTERY+dLdVh058ZQG0+MuWnFsi2Z94N1QWJITqMEnbuegI?=
 =?us-ascii?Q?lLrNH4gf+H6AIF00yI7v3znt0xvUp+v5LCna4koQpdHn1xXhvYakccFneof2?=
 =?us-ascii?Q?DqLmFOa4Z46MbYXC/82McvJFqdWkKZYHwhuR0s1+o8UQXWOa5x1BqPDfm7GU?=
 =?us-ascii?Q?+u0/Fppn4zo14drLXTURqvpxZYIRk/OW/ZdrKsGJOGtxlek7ZXfTxAKMDV/k?=
 =?us-ascii?Q?mm9IbSrLFShca8HkqvAbZyaMkB64ugiX2BV9LHZ7PrNtvg/ASg69QttQuNX+?=
 =?us-ascii?Q?1xjzgGBepquAjJflIYz3CLoI0YwVFrkTKNT+qi6gRs7TZRdWWD6zBatAYZz8?=
 =?us-ascii?Q?qhn8Z9SEJ02HfAKQbVC1tbDWUWZPO9SrMVte85N9WIH/CUvMfGdgTAVsmS4q?=
 =?us-ascii?Q?mKw36k/Apkdrybd31/reEsHin3qMHS1KFuguyFd9dVoEPvkJoXp29M2szP9r?=
 =?us-ascii?Q?3ZfzpDZ6AiZ4P1CfFZnz/iSdbKlR8HEb1X9xtI2fGFtTz5wuCt2ZWq7pXPBA?=
 =?us-ascii?Q?Wukotaa/w+yOvkbSbY6PNhAdfuNHs0zKyFbssf+s7TvD2bQynsn/HhwDkLiA?=
 =?us-ascii?Q?79N/pvdIthjVcl9hGCpKZvji61rZwgku+wDxPdgJ1hVSXV2VK1ki24PKddE9?=
 =?us-ascii?Q?Ggvki7bFndduXqOKAhAlz9RrbPKHz796fsI1DTJ2+qmRqWFGcL8gPYF7OkkG?=
 =?us-ascii?Q?/+4ad6TgojyAj28KFfyOf2k1B5r/ehCpNlh8smrIcMmFBOUYDf1H+oPEAIKH?=
 =?us-ascii?Q?Oehapq7pyJjvkbgtGh1CuVPZGBFJzoEgvqCFckjd?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5194aaf6-1eae-47a4-842b-08dd36fa68a2
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8659.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2025 13:25:28.3989 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KQSlBu8FIPJJ31ByaTvO/E8lktCpLL1jaV7MTBMgDAuCKPS1bdXQuawUF2xEZyBp
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4111
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

On Fri, Jan 17, 2025 at 09:57:40AM +0800, Baolu Lu wrote:
> On 1/15/25 21:01, Jason Gunthorpe wrote:
> > On Wed, Jan 15, 2025 at 11:57:05PM +1100, Alexey Kardashevskiy wrote:
> > > On 15/1/25 00:35, Jason Gunthorpe wrote:
> > > > On Tue, Jun 18, 2024 at 07:28:43AM +0800, Xu Yilun wrote:
> > > > 
> > > > > > is needed so the secure world can prepare anything it needs prior to
> > > > > > starting the VM.
> > > > > OK. From Dan's patchset there are some touch point for vendor tsm
> > > > > drivers to do secure world preparation. e.g. pci_tsm_ops::probe().
> > > > > 
> > > > > Maybe we could move to Dan's thread for discussion.
> > > > > 
> > > > > https://lore.kernel.org/linux-
> > > > > coco/173343739517.1074769.13134786548545925484.stgit@dwillia2-
> > > > > xfh.jf.intel.com/
> > > > I think Dan's series is different, any uapi from that series should
> > > > not be used in the VMM case. We need proper vfio APIs for the VMM to
> > > > use. I would expect VFIO to be calling some of that infrastructure.
> > > Something like this experiment?
> > > 
> > > https://github.com/aik/linux/commit/
> > > ce052512fb8784e19745d4cb222e23cabc57792e
> > Yeah, maybe, though I don't know which of vfio/iommufd/kvm should be
> > hosting those APIs, the above does seem to be a reasonable direction.
> > 
> > When the various fds are closed I would expect the kernel to unbind
> > and restore the device back.
> 
> I am curious about the value of tsm binding against an iomnufd_vdevice
> instead of the physical iommufd_device.

Interesting question
 
> It is likely that the kvm pointer should be passed to iommufd during the
> creation of a viommu object. 

Yes, I fully expect this

> If my recollection is correct, the arm
> smmu-v3 needs it to obtain the vmid to setup the userspace event queue:

Right now it will use a VMID unrelated to KVM. BTM support on ARM will
require syncing the VMID with KVM.

AMD and Intel may require the KVM for some reason as well.

For CC I'm expecting the KVM fd to be the handle for the cVM, so any
RPCs that want to call into the secure world need the KVM FD to get
the cVM's identifier. Ie a "bind to cVM" RPC will need the PCI
information and the cVM's handle.

From that perspective it does make sense that any cVM related APIs,
like "bind to cVM" would be against the VDEVICE where we have a link
to the VIOMMU which has the KVM. On the iommufd side the VIOMMU is
part of the object hierarchy, but does not necessarily have to force a
vIOMMU to appear in the cVM.

But it also seems to me that VFIO should be able to support putting
the device into the RUN state without involving KVM or cVMs.

> Intel TDX connect implementation also needs a reference to the kvm
> pointer to obtain the secure EPT information. This is crucial because
> the CPU's page table must be shared with the iommu. 

I thought kvm folks were NAKing this sharing entirely? Or is the
secure EPT in the secure world and not directly managed by Linux?

AFAIK AMD is going to mirror the iommu page table like today.

ARM, I suspect, will not have an "EPT" under Linux control, so
whatever happens will be hidden in their secure world.

Jason
