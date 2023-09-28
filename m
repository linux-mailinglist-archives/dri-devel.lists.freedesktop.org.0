Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 457B67B21FC
	for <lists+dri-devel@lfdr.de>; Thu, 28 Sep 2023 18:14:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20BBE10E690;
	Thu, 28 Sep 2023 16:14:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2074.outbound.protection.outlook.com [40.107.93.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9495B10E68B;
 Thu, 28 Sep 2023 16:14:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A28uJ6ssHaeCDYjPKm6l28nlBq3RmIUg6cYcfszNuKArztH78Ri0F0gAfnmCoQwDzUNU+ASplTOzZ5vva3+t/iMklobMIoOa6tl+1ihjJe71s0PuOWzcjCXc3FTKY7ru+RgccGEmpxkGAY7TqC0HF9nmzf2oOYu1fM+TnkKnvAljLLiydOWlAkqRJMx9uXXkxFUaNyUEHkO0+SjFFy3F1xTFYB0AbUvbk/WGIp/9iQG/wWrGroRHr1t1oER+AUIJcBTL6g+pbmGeIFW+tlU6qusn1chqz7eFJpWV2BG4z864139CfTZZP0yBR+4Ngn0Y4u9sKSOO0e+k8Ld99VPOJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HO8dZo1rKhl0OpgTHOk4ieb4qDzJul4agYBS97cdEIM=;
 b=ehjRHZsT5Sczbq7PLlB1G301OWf2gFmGGOWC4PG+XZYsXfy6jM8Cb3Uh663kyn91ZM9T+QvS6wQVKMNKn+HO+5+RwNn8u7gpAHo3oMLBjbAm6q/hhN7Ir+M6NN7/IfGpHoYXgT3CWh1D/W/7voE/ieSVdWEXcFl5gU12khJpGA9Jc1NVEAh3TY5XOAHzCAxxxO4LckYyrgFQBlNNmczuZWBULryQ9kC7g9UnuPQ6Lr8qHVLQSYVncPvhV/Ig715qUUfqBNkU3+FGZicPIrpSherFILXwzi19sJVxHER7t7TTVdhW6bDsjHftriMuumxpR/V57Wa8eDtfQ9htFbuusA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HO8dZo1rKhl0OpgTHOk4ieb4qDzJul4agYBS97cdEIM=;
 b=I7QU5UuWq1i8pH1PIZzpeu0yzD8IwbrpoVeb+yL91CynVDFWhrev8kuX0a4i06ldLhO1/HzsjBnSSRqd8CtQ+RQYVJkWW1gQO5Ja9SJib5rr3cI40T1pS36trooDhth68zlFvu+AWJRBwgAXIzvkw/pZuzerbwjlNnoRoXDuI+c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3370.namprd12.prod.outlook.com (2603:10b6:5:38::25) by
 IA0PR12MB8907.namprd12.prod.outlook.com (2603:10b6:208:492::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Thu, 28 Sep
 2023 16:14:16 +0000
Received: from DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::8a67:3bbe:8309:4f87]) by DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::8a67:3bbe:8309:4f87%3]) with mapi id 15.20.6768.029; Thu, 28 Sep 2023
 16:14:16 +0000
Message-ID: <15751c1b-2712-4320-9b99-54e14f42b6f9@amd.com>
Date: Thu, 28 Sep 2023 12:14:12 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:115.0) Gecko/20100101
 Thunderbird/115.3.0
Subject: Re: [PATCH v4 05/10] drm/sched: Split free_job into own work item
Content-Language: en-CA, en-US
To: Matthew Brost <matthew.brost@intel.com>, dri-devel@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org
References: <20230919050155.2647172-1-matthew.brost@intel.com>
 <20230919050155.2647172-6-matthew.brost@intel.com>
