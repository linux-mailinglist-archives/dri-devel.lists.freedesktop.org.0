Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3682A3F89A6
	for <lists+dri-devel@lfdr.de>; Thu, 26 Aug 2021 16:03:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC7F46E85F;
	Thu, 26 Aug 2021 14:03:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2048.outbound.protection.outlook.com [40.107.223.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D09256E85F;
 Thu, 26 Aug 2021 14:03:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q1hU0EhJe2ysNpxjUKZWgKQhVysNcInVWFEKEaotWk0ei4/DxEdC2CvUnsWeFEPJHorhtLbCDAKr72sIG4RH24Jw7Abxzit+ysssDxtryR3rtPzWGtb6tGFIX4yV7M4MHFR20BXM/bnMoHacvIxyNIQ2KLQKf3Mv0DPzqtdCyO9WLWUeqhg5jTDyixmDr6WRq/Tg47VEZePpCnXHSYtKZIxVpZM7KJ3V98uorF34RkwIoEdu80qvGVwkIIgyWqnI6nypLbiXKslfIMtYysRplVEpoe76yW6ywNM0IXCRd09xryOGE2kGUpHpkox9CFRRxryacviF4x1hlm6i3vXmSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=beGz5NTfWtv+QwaFnP9ybAxwL4T/a6/XPUuS7wwq3FY=;
 b=dvQf23PUU0FL4GFP23O9+7h6gYY+E1jZcitK19c3ll1HzCoA9gvU3//lqQDdU3pKgUGO4RXn/JLaxQbzGPqfnkn+o6ZWzWxjoIK8ziWaVHBy5OHhjDwlXgZsmY3wQtOV2cP/sSNFgZI4yfzmET9s8TEioEj3PbiW7GxDUTPsQsMpge8AdH/XOJo8ohiO7aPW67d7W6V+LXBereOQSpc+kKDJrVAXNpxh0udFLjnJWfasNN0LYpoYWaXB51PuL6JOVjU1euEC7bhwHB/uDG7jsEmP61wfDGBUKhIH9p+4lmN2CMECq3B+q+H4PGMQlmPwpmkHeBUidlQOkKsfMhhpUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=beGz5NTfWtv+QwaFnP9ybAxwL4T/a6/XPUuS7wwq3FY=;
 b=LYZnNexxaZnxxKI2QjGSkBgA+TejRIZ5JzZQDdsINB4DoJTSEKWULeD83E1NVoxEcxJJod187KeSv32qmwClEYV92Vr8t+DY0Yz6WUAGZX9m4nvv3hdigCO2Uq3ngjWhI5UEt+zhiKNZhoIZDxfvwu1HBEAp0kESuDT1fvZ91z4=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB4623.namprd12.prod.outlook.com (2603:10b6:805:e9::17)
 by SA0PR12MB4381.namprd12.prod.outlook.com (2603:10b6:806:70::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.19; Thu, 26 Aug
 2021 14:03:09 +0000
Received: from SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::17c:7262:446:f400]) by SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::17c:7262:446:f400%5]) with mapi id 15.20.4436.024; Thu, 26 Aug 2021
 14:03:09 +0000
Subject: Re: [PATCH] drm/sched: fix the bug of time out calculation(v3)
To: Monk Liu <Monk.Liu@amd.com>, amd-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
References: <1629953731-14629-1-git-send-email-Monk.Liu@amd.com>
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Message-ID: <20419179-ee90-45aa-f4b8-b6bcb20a9c52@amd.com>
Date: Thu, 26 Aug 2021 10:03:07 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <1629953731-14629-1-git-send-email-Monk.Liu@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-ClientProxiedBy: YT3PR01CA0069.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:84::6) To SN6PR12MB4623.namprd12.prod.outlook.com
 (2603:10b6:805:e9::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2607:fea8:3edf:49b0:80cf:5155:1abb:d396]
 (2607:fea8:3edf:49b0:80cf:5155:1abb:d396) by
 YT3PR01CA0069.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:84::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4457.18 via Frontend Transport; Thu, 26 Aug 2021 14:03:08 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cc1bac3e-5dd9-457c-1cd5-08d9689a3c26
