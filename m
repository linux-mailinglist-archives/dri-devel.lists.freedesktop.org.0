Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D37BC3F5B6
	for <lists+dri-devel@lfdr.de>; Fri, 07 Nov 2025 11:14:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E7A010EA65;
	Fri,  7 Nov 2025 10:14:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="XeiqbHaC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azon11010010.outbound.protection.outlook.com [52.101.46.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8455110EA56;
 Fri,  7 Nov 2025 10:14:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m5PSTdG6FU2dAoAI9wVF9zMhAjDeM6Afz81tuHox34AOoVHsH4MB8+r9B0EieFt+TapzjdmjGAYI7Sxa2XoQP+o31Z71INqtV/HlJsgdZ2hEcox69GNJzC4YznKIsmMWtfSRohlpuM5yhEXpaNVcJgT541DRGr5bSNZyvlB2GX3Rc67Tw7l1LvF4jG6XQxBJ16zyffnEb5T0j9Ei04VC12HItXsRiBIpQWwGg+fygtNnlJJ8P/N77OgPuZCx/96LV1feeH9Av0S38raZ7dS1I8xN9e8kB0FO0YSKs16Bp9iVKS693gLQPnXd/8Px7oZZ7wFFDm2ENtet1eYEu7JpPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DBhF0sr0Itj6/4f/qOcmnFqSGc5A3h7xzfdwIha7Q1E=;
 b=xA3NcfBUXrVUwnvtd3PNIHlSKoiHFtgIyd5jTxp0x+2MEkeSyRYJzlyPBJcHvQw8gbZtq69ryv0d0U7wxRmoAqoVt18r/r/n1MKrlk9l+g82ndMotwZGlnpvudF2Hc2j0FcsqhH5g+KJ2Ge/8EA4usBi3tsN+jTEdmNL2NAPfUa0EotfXkBQ6kX+8sLySLMn1HqHdFx4p+irVN1yC4pxWfyP4BGkpl1vyofe1LQwtOsa7GeaRPGrk7AtLlANWxdZGMDpjt6VQeazv2LS9qBPHfRTRorXvPtQITVdtuw+sljRScxotbNZXfzRU5/VHQEVG+N4zSDfy/N5y2ujMaHawg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DBhF0sr0Itj6/4f/qOcmnFqSGc5A3h7xzfdwIha7Q1E=;
 b=XeiqbHaCrM9v2XYOtxKEABW8/CD2SvJYl/uD2CEJboQmpUfP87S/tCX0OfK3WI6Wmshje0Y2RgyDrE+5+N20S7cgLxXLf0qm/NpgTsD5aGcsnfTh9DciDT2q3gOPvdr9lPExfBGrrPkcGJTh6f8xl6gIfEQDZpbKSF3xKdDpluo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DS0PR12MB7629.namprd12.prod.outlook.com (2603:10b6:8:13e::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Fri, 7 Nov
 2025 10:14:10 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9298.010; Fri, 7 Nov 2025
 10:14:10 +0000
Message-ID: <1ee48b97-8767-41b1-9f45-8ccc1865345b@amd.com>
Date: Fri, 7 Nov 2025 11:14:03 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] drm/amdgpu: add engine_retains_context to
 amdgpu_ring_funcs
To: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20251107090425.23199-1-pierre-eric.pelloux-prayer@amd.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20251107090425.23199-1-pierre-eric.pelloux-prayer@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BN9PR03CA0653.namprd03.prod.outlook.com
 (2603:10b6:408:13b::28) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DS0PR12MB7629:EE_
