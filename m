Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C50894E396E
	for <lists+dri-devel@lfdr.de>; Tue, 22 Mar 2022 08:13:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F3FF10E520;
	Tue, 22 Mar 2022 07:13:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2089.outbound.protection.outlook.com [40.107.94.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E137A10E520
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Mar 2022 07:13:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FaBfIAFQILuYVqMrmK44C7vOwdmSsMdwzAWxT3wjQbqT54sEQdO3fAtN6m6BXDj1tOLdyTM0d2vPZvdT5q5Sr6VfN9wPIOka/xJnbBXNNlHPva9mpornPh/pMdRKYMMAEZqeXrZP9FYfPD/9ZnpwkY7jjooIArDC35VGXC+mGj9O+tsELat5lOpIgQ793aOW5I0RIEzK0bRch3iFqaWfLBl6VetNG4o/ON2UrKNlkxHuMeCa3Iva4aTuO/RgorKHWnngZEb0dtDBh6l5TgRP7BTI2REkVFcS7L2ld34gfPR9Vc69btTMPxGi4mDYNf9vuOeI1cGWhtzQS6UAZowL/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7g4+bpy78HgsTAutx8oIBMtrz4OVB/RSnp1u3ywCVDw=;
 b=QbLPyWkL1XuSXNO0MSgLUNPg7pR9wEccR/8W+IQA7ZGfkURFJK2tg8LWC+UXhsazTLqaJ6cc3RbUdv7wq14K8Z3ziZ9d/Vl1Ji1sSTIwHN3vS/Uo2o3EvCj8+RYXtVNC/6oiZwUQQhea+9Riy0yITSivj/9kQ/uMBGuaM12nXsMRb0b4howOX69UDUGW7Rf5WKvpJ9LZBAMiUemcSBIkV/oITHjxRLt463u21easpUuXQPC3xbxrpEhM0xTOdGAMrRHKNIaICc4vdG6hfCZctLuvxWV9ujSHvzHzSa6Mdzmq4KWTRkPL2tIpmWM98SVSihgl0O3IlTtYG+wilLiblQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7g4+bpy78HgsTAutx8oIBMtrz4OVB/RSnp1u3ywCVDw=;
 b=MqSeGI6uMDxZoX2FREgBqfy5I+qse/Umuzjxq8pE86MfyWh5iDIyE30wdXP5hbklWFscJEmhNjzwtW7FlL1K/eowgu4ts9288dy0+CJOJbV63i4vFxYuEfXqNca82qutHsaVh4ijM8nLnmbj84t9mYwAAHo0OJmc7GzQ8NkxDXM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by DM6PR12MB3658.namprd12.prod.outlook.com (2603:10b6:5:1c8::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.17; Tue, 22 Mar
 2022 07:13:43 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::404f:1fc8:9f4c:f185]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::404f:1fc8:9f4c:f185%6]) with mapi id 15.20.5081.023; Tue, 22 Mar 2022
 07:13:43 +0000
Message-ID: <83e6554b-10f4-6fbb-3cb5-4e08ae52e0a7@amd.com>
Date: Tue, 22 Mar 2022 08:13:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 07/23] drm/vmwgfx: stop using dma_resv_excl_fence
Content-Language: en-US
To: Zack Rusin <zackr@vmware.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "daniel.vetter@ffwll.ch" <daniel.vetter@ffwll.ch>,
 "ckoenig.leichtzumerken@gmail.com" <ckoenig.leichtzumerken@gmail.com>
References: <20220321135856.1331-1-christian.koenig@amd.com>
 <20220321135856.1331-7-christian.koenig@amd.com>
 <91bd73763a87c3311d8cc4878589f80a712c4574.camel@vmware.com>
 <ce7aef7c-01e8-d0d3-ca20-e0682400ecfd@amd.com>
 <a4e761e3145685953c2246cd6ac60b1da521b756.camel@vmware.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <a4e761e3145685953c2246cd6ac60b1da521b756.camel@vmware.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM5PR0201CA0017.eurprd02.prod.outlook.com
 (2603:10a6:203:3d::27) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 357df4e0-fd4e-4d7a-f73a-08da0bd37f2f
