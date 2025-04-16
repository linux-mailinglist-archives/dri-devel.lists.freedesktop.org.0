Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43335A8B8B1
	for <lists+dri-devel@lfdr.de>; Wed, 16 Apr 2025 14:17:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41D7710E8D8;
	Wed, 16 Apr 2025 12:17:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Zcxq1jvY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2070.outbound.protection.outlook.com [40.107.100.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B04C10E8D8;
 Wed, 16 Apr 2025 12:17:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ocASmo2f/npOuxqy5mz1sbpYG45pErDOxaqllG6HZu39E1ukWSPBvLoEECg7CZBs5nBwyeOhTXu5mPkwUVYUTWPiom/ip+HK/DKU/eHx4A/Jx5S6UGuwgTt867qZ5qfg2R8v1k+/msIXTa528JWFNtog6OcE6eSv9yPdrstYxu4M30lQ62bqH8U6vxEausp1/JQGpX1j7SrfEEJ6lkx6szU83djYM91gha9YTcdjSZkvkKn2M/1u/9ok1gVsqsh+B6J+AhBx8vrrPvzhgmQhKxl5iAotxUb7Z1isZGO8kU4ldDxZhdPrVUmEIxtsDDYtmkc3eLsDtaaiao6XZ5ZYOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wKNJg+pVDd1+R/lE70T3OzJAFwfyRNgF4xjMopKU3ko=;
 b=V4RGC4kAjn08FsmCCp53VxoYeYZ83cybKnBZzKUL9JX9Xb3Tvd6ZVnyLGtyOm79qJKQ2zrhAWl/L+A1Mmu9obNUvj8dgmAh6oV+gpiAsCj21+8ycyUiyEgvP0c6RZU8fBTUumTnSAwhP5k5lSO2wpiIvl+C08Z3zFAVWgE5w4vw/UHAzmvR6i3LZ/784yuEjNBx8sLMi3owfmIsqGM5/bqlhi3F10JYAJvhf2YMYuZ1kWmf+EwrP/iUtOLLUEfYU1av7nkvsxl1vtBiFiR8SK/A6teVK2TGlnQoWu4NdQ4hzcjxUGL7pGa/2LqKdwCjBaHTTyR5ATIQ1KGKAzouE0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wKNJg+pVDd1+R/lE70T3OzJAFwfyRNgF4xjMopKU3ko=;
 b=Zcxq1jvYYcn1Kaia4pbjc0NortGlEcsQS/WcC3AENLvPI/sEkWsr7XHDuPYVfqSyP3WmHppk7zc2iQXQlIVLml4TTunSBOC4B/OjX9wvbgYRilul7xD1ruHeDj6bvyF3a8fZQ5DbzhnzqbpxBxJM48pyOn4J1XtTcSmW4pLkJDY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5753.namprd12.prod.outlook.com (2603:10b6:208:390::15)
 by MW5PR12MB5598.namprd12.prod.outlook.com (2603:10b6:303:193::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.32; Wed, 16 Apr
 2025 12:17:05 +0000
Received: from BL1PR12MB5753.namprd12.prod.outlook.com
 ([fe80::2b0e:7fc3:1d21:5d2e]) by BL1PR12MB5753.namprd12.prod.outlook.com
 ([fe80::2b0e:7fc3:1d21:5d2e%3]) with mapi id 15.20.8655.021; Wed, 16 Apr 2025
 12:17:04 +0000
Message-ID: <1f4545fb-ed9c-4f4c-a19e-53c3faf37579@amd.com>
Date: Wed, 16 Apr 2025 17:46:59 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] drm/amdgpu: use drm_file_err in logging to also
 dump process information
To: Pierre-Eric Pelloux-Prayer <pierre-eric@damsy.net>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Sunil Khatri <sunil.khatri@amd.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Cc: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
References: <20250415184318.2465197-1-sunil.khatri@amd.com>
 <20250415184318.2465197-3-sunil.khatri@amd.com>
 <34b082d4-b320-4eb3-8b36-fb63ffca3730@igalia.com>
 <ec6f48cc-9776-4912-b746-ee18edb3536b@amd.com>
 <896721aa-e6c2-4da1-ba2e-6f52aea52615@damsy.net>
Content-Language: en-US
From: "Khatri, Sunil" <sukhatri@amd.com>
In-Reply-To: <896721aa-e6c2-4da1-ba2e-6f52aea52615@damsy.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2P287CA0014.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:21b::8) To BL1PR12MB5753.namprd12.prod.outlook.com
 (2603:10b6:208:390::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5753:EE_|MW5PR12MB5598:EE_
X-MS-Office365-Filtering-Correlation-Id: 75480afc-05ba-4f71-68cd-08dd7ce09924
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZlZoL0k1ZDg4MU9XV1l5VHBPRFlaRFhtTEQ2SjVSYVN3VzJZTnVENmprWHJ1?=
 =?utf-8?B?TE0raG12NzVkbTgzNVFJNVp6VXNaMkJUaDdqS2lyL1NEeGxobnJ6czRub3JR?=
 =?utf-8?B?RHVLakRvcjB4WmpCb2E0dWpKY0RBU1RSVVM4L1hWVUNDOVlaeXYyZnVzRFFZ?=
 =?utf-8?B?TWU3NlVUKzlHUyswdENrNTVYT0p1ZUF4aUYyZEV1aHpLbGdtcEoyOG5PUEp4?=
 =?utf-8?B?NDVLQXVzQkUrVnBqWnJwRFRjVzhOWE5RTElTWG9uWkt6TEYwWGRrYXFHME80?=
 =?utf-8?B?OGdBc1lUbllDZm03OGd5VzBnMlNrYUkxNGpHeCsrY2VyTDNRVVNMYnhpY1Jx?=
 =?utf-8?B?eVJDanBJSEE2M0NjKzYxRmZOYmhHOXNXbkg4YkhxWVV6eUltd2VNaXdZUWJD?=
 =?utf-8?B?SlFhMS94Ny9KMnllT3Rwa3lVdm8vaFBiRVJyVGNoQWxtOGhOeW1lZnpsNDNy?=
 =?utf-8?B?ZWpPVTFydlBEUkJMZHRxQXhxSml4cURQdzl2dE8zazdGTXhZM1NQM0R1Vmgw?=
 =?utf-8?B?OGN0VEE5WFBaM005Zm0yb1dTb3dwM3U5RG53YVBic2d3V0hjLzBLSVp4UU5R?=
 =?utf-8?B?U2k4enB3M3ZmdHM4aHc2dDNFbURmOWVHcGs4a1lyMjNITUFGclA0cjVMNWp4?=
 =?utf-8?B?VVp2THgzMWJ2NjRJeDFJMUZYdmhTZHdJRGxISTJjVTRGbkR1Si9lN0pXelBa?=
 =?utf-8?B?Z0ZiZDUvNVlFVllJcDFhZFJwWDhGTEtqbUVkdGM1N1RpMnNMcktoK3Q0Ly9h?=
 =?utf-8?B?YzgxTnZzTTZoelFVWTNSbk4rQWx0RnVPTnR5M21XeE8reHFBVWdtQ3FYbFN4?=
 =?utf-8?B?WW16KzJKZy9VMHBDN2RFbCt4aTRJRmFKSHVybFY4dkNjSEMxVEJwbWdXTWdG?=
 =?utf-8?B?Qkc4UzZWbnNqSzdoemNKSy85SDdYV3ZWRnRveUhEM2EybnFyNEx2RjZTR0Z1?=
 =?utf-8?B?UGg0anVEa2MwbEtDdEdIY1JHNXVkQk9sYzA4dis5bHZJVEJ5Q0ZYajYrOERQ?=
 =?utf-8?B?NjJCMHhBNElHS1hLOTl2VkdIVzFkTjYzbWpwL0ZtYVpLVmd6OXFXTnpRYTYz?=
 =?utf-8?B?Q3R1UGs4Y3NMQkJ0WjJKV3A5eFJXOHVRb3IxWUoyVEVuTTRmZm8yS1VUWHpK?=
 =?utf-8?B?UTFTaGpXMlZwdlRNcjQ3REw3R3AyN1BKNy9ZYXZUYi9uOGVVeEFnYmhmK0Jo?=
 =?utf-8?B?d3FKQ2UvUWt2SXdQMWV4bHN3SUdERFFld0sxd0dRVGRYRzRsQzhkWGxwZ3pQ?=
 =?utf-8?B?T1FnSjkzVVhYbXZ2UmpTbzlrVzlYdDJyY3dLT3RnS1F6VklnZFEvTVFBbnNp?=
 =?utf-8?B?WEN3Vk02YVFhQ1pEMUdhZU1tbTdPNGFqbTdzYzA2NERZWlEvS29OYTdUOEs0?=
 =?utf-8?B?OVg4M0NicDRGaDNJL3JzOVBTQzc2K3Jtd0hqRDVIYXgvaHQvcEJDOVdsTFU3?=
 =?utf-8?B?dFY1RUVrOHdyQ1NTeTY3ckg1N0RoT1k4b21SSEhPR0dSSktpVGpwdVdXK3ds?=
 =?utf-8?B?a0xETWNtbmFoY3JEd09xd3BKSUFnV2l2dkJYcm83NlRUdHFYeXdMUis4R1pO?=
 =?utf-8?B?QUFyZmNwMWVpL2VTN25IcXZ6WG5UeWdVbGovb0laeHV3Z1JLRVgzdmQzRHdI?=
 =?utf-8?B?dDdpeXE0aFZBTUxITXA5VUV4VzRsVGVmUnZjZFdFUzZtSXJvYmhhSEtpR3V1?=
 =?utf-8?B?TGxDWkRSeWRjWDFBclVkUkJuTnl2QUV3RHNjT1lDQlpleTJ5SjJsdVhQWkJl?=
 =?utf-8?B?Rm1LbXh1aXY2VFVTWmlPcTNZdHdhR0lvMnhFMlJIZ2xRSmVlUHhvZlo2aHBp?=
 =?utf-8?B?bFpZQ3hiTnVBL3NtMXRzVHI4RHVaaGdXRkNSZ2RlbGMxMjIzZTl1S0tiRmZj?=
 =?utf-8?B?MUt5dnpjMGM2MlJ5bW5LRStmOFBmR3pBOGRUalVGNGhmU1BnaERncWRzNzM0?=
 =?utf-8?Q?kQjZzQgCRYk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5753.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WGdiUUw0NVFiYnhqM1d0RVBSV2FTKzBNN29vV0d6MVhHZEQwQU1ELzdjNHdy?=
 =?utf-8?B?UUpmQnFVYnlaVFQyNFBkZk9WaU1sYjYyNDZGbEszdWVZU1J0UXdoamt2VDFD?=
 =?utf-8?B?M0RiN09yRlJ3RUtmYVJLaGJFdGFWMlpaNmVaUlIyU2EzTFV5aXpqWXpHNWNz?=
 =?utf-8?B?Y0VGOU8rT3ZWTmtmcVN3SktTV2JUeDlDUW9WZUhyTHhLdXFZd1hPdlBJK2I3?=
 =?utf-8?B?R2E3aUFOd3R0UmtmclB2cldQeEx6bzY3NHhzQzhMekRIekFnblpOUWF5UzVG?=
 =?utf-8?B?eTc0SmlldmNxSGNYODRyWGZIR1l3am1xaHU0QUdmOUhodkFCUnpIbU02WFVx?=
 =?utf-8?B?ZUNOdWNiV2k0UENyZVdUMy9zR3A0WTBLY1djTWRxaWFua2lBdUNkajQ0RWM3?=
 =?utf-8?B?amdRZWdHeTNtRzJzV0JYRHlYOE02dEJ2K1VmNXlPS0ZFMVBTeis3dGt5OGJY?=
 =?utf-8?B?S1p3UFJKVnF4bGRpSUFnUUZScVF2SCtYZWFBU2R5Ykx4MlR6dy9jbVRmdkRZ?=
 =?utf-8?B?dVpjbUt2QmwwTUdIVkMzRmFEbE4ya3VUQnNxMFFDbUh2U0FsaEFEZWlhQlh3?=
 =?utf-8?B?VXlQTi9Cd1Z0MDNPb1VWN0ErSzBuY0duUWxtZXB6a3JLeHJlTTNsM2Rhb2NX?=
 =?utf-8?B?VXZBY2htbHhnOTJOOVlGQnRieEZzdlk0YTV1MzlIaDZUNjZVR3IwRkMwOUxi?=
 =?utf-8?B?eG14Myt4S3dNRGF0c25hMnZkdDlBSlU2WHlaMC9kRUpLUE56V0FsU2NBOGp3?=
 =?utf-8?B?clJZRXc1N3VkNzF1TGI2Z2d2NXJKUkt3WGlwMjAyNmNmYnY2T0pRNk9qUDhS?=
 =?utf-8?B?QUs3Z0k4NDJoWW5jNmFHMlVVRDdtL0dXaFNFelQ0YmhkUmRXcWYrNXZIbldx?=
 =?utf-8?B?MDRPQmV5MlBBNWZYZk1pZEZCREhFUDVRTXZhMDVTVXpPNlp6QXQvajVnejBC?=
 =?utf-8?B?RCt0OUM2RXRReW1sRWh5UFAvRDJKRWgySVVkdkVnMFg4UWgvQXVjZDBlOThp?=
 =?utf-8?B?YVZzWVp0Y29yVUd4ZCs1TTdtaXVIZFJpUFRjZnRqMHkwSGVvTGlUYm5ydVlz?=
 =?utf-8?B?a3QyQWdCNEp5ZHAxeEpsaGpTdTlZbzFkWmQyRHo4K2pyd2hqdFpja0NPQ1JD?=
 =?utf-8?B?R1dsUVpWdFhjbU9UOUdzVFc5SGdlUGdaZmZIRm9GYUtPOWVUdTRGSmlWUndT?=
 =?utf-8?B?VWJaeElDQnBQYXltdEc3K1BKbWVtbDNUbGRSUzRrSlVEay84U0NUZlNuTEJO?=
 =?utf-8?B?OENkWTNUUlRvVUdOUm44ZlVPakZqNFFpbisxUlU4QlpwZ1JuNUhXLzJya3VU?=
 =?utf-8?B?Y25KOGpHNXBtN0F6Mk9sUUNPRHdyOGttMDNIV1lwMXkxVDRGQk13KzJhMWJl?=
 =?utf-8?B?QjB1cUVkWXlxRHdMMW9pQkFnN2U1NTBBT3Z0TXl5NHZ5UCtMNXRHYS9ISTdO?=
 =?utf-8?B?U3hhTzdzT2pmTlJDQXZMeGtUeVp1STd1TnRBNzNaaUtBNjllN2pMWllpcUhL?=
 =?utf-8?B?OWVlLzEvTzNHZ2tGNFlvRlI0TmFKMzd4NWg3TWc0L3JheFgyVnBkSFRzVDQ1?=
 =?utf-8?B?NFJYMFUzRi80Wm1yQlAvMWx2VzN3RVFESFVINkpFb3BjVy85MUhHc3ZKazFD?=
 =?utf-8?B?R0tqMnRWOTlZV2gvZDAxbzAwNkM2SkNLRE1rTmQ5ZXRyaEtPeUpnaCsvRkpH?=
 =?utf-8?B?RkpyREZocVVsanRGcTBpUkV6azhrZ2QvQjh4aTgyTXJ1b29XZWJMcGQ3ZWRP?=
 =?utf-8?B?cTdSeWZJSWhRQ2ZMT2c0RHUvQ3VJY1pJVUhMT2QyeWs5TGkvd2pSMmhXV1dO?=
 =?utf-8?B?OWIra2RQT2N0SS8wRGNvTkRPdlpldlRsNU1jZ044bHY4d3ZEaURzeGlWMDJa?=
 =?utf-8?B?eDVnbXNjeDNCUW56aXFnKzdLVkxCdm5jYWh2K2lKaEJjbGpuT2VORnE1SUVj?=
 =?utf-8?B?MjdkMEMxeDBrQkl5T3dzcnZtQWVFZTFRSWFRaTZsNGU0dFB2TUlrb0Rmd013?=
 =?utf-8?B?RTFSZEVYOU5BbVRhQzZmV0hqekhHN3ZPRkJoZkN0UGdDalZMK0pMMWJrdytX?=
 =?utf-8?B?RnlKQVhlTEhRc09QamMxWk1HcjQwQkoxZkNXWWUrVVQ5ai9jOVZzVUFvbXc5?=
 =?utf-8?Q?nRWQpVrVouifWjlDJir22JD2+?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 75480afc-05ba-4f71-68cd-08dd7ce09924
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5753.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2025 12:17:04.3351 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: unGeRZIXxPebhmCUJ5bydKVNLHufcFCgveZC2s24zPT+DYlENjhXsvp5xI7CuC6FH8Sl/HH9KZRo8CrzaKcrBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR12MB5598
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


On 4/16/2025 5:37 PM, Pierre-Eric Pelloux-Prayer wrote:
> Hi,
>
> Le 16/04/2025 à 12:01, Khatri, Sunil a écrit :
>>
>> On 4/16/2025 12:56 PM, Tvrtko Ursulin wrote:
>>>
>>> On 15/04/2025 19:43, Sunil Khatri wrote:
>>>> add process and pid information in the userqueue error
>>>> logging to make it more useful in resolving the error
>>>> by logs.
>>>>
>>>> Sample log:
>>>> [   42.444297] [drm:amdgpu_userqueue_wait_for_signal [amdgpu]] 
>>>> *ERROR* Timed out waiting for fence f=000000001c74d978 for 
>>>> comm:Xwayland pid:3427
>>>> [   42.444669] [drm:amdgpu_userqueue_suspend [amdgpu]] *ERROR* Not 
>>>> suspending userqueue, timeout waiting for comm:Xwayland pid:3427
>>>> [   42.824729] [drm:amdgpu_userqueue_wait_for_signal [amdgpu]] 
>>>> *ERROR* Timed out waiting for fence f=0000000074407d3e for 
>>>> comm:systemd-logind pid:1058
>>>> [   42.825082] [drm:amdgpu_userqueue_suspend [amdgpu]] *ERROR* Not 
>>>> suspending userqueue, timeout waiting for comm:systemd-logind pid:1058
>>>>
>>>> Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
>>>> ---
>>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_userqueue.c | 14 ++++++++------
>>>>   1 file changed, 8 insertions(+), 6 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_userqueue.c 
>>>> b/drivers/gpu/drm/amd/amdgpu/ amdgpu_userqueue.c
>>>> index 1867520ba258..05c1ee27a319 100644
>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_userqueue.c
>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_userqueue.c
>>>> @@ -43,7 +43,7 @@ amdgpu_userqueue_cleanup(struct amdgpu_userq_mgr 
>>>> *uq_mgr,
>>>>       if (f && !dma_fence_is_signaled(f)) {
>>>>           ret = dma_fence_wait_timeout(f, true, 
>>>> msecs_to_jiffies(100));
>>>>           if (ret <= 0) {
>>>> -            DRM_ERROR("Timed out waiting for fence f=%p\n", f);
>>>> +            drm_file_err(uq_mgr->file, "Timed out waiting for 
>>>> fence f=%p\n", f);
>>>
>>> You decided to leave %p after all?
>>
>> Yes we are printing the fence ptr here to see which fence is timing 
>> out. Anyways right now intention of this patch is to add additional 
>> process information along with existing information like fence here.
>>
>
> I agree with Tvrtko, "fence=%llu:%llu" would be better to identify 
> "which fence is timing out".

I agree to it for sure, just that there are other places also where we 
are printing fence ptr and will take that up in another patch.

Regards
Sunil Khatri

>
>
> Pierre-Eric
>
>
>> regards
>> Sunil
>>
>>>
>>>>               return;
>>>>           }
>>>>       }
>>>> @@ -440,7 +440,8 @@ amdgpu_userqueue_resume_all(struct 
>>>> amdgpu_userq_mgr *uq_mgr)
>>>>       }
>>>>         if (ret)
>>>> -        DRM_ERROR("Failed to map all the queues\n");
>>>> +        drm_file_err(uq_mgr->file, "Failed to map all the queue\n");
>>>
>>> You lost the plural by accident.
>> Yes i will add 's'. Noted.
>>>
>> I am also not sure "all the queues" makes sense in this context 
>> versus "all queues" but it's inconsequential really.
>> Regards
>> Sunil
>>> Yes it all queues from a uq_mgr.
>>>> +
>>>>       return ret;
>>>>   }
>>>>   @@ -598,7 +599,8 @@ amdgpu_userqueue_suspend_all(struct 
>>>> amdgpu_userq_mgr *uq_mgr)
>>>>       }
>>>>         if (ret)
>>>> -        DRM_ERROR("Couldn't unmap all the queues\n");
>>>> +        drm_file_err(uq_mgr->file, "Couldn't unmap all the 
>>>> queues\n");
>>>> +
>>>>       return ret;
>>>>   }
>>>>   @@ -615,7 +617,7 @@ amdgpu_userqueue_wait_for_signal(struct 
>>>> amdgpu_userq_mgr *uq_mgr)
>>>>               continue;
>>>>           ret = dma_fence_wait_timeout(f, true, 
>>>> msecs_to_jiffies(100));
>>>>           if (ret <= 0) {
>>>> -            DRM_ERROR("Timed out waiting for fence f=%p\n", f);
>>>> +            drm_file_err(uq_mgr->file, "Timed out waiting for 
>>>> fence f=%p\n", f);
>>>>               return -ETIMEDOUT;
>>>>           }
>>>>       }
>>>> @@ -634,13 +636,13 @@ amdgpu_userqueue_suspend(struct 
>>>> amdgpu_userq_mgr *uq_mgr,
>>>>       /* Wait for any pending userqueue fence work to finish */
>>>>       ret = amdgpu_userqueue_wait_for_signal(uq_mgr);
>>>>       if (ret) {
>>>> -        DRM_ERROR("Not suspending userqueue, timeout waiting for 
>>>> work\n");
>>>> +        drm_file_err(uq_mgr->file, "Not suspending userqueue, 
>>>> timeout waiting\n");
>>>>           return;
>>>>       }
>>>>         ret = amdgpu_userqueue_suspend_all(uq_mgr);
>>>>       if (ret) {
>>>> -        DRM_ERROR("Failed to evict userqueue\n");
>>>> +        drm_file_err(uq_mgr->file, "Failed to evict userqueue\n");
>>>>           return;
>>>
>>> It is pre-existing but strikes me as odd that failure to 
>>> amdgpu_userqueue_suspend_all() logs a failure to *evict* instead of 
>>> suspend (as the previous log does). Anyway, I did not look at the 
>>> surrounding code so just thinking out loud.
>>
>> Yes suspend failed as all the fences were not evicted and thats why 
>> suspend failed. Anyways there are already alex patches which will 
>> change this to unmap as a code reorganisation for suspend/resume is 
>> in pipeline.
>>
>> regards
>>
>> Sunil
>>
>>>
>>> Regards,
>>>
>>> Tvrtko
>>>
>>>>       }
>>>
