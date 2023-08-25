Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5559A7888E1
	for <lists+dri-devel@lfdr.de>; Fri, 25 Aug 2023 15:46:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60C8510E69C;
	Fri, 25 Aug 2023 13:46:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20600.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eae::600])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBAC310E69C;
 Fri, 25 Aug 2023 13:46:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J/lKYkDnBeA5rOY8LkaDYqUUs/SR4Wkfdm+/bZP8AlQN45VwOIxJ1xH7cKp7gDgoAUNByDKZVHyotPN4DVtH3gUwMZEft5Zh0DywT/qMuK4HaRnbXv/5Ku/TR4jaJr6oyHpEzPV4N5Z+y6w3Jb1f/sO5+WwgLGhQMMne5obDE1tP8SYj99nmyuxVmAew+x4kF9fjGh6wR2Nba5xuFsBS1bu50qGN+WoOVyLDloMkvn7u8JyE/q81RY661mc8sRqtWvRdiBvLXZi9bLi9fnSHp6v8rBbUi/qcoI+wHtTTwF4nAsZupVFUj0WQs4Hy0ugiA/9gsEfkaOpXyEeon12xCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4j4hqLQohh58UmhpZEK7xmBLvtXZ5Iu9nUxU+g2a2OI=;
 b=JPgNsI77VbG8RjUkPwXpIam7JTj0yIwHmYWGLGl+r6Ar9Zh6zvShaXDMNmGDrC5NW/0HMS0WISEavFeI4NQHZPo3zFmEH/5NbORqO3csuidoXxD87cwiYTkCSOef94oCG9lNqBOENobPEaSXzIQ30hkpwc5j4MBi46qdtw4mMKCqmqcqMut9qzx7hcVf7/eyNAhDVJ0KbmGHBoC/EAHpVMrd4fmczbPhr1wIhegbEDbExyO+QS6dgMuezjzbAYsIeoqPqhN1girIvkwiv11jRWm/TEPcCZ25bVdiUNvELxB2ged1nc7l9z0FTllh4hJgwYVeF9HBg1eSNwADfW/5rQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4j4hqLQohh58UmhpZEK7xmBLvtXZ5Iu9nUxU+g2a2OI=;
 b=Pjr17AjFJv1+grnYQ2pT1epFgZFO+FrCShBkf7KdmXvEgx48es5EAmt605H7u472RmixH/Qeq12x6qCJz+xa/6gK3FxFi3rj28ChMgF+d6KMOAFx9YQ/827FZCLTDu3uE+YlxibPcyD4vNwjEC8/G9BTOrWdAXmgRC4CEDXE1+g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by SJ1PR12MB6340.namprd12.prod.outlook.com (2603:10b6:a03:453::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.27; Fri, 25 Aug
 2023 13:45:57 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::3d:c14:667a:1c81]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::3d:c14:667a:1c81%4]) with mapi id 15.20.6699.028; Fri, 25 Aug 2023
 13:45:57 +0000
Message-ID: <ee56b9ee-36c7-5935-c319-c8d1ad412c7c@amd.com>
Date: Fri, 25 Aug 2023 15:45:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 4/9] drm/sched: Split free_job into own work item
Content-Language: en-US
To: Matthew Brost <matthew.brost@intel.com>
References: <20230811023137.659037-1-matthew.brost@intel.com>
 <20230811023137.659037-5-matthew.brost@intel.com> <ZOfh6o2EaGuIqZVe@pollux>
 <ZOgYu1fZQUHeneJC@DUT025-TGLU.fm.intel.com>
 <6ae84066-b690-1562-0598-4694b022c960@amd.com>
 <ZOiuWcFDImBvJtnO@DUT025-TGLU.fm.intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <ZOiuWcFDImBvJtnO@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0107.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a8::20) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|SJ1PR12MB6340:EE_
