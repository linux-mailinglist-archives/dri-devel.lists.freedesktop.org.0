Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9171C5D2B4
	for <lists+dri-devel@lfdr.de>; Fri, 14 Nov 2025 13:48:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 059A310EA5C;
	Fri, 14 Nov 2025 12:48:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="eyG0KdFz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11012026.outbound.protection.outlook.com
 [40.93.195.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74C4D10EA5C;
 Fri, 14 Nov 2025 12:48:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z9Dx0TOQjw6bNpZMqwuCiaprdytOU1IONgmIHSFEUztdhO4DIq+c9nNQVFROBrXfWzaCTGTiJZxlskS/Lk+oS03H/oOliUdUD9KVxfNR3EHBDb4FnUVC7BlFGtusznH3FcIg3TYZWswAym/nxdCMcs+QOZRuodv4owmYvn4xUP0b7iG1JJgwudfj7chkkKMG9vG0iP7msVBjcW8P/7iOQzzqDTwsTwnOdlb19irtKiPbpiCbE3AjR7yGcsx8DKqFAC2Day4ckyk5uuzFPVl22Qm2zhLyhV1qNHzL3gpzIxrtcVUqgydfp/lU1lVUY8yvuQeI8vBXJPzt5tfEtYa/nA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=15uxABcUX07m2TCww+P7Q5NrlvDXUvQkTWfmpWM/yfE=;
 b=wK0TduYI+G8G9RxL8aaAYI5RGZsymLm+wWOTzaP6J835FnfvBehs2vMKwO3CMICzXty4K6gvxzX5yu+httK3iYClXuheysjlOP/HskxyXNlXhw5G9gx/c5fMPzwkyxi8kb0W17m3aJYb9g7BcdoEGeiAgRYT5PEisMXH69oHWpFns6Uva3/R8aheBDW5ZCuEBXyYeHcUL9/KtcUF99a6tenx9eD8PnlwyPafksW2a/Gp/A+DBvIdY9lsGufLSMpKJmzgKAMtqiKh2JUHP9L7FJxNSDdjpwOy8Kn+d0O2PReX9XIhxA4WQfW+Zoo3wBjHZJBvTTUWEXqE4dqErcLucA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=15uxABcUX07m2TCww+P7Q5NrlvDXUvQkTWfmpWM/yfE=;
 b=eyG0KdFz467BmGfnapOWs/JlL7TpJmrWqz+F2HAhhFm0TkPdQPfNeo9P9z0Uw8ELci0fF25ZaehH3lmJV4ObAuHxnh1x1jweqbkYzLlIebxQzf72j7+roj7splUYprXXERVcc7lAb8IS3ptYCRseg3EBby4fcM5ZZc4GnSD8xAM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by IA1PR12MB7518.namprd12.prod.outlook.com (2603:10b6:208:419::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Fri, 14 Nov
 2025 12:48:36 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9320.013; Fri, 14 Nov 2025
 12:48:36 +0000
Message-ID: <0fa6c985-a175-4316-a983-4ce11e4da154@amd.com>
Date: Fri, 14 Nov 2025 13:48:30 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/20] drm/amdgpu: remove direct_submit arg from
 amdgpu_copy_buffer
To: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Felix Kuehling <Felix.Kuehling@amd.com>,
 Sumit Semwal <sumit.semwal@linaro.org>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org
References: <20251113160632.5889-1-pierre-eric.pelloux-prayer@amd.com>
 <20251113160632.5889-4-pierre-eric.pelloux-prayer@amd.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20251113160632.5889-4-pierre-eric.pelloux-prayer@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0119.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:bb::14) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|IA1PR12MB7518:EE_
