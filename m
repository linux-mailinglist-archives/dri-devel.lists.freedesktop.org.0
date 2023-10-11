Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 295F77C6114
	for <lists+dri-devel@lfdr.de>; Thu, 12 Oct 2023 01:29:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D95B10E2B8;
	Wed, 11 Oct 2023 23:29:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2050.outbound.protection.outlook.com [40.107.220.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5978E10E275;
 Wed, 11 Oct 2023 23:29:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZBzBYxDh+CJ5txtj5dKDJ702qehxgs25MEhlNCAa+8gmImZgd8l7taJ8skq28ZQ6l2vZgdv2M/3noWwwvQIvm91dGldOUeNf0thMS5GJ8MwcEJwFk/eu10aVmjm/eCrfFEkcRXtOmjjfj6agIp8Ue348n5AkLMO01CRWVL2SbYoGDG6emKJtW27BL++h1/yQCLXEa1289OFNLrAittjuUbz++TwGNSBDLXp0hsWX83y4Swb7CkUHKMvBrLtett+rlgBfFEn6WtP5vGi28AspE1gFbZ4tL0WBBC0T5B6hc2sR8dOnRSwL3bTVyncfhWKYhK0wIJ40AtxfTjUKBu7TVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KNYQPtQurMLkyIl3DPB4oX0riAsnHzYegxI5BNaP3HI=;
 b=EzEnkwBackKBueYglfTG6NsmNP++1UQ40n2J4jh1FkYgPGxUjaQgZEGmDLEKqv+UYt3B2MvX1ctOdNRGCDyeZXl3BYePIGAOwTZavILI935MzmboFDguMEYgzcWsV+MeDQAbo9wTv+agvNqf2jl4newWCkvyozv3OJda3pCf68MT72ax+aMAL9pJTqn3JrKS0xN1Vf/Z74rLCSiF3u3RQ86bacWpB56qzak3nXC9+TZPtzNKtuGqrrR60fJ0zebnY+DmWsi3kUkLZsKpIah3XRGenYzx6pcVeaIDYTZ4Spo5zojM/RjRaij2wTbgN060G/m7IUpxeX9zTg8ei2rnKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KNYQPtQurMLkyIl3DPB4oX0riAsnHzYegxI5BNaP3HI=;
 b=VXV3IWMajhEVzweurXMBJvpQ054fgIxNnukL/l/Ti/d3FV1njVQYO5yv59WPDOwGFc5CAaZLGY1Bdmj3OjakwMBPQ0Ba4CqBDt/R1ud00LYJKsuGe9N3nThIBlHXr26eQJsftRIXME80P+nDomt5AekByMYHgGRhr80spqsau48=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3370.namprd12.prod.outlook.com (2603:10b6:5:38::25) by
 SA1PR12MB8162.namprd12.prod.outlook.com (2603:10b6:806:33a::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.38; Wed, 11 Oct
 2023 23:29:20 +0000
Received: from DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::b80b:7138:6ceb:9aef]) by DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::b80b:7138:6ceb:9aef%5]) with mapi id 15.20.6863.043; Wed, 11 Oct 2023
 23:29:20 +0000
Message-ID: <5fb9648b-5219-440b-ac77-91b1095b6151@amd.com>
Date: Wed, 11 Oct 2023 19:29:16 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:115.0) Gecko/20100101
 Thunderbird/115.3.2
