Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA75CAD94CE
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jun 2025 20:51:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 055C410EA41;
	Fri, 13 Jun 2025 18:51:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="iIbrLTkI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2064.outbound.protection.outlook.com [40.107.93.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A51A610EA3C;
 Fri, 13 Jun 2025 18:51:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FmwvPulBz8G52xYAx0wFkS2nCL2Osl5caHryB103TWWZBo6Jam8Xzx633wgLBGiZvLy3RclVBkF95vIiYjjnPmw1IPFx6xUVeRJ+tWDz90INHmnWjBfneTQaJVa2kc17IZc3kfO8sWCMCRvjx1rYmRBgAEVVmXzlzdhmzWa3Gp2MxsB+gt6x49dM6lE0aKwln8HvHeV2Pqc7CdzVTc6G2yJ7N+O/u3ac02IfCA/6yP+QOeRDsbag4y1DjEUHpNSkgvOnA+EZ/sVgsoBmv939ldu9D/5rz+jCrEN+4fy8sS5h71nZDDXHn2dTXmwNuTdnsV1nSlUMFkEEa89Xxd9q4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uIfe8oY22QsdrEWjjFxwafEM/6FDMgdC3W0XgNSM/24=;
 b=QU8VpZQSTn6mrb0Za9aAvWs9ybkX6c6XXwKZ00wPJcCieqLZSmeENGDhfy4/3WisEo480dANGkM/aIquCL7C5rMmCg28i3Pp5/9PnXnbQ3ZU/7qVHkfgZp2cIR6Fkyf3b+6Tn45nnY2s0Luf2M8CcahnH4kJ29DWHpXofn66g63J2WsT7h//bWIho7gTlgjjB2BdnYg5LUTqBk+Jz36sx2dLIlXf1jg4oaHOwenHwU5rtJBmLosY8ZAhZExYX3my8EbljtHGBA9HIS6ASmOCbvqdMaOmg5Brva1Ta2o5U5Zx/nniwlWDG/8BZYKtRyy2Eh3COYU3I6PxneXGBWZrZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uIfe8oY22QsdrEWjjFxwafEM/6FDMgdC3W0XgNSM/24=;
 b=iIbrLTkI4IIO4xje5uGOKC0Kur8gnreXVp9cFgnQONBwuPM846PMVtC0EXi84prXDgjDTaICZp2wh11uaHu8RaIfYEoUEgQ4B0VM2HULL2M96bIhg10J4gRxVhC5nXOK5ip2ZUVyyL01Ji3rNaCMQ0j2GgIKTY1SW7IRzmSuBZ8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by MW4PR12MB6873.namprd12.prod.outlook.com (2603:10b6:303:20c::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.41; Fri, 13 Jun
 2025 18:51:47 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%7]) with mapi id 15.20.8835.018; Fri, 13 Jun 2025
 18:51:46 +0000
Message-ID: <0c430e08-0b81-4bc8-9940-41876eb77fa3@amd.com>
Date: Fri, 13 Jun 2025 13:51:43 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 05/14] drm/amd/display: get panel id with drm_edid
 helper
To: Melissa Wen <mwen@igalia.com>, Alex Hung <alex.hung@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>, harry.wentland@amd.com,
 sunpeng.li@amd.com, alexander.deucher@amd.com, christian.koenig@amd.com,
 airlied@gmail.com, simona@ffwll.ch
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Michel Daenzer <michel.daenzer@mailbox.org>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, kernel-dev@igalia.com
References: <20250613150015.245917-1-mwen@igalia.com>
 <20250613150015.245917-6-mwen@igalia.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20250613150015.245917-6-mwen@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA9PR10CA0024.namprd10.prod.outlook.com
 (2603:10b6:806:a7::29) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|MW4PR12MB6873:EE_
