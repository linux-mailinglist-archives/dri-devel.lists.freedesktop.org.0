Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FC4CBBE4BB
	for <lists+dri-devel@lfdr.de>; Mon, 06 Oct 2025 16:13:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B060289622;
	Mon,  6 Oct 2025 14:13:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="S7YQfYE2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azon11010039.outbound.protection.outlook.com [52.101.46.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EDDA10E1ED
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Oct 2025 14:13:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M7VltRONjiYx9WjrBn6m388InhZ+516L97er7v63cB2doh/pXe122uT0pc7Hg39HjTJyPElJYO/Qc5R97s9HUnHe/fSACElYwST/RyXtif4L17W03zNHYWN6SaYba4OgbuHaF/EbG+NcnRbC4+LbtMWbiIB5UCq5MDYbuvaEZR8FNGHII4++V4ND5d3gfANlugCsSOEBvVF8D80vs8jlJhr5ALtxmiRZqlFqmx/dCVAyTjLKfT+XEvJ0jilA5cby8dRLnrpb3GOl2j0RrvsW6a+tMHwS1m9KFdpGn/LHTf/NzDSzTXwxWC/kdL3zceCnegBuftt32MGpFb6Uaefgeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6sQa6o+p21EFdCPkGKLwYq/cs3pSo02VT+D1oj3EBt8=;
 b=uXv8WkDKggmm6Z53iV2nFceMQhoO8y+sYGTvIw5TXE3FCzhg99KLxZoxWZBgOVyP5n3hUiRzwfGGLMCrmxUqRIvD3h6JTMXwVO6RObGu060XCSXN6dmSHVDkahVeU7h8SzV+IZFm4lh3cH85sK+Usbe2w0JGHbHc5Pigtbb849ry/YTlLuK7aFs69Y6BCVAo+Gqd42OT9g3/7v4PUE7TZjY8PFw14ZJ4PhTmByF+ivwz07ogWxVEUawJEC4VMxQRMEDO6cC11uyr1Xe0X+jEI47+z/XimR4ypLhrNI4Kp6giLPH+WfTYhGdq+TSEo4W7PT/WJk/JkmWKJKqbpd3+qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=intel.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6sQa6o+p21EFdCPkGKLwYq/cs3pSo02VT+D1oj3EBt8=;
 b=S7YQfYE2deKh+FOj9vacVsbmH2VAKD4nrFlwcbGzksKJevEDpKH8ePXhpStFHQeK8zpLsuVnQ4SuMSLVVBwv5UDJC4f0ADtwCBGK/bnV//q6cCFf8DdcbIrahAylu1D8743BKOShKGspsqP54M7k1IgGj8PKhLaW9yBDWF0EGTlkB+9tUljjivANKobvgTKfbeVjg9EFiWGmEpd8J4hWixtmofxuXW3vlZjFVkSXG4WMh5pM55jLcxgs9iQTX95R4t8ZCSSWFm/vOUjaJsbT19R9GzLfise50v/AOtEYlb4rFiwGWdc0S/KcSF2KJfg65NuQnalijVzhnnep9v72Lg==