X-MS-Office365-Filtering-Correlation-Id: b43e1da2-e58d-4a74-4b39-08de1de66484
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eER6WGQwQTBPQmxLSTRZMjV2MlV3MFlPSW4rSkZyR2hKMlVDVTRSN25nallv?=
 =?utf-8?B?RUlzVDI5KzhRU2tvWVp0WmE1SDFvb2lrVklZb1dmUDJOSGZWN0E3aEpydHM1?=
 =?utf-8?B?YjVocFdLYnJtdFNOVlJtQzFwVjk3MTVOR3ZJS2g1cEdmdjZ3K3M3VHNtNW8z?=
 =?utf-8?B?bXlYd001L1Y2NThzcDNGNHdra3lnZmpIcHU3b1pYWnQ5bi9JeUh4WlhZdnJv?=
 =?utf-8?B?eENKaW9nZ1pWSGxuWldNR1lLdE5xbXMvdTIrVmMyaGdVcTdSWkhaYWJLN3Nv?=
 =?utf-8?B?UDRTRWp6alNaOEZ4SFRHdnhYdEtPSTVuWXA0ZVdrY3E3N2hJUlVRc2xheXhE?=
 =?utf-8?B?Vk5DUXFVRmorRktDbjdSMzV4b2pBR3ArMFZzU0ZKUDZldEcvY1dBQ3lJdTgz?=
 =?utf-8?B?cjNmZWFmWm42TWZjSWZxdGNzQzM0R2hNM09QcW1odi9qNStYVndOd1c4YWZL?=
 =?utf-8?B?ajZ6cjJ1M3dRM2NaTDhHcXlMRjREWnIvSTVJYmppdVN1UzN3Qm9FUUJvQ0x2?=
 =?utf-8?B?ZUtUMkt5a1l3UkRCRW8xLzZneC9OWXhWRlZuZXpBdGVZblRubHhuMmpOaEp6?=
 =?utf-8?B?UjR1RjNHbytSTGZrckhJZWJGbkZEaCt4VS9RN1Y5YnlYL0NveGd2ak5GUjlS?=
 =?utf-8?B?M0ZVRlpXT2RDNGJKa3lUTUFNZGN3eFdSaGMzNlM5SnI4dzN1T0xzS3IzYWRJ?=
 =?utf-8?B?N3VwUDdIL25yVTFCWVl6RzU0b3UxSXRrT1pSOXBXcUVPOHpxbE5ES042eGhp?=
 =?utf-8?B?R0QrTHg4NGp1M1J3NU1MVmxDeFdBMEdnWkQ4K3NuQmd4OW5HNVd4TklpbHNU?=
 =?utf-8?B?clVneGVNejZNbHQwcC9WUlZmbkFOcGZzM3VnSW8xR09wTVorazBzeEdwZnJs?=
 =?utf-8?B?aldEWjFhSXFNL3paVEQ2Q0JBd0VRWUZUcjRhaWlEMmVNM0NjS3NkZDk4VHpT?=
 =?utf-8?B?eDN4NzZlSXFkRmIzeGllemFYM2duMnJUamFrTkw5YUJpcDZrbUp3VGhzdU9C?=
 =?utf-8?B?aWxZeXQwYXVWQ29QVXNkM29UYjlQaUE2d1d4MzR0TTAzTEN4TENmUHlPMXpH?=
 =?utf-8?B?dHVRUUNNSHZVOFNFOWdOczM5YVB4bTFFRHBWVnBWaWdXcG5uNStIWWp4cXdV?=
 =?utf-8?B?dllSaVBSUHczK1VVZUd0aHNuTUpVdnMrM3FlOEhEQmlKN2piUHBzbVlCdFhY?=
 =?utf-8?B?TDJrdmJHdnhpN1lMYjU2K0VrSTlZTHRxZjRvTVErKzYzRWZwenRDODN4L2wv?=
 =?utf-8?B?S0s1K2h4WTlralpUNFlkM0NmNmZpdGc4VEtONlo4ZnJ6TkM0WC9CK01RK29Z?=
 =?utf-8?B?MjRjTjVsOGxMcnpVcitCMFNlME1wcGkxelZvMzFlTTVWZXE3OVZhWjdYNEM1?=
 =?utf-8?B?eGZ6bE5TVDZrS0pNWm9sUzdOL1VVUTc3Vyt0dmlWMVlkNk04RDIwTjdtNElh?=
 =?utf-8?B?S05HQjkzcEZqUWJHaFl1SXV1emkzQ3BzOFRuOFdVUTBOdWdaUnNTNnBwWEl5?=
 =?utf-8?B?RU9QRWZJUnVBRWZ4dUx4WjdEQ21CU0hNbnVMa1BWOFdtYmI0Vms1OHRBQktn?=
 =?utf-8?B?eDErSlNpVm15ZFgwZVRScHZnRHZzLzlBT0trSkI1WGR2UWlYZit3dVVkK2NS?=
 =?utf-8?B?ZVhzVjVvckR1RzgydjZCejJwREFZVVNqa0IxbjNPK2tZTVVUcXNxa2Ewdk1v?=
 =?utf-8?B?OW11R25aczNVSUNVYjMyRkRYRGw0VzhBR1ZFRUJmd2xadmpnUEpBWnBmNnFx?=
 =?utf-8?B?UXlCNENIQ0dqeXlEamUraG1Tcm1NSUtOSUhZdCtTZjlzMmNSM2VwdzJRdUxz?=
 =?utf-8?B?d2JjSWg1WG5DMTFndTg4d284cjlCRFNRTjYxMzhIT2tiRkFpbnBZNjkxK2E0?=
 =?utf-8?B?d0grMmdsZXZWQ2ZVWkY4Skk0UWdiQTRubEd5OVBXcDNldVdOKzltZ1Naclll?=
 =?utf-8?Q?1PEvbPhGOu1YMYYJsyfw3S52J+fUtVil?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WmdVRzhKYTNWaURqNjhBQUpLSmF5UVlLaHQwdE5DUE5iMFdXOXZRZ2tMUFpP?=
 =?utf-8?B?c2dRcWFRVmNLeVRVQi8vS3FaQ29iK204aFNTRE1reFQyQjZwZ3pJVVN0SXdY?=
 =?utf-8?B?dDh6WjRvN3h5THlITWM1K1hvc0JMWVRVanFReldaRlIvZ0dFTFVLRVhVTG04?=
 =?utf-8?B?ejFId2xRQWFORXBuRnB3MXZTVm1taTVUYXgxMkw1K1JXdmd3YzNhYzZYdjBJ?=
 =?utf-8?B?QVhPdFYzcFQ0REJoaG1oYWExVXdEbGdUR3hvSmRUcjcrd3lreUpwVmRFODZa?=
 =?utf-8?B?M1VzQUl0Tmk2RzBFZmVWRUVHVjh6SnFLMk5MUWJkUkZkamd2V2l1UXJhUkFx?=
 =?utf-8?B?Q0tMcGNnQWpNWnFoRnhGcGl3eFBDTkxGM043Q2tybm04NTdOS3JtZG52YXRo?=
 =?utf-8?B?K0p5MDNtV1FuNEdwSTQ0a1ZJUEM0dS9lc3gwNVVSWGRwT1lOcVdjMnQzMmc5?=
 =?utf-8?B?Sk5TR21hWERMSHB3ZDJCdGc0QXZhWmJ4Q2hpUlpwL1pkUENjQXErZUIvWEFF?=
 =?utf-8?B?UDgwVDdycXE5a0FnVExSeDZkb0tlbGNrSkpnRWd4cVlLK3hCVmt6SFlTRFdP?=
 =?utf-8?B?bGMrUHNyd2FmWFU4cE5RcS84TnpFUlIxRkgzRTR2NTNXdy9MSkp0QlBNcVNJ?=
 =?utf-8?B?TUYwK01XTWUwOHZYNEdIVXNGeDFwVXgzUkJwMlU5VW5OVjl2TWhTNEdzeVIr?=
 =?utf-8?B?emloNy9sdVRBaCtGb3V2TzQ2ZjVBd1ArMHZSZklhMzJsMnFUTEk2SysvT2tO?=
 =?utf-8?B?NEpwNnVyRHVsdnpLVUwvd1ZsdjBKSkI4MEdGb2N3UEJ2Zk5DdjlBUHZkTE1p?=
 =?utf-8?B?MEJyNFZWMEc3MFJmNEsvS0ppR0VKMHdkZlVmUnlwVitvWjJMdGozRUpsVDlT?=
 =?utf-8?B?Q2NrSnZWc3lsNFI2VWpaZnA2bXBsTEVNVDZjWHZLK3Jpc2JndUxMWGxOSE1N?=
 =?utf-8?B?NG9pcjErNytsWDNGazZmNG9FdE1sRDh5cGQ3V3NWOFhuL3VESGkxa2JtbEhL?=
 =?utf-8?B?VVA1N1huTXJmSWJYZGJwZXJuNEJvM2lGTGpYMjhpTXh2cmNvOExHNGZQRWhs?=
 =?utf-8?B?MHFkUW9JYlZRUzRqS3VHQjBFSUVzY29sV2Q4SW9oa3FBQzJrdWxQdlNmMXpB?=
 =?utf-8?B?eTFXcmZSa25IT3RVekRDbXpreFkyZEloSzFGNlVMS3R1Mnk3a2Yrd0YwYzdU?=
 =?utf-8?B?UGQ1S3pBMWJVNktiUkFiaGZDZGlldU5uMTNJQ2hwcDVHL012RTlOSkZqaktP?=
 =?utf-8?B?akh2R0N6eEt1by9ON3FUR0MxUDRKQVMzV2xLbXJmQk1xcWI4Y0FlQm1ZK0JL?=
 =?utf-8?B?TzU3c2l2US9CYTg5TjRnQ1QvTHgvQ2R3TnFHZlVaOWxTZ1EvVVd1V2pGUHFZ?=
 =?utf-8?B?aVhHWGExeFJqNUZrUDh1MU1VOVhWUlJXd2NVTFhjNWJIenAweXJycDRFdzZm?=
 =?utf-8?B?ejVaMVVvL3c5NVBjdHRDejQ5LzlnbGp4OXM2OG1lTkxaR0puaDY2SngyUGYz?=
 =?utf-8?B?ckFpYzgrQ2FWREcxQWZsZGJ5eGpzdExTQm1WUHpEeVBGT2d4c2xKUTRkWHJB?=
 =?utf-8?B?KzJJVGNtYUNJb2E0NGl2OXdtaEUzeWd1RHpYRGhZY2hjTmwvTTNBNkMzeVJL?=
 =?utf-8?B?K0VBazlVSWx6VzduTGFYWGJoWlB5aDRVTW51UEw1dnRDVnpVcXR3RHF6TTUx?=
 =?utf-8?B?VW8wS1JkNDJmZ3RGRzB4Z2pEcUNieGhtVVhrR0VNZGFPR0luam9KWDE3bUdW?=
 =?utf-8?B?MVUyNmFHL1JLUkI3aDQxMlRyYUFWdlgvdnFWZCtYaHlFLys2eFh4WUhTbFhX?=
 =?utf-8?B?WWhrL1pPRExzRGNBZTlKU1JVRERzUlQ0VFJOQnc5WTVMUjFTbzlRbytUR3VF?=
 =?utf-8?B?ck9EaDRlMXNLdW4vT3VmOEYyTCs5UE91YkttaTNaRGdlZnA0MTFTd0dNN1Fi?=
 =?utf-8?B?OWZWZHByRWhac0VCeWRmVWR6VUk3M1hhWi9WSm1WRFpseUFwWURNQ3ZqL1hJ?=
 =?utf-8?B?NkdtQkh3YU1PalJzSy95T1pnY3FzY1o3MGl4K2xMSmoyTUxac2hYbDhGUVlV?=
 =?utf-8?B?T2lmSXFDQ1JEdDRCc21HUkZQTlVyWTM1MmZPNExSakpIb1ZrUVIrVElBR0tS?=
 =?utf-8?Q?il01VNsSSIYmR4ezfQCO+iEFj?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b43e1da2-e58d-4a74-4b39-08de1de66484
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2025 10:14:10.0428 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ATrREFy6jzwuo1zU1NIyoA4h9JJ1YJy0nWJJW5xOVnwqLYOQ3R6ka72gCVhxJ7TJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7629
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

