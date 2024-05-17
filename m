Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB18F8C80FC
	for <lists+dri-devel@lfdr.de>; Fri, 17 May 2024 08:35:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6016C10E4AE;
	Fri, 17 May 2024 06:35:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="KwL5toIp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2085.outbound.protection.outlook.com [40.107.92.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7883C10E4AE;
 Fri, 17 May 2024 06:35:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NnsTdCdIRLV/YFuc6Gs7YsCoKBEWS8M3j4KiwXYFXmmYNi9UaAod1pXnOi0CflWrIo82vYO6wwFProxiWZ4aDk88fPec10OJpmeYMyyXkz9Dw7bn/ZXlVps4BZQwH16W1Bm6j9Eyy4SaZnLPM0LGWIb085QrLbdQITd4hB2QQduA/h6z8Ms/YIAgJEJjKP3bzVm2wGY4sTPKjMJNTFidqpSRRKNEm26eIJsR2eiR1YBbdAaNxP6vxrH7ozkLJgV5kAU9dPd8q8QI66D4/+fe2WQLhmNM903f32QsuLOAzRz5ynLmdoF4fMXXwnZ/GodpNJCkkwNmvius4pjM+5fa7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wqtSXDp0qm38ybix+VyHTAb/GIKWPWONI3BPN+mcyGY=;
 b=hqGP0BOIEA4v72UC+MrDC/8NSeURsOVR1Ui8pkNsNlSDMWWGNVoQWGLN6DNz9jWTWBi0b1BPxAWm837Y80CoMYVC0DoQCyRJyudBBc/6U++Sp8o7t+Ket6t7y08qrO9I95dEdh+dTisv5Hm4c70mPc6pZsFhRWOyEHTGh9kYIEt1yi/7WNB+1ZEveHk3h2gWe6zVjULa/K2yKmqBi1OlML4TM8JWvkMT1qiCqGRBALRUHSZe2XTUa5OjMGZBzH7KN2j+S6sr8TS1B9iuXgE33czmXTrsPTQ9BwexWrMhTwgRdyMIz+S4D9Fhnpi3bMYP84NDU+32RaZclNnb4FT6sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wqtSXDp0qm38ybix+VyHTAb/GIKWPWONI3BPN+mcyGY=;
 b=KwL5toIpK/zYNmRR7HFPk9oLntYVMQMinDlu8+jvsrB1iH2sz6JL6OxZ8l2GtmhXFTGcgPRiQoaD3oOV14OvX0SvPZQY/cjFq1PiUd6Diwu0fSNWiWuLZiwavsHoK4B5ntQfRGCaiIa2yPYjRmjIPLArzLcfJD6ObSpc6O8kOo0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CH3PR12MB9170.namprd12.prod.outlook.com (2603:10b6:610:199::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.28; Fri, 17 May
 2024 06:35:11 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%2]) with mapi id 15.20.7587.025; Fri, 17 May 2024
 06:35:10 +0000
Message-ID: <9dd1cfd1-fe13-4434-a7cc-e14113dcaf53@amd.com>
Date: Fri, 17 May 2024 08:35:03 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amdgpu: Remove GC HW IP 9.3.0 from noretry=1
To: Tim Van Patten <timvp@chromium.org>, LKML <linux-kernel@vger.kernel.org>
Cc: alexander.deucher@amd.com, prathyushi.nangia@amd.com,
 Tim Van Patten <timvp@google.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>, Felix Kuehling <Felix.Kuehling@amd.com>,
 Ikshwaku Chauhan <ikshwaku.chauhan@amd.com>, Le Ma <le.ma@amd.com>,
 Lijo Lazar <lijo.lazar@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, "Shaoyun.liu" <Shaoyun.liu@amd.com>,
 Shiwu Zhang <shiwu.zhang@amd.com>,
 Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20240516115721.1.I8d413e641239c059d018d46cc569048b813a5d9b@changeid>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20240516115721.1.I8d413e641239c059d018d46cc569048b813a5d9b@changeid>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0081.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::7) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CH3PR12MB9170:EE_