X-MS-TrafficTypeDiagnostic: DM6PR12MB3658:EE_
X-Microsoft-Antispam-PRVS: <DM6PR12MB3658D6A3E1410A5B9AA5076F83179@DM6PR12MB3658.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kRtM3PY4HdzlvUMsYxQ4Ahq7BlH14MZCrSYA7zv5wJYfHVZaUc6DRwRp0wcYgCm+F7uZsOP1ta2bIBuGe46pN2ujcDY7sOwaMTHyGHnGhjpXeDK/EBfC13gs/yvB2l5R6JpsC7J8CUdHxJA5UIxLGanb+fVxCw2QqQ4eoXfg+Ajaz7cRvLM0gwr+ETTYAd3L4pADXrM4NKdDO+Hi6heAtpr2uWtoPwOwC4ZADJ+xNIA379xOyVXiGFPH6RW/ZNE6TeoTB+X4JlM9FacRmGNVh6s2sz7KndkKkgPi4YXPSfNYWL2E+cykWc7n2qb/93vYb0rFl25MlkCyL/tOSuZoIJhCwSkR30sK2fmuZ3EpVKIkzQua1PGxhS9WiOdrXp6I7e0/6j8zshadk/Tv0scz9BYjT9Sd3w3QGW+yRENKelvCuvzFK0WTBofqIHPYvGMIU96NatWCuP9XzeP4h/fRozEnq6tvuP+p9NyjdZuRI+M/EMq+E/U0y8FJrIMwd68Xa0seGKfCyztdZXOgsMo0T+hpgp7By4F+PZ/bu+eIsRlS5aVx80ACoaGdW8VKstcrssHX7SZFMtheHjlmES5V7C67gEMZ4+XRm99XvVZdsqHG0jMyOeiL9mHDiworPx6CvQMHwxPC8crMVlBYL1LuekAgaIRz/Up9UgbSkEWUQdfMf5MC4QeQEE1LPH9P9lnLXBVNX7boUFke8G3kaskwAWdEy4WrfpiQ176aahV2bM4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(38100700002)(316002)(186003)(66574015)(31696002)(86362001)(110136005)(31686004)(36756003)(2616005)(6512007)(66476007)(66556008)(8676002)(4326008)(6506007)(2906002)(83380400001)(6666004)(5660300002)(8936002)(6486002)(508600001)(66946007)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VWVRT1JDRWt1OE1TZlBVQ2QxY3NRUm9qWkwyNzZ3bzZoUmYwdFE4a0ptM1ZN?=
 =?utf-8?B?dVkxYml3Um5QeGgzRFdkNm1tU2RkRzZ5RVlybTNXN2VzK2g0Nkt0MjQ4bXhu?=
 =?utf-8?B?cHpaM1VOYkNpdlNuWFVtZ2JqZVVubGRJRXM3eHFWV2tQMnFwZkg0Qm50TW9N?=
 =?utf-8?B?UUFuRi9aSEVDWlNUSXErcWpzcW12ZGw3WlpQV2VWa01LUXpQOGNNejdmb0xl?=
 =?utf-8?B?OWkxMEZtc1A1VUVVV0x2Y3JxUVFOWGlvYnEwandaa1hOYWlSM3lxZHk2V0Vj?=
 =?utf-8?B?Wm85ZmRKWit5Myt4dVpJemVZbmxDUkJpeCt4eFBPZTlxTlFmOE9vNUJHaFVK?=
 =?utf-8?B?VGlXNXg5bWFEMDR0SGNaei9BZk53bUtMUUcyUDBlditycXRTcktHYTJ0YzFw?=
 =?utf-8?B?MFlienpmL0JrdGdkTzR4M2daSlk3LzNQVmRBYjlMcjdiL21aNjdibUh2S2Vz?=
 =?utf-8?B?VHNTS1cyQk53Q0V5L2ZhVWxtRXlpOS95NHArV29oNGJMcEtrbDhOSm9NNkFF?=
 =?utf-8?B?ZkZjS2pQSmNBQ0RZTTlLb1Zpc3o1ZzJwaTlnRVNndVlZRXd6UVhGZm1QMGJX?=
 =?utf-8?B?UXo1KzEzMVN2R1VESFNtWjlBbnRvanZkTmpLb2VIQlBXQWNrQ2lLNG9EOFgy?=
 =?utf-8?B?a0RoN0pQZmhmdDBSYUZyU2ZJTllGSkF1NzE2MmJIS0poMHMra1JVZlEwMEZa?=
 =?utf-8?B?aDh5YXlzZHR0VjhxTEpRZUU3Uk03ME1UY051TUpJMkRGcHJNMEZrSGtWSEZj?=
 =?utf-8?B?cGxKOWN3WjlQMkZDUFhwZ0oyeGRNY09LOEpnYTZLRTJvS212U29tS2FrOGRT?=
 =?utf-8?B?T1BqRHpJV3pDUGtFbDZBMkxjNnU3eUlQbHhCT3c2WWN3bWkyTkppTnZINVEr?=
 =?utf-8?B?TFh5LzdqN0twOUplMnByMlZJdzY1ZlpBRUxPR3hFUEhBTFNCL25zbjVUQVlG?=
 =?utf-8?B?clhHWi9DMzR3M3RpeWJ5TVA3ZlRSVTF6WU85YUpNZUtOR2lRZ2lVUEtHci9U?=
 =?utf-8?B?RzdqUFB4VnBmU3RoYk1kQVROQVM2VnA0SjNZRmI0M2tML0dGSzZoVEU2eFVo?=
 =?utf-8?B?bUZ2SHc1Tjh5ZlluemdoMGlSRVpucXRYNGdReHY3MmhianBjekRnWk52dGZ2?=
 =?utf-8?B?eXlZZU51cVRna1A3VE5aWGFwSTBOYjBGTXdqOGJoMmEwTVg0WGhML1lhQVAy?=
 =?utf-8?B?bjJ3cGFYUU1Tb21WWVdjZmFZbnRYQW9qVmNzcnVlUHBOVGV1MFA0RnZBRzBT?=
 =?utf-8?B?MDBPZ3dJZGNYYWM0SlR1MUZDRTh4Y216NEhjOEZ5N1ZiNFVKZUFQQlFld3N1?=
 =?utf-8?B?NGFXcFJoQUtMQ0d1bTdaby8xY2hzNENCSUZuZUFSUVU3N3VxMklFMEd2eEd1?=
 =?utf-8?B?UUE3aVhqb3dRdTJHQ25IREZDWFNYcVVxVndIbjc0eTM5Z3RwdnNlUGl6bjVR?=
 =?utf-8?B?ZHAyalM0QURVN1l0WktFamdIMXluLzZldkRiYlZVaTVsbG5HOVBkS29QNm5u?=
 =?utf-8?B?SVU0NjF0Nk0yMmc2cEcyc2N5Z2lVQzhiUUhxSDhqM3J1Vk1pUjZBdWk4MTZw?=
 =?utf-8?B?MlVrVktXQmlpcFZzTDZpK2VQbm9Vd2ZwOGtyZzBSdWtsNUJPMzgzcHgwa1Jr?=
 =?utf-8?B?cTg1K0pYcCt1N1NpRVJIYnJaTExJaFVJdityUHY0QS85c05ROSsxQ2FXbWZT?=
 =?utf-8?B?czJ3UHJhSm5UaE9nY3o0TmdWbG1MVU8rSEE1RjZDbi9MMDdKMHBxT0pzajFT?=
 =?utf-8?B?c1V5ejBKcjZpbXEwVHJJMkFSSUpxR2xKMFRDcDVndU1rNXpoVGpaNWFZcE1Y?=
 =?utf-8?B?cHBNZTd5eGhPU0hTM2IrUUJHK0F0clhNalRHK0lHeE1pMGVtWndxRXR4REdq?=
 =?utf-8?B?M0tZOVZQSlRTZkMxRkZNZTh2eFhoRm5mbGtsVDhKaWhFT2NYTWZyYit3UEJ0?=
 =?utf-8?B?RDZoWVhWcG1aSXVkY2w5Z1BPYkpDeS9qVkIzcHpENjRZZnJJb2pqTEJPbFZk?=
 =?utf-8?B?ZUlhV3JnMFBva1ZtZlYxaHdadkNobWQvNjlqalcwRVdhWSsvVDRmZldpbll0?=
 =?utf-8?Q?G0PP3J?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 357df4e0-fd4e-4d7a-f73a-08da0bd37f2f
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2022 07:13:42.8701 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i7x7pgiu4gvrpdbLzWnJvBCytL4ZuXgjM0YchE2nyTztDXLAeeB7/hAkfolaxJcB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3658
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
Cc: Linux-graphics-maintainer <Linux-graphics-maintainer@vmware.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 21.03.22 um 16:11 schrieb Zack Rusin:
> On Mon, 2022-03-21 at 15:12 +0100, Christian König wrote:
>> Am 21.03.22 um 15:02 schrieb Zack Rusin:
>>> On Mon, 2022-03-21 at 14:58 +0100, Christian König wrote:
>>>> ⚠ External Email: This email originated from outside of the
>>>> organization. Do not click links or open attachments unless you
>>>> recognize the sender.
>>>>
>>>> Instead use the new dma_resv_get_singleton function.
>>>>
>>>> Signed-off-by: Christian König <christian.koenig@amd.com>
>>>> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
>>>> Cc: VMware Graphics <linux-graphics-maintainer@vmware.com>
>>>> Cc: Zack Rusin <zackr@vmware.com>
>>>> ---
>>>>    drivers/gpu/drm/vmwgfx/vmwgfx_resource.c | 6 ++++--
>>>>    1 file changed, 4 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c
>>>> b/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c
>>>> index 708899ba2102..36c3b5db7e69 100644
>>>> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c
>>>> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c
>>>> @@ -1165,8 +1165,10 @@ int vmw_resources_clean(struct
>>>> vmw_buffer_object *vbo, pgoff_t start,
>>>>                   vmw_bo_fence_single(bo, NULL);
>>>>                   if (bo->moving)
>>>>                           dma_fence_put(bo->moving);
>>>> -               bo->moving = dma_fence_get
>>>> -                       (dma_resv_excl_fence(bo->base.resv));
>>>> +
>>>> +               /* TODO: This is actually a memory management
>>>> dependency */
>>>> +               return dma_resv_get_singleton(bo->base.resv,
>>>> false,
>>>> +                                             &bo->moving);
>>>>           }
>>>>
>>>>           return 0;
>>>> --
>>>> 2.25.1
>>>>
>>> Sorry, I haven't had the time to go over the entire series, the
>>> patch
>>> looks good, but what's the memory management dependency the todo
>>> mentions?
>> Previously the function installed only the exclusive fence as moving
>> fence into the BO.
>> Now it grabs all fences and installs them as moving fence into the
>> BO.
>>
>> But what we really need is tracking if a fence in the reservation
>> object
>> is a kernel memory management dependency or not.
>>
>> Patch #19 adds that and patch #23 then finally gets rid of the whole
>> bo->moving handling here because it becomes completely unnecessary.
>>
>> I can drop the comment if you want or just note that it is only
>> temporary until the follow up patches are merged.
> Ah, yes, if you could remove it that'd be great. The patch will never
> be backported anywhere without the rest of the series, so it shouldn't
> be a problem.

Sure, can I then have your rb for this one?

Thanks,
Christian.

>
> z

