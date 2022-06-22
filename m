Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2558F554E30
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jun 2022 17:02:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEA93113414;
	Wed, 22 Jun 2022 15:02:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2077.outbound.protection.outlook.com [40.107.223.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86E52113415;
 Wed, 22 Jun 2022 15:02:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KVHDKVy/RNkg/agqWNZXl8PMkRaMm07TbNivNhvlt5CcCC+Ls+TZ5QTxaboudU0YjRk6AVAuG+TAl25EBvsrj4Un82fJC1j2V1L/D8nzu7TMjT93o/vmjoHczN7XognZYJ/TjFQ6AqnmoP/II3FVwSis5QhN2wbp7HMYzIv+h2cvgAV3xkuVG+TLhvznCkQrajmAZ7/g3rJYtXAEHwOOxGKH/wm9zH0yYv1yBd9mRjEYH5N0D5Xpk/dsGWbtDqGMavyL2yYQuqBp9tkQsxy8wNPW9fBNLv1Y4U5bRWPkOAnzBJDA8ZSjq1OfyY3oZfYHqC966jyH4My/3HupfEjtYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eGZSmxOL6ht4MKtLTQoyyC+lSFpUolu6HFoiIqoJAmo=;
 b=Vm2l0zW1BnLDWexugqc4fBNo8P82RfYDPnlg+4dwGZq41nH/zgu7pOARIjp1KwJOh1bWRDW37hj3G4WcAaVEikp2BsgHhj5qM7h6zs4X37RTdHdIxueQBIHdw4ec4+cU/gWu0OrOlcTYs8+OO0xtzd6UX53OrIoQI6xsUsbpFlnlYv6TnhqaS+Gvwpyve4MSq2r1fAaKM0uOAdkMAHWV9Bs5MQNJF+8zwX6lBbivgrMExRzCvKgn/RY4GBkfeK/iRbCH5X2ZJUgbEnVUyERWpbwNDzL8QOqHPD3XFSmTN7yxo/MQu7egTKF2bGPYdl6THFKy2xV9BlcZ5c7yRY4xmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eGZSmxOL6ht4MKtLTQoyyC+lSFpUolu6HFoiIqoJAmo=;
 b=jwyDossg3bwoPgSsUDaly1n7GamyX5TrFCV+XxkJ0y7zJKRkrID8tWpbBXqCR5FPZ0G4Tj3ACFfrvQAVCx0Rh/dXP14BD/YPLrHVn8+gGMzkC8bQL6J0ntlTtwZFIWIUVmXufxJdtQOM5UQUA6hfjM+N5alSxo2kI4BHqH0G5y4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM5PR12MB1947.namprd12.prod.outlook.com (2603:10b6:3:111::23)
 by DM6PR12MB3337.namprd12.prod.outlook.com (2603:10b6:5:118::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.15; Wed, 22 Jun
 2022 15:01:58 +0000
Received: from DM5PR12MB1947.namprd12.prod.outlook.com
 ([fe80::9da9:705a:18ae:5e91]) by DM5PR12MB1947.namprd12.prod.outlook.com
 ([fe80::9da9:705a:18ae:5e91%9]) with mapi id 15.20.5353.022; Wed, 22 Jun 2022
 15:01:58 +0000
Message-ID: <445f2db4-5496-4003-c5fa-3605aef2c33d@amd.com>
Date: Wed, 22 Jun 2022 11:01:56 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 1/5] drm/amdgpu: Fix possible refcount leak for release of
 external_hw_fence
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
References: <20220620220302.86389-1-andrey.grodzovsky@amd.com>
 <20220620220302.86389-2-andrey.grodzovsky@amd.com>
 <2c70d0c4-a326-6497-54b2-51bc2b93b9d6@gmail.com>
 <91aba934-32f0-b1b9-b882-979ca02a1920@amd.com>
 <6d1acd76-dee8-29fd-dde3-bf51161792de@gmail.com>
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
In-Reply-To: <6d1acd76-dee8-29fd-dde3-bf51161792de@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT3PR01CA0121.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:83::27) To DM5PR12MB1947.namprd12.prod.outlook.com
 (2603:10b6:3:111::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 22093889-c634-4925-deda-08da54602799
X-MS-TrafficTypeDiagnostic: DM6PR12MB3337:EE_
X-Microsoft-Antispam-PRVS: <DM6PR12MB333776ECF124136A7C045B70EAB29@DM6PR12MB3337.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QurROCsbLRXlOWFJM3zCLYBkVUtTb6UGfpdZ7temoBASL82ZNIpzcfSW/0US0cAok8U258gBDE2rYMVkywqvY5W8KUQyN+QvxZYYFcL8AxGHKJRkxywFZpIfeVaL20BhaR9Ls3ZdqINnHxqZFq1D2lk7r5rp6hryXMLrof8XJVJZzuectvvufPnUw9UTXQw737bjz4S48WgRofU2bj8kq8gQRZKDxaji24500vrT4pGW/+Rp9Yzfxm9IhfU5TKwjBV8ajUGpbl2jRxKHcsz4zgQnL6j3d5ZvNOp0+y0FIr36T/e+rcWsVpKcblwAG9RuTbt13dNhq61Xyt6VZuibcOvWwiNIDW/ks6W4cV9Z3ysRpvEvNITJtkJc0by/7E8HYKj2FdK08xVzjJPtknN8sZmPNv7vFJ7KKMjybTZpd1G0/dm0eQZ6aluYKFBVY02zZst2ySGBbkQAK7iyjFcOBnrFKL2MyGTtJ6IpuErbbCwxTfXycMqITb6LPWjKneU442V2NJMyUJnm5mN0/ME+0egQJ1JlQ1hzokp7JXlPc5EqYHC0Dxr98wXPUAjEi5YqCwPvDzt3aBv7am285ZUlJg1coeXusLCjG4UVFzm/9EvmgXq7pWFv3OokfeB0J9IieVbY+vbBM+2ahGtXP/cE75zBFWs/iNKydmRHz1hZfNDrcK67IABCKwldS+nqLufcBSt8NQE3zRhd5+FuB8FFYVqWpI8PvVLvM2ZrIrKrg44SZq+4PWX3cl8FhTJT6UMMZqqwM4k5o3BeVZO6oHbxTLg8FwTwxpAeJWUedwY4/K4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR12MB1947.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(136003)(376002)(346002)(39860400002)(396003)(366004)(41300700001)(6512007)(83380400001)(38100700002)(31686004)(44832011)(36756003)(2906002)(6506007)(5660300002)(4326008)(8676002)(8936002)(478600001)(6486002)(186003)(53546011)(2616005)(66946007)(66476007)(66556008)(86362001)(316002)(31696002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ekYrTjFqUE9lVHVOOWc3MGxQOWZMTmM3WCtkbHJyVHJ2RWJnOEw3cFlGQm9F?=
 =?utf-8?B?QlF3WHk1cWp5c0plbmJXaVF4NUxIS2xjUUw5RlZ3L2swYzk4aTlEdGlYcHZs?=
 =?utf-8?B?N0xKUk4yMXAwT0JLNEYxQmFQbm5UbkNzaWpveVU5UEt4OXVBYVhrUUdwMXJU?=
 =?utf-8?B?UEVmYjlwekZPWXU1Z09hbm8wMFJYcXRkNE05cVljZ1ZTZU5yRXRqdHdZUGY1?=
 =?utf-8?B?RW5TMTBuR3hzNldMaHVKUklzQnpGSXRyMVRTNkJpYStRNkpGWUJkeFBXSlFk?=
 =?utf-8?B?MzFMcEZTbGo2VURQcjVkZHR2QVZSWksvVDhwanVnUE95L0ZFU1J6a0tRdHhR?=
 =?utf-8?B?REk2QUJZOEYwaUU1WEZwQXU5RVVrK3dzNzd2KzNkczBkSFA0NmM1SC9lV0Jk?=
 =?utf-8?B?RHl4b29NaHUvcVF0aDFUQzFrRTIzQkdvOHpBY3JnYm5MTGFkdXR5R3FsYmtF?=
 =?utf-8?B?N1BnZ2xLMlJIZ24vVkJiMnRRUzhUb3FJR2NQMDdQT0dLT1RRUHFuUGRPY2xV?=
 =?utf-8?B?QUIxL3RhU1U2ZVAyV3pvdmw0SVNodkVxaWsxVlNVQWhUTUZSQ2NrY0ZQcFh3?=
 =?utf-8?B?R3NlckVnZnRlZHQ0MGxTZ0pPMktnSmkzYmxueXdtd2JHdStQUVBTcEROb0w5?=
 =?utf-8?B?OE5yZ3VVVnlESGMrS1UrYkNGNjk5UDJGT0ZUa2x1OGZkTHNrSUJVNFBwQjlt?=
 =?utf-8?B?VHBIcllHRFlId0lyWXBBWkkycnNzSFRicWQrL01lZmdJenpzZHpWMnVJRGhW?=
 =?utf-8?B?eTFWRjM1RGxXMHFzTWNHK1J1NFBPYTFxNVBJNENOU1dZUXAveXFWRzVtaWV6?=
 =?utf-8?B?NXZLd1luZldZRktXNVJlZVJqazZIUlY1OWE2eHNCeGNWbmViQ0c2c01ucmZJ?=
 =?utf-8?B?RFZiYi8wNzNDc201MnRtcWNpREpjd2RpTm51ZCt1M3BrWHNLMUVTUjFUUDNN?=
 =?utf-8?B?QjFKRzE2TXAwdmRyVTY1N0Z6N1d2U2FzOGE4WjhMV25qTWhYUEl2MGRBZm9Y?=
 =?utf-8?B?dmxQaExUdGJad1RoTnQwV0xOQURFZGYvNy8yTHNlbUE4V0xBc05GdXF6TEpu?=
 =?utf-8?B?dnBrRmIrWGk3Ri92REFZVWVlOWY1WllWOXZmWjR0VVJOaEVHamh5Zkkya0RR?=
 =?utf-8?B?QmRobnFOT29PSFUrL0FqeVhxTmNnOXFOT1BPb0JMLy9hQWh3cEF6dkpmc1M1?=
 =?utf-8?B?RHJhWDMwUFl0SWFYby9UM0JBay9xdDhuWURtRGFzTkRBaU1raEN5VEpkckpW?=
 =?utf-8?B?cmJzWkRIcTY1cm5hYmdWZTE5UG95bUpLaitPMGUwNHhhY3pDdTQwUFpVMExX?=
 =?utf-8?B?WEh1SFpxdi9OVitqTHZJdEY3bU9EcENGRW9CY3hJS2UvNzR2cTl4L2tKYzA3?=
 =?utf-8?B?S3FGM2ZQamNzSm1IYXRnYlk0Zjl6OUl3YllHT0J0ajBHbHhmNHllUFZSYitG?=
 =?utf-8?B?ZUR6Um9DdStsZENremxhcVF1aXFiQUZXeGpkdUhvWmYvZXhYV05yanBubE9P?=
 =?utf-8?B?WmZidFpabTNrMXhNdyt4eTJpdnlsTGxkWUovY1lQdjVTVmI4Qlk5WDhkZUsv?=
 =?utf-8?B?TjhxS2ZaNU1Xd3hwdmY3Y2ZhbHpUb3pNTUptT2djK2paRUJwbGJwOFB1b0RM?=
 =?utf-8?B?dzRDS2orZ0JEZXlCeWJHeDdONXBzS2xKbnMyYlFrUFhoTXF4VHpPaHBoTlFi?=
 =?utf-8?B?R3NxSzFDK2dyWDlpSnNJanpVak90YXdheTVhQUNNL2J3elRqT0Q5Mkdicitk?=
 =?utf-8?B?dkI5b0VpT1dOQWl4aXZhS3Bad1ZHK3E4eVdRamNHQVhiT21QT0tJckljdFJC?=
 =?utf-8?B?UVBFL01kZHpkRE5STlV1T2N0UmROYnR5VmpVT1pOcm0yYWJvbXhNY3RjWG8v?=
 =?utf-8?B?YWpWS2Z1ZVJoRVl3aTNlbG85Y3k3WU9pZ0FKUzVaR0lSN29DRVRVTHNtdkl3?=
 =?utf-8?B?Y2N3NTliOUtUMm1xZW43L0JEVVlhWjkxOVBRL3pPUHNYaVNaWHpqV1A4RlVy?=
 =?utf-8?B?YVBjY2RnMDlOS25uWFhQSW1Ud1VEb0tVcDg4enpPNU1QcWlZcVRwbmRzVDV5?=
 =?utf-8?B?SlhYVm9qMXVrNlN4a2d2WitRK1dXWklRNDBJaDVhZFRBK1NST1F0Z2l0WUtM?=
 =?utf-8?B?byt4M1dVckFvSmI5MXN6QWNGVVhzdEtFWEl5TGNQOFVMd2w2eGNHa3FGYVZ2?=
 =?utf-8?B?SzEyWTZBdUhVbHU0dmlXcWs3c1dxT2d5Z0c2b0tWbDhZUDU2bFZFcGo1T0tx?=
 =?utf-8?B?elVLME4yZXNjSktlWVhkbks1N1NlTHpiVm93VXAySEN4SmJsWVpCMzd3UWlo?=
 =?utf-8?B?dzZVNi8rT2dlM2RwWjN5RVVRWUZWeXpxWDB1bGJTdjY0WFVHZysxVDlIWnZQ?=
 =?utf-8?Q?Gj5enq4BKTRUdw5zZAfQJ/vXawIdEzJU247/2oqWRivT1?=
X-MS-Exchange-AntiSpam-MessageData-1: R7TT3xcObN1ppA==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 22093889-c634-4925-deda-08da54602799
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB1947.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2022 15:01:58.6054 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k/8NOm/7Dgzs5voKEclcn8/LH5vvmxKn/COUwJz3bU27I+VZWC+xxapRy+1zdQtuICrkcJN14aVEs7GEwIgs4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3337
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
Cc: jingwen.chen2@amd.com, Christian.Koenig@amd.com, monk.liu@amd.com,
 yiqing.yao@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 2022-06-22 05:00, Christian König wrote:
> Am 21.06.22 um 21:34 schrieb Andrey Grodzovsky:
>> On 2022-06-21 03:19, Christian König wrote:
>>
>>> Am 21.06.22 um 00:02 schrieb Andrey Grodzovsky:
>>>> Problem:
>>>> In amdgpu_job_submit_direct - The refcount should drop by 2
>>>> but it drops only by 1.
>>>>
>>>> amdgpu_ib_sched->emit -> refcount 1 from first fence init
>>>> dma_fence_get -> refcount 2
>>>> dme_fence_put -> refcount 1
>>>>
>>>> Fix:
>>>> Add put for external_hw_fence in amdgpu_job_free/free_cb
>>>
>>> Well what is the external_hw_fence good for in this construct?
>>
>>
>> As far as I understand for direct submissions you don't want to pass 
>> a job
>> pointer to ib_schedule and so u can't use the embedded fence for this 
>> case.
>
> Can you please look a bit deeper into this, we now have a couple of 
> fields in the job structure which have no obvious use.
>
> I think we could pass a job structure to ib_schedule even for direct 
> submit now.


Are you sure  ? I see a lot of activities in amdgpu_ib_schedule depend 
on presence of  vm and fence_ctx which are set if the job pointer 
argument != NULL, might this have a negative impact on direct submit ?

Andrey


>
> Regards,
> Christian.
>
>>
>> Andrey
>>
>>
>>>
>>>>
>>>> Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
>>>> ---
>>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_job.c | 8 ++++++--
>>>>   1 file changed, 6 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c 
>>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
>>>> index 10aa073600d4..58568fdde2d0 100644
>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
>>>> @@ -152,8 +152,10 @@ static void amdgpu_job_free_cb(struct 
>>>> drm_sched_job *s_job)
>>>>       /* only put the hw fence if has embedded fence */
>>>>       if (job->hw_fence.ops != NULL)
>>>>           dma_fence_put(&job->hw_fence);
>>>> -    else
>>>> +    else {
>>>
>>> When one side of the if uses {} the other side should use {} as 
>>> well, e.g. use } else { here.
>>>
>>> Christian.
>>>
>>>> + dma_fence_put(job->external_hw_fence);
>>>>           kfree(job);
>>>> +    }
>>>>   }
>>>>     void amdgpu_job_free(struct amdgpu_job *job)
>>>> @@ -165,8 +167,10 @@ void amdgpu_job_free(struct amdgpu_job *job)
>>>>       /* only put the hw fence if has embedded fence */
>>>>       if (job->hw_fence.ops != NULL)
>>>>           dma_fence_put(&job->hw_fence);
>>>> -    else
>>>> +    else {
>>>> +        dma_fence_put(job->external_hw_fence);
>>>>           kfree(job);
>>>> +    }
>>>>   }
>>>>     int amdgpu_job_submit(struct amdgpu_job *job, struct 
>>>> drm_sched_entity *entity,
>>>
>
