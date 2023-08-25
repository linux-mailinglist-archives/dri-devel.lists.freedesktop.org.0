Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68473788169
	for <lists+dri-devel@lfdr.de>; Fri, 25 Aug 2023 10:02:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A2B810E629;
	Fri, 25 Aug 2023 08:02:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20631.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eab::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A71E610E628;
 Fri, 25 Aug 2023 08:02:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AgvZ7/xFTpqQfLfRsr1DRMq+lY/bVPKfawqZBwGGH2NUP/U5Wbb4G2T9ZHU3Zrw+yxj8I0exLmCL/ow/lRKjX+RmeYXn34zaCwgrd4qt/phYTTVrFjWU7+nNCiwWoXACu8l9SOkPTgEaeav2k5dyR/R+RkflLLH6sadRiZthmJeO97hnv0oJnBiNN9ZsX8zpKpYUaW21HW6Tpa/DJx/ooIUwGVRv2ajgGALwRYpbusKGejgB1WfYCgc2Dp1I0CvJ/tsjpj4zX2IkKxyaWcFyX/X1CzEEB+jrkdfDGFEgS9bTMN/zyXbSLUOEBI3uW+Gb3L1jREY6KHueQuJUClnYqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u/jz1Meb/CMDARv2ew897t298hMZ0VDZ8HLOv+IAUCI=;
 b=eUaOXsdp1vla60AjGok7hhguIcMJ4dZCgDQnw95y9mZpx5z/aTHzJqH9MBgyJ2NsgbOZEbR5+9yDsmYOZASY9ewJl4Jfl1Hpbb7/Bdwag5u1SFvJWcc0dGOFIhqM6+DIIzgmey6jF2zENIsKN1FlwfG66GBsdyIi0Zi6XRCy+p4VlRJvWjWXCrDJ7WOGSbTU7yL+e+/9pFXH+BoI1sKzuo7n1hGMsqnyyQSzskzwLUsg6f/359lIpGeGrrzXN7ngRmBoJG34vvEzfnkhu9UVivBBluw5BY4ySwItVRPpvp/b1IKSCmuTBS4VtqhDIWH/q8FpyC5Bhpnc5kc8RhvARA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u/jz1Meb/CMDARv2ew897t298hMZ0VDZ8HLOv+IAUCI=;
 b=3lxwIYkbcC0EtYOnwotxNMQ7FiRV0FKpvTvbJxLtMtTopL0mmGoJtSajVbm+qHxzxZBRRy9sWPhvaTLBRvZodbWqcFk3UrwvX6tidht6Knbb7TWVOP88zjU6rL1y0dJ2fx7ODBHEib0yprx2xIMvz3jqa0eFyF3NuWBayP7k2ho=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by CH0PR12MB5217.namprd12.prod.outlook.com (2603:10b6:610:d0::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.27; Fri, 25 Aug
 2023 08:02:38 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::3d:c14:667a:1c81]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::3d:c14:667a:1c81%4]) with mapi id 15.20.6699.028; Fri, 25 Aug 2023
 08:02:38 +0000
Message-ID: <6ae84066-b690-1562-0598-4694b022c960@amd.com>
Date: Fri, 25 Aug 2023 10:02:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 4/9] drm/sched: Split free_job into own work item
Content-Language: en-US
To: Matthew Brost <matthew.brost@intel.com>, Danilo Krummrich <dakr@redhat.com>
References: <20230811023137.659037-1-matthew.brost@intel.com>
 <20230811023137.659037-5-matthew.brost@intel.com> <ZOfh6o2EaGuIqZVe@pollux>
 <ZOgYu1fZQUHeneJC@DUT025-TGLU.fm.intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <ZOgYu1fZQUHeneJC@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0163.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b3::17) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|CH0PR12MB5217:EE_
