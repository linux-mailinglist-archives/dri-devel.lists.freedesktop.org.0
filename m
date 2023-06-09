Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 197F67298BF
	for <lists+dri-devel@lfdr.de>; Fri,  9 Jun 2023 13:54:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57C4C10E68E;
	Fri,  9 Jun 2023 11:54:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2086.outbound.protection.outlook.com [40.107.101.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4078F10E68D
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jun 2023 11:54:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g+JLfMywbR9j4PuIgsmLosMGws5Ycrz4Bn6Th+ln+mWEefdoxvcga7mbLfE3uLHsX1a7wx0Dl7V/WCg1T+6B2KczZS/3bwu0slHl+I2IysWg/89CsdTVzojvYWOJgKe0PxUkGG/ESoDk8+anL1h28zTO89VxsYgX+4Wazo6EqouY1GKBwC4FZZXzhIxYp20tOWCvGh9aG29MITwz3WRmDg3MFWwdqQjXXEMbSLO4FIqE/uAY69bxn3DfLJxuVyKBVbFM17va1sX0IxHZC6E9dBg+SwzwasvR1INjb2n6nJB0izzy0PWv+4VmdHWDC5BAMh6qMEFlDbBKwH+DZwAiQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WuWg7/96U2lCDHrht/W4VvRAZnmMeUvP1E+/oGmvCW8=;
 b=cYZzWqVCLg9KnZ/0sfZFyK+ugv/s3veRTiPolu6afuThcQeq339HQogEJF0VWZg91Ib2pgP8VO4C2OJ2PBvQNyIXcJVGQzrCJozOmmahBOVncb7YzNKbta/sGObxFDep/iWmd3F2ypGUh4vA3yKGQ5stlwG4klGmNmzhd58qvIWth036tnGbO+miifuj4WqntaKqhKTzVnGs52RUs9RrjT4jxmUO/AAzG6ms8fPHzrcs4Zg+b2PDzRTtuI3JAIPGEK1fT+h158b3bn/r8OMdtnXXBaVHO0SaMFMMx91mBUXfxkYXsSzt5dPdS+iabZo1gTc99cK9KidvPt5CZacvng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WuWg7/96U2lCDHrht/W4VvRAZnmMeUvP1E+/oGmvCW8=;
 b=b01Q4Fyt4QC1PgzyYKJnhnhqW6Y1iaJxzWWI8BcJOQbKS8/RmHm2vFmvlM08rg9W8zA1Kh1pLVsiXi/GMbkiDqPfqS0uR3nLvEIUSEEuPA/TEUHQZVxofB26+8w4K3CxqXPJ7RCxk3CsM6IC2TT9z3U/MGxUZ9ZVGf1t5mWH/hM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by IA1PR12MB6531.namprd12.prod.outlook.com (2603:10b6:208:3a4::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.38; Fri, 9 Jun
 2023 11:54:04 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::6729:a735:9814:97ea]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::6729:a735:9814:97ea%6]) with mapi id 15.20.6455.039; Fri, 9 Jun 2023
 11:54:04 +0000
Message-ID: <bec5582e-2172-cb01-c8b2-283b9aab414a@amd.com>
Date: Fri, 9 Jun 2023 13:53:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [RFC PATCH] drm/sched: Wait for the currently popped dependency
 in kill_jobs_cb()
Content-Language: en-US
To: Boris Brezillon <boris.brezillon@collabora.com>,
 dri-devel@lists.freedesktop.org
