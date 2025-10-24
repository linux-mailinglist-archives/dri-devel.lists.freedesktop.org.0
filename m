Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09C4CC07191
	for <lists+dri-devel@lfdr.de>; Fri, 24 Oct 2025 17:54:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DADF10E20A;
	Fri, 24 Oct 2025 15:54:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="NE6w9z8Q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11010043.outbound.protection.outlook.com [52.101.201.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F08D910E20A;
 Fri, 24 Oct 2025 15:54:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WIMDNPN//0APKZfmgqaqMjHVB54EBqnWholWFsvFHzFjD6zBivFpVJODbiHsr0mMMM7r2mWV/DDWO0aFkAWnWikRR2r7LFKnSKy8VHx2Co0pTlfI+07zix8BQdoQJYtdWHvLOxvNzCJM2omIeLMaQXaqQ3my16ARxb4odlOAIfnvAdHKGSisDuOmcSYKjJcVvUJ+ckNUkpgUCmwiHGi+doglyrkAP6F6FaSFK/guhbiUJo622d2zrTasnErf4VS2fkfVG1AH2XX4K9pXoutQd9kuw8bJE8K3kIbef/XNrxL8wyYvorB9Jg9jdyzUuuyHm42+0yOsFsjrfvSIFu2sBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MG8NdhVduVTqEuGupedkprRX9bGPvUu1hpT4KNQ11M4=;
 b=h3Z0rfSZjdiUHoLJPy4/P4YCuCrR8VgO6eOvsLu96HS2y/UPUfQcXdHSop5DuBUcYM6Bev7hXvEqM5nNOFxy2xnhbt4x0N+/5+gATV8TbmcCKwZezD/zTERuzyjPx7C/ME/Cc5kjmllPFqq/S1I15qiECf1LTiGXezCJR/Np67RQGgtJ2qKkFg9Hr0WT9JnkRn3ptxg7XOfX2jSiWddkEyUBePAWKNilZ5L2fdlBLaLYVLr9zfPNZeeSopB54zNJHuisimYmJb6+J0tN2sOTeFl13P2dwjoSklDiW00M62dRGfifI5UiuSp4rGyrtbJH5F2ASolGlUOfqnxlcYsxHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MG8NdhVduVTqEuGupedkprRX9bGPvUu1hpT4KNQ11M4=;
 b=NE6w9z8QcEk8IeAMCGF3le3yd3oZ7E/9ER6BrLAm/ZJwdWWcehdRVnEaCnp38LEEcW++bdaJkaZxqbHckA9kBNUhEzJ1vFRtjOMVct25iDlGXIFmAeoVetMPw65zZEVU/a86ln6D6RAGS9RDVh4Jbc3Wmet4xsD3QNTbfsxvdxU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by MW6PR12MB8707.namprd12.prod.outlook.com (2603:10b6:303:241::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Fri, 24 Oct
 2025 15:54:16 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%7]) with mapi id 15.20.9253.011; Fri, 24 Oct 2025
 15:54:14 +0000
Message-ID: <61da9864-b7c8-43f1-b437-36756077b545@amd.com>
Date: Fri, 24 Oct 2025 10:54:12 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/3] drm/amdgpu: only send the SMU RLC notification on
 S3
To: Antheas Kapenekakis <lkml@antheas.dev>,
 Alex Deucher <alexander.deucher@amd.com>,
 Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, Perry Yuan <perry.yuan@amd.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
References: <20251024152152.3981721-1-lkml@antheas.dev>
 <20251024152152.3981721-4-lkml@antheas.dev>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20251024152152.3981721-4-lkml@antheas.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN7P222CA0016.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:124::16) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|MW6PR12MB8707:EE_
