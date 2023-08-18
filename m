Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ADA37805A6
	for <lists+dri-devel@lfdr.de>; Fri, 18 Aug 2023 07:27:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D804C10E44F;
	Fri, 18 Aug 2023 05:27:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1300510E44F;
 Fri, 18 Aug 2023 05:27:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KhDFhRTe3BL7OjOEzzfTYzaZaPoVUqHOsDa1a96jBhCYljxxdoKHwxMtsKmGbvkboGl9t5BXudOs5K4QQ1/rmBAaGBOUYESt73tq9zZkfTNInCPRdNzibxv9uB1zO44NVs2WUtl34wP5+m1R9NMaqeNYd13DMcoAvFd6pmCH22crkVUuUbXaFWXEEqOD+f4Vk3YvpZAe9Sq0KkFbyNJrG5uhY7bsPLKe55qPvEWT0NzuqQMGM89WovZ3375Zz4IQMSqprNEqBCim5XjkZ21iceravCxlDsXqnmfUOAP0ApOSrUf1lhq3RFkHgMq+Sk75bkr3CfwR36zhz49fh+qVqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qLeazdzZd61FsA4hwv7tsmosgZOy8UlG6wZnBALd7k4=;
 b=l/glRI4MjSTWyh/NWFcYxu2kH9vr9UXLIpctMpx8IrxDpwwLvrWAXpsUOuDEpM0WWjIOi8DGUNiEECIZPHXcGJRKeRQ1F/nAS3WP7fQ59w2U7AaeR3ABKnVMlA6BJYgp9wA/DqKTQHCxPp5Xnm6Xjd8SPwW2qO0R0hjtsMx3cGK9CU0i5Lb8O0CcKnhCZnukNjPQEuQ1XpZ0+3fAy6hKUqj7OeZwG04h10Mn9zdyzuNKoK1l49S9WdyNNt/7Ol+mbwqMFpr3T7b754ZNhvyW/MjmOZol90TnzabWuuwiPLOZcXtLK4h1ug42EdQA3cWEqOwbB2skhe/JC7P9muG9Tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qLeazdzZd61FsA4hwv7tsmosgZOy8UlG6wZnBALd7k4=;
 b=d+7LCl4qZks+c1B0b37b/QlCTabZg5em5qy6Rdfj7lc56F115eDuvHG9nc9BM0ZDYByCfLBCMSBTSLNan36CZHIIXP1PAAWGbSjrvNVzqIetIUmPjtpfB9Y3/teD11CyBj88Xqy6HpuXW48sL2NU9GibsZd4IWGFdd5QT1n9g74=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BYAPR12MB3589.namprd12.prod.outlook.com (2603:10b6:a03:df::29)
 by DM4PR12MB5263.namprd12.prod.outlook.com (2603:10b6:5:39b::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.31; Fri, 18 Aug
 2023 05:27:43 +0000
Received: from BYAPR12MB3589.namprd12.prod.outlook.com
 ([fe80::3624:9885:6e0a:5d97]) by BYAPR12MB3589.namprd12.prod.outlook.com
 ([fe80::3624:9885:6e0a:5d97%6]) with mapi id 15.20.6678.031; Fri, 18 Aug 2023
 05:27:43 +0000
Message-ID: <9f6554fd-8748-2613-1c90-921b670ad4d9@amd.com>
Date: Fri, 18 Aug 2023 07:27:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 4/9] drm/sched: Split free_job into own work item
Content-Language: en-US
To: Matthew Brost <matthew.brost@intel.com>
References: <20230811023137.659037-1-matthew.brost@intel.com>
 <20230811023137.659037-5-matthew.brost@intel.com>
 <f6b7c246-fd87-a853-b7c4-e2c1b6727a93@amd.com>
 <ZN5exv1IWJtKL1nJ@DUT025-TGLU.fm.intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <ZN5exv1IWJtKL1nJ@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0005.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::19) To BYAPR12MB3589.namprd12.prod.outlook.com
 (2603:10b6:a03:df::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR12MB3589:EE_|DM4PR12MB5263:EE_
X-MS-Office365-Filtering-Correlation-Id: ac17dbd7-2f06-463c-b971-08db9fabd8b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5JWAQzlLDqTUIdYlOK3l6+1bfN2ceHwlSBaL/rlSuinCclY7IhWrKXiF4CQsJ/sWtcsz1q63b0wUJJTDTsrbE9HnxAPidNMJcwhWaXFmgUcXeFloe73skmYdaKq7JlyVRrqHzhdoXv02tcIqhFwu+BulnjEz0zJlPJEDWj9UQaZ7HoHA/I1wM2N9wQ6kMaZQ49uvFMOvxCy43SfP2J0euEBO+/fM0mdOt80AI5XG5R2j53/GihaNxzSu28WFTNw/ovPisyZ/j+5JRRtiJ4L8g38jrdvhdqKXK9FJwipcA/w94L+UdVkhUYF1a1T3uL6jRbBOmHEVNEpwviLE+OMQ+swAJ9ZqLvvWblYgik0xbjH0lwEowBhTUCNMrrnT0RIv4r6qrMoDGflUcKYDS1MqTLM7zwaNuJbhPDpbIJkAE6EKmzo7qTz8iVJK0W06hMIPZV71hmvCjkNz3zI5BDRu+HCmAlQ1VgreVD6qBOfhkeE4uJpvtW4q3m35Nze9465wUYJWuUGa7muYHSPcBQtePBz1zj53KwLP1/jrcluGPRqtP2KlpolSTopn+sjTk5EhS6W7IJW0BL4LIlTgDG0woYbIXkodcJOkoB8TaJ5GCj1eGxnEtWrFLTvLalT9WgiWnR6muojTpeTN+k5zkdYiFg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3589.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(376002)(136003)(366004)(396003)(39860400002)(451199024)(1800799009)(186009)(31686004)(86362001)(31696002)(36756003)(38100700002)(2616005)(5660300002)(66556008)(478600001)(6506007)(66946007)(66476007)(6666004)(6486002)(316002)(6916009)(26005)(6512007)(4326008)(8676002)(8936002)(41300700001)(66574015)(83380400001)(7416002)(30864003)(2906002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dW5jNjdqZGxEakdjdTJ2UGVYbW9zT1RmYjhueGVyNldMMTBYWHVRaHdtb0RL?=
 =?utf-8?B?L1ROMjhYTkRlamxJV2dGZUpTdWlqUmEwclViNjJMYzg1OWFnMkFFK2Y5WFVM?=
 =?utf-8?B?QmhpQUVFL21lMHYrWVNtcVpMdHJFWno4T0dSUzJhVjdpY0lCTG9jdEFVK3gx?=
 =?utf-8?B?ME42U2JrSFFBRk9BWDJ5cDduZjE0aWJydUFwb08vL3dvczQvaDI5T05qMVAw?=
 =?utf-8?B?eFU0TEloaFlHRmEwbjl3RURBYzhFdGlmc0RKU0RjNjVOcGw1OWl1UEhCRXFS?=
 =?utf-8?B?RUo0VVYzbnJON1R6NmNDQXJLVXZxQ09iWGltSEJSNlZCUlU0NEpxUThRQ2p6?=
 =?utf-8?B?V08rM3FIVlpDY0syMWhvUmpOeFA5VnRpUUllcXUxYVhZMFpSME9BdEJNRnpy?=
 =?utf-8?B?QU5vb0t5bGdqQ2E1MitZaFZYNnQ1V2ZLejdLRHl0bVAxNEh1NXc5a3ZodFpR?=
 =?utf-8?B?QWRzRXRPNW9uVlA5VmpwbWYwZHdKbHhlRGNVRTgyT29MN0NsSmdxdzkzL1dO?=
 =?utf-8?B?UklneXpUeTVrZVhiYTZkbDFHQnBVbkMwOTZHaHoxdVFtYzFIc3JNQWRwbWRP?=
 =?utf-8?B?VUYydGZFVWNNeldTRDRVT2I5OWlrTHkxQW8xY3BKUGRBcUhpQ3BhZ0xyaHBz?=
 =?utf-8?B?MjFzQVkwZGZJY3VBbStjZW1EL3RoUElJVkxLVUo3ZDU5dGRwMmkzNUp3NlJk?=
 =?utf-8?B?SXorQ0g0N0FkeDZHdEZ6eHhycE5OcnJmby9JMlJMekJTTnovdmIxQ3lGRWVn?=
 =?utf-8?B?ckRnUzlyZnlsR0ZoRFFONVdhZ3d3YXdueEM5WlJlc1FLYStDS3lJUk5jbmJt?=
 =?utf-8?B?Zno0MUl6bDVXOW1YNVNEQmlTN2YvOTBYUjBQa3FzQnI5K2s3dllXV2V6TVRl?=
 =?utf-8?B?bi9rVnVPR243cU8yajBBQmJoU25SemoyeTdWKzQ2RWFBYXhnclExZ0tpSXdh?=
 =?utf-8?B?WW1EajlacEV5YUJJVHovOGpKSStQUklERzVnNnhOam9RdlAyR0JyVWc4bk5V?=
 =?utf-8?B?bFhGZG1IL0JXaFBFZEV0WG82aUw1aTVUNklCL3pPV2pNbnV4OG53aXZaaGgv?=
 =?utf-8?B?NXlzUHc2VjMrd3RKUHUxVkFSWFU0OUZRNlljTitQYWlsQzBwTG94MmxVbnFG?=
 =?utf-8?B?R0tYREJ0cS8yT2VaS09vNHNUTERoVXdJcnJvaGczYysvRmNaek4yYlZ4UHQy?=
 =?utf-8?B?cnVrMUhlTjQvTzRzaU44cS9WV01sMnFDUDJteWZXSXdvU0JYamoyaVhSdTlI?=
 =?utf-8?B?cXBPUWk3eWpGVjZzSzVLU3VURVIzUkF2KzJHY01hdEFUZHpTekQxVHBVejBY?=
 =?utf-8?B?azR4VXFqL3g0cFNyZG9HNnYrSlNwNVdxeUFyTDJJRno2djBnRDVXL3JWTUZp?=
 =?utf-8?B?OUVvQnZNTHliWUJsWGZzdWdpNWdJRDlDQWRxdndLY3o5OXNINXRuWFByOFBt?=
 =?utf-8?B?VEU2RVV3UHZXYzNsYWFxYlZ3RWx0SVdHMndjYkRCWUdTSjJUZUtvNXlyRy94?=
 =?utf-8?B?Y1JEZXVsZzgwRWtYQnRubll5clUxeERsMEVhTnNzTDVKeitMUGVyZkxxMEE1?=
 =?utf-8?B?RG00QXkva3ZMTHl6SjBWZU15NVFDV2MzRkpWdWxZQmlZalFiaUdVVnRRa2li?=
 =?utf-8?B?UlQvQVh5dTZCWGJ6Q1d6cUZybjJNQzdDdzVudHRqMGt6cU52TjUzZmVqRmVC?=
 =?utf-8?B?N1BHQzYzMEVKSU1SNGU4RzVLd0MzcjhseEFlTUpWb2lnejQrSHZSRUluSW1r?=
 =?utf-8?B?a1lsMzJUdjRkdUttZnVhUzRTVG0wbXhQcXhxWHR0ZUtVSXB5TVc3Sm9WZ3Rv?=
 =?utf-8?B?L1diUnpOWG1XUnNrekFaVmQ5MzlRc1JwWm5pTjlmY2t3eC9wWStQS1ZlQjhC?=
 =?utf-8?B?L05la0xCRVRKSnJUTjNyNDcyTUx3NjRuYW1TcmM0MDArUFZTNFhqQXBXWXpU?=
 =?utf-8?B?N3MvRno4Z3ZKUXZJbmpvQ0wrYkh3TG9qb3pYaU5UdSt2Sy9meFA1bXFmalpR?=
 =?utf-8?B?aHRicWFBckcyZ2V4UHl6L041bFJSU1IrTmx1SUZXQUIvcGE3VXhYUWhmK2JM?=
 =?utf-8?B?dm9OMUhSRUdYYy90RXBjU1JzcFZsTHgrcnhRMTcrMTlqM2pSWE15VnRvbHpF?=
 =?utf-8?Q?VDrMkO90zthPETyezRwJi3bCL?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac17dbd7-2f06-463c-b971-08db9fabd8b8
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3589.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2023 05:27:42.9763 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nEsjL4Kyo+fCjxeRfK/Pl+ksJw/ArOh+0dO5/RniNO/QY280ghszubx7jgXgk9WD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5263
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
Cc: robdclark@chromium.org, thomas.hellstrom@linux.intel.com,
 sarah.walker@imgtec.com, ketil.johnsen@arm.com, Liviu.Dudau@arm.com,
 dri-devel@lists.freedesktop.org, luben.tuikov@amd.com, lina@asahilina.net,
 donald.robson@imgtec.com, boris.brezillon@collabora.com,
 intel-xe@lists.freedesktop.org, faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 17.08.23 um 19:54 schrieb Matthew Brost:
> On Thu, Aug 17, 2023 at 03:39:40PM +0200, Christian König wrote:
>> Am 11.08.23 um 04:31 schrieb Matthew Brost:
>>> Rather than call free_job and run_job in same work item have a dedicated
>>> work item for each. This aligns with the design and intended use of work
>>> queues.
>> I would rather say we should get completely rid of the free_job callback.
>>
> Would we still have work item? e.g. Would we still want to call
> drm_sched_get_cleanup_job which removes the job from the pending list
> and adjusts the TDR? Trying to figure out out what this looks like. We
> probably can't do all of this from an IRQ context.
>
>> Essentially the job is just the container which carries the information
>> which are necessary before you push it to the hw. The real representation of
>> the submission is actually the scheduler fence.
>>
> Most of the free_jobs call plus drm_sched_job_cleanup + a put on job. In
> Xe this cannot be called from an IRQ context either.
>
> I'm just confused what exactly you are suggesting here.

To summarize on one sentence: Instead of the job we keep the scheduler 
and hardware fences around after pushing the job to the hw.

The free_job callback would then be replaced by dropping the reference 
on the scheduler and hw fence.

Would that work for you?

Christian.

>
> Matt
>
>> All the lifetime issues we had came from ignoring this fact and I think we
>> should push for fixing this design up again.
>>
>> Regards,
>> Christian.
>>
>>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>>> ---
>>>    drivers/gpu/drm/scheduler/sched_main.c | 137 ++++++++++++++++++-------
>>>    include/drm/gpu_scheduler.h            |   8 +-
>>>    2 files changed, 106 insertions(+), 39 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
>>> index cede47afc800..b67469eac179 100644
>>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>>> @@ -213,11 +213,12 @@ void drm_sched_rq_remove_entity(struct drm_sched_rq *rq,
>>>     * drm_sched_rq_select_entity_rr - Select an entity which could provide a job to run
>>>     *
>>>     * @rq: scheduler run queue to check.
>>> + * @dequeue: dequeue selected entity
>>>     *
>>>     * Try to find a ready entity, returns NULL if none found.
>>>     */
>>>    static struct drm_sched_entity *
>>> -drm_sched_rq_select_entity_rr(struct drm_sched_rq *rq)
>>> +drm_sched_rq_select_entity_rr(struct drm_sched_rq *rq, bool dequeue)
>>>    {
>>>    	struct drm_sched_entity *entity;
>>> @@ -227,8 +228,10 @@ drm_sched_rq_select_entity_rr(struct drm_sched_rq *rq)
>>>    	if (entity) {
>>>    		list_for_each_entry_continue(entity, &rq->entities, list) {
>>>    			if (drm_sched_entity_is_ready(entity)) {
>>> -				rq->current_entity = entity;
>>> -				reinit_completion(&entity->entity_idle);
>>> +				if (dequeue) {
>>> +					rq->current_entity = entity;
>>> +					reinit_completion(&entity->entity_idle);
>>> +				}
>>>    				spin_unlock(&rq->lock);
>>>    				return entity;
>>>    			}
>>> @@ -238,8 +241,10 @@ drm_sched_rq_select_entity_rr(struct drm_sched_rq *rq)
>>>    	list_for_each_entry(entity, &rq->entities, list) {
>>>    		if (drm_sched_entity_is_ready(entity)) {
>>> -			rq->current_entity = entity;
>>> -			reinit_completion(&entity->entity_idle);
>>> +			if (dequeue) {
>>> +				rq->current_entity = entity;
>>> +				reinit_completion(&entity->entity_idle);
>>> +			}
>>>    			spin_unlock(&rq->lock);
>>>    			return entity;
>>>    		}
>>> @@ -257,11 +262,12 @@ drm_sched_rq_select_entity_rr(struct drm_sched_rq *rq)
>>>     * drm_sched_rq_select_entity_fifo - Select an entity which provides a job to run
>>>     *
>>>     * @rq: scheduler run queue to check.
>>> + * @dequeue: dequeue selected entity
>>>     *
>>>     * Find oldest waiting ready entity, returns NULL if none found.
>>>     */
>>>    static struct drm_sched_entity *
>>> -drm_sched_rq_select_entity_fifo(struct drm_sched_rq *rq)
>>> +drm_sched_rq_select_entity_fifo(struct drm_sched_rq *rq, bool dequeue)
>>>    {
>>>    	struct rb_node *rb;
>>> @@ -271,8 +277,10 @@ drm_sched_rq_select_entity_fifo(struct drm_sched_rq *rq)
>>>    		entity = rb_entry(rb, struct drm_sched_entity, rb_tree_node);
>>>    		if (drm_sched_entity_is_ready(entity)) {
>>> -			rq->current_entity = entity;
>>> -			reinit_completion(&entity->entity_idle);
>>> +			if (dequeue) {
>>> +				rq->current_entity = entity;
>>> +				reinit_completion(&entity->entity_idle);
>>> +			}
>>>    			break;
>>>    		}
>>>    	}
>>> @@ -282,13 +290,54 @@ drm_sched_rq_select_entity_fifo(struct drm_sched_rq *rq)
>>>    }
>>>    /**
>>> - * drm_sched_submit_queue - scheduler queue submission
>>> + * drm_sched_run_job_queue - queue job submission
>>>     * @sched: scheduler instance
>>>     */
>>> -static void drm_sched_submit_queue(struct drm_gpu_scheduler *sched)
>>> +static void drm_sched_run_job_queue(struct drm_gpu_scheduler *sched)
>>>    {
>>>    	if (!READ_ONCE(sched->pause_submit))
>>> -		queue_work(sched->submit_wq, &sched->work_submit);
>>> +		queue_work(sched->submit_wq, &sched->work_run_job);
>>> +}
>>> +
>>> +static struct drm_sched_entity *
>>> +drm_sched_select_entity(struct drm_gpu_scheduler *sched, bool dequeue);
>>> +
>>> +/**
>>> + * drm_sched_run_job_queue_if_ready - queue job submission if ready
>>> + * @sched: scheduler instance
>>> + */
>>> +static void drm_sched_run_job_queue_if_ready(struct drm_gpu_scheduler *sched)
>>> +{
>>> +	if (drm_sched_select_entity(sched, false))
>>> +		drm_sched_run_job_queue(sched);
>>> +}
>>> +
>>> +/**
>>> + * drm_sched_free_job_queue - queue free job
>>> + *
>>> + * @sched: scheduler instance to queue free job
>>> + */
>>> +static void drm_sched_free_job_queue(struct drm_gpu_scheduler *sched)
>>> +{
>>> +	if (!READ_ONCE(sched->pause_submit))
>>> +		queue_work(sched->submit_wq, &sched->work_free_job);
>>> +}
>>> +
>>> +/**
>>> + * drm_sched_free_job_queue_if_ready - queue free job if ready
>>> + *
>>> + * @sched: scheduler instance to queue free job
>>> + */
>>> +static void drm_sched_free_job_queue_if_ready(struct drm_gpu_scheduler *sched)
>>> +{
>>> +	struct drm_sched_job *job;
>>> +
>>> +	spin_lock(&sched->job_list_lock);
>>> +	job = list_first_entry_or_null(&sched->pending_list,
>>> +				       struct drm_sched_job, list);
>>> +	if (job && dma_fence_is_signaled(&job->s_fence->finished))
>>> +		drm_sched_free_job_queue(sched);
>>> +	spin_unlock(&sched->job_list_lock);
>>>    }
>>>    /**
>>> @@ -310,7 +359,7 @@ static void drm_sched_job_done(struct drm_sched_job *s_job, int result)
>>>    	dma_fence_get(&s_fence->finished);
>>>    	drm_sched_fence_finished(s_fence, result);
>>>    	dma_fence_put(&s_fence->finished);
>>> -	drm_sched_submit_queue(sched);
>>> +	drm_sched_free_job_queue(sched);
>>>    }
>>>    /**
>>> @@ -906,18 +955,19 @@ static bool drm_sched_can_queue(struct drm_gpu_scheduler *sched)
>>>    void drm_sched_wakeup_if_can_queue(struct drm_gpu_scheduler *sched)
>>>    {
>>>    	if (drm_sched_can_queue(sched))
>>> -		drm_sched_submit_queue(sched);
>>> +		drm_sched_run_job_queue(sched);
>>>    }
>>>    /**
>>>     * drm_sched_select_entity - Select next entity to process
>>>     *
>>>     * @sched: scheduler instance
>>> + * @dequeue: dequeue selected entity
>>>     *
>>>     * Returns the entity to process or NULL if none are found.
>>>     */
>>>    static struct drm_sched_entity *
>>> -drm_sched_select_entity(struct drm_gpu_scheduler *sched)
>>> +drm_sched_select_entity(struct drm_gpu_scheduler *sched, bool dequeue)
>>>    {
>>>    	struct drm_sched_entity *entity;
>>>    	int i;
>>> @@ -935,8 +985,10 @@ drm_sched_select_entity(struct drm_gpu_scheduler *sched)
>>>    	/* Kernel run queue has higher priority than normal run queue*/
>>>    	for (i = DRM_SCHED_PRIORITY_COUNT - 1; i >= DRM_SCHED_PRIORITY_MIN; i--) {
>>>    		entity = sched->sched_policy == DRM_SCHED_POLICY_FIFO ?
>>> -			drm_sched_rq_select_entity_fifo(&sched->sched_rq[i]) :
>>> -			drm_sched_rq_select_entity_rr(&sched->sched_rq[i]);
>>> +			drm_sched_rq_select_entity_fifo(&sched->sched_rq[i],
>>> +							dequeue) :
>>> +			drm_sched_rq_select_entity_rr(&sched->sched_rq[i],
>>> +						      dequeue);
>>>    		if (entity)
>>>    			break;
>>>    	}
>>> @@ -1024,30 +1076,44 @@ drm_sched_pick_best(struct drm_gpu_scheduler **sched_list,
>>>    EXPORT_SYMBOL(drm_sched_pick_best);
>>>    /**
>>> - * drm_sched_main - main scheduler thread
>>> + * drm_sched_free_job_work - worker to call free_job
>>>     *
>>> - * @param: scheduler instance
>>> + * @w: free job work
>>>     */
>>> -static void drm_sched_main(struct work_struct *w)
>>> +static void drm_sched_free_job_work(struct work_struct *w)
>>>    {
>>>    	struct drm_gpu_scheduler *sched =
>>> -		container_of(w, struct drm_gpu_scheduler, work_submit);
>>> -	struct drm_sched_entity *entity;
>>> +		container_of(w, struct drm_gpu_scheduler, work_free_job);
>>>    	struct drm_sched_job *cleanup_job;
>>> -	int r;
>>>    	if (READ_ONCE(sched->pause_submit))
>>>    		return;
>>>    	cleanup_job = drm_sched_get_cleanup_job(sched);
>>> -	entity = drm_sched_select_entity(sched);
>>> +	if (cleanup_job) {
>>> +		sched->ops->free_job(cleanup_job);
>>> +
>>> +		drm_sched_free_job_queue_if_ready(sched);
>>> +		drm_sched_run_job_queue_if_ready(sched);
>>> +	}
>>> +}
>>> -	if (!entity && !cleanup_job)
>>> -		return;	/* No more work */
>>> +/**
>>> + * drm_sched_run_job_work - worker to call run_job
>>> + *
>>> + * @w: run job work
>>> + */
>>> +static void drm_sched_run_job_work(struct work_struct *w)
>>> +{
>>> +	struct drm_gpu_scheduler *sched =
>>> +		container_of(w, struct drm_gpu_scheduler, work_run_job);
>>> +	struct drm_sched_entity *entity;
>>> +	int r;
>>> -	if (cleanup_job)
>>> -		sched->ops->free_job(cleanup_job);
>>> +	if (READ_ONCE(sched->pause_submit))
>>> +		return;
>>> +	entity = drm_sched_select_entity(sched, true);
>>>    	if (entity) {
>>>    		struct dma_fence *fence;
>>>    		struct drm_sched_fence *s_fence;
>>> @@ -1056,9 +1122,7 @@ static void drm_sched_main(struct work_struct *w)
>>>    		sched_job = drm_sched_entity_pop_job(entity);
>>>    		if (!sched_job) {
>>>    			complete_all(&entity->entity_idle);
>>> -			if (!cleanup_job)
>>> -				return;	/* No more work */
>>> -			goto again;
>>> +			return;	/* No more work */
>>>    		}
>>>    		s_fence = sched_job->s_fence;
>>> @@ -1088,10 +1152,8 @@ static void drm_sched_main(struct work_struct *w)
>>>    		}
>>>    		wake_up(&sched->job_scheduled);
>>> +		drm_sched_run_job_queue_if_ready(sched);
>>>    	}
>>> -
>>> -again:
>>> -	drm_sched_submit_queue(sched);
>>>    }
>>>    /**
>>> @@ -1150,7 +1212,8 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
>>>    	spin_lock_init(&sched->job_list_lock);
>>>    	atomic_set(&sched->hw_rq_count, 0);
>>>    	INIT_DELAYED_WORK(&sched->work_tdr, drm_sched_job_timedout);
>>> -	INIT_WORK(&sched->work_submit, drm_sched_main);
>>> +	INIT_WORK(&sched->work_run_job, drm_sched_run_job_work);
>>> +	INIT_WORK(&sched->work_free_job, drm_sched_free_job_work);
>>>    	atomic_set(&sched->_score, 0);
>>>    	atomic64_set(&sched->job_id_count, 0);
>>>    	sched->pause_submit = false;
>>> @@ -1275,7 +1338,8 @@ EXPORT_SYMBOL(drm_sched_submit_ready);
>>>    void drm_sched_submit_stop(struct drm_gpu_scheduler *sched)
>>>    {
>>>    	WRITE_ONCE(sched->pause_submit, true);
>>> -	cancel_work_sync(&sched->work_submit);
>>> +	cancel_work_sync(&sched->work_run_job);
>>> +	cancel_work_sync(&sched->work_free_job);
>>>    }
>>>    EXPORT_SYMBOL(drm_sched_submit_stop);
>>> @@ -1287,6 +1351,7 @@ EXPORT_SYMBOL(drm_sched_submit_stop);
>>>    void drm_sched_submit_start(struct drm_gpu_scheduler *sched)
>>>    {
>>>    	WRITE_ONCE(sched->pause_submit, false);
>>> -	queue_work(sched->submit_wq, &sched->work_submit);
>>> +	queue_work(sched->submit_wq, &sched->work_run_job);
>>> +	queue_work(sched->submit_wq, &sched->work_free_job);
>>>    }
>>>    EXPORT_SYMBOL(drm_sched_submit_start);
>>> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
>>> index 04eec2d7635f..fbc083a92757 100644
>>> --- a/include/drm/gpu_scheduler.h
>>> +++ b/include/drm/gpu_scheduler.h
>>> @@ -487,9 +487,10 @@ struct drm_sched_backend_ops {
>>>     *                 finished.
>>>     * @hw_rq_count: the number of jobs currently in the hardware queue.
>>>     * @job_id_count: used to assign unique id to the each job.
>>> - * @submit_wq: workqueue used to queue @work_submit
>>> + * @submit_wq: workqueue used to queue @work_run_job and @work_free_job
>>>     * @timeout_wq: workqueue used to queue @work_tdr
>>> - * @work_submit: schedules jobs and cleans up entities
>>> + * @work_run_job: schedules jobs
>>> + * @work_free_job: cleans up jobs
>>>     * @work_tdr: schedules a delayed call to @drm_sched_job_timedout after the
>>>     *            timeout interval is over.
>>>     * @pending_list: the list of jobs which are currently in the job queue.
>>> @@ -518,7 +519,8 @@ struct drm_gpu_scheduler {
>>>    	atomic64_t			job_id_count;
>>>    	struct workqueue_struct		*submit_wq;
>>>    	struct workqueue_struct		*timeout_wq;
>>> -	struct work_struct		work_submit;
>>> +	struct work_struct		work_run_job;
>>> +	struct work_struct		work_free_job;
>>>    	struct delayed_work		work_tdr;
>>>    	struct list_head		pending_list;
>>>    	spinlock_t			job_list_lock;

