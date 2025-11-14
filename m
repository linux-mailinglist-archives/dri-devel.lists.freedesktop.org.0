Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CB3AC5F4D0
	for <lists+dri-devel@lfdr.de>; Fri, 14 Nov 2025 21:57:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 093BC10EB23;
	Fri, 14 Nov 2025 20:57:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="jXpUnrb+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazon11011069.outbound.protection.outlook.com [52.101.62.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A532310EB1A;
 Fri, 14 Nov 2025 20:57:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cmD88rdkhLpHQIJElVxJusl0yKgA8x0NVsEEZyXXp/lleu7kwr9TcfTYxk+B+QkA2Bpy/Wk8aKXOHRkuF9Owtx13M5YwLZpEkLD0/XDaRGnnBkG9Pc8HHR+dNNPLUyx6kj7hZavUoA5buFNWvYLABDDTEcYpn5QuIfUWA+K17ezTsX3PjhibtkldON+JeeOzBAp3H2RdZtBuz/LI/EFhgxS19+4X1/Al6Iih1+IRc5kllNcoYc3yqbLW0wa1rpxr0spkakp2cItWlTa7K3MxFMh7gHxOsmfsqfCOw31QK4tIPuMLIYy4Io7yTJpq8H9DBYn80hzUIlwAv63cZol4jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h+R3QuXLjpRSToWWILhQmB1M32Ok//EcnA+y5YSlB68=;
 b=jbk7kQ/Fihk+hqYdN5O2Fs9hUDuI8/jAxj4LCB/RQHwoYnzvu5wLshWDthNWCGPdcK4cYc6J/P0Kyorp481y0mtveEHy58mVXRF9Z3cAAugrsetrils4lSJ5E4cNBWejraCofKXZeVTOwZxGCb1R6N+Vn7daexabwzcLelV8l/Rs9niMM88mKMp4qVt4AnGvLWMEH+QNBLPvxZmfKtIJLreWArBW0Z+Ilr3FmuwAKGtNIUzNcrZ+ltJDRXI4Wuv3mFvt2Fy8eMhEeZAax7UKrAhn4UlmnRachIbkbZNMnsiBpMN3m0viAczqZtxrAspe5Cn3fg8GwVjqnr2pyKPfYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h+R3QuXLjpRSToWWILhQmB1M32Ok//EcnA+y5YSlB68=;
 b=jXpUnrb+TSA/0BKKHFmnTJ7CfVTbnz+mQdoGaLAVaFAw6fvxxl7IjXCJvzcx/KR8MhO84RW+NhtWoZeB8V866Fs3NDNn7rDAKGK1OsN4KBS/oRnA4Xhz6TicqnwHq/WTL7nbjzM/bs2i1PoenwvLhM5v+RTaAI2LCOX7uEi8TiI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by IA1PR12MB7613.namprd12.prod.outlook.com (2603:10b6:208:42a::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.18; Fri, 14 Nov
 2025 20:57:09 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::9269:317f:e85:cf81]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::9269:317f:e85:cf81%6]) with mapi id 15.20.9320.018; Fri, 14 Nov 2025
 20:57:09 +0000
Message-ID: <63e91c77-e68f-4e8f-8218-18e37bd4151f@amd.com>
Date: Fri, 14 Nov 2025 15:57:07 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 08/20] drm/amdgpu: allocate multiple move entities
To: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20251113160632.5889-1-pierre-eric.pelloux-prayer@amd.com>
 <20251113160632.5889-9-pierre-eric.pelloux-prayer@amd.com>
