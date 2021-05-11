Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C21637A9E9
	for <lists+dri-devel@lfdr.de>; Tue, 11 May 2021 16:52:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 642B16EA58;
	Tue, 11 May 2021 14:52:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2074.outbound.protection.outlook.com [40.107.244.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 302326E5CF;
 Tue, 11 May 2021 14:52:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kXgK7TeVCGzCo0T8a3YGAl5y677BijffAIjV+WBJ8NmQzv9zSa2kNzEhakHJc58/pJf8PiGttU2OuLxEaCb5xKLGThXd1t0AIRBn33pk1v8/14r4SHT3qSyMnI02tngzEp9so6zZwKFKnoHcxf3MQkDvDMeOw2sfO7P5LraV+exkqLwYd7GKjDfuaMR8N9XDstvK6USVaXEwK+OpYk517uRVllhCEojerrEedBS+KmNRnE0s1UA+rxMYtmQ6VrzhRoUvuuxXnANBObnRcCl+VZPD52rNYQI3O0blAOFOLjvccPpaCwAV74ABjYExFim3dZ+rUbJLLhuNCnfI9BBcfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E6aneeaHTVTvXAydXphYgKKOEtqIpSUmu5ae+sbnIJc=;
 b=Bhok0rkswEJJTrNk8RHwJwTJ+Oze3VwslM3gPl//puvLoy4q01N+XpvKc78aI4CpRDtQI5r97nRN0iTkYyr9xQ0ll21jwuwDm6Xk1XzN3JZ8pbjZwcrfD12rEMroIk00xHKEWdrUkJtd8JkUaivFPAktaC3O20YZawXW3/HDmctOlsbsSBKE7IQxRxjPEX3qq8eEY+GvheUeJJymyfrC7txtapsggluz7lyIh+d8EmpruK0l/DW0692YeZlS4OLJyUCJ9gwMZXrwl5NwivplwTQcdrCFIiOSRHyzxz5p+I0eekpkAsEJ9tlRla6YRXjvf8xfFewg+rLOW0olSUr4Kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E6aneeaHTVTvXAydXphYgKKOEtqIpSUmu5ae+sbnIJc=;
 b=X6EXm721Qy9Fcrr6XqFmt5lOa7ILSx1mZVmx5D4VIu+yZbVvQ7j0jBqMvw3EYWi7ZR2nsUF+2h3UgMZneLe9PCtBaNYxYYuz0bzEVjqPdClqXiK0K9lSaaWnfuKa0ZADI5hVqX/AcxZiTj0CjEp4wbzGw2Q/J1S0T0r6tViWMQE=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB4623.namprd12.prod.outlook.com (2603:10b6:805:e9::17)
 by SN6PR12MB2703.namprd12.prod.outlook.com (2603:10b6:805:75::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.29; Tue, 11 May
 2021 14:52:47 +0000
Received: from SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::ad51:8c49:b171:856c]) by SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::ad51:8c49:b171:856c%7]) with mapi id 15.20.4108.031; Tue, 11 May 2021
 14:52:47 +0000
Subject: Re: [PATCH v6 04/16] drm/amdkfd: Split kfd suspend from devie exit
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-pci@vger.kernel.org, daniel.vetter@ffwll.ch, Harry.Wentland@amd.com
References: <20210510163625.407105-1-andrey.grodzovsky@amd.com>
 <20210510163625.407105-5-andrey.grodzovsky@amd.com>
 <8805dbc5-a607-a36a-d069-6c7c8b72a6b3@gmail.com>
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Message-ID: <3fcc8a49-8e7a-40ad-81fe-e37426008cd0@amd.com>
Date: Tue, 11 May 2021 10:52:44 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <8805dbc5-a607-a36a-d069-6c7c8b72a6b3@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [2607:fea8:3edf:49b0:6a5:47b8:e610:f6a3]
X-ClientProxiedBy: YTXPR0101CA0015.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::28) To SN6PR12MB4623.namprd12.prod.outlook.com
 (2603:10b6:805:e9::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2607:fea8:3edf:49b0:6a5:47b8:e610:f6a3]
 (2607:fea8:3edf:49b0:6a5:47b8:e610:f6a3) by
 YTXPR0101CA0015.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00::28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4108.30 via Frontend Transport; Tue, 11 May 2021 14:52:46 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 33fc0c14-64a1-4b06-dd80-08d9148c70ea