X-MS-Office365-Filtering-Correlation-Id: 703cf9b1-8c83-4258-046f-08dba541a607
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: V1+xQTs+lHbrCqWQtL73oIMP4PjvXVfFGaVmBVSTaW8J2HLMm8Y13wmDcoOdTsWv6x6r/h6BHrD1Gjd7L48B+tNzUZFOhUwY/ZaYWRLACpfQTYB/lFj6uzIXGm7oBnoaH6wMVQqkJATV/ZFSnygUvp0NjMOE18fWc9Ohd6SospvJ/inSTrrBeDQOo6TJoF15vXO/w1kqj+GIEGDfYvfUHfpuPHsLhx9UJyx+LZd7AjMjI7M7ojZutjDfIVbfvv3mUApeNZXJS1qsU5js02NzTxkngpm6e+9dvVJuaX3bPA9EOS35GikQKW3AB3PJDRZKnpg04/cG4+wQ4+b3G+F5muskpHZMaPpm5lFvNBFVvzWa8jpX3N1CkA+02KdG4OOBAF4ee+zeEkzk3od0lnmAOpCOC9BaZjEF3FWSd7NSu/qO3FQGMzPx8d9XECGrAZDsmMRKr5W20Yjpoi8tLXRs6ePGsK1FvV9Bz7ytGiCw5ctpJCMY9o0VnS3iWII/UFbtmn+FYtOr/VXUKeCQsTdMW14xAil9pO1+w7mIk/jl4F1phfI19Z5QtygO412Bnof6ivWwHoTAhtSRc9MvYLZ44LAqJPvrtgNaCDByoQNxDYwwKrtPcgNEZApdJ3QzWk/mmjsDNlXlwcq3+VAh7GqXlw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(346002)(39860400002)(396003)(136003)(366004)(1800799009)(186009)(451199024)(2616005)(5660300002)(8936002)(4326008)(8676002)(36756003)(30864003)(83380400001)(7416002)(26005)(38100700002)(6666004)(66556008)(66476007)(66946007)(6506007)(316002)(110136005)(478600001)(31686004)(41300700001)(2906002)(6512007)(86362001)(6486002)(31696002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R2pVLzFDQkNFRFJReGFYb3FNbThUUFJNbTN0Y3MzM1ZOVDBNQ3dnempHK01h?=
 =?utf-8?B?SytCTThMc3RNdFFheGllSWR6M3BPbmhjOTNoNm9pa2NzUjZDRTkxWnBaRld6?=
 =?utf-8?B?ZDA0bkFHNzlWYkIyTk1BdWYzcS9qVkI5N3pkaDlDZjNDeGEyblEwU1dZZGtS?=
 =?utf-8?B?clFPWFFrZUoyQk51ME9raEFMZjNxRDBaM21YV2szU3ArelBiM1JaajhZYVp0?=
 =?utf-8?B?VVdQQmJvNzVGRXpxc0U5VHRJa1M1ZVUyYkIrV09KZk1OSDJMRnVvWjVOcnJN?=
 =?utf-8?B?NTUybU5GM1RDQ3A0U0o5b3F5ZXlvWlVLTzEwTGY5QjM2a2hWTVkrZC9Rajht?=
 =?utf-8?B?dmJjMnpLVzd6ckZIdUVSUkdRU3I0V3NjQlV5a3N0Q0p0Y0VmZFFzcG44cUd2?=
 =?utf-8?B?WVpDaXl3UUY1YTk0cU9KbjF6V0VFc1lKTEZKbmovODNtdjdWQnFNNG9rL0Mx?=
 =?utf-8?B?L0lQTVlLVUo5bStQYkxUMEtzdDJFalYwbUdrYmNsR2lXcFArUmlIMzJOVC9t?=
 =?utf-8?B?bW50TXhVUVREclFpbXZpa0E3WHhzbDJoVHNycG9WMkk5NmpYMTQ3VzN1dHFa?=
 =?utf-8?B?OElORWlrNE9XR2IyYXZaQ2JnLy83Y293cUREQzdIalFNZkdKU3FPTFNEcS9I?=
 =?utf-8?B?V1ExUmZLTXhWQS9HUTVVYzhDamJhUGNCZHNFTFJ2Vm1SMHdobWhZWnpLb296?=
 =?utf-8?B?dzBOa3BUWWxHU3JTRnB0Y2ZIcXdsM1h3RVk0Z3pCT1FBTGNhbzg2WWYzZjJM?=
 =?utf-8?B?M1BOOHZ2TDJZZjJMSzJHcnFGQXkyTXBqWFVlMENYblZ0cUIwaE5JUDI0Nnlp?=
 =?utf-8?B?KzVaYTRKeDhncThBMGhIRnYwQ05adXQ5VzdyaCtubjhWUEFHU1pWaW5CRDl3?=
 =?utf-8?B?R3hncmhiZ2dMWTZyTzY2K2NjaTcxc0ovdzk2dHBGVDhGQlR6RUVRZ1ZBVWUy?=
 =?utf-8?B?STV1QXFra3prWFFyb1c1NUN6Z3RJMVhKZVFyM3lWWkZsNDF0am11dzRsY1o4?=
 =?utf-8?B?NFBINURXT211UHphTmp1TkFiZmVBNGN4SnhGekQ3d28vemJwRnFzaHlSQnJU?=
 =?utf-8?B?L1hOYzArUVZpSWpXMTFlbDZ6M0dHdVk5WEpFb1dJR2xTdWRXcStBMlozUWZV?=
 =?utf-8?B?SStKVjN1QjBORm9QUVhxcURINTFsditCNnJCMElaNzJJTnVvaEw3UGFQay9P?=
 =?utf-8?B?bHZWU2dSRzg2ekx1TnczcDBZYmtDUWgwQlEvd0xHYUhOZmtCdXBTcDR0Y0dB?=
 =?utf-8?B?WXVSZ1BOQmtiUklhNFh0TnZ2dVZRZk10QWlscm5DSDkrTTYvZ3RPWmMrUnVk?=
 =?utf-8?B?ZGMrN3E5T2owMlVEbW9vNTFEVFlySjFZeDlZNWMrN1FOeXJuTGZVK1hlZCsr?=
 =?utf-8?B?ampkUjZXNk9VTDBuaTQrY0dXQ3U2NUoyamFXVFZwUXBQKzE1RGo5Vy9tL2xZ?=
 =?utf-8?B?OTNya3Y5UGJQZi9MNnBreDBoUUpjUDN0RloraCtGQ0Fkd1ZCRjQ3YmUxcmpi?=
 =?utf-8?B?VTEreHZFR1RjWkVUMXhDZWxiQ3draFhLR0IyYU82djN1TnJlMGRVbXUzeGtt?=
 =?utf-8?B?UlU1dGdnRi9mQ293NHBQOUhxZHRhQ0thc2dWMm9YQ3NveXU3cFdTZXB1SDV0?=
 =?utf-8?B?RXZzaFpwdHp3ajJlS3lRemFWcm9BSUU0MVU3bVU4WFNCSC9QWUxNMk8vM29u?=
 =?utf-8?B?SDZQUm1oQVBNdm1vSnhhWG5SYUNJRVFlS0RQNzNkenVQSUpMTjBhU1ZlamxE?=
 =?utf-8?B?d2N4TzUrb3pVaW9NWWc2NGhNaXo3NDM1MDUvQWdrckdJU2hxdVYzVXlDWFFm?=
 =?utf-8?B?ZllKL1NiRDk2NGtGMkYzNGQ1WnJmWWJrdk4yOGl5MVVKVlNpdTJPVS82VVM4?=
 =?utf-8?B?NzhFSVRtRkh5S1A0SlE4dVZWSm95d0NZS3BYQWlxdkZrbUpVNjJiV2VDelg4?=
 =?utf-8?B?L3FkcUhGLyt1Vkh1a0hkaDY4VEI0NFlFZ1VBOW1LNTZQc3dVdGdBbElkcVN5?=
 =?utf-8?B?WWkvcGpEdTBGc3J0NGFHS3dSN1N4eVk4eXE2azR6QW50OEozU0FFdHdJUk5F?=
 =?utf-8?B?STNFT2VlM2gwT0wxcm90dXpsaWZBcjJwSXU0WlNLQVpIcTExSXBENXhRVk5R?=
 =?utf-8?Q?gCGkp56CE0vc0N7mr74tEImXB?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 703cf9b1-8c83-4258-046f-08dba541a607
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2023 08:02:38.1975 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7/+E6KDHY78WBjenRA+wAY3ozBE1gViaWEwP/RsuSYMI+KWjXzAl76rOvM99Mru9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5217
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
 donald.robson@imgtec.com, boris.brezillon@collabora.com,
 intel-xe@lists.freedesktop.org, faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 25.08.23 um 04:58 schrieb Matthew Brost:
> On Fri, Aug 25, 2023 at 01:04:10AM +0200, Danilo Krummrich wrote:
>> On Thu, Aug 10, 2023 at 07:31:32PM -0700, Matthew Brost wrote:
>>> Rather than call free_job and run_job in same work item have a dedicated
>>> work item for each. This aligns with the design and intended use of work
>>> queues.
>>>
>>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>>> ---
>>>   drivers/gpu/drm/scheduler/sched_main.c | 137 ++++++++++++++++++-------
>>>   include/drm/gpu_scheduler.h            |   8 +-
>>>   2 files changed, 106 insertions(+), 39 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
>>> index cede47afc800..b67469eac179 100644
>>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>>> @@ -213,11 +213,12 @@ void drm_sched_rq_remove_entity(struct drm_sched_rq *rq,
>>>    * drm_sched_rq_select_entity_rr - Select an entity which could provide a job to run
>>>    *
>>>    * @rq: scheduler run queue to check.
>>> + * @dequeue: dequeue selected entity
>>>    *
>>>    * Try to find a ready entity, returns NULL if none found.
>>>    */
>>>   static struct drm_sched_entity *
>>> -drm_sched_rq_select_entity_rr(struct drm_sched_rq *rq)
>>> +drm_sched_rq_select_entity_rr(struct drm_sched_rq *rq, bool dequeue)
>>>   {
>>>   	struct drm_sched_entity *entity;
>>>   
>>> @@ -227,8 +228,10 @@ drm_sched_rq_select_entity_rr(struct drm_sched_rq *rq)
>>>   	if (entity) {
>>>   		list_for_each_entry_continue(entity, &rq->entities, list) {
>>>   			if (drm_sched_entity_is_ready(entity)) {
>>> -				rq->current_entity = entity;
>>> -				reinit_completion(&entity->entity_idle);
>>> +				if (dequeue) {
>>> +					rq->current_entity = entity;
>>> +					reinit_completion(&entity->entity_idle);
>>> +				}
>>>   				spin_unlock(&rq->lock);
>>>   				return entity;
>>>   			}
>>> @@ -238,8 +241,10 @@ drm_sched_rq_select_entity_rr(struct drm_sched_rq *rq)
>>>   	list_for_each_entry(entity, &rq->entities, list) {
>>>   
>>>   		if (drm_sched_entity_is_ready(entity)) {
>>> -			rq->current_entity = entity;
>>> -			reinit_completion(&entity->entity_idle);
>>> +			if (dequeue) {
>>> +				rq->current_entity = entity;
>>> +				reinit_completion(&entity->entity_idle);
>>> +			}
>>>   			spin_unlock(&rq->lock);
>>>   			return entity;
>>>   		}
>>> @@ -257,11 +262,12 @@ drm_sched_rq_select_entity_rr(struct drm_sched_rq *rq)
>>>    * drm_sched_rq_select_entity_fifo - Select an entity which provides a job to run
>>>    *
>>>    * @rq: scheduler run queue to check.
>>> + * @dequeue: dequeue selected entity
>>>    *
>>>    * Find oldest waiting ready entity, returns NULL if none found.
>>>    */
>>>   static struct drm_sched_entity *
>>> -drm_sched_rq_select_entity_fifo(struct drm_sched_rq *rq)
>>> +drm_sched_rq_select_entity_fifo(struct drm_sched_rq *rq, bool dequeue)
>>>   {
>>>   	struct rb_node *rb;
>>>   
>>> @@ -271,8 +277,10 @@ drm_sched_rq_select_entity_fifo(struct drm_sched_rq *rq)
>>>   
>>>   		entity = rb_entry(rb, struct drm_sched_entity, rb_tree_node);
>>>   		if (drm_sched_entity_is_ready(entity)) {
>>> -			rq->current_entity = entity;
>>> -			reinit_completion(&entity->entity_idle);
>>> +			if (dequeue) {
>>> +				rq->current_entity = entity;
>>> +				reinit_completion(&entity->entity_idle);
>>> +			}
>>>   			break;
>>>   		}
>>>   	}
>>> @@ -282,13 +290,54 @@ drm_sched_rq_select_entity_fifo(struct drm_sched_rq *rq)
>>>   }
>>>   
>>>   /**
>>> - * drm_sched_submit_queue - scheduler queue submission
>>> + * drm_sched_run_job_queue - queue job submission
>>>    * @sched: scheduler instance
>>>    */
>>> -static void drm_sched_submit_queue(struct drm_gpu_scheduler *sched)
>>> +static void drm_sched_run_job_queue(struct drm_gpu_scheduler *sched)
>>>   {
>>>   	if (!READ_ONCE(sched->pause_submit))
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
>>>   }
>>>   
>>>   /**
>>> @@ -310,7 +359,7 @@ static void drm_sched_job_done(struct drm_sched_job *s_job, int result)
>>>   	dma_fence_get(&s_fence->finished);
>>>   	drm_sched_fence_finished(s_fence, result);
>>>   	dma_fence_put(&s_fence->finished);
>>> -	drm_sched_submit_queue(sched);
>>> +	drm_sched_free_job_queue(sched);
>>>   }
>>>   
>>>   /**
>>> @@ -906,18 +955,19 @@ static bool drm_sched_can_queue(struct drm_gpu_scheduler *sched)
>>>   void drm_sched_wakeup_if_can_queue(struct drm_gpu_scheduler *sched)
>>>   {
>>>   	if (drm_sched_can_queue(sched))
>>> -		drm_sched_submit_queue(sched);
>>> +		drm_sched_run_job_queue(sched);
>>>   }
>>>   
>>>   /**
>>>    * drm_sched_select_entity - Select next entity to process
>>>    *
>>>    * @sched: scheduler instance
>>> + * @dequeue: dequeue selected entity
>>>    *
>>>    * Returns the entity to process or NULL if none are found.
>>>    */
>>>   static struct drm_sched_entity *
>>> -drm_sched_select_entity(struct drm_gpu_scheduler *sched)
>>> +drm_sched_select_entity(struct drm_gpu_scheduler *sched, bool dequeue)
>>>   {
>>>   	struct drm_sched_entity *entity;
>>>   	int i;
>>> @@ -935,8 +985,10 @@ drm_sched_select_entity(struct drm_gpu_scheduler *sched)
>>>   	/* Kernel run queue has higher priority than normal run queue*/
>>>   	for (i = DRM_SCHED_PRIORITY_COUNT - 1; i >= DRM_SCHED_PRIORITY_MIN; i--) {
>>>   		entity = sched->sched_policy == DRM_SCHED_POLICY_FIFO ?
>>> -			drm_sched_rq_select_entity_fifo(&sched->sched_rq[i]) :
>>> -			drm_sched_rq_select_entity_rr(&sched->sched_rq[i]);
>>> +			drm_sched_rq_select_entity_fifo(&sched->sched_rq[i],
>>> +							dequeue) :
>>> +			drm_sched_rq_select_entity_rr(&sched->sched_rq[i],
>>> +						      dequeue);
>>>   		if (entity)
>>>   			break;
>>>   	}
>>> @@ -1024,30 +1076,44 @@ drm_sched_pick_best(struct drm_gpu_scheduler **sched_list,
>>>   EXPORT_SYMBOL(drm_sched_pick_best);
>>>   
>>>   /**
>>> - * drm_sched_main - main scheduler thread
>>> + * drm_sched_free_job_work - worker to call free_job
>>>    *
>>> - * @param: scheduler instance
>>> + * @w: free job work
>>>    */
>>> -static void drm_sched_main(struct work_struct *w)
>>> +static void drm_sched_free_job_work(struct work_struct *w)
>>>   {
>>>   	struct drm_gpu_scheduler *sched =
>>> -		container_of(w, struct drm_gpu_scheduler, work_submit);
>>> -	struct drm_sched_entity *entity;
>>> +		container_of(w, struct drm_gpu_scheduler, work_free_job);
>>>   	struct drm_sched_job *cleanup_job;
>>> -	int r;
>>>   
>>>   	if (READ_ONCE(sched->pause_submit))
>>>   		return;
>>>   
>>>   	cleanup_job = drm_sched_get_cleanup_job(sched);
>> I tried this patch with Nouveau and found a race condition:
>>
>> In drm_sched_run_job_work() the job is added to the pending_list via
>> drm_sched_job_begin(), then the run_job() callback is called and the scheduled
>> fence is signaled.
>>
>> However, in parallel drm_sched_get_cleanup_job() might be called from
>> drm_sched_free_job_work(), which picks the first job from the pending_list and
>> for the next job on the pending_list sets the scheduled fence' timestamp field.

Well why can this happen in parallel? Either the work items are 
scheduled to a single threaded work queue or you have protected the 
pending list with some locks.

Just moving the free_job into a separate work item without such 
precautions won't work because of quite a bunch of other reasons as well.

>>
>> The job can be on the pending_list, but the scheduled fence might not yet be
>> signaled. The call to actually signal the fence will subsequently fault because
>> it will try to dereference the timestamp.
>>
>> I'm not sure what's the best way to fix this, maybe it's enough to re-order
>> signalling the scheduled fence and adding the job to the pending_list. Not sure
>> if this has other implications though.
>>
> We really want the job on the pending list before calling run_job.
>
> I'm thinking we just delete the updating of the timestamp, not sure why
> this is useful.

This is used for calculating how long each job has spend on the hw, so 
big NAK to deleting this.

Regards,
Christian.

>
> Or we could do something like this where we try to update the timestamp,
> if we can't update the timestamp run_job worker will do it anyways.
>
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> index 67e0fb6e7d18..54bd3e88f139 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -1074,8 +1074,10 @@ drm_sched_get_cleanup_job(struct drm_gpu_scheduler *sched)
>                                                  typeof(*next), list);
>
>                  if (next) {
> -                       next->s_fence->scheduled.timestamp =
> -                               job->s_fence->finished.timestamp;
> +                       if (test_bit(DMA_FENCE_FLAG_TIMESTAMP_BIT,
> +                                    &next->s_fence->scheduled.flags))
> +                               next->s_fence->scheduled.timestamp =
> +                                       job->s_fence->finished.timestamp;
>                          /* start TO timer for next job */
>                          drm_sched_start_timeout(sched);
>                  }
>
> I guess I'm leaning towards the latter option.
>
> Matt
>
>> - Danilo
>>
>>> -	entity = drm_sched_select_entity(sched);
>>> +	if (cleanup_job) {
>>> +		sched->ops->free_job(cleanup_job);
>>> +
>>> +		drm_sched_free_job_queue_if_ready(sched);
>>> +		drm_sched_run_job_queue_if_ready(sched);
>>> +	}
>>> +}
>>>   
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
>>>   
>>> -	if (cleanup_job)
>>> -		sched->ops->free_job(cleanup_job);
>>> +	if (READ_ONCE(sched->pause_submit))
>>> +		return;
>>>   
>>> +	entity = drm_sched_select_entity(sched, true);
>>>   	if (entity) {
>>>   		struct dma_fence *fence;
>>>   		struct drm_sched_fence *s_fence;
>>> @@ -1056,9 +1122,7 @@ static void drm_sched_main(struct work_struct *w)
>>>   		sched_job = drm_sched_entity_pop_job(entity);
>>>   		if (!sched_job) {
>>>   			complete_all(&entity->entity_idle);
>>> -			if (!cleanup_job)
>>> -				return;	/* No more work */
>>> -			goto again;
>>> +			return;	/* No more work */
>>>   		}
>>>   
>>>   		s_fence = sched_job->s_fence;
>>> @@ -1088,10 +1152,8 @@ static void drm_sched_main(struct work_struct *w)
>>>   		}
>>>   
>>>   		wake_up(&sched->job_scheduled);
>>> +		drm_sched_run_job_queue_if_ready(sched);
>>>   	}
>>> -
>>> -again:
>>> -	drm_sched_submit_queue(sched);
>>>   }
>>>   
>>>   /**
>>> @@ -1150,7 +1212,8 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
>>>   	spin_lock_init(&sched->job_list_lock);
>>>   	atomic_set(&sched->hw_rq_count, 0);
>>>   	INIT_DELAYED_WORK(&sched->work_tdr, drm_sched_job_timedout);
>>> -	INIT_WORK(&sched->work_submit, drm_sched_main);
>>> +	INIT_WORK(&sched->work_run_job, drm_sched_run_job_work);
>>> +	INIT_WORK(&sched->work_free_job, drm_sched_free_job_work);
>>>   	atomic_set(&sched->_score, 0);
>>>   	atomic64_set(&sched->job_id_count, 0);
>>>   	sched->pause_submit = false;
>>> @@ -1275,7 +1338,8 @@ EXPORT_SYMBOL(drm_sched_submit_ready);
>>>   void drm_sched_submit_stop(struct drm_gpu_scheduler *sched)
>>>   {
>>>   	WRITE_ONCE(sched->pause_submit, true);
>>> -	cancel_work_sync(&sched->work_submit);
>>> +	cancel_work_sync(&sched->work_run_job);
>>> +	cancel_work_sync(&sched->work_free_job);
>>>   }
>>>   EXPORT_SYMBOL(drm_sched_submit_stop);
>>>   
>>> @@ -1287,6 +1351,7 @@ EXPORT_SYMBOL(drm_sched_submit_stop);
>>>   void drm_sched_submit_start(struct drm_gpu_scheduler *sched)
>>>   {
>>>   	WRITE_ONCE(sched->pause_submit, false);
>>> -	queue_work(sched->submit_wq, &sched->work_submit);
>>> +	queue_work(sched->submit_wq, &sched->work_run_job);
>>> +	queue_work(sched->submit_wq, &sched->work_free_job);
>>>   }
>>>   EXPORT_SYMBOL(drm_sched_submit_start);
>>> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
>>> index 04eec2d7635f..fbc083a92757 100644
>>> --- a/include/drm/gpu_scheduler.h
>>> +++ b/include/drm/gpu_scheduler.h
>>> @@ -487,9 +487,10 @@ struct drm_sched_backend_ops {
>>>    *                 finished.
>>>    * @hw_rq_count: the number of jobs currently in the hardware queue.
>>>    * @job_id_count: used to assign unique id to the each job.
>>> - * @submit_wq: workqueue used to queue @work_submit
>>> + * @submit_wq: workqueue used to queue @work_run_job and @work_free_job
>>>    * @timeout_wq: workqueue used to queue @work_tdr
>>> - * @work_submit: schedules jobs and cleans up entities
>>> + * @work_run_job: schedules jobs
>>> + * @work_free_job: cleans up jobs
>>>    * @work_tdr: schedules a delayed call to @drm_sched_job_timedout after the
>>>    *            timeout interval is over.
>>>    * @pending_list: the list of jobs which are currently in the job queue.
>>> @@ -518,7 +519,8 @@ struct drm_gpu_scheduler {
>>>   	atomic64_t			job_id_count;
>>>   	struct workqueue_struct		*submit_wq;
>>>   	struct workqueue_struct		*timeout_wq;
>>> -	struct work_struct		work_submit;
>>> +	struct work_struct		work_run_job;
>>> +	struct work_struct		work_free_job;
>>>   	struct delayed_work		work_tdr;
>>>   	struct list_head		pending_list;
>>>   	spinlock_t			job_list_lock;
>>> -- 
>>> 2.34.1
>>>

