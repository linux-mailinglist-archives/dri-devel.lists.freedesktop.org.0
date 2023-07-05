Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B70F74806C
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jul 2023 11:06:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3DD010E224;
	Wed,  5 Jul 2023 09:06:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 934F110E21F;
 Wed,  5 Jul 2023 09:06:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FOsSrVkOpINcCvG5wBtu6np6d1tsZjxZBh3G5FQ573NvVW+EitHgtkaYcbUrm9Ky8QXUfo5UG7eswhyNd6LXu002BSFKxnhHc/xM/NtFGpFHmrmjmsFuOTwch04KxZwtzWX8iyuXCWXtZApsvMpdW4RQnYqr2Cft9h0jDIAQMCFakzsmrP8xw5R0vMqF3Cw+X/4zKrJSL9W7HvnUCkZZ312hsxXXZZDe3QwUueO7YD6Nh1WSc8QD7iI0aK5V3rydslrboEYGQKn8Rzp+N8c8Y83pYaevP19dj2R8fZzyCoTy7fDNc//N3lNZ/EByZbkyQg0JoIpWOiPYm3KPpOrl3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xbQUnz8YLkUy55HdhKQFrLSfGTyaSantIxy8pjIKpXU=;
 b=hDT/stUE1y8SDX/v15VNdffDMdGyQ2FsERIvKoXrlCc5T+DcDiUl48hoo50AeenSXFWHcvRA+SMD/+bLg0pXiw4yw8kmbqSYHlcUGrYEsk6cPDb0lIpLXYCqZynBHo1hT2Z6FXt531Of4wF3/etbHisVERGhKQp639J03w/rGDqst6l2LQ63Y2oiD6P5peOqSOunwyCcS6nLe59QWWnPi5Ua/QQyfAqP54FVmaqdjERn2BcX5usmFOsd+k0SvguYAwmOZqykDeoP4tcHQovtYcAnp0VrLg28yTWEuf7wtoQPJ4eYhInpGaRXw2HzyaB+BM+fKDy8c1lXwhyUFkt9eA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xbQUnz8YLkUy55HdhKQFrLSfGTyaSantIxy8pjIKpXU=;
 b=YfjngGO5Fuw4PwRuvtvoV3g+UW90WT2wI7THpA++sAYBTh0hh5Yl7/i9NXR0Q6GmAC8JbmTnzOsJ/ZUmW3qlhyukDWviMPwTM2RYXqGba2hfomhI8lGa2+g6WLDVXEAakHqmMUKsIsQYZ7t+fbztWvwT6xWXcaj7oJ8WTsPArdM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by PH7PR12MB6417.namprd12.prod.outlook.com (2603:10b6:510:1ff::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.24; Wed, 5 Jul
 2023 09:06:34 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::384a:95a4:8819:ee84]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::384a:95a4:8819:ee84%7]) with mapi id 15.20.6565.016; Wed, 5 Jul 2023
 09:06:34 +0000
Message-ID: <56a6bb6b-f934-87c6-e30b-612670ff8800@amd.com>
Date: Wed, 5 Jul 2023 11:06:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] drm/ttm: fix one use-after-free
Content-Language: en-US
To: Lang Yu <Lang.Yu@amd.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
References: <20230705053544.346139-1-Lang.Yu@amd.com>
 <ZKUqXybB2yCIinNX@lang-desktop>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <ZKUqXybB2yCIinNX@lang-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0033.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:14::20) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|PH7PR12MB6417:EE_
