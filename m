Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CF6E4857FB
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jan 2022 19:11:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65AD510E424;
	Wed,  5 Jan 2022 18:11:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam08on2089.outbound.protection.outlook.com [40.107.100.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6FAA10E424;
 Wed,  5 Jan 2022 18:11:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DYI36fpcXTcbKXbgGEMSOEVCK560fVC6QnU7VTRylNZMY85J7v8Fnu+JMB0p7LCkPUUivzqfBsxNY8REnFWHaHB15DhDhMuMWpltc1J+q7Xmn5hd8DR66GSdVvgJw3BqnJMeSEypKqXIU+QqNBC8k4jl5xhT3BuZ/ldkuICji7liVpdGWPVM3/Zw2HSBsG0qd06U/oK834yrw8VXZYWnQ4lLNTMOzn69uKiome8DsA/VZUdfU4mmJkIg9ipoRcWuCal0sgW2nCeuEv4DT1chbamf/X/L6jkZW1sjDSkYe9wStKP8UzFQb0ZkGQKNzyf0o52zFdLoa5or+DoqY19PoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RidJJLGanBjoc4PqDgwdIEk9S3okjQnm5zomYMtFvo0=;
 b=S64GK+m0MbPJxrIkQBatPAfk8VJ+8kOD1Oc28M0zixQK3/LjwlB5W1QvMjxpmC3b1MicQlu4craWLzpl3t4JLXhfwJndhJeyTDTPvgOpf49Z07CxoG5USJtM5RUYYScCE4dWZYoerPpATSyLd3ImsrdflJrSjRR5+dnjoUDV+P1ckpL3ebPchYKQxA7B/O2osxPI90nXRTHS1sAB86AG7VLVSPZJs9mg9de679V4vMsDBTviqG92eQ1rNl9DDjbPRkDMlmJm7GgDmfAHB/KPVtAiKHy+g/3mMBTTdt0UTsxd7qq2ph2yYD1ophGvKSab7ksNqaNj7T6WUBvv0Ru1Og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RidJJLGanBjoc4PqDgwdIEk9S3okjQnm5zomYMtFvo0=;
 b=5XNQ2j5yOkUD/gmlTy2QBcH5TcFHJrvimM2Nk+CrWu0ZtCieG9Ye9zXbe/KWzM0pk4u0CMT8++sXKM3dUSAcX5RnIZcS5jDqVShv/M76w/GjY+UgXHANKIzUsw/QhjRrAmWcszFQBMU0g7iMKiXLqXhaFHD4fR3yE/vB8jhuuro=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CY4PR12MB1943.namprd12.prod.outlook.com (2603:10b6:903:11b::7)
 by CY4PR12MB1638.namprd12.prod.outlook.com (2603:10b6:910:10::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4844.15; Wed, 5 Jan
 2022 18:11:48 +0000
Received: from CY4PR12MB1943.namprd12.prod.outlook.com
 ([fe80::5b5:cbda:260b:7c39]) by CY4PR12MB1943.namprd12.prod.outlook.com
 ([fe80::5b5:cbda:260b:7c39%9]) with mapi id 15.20.4844.016; Wed, 5 Jan 2022
 18:11:47 +0000
Subject: Re: [RFC v2 4/8] drm/amdgpu: Serialize non TDR gpu recovery with TDRs
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 "Lazar, Lijo" <lijo.lazar@amd.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
References: <20211222220506.789133-1-andrey.grodzovsky@amd.com>
 <20211222220506.789133-5-andrey.grodzovsky@amd.com>
 <639bd7c3-e946-65eb-afae-dd619f6429d6@amd.com>
 <9dc55576-19b1-d5e3-f4da-eede4db8b289@amd.com>
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Message-ID: <c64c933f-498d-a2d9-fe63-058c6f1bed9c@amd.com>
Date: Wed, 5 Jan 2022 13:11:44 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <9dc55576-19b1-d5e3-f4da-eede4db8b289@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: YTOPR0101CA0039.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:14::16) To CY4PR12MB1943.namprd12.prod.outlook.com
 (2603:10b6:903:11b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a52eb306-73b1-40b0-2024-08d9d076d69a
X-MS-TrafficTypeDiagnostic: CY4PR12MB1638:EE_
X-Microsoft-Antispam-PRVS: <CY4PR12MB16384374A39ECDF0A28ECAFCEA4B9@CY4PR12MB1638.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uUeHF8xdtBgG4xIEq8uJ1u3ghXh+mh/VXI1UCwZXkb9EezNPrduAIbzd0zE4iAYKz5jbe7FZyutGU05zeOfzJgKzDyQpf7PIcvhfwS6ixv94QOPVMvJ/bl6inl5jwL74cwOZ5HlLBy2Sj1cFTLJBSRKzqGOLwikBKMPT6jOMoupk7HAQV0Astrdxqb/+KGDdvB9ySjqCFiy9nxOMezs6nIWlY3oiH4Cn2K5O0KwlteFO5QWfOW3inlQdeqa+WT4qFy4SB+J+1RfyF3k+GaQeHEnRacHSYZRDEdqkGE0CK1fyUYDFQ8nSwcz7FfUorR9Nft3jjr9TPt4p0ORtep44mromRxGHjDRobW8dw/6HWOmWN0cdGxnMOC94lpnSnAyAWiN+4MsRhqxznhLDO7ndhiWeH1Lbu0t34ihdjPiJW7ktylEw+YdOmzGM3dRwh1VX1iO0qyTcX4+69NmaDAgjpE/tS8wP6+jZEhcm8iqHX9TGqV/mtLPGSXVQHQmwIWNvOpt9STMRjpGcQX5784FfNV7JcIq0KFs9Nqk8yU9Kl84DDfbLU6speS5R2LNkwNxwFk3+WcojXy9GXxlHrE+H0oGwDgKUlsXuuaF+tkZLNZvVYNNP98J0TfmdECMnXx9vy9rU6fZSY0tgiuwqAEmVc3fVgYhIbY9nZSu+OL8G496sw/aeQN2YdKaFKDezTD5/L7+/QrZXBRuEVGACYylxPo9D9dBMeIm4h0ldOQ+JalA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY4PR12MB1943.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(508600001)(6666004)(66556008)(6506007)(53546011)(86362001)(31696002)(66574015)(83380400001)(66476007)(31686004)(2616005)(36756003)(8936002)(4326008)(44832011)(186003)(66946007)(2906002)(316002)(38100700002)(6486002)(5660300002)(110136005)(6512007)(8676002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?azJ1bGtlNGdkS2NtYTFwR3hOYjkwMk51d1VZSnd6bzRjUGJwSWZyR2RId1Ew?=
 =?utf-8?B?di9acmE0Nk5zN3hPM28zQk1FMGRaS2FudGhaNFZoTytPMzZTQTZ3TjhSODA2?=
 =?utf-8?B?MTAzbjBheGNzZW51M2NNWEtlTFk0V24rYWRQdmlVaGpFdGZjdWp2dVU4SFdq?=
 =?utf-8?B?SnpaMVNXaDBCcldwSGw1enJCWkZER3d4bE10ajFqdU5rWjdtWTNyYk1vMW1a?=
 =?utf-8?B?VlU0eTNVNVB4TkxFVThIeE1hUTVSUkkvVnhSUjhXclVMOTZ6d3dhNjF5VG80?=
 =?utf-8?B?N2lTOWllcEZBNXFxZmIyR21ORVQ5QzdBUnNEL1p2ejFqZDMvZ0xtVHhIdGdE?=
 =?utf-8?B?a3lFTGtINjNmSGlXT0dtZml5Z0VnMEl6S05maGQvSy83NkFrbE43RzJKd2Ix?=
 =?utf-8?B?NlZDck4yZTQycU9KTFhBMnlFOVM3RGNkRFNLdVREQlJYZ2Njb1RrVS9DS1NI?=
 =?utf-8?B?b0VXKzZvRkNJak9IYWJYanZiWEViVEpOOGZjdFB4NldQQksxZGpOZ3FWYUdi?=
 =?utf-8?B?YnZKeFdmOFNOU09ZSTNTQ1p3TXE0cG9wTG9jZSt5ZlpOTUxXK0U0bGxLVFZN?=
 =?utf-8?B?NUg1NXIzbkJnd094WDhJZExmQ21sT1Jib045NkFUNGF0MHBFdDdTV0psQzE0?=
 =?utf-8?B?RDVPK3Y4c1JoTnp5bjFubkVWdHFHblNiMUZLbE9jZG16MWhlYzM3OEZMTFMz?=
 =?utf-8?B?bEpWajJRejEwTDJkcnJ0bUxVek0vVVJpc0tiOWh3N0J6NGJPcDFuM0pwcjZh?=
 =?utf-8?B?OEZFbGhCQzh5QkFueFRYNnAyYWZrVmp2VzVyQkx3Q05PU3RCRW96OERLcmk1?=
 =?utf-8?B?aldhdXBTaHVRYS84bVpMZFpsYVJHOFRYbmpiZC9SSU1oTXJuWmUvVlcrQkZv?=
 =?utf-8?B?amxYeFhnWXRtVEtDL3orcTBVeXdiYTFDMEZpNDVIbHlvRmY0S3Yxam5yRmVD?=
 =?utf-8?B?dmZ5Qm0zMHNQZ3FBaHVPTk9RdnowK1NZOUtGRnUvNThEaFFIVTNoRWFaVHY5?=
 =?utf-8?B?RkhIVURRcXhKMkNBTis1MWNpdFYyeWJkWFRxc3VGdDEyL2hIVEM3SEdPNkJE?=
 =?utf-8?B?UXJxdnNvakxsYXorNlQzMU5QTW8yZ2hLUmlWamczS0djY3plRUVSOU9TeEFR?=
 =?utf-8?B?Yk5QVTBDMU1Kdm9ldXBEM3p2L2JHM1M0MkFWSHp0U1laVzd1eXdOWTBROG8v?=
 =?utf-8?B?eUhGNWdVSnFMbDhkeXp0dTlJa2UvVmo5cWZmeStMaEJBSlBFbWtKaTg3S1JE?=
 =?utf-8?B?UXVGUHduamdoYW00MzU0STMwaWxQYmltZEZVZUhmUm5sT1NKN3hTck9aNnN2?=
 =?utf-8?B?SnFoK0xpcUg3WnAwNEpXdHJsZ1hkcXpvSEJjdWVhZXc1UkN3eDdLWkpBK3lt?=
 =?utf-8?B?YmdXR2ZmUERXaS9ZNFdiTUVpbmUybE5JQ0lDZHdFSVRIRTNROUJNR0VKSE9T?=
 =?utf-8?B?L3FDazhZMmxLU204eWozSHhXODBESGhtMjlPUWNVcE9Cd2ZxWjVwc3JScmx2?=
 =?utf-8?B?SXQ1UEp6eFFONTRiNnZrdTJOWU5LSDZaWDNDRDdRcE5oL3lKODZ6OEtBc3lN?=
 =?utf-8?B?OGRrMWNlUk5aSldmOWZwYWxKdmZqRUt3bnRyaWZyQkE4bkxCL1pObEJiY201?=
 =?utf-8?B?STJkYWtrVmJXWWVzMlNqaXQwZnllb3pkNktEYUhzMTRmZVJFeHRXKzZBOURK?=
 =?utf-8?B?QjR6V29GZDZBQVZCQ1o4TjAwNWVhWlE0TnlBSlFIcHh4anVDTm5oL3hsVGMw?=
 =?utf-8?B?SnpPQXdkV01HRjkvOHJ3N2p0T0U2UDdnZG9Yb1R1cE84Q2dRbWNNMU5aODJk?=
 =?utf-8?B?SzFDR1JHM1FWck1LdWtxWU51blA3Nk1ZUkI0WmR2K09qUTVGTDEwLzdGZmxo?=
 =?utf-8?B?TEd3MWFaYWFRaUx4RFZ1VE1DaThad1lrOTZMYkVHTkUwTXFqdll4T3RJdXJx?=
 =?utf-8?B?bE1SSTYvT3puMmlEazJFUDBXVlZKN0RBWVBpZ05TdkpyekhnVU53aGZKL3V3?=
 =?utf-8?B?ZXBVdjYza1JiK1R3cnRyMDVIdVRGN2RkeVFHZjYvNVJzVW13a0lxTEZVdVdB?=
 =?utf-8?B?emhjdHoxVHlyazZPRzFLUEFwZmxJcnJBYk5sQmJ6L2wveXpKVEZqd2sxcGVL?=
 =?utf-8?B?SXNzOFBIWXpoQXdYeHN1THhPSUpqdjdnSDMvdUh4TGtiK25HOFowOU9HczQv?=
 =?utf-8?B?MUVlVFV0VmZoMUw4ckpIcURCZ05WVlhMUERWOGtFdWIzMVoyY2FQSFVqQnM5?=
 =?utf-8?Q?tArlbwooxGCJgtZWvpb89bQD+McEKNRMuc3JT7ElO8=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a52eb306-73b1-40b0-2024-08d9d076d69a
X-MS-Exchange-CrossTenant-AuthSource: CY4PR12MB1943.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2022 18:11:47.7591 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VSsq0jxhKXYdptJNDJK81LaBk/FOCf7Za+TuWb/bAJC+A/UQtm+YD8Bod5XXsh96eSmfzCrjMYueZLvGERCsaw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1638
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

On 2022-01-05 7:31 a.m., Christian König wrote:

> Am 05.01.22 um 10:54 schrieb Lazar, Lijo:
>> On 12/23/2021 3:35 AM, Andrey Grodzovsky wrote:
>>> Use reset domain wq also for non TDR gpu recovery trigers
>>> such as sysfs and RAS. We must serialize all possible
>>> GPU recoveries to gurantee no concurrency there.
>>> For TDR call the original recovery function directly since
>>> it's already executed from within the wq. For others just
>>> use a wrapper to qeueue work and wait on it to finish.
>>>
>>> v2: Rename to amdgpu_recover_work_struct
>>>
>>> Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
>>> ---
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu.h        |  2 ++
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 33 
>>> +++++++++++++++++++++-
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_job.c    |  2 +-
>>>   3 files changed, 35 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h 
>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
>>> index b5ff76aae7e0..8e96b9a14452 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
>>> @@ -1296,6 +1296,8 @@ bool amdgpu_device_has_job_running(struct 
>>> amdgpu_device *adev);
>>>   bool amdgpu_device_should_recover_gpu(struct amdgpu_device *adev);
>>>   int amdgpu_device_gpu_recover(struct amdgpu_device *adev,
>>>                     struct amdgpu_job* job);
>>> +int amdgpu_device_gpu_recover_imp(struct amdgpu_device *adev,
>>> +                  struct amdgpu_job *job);
>>>   void amdgpu_device_pci_config_reset(struct amdgpu_device *adev);
>>>   int amdgpu_device_pci_reset(struct amdgpu_device *adev);
>>>   bool amdgpu_device_need_post(struct amdgpu_device *adev);
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c 
>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>> index 7c063fd37389..258ec3c0b2af 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>> @@ -4979,7 +4979,7 @@ static void amdgpu_device_recheck_guilty_jobs(
>>>    * Returns 0 for success or an error on failure.
>>>    */
>>>   -int amdgpu_device_gpu_recover(struct amdgpu_device *adev,
>>> +int amdgpu_device_gpu_recover_imp(struct amdgpu_device *adev,
>>>                     struct amdgpu_job *job)
>>>   {
>>>       struct list_head device_list, *device_list_handle = NULL;
>>> @@ -5237,6 +5237,37 @@ int amdgpu_device_gpu_recover(struct 
>>> amdgpu_device *adev,
>>>       return r;
>>>   }
>>>   +struct amdgpu_recover_work_struct {
>>> +    struct work_struct base;
>>> +    struct amdgpu_device *adev;
>>> +    struct amdgpu_job *job;
>>> +    int ret;
>>> +};
>>> +
>>> +static void amdgpu_device_queue_gpu_recover_work(struct work_struct 
>>> *work)
>>> +{
>>> +    struct amdgpu_recover_work_struct *recover_work = 
>>> container_of(work, struct amdgpu_recover_work_struct, base);
>>> +
>>> +    recover_work->ret = 
>>> amdgpu_device_gpu_recover_imp(recover_work->adev, recover_work->job);
>>> +}
>>> +/*
>>> + * Serialize gpu recover into reset domain single threaded wq
>>> + */
>>> +int amdgpu_device_gpu_recover(struct amdgpu_device *adev,
>>> +                    struct amdgpu_job *job)
>>> +{
>>> +    struct amdgpu_recover_work_struct work = {.adev = adev, .job = 
>>> job};
>>> +
>>> +    INIT_WORK(&work.base, amdgpu_device_queue_gpu_recover_work);
>>> +
>>> +    if (!queue_work(adev->reset_domain.wq, &work.base))
>>> +        return -EAGAIN;
>>> +
>>
>> The decision to schedule a reset is made at this point. Subsequent 
>> accesses to hardware may not be reliable. So should the flag in_reset 
>> be set here itself rather than waiting for the work to start execution?
>
> No, when we race and lose the VM is completely lost and probably 
> restarted by the hypervisor.
>
> And when we race and win we properly set the flag before signaling the 
> hypervisor that it can continue with the reset.
>
>> Also, what about having the reset_active or in_reset flag in the 
>> reset_domain itself?
>
> Of hand that sounds like a good idea.


What then about the adev->reset_sem semaphore ? Should we also move this 
to reset_domain ?  Both of the moves have functional
implications only for XGMI case because there will be contention over 
accessing those single instance variables from multiple devices
while now each device has it's own copy.

What benefit the centralization into reset_domain gives - is it for 
example to prevent one device in a hive trying to access through MMIO 
another one's
VRAM (shared FB memory) while the other one goes through reset ?

Andrey


>
> Regards,
> Christian.
>
>>
>> Thanks,
>> Lijo
>>
>>> +    flush_work(&work.base);
>>> +
>>> +    return work.ret;
>>> +}
>>> +
>>>   /**
>>>    * amdgpu_device_get_pcie_info - fence pcie info about the PCIE slot
>>>    *
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c 
>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
>>> index bfc47bea23db..38c9fd7b7ad4 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
>>> @@ -63,7 +63,7 @@ static enum drm_gpu_sched_stat 
>>> amdgpu_job_timedout(struct drm_sched_job *s_job)
>>>             ti.process_name, ti.tgid, ti.task_name, ti.pid);
>>>         if (amdgpu_device_should_recover_gpu(ring->adev)) {
>>> -        amdgpu_device_gpu_recover(ring->adev, job);
>>> +        amdgpu_device_gpu_recover_imp(ring->adev, job);
>>>       } else {
>>>           drm_sched_suspend_timeout(&ring->sched);
>>>           if (amdgpu_sriov_vf(adev))
>>>
>
