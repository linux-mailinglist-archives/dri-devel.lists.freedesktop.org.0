Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2655F8273AB
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jan 2024 16:38:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A21110E0C0;
	Mon,  8 Jan 2024 15:38:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4533F10E0C0
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jan 2024 15:38:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UCVOoYYgQ2xdTggOcOa5MBLfLgYDNBjCpDACgXptLhUSVBsMsYpTxyiw2BXdqRXZNtuWJ8C684KCKy4uKLOisl+Yh4OYagm+8B+OIgJ9MHFX6f/yhjW875p701qTa+FIDJTqKcpswj3CldaRD+xAEktdb2jzo+oYl/9m8qnhEAbatZx7hYnQ1odJkGyufdBpfxqlpc5HMcYbRH0tnQ7BM1XT4MkWWozRJ+W2xErD2mGRmRegacmyHuqQ1iaK72YCZRB/r3I2E2YkyhC+3NreR5xC+UL5tWwZ2knGe0KgAdtxaaAZWIpoACpk6ppmsNAYWFkDPBJ8xgLMghkBJHtQsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yxhTpKlS64YB0ZoqBBx3ar0+K06/xCMs4QiqQFduH2w=;
 b=F++3b8PouFtvxNLzavSoddql0jpiSB7ascRcFRyHdosBnMY+gmETNWQ/ClX7XDEfyftTAkYvYEUMDlKghOpLtODtTqnU/1HDBL0ScHaYFC7bMOXPNGp6RQzVPrk+dJjMzdTRrQDeiffFnB/cAhNK+fpxpcBMY98xbiXs+WIofd+H1vy+OIzRmFHThXD/tB7sGsXjLtIjOa4wImCzDmKHKtfuVamOqR6Kme7DkpxfmHWczorB0yezS0c5E3NRVEF1Mjk2vWLsym6ldDH3Tmc4+/xJGShQUCnJdakeDysgrWARisJVete3lQRF29Cvx4derScKRgeZjcQLi8TH1T3r4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yxhTpKlS64YB0ZoqBBx3ar0+K06/xCMs4QiqQFduH2w=;
 b=PZzpU/WL16I2691dfBZC/+YjoewM+bLGn9ttdORFZKEksGt4bHlKgwD1UEdqK8Eiuhe75gwOcqdg1ol7BLHIiZvkOfdcCMszCNCft60GsWE8q1qlP3VB7/WZvwLUiMO3lDie7+jCcEFrPS4SA0lJOTkfd/YAJGNtHMzcTDM1bFOFP8BQkqc+2nP7/kKUzaqtuaWpetlzHpcDwWP6Fia82ife3QRXTytuHvjq97lPnGj0UYXnmwZoGRrIqsnzGJPX8OtfrBW7x7MF4FTQ6K6AZyiP6sGJXno5KDEfYNe/V6GqLQ6GNnBcaRd16uB9CvxGbbzPGJFbF+U4Neg3spPF9Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by MW3PR12MB4395.namprd12.prod.outlook.com (2603:10b6:303:5c::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.23; Mon, 8 Jan
 2024 15:38:19 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::60d4:c1e3:e1aa:8f93]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::60d4:c1e3:e1aa:8f93%4]) with mapi id 15.20.7159.020; Mon, 8 Jan 2024
 15:38:19 +0000
Date: Mon, 8 Jan 2024 11:38:18 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: Yan Zhao <yan.y.zhao@intel.com>, wanpengli@tencent.com,
 kvm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, kraxel@redhat.com, maz@kernel.org,
 joro@8bytes.org, zzyiwei@google.com, yuzenghui@huawei.com,
 olvaffe@gmail.com, kevin.tian@intel.com, suzuki.poulose@arm.com,
 alex.williamson@redhat.com, yongwei.ma@intel.com,
 zhiyuan.lv@intel.com, gurchetansingh@chromium.org,
 jmattson@google.com, zhenyu.z.wang@intel.com, seanjc@google.com,
 ankita@nvidia.com, oliver.upton@linux.dev, james.morse@arm.com,
 pbonzini@redhat.com, vkuznets@redhat.com
Subject: Re: [PATCH 0/4] KVM: Honor guest memory types for virtio GPU devices
Message-ID: <20240108153818.GK50406@nvidia.com>
References: <20240105091237.24577-1-yan.y.zhao@intel.com>
 <20240105195551.GE50406@nvidia.com>
 <ZZuQEQAVX28v7p9Z@yzhao56-desk.sh.intel.com>
 <20240108140250.GJ50406@nvidia.com>
 <ZZwTzsZqx-XSTKma@phenom.ffwll.local>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZZwTzsZqx-XSTKma@phenom.ffwll.local>
