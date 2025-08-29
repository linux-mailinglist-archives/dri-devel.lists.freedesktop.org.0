Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 878F7B3BCB2
	for <lists+dri-devel@lfdr.de>; Fri, 29 Aug 2025 15:43:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9135D10EBB9;
	Fri, 29 Aug 2025 13:43:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="O6AjVdW1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2046.outbound.protection.outlook.com [40.107.92.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93B3C10EBBE;
 Fri, 29 Aug 2025 13:43:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pdYKJ7tlQb9Bce1QiKZjo23oOxpEPhEc4qjDyKlms0cdF5PSJp8g+v29omEOdD3xaKu0BI2U+dITFuBTuIsTcAs+pIGJhRmBWSFsNb2Q7BDI1QrUGwP+QMg2bD7WQQhJpf1pp65D6UMIrLB92mKO5Mvmhk5cCn4mu9itOo0gGPcCu6hEaM8mO+eJ5Zcyc+YYUdZ9zDaeU6V1q6l9IfMERLVH/JSdse0Pctisor40g16dRLNKm6AJzxOB6lbSxfboQ4XXgiav+GPsTL008RZWVmCEGRMAOAJkymqnN0npKPB/PQ3MzHyKx9+dQ++6UZOdQlWodNzArlqt2UhCkb2naA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KUTGx8YrFV/gZw8JM/2oTNot3GlWVI4bY9EGQmOh2w8=;
 b=VwyHF+AH1JVKUp4AYxj4snmNjs8RU7MuSNvV7xZAw8R+P+0DGnbCqUeAyrFNsUDtZoL2NfHwK6J2kmXvBX0VufwWPhsxF8G3HZ3MYChVkRH7kfC6679FNyKW7xmloRg0P1jL54viOrB72JUzZgQB388j6MOR6g0d2Z2lIZly3wCG0mdVgPbo5VDbTNnbXxzMDTkt6FQyrKbYsSnLGTQvkSUIg5aLiE2EuuPG7xx6OA37WY6nN0ardzVdQ5ipBxOGM/5EnMWqJwHWYFex9doH3Nsir55gbtjdETLhgQhwQVv9Ltlgzkt9+8ebJGkiPm5+paRpuWmNfgXtxjuy4BBdwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KUTGx8YrFV/gZw8JM/2oTNot3GlWVI4bY9EGQmOh2w8=;
 b=O6AjVdW1WpDIv8yTs3r3fXHPwDVZEHjVzZv9GsCRT0O2zdfTehw49JNWa44rzExjFrTdu2Z/5oZacw9OyP55FAoY782BqcDGO+i07Iwr0BD3p3K0nZ7TnJ3iKaa0mf+l//HMer0ugjO6P/QquF8xd7KurFFhsJqebiu1CXYuDW7DxzX3jSCTRcxC8fgD0c4hHJ5WfRULfx3Im/xkLBpP/Xivu5neVE9efcXCoLWC4ACqIIIHPWMnsRXlT9P0YzABz5XOo6gZSJUM9gLU3ATZtdIftyWgwzvHE1gqc8MWkpJzs5FyqluQepxqpuEk6Whgd50PkU3DZHOudQuz/O9vXw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by IA4PR12MB9809.namprd12.prod.outlook.com (2603:10b6:208:54f::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.15; Fri, 29 Aug
 2025 13:43:09 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%3]) with mapi id 15.20.9052.017; Fri, 29 Aug 2025
 13:43:09 +0000
Date: Fri, 29 Aug 2025 09:43:07 -0400
From: Joel Fernandes <joelagnelf@nvidia.com>
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] gpu: nova-core: vbios: replace pci::Device with
 device::Device
Message-ID: <20250829134307.GA1832415@joelbox2>
References: <20250808-vbios_device-v1-0-834bbbab6471@nvidia.com>
 <20250808-vbios_device-v1-1-834bbbab6471@nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250808-vbios_device-v1-1-834bbbab6471@nvidia.com>
X-ClientProxiedBy: MN2PR19CA0012.namprd19.prod.outlook.com
 (2603:10b6:208:178::25) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|IA4PR12MB9809:EE_