X-MS-Office365-Filtering-Correlation-Id: e87bb652-a966-485d-8675-08de131594f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?STJwTUpSb3BPaUNuTXhlL2tlWHRhSVdHK1NxZHpVdkNDcmcxaGdJSG9SMnZY?=
 =?utf-8?B?NVNRZ09Xa3crQWY5ODVBMTRqOW1tWHd3RHA2MzM3K3YzaS81anRmcm0zVmlW?=
 =?utf-8?B?cXB2UStYNXAvQ0d4Uk81NkdZNTRJUERtY2pqSWJWdmRlQm1CMEVrakpzY2RV?=
 =?utf-8?B?Q3BtRlVSZnhKYjd6SVZtelJZN1MwSEVQVFNJVFRTSUdXeElkZnZUZVhVTVgr?=
 =?utf-8?B?cVpBdXBtOTM2T3BLT3hxYmNlTXpWekl6UzBIaHFpOTN6VnZCYlpkYlBaS3J2?=
 =?utf-8?B?aGNVdnpyQU1pYXJjNWpTcnRGclRFaGR4NlNlV0I2MVZhQVNtWlAyelNNcWVF?=
 =?utf-8?B?NE44ZGJYMnNpU0ZOdTdpWjNXQ0xuU0JKUUpvaXZackRXYW1qTklWeE1PeGlW?=
 =?utf-8?B?UUFhdHJSTGRmL0ZOZjI1Mm1kV0F4Wk4xTXlMdTlZbUNaVUdxQjN4MUJ3NzZC?=
 =?utf-8?B?VERRc3g0eDVOcVNMaGhLMS9NMUVoNjlpbUV1aTBRWFRudG9US05DaTNsRWRu?=
 =?utf-8?B?M3kvQzJHTWdGRXQ5QXZjTlJKSnVoTW9pY2pCdW9RcFdHZVJSNHl1cTY0Nkk3?=
 =?utf-8?B?bTBhdWhzZ2xFNXR3VFNaeXZtMnZSVU40cVpKelhCUHRRY0tPMnIxYWlSMG1B?=
 =?utf-8?B?czM5c1VIQUVjRllBVngwVTA4STVwN21MR0VwZjlGc3VHUkhyZkN6c3c0WEpT?=
 =?utf-8?B?SXd0clg3RVk5cE4xdXFDRHJrK1N1V3ZBd2VRdFB1WFVkN0sraldEdDJ3dG5s?=
 =?utf-8?B?cnRmTFZyWXBObkNJL05MVERBM2pmTFdIUnptbFFzZVpEL09xLzA3U2ZRMVhB?=
 =?utf-8?B?aEJRc3JlRWsvQ1EvUCtZNTBaTFhWS25zcGprbXRsS1lNRzJXVkpLS2dHOXVv?=
 =?utf-8?B?SFRERDlBS0dJZEZDK2lpSnpFU1phUTlSRlJTTjI3TDZ2UnQ0d0M5cExzWWh3?=
 =?utf-8?B?ZTRHeE5jV2Foa1lMMWNiTld5UFFwZHVhSmNmOWhVN1Vwd0t2Vk5UVlY2bWdR?=
 =?utf-8?B?eWRxK0IwcUh6eGdCU09xS1JtV0VxdkRTSFpCSnBDaHJxenlZbUZ4dEdwOTEw?=
 =?utf-8?B?cmVpb1Y0SGNMcXB0azlhQ3FPUTd5WjFEUFlBdmJOdHFJSUhBYUhkV0MxU3d4?=
 =?utf-8?B?MVhJUjJTcGhoS3RMbEhoWlBvUEhJWVVtSDYxMmI4Qmp3R25jcFc1Sk5ET2J3?=
 =?utf-8?B?R21iQVAwOXpqNkVsN3JWNGtBakhxN1JoZzlPclBhM0gvZURIRXJzL2tRd3A4?=
 =?utf-8?B?Ty9UbE1JWVAzZEY3azFzQjE3WXFpdjdZRWt0cjdwV24vWHh5cjJQWXM2YWRn?=
 =?utf-8?B?cVNwUU5OWHp6Tkx5RzdsNmZnNE4xcUw4bWpZZ2hMb3VNRHkxOVVNRDIrdkgr?=
 =?utf-8?B?WGMvYjFBMlhTRDIzRlVmYWNDclE0Sm9JNXNaK2F2cC9mOUVBZzlSY08vNWlT?=
 =?utf-8?B?UFRsYkttK2pIZlo2VFVWYmVDdzFBRDZCUmZJNGxMemR4Mnc5ZWhlOWt2RUxx?=
 =?utf-8?B?MDZKR2FkbVVsTW5uWG41Z1JHd2t4cW9xdllJamtkbTVaMldiTHZwRzByK1N0?=
 =?utf-8?B?ay82QmZWVGFEWlBnd1E2M055dUJHaGczUkVuUGdTUmZTSmhOU0NWeSs5eEVj?=
 =?utf-8?B?N2habmZoajYveERYUnFBWm5nTmpwNDV0ckZpUU1QbWgrYzJLamNkMktzUm5D?=
 =?utf-8?B?aGUwZFdvOEpoOHlMZENFQmVoRlZqQ1dlV2lkeVhheW9FWEdhdWFRM2FrRVZl?=
 =?utf-8?B?ZEVENmhzZmd1RHFYLzllaXdXUzdFVGtYYjczMzdLQWhhS3YyUjFBeEpOZkI1?=
 =?utf-8?B?MlZwQnZNbkxjTjdTUmJOS2lkMUxtUE5zOUZGWFVmckJSNENuRVJnUlp1bGx6?=
 =?utf-8?B?WlJxTG5wK2dQWURzSE84R0pVRUcvNng4YTVIdjltVzd6L3c9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VGJmekZEMEJiUlcvV05TUjNybzBuakZWWXpSek5QN25laHk0eHFUTE5lYUxI?=
 =?utf-8?B?QXJmVTVNcHlwLzZkRGcveVZybk9nSWpXWWlRRW5XYmVqdTdpcE1rcG8vTGFX?=
 =?utf-8?B?MkdpdGk1TGNmUC9JU1ArRGU3MVMvWHBkemxHMktpRHpCZ3kwU0dxUkxoRmlY?=
 =?utf-8?B?UTBGallSb2JadlJyeE93eVVCcmtYdHdoL3ZSVlVXblp1bnFJdTU2dHlGNWNK?=
 =?utf-8?B?aDBMRitxNFliR3U0OXdjMlNFaE1PaUlvdGRncFhGNURrWUJZNkVIbmJnSEJk?=
 =?utf-8?B?cTJzUXBiQ3YwYTlPdE9UMm1lbHB1eFVPV0IyMnlVMDU2eHhwVWJrRVhkVEVU?=
 =?utf-8?B?c0hpSmVkSENFUllKSjdLYVlMYlVkdWJmMmtKSERiRnh4L25LallQenJnS0pw?=
 =?utf-8?B?d3d6dXVJbFVTc1RSZEdoS2RabGYvaHJBODk4V3dUMW1CL1FsSUhVQkNaamxx?=
 =?utf-8?B?L29yWHZ3aUJRUHlzV3VQdENmREFqLzFPM0x2YkMxNXM2WlFXenN1bEVDamh6?=
 =?utf-8?B?R0NHZC95bENaYmI4UHluRTE4cmRKNkRGMmZiM09LNXk4SGNMdlhOZkJJaTZh?=
 =?utf-8?B?L2JJRDhoVmR5NDNwbXI2YXBLN09mZUFZdFVhZkEvNTN1NnMzTnVuRksydVQz?=
 =?utf-8?B?YlcybGJybGtPS29IOFZVN1V3L2ZtSTk3amlMYXhtcGdaVE9MWElRc2FEaXFP?=
 =?utf-8?B?M0FaNnIyajZYcGtDSDN1UmVDeTRuUjNMelU2ZU1HQ3dXNnRtbklETEx6bWg4?=
 =?utf-8?B?Z0tKVkQ5SEZmREJpdWg0NnEyb3ZSN1FvdzVORklqd08rNzB3OFFGRjdFOWhm?=
 =?utf-8?B?djFNdEJMcm04V1ZhNkpwa2x6UUxzTGoyamQwbVRoTHJHU0ZtVXRkRGY0VkJj?=
 =?utf-8?B?OGFCcTh5SDlwcStLaVRibU1aZ29Ockh4WFRuWjFxdDdtQkxqcXhqVTI5S0ZG?=
 =?utf-8?B?TTFQTWp5YXppMFE1RlNsTldFMG5hNHJqdVVuNC92Tkt2UCtFdkpsWlhnME1L?=
 =?utf-8?B?b3FlU0ZZZTNmYkNCeE5uOWRFaURwQmcrbmlFbXlVdVJQVGFKMytBSDF4STkr?=
 =?utf-8?B?RE9UMjJ1NXVtb2Mvc1hZc2NWbEtUTW8xTTFPdWFxL2dwZk9vaGhRVGJoYjJX?=
 =?utf-8?B?OVAxUHYzVEhyNnc2dzVHeXc2M2EvNXlIWVFneHpsK0V1TjEyLzkrbU45SUYv?=
 =?utf-8?B?Q0QvSm5tOGY1VVdZSDJ5VmhPTllRYzZLVGUxMjhpS1JGaXkyM1dqWXppcDhZ?=
 =?utf-8?B?TldYOVFGb0YzTDhiUWY2VGh6QWN1TkZYWlpDYllLODRSOHlGZWQxeFZab0N2?=
 =?utf-8?B?RFVyRlRMenRaQUZkbkJ1elBDUWluNkxOMVRGaEpLN09XWHBHTlMzOWFRa2s5?=
 =?utf-8?B?bFh4RGl2RWROSElsVWlyNnZBdy9DNjRsaEJlTzV6VE4yVWNOMkkzWVBLNnEy?=
 =?utf-8?B?MnExcWpuSmF3S09SY3dOb1FqSE1pUFd0MThBWE9mS2VjMU5UcW96TkZhNk5Z?=
 =?utf-8?B?YTlBOTkwc0hpUmlUWEg5VDI0ZmxkQ3FBWnNRSGgyMnRUSE5UMisxQ1lnOU03?=
 =?utf-8?B?MVZ3UjB5MnNqejZEViswallna2hxVE9ETXhZU0RyL1dkY3NhckJpTGdtTnBs?=
 =?utf-8?B?ZUxudVQ1K0RaYlZERTB0SUtQN2lOVkd0MFFBaEZCeTBCTWEwQnd6RWF1TEdz?=
 =?utf-8?B?bWFCVzJtdlZ4STEyTGVqenVkeEhpeWtMRXB4UjJIemJlVFNpUDNra3EveUxZ?=
 =?utf-8?B?bklrcWpvRk9JZ3RqNlEwMHhSZnlLYW9aSU4zWkRJZzZHSTBlZzlsRFpIVW81?=
 =?utf-8?B?d1NCQUV3Nkt4ZGVIR0tOL2VKbjRXd0I2MVZDdUdxanVhaE45aWFMQWN2eW5C?=
 =?utf-8?B?NEpYaHl0cHRKYUk0dWg0Qkt6b1h6QmFldTJJSUxJQnVET2M0UE9DMFA2TWE5?=
 =?utf-8?B?ak93SHFGOXBRL041THExUnZscWZHZmNOc2l2VTJwTTRaQjIyVUhJa0ZCRXVl?=
 =?utf-8?B?dlVDUE5PR1dVdERacnBDOEJCekFRVzFKQnhFQm9XOFRjMEF1VkwzdFNIQVdG?=
 =?utf-8?B?RGc2SWt1b1NadGJIb1p4R2ZJVUd1ZThSUTVKcUxoVEVnYnJ3L1lpR2Z3SWRt?=
 =?utf-8?Q?mvBcgdrWFqikpoFX7QtiMxHvi?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e87bb652-a966-485d-8675-08de131594f9
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2025 15:54:14.8966 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GLKg1AU/+2dOaeT70Sy8lsYd+Qzz0SJh+Ypy44EuD7q/zTb3UpvdFfxB4qmsiQ2VxhLgo18UXkcaUwP9gBLWJw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8707
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



