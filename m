Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BA344F920B
	for <lists+dri-devel@lfdr.de>; Fri,  8 Apr 2022 11:29:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 749A610E17D;
	Fri,  8 Apr 2022 09:29:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2058.outbound.protection.outlook.com [40.107.92.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48AD110E15B;
 Fri,  8 Apr 2022 09:29:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YbjpY6plLMcsfhpfY5hDke/uZAX1JXrfezvQ6RPaOz0zvPtSlLVkzPX/hmEoOTI91YBICBu7gCZDpOCEw2Q4QmBrEqeitIvhUI432GOcVjfJdfIMIEzOHZY+JVIA+dHxcWHTVuUcSN2MFGuSz++yELWQakTMZwPlT4iivHBJNww6bIwKkChHQlWNZsoxTh1wY26h/ll30dNXyadMnD+bqOl2lxvvUdG0poGImFMWwRU17oH+fPmc5Zp1zoWQ3ZezJFCnmDZdpcfd9zFfgxQKuwcXPks2aLhCnn7bCOLLzRuLclro7HINsw95yKZjoR6IMCgQvydd1GwHO+o3uyPVxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sRJ8+hyUmg9lPn6q1ZqoDs8BylJ6yUDqUUZNuZceBeg=;
 b=HJ6INTjkLmbXTneB2Zh9+JOM1dKu+0AR9mClXISG5K/IggZUH79D6Uz1/PngMnWCjNsWHmdmocNo8/QemSrcWdzxrNiGcR7Ms5t6K2VhMbQ8ERK4V8cfZLN/7frrVQuZseLLjmUNn+I8mRSPIsMw9/DjXqUDxE/5I/WplnXxqiTrd4QhPEtLdjORLj1Ft9vE0W/jaXztFvn7pfM9/MEmajXL59CTL2IRCakW0izQhdWOd4RcN7fOxroqd757X0a4mp32XsixIuETvYPEhhUxEQMHu30Awknzt0vyWZCBrSPVwLE9n36ggKXYTlqpENj1cYEIy3uLUdk0HvC+Ns1tFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sRJ8+hyUmg9lPn6q1ZqoDs8BylJ6yUDqUUZNuZceBeg=;
 b=WsGGDVnPER/CvhNS1vmSaGeCCv1r//t3+ijgbVzw9KBGAIBtEu8mYrizWPb7S7tDu93/8Fjo56E4cgfWkgt65xF5xyfbIFSniMzuiDdsGva2yFlYmZmEt6AUzBrKI+Xmamfx2FN6dVbRkUxukUy6E3sH95rg/c7pp/Cj77NYs1A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by DM6PR12MB3722.namprd12.prod.outlook.com (2603:10b6:5:1c3::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.26; Fri, 8 Apr
 2022 09:29:23 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::a5fb:7137:5e64:cf8]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::a5fb:7137:5e64:cf8%5]) with mapi id 15.20.5144.022; Fri, 8 Apr 2022
 09:29:23 +0000
Message-ID: <a9473416-351e-33ba-b1b8-22295ac84c66@amd.com>
Date: Fri, 8 Apr 2022 11:29:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [Intel-gfx] [PATCH 2/2] drm/i915: fix
 i915_gem_object_wait_moving_fence
Content-Language: en-US
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Matthew Auld <matthew.auld@intel.com>, intel-gfx@lists.freedesktop.org
References: <20220407164532.1242578-1-matthew.auld@intel.com>
 <20220407164532.1242578-2-matthew.auld@intel.com>
 <2b3b28b9-6746-9fb3-3651-16f7a029d2e7@linux.intel.com>
 <362df6d6-8ed7-17ae-077d-034425fb4e0d@amd.com>
 <df68c458-997c-b4b7-5539-b7a4aec47b0f@linux.intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <df68c458-997c-b4b7-5539-b7a4aec47b0f@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS9PR06CA0570.eurprd06.prod.outlook.com
 (2603:10a6:20b:485::25) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8830ccfe-7eee-48f6-8e4e-08da19424464