X-MS-Office365-Filtering-Correlation-Id: 29c17430-480e-46a2-3e2d-08dc763b8039
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|366007|376005;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TkVhSi9wRjNndkc2dWgvQXkxVWNub3pFcmpEYVB1elhxZGJlQ1MveEdtSndW?=
 =?utf-8?B?alJZRk5MZE9WaGFZd05XSG5nRU1zTy9wN1ZNYzFVNWpUTTgrTU40NGpKRUpu?=
 =?utf-8?B?Q1RtMXJpSGtYb2dxdkQvSFJqMmNtVXFkUnBKRWZIQ3JlclhRaXgrN3h4RlMr?=
 =?utf-8?B?VXhLVDQ3YXNwV3ZweEo2QnVOT3F4MDMxOEtISGloZy9NaUVtUkp6NmMyMFFE?=
 =?utf-8?B?MkZhTUFuWVBpLzA2eEZXTjlMK2dML00zalA3YTlKVUVLUmx6VWxGQWp6VUxr?=
 =?utf-8?B?eCt4Zlc3eC9HVnQzUjFwakNyR3pBZ09yczBYNW9ocnRLdEo1aWdnaG40dzhC?=
 =?utf-8?B?OWtzQUIvMUU0VGxndGxoWHZvdlFaUGZBMmZ4M05SVUJQaXZVUXQ1TkM0RE9B?=
 =?utf-8?B?V0NHenJiQkJlWU53cmZuelU2ZzdyVTFyelp5OStoL0ZZR3g4d29rZXRENVF3?=
 =?utf-8?B?R3c1cXZ3Z3Uvdy83WnhQRzN2NXExaGFoQUFlVHJ6WmNJTG00M0dQaXhDVWdF?=
 =?utf-8?B?bTNyd0dpS3I3K2tnZDIwMjFWQXFXV3NtK28zSFVsVEt6Q1EvWDRJODNHT3p5?=
 =?utf-8?B?ZDU3K3pqYVdTeGVmaGZiSTJzdGpRblNiRmViZ3ZsckxqQTdqMGpoNG9uWVE0?=
 =?utf-8?B?OUF3Rk9qUXlVRjBucU1rUWFUL1NwRnZOMjNTMmZJaWxkbFNsQjdhbVlrcEpM?=
 =?utf-8?B?eHZDTlVqbFg2Mndzc1NrTzNmL0hTM3Yzdm5OblpRblNYTzNSQTZpSnFPL2JO?=
 =?utf-8?B?T3Y3YUg5Z29BVU5wbGtISXhGeGhITGE2SmppWXcveVQzM3RXVnJpeXBPT2tN?=
 =?utf-8?B?aVpaZEJHbzIxVmMvNUdIYk1XSDVmeUk0aWhVcDlmMmhTVUxWZXFsb2pWQWd1?=
 =?utf-8?B?NFJWU0g3c2dHM0hxcDJ4MmNpZjRuTnZGZ2RibmFCaHVyUFJJLzNEUWdId3Y3?=
 =?utf-8?B?WSt1ZUxmbEdaSzJrRVdvb3NoQTZTTS9ZQWUveUVTaUtxM0FMRDU0NW4zMUVS?=
 =?utf-8?B?R01ZSkVjZG9FdjBCZkY2eDM1TzZCRHk2aEdtQ3haQlZURzhoNEQxQUdQamw2?=
 =?utf-8?B?a0ZDWnQxREFTM1VTWjhrYTVUbUlMQ2JRQlc4WndscCswK3FKTXEzWnpZVVI0?=
 =?utf-8?B?aXkrYVp0SFA2UDROempIQ0Z0Zm1nb25NVkVSejRJQmJSUHZIaVpFd2pWNjVE?=
 =?utf-8?B?dHkxMHkrN0Z0bmc3ODJKMm50Tm1haG1jbzdiT29YMFdEVVFJT1BicktNb1hQ?=
 =?utf-8?B?NkhSdDhzVmRUZE43a0VZRmlQZk1zR2lTR0hVTGNqYytxN3dvOWgvaUR3OVRG?=
 =?utf-8?B?V1NQVHlXWWlLN0JqMWlpc3FBWlhNYmEvMHBoSGpjTmdJaFlVMHVBVzA5aXk1?=
 =?utf-8?B?RVlMWHIxMm13a3kzQStIMXU2U3RudmdsY1Q3MG5HSDY2TEFhOGhqT0toNld1?=
 =?utf-8?B?R0RQVU1hNzhhSEcvcjVYaG5YeXpoc2ZJRXdNTHhzb3RIRXRVZEhXZGlHQTkv?=
 =?utf-8?B?akNuN3o3WkxHWEVESnEzYlJKVVByNmR0K2xzVER2WUdFcTNwM0VoOEpkemtC?=
 =?utf-8?B?dlJ2OTlaRnNsV0NVQ0tYQ1pZRkFXRXhKeHNENWptcUZtTzV2VXVLWGJYTG5Q?=
 =?utf-8?B?eVdtZ0NhUEh4OTN3OG45NlNZamhMSksxQlRKK1A3WWxIMzVqbDBUanpOTE9v?=
 =?utf-8?B?eDBaYUFIZkNEUUp2KzNCRWlPUE1iTlVwNmx6aUN2YllXZ1A3MExUd0hBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eTIxWXROTzFnbDhFL1VEOXJEUlRWaWp3OEJMNWJReXNZbmlGWC9qcVFIZFpl?=
 =?utf-8?B?Vmt2aGlkVlNWQzFyTUVCeDRnZFdjS1BpVVg4Zi9mcU5FMGY3dEc4a2tJV3o4?=
 =?utf-8?B?WGxiYnMwcGVYaWZ1S1ZDOXpPa3RlTm1HZkl6bFlEeTdhM09hbzZtNHh0S1g3?=
 =?utf-8?B?VVhOY0NvYTRVZWx4ZjhyOTU1aU5YZXRxVk8ybGlIWmVRS2Nlajd2SG40RUM4?=
 =?utf-8?B?WGkvc093R3RzSHU0ekVhMmhqWEpYZFRhMC8zcjNnZnNyVnZmMmg4Z0YvSUMv?=
 =?utf-8?B?d2RWVy8xdUJMbEVlYUtnem9CRnV0ZW9VaFJTS053Zy82UmVoODQyRGZ6T2ti?=
 =?utf-8?B?RnBrY0lCT29JNDVBbW1hWVlHVzg4eE5NbUlXWC80WDdlelNtNkQ2ZEFrZXNS?=
 =?utf-8?B?NEg1NGZPRVg0NFc2YkQ2bTBsWk8rNUVsOUZSREZIMGc5elFqWmpOV001eUh4?=
 =?utf-8?B?Qkc0bS9CaytHNjVPVER1eG9QZVNES2tpbk9qcVZXYXVGSW96bXZHRlF6NExM?=
 =?utf-8?B?N1k0TWhvQ21WU0JIU3FiMFdNcXpDY1kvcGlPZ01kaW1sUGUvdFFIUDlFTWJH?=
 =?utf-8?B?THkxTCtTcWpycHN5K25vdFduL0NYUWpzMUtlZm15TUJ5K3Y2SGNXUDRxVVd3?=
 =?utf-8?B?OGdCLzBsaklFVTJFZDh5UkpKM0RmVlNEaTV2S2ljakR5YThkbk5mR2JjUHl3?=
 =?utf-8?B?anlYRXJTQUVUWDNETi9LYWszVUhQSFJOOGRLKzNJbWRYbS96cldsa1BlZERn?=
 =?utf-8?B?N2tmMWtjTE9PUkt4aDhrY0ZtQTFTTFVIQ29qUUR3VEZyMVpXbnNuU1pnL1M2?=
 =?utf-8?B?OUZTRnh3UDltOWg0QTdtR2NXcFZWQ0FUMmdrQ3JCcFp3bXhpZW11SkFITTIr?=
 =?utf-8?B?a0xzbVZqK3NTVm5mZmVoTWQvZ29iaTlFY0pzcXF0bHhwTVYzd0VzRG1abG1G?=
 =?utf-8?B?SHBXa0hRQzdGbkp0VW5jcmdMSjRUWXQyTVBLUHZsUGJNQWE5SElvWHRLdFRN?=
 =?utf-8?B?a0ttWFlsQVo1eTNkbWpPdkV4MXI2bGhMeHR3cjRzb2tyRzN6b2VleDNxa3dS?=
 =?utf-8?B?RkNMOW1mSWF0U0xQd2hLcFVtc0NCZzNiK0dZVEtaanE5WlVsaGZsVTJLK3Rh?=
 =?utf-8?B?Y3N6dTgrSFo4bE9Md3dPSWJNUllIYlUwMTRCcXh5dzNzVklRZFZPSlZRMlV5?=
 =?utf-8?B?OVdlS2ZMWSsvbGlGTC9sdGlyeDZiUUxtR0lXTDV4NHFPK284ZEp2WUZkbDA4?=
 =?utf-8?B?eWVsSkIxekJNejlXcEduQ1UwdUFpQ0wxdHJSdGRQSFRjQko4TVhKeDZScU1O?=
 =?utf-8?B?YVlUdlpsbmhzekl1RUdScmRkTmlubGFzcHo5ZWp5SVhENG16SzAza1daQ0FG?=
 =?utf-8?B?MWJUc1ovZzZ3N2twWE5lQVBJeEVEWHdGU0QxNWpjY2xyZEs4L0xvcXFxdkpq?=
 =?utf-8?B?SU1zN2xKYTZEbzBYU2RXVk9uRjlJeXZTZVZHV1J4OHRpVndZbFlPM3dLaTkr?=
 =?utf-8?B?RVl6R05MVUpDWmhWYVdFa3phZUxCWkJoQnk3QWFwRk5hd3BYOEQrNWVoZ3NL?=
 =?utf-8?B?V3NPTUxGb0w3YnBLM25pTXBCTjV2bVpHTG1UM2Y3di92aWRHaGllcFV1WlVS?=
 =?utf-8?B?Kzd6cDNYMXB4M2Y0b2RweHhlRllZRzFVanhFdzhUL0d0SC8wZ0paZDllcC9R?=
 =?utf-8?B?RjdvNVowUnAyOWN6VlpWWStIQ2pLcEdCN1FZdjkyeFJvdzY1bHBJdnZ1NEp6?=
 =?utf-8?B?Ujc3YVZiSWdQaStNSTJsdENkYUV6SFFJbG4rdTVwM0YwMndmcHljemw5T0sr?=
 =?utf-8?B?eXdvNy93MDJiaVprbUs0blZmaVNwd3FTdUdrQVFTdXB3YnZaSkdmR0o0dG93?=
 =?utf-8?B?TXdGWVBUK2ZaczdKZ1RoWmQ4V01GMnloTld5RERBK3paNEcrN1B5YzcrZ0Vx?=
 =?utf-8?B?NVBrcGR2Rm9zaDJqOVd4M3FHTnIwUHJFTXY4WXRRUlpmR2RFelQ4eEM0dmNN?=
 =?utf-8?B?RXcxRnBObFlyRXJ3QnNoTTdRQU9wUU5INDVPc3N0V25FQVg2dXFKam5IMFZx?=
 =?utf-8?B?cDNRbkxWa2VuR0Uyd1luakpkM2wreDVpcHFjbFFiYldUMVJSOVFCYXAvUDBq?=
 =?utf-8?Q?gosPNbimI6/ZRzQwHfq5e05vV?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 29c17430-480e-46a2-3e2d-08dc763b8039
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2024 06:35:10.8685 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HyseEo47LzA/fBzzKU3nsAvPOpIR2aJfijS5hCSauYE1VS0uqAlIes056ilv/0pB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9170
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