Subject: Re: [PATCH v4 05/10] drm/sched: Split free_job into own work item
Content-Language: en-CA, en-US
To: Matthew Brost <matthew.brost@intel.com>
References: <20230919050155.2647172-1-matthew.brost@intel.com>
 <20230919050155.2647172-6-matthew.brost@intel.com>
 <15751c1b-2712-4320-9b99-54e14f42b6f9@amd.com>
 <ZR42R5IZSHcE27YB@DUT025-TGLU.fm.intel.com>
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
In-Reply-To: <ZR42R5IZSHcE27YB@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR01CA0060.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:2::32) To DM6PR12MB3370.namprd12.prod.outlook.com
 (2603:10b6:5:38::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB3370:EE_|SA1PR12MB8162:EE_
X-MS-Office365-Filtering-Correlation-Id: ef1db1a7-5558-45a7-b494-08dbcab1e4de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jwnCmpb80y+Cf/AU4beBbwJZcCkxrIcKvEw8YE33Fd3srA+StHHotXFyhTP4p2X/YC7mV+k7Q5oigxKqKLnVCn5F3Y+vrRzyqj+65ihI2tYBS+mUyLvGc/e+5NrBC0pQsrKrayNsL1hYOKWFLoHtr3kW1J7x0bBvUu84VS8CCiZuDulHy82mvX2Q/zz3pCtuIiYXZsu+G/tE68eFmKLP/dp6qzzPj/8oMS5BbB4vZoHeCW1lxFyiX+LpuOB/3bRXuaFCIbgluMbbWB9FEJZdtVCAKr8R2h/y/YlS0JySbRnQksUzqEovFUTgNGBqivQ7BP+FieXoAdJimvRSGjZpchXAGprouo/3lx6K0tQsqSTOOJv/RcV9aGp+Z6vKhqNM8XQ5AFaewZJoEZFGmsHlf5UaUHPbryZzqqL5C1jEEe9Ux6Zv94Z5vlD/51Sz2XzwgdnIOdXLkx64fwx6Xu4ZwJ73wVnx5U/6bh79kqXdZjYWr3lSwJRAxdZl09p5DWMfHIgYY1qhI3HrDeaaQMmhJW4+7Cf8Pug5mKWPMX+v0jaIxg9B/Q9b8iY2OSBaYNKVzYRkEpfVzpinJS85FG7EhH5Ua2lGNNJB/j6/uXNRVh9ssUkRnlAQdKbMWcfoCX0JRpYWax8Q5YODgJpYOMMigQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3370.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(396003)(136003)(39860400002)(366004)(346002)(230922051799003)(186009)(64100799003)(1800799009)(451199024)(6512007)(53546011)(6486002)(478600001)(6666004)(8936002)(6506007)(44832011)(66556008)(7416002)(83380400001)(30864003)(2906002)(6916009)(5660300002)(66946007)(66476007)(2616005)(316002)(8676002)(4326008)(41300700001)(26005)(86362001)(38100700002)(31696002)(36756003)(31686004)(66899024)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OCtXY2hObDBpeGtIRklTMXMvSE1Tc3BNdkFnay96aUpKRnFTdzhwVzJDc05E?=
 =?utf-8?B?UTdxbUI1NjRMdU1ac041d0VpQklFTUZ2Tm1EbStpNys1WmtOVGNHNDd3R2Z2?=
 =?utf-8?B?bFArU1pVVmhINUlMN1E2YjJRbXIvNklPbmI3UnhVWjFJREtGa1FzYjBwYytF?=
 =?utf-8?B?anFLd0MraVNKNDc1Q1F4RE1seEpNMzE2WnVpa0d3d2tvdFRpcXVuKzB1NG02?=
 =?utf-8?B?elMwV0wwcWtUdGZNSnBhUU80N3BEU2dxcVBjWSt0Sk04blFJZWNuNTNGbCsy?=
 =?utf-8?B?ZkFMelJHV0VpMnRTQ0laWE84NHUyMnVIaEc4eGxGT2M4WVRpTkdscVhWOTNp?=
 =?utf-8?B?eE5pdlRYVldyaUo3UlZHcFUwR3BPSEE4eUJkRmpMdWF0T1NVc0J3RkQ0WFBT?=
 =?utf-8?B?YWY5anBFcnV4L2s0SGkwdWl4c3p3SVdnK09LVmpHTmNjQ3R0c1ExZXEvcjJY?=
 =?utf-8?B?U0J3aFNyYXlJSmlFUEMzN3hocThTd2lpTmVYMkdJNDRKR3Q4NVhHTGtrRmd2?=
 =?utf-8?B?TDZPd0hOanB3emtWcFhUV1JzdkNDZ1plYjRKSDZRQUdYWU9KblFBU3NRYjM3?=
 =?utf-8?B?cE02THlDSXBzenhUemVoTFJWOWxlWXRvN1BpbVM0T2hSZXo0MU9DN3NvdW9L?=
 =?utf-8?B?RDh3Lzg2d0pWSDB0NlRpS0pnYnVTNDdOU1ZCd3ZMaiswVWF5TkxjVlVLanNC?=
 =?utf-8?B?ZCtBZzNkUFlhbWlkSHV1blFCZGRXZld3TFdIMWNUd1N2cS9YT0pBU2dPdGdT?=
 =?utf-8?B?eENpMjJ5WmtNUis0TnFLMkxycWNDT0U3ZnJSWWVKZ2VnZjNCbUVsU3NHM1BU?=
 =?utf-8?B?WmRwVk93d3Fnci9NWERmSDFTNDNJNnRERmUyUVNEUEdadytSN3R6aEpaWk03?=
 =?utf-8?B?Yng0NXA2UTdXdklaSXZaQ0RVbzN1YmFTVjBQblBFNkY4MGlFN05yazFCbWNZ?=
 =?utf-8?B?Zkd2TWVoNGJzK3IxUE9JVy9qTlpWRFN2M0I5bnR4ZzRqYXpiU1lhQk9SN0Z1?=
 =?utf-8?B?L0YzeEQ5Ynk1SElFQkJyNXZFRlhYVDBZM3lJdkZLVmU0V2xoYncxc3ZEMERB?=
 =?utf-8?B?ZG1XK05LZERGYlZCQ1JtT3NzVE8xbTNNTFhxVytXNjM1NDlSYmhnY3Z0UHgy?=
 =?utf-8?B?d3BjWU5CVEgwNnpsQjFvaEdsVUtkTU05MkxGeitDTCs3S3VvL0RVT0pKSUxV?=
 =?utf-8?B?ZFhHbWh4RVdpUjNBTnVhQjdwcCtTalRFa2VYelp6THRkWnNoSEZ0N28rSHh0?=
 =?utf-8?B?UmJlVWJOaEpGOGxEVXJEVGVIWFBmbFpLbHc0UUU2ZFQ5a2tCaHU1ZmxHVll2?=
 =?utf-8?B?NVRvc3RZejJ3aHZ1UDJEYmRyb1M5UjlYWWZIQzdiek1NZzFWVXBzRVZqN2Zw?=
 =?utf-8?B?WU5XMkNqdG1haWx5RE9ObVhsNmZmTG9iblU2TlNGV2N3cm9DeWhPclJ4dW82?=
 =?utf-8?B?N1pIeFMxVEdORUxkWG9uVG9BdFl0aWhBbU9BazRmbytHR1ZKRTEwbTliZDYv?=
 =?utf-8?B?YVlDdC8wUTZuMXRlc05SNytxVmFoNktHb29BWitMdVoyM1FtYkhmMzRBQW1F?=
 =?utf-8?B?TzFZQi8vSmlCMk1TSXphakxKTGRvbitwL29hZkhRM3QvYnVUNWJsMHphQ0Yr?=
 =?utf-8?B?T2R4cXE0aHFCTjJ5K2g0ZkI5bldKOTdDWUFTUm5oTTJsNUd4ZVg0bUZreUNO?=
 =?utf-8?B?NnI3WC9sVUlVN1lEU1JDVjJIVUFmWGtSY2l3aHZoekYweFhPMTV6K241b2hD?=
 =?utf-8?B?dUg4bXBlaU9IUnFNTmlwL01Kc1RDUlNuNUtGT29hODVMaUZuRXhicFdRMHU5?=
 =?utf-8?B?MFJVS3dZT3RsY3V6bWp3WFFvbEJyNjRveXpEWVZZb0ZrOGtDRVduOFU3VkdO?=
 =?utf-8?B?RUp2UW1nOG1nUkpYaVhKOGhlQzhhZVY2NHp3VHdwZVlEODZMMjkrNGMveWMv?=
 =?utf-8?B?L3RldlBscjU0TnRQd3RWbHVVM3lKQkxiR2c2UGtXV3MraVlmZndRYkd0ZnBE?=
 =?utf-8?B?amVnVnVKOEdCZHFteDJkS1N2eG9hR1JuMlhKVmJYVDVxeEFYdCtIZEV3U0F5?=
 =?utf-8?B?NjBWcTY1anVhTjF0bXBzem1xdlN5QytwZGZCL3VNRFNiR29CSTYzS2lTV25R?=
 =?utf-8?Q?jz5mBP6Hp7eUqwjbXKZwV/1vt?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef1db1a7-5558-45a7-b494-08dbcab1e4de
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3370.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2023 23:29:20.2063 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Xl0eYgJRbpWMHiKqYyGS4FlG6ob7nwhmm6U/mBqrYHHp6G3F2frCzQiqK7hn5ZN/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8162
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
 mcanal@igalia.com, dri-devel@lists.freedesktop.org, christian.koenig@amd.com,
 boris.brezillon@collabora.com, dakr@redhat.com, donald.robson@imgtec.com,
 lina@asahilina.net, intel-xe@lists.freedesktop.org,
 faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-10-05 00:06, Matthew Brost wrote:
> On Thu, Sep 28, 2023 at 12:14:12PM -0400, Luben Tuikov wrote:
>> On 2023-09-19 01:01, Matthew Brost wrote:
>>> Rather than call free_job and run_job in same work item have a dedicated
>>> work item for each. This aligns with the design and intended use of work
>>> queues.
>>>
>>> v2:
>>>    - Test for DMA_FENCE_FLAG_TIMESTAMP_BIT before setting
>>>      timestamp in free_job() work item (Danilo)
>>> v3:
>>>   - Drop forward dec of drm_sched_select_entity (Boris)
>>>   - Return in drm_sched_run_job_work if entity NULL (Boris)
>>>
>>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>>> ---
>>>  drivers/gpu/drm/scheduler/sched_main.c | 290 +++++++++++++++----------
>>>  include/drm/gpu_scheduler.h            |   8 +-
>>>  2 files changed, 182 insertions(+), 116 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
>>> index 588c735f7498..1e21d234fb5c 100644
>>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>>> @@ -213,11 +213,12 @@ void drm_sched_rq_remove_entity(struct drm_sched_rq *rq,
>>>   * drm_sched_rq_select_entity_rr - Select an entity which could provide a job to run
>>>   *
>>>   * @rq: scheduler run queue to check.
>>> + * @dequeue: dequeue selected entity
>>
>> Change this to "peek" as indicated below.
>>
>>>   *
>>>   * Try to find a ready entity, returns NULL if none found.
>>>   */
>>>  static struct drm_sched_entity *
>>> -drm_sched_rq_select_entity_rr(struct drm_sched_rq *rq)
>>> +drm_sched_rq_select_entity_rr(struct drm_sched_rq *rq, bool dequeue)
>>>  {
>>>  	struct drm_sched_entity *entity;
>>>  
>>> @@ -227,8 +228,10 @@ drm_sched_rq_select_entity_rr(struct drm_sched_rq *rq)
>>>  	if (entity) {
>>>  		list_for_each_entry_continue(entity, &rq->entities, list) {
>>>  			if (drm_sched_entity_is_ready(entity)) {
>>> -				rq->current_entity = entity;
>>> -				reinit_completion(&entity->entity_idle);
>>> +				if (dequeue) {
>>> +					rq->current_entity = entity;
>>> +					reinit_completion(&entity->entity_idle);
>>> +				}
>>
>> Please rename "dequeue" or invert its logic, as from this patch it seems that
>> it is hiding (gating out) current behaviour.
>>
>> Ideally, I'd prefer it be inverted, so that current behaviour, i.e. what people
>> are used to the rq_select_entity_*() to do, is default--preserved.
>>
>> Perhaps use "peek" as the name of this new variable, to indicate that
>> we're not setting it to be the current entity.
>>
>> I prefer "peek" to others, as the former tells me "Hey, I'm only
>> peeking at the rq and not really doing the default behaviour I've been
>> doing which you're used to." So, probably use "peek". ("Peek" also has historical
>> significance...).
>>
> 
> Peek it is. Will change.
> 
>>>  				spin_unlock(&rq->lock);
>>>  				return entity;
>>>  			}
>>> @@ -238,8 +241,10 @@ drm_sched_rq_select_entity_rr(struct drm_sched_rq *rq)
>>>  	list_for_each_entry(entity, &rq->entities, list) {
>>>  
>>>  		if (drm_sched_entity_is_ready(entity)) {
>>> -			rq->current_entity = entity;
>>> -			reinit_completion(&entity->entity_idle);
>>> +			if (dequeue) {
>>
>> 			if (!peek) {
>>
> 
> +1
> 
>>> +				rq->current_entity = entity;
>>> +				reinit_completion(&entity->entity_idle);
>>> +			}
>>>  			spin_unlock(&rq->lock);
>>>  			return entity;
>>>  		}
>>> @@ -257,11 +262,12 @@ drm_sched_rq_select_entity_rr(struct drm_sched_rq *rq)
>>>   * drm_sched_rq_select_entity_fifo - Select an entity which provides a job to run
>>>   *
>>>   * @rq: scheduler run queue to check.
>>> + * @dequeue: dequeue selected entity
>>
>>     * @peek: Just find, don't set to current.
>>
> 
> +1
>  
>>>   *
>>>   * Find oldest waiting ready entity, returns NULL if none found.>   */
>>>  static struct drm_sched_entity *
>>> -drm_sched_rq_select_entity_fifo(struct drm_sched_rq *rq)
>>> +drm_sched_rq_select_entity_fifo(struct drm_sched_rq *rq, bool dequeue)
>>>  {
>>>  	struct rb_node *rb;
>>>  
>>> @@ -271,8 +277,10 @@ drm_sched_rq_select_entity_fifo(struct drm_sched_rq *rq)
>>>  
>>>  		entity = rb_entry(rb, struct drm_sched_entity, rb_tree_node);
>>>  		if (drm_sched_entity_is_ready(entity)) {
>>> -			rq->current_entity = entity;
>>> -			reinit_completion(&entity->entity_idle);
>>> +			if (dequeue) {
>>
>> 			if (!peek) {
>>
>>> +				rq->current_entity = entity;
>>> +				reinit_completion(&entity->entity_idle);
>>> +			}
>>>  			break;
>>>  		}
>>>  	}
>>> @@ -282,13 +290,102 @@ drm_sched_rq_select_entity_fifo(struct drm_sched_rq *rq)
>>>  }
>>>  
>>>  /**
>>> - * drm_sched_submit_queue - scheduler queue submission
>>> + * drm_sched_run_job_queue - queue job submission
>>> + * @sched: scheduler instance
>>> + */
>>
>> Perhaps it would be clearer to a DOC reader if there were verbs
>> in this function comment? I feel this was mentioned in the review
>> to patch 2...
>>
>>> +static void drm_sched_run_job_queue(struct drm_gpu_scheduler *sched)
>>> +{
>>> +	if (!READ_ONCE(sched->pause_submit))
>>> +		queue_work(sched->submit_wq, &sched->work_run_job);
>>> +}
>>> +
>>> +/**
>>> + * drm_sched_can_queue -- Can we queue more to the hardware?
>>> + * @sched: scheduler instance
>>> + *
>>> + * Return true if we can push more jobs to the hw, otherwise false.
>>> + */
>>> +static bool drm_sched_can_queue(struct drm_gpu_scheduler *sched)
>>> +{
>>> +	return atomic_read(&sched->hw_rq_count) <
>>> +		sched->hw_submission_limit;
>>> +}
>>> +
>>> +/**
>>> + * drm_sched_select_entity - Select next entity to process
>>> + *
>>> + * @sched: scheduler instance
>>> + * @dequeue: dequeue selected entity
>>
>> When I see "dequeue" I'm thinking "list_del()". Let's
>> use "peek" here as mentioned above.
>>
>>> + *
>>> + * Returns the entity to process or NULL if none are found.
>>> + */
>>> +static struct drm_sched_entity *
>>> +drm_sched_select_entity(struct drm_gpu_scheduler *sched, bool dequeue)
>>
>> drm_sched_select_entity(struct drm_gpu_scheduler *sched, bool peek)
>>
> 
> +1
> 
>>> +{
>>> +	struct drm_sched_entity *entity;
>>> +	int i;
>>> +
>>> +	if (!drm_sched_can_queue(sched))
>>> +		return NULL;
>>> +
>>> +	if (sched->single_entity) {
>>> +		if (!READ_ONCE(sched->single_entity->stopped) &&
>>> +		    drm_sched_entity_is_ready(sched->single_entity))
>>> +			return sched->single_entity;
>>> +
>>> +		return NULL;
>>> +	}
>>> +
>>> +	/* Kernel run queue has higher priority than normal run queue*/
>>> +	for (i = DRM_SCHED_PRIORITY_COUNT - 1; i >= DRM_SCHED_PRIORITY_MIN; i--) {
>>> +		entity = sched->sched_policy == DRM_SCHED_POLICY_FIFO ?
>>> +			drm_sched_rq_select_entity_fifo(&sched->sched_rq[i],
>>> +							dequeue) :
>>> +			drm_sched_rq_select_entity_rr(&sched->sched_rq[i],
>>> +						      dequeue);
>>> +		if (entity)
>>> +			break;
>>> +	}
>>> +
>>> +	return entity;
>>> +}
>>> +
>>> +/**
>>> + * drm_sched_run_job_queue_if_ready - queue job submission if ready
>>>   * @sched: scheduler instance
>>>   */
>>> -static void drm_sched_submit_queue(struct drm_gpu_scheduler *sched)
>>> +static void drm_sched_run_job_queue_if_ready(struct drm_gpu_scheduler *sched)
>>> +{
>>> +	if (drm_sched_select_entity(sched, false))
>>> +		drm_sched_run_job_queue(sched);
>>> +}
>>> +
>>> +/**
>>> + * drm_sched_free_job_queue - queue free job
>>
>>  * drm_sched_free_job_queue - enqueue free-job work
>>
>>> + *
>>> + * @sched: scheduler instance to queue free job
>>
>>  * @sched: scheduler instance to queue free job work for
>>
>>
> 
> Will change both.
> 
>>> + */
>>> +static void drm_sched_free_job_queue(struct drm_gpu_scheduler *sched)
>>>  {
>>>  	if (!READ_ONCE(sched->pause_submit))
>>> -		queue_work(sched->submit_wq, &sched->work_submit);
>>> +		queue_work(sched->submit_wq, &sched->work_free_job);
>>> +}
>>> +
>>> +/**
>>> + * drm_sched_free_job_queue_if_ready - queue free job if ready
>>
>>  * drm_sched_free_job_queue_if_ready - enqueue free-job work if ready
>>
> 
> Will change this too.
>  
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
>>>  }
>>>  
>>>  /**
>>> @@ -310,7 +407,7 @@ static void drm_sched_job_done(struct drm_sched_job *s_job, int result)
>>>  	dma_fence_get(&s_fence->finished);
>>>  	drm_sched_fence_finished(s_fence, result);
>>>  	dma_fence_put(&s_fence->finished);
>>> -	drm_sched_submit_queue(sched);
>>> +	drm_sched_free_job_queue(sched);
>>>  }
>>>  
>>>  /**
>>> @@ -885,18 +982,6 @@ void drm_sched_job_cleanup(struct drm_sched_job *job)
>>>  }
>>>  EXPORT_SYMBOL(drm_sched_job_cleanup);
>>>  
>>> -/**
>>> - * drm_sched_can_queue -- Can we queue more to the hardware?
>>> - * @sched: scheduler instance
>>> - *
>>> - * Return true if we can push more jobs to the hw, otherwise false.
>>> - */
>>> -static bool drm_sched_can_queue(struct drm_gpu_scheduler *sched)
>>> -{
>>> -	return atomic_read(&sched->hw_rq_count) <
>>> -		sched->hw_submission_limit;
>>> -}
>>> -
>>>  /**
>>>   * drm_sched_wakeup_if_can_queue - Wake up the scheduler
>>>   * @sched: scheduler instance
>>> @@ -906,43 +991,7 @@ static bool drm_sched_can_queue(struct drm_gpu_scheduler *sched)
>>>  void drm_sched_wakeup_if_can_queue(struct drm_gpu_scheduler *sched)
>>>  {
>>>  	if (drm_sched_can_queue(sched))
>>> -		drm_sched_submit_queue(sched);
>>> -}
>>> -
>>> -/**
>>> - * drm_sched_select_entity - Select next entity to process
>>> - *
>>> - * @sched: scheduler instance
>>> - *
>>> - * Returns the entity to process or NULL if none are found.
>>> - */
>>> -static struct drm_sched_entity *
>>> -drm_sched_select_entity(struct drm_gpu_scheduler *sched)
>>> -{
>>> -	struct drm_sched_entity *entity;
>>> -	int i;
>>> -
>>> -	if (!drm_sched_can_queue(sched))
>>> -		return NULL;
>>> -
>>> -	if (sched->single_entity) {
>>> -		if (!READ_ONCE(sched->single_entity->stopped) &&
>>> -		    drm_sched_entity_is_ready(sched->single_entity))
>>> -			return sched->single_entity;
>>> -
>>> -		return NULL;
>>> -	}
>>> -
>>> -	/* Kernel run queue has higher priority than normal run queue*/
>>> -	for (i = DRM_SCHED_PRIORITY_COUNT - 1; i >= DRM_SCHED_PRIORITY_MIN; i--) {
>>> -		entity = sched->sched_policy == DRM_SCHED_POLICY_FIFO ?
>>> -			drm_sched_rq_select_entity_fifo(&sched->sched_rq[i]) :
>>> -			drm_sched_rq_select_entity_rr(&sched->sched_rq[i]);
>>> -		if (entity)
>>> -			break;
>>> -	}
>>> -
>>> -	return entity;
>>> +		drm_sched_run_job_queue(sched);
>>>  }
>>>  
>>>  /**
>>> @@ -974,8 +1023,10 @@ drm_sched_get_cleanup_job(struct drm_gpu_scheduler *sched)
>>>  						typeof(*next), list);
>>>  
>>>  		if (next) {
>>> -			next->s_fence->scheduled.timestamp =
>>> -				job->s_fence->finished.timestamp;
>>> +			if (test_bit(DMA_FENCE_FLAG_TIMESTAMP_BIT,
>>> +				     &next->s_fence->scheduled.flags))
>>> +				next->s_fence->scheduled.timestamp =
>>> +					job->s_fence->finished.timestamp;
>>>  			/* start TO timer for next job */
>>>  			drm_sched_start_timeout(sched);
>>>  		}
>>> @@ -1025,74 +1076,84 @@ drm_sched_pick_best(struct drm_gpu_scheduler **sched_list,
>>>  EXPORT_SYMBOL(drm_sched_pick_best);
>>>  
>>>  /**
>>> - * drm_sched_main - main scheduler thread
>>> + * drm_sched_free_job_work - worker to call free_job
>>>   *
>>> - * @param: scheduler instance
>>> + * @w: free job work
>>>   */
>>> -static void drm_sched_main(struct work_struct *w)
>>> +static void drm_sched_free_job_work(struct work_struct *w)
>>>  {
>>>  	struct drm_gpu_scheduler *sched =
>>> -		container_of(w, struct drm_gpu_scheduler, work_submit);
>>> -	struct drm_sched_entity *entity;
>>> +		container_of(w, struct drm_gpu_scheduler, work_free_job);
>>>  	struct drm_sched_job *cleanup_job;
>>> -	int r;
>>>  
>>>  	if (READ_ONCE(sched->pause_submit))
>>>  		return;
>>>  
>>>  	cleanup_job = drm_sched_get_cleanup_job(sched);
>>> -	entity = drm_sched_select_entity(sched);
>>> -
>>> -	if (!entity && !cleanup_job)
>>> -		return;	/* No more work */
>>> -
>>> -	if (cleanup_job)
>>> +	if (cleanup_job) {
>>>  		sched->ops->free_job(cleanup_job);
>>>  
>>> -	if (entity) {
>>> -		struct dma_fence *fence;
>>> -		struct drm_sched_fence *s_fence;
>>> -		struct drm_sched_job *sched_job;
>>> -
>>> -		sched_job = drm_sched_entity_pop_job(entity);
>>> -		if (!sched_job) {
>>> -			complete_all(&entity->entity_idle);
>>> -			if (!cleanup_job)
>>> -				return;	/* No more work */
>>> -			goto again;
>>> -		}
>>> +		drm_sched_free_job_queue_if_ready(sched);
>>> +		drm_sched_run_job_queue_if_ready(sched);
>>> +	}
>>> +}
>>> +
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
>>> +	struct dma_fence *fence;
>>> +	struct drm_sched_fence *s_fence;
>>> +	struct drm_sched_job *sched_job;
>>> +	int r;
>>>  
>>> -		s_fence = sched_job->s_fence;
>>> +	if (READ_ONCE(sched->pause_submit))
>>> +		return;
>>>  
>>> -		atomic_inc(&sched->hw_rq_count);
>>> -		drm_sched_job_begin(sched_job);
>>> +	entity = drm_sched_select_entity(sched, true);
>>> +	if (!entity)
>>> +		return;
>>>  
>>> -		trace_drm_run_job(sched_job, entity);
>>> -		fence = sched->ops->run_job(sched_job);
>>> +	sched_job = drm_sched_entity_pop_job(entity);
>>> +	if (!sched_job) {
>>>  		complete_all(&entity->entity_idle);
>>> -		drm_sched_fence_scheduled(s_fence, fence);
>>> +		return;	/* No more work */
>>> +	}
>>>  
>>> -		if (!IS_ERR_OR_NULL(fence)) {
>>> -			/* Drop for original kref_init of the fence */
>>> -			dma_fence_put(fence);
>>> +	s_fence = sched_job->s_fence;
>>>  
>>> -			r = dma_fence_add_callback(fence, &sched_job->cb,
>>> -						   drm_sched_job_done_cb);
>>> -			if (r == -ENOENT)
>>> -				drm_sched_job_done(sched_job, fence->error);
>>> -			else if (r)
>>> -				DRM_DEV_ERROR(sched->dev, "fence add callback failed (%d)\n",
>>> -					  r);
>>> -		} else {
>>> -			drm_sched_job_done(sched_job, IS_ERR(fence) ?
>>> -					   PTR_ERR(fence) : 0);
>>> -		}
>>> +	atomic_inc(&sched->hw_rq_count);
>>> +	drm_sched_job_begin(sched_job);
>>> +
>>> +	trace_drm_run_job(sched_job, entity);
>>> +	fence = sched->ops->run_job(sched_job);
>>> +	complete_all(&entity->entity_idle);
>>> +	drm_sched_fence_scheduled(s_fence, fence);
>>>  
>>> -		wake_up(&sched->job_scheduled);
>>> +	if (!IS_ERR_OR_NULL(fence)) {
>>> +		/* Drop for original kref_init of the fence */
>>> +		dma_fence_put(fence);
>>> +
>>> +		r = dma_fence_add_callback(fence, &sched_job->cb,
>>> +					   drm_sched_job_done_cb);
>>> +		if (r == -ENOENT)
>>> +			drm_sched_job_done(sched_job, fence->error);
>>> +		else if (r)
>>> +			DRM_DEV_ERROR(sched->dev, "fence add callback failed (%d)\n",
>>> +				  r);
>>
>> Please align "r);" to the open brace on the previous line. If you're using Emacs
>> with sane Linux settings, press the "Tab" key anywhere on the line to indent it.
>> (It should run c-indent-line-or-region, usually using leading-tabs-only mode. Pressing
>> it again, over and over, on an already indented line, does nothing. Column indenting--say
>> for columns in 2D/3D/etc., array, usually happens using spaces, which is portable.
>> Also please take an overview with "scrips/checkpatch.pl --strict".)
>>
> 
> Will run checkpatch.
> 
>> Wrap-around was bumped to 100 in the Linux kernel so you can put the 'r' on
>> the same line without style problems.
>>
> 
> Using Vi with wrap around of 80 but know 100 is allowed. Will fix.
Ah, yes--I now see where the real problem is. :-D
-- 
Regards,
Luben

