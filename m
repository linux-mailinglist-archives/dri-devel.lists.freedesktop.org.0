Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94E1D7CACFF
	for <lists+dri-devel@lfdr.de>; Mon, 16 Oct 2023 17:10:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E408F10E21B;
	Mon, 16 Oct 2023 15:10:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2074.outbound.protection.outlook.com [40.107.243.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCDC510E21A;
 Mon, 16 Oct 2023 15:10:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gpurXZo+7Hxl+OU+5tsUadQFEto5BK9uh+zQ9uBgXWVFyqvNVgwdJNIxRPepeQpwJNHVEJL8Yh0Cbrzk5KbJsgMJLr0Pw8SopgOUaySnyAyfdRHWHiILwobscZ4QY9cG/TenSwrjKrw0WSxFtYFaZA4YlX8ttBQKUEBzE5bjge9E1sTL1dDq4ydFuLkwxQtPEHXo1UyMl3cRaQib3Rlc8+UKY76EH3QS/yKJvHKk66U7yT2U+dzw/mlHJ5XBuzto95AukTCT40E/RTTLyCEAsEspGxe0o754nlPXmj5vIfuB7ECOBltxE2t2AYBoX4k3gGiR1wO9HHkmtA0z+TwGvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/ub9n0txftgQuK7xFCWAClmToMj5nslBQCx3YHnEIpg=;
 b=gEDQXtuMChSiOa9feHa5+WC7rKVPydWKvpVILD4M9pebe4fxtiqrTYrJGujoxdNAa8z6zEVqUorV0p2Bt2DJQTQ+ICZgTCfDyB/X+B1Kjms9rMb5Lt950Kaqz+MsgCYHZ4uGzfCnfdHA/traD+YZqZy9YS7vG39ICQRBj0b+PrtmJsEPaX3Ee59LM/arKrAFSzgwuSLd3ichn8kjirYqSDPNJAQcS3C0AU8O+RJRFdbfFReJqT0KLocBQspSpXfKr844eNwX8/4KrTrDReXBjdsZHI02umBbdNYp/JfOs4awMvE/dtyy4EaKPT63xUJ9uYDT5bb/UeltCKC83h3zjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/ub9n0txftgQuK7xFCWAClmToMj5nslBQCx3YHnEIpg=;
 b=ACBd5NC3Yx1Opt3F2yGEmdgddqXZZ+oHhlHWm/2h2lpAd0HIhPDBfxcChsZW1wAZlmxMkkeEoQ2mXByTYrYDyVlKGFCrG67K3N49Jpr3V7iCAeMqDOr3Tu9Ql/MzK4aitzfK1YjTxjalxlX2zAX96oA5Auy4V9QfJbgxUhluObA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3370.namprd12.prod.outlook.com (2603:10b6:5:38::25) by
 SJ1PR12MB6122.namprd12.prod.outlook.com (2603:10b6:a03:45b::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.35; Mon, 16 Oct
 2023 15:10:25 +0000
Received: from DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::b80b:7138:6ceb:9aef]) by DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::b80b:7138:6ceb:9aef%5]) with mapi id 15.20.6886.034; Mon, 16 Oct 2023
 15:10:25 +0000
Message-ID: <1bca31b0-55aa-44e9-9bfd-58eff096098e@amd.com>
Date: Mon, 16 Oct 2023 11:10:21 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:115.0) Gecko/20100101
 Thunderbird/115.3.2
Subject: Re: [PATCH v5 4/7] drm/sched: Add DRM_SCHED_POLICY_SINGLE_ENTITY
 scheduling policy