On 11/7/25 10:04, Pierre-Eric Pelloux-Prayer wrote:
> If true, the hw engine retains context among dependent jobs, which means
> load balancing between schedulers cannot be used at the job level.

Take the sentence above...

> 
> amdgpu_ctx_init_entity uses this information to disable load balancing,
> but it's best to store it as a property rather than deduce it based on
> hw_ip.
> 
> Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h | 1 +
>  drivers/gpu/drm/amd/amdgpu/uvd_v3_1.c    | 1 +
>  drivers/gpu/drm/amd/amdgpu/uvd_v4_2.c    | 1 +
>  drivers/gpu/drm/amd/amdgpu/uvd_v5_0.c    | 1 +
>  drivers/gpu/drm/amd/amdgpu/uvd_v6_0.c    | 3 +++
>  drivers/gpu/drm/amd/amdgpu/uvd_v7_0.c    | 2 ++
>  drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c    | 2 ++
>  drivers/gpu/drm/amd/amdgpu/vcn_v2_0.c    | 2 ++
>  drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c    | 2 ++
>  drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c    | 3 +++
>  drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c    | 1 +
>  drivers/gpu/drm/amd/amdgpu/vcn_v4_0_3.c  | 1 +
>  drivers/gpu/drm/amd/amdgpu/vcn_v4_0_5.c  | 1 +
>  drivers/gpu/drm/amd/amdgpu/vcn_v5_0_0.c  | 1 +
>  drivers/gpu/drm/amd/amdgpu/vcn_v5_0_1.c  | 1 +
>  15 files changed, 23 insertions(+)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h
> index 4b46e3c26ff3..a10efac2fc54 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h
> @@ -211,6 +211,7 @@ struct amdgpu_ring_funcs {
>  	bool			support_64bit_ptrs;
>  	bool			no_user_fence;
>  	bool			secure_submission_supported;
> +	bool			engine_retains_context;

... and put it as kerneldoc (similar to @extra_bytes below) here on the member.

With that done the patch is Reviewed-by: Christian König <christian.koenig@amd.com>

Regards,
Christian.

>  
>  	/**
>  	 * @extra_bytes:
> diff --git a/drivers/gpu/drm/amd/amdgpu/uvd_v3_1.c b/drivers/gpu/drm/amd/amdgpu/uvd_v3_1.c
> index 2e79a3afc774..4a85b5465bb2 100644
> --- a/drivers/gpu/drm/amd/amdgpu/uvd_v3_1.c
> +++ b/drivers/gpu/drm/amd/amdgpu/uvd_v3_1.c
> @@ -181,6 +181,7 @@ static const struct amdgpu_ring_funcs uvd_v3_1_ring_funcs = {
>  	.align_mask = 0xf,
>  	.support_64bit_ptrs = false,
>  	.no_user_fence = true,
> +	.engine_retains_context = true,
>  	.get_rptr = uvd_v3_1_ring_get_rptr,
>  	.get_wptr = uvd_v3_1_ring_get_wptr,
>  	.set_wptr = uvd_v3_1_ring_set_wptr,
> diff --git a/drivers/gpu/drm/amd/amdgpu/uvd_v4_2.c b/drivers/gpu/drm/amd/amdgpu/uvd_v4_2.c
> index 4b96fd583772..e7c1d12f0596 100644
> --- a/drivers/gpu/drm/amd/amdgpu/uvd_v4_2.c
> +++ b/drivers/gpu/drm/amd/amdgpu/uvd_v4_2.c
> @@ -775,6 +775,7 @@ static const struct amdgpu_ring_funcs uvd_v4_2_ring_funcs = {
>  	.align_mask = 0xf,
>  	.support_64bit_ptrs = false,
>  	.no_user_fence = true,
> +	.engine_retains_context = true,
>  	.get_rptr = uvd_v4_2_ring_get_rptr,
>  	.get_wptr = uvd_v4_2_ring_get_wptr,
>  	.set_wptr = uvd_v4_2_ring_set_wptr,
> diff --git a/drivers/gpu/drm/amd/amdgpu/uvd_v5_0.c b/drivers/gpu/drm/amd/amdgpu/uvd_v5_0.c
> index 71409ad8b7ed..a62788e4af96 100644
> --- a/drivers/gpu/drm/amd/amdgpu/uvd_v5_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/uvd_v5_0.c
> @@ -882,6 +882,7 @@ static const struct amdgpu_ring_funcs uvd_v5_0_ring_funcs = {
>  	.align_mask = 0xf,
>  	.support_64bit_ptrs = false,
>  	.no_user_fence = true,
> +	.engine_retains_context = true,
>  	.get_rptr = uvd_v5_0_ring_get_rptr,
>  	.get_wptr = uvd_v5_0_ring_get_wptr,
>  	.set_wptr = uvd_v5_0_ring_set_wptr,
> diff --git a/drivers/gpu/drm/amd/amdgpu/uvd_v6_0.c b/drivers/gpu/drm/amd/amdgpu/uvd_v6_0.c
> index ceb94bbb03a4..0435577b9b3b 100644
> --- a/drivers/gpu/drm/amd/amdgpu/uvd_v6_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/uvd_v6_0.c
> @@ -1552,6 +1552,7 @@ static const struct amdgpu_ring_funcs uvd_v6_0_ring_phys_funcs = {
>  	.align_mask = 0xf,
>  	.support_64bit_ptrs = false,
>  	.no_user_fence = true,
> +	.engine_retains_context = true,
>  	.get_rptr = uvd_v6_0_ring_get_rptr,
>  	.get_wptr = uvd_v6_0_ring_get_wptr,
>  	.set_wptr = uvd_v6_0_ring_set_wptr,
> @@ -1578,6 +1579,7 @@ static const struct amdgpu_ring_funcs uvd_v6_0_ring_vm_funcs = {
>  	.align_mask = 0xf,
>  	.support_64bit_ptrs = false,
>  	.no_user_fence = true,
> +	.engine_retains_context = true,
>  	.get_rptr = uvd_v6_0_ring_get_rptr,
>  	.get_wptr = uvd_v6_0_ring_get_wptr,
>  	.set_wptr = uvd_v6_0_ring_set_wptr,
> @@ -1607,6 +1609,7 @@ static const struct amdgpu_ring_funcs uvd_v6_0_enc_ring_vm_funcs = {
>  	.nop = HEVC_ENC_CMD_NO_OP,
>  	.support_64bit_ptrs = false,
>  	.no_user_fence = true,
> +	.engine_retains_context = true,
>  	.get_rptr = uvd_v6_0_enc_ring_get_rptr,
>  	.get_wptr = uvd_v6_0_enc_ring_get_wptr,
>  	.set_wptr = uvd_v6_0_enc_ring_set_wptr,
> diff --git a/drivers/gpu/drm/amd/amdgpu/uvd_v7_0.c b/drivers/gpu/drm/amd/amdgpu/uvd_v7_0.c
> index 1f8866f3f63c..3720d72f2c3e 100644
> --- a/drivers/gpu/drm/amd/amdgpu/uvd_v7_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/uvd_v7_0.c
> @@ -1539,6 +1539,7 @@ static const struct amdgpu_ring_funcs uvd_v7_0_ring_vm_funcs = {
>  	.align_mask = 0xf,
>  	.support_64bit_ptrs = false,
>  	.no_user_fence = true,
> +	.engine_retains_context = true,
>  	.get_rptr = uvd_v7_0_ring_get_rptr,
>  	.get_wptr = uvd_v7_0_ring_get_wptr,
>  	.set_wptr = uvd_v7_0_ring_set_wptr,
> @@ -1571,6 +1572,7 @@ static const struct amdgpu_ring_funcs uvd_v7_0_enc_ring_vm_funcs = {
>  	.nop = HEVC_ENC_CMD_NO_OP,
>  	.support_64bit_ptrs = false,
>  	.no_user_fence = true,
> +	.engine_retains_context = true,
>  	.get_rptr = uvd_v7_0_enc_ring_get_rptr,
>  	.get_wptr = uvd_v7_0_enc_ring_get_wptr,
>  	.set_wptr = uvd_v7_0_enc_ring_set_wptr,
> diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c b/drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c
> index a316797875a8..1691d0f955a9 100644
> --- a/drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c
> @@ -2117,6 +2117,7 @@ static const struct amdgpu_ring_funcs vcn_v1_0_dec_ring_vm_funcs = {
>  	.support_64bit_ptrs = false,
>  	.no_user_fence = true,
>  	.secure_submission_supported = true,
> +	.engine_retains_context = true,
>  	.get_rptr = vcn_v1_0_dec_ring_get_rptr,
>  	.get_wptr = vcn_v1_0_dec_ring_get_wptr,
>  	.set_wptr = vcn_v1_0_dec_ring_set_wptr,
> @@ -2150,6 +2151,7 @@ static const struct amdgpu_ring_funcs vcn_v1_0_enc_ring_vm_funcs = {
>  	.align_mask = 0x3f,
>  	.nop = VCN_ENC_CMD_NO_OP,
>  	.support_64bit_ptrs = false,
> +	.engine_retains_context = true,
>  	.no_user_fence = true,
>  	.get_rptr = vcn_v1_0_enc_ring_get_rptr,
>  	.get_wptr = vcn_v1_0_enc_ring_get_wptr,
> diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v2_0.c b/drivers/gpu/drm/amd/amdgpu/vcn_v2_0.c
> index 8897dcc9c1a0..046dd6b216e9 100644
> --- a/drivers/gpu/drm/amd/amdgpu/vcn_v2_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/vcn_v2_0.c
> @@ -2113,6 +2113,7 @@ static const struct amdgpu_ring_funcs vcn_v2_0_dec_ring_vm_funcs = {
>  	.type = AMDGPU_RING_TYPE_VCN_DEC,
>  	.align_mask = 0xf,
>  	.secure_submission_supported = true,
> +	.engine_retains_context = true,
>  	.get_rptr = vcn_v2_0_dec_ring_get_rptr,
>  	.get_wptr = vcn_v2_0_dec_ring_get_wptr,
>  	.set_wptr = vcn_v2_0_dec_ring_set_wptr,
> @@ -2144,6 +2145,7 @@ static const struct amdgpu_ring_funcs vcn_v2_0_enc_ring_vm_funcs = {
>  	.type = AMDGPU_RING_TYPE_VCN_ENC,
>  	.align_mask = 0x3f,
>  	.nop = VCN_ENC_CMD_NO_OP,
> +	.engine_retains_context = true,
>  	.get_rptr = vcn_v2_0_enc_ring_get_rptr,
>  	.get_wptr = vcn_v2_0_enc_ring_get_wptr,
>  	.set_wptr = vcn_v2_0_enc_ring_set_wptr,
> diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c b/drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c
> index cebee453871c..063f88da120b 100644
> --- a/drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c
> +++ b/drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c
> @@ -1777,6 +1777,7 @@ static const struct amdgpu_ring_funcs vcn_v2_5_dec_ring_vm_funcs = {
>  	.type = AMDGPU_RING_TYPE_VCN_DEC,
>  	.align_mask = 0xf,
>  	.secure_submission_supported = true,
> +	.engine_retains_context = true,
>  	.get_rptr = vcn_v2_5_dec_ring_get_rptr,
>  	.get_wptr = vcn_v2_5_dec_ring_get_wptr,
>  	.set_wptr = vcn_v2_5_dec_ring_set_wptr,
> @@ -1877,6 +1878,7 @@ static const struct amdgpu_ring_funcs vcn_v2_5_enc_ring_vm_funcs = {
>  	.type = AMDGPU_RING_TYPE_VCN_ENC,
>  	.align_mask = 0x3f,
>  	.nop = VCN_ENC_CMD_NO_OP,
> +	.engine_retains_context = true,
>  	.get_rptr = vcn_v2_5_enc_ring_get_rptr,
>  	.get_wptr = vcn_v2_5_enc_ring_get_wptr,
>  	.set_wptr = vcn_v2_5_enc_ring_set_wptr,
> diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c b/drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c
> index d9cf8f0feeb3..8dcc07b3f631 100644
> --- a/drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c
> @@ -1857,6 +1857,7 @@ static const struct amdgpu_ring_funcs vcn_v3_0_dec_sw_ring_vm_funcs = {
>  	.align_mask = 0x3f,
>  	.nop = VCN_DEC_SW_CMD_NO_OP,
>  	.secure_submission_supported = true,
> +	.engine_retains_context = true,
>  	.get_rptr = vcn_v3_0_dec_ring_get_rptr,
>  	.get_wptr = vcn_v3_0_dec_ring_get_wptr,
>  	.set_wptr = vcn_v3_0_dec_ring_set_wptr,
> @@ -2021,6 +2022,7 @@ static const struct amdgpu_ring_funcs vcn_v3_0_dec_ring_vm_funcs = {
>  	.type = AMDGPU_RING_TYPE_VCN_DEC,
>  	.align_mask = 0xf,
>  	.secure_submission_supported = true,
> +	.engine_retains_context = true,
>  	.get_rptr = vcn_v3_0_dec_ring_get_rptr,
>  	.get_wptr = vcn_v3_0_dec_ring_get_wptr,
>  	.set_wptr = vcn_v3_0_dec_ring_set_wptr,
> @@ -2122,6 +2124,7 @@ static const struct amdgpu_ring_funcs vcn_v3_0_enc_ring_vm_funcs = {
>  	.type = AMDGPU_RING_TYPE_VCN_ENC,
>  	.align_mask = 0x3f,
>  	.nop = VCN_ENC_CMD_NO_OP,
> +	.engine_retains_context = true,
>  	.get_rptr = vcn_v3_0_enc_ring_get_rptr,
>  	.get_wptr = vcn_v3_0_enc_ring_get_wptr,
>  	.set_wptr = vcn_v3_0_enc_ring_set_wptr,
> diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c b/drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c
> index 3ae666522d57..f1306316dc3c 100644
> --- a/drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c
> @@ -1977,6 +1977,7 @@ static struct amdgpu_ring_funcs vcn_v4_0_unified_ring_vm_funcs = {
>  	.type = AMDGPU_RING_TYPE_VCN_ENC,
>  	.align_mask = 0x3f,
>  	.nop = VCN_ENC_CMD_NO_OP,
> +	.engine_retains_context = true,
>  	.extra_bytes = sizeof(struct amdgpu_vcn_rb_metadata),
>  	.get_rptr = vcn_v4_0_unified_ring_get_rptr,
>  	.get_wptr = vcn_v4_0_unified_ring_get_wptr,
> diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v4_0_3.c b/drivers/gpu/drm/amd/amdgpu/vcn_v4_0_3.c
> index eacf4e93ba2f..5a935c07352a 100644
> --- a/drivers/gpu/drm/amd/amdgpu/vcn_v4_0_3.c
> +++ b/drivers/gpu/drm/amd/amdgpu/vcn_v4_0_3.c
> @@ -1628,6 +1628,7 @@ static const struct amdgpu_ring_funcs vcn_v4_0_3_unified_ring_vm_funcs = {
>  	.type = AMDGPU_RING_TYPE_VCN_ENC,
>  	.align_mask = 0x3f,
>  	.nop = VCN_ENC_CMD_NO_OP,
> +	.engine_retains_context = true,
>  	.get_rptr = vcn_v4_0_3_unified_ring_get_rptr,
>  	.get_wptr = vcn_v4_0_3_unified_ring_get_wptr,
>  	.set_wptr = vcn_v4_0_3_unified_ring_set_wptr,
> diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v4_0_5.c b/drivers/gpu/drm/amd/amdgpu/vcn_v4_0_5.c
> index b107ee80e472..1a485f5825dd 100644
> --- a/drivers/gpu/drm/amd/amdgpu/vcn_v4_0_5.c
> +++ b/drivers/gpu/drm/amd/amdgpu/vcn_v4_0_5.c
> @@ -1481,6 +1481,7 @@ static struct amdgpu_ring_funcs vcn_v4_0_5_unified_ring_vm_funcs = {
>  	.type = AMDGPU_RING_TYPE_VCN_ENC,
>  	.align_mask = 0x3f,
>  	.nop = VCN_ENC_CMD_NO_OP,
> +	.engine_retains_context = true,
>  	.get_rptr = vcn_v4_0_5_unified_ring_get_rptr,
>  	.get_wptr = vcn_v4_0_5_unified_ring_get_wptr,
>  	.set_wptr = vcn_v4_0_5_unified_ring_set_wptr,
> diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v5_0_0.c b/drivers/gpu/drm/amd/amdgpu/vcn_v5_0_0.c
> index 0202df5db1e1..2d8214f591f1 100644
> --- a/drivers/gpu/drm/amd/amdgpu/vcn_v5_0_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/vcn_v5_0_0.c
> @@ -1203,6 +1203,7 @@ static const struct amdgpu_ring_funcs vcn_v5_0_0_unified_ring_vm_funcs = {
>  	.type = AMDGPU_RING_TYPE_VCN_ENC,
>  	.align_mask = 0x3f,
>  	.nop = VCN_ENC_CMD_NO_OP,
> +	.engine_retains_context = true,
>  	.get_rptr = vcn_v5_0_0_unified_ring_get_rptr,
>  	.get_wptr = vcn_v5_0_0_unified_ring_get_wptr,
>  	.set_wptr = vcn_v5_0_0_unified_ring_set_wptr,
> diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v5_0_1.c b/drivers/gpu/drm/amd/amdgpu/vcn_v5_0_1.c
> index 714350cabf2f..bd3a04f1414d 100644
> --- a/drivers/gpu/drm/amd/amdgpu/vcn_v5_0_1.c
> +++ b/drivers/gpu/drm/amd/amdgpu/vcn_v5_0_1.c
> @@ -1328,6 +1328,7 @@ static const struct amdgpu_ring_funcs vcn_v5_0_1_unified_ring_vm_funcs = {
>  	.type = AMDGPU_RING_TYPE_VCN_ENC,
>  	.align_mask = 0x3f,
>  	.nop = VCN_ENC_CMD_NO_OP,
> +	.engine_retains_context = true,
>  	.get_rptr = vcn_v5_0_1_unified_ring_get_rptr,
>  	.get_wptr = vcn_v5_0_1_unified_ring_get_wptr,
>  	.set_wptr = vcn_v5_0_1_unified_ring_set_wptr,

