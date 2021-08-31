Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CB5D3FC9A1
	for <lists+dri-devel@lfdr.de>; Tue, 31 Aug 2021 16:20:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 355DE6E081;
	Tue, 31 Aug 2021 14:20:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2042.outbound.protection.outlook.com [40.107.94.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 836366E081;
 Tue, 31 Aug 2021 14:20:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WAYBLIZk9NMJYvfew0zKqBX1ofAZk9wkzOhbwHbDAYeMOCVgEIjZM65sMDUbWETB/+XQCbTmLM1+BApRbN2Oh+xyVXEHFYiuMhS5zvu4K0Uod/QcHN6cyGeUU7ctVpjuraXHLrooH/dZeWemLKLNcWVyAkV0fucag2vG8fMq8akFtRz/bAp4eWMFCAil+alQ7oUOBzP7wp91TveYlZt/pnbvghlhU9eSIsQEbUgQd5YbVOwQu2RPAnI0xLX1tnp7AoJtPz9KX+oYEFT+G3MSP/LJSVdK1QukENTwoSxr3qvbb5q9drncsHAozgyDIfw0PJR42qzCOkAr8ZBr3lNBNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tm+JVIX7YEjIJ1Cq6n0Ylda33WMU+0BIfKqaX5Y5aJo=;
 b=hcj8m3Bkq2IxdvQSZIu8bNX9p8TuMnIsz9UUnloxdclBpscjBlkHTAZEI2IRScs9iV4EzkvuvFWPK+lR3H9C50WMINpCLl/RMuugqlLayPZFnUQUZvs3gXcxZP8Q+bdt+PaPZdB3prw/Up2xt60LX41UTLBDIxF8l0p1OKCsnWG42drJhMQU/wiZzIg9kN2sLcW/WbRQWIWWIfXFoveWpt294GyN/b/pHyuJW0hLBCKzodgHtas4UAu6TAnh36zHSdlZ3/vkm42NiV926pFejtrqEVqGW+IjYgZDhYaOp12XQVy8eGpbBhAZd7t6LKNtcSWix3/vUya7zif7CaML1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tm+JVIX7YEjIJ1Cq6n0Ylda33WMU+0BIfKqaX5Y5aJo=;
 b=xtnA4vXvzyphbQrlruV2zN9wDv8xO7Kmq/R7fVXlOlOehgFiRMxVDY6Fei0W60xBWDi4UXE+sNf9dexhnGlfcPdn68Kgrqu//g/hCP68MgjlANT/3W91lKli8ZQ0o1/JaCp4PCwp/cfQHacxkskGuhBKCDI6qWP9565RNNxLIWE=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB4623.namprd12.prod.outlook.com (2603:10b6:805:e9::17)
 by SN6PR12MB2846.namprd12.prod.outlook.com (2603:10b6:805:70::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.20; Tue, 31 Aug
 2021 14:20:43 +0000
Received: from SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::c4ac:2505:5bd8:295d]) by SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::c4ac:2505:5bd8:295d%6]) with mapi id 15.20.4457.024; Tue, 31 Aug 2021
 14:20:42 +0000
Subject: Re: [PATCH 2/2] drm/sched: serialize job_timeout and scheduler
To: Daniel Vetter <daniel@ffwll.ch>
Cc: Monk Liu <Monk.Liu@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, jingwen chen <jingwen.chen@amd.com>
References: <1630406139-19621-1-git-send-email-Monk.Liu@amd.com>
 <1630406139-19621-2-git-send-email-Monk.Liu@amd.com>
 <29be989b-c2a5-69b3-f0b8-2df52f50047f@amd.com>
 <YS42tI6qAUb3yqOk@phenom.ffwll.local>
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Message-ID: <11d6acb1-ce9f-372e-3993-232379436e4b@amd.com>
Date: Tue, 31 Aug 2021 10:20:40 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <YS42tI6qAUb3yqOk@phenom.ffwll.local>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: YT1PR01CA0149.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2f::28) To SN6PR12MB4623.namprd12.prod.outlook.com
 (2603:10b6:805:e9::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2607:fea8:3edf:49b0:b95:7ef3:48be:2d7e]
 (2607:fea8:3edf:49b0:b95:7ef3:48be:2d7e) by
 YT1PR01CA0149.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2f::28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4478.17 via Frontend Transport; Tue, 31 Aug 2021 14:20:42 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 07e4bd2a-bc90-4df4-db91-08d96c8a8415