On 10/24/2025 10:21 AM, Antheas Kapenekakis wrote:
> From: Alex Deucher <alexander.deucher@amd.com>
> 
> For S0ix, the RLC is not powered down. Rework the Van Gogh logic to
> skip powering it down and skip part of post-init.
> 
> Fixes: 8c4e9105b2a8 ("drm/amdgpu: optimize RLC powerdown notification on Vangogh")
> Closes: https://gitlab.freedesktop.org/drm/amd/-/issues/4659
> Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
> Tested-by: Antheas Kapenekakis <lkml@antheas.dev>
> Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c       | 8 +++++---
>   drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c        | 6 ++++++
>   drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c | 3 +++
>   3 files changed, 14 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> index 3d032c4e2dce..220b12d59795 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> @@ -5243,9 +5243,11 @@ int amdgpu_device_suspend(struct drm_device *dev, bool notify_clients)
>   	if (amdgpu_sriov_vf(adev))
>   		amdgpu_virt_release_full_gpu(adev, false);
>   
> -	r = amdgpu_dpm_notify_rlc_state(adev, false);
> -	if (r)
> -		return r;
> +	if (!adev->in_s0ix) {
> +		r = amdgpu_dpm_notify_rlc_state(adev, false);
> +		if (r)
> +			return r;
> +	}