X-MS-TrafficTypeDiagnostic: SA0PR12MB4381:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA0PR12MB43819DD301CD11763770BD38EAC79@SA0PR12MB4381.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:475;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: m5n2yt7WTt5pZocxMo4wrYnxdtedjXHaMx19+1TiedImKEsq6+Jexb/NxOlmWpl5TCsKbHUccOZVmgPFq2Au2vjuNrWoha0ThJUxEwJ7T6gyvvicCpSUB7ct80bhX+z6bC9oMh6qOY+Rn03rinGjFLEYhAeku3rZwFEjffoCmnJ0Tz91+XZczUjhuGZwzC9DLgbVT4lhN8+iOhwhyc+1F0Jy8vLLgyzHkK2j7zFazkAdgzh4Ih3X/FiSH7dHQCPgFe2wW45+beP04ensnwVRldFFQmrOyh9otfkumvRQX3IlUvuYSpzqD8HPr9NPycea0whZ3DFUnYioug0L3Knaa7lLTtdYF8eVKBwbZwggdddv/9klKwV9U7Sc3hcHTjEUtfTkKE82MO3gcpILhLYxxIfv2utieV330n0dfFNdMIWXXz71Lthbd382DxCCBa9Eu/RYTO3m6clFsBRwJCJbB9PpshTdLzseye2YBJ+QUJ7u4C+Ux6pzoEoyOUAZELVxbrancSuTq7qDFSiMX3IiYjmpnC7NY32HzxhKWhfBY6LeYlxh3eSve8lTaupATtwbgCR/8UHwrNbzo+P6yGVIcqffrdJLSaUzhOJswWbcx7EwKHI+n//ANxyviPiqY4uiCkuF1HD9rD6CWxI59nxJ2rxn7d75rFL+f1PAUzL/6GhxI7vx+MqjZZTKJwmq8rRmwNchlcaX1SuBYJs2yTF7iQ2fRYY2m1KwZ5Keqn0/iJU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB4623.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(39860400002)(376002)(346002)(366004)(396003)(6486002)(66556008)(5660300002)(86362001)(186003)(450100002)(4326008)(31696002)(66946007)(66476007)(44832011)(8936002)(478600001)(2616005)(8676002)(2906002)(316002)(36756003)(31686004)(53546011)(83380400001)(38100700002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YXRObDFGenYwK1JNelVpKzVaYkZ6UlBOUmJ1eFBWYmxDbGM3OWFXQndjZDBW?=
 =?utf-8?B?dWRwV09rU2swMWJoUmlqNnJzVWhjaHVpYUYzMFJyOGcreDhEU3dIL2lwK05o?=
 =?utf-8?B?SEJnMFFOdEJ4RE5kRjQ3Q0F4Q1daM0dkY3BvUGxUZk9MNmFPVHBnWUZJcEla?=
 =?utf-8?B?VzUrbFRyODFNMStJelJ2bmRDWDlOQnlhY2xHYjNZWUg4a3ZxVFhwMXBpWkZP?=
 =?utf-8?B?Vi9za3NzU3hyS0pNY2QyNXBnR0FnbXNmYWoxZUhEY3BSbzFRSlRpTDk2MDVM?=
 =?utf-8?B?bkZ0REdLRExqTEhXSEJoQ1ZiTVNXWnpjVmlKZzdPc01yTGRlaU1rQzdqTEdo?=
 =?utf-8?B?STE3d3JkTjlPbW91Ry80WjlSM1Q1MEF5R3hPcTdiYlA1RFNlZzFtWFAxSE84?=
 =?utf-8?B?cEtmdFA1M1V2aFFHT2I1MXZwc25DNVF0d0FXZ1RGTk1jWGk4VEQycnBianNr?=
 =?utf-8?B?dlZXRmN1TG1DVC9WNnlSUVVhZm5ZeFFmMStHblJDcVhEZDQvNENFMzBZRkRv?=
 =?utf-8?B?TE5pWlhBN0F3SHhYTFR4M0NEOFJCc3UzaTVMUkt0N3hXKzZFVHhyV2xhcGZG?=
 =?utf-8?B?UllSYUExWlpWWjMwWVVhSkYvNVRmaUlFSTY0bTBmRGdSNDVEM2N0N2xmcG5r?=
 =?utf-8?B?enlZeXhaUER6UlFiT0ZUbE1WRjlhYmFxU21QMzFEdXU4QnRYMzJkU0poc0Fx?=
 =?utf-8?B?a1BiOXhxeVZJWHJCVXBYbnBvSGw5WmllaW53R3RHbm4ra3pvLzJyczBZOVk2?=
 =?utf-8?B?UHlhUWJzNXY4ZEdCWVdxbmJLVE1Wcmc1Q1N6OFZYR2Y3dUd6MDR1V2lHNXFZ?=
 =?utf-8?B?akx4TDBaMHc5eW9mYTdTTHJpWDV1QXVJTCtEZ3d5aDQrUktmd2dNLzRIcEJx?=
 =?utf-8?B?RnVyRjgvQTNQaVJ2dFVPbmxuRVlQbXBUY1JVUFUyenlMQWlZOVlzbDdHOHlS?=
 =?utf-8?B?c2NUdnk0R05iSWx2cmhXWjFmMVV0YURSQUNuT2gxSkxVREJ3RVNEajFxZ2NO?=
 =?utf-8?B?TUhYMkpCUnBmalNLVHZSV2NVd1ZoTmZTLzJVZ0VsYThhbC9oajEzR2JwbHZh?=
 =?utf-8?B?YjludElQZ1dKS1BvUmVvZVNvV3YxWU5FMU11N09qWlBubDFFUmptak50UDZB?=
 =?utf-8?B?MXloaVdLbldYVUZ5RThOVzlqNURXK3dMRmZIbm9iWE9xamtLMk5RNTJlL0ZW?=
 =?utf-8?B?ZGRIRVRpVVRMM1dUbTd6ME50STlYOGZPYktRVVdIbFluTDdnU0lQWlp4Tm04?=
 =?utf-8?B?blRuWUN1YXZaTzBKYktFempITTZWa2ZnM3hWbkxqR3dlakwvNG5PNXlGekRJ?=
 =?utf-8?B?VDg0bS9nd0VIc1QyM3A0UUxPbEdKRWh2UnRJMHVpcFlUNFNiVDBkTlVhUUl1?=
 =?utf-8?B?c3pOWWQ0dktYbGg1NktvK1BuK2taVFZkV0V1T1NVOGxtQW5zU09EZ3Z3QmdX?=
 =?utf-8?B?VE8zVnl0TTlleVdvTWZtcWsvN3N1YkozN25IUjY2elR5Z0xwUnB3L25PT2c4?=
 =?utf-8?B?NWM1alhnNndZTEYxRkZUaXh3RWNNaDdWMmZKcnkwOXlNRnIyQzNjVFFLUXZW?=
 =?utf-8?B?aXZadmZjQUJLbDRNakF2NlY5NUFFNGwxQnZ6Y3ZCMlVkQ3FSSVN6OHEvSUVJ?=
 =?utf-8?B?U1FtQlEyZkJzUzcxbUhYNUx5VThKa095VlkvRmZVbjNlODhDZWFKRjZ1VzNx?=
 =?utf-8?B?elhUcVpURDVWM2pTYWJiK21WUVlVbldyS2xVbXBMeWM3UW1mK2t2Z0I5dkJx?=
 =?utf-8?B?Z2RKb3BwdnpvRzl5NDVSbUhHRHJPWnREeDBPbU9WTXMrSXV5VHZvY0hlNzZk?=
 =?utf-8?B?VG9NajZkWUdWRzFYMDh5Q2hnRkRNQzJWdWk2NWtvSmdpZFZsbCtBTlVkTWlB?=
 =?utf-8?Q?Tjn7DOnSX6VTK?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc1bac3e-5dd9-457c-1cd5-08d9689a3c26
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB4623.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2021 14:03:09.4597 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YinmDVD2v6tccNHKOrUVOnnGxhPgLty2S27IuFTtEVFjOEWzaPJAxX5aFzlakzrYPy2IA/RhMqq2I00/OU9djw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4381
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


