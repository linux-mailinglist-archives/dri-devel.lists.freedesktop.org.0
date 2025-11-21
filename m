Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BDD63C7A93D
	for <lists+dri-devel@lfdr.de>; Fri, 21 Nov 2025 16:36:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2808310E2BE;
	Fri, 21 Nov 2025 15:36:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="vXjSW82J";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazon11011061.outbound.protection.outlook.com
 [40.93.194.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 382B510E2BE;
 Fri, 21 Nov 2025 15:36:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=clDrSJNnJm0xDi5chrFZGjbGJfcLGQHIfUD9S9aWDJuNxfaRpTfxsTE1ngqNKScTbE74me2lICbkHg+v8fGJBcEf7+s3Qb+fBn7Yda6QaBjsZ1nr1AxhoXrII6iExMGEn9OwgA6CRAWqoMxV2XfDRlZS9aoi73WILRhTgCgfeKxM+X9vX6aGEN/EVJrfQj0NxqJ+34L04bbTOXCdNGtiIWLjI5ksg+0ce8NBGydNOXbCLtmZ5A2cs8r3s80sakfq+Q6+H5HUshVWapIPF1dw0tRwVdpIBnlIAtsAf9e76GNWgdHBqmPe7C98v8S4u6lP3lqKXTaY2mulWPP5Co7RWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2pe6YxOApkpg8hr7hP5+5jnHkx/+UhQM0QVbKq1+/lI=;
 b=unkqUe5zXfRQACMEYufZcc5DUD406iGgn+NDQqVV9T04B6xU5Thl/UVLdXjJRmkJkelQEXhvzEFLQGpQZo48o4onJMrKhZPx0gDyn3+kS1NyN4lsw0iBq1IzvIp+fB48h6FH2YvunIb8jWvz1hmkcfWadJrYur+jutj0mGtvQpymMM+3mZOwWDbkaLWI6QJOpkUmtHejHpsYEvY/3zBJRbaJT5/IGQidewmZAkB5AzTjqZW0+ix9Jnyv/PuRKJvDdFE3OqvmFntfE/G5kc0hjKTGL3tyhY9nDsRbwR1CtOLsbGi0sDdDpPonYrgwMgloyDVrXXEpp+L/63rjzMfMhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2pe6YxOApkpg8hr7hP5+5jnHkx/+UhQM0QVbKq1+/lI=;
 b=vXjSW82Jq8l+wgf3R0YMzLK8r6+2SOX7ShR6jEagmQyVM5pPQvLNMa01oxAyRlfYwfltSrWgrQmIT6eqzt7cNDqoJ6KlN9ngC5PN7C637JyaGQ622OQXXyx8xSzZOpeDGd9Zu5a0SoBQSsyaMUtAQU9em7KA23/UyYAFOFhgK9E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SA3PR12MB8804.namprd12.prod.outlook.com (2603:10b6:806:31f::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.12; Fri, 21 Nov
 2025 15:36:25 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9320.021; Fri, 21 Nov 2025
 15:36:25 +0000
Message-ID: <5a1c093f-38bd-4297-9a8b-2d6124ce8fd0@amd.com>
Date: Fri, 21 Nov 2025 16:36:15 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 22/28] drm/amdgpu: round robin through clear_entities
 in amdgpu_fill_buffer
To: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20251121101315.3585-1-pierre-eric.pelloux-prayer@amd.com>
 <20251121101315.3585-23-pierre-eric.pelloux-prayer@amd.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20251121101315.3585-23-pierre-eric.pelloux-prayer@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2PR02CA0059.apcprd02.prod.outlook.com
 (2603:1096:4:54::23) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SA3PR12MB8804:EE_
X-MS-Office365-Filtering-Correlation-Id: c1fb108b-9724-46de-6093-08de2913bace
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OHkxdGJGNGNBZVA1c0J0STg4dEdzRWpzRG14d0FBdGtUOFdzWUlrbTZ0b3By?=
 =?utf-8?B?NDFJbm5Ia0tCeGFHaHRpVjVDaEdsTzNINkpYQ3hzaUgzNDl1TXgzQnZ5em1U?=
 =?utf-8?B?YjZLTmpvVlFHVExQSXhqdU45T2M2QWYxb3V5ZEJ0SVlkOTU3U2lVYi9pS2U0?=
 =?utf-8?B?WHFEZ1FHSTNIcU1KUjNURHRlcUpubERENDlIYnpyVTZQa2liUFBOTmhXa0xW?=
 =?utf-8?B?bzVnMFk3aTFXRW1yNHEzanVVcko2YnFIWVBoRFRqNW9CWkhteHZDTFNRazM3?=
 =?utf-8?B?cEdmOVRNUFlzVCtKNi90NGt2TEZ3bHoweUJWZHplaFdnaGhPMUtrRjBwaVEr?=
 =?utf-8?B?dENWVlhOYUlKYlloczQ2UXd5YVFPbFNYRGxsQndraXV3dTZzVE9rZS9TaFlM?=
 =?utf-8?B?SGFTVWhHem5INlB0YXdzZHZVSWlCV2lrM0NQcHIydGdWdXJaTWlrU2UvNnAv?=
 =?utf-8?B?Q3N2WEZqUThZTFI5RHM0eWlMQWxONG1HVytwTXJ4OXB6QU1uUEluVnRScHQ3?=
 =?utf-8?B?cEtyeGFodkoySmZqZkExa0lwQW9odDl0eDVGYURNQ2NNd2ZHemRRb25oSmZC?=
 =?utf-8?B?Q1VJa09heUNXSFY3SlpUbTgzek9Jb0tCemRzWmhPdXhDTWdmYWZkTE9MUGxO?=
 =?utf-8?B?UmNIT1BidmpVSjEvWTlXeURBQVduQUd2M2tHUEtGOXVIU05aZG1pdGpwd24r?=
 =?utf-8?B?UWYyOHdYN3FSb2h3b0NIWTZ6TzJpSjJha2RlbjNtMTdGRG9EalRQT01Wb2dW?=
 =?utf-8?B?NnZvVWF1cVFvUjBKNVFHOVdNTmF1OTR6cllzM05MaGJBc1RyQ0FKVElkRnQ4?=
 =?utf-8?B?M0tjdHlNMTdkSHNRWWZaNVpMSzY2V3MrYU9pb0c4RURqSUMxUmFoRkU5Ym1N?=
 =?utf-8?B?YzJCVlYwakNnUmYzSlViNWhXaEd4WGRKM0hTZ3lGVlY5Vkw5Z2c5Q0NTYTJj?=
 =?utf-8?B?Z3RoOTg3cy9sSGw5SmtQOGp3bDFSZ0owTFEvOThNYisxZzRGaFpmUlBnL0xK?=
 =?utf-8?B?VnRxUmF5YlpUTU9ESXl6Wmxaejd3eHdvZjBRaS8vSFpROEhmeDM5ZTJ4Y2pk?=
 =?utf-8?B?MHN0V2ppblFCVmdWd0NtM1JnUmJTL3pkVm5zTjd1WU5rWlVGc2tjR3ZkN1gz?=
 =?utf-8?B?Y0YzQnBMN2d3SzhtSzkvZUpBOUVSOGUwOVhWdTEwQnhtMU1LY3Bzdnh0SUFh?=
 =?utf-8?B?d2t3M2lFeHphc3NJL1BIUkFMMVZHOXlwamVZdERCQkFEZVBKeStPNHpUWHdz?=
 =?utf-8?B?SkhGUFZkZEFWbXJ5S2EwakxXRlYyeWQ0UXdhdXZKWmN4aEE5VzAraThHMkxl?=
 =?utf-8?B?S1lleldBMGt2dW1VQ3hUQjhrVitYVHFVdFNDWmJRWnN5SGtPNGZtbUxPaGYx?=
 =?utf-8?B?MEN4Tlh2SDloK1A2NGs1REZmbm9KSUZWbHpmdWs2YVh5eUN0Z2hkcTdlUUt1?=
 =?utf-8?B?THZjN2g3VXJFeU1YRlV4MjFjcG81OWdwTWh6aFliOXBGY1V6TzZpWU45Q3M1?=
 =?utf-8?B?bURtYkpxUVVEK0paMEdPZVYwcEZ5UVpLaW1MQ2h1T2wwNDZkeEg0WC9DK2VE?=
 =?utf-8?B?RFBTRFRUODh1RmJEL0RCMDlUczVXa013RGJOYmZHRGZiR0UzS21VcTlIYU00?=
 =?utf-8?B?blhCYVVvYnJmM1dwZUJnbTFic3ppSTJNN3ZZaERIbk1MY3NuR3NBLzB1elUr?=
 =?utf-8?B?bUJwWmJBbk4vWFdUZ3VFbTN5NUpXQ1Awd1dFVlNiTG5kWThQOEVxQ2lzbHRX?=
 =?utf-8?B?a3prQVY3MGNHVWhRdWh0bWs3QUlSaUlOZmpYeldKaXAyZ0lQNVJDQndNN0Jz?=
 =?utf-8?B?WUxEQkxjOG5KM1IybmhTSnNVUWMvVVZkMWNlYWlhWHpvMVg0L2tFc1pkNE8r?=
 =?utf-8?B?VGN6ckJYVndRQ0o2a1JrQUYyZ21wL2FDVVQxM0w4blNROTRMUlJBbXQ2VFFO?=
 =?utf-8?Q?SDPorn3+08lGvyaFiuMsasybTeRnbKh3?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cmlUOGJndE1YOXNudWtHWlQwSzNpVnhvTGNJc2xReDlQNzlkUXFoTGR4a3pv?=
 =?utf-8?B?bEpiUkdGc0xZZXpWMjhORlFxUDBRZGlLbUc5UjJ6STQ1R1RBUDFSK2U3aStQ?=
 =?utf-8?B?UVQ4Vll5Q2p1dXhMdUlGakNRaTV4MVIzL3JVaWZaQkR2RjJ1bCt4bVpWUS9G?=
 =?utf-8?B?OWNHcmh6MWdhb0lpaUNOU0Jrajh4YnY2YUhpcFVab3NhT3N5dURWcURvTnkw?=
 =?utf-8?B?ZnBNYlJ3bm8wWERNZFBGZmozTHppSTlNdjhXWUN1YjNuUHZXR2ZycGFyazZy?=
 =?utf-8?B?NWNTZUw1aEpPN2JwbVJkZzJaKzYxVEo0RGNYOWZlSVRMUnRQL0U0Ly9BT2pP?=
 =?utf-8?B?V0JtR0xPQVNKeXhoejAvNlBYVmVSQzI2TndOc2FyUjRQdFpxUHFSbEtiU3po?=
 =?utf-8?B?ZFlTUU5hSVNRUWJNUklROGIyNkM2TjIwZ3RFSzdUK0pEZnJvVjFBa3c4K2s1?=
 =?utf-8?B?ZExhYWtTMUcwNHVVclNPT2FJMERDTTZqd3pLV0M1Q2ZBSC82cFdhL2NIREh6?=
 =?utf-8?B?akx2RUp4ZHloYWhFYXdjZVBkRE0xaEk5dWdteSswenhacFZKQlhNdkl4dVgv?=
 =?utf-8?B?N283Q3o4RW1KeDJiOTBlbDJGWlpWY1cveGtsSDAra2UzTDlrK09mdlJkN1cv?=
 =?utf-8?B?UXdVNEd3c1l0ZVE4aDZWYitPM01CKy9Lbm9MVkxzNmlsNXV3SHB0bHk3dVpr?=
 =?utf-8?B?Q05zcDVydEpDcmprNWFUcnZMYk9HdkVaOVMrQ0ZoelVBOFcyY2JKU3JRdFl5?=
 =?utf-8?B?Mk9JNDdmbkpUdmhQb1owQ2kyM2VXcXVra3RZeWRWcnFOYjlOM2UvTzh6R2ps?=
 =?utf-8?B?RXVOc283b0I4U3phWnNOV1FlS1M5cGIyTXoya3dUOUY2M09hcWlaV3NjN1pl?=
 =?utf-8?B?ZFVCNlBjTEsxMnlEMnNlNEhvR3g0a2JtbUZsbmg4ZzhYRFIyc1Y1bDZ2Y211?=
 =?utf-8?B?eUNuaTRmZ0x3djdDaWJQN2t0ME9BejhjVmtKRXpqWEhTR0lDSXdWMEVmQkVm?=
 =?utf-8?B?SFVaNmg0eTZUeVp0MStxZ1lZS1dWY2REdks3S1QxUjZXZURhMSt1OWJQNEQ3?=
 =?utf-8?B?V3dZWUJ1Y3Q4TXMyYmM3aEFNTGIrdWF2ZWJLUm5UMnlSTmZkemRoUmZpNE5G?=
 =?utf-8?B?MXFjRlA4eDN2MG9POEY5SkR0bXl6bEFyQW10NkljYUlac05aWk5PRW4zWkNY?=
 =?utf-8?B?RUlwTEwrRlpEVjNKSkVIVE8xRW94TG1HVHdrc1BZem1lWVNYdmtCejJmRWJa?=
 =?utf-8?B?T2NzS0YwaTI2Nmk5TWtpaFZiRVFEa2o5eDNPYUFTNHZIdkxiSGdUeWM4SUEy?=
 =?utf-8?B?MENqNGdsV3RLRVJZNi9FSUJZY0VzYXpFdnIrQUl4ZmlUdklzd0J0cllaczVw?=
 =?utf-8?B?cmE4SGdwd1BiSTZtTnloSXFzS2MzNzgrU0c2UDAxMDJjeWhNWkhTa2RNUTVm?=
 =?utf-8?B?OE5GWGEvejRFMTZkd0RLWDNIRlZaR0tHdERMZ0kzMDVYVXVEQUdJYi8vMEYx?=
 =?utf-8?B?MFQzeVVtSjVvamdNRURtMHlaSFBYWVZjWWlzcU1lUnlVcENBamxIdjh6eEJp?=
 =?utf-8?B?QWw2RmtLb3BZNTVETVRDV0tMNStZcmczUSt1bDAvS1cxL3BHTkJqMkZOdHhZ?=
 =?utf-8?B?QVFBQjY0M09OaDFkdGNSM210UDdQWkI2MzdNRjhtK2V5TzBkdjFXclBQQ2dz?=
 =?utf-8?B?QkJ1M2UyQ2VMeXpwaXJrZE9Oc1piT1pJbXQxWUV4RWVKNXAwMXZySG4yTmh6?=
 =?utf-8?B?MUZUL3N0RC9hdm5saUh5c2o5ZVFMRHhiVTlwUW1vajFSRFBUaTh5Y1doRmds?=
 =?utf-8?B?OEN2bUo4SnhHU0ZkU3J3VlA5TEt4S0Q0NWF1OGVabWxBRXpEL2F6VUdoZXlm?=
 =?utf-8?B?YkZESUpYMFpKMkZraWl0c1QyaW9EOVVmQ0ZCSG51dzZnL1ppazNiNGdyVzJp?=
 =?utf-8?B?Y2k5VmFocTFXeHUvRkRqQkR5Ry9TMVZKM3h5VUJmdFk1U1BmRVRSN0VQNmdX?=
 =?utf-8?B?V1BGQTFOU3RYcm9iRXppcWhjbEg2OWEzeEI1Z0tzWEdQMXFsUk0zUHUwWWtr?=
 =?utf-8?B?UGZWR01FanFvajdmM28vR05OVzVzU2JyR2dCekFwckRSUTUrYngxMGhGcjJt?=
 =?utf-8?Q?1lCCje1iJO9CJt3SpO7xShIiJ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c1fb108b-9724-46de-6093-08de2913bace
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2025 15:36:25.0752 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oEfwIu2xmq52OpMYqDIkr72g3Q5dCePVrVNrCSlnkWQR85WrRF1ty/irm6t+8y8u
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

On 11/21/25 11:12, Pierre-Eric Pelloux-Prayer wrote:
> This makes clear of different BOs run in parallel. Partial jobs to
> clear a single BO still execute sequentially.
> 
> Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_object.c |  4 ++--
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c    | 12 ++++++++++++
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h    |  2 ++
>  3 files changed, 16 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> index 56663e82efef..7d8d70135cc2 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> @@ -1322,8 +1322,8 @@ void amdgpu_bo_release_notify(struct ttm_buffer_object *bo)
>  	if (r)
>  		goto out;
>  
> -	r = amdgpu_fill_buffer(adev,
> -			       &adev->mman.clear_entities[0], abo, 0, &bo->base._resv,
> +	r = amdgpu_fill_buffer(adev, amdgpu_ttm_next_clear_entity(adev),
> +			       abo, 0, &bo->base._resv,
>  			       &fence, AMDGPU_KERNEL_JOB_ID_CLEAR_ON_RELEASE);
>  	if (WARN_ON(r))
>  		goto out;
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> index 438e8a3b7a06..8d70bea66dd0 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> @@ -2277,6 +2277,7 @@ u32 amdgpu_ttm_set_buffer_funcs_status(struct amdgpu_device *adev, bool enable)
>  		adev->mman.clear_entities = kcalloc(num_clear_entities,
>  						    sizeof(struct amdgpu_ttm_buffer_entity),
>  						    GFP_KERNEL);
> +		atomic_set(&adev->mman.next_clear_entity, 0);
>  		if (!adev->mman.clear_entities)
>  			goto error_free_entity;
>  
> @@ -2576,6 +2577,17 @@ int amdgpu_fill_buffer(struct amdgpu_device *adev,
>  	return r;
>  }
>  
> +struct amdgpu_ttm_buffer_entity *
> +amdgpu_ttm_next_clear_entity(struct amdgpu_device *adev)
> +{
> +	struct amdgpu_mman *mman = &adev->mman;
> +	int i;
> +
> +	i = atomic_inc_return(&mman->next_clear_entity) %
> +			      mman->num_clear_entities;
> +	return &mman->clear_entities[i];
> +}
> +
>  /**
>   * amdgpu_ttm_evict_resources - evict memory buffers
>   * @adev: amdgpu device object
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
> index eabc5a1549e9..887531126d9d 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
> @@ -73,6 +73,7 @@ struct amdgpu_mman {
>  
>  	struct amdgpu_ttm_buffer_entity default_entity; /* has no gart windows */
>  	struct amdgpu_ttm_buffer_entity *clear_entities;
> +	atomic_t next_clear_entity;
>  	u32 num_clear_entities;
>  	struct amdgpu_ttm_buffer_entity move_entities[TTM_NUM_MOVE_FENCES];
>  	u32 num_move_entities;
> @@ -189,6 +190,7 @@ int amdgpu_fill_buffer(struct amdgpu_device *adev,
>  		       struct dma_resv *resv,
>  		       struct dma_fence **f,
>  		       u64 k_job_id);
> +struct amdgpu_ttm_buffer_entity *amdgpu_ttm_next_clear_entity(struct amdgpu_device *adev);
>  
>  int amdgpu_ttm_alloc_gart(struct ttm_buffer_object *bo);
>  void amdgpu_ttm_recover_gart(struct ttm_buffer_object *tbo);

