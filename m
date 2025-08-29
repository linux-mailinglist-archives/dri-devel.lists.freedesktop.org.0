Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12852B3C1C1
	for <lists+dri-devel@lfdr.de>; Fri, 29 Aug 2025 19:33:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C219C10E168;
	Fri, 29 Aug 2025 17:33:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="juYwDz2f";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2047.outbound.protection.outlook.com [40.107.220.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9D1F10E168;
 Fri, 29 Aug 2025 17:33:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Sae6PMe8Hi0YooCwgU17nGLkFiRbawUqCRQClGTU0gHMWmeGn+XXmas4uANnNw8rdI3JUXbdmDTciJu5B8eAdVG1WxIUKvBREgH/vgH9R++XDMvotra1FvmffbCuy+B3wHIa2nncnN3sgGB9t0Ke5TCSj5PlvUP1vTa7n85fDUyBZp9mU50PcKHRLrnqwC2OS4dst8521akgNgvLaTUk567hU1BPe6B2Bp1afggEjWDeVu5DpSP9MGm9dcL0qBHlk1/Piaw4RqkIZ/TFskruGMBkgb1rhXJPpfiDWwVPyYjhgypAV2mxHR60zPwjU0dibuNhOndw8h89WNuXaSU0GQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ko1i08RAeEtmju59nU6VKPaJ1hyomCZ7ywI8UD6a89s=;
 b=E9Nm4yF1g6E0KbMzOOQKZjeU5z1qKtqpop4FE2IZjIC/GgOn/HykTEJMzN8WBl3qOS9PXACRfZQmCBCBXf4dCirl9PG428IZh0hfe5Wp8fGK0ChzvbwDlTg6iHCPG6XnYNFxXjDioOH3GphwNHWisLd6gnwh7uEzUwwYSalG9KRMF9A0jqC1/00dB53y8+W2DVMMvrdbTY/gyf6B/bMkUH0KTgQohL590kJgqb/3HNz50DivPjE71Kcw4tJQ3hWmkUPdVgtFNxm/XqmLXExzFwGp32j/enqT+iOOs2AMiE4pHIW5vR1feLikO9DWKwXd5t6FWqOqKp47MhXy0x/JSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ko1i08RAeEtmju59nU6VKPaJ1hyomCZ7ywI8UD6a89s=;
 b=juYwDz2f3aJjLVQJMqwa1UxJAFS5sFC02gQA5nATwIxHDTfb/B3mc/TZHz66AZZj1qJPdjPQT3mAuJYEvAeuRKNSTdV9eBperlv9s/uv6fc/50QyRAjLQH8/skFQoPOHHYR7phDIGmJFyYAa2X6Y2B/eZvvB1FLiNl9MldyZGsTOIHHAI8SzLIX8fE18I5J7OrwGnLzrWvQzE3WW2uE0251XwWH7NaQgkscfoOQSAb/3trKcszht1Wl1vmid/d3J99jpYBLoF7DAqcHISDnBlJ63JHOKb2stiHmLdCAe04ockNE90FJn4gs6wzn/MwU2lFLPk0DnWu6JDjPpsZ/j6g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by IA1PR12MB6017.namprd12.prod.outlook.com (2603:10b6:208:3d7::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.22; Fri, 29 Aug
 2025 17:33:07 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%3]) with mapi id 15.20.9052.017; Fri, 29 Aug 2025
 17:33:06 +0000
From: Joel Fernandes <joelagnelf@nvidia.com>
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 dakr@kernel.org, acourbot@nvidia.com
Cc: Alistair Popple <apopple@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, bjorn3_gh@protonmail.com,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 John Hubbard <jhubbard@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>,
 Timur Tabi <ttabi@nvidia.com>, joel@joelfernandes.org,
 nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org