On 2021-08-26 12:55 a.m., Monk Liu wrote:
> issue:
> in cleanup_job the cancle_delayed_work will cancel a TO timer
> even the its corresponding job is still running.
>
> fix:
> do not cancel the timer in cleanup_job, instead do the cancelling
> only when the heading job is signaled, and if there is a "next" job
> we start_timeout again.
>
> v2:
> further cleanup the logic, and do the TDR timer cancelling if the signaled job
> is the last one in its scheduler.
>
> v3:
> change the issue description
> remove the cancel_delayed_work in the begining of the cleanup_job
> recover the implement of drm_sched_job_begin.
>
> TODO:
> 1)introduce pause/resume scheduler in job_timeout to serial the handling
> of scheduler and job_timeout.
> 2)drop the bad job's del and insert in scheduler due to above serialization
> (no race issue anymore with the serialization)
>
> Signed-off-by: Monk Liu <Monk.Liu@amd.com>
> ---
>   drivers/gpu/drm/scheduler/sched_main.c | 25 ++++++++++---------------
>   1 file changed, 10 insertions(+), 15 deletions(-)
>
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> index a2a9536..ecf8140 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -676,13 +676,7 @@ drm_sched_get_cleanup_job(struct drm_gpu_scheduler *sched)
>   {
>   	struct drm_sched_job *job, *next;
>   
> -	/*
> -	 * Don't destroy jobs while the timeout worker is running  OR thread
> -	 * is being parked and hence assumed to not touch pending_list
> -	 */
> -	if ((sched->timeout != MAX_SCHEDULE_TIMEOUT &&
> -	    !cancel_delayed_work(&sched->work_tdr)) ||
> -	    kthread_should_park())
> +	if (kthread_should_park())
>   		return NULL;


I actually don't see why we need to keep the above,
on the other side (in drm_sched_stop) we won't touch the pending list
anyway until sched thread came to full stop (kthread_park). If you do 
see a reason why
this needed then a comment should be here i think.

Andrey


>   
>   	spin_lock(&sched->job_list_lock);
> @@ -693,17 +687,21 @@ drm_sched_get_cleanup_job(struct drm_gpu_scheduler *sched)
>   	if (job && dma_fence_is_signaled(&job->s_fence->finished)) {
>   		/* remove job from pending_list */
>   		list_del_init(&job->list);
> +
> +		/* cancel this job's TO timer */
> +		cancel_delayed_work(&sched->work_tdr);
>   		/* make the scheduled timestamp more accurate */
>   		next = list_first_entry_or_null(&sched->pending_list,
>   						typeof(*next), list);
> -		if (next)
> +
> +		if (next) {
>   			next->s_fence->scheduled.timestamp =
>   				job->s_fence->finished.timestamp;
> -
> +			/* start TO timer for next job */
> +			drm_sched_start_timeout(sched);
> +		}
>   	} else {
>   		job = NULL;
> -		/* queue timeout for next job */
> -		drm_sched_start_timeout(sched);
>   	}
>   
>   	spin_unlock(&sched->job_list_lock);
> @@ -791,11 +789,8 @@ static int drm_sched_main(void *param)
>   					  (entity = drm_sched_select_entity(sched))) ||
>   					 kthread_should_stop());
>   
> -		if (cleanup_job) {
> +		if (cleanup_job)
>   			sched->ops->free_job(cleanup_job);
> -			/* queue timeout for next job */
> -			drm_sched_start_timeout(sched);
> -		}
>   
>   		if (!entity)
>   			continue;
