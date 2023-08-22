Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 376BA784070
	for <lists+dri-devel@lfdr.de>; Tue, 22 Aug 2023 14:12:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 443E910E33D;
	Tue, 22 Aug 2023 12:12:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2076.outbound.protection.outlook.com [40.107.93.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C55FF10E33D;
 Tue, 22 Aug 2023 12:12:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dOXGroNy7dUcGIXKdRwSBYJlx92cl/U2sVsuEgE60qjIJPk0xzfixNNo5E5HwVAFxHZNSHs2z7NQJ2VZiqRih+oL+TRZoy3JmwkFkNN7G6Zd/qhlczcLcVuMSx56Ab/P7xf6zRvt3pfo6HFm18zk9tVpINCeLqf/GQry8gl3OpH35snW53ztU/uOq14TOBxO9gztWG3UlitKyvRkLS39k5jiKTMrdeorkc4v4R3oyHq65j4YVmpYe3eXSet93+SSgjS33SOG4xt3lNwAlASuPu1uoQKrqf4TjntqvjNClGGdrO02NHLetJ8tOAv0aHp/V5/HMBj5d3z1viRDF6zBFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0EACOtVGaMhj87c0qI/+QD3BYFejha1eEtNDSD+tCqg=;
 b=BtB+WP8cvUp08PSxlmXJnTOUO1AcCenswFwpr/T8Gibj/2Q7L3t8tyuSSidT4mFjDb0Wmjoh1ghuQ0grsU6OfCse7oilVz2Z2t3+whdqMNX9qkduKVm6coROoR83VRN7hkQY9jkZrE2QFkqPlcihpojVK0q32V+NosDV7UdtATCk80pOQxhls1MfKxIwfFEufEoVRCbDIL6MdGIbNU83vQXndrl9/foTo6m8fAgAO1GjHjtM75y4FkQ5dz+3KmdObR7aykFfpG30RYd4cASt5dSBukmbKGjb3BqHpuWsmUskcwC/oukmL7bg9jRuv3shNQXJegVXn3Jbe0VMelj3vQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0EACOtVGaMhj87c0qI/+QD3BYFejha1eEtNDSD+tCqg=;
 b=Cykp0WmAo63XxahkWIgu2r3x4c2WQ1GPH9MzyQlyz9ZvhPt94ZNQB0O52E6fOR/TkJK9sZY8xndPyjhfyV6r8h+frB2XUjZVdwFuT9nIL/KNbR9TyRSGYQtHMCXUMBfzYdrPNMXTLNTyT3UKvfSHoObELm9oZIMEIQdYKC/Wl+U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB6000.namprd12.prod.outlook.com (2603:10b6:510:1dc::15)
 by SJ0PR12MB6941.namprd12.prod.outlook.com (2603:10b6:a03:448::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.20; Tue, 22 Aug
 2023 12:11:59 +0000
Received: from PH7PR12MB6000.namprd12.prod.outlook.com
 ([fe80::f78e:33f4:56d2:1ef4]) by PH7PR12MB6000.namprd12.prod.outlook.com
 ([fe80::f78e:33f4:56d2:1ef4%7]) with mapi id 15.20.6699.020; Tue, 22 Aug 2023
 12:11:59 +0000
Message-ID: <443129d5-4d40-c777-e488-78393bd35397@amd.com>
Date: Tue, 22 Aug 2023 17:41:45 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 3/7] drm/amdgpu: Add new function to put GPU power
 profile
Content-Language: en-US
To: "Lazar, Lijo" <lijo.lazar@amd.com>, Arvind Yadav <Arvind.Yadav@amd.com>,
 Christian.Koenig@amd.com, alexander.deucher@amd.com,
 shashank.sharma@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch, Felix.Kuehling@amd.com, amd-gfx@lists.freedesktop.org
References: <20230821064759.94223-1-Arvind.Yadav@amd.com>
 <20230821064759.94223-4-Arvind.Yadav@amd.com>
 <c72a7412-a95a-1a99-f337-f64a789e81bf@amd.com>
From: "Yadav, Arvind" <arvyadav@amd.com>
In-Reply-To: <c72a7412-a95a-1a99-f337-f64a789e81bf@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0113.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:96::18) To PH7PR12MB6000.namprd12.prod.outlook.com
 (2603:10b6:510:1dc::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB6000:EE_|SJ0PR12MB6941:EE_
X-MS-Office365-Filtering-Correlation-Id: c2bdbf1b-70f7-4e76-38f3-08dba308fc10
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eQ+Evq9zBifKeTMjpUe4xbt108dNgrf4dbpfRDA0tRalpsejqeCECgcJ2MTQ9GZnv90SLoBlqsoPjr+xYtfrs1wmAbwWsQKEC0xmi3fUtHKvdaIr2JGwRdwydqwlpBkAAIdUmb+OG6ix/uuPrPw0XeLNHaI2By7vRH1gd4ipHvmPA9Gqvw7vRKNfAMkoPp/2LZJqxB0i0gngTsAo2NHVpb572K3GuIRYk4SQqD7blqfJtXLFi46RrQWhTTruSZoxWm2Vx1pYaNDjhmfbd3296W211Z6SDMMmXdTXvKqQP5Xuz/4w/7D8VKgBhkJTqkpo9bnIdQuXdSEAmSpi18jilmjqbiCyV63z2Z4OvI+xlFYqqpqaycYfhCyFQBWbesAUw6K8szSxF64E0v5xty4e9uD3xntAPb5IuhGBDN8IyespcnXUQSlFW4ZYUKEZzeVbqb77JBqpNBGmY89fhpOTJTSh6ozHrIEhyl+bAq3DA2ZaWA0wr6NhfDMQvsM7ftn9dwukej4B+6siJlou+aUBIX7+Q2a4Qd1eYxHKiYPUvDLL0XbAvpg21y0WxEpYyqIutgp9lT9bqSYzMlx3ABTIm0x3C8lkrWhufcB1ZSUeLi7lKu5xH9yTAb0GqendxEp/DYeL3+3aP77HWdT0PaEt/QGYSD+g7zugf37s9xuvs7M=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB6000.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(376002)(396003)(366004)(39860400002)(346002)(1800799009)(186009)(451199024)(66476007)(66556008)(316002)(66946007)(6512007)(66899024)(110136005)(8676002)(8936002)(2616005)(4326008)(36756003)(41300700001)(921005)(478600001)(6666004)(38100700002)(6486002)(53546011)(6506007)(83380400001)(2906002)(31686004)(31696002)(5660300002)(26005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cUhRYmVCSEVTcDZQSUZVK3htamJMZUtvTS9OTzVtWFRBZXlFeCt6YVh6S1dl?=
 =?utf-8?B?TUFiVms2aGcxMkIxR1FnSEtVY05xb09hcVdUZmp3L3RqTW1rV3J1aUg1OXk4?=
 =?utf-8?B?a3dEemg1c3gzaVprK0NpeURaakJCOEdQWFRNdVlTdDlZOHhSZEZEZDVqZ0ta?=
 =?utf-8?B?Vit4SEpjVWhnNWdUZEZYSUJBL05pU0xQZ0p5d0E5VkJvZFEzRDNyM2U5YzE0?=
 =?utf-8?B?LzF6SGJhYmRPdWZnNk1FM01hcjRpSmhuaUZVcFdXRWtHcS9zUTdXTHh2bjV4?=
 =?utf-8?B?TDZGWWh5NTY5WlVFZThPeU9SUE1ZRlhLb0YvUThnVkRkajI3UE9IQkU5WUpC?=
 =?utf-8?B?NThEZDVOREs5TGtSR05lOGQ2VTY0b2RPMGlsRkdwaTJ1U1VDYmNQVU53OVor?=
 =?utf-8?B?VDFmNzhMdGJLeTdPTEEwejhyV0FFQmg2dGNhWHAyclQzOU16TVMrdFB1T3FU?=
 =?utf-8?B?c0IxVEZ5UHFSRUdpUUJoZjBNRFQwd3Fvc0N5K0JOc2U3YWJ5ODBPSnE3a1dW?=
 =?utf-8?B?UDBPaWxJaCtMNVZkaDNBd2xQM1dtRW5YVVA1YjJtM3UxajhhZXJ5alhvRmNE?=
 =?utf-8?B?Q3pjaTFSMDdKQldabi9ScVoxbjl0djdSNXhONVJYWmo2OU13Q001cTNzRGdR?=
 =?utf-8?B?bTU4b0R2SzhRZHZNYWlUREVvbXN2T2tPeEo2R05TUjZHNlVicnZTb0VwWFc3?=
 =?utf-8?B?U0VZaUI5OEVOMVRteEpPNnZsVUVJcm9RMndtVzRsQithamJWSmdvL0tzZFRM?=
 =?utf-8?B?QS91ODdmVG9GM09qRk4wU2xVTXpUU2NKQS93T2FmQ25jSW5XMlJNNGJ1M296?=
 =?utf-8?B?TVJjZXlkMUNCYzk3cUtDRFdIbzM5UnVoNklwRnNnWXVmWit5WU8xZnFCaS9Y?=
 =?utf-8?B?ZXpCZjZibExOUjViZy90dVRuK2xCTlFpWE5oVlpINUdZNDBDSUw0K2RiaHZW?=
 =?utf-8?B?bUdLQisyZ040TW1DU1pPZHYxWTZhWHJHdW9PQ1g2SksyTmdkQW9DUFVCcmxN?=
 =?utf-8?B?L25CUGtvTzB4S0tWUkEzeWplUkxCSm1ZOVRSTmFVZldreE5Lc2tROHAzR2lB?=
 =?utf-8?B?c1NOYjlweDRKalFGbFNYT1hDajRVRlFaNS82UzZyT2ZJSDRDSDFFQmhac2NF?=
 =?utf-8?B?SW52amRhcGZHQlAvUllTdEQvM0ZKcEYwTGZ0a2cyRnlFMWkvNjBMSWtaalUv?=
 =?utf-8?B?ekg2TWFEdE1LVDVEZy8wNFVCWE42aGFhRmI2ejJwTnJXNDlLT0t4VWtqcEps?=
 =?utf-8?B?RVE1NlA4TUs2YmptSVlET0tVTGtEOW4wNk0zbHhIQkV6anhzTE9MU3JvK1Nl?=
 =?utf-8?B?YUpHejhFR1RVR1FKdkd5T2MrWVdzN3MxdEUwbVBtTHpDQlo4bm5vR1lWR2xV?=
 =?utf-8?B?cXZGbFJBd0txbVNvMXRPaWpFQVdncDdMNGFheVVmbG1iOUhrbjQ2MlFJLzNG?=
 =?utf-8?B?Wno5eTlvRERZWjl6bXd1b0trbGhObmlzMVZPdERvYTJTcFB1ODYwUFNsQjFI?=
 =?utf-8?B?Z0JpaVBBM2locmZteXJWT0lyYmFGOWtFSzgvRjJnbDMxYzZtMDNXbUZuOE9K?=
 =?utf-8?B?NVpmM1czYXVXa04xdytnZkxZRDBGSUt3YkNpdytMbnh3alZXN1RiL3hTdzZV?=
 =?utf-8?B?NDBYOCtWd1JMM005aUs3L2NBc0crdXZpdVRnOXpPMnhSeG1XeWQyQUt1OWhP?=
 =?utf-8?B?ZVdMa3FvRm4zNXkvbHpKR0YvR3NqVVlKb3hFOE56RENJYXR5aGFxOHpaTDk1?=
 =?utf-8?B?ZjJzT2ZJWm95RlJ0RlJpbHBBMWpITUpGSE1GSC9DWWJxcHI4bk1CRW5rczBV?=
 =?utf-8?B?ZzVOTUcwNm9DNC9LczFDYnJJakxUR291djJaS0YxeEZMV1pBKzQweTdicUJn?=
 =?utf-8?B?TzBOTXdOL2Q5aUFCTWh4T0x2ZG5iY2RoRlJJQTRjaWh1QlZ1dWhjTE1kSnZi?=
 =?utf-8?B?cjFjNmZpMTBWSndJcitXbDFVOWVqeE4xWE1PUlBSNFRmN05mS1MzY1prMGt3?=
 =?utf-8?B?V1VhNUJkRVR2ZkpCQld3MTkrT3d0Z1ROdjFZcElHNGFnTVF1Z1p6VU55T25S?=
 =?utf-8?B?U3NrdTZuOTd2ZUNMcEhVTUxvZ1Jpb0YrRU5lTzNoWkphVUpYTDhMck9vRW9S?=
 =?utf-8?Q?Bom2BgRxedfhpuvf0HNFx26Lf?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c2bdbf1b-70f7-4e76-38f3-08dba308fc10
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB6000.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2023 12:11:59.2317 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hJdJ4UkraLQnBwlhQ/XXf6PCkJkz/vOokzqr/8c1Kz605ASFN/TQFIIcwFoxg5Iue7wKr9eFOc80PK/ZyDNsRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6941
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

Hi Lijo,

The *_set function will set the GPU power profile and the *_put function 
will  schedule the
smu_delayed_work task after 100ms delay. This smu_delayed_work task will 
clear a GPU
power profile if any new jobs are not scheduled within 100 ms. But if 
any new job  comes within 100ms
then the *_workload_profile_set function  will cancel this work and set 
the GPU power profile based on
preferences.

Please see the below case.

case 1 - only same profile jobs run. It will take 100ms to clear the 
profile once all jobs complete.

                                            wl = VIDEO <100ms>
workload     _________|`````````````````````````````````````|____

Jobs (VIDEO) ________|```|__|```|___|````|___________


Case2 - two jobs of two different profile. job1 profile will be set but 
when job2 will arrive it will be moved
         to higher profile.

                                  wl = VIDEO  ->    wl = COMPUTE         
   <100ms>
workload 
___|``````````````````````````````````````````````````````````````````|____

Jobs (VIDEO) ___|```|__|```|___|````|___|````|_______

Jobs (COMPUTE) ______________|```|___|````|___|````|_________



Case3 - two jobs of two different profile. job1 profile will be set but 
when job2 will arrive it will not be moved
to lower profile. When compute job2 will complete then only it will move 
to lower profile.

                                              wl = COMPUTE 
->               wl = VIDEO  <100ms>
workload 
_________|``````````````````````````````````````````````````````````````````|____

Jobs (COMPUTE)    ____|```|__|```|___|````|___|````|_______

Jobs (VIDEO) ___________________|```|___|````|___|````|___|````|___________

On 8/22/2023 10:21 AM, Lazar, Lijo wrote:
>
>
> On 8/21/2023 12:17 PM, Arvind Yadav wrote:
>> This patch adds a function which will clear the GPU
>> power profile after job finished.
>>
>> This is how it works:
>> - schedular will set the GPU power profile based on ring_type.
>> - Schedular will clear the GPU Power profile once job finished.
>> - Here, the *_workload_profile_set function will set the GPU
>>    power profile and the *_workload_profile_put function will
>>    schedule the smu_delayed_work task after 100ms delay. This
>>    smu_delayed_work task will clear a GPU power profile if any
>>    new jobs are not scheduled within 100 ms. But if any new job
>>    comes within 100ms then the *_workload_profile_set function
>>    will cancel this work and set the GPU power profile based on
>>    preferences.
>>
>> v2:
>> - Splitting workload_profile_set and workload_profile_put
>>    into two separate patches.
>> - Addressed review comment.
>>
>> Cc: Shashank Sharma <shashank.sharma@amd.com>
>> Cc: Christian Koenig <christian.koenig@amd.com>
>> Cc: Alex Deucher <alexander.deucher@amd.com>
>> Signed-off-by: Arvind Yadav <Arvind.Yadav@amd.com>
>> ---
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_workload.c  | 97 +++++++++++++++++++
>>   drivers/gpu/drm/amd/include/amdgpu_workload.h |  3 +
>>   2 files changed, 100 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_workload.c 
>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_workload.c
>> index e661cc5b3d92..6367eb88a44d 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_workload.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_workload.c
>> @@ -24,6 +24,9 @@
>>     #include "amdgpu.h"
>>   +/* 100 millsecond timeout */
>> +#define SMU_IDLE_TIMEOUT    msecs_to_jiffies(100)
>> +
>>   static enum PP_SMC_POWER_PROFILE
>>   ring_to_power_profile(uint32_t ring_type)
>>   {
>> @@ -59,6 +62,80 @@ amdgpu_power_profile_set(struct amdgpu_device *adev,
>>       return ret;
>>   }
>>   +static int
>> +amdgpu_power_profile_clear(struct amdgpu_device *adev,
>> +               enum PP_SMC_POWER_PROFILE profile)
>> +{
>> +    int ret = amdgpu_dpm_switch_power_profile(adev, profile, false);
>> +
>> +    if (!ret) {
>> +        /* Clear the bit for the submitted workload profile */
>> +        adev->smu_workload.submit_workload_status &= ~(1 << profile);
>> +    }
>> +
>> +    return ret;
>> +}
>> +
>> +static void
>> +amdgpu_power_profile_idle_work_handler(struct work_struct *work)
>> +{
>> +
>> +    struct amdgpu_smu_workload *workload = container_of(work,
>> +                              struct amdgpu_smu_workload,
>> +                              smu_delayed_work.work);
>> +    struct amdgpu_device *adev = workload->adev;
>> +    bool reschedule = false;
>> +    int index  = fls(workload->submit_workload_status);
>> +    int ret;
>> +
>> +    mutex_lock(&workload->workload_lock);
>> +    for (; index > 0; index--) {
>
> Why not use for_each_set_bit?

We are clearing which we have only set it. We will clear first higher 
profile then lower.


>
>> +        int val = atomic_read(&workload->power_profile_ref[index]);
>> +
>> +        if (val) {
>> +            reschedule = true;
>
> Why do you need to do reschedule? For each put(), a schedule is 
> called. If refcount is not zero, that means some other job has already 
> set the profile. It is supposed to call put() and at that time, this 
> job will be run to clear it anyway, right?
>
Yes, I have got the comment for this I am going to remove this.
Noted.

>> +        } else {
>> +            if (workload->submit_workload_status &
>> +                (1 << index)) {
>> +                ret = amdgpu_power_profile_clear(adev, index);
>> +                if (ret) {
>> +                    DRM_WARN("Failed to clear workload %s,error = 
>> %d\n",
>> +                         amdgpu_workload_mode_name[index], ret);
>> +                    goto exit;
>> +                }
>> +            }
>> +        }
>> +    }
>> +    if (reschedule)
>> + schedule_delayed_work(&workload->smu_delayed_work,
>> +                      SMU_IDLE_TIMEOUT);
>> +exit:
>> +    mutex_unlock(&workload->workload_lock);
>> +}
>> +
>> +void amdgpu_workload_profile_put(struct amdgpu_device *adev,
>> +                 uint32_t ring_type)
>> +{
>> +    struct amdgpu_smu_workload *workload = &adev->smu_workload;
>> +    enum PP_SMC_POWER_PROFILE profile = 
>> ring_to_power_profile(ring_type);
>> +
>> +    if (profile == PP_SMC_POWER_PROFILE_BOOTUP_DEFAULT)
>> +        return;
>> +
>> +    mutex_lock(&workload->workload_lock);
>> +
>> +    if (!atomic_read(&workload->power_profile_ref[profile])) {
>> +        DRM_WARN("Power profile %s ref. count error\n",
>> +             amdgpu_workload_mode_name[profile]);
>> +    } else {
>> + atomic_dec(&workload->power_profile_ref[profile]);
>> + schedule_delayed_work(&workload->smu_delayed_work,
>> +                      SMU_IDLE_TIMEOUT);
>> +    }
>> +
>> +    mutex_unlock(&workload->workload_lock);
>> +}
>> +
>>   void amdgpu_workload_profile_set(struct amdgpu_device *adev,
>>                    uint32_t ring_type)
>>   {
>> @@ -70,13 +147,30 @@ void amdgpu_workload_profile_set(struct 
>> amdgpu_device *adev,
>>           return;
>>         mutex_lock(&workload->workload_lock);
>> + cancel_delayed_work_sync(&workload->smu_delayed_work);
>
> This is a potential deadlock. You already hold the mutex and then 
> waiting for idle work to finish. Idle work could now be at the point 
> where it is waiting for the same mutex. Suggest not to call cancel 
> here and let the mutex take care of the sequence.
We cannot cancel if idle work is running. So we have to wait until ideal 
work is complete. If *put function arrived before ideal work is not 
stated then we can cancel it. but if it is running work thread we should 
wait.
>
>>         ret = amdgpu_power_profile_set(adev, profile);
>>       if (ret) {
>>           DRM_WARN("Failed to set workload profile to %s, error = %d\n",
>>                amdgpu_workload_mode_name[profile], ret);
>> +        goto exit;
>> +    }
>> +
>> +    /* Clear the already finished jobs of higher power profile*/
>> +    for (int index = fls(workload->submit_workload_status);
>> +         index > profile; index--) {
>> +        if (!atomic_read(&workload->power_profile_ref[index]) &&
>> +            workload->submit_workload_status & (1 << index)) {
>> +            ret = amdgpu_power_profile_clear(adev, index);
>> +            if (ret) {
>> +                DRM_WARN("Failed to clear workload %s, err = %d\n",
>> +                     amdgpu_workload_mode_name[profile], ret);
>> +                goto exit;
>> +            }
>> +        }
>
> If you follow the earlier comment, that will keep this logic only at 
> one place - i.e, at idle work handler. Basically just let the idle 
> work handle its duty. If some job starts running during the clear 
> call, it's just unfortunate timing and let the next set() take the 
> lock and request profile again.

So basically for every millisecond  new jobs are coming and completing 
it to the same or different profile . Suppose we are running higher 
profile jobs and  before it completes if a lower job arrives, this check 
will help to move the higher profile to lower profile once higher 
profile finishes it. If we are not checking here then it will stuck on 
higher profile until then other jobs will also not complete. Please 
refer case3 scenario.


> Thanks,
> Lijo
>
>>       }
>>   +exit:
>>       mutex_unlock(&workload->workload_lock);
>>   }
>>   @@ -87,6 +181,8 @@ void amdgpu_workload_profile_init(struct 
>> amdgpu_device *adev)
>>       adev->smu_workload.initialized = true;
>>         mutex_init(&adev->smu_workload.workload_lock);
>> + INIT_DELAYED_WORK(&adev->smu_workload.smu_delayed_work,
>> +              amdgpu_power_profile_idle_work_handler);
>>   }
>>     void amdgpu_workload_profile_fini(struct amdgpu_device *adev)
>> @@ -94,6 +190,7 @@ void amdgpu_workload_profile_fini(struct 
>> amdgpu_device *adev)
>>       if (!adev->smu_workload.initialized)
>>           return;
>>   + cancel_delayed_work_sync(&adev->smu_workload.smu_delayed_work);
>>       adev->smu_workload.submit_workload_status = 0;
>>       adev->smu_workload.initialized = false;
>>       mutex_destroy(&adev->smu_workload.workload_lock);
>> diff --git a/drivers/gpu/drm/amd/include/amdgpu_workload.h 
>> b/drivers/gpu/drm/amd/include/amdgpu_workload.h
>> index 5022f28fc2f9..ee1f87257f2d 100644
>> --- a/drivers/gpu/drm/amd/include/amdgpu_workload.h
>> +++ b/drivers/gpu/drm/amd/include/amdgpu_workload.h
>> @@ -46,6 +46,9 @@ static const char * const 
>> amdgpu_workload_mode_name[] = {
>>       "Window3D"
>>   };
>>   +void amdgpu_workload_profile_put(struct amdgpu_device *adev,
>> +                 uint32_t ring_type);
>> +
>>   void amdgpu_workload_profile_set(struct amdgpu_device *adev,
>>                    uint32_t ring_type);
