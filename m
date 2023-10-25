Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B84DA7D7373
	for <lists+dri-devel@lfdr.de>; Wed, 25 Oct 2023 20:39:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 266D510E5DB;
	Wed, 25 Oct 2023 18:39:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20618.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5a::618])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 422C210E5DB;
 Wed, 25 Oct 2023 18:39:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R3lk74qMJow4QmauDaC5+J4SOWM+qRX8RQOqq1KnLzrynLjYSnrNWuUxyJdKIJFIV1KRcBi+OeP6VG28qzee6Qzs9iJHJvAoaIBzXMolW5jFQ8OSrhqu+iS55v2rTEPXjTURAo5OcG5Y0soODqg3OpatxQ6YsIHmpYDXQZr/ZEXSWN4X0h3yuuWFE+Ouvc8l3kkj8mCdnu8Rt+XGeJPaok7gkDJL6NB0Z8yYFB+7uFJBDO9Nn4oOvWpTW59k7cZ3ijz6jDLogPIqsMUsvCjMS3gOISCPPrG9NCegaukKdHY9mseoXi/GvP094j+8/lSe+CkwbjSnrfGPiUpxb/bmDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uoHnUdw0J7l0gO7tc7QrIWEv2Ouqg/2IjzkEzr05Ldc=;
 b=XQ0pGVuyoEfeTSzKTaVS52Aqm1iFoMsyiPSY6v0JDW+oHiD+Tr4yoOMXIg8irvITYdOUHFuFbmh1JrTkRKrFo6WXO1+6k+wfh8J5W/Mio/yxebEnwVdfjVNhIkyNa3lVWd0RCKQXWV3dWOTPbnOUEpOoP7eoNJIcrGWdaA7/l5LjaOAPreJc+FDDwOSgMS9ICJ//64ppH248cXNQCcheEgT/dzd40nm6D7ttfB/u5tP1bzYwDJRTFm8bafbS0RhrNo4xHcLbfDP07OU7GoxX3dee7LnltQOEMQPcrvjL2SYQmrB5tubrkLV9YloTFP8QtN73f0d5ajpHNdCc3my3pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uoHnUdw0J7l0gO7tc7QrIWEv2Ouqg/2IjzkEzr05Ldc=;
 b=UvIPJ6Cqdc6sgGNhJNCMbH80FBpSSO5BzXZKbtyfvjNqCnP/lvVuahdbJcfwonaqS76PiW+hSb9UqZ6Rx3BoXTRK9yvZuOEKEqOQdeX/hVpJf2pcYf/lG2b7RzaPiaw+w8P/2RQbpVOFEKTpEQtVvVRF0hfUM6h5fKIIYdws7J0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3370.namprd12.prod.outlook.com (2603:10b6:5:38::25) by
 DM6PR12MB4073.namprd12.prod.outlook.com (2603:10b6:5:217::12) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6907.33; Wed, 25 Oct 2023 18:39:18 +0000
Received: from DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::b80b:7138:6ceb:9aef]) by DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::b80b:7138:6ceb:9aef%6]) with mapi id 15.20.6907.025; Wed, 25 Oct 2023
 18:39:18 +0000
Message-ID: <707211a4-8953-42b4-b6d9-1210306781da@amd.com>
Date: Wed, 25 Oct 2023 14:39:15 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:115.0) Gecko/20100101
 Thunderbird/115.3.3
Subject: Re: [PATCH v6 4/7] drm/sched: Add DRM_SCHED_POLICY_SINGLE_ENTITY
 scheduling policy
Content-Language: en-CA, en-US
To: Matthew Brost <matthew.brost@intel.com>
References: <20231017150958.838613-1-matthew.brost@intel.com>
 <20231017150958.838613-5-matthew.brost@intel.com>
 <b0dff3c9-933a-42c9-97ae-7b82cf842799@amd.com>
 <ZTkwqCdNvlrM9w35@DUT025-TGLU.fm.intel.com>
From: Luben Tuikov <luben.tuikov@amd.com>
Autocrypt: addr=luben.tuikov@amd.com; keydata=
 xjMEY1i6jxYJKwYBBAHaRw8BAQdAhfD+Cc+P5t/fiF08Vw25EMLiwUuxULYRiDQAP6H50MTN
 I0x1YmVuIFR1aWtvdiA8bHViZW4udHVpa292QGFtZC5jb20+wpkEExYKAEEWIQQyyR05VSHw
 x45E/SoppxulNG8HhgUCY1i6jwIbAwUJCWYBgAULCQgHAgIiAgYVCgkICwIEFgIDAQIeBwIX
 gAAKCRAppxulNG8Hhk53AP4k4UY5xfcje0c5OF1k22pNv8tErxtVpgKKZgvfetA4xwD+OoAh
 vesLIYumBDxP0BoLiLN84udxdT15HwPFUGiDmwDOOARjWLqPEgorBgEEAZdVAQUBAQdAzSxY
 a2EtvvIwd09NckBLSTarSLNDkUthmqPnwolwiDYDAQgHwn4EGBYKACYWIQQyyR05VSHwx45E
 /SoppxulNG8HhgUCY1i6jwIbDAUJCWYBgAAKCRAppxulNG8HhnBLAP4yjSGpK6PE1mapKhrq
 8bSl9reo+F6EqdhE8X2TTHPycAEAt8EkTEstSiaOpM66gneU7r+xxzOYULo1b1XjXayGvwM=