X-ClientProxiedBy: MN2PR18CA0002.namprd18.prod.outlook.com
 (2603:10b6:208:23c::7) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|MW3PR12MB4395:EE_
X-MS-Office365-Filtering-Correlation-Id: e47bb733-dd7e-4472-81c9-08dc105fd70c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pki/hrg6ZuhXm+NSzNYaK4Zb8nPwKmN3mK1wpeiyiEPS6hPI99bwKgqWsNYLcwNfKkH2m0XulSrJVUmjzQfYbLw1NKlIGk6xRuAA8LRj+X6q3qtb8uulO8V8m7eCJHb9YuqUcUipLCqR6OblnroAGv97D3U3qbUAWyGAqjssXzT02RgME7zQNe8brfsjO11t+0npelnt3uoMfNa5yg2HOrzogs4vjcJ/OPEPXWhuYn3IivG7lNbk2quEeLeeS9/iTVsVLFiVsgB5MR1q54DfmCcPWnlLjXFs4aiVc1Sa88PiDrVnhlUJmRmZYX8fG5O574yIsvYe93po+AYjWXKeEHhrDSIiShysmvORzi87DiIVMYX7L7YQZfF4Q7yDH2zkEU5i5kledKXsumQs3z5LgiSuHc6EVRJZpZkj9O41C7TSxrulPND5EolnsPYS541pgNOmr9QmHpB8SzEqrwVJmshV+zhYTh8lZojPeYs9A4EWyGPGRdS7SRejZfVKt+VrhGDLmuFmdQTyOszCQBy+RSKBBwRzwXJfOJ7BfcOEghKNWQZs5jAhdhHf7m+IiB+AxXyXj3TNspa2Pk4x0B2pDF1MmbumSTcHY032MIzZzqo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR12MB5869.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(346002)(366004)(136003)(39860400002)(396003)(230922051799003)(186009)(451199024)(64100799003)(1800799012)(66946007)(66556008)(66476007)(316002)(8936002)(8676002)(1076003)(26005)(478600001)(2616005)(83380400001)(2906002)(5660300002)(41300700001)(7416002)(38100700002)(86362001)(6512007)(6506007)(921011)(6486002)(33656002)(36756003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YGzcC6Z6zOpgqZiJ6/a30a/2JPrkmCq6TUDgiXsAOxmkKXE+15KHE0VMVB7n?=
 =?us-ascii?Q?RqvfLK3KEVKOspNChiXxig5ghy0kPbnic2LV8GsVGBUlmZLrAmNLPyJ6sHKD?=
 =?us-ascii?Q?85Q7zQb9GKJUwoct94R6zBEXsc52BbeERDY+AcgE2O+Tj+nQ2t59eXRjWGO2?=
 =?us-ascii?Q?jhWrXcWz5RAbtxfYL6ZrUiuI46Gxe2eJybKZS/yNovI30ZA1Y40QqZCJz+Ti?=
 =?us-ascii?Q?S0E/MslXp05tP47m4OkV5gnohOWp33/0dq25EGR/PB/7hU7WbyhKQXKGYi57?=
 =?us-ascii?Q?qEkgx5Gk286L1Dv4/+rxTRT5CaP70qmXCiSTUZShXstdEBqCy+Lxq9zzCKZ/?=
 =?us-ascii?Q?is0e3F54nabTReW8A4jfRa5A0hYBlrUDTBkfSitodaCQqh9YHEII66uTy3gm?=
 =?us-ascii?Q?RbrY6O35l/3Igf64oO0b93LDKRb8E52oSFnwBZNqTCrBW/7XKSaENdFVAjUc?=
 =?us-ascii?Q?X3onP4GMYYkXikqZFnUW00UWuBsVBgpAM5yNp+Nzjv9qIQ650uq4gB2+yp1U?=
 =?us-ascii?Q?vaLD5L6wI3v6PTUSN3u/ycNSGeXUC16/9SAHn6eMqA3jZsqufW5x3Xn9F3cA?=
 =?us-ascii?Q?w02wyWl+JP33upwBKnzd52iLKdpvSXgbKauNNyc8tWopag4fUhJtdhhL+jjk?=
 =?us-ascii?Q?6dcm4rodTgBXvLBo9YOJcAYI1DPzi01Bx4RFtm9b1g2RLKZtvPVasVNNtVzZ?=
 =?us-ascii?Q?8TwgZGu3WFNxnzd4PiEMpLBLLHBLHwrseI4EpW3MKeHDgYOiCKi0n2ifAd4k?=
 =?us-ascii?Q?eiZZY8emm0rVOloXbin16xz33iJDVSk1q0Xo2oOKHVtl3FIbmkmrtZNgYOZf?=
 =?us-ascii?Q?TQTTErk5MrM7p/oBH4X4MIFGRYQbLk+OULSoSZlKX5zWZ03Y4iucr3gneeaZ?=
 =?us-ascii?Q?hxnOdHWCvtSoQXE5dYdiX515kKXAuDW3CLPALmikAQ4DITU7kw0BtnU6AzYj?=
 =?us-ascii?Q?EyHs1TwHzeuT5fpk3Lmg2CJalxAn/zjKoyCDFybmFATVc5c2AzZ2RGtCZuoA?=
 =?us-ascii?Q?aP8elQlSuPptRMF6GHgK76e4OO9QRDtvHleLyI3PjCGF0vQog6eIdfX4S1g9?=
 =?us-ascii?Q?P+bRpGipW52lYpz/PErjfaoAJdqGPgcb/mFiS1ZWQvffnJ64Suga7a5peNO0?=
 =?us-ascii?Q?VmzsCX+0LjPry0OK4GB5QbJHq25nwv0CY1haQvROn97VusIDbqMMbLRRwZhT?=
 =?us-ascii?Q?YUNuI1iLiTjcRBpV9cywdphwIFF9Qsn3Dkc5qv96Zdr5mQyQ1A6RFeYuynxi?=
 =?us-ascii?Q?XJiUsAgdPdEjqR1MRlrLPhaMmkRW1ZC3DzAGk1u/zaDsN5vw8Xd0E/820Ip+?=
 =?us-ascii?Q?slo95CbERpmlC4w35uvEdNAAENYi0vGJ4/v4nMs9skDUvZrY785WzuH+BEIw?=
 =?us-ascii?Q?eHCc8GOViwuehDRR5W16ZBiyqoKaj5fjbov9e03KouZEpTTuucO8jP3lQL2i?=
 =?us-ascii?Q?pQ+oagcpguG+AEORALZBi+0+apRsAa0Iy0O4pE9f3EvYcF0+MhM5PaQPtF3n?=
 =?us-ascii?Q?SFZaeFr5TZfCwm4oG8dcwqSDtrycNxWsrgd0wLgD0terTu85x10IIjl9VbbX?=
 =?us-ascii?Q?p1dg6oB5dOqyQM/EKiY=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e47bb733-dd7e-4472-81c9-08dc105fd70c
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2024 15:38:19.6827 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BHDJ0IhZDLVjxjvE/1kTpTlzCr5/R+62UCO6RiaPNGGrs0EhbQMMo2AvMawRDeNq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4395
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

On Mon, Jan 08, 2024 at 04:25:02PM +0100, Daniel Vetter wrote:
> On Mon, Jan 08, 2024 at 10:02:50AM -0400, Jason Gunthorpe wrote:
> > On Mon, Jan 08, 2024 at 02:02:57PM +0800, Yan Zhao wrote:
> > > On Fri, Jan 05, 2024 at 03:55:51PM -0400, Jason Gunthorpe wrote:
> > > > On Fri, Jan 05, 2024 at 05:12:37PM +0800, Yan Zhao wrote:
> > > > > This series allow user space to notify KVM of noncoherent DMA status so as
> > > > > to let KVM honor guest memory types in specified memory slot ranges.
> > > > > 
> > > > > Motivation
> > > > > ===
> > > > > A virtio GPU device may want to configure GPU hardware to work in
> > > > > noncoherent mode, i.e. some of its DMAs do not snoop CPU caches.
> > > > 
> > > > Does this mean some DMA reads do not snoop the caches or does it
> > > > include DMA writes not synchronizing the caches too?
> > > Both DMA reads and writes are not snooped.
> > 
> > Oh that sounds really dangerous.
> 
> So if this is an issue then we might already have a problem, because with
> many devices it's entirely up to the device programming whether the i/o is
> snooping or not. So the moment you pass such a device to a guest, whether
> there's explicit support for non-coherent or not, you have a
> problem.

No, the iommus (except Intel and only for Intel integrated GPU, IIRC)
prohibit the use of non-coherent DMA entirely from a VM.

Eg AMD systems 100% block non-coherent DMA in VMs at the iommu level.

> _If_ there is a fundamental problem. I'm not sure of that, because my
> assumption was that at most the guest shoots itself and the data
> corruption doesn't go any further the moment the hypervisor does the
> dma/iommu unmapping.

Who fixes the cache on the unmapping? I didn't see anything..

Jason
