Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04A8D667A59
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jan 2023 17:08:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99FC810E2EB;
	Thu, 12 Jan 2023 16:08:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2082.outbound.protection.outlook.com [40.107.102.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EF3B10E2EA;
 Thu, 12 Jan 2023 16:08:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kHksKT8KFf2wqXjAcT59L/qvQ0E7fCrPSuDebekwgTNWmXR2vAsQfDWrmIpAr+N0BDkdXhfTCYPp2AUkk9mtjESBTa1OMTeSOZqxcwcWkTrfZlIigPPR3aVHWaRY9fAp2W+Q848ZWl2ditjWDFsPQTRCG2SJSP2u+wShwGz4BBguJnnqtUWdleRQQ/O76iY45UnBLqoUmrBzoak3qofSObWH5UJqQ9jxZfa7E5BF0JaLlwKEQwjVE8BhZNgT2ReRRHAeOr9Sbu4dutzX36cmRy4nuICSdRd3vEJrgu8D9dWPSyY7Mn6IItpfpqDhSYtC+puTbhMk5xHQSwagQ5YXIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1f/RIROETRBHaQzaJdiAT8u44+D64TS38uVrqNRocbY=;
 b=odl63GUZkwoqMsDOQrnrtNb4XIVopoxyKtUBEEDY2Va+ckFyo8JOZHyXX9x3U1Hg/t0tSMTbqWppwZ88na02Pdq1lhD1smbldq8fCYpMfNZjpeUWV00Bc1krfD7Sp8WVU/RxQOpv7rNQgBPfMKxxyJBZaCVO8TrqdlaJ1E6WOJPSwt+DqRrdeUDgEmXlaxFn4LNYNnHpC2XDdfNUS+Mr2JgZEZmHTp5HXCkYuMM3RxGDH5KKsZVb6z4W1xDRMjykZM2/eEUTF8ZQ5oa3oR9r4y80jgvLg2hf3wTZMvsnKh+kir6e2gbUvpDnYo3QacBVcCGx8FcSEHIdYW9ZshSomg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1f/RIROETRBHaQzaJdiAT8u44+D64TS38uVrqNRocbY=;
 b=C9WUsZRemgu20/ad1dYg63dRl2F5b20C8/yEmZt1xtG40NFU+iPWYCj9fv8qZWED0GlxY5K2r57iaJ4LhCFYYDpgxF3iOZe5kcV91rVms2VWEnwQLNRCmXoPRESC/Lx6LhJrc0nlK69Opu3tAQ/Qo7OPtMYUNzK96FwQZJpL23Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB2941.namprd12.prod.outlook.com (2603:10b6:208:a9::12)
 by SJ0PR12MB8616.namprd12.prod.outlook.com (2603:10b6:a03:485::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.19; Thu, 12 Jan
 2023 16:08:10 +0000
Received: from MN2PR12MB2941.namprd12.prod.outlook.com
 ([fe80::756d:ff13:d7bd:d590]) by MN2PR12MB2941.namprd12.prod.outlook.com
 ([fe80::756d:ff13:d7bd:d590%7]) with mapi id 15.20.5986.018; Thu, 12 Jan 2023
 16:08:10 +0000
Message-ID: <e4392f40-74bc-77c1-6058-941a7788fb02@amd.com>
Date: Thu, 12 Jan 2023 11:08:08 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH] drm/amd/display: Fix set scaling doesn's work
Content-Language: en-US
To: Harry Wentland <harry.wentland@amd.com>, nicholas.kazlauskas@amd.com,
 hongao <hongao@uniontech.com>
References: <20221122112034.30080-1-hongao@uniontech.com>
 <789c2c61-4959-c3c1-0916-d1cc7f659247@amd.com>
 <aea4b937-351a-f036-61e5-790af633f5f2@amd.com>
From: Rodrigo Siqueira Jordao <Rodrigo.Siqueira@amd.com>
In-Reply-To: <aea4b937-351a-f036-61e5-790af633f5f2@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT3PR01CA0141.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:83::34) To MN2PR12MB2941.namprd12.prod.outlook.com
 (2603:10b6:208:a9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB2941:EE_|SJ0PR12MB8616:EE_
X-MS-Office365-Filtering-Correlation-Id: 379fdfc5-e5b9-47a3-9a09-08daf4b73346
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OcZE1nIVzQpKsjwUfcjJeoNGY434bHFFWYMauzpSlt/13HZ5jqGAz/b3ShKm0nbV1U7KqSkCux2STkUd+OOmnD+a4keO7WbKW899SXBPqubaNsdW9mMsXzxLCPcVDrqLoXG8r9Tp1l5lFQk5GYb7N7YvftBVzjSzIU18efpGKCP/UU1mWamW5gtIKdZsqqUW6Gm+s3aM0KbxOibgERrsSLFX3EtIys8+jgABYP8v87H732jGtJzy93J3FQ5ht1hbG7m3LJ7EIAeYijfMiUtqEG/tePZET6ddBroK77KaJ+PF3aBeB4gWtKgTu2HXQConmURp430rc1M6mK5YRZuveqFFX1cudVu80YAWpM6p6lyOU8jyShyyPc0EjfCteZLWULmfp8DfW7M6vo3csNNe+kmT+jdBihsWrqv9yupP/4lcQNFHDcQh4eQi9P/Odgfiir2HwQ5LeGSdp7W42qrtrEFhMjwnO6x/pcWP1Y8AEmh2AhVD0I7+h1996a3oHVxtyb8aeovXvE/4li8IVKiwHcvTdOwKwCmmUApsmoSrNylZgxyTNS5W73ihdXS80slJLOY3CePmlhi6BYRJdR4kVq53pvayBxQjzwoYVkJW41CJgRb/2jhLEIMyuuiNM4V1R5nhgdlXk5njSXnOOe3HBUYi9BTDMsuppLWOgaAyEJXqE+BtcuZIDq/0cdiMiHu6BhDBPrVVe7D9MrkycQuWvXwNKkC73FHwaaVkYMfnJc0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB2941.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(366004)(376002)(39860400002)(136003)(346002)(396003)(451199015)(41300700001)(36756003)(31696002)(5660300002)(8936002)(53546011)(6512007)(26005)(186003)(6486002)(478600001)(6506007)(83380400001)(2616005)(110136005)(316002)(86362001)(4326008)(66476007)(8676002)(66556008)(66946007)(38100700002)(2906002)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NldEaEVwSU1Tc09hYmxUNmNrR25WK0RLc1Ezdm9JSVl0L2FBMFF5bTdvNlpn?=
 =?utf-8?B?eEZrVmE2L2lqV0tmYUwxUzlYdEhsbDUvODBHMnIzOTRQRkZVbnhreVBqQkFw?=
 =?utf-8?B?L3F3RnVMK0FqU2tpOVVha05rcEhMZWFQbHYrSloxY1FvQlNWNFNmYWdHQmhy?=
 =?utf-8?B?Q0phaUFtYVRNTmNvSm8xbFdvU1R1VmZ1bUQ0Q3drS3psdjd6eGJ4clV4b3Ir?=
 =?utf-8?B?NklCb3JRT1E3TFpnL1FzZnZZTytGbHVUcGV2YnpSaEp5Q1lNNzFLVERjZTZM?=
 =?utf-8?B?SmdFNTBSdVc3MlI3MTBhNzNKZGhsUDVWVjdmMmZMaDU3dUlBL2JyV1dScC9Z?=
 =?utf-8?B?SDdGbHJCVlRZbUgvL0lEQnJncU1idVcrWURJRWt6ZVk2NVJCaWgzSXo4Z3R0?=
 =?utf-8?B?ZlBPUTNXWksvbFZ6cDJZWkRUWjF3TE04WUVaanBRdDhXUlE2RkhZcUlVcWxU?=
 =?utf-8?B?NTk4Qkphc01PaGJnV05zblRPNzBFQmdBcFVZOW9VZURpZmF5MENUeTZ1dzI0?=
 =?utf-8?B?eGlnRnI4OXIyTnRSOUsyVndINERRMVBwVmJ0NTZYU0tZLzRrYUtqMUJPcTlT?=
 =?utf-8?B?TDJWczlBK251TTBLbW56R2RPT0ZManI1Q1JOc0tBdWdMSGVmUU04OWVmakQ2?=
 =?utf-8?B?VDlWL1ZQK25MUVozZE81T2FZbldyNVZjb0QrV2xjL25YaW5ZdW9FalVPK0FM?=
 =?utf-8?B?MTR0dDNSeTlEVTd0bFRNa0xWS1FWRXNCdzEzVDQydlJsT0tzU09jcEdQOUZy?=
 =?utf-8?B?anhOZWRvWDdTamU1UEcxUnZURG1Ea285SkVBVHlZQzF3d1hSaHRVdjZHNTlQ?=
 =?utf-8?B?c0luNU5ianVtRVhvVjFjbnNneDdoM0FDSElHSnV6TTZSOTViNE10YmZ5T0hZ?=
 =?utf-8?B?VHNkc3ErN2RhUXEzM2FXQmIyV0hjL2dSUVl4b1N2amN1RVpFN2hGeWlpTWN1?=
 =?utf-8?B?WE9VeU4wYm9rNGpzUEsyRlNYeVJPYzJOc2g1MllGUmcyRm54akNPdm1BZm5T?=
 =?utf-8?B?Vnlhang2dlEvM04veHNxQUp0eG5tQWc5RHZObXdzY2JSblNnRGpEeDMxVmY0?=
 =?utf-8?B?QUF3azI3SGVMYnlYZXAvTWtFbGxrcFhiK0s1bkhUUjI3TVRVNStaSGo3RVRi?=
 =?utf-8?B?cXJtbDd4L3Q0TE5JUzBUTURNUU9JeGxxeHZsZGVCRkJsU0xEQzlSVFl5TzVa?=
 =?utf-8?B?UWpFbmFGNEZpZFdKRERvZ1R6MmpKcFB5VG05T09XMUsxdTk3cjduVy9zcFFX?=
 =?utf-8?B?MTNUYzBmUzZkbElsMHFIQndNMUNSNnl5elF3ZG5nNndPNVdWUlZIcUw1RWEr?=
 =?utf-8?B?RzZuMW5xL25uWEk5b0p0dk5CMW5KWUhLaHV6bUpxUFNGNlhBTlVyUFhCWi9o?=
 =?utf-8?B?UkY4N0NGdGdiN3F2d3c3UlFNKzVUM1VyckpMekFtU2FCWVoyZ0NpSGVRUlhh?=
 =?utf-8?B?YWxjbEhZbkpWQUtxMEdXVHdmTTlJSWw4QTRwaTY2WGJHeFoxSVBzQk12bVFQ?=
 =?utf-8?B?ajNDNkZ4Qk51RVA5QW1JclZKaTJVNWtmY09DTzF0N3dxUmR4TTJjNWRmbXMx?=
 =?utf-8?B?N0NBR3BXc0Y3dWJlNUZWRmVtUllwdFZ1QnRjcXptQjBTNTJFK25wNFJzeXlx?=
 =?utf-8?B?eEE2aFdJaVh6czFvY2oyb2pTbU5HQVFlZy8wenl0dmZWTi8zTlZlNjB6U0c1?=
 =?utf-8?B?VmdXc0FiamtkbzVIL0hGQnVoK3NFbXV1RTYxV0hablJWK09XVEVuc3RpcVYv?=
 =?utf-8?B?WkVYU2w2Y3ZIa1dnRThiS3NmRVZLdGg4UVQ0dWFFY1pWWmMyTlZmZ2VOK21K?=
 =?utf-8?B?SkNjSVdhTERyUnJGYnpYL3dhbitpQW5ZWkl6cE9FQStoRGR2V0RrM3ZBLzU3?=
 =?utf-8?B?REpGanh4cldUTjR4a0ZyeEIwMXFYQ2hORGlwaHprT2d2SzhkZ2w5SGQxTUxD?=
 =?utf-8?B?ZHFtSkNLNzZ4QWhrTStqSm83Nzg2Y3pVdmd4bTlOcXdtUzhrcjJuZ29lQkp1?=
 =?utf-8?B?eW1RblMwQzFGR2pjUE1jM1dTTVoxMk9qU1hFaFk4cXpYOXJ0RnRuYkZJeHJj?=
 =?utf-8?B?YmJxNkVQVHFPc3VCZm1kTldodlMrcGpTU1ZQSCt4ZzNyZ2VkYUJISGVNV0tv?=
 =?utf-8?Q?ePxYUh9vO1AISU2gtODybdmet?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 379fdfc5-e5b9-47a3-9a09-08daf4b73346
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB2941.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2023 16:08:10.5147 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OUZkqxEiC64BCMkmlmfE9tDtyvHk9Q47tRPzhb8IQFA8Lc2JjHRzmzN0ZcEj7cAvHZbpFkc2MRl1ROuHnGycyg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB8616
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
Cc: sunpeng.li@amd.com, Xinhui.Pan@amd.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, roman.li@amd.com, Jerry.Zuo@amd.com,
 aurabindo.pillai@amd.com, amd-gfx@lists.freedesktop.org,
 alexander.deucher@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 1/11/23 10:19, Harry Wentland wrote:
> On 1/10/23 10:58, Rodrigo Siqueira Jordao wrote:
>>
>>
>> On 11/22/22 06:20, hongao wrote:
>>> [Why]
>>> Setting scaling does not correctly update CRTC state. As a result
>>> dc stream state's src (composition area) && dest (addressable area)
>>> was not calculated as expected. This causes set scaling doesn's work.
>>>
>>> [How]
>>> Correctly update CRTC state when setting scaling property.
>>>
>>> Signed-off-by: hongao <hongao@uniontech.com>
>>>
>>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>>> index 3e1ecca72430..a88a6f758748 100644
>>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>>> @@ -9386,8 +9386,8 @@ static int amdgpu_dm_atomic_check(struct drm_device *dev,
>>>                goto fail;
>>>            }
>>>    -        if (dm_old_con_state->abm_level !=
>>> -            dm_new_con_state->abm_level)
>>> +        if (dm_old_con_state->abm_level != dm_new_con_state->abm_level ||
>>> +            dm_old_con_state->scaling != dm_new_con_state->scaling)
>>>                new_crtc_state->connectors_changed = true;
>>>        }
>>>    
>>
>> Hi,
>>
>> This change lgtm, and I also run it in our CI, and from IGT perspective, we are good.
>>
>> Harry, do you have any comment about this change?
>>
> 
> LGTM
> 
> Reviewed-by: Harry Wentland <harry.wentland@amd.com>
> 
> Harry
> 
>> Thanks
>> Siqueira
> 

Thanks, patch applied to amd-staging-drm-next.