In-Reply-To: <ZTkwqCdNvlrM9w35@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR0101CA0248.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:66::30) To DM6PR12MB3370.namprd12.prod.outlook.com
 (2603:10b6:5:38::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB3370:EE_|DM6PR12MB4073:EE_
X-MS-Office365-Filtering-Correlation-Id: b6b1d387-65dc-4b6b-c605-08dbd589b268
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yYa/7X8CN/tBbavmjpiNo8DaADmW/YY7VI1+6eyfs5/N/rSSIwmPTUCyTbueb1IKUGF16LaGiS03Thsn91LOuYtGJawnVksPlAsqivdiF4vOiCZdQerwimGpFBJ+/aBsVncNQW8PQFaMVP1ORw1EeDueMsSl7MIk+MKwoz2leLlJfbDp8GZaiaZp1Sp4RfECwzIowM70ko3cD3hN3rvxU568JT039baGbPtA6zRBFb5MmedKmMUqMCYjvkSqzWOjFuhtWmJ1MnYSu6G8Y14+9mfHbQw1I1SzQttSk5EjIvTmCF0nyd8B2ivZfg15mqnnrAKI3xSu2Wehoa6PEBfsjlvanC3G8j0JuVuTMnADw7p5AyeXqkXIDlaAzp9AiD3EnwK3A3cRPlZiCcYTDTQUOy2IYBT3v1IvGs0hBPxknwb5Fgw3EajEX2xxaJaTjYYPd7IH7sBnoi0QV/LLiKmQr1eamBDVNdomPWDA1ilj50fnMlIQcswsflT5ot31tsuSRUyd58fY6d/ki0MMwNvziUTJK1/BvmSKPtvhw6O+513lUEjYJ7pPD7nC9YNzxxNyM1vSXTwGQ9mx9/uHyS7GHJayUiTV1jfFtm3HtW6SXOzVBagoMwxfFexP+c7jspAmxQQ12VGtxJkwCAq/3kFHjDaLP1K+ewXFrEo+5JGzDf2pYu6w2Lcd6aG4QHSiBY+r
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3370.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(376002)(346002)(39860400002)(136003)(396003)(230922051799003)(186009)(451199024)(64100799003)(1800799009)(26005)(31686004)(4001150100001)(38100700002)(41300700001)(2906002)(30864003)(44832011)(36756003)(7416002)(31696002)(86362001)(5660300002)(4326008)(8676002)(8936002)(2616005)(6506007)(478600001)(6666004)(66556008)(6916009)(316002)(66946007)(66476007)(83380400001)(53546011)(6512007)(966005)(6486002)(43740500002)(45980500001)(309714004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QUlqSkxrUzBsOU1UbTJ2ZHJ2Nzg4WGhIcnFNNHFLaXRWQ3d6RWhteW9OdXNl?=
 =?utf-8?B?czU5aUJNUzJ3MTEvV0lwbXNQelJKQkNiM2ljRU5TWUVHeFpKdU4rcDlra3d3?=
 =?utf-8?B?aFc1ZFJkN2I4c3h0YjB5eGdtZUtRUDExTDRGZDdHSTJ4MlVuTTAwM0IrcFQ4?=
 =?utf-8?B?S3NrUERPWndTZnBSVERKdWlYTzRZM3RvZ2d2SkhIZ09QcjJLTmpzbi8vNGEx?=
 =?utf-8?B?WktNSERsZEpRajc0T1hENVNFeU54eU85OHNtK1JJVVVKbXZqS2puNDBZVmh5?=
 =?utf-8?B?RGFZRHFRcGhqUjVVeXU1Vk4vU3NtelFGckNPQmtyTEpidUUyK3VoVHlaZEJG?=
 =?utf-8?B?NlBCMGNqTDVpd0laZTg1ZjFtYzNnY0FGcy8rdEpTb1ZyWTVmRkpTWVhCN2NK?=
 =?utf-8?B?VTEzOVFQSDZpMTM0ZE94Q1VMMThwY09YNkFKNFBGanJhUUJveGlUZTZJSGc2?=
 =?utf-8?B?anVZclZjdDFJbldRcEFrVmV2d1piL1dDVm0zMXJqM1RFQ1pGZy9BbVhPLzZS?=
 =?utf-8?B?ZlZzS1VjeFRNU0Y0djJrRjgwVHI5OWNzWWN2NFNMVHd6T0R1TUlCMWlXajJq?=
 =?utf-8?B?QW9QVFo2SmliRVhJaTkxSVdDQ1IwZWZXWWx6eExVZlNVazlRK1Z0MFhVSUN2?=
 =?utf-8?B?K3BPbEc5enJqcWtFMWoySnU2cGVPOXlxTmhrbjNVb3Q5b2VsaXZLUkxveXMr?=
 =?utf-8?B?b0ZxVVBJZFFZd2M0THhFRXRXaUxERm41cG5idXNOV0t4UmhHb2hNcHAxME5C?=
 =?utf-8?B?a3hUazBsS01PUlQxaXJMeDdUa3h1eWhmcU52a2w2aFB3a3BDRmRiN0F1djNV?=
 =?utf-8?B?ZDlMVnpDZUNFRElyQ2xKRjNGME9lU0FhL3lZVmZ4TDBkd3JaY3Y2YlZ1N2ps?=
 =?utf-8?B?SjNLNml0NXN4SWJJRldxcGlhZHlnQm9aK0tNZGlSZXhoS01hZ2lzUTI2VkQ3?=
 =?utf-8?B?ckU2Qy9rT1JLSWxKZnM3c0sweXgyTG9LZnN4RklHQUIyc1J4UmlSVGxWeVpz?=
 =?utf-8?B?TEpwaXpnbVpoU0FYRUd5Zmd2ZDZkRXE0ZWhEbWtKc1pHN2kzTGpxV25lTzdi?=
 =?utf-8?B?Rk0zVTBiWTNHK3BmTUNuM3JIY1psZWkzK2UrL2VUR0pJOHdaQTc3UDBSVnM4?=
 =?utf-8?B?em41eFI1bm9nM3ZlWkx3RDk1UUFOYytkYTZ6WVo4bWFMcWY1RWhydmdxZ0sz?=
 =?utf-8?B?YzJJQlJTNnRQMVRlYXl1Y09vU2QvNER2TkRlOFFYc2hPQ09sbTlVVEVEbVpD?=
 =?utf-8?B?TFE2VTVRVFdCY0hlc1ZwS09JZmREWGNXSGFxT1JrSXFnOWtWNDhNQ0JwYVZj?=
 =?utf-8?B?NXI4S2dsbEFVTGVvZ2hWK2lteDdHSm5Lc2xNYXA2amduNVB6R1lnbGZDZXlk?=
 =?utf-8?B?TlFFNWpKdWwrTnhZOXZhY0szZnk2SEUzNk9kUWorR3FzN2VORG1RdjJxQzlY?=
 =?utf-8?B?RVE1NnJvWjlYc3FyaDJ1MDlQK1Jscm1mWUN6Zlg3QnJVZWpMUFh4ZVlXNEZE?=
 =?utf-8?B?UCsrZDV2ck5jR00wYWNpbUdrRXVkSlk0TU5WZERZdUtRMXJ0bkwyejE0OUMr?=
 =?utf-8?B?eGkzV09BK3VzV2hPUXRhVHJwaWg0ZjBMN2Q0Q3VmN0NkMW05K3Y0Nk1HWXlC?=
 =?utf-8?B?d2RveFFFb04xSGhTQVFRSXNqbTFOQTdNeFYrdmt2aDN1N29nRVhoUytyaDhW?=
 =?utf-8?B?bEc0TW1RTERROVlldCtkcmxlV240ME1hMldFbVdqb09RR3pkWUtpTjNvQ1k3?=
 =?utf-8?B?MlFyOVRwaUdpcFJjREtZb2lJejdUZlpOUnBma3FrVEdsMUhkQm84RzZkcHpH?=
 =?utf-8?B?ZVJ5U0xTQ1k5WTdxYzZraUdqQ29XdHlSd21DNytlcFlkWWMwNFdNSXZyYkFX?=
 =?utf-8?B?d3BtQWhmRUFVK3VGcGo4dEtxWGFsanh4TnFJMGNIOW5ScVlPdXM0dVAwR0ZK?=
 =?utf-8?B?VDBTQmxEbUpRa3hEOExDVVA4Qm0vMC9oYk9QTDJXb0hUbW1jZHVHMEtDMGRs?=
 =?utf-8?B?WGVzZVh2WEd6ald4WnIraVcxMk1CZVF5SENwaWV1L1FKK2M1bTFYbEVuQ2tv?=
 =?utf-8?B?SU03M3dJcnJxeTVCUjRRWGpzd1dYTU5FQXdnMEtuYkpYV0pEWE1VRlo0cXVy?=
 =?utf-8?Q?rH9V4n/sSSSnPFYdm5G3B0+ce?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b6b1d387-65dc-4b6b-c605-08dbd589b268
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3370.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2023 18:39:18.5220 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nvlaX8B/SF/ERZBpaeSWcNWLMVESqQK0qJlX3FcnOSgEg0iWBr4kc/qcF47NNWpi
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4073
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
Cc: robdclark@chromium.org, thomas.hellstrom@linux.intel.com,
 sarah.walker@imgtec.com, ketil.johnsen@arm.com, lina@asahilina.net,
 mcanal@igalia.com, Liviu.Dudau@arm.com, dri-devel@lists.freedesktop.org,
 christian.koenig@amd.com, boris.brezillon@collabora.com, dakr@redhat.com,
 donald.robson@imgtec.com, intel-xe@lists.freedesktop.org,
 faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Matt,

On 2023-10-25 11:13, Matthew Brost wrote:
> On Mon, Oct 23, 2023 at 11:50:26PM -0400, Luben Tuikov wrote:
>> Hi,
>>
>> On 2023-10-17 11:09, Matthew Brost wrote:
>>> DRM_SCHED_POLICY_SINGLE_ENTITY creates a 1 to 1 relationship between
>>> scheduler and entity. No priorities or run queue used in this mode.
>>> Intended for devices with firmware schedulers.
>>>
>>> v2:
>>>   - Drop sched / rq union (Luben)
>>> v3:
>>>   - Don't pick entity if stopped in drm_sched_select_entity (Danilo)
>>> v4:
>>>   - Rework if statement in drm_sched_entity_init (Luben)
>>>   - Update comment for drm_sched_entity_to_scheduler (Luben)
>>>   - Reword a few things in DOC comment (Luben)
>>>   - Do not check sched policy in for statement (Luben)
>>> v5:
>>>   - Fix extra blank lines (Luben / Checkpatch)
>>>
>>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>>> ---
>>>  drivers/gpu/drm/scheduler/sched_entity.c | 69 +++++++++++++++----
>>>  drivers/gpu/drm/scheduler/sched_fence.c  |  2 +-
>>>  drivers/gpu/drm/scheduler/sched_main.c   | 87 ++++++++++++++++++------
>>>  include/drm/gpu_scheduler.h              |  8 +++
>>>  4 files changed, 130 insertions(+), 36 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
>>> index cf42e2265d64..940f63dd6965 100644
>>> --- a/drivers/gpu/drm/scheduler/sched_entity.c
>>> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
>>> @@ -83,6 +83,7 @@ int drm_sched_entity_init(struct drm_sched_entity *entity,
>>>  	memset(entity, 0, sizeof(struct drm_sched_entity));
>>>  	INIT_LIST_HEAD(&entity->list);
>>>  	entity->rq = NULL;
>>> +	entity->single_sched = NULL;
>>>  	entity->guilty = guilty;
>>>  	entity->num_sched_list = num_sched_list;
>>>  	entity->priority = priority;
>>> @@ -90,8 +91,17 @@ int drm_sched_entity_init(struct drm_sched_entity *entity,
>>>  	RCU_INIT_POINTER(entity->last_scheduled, NULL);
>>>  	RB_CLEAR_NODE(&entity->rb_tree_node);
>>>  
>>> -	if(num_sched_list)
>>> -		entity->rq = &sched_list[0]->sched_rq[entity->priority];
>>> +	if (num_sched_list) {
>>> +		if (sched_list[0]->sched_policy !=
>>> +		    DRM_SCHED_POLICY_SINGLE_ENTITY) {
>>> +			entity->rq = &sched_list[0]->sched_rq[entity->priority];
>>> +		} else if (num_sched_list == 1 && !sched_list[0]->single_entity) {
>>> +			sched_list[0]->single_entity = entity;
>>> +			entity->single_sched = sched_list[0];
>>
>> To simplify the rest of the GPU scheduler design and generalize the logic,
>> we can do
>> 	entity->rq = sched_list[0]->sched_rq[entity->priority];
>> where the "priority" is 0, thus having a single rq.
>>
>> We shouldn't splice scheduler and entity, but rather make it so that
>> we can set the number of rqs to 1, thus resulting in a single rq.
>>
>> (https://lore.kernel.org/r/20231023032251.164775-1-luben.tuikov@amd.com)
>>
> 
> I pulled out this patch [1] + previous one [2] and included your [3] to
> test this in Xe [4].
> 
> It seems to work with just one rq per scheduler. We can go with this
> approach in feel like this is the route. My next post will include your
> patch [3] if we agree.

Yeah, this is good. Thanks!

I feel that the sched_rq[] static array should've been a dynamic one
from the outset--one of the hallmarks of a flexible scheduler. Then
let each driver announce how many priorities they care about. A scheduler
shouldn't be as rigid as to force drivers to care and/or support so and
so many run-queues (priorities).

For a good code design, we want to allow for more driver implementations
with minimal (or no) DRM changes--all accommodated by drm_sched_init(), yet,
accommodating a varied behaviour, and having the sched_rq be dynamic and let
each driver announce how many run-queues it wants is the minimal change we
can do now (and easiest), with best outcome for Xe and new drivers.

Regards,
Luben

> 
> Matt
> 
> [1] https://patchwork.freedesktop.org/patch/563094/?series=121745&rev=8
> [2] https://patchwork.freedesktop.org/patch/563093/?series=121745&rev=8
> [3] https://patchwork.freedesktop.org/patch/563817/?series=125433&rev=1
> [4] https://patchwork.freedesktop.org/series/125540/
> 
>>> +		} else {
>>> +			return -EINVAL;
>>> +		}
>>> +	}
>>>  
>>>  	init_completion(&entity->entity_idle);
>>>  
>>> @@ -124,7 +134,8 @@ void drm_sched_entity_modify_sched(struct drm_sched_entity *entity,
>>>  				    struct drm_gpu_scheduler **sched_list,
>>>  				    unsigned int num_sched_list)
>>>  {
>>> -	WARN_ON(!num_sched_list || !sched_list);
>>> +	WARN_ON(!num_sched_list || !sched_list ||
>>> +		!!entity->single_sched);
>>
>> We wouldn't need this check.
>>
>>>  
>>>  	entity->sched_list = sched_list;
>>>  	entity->num_sched_list = num_sched_list;
>>> @@ -231,13 +242,15 @@ static void drm_sched_entity_kill(struct drm_sched_entity *entity)
>>>  {
>>>  	struct drm_sched_job *job;
>>>  	struct dma_fence *prev;
>>> +	bool single_entity = !!entity->single_sched;
>>>  
>>> -	if (!entity->rq)
>>> +	if (!entity->rq && !single_entity)
>>>  		return;
>>>  
>>>  	spin_lock(&entity->rq_lock);
>>>  	entity->stopped = true;
>>> -	drm_sched_rq_remove_entity(entity->rq, entity);
>>> +	if (!single_entity)
>>> +		drm_sched_rq_remove_entity(entity->rq, entity);
>>>  	spin_unlock(&entity->rq_lock);
>>
>> We should be able to carry on the existing infrastructure when
>> having num_rqs = 1, with dynamic rqs. So we shouldn't warrant
>> any changes here.
>>
>>>  
>>>  	/* Make sure this entity is not used by the scheduler at the moment */
>>> @@ -259,6 +272,20 @@ static void drm_sched_entity_kill(struct drm_sched_entity *entity)
>>>  	dma_fence_put(prev);
>>>  }
>>>  
>>> +/**
>>> + * drm_sched_entity_to_scheduler - Schedule entity to GPU scheduler
>>> + * @entity: scheduler entity
>>> + *
>>> + * Returns GPU scheduler for the entity
>>> + */
>>> +struct drm_gpu_scheduler *
>>> +drm_sched_entity_to_scheduler(struct drm_sched_entity *entity)
>>> +{
>>> +	bool single_entity = !!entity->single_sched;
>>> +
>>> +	return single_entity ? entity->single_sched : entity->rq->sched;
>>
>> It would be "entity->rq->sched" for any and all cases which simplifies things.
>>
>>> +}
>>> +
>>>  /**
>>>   * drm_sched_entity_flush - Flush a context entity
>>>   *
>>> @@ -276,11 +303,12 @@ long drm_sched_entity_flush(struct drm_sched_entity *entity, long timeout)
>>>  	struct drm_gpu_scheduler *sched;
>>>  	struct task_struct *last_user;
>>>  	long ret = timeout;
>>> +	bool single_entity = !!entity->single_sched;
>>>  
>>> -	if (!entity->rq)
>>> +	if (!entity->rq && !single_entity)
>>>  		return 0;
>>>  
>>> -	sched = entity->rq->sched;
>>> +	sched = drm_sched_entity_to_scheduler(entity);
>>>  	/**
>>>  	 * The client will not queue more IBs during this fini, consume existing
>>>  	 * queued IBs or discard them on SIGKILL
>>> @@ -373,7 +401,7 @@ static void drm_sched_entity_wakeup(struct dma_fence *f,
>>>  		container_of(cb, struct drm_sched_entity, cb);
>>>  
>>>  	drm_sched_entity_clear_dep(f, cb);
>>> -	drm_sched_wakeup_if_can_queue(entity->rq->sched);
>>> +	drm_sched_wakeup_if_can_queue(drm_sched_entity_to_scheduler(entity));
>>>  }
>>
>> We can carry on that too, without changes. The good part of that is that
>> we'll inherit all the fence work and checking for free.
>>
>>>  
>>>  /**
>>> @@ -387,6 +415,8 @@ static void drm_sched_entity_wakeup(struct dma_fence *f,
>>>  void drm_sched_entity_set_priority(struct drm_sched_entity *entity,
>>>  				   enum drm_sched_priority priority)
>>>  {
>>> +	WARN_ON(!!entity->single_sched);
>>> +
>>>  	spin_lock(&entity->rq_lock);
>>>  	entity->priority = priority;
>>>  	spin_unlock(&entity->rq_lock);
>>> @@ -399,7 +429,7 @@ EXPORT_SYMBOL(drm_sched_entity_set_priority);
>>>   */
>>>  static bool drm_sched_entity_add_dependency_cb(struct drm_sched_entity *entity)
>>>  {
>>> -	struct drm_gpu_scheduler *sched = entity->rq->sched;
>>> +	struct drm_gpu_scheduler *sched = drm_sched_entity_to_scheduler(entity);
>>>  	struct dma_fence *fence = entity->dependency;
>>>  	struct drm_sched_fence *s_fence;
>>>  
>>> @@ -501,7 +531,8 @@ struct drm_sched_job *drm_sched_entity_pop_job(struct drm_sched_entity *entity)
>>>  	 * Update the entity's location in the min heap according to
>>>  	 * the timestamp of the next job, if any.
>>>  	 */
>>> -	if (entity->rq->sched->sched_policy == DRM_SCHED_POLICY_FIFO) {
>>> +	if (drm_sched_entity_to_scheduler(entity)->sched_policy ==
>>> +	    DRM_SCHED_POLICY_FIFO) {
>>>  		struct drm_sched_job *next;
>>>  
>>>  		next = to_drm_sched_job(spsc_queue_peek(&entity->job_queue));
>>> @@ -524,6 +555,8 @@ void drm_sched_entity_select_rq(struct drm_sched_entity *entity)
>>>  	struct drm_gpu_scheduler *sched;
>>>  	struct drm_sched_rq *rq;
>>>  
>>> +	WARN_ON(!!entity->single_sched);
>>> +
>>>  	/* single possible engine and already selected */
>>>  	if (!entity->sched_list)
>>>  		return;
>>> @@ -573,12 +606,13 @@ void drm_sched_entity_select_rq(struct drm_sched_entity *entity)
>>>  void drm_sched_entity_push_job(struct drm_sched_job *sched_job)
>>>  {
>>>  	struct drm_sched_entity *entity = sched_job->entity;
>>> -	bool first, fifo = entity->rq->sched->sched_policy ==
>>> -		DRM_SCHED_POLICY_FIFO;
>>> +	bool single_entity = !!entity->single_sched;
>>> +	bool first;
>>>  	ktime_t submit_ts;
>>>  
>>>  	trace_drm_sched_job(sched_job, entity);
>>> -	atomic_inc(entity->rq->sched->score);
>>> +	if (!single_entity)
>>> +		atomic_inc(entity->rq->sched->score);
>>>  	WRITE_ONCE(entity->last_user, current->group_leader);
>>>  
>>>  	/*
>>> @@ -591,6 +625,10 @@ void drm_sched_entity_push_job(struct drm_sched_job *sched_job)
>>>  
>>>  	/* first job wakes up scheduler */
>>>  	if (first) {
>>> +		struct drm_gpu_scheduler *sched =
>>> +			drm_sched_entity_to_scheduler(entity);
>>> +		bool fifo = sched->sched_policy == DRM_SCHED_POLICY_FIFO;
>>> +
>>>  		/* Add the entity to the run queue */
>>>  		spin_lock(&entity->rq_lock);
>>>  		if (entity->stopped) {
>>> @@ -600,13 +638,14 @@ void drm_sched_entity_push_job(struct drm_sched_job *sched_job)
>>>  			return;
>>>  		}
>>>  
>>> -		drm_sched_rq_add_entity(entity->rq, entity);
>>> +		if (!single_entity)
>>> +			drm_sched_rq_add_entity(entity->rq, entity);
>>>  		spin_unlock(&entity->rq_lock);
>>>  
>>>  		if (fifo)
>>>  			drm_sched_rq_update_fifo(entity, submit_ts);
>>>  
>>> -		drm_sched_wakeup_if_can_queue(entity->rq->sched);
>>> +		drm_sched_wakeup_if_can_queue(sched);
>>>  	}
>>>  }
>>>  EXPORT_SYMBOL(drm_sched_entity_push_job);
>>> diff --git a/drivers/gpu/drm/scheduler/sched_fence.c b/drivers/gpu/drm/scheduler/sched_fence.c
>>> index 06cedfe4b486..f6b926f5e188 100644
>>> --- a/drivers/gpu/drm/scheduler/sched_fence.c
>>> +++ b/drivers/gpu/drm/scheduler/sched_fence.c
>>> @@ -225,7 +225,7 @@ void drm_sched_fence_init(struct drm_sched_fence *fence,
>>>  {
>>>  	unsigned seq;
>>>  
>>> -	fence->sched = entity->rq->sched;
>>> +	fence->sched = drm_sched_entity_to_scheduler(entity);
>>>  	seq = atomic_inc_return(&entity->fence_seq);
>>>  	dma_fence_init(&fence->scheduled, &drm_sched_fence_ops_scheduled,
>>>  		       &fence->lock, entity->fence_context, seq);
>>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
>>> index 150e5330f0fa..273e0fbc4eab 100644
>>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>>> @@ -32,7 +32,8 @@
>>>   * backend operations to the scheduler like submitting a job to hardware run queue,
>>>   * returning the dependencies of a job etc.
>>>   *
>>> - * The organisation of the scheduler is the following:
>>> + * For scheduling policies DRM_SCHED_POLICY_RR and DRM_SCHED_POLICY_FIFO, the
>>> + * scheduler organization is:
>>>   *
>>>   * 1. Each hw run queue has one scheduler
>>>   * 2. Each scheduler has multiple run queues with different priorities
>>> @@ -43,7 +44,24 @@
>>>   *
>>>   * The jobs in a entity are always scheduled in the order that they were pushed.
>>>   *
>>> - * Note that once a job was taken from the entities queue and pushed to the
>>> + * For DRM_SCHED_POLICY_SINGLE_ENTITY, the organization of the scheduler is:
>>> + *
>>> + * 1. One to one relationship between scheduler and entity
>>> + * 2. No priorities implemented per scheduler (single job queue)
>>> + * 3. No run queues in scheduler rather jobs are directly dequeued from entity
>>> + * 4. The entity maintains a queue of jobs that will be scheduled to the
>>> + * hardware
>>> + *
>>> + * The jobs in a entity are always scheduled in the order that they were pushed
>>> + * regardless of scheduling policy. Single-entity scheduling is essentially a
>>> + * FIFO for jobs.
>>> + *
>>> + * A policy of DRM_SCHED_POLICY_RR or DRM_SCHED_POLICY_FIFO is expected to be
>>> + * used when the kernel-mode driver is scheduling directly to the hardware while
>>> + * a scheduling policy of DRM_SCHED_POLICY_SINGLE_ENTITY is expected to be used
>>> + * when there is a firmware scheduler.
>>> + *
>>> + * Note that once a job is taken from the entities queue and pushed to the
>>>   * hardware, i.e. the pending queue, the entity must not be referenced anymore
>>>   * through the jobs entity pointer.
>>>   */
>>> @@ -96,6 +114,8 @@ static inline void drm_sched_rq_remove_fifo_locked(struct drm_sched_entity *enti
>>>  
>>>  void drm_sched_rq_update_fifo(struct drm_sched_entity *entity, ktime_t ts)
>>>  {
>>> +	WARN_ON(!!entity->single_sched);
>>> +
>>>  	/*
>>>  	 * Both locks need to be grabbed, one to protect from entity->rq change
>>>  	 * for entity from within concurrent drm_sched_entity_select_rq and the
>>> @@ -126,6 +146,8 @@ void drm_sched_rq_update_fifo(struct drm_sched_entity *entity, ktime_t ts)
>>>  static void drm_sched_rq_init(struct drm_gpu_scheduler *sched,
>>>  			      struct drm_sched_rq *rq)
>>>  {
>>> +	WARN_ON(sched->sched_policy == DRM_SCHED_POLICY_SINGLE_ENTITY);
>>> +
>>>  	spin_lock_init(&rq->lock);
>>>  	INIT_LIST_HEAD(&rq->entities);
>>>  	rq->rb_tree_root = RB_ROOT_CACHED;
>>> @@ -144,6 +166,8 @@ static void drm_sched_rq_init(struct drm_gpu_scheduler *sched,
>>>  void drm_sched_rq_add_entity(struct drm_sched_rq *rq,
>>>  			     struct drm_sched_entity *entity)
>>>  {
>>> +	WARN_ON(!!entity->single_sched);
>>> +
>>>  	if (!list_empty(&entity->list))
>>>  		return;
>>>  
>>> @@ -166,6 +190,8 @@ void drm_sched_rq_add_entity(struct drm_sched_rq *rq,
>>>  void drm_sched_rq_remove_entity(struct drm_sched_rq *rq,
>>>  				struct drm_sched_entity *entity)
>>>  {
>>> +	WARN_ON(!!entity->single_sched);
>>> +
>>>  	if (list_empty(&entity->list))
>>>  		return;
>>>  
>>> @@ -641,7 +667,7 @@ int drm_sched_job_init(struct drm_sched_job *job,
>>>  		       struct drm_sched_entity *entity,
>>>  		       void *owner)
>>>  {
>>> -	if (!entity->rq)
>>> +	if (!entity->rq && !entity->single_sched)
>>>  		return -ENOENT;
>>>  
>>>  	job->entity = entity;
>>> @@ -674,13 +700,16 @@ void drm_sched_job_arm(struct drm_sched_job *job)
>>>  {
>>>  	struct drm_gpu_scheduler *sched;
>>>  	struct drm_sched_entity *entity = job->entity;
>>> +	bool single_entity = !!entity->single_sched;
>>>  
>>>  	BUG_ON(!entity);
>>> -	drm_sched_entity_select_rq(entity);
>>> -	sched = entity->rq->sched;
>>> +	if (!single_entity)
>>> +		drm_sched_entity_select_rq(entity);
>>> +	sched = drm_sched_entity_to_scheduler(entity);
>>>  
>>>  	job->sched = sched;
>>> -	job->s_priority = entity->rq - sched->sched_rq;
>>> +	if (!single_entity)
>>> +		job->s_priority = entity->rq - sched->sched_rq;
>>>  	job->id = atomic64_inc_return(&sched->job_id_count);
>>>  
>>>  	drm_sched_fence_init(job->s_fence, job->entity);
>>> @@ -896,6 +925,14 @@ drm_sched_select_entity(struct drm_gpu_scheduler *sched)
>>>  	if (!drm_sched_can_queue(sched))
>>>  		return NULL;
>>>  
>>> +	if (sched->single_entity) {
>>> +		if (!READ_ONCE(sched->single_entity->stopped) &&
>>> +		    drm_sched_entity_is_ready(sched->single_entity))
>>> +			return sched->single_entity;
>>> +
>>> +		return NULL;
>>> +	}
>>> +
>>>  	/* Kernel run queue has higher priority than normal run queue*/
>>>  	for (i = DRM_SCHED_PRIORITY_COUNT - 1; i >= DRM_SCHED_PRIORITY_MIN; i--) {
>>>  		entity = sched->sched_policy == DRM_SCHED_POLICY_FIFO ?
>>> @@ -1092,6 +1129,7 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
>>>  		return -EINVAL;
>>>  
>>>  	sched->ops = ops;
>>> +	sched->single_entity = NULL;
>>>  	sched->hw_submission_limit = hw_submission;
>>>  	sched->name = name;
>>>  	if (submit_wq) {
>>> @@ -1111,8 +1149,10 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
>>>  	sched->dev = dev;
>>>  	sched->sched_policy = sched_policy == DRM_SCHED_POLICY_UNSET ?
>>>  		drm_sched_policy_default : sched_policy;
>>> -	for (i = DRM_SCHED_PRIORITY_MIN; i < DRM_SCHED_PRIORITY_COUNT; i++)
>>> -		drm_sched_rq_init(sched, &sched->sched_rq[i]);
>>> +	if (sched_policy != DRM_SCHED_POLICY_SINGLE_ENTITY) {
>>> +		for (i = DRM_SCHED_PRIORITY_MIN; i < DRM_SCHED_PRIORITY_COUNT; i++)
>>> +			drm_sched_rq_init(sched, &sched->sched_rq[i]);
>>> +	}
>>
>> With dynamic rq, no changes would be necessary here--we just go over the single rq.
>>
>>>  
>>>  	init_waitqueue_head(&sched->job_scheduled);
>>>  	INIT_LIST_HEAD(&sched->pending_list);
>>> @@ -1143,19 +1183,24 @@ void drm_sched_fini(struct drm_gpu_scheduler *sched)
>>>  
>>>  	drm_sched_wqueue_stop(sched);
>>>  
>>> -	for (i = DRM_SCHED_PRIORITY_COUNT - 1; i >= DRM_SCHED_PRIORITY_MIN; i--) {
>>> -		struct drm_sched_rq *rq = &sched->sched_rq[i];
>>> -
>>> -		spin_lock(&rq->lock);
>>> -		list_for_each_entry(s_entity, &rq->entities, list)
>>> -			/*
>>> -			 * Prevents reinsertion and marks job_queue as idle,
>>> -			 * it will removed from rq in drm_sched_entity_fini
>>> -			 * eventually
>>> -			 */
>>> -			s_entity->stopped = true;
>>> -		spin_unlock(&rq->lock);
>>> +	if (sched->single_entity) {
>>> +		spin_lock(&sched->single_entity->rq_lock);
>>> +		sched->single_entity->stopped = true;
>>> +		spin_unlock(&sched->single_entity->rq_lock);
>>> +	} else if (sched->sched_policy != DRM_SCHED_POLICY_SINGLE_ENTITY) {
>>> +		for (i = DRM_SCHED_PRIORITY_COUNT - 1; i >= DRM_SCHED_PRIORITY_MIN; i--) {
>>> +			struct drm_sched_rq *rq = &sched->sched_rq[i];
>>>  
>>> +			spin_lock(&rq->lock);
>>> +			list_for_each_entry(s_entity, &rq->entities, list)
>>> +				/*
>>> +				 * Prevents reinsertion and marks job_queue as idle,
>>> +				 * it will removed from rq in drm_sched_entity_fini
>>> +				 * eventually
>>> +				 */
>>> +				s_entity->stopped = true;
>>> +			spin_unlock(&rq->lock);
>>> +		}
>>>  	}
>>
>> Same here--we can keep the loop intact, we have a single rq and we just process it.
>>
>>>  
>>>  	/* Wakeup everyone stuck in drm_sched_entity_flush for this scheduler */
>>> @@ -1186,6 +1231,8 @@ void drm_sched_increase_karma(struct drm_sched_job *bad)
>>>  	struct drm_sched_entity *entity;
>>>  	struct drm_gpu_scheduler *sched = bad->sched;
>>>  
>>> +	WARN_ON(sched->sched_policy == DRM_SCHED_POLICY_SINGLE_ENTITY);
>>> +
>>>  	/* don't change @bad's karma if it's from KERNEL RQ,
>>>  	 * because sometimes GPU hang would cause kernel jobs (like VM updating jobs)
>>>  	 * corrupt but keep in mind that kernel jobs always considered good.
>>> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
>>> index 320f0a720486..e67b53c3546b 100644
>>> --- a/include/drm/gpu_scheduler.h
>>> +++ b/include/drm/gpu_scheduler.h
>>> @@ -79,6 +79,7 @@ enum drm_sched_policy {
>>>  	DRM_SCHED_POLICY_UNSET,
>>>  	DRM_SCHED_POLICY_RR,
>>>  	DRM_SCHED_POLICY_FIFO,
>>> +	DRM_SCHED_POLICY_SINGLE_ENTITY,
>>>  	DRM_SCHED_POLICY_COUNT,
>>>  };
>>>  
>>> @@ -112,6 +113,9 @@ struct drm_sched_entity {
>>>  	 */
>>>  	struct drm_sched_rq		*rq;
>>>  
>>> +	/** @single_sched: Single scheduler */
>>> +	struct drm_gpu_scheduler	*single_sched;
>>> +
>>>  	/**
>>>  	 * @sched_list:
>>>  	 *
>>> @@ -473,6 +477,7 @@ struct drm_sched_backend_ops {
>>>   * struct drm_gpu_scheduler - scheduler instance-specific data
>>>   *
>>>   * @ops: backend operations provided by the driver.
>>> + * @single_entity: Single entity for the scheduler
>>>   * @hw_submission_limit: the max size of the hardware queue.
>>>   * @timeout: the time after which a job is removed from the scheduler.
>>>   * @name: name of the ring for which this scheduler is being used.
>>> @@ -504,6 +509,7 @@ struct drm_sched_backend_ops {
>>>   */
>>>  struct drm_gpu_scheduler {
>>>  	const struct drm_sched_backend_ops	*ops;
>>> +	struct drm_sched_entity		*single_entity;
>>
>> Right, as I mentioned above, we shouldn't splice up between a scheduler
>> and an entity sometimes, and other times scheduler to rq to entity--it just
>> creates too much thrashing about in the code, with too many ifs, conditions,
>> etc. Simpler is better--parameterization of the number of rqs.
>>
>> Instead, let's get the dynamic rqs in, and this way we can keep much
>> of the code the same, inheriting fence work and checks, and so on,
>> without much changes.
>>
>> Regards,
>> Luben
>>
>>>  	uint32_t			hw_submission_limit;
>>>  	long				timeout;
>>>  	const char			*name;
>>> @@ -587,6 +593,8 @@ int drm_sched_entity_init(struct drm_sched_entity *entity,
>>>  			  struct drm_gpu_scheduler **sched_list,
>>>  			  unsigned int num_sched_list,
>>>  			  atomic_t *guilty);
>>> +struct drm_gpu_scheduler *
>>> +drm_sched_entity_to_scheduler(struct drm_sched_entity *entity);
>>>  long drm_sched_entity_flush(struct drm_sched_entity *entity, long timeout);
>>>  void drm_sched_entity_fini(struct drm_sched_entity *entity);
>>>  void drm_sched_entity_destroy(struct drm_sched_entity *entity);
>>