X-MS-Office365-Filtering-Correlation-Id: 92f99bf1-eec6-48b3-6954-08de237c20a4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZnZ6anpUMW81a0JBUlBUQXRiTDBvUzZkalZPNTlHclAra3hTb1RsdDBZeU1O?=
 =?utf-8?B?MGx4RG1BTjZOckJ4eE56c1pYN0o5bnczNHprMHZRWm5uRFMyN0k5bzVjc1I0?=
 =?utf-8?B?Y0NrOFZJc0ZEeVZ6eEpwR0grZG1GZ3p0NWVBcFJhUUlsUTdQNW03S0NJakc0?=
 =?utf-8?B?SnpMK1JTQjBWSXB2bGZBUU83RWkzUzVpUDNXcC9CbjBPeE1ubitNb1dqNE41?=
 =?utf-8?B?NmZmeHdxczhFUkQ2NDhLaFh5bk0xbEQxclVYNVJZMjhJc2ZHMGJ1QnZKSnZn?=
 =?utf-8?B?dFpoU0lJTTA4UTNqU0JSSGNnRmFXcXdWeXRLbi91VHAxUUxRRmFkVHNlTE1w?=
 =?utf-8?B?ZGtMclRPVzZXNHlGRVFpeEtOVGY3WkgwbjI2MVlvNGRER3o0NnFDeWtScFZ2?=
 =?utf-8?B?VTRCQ25NUnZkbWZkOHRiVXdnanVtQkcxYTNaeUhMUzRHeDVoMFhseHFwbTcw?=
 =?utf-8?B?S3Q3UFlLWk1VS1pvakZxUHRPbU93ek01MWttcEdjdFZqUUJWdjNSN09XUExX?=
 =?utf-8?B?d20xMEpiVzNhQmdIemZxS0xHeXpxbTBkVFNndVRSMkVweEVpajM5MUZTRFpR?=
 =?utf-8?B?WUQ3VmIrOENjZ1NhTmlIQStDVFY4Zi9FSjB0dFBzNVAxalpxRjNiVFBMTlRJ?=
 =?utf-8?B?WHhxbzArclN0MlQ2Z09sWTZubGVzUTFuU3h0clczcDNQKytwSm9BRVlRWEx3?=
 =?utf-8?B?SXA1QmRMYk9ROU1KaEhKQWtTYmdtdXB3M245NC92RXhNeWd1bWRuN1hmMUNl?=
 =?utf-8?B?RlB4OTNwZXU0bFEzU1F0aXdYbHdBVHNtMnV5UENaaGJOc1dGdXhIejd5V2Z6?=
 =?utf-8?B?MVhlRjM3ZFVlYlFHMld0U2JIb1VWZTZzazYwUG4yaWUzUk93YnB6MTcrR0pM?=
 =?utf-8?B?SDlnekhKWFN6MUZtUTNJWFA4MlFLWVRiSUMydzJUdlZuQmpDWUNXZHVnRkxa?=
 =?utf-8?B?NjFTTW5DYmVLdjRRbW14THFia2I2ODJlZWxvcHFONGxrbm1oUmtYeTloZXhv?=
 =?utf-8?B?Zlg0QURUSnhnSENXM3RDUnZuS2NlWk9IanJ1b3RtdElaOTFyNzJCL3BOV2RT?=
 =?utf-8?B?S0ZsanVKdTE3aXpJdjJEMjZsUXpHSTFwekdXZFdEMm5lR2NjaXBrQm1ISklv?=
 =?utf-8?B?UXBONGQ3QVl5VnlZZUM4MTZwQWwyZkYzWXl1ZFZFcFZlSFJxNkpJdGg2SWEr?=
 =?utf-8?B?WUVrRUNSblorMFBhQ3I0OEpVaGFGYzNjZms5eTVNQUllUTFHNER6amtpRFJR?=
 =?utf-8?B?MW02dzBxWHQxOElUZXhsaVhiWmpjd3h0Ujkwd3NmMXBIVzRGSEdXZll3Q2E0?=
 =?utf-8?B?MTdZaGVLaG4zT2RxWUZpK2N3VDFkMERja0FQclJES0xVaXhwL1hycWszNllj?=
 =?utf-8?B?ajk0N3lud1pDZVJuVDllaitqdVJ2TkwrYTNGT3VIMWxVa3JtRHRPN3hKdmdM?=
 =?utf-8?B?YStWRFJNS0lHc0U0VnBZZkd4bXpUSDl2eGo5U2hIRllNTTBxaENrS0loekls?=
 =?utf-8?B?cUxtYm91OEE0WlA5Rk9rZkNxWk1rUDRwUklMZDdVSEt3dERjcERMYTk0SkhP?=
 =?utf-8?B?Njd0WHJUU0lPbnJKWHA4by9oc3Q5T1BXWk5QRjhNcmhkcmlaRzBTTGFGckZW?=
 =?utf-8?B?MHRnWXVrTCtXTEt1TnNSK3I5UnBvZ0xrWlZxTmNFR3drdk95UHd0blFYcHA2?=
 =?utf-8?B?RWV4aFFvYUs3dlQwY3FRRWJwRXVnazZsTHB4aFQya1lOVEgrZ2ovQW54eGRx?=
 =?utf-8?B?c3kvT2xhVG5HNzcrR2RPbGNpSDFjL2sxejFqd1FPclR2eEMzWGxReGdVQUlS?=
 =?utf-8?B?bDdwcXluaXVJZDlPZTRxclBvZldodjBYN2w3amRCekVvVmo1RTFMN1hyYVFY?=
 =?utf-8?B?VkhtUzdQZ3d0TUl1c2Z6U1pmVGhrRTFIdVZzd2EzaUo5S0hYWmo4MHlGMzZL?=
 =?utf-8?Q?U/OG4KS7do9dNFCunGZ8+XQGFmHGYYwn?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NzEyRlNkUmplR3NsdjJvNGNSTWlrUitMWVFUVDQrUS9nOGJRcSt1d0lEcHQv?=
 =?utf-8?B?RE9seGNaM3V4Risxdi9peExRMWpKYyt0eWNhbGRpN0tkeWVOcjNGTjI4TitE?=
 =?utf-8?B?Z0l6TzhrbUsxcHdBY2o2aURydFExNi8vQk1RQ0cvdXVvNURjdlFHTEJKZ1ZU?=
 =?utf-8?B?c0JyTGEzOVhwbm0vUWwybEFDUGxVbnRRRDVicXBjVmpQZ1FkSURDUkFodFp2?=
 =?utf-8?B?dmFYSi9BYnAvVTRtS2VPcHZjcXZLVnZXOVhQc2J6Z0dOejhNK3Rud1lGTjhM?=
 =?utf-8?B?RGlRVzJKN2hFWWFHdGgvTDA5a0Qvd0xTM3haNWh1M3BSTy9ZSlE0anVJVG11?=
 =?utf-8?B?cGZVbFJOZ0YyS2JkWjdqTzAwc253QXV0OE9NYlFQTzFLNGZIQUx4WitYZ0Ez?=
 =?utf-8?B?VlFCeit5SXBUczdYT01uT3ZraHVlcWs2SzM3ZU9PU2ZpODlZb1FMT2ZnWFNp?=
 =?utf-8?B?c1Vka3YrVTNETTVrWmZRaXlBNHN2bzNpK1orN1NmYjNiU1lMMXE0dkxGK0sz?=
 =?utf-8?B?a3I3NGJIeFl0N2cxc1ZITGFyQy9Kbnl3R3AwZmdXcWdkd3FVWnNGYkZsK1Ba?=
 =?utf-8?B?OVdFUU9HeG9uRVliRU5mQkxGUDh0Z216NHlSL2dtcktVa2ZtTlZDaDFUMmtl?=
 =?utf-8?B?S1J5N2pVSEhMdnZrUTBFNkI3MUNjWkJONnpPV1BJOHJkcFRWV3UybTMyQjli?=
 =?utf-8?B?QlRlQ2hCaWhWQ3Bsa2REazlMeHUrSXFFYlNvallyNVNFbGtkVC9aT0VhU04x?=
 =?utf-8?B?T2hVUzlvbE1Kbk1GbGFqcGdNbkRJdnNjcE1kS2JBMVluMExXTGdmL2gvZDFn?=
 =?utf-8?B?QkZnYldCWHRybThRUGwza2I2cHJVdUt1dEl6TGwyTXdpVFIyaUN6R2V2UVZ6?=
 =?utf-8?B?WmM2SHJUaGVIelpibWZUaGhIZVdIdDZEUENHQTZvUkNtQzQ5WWVNNFV4ZmFM?=
 =?utf-8?B?MHpPUnA3NEtCZmZudmN2aTZXRDc0dFliQy9iRE9PWFNhUjgzTTBxVTU1dW9t?=
 =?utf-8?B?end0amdyeXVTMnB2MGxUdE1nQmhYN2FZb09SVmJ2bS9NTjlMN0NWTzlFK3c5?=
 =?utf-8?B?SDVXdTRKKzIrdU4zOHNJWXRhYlI5WTlYdE1PWndSOHRwZk9OYUR2SWpzMVAw?=
 =?utf-8?B?dkltQ0ZUK0orWGUvRkNXV1BFWkdnanFEakpxVlhFTXpyMnRMcmpmbmtYaWx3?=
 =?utf-8?B?WlV4QSt2cXQwVTlQRkdoVkYxSEMwMVp3YlJEeDZrbjJ0Tng0K1lPSGVOeGdw?=
 =?utf-8?B?YUhadnNrekI0VHhwQ3c4M3FQUzdUbHcyN3ZXOFY5eVdGUlhrQkxwdVhpZTlp?=
 =?utf-8?B?SldPSkk4OUI2K3JJNzlXallPaGMycnZVUzh4enVHZGxCK1htd3V0WmtvMTJq?=
 =?utf-8?B?b0kycDM2Yzh2VkZGWkNLSjN5Qk9YeDQ1QjFYRTFFMGhKenBJajVGb0VDNTFN?=
 =?utf-8?B?M2xDYzd5aEtoZ1lEbXlDQVRjK0kxNGNxRkh6Y1lKc3MzanV0aENTQm9nT3Vm?=
 =?utf-8?B?ZU9DS1Q2QmdVZU5jREQzejhQRUdWQmlDdFJyNGlFYmk0dXBpd0pkQlNsNno5?=
 =?utf-8?B?cW8wTUFzcjhudmp2UXk2ODd0TlJKbXpZMHlYdVZwek0vL0Y2MUJsSjhlUWUx?=
 =?utf-8?B?c2dCeFp1NkFuVVV1WWc3WVk3M29sNGpiRm1XeE1sVUw3TGFVNit5eHA4VWR2?=
 =?utf-8?B?cGZMd0trTmpjNHF0TEJHVWRVRTRhQlNuNDFrUjNoazhQZzdoOHZOcDJ6cThU?=
 =?utf-8?B?d2VCNDJrdmxzdCt4RzEwNmN4QnpNZGc4aWxRVTFBb1hjQTV5cnNtN3BEYWFl?=
 =?utf-8?B?VzdUbmxTUlpxcnM1VVpBZmZ1NkgrbnBjQSsvUVd5aUpLeWtuVFVDcENyQU9a?=
 =?utf-8?B?bDAyN3lpR01yQk4yQURITDlBQ3EwYVlPSS9YTWE1Y05tREMwTjVZWDdqY0Nq?=
 =?utf-8?B?VFNQK3VvUTRzZnFJM0Q3bHg1THUrUHFWVU1QNGpCcHB4czFaZGtnRmRwM2FI?=
 =?utf-8?B?Wm5ZM3pBODU0NFZ3WGVGRXBwcm9PaDRocnkyVlFJYUFYYU5QSXBVdnBxSkd2?=
 =?utf-8?B?Y0Q4SlhpbDBHMjdBUG1SWHM2U2laZjQyVTcxaEpPSDk4bVN2amFZRnliVlJi?=
 =?utf-8?Q?pdL17ufrtmLiM7TamqCzK9YLs?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 92f99bf1-eec6-48b3-6954-08de237c20a4
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2025 12:48:36.5790 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bHEAnccXUIM0GjBLx/iBzVdijhyJJcl2or+FErce1P4U7H0cEXWjjrtlIu8eJo1o
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7518
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

