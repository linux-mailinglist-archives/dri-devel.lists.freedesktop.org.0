Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A67C8C79C49
	for <lists+dri-devel@lfdr.de>; Fri, 21 Nov 2025 14:54:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAEDB89E59;
	Fri, 21 Nov 2025 13:54:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="O2bSe7qC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azon11012067.outbound.protection.outlook.com [52.101.48.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6889410E8C5;
 Fri, 21 Nov 2025 13:54:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eUimEJXmpr1j/JsvJqczEkpiFh9c5KbttQ94L7KeDPoQfZlo0Js2v/IcLVpv47Kz8mGNuTxcVjyaDBctJv73RbZH4FaSlzyEVke+hoiM1BST6KtVuIC9Sg5flFUoH9UwqQLR2nyw+cVacV/DS875hQiHi8q9k09osfI6IBiYdthS8+kdgwJjzvbTFsCPGDkeEqltCYx2zlrvr/2HlV0xThXPTHRpzhYnwjHR3cXApcZY6GWQsLEa8okFxPFre8sBKpqJTqqYD+lLwKebwckz0XKOrxy6J4BZcsdvQSsfakbGw2/pYgzRTNtqKHG1di2g+AewxJQvfWInNUTEt+uJhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f3biWi72U3a6YZtZ2EkSJFS5dHXEdVoA0IzFNGCz0sI=;
 b=phRBsbm7crEtPfVsfcr2fYs5nq3KGvl6cnMgwxfgrSQcTJeMdLTWXjIMsOxslyWPQtQu1QO+6TSqiB9LR73da+9TGrBwHfFsMruZ1yw3IivZ82dP3ETWhkKuaSeMWElSnSyMxEpTR0/orc+zBC2keVbt0zvuF6HoGU7OVFwK7D4kyb02bebDYe6ZnY98twA4YjDd4bVdzM7xrqSQN+LoOvk+J68DXnDCb8GIezsJy9/bI5DKDlJYd194MP5/6yN6TTMlzLcm1hk1K35XWIgc2T4EJQ7kwdPOVTn4yVPVUCJbyQSIm+Bfcqkn9nIkNt7lOCJJhNPoUV4mrN0e3CDO3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f3biWi72U3a6YZtZ2EkSJFS5dHXEdVoA0IzFNGCz0sI=;
 b=O2bSe7qC9W4XQQgWzHEmhFwq8cSdcKTQn7qEAop1tM3T/x26zFw4YF87QIAIF5g2GPQY5sLvNHCqUKacttAC2kxYCisGiXY/jkLQgJd8ixvIPiWA4+czTL3877S8afeDFYLmX8AH+UJMDUbtXt/oFDdtrrST4auRHaSfZZWwg9Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CY5PR12MB6276.namprd12.prod.outlook.com (2603:10b6:930:f::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.12; Fri, 21 Nov
 2025 13:54:47 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9320.021; Fri, 21 Nov 2025
 13:54:47 +0000
Message-ID: <24f9bd61-eb6f-49e8-88d9-9ec3b2f94d8b@amd.com>
Date: Fri, 21 Nov 2025 14:54:38 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 14/28] drm/amdgpu: check entity lock is held in
 amdgpu_ttm_job_submit
To: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20251121101315.3585-1-pierre-eric.pelloux-prayer@amd.com>
 <20251121101315.3585-15-pierre-eric.pelloux-prayer@amd.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20251121101315.3585-15-pierre-eric.pelloux-prayer@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2PR02CA0092.apcprd02.prod.outlook.com
 (2603:1096:4:90::32) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CY5PR12MB6276:EE_
