Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF830C632C5
	for <lists+dri-devel@lfdr.de>; Mon, 17 Nov 2025 10:30:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A98310E370;
	Mon, 17 Nov 2025 09:30:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="fDBHfP9m";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazon11011071.outbound.protection.outlook.com [52.101.62.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A12E610E370;
 Mon, 17 Nov 2025 09:30:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q9UWT9DXdmxQEYvo54QU+u0y6XcSsyRcm+1v7reADuc4TRTwDyjQpQqeFXVmOaoTNPsrNqXsHfG9zDCti7VB2wXsdHUGm9G7Lj1b7UaKzfDMaYOfPe45nFtnRWH23NYb11FquqMxYh6uuWR65MwPNYpTrjzmBbvsfVXdEu1/fi64c/iQI3viH96fuxyf8sqQAdi5DdUYHjXr2TNrI/s1sHrgXWc4waHEzwZ9KGD89FgtGmRlIoCQ0hnqlDOO7QlIeNIL/E39jHLFzBFmaRVJjIY7k6bKc6E8Z+Fhzqt0+4Aqs+05FSXe8428ThixOWIHqcVI9wJYgeNjwaLbAEGKRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6Dd1nIUJIVv15YcJPN3SvPoEAu68iPyCMMLtLiNiCx8=;
 b=U+dgNtizksfGDqgeL5z9aO3fSc6FGIMuKKoTq7YMFlV7oNVemvBfzBLsSo6aBnSN4NW+68pE9AExftnzpjiQEdFkBLEz8yzYw/7w/wrSB1v+Nqbov4a+yJoBpTajct++QQ+94hkdMZAA4bd1SeWX4Kx9MfKk5mFsEZ/d9ac5E/kWehaIyO50pfjEPSyS0kGuiKHzzV9CZ1j1/twtSBawjlwOs3HklMFaD6WDm4kdO1vqMAZerNFsZUaChC8kALF3BxFwiM/51Zo6yHcFtqtBYcimU4ImL8ZuN6vtwy9YQF/UUpephxe+bLm92vp7CI4W1MAY4nrplDNZiEjVvV+FiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6Dd1nIUJIVv15YcJPN3SvPoEAu68iPyCMMLtLiNiCx8=;
 b=fDBHfP9mLMLJWhS6RFEVvVMxuJjJMRZURfE9QHE+xhRnIyxk6P+QPZiI3jBqDsSACKHeiXv6GAsKZElVQQW3rYa68AQaEh0wF9TmvseoNZEbhQh7YvHDk8LT86PQLxK1zv7ern6ns9TYB8PoGro6DyzsX9qjqYpYZuO/9p38C0Q=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by IA0PPF52B16157D.namprd12.prod.outlook.com
 (2603:10b6:20f:fc04::bce) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.22; Mon, 17 Nov
 2025 09:30:09 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9320.021; Mon, 17 Nov 2025
 09:30:09 +0000
Message-ID: <b339a6bb-ecd1-4e86-a861-cc2b78f153be@amd.com>
Date: Mon, 17 Nov 2025 10:30:02 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 14/20] drm/amdgpu: introduce
 amdgpu_sdma_set_vm_pte_scheds
To: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20251113160632.5889-1-pierre-eric.pelloux-prayer@amd.com>
 <20251113160632.5889-15-pierre-eric.pelloux-prayer@amd.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20251113160632.5889-15-pierre-eric.pelloux-prayer@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BN9PR03CA0742.namprd03.prod.outlook.com
 (2603:10b6:408:110::27) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|IA0PPF52B16157D:EE_
