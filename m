Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77C078675BE
	for <lists+dri-devel@lfdr.de>; Mon, 26 Feb 2024 13:56:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53C6910F17D;
	Mon, 26 Feb 2024 12:56:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="bmiiWaGV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2BE510F17B;
 Mon, 26 Feb 2024 12:56:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GGZmhQ+OR9r7hbFF7vZKdeFC3ZQP1b8DsFICjZTAMKfnpiSMMKklbf2t87+qZbIA1objXBIYg7zqgL0uef6krB3c6tWz+rNrVIliXbll9+zGbYYDmUgoNf1pVgvi4SkwATbJR9Xmg58k/hTeLPPwntD4pDli/TL3BU3QfM9nn2rsSiAxG5H23Nxa9LBt+UUS3BJ/n5kRvuXSIw/dql/yJHzV//nHK5fu5KFTtIok90kh8lGrvzzsvO+Fvzj7Csfo4NSpah0M8TXHDPzbo17AthGX/Y8JXSA0lTCb+LzGyHrTc8D2SEXgUle+XsiNUlzX4F7vRqTAXbvUTqSggZkxqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y3Erolc2rOIk8SMl7pN/DETK51Zipakj39GbXHvFRmM=;
 b=jv5mTnRy7NTmC8zUX+9xbCRAoxyXh/zXx1MXioA3VnmRyhiAn+ec9i96zl+Dv1xLhj01oigNlVopvhbisYfO8k8oEldDV03WkAgjGlTvo/ke2Nb4OIhD7x9R/xXXEBNoVLHj4ThqSOWlfP2ww50MiCaQePQkiQGNHHmQ4adWnLQyjTRGFpyKivkEanI3k2Xlenr0Uyv9wtie/DehOziI3wADov1FInlXzCJVYdRTmgZ4tIrSkP1yEqWGoK5iFarJAHlcAsPr2n0hiYYadCnlseyKFOdUPj/6oX8iASgZp5Lbbp/715X6IAhMnZqGnwch8A+WptNKwwJV+VBbbt0t5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y3Erolc2rOIk8SMl7pN/DETK51Zipakj39GbXHvFRmM=;
 b=bmiiWaGVwV9qRivtmLxBKUSPrNyo9IkaLUOh5DTbRQT3dOz8inqTc3eG/QdmsjNPRYBuAHjE8gKie4uohd0eRjnk5yxtjjm5rJ4JvC+6+MQFTmBMub1ezmO5eXbh3INuRUdNoY8CZtqQO8AiLpWiI5suIhhyxlTYmWV571lvQS0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DM4PR12MB7670.namprd12.prod.outlook.com (2603:10b6:8:105::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.31; Mon, 26 Feb
 2024 12:56:28 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::f2b6:1034:76e8:f15a]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::f2b6:1034:76e8:f15a%6]) with mapi id 15.20.7316.031; Mon, 26 Feb 2024
 12:56:28 +0000
Message-ID: <ab7bd677-e5e1-425f-8b13-301ae712a662@amd.com>
Date: Mon, 26 Feb 2024 13:56:21 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: build failure after merge of the drm-misc tree
Content-Language: en-US
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 Jani Nikula <jani.nikula@linux.intel.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 DRI <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 zack.rusin@broadcom.com, tzimmermann@suse.de,
 thomas.hellstrom@linux.intel.com,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Dave Airlie <airlied@redhat.com>
References: <20240206152850.333f620d@canb.auug.org.au>
 <87y1bp962d.fsf@intel.com> <20240220084821.1c852736@canb.auug.org.au>
 <20240226084116.4a41527d@canb.auug.org.au>
 <20240226084741.2df4d18b@canb.auug.org.au>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20240226084741.2df4d18b@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0040.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::11) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DM4PR12MB7670:EE_
