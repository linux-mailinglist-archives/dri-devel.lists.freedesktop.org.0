Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C00B7C634DB
	for <lists+dri-devel@lfdr.de>; Mon, 17 Nov 2025 10:46:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 047E610E341;
	Mon, 17 Nov 2025 09:46:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="I3qfby7t";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azon11010038.outbound.protection.outlook.com [52.101.46.38])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B614910E33E;
 Mon, 17 Nov 2025 09:46:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aWaYcf4OHZC95ZupsaW2I22PsvZ8ewfI1jqTiANevVy3I/TCGmIuBuXO6kcOYIUU2JbYJNWGRnArpLncsOlVnKYwOnur37K9LuhefK6HGWh9ngg2Js5NNNkWBffQf/o+7ZypxWXzUSN6i3p1bOsYagbqZ6LYJoxADVs7/Uk3TokD5RCW47UXDtaHik/ft0FfV2dssoTKaeyHcqdZcxnPnYR9ZAVzZDpM5zzMSDLnyahZJ2k3JCRbT+QCrVPawbLAKTnADeEc40zkqs2EtybkXylUkZZjc1efnf+O8IBNgjflbPxRhlsDgoYRtXDf+MvqUi1xeq41anjlXnqcjMPxNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PZKFZF/i4sBC/Yhbev7q1dfndmwha1usN8ruRiuYySc=;
 b=rZp6zx/uWqYGXQd8VYLV35HRsEpp5G9/xW1bOpz6CZ+gVCbVUgYXxKzsM0WzY1OiA5aXPEJnr6dXCfSW3c77e1MJMN4aMePKNxIM1riXUSUIWPYgTecrlsYKoAOsnKcZbs/rnMn5Mnz/smH8O8CHMlpoqywJJb8ioAkoc0RZORxOHxJX8CKF64fVF29iy0vE6Lw5RUHC9yM+VH8vM7qsPWDjaLacnNQ2pWMjHaKOQU+JEAJ6/opc7lZ6TQwJRDrfkPNI9y65xmEOB7zRSorsgtHvK5PY+onMYB52yEVYfo1i5eLA7zGx3MDbo/wK6q7ZR8VQYobDZbkB7wh3lYtmFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PZKFZF/i4sBC/Yhbev7q1dfndmwha1usN8ruRiuYySc=;
 b=I3qfby7tcd9L7T4PoLelsKHFTZaS/CCsxN+UFBIhDFMcJ+7BPL9J9w+8PQpi10P9OUHSTWdAzu7LSmN9dgjuzkyqduMYD8IvKPG+cMF1ot19kO/ugH+4tr3NfarhYucL9N1iS53MCI6ejFl8cObt5UlnN9aF6thX9OaMgw4qbnw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DS0PR12MB9448.namprd12.prod.outlook.com (2603:10b6:8:1bb::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.21; Mon, 17 Nov
 2025 09:46:12 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9320.021; Mon, 17 Nov 2025
 09:46:12 +0000
Message-ID: <2920edba-469e-424a-87da-475821bd5c2e@amd.com>
Date: Mon, 17 Nov 2025 10:46:04 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 15/20] drm/amdgpu: pass all the sdma scheds to
 amdgpu_mman