X-MS-Office365-Filtering-Correlation-Id: 75e20bb3-a8b7-4c7d-d3a5-08dba5719c0a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eg7Fv8V2jQqZ0e5teOJSNXaYzOTBCm7TIYVmAGg/VByyaGZxkYttc8CktoRZ0NzpUL2r5H39maDTNTaaFH6gjECXSpBLYRyvU9Mf5uYTt68IHOZ+cHG+JHUC0wR8ouImn1BeznfJ93xYLmoPHzSwxqnMQdNwurtthZ5LQ+r3df+3Bzi+fZ8ojpPjrK55SMY9l6Ot/amwUMQsriW3Fgr4bDkHrwV+/N3ZeIrmWWF78VvwhkqR5JLTSAl9iKBjjKbt7Vmihp9OFwG9dmqYIfvupM0TyOfMlIWOpy+XO3DjEX7cJVy44RbWmXPdCG7ImSwAIVyXL/HFymPIrYQGrDyKZtYMflQS1kpTHiaflQsQekv4ZkiGgUDddeO+ijzmEv5zfsnvuE1ktGWqOk2LqXcRs4r6r5HaiBNl1tiC4CCrIylUw/OFiFDbDGEfkAgLTWZnAsTBztUxDOzMjyhXFZiTBM2j5nGXH7edMl9Q7V8d/h1/yzmCs2slQfl82J53BwqaQuG5PXo+ECg1taATnW8vcF3C1/Nh2ghApXul+NbzmvKdkwiHB8p4pWm9tKAM8YV7iTT+6qNt0ty9pVFGRl1+6nRUDBmYTGzp4UFBJ9O8Lg20jMyz5LZ0BPSlxHrgxY4++iYKYDo1HHlMXZXG/wsMSA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(366004)(39860400002)(396003)(136003)(346002)(186009)(1800799009)(451199024)(2616005)(5660300002)(8936002)(8676002)(4326008)(30864003)(36756003)(66574015)(83380400001)(7416002)(26005)(6666004)(38100700002)(66556008)(6512007)(66946007)(66476007)(6506007)(6916009)(316002)(478600001)(31686004)(41300700001)(2906002)(86362001)(6486002)(31696002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bkhSekpZSFI2aGFZcUpPSGRLUGZ1TlFQUC81MHJROWUrZUtVWWhRc0VRUk9Q?=
 =?utf-8?B?dytWZCtURitid2tWMUxFa0lvcEt4YVZiWkVFMEFSb1YrWm92NmtBbjE5UDBB?=
 =?utf-8?B?Q0ZlaFBmdVFLQ2RyWFk4WkNuaEFJZDhuOWVDQW5jbUJ2MWwvMjRwc1BtaXVC?=
 =?utf-8?B?RWtmVUtOTTFGVG5nRlRad0xIeEhlUDhRb1IvWm5BTExIdjdJdkk2YUxnVlNX?=
 =?utf-8?B?elZ5cHZRZ1lnS3M2Y1JVVFlscW1LWnBkajNuUU9TZHpyU0gzRk9nQ3Q4YVhx?=
 =?utf-8?B?YnpuenpXdUdhWGxpRUNKU2Z5bXhiRVB4WHcrSyt3cHNvbjd3bHlJcjVaRW1D?=
 =?utf-8?B?d0kzSGhmNEJBWktxdXpkWWNTRWxhZ3BQK3VZYkY5STdxUWtQVkczcVJPenhC?=
 =?utf-8?B?bXkzMFgwVHBKaWFkMWlRaWRIc1hjRERFaFZpL1JIRGxvL254NFdJbm1XOXBK?=
 =?utf-8?B?R2tnVG5JQy9nRklwc2VpQWVnT3VvZGNUU0xvTERNNnkwb2xuM1J4bE80ZW5I?=
 =?utf-8?B?UXdEVGtBL2o2OUhQemo0bmhQRUpRUWxEUExha1J0Y1g5QTYrc254Vk9UYnds?=
 =?utf-8?B?YUFudzZLb09admhhYzVrMkxTcWxxSm1HM1JOY0R4akp0SEVGb2hkQ3BKZStG?=
 =?utf-8?B?QlJKOE1LM3A3NzFyZ0hGWVpkNXZZWmI4b3dpSG93K2h2WFRDS20rekFzTWM0?=
 =?utf-8?B?Ry9QdE5UQmJ3L2l5dHk2UGNxOXQ1VXAxYmxla2NOblRUcGpOdmxGa3FPZGYw?=
 =?utf-8?B?RVlCelBKK2J4cnp3cCtHVW15SW9WTXFvTXJYbEl0R3lwdS9wLzVFWHE4Mjlu?=
 =?utf-8?B?anp1RzRVS1pGODlWTkZzRDRYazdYdE1MeitsWDdKd0Z2KzhyZDBxcmRKTnVI?=
 =?utf-8?B?MzlMVTVpY1Qwd1ZxbW9wa1M4cWUzMUJBNkhlWWdtMGZ1Nmk5N1dKMUs4M0N3?=
 =?utf-8?B?M0lENUxPV0RHa1ZNTnFVZi9IQW1FcFZETExXbGEwckk1SkFiRCt5SWJkTTY0?=
 =?utf-8?B?c284UUZ1OUZ4QmZrVVZPNmQrWWxDcFVxMWlWeklSSDg4ZlB2Tm1abmowa2Ru?=
 =?utf-8?B?ck9mWlpxd0lQbWxiQXFXOUFJVHhDZ0RjajEvTU5mQ0JIV1htWWhPdTVwUEVJ?=
 =?utf-8?B?SmNIempvWi9pSGQxTUlJckJvN0Y5c0pkcXJWNFFCbVpHRUVlcDlQOUpLQXha?=
 =?utf-8?B?UDkzUXpnQkt0WWpxVUUyVDZtSDRsZHpwNE55M1NzYjhoZko3YWFVK2NBcWVL?=
 =?utf-8?B?Mjh0Mk50TDNPcnBTOUdJSjhmUStiZTY5NlZNTkxyaXQzWW4ybk1HOVFDRXRy?=
 =?utf-8?B?dW1iUjZTSmVWWU9FVWF1RHhqU3RrVk92MXVZQ0xSQzFDVVI0QkFwQUNTMXhD?=
 =?utf-8?B?bms4RE9zQ2RSUVlVYUhaSjlqbit6L3JhZzBsdHNSVUNXOUszNTYrYXpwMXkx?=
 =?utf-8?B?SVppN1pOVCtENytHN2M3Z3k5ZVJzK0Z6QzcxRjBBQlIyWEIzNG53SmFyc2Rq?=
 =?utf-8?B?cVJxVFE4RE54U0JhM3E4MlM5ZlFFNVFSVWttUWkyL3ZWOTZhSitLMFlac1Qy?=
 =?utf-8?B?aDJpS3RKTXFpTi9POEJRODdxZjFNaEEwRk5Sa3NCRXRaUGUxaXhVZlRFczkx?=
 =?utf-8?B?MjRQTHNWUmVTMW1SNzBINE81UE1oMUhZTVozMmVvTVFPNzA5Q2kwSyttdGpp?=
 =?utf-8?B?OGFib1FhczhHRkk3UDQweitkWStMRXQ3NGdTWXBuMmIzMVpkazdSVlg5eE5H?=
 =?utf-8?B?YXFGc3dMQ1MrTXZ4TnpxYW80UUVwcHlUd0V4ci91a0hqSGFpWDBPb0x0Q2xG?=
 =?utf-8?B?RFdXNVpoRkdRaDdHTTdXS2x2akg5WXVOVFllandJQjhwQWtWRjVFRVByb3Bl?=
 =?utf-8?B?WkhtdVdDalNJeU96dEdVYW1ueHFDbWNubXNPUStrby9USUI0R252VUEzNHN1?=
 =?utf-8?B?QnAzNDFFaWxSZFBPV0o5Y0hUOGx4Q3ZZQUMyS2NhSDNTcUVFb2ZwSmFMZjk4?=
 =?utf-8?B?dUtyaktNWE05WndObmg2ZWFXT1grUFJjbXcvYW5xUUptTndyZ203SStScHpz?=
 =?utf-8?B?YWJjQ3RrcW81N1hVYkZJMFBucEpPK2FGVnpOUFpVN05VdGJoRUNjekVnWSsw?=
 =?utf-8?Q?F1Wl1eVsML9q9NsqFrp6qm0io?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 75e20bb3-a8b7-4c7d-d3a5-08dba5719c0a
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2023 13:45:57.3075 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GzWKONt1aWJ5lQg+aPIZwhCSIuhmmj3hKHUbotg4ekRHHw5OESMRnbowrdfHj0Rm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6340
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
 sarah.walker@imgtec.com, ketil.johnsen@arm.com, lina@asahilina.net,
 Liviu.Dudau@arm.com, dri-devel@lists.freedesktop.org, luben.tuikov@amd.com,
 Danilo Krummrich <dakr@redhat.com>, donald.robson@imgtec.com,
 boris.brezillon@collabora.com, intel-xe@lists.freedesktop.org,
 faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 25.08.23 um 15:36 schrieb Matthew Brost:
> On Fri, Aug 25, 2023 at 10:02:32AM +0200, Christian König wrote:
>> Am 25.08.23 um 04:58 schrieb Matthew Brost:
>>> On Fri, Aug 25, 2023 at 01:04:10AM +0200, Danilo Krummrich wrote:
>>>> On Thu, Aug 10, 2023 at 07:31:32PM -0700, Matthew Brost wrote:
>>>>> Rather than call free_job and run_job in same work item have a dedicated
>>>>> work item for each. This aligns with the design and intended use of work
>>>>> queues.
>>>>>
>>>>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>>>>> ---
>>>>>    drivers/gpu/drm/scheduler/sched_main.c | 137 ++++++++++++++++++-------
>>>>>    include/drm/gpu_scheduler.h            |   8 +-
>>>>>    2 files changed, 106 insertions(+), 39 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
>>>>> index cede47afc800..b67469eac179 100644
>>>>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>>>>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>>>>> @@ -213,11 +213,12 @@ void drm_sched_rq_remove_entity(struct drm_sched_rq *rq,
>>>>>     * drm_sched_rq_select_entity_rr - Select an entity which could provide a job to run
>>>>>     *
>>>>>     * @rq: scheduler run queue to check.
>>>>> + * @dequeue: dequeue selected entity
>>>>>     *
>>>>>     * Try to find a ready entity, returns NULL if none found.
>>>>>     */
>>>>>    static struct drm_sched_entity *
>>>>> -drm_sched_rq_select_entity_rr(struct drm_sched_rq *rq)
>>>>> +drm_sched_rq_select_entity_rr(struct drm_sched_rq *rq, bool dequeue)
>>>>>    {
>>>>>    	struct drm_sched_entity *entity;
>>>>> @@ -227,8 +228,10 @@ drm_sched_rq_select_entity_rr(struct drm_sched_rq *rq)
>>>>>    	if (entity) {
>>>>>    		list_for_each_entry_continue(entity, &rq->entities, list) {
>>>>>    			if (drm_sched_entity_is_ready(entity)) {
>>>>> -				rq->current_entity = entity;
>>>>> -				reinit_completion(&entity->entity_idle);
>>>>> +				if (dequeue) {
>>>>> +					rq->current_entity = entity;
>>>>> +					reinit_completion(&entity->entity_idle);
>>>>> +				}
>>>>>    				spin_unlock(&rq->lock);
>>>>>    				return entity;
>>>>>    			}
>>>>> @@ -238,8 +241,10 @@ drm_sched_rq_select_entity_rr(struct drm_sched_rq *rq)
>>>>>    	list_for_each_entry(entity, &rq->entities, list) {
>>>>>    		if (drm_sched_entity_is_ready(entity)) {
>>>>> -			rq->current_entity = entity;
>>>>> -			reinit_completion(&entity->entity_idle);
>>>>> +			if (dequeue) {
>>>>> +				rq->current_entity = entity;
>>>>> +				reinit_completion(&entity->entity_idle);
>>>>> +			}
>>>>>    			spin_unlock(&rq->lock);
>>>>>    			return entity;
>>>>>    		}
>>>>> @@ -257,11 +262,12 @@ drm_sched_rq_select_entity_rr(struct drm_sched_rq *rq)
>>>>>     * drm_sched_rq_select_entity_fifo - Select an entity which provides a job to run
>>>>>     *
>>>>>     * @rq: scheduler run queue to check.
>>>>> + * @dequeue: dequeue selected entity
>>>>>     *
>>>>>     * Find oldest waiting ready entity, returns NULL if none found.
>>>>>     */
>>>>>    static struct drm_sched_entity *
>>>>> -drm_sched_rq_select_entity_fifo(struct drm_sched_rq *rq)
>>>>> +drm_sched_rq_select_entity_fifo(struct drm_sched_rq *rq, bool dequeue)
>>>>>    {
>>>>>    	struct rb_node *rb;
>>>>> @@ -271,8 +277,10 @@ drm_sched_rq_select_entity_fifo(struct drm_sched_rq *rq)
>>>>>    		entity = rb_entry(rb, struct drm_sched_entity, rb_tree_node);
>>>>>    		if (drm_sched_entity_is_ready(entity)) {
>>>>> -			rq->current_entity = entity;
>>>>> -			reinit_completion(&entity->entity_idle);
>>>>> +			if (dequeue) {
>>>>> +				rq->current_entity = entity;
>>>>> +				reinit_completion(&entity->entity_idle);
>>>>> +			}
>>>>>    			break;
>>>>>    		}
>>>>>    	}
>>>>> @@ -282,13 +290,54 @@ drm_sched_rq_select_entity_fifo(struct drm_sched_rq *rq)
>>>>>    }
>>>>>    /**
>>>>> - * drm_sched_submit_queue - scheduler queue submission
>>>>> + * drm_sched_run_job_queue - queue job submission
>>>>>     * @sched: scheduler instance
>>>>>     */
>>>>> -static void drm_sched_submit_queue(struct drm_gpu_scheduler *sched)
>>>>> +static void drm_sched_run_job_queue(struct drm_gpu_scheduler *sched)
>>>>>    {
>>>>>    	if (!READ_ONCE(sched->pause_submit))
>>>>> -		queue_work(sched->submit_wq, &sched->work_submit);
>>>>> +		queue_work(sched->submit_wq, &sched->work_run_job);
>>>>> +}
>>>>> +
>>>>> +static struct drm_sched_entity *
>>>>> +drm_sched_select_entity(struct drm_gpu_scheduler *sched, bool dequeue);
>>>>> +
>>>>> +/**
>>>>> + * drm_sched_run_job_queue_if_ready - queue job submission if ready
>>>>> + * @sched: scheduler instance
>>>>> + */
>>>>> +static void drm_sched_run_job_queue_if_ready(struct drm_gpu_scheduler *sched)
>>>>> +{
>>>>> +	if (drm_sched_select_entity(sched, false))
>>>>> +		drm_sched_run_job_queue(sched);
>>>>> +}
>>>>> +
>>>>> +/**
>>>>> + * drm_sched_free_job_queue - queue free job
>>>>> + *
>>>>> + * @sched: scheduler instance to queue free job
>>>>> + */
>>>>> +static void drm_sched_free_job_queue(struct drm_gpu_scheduler *sched)
>>>>> +{
>>>>> +	if (!READ_ONCE(sched->pause_submit))
>>>>> +		queue_work(sched->submit_wq, &sched->work_free_job);
>>>>> +}
>>>>> +
>>>>> +/**
>>>>> + * drm_sched_free_job_queue_if_ready - queue free job if ready
>>>>> + *
>>>>> + * @sched: scheduler instance to queue free job
>>>>> + */
>>>>> +static void drm_sched_free_job_queue_if_ready(struct drm_gpu_scheduler *sched)
>>>>> +{
>>>>> +	struct drm_sched_job *job;
>>>>> +
>>>>> +	spin_lock(&sched->job_list_lock);
>>>>> +	job = list_first_entry_or_null(&sched->pending_list,
>>>>> +				       struct drm_sched_job, list);
>>>>> +	if (job && dma_fence_is_signaled(&job->s_fence->finished))
>>>>> +		drm_sched_free_job_queue(sched);
>>>>> +	spin_unlock(&sched->job_list_lock);
>>>>>    }
>>>>>    /**
>>>>> @@ -310,7 +359,7 @@ static void drm_sched_job_done(struct drm_sched_job *s_job, int result)
>>>>>    	dma_fence_get(&s_fence->finished);
>>>>>    	drm_sched_fence_finished(s_fence, result);
>>>>>    	dma_fence_put(&s_fence->finished);
>>>>> -	drm_sched_submit_queue(sched);
>>>>> +	drm_sched_free_job_queue(sched);
>>>>>    }
>>>>>    /**
>>>>> @@ -906,18 +955,19 @@ static bool drm_sched_can_queue(struct drm_gpu_scheduler *sched)
>>>>>    void drm_sched_wakeup_if_can_queue(struct drm_gpu_scheduler *sched)
>>>>>    {
>>>>>    	if (drm_sched_can_queue(sched))
>>>>> -		drm_sched_submit_queue(sched);
>>>>> +		drm_sched_run_job_queue(sched);
>>>>>    }
>>>>>    /**
>>>>>     * drm_sched_select_entity - Select next entity to process
>>>>>     *
>>>>>     * @sched: scheduler instance
>>>>> + * @dequeue: dequeue selected entity
>>>>>     *
>>>>>     * Returns the entity to process or NULL if none are found.
>>>>>     */
>>>>>    static struct drm_sched_entity *
>>>>> -drm_sched_select_entity(struct drm_gpu_scheduler *sched)
>>>>> +drm_sched_select_entity(struct drm_gpu_scheduler *sched, bool dequeue)
>>>>>    {
>>>>>    	struct drm_sched_entity *entity;
>>>>>    	int i;
>>>>> @@ -935,8 +985,10 @@ drm_sched_select_entity(struct drm_gpu_scheduler *sched)
>>>>>    	/* Kernel run queue has higher priority than normal run queue*/
>>>>>    	for (i = DRM_SCHED_PRIORITY_COUNT - 1; i >= DRM_SCHED_PRIORITY_MIN; i--) {
>>>>>    		entity = sched->sched_policy == DRM_SCHED_POLICY_FIFO ?
>>>>> -			drm_sched_rq_select_entity_fifo(&sched->sched_rq[i]) :
>>>>> -			drm_sched_rq_select_entity_rr(&sched->sched_rq[i]);
>>>>> +			drm_sched_rq_select_entity_fifo(&sched->sched_rq[i],
>>>>> +							dequeue) :
>>>>> +			drm_sched_rq_select_entity_rr(&sched->sched_rq[i],
>>>>> +						      dequeue);
>>>>>    		if (entity)
>>>>>    			break;
>>>>>    	}
>>>>> @@ -1024,30 +1076,44 @@ drm_sched_pick_best(struct drm_gpu_scheduler **sched_list,
>>>>>    EXPORT_SYMBOL(drm_sched_pick_best);
>>>>>    /**
>>>>> - * drm_sched_main - main scheduler thread
>>>>> + * drm_sched_free_job_work - worker to call free_job
>>>>>     *
>>>>> - * @param: scheduler instance
>>>>> + * @w: free job work
>>>>>     */
>>>>> -static void drm_sched_main(struct work_struct *w)
>>>>> +static void drm_sched_free_job_work(struct work_struct *w)
>>>>>    {
>>>>>    	struct drm_gpu_scheduler *sched =
>>>>> -		container_of(w, struct drm_gpu_scheduler, work_submit);
>>>>> -	struct drm_sched_entity *entity;
>>>>> +		container_of(w, struct drm_gpu_scheduler, work_free_job);
>>>>>    	struct drm_sched_job *cleanup_job;
>>>>> -	int r;
>>>>>    	if (READ_ONCE(sched->pause_submit))
>>>>>    		return;
>>>>>    	cleanup_job = drm_sched_get_cleanup_job(sched);
>>>> I tried this patch with Nouveau and found a race condition:
>>>>
>>>> In drm_sched_run_job_work() the job is added to the pending_list via
>>>> drm_sched_job_begin(), then the run_job() callback is called and the scheduled
>>>> fence is signaled.
>>>>
>>>> However, in parallel drm_sched_get_cleanup_job() might be called from
>>>> drm_sched_free_job_work(), which picks the first job from the pending_list and
>>>> for the next job on the pending_list sets the scheduled fence' timestamp field.
>> Well why can this happen in parallel? Either the work items are scheduled to
>> a single threaded work queue or you have protected the pending list with
>> some locks.
>>
> Xe uses a single-threaded work queue, Nouveau does not (desired
> behavior).
>
> The list of pending jobs is protected by a lock (safe), the race is:
>
> add job to pending list
> run_job
> signal scheduled fence
>
> dequeue from pending list
> free_job
> update timestamp
>
> Once a job is on the pending list its timestamp can be accessed which
> can blow up if scheduled fence isn't signaled or more specifically unless
> DMA_FENCE_FLAG_TIMESTAMP_BIT is set.

Ah, that problem again. No that is actually quite harmless.

You just need to double check if the DMA_FENCE_FLAG_TIMESTAMP_BIT is 
already set and if it's not set don't do anything.

Regards,
Christian.


>   Logically it makes sense for the
> job to be in the pending list before run_job and signal the scheduled
> fence after run_job so I think we need to live with this race.
>
>> Just moving the free_job into a separate work item without such precautions
>> won't work because of quite a bunch of other reasons as well.
>>
> Yes, free_job might not be safe to run in parallel with run_job
> depending on the driver vfuncs. Mention this in the cover letter.
>
> Certainly this should be safe in the scheduler code though and I think
> it will be after fixing this.
>
> Matt
>
>>>> The job can be on the pending_list, but the scheduled fence might not yet be
>>>> signaled. The call to actually signal the fence will subsequently fault because
>>>> it will try to dereference the timestamp.
>>>>
>>>> I'm not sure what's the best way to fix this, maybe it's enough to re-order
>>>> signalling the scheduled fence and adding the job to the pending_list. Not sure
>>>> if this has other implications though.
>>>>
>>> We really want the job on the pending list before calling run_job.
>>>
>>> I'm thinking we just delete the updating of the timestamp, not sure why
>>> this is useful.
>> This is used for calculating how long each job has spend on the hw, so big
>> NAK to deleting this.
>>
> Ah, I see that AMDGPU uses this. Previously just checked the scheduler
> code.
>
> The below patch should work just fine then.
>
> Matt
>
>> Regards,
>> Christian.
>>
>>> Or we could do something like this where we try to update the timestamp,
>>> if we can't update the timestamp run_job worker will do it anyways.
>>>
>>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
>>> index 67e0fb6e7d18..54bd3e88f139 100644
>>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>>> @@ -1074,8 +1074,10 @@ drm_sched_get_cleanup_job(struct drm_gpu_scheduler *sched)
>>>                                                   typeof(*next), list);
>>>
>>>                   if (next) {
>>> -                       next->s_fence->scheduled.timestamp =
>>> -                               job->s_fence->finished.timestamp;
>>> +                       if (test_bit(DMA_FENCE_FLAG_TIMESTAMP_BIT,
>>> +                                    &next->s_fence->scheduled.flags))
>>> +                               next->s_fence->scheduled.timestamp =
>>> +                                       job->s_fence->finished.timestamp;
>>>                           /* start TO timer for next job */
>>>                           drm_sched_start_timeout(sched);
>>>                   }
>>>
>>> I guess I'm leaning towards the latter option.
>>>
>>> Matt
>>>
>>>> - Danilo
>>>>
>>>>> -	entity = drm_sched_select_entity(sched);
>>>>> +	if (cleanup_job) {
>>>>> +		sched->ops->free_job(cleanup_job);
>>>>> +
>>>>> +		drm_sched_free_job_queue_if_ready(sched);
>>>>> +		drm_sched_run_job_queue_if_ready(sched);
>>>>> +	}
>>>>> +}
>>>>> -	if (!entity && !cleanup_job)
>>>>> -		return;	/* No more work */
>>>>> +/**
>>>>> + * drm_sched_run_job_work - worker to call run_job
>>>>> + *
>>>>> + * @w: run job work
>>>>> + */
>>>>> +static void drm_sched_run_job_work(struct work_struct *w)
>>>>> +{
>>>>> +	struct drm_gpu_scheduler *sched =
>>>>> +		container_of(w, struct drm_gpu_scheduler, work_run_job);
>>>>> +	struct drm_sched_entity *entity;
>>>>> +	int r;
>>>>> -	if (cleanup_job)
>>>>> -		sched->ops->free_job(cleanup_job);
>>>>> +	if (READ_ONCE(sched->pause_submit))
>>>>> +		return;
>>>>> +	entity = drm_sched_select_entity(sched, true);
>>>>>    	if (entity) {
>>>>>    		struct dma_fence *fence;
>>>>>    		struct drm_sched_fence *s_fence;
>>>>> @@ -1056,9 +1122,7 @@ static void drm_sched_main(struct work_struct *w)
>>>>>    		sched_job = drm_sched_entity_pop_job(entity);
>>>>>    		if (!sched_job) {
>>>>>    			complete_all(&entity->entity_idle);
>>>>> -			if (!cleanup_job)
>>>>> -				return;	/* No more work */
>>>>> -			goto again;
>>>>> +			return;	/* No more work */
>>>>>    		}
>>>>>    		s_fence = sched_job->s_fence;
>>>>> @@ -1088,10 +1152,8 @@ static void drm_sched_main(struct work_struct *w)
>>>>>    		}
>>>>>    		wake_up(&sched->job_scheduled);
>>>>> +		drm_sched_run_job_queue_if_ready(sched);
>>>>>    	}
>>>>> -
>>>>> -again:
>>>>> -	drm_sched_submit_queue(sched);
>>>>>    }
>>>>>    /**
>>>>> @@ -1150,7 +1212,8 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
>>>>>    	spin_lock_init(&sched->job_list_lock);
>>>>>    	atomic_set(&sched->hw_rq_count, 0);
>>>>>    	INIT_DELAYED_WORK(&sched->work_tdr, drm_sched_job_timedout);
>>>>> -	INIT_WORK(&sched->work_submit, drm_sched_main);
>>>>> +	INIT_WORK(&sched->work_run_job, drm_sched_run_job_work);
>>>>> +	INIT_WORK(&sched->work_free_job, drm_sched_free_job_work);
>>>>>    	atomic_set(&sched->_score, 0);
>>>>>    	atomic64_set(&sched->job_id_count, 0);
>>>>>    	sched->pause_submit = false;
>>>>> @@ -1275,7 +1338,8 @@ EXPORT_SYMBOL(drm_sched_submit_ready);
>>>>>    void drm_sched_submit_stop(struct drm_gpu_scheduler *sched)
>>>>>    {
>>>>>    	WRITE_ONCE(sched->pause_submit, true);
>>>>> -	cancel_work_sync(&sched->work_submit);
>>>>> +	cancel_work_sync(&sched->work_run_job);
>>>>> +	cancel_work_sync(&sched->work_free_job);
>>>>>    }
>>>>>    EXPORT_SYMBOL(drm_sched_submit_stop);
>>>>> @@ -1287,6 +1351,7 @@ EXPORT_SYMBOL(drm_sched_submit_stop);
>>>>>    void drm_sched_submit_start(struct drm_gpu_scheduler *sched)
>>>>>    {
>>>>>    	WRITE_ONCE(sched->pause_submit, false);
>>>>> -	queue_work(sched->submit_wq, &sched->work_submit);
>>>>> +	queue_work(sched->submit_wq, &sched->work_run_job);
>>>>> +	queue_work(sched->submit_wq, &sched->work_free_job);
>>>>>    }
>>>>>    EXPORT_SYMBOL(drm_sched_submit_start);
>>>>> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
>>>>> index 04eec2d7635f..fbc083a92757 100644
>>>>> --- a/include/drm/gpu_scheduler.h
>>>>> +++ b/include/drm/gpu_scheduler.h
>>>>> @@ -487,9 +487,10 @@ struct drm_sched_backend_ops {
>>>>>     *                 finished.
>>>>>     * @hw_rq_count: the number of jobs currently in the hardware queue.
>>>>>     * @job_id_count: used to assign unique id to the each job.
>>>>> - * @submit_wq: workqueue used to queue @work_submit
>>>>> + * @submit_wq: workqueue used to queue @work_run_job and @work_free_job
>>>>>     * @timeout_wq: workqueue used to queue @work_tdr
>>>>> - * @work_submit: schedules jobs and cleans up entities
>>>>> + * @work_run_job: schedules jobs
>>>>> + * @work_free_job: cleans up jobs
>>>>>     * @work_tdr: schedules a delayed call to @drm_sched_job_timedout after the
>>>>>     *            timeout interval is over.
>>>>>     * @pending_list: the list of jobs which are currently in the job queue.
>>>>> @@ -518,7 +519,8 @@ struct drm_gpu_scheduler {
>>>>>    	atomic64_t			job_id_count;
>>>>>    	struct workqueue_struct		*submit_wq;
>>>>>    	struct workqueue_struct		*timeout_wq;
>>>>> -	struct work_struct		work_submit;
>>>>> +	struct work_struct		work_run_job;
>>>>> +	struct work_struct		work_free_job;
>>>>>    	struct delayed_work		work_tdr;
>>>>>    	struct list_head		pending_list;
>>>>>    	spinlock_t			job_list_lock;
>>>>> -- 
>>>>> 2.34.1
>>>>>

