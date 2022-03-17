Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CB724DC39B
	for <lists+dri-devel@lfdr.de>; Thu, 17 Mar 2022 11:06:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D741610E7BE;
	Thu, 17 Mar 2022 10:06:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2073.outbound.protection.outlook.com [40.107.243.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5386810E789;
 Thu, 17 Mar 2022 10:06:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JYF/f61uWdTDihnMLy8NzYLywcmrqrAJuNIKdhthpOE3bzkpfIZJHBPemrsgRscfaQ8DRbUbSIEvfJZNRoZiIeDxxod+oLzHoj3Upzj0GyRkqL4rR9RJMW4PtLyocVPQG6n3s6b2sEJ9dtvRE+qx/17MkvO13/vPygkmPBXyL2/YsJaS/8qI3i7+urviNVzbS7LZ7utyHmtvUUgkGZ57M6/nzEAk4vq5y8lxW1sCWQ86WDZNEhndO0en65ThHP/W6SmEwLNwASJKZCzD1A9zD7bdsHWban75bN4Qytf5ljtbO4+k9NiCFimM+5RXfMgglDwvhwHiRxvzi1E0slAD2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c/eDdtq4jGFhZibd89xFemd/P+diQMoXSKkl0f/fgKA=;
 b=WpmvDHTAGDw/Fyo0EhCcy/YGNOzkfsfXy+YcIT7SVjQ+eyOlqEIu+NrmbI/GzlfBUqCRB6sshZqD8KGQcSRe7854SADMOFmVRHpdep/5eBq3tVGa51NBZdF1fOXfDs3m3o8AcGIaywhmYSvxzvcNqpN5lOkdJUSh5NpVkgBivaSlqjXZLUp0VgMYYB3pq4ms/YUwUCKnl6PaxyQnMvP6MwyRMKwhxmyQNMMN3Hq+5R8ssrL6eJUD3xOPQ4iFaXFp4vQK3JosYuCtrvhnSIWLgpjgvw6SkyUffFSyGSJDLYpJcNqQAi+9Dg1zrl9GdniU1q3sb6RHURKfvHfhOTV3sA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c/eDdtq4jGFhZibd89xFemd/P+diQMoXSKkl0f/fgKA=;
 b=EBi/D9MloocTLwUdgiS16nrSZ4kj7KPfk9kysIO/FN9G30gT3iZjOkI8E3e++0yJYJbzOYA9Cyan210sCwBwchEdYovZq/x8lN4pMrRpFQjHH2eO4M8FFZCdcmayJJnf/WyzY6bXCPZG+kCzezaDEIAlv153MIefFpjBlcbpb8I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by BYAPR12MB3608.namprd12.prod.outlook.com (2603:10b6:a03:de::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.17; Thu, 17 Mar
 2022 10:06:25 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::404f:1fc8:9f4c:f185]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::404f:1fc8:9f4c:f185%6]) with mapi id 15.20.5081.015; Thu, 17 Mar 2022
 10:06:25 +0000
Message-ID: <3945551d-47d2-1974-f637-1dbc61e14702@amd.com>
Date: Thu, 17 Mar 2022 11:06:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 2/3] drm/msm/gpu: Park scheduler threads for system suspend
Content-Language: en-US
To: Rob Clark <robdclark@gmail.com>,
 Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, Rob Clark <robdclark@chromium.org>,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 David Airlie <airlied@linux.ie>, Akhil P Oommen <quic_akhilpo@quicinc.com>,
 Jonathan Marek <jonathan@marek.ca>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Vladimir Lypak <vladimir.lypak@gmail.com>,
 open list <linux-kernel@vger.kernel.org>
References: <20220310234611.424743-1-robdclark@gmail.com>
 <20220310234611.424743-3-robdclark@gmail.com>
 <YjMGac4Hnjmg1wE8@phenom.ffwll.local>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <YjMGac4Hnjmg1wE8@phenom.ffwll.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8P189CA0013.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:31f::22) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a8982b78-4e0a-43ea-ed85-08da07fdcbcc