Subject: [PATCH 00/17] nova-core: Complete GSP boot and begin RPC communication
Date: Fri, 29 Aug 2025 13:32:37 -0400
Message-Id: <20250829173254.2068763-1-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BLAPR03CA0094.namprd03.prod.outlook.com
 (2603:10b6:208:32a::9) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|IA1PR12MB6017:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c0570b6-8986-4473-5a94-08dde7221d4d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?FQhoPJv+Rc+qBZJLtbmLW0DYb31gyAlBxj9ulRIuKy0oCDXuhMiItrVSffPT?=
 =?us-ascii?Q?keB27AXMKS34v/0EoR00TjheytYB9uEuBOD2GjJLxwUODRikOPzZCgBgFFqj?=
 =?us-ascii?Q?ofs2OPPCTuf+sHFo8lBPfOR7bUhBrzjdRUdYvxbkA/UigzAdyIMXptpUgYMR?=
 =?us-ascii?Q?ybTjHrj7oxAabP6uJCZ4LuU0dqtZZPcxxzmpy42jK6N7ZKGGo9lISSSzK2SP?=
 =?us-ascii?Q?VMe6oCg704xhsan6YN8agJOVldOUp8KUIQa2a8c8ZEYZ7zraofpz+7ycwvrZ?=
 =?us-ascii?Q?Sb5xaZzXYTdYQQ0WU+n4N8Cmes63i3QprCCMX/tuLkTSEONVT0M/Xun9Dt+B?=
 =?us-ascii?Q?z4H5RMyBxj1OMHo10llDNIoK1sWYbSOJ01NdrnB2n54cOSEiqYbHssiU6Qnh?=
 =?us-ascii?Q?uJW3BsQvU0Q3zl9Je/CgaMUnRidM/I86HWb9HWSPxKG718RvdIRyPdPvM4/C?=
 =?us-ascii?Q?OdKc1rU8nDhkiw/GyEmR9q8aHl/UghqlJJGgs02VKabSQd5j/7WpHgY+z8z6?=
 =?us-ascii?Q?eBOzEDIexVtuXYa/+NKNBjMT3Oa8MDxcb6cEnzfwV4D4DW4xb6iqresGWXW1?=
 =?us-ascii?Q?kC/KsRFdu8o2W2mHV6hKtg5TWOBUKwlMccmKJW5t1KU6veq3vuFMLX4vxomr?=
 =?us-ascii?Q?o7cFbJ4jFqZEUQiBB9cvHZWhAiaLEvuyu5BpCE5aOkYPn4oYPU+6gwahyQcW?=
 =?us-ascii?Q?pKvZeaqlA2QSWhL4fZQIpKHy3yHbRmy4yxfdQGNwl3FNkvSCma+fBYbp30Gk?=
 =?us-ascii?Q?dBk/SmalmpRF/LB5yS0VFncRzNAt9lkZAvhvoO9Ng2ZoshwzHiG1ZlMVZCmg?=
 =?us-ascii?Q?Oh9M+Z4FpYVdjbSSnj4R2uPsoiJFTW5lN60giVcl7aozkraNSXyf401Ca8eD?=
 =?us-ascii?Q?q3vqVA4KliUPnTWRT8ZdcLb30IQqLDBCJBJ+jKfzL5vLVac0AufX+IM2/3Nv?=
 =?us-ascii?Q?f+TC/Ampbc2hnL7H7fmPRMNQaZaRqPlxY6f4z4f5GPh2kV9QSy/bOQcjOn0o?=
 =?us-ascii?Q?mGk6NuU8BD30gPXuxrrheK12/y7NC4/mYFunulwz/tzYY1g8Zt1ka9wW8NuJ?=
 =?us-ascii?Q?QGAi3bKjJDCjBj0f6S5V0sBCBFoa+O2SUTXkSaOnCOhP88sHDHyO3xwhf8Hs?=
 =?us-ascii?Q?Cb2YOZkNWTYVaGQ3WG+d9+b53CQ873T600vZWduXRtJgxglKgIi/DYJ/JQ+G?=
 =?us-ascii?Q?nsvOq9MwujYW63z61abnT7V8COcmx7plksLDR/p+xByB9oLB160mSqu9+Ej9?=
 =?us-ascii?Q?jaHLoWxvqIMgeNM+uMrtmBhDVrLRtsfPGpcE8ilccyl9IE/QMeMcujzp2uLy?=
 =?us-ascii?Q?jLhnWX+qP/rhXGFB2FUjp+72muZeobYN02D8nBgC/1WAUrxBJq8SnhtN1zUu?=
 =?us-ascii?Q?OV0ev3T1h6uB2KZuA8kIJGJlMOjNHS4VXghF3yY8XZ5xCNcBbW3jb5VPIOqT?=
 =?us-ascii?Q?bBgDTcB/uIY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?yL74pTiv4aKNlTIm6KMaa+cdG8dt26OCkNj/876Ab0fxu51qIHTmQMGm8DfD?=
 =?us-ascii?Q?0DftDXHWPcCh/yFUm0hjgK1AMXFQoBnjpphVvWRijKWhWKGN6tFTjV6/nK/0?=
 =?us-ascii?Q?GWNgZxzQyPCo6xKW5OBxlaaJ7rtzrtE/OoayunrySGJBF54THkW/uQxx4hx9?=
 =?us-ascii?Q?OABK5jsf04p5Tgl8gUMTvLuQfV+PU6ru1DbqrDKRd32FKXCdmBsU4VP4VkJT?=
 =?us-ascii?Q?mdNI6dBUIykiuEWGlbdLLqEaB9zDnVzGuggPQ9osrRYQX+NxCBA/HlQOM2ob?=
 =?us-ascii?Q?LajL/BwCkuzkWu8ik85tkIXt7D8hNdmcr0zSajFrbfQPKUcMgQ4IySnvoDRz?=
 =?us-ascii?Q?tBKRWxP+J3DIvokwka2zaTkkokp5yzE3+HzoG+saoS/IHtKJy8QNccBBwNEI?=
 =?us-ascii?Q?YSGG/g8HzR1XGtdhZbQ+9fuNh8KCjjXyqPxM+fi3frFR1EOHhbjEm+Vq3ZHB?=
 =?us-ascii?Q?8i0oJ1sJr/XLsfGIazEOhNFQZDDDFTqeatV4tqcbDhu/9nBJa4yCZlL8xP0g?=
 =?us-ascii?Q?Z5IGxisHe0oiZm4wsgE6H5pDfSY+2ktiiPOjGWnPmgAkCIcZKSllquQDQfPw?=
 =?us-ascii?Q?Cl0YdJT7ZHG9jx1aJwwrOuEFFFcy4kMOVAt7ZFN4KSab6v8KmqTe0P378o1P?=
 =?us-ascii?Q?4moVu4Adet6obPsRusMstdahBkr+uebiKN2tspLUU2tvTe2ws9SBiM9uv99D?=
 =?us-ascii?Q?RhGy+WyKpc0aOzetFipVvBDM3dwkmjdiWY0sXNa9IzgGMKltC8tGNmtyisdr?=
 =?us-ascii?Q?ths414XsJhXegJt0YYGb+MFSu3HnAgiouE6l1ucPHPMIOq9pnzWXd3olqnk0?=
 =?us-ascii?Q?YtDluAzpoOH3GapY6VHBpmlzdJ2aFUM/yFRiBukyLBGj6CcU3d6vce2U+uW2?=
 =?us-ascii?Q?R6v0HGch4I69mEAlrZjBJfth3sDCuNsZnfTic9uLzFraFenlNCsgH1uj2nhv?=
 =?us-ascii?Q?qNjjlQGXmAx/WUOLx2SRH3FdMuTavAA4GJkjXzn91vVP0ZpF38+neIdOv064?=
 =?us-ascii?Q?c21fM/QPckz2bnsW281xCuj8/mZkjDH6KfYQHGAGFm9ageokcN5TC96kZhFC?=
 =?us-ascii?Q?lNo61fZilkWaw/KuZg8cVZAZ4tFOndtLRXf3lutSCj3BG48uHPam3dROWDgA?=
 =?us-ascii?Q?t1htL6LjfO5QcgcYJdtTVvdGJ0WvSBGDG840cwcya8t8RJiRHsHT8e66KEta?=
 =?us-ascii?Q?hzxRTzUzfeNoNqfVGyqqi+9ecQ6vU3nm3J5euUDFIxT4ZCfWIAJjslxlwgFi?=
 =?us-ascii?Q?2ZB+KrOXtI9F4Soy4Rcum5R0bpYX5wQtNj/qMzLIyS8Nb+y5IHb085Y4PCgq?=
 =?us-ascii?Q?DcR7KFx+jvTcYhgBzMHXgPshqOFb5c5P5y1+x5hi6FR0EGsXf8aYOybkuSwA?=
 =?us-ascii?Q?fdLs/kknOk4Dsy7+ZtHkZWg2MxYhnVrLSCzxkqLgT1ZVfJlen+ibeDCnHDbu?=
 =?us-ascii?Q?btWfFN9edZmz2vz0yUwseRGndQAy2mAZTzO6eW4W/yvUoi1I04O7unuzi58B?=
 =?us-ascii?Q?p99OcTBn+Q8kLsWT9kI+X1YVlgrqC7EMuZkL+u1cRZNj38Aen4R1bmfkAUBq?=
 =?us-ascii?Q?uBiz2XxBQUsBkmtfXG37VfE81j9KytsInixw+CXq?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c0570b6-8986-4473-5a94-08dde7221d4d
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2025 17:33:06.4552 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8xkNEeHk75/wHRXNq3yW6b/FgCDk2/Pgb0P7wSwVttV7vSaKDoQ6kB6ZU2KiFrI9KdurjWpOKJQZJ4cB6zLx9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6017
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