X-MS-Office365-Filtering-Correlation-Id: 64a0e6b2-676f-4209-4a5d-08db7d372132
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oz519TyygXnGuESuW7hDzQD7M8OJ//WVTzIjnwwEoqETK7GD0O9bJpCIXM970D53gSDFiGytURBSRB0BaTaKrKSTjFnDIlE1+g6WKyciu80Ak5wNEMEcQnjgmQpRlnrndprTcu/jHMzWPqUVXzDr4LFrDbx2kx3hwk+4Zr8LICs0US5IBBQRFINlDY5G1gCTfbG+Je5QbRutfUzh+KeDT7d4vTSk071bzLMsEDvsh2hrtqEkc7OCfpT5nxIHcjUKbSYDdzH2D2R40m5Njmqln8uIBAwUuoSxk2RrVFCTn7hiOKvlE1jPzcf+qqsW70uGyFVf/QcIssDOVHQnHLM5wvtfu8qcH/8ZJ/vTPL9tcoqi+dFMSZByJ92XdnFF5xZ7EM2DRRxHrJgW7yDFlpdLqwRVU9tJWgfhTQ57HkBuKQfFjc4EY84ZacGL4Egc/0OBtRx37hgcn/efFh7Xhkkx7gZoXB0lJXK2fDuO+TyM8s9o+aWy0Lxpf1YWBsoQEx3MAPIwfASlm50q15LwzwWgkQT8MKw8YgPKLtn9DAMiXmT4Q72kFABWiXvF0XpjLzjvGhDFZIfx0iLjo+aH6d+o7AoJk/cghCWn7t7+27bmLSDeH34qXvmHXHb2dcUsOo6Y7HeozCRsG+d8dnJ5igGMtA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(346002)(376002)(396003)(39860400002)(366004)(136003)(451199021)(186003)(6512007)(6506007)(31686004)(86362001)(31696002)(6666004)(478600001)(2616005)(6486002)(38100700002)(66946007)(66556008)(316002)(66476007)(83380400001)(450100002)(5660300002)(41300700001)(2906002)(8676002)(36756003)(8936002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eWlqQzdYNUlGYnNlaXVEZm84cElEOUNmdHJQWnNqa3V6YWdEOTh5bm1YQzhC?=
 =?utf-8?B?NFBxNEtDQmgwaUQyWEtid3V4cDNDOUlnNXdJL1NHVlhFTkNKaFBVY3MrdGZK?=
 =?utf-8?B?UTA0NWxCUEJhUEttL1V0TVJ6ZllxWkllempOdmczYVRGZGRMdEZMS0k5WDk3?=
 =?utf-8?B?MWJEZ3MrT1ZIcWorbEM4OGhMd01JTFE0TU5IZ2JjTTFjYmtpd1gyVXc1RFZn?=
 =?utf-8?B?UkRNQTN0YjdWU0VyWC9vQVJ5WGtDNXYvTjVQZUZ3eTZjOWY3MVhZcys0T2VP?=
 =?utf-8?B?ZVUxYzJRWmZGbFNGSWJ5L3VpUUpTcUhXZGI4SHQxVjdDcGh2MlUwUC9TZzgz?=
 =?utf-8?B?RW1NcjFEeDVvSVJ0cjRZeUY2WlIrU1RSQ0FFd1c1QjhJbllNTGtONXVCa2N5?=
 =?utf-8?B?QmNrVEU3VUdpQVV4Y0dJb3l0RHZRV3F6T3R1ZlJwYzJZRit0SStCb3pKMFJH?=
 =?utf-8?B?Vk5PNFgyeFQ3d3Z4R3pNTUxsL0V0emttTTA3UHA2bWVkQkh0dVlaSk4wZGZR?=
 =?utf-8?B?M1F0WWJ5dHlDQnZBNE9QeGxpUnpTRTc3VTI5eXpsMTJiRkhuZHphWTBXSnBS?=
 =?utf-8?B?cVZ1TStLUklLY05ITFMyeHRDM01YSDJqMTJUMUMvQ1pPSkZuNmVHM05KbUU2?=
 =?utf-8?B?ZGY5TUpSY0dWSUgvMmVTVDFGTTA4OVN6RTNLbzFtUFYzSHpYZEQ5bG96REZH?=
 =?utf-8?B?WXNsekVLaVpyWnVTVVJXVFd2aHg5Tjh2ZWZ3dE5palJNOEZwWmNOOEVPZmF2?=
 =?utf-8?B?MzNkOXBYaFcySkdNakhqNGFpOENvOU5ENStxNWpQMHJCbXVOMXVIbU5ueDV4?=
 =?utf-8?B?VzRvdkNBV1IxZDZiUUY5NElrOThISHloMk43Q1FyWjlGTmVmUVgyQk1XVThv?=
 =?utf-8?B?MEpVMDVWUms2U1pjcm9FaEVCNmRZMHhuL0RkYTAwUzBPVEJtaUo5ZFJOdzZz?=
 =?utf-8?B?K0YvVktwVGFDcnEzdkhBaDR1WDZud1dYM3RVNG5uZjM0WGlFbmtKUWFVMG4x?=
 =?utf-8?B?OVpwejNFU1BEN1dXUWw3WjZzL3Vud0w2dFBOTUUxaERjY1czNzAwTDNFT0F0?=
 =?utf-8?B?TUs3SlIvUm1kbUpGaUxmYkNKWFpMK1pjWjZlbDU2T3dUd1VKMko3M2hkeVBY?=
 =?utf-8?B?b1c0VG0xeTNFSWhpdWs4eGpvR25QKzlZeCsvbjJzeC9aUHVuVHYvREZ5aHFv?=
 =?utf-8?B?ZkhFKzFJTS9GMXdzTm1VcmVVTi9sM0kvQVNsWDVGWjJjQlg5K0xnWDN3OWE5?=
 =?utf-8?B?bVNIdC93ZDNxMTNBL1ZyOXVFRmJQbWhHWjRsM0trVS9JdTZ2YUY0ckFYcVgv?=
 =?utf-8?B?ZUpSeUhzZWxHK3IzTDRmYVRLUENzbVhMWjhPdUNpK2EzK0dlSUFpM3FSbzA5?=
 =?utf-8?B?VzF1STR6b3BJVHFvenFtZDFRUHF5OU5GZmFrS0pPU004TC9hc2ZYcUNNRnps?=
 =?utf-8?B?M1NKakZHNEEwRmMrVlBlN0lTbmhuOC8zK0l1N2s4NVJyejh2Q0djY09mVytK?=
 =?utf-8?B?cXB6QzB1N05sL1Rxd0V6bWczWnhuVk9nNEc1d1hCR1l2ODQ4UXVuaFh1MjhS?=
 =?utf-8?B?U0xZemZ3MlBBVVQ5a3VjZU02djlRMGtpenhpTjZOM09PcDFrRm9XTW12bThj?=
 =?utf-8?B?eHNkYVNUMGZkN2ZqdVRpaG5BRVhGQ0hlc01tYzlwQmNjY3hVZmwyU1FQY0JU?=
 =?utf-8?B?Q0pUaU5QTmVlWDI2QitEK0wwdVhLaE85QlNzMlpvOXZraHNOa3pVaFIrTmVS?=
 =?utf-8?B?ZDJBK0RLTG1XME5ndzFwZFNwb3ptRWwzU1FjMC9MditWc29oWTdPSWFxVnNS?=
 =?utf-8?B?bFhUSlhmbk1MWnp2WVJ5UlR2L0ZFWkZ5Q1MxMEdEdXI4SGJjZ0xBclBCclpH?=
 =?utf-8?B?anBnUTVad2VDaUl1OElxblptUFE5eGxMZ0t6c3hSN29Wb1E1Y1Q1dVNXTVRO?=
 =?utf-8?B?cmN2cTErZ3RWRExZVDcvdWFUR2NsY2FTdHdjNEdXQ0F5V200bktpb1dWQUtL?=
 =?utf-8?B?cHMwWHcrRHVwMjNqTWE5NXlHRFN2bmdJRFRxckdWM3dJelVkNG1za0d5T1Ba?=
 =?utf-8?B?R1o4T3hFSi9QZElWZS9oRm1aN3RYS1VDTWhJQmM1WnhDdy8wbTM4dE15eUtC?=
 =?utf-8?B?cmtRTjkwUW5jVnE0MEVIRTRlNVVRSGd6RmRCQ0ZlZnl4YlFmNGhaVVpvSTRu?=
 =?utf-8?Q?Zfhxssg87RYNHsPzEll2DRlbm3N7oDZi71oFgLoczbQZ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 64a0e6b2-676f-4209-4a5d-08db7d372132
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2023 09:06:33.9512 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RNyj3GQIiF4qBFUHn4zRy3TYxJtueY/R79Vw8JZCl9qWo0fsU6jE0ONWpdSAjNLu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6417
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