References: <20230608065551.676490-1-boris.brezillon@collabora.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20230608065551.676490-1-boris.brezillon@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0065.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::20) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|IA1PR12MB6531:EE_
X-MS-Office365-Filtering-Correlation-Id: 4450511e-588b-4f61-33c4-08db68e03907
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SrvI0+AZ7+yh+qaR1sfTUYfpZpa8vMvTEutKrwNkgRgb57VdnXGc4uS3yTqFY51FF0X2RH0NrkZaju79cn4AbBMMcjbIKFPd1xBzXMgr3klfBOtvZ1AZFskEBzoDk8U8p7anz09PG7/zQaBWrf5oDpKVIk5ypv4qEqFy1js0uBd5X6Lw+E4f3OqJ1+OtfdP6iTUthxgDw2my4GfauaLkz4bdJwv7KXqxopiVqtrVh9B0VVbVoUbeCQD2pm1KpfV3S0SXRmAeXNoNBiup3KvPWAotNHEZ/u7kKyoITg3kbgho0DGiNP5lijhnHS3XcGo+A/Gp4UAKnbWtXAC8Pl28PYXVHT+ZFcIYv+lNN557fhKyeY0gW9iB+hunLRw8R5U8wYmyRbysyPckLS6o5BgVkhWJk2e1bIPQBG7bV82NS0N/burqRgurwOhXFtefFJp7kL5WzVEqAXOoGP/IwKhhtHwr+ZQt/VvEkBkSMhUZj0NXb1nrDLps4FtgfxIgESeBrAnyErilQKmtgu9eqimEadxnPEYPwS/ZzwJbwl3mAjSV5SEv4A4Po1lT57FWkOK8ABpHJ9uJkKiHIYLg1sBLYowBc+iJE1DyRTLbPcgwwcZETD+04+OiwapmjOgPYbZj9+jM9RTJ40K3ncesRqu0Tg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(346002)(366004)(39860400002)(376002)(136003)(451199021)(66574015)(83380400001)(54906003)(36756003)(478600001)(8676002)(8936002)(41300700001)(66476007)(4326008)(66946007)(66556008)(316002)(31696002)(5660300002)(38100700002)(86362001)(6666004)(6486002)(2906002)(186003)(6506007)(2616005)(31686004)(6512007)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U1c1a0kzQjdPTmpHUUVBVHB3bm1KUmQrdHJUWG9Pb2l6MmFvMjdSVUVoSXkw?=
 =?utf-8?B?QmptZjZjU2R4OWdZR2ZpK0ZVK2N3TDE5VFZVUzhmZkZnM0QxU28rSWFsZmh6?=
 =?utf-8?B?SkZwVnFLWW5DVnBtVTdBekRMcHpHSE03OTJjZStIM0Nzb2hpRDFRZWZ6Z0Fy?=
 =?utf-8?B?Q1M2TzE4OUNhU0cxRCs1MlAzOUJmM1c2NU1VSmZzY2FwTTdSRTZMNjRtQVd1?=
 =?utf-8?B?ZlVTajFoYmJXcWpNZ0NxZUpTbWlKZ0c1cjMvNG1UWndQaDQzRzM3dEZOa2Vp?=
 =?utf-8?B?WEJ6MDhDU054YkhYRFo2Nk9xd2ZJYnljbk9VemhjZGUyMVJqUC9aYmhjWjNP?=
 =?utf-8?B?VzRrRXV1N2Z6OEpYYXVVT1ZhTUFaQVZMUk01Y1pNSE8rK3k2Z1duSkZHMEhM?=
 =?utf-8?B?VHdkdjJoWU9CSkx6aDdxL0VaWlFtajZEckYxUUhoRnNBcm9aUkhJVzg0UVo1?=
 =?utf-8?B?UjNLZ3RiZ045d083THhFV0lkaUYyWEZkby8rWWlhTENhN1BTaWFvcDAwSXZC?=
 =?utf-8?B?VnN5amhkWDBKbTFrZ04ycXNtR1Z4SHRxTFY1MW85S2EwaDBEUEcwMVRGaWN2?=
 =?utf-8?B?MS9iQm9pM2hLbExJSjJZRkZxUUJ5cURjRURoMDV3TVVIYzNWRDVoaHUyUmo5?=
 =?utf-8?B?bGwvUktBY1R2Q09FNDczVlc3UVBuMXZQUHpMeHZBaUR4Rnozd1ZaYytna2h1?=
 =?utf-8?B?bC92U00yMHhYMmZBVWpic05kaEQrY2YxdGxQY3VVS0hsbXVXSGtLUjFtRWw1?=
 =?utf-8?B?NzV3SE9Ma0ZkSlc2YmRvL0dpeUl5SUh2WEdnSHlZTWoyZEloMEF6U25Iczdt?=
 =?utf-8?B?ZVBDRmo2dUpIWUpMbTc5cFZyMTJpcXRya1B0VTB6ZEJNZC9mOGZZRWpabEFE?=
 =?utf-8?B?Ym40QUtrRERnL0dTdTR3TTkrTnZ1REg2SjdPNGpZNzlmT0pNOEYzQVBkQ2xw?=
 =?utf-8?B?L3RXd09ldjAyN3hjNUIwUHc5WERIbFdaNXlYU2VyQTdoeHlvcnFILzNkUVQ3?=
 =?utf-8?B?TEU5UDZPNFcrUk1VeG4zWFdPKzd6VG1vNWdWVVU0NlF3WGNHd3VMKzkxU0dB?=
 =?utf-8?B?OHBJNjBhcEtPYXpYdEFFaHowUXlrTFpiUWZ6bWg3VVVTandsMmMrVTRjLy9h?=
 =?utf-8?B?V2hmRXpKenE5YjJqYm5DQTRsaUdVazl3NGt3TUFCVlFEWXFPUTdlSWxIem5o?=
 =?utf-8?B?VUZiVGd5WGM0LzQ1MXV6aXN2ZUNrSUxiRm5IZ2J5Vkw4ajJEd3lKTy9MTXMr?=
 =?utf-8?B?WGxoQ0tNMlBOdWRwSTAzUW1YeWU2S2dCajkySmFNWm0xSzN5Vnd4OTVGRTdk?=
 =?utf-8?B?bWJNMVR1d0p2YzBpeWJhS2thaUJPazZqNTk4T1NJRFJnQllxeENuMzZJc3lG?=
 =?utf-8?B?SG5HUVZmVERFRkd6TmRLMkJXVDNLZElGam5RQnQ0dkdEZ0Z4cUpaK3RtSkJ0?=
 =?utf-8?B?UXBmRnZ6M1VTczMwU0JoTXNKRkkyTk1MNVdLRGNIZDZocE5nS0VnajlXRCtK?=
 =?utf-8?B?N0Z1SkV0bDkxR2ZQY0Y0YnJCYkp3OGF0cXFYOXE3VFBaa2lSMVdHRWZZQXRJ?=
 =?utf-8?B?OWpOUUJhS2k1QUgyekZ2ajdLNk82UUxreFRvdEJGRCs4and3eW9ZdW4wOUxE?=
 =?utf-8?B?blVULzZFSm5LZjlReGdyKzZzdzhseVJkN1BQZHpZSm5SWjE4aXlkMGg1SUFy?=
 =?utf-8?B?ck45OThDUUk1TzAwMjllaTNOYWZBSTF4Ry84eXVQT0hMTnZ2V3ZTOGtsalhM?=
 =?utf-8?B?NjNwVG8zSmxRNDZyeGo5ZWtGelJieXdUV3RSU1dDY2RWLzA4MkxFWkw4YmlU?=
 =?utf-8?B?VEZrK0JSSXkvZGtrMDRhOVVBd0ZHSFhXSVdlVGhDQVQ0eG0rSFk3dW9pMk9p?=
 =?utf-8?B?enpGSVREbG9KeVZVdW1OaURNQ1FmSnMzVlFNVTBwUHZkRDUwdUc5eEMvaXhL?=
 =?utf-8?B?WFdOQW50UnZzUFRiTVNYZE1MUWJZRHIvNFBCZFloY3pFQ2xEOEdUVU1PWUpt?=
 =?utf-8?B?MzRMOWZzTlB3L3BMdmF5NWJHSHJydVNBdjZBdTd0UzFpS3A2Rk9CeEdlcWta?=
 =?utf-8?B?SlFGOEh2NncxVURkb2lmdVlVT2pXaVVIaFkzemJKdWFqSTcrbjNQWGJQa0Vy?=
 =?utf-8?B?VlRzbW9zOFRjdi81VUNXNTBNdmJoSm5MbWRlMXFpaWxJTmVHeWEzckNhcnhO?=
 =?utf-8?Q?8cKWk7sAv5JUvE3zSo+TzV22E4lQoYZgIdQSdvCcJXL3?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4450511e-588b-4f61-33c4-08db68e03907
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2023 11:54:04.2839 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mrE3s4cgqdmKEwn5GDuFuc6KzeoKIcFQzxdvL4isHTxQdcr4UCoeI1euzgyPbNi/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6531
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