X-MS-TrafficTypeDiagnostic: BYAPR12MB3608:EE_
X-Microsoft-Antispam-PRVS: <BYAPR12MB36080ED1823323196AD77D2083129@BYAPR12MB3608.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5GNUoU4NzLAFgZT5eiuE8x6SuQA3HE7r9bHyF3G6HgF9ZGbN2W9rVUQ9P00fm37B2emHemxkbDvNdzyAKjmyx6T9LDZINDaqVAw3nnHHXIEcCjya36wQsDJq9sqnmml205PWQKztiLfOYGwfqN1vEc9Wb3S5XrQy5sR0gYrQ8j69ktHxKsiT2shjJ+OLE7QiYQhWMJB7qGZBViBYfuowd9k926hQiGK410YEFoUhutX9QCpuWdSzEZZxZZ7TrS4J+Oh+8EiCS+Hkt30wGPMxJJiTlH5KRixHNUwAkqyvTwausIvWs2dZkH/STZZUHP0CBRxRmRhtBdyL/wlPOA8hGnQPNyA2+sL/J7YOhRwWEVRgrt4rgkVvu65AoPdsFyCl2C37I3Wqb1LmZnRB8LcH6efSPnc9qrrYIXsbIgt9nay7khhAlp1edWJFv9tBIyGAUsq6ETAOeI8sZ2YYMr/Hp3/fTmkgrgNdqTTPDSkxzGsa08zJ3J/Qj3x2YPZ+gUpCJdCQ85jiTevShysdqLeP5tqtjmI7XHYsWeWnKBHKU2LqiUqN+qMlyHFptuymIWCwWi7ZKRyfu4ovBlkqK1OGVy472EXZ7SkBgB1td8pL4J8HOpvCoo7IlTT85+dO5Zzycn3MHkQKaL0/XSckhoLJcd09o8QEc/CxveNMoJPzTszdSxFsmytgtOBCtmPLAoCHizJXhsEFwEI7bOC+sqKXRa3BTMRLCiA7ZvXYLF9KHWopuTIqQ/7Tfg8xJB0YI3sKmtrOqexFUSiZC4eAMHWxLA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6512007)(6506007)(38100700002)(508600001)(2616005)(6486002)(31686004)(2906002)(83380400001)(7416002)(8936002)(31696002)(86362001)(316002)(15650500001)(110136005)(8676002)(66556008)(26005)(66476007)(36756003)(66946007)(6666004)(921005)(5660300002)(186003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ekpCdDV5ajVjb00wMU9sblhNT2xHVEhKdm5FRUU2RlZxVlZ5bUpTdzhLanFi?=
 =?utf-8?B?ckp4QUN6d3UxTVZ5dXhlSERIbS8vWE5zUENzUU51RTZLRjY5YTBqYWdTRXhj?=
 =?utf-8?B?WFdXWWVmN0Q3WEk2d3ZXNFlWMXJraTVkWkl3VThpSHlRWDRLNlprN0oxa1VG?=
 =?utf-8?B?ZmwvMjl5OGxMWlRINitLWlZXcGNCY2IyeFlQQ041K3d3Zy9DSUdTbjZQNGZr?=
 =?utf-8?B?c254ZncwdkNGdml6TUhPUktXaXlDbVgyMmtFWVQyYTRZWEU1S2FTWnBuTzNB?=
 =?utf-8?B?TGFDbTJ0MjB3Z0w3VGFrZTRmSStIaWpPNVpSRzdxcEw1OVl5bWdYbG96WnNT?=
 =?utf-8?B?ZmgrNDVYS3l4eW5VUlRqNUVnK203SHBFVHJSTklVcGZkdUY5c3BDZ3Ewdk5R?=
 =?utf-8?B?UFBTL1RKUmxxMEpGMFpHM0c5RFVhNEtwTTRmUS90MGtrU1BOR2lNMXl0eFhn?=
 =?utf-8?B?eVAwMk9DQzV1TXNXeTRsMmRiL1lyMGlqRFU5MTlXcUVycm92ZDQ5cHZNc2tT?=
 =?utf-8?B?cFNHK1h6UjFibU1zZE5kbXlKbXVHOXhJRis1dGluemR5Ly95WEExMVp6djJD?=
 =?utf-8?B?VGJMSFVxcjFGak90andCZ2JGMUp0R0o1N04rQmVLSEFubWk1S2QwdG5MNCtM?=
 =?utf-8?B?Z0Uxdy9ranE5TGNxakdmcFZGU0NuSnJGbVZWOTMyUERkQmM2cmx3NmkvQzVt?=
 =?utf-8?B?WHN1MDZ1QTdUdHVWeEcvVUR3a1ZlcEZEMkJBTjhpYjBGOElaRTNaOGh2cVBD?=
 =?utf-8?B?azJsVTh0eTViaTBjWUJhZUsyV0F3VHFNaDZrMzRmU3JDelJGUGR1dmdRUWFr?=
 =?utf-8?B?YXltdUJTOXR6eTl1WC9GOWxtT2VlRXZIU01Sb0ZtWGl1UHlQY01NdXlHRkt2?=
 =?utf-8?B?eXpQT01nYVRqdkZRY2RMbWFkZzZzbUN6RlY4RTc0ZmY4UG8yMmFsblhBUlNv?=
 =?utf-8?B?TGFoT2FWSXA3VkFzWk5rdnlIOTFqSTcyMkJlekVRNUJjaFJDWTdoTm0zbVlG?=
 =?utf-8?B?VlEwazhGWlNKZU1leGpFbFltZy9RcUNFdU5xZm9sVElkbzZObHBBQXJTTlN3?=
 =?utf-8?B?RXFnTytBTDVRc0R3VHEyRk1pTkdkdVFta1dnTlpVR3dYUWNobSszZlJDZVdD?=
 =?utf-8?B?YTU3K0xQSEh5RDJETnN4VEZtbW5YV2dNbEdvNTN5QVhpMFVOcG84bXNFWEZK?=
 =?utf-8?B?NGk0UEFRcjZ0cXBVWUdISWlQQ3J4ZUFzd3hqWWQ1aXQvUDc4NUVRUndOVXk5?=
 =?utf-8?B?NG9yRTFMNXJwb1NSQldkSUk4TTBXQ3h0YzFpT0ljQjFzUDR1M051YWNRczI1?=
 =?utf-8?B?QWJMRGhHbVlOamFtaFovTmhVTE1lcVVUa3BTNzZsZllpWmc4bG4wZnBOb3R4?=
 =?utf-8?B?dDIxV2FPWW82bHcrZy84Y3JmTVhPQlR3QnBwVGNpMm81MFF2ajZYQWUvdGow?=
 =?utf-8?B?ZmpkUjhiRS9WR0labWIyakVJRE5aeWJPa2lOUmQyS1lGZ0Q3TWh6Qkd5RmJu?=
 =?utf-8?B?V1U0YmFVMmFnZmUvamN4M3JDN1B5bEZYSDRMTFQ1MEt3ak1zaEtVeTRUY2ZN?=
 =?utf-8?B?YWtXcGs5RmlhVGJGTE1zRUlQdVhSM3dkOWdPbVFqTXFzTHRKUy9hMXYvZlpZ?=
 =?utf-8?B?emxBanBxVTNvT3dDeVAzZ0xkM0w0ditsSk9qQUV6N3Z6bHBsR0hHcnBrK2p0?=
 =?utf-8?B?eTRKd2d1WFdpV3lCaFBLWGJQNlFhRmVoMkRFRjRTS1hrWm8wSnFVMjVJZFBR?=
 =?utf-8?B?cVlKWFJmYWQxVWZ5Y2VwVHRJQ29BdmhwMXA0L0ExUk5Yd3FoWjVIaFcvazZS?=
 =?utf-8?B?dWVrdDE1cmpxOHkrU3JvSjVlcTEzUlY1aE13VG5XY0duOUFheXkxQzZ2eWJY?=
 =?utf-8?B?OWxjalVWSEhXZHIxdFh2VHNBMExYaVZGNjRBeVhRZFlmR0VqU3JhcnB2bVh2?=
 =?utf-8?Q?ZA2dxs8J5B7WAVbmhTdSRigSLoaQypPO?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a8982b78-4e0a-43ea-ed85-08da07fdcbcc
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2022 10:06:25.5702 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YC6Cdpb5HY9IRvqjBXaWl/RCLedIB1DTXhwT9VwkfXpDbTGobkiWZzKH11ktyOxJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3608
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

Am 17.03.22 um 10:59 schrieb Daniel Vetter:
> On Thu, Mar 10, 2022 at 03:46:05PM -0800, Rob Clark wrote:
>> From: Rob Clark <robdclark@chromium.org>
>>
>> In the system suspend path, we don't want to be racing with the
>> scheduler kthreads pushing additional queued up jobs to the hw
>> queue (ringbuffer).  So park them first.  While we are at it,
>> move the wait for active jobs to complete into the new system-
>> suspend path.
>>
>> Signed-off-by: Rob Clark <robdclark@chromium.org>
>> ---
>>   drivers/gpu/drm/msm/adreno/adreno_device.c | 68 ++++++++++++++++++++--
>>   1 file changed, 64 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
>> index 8859834b51b8..0440a98988fc 100644
>> --- a/drivers/gpu/drm/msm/adreno/adreno_device.c
>> +++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
>> @@ -619,22 +619,82 @@ static int active_submits(struct msm_gpu *gpu)
>>   static int adreno_runtime_suspend(struct device *dev)
>>   {
>>   	struct msm_gpu *gpu = dev_to_gpu(dev);
>> -	int remaining;
>> +
>> +	/*
>> +	 * We should be holding a runpm ref, which will prevent
>> +	 * runtime suspend.  In the system suspend path, we've
>> +	 * already waited for active jobs to complete.
>> +	 */
>> +	WARN_ON_ONCE(gpu->active_submits);
>> +
>> +	return gpu->funcs->pm_suspend(gpu);
>> +}
>> +
>> +static void suspend_scheduler(struct msm_gpu *gpu)
>> +{
>> +	int i;
>> +
>> +	/*
>> +	 * Shut down the scheduler before we force suspend, so that
>> +	 * suspend isn't racing with scheduler kthread feeding us
>> +	 * more work.
>> +	 *
>> +	 * Note, we just want to park the thread, and let any jobs
>> +	 * that are already on the hw queue complete normally, as
>> +	 * opposed to the drm_sched_stop() path used for handling
>> +	 * faulting/timed-out jobs.  We can't really cancel any jobs
>> +	 * already on the hw queue without racing with the GPU.
>> +	 */
>> +	for (i = 0; i < gpu->nr_rings; i++) {
>> +		struct drm_gpu_scheduler *sched = &gpu->rb[i]->sched;
>> +		kthread_park(sched->thread);
> Shouldn't we have some proper interfaces for this?

If I'm not completely mistaken we already should have one, yes.

> Also I'm kinda wondering how other drivers do this, feels like we should have a standard
> way.
>
> Finally not flushing out all in-flight requests sounds a bit like a bad
> idea for system suspend/resume since that's also the hibernation path, and
> that would mean your shrinker/page reclaim stops working. At least in full
> generality. Which ain't good for hibernation.

Completely agree, that looks like an incorrect workaround to me.

During suspend all userspace applications should be frozen and all f 
their hardware activity flushed out and waited for completion.

I do remember that our internal guys came up with pretty much the same 
idea and it sounded broken to me back then as well.

Regards,
Christian.

>
> Adding Christian and Andrey.
> -Daniel
>
>> +	}
>> +}
>> +
>> +static void resume_scheduler(struct msm_gpu *gpu)
>> +{
>> +	int i;
>> +
>> +	for (i = 0; i < gpu->nr_rings; i++) {
>> +		struct drm_gpu_scheduler *sched = &gpu->rb[i]->sched;
>> +		kthread_unpark(sched->thread);
>> +	}
>> +}
>> +
>> +static int adreno_system_suspend(struct device *dev)
>> +{
>> +	struct msm_gpu *gpu = dev_to_gpu(dev);
>> +	int remaining, ret;
>> +
>> +	suspend_scheduler(gpu);
>>   
>>   	remaining = wait_event_timeout(gpu->retire_event,
>>   				       active_submits(gpu) == 0,
>>   				       msecs_to_jiffies(1000));
>>   	if (remaining == 0) {
>>   		dev_err(dev, "Timeout waiting for GPU to suspend\n");
>> -		return -EBUSY;
>> +		ret = -EBUSY;
>> +		goto out;
>>   	}
>>   
>> -	return gpu->funcs->pm_suspend(gpu);
>> +	ret = pm_runtime_force_suspend(dev);
>> +out:
>> +	if (ret)
>> +		resume_scheduler(gpu);
>> +
>> +	return ret;
>>   }
>> +
>> +static int adreno_system_resume(struct device *dev)
>> +{
>> +	resume_scheduler(dev_to_gpu(dev));
>> +	return pm_runtime_force_resume(dev);
>> +}
>> +
>>   #endif
>>   
>>   static const struct dev_pm_ops adreno_pm_ops = {
>> -	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend, pm_runtime_force_resume)
>> +	SET_SYSTEM_SLEEP_PM_OPS(adreno_system_suspend, adreno_system_resume)
>>   	SET_RUNTIME_PM_OPS(adreno_runtime_suspend, adreno_runtime_resume, NULL)
>>   };
>>   
>> -- 
>> 2.35.1
>>