X-MS-Office365-Filtering-Correlation-Id: a98a83ee-a788-4b68-dc01-08ddaaab5919
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZDkrZFNnYUkxVXpEdC8xNW9VL092MmtaN3BDZmorTW9LSW00K1IxaFgveE81?=
 =?utf-8?B?R1hvbG9sV0xlT1UxOE1BNDZTRGNaVXAzR2swblJwdXpuOFF6OUVQcHFRVmxS?=
 =?utf-8?B?ejJvZXlnQzY1aGtqN3VFK2Y2VndGcXJ6VHArZU1jMHk5WGM1eHJ6NU1ndnI4?=
 =?utf-8?B?UU41V24xbUNadDd1N1BWdjRYUnFHWmlLcXhqMnFVWE5LcmRVREpDRVkxQlJS?=
 =?utf-8?B?UkFWTHphcExWdDZPek5wZlBZMkZlUWNvT0VvdmZsSDFFdlZsWlp2OXI5Qzlu?=
 =?utf-8?B?SVIrU1BlUkM0MFFRVjU0V3k4T004dlVZL3BZZ3A4OVRaRm9RL3BaTDFaU3Jt?=
 =?utf-8?B?QjJQTVhaRncvOGhjRnUwaUtlcGxjVndKN01pK2JHSmFBNnZVSVhRVzVibXQz?=
 =?utf-8?B?Ym1ESkR4TVA4cUhLWTZ4L2JoU0xzaUpUdVFrSVU5Mm00aisza3R4Q1dqbTFp?=
 =?utf-8?B?MXcxQ0JEcWhVelo0NHY2VStQZyt6UXU5Rm1ZK2lpMW81YVlnVWliaFBMNWdN?=
 =?utf-8?B?U2NZOXA5MXErOTVXQnZGNzNUZEJMM0JLOE9vNE5xUkk2NGtpSUZIRjBnMkVC?=
 =?utf-8?B?MjdtTWkrMk5aalpDb1NMNnBIVmJxR3FyUWNLbkp0cGFrc1ZST1pBWDhDcy9O?=
 =?utf-8?B?anhYdHd2ZzJPcFR3QTVSYVprSlBaU0g4aFhtVGFEcXhoTDh3enBZN1l5T1J4?=
 =?utf-8?B?NS9GSm10dnV3TEV0NmNCN3BuZlFCL1V3bWJJT2VSa0RvaWxBeE9uSklhRXZH?=
 =?utf-8?B?UFFNUmZCak1PMTBsbWJZek05RnZVL1c2WldlTnUrYlhhaFkvS296R2I2OTI1?=
 =?utf-8?B?SjlJZjluSGtWemVobzFYUTVlSTBuZFh5amZHZVFCYW5LZ0hZT3NYcW1BMFJ3?=
 =?utf-8?B?V0JjcnBzcWsvVG92ZmlqYlZOR0pxUWREcUFndnZ6amtRYzg0RGhIMThiZkdB?=
 =?utf-8?B?Mkp1VkxudURuaS9QYmhFUUV3RzVDZ3ZPNnJSZE8wZWxtSUJCSEZpR1BGNmtn?=
 =?utf-8?B?aFV2eDZsNHZZckxaU1lzYUJkUkwwMU1yTGMxRTF4Ym04a2JpclVGbW52K0Ro?=
 =?utf-8?B?N3h6NzhjZjB2cC9na1pmNzJHZnpKaE95cVJnRFJqdUd0bFExZnlvTHNRVnFj?=
 =?utf-8?B?R1FNUTNiMDVtSzRnLzVjbExEU0lDeUNMQXRLdmJtVHJzS2ZoczBzcnczWjFM?=
 =?utf-8?B?WGFSMXpQak5OaVdXZjZYZWhTbzFzbGdqNThmRDJzTUJNbGR1KzNtbDV5d2Nz?=
 =?utf-8?B?eFNBakRjUHN6TWxJTmI1VU0zVzZKZjlNaHRZYkIzaThHaUpnVGl6bisrV2Zm?=
 =?utf-8?B?TWswaUlISlFTODgrdmJZTk9ZT3R3ZDFLVG9DaTZLd2JjdXlLZmVDVVArczVX?=
 =?utf-8?B?clZKTnJjMUtlaG16R1VqUFJuaVlqa2t3RXgxM0hDRjZmRDB4NnUzT2ZrUmxK?=
 =?utf-8?B?Sm5ZZmRzWHArWEFhREE0bGFkcGtGMWcvSm1paFBLQXhHYVF5eDNLbTVMaFNp?=
 =?utf-8?B?R1Z0QU8xZXZ6ZGVmNC92cW05M2JDYWk2cWVmdUZBQ2dGSzRJT21sQ2RiZGY0?=
 =?utf-8?B?Sk9TTmZmSU1DZUQ2KzE0a2VyZzVEUUdCOUVrdEM5Q0doSFh5R3lTVzNaMGxQ?=
 =?utf-8?B?QzRSRzU5UWpzWXZxUktpNVduTWNaMWNRcXp0dUkvZG1pdGxjQmRBY1ovS0lE?=
 =?utf-8?B?TEFrbERFMVRaSlpUbk9JanRnRWtha3l6SjNwczZpMDhiK25nbmxxME0vVjBn?=
 =?utf-8?B?NTNURWxQL2NQOHkzSUZlTmpGZzI3aUNNRC9MaW5HRXhTaUl0TUhWcmtOUnhk?=
 =?utf-8?B?UWxmbTJMSmVXOVRIY3hBRzlDTlVUOVVMaUVocytTQmdRZkh6TURDZlpWeXdm?=
 =?utf-8?B?Q3hLMVdjODM1S0ZuQWhUWUkrQUVKRnlwbjNBS1V6cGhEMXhubzBLc21Lc05s?=
 =?utf-8?Q?RLrf07i4fmE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UEh6dmR2d2ZCeUlxOUNjUXZFbFhZVEQ2OUZhR2dnNzlLSXljOGRkK0ZZR1FE?=
 =?utf-8?B?NFBETk1VL1hrdE9vUjdJYzRQTGcrSW5PU1JhY1hLQ09RaTBpb0dFR09YdVEw?=
 =?utf-8?B?Uk92WGsvdmx0SlZGNFpuYzY1UEJMS3czRlpHdTBFTFdRN3EwOEQrMHFHM1Bk?=
 =?utf-8?B?OTVTMXpxMmRqeG9qOGtPRmNNRm4wLzVpMEJyRXdudEVDTVNGTmZSS2RrdWNJ?=
 =?utf-8?B?L1Z2UEJKdEFGTGJTSkdNRDczMlBucEo1VXN0YWVCV3hXNDd2ZlhIeEFRUnVn?=
 =?utf-8?B?K0ZnajF2N3F1MHN6Q3NiUVpPeGJjcTdwdHJMaStib2c1SjExYkJHc012ZU5V?=
 =?utf-8?B?N0U3eVVYS0dJbVpmVkJHVzVIVW5hNXZkMUkxcTRidE9rbXgyNk9hRjdPbHdv?=
 =?utf-8?B?eGN0WXUyS1Z6WEdCdmNOMXhtZll6Vk5abFB2QVltRkF4TkhUeXAwdUsyeXFk?=
 =?utf-8?B?VE0xMmVEbjZPTExJQzVURGw5WTIvTFVYMFErTTZzcyt4VVBDRUs5T09iQUhO?=
 =?utf-8?B?cWlsdXgvSllMalA2V0xHSm43UzRUVy9zMVRHcy9uVGZNenpDdEsvQUNuZUo3?=
 =?utf-8?B?eUpCeElMYjZUOWJtL2p6ck04NEtlR0Q1SmRTYWwwN0QrVXBPMkE5OG5QeWpE?=
 =?utf-8?B?Ynp1L1FXL1QyVEJzSVZFSUQ3eHFKY3pXRHR4N3YrQUNTU3hlZUxDV1d4TGZH?=
 =?utf-8?B?ZEFsSGhGaEE0dGRRb0NCVThtRm9na3oyc1ZRRWg1emVuUGRuOFJiUmc1d1Iz?=
 =?utf-8?B?cDlDdFc0ejVuM3gyU2EzcUYybUgwRFBLeG8xb1B1MTJvN3ZuY1NEc0lTd2V5?=
 =?utf-8?B?djlLQVY4ZW9lTXliUzcvdVJPeEo1Y3Jlc3N0VlF1WHFnaG5VdW5PdXhKdGd5?=
 =?utf-8?B?NHdReWZWQWFVdFhqSlZPcStHM2dVQmFlS0UrTTFsMFNZU3NNS0NkVEpsTUdV?=
 =?utf-8?B?eVZiamFiQU4rWXg4YWNuL3pmaHZ6d04vUDBnSnpnU2cveCtOTUYzL0NSbU5K?=
 =?utf-8?B?SkU5SlZNdVBxTllqQWJXKzl2QnU2MzIvUUFnQVlaZlA3dVNGak0vYjZnWnNx?=
 =?utf-8?B?bTNlMWgwMGNjekpYbU56OWRoMDErV2p1ZitGRnM2MlpBRUE0NTJXc3grQmlR?=
 =?utf-8?B?U0hIWmFwbFp1aENra2JwbG1YRWR2emJqaUpnekRFNGdHdEliTHJxUHNrSGxD?=
 =?utf-8?B?WDRIWU5wMDgyQjBoTnM5d0VoWDQ2YjBHUFhOMzVsYTQwNzREbkVtWkVvNkx4?=
 =?utf-8?B?Unh1b3RLcGZza1pwTVlKVVV4RGhmaFgzZFdQVEdtdE5EOUJLUDhrSkx4bUtT?=
 =?utf-8?B?WHR2anZlNEZZTnkyTCtzdUZ4ZGJsaG51ZFVoMjVVUUFrUStWRXBZUmQzTVM5?=
 =?utf-8?B?NER4Q3ZWbzV0SlBsY2hMR0Z4bjRlTTZXSWpjQ0owS29pWk1SNEo0NGlpRkp6?=
 =?utf-8?B?WkhuVUg4Tml3MUNjQVNiNmRxM1l5Z1M1ekZXdGFrM0h5QzZnT3lRY2M1QnNG?=
 =?utf-8?B?R0lFUVVMdHMwODhsMldJTjN0NERmOTdyMmVhbXgzdFJ4dktuRmRhbHVXU1JT?=
 =?utf-8?B?QWZoNnBSazd4UFZmZm0zUHZoTU54R21FSHh1TGM3enhVVDQ3WjRuOFIwaDY0?=
 =?utf-8?B?d0VOcGtxN3gyQ1pKTXZQMENBekx6SkhSRkxFSGt4YzFLNWNkbXBHd1E3TzNU?=
 =?utf-8?B?cW9ueHMvQVU1Q0ZFMVVDTkxEM1hqcFM0elRNKzVDWUozWEMwZUkxSzRIWlN2?=
 =?utf-8?B?cnA2eFMzMVRLSm96dmxlL3ZRdUl5R0VEZkorL1NOazZReDhXUXo1d1NoYWxE?=
 =?utf-8?B?ZUFTQjFkMElxYWlrb1VNRGZDN1NsTjRjQ1k5c05oRUx0UUpJZ3pCcnZPY0Ey?=
 =?utf-8?B?cFd4aThIQXh1WEJDcktuWW5OQjkrd3BIRVFBR0RkeThraHJVampYQ05qdzF0?=
 =?utf-8?B?aDVYNjFHZGZpUjVxSDcvckJPTmo0N1grQngzcm5UVHptd2Q1UkNjMkY4SWw4?=
 =?utf-8?B?dDNoSUJycVR6NGlCNnVNRmpuU3B2Y3JpL0Mxd1I0VE9yUCtYdHJobWNaYTND?=
 =?utf-8?B?U0ViZ2tSQ29VZmU2dEI4b3lUR3ZvSlJ0eFlKTUJnUDVmUkltMFhkNDdhSXlD?=
 =?utf-8?Q?rhPvo4MkDQ6idWPXJAk6RkNUx?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a98a83ee-a788-4b68-dc01-08ddaaab5919
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2025 18:51:46.8903 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XtP9Yo2d3tH4dSq7rlLCJE9O5S7J5hQ87fBxvvROngUPvWIi9HjXOqOGpTivZx0lgpRiPLplVKScs8pGFlACVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6873
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