X-MS-TrafficTypeDiagnostic: DM6PR12MB3722:EE_
X-Microsoft-Antispam-PRVS: <DM6PR12MB37227EB90ABAC48CAC07A8B783E99@DM6PR12MB3722.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Sg3lzLLxmcxNsaAzxYP/UoyVc83IuCK4bx1FinzCe5R2NkudnD72j0wXikbq3SU82b/vcMFOrHAzXjS7lzAa3Lu064LaWwUkcZvoYpdIsSxG/Uk0M/QSrxqWraathKp/ViZ9MdQ5GcRBSXJH5q8HkeDED/8K7uWwn4JjiBC4tp1buyabMEU+AVZDMA6/pWbNsmzRwkjgnG+k7OoGe7Tr/ZVu6+hOWX2sMwnXisZNy8SRySlIq6DdFaa9CJu4XHkpBIolyQ85pWNcbonutVM8IND2f6sWutQ66x1hSoZIoQzCOC2H9xAKXw6pPgjjdCSuYflePBGhvmDVsghVqUt0JXwgtum2CYUxpAdLEjXm+oYSWjbgtUWmDu/Bo/nqvnNGqeCfQWYEf2dPq41gdKqqeaZ/xpkqzVahphNuIxzPk+4XsaWK+Hg/Kjw/2H3JQuYpZYb5xE+/SHfM8L6jbbNAPY+ZQUblJ1PjjxWK19v3C3n2o1gEjzfSXyHE+rlGHpNV/mKVme+rzQbcIAk2TUJsfRL29DY/f5tUKoYcyFHR+KRqZDoXW+E+MxAJUvHNx3VU13sKURImEP6kj3E6Fchwb9rQymc+FvSEBEVdY02S7mFR1o0NoHN22iZwQOlLgEeoWVKRslGz2mWF22w/Y4+SnQZLXfMGzVcwxXOVCRYVvB3iLDO5Pqp9ARN47b0gAWniY3He9KRcWppcWyNfEGVIGA9UsYP5NgsiVhZZlI9MLwLpDDT2rE99i7SiJj462s/c
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(8676002)(4326008)(6486002)(38100700002)(186003)(66476007)(5660300002)(66946007)(6666004)(66556008)(66574015)(508600001)(8936002)(83380400001)(2906002)(6512007)(36756003)(316002)(31686004)(31696002)(110136005)(2616005)(6506007)(86362001)(53546011)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bFFWQVZjeEZ3UFc4ZER2RFRKTFJNODJtMWpLNzB0RytLWFRQVjBWN0dRbmRz?=
 =?utf-8?B?YVRGN0wwbmY3U3NXVkhBblBZaXJNd1psdDI3SGRYb2p0RjVwSGJ4WUVyUklw?=
 =?utf-8?B?TGdlZ0NYVGNiY3VMZWdWNE1peVFHMkkvc3BTNWl2dTJDdlJsQmp4RTIyZHZx?=
 =?utf-8?B?RExQNXp1N2lmVnBwcUVxQ0ErUVQrZks5d2t2NTB2cE9pQi93ZXpnaDdjejRS?=
 =?utf-8?B?WTFYTWR0aktMY25EZmQzSGNaU1hBa2JzbnVzUFVUeHBwUmNhSnlZWmsrQlRR?=
 =?utf-8?B?T1NjVllGeEtINzhKUm9ZREFlZTVnQkE3b0gzejlDdjB2b0VvZEZMV3RlVHd3?=
 =?utf-8?B?MUIycExvRW1BL2YyOEc1cVRYbkJ4NzV0RlpocDFzcDFsRTcweW9pVnJFZHR5?=
 =?utf-8?B?bE1IMkRwNkxVMEliMkRTcGtPUW9ZUm1XNTZIZEFsZGZJMlArdmxmdzI4RFVE?=
 =?utf-8?B?NVZDZ2RLM0VaYmRsY2hjUnFlb2RZUTlaOU16bFBSRzBiWUJKRWFXQXpXUlly?=
 =?utf-8?B?bDQ4aTFuU0ZUL0NFL1Zlc3gzR2h3VWxQVk1qdmdybmorNHQwSUpQZWlOUmsy?=
 =?utf-8?B?TXRKRHpOSUppdTlQZTZ6T1Q2TDd1L3RMRlpxd3BHSE9razFldlg2aW5ySGFD?=
 =?utf-8?B?TzNwN0tKalJSQklTWiszd0ZhZzRjUEVZOWFDNTI2TFUrZmZ5T3VEcXdSbkJk?=
 =?utf-8?B?TmZEVFpuK0ovWUViZkpQK0lLWXpDQlpYYUdKUkRoVlV1NHdtKzR0TjMzcEw1?=
 =?utf-8?B?aW1ndzN1dk4wdUE5OGJ0ZGZpR3RhemtYOVJ6RGxxMWtvZGNJVjlmWFdpcjls?=
 =?utf-8?B?YldiQXBIRDJXbDVydDNPNFIyS21NSXdBS0VoT3krZXcvQUNmUTNPYmEraXd5?=
 =?utf-8?B?ZHVSWm5wcFJWa3pFek1qTXBjL1JLS2tFNnhUZ0VRZUl6MTkxbHFmc2sxOFIr?=
 =?utf-8?B?VXdhL0g5a3NOd0tJUHM5eHJWRldNQ3ZQaGJRMjArOUNqVklSbDhrTjJZZXNW?=
 =?utf-8?B?Q2Vlc1IzdVB0dFZBcnVGZGwrMUFMQUxTTGo4QU5EUVhXb0xIeUpNbS9yMmJj?=
 =?utf-8?B?NnN4VStlK3VwbFhFU2RJTmRTVklqWEZBS1k4Q1ZFUGp2NHRJc1BPTG4vY3p4?=
 =?utf-8?B?RTNHMHNXL2pHb0d5N3RDOVhESUR1VGJ5MGZRd2JQVmltSFpIWk1KOG9ab0Ru?=
 =?utf-8?B?ZmhjZkw1bGZIQjMrWU96Z1c0WWdEeXkzOE52SmZ4a0JqRDRMTjdOekpsVUx2?=
 =?utf-8?B?TUVXTmRJWUZ4OUxKcXpIb3ppaEpEYWtPeXF1SmpBMlYrQksyeEFaNHNIZkZa?=
 =?utf-8?B?RElpU2gxQ2xwUUovTXBzYWEvYTR1VS9TVWJqb3Yzc0dVK3dneWNsMDNWTFU4?=
 =?utf-8?B?K0djRFRucXVrKzFXVjdCNlI2UlNBeGtBZFRZQ0NpQXJNR2dCS0kwdFZuak5z?=
 =?utf-8?B?M0MyNEZla3d3djhNTkRHemg5NDd4ZFUrUnRrTmZYYlUwTE1GVzhIOGxGWHJp?=
 =?utf-8?B?UXdSUzN2b2N0OUpoaXNZemVhRlNnd0xqMXVpY2J3WlFYY3R0c3FZTnk5UWVL?=
 =?utf-8?B?Um1MR2NEaTBPbW13UFNYRHAyRW15MVpyQ1ovS1NyV1ZOL1c0cFVZZkF3NUdL?=
 =?utf-8?B?dTNJRzQ2WHVsRHVQNm1WYktRZHJFMTNyVCt2NFJhVjlFZVFnTzNadWZWay81?=
 =?utf-8?B?OVRWdnhSSTNiSGlSRkxsMzRHNFlCTmpYUWd6VjBOZWo5VFQ4aHN4WU9DTXFP?=
 =?utf-8?B?QW9GaWhmTnRNbWI0bjJ5QUtXYWNXYS9tY2EwUGVUT3VvUmJDajJUajNlbm8z?=
 =?utf-8?B?OGJDMURDcE5tcjh4d0dwdkgvRXBPV1lWWWtIN3czR1VRYXJOemVNN1dkTlJ6?=
 =?utf-8?B?U0FxbmVCM2UzMzVhRmJtUytsSk80MTVyeWYvTTN4NGVKWjFmV1NYYTlnelpV?=
 =?utf-8?B?S3VubWFKWXVuYUtCN2d1WUo5K0F3dEdHMzdOOWVhSk9PM0E2dGxUTDErdlFC?=
 =?utf-8?B?OU0wYTZzTHllOUxzNi9NRC9JQ1l4VU5xdkNLZmh0Rk02STc4MTgwdm02Wlpz?=
 =?utf-8?B?TVJXWDdXbUJBU1luZ1RWVVZ5ZjRUYmNRbEk0UEpDTFBldWErSlZwQ1lmQkRV?=
 =?utf-8?B?OXhYVFFPWVE0QkdTcWhqOEduMGhOam56VFFma2RvbWwrSmUreVJLdDNyYzlI?=
 =?utf-8?B?MFI4c3FyWFJpbkpCV2VhdXlrckNhREhuS3NiRi9HU1l0QTFXVVZtb1l6OTR1?=
 =?utf-8?B?blBLZlpXS0EwZlVCV2szVlUzTTN4R1ViVS9UV3hFSkFwcFJMK21QeFhnbWJG?=
 =?utf-8?B?aXVCVzFWN2ttQWxVWEc1aVVLZ1pYZkUxNjl5OUt0SHpoak5tWWt1T21LcnNY?=
 =?utf-8?Q?NarBMu3xsITAJCMHiUSrKcIIeWKgVHrl0aWp/wuuaLddK?=
