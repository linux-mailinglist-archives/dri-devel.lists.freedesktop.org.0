Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 720175E683B
	for <lists+dri-devel@lfdr.de>; Thu, 22 Sep 2022 18:15:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F43A10EB90;
	Thu, 22 Sep 2022 16:15:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2049.outbound.protection.outlook.com [40.107.243.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6230410EB7A;
 Thu, 22 Sep 2022 16:15:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m2lE5cKZ/XlYdEwhoT7lk2G6n1DkHIWOL/qxuGUZciX+kgPgsMBjwWltD4cTqsn+5/Avu7K8OupSyv4ci4vV+iFROVd2RzAqz1mqWzIpr6BURQ3/OrDL1YWKoEOj9YzHOaoVdgcJnr9mlyBEpus1s3lvKjh+JnMbredSgPX/aiQJWnXKKtdOnD3/HkRcjXkiNc9scJsBoqxUVhaPReoqChTcQcwMjk6aOvPq9resxD4n2E6Fqq1iQHztV8JbhNlXYsI6Y6k0DmpJH0kzTsFz2v2zjRg/sS5jlb1NTEpbt1RfR8YLSIvVWYN1eOTFl+H7m75Y2YcStvp+itUu8YiZYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b013y9YhIN6llZIXaZW06V3iEVQgZEKM3t6A3E9h0n4=;
 b=U9JWuBsa8TLcc7uJNsPm7eiayqWed2UydftYlgz6jf5fw0wsHHnMEBBUaOKQWPtc13alINI4oF6RGVuLTOy4EtpxxnfUtVU42dziilthhXktkxRhf3+lRRz/DTLJH0mb+bsS/YC8UOT54WLtkT/IEIkFMYVntPJxz6DzDP4LaCzEoQdbgJZs74ywADQ87y2ANw0Qot7fMfU6qCeHEbU4Rvh2wO/xSL5Y/ISETAJGQuZkZo9BKtJhuwR66hTKL/43123QGqiSb/ENW0ueGY/PE6kLdvL0CKLpQGPo1iBqsq9JApRf4fAm7PJGn9BJ+99MvdqIcWWyWLbJ8ew3yyrQ6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b013y9YhIN6llZIXaZW06V3iEVQgZEKM3t6A3E9h0n4=;
 b=oj1DapUlxwC1+wmPMYYyQgS9qRHCjcSQOJQau+DHFl4noJq9R1z/kMV1dB7jROcuj3ZTul+5r4NVm5RBE3O3gv+dKhQcBCOImiu1rdH6B/lvQafttVRaicdgFK+DOytgMEMKEJshYYgA4SeLZRTn1ETuy1nq5k9o3nTh9yaBYRI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM5PR12MB1947.namprd12.prod.outlook.com (2603:10b6:3:111::23)
 by SJ0PR12MB6808.namprd12.prod.outlook.com (2603:10b6:a03:47a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.19; Thu, 22 Sep
 2022 16:15:43 +0000
Received: from DM5PR12MB1947.namprd12.prod.outlook.com
 ([fe80::80ca:c97:d395:1acf]) by DM5PR12MB1947.namprd12.prod.outlook.com
 ([fe80::80ca:c97:d395:1acf%6]) with mapi id 15.20.5654.017; Thu, 22 Sep 2022
 16:15:43 +0000
Message-ID: <43891f6c-615b-3b5e-204d-b0815dc858cf@amd.com>
Date: Thu, 22 Sep 2022 12:15:41 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v4] drm/sched: Add FIFO sched policy to run queue v3
Content-Language: en-US
To: Luben Tuikov <luben.tuikov@amd.com>, dri-devel@lists.freedesktop.org
References: <20220921182831.25214-1-andrey.grodzovsky@amd.com>
 <5c3e72bb-0df7-b76c-1679-5bbb571e4a2c@amd.com>
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
In-Reply-To: <5c3e72bb-0df7-b76c-1679-5bbb571e4a2c@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT3PR01CA0054.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:82::25) To DM5PR12MB1947.namprd12.prod.outlook.com
 (2603:10b6:3:111::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM5PR12MB1947:EE_|SJ0PR12MB6808:EE_
X-MS-Office365-Filtering-Correlation-Id: a30f4110-6b2a-4049-01f0-08da9cb5b30c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pliD0E2XPuzxWcUn/+Zw7AygvRqdaUdBkT05unoGirG6HO2t0K+r5VThdxcxs/MY2wIpGtzGYAOJ0tIng6N/dDtnJc+f9rAFbGfmjyRGBBWaBN/qnG965V2tFSvqDjFp/g2hPDFAgOWNx5DGkjC4USsPAsElNCYgRev0vNe7B+NEmNJ3yH0q5jzG1BgE3YYBsRxqP6enXNOB1CSQasnzTI6OLEgswRQKpgpCtAMkw8RC1yyEx+L+A29ykHlFQP8Zw49vMYupRvxybGpwb0PXN+Zfwmz7Ab5HFxdWmThqofA21GH4px6DYPs8WKUQqaJ2jdvqzE/q4a9vqL/nHQNcmrohNeZFhYUBPLo3kfvaxQxmvDGT3/VAAKk/KDxCzfkxhNq8oFhrSkmqhtfcR0PSxoe4Qp1KfazipDb6xnAIWHWRCNH2BTqQJHDBsVlAit3iRx6t/ivW4AgUmq+zETuf6IDKy9YxwwLISrgTVzwskv+2GHz+rixjR991lzBUbzk+qoxF5bNJw9zq51m5ZmJk29gIE3noJQZP7lQGuTEfVAgx8e5t/4b5AQq6dZaqxaclv32xEk6rMxgIJBk9hPYSS774DWiidHhL8dgbA1eWGfIj2xL11R+Z4P6G1/vObmjOiUpytXYG4ZtwZMobvf9+6S8nbInGmVX7Ouj4EzPcPoXW2zabmBof5JoNirrvKBAWTJMgeWEY3+Cc7o+U7ttINIXLIDS3Zbq1rfMg1X7DzpLEYn32qx2BlS9Xlt5F6xuhYWJql8rwFX3LNaU89QmOR/S96GLEkPhcLSPeU5VTlSc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR12MB1947.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(366004)(39860400002)(396003)(346002)(136003)(376002)(451199015)(30864003)(44832011)(2616005)(2906002)(186003)(41300700001)(8936002)(6506007)(6512007)(5660300002)(53546011)(86362001)(31696002)(83380400001)(38100700002)(36756003)(316002)(478600001)(6486002)(4326008)(31686004)(66946007)(66476007)(8676002)(66556008)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bUVoZ3luTS95NVRKM3VhQUg4MmNNckdjVitmSzRGd1dsR2RMY0VMeDVpTzB3?=
 =?utf-8?B?SlJUZHpMVnZTbWpwckIvcjRYcFBLUzM2RjBHRWQrT012L3U0SWxWV2tKdmoy?=
 =?utf-8?B?S1NlZ05QVUI5QUlGNDZOQ1VjQ3lEQWVPSjRWcm95Yk5VRkdEdFhNYXV1VFdF?=
 =?utf-8?B?c3pLYTFtL3hoTTFia3dzOHFLbXRYV0Y0czIvRnlYeXVnZUdXT2VscTFRSG4w?=
 =?utf-8?B?Q3dhc1NPUWY4MHhIYXZRdW5UN3dSV1lQMmJZdWV0UWxYMHVOUzBKMnd1SlNl?=
 =?utf-8?B?QlFOTForNGJQTWZCS2FXK25EVXNXK2ZoaExTMVl0aUdBaS9lNHlMSWZsY2l4?=
 =?utf-8?B?S3B5WStCVmMyZmF5SExTK00zSG9hbjZtTHMzbm9QVUpRRVd2b1FaN0IzWlJo?=
 =?utf-8?B?a1hsVjF5ZUhtbGNMb1VsTHhnTzFSWDRXdmVjcGZYZ2x0UFpWUzFlanQ1UTBZ?=
 =?utf-8?B?L3dHVTNCczFoRzNCRmhpb2VMeUF1QTJCQVZURisrUWJkQU1zTWhYbTg1TzZh?=
 =?utf-8?B?Mm10WmFtYXlXVVdlaTh4aXM2R0FJQVBsNGZTdFYrb0VYSkEyNnJ0WldrTUs2?=
 =?utf-8?B?ZkxZRXdoc0pkZEVGeSs0MnNqMzZrTW4yY005c04rc0srczRlMGg5QWFyK3VY?=
 =?utf-8?B?aTZ6T2ZPY2hEczRIQ05ZMHRNSVliRkw4ZElid0JnUjhOazQxRzlGK1JyQmRR?=
 =?utf-8?B?NTZwZUlhalBlN0IyaDFEM1pNZlB5N21meG5rTCsyUkZPeXBRYzJKKy9aRHVT?=
 =?utf-8?B?N1lmaTlDNWlDL3RTNG5OM1FFTm9BSFIrdEw4anFXenNiSUtSQlhnVlZoWHJi?=
 =?utf-8?B?UzVSbnFpU3VSTkUxZ2UzQ1F6NjMyWHBtVEt4ZmptZWRIS3BLWC8vRTU3M1Z6?=
 =?utf-8?B?eWw5RG9SVkhELzcrTnVRYmlLTEFJeS9QNjhkd0RFdFVlSU5JY2sxbzFBam1q?=
 =?utf-8?B?a0czalNMU0tzRFZlNEpEaFZjcGJUdy9IYXh1MnQ1VnJITm9WL0NiMms1ZDZ4?=
 =?utf-8?B?MGNPbmhxSjdRbWx5RldWbGh2bllUQzA5YzlrSUlZYXczNDZqaDAyOXJPUE1Q?=
 =?utf-8?B?Vm1CRERHL1Q5THpvKzlNbTl2YzdzK3l1R1J0ZWg2RW1FQ21uNkowZi9xTHE2?=
 =?utf-8?B?V3ZYTmt5TTlYcXh2c2YzOTVZdmpCRFo3Y092US9JSHdmMHBVOWluRGNNM2xx?=
 =?utf-8?B?aWtqaGp2YzVwcVhzZWpqQlhnOEZvMDhzOVEzbXVMd3Bkd2RIcXV1Lzhlc2RK?=
 =?utf-8?B?bmdjVFg3bGRFUEd1Ukp1SlQzZXQwODNHZHpDZnBmR0lqQXVWUlBlZDRpdkgr?=
 =?utf-8?B?d0RxV3hBM2wzcFVCbVM4NjhMU2dpTENXS2lZWGNSYldka3lIcmY4c1lFQVpN?=
 =?utf-8?B?T09jQVJHWk91MFhYT3J0N0U1enlkblI4QW1hc1JhTDdUQXRjWnRsWEhQTzVs?=
 =?utf-8?B?T1RCdElUSXNLdkNYbDlOVW9MWkdnR3gybFJ6OFBHMXczRjNKYjdDVytaZ3Z1?=
 =?utf-8?B?MU1vZUtsUHhoRTZ5aGVIWnlRZ0V5Nk81TlEvdEZvM2tDTnhnV0N0bUhVTlp2?=
 =?utf-8?B?WDcvTytaVndVMlppL01PWk9NM2tJWmVFeEhkNDZRb2pkN2pVeisxUGd4VzFP?=
 =?utf-8?B?TjduT1ppTUU4M0V1Q21NRFR4eTAzNnZYVEx1RnZFczU2cWd4NFp3cnVwMmcw?=
 =?utf-8?B?eWpKdnhBUzZ0cU4zRlNXU2R2TzFWb3l2NG1OS2ErQ0dBb2laYW9keFIzUzRo?=
 =?utf-8?B?dUpjSHg0ZnhXWnBFOGo4Si9aUVRFdW9KR00wWFpZY2ZuVkYrc0FwM01pSEk2?=
 =?utf-8?B?cnBOSWIwTEhaT09wS2tQcXVQUnZSb0VXV2NxNzlsNVVEem1Uc0dxYlg0bFVL?=
 =?utf-8?B?b3FMbmRzTDdlWTNQYnJBdGpzODh3NkNJUnVlUngwZ2JSOUYySHQ5eGhMUDht?=
 =?utf-8?B?Z3laNU9wTDlNbEpUa3dFckZ4ZlhpTlVtMG9PTm0vZEZkOGFtcUJqNW8zSzgy?=
 =?utf-8?B?ZjBaM2FzTjBaNkUvcGdIK1lLOCtxZ0w5OTRwSG5IM0w0Z29qZmhIaGxwWHZw?=
 =?utf-8?B?MVhVWGRZTkZyOFJNbERjaVVkM2V6cHZ3QXJ2dlFVYUFIZ2ovb01Vd2dSNC84?=
 =?utf-8?B?V2dEKzVjcjllWlNGbUFybloxWXdxVDNVbXZPSXJOa3M3ZG5DUmZ4U1JHYzZt?=
 =?utf-8?Q?DPMIKRhIidXnrcmfW+b9gPrEDrDIf5BKcC4kzsKcwqkz?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a30f4110-6b2a-4049-01f0-08da9cb5b30c
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB1947.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2022 16:15:43.5768 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 455ems+vLrkTN/JmISFPpDyGOp8pvjcijgKCyoBgGjx2JbV2VebZDpE2lyiFmldVMpOwXUjj0fP8lr5JJDHOIA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6808
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
Cc: ckoenig.leichtzumerken@gmail.com, Li Yunxiang <Yunxiang.Li@amd.com>,
 amd-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 2022-09-22 11:03, Luben Tuikov wrote:
> The title of this patch has "v3", but "v4" in the title prefix.
> If you're using "-v" to git-format-patch, please remove the "v3" from the title.
>
> Inlined:
>
> On 2022-09-21 14:28, Andrey Grodzovsky wrote:
>> When many entities competing for same run queue on
>> the same scheduler When many entities have  unacceptably long wait
>> time for some jobs waiting stuck in the run queue before being picked
>> up are observed (seen using  GPUVis).
> Use this as your opening:
>
> "When many entities are competing for the same run queue on the same scheduler,
> we observe an unusually long wait times and some jobs get starved. This has
> been observed on GPUVis."
>
>> The issue is due to the Round Robin policy used by schedulers
>> to pick up the next entity's job queue for execution. Under stress
>> of many entities and long job queues within entity some
>> jobs could be stack for very long time in it's entity's
> "stuck", not "stack".
>
>> queue before being popped from the queue and executed
>> while for other entities with smaller job queues a job
>> might execute earlier even though that job arrived later
>> then the job in the long queue.
>>     
>> Fix:
>> Add FIFO selection policy to entities in run queue, chose next entity
>> on run queue in such order that if job on one entity arrived
>> earlier then job on another entity the first job will start
>> executing earlier regardless of the length of the entity's job
>> queue.
>>     
>> v2:
>> Switch to rb tree structure for entities based on TS of
>> oldest job waiting in the job queue of an entity. Improves next
>> entity extraction to O(1). Entity TS update
>> O(log N) where N is the number of entities in the run-queue
>>     
>> Drop default option in module control parameter.
>>
>> v3:
>> Various cosmetical fixes and minor refactoring of fifo update function. (Luben)
>>
>> v4:
>> Switch drm_sched_rq_select_entity_fifo to in order search (Luben)
>>     
>> Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
>> Tested-by: Li Yunxiang (Teddy) <Yunxiang.Li@amd.com>
>> ---
>>   drivers/gpu/drm/scheduler/sched_entity.c |  26 +++++-
>>   drivers/gpu/drm/scheduler/sched_main.c   | 107 ++++++++++++++++++++++-
>>   include/drm/gpu_scheduler.h              |  32 +++++++
>>   3 files changed, 159 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
>> index 6b25b2f4f5a3..f3ffce3c9304 100644
>> --- a/drivers/gpu/drm/scheduler/sched_entity.c
>> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
>> @@ -73,6 +73,7 @@ int drm_sched_entity_init(struct drm_sched_entity *entity,
>>   	entity->priority = priority;
>>   	entity->sched_list = num_sched_list > 1 ? sched_list : NULL;
>>   	entity->last_scheduled = NULL;
>> +	RB_CLEAR_NODE(&entity->rb_tree_node);
>>   
>>   	if(num_sched_list)
>>   		entity->rq = &sched_list[0]->sched_rq[entity->priority];
>> @@ -417,14 +418,16 @@ struct drm_sched_job *drm_sched_entity_pop_job(struct drm_sched_entity *entity)
>>   
>>   	sched_job = to_drm_sched_job(spsc_queue_peek(&entity->job_queue));
>>   	if (!sched_job)
>> -		return NULL;
>> +		goto skip;
>>   
>>   	while ((entity->dependency =
>>   			drm_sched_job_dependency(sched_job, entity))) {
>>   		trace_drm_sched_job_wait_dep(sched_job, entity->dependency);
>>   
>> -		if (drm_sched_entity_add_dependency_cb(entity))
>> -			return NULL;
>> +		if (drm_sched_entity_add_dependency_cb(entity)) {
>> +			sched_job = NULL;
>> +			goto skip;
>> +		}
>>   	}
>>   
>>   	/* skip jobs from entity that marked guilty */
>> @@ -443,6 +446,16 @@ struct drm_sched_job *drm_sched_entity_pop_job(struct drm_sched_entity *entity)
>>   	smp_wmb();
>>   
>>   	spsc_queue_pop(&entity->job_queue);
>> +
>> +	/*
>> +	 * It's when head job is extracted we can access the next job (or empty)
>> +	 * queue and update the entity location in the min heap accordingly.
>> +	 */
>> +skip:
>> +	if (drm_sched_policy == DRM_SCHED_POLICY_FIFO)
>> +		drm_sched_rq_update_fifo(entity,
>> +					 (sched_job ? sched_job->submit_ts : ktime_get()));
>> +
>>   	return sched_job;
>>   }
>>   
>> @@ -502,11 +515,13 @@ void drm_sched_entity_push_job(struct drm_sched_job *sched_job)
>>   {
>>   	struct drm_sched_entity *entity = sched_job->entity;
>>   	bool first;
>> +	ktime_t ts =  ktime_get();
>>   
>>   	trace_drm_sched_job(sched_job, entity);
>>   	atomic_inc(entity->rq->sched->score);
>>   	WRITE_ONCE(entity->last_user, current->group_leader);
>>   	first = spsc_queue_push(&entity->job_queue, &sched_job->queue_node);
>> +	sched_job->submit_ts = ts;
>>   
>>   	/* first job wakes up scheduler */
>>   	if (first) {
>> @@ -518,8 +533,13 @@ void drm_sched_entity_push_job(struct drm_sched_job *sched_job)
>>   			DRM_ERROR("Trying to push to a killed entity\n");
>>   			return;
>>   		}
>> +
>>   		drm_sched_rq_add_entity(entity->rq, entity);
>>   		spin_unlock(&entity->rq_lock);
>> +
>> +		if (drm_sched_policy == DRM_SCHED_POLICY_FIFO)
>> +			drm_sched_rq_update_fifo(entity, ts);
>> +
>>   		drm_sched_wakeup(entity->rq->sched);
>>   	}
>>   }
>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
>> index 4f2395d1a791..565707a1c5c7 100644
>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>> @@ -62,6 +62,64 @@
>>   #define to_drm_sched_job(sched_job)		\
>>   		container_of((sched_job), struct drm_sched_job, queue_node)
>>   
>> +int drm_sched_policy = DRM_SCHED_POLICY_RR;
>> +
>> +/**
>> + * DOC: sched_policy (int)
>> + * Used to override default entities scheduling policy in a run queue.
>> + */
>> +MODULE_PARM_DESC(sched_policy,
>> +		 "specify schedule policy for entities on a runqueue (DRM_SCHED_POLICY_RR = Round Robin (default), DRM_SCHED_POLICY_FIFO  = use FIFO");
>> +module_param_named(sched_policy, drm_sched_policy, int, 0444);
>> +
>> +static __always_inline bool drm_sched_entity_compare_before(struct rb_node *a,
>> +							    const struct rb_node *b)
>> +{
>> +	struct drm_sched_entity *ent_a =  rb_entry((a), struct drm_sched_entity, rb_tree_node);
>> +	struct drm_sched_entity *ent_b =  rb_entry((b), struct drm_sched_entity, rb_tree_node);
>> +
>> +	return ktime_before(ent_a->oldest_job_waiting, ent_b->oldest_job_waiting);
>> +}
>> +
>> +static inline void drm_sched_rq_remove_fifo_locked(struct drm_sched_entity *entity)
>> +{
>> +	struct drm_sched_rq *rq = entity->rq;
>> +
>> +	if (!RB_EMPTY_NODE(&entity->rb_tree_node)) {
>> +		rb_erase_cached(&entity->rb_tree_node, &rq->rb_tree_root);
>> +		RB_CLEAR_NODE(&entity->rb_tree_node);
>> +	}
>> +}
>> +
>> +static inline void drm_sched_rq_update_fifo_locked(struct drm_sched_entity *entity,
>> +						   ktime_t ts)
>> +{
>> +	struct drm_sched_rq *rq = entity->rq;
>> +
>> +	drm_sched_rq_remove_fifo_locked(entity);
>> +
>> +	entity->oldest_job_waiting = ts;
>> +
>> +	rb_add_cached(&entity->rb_tree_node, &rq->rb_tree_root,
>> +		      drm_sched_entity_compare_before);
>> +}
>> +
>> +void drm_sched_rq_update_fifo(struct drm_sched_entity *entity, ktime_t ts)
>> +{
>> +	/*
>> +	 * Both locks need to be grabbed, one to protect from entity->rq change
>> +	 * for entity from within concurrent drm_sched_entity_select_rq and the
>> +	 * other to update the rb tree structure.
>> +	 */
>> +	spin_lock(&entity->rq_lock);
>> +	spin_lock(&entity->rq->lock);
>> +
>> +	drm_sched_rq_update_fifo_locked(entity, ts);
>> +
>> +	spin_unlock(&entity->rq->lock);
>> +	spin_unlock(&entity->rq_lock);
>> +}
> I thought you were going to drop one of the locks here?
> Address this by either updating the comment to explain to future programmers
> what is going on here and why the locking is not consistent (2 vs 1 lock),
> or drop one of the locks, as per my previous review.


