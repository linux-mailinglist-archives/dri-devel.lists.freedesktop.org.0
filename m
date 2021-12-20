Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5289347B5D3
	for <lists+dri-devel@lfdr.de>; Mon, 20 Dec 2021 23:17:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0802610E5C9;
	Mon, 20 Dec 2021 22:17:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2056.outbound.protection.outlook.com [40.107.92.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C956F10E5C9;
 Mon, 20 Dec 2021 22:17:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mlMK6tuAy3ODe0IE9RNnyQbXnBo3nac2CK60Ssi8myoDd6ivgnLPEQqDqNUqCxkHZNG8ex/DSMvmlDqVqZApKt0jlCavLh9y7jsJPQjgdgSQ5qWjSgjhb+zrFwnQyua4BqHw8Mmw3bJYnjOz5YswavPPffHvrhJerAkKATsl2k1KzdvQeKn4oRBqXwWAQmH5raTL06sImdXDTD8WnoD7M+fHZsW902OOd3XGroKtwkbTtUphI/BR0OL5WsVUrQVSBkTvTZ3ljrgBQXkubT9ezS0Zfww8EPL06yFMlrpE9tXjIhO+PTlIpxXgYkeqoGsJACg49DYoXzJ4HeqPL57d+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lukRjTf+9XongKRO5o2QKac7mbTg/5WYafsNSnBSo/o=;
 b=eHNSqetJVtmwoWRaN6Dv061X28VBtORsuKjwzsN+QM2Hbs6zHVwuS/d+J7Pa3DewndKQ5BSFiqDSj0kvP/aBn99CJSDQ/OFRhsL5fHMU6JgQKy6GuH7vQhDYGDuNQk6/dIf7thdrN+Pxk+6Gy2pDGrDLTXSlgpPxR+0B+hKHtJAG8Rjr5LNleswEWpxaArII4Al/ppE70iA9OJrpSsUmuVH5NNrqdku+bCTLhlqZ39AYxz949TS33WzXlLWhga3FfYlQq/jZltVY2otJfdNudApDb1WiWg4IpDznEddY8u2jZB1wXr1VFgcUSSoUl1xIhD4XQ/wzK5UOgPl3WDkNgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lukRjTf+9XongKRO5o2QKac7mbTg/5WYafsNSnBSo/o=;
 b=qBNErhALHdrYueq0pxiWv3OG+pDgGlZnLGzcgm3uBQ2V60lHoD+6BQoy4geMUNF684FguLY4ZTESDdBz/pEFp8NHU/GUgWW1zUlYvzr2pQQOeXOKwAufy87pzPaMpjPnV04Y2gzZrRXmR9IzbUZPjoqqCK3+CNu9BX84oUMA0BY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM5PR12MB1947.namprd12.prod.outlook.com (2603:10b6:3:111::23)
 by DM5PR12MB1531.namprd12.prod.outlook.com (2603:10b6:4:f::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4801.20; Mon, 20 Dec 2021 22:17:04 +0000
Received: from DM5PR12MB1947.namprd12.prod.outlook.com
 ([fe80::5573:3d0a:9cfd:f13c]) by DM5PR12MB1947.namprd12.prod.outlook.com
 ([fe80::5573:3d0a:9cfd:f13c%7]) with mapi id 15.20.4801.020; Mon, 20 Dec 2021
 22:17:04 +0000
Subject: Re: [RFC 4/6] drm/amdgpu: Serialize non TDR gpu recovery with TDRs
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
References: <20211217222745.881637-1-andrey.grodzovsky@amd.com>
 <20211217222745.881637-5-andrey.grodzovsky@amd.com>
 <c143e561-d149-6680-0b89-2cda78ea1d51@gmail.com>
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Message-ID: <bfecd7e4-6848-e2ee-4e80-f394403af08d@amd.com>
Date: Mon, 20 Dec 2021 17:17:01 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <c143e561-d149-6680-0b89-2cda78ea1d51@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: MN2PR13CA0002.namprd13.prod.outlook.com
 (2603:10b6:208:160::15) To DM5PR12MB1947.namprd12.prod.outlook.com
 (2603:10b6:3:111::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 167a50ea-b288-4c71-b426-08d9c40673c3
X-MS-TrafficTypeDiagnostic: DM5PR12MB1531:EE_
X-Microsoft-Antispam-PRVS: <DM5PR12MB153113CF3B8CACFF1C3D00B4EA7B9@DM5PR12MB1531.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kS030iEvE43/+rNPcvNuSFLJO18PN+XZMcd72JPA+qDV89FMc87kJav9ChTJC0N1C9ovQXfp4C2msWlWAY/FFGPV6/yLL0/0tnLc6rxvJfZkvTnggrDT7DJ4Ouc1pH5WOpIKEIGHPKlReacyddbiGuv7EM1ZZYj+ZbpCgjMvlVw1JBZ2ffv9bJx0xa6tGXvvpbDAohJQEl91putX3FVDaIUM8VVok9FOy+4sGmZs7gARpzJDyOG64s7F82UGt5igs2TQObyEOOIVc9SiyVb/n8YVMiM9f07W/SUoFeIYCKgPjWVvwjJzvn5IxAYadPLg6K6AJg75x1OVR1rhXCkQe5SFwhzuKiAPkX3jfi7eP6FgNNXMPPP22S+UcvxGDHbXZMQ3GBFs9/QCz4NxUAIhqFk8pe/eewpGGVxz+Ui8D4RkirhG8FSBI5cUHRnflgMEQoRuWnSUUOv2QusWhZyLToIOQw6FDWtxyvzdx2A+a3SSzPS6jTjFgfFiomgGKSeol2DVPaD9/2pmrH/4TcMcXBXCSJ3235BqfcWTspYMYJ76RzdHL6gYt2dx01GATFlAJP76WZGtzyrz1GFCibYLNIg5uXno5ok6Oxvn+AVHX2fQLlJFDub/3Rk+GzOctbmjsFF2s5OS86WvxcLteMPStFd1XLbF4rhQqt1+E7BwAA2i50E7+cDnBmGlVdREePGzC5JO4J4znRDEHy0ZpZs639Vj2Y0QIOljh6X/Cwe90Vg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR12MB1947.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(31696002)(6512007)(4001150100001)(8936002)(66574015)(508600001)(2906002)(5660300002)(83380400001)(2616005)(6666004)(36756003)(316002)(6506007)(8676002)(44832011)(66556008)(38100700002)(186003)(53546011)(4326008)(86362001)(66476007)(66946007)(31686004)(6486002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ODJZalgzTnppSFQ5emp3ZWhobVZxZElzdkVrSTBCK0hJMGZ0NVplTFRuOExy?=
 =?utf-8?B?LzFuc3J4eDhQdWlhd1QxMWcxVzBnUEVrZmZ5STJXdlFBRTdKaWlKaHhFZEVD?=
 =?utf-8?B?MVdPYnBmY3FPbElzaDRIVFpDMUlZUzROc1RnZWpqWkNITkNjQXpvYktMMko4?=
 =?utf-8?B?bktrbWpHUzM3MUpzbXRrT2NiZzZYNEg4bjhGaTkwdWMrUW5CM2Fzekt5ejFv?=
 =?utf-8?B?cCtNaVNzWktzd1ZwckxLYVB2bWdhYnRvNDY4SWt6UzliclNzVXNXclZYT3kz?=
 =?utf-8?B?TTRBVkloZDM3NDN6UEhUbWhmSnNuWkxzOFprNGJFM0kzUGptT1M2aEh1Sm9Y?=
 =?utf-8?B?YjRjdW0xLzl2bDgvNlQ3WjJTQzVjaExlRHlTemtZU1hCa3J5VWRDTjVGNThy?=
 =?utf-8?B?djl2RGlXZjVKcjdIanl5RkN3QktqZlI4Y3RabzVXcmFRNzVlbzlRV3dUMmN1?=
 =?utf-8?B?UDZDeVpEL0FvMHVCcG54b2MxazNGd0pFbit0L3lMWjdwS1lkZy9KcmEvSGpp?=
 =?utf-8?B?VzgwUFBWWW93NWxTV2NuK2NpM01Ea1l4amRndTg1MnVkd0NWQW5GRE9hYXgr?=
 =?utf-8?B?eFFLcGVQWTg4ZXhNZytkbm1jVGtrL3RIMlBBUVF0cS9wWWdrdHc0WkVkMVBK?=
 =?utf-8?B?dmR3UjczYjVuckZpZ2VoZkVXWUJWbzUrNjhiWC9BUWlwTU0vM2xjN3RaREpJ?=
 =?utf-8?B?SG1WWjJ1eW9kNGxZeFdRWW51dnYzMDFyZW1VMjVCckJwampUVGFielArNlJD?=
 =?utf-8?B?MVZmZXJyVThZdDI5dE1lOE1VYTJMbW5GUWpabU14OXI4VmRjUmtqZE93d0tu?=
 =?utf-8?B?NVkxMTdOMDNSSmwyaURjM2FlSUZrY212bU9zRHlNejFJbDJ5SkJ1WGtvb2VR?=
 =?utf-8?B?YnZPUktybS9QNFlVSHBoWVcrR2dpLzU3cUVkaEJQVlZrTHVRUU5UKzYrdVFO?=
 =?utf-8?B?NVVRSEhoOVpTbWRtN3Z0UVNsYnl1aVQxdXBXU3ZXbS84a1kyZlN1K3RaaG9P?=
 =?utf-8?B?S1pLYStmKytLZjJMeXNNLzhxZlJ3RC9Wd1NOQTgvNGR6cm9FT1NCZmUxS0wv?=
 =?utf-8?B?MGR3MG1PWnNMTkRSNnZMQUxITjZKQ2c0SVZrQ0ZSRllZS1RFUXc1THdrRXFv?=
 =?utf-8?B?Z29VRktXR1ovQ1JsMG8yaTNCT2k1SGh5bFRFU1kxZXkvRzF5MUtvTW9RQ1Vv?=
 =?utf-8?B?QkdiL0NONDNNdlJZRjU2V25qWWcwT29ndUplVm1RQ083eDVaakkzZDFXWnpP?=
 =?utf-8?B?UjB4MEhOQng3Wld5UzF0MEdPMlMxZFRqdnBoVzU4d1FsUmJOTEZIU3QveWt4?=
 =?utf-8?B?VEcyZ0tyL01wK2o4RnkvMi9IaENRcnNNRTNUU09oVmRyUW5lNkk0SzAydXo0?=
 =?utf-8?B?WDdOUnlvVDF5K1llZ3FpSnhYd1BsUERaczlJN2wra012ZERGTFhIVDVGajhI?=
 =?utf-8?B?M0tISjFBMlpYMGIzVFp4dXZ5ak1EUFFhR0t2SXQ2QWZHT1dCUjY2d3djQTRI?=
 =?utf-8?B?MGFyeDJJUlhSOHd1ajhQREhwMXZNSndlYnVqaVVSUGQxVlVZeG1HNnZmYzNu?=
 =?utf-8?B?TEpJUnFpdWNoTW5JdTQ1dEpCbVdrcDdFZEZqWDBHNy9Ha3h1WS9xWFpINWI1?=
 =?utf-8?B?SDNtYURHaFlFQjBCa05ySmk5cjdMM0lHOEJ0L0JNSjFVb1F3Q2xKTzNtVnFj?=
 =?utf-8?B?cmttNEdvT0FZUHFyQlRLTTMra0xsRW1CZndIVGg2WDdZU3dwMjBvY3VhYUU0?=
 =?utf-8?B?V1h1UDhiRGRERHFTVHhWRVRqQ3NFczlhelBVRDBXeUlraGZPblFoV2I3aWM1?=
 =?utf-8?B?cXhqL3FlankyTkhqVjFOR1lXdGdxWW9KeEpkM1lWRFY0R2VnK2NLbzJuWFlq?=
 =?utf-8?B?ZmZiMHg0Vk05UkpnUTd6R2EvdUQ5OHBGVmJVSVFUcnZHY2hQQkxFUjc2ODNB?=
 =?utf-8?B?dk8zZTBQUEtTWjhGeTFIeGZTU1pycTU2ZDA4V2xUQXA4czhGcVIvd2xZVWpB?=
 =?utf-8?B?T0hXT1dRVWFzY0lMcDh2eXlFM2M3TjVObm5DR2hhams1S0xzeUN4dmNydG52?=
 =?utf-8?B?WmNkeWZJWjVCWjlveVVnSmM0a0MwSzVrVFJ6cGxZZXpPbHpWL0pGRkltdGhB?=
 =?utf-8?B?dnhXTDhhMEpWTTdsaU1zbzJRdEJUQUF0ODN3eWFCRlBzMndZUnRMaVJQYTEw?=
 =?utf-8?B?dlJYWFBZcFp0S01lLy83eTJEOTFJZklNNUZwMDVpVldMeERIOTJPQW9hQjUz?=
 =?utf-8?Q?0h+6wP8inQPRPXAMIDw6/BntrGI2oUND8Tqk9LV0uk=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 167a50ea-b288-4c71-b426-08d9c40673c3
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB1947.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2021 22:17:04.2251 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5X9UVmo5/+4YiPtV8+BdoiO8W1iyUAWYbnk/YJrL0g+8WF3MPC60TnliFbtFEXiA1ndaDf2+teFYOA7E2ogv6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1531
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
Cc: horace.chen@amd.com, christian.koenig@amd.com, Monk.Liu@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 2021-12-20 2:20 a.m., Christian König wrote:
> Am 17.12.21 um 23:27 schrieb Andrey Grodzovsky:
>> Use reset domain wq also for non TDR gpu recovery trigers
>> such as sysfs and RAS. We must serialize all possible
>> GPU recoveries to gurantee no concurrency there.
>> For TDR call the original recovery function directly since
>> it's already executed from within the wq. For others just
>> use a wrapper to qeueue work and wait on it to finish.
>>
>> Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
>> ---
>>   drivers/gpu/drm/amd/amdgpu/amdgpu.h        |  2 ++
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 33 +++++++++++++++++++++-
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_job.c    |  2 +-
>>   3 files changed, 35 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h 
>> b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
>> index b5ff76aae7e0..8e96b9a14452 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
>> @@ -1296,6 +1296,8 @@ bool amdgpu_device_has_job_running(struct 
>> amdgpu_device *adev);
>>   bool amdgpu_device_should_recover_gpu(struct amdgpu_device *adev);
>>   int amdgpu_device_gpu_recover(struct amdgpu_device *adev,
>>                     struct amdgpu_job* job);
>> +int amdgpu_device_gpu_recover_imp(struct amdgpu_device *adev,
>> +                  struct amdgpu_job *job);
>>   void amdgpu_device_pci_config_reset(struct amdgpu_device *adev);
>>   int amdgpu_device_pci_reset(struct amdgpu_device *adev);
>>   bool amdgpu_device_need_post(struct amdgpu_device *adev);
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c 
>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>> index b595e6d699b5..55cd67b9ede2 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>> @@ -4979,7 +4979,7 @@ static void amdgpu_device_recheck_guilty_jobs(
>>    * Returns 0 for success or an error on failure.
>>    */
>>   -int amdgpu_device_gpu_recover(struct amdgpu_device *adev,
>> +int amdgpu_device_gpu_recover_imp(struct amdgpu_device *adev,
>>                     struct amdgpu_job *job)
>>   {
>>       struct list_head device_list, *device_list_handle =  NULL;
>> @@ -5236,6 +5236,37 @@ int amdgpu_device_gpu_recover(struct 
>> amdgpu_device *adev,
>>       return r;
>>   }
>>   +struct recover_work_struct {
>
> Please add an amdgpu_ prefix to the name.
>
>> +    struct work_struct base;
>> +    struct amdgpu_device *adev;
>> +    struct amdgpu_job *job;
>> +    int ret;
>> +};
>> +
>> +static void amdgpu_device_queue_gpu_recover_work(struct work_struct 
>> *work)
>> +{
>> +    struct recover_work_struct *recover_work = container_of(work, 
>> struct recover_work_struct, base);
>> +
>> +    recover_work->ret = 
>> amdgpu_device_gpu_recover_imp(recover_work->adev, recover_work->job);
>> +}
>> +/*
>> + * Serialize gpu recover into reset domain single threaded wq
>> + */
>> +int amdgpu_device_gpu_recover(struct amdgpu_device *adev,
>> +                    struct amdgpu_job *job)
>> +{
>> +    struct recover_work_struct work = {.adev = adev, .job = job};
>> +
>> +    INIT_WORK(&work.base, amdgpu_device_queue_gpu_recover_work);
>> +
>> +    if (!queue_work(adev->reset_domain.wq, &work.base))
>> +        return -EAGAIN;
>> +
>> +    flush_work(&work.base);
>> +
>> +    return work.ret;
>> +}
>
> Maybe that should be part of the scheduler code? Not really sure, just 
> an idea.


Seems to me that since the reset domain is almost always above a single 
scheduler granularity then it wouldn't feet very well there.

Andrey


>
> Apart from that looks good to me,
> Christian.
>
>> +
>>   /**
>>    * amdgpu_device_get_pcie_info - fence pcie info about the PCIE slot
>>    *
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c 
>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
>> index bfc47bea23db..38c9fd7b7ad4 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
>> @@ -63,7 +63,7 @@ static enum drm_gpu_sched_stat 
>> amdgpu_job_timedout(struct drm_sched_job *s_job)
>>             ti.process_name, ti.tgid, ti.task_name, ti.pid);
>>         if (amdgpu_device_should_recover_gpu(ring->adev)) {
>> -        amdgpu_device_gpu_recover(ring->adev, job);
>> +        amdgpu_device_gpu_recover_imp(ring->adev, job);
>>       } else {
>>           drm_sched_suspend_timeout(&ring->sched);
>>           if (amdgpu_sriov_vf(adev))
>