On 6/13/2025 9:58 AM, Melissa Wen wrote:
> Instead of using driver-specific code, use DRM helpers.
> 
> Signed-off-by: Melissa Wen <mwen@igalia.com>
Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
> ---
>   .../drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c | 15 +++++----------
>   1 file changed, 5 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> index 514da4d5d300..760da13612b9 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> @@ -48,16 +48,11 @@
>   #include "ddc_service_types.h"
>   #include "clk_mgr.h"
>   
> -static u32 edid_extract_panel_id(struct edid *edid)
> +static void apply_edid_quirks(struct drm_device *dev,
> +			      const struct drm_edid *drm_edid,
> +			      struct dc_edid_caps *edid_caps)
>   {
> -	return (u32)edid->mfg_id[0] << 24   |
> -	       (u32)edid->mfg_id[1] << 16   |
> -	       (u32)EDID_PRODUCT_ID(edid);
> -}
> -
> -static void apply_edid_quirks(struct drm_device *dev, struct edid *edid, struct dc_edid_caps *edid_caps)
> -{
> -	uint32_t panel_id = edid_extract_panel_id(edid);
> +	uint32_t panel_id = drm_edid_get_panel_id(drm_edid);
>   
>   	switch (panel_id) {
>   	/* Workaround for monitors that need a delay after detecting the link */
> @@ -140,7 +135,7 @@ enum dc_edid_status dm_helpers_parse_edid_caps(
>   
>   	edid_caps->edid_hdmi = connector->display_info.is_hdmi;
>   
> -	apply_edid_quirks(dev, edid_buf, edid_caps);
> +	apply_edid_quirks(dev, drm_edid, edid_caps);
>   
>   	sad_count = drm_edid_to_sad((struct edid *) edid->raw_edid, &sads);
>   	if (sad_count <= 0) {

