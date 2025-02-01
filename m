Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63A98A246F8
	for <lists+dri-devel@lfdr.de>; Sat,  1 Feb 2025 05:01:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C72110E269;
	Sat,  1 Feb 2025 04:01:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="UDL6Xuiz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2077.outbound.protection.outlook.com [40.107.223.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29D0010E0F3;
 Sat,  1 Feb 2025 04:01:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sA0IxO/E1nOIyo2kPAOq9stKKxCOP3j134y32Ad/QZZWgVwTK9O6xUrYCI4T9AQerF6L8045TT7z9ZTAjbtcVG8/uB+k0RjlI5VsF9nb7mg6U5fBEW29fMXkjWkEtkMJaKAI2dyduoUSRbz/eRGmh6KEGAexjdX2FIwvKFBqHkVx689PlWDhunSMxpDIiKMRSodMvHSniVfgaeQj4RcGvgjTPQWdpogLbaVSSJxLifz1VLbFnpZ/cO6KBMK37sz/E5qw+a1R1w9bIUIHKvVEH9RfwXBUWu0geNr1Q/K08CIRX6Ev+HtFdkt/VYbJHbU4ySXOs3nWvMbVouaLqG/cTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FuaR70T4EUUKwmWayD1XQ7bsEXjkxrKieCoYrV89taw=;
 b=IxLwbf2cHcv9fHFUHm7VSwaQHo78Hee7JAfwHqoYvdl2USY9XZ5qm4m3oXfj2mWj75f4ialJNVxrX1c8PzbsbF7Q1tdSI4QT8vMm3kzyxt5bM8wbznlvdF6LVUxGhCPSJUX7b3anfueb0VZlrEHwPo6XDrt4fRJyK+tha8qP4YczvtJ0WZ8q8AwV0q9XjwcePemdo/Z4g+ejki21KbvHtQsnbgj3HkaA5Ox/57evxQJRZaLmkPZB0dwH8LuRzvXSopSahqu7acLDXhMaSiBymKyns9+33sZrS5sZTj6jqT3VB9j+pym2O1DD22ATqdibURxA7LTVoPVFOvIFehNzOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FuaR70T4EUUKwmWayD1XQ7bsEXjkxrKieCoYrV89taw=;
 b=UDL6XuizKmNpui2rr53G4VL0uJEBa6haBEFUKnLnacHJKV5JCWff7GnuVrEvTamrz7Qt82l50CRCUWqEFJrrYoQlwJM0RgFyMPqHijt2CJplOkPoy5QDE+WzpSsPo6H5sqztQWfDbrnKF5w75vbDLY9BhImuTOw62okTiHHT71j1mtGHqSrIIqzoERqph166Got/I5G9isgP3A/KMRIEG69eHM+49ZTtNbkMdQDnVJu0EqSP8grchFEddh90E1RaI0aiMTTFGe/TjscM/6yB0YYbOWMar+4MjyN3u0Y/LZe17do0jOeobqLtT41W82n7D7ZzKNqYZ6UsWuhMEa4Siw==