X-MS-Office365-Filtering-Correlation-Id: 93094a3d-9c13-4cb4-cab2-08dc36ca5922
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5VRgJ+rSEWA7ZFL/kDv06AVCQt7huK8w3H9mIFiHiArYTxzpUFrh6cImztHSeBnbGtusKr8P9bpFChzqmG6Nx6YwcfVg9a0CBhC/38R2TKXCkoh7mPYMCGxqBJ509KIgiL+ifxt0xGBhkXY6+NLlGtM6mmOBYryXbMZgx8vGqZEn1mj8YqNTQa7JvotrGXItQdalzPGznLBMTHTIRoi2MTAD92fN6kRsLejyp+Acyj4xuPdeN1M8C/DmkLuL1eiZNtFMqQJxRuajuAPVvz8izVfRvUlZWMfdLt9AUTwLE1pr8HDVWuW+iZqH6QtiJHIByjHWqSAzgOGRzYRsPXeXcXitDIvC8HsFONkPKALo/EU7Pj1Xjg9PpCAFCh5N6dGyP8tN6FOg+BIxAIs7cswESLM1Ecq/GR470C0NY4p6uJMmSqCkSHIFClLicMwDzmN0EWVWQV1RpZsXs7QoOYgRMdOR+iZfziz8N6OYvbD4c8uogdAKSmcxxIeMuZLhg12voH1hBdhKxlCn1E/fyre72LK0xVR5kOCW29ejpA2DU5Fjq6TRW1cBO1WFj7PnN0773/aEZWhFfnX96wZxUYa7soAYW6Wpp0KAHiy12Zj4Sq0jBFdDiOe/GyR7Hlh8jLL0
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dVZRbnl1RDdWczUwMHV6SFN0RVh5emRPUjRmVlJQUVIyV081azZLN0JCSXA4?=
 =?utf-8?B?UER5bU9FbncrOTdaR2lNMElFMW1nRWJRMndEMm03OTd4WHBOS2E0RTJlUnoy?=
 =?utf-8?B?bCtpYXI1OUJ2aERwNWI5bFFRU3Zyb1BKc3UwZnREcmNVdXcvRWtUVmdwTDl5?=
 =?utf-8?B?ckV5VEZnaUM3NXNDOXNVeDMzL2dGajdLaXdPZWlMZUVEb0ZGaTk2bWk2K3l5?=
 =?utf-8?B?NUliVVQ3dXhhUnlpUi9UYjZta05kZG9tc2JyVEhrT29vY3YzMmFaS25LeVhD?=
 =?utf-8?B?bTV5Ym52SENkNDNZbWFheVlrQVVkaDdtNThOWDBnUzZsTDVYVWRJQ1lHUklO?=
 =?utf-8?B?aTJLOHMxMHBEOE1kVml2OFBGZFI5UUdINDZYNVlrUVhXYXNnWGtxUkFDTTkv?=
 =?utf-8?B?UjhDbzQzWnlyN2NkUGp5M0k4S0ljUlZSZU81VW5nQUN5TUNYWXkyNGZSbHh6?=
 =?utf-8?B?a1FMQTJoaHdhR1JHUndDVWpmQTJCcUhBTHJOUUp5ekhDYXMxRHRoWlFYRmc4?=
 =?utf-8?B?WDFla0xjOStLWUVwU0Evb2J1TGRRQUh0RWZPWUtMTmRhS0R1L0twZ1RGUlNQ?=
 =?utf-8?B?N0hPUkI4SFBEZll2YkgrWlFRbG5ydU83RkNWREVWc1VtelJaY21obTZDUnA5?=
 =?utf-8?B?cmt0aDR0WGtDZC9NcDd2UXVRVG9XK3Nhbk9TUnUzeDdobWE0cFdDVGhqK0ZE?=
 =?utf-8?B?WHhDQWVGVk5FZWlSRjRyY1I5VHh1V3hXVEV1TWc1eWZxNWNSemFoeGEyRHBQ?=
 =?utf-8?B?bCt0SjJCdE5BYUFUTndUMXV2QlBSY3pXTXNZa2FxWHl5N3E1VTFLTHo5U0E3?=
 =?utf-8?B?Sk9qUG1oOVBmdjY4WVZLREE3ZEJQTGFvSjdZcEhVQmVmemliaWxJVjFXcU8y?=
 =?utf-8?B?MVdzY3ZDa3NpYXdnU1hHYXhWZ1ZvTHQvSE8zNFpUN1dKaWw4WEpJNXR4WElL?=
 =?utf-8?B?emM0d0F3QjBBTGdtZTBTR1BsaVpONEJ1SE5TMG96ZXZiaXFPN3JzajFZRUFF?=
 =?utf-8?B?b2hGRXg0cnlOL2pxUitZbFV4Q0o3ZzNkOWZTZStyaE1TSHFYZVlMVFJ0c01i?=
 =?utf-8?B?My9ZSVJLUkpuc1ZaM3dCMVVVQUdDWDZCTHhXRVBOSVFURDlqMjhUc0VSSU9z?=
 =?utf-8?B?aE53aGVGUG1aVjQrZkNYZVliM0E5RkFBajQ0NHdaaTY0MFBQME1nVDdpZFhl?=
 =?utf-8?B?T2FuWGNGT2I0SFVWcWI1S21WSEovM2VHMmtQdmtLbTJjbExvS2lXUmd4WHdQ?=
 =?utf-8?B?NitSTUV5Nm9pRmJNU2gvaEswV2JCL3Ztc2JnYXRzZGtVR3RoNFl6SW11aUsv?=
 =?utf-8?B?T3VYSUtKSVJzUk5DS2YzT2pVWTRRVG5VanlMYnpqUXBWRmRxNjZ1ZFZrWFFi?=
 =?utf-8?B?VFlINEVndEVqU0htbno1d2VPRjRSV2JaZUVRei9adkNUKzNzT0VxTE1nOGRK?=
 =?utf-8?B?MHFGL0svU0NkWVd4ckxKb3RLNzFsWmVqUFd6dWIzZS8zbHMxdFA3czVBdmFs?=
 =?utf-8?B?ejBFZWI4dHdiUzRlZkJoR0IxV2F4REo0WnJPbCs2ZkJhNmtxM1hNZEY0R2Zp?=
 =?utf-8?B?SUhIeDZqSGRHTVV6ODZwMURYWUFrN0JQblF0SW9PZ3R2MG5qenEwUmhzWjkr?=
 =?utf-8?B?TisxOWlsQk8vTnNQTGw4aDlWc3Q0QTYwYW9NcjZuUlA0eFAzTzdjY0pWYWxU?=
 =?utf-8?B?eEFvRlhLSDBma2FDeHBNTlJhcVhjMVNEbkpQbWRFTHBQUEd2c3VJSnZYcFBW?=
 =?utf-8?B?bWNIMXBJSWVjdVBFcVhUd0hnNG1LU09TVzd0dFhJSUxTSEVrSUUveFlqejFU?=
 =?utf-8?B?RjJodFRvZEpWaWxVQXB2amkyY1cyR2tYSWVDejB5cXFkcC9VQlFWbHpzZmZ0?=
 =?utf-8?B?Mm8rZFRzZ1lsSXJpRDhiZGl5UjhHelA3czBySFMzRDR1V1U5NEpmcVAvelox?=
 =?utf-8?B?Q2Y4eVZEc1NQNEVZbW9tL1U0OXJwN1hDWnkyNno2WE9mT1kyZ3p1WlFWdWZY?=
 =?utf-8?B?YVdPdW9DSm8zZ015aDhpZVJ0eW1xSE9iY0xOUUJ6UzZzajdxU0JZNWNTNGtX?=
 =?utf-8?B?a1pZb1NTdGQvTCs4SERoUEhMK3ZYM0NySlQ4Sld5VHJhN3NlcXRWTFBCSHhw?=
 =?utf-8?Q?hnTeOaKD3SseJv9CWZNv0DXz4?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 93094a3d-9c13-4cb4-cab2-08dc36ca5922
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2024 12:56:28.7905 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YCh+njYBGbRlPues6hepyue4OGf5u6sXBdsfTAhxVBefNIsWf8C1L4iU+6PUERyz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7670
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

