Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DA04B3B2D9
	for <lists+dri-devel@lfdr.de>; Fri, 29 Aug 2025 08:03:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FAE610EB43;
	Fri, 29 Aug 2025 06:03:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="BIOUjcJB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2040.outbound.protection.outlook.com [40.107.92.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A0E010EB3E;
 Fri, 29 Aug 2025 06:03:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xK+/iKh33cCNSMqcjcPDSeYOisz5cKEa3w5s4yOi2EcfyiwEwjD2IFzcxytQr/n5duIH9yboLbHejfd4QYmHRNcB5bXV2KrdqFcoy419zGQUqrSlQruQ3Y7JpfoTBQ2XhveU7tIAAcL4ajvJHVmhpJe9GCdSQL+ZYXVH79VkVOGPWWZQnBvGMnt+5VPac5e/n6sdmPAICmZHi/seFW02RS8cYUCkUMnLqjtekVvwirEM0FdIW0vg/TnS3Iz8Xa1D+AlJal6H2i0Ums9kn/SpjQReJKzD4PI4akBTOOJn9lK0hIuyBjFVpSoXJgpcepeS0J5Bk8Mtv3l/Tb/OyEcqUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/tqiKdCO9ixtXxvBbTwB7dgZTsK4IOTlCksCmwKqV9E=;
 b=SKiZUreVa5xaW+8jnmLItAUsBXXMTwbM2NHlqzbHTpA5wg59McZGL2stjndKcEU8uJBUMLTDX2mCb1rn9OOITSfti5WHQuXofzxraf3mebAOfZSCpgA2E50raYdC6XiDGWF/CMDAsKQ/qh2SOcTY8IikFTfokiwCP582UVAIlcpktCbmzx4ZZ7oYkqed8ZYm5D4e1OMgKRenoGwcUr77zyVYeHAh21oVqKoQ7S3T8UNjxzBpADJh+sR1JnKnlUKckdcJ1+Y2BZXxl6jHYIoxsx2tsnfK4fcTqAe2C3WY9ApnkBlIAgfg5Wabf2SaFbjZN2AKyzRMI/ZjQNah45RJ8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/tqiKdCO9ixtXxvBbTwB7dgZTsK4IOTlCksCmwKqV9E=;
 b=BIOUjcJBZFsD99er3AnLYsmH4E5LVSUEZezvdydvh1rGWdDY+Che54faJSclLybTL7dpJf7DFQR69+p2aGlXRxsZ1amNqQGVEIHjLZP+FtMZ2oXcFJu/Px2/0QoeusLzQ4xVJu3K285atHd0BXr+/nSE+0Lpuu7STGSdOoszevkWE3VVEBvnkILKI//Qlz9nA0hRhqX8DxRbAI11TjkfSdM6VlTlsxOkf2NxDTvsUwIBDSPFkAwMgPuvgf3L3DpuAp8+C7s8x3Mwe0bzepcMH8UARP5d4oImwsalKh3rINQYVmiwa0JjX9OMjQMzsdcm88FhZnazU4eWeEa6D4DIBg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS1SPRMB0005.namprd12.prod.outlook.com (2603:10b6:8:1e3::12) by
 IA1PR12MB6113.namprd12.prod.outlook.com (2603:10b6:208:3eb::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9052.16; Fri, 29 Aug 2025 06:02:53 +0000
Received: from DS1SPRMB0005.namprd12.prod.outlook.com
 ([fe80::7629:20ac:4306:5f4f]) by DS1SPRMB0005.namprd12.prod.outlook.com
 ([fe80::7629:20ac:4306:5f4f%5]) with mapi id 15.20.9073.017; Fri, 29 Aug 2025
 06:02:52 +0000
Date: Fri, 29 Aug 2025 16:02:47 +1000
From: Alistair Popple <apopple@nvidia.com>
To: dri-devel@lists.freedesktop.org, dakr@kernel.org, acourbot@nvidia.com
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 John Hubbard <jhubbard@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>, 
 Timur Tabi <ttabi@nvidia.com>, linux-kernel@vger.kernel.org,
 nouveau@lists.freedesktop.org
Subject: Re: [PATCH 07/10] gpu: nova-core: gsp: Create RM registry and
 sysinfo commands
Message-ID: <c3vzd56o5wzakoarz7t7q5l64eqwqgo2i2gus4msyj73bhvngx@auengggfexy2>
References: <20250827082015.959430-1-apopple@nvidia.com>
 <20250827082015.959430-8-apopple@nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250827082015.959430-8-apopple@nvidia.com>
X-ClientProxiedBy: SYYP282CA0003.AUSP282.PROD.OUTLOOK.COM
 (2603:10c6:10:b4::13) To DS1SPRMB0005.namprd12.prod.outlook.com
 (2603:10b6:8:1e3::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1SPRMB0005:EE_|IA1PR12MB6113:EE_
X-MS-Office365-Filtering-Correlation-Id: f2e9d64f-cbc3-4d46-5327-08dde6c1b0a6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?9g3P3lU0DprlKZLPHNgyAMEiNGRsmWr2SG60hOK+uXh9t9a1YyXhwM580vbY?=
 =?us-ascii?Q?mB6TQvYp+uuh5fABpOK7QGsWQXNJSWPpWqJ8OhOJNoFUalHUgllNWXM5wKO+?=
 =?us-ascii?Q?UdnW9ej+1eTZNUc/FSEh9WsJ30pcruJt2wQb6cNN+mwbP/F04sWG7TOkv7fb?=
 =?us-ascii?Q?aYrr60R8Rzjh4GlktvNCdLoieYUghaRU7qB6DwurTYmq5QAcwI7LMAWcbegP?=
 =?us-ascii?Q?jnv3O+h5n9PS4JuI9nH5VMPfIy4GFUeifPMjbXzE3d4aGbT8RmklfYN2mkXJ?=
 =?us-ascii?Q?niYPcdwxT1Kb7GUsSg7xOj9jH+WqNQbU8H9/IPypw+zUOUduDISrH/b3zEVo?=
 =?us-ascii?Q?fPOig1UJ+nhQQXhVI48YqUt5sJAuE3OsVLjXr94K/g5iQxuO3VL0za6bxq3z?=
 =?us-ascii?Q?yXlwDTJGb6KOfZ/OG9B9Qe4PtD/VlhaQEcVfPXnyyAyTc1dNEE+xlhdkNz65?=
 =?us-ascii?Q?Pmmm7ViPp3jiCnjaNEYYe78bmHTxvILk3YHZXaTIloCHUP7PKskW7SGkwzjo?=
 =?us-ascii?Q?r5loy7uTgfwkITs404cFcdES8C0xaHDQ0L+iZ4ZdZpL+StWHPPzqLkVnC2re?=
 =?us-ascii?Q?ZLJYnJNYqP3Hdm5HhNO/2Vt6elp6R29JNR5YPFPmK+u+hGvHGnyFghwVOf/x?=
 =?us-ascii?Q?zJyx0Yx0Cd+XzvlEpu3nyxdOXBdoJD7KvqTlCPr6Z6m+vOGCb7gi6djXcvhz?=
 =?us-ascii?Q?mI3RJPE+ENpLiPx6mLwoP6KhwU580lDroEFvhYLy3dAFf7S2wRbtNNaO8XMB?=
 =?us-ascii?Q?b+7dZ1+rqk5G+bKoNBa8NSczbBqHP0Jfz60aOzDkfn5POX/H9LlZdqyItJCK?=
 =?us-ascii?Q?ZfEXr/WdgI//06TMSC9pMSt9aycsIr/qNOkF8efQN69CqaLeEzEOw4S9q9Ij?=
 =?us-ascii?Q?jSZ8NOnZ/VOquEd/HyqqEqd41lWCKFsaFSOxqb3OV87qZeYlqcK6oH+uoS5o?=
 =?us-ascii?Q?XqSEzL1v1rs2CgMjItdva/l0UAznuoNuz75mKvWkSotQxieKOG8ycwPgIKd2?=
 =?us-ascii?Q?yCpxkFnVG8QlXD2sXQJeGCvl/uQdp67zMvCR67iBigB+7DxA1QfbZw8s9ZPi?=
 =?us-ascii?Q?9DoOLuh14O332hPEQ5gFJUaJUrlSHN+uvCAOgt4brQvoUT9/H/JD1HFB2dSj?=
 =?us-ascii?Q?uaEI9dRjmD4exPa9XbMtUw9t67NNWhsKmlfI8FohBejh7XZt7sE/wHhn5+xJ?=
 =?us-ascii?Q?W9IngMu9kbXnkkCsZhkxSxFViVlRc9F9Mans+To0TrRYiy695Vw2Jzm8LFjM?=
 =?us-ascii?Q?OMhGaQ8cQDS+QOaECuhNsbfR6dghIu2uR2xUK/z8TTZQ3rhdtIvzwz/aXJEs?=
 =?us-ascii?Q?XPhBlRMNOSR+mPrFFNTTmCGLO7P6N8QqTCK+obGIfOY7IJoVsB4iMlD9guQ3?=
 =?us-ascii?Q?oXmbBQotAENNn4WbNfvWxV886bYqbaKudqpFARnYlg8QG6gGIzKohPniDZNH?=
 =?us-ascii?Q?tle7zuFOgX0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS1SPRMB0005.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Wjfj73aHAIoLhHOGcvlsFj288/DehGKIXS6VLLX47aM2IymMehSrHK1GLr0Y?=
 =?us-ascii?Q?2IgJ3HHXNX8sX5CczPS8NPxajtISOxFwvvsDONKUOHbG1LK2xZwYIB7rhOV0?=
 =?us-ascii?Q?cSPJnlrOKGMzoOMv6CCDVo/li3YiMbahrPq1MHI1tlbM3RV9C/CQ9j26hqt3?=
 =?us-ascii?Q?ozqhw744Fxx8DZ4pk5Q4mVgP5pbLYwFEFqZ8MfYEGA8pRzjQykkq7LxFJrGh?=
 =?us-ascii?Q?EqAPZCs4P1hhHZocvrDbo3jWAYiReMjmw/pWDg12bRKpSGtCKSnp6smQD7Mg?=
 =?us-ascii?Q?zN75pTS/sbr1g1rRoJYoMXsG3D5qaG7BuMDE28sljqCJggjJOJ9J/kpm0DUL?=
 =?us-ascii?Q?1TWcXDXyfLhR+W1oO5+sGWsHFbjEDCthtu8SiP5dEz+FmpuAeHDXuTkEPM/N?=
 =?us-ascii?Q?2OB43R+PHbZtVyaLGd/2oWViMxCSH5i/MqgxBJV/ru3dCEJRBxWhOlMd04SD?=
 =?us-ascii?Q?rvvbC49Sr2C0CFX/gABk6dvHI/aJH/pC4lbHef+5RKi80YPyrG9LnOeU/Jub?=
 =?us-ascii?Q?5/yrbdic79QKoGBVZiLhzrtVOSR+Fm1s7lzjMU9VyVV3s4EgcgTuxlrOoaNX?=
 =?us-ascii?Q?orQJo83Glqh+gMvgRHYk2pwhG8xVbHvTDWHdc/9IbhHeID9hlU0bSHzGBhqE?=
 =?us-ascii?Q?wlDtd0hsTmqQrie0hSLE7DtBeyqlz9tgtQsmi/eIMpvrdt5S2F2aitJ89GXG?=
 =?us-ascii?Q?dRuLI3jxfbrPa+cDwBSJfKDzeCuVZX5RcZ77W4xTTqQ2lCsi5+dMzlMiKNbu?=
 =?us-ascii?Q?06IkASVuAQlBB6LACgXZZDFX8UeNNslqkm1crL3DPy0lL0LERkVfe2pyRwbB?=
 =?us-ascii?Q?6MNr3IQBOOFQ+kfqXm2CTJO2Eljhny21Hk+mgVR/cig8CZz+/nrrTrofpQTY?=
 =?us-ascii?Q?sWCNLJMXMqsaNVkJUSSuXyVN4tglv5xnZrNq9lLGLS4qLJMluYKXcOLTNAmp?=
 =?us-ascii?Q?AirCbcaejlayaRogRCdEHzvZBZI15MYlHpOKl1FCFIwko/t1ohSpLi1wA/nG?=
 =?us-ascii?Q?PCgopY/n9xkUh5s9McO1kPs8xlgpVRoNNDJEJWZjVxiKsfL0rEE4prNPywAv?=
 =?us-ascii?Q?vZadwJ7uc+FMdvAyOj346IWXi1FLfLy5igO2IeotaEJcmql91fyPD3UUqwqy?=
 =?us-ascii?Q?SnAPX3wqHEiIK2fsIxe4PIxcIoMG5sIPNinZiuVk7HTEtwqx2Gi1i5JPHm27?=
 =?us-ascii?Q?uY/PVi7/ORZ6V/M+dbfaSOlR6BfkA0NHU9FWRpuMeYo51c1HyP9fVoOWtMit?=
 =?us-ascii?Q?dp2R6C65AFC/11N9SJqdEyZuDhqfTUy7TJfpBT5PqNl7SHxvIh6aydkgHDNY?=
 =?us-ascii?Q?gJb7H2zlT1Y2cH2NblYf6/KyVjnxISiVkBh8IQ6OxiQSYOA57xoD+dTB4YBI?=
 =?us-ascii?Q?GTWbF9zkgC4kBiYAki5kgAqzvNrDkY6otmMbleHuFDPoNIlpnBeFSCZdMK5z?=
 =?us-ascii?Q?j/8hzOWFvhmS3W8e9/Fm2YlfwFTF8kk4ZzrH3hbsgLrx+M0+YkKUUbM4Rt4E?=
 =?us-ascii?Q?9swYTH/VyOZ0YbHZEPEuGTvI+dsvqkFIVg6pnyVs00J6BPFDceyZXizMqm60?=
 =?us-ascii?Q?otMeHqt1262xpSK7a0WimxW7LTbHVieWH+XR0Olv?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f2e9d64f-cbc3-4d46-5327-08dde6c1b0a6
X-MS-Exchange-CrossTenant-AuthSource: DS1SPRMB0005.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2025 06:02:52.9026 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1mybvNy8N/GeLip61mwHEa5ycbVMYx6RCqxVvUQVc+RztCkREUXdjAxaNB60VD96xH7RqjocYZeBWxLzVVSSvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6113
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

On 2025-08-27 at 18:20 +1000, Alistair Popple <apopple@nvidia.com> wrote...
> Add the RM registry and system information commands that enable the host
> driver to configure GSP firmware parameters during initialization.
> 
> The RM registry is serialized into a packed format and sent via the
> command queue. For now only two parameters which are required to boot
> GSP are hardcoded. In future a kernel module parameter will be added to
> enable other parameters to be added.
> 
> Also add the system info command, which provides required hardware
> information to the GSP. These commands use the GSP command queue
> infrastructure to issue commands to the GSP which is read during GSP
> boot.
> 
> Signed-off-by: Alistair Popple <apopple@nvidia.com>
> ---
>  drivers/gpu/nova-core/gpu.rs                  |   2 +-
>  drivers/gpu/nova-core/gsp.rs                  |   7 +
>  drivers/gpu/nova-core/gsp/cmdq.rs             |   3 -
>  drivers/gpu/nova-core/gsp/commands.rs         | 201 ++++++++++++++++++
>  drivers/gpu/nova-core/nvfw.rs                 |   8 +
>  .../gpu/nova-core/nvfw/r570_144_bindings.rs   | 179 ++++++++++++++++
>  6 files changed, 396 insertions(+), 4 deletions(-)
>  create mode 100644 drivers/gpu/nova-core/gsp/commands.rs
> 
> diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
> index bf762353f1d91..c070bd581e2c9 100644
> --- a/drivers/gpu/nova-core/gpu.rs
> +++ b/drivers/gpu/nova-core/gpu.rs
> @@ -312,7 +312,7 @@ pub(crate) fn new(
>  
>          Self::run_fwsec_frts(pdev.as_ref(), &gsp_falcon, bar, &bios, &fb_layout)?;
>  
> -        let libos = gsp::GspMemObjects::new(pdev, &fw, &fb_layout)?;
> +        let libos = gsp::GspMemObjects::new(pdev, bar, &fw, &fb_layout)?;
>          let _libos_handle = libos.libos_dma_handle();
>          let _wpr_handle = libos.wpr_meta.dma_handle();
>  
> diff --git a/drivers/gpu/nova-core/gsp.rs b/drivers/gpu/nova-core/gsp.rs
> index 56a6be7b9eb15..9776c643f5276 100644
> --- a/drivers/gpu/nova-core/gsp.rs
> +++ b/drivers/gpu/nova-core/gsp.rs
> @@ -11,9 +11,11 @@
>  use kernel::sizes::SZ_128K;
>  use kernel::transmute::{AsBytes, FromBytes};
>  
> +use crate::driver::Bar0;
>  use crate::fb::FbLayout;
>  use crate::firmware::Firmware;
>  use crate::gsp::cmdq::GspCmdq;
> +use crate::gsp::commands::{build_registry, set_system_info};
>  use crate::nvfw::{
>      GspFwWprMeta, GspFwWprMetaBootInfo, GspFwWprMetaBootResumeInfo, LibosMemoryRegionInitArgument,
>      LibosMemoryRegionKind_LIBOS_MEMORY_REGION_CONTIGUOUS,
> @@ -23,6 +25,7 @@
>  };
>  
>  pub(crate) mod cmdq;
> +pub(crate) mod commands;
>  
>  pub(crate) const GSP_PAGE_SHIFT: usize = 12;
>  pub(crate) const GSP_PAGE_SIZE: usize = 1 << GSP_PAGE_SHIFT;
> @@ -176,6 +179,7 @@ fn create_coherent_dma_object<A: AsBytes + FromBytes>(
>  impl GspMemObjects {
>      pub(crate) fn new(
>          pdev: &pci::Device<device::Bound>,
> +        bar: &Bar0,
>          fw: &Firmware,
>          fb_layout: &FbLayout,
>      ) -> Result<Self> {
> @@ -218,6 +222,9 @@ pub(crate) fn new(
>          )?;
>          dma_write!(rmargs[0].bDmemStack = 1)?;
>  
> +        set_system_info(&mut cmdq, pdev, bar)?;
> +        build_registry(&mut cmdq, bar)?;
> +
>          Ok(GspMemObjects {
>              libos,
>              loginit,
> diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gsp/cmdq.rs
> index 134ed0e20d9e3..4e4fbaa81e8e7 100644
> --- a/drivers/gpu/nova-core/gsp/cmdq.rs
> +++ b/drivers/gpu/nova-core/gsp/cmdq.rs
> @@ -228,7 +228,6 @@ pub(crate) struct GspQueueCommand<'a> {
>  );
>  
>  impl<'a> GspQueueCommand<'a> {
> -    #[expect(unused)]
>      pub(crate) fn try_as<'b, M: GspCommandToGsp>(&'b mut self) -> GspQueueCommandData<'b, M> {
>          // SAFETY: The slice references the cmdq message memory which is
>          // guaranteed to outlive the returned GspQueueCommandData by the
> @@ -247,7 +246,6 @@ pub(crate) fn try_as<'b, M: GspCommandToGsp>(&'b mut self) -> GspQueueCommandDat
>          (msg, sbuf)
>      }
>  
> -    #[expect(unused)]
>      pub(crate) fn send_to_gsp(self, bar: &Bar0) -> Result {
>          self.cmdq.wait_for_free_cmd_to_gsp(
>              Delta::from_secs(GSP_COMMAND_TIMEOUT),
> @@ -361,7 +359,6 @@ pub(crate) fn wait_for_free_cmd_to_gsp(&self, timeout: Delta, size: usize) -> Re
>          })
>      }
>  
> -    #[expect(unused)]
>      pub(crate) fn alloc_gsp_queue_command<'a>(
>          &'a mut self,
>          cmd_size: usize,
> diff --git a/drivers/gpu/nova-core/gsp/commands.rs b/drivers/gpu/nova-core/gsp/commands.rs
> new file mode 100644
> index 0000000000000..12ea8cdec21db
> --- /dev/null
> +++ b/drivers/gpu/nova-core/gsp/commands.rs
> @@ -0,0 +1,201 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +use core::alloc::Layout;
> +
> +use kernel::alloc::allocator::Kmalloc;
> +use kernel::alloc::Allocator;
> +use kernel::build_assert;
> +use kernel::device;
> +use kernel::pci;
> +use kernel::prelude::*;
> +use kernel::transmute::{AsBytes, FromBytes};
> +
> +use crate::driver::Bar0;
> +use crate::gsp::cmdq::GspCommandToGsp;
> +use crate::gsp::cmdq::GspCmdq;
> +use crate::gsp::GSP_PAGE_SIZE;
> +use crate::nvfw::{
> +    NV_VGPU_MSG_FUNCTION_SET_REGISTRY,
> +    NV_VGPU_MSG_FUNCTION_GSP_SET_SYSTEM_INFO,
> +    GspSystemInfo,
> +    PACKED_REGISTRY_TABLE,
> +    PACKED_REGISTRY_ENTRY,
> +    REGISTRY_TABLE_ENTRY_TYPE_DWORD,

I see I must have somehow missed running rustfmt on this file (probably due to
resolving a merge conflict). I will make sure that happens for v2.

> +};
> +use crate::sbuffer::SBuffer;
> +
> +// SAFETY: These structs don't meet the no-padding requirements of AsBytes but
> +//         that is not a problem because they are not used outside the kernel.
> +unsafe impl AsBytes for GspSystemInfo {}
> +
> +// SAFETY: These structs don't meet the no-padding requirements of FromBytes but
> +//         that is not a problem because they are not used outside the kernel.
> +unsafe impl FromBytes for GspSystemInfo {}
> +
> +const GSP_REGISTRY_NUM_ENTRIES: usize = 2;
> +struct RegistryEntry {
> +    key: &'static str,
> +    value: u32,
> +}
> +
> +struct RegistryTable {
> +    entries: [RegistryEntry; GSP_REGISTRY_NUM_ENTRIES],
> +}
> +
> +struct GspRegistryTable;
> +impl GspCommandToGsp for GspRegistryTable {
> +    const FUNCTION: u32 = NV_VGPU_MSG_FUNCTION_SET_REGISTRY;
> +}
> +
> +impl RegistryTable {
> +    fn serialize_registry_table(&self) -> Result<KVec<u8>> {
> +        let entries = &self.entries;
> +        let total_size = self.size();
> +        let align = core::mem::align_of::<PACKED_REGISTRY_TABLE>();
> +        let layout = Layout::from_size_align(total_size, align).map_err(|_| ENOMEM)?;
> +        debug_assert_eq!(layout.size(), total_size);
> +        let mut string_data_offset = size_of::<PACKED_REGISTRY_TABLE>()
> +            + GSP_REGISTRY_NUM_ENTRIES * size_of::<PACKED_REGISTRY_ENTRY>();
> +        let allocation = Kmalloc::alloc(layout, GFP_KERNEL)?;
> +        let ptr = allocation.as_ptr().cast::<u8>();
> +
> +        // We allocate the memory for the vector ourselves to ensure it has the
> +        // correct layout to cast to a PACKED_REGISTRY_TABLE and subsequent
> +        // fw:PACKED_REGISTRY_ENTRIES.
> +        //
> +        // SAFETY:
> +        //  - ptr was allocated with Kmalloc as required for KVec.
> +        //  - ptr trivally meets the alignment requirements for u8.
> +        //  - No elements have been initialised so this is zero length.
> +        //  - The capacity matches the total size of the allocation.
> +        let mut table_vec = unsafe { KVec::<u8>::from_raw_parts(ptr, 0, layout.size()) };
> +        let table_slice = table_vec.spare_capacity_mut();
> +        let table = table_slice.as_mut_ptr().cast::<PACKED_REGISTRY_TABLE>();
> +
> +        // SAFETY: We ensured the alignment was correct when allocating the vector.
> +        unsafe {
> +            // Set the table header
> +            (*table).numEntries = GSP_REGISTRY_NUM_ENTRIES as u32;
> +            (*table).size = total_size as u32;
> +        }
> +
> +        for (i, entry) in entries.iter().enumerate().take(GSP_REGISTRY_NUM_ENTRIES) {
> +            // SAFETY: The allocation meets the alignment requirements for
> +            // fw::PACKED_REGISTRY_TABLE which includes a zero length array for the entries.
> +            unsafe {
> +                let entry_ptr = table_slice
> +                    .as_mut_ptr()
> +                    .add(
> +                        size_of::<PACKED_REGISTRY_TABLE>()
> +                            + i * size_of::<PACKED_REGISTRY_ENTRY>(),
> +                    )
> +                    .cast::<PACKED_REGISTRY_ENTRY>();
> +
> +                // Set entry metadata
> +                (*entry_ptr).nameOffset = string_data_offset as u32;
> +                (*entry_ptr).type_ = REGISTRY_TABLE_ENTRY_TYPE_DWORD as u8;
> +                (*entry_ptr).data = entry.value;
> +                (*entry_ptr).length = 0;
> +            }
> +
> +            let key_bytes = entry.key.as_bytes();
> +            let string_dest_slice =
> +                &mut table_slice[string_data_offset..string_data_offset + key_bytes.len() + 1];
> +
> +            // Can't use copy_from_slice() because string_dest_slice is MaybeUninit<u8>.
> +            for (i, &byte) in key_bytes.iter().enumerate() {
> +                string_dest_slice[i].write(byte);
> +            }
> +
> +            // Add null terminator
> +            string_dest_slice[key_bytes.len()].write(0);
> +
> +            // Update offset for next string
> +            string_data_offset += string_dest_slice.len();
> +        }
> +
> +        debug_assert_eq!(total_size, string_data_offset);
> +
> +        // SAFETY: All data has been written to as asserted above and the
> +        // capacity matches the original allocation.
> +        unsafe { table_vec.inc_len(layout.size()) };
> +
> +        Ok(table_vec)
> +    }
> +
> +    fn copy_to_sbuf_iter(&self, mut sbuf: SBuffer<core::array::IntoIter<&mut [u8], 2>>) -> Result {
> +        let table_vec = self.serialize_registry_table()?;
> +        sbuf.write_all(&table_vec)?;
> +        Ok(())
> +    }
> +
> +    fn size(&self) -> usize {
> +        let mut key_size = 0;
> +        for i in 0..GSP_REGISTRY_NUM_ENTRIES {
> +            key_size += self.entries[i].key.len() + 1; // +1 for NULL terminator
> +        }
> +        size_of::<PACKED_REGISTRY_TABLE>()
> +            + GSP_REGISTRY_NUM_ENTRIES * size_of::<PACKED_REGISTRY_ENTRY>()
> +            + key_size
> +    }
> +}
> +
> +pub(crate) fn build_registry(cmdq: &mut GspCmdq, bar: &Bar0) -> Result {
> +    let registry = RegistryTable {
> +        entries: [
> +            RegistryEntry {
> +                key: "RMSecBusResetEnable",
> +                value: 1,
> +            },
> +            RegistryEntry {
> +                key: "RMForcePcieConfigSave",
> +                value: 1,
> +            },
> +        ],
> +    };
> +    let mut msg = cmdq.alloc_gsp_queue_command(registry.size())?;
> +    {
> +        let (_, some_sbuf) = msg.try_as::<GspRegistryTable>();
> +        let sbuf = some_sbuf.ok_or(ENOMEM)?;
> +        registry.copy_to_sbuf_iter(sbuf)?;
> +    }
> +    msg.send_to_gsp(bar)?;
> +
> +    Ok(())
> +}
> +
> +impl GspCommandToGsp for GspSystemInfo {
> +    const FUNCTION: u32 = NV_VGPU_MSG_FUNCTION_GSP_SET_SYSTEM_INFO;
> +}
> +
> +pub(crate) fn set_system_info(
> +    cmdq: &mut GspCmdq,
> +    dev: &pci::Device<device::Bound>,
> +    bar: &Bar0,
> +) -> Result {
> +    build_assert!(size_of::<GspSystemInfo>() < GSP_PAGE_SIZE);
> +    let mut msg = cmdq.alloc_gsp_queue_command(size_of::<GspSystemInfo>())?;
> +    {
> +        let (info, _) = msg.try_as::<GspSystemInfo>();
> +
> +        info.gpuPhysAddr = dev.resource_start(0)?;
> +        info.gpuPhysFbAddr = dev.resource_start(1)?;
> +        info.gpuPhysInstAddr = dev.resource_start(3)?;
> +        info.nvDomainBusDeviceFunc = u64::from(dev.dev_id());
> +
> +        // Using TASK_SIZE in r535_gsp_rpc_set_system_info() seems wrong because
> +        // TASK_SIZE is per-task. That's probably a design issue in GSP-RM though.
> +        info.maxUserVa = (1 << 47) - 4096;
> +        info.pciConfigMirrorBase = 0x088000;
> +        info.pciConfigMirrorSize = 0x001000;
> +
> +        info.PCIDeviceID = (u32::from(dev.device_id()) << 16) | u32::from(dev.vendor_id());
> +        info.PCISubDeviceID =
> +            (u32::from(dev.subsystem_device_id()) << 16) | u32::from(dev.subsystem_vendor_id());
> +        info.PCIRevisionID = u32::from(dev.revision_id());
> +        info.bIsPrimary = 0;
> +        info.bPreserveVideoMemoryAllocations = 0;
> +    }
> +    msg.send_to_gsp(bar)?;
> +    Ok(())
> +}
> diff --git a/drivers/gpu/nova-core/nvfw.rs b/drivers/gpu/nova-core/nvfw.rs
> index 3d934cc95feb0..aa883d4588388 100644
> --- a/drivers/gpu/nova-core/nvfw.rs
> +++ b/drivers/gpu/nova-core/nvfw.rs
> @@ -42,6 +42,9 @@ pub(crate) struct LibosParams {
>  pub(crate) use r570_144::GspFwWprMeta;
>  
>  pub(crate) use r570_144::{
> +    // Core GSP structures
> +    GspSystemInfo,
> +
>      // LibOS memory structures
>      LibosMemoryRegionInitArgument,
>      LibosMemoryRegionKind_LIBOS_MEMORY_REGION_CONTIGUOUS,
> @@ -87,6 +90,11 @@ pub(crate) struct LibosParams {
>      NV_VGPU_MSG_FUNCTION_NOP,
>      NV_VGPU_MSG_FUNCTION_SET_GUEST_SYSTEM_INFO,
>      NV_VGPU_MSG_FUNCTION_SET_REGISTRY,
> +
> +    // RM registry structures
> +    PACKED_REGISTRY_ENTRY,
> +    PACKED_REGISTRY_TABLE,
> +    REGISTRY_TABLE_ENTRY_TYPE_DWORD,
>  };
>  
>  pub(crate) type GspFwWprMetaBootResumeInfo = r570_144::GspFwWprMeta__bindgen_ty_1;
> diff --git a/drivers/gpu/nova-core/nvfw/r570_144_bindings.rs b/drivers/gpu/nova-core/nvfw/r570_144_bindings.rs
> index ab331fe6b1c81..3832d0b7a0b92 100644
> --- a/drivers/gpu/nova-core/nvfw/r570_144_bindings.rs
> +++ b/drivers/gpu/nova-core/nvfw/r570_144_bindings.rs
> @@ -1,5 +1,35 @@
>  // SPDX-License-Identifier: GPL-2.0
>  
> +#[repr(C)]
> +#[derive(Default)]
> +pub struct __IncompleteArrayField<T>(::core::marker::PhantomData<T>, [T; 0]);
> +impl<T> __IncompleteArrayField<T> {
> +    #[inline]
> +    pub const fn new() -> Self {
> +        __IncompleteArrayField(::core::marker::PhantomData, [])
> +    }
> +    #[inline]
> +    pub fn as_ptr(&self) -> *const T {
> +        self as *const _ as *const T
> +    }
> +    #[inline]
> +    pub fn as_mut_ptr(&mut self) -> *mut T {
> +        self as *mut _ as *mut T
> +    }
> +    #[inline]
> +    pub unsafe fn as_slice(&self, len: usize) -> &[T] {
> +        ::core::slice::from_raw_parts(self.as_ptr(), len)
> +    }
> +    #[inline]
> +    pub unsafe fn as_mut_slice(&mut self, len: usize) -> &mut [T] {
> +        ::core::slice::from_raw_parts_mut(self.as_mut_ptr(), len)
> +    }
> +}
> +impl<T> ::core::fmt::Debug for __IncompleteArrayField<T> {
> +    fn fmt(&self, fmt: &mut ::core::fmt::Formatter<'_>) -> ::core::fmt::Result {
> +        fmt.write_str("__IncompleteArrayField")
> +    }
> +}
>  pub const GSP_FW_HEAP_PARAM_OS_SIZE_LIBOS2: u32 = 0;
>  pub const GSP_FW_HEAP_PARAM_OS_SIZE_LIBOS3_BAREMETAL: u32 = 23068672;
>  pub const GSP_FW_HEAP_PARAM_BASE_RM_SIZE_TU10X: u32 = 8388608;
> @@ -11,6 +41,7 @@
>  pub const GSP_FW_HEAP_SIZE_OVERRIDE_LIBOS3_BAREMETAL_MAX_MB: u32 = 280;
>  pub const GSP_FW_WPR_META_REVISION: u32 = 1;
>  pub const GSP_FW_WPR_META_MAGIC: i64 = -2577556379034558285;
> +pub const REGISTRY_TABLE_ENTRY_TYPE_DWORD: u32 = 1;
>  pub type __u8 = ffi::c_uchar;
>  pub type __u16 = ffi::c_ushort;
>  pub type __u32 = ffi::c_uint;
> @@ -289,6 +320,138 @@
>  pub type _bindgen_ty_3 = ffi::c_uint;
>  #[repr(C)]
>  #[derive(Debug, Default, Copy, Clone)]
> +pub struct DOD_METHOD_DATA {
> +    pub status: u32_,
> +    pub acpiIdListLen: u32_,
> +    pub acpiIdList: [u32_; 16usize],
> +}
> +#[repr(C)]
> +#[derive(Debug, Default, Copy, Clone)]
> +pub struct JT_METHOD_DATA {
> +    pub status: u32_,
> +    pub jtCaps: u32_,
> +    pub jtRevId: u16_,
> +    pub bSBIOSCaps: u8_,
> +    pub __bindgen_padding_0: u8,
> +}
> +#[repr(C)]
> +#[derive(Debug, Default, Copy, Clone)]
> +pub struct MUX_METHOD_DATA_ELEMENT {
> +    pub acpiId: u32_,
> +    pub mode: u32_,
> +    pub status: u32_,
> +}
> +#[repr(C)]
> +#[derive(Debug, Default, Copy, Clone)]
> +pub struct MUX_METHOD_DATA {
> +    pub tableLen: u32_,
> +    pub acpiIdMuxModeTable: [MUX_METHOD_DATA_ELEMENT; 16usize],
> +    pub acpiIdMuxPartTable: [MUX_METHOD_DATA_ELEMENT; 16usize],
> +    pub acpiIdMuxStateTable: [MUX_METHOD_DATA_ELEMENT; 16usize],
> +}
> +#[repr(C)]
> +#[derive(Debug, Default, Copy, Clone)]
> +pub struct CAPS_METHOD_DATA {
> +    pub status: u32_,
> +    pub optimusCaps: u32_,
> +}
> +#[repr(C)]
> +#[derive(Debug, Default, Copy, Clone)]
> +pub struct ACPI_METHOD_DATA {
> +    pub bValid: u8_,
> +    pub __bindgen_padding_0: [u8; 3usize],
> +    pub dodMethodData: DOD_METHOD_DATA,
> +    pub jtMethodData: JT_METHOD_DATA,
> +    pub muxMethodData: MUX_METHOD_DATA,
> +    pub capsMethodData: CAPS_METHOD_DATA,
> +}
> +#[repr(C)]
> +#[derive(Debug, Default, Copy, Clone)]
> +pub struct BUSINFO {
> +    pub deviceID: u16_,
> +    pub vendorID: u16_,
> +    pub subdeviceID: u16_,
> +    pub subvendorID: u16_,
> +    pub revisionID: u8_,
> +    pub __bindgen_padding_0: u8,
> +}
> +#[repr(C)]
> +#[derive(Debug, Default, Copy, Clone)]
> +pub struct GSP_VF_INFO {
> +    pub totalVFs: u32_,
> +    pub firstVFOffset: u32_,
> +    pub FirstVFBar0Address: u64_,
> +    pub FirstVFBar1Address: u64_,
> +    pub FirstVFBar2Address: u64_,
> +    pub b64bitBar0: u8_,
> +    pub b64bitBar1: u8_,
> +    pub b64bitBar2: u8_,
> +    pub __bindgen_padding_0: [u8; 5usize],
> +}
> +#[repr(C)]
> +#[derive(Debug, Default, Copy, Clone)]
> +pub struct GSP_PCIE_CONFIG_REG {
> +    pub linkCap: u32_,
> +}
> +#[repr(C)]
> +#[derive(Debug, Default, Copy, Clone)]
> +pub struct GspSystemInfo {
> +    pub gpuPhysAddr: u64_,
> +    pub gpuPhysFbAddr: u64_,
> +    pub gpuPhysInstAddr: u64_,
> +    pub gpuPhysIoAddr: u64_,
> +    pub nvDomainBusDeviceFunc: u64_,
> +    pub simAccessBufPhysAddr: u64_,
> +    pub notifyOpSharedSurfacePhysAddr: u64_,
> +    pub pcieAtomicsOpMask: u64_,
> +    pub consoleMemSize: u64_,
> +    pub maxUserVa: u64_,
> +    pub pciConfigMirrorBase: u32_,
> +    pub pciConfigMirrorSize: u32_,
> +    pub PCIDeviceID: u32_,
> +    pub PCISubDeviceID: u32_,
> +    pub PCIRevisionID: u32_,
> +    pub pcieAtomicsCplDeviceCapMask: u32_,
> +    pub oorArch: u8_,
> +    pub __bindgen_padding_0: [u8; 7usize],
> +    pub clPdbProperties: u64_,
> +    pub Chipset: u32_,
> +    pub bGpuBehindBridge: u8_,
> +    pub bFlrSupported: u8_,
> +    pub b64bBar0Supported: u8_,
> +    pub bMnocAvailable: u8_,
> +    pub chipsetL1ssEnable: u32_,
> +    pub bUpstreamL0sUnsupported: u8_,
> +    pub bUpstreamL1Unsupported: u8_,
> +    pub bUpstreamL1PorSupported: u8_,
> +    pub bUpstreamL1PorMobileOnly: u8_,
> +    pub bSystemHasMux: u8_,
> +    pub upstreamAddressValid: u8_,
> +    pub FHBBusInfo: BUSINFO,
> +    pub chipsetIDInfo: BUSINFO,
> +    pub __bindgen_padding_1: [u8; 2usize],
> +    pub acpiMethodData: ACPI_METHOD_DATA,
> +    pub hypervisorType: u32_,
> +    pub bIsPassthru: u8_,
> +    pub __bindgen_padding_2: [u8; 7usize],
> +    pub sysTimerOffsetNs: u64_,
> +    pub gspVFInfo: GSP_VF_INFO,
> +    pub bIsPrimary: u8_,
> +    pub isGridBuild: u8_,
> +    pub __bindgen_padding_3: [u8; 2usize],
> +    pub pcieConfigReg: GSP_PCIE_CONFIG_REG,
> +    pub gridBuildCsp: u32_,
> +    pub bPreserveVideoMemoryAllocations: u8_,
> +    pub bTdrEventSupported: u8_,
> +    pub bFeatureStretchVblankCapable: u8_,
> +    pub bEnableDynamicGranularityPageArrays: u8_,
> +    pub bClockBoostSupported: u8_,
> +    pub bRouteDispIntrsToCPU: u8_,
> +    pub __bindgen_padding_4: [u8; 6usize],
> +    pub hostPageSize: u64_,
> +}
> +#[repr(C)]
> +#[derive(Debug, Default, Copy, Clone)]
>  pub struct MESSAGE_QUEUE_INIT_ARGUMENTS {
>      pub sharedMemPhysAddr: u64_,
>      pub pageTableEntryCount: u32_,
> @@ -446,3 +609,19 @@ pub struct LibosMemoryRegionInitArgument {
>      pub loc: u8_,
>      pub __bindgen_padding_0: [u8; 6usize],
>  }
> +#[repr(C)]
> +#[derive(Debug, Default, Copy, Clone)]
> +pub struct PACKED_REGISTRY_ENTRY {
> +    pub nameOffset: u32_,
> +    pub type_: u8_,
> +    pub __bindgen_padding_0: [u8; 3usize],
> +    pub data: u32_,
> +    pub length: u32_,
> +}
> +#[repr(C)]
> +#[derive(Debug, Default)]
> +pub struct PACKED_REGISTRY_TABLE {
> +    pub size: u32_,
> +    pub numEntries: u32_,
> +    pub entries: __IncompleteArrayField<PACKED_REGISTRY_ENTRY>,
> +}
> -- 
> 2.47.2
> 