X-MS-TrafficTypeDiagnostic: SN6PR12MB2703:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR12MB2703D89C22AC92D97DDA1836EA539@SN6PR12MB2703.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2657;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uEqkXmnow5pZbDKPqp63MJAETyRkHOwgwqvzF7pX0sYQHm28yInRcG0hxRyCmxx8XBcyzz1NExWicVIRYbiXLx3WCpIybCfXDfRTtbr09COfy6nU/O+UDLNp3/1a/zStvz2rJwIeQWJI3MSLfjR9k+UNcoIsoJI0bqra8dlDVbMKidrxMfC2kaKrzKHdj6TtQnCtfPyC078I+l7oYRkrTZOauGEWVTAMM72aVDeXKAYvRwiZJCOur/CXrTbhgD/metj4z4pW+00XHuEtsyZfssn3AO120uqhNEUbTFkICeyvUq2+ZfYRKda5ZrejeSpcItEHyPHWX/Zyucm4tZLQgq/Oo+aRM8ppTE6YyJu1noZMPltACnbshgy8VuKF4skTch96hj5Tn7dJQkSKJ8WzwKHt3PU7XyPB0ATCNWk1h6WfMY8nODnwZTIyDOVtJAZVxiPFTXJWggiQOSmve33+zBWcBtD5bbLs2e1DK57gLZfBCkCFxKiqPjv/qG9LZZLRVS9VE49aaM7E6ChKjmcnSSFgtvKbLkNjyrPJKPpiC7TOcwg7VAYi2qShhTP7GPjaGE/VsmiBg59i66zmRG4syZRXW8VWfVwolIhFZLEOYjsXD/G/QFC8RYfMcOMaSLn6WfUgQMFI1lmJEWjxoDxBXNmb2nUI4xzyk/TrN4JTS9oTnmA1oRS1rsWoEZ2mZO4+
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB4623.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(376002)(39860400002)(346002)(396003)(136003)(2906002)(5660300002)(31686004)(36756003)(83380400001)(66574015)(16526019)(6636002)(478600001)(6486002)(4326008)(38100700002)(66556008)(8936002)(53546011)(31696002)(66946007)(52116002)(2616005)(8676002)(44832011)(86362001)(66476007)(316002)(186003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?bEVCMjJsNDJXcjNOZTJwUUtwVk5nby9SOTdKeEw3RC9HdWZlMHdpcXFjaUh4?=
 =?utf-8?B?Y0ROWUsxZ3NGOHV4eEV2SWsyd3g4bGQyWG55cmpaLzYrKy9MVHU0OGZveU11?=
 =?utf-8?B?VUc0ZWJsdGZGSmY0SEh3c2RPYnNzbWNJeWRhQ3VwNXdzTFE2N1p4NnRDM0FP?=
 =?utf-8?B?bTlpOW10Y09PSE1lUGYrUXp0aGpWYlVhZGY1R2R4dVBuRTF6bjNYRjhYSElp?=
 =?utf-8?B?a2V0aVQxSEl4SmdURjNtUUU0TWZwd2FQbEVkR1llN0tRNTF5eGxMRXkxdXpu?=
 =?utf-8?B?RUFpNVZxdGVFTDNDTlE3bnd1T0I1d09BR0xWSzZDNzZhbUo0OUJBQjZZZ1NU?=
 =?utf-8?B?QWI1cjU4TVc2elJBdGxKb1ZkOUFxeThaTS9GdGpPbmx6WTdyeXl6NzMzQmtU?=
 =?utf-8?B?blkzbDZlUXlTWWU3cHF1eUN4NmtIU0kwMFJvTC9iTmRrSWJUeUdjditRSHdw?=
 =?utf-8?B?WVJHT1JiTU1yZWJzREVwOUZGdThTb3RiZVRTZi9vWnkrdUE2TVN2NEtRUDVM?=
 =?utf-8?B?eURlbGIwM3MrZ1dlTWIxMURqc21vRjRGcks5aUIwdmxScW9KZHpKYk0xNUxt?=
 =?utf-8?B?MHV5L2pQVk9xYmJqcUI5TDRyaWsycUxkZXJXaTJaWW9meElaOWRCenIwUEJl?=
 =?utf-8?B?emVONmJVK0Ftc1BxcTU5SGE0QnFWMlhMT0FDakk0bjRQRTBiNlJ3bk1tQm1Q?=
 =?utf-8?B?MWhkOHFIZ1lMR1dydXpNRlFaOEF1QjZHMGpKT25pdG5mVkJaaUFHZFN3ZzNs?=
 =?utf-8?B?NUhCNm9tYnR1YVBlVnlGN0hKTytUYkpIMEh1ZzdSZUNjMUFQaytDTm96dTZD?=
 =?utf-8?B?SkkrUDdlRmZUU2dXd1lSRXVDbXhKYVJPUUpTSXNyaVlJYnlBT0dZd25yaXFP?=
 =?utf-8?B?cjJ2bFYxMjUwMFRNREpuRnJEV1A2VEh6QUdzSW1TMDNQRi81SDFHeHQybzFx?=
 =?utf-8?B?Um9IY0JHay9oNTRMMGRVYjBROUFvTWlKM09PaHBZaVN5Um11aXR6VVgrc0tY?=
 =?utf-8?B?RDVUekQvSlZ4TzhCU1hXUmI2c0htdXY2ZUNjd3FmUkZZQXptQ3lTbUd2K0ZL?=
 =?utf-8?B?cFNOV0haM21hM3BsQlR6TWlScUt1L2UwcFZkZm5NeCtZU0cwTkNZYzcvRllm?=
 =?utf-8?B?WGM4Zk43eVh5R243c2VIU0xYbVQ5alZjTWhVYzI1YWhSSndsVlBFdXYyemhl?=
 =?utf-8?B?QS8xNlowQ1dybW94NmY5bjV6UzRqZXpTU2p6eldmYWQ0a1RaRHhXc1hhYTdq?=
 =?utf-8?B?QzVBQ0p3blAyS1c2MjF6S01oQXg4RDNsa3BQZ1AwSkFvMi8wajZMWHZyd3pv?=
 =?utf-8?B?L2J6RDhyZE9IelZCa1AxaHhrQVFMck05N3hNd1ZNY2dXLzlQa2xxWUcxMVlh?=
 =?utf-8?B?NVhSOVNMZkJtWEdGTTRZVDBqZ1dCUEw5MVg4V3A3UHUraWRSczMzYTZxMkN2?=
 =?utf-8?B?Z0diME0vQ1hJTnFmV0dyZWZXc1pjNW1NK2doNE5EdnRkdlZCSmpMY3dyY1hw?=
 =?utf-8?B?VkxDcmZaeFhOL2t3NTYwa3FsdjAxaHpwUUErNHBXbXlNcTg1VTZFL3loT1p5?=
 =?utf-8?B?WHJXc1hZbmlkTGhtcitYWm5ncnVVSEw2TWVGS3RuTHJCZThUTjRhTjZEa3Bl?=
 =?utf-8?B?RlYrUVB3czdDcFVFVTdkV3ZNWUlGOCtSMG1McXovT3dsWU95ME5nOGF4Ym1v?=
 =?utf-8?B?bGtpSXBnYjB6TExXN0hJVkdnNmphdCtPUkx6M1JPM3FvNGlyVi80WU9XWktL?=
 =?utf-8?B?bTdiWld2c0kzVmlIc29kSzJEbjYvc2lTWGxpU2FDb2w5RnNFVHpHQjFsZ29h?=
 =?utf-8?B?VFRKSUxERFQrZHZCbWgzbXFqVHZlRXVOR0xzenlkMWk3eXE2cW5CZ3ViRVlC?=
 =?utf-8?Q?0yZHrACqDx3fr?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33fc0c14-64a1-4b06-dd80-08d9148c70ea
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB4623.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2021 14:52:47.7040 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aRJIxF2RypkU5wzWk2Uxe4GCOXvF5kDuoPlS72t91fy2/AGZMyeqrLK2LOw3SYC6dSuEhpQT1rKHQvjFGTNRSQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB2703
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
Cc: Alexander.Deucher@amd.com, gregkh@linuxfoundation.org, helgaas@kernel.org,
 Felix.Kuehling@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2021-05-11 2:40 a.m., Christian König wrote:
> Am 10.05.21 um 18:36 schrieb Andrey Grodzovsky:
>> Helps to expdite HW related stuff to amdgpu_pci_remove
>>
>> Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
>> ---
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c | 2 +-
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h | 2 +-
>>   drivers/gpu/drm/amd/amdkfd/kfd_device.c    | 3 ++-
>>   3 files changed, 4 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c 
>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c
>> index 5f6696a3c778..2b06dee9a0ce 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c
>> @@ -170,7 +170,7 @@ void amdgpu_amdkfd_device_init(struct 
>> amdgpu_device *adev)
>>       }
>>   }
>> -void amdgpu_amdkfd_device_fini(struct amdgpu_device *adev)
>> +void amdgpu_amdkfd_device_fini_sw(struct amdgpu_device *adev)
>>   {
>>       if (adev->kfd.dev) {
>>           kgd2kfd_device_exit(adev->kfd.dev);
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h 
>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
>> index 14f68c028126..f8e10af99c28 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
>> @@ -127,7 +127,7 @@ void amdgpu_amdkfd_interrupt(struct amdgpu_device 
>> *adev,
>>               const void *ih_ring_entry);
>>   void amdgpu_amdkfd_device_probe(struct amdgpu_device *adev);
>>   void amdgpu_amdkfd_device_init(struct amdgpu_device *adev);
>> -void amdgpu_amdkfd_device_fini(struct amdgpu_device *adev);
>> +void amdgpu_amdkfd_device_fini_sw(struct amdgpu_device *adev);
>>   int amdgpu_amdkfd_submit_ib(struct kgd_dev *kgd, enum 
>> kgd_engine_type engine,
>>                   uint32_t vmid, uint64_t gpu_addr,
>>                   uint32_t *ib_cmd, uint32_t ib_len);
>> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_device.c 
>> b/drivers/gpu/drm/amd/amdkfd/kfd_device.c
>> index 357b9bf62a1c..ab6d2a43c9a3 100644
>> --- a/drivers/gpu/drm/amd/amdkfd/kfd_device.c
>> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_device.c
>> @@ -858,10 +858,11 @@ bool kgd2kfd_device_init(struct kfd_dev *kfd,
>>       return kfd->init_complete;
>>   }
>> +
>> +
> 
> Looks like unnecessary white space change to me.
> 
>>   void kgd2kfd_device_exit(struct kfd_dev *kfd)
>>   {
>>       if (kfd->init_complete) {
>> -        kgd2kfd_suspend(kfd, false);
> 
> Where is the call to this function now?
> 
> Christian.

In patch 'drm/amdgpu: Add early fini callback' in
amdgpu_device_ip_fini_early->amdgpu_amdkfd_suspend->kgd2kfd_suspend

Andrey

> 
>>           device_queue_manager_uninit(kfd->dqm);
>>           kfd_interrupt_exit(kfd);
>>           kfd_topology_remove_device(kfd);
> 