This series builds on top of Alistair's series [1] to complete the GSP boot
process and get us to a point of making the GSP actual responding with useful
command responses (GspStaticInfo command successfully gets us useful
information about the GPU). The main addition is the sequencer required
to boot pre-Hopper Nvidia GPUs (tested on Ampere GA102).

A full tree including the prerequisites for this patch series is available at the tag:
https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git/tag/?h=nova/upstream-submit-8.29.2025-v5

Alex's series Alistair based [1] off of is at [2].

[1] https://lore.kernel.org/all/20250827082015.959430-1-apopple@nvidia.com/
[2] https://lore.kernel.org/rust-for-linux/dc18894e-09d3-4088-9be0-22c2070b61f4@nvidia.com/T/

Alistair Popple (2):
  gpu: nova-core: gsp: Wait for gsp initialisation to complete
  gpu: nova-core: Add get_gsp_info() command

Joel Fernandes (11):
  nova-core: falcon: Move waiting until halted to a helper
  nova-core: falcon: Move start functionality into separate helper
  nova-core: falcon: Move mbox functionalities into helper
  nova-core: falcon: Move dma_reset functionality into helper
  nova-core: gsp: Add support for checking if GSP reloaded
  nova-core: Add bindings required by GSP sequencer
  nova-core: Implement the GSP sequencer
  nova-core: sequencer: Add register opcodes
  nova-core: sequencer: Add delay opcode support
  nova-core: sequencer: Implement basic core operations
  nova-core: sequencer: Implement core resume operation