Content-Language: en-CA, en-US
To: Matthew Brost <matthew.brost@intel.com>
References: <20231011235826.585624-1-matthew.brost@intel.com>
 <20231011235826.585624-5-matthew.brost@intel.com>
 <f8316e1e-a4c8-46a3-83b8-2971d242fc7e@amd.com>
 <ZS1QHW9Y0iYPrFJ0@DUT025-TGLU.fm.intel.com>
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
In-Reply-To: <ZS1QHW9Y0iYPrFJ0@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQXP288CA0007.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:c00:41::22) To DM6PR12MB3370.namprd12.prod.outlook.com
 (2603:10b6:5:38::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB3370:EE_|SJ1PR12MB6122:EE_
X-MS-Office365-Filtering-Correlation-Id: b51729e5-cf4f-4e00-8124-08dbce5a0656
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9cypIyRMlzy22YpP7zUW53NLUT9SVyiCdxMQ8+3aTf6GVoHmaobDylvXByvU3gMTYa0sjsfGcnTqHTTbesassEpOWjd3jOPAR4cfvHhmrRGVZ+XTqTMg/5M6QU3Hfg6Fp3Pwf4ccBRhaKQ7ed3z/MS0/heNaZM7uA7C4p6W19T7rfXrxEC2fOIhTvo3g0yCGump8V8DBZK9lh7X8Kl6HQDgNDBvhWmxF/TwNP047Q14KJJeI5v0Hq9ES3UXgvvu2LcPSTcvAH8kkaduNBHjDDy5VLGFdVYjqkYFjKfE0xmsX9gqkzm1c3VTPeTSprW3V7qe/Z/W4HX6i0cqhXi5tcPwsM7uQVKJDCmHD8CWhtujXMGnE/6UQbvW8akIZNfEIFrxMxCf5B0HGjmJg+TxS5SuXK3vuOlNqDGblZ1LKcizy40udg5WdmyFD2IXmft/Dq2PoJzokM5BJ6L0xmFM/i+Jh8IwHAfNrRYm1Hj3WM24bTdIn+bhl5T6Ws3W+sYy5YhgkfhrnBb9480X6K2hdUc6xCbaEQH/FOkrhsOWqJ9+1mbjhz9Gpxc7wV1OCOXGVxjE7FbgHJbZt5XiAY4qX6wQ+ukMIebqTofs1zypsvoVKCyFZXOQ5Gpy8pNn592DVDNIeG6zJdgBiUkGH+mz4PQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3370.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(376002)(366004)(136003)(346002)(396003)(230922051799003)(1800799009)(186009)(64100799003)(451199024)(6486002)(2616005)(478600001)(66476007)(66556008)(66946007)(316002)(6916009)(6506007)(26005)(53546011)(6512007)(41300700001)(4326008)(8676002)(8936002)(5660300002)(7416002)(4001150100001)(44832011)(2906002)(31696002)(86362001)(6666004)(36756003)(83380400001)(38100700002)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NTU5TGJTeFZnQWVqRmpkSmFleGtHTm1vMlRESkhTNFduSytZRjVLSXhvaitE?=
 =?utf-8?B?WGRYOFltaXNXd3VaNHRHMzd5QUNQTmJsQ3huRzFvbXFraEtzRFo1Ky9RdjJS?=
 =?utf-8?B?Vzd6bEpObGRoY2E3c1dqbXlzWlJJdkluUG1ySVNXNlZ4WkpRdXpUVEN0Y0ZP?=
 =?utf-8?B?dThlaVppZm80OU44VlpkUDAvenkycmQyUk8veG43c1JiSVhycFhzaFNBeHBy?=
 =?utf-8?B?VzFIUFFjM0YveThEKzduRWtZbWlrR08yb25FaVBRY2dMKzBGcGs0Sm5MWnhi?=
 =?utf-8?B?Z3BJaVUxL2lEYmVLeGdsY1RuRllCaEZJUW1IVW5VeXI1N243ZzRDVDZQVWZH?=
 =?utf-8?B?c3VqS0tJZ2ErZ1JpQkRkSk9IZTZQazY3TGtkSFgrdmJWZVlYQzc1eHlFbGox?=
 =?utf-8?B?OUExT29Ld1VHcEl0N1UxbVVFQXp1Sjd4QVdZUTROWmpGdkNOYVZrNDJXZDg3?=
 =?utf-8?B?N0FXeE1GN25KUElwZnJmVmVnYzBkR2NSS0FkeTZ3MjArNkREVlVZWFV6VjdP?=
 =?utf-8?B?UVJETWY2TFV1aDljVTB3T1N5K00wUnR3VFVkUlNTY204V1JZVnI3aGFaMHdJ?=
 =?utf-8?B?VGxobUdCd2ZDaHc1cUNJUlpNa245bnhIcks1VVA1Tkw4b2ptR0hNaE5zWTVn?=
 =?utf-8?B?ZTJUUUlxZmtIYXBDK2pLV0tMSXExVjgyUDY2RmFZMXNzb00yVWVGMSs0bmxD?=
 =?utf-8?B?ODcweTN6cGlFdXNTQ0ZRSzFILzZ3OWNqM1AwTkp5ZGI0d2NTS2t2L2ZUQ2lF?=
 =?utf-8?B?cEM3QUt5THppYTRXSmplLy9VQ3MxdG94SXJ5M3pLQUhoY2ZFQjdvcm9HQjVl?=
 =?utf-8?B?ZTRHVGhOQ05sN21hTGdUZXJHdmNtSkJqVXZ2bnVQdjkremx5cm1aVjBoOXlr?=
 =?utf-8?B?M0xwdkk4cGxkcEZ1VzVSRU1NcWxVbk11dll4bkttOUVlbGR3RGhxUnc3WUlz?=
 =?utf-8?B?UWtMRHJzejFMZ1hSUEZ4MmFITk8zZEs2WEMxblY1TElwR29lVmc2dGp5NUhM?=
 =?utf-8?B?aDZHOEhycnViMHhlSGZaSHRsOTRWZ09sOTBEbkNISk9Pdm1Nbi92VWE4b1FM?=
 =?utf-8?B?b003ZVdaNmQ5U2pEdHgyRjlpZzUzWi9LYXJDMHpuL2FITFNoYy94MS9mKzJk?=
 =?utf-8?B?ZXVUZExRU2dsQ2loQzFsN2hGckRZNXg0Y1VncXM4UVVSbkI3dkZ6ZGhOZVNR?=
 =?utf-8?B?UXBxRmoycGdkeXpSYzhzSHBjNjFYcUM1dEpSekhrNnpIQVhGTFBOOHNUY2x2?=
 =?utf-8?B?M3VrNldxQmp6N0xxYyt2U21Ub2tvaFlmVytQTkxrblNLbGJVTmRaRjVLQmJr?=
 =?utf-8?B?ZmZ5UTJ5UTl0eWJmVlMrK2pwUTNFNFZMdEhYalI3VTZFSzRwaEcyQVpBZVF0?=
 =?utf-8?B?dmZraGJsdGp1dHlnWkFucXBMNzREU0pDNWlmcWhLaHNJbUFBbENsaVdFT0pL?=
 =?utf-8?B?TENFQ3RTajVLN08yak9QTnJublhJZE1XK3dIVFJJbENidDhEaVdVS3BTR0l0?=
 =?utf-8?B?dit2LzlWS2JYVGtHRVlFTXhYeThOL2hMdURkY0gwN01ZRzQzVnptSWIxUlZJ?=
 =?utf-8?B?dlVabXRDWDNGNmhjUGd6Y0RQVktqOWEvd0tGUklyM3gxMm1mUWJuUzlzY09P?=
 =?utf-8?B?MnZ0bTVEME5jNnJTR0FWV2FzTW13b21WdmZyWWVJaE94RlhXSkowemx3cDNv?=
 =?utf-8?B?RzVVV01tR2VwUGpyeGh0d01BSjd3Wndtbkk3QjlYQzZmUGR3eGlXUjBIT2dw?=
 =?utf-8?B?N1dQNWJ4RytNajJac0ZnbjRZbnh1VHVHeFMxQUZrV3lzUmo0U2d6bUtuRGhE?=
 =?utf-8?B?NG1SL0Nsc21udThhWjRydWR5c0kwRDRnRUFMVzdIaTdDYlJYREhheGs3N0Y2?=
 =?utf-8?B?TmpOZTRxNWhkVHpXOVVuNUZSQjUxRDhCWEtnWWErS2Q5b1pHZE5GYnRjY2xI?=
 =?utf-8?B?N1lvMS9nc2gxS1lnd2FKSVJIS3hJSG1NTWVRUUNOWHZOU3k4MDNHQXJvV251?=
 =?utf-8?B?ei8zdUJ0cUR3RlJBL0hCQ0RlNGw0Y3VSRS9yN3JpdTJIMjVpaUpnQ3RNTE9N?=
 =?utf-8?B?VDFHeHNhVmtBMndmQ29iUTI3K25xWjN5bGFPaDR3Y0ZFK09KSlh4cksrWXMv?=
 =?utf-8?Q?Mpwo=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b51729e5-cf4f-4e00-8124-08dbce5a0656
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3370.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2023 15:10:25.3287 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nte8voiZI5rRpPhBNqex4RAGrhnKyrBwLaaIl4rrB+AS1HSntHwgDW4uNin0+WhH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6122
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

On 2023-10-16 11:00, Matthew Brost wrote:
> On Fri, Oct 13, 2023 at 10:06:18PM -0400, Luben Tuikov wrote:
>> On 2023-10-11 19:58, Matthew Brost wrote:
>>> DRM_SCHED_POLICY_SINGLE_ENTITY creates a 1 to 1 relationship between
>>> scheduler and entity. No priorities or run queue used in this mode.
>>> Intended for devices with firmware schedulers.
>>>
>>> v2:
>>>   - Drop sched / rq union (Luben)
>>> v3:
>>>   - Don't pick entity if stopped in drm_sched_select_entity (Danilo)
>>> v4:
>>>   - Rework if statement in drm_sched_entity_init (Luben)
>>>   - Update comment for drm_sched_entity_to_scheduler (Luben)
>>>   - Reword a few things in DOC comment (Luben)
>>>   - Do not check sched policy in for statement (Luben)
>>>
>>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>>> ---
>>>  drivers/gpu/drm/scheduler/sched_entity.c | 70 ++++++++++++++-----
>>>  drivers/gpu/drm/scheduler/sched_fence.c  |  2 +-
>>>  drivers/gpu/drm/scheduler/sched_main.c   | 86 ++++++++++++++++++------
>>>  include/drm/gpu_scheduler.h              |  8 +++
>>>  4 files changed, 131 insertions(+), 35 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
>>> index cf42e2265d64..1ef3883764f9 100644
>>> --- a/drivers/gpu/drm/scheduler/sched_entity.c
>>> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
>>> @@ -83,6 +83,7 @@ int drm_sched_entity_init(struct drm_sched_entity *entity,
>>>  	memset(entity, 0, sizeof(struct drm_sched_entity));
>>>  	INIT_LIST_HEAD(&entity->list);
>>>  	entity->rq = NULL;
>>> +	entity->single_sched = NULL;
>>>  	entity->guilty = guilty;
>>>  	entity->num_sched_list = num_sched_list;
>>>  	entity->priority = priority;
>>> @@ -90,8 +91,18 @@ int drm_sched_entity_init(struct drm_sched_entity *entity,
>>>  	RCU_INIT_POINTER(entity->last_scheduled, NULL);
>>>  	RB_CLEAR_NODE(&entity->rb_tree_node);
>>>  
>>> -	if(num_sched_list)
>>> -		entity->rq = &sched_list[0]->sched_rq[entity->priority];
>>> +
>>
>> ^ This adds an extra blank line and scripts/checkpatch.pl rejects it.
>>
> 
> Agree this isn't correct, will fix.
> 
> Question - catch patch doesn't complain for me though. Wondering what I
> am missing:
> 
> mbrost@lstrano-desk:drivers.gpu.i915.drm-intel$ ./scripts/checkpatch.pl drivers/gpu/drm/i915/0004-drm-sched-Add-DRM_SCHED_POLICY_SINGLE_ENTITY-schedul.patch
> total: 0 errors, 0 warnings, 386 lines checked
> 
> drivers/gpu/drm/i915/0004-drm-sched-Add-DRM_SCHED_POLICY_SINGLE_ENTITY-schedul.patch has no obvious style problems and is ready for submission.

Use this "--strict --emacs --show-types --codespell".
-- 
Regards,
Luben

