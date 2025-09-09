Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87DE3B50747
	for <lists+dri-devel@lfdr.de>; Tue,  9 Sep 2025 22:44:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E41289B12;
	Tue,  9 Sep 2025 20:44:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="ncfHSdjr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2060.outbound.protection.outlook.com [40.107.102.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FAE889B12
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Sep 2025 20:44:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f9IGIRirz8+7egGCaIa5FmwXOazXQiu21mrw9fs5/XK2+zg0O26TF2oGa0Lff+Jy5rSwSh67FDoqdYGEZqyWgjHepHlbVghL8GT4LAz9QgjqBOmXzNe2hveS1Kpjl9pd1ancVbfdwdvLbrtSt1WN5vU/vY+sGKdQRARU6pwV1rW4jYJrBT7E8zsfpBR0IiU89L8MR1A6G0+iguFJ5RECqp9SIcZ8cqHP7fnsT987+ENfCN0rfzU02cGsnxw+KHNfJ799FvEQ5dO0sY16ycCIpgXLCyEEVs0e+c1ELggzMrs6e19oPcjDMpbKw49ISNhEq91vCLSf7n2JBOAHvBMXJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WYWayYcAEKX5kR8G8G3Ppy7yj5dqvajNWNuyPt4kNRg=;
 b=f81IjpOfHGUl2RevtjiwFquytZOS8MHZ1b17GmBqcHmiQulSS0CjK4V0atRyN6tak2L6ZJf3OO3If+MLj7ZDQZ3HZGhteV6JWQaZ3yIlnMJecUMvaQnvrkrfL14tiyBzncUTelCDnJtRncCxSYsXQFo/5SqueSatzQCeoujlqnMDjQkaC4A23HDTI8WUcpzcmXDGeVOfgft6k5zaNN/q45egRZJ6slvM26iZPUR5NKRXSAh4snUNHT8kzmYzoPG5mTapuOhcAkCRR5sNLWoVKQQ/ymm6FAE5G4shzY3FoEzJogwW8sGeAuT1M0wAaSQc9YI3+MgWu/2l9BM9djwtow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=oss.qualcomm.com smtp.mailfrom=nvidia.com; 
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WYWayYcAEKX5kR8G8G3Ppy7yj5dqvajNWNuyPt4kNRg=;
 b=ncfHSdjr4AjVLkY+Yem6RBiEVumXBrsHdLgJX+gNgj8lEmEQ+KS88qKtAQ3Vx3wdxbQz/dWdxjGMpKi8uSi8hsTMFpmfNB4f+qw64tZVvD85FQQJUAHLOhqi78YtkFlNeiUD8J6Gs2LAN69WgAG2bAZ6oghj41WDg9zLkVPOoBEFwIo23Wy3odEO+RWxLADxRoXxKZ+lr1YWjMO1ltKIYHM3szDYSPcJ+ZWhgsM6nlLqqHAYtMiLDvoWWdmgvZRwcIP9CaiSIhFa0n9xUYmdGsjhKLtc84zF/GYC1/lMu2Vnxvittn6GlTIHw+ZQ8p1bhelzB4KOG9ul4GEX2FR6gQ==