Received: from DS7PR03CA0205.namprd03.prod.outlook.com (2603:10b6:5:3b6::30)
 by CH3PR12MB9147.namprd12.prod.outlook.com (2603:10b6:610:19a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.17; Sat, 1 Feb
 2025 04:01:18 +0000
Received: from CY4PEPF0000E9D0.namprd03.prod.outlook.com
 (2603:10b6:5:3b6:cafe::d8) by DS7PR03CA0205.outlook.office365.com
 (2603:10b6:5:3b6::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.21 via Frontend Transport; Sat,
 1 Feb 2025 04:01:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CY4PEPF0000E9D0.mail.protection.outlook.com (10.167.241.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8398.14 via Frontend Transport; Sat, 1 Feb 2025 04:01:18 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 31 Jan
 2025 20:01:01 -0800
Received: from [10.110.48.28] (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Fri, 31 Jan
 2025 20:01:00 -0800
Message-ID: <35d74754-ed0c-4f6d-817e-86638ca2bb70@nvidia.com>
Date: Fri, 31 Jan 2025 20:01:00 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] gpu: nova-core: add initial driver stub
To: Danilo Krummrich <dakr@kernel.org>, <airlied@gmail.com>,
 <simona@ffwll.ch>, <corbet@lwn.net>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <tzimmermann@suse.de>, <ajanulgu@redhat.com>,
 <lyude@redhat.com>, <pstanner@redhat.com>, <zhiw@nvidia.com>,
 <cjia@nvidia.com>, <bskeggs@nvidia.com>, <acurrid@nvidia.com>
CC: <ojeda@kernel.org>, <alex.gaynor@gmail.com>, <boqun.feng@gmail.com>,
 <gary@garyguo.net>, <bjorn3_gh@protonmail.com>, <benno.lossin@proton.me>,
 <a.hindborg@kernel.org>, <aliceryhl@google.com>, <tmgross@umich.edu>,
 <dri-devel@lists.freedesktop.org>, <linux-doc@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <nouveau@lists.freedesktop.org>,
 <rust-for-linux@vger.kernel.org>
References: <20250131220432.17717-1-dakr@kernel.org>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <20250131220432.17717-1-dakr@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D0:EE_|CH3PR12MB9147:EE_
X-MS-Office365-Filtering-Correlation-Id: 692f1f06-ec50-4aea-bc08-08dd427514a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|36860700013|82310400026|1800799024|7053199007|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eVF6UUhBTENyR1dMaGRyR0FIQ3JDVW1WRGFXb0VWbjlZc2FOblZtZUp0N2hG?=
 =?utf-8?B?ekUrMjJyWjdEUmhSdEJ1aFBCNXZ3MzU1YWRxdzFmclM5SUlYQ0ZFUHMzWUVD?=
 =?utf-8?B?M1FNanJyQmJWUHhML0R1WU5BY0pIcnF2YlhRNmlpNmVPS09GanY2S3NPQ0dY?=
 =?utf-8?B?cW0xbGt1aUV0OGxUYktGK1VuUG9WYndqUnBRamlueThHUGN5WCtETjJqTzlk?=
 =?utf-8?B?aXNlTktDQlpYQVV2RC9mOHcyam1hcDlLN1gxamQ2anZ3cjlzQlNNZk41TjdI?=
 =?utf-8?B?bjQ5Q1dVNlZhMnlJWWFWWjFWeldGRXE3VFFCNW9qVlozSW1uMFZEcndmSzFk?=
 =?utf-8?B?WFZPTWJkSUQ0YmxNQXY0bDc0T082cjBWVGlGVEJJZmNTUlBqZy80SzJjaEEy?=
 =?utf-8?B?RStsL2RCV3BsMHMzaitVRXBaWVE0ZWYzbFFMeUQ2QXAzNWw1RWhvM2hSTHcw?=
 =?utf-8?B?ckZBRU5WSzE3NmwyN1VlMnpkOVdxaStINFgrMzRvMThTMFFDMExBQm9YTSty?=
 =?utf-8?B?b0o4UEtkR3c0VVU1bG5VNlRvTzZrak1DSmw3L3ZOZEcyOWc1RHVoV040eE1S?=
 =?utf-8?B?Zm5iNTZjcUhTZXZIeDVYYkRBQnFHRGFiTUJVcWo5TTl6bm11S1dGV2J2SWV6?=
 =?utf-8?B?aXJqcWRJTnd1dUZLbEJScVJNUjd2Sm94T2RNcUovTDVOQktZczQ1WFFFSXl0?=
 =?utf-8?B?STRvOTNKaXo0d3pQTzF6aDhuV3czbUxTcjJTL0FFd0d6OWFHUG4zS0YvazlG?=
 =?utf-8?B?eUU0ZGg0Q3loRXR0RDRuQW9uU0JLNU1iNlNoNHJWeE5XeFlJMDNlT2wraU1r?=
 =?utf-8?B?NC9uaFg2OTdoV3Z3RGx1enQ5c1ZVRzF6RFgvM2U5YmNNblpxWCtEbXpLOEcw?=
 =?utf-8?B?aFJJVFJCVjZUL3RnNFNqcDhPRWUwRVNiQjBxY1VvZ1FXdkNwZDlDcFhpcmwy?=
 =?utf-8?B?Q3ljQ09lanZiVUk5WlVXQk9QazJocjZOVjdZTXpSdTNvZkRvclBrclUwZ09P?=
 =?utf-8?B?Q2Y3aGRWc3JzV2NYZXQzUEJnd2VSaWs1ay82OWhEMkt2WGhHUUVkZFN4UEQz?=
 =?utf-8?B?MzNJbHV4bnpGQkpwbHNBQkRLM0pnKytYOTNkdngwb1BhVkdCNldDY3RoakVZ?=
 =?utf-8?B?TXpZREVQZ2tCaGhjWk5zZlo1eUltdUhGSjVVaUNIWnkwRnNGTkhGKzhGN0Vi?=
 =?utf-8?B?ckRLdnRlVWYyQnNnaHdXV1VuSVhyVGg4VHo5N2xlSXU4cjgydExBZHdFa3RL?=
 =?utf-8?B?RXFKc0dNQVZjRmlJOHhSMlM4UVJiSm1WQTlYSW5rbjhBR1d3aENwSFRUODNE?=
 =?utf-8?B?ejZ3TGJuNmpnMGNIV2VTUDZtYTJ1ZkxDajhLSWcvZTB4RzBrL2lPRXhyR2xl?=
 =?utf-8?B?TGRBODZaRVRPT1RaQUdjV2pWc0ZUWmNIVnJSMXdsakg5MkRsdFY5TGpLek8r?=
 =?utf-8?B?ZkF1Y3RoSDJjREVlVHo0cjFaYVRHanZEWXhuRFg2VUpIaExsUGtiTzFYWUgz?=
 =?utf-8?B?TDlYY2dHM0dpa2lXcUNaTkVQNHpVeURwS2hGT2pSYUFZdmhWWjdHK1VMUEdi?=
 =?utf-8?B?QnJVaHVnR281QmNuSGtvWWFtNkkvZjB2WWwwOW4vZ0tiMGNSQ0RRUEs4NFZJ?=
 =?utf-8?B?aENaczcvVlJiQ3JTWHVmNFVXNW95aytwa1laOEJKOUFROHRnTUUvdTBQYU9I?=
 =?utf-8?B?OHJhYW9xZzNJWVdnYXVjYlJBUzNVZnl6OEdiY2ZEVjBYZmQvOUtlK0dWcEJy?=
 =?utf-8?B?RlhYM040emNKUkJHeEVpeHVEbnA2dkx0cVR0YWR5M2N3QzdoRjhyZDNXR3VH?=
 =?utf-8?B?L2VVdVdJTEFaRnZac3RBRk9IK3BnOXZndnd3R0x3dG94c3VJZHBZS2JGUnc0?=
 =?utf-8?B?ZjhlcGxUT2o2VG1lWFNxdTJDOXFHL09tVDdSYVdlRHQ1OTN5czluTldHOHF0?=
 =?utf-8?B?NjlSNFBVKzNzSlc0VkU1T2VVd2pmOEU4dTlqcWlrbmZ6WSs3M1hLK0RKcUFw?=
 =?utf-8?B?MUtvWVBKVzVUWkkyOHYxNVU4S0FRYUdYbSs2WmN4VVArYVlwV21MSFZ3SU9X?=
 =?utf-8?Q?FGNBLG?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(36860700013)(82310400026)(1800799024)(7053199007)(921020);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2025 04:01:18.0659 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 692f1f06-ec50-4aea-bc08-08dd427514a9
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000E9D0.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9147
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

On 1/31/25 2:04 PM, Danilo Krummrich wrote:
> Add the initial nova-core driver stub.
> 
> nova-core is intended to serve as a common base for nova-drm (the
> corresponding DRM driver) and the vGPU manager VFIO driver, serving as a
> hard- and firmware abstraction layer for GSP-based NVIDIA GPUs.
> 
> The Nova project, including nova-core and nova-drm, in the long term,
> is intended to serve as the successor of Nouveau for all GSP-based GPUs.
> 
> The motivation for both, starting a successor project for Nouveau and
> doing so using the Rust programming language, is documented in detail
> through a previous post on the mailing list [1], an LWN article [2] and a
> talk from LPC '24.
> 
> In order to avoid the chicken and egg problem to require a user to
> upstream Rust abstractions, but at the same time require the Rust
> abstractions to implement the driver, nova-core kicks off as a driver
> stub and is subsequently developed upstream.
> 
> Link: https://lore.kernel.org/dri-devel/Zfsj0_tb-0-tNrJy@cassiopeiae/T/#u [1]
> Link: https://lwn.net/Articles/990736/ [2]
> Link: https://youtu.be/3Igmx28B3BQ?si=sBdSEer4tAPKGpOs [3]
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>
> ---
>   MAINTAINERS                        |  10 ++
>   drivers/gpu/Makefile               |   1 +
>   drivers/gpu/nova-core/Kconfig      |  13 +++
>   drivers/gpu/nova-core/Makefile     |   3 +
>   drivers/gpu/nova-core/driver.rs    |  47 ++++++++
>   drivers/gpu/nova-core/gpu.rs       | 171 +++++++++++++++++++++++++++++
>   drivers/gpu/nova-core/nova_core.rs |  14 +++
>   drivers/video/Kconfig              |   1 +
>   8 files changed, 260 insertions(+)
>   create mode 100644 drivers/gpu/nova-core/Kconfig
>   create mode 100644 drivers/gpu/nova-core/Makefile
>   create mode 100644 drivers/gpu/nova-core/driver.rs
>   create mode 100644 drivers/gpu/nova-core/gpu.rs
>   create mode 100644 drivers/gpu/nova-core/nova_core.rs

Hi Danilo,

This is pleasantly clean, and even elegant. I was pleasantly surprised at
the level of firmware loading support in Rust, and how this approach takes
advantage of our r535 firmware snapshot that is in Turing, Ampere, and Ada.

It loads up on my GA104 system and I've been poking around at it.

Some minor comments below, but this looks like a very good starting "stub"
to get merged.

> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index d1086e53a317..f7ddca7de0ef 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -7446,6 +7446,16 @@ T:	git https://gitlab.freedesktop.org/drm/nouveau.git
>   F:	drivers/gpu/drm/nouveau/
>   F:	include/uapi/drm/nouveau_drm.h
>   
> +CORE DRIVER FOR NVIDIA GPUS [RUST]
> +M:	Danilo Krummrich <dakr@kernel.org>
> +L:	nouveau@lists.freedesktop.org
> +S:	Supported
> +Q:	https://patchwork.freedesktop.org/project/nouveau/

Are you sure? I'm not sure how patchwork things work, but it seems
unfortunate to confuse Nova and nouveau here.

> +B:	https://gitlab.freedesktop.org/drm/nova/-/issues
> +C:	irc://irc.oftc.net/nouveau
> +T:	git https://gitlab.freedesktop.org/drm/nova.git nova-next
> +F:	drivers/gpu/nova-core/
> +
>   DRM DRIVER FOR OLIMEX LCD-OLINUXINO PANELS
>   M:	Stefan Mavrodiev <stefan@olimex.com>
>   S:	Maintained
> diff --git a/drivers/gpu/Makefile b/drivers/gpu/Makefile
> index 8997f0096545..36a54d456630 100644
> --- a/drivers/gpu/Makefile
> +++ b/drivers/gpu/Makefile
> @@ -5,3 +5,4 @@
>   obj-y			+= host1x/ drm/ vga/
>   obj-$(CONFIG_IMX_IPUV3_CORE)	+= ipu-v3/
>   obj-$(CONFIG_TRACE_GPU_MEM)		+= trace/
> +obj-$(CONFIG_NOVA_CORE)		+= nova-core/
> diff --git a/drivers/gpu/nova-core/Kconfig b/drivers/gpu/nova-core/Kconfig
> new file mode 100644
> index 000000000000..33ac937b244a
> --- /dev/null
> +++ b/drivers/gpu/nova-core/Kconfig
> @@ -0,0 +1,13 @@
> +config NOVA_CORE
> +	tristate "Nova Core GPU driver"
> +	depends on PCI
> +	depends on RUST
> +	depends on RUST_FW_LOADER_ABSTRACTIONS
> +	default n
> +	help
> +	  Choose this if you want to build the Nova Core driver for Nvidia
> +	  GSP-based GPUs.

Maybe a little note about what "GSP" is and how you know if you have it,
would help. Turing and later architectures have GSP firmware. All the
user might know is the GPU architecture, I wouldn't expect the user
to know if it has a "GSP".

> +
> +	  This driver is work in progress and may not be functional.
> +
> +	  If M is selected, the module will be called nova-core.

Or nova_core? I realize the driver core translates between "-" and "_",
just trying to be consistent.

It does show up as /sys/module/nova_core .


> diff --git a/drivers/gpu/nova-core/Makefile b/drivers/gpu/nova-core/Makefile
> new file mode 100644
> index 000000000000..2d78c50126e1
> --- /dev/null
> +++ b/drivers/gpu/nova-core/Makefile
> @@ -0,0 +1,3 @@
> +# SPDX-License-Identifier: GPL-2.0
> +
> +obj-$(CONFIG_NOVA_CORE) += nova_core.o
> diff --git a/drivers/gpu/nova-core/driver.rs b/drivers/gpu/nova-core/driver.rs
> new file mode 100644
> index 000000000000..2a2aa9b0630b
> --- /dev/null
> +++ b/drivers/gpu/nova-core/driver.rs
> @@ -0,0 +1,47 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +use kernel::{bindings, c_str, pci, prelude::*};
> +
> +use crate::gpu::Gpu;
> +
> +#[pin_data]
> +pub(crate) struct NovaCore {
> +    #[pin]
> +    pub(crate) gpu: Gpu,
> +}
> +
> +const BAR0_SIZE: usize = 8;
> +pub(crate) type Bar0 = pci::Bar<BAR0_SIZE>;
> +
> +kernel::pci_device_table!(
> +    PCI_TABLE,
> +    MODULE_PCI_TABLE,
> +    <NovaCore as pci::Driver>::IdInfo,
> +    [(
> +        pci::DeviceId::from_id(bindings::PCI_VENDOR_ID_NVIDIA, bindings::PCI_ANY_ID as _),
> +        ()
> +    )]
> +);
> +
> +impl pci::Driver for NovaCore {
> +    type IdInfo = ();
> +    const ID_TABLE: pci::IdTable<Self::IdInfo> = &PCI_TABLE;
> +
> +    fn probe(pdev: &mut pci::Device, _info: &Self::IdInfo) -> Result<Pin<KBox<Self>>> {
> +        dev_dbg!(pdev.as_ref(), "Probe Nova Core GPU driver.\n");
> +
> +        pdev.enable_device_mem()?;
> +        pdev.set_master();
> +
> +        let bar = pdev.iomap_region_sized::<BAR0_SIZE>(0, c_str!("nova-core"))?;

Another question about whether it should be nova-core or nova_core.

> +
> +        let this = KBox::pin_init(
> +            try_pin_init!(Self {
> +                gpu <- Gpu::new(pdev, bar)?,
> +            }),
> +            GFP_KERNEL,
> +        )?;
> +
> +        Ok(this)
> +    }
> +}
> diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
> new file mode 100644
> index 000000000000..cf62390e72eb
> --- /dev/null
> +++ b/drivers/gpu/nova-core/gpu.rs
> @@ -0,0 +1,171 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +use kernel::{
> +    device, devres::Devres, error::code::*, firmware, fmt, pci, prelude::*, str::CString,
> +};
> +
> +use crate::driver::Bar0;
> +use core::fmt::Debug;
> +
> +/// Enum representation of the GPU chipset.
> +#[derive(Debug)]
> +pub(crate) enum Chipset {
> +    TU102 = 0x162,
> +    TU104 = 0x164,
> +    TU106 = 0x166,
> +    TU117 = 0x167,
> +    TU116 = 0x168,
> +    GA102 = 0x172,
> +    GA103 = 0x173,
> +    GA104 = 0x174,
> +    GA106 = 0x176,
> +    GA107 = 0x177,
> +    AD102 = 0x192,
> +    AD103 = 0x193,
> +    AD104 = 0x194,
> +    AD106 = 0x196,
> +    AD107 = 0x197,
> +}
> +
> +/// Enum representation of the GPU generation.
> +#[derive(Debug)]
> +pub(crate) enum CardType {
> +    /// Turing
> +    TU100 = 0x160,
> +    /// Ampere
> +    GA100 = 0x170,
> +    /// Ada Lovelace
> +    AD100 = 0x190,
> +}
> +
> +/// Structure holding the metadata of the GPU.
> +#[allow(dead_code)]
> +pub(crate) struct GpuSpec {
> +    /// Contents of the boot0 register.
> +    boot0: u64,

It is redundant to store boot0, when all of the following fields
are deduced from boot0.

> +    card_type: CardType,
> +    chipset: Chipset,
> +    /// The revision of the chipset.
> +    chiprev: u8,
> +}
> +
> +/// Structure encapsulating the firmware blobs required for the GPU to operate.
> +#[allow(dead_code)]
> +pub(crate) struct Firmware {
> +    booter_load: firmware::Firmware,
> +    booter_unload: firmware::Firmware,
> +    gsp: firmware::Firmware,
> +}
> +
> +/// Structure holding the resources required to operate the GPU.
> +#[allow(dead_code)]
> +#[pin_data]
> +pub(crate) struct Gpu {
> +    spec: GpuSpec,
> +    /// MMIO mapping of PCI BAR 0
> +    bar: Devres<Bar0>,
> +    fw: Firmware,
> +}
> +
> +// TODO replace with something like derive(FromPrimitive)
> +impl Chipset {
> +    fn from_u32(value: u32) -> Option<Chipset> {
> +        match value {
> +            0x162 => Some(Chipset::TU102),
> +            0x164 => Some(Chipset::TU104),
> +            0x166 => Some(Chipset::TU106),
> +            0x167 => Some(Chipset::TU117),
> +            0x168 => Some(Chipset::TU116),
> +            0x172 => Some(Chipset::GA102),
> +            0x173 => Some(Chipset::GA103),
> +            0x174 => Some(Chipset::GA104),
> +            0x176 => Some(Chipset::GA106),
> +            0x177 => Some(Chipset::GA107),
> +            0x192 => Some(Chipset::AD102),
> +            0x193 => Some(Chipset::AD103),
> +            0x194 => Some(Chipset::AD104),
> +            0x196 => Some(Chipset::AD106),
> +            0x197 => Some(Chipset::AD107),
> +            _ => None,
> +        }
> +    }
> +}
> +
> +// TODO replace with something like derive(FromPrimitive)
> +impl CardType {
> +    fn from_u32(value: u32) -> Option<CardType> {
> +        match value {
> +            0x160 => Some(CardType::TU100),
> +            0x170 => Some(CardType::GA100),
> +            0x190 => Some(CardType::AD100),

Is this how nouveau does it too? I mean, classifying cards as GA100,
and variants as TU102. It feels wrong to me, because we have for example
GA100 GPUs. I mean, GA100 is the same kind of thing as a GA102: each is
a GPU.

If I were naming card types, I'd calling them by their architecture names:
Turing, Ampere, Ada.

> +            _ => None,
> +        }
> +    }
> +}
> +
> +impl GpuSpec {
> +    fn new(bar: &Devres<Bar0>) -> Result<GpuSpec> {
> +        let bar = bar.try_access().ok_or(ENXIO)?;
> +        let boot0 = u64::from_le(bar.readq(0));
> +        let chip = ((boot0 & 0x1ff00000) >> 20) as u32;
> +
> +        if boot0 & 0x1f000000 == 0 {
> +            return Err(ENODEV);
> +        }
> +
> +        let Some(chipset) = Chipset::from_u32(chip) else {
> +            return Err(ENODEV);
> +        };
> +
> +        let Some(card_type) = CardType::from_u32(chip & 0x1f0) else {
> +            return Err(ENODEV);
> +        };
> +
> +        Ok(Self {
> +            boot0,
> +            card_type,
> +            chipset,
> +            chiprev: (boot0 & 0xff) as u8,
> +        })
> +    }
> +}
> +
> +impl Firmware {
> +    fn new(dev: &device::Device, spec: &GpuSpec, ver: &str) -> Result<Firmware> {
> +        let mut chip_name = CString::try_from_fmt(fmt!("{:?}", spec.chipset))?;
> +        chip_name.make_ascii_lowercase();
> +
> +        let fw_booter_load_path =
> +            CString::try_from_fmt(fmt!("nvidia/{}/gsp/booter_load-{}.bin", &*chip_name, ver))?;
> +        let fw_booter_unload_path =
> +            CString::try_from_fmt(fmt!("nvidia/{}/gsp/booter_unload-{}.bin", &*chip_name, ver))?;
> +        let fw_gsp_path =
> +            CString::try_from_fmt(fmt!("nvidia/{}/gsp/gsp-{}.bin", &*chip_name, ver))?;
> +
> +        let booter_load = firmware::Firmware::request(&fw_booter_load_path, dev)?;
> +        let booter_unload = firmware::Firmware::request(&fw_booter_unload_path, dev)?;
> +        let gsp = firmware::Firmware::request(&fw_gsp_path, dev)?;
> +
> +        Ok(Firmware {
> +            booter_load,
> +            booter_unload,
> +            gsp,
> +        })
> +    }
> +}
> +
> +impl Gpu {
> +    pub(crate) fn new(pdev: &pci::Device, bar: Devres<Bar0>) -> Result<impl PinInit<Self>> {
> +        let spec = GpuSpec::new(&bar)?;
> +        let fw = Firmware::new(pdev.as_ref(), &spec, "535.113.01")?;

lol there it is: our one, "stable" set of GSP firmware. Maybe a one line comment
above might be appropriate, to mention that this is hardcoded, but new firmware
versions will not be. On the other hand, that's obvious. :)

> +
> +        dev_info!(
> +            pdev.as_ref(),
> +            "NVIDIA {:?} ({:#x})",
> +            spec.chipset,
> +            spec.boot0
> +        );
> +
> +        Ok(pin_init!(Self { spec, bar, fw }))
> +    }
> +}
> diff --git a/drivers/gpu/nova-core/nova_core.rs b/drivers/gpu/nova-core/nova_core.rs
> new file mode 100644
> index 000000000000..b130d9ca6a0f
> --- /dev/null
> +++ b/drivers/gpu/nova-core/nova_core.rs
> @@ -0,0 +1,14 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +//! Nova Core GPU Driver
> +
> +mod driver;
> +mod gpu;
> +
> +kernel::module_pci_driver! {
> +    type: driver::NovaCore,
> +    name: "NovaCore",
> +    author: "Danilo Krummrich",
> +    description: "Nova Core GPU driver",
> +    license: "GPL v2",
> +}
> diff --git a/drivers/video/Kconfig b/drivers/video/Kconfig
> index 44c9ef1435a2..5df981920a94 100644
> --- a/drivers/video/Kconfig
> +++ b/drivers/video/Kconfig
> @@ -39,6 +39,7 @@ source "drivers/gpu/vga/Kconfig"
>   
>   source "drivers/gpu/host1x/Kconfig"
>   source "drivers/gpu/ipu-v3/Kconfig"
> +source "drivers/gpu/nova-core/Kconfig"
>   
>   source "drivers/gpu/drm/Kconfig"
>   
> 
> base-commit: 69b8923f5003664e3ffef102e73333edfa2abdcf

I'm always grateful when anyone uses "git format-patch --base", it makes
life simpler.


thanks,
-- 
John Hubbard