I was just to complain that this is certainly incorrect.

But it's strange that ttm_mem_evict_first causes the warning in the 
first place since it should never try to evict a BO which is about to be 
destroyed.

Regards,
Christian.

Am 05.07.23 um 10:31 schrieb Lang Yu:
> Please ignore this patch, it will cause another issue.
> Will send a new one.
>
> Regards,
> Lang
>
> On 07/05/ , Lang Yu wrote:
>> [   67.399887] refcount_t: underflow; use-after-free.
>> [   67.399901] WARNING: CPU: 0 PID: 3172 at lib/refcount.c:28 refcount_warn_saturate+0xc2/0x110
>> [   67.400124] RIP: 0010:refcount_warn_saturate+0xc2/0x110
>> [   67.400173] Call Trace:
>> [   67.400176]  <TASK>
>> [   67.400181]  ttm_mem_evict_first+0x4fe/0x5b0 [ttm]
>> [   67.400216]  ttm_bo_mem_space+0x1e3/0x240 [ttm]
>> [   67.400239]  ttm_bo_validate+0xc7/0x190 [ttm]
>> [   67.400253]  ? ww_mutex_trylock+0x1b1/0x390
>> [   67.400266]  ttm_bo_init_reserved+0x183/0x1c0 [ttm]
>> [   67.400280]  ? __rwlock_init+0x3d/0x70
>> [   67.400292]  amdgpu_bo_create+0x1cd/0x4f0 [amdgpu]
>> [   67.400607]  ? __pfx_amdgpu_bo_user_destroy+0x10/0x10 [amdgpu]
>> [   67.400980]  amdgpu_bo_create_user+0x38/0x70 [amdgpu]
>> [   67.401291]  amdgpu_gem_object_create+0x77/0xb0 [amdgpu]
>> [   67.401641]  ? __pfx_amdgpu_bo_user_destroy+0x10/0x10 [amdgpu]
>> [   67.401958]  amdgpu_amdkfd_gpuvm_alloc_memory_of_gpu+0x228/0xa30 [amdgpu]
>> [   67.402433]  kfd_ioctl_alloc_memory_of_gpu+0x14e/0x390 [amdgpu]
>> [   67.402824]  ? lock_release+0x13f/0x290
>> [   67.402838]  kfd_ioctl+0x1e0/0x640 [amdgpu]
>> [   67.403205]  ? __pfx_kfd_ioctl_alloc_memory_of_gpu+0x10/0x10 [amdgpu]
>> [   67.403579]  ? tomoyo_file_ioctl+0x19/0x20
>> [   67.403590]  __x64_sys_ioctl+0x95/0xd0
>> [   67.403601]  do_syscall_64+0x3b/0x90
>> [   67.403609]  entry_SYSCALL_64_after_hwframe+0x72/0xdc
>>
>> Fixes: 9bff18d13473 ("drm/ttm: use per BO cleanup workers")
>>
>> Signed-off-by: Lang Yu <Lang.Yu@amd.com>
>> ---
>>   drivers/gpu/drm/ttm/ttm_bo.c | 3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
>> index bd5dae4d1624..e047b191001c 100644
>> --- a/drivers/gpu/drm/ttm/ttm_bo.c
>> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
>> @@ -308,6 +308,9 @@ static void ttm_bo_delayed_delete(struct work_struct *work)
>>   
>>   	bo = container_of(work, typeof(*bo), delayed_delete);
>>   
>> +	if (!ttm_bo_get_unless_zero(bo))
>> +		return;
>> +
>>   	dma_resv_wait_timeout(bo->base.resv, DMA_RESV_USAGE_BOOKKEEP, false,
>>   			      MAX_SCHEDULE_TIMEOUT);
>>   	dma_resv_lock(bo->base.resv, NULL);
>> -- 
>> 2.25.1
>>