From: Luben Tuikov <luben.tuikov@amd.com>
Autocrypt: addr=luben.tuikov@amd.com; keydata=
 xjMEY1i6jxYJKwYBBAHaRw8BAQdAhfD+Cc+P5t/fiF08Vw25EMLiwUuxULYRiDQAP6H50MTN
 I0x1YmVuIFR1aWtvdiA8bHViZW4udHVpa292QGFtZC5jb20+wpkEExYKAEEWIQQyyR05VSHw
 x45E/SoppxulNG8HhgUCY1i6jwIbAwUJCWYBgAULCQgHAgIiAgYVCgkICwIEFgIDAQIeBwIX
 gAAKCRAppxulNG8Hhk53AP4k4UY5xfcje0c5OF1k22pNv8tErxtVpgKKZgvfetA4xwD+OoAh
 vesLIYumBDxP0BoLiLN84udxdT15HwPFUGiDmwDOOARjWLqPEgorBgEEAZdVAQUBAQdAzSxY
 a2EtvvIwd09NckBLSTarSLNDkUthmqPnwolwiDYDAQgHwn4EGBYKACYWIQQyyR05VSHwx45E
 /SoppxulNG8HhgUCY1i6jwIbDAUJCWYBgAAKCRAppxulNG8HhnBLAP4yjSGpK6PE1mapKhrq
 8bSl9reo+F6EqdhE8X2TTHPycAEAt8EkTEstSiaOpM66gneU7r+xxzOYULo1b1XjXayGvwM=