X-MS-Exchange-AntiSpam-MessageData-1: HrBj7brrsXZtFg==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8830ccfe-7eee-48f6-8e4e-08da19424464
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2022 09:29:23.3416 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DvZp/y+GnM4YlTumUmCGWh9TMbHRvPVwZdCHKWrhjd8zfunAhbtvtP7l0ZS4/PWm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3722
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 08.04.22 um 11:23 schrieb Tvrtko Ursulin:
>
> On 08/04/2022 10:12, Christian König wrote:
>> Am 08.04.22 um 11:08 schrieb Tvrtko Ursulin:
>>>
>>> On 07/04/2022 17:45, Matthew Auld wrote:
>>>> All of CI is just failing with the following, which prevents 
>>>> loading of
>>>> the module:
>>>>
>>>>      i915 0000:03:00.0: [drm] *ERROR* Scratch setup failed
>>>>
>>>> Best guess is that this comes from the pin_map() for the scratch page,
>>>> which does an i915_gem_object_wait_moving_fence() somewhere. It looks
>>>> like this now calls into dma_resv_wait_timeout() which can return the
>>>> remaining timeout, leading to the caller thinking this is an error.
>>>>
>>>> Fixes: 1d7f5e6c5240 ("drm/i915: drop bo->moving dependency")
>>>
>>> Has this one went in bypassing i915 CI and merged via drm-misc-next? 
>>> If so I think it's the 2nd large disruption to i915 CI flows 
>>> recently so the lesson here is try not to bypass i915 CI when 
>>> merging i915 patches.
>>>
>>> In this particular example, unless there were merge conflicts 
>>> causing the series not to apply against drm-tip, it should have been 
>>> doable to copy intel-gfx on all patches and so get the CI results. 
>>> (Even if just with --subject-prefix=CI && --suppress-cc=all before 
>>> merging.)
>>
>> Exactly that was the problem. I didn't got any usable CI results for 
>> this set because it always caused merge conflicts between i915 and 
>> drm-misc-next in drm-tip.
>
> Then a staged approach should be used. First merge the core stuff and 
> when we backmerge to drm-intel(-gt)-next send the i915 parts out.
>
> Because knock on effect of such large of a CI fire too many many 
> people on our side is very significant.

