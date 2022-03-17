Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D94D94DC189
	for <lists+dri-devel@lfdr.de>; Thu, 17 Mar 2022 09:43:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3F0A10F0A9;
	Thu, 17 Mar 2022 08:42:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2087.outbound.protection.outlook.com [40.107.220.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 271AE10F0A9;
 Thu, 17 Mar 2022 08:42:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bAB/Va6H/3aikVDOT6dV3/mIIDwO7UnZUdzrhN+R+1MGvISSZ5O1GXcDWyZ/i+2KyDHNKeGwqUgPBSdwHmA6iannrAGHtwTlC0A6loL+B5cPaq2aBian9FxcTZOigegEVk/+7rD4U80RPajYB43zaX5KEmZTeM/9d0XeXsLuTVT15Y+DTE3gFta+cxBLU7rf42MZDG/BffvkXwph8PxyyGI/gpQ4lpSfSsld0jAGuC88WeMY4Gpzc3ob9Hanh0M4iUj8ZdIjYkNri201GaraGTvfbsjv96CLb5EhsUzA9Wu4YWAueKQr1YpUiccsFIimD97dVdAk1cIa7WpxpQ0SNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=55EMJuxEa6x8g4cceDusHCfPQ3+6DDd2XB10YKPeGaI=;
 b=ZyilR0itoQdtjIhH3tm2g+hGU7Pi2SQ5LJfM3MxtxrxotQdsQFieggbY8i/HnmFnpQdEPQo4CqV7GyAglZMmtXaF7MVOhY2piQPVMblFYnkQudl1QHNrMEAKFLstG5uYenF7ggTlZE7sbRXC9z2cjV4D50qsxRqGrdhIdXTjF9nUZGM+OCFNmNQjVNP4o8Tjo/dbAyvRbBUCEanGQi2TzSQkvXA+vEhlmZnRNqaAelW2AXN/fivEme6ZNOEK878oTUSUoti7LVgxCyQ4mBenbW2+KU5bEadfsAydrQbtR/C5aDCl1etclZBtaepXtS0okUZBuSCA5QN/ocj5QO+fxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=55EMJuxEa6x8g4cceDusHCfPQ3+6DDd2XB10YKPeGaI=;
 b=cl/XWRKgV91acxw0ZKu8vLNphZTGVWqLfDJndBVIhEh+HRKcJv8dVR9AtXiYJU3y+1pU3ZAHqfnq94pd4KV8h4elydm8KKinEqDTM4jR+rRhrdeh6NGp5SNPsSbUnDEd312SN9jAyDAfD/GwOSdUa6dKoH2mxPyH+V4uVPR976w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW4PR12MB5667.namprd12.prod.outlook.com (2603:10b6:303:18a::10)
 by MN2PR12MB4502.namprd12.prod.outlook.com (2603:10b6:208:263::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.14; Thu, 17 Mar
 2022 08:42:54 +0000
Received: from MW4PR12MB5667.namprd12.prod.outlook.com
 ([fe80::6985:8f5:c1dc:5540]) by MW4PR12MB5667.namprd12.prod.outlook.com
 ([fe80::6985:8f5:c1dc:5540%4]) with mapi id 15.20.5061.028; Thu, 17 Mar 2022
 08:42:54 +0000
Message-ID: <4d768cc9-9a47-473c-b344-4ed34bcb5556@amd.com>
Date: Thu, 17 Mar 2022 09:42:43 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH v2 1/2] drm: Add GPU reset sysfs event
Content-Language: en-US
To: Rob Clark <robdclark@gmail.com>,
 Shashank Sharma <contactshashanksharma@gmail.com>
References: <20220308180403.75566-1-contactshashanksharma@gmail.com>
 <CAF6AEGtnXvo=-fKbgSRtAtZ80igqJM2bTKefiLPUsSohU9idNQ@mail.gmail.com>
From: "Sharma, Shashank" <shashank.sharma@amd.com>
In-Reply-To: <CAF6AEGtnXvo=-fKbgSRtAtZ80igqJM2bTKefiLPUsSohU9idNQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0121.eurprd06.prod.outlook.com
 (2603:10a6:20b:467::12) To MW4PR12MB5667.namprd12.prod.outlook.com
 (2603:10b6:303:18a::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5c35256a-c087-4427-ec98-08da07f220e1
X-MS-TrafficTypeDiagnostic: MN2PR12MB4502:EE_
X-Microsoft-Antispam-PRVS: <MN2PR12MB45025A09C04382FCD4AF91EFF2129@MN2PR12MB4502.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: waSNAq0O2ccPLi7DiaB/izTxjuav1d1PHCJ7dvg/cQKW7A8HAq2qPhnXrJs//oU/uuCrs+b3aou/Iwv8ts2+gIgftCGEu+v7VqSmgDNiaIQbAdhpi9I28kCj29WFE4HvyRBXSkTkA9fv3+w/zQYg7JomGljrMqFbHKNPm/T9UI/N7BeLLXOnBPeLdgc9NQhQjODS3fZtRpK9KpuNYkuo3CUkUU3iJ+35jr0EYysBq2FYFMBDoWJvhqH5WU2AgV5qkTOv8oIM3zh8FL/+guDU+D/eR5IxUcHueLpr+bYPm+d+m84NzWX1/jd8+U/1MuqAITG/f8V5qytL+BXhJ7qpz0m0f2AWDnmm49jxw3UqubpY6wK6wN+sXMJM+9StGxvN2upcnUFaG1zxu009+4Tn/pIp6Mb4zR9VisNX5TW/apeK8S0RXOyvRN3hnO0hfyuolf6GcsEE6+L7o0tHIPHyxAJDPX4RL5mrm74NBILaOgwd6QI4/ONXg3+Oo/eIb+yWr4GqknrnlFOi7k/TDorL9FBNyZs56xdMLUnD1yVCY+3Gpt+UZOlkcnEQJ3VmWz/29sZGS93NdYbsjvuqw8yvk9lba4BN0J6KwW+KbI3LF2PL6/56TZgRTeuH8+gnqp8j8LopPkVKzUT4K7ikDpbh+zQG8IcqSab/TixHGlqchDy9Pyhrc+OA6Iv+Aqybl5BdKa9txRyBwIUgpqzGjiSaNnlCKQo7SuoORwI0uM+Z3UQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR12MB5667.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(86362001)(6486002)(66476007)(31696002)(66556008)(4326008)(316002)(54906003)(31686004)(110136005)(36756003)(8676002)(66946007)(6512007)(5660300002)(2616005)(508600001)(186003)(8936002)(26005)(38100700002)(2906002)(6666004)(53546011)(6506007)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VmZqSEZxWDFjc3ZwTUpwZXlMeGF0b21mV25EaktqR3RQemNqZHdNd1Zhb3Z2?=
 =?utf-8?B?VUtkd2xYYWd4NFA5Vkt0ZkV1bERmbXFrVURGY01GYU4yM1lnVzk1Y0g2ODlZ?=
 =?utf-8?B?ZjBCK05aRSt4R1cxWkNIVlE5Z0dGUm5yYTBXOGg5NHkyQXZRb2hQdkwvK085?=
 =?utf-8?B?a1RTNkxEY0s2UDNaNUdHUDVyLzYxZnJ5aXV0enRUU1Z5RE9HTW5LQmgzOEth?=
 =?utf-8?B?eEozT0g4Ylc5RjdqS2tTa1FXRVpiYWRGeXI4WFJvbFZNN0R1MTNnb3NORm5s?=
 =?utf-8?B?WFJVclBkTlNNWkMxd28yZWJhanpvTGxtZWhPUVFQY3J5V3NsdVR1OCtaeTY5?=
 =?utf-8?B?MHI4S0lKenRoY28rdWVZeUhSNW1aQWdOa1RsVzR0Q3ZsR0NHUE9RNy9SLzRQ?=
 =?utf-8?B?cmlmRkRhR1RzQi9ja1ZJSy81NHpxbndXdU9zTWtxaTVMdnBEcWFCcWV2UUUz?=
 =?utf-8?B?eVYwQzRJOHg4UzlWVUt6VmVPaGI4bnZDZ2hENzg3OEtRbm41YzdXYUhpTmNl?=
 =?utf-8?B?OHJ1alhJR2ZhcXpKVVE1QVpJK0xpbVFMdGllbDdjS2dWY0QzQmZnSVVpUHdz?=
 =?utf-8?B?ejVZWEZ2RnJ4RW4zcGZsdXdLUXJ1dnhjeHJ1NzFjRm5NM2w0aGJXMkpHZnAr?=
 =?utf-8?B?UlJnV285TDdrSnh5M0h4SW5ndEpFdzJvMWQyZENKd3RnNWZlK2FLN3lJdVlr?=
 =?utf-8?B?RkE3cnVVZnhCazBHbUJNWFJFSlJuTnRpMzJwZW5DODdIeWMrR1NzdmFuMVJO?=
 =?utf-8?B?OERzb3V2bTZqRFh5aXN6a0xKRS9YQk4wUE9oekJTTDhmd2phMWg3N0x4T0po?=
 =?utf-8?B?MnVDaWM1aEp3V1ljb0RmVncxOWxxUUF4aUJXVm5tcjRrVER4S1FMYUtSem1k?=
 =?utf-8?B?SmRVY25kQ095OEYycUNkRVZ3NGhweTNNSFQ4eGIzUGhYMlQ4WFpZTkhnUGZ1?=
 =?utf-8?B?QlhHbXhMS0JhY2J1Z1Q1SkNpRU5tZzVtQXJwS2NEc3h2YUp3SVF3R3pGWklq?=
 =?utf-8?B?RmVPK0F3N2haTmZFM2RGcWhoWTVIZzUycEhEYVpyK2RpY1hlcTJTWm04TXRT?=
 =?utf-8?B?ZjI3NzVhckFZejV2MWxqaG92dUZZWXMrODlXaXd5T1ZzNS9VenVtM3ZjUjRK?=
 =?utf-8?B?TURmWjZuK1lyUzNMY3JZN2wrZXNJN3VnbE1OendHUUZWTkh2bGl3M2JiYUJR?=
 =?utf-8?B?R0hlTzMxQmdvNlg1R0pDQ0RYdzVBR29jTHZadnBuR1lCUnpMU1h2U3ZqdUg4?=
 =?utf-8?B?cDgyYmZIOWVRRWZGd2lkUm82QW1SSUVjb3N4NjVJNGt3SkZ6MGw3QllVZG02?=
 =?utf-8?B?eDQ4TkpJK3l0SFlwTU1oeVhPYUdhTGNsdEI5Z3g3MHpRNVdkc0k2WjdGbXJ0?=
 =?utf-8?B?SnZ4MkV5VUpXNkx3UHk3K3huTjFDUXBZOWd6NUhrQi9DcmM0WGkrelQ0SEZw?=
 =?utf-8?B?VnRDWVlPSktJYzgxTnR5OTUydXNPNzNKQ2JpNlVObWFpUVhtNzdFOGJ0aDQ2?=
 =?utf-8?B?bzJMbkZtZUllc1Ywd0hxSVZpaVVUYmFhd3QzaTBmMGtaeE43Q2pzaUJNem5i?=
 =?utf-8?B?SElZZlZhVmtxM0tDK2NYUHRSTG53MXdzenJsMldacjZZbmoyTWhJbDc2eEFS?=
 =?utf-8?B?RWhEWW0rM1Y1SHRFbElNcHZiS3E0eTNWRElpS3h6K1lRRWZMNlZNSDZiNjFr?=
 =?utf-8?B?SU02WUxNd2lEOXlIS2FjMEhkL2JobGI2QzZXZTVaNVRFWW1IeksrcXhTTlN2?=
 =?utf-8?B?RURwUUZTWWkrOEN1VUUwRU5aajJjYlAwRHR0Tk12VFlNV3VqaEw3eEI3U2p2?=
 =?utf-8?B?RFV3T3NUdGpreFA5VEdBR2JyTUUwMjFJUTQrcGFLd2N5a1pvSjJKZlJzK3NV?=
 =?utf-8?B?ZjE0czBRUk9OV0loU0lZaU15c2RnQ21CWjlRQjlDRlpxR2ZvWUh6SU5xSTNP?=
 =?utf-8?Q?HqiB40uUfBXyek9ueCOk3U0Rx13UEuxt?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c35256a-c087-4427-ec98-08da07f220e1
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB5667.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2022 08:42:54.4327 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ysEaYaBdT2hcWQZSc2nNL4NZVU/aY4N+Toq6v1QR9yJBIgwqd8FGSMjPpTgsCYR857ib9Jf3IUosclFecLQkiw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4502
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
Cc: Rob Clark <robdclark@chromium.org>,
 Amaranath Somalapuram <amaranath.somalapuram@amd.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alexandar Deucher <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 3/16/2022 10:50 PM, Rob Clark wrote:
> On Tue, Mar 8, 2022 at 11:40 PM Shashank Sharma
> <contactshashanksharma@gmail.com> wrote:
>>
>> From: Shashank Sharma <shashank.sharma@amd.com>
>>
>> This patch adds a new sysfs event, which will indicate
>> the userland about a GPU reset, and can also provide
>> some information like:
>> - process ID of the process involved with the GPU reset
>> - process name of the involved process
>> - the GPU status info (using flags)
>>
>> This patch also introduces the first flag of the flags
>> bitmap, which can be appended as and when required.
>>
>> V2: Addressed review comments from Christian and Amar
>>     - move the reset information structure to DRM layer
>>     - drop _ctx from struct name
>>     - make pid 32 bit(than 64)
>>     - set flag when VRAM invalid (than valid)
>>     - add process name as well (Amar)
>>
>> Cc: Alexandar Deucher <alexander.deucher@amd.com>
>> Cc: Christian Koenig <christian.koenig@amd.com>
>> Cc: Amaranath Somalapuram <amaranath.somalapuram@amd.com>
>> Signed-off-by: Shashank Sharma <shashank.sharma@amd.com>
>> ---
>>   drivers/gpu/drm/drm_sysfs.c | 31 +++++++++++++++++++++++++++++++
>>   include/drm/drm_sysfs.h     | 10 ++++++++++
>>   2 files changed, 41 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/drm_sysfs.c b/drivers/gpu/drm/drm_sysfs.c
>> index 430e00b16eec..840994810910 100644
>> --- a/drivers/gpu/drm/drm_sysfs.c
>> +++ b/drivers/gpu/drm/drm_sysfs.c
>> @@ -409,6 +409,37 @@ void drm_sysfs_hotplug_event(struct drm_device *dev)
>>   }
>>   EXPORT_SYMBOL(drm_sysfs_hotplug_event);
>>
>> +/**
>> + * drm_sysfs_reset_event - generate a DRM uevent to indicate GPU reset
>> + * @dev: DRM device
>> + * @reset_info: The contextual information about the reset (like PID, flags)
>> + *
>> + * Send a uevent for the DRM device specified by @dev. This informs
>> + * user that a GPU reset has occurred, so that an interested client
>> + * can take any recovery or profiling measure.
>> + */
>> +void drm_sysfs_reset_event(struct drm_device *dev, struct drm_reset_event *reset_info)
>> +{
>> +       unsigned char pid_str[13];
>> +       unsigned char flags_str[15];
>> +       unsigned char pname_str[TASK_COMM_LEN + 6];
>> +       unsigned char reset_str[] = "RESET=1";
>> +       char *envp[] = { reset_str, pid_str, pname_str, flags_str, NULL };
>> +
>> +       if (!reset_info) {
>> +               DRM_WARN("No reset info, not sending the event\n");
>> +               return;
>> +       }
>> +
>> +       DRM_DEBUG("generating reset event\n");
>> +
>> +       snprintf(pid_str, ARRAY_SIZE(pid_str), "PID=%u", reset_info->pid);
>> +       snprintf(pname_str, ARRAY_SIZE(pname_str), "NAME=%s", reset_info->pname);
>> +       snprintf(flags_str, ARRAY_SIZE(flags_str), "FLAGS=%u", reset_info->flags);
>> +       kobject_uevent_env(&dev->primary->kdev->kobj, KOBJ_CHANGE, envp);
>> +}
>> +EXPORT_SYMBOL(drm_sysfs_reset_event);
>> +
>>   /**
>>    * drm_sysfs_connector_hotplug_event - generate a DRM uevent for any connector
>>    * change
>> diff --git a/include/drm/drm_sysfs.h b/include/drm/drm_sysfs.h
>> index 6273cac44e47..5ba11c760619 100644
>> --- a/include/drm/drm_sysfs.h
>> +++ b/include/drm/drm_sysfs.h
>> @@ -1,16 +1,26 @@
>>   /* SPDX-License-Identifier: GPL-2.0 */
>>   #ifndef _DRM_SYSFS_H_
>>   #define _DRM_SYSFS_H_
>> +#include <linux/sched.h>
>> +
>> +#define DRM_GPU_RESET_FLAG_VRAM_INVALID (1 << 0)
>>
>>   struct drm_device;
>>   struct device;
>>   struct drm_connector;
>>   struct drm_property;
>>
>> +struct drm_reset_event {
>> +       uint32_t pid;
> 
> One side note, unrelated to devcoredump vs this..
> 
> AFAIU you probably want to be passing around a `struct pid *`, and
> then somehow use pid_vnr() in the context of the process reading the
> event to get the numeric pid.  Otherwise things will not do what you
> expect if the process triggering the crash is in a different pid
> namespace from the compositor.
> 

I am not sure if it is a good idea to add the pid extraction complexity 
in here, it is left upto the driver to extract this information and pass 
it to the work queue. In case of AMDGPU, its extracted from GPU VM. It 
would be then more flexible for the drivers as well.

- Shashank

> BR,
> -R
> 
>> +       uint32_t flags;
>> +       char pname[TASK_COMM_LEN];
>> +};
>> +
>>   int drm_class_device_register(struct device *dev);
>>   void drm_class_device_unregister(struct device *dev);
>>
>>   void drm_sysfs_hotplug_event(struct drm_device *dev);
>> +void drm_sysfs_reset_event(struct drm_device *dev, struct drm_reset_event *reset_info);
>>   void drm_sysfs_connector_hotplug_event(struct drm_connector *connector);
>>   void drm_sysfs_connector_status_event(struct drm_connector *connector,
>>                                        struct drm_property *property);
>> --
>> 2.32.0
>>