X-MS-Office365-Filtering-Correlation-Id: 388598bc-5b2f-46a1-f250-08dde701fdb2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?t7VhfNOso2neVyOQZ3BfgKrMX+oK2ZHGtue4Omukd0YTLxnLMBloTy4S8AKn?=
 =?us-ascii?Q?2LiBfSQT1nvcl2pYSiPeVGbeu++wR3unwX+qc1sZ8D/8J2L+acy2qZQrtAcY?=
 =?us-ascii?Q?pLZUyygeuSzMqYCwHnK8SHfSn4D1ZK4fHW4KNgrDJJV+m5bQ6r8wmx2hWsIn?=
 =?us-ascii?Q?4ilXKgJtyAKle+9pzsZW6G2Fz7TszMEKK5x33EWsnb1m5URJbbX9OuSTqin+?=
 =?us-ascii?Q?f9MzCKWGpckz8RhKcGz0m2G7pVaZ2kXs5rR6stLnvxeZHnbykWw1pqvIoLAE?=
 =?us-ascii?Q?1k/vTZoIb8hWY6LzFRaSUoAYf2TR4y+6wZ/Kl+OLbN6psDuahxONlqh9eCs4?=
 =?us-ascii?Q?vhZSgA8FL31kYu5NIn+CDfGBXYym00A1jGaS05WH5JY0qomN9A4DIY3/d/B/?=
 =?us-ascii?Q?4W33XmS99s5gl2q4bG1M1lcM2z40ajz9NYh8+Ev+rnRPj1SQmfWWPbCxlN6k?=
 =?us-ascii?Q?EdZZJY74r6mnfbpsfxgTR822+/hfzFPJRdv8qe0zHlF6SzieKZpXznbNIBmf?=
 =?us-ascii?Q?b7ACw5y5OLOapSk4q765ZVaEsyU56n1ZnIu6PA4zLbQfBgL3ms25HfExxO4M?=
 =?us-ascii?Q?2VJbHzQlt/viLniSHHVP0HEWnD4syz36WuI75g6m+WD/4VbZE6UCS9wPX7g1?=
 =?us-ascii?Q?U9py0TEySPGaCL8q/khfvSQgozHxkBIGDmkAPK4vxewepeLNk3g8Hf21f7gG?=
 =?us-ascii?Q?JX4Ig3Z7kp/aGt0I3mtfIERmAtqh8GYBfAmwR2yH7HiJLB8ilzh1W88EQpvw?=
 =?us-ascii?Q?9nNT1jaqwJwjXWU0kLwt+oliwcNe4+EP4nUAiXHu7VR9DaotaLcPilIr0G6D?=
 =?us-ascii?Q?D2LLesuEdX1gOTKr4vJiicUWuEEi3lKWQFpF+6wwSJ//j1O/i90lZzYD0gsm?=
 =?us-ascii?Q?LaHfF6JueuiMDS4IUfR3ERAs58j7EJUzfYWozyXx4dOtpz/vQok2qQAz6uOX?=
 =?us-ascii?Q?Dyb5mVmpKO/kZiPWXWh9DAmpVdKmEhZZyAvLdLSERB1eWSRLr+8hy53gB3Js?=
 =?us-ascii?Q?X2pbpSnZ63oWEoZVDy7iRNB+3js+Hq1TdSKdLn1Uvvl0CTzdSGYkJ1IhKadd?=
 =?us-ascii?Q?NRLh3xQOKw4zDGX2kUTVzFgnopnsI6vvmAV3mKXpJEAtWwL/tT0plcdPCz/W?=
 =?us-ascii?Q?fu7AXX9StVgalvLC5SjU5RDB+cPResYF16TREuubtiGj+lmdZoRhdORylroS?=
 =?us-ascii?Q?U6U9x0GVLlFwomJbrf139HHHMjD5MUAK+2Vf6Z7KMzcBghWz6JGUJkPL+V/F?=
 =?us-ascii?Q?6gp/hLoJJyZ9cQRtphn0ImMkxFcuZydQNuP/Wgzo+kZLgz1t+JOlv10Ca7Gs?=
 =?us-ascii?Q?QWAjq3/3LZcg1qhvL6cmpgSRr6dELafrtK05qwjNon2Vnw8RdHwP1oWwKhLA?=
 =?us-ascii?Q?j37DnoqEbfCv+axDB4yzjlmcUWvk4y53LdflmA/rijE953nHl9cbwdApsP5p?=
 =?us-ascii?Q?Qh+aTfEOfXc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?uPCP3dd5NIsEig1fumRi9mDy/4i3c3Ru5mg2JPhhKiAbGInbhc570QSif2gK?=
 =?us-ascii?Q?s9g+HtguEZl2eoLOQ80Zu1QbQGxvDxWKIMuPtTIg4+y7CAFfE4k9dvfrcnLZ?=
 =?us-ascii?Q?EBQsnrwb8f0ecK50FGEfVq80ffmkqPo6NA4kimbEpok24HTXgQLmpwuwZxU2?=
 =?us-ascii?Q?xlifPt4X03r/NXyF0F6/Q3XxBbGstHK5RiUW2K0mXUiO2e6yFjaDvlI8Iibf?=
 =?us-ascii?Q?0JWz19Z+4RlqM9h5DuZUXeJQKWVgCPBZ2idk4zKD9KtJcDVGpTaf1DMsHa26?=
 =?us-ascii?Q?MDXApQYkRrSyQN1jv+Zr1PqtzGhHpxapMPx1Dm9u1LB7pSOcenhOeUslTKHZ?=
 =?us-ascii?Q?9M4E7ct5ddOUHu1C00xsCZnMzdi5/6cKIOu3ga53x3c4Guy4YB7aEcSJV8+l?=
 =?us-ascii?Q?922ZprULUuKyl5jNewJfYgj8tQe3qDdvs1AhyB5EpSmzU1D1dFGEp4JoP/Ol?=
 =?us-ascii?Q?UHRyK1qecEZtVW59KLGoKA0RgulBBqPyMcl1BejEvl2Tr8LBkoWydg/T9IKV?=
 =?us-ascii?Q?hL/m90sUT7fKDicvQ/3tGP/vrtnWKCGH/Qr1SO0nGMqE/RDL77SzeC+7MMSt?=
 =?us-ascii?Q?kMEnWEDX7HLHbCa0DaejootRG7L7LPObtkGSvACkxBQiyKR9/RZKCBoHJM9R?=
 =?us-ascii?Q?lcIyAdcZv5GRIsro+VmGb+KxipD+YRNFe7Y6I9ISiJnVOWQ739cya9WotOli?=
 =?us-ascii?Q?Hix3Pwtq+RX79FIQFbQF7b65ftdqVuDxOvKlny9g71UoKyadUi3KF2JYgEAG?=
 =?us-ascii?Q?XlGkEIp7I3ndq0Gte3RyzZqT7tyUP3Th3hQmzOAq/6iclBtXIOn+mLJLRoGj?=
 =?us-ascii?Q?yklq66yLCFU6J7qx0tBhA6bqLBqYNh6erVn1Ci6IKSeT3PSIS2CVJp7IvCn8?=
 =?us-ascii?Q?CcVL32ABMk7K7iWFC66AMGlffpeCeTatZ0+nf20hIVOr+RkRMc3RfrkMj4+2?=
 =?us-ascii?Q?JdPbq1mci0uhmWZL6PqJnL7jsENj/8YnUyMBs8QEF7UWjGNzKacJun5sJe5P?=
 =?us-ascii?Q?LT7OtGVGeFLoaYUg1su1xHDJPZbh7cKNqv/JbrtFwnnMuQEmIVYasEA/5fqd?=
 =?us-ascii?Q?Csu2Crx7ulOynHwsfstnAc3iWqoGgfVMgUDLNUTJH9TbhBa/MegFs+LF5Lyt?=
 =?us-ascii?Q?nps/Lr2T5bl/6QFI+x3TQ2tRrzjeaguUMee7Mzzoxs+0Z1MV+u+/iSQRscB6?=
 =?us-ascii?Q?qN0yLpcm2qGhSL34Lf93nv62vSp0UhoPFJAMnZDrHdm24WtHAuTaOkMyh27z?=
 =?us-ascii?Q?Fl/dBDAfToP0n1YLAJq0YjG22Y5f5CPPHrZke13cMegGq+ePPIf8PKkLZKyF?=
 =?us-ascii?Q?3S++yA2Mhkqd34nq8aVxATIVDm7OWkbu0HtRdEg8E/GehtNjRD91rMv/3V4n?=
 =?us-ascii?Q?TJO0smXKZvVjYuQHud38AvrOOlmtxaVa9EZfRh1oesy8fJ+xF2uPE8jVzcfY?=
 =?us-ascii?Q?T5clCkpfToqF1RI3eh2kdP6edKvijsEh7Zce63a07Nnh8ys1OGecxUQa17uL?=
 =?us-ascii?Q?KHoYIZkACpRpquHoBtA/wp4lhy8hdZQTTF7DeXX5V5JgsoTmfNYKAvIhOm4S?=
 =?us-ascii?Q?JmWr4LVV7OmAFiL/+SsggmJQi2rjLXjU4075K2cT?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 388598bc-5b2f-46a1-f250-08dde701fdb2
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2025 13:43:09.5459 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l4sjlzeIESfFbXwgguX71KncgNg7VNJMipVkmF2Oy0yGjAmhzL1t4txb4y1IBtwF969NMjuINerUsAP4tqvIxg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR12MB9809
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

