Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A02B39327B
	for <lists+dri-devel@lfdr.de>; Thu, 27 May 2021 17:32:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D6FE6F418;
	Thu, 27 May 2021 15:32:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2089.outbound.protection.outlook.com [40.107.223.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED0546F418;
 Thu, 27 May 2021 15:32:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gaVL83REzUV43FTJ1/b8YRzx4rokilYAL9wdgNcDxAtlMT/X1A+ypSs6uh3P8koPJrPpk5soEbsx7iSq9R2C8WZ8Gv5kfArELQQV83VAApNmvFpohShic4SI+ClkprkveOOvY/IIG5lb0lOPHvAEZK3IGcESj5mJsp47H0Sr3WOYR7QZZ0ZC8eGLwP9mzlthO7FcZ7lW42Q/Rw9Wxh9SOvR/pjH5rqzaPKjXWIgyuYqWRdqjpaiExhQKv/PJjotWJNfsJVCDTe/bq8d5aKvKDNrmmNtjnyVGhJzvVO8FgM9AXeJ7aU144fl5CYY9WtFYAg/AfNiuZOPpsnYv7U0nQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LL8xwPQaEACGiMjx44OLXumA6V1vR6xoiXkT+ZukONg=;
 b=ERujyIAOIfAiFPCqDj4qceR2a0GrZjhc9d5BzKuWYT0YLbTQVaHursM53woFyUWnAUt3nJcaAL3b8Go+/Bl1ppwVn/Jy4VCzlrGccbtfzNXjJeCts207CZWvdU7qXPrO8oRE5GVwfYTM0FOgonWNjVXK3SosvzKWGRnq9Yt9znzrcYRymITN7LTrEOqloIFC4s1Jy6DkjsNIfd3F5OBlw2vFTyH3YiWwHBGugtQBW2DoFJCxyEqCZp7vK6xHepN1z1LlMVQBTkWKomeK4molMtlBFoH/9ytWd2/HSGJdzSidQMJfPU+BF8v9rvAMtR7PszF6YbRG2bzPM7OFlv0yfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LL8xwPQaEACGiMjx44OLXumA6V1vR6xoiXkT+ZukONg=;
 b=tzD0sma9ccMrUwGLHJX9/35F+wW97YSG2LmNNkHXYfNDXBaG3GjJc5v005KIreu6R6TuW/bt6uZVsG1NlahXKKNz/0e32+NYr+y6uwIvyMWwN5PSmwJFqLc4Gb+ulhzWC6ecHJH4ilZgbS3kmo2jQi9W3btoV6JNvcOs5ULwaOY=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4334.namprd12.prod.outlook.com (2603:10b6:208:1d1::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.20; Thu, 27 May
 2021 15:32:10 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34%6]) with mapi id 15.20.4173.024; Thu, 27 May 2021
 15:32:10 +0000
Subject: Re: [RFC PATCH] drm/ttm: Fix swapping dereferences of freed memory
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20210527141923.1962350-1-thomas.hellstrom@linux.intel.com>
 <883eab20-4326-d14a-2eb0-5e95f174a0d9@amd.com>
 <8b3382726763050334a6cb214f7ba560eebf8f28.camel@linux.intel.com>
 <e594a1d45b22e92e052d1070beadc5928e5c0ba1.camel@linux.intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <17037c04-603c-44c8-84a2-bce49c0e4f0c@amd.com>
Date: Thu, 27 May 2021 17:32:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <e594a1d45b22e92e052d1070beadc5928e5c0ba1.camel@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:ffcf:5811:6cd5:8a3f]
X-ClientProxiedBy: PR1P264CA0003.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:19e::8) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:ffcf:5811:6cd5:8a3f]
 (2a02:908:1252:fb60:ffcf:5811:6cd5:8a3f) by
 PR1P264CA0003.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:19e::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4173.20 via Frontend Transport; Thu, 27 May 2021 15:32:09 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4445428d-e156-4f3e-f4f9-08d921249806
