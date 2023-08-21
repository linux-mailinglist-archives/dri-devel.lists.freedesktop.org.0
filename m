Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 28DB7782C2B
	for <lists+dri-devel@lfdr.de>; Mon, 21 Aug 2023 16:41:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A1DA10E0EE;
	Mon, 21 Aug 2023 14:41:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2045.outbound.protection.outlook.com [40.107.237.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E60E10E0EE;
 Mon, 21 Aug 2023 14:41:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W8EnE5p7ZfVLvu8Tb8eiZXofc9nBWCRxKe8PQ4fmx1lXoevz3M5TsyANBiVkFKnwXv2tEB1CtSrC/teM+R04FyFL9g62Qi+i/9crv9qwJU16vMmduAyamJmpr609gS3lLegAyMJMlh1VnTjBhq7bcWScYDJ6ULy00TVhYtIv0zW8PHcwvrjgNLzrWl0o7vWOIjly8D5AlD/LUgu278mQFMHzG6Ns1qhaFwQIlGUtM+J/mH/08ji9gg/DOIIUPuP//xEeFO+2+9OdnCnPyaU34YDOhTolC95xeZtyPVoHSh6gwMC7t6DoeXLEvkzUJ6g8CMN8eajln6vSTKHeQu8R5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nGJMCB8Afgu5j6Oby4n3YMBGfpWyWB8nNIBVMRmMknI=;
 b=PMedYVt7tbHfQSS1cSIYvlxtoByZy29y1k747eQZtW0Z2ad2Q2BiZ8u9AkiejN+elP1RZjA4NbPtkZ62wM0Al7bgrWGPG3pyU511hrIrMk42rOic9+K79NVGAUY0rg1zlFGaEa3dBnXk142SdI7a0JGDppTOUQMf0BTgafuxL2cH9jNx/QVSjmBV7RFCEncHbw6ZdyWhP0FF3WKwHEXgXxR7EXHQTBLOwOzWdzlKRKklB9CchT1j4IxcdlFf4PoYsmh4UY0KW0z0Iqn+n2lIz4bhZNLEOpacK3lblDgQtXvz09fmXP70rMoyF8p+Npd5biAl/eIFhxnfThXV9s7wDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nGJMCB8Afgu5j6Oby4n3YMBGfpWyWB8nNIBVMRmMknI=;
 b=VqK8BVqUYBYF4oJ2QzvzVwxJ4pFGWMZO/k+vscC9TTLCY0j4iJwNWSR75lpFH9LPtBjqrFVPdgRotgsF1fUQ88uJl419PkP6CkBdGgqsbDI3EET6tarMGi0r7uU2u1KOKLUvfNBkgMnCzhNRgkJSpORR99MrzYkwHGTsfeojNC4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB6000.namprd12.prod.outlook.com (2603:10b6:510:1dc::15)
 by MN2PR12MB4285.namprd12.prod.outlook.com (2603:10b6:208:1d7::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.24; Mon, 21 Aug
 2023 14:41:00 +0000
Received: from PH7PR12MB6000.namprd12.prod.outlook.com
 ([fe80::f78e:33f4:56d2:1ef4]) by PH7PR12MB6000.namprd12.prod.outlook.com
 ([fe80::f78e:33f4:56d2:1ef4%7]) with mapi id 15.20.6699.020; Mon, 21 Aug 2023
 14:41:00 +0000
Message-ID: <0b42f0ed-d737-cda6-f78c-25b876560028@amd.com>
Date: Mon, 21 Aug 2023 20:10:46 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 3/7] drm/amdgpu: Add new function to put GPU power
 profile
Content-Language: en-US
To: Shashank Sharma <shashank.sharma@amd.com>,
 Arvind Yadav <Arvind.Yadav@amd.com>, Christian.Koenig@amd.com,
 alexander.deucher@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch, Felix.Kuehling@amd.com, amd-gfx@lists.freedesktop.org
References: <20230821064759.94223-1-Arvind.Yadav@amd.com>
 <20230821064759.94223-4-Arvind.Yadav@amd.com>
 <6e41f148-ac5c-bdcd-21e1-ea3d3c9f06e7@amd.com>
From: "Yadav, Arvind" <arvyadav@amd.com>
In-Reply-To: <6e41f148-ac5c-bdcd-21e1-ea3d3c9f06e7@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0140.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:6::25) To PH7PR12MB6000.namprd12.prod.outlook.com
 (2603:10b6:510:1dc::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB6000:EE_|MN2PR12MB4285:EE_
X-MS-Office365-Filtering-Correlation-Id: fcdd9200-f29d-418f-ee50-08dba254a2c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5UNlBr9vpYsgxR4Un2LXFe1m/8kBpc5BbmcxWwPGU0uaSX9Cx/XXlsaPaDcA4NJvezAp2shrd4DiOxn7z4V/yqXUMl9gRdiUWhb3fFEVSUFcSLUGsh3LoDSzInQNniwQFinwdBMr94KGxjOlGwwOFgOeHTaLIHlGt9lm9HX5l6eD2pCgqPkfp9mmnt++GgXvonbl9ZlGAcR1XbB6kb9avN88fnTNPTtta0fIEXZB+Hn4Gj98YvXO6z+gbyQnCA6WZPWhO+jHgwMyYKZYBtGVM/dDbDpW1HyIF0q+ZMGPxKxSizXBisPlcZHTfsPxCGLmomO0jnxEWlM5C3H5SdJMiUaYOCJrotDxFE+DKjPkpdGScOov2/L/924hgFc5SlHZXN2mPCG27a5SVVIZ7zGhcKRZdWpCVX3IGqZLHfrVQktTbfDz5Zo0DMA4uIGF8Q0QaDMRqxtnesSIfTmEOLA+oJzMpud4CcvKiVnwOtP09CmloKSoXEq1JxpcmKprC88c6h0u6RSLMXa6HQcm5aSIualt0lGhemmolWD3GU/tI1EzbmwO2hqvqB9i0z/ZzvvCQ4da2RGa01nZ8djbL4n6SqLgkiJz2iM+AQhoFCD9Gb4cXZvvsTxXO9MWg9hhq3Wu3XW8WM5SXO+NrOyurjRC9A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB6000.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(396003)(39860400002)(376002)(366004)(346002)(186009)(1800799009)(451199024)(66556008)(66946007)(66476007)(316002)(6512007)(110136005)(8936002)(8676002)(2616005)(4326008)(41300700001)(36756003)(478600001)(6666004)(38100700002)(53546011)(6506007)(6486002)(2906002)(83380400001)(31696002)(31686004)(5660300002)(26005)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YTB3aUhRLzFaTitDaHVCY3NEVjJqYURwWDFmVWcyMzRjdElzb29YVFdUVVJN?=
 =?utf-8?B?WDRka1loMisxOTRiSEhiSFVnUWs1dFVhT0c2Q0IwUEZsMm0zNWM0NHhaMk5r?=
 =?utf-8?B?dlR0VDhLS21tbnhCVHlWWHpSbmZhbDNFdWVPNTY1SXhUaU1sWW5yV3ppSG1Y?=
 =?utf-8?B?K0ZVQmhTcXFhUUkxMm1sSXg4RGNjNCtrM3NGV21hZzZxemJXa3JpQVNOeGx0?=
 =?utf-8?B?WFhWbTlhaEROOXNBaUdMb0d1L0ZXK01pbFFVUldHSVVXbHgwR0NRN2lUOGVo?=
 =?utf-8?B?SzdGUk5KT2hwUVNSV3pmckl2V2VxRmtUelN0Q2FkTzdtbzAzdHNUNzdxemRU?=
 =?utf-8?B?cGtJT0tENzN0Y3dpTHJ6S0hYandBdG9NWGdUMWQyQnV4VExBYysxeXZRdW41?=
 =?utf-8?B?eTNiYzNKRHFjSWhLRktrYUlTSUpoWlFKTmt5aHNEZ3hENE1kMFgwQnBkRzhh?=
 =?utf-8?B?QjhHQWNhS1Raak5ocTE2TE9tSUNHd3BTZEJtWlNVM0tCeVllUksyRXZYbFor?=
 =?utf-8?B?d2l5akl2WERSK0ZFY3pFQW1WVjJmMFJDTC8rMkFlbE16ZmtObHZDbFVNZDZ6?=
 =?utf-8?B?eXppOERtbm5FOFM5djBmWHRMTFdHczFRTTFMNDVnVXpIV21UTTl0amY3ZzFt?=
 =?utf-8?B?MEVvNTJib3d0cW5sNkZpK0NTNld4b3YycjhsUEZVSGpvWEhCNldSTlBCQmlj?=
 =?utf-8?B?T2owTm9ZYXJiRkx4SUtVNTh2VEZQNnlaODhtYkxYRnhYbHZwd3dGRStRbVN6?=
 =?utf-8?B?UDFrNVE0R01DR2RxMXptcTB0NUpVNUNQVFNvNWRLY1JmcTV4bHB5Wk55VG5K?=
 =?utf-8?B?Um9IU3RDaGx4YitJUjFQaHJzMFdONDdmNWVmTGJ1a2xKcys4OGNJWmcyWC9O?=
 =?utf-8?B?aXpva0VLMFVjZi9jaUtQYmdZa044Ymp6WEI3Y3pBNWpVV0tnbjQ0cGxSQ25T?=
 =?utf-8?B?NEp2Sko1Q2owYkZTWkJJcFpmUEtrMWp0M0RsVWxZbWxpZk5TeTFqNEY0aVBM?=
 =?utf-8?B?K0pxV1Niajd6cEhmbVlGb1J2eENsRU0zUk9teXM4L09EZ0pBckw1a1lsVG5H?=
 =?utf-8?B?U0ZpTmFSZXNlb2t4c2lHODRqUXhTSlk1elpXTlh2dUpCN2FrL2FvalZZd3p4?=
 =?utf-8?B?T1g1VHhhbFNmdWU5MkdBRWo4VXJ0RExyeTVJbThWRDFKdFJCdjdpZk5ycVJZ?=
 =?utf-8?B?YjBUdUF6REpnN3NUR2Q3eUZWWFBRRlNCcjZ4THRwZGJ1V1dpWkNXWXYxZ1dp?=
 =?utf-8?B?RWl6ZDZtVjQ4UDJFZkdvWE1rcGpPWmt6UlZpMU9ibHVkaXR6aXlrekkrcnpz?=
 =?utf-8?B?R1RDY1MwVjRYbUtyWktLNUhjU2pNcFNrdHVSTi84TkZXZTVsWThTSitjVG15?=
 =?utf-8?B?Tk1vbmtQUitrVnY1OU0xT2h4SWV3Q2pUeThSMlhIUUVFTi9mOXcyeXFBb2dR?=
 =?utf-8?B?WldqSzNNektFRSthb0pFSU12akxUOUN0L2JZM1lNOXA0a3BrcDh1cFhhSFB5?=
 =?utf-8?B?dG1SUDhrU1BwRWt5V0V4M0lZZFNxY3c4NGJiM2lnYUhzK1QxbE04RjVMRER3?=
 =?utf-8?B?QTAxRjFUREI4V2dWVmhXczdYSkpHVmUrR1B0MThOWXljTEVlUUpyMWlBdmhH?=
 =?utf-8?B?VW15OUUva1E4UjJYVnZUSDlsQlVCOGRMQ3lVYlk3RTBOYndTYThwSE1jbmQv?=
 =?utf-8?B?TktOb0V2NlloY0FTVHVaRGhyT2FBMCt4cjJHOUdEVHBtOHh4MTZqOWE2Ly9E?=
 =?utf-8?B?cVQ1enAxeWpQU1pWV2JKS3J2cWhzbTFBdU14SExtdDNIaE1uVFh1R2pTdTd3?=
 =?utf-8?B?YXFCSm5MNCtiUy9nMmlhb3hRdVFiZTA2MUtPWUZpa1pwWTZoYXpqVDRycmRV?=
 =?utf-8?B?SWJLSjRYdzdpbG5mMVBMRXpzVTNBaEhyUGwzWksvSXFSUW5Fb0pUQnBsdHNz?=
 =?utf-8?B?N0VXc0twTWpON25IWGw5dFJrQW9CZmZTZW94cC9vQ25JS3ZJaHZFS2tTS1lX?=
 =?utf-8?B?SkdsQnkra1VTcXZCWk1mQWFpMUF5dkVKVnpOVVpQTEowRC8yWTh5ckhDU3dU?=
 =?utf-8?B?dWs0WEJtQzRiRTROU2ZzeVRlb2hRUmg3VEV2Qi9uRDU2TUpHNENoR2pKNngy?=
 =?utf-8?Q?LiGCmHI2GO9StoOCpi/T8oSVd?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fcdd9200-f29d-418f-ee50-08dba254a2c7
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB6000.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2023 14:40:59.9543 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gi3TOWc0OhQxPyDKi3MMHBBgtjLbtVfjaV8RTKU0kApm5EOnIvRkc4rV7hnFSN5CEh2f9ysZPEUzdv8JMW3Axw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4285
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


On 8/21/2023 7:09 PM, Shashank Sharma wrote:
>
> On 21/08/2023 08:47, Arvind Yadav wrote:
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
> We should check validity and range of index here before before using 
> it below.
Noted.
>
>> + mutex_lock(&workload->workload_lock);
>> +    for (; index > 0; index--) {
>> +        int val = atomic_read(&workload->power_profile_ref[index]);
>> +
>> +        if (val) {
>> +            reschedule = true;
>> +        } else {
>> +            if (workload->submit_workload_status &
>> +                (1 << index)) {
>> +                ret = amdgpu_power_profile_clear(adev, index);
>> +                if (ret) {
>> +                    DRM_WARN("Failed to clear workload %s,error = 
>> %d\n",
>> +                         amdgpu_workload_mode_name[index], ret);
>> +                    goto exit;
> instead of exiting, we might wanna continue the loop here, just to 
> check if we are able to reset another profile in the next attempt.
Noted.
>> +                }
>> +            }
>> +        }
>> +    }
> A blank line recommended here.
Noted.
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
> We don't want to schedule this work everytime a power profile is put, 
> but we want to do that only when a power profile ref count reaches 
> '0'. So you might want to check the ref_count, and schedule the work 
> under a if (!ref_count) condition.
Noted.
>
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
>>         ret = amdgpu_power_profile_set(adev, profile);
>>       if (ret) {
>>           DRM_WARN("Failed to set workload profile to %s, error = %d\n",
>>                amdgpu_workload_mode_name[profile], ret);
>> +        goto exit;
>> +    }
>> +
>> +    /* Clear the already finished jobs of higher power profile*/
>
> We are not clearing the jobs here, but their power profiles.
>
> I would recommend a little rework in the comment like "As we cancelled 
> the delayed work, check and clear the pending higher power profiles 
> set by previous jobs which are done now"
>
Noted.
>> +    for (int index = fls(workload->submit_workload_status);
> The index can be initialized above, like the put function for loop.
>> +         index > profile; index--) {
>> +        if (!atomic_read(&workload->power_profile_ref[index]) &&
>> +            workload->submit_workload_status & (1 << index)) {
>> +            ret = amdgpu_power_profile_clear(adev, index);
> After clearing the power profile, we should also clear the respective 
> workload->submit_workload_status bit as well, right ?
We are clearing in submit_workload_status bit in 
amdgpu_power_profile_clear()
>> +            if (ret) {
>> +                DRM_WARN("Failed to clear workload %s, err = %d\n",
>> +                     amdgpu_workload_mode_name[profile], ret);
>> +                goto exit;
>
> Same as previous about continuing the loop.

Noted.

Thank You,
~Arvind

>
> - Shashank
>
>> +            }
>> +        }
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
