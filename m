Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C77BC2E026
	for <lists+dri-devel@lfdr.de>; Mon, 03 Nov 2025 21:17:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CB4B10E203;
	Mon,  3 Nov 2025 20:17:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="bWYDFRd8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azon11010062.outbound.protection.outlook.com [52.101.56.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3582910E203;
 Mon,  3 Nov 2025 20:17:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y3pGS+Su56Hok2WSW0sj9LJljbHKeLb2QX7O8lK12psEEZVGJzlCcmE+GcStF4jNkqCvYkAmgs/mjZUk+LyOjhBur6ZIcH7nYl3+8d6GH0s0KWJgcRBfKor+bFsPQ0wxGagT+2+mev7Lwa0ZIUYYzoWm0XZ5s1yOUiZ6P/qKtV+XMQPhP/5vyLxhcMYkdceV6AdHgM/nm9zU9xVXjH8BbzekUCRMmx/MlYfb5qS/WJ4dKHD0G+BiBMnXoQJeAfziUkYdDG9LxCuZEaC+L5WW4z04CL1sNpAYP53+1D9Z5tMW7GhpyZX2wrWKw+kdssWfGOdTFuEKJrwjUSvApVc7Sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GSZXm3ikItBP9M/3hlF78TFjkWAhaK1gq75HERzlhb8=;
 b=NzydSNae/XbHttEyiTYKwU2r79g7HFH/FR+fyM7Udj6+XrZvVo5w51Sroenq+gcRQGpvryofA3z3q0FazO101G7GRYmeIha7iv/T5ovei43Dw8C2aP6OzwVIL84spY6uxVi5B6RFzjL+bWQBYS8g4YvNAAlbGiUzGWN3czVMvvDVHnl1/LO00PZdh6Fys+xrCZK+cgZ+PhLZZmDR0JammKhmxRVGQXPig1Nt+DRr6ubt6hSpWV+FVnSF95aE7PPnxbxv5jbT0jakb1ffwMhcexlTF+SZU9s8V9SlNjGftbdJQLiHb5E1d9+gP4MwpzS+PpH9m9fhB1gmyT6z5Z5JRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GSZXm3ikItBP9M/3hlF78TFjkWAhaK1gq75HERzlhb8=;
 b=bWYDFRd8qp/gHtJUMkkaV3LamwCIU2GoyFqaVjqJNEViCmXFY/Bk/se2ahg52M3gJeYv3nZxDhYKb35+021PnIANL736bwCztU4ZtbRD7X7pvtWn8L3QT+h4XVFoUD61u5lMAAAmG2S0gFV02g5aeupxx28NPRINKXILGtU0Hbu6LjdtWyeiWmFrY41VRsZsBJ97OBMJjQW0q6n2zjMmQyiuGqswKSacVeeAzkn7KUws+acqCWkZaNbV4QfHe9RTwg57GB2TzGQ5DfXsAdYR++BVGlFlckgqo8ejsf9Fzi/awcv3UABu5Lztdnb8fr/FKLkv2xbT9KC1lX4pOulGtQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by IA1PR12MB6212.namprd12.prod.outlook.com (2603:10b6:208:3e4::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Mon, 3 Nov
 2025 20:17:03 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9275.015; Mon, 3 Nov 2025
 20:17:03 +0000
Date: Mon, 3 Nov 2025 15:17:01 -0500
From: Joel Fernandes <joelagnelf@nvidia.com>
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 John Hubbard <jhubbard@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 Edwin Peer <epeer@nvidia.com>, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 0/5] gpu: nova-core: leverage FromBytes for VBIOS
 structures
Message-ID: <20251103201701.GA2098328@joelbox2>
References: <20251029-nova-vbios-frombytes-v1-0-ac441ebc1de3@nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251029-nova-vbios-frombytes-v1-0-ac441ebc1de3@nvidia.com>
X-ClientProxiedBy: BLAPR03CA0107.namprd03.prod.outlook.com
 (2603:10b6:208:32a::22) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|IA1PR12MB6212:EE_