X-MS-TrafficTypeDiagnostic: MN2PR12MB4334:
X-Microsoft-Antispam-PRVS: <MN2PR12MB4334F7853408BC98B47F13B883239@MN2PR12MB4334.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1hmpQpFUPlR3BzKZLCGIHCwhhGGDnj46QsM963q/1pqduDGQjOPlMJrWhT6M6aPbdNmEX6DuXQa9zjlyecfgSqD2wS8xqAtzGTO0w5LawK0/TirF6HAyvF83B2JBMjPinMNhyHFWdIZmEf6RnbXlF9w0BEmlcPvJQjQb1pzpg37PKodtjPtmOhHuo3K6fBmOA8+PUL4VVC1arKOzck1V2lUnKJiYv7WHwzkUY8Rtk/VLF9LFjhJ9ENp+4trujOfiw8/XTicIcwNDWErcCRVuSVMVI0H7KVvwZZ6nuJWV0xDUhmECthGWg32vq3eIIVneJ2iBgW1JXk6lru4KrPeWY+gC/oHf0KNVhcgS6BLE7AHVpceuMThCNA5c4bIAmxzQy4EWWHsZNayEtBzrp5JZPgvfFVfZq8ReLTNijqVwDDw8tMa4x0wr/bLE/AIM3I1crkqDqtYdiM00mXiUl9kAmqu855oDeKURdQo+Wx+/NHF+6KNYWUPKAJJhZu7dbpLAz/qGBx0INRwpSadhuEZqOyEUHE90M1oriaHyYWoE9aekf23IUc0wLe4SEBvfI9vZNpfD3JlhxXeyHPjMhGeSE2zn97hX3/ZW+q6LCqI8Jg3n1Q0XiU0fEzZgF53jGwsvB5ukwiOWWbH3I8oVH1+ZK2wIdBjLUpKgWGLQscFaL7NdzmvziQYavd3WSIHLRuKJ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(376002)(346002)(396003)(136003)(366004)(478600001)(52116002)(2906002)(186003)(2616005)(16526019)(5660300002)(8936002)(38100700002)(66574015)(66556008)(316002)(8676002)(6486002)(86362001)(66946007)(36756003)(31686004)(66476007)(6666004)(31696002)(83380400001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?TENQb2l0RlI5emVXaWo4aEV3VHBSMk0vSkJaeU1IWFdKMnJRdHhRV3pKdkhR?=
 =?utf-8?B?ZjBYcW5Ec1hWYVlCSlJPbEdXTWRsVE56djFVb2dLaWRHOTNJRkluZnJYMXE3?=
 =?utf-8?B?ZkR6WlRTdWpvMWFkTFVpZGY0NmJoSG5kQytSZkNwRTlER2pkMnNqdzB4MFhG?=
 =?utf-8?B?OWsxbDFwU0wrbkFvSFF3TkxidDUyNzJSTkxHQS9CWUFXaFpCbmVPVE1yR2Ur?=
 =?utf-8?B?OVFuK1c1U2tJeUNpeWV5VnIrVWdrcFFLd2tBQUZZNk5tV1NvdWFJZlNXdlh0?=
 =?utf-8?B?a2pmWEhxZjMzQ045eVNxSkNNMjJ5WXB3NzlSWlo2OExwOU9SKzVBRW1xbVc1?=
 =?utf-8?B?dDJEbVBUeFBJZDcrNEF0ZmVKMm52MkoxQXlSMG5QeDJmYXBYVGp3eTVBYTRY?=
 =?utf-8?B?U0RYK0trN2ZJNXV3RTZ4YXJVN2diRzdQSjFUU1lTK1o4T09QVHkwdVl4Ym0w?=
 =?utf-8?B?UkV4THVKbWhTV0VnRU43MitBQjYvbm1PSjZXSHJZWmUxNkRTYW9SMk8vYnV6?=
 =?utf-8?B?cGhXS3M4aTBhR1VGSDd1aHlwUmJPNExBd0N3UXZYemw0ZzlLdnorT1FFR0h3?=
 =?utf-8?B?dTBwaTBVdlVRa1dISTVpdWtZSVd5TklpQ0NLWWJ6THpKWlZHak05ejFTNjMr?=
 =?utf-8?B?RGNsODZqNktXWDRTN2xDZSsxaE9xV2s4RzNMcnA3NSt6cHk4QmptOTNVK21i?=
 =?utf-8?B?dkxkVVBFZFRFcy91dXJoTkxjTVI2ZGpMaVZyV0ZEQ2x4WGNXam9lRG9mcDFL?=
 =?utf-8?B?dEdkdk9WVHJGdUhvYklEcXNXVkhwaVRVNDhJRzZtdGdNQ0duc25iU3VyT05a?=
 =?utf-8?B?RlpMMFRHV0dVL1MzZGlTLzE3ODFnUy95Y0lWdi91aXluMGVSZ29qZkpzR04z?=
 =?utf-8?B?Zm4wbTBqblZWN2g3SU5vaTQ5d1Z4S2FIMEZhMlNDWDk2c092SXdWT3pNSldF?=
 =?utf-8?B?UVAza2REYmY2S1dpMmpTcjRFMmVrQWRIeFI0V2JxbFlQUzl2cHpFb0lOSzgw?=
 =?utf-8?B?SS9WbDRUQ1k4ckFOckpGYXR1S0h1Si9RY2dBZnoraS9mWjV6a2lkcU5FSHUw?=
 =?utf-8?B?bUluK0hPM2R1L3hMYzVPUitUbHhOb3FTRitLaDVjdkc5L3N1MTRlemx1U2Zu?=
 =?utf-8?B?bHNCS1NIZEg2ZkhGeDlRSmc5UmtUR1pXeS9lVy9zYW1xY1lmeHVUS1ZOLzZp?=
 =?utf-8?B?WGZZVU1vRWNrZ1hvaHBVMjJ2SEw4YVB5RklBbm5DY2lhYlk0OWsyZlZBYVFK?=
 =?utf-8?B?N2h3bGIwNmVIUkFFeFZRTzFnVG95U2E2ejNZZ1Z5ZUpJek4wSnZQR1FEc2I3?=
 =?utf-8?B?UG1JRnEzQ21HTWJ3dk9oT0txTkVtbzc2RHZBQ1hha0RQZUJrV0Nnc2dQb08r?=
 =?utf-8?B?WGZmQWt6NmMyQ1NUWElpaEpyV3lDMExQWTZCUjdMeFRuczFkejAxK2MyZm9r?=
 =?utf-8?B?OWdmc0lwYmZES3NsRStxNjNUM28wMVo0RFhwenFjcDBvV001TVVoVkcyZDMz?=
 =?utf-8?B?VEVJbTFZSzl1L1ZmdVpXdkV3UStraDBTTUwxWGhLUDBFUWhVVzJaL2Jiellj?=
 =?utf-8?B?KzMzcmxpeGNvNlR5Rm51ZklEcjltMUh0RGZDT3c1eHhvMXR1czlqeDQ5OU1F?=
 =?utf-8?B?MkQzWFdSTVl6d3l5YnQ5b0dCdVBBejlzTWFVVHdyWGNBWCs2UU5lYWxESFgx?=
 =?utf-8?B?ZUUzR2Y4S0Q4a2RXcXpUaDZ0MXZSUEZDb0FZVk1PYVduZStoUHZ3SkVINzFD?=
 =?utf-8?B?MkU2SEJsaVYvaG1uemp5WnRaWThLZVdqZFlwWnJ5bVZ5ZXkrNGRkSERuSXow?=
 =?utf-8?B?LzRDQUszRXZjYlJDY2dJLzFIMTd0QkRZM2hYcmV6RHZSTUM5OU5NYjUxUXlU?=
 =?utf-8?Q?8OcpmZxs4PVvZ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4445428d-e156-4f3e-f4f9-08d921249806
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2021 15:32:10.4147 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +Up1WKANx+6+ADHPwlqTl0zFOBdsmiYDMQcD65G3DPpPa2ISQL8CufoeA8yRQEBz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4334
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 27.05.21 um 17:05 schrieb Thomas Hellström:
> On Thu, 2021-05-27 at 17:01 +0200, Thomas Hellström wrote:
>> On Thu, 2021-05-27 at 16:54 +0200, Christian König wrote:
>>> Am 27.05.21 um 16:19 schrieb Thomas Hellström:
>>>> The swapping code was dereference bo->ttm pointers without having
>>>> the
>>>> dma-resv lock held. Also it might try to swap out unpopulated
>>>> bos.
>>>>
>>>> Fix this by moving the bo->ttm dereference until we have the
>>>> reservation
>>>> lock. Check that the ttm_tt is populated after the swap_notify
>>>> callback.
>>>>
>>>> Signed-off-by: Thomas Hellström
>>>> <thomas.hellstrom@linux.intel.com>
>>>> ---
>>>>    drivers/gpu/drm/ttm/ttm_bo.c     | 16 +++++++++++++++-
>>>>    drivers/gpu/drm/ttm/ttm_device.c |  8 +++-----
>>>>    2 files changed, 18 insertions(+), 6 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c
>>>> b/drivers/gpu/drm/ttm/ttm_bo.c
>>>> index 9f53506a82fc..86213d37657b 100644
>>>> --- a/drivers/gpu/drm/ttm/ttm_bo.c
>>>> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
>>>> @@ -1163,6 +1163,16 @@ int ttm_bo_swapout(struct
>>>> ttm_buffer_object
>>>> *bo, struct ttm_operation_ctx *ctx,
>>>>          if (!ttm_bo_evict_swapout_allowable(bo, ctx, &place,
>>>> &locked, NULL))
>>>>                  return -EBUSY;
>>>>    
>>>> +       dma_resv_assert_held(bo->base.resv);
>>>> +
>>>> +       if (!bo->ttm ||
>>>> +           bo->ttm->page_flags & TTM_PAGE_FLAG_SG ||
>>>> +           bo->ttm->page_flags & TTM_PAGE_FLAG_SWAPPED) {
>>>> +               if (locked)
>>>> +                       dma_resv_unlock(bo->base.resv);
>>>> +               return -EBUSY;
>>>> +       }
>>>> +
>>>>          if (!ttm_bo_get_unless_zero(bo)) {
>>>>                  if (locked)
>>>>                          dma_resv_unlock(bo->base.resv);
>>>> @@ -1215,7 +1225,8 @@ int ttm_bo_swapout(struct ttm_buffer_object
>>>> *bo, struct ttm_operation_ctx *ctx,
>>>>          if (bo->bdev->funcs->swap_notify)
>>>>                  bo->bdev->funcs->swap_notify(bo);
>>>>    
>>>> -       ret = ttm_tt_swapout(bo->bdev, bo->ttm, gfp_flags);
>>>> +       if (ttm_tt_is_populated(bo->ttm))
>>>> +               ret = ttm_tt_swapout(bo->bdev, bo->ttm,
>>>> gfp_flags);
>>> Exactly that is what I won't recommend. We would try to swap out
>>> the
>>> same BO over and over again with that.
>> But we wouldn't since the BO is taken off the LRU and never re-added,
>>
>>
> In fact, we'd probably might want to take the !bo->ttm bos off the LRU
> as well..

No, we don't want to take any BOs of the LRU unless they are pinned.

Adding a TT object or populating it doesn't necessarily put the BO back 
to the LRU.

Christian.

>
> /Thomas
>