On Fri, Aug 08, 2025 at 11:46:41AM +0900, Alexandre Courbot wrote:
> The passed pci::Device is exclusively used for logging purposes, so it
> can be replaced by a regular device::Device, which allows us to remove
> the `as_ref()` indirections at each logging site.
> 
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>

Reviewed-by: Joel Fernandes <joelagnelf@nvidia.com>

thanks,

 - Joel

> ---
>  drivers/gpu/nova-core/gpu.rs   |   2 +-
>  drivers/gpu/nova-core/vbios.rs | 135 +++++++++++++++++------------------------
>  2 files changed, 57 insertions(+), 80 deletions(-)
> 
> diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
> index 72d40b0124f0c1a2a381484172c289af523511df..33082ac45873ee4cf91d7d8af499efa984af4ba9 100644
> --- a/drivers/gpu/nova-core/gpu.rs
> +++ b/drivers/gpu/nova-core/gpu.rs
> @@ -298,7 +298,7 @@ pub(crate) fn new(
>          let fb_layout = FbLayout::new(spec.chipset, bar)?;
>          dev_dbg!(pdev.as_ref(), "{:#x?}\n", fb_layout);
>  
> -        let bios = Vbios::new(pdev, bar)?;
> +        let bios = Vbios::new(pdev.as_ref(), bar)?;
>  
>          Self::run_fwsec_frts(pdev.as_ref(), &gsp_falcon, bar, &bios, &fb_layout)?;
>  
> diff --git a/drivers/gpu/nova-core/vbios.rs b/drivers/gpu/nova-core/vbios.rs
> index 5b5d9f38cbb3a6b1c374c1e0eee2509eb8d5660c..b5564b4d3e4758e77178aa403635e4780f0378cc 100644
> --- a/drivers/gpu/nova-core/vbios.rs
> +++ b/drivers/gpu/nova-core/vbios.rs
> @@ -8,7 +8,6 @@
>  use core::convert::TryFrom;
>  use kernel::device;
>  use kernel::error::Result;
> -use kernel::pci;
>  use kernel::prelude::*;
>  
>  /// The offset of the VBIOS ROM in the BAR0 space.
> @@ -31,7 +30,7 @@
>  
>  /// Vbios Reader for constructing the VBIOS data.
>  struct VbiosIterator<'a> {
> -    pdev: &'a pci::Device,
> +    dev: &'a device::Device,
>      bar0: &'a Bar0,
>      /// VBIOS data vector: As BIOS images are scanned, they are added to this vector for reference
>      /// or copying into other data structures. It is the entire scanned contents of the VBIOS which
> @@ -46,9 +45,9 @@ struct VbiosIterator<'a> {
>  }
>  
>  impl<'a> VbiosIterator<'a> {
> -    fn new(pdev: &'a pci::Device, bar0: &'a Bar0) -> Result<Self> {
> +    fn new(dev: &'a device::Device, bar0: &'a Bar0) -> Result<Self> {
>          Ok(Self {
> -            pdev,
> +            dev,
>              bar0,
>              data: KVec::new(),
>              current_offset: 0,
> @@ -64,7 +63,7 @@ fn read_more(&mut self, len: usize) -> Result {
>          // Ensure length is a multiple of 4 for 32-bit reads
>          if len % core::mem::size_of::<u32>() != 0 {
>              dev_err!(
> -                self.pdev.as_ref(),
> +                self.dev,
>                  "VBIOS read length {} is not a multiple of 4\n",
>                  len
>              );
> @@ -89,7 +88,7 @@ fn read_more(&mut self, len: usize) -> Result {
>      /// Read bytes at a specific offset, filling any gap.
>      fn read_more_at_offset(&mut self, offset: usize, len: usize) -> Result {
>          if offset > BIOS_MAX_SCAN_LEN {
> -            dev_err!(self.pdev.as_ref(), "Error: exceeded BIOS scan limit.\n");
> +            dev_err!(self.dev, "Error: exceeded BIOS scan limit.\n");
>              return Err(EINVAL);
>          }
>  
> @@ -115,7 +114,7 @@ fn read_bios_image_at_offset(
>          if offset + len > data_len {
>              self.read_more_at_offset(offset, len).inspect_err(|e| {
>                  dev_err!(
> -                    self.pdev.as_ref(),
> +                    self.dev,
>                      "Failed to read more at offset {:#x}: {:?}\n",
>                      offset,
>                      e
> @@ -123,9 +122,9 @@ fn read_bios_image_at_offset(
>              })?;
>          }
>  
> -        BiosImage::new(self.pdev, &self.data[offset..offset + len]).inspect_err(|err| {
> +        BiosImage::new(self.dev, &self.data[offset..offset + len]).inspect_err(|err| {
>              dev_err!(
> -                self.pdev.as_ref(),
> +                self.dev,
>                  "Failed to {} at offset {:#x}: {:?}\n",
>                  context,
>                  offset,
> @@ -146,10 +145,7 @@ fn next(&mut self) -> Option<Self::Item> {
>          }
>  
>          if self.current_offset > BIOS_MAX_SCAN_LEN {
> -            dev_err!(
> -                self.pdev.as_ref(),
> -                "Error: exceeded BIOS scan limit, stopping scan\n"
> -            );
> +            dev_err!(self.dev, "Error: exceeded BIOS scan limit, stopping scan\n");
>              return None;
>          }
>  
> @@ -192,18 +188,18 @@ impl Vbios {
>      /// Probe for VBIOS extraction.
>      ///
>      /// Once the VBIOS object is built, `bar0` is not read for [`Vbios`] purposes anymore.
> -    pub(crate) fn new(pdev: &pci::Device, bar0: &Bar0) -> Result<Vbios> {
> +    pub(crate) fn new(dev: &device::Device, bar0: &Bar0) -> Result<Vbios> {
>          // Images to extract from iteration
>          let mut pci_at_image: Option<PciAtBiosImage> = None;
>          let mut first_fwsec_image: Option<FwSecBiosBuilder> = None;
>          let mut second_fwsec_image: Option<FwSecBiosBuilder> = None;
>  
>          // Parse all VBIOS images in the ROM
> -        for image_result in VbiosIterator::new(pdev, bar0)? {
> +        for image_result in VbiosIterator::new(dev, bar0)? {
>              let full_image = image_result?;
>  
>              dev_dbg!(
> -                pdev.as_ref(),
> +                dev,
>                  "Found BIOS image: size: {:#x}, type: {}, last: {}\n",
>                  full_image.image_size_bytes(),
>                  full_image.image_type_str(),
> @@ -234,14 +230,14 @@ pub(crate) fn new(pdev: &pci::Device, bar0: &Bar0) -> Result<Vbios> {
>              (second_fwsec_image, first_fwsec_image, pci_at_image)
>          {
>              second
> -                .setup_falcon_data(pdev, &pci_at, &first)
> -                .inspect_err(|e| dev_err!(pdev.as_ref(), "Falcon data setup failed: {:?}\n", e))?;
> +                .setup_falcon_data(dev, &pci_at, &first)
> +                .inspect_err(|e| dev_err!(dev, "Falcon data setup failed: {:?}\n", e))?;
>              Ok(Vbios {
> -                fwsec_image: second.build(pdev)?,
> +                fwsec_image: second.build(dev)?,
>              })
>          } else {
>              dev_err!(
> -                pdev.as_ref(),
> +                dev,
>                  "Missing required images for falcon data setup, skipping\n"
>              );
>              Err(EINVAL)
> @@ -284,9 +280,9 @@ struct PcirStruct {
>  }
>  
>  impl PcirStruct {
> -    fn new(pdev: &pci::Device, data: &[u8]) -> Result<Self> {
> +    fn new(dev: &device::Device, data: &[u8]) -> Result<Self> {
>          if data.len() < core::mem::size_of::<PcirStruct>() {
> -            dev_err!(pdev.as_ref(), "Not enough data for PcirStruct\n");
> +            dev_err!(dev, "Not enough data for PcirStruct\n");
>              return Err(EINVAL);
>          }
>  
> @@ -295,11 +291,7 @@ fn new(pdev: &pci::Device, data: &[u8]) -> Result<Self> {
>  
>          // Signature should be "PCIR" (0x52494350) or "NPDS" (0x5344504e).
>          if &signature != b"PCIR" && &signature != b"NPDS" {
> -            dev_err!(
> -                pdev.as_ref(),
> -                "Invalid signature for PcirStruct: {:?}\n",
> -                signature
> -            );
> +            dev_err!(dev, "Invalid signature for PcirStruct: {:?}\n", signature);
>              return Err(EINVAL);
>          }
>  
> @@ -308,7 +300,7 @@ fn new(pdev: &pci::Device, data: &[u8]) -> Result<Self> {
>  
>          let image_len = u16::from_le_bytes([data[16], data[17]]);
>          if image_len == 0 {
> -            dev_err!(pdev.as_ref(), "Invalid image length: 0\n");
> +            dev_err!(dev, "Invalid image length: 0\n");
>              return Err(EINVAL);
>          }
>  
> @@ -467,7 +459,7 @@ struct PciRomHeader {
>  }
>  
>  impl PciRomHeader {
> -    fn new(pdev: &pci::Device, data: &[u8]) -> Result<Self> {
> +    fn new(dev: &device::Device, data: &[u8]) -> Result<Self> {
>          if data.len() < 26 {
>              // Need at least 26 bytes to read pciDataStrucPtr and sizeOfBlock.
>              return Err(EINVAL);
> @@ -479,7 +471,7 @@ fn new(pdev: &pci::Device, data: &[u8]) -> Result<Self> {
>          match signature {
>              0xAA55 | 0xBB77 | 0x4E56 => {}
>              _ => {
> -                dev_err!(pdev.as_ref(), "ROM signature unknown {:#x}\n", signature);
> +                dev_err!(dev, "ROM signature unknown {:#x}\n", signature);
>                  return Err(EINVAL);
>              }
>          }
> @@ -538,9 +530,9 @@ struct NpdeStruct {
>  }
>  
>  impl NpdeStruct {
> -    fn new(pdev: &pci::Device, data: &[u8]) -> Option<Self> {
> +    fn new(dev: &device::Device, data: &[u8]) -> Option<Self> {
>          if data.len() < core::mem::size_of::<Self>() {
> -            dev_dbg!(pdev.as_ref(), "Not enough data for NpdeStruct\n");
> +            dev_dbg!(dev, "Not enough data for NpdeStruct\n");
>              return None;
>          }
>  
> @@ -549,17 +541,13 @@ fn new(pdev: &pci::Device, data: &[u8]) -> Option<Self> {
>  
>          // Signature should be "NPDE" (0x4544504E).
>          if &signature != b"NPDE" {
> -            dev_dbg!(
> -                pdev.as_ref(),
> -                "Invalid signature for NpdeStruct: {:?}\n",
> -                signature
> -            );
> +            dev_dbg!(dev, "Invalid signature for NpdeStruct: {:?}\n", signature);
>              return None;
>          }
>  
>          let subimage_len = u16::from_le_bytes([data[8], data[9]]);
>          if subimage_len == 0 {
> -            dev_dbg!(pdev.as_ref(), "Invalid subimage length: 0\n");
> +            dev_dbg!(dev, "Invalid subimage length: 0\n");
>              return None;
>          }
>  
> @@ -584,7 +572,7 @@ fn image_size_bytes(&self) -> usize {
>  
>      /// Try to find NPDE in the data, the NPDE is right after the PCIR.
>      fn find_in_data(
> -        pdev: &pci::Device,
> +        dev: &device::Device,
>          data: &[u8],
>          rom_header: &PciRomHeader,
>          pcir: &PcirStruct,
> @@ -596,12 +584,12 @@ fn find_in_data(
>  
>          // Check if we have enough data
>          if npde_start + core::mem::size_of::<Self>() > data.len() {
> -            dev_dbg!(pdev.as_ref(), "Not enough data for NPDE\n");
> +            dev_dbg!(dev, "Not enough data for NPDE\n");
>              return None;
>          }
>  
>          // Try to create NPDE from the data
> -        NpdeStruct::new(pdev, &data[npde_start..])
> +        NpdeStruct::new(dev, &data[npde_start..])
>      }
>  }
>  
> @@ -669,10 +657,10 @@ fn image_size_bytes(&self) -> usize {
>  
>      /// Create a [`BiosImageBase`] from a byte slice and convert it to a [`BiosImage`] which
>      /// triggers the constructor of the specific BiosImage enum variant.
> -    fn new(pdev: &pci::Device, data: &[u8]) -> Result<Self> {
> -        let base = BiosImageBase::new(pdev, data)?;
> +    fn new(dev: &device::Device, data: &[u8]) -> Result<Self> {
> +        let base = BiosImageBase::new(dev, data)?;
>          let image = base.into_image().inspect_err(|e| {
> -            dev_err!(pdev.as_ref(), "Failed to create BiosImage: {:?}\n", e);
> +            dev_err!(dev, "Failed to create BiosImage: {:?}\n", e);
>          })?;
>  
>          Ok(image)
> @@ -773,16 +761,16 @@ fn into_image(self) -> Result<BiosImage> {
>      }
>  
>      /// Creates a new BiosImageBase from raw byte data.
> -    fn new(pdev: &pci::Device, data: &[u8]) -> Result<Self> {
> +    fn new(dev: &device::Device, data: &[u8]) -> Result<Self> {
>          // Ensure we have enough data for the ROM header.
>          if data.len() < 26 {
> -            dev_err!(pdev.as_ref(), "Not enough data for ROM header\n");
> +            dev_err!(dev, "Not enough data for ROM header\n");
>              return Err(EINVAL);
>          }
>  
>          // Parse the ROM header.
> -        let rom_header = PciRomHeader::new(pdev, &data[0..26])
> -            .inspect_err(|e| dev_err!(pdev.as_ref(), "Failed to create PciRomHeader: {:?}\n", e))?;
> +        let rom_header = PciRomHeader::new(dev, &data[0..26])
> +            .inspect_err(|e| dev_err!(dev, "Failed to create PciRomHeader: {:?}\n", e))?;
>  
>          // Get the PCI Data Structure using the pointer from the ROM header.
>          let pcir_offset = rom_header.pci_data_struct_offset as usize;
> @@ -791,22 +779,22 @@ fn new(pdev: &pci::Device, data: &[u8]) -> Result<Self> {
>              .ok_or(EINVAL)
>              .inspect_err(|_| {
>                  dev_err!(
> -                    pdev.as_ref(),
> +                    dev,
>                      "PCIR offset {:#x} out of bounds (data length: {})\n",
>                      pcir_offset,
>                      data.len()
>                  );
>                  dev_err!(
> -                    pdev.as_ref(),
> +                    dev,
>                      "Consider reading more data for construction of BiosImage\n"
>                  );
>              })?;
>  
> -        let pcir = PcirStruct::new(pdev, pcir_data)
> -            .inspect_err(|e| dev_err!(pdev.as_ref(), "Failed to create PcirStruct: {:?}\n", e))?;
> +        let pcir = PcirStruct::new(dev, pcir_data)
> +            .inspect_err(|e| dev_err!(dev, "Failed to create PcirStruct: {:?}\n", e))?;
>  
>          // Look for NPDE structure if this is not an NBSI image (type != 0x70).
> -        let npde = NpdeStruct::find_in_data(pdev, data, &rom_header, &pcir);
> +        let npde = NpdeStruct::find_in_data(dev, data, &rom_header, &pcir);
>  
>          // Create a copy of the data.
>          let mut data_copy = KVec::new();
> @@ -848,7 +836,7 @@ fn get_bit_token(&self, token_id: u8) -> Result<BitToken> {
>      ///
>      /// This is just a 4 byte structure that contains a pointer to the Falcon data in the FWSEC
>      /// image.
> -    fn falcon_data_ptr(&self, pdev: &pci::Device) -> Result<u32> {
> +    fn falcon_data_ptr(&self, dev: &device::Device) -> Result<u32> {
>          let token = self.get_bit_token(BIT_TOKEN_ID_FALCON_DATA)?;
>  
>          // Make sure we don't go out of bounds
> @@ -859,14 +847,14 @@ fn falcon_data_ptr(&self, pdev: &pci::Device) -> Result<u32> {
>          // read the 4 bytes at the offset specified in the token
>          let offset = token.data_offset as usize;
>          let bytes: [u8; 4] = self.base.data[offset..offset + 4].try_into().map_err(|_| {
> -            dev_err!(pdev.as_ref(), "Failed to convert data slice to array");
> +            dev_err!(dev, "Failed to convert data slice to array");
>              EINVAL
>          })?;
>  
>          let data_ptr = u32::from_le_bytes(bytes);
>  
>          if (data_ptr as usize) < self.base.data.len() {
> -            dev_err!(pdev.as_ref(), "Falcon data pointer out of bounds\n");
> +            dev_err!(dev, "Falcon data pointer out of bounds\n");
>              return Err(EINVAL);
>          }
>  
> @@ -928,7 +916,7 @@ struct PmuLookupTable {
>  }
>  
>  impl PmuLookupTable {
> -    fn new(pdev: &pci::Device, data: &[u8]) -> Result<Self> {
> +    fn new(dev: &device::Device, data: &[u8]) -> Result<Self> {
>          if data.len() < 4 {
>              return Err(EINVAL);
>          }
> @@ -940,10 +928,7 @@ fn new(pdev: &pci::Device, data: &[u8]) -> Result<Self> {
>          let required_bytes = header_len + (entry_count * entry_len);
>  
>          if data.len() < required_bytes {
> -            dev_err!(
> -                pdev.as_ref(),
> -                "PmuLookupTable data length less than required\n"
> -            );
> +            dev_err!(dev, "PmuLookupTable data length less than required\n");
>              return Err(EINVAL);
>          }
>  
> @@ -956,11 +941,7 @@ fn new(pdev: &pci::Device, data: &[u8]) -> Result<Self> {
>  
>          // Debug logging of entries (dumps the table data to dmesg)
>          for i in (header_len..required_bytes).step_by(entry_len) {
> -            dev_dbg!(
> -                pdev.as_ref(),
> -                "PMU entry: {:02x?}\n",
> -                &data[i..][..entry_len]
> -            );
> +            dev_dbg!(dev, "PMU entry: {:02x?}\n", &data[i..][..entry_len]);
>          }
>  
>          Ok(PmuLookupTable {
> @@ -997,11 +978,11 @@ fn find_entry_by_type(&self, entry_type: u8) -> Result<PmuLookupTableEntry> {
>  impl FwSecBiosBuilder {
>      fn setup_falcon_data(
>          &mut self,
> -        pdev: &pci::Device,
> +        dev: &device::Device,
>          pci_at_image: &PciAtBiosImage,
>          first_fwsec: &FwSecBiosBuilder,
>      ) -> Result {
> -        let mut offset = pci_at_image.falcon_data_ptr(pdev)? as usize;
> +        let mut offset = pci_at_image.falcon_data_ptr(dev)? as usize;
>          let mut pmu_in_first_fwsec = false;
>  
>          // The falcon data pointer assumes that the PciAt and FWSEC images
> @@ -1025,9 +1006,9 @@ fn setup_falcon_data(
>  
>          if pmu_in_first_fwsec {
>              self.pmu_lookup_table =
> -                Some(PmuLookupTable::new(pdev, &first_fwsec.base.data[offset..])?);
> +                Some(PmuLookupTable::new(dev, &first_fwsec.base.data[offset..])?);
>          } else {
> -            self.pmu_lookup_table = Some(PmuLookupTable::new(pdev, &self.base.data[offset..])?);
> +            self.pmu_lookup_table = Some(PmuLookupTable::new(dev, &self.base.data[offset..])?);
>          }
>  
>          match self
> @@ -1040,18 +1021,14 @@ fn setup_falcon_data(
>                  let mut ucode_offset = entry.data as usize;
>                  ucode_offset -= pci_at_image.base.data.len();
>                  if ucode_offset < first_fwsec.base.data.len() {
> -                    dev_err!(pdev.as_ref(), "Falcon Ucode offset not in second Fwsec.\n");
> +                    dev_err!(dev, "Falcon Ucode offset not in second Fwsec.\n");
>                      return Err(EINVAL);
>                  }
>                  ucode_offset -= first_fwsec.base.data.len();
>                  self.falcon_ucode_offset = Some(ucode_offset);
>              }
>              Err(e) => {
> -                dev_err!(
> -                    pdev.as_ref(),
> -                    "PmuLookupTableEntry not found, error: {:?}\n",
> -                    e
> -                );
> +                dev_err!(dev, "PmuLookupTableEntry not found, error: {:?}\n", e);
>                  return Err(EINVAL);
>              }
>          }
> @@ -1059,7 +1036,7 @@ fn setup_falcon_data(
>      }
>  
>      /// Build the final FwSecBiosImage from this builder
> -    fn build(self, pdev: &pci::Device) -> Result<FwSecBiosImage> {
> +    fn build(self, dev: &device::Device) -> Result<FwSecBiosImage> {
>          let ret = FwSecBiosImage {
>              base: self.base,
>              falcon_ucode_offset: self.falcon_ucode_offset.ok_or(EINVAL)?,
> @@ -1067,8 +1044,8 @@ fn build(self, pdev: &pci::Device) -> Result<FwSecBiosImage> {
>  
>          if cfg!(debug_assertions) {
>              // Print the desc header for debugging
> -            let desc = ret.header(pdev.as_ref())?;
> -            dev_dbg!(pdev.as_ref(), "PmuLookupTableEntry desc: {:#?}\n", desc);
> +            let desc = ret.header(dev)?;
> +            dev_dbg!(dev, "PmuLookupTableEntry desc: {:#?}\n", desc);
>          }
>  
>          Ok(ret)
> 
> -- 
> 2.50.1
> 