Sorry for that. I thought we had everything covered in drm-tip, but 
looks like it still broke.

BTW: Why is the CI system failing?

Regards,
Christian.

>
> Regards,
>
> Tvrtko
>
>>
>> Regards,
>> Christian.
>>
>>>
>>> The second question is which branch to merge through, on which I 
>>> think i915 maintainers would have liked to be consulted.
>>>
>>> Regards,
>>>
>>> Tvrtko
>>>
>>>> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
>>>> Cc: Christian König <christian.koenig@amd.com>
>>>> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
>>>> ---
>>>>   drivers/gpu/drm/i915/gem/i915_gem_object.c | 9 +++++++--
>>>>   1 file changed, 7 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.c 
>>>> b/drivers/gpu/drm/i915/gem/i915_gem_object.c
>>>> index 2998d895a6b3..1c88d4121658 100644
>>>> --- a/drivers/gpu/drm/i915/gem/i915_gem_object.c
>>>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_object.c
>>>> @@ -772,9 +772,14 @@ int i915_gem_object_get_moving_fence(struct 
>>>> drm_i915_gem_object *obj,
>>>>   int i915_gem_object_wait_moving_fence(struct drm_i915_gem_object 
>>>> *obj,
>>>>                         bool intr)
>>>>   {
>>>> +    long ret;
>>>> +
>>>>       assert_object_held(obj);
>>>> -    return dma_resv_wait_timeout(obj->base. resv, 
>>>> DMA_RESV_USAGE_KERNEL,
>>>> -                     intr, MAX_SCHEDULE_TIMEOUT);
>>>> +
>>>> +    ret = dma_resv_wait_timeout(obj->base. resv, 
>>>> DMA_RESV_USAGE_KERNEL,
>>>> +                    intr, MAX_SCHEDULE_TIMEOUT);
>>>> +
>>>> +    return ret < 0 ? ret : 0;
>>>>   }
>>>>     #if IS_ENABLED(CONFIG_DRM_I915_SELFTEST)
>>

