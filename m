Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6D7A4DC287
	for <lists+dri-devel@lfdr.de>; Thu, 17 Mar 2022 10:21:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C27B310E109;
	Thu, 17 Mar 2022 09:21:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2059.outbound.protection.outlook.com [40.107.223.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A69EE10E109;
 Thu, 17 Mar 2022 09:21:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I0oliXrID6MSvPnqQvG9GWAdYgYVYBe0Z1/2Bfan2as1abCs8i6Fm8pVVvPBayHacJqjDhTyZCmzc7C8Z++1buFXIKVZTqZQM9RW94twMPl6392+cmE3jcioRW+/7jOVC+hrsbP1ZQNNtsy5/6tfKnVddSwI3MfyAWeACP0PQGhxNTwiEL+a+6TjJ9Awqxed/MxqGUyyx1Ykl5tX9mi5jjN5BqD0kbGQZJtRqU1qOC9Hzlrc52FUPsy2kprTaHp30L4XLxBtzON3EBto0JzeNCxTreCYeBiSE69u9wa/TumVIQhRhnqTSi77dggTcBc3go25XIYRv9DhaNHVLzMfzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A4ZXpVF2++gCeXv/Y+of+o/VFgAxf2b3EdxiZidX3/w=;
 b=Ct/doAfHqjhf7Yo2zqHiqlk2j54rNg5XpQRH9mgPcv9YDxWgVdofbR54xKHaHMkD3zuZF8a6kRjK38ELDvLtkx7XO2+PgF5jl9FqemWc+VQrOhPHroOPsj25ypZjiqQ0BMOCjYKDc+pNl3JAOw1dVHgdrzRa3hmsrLQXUENKks0CSpARVOzV6frTLYmapFhdjcx1kGCuer+rvAjlNmdRutWGPG5PU7OiSXwC8yAWmTNVdJX34uDW5FQ0sjHa46/bujcCfq6c8nCO4aRBixxPzIkuZjKJsTvxsOw32oaLtEbTZnVCdZKRDBH6Dg5p+FUX2a4EBR80RyBVxK+r+1yqOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A4ZXpVF2++gCeXv/Y+of+o/VFgAxf2b3EdxiZidX3/w=;
 b=RKhzO0GiRGU2Oe3fB6sCD6/Yi4lARe/ghh3BFiOOQKsN2veUDM0f6k6ko63o56ayat01UJvxEurmWsAu5ctLvU35hB4IhBA8MZ52Xryeln+VJBByL5YsQV62MKNn981eaZ8wA2TLppVrwOZqsrF/GaBwF4Ri4hP56KX1QHCcCWc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by DM4PR12MB5391.namprd12.prod.outlook.com (2603:10b6:5:39a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.14; Thu, 17 Mar
 2022 09:21:52 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::404f:1fc8:9f4c:f185]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::404f:1fc8:9f4c:f185%6]) with mapi id 15.20.5081.015; Thu, 17 Mar 2022
 09:21:52 +0000
Message-ID: <f291b94d-b981-5cfb-5422-ca4317d24eda@amd.com>
Date: Thu, 17 Mar 2022 10:21:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 1/2] drm: Add GPU reset sysfs event
Content-Language: en-US
To: "Sharma, Shashank" <shashank.sharma@amd.com>,
 Rob Clark <robdclark@gmail.com>,
 Shashank Sharma <contactshashanksharma@gmail.com>
References: <20220308180403.75566-1-contactshashanksharma@gmail.com>
 <CAF6AEGtnXvo=-fKbgSRtAtZ80igqJM2bTKefiLPUsSohU9idNQ@mail.gmail.com>
 <4d768cc9-9a47-473c-b344-4ed34bcb5556@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <4d768cc9-9a47-473c-b344-4ed34bcb5556@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS9PR06CA0057.eurprd06.prod.outlook.com
 (2603:10a6:20b:463::33) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5ca7399e-5889-4e37-b229-08da07f7920e
