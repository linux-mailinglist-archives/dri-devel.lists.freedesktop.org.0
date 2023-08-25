Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F1F8B7885A4
	for <lists+dri-devel@lfdr.de>; Fri, 25 Aug 2023 13:28:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4461C10E656;
	Fri, 25 Aug 2023 11:27:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2060a.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eab::60a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0275910E654;
 Fri, 25 Aug 2023 11:27:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZqTF1uS2i5dul9iONQy8ardCZd3wpPPgv82XL7elCjA9kTa3VYP33kkarirLzP3CGkLTCdbfuo9b2oxS0A5jtDv5eYlezJ8Fb7m17kXfcc0jG86webhq3EVzm39r8zEGum7t5AoaE3MJ2TAS0diZjoh2TqrhefM34MKpMA+WVVHEcyIXWec131KtoGmDoCJmaP+yg5P3YTalHgzVEpU6VvlVH3OxuqqTITtpO2O+w57yTQP7I4WPvX21T8kebPWMsXyJpa8ULOJixxBy3XBVHWM6QWy9n7Aaya9cf4SzL+Ue1BTavB16CaamEv2SRT12aLPxLPHglyXzcQJ3cWZIiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kn1ciqVsriXVNIYPNB4GRf2cc1V/suIRJuHbJp/Wl2k=;
 b=RJ79ZUGkZ+1/wvWSR22oFhKraqiWxmORPEWz6RpII9PcWF08bCUrNUAyqXG/HAJNCdD69LJDUeSKmuv1zvbtHya+NQkxnHupxRLRZP1T2FTDyz+FEKP1H0fkrL/kt1OA3ZHiN7BSxo0WfFpIfGiF5/q+LWXnqp5DB9ZuCKmtF4N2BALDoao0FcZmDO/69hojz+xiIiRkFo3Ht7y0oNkDDARq3caskjvS9j2qGG5n6AqDe+/Yf9xoHovEDpphFX3hDjKwi2Lc3ODWzMcVmWeNLtLFuGJTkxtiJ5OaoN53fBnyiPtaCmYokE+Iot/pIwvCbxhvQWwYMgWqiMIdTmSNpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kn1ciqVsriXVNIYPNB4GRf2cc1V/suIRJuHbJp/Wl2k=;
 b=23AlelNv2iiErS4YV2leLYLmU5KfdXcXcMjwFYTtYuU91i0EBpdaFehRtEZdkl4qnBDLS4e4OKBOnn/pwNDT7eCqtpuB0kY0mWy7nOJ1LQsnek47vV0hVjLAgnSmiU1Txgi07Ujd/EbvmJsg9NjOHuSHP8rc9rJO9TZ0wmnDUr4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BYAPR12MB4614.namprd12.prod.outlook.com (2603:10b6:a03:a6::22)
 by LV3PR12MB9185.namprd12.prod.outlook.com (2603:10b6:408:199::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.30; Fri, 25 Aug
 2023 11:27:53 +0000
Received: from BYAPR12MB4614.namprd12.prod.outlook.com
 ([fe80::af11:a0ea:b4e4:d1e0]) by BYAPR12MB4614.namprd12.prod.outlook.com
 ([fe80::af11:a0ea:b4e4:d1e0%5]) with mapi id 15.20.6699.028; Fri, 25 Aug 2023
 11:27:53 +0000
Message-ID: <d135c177-a193-0e91-571f-2a79f6204192@amd.com>
Date: Fri, 25 Aug 2023 16:57:39 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.1
Subject: Re: [PATCH v2 3/7] drm/amdgpu: Add new function to put GPU power
 profile
Content-Language: en-US
To: "Yadav, Arvind" <arvyadav@amd.com>, Arvind Yadav <Arvind.Yadav@amd.com>,
 Christian.Koenig@amd.com, alexander.deucher@amd.com,
 shashank.sharma@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch, Felix.Kuehling@amd.com, amd-gfx@lists.freedesktop.org
References: <20230821064759.94223-1-Arvind.Yadav@amd.com>
 <20230821064759.94223-4-Arvind.Yadav@amd.com>
 <c72a7412-a95a-1a99-f337-f64a789e81bf@amd.com>
 <443129d5-4d40-c777-e488-78393bd35397@amd.com>
 <7a60130d-d398-862e-e9da-2685284eff95@amd.com>
 <782b5c27-8a1c-06a3-9fc2-6c5f9aef4a13@amd.com>
From: "Lazar, Lijo" <lijo.lazar@amd.com>
In-Reply-To: <782b5c27-8a1c-06a3-9fc2-6c5f9aef4a13@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0236.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:eb::20) To BYAPR12MB4614.namprd12.prod.outlook.com
 (2603:10b6:a03:a6::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR12MB4614:EE_|LV3PR12MB9185:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f53fd37-21b2-4260-eba2-08dba55e5229
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BuXgDEje9H03x8nlbBdQmgJbuu6e1YmX2bX6WeSG0Lu3fuEdjm/iC8EP98wbs0nd/pZMQiWnfvKvS0F7VTLm1Z5yFAdTGDJ1w9//hrloKKDKwaZUZbvbahakkQNpJky1oON0cxLL0/LO0WH5n5ChlJ/QtSqHZ/wDGTdsHdoOOEnpgMuQq2z3lS5UXQfWp8SFZ3KsKrYgjLQBObjhwGzQx/yDYE0MPaf5vgT364wyO0IAKWYBIbm0rNgKmZpO5FgXtuKncKl8ZxT19TeiG+7b/0R1m+WSD19rUMWWjbXZxdY/vKIvSeTM64ZkFrin+sKp2Kn3br+DRogJNTb4X0TyB/F2hwNc7Kq8j+ZQOP7yN2kMC6kSiLCROPln8x6LfK4/O+6OAkxA2zZc2EljjxUlYcjYgugAFKH5hA4kFrYpvml/WvyBl2ZulR3LniuB34g4Z3nGtvyLOuY3vXczLSYhFX3aqJUVmTXQDMlNZuLPbZ6Im2BntEo15vVjIyNEcbOdPgeau+YTA4Tqmu6Bw9oWVD8YT8io3UqfjrcnfWSSs02pMLzVpN9rf6NNhrg5fdMzGrxuHF5/dBcVMLx5FbJKq95Djw+snndtL0MDhAVA+xPNZYPZLgUp6cAWnUx6BeDP5Gy9iyXdO4XeVDVUPWzqlc7xICK75SZehGyafru6umY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB4614.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(346002)(366004)(39860400002)(136003)(396003)(186009)(1800799009)(451199024)(6506007)(53546011)(6486002)(6512007)(66899024)(6666004)(83380400001)(921005)(86362001)(31696002)(38100700002)(36756003)(26005)(2616005)(316002)(2906002)(110136005)(66946007)(66556008)(66476007)(41300700001)(30864003)(31686004)(4326008)(8676002)(8936002)(5660300002)(478600001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c0NxR3dZOXlqVmxtT2tkaEJNTmdBY2VVKzlkUDdZTW9xTDUrSjRnZDV5cUM1?=
 =?utf-8?B?NDdEOXZqakdJRFFocml4RlBrSmZyMFJDa1VWcVk5OXF5aEFnZkZzcTliWVc0?=
 =?utf-8?B?c3pIZEJFRHNKOWZKa2I5L295a2o5biszR1M5ZFdxVHd1TmZsTXUzcDlLVUk1?=
 =?utf-8?B?b1J1YWVPQWNpeUNIRWdtWWdVWnRCMlVWREVBa1Ixd1hENFNFQ2tTYnF6cjlt?=
 =?utf-8?B?cVpDdGxFNVVNY2Y1aEd0TWdSdlRBVTVVUmVnemI1TlR2cTlCRG5FTEd6L1Rr?=
 =?utf-8?B?TUJEVUF6RXp4eStEaGY4ak1wMGp4MXIvUC9BSmhLdmppR01aMmVJYk13c0sx?=
 =?utf-8?B?RmJBNFF3b3JpYzA4WHFibjlobzc0OGxRT3l3RCtOWnc3NVBlUW5PbnFjMlIv?=
 =?utf-8?B?bU1zZWFpYkRTZ0ZudjBackhod1NkSW9raUlCS2FocFFjSXJDV0dlb2FaTytv?=
 =?utf-8?B?Y0FGcVdkSmxaTlpDZnFHZFNoWnBGeExTMU9WYXV6dmtTMENhS0hDa0pnQk8y?=
 =?utf-8?B?TDlzelh1Z1hYNGZzRnJxaUlPN2liNnprSjdmSU9mK3hZVDZZZXRoN2xrdjAr?=
 =?utf-8?B?UG9IM3c3WUJ2TEFIOUxpQXlETW1iQldveGlBVi9XRVhkQlZKSUJwOVY4ZmNF?=
 =?utf-8?B?UVQxZ2hLRWxReGNXakJURE9kSDFsSUUxWk5yczBMeTk5S2VlSDFpUWtIRmhB?=
 =?utf-8?B?MkIraUlCNmkrVEpRRFpLN0pydVd3OEJoV0FvNUkzbGtMK2d2SWlLOFF1cXpi?=
 =?utf-8?B?QnhOV2Z2M2xYNHlCSUZQMXZwaExOckJYNDFqSkVKQ2dXb1E0dGRPbmpYam9y?=
 =?utf-8?B?dlczZUpWeTE2NlhySTgzeUJGSnloRG15V3Rid0QwdkQ2Z052MHpoZW1sV0ow?=
 =?utf-8?B?YXhGRmgxL3poeVV3LzVFVTBkMWlqallyV3RZbloyeThQSWt1THZlRG1RM2NS?=
 =?utf-8?B?ZG9TWlJQa0ZSOHhkYUhEZ1dZY3lxejBRcjhHczdxWmxrZ1V5WkxvOVlBUWh4?=
 =?utf-8?B?VmlIcTNBWUxoNGpoeitYMkpSTjhhYk9ManZvODRsb0dIT0NuUVdOZ3RIdkk4?=
 =?utf-8?B?eWlLaEdnVTdNWGl5WkE5OVlrN0hua3dCNkNoM2JuUkZsWW51VVNzQlp0Q293?=
 =?utf-8?B?ZjRjd1NoTk9RMFBFMlFMdEF4d05PUEh1Yk82UWpzN0diVUhHSkpra0lMOXFu?=
 =?utf-8?B?c200djA5OWlUNTFCSGU4UmFyOHBpNW53M2xDQUdLNmk3ZlRJVkd2M2JHaGYz?=
 =?utf-8?B?M2pFTmR2ZDF1ZFVSbVh4bWxXSGp4Tnd5eVhqczhJSVlrYjRoTFNqZDdUQmpK?=
 =?utf-8?B?NEg4dUdPQUNMMVZoWHNVQURUS2kzRytkNk5wNU8rUWdsN1BZNnoyMkIzRnJ4?=
 =?utf-8?B?d2luWGxXUi9EVnhmV3FtMWhMbmJGMkgwUVRkR3h3QTZnSElWekQreDE5dTl1?=
 =?utf-8?B?V1NKM2xYU01QZmlocW9qTHAydG1sY2wxczNVU1Y1RU1UV0ZmY0MxZExHOTUw?=
 =?utf-8?B?QjRWcFJMWml1TFZUNmFxTzRpNVFCWk9FNFFHd3prb3hyZU9LZ2tqV1BNdFRU?=
 =?utf-8?B?eE9XK0w0ZVVYV0FzSjgraXI1TGZsdTkwYnFxYUFpTjUwaUlTcDFrQXhVKy9l?=
 =?utf-8?B?Yi9CYmxoNVdtbWI4SWxONnZOZExNT2ZEcEFCRE1LNGVOMCtqZFlEWU01c0VN?=
 =?utf-8?B?RmR5amlja0NVRTRoZjBUdWh6cFpTV3IzQjRTaUpObmNBSDJOM0Y0WGE1K1U0?=
 =?utf-8?B?ak9yQXZmVGZHcFpCSlZRNjBKY1lJTlI4Vks0ZExNOFloRTRkdzdYV1pXVjRN?=
 =?utf-8?B?ZWErNkhXakhLZ1ovMERLQTh6Ykl2VTVWeUNaUmppREI3TnJWUGJjazBzSHk1?=
 =?utf-8?B?ZS85ZXRVOUNaQXdDS2wzN25XaExZQy91NE1xZ0N4UWk5bnM3TlJMTzRsd0dx?=
 =?utf-8?B?cjFvQVdOQzF6NE1kdGJKbEZHeHhnVEFhYzlTZEdVYTJGUFBBcUxCWTlHM1ho?=
 =?utf-8?B?SVYrN290bEtlaTVBcDVzQTFMR2xJb1VndytlbFhNWmpMSUx0SXRtT1RoOC8r?=
 =?utf-8?B?RjZ3UktpSEs0RmlaU2ZXNVNEdVZRU09ua1Z1YXBJOVVnaFlaRk1EZHV2azNO?=
 =?utf-8?Q?s76R1XX04BJYbgvLQ/dQEunp5?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f53fd37-21b2-4260-eba2-08dba55e5229
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4614.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2023 11:27:52.9485 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c/yc56TwX1gs+EL3e+6m/l4FYLr3nCpEJfo0wdPnYZLffRVGsbTBdQ6h0JNL945T
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9185
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 8/25/2023 4:48 PM, Yadav, Arvind wrote:
> 
> On 8/22/2023 6:16 PM, Lazar, Lijo wrote:
>>
>>
>> On 8/22/2023 5:41 PM, Yadav, Arvind wrote:
>>> Hi Lijo,
>>>
>>> The *_set function will set the GPU power profile and the *_put 
>>> function will  schedule the
>>> smu_delayed_work task after 100ms delay. This smu_delayed_work task 
>>> will clear a GPU
>>> power profile if any new jobs are not scheduled within 100 ms. But if 
>>> any new job  comes within 100ms
>>> then the *_workload_profile_set function  will cancel this work and 
>>> set the GPU power profile based on
>>> preferences.
>>>
>>> Please see the below case.
>>>
>>> case 1 - only same profile jobs run. It will take 100ms to clear the 
>>> profile once all jobs complete.
>>>
>>>                                             wl = VIDEO <100ms>
>>> workload _________|`````````````````````````````````````|____
>>>
>>> Jobs (VIDEO) ________|```|__|```|___|````|___________
>>>
>>>
>>> Case2 - two jobs of two different profile. job1 profile will be set 
>>> but when job2 will arrive it will be moved
>>>          to higher profile.
>>>
>>>                                   wl = VIDEO  ->    wl = COMPUTE <100ms>
>>> workload 
>>> ___|``````````````````````````````````````````````````````````````````|____ 
>>>
>>>
>>> Jobs (VIDEO) ___|```|__|```|___|````|___|````|_______
>>>
>>> Jobs (COMPUTE) ______________|```|___|````|___|````|_________
>>>
>>>
>>>
>>> Case3 - two jobs of two different profile. job1 profile will be set 
>>> but when job2 will arrive it will not be moved
>>> to lower profile. When compute job2 will complete then only it will 
>>> move to lower profile.
>>>
>>>                                               wl = COMPUTE 
>>> ->               wl = VIDEO  <100ms>
>>> workload 
>>> _________|``````````````````````````````````````````````````````````````````|____ 
>>>
>>>
>>> Jobs (COMPUTE)    ____|```|__|```|___|````|___|````|_______
>>>
>>> Jobs (VIDEO) 
>>> ___________________|```|___|````|___|````|___|````|___________
>>>
>>
>> swsmu layer maintains a workload mask based on priority. So once you 
>> have set the mask, until you unset it (i.e when refcount = 0), the 
>> mask will be set in the lower layer. swsmu layer will take care of 
>> requesting FW the highest priority. I don't think that needs to be 
>> repeated at this level.
>>
>> At this layer, all you need is to refcount the requests and make the 
>> request.
>>
>> When refcount of a profile becomes non-zero (only one-time), place one 
>> request for that profile. As swsmu layer maintains the workload mask, 
>> it will take the new profile also into consideration while requesting 
>> for the one  with the highest priority.
>>
>> When refcount of a profile becomes zero, place a request to clear it. 
>> This is controlled by your idle work. As I see, it keeps an additional 
>> 100ms tolerance before placing a clear request. In that way, there is 
>> no need to cancel that work.
>>
>> Inside idle work handler -
>> Loop through the profiles that are set and clear those profiles whose 
>> refcount is zero.
>>
>> Thus if a job starts during the 100ms delay, idle work won't see the 
>> ref count as zero and then it won't place a request to clear out that 
>> profile.
>>
> Hi Liji,
> 
> Thank you for your comment. We would be considering your comment but we 
> would retain the same design.
> 

All things aside, the entire idea of switching power profile for every 
job submission on a ring looks like an 'abuse' of the power profile 
design. The goal of power profile is to keep a specific profile for a 
sustained workload - like gaming mode, cinema mode etc. It's not meant 
for like switch profile with every job submission which lasts ms or 
lesser (though you may argue it takes only highest priority profile). 
This design is to keep interrupting FW every now and then thinking 
driver is doing better. For any normal/mixed use scenarios, FW 
algorithms could handle it better with all the activity monitors they have.

If you are going ahead, please also make sure to post the improved 
performance numbers you are getting with this.

Thanks,
Lijo

> ~Arvind.
> 
>>> On 8/22/2023 10:21 AM, Lazar, Lijo wrote:
>>>>
>>>>
>>>> On 8/21/2023 12:17 PM, Arvind Yadav wrote:
>>>>> This patch adds a function which will clear the GPU
>>>>> power profile after job finished.
>>>>>
>>>>> This is how it works:
>>>>> - schedular will set the GPU power profile based on ring_type.
>>>>> - Schedular will clear the GPU Power profile once job finished.
>>>>> - Here, the *_workload_profile_set function will set the GPU
>>>>>    power profile and the *_workload_profile_put function will
>>>>>    schedule the smu_delayed_work task after 100ms delay. This
>>>>>    smu_delayed_work task will clear a GPU power profile if any
>>>>>    new jobs are not scheduled within 100 ms. But if any new job
>>>>>    comes within 100ms then the *_workload_profile_set function
>>>>>    will cancel this work and set the GPU power profile based on
>>>>>    preferences.
>>>>>
>>>>> v2:
>>>>> - Splitting workload_profile_set and workload_profile_put
>>>>>    into two separate patches.
>>>>> - Addressed review comment.
>>>>>
>>>>> Cc: Shashank Sharma <shashank.sharma@amd.com>
>>>>> Cc: Christian Koenig <christian.koenig@amd.com>
>>>>> Cc: Alex Deucher <alexander.deucher@amd.com>
>>>>> Signed-off-by: Arvind Yadav <Arvind.Yadav@amd.com>
>>>>> ---
>>>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_workload.c  | 97 
>>>>> +++++++++++++++++++
>>>>>   drivers/gpu/drm/amd/include/amdgpu_workload.h |  3 +
>>>>>   2 files changed, 100 insertions(+)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_workload.c 
>>>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_workload.c
>>>>> index e661cc5b3d92..6367eb88a44d 100644
>>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_workload.c
>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_workload.c
>>>>> @@ -24,6 +24,9 @@
>>>>>     #include "amdgpu.h"
>>>>>   +/* 100 millsecond timeout */
>>>>> +#define SMU_IDLE_TIMEOUT    msecs_to_jiffies(100)
>>>>> +
>>>>>   static enum PP_SMC_POWER_PROFILE
>>>>>   ring_to_power_profile(uint32_t ring_type)
>>>>>   {
>>>>> @@ -59,6 +62,80 @@ amdgpu_power_profile_set(struct amdgpu_device 
>>>>> *adev,
>>>>>       return ret;
>>>>>   }
>>>>>   +static int
>>>>> +amdgpu_power_profile_clear(struct amdgpu_device *adev,
>>>>> +               enum PP_SMC_POWER_PROFILE profile)
>>>>> +{
>>>>> +    int ret = amdgpu_dpm_switch_power_profile(adev, profile, false);
>>>>> +
>>>>> +    if (!ret) {
>>>>> +        /* Clear the bit for the submitted workload profile */
>>>>> +        adev->smu_workload.submit_workload_status &= ~(1 << profile);
>>>>> +    }
>>>>> +
>>>>> +    return ret;
>>>>> +}
>>>>> +
>>>>> +static void
>>>>> +amdgpu_power_profile_idle_work_handler(struct work_struct *work)
>>>>> +{
>>>>> +
>>>>> +    struct amdgpu_smu_workload *workload = container_of(work,
>>>>> +                              struct amdgpu_smu_workload,
>>>>> +                              smu_delayed_work.work);
>>>>> +    struct amdgpu_device *adev = workload->adev;
>>>>> +    bool reschedule = false;
>>>>> +    int index  = fls(workload->submit_workload_status);
>>>>> +    int ret;
>>>>> +
>>>>> +    mutex_lock(&workload->workload_lock);
>>>>> +    for (; index > 0; index--) {
>>>>
>>>> Why not use for_each_set_bit?
>>>
>>> We are clearing which we have only set it. We will clear first higher 
>>> profile then lower.
>>>
>>
>> You don't need to do take care of this. swsmu layer will take care of 
>> the priority. It is not the job of this layer to take care of 
>> priority. swsmu is the layer that could be altered specific to each 
>> SOC, and that can take care of any priority changes accordingly. This 
>> layer only needs to ref count the requests and place accordingly.
>>
>>>
>>>>
>>>>> +        int val = atomic_read(&workload->power_profile_ref[index]);
>>>>> +
>>>>> +        if (val) {
>>>>> +            reschedule = true;
>>>>
>>>> Why do you need to do reschedule? For each put(), a schedule is 
>>>> called. If refcount is not zero, that means some other job has 
>>>> already set the profile. It is supposed to call put() and at that 
>>>> time, this job will be run to clear it anyway, right?
>>>>
>>> Yes, I have got the comment for this I am going to remove this.
>>> Noted.
>>>
>>>>> +        } else {
>>>>> +            if (workload->submit_workload_status &
>>>>> +                (1 << index)) {
>>>>> +                ret = amdgpu_power_profile_clear(adev, index);
>>>>> +                if (ret) {
>>>>> +                    DRM_WARN("Failed to clear workload %s,error = 
>>>>> %d\n",
>>>>> +                         amdgpu_workload_mode_name[index], ret);
>>>>> +                    goto exit;
>>>>> +                }
>>>>> +            }
>>>>> +        }
>>>>> +    }
>>>>> +    if (reschedule)
>>>>> + schedule_delayed_work(&workload->smu_delayed_work,
>>>>> +                      SMU_IDLE_TIMEOUT);
>>>>> +exit:
>>>>> +    mutex_unlock(&workload->workload_lock);
>>>>> +}
>>>>> +
>>>>> +void amdgpu_workload_profile_put(struct amdgpu_device *adev,
>>>>> +                 uint32_t ring_type)
>>>>> +{
>>>>> +    struct amdgpu_smu_workload *workload = &adev->smu_workload;
>>>>> +    enum PP_SMC_POWER_PROFILE profile = 
>>>>> ring_to_power_profile(ring_type);
>>>>> +
>>>>> +    if (profile == PP_SMC_POWER_PROFILE_BOOTUP_DEFAULT)
>>>>> +        return;
>>>>> +
>>>>> +    mutex_lock(&workload->workload_lock);
>>>>> +
>>>>> +    if (!atomic_read(&workload->power_profile_ref[profile])) {
>>>>> +        DRM_WARN("Power profile %s ref. count error\n",
>>>>> +             amdgpu_workload_mode_name[profile]);
>>>>> +    } else {
>>>>> + atomic_dec(&workload->power_profile_ref[profile]);
>>>>> + schedule_delayed_work(&workload->smu_delayed_work,
>>>>> +                      SMU_IDLE_TIMEOUT);
>>>>> +    }
>>>>> +
>>>>> +    mutex_unlock(&workload->workload_lock);
>>>>> +}
>>>>> +
>>>>>   void amdgpu_workload_profile_set(struct amdgpu_device *adev,
>>>>>                    uint32_t ring_type)
>>>>>   {
>>>>> @@ -70,13 +147,30 @@ void amdgpu_workload_profile_set(struct 
>>>>> amdgpu_device *adev,
>>>>>           return;
>>>>>         mutex_lock(&workload->workload_lock);
>>>>> + cancel_delayed_work_sync(&workload->smu_delayed_work);
>>>>
>>>> This is a potential deadlock. You already hold the mutex and then 
>>>> waiting for idle work to finish. Idle work could now be at the point 
>>>> where it is waiting for the same mutex. Suggest not to call cancel 
>>>> here and let the mutex take care of the sequence.
>>> We cannot cancel if idle work is running. So we have to wait until 
>>> ideal work is complete. If *put function arrived before ideal work is 
>>> not stated then we can cancel it. but if it is running work thread we 
>>> should wait.
>>
>> No need to wait, because you already have a mutex. So you will be 
>> waiting naturally for the mutex lock to be released (if at all idle 
>> work already grabbed it). If a request comes in at the time while idle 
>> work is running it is only a timing issue.
>>
>> Also you have a deadlock here. Here you acquired the mutex first and 
>> then waiting for the idle work to finish. The idle work function would 
>> have just started at that point and reached to the place where it is 
>> going to grab mutex. That is a deadlock. This function is waiting for 
>> idle work to finish and idle work is waiting to get the mutex.
>>
>> Nevertheless, this function doesn't even need to take care of such 
>> fancy things. It only grabs the mutex and increases the refcount, 
>> places a request if refcount became non-zero.
>>
>> At whatever point, idle work runs, it will see that the refcount is 
>> not zero and skips placing a request to clear that profile.
>>
>>>>
>>>>>         ret = amdgpu_power_profile_set(adev, profile);
>>>>>       if (ret) {
>>>>>           DRM_WARN("Failed to set workload profile to %s, error = 
>>>>> %d\n",
>>>>>                amdgpu_workload_mode_name[profile], ret);
>>>>> +        goto exit;
>>>>> +    }
>>>>> +
>>>>> +    /* Clear the already finished jobs of higher power profile*/
>>>>> +    for (int index = fls(workload->submit_workload_status);
>>>>> +         index > profile; index--) {
>>>>> +        if (!atomic_read(&workload->power_profile_ref[index]) &&
>>>>> +            workload->submit_workload_status & (1 << index)) {
>>>>> +            ret = amdgpu_power_profile_clear(adev, index);
>>>>> +            if (ret) {
>>>>> +                DRM_WARN("Failed to clear workload %s, err = %d\n",
>>>>> +                     amdgpu_workload_mode_name[profile], ret);
>>>>> +                goto exit;
>>>>> +            }
>>>>> +        }
>>>>
>>>> If you follow the earlier comment, that will keep this logic only at 
>>>> one place - i.e, at idle work handler. Basically just let the idle 
>>>> work handle its duty. If some job starts running during the clear 
>>>> call, it's just unfortunate timing and let the next set() take the 
>>>> lock and request profile again.
>>>
>>> So basically for every millisecond  new jobs are coming and 
>>> completing it to the same or different profile . Suppose we are 
>>> running higher profile jobs and  before it completes if a lower job 
>>> arrives, this check will help to move the higher profile to lower 
>>> profile once higher profile finishes it. If we are not checking here 
>>> then it will stuck on higher profile until then other jobs will also 
>>> not complete. Please refer case3 scenario.
>>>
>>
>> As mentioned before, this is not the place to take care of SOC 
>> specific power profile priorities. We already have swsmu layer doing 
>> that job. This layer just needs to do a ref count and place requests 
>> accordingly.
>>
>> Thanks,
>> Lijo
>>
>>>
>>>> Thanks,
>>>> Lijo
>>>>
>>>>>       }
>>>>>   +exit:
>>>>>       mutex_unlock(&workload->workload_lock);
>>>>>   }
>>>>>   @@ -87,6 +181,8 @@ void amdgpu_workload_profile_init(struct 
>>>>> amdgpu_device *adev)
>>>>>       adev->smu_workload.initialized = true;
>>>>> mutex_init(&adev->smu_workload.workload_lock);
>>>>> + INIT_DELAYED_WORK(&adev->smu_workload.smu_delayed_work,
>>>>> +              amdgpu_power_profile_idle_work_handler);
>>>>>   }
>>>>>     void amdgpu_workload_profile_fini(struct amdgpu_device *adev)
>>>>> @@ -94,6 +190,7 @@ void amdgpu_workload_profile_fini(struct 
>>>>> amdgpu_device *adev)
>>>>>       if (!adev->smu_workload.initialized)
>>>>>           return;
>>>>>   + cancel_delayed_work_sync(&adev->smu_workload.smu_delayed_work);
>>>>>       adev->smu_workload.submit_workload_status = 0;
>>>>>       adev->smu_workload.initialized = false;
>>>>> mutex_destroy(&adev->smu_workload.workload_lock);
>>>>> diff --git a/drivers/gpu/drm/amd/include/amdgpu_workload.h 
>>>>> b/drivers/gpu/drm/amd/include/amdgpu_workload.h
>>>>> index 5022f28fc2f9..ee1f87257f2d 100644
>>>>> --- a/drivers/gpu/drm/amd/include/amdgpu_workload.h
>>>>> +++ b/drivers/gpu/drm/amd/include/amdgpu_workload.h
>>>>> @@ -46,6 +46,9 @@ static const char * const 
>>>>> amdgpu_workload_mode_name[] = {
>>>>>       "Window3D"
>>>>>   };
>>>>>   +void amdgpu_workload_profile_put(struct amdgpu_device *adev,
>>>>> +                 uint32_t ring_type);
>>>>> +
>>>>>   void amdgpu_workload_profile_set(struct amdgpu_device *adev,
>>>>>                    uint32_t ring_type);
