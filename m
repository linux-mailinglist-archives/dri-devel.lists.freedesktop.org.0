Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B3FF4CC55A
	for <lists+dri-devel@lfdr.de>; Thu,  3 Mar 2022 19:41:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1CE910EF5C;
	Thu,  3 Mar 2022 18:41:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2068.outbound.protection.outlook.com [40.107.236.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4484F10EF5B;
 Thu,  3 Mar 2022 18:41:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HkRz3RlMlAP+ufy7i5YTwFAQQPMhrD+ISElro2ldrXLcRz8iH2woy6j2SM+MUzbMEbsitYcE42hwiPLjXqkuslM8AVFXqwrFSE/uJTw0ChMekgquqBGW/f6eleikYR0b561ysJqIK35szWge218+p80a+vvn6vLc7lSowamPW623dFPhg3zrgA67EefLyTEAF4IfX65DPsNktqQam8/Y6A2f3Eu6GjUu0PHTXLAVsBx2sNvCJI8w/ExH3B9PCZ/PTVDt0zmP0l7gIQ7ZPvLYCs+WuqTO2WWe9Y8XcoCyavOMQctvj8YE10I3/yYuxonfQ4Q1R5LpM9uxoL02y0Qtvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o679teoXHG1AvnBqonQInZtUo5mI75r7MiA2k65d5m8=;
 b=MkPG1SS9Ro9Si82GC/mqz5GJu58xVD8LrZnFIvnavFg+WgWVh4nHUteKQH2h9tYVfMSMiLrl9t/cI1zdfPwaL5ZoqGGg8nmcI19PDWzZrKcvKbmNDUwKSNGFilzrgkepoGfMxFpzqDuD3I8DRQ0k/0i4aZBCOg4XOmtxqEwT8SVO6coI+QgBW6T6S1dEoQOBX4c3WfEQJ7zDheroDjOIKDfPeIU9/YwWApuzSchpOpFlo5YXONNxBqjk1Exljtg+uJN8xiq9VELyYiuoZ0I7p2BpJgFL5asvt3Cj/ITa7EXXy6rqlgVliCa9fm8iqT/wyVBERyECOpk1ZX6UPLszwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o679teoXHG1AvnBqonQInZtUo5mI75r7MiA2k65d5m8=;
 b=xky/3vc1OSZujfQ/68Jy1RacPKG4Gk0H81StRaJhg673mF1lTWhZmyP+A7j5B57oYZV6/+9eIXDtDmMZqncbKOoRkY4R5tOCCrKPX7OAD8x1+k0/nNWgYjEWv3ehHQG3CfJ0dK+pDcoIB49Yeyr0CAnUpSj7Rd0ynQnPzfrZyVY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by BYAPR12MB3479.namprd12.prod.outlook.com (2603:10b6:a03:dc::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Thu, 3 Mar
 2022 18:41:24 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::192:5346:4ece:7ca3]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::192:5346:4ece:7ca3%5]) with mapi id 15.20.5038.014; Thu, 3 Mar 2022
 18:41:24 +0000
Message-ID: <d3b27eb1-6da5-0fee-0d06-fa39c44ffd3f@amd.com>
Date: Thu, 3 Mar 2022 13:41:19 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH][next] drm/amd/display: Fix Wstringop-overflow warnings in
 dc_link_dp.c
Content-Language: en-US
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>, Leo Li
 <sunpeng.li@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