Am 08.06.23 um 08:55 schrieb Boris Brezillon:
> If I understand correctly, drm_sched_entity_kill_jobs_cb() is supposed
> to wait on all the external dependencies (those added to
> drm_sched_job::dependencies) before signaling the job finished fence.
> This is done this way to prevent jobs depending on these canceled jobs
> from considering the resources they want to access as ready, when
> they're actually still used by other components, thus leading to
> potential data corruptions.
>
> The problem is, the kill_jobs logic is omitting the last fence popped
> from the dependencies array that was waited upon before
> drm_sched_entity_kill() was called (drm_sched_entity::dependency field),
> so we're basically waiting for all dependencies except one.
>
> This is an attempt at fixing that, but also an opportunity to make sure
> I understood the drm_sched_entity_kill(), because I'm not 100% sure if
> skipping this currently popped dependency was intentional or not. I can't
> see a good reason why we'd want to skip that one, but I might be missing
> something.
>
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> Cc: Frank Binns <frank.binns@imgtec.com>
> Cc: Sarah Walker <sarah.walker@imgtec.com>
> Cc: Donald Robson <donald.robson@imgtec.com>
> Cc: Luben Tuikov <luben.tuikov@amd.com>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> Cc: "Christian König" <christian.koenig@amd.com>
> ---
> Stumbled across this issue while working on native dependency support
> with Donald (which will be posted soon). Flagged as RFC, because I'm
> not sure this is legit, and also not sure we want to fix it this way.
> I tried re-using drm_sched_entity::dependency, but it's a bit of a mess
> because of the asynchronousity of the wait, and the fact we use
> drm_sched_entity::dependency to know if we have a clear_dep()
> callback registered, so we can easily reset it without removing the
> callback.