To: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Felix Kuehling <Felix.Kuehling@amd.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20251113160632.5889-1-pierre-eric.pelloux-prayer@amd.com>
 <20251113160632.5889-16-pierre-eric.pelloux-prayer@amd.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20251113160632.5889-16-pierre-eric.pelloux-prayer@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0299.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e7::10) To SJ0PR12MB5673.namprd12.prod.outlook.com
 (2603:10b6:a03:42b::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DS0PR12MB9448:EE_
X-MS-Office365-Filtering-Correlation-Id: 98c6332b-8062-4826-1163-08de25be2457
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RmVmN0w0NzRWZWFmUlNRNlVUOVd6MUFsSUdWbmxoQkhUaFZSbk9FSVBONUQ2?=
 =?utf-8?B?WmhCYU5zY1RZSUhNWkVmWWpnZ2thOVBHUW5mRkwvSTVVWmEyK2d0NnlsU1pF?=
 =?utf-8?B?dzFic3lhOXZEaFV1V1pwRUNkVFN0QjNjcFkvR252eDZwMW5vYnVYVVZXZVBO?=
 =?utf-8?B?Qi9OVG5pN3l0dkpoa05nL2U0RUhob2Z3R0g1OC9rbmhRdVdYT3VZcEtVUzBl?=
 =?utf-8?B?dTQ2MFh2bGgxYk1wRWpwdkIvUlBWM3N2QThDRUpCYmwyQXdweGp1OW9qZFBL?=
 =?utf-8?B?ZXBtVU5SNUV3eW1SNkx0cStPM3pYd2p4cGIxeDhtVElNZ0F4SmFVeXZqa08z?=
 =?utf-8?B?bEZZZlZRLzNoMDNFUkxUUm1OS3ljMGkzdk5kWXNTODNKZWErbi9QRnhCOUR2?=
 =?utf-8?B?RmEyNFNaRTBGemY2U1o5SGY1Y2RIcklFT3l2WUl2STJoYnNUMG9TcnJxUDNY?=
 =?utf-8?B?NzdYY1JSSUJMQkVkdVA2WHlvdkZ3YUw1NUE1SU9iRGJkWjBLVW83bjFoajZP?=
 =?utf-8?B?bE9Ed0V6N2pRaFRzYmV4T1VOWkZoT1FHK1doOXJIRk5xZDJXakJVbytibnFG?=
 =?utf-8?B?N015dTlQUXVyaHB6Sm0rNDhRVEw4R29scWNMZ3Q4eVBVSFUrZ1krRy8zS05O?=
 =?utf-8?B?alAzdDhxYS9YWWR4TDcyK3lmQ0k2VHFyb1dPV051NXZUTDdxK2ZzODBhZlIy?=
 =?utf-8?B?VnRIQUdVd1dqbjJ5T1RwZWJ0YUhidUQ0eG0xZ3owMkgwNjFkbGQzTiszOEFZ?=
 =?utf-8?B?VzcrMHc5azNmWHg0MFpKVTBhN3VYQUpONW1NNzhCdEZwa2VTaEVmK3JyOXp4?=
 =?utf-8?B?aXdkeDhoVGI5WVBQcFlWa1dKY1hZcnAyMFpkbHFocmhOdHIyRlZBelpPNyti?=
 =?utf-8?B?bnBuU0QxWm9KTDNLUmpHTlJ5OStHTzdnRDRjK0MraGFUT2dCNGxocXphbzdy?=
 =?utf-8?B?UGhMUTZhTEhoczd6YjZ5MThqNVgyeHVxTENqdklMUGxjYlZCNTZJdkoydCtk?=
 =?utf-8?B?ZlE0eEc2VzY0bVc4QWFNdXZsdGovbEVXRFM5T3BaT1laQkJLYVpraGlZOWt5?=
 =?utf-8?B?NjlRUyt2UGFqREJaZ1BuQnBud29yYTZLS3ZFVC9ibUxTa293UUpEeG9pMzcv?=
 =?utf-8?B?K2lMdUcyWEc1RGZaSnRpdVhRaTB3Vk50UUF1NFJyYVRVRHJ3dWw5UnVJdlZV?=
 =?utf-8?B?NUpLQTlYVEtTbmdnTXFwZDk4a0hXZ2hWWi81OHpkVm8yRmw0aFFqd2h0bTJi?=
 =?utf-8?B?bXdzTnBtbW5xdDlCRS8wWEtEbWN0QkprTUhmcFllTnBPRWF5MEVnRHJNTGY1?=
 =?utf-8?B?UlpSS1JqdkNVcWxEYU43MThSMGVjbXAycVRKeVl5M3dxZmN0SFoxVlI4RWJl?=
 =?utf-8?B?OW44RGRNZ2FWNHJLL1ozY2RXTFhNVkFRK0htc2JHTTRUWllEU2NOVk5ENFVy?=
 =?utf-8?B?ejhLQkNQUjZxbjR0aUdGSzZkZFFTU200OE1abGRZeUkxRFg3YTJpTlZlakdW?=
 =?utf-8?B?OFRUdlAwMGxUTDNiRGVCcUlkN05YV3lET25YL0gwenpoVzJqc2lYWEZIU0Zx?=
 =?utf-8?B?V1pDMFNXc3ZxTlBTK3d5Z0RQdjNodVB1RlRFVFZlb2xiOFlFY0ZkQzhRSENt?=
 =?utf-8?B?Z3k2OGc3Vm9xSmdvR3BtRmdWWkhtY0w5cVhLcnk3TzhvRStQMytLc2J2M1VT?=
 =?utf-8?B?QnFFZ2d3bnNZWC9WVE1iYmpHN0hNQnlLcUpsb1ZYcWxqSkNtZDBCTC9XUUpR?=
 =?utf-8?B?c2JIK0VlcEFKa1dXRHZkRjBMUzNWOGVzbXhya29La2ptT2F3MitKUnVkSDk2?=
 =?utf-8?B?UklUZ2JvZ1I0OXpRZ2hEUVg2dk10ditnUksrM0doZG8vQVZjb3c2QUw1QWkr?=
 =?utf-8?B?dWlnVWpqNGZlNEFmOEpBbzJXd2F5UTVrbHVZWENTOFkxSDFDY2IwdjdpV1FF?=
 =?utf-8?Q?6Ia071ij+JRGm/3AQ7jQWj0OoFJ43zkV?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NFhOQ0NvVzBEM0YweGVmSkVYSm0xYjBuWDZkR0NGQms0aWMzZ3dNNnA3MmtY?=
 =?utf-8?B?MjRYMEdGV1N3bEhKRGN1YlFTOUNKVE9jamhMdnBVaUVuVmE2ZHhJTHBmcGdx?=
 =?utf-8?B?alY2bmp5SFhrSVB6RlUvbithY2d2NTljWkloTjFFcmwrYmxsK05JcG5oam9S?=
 =?utf-8?B?VjJXUm5VejlZdHhmUkpTU21mdkVGT0lNdFF1elNTSDVNQk41UDNMTnJHUjdz?=
 =?utf-8?B?endvN2REZTE3cmtHUEpoV0I0TGNYU1ExNkR1U0ErSXYrd2JXNFljc0h6eVk1?=
 =?utf-8?B?Q2xqQVdSUldpQUdkdnJ4Wk9xVmlodzJmQ09kUnJvTzlNQmMzWGxxOGI3ZmY0?=
 =?utf-8?B?Y2JaMDhWL0M1eUlwNGFqNFU2MVhiQTd4Tlg3d21OKytMeVNydm1hVDZMelYr?=
 =?utf-8?B?Sm9idjRWcEJVTmlRelg5TDBnelhKNE0yanIzWm9NVEtQUUMwMHBINGZqZU53?=
 =?utf-8?B?QVJqaERXWEswd1ZVbXpPaVhGRUx2REtSbnJDbDlSbWV1WnphemVsbGdpSFk3?=
 =?utf-8?B?VlFBQitFaHB4U1dDU25YRmxaMVFNakx6NEdIcUc5dEppMDBDVlRjeGZzc08z?=
 =?utf-8?B?UXVJWlREYzhGTnFJUE9Ia3lkZUdTVTgxelVZOFU5aHlaQWFHbEh4Zm5HRFlB?=
 =?utf-8?B?YjBFMHNyM28yTW1kYXVzWW52L1lSdjk1dUR4aWg1WlpvamJCZlQxY005OGIw?=
 =?utf-8?B?eFBMcGUxc0ZoK3F5ZU15M3ZrcmI4S3h3Q2xrcXI1UEZrZmFubUtDRFNUVlA5?=
 =?utf-8?B?RDlDdGNGc3ZYcHUxTGtOZDh0bldocU1ZdVBhL2hqbTZML2xPQlEzckJvaUxE?=
 =?utf-8?B?VlBMcVgybEp1QjRXYzhwQnZ6NUhQQ2hkL09WNnl5TDdoMGVLOUM3Tm5sa0hL?=
 =?utf-8?B?T0F3dnpPZHhrSVBWZy9nTElQSktWbU1VM0Vydzlucjk3MWVQT2h0cDRVRnRO?=
 =?utf-8?B?OGw2dlJvNzJsL3dtNFJSMU9ySDErWkVBdTRQcGFCYnVodnhQVDVFZFdxR3Zl?=
 =?utf-8?B?aTRjMGJQNVJGcjVqcm44Ym4vbFcySVVNTjl3cFppdHNLNWd2am1VSDBoMHlG?=
 =?utf-8?B?RElyVEF6Y2ZLWUUvUUtkeGp6RWxxSDkraHVBK3pJMFNQdkFjZDNQZmZkTFht?=
 =?utf-8?B?LzZRei83Z1lzeW10S1c3dHVTR1hwajZvQThJREhuZ3IxQXBpRlNUcW13c2JC?=
 =?utf-8?B?ZHdIR2dNaEYzaTJNRGxhb2ZiVnp6OGFJSkliOExFdlhkdTczdncvZFZJTmZE?=
 =?utf-8?B?YkpkbTVlU21SNHZ3ODBQR242SnVnZGdmUmNHeitJLzVTWmszaFQvUlY5d2x4?=
 =?utf-8?B?RnpQQ2xXQzdwa0dDN2VrQzNXR1JIMG94bmZZemNkOXd2QzlqaEd4NkZkTGQ4?=
 =?utf-8?B?eGtJS3ZxejVVS1VwSnUreUxZbmZEK0hSL1V1L0R0QXh3RzFKaXpXMEFpZVE4?=
 =?utf-8?B?dVZJZGtUdlZRMjl3N2wzWXNOSHhNOWZmWGthNGFUWEt0VC81M0hlSzF3NXRm?=
 =?utf-8?B?VUZYUmlpMzFpcEtnL2YvazVOVEVUSUE1OTN5ZDVhei9CQkV3NXI2YU8rbEtR?=
 =?utf-8?B?K3ZkaGhtZUFHK1I2azc4M3l5T3MxZXlWSEpRbGxCWUVPa3NMK3AxREFpdUQ4?=
 =?utf-8?B?KzhtelI5Nk8rMGhXM1N0a0hvRE5FNm82SzU2MlRnTGZtTDNZNmhaZzZyeG1H?=
 =?utf-8?B?dEN4N0xuZFlBVnQreW5JaVZ1N2NORzY4ZXB1a3BhdUR3TUJZSVUwcldWbnRy?=
 =?utf-8?B?bGNSbEFicllaOWg2b3NhMm1OaEY0TEN6cUpoWk41YVhVcG0ySFJCcXk3ZlFi?=
 =?utf-8?B?eEJJekpOZDNUUGtHMWh6SHdXUUhYU3RXS0tPZ1Jqdm1lU3JJdFBkVmc5ZjdH?=
 =?utf-8?B?ZDY0NEU4QzBJOS9lTHVqK1o5UDZteDAreUZMbms3bmxnS2JZOTV6OTgyemx6?=
 =?utf-8?B?NXZHWldUa2JudkJHbHdxdE5YeVB0MUduWlZ5S1IyNGg1aHFDenAwd2hiUTc2?=
 =?utf-8?B?dzZMWlFlMGowRWRTU1FZZHFoN0Nqc3c2V1pFZjJvYW5wb0ZNSnhLY1VHT3pU?=
 =?utf-8?B?VFZrb0o4WW1XT2FnejUzY1gxdlpxSWNFdVpMM0U1NVBVNGpwVmxKdE1ZdkVq?=
 =?utf-8?Q?PXpZHCqwc0ynMq8LYKq5iXoR3?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 98c6332b-8062-4826-1163-08de25be2457
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR12MB5673.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2025 09:46:12.3235 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 01PDWoE5zfZabnnq+i8Ouh2xEA3kcRV7q5nJhc/xD23ysXm4nSRbySb86kfbCd/R
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB9448
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
> This will allow the use of all of them for clear/fill buffer
> operations.
> Since drm_sched_entity_init requires a scheduler array, we
> store schedulers rather than rings. For the few places that need
> access to a ring, we can get it from the sched using container_of.
> 
> Since the code is the same for all sdma versions, add a new
> helper amdgpu_sdma_set_buffer_funcs_scheds to set buffer_funcs_scheds
> based on the number of sdma instances.
> 
> Note: the new sched array is identical to the amdgpu_vm_manager one.
> These 2 could be merged.

I realized a bit after we discussed it that this isn't true.

We need the two arrays separated for a Navi 1x workaround to work correctly.

Anyway, that doesn't affect reviewing this patch here.

> 
> Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu.h           |  2 +
>  drivers/gpu/drm/amd/amdgpu/amdgpu_benchmark.c |  4 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c    |  8 ++--
>  drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c       |  4 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c       | 41 +++++++++++++++----
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h       |  3 +-
>  drivers/gpu/drm/amd/amdgpu/cik_sdma.c         |  3 +-
>  drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c        |  3 +-
>  drivers/gpu/drm/amd/amdgpu/sdma_v3_0.c        |  3 +-
>  drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c        |  6 +--
>  drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c      |  6 +--
>  drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c        |  6 +--
>  drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c        |  6 +--
>  drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c        |  3 +-
>  drivers/gpu/drm/amd/amdgpu/sdma_v7_0.c        |  3 +-
>  drivers/gpu/drm/amd/amdgpu/si_dma.c           |  3 +-
>  drivers/gpu/drm/amd/amdkfd/kfd_migrate.c      |  3 +-
>  17 files changed, 62 insertions(+), 45 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> index 3fab3dc9f3e4..05c13fb0e6bf 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> @@ -1615,6 +1615,8 @@ ssize_t amdgpu_get_soft_full_reset_mask(struct amdgpu_ring *ring);
>  ssize_t amdgpu_show_reset_mask(char *buf, uint32_t supported_reset);
>  void amdgpu_sdma_set_vm_pte_scheds(struct amdgpu_device *adev,
>  				   const struct amdgpu_vm_pte_funcs *vm_pte_funcs);
> +void amdgpu_sdma_set_buffer_funcs_scheds(struct amdgpu_device *adev,
> +					 const struct amdgpu_buffer_funcs *buffer_funcs);
>  
>  /* atpx handler */
>  #if defined(CONFIG_VGA_SWITCHEROO)
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_benchmark.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_benchmark.c
> index b59040a8771f..9ea927e07a77 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_benchmark.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_benchmark.c
> @@ -32,12 +32,14 @@ static int amdgpu_benchmark_do_move(struct amdgpu_device *adev, unsigned size,
>  				    uint64_t saddr, uint64_t daddr, int n, s64 *time_ms)
>  {
>  	ktime_t stime, etime;
> +	struct amdgpu_ring *ring;
>  	struct dma_fence *fence;
>  	int i, r;
>  
> +	ring = container_of(adev->mman.buffer_funcs_scheds[0], struct amdgpu_ring, sched);

We have the to_amdgpu_ring() macro for that.

> +
>  	stime = ktime_get();
>  	for (i = 0; i < n; i++) {
> -		struct amdgpu_ring *ring = adev->mman.buffer_funcs_ring;
>  		r = amdgpu_copy_buffer(ring, &adev->mman.default_entity.base,
>  				       saddr, daddr, size, NULL, &fence,
>  				       false, 0);
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> index b92234d63562..1927d940fbca 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> @@ -3303,7 +3303,7 @@ static int amdgpu_device_ip_init(struct amdgpu_device *adev)
>  	if (r)
>  		goto init_failed;
>  
> -	if (adev->mman.buffer_funcs_ring->sched.ready)
> +	if (adev->mman.buffer_funcs_scheds[0]->ready)
>  		amdgpu_ttm_set_buffer_funcs_status(adev, true);
>  
>  	/* Don't init kfd if whole hive need to be reset during init */
> @@ -4143,7 +4143,7 @@ static int amdgpu_device_ip_resume(struct amdgpu_device *adev)
>  
>  	r = amdgpu_device_ip_resume_phase2(adev);
>  
> -	if (adev->mman.buffer_funcs_ring->sched.ready)
> +	if (adev->mman.buffer_funcs_scheds[0]->ready)

We should probably drop that check here and move this into amdgpu_ttm_set_buffer_funcs_status().

>  		amdgpu_ttm_set_buffer_funcs_status(adev, true);
>  
>  	if (r)
> @@ -4493,7 +4493,7 @@ int amdgpu_device_init(struct amdgpu_device *adev,
>  	adev->num_rings = 0;
>  	RCU_INIT_POINTER(adev->gang_submit, dma_fence_get_stub());
>  	adev->mman.buffer_funcs = NULL;
> -	adev->mman.buffer_funcs_ring = NULL;
> +	adev->mman.num_buffer_funcs_scheds = 0;
>  	adev->vm_manager.vm_pte_funcs = NULL;
>  	adev->vm_manager.vm_pte_num_scheds = 0;
>  	adev->gmc.gmc_funcs = NULL;
> @@ -5965,7 +5965,7 @@ int amdgpu_device_reinit_after_reset(struct amdgpu_reset_context *reset_context)
>  				if (r)
>  					goto out;
>  
> -				if (tmp_adev->mman.buffer_funcs_ring->sched.ready)
> +				if (tmp_adev->mman.buffer_funcs_scheds[0]->ready)
>  					amdgpu_ttm_set_buffer_funcs_status(tmp_adev, true);
>  
>  				r = amdgpu_device_ip_resume_phase3(tmp_adev);
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c
> index 2713dd51ab9a..4433d8620129 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c
> @@ -651,12 +651,14 @@ int amdgpu_gmc_allocate_vm_inv_eng(struct amdgpu_device *adev)
>  void amdgpu_gmc_flush_gpu_tlb(struct amdgpu_device *adev, uint32_t vmid,
>  			      uint32_t vmhub, uint32_t flush_type)
>  {
> -	struct amdgpu_ring *ring = adev->mman.buffer_funcs_ring;
> +	struct amdgpu_ring *ring;
>  	struct amdgpu_vmhub *hub = &adev->vmhub[vmhub];
>  	struct dma_fence *fence;
>  	struct amdgpu_job *job;
>  	int r, i;
>  
> +	ring = container_of(adev->mman.buffer_funcs_scheds[0], struct amdgpu_ring, sched);
> +
>  	if (!hub->sdma_invalidation_workaround || vmid ||
>  	    !adev->mman.buffer_funcs_enabled || !adev->ib_pool_ready ||
>  	    !ring->sched.ready) {
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> index 6c333dba7a35..11fec0fa4c11 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> @@ -308,7 +308,7 @@ static int amdgpu_ttm_copy_mem_to_mem(struct amdgpu_device *adev,
>  				      struct dma_resv *resv,
>  				      struct dma_fence **f)
>  {
> -	struct amdgpu_ring *ring = adev->mman.buffer_funcs_ring;
> +	struct amdgpu_ring *ring;
>  	struct amdgpu_res_cursor src_mm, dst_mm;
>  	struct dma_fence *fence = NULL;
>  	int r = 0;
> @@ -321,6 +321,8 @@ static int amdgpu_ttm_copy_mem_to_mem(struct amdgpu_device *adev,
>  		return -EINVAL;
>  	}
>  
> +	ring = container_of(adev->mman.buffer_funcs_scheds[0], struct amdgpu_ring, sched);
> +
>  	amdgpu_res_first(src->mem, src->offset, size, &src_mm);
>  	amdgpu_res_first(dst->mem, dst->offset, size, &dst_mm);
>  
> @@ -1493,6 +1495,7 @@ static int amdgpu_ttm_access_memory_sdma(struct ttm_buffer_object *bo,
>  	struct amdgpu_bo *abo = ttm_to_amdgpu_bo(bo);
>  	struct amdgpu_device *adev = amdgpu_ttm_adev(abo->tbo.bdev);
>  	struct amdgpu_res_cursor src_mm;
> +	struct amdgpu_ring *ring;
>  	struct amdgpu_job *job;
>  	struct dma_fence *fence;
>  	uint64_t src_addr, dst_addr;
> @@ -1530,7 +1533,8 @@ static int amdgpu_ttm_access_memory_sdma(struct ttm_buffer_object *bo,
>  	amdgpu_emit_copy_buffer(adev, &job->ibs[0], src_addr, dst_addr,
>  				PAGE_SIZE, 0);
>  
> -	amdgpu_ring_pad_ib(adev->mman.buffer_funcs_ring, &job->ibs[0]);
> +	ring = container_of(adev->mman.buffer_funcs_scheds[0], struct amdgpu_ring, sched);
> +	amdgpu_ring_pad_ib(ring, &job->ibs[0]);
>  	WARN_ON(job->ibs[0].length_dw > num_dw);
>  
>  	fence = amdgpu_job_submit(job);
> @@ -2196,11 +2200,9 @@ u32 amdgpu_ttm_set_buffer_funcs_status(struct amdgpu_device *adev, bool enable)
>  		return windows;
>  
>  	if (enable) {
> -		struct amdgpu_ring *ring;
>  		struct drm_gpu_scheduler *sched;
>  
> -		ring = adev->mman.buffer_funcs_ring;
> -		sched = &ring->sched;
> +		sched = adev->mman.buffer_funcs_scheds[0];
>  		r = drm_sched_entity_init(&adev->mman.default_entity.base,
>  					  DRM_SCHED_PRIORITY_KERNEL, &sched,
>  					  1, NULL);
> @@ -2432,7 +2434,7 @@ int amdgpu_ttm_clear_buffer(struct amdgpu_bo *bo,
>  			    struct dma_fence **fence)
>  {
>  	struct amdgpu_device *adev = amdgpu_ttm_adev(bo->tbo.bdev);
> -	struct amdgpu_ring *ring = adev->mman.buffer_funcs_ring;
> +	struct amdgpu_ring *ring;
>  	struct amdgpu_ttm_buffer_entity *entity;
>  	struct amdgpu_res_cursor cursor;
>  	u64 addr;
> @@ -2443,6 +2445,8 @@ int amdgpu_ttm_clear_buffer(struct amdgpu_bo *bo,
>  
>  	if (!fence)
>  		return -EINVAL;
> +
> +	ring = container_of(adev->mman.buffer_funcs_scheds[0], struct amdgpu_ring, sched);
>  	entity = &adev->mman.clear_entities[0];
>  	*fence = dma_fence_get_stub();
>  
> @@ -2494,9 +2498,9 @@ int amdgpu_fill_buffer(struct amdgpu_ttm_buffer_entity *entity,
>  		       u64 k_job_id)
>  {
>  	struct amdgpu_device *adev = amdgpu_ttm_adev(bo->tbo.bdev);
> -	struct amdgpu_ring *ring = adev->mman.buffer_funcs_ring;
>  	struct dma_fence *fence = NULL;
>  	struct amdgpu_res_cursor dst;
> +	struct amdgpu_ring *ring;
>  	int r, e;
>  
>  	if (!adev->mman.buffer_funcs_enabled) {
> @@ -2505,6 +2509,8 @@ int amdgpu_fill_buffer(struct amdgpu_ttm_buffer_entity *entity,
>  		return -EINVAL;
>  	}
>  
> +	ring = container_of(adev->mman.buffer_funcs_scheds[0], struct amdgpu_ring, sched);
> +
>  	if (entity == NULL) {
>  		e = atomic_inc_return(&adev->mman.next_clear_entity) %
>  				      adev->mman.num_clear_entities;
> @@ -2579,6 +2585,27 @@ int amdgpu_ttm_evict_resources(struct amdgpu_device *adev, int mem_type)
>  	return ttm_resource_manager_evict_all(&adev->mman.bdev, man);
>  }
>  
> +void amdgpu_sdma_set_buffer_funcs_scheds(struct amdgpu_device *adev,
> +					 const struct amdgpu_buffer_funcs *buffer_funcs)
> +{
> +	struct amdgpu_vmhub *hub = &adev->vmhub[AMDGPU_GFXHUB(0)];
> +	struct drm_gpu_scheduler *sched;
> +	int i;
> +
> +	adev->mman.buffer_funcs = buffer_funcs;
> +
> +	for (i = 0; i < adev->sdma.num_instances; i++) {
> +		if (adev->sdma.has_page_queue)
> +			sched = &adev->sdma.instance[i].page.sched;
> +		else
> +			sched = &adev->sdma.instance[i].ring.sched;
> +		adev->mman.buffer_funcs_scheds[i] = sched;
> +	}
> +
> +	adev->mman.num_buffer_funcs_scheds = hub->sdma_invalidation_workaround ?
> +		1 : adev->sdma.num_instances;
> +}
> +

Probably better to make all SDMA version switch to use amdgpu_sdma_set_buffer_funcs_scheds() one patch and then changing amdgpu_sdma_set_buffer_funcs_scheds() to use more than one DMA engine a second patch.

Regards,
Christian.

>  #if defined(CONFIG_DEBUG_FS)
>  
>  static int amdgpu_ttm_page_pool_show(struct seq_file *m, void *unused)
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
> index 4844f001f590..63c3e2466708 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
> @@ -66,7 +66,8 @@ struct amdgpu_mman {
>  
>  	/* buffer handling */
>  	const struct amdgpu_buffer_funcs	*buffer_funcs;
> -	struct amdgpu_ring			*buffer_funcs_ring;
> +	struct drm_gpu_scheduler		*buffer_funcs_scheds[AMDGPU_MAX_RINGS];
> +	u32					num_buffer_funcs_scheds;
>  	bool					buffer_funcs_enabled;
>  
>  	struct mutex				gtt_window_lock;
> diff --git a/drivers/gpu/drm/amd/amdgpu/cik_sdma.c b/drivers/gpu/drm/amd/amdgpu/cik_sdma.c
> index 5fe162f52c92..a36385ad8da8 100644
> --- a/drivers/gpu/drm/amd/amdgpu/cik_sdma.c
> +++ b/drivers/gpu/drm/amd/amdgpu/cik_sdma.c
> @@ -1333,8 +1333,7 @@ static const struct amdgpu_buffer_funcs cik_sdma_buffer_funcs = {
>  
>  static void cik_sdma_set_buffer_funcs(struct amdgpu_device *adev)
>  {
> -	adev->mman.buffer_funcs = &cik_sdma_buffer_funcs;
> -	adev->mman.buffer_funcs_ring = &adev->sdma.instance[0].ring;
> +	amdgpu_sdma_set_buffer_funcs_scheds(adev, &cik_sdma_buffer_funcs);
>  }
>  
>  static const struct amdgpu_vm_pte_funcs cik_sdma_vm_pte_funcs = {
> diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c b/drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c
> index 63636643db3d..4a3ba136a36c 100644
> --- a/drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c
> +++ b/drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c
> @@ -1228,8 +1228,7 @@ static const struct amdgpu_buffer_funcs sdma_v2_4_buffer_funcs = {
>  
>  static void sdma_v2_4_set_buffer_funcs(struct amdgpu_device *adev)
>  {
> -	adev->mman.buffer_funcs = &sdma_v2_4_buffer_funcs;
> -	adev->mman.buffer_funcs_ring = &adev->sdma.instance[0].ring;
> +	amdgpu_sdma_set_buffer_funcs_scheds(adev, &sdma_v2_4_buffer_funcs);
>  }
>  
>  static const struct amdgpu_vm_pte_funcs sdma_v2_4_vm_pte_funcs = {
> diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v3_0.c b/drivers/gpu/drm/amd/amdgpu/sdma_v3_0.c
> index 0153626b5df2..3cf527bcadf6 100644
> --- a/drivers/gpu/drm/amd/amdgpu/sdma_v3_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/sdma_v3_0.c
> @@ -1670,8 +1670,7 @@ static const struct amdgpu_buffer_funcs sdma_v3_0_buffer_funcs = {
>  
>  static void sdma_v3_0_set_buffer_funcs(struct amdgpu_device *adev)
>  {
> -	adev->mman.buffer_funcs = &sdma_v3_0_buffer_funcs;
> -	adev->mman.buffer_funcs_ring = &adev->sdma.instance[0].ring;
> +	amdgpu_sdma_set_buffer_funcs_scheds(adev, &sdma_v3_0_buffer_funcs);
>  }
>  
>  static const struct amdgpu_vm_pte_funcs sdma_v3_0_vm_pte_funcs = {
> diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c b/drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c
> index 96a67b30854c..7e106baecad5 100644
> --- a/drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c
> @@ -2608,11 +2608,7 @@ static const struct amdgpu_buffer_funcs sdma_v4_0_buffer_funcs = {
>  
>  static void sdma_v4_0_set_buffer_funcs(struct amdgpu_device *adev)
>  {
> -	adev->mman.buffer_funcs = &sdma_v4_0_buffer_funcs;
> -	if (adev->sdma.has_page_queue)
> -		adev->mman.buffer_funcs_ring = &adev->sdma.instance[0].page;
> -	else
> -		adev->mman.buffer_funcs_ring = &adev->sdma.instance[0].ring;
> +	amdgpu_sdma_set_buffer_funcs_scheds(adev, &sdma_v4_0_buffer_funcs);
>  }
>  
>  static const struct amdgpu_vm_pte_funcs sdma_v4_0_vm_pte_funcs = {
> diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c b/drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c
> index 04dc8a8f4d66..7cb0e213bab2 100644
> --- a/drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c
> +++ b/drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c
> @@ -2309,11 +2309,7 @@ static const struct amdgpu_buffer_funcs sdma_v4_4_2_buffer_funcs = {
>  
>  static void sdma_v4_4_2_set_buffer_funcs(struct amdgpu_device *adev)
>  {
> -	adev->mman.buffer_funcs = &sdma_v4_4_2_buffer_funcs;
> -	if (adev->sdma.has_page_queue)
> -		adev->mman.buffer_funcs_ring = &adev->sdma.instance[0].page;
> -	else
> -		adev->mman.buffer_funcs_ring = &adev->sdma.instance[0].ring;
> +	amdgpu_sdma_set_buffer_funcs_scheds(adev, &sdma_v4_4_2_buffer_funcs);
>  }
>  
>  static const struct amdgpu_vm_pte_funcs sdma_v4_4_2_vm_pte_funcs = {
> diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c b/drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c
> index 19c717f2c602..eab09c5fc762 100644
> --- a/drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c
> @@ -2066,10 +2066,8 @@ static const struct amdgpu_buffer_funcs sdma_v5_0_buffer_funcs = {
>  
>  static void sdma_v5_0_set_buffer_funcs(struct amdgpu_device *adev)
>  {
> -	if (adev->mman.buffer_funcs == NULL) {
> -		adev->mman.buffer_funcs = &sdma_v5_0_buffer_funcs;
> -		adev->mman.buffer_funcs_ring = &adev->sdma.instance[0].ring;
> -	}
> +	if (adev->mman.buffer_funcs == NULL)
> +		amdgpu_sdma_set_buffer_funcs_scheds(adev, &sdma_v5_0_buffer_funcs);
>  }
>  
>  static const struct amdgpu_vm_pte_funcs sdma_v5_0_vm_pte_funcs = {
> diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c b/drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c
> index 7a07b8f4e86d..e843da1dce59 100644
> --- a/drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c
> +++ b/drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c
> @@ -2076,10 +2076,8 @@ static const struct amdgpu_buffer_funcs sdma_v5_2_buffer_funcs = {
>  
>  static void sdma_v5_2_set_buffer_funcs(struct amdgpu_device *adev)
>  {
> -	if (adev->mman.buffer_funcs == NULL) {
> -		adev->mman.buffer_funcs = &sdma_v5_2_buffer_funcs;
> -		adev->mman.buffer_funcs_ring = &adev->sdma.instance[0].ring;
> -	}
> +	if (adev->mman.buffer_funcs == NULL)
> +		amdgpu_sdma_set_buffer_funcs_scheds(adev, &sdma_v5_2_buffer_funcs);
>  }
>  
>  static const struct amdgpu_vm_pte_funcs sdma_v5_2_vm_pte_funcs = {
> diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c b/drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c
> index 8f8228c7adee..d078bff42983 100644
> --- a/drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c
> @@ -1884,8 +1884,7 @@ static const struct amdgpu_buffer_funcs sdma_v6_0_buffer_funcs = {
>  
>  static void sdma_v6_0_set_buffer_funcs(struct amdgpu_device *adev)
>  {
> -	adev->mman.buffer_funcs = &sdma_v6_0_buffer_funcs;
> -	adev->mman.buffer_funcs_ring = &adev->sdma.instance[0].ring;
> +	amdgpu_sdma_set_buffer_funcs_scheds(adev, &sdma_v6_0_buffer_funcs);
>  }
>  
>  static const struct amdgpu_vm_pte_funcs sdma_v6_0_vm_pte_funcs = {
> diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v7_0.c b/drivers/gpu/drm/amd/amdgpu/sdma_v7_0.c
> index cf412d8fb0ed..77ad6f128e75 100644
> --- a/drivers/gpu/drm/amd/amdgpu/sdma_v7_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/sdma_v7_0.c
> @@ -1826,8 +1826,7 @@ static const struct amdgpu_buffer_funcs sdma_v7_0_buffer_funcs = {
>  
>  static void sdma_v7_0_set_buffer_funcs(struct amdgpu_device *adev)
>  {
> -	adev->mman.buffer_funcs = &sdma_v7_0_buffer_funcs;
> -	adev->mman.buffer_funcs_ring = &adev->sdma.instance[0].ring;
> +	amdgpu_sdma_set_buffer_funcs_scheds(adev, &sdma_v7_0_buffer_funcs);
>  }
>  
>  static const struct amdgpu_vm_pte_funcs sdma_v7_0_vm_pte_funcs = {
> diff --git a/drivers/gpu/drm/amd/amdgpu/si_dma.c b/drivers/gpu/drm/amd/amdgpu/si_dma.c
> index 863e00086c30..4f6d7eeceb37 100644
> --- a/drivers/gpu/drm/amd/amdgpu/si_dma.c
> +++ b/drivers/gpu/drm/amd/amdgpu/si_dma.c
> @@ -826,8 +826,7 @@ static const struct amdgpu_buffer_funcs si_dma_buffer_funcs = {
>  
>  static void si_dma_set_buffer_funcs(struct amdgpu_device *adev)
>  {
> -	adev->mman.buffer_funcs = &si_dma_buffer_funcs;
> -	adev->mman.buffer_funcs_ring = &adev->sdma.instance[0].ring;
> +	amdgpu_sdma_set_buffer_funcs_scheds(adev, &si_dma_buffer_funcs);
>  }
>  
>  static const struct amdgpu_vm_pte_funcs si_dma_vm_pte_funcs = {
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
> index 943c3438c7ee..3f7b85aabb72 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
> @@ -129,13 +129,14 @@ svm_migrate_copy_memory_gart(struct amdgpu_device *adev, dma_addr_t *sys,
>  			     struct dma_fence **mfence)
>  {
>  	const u64 GTT_MAX_PAGES = AMDGPU_GTT_MAX_TRANSFER_SIZE;
> -	struct amdgpu_ring *ring = adev->mman.buffer_funcs_ring;
> +	struct amdgpu_ring *ring;
>  	struct amdgpu_ttm_buffer_entity *entity;
>  	u64 gart_s, gart_d;
>  	struct dma_fence *next;
>  	u64 size;
>  	int r;
>  
> +	ring = container_of(adev->mman.buffer_funcs_scheds[0], struct amdgpu_ring, sched);
>  	entity = &adev->mman.move_entities[0];
>  
>  	mutex_lock(&entity->gart_window_lock);