In-Reply-To: <20230919050155.2647172-6-matthew.brost@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR0101CA0015.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c00::28) To DM6PR12MB3370.namprd12.prod.outlook.com
 (2603:10b6:5:38::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB3370:EE_|IA0PR12MB8907:EE_
X-MS-Office365-Filtering-Correlation-Id: 54f831f0-c112-4064-e9c2-08dbc03df67f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OKnkzZ8ki2tSY6nNETtiZ0OZX3+Q5nXgFuiS8pQpp8WDmgvv0hrFQ2anVInSpRcMI4nCK0KTeJHirZWLIxl3OZeD4zgfOzIGcfedgEzXq2jbDszk5ay4x6W/He8tU9bN5ARAFTc92oCHGz1kb0VjzRpLfj04z1DfTm4ZkKZ7946VOioqM4m01q9XLwGvB26x+NRKvuioITgvsHnepnPWIB0igR/SDcL5RHhA8yDBPJsN5f2Zecg2AQvvmMH8J+BTeABWi0yEzTSGB1DaY/kLN4YUkBNC1c5IT0uvnzUoHqnfKAKbQegH18T6bwysEJB/YM57T49UQGabLuXIvdbsC2Lnk+lVckQTqKALJUa4j75u4IOWVv8nhehZoykXZXIhZ1qlEF0/gfEehZIc90GulSOyn+O8s48ONF3UbDUGXSJxtO4VQcnGsptJNitOjqnOY2CyT4ne2SMLrItpKRHnzcOFg9jMYMH7DBk+D4qEhtJCMYtQdijJlkiO2KClTKvcLJIL68N/IWlb9kyhF47xPET8M/0/7SsSzD2b+WjCB6Dk9KKmALs0je80DmHx5bvnr5nlfxd3XdaZ1DgOHAV+JVhELI2wq7rr4AHm/pfRQhMG6J7IqkorugHRWjqVDd4/l0bjPB0dcLoy0yP3hY0NHQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3370.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(346002)(136003)(396003)(39860400002)(376002)(230922051799003)(64100799003)(1800799009)(451199024)(186009)(44832011)(4326008)(8936002)(2906002)(31686004)(8676002)(316002)(66476007)(66556008)(30864003)(6512007)(66946007)(7416002)(41300700001)(478600001)(6666004)(53546011)(5660300002)(38100700002)(6486002)(6506007)(2616005)(26005)(66899024)(36756003)(31696002)(83380400001)(86362001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OThML0VoVmFGYXFveXlSU1RCeGFqdEFhSzJnbmNiVG9QNFhZMU9BNkZWeS9r?=
 =?utf-8?B?YzN6L2FkTzh6dDU4cU1yVnJEeVNvODJlYkZBWGhITWlRdzVwZXdqYlI1ZUdz?=
 =?utf-8?B?ajg2aGY5eWpSVGJib2hJak5qZTdQaENyZE1aSmFLOHJ6bk9wZFpmS1ZIN3VC?=
 =?utf-8?B?RXZSNlR2OTI2WWNPMitQWFlBemk5cDBwVHhRUU5GWnFWMkNHN3pBK3N0ZkZJ?=
 =?utf-8?B?WWNqNmloTy9aMjRHTldNbWlyR1pJNW0reHpia3pwaGUxc2VVV1p2OGRCS0Ro?=
 =?utf-8?B?dzlRZER6Z245R2tKRVJiZWIrSGRmUWhGbURINnZoTFZxT1k4bUMzZ1h4QUVs?=
 =?utf-8?B?cU1oRWkrbnJkSy9kd2Y2M1VYaDhXakZ3N3VwRmdlaFhyNmNydCtSencrN3pj?=
 =?utf-8?B?bmJ3cFhYRElPVHZBT1ZpcEpZRmlsVGllV1V3TXhzaDlsSWdWNGNUWVgxcUVF?=
 =?utf-8?B?YjQ1b2NtOS9wN2d3aUNMRm5mRXo4YnpHSVpwNG52b21IM1VEL3hIaWhKc2ox?=
 =?utf-8?B?SlhPcm5BMEVpMUdLb1JKb3ovT05uZVBHWGc3SmZFODJQN0V0NmxrVHdKZ0xF?=
 =?utf-8?B?Wll1UkNkaXozaTkxQ0twT21xejdUWlY2ZHB1NEN4N1dvd2pPZWc3Y3ZGeGxN?=
 =?utf-8?B?YXpsUkxGQzZOSVdBTGFRSVpCTEZoRTBVcW9sMlFjN09iRHNsQTI4YmR0OThX?=
 =?utf-8?B?S1l5SXpsbFJWYTlMNHBjWnB1RzdBOFBTN2JuUnBGV3doSVUxT255QWZROVgz?=
 =?utf-8?B?L2JvekVOdnN1bzlCblpaKzdsOHZVcVhhYStCUmhhalNDQXpWWEdaZ1BSUm4v?=
 =?utf-8?B?MitVT2p0WWM3TXY2UnlCUjdGakIxOW5SOEdPZUNEcVNNekVMaUJFWkRHQ3I4?=
 =?utf-8?B?QVVNMXd6ekxUSHFFZWhxTmRkb1JwR3pMSVJHSlM5OUZNTHRzYlp5SGlSWTBM?=
 =?utf-8?B?SHNrRERtcVJrM1RSRnRZNC82enZRcWxkeUdIb3d2c2UzYm9HZHpjbEVRZi9R?=
 =?utf-8?B?YThYWUgrTk14cnl6dHNkaUMvWHhZV3ZTTHRid3ROYmRRT2h1aEdyRzUzU1Js?=
 =?utf-8?B?ajljWXJlbUNMQUdHUEFwYlR6TUYxRUViUGx5Z3VscTF2TFhob0oxT1pqYTNR?=
 =?utf-8?B?SU8wVEcwQmpOUW54cjY5b3M4TWw5N2tsVUhnejY5aUVPWkx2cE1Ub1R2NVBu?=
 =?utf-8?B?eXQwTWNKT0ZJLzV1M3hMWDAxeVJMbmJhRWxnZ0hmWnoyL080djh3OHlnU0x3?=
 =?utf-8?B?NWExRHVTcVFhL0Jjbzh2UjA4RkxJZmRPdG03UU5YbHZlRnNHbEdVY1J0Qmk1?=
 =?utf-8?B?L3lMUmRPOUx3QUxpK2VjT1BmNEVJV0ZzMkxuQmExTmxjRjg5cDI2bDVnYlNM?=
 =?utf-8?B?NFV5b3lqaG1rbXdhT3luYzgzQVZWTHBJRnRDa1BWbUd1ZVVSSmwybXMxTXI4?=
 =?utf-8?B?NE1MN0lvNTZFWWd6WHQ4d29QQWM2bWZEeXYwQkN0VEppaE1TajRqVzgvRG8x?=
 =?utf-8?B?Q0lsa2FsN3dxRnhNbm1saWhQNTJKSS9TTnZIZE1NbS9VZjhaN0hINVJVRmxh?=
 =?utf-8?B?bEJQUUZhU3F1aDRDZU5CcmJFTkljRG1pdGxIUmZPalRKaHVGd0tjUjdQdDRz?=
 =?utf-8?B?Y3pQdjlIQmw2dDZoVDVrcHB3TWpJakxqaGJqVnRIbVdmSHZRZ01xWnZkZUpF?=
 =?utf-8?B?OHYwTTRTTi9aNW1VZDdxb1BEeDVlY1NTbjd0Um1FL0M4L3ZkU3k4V2UzcVR4?=
 =?utf-8?B?MU5mL0xmRGxadld6aDlBN2JqbVFVRTRhY1dpUGVVS2NjcGxPcU15ZjdzVy9w?=
 =?utf-8?B?b1p0U3BHVUhqYURCcnQvc0s3RWk2VWhSR2FScGNtTk9HWjZmZnByVmRjUC9Q?=
 =?utf-8?B?bm5idEpuU3VOLzFiVFRqSVljNEY1ZjB1QnVLdWp0MkFLYjUvNU9oL1pybEk4?=
 =?utf-8?B?dlpkUEtTb2c1WURzeDRtb05obUxYd1pzYW5Vb3h3QllkQ1AveUtXaEYzSVpE?=
 =?utf-8?B?UjVGSlE5ZGFyVTNTSnZYQkJuUm9nNFRBclZTYnJkcThxcTV3eStoTjlZOFVp?=
 =?utf-8?B?eUJBcE5yMEZPL0NoV3RVNk43MlkyVmlRbVNtT21oQzJXbGRYUStRcE1OTkVn?=
 =?utf-8?Q?GhSX5dLuFFt7bbRkT69ebyI2x?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 54f831f0-c112-4064-e9c2-08dbc03df67f
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3370.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2023 16:14:16.5982 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /w4wDaPN3GmQp+p5zyGgdkBz1263o0+H7hYv+wJ1QBcVh3rjXlLDMGcniDzAeZYK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8907
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
 mcanal@igalia.com, boris.brezillon@collabora.com, dakr@redhat.com,
 donald.robson@imgtec.com, lina@asahilina.net, christian.koenig@amd.com,
 faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-09-19 01:01, Matthew Brost wrote:
> Rather than call free_job and run_job in same work item have a dedicated
> work item for each. This aligns with the design and intended use of work
> queues.
> 
> v2:
>    - Test for DMA_FENCE_FLAG_TIMESTAMP_BIT before setting
>      timestamp in free_job() work item (Danilo)
> v3:
>   - Drop forward dec of drm_sched_select_entity (Boris)
>   - Return in drm_sched_run_job_work if entity NULL (Boris)
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/scheduler/sched_main.c | 290 +++++++++++++++----------
>  include/drm/gpu_scheduler.h            |   8 +-
>  2 files changed, 182 insertions(+), 116 deletions(-)
> 
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> index 588c735f7498..1e21d234fb5c 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -213,11 +213,12 @@ void drm_sched_rq_remove_entity(struct drm_sched_rq *rq,
>   * drm_sched_rq_select_entity_rr - Select an entity which could provide a job to run
>   *
>   * @rq: scheduler run queue to check.
> + * @dequeue: dequeue selected entity

Change this to "peek" as indicated below.

>   *
>   * Try to find a ready entity, returns NULL if none found.
>   */
>  static struct drm_sched_entity *
> -drm_sched_rq_select_entity_rr(struct drm_sched_rq *rq)
> +drm_sched_rq_select_entity_rr(struct drm_sched_rq *rq, bool dequeue)
>  {
>  	struct drm_sched_entity *entity;
>  
> @@ -227,8 +228,10 @@ drm_sched_rq_select_entity_rr(struct drm_sched_rq *rq)
>  	if (entity) {
>  		list_for_each_entry_continue(entity, &rq->entities, list) {
>  			if (drm_sched_entity_is_ready(entity)) {
> -				rq->current_entity = entity;
> -				reinit_completion(&entity->entity_idle);
> +				if (dequeue) {
> +					rq->current_entity = entity;
> +					reinit_completion(&entity->entity_idle);
> +				}

Please rename "dequeue" or invert its logic, as from this patch it seems that
it is hiding (gating out) current behaviour.

Ideally, I'd prefer it be inverted, so that current behaviour, i.e. what people
are used to the rq_select_entity_*() to do, is default--preserved.

Perhaps use "peek" as the name of this new variable, to indicate that
we're not setting it to be the current entity.

I prefer "peek" to others, as the former tells me "Hey, I'm only
peeking at the rq and not really doing the default behaviour I've been
doing which you're used to." So, probably use "peek". ("Peek" also has historical
significance...).

>  				spin_unlock(&rq->lock);
>  				return entity;
>  			}
> @@ -238,8 +241,10 @@ drm_sched_rq_select_entity_rr(struct drm_sched_rq *rq)
>  	list_for_each_entry(entity, &rq->entities, list) {
>  
>  		if (drm_sched_entity_is_ready(entity)) {
> -			rq->current_entity = entity;
> -			reinit_completion(&entity->entity_idle);
> +			if (dequeue) {

			if (!peek) {

> +				rq->current_entity = entity;
> +				reinit_completion(&entity->entity_idle);
> +			}
>  			spin_unlock(&rq->lock);
>  			return entity;
>  		}
> @@ -257,11 +262,12 @@ drm_sched_rq_select_entity_rr(struct drm_sched_rq *rq)
>   * drm_sched_rq_select_entity_fifo - Select an entity which provides a job to run
>   *
>   * @rq: scheduler run queue to check.
> + * @dequeue: dequeue selected entity

    * @peek: Just find, don't set to current.

>   *
>   * Find oldest waiting ready entity, returns NULL if none found.>   */
>  static struct drm_sched_entity *
> -drm_sched_rq_select_entity_fifo(struct drm_sched_rq *rq)
> +drm_sched_rq_select_entity_fifo(struct drm_sched_rq *rq, bool dequeue)
>  {
>  	struct rb_node *rb;
>  
> @@ -271,8 +277,10 @@ drm_sched_rq_select_entity_fifo(struct drm_sched_rq *rq)
>  
>  		entity = rb_entry(rb, struct drm_sched_entity, rb_tree_node);
>  		if (drm_sched_entity_is_ready(entity)) {
> -			rq->current_entity = entity;
> -			reinit_completion(&entity->entity_idle);
> +			if (dequeue) {

			if (!peek) {

> +				rq->current_entity = entity;
> +				reinit_completion(&entity->entity_idle);
> +			}
>  			break;
>  		}
>  	}
> @@ -282,13 +290,102 @@ drm_sched_rq_select_entity_fifo(struct drm_sched_rq *rq)
>  }
>  
>  /**
> - * drm_sched_submit_queue - scheduler queue submission
> + * drm_sched_run_job_queue - queue job submission
> + * @sched: scheduler instance
> + */

Perhaps it would be clearer to a DOC reader if there were verbs
in this function comment? I feel this was mentioned in the review
to patch 2...

> +static void drm_sched_run_job_queue(struct drm_gpu_scheduler *sched)
> +{
> +	if (!READ_ONCE(sched->pause_submit))
> +		queue_work(sched->submit_wq, &sched->work_run_job);
> +}
> +
> +/**
> + * drm_sched_can_queue -- Can we queue more to the hardware?
> + * @sched: scheduler instance
> + *
> + * Return true if we can push more jobs to the hw, otherwise false.
> + */
> +static bool drm_sched_can_queue(struct drm_gpu_scheduler *sched)
> +{
> +	return atomic_read(&sched->hw_rq_count) <
> +		sched->hw_submission_limit;
> +}
> +
> +/**
> + * drm_sched_select_entity - Select next entity to process
> + *
> + * @sched: scheduler instance
> + * @dequeue: dequeue selected entity

When I see "dequeue" I'm thinking "list_del()". Let's
use "peek" here as mentioned above.

> + *
> + * Returns the entity to process or NULL if none are found.
> + */
> +static struct drm_sched_entity *
> +drm_sched_select_entity(struct drm_gpu_scheduler *sched, bool dequeue)

drm_sched_select_entity(struct drm_gpu_scheduler *sched, bool peek)

> +{
> +	struct drm_sched_entity *entity;
> +	int i;
> +
> +	if (!drm_sched_can_queue(sched))
> +		return NULL;
> +
> +	if (sched->single_entity) {
> +		if (!READ_ONCE(sched->single_entity->stopped) &&
> +		    drm_sched_entity_is_ready(sched->single_entity))
> +			return sched->single_entity;
> +
> +		return NULL;
> +	}
> +
> +	/* Kernel run queue has higher priority than normal run queue*/
> +	for (i = DRM_SCHED_PRIORITY_COUNT - 1; i >= DRM_SCHED_PRIORITY_MIN; i--) {
> +		entity = sched->sched_policy == DRM_SCHED_POLICY_FIFO ?
> +			drm_sched_rq_select_entity_fifo(&sched->sched_rq[i],
> +							dequeue) :
> +			drm_sched_rq_select_entity_rr(&sched->sched_rq[i],
> +						      dequeue);
> +		if (entity)
> +			break;
> +	}
> +
> +	return entity;
> +}
> +
> +/**
> + * drm_sched_run_job_queue_if_ready - queue job submission if ready
>   * @sched: scheduler instance
>   */
> -static void drm_sched_submit_queue(struct drm_gpu_scheduler *sched)
> +static void drm_sched_run_job_queue_if_ready(struct drm_gpu_scheduler *sched)
> +{
> +	if (drm_sched_select_entity(sched, false))
> +		drm_sched_run_job_queue(sched);
> +}
> +
> +/**
> + * drm_sched_free_job_queue - queue free job

 * drm_sched_free_job_queue - enqueue free-job work

> + *
> + * @sched: scheduler instance to queue free job

 * @sched: scheduler instance to queue free job work for


> + */
> +static void drm_sched_free_job_queue(struct drm_gpu_scheduler *sched)
>  {
>  	if (!READ_ONCE(sched->pause_submit))
> -		queue_work(sched->submit_wq, &sched->work_submit);
> +		queue_work(sched->submit_wq, &sched->work_free_job);
> +}
> +
> +/**
> + * drm_sched_free_job_queue_if_ready - queue free job if ready

 * drm_sched_free_job_queue_if_ready - enqueue free-job work if ready

> + *
> + * @sched: scheduler instance to queue free job
> + */
> +static void drm_sched_free_job_queue_if_ready(struct drm_gpu_scheduler *sched)
> +{
> +	struct drm_sched_job *job;
> +
> +	spin_lock(&sched->job_list_lock);
> +	job = list_first_entry_or_null(&sched->pending_list,
> +				       struct drm_sched_job, list);
> +	if (job && dma_fence_is_signaled(&job->s_fence->finished))
> +		drm_sched_free_job_queue(sched);
> +	spin_unlock(&sched->job_list_lock);
>  }
>  
>  /**
> @@ -310,7 +407,7 @@ static void drm_sched_job_done(struct drm_sched_job *s_job, int result)
>  	dma_fence_get(&s_fence->finished);
>  	drm_sched_fence_finished(s_fence, result);
>  	dma_fence_put(&s_fence->finished);
> -	drm_sched_submit_queue(sched);
> +	drm_sched_free_job_queue(sched);
>  }
>  
>  /**
> @@ -885,18 +982,6 @@ void drm_sched_job_cleanup(struct drm_sched_job *job)
>  }
>  EXPORT_SYMBOL(drm_sched_job_cleanup);
>  
> -/**
> - * drm_sched_can_queue -- Can we queue more to the hardware?
> - * @sched: scheduler instance
> - *
> - * Return true if we can push more jobs to the hw, otherwise false.
> - */
> -static bool drm_sched_can_queue(struct drm_gpu_scheduler *sched)
> -{
> -	return atomic_read(&sched->hw_rq_count) <
> -		sched->hw_submission_limit;
> -}
> -
>  /**
>   * drm_sched_wakeup_if_can_queue - Wake up the scheduler
>   * @sched: scheduler instance
> @@ -906,43 +991,7 @@ static bool drm_sched_can_queue(struct drm_gpu_scheduler *sched)
>  void drm_sched_wakeup_if_can_queue(struct drm_gpu_scheduler *sched)
>  {
>  	if (drm_sched_can_queue(sched))
> -		drm_sched_submit_queue(sched);
> -}
> -
> -/**
> - * drm_sched_select_entity - Select next entity to process
> - *
> - * @sched: scheduler instance
> - *
> - * Returns the entity to process or NULL if none are found.
> - */
> -static struct drm_sched_entity *
> -drm_sched_select_entity(struct drm_gpu_scheduler *sched)
> -{
> -	struct drm_sched_entity *entity;
> -	int i;
> -
> -	if (!drm_sched_can_queue(sched))
> -		return NULL;
> -
> -	if (sched->single_entity) {
> -		if (!READ_ONCE(sched->single_entity->stopped) &&
> -		    drm_sched_entity_is_ready(sched->single_entity))
> -			return sched->single_entity;
> -
> -		return NULL;
> -	}
> -
> -	/* Kernel run queue has higher priority than normal run queue*/
> -	for (i = DRM_SCHED_PRIORITY_COUNT - 1; i >= DRM_SCHED_PRIORITY_MIN; i--) {
> -		entity = sched->sched_policy == DRM_SCHED_POLICY_FIFO ?
> -			drm_sched_rq_select_entity_fifo(&sched->sched_rq[i]) :
> -			drm_sched_rq_select_entity_rr(&sched->sched_rq[i]);
> -		if (entity)
> -			break;
> -	}
> -
> -	return entity;
> +		drm_sched_run_job_queue(sched);
>  }
>  
>  /**
> @@ -974,8 +1023,10 @@ drm_sched_get_cleanup_job(struct drm_gpu_scheduler *sched)
>  						typeof(*next), list);
>  
>  		if (next) {
> -			next->s_fence->scheduled.timestamp =
> -				job->s_fence->finished.timestamp;
> +			if (test_bit(DMA_FENCE_FLAG_TIMESTAMP_BIT,
> +				     &next->s_fence->scheduled.flags))
> +				next->s_fence->scheduled.timestamp =
> +					job->s_fence->finished.timestamp;
>  			/* start TO timer for next job */
>  			drm_sched_start_timeout(sched);
>  		}
> @@ -1025,74 +1076,84 @@ drm_sched_pick_best(struct drm_gpu_scheduler **sched_list,
>  EXPORT_SYMBOL(drm_sched_pick_best);
>  
>  /**
> - * drm_sched_main - main scheduler thread
> + * drm_sched_free_job_work - worker to call free_job
>   *
> - * @param: scheduler instance
> + * @w: free job work
>   */
> -static void drm_sched_main(struct work_struct *w)
> +static void drm_sched_free_job_work(struct work_struct *w)
>  {
>  	struct drm_gpu_scheduler *sched =
> -		container_of(w, struct drm_gpu_scheduler, work_submit);
> -	struct drm_sched_entity *entity;
> +		container_of(w, struct drm_gpu_scheduler, work_free_job);
>  	struct drm_sched_job *cleanup_job;
> -	int r;
>  
>  	if (READ_ONCE(sched->pause_submit))
>  		return;
>  
>  	cleanup_job = drm_sched_get_cleanup_job(sched);
> -	entity = drm_sched_select_entity(sched);
> -
> -	if (!entity && !cleanup_job)
> -		return;	/* No more work */
> -
> -	if (cleanup_job)
> +	if (cleanup_job) {
>  		sched->ops->free_job(cleanup_job);
>  
> -	if (entity) {
> -		struct dma_fence *fence;
> -		struct drm_sched_fence *s_fence;
> -		struct drm_sched_job *sched_job;
> -
> -		sched_job = drm_sched_entity_pop_job(entity);
> -		if (!sched_job) {
> -			complete_all(&entity->entity_idle);
> -			if (!cleanup_job)
> -				return;	/* No more work */
> -			goto again;
> -		}
> +		drm_sched_free_job_queue_if_ready(sched);
> +		drm_sched_run_job_queue_if_ready(sched);
> +	}
> +}
> +
> +/**
> + * drm_sched_run_job_work - worker to call run_job
> + *
> + * @w: run job work
> + */
> +static void drm_sched_run_job_work(struct work_struct *w)
> +{
> +	struct drm_gpu_scheduler *sched =
> +		container_of(w, struct drm_gpu_scheduler, work_run_job);
> +	struct drm_sched_entity *entity;
> +	struct dma_fence *fence;
> +	struct drm_sched_fence *s_fence;
> +	struct drm_sched_job *sched_job;
> +	int r;
>  
> -		s_fence = sched_job->s_fence;
> +	if (READ_ONCE(sched->pause_submit))
> +		return;
>  
> -		atomic_inc(&sched->hw_rq_count);
> -		drm_sched_job_begin(sched_job);
> +	entity = drm_sched_select_entity(sched, true);
> +	if (!entity)
> +		return;
>  
> -		trace_drm_run_job(sched_job, entity);
> -		fence = sched->ops->run_job(sched_job);
> +	sched_job = drm_sched_entity_pop_job(entity);
> +	if (!sched_job) {
>  		complete_all(&entity->entity_idle);
> -		drm_sched_fence_scheduled(s_fence, fence);
> +		return;	/* No more work */
> +	}
>  
> -		if (!IS_ERR_OR_NULL(fence)) {
> -			/* Drop for original kref_init of the fence */
> -			dma_fence_put(fence);
> +	s_fence = sched_job->s_fence;
>  
> -			r = dma_fence_add_callback(fence, &sched_job->cb,
> -						   drm_sched_job_done_cb);
> -			if (r == -ENOENT)
> -				drm_sched_job_done(sched_job, fence->error);
> -			else if (r)
> -				DRM_DEV_ERROR(sched->dev, "fence add callback failed (%d)\n",
> -					  r);
> -		} else {
> -			drm_sched_job_done(sched_job, IS_ERR(fence) ?
> -					   PTR_ERR(fence) : 0);
> -		}
> +	atomic_inc(&sched->hw_rq_count);
> +	drm_sched_job_begin(sched_job);
> +
> +	trace_drm_run_job(sched_job, entity);
> +	fence = sched->ops->run_job(sched_job);
> +	complete_all(&entity->entity_idle);
> +	drm_sched_fence_scheduled(s_fence, fence);
>  
> -		wake_up(&sched->job_scheduled);
> +	if (!IS_ERR_OR_NULL(fence)) {
> +		/* Drop for original kref_init of the fence */
> +		dma_fence_put(fence);
> +
> +		r = dma_fence_add_callback(fence, &sched_job->cb,
> +					   drm_sched_job_done_cb);
> +		if (r == -ENOENT)
> +			drm_sched_job_done(sched_job, fence->error);
> +		else if (r)
> +			DRM_DEV_ERROR(sched->dev, "fence add callback failed (%d)\n",
> +				  r);

Please align "r);" to the open brace on the previous line. If you're using Emacs
with sane Linux settings, press the "Tab" key anywhere on the line to indent it.
(It should run c-indent-line-or-region, usually using leading-tabs-only mode. Pressing
it again, over and over, on an already indented line, does nothing. Column indenting--say
for columns in 2D/3D/etc., array, usually happens using spaces, which is portable.
Also please take an overview with "scrips/checkpatch.pl --strict".)

Wrap-around was bumped to 100 in the Linux kernel so you can put the 'r' on
the same line without style problems.

> +	} else {
> +		drm_sched_job_done(sched_job, IS_ERR(fence) ?
> +				   PTR_ERR(fence) : 0);
>  	}
>  
> -again:
> -	drm_sched_submit_queue(sched);
> +	wake_up(&sched->job_scheduled);
> +	drm_sched_run_job_queue_if_ready(sched);
>  }
>  
>  /**
> @@ -1159,7 +1220,8 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
>  	spin_lock_init(&sched->job_list_lock);
>  	atomic_set(&sched->hw_rq_count, 0);
>  	INIT_DELAYED_WORK(&sched->work_tdr, drm_sched_job_timedout);
> -	INIT_WORK(&sched->work_submit, drm_sched_main);
> +	INIT_WORK(&sched->work_run_job, drm_sched_run_job_work);
> +	INIT_WORK(&sched->work_free_job, drm_sched_free_job_work);
>  	atomic_set(&sched->_score, 0);
>  	atomic64_set(&sched->job_id_count, 0);
>  	sched->pause_submit = false;
> @@ -1286,7 +1348,8 @@ EXPORT_SYMBOL(drm_sched_submit_ready);
>  void drm_sched_submit_stop(struct drm_gpu_scheduler *sched)
>  {
>  	WRITE_ONCE(sched->pause_submit, true);
> -	cancel_work_sync(&sched->work_submit);
> +	cancel_work_sync(&sched->work_run_job);
> +	cancel_work_sync(&sched->work_free_job);
>  }
>  EXPORT_SYMBOL(drm_sched_submit_stop);
>  
> @@ -1298,6 +1361,7 @@ EXPORT_SYMBOL(drm_sched_submit_stop);
>  void drm_sched_submit_start(struct drm_gpu_scheduler *sched)
>  {
>  	WRITE_ONCE(sched->pause_submit, false);
> -	queue_work(sched->submit_wq, &sched->work_submit);
> +	queue_work(sched->submit_wq, &sched->work_run_job);
> +	queue_work(sched->submit_wq, &sched->work_free_job);
>  }
>  EXPORT_SYMBOL(drm_sched_submit_start);
> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> index 655675f797ea..7e6c121003ca 100644
> --- a/include/drm/gpu_scheduler.h
> +++ b/include/drm/gpu_scheduler.h
> @@ -487,9 +487,10 @@ struct drm_sched_backend_ops {
>   *                 finished.
>   * @hw_rq_count: the number of jobs currently in the hardware queue.
>   * @job_id_count: used to assign unique id to the each job.
> - * @submit_wq: workqueue used to queue @work_submit
> + * @submit_wq: workqueue used to queue @work_run_job and @work_free_job
>   * @timeout_wq: workqueue used to queue @work_tdr
> - * @work_submit: schedules jobs and cleans up entities
> + * @work_run_job: schedules jobs
> + * @work_free_job: cleans up jobs
>   * @work_tdr: schedules a delayed call to @drm_sched_job_timedout after the
>   *            timeout interval is over.
>   * @pending_list: the list of jobs which are currently in the job queue.
> @@ -519,7 +520,8 @@ struct drm_gpu_scheduler {
>  	atomic64_t			job_id_count;
>  	struct workqueue_struct		*submit_wq;
>  	struct workqueue_struct		*timeout_wq;
> -	struct work_struct		work_submit;
> +	struct work_struct		work_run_job;
> +	struct work_struct		work_free_job;
>  	struct delayed_work		work_tdr;
>  	struct list_head		pending_list;
>  	spinlock_t			job_list_lock;

Yeah, so this is a good patch. Thanks for doing this!
-- 
Regards,
Luben