X-MS-Office365-Filtering-Correlation-Id: 883072f9-a1ed-493a-f8c3-08de1b15f386
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?PwJNX7KKc/o/akwbFNiUEZY3Q+nlziOymT5LJSiJTXWi2Onkwr17ki0HPcno?=
 =?us-ascii?Q?NeyLLgp3wSd8jqdgmnntggXHW4/PxzyhPJPF8lgbRIIHmf0CnFdiEGOkpE7W?=
 =?us-ascii?Q?pZAb8JteiH/JSErAayYWp5ixlq1hzmoDX4+PzOmWTUBPRCqWJ2BLV6YZndmK?=
 =?us-ascii?Q?1cxiiU0REmmnd36C3y/FVXtiyLEKEhzbxAxRJgb3plWNTYEh+C/+SCOLsowZ?=
 =?us-ascii?Q?glhmw7f13NXyM3R2Wkklv6YQe2u3mioIuUZmEVHSFbrSqEo1biwDe9zRv5K3?=
 =?us-ascii?Q?+1Lv7fwiVa60wNVtc9/RLB6n78h6ES7do5ufsbWPpD7SxCibIyoOvgT6bmxC?=
 =?us-ascii?Q?rSL2njfqE+6pGBqR9V1uFRpy8SlqvVABCP35RvVy2goVuuZiv1iX7vBkM9Pm?=
 =?us-ascii?Q?/V1eXuMwJnnfev+MKE1VDOLbtUFghEMfojeVw6v3Srn5/Fiv1RuU0F38AlI7?=
 =?us-ascii?Q?j+t5644fFsvqDPJasGvJLe7nCmDp1S/jQdG8Ht7v1DrsVKhxOkI+aRf5klCH?=
 =?us-ascii?Q?GnfhoN2F8jEk49PCwOUTekD1s6NDvT+lYaxOdBLUHOT4EZc2ZBhgkjX/ypBS?=
 =?us-ascii?Q?1NYhmnXNnSyvTpen+WRqT/R5oVwkDZKPeT+sYFSdX/s6wENKlUpRV6vn9vtG?=
 =?us-ascii?Q?f4vhvTfa3lSFY+TRB8U4I4HfUZeCIYhE25Wc4xCFHX+lavOM28owzYokoTcn?=
 =?us-ascii?Q?/7VaL6L77j1hcpkTQakEg8SVVt0+bJt6WSEo4u5uWA5ImnalBNgxxaeMWgNZ?=
 =?us-ascii?Q?oCO9w9Z9PFrQqkAomCDi9B1FBq9VqGN74urz/72ga6cVFjQnaeEZzUr+e/mC?=
 =?us-ascii?Q?aRJpopMCtyyf5865d0FvaNIf4HyssDE8KLPO+THEbLn8y7sFH8CUhc6YP7KD?=
 =?us-ascii?Q?rIo4wx5ZT2EQabUiJx9fPJv9Oq7OQ6RmXAjxDXByvkDQjt7fNWkHKCoe7DYt?=
 =?us-ascii?Q?1XHeJ3jT6kIPrc3qVtAgPWxV+tLkwzPg4NsCLAEMNeL41iUXHWO7R9L5muT1?=
 =?us-ascii?Q?irwHEcvpd8fgBJuW6rjGKe5/z9etY/tOD/Jg55MxXKY/bD+ucA5W9bHBakoH?=
 =?us-ascii?Q?hRcPUkBFKDJBgoKtlkdSmFAwdqdYGEYYnqSs4GYAWQtWKp1/p1FQahB0Xo90?=
 =?us-ascii?Q?DunBf6uCADk0FBJY7au/TdYCjgUP+Zy8SCWbikoIGrhqodzAxkixkDG7rH1Q?=
 =?us-ascii?Q?09SOOd7XSEgB7OsZMUSfaEXDC9iX6ukjvNpNfoom9YKz9wICjegfNrt63Ekb?=
 =?us-ascii?Q?40A3tk8MkEki3578/QcF+5luoJxl1IgJ1IfVvwvfbbFeAnkQwVSHm3FduKnX?=
 =?us-ascii?Q?89ZVluX3IxKrK3b+BuDsd6e/tif1ny/MI4ATpP2PObxluL4H56mTjBq9dqmi?=
 =?us-ascii?Q?+VcqXzXXrMr3W8H1+iSmlgjtalSbtkwUsvXzdPxjy7fXdHp1tO6EY/C42Mbu?=
 =?us-ascii?Q?EYO3Anyf6KLmQsKwSapu9TBQN66gq2KvMjb/63n1Pt6h+02oRaPLDw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pjiWGxE6dhzuSzIATMupM/FgCWTGvx6lnZAp79HyWfG7I2YYvS+FTE2RgeRv?=
 =?us-ascii?Q?IAWYL7KtqJbGKNKmuV+FtoQgTelFPOlfZFsGbiebxVWsUhUD9Q4Pvv+nkfQ6?=
 =?us-ascii?Q?7NFfITFQaHclve+gfjz8O41DufGOVO5+pVsg8eEyfCbFMHCJmEjSyEYhu+gy?=
 =?us-ascii?Q?UxYmq+W0GMhZQJvT6AlBHK46PadJgD+nH69D+lD4DgKz23fwpJ9wUolDOMY5?=
 =?us-ascii?Q?cUhcuFRrmbnuPqwYxUQ8j0XFanXTm1rAAP/ZhmXqFDojMGd0E6QgiDaNHtfl?=
 =?us-ascii?Q?jt5ccVOKWnUYC+2PRZxixnCW2tuo1kOx8R3oHddgdw8a+66xm7lnxY1VIDX6?=
 =?us-ascii?Q?7L8q7Eec8/OHPgw6KphcIxRuLm3f9pmNPaUwAKkGgtuEn2qm/k6gFcvwPMIz?=
 =?us-ascii?Q?Nu5CLZbVx2jZtfpXpLK8iuTEkUrPC2hh5yBig2T9wNSFXoRpgwG7U1mqPGp5?=
 =?us-ascii?Q?OZCSgnZX6mPTIKAkKCxj6AKKssk5VYwSQM1K5aHGpc/6jW5azC7QdQuu33+0?=
 =?us-ascii?Q?SY/cPBMY67LTM54sOKrW6w4NkCcMwiXYpqnpXzq9aYMbp70ZBGGbAHEyueBb?=
 =?us-ascii?Q?R5yM3k3gv7vkCanF+6aMMa7sQKWvoJpK4Po8r9IzXfHx9gd3HwS3FrZboApV?=
 =?us-ascii?Q?zgZn0UNIT2OzXF25AuqbhtoI1G15dCHZoFTaVEiH9YHNjSTtOACk+9Hg7iir?=
 =?us-ascii?Q?ORrrhAfCjLAnMYvzu87S0NZNm88TbIAljAqZMSScT2e/tFEmuglK9o9XGUsk?=
 =?us-ascii?Q?CFJajFZqm2UeRgZfzJPuXTJpGGCFrV1QA+1Crj6/F28DTkVs5IS+Js51/Qlt?=
 =?us-ascii?Q?PNK+ug8eh0F4pswVuF+BBWagMkN+bvx0BBAOqcFoEHsmfHWacKrojiLTRdNs?=
 =?us-ascii?Q?urhs9+ebflO4SinkDD2ukJQ7f2+yv+kQ6d/QpTjrBFTmt0je3F3GcHDt4bU6?=
 =?us-ascii?Q?NhzvpwBeGh/FjLX9OYBQIEcvj4kPapvNc5v4MHF+6xJHhpcrCt2YCK2tjFP9?=
 =?us-ascii?Q?uuM0rRF6YZqDk+e+UoKGlL/XgfEloXIjJ+K8TaUPBCmb9Z+zDxermsZALKEE?=
 =?us-ascii?Q?vN+Yft/RyyU/A3s6/leG4CIw+gfeii/iZJHb2rMhlNIkPImfLbkeRCS5Y/iX?=
 =?us-ascii?Q?az3ZP8hK6jgFq1NYMWYtELsBM05mODfr2Rt0i1Oh/zR7pUGs3guy/wEtsjRw?=
 =?us-ascii?Q?/em7yIWTYNEn91WRzbU+X7amJ+jY8nJFehYMdC99xLyGRWJVj57idV+czLd1?=
 =?us-ascii?Q?+FPfjLsej1x2gIFWhvUAmMCFOkumvmIix9B3VYKjD59zYEricE4RctMroqHX?=
 =?us-ascii?Q?RYqsxPY0updDIABx/7QJRSj5DJvIAlYzA0+4tiUViuLnDubguVKrwRM42Gtk?=
 =?us-ascii?Q?TsSsui3T0U1L0YVJuAqbsqE4m1w8LwBBeD5uoFrqUnRv3Q79aKVxoo5SP2rp?=
 =?us-ascii?Q?Qcn0PvhMgtJ3lS4Z9ka4WpGHN4+YsQXFtUJtBIidTAftL8uf8Rd5bK9YHRyO?=
 =?us-ascii?Q?/7QyzkpxBFc3KDHMoTTuqHLAG7WXPWarvHpwC0qUAIRh2uSGTDMdwfZnvKiA?=
 =?us-ascii?Q?9WnsSGarSlgdnKeJsbIpD/AZaqb0Aw4VolJBSe2I?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 883072f9-a1ed-493a-f8c3-08de1b15f386
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2025 20:17:02.8865 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ehR8b/FIfHnYmIuURAiHYdCrabva1yZFt7aylttfPRb/lCLJPU+iWM8LyDwa4WnF7mGuwtOxQUXZ/P4ynUdc9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6212
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