On 11/13/25 17:05, Pierre-Eric Pelloux-Prayer wrote:
> It was always false.
> 
> Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
> Reviewed-by: Christian König <christian.koenig@amd.com>

Please push to amd-staging-drm-next.

> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_benchmark.c |  2 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c       | 20 +++++++------------
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h       |  2 +-
>  drivers/gpu/drm/amd/amdkfd/kfd_migrate.c      |  2 +-
>  4 files changed, 10 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_benchmark.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_benchmark.c
> index 199693369c7c..02c2479a8840 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_benchmark.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_benchmark.c
> @@ -39,7 +39,7 @@ static int amdgpu_benchmark_do_move(struct amdgpu_device *adev, unsigned size,
>  	for (i = 0; i < n; i++) {
>  		struct amdgpu_ring *ring = adev->mman.buffer_funcs_ring;
>  		r = amdgpu_copy_buffer(ring, saddr, daddr, size, NULL, &fence,
> -				       false, false, 0);
> +				       false, 0);
>  		if (r)
>  			goto exit_do_move;
>  		r = dma_fence_wait(fence, false);
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> index 3b46a24a8c48..c985f57fa227 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> @@ -354,7 +354,7 @@ static int amdgpu_ttm_copy_mem_to_mem(struct amdgpu_device *adev,
>  		}
>  
>  		r = amdgpu_copy_buffer(ring, from, to, cur_size, resv,
> -				       &next, false, true, copy_flags);
> +				       &next, true, copy_flags);
>  		if (r)
>  			goto error;
>  
> @@ -2211,16 +2211,13 @@ void amdgpu_ttm_set_buffer_funcs_status(struct amdgpu_device *adev, bool enable)
>  }
>  
>  static int amdgpu_ttm_prepare_job(struct amdgpu_device *adev,
> -				  bool direct_submit,
>  				  unsigned int num_dw,
>  				  struct dma_resv *resv,
>  				  bool vm_needs_flush,
>  				  struct amdgpu_job **job,
>  				  bool delayed, u64 k_job_id)
>  {
> -	enum amdgpu_ib_pool_type pool = direct_submit ?
> -		AMDGPU_IB_POOL_DIRECT :
> -		AMDGPU_IB_POOL_DELAYED;
> +	enum amdgpu_ib_pool_type pool = AMDGPU_IB_POOL_DELAYED;
>  	int r;
>  	struct drm_sched_entity *entity = delayed ? &adev->mman.low_pr :
>  						    &adev->mman.high_pr;
> @@ -2246,7 +2243,7 @@ static int amdgpu_ttm_prepare_job(struct amdgpu_device *adev,
>  int amdgpu_copy_buffer(struct amdgpu_ring *ring, uint64_t src_offset,
>  		       uint64_t dst_offset, uint32_t byte_count,
>  		       struct dma_resv *resv,
> -		       struct dma_fence **fence, bool direct_submit,
> +		       struct dma_fence **fence,
>  		       bool vm_needs_flush, uint32_t copy_flags)
>  {
>  	struct amdgpu_device *adev = ring->adev;
> @@ -2256,7 +2253,7 @@ int amdgpu_copy_buffer(struct amdgpu_ring *ring, uint64_t src_offset,
>  	unsigned int i;
>  	int r;
>  
> -	if (!direct_submit && !ring->sched.ready) {
> +	if (!ring->sched.ready) {
>  		dev_err(adev->dev,
>  			"Trying to move memory with ring turned off.\n");
>  		return -EINVAL;
> @@ -2265,7 +2262,7 @@ int amdgpu_copy_buffer(struct amdgpu_ring *ring, uint64_t src_offset,
>  	max_bytes = adev->mman.buffer_funcs->copy_max_bytes;
>  	num_loops = DIV_ROUND_UP(byte_count, max_bytes);
>  	num_dw = ALIGN(num_loops * adev->mman.buffer_funcs->copy_num_dw, 8);
> -	r = amdgpu_ttm_prepare_job(adev, direct_submit, num_dw,
> +	r = amdgpu_ttm_prepare_job(adev, num_dw,
>  				   resv, vm_needs_flush, &job, false,
>  				   AMDGPU_KERNEL_JOB_ID_TTM_COPY_BUFFER);
>  	if (r)
> @@ -2283,10 +2280,7 @@ int amdgpu_copy_buffer(struct amdgpu_ring *ring, uint64_t src_offset,
>  
>  	amdgpu_ring_pad_ib(ring, &job->ibs[0]);
>  	WARN_ON(job->ibs[0].length_dw > num_dw);
> -	if (direct_submit)
> -		r = amdgpu_job_submit_direct(job, ring, fence);
> -	else
> -		*fence = amdgpu_job_submit(job);
> +	*fence = amdgpu_job_submit(job);
>  	if (r)
>  		goto error_free;
>  
> @@ -2315,7 +2309,7 @@ static int amdgpu_ttm_fill_mem(struct amdgpu_ring *ring, uint32_t src_data,
>  	max_bytes = adev->mman.buffer_funcs->fill_max_bytes;
>  	num_loops = DIV_ROUND_UP_ULL(byte_count, max_bytes);
>  	num_dw = ALIGN(num_loops * adev->mman.buffer_funcs->fill_num_dw, 8);
> -	r = amdgpu_ttm_prepare_job(adev, false, num_dw, resv, vm_needs_flush,
> +	r = amdgpu_ttm_prepare_job(adev, num_dw, resv, vm_needs_flush,
>  				   &job, delayed, k_job_id);
>  	if (r)
>  		return r;
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
> index 577ee04ce0bf..50e40380fe95 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
> @@ -166,7 +166,7 @@ void amdgpu_ttm_set_buffer_funcs_status(struct amdgpu_device *adev,
>  int amdgpu_copy_buffer(struct amdgpu_ring *ring, uint64_t src_offset,
>  		       uint64_t dst_offset, uint32_t byte_count,
>  		       struct dma_resv *resv,
> -		       struct dma_fence **fence, bool direct_submit,
> +		       struct dma_fence **fence,
>  		       bool vm_needs_flush, uint32_t copy_flags);
>  int amdgpu_ttm_clear_buffer(struct amdgpu_bo *bo,
>  			    struct dma_resv *resv,
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
> index 46c84fc60af1..378af0b2aaa9 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
> @@ -153,7 +153,7 @@ svm_migrate_copy_memory_gart(struct amdgpu_device *adev, dma_addr_t *sys,
>  		}
>  
>  		r = amdgpu_copy_buffer(ring, gart_s, gart_d, size * PAGE_SIZE,
> -				       NULL, &next, false, true, 0);
> +				       NULL, &next, true, 0);
>  		if (r) {
>  			dev_err(adev->dev, "fail %d to copy memory\n", r);
>  			goto out_unlock;