Received: from SA1P222CA0117.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:3c5::23)
 by SA3PR12MB8804.namprd12.prod.outlook.com (2603:10b6:806:31f::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Tue, 9 Sep
 2025 20:44:45 +0000
Received: from SA2PEPF00003AE4.namprd02.prod.outlook.com
 (2603:10b6:806:3c5:cafe::a5) by SA1P222CA0117.outlook.office365.com
 (2603:10b6:806:3c5::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9115.15 via Frontend Transport; Tue,
 9 Sep 2025 20:44:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SA2PEPF00003AE4.mail.protection.outlook.com (10.167.248.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9115.13 via Frontend Transport; Tue, 9 Sep 2025 20:44:45 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Tue, 9 Sep
 2025 13:44:25 -0700
Received: from [10.221.136.181] (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Tue, 9 Sep
 2025 13:44:22 -0700
Message-ID: <b5bcea52-4837-4b07-b544-9e4a2f09b785@nvidia.com>
Date: Tue, 9 Sep 2025 22:43:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm: Add support for ioctl dispatch with io_uring's
 uring_cmd
To: Zack McKevitt <zachary.mckevitt@oss.qualcomm.com>,
 <dri-devel@lists.freedesktop.org>
CC: <airlied@gmail.com>, <simona@ffwll.ch>, <jeff.hugo@oss.qualcomm.com>,
 <Liviu.Dudau@arm.com>, <jacek.lawrynowicz@linux.intel.com>,
 <lizhi.hou@amd.com>
References: <20250909201035.2037460-1-zachary.mckevitt@oss.qualcomm.com>
Content-Language: en-US
From: Nirmoy Das <nirmoyd@nvidia.com>
In-Reply-To: <20250909201035.2037460-1-zachary.mckevitt@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.126.230.35]
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003AE4:EE_|SA3PR12MB8804:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f9e1716-9130-435b-1d56-08ddefe1b615
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|36860700013|82310400026|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?c3hCemJneEovRXNmRnZkcE9DbExRc1BKc1lEMnhuUGdNS214bVhoWUQ5MFlk?=
 =?utf-8?B?WUFaY0RjRHQ3SDdyandidTVUQWp1ZC82eHJUZ3k3aE11ZXdUVGVmV3hSd2NC?=
 =?utf-8?B?bzJ0V0pnRFBqRXVxc2tiSHp3bHUwbUdEN0hkcE1qbHFISEVkYk00NkZaNHVy?=
 =?utf-8?B?Ym4vbUZORElvMlZUVVpZaVQyTzNQcm5JRkNIVy9wVmVHbHVtTExUdURjVVhT?=
 =?utf-8?B?bjBKa2FCOHZKVGRTSms4T1hQZUxCbHArbGkxd1ZhK2FSd3FCUWV2eUtEUGFt?=
 =?utf-8?B?R2srelg2WHVlWGlxMU1CTzh6ODB4TDZGeWtpbDlTTjlsWG1lYXEwUlhZOTI2?=
 =?utf-8?B?ckJWeGp0L1JWaDVnZ0x5c29aU0J3d2hVR2NQY3ROMUtrN2JGVk45UlBRQXVa?=
 =?utf-8?B?aU40Zkl1WW44WTdZejd2bXhKekRYR1BuMklISzV0ajVpamNKenVVYkJjUDFm?=
 =?utf-8?B?VVJ6U2YzMkRsWEt1QzJKSVVodjZaeGVTNGl0VlJBdE5UYWYxOGNDMXFTZmJJ?=
 =?utf-8?B?ZXRCSys2V3d4TDhDNGx1VE1BaWc1Z1BoemVQeDMyMHlNcEovaFh1OG5DUDZ6?=
 =?utf-8?B?bytEaWE2ZjhNVjJWMTNYK2JJVVpNaENIRU1pSEUzdlJFWmVpcjdkQldLTkZJ?=
 =?utf-8?B?N2Z4OWVFT0RoWTNJQUU3aGd3OFRUaUxsZlpMZ0VLNXh5d3F1bGhJUWFGNTNU?=
 =?utf-8?B?Y2F0NW1jZkxjL3AzZ1hma2RhWFpEWVF2L3BDRkNKVUJBMzZjTEdycmY4d2lX?=
 =?utf-8?B?T0xQdlU3WTFQNXF6K3lTcTJBZGd0NzQrVHFScFM1bForZHZyQ3BvR0dKM2hS?=
 =?utf-8?B?TnNzM1NwZktJTi94QXU3b2xEMWR4RHpRbFZaUHRCRUYwNEsySFlRaDBxOVd2?=
 =?utf-8?B?NWJkTXorRjNVUnhCYzVHMVppK1NXMnNIaitKOVBoam1seGR3cjVQZll2dFhP?=
 =?utf-8?B?K0VXMkVJUWc4ZyttSFlEZVpMU2twV2RMYUkwaTdVRkl0WHNFaDNCeUZrVmRs?=
 =?utf-8?B?UDNDUGhKVE9ZaHpxS1luYXF5YnVWR3BrS2xJNVFPWUg4dlVHYmdFRERlUDFN?=
 =?utf-8?B?NU95NFp2WXFkc2IzV2ZRSENRRHRZSFNDcld4dExRRk5ncG9OcFl3UWVYb1JL?=
 =?utf-8?B?dWliNnRFK1VNWUNFRCtsdXpwZ0cxSnN2NmdVNUNhVG1qQWR5MHhENDRoQTNy?=
 =?utf-8?B?YjhFZ1Q1OEZ5dWl0eGVmNTBUc1dwOXpIM3JlZFZhZzJFa3I2c3lkR0ZUbFVo?=
 =?utf-8?B?bzNHZ0lYVi9QL3lJMmRpdnlaWWxhMTRXMS9oaHBSWFgxVDBhQ093Q3dtdTEz?=
 =?utf-8?B?V0R1MmNJdjlmUGQxQzRiVU5JR2VZb0gyVGVtYTlOZTRldGNxVjg1N1NGeXdR?=
 =?utf-8?B?VUZxS1NZb1RCRUhJRkM4Q2dNOTB4WnV3ak5LTzFHVEJZZ1MyVkdJYmFndW11?=
 =?utf-8?B?eWcwMlVULzR2NzZKLzR0RWNkRWhRaHhVUkZiUW00aTkweUQ5dVBlRERPOUh3?=
 =?utf-8?B?OVRGUjQyQzBpQkQxSDRmRTJnbkVBUlF4dGtHSW0zZHhGelpmRy9HOXFnb0tr?=
 =?utf-8?B?WkRNVm5lNE9jSmlnL2RXQUtLbTI3bnV0a3lnRUpWQXgraXZoNExhOVJodURE?=
 =?utf-8?B?UTRKSXMwVS9CRlc2bHltMk5KS2RKbXFaeHMwZTdFSmV0M0pGZ1VYbTl3ZXJr?=
 =?utf-8?B?WnJDM2Erb0NUTWRJSGV2YmNvbWRWL09ReDdLNVpqYTNZTFlpV0FtRjJWLytl?=
 =?utf-8?B?SkVobWxUVjhzZC9IOTNzWlVjL1d1ck9oUFp0eVRxREVqanlUUWxNcHpqb1FJ?=
 =?utf-8?B?d1RsaWVFYU92NDFRNFFEME1XUGF5U0x1VU1DbzV1OWJ4UUFJdVJEeXB3aDZP?=
 =?utf-8?B?UzlQZnJWNk8rTmpWbTFud2k4WHJYcUJLZXp3QWF0SGJPTG1KNCtCaXBhQWdT?=
 =?utf-8?B?cjlMRldpNVNSNG1USldrWE5xNHpqMWd2Y0pLNFZaMDRKMEM2TkpNQ2c3dXho?=
 =?utf-8?B?TStRYlRNUWpMdXJOSjkzODNRN2gyRjFFYUtmWm5Fcm9XaVBZZWY1SUhjbHRE?=
 =?utf-8?Q?1N6dOr?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026)(7053199007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2025 20:44:45.6513 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f9e1716-9130-435b-1d56-08ddefe1b615
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF00003AE4.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB8804
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


On 09.09.25 22:10, Zack McKevitt wrote:
> Add a callback function for uring_cmd to support the io_uring
> interface in DRM devices. The drm_uring_cmd() function allows
> for dispatching ioctls to DRM devices. If the uring_cmd
> callback is specified in the device's file_operations structure,
> the SQE cmd_op field can be set to DRM_URING_CMD_IOCTL to issue
> ioctls to that device from the ring.
>
> Additionally, create a 16 byte drm_uring_cmd_ioctl struct that
> contains traditional ioctl argument values, such as the device
> specific ioctl command and an optional argument pointer, that
> can be passed directly to the callback function through the SQE's
> 16 byte command field. This design allows io_uring to handle
> ioctls seamlessly for DRM devices without requiring any updates
> to existing drivers.
>
> Initial benchmarks on our Qualcomm Cloud AI 100 device show
> speedups of 50% in ioctl execution time in the best case for
> large batches of ioctls (128) issued together via drm_uring_cmd()
> compared to issuing these ioctls directly.

This is adding a new uAPI so I think we need  userspace lib/application 
that is consuming this[0] and also igt[1]

tests would be very nice to have.


[0] 
https://www.kernel.org/doc/Documentation/gpu/drm-uapi.rst#:~:text=The%20short%20summary%20is%20that,suitable%20and%20canonical%20upstream%20project.

[1] https://gitlab.freedesktop.org/drm/igt-gpu-tools


Regards,

Nirmoy

>
> Signed-off-by: Zack McKevitt <zachary.mckevitt@oss.qualcomm.com>
> ---
>
> Changes in V2:
> - Add uring_cmd callback for drm gem devices.
> - Link to v1: https://lore.kernel.org/all/20250606180806.2193463-1-zachary.mckevitt@oss.qualcomm.com/
>
>   drivers/gpu/drm/drm_ioctl.c | 30 ++++++++++++++++++++++++++++++
>   include/drm/drm_accel.h     |  3 ++-
>   include/drm/drm_gem.h       |  3 ++-
>   include/drm/drm_ioctl.h     |  3 +++
>   include/uapi/drm/drm.h      | 22 ++++++++++++++++++++++
>   5 files changed, 59 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_ioctl.c b/drivers/gpu/drm/drm_ioctl.c
> index d8a24875a7ba..6e90a55bee15 100644
> --- a/drivers/gpu/drm/drm_ioctl.c
> +++ b/drivers/gpu/drm/drm_ioctl.c
> @@ -39,6 +39,7 @@
>   #include <drm/drm_file.h>
>   #include <drm/drm_ioctl.h>
>   #include <drm/drm_print.h>
> +#include <uapi/drm/drm.h>
>   
>   #include "drm_crtc_internal.h"
>   #include "drm_internal.h"
> @@ -937,3 +938,32 @@ bool drm_ioctl_flags(unsigned int nr, unsigned int *flags)
>   	return true;
>   }
>   EXPORT_SYMBOL(drm_ioctl_flags);
> +
> +/**
> + * drm_uring_cmd - Implement uring_cmd callback for io_uring
> + * @cmd: pointer to io_uring_cmd struct
> + * @issue_flags: flags specified by io_uring's issue implementation
> + *
> + * This function implements the uring_cmd file operation to incorporate
> + * arbitrary io_uring functionality for drm. Currently, it acts as a way
> + * for io_uring to issue ioctls to a drm device, so this function
> + * dispatches ioctls to the standard drm ioctl interface.
> + *
> + * Returns:
> + * Zero on success, negative error code on failure.
> + */
> +int drm_uring_cmd(struct io_uring_cmd *cmd, unsigned int issue_flags)
> +{
> +	switch (cmd->cmd_op) {
> +	case DRM_URING_CMD_IOCTL:
> +		const struct drm_uring_cmd_ioctl *drm_cmd = io_uring_sqe_cmd(cmd->sqe);
> +		unsigned int ioctl_cmd = drm_cmd->ioctl_cmd;
> +		unsigned long ioctl_arg = drm_cmd->arg;
> +		struct file *filp = cmd->file;
> +
> +		return drm_ioctl(filp, ioctl_cmd, ioctl_arg);
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +}
> +EXPORT_SYMBOL(drm_uring_cmd);
> diff --git a/include/drm/drm_accel.h b/include/drm/drm_accel.h
> index 20a665ec6f16..79c5bdef5dd3 100644
> --- a/include/drm/drm_accel.h
> +++ b/include/drm/drm_accel.h
> @@ -29,7 +29,8 @@
>   	.read		= drm_read,\
>   	.llseek		= noop_llseek, \
>   	.mmap		= drm_gem_mmap, \
> -	.fop_flags	= FOP_UNSIGNED_OFFSET
> +	.fop_flags	= FOP_UNSIGNED_OFFSET, \
> +	.uring_cmd	= drm_uring_cmd
>   
>   /**
>    * DEFINE_DRM_ACCEL_FOPS() - macro to generate file operations for accelerators drivers
> diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
> index 8d48d2af2649..dda9b915c4a7 100644
> --- a/include/drm/drm_gem.h
> +++ b/include/drm/drm_gem.h
> @@ -470,7 +470,8 @@ struct drm_gem_object {
>   	.read		= drm_read,\
>   	.llseek		= noop_llseek,\
>   	.mmap		= drm_gem_mmap, \
> -	.fop_flags	= FOP_UNSIGNED_OFFSET
> +	.fop_flags	= FOP_UNSIGNED_OFFSET, \
> +	.uring_cmd      = drm_uring_cmd
>   
>   /**
>    * DEFINE_DRM_GEM_FOPS() - macro to generate file operations for GEM drivers
> diff --git a/include/drm/drm_ioctl.h b/include/drm/drm_ioctl.h
> index 171760b6c4a1..cbb474254e1c 100644
> --- a/include/drm/drm_ioctl.h
> +++ b/include/drm/drm_ioctl.h
> @@ -34,6 +34,7 @@
>   
>   #include <linux/types.h>
>   #include <linux/bitops.h>
> +#include <linux/io_uring/cmd.h>
>   
>   #include <asm/ioctl.h>
>   
> @@ -171,4 +172,6 @@ int drm_noop(struct drm_device *dev, void *data,
>   int drm_invalid_op(struct drm_device *dev, void *data,
>   		   struct drm_file *file_priv);
>   
> +int drm_uring_cmd(struct io_uring_cmd *cmd, unsigned int issue_flags);
> +
>   #endif /* _DRM_IOCTL_H_ */
> diff --git a/include/uapi/drm/drm.h b/include/uapi/drm/drm.h
> index 3cd5cf15e3c9..36c1fe4ae1db 100644
> --- a/include/uapi/drm/drm.h
> +++ b/include/uapi/drm/drm.h
> @@ -1424,6 +1424,28 @@ struct drm_event_crtc_sequence {
>   	__u64			sequence;
>   };
>   
> +/**
> + * enum drm_uring_cmd_op - Opcodes for io_uring based drm_uring_cmd callback
> + * DRM_URING_CMD_IOCTL - issue DRM ioctl from drm_uring_cmd
> + */
> +enum drm_uring_cmd_op {
> +	DRM_URING_CMD_IOCTL = 1,
> +};
> +
> +/**
> + * struct drm_uring_cmd_ioctl - arguments for DRM_URING_CMD_IOCTL
> + */
> +struct drm_uring_cmd_ioctl {
> +	/* Device specific ioctl number */
> +	__u32 ioctl_cmd;
> +
> +	/* Pad to 16 byte SQE cmd */
> +	__u32 pad;
> +
> +	/* Opaque ioctl argument pointer */
> +	__u64 arg;
> +};
> +
>   /* typedef area */
>   #ifndef __KERNEL__
>   typedef struct drm_clip_rect drm_clip_rect_t;
