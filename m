Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DCDE7733847
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jun 2023 20:42:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C12CC10E138;
	Fri, 16 Jun 2023 18:42:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2065.outbound.protection.outlook.com [40.107.102.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F50510E138
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jun 2023 18:42:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n6qk8P4102VjHA1q7qFgP13J5Dtayg1C2UqSPSxrTOIU+e7qZ4EHdgwdM25zSIqrbiG6q930grhtoZI651thMMPZjMQpnKJV6fFdSwTn+RYDj2UY43RU73Bc+XwQA69DqCvZK7bNcUBOYeiq3hB2EKHimrSaTaNvixOsNfVTjmSEhXKuNAXzfR4dWL0PUam1hziCMdBM6nHTrqWBpUmOaACdnW5Nb91fUj0AWdPr/9xg1PaqR+nbdlbQ4gM5lcrAYSrENRsJ54o/DniVi74IhBgCGOLrHR9TWeZML99bGBUC3NQnaXJcf8cYRaBx2tv+8gUcyRuVVdA4ntHLIgxVxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uLAF7PGjw3bvOUXO1P67mCAPsUcny1rdLWCPz62G5oc=;
 b=b03mQqTBywhBDf9at9RNhlnVYKGS92lLD58TUXJNt6BNQTzujmdb4+og2w6PL8TAJvjxOFZgEXn0ipjFwK3HENkJZBgOSc3hMOow+qwgLjnNHZhMl3kDlp4B/hCqBXEyzhMBR06HDlxcujUUA86QHBTzDksxUinRaY9Z9xtZozrJa5kwO0HnPFg77dncSTsgdIJ6OTcHwl4DGVqIZT+Zi7nwPz10g+KPQMWQN4aAE58TWHetUo2V2NImMArJjRlK00qJGaWShJ0cZfYcNFSoeMUKAtgD0ie2f/y0qYUiOz9n0nXuh4RrUuMjScUAbtmLk+3PPQu9pDiVd6eKRYX9hA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uLAF7PGjw3bvOUXO1P67mCAPsUcny1rdLWCPz62G5oc=;
 b=Xy7f9itqLv+wA+TSTATOsG07g+871QH+fzg3Kv5F769KOw1Rn2UJUyjINaTwSmgQFwQgybfTrdglXIwPUCkFREKbZ7egM8m217S+nnDXGWoi/z9G9wVaE+4oNmTxWKdZSQnkur5As/jntb6QA4IduusaDX64WUKNaschSGSFMRY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by MN0PR12MB6077.namprd12.prod.outlook.com (2603:10b6:208:3cb::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.29; Fri, 16 Jun
 2023 18:42:45 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::384a:95a4:8819:ee84]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::384a:95a4:8819:ee84%6]) with mapi id 15.20.6455.043; Fri, 16 Jun 2023
 18:42:45 +0000
Message-ID: <f3676a1f-20e9-c4f3-87d8-b76d7770f91e@amd.com>
Date: Fri, 16 Jun 2023 20:42:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v5] drm/sched: Make sure we wait for all dependencies in
 kill_jobs_cb()
Content-Language: en-US
To: Boris Brezillon <boris.brezillon@collabora.com>,
 dri-devel@lists.freedesktop.org