X-MS-Office365-Filtering-Correlation-Id: be5f19a8-fa6e-460e-ce7f-08de25bbe65a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VGZxTUVSNHV5ck03U3BKaDZFYVN3ZjVsdysxQmlRdGxseXYvQmYrWUFkTzVq?=
 =?utf-8?B?VThpbDdBQk01VmtSWUtHOGZldE1sTW92aXpqVzlZN21tcFpyQmV5UE5Ld1Q5?=
 =?utf-8?B?elBpazZ5Z2gyNXdYU2hMa1NuZko2Y2w4WUxGeXNnZWIvUmFJd1Npc254YkdH?=
 =?utf-8?B?WG1IVDVWdzdqRkIyZmpib1o3ZnJQUnBTR2lsR05EOVJrY0ZyN252ejNuOE1O?=
 =?utf-8?B?UDZYSkJNVTRpTUxtUFVNSmpEV1VRWklsc3BxWDU5KytGQUpjVWpjdFkyK2I2?=
 =?utf-8?B?Y2Z5azB5WUtnWVVxRmJBUk85MjdQa2cvaUYza2JrUVRlWVFOYmpvMzNpNWRO?=
 =?utf-8?B?NHQ2bzVOa281Q1JrWVpaSjYwSEdFRFhJdTNzYmVXZE1ZdGNzNm90NVNwcDRx?=
 =?utf-8?B?ZG9tRjNhWjJ5UU51YXRKcXdyK3ZWLzdWWHgvZllQWkprckR2cW9HN0NGa0xR?=
 =?utf-8?B?ZTJHMmEyMERnUFNpRTEvb1dFN1MyMy9aUVhPNExzVWhmaWhnNjRCMTdyajBG?=
 =?utf-8?B?enRSa2JXREJIdVFINHZ4ZzUybXJ6ZUgrQzc3NXpFTGRMRjd2QU9XcjhvRG9E?=
 =?utf-8?B?aGExMzU0WENPVGpTbmtZMmFpNitRZ2pjMnBFazF0NHVKZGxwc3RVbHZsWXph?=
 =?utf-8?B?NEZIdlZ1ZDF0OHQxYms0a3BGeDZGLzlBS3FQV1Y5N2lVV1llYjF0ZEZFWGdk?=
 =?utf-8?B?ZlZ5NzdVYnF5bTRFTDhweWUxS1pHMjlSRytwb2tHNWkzUkNQTVRTYmhHOUhx?=
 =?utf-8?B?VDAzUW5BaGMxWSt0QjNESmtkZG5BMFFrUWdHY0NIc1pQbU9GS3Q5bG8xVDYx?=
 =?utf-8?B?Vng0OHlIYXBsaWdtVlB3WHF1WlpSajRJcUozcUdHOEhpbGtVUVBDWmhsMk1o?=
 =?utf-8?B?OG90T3h1NmJtSDFRbGwxUUcvTEIwRUJEV3JPQUs3cVlsQnRnZnNkdjZoS3g1?=
 =?utf-8?B?L2NzQy9VV0s0b1U2YUZDNndEaG90anArQXRmYW9wejZyaVhEUDYzSnowWEg5?=
 =?utf-8?B?RCs5M3dNU2JNYVA1ZVN0bDk5Q29OODNRSmZqSlAySmI1dEQzalM2ZWVFUVRM?=
 =?utf-8?B?WVpCVGIwRWd1eUZOblI0MTF2L0t5Rmg3c0krRFpmSHJkZ0Q3dVg0eTVKeGN6?=
 =?utf-8?B?MUhsejllQWtQaldGOVpkbHZGakhVYVh6YnRCNlY2bTl4OFhlTVhTVzZsY0NE?=
 =?utf-8?B?dlhlbGdEaEZSTWt5aGtoeFRnQnhUWUxtSVdPaCticCtuUUNzZ3NvM0x5d0ZO?=
 =?utf-8?B?MjdnZXJ1MmVYUGhEeFBHalRwdmFnVHEwMExIRnBwU3JtbnE1YTZnTi9OZzR2?=
 =?utf-8?B?b004TEtPWmZlSWZ1ODJqS2hBc0JFSWdXM3pmQm9ROG42M1FIdnJ0Tm8yWUVX?=
 =?utf-8?B?T1U4Q0V3UlJZN2E0akVpdWJ5SjlzWE1NYURORGF1NW8ya0pPVkoxUytNRmpV?=
 =?utf-8?B?elM0UERxd1l5RkhmbDFXZTIzcEpUQlVSem16R0VoZFhoTS9xV0lzRjNJdTM5?=
 =?utf-8?B?MjdDa2pyKzVKRzE0RFROQmwvSnlROVRibEpMSldGSWtjd3JrcXZ5bXhiWlJ2?=
 =?utf-8?B?aEtPV09GTi90RkVXb3J1UXNwcWRNQW1Udm02Q0ZXUUtIaXVmeGVYcysxV3RP?=
 =?utf-8?B?VnU3b3UrNHdhWXJOZGdpcDhHbWZydmhlSkJOQWFNcXlzOURvVVpzcUtlYTNl?=
 =?utf-8?B?dk9pSnp3V3ZpRW1SL0JPUHBxZ2xZYU50MmFPN0YvK0I2ZnBrcndsTnl2NjFL?=
 =?utf-8?B?WFpseGtzSGFGcHlZeDIxNnJqajFQUUdPZGd6MSt0OGI4WGF0WW1VYlNlVDNZ?=
 =?utf-8?B?UzZhRjMvQ00wTjZvMVRnSW0wRGs3djhqci9STDhMZTFDbFU4VDBrT0N5OHdR?=
 =?utf-8?B?MVVtV1ZTVUJDb0dkL29UTGN0V3Brd3gzc201UlBZMW5rYTZ0d1F0SU5RMDh4?=
 =?utf-8?Q?1j91n4BhRPiEXrITpKShP1AsNacY9xGL?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NFlsQkp0VE14ejRzY000aGx5Rks1S0RmTVB6UUgraTVXZWpWeldjcWJiME91?=
 =?utf-8?B?Vkx3ZnpIMEFJR0IwOVVBNEtZWW1aa3hjVUh0MWFwSXFySElFY1RvaHJGeTB6?=
 =?utf-8?B?K3R6Um55dTRBYlZwSnlxeThWWEhDWFNoOWgvUElZQ1ZvYlZ3Ly9aYStnRTJW?=
 =?utf-8?B?YjRzTjJwdkhINnZ3eXdsWHNCMVc4amh2SGgwWC93OG9LeTBKaW5SY0Y0bUdB?=
 =?utf-8?B?NzVHZGoyRUwrS3RvUUU1QXJneXIxNzBKYVFGbm9GRGs4Wk5neEhiVXViWkdW?=
 =?utf-8?B?WVJTYnpCMEdTV1U4SFIxWTN3Qk1QT3M4NlZBNUg3WEdkRU9rcEhWL3hPYms0?=
 =?utf-8?B?dzNEUFFidzJobG1OYnh2M2lucFFIMHB2eHRyR0htOTRQSGFnS3JubVV0em9h?=
 =?utf-8?B?Y1NDZ0tBRjNrS2FHajhtR2V1ck11SzJYR1hEZm9nRFJuNWliTG9ZQk44UVhI?=
 =?utf-8?B?Snlna1c1RkxKeGQrS012Z1ZvbURXd2FqSFplaVBYZmpOaHFEQ0pQdndESkYv?=
 =?utf-8?B?d05CL21XckRqdElaZm5qbDRQbzRXeHBMOTNtNnlqWlA4VU5YUGpROHR2THFt?=
 =?utf-8?B?SUc3Wk5HblNEekxweXE0TTNFTUgyNjdQL3FqRm9Pd2J4eHFvSjRzTXBDWURr?=
 =?utf-8?B?VDU3c2V4c25ZV2lYQThrRFBxVitHY2JmRVpsOHNFZ0hxZXpsaFpTbHFLalY1?=
 =?utf-8?B?Y08rVVpJS0RxSm0xOFdtcWc4OVgzaXo4RXpxUExZTmRCYk91dEsxRVpDYzgr?=
 =?utf-8?B?R1JsaFc0cTNRdnZzNVQzendOeVM3dVNaQVo2bnpwOElFT2dxZkhPZHp6L3RY?=
 =?utf-8?B?SG9ITmhGRThDN3RIZWVCcDMrZ1drRHFSQng0ajUzQWhuSGxwazF2SGFJaEtS?=
 =?utf-8?B?cFRyeFhrdUVXeG85NU8wcXJkcXRaK3VPb2xGMDNBbWdLTGdSTndRdzh6dUNp?=
 =?utf-8?B?R3JlaUNFQ0hnSTE1MndOU3hlc3NoeGR3Z1h1N21JeHNlcW16WU5pT3JWOFI4?=
 =?utf-8?B?cVpQaHZqK3V3YTZDQXNsYmNvVThHd2VXYW1VdWdnZ01YMWVFZ3lTSFdQVGxu?=
 =?utf-8?B?Q0p1NmlUeUZxRHlrSXJ1QmhWWXd1SmtBUVIzbGNqcG8xWkhINnAxYlRqemJr?=
 =?utf-8?B?UzR1OE85enA5U3RRc0tEaTNJdXhYYUJRcHZ0WTVBSm1mQ1dmb1gwU0hRRjIx?=
 =?utf-8?B?MGl6d3pzTjhSSFBlaGszTjdwTnhzeGRHaDEzOVA0U2cxcTh3eVhIcWVaZ3BU?=
 =?utf-8?B?K2s4NWFxcWdid0dFaElpSGk5UlZxN1hmTUlRTVpKN1JhNjd2SUR6Q3lxcjVM?=
 =?utf-8?B?WmZWbzQ2SzZONUNyQ2hUdVdCdDBOOHd5Um5ZNVRyQlI0TGNETStHTlN4a0tz?=
 =?utf-8?B?ZkFsNjZSa0VQOVFpRjRncDNsWFpEZ0tRYm9Xd2YxclEyM1RGWEJxYWEwNmRZ?=
 =?utf-8?B?NjdSekdJYm8xT3hmZnVtMzVCNm9lcFBiMkpTVjJhUy9tVjZtK1JNT2dIRnB2?=
 =?utf-8?B?VjY1M0hINmUrVEIrWEtpRG5BMkZCeXRTZzBST250OWYrZmRYTll6dFdQNS9l?=
 =?utf-8?B?R1JlTEhCeC9BNXZrTFVLV0ozNmVLKzVsRjhkRjk3dHloM21iMWVldERwMk5o?=
 =?utf-8?B?eWNrRC9WSUhqTzVCQ0tyOU1jcWo5V3ZyMmY3WExlNllPSTJHenM2bHBIdlN4?=
 =?utf-8?B?NktpcXJ0ZHdnTnQvYmFQM2tJcnJJWlJhY2VzYnRSdDh5R2xFVlpQQytOTW5j?=
 =?utf-8?B?dC9NNndWY0Nqc09sMjRQTEdNMVo3ejNWNlhJMmpsMUpUWjYrcmE0c2R5dFY3?=
 =?utf-8?B?YzcwWDFpdlJlaGdZalJXTGt4RGt2WU8raytjSDBYMUVxUmxuaXhGMTBPVGVs?=
 =?utf-8?B?aGs2c29PR2pCWGhFbkZyTHBEa1V4dTdSZUVXKzhHeUhZd3FzOFVWTU1GQThP?=
 =?utf-8?B?dFJ4NUlJazJoc3U0ek1sSVFySmExRG0zbVJMUUUzcUFxdHFpenpKZjFJNzJD?=
 =?utf-8?B?QUlzN05SdEtLOFB1dW1uL2xRNTFZVlZqREhVOFVWQ2FhZDJhT3Z0R3F0SXJx?=
 =?utf-8?B?Uko1WHZlK0pISmszUWpnS1ZpSFV5K1BQSXZjM3pHK0lsYk9TSVVnUGJ5MTla?=
 =?utf-8?Q?UJFYCYiK8jQv0Tisbd4AZFlUg?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be5f19a8-fa6e-460e-ce7f-08de25bbe65a
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2025 09:30:09.0249 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IIkL2k/JcZOaEEXjMnaZE6m/teu0TgTE3KnIG+YsZ1TBLYMBEYifs4qv70O41kLF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PPF52B16157D
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
> All sdma versions used the same logic, so add a helper and move the
> common code to a single place.
> 
> ---
> v2: pass amdgpu_vm_pte_funcs as well
> ---
> 
> Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu.h      |  2 ++
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c   | 17 +++++++++++++++++
>  drivers/gpu/drm/amd/amdgpu/cik_sdma.c    |  9 +--------
>  drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c   |  9 +--------
>  drivers/gpu/drm/amd/amdgpu/sdma_v3_0.c   |  9 +--------
>  drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c   | 13 +------------
>  drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c | 13 +------------
>  drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c   | 12 ++----------
>  drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c   | 12 ++----------
>  drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c   |  9 +--------
>  drivers/gpu/drm/amd/amdgpu/sdma_v7_0.c   |  9 +--------
>  drivers/gpu/drm/amd/amdgpu/si_dma.c      |  9 +--------
>  12 files changed, 31 insertions(+), 92 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> index 50079209c472..3fab3dc9f3e4 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> @@ -1613,6 +1613,8 @@ struct dma_fence *amdgpu_device_enforce_isolation(struct amdgpu_device *adev,
>  bool amdgpu_device_has_display_hardware(struct amdgpu_device *adev);
>  ssize_t amdgpu_get_soft_full_reset_mask(struct amdgpu_ring *ring);
>  ssize_t amdgpu_show_reset_mask(char *buf, uint32_t supported_reset);
> +void amdgpu_sdma_set_vm_pte_scheds(struct amdgpu_device *adev,
> +				   const struct amdgpu_vm_pte_funcs *vm_pte_funcs);
>  
>  /* atpx handler */
>  #if defined(CONFIG_VGA_SWITCHEROO)
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> index aaa44199e9f4..3d29c3642d1a 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> @@ -3210,3 +3210,20 @@ void amdgpu_vm_print_task_info(struct amdgpu_device *adev,
>  		task_info->process_name, task_info->tgid,
>  		task_info->task.comm, task_info->task.pid);
>  }
> +
> +void amdgpu_sdma_set_vm_pte_scheds(struct amdgpu_device *adev,
> +				   const struct amdgpu_vm_pte_funcs *vm_pte_funcs)
> +{
> +	struct drm_gpu_scheduler *sched;
> +	int i;
> +
> +	for (i = 0; i < adev->sdma.num_instances; i++) {
> +		if (adev->sdma.has_page_queue)
> +			sched = &adev->sdma.instance[i].page.sched;
> +		else
> +			sched = &adev->sdma.instance[i].ring.sched;
> +		adev->vm_manager.vm_pte_scheds[i] = sched;
> +	}
> +	adev->vm_manager.vm_pte_num_scheds = adev->sdma.num_instances;
> +	adev->vm_manager.vm_pte_funcs = vm_pte_funcs;
> +}
> diff --git a/drivers/gpu/drm/amd/amdgpu/cik_sdma.c b/drivers/gpu/drm/amd/amdgpu/cik_sdma.c
> index 9e8715b4739d..5fe162f52c92 100644
> --- a/drivers/gpu/drm/amd/amdgpu/cik_sdma.c
> +++ b/drivers/gpu/drm/amd/amdgpu/cik_sdma.c
> @@ -1347,14 +1347,7 @@ static const struct amdgpu_vm_pte_funcs cik_sdma_vm_pte_funcs = {
>  
>  static void cik_sdma_set_vm_pte_funcs(struct amdgpu_device *adev)
>  {
> -	unsigned i;
> -
> -	adev->vm_manager.vm_pte_funcs = &cik_sdma_vm_pte_funcs;
> -	for (i = 0; i < adev->sdma.num_instances; i++) {
> -		adev->vm_manager.vm_pte_scheds[i] =
> -			&adev->sdma.instance[i].ring.sched;
> -	}
> -	adev->vm_manager.vm_pte_num_scheds = adev->sdma.num_instances;
> +	amdgpu_sdma_set_vm_pte_scheds(adev, &cik_sdma_vm_pte_funcs);
>  }
>  
>  const struct amdgpu_ip_block_version cik_sdma_ip_block =
> diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c b/drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c
> index 92ce580647cd..63636643db3d 100644
> --- a/drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c
> +++ b/drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c
> @@ -1242,14 +1242,7 @@ static const struct amdgpu_vm_pte_funcs sdma_v2_4_vm_pte_funcs = {
>  
>  static void sdma_v2_4_set_vm_pte_funcs(struct amdgpu_device *adev)
>  {

I think we can also get rid of all those sdma_v*_set_vm_pte_funcs which are only a single line calls.

Regards,
Christian.

> -	unsigned i;
> -
> -	adev->vm_manager.vm_pte_funcs = &sdma_v2_4_vm_pte_funcs;
> -	for (i = 0; i < adev->sdma.num_instances; i++) {
> -		adev->vm_manager.vm_pte_scheds[i] =
> -			&adev->sdma.instance[i].ring.sched;
> -	}
> -	adev->vm_manager.vm_pte_num_scheds = adev->sdma.num_instances;
> +	amdgpu_sdma_set_vm_pte_scheds(adev, &sdma_v2_4_vm_pte_funcs);
>  }
>  
>  const struct amdgpu_ip_block_version sdma_v2_4_ip_block = {
> diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v3_0.c b/drivers/gpu/drm/amd/amdgpu/sdma_v3_0.c
> index 1c076bd1cf73..0153626b5df2 100644
> --- a/drivers/gpu/drm/amd/amdgpu/sdma_v3_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/sdma_v3_0.c
> @@ -1684,14 +1684,7 @@ static const struct amdgpu_vm_pte_funcs sdma_v3_0_vm_pte_funcs = {
>  
>  static void sdma_v3_0_set_vm_pte_funcs(struct amdgpu_device *adev)
>  {
> -	unsigned i;
> -
> -	adev->vm_manager.vm_pte_funcs = &sdma_v3_0_vm_pte_funcs;
> -	for (i = 0; i < adev->sdma.num_instances; i++) {
> -		adev->vm_manager.vm_pte_scheds[i] =
> -			 &adev->sdma.instance[i].ring.sched;
> -	}
> -	adev->vm_manager.vm_pte_num_scheds = adev->sdma.num_instances;
> +	amdgpu_sdma_set_vm_pte_scheds(adev, &sdma_v3_0_vm_pte_funcs);
>  }
>  
>  const struct amdgpu_ip_block_version sdma_v3_0_ip_block =
> diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c b/drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c
> index f38004e6064e..96a67b30854c 100644
> --- a/drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c
> @@ -2625,18 +2625,7 @@ static const struct amdgpu_vm_pte_funcs sdma_v4_0_vm_pte_funcs = {
>  
>  static void sdma_v4_0_set_vm_pte_funcs(struct amdgpu_device *adev)
>  {
> -	struct drm_gpu_scheduler *sched;
> -	unsigned i;
> -
> -	adev->vm_manager.vm_pte_funcs = &sdma_v4_0_vm_pte_funcs;
> -	for (i = 0; i < adev->sdma.num_instances; i++) {
> -		if (adev->sdma.has_page_queue)
> -			sched = &adev->sdma.instance[i].page.sched;
> -		else
> -			sched = &adev->sdma.instance[i].ring.sched;
> -		adev->vm_manager.vm_pte_scheds[i] = sched;
> -	}
> -	adev->vm_manager.vm_pte_num_scheds = adev->sdma.num_instances;
> +	amdgpu_sdma_set_vm_pte_scheds(adev, &sdma_v4_0_vm_pte_funcs);
>  }
>  
>  static void sdma_v4_0_get_ras_error_count(uint32_t value,
> diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c b/drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c
> index 36b1ca73c2ed..04dc8a8f4d66 100644
> --- a/drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c
> +++ b/drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c
> @@ -2326,18 +2326,7 @@ static const struct amdgpu_vm_pte_funcs sdma_v4_4_2_vm_pte_funcs = {
>  
>  static void sdma_v4_4_2_set_vm_pte_funcs(struct amdgpu_device *adev)
>  {
> -	struct drm_gpu_scheduler *sched;
> -	unsigned i;
> -
> -	adev->vm_manager.vm_pte_funcs = &sdma_v4_4_2_vm_pte_funcs;
> -	for (i = 0; i < adev->sdma.num_instances; i++) {
> -		if (adev->sdma.has_page_queue)
> -			sched = &adev->sdma.instance[i].page.sched;
> -		else
> -			sched = &adev->sdma.instance[i].ring.sched;
> -		adev->vm_manager.vm_pte_scheds[i] = sched;
> -	}
> -	adev->vm_manager.vm_pte_num_scheds = adev->sdma.num_instances;
> +	amdgpu_sdma_set_vm_pte_scheds(adev, &sdma_v4_4_2_vm_pte_funcs);
>  }
>  
>  /**
> diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c b/drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c
> index 7dc67a22a7a0..19c717f2c602 100644
> --- a/drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c
> @@ -2081,16 +2081,8 @@ static const struct amdgpu_vm_pte_funcs sdma_v5_0_vm_pte_funcs = {
>  
>  static void sdma_v5_0_set_vm_pte_funcs(struct amdgpu_device *adev)
>  {
> -	unsigned i;
> -
> -	if (adev->vm_manager.vm_pte_funcs == NULL) {
> -		adev->vm_manager.vm_pte_funcs = &sdma_v5_0_vm_pte_funcs;
> -		for (i = 0; i < adev->sdma.num_instances; i++) {
> -			adev->vm_manager.vm_pte_scheds[i] =
> -				&adev->sdma.instance[i].ring.sched;
> -		}
> -		adev->vm_manager.vm_pte_num_scheds = adev->sdma.num_instances;
> -	}
> +	if (adev->vm_manager.vm_pte_funcs == NULL)
> +		amdgpu_sdma_set_vm_pte_scheds(adev, &sdma_v5_0_vm_pte_funcs);
>  }
>  
>  const struct amdgpu_ip_block_version sdma_v5_0_ip_block = {
> diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c b/drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c
> index 3bd44c24f692..7a07b8f4e86d 100644
> --- a/drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c
> +++ b/drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c
> @@ -2091,16 +2091,8 @@ static const struct amdgpu_vm_pte_funcs sdma_v5_2_vm_pte_funcs = {
>  
>  static void sdma_v5_2_set_vm_pte_funcs(struct amdgpu_device *adev)
>  {
> -	unsigned i;
> -
> -	if (adev->vm_manager.vm_pte_funcs == NULL) {
> -		adev->vm_manager.vm_pte_funcs = &sdma_v5_2_vm_pte_funcs;
> -		for (i = 0; i < adev->sdma.num_instances; i++) {
> -			adev->vm_manager.vm_pte_scheds[i] =
> -				&adev->sdma.instance[i].ring.sched;
> -		}
> -		adev->vm_manager.vm_pte_num_scheds = adev->sdma.num_instances;
> -	}
> +	if (adev->vm_manager.vm_pte_funcs == NULL)
> +		amdgpu_sdma_set_vm_pte_scheds(adev, &sdma_v5_2_vm_pte_funcs);
>  }
>  
>  const struct amdgpu_ip_block_version sdma_v5_2_ip_block = {
> diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c b/drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c
> index db6e41967f12..8f8228c7adee 100644
> --- a/drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c
> @@ -1897,14 +1897,7 @@ static const struct amdgpu_vm_pte_funcs sdma_v6_0_vm_pte_funcs = {
>  
>  static void sdma_v6_0_set_vm_pte_funcs(struct amdgpu_device *adev)
>  {
> -	unsigned i;
> -
> -	adev->vm_manager.vm_pte_funcs = &sdma_v6_0_vm_pte_funcs;
> -	for (i = 0; i < adev->sdma.num_instances; i++) {
> -		adev->vm_manager.vm_pte_scheds[i] =
> -			&adev->sdma.instance[i].ring.sched;
> -	}
> -	adev->vm_manager.vm_pte_num_scheds = adev->sdma.num_instances;
> +	amdgpu_sdma_set_vm_pte_scheds(adev, &sdma_v6_0_vm_pte_funcs);
>  }
>  
>  const struct amdgpu_ip_block_version sdma_v6_0_ip_block = {
> diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v7_0.c b/drivers/gpu/drm/amd/amdgpu/sdma_v7_0.c
> index 326ecc8d37d2..cf412d8fb0ed 100644
> --- a/drivers/gpu/drm/amd/amdgpu/sdma_v7_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/sdma_v7_0.c
> @@ -1839,14 +1839,7 @@ static const struct amdgpu_vm_pte_funcs sdma_v7_0_vm_pte_funcs = {
>  
>  static void sdma_v7_0_set_vm_pte_funcs(struct amdgpu_device *adev)
>  {
> -	unsigned i;
> -
> -	adev->vm_manager.vm_pte_funcs = &sdma_v7_0_vm_pte_funcs;
> -	for (i = 0; i < adev->sdma.num_instances; i++) {
> -		adev->vm_manager.vm_pte_scheds[i] =
> -			&adev->sdma.instance[i].ring.sched;
> -	}
> -	adev->vm_manager.vm_pte_num_scheds = adev->sdma.num_instances;
> +	amdgpu_sdma_set_vm_pte_scheds(adev, &sdma_v7_0_vm_pte_funcs);
>  }
>  
>  const struct amdgpu_ip_block_version sdma_v7_0_ip_block = {
> diff --git a/drivers/gpu/drm/amd/amdgpu/si_dma.c b/drivers/gpu/drm/amd/amdgpu/si_dma.c
> index 7f18e4875287..863e00086c30 100644
> --- a/drivers/gpu/drm/amd/amdgpu/si_dma.c
> +++ b/drivers/gpu/drm/amd/amdgpu/si_dma.c
> @@ -840,14 +840,7 @@ static const struct amdgpu_vm_pte_funcs si_dma_vm_pte_funcs = {
>  
>  static void si_dma_set_vm_pte_funcs(struct amdgpu_device *adev)
>  {
> -	unsigned i;
> -
> -	adev->vm_manager.vm_pte_funcs = &si_dma_vm_pte_funcs;
> -	for (i = 0; i < adev->sdma.num_instances; i++) {
> -		adev->vm_manager.vm_pte_scheds[i] =
> -			&adev->sdma.instance[i].ring.sched;
> -	}
> -	adev->vm_manager.vm_pte_num_scheds = adev->sdma.num_instances;
> +	amdgpu_sdma_set_vm_pte_scheds(adev, &si_dma_vm_pte_funcs);
>  }
>  
>  const struct amdgpu_ip_block_version si_dma_ip_block =

