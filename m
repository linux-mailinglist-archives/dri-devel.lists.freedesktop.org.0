Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D05343B343F
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jun 2021 18:59:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 344916EB7C;
	Thu, 24 Jun 2021 16:59:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam08on2041.outbound.protection.outlook.com [40.107.100.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00BAF6EB7C
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jun 2021 16:59:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g68yjMJypc/TR915ixW33XgpYV0jUsladLlgv2HEKgK0PM647PtPZNpivhKJN8AhtEdS0LApKetSev8xpc3PuYCiT7lKYBos7lFPxHuF8EG8n3BEni9LFG99U7bJeFsoJ1bCgpeYJUmw0MM0D8diPwT5tLzInpkpuYLPZEKRa/mG2rWb5lBp5WNT8bQ9fW09T74CzWCJwgsFny2O0XVsLXFb7yiVNzy2s60J0ZrrgtATJ3BivDAayoc7Ak+Fg5tj7kodH7y6pfFBl33R3XY+U9vWdniUZZTtOhEe46ivzmWbGEcDw2Z9zpBoHHSmiuk9zSdrxslyh6kA6DBQbdEj3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ApbnKJo/0FOcTgIKi2GvE1u1nKUdWG//txZQ6Ko9BJk=;
 b=Fej9QmQptSFg5UBfwaCFLtw4AFJEl2tZiTlab1mc+YmzHNIRm7THJYD1Kk6FnqIwVxuGBfY2nSvrlN89+LNRc6ah+gRndYf/TvzoYhpwRiY/ajuUZ4t3w1wH5ePdKVjRjczdLsL1ljHQjyIa875zRMtXePXu7/59QgMV4htZ8X7QDfgFGLy8hqbeOyRzrKGuOXaFoMrGI1JWc/UIHK+zMXe1dI2SQafnNHmdCEKaESTVEsQPSis+8W3WpQjY4Tn3/KcFrl1DyIMvY9PKHGhEzFq0RJObA/MIChzvOAllWA0qqHxV18/lT3N2Szj98RR8OX1dEI+p/mxZgLOjq1Xmcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ApbnKJo/0FOcTgIKi2GvE1u1nKUdWG//txZQ6Ko9BJk=;
 b=CkzokCFeKX04cCxLnAm1egsIUpD4RuA2uofP/6hWYaQ3soDDPMScK6v0uymiD9LH9TxZ0TmbIe5TFbSCB03zBtfhKQbC0zyujdpmPzwMpBbAIpEXQPzZSkQhRNtdYvOw0yo9h6n3kfYbCRJgE926eDhkdjB1vuy45H+H49QRsKw=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4375.namprd12.prod.outlook.com (2603:10b6:208:24f::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.18; Thu, 24 Jun
 2021 16:59:22 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756%5]) with mapi id 15.20.4264.020; Thu, 24 Jun 2021
 16:59:21 +0000
Subject: Re: [PATCH 02/11] drm/sched: Add dependency tracking
To: Lucas Stach <l.stach@pengutronix.de>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
References: <20210624140025.438303-1-daniel.vetter@ffwll.ch>
 <20210624140025.438303-3-daniel.vetter@ffwll.ch>
 <9465ffc67bce199ad52f272d0c4f7103d61ae734.camel@pengutronix.de>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <762b73a0-bd42-098b-01a4-040440eef2f4@amd.com>