References: <20230616171248.3228113-1-boris.brezillon@collabora.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20230616171248.3228113-1-boris.brezillon@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0204.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ad::13) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|MN0PR12MB6077:EE_
X-MS-Office365-Filtering-Correlation-Id: 846f4dca-59f7-4eb6-3d5b-08db6e9979da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QjDOYODiO6WBUFXnkDmmURkoFNxRkPvdX7KD7ArUSQbfWIq6tos7saXe5nf7BAWVz24cbL32JKnixBpJ+aAlRXcPdHFRJSn/3gfPej5s3u2pmsSMQoWrlZLhMiiqwvmwZ74v1fFnzmNvqgfVSw1B69vB41ttm/h7viCl+j9iXexq3w8neSbLwLcSKE6ux6roCRIykvkuIjcqRDNL8n86VqFi+vZj4P5+eE9VJ45hn7+vYDnlEfGiJL7XxyOo/LuV7qd2NpfEupZmlp5k6uJ7rNGFdfkDNIEUJrjr/2XO3PBzqYXRj+2YKyXaiwItEKQqCpvGbzDdJAG45oFaqsPE3L2aNMd1UOQk1Ap4KzAl8XeemBYUnDZHLDf1qMLmbmnZPWTogfLN9obhW/pMn9G3CWBXN9ZfiRJ8hbjADcURTQ/ULFO0IO81MwpaZmyPMi7I7lse+Dmhf0d8sdifVUpxOUKvoBtbtiqznh9D40cye+9AJvFxEy6Q9TTpvAHf0XUZvgwcjdcBRTSqHs0aYqUbhIqKeDZOAyPUDAbfFLWAU2SvJJ9n+Z5ouSyV95vmPb06mO7UYh26P72Iczsgi0U3iWu3C06dlWUJ61ZPDyaXbV6fibKy29sSsqkd+KIuvm/rozQ9f7MgdmeEhtWi0Xi7Dw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(366004)(376002)(136003)(39860400002)(346002)(451199021)(66899021)(2906002)(41300700001)(5660300002)(8676002)(8936002)(316002)(4326008)(66476007)(66556008)(66946007)(36756003)(2616005)(66574015)(83380400001)(186003)(6506007)(6512007)(31696002)(38100700002)(31686004)(86362001)(478600001)(54906003)(6486002)(6666004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?blFGQkZFdWExNjI1UzBLNWpiZjY5SmgvL0d6aERuSmtwMjdobzRCRFZKTzBN?=
 =?utf-8?B?dGxId1dhRGllNzJSY3gwaGVxOVNYN0g1UVl1Y3NZbU1RNVhvODNtY3F4THRC?=
 =?utf-8?B?WlM2SjFvYXlRZ1Zpbm42MTRIUHFsaW1qampoUXZQeG40UHFpRnV4aWNJRlJi?=
 =?utf-8?B?TTFNbEhKSk45UlNPeHVvaEJGZHFTUlloVStHbDZhWFBNb0FOLzBESVJrZUp2?=
 =?utf-8?B?bkl1alhzTjlYd01Fc2xmNFV0SzJ0Q3E0QklZYzlaRG5iMDd2aVkxRWxtbTFl?=
 =?utf-8?B?UHlRd1FaRzd5ck9VVk1uanNGRDhaSXJNZ3pyQkp3OG5wcHRrNnZLZHNidVRF?=
 =?utf-8?B?QWd3TmdCOFdzMUkySXNXWUVEUDVoNWl5UHJob21UVWhFUzRUaVJiTExULzFV?=
 =?utf-8?B?bkp5OG4zYU11Y1dNSWNrS3FnSS9BVjU4SnBYWVhUQlNIRXp6ZysrU2JCY0s2?=
 =?utf-8?B?M2I2TVI5WGlWVm5BeW9UT2pPeHFRWURiZHllK0F2NTlKU3RReHJmTTZCQUUx?=
 =?utf-8?B?MDFnMElocUhSVkZ3Y3lTZU5BeVRDanFnZUxSWTVJVVU5RkluYllYUitNMUdL?=
 =?utf-8?B?S3FsZ0poSWJ1QzgxQUc5ZEsvenpBRHNUbHUzY0lnL0d0clJRNlQreDJOeC9V?=
 =?utf-8?B?TzZLNDJhbDZMdjI0bXcwdkQyMHdjT2pLakJCbmpQVmdBMGw4a1h1cnNmR0ZO?=
 =?utf-8?B?a3VVcFplTVhhMjFnTnpCVDlucEdqSUdNVFQzQThPdHVjc0owLzlYWXh1SkpP?=
 =?utf-8?B?K2ZHa3Ywd1czZ0drS2FCQ0FoYmZCUlJpUjl2MFRId0NpRmp0WGZIWGdzMERP?=
 =?utf-8?B?R1dUV2R2OGpNNEVvUGFvZm83NTBsM1ZqS3Q3R3plZ3dNKzN6NlpDRmFRdUpr?=
 =?utf-8?B?aHhIaWJFK242Unc0L2VXU3BwQlpxUTBBL0ViaEtHQ0dXUXhMUnBZYTJyczR4?=
 =?utf-8?B?bVlkOGphZEhNRnF6N1ZLRUY5Q2pkTVlubDk4bllTck4yeHNheFlNTllORk81?=
 =?utf-8?B?bExFSGRNT3RCZmxvUjljeUNhYjdROUw2TnZvUStvZGowMW9scThSeWQ3TGJ2?=
 =?utf-8?B?a0RjcVJWMzU5QlpRcGNnMm5wNkNad0o3RWZBMDdVMENycXpCZE9IdlYyM3Ez?=
 =?utf-8?B?RVNOS2FzMnhKcER4ZjNmcVNTamo0azQ3VHdES0dXSE1kcmxwUDlDamFYQS9N?=
 =?utf-8?B?a3dIdml4MkRBbHZidlZJUjY4cFIvTnVaajlUeGxSM2FyQzdOcXh3MDJ2WGJX?=
 =?utf-8?B?VnY3N0NJTllOaURvTUVLVnp5Q1grc25WejFzekpudEFIZGxvektOcERmOGJT?=
 =?utf-8?B?d0dSY2s3aFNXdFdENGtvTzNuRXFBZytFT1lVT0JMa3Fscmt0eHp2eTFuQVhv?=
 =?utf-8?B?US9IM2VBNUZlU0ZUZHRaQTJQMkdOOUtKeGs5MXRGUXFESCs4Qnpxa2xneXIy?=
 =?utf-8?B?STVqcnVUUmhWeTlQSlNSVDdabHY4NXFYaU5mbDRxQkltdWU2TVNIbFQ1Nldq?=
 =?utf-8?B?RW9LRmhqR2JQUndjWXdYZ01VWW10RTg5MWZVajJoZG9TQlM1ckZtdXRlL2V2?=
 =?utf-8?B?TlF0a1M2M3FmMU5jMWF6RjBIQ1FzTFNXVis5dmFXNUh4ajJUeTBHMkZJanMw?=
 =?utf-8?B?S1FEdDNnM1BIdTljWkFXYk0rWnVrTzAxMWJXUFVtUzVJaGpKV0l6Q2w2OGFs?=
 =?utf-8?B?MlBPektTQ0Yxb016VWp5MHVBdGl6eU1WaVR3M21uMEpvT2FablppZFlWMmRG?=
 =?utf-8?B?eDNhTTBVNzlKL2dBc1BXRGN1cm52T21BdG1wcHdncHZ0TTMvRXBNbjFuS3RY?=
 =?utf-8?B?MDNzbVV5NWx5RSthdEJxODBLRENXRm1SWlBmN082Q3pVUXVFUXAzdTBIbEVU?=
 =?utf-8?B?MDhwN2lEdm9Fa3kxbVJRWmlVcjRwVHIra1NQNEFFVXlvWGY4c0Z6aHBqNEQv?=
 =?utf-8?B?WDNPd1AzWHBGQktWUlhWalVOS2Z2dStaelNyWlJpb2JFTFRHaFN1ZCtubkJZ?=
 =?utf-8?B?azRvaEFqbGdMRHRJMlQzUWsxTXBhaE9MbFBnMXBLSG9BYVh3TjJZajczL1hV?=
 =?utf-8?B?R1ovb2I2U3ZSRVFHODdjQ0w3T2o5MVZFblVZVEdxcTlEaS8zUXF2WEludmQ4?=
 =?utf-8?B?S3BudlllOGZwL3R4VmFzUXJqZ1UxbXlrRkZUNW5nM2NIek1ncmZ3UHp5RGIw?=
 =?utf-8?Q?Lwo0UFBTdZN3nKHa8ywF1+Vo/PBhlP/rO/hheK20oY8I?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 846f4dca-59f7-4eb6-3d5b-08db6e9979da
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2023 18:42:45.8506 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 50PKqy/6kjFpei280/L5qUUV+xPVObubtQvbuFOx/EBK2HTGpItZuzL2cmoUr9bz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6077
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
Cc: Sarah Walker <sarah.walker@imgtec.com>, Luben Tuikov <luben.tuikov@amd.com>,
 Donald Robson <donald.robson@imgtec.com>,
 Sumit Semwal <sumit.semwal@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 16.06.23 um 19:12 schrieb Boris Brezillon:
> drm_sched_entity_kill_jobs_cb() logic is omitting the last fence popped
> from the dependency array that was waited upon before
> drm_sched_entity_kill() was called (drm_sched_entity::dependency field),
> so we're basically waiting for all dependencies except one.
>
> In theory, this wait shouldn't be needed because resources should have
> their users registered to the dma_resv object, thus guaranteeing that
> future jobs wanting to access these resources wait on all the previous
> users (depending on the access type, of course). But we want to keep
> these explicit waits in the kill entity path just in case.
>
> Let's make sure we keep all dependencies in the array in
> drm_sched_job_dependency(), so we can iterate over the array and wait
> in drm_sched_entity_kill_jobs_cb().
>
> We make sure we wait on drm_sched_fence::finished if we were
> originally asked to wait on drm_sched_fence::scheduled. In that case,
> we assume the intent was to delegate the wait to the firmware/GPU or
> rely on the pipelining done at the entity/scheduler level, but when
> killing jobs, we really want to wait for completion not just scheduling.
>
> v5:
> - Flag deps on which we should only wait for the scheduled event
>    at insertion time.
>
> v4:
> - Fix commit message
> - Fix a use-after-free bug
>
> v3:
> - Always wait for drm_sched_fence::finished fences in
>    drm_sched_entity_kill_jobs_cb() when we see a sched_fence
>
> v2:
> - Don't evict deps in drm_sched_job_dependency()
>
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> Suggested-by: "Christian König" <christian.koenig@amd.com>
> Cc: Frank Binns <frank.binns@imgtec.com>
> Cc: Sarah Walker <sarah.walker@imgtec.com>
> Cc: Donald Robson <donald.robson@imgtec.com>
> Cc: Luben Tuikov <luben.tuikov@amd.com>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> Cc: "Christian König" <christian.koenig@amd.com>
> ---
> Hello Christian,
>
> It turns out the approach you suggested just moves the complexity to
> the insertion path, and it actually makes the 'should we replace or
> drop fence' test a bit more tedious. We might end up with less
> duplicates if some drivers start mixing scheduled/finished fences, but
> I doubt this will be the case in practice, and I'm not sure it's worth
> the extra complexity.

Yeah, and thinking more about it it actually doesn't solve the problem 
that the finished fence might not be around any more.

I think your v4 actually looked better than this. Feel free to add my rb 
and when Luben has no objections I'm going to push this to drm-misc-next 
on Monday.

Thanks,
Christian.

>
> Let me know what you think.
>
> Regards,
>
> Boris
> ---
>   drivers/gpu/drm/scheduler/sched_entity.c | 29 ++++++++++++--
>   drivers/gpu/drm/scheduler/sched_main.c   | 50 +++++++++++++++++++++++-
>   include/drm/gpu_scheduler.h              |  7 ++++
>   3 files changed, 80 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
> index 68e807ae136a..ffdee2544f42 100644
> --- a/drivers/gpu/drm/scheduler/sched_entity.c
> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
> @@ -176,13 +176,14 @@ static void drm_sched_entity_kill_jobs_cb(struct dma_fence *f,
>   {
>   	struct drm_sched_job *job = container_of(cb, struct drm_sched_job,
>   						 finish_cb);
> +	unsigned long index;
>   	int r;
>   
>   	dma_fence_put(f);
>   
>   	/* Wait for all dependencies to avoid data corruptions */
> -	while (!xa_empty(&job->dependencies)) {
> -		f = xa_erase(&job->dependencies, job->last_dependency++);
> +	xa_for_each(&job->dependencies, index, f) {
> +		xa_erase(&job->dependencies, index);
>   		r = dma_fence_add_callback(f, &job->finish_cb,
>   					   drm_sched_entity_kill_jobs_cb);
>   		if (!r)
> @@ -415,8 +416,28 @@ static struct dma_fence *
>   drm_sched_job_dependency(struct drm_sched_job *job,
>   			 struct drm_sched_entity *entity)
>   {
> -	if (!xa_empty(&job->dependencies))
> -		return xa_erase(&job->dependencies, job->last_dependency++);
> +	struct dma_fence *f;
> +
> +	/* We keep the fence around, so we can iterate over all dependencies
> +	 * in drm_sched_entity_kill_jobs_cb() to ensure all deps are signaled
> +	 * before killing the job.
> +	 */
> +	f = xa_load(&job->dependencies, job->last_dependency);
> +	if (f) {
> +		/* If the entry is flagged as 'wait-for-scheduled', we are
> +		 * dealing with a drm_sched_fence and we want to wait for
> +		 * the scheduled event only.
> +		 */
> +		if (xa_get_mark(&job->dependencies, job->last_dependency,
> +				DRM_SCHED_DEP_WAIT_FOR_SCHEDULED)) {
> +			struct drm_sched_fence *s_fence = to_drm_sched_fence(f);
> +
> +			f = &s_fence->scheduled;
> +		}
> +
> +		job->last_dependency++;
> +		return dma_fence_get(f);
> +	}
>   
>   	if (job->sched->ops->prepare_job)
>   		return job->sched->ops->prepare_job(job, entity);
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> index 394010a60821..8ac207cbd713 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -691,6 +691,8 @@ EXPORT_SYMBOL(drm_sched_job_arm);
>   int drm_sched_job_add_dependency(struct drm_sched_job *job,
>   				 struct dma_fence *fence)
>   {
> +	bool fence_wait_for_scheduled = false;
> +	struct drm_sched_fence *s_fence;
>   	struct dma_fence *entry;
>   	unsigned long index;
>   	u32 id = 0;
> @@ -699,20 +701,64 @@ int drm_sched_job_add_dependency(struct drm_sched_job *job,
>   	if (!fence)
>   		return 0;
>   
> +	s_fence = to_drm_sched_fence(fence);
> +	if (s_fence && fence == &s_fence->scheduled) {
> +		/* Make sure the finished fence hasn't been destroyed. */
> +		fence = dma_fence_get_rcu(&s_fence->finished);
> +		if (WARN_ON(!fence))
> +			return -EINVAL;
> +
> +		/* Release the scheduled fence ref, now that we have a
> +		 * ref on the finished fence.
> +		 */
> +		dma_fence_put(&s_fence->scheduled);
> +
> +		/* Waiting for scheduled event only. */
> +		fence_wait_for_scheduled = true;
> +	}
> +
>   	/* Deduplicate if we already depend on a fence from the same context.
>   	 * This lets the size of the array of deps scale with the number of
>   	 * engines involved, rather than the number of BOs.
>   	 */
>   	xa_for_each(&job->dependencies, index, entry) {
> +		bool entry_wait_for_scheduled, fence_is_later;
> +
>   		if (entry->context != fence->context)
>   			continue;
>   
> -		if (dma_fence_is_later(fence, entry)) {
> +		entry_wait_for_scheduled = xa_get_mark(&job->dependencies,
> +						       index,
> +						       DRM_SCHED_DEP_WAIT_FOR_SCHEDULED);
> +		fence_is_later = dma_fence_is_later(fence, entry);
> +
> +		/*
> +		 * We can replace entry by fence when:
> +		 * - fence is after entry and both are waiting on scheduled
> +		 * - fence is after entry and both are waiting on finished
> +		 * - fence is after entry, entry is waiting on scheduled and fence on finished
> +		 *
> +		 * We can keep entry and drop fence when:
> +		 * - fence is before entry and both are waiting on scheduled
> +		 * - fence is before entry and both are waiting on finished
> +		 * - fence is before entry, fence is waiting on scheduled and entry on finished
> +		 *
> +		 * In all other situations, we can't guarantee the order and have to duplicate.
> +		 */
> +		if (fence_is_later && entry_wait_for_scheduled >= fence_wait_for_scheduled) {
>   			dma_fence_put(entry);
>   			xa_store(&job->dependencies, index, fence, GFP_KERNEL);
> -		} else {
> +			if (fence_wait_for_scheduled) {
> +				xa_set_mark(&job->dependencies, index,
> +					    DRM_SCHED_DEP_WAIT_FOR_SCHEDULED);
> +			}
> +		} else if (!fence_is_later &&
> +			   entry_wait_for_scheduled <= fence_wait_for_scheduled) {
>   			dma_fence_put(fence);
> +		} else {
> +			continue;
>   		}
> +
>   		return 0;
>   	}
>   
> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> index e95b4837e5a3..fbdb01242997 100644
> --- a/include/drm/gpu_scheduler.h
> +++ b/include/drm/gpu_scheduler.h
> @@ -262,6 +262,13 @@ struct drm_sched_rq {
>   	struct rb_root_cached		rb_tree_root;
>   };
>   
> +/*
> + * Used to flag dependency entries that are backed by drm_sched_fence object
> + * and on which we should only wait for the scheduled events.
> + * For internal use only.
> + */
> +#define DRM_SCHED_DEP_WAIT_FOR_SCHEDULED	XA_MARK_1
> +
>   /**
>    * struct drm_sched_fence - fences corresponding to the scheduling of a job.
>    */

