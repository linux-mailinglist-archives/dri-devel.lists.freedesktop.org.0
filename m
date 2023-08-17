Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC14177FB0A
	for <lists+dri-devel@lfdr.de>; Thu, 17 Aug 2023 17:43:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3176410E4EC;
	Thu, 17 Aug 2023 15:42:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2077.outbound.protection.outlook.com [40.107.93.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB6A210E4EB;
 Thu, 17 Aug 2023 15:42:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e9dPEaeOLNoq4bKvFvB13rDH3Qik6Z1v45Kp7MOGOvOsoMyDCo2NzBhmMd8IQlcrro+/gxf1l9LaLZGDkikH/SrfdITPI9hbN9dLMow5CQ+86hVws6MvPamD/HHRUbLBqP4q40d5HNbHVVbeVoanapZCVCSRm4z0XLxpqeZwAvSi1nS4QhAPeNLfZBKi8w5U6C9q3Os56hny0XwhXWfNzxDoU8WDS0EkL4WXpZ2XVJxiOOGcTlkQiF1vL9FDew2GstMt6l9tXbShGzLg68cJLYbcm0S4ZfP15Iv/QCRXTzIMlAQFLZ4sIuYxHtXHYTndXr97hP5mfnu/zYS9CcMEOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dCIn1VDLjzJFYTrd+bB18OO79IWPN3gIkm69NKPkCK0=;
 b=izN9SwVQ19MH/2aMraPSZ3jxWRHDjGrOeeyF8rKoQe5uHzuUUPFEa7sXYSRsHj9NCX+ryTwHUbo00YqhAVqb5RJdPRWqO3KVCSFOt+byC3YOTBwD8peXsA+2IBbq6ZE/jlMOQTwnKmL9AOrtzGv2Lu115KEoS3veGvM0fx6dzWH4DtnLjwuI/uU10pIGIXuKtApNmZMCAklMxYvnVRiMWMM+ewjb7HCevrUxT3lemLyBATLLg5CJK6rbhxmLx398AxPCOE5qtS5ZlVK7KYfEQPP+iwzc/5Hq+qpgZcLaYDBcVdqVsd/7hIzdCyImrQhW3ePTz4fYRlA8pG2ELsULwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dCIn1VDLjzJFYTrd+bB18OO79IWPN3gIkm69NKPkCK0=;
 b=rOmM9J73abwXz3U5zjnz2/upwDxTrvZmtZP0scbhgFiRi6A4frLtJcuQVUrPPTTBXp2COX9bsnW6dZcPi3D8ikFvUKfIvLPc3Utczl29H+rjezwpzafslhL+R+AUB7+VeAOOZi73Q+lgWbeVgbpCUybpkOzWp7psU6+hFn1ndhc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW4PR12MB5667.namprd12.prod.outlook.com (2603:10b6:303:18a::10)
 by MN0PR12MB6246.namprd12.prod.outlook.com (2603:10b6:208:3c2::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.31; Thu, 17 Aug
 2023 15:42:52 +0000
Received: from MW4PR12MB5667.namprd12.prod.outlook.com
 ([fe80::dc06:ffb3:46ec:6b86]) by MW4PR12MB5667.namprd12.prod.outlook.com
 ([fe80::dc06:ffb3:46ec:6b86%3]) with mapi id 15.20.6678.029; Thu, 17 Aug 2023
 15:42:52 +0000
Message-ID: <6e641ffe-8caf-d4b6-5423-8bc822b22f07@amd.com>
Date: Thu, 17 Aug 2023 17:42:43 +0200
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
 <e1795fa8-f34e-6805-c937-1937490f09a5@amd.com>
 <48c9521c-88f5-4975-8bf0-85ac42431a36@igalia.com>
From: Shashank Sharma <shashank.sharma@amd.com>
In-Reply-To: <48c9521c-88f5-4975-8bf0-85ac42431a36@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BE1P281CA0251.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:8b::19) To MW4PR12MB5667.namprd12.prod.outlook.com
 (2603:10b6:303:18a::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR12MB5667:EE_|MN0PR12MB6246:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c896272-a15d-4cf8-422d-08db9f389db9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1PoUN0K2fUUgreNeU8itaxltyYBj+lg7yCWqiNlThsLiEFkUEb8ooRBBnTIRCkZpTHUh6Y6LV37k0QumjB87kCbpG8veHxy0kiExtnscMmqf5UyKAfHdzpcVEuiN6dACkGGrATl/+5v1GsoKMERDW7cAy0a1m78bi8zZdM+0jYVFVMJDtTWiPCSlRkAU4ciDhQ5biH78qFIUed+OXDno8UexMks+83Ir9oSfcgu4VqufWohFvGOI+g3+vGNNDtk7TnjSJ1BwTSrP568m59ML0vnfcERV86bzyKVtgMtsn5EuZ0/rd63Ql9WX4W7JWUaL78o35kUXOhoWz8YnoHRAomQ99QBrqzE6NK7efHVyFSyS+ZYP0kYMftxHbQHd+NLxja7f2AHAukQYxX1VWrA9pSUb7flqPWr/YfVKMvFEa3SXTFqklva4RppdrgkZ+rAfC6rpqLZTXBXuXaoW+iwmEuqzczf06vArNtBoNIPmdbwyBEagNGYSswDjHx4/EZxvXnkXshiAS4XWXyoGVVuVFF4sDVc5DEUAQ3BVTboO1Xf/ahw+tDJZBqerIZ/4zOFLPALySjQVC6rH3tDTpMOAtCMPeo09dDQXlSc9obCea8styPai2cgWX8vrucb0kDVnGc0JaVwI/gLcyYgf1+LWjA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR12MB5667.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(376002)(136003)(396003)(39860400002)(366004)(451199024)(1800799009)(186009)(31686004)(86362001)(31696002)(36756003)(38100700002)(2616005)(5660300002)(44832011)(66556008)(478600001)(6506007)(66476007)(66946007)(316002)(53546011)(6666004)(54906003)(6486002)(6916009)(26005)(6512007)(41300700001)(4326008)(8676002)(8936002)(83380400001)(2906002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?emhpSkNFRHZIWHBpdjI3Zk04NkNuQ3k4T2FBTUsxK0JxNnV1WitRanc0ZU1P?=
 =?utf-8?B?RU9hNUN1cndNWG1LUGZqaURwUmcrNnVYWDRaQzk5SXlkRTBoSER6WU5KK1Rl?=
 =?utf-8?B?eXo0SzF2N21tYWl0SEtaSTUwRlA2Wk13VWV3U1JGSVlUR3dRcjlIZEM2MnUw?=
 =?utf-8?B?R04ra3VKREJ5QU1XN3JNUDlyNnM4UkdWODM1ZkZiNjRpb3V0Z3hEU284T1Mx?=
 =?utf-8?B?SnU2aVA4SmswYm1EL2hWaFRmdy9hN3VLYzZPSGUvRnBERlNHdU8rQjVtamVs?=
 =?utf-8?B?bHhSbjhXQWlkbkMrbmpwV2VuVHdlTDFxUFlCK2QvcWZ4cHBQaEZ5V3ZDdXRW?=
 =?utf-8?B?ZXlQL3EvN2NzYjRDbkhHdXRqa3Z2Y3kzc3hNLzIrN3VvK0tEejQ1WWZDVkpo?=
 =?utf-8?B?b0lQYVZtVnU3TGk5TmtaSUVoNUhRTmlENTZqQXYyL1BmWWlzalArMDQxK3JM?=
 =?utf-8?B?ZlBPbmJYS3pWUnhRNGRML0M0d0hCNG53djdJYklKb2pZZTBCYldyVytPUCtQ?=
 =?utf-8?B?dFpHMDVuQ0ozNmprV1BibmdSbjhrVk4rY01HZ2JpVXA5WjMxYzJVeDhNc2Jj?=
 =?utf-8?B?ZWFaNUVSYUF0eERSSU9CRWxORFd0YndlUVRmUVNuY2tRbmVCZ09mTlJaVnNG?=
 =?utf-8?B?dHgwMkJRNUFwWnpmZEdZM0Y4T1U2dHMrT2VzV2hjeUY3T2pXT1g5ZUp4OURK?=
 =?utf-8?B?b2d0TXdaUDY5VC9vNmNlYXNmV29GKzlXSjFheEVJbXg4RDVaSkQ3RVZuNk5h?=
 =?utf-8?B?c2FCWFVYQnd0eVFmL1MwUCsraGtiQm9xd3hCMXVrb3czV2NTdnVKKzMxbGFT?=
 =?utf-8?B?c3JCR0I3MDd2NUhMc1VsOFlLdWVyYmpST1Q4cmVnQm1lbUxUSzduN1I5Zlhm?=
 =?utf-8?B?ajdzRkpOUG01WnFocU5CanZsNk9vVno1NGJVYWora3BXZnpFTjJZOWdCc2lH?=
 =?utf-8?B?LzBhK3AxeXN6bFpnUURTbEJXb3RWZVVFN21oSEttVnduQytyVVU4NUplVVda?=
 =?utf-8?B?L29XNFZTWCtRYVRZTnplcVB2VGwwNHdLcFgyb0prUkRmYWovR1l4MDk5T3Vu?=
 =?utf-8?B?SzJ3QU4xakdqSG9MWWtoYk9kYlMzWjVnZnhNcDBrVnUxWFhQZ2ZHSVVOVGdu?=
 =?utf-8?B?Z1pIbmZNVmdjYWMzTklDaVRzcGdHVlk0ZnBrTUx1bVJOSHVNY2R0WExGU1Fs?=
 =?utf-8?B?N1NIa1RZUHlJallKSHBMNHZsUnRQZ0ZxeVBlY2pMWlVlYlJtL3RqeG53TXdI?=
 =?utf-8?B?bzdSK2hSNFphd0J2MTR0MTh5VUNYWVJ6L2VRTkVYY0VGNytuQ3Jja0dOenp1?=
 =?utf-8?B?T2hIQ2p2MmljUWpKTmgxL2czU3F5c002cWFIU2ViM1lQaXh6aU9aeG81c0ow?=
 =?utf-8?B?RDZ1bnN6c1J5WGFtNk94dXhtbnRnNFNvVFExYVRoWEU5Z2dhK1JkSWZkTHlZ?=
 =?utf-8?B?YlVuamluMXJ1VC9zL2xnR1NCeEp5aklpc2pNMzVoMGpvT3QrMFMrbm1NSThm?=
 =?utf-8?B?dVU1VHJGK3c0ZmNWb2h0UzJMc3VVb3ZjbzFtcnd6OHkzNXozMGJFajl3anNp?=
 =?utf-8?B?alRFMVdaU1c0Y1JnSUZaZFdNdHNhd0FURng4YzhYZUFqM09OZXlpTm54dXBp?=
 =?utf-8?B?YVVLU3kzazN1QTNaK0I0RjdIM0drUFdQbWlZdkpZL1pLbHNMSktCZ1ZaMEJt?=
 =?utf-8?B?VjhQSWJpSXQ3V0FkdzNQUnlqUW5KWG9QbGt2dlR2d2VEamtVd2N6TmpJS0Q2?=
 =?utf-8?B?RFdoRStQeUFkeGtiN25FQlRxaDI3TmNwOHpTUXl5bnZHRzhEYzZqdGkrNUs0?=
 =?utf-8?B?VzRKbTdvcXZwa0xPNUZJbDRVaDNQaWtDSGhmNGR0QmZRcjVZa2JkSHhFRVhG?=
 =?utf-8?B?eWppVkRWZHBNUWtrYnMrRVlHL2xPTGc1SUFJMWVYeFhCOUdvUFR0eWJXSExv?=
 =?utf-8?B?Z05PUDlFcU44OVVzQmZUT0JCcFBETDV3Zy84NUxjbHRpMHczRE9HSS9UM09s?=
 =?utf-8?B?VmVjTXJObGRycWEyN0UvOWhDdjMvZDRlbVFacytpQlV4WloxRU9jLzZTd091?=
 =?utf-8?B?TUlsMWhlb0hFYUNGeTVSY20yTDRRa2Yva3JzNVZOODl0WTdrQnhKNjc3ckVQ?=
 =?utf-8?Q?CNRA+UMxGtRZp5ZnarmvrhWop?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c896272-a15d-4cf8-422d-08db9f389db9
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB5667.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2023 15:42:51.9200 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 11RvYHWx4wiQcsMYSSutS7SJax1jfM+7lr+aHxMaEl3lBFnmTD/EWmYfBBqF3S5n5GfWx2g/MLElguvpVcf0BQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6246
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


On 17/08/2023 17:38, André Almeida wrote:
>
>
> Em 17/08/2023 12:26, Shashank Sharma escreveu:
>>
>> On 17/08/2023 17:17, André Almeida wrote:
>>>
>>>
>>> Em 17/08/2023 12:04, Shashank Sharma escreveu:
>>>>
>>>> On 17/08/2023 15:45, André Almeida wrote:
>>>>> Hi Shashank,
>>>>>
>>>>> Em 17/08/2023 03:41, Shashank Sharma escreveu:
>>>>>> Hello Andre,
>>>>>>
>>>>>> On 15/08/2023 21:50, André Almeida wrote:
>>>>>>> Instead of storing coredump information inside amdgpu_device 
>>>>>>> struct,
>>>>>>> move if to a proper separated struct and allocate it 
>>>>>>> dynamically. This
>>>>>>> will make it easier to further expand the logged information.
>>>>>>>
>>>>>>> Signed-off-by: André Almeida <andrealmeid@igalia.com>
>>>>>>> ---
>>>>>>> v4: change kmalloc to kzalloc
>>>>>>> ---
>>>>>>>   drivers/gpu/drm/amd/amdgpu/amdgpu.h        | 14 +++--
>>>>>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 63 
>>>>>>> ++++++++++++++--------
>>>>>>>   2 files changed, 49 insertions(+), 28 deletions(-)
>>>>>>>
>>>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h 
>>>>>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
>>>>>>> index 9c6a332261ab..0d560b713948 100644
>>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
>>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
>>>>>>> @@ -1088,11 +1088,6 @@ struct amdgpu_device {
>>>>>>>       uint32_t *reset_dump_reg_list;
>>>>>>>       uint32_t            *reset_dump_reg_value;
>>>>>>>       int                             num_regs;
>>>>>>> -#ifdef CONFIG_DEV_COREDUMP
>>>>>>> -    struct amdgpu_task_info         reset_task_info;
>>>>>>> -    bool                            reset_vram_lost;
>>>>>>> -    struct timespec64               reset_time;
>>>>>>> -#endif
>>>>>>>       bool                            scpm_enabled;
>>>>>>>       uint32_t                        scpm_status;
>>>>>>> @@ -1105,6 +1100,15 @@ struct amdgpu_device {
>>>>>>>       uint32_t            aid_mask;
>>>>>>>   };
>>>>>>> +#ifdef CONFIG_DEV_COREDUMP
>>>>>>> +struct amdgpu_coredump_info {
>>>>>>> +    struct amdgpu_device        *adev;
>>>>>>> +    struct amdgpu_task_info         reset_task_info;
>>>>>>> +    struct timespec64               reset_time;
>>>>>>> +    bool                            reset_vram_lost;
>>>>>>> +};
>>>>>>
>>>>>> The patch looks good to me in general, but I would recommend 
>>>>>> slightly different arrangement and segregation of GPU reset 
>>>>>> information.
>>>>>>
>>>>>> Please consider a higher level structure adev->gpu_reset_info, 
>>>>>> and move everything related to reset dump info into that, 
>>>>>> including this new coredump_info structure, something like this:
>>>>>>
>>>>>> struct amdgpu_reset_info {
>>>>>>
>>>>>>      uint32_t *reset_dump_reg_list;
>>>>>>
>>>>>>      uint32_t *reset_dump_reg_value;
>>>>>>
>>>>>>      int num_regs;
>>>>>>
>>>>>
>>>>> Right, I can encapsulate there reset_dump members,
>>>>>
>>>>>> #ifdef CONFIG_DEV_COREDUMP
>>>>>>
>>>>>>     struct amdgpu_coredump_info *coredump_info;/* keep this 
>>>>>> dynamic allocation */
>>>>>
>>>>> but we don't need a pointer for amdgpu_coredump_info inside 
>>>>> amdgpu_device or inside of amdgpu_device->gpu_reset_info, right?
>>>>
>>>> I think it would be better if we keep all of the GPU reset related 
>>>> data in the same structure, so adev->gpu_reset_info->coredump_info 
>>>> sounds about right to me.
>>>>
>>>
>>> But after patch 2/4, we don't need to store a coredump_info pointer 
>>> inside adev, this is what I meant. What would be the purpose of 
>>> having this pointer? It's freed by amdgpu_devcoredump_free(), so we 
>>> don't need to keep track of it.
>>
>> Well, actually we are pulling in some 0parallel efforts on enhancing 
>> the GPU reset information, and we were planning to use the coredump 
>> info for some additional things. So if I have the coredump_info 
>> available (like reset_task_info and vram_lost) across a few functions 
>> in the driver with adev, it would make my job easy there :).
>
> It seems dangerous to use an object with this limited lifetime to rely 
> to read on. If you want to use it you will need to change 
> amdgpu_devcoredump_free() to drop a reference or you will need to use 
> it statically, which defeats the purpose of this patch. Anyway, I'll 
> add it as you requested.
>
I guess if the coredump_free function can make the

adev->reset_info->coredump_info= NULL, after freeing it, that will 
actually help the case.


While consuming it, I can simply check if 
(adev->reset_info->coredump_info) is available to be read.

- Shashank

>>
>> - Shashank
>>
>>>
>>>> - Shashank
>>>>
>>>>>
>>>>>>
>>>>>> #endif
>>>>>>
>>>>>> }
>>>>>>
>>>>>>
>>>>>> This will make sure that all the relevant information is at the 
>>>>>> same place.
>>>>>>
>>>>>> - Shashank
>>>>>>
>>>>>        amdgpu_inc_vram_lost(tmp_adev);
