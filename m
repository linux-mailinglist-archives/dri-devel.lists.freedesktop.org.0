Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F652AACAC7
	for <lists+dri-devel@lfdr.de>; Tue,  6 May 2025 18:22:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30B0A10E6F8;
	Tue,  6 May 2025 16:22:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="hakA3I9r";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2071.outbound.protection.outlook.com [40.107.237.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D67C10E6C7;
 Tue,  6 May 2025 16:22:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c6BpNmadgN+8mCpZkHE40h76wnFCZS96feyU3i/k5ykPKpOiM6oKtCIUWVHRq/7AK+2CZcMPBNjhKBkLytENdKzPxRL7UwbLx0frylNgKFAgQQGQd7xLZJZGcqb6GrdVS7Il9CAB+a0FLxEY/Eo9Lh5GmXqmpxLhXZjzdaWRoR+/fxsGODmK9Nu2F+G1rZWZaHY+Cza70H1YfjromHJ1ykDQdui+zATa9ZbdPWm0b8i7vWiVZwO6IEd8cMLGlor+nKI68IZFTJEQsT87vAFJ8sKe+m1Yzd+wC+wVeuH0N/1NjWeqvFGY82wM9hx9JbYLMZXpvZtKDQJYu1wIteG/RA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mv+lTCRtTy1fWpvVu8udEt+v1ULOk+iFtG/aOFcIDGY=;
 b=axQ2lND8KELi8KQ439nkXDunWLIyW7ObMO88Aye/uW0sP6zAELu1y7tk7jcp00OU95AUikPz03fKRAVPTmSD+ZmmFGacF3rSX3R1RtkyK9huqQmfmjd26uwypjE4PQYanGOcOVa3658/5E7JLnug9Oj8ilQ8+VTwqz1jVV3zgtbaniZgmIBFZks+X7Kop/HU8sgp7xqtzQMEmW75GO/Ixq2yKLeHj28+OBw5gEfXXkadMygH1LRO9hD/DC3c2fpdmfNV2SeJt1HRwMHbL7lSbvW4Bz0U7LXsFNP/B70zs3lG4yD3Zi3osvf94DBK02zhbHzAisCZhuYZBpr8AHARwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mv+lTCRtTy1fWpvVu8udEt+v1ULOk+iFtG/aOFcIDGY=;
 b=hakA3I9r2RxqNMLBJAskeIBxnxF3jETSvOZj2z3TbQ/1r8+p7IC47lWoGlMZPWwRw3zxSBk0wWh9dl6JHy4scVgkBbiIjj2ZCKmrzNJ3m1rTJ0zFaEm+vGTp9jqcZVBcj3k3JhlSh5QFuCLhcdKyOrlj6hfchpTix65vCbA2lbtQBfmqtTp5zcO6iwaLgshVScCee6UI6KBuA4SGQ49NUFdMVVxNl52Tzyd9qAHqd/X3hClHds7o5gVN6Qd7pF+563rD7525Ww1yByq+lec/y9q4xCYJdIe1jKoI5eXhuh4rbTjd2xbFUwWJg2Zs/8QmehbNEGgy7D3WLdby/CDoQQ==
Received: from CH0PR04CA0091.namprd04.prod.outlook.com (2603:10b6:610:75::6)
 by SA3PR12MB9199.namprd12.prod.outlook.com (2603:10b6:806:398::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.26; Tue, 6 May
 2025 16:21:58 +0000
Received: from DS3PEPF0000C37F.namprd04.prod.outlook.com
 (2603:10b6:610:75:cafe::da) by CH0PR04CA0091.outlook.office365.com
 (2603:10b6:610:75::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8699.31 via Frontend Transport; Tue,
 6 May 2025 16:21:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DS3PEPF0000C37F.mail.protection.outlook.com (10.167.23.9) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8722.18 via Frontend Transport; Tue, 6 May 2025 16:21:57 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 6 May 2025
 09:21:50 -0700
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Tue, 6 May
 2025 09:21:42 -0700
Received: from inno-thin-client (10.127.8.12) by mail.nvidia.com (10.129.68.7)
 with Microsoft SMTP Server id 15.2.1544.14 via Frontend Transport;
 Tue, 6 May 2025 09:21:39 -0700
Date: Tue, 6 May 2025 19:21:38 +0300
From: Zhi Wang <zhiw@nvidia.com>
To: Joel Fernandes <joelagnelf@nvidia.com>
CC: <linux-kernel@vger.kernel.org>, Danilo Krummrich <dakr@kernel.org>, "David
 Airlie" <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>, Alexandre
 Courbot <acourbot@nvidia.com>, John Hubbard <jhubbard@nvidia.com>, Shirish
 Baskaran <sbaskaran@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>,
 Timur Tabi <ttabi@nvidia.com>, Ben Skeggs <bskeggs@nvidia.com>,
 <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v2 7/7] gpu: nova-core: Clarify falcon code
Message-ID: <20250506192138.2396aa96@inno-thin-client>
In-Reply-To: <20250503040802.1411285-8-joelagnelf@nvidia.com>
References: <20250503040802.1411285-1-joelagnelf@nvidia.com>
 <20250503040802.1411285-8-joelagnelf@nvidia.com>
Organization: NVIDIA
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF0000C37F:EE_|SA3PR12MB9199:EE_
X-MS-Office365-Filtering-Correlation-Id: bb1c6484-ccb4-48cb-c7f5-08dd8cba1f8c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|1800799024|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?AL1eDR85rCwZ+2U+LFtF5KwpeQvv2P14CC8SgJmGeEjd52bG/pL0iHuXPmh2?=
 =?us-ascii?Q?iUg3g982aMxJ9np0svOOxcZfA2uROJb0pA7JP+Ih1/Oe+UObZ2GeQ2odPEE4?=
 =?us-ascii?Q?yXpSUHO6nqzgdrMEp+WqWgjSzrgVIHDu8Z9UywCzC2OxITS2HwpSNhxiqbTe?=
 =?us-ascii?Q?jqt4MhRRJ0+a6uewrJ4pYEQQlDJMB+E7UZydj4xPDG+QGUyyFonJcAy7P7yb?=
 =?us-ascii?Q?gBVsuIN8m+YUZ1ZjFPPQ6i52B5GB1zYFVsg2396qEJIktSbUOfVgiJE92wxD?=
 =?us-ascii?Q?5Dcwd2fkuRpza6/Q3B+gXCMeSPnre1Z/GDbuQJXKeSR2lOXJN6xjGNbUYC5q?=
 =?us-ascii?Q?U5UTCJBX5Budl7NQsPwKrzJlkmnZ796K3m+m2XtjBPzAl2rjWypootVxrHxB?=
 =?us-ascii?Q?I9XAkcjtS8y07ve6qvFQeWSz/LJQGzAuAC5KwSsL8ElJJEYe+/jRinpdtWAc?=
 =?us-ascii?Q?FerSoDlhcp8J4XGMpJRtNowzf2s5zpdDV6UdNugWfwIfIt4yMCkb01uDurU8?=
 =?us-ascii?Q?cHCnV6ZDPoGV/qL5oY8wvkuKAYRT3Psb3DYOHcNaFCjQLnvDMlIy3f2TnAjg?=
 =?us-ascii?Q?+SUBAP4Cf8JQATL48E4tD8Ok16av0lkK1YXMXGEVhPeLmRlkNHEOMM7LceVA?=
 =?us-ascii?Q?Mzm5zf3JGPtg8pPmGWTtRM9QCRreS5L5AcTNXVPcTz1fbKd0fe6GkFk0x8pP?=
 =?us-ascii?Q?gtgQPA28FRbygaLPUZEX4QXJ40UFhVfa7gH18vgZlSRZMMO+MDEOErGoMh75?=
 =?us-ascii?Q?ks6xxeVAZYvOJgB5v5m+aFiwC8icvaZAdEvm2lge2o7fJeSDGTFB0maVvdyU?=
 =?us-ascii?Q?JB6NuVCgDHQrfQFVfjAqXWvQniWoVPG8WQEnyK4x/bFIF6FCy7abi0q5PFdP?=
 =?us-ascii?Q?0WS/mykEYnXPvGlr2QdtuJmB3biYP3vNPIOwVy05ra3MHiGsQObxG9vTL5T0?=
 =?us-ascii?Q?AqGZBgt/d1RHNYIiqD4//pgaDaPDchgojBi6qwpCVFfbtUKnaDG2lYo2Rf3b?=
 =?us-ascii?Q?EikJF6aC3X7SYluMt+1r9Q+7tQKpw2CLElTuthF98E1y2E8xnW3ErUU/ZuAy?=
 =?us-ascii?Q?Zx54wN/hMIya00sP2ArJOf8F2dvW6VJtnrQK4PNtV699PRNPlaRS8tYJf5Sj?=
 =?us-ascii?Q?m0LQMkcuc6cWsv+Mp0s3UEWfiEhGvJpXYPMBc69crwi5GTo0TFCBy5Ekv9Fb?=
 =?us-ascii?Q?EL0L0o9G6MlUhvE3hK2hBYVF/Ee3u6a5P6QbR3uRIvFIwDDNO3tdj/AnfGH7?=
 =?us-ascii?Q?QSujWxxXQIX0s54odojr6YVwHDWhrd7Cs63AB3eoBd9C2h7eVoy7OVNj9xaL?=
 =?us-ascii?Q?OW0eQ9YKlFq2tkoMNdejB4iYcM0iyuB6xllaCSIEVz06t3lPH5EXVC3fyDdq?=
 =?us-ascii?Q?XanyLCTzqADdLPEwLGtfnZUTlsE3OQIJT5dwcvpO43y/WC2Zft6ozkJ0ZLpV?=
 =?us-ascii?Q?bVD6TEAbLj7YqBji1EklnBTn22Caz4t63Tv8gG/Ak40B3Q/ZLCw+BsN+NflW?=
 =?us-ascii?Q?skbtfyszh591FPnmcM/nx9MrSpdn6z7Xbtv5?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2025 16:21:57.6093 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bb1c6484-ccb4-48cb-c7f5-08dd8cba1f8c
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS3PEPF0000C37F.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB9199
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

On Sat,  3 May 2025 00:07:59 -0400
Joel Fernandes <joelagnelf@nvidia.com> wrote:

> Add documentation strings, comments and AES mode for completeness
> to the Falcon signatures.
> 
> Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
> ---
>  drivers/gpu/nova-core/falcon.rs | 25 +++++++++++++++++++------
>  1 file changed, 19 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/nova-core/falcon.rs
> b/drivers/gpu/nova-core/falcon.rs index e9ee0c83dfc5..003db40d3303
> 100644 --- a/drivers/gpu/nova-core/falcon.rs
> +++ b/drivers/gpu/nova-core/falcon.rs
> @@ -89,13 +89,19 @@ fn try_from(value: u8) -> Result<Self> {
>  /// register.
>  #[repr(u8)]
>  #[derive(Debug, Default, Copy, Clone)]
> +/// Security mode of the Falcon microprocessor.
> +/// See falcon.rst for more details.
>  pub(crate) enum FalconSecurityModel {
>      /// Non-Secure: runs unsigned code without privileges.
>      #[default]
>      None = 0,
> -    /// Low-secure: runs unsigned code with some privileges. Can
> only be entered from `Heavy` mode.
> +    /// Light-Secured (LS): runs signed code with some privileges
> +    /// Its signature can only be verified and entered from `Heavy`
> mode.
> +    /// Also known as Privilege Level 2 or PL2.
>      Light = 2,
> -    /// High-Secure: runs signed code with full privileges.
> +    /// Heavy-Secured: runs signed code with full privileges.
> +    /// Its signature can only be verified by the Falcon Boot ROM
> (BROM).
> +    /// Also known as Privilege Level 3 or PL3.
>      Heavy = 3,
>  }
>  
> @@ -117,10 +123,13 @@ fn try_from(value: u8) ->
> core::result::Result<Self, Self::Error> { }
>  
>  /// Signing algorithm for a given firmware, used in the
> [`crate::regs::NV_PFALCON2_FALCON_MOD_SEL`] -/// register.
> +/// register. It is passed to the Falcon Boot ROM (BROM) as a
> parameter. #[repr(u8)]
>  #[derive(Debug, Default, Copy, Clone, PartialEq, Eq)]
>  pub(crate) enum FalconModSelAlgo {
> +    /// AES.
> +    #[expect(dead_code)]
> +    Aes = 0,
>      /// RSA3K.
>      #[default]
>      Rsa3k = 1,
> @@ -184,15 +193,19 @@ pub(crate) enum FalconMem {
>      Dmem,
>  }
>  
> -/// Target/source of a DMA transfer to/from falcon memory.
> +/// FBIF (Framebuffer Interface) aperture type. Used to determine
> +/// the memory type of the external memory access for a DMA memory
> +/// transfer (by the Falcon's FramebufferDMA (FBDMA) engine located
                 Should be Framebuffer DMA?^ So that it will be aligned
with PATCH 6. 
> +/// inside the falcon). See falcon.rst for more details.
>  #[derive(Debug, Clone, Default)]
>  pub(crate) enum FalconFbifTarget {
>      /// VRAM.
>      #[default]
> +    /// Local Framebuffer (GPU's VRAM memory)
>      LocalFb = 0,
> -    /// Coherent system memory.
> +    /// Coherent system memory (System DRAM).
>      CoherentSysmem = 1,
> -    /// Non-coherent system memory.
> +    /// Non-coherent system memory (System DRAM).
>      NoncoherentSysmem = 2,
>  }
>  