X-MS-TrafficTypeDiagnostic: DM4PR12MB5391:EE_
X-Microsoft-Antispam-PRVS: <DM4PR12MB53911D2EE6CB3777F15D2F6F83129@DM4PR12MB5391.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qrpfoz8Ntevsyip8UI2R+snr7+34NvljojECnbt7Aqn7aJmvJCGzrYFFZ+97THJhxWlrbAjrQjD6SCzgERUSuqirpURKl4++a1eg++waKfyHhQIkJc4rDFwOZzrBGGFOC6UGuP3EaHapxKOYX3sX032Dt5tEaqx6hlgiMbN9gIegP+qEUw7/F30ctSEfDt6Qom232ZsDjMP0lXx1nF7GtYj8hqU6wcPbwjp35lgeHo9Y/8LAwUX2LLkWxDlEP1vU7ZGakqCijsErBTvAQN+bJ4xedIyPcNIV8QFfPnCcaAqgFLabFvHTJI/mZ2+XqyeXm2cBufZhaMbFZZkxwgMJ7Sf+gW9/FY9lxCzVIrf0XBCvBolVkmr/K2ofXSHsSjRu9EYUOGcxd/E5WgIwwlKSx1mGG34B6hW/FQEPsqO0dDIhwLRuyMmniN5qxBerhgpi/RbnMinOI5G0Tnk1d0Q1lt4p567YBeLTt6xXnINSYT42wNZRgjfZYWSE8YytskA7In8RMdcJMGOmAUCBVjXVNIHNpYNYtuGfdDQWoTQWLzLmltLgL+nfnYiBLG39k9nlyNig+I5NU7/zgvljinB6grN+t5TJ7TKD6FVvQ9UV53yT14QYhbLQfWhnF5yivOQv3/U65+5Kgx0OnvwtVvUH04o7gRwlo/gtk0LxiKr407BPyz2aOibt9+3EXyV5uS4jHOfmfv6wbYxWQ0hDtMIcTXMvVeeIBWqtY22DQ3AMcB7g8gYezPDytnqcegdQgihT
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(36756003)(6666004)(6506007)(6512007)(186003)(38100700002)(26005)(2616005)(53546011)(2906002)(31686004)(8936002)(508600001)(110136005)(54906003)(66476007)(8676002)(66946007)(4326008)(5660300002)(66556008)(316002)(86362001)(6486002)(31696002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S1JuUGZBUVhwZDluQ0owK3FCL2NCSUw4ZStvYWdjelVxcm1KWURTZGxFMDNM?=
 =?utf-8?B?b3NubThWSmM5NGhxWWl1RDMwUmd5UG0vR2JLcGt3cEJCRlY0QTdtSFpFdWlq?=
 =?utf-8?B?RDcrUG83NU1qTC9ZRU5JeHVSaFhnUy9Lci9INnJRWTMxL2Y2TTVRd2FZRkdj?=
 =?utf-8?B?czJ4dkQ5ZlJDWnBiZmJLSGNCYi85NU5PK2pSbUZ3dGVXNy9QL1lnQ3pndGVz?=
 =?utf-8?B?RXhPM2VCSnhvaFhVUHc3bjNGeDVEaWRTU1NHQ0lralJibmpqVjlKcEgzUC9t?=
 =?utf-8?B?OWdoVWlQdWhxdGgvUHlXd1BiT3I0NGNCMTMzOU1VM240eEdVZ1lnQy9KRml4?=
 =?utf-8?B?amxSd01iUWdHQStLY2NqaG5QeW5LZnZLQm9Fc3FHc2x3UzBURU96N0lGdkdM?=
 =?utf-8?B?dUZmM3hYaGppck1nVkdYVkg0OW02NDYzTGN5Ylp5Vnl1RFJLNjByNE9EOG1m?=
 =?utf-8?B?bWIrMldFWG5obFQ3NTlFUThxa3g5ajI3eFR2Y1ZDNHBHOVNFMnFwd3IvaXRx?=
 =?utf-8?B?S0FzamQvaGFUL0Z2RnBUSGJpeUp5WG9NN0tKUjFxV01wVHBjM1dkSGErOWJL?=
 =?utf-8?B?eUNLa2FaWEhVNXlFOUk2Y1J6QXM5TUV0d2FjY1NmRXBIQnFEM05IVHVSRGNR?=
 =?utf-8?B?U1pnS1FnOXg1WWRBaVJ6TDJXeDBIbW5ScnhiTmZZRTBJT0tXQlBUa1dFL1VM?=
 =?utf-8?B?Umo5V1p1bzVFZGFZUThnK2tCUzVEQVJ1bmRBcyt6UGpBNzN1Wm5wbjhqRTNS?=
 =?utf-8?B?ZFdlTTdiM3F4Z2ZZN3lSb2FYTE1lbC8xMnVGNEhzWkRKUHJwa0lvckpFdldl?=
 =?utf-8?B?QWUzaGdCeEtXdVZzZ08yTkhwamk2WXprcmFpajhMWVZFeCs1Z3I2S1dGSmU5?=
 =?utf-8?B?NloxbmpReXM3dFhEa3lhQnJSbW4yN25yNW8yT21VcnJIQ3p4U1NVZnFDWHZz?=
 =?utf-8?B?SzkxK1M0cjVMWG5UZXZSYTVBa3JrT3hseVdTeXZTSUtmcUJFbEM4RDM5YjhN?=
 =?utf-8?B?TkhsVFZ4c1FnSVVRRWpFL1lkUTlUS1dxUm1CSzd3MHRnWEo4dWVnY1hLdDFE?=
 =?utf-8?B?K2NoNk1SUXA1cFk3RSt0MTJCb1lSRWpMdzV4S2dDcFhWcVBIMitBY2p5Q0ZK?=
 =?utf-8?B?NSt3NkF3eHdMTFNUZXIxMmQyVC9rUngzSGtiVFRSSnNBL3MveEVtM0padjUw?=
 =?utf-8?B?TEtlTm5MZkY3OVIzeTZyUWYySncrcWVUMXpjeWFHQUZXdTBMU1E4dmlGMGJJ?=
 =?utf-8?B?cUJIZm5obHBSWGNHYnAzZGZWdFc0UFNqL1dSZFFnN203QnBscjQrN1AvSUJs?=
 =?utf-8?B?OWxiUWZ2aWN0clVvS0JFSWQyck1pK2NjdTd3QzVtK05aQ3V4MHoxcHNKeG1m?=
 =?utf-8?B?dGdRSUpGYng5OXVXWXVZalowdm53RzZOQ0ZPQUZlV2pRdldERGtySU40djNl?=
 =?utf-8?B?dHhLUFNCRmM3Z2NTaGx1QjA2akNSYytwczRvM2NYS2VzbnZ5cnRZVXMvWWUz?=
 =?utf-8?B?d1JUb0ZETUYvcUlTL3BseEhnV3lac3EzREpYYWxsNTZpMTlHMEF4dG1wV3Fv?=
 =?utf-8?B?UFlxWUovYURCeVpmdG83T2YvamRTZEo1cVl0QVo0Q0N5THZkWnFlV0pCODhR?=
 =?utf-8?B?V0hYc1VZN3ZUSjJnWFYrN0lkaVdZM0szWDFRNVpLL0tGcVFGcTFhYnRhdzd4?=
 =?utf-8?B?ZkJNUnIzM0NSbm9yYUVCQUtEUzVIRG4zeUxRK0FVRjhZSUg4WGNYdmJpZmtV?=
 =?utf-8?B?UU10dnRESTNEVFBxcUNNOVgyQ2VCSEJPaWM2QWhBSnZ6cW1nMmdmdFFUV2di?=
 =?utf-8?B?dHJHZHZYem1tRG05ajB5U2s3QXE4ckdOUXpCdnlvYWZUMVJtTk1oZGk2bUFF?=
 =?utf-8?B?Y3ZvcjlwMlRPV0NkY1BjN01TWTJHT3dZdjdhRmJvMy8ySk8yd1E4ak93UkZD?=
 =?utf-8?Q?+NRSDPMPOIyen356EeFX8C/fFk2eDoGg?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ca7399e-5889-4e37-b229-08da07f7920e
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2022 09:21:52.2755 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5pAJRiU96+0q7kWKovRjYVdxh++73J3SLLq3hmHaj9Aij5AidkvPTzztnk4e31Z8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5391
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
Cc: Alexandar Deucher <alexander.deucher@amd.com>,
 Rob Clark <robdclark@chromium.org>,
 Amaranath Somalapuram <amaranath.somalapuram@amd.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 17.03.22 um 09:42 schrieb Sharma, Shashank:
> On 3/16/2022 10:50 PM, Rob Clark wrote:
>> On Tue, Mar 8, 2022 at 11:40 PM Shashank Sharma
>> <contactshashanksharma@gmail.com> wrote:
>>>
>>> From: Shashank Sharma <shashank.sharma@amd.com>
>>>
>>> This patch adds a new sysfs event, which will indicate
>>> the userland about a GPU reset, and can also provide
>>> some information like:
>>> - process ID of the process involved with the GPU reset
>>> - process name of the involved process
>>> - the GPU status info (using flags)
>>>
>>> This patch also introduces the first flag of the flags
>>> bitmap, which can be appended as and when required.
>>>
>>> V2: Addressed review comments from Christian and Amar
>>>     - move the reset information structure to DRM layer
>>>     - drop _ctx from struct name
>>>     - make pid 32 bit(than 64)
>>>     - set flag when VRAM invalid (than valid)
>>>     - add process name as well (Amar)
>>>
>>> Cc: Alexandar Deucher <alexander.deucher@amd.com>
>>> Cc: Christian Koenig <christian.koenig@amd.com>
>>> Cc: Amaranath Somalapuram <amaranath.somalapuram@amd.com>
>>> Signed-off-by: Shashank Sharma <shashank.sharma@amd.com>
>>> ---
>>>   drivers/gpu/drm/drm_sysfs.c | 31 +++++++++++++++++++++++++++++++
>>>   include/drm/drm_sysfs.h     | 10 ++++++++++
>>>   2 files changed, 41 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/drm_sysfs.c b/drivers/gpu/drm/drm_sysfs.c
>>> index 430e00b16eec..840994810910 100644
>>> --- a/drivers/gpu/drm/drm_sysfs.c
>>> +++ b/drivers/gpu/drm/drm_sysfs.c
>>> @@ -409,6 +409,37 @@ void drm_sysfs_hotplug_event(struct drm_device 
>>> *dev)
>>>   }
>>>   EXPORT_SYMBOL(drm_sysfs_hotplug_event);
>>>
>>> +/**
>>> + * drm_sysfs_reset_event - generate a DRM uevent to indicate GPU reset
>>> + * @dev: DRM device
>>> + * @reset_info: The contextual information about the reset (like 
>>> PID, flags)
>>> + *
>>> + * Send a uevent for the DRM device specified by @dev. This informs
>>> + * user that a GPU reset has occurred, so that an interested client
>>> + * can take any recovery or profiling measure.
>>> + */
>>> +void drm_sysfs_reset_event(struct drm_device *dev, struct 
>>> drm_reset_event *reset_info)
>>> +{
>>> +       unsigned char pid_str[13];
>>> +       unsigned char flags_str[15];
>>> +       unsigned char pname_str[TASK_COMM_LEN + 6];
>>> +       unsigned char reset_str[] = "RESET=1";
>>> +       char *envp[] = { reset_str, pid_str, pname_str, flags_str, 
>>> NULL };
>>> +
>>> +       if (!reset_info) {
>>> +               DRM_WARN("No reset info, not sending the event\n");
>>> +               return;
>>> +       }
>>> +
>>> +       DRM_DEBUG("generating reset event\n");
>>> +
>>> +       snprintf(pid_str, ARRAY_SIZE(pid_str), "PID=%u", 
>>> reset_info->pid);
>>> +       snprintf(pname_str, ARRAY_SIZE(pname_str), "NAME=%s", 
>>> reset_info->pname);
>>> +       snprintf(flags_str, ARRAY_SIZE(flags_str), "FLAGS=%u", 
>>> reset_info->flags);
>>> + kobject_uevent_env(&dev->primary->kdev->kobj, KOBJ_CHANGE, envp);
>>> +}
>>> +EXPORT_SYMBOL(drm_sysfs_reset_event);
>>> +
>>>   /**
>>>    * drm_sysfs_connector_hotplug_event - generate a DRM uevent for 
>>> any connector
>>>    * change
>>> diff --git a/include/drm/drm_sysfs.h b/include/drm/drm_sysfs.h
>>> index 6273cac44e47..5ba11c760619 100644
>>> --- a/include/drm/drm_sysfs.h
>>> +++ b/include/drm/drm_sysfs.h
>>> @@ -1,16 +1,26 @@
>>>   /* SPDX-License-Identifier: GPL-2.0 */
>>>   #ifndef _DRM_SYSFS_H_
>>>   #define _DRM_SYSFS_H_
>>> +#include <linux/sched.h>
>>> +
>>> +#define DRM_GPU_RESET_FLAG_VRAM_INVALID (1 << 0)
>>>
>>>   struct drm_device;
>>>   struct device;
>>>   struct drm_connector;
>>>   struct drm_property;
>>>
>>> +struct drm_reset_event {
>>> +       uint32_t pid;
>>
>> One side note, unrelated to devcoredump vs this..
>>
>> AFAIU you probably want to be passing around a `struct pid *`, and
>> then somehow use pid_vnr() in the context of the process reading the
>> event to get the numeric pid.  Otherwise things will not do what you
>> expect if the process triggering the crash is in a different pid
>> namespace from the compositor.
>>
>
> I am not sure if it is a good idea to add the pid extraction 
> complexity in here, it is left upto the driver to extract this 
> information and pass it to the work queue. In case of AMDGPU, its 
> extracted from GPU VM. It would be then more flexible for the drivers 
> as well.

Yeah, but that is just used for debugging.

If we want to use the pid for housekeeping, like for a daemon which 
kills/restarts processes, we absolutely need that or otherwise won't be 
able to work with containers.

Regards,
Christian.

>
> - Shashank
>
>> BR,
>> -R
>>
>>> +       uint32_t flags;
>>> +       char pname[TASK_COMM_LEN];
>>> +};
>>> +
>>>   int drm_class_device_register(struct device *dev);
>>>   void drm_class_device_unregister(struct device *dev);
>>>
>>>   void drm_sysfs_hotplug_event(struct drm_device *dev);
>>> +void drm_sysfs_reset_event(struct drm_device *dev, struct 
>>> drm_reset_event *reset_info);
>>>   void drm_sysfs_connector_hotplug_event(struct drm_connector 
>>> *connector);
>>>   void drm_sysfs_connector_status_event(struct drm_connector 
>>> *connector,
>>>                                        struct drm_property *property);
>>> -- 
>>> 2.32.0
>>>