References: <20220303172503.GA1731116@embeddedor>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20220303172503.GA1731116@embeddedor>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT3PR01CA0123.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:83::23) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5a374700-4be1-47dc-a576-08d9fd456adb
X-MS-TrafficTypeDiagnostic: BYAPR12MB3479:EE_
X-Microsoft-Antispam-PRVS: <BYAPR12MB3479C3C11862BAA4D76BA6E78C049@BYAPR12MB3479.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Vv8j253vvPp1v4kfJPGgwE9dcb5sU5cJ9hZbVYn9zurWI0JRTboKcwhIMw0CIClhBfPY2Xb1bPtF52bD4VNTFOG9kCsICKr4rUeaWBysbX4YF2kPKFf7p2hkxjyuDhnZwvJwWhyNx/xUyT3A6+zqCZDk/mTfgge1qJs0bRO24vRkO1pNuGVAyfKfMc1nXJaw9XXmt4cowgKkGk2YvZjTGjVpvfKY93m3MyKqChGskjlqd9cBRxhrQmriggaSGr38Oe7mMfHXnKWrHkz9ZGdEdaxOsS5dLI9g01lHC42MeeUxU8MgMXjlzC9u26bDzF4R5GOtqxu+AEY4y5osG4HbNVPwJSRlWjsG6Q3/QG7Zm7ZlEyHbw8okUTQFlaNcm41FS5/27gAV4rIY7Dwr5ZzigqJcmfSjV/x6VHbcd9TXe8qo/TAinlnRo1EI/OHt9xP1/ndMa1Tt1Z9EvytsC+Aabgj3R0oBHvvqyqTVlrioAeRg09LwOcVjkBvNRCOw/RDsxf9/NcG+k/NKdwur0Edg/J0aXZiyDkL82ziHKCE8eNFAg0hK9SU4ZbzLcE+WdQB9GbCwRWBXtRMGRobI92pg9RmqaZnh/NqQiwGu/h1X9X/y9x68rypzy/FV9thaf58hfgO3psfEt4SIqLJ811u2koh9knHfJ+FX2M6KiDXjqcRMlMDS6zAHlFdEjuvjubWFyo/+2sYxbOQ3A7n5D1vWYG2d2Irjtub4zECOu5P7HvxUL26JUASqyrSZfyC7WCcNpPs9xMtVonGJNBA/bsX5HKv5Wv5cXoHr9vQ/2F+r96lXk6z63f7fnYfoa+BJfwys
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(31686004)(86362001)(36756003)(66946007)(8936002)(4326008)(66476007)(8676002)(66556008)(44832011)(2906002)(6506007)(966005)(6486002)(508600001)(5660300002)(31696002)(316002)(38100700002)(110136005)(6666004)(53546011)(83380400001)(6512007)(2616005)(26005)(186003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Zm9WeFlnVUVEV3R5aVhycFpHaldqU25JM0o3eDQ4QVhJVXVaQktVWTFrQ0ZZ?=
 =?utf-8?B?bDJtcVcvS0REWGQ5Uko1U1NLRWo5Z0EyaDZoUXFvejJZNjd2TWczdk9ha3hK?=
 =?utf-8?B?K1RlS1hKSm1qemFHRGtVNjV5dVdLM2laY09lMW9EUjdHbFNZSU5RWk4rWkpy?=
 =?utf-8?B?N0R6RWErZUNqeE9LSjBsSFpRZEJJUzhsUGc2ektpMzVWbTgvWlpEdGdXUVBm?=
 =?utf-8?B?NXc1N0Q1SkFHQzg2alBPMk1UZXRrTDhHZlRWY1IzeTY2Z3BHR1MxY1NaZnBO?=
 =?utf-8?B?S3NEVkZXbmxmeTEzZDVHNXIySnBJS1NnVmtYL0toTXIyUkx5VmVEemFkaUJH?=
 =?utf-8?B?cW9TOUFhVDV2aml6bHFhOW56cWRVaDJvR0Nnb3VHczk5djhCTVUrMmRGb2Uw?=
 =?utf-8?B?ZnRxMm1Ma3pIbDNLanJaVDI4eWcwMFZpMGpaWkJrNHprWE9hT2tPL0xKN2JJ?=
 =?utf-8?B?Nld0UFE0dmxTZEtKQ2hVNzdKd3FyeXZHYUJyVWZ2NkVCejh6a2t2Yi8vdGt1?=
 =?utf-8?B?eGdtbTQzeVVkeEdQakpnQlBGeXBkWWVId0Yrd1FJNktuL3l0N1NJa3FSWld5?=
 =?utf-8?B?UXlEeW9KQlk2eXl5cS9NeFBqY1J5NjcvOGN2eENDRWVNODhaRzY5WTMwNVNG?=
 =?utf-8?B?amFqV0xqVW9ydCtsUWtjZVNLSDhCQVFsZU1COGVVZkZRSStQckx2NzMxbTI0?=
 =?utf-8?B?SjhTY3NHQjl6NzlsN3VKMWxiUW9JVFQyakR2YU92cS9GYzlDNnB0eU1KejlL?=
 =?utf-8?B?VHNMVzF0a3p6TWRkTnRndTZ0ZnlPa0lKSWlXdHAwMU15OGsxTWFIZTRJRHQv?=
 =?utf-8?B?bHF0aXNkOXhnKzlsUU5UNC9LRVhRNG84RitRQUQza2pIMzlYRXVKWWxXUEds?=
 =?utf-8?B?cGJPRU5UbXV2R2d1RnBsQ0dwWEFlUHhvbnk5TEdWMFBQNWFYMUNEZCt4cW5p?=
 =?utf-8?B?QnZhd0hBVVFWcEtLbm9vcVpDRDZ0TFdxYkpaV3lBMWIvNjhrUE5EQmxZRk9v?=
 =?utf-8?B?UTVEeFVDN2s2ZFY0TVcycFFmODdNKzBiM3N3cXcwNlpIS1ppL25MaHdXOExh?=
 =?utf-8?B?NEdMMEJRcXc3U1Z5RmxjNWdDbmtPSFgra0lTYXJMT3libGVxalVFYjNGYVkz?=
 =?utf-8?B?SjMwNUNZZDVxSkhPajcvcHpGa0pmNUxaZWlseDR5S3FuZ1RtY1paVG9PeXNv?=
 =?utf-8?B?R1hYUzEwY21TSU1ubGlnaUZEdWUxRXQyZlNKbzdGbURXamhvb29saXMxY3Ra?=
 =?utf-8?B?c2h6eWM4NmtMYjg3cm9IUXo5bmlkQ3E2eDJVSTlZeDlad3VtU2RVcks4Vkdm?=
 =?utf-8?B?ZTVsak5ZVHE5ek5sNEJwcTV6ZzRYeGM0U2VZWmlxYzhzcEMweUtZR0Mwcmtj?=
 =?utf-8?B?cVRGSmpSbXFkbkVhd29UNE9PMEVWMHk0Z0hpN1lIOXpkTjVrZXFWQU82c3A1?=
 =?utf-8?B?MGJRN0VlTG4ydDBjMjBxaU9qdkF2TCs3b2NYeTBrTEdlQ3ZVUWQxd1VKRzVQ?=
 =?utf-8?B?MXBXQy9GZHF1RG51TmFPeWNGWjRsek5wRE96elVEYVJjRXlON2lQYTkxN2ww?=
 =?utf-8?B?b0NPNllGMnhSYW9KVDQ2QldWbmhid3VXN1dvOWJVSEpDL1hZdHBQdjcyWVQ5?=
 =?utf-8?B?bE52ekFQUWR4bUVzWG9aeVV0clBmM3EydllMVkhUdzBjUHYyNDBPQkV6blk1?=
 =?utf-8?B?V0dEMXVuUnZpdEphaEVMeWRucXNQMFhGUTl0SFovZlJxL1RTS0x1eGNIV3hY?=
 =?utf-8?B?M0h5Rko4SXBPcnlRc0w3OEQwSDFqZllsSURDbk1EeERnMWNtSU5lRFlrSm0z?=
 =?utf-8?B?djFIZmtyWjMyK3VSdkVQVTRtS255blBRYkhUcXZTT1kzMnZRUW5qOFpHNkFy?=
 =?utf-8?B?UUFoZUdPdUhvcmhrRFNFQThvMHNhNVhjSDVwa1pIRGRzc3NRNDVsRWpSdlo3?=
 =?utf-8?B?anE5V0k3SmkvaXNqWnNpczdzdVJmbXFNN2Zsd3VRaVpVSUxnOUNLa0NhaDNz?=
 =?utf-8?B?OEYwVmZRT0ZsOGgxQzdtS0M2R3JTdkFGajV3NThZbkRYamZCamdUNXh0S296?=
 =?utf-8?B?bmlNZHdGT09OT0VFK2JjTEdYRWRTVlV5cithRWVNYW1aWTEvWEZ0SjJsTlZz?=
 =?utf-8?B?bGhNSFp4QmpocWh2UDRHVlYzWUhOelBnd1NXVTR5OHlvSEdJcXdwMmNhZVox?=
 =?utf-8?Q?zgcnjnsvL9Ne3qljdEDRHYI=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a374700-4be1-47dc-a576-08d9fd456adb
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2022 18:41:23.9030 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t6V2m39zq3exGefbvtEJT7Za5u3A6aoT6yYRtnIe6WqgWJX7PlN7GffKQvBsLy9JhllPFt6krNGDYeNoW35/ZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3479
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
Cc: linux-hardening@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2022-03-03 12:25, Gustavo A. R. Silva wrote:
> Fix the following Wstringop-overflow warnings when building with GCC-11:
> 
> drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_link_dpia.c:493:17: warning: ‘dp_decide_lane_settings’ accessing 4 bytes in a region of size 1 [-Wstringop-overflow=]
> drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_link_dpia.c:493:17: warning: ‘dp_decide_lane_settings’ accessing 4 bytes in a region of size 1 [-Wstringop-overflow=]
> drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_link_dpia.c:493:17: warning: ‘dp_decide_lane_settings’ accessing 4 bytes in a region of size 1 [-Wstringop-overflow=]
> drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_link_dpia.c:388:17: warning: ‘dp_decide_lane_settings’ accessing 4 bytes in a region of size 1 [-Wstringop-overflow=]
> drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_link_dpia.c:388:17: warning: ‘dp_decide_lane_settings’ accessing 4 bytes in a region of size 1 [-Wstringop-overflow=]
> drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_link_dpia.c:388:17: warning: ‘dp_decide_lane_settings’ accessing 4 bytes in a region of size 1 [-Wstringop-overflow=]
> drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_link_dp.c:1491:17: warning: ‘dp_decide_lane_settings’ accessing 4 bytes in a region of size 1 [-Wstringop-overflow=]
> drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_link_dp.c:2613:25: warning: ‘dp_decide_lane_settings’ accessing 4 bytes in a region of size 1 [-Wstringop-overflow=]
> drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_link_dp.c:2613:25: warning: ‘dp_decide_lane_settings’ accessing 4 bytes in a region of size 1 [-Wstringop-overflow=]
> 
> by removing the over-specified array size from the argument declarations.
> 
> This helps with the ongoing efforts to globally enable
> -Wstringop-overflow.
> 
> Link: https://github.com/KSPP/linux/issues/181>> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>

Acked-by: Harry Wentland <harry.wentland@amd.com>

Harry

> ---
>  drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c | 4 ++--
>  drivers/gpu/drm/amd/display/dc/inc/dc_link_dp.h  | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c b/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c
> index f11a8d97fb60..81952e07acf6 100644
> --- a/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c
> +++ b/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c
> @@ -823,7 +823,7 @@ bool dp_is_interlane_aligned(union lane_align_status_updated align_status)
>  void dp_hw_to_dpcd_lane_settings(
>  		const struct link_training_settings *lt_settings,
>  		const struct dc_lane_settings hw_lane_settings[LANE_COUNT_DP_MAX],
> -		union dpcd_training_lane dpcd_lane_settings[LANE_COUNT_DP_MAX])
> +		union dpcd_training_lane dpcd_lane_settings[])
>  {
>  	uint8_t lane = 0;
>  
> @@ -853,7 +853,7 @@ void dp_decide_lane_settings(
>  		const struct link_training_settings *lt_settings,
>  		const union lane_adjust ln_adjust[LANE_COUNT_DP_MAX],
>  		struct dc_lane_settings hw_lane_settings[LANE_COUNT_DP_MAX],
> -		union dpcd_training_lane dpcd_lane_settings[LANE_COUNT_DP_MAX])
> +		union dpcd_training_lane dpcd_lane_settings[])
>  {
>  	uint32_t lane;
>  
> diff --git a/drivers/gpu/drm/amd/display/dc/inc/dc_link_dp.h b/drivers/gpu/drm/amd/display/dc/inc/dc_link_dp.h
> index ab9939db8cea..0d00da1640a7 100644
> --- a/drivers/gpu/drm/amd/display/dc/inc/dc_link_dp.h
> +++ b/drivers/gpu/drm/amd/display/dc/inc/dc_link_dp.h
> @@ -147,12 +147,12 @@ bool dp_is_max_vs_reached(
>  void dp_hw_to_dpcd_lane_settings(
>  	const struct link_training_settings *lt_settings,
>  	const struct dc_lane_settings hw_lane_settings[LANE_COUNT_DP_MAX],
> -	union dpcd_training_lane dpcd_lane_settings[LANE_COUNT_DP_MAX]);
> +	union dpcd_training_lane dpcd_lane_settings[]);
>  void dp_decide_lane_settings(
>  	const struct link_training_settings *lt_settings,
>  	const union lane_adjust ln_adjust[LANE_COUNT_DP_MAX],
>  	struct dc_lane_settings hw_lane_settings[LANE_COUNT_DP_MAX],
> -	union dpcd_training_lane dpcd_lane_settings[LANE_COUNT_DP_MAX]);
> +	union dpcd_training_lane dpcd_lane_settings[]);
>  
>  uint32_t dp_translate_training_aux_read_interval(uint32_t dpcd_aux_read_interval);
>  

