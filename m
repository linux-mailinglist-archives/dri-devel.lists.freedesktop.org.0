Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 89AF32F5B3B
	for <lists+dri-devel@lfdr.de>; Thu, 14 Jan 2021 08:24:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BC8489F41;
	Thu, 14 Jan 2021 07:24:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2059.outbound.protection.outlook.com [40.107.93.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40CD489F0A;
 Thu, 14 Jan 2021 07:24:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QhKFGin3RPtoN1/AQfVbjQkVpVNVOEl46ZJeYH7ZeWGYgiqepYCQvSqdkU0+3ZHczHD5yOTYJmXStCtt0PiubcuRT0Hq6BLeBcUVgQMudICIQwEl7Vw+4JgBZR2pjuGLkRMVtNDyAK3yI6L/EA5PtshkXkDUyZO6gwhE+hc5XmNRs2EM3vexduhrIolBMVrgzpkOUvZrj2UJAN2sCf2k3DqgbEQnvC9HHXpYlZJsCgKUW+rJx0J+PSZOCGqkPfJ1oG3uulkZvp0FdXi+5nbaGj+zXTcovBHgb8knO3lsnOtCOHwo+BeSKD9qanS0DjXUq91dc4VbeVghyYTYEcAkww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7XzsLq/toa6LhKuXnBHosEz8qIPJUVsOK0SkE1s3Whw=;
 b=N5F5ucPFXV67Gtek7Zbr4CI6l/NEbVBi3wmM1lW4gxA1DucjFVKXH/JJyAoSCXXwEQn++h2zS3lyVKKf1NN+gUGo+47jTtuYxhMYSgL95hYw2aOQ6B/fEETQFzg6gL3LV8PnxA7v0Ms1HLI5H2Kq4WDeXR7raZ6NiDiH7YVGE5KPN8kTcYOji8Ogfjvc9GdHqW2+xqKWitflYbCOi8ZlbPbkpLDCeHx9t3lZ6poQwzSWPD2vhrIobzT4itG5Tt2O8+xK4Ft1A46RGZc3QHsM0UQLmhmP7v1T2TZ3sb3Hr8KPGhifL9xg9WFLYPXAxQ5VL/xQdhmbtz/hqBOQViNehQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7XzsLq/toa6LhKuXnBHosEz8qIPJUVsOK0SkE1s3Whw=;
 b=S9TYcobccvG8OfrAlQbS6x5f5yK+RHFtvHB7rK4cwA4WiuOfEFxcmJvcWhx2qVBATmY5ecJA6k51TXH7rfLEncZnUJRSkVagPighd1WpbCtPQr1VDKwVm33SX4D0I3pfE2V0ErMsSfvV6V8TlXoK8gITYk1PrR8FpGhRY9rGelI=
Authentication-Results: linux.ie; dkim=none (message not signed)
 header.d=none;linux.ie; dmarc=none action=none header.from=amd.com;
Received: from BYAPR12MB4615.namprd12.prod.outlook.com (2603:10b6:a03:96::21)
 by BYAPR12MB2871.namprd12.prod.outlook.com (2603:10b6:a03:13d::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.10; Thu, 14 Jan
 2021 07:24:19 +0000
Received: from BYAPR12MB4615.namprd12.prod.outlook.com
 ([fe80::5cbd:c5a8:779:9672]) by BYAPR12MB4615.namprd12.prod.outlook.com
 ([fe80::5cbd:c5a8:779:9672%7]) with mapi id 15.20.3742.008; Thu, 14 Jan 2021
 07:24:19 +0000
Subject: Re: [PATCH 2/2] drm/amdgpu/display: buffer INTERRUPT_LOW_IRQ_CONTEXT
 interrupt work
To: "Chen, Xiaogang" <Xiaogang.Chen@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "Wentland, Harry" <Harry.Wentland@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "airlied@linux.ie" <airlied@linux.ie>
References: <1609740098-32603-1-git-send-email-xiaogang.chen@amd.com>
 <1609740098-32603-2-git-send-email-xiaogang.chen@amd.com>
 <51a8727c-1ad0-8e7f-8c07-ed0b4bbed7a5@amd.com>
 <6ba05f63-12f2-73c5-33c5-4b29c6166d8b@amd.com>
From: Andrey Grodzovsky <Andrey.Grodzovsky@amd.com>
Message-ID: <9ff0ccbb-c567-2128-ec84-6803f0fa2df5@amd.com>
Date: Thu, 14 Jan 2021 02:24:16 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
In-Reply-To: <6ba05f63-12f2-73c5-33c5-4b29c6166d8b@amd.com>
Content-Language: en-US
X-Originating-IP: [2607:fea8:3edf:49b0::799c]
X-ClientProxiedBy: YT1PR01CA0119.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2c::28) To BYAPR12MB4615.namprd12.prod.outlook.com
 (2603:10b6:a03:96::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2607:fea8:3edf:49b0::799c] (2607:fea8:3edf:49b0::799c) by
 YT1PR01CA0119.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2c::28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3763.10 via Frontend Transport; Thu, 14 Jan 2021 07:24:18 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 69514e58-732a-4b0e-8ce4-08d8b85d688a
X-MS-TrafficTypeDiagnostic: BYAPR12MB2871:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR12MB2871DDF440560AFFD35BA6D9EAA80@BYAPR12MB2871.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Qu63KUCGY6h+ZTHfYi/nIjTQwtiIvbuTOwNVxgGPz63ALc6lit71c/ojdkxJj33jqXzf3b3KVOaidQKIi+h6t7u1pRhC4APAnj3qsi5RVEc32TzYF7e3+gzlcIPqg4KGtXAKN4Ti3faheQxMwWuiSd3cGx5/c0o/Ga3uhRNiOoYI7ELMonOM3Yd7/eX3Wxvw0K8wJ6t3ooryidQs3QIUHAggl5Kd0FLPbNBJ230Xc9DK+QDV5ZRNYFTbdlzJ6jefs4UmjVxuGsXJ+P5q23YQ9fvreglqDd8R7Zgqm6xBtZsXxJkr9Pw7VBVDW4I580CNAzAIFkIoLE+3CIsxw8yfNh4qCnizcNW5mxdoCqk3wYIKcE6sLlRsWrwyrInc3PqZT0RrTB/xOEp/twoLZzgvgURslvPjVK4otKia3ijwiTLBsVDT5u142MTSHFH00oNDW4Z2VwA9/EBNe4wNGABut8uNNwienktVri0yVlS06Sf2aVWzncocV1DrP76pBU1+LV2Wuby1u3SUBuK2JZGZjC+cz7YbZI2dRuvTv/zsohWl5PbWQQ0jxuFQfs66XkNJ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB4615.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(366004)(136003)(346002)(39860400002)(6486002)(83380400001)(966005)(8676002)(53546011)(316002)(16526019)(166002)(2906002)(86362001)(30864003)(33964004)(66476007)(66556008)(52116002)(8936002)(110136005)(31686004)(31696002)(5660300002)(2616005)(66946007)(478600001)(36756003)(186003)(45980500001)(43740500002)(579004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?anNQWSs2N0lWbGlsTDVFZUlXVzk0TDdhdGV6dkFRUjZkVkdnK2pkeTd6RExU?=
 =?utf-8?B?ZHVFdG1iWUs3RWFVbHdES2VqeXhDMFEzdGJ2TGN6S2xjdUVHdG03Tk15bCtz?=
 =?utf-8?B?d1FRRHphZjI2VGw5Y3ZUVkxPdEVuVnBmckN0L09YbjZoRkhkSnJZd1lWeGVn?=
 =?utf-8?B?Zk5pRThWM1pqYzgxQUhrZ0xPNWlzTjl4eEMvK2oxVTZ4UHRXL3Z2Mko3OS9F?=
 =?utf-8?B?NE1jekJuRWs3WWdTdTNPUnVZRVBEMEFEOHNvb0I2YUlXUXlVMDVUM3NEU3Ar?=
 =?utf-8?B?c0ppeVUvRDFPbUlBTkhxM21HZVU5MldlTW5hOEJub2RVbU1kb1dMbjFxYkpN?=
 =?utf-8?B?VjhGTDlUNlcySkM2NXU1cFJjcWNyQVpvZ2hBakNQRjVsYXJuMWdwQmJRS0pk?=
 =?utf-8?B?NnZzbDQwbVFxeHVSM3A1QlE2UkQrMFdPODB2MTdBOHBwZGI4SE1YK3R0dlZO?=
 =?utf-8?B?YmdxU3dRUFBJN1crMFNTUEVsdDJCTGFZVjlzSXZ5cWwxQ3B0TXB4eDBvNk0v?=
 =?utf-8?B?MG5NNFNybXNzOEVZRUYzMzY3eU5zL3NPbnRlelZPOTF5b2w5aVo4bm52U2RI?=
 =?utf-8?B?Z2tPbXlKNlE1dnJnYzY3aXo3c25OWnRDbWRsb3J3b1l0K0hKNTgvSlcrM1FC?=
 =?utf-8?B?b0FRdk1qOGZaSGVEd0JNWE9ZUkxtbXlmdlJuZGxmN1dKSlBJdHVHV2NxZTRh?=
 =?utf-8?B?eTE5OVFzQVl0RGMzU1QxTERFMzk3QWJ5RXR2RCtPbG9XVTFEUlBPdjhUNTRt?=
 =?utf-8?B?dWRoUjdDUTBoSHlwVDNPWUtGSzFBQ3czZktqdXk0QitSQk80Mkg2SzRYejV3?=
 =?utf-8?B?RHJiSkhlOTZTbC8wOGtmdWhkUDZyOXNKNkwveENpWGVFZjhlWWZIcU5heHdr?=
 =?utf-8?B?QWg3R3VJZGszZkkrZVBRamh2NkNBYWpCL0FJVzFiRDNqY3ZSbXJld1FYTi9M?=
 =?utf-8?B?NHh2NEVzVnZtcmlCOVpxWDFrRldvYlEwZ0wyUGVKYjIyb1JTc3VEb1J2S0pa?=
 =?utf-8?B?Yll0VEhuK3dDeVFMR29vdjQyclZUR2VUeWY0NFlxUkJsaFYvRnZIb25aMW5C?=
 =?utf-8?B?bk55RzljdWJKTUlKMlM5UXdBN2ZuYnNyeGV1NTIvNkdkZUpoRkJnUEpIWGMy?=
 =?utf-8?B?dkR0ek9UM0Y5dFpRZ1EyTnJDNll4VGdlVkJxVEZrRS9zQ0tVYUZwRkt4Ujhq?=
 =?utf-8?B?emhvQlh2a3VNMTUwK2xIU3Jlbk51M1hjUHdhVTBFbWxhM3lvV0lKNjljMnJW?=
 =?utf-8?B?czRScXBnWUN5dWhTaXlLbmN0bzhSR3BhT2N4VmVMckJHcnhsd2pqbEJCTkVQ?=
 =?utf-8?B?cklzZlpxaitvdllTeEs0Rkx4UTdreWRLaHNHRzZwQytPTUUzTUdSOXdsaEdz?=
 =?utf-8?B?dzFFbTB6Z0gvb0E9PQ==?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4615.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2021 07:24:19.6536 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-Network-Message-Id: 69514e58-732a-4b0e-8ce4-08d8b85d688a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RPZoeJrwXvTlriSW5149VITjzUoZxyRsbpI7tv44O/iVgubfZ/eFJKiEsjQkVqR4iBfWnfQ64zKtubXvVYLcpA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2871
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
Content-Type: multipart/mixed; boundary="===============1716410449=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1716410449==
Content-Type: multipart/alternative;
 boundary="------------CBE56C0C9338737619F9A7BB"
Content-Language: en-US

--------------CBE56C0C9338737619F9A7BB
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit


On 1/14/21 12:11 AM, Chen, Xiaogang wrote:
> On 1/12/2021 10:54 PM, Grodzovsky, Andrey wrote:
>>
>> On 1/4/21 1:01 AM, Xiaogang.Chen wrote:
>>> From: Xiaogang Chen <xiaogang.chen@amd.com>
>>>
>>> amdgpu DM handles INTERRUPT_LOW_IRQ_CONTEXT interrupt(hpd, hpd_rx) by
>>> using work queue and uses single work_struct. If previous interrupt
>>> has not been handled new interrupts(same type) will be discarded and
>>> driver just sends "amdgpu_dm_irq_schedule_work FAILED" message out.
>>> If some important hpd, hpd_rx related interrupts are missed by driver
>>> the hot (un)plug devices may cause system hang or unstable, such as
>>> system resumes from S3 sleep with mst device connected.
>>>
>>> This patch dynamically allocates new amdgpu_dm_irq_handler_data for
>>> new interrupts if previous INTERRUPT_LOW_IRQ_CONTEXT interrupt work
>>> has not been handled. So the new interrupt works can be queued to the
>>> same workqueue_struct, instead discard the new interrupts.
>>> All allocated amdgpu_dm_irq_handler_data are put into a single linked
>>> list and will be reused after.
>>
>>
>> I believe this creates a possible concurrency between already executing work 
>> item
>> and the new incoming one for which you allocate a new work item on the fly. 
>> While
>> handle_hpd_irq is serialized with aconnector->hpd_lock I am seeing that for 
>> handle_hpd_rx_irq
>> it's not locked for MST use case (which is the most frequently used with this 
>> interrupt).  Did you
>> verified that handle_hpd_rx_irq is reentrant ?
>>
> handle_hpd_rx_irq is put at a work queue. Its execution is serialized by the 
> work queue. So there is no reentrant.
>
You are using system_highpri_wq which has the property that it has multiple 
workers thread pool spread across all the
active CPUs, see all work queue definitions here 
https://elixir.bootlin.com/linux/v5.11-rc3/source/include/linux/workqueue.h#L358
I beleieve that what you saying about no chance of reentrnacy would be correct 
if it would be same work item dequeued for execution
while previous instance is still running, see the explanation here - 
https://elixir.bootlin.com/linux/v5.11-rc3/source/kernel/workqueue.c#L1435.
Non reentrancy is guaranteed only for the same work item. If you want non 
reentrancy (full serializtion) for different work items you should create
you own single threaded work-queue using create_singlethread_workqueue


> amdgpu_dm_irq_schedule_work does queuing of work(put handle_hpd_rx_irq into 
> work queue). The first call is dm_irq_work_func, then call handle_hpd_rx_irq.
>>
>>>
>>> Signed-off-by: Xiaogang Chen <xiaogang.chen@amd.com>
>>> ---
>>>   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h  |  14 +--
>>>   .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_irq.c  | 114 
>>> ++++++++++++++-------
>>>   2 files changed, 80 insertions(+), 48 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h 
>>> b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
>>> index c9d82b9..730e540 100644
>>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
>>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
>>> @@ -69,18 +69,6 @@ struct common_irq_params {
>>>   };
>>>     /**
>>> - * struct irq_list_head - Linked-list for low context IRQ handlers.
>>> - *
>>> - * @head: The list_head within &struct handler_data
>>> - * @work: A work_struct containing the deferred handler work
>>> - */
>>> -struct irq_list_head {
>>> -    struct list_head head;
>>> -    /* In case this interrupt needs post-processing, 'work' will be queued*/
>>> -    struct work_struct work;
>>> -};
>>> -
>>> -/**
>>>    * struct dm_compressor_info - Buffer info used by frame buffer compression
>>>    * @cpu_addr: MMIO cpu addr
>>>    * @bo_ptr: Pointer to the buffer object
>>> @@ -270,7 +258,7 @@ struct amdgpu_display_manager {
>>>        * Note that handlers are called in the same order as they were
>>>        * registered (FIFO).
>>>        */
>>> -    struct irq_list_head irq_handler_list_low_tab[DAL_IRQ_SOURCES_NUMBER];
>>> +    struct list_head irq_handler_list_low_tab[DAL_IRQ_SOURCES_NUMBER];
>>>         /**
>>>        * @irq_handler_list_high_tab:
>>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_irq.c 
>>> b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_irq.c
>>> index 3577785..ada344a 100644
>>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_irq.c
>>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_irq.c
>>> @@ -82,6 +82,7 @@ struct amdgpu_dm_irq_handler_data {
>>>       struct amdgpu_display_manager *dm;
>>>       /* DAL irq source which registered for this interrupt. */
>>>       enum dc_irq_source irq_source;
>>> +    struct work_struct work;
>>>   };
>>>     #define DM_IRQ_TABLE_LOCK(adev, flags) \
>>> @@ -111,20 +112,10 @@ static void init_handler_common_data(struct 
>>> amdgpu_dm_irq_handler_data *hcd,
>>>    */
>>>   static void dm_irq_work_func(struct work_struct *work)
>>>   {
>>> -    struct irq_list_head *irq_list_head =
>>> -        container_of(work, struct irq_list_head, work);
>>> -    struct list_head *handler_list = &irq_list_head->head;
>>> -    struct amdgpu_dm_irq_handler_data *handler_data;
>>> -
>>> -    list_for_each_entry(handler_data, handler_list, list) {
>>> -        DRM_DEBUG_KMS("DM_IRQ: work_func: for dal_src=%d\n",
>>> -                handler_data->irq_source);
>>> +    struct amdgpu_dm_irq_handler_data *handler_data =
>>> +     container_of(work, struct amdgpu_dm_irq_handler_data, work);
>>>   -        DRM_DEBUG_KMS("DM_IRQ: schedule_work: for dal_src=%d\n",
>>> -            handler_data->irq_source);
>>> -
>>> - handler_data->handler(handler_data->handler_arg);
>>> -    }
>>> +    handler_data->handler(handler_data->handler_arg);
>>>         /* Call a DAL subcomponent which registered for interrupt notification
>>>        * at INTERRUPT_LOW_IRQ_CONTEXT.
>>> @@ -156,7 +147,7 @@ static struct list_head *remove_irq_handler(struct 
>>> amdgpu_device *adev,
>>>           break;
>>>       case INTERRUPT_LOW_IRQ_CONTEXT:
>>>       default:
>>> -        hnd_list = &adev->dm.irq_handler_list_low_tab[irq_source].head;
>>> +        hnd_list = &adev->dm.irq_handler_list_low_tab[irq_source];
>>>           break;
>>>       }
>>>   @@ -287,7 +278,8 @@ void *amdgpu_dm_irq_register_interrupt(struct 
>>> amdgpu_device *adev,
>>>           break;
>>>       case INTERRUPT_LOW_IRQ_CONTEXT:
>>>       default:
>>> -        hnd_list = &adev->dm.irq_handler_list_low_tab[irq_source].head;
>>> +        hnd_list = &adev->dm.irq_handler_list_low_tab[irq_source];
>>> +        INIT_WORK(&handler_data->work, dm_irq_work_func);
>>>           break;
>>>       }
>>>   @@ -369,7 +361,7 @@ void amdgpu_dm_irq_unregister_interrupt(struct 
>>> amdgpu_device *adev,
>>>   int amdgpu_dm_irq_init(struct amdgpu_device *adev)
>>>   {
>>>       int src;
>>> -    struct irq_list_head *lh;
>>> +    struct list_head *lh;
>>>         DRM_DEBUG_KMS("DM_IRQ\n");
>>>   @@ -378,9 +370,7 @@ int amdgpu_dm_irq_init(struct amdgpu_device *adev)
>>>       for (src = 0; src < DAL_IRQ_SOURCES_NUMBER; src++) {
>>>           /* low context handler list init */
>>>           lh = &adev->dm.irq_handler_list_low_tab[src];
>>> -        INIT_LIST_HEAD(&lh->head);
>>> -        INIT_WORK(&lh->work, dm_irq_work_func);
>>> -
>>> +        INIT_LIST_HEAD(lh);
>>>           /* high context handler init */
>>> INIT_LIST_HEAD(&adev->dm.irq_handler_list_high_tab[src]);
>>>       }
>>> @@ -397,8 +387,11 @@ int amdgpu_dm_irq_init(struct amdgpu_device *adev)
>>>   void amdgpu_dm_irq_fini(struct amdgpu_device *adev)
>>>   {
>>>       int src;
>>> -    struct irq_list_head *lh;
>>> +    struct list_head *lh;
>>> +    struct list_head *entry, *tmp;
>>> +    struct amdgpu_dm_irq_handler_data *handler;
>>>       unsigned long irq_table_flags;
>>> +
>>>       DRM_DEBUG_KMS("DM_IRQ: releasing resources.\n");
>>>       for (src = 0; src < DAL_IRQ_SOURCES_NUMBER; src++) {
>>>           DM_IRQ_TABLE_LOCK(adev, irq_table_flags);
>>> @@ -407,7 +400,15 @@ void amdgpu_dm_irq_fini(struct amdgpu_device *adev)
>>>            * (because no code can schedule a new one). */
>>>           lh = &adev->dm.irq_handler_list_low_tab[src];
>>>           DM_IRQ_TABLE_UNLOCK(adev, irq_table_flags);
>>> -        flush_work(&lh->work);
>>> +
>>> +        if (!list_empty(lh)) {
>>> +            list_for_each_safe(entry, tmp, lh) {
>>> +
>>> +                handler = list_entry(entry, struct amdgpu_dm_irq_handler_data,
>>> +                                     list);
>>> +                flush_work(&handler->work);
>>> +            }
>>> +        }
>>>       }
>>>   }
>>>   @@ -417,6 +418,8 @@ int amdgpu_dm_irq_suspend(struct amdgpu_device *adev)
>>>       struct list_head *hnd_list_h;
>>>       struct list_head *hnd_list_l;
>>>       unsigned long irq_table_flags;
>>> +    struct list_head *entry, *tmp;
>>> +    struct amdgpu_dm_irq_handler_data *handler;
>>>         DM_IRQ_TABLE_LOCK(adev, irq_table_flags);
>>>   @@ -427,14 +430,22 @@ int amdgpu_dm_irq_suspend(struct amdgpu_device *adev)
>>>        * will be disabled from manage_dm_interrupts on disable CRTC.
>>>        */
>>>       for (src = DC_IRQ_SOURCE_HPD1; src <= DC_IRQ_SOURCE_HPD6RX; src++) {
>>> -        hnd_list_l = &adev->dm.irq_handler_list_low_tab[src].head;
>>> +        hnd_list_l = &adev->dm.irq_handler_list_low_tab[src];
>>>           hnd_list_h = &adev->dm.irq_handler_list_high_tab[src];
>>>           if (!list_empty(hnd_list_l) || !list_empty(hnd_list_h))
>>>               dc_interrupt_set(adev->dm.dc, src, false);
>>>             DM_IRQ_TABLE_UNLOCK(adev, irq_table_flags);
>>> - flush_work(&adev->dm.irq_handler_list_low_tab[src].work);
>>>   +        if (!list_empty(hnd_list_l)) {
>>> +
>>> +            list_for_each_safe(entry, tmp, hnd_list_l) {
>>> +
>>> +                handler = list_entry(entry, struct amdgpu_dm_irq_handler_data,
>>> +                                     list);
>>> +                flush_work(&handler->work);
>>> +            }
>>> +        }
>>>           DM_IRQ_TABLE_LOCK(adev, irq_table_flags);
>>>       }
>>>   @@ -454,7 +465,7 @@ int amdgpu_dm_irq_resume_early(struct amdgpu_device 
>>> *adev)
>>>         /* re-enable short pulse interrupts HW interrupt */
>>>       for (src = DC_IRQ_SOURCE_HPD1RX; src <= DC_IRQ_SOURCE_HPD6RX; src++) {
>>> -        hnd_list_l = &adev->dm.irq_handler_list_low_tab[src].head;
>>> +        hnd_list_l = &adev->dm.irq_handler_list_low_tab[src];
>>>           hnd_list_h = &adev->dm.irq_handler_list_high_tab[src];
>>>           if (!list_empty(hnd_list_l) || !list_empty(hnd_list_h))
>>>               dc_interrupt_set(adev->dm.dc, src, true);
>>> @@ -480,7 +491,7 @@ int amdgpu_dm_irq_resume_late(struct amdgpu_device *adev)
>>>        * will be enabled from manage_dm_interrupts on enable CRTC.
>>>        */
>>>       for (src = DC_IRQ_SOURCE_HPD1; src <= DC_IRQ_SOURCE_HPD6; src++) {
>>> -        hnd_list_l = &adev->dm.irq_handler_list_low_tab[src].head;
>>> +        hnd_list_l = &adev->dm.irq_handler_list_low_tab[src];
>>>           hnd_list_h = &adev->dm.irq_handler_list_high_tab[src];
>>>           if (!list_empty(hnd_list_l) || !list_empty(hnd_list_h))
>>>               dc_interrupt_set(adev->dm.dc, src, true);
>>> @@ -497,20 +508,53 @@ int amdgpu_dm_irq_resume_late(struct amdgpu_device *adev)
>>>   static void amdgpu_dm_irq_schedule_work(struct amdgpu_device *adev,
>>>                       enum dc_irq_source irq_source)
>>>   {
>>> -    unsigned long irq_table_flags;
>>> -    struct work_struct *work = NULL;
>>>   -    DM_IRQ_TABLE_LOCK(adev, irq_table_flags);
>>> +    struct  list_head *handler_list = 
>>> &adev->dm.irq_handler_list_low_tab[irq_source];
>>> +    struct  amdgpu_dm_irq_handler_data *handler_data;
>>> +    bool    work_queued = false;
>>>   -    if (!list_empty(&adev->dm.irq_handler_list_low_tab[irq_source].head))
>>> -        work = &adev->dm.irq_handler_list_low_tab[irq_source].work;
>>> +    if (list_empty(handler_list))
>>> +        return;
>>>   -    DM_IRQ_TABLE_UNLOCK(adev, irq_table_flags);
>>> +    list_for_each_entry(handler_data, handler_list, list) {
>>> +
>>> +        if (!queue_work(system_highpri_wq, &handler_data->work)) {
>>> +            continue;
>>> +        } else {
>>> +            work_queued = true;
>>> +            break;
>>> +        }
>>> +    }
>>> +
>>> +    if (!work_queued) {
>>> +
>>> +        struct  amdgpu_dm_irq_handler_data *handler_data_add;
>>> +        /*get the amdgpu_dm_irq_handler_data of first item pointed by 
>>> handler_list*/
>>> +        handler_data = container_of(handler_list->next, struct 
>>> amdgpu_dm_irq_handler_data, list);
>>> +
>>> +        /*allocate a new amdgpu_dm_irq_handler_data*/
>>> +        handler_data_add = kzalloc(sizeof(*handler_data), GFP_KERNEL);
>>> +        if (!handler_data_add) {
>>> +            DRM_ERROR("DM_IRQ: failed to allocate irq handler!\n");
>>> +            return;
>>> +        }
>>> +
>>> +        /*copy new amdgpu_dm_irq_handler_data members from handler_data*/
>>> +        handler_data_add->handler       = handler_data->handler;
>>> +        handler_data_add->handler_arg   = handler_data->handler_arg;
>>> +        handler_data_add->dm            = handler_data->dm;
>>> +        handler_data_add->irq_source    = irq_source;
>>> +
>>> +        list_add_tail(&handler_data_add->list, handler_list);
>>
>>
>> At what place are you deleting completed work items from the handler_list ?
>>
>> Andrey
>>
> The new allocated work item handler_data_add is put at end of single list 
> handler_list. It is not deleted, but put into this list. In the future for 
> same interrupt source handling the previous allocated work items can be 
> reused.  So we do not have to reallocate new work items if previous interrupts 
> have not been handled by cpu. On other side system will keep all the allocated 
> work items at run time. Note, the new work item allocation only happens when 
> cpu has not handled previous interrupts yet, and new same type interrupts have 
> came.
>
> Thanks
>
> Xiaogang
>

I am still confused, how you avoid executing a second time a handler you 
previously allocated because first queue_work failed,
you always start iteration from beginning of the list and you never remove 
already successfully executed handlers.

Andrey


>>
>>> +
>>> +        INIT_WORK(&handler_data_add->work, dm_irq_work_func);
>>>   -    if (work) {
>>> -        if (!schedule_work(work))
>>> -            DRM_INFO("amdgpu_dm_irq_schedule_work FAILED src %d\n",
>>> -                        irq_source);
>>> +        if (queue_work(system_highpri_wq, &handler_data_add->work))
>>> +            DRM_DEBUG("__func__: a work_struct is allocated and queued, "
>>> +                     "src %d\n", irq_source);
>>> +        else
>>> +            DRM_ERROR("__func__: a new work_struct cannot be queued, "
>>> +                      "something is wrong, src %d\n", irq_source);
>>>       }
>>>     } 
>
>

--------------CBE56C0C9338737619F9A7BB
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 1/14/21 12:11 AM, Chen, Xiaogang
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:6ba05f63-12f2-73c5-33c5-4b29c6166d8b@amd.com">
      
      <div class="moz-cite-prefix">On 1/12/2021 10:54 PM, Grodzovsky,
        Andrey wrote:<br>
      </div>
      <blockquote type="cite" cite="mid:51a8727c-1ad0-8e7f-8c07-ed0b4bbed7a5@amd.com"><br>
        On 1/4/21 1:01 AM, Xiaogang.Chen wrote: <br>
        <blockquote type="cite">From: Xiaogang Chen <a class="moz-txt-link-rfc2396E" href="mailto:xiaogang.chen@amd.com" moz-do-not-send="true">
            &lt;xiaogang.chen@amd.com&gt;</a> <br>
          <br>
          amdgpu DM handles INTERRUPT_LOW_IRQ_CONTEXT interrupt(hpd,
          hpd_rx) by <br>
          using work queue and uses single work_struct. If previous
          interrupt <br>
          has not been handled new interrupts(same type) will be
          discarded and <br>
          driver just sends &quot;amdgpu_dm_irq_schedule_work FAILED&quot; message
          out. <br>
          If some important hpd, hpd_rx related interrupts are missed by
          driver <br>
          the hot (un)plug devices may cause system hang or unstable,
          such as <br>
          system resumes from S3 sleep with mst device connected. <br>
          <br>
          This patch dynamically allocates new
          amdgpu_dm_irq_handler_data for <br>
          new interrupts if previous INTERRUPT_LOW_IRQ_CONTEXT interrupt
          work <br>
          has not been handled. So the new interrupt works can be queued
          to the <br>
          same workqueue_struct, instead discard the new interrupts. <br>
          All allocated amdgpu_dm_irq_handler_data are put into a single
          linked <br>
          list and will be reused after. <br>
        </blockquote>
        <br>
        <br>
        I believe this creates a possible concurrency between already
        executing work item
        <br>
        and the new incoming one for which you allocate a new work item
        on the fly. While
        <br>
        handle_hpd_irq is serialized with aconnector-&gt;hpd_lock I am
        seeing that for handle_hpd_rx_irq
        <br>
        it's not locked for MST use case (which is the most frequently
        used with this interrupt).&nbsp; Did you
        <br>
        verified that handle_hpd_rx_irq is reentrant ? <br>
        <br>
      </blockquote>
      <p class="MsoPlainText">handle_hpd_rx_irq is put at a work queue.
        Its execution is serialized by the work queue. So there is no
        reentrant.</p>
    </blockquote>
    <p>You are using system_highpri_wq which has the property that it
      has multiple workers thread pool spread across all the<br>
      active CPUs, see all work queue definitions here
<a class="moz-txt-link-freetext" href="https://elixir.bootlin.com/linux/v5.11-rc3/source/include/linux/workqueue.h#L358">https://elixir.bootlin.com/linux/v5.11-rc3/source/include/linux/workqueue.h#L358</a><br>
      I beleieve that what you saying about no chance of reentrnacy
      would be correct if it would be same work item dequeued for
      execution<br>
      while previous instance is still running, see the explanation here
      -
<a class="moz-txt-link-freetext" href="https://elixir.bootlin.com/linux/v5.11-rc3/source/kernel/workqueue.c#L1435">https://elixir.bootlin.com/linux/v5.11-rc3/source/kernel/workqueue.c#L1435</a>.<br>
      Non reentrancy is guaranteed only for the same work item. If you
      want non reentrancy (full serializtion) for different work items
      you should create<br>
      you own single threaded work-queue using
      create_singlethread_workqueue</p>
    <p><br>
    </p>
    <blockquote type="cite" cite="mid:6ba05f63-12f2-73c5-33c5-4b29c6166d8b@amd.com">
      amdgpu_dm_irq_schedule_work does queuing of work(put
      handle_hpd_rx_irq into work queue). The first call is
      dm_irq_work_func, then call handle_hpd_rx_irq.
      <blockquote type="cite" cite="mid:51a8727c-1ad0-8e7f-8c07-ed0b4bbed7a5@amd.com"><br>
        <blockquote type="cite"><br>
          Signed-off-by: Xiaogang Chen <a class="moz-txt-link-rfc2396E" href="mailto:xiaogang.chen@amd.com" moz-do-not-send="true">
            &lt;xiaogang.chen@amd.com&gt;</a> <br>
          --- <br>
          &nbsp; drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h&nbsp; |&nbsp; 14 +--
          <br>
          &nbsp; .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_irq.c&nbsp; | 114
          ++++++++++++++------- <br>
          &nbsp; 2 files changed, 80 insertions(+), 48 deletions(-) <br>
          <br>
          diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
          b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
          <br>
          index c9d82b9..730e540 100644 <br>
          --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h <br>
          +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h <br>
          @@ -69,18 +69,6 @@ struct common_irq_params { <br>
          &nbsp; }; <br>
          &nbsp; &nbsp; /** <br>
          - * struct irq_list_head - Linked-list for low context IRQ
          handlers. <br>
          - * <br>
          - * @head: The list_head within &amp;struct handler_data <br>
          - * @work: A work_struct containing the deferred handler work
          <br>
          - */ <br>
          -struct irq_list_head { <br>
          -&nbsp;&nbsp;&nbsp; struct list_head head; <br>
          -&nbsp;&nbsp;&nbsp; /* In case this interrupt needs post-processing, 'work'
          will be queued*/ <br>
          -&nbsp;&nbsp;&nbsp; struct work_struct work; <br>
          -}; <br>
          - <br>
          -/** <br>
          &nbsp;&nbsp; * struct dm_compressor_info - Buffer info used by frame
          buffer compression <br>
          &nbsp;&nbsp; * @cpu_addr: MMIO cpu addr <br>
          &nbsp;&nbsp; * @bo_ptr: Pointer to the buffer object <br>
          @@ -270,7 +258,7 @@ struct amdgpu_display_manager { <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * Note that handlers are called in the same order as
          they were <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * registered (FIFO). <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; */ <br>
          -&nbsp;&nbsp;&nbsp; struct irq_list_head
          irq_handler_list_low_tab[DAL_IRQ_SOURCES_NUMBER]; <br>
          +&nbsp;&nbsp;&nbsp; struct list_head
          irq_handler_list_low_tab[DAL_IRQ_SOURCES_NUMBER]; <br>
          &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /** <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * @irq_handler_list_high_tab: <br>
          diff --git
          a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_irq.c
          b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_irq.c
          <br>
          index 3577785..ada344a 100644 <br>
          --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_irq.c <br>
          +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_irq.c <br>
          @@ -82,6 +82,7 @@ struct amdgpu_dm_irq_handler_data { <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct amdgpu_display_manager *dm; <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* DAL irq source which registered for this interrupt.
          */ <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; enum dc_irq_source irq_source; <br>
          +&nbsp;&nbsp;&nbsp; struct work_struct work; <br>
          &nbsp; }; <br>
          &nbsp; &nbsp; #define DM_IRQ_TABLE_LOCK(adev, flags) \ <br>
          @@ -111,20 +112,10 @@ static void
          init_handler_common_data(struct amdgpu_dm_irq_handler_data
          *hcd,
          <br>
          &nbsp;&nbsp; */ <br>
          &nbsp; static void dm_irq_work_func(struct work_struct *work) <br>
          &nbsp; { <br>
          -&nbsp;&nbsp;&nbsp; struct irq_list_head *irq_list_head = <br>
          -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; container_of(work, struct irq_list_head, work); <br>
          -&nbsp;&nbsp;&nbsp; struct list_head *handler_list =
          &amp;irq_list_head-&gt;head; <br>
          -&nbsp;&nbsp;&nbsp; struct amdgpu_dm_irq_handler_data *handler_data; <br>
          - <br>
          -&nbsp;&nbsp;&nbsp; list_for_each_entry(handler_data, handler_list, list) { <br>
          -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DRM_DEBUG_KMS(&quot;DM_IRQ: work_func: for dal_src=%d\n&quot;,
          <br>
          -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; handler_data-&gt;irq_source); <br>
          +&nbsp;&nbsp;&nbsp; struct amdgpu_dm_irq_handler_data *handler_data = <br>
          +&nbsp;&nbsp;&nbsp;&nbsp; container_of(work, struct amdgpu_dm_irq_handler_data,
          work); <br>
          &nbsp; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DRM_DEBUG_KMS(&quot;DM_IRQ: schedule_work: for
          dal_src=%d\n&quot;, <br>
          -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; handler_data-&gt;irq_source); <br>
          - <br>
          -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          handler_data-&gt;handler(handler_data-&gt;handler_arg); <br>
          -&nbsp;&nbsp;&nbsp; } <br>
          +&nbsp;&nbsp;&nbsp; handler_data-&gt;handler(handler_data-&gt;handler_arg); <br>
          &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Call a DAL subcomponent which registered for
          interrupt notification <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * at INTERRUPT_LOW_IRQ_CONTEXT. <br>
          @@ -156,7 +147,7 @@ static struct list_head
          *remove_irq_handler(struct amdgpu_device *adev,
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break; <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case INTERRUPT_LOW_IRQ_CONTEXT: <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; default: <br>
          -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; hnd_list =
          &amp;adev-&gt;dm.irq_handler_list_low_tab[irq_source].head; <br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; hnd_list =
          &amp;adev-&gt;dm.irq_handler_list_low_tab[irq_source]; <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break; <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } <br>
          &nbsp; @@ -287,7 +278,8 @@ void
          *amdgpu_dm_irq_register_interrupt(struct amdgpu_device *adev,
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break; <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case INTERRUPT_LOW_IRQ_CONTEXT: <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; default: <br>
          -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; hnd_list =
          &amp;adev-&gt;dm.irq_handler_list_low_tab[irq_source].head; <br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; hnd_list =
          &amp;adev-&gt;dm.irq_handler_list_low_tab[irq_source]; <br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; INIT_WORK(&amp;handler_data-&gt;work,
          dm_irq_work_func); <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break; <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } <br>
          &nbsp; @@ -369,7 +361,7 @@ void
          amdgpu_dm_irq_unregister_interrupt(struct amdgpu_device *adev,
          <br>
          &nbsp; int amdgpu_dm_irq_init(struct amdgpu_device *adev) <br>
          &nbsp; { <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int src; <br>
          -&nbsp;&nbsp;&nbsp; struct irq_list_head *lh; <br>
          +&nbsp;&nbsp;&nbsp; struct list_head *lh; <br>
          &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DRM_DEBUG_KMS(&quot;DM_IRQ\n&quot;); <br>
          &nbsp; @@ -378,9 +370,7 @@ int amdgpu_dm_irq_init(struct
          amdgpu_device *adev) <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for (src = 0; src &lt; DAL_IRQ_SOURCES_NUMBER; src++) {
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* low context handler list init */ <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; lh = &amp;adev-&gt;dm.irq_handler_list_low_tab[src];
          <br>
          -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; INIT_LIST_HEAD(&amp;lh-&gt;head); <br>
          -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; INIT_WORK(&amp;lh-&gt;work, dm_irq_work_func); <br>
          - <br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; INIT_LIST_HEAD(lh); <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* high context handler init */ <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          INIT_LIST_HEAD(&amp;adev-&gt;dm.irq_handler_list_high_tab[src]);
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } <br>
          @@ -397,8 +387,11 @@ int amdgpu_dm_irq_init(struct
          amdgpu_device *adev) <br>
          &nbsp; void amdgpu_dm_irq_fini(struct amdgpu_device *adev) <br>
          &nbsp; { <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int src; <br>
          -&nbsp;&nbsp;&nbsp; struct irq_list_head *lh; <br>
          +&nbsp;&nbsp;&nbsp; struct list_head *lh; <br>
          +&nbsp;&nbsp;&nbsp; struct list_head *entry, *tmp; <br>
          +&nbsp;&nbsp;&nbsp; struct amdgpu_dm_irq_handler_data *handler; <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; unsigned long irq_table_flags; <br>
          + <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DRM_DEBUG_KMS(&quot;DM_IRQ: releasing resources.\n&quot;); <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for (src = 0; src &lt; DAL_IRQ_SOURCES_NUMBER; src++) {
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DM_IRQ_TABLE_LOCK(adev, irq_table_flags); <br>
          @@ -407,7 +400,15 @@ void amdgpu_dm_irq_fini(struct
          amdgpu_device *adev) <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * (because no code can schedule a new one). */ <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; lh = &amp;adev-&gt;dm.irq_handler_list_low_tab[src];
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DM_IRQ_TABLE_UNLOCK(adev, irq_table_flags); <br>
          -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; flush_work(&amp;lh-&gt;work); <br>
          + <br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!list_empty(lh)) { <br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; list_for_each_safe(entry, tmp, lh) { <br>
          + <br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; handler = list_entry(entry, struct
          amdgpu_dm_irq_handler_data, <br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; list); <br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; flush_work(&amp;handler-&gt;work); <br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } <br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } <br>
          &nbsp; } <br>
          &nbsp; @@ -417,6 +418,8 @@ int amdgpu_dm_irq_suspend(struct
          amdgpu_device *adev) <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct list_head *hnd_list_h; <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct list_head *hnd_list_l; <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; unsigned long irq_table_flags; <br>
          +&nbsp;&nbsp;&nbsp; struct list_head *entry, *tmp; <br>
          +&nbsp;&nbsp;&nbsp; struct amdgpu_dm_irq_handler_data *handler; <br>
          &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DM_IRQ_TABLE_LOCK(adev, irq_table_flags); <br>
          &nbsp; @@ -427,14 +430,22 @@ int amdgpu_dm_irq_suspend(struct
          amdgpu_device *adev) <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * will be disabled from manage_dm_interrupts on disable
          CRTC. <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; */ <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for (src = DC_IRQ_SOURCE_HPD1; src &lt;=
          DC_IRQ_SOURCE_HPD6RX; src++) { <br>
          -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; hnd_list_l =
          &amp;adev-&gt;dm.irq_handler_list_low_tab[src].head; <br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; hnd_list_l =
          &amp;adev-&gt;dm.irq_handler_list_low_tab[src]; <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; hnd_list_h =
          &amp;adev-&gt;dm.irq_handler_list_high_tab[src]; <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!list_empty(hnd_list_l) ||
          !list_empty(hnd_list_h)) <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dc_interrupt_set(adev-&gt;dm.dc, src, false); <br>
          &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DM_IRQ_TABLE_UNLOCK(adev, irq_table_flags); <br>
          -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          flush_work(&amp;adev-&gt;dm.irq_handler_list_low_tab[src].work);
          <br>
          &nbsp; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!list_empty(hnd_list_l)) { <br>
          + <br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; list_for_each_safe(entry, tmp, hnd_list_l) { <br>
          + <br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; handler = list_entry(entry, struct
          amdgpu_dm_irq_handler_data, <br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; list); <br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; flush_work(&amp;handler-&gt;work); <br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } <br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DM_IRQ_TABLE_LOCK(adev, irq_table_flags); <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } <br>
          &nbsp; @@ -454,7 +465,7 @@ int amdgpu_dm_irq_resume_early(struct
          amdgpu_device *adev) <br>
          &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* re-enable short pulse interrupts HW interrupt */ <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for (src = DC_IRQ_SOURCE_HPD1RX; src &lt;=
          DC_IRQ_SOURCE_HPD6RX; src++) { <br>
          -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; hnd_list_l =
          &amp;adev-&gt;dm.irq_handler_list_low_tab[src].head; <br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; hnd_list_l =
          &amp;adev-&gt;dm.irq_handler_list_low_tab[src]; <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; hnd_list_h =
          &amp;adev-&gt;dm.irq_handler_list_high_tab[src]; <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!list_empty(hnd_list_l) ||
          !list_empty(hnd_list_h)) <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dc_interrupt_set(adev-&gt;dm.dc, src, true); <br>
          @@ -480,7 +491,7 @@ int amdgpu_dm_irq_resume_late(struct
          amdgpu_device *adev) <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * will be enabled from manage_dm_interrupts on enable
          CRTC. <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; */ <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for (src = DC_IRQ_SOURCE_HPD1; src &lt;=
          DC_IRQ_SOURCE_HPD6; src++) { <br>
          -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; hnd_list_l =
          &amp;adev-&gt;dm.irq_handler_list_low_tab[src].head; <br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; hnd_list_l =
          &amp;adev-&gt;dm.irq_handler_list_low_tab[src]; <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; hnd_list_h =
          &amp;adev-&gt;dm.irq_handler_list_high_tab[src]; <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!list_empty(hnd_list_l) ||
          !list_empty(hnd_list_h)) <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dc_interrupt_set(adev-&gt;dm.dc, src, true); <br>
          @@ -497,20 +508,53 @@ int amdgpu_dm_irq_resume_late(struct
          amdgpu_device *adev) <br>
          &nbsp; static void amdgpu_dm_irq_schedule_work(struct amdgpu_device
          *adev, <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; enum dc_irq_source irq_source) <br>
          &nbsp; { <br>
          -&nbsp;&nbsp;&nbsp; unsigned long irq_table_flags; <br>
          -&nbsp;&nbsp;&nbsp; struct work_struct *work = NULL; <br>
          &nbsp; -&nbsp;&nbsp;&nbsp; DM_IRQ_TABLE_LOCK(adev, irq_table_flags); <br>
          +&nbsp;&nbsp;&nbsp; struct&nbsp; list_head *handler_list =
          &amp;adev-&gt;dm.irq_handler_list_low_tab[irq_source];
          <br>
          +&nbsp;&nbsp;&nbsp; struct&nbsp; amdgpu_dm_irq_handler_data *handler_data; <br>
          +&nbsp;&nbsp;&nbsp; bool&nbsp;&nbsp;&nbsp; work_queued = false; <br>
          &nbsp; -&nbsp;&nbsp;&nbsp; if
(!list_empty(&amp;adev-&gt;dm.irq_handler_list_low_tab[irq_source].head))<br>
          -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; work =
          &amp;adev-&gt;dm.irq_handler_list_low_tab[irq_source].work; <br>
          +&nbsp;&nbsp;&nbsp; if (list_empty(handler_list)) <br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return; <br>
          &nbsp; -&nbsp;&nbsp;&nbsp; DM_IRQ_TABLE_UNLOCK(adev, irq_table_flags); <br>
          +&nbsp;&nbsp;&nbsp; list_for_each_entry(handler_data, handler_list, list) { <br>
          + <br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!queue_work(system_highpri_wq,
          &amp;handler_data-&gt;work)) { <br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; continue; <br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } else { <br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; work_queued = true; <br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break; <br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } <br>
          +&nbsp;&nbsp;&nbsp; } <br>
          + <br>
          +&nbsp;&nbsp;&nbsp; if (!work_queued) { <br>
          + <br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct&nbsp; amdgpu_dm_irq_handler_data *handler_data_add;
          <br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /*get the amdgpu_dm_irq_handler_data of first item
          pointed by handler_list*/
          <br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; handler_data = container_of(handler_list-&gt;next,
          struct amdgpu_dm_irq_handler_data, list);
          <br>
          + <br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /*allocate a new amdgpu_dm_irq_handler_data*/ <br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; handler_data_add = kzalloc(sizeof(*handler_data),
          GFP_KERNEL); <br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!handler_data_add) { <br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DRM_ERROR(&quot;DM_IRQ: failed to allocate irq
          handler!\n&quot;); <br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return; <br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } <br>
          + <br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /*copy new amdgpu_dm_irq_handler_data members from
          handler_data*/ <br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; handler_data_add-&gt;handler&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
          handler_data-&gt;handler; <br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; handler_data_add-&gt;handler_arg&nbsp;&nbsp; =
          handler_data-&gt;handler_arg; <br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; handler_data_add-&gt;dm&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
          handler_data-&gt;dm; <br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; handler_data_add-&gt;irq_source&nbsp;&nbsp;&nbsp; = irq_source; <br>
          + <br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; list_add_tail(&amp;handler_data_add-&gt;list,
          handler_list); <br>
        </blockquote>
        <br>
        <br>
        At what place are you deleting completed work items from the
        handler_list ? <br>
        <br>
        Andrey <br>
        <br>
      </blockquote>
      <p class="MsoPlainText">The new allocated work item
        handler_data_add is put at end of single list handler_list. It
        is not deleted, but put into this list. In the future for same
        interrupt source handling the previous allocated work items can
        be reused.&nbsp; So we do not have to reallocate new work items if
        previous interrupts have not been handled by cpu. On other side
        system will keep all the allocated work items at run time. Note,
        the new work item allocation only happens when cpu has not
        handled previous interrupts yet, and new same type interrupts
        have came. <br>
      </p>
      <p class="MsoPlainText">Thanks<br>
      </p>
      <p class="MsoPlainText">Xiaogang<br>
      </p>
    </blockquote>
    <p><br>
    </p>
    <p>I am still confused, how you avoid executing a second time a
      handler you previously allocated because first queue_work failed,<br>
      you always start iteration from beginning of the list and you
      never remove already successfully executed handlers.</p>
    <p>Andrey</p>
    <p><br>
    </p>
    <blockquote type="cite" cite="mid:6ba05f63-12f2-73c5-33c5-4b29c6166d8b@amd.com">
      <p class="MsoPlainText">
      </p>
      <blockquote type="cite" cite="mid:51a8727c-1ad0-8e7f-8c07-ed0b4bbed7a5@amd.com"><br>
        <blockquote type="cite">+ <br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; INIT_WORK(&amp;handler_data_add-&gt;work,
          dm_irq_work_func); <br>
          &nbsp; -&nbsp;&nbsp;&nbsp; if (work) { <br>
          -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!schedule_work(work)) <br>
          -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DRM_INFO(&quot;amdgpu_dm_irq_schedule_work FAILED src
          %d\n&quot;, <br>
          -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; irq_source); <br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (queue_work(system_highpri_wq,
          &amp;handler_data_add-&gt;work)) <br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DRM_DEBUG(&quot;__func__: a work_struct is allocated
          and queued, &quot; <br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;src %d\n&quot;, irq_source); <br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else <br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DRM_ERROR(&quot;__func__: a new work_struct cannot be
          queued, &quot; <br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;something is wrong, src %d\n&quot;,
          irq_source); <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } <br>
          &nbsp; &nbsp; } </blockquote>
      </blockquote>
      <br>
      <p><br>
      </p>
    </blockquote>
  </body>
</html>

--------------CBE56C0C9338737619F9A7BB--

--===============1716410449==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1716410449==--