On Wed, Oct 29, 2025 at 12:07:35AM +0900, Alexandre Courbot wrote:
> This series spawns from the discussion in [1], where it was noticed that
> several structures of the VBIOS could just be read using `FromBytes`
> instead of being built manually.
> 
> While implementing it, I also noticed that we were repeating the
> following pattern quite a bit in the code:
> 
>     slice
>         .get(..size_of::<TargetType>())
>         .and_then(TargetType::from_bytes_copy)
> 
> ... which begs for dedicated methods doing this in the `FromBytes`
> trait. This is what the first patch does, taking inspiration from a
> similar feature in the `zerocopy` crate.
> 
> The remaining patches leverage these new methods to simplify the VBIOS
> code a bit, accordingly.
> 
> If patch 1 is deemed a valid idea, I hope we can merge it into the DRM
> tree along with the rest of this series.
> 
> The base for this work is `drm-rust-next`, with [2] applied.
> 
> [1] https://lore.kernel.org/rust-for-linux/DDTRW1P2I4PB.10ZTZDY95JBC5@nvidia.com/
> [2] https://lore.kernel.org/rust-for-linux/20251026-nova-as-v1-1-60c78726462d@nvidia.com/
> 
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>

Once the nit I suggested in patch 1 is discussed, for all patches:

Reviewed-by: Joel Fernandes <joelagnelf@nvidia.com>

thanks,

 - Joel

> ---
> Alexandre Courbot (5):
>       rust: transmute: add `from_bytes_prefix` family of methods
>       gpu: nova-core: vbios: use FromBytes for PmuLookupTable header
>       gpu: nova-core: vbios: use FromBytes for PcirStruct
>       gpu: nova-core: vbios: use FromBytes for BitHeader
>       gpu: nova-core: vbios: use FromBytes for NpdeStruct
> 
>  drivers/gpu/nova-core/vbios.rs | 137 ++++++++++++++++-------------------------
>  rust/kernel/transmute.rs       |  60 ++++++++++++++++++
>  2 files changed, 113 insertions(+), 84 deletions(-)
> ---
> base-commit: 639291d7c30cec5cf0d9a79371021c2e4404cfc9
> change-id: 20251028-nova-vbios-frombytes-eb0cbb6a2f11
> 
> Best regards,
> -- 
> Alexandre Courbot <acourbot@nvidia.com>
> 