Well yes, that's a known problem. But this is really not the right 
approach to fixing this.

Trying to wait for all the dependencies before killing jobs was added 
because of the way we kept track of dma_fences in dma_resv objects. 
Basically adding exclusive fences removed all other fences leading to a 
bit fragile memory management.

This handling was removed by now and so the workaround for waiting for 
dependencies is not really necessary any more, but I think it is still 
better to do so.

The right approach of getting this waiting for dependencies completely 
straight is also not to touch entity->dependency in any way, but to stop 
removing them from the XA in drm_sched_job_dependency(). Otherwise you 
don't catch the pipeline optimized ones either.

Regards,
Christian.

> ---
>   drivers/gpu/drm/scheduler/sched_entity.c | 40 ++++++++++++++++++------
>   drivers/gpu/drm/scheduler/sched_main.c   |  3 ++
>   include/drm/gpu_scheduler.h              | 12 +++++++
>   3 files changed, 45 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
> index 68e807ae136a..3821f9adf7bd 100644
> --- a/drivers/gpu/drm/scheduler/sched_entity.c
> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
> @@ -176,20 +176,35 @@ static void drm_sched_entity_kill_jobs_cb(struct dma_fence *f,
>   {
>   	struct drm_sched_job *job = container_of(cb, struct drm_sched_job,
>   						 finish_cb);
> -	int r;
>   
>   	dma_fence_put(f);
>   
> -	/* Wait for all dependencies to avoid data corruptions */
> -	while (!xa_empty(&job->dependencies)) {
> -		f = xa_erase(&job->dependencies, job->last_dependency++);
> -		r = dma_fence_add_callback(f, &job->finish_cb,
> -					   drm_sched_entity_kill_jobs_cb);
> -		if (!r)
> +	/* Wait for all remaining dependencies to avoid data corruptions.
> +	 *
> +	 * We first check the last dependency popped from job->dependencies,
> +	 * and then walk job->dependencies.
> +	 *
> +	 * Note that we don't wait on the last fence returned by
> +	 * drm_gpu_scheduler_ops::prepare_job(), nor do we call
> +	 * drm_gpu_scheduler_ops::prepare_job() to empty the list of potential
> +	 * internal dependencies the driver might want to wait on before
> +	 * scheduling the job. We simply assume skipping internal dependencies
> +	 * can't cause data corruption on resources passed to the job.
> +	 */
> +	do {
> +		f = job->cur_dep;
> +
> +		if (!xa_empty(&job->dependencies))
> +			job->cur_dep = xa_erase(&job->dependencies, job->last_dependency++);
> +		else
> +			job->cur_dep = NULL;
> +
> +		if (f &&
> +		    !dma_fence_add_callback(f, &job->finish_cb, drm_sched_entity_kill_jobs_cb))
>   			return;
>   
>   		dma_fence_put(f);
> -	}
> +	} while (job->cur_dep);
>   
>   	INIT_WORK(&job->work, drm_sched_entity_kill_jobs_work);
>   	schedule_work(&job->work);
> @@ -415,8 +430,13 @@ static struct dma_fence *
>   drm_sched_job_dependency(struct drm_sched_job *job,
>   			 struct drm_sched_entity *entity)
>   {
> -	if (!xa_empty(&job->dependencies))
> -		return xa_erase(&job->dependencies, job->last_dependency++);
> +	dma_fence_put(job->cur_dep);
> +	job->cur_dep = NULL;
> +
> +	if (!xa_empty(&job->dependencies)) {
> +		job->cur_dep = xa_erase(&job->dependencies, job->last_dependency++);
> +		return dma_fence_get(job->cur_dep);
> +	}
>   
>   	if (job->sched->ops->prepare_job)
>   		return job->sched->ops->prepare_job(job, entity);
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> index 394010a60821..70ab60e5760c 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -839,6 +839,9 @@ void drm_sched_job_cleanup(struct drm_sched_job *job)
>   
>   	job->s_fence = NULL;
>   
> +	if (WARN_ON(job->cur_dep))
> +		dma_fence_put(job->cur_dep);
> +
>   	xa_for_each(&job->dependencies, index, fence) {
>   		dma_fence_put(fence);
>   	}
> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> index e95b4837e5a3..8e8e3decdc80 100644
> --- a/include/drm/gpu_scheduler.h
> +++ b/include/drm/gpu_scheduler.h
> @@ -366,6 +366,18 @@ struct drm_sched_job {
>   	/** @last_dependency: tracks @dependencies as they signal */
>   	unsigned long			last_dependency;
>   
> +	/*
> +	 * @cur_dep:
> +	 *
> +	 * Last dependency popped from @dependencies. Dependencies returned by
> +	 * drm_gpu_scheculer_ops::prepare_job() are not recorded here.
> +	 *
> +	 * We need to keep track of the last dependencies popped from
> +	 * @dependencies so we can wait on the already popped dependency when
> +	 * drm_sched_entity_kill_jobs_cb() is called.
> +	 */
> +	struct dma_fence		*cur_dep;
> +
>   	/**
>   	 * @submit_ts:
>   	 *