Am 16.05.24 um 19:57 schrieb Tim Van Patten:
> From: Tim Van Patten <timvp@google.com>
>
> The following commit updated gmc->noretry from 0 to 1 for GC HW IP
> 9.3.0:
>
>      commit 5f3854f1f4e2 ("drm/amdgpu: add more cases to noretry=1")
>
> This causes the device to hang when a page fault occurs, until the
> device is rebooted. Instead, revert back to gmc->noretry=0 so the device
> is still responsive.

Wait a second. Why does the device hang on a page fault? That shouldn't 
happen independent of noretry.

So that strongly sounds like this is just hiding a bug elsewhere.

Regards,
Christian.

>
> Fixes: 5f3854f1f4e2 ("drm/amdgpu: add more cases to noretry=1")
> Signed-off-by: Tim Van Patten <timvp@google.com>
> ---
>
>   drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c | 1 -
>   1 file changed, 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c
> index be4629cdac049..bff54a20835f1 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c
> @@ -876,7 +876,6 @@ void amdgpu_gmc_noretry_set(struct amdgpu_device *adev)
>   	struct amdgpu_gmc *gmc = &adev->gmc;
>   	uint32_t gc_ver = amdgpu_ip_version(adev, GC_HWIP, 0);
>   	bool noretry_default = (gc_ver == IP_VERSION(9, 0, 1) ||
> -				gc_ver == IP_VERSION(9, 3, 0) ||
>   				gc_ver == IP_VERSION(9, 4, 0) ||
>   				gc_ver == IP_VERSION(9, 4, 1) ||
>   				gc_ver == IP_VERSION(9, 4, 2) ||