Am 25.02.24 um 22:47 schrieb Stephen Rothwell:
> Hi all,
>
> On Mon, 26 Feb 2024 08:41:16 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>> On Tue, 20 Feb 2024 08:48:21 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>>> On Mon, 12 Feb 2024 15:15:54 +0200 Jani Nikula <jani.nikula@linux.intel.com> wrote:
>>>> On Tue, 06 Feb 2024, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>>>>> After merging the drm-misc tree, today's linux-next build (i386 defconfig)
>>>>> failed like this:
>>>>>
>>>>> In function 'i915_ttm_placement_from_obj',
>>>>>      inlined from 'i915_ttm_get_pages' at drivers/gpu/drm/i915/gem/i915_gem_ttm.c:847:2:
>>>>> drivers/gpu/drm/i915/gem/i915_gem_ttm.c:165:18: error: 'places[0].flags' is used uninitialized [-Werror=uninitialized]
>>>>>    165 |         places[0].flags |= TTM_PL_FLAG_DESIRED;
>>>>>        |         ~~~~~~~~~^~~~~~
>>>>> drivers/gpu/drm/i915/gem/i915_gem_ttm.c: In function 'i915_ttm_get_pages':
>>>>> drivers/gpu/drm/i915/gem/i915_gem_ttm.c:837:26: note: 'places' declared here
>>>>>    837 |         struct ttm_place places[I915_TTM_MAX_PLACEMENTS + 1];
>>>>>        |                          ^~~~~~
>>>>>
>>>>> Caused by commit
>>>>>
>>>>>    a78a8da51b36 ("drm/ttm: replace busy placement with flags v6")
>>>> Cc: more people.
>>>>      
>>>>> I applied the following hack for today:
>>>>>
>>>>> From: Stephen Rothwell <sfr@canb.auug.org.au>
>>>>> Date: Tue, 6 Feb 2024 15:17:54 +1100
>>>>> Subject: [PATCH] drm/ttm: initialise places
>>>>>
>>>>> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
>>>>> ---
>>>>>   drivers/gpu/drm/i915/gem/i915_gem_ttm.c | 2 +-
>>>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
>>>>> index 80c6cafc8887..34e699e67c25 100644
>>>>> --- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
>>>>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
>>>>> @@ -834,7 +834,7 @@ static int __i915_ttm_get_pages(struct drm_i915_gem_object *obj,
>>>>>   
>>>>>   static int i915_ttm_get_pages(struct drm_i915_gem_object *obj)
>>>>>   {
>>>>> -	struct ttm_place places[I915_TTM_MAX_PLACEMENTS + 1];
>>>>> +	struct ttm_place places[I915_TTM_MAX_PLACEMENTS + 1] = {};
>>>>>   	struct ttm_placement placement;
>>>>>   
>>>>>   	/* restricted by sg_alloc_table */
>>>>> -- 
>>>>> 2.43.0
>>> I am still applying the above patch ...
>> Any progress?
> And this commit is now in the drm tree.

Sorry for the delay. Oring in the flag needs to come after the call and 
not before it.

Going to fix this.

Thanks,
Christian.

