Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6BC177FAB3
	for <lists+dri-devel@lfdr.de>; Thu, 17 Aug 2023 17:27:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9208910E4E7;
	Thu, 17 Aug 2023 15:27:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2079.outbound.protection.outlook.com [40.107.220.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32ADB10E4E4;
 Thu, 17 Aug 2023 15:27:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b9jJPge3cXYWBuQm3ldbXd7nurDXAulvRZeDw3CtZSI5y2e2U88sXLSi3zwl/RltXqrr2BFAX9znYbhbz+VvappCdv7nSyYrExfv4f4J1CbUXOXDY5IF6ihme4r8cVoIB86MRYOkF8AsftMyzlIfpC1PeTzkajxS3Fy6womCnLeY9iWz75pEc18cy1CcZ/UumOfkAEJOrzkSBols6XVWNxJF4Btzkb3ztUU15LbwN9TmgYydPIwtDsXtsam1EZfr0gTY1itgViVFKF9/o0Uc/NOAbcgrcjFBtwIQGP5eMjOQ3k02bqo2S5xxiCeqjj81s+gR+mhVQDK5Xly+muhBIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xbcYoyzKs+xLoz6qriSSCYZTey86EqL+9qfKwg4r9h8=;
 b=lcI+K4OICVtZR2CZUjfMrlmNvb/mnMbwoTAzpZoeXqLmq1TRGXGVa7Mo3x0dL+Cc2i7E2qHqhvD1VQi4KCFO978OUNJ36h02+qLXatl4fL75wYdZZ932MYkyQ5BD8Edyo9uDBQTsRJBaAxWrwCWKC+mLjruJZfNo3LqqMmeV8sAzfBHONhEbYugmo1kswRb9Y0I9Q/yDtZqn2Vodyb/Wk1024DiXnQJtBoM2Gisrszkpu3q3kTMDwEO2nnIHxAegIWNHJS2ZJZ3p2uEthdzU2oY//lWG43VnLkKzAOX4fajO7XF4+VJPYoFHFooZKl9ApSqZBpEa+8MRve3ClcZEYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xbcYoyzKs+xLoz6qriSSCYZTey86EqL+9qfKwg4r9h8=;
 b=sgwsCDKua7iJ+QF4dYL/jmzvLgndpW0bnoKJahxbSePxX/YdiPGBEC/y+jjglmzX5Todl6++0YSLY/P1nKCAaK0I0+xJEa+vQLRNTkAYNLXI2cbFozJXfc5+JV6IB2zbY6ims/2XIPkils5BxU3elz82tLJXxTiCkSQ9oxwxQr0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW4PR12MB5667.namprd12.prod.outlook.com (2603:10b6:303:18a::10)
 by PH0PR12MB8824.namprd12.prod.outlook.com (2603:10b6:510:26f::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.30; Thu, 17 Aug
 2023 15:26:58 +0000
Received: from MW4PR12MB5667.namprd12.prod.outlook.com
 ([fe80::dc06:ffb3:46ec:6b86]) by MW4PR12MB5667.namprd12.prod.outlook.com
 ([fe80::dc06:ffb3:46ec:6b86%3]) with mapi id 15.20.6678.029; Thu, 17 Aug 2023
 15:26:58 +0000
Message-ID: <e1795fa8-f34e-6805-c937-1937490f09a5@amd.com>
Date: Thu, 17 Aug 2023 17:26:49 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v4 2/4] drm/amdgpu: Rework coredump to use memory
 dynamically
Content-Language: en-US
To: =?UTF-8?Q?Andr=c3=a9_Almeida?= <andrealmeid@igalia.com>
References: <20230815195100.294458-1-andrealmeid@igalia.com>
 <20230815195100.294458-3-andrealmeid@igalia.com>
 <07ef59db-da17-15cf-789a-7f5d01b2c9c9@amd.com>
 <a6e90991-91bb-4da9-ab67-d0ec28a29680@igalia.com>
 <eaef1599-4da3-ac10-a03e-4f2d8304c60d@amd.com>
 <43f2df2f-46ff-4240-a86b-eff5f0c08888@igalia.com>
From: Shashank Sharma <shashank.sharma@amd.com>
In-Reply-To: <43f2df2f-46ff-4240-a86b-eff5f0c08888@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BE1P281CA0376.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:82::27) To MW4PR12MB5667.namprd12.prod.outlook.com
 (2603:10b6:303:18a::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR12MB5667:EE_|PH0PR12MB8824:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e8a465e-57a5-46a5-14af-08db9f36655a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jOIA/xNQGCx+tNqRG7bXS/Yw0j2UQ45RUvK0wG0rXHHzwbpLvkU1/70qrmOyDMUN/EY2YvHXtwYr8w+3KZ2PdpCNXaocaf+edA7cTVzOc0vU/3Yqvxo5J6K8lq9976da+/48AOpRFW+Kas0uXfSclUS0HYLdtPHfLD24ynhrWee8vkYaPFsyv9YatauXK5deQ9UIhGrGewz4VWVVFBdFU1xGWmeFKXgE32dh/koCkx1JOeCYQZgt0e6RT30iRngRP+2nRZReZ3PWaln5I9ATc8XqHR0yxnr5moBO8L0eudGDdfwvlc/lOJii4YhwZBmIxygCPrYOR2p7oxME+MvbhcutnsX/Smpjd3Gz0hqgmwFhjRVpvH7Z6csfPzi4INt8YrtMCJJ7nfyNt9lsSkhiBCJLemI/vmnwdDegBfUema8HP53BwoW8ukiABpZPXziZzxe9AGSjhmRHjWlIJXQ2hbKGUQ2xI3q5w6Sdqnl5/YbvLy9zuMvJj7FCICusCuqUWdMqWB14EmtTGI8Jw5M4zdvumQyeIXnEbbsCxeaeEdLl2HXXc++1hZ5ju4W+oZ8hqU/Utu9anExbgD0QpdjLPpI1UMEYyWwi5S8Hlg/fUxJN+9y6xmicBLyqnNrwlcAEdC+DRbQG3sE7eatKBpQZ4w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR12MB5667.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(376002)(136003)(346002)(39860400002)(396003)(186009)(451199024)(1800799009)(31696002)(2906002)(83380400001)(26005)(86362001)(478600001)(6506007)(36756003)(6666004)(2616005)(6486002)(6512007)(53546011)(44832011)(5660300002)(41300700001)(316002)(54906003)(66946007)(66476007)(66556008)(6916009)(31686004)(4326008)(8676002)(8936002)(38100700002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VUVONGlaS2F4VXdudTE0Sk8wUTh2bmtlbmhEZFdBeWU4eDA4MVd4d0d6cFpK?=
 =?utf-8?B?WlJYRVdKeEJ3WUFqaURmSzZvWVRtS1U0bnVDdnZZZXZJb2krcEdyY090UUdF?=
 =?utf-8?B?aVVKRkNhRWZhQlVFNGVXSFdraUs2VEtrOEtDZ1Jrd2Noa2Y1bUFxdExPNG1a?=
 =?utf-8?B?bGZjeFZWY3JhbW9nZzlBZnh6WUY5R0l3b0hrelJtMmY4L0tQOGNnUVFEdER6?=
 =?utf-8?B?RzlkV2ZvZXlYbVhZVlZGSHBKNXV2SHBRQW9FaEpSY0VWNWhGUXNiY01Lam5l?=
 =?utf-8?B?QXlDdlNzVkhoSE1vTGlpSmdZUnVJWUhaNTFpUVdIcm92eWRoeTh1TTlnemQ2?=
 =?utf-8?B?Zk1nQ09JcmRVdHo0UkkzaTBtd0hFek5xbVcxcGFLZUlUeGQvaUlhUk8xSjNQ?=
 =?utf-8?B?cStmNEkzZVplRWlEUTA3alMrdmQ1VFdZWUE3Q0VBcWRvRC9obWZuR3BCQWs4?=
 =?utf-8?B?WlNyRlZOZVNzZzQwYkJGZlJGMzl4Tnl0WGxjLzE1MHlSSlZCZGk3WWNIVjNX?=
 =?utf-8?B?VVZpK2NHNnNDeEphYkhCN1Fob1h4M20yVmMwck1zSGR5WStzTTZzK1I4U1Z5?=
 =?utf-8?B?bGpvT28zZFNwSCtXb2VNMzg0T01hU3ZVOFJSMzJBQzhtRGZaMmpaN1cxbXhF?=
 =?utf-8?B?UlVicUFFZVBlZjVNZGU4SVNGWWIxSHVkSExiNzNnTjBWRjBZV1k3NGowMUJV?=
 =?utf-8?B?c3dyeXNTbDZSc0IxaU0reUg1UTZhOVg4MFJrZGxhUHFyV3kzZUwvU1NiR3ps?=
 =?utf-8?B?eEFocktXRVZxRmdVUXJnbkVlZjdKaXlCWGNXVUl3OU1KT2NseVhBUjhBem9v?=
 =?utf-8?B?VUlGS0FLTFhZMFlvTVlkSThCZDZXUkFUdlo3SGM3UW9ibElhWDBlTisrTE1W?=
 =?utf-8?B?UFpoRnJGbGNGMmJhcllYODBXUDM4ZHRiN2tTL2J1U0orSGdtRW5QdTBSbEpC?=
 =?utf-8?B?bnJTRlhnNlhUYSt6WGdTN3BrTHMyL1lRaGhBNnNIMXhOVnh2UzkvZnRFYU1W?=
 =?utf-8?B?TUx4NTJJWkd3MkFseWJhY2hJOFN1M2dGakJjNmFLMHhNQnRoWHJKOHZsREtj?=
 =?utf-8?B?RVpVZjJBUTFveE9YdTd2dlR6Ui9LOFBmTzViSWNnN3BGZ0lnMGNMMWkvemx1?=
 =?utf-8?B?cFF2WmxLV2gwaTZJcmwzeXlMZXEwRmZWWVQwcitkV3lsR3pmdU9SMGtXVFJX?=
 =?utf-8?B?UnFtbVIyZHdzRjM5azMrV3VydXlTOS96RGhzT0VKaWdTSzVveFo0NENMWndU?=
 =?utf-8?B?VFpmWDFGbkZtK3pUd0EyWHNHdC9paVNHSEx3dkpiRUxDWjl5WmZHVWY5Vzdr?=
 =?utf-8?B?WlFSbkNVY3ZrYUtabmQ1KzN0RXpsYkRaQyt6L2w0VDAzV09DS3F0UnV0d0pn?=
 =?utf-8?B?d3VIelE5enZmSEswWlVoeW8yZGhidXpvVUM4L1V1VXVHZ1dyT2lsOGVpVnI5?=
 =?utf-8?B?S2Y4NHFpeVVwVzBIdE1BbjNyM2tBdWJBTElsL3VaUFgxSzNFV0wvdmRJSGNS?=
 =?utf-8?B?ZE9KSVpvcThGanBzV1p0VTV4c1MrZ0haYlJZTVh1dXRuN3dpalBZbmZ1UHdI?=
 =?utf-8?B?OTYyMlM5ZFhWb2ZqdVh1U1pCU2xXRWZMbWxSV0RmMGtrejZVZ2drNk41a2g5?=
 =?utf-8?B?eFRKWFlwRzNXbmNZTWlGYWlnV0ZWRTZJSlQ1OEdheUc5QzJDRWFMRGYzNDFx?=
 =?utf-8?B?azhEOFJzUVFVNzRJWjVTWXVVRisycndjUU1nSDkvMjJVK3VWbTNNc1ZOdGw2?=
 =?utf-8?B?Vzdka2JRcTF2RTNxTWRDYy9wZUZ2ejBTYXlwenZBOExxbWpNN2tvTXUvNTVk?=
 =?utf-8?B?K0Z6N2F6andQS0RibXlJdFRkRUdGbHQ3RlpQb3BuaVBmSk5DMTZXblRxY3BY?=
 =?utf-8?B?TTN2VzNaclZPRzJvKzFLSlRKVkU2UzJlT29NTXROQzRsWnZ2Y3doUjJLalVD?=
 =?utf-8?B?WlBzRGx1cjNqaDhHWkxxNHlHcHA0Z3h4a0x6S01aY3FwUXIzYUhWUXFUSFF6?=
 =?utf-8?B?eC9YVWJFd0FaQWlyZUFxYWlUOUNMNzM1Mm9CU0lreXZ0SnU4TDRLeTRDeEtz?=
 =?utf-8?B?S2RTSXZabVJDZ0FxQW1TTm10ZitGcGgrS3ZJR1JYOFlaYW1KYjhySWRVdzBx?=
 =?utf-8?Q?bZQIdC7Q69JyH2GX6tBb0kL6/?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e8a465e-57a5-46a5-14af-08db9f36655a
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB5667.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2023 15:26:58.3415 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +4zR99mMRPllC+ynL8O/fgbPg9OmGa6ylY/LxsZ27nVMtXxw8kWFTr7JyabpuvGigBubdJd/pNXrwUqYNuMV+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8824
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
Cc: pierre-eric.pelloux-prayer@amd.com,
 =?UTF-8?B?J01hcmVrIE9sxaHDoWsn?= <maraeo@gmail.com>,
 =?UTF-8?Q?Timur_Krist=c3=b3f?= <timur.kristof@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Samuel Pitoiset <samuel.pitoiset@gmail.com>, amd-gfx@lists.freedesktop.org,
 kernel-dev@igalia.com, alexander.deucher@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 17/08/2023 17:17, André Almeida wrote:
>
>
> Em 17/08/2023 12:04, Shashank Sharma escreveu:
>>
>> On 17/08/2023 15:45, André Almeida wrote:
>>> Hi Shashank,
>>>
>>> Em 17/08/2023 03:41, Shashank Sharma escreveu:
>>>> Hello Andre,
>>>>
>>>> On 15/08/2023 21:50, André Almeida wrote:
>>>>> Instead of storing coredump information inside amdgpu_device struct,
>>>>> move if to a proper separated struct and allocate it dynamically. 
>>>>> This
>>>>> will make it easier to further expand the logged information.
>>>>>
>>>>> Signed-off-by: André Almeida <andrealmeid@igalia.com>
>>>>> ---
>>>>> v4: change kmalloc to kzalloc
>>>>> ---
>>>>>   drivers/gpu/drm/amd/amdgpu/amdgpu.h        | 14 +++--
>>>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 63 
>>>>> ++++++++++++++--------
>>>>>   2 files changed, 49 insertions(+), 28 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h 
>>>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
>>>>> index 9c6a332261ab..0d560b713948 100644
>>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
>>>>> @@ -1088,11 +1088,6 @@ struct amdgpu_device {
>>>>>       uint32_t *reset_dump_reg_list;
>>>>>       uint32_t            *reset_dump_reg_value;
>>>>>       int                             num_regs;
>>>>> -#ifdef CONFIG_DEV_COREDUMP
>>>>> -    struct amdgpu_task_info         reset_task_info;
>>>>> -    bool                            reset_vram_lost;
>>>>> -    struct timespec64               reset_time;
>>>>> -#endif
>>>>>       bool                            scpm_enabled;
>>>>>       uint32_t                        scpm_status;
>>>>> @@ -1105,6 +1100,15 @@ struct amdgpu_device {
>>>>>       uint32_t            aid_mask;
>>>>>   };
>>>>> +#ifdef CONFIG_DEV_COREDUMP
>>>>> +struct amdgpu_coredump_info {
>>>>> +    struct amdgpu_device        *adev;
>>>>> +    struct amdgpu_task_info         reset_task_info;
>>>>> +    struct timespec64               reset_time;
>>>>> +    bool                            reset_vram_lost;
>>>>> +};
>>>>
>>>> The patch looks good to me in general, but I would recommend 
>>>> slightly different arrangement and segregation of GPU reset 
>>>> information.
>>>>
>>>> Please consider a higher level structure adev->gpu_reset_info, and 
>>>> move everything related to reset dump info into that, including 
>>>> this new coredump_info structure, something like this:
>>>>
>>>> struct amdgpu_reset_info {
>>>>
>>>>      uint32_t *reset_dump_reg_list;
>>>>
>>>>      uint32_t *reset_dump_reg_value;
>>>>
>>>>      int num_regs;
>>>>
>>>
>>> Right, I can encapsulate there reset_dump members,
>>>
>>>> #ifdef CONFIG_DEV_COREDUMP
>>>>
>>>>     struct amdgpu_coredump_info *coredump_info;/* keep this dynamic 
>>>> allocation */
>>>
>>> but we don't need a pointer for amdgpu_coredump_info inside 
>>> amdgpu_device or inside of amdgpu_device->gpu_reset_info, right?
>>
>> I think it would be better if we keep all of the GPU reset related 
>> data in the same structure, so adev->gpu_reset_info->coredump_info 
>> sounds about right to me.
>>
>
> But after patch 2/4, we don't need to store a coredump_info pointer 
> inside adev, this is what I meant. What would be the purpose of having 
> this pointer? It's freed by amdgpu_devcoredump_free(), so we don't 
> need to keep track of it.

Well, actually we are pulling in some 0parallel efforts on enhancing the 
GPU reset information, and we were planning to use the coredump info for 
some additional things. So if I have the coredump_info available (like 
reset_task_info and vram_lost) across a few functions in the driver with 
adev, it would make my job easy there :).

- Shashank

>
>> - Shashank
>>
>>>
>>>>
>>>> #endif
>>>>
>>>> }
>>>>
>>>>
>>>> This will make sure that all the relevant information is at the 
>>>> same place.
>>>>
>>>> - Shashank
>>>>
>>>        amdgpu_inc_vram_lost(tmp_adev);