John Hubbard (4):
  nova-core: clear MBOX0 before waiting for scrubber completion
  nova-core: Ada: basic GPU identification
  nova-core: remove an unnecessary register read: HWCFG1
  nova-core: remove unnecessary need_riscv, bar parameters

 drivers/gpu/nova-core/falcon.rs               | 137 +++---
 drivers/gpu/nova-core/falcon/gsp.rs           |  16 +
 drivers/gpu/nova-core/falcon/hal.rs           |   2 +-
 drivers/gpu/nova-core/firmware.rs             |   1 +
 drivers/gpu/nova-core/gpu.rs                  |  34 +-
 drivers/gpu/nova-core/gsp.rs                  |   2 +
 drivers/gpu/nova-core/gsp/cmdq.rs             |   4 -
 drivers/gpu/nova-core/gsp/commands.rs         |  83 +++-
 drivers/gpu/nova-core/gsp/sequencer.rs        | 431 ++++++++++++++++++
 drivers/gpu/nova-core/nvfw.rs                 |  26 ++
 .../gpu/nova-core/nvfw/r570_144_bindings.rs   | 247 ++++++++++
 drivers/gpu/nova-core/regs.rs                 |   6 +
 drivers/gpu/nova-core/sbuffer.rs              |   1 -
 drivers/gpu/nova-core/util.rs                 |  15 +
 14 files changed, 930 insertions(+), 75 deletions(-)
 create mode 100644 drivers/gpu/nova-core/gsp/sequencer.rs

-- 
2.34.1