Just FYI this is going to clash with my unwind failed suspend series [1].

This is fine, just whichever "lands" first the other will need to rework 
a little bit and I wanted to mention it.

Link: 
https://lore.kernel.org/amd-gfx/20251023165243.317153-2-mario.limonciello@amd.com/ 
[1]

This does have me wondering though why amdgpu_dpm_notify_rlc_state() is 
even in amdgpu_device_suspend()?  This is only used on Van Gogh.
Should we be pushing this deeper into amdgpu_device_ip_suspend_phase2()?

Or should we maybe overhaul this to move the RLC notification into a 
.set_mp1_state callback instead so it's more similar to all the other ASICs?

>   
>   	return 0;
>   }
> diff --git a/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c b/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c
> index fb8086859857..244b8c364d45 100644
> --- a/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c
> +++ b/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c
> @@ -2040,6 +2040,12 @@ static int smu_disable_dpms(struct smu_context *smu)
>   	    smu->is_apu && (amdgpu_in_reset(adev) || adev->in_s0ix))
>   		return 0;
>   
> +	/* vangogh s0ix */
> +	if ((amdgpu_ip_version(adev, MP1_HWIP, 0) == IP_VERSION(11, 5, 0) ||
> +	     amdgpu_ip_version(adev, MP1_HWIP, 0) == IP_VERSION(11, 5, 2)) &&
> +	    adev->in_s0ix)
> +		return 0;
> +

How about for GPU reset, does PMFW handle this too?

>   	/*
>   	 * For gpu reset, runpm and hibernation through BACO,
>   	 * BACO feature has to be kept enabled.
> diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c b/drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c
> index 2c9869feba61..0708d0f0938b 100644
> --- a/drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c
> +++ b/drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c
> @@ -2217,6 +2217,9 @@ static int vangogh_post_smu_init(struct smu_context *smu)
>   	uint32_t total_cu = adev->gfx.config.max_cu_per_sh *
>   		adev->gfx.config.max_sh_per_se * adev->gfx.config.max_shader_engines;
>   
> +	if (adev->in_s0ix)
> +		return 0;
> +
>   	/* allow message will be sent after enable message on Vangogh*/
>   	if (smu_cmn_feature_is_enabled(smu, SMU_FEATURE_DPM_GFXCLK_BIT) &&
>   			(adev->pg_flags & AMD_PG_SUPPORT_GFX_PG)) {

