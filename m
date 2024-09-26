Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E88C298799B
	for <lists+dri-devel@lfdr.de>; Thu, 26 Sep 2024 21:21:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E742B10EBCD;
	Thu, 26 Sep 2024 19:21:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Y+lnoxOe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2057.outbound.protection.outlook.com [40.107.220.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2792E10EA74;
 Thu, 26 Sep 2024 19:21:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U6B/Vf8SzFfeb7pRhTCxCPLE1HER96OS/ZmmF0/mMGPU2w4y0E2B5OSGULIew+f4vVXM4YM4sasEiHtn57hbrsrWqqCJrbb8woaEFc1h8DisEf75cjGAGET82J9D5TefWSqm5WQwatQ+IUPnvdei+u0LAy2SF9118rkrm84wnZykRWLgGUMXZMbQ37aSA8CIdkZV1VOkfKlPynez6kVciAt1mgBiIOEGb7rndXaiNvYMNxV8hp6ctA5AUJqoSk7p7wCHQnGH4mvFQxnuZJU++W/DIien54nFZTmgs9hVhwQpjMulMExbS36n7t5HGl/s+NIdwwkb2kBEzaysUAyHhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lV0eZoIVGYtLKEpQKqB/0s6h1H+QQyH6pjGTDpss+v8=;
 b=V+CNrUXs6hloVB5xdqksxTbhFuijkNLVhQfszcRsqG/B+2p8ZIzrRw7+jxdltpoICmCL+BonmUa1+onrtXHxB6Qggn8orH+wXoJuZL2FSvhMCTDOhm1VG5/cCdJeqfLDk7MDTUmlmqQOxXE1tUb8jy37EusB5PigU0iHgeXqwlgUd+855KdhPacdNnvTZZkary/ZDd1SnyIkrcBZfKGdw+85Q7UCQNCniIQd+UB6OT9zBTzbemZ1wgt7UWZjBnnbKeR5U6ntcVJqJLwamZWfGY2e3uI35t/qMtpk+mMR0ATogvt2KunA1wkxIZjjC7kz+wGu2TWQgCztKUyYbXWKHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lV0eZoIVGYtLKEpQKqB/0s6h1H+QQyH6pjGTDpss+v8=;
 b=Y+lnoxOenfyJPP5PrWRhmj/qxun4AelfPWiVAr6pI3bTj32vIsoMQVk64s7LLlMl9VrDVqH4Wftpwxp6c6N6lk6XsJgM5hp7D7TaSDSvHbmaQsAfG8PS3mfUqJzfuBumKTaeA11UbPes9Na36GMUh9j3jokdrwOFgbA3Ge/VzKQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CH0PR12MB8486.namprd12.prod.outlook.com (2603:10b6:610:18a::10)
 by IA1PR12MB6284.namprd12.prod.outlook.com (2603:10b6:208:3e4::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.28; Thu, 26 Sep
 2024 19:21:16 +0000
Received: from CH0PR12MB8486.namprd12.prod.outlook.com
 ([fe80::cfe7:2803:1f0b:a8b4]) by CH0PR12MB8486.namprd12.prod.outlook.com
 ([fe80::cfe7:2803:1f0b:a8b4%4]) with mapi id 15.20.7982.022; Thu, 26 Sep 2024
 19:21:16 +0000
Message-ID: <61459cdf-a96d-4849-8667-097f33e36d86@amd.com>
Date: Thu, 26 Sep 2024 13:21:09 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 07/10] drm/amd/display: get SAD from drm_eld when
 parsing EDID caps
To: Mario Limonciello <mario.limonciello@amd.com>,
 Alexander Deucher <alexander.deucher@amd.com>, Melissa Wen <mwen@igalia.com>
Cc: kernel-dev@igalia.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, harry.wentland@amd.com, sunpeng.li@amd.com,
 Mark Pearson <mpearson-lenovo@squebb.ca>,
 "Broadworth, Mark" <Mark.Broadworth@amd.com>,
 "Wheeler, Daniel" <Daniel.Wheeler@amd.com>
References: <20240918213845.158293-1-mario.limonciello@amd.com>
 <20240918213845.158293-8-mario.limonciello@amd.com>
Content-Language: en-US
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <20240918213845.158293-8-mario.limonciello@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT3PR01CA0107.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:85::20) To CH0PR12MB8486.namprd12.prod.outlook.com
 (2603:10b6:610:18a::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR12MB8486:EE_|IA1PR12MB6284:EE_
X-MS-Office365-Filtering-Correlation-Id: 799653b3-53df-41ba-9b2c-08dcde606454
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dUg1WnFyWFJneG5kZ0xoeHpsRVhXYS82cmVvSWFranV3WDAvM2VPL0xFd0hm?=
 =?utf-8?B?WDRwM1dSU2ZzaGpFbHc4eFI5b1I5ZUx0OUdCQVpPelBCUUJEck5BK3dBSCtW?=
 =?utf-8?B?RUl2RTZtbEJCbFBucG1BektmeDJKdUwyaE81WUZ1YzdIb1BiUDlIcWloY3dU?=
 =?utf-8?B?VUhqV200VWxZVVpWNENuSkF3eC9nYnlOcFVyOGJRbDFxV25hK1V0OUVSVzJF?=
 =?utf-8?B?Mk9IamRtK05mQkFiejFnZTB1a1BUYWdQN0Z3bHU5OXBzK3VrNy9CM3R5eUdX?=
 =?utf-8?B?UVU0dlZMM0FLVTZyTmxlOWlnTEN1K0sxNmRZdFAyZmV6YmFtdmxBN0NnLzE0?=
 =?utf-8?B?R3YwWTJGdmN4eVlndUI3cldpQWtoTWQzWnZNTDhpS2dsN21JcXJRZGl0R3FQ?=
 =?utf-8?B?U2F4Q0ZQSnA2dVhFdHlTUjNLSUZrallvYzEwWlVLL0RYUVpsSkxjc1d5Ymlq?=
 =?utf-8?B?SG9aZmN4Ymo3eEtEM2VncEJMZzNtT1lSZzRQVmJpUkhJc1FwZ0tJMXhUMmp1?=
 =?utf-8?B?dTNZOEJuQ29saVFubzRyQ0UrRDVyRjNJMExGdERvY2NwZndGbytOZEZoR3NJ?=
 =?utf-8?B?QVN2Vk00cllDMDFvczMrWGI4anZHL3lsZ1ZEK3FaRklHa3hKU3JGV1V3ZzZ5?=
 =?utf-8?B?V09pd1RhU0tVaUNUbWd3aEVWcUJ3SCtRNnlucHI5cFNOTm40bVkzNmNrT1B3?=
 =?utf-8?B?U0E0NHhxMXEyUkRacGlOMzEwMVFFWGZHcFVqUW1UbGtiMndLNFJHalQwb1Ru?=
 =?utf-8?B?aU9WTFVnY3l1cnBMMnpRSFJDaklHbElRNEhQZXlDcEZGc3pIN1FLOGQxTTI3?=
 =?utf-8?B?cGdlTHdKY0ptalE3OVlCT3dPOHVhSWxVQ0phSGx0MUVKaHVzTk9RZTZEZ2F2?=
 =?utf-8?B?cWNmZGdOWldaODREUzUyMExncmRBT1R4aHd6dXNsVGIvdENlbEw1bWYzMTlJ?=
 =?utf-8?B?QzFZcXVJejBmWGVoZW4rbDZSc2gxWDA4SXJabS9VUlE0cENqMXRIMWR2MFkz?=
 =?utf-8?B?cFk1eE93YU1ETkJRNFltOVhaZG8yR3IvOU9ScFFDN3hUSnJGRHlwUmgvSkRJ?=
 =?utf-8?B?aXlCOU4wdmJIVmM4dmVMZHU3dHdCSDBlcmFKOUxsYUhmaFNFaU9hVTNHbUhv?=
 =?utf-8?B?cy9XQXVjZDV3Mm9GNy9TYnJvYU9iYWRYQTQzakZDUHNaTlYrOG5SNUVsT0Iz?=
 =?utf-8?B?cEpML0ZZK3FOZnlOVzN5ZW5VV2lTaHBaL1c4eEt5dXB1NW1odktHSlBsdHcx?=
 =?utf-8?B?S0NJc2pYUy8wQS9vMWdiRk5VM2xFeFJjRk9yb0w4Q1VjSmlLZ2hSTm8xZmFH?=
 =?utf-8?B?SmtVRlZMckZjQTdRNjM5WUVINW41V3dFdWlEMitBc01yZzR4QzI0NjFOYVZa?=
 =?utf-8?B?R3EzNHE1YzdhaDBVUjRJclMxdUtYN2MwZlpzMVgveHMvVzhjdG9XUHY5U1gr?=
 =?utf-8?B?WTlObkNyUHJUU2dzdWViREdIdm9zUllCWGZadGVpOXJjalVaM3V0Z2xvOEFK?=
 =?utf-8?B?RkVoVDY0aVFVYzBRK0I2c2U5OTJ0K1NRL1YxbVVidjR2c25sT1NwQ1U2REZ4?=
 =?utf-8?B?eXFybGcxT0pLaDJ1T2k1bnNIK0l6MWlaN2ZDaUJRM0M0R2xlTGlDZU55Wmhn?=
 =?utf-8?B?Wk15UE00QTh6K054d3pBR2o2d1c5TW00VUg3WlZjMGlqSVlUTEFvK3hiNXZG?=
 =?utf-8?B?TDhWN1VQSnhmOE1kcXpnK0lES2lSYlRJa1hmS0I0RTRtTWlVR2ZjK2t2cTdm?=
 =?utf-8?B?YXBRK244aytvUjFCZEt1OUlQSEROdHlGVCttRWhaMzFQQnV4L2Q2VmRRMFBY?=
 =?utf-8?B?T0JZcXc5QWNUKzQyYisrQT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR12MB8486.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z0I3dmZCMkVMenE3V3JZZXQxSlJaOVFESlc0cW9iM2d4OUt3NkhiN2VQZGs2?=
 =?utf-8?B?Ynlyb1RIWVRkdTc2WU9KNFI0WEtuMWt6NHFwbmtTWmxmaFFSc01rMVZqektx?=
 =?utf-8?B?bTNBREFDQkRUMHdmeUNoRDQ5UFRyNTgyL1RGbzZkRGJwOERPUzhDNUh4ditB?=
 =?utf-8?B?MU9ZOHpRU0JYZGlaSllEUmhNdlVIZDh4d2svM1VLZXJiSzNtd1drQm5lYVFG?=
 =?utf-8?B?b2JGVGdIdUtuU3c3VWZTUjNHa0I5aTVodEZRa3g5NlJ4ek5lUW9ib3RoMGxV?=
 =?utf-8?B?UU95VTNHSktwSVhFckdPT1F0WTdpN09QSHJveUFvclNCUDQvdDFCYzlNTSt1?=
 =?utf-8?B?T0xjK1UrQnlNdEwyVE4reS9JOXd6REhqUVFiNkE2WVdKOVZJK3dMNzN1eGVF?=
 =?utf-8?B?QjBFQ2pEK0N5bDdKZkVtQ1FyY3I1SXEzTjZxVEgxNGRGREhwUDhNTkg3TkhT?=
 =?utf-8?B?RURTdG5OcXozZnFNa3Bnc2lTVG90TzJQTnBKSUJ0a1NGOVVSNUt3Z05hcVBx?=
 =?utf-8?B?aXZTZHJqYjNCRlFFcUkzTklRWng0TmpHMFcyWXBoVkJ2RTl3QXR5aCt1N202?=
 =?utf-8?B?UDNqNjlHSTE2U1A4akNCeGhmbDdPMkl2a29lVC9Bbk1KcDlGRjYxeEhnWlQx?=
 =?utf-8?B?UUMwN0hsT0dCa0lONjhwSCtJeENFRk4vME4zZ3RzQm1oK2QvdW5QWHFOZklP?=
 =?utf-8?B?b2NiekI5Z2o3ajRCVXVVN3N2T3ZKUk9abm9lbXBWYlNBSXVoZUJEUzVDbFBJ?=
 =?utf-8?B?ekUyYmpwaDY5b2RUUzJQNDBYZjhyY2xTMXZLNVlJTG9uYmFHcUhZQ2pmdUNG?=
 =?utf-8?B?N0JaL3RnZWdsYlVaY2kvbDJ1aDRZQkk1SVUvcSt0MEludUh2K3RyNlpjY0Mw?=
 =?utf-8?B?dHhhZnFBWC9qNEs0bG1hOGNreVRtMVg5dlRiUnprOTVJNG5uZmRqcUtXTUwr?=
 =?utf-8?B?UGorZXAvOWNHMk5TYVRZbTJSVTJZcytZMTFWLzlzOXhmVytQaklyUnpoVTV5?=
 =?utf-8?B?QU9NQkJ5cGJ1Q0QrVS8vU1dEZHJIdEVYTkFFZDZaWjNYNXhWRjlrUHNpcTl6?=
 =?utf-8?B?SkxrZ2U3cE93dkxRaFIxQ21ISGpnNTAyWlFzM2VObVBSMmpQZjRSTHFlTEdX?=
 =?utf-8?B?QkZ1RTFrUFRFVGoreGdwcWtoZ3pvL1ZRYkpvZEMyZGhERUFjRkRGTkQydEpV?=
 =?utf-8?B?STdneFJJV2I3RHpkc2xvdkxHMDNKNXdEWVl1eHFvNGd5TlBMSzBabTVkaE1F?=
 =?utf-8?B?bi9vOHdpdGw5bHJFZGkyYURWM3k4Qi9XbHQzdGloUHdRUVVBTnFFRWE5VllG?=
 =?utf-8?B?QzRMeTlIYUxLcEkvVjdONjIvcXdqRnNvODNlNXJxdmQ2NU1zS3BvTE1vb25k?=
 =?utf-8?B?VHF3bTlwQ3UvYWRIVi9IN3g5UElxMzE4Nk94SmRMUDRwZXRlekhTOUhGT21G?=
 =?utf-8?B?bVFtU081VnAzT1BpbjVkQXhPODJxZkY3SE50R0U3VkVBb0lGWjVvU3F6WGox?=
 =?utf-8?B?RUY0bS9id2xvNGowV3BSSStKTEpyQ0VFZ09DYUdNbHdLY0V2a0llSFhRQWJQ?=
 =?utf-8?B?UHRTOHZCcTRpMUxrK3hkc1lSdmdZUkR4TitaWEh2d3oxSHhmVE93VzdWc0s4?=
 =?utf-8?B?Qjhybk50UGtDWUoxdzcyZC9BNzk0WnZkOW53VHlLRkNjSXZITmx2VWRVYTlD?=
 =?utf-8?B?T2l5TVphOUNKcFNESGF5L21GSE4wRGtQa1N6aDhaYkNOTXNZVlUwZGxGL2lF?=
 =?utf-8?B?bTJRUGk2eUZDTkZjZERWVDFWeUo4YnVkK2FPbWlqWlo5eGptKzVaaHRuRUlW?=
 =?utf-8?B?NHA1aVU2Rk9Da1N6c0FZdDlwa3pUeEJqSzh2UkcxbXVQT2Rjdk1hVVV2V2c4?=
 =?utf-8?B?T2dDL1AwL3JaUThRaG9vTXZiZzlyQkFnaklObDYrcEQxdEtjSWpvbEV3UEdx?=
 =?utf-8?B?L25XbDc0Snhtdm5WSzJ4L3J4emxtQUVnN1I0R1ErQ0MzTkZXOUduU2RKWUdC?=
 =?utf-8?B?ZjJ0dnhkL0ExbkVMUFc2YTRLNDlZbHFra1ZPVE9zclVRMGVSRWhrY1BrNUJB?=
 =?utf-8?B?bm1PRFFJSU5ZWE5HTWZUK096WXZLQURhd0lGVDVWS0VtTXU5UWJkbEU5V1k4?=
 =?utf-8?Q?6es/hSx2u2L/nTViWlwYBcOwN?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 799653b3-53df-41ba-9b2c-08dcde606454
X-MS-Exchange-CrossTenant-AuthSource: CH0PR12MB8486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2024 19:21:16.2690 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6l0vamSbhmwbEwmd9BKyPiJpY5g5eZWEQS2P+zM2RTV7JQ5lp1PBR2+C3+8fbRd7IBrUGexWRky+bKSQV1HxFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6284
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

Mario and Melissa,

Another regression identified on this patch - DP Display is not listed 
as an audio device after this patch is applied.

Cheers,
Alex Hung


On 9/18/24 15:38, Mario Limonciello wrote:
> From: Melissa Wen <mwen@igalia.com>
> 
> drm_edid_connector_update() updates display info, filling ELD with audio
> info from Short-Audio Descriptors in the last step of
> update_dislay_info(). Our goal is stopping using raw edid, so we can
> extract SAD from drm_eld instead of access raw edid to get audio caps.
> 
> Signed-off-by: Melissa Wen <mwen@igalia.com>
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> ---
>   .../amd/display/amdgpu_dm/amdgpu_dm_helpers.c | 20 +++++++++----------
>   1 file changed, 10 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> index 854e51c0b3fb..e0326127fd9a 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> @@ -98,9 +98,7 @@ enum dc_edid_status dm_helpers_parse_edid_caps(
>   	const struct drm_edid *drm_edid = aconnector->drm_edid;
>   	struct drm_edid_product_id product_id;
>   	struct edid *edid_buf = edid ? (struct edid *) edid->raw_edid : NULL;
> -	struct cea_sad *sads;
> -	int sad_count = -1;
> -	int sadb_count = -1;
> +	int sad_count, sadb_count;
>   	int i = 0;
>   	uint8_t *sadb = NULL;
>   
> @@ -129,18 +127,21 @@ enum dc_edid_status dm_helpers_parse_edid_caps(
>   
>   	apply_edid_quirks(&product_id, edid_caps);
>   
> -	sad_count = drm_edid_to_sad((struct edid *) edid->raw_edid, &sads);
> +	sad_count = drm_eld_sad_count(connector->eld);
>   	if (sad_count <= 0)
>   		return result;
>   
>   	edid_caps->audio_mode_count = min(sad_count, DC_MAX_AUDIO_DESC_COUNT);
>   	for (i = 0; i < edid_caps->audio_mode_count; ++i) {
> -		struct cea_sad *sad = &sads[i];
> +		struct cea_sad sad;
>   
> -		edid_caps->audio_modes[i].format_code = sad->format;
> -		edid_caps->audio_modes[i].channel_count = sad->channels + 1;
> -		edid_caps->audio_modes[i].sample_rate = sad->freq;
> -		edid_caps->audio_modes[i].sample_size = sad->byte2;
> +		if (drm_eld_sad_get(connector->eld, i, &sad) < 0)
> +			continue;
> +
> +		edid_caps->audio_modes[i].format_code = sad.format;
> +		edid_caps->audio_modes[i].channel_count = sad.channels + 1;
> +		edid_caps->audio_modes[i].sample_rate = sad.freq;
> +		edid_caps->audio_modes[i].sample_size = sad.byte2;
>   	}
>   
>   	sadb_count = drm_edid_to_speaker_allocation((struct edid *) edid->raw_edid, &sadb);
> @@ -155,7 +156,6 @@ enum dc_edid_status dm_helpers_parse_edid_caps(
>   	else
>   		edid_caps->speaker_flags = DEFAULT_SPEAKER_LOCATION;
>   
> -	kfree(sads);
>   	kfree(sadb);
>   
>   	return result;