Date: Thu, 24 Jun 2021 18:59:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <9465ffc67bce199ad52f272d0c4f7103d61ae734.camel@pengutronix.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:c089:94ee:b4ef:e121]
X-ClientProxiedBy: AM0PR01CA0112.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:168::17) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:c089:94ee:b4ef:e121]
 (2a02:908:1252:fb60:c089:94ee:b4ef:e121) by
 AM0PR01CA0112.eurprd01.prod.exchangelabs.com (2603:10a6:208:168::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.18 via Frontend
 Transport; Thu, 24 Jun 2021 16:59:19 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 737291e6-17e0-4b4d-e92b-08d937316984
X-MS-TrafficTypeDiagnostic: MN2PR12MB4375:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB4375A135525A955449C1CC7083079@MN2PR12MB4375.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3631;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EKr/6dxs8xmZl6hrhbrqDc1FsppApYJIRaQ8PKaeF4FG2dTwEsdIUc6SK6y11kbLPkHIuZSRwuYO4v927rfr63UVm2izXgsWYA6YNW2PM1zENuasS4iaRZfM6xjulXi7EsevgmymKaGi7IWKvjpK2dTAZMLA2xrytDhNdjSro+AwbRxfX+PBq0bYY5O0lOHFNpbL61gaEYa38qnWIdBOw4Yqh6ezE1r1OXcJPl/6sUjQGa7mAnKOFEwavfoHX+s84Huu6vqFxBJaspcYvbq7ygUcaA95b5pCTgAue8TvvwO10PoNvuiEhYiz/jBL4t+C5o1iUsPxPTcbEe3TcCXXJsGoCw1xbimXDFabVZq7gVNLpjrYe4fgaenMD7vIkML/S7kv2q6pfPQgNASi+dvgtaZQOpH28TX7kQLrvGdqDDwmIk4pYcgSp4mGhGufrXxOPYtERA7gE9zeQud518M0YZsiO2AfttLhLDx3gZZTwTQzX1rWbv7IGYKM9QR6PfwKhp1wfauS7FwCU4vm7aR65cEPYEJSzT1QOOunU3reirfKvBgnV+ehxA8jpxfY3JS/jh4H/Y1afN6V1iEWGE4eVIF1jCQw1EP60jfDuC7OAy2DgLlDEZyG93ZlaSH/0dsJ/zGK1CJPnUVd5vAcEqzBPaUFsfrGrQAOiwVjM7PEk2g=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(376002)(366004)(396003)(346002)(39860400002)(478600001)(66946007)(8936002)(186003)(16526019)(8676002)(110136005)(66476007)(316002)(66556008)(36756003)(31686004)(7416002)(54906003)(5660300002)(2616005)(66574015)(6666004)(38100700002)(30864003)(83380400001)(6486002)(4326008)(2906002)(31696002)(86362001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q2R5dUpDbUlYOG83S2J0T3pBZFhiTlpucFY2bVJoNVJBc2dhbWd6VGx3V1Zw?=
 =?utf-8?B?OXdZZnVCaEJhZnRZSGhGWG90V0ozZnUvTkw2TWtVb0VmTFcwQysyUmdoc0p3?=
 =?utf-8?B?R0VsOWtuTFA3SkIwUVpHdEFwQnh5UWdOeUlUejJvNTZlWnNDalN0Rm5rZ2Nu?=
 =?utf-8?B?dDhhYUU4YzIxMzZzVFdSbVRjN3NDRFNlUGRyeDBzQS9BWWE4cnJYZkkveFF4?=
 =?utf-8?B?bkRpL1h2QjdxRnhYNTcyTHJJWWxta0d1RnA5S1J6d1N5ejFRR3g2bklqRkNH?=
 =?utf-8?B?OENlanJhQVMycWxKczZiUUh6SEpKR01KQVZPQU9xcmEySDJha1Z5blVqZkpL?=
 =?utf-8?B?dlpzME85TXJRbG1hVXQ5RE1maHFYbzFUYkhNQWorMjlKbkhhNVRjM25NTERM?=
 =?utf-8?B?TDNIZ2dnTjVXWmZ0U0k2MVpCQndqb0RleXNPZllkRTRyME9JN3N2OGpWVVVm?=
 =?utf-8?B?bFpMeUFKK3EzT2VmdTRWWWd2TEZQck1XWERGdklCdkMyZWIzOGUxRmZ3SUdr?=
 =?utf-8?B?MEU0UElNNVFiOU5iSUo0MUVxMXozZjd5empKOXdEUzl4bmRHdlNhdFU0Q2hD?=
 =?utf-8?B?U2Z2eUZxZ3ZaV0djblg1azl4ak1RUHZ5MHNta0MxUUNIQTVERHpWN3pXcWt6?=
 =?utf-8?B?M3VHR21TS2FTZ0dSNVRETDhqemNuK0MwWSsrSmlGREdRWlM4OWlyR1lZS0w4?=
 =?utf-8?B?MTlZanN2bks3TkwzT1M4SWpYSm5QcU5MNHFzYS9SRzVCcG1BQmFsVjl4N3cx?=
 =?utf-8?B?NzdxUDVZRGJzcGVoT3BLV0x5eXJheW9Zc2xBZUZnMlQxcHVYbHNIUm8vRURV?=
 =?utf-8?B?TG0vUEo1bXBzQUFLRzhFcHlITWhVM3ZCdjVOeFMrYXkvbnNkTGdoVzk0OHRr?=
 =?utf-8?B?Ylo3MVM1TGpjVXVVQ243bUkzM3krM3c3THYvZnpDdzRpMC9KU2NVTUEyVVlu?=
 =?utf-8?B?d2VZQkUyRUg0Zjc1MFdKbWdkZWtPRzNGMUs1KzRZZlB3RXdjbG9PMklHRDFC?=
 =?utf-8?B?Ukhsc2VPTWxwZTU5ZnR0MEh4QnMySVBmWSsrdlFOZGU0M3luWDMyMVI5MGZY?=
 =?utf-8?B?VkN1R2k1bTVUeUF0VUtwQWM2MzFrMUtNN1orbHNaUVIzdzhvTXhVTFQvWmh1?=
 =?utf-8?B?QTlDYXBGY0k1RnRtUmE3WE41RE9ML0d4akpyQkl6UzFrOEhFZDlhNEl3Qy9j?=
 =?utf-8?B?a2c1WUNRbEZLNm5sZHFiZFlaY21aK1I2bmhYL0lrZWRaVHJLZ0k4QVZzVDg4?=
 =?utf-8?B?MUwyWU9jOVlhNkNkdU0yY2ZDK29paUpxdHA1UlhuWmJvVTR1SlZPTGtEa2Za?=
 =?utf-8?B?OE9wNE1sL3QvVlkva25OYkRWZGNmMzhCaEI2MEpKVllhanB2L1cvdVF4NHNx?=
 =?utf-8?B?ck9RTjZzWnNiRzhwcFRVRDA3eUcxZ25XL0JHSzFkZUx4b3cxaDVCRnlZQ1Jj?=
 =?utf-8?B?UVBwbjVXWVlub1ROKzE1ekg3cjRieXFhRXBYa2RlWUdjd2lGQnZOY29nSXo0?=
 =?utf-8?B?YUMrNFdTUkVydFpMZHB2dEtoWk9obDRrYTBSd0hSUDFHOU5FWkpkTWxOdUFq?=
 =?utf-8?B?dzV2ZlBaRmQ3V1doS1ViaHdic0EwYkc1b3JaN3JZazhHZ1MvbDNabmJBQys5?=
 =?utf-8?B?S2VtU05vcDAzeVl6NHl3dHNrTGFDWnhndnRrbDQvUFZRVXRmWk8yaWhmSFVw?=
 =?utf-8?B?RG96MGNsbVFZWHZJcm94MTV3My9oMmwzSk53NUloQnI4MlJub2pVbGJBQnJV?=
 =?utf-8?B?Zlpmb2t2U2xsVmhQY1dObW9hVlVTa1BaYU5jTk1mK2JCbCtIOU5QNHZlN2dv?=
 =?utf-8?B?VEhQdzVPVnBpTmdPUmI5L2F6bkZqVkQ3dnQ2YzFaTHB6aUl6Z0xQcUQrZk4x?=
 =?utf-8?Q?YOr14JI8nrBXh?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 737291e6-17e0-4b4d-e92b-08d937316984
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2021 16:59:21.7746 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fmYebyypVLW1Am3Xi7idq+32+5Bxt0g10FwYSl7gFUBGf5Rn3K1hzg7rl+54yxKV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4375
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
Cc: Luben Tuikov <luben.tuikov@amd.com>, Jack Zhang <Jack.Zhang1@amd.com>,
 David Airlie <airlied@linux.ie>, linaro-mm-sig@lists.linaro.org,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Daniel Vetter <daniel.vetter@intel.com>, Nirmoy Das <nirmoy.aiemd@gmail.com>,
 Lee Jones <lee.jones@linaro.org>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 24.06.21 um 16:39 schrieb Lucas Stach:
> Am Donnerstag, dem 24.06.2021 um 16:00 +0200 schrieb Daniel Vetter:
>> Instead of just a callback we can just glue in the gem helpers that
>> panfrost, v3d and lima currently use. There's really not that many
>> ways to skin this cat.
>>
>> On the naming bikeshed: The idea for using _await_ to denote adding
>> dependencies to a job comes from i915, where that's used quite
>> extensively all over the place, in lots of datastructures.
>>
>> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
>> Cc: David Airlie <airlied@linux.ie>
>> Cc: Daniel Vetter <daniel@ffwll.ch>
>> Cc: Sumit Semwal <sumit.semwal@linaro.org>
>> Cc: "Christian König" <christian.koenig@amd.com>
>> Cc: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
>> Cc: Lee Jones <lee.jones@linaro.org>
>> Cc: Nirmoy Das <nirmoy.aiemd@gmail.com>
>> Cc: Boris Brezillon <boris.brezillon@collabora.com>
>> Cc: Luben Tuikov <luben.tuikov@amd.com>
>> Cc: Alex Deucher <alexander.deucher@amd.com>
>> Cc: Jack Zhang <Jack.Zhang1@amd.com>
>> Cc: linux-media@vger.kernel.org
>> Cc: linaro-mm-sig@lists.linaro.org
>> ---
>>   drivers/gpu/drm/scheduler/sched_entity.c |  18 +++-
>>   drivers/gpu/drm/scheduler/sched_main.c   | 103 +++++++++++++++++++++++
>>   include/drm/gpu_scheduler.h              |  31 ++++++-
>>   3 files changed, 146 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
>> index f7347c284886..b6f72fafd504 100644
>> --- a/drivers/gpu/drm/scheduler/sched_entity.c
>> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
>> @@ -211,6 +211,19 @@ static void drm_sched_entity_kill_jobs_cb(struct dma_fence *f,
>>   	job->sched->ops->free_job(job);
>>   }
>>   
>> +static struct dma_fence *
>> +drm_sched_job_dependency(struct drm_sched_job *job,
>> +			 struct drm_sched_entity *entity)
>> +{
>> +	if (!xa_empty(&job->dependencies))
>> +		return xa_erase(&job->dependencies, job->last_dependency++);
> Not sure how much it buys us now that you dedup fences before adding
> them to the xa, but we could avoid potentially avoid some ping-pong
> looping in the scheduler by checking if the fence we are about to
> return here is already signaled and skipping to the next one if so.

You absolutely need this, especially for TTM based drivers since you 
basically need to add all the fences from all the BOs in you relocation 
list.

When I initially implemented the dependency handling I've tried multiple 
approaches, including something similar to that one here. Not sure how 
well the performance will be, but I think we can revert to something 
more complicated rather easily when we find that it doesn't work as 
expected.

One unresolved problem is that we need to track the last fence we 
optimized by looking at the scheduler instance. This is necessary since 
Vulkan dependencies don't work correctly otherwise.

Amdgpu currently has a rather awkward workaround for that currently.

But in general it looks like the right thing to do.

Regards,
Christian.


>
> Regards,
> Lucas
>
>> +
>> +	if (job->sched->ops->dependency)
>> +		return job->sched->ops->dependency(job, entity);
>> +
>> +	return NULL;
>> +}
>> +
>>   /**
>>    * drm_sched_entity_kill_jobs - Make sure all remaining jobs are killed
>>    *
>> @@ -229,7 +242,7 @@ static void drm_sched_entity_kill_jobs(struct drm_sched_entity *entity)
>>   		struct drm_sched_fence *s_fence = job->s_fence;
>>   
>>   		/* Wait for all dependencies to avoid data corruptions */
>> -		while ((f = job->sched->ops->dependency(job, entity)))
>> +		while ((f = drm_sched_job_dependency(job, entity)))
>>   			dma_fence_wait(f, false);
>>   
>>   		drm_sched_fence_scheduled(s_fence);
>> @@ -419,7 +432,6 @@ static bool drm_sched_entity_add_dependency_cb(struct drm_sched_entity *entity)
>>    */
>>   struct drm_sched_job *drm_sched_entity_pop_job(struct drm_sched_entity *entity)
>>   {
>> -	struct drm_gpu_scheduler *sched = entity->rq->sched;
>>   	struct drm_sched_job *sched_job;
>>   
>>   	sched_job = to_drm_sched_job(spsc_queue_peek(&entity->job_queue));
>> @@ -427,7 +439,7 @@ struct drm_sched_job *drm_sched_entity_pop_job(struct drm_sched_entity *entity)
>>   		return NULL;
>>   
>>   	while ((entity->dependency =
>> -			sched->ops->dependency(sched_job, entity))) {
>> +			drm_sched_job_dependency(sched_job, entity))) {
>>   		trace_drm_sched_job_wait_dep(sched_job, entity->dependency);
>>   
>>   		if (drm_sched_entity_add_dependency_cb(entity))
>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
>> index 70eefed17e06..370c336d383f 100644
>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>> @@ -603,6 +603,8 @@ int drm_sched_job_init(struct drm_sched_job *job,
>>   
>>   	INIT_LIST_HEAD(&job->list);
>>   
>> +	xa_init_flags(&job->dependencies, XA_FLAGS_ALLOC);
>> +
>>   	return 0;
>>   }
>>   EXPORT_SYMBOL(drm_sched_job_init);
>> @@ -626,6 +628,98 @@ void drm_sched_job_arm(struct drm_sched_job *job)
>>   }
>>   EXPORT_SYMBOL(drm_sched_job_arm);
>>   
>> +/**
>> + * drm_sched_job_await_fence - adds the fence as a job dependency
>> + * @job: scheduler job to add the dependencies to
>> + * @fence: the dma_fence to add to the list of dependencies.
>> + *
>> + * Note that @fence is consumed in both the success and error cases.
>> + *
>> + * Returns:
>> + * 0 on success, or an error on failing to expand the array.
>> + */
>> +int drm_sched_job_await_fence(struct drm_sched_job *job,
>> +			      struct dma_fence *fence)
>> +{
>> +	struct dma_fence *entry;
>> +	unsigned long index;
>> +	u32 id = 0;
>> +	int ret;
>> +
>> +	if (!fence)
>> +		return 0;
>> +
>> +	/* Deduplicate if we already depend on a fence from the same context.
>> +	 * This lets the size of the array of deps scale with the number of
>> +	 * engines involved, rather than the number of BOs.
>> +	 */
>> +	xa_for_each(&job->dependencies, index, entry) {
>> +		if (entry->context != fence->context)
>> +			continue;
>> +
>> +		if (dma_fence_is_later(fence, entry)) {
>> +			dma_fence_put(entry);
>> +			xa_store(&job->dependencies, index, fence, GFP_KERNEL);
>> +		} else {
>> +			dma_fence_put(fence);
>> +		}
>> +		return 0;
>> +	}
>> +
>> +	ret = xa_alloc(&job->dependencies, &id, fence, xa_limit_32b, GFP_KERNEL);
>> +	if (ret != 0)
>> +		dma_fence_put(fence);
>> +
>> +	return ret;
>> +}
>> +EXPORT_SYMBOL(drm_sched_job_await_fence);
>> +
>> +/**
>> + * drm_sched_job_await_implicit - adds implicit dependencies as job dependencies
>> + * @job: scheduler job to add the dependencies to
>> + * @obj: the gem object to add new dependencies from.
>> + * @write: whether the job might write the object (so we need to depend on
>> + * shared fences in the reservation object).
>> + *
>> + * This should be called after drm_gem_lock_reservations() on your array of
>> + * GEM objects used in the job but before updating the reservations with your
>> + * own fences.
>> + *
>> + * Returns:
>> + * 0 on success, or an error on failing to expand the array.
>> + */
>> +int drm_sched_job_await_implicit(struct drm_sched_job *job,
>> +				 struct drm_gem_object *obj,
>> +				 bool write)
>> +{
>> +	int ret;
>> +	struct dma_fence **fences;
>> +	unsigned int i, fence_count;
>> +
>> +	if (!write) {
>> +		struct dma_fence *fence = dma_resv_get_excl_unlocked(obj->resv);
>> +
>> +		return drm_sched_job_await_fence(job, fence);
>> +	}
>> +
>> +	ret = dma_resv_get_fences(obj->resv, NULL, &fence_count, &fences);
>> +	if (ret || !fence_count)
>> +		return ret;
>> +
>> +	for (i = 0; i < fence_count; i++) {
>> +		ret = drm_sched_job_await_fence(job, fences[i]);
>> +		if (ret)
>> +			break;
>> +	}
>> +
>> +	for (; i < fence_count; i++)
>> +		dma_fence_put(fences[i]);
>> +	kfree(fences);
>> +	return ret;
>> +}
>> +EXPORT_SYMBOL(drm_sched_job_await_implicit);
>> +
>> +
>>   /**
>>    * drm_sched_job_cleanup - clean up scheduler job resources
>>    *
>> @@ -633,8 +727,17 @@ EXPORT_SYMBOL(drm_sched_job_arm);
>>    */
>>   void drm_sched_job_cleanup(struct drm_sched_job *job)
>>   {
>> +	struct dma_fence *fence;
>> +	unsigned long index;
>> +
>>   	dma_fence_put(&job->s_fence->finished);
>>   	job->s_fence = NULL;
>> +
>> +	xa_for_each(&job->dependencies, index, fence) {
>> +		dma_fence_put(fence);
>> +	}
>> +	xa_destroy(&job->dependencies);
>> +
>>   }
>>   EXPORT_SYMBOL(drm_sched_job_cleanup);
>>   
>> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
>> index 80438d126c9d..e4d7e1496296 100644
>> --- a/include/drm/gpu_scheduler.h
>> +++ b/include/drm/gpu_scheduler.h
>> @@ -27,9 +27,12 @@
>>   #include <drm/spsc_queue.h>
>>   #include <linux/dma-fence.h>
>>   #include <linux/completion.h>
>> +#include <linux/xarray.h>
>>   
>>   #define MAX_WAIT_SCHED_ENTITY_Q_EMPTY msecs_to_jiffies(1000)
>>   
>> +struct drm_gem_object;
>> +
>>   struct drm_gpu_scheduler;
>>   struct drm_sched_rq;
>>   
>> @@ -198,6 +201,16 @@ struct drm_sched_job {
>>   	enum drm_sched_priority		s_priority;
>>   	struct drm_sched_entity         *entity;
>>   	struct dma_fence_cb		cb;
>> +	/**
>> +	 * @dependencies:
>> +	 *
>> +	 * Contains the dependencies as struct dma_fence for this job, see
>> +	 * drm_sched_job_await_fence() and drm_sched_job_await_implicit().
>> +	 */
>> +	struct xarray			dependencies;
>> +
>> +	/** @last_dependency: tracks @dependencies as they signal */
>> +	unsigned long			last_dependency;
>>   };
>>   
>>   static inline bool drm_sched_invalidate_job(struct drm_sched_job *s_job,
>> @@ -220,9 +233,14 @@ enum drm_gpu_sched_stat {
>>    */
>>   struct drm_sched_backend_ops {
>>   	/**
>> -         * @dependency: Called when the scheduler is considering scheduling
>> -         * this job next, to get another struct dma_fence for this job to
>> -	 * block on.  Once it returns NULL, run_job() may be called.
>> +	 * @dependency:
>> +	 *
>> +	 * Called when the scheduler is considering scheduling this job next, to
>> +	 * get another struct dma_fence for this job to block on.  Once it
>> +	 * returns NULL, run_job() may be called.
>> +	 *
>> +	 * If a driver exclusively uses drm_sched_job_await_fence() and
>> +	 * drm_sched_job_await_implicit() this can be ommitted and left as NULL.
>>   	 */
>>   	struct dma_fence *(*dependency)(struct drm_sched_job *sched_job,
>>   					struct drm_sched_entity *s_entity);
>> @@ -314,6 +332,13 @@ int drm_sched_job_init(struct drm_sched_job *job,
>>   		       struct drm_sched_entity *entity,
>>   		       void *owner);
>>   void drm_sched_job_arm(struct drm_sched_job *job);
>> +int drm_sched_job_await_fence(struct drm_sched_job *job,
>> +			      struct dma_fence *fence);
>> +int drm_sched_job_await_implicit(struct drm_sched_job *job,
>> +				 struct drm_gem_object *obj,
>> +				 bool write);
>> +
>> +
>>   void drm_sched_entity_modify_sched(struct drm_sched_entity *entity,
>>   				    struct drm_gpu_scheduler **sched_list,
>>                                      unsigned int num_sched_list);
>