Note that after last review drm_sched_rq_update_fifo_locked is not 
called anywhere
besides drm_sched_rq_update_fifo and so becomes obsolete and I will 
remove it now.
In this case the double locking above is consistent and the reason is 
explained in the
comment above.


>
>> +
>>   /**
>>    * drm_sched_rq_init - initialize a given run queue struct
>>    *
>> @@ -75,6 +133,7 @@ static void drm_sched_rq_init(struct drm_gpu_scheduler *sched,
>>   {
>>   	spin_lock_init(&rq->lock);
>>   	INIT_LIST_HEAD(&rq->entities);
>> +	rq->rb_tree_root = RB_ROOT_CACHED;
>>   	rq->current_entity = NULL;
>>   	rq->sched = sched;
>>   }
>> @@ -92,9 +151,12 @@ void drm_sched_rq_add_entity(struct drm_sched_rq *rq,
>>   {
>>   	if (!list_empty(&entity->list))
>>   		return;
>> +
>>   	spin_lock(&rq->lock);
>> +
>>   	atomic_inc(rq->sched->score);
>>   	list_add_tail(&entity->list, &rq->entities);
>> +
>>   	spin_unlock(&rq->lock);
>>   }
>>   
>> @@ -111,23 +173,30 @@ void drm_sched_rq_remove_entity(struct drm_sched_rq *rq,
>>   {
>>   	if (list_empty(&entity->list))
>>   		return;
>> +
>>   	spin_lock(&rq->lock);
>> +
>>   	atomic_dec(rq->sched->score);
>>   	list_del_init(&entity->list);
>> +
>>   	if (rq->current_entity == entity)
>>   		rq->current_entity = NULL;
>> +
>> +	if (drm_sched_policy == DRM_SCHED_POLICY_FIFO)
>> +		drm_sched_rq_remove_fifo_locked(entity);
>> +
>>   	spin_unlock(&rq->lock);
>>   }
>>   
>>   /**
>> - * drm_sched_rq_select_entity - Select an entity which could provide a job to run
>> + * drm_sched_rq_select_entity_rr - Select an entity which could provide a job to run
>>    *
>>    * @rq: scheduler run queue to check.
>>    *
>>    * Try to find a ready entity, returns NULL if none found.
>>    */
>>   static struct drm_sched_entity *
>> -drm_sched_rq_select_entity(struct drm_sched_rq *rq)
>> +drm_sched_rq_select_entity_rr(struct drm_sched_rq *rq)
>>   {
>>   	struct drm_sched_entity *entity;
>>   
>> @@ -163,6 +232,36 @@ drm_sched_rq_select_entity(struct drm_sched_rq *rq)
>>   	return NULL;
>>   }
>>   
>> +/**
>> + * drm_sched_rq_select_entity_fifo - Select an entity which provides a job to run
>> + *
>> + * @rq: scheduler run queue to check.
>> + *
>> + * Find oldest waiting ready entity, returns NULL if none found.
>> + */
>> +static struct drm_sched_entity *
>> +drm_sched_rq_select_entity_fifo(struct drm_sched_rq *rq)
>> +{
>> +	struct rb_node *rb;
>> +	bool found = false;
>> +	struct drm_sched_entity *entity;
>> +
>> +	spin_lock(&rq->lock);
>> +	for (rb = rb_first_cached(&rq->rb_tree_root); rb; rb = rb_next(rb)) {
>> +		entity = rb_entry(rb, struct drm_sched_entity, rb_tree_node);
>> +
>> +		if (drm_sched_entity_is_ready(entity)) {
>> +			rq->current_entity = entity;
>> +			reinit_completion(&entity->entity_idle);
>> +			found = true;
>> +			break;
>> +		}
>> +	}
>> +	spin_unlock(&rq->lock);
>> +
>> +	return found ? entity : NULL;
>> +}
> You really don't need "found", and you don't need "entity" to be outside the loop.
>
> As per my last review, use this (which I've compiled and run):
>
> static struct drm_sched_entity *
> drm_sched_rq_select_entity_fifo(struct drm_sched_rq *rq)
> {
> 	struct rb_node *rb;
>
> 	spin_lock(&rq->lock);
> 	for (rb = rb_first_cached(&rq->rb_tree_root); rb; rb = rb_next(rb)) {
> 		struct drm_sched_entity *entity;
>
> 		entity = rb_entry(rb, struct drm_sched_entity, rb_tree_node);
> 		if (drm_sched_entity_is_ready(entity)) {
> 			rq->current_entity = entity;
> 			reinit_completion(&entity->entity_idle);
> 			break;
> 		}
> 	}
> 	spin_unlock(&rq->lock);
>
> 	return rb ? rb_entry(rb, struct drm_sched_entity, rb_tree_node) : NULL;
> }
>
> The only way we can exit the loop is,
> 1. The loop invariant is false, i.e. rb == NULL, or
> 2. The "break;" jump from inside the if () inside the loop.
>
> Also note that "rb" does NOT need to be initialized, since, the for() statement
> is always executed, and the assignment "rb = rb_first_cached(&rq->rb_tree_root);"
> initializes it--this is why GCC doesn't complain :-)
>
> Also note that you don't need to export "entity" as it makes the for() loop relocatable
> to another function with only having a dependency on "rb" being defined--the loop
> is self-contained.
>
> At the "return" statement, we know that we've exited the loop, by either the loop
> invariant being false, i.e. rb == NULL, or by the "break;" jump, in which case
> we know that rb != NULL. This is why the "return;" statement as presented above works
> correctly.
>
> Please use that function in the way it is above, which is minimal and mature.


Makes sense, missed the point that at the end rb will be set to NULL

Andrey


>
> Regards,
> Luben
>
>> +
>>   /**
>>    * drm_sched_job_done - complete a job
>>    * @s_job: pointer to the job which is done
>> @@ -803,7 +902,9 @@ drm_sched_select_entity(struct drm_gpu_scheduler *sched)
>>   
>>   	/* Kernel run queue has higher priority than normal run queue*/
>>   	for (i = DRM_SCHED_PRIORITY_COUNT - 1; i >= DRM_SCHED_PRIORITY_MIN; i--) {
>> -		entity = drm_sched_rq_select_entity(&sched->sched_rq[i]);
>> +		entity = drm_sched_policy != DRM_SCHED_POLICY_FIFO ?
>> +				drm_sched_rq_select_entity_rr(&sched->sched_rq[i]) :
>> +				drm_sched_rq_select_entity_fifo(&sched->sched_rq[i]);
>>   		if (entity)
>>   			break;
>>   	}
>> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
>> index 599855c6a672..1f7d9dd1a444 100644
>> --- a/include/drm/gpu_scheduler.h
>> +++ b/include/drm/gpu_scheduler.h
>> @@ -50,6 +50,12 @@ enum drm_sched_priority {
>>   	DRM_SCHED_PRIORITY_UNSET = -2
>>   };
>>   
>> +/* Used to chose between FIFO and RR jobs scheduling */
>> +extern int drm_sched_policy;
>> +
>> +#define DRM_SCHED_POLICY_RR    0
>> +#define DRM_SCHED_POLICY_FIFO  1
>> +
>>   /**
>>    * struct drm_sched_entity - A wrapper around a job queue (typically
>>    * attached to the DRM file_priv).
>> @@ -196,6 +202,21 @@ struct drm_sched_entity {
>>   	 * drm_sched_entity_fini().
>>   	 */
>>   	struct completion		entity_idle;
>> +
>> +	/**
>> +	 * @oldest_job_waiting:
>> +	 *
>> +	 * Marks earliest job waiting in SW queue
>> +	 */
>> +	ktime_t				oldest_job_waiting;
>> +
>> +	/**
>> +	 * @rb_tree_node:
>> +	 *
>> +	 * The node used to insert this entity into time based priority queue
>> +	 */
>> +	struct rb_node			rb_tree_node;
>> +
>>   };
>>   
>>   /**
>> @@ -205,6 +226,7 @@ struct drm_sched_entity {
>>    * @sched: the scheduler to which this rq belongs to.
>>    * @entities: list of the entities to be scheduled.
>>    * @current_entity: the entity which is to be scheduled.
>> + * @rb_tree_root: root of time based priory queue of entities for FIFO scheduling
>>    *
>>    * Run queue is a set of entities scheduling command submissions for
>>    * one specific ring. It implements the scheduling policy that selects
>> @@ -215,6 +237,7 @@ struct drm_sched_rq {
>>   	struct drm_gpu_scheduler	*sched;
>>   	struct list_head		entities;
>>   	struct drm_sched_entity		*current_entity;
>> +	struct rb_root_cached		rb_tree_root;
>>   };
>>   
>>   /**
>> @@ -314,6 +337,13 @@ struct drm_sched_job {
>>   
>>   	/** @last_dependency: tracks @dependencies as they signal */
>>   	unsigned long			last_dependency;
>> +
>> +	/**
>> +	 * @submit_ts:
>> +	 *
>> +	 * When the job was pushed into the entity queue.
>> +	 */
>> +	ktime_t                         submit_ts;
>>   };
>>   
>>   static inline bool drm_sched_invalidate_job(struct drm_sched_job *s_job,
>> @@ -503,6 +533,8 @@ void drm_sched_rq_add_entity(struct drm_sched_rq *rq,
>>   void drm_sched_rq_remove_entity(struct drm_sched_rq *rq,
>>   				struct drm_sched_entity *entity);
>>   
>> +void drm_sched_rq_update_fifo(struct drm_sched_entity *entity, ktime_t ts);
>> +
>>   int drm_sched_entity_init(struct drm_sched_entity *entity,
>>   			  enum drm_sched_priority priority,
>>   			  struct drm_gpu_scheduler **sched_list,
