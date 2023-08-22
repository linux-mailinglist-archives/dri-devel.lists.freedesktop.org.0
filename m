Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B899784143
	for <lists+dri-devel@lfdr.de>; Tue, 22 Aug 2023 14:54:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CADA10E34D;
	Tue, 22 Aug 2023 12:54:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2088.outbound.protection.outlook.com [40.107.220.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F8B710E34D;
 Tue, 22 Aug 2023 12:54:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Is6CB3kmBZiF/0TSIK0y96v4ZpD7wXS6esCvQ5SDAHyl3I/JDjRmlNgxEG25/C9IxawWNSF9QkgZKbbKIh+kM5GVW9T5kRjUIeiOonwOSePA2goEufiGyGcI8OrJEjX8P1Ng/YLMeBbTJc4xTP7arGNFx2LrSJwiSJShywEAuyDLjK58QBNOtX6Gg1LlUwnrm+UUibUXGCUzmAgykhv14LOTuGY9HdhDimjuGglKlRRA7EW9kNdtuixjkoejl5f/GAG1O1CP4YxGzW+V+fXbpD3Y0JzUKKHmcvl7fAO8Gfw7/T6doNofPBUxg9YLCVSSuWix9RGnFQYjELEyjd7EJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=06BncuD1yJ0Ws26F0b3cop5Qvgu0Tl9fJCh+ZfpyONw=;
 b=DSg/833EoOC6kdMCyEryvP/9Hc8A3YA2tHiXSHIrnvuGi57hDfNmvA1kAGb2bcrjVDESzca6zZlXm0Fz5XKA1+WNZxzM7LXYSSMoE7H58NScy5kWHm2eaGTAwvGDTEkLEI4pICqmCB09FN4wm/pNka03psN1y68I1TxDC3oDg11xlQE5XWe0JN7GgKOpFl92lakzf9Rex3jKpGOVJvGkeDelkfpT3iVBQiYLFLa1TUGFJUkPoyq8SfIFAXB0L292ISeu/CMWjTcLUNDwZadyiqygqpkZmQqFLXSRDvrrI1aV06MrPgJs7HM4kmE+FRema7HP+g1DhI5R0nLU/+NwhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=06BncuD1yJ0Ws26F0b3cop5Qvgu0Tl9fJCh+ZfpyONw=;
 b=mM0J2wvnDGactK7fb2VRLlFXr03Fn7yrpROGqVgZ80Q1UWHu2TkCovTh22mz4BXMUZVVNY4sq0XEHc1AUgO0HAELv2bDPUXJKN+7uM0jorWf3VYgv1l9gdHKu8Q8Z1IRUzyMoUYsuo9wfYdOmQiDUm/qSxFXCUw2tNFagneoQvA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BYAPR12MB4614.namprd12.prod.outlook.com (2603:10b6:a03:a6::22)
 by MN2PR12MB4407.namprd12.prod.outlook.com (2603:10b6:208:260::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.24; Tue, 22 Aug
 2023 12:54:19 +0000
Received: from BYAPR12MB4614.namprd12.prod.outlook.com
 ([fe80::af11:a0ea:b4e4:d1e0]) by BYAPR12MB4614.namprd12.prod.outlook.com
 ([fe80::af11:a0ea:b4e4:d1e0%5]) with mapi id 15.20.6699.022; Tue, 22 Aug 2023
 12:54:19 +0000
Message-ID: <aeca86ab-9c5b-4011-7622-1954df1b961d@amd.com>
Date: Tue, 22 Aug 2023 18:24:03 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.1
Subject: Re: [PATCH v2 4/7] drm/amdgpu: Add suspend function to clear the GPU
 power profile.
Content-Language: en-US
To: "Yadav, Arvind" <arvyadav@amd.com>, Arvind Yadav <Arvind.Yadav@amd.com>,
 Christian.Koenig@amd.com, alexander.deucher@amd.com,
 shashank.sharma@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch, Felix.Kuehling@amd.com, amd-gfx@lists.freedesktop.org
References: <20230821064759.94223-1-Arvind.Yadav@amd.com>
 <20230821064759.94223-5-Arvind.Yadav@amd.com>
 <fdcfe7f2-05b9-c144-1b4a-74889bcb0555@amd.com>
 <d178212d-65ee-a1a0-323b-b9b91931db33@amd.com>
From: "Lazar, Lijo" <lijo.lazar@amd.com>
In-Reply-To: <d178212d-65ee-a1a0-323b-b9b91931db33@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BM1P287CA0018.INDP287.PROD.OUTLOOK.COM
 (2603:1096:b00:40::22) To BYAPR12MB4614.namprd12.prod.outlook.com
 (2603:10b6:a03:a6::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR12MB4614:EE_|MN2PR12MB4407:EE_
X-MS-Office365-Filtering-Correlation-Id: e03974ee-e70a-4b5b-b51a-08dba30ee602
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HGps4NIl6ZVxlFXTm42clSoS3pL8O91WOlaX1Cmq4Eesx9KayFQqndZbtUVjQSjtpE1KVcpSnqLXlYl7o8Ha2Q4PsOL7GY/tqjhvA18J9gxw8sQsHyUhvIepodP1+tOMMHqbP/j05bq9ODFTGpYk6i+jHLQdF1JbScUvlxCqW5/9v4/3ya1lcp3DdWXJUFz7iIpx8z3caNlN/yVgOqb0MHuBs2kUtaWqrjhky/o4o7jULcdwYx65DICB7B5M60oEaXU7cKY7ldKmCWSeW+yg6nox3ZVovqyE7t8TjBNG+kGeeh2umDTU3JV0khI3hilt2yZZpsVCut8t1cfsq/N8leXNozhs1zD51H6MbCR9bY6o9/iKR5JPk6R+Rovozrok1a2nR5niMr+tVHnyQJmkNDTW9NexVLhcm74hQfH/LP9M4rbZ+mKYOgbjsfaLB0irVV3HstqCcosEMpCf6hEhxWzxnOMXZsWSXQ0GulgbNN/4WAGnYithuEoPegeQwc385KR5O6bBR6NU4OGCmW5ktFCfltXzR415e1U196mMHZdtjTuZtOlyOA0K8nr8mlRIe8RoviUF/XS/NgWNwEkr+g1CWSI19souEyS5N7ooqUlD2YgND/zzArz5AWTFObKZXNMfHcirKgNhNVYTrd0JOhxg6EMKIU02lN1OQFO/hPs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB4614.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(376002)(396003)(366004)(39860400002)(346002)(1800799009)(186009)(451199024)(66476007)(66556008)(316002)(66946007)(6512007)(110136005)(8676002)(8936002)(2616005)(4326008)(36756003)(41300700001)(921005)(478600001)(6666004)(38100700002)(15650500001)(6486002)(53546011)(6506007)(83380400001)(2906002)(86362001)(31686004)(31696002)(5660300002)(26005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R1BwWTRyQjVqbXdLekpERWdFbHdLb2NpbU9zUk9IWkgyU0V4bXRUVWl1Q0cw?=
 =?utf-8?B?bWkvemErTzdHMG9XS3V6Tjc5VGhsMUx4NVl4R3F4NlVBVWtScmRteDNzMXdB?=
 =?utf-8?B?b1ExdWZkckoxQUZidUVVMFF0S0UzUUpsTUpvcEc1Q2FsQ2pxdFRzWURlWG9F?=
 =?utf-8?B?VGpuVnozamhhNG5BYnJBbnh5RmdONExuUkMwWUF5U0lMeS9NcGFhUnIrVFNJ?=
 =?utf-8?B?Y3hXdlBIT1lPbXJTTm12d0k2cGFZRmJNUjI4dGNwSWpObFpzeE1DRnZBVFMw?=
 =?utf-8?B?UnUyMGMwZG9nMWtEYnNiQ016TE1vQ2xjRVRKVGtmMFBCUlN0ajl0TkJXbllz?=
 =?utf-8?B?SWJBbG1NL2ZnY0doaEJDOExpUCtYN2M0cUJPWjBoaFYvQ1NWeHMyditvMERt?=
 =?utf-8?B?ekYzMnR5dmtvVmNJcXRudmRMQVZZL0FEZEgvR3dsbUdNYUhCK1F3cXBEUnFF?=
 =?utf-8?B?RElQYnYvVnhGNmU5eExBTFBzZlp2a29PQ1Urc2s4Y1M2MkVGTFVHUVAvbjNt?=
 =?utf-8?B?eUpZYzl5c3hwWXF6MFpSVzdEUmNKQUJaeVc3ZlZuZGdjMGdBZ296YkRhS2RE?=
 =?utf-8?B?OXZrNE5tT2IwN1JETmdkTEY2Um9FY0hMZ0M4bzMxMENsY0lOYjhnS1RSc0RF?=
 =?utf-8?B?QitrOWs4OUpQbzdzVW5La1l6ZzlnMUk0VXU3ekkvUk5iZEhIMWVjWVZyVjFK?=
 =?utf-8?B?U1U1Z21ONG9pOWtGQ1Zod3gwa3lyZ0lkNGt2eTdxTDFnK0k4OGxOdEJ0U2pI?=
 =?utf-8?B?MGY2VjkvcXpNMGNleWt0VFVyUS9pUU9MZTZVNGp6V2hSUzQ0aU9MVW44bFY1?=
 =?utf-8?B?Z0NXVFdaYmRidm0rT2ZFcm5FcjFENE9RTkY0amxESUl4ZzlyTk9MYTB0cFor?=
 =?utf-8?B?dzBjR3BMR3VOT0FRdVFXL0xhcEdwc3RaZmdTTUx5ckczU1Z1dzIyQXpnWFZi?=
 =?utf-8?B?K1ZEdVBJZlNqL29peDRkWjRLaDBLM21YayswZjYwSlM5NDlWUE1semU5ZTBR?=
 =?utf-8?B?b0dldzJwT2lqM3ZKa1JBM0ZsbjdDM2Ewak5HRXlCYkJMUElLbjlRTEwrc1dN?=
 =?utf-8?B?bVF4OFVYeWV6OEo4dmRadjhCTEFKUFBZaXdtTGpzaVRDeGxuRnlEYldibE8z?=
 =?utf-8?B?YWxRRE5tOWlEUTdrdWVNQk92ZHZyMWdpNlNZclJDMU4zb01WYjUrMG5QdFVZ?=
 =?utf-8?B?c0FxZkh2YktubjZmc3dUY1dYaFdmOUlXb0JKTjY1SjZwUWhHZWpsUEVWOUFx?=
 =?utf-8?B?ZzFzb2p2UVkzYVhmb0lLYmhqK21FVzl4LzlvOVVMOVZpQjN5OHhPK3NESEVk?=
 =?utf-8?B?OVdBZUdwdEdXQTJ3V1dsczlRenZ3TmUzQyt3cDRtcjRja1VwT1hCR0t4Z0hp?=
 =?utf-8?B?NlR5YUR5SERwYWZnd1VVaDAxNDZsdlI5UG9HdXNwU1hvWCtJS3ZYK05lS0Jw?=
 =?utf-8?B?UEJVUUc0YmNpa2VEMkFmemJOL25MMnVOWXRaUGhrU1lQd2RvOFJiRUpxOC96?=
 =?utf-8?B?eUM0RlhSTktiNkszV3pMSmNoMlBFZXBweXE4b2VxNGVaVTB5dGFORWlob1ZZ?=
 =?utf-8?B?ODZqWDZ5TVhxQk1JdXdlYlV0Mkg4M0Ira2tIQ0xlVXo0TkxTUTg2bExxT1M1?=
 =?utf-8?B?ME5JNDdKblJ6OGZBWWZEdFB4bjR3Rk1YMFQxZ2x3ZkplNVRyV0YvYlVSRlhp?=
 =?utf-8?B?eFVJVVNhM0RWd3IxUC83R3d6OW12Q21mWWR0TTdiVVA0Nng1dHJQTURsNERO?=
 =?utf-8?B?NkVrMlJLajBFTUVNWlZvVDN3R2V1VGloU0pRSm9zMmxpSmdvZnFCM1Vlb2k4?=
 =?utf-8?B?MkJLRHJYSkJXeTJjb0hKaUljV243ODNuQ1JIRVNSVUFQaU9Cb24xczVCNXhM?=
 =?utf-8?B?RHJ1R1NqeFZkMGxKamovWUQ2cis4ZmZUS1FJV09OWDFyOU1RMFhtTXZ2U2ZJ?=
 =?utf-8?B?MkVESFI5M0hzV2N3VTB4c2ZrTE9WMGFmMWdBenpBNzNMb1VlaFYzL2xnR2Rs?=
 =?utf-8?B?NllCaFRIM2JiaVAzeWRwTmswVlE0NzcxRnhQTjBCeEcwcGN6eU9qUmNvd21N?=
 =?utf-8?B?ZHJFRi9XOHJNSHV2VXB1dUhYcVNsT1MyTnNIcktUNldrUEpWQW5KN1RhNitO?=
 =?utf-8?Q?wLc046GdVu4qfqDiITFXOBw87?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e03974ee-e70a-4b5b-b51a-08dba30ee602
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4614.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2023 12:54:19.0770 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SyuzcTE6QBHt5tXdazwFU+e2XdZuQM4VUuy5+7qk+avvDx8ASesTA5ct+qjCPRoy
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4407
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 8/22/2023 5:52 PM, Yadav, Arvind wrote:
> 
> On 8/22/2023 12:01 PM, Lazar, Lijo wrote:
>>
>>
>> On 8/21/2023 12:17 PM, Arvind Yadav wrote:
>>> This patch adds a suspend function that will clear the GPU
>>> power profile before going into suspend state.
>>>
>>> v2:
>>> - Add the new suspend function based on review comment.
>>>
>>> Cc: Shashank Sharma <shashank.sharma@amd.com>
>>> Cc: Christian Koenig <christian.koenig@amd.com>
>>> Cc: Alex Deucher <alexander.deucher@amd.com>
>>> Signed-off-by: Arvind Yadav <Arvind.Yadav@amd.com>
>>> ---
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c    |  2 ++
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_workload.c  | 23 +++++++++++++++++++
>>>   drivers/gpu/drm/amd/include/amdgpu_workload.h |  2 ++
>>>   3 files changed, 27 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c 
>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>> index cd3bf641b630..3b70e657b439 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>> @@ -4212,6 +4212,8 @@ int amdgpu_device_suspend(struct drm_device 
>>> *dev, bool fbcon)
>>>         amdgpu_ras_suspend(adev);
>>>   +    amdgpu_workload_profile_suspend(adev);
>>> +
>>>       amdgpu_device_ip_suspend_phase1(adev);
>>>         if (!adev->in_s0ix)
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_workload.c 
>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_workload.c
>>> index 6367eb88a44d..44ca8e986984 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_workload.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_workload.c
>>> @@ -174,6 +174,29 @@ void amdgpu_workload_profile_set(struct 
>>> amdgpu_device *adev,
>>>       mutex_unlock(&workload->workload_lock);
>>>   }
>>>   +void amdgpu_workload_profile_suspend(struct amdgpu_device *adev)
>>> +{
>>> +    struct amdgpu_smu_workload *workload = &adev->smu_workload;
>>> +    int ret;
>>> +
>>> +    mutex_lock(&workload->workload_lock);
>>> + cancel_delayed_work_sync(&workload->smu_delayed_work);
>>
>> Another deadlock candidate. Between fini() and suspend(), the only 
>> difference probably could be initialization status. If so, just use a 
>> helper that is used during fini() and suspend().
>>
> Before going to suspend(), we need to cancel the work and clear all the 
> profiles but in fini() we are destroying the mutex. also it will be 
> called when we are unloading everything.
> 

What I meant is for both suspend/fini, you need to cancel any work 
scheduled, clear refcounts and set the profile back to default profile. 
Keep this in a helper and reuse.

Thanks,
Lijo

> ~Arvind
> 
>> Thanks,
>> Lijo
>>
>>> +
>>> +    /* Clear all the set GPU power profile*/
>>> +    for (int index = fls(workload->submit_workload_status);
>>> +         index > 0; index--) {
>>> +        if (workload->submit_workload_status & (1 << index)) {
>>> + atomic_set(&workload->power_profile_ref[index], 0);
>>> +            ret = amdgpu_power_profile_clear(adev, index);
>>> +            if (ret)
>>> +                DRM_WARN("Failed to clear power profile %s, err = 
>>> %d\n",
>>> +                     amdgpu_workload_mode_name[index], ret);
>>> +        }
>>> +    }
>>> +    workload->submit_workload_status = 0;
>>> +    mutex_unlock(&workload->workload_lock);
>>> +}
>>> +
>>>   void amdgpu_workload_profile_init(struct amdgpu_device *adev)
>>>   {
>>>       adev->smu_workload.adev = adev;
>>> diff --git a/drivers/gpu/drm/amd/include/amdgpu_workload.h 
>>> b/drivers/gpu/drm/amd/include/amdgpu_workload.h
>>> index ee1f87257f2d..0acd8769ec52 100644
>>> --- a/drivers/gpu/drm/amd/include/amdgpu_workload.h
>>> +++ b/drivers/gpu/drm/amd/include/amdgpu_workload.h
>>> @@ -52,6 +52,8 @@ void amdgpu_workload_profile_put(struct 
>>> amdgpu_device *adev,
>>>   void amdgpu_workload_profile_set(struct amdgpu_device *adev,
>>>                    uint32_t ring_type);
>>>   +void amdgpu_workload_profile_suspend(struct amdgpu_device *adev);
>>> +
>>>   void amdgpu_workload_profile_init(struct amdgpu_device *adev);
>>>     void amdgpu_workload_profile_fini(struct amdgpu_device *adev);
