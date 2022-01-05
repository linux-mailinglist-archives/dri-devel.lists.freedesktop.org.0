Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF1A648538E
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jan 2022 14:27:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1E9210EDBE;
	Wed,  5 Jan 2022 13:26:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2062.outbound.protection.outlook.com [40.107.93.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5B3210EDBD;
 Wed,  5 Jan 2022 13:26:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kdeq/V4sVna20x9JMNb35NyD6S3OojpU2yRaQYodpnDOjQlwfcpUrOgIm1tlIRMTO+YtpjTOeZ4l6+xVkZSqX8hGeaOGVwjd0y1fV7Ws77/11kjV4S6Xrek5hPyPCBUtEIxurUgkrcAf2Oh03ZQEhPc61mvFakzwCtEpRZEnM8NcGJSj1ezecL8/GOfV6R9CVnbcQvGGxIb+3BT2BpplJqmchKdnc29gcgxixa/Ul/EBm64ULnBYktUENy61lBUilmCMiRb7SqsMt6KIvJ5250nDjrbxlXQbN4BzcZZSDSgxl40cVfV6r6X0KbPOW5QIaDz1KZvIp+3pPkYDGEEyGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dej8gQMzjcCLdnQEM5k+bYng3ZVdk5tZar5aMqneO8M=;
 b=i137bptxbAFJ5V8x6Ev6+HLFTFO/dfXaA4Dx2geegaa/1qKqinFjf+03pnijiQ5r1QPx4Bp416h+2AeR9snvAE8h5PxeH1qqTGnVHWjksB6VaJAe3swqO2IL5o5R4CNrg9XDbnScOKeZoNMwtG9U8JGMjZfFox/EUNUUtRglU4x7eMlmqmhvRtO1YwDr0LOwmRBlkv5Jc/WZLBq3K6H892SQyOIj2lvyiHcCHjHY3l4skPWNcVvzah1Qdyvj/GPa56FKa/58Q12wVL7GfxvlCigU4lixSY4Pmn7ZI3NRa2FwMQSUTE7tsK7wjgigpNNXP2MroXbKMjYHJBjNPJGTGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dej8gQMzjcCLdnQEM5k+bYng3ZVdk5tZar5aMqneO8M=;
 b=pvLr4R2tuaRPs4Av2h3TpMvz45EFVg8O/3T0qPOIxL95hgn3OFKGvN08AO8/NStO7AyVw892qiMFpajXh/AOy7jVylwX4NEgIoVw4A4jhdVkaKr+TuOf0fWJZGwqMU4/fKFZa3OC7J9W3HmnvXagAf+UTSDfGHnpuR4gHBnDYIg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BYAPR12MB4614.namprd12.prod.outlook.com (2603:10b6:a03:a6::22)
 by BY5PR12MB4180.namprd12.prod.outlook.com (2603:10b6:a03:213::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.7; Wed, 5 Jan
 2022 13:26:54 +0000
Received: from BYAPR12MB4614.namprd12.prod.outlook.com
 ([fe80::f58c:40b7:85a:45c2]) by BYAPR12MB4614.namprd12.prod.outlook.com
 ([fe80::f58c:40b7:85a:45c2%5]) with mapi id 15.20.4844.017; Wed, 5 Jan 2022
 13:26:54 +0000
Message-ID: <6f64e1d2-eec5-04da-2497-9ee2e7dfcf12@amd.com>
Date: Wed, 5 Jan 2022 18:56:40 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [RFC v2 4/8] drm/amdgpu: Serialize non TDR gpu recovery with TDRs
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
References: <20211222220506.789133-1-andrey.grodzovsky@amd.com>
 <20211222220506.789133-5-andrey.grodzovsky@amd.com>
 <639bd7c3-e946-65eb-afae-dd619f6429d6@amd.com>
 <9dc55576-19b1-d5e3-f4da-eede4db8b289@amd.com>
 <55065993-0e8d-30a5-b08f-733e5ba360b1@amd.com>
 <6be71531-40f1-fcad-f54c-03f6e14064f9@amd.com>
From: "Lazar, Lijo" <lijo.lazar@amd.com>
In-Reply-To: <6be71531-40f1-fcad-f54c-03f6e14064f9@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BM1PR0101CA0038.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:1a::24) To BYAPR12MB4614.namprd12.prod.outlook.com
 (2603:10b6:a03:a6::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c5049274-5520-4314-bace-08d9d04f0a38
X-MS-TrafficTypeDiagnostic: BY5PR12MB4180:EE_
X-Microsoft-Antispam-PRVS: <BY5PR12MB418077BD1997850B582E9F4C974B9@BY5PR12MB4180.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: R0UP8fXKEF/avrR532F3G1k4O8ChiOH+ygyPLjSWd3Zb/oo8f8Ls1/v60b1LQLOE/l/eArXpXq6li+S+t+qaVKPtcS03eGDk1NNFDr/rMlOMb5ajfV14zeooi11QlddH7dHVptmkeQjXyXvN+ecg0T9Menl9jCFzWpr/5buSJQCJG06g8UHukt1GiQ2wuvjVDToJOmvA4XU1MtGUsgJHxCK6TAMgTV7veuqzt5sp1K+w500LDU5WsgsxjeY7fS3LaH0vLTUYqYwEOMNSJdmaQYMRlHv/7tzC66Zb/Nf/XYZ7ZB9ux/HCoDFIznk05i7ApcIPonX1QNcgTxhGgLDF6SV4MadG6h9S+j/a/yrLClFMtylOgEoKZkdi3mkawvQL/L78RCeTi4A/WrUnSHjUfgf77fYBP79p1SGEJsMa333GmHv00YwI2D2R0GVvLcLvKS1qAPQudwhwBNOZ87cmZs+z7mnijLdYiPMpS+nDxG0X3XzN4cVyT5Fr/T9gaIRdiAcIyolG3fmC3WTbJ7tNbATGPstyYL1h6k9E/m/NmrCFljNprSwJZkjxVjVi5ScSKU0UyJmGlqixWJ34HhvtRkLRCzYMyqDgTV7Cbs/m1heU4yMgf+o+DAlIYV+40onfn2hqBwiVo04eGfvzBAOpKCiK8hv7z2SlzfabngzsSW3Yk0K5nIg5e+c3RceyU0Nyf99TMGplTjFA0kEAAk8lxz7PbiiMZvJmVVU0AaKuPa2xTQ3d1gx3ow5IXwinGCf8
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB4614.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(2616005)(36756003)(6486002)(31696002)(5660300002)(8676002)(26005)(508600001)(53546011)(186003)(6506007)(31686004)(110136005)(86362001)(8936002)(2906002)(6666004)(4326008)(83380400001)(6512007)(66556008)(66476007)(66946007)(316002)(66574015)(38100700002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZVI2UnBueXhpNE9kcWprVzE4RlZjcGlzVFpGd0lUS3NrYzltVUZtMGNWRUhn?=
 =?utf-8?B?cVM2Z1RkMzBiUFBMMjB6eGJuOHV1MFc2TlVVZDJWL3UyWXAzY2sraS94ZTJC?=
 =?utf-8?B?eWRPT3FhUG9YN3JXU3o0anRVTzErU3BzZG1xRDBUd3VBZTNpcVB4VDQrczR5?=
 =?utf-8?B?KzU0QXBXWkYrUklYV0s3dGtkREl3bVMyL29rWTdsaHQ3ZzFnazFweHEwd0NT?=
 =?utf-8?B?c2dzVE5aTXBncEYyd0pON1hTVlF6d0VQS09CcFVYMy9qa3JIZnF1QU14cVc5?=
 =?utf-8?B?TkExODZiWXE1WmFMNkVOU2pKL3llMVhCbnVCbUhJam9rLzRvNlhraXY4YUNo?=
 =?utf-8?B?YWs5RUo5Q1MyTDV5MGpoN1JMRFFvMTliOWlLVE9YRy9CdW9TdzhKT09taml3?=
 =?utf-8?B?RUlMaE1PSlN4L3FucG1oVDloQjdqOEI0Tk5ZdnJoeGJseTdiVXhuTUZ2SzBH?=
 =?utf-8?B?T0dHK3hFWnNhNUVJb3NsZjdlUzArTVBLK25YdCtHc0NpdDhhcEFtenZ2QUY1?=
 =?utf-8?B?Qjhyd28rNE5FMkZxUTJJOHNHZSt3TWlnaVFoaDJvSC9EaWRSbEs5aGZwVTRG?=
 =?utf-8?B?dmZ2S3Q4ZmtZZ3BtZThsdnQ5OEUvVVhpSTZuNCtVQVIxUjl1ckt1SlA2czNP?=
 =?utf-8?B?bDRVUk9IMisxZXRVN3FabmFOOGkzTTdJQjBvMndCSHRZQm5FUU9iMUFTU0du?=
 =?utf-8?B?VlpuTUZpWmdseE1qOGNJYXdYV0JsS0dOcjVsUWZXQU9nTU9oanRpNFNQQnFK?=
 =?utf-8?B?ZGVXbm1jT0puREt5SGs2b0k2WnNqdmxPUTVTQ1FCRVdpTUtGaHZqM0tPSnFm?=
 =?utf-8?B?VTVaK1NDWnZQbzFBTFpxZ1Fuend2empMcHJzTUY1VU9rQjYvZWY0Y1RObEp6?=
 =?utf-8?B?WnZRYk9pNmdBeVg0Wm1UQllIMWFGWHdRbFArdzRHN2xJWm9xb2xjaHdhQXpN?=
 =?utf-8?B?bzBRWElmT3dQaDNlU1hNRGY1eTQxMHhQcXRjaUtQWGlkRmFFUkFjUjJsa3Fk?=
 =?utf-8?B?NTF4RXFsWHZaeVppNG9uRWUzZHNpTVcxTkF5N3plVDBZdFc3SHJyOStsWUtt?=
 =?utf-8?B?QkJtVzJVQWQzdHNpTHpTSU1YV3B3Ymp0aHZnVm41dXd2cUY1Q0c4eTJCVkp1?=
 =?utf-8?B?T3locnJVdGZtY1NFcTM0dUVrdlFIaWNZYlVuc2Q0c1ZpQU4waUhLdVA2WHkr?=
 =?utf-8?B?R25saE43ZmthaENxNGd5ZjRrUWlKQWg4b0ZPUEdZQld6aFZVTVpUSFM3QXd1?=
 =?utf-8?B?RzN2blQyUjYwZkRVaFBzN2ZhOC8rR2hPUkFnektUQVFvSnNGeU9KWS95SDBp?=
 =?utf-8?B?VXpmUk1aakVvVHY5SjRpNHJJVExMaTUyUVVTVm52bDdBN3BwTk5LN3BGbklo?=
 =?utf-8?B?QmFoUlRZelJkcHdOZUdiMmsvUDd4WTJFRXdSeklBNXI0UXAwQjlRVi9wMjRD?=
 =?utf-8?B?ZTVtb1VGYXVWYVg5NXVPVUprTk8xMTdVblcraVRwUHZvVzV5TmNwTlY1QVdv?=
 =?utf-8?B?RmtDNmRuSVZWNjNEQnZKZExNN2ZRaXlWZ1JWUzljbzBENDZkV0tmSk9Nc2M0?=
 =?utf-8?B?TnhON1ZjOGYvckl4RUZzTkhnUThxZDdmYTBETE83UEt1cTB0SHY5N2lVYzJE?=
 =?utf-8?B?dnZoNy92ckNQbnIwc0hoQnBxSUVOTVowOTBBeENaUTlLVUFPdGJmMjBubnlo?=
 =?utf-8?B?RlpZQXo5UXdaM2ovTFV1MlNIS2p3U1NPcjg5YzBVTHU3ZjErVGJBWVJ2Q251?=
 =?utf-8?B?bWN5ZGpZZGg4dUtLVG9RcnZGR1NPV2hhSzF6K3NTeHp3WjlqSmFFUmVyeXh0?=
 =?utf-8?B?azZIczJsNEhRZDl1N256V3p5M3F5Mm8zNU1BLzAyQnJtTlVsczhvOXd1NDlp?=
 =?utf-8?B?b0xzQmRsTmRRazh1WUdCNGk4c1lHQndpWGNobWVPM3VyQTNwak1jdjFQV1pO?=
 =?utf-8?B?OStmTk1vS3U0clRrenN3WmlpT0h1UFE1MDhqOTdMbHcvM3hlbWJUMi9NVndK?=
 =?utf-8?B?d3V2Zm5PNGc5T3Q3RWpwRC81dTlVZ3VoL2p5WkVEUUgyN1ZIWkJnNjlBVWQw?=
 =?utf-8?B?YTRTMGNxYy9qWmxKUEZhaDI4S1lKOXVMc2s3T0o1VXExV01zbkJrYWFSN01x?=
 =?utf-8?Q?WGA0=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c5049274-5520-4314-bace-08d9d04f0a38
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4614.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2022 13:26:54.5400 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QlsoRjAaQPVq/6xFaeHLgsfwmct/oC9REbzjNiFdbGJx0+VnLaVY1ufRWhtU9PqC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4180
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
Cc: horace.chen@amd.com, Monk.Liu@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 1/5/2022 6:45 PM, Christian König wrote:
> Am 05.01.22 um 14:11 schrieb Lazar, Lijo:
>> On 1/5/2022 6:01 PM, Christian König wrote:
>>> Am 05.01.22 um 10:54 schrieb Lazar, Lijo:
>>>> On 12/23/2021 3:35 AM, Andrey Grodzovsky wrote:
>>>>> Use reset domain wq also for non TDR gpu recovery trigers
>>>>> such as sysfs and RAS. We must serialize all possible
>>>>> GPU recoveries to gurantee no concurrency there.
>>>>> For TDR call the original recovery function directly since
>>>>> it's already executed from within the wq. For others just
>>>>> use a wrapper to qeueue work and wait on it to finish.
>>>>>
>>>>> v2: Rename to amdgpu_recover_work_struct
>>>>>
>>>>> Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
>>>>> ---
>>>>>   drivers/gpu/drm/amd/amdgpu/amdgpu.h        |  2 ++
>>>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 33 
>>>>> +++++++++++++++++++++-
>>>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_job.c    |  2 +-
>>>>>   3 files changed, 35 insertions(+), 2 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h 
>>>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
>>>>> index b5ff76aae7e0..8e96b9a14452 100644
>>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
>>>>> @@ -1296,6 +1296,8 @@ bool amdgpu_device_has_job_running(struct 
>>>>> amdgpu_device *adev);
>>>>>   bool amdgpu_device_should_recover_gpu(struct amdgpu_device *adev);
>>>>>   int amdgpu_device_gpu_recover(struct amdgpu_device *adev,
>>>>>                     struct amdgpu_job* job);
>>>>> +int amdgpu_device_gpu_recover_imp(struct amdgpu_device *adev,
>>>>> +                  struct amdgpu_job *job);
>>>>>   void amdgpu_device_pci_config_reset(struct amdgpu_device *adev);
>>>>>   int amdgpu_device_pci_reset(struct amdgpu_device *adev);
>>>>>   bool amdgpu_device_need_post(struct amdgpu_device *adev);
>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c 
>>>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>>>> index 7c063fd37389..258ec3c0b2af 100644
>>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>>>> @@ -4979,7 +4979,7 @@ static void amdgpu_device_recheck_guilty_jobs(
>>>>>    * Returns 0 for success or an error on failure.
>>>>>    */
>>>>>   -int amdgpu_device_gpu_recover(struct amdgpu_device *adev,
>>>>> +int amdgpu_device_gpu_recover_imp(struct amdgpu_device *adev,
>>>>>                     struct amdgpu_job *job)
>>>>>   {
>>>>>       struct list_head device_list, *device_list_handle = NULL;
>>>>> @@ -5237,6 +5237,37 @@ int amdgpu_device_gpu_recover(struct 
>>>>> amdgpu_device *adev,
>>>>>       return r;
>>>>>   }
>>>>>   +struct amdgpu_recover_work_struct {
>>>>> +    struct work_struct base;
>>>>> +    struct amdgpu_device *adev;
>>>>> +    struct amdgpu_job *job;
>>>>> +    int ret;
>>>>> +};
>>>>> +
>>>>> +static void amdgpu_device_queue_gpu_recover_work(struct 
>>>>> work_struct *work)
>>>>> +{
>>>>> +    struct amdgpu_recover_work_struct *recover_work = 
>>>>> container_of(work, struct amdgpu_recover_work_struct, base);
>>>>> +
>>>>> +    recover_work->ret = 
>>>>> amdgpu_device_gpu_recover_imp(recover_work->adev, recover_work->job);
>>>>> +}
>>>>> +/*
>>>>> + * Serialize gpu recover into reset domain single threaded wq
>>>>> + */
>>>>> +int amdgpu_device_gpu_recover(struct amdgpu_device *adev,
>>>>> +                    struct amdgpu_job *job)
>>>>> +{
>>>>> +    struct amdgpu_recover_work_struct work = {.adev = adev, .job = 
>>>>> job};
>>>>> +
>>>>> +    INIT_WORK(&work.base, amdgpu_device_queue_gpu_recover_work);
>>>>> +
>>>>> +    if (!queue_work(adev->reset_domain.wq, &work.base))
>>>>> +        return -EAGAIN;
>>>>> +
>>>>
>>>> The decision to schedule a reset is made at this point. Subsequent 
>>>> accesses to hardware may not be reliable. So should the flag 
>>>> in_reset be set here itself rather than waiting for the work to 
>>>> start execution?
>>>
>>> No, when we race and lose the VM is completely lost and probably 
>>> restarted by the hypervisor.
>>>
>>> And when we race and win we properly set the flag before signaling 
>>> the hypervisor that it can continue with the reset.
>>>
>>
>> I was talking about baremetal case. When this was synchronous, 
>> in_reset flag is set as one of the first things and amdgpu_in_reset is 
>> checked to prevent further hardware accesses. This design only changes 
>> the recover part and doesn't change the hardware perspective. 
> 
>> Potential accesses from other processes need to be blocked as soon as 
>> we determine a reset is required.
> 
> That's an incorrect assumption.
> 
> Accessing the hardware is perfectly ok as long as the reset hasn't 
> started yet. In other words even when the hardware is locked up you can 
> still happily read/write registers or access the VRAM BAR.
> 

Not sure if that is 100% correct like a recovery triggered by RAS error 
(depends on the access done).

Thanks,
Lijo

> Only when the hardware is currently performing a reset, then we can't 
> touch it or there might be unfortunate consequences (usually complete 
> system lockup).
> 
> Regards,
> Christian.
> 
>> Are we expecting the work to be immediately executed and set the flags?
>>
>> Thanks,
>> Lijo
>>
>>>> Also, what about having the reset_active or in_reset flag in the 
>>>> reset_domain itself?
>>>
>>> Of hand that sounds like a good idea.
>>>
>>> Regards,
>>> Christian.
>>>
>>>>
>>>> Thanks,
>>>> Lijo
>>>>
>>>>> +    flush_work(&work.base);
>>>>> +
>>>>> +    return work.ret;
>>>>> +}
>>>>> +
>>>>>   /**
>>>>>    * amdgpu_device_get_pcie_info - fence pcie info about the PCIE slot
>>>>>    *
>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c 
>>>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
>>>>> index bfc47bea23db..38c9fd7b7ad4 100644
>>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
>>>>> @@ -63,7 +63,7 @@ static enum drm_gpu_sched_stat 
>>>>> amdgpu_job_timedout(struct drm_sched_job *s_job)
>>>>>             ti.process_name, ti.tgid, ti.task_name, ti.pid);
>>>>>         if (amdgpu_device_should_recover_gpu(ring->adev)) {
>>>>> -        amdgpu_device_gpu_recover(ring->adev, job);
>>>>> +        amdgpu_device_gpu_recover_imp(ring->adev, job);
>>>>>       } else {
>>>>>           drm_sched_suspend_timeout(&ring->sched);
>>>>>           if (amdgpu_sriov_vf(adev))
>>>>>
>>>
> 