X-MS-Office365-Filtering-Correlation-Id: 00791c66-77a4-46bb-1369-08de2905881a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YWN5QnhTK1hwcW9iVG9KSEppS3cweTdhRUJKMzR2YmZJVnVjSXcxZHRZV1By?=
 =?utf-8?B?M2p3NXRvWVBnUy9rcU5HY3pEa0lwTUJ1d0NpQnlHdDhrM0pXQVVJaS9LdjNM?=
 =?utf-8?B?b0RtOU1INi92dmNpcmZKUjZ2ZjQyekNqbytvcm9Jb05HTGd4NjBMTVA4NFQ1?=
 =?utf-8?B?TWVRei9NWDc4TGJhS0pJWHMvTDR6clp1SXpyRnNtOTBYM0pxai9RT0w3Qmp6?=
 =?utf-8?B?VlgybDJod1Vpcm5SSFcvOCtDbytNMWsza2lYZ3JBSWhLYmRYVnJIaENCS3ZU?=
 =?utf-8?B?YVV5OVlGdVlvVVBML2R3OUY3aXh2Uy9QYjY1WlEyOFhmVFhhRU1Da1F0aUNj?=
 =?utf-8?B?ZFBuWU1RdGpvWTNnYytnWXVwZ3I4WXNkUVIrd3YrdVVrcCs2V1ZuSGNWY1ZP?=
 =?utf-8?B?WTh6YWdEbVZkSkFTamc1cGEyUWlPbVNvVFovSzZOaDlYN0gyc3lKMXRwTDc4?=
 =?utf-8?B?bndORkZVSkNCNU1RVlBoLy9pR0JyN0NDdC9rOEM5Q0FWVUV0ZnhMeVhOM0Mw?=
 =?utf-8?B?YTdrQkFoWUVTVWpnaHpIM1BsK1pMbEhEUDJJdythZHhiWWlOK3YrUkRrRDBE?=
 =?utf-8?B?andFTEw3YzRESHJuYjlHUFBUMjZqdG5MdkRBK0tLcVFzejc3dEREdjByYXJX?=
 =?utf-8?B?WmR3aWlFN3lrR2FDNDFLQlNsMnptU0ZHU1ZmQko4OHJCaFF3L1pocmlnVlF6?=
 =?utf-8?B?dy9HeU5HcjJiNnhvT3o3cmt1ZDNZWlRiWWJCMHg3dFd3RWR6NGxqU3U3TnNY?=
 =?utf-8?B?bmJaaDRlTTJEaGo2blpzODhWYkNpZ04vUXRPc0JxMXpyb2xPT2FTN055VkxP?=
 =?utf-8?B?VUw2Y3FUM1VvUHA2NFE4NTBGOXZ3VWQ1cWJxL1hxWGIzRzg0b2Y5UHFMaWpQ?=
 =?utf-8?B?SXN2K3Jna1VRckh0WXdEbStmNTdoOEtWWjFJZTZ2d280SmtqbkpQbmNvNitS?=
 =?utf-8?B?akVYSlNRRDVMMXlCZHNvTWE0WGdYZEFPN0lYUS9vT0FDS3pEY1Y4SmZXUHV3?=
 =?utf-8?B?cEsrZ0wvK3F6SGdPb00yRVEzd1FOUy8ydmQ2VWQ5WXdnUWR5cysvTkhkNENO?=
 =?utf-8?B?TzJyNzlHbWtMcW11bnE1YmRObyt4YWdibmtwbXR1TzdZcll1cGFub3c1VVVv?=
 =?utf-8?B?OHlZRjF2bktCNWhTRUlwR3czUWRHZ2hmTlFWUVdiQ3h1V0FCbldRY2E3RlBv?=
 =?utf-8?B?bDdGaGNBTEhiemdWM3ZYQlJ3ZFZ1MS9jRnJRaTNnV2gvaFJkRUtLSXlrTU9l?=
 =?utf-8?B?cjlRVTNRNkhiUkVJK3pQbG1Mb0xaTWtjRGpldW5Rd2s3cmRsNU8xenRsMkwv?=
 =?utf-8?B?VkF3clhrb1NkNnB1bjdPMkZibmJVcVowdDBlK0JRRFFPSG4wY3VwdTZJT21E?=
 =?utf-8?B?QThVMlV3dTUrODRBS3RiRmp6NG14ZnFyVUcxVFpnNi8rVGhOZWVGYllDVmsw?=
 =?utf-8?B?MkhhamlackdReTVvZk1QL1BQc2s2RDJWWUhkZWVSQnBTbHorMlhPc0RSMEkw?=
 =?utf-8?B?aHVzTkpjMmlQa3FJWnNqd2RMTHBqRUJ2UXFPZ05INGQyS2ZaempGcmtGWVZ3?=
 =?utf-8?B?dW9ZK0U4dkV3ck96Mm9MdnZ4NnFuejFxRjdiR1dWZS8xUkRSQXFMVUR0UlJZ?=
 =?utf-8?B?SWZGZkNONUsxdS96cXNWK1ovK01YdGFWMTZ4VmhuWmNiTytYK013ZkRrTDRX?=
 =?utf-8?B?Vk5RKytlUEhLc2tmalgwZVBCK3VDTWhISWp1d1ZyYmp5aTNWSHpFOTFDYUcr?=
 =?utf-8?B?YWFCVDY0UDBncnZqb0ZuREVDYVc0QmJkQjBPWXhJbi9qbzk0VVJ1QXN5VEF1?=
 =?utf-8?B?V1ZOMHBkbjYvQXRSRkpkQVZpSjBsa3Vnemd2cy9uMm1IMGdtZFZyaUhDcEY5?=
 =?utf-8?B?T2YrSDhQbTlKVmtiaEJYMTYyTzhhbnlmSzFkcjJmSW9zbXlnR25lQ2JNTm5a?=
 =?utf-8?Q?fRYEZzJvlRJgaQs4TNEhpucydGiGGEV+?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NHBWMEpXQmJzaWVRMDRGRm5FMzBpSWlaN3FydmhsYlp5T3Vnc3VPZXM1bita?=
 =?utf-8?B?QVBBY05mS2NjR0UwSlJJSFZEZ1VRWElicXkzTEJuTmkwWGFWQnRTQkZRUllN?=
 =?utf-8?B?ZHo4WFN4RFJxTEFUdm01NzBBak9PaUU2OTM4c2M4T3VYR25wT1VNZGhIeXc4?=
 =?utf-8?B?SmxBSzVnNU8xN0MvR0hHSXYyME1oM21mWXF3NlRwcUZCS0NCbjQzSU1tWk5Z?=
 =?utf-8?B?RWZwcUowNkUweG5ldlhJdExjdkNhc2VPZDVQbFF1WmdLM2N6SUlQMm9nUEp2?=
 =?utf-8?B?RnU1QlFPODB6cFVpU0k2V2RobkpHZGpwTW9TY0ppMlg3cmJzbFlza3pIVFF0?=
 =?utf-8?B?VFVYbXQ1cWp2Sy9DK1ZsYWluYm1yMXFmUTdVcko5aTQ0U0VZVDBvdmp2NDFz?=
 =?utf-8?B?Yjg3MVJHWU5TMUFlYlhQQVlJZXhmOW9ETThWV0JDMjFkekFZNlc1bWJHbjcz?=
 =?utf-8?B?a0gySUVZRjdDTm94MFNUZHhyOTVwblAwblZGNHpQczdyQVpyVU9VakRLQ1FY?=
 =?utf-8?B?dm9ONHMxRWg1Mko4bE43U3FvTkVYdy9GZmFLeFgwQlptMWc5ekYxK1gyR2RR?=
 =?utf-8?B?a1BIRmdPQ2tZRUNGN2t6dEVIZHFVdkxuSnV6SmhvVk5td3ZYTHAwT1JONDIy?=
 =?utf-8?B?L05PbktLeG80eXZpdDlHejVTbENzTXhwYVp5bG9JQUdDZnJzclhMYTJMbTUz?=
 =?utf-8?B?bm9TdXhjMHY0TDYyMmtwRlowQWM3QzgzOGtFSWJlYy9HdVRKZWtnVzUwRkRT?=
 =?utf-8?B?NE53VlNUK2RDTFQwZUFTS0V4WkNxRno0bGp4WTVhbExYOGZmdGV0MXZtZmVE?=
 =?utf-8?B?T1ludXZhZnYwNmdsdGd5U2ViTTM4YU8wLzc1ZkNiNVdsa0FwZ0lwbHpZcmp5?=
 =?utf-8?B?RUw5dWJ5MG1Bd3BuS2ZwL1V5a3lLYUg2bFdudkJ0MG9zQUFISi9TNWE2Ylhn?=
 =?utf-8?B?THZEYXZEVnNjUHJFY3hkN2gzTEhhR0xHT1FETGdQdEVvYm9hOHZQZDlTU25C?=
 =?utf-8?B?a2g2MXBnTFFaMlFjTThlaFRsVml6S0tWVVJmV01yajdQWFhxVGM0aUJDOHpM?=
 =?utf-8?B?SEZuV2Y4WlltWUNSSlJiT0c5RW9OM2liTFprSFBlcUp0Tjk1aDFhd1pIZEln?=
 =?utf-8?B?NEFTdzVsQjExazd3Mmx0aGZ1TGkrNEUxUkExeFRaZnRPM1ZvTTlPUVU5Wk5B?=
 =?utf-8?B?S1RjRC9VQUkyMURhR2t2aGM4S1E5dDROSmQxQUpvVXpWOC9QK0ZsVEJZOTcw?=
 =?utf-8?B?c0wwWTdhcHlXMGs0dWRjSTVyakFrR3Zsd3V6YlFPNExSdVFtamExU2VtLzhi?=
 =?utf-8?B?UWF6U3FKQ25GSVUxQnZ6U3paaXNBQXQ3QUdrSm1Zak5VdVd6TGtIZVdnbXA3?=
 =?utf-8?B?aGNwNGJmRU1RenpKL1EwNjUrR2M3SXU0bTJaSHdiNjUxQTh6M05pY0NPc1Fr?=
 =?utf-8?B?c1lnVkNwcDVLZW1RMmtvNy9yUTkwZDVIWmcxVVBKOUxGNnhjcU8rdFQxajQy?=
 =?utf-8?B?c0dlWjByT1VkQVdmNUhuNmlxUmpWa3RPdlhKQzNHZjJhM3hxMGR5TWxQZjhM?=
 =?utf-8?B?SW0rYTNLL3ZwNXZibnBJazJFNXY0WTJ3dVRLemNpOTlOY2RGSEpmMG9TZ0pz?=
 =?utf-8?B?VjNnTmVNcmU0VzArRFNQeWxPc2Q5TWdldS9ReE0yaDFWS2FZU3luTjBJbnNE?=
 =?utf-8?B?c3NwK042RENnNmZUQkR2OE1xQ1pBbUNxVjFTWWhKUmlsekpmM0tVUURGMG5p?=
 =?utf-8?B?ZlUzYm9WaHZqQUowY2ZXdisxeWt2TWhTa2cwNnBKQ2srM3ZPTy9vNGR6Ykho?=
 =?utf-8?B?cXJ0VHozVFAwWFg1cnhiU0J0cjRQa0NRcDY5L1NtUUpXbFAxY1hURTdzQVRV?=
 =?utf-8?B?alNJSFRBUjV2OUFvcUJkWm96Q0JlUGdGcVNEbkVPeHJsS0pBb2MxSGVpN1Ew?=
 =?utf-8?B?MHovQWRVOXhKVS9EMnRlNHhweDFZWGhSLy93aFEzTXMwYUJYdXlLakl6YnBD?=
 =?utf-8?B?eEpDOFdVcXFTc1VBUmZzdTQxS0J0aTA2NXdaMHUzTTRsL0lGTUVjeWpRL2RH?=
 =?utf-8?B?UXM3QTJtZjJDV09rdGRxTG03MjNCYktDYzBsbWpKaVdxcnAzNENaenFhdm5N?=
 =?utf-8?Q?h0q2RygcP73ZXaf/AhgjY6Bz0?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00791c66-77a4-46bb-1369-08de2905881a
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2025 13:54:46.9893 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ps/nFXzIhFYlwDn5zzSKwX/vHCLwJrulNUfEi12/ITnnrzBFQGVbyOci0M202VkZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6276
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
> drm_sched_job_arm and drm_sched_entity_push_job must be called
> under the same lock to guarantee the order of execution.
> 
> This commit adds a check in amdgpu_ttm_job_submit and fix the
> places where the lock was missing.
> 
> Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 13 ++++++++-----
>  1 file changed, 8 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> index a803af015d05..164b49d768d8 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> @@ -163,7 +163,8 @@ static void amdgpu_evict_flags(struct ttm_buffer_object *bo,
>  }
>  
>  static struct dma_fence *
> -amdgpu_ttm_job_submit(struct amdgpu_device *adev, struct amdgpu_job *job, u32 num_dw)
> +amdgpu_ttm_job_submit(struct amdgpu_device *adev, struct amdgpu_ttm_buffer_entity *entity,
> +		      struct amdgpu_job *job, u32 num_dw)
>  {
>  	struct amdgpu_ring *ring;
>  
> @@ -171,6 +172,8 @@ amdgpu_ttm_job_submit(struct amdgpu_device *adev, struct amdgpu_job *job, u32 nu
>  	amdgpu_ring_pad_ib(ring, &job->ibs[0]);
>  	WARN_ON(job->ibs[0].length_dw > num_dw);
>  
> +	lockdep_assert_held(&entity->lock);
> +
>  	return amdgpu_job_submit(job);
>  }
>  
> @@ -268,7 +271,7 @@ static int amdgpu_ttm_map_buffer(struct amdgpu_device *adev,
>  		amdgpu_gart_map_vram_range(adev, pa, 0, num_pages, flags, cpu_addr);
>  	}
>  
> -	dma_fence_put(amdgpu_ttm_job_submit(adev, job, num_dw));
> +	dma_fence_put(amdgpu_ttm_job_submit(adev, entity, job, num_dw));
>  	return 0;
>  }
>  
> @@ -1512,7 +1515,7 @@ static int amdgpu_ttm_access_memory_sdma(struct ttm_buffer_object *bo,
>  	amdgpu_emit_copy_buffer(adev, &job->ibs[0], src_addr, dst_addr,
>  				PAGE_SIZE, 0);
>  
> -	fence = amdgpu_ttm_job_submit(adev, job, num_dw);
> +	fence = amdgpu_ttm_job_submit(adev, &adev->mman.default_entity, job, num_dw);
>  	mutex_unlock(&adev->mman.default_entity.lock);
>  
>  	if (!dma_fence_wait_timeout(fence, false, adev->sdma_timeout))
> @@ -2336,7 +2339,7 @@ int amdgpu_copy_buffer(struct amdgpu_device *adev,
>  		byte_count -= cur_size_in_bytes;
>  	}
>  
> -	*fence = amdgpu_ttm_job_submit(adev, job, num_dw);
> +	*fence = amdgpu_ttm_job_submit(adev, entity, job, num_dw);
>  
>  	return 0;
>  
> @@ -2379,7 +2382,7 @@ static int amdgpu_ttm_fill_mem(struct amdgpu_device *adev,
>  		byte_count -= cur_size;
>  	}
>  
> -	*fence = amdgpu_ttm_job_submit(adev, job, num_dw);
> +	*fence = amdgpu_ttm_job_submit(adev, entity, job, num_dw);
>  	return 0;
>  }
>  