X-MS-TrafficTypeDiagnostic: SN6PR12MB2846:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR12MB2846F8BE68B491098CC8EC5FEACC9@SN6PR12MB2846.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3276;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BbpmmDSyqLRmch97HRKTVwuuwwnyNEB8zFfzj0jCv0FbjZlin5AL7Yu+TD18acOKUxiDR/1jLy+XsJzjjzV4waKGnyPakn8kO1+66SY8LeYmidYK2Sf1xPWNE6Fnih1Ulzk6/KXctFFAKLtBVEmIG9wpJWu8Po79GOyNJR+f+5iOjsUA3tUgzlCIAzYcoXfkkTyaL2ijBZfTuPEhsZJvkq8br2v63doGLMz9674ojXFX7IAbFJhLLJ3fY3ZnGCvY7bqm6A0FykAr6ORxlzzGfZ6gjWxP/OhFxEyMWSe9+Gx1wUqIUIxhMV09jJKvrlWUCIVKVXt8UqU7G1As69Q9ejYkpMS/8j78GMPBcYLlRi6joeZobvE3ox61uClN2u/8XADxbXzMVfoyaXeItZxNYdhWYRFJJcFdfK9Oss05oXke23bhC6fKY8U9tMmr23g1vTZhKq1kjYAAk1JR+me3YvY4oVNaI3XNKSA4cJUxa2qD30SeA2rDVoxLR0XQtuV1YsUCs11tV1EfpAq7qOcJgLuTjJ5qXSO+dg0lJBSj16q0G0yEN1yacWM/uTGnTSRxJHt2A8LI4goVekYGOR2OnqUPP9POwZNWgApFHHm8y7c/ViDpNEWXMgZSSALX8Ri5jrRdzCTeeGypZnAW1vsSaVpAp2C59CREEJ3GsjGKXhdoY/Tp8kVn+gkB1LPa3YUDEFHflXxP7T5nYy9Qn/1eG0TZrg4OrxwUMEWDMGsrOdsiqLTRZM8Mx3EPG3PUVJdqndfUhil6TjkxSoUu8uPVMV1LQbwvpQIvYbgVEyLqlEc8XpgDLpQeJINDz82UqMUCJaKbK1Nko5KRO5otuL4AM8qWjqdhZ4wiQo9jcGr45g4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB4623.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(396003)(376002)(39860400002)(366004)(136003)(186003)(2906002)(53546011)(44832011)(4326008)(6486002)(8936002)(45080400002)(66946007)(66476007)(66556008)(316002)(6916009)(478600001)(8676002)(2616005)(86362001)(31696002)(31686004)(54906003)(966005)(5660300002)(38100700002)(36756003)(83380400001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bUlCU1NjSCtuYnR2Wkw0a3dWNkkydXN6RW51M2hJZmdMVlJBUFcxL200TWdr?=
 =?utf-8?B?cTF4VnNpMHlyMVMrZXVRUThJa3VnT2xnelVSNUxac2dsbmVBa1RkaktUcThX?=
 =?utf-8?B?K09DYUQzU1lpMERvaFhYK2RjUGRjRGxzMXRlVXNzOXZOK0lpNTBodkt4Y3Rh?=
 =?utf-8?B?a252V2w3WHJiUHUzbVkra0ZWVFV1VzA5YlJYU3N2ZmtNS1crbVRzTzUxMGk1?=
 =?utf-8?B?ZFdEMjB5ek1HZ29RekZYMHorYVBJLy92UUtPbmQzcVAvQ29adElma1NhWVJT?=
 =?utf-8?B?WFg1aHRCMWh6eWlMN04ybVM3dlUrT3kxR2ZCQTVTbjVPV1ZwWmNKaU9xeG5K?=
 =?utf-8?B?ZnN1aHE0K2lNcExSR1owSFBpQUF1RWhpc3NwbUtuR3VnWER3bHZKVFk5V0U3?=
 =?utf-8?B?OUVja1pLREdpeEtqVHV3WkgvM1daeEpkYkVsNE5qVXFnaXNDamVXR1VEME5n?=
 =?utf-8?B?bE55YzRJaHJWUHdtWkUrZ2xxb282TEVnWUJxcGx6T2tKSmhpakVMKzdMWFl0?=
 =?utf-8?B?UDExNmVKVnNYQ0dvYndUL3lFL084WXhmelQweEwrWUpHQUpRZVhFK05nY1NV?=
 =?utf-8?B?dkJkK2tOSWE3VEo0M1JvZm1ySERZU2dYUkxINjg2Uk44OEV6eHlvRGo0SFYr?=
 =?utf-8?B?alBBMm1vand3RkxyWUdHekM5MmYwa3lId1JzZytrc2tMQlY2SHVpVVEyYjgr?=
 =?utf-8?B?NEVOa0tNd0pRbDl4RGlqUW9vekw1d1JrZW9JQnplbXBUMmkyQk1jSk1Tclcv?=
 =?utf-8?B?NFNDQ3ViZmxURXBZVjcxQWNwSWp4SVBLM2g1anFhdkdpalpud3pkcjNMVFFm?=
 =?utf-8?B?VlVxNk1hMTBieTVCN3pKWHhZa25Ib0kvSndFZ0U4WFB5WGU0SkRlc0pab3Vm?=
 =?utf-8?B?Uy9qU3pkeExUSExEbTYxN3JhSzB5TXdiMHQyY0xFU3puTXpaajdkSVJyd1BF?=
 =?utf-8?B?RTVUNFh5cDFJU0cvcWdmb0FES3hYS0ZOQklYSzQ4eUgrTzdFWFlNdnl0RzJL?=
 =?utf-8?B?WkpWOTljQXIrTjZEeXBKTTIzdnRjZWVPNGpXalRySDZNT0kweGEvaGJSMitj?=
 =?utf-8?B?R2xwR3VNdGJiK0ZRaFRERndKMU1MaWN2KzNwcHFnUUx5S0NOTkZPSTU2SEk2?=
 =?utf-8?B?VDltdVpCVmFmNysxU1ZablI1TU1LRklsZjlZcXN1QncrOTVndDF1SkpiV3Yy?=
 =?utf-8?B?V0YrUWpRYWRSREt4T1YycDVMa2wwU2VkclNYTG1jVUtOV3lHcGk2NWp6ZWE3?=
 =?utf-8?B?L200QU96eFRTZDVxbTVSUk4waDBIYjN3S2F0eWRpMFpCUGhFbzF4R25YVjcv?=
 =?utf-8?B?Y3d1N0FPc0wyNmIzRDFJRVFjR1RHNDNPaUdtR1VMU0xLNXJUank5R2lOZFFh?=
 =?utf-8?B?aTJxNG44Sk9NNEw5cUFYbFFKYTczMVZDOEJoTyt5UlRVZWY0M3FtTEh6U0ZB?=
 =?utf-8?B?TFJLZ1FCdjRaZHNtQ1Q0b1JhSmg1aFFPYzVCbXBodDNYemlhWlF4a2d6elRv?=
 =?utf-8?B?eVJSR21ObGxrNjg1V1laLzF1WHBrSHFNYlFQQS9RQTREeGE3R0VGTVlyV1Qw?=
 =?utf-8?B?SEY0c3RXbWs5bWcyaTJLeVNGYXZvT1FaY1M3OUEwMGhwN05CenowdVlTRXRu?=
 =?utf-8?B?MDRRNklnWGcwbFlVUWhXQnZ4WUdDb1NMNVNXRUxrdWwvMUNHaElRYjdKeFM3?=
 =?utf-8?B?RXZrNit5WEFlb21TUTFvSHpOZkFwaWRGL2RVN3pLbVhaQmIyMFR5cG5CWkY3?=
 =?utf-8?B?NzlyRW9XSGt3dnZ2NjRLZ2oyb2RzcmZYMVlvRWNCNjE3MnQvNDhTR0NhWWcz?=
 =?utf-8?B?WXlHb1paTEFZRTJ6VUN2RCsrRXNKc1F1bExSeFNmTUVCblF5MzZ2aDlpaXhx?=
 =?utf-8?Q?8QI4e3/AXCCyD?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 07e4bd2a-bc90-4df4-db91-08d96c8a8415
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB4623.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2021 14:20:42.8776 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QsjPMWmYPBzId0OnZ2Zo4PRjUr5h4AA8IQnsmLqEt6M/iIYuVl5G3i2NPqXiAtx15R3XdzQdqX2ZtT+vJ215Dw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB2846
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


On 2021-08-31 10:03 a.m., Daniel Vetter wrote:
> On Tue, Aug 31, 2021 at 09:53:36AM -0400, Andrey Grodzovsky wrote:
>> It's says patch [2/2] but i can't find patch 1
>>
>> On 2021-08-31 6:35 a.m., Monk Liu wrote:
>>> tested-by: jingwen chen <jingwen.chen@amd.com>
>>> Signed-off-by: Monk Liu <Monk.Liu@amd.com>
>>> Signed-off-by: jingwen chen <jingwen.chen@amd.com>
>>> ---
>>>    drivers/gpu/drm/scheduler/sched_main.c | 24 ++++--------------------
>>>    1 file changed, 4 insertions(+), 20 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
>>> index ecf8140..894fdb24 100644
>>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>>> @@ -319,19 +319,17 @@ static void drm_sched_job_timedout(struct work_struct *work)
>>>    	sched = container_of(work, struct drm_gpu_scheduler, work_tdr.work);
>>>    	/* Protects against concurrent deletion in drm_sched_get_cleanup_job */
>>> +	if (!__kthread_should_park(sched->thread))
>>> +		kthread_park(sched->thread);
>>> +
>>
>> As mentioned before, without serializing against other TDR handlers from
>> other
>> schedulers you just race here against them, e.g. you parked it now but
>> another
>> one in progress will unpark it as part of calling  drm_sched_start for other
>> rings[1]
>> Unless I am missing something since I haven't found patch [1/2]
>>
>> [1] - https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Felixir.bootlin.com%2Flinux%2Flatest%2Fsource%2Fdrivers%2Fgpu%2Fdrm%2Famd%2Famdgpu%2Famdgpu_device.c%23L5041&amp;data=04%7C01%7Candrey.grodzovsky%40amd.com%7Cc697c75898664f678f4b08d96c8820e7%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637660154199259544%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=1Y8Tuh2fLtexYsGrmQD2ITTSIfUVJmqTylwgMryDjxw%3D&amp;reserved=0
> You need to have your own wq and run all your tdr work on the same wq if
> your reset has any cross-engine impact.


IMHO what is problematic in serializing vs. locking (with trylock and 
bail out like we do in [1]) is for multiple TO events arising from same 
reason
like maybe one job just waits for another and once first is hanged the 
second will also appear to be hanged triggering it's own TO event.
In this case multiple TOs event will trigger multiple resets if we 
serialize but if we use lock with trylock the second one will quietly 
bail out.

[1] 
https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c#L4903

Andrey


>
> See
>
> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fdri.freedesktop.org%2Fdocs%2Fdrm%2Fgpu%2Fdrm-mm.html%23c.drm_sched_backend_ops&amp;data=04%7C01%7Candrey.grodzovsky%40amd.com%7Cc697c75898664f678f4b08d96c8820e7%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637660154199259544%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=tLjFaN7mREYjjydxHszbQlTk3lwH4bQtBDVzHFHvPJg%3D&amp;reserved=0
>
> for the ->timeout_job callback docs. I thought I brought this up already?
> -Daniel


Yes, this discussion is a continuation of your comment about 
serializing, I mentioned before that you proposed it.

Andrey


>
>> Andrey
>>
>>
>>>    	spin_lock(&sched->job_list_lock);
>>>    	job = list_first_entry_or_null(&sched->pending_list,
>>>    				       struct drm_sched_job, list);
>>>    	if (job) {
>>> -		/*
>>> -		 * Remove the bad job so it cannot be freed by concurrent
>>> -		 * drm_sched_cleanup_jobs. It will be reinserted back after sched->thread
>>> -		 * is parked at which point it's safe.
>>> -		 */
>>> -		list_del_init(&job->list);
>>>    		spin_unlock(&sched->job_list_lock);
>>> +		/* vendor's timeout_job should call drm_sched_start() */
>>>    		status = job->sched->ops->timedout_job(job);
>>>    		/*
>>> @@ -393,20 +391,6 @@ void drm_sched_stop(struct drm_gpu_scheduler *sched, struct drm_sched_job *bad)
>>>    	kthread_park(sched->thread);
>>>    	/*
>>> -	 * Reinsert back the bad job here - now it's safe as
>>> -	 * drm_sched_get_cleanup_job cannot race against us and release the
>>> -	 * bad job at this point - we parked (waited for) any in progress
>>> -	 * (earlier) cleanups and drm_sched_get_cleanup_job will not be called
>>> -	 * now until the scheduler thread is unparked.
>>> -	 */
>>> -	if (bad && bad->sched == sched)
>>> -		/*
>>> -		 * Add at the head of the queue to reflect it was the earliest
>>> -		 * job extracted.
>>> -		 */
>>> -		list_add(&bad->list, &sched->pending_list);
>>> -
>>> -	/*
>>>    	 * Iterate the job list from later to  earlier one and either deactive
>>>    	 * their HW callbacks or remove them from pending list if they already
>>>    	 * signaled.