Content-Language: en-US
From: Felix Kuehling <felix.kuehling@amd.com>
Organization: AMD Inc.
In-Reply-To: <20251113160632.5889-9-pierre-eric.pelloux-prayer@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQ1P288CA0003.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:c01:9e::25) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5115:EE_|IA1PR12MB7613:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a224069-35ab-4d78-2482-08de23c06058
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?N0FqSmlRZTFoeHRMZmtreGpraGR4U1Jhb24ya2h6a0RNdnE0Tld6QnFlL21i?=
 =?utf-8?B?VGdQWS9OZjJRWTZPSDBIckVGS2ZNZ1lWMkdrNC9MeUtGUk9vWnlJR1FENDlV?=
 =?utf-8?B?OHdZOWQrVnJER0NuTG9wV1Z4QWN4YlAvM1ZYS0J1RUp2cWtsWk1Bb0tLUjl3?=
 =?utf-8?B?UEY1NDViQk1YamRLd3VKY2FsdThQSFBxaW1tdVQ5ck9hUVEvSVduMTZ2OVdZ?=
 =?utf-8?B?L083YjlITXBMN1RHSjBVc0V0ZUxqblpIam5DclJvdU9RRlVjeUdUTVduTWNZ?=
 =?utf-8?B?THd2RGtPbVNoN3BSa2N3RWFLQXlUajVOSlZWZW9YNUFmd0d1OE01a1hQcXVX?=
 =?utf-8?B?UnFKUGgyaDZiWm1tMFBQc0ZRb2J0NjBPWDlpZjk5N1RVbE8rdE9jYkwvTTVu?=
 =?utf-8?B?cjBESDdYUXdRT2NVN3FGWnhOUzJ0dlJZdHJuYWNFM0I0aHU1dW53SlI3VG42?=
 =?utf-8?B?U0JSa0UyeTJ0Q0UrazNHMmhHbE9TL2hrZWFvK043dGhlT2RwZnE3SzUyQTBU?=
 =?utf-8?B?NFhPazFIWmVuVU9hUzNJSFlyM3ZZWXJKdlNtMFRLeU1KSlBhNHBEVnJNK2ho?=
 =?utf-8?B?Y0pLb1ZtYitra1FXL3JDRTBJSmg1MGsraWVESDVLNFZMcWVBblluRkMweGJn?=
 =?utf-8?B?QUpuM3lPZXhBRWZzY0FxZ1JxNUFCTHpPUXVJcnF1eG1rbWQ3aWdUZ0ZqUkFT?=
 =?utf-8?B?bG9tNjJWbTQySjlBK1NqMmNac1FqMTlLTERyYnVjejJoRkw4czdBZThTajc1?=
 =?utf-8?B?K291NjBydithNWVLVENPQ3RsUHF6akEzcmNzeWVtRmZLQm13N3YwcVpYMWFi?=
 =?utf-8?B?Z3hueCsrV3NVUHgwRitSdmkxcXUyM1lrK1p4YkQ5dnFtbDQwRStRTXlEQzBW?=
 =?utf-8?B?WE9CTEI3UnZFWUxyMUJwRmpUTjFNU24wM3JWeXJOVGZJb084SmMxSEpwdjBs?=
 =?utf-8?B?VkJTam9NQTNncllZRWxuc1ZHMFQ5eHJVWXlFUnRxM0VKUnhpNXhGUnc5RFlM?=
 =?utf-8?B?dFlZZTRXTnZLQWpnWHlLSFFvZ2FsNEJFTG1pd1J1OGlLMHByYTJNTjE1Nnhr?=
 =?utf-8?B?TEo4dnhYanNGeDF1QnNGTXVlUUNWelNOTUdnc01IY1JhVmVMd09vejc4MzJt?=
 =?utf-8?B?Vk04R25yd2NCRnl3MkdZUzBjZmpPUmVmTzM4WTRya2hMdXJ6R2RSWXdqMTVy?=
 =?utf-8?B?Zmt6UFRYaTlKQ0hxRE1zVFpmUXZqVnBXOFZ6RStyeWpNVVFYWXlKbXoxVCs1?=
 =?utf-8?B?MUZobjVyMU41L0NiVHVXd01yUWxZSmxsY2RrMnlpQVJNMnN3eFZNOUNWdmQz?=
 =?utf-8?B?a1ZXSzZwS1FNM2lQaTFjbXVzTlNUTHhSTGlrVGlEZ3lERC9SekVxck5LeEt5?=
 =?utf-8?B?TlNQM2JzTVkySzFJTE5BajgxNWhxZnVQR2pJaitwM3hvM1RHeWM2WTluWlk0?=
 =?utf-8?B?Y2dZbjVIWlFWMHFEZ2pLeStTVWJOdzRqTUJzeUJKWkhVNVkrdnZwcnJ5bjYw?=
 =?utf-8?B?YmZxRkFtYW55NzJkbmNDMXBlTjFNSWJyelNyREhQNDh4UGx3UVdDY0Y5a1dz?=
 =?utf-8?B?Vkk2MEIranFQK0tXOWdjRzlzb01EKzY1TnBvN1dXU1RuWEkzSlFwK0dMelNB?=
 =?utf-8?B?K2s4M2EreXYvT0xZYnl6MWp0T1ZIUkIzZHBUQUVNSkVlcE5mbmdoS2c2NU1q?=
 =?utf-8?B?bGJoWTBJRHBRdy8ybGlReGRrRU5qVlBpMWZCaEdoSlYvd3NkU3JLS3c5RnJX?=
 =?utf-8?B?VXAwYk9PWEk5YzVLU2s0anU0WUtnbldvVjVrSUQzNFE4My8reGNDSWpoNGdT?=
 =?utf-8?B?Tm8xdmRpbTdDRVBuRlE1RkEzbDRRb0J6L3l0V0ZLaU9ldlBaYlczZGtRMUxL?=
 =?utf-8?B?N0lIL1NwNm41UVFHazI2WFAvRTYrMWl4SENIWmN4NkpkU1FkclZvV1REZjlz?=
 =?utf-8?Q?jAt8dHOAvJwas8gmZohu6LWYAq+VyJFt?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SVkxdCtJeU13ZmZhZ05wUTRhd3Z6WDZXSnBUd2NiM3lLaUswcmExUmM3MnBR?=
 =?utf-8?B?blRJTDZqMzJESzJsN2ZSakxGaVVUMC9mWVlqMlBuaXNTeDFCT0d0cVJ0cGZQ?=
 =?utf-8?B?RllQWUFSc2xZd0NMV2RiNkpDTzRLMlNWMWtZYnFSZTQwaEJiOHdQd294ZUNy?=
 =?utf-8?B?YmI2Y05BTGpkK1JYSHdOL0Z5OXY1NGZIbTBHVlF6YXVzTzlSck1SbXV0T0c2?=
 =?utf-8?B?UmZZaWhnT1IxRkZEMGZzU2QyK1YxMTZZbmFDSWRrV09TNmpUWXFHTTlzTHFJ?=
 =?utf-8?B?YkdnWmxodHpYZlg4dmYyRXhjcWpEWldWMTBWL1Q3WkFZemZpVnl6UDAwRVFP?=
 =?utf-8?B?ZkVlYXl3Sy83emszdGExcWJhQWpLQmlrL042OVdkczVhNTAycVZTbTFYZGtl?=
 =?utf-8?B?VzN3UjZMVSt1Mk0xKy8zTlhkWUpnd1U5eFdqQ1B2VXV5N29Ua2d3YTE1ZTBq?=
 =?utf-8?B?VTVUNHVZUWtFa1R4MlZJcUk4VnM4UXBuRFpVbVlIS2tBQmJSWUFXRkZJeVFJ?=
 =?utf-8?B?aE41MGNrcEJpTWFETmUzNG9DN3FTZkxqUzB0dUEwZXFmdVhLUERtYmRjYkF6?=
 =?utf-8?B?UW9ZVkRmU2pUZ1dZTG5QVmk5SHU3WEQ2ZWxzZmhVd05saEY1VENHMGhXUk94?=
 =?utf-8?B?ZFZwcnBNSUlBZ1hPektNeDcySHk3TFhWTXdMK1ZreTNyQ2pvRXhmUVB5M3pT?=
 =?utf-8?B?WmVHNEczaElxTmpoV2FuNGx3TWZvZWNqRm0wRmUweEVYM2VoV1g3bFQ2WUVv?=
 =?utf-8?B?RzVvUjhiNnhRQ2dEdVRUY3ZyelprNE5ua091KzBKbXFWQ2xTZHl0T1EzeC9K?=
 =?utf-8?B?OGdJWGRtQ3lONVdMdTFiZUdKWC9EbC85akttMjdWckJrYjFTKy9Kc2o4YTJQ?=
 =?utf-8?B?aVVzVUlsM2FWOEI2RnNuYVlYeUprSXUyMk4yQlFaZXF3OWlLeGFUZFMxT3ky?=
 =?utf-8?B?ZE5iWVl2R1RYTWRteTBrckVmNmZHRzQ3YWVMTmd6YXE0RU1BamNDT1FsTytq?=
 =?utf-8?B?eEt1cmdRQTIwRzdZOHZGVFNiMUFOTTQ0bDBHd1Q1NmFyLy9tZGt0eVp1Mm4x?=
 =?utf-8?B?L2NBQVlCOXVuSUVCNDEzWFFpZmJpWlpqeWNGS3gxeDE0cVNrS2hYU2lDUXFK?=
 =?utf-8?B?SWZmWit4ZUJNK1FwU01nZHM1ZEdLUDRwbWNoeVJVYmhuMDhxZW9pbHl0dUw4?=
 =?utf-8?B?UWM4di9ZS3N3RVo4Q0RsZ0JjZUVaSTFJQ0xvSW82QjZTVlU0YUVmdEpUeEJV?=
 =?utf-8?B?bTlmVEpqT2k1SDdSb3liZU5US0xzeE96VmZ4dlFkSjFaRW1SQnRlTzFzNVJs?=
 =?utf-8?B?Z1A1VXljaVhyN2JoTWJNQjhiWlhPY21TSk4yUktybDNGZUdoSUVBRDVqOFg1?=
 =?utf-8?B?TjZ2QkpoOENROFp6bXVKaEl5VzNkNkVkalM2bGJWVjR4YXNtUTZkUHNDUjZO?=
 =?utf-8?B?RjZnb0YzWUthQk1LR2pGQ2d1bHBxRVcyd2tYWXRlY1JNTUVUVWtITGUxalor?=
 =?utf-8?B?VGoveU9GZ1pFSlIrN01ZZzUxYi80dWZlVFN6YndtMjZJK2JlYi9PN2RUMjZI?=
 =?utf-8?B?ZlBUUmVkdWNpNmQ1SHZtTVZ1ejA4UGFsZVRFV1Z3MEJaY2lZSjJBaGZSM1lM?=
 =?utf-8?B?dTdzVzFoLzJILzcrM1c5UU03b0NxdHMrL0J0c1Z1SVRyK0llVWdhTmdwL1pP?=
 =?utf-8?B?cGlHRmo5aWEvVFhjaDRaZXNPMDdxSTFJcmdFZnRub0RIRmhxelB4ZjY4RUhC?=
 =?utf-8?B?MGlTU2Y3QnBtUXJESVA5Yy9FWSt0aVJsZjlZTENicGZJVXBHNzBENlhjby9S?=
 =?utf-8?B?cG1zS1A0OWxENlZjSDBBbHBYN3BzU3pjYmF2MlVqVVp4d01PZ2poSUowWDhm?=
 =?utf-8?B?NUprbEYyNVkvUlJ4WFVnc3dkOVVJYmNtcXNmSXdUeXlJNFFYUFpaUUJ6TjBX?=
 =?utf-8?B?YTArTVdDcjNaOWRNYkJDS3BhNzgxOGhzWk85VkwzUEt3QXhSSDAzZ1NqWGRP?=
 =?utf-8?B?dmFaNklyN2xmZWFTTGhnNlAvdmVIaGFKVXJZSjJ0ZmI2elNDL2REMHMyc2lV?=
 =?utf-8?B?VDFNc1prUThpZHFHZWFkT0FWOERKK3Q3T0gxdTJKNm1FM3B6NUYyYm1xWVFl?=
 =?utf-8?Q?Gu2vemY9sUS/9faphrBnJMsi8?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a224069-35ab-4d78-2482-08de23c06058
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2025 20:57:09.1888 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mYQ7s51zZMiZmJTbD7A8RYaLGi3EQmaVIgxhC71ddDxvPstzhIbNRXhnM2wXvjcOF4Mh5zAyYQwTqgpH3759Kg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7613
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

