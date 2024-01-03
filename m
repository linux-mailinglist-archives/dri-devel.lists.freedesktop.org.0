Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 581D2822FC2
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jan 2024 15:44:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7855410E326;
	Wed,  3 Jan 2024 14:44:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2058.outbound.protection.outlook.com [40.107.223.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B9AC10E321;
 Wed,  3 Jan 2024 14:44:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PjE0uebt4iL6PAg0/emZLAlm+hy12Bw9gKAFTRyteArDETvoJ5oc2gC7/NUxOXGsWsC6Lhqj2DOQJzGCYdIjvdsQVELJAhRC5/oaCSndI79i76o3+dDWu1apHUgOj7GVav0Z5jV9JRkLUCZ2W4zHOzOJ9ZpyODXhoJz1CX695sBgcha2kx9zjT+HpWQ2oWoaxNSVjhxhbLEEV/WPMPjC4XrhhNaSJKP0vsidYURuK7e0U43M5ghCETv1k8WydXBkrs3xAFRgPBwb+bW0wtyaNlkiO/C/jlFDUq+JZHxrA+iN4PGOcRit+yL9ch4ZYk2RhhJ728osxlvL2XEUl26jqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=312koKZs2vvKJWitshWnZ6CzYUthciDe2ok8bOkMtJE=;
 b=Y2Uu7JGNyaU/IqcH1qiy6LpUOE6xCtSMnZADjNDOaRbnJVBuYS7vkEtsVSe1l+9HlZyP3FAhnnwWkgU6zuEWup6T9YkcjXUf/x3VV5VUJOzSGGz/NcLx1EfPDPwa49SOJs/JVWY2NnUQr4bSC962d5nyw5ZM8+QdpWzay2vtyELHtIS84cOh5R+WTvd165tf/kp/0OuJ4dH32evqiaPvuXTnGM7+eBTFSQ3YQODSwoXnap/nDbwPHj07ksVFRxd9Cud5BGmY6I671MNpL5gU83VRpC+jWZMy/iIPPOrbZ8Ru+T9H9ATR3iGZ7+ALIPAYPjz3JJovqRgfNsOpeORB1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=312koKZs2vvKJWitshWnZ6CzYUthciDe2ok8bOkMtJE=;
 b=SLkRi/hgt2tTiVvR/LwVFmmGZaCpoM/POaEBZH39MMeo5wsVkuZLd+bW5Q7RqRg5nkx7go+Nhq0CYythjkG9OODHhmW71m3xUF3P2nkypC+9Moh9+I3C+1yPmmtvl6wMvyhJNk7ndT+oMFKz5CwvwHsT9L/5Wpg6cXlHkgPwEmc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB6280.namprd12.prod.outlook.com (2603:10b6:8:a2::11) by
 CH3PR12MB8933.namprd12.prod.outlook.com (2603:10b6:610:17a::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7135.25; Wed, 3 Jan
 2024 14:44:21 +0000
Received: from DM4PR12MB6280.namprd12.prod.outlook.com
 ([fe80::5358:4ba6:417e:c368]) by DM4PR12MB6280.namprd12.prod.outlook.com
 ([fe80::5358:4ba6:417e:c368%6]) with mapi id 15.20.7135.023; Wed, 3 Jan 2024
 14:44:21 +0000
Message-ID: <e8d478fe-a66b-4165-b2bc-ca5b263034c5@amd.com>
Date: Wed, 3 Jan 2024 09:44:18 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] drm/amd/display: fix bandwidth validation failure on
 DCN 2.1
Content-Language: en-US
To: Melissa Wen <mwen@igalia.com>, Harry Wentland <harry.wentland@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, sunpeng.li@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch, qingqing.zhuo@amd.com
References: <20231229163821.144599-1-mwen@igalia.com>
From: Hamza Mahfooz <hamza.mahfooz@amd.com>
In-Reply-To: <20231229163821.144599-1-mwen@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR0101CA0314.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:6c::27) To DM4PR12MB6280.namprd12.prod.outlook.com
 (2603:10b6:8:a2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6280:EE_|CH3PR12MB8933:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d153564-e98a-4ae0-a196-08dc0c6a790a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tjMuPTYRrnxPnt3j9Mz3p75qCa+e8C53gillcw4SYPbHbpzZUK0cMKykM/3QxjPQlvA5Ymz33NLuCYqDsII2FYVfuD0+sdYaivk14h51jCElHLISKPTazxZ0KKWPaq4l0W24C8HgkfeJBiiQO9eAef1wPuVpyxX7qdd3zdRX87//3Yl+CHSAveYICJAF2CZxRDxUNSSBO18jlE16QuQ3FJJTCyVC3KsnTIMkbqrVuIxbAcDUDeF6yufHwtBdSL9299L4ezMN5GJ7hHeb/ijZRqfWWTSf3/CFJFV+giKmWkctwzCg1Gu4tbGN7jwm8TtUfhDOdjm2rz7Dh1wAW16LI5RoWTeMD+EJCUv9UVNgzIGUUXGD79GBgItWyeBIce0SVi5sCHtdHAaTsAYuNRneGfm0MWHP6EcSwBQ83zGgn/Pbudqni6AwlX2nVu/gsiFqQAsanB6qCpmZqGvgltvo1FEnRvjRUWQORnyr2vjM76gm+B6pAvKWTSPTp7ZoPbqvIl1mD7SifzbEzqJc03r4AO2Mk716h5SgxuYnav7npP3Qvw9r7xwP1EgyqUenMLmKAN/a60ekPwAoBelyeD3u9Y5F2ewqZh9TeYIqE35MD9TrD6lR9OZ1vLwZoRDrEk2q758SgZ0PeegdMWTuBNaIZF+5bHgA7HPrn/xbuCAn+44vemFqpNy6dF5KzZOVymUA
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB6280.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(136003)(376002)(396003)(346002)(366004)(230173577357003)(230273577357003)(230922051799003)(1800799012)(451199024)(186009)(64100799003)(83380400001)(2616005)(26005)(41300700001)(38100700002)(8936002)(54906003)(44832011)(8676002)(110136005)(316002)(5660300002)(6666004)(4326008)(2906002)(966005)(478600001)(6636002)(53546011)(6486002)(66946007)(6506007)(66476007)(6512007)(86362001)(66556008)(31696002)(31686004)(36756003)(921011)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZWRBZ1FRMFlFZmxwTlJqMndHWDZrN0FhSGY4enVjME4ydHlTNVF5WWl5cjJO?=
 =?utf-8?B?YWlnUHZEL2JrMTk4cEJCaXE4dzlIc3BPTzQ5RUlGS1o3cmJDcHMzUlJZTzgy?=
 =?utf-8?B?YWcyd1Y4N2xpZDNhNVZSbkpOaTQ4MFpqTVJoaFlxVEhhM2NlU1A1ZFdYTXRR?=
 =?utf-8?B?QlcvWlU3QWVXVzhZU0pGUVhYOFhyeE5hS3lld0lUSHQrN09DRkVPcGdFQ3B2?=
 =?utf-8?B?V2lLTytwVzJKVldHc1A3WGVUNDZKd0VTUXluWVRmcGhPendPR2pPR1o0WDVz?=
 =?utf-8?B?QUJYUWQ2dCt2YzJiUmc3dXZFUzJxWTBaQWxtMjh0Z2lBYUw4MUJxUUxwUnN3?=
 =?utf-8?B?VkkwM0hWYWRhbkFLcjR0bTFOTGVJVFNyTzFLNEozcXl2VE50eXU5d1k0Q3NS?=
 =?utf-8?B?R29NZVFVSnFjYVQwd3Z4dXYxYkVNM3AwMjB1ZUdDbHhYWFhscXJyb2tTZ04r?=
 =?utf-8?B?LzY0eHRseU5ENjZLQ3IvZFZJOENlOWxrem1qSXNQeUZrWmZra2VkSkwwdlBJ?=
 =?utf-8?B?NE9UYldyYVRjdVBJOUhSbnlteElIZFNpWG9BZERrQmtGUlR6dURHdUJhQmVl?=
 =?utf-8?B?UDRkV0xYd204VTlaam94UUdzanZqSFdTS3lKNERUV25YNHpab2dVMG9tZ25J?=
 =?utf-8?B?K20ySkNlTXhUcFdiakFhbHVaRDl6akU0SzRhVXcrNUFyVnBKQnBRdHkwRWM0?=
 =?utf-8?B?TVFXVXZ1WHhuS0RPYnlleHpMSEtJaHM0MncxRUdrWTJqVDZ3YXdEcVhlKzI5?=
 =?utf-8?B?OW5yUjJVOHR0dEZ6dkxVSnhEbFVGQUlDcGVhQjBjWDhWR0xPM0RDVStocms4?=
 =?utf-8?B?enJQN0M0ZHJYLzE3NWtRMEVIejVCalRFTGM2L3JtTkEyeUptYnY0ZmhNek55?=
 =?utf-8?B?WHBjT0IzZVhrcjZ0dldKV1p5ZFphTktGanY5d0tkZGhydGozVWxZZFljQ3JX?=
 =?utf-8?B?cXVkVkduK055aks2TnpzT2hqMGpDVGErRUpEWk1IYy9Ea0xjQTdvVE1oTzFT?=
 =?utf-8?B?cDhhWm4waHh4VDl3NFZhTHdkSHhFWVpLbjNmVWpsSU11Q0RGZUdLTndhOWFa?=
 =?utf-8?B?VFIvam5KanY1Ymh2R3NWS0hKV0Z1OXhHVXdRSUluT3ZuOXloRWpVcGFoejZq?=
 =?utf-8?B?N2QvbDFiN3FCdU9Ba1VLTDhyLzlqNE1vcmZTKzUySlloK3ZiTHhtT1hPNlU4?=
 =?utf-8?B?Ny92QitHcW1oZEI1N1FBTVE2dnZKV3pqdmFzdk80SXBKQ2ltcUFsaWVSbjlo?=
 =?utf-8?B?VjJxV04vVlZwM3hiTmkzMkp4WFZwU3d0bXlIM0FUT3RiY2RsMnMvRy9JOHpO?=
 =?utf-8?B?UUVPd0F0VGlud2lqL1NVNzhxZzAyTVpjVFpjQTFENTNRZnNzOWlORnFCZGU0?=
 =?utf-8?B?bUN5TjFMRTExUUZDcW56ejNtYVJYQlU4cndaUk1DVUplWmw4UjFoVklqWnJ1?=
 =?utf-8?B?REhONUgvZzA3WnU3WmhvQUpQSysrRjQ1VmN5d0hRWGJLenkrY2VRZHVOTXZi?=
 =?utf-8?B?NXc3dTFINmNxZkFkbDRhSUlUY2MrMy9ZU1FBeWhMRXZsUFR5R1VJUkkyR051?=
 =?utf-8?B?ZS9PMkhaNVNWTmhPNzB4QkwwalVDQ3JzcmJqTCtEWE9nOWtRUEMyQllNSzhS?=
 =?utf-8?B?emo5MFVseE12akMwZzB0VFVkWVFvU0VVZzErRWl6Z0lXRFhPSzRTRHAvcWkx?=
 =?utf-8?B?VFlGOXNqaUU3SGd2QWhhb3Q1TmNjNFpZc0Q2RzVtNHJsVFRub2dxaVEzbjd6?=
 =?utf-8?B?K3VreXNNb2xTZVNGSzJPRjVuY1llWlZjLzVVNW10NFdRdmxYcVlyaW80dWZV?=
 =?utf-8?B?N04zVC9zSmh4QitnYk5uak9rZmFpTVVwODVRU1NYR0NFSDNqNmQvK29iWTRM?=
 =?utf-8?B?Z285WElVWFFQOTRDV1RSQjZhVi90UnJBWVRTeDRiVnZhVExMc28yZ0Jtai8z?=
 =?utf-8?B?OXlWaGFZZmNoaTFyMWdmeE9lRVA4T1R2ODVMRzZEQm1KZEpCeFRMUFVSMHZ6?=
 =?utf-8?B?UGdLYms3UHMwSHNSdzFja3hDK0Z6ZFlUcURHVnFTL0NmZ2hudm5tbzU2VkJw?=
 =?utf-8?B?aTFDYUdUYWFEbFQxNlplQ2VsWW4zNWlxblVWTXYxa0Z5dkNGWWJISFRRb2FM?=
 =?utf-8?Q?K+5nQRAfYWS8AdE1Vg+JAHp6g?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d153564-e98a-4ae0-a196-08dc0c6a790a
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6280.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jan 2024 14:44:21.8272 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tW4WBhVhBPghAQZDbVhaCGxc7Esdb2SFI5cxkJvgweIW879wj1f7VWuM2hxaLqi3cgEKvwMV9L8/4aXn86Ddag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8933
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
Cc: Alex Hung <alex.hung@amd.com>, dri-devel@lists.freedesktop.org,
 "stable@vger.kernel.org" <stable@vger.kernel.org>,
 Daniel Wheeler <daniel.wheeler@amd.com>, amd-gfx@lists.freedesktop.org,
 kernel-dev@igalia.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/29/23 11:25, Melissa Wen wrote:
> IGT `amdgpu/amd_color/crtc-lut-accuracy` fails right at the beginning of
> the test execution, during atomic check, because DC rejects the
> bandwidth state for a fb sizing 64x64. The test was previously working
> with the deprecated dc_commit_state(). Now using
> dc_validate_with_context() approach, the atomic check needs to perform a
> full state validation. Therefore, set fast_validation to false in the
> dc_validate_global_state call for atomic check.
> 
> Fixes: b8272241ff9d ("drm/amd/display: Drop dc_commit_state in favor of dc_commit_streams")
> Signed-off-by: Melissa Wen <mwen@igalia.com>
> ---
> 
> Hi,
> 
> It's a long story. I was inspecting this bug report:
> - https://gitlab.freedesktop.org/drm/amd/-/issues/2016
> and noticed the IGT test `igt@amdgpu/amd_color@crtc-lut-accuracy`
> mentioned there wasn't even being executed on a laptop with DCN 2.1
> (HP HP ENVY x360 Convertible 13-ay1xxx/8929). The test fails right at
> the beginning due to an atomic check rejection, as below:
> 
> Starting subtest: crtc-lut-accuracy
> (amd_color:14772) igt_kms-CRITICAL: Test assertion failure function igt_display_commit_atomic, file ../lib/igt_kms.c:4530:
> (amd_color:14772) igt_kms-CRITICAL: Failed assertion: ret == 0
> (amd_color:14772) igt_kms-CRITICAL: Last errno: 22, Invalid argument
> (amd_color:14772) igt_kms-CRITICAL: error: -22 != 0
> Stack trace:
>    #0 ../lib/igt_core.c:1989 __igt_fail_assert()
>    #1 [igt_display_commit_atomic+0x44]
>    #2 ../tests/amdgpu/amd_color.c:159 __igt_unique____real_main395()
>    #3 ../tests/amdgpu/amd_color.c:395 main()
>    #4 ../sysdeps/nptl/libc_start_call_main.h:74 __libc_start_call_main()
>    #5 ../csu/libc-start.c:128 __libc_start_main@@GLIBC_2.34()
>    #6 [_start+0x21]
> Subtest crtc-lut-accuracy failed.
> 
> Checking dmesg, we can see that a bandwidth validation failure causes
> the atomic check rejection:
> 
> [  711.147663] amdgpu 0000:04:00.0: [drm] Mode Validation Warning: Unknown Status failed validation.
> [  711.147667] [drm:amdgpu_dm_atomic_check [amdgpu]] DC global validation failure: Bandwidth validation failure (BW and Watermark) (13)
> [  711.147772] [drm:amdgpu_irq_dispatch [amdgpu]] Unregistered interrupt src_id: 243 of client_id:8
> [  711.148033] [drm:amdgpu_dm_atomic_check [amdgpu]] Atomic check failed with err: -22
> 
> I also noticed that the atomic check doesn't fail if I change the fb
> width and height used in the test from 64 to 66, and I can get the test
> execution back (and with success). However, I recall that all test cases
> of IGT `amd_color` were working in the past, so I bisected and found the
> first bad commit:
> 
> b8272241ff9d drm/amd/display: Drop dc_commit_state in favor of dc_commit_streams
> 
> Bringing the `dc_commit_state` machinery back also prevents the
> bandwidth validation failure, but the commit above says
> dc_commit_streams validation is more complete than dc_commit_state, so I
> discarded this approach.
> 
> After some debugging and code inspection, I found out that avoiding fast
> validation on dc_validate_global_state during atomic check solves the
> issue, but I'm not sure if this change may affect performance. I
> compared exec time of some IGT tests and didn't see any differences, but
> I recognize it doesn't provide enough evidence.
> 
> What do you think about this change? Should I examine other things? Do
> you see any potential issue that I should investigate? Could you
> recommend a better approach to assess any side-effect of not enabling
> fast validation in the atomic check?
> 
> Please, let me know your thoughts.

We shouldn't be doing fast updates when lock_and_validation_needed is
true, so this seems to be correct.

Which is to say, applied, thanks!

Cc: stable@vger.kernel.org

> 
> Happy New Year!
> 
> Melissa
> 
>   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index 2845c884398e..4f51a7ad7a3c 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -10745,7 +10745,7 @@ static int amdgpu_dm_atomic_check(struct drm_device *dev,
>   			DRM_DEBUG_DRIVER("drm_dp_mst_atomic_check() failed\n");
>   			goto fail;
>   		}
> -		status = dc_validate_global_state(dc, dm_state->context, true);
> +		status = dc_validate_global_state(dc, dm_state->context, false);
>   		if (status != DC_OK) {
>   			DRM_DEBUG_DRIVER("DC global validation failure: %s (%d)",
>   				       dc_status_to_str(status), status);
-- 
Hamza