Received: from CH3P220CA0029.NAMP220.PROD.OUTLOOK.COM (2603:10b6:610:1e8::11)
 by IA1PR12MB7591.namprd12.prod.outlook.com (2603:10b6:208:429::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Mon, 6 Oct
 2025 14:13:05 +0000
Received: from CH2PEPF00000141.namprd02.prod.outlook.com
 (2603:10b6:610:1e8:cafe::b) by CH3P220CA0029.outlook.office365.com
 (2603:10b6:610:1e8::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9182.19 via Frontend Transport; Mon,
 6 Oct 2025 14:13:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CH2PEPF00000141.mail.protection.outlook.com (10.167.244.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9182.15 via Frontend Transport; Mon, 6 Oct 2025 14:13:04 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.34; Mon, 6 Oct
 2025 07:12:45 -0700
Received: from [10.221.129.102] (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 6 Oct
 2025 07:12:44 -0700
Message-ID: <3ab9a8d4-48d0-473f-be54-de4efec9d07b@nvidia.com>
Date: Mon, 6 Oct 2025 16:11:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/3] Virtio-GPU S4 support
To: <dongwon.kim@intel.com>, <dri-devel@lists.freedesktop.org>
CC: <dmitry.osipenko@collabora.com>
References: <20251003053402.732218-1-dongwon.kim@intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoyd@nvidia.com>
In-Reply-To: <20251003053402.732218-1-dongwon.kim@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: rnnvmail202.nvidia.com (10.129.68.7) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000141:EE_|IA1PR12MB7591:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b31d4ed-69d8-471d-10c4-08de04e2778b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|1800799024|36860700013|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?N1dndUw0TWZYdy9DTnptVTlyNXZvUW95V3FiMFFCdmtuRFZiSlpSTTBVTGpK?=
 =?utf-8?B?V3I5VHVURUp0czA4MmN2MVhJUXIwQlFHd1RsOVpDb0ZnZjRUb2s5UmZZU2JC?=
 =?utf-8?B?RTgrU2RCUjdaek94QStJL21BOWdOalV3NXFXTXlRVW1TcXhOc2graGtOZERG?=
 =?utf-8?B?V0llckZIaEh4UDltWjRhYUh4bW4rcm9lYWcxTlVuUFpNS1ROdjlHT2kxT0RW?=
 =?utf-8?B?Wkh1cEc1ZWE5RkRWMjR0T3RQclRDdkhBMHkrRUIvTHZjV0F3UGVaOXdwdVM5?=
 =?utf-8?B?Q3M2WlVMRTFRenp3ZUExUENIYXY4NUp4UnNTd2NvTzdtbzhybzJIZjhXb0Zz?=
 =?utf-8?B?aVFJdjRYUDl3VVFrMm13ZVRMUW0xUkpzdGVZTVZURHdQZjRJNnlxUXZsU2hz?=
 =?utf-8?B?VnlwQWdRNlpxRW9vTVpRTjI0RmIyY3Rha3BTMTJVVDNXeGZiaW9vTkpNeXZx?=
 =?utf-8?B?VFdNNTRwZmRBaGJGOWtnNmxmYnloTGRPSmJEQlFIalBvZExmUlJPd2I3QVI1?=
 =?utf-8?B?K0dGSHdxdlNtdHhsbTV5cEFlcU1nL0FjN2RzeFk3Mnc1cGxvNE55V2FDMWp4?=
 =?utf-8?B?d21rcDQvTzMxbGNYdGVNdTE5SHJkeGxsdFpFZ3BIWnh6MU5GYkVZQWM4OVJ0?=
 =?utf-8?B?V1hMTDFIZ0JSUTZXVEpaMWFQekZyS25MOTVCSWg4WU9ienB1dW9wMUdKQUt1?=
 =?utf-8?B?Q3VjYnFIN2xOd2ZSakYwUkxMdjF2UklHdXJBSTk1d3Q4cmpBUjVvL0RtUG5M?=
 =?utf-8?B?cHdmOHFZWDBPNVkvVEo1QzVRclZJM0JxYzNsbURCUXVKaXNXT3IyYzVWVmpv?=
 =?utf-8?B?dzFRT2syaExuamdsN1JYNXNPZmtPekVJNHMvMFVQSnAwc1lwQ0NzcFJ0NlQ1?=
 =?utf-8?B?ZXJmTGxwaEtDTGRsQzcvVW9TN29tdlBicWxocFFHSzI0a2RiMXJVbEtOdWJH?=
 =?utf-8?B?dUFJbjhlc3pnS1dWY0V0TjlpaTBxYWE1a0lTUFdJeWdkckVLUngzcUgyaGx2?=
 =?utf-8?B?YUNTZHVwV0pOaitSOXVGNWlFSVlYU05PK2JBbGdOR0czMjZYN2hVSUdmeVZR?=
 =?utf-8?B?ZWlSQThCcy8xdUY5c0ZKcFVhNHB4cnlOdmpnUU9wTm5pdTZQR2FPcm1uc3F6?=
 =?utf-8?B?Vk1QbEZtcmVIYTVGaC8wRlFHUmtqRjFGOWhhQVlhN2N3RFJ4ZGJhT25xczN0?=
 =?utf-8?B?RUd6OURZRFRKRER4UDhEczg3ZFlRUmxuK2dqWGQyYVQwVTlNUk5Ka29xeWhh?=
 =?utf-8?B?WkE0dks1bHAvZ253MnRORFE4WTJTV0FtZ3U4TmMvc0N6ZVlDaHV1SitYUXV1?=
 =?utf-8?B?YUJkMUtwMVc2bExmQjdDeFhMd05kYUhLNWt5TjYxVDFyUnlZME9MMlZWVEEw?=
 =?utf-8?B?L3ZHcm9kdk02TEJGN0s5WHRJMTNybnRRTmx3dk43NGxRdkF3MXoyZU1GaTR5?=
 =?utf-8?B?VUNsN0FXbUg5d0dOb2NueWNkenNmSy8wODZLcjZGMzRVeUFEMkxob1o0ZWFM?=
 =?utf-8?B?YmF3V3FRTDJXRG9VaHhmOExIL0xmRWR6VjQwNEIydkNJZVJxelBFQmh3Q25R?=
 =?utf-8?B?T1R5VnA3UTd0V3ltNTVDeGNmdkVJeEJsbWtxNFlObUQ0THBWZW1CN2IwakNk?=
 =?utf-8?B?cXNCU1pQQk9KWVo0Zyt1dkxuM0kwRk1pV0V4REdRYW9qZzFlTjZOeXY5VGRV?=
 =?utf-8?B?U2Z3bzVPS1M3ekZDbUt5NlNnaU5ud3U2bUlxQWY1SGhRQmx2NXJmTGRaczhS?=
 =?utf-8?B?NEJYcnBWSVlpWE8xV2FUYzNPbHNNbFZGWGlGNVIwR0JYOUYxUU1NV3k1Mk5x?=
 =?utf-8?B?TlFiankrbzR6M2RaKzlWd3JFSFk3QmZDSGZ3K1NGWHh1ZjRMRWREaE01N24w?=
 =?utf-8?B?b0ZVREVFMjIvQXNiSVJDMUxKd0V4RGQwbFZwT05ZeEhsUXB6QXhSUy92R2ZK?=
 =?utf-8?B?L21HQ2htMFl2QWQ0djQzWVI4dTFEQnkwMDZhQi9LZlorNVVZZ200S29Oci9L?=
 =?utf-8?B?Si9PVTA4UzNEcTZvK29oSmxQSmcxN085YXlkcXVRQUI5TzhObDBoVml2NHRX?=
 =?utf-8?B?c2lrSVpjcldBRUFLaVRrNWtiRzlhdmU1VitNVGQyYW9mdXFuNDNMU1RUOEti?=
 =?utf-8?Q?D1Wc=3D?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013)(7053199007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2025 14:13:04.6193 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b31d4ed-69d8-471d-10c4-08de04e2778b
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF00000141.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7591
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

How was this tested ? Example command+steps would be nice have in this 
cover letter.


Nirmoy

On 03.10.25 07:33, dongwon.kim@intel.com wrote:
> From: Dongwon Kim <dongwon.kim@intel.com>
>
> This patch series implements functions for .freeze and .restore hooks for
> virtio-gpu driver as well as pm-notifier to handle object restoration in
> S4(hiberation) case.
>
> First patch adds `virtgpu_freeze` and `virtgpu_restore` functions.
> These functions handle the deletion of virtio queues before suspension and
> their recreation during the restoration process.
>
> Second patch implements a mechanism for restoring `virtio_gpu_object` instances.
> This is necessary because the host (QEMU) deletes all associated resources during
> the virtio-gpu reset, which occurs as part of hiberation/resume process.
>
> Third patch adds pm-notifier to the driver that handles resubmission of virtio-gpu
> objects to the QEMU once the guest resumes from hibenation.
>
> These changes ensure that the virtio-gpu driver can properly handle hibernation
> scenarios without resource loss.
>
> v2: 10ms sleep is added in virtgpu_freeze to avoid the situation
>      the driver is locked up during resumption.
>
> v3: Plain 10ms delay (v2) is replaced with wait calls which wait until
>      the virtio queue is empty.
>      (Dmitry Osipenko)
>
> v4: New version of patchset only covers S4 case because loss of resources in S3
>      case can be avoided by skipping virtio-gpu-reset in QEMU (hw/display/virtio-gpu.c).
>      To skip virtio-gpu-reset (soft-reset), virtio-gpu-pci device should be attached to
>      PCIE bus AND a PCIE option, 'x-pcie-pm-no-soft-reset' should added and set to 'true'.
>      (e.g. -device virtio-gpu-pci,bus=port,x-pcie-pm-no-soft-reset=true)
>
> v5: Remove virtio_gpu_object from the restore list before freeing the object
>      to prevent an use-after-free situation.
>      (Nirmoy Das)
>
>      Protect restore list operations with a spinlock
>      (Nirmoy Das)
>
>      Move restore list node into virtio_gpu_bo struct to reduce memory usage
>      (Dmitry Osipenko)
>
>      Remove unused header - drm_atomic_helper.h
>      (Dmitry Osipenko)
>
> Dongwon Kim (3):
>    drm/virtio: Freeze and restore hooks to support suspend and resume
>    drm/virtio: Add support for saving and restoring virtio_gpu_objects
>    drm/virtio: Add PM notifier to restore objects after hibernation
>
>   drivers/gpu/drm/virtio/virtgpu_drv.c    | 60 +++++++++++++++++++++++-
>   drivers/gpu/drm/virtio/virtgpu_drv.h    | 12 +++++
>   drivers/gpu/drm/virtio/virtgpu_kms.c    | 51 ++++++++++++++++++---
>   drivers/gpu/drm/virtio/virtgpu_object.c | 61 +++++++++++++++++++++++++
>   4 files changed, 177 insertions(+), 7 deletions(-)
>