On 2025-11-13 11:05, Pierre-Eric Pelloux-Prayer wrote:
> No functional change for now, as we always use entity 0.
>
> Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>

Acked-by: Felix Kuehling <felix.kuehling@amd.com>


> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c  |  9 +++--
>   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c  | 48 +++++++++++++++---------
>   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h  |  3 +-
>   drivers/gpu/drm/amd/amdkfd/kfd_migrate.c |  2 +-
>   4 files changed, 39 insertions(+), 23 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c
> index e73dcfed5338..2713dd51ab9a 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c
> @@ -686,9 +686,10 @@ void amdgpu_gmc_flush_gpu_tlb(struct amdgpu_device *adev, uint32_t vmid,
>   	 * translation. Avoid this by doing the invalidation from the SDMA
>   	 * itself at least for GART.
>   	 */
> -	mutex_lock(&adev->mman.move_entity.gart_window_lock);
>   	for (i = 0; i < adev->mman.num_clear_entities; i++)
>   		mutex_lock(&adev->mman.clear_entities[i].gart_window_lock);
> +	for (i = 0; i < adev->mman.num_move_entities; i++)
> +		mutex_lock(&adev->mman.move_entities[i].gart_window_lock);
>   	r = amdgpu_job_alloc_with_ib(ring->adev, &adev->mman.default_entity.base,
>   				     AMDGPU_FENCE_OWNER_UNDEFINED,
>   				     16 * 4, AMDGPU_IB_POOL_IMMEDIATE,
> @@ -701,7 +702,8 @@ void amdgpu_gmc_flush_gpu_tlb(struct amdgpu_device *adev, uint32_t vmid,
>   	job->ibs->ptr[job->ibs->length_dw++] = ring->funcs->nop;
>   	amdgpu_ring_pad_ib(ring, &job->ibs[0]);
>   	fence = amdgpu_job_submit(job);
> -	mutex_unlock(&adev->mman.move_entity.gart_window_lock);
> +	for (i = 0; i < adev->mman.num_move_entities; i++)
> +		mutex_unlock(&adev->mman.move_entities[i].gart_window_lock);
>   	for (i = 0; i < adev->mman.num_clear_entities; i++)
>   		mutex_unlock(&adev->mman.clear_entities[i].gart_window_lock);
>   
> @@ -711,7 +713,8 @@ void amdgpu_gmc_flush_gpu_tlb(struct amdgpu_device *adev, uint32_t vmid,
>   	return;
>   
>   error_alloc:
> -	mutex_unlock(&adev->mman.move_entity.gart_window_lock);
> +	for (i = 0; i < adev->mman.num_move_entities; i++)
> +		mutex_unlock(&adev->mman.move_entities[i].gart_window_lock);
>   	for (i = 0; i < adev->mman.num_clear_entities; i++)
>   		mutex_unlock(&adev->mman.clear_entities[i].gart_window_lock);
>   	dev_err(adev->dev, "Error flushing GPU TLB using the SDMA (%d)!\n", r);
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> index 2f305ad32080..e1f0567fd2d5 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> @@ -401,7 +401,7 @@ static int amdgpu_move_blit(struct ttm_buffer_object *bo,
>   	dst.offset = 0;
>   
>   	r = amdgpu_ttm_copy_mem_to_mem(adev,
> -				       &adev->mman.move_entity,
> +				       &adev->mman.move_entities[0],
>   				       &src, &dst,
>   				       new_mem->size,
>   				       amdgpu_bo_encrypted(abo),
> @@ -414,7 +414,7 @@ static int amdgpu_move_blit(struct ttm_buffer_object *bo,
>   	    (abo->flags & AMDGPU_GEM_CREATE_VRAM_WIPE_ON_RELEASE)) {
>   		struct dma_fence *wipe_fence = NULL;
>   
> -		r = amdgpu_fill_buffer(&adev->mman.move_entity,
> +		r = amdgpu_fill_buffer(&adev->mman.move_entities[0],
>   				       abo, 0, NULL, &wipe_fence,
>   				       AMDGPU_KERNEL_JOB_ID_MOVE_BLIT);
>   		if (r) {
> @@ -2167,10 +2167,11 @@ u32 amdgpu_ttm_set_buffer_funcs_status(struct amdgpu_device *adev, bool enable)
>   	struct ttm_resource_manager *man = ttm_manager_type(&adev->mman.bdev, TTM_PL_VRAM);
>   	uint64_t size;
>   	int r, i, j;
> -	u32 num_clear_entities, windows, w;
> +	u32 num_clear_entities, num_move_entities, windows, w;
>   
>   	num_clear_entities = adev->sdma.num_instances;
> -	windows = adev->gmc.is_app_apu ? 0 : (2 + num_clear_entities);
> +	num_move_entities = MIN(adev->sdma.num_instances, TTM_NUM_MOVE_FENCES);
> +	windows = adev->gmc.is_app_apu ? 0 : (2 * num_move_entities + num_clear_entities);
>   
>   	if (!adev->mman.initialized || amdgpu_in_reset(adev) ||
>   	    adev->mman.buffer_funcs_enabled == enable || adev->gmc.is_app_apu)
> @@ -2186,20 +2187,25 @@ u32 amdgpu_ttm_set_buffer_funcs_status(struct amdgpu_device *adev, bool enable)
>   					  DRM_SCHED_PRIORITY_KERNEL, &sched,
>   					  1, NULL);
>   		if (r) {
> -			dev_err(adev->dev,
> -				"Failed setting up TTM BO eviction entity (%d)\n",
> +			dev_err(adev->dev, "Failed setting up entity (%d)\n",
>   				r);
>   			return 0;
>   		}
>   
> -		r = drm_sched_entity_init(&adev->mman.move_entity.base,
> -					  DRM_SCHED_PRIORITY_NORMAL, &sched,
> -					  1, NULL);
> -		if (r) {
> -			dev_err(adev->dev,
> -				"Failed setting up TTM BO move entity (%d)\n",
> -				r);
> -			goto error_free_entity;
> +		adev->mman.num_move_entities = num_move_entities;
> +		for (i = 0; i < num_move_entities; i++) {
> +			r = drm_sched_entity_init(&adev->mman.move_entities[i].base,
> +						  DRM_SCHED_PRIORITY_NORMAL, &sched,
> +						  1, NULL);
> +			if (r) {
> +				dev_err(adev->dev,
> +					"Failed setting up TTM BO move entities (%d)\n",
> +					r);
> +				for (j = 0; j < i; j++)
> +					drm_sched_entity_destroy(
> +						&adev->mman.move_entities[j].base);
> +				goto error_free_entity;
> +			}
>   		}
>   
>   		adev->mman.num_clear_entities = num_clear_entities;
> @@ -2214,6 +2220,9 @@ u32 amdgpu_ttm_set_buffer_funcs_status(struct amdgpu_device *adev, bool enable)
>   						  DRM_SCHED_PRIORITY_NORMAL, &sched,
>   						  1, NULL);
>   			if (r) {
> +				for (j = 0; j < num_move_entities; j++)
> +					drm_sched_entity_destroy(
> +						&adev->mman.move_entities[j].base);
>   				for (j = 0; j < i; j++)
>   					drm_sched_entity_destroy(
>   						&adev->mman.clear_entities[j].base);
> @@ -2225,9 +2234,11 @@ u32 amdgpu_ttm_set_buffer_funcs_status(struct amdgpu_device *adev, bool enable)
>   		/* Statically assign GART windows to each entity. */
>   		w = 0;
>   		mutex_init(&adev->mman.default_entity.gart_window_lock);
> -		adev->mman.move_entity.gart_window_id0 = w++;
> -		adev->mman.move_entity.gart_window_id1 = w++;
> -		mutex_init(&adev->mman.move_entity.gart_window_lock);
> +		for (i = 0; i < num_move_entities; i++) {
> +			adev->mman.move_entities[i].gart_window_id0 = w++;
> +			adev->mman.move_entities[i].gart_window_id1 = w++;
> +			mutex_init(&adev->mman.move_entities[i].gart_window_lock);
> +		}
>   		for (i = 0; i < num_clear_entities; i++) {
>   			/* Clearing entities don't use id0 */
>   			adev->mman.clear_entities[i].gart_window_id1 = w++;
> @@ -2236,7 +2247,8 @@ u32 amdgpu_ttm_set_buffer_funcs_status(struct amdgpu_device *adev, bool enable)
>   		WARN_ON(w != windows);
>   	} else {
>   		drm_sched_entity_destroy(&adev->mman.default_entity.base);
> -		drm_sched_entity_destroy(&adev->mman.move_entity.base);
> +		for (i = 0; i < num_move_entities; i++)
> +			drm_sched_entity_destroy(&adev->mman.move_entities[i].base);
>   		for (i = 0; i < num_clear_entities; i++)
>   			drm_sched_entity_destroy(&adev->mman.clear_entities[i].base);
>   		for (i = 0; i < TTM_NUM_MOVE_FENCES; i++) {
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
> index 797f851a4578..9d4891e86675 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
> @@ -72,9 +72,10 @@ struct amdgpu_mman {
>   	struct mutex				gtt_window_lock;
>   
>   	struct amdgpu_ttm_buffer_entity default_entity; /* has no gart windows */
> -	struct amdgpu_ttm_buffer_entity move_entity;
>   	struct amdgpu_ttm_buffer_entity *clear_entities;
>   	u32 num_clear_entities;
> +	struct amdgpu_ttm_buffer_entity move_entities[TTM_NUM_MOVE_FENCES];
> +	u32 num_move_entities;
>   
>   	struct amdgpu_vram_mgr vram_mgr;
>   	struct amdgpu_gtt_mgr gtt_mgr;
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
> index bc47fc362a17..943c3438c7ee 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
> @@ -136,7 +136,7 @@ svm_migrate_copy_memory_gart(struct amdgpu_device *adev, dma_addr_t *sys,
>   	u64 size;
>   	int r;
>   
> -	entity = &adev->mman.move_entity;
> +	entity = &adev->mman.move_entities[0];
>   
>   	mutex_lock(&entity->gart_window_lock);
>   
