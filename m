Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CA22B395950
	for <lists+dri-devel@lfdr.de>; Mon, 31 May 2021 12:56:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D05A6E8DA;
	Mon, 31 May 2021 10:56:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam08on2046.outbound.protection.outlook.com [40.107.101.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EDF26E8D9;
 Mon, 31 May 2021 10:56:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oJjEepJQEQvH1e5CGlLcwyJDQOCAb4CElzwDGBS/E3OJyEiXzrITNlZqk9RvEkOwubxb5ZH2XevyyOPJOuHjzRCX0DluSMwvixS+zqLjgqyRL+vvxMZnI4SKGBY9EmAWqJLcMMVSP8aAtuUg4FVVoee3wLjzzJiqjMhH8mII4BVYs6vo5wwl6aO5t6ItdSSbM9FBPPwCND+rEFodlwqBsjp2flW5LenhCJ1EibDT8TCMuyiRm9JqITuJMEDS2QugUyBB1hvmDD8nNPP1riljmtJtRC/9QO2eQ3lg8EFWA8fhOxKfEtaT0D1EatAcp3HkvHd479SV/GtcGaG0g52RLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jWcGf49ZFliK7WjzOT4mBm/m/mE6K3rQcWpYjHi08gI=;
 b=dFgcQJBB6kWX/HWvykGj/ExMEHZQNJ9p2CCjc5NqazH/u+wlzQu5qT5FhJ6kIVBYbA3Y2syw916o/JTsYgluyHZbcynOxzVGmdEBCZjfzEpp6I9V0QdEgJPoY7PBKxKIcRojcPNI70XS9GdKFnTaqYt6gqz3iFj079xIslxzW3fGfMLgk87foUq35XFOTIVj5hPPZwq1FKNp1aPkJzZTDpaubP/eJ0kOlR+z+i0EQYOMhoHI3XwJ83Ks19tIiEMk+0LcGlXLSwdyjtSJbU6G35sdMti0Jc5LtQsypWF9cJb0MDMHsY5+MUxpzwN/J2g0wVqgo9pMHpF72WmQYxjXdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jWcGf49ZFliK7WjzOT4mBm/m/mE6K3rQcWpYjHi08gI=;
 b=g4q3BNiVAvTSXfui5AmSSSs//TTEWW2AaAzQj4sXiM8Op2Cs57I7P1Xo7FFWSVsA6AfjD454L4Bs5igEuphGIPb2wXHI7Uphsa9bNCoWHuRPdClDDkaaPiHMHHMvm2ZVg2RjvhMe55HzIn0mLFB9kLZRN9OKfpfIzEjc3Qo4vZo=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4333.namprd12.prod.outlook.com (2603:10b6:208:1d3::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.20; Mon, 31 May
 2021 10:56:44 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34%6]) with mapi id 15.20.4173.030; Mon, 31 May 2021
 10:56:44 +0000
Subject: Re: [PATCH 1/2] drm/ttm: cleanup and add TTM_PL_FLAG_TEMPORARY
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= <thomas_os@shipmail.org>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 "Yu, Lang" <Lang.Yu@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
References: <20210527013051.4302-1-Lang.Yu@amd.com>
 <DM6PR12MB4250B79297F587313D7645EBFB3F9@DM6PR12MB4250.namprd12.prod.outlook.com>
 <14d7f047-cf6d-c84a-14ff-3f1d833a770b@shipmail.org>
 <883bd629-e3ad-07a2-8952-994f42cb02be@gmail.com>
 <86054733-9b7d-de96-4ab2-21dca85f1e6e@shipmail.org>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <888c52a5-ec10-0dee-c462-93cef8510e9f@amd.com>
Date: Mon, 31 May 2021 12:56:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <86054733-9b7d-de96-4ab2-21dca85f1e6e@shipmail.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:b94:4956:bad4:7c81]
X-ClientProxiedBy: AM9P193CA0001.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:20b:21e::6) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:b94:4956:bad4:7c81]
 (2a02:908:1252:fb60:b94:4956:bad4:7c81) by
 AM9P193CA0001.EURP193.PROD.OUTLOOK.COM (2603:10a6:20b:21e::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4173.20 via Frontend Transport; Mon, 31 May 2021 10:56:43 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8b8ee5da-3d1f-4eab-42f6-08d92422c72f
X-MS-TrafficTypeDiagnostic: MN2PR12MB4333:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB4333A032717C4C09262D24F2833F9@MN2PR12MB4333.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2657;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: whRE/LL7xIqt6I3VpEMzb0N2NMNy/kVWCmxeyZK3a+l6X9v5axiyhqhFWuz8OX6kd7K6DFEO/A4LDxGKb/tg51yj35o3n0p7UasHqo2fnFTsHavDyGUH7UyVtmu8/SjoHKcYRsYfKEbm8Lqi07IyQsSkZ4pOLbEnSdtB867cjXW0eONhpTMOkAhlxHzMWXh4lVgviX6EHyzEFcIRfnjiL+EHKC2OHz90rGPBg/IXbkSYD/HWwo0NqE+BX7rLYW7g9N0tVoGokfAnHTkCajRNLNcN9GfW1yI0BIaoBSHDtqwg3EHRkHJpaCV313Lgq6+plury1it6SqAlvau/VUOj6EgapQIuZBC0i9e4oi6tVc9o4/iP1wklXjHXEeHjNFQEXKaJPJ2JU39P952Hi9N22h/syqOpxWNn7C5PcMycbj+bKEjQGgbW6ZCcRBcAw7z2H4icJNZ44L9WSofzRCRh1wwrKKm7fYnjhVdjmm/NcJOsTZpgQkjvvMRiJQQgwacQoHVFY9Hb9UCQJwYBO57zg2S3/8c0DhsY5iL78WsHM+aBI/IQvbyVOSKWcH/V0jhmo4dAMSCfw4bulSh7D6GLdFJ74CvOsKBaeltkPZ7+A1zgdC/TWtmMJkKDs1ActJOI01Rv1QO+rPUXesnwTphuVB0KmzQhr3MtZS2Wcpm8MTmQLP522/QLV5nc7ZsaQo4CzTFSXpbFxPLoNGOB6G+37VsS9vkM9BAj63U9ZKTc3Qo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(366004)(136003)(39860400002)(396003)(376002)(45080400002)(478600001)(966005)(316002)(66946007)(38100700002)(8936002)(8676002)(36756003)(2906002)(86362001)(110136005)(186003)(16526019)(66556008)(53546011)(66574015)(31686004)(6666004)(66476007)(5660300002)(83380400001)(2616005)(6486002)(31696002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?d21NUTZkMWJ3MWN0dmZKUEhzTkYxbmZNdHFYbzRtNkdYUDZ1aXhlQ3dzMEEr?=
 =?utf-8?B?SXZZYW1nVDVqTDBmM3F4bFphQ25tY2dielZ1OWNlSUYvcXF6RDAwdXE3NXNE?=
 =?utf-8?B?UVQ2VjhDb0JPRGVGWG53T0dnTk5ZS2hWQnpSMU4ydklXM0tTRFI2SVVOeDJU?=
 =?utf-8?B?Qm5TZ2dVRFgwb2VxbGlZNlVsVFB3Y2JYNUx5NlNBcHNCdXAwSG5Sc0dMNkJy?=
 =?utf-8?B?TEdSVGVlL09NaU9kaDByMXM2N3lEVlpsQW0zTnVGQXVQVGVmdnBOT09Id1Nh?=
 =?utf-8?B?cExlZEdselk1WkJWNDhScXlaYUc0NUJKSERmTXNMR1pQU3d5QkhtNmpZeStN?=
 =?utf-8?B?OG5QY0ZGUUNlU29iSEZFY2Nvc0JQRHE5cEdKdVd1THdXZkdteSs4Ukc1cnpW?=
 =?utf-8?B?VzNESTdwelFTWTRRNEd0SE1DbVVIQkRCYVlMQ01OWW1meEUyQ3B1YlFjWWhq?=
 =?utf-8?B?NjgxZEFXd29lQkphcEZjU213Rk53WnhDeWxjTS9BTXZiVjJzd05iZDNJMHRy?=
 =?utf-8?B?MTk3KzJ6ZEpQNHhna0VUTGRlOW9tTE0vcWFPMmJMM1pxakRFcEptWTNiSUhK?=
 =?utf-8?B?UzRjblBueTZJT2dSUGI0UUxQZk5GVXJZWVVILzJkbnNueFptUXZkMTNMamRT?=
 =?utf-8?B?SEpZbTA1dCtLcWlnVWdocU8wSU5YMkhBTHFZSkpmNFcyMm9JV0hiQUUyeFh1?=
 =?utf-8?B?cytkZ3dXSDRrZG53T0V3YlZuTzdyb3ZCY3VmN2NvVkhCRUtvMnFLNy9xZ0k0?=
 =?utf-8?B?N2tidlFieEh1ZEtRWnVrUGVlVStzYTlLa3RDUnZyRDByUmdhdTdrTVFXbUFj?=
 =?utf-8?B?Z2Y3NDg1ZTBZSTI5dVM1L2hyQ1dXMDZkanBMZS9kcGx6Qi90MnJGVzRrRE1W?=
 =?utf-8?B?RUc3ZE1ZSEVIOG9WanNGaThFV2VvcDZmWWxHczhBeHpMam5IeGo5Z1pjL2lR?=
 =?utf-8?B?T3NQa2pJeURDMi9uUjFsUmR4ZEhBTGhtekhCV2FIcGtRQW5lYkNzdVdKWncx?=
 =?utf-8?B?eFRMcmM2Y0FtVVUvSGdOOE1oY21EWGFuSklpeWdXWjUybU9zMnBnMk9OL281?=
 =?utf-8?B?YkJSclpHa25GSmhEbHFoYXlweUhjdzNxNlo1T0d5YWE2ZHJQdldKbFpHRk4z?=
 =?utf-8?B?MFV4MnZOLzl2WkFPaTdFeWYySHlJeklwdkhTQW1yMHA0cE9qcThqdXpIdFgw?=
 =?utf-8?B?SVZvbEEyNlNoOVlIUlZobmswNjViN29tbUJ6eEtOZ3E5Qnlocy9vYzBVZnJj?=
 =?utf-8?B?Ni9sOTArM21tNm9NRjJNblc1b1ZkaXpCOWh3TnNTQ2JPSjAyMWVDZURjczVa?=
 =?utf-8?B?T3VkREVBY0ZWZXdERmpLV1VTc2U2VFRFSm5DMElyT0J5aTBZeU56VHlXMkhD?=
 =?utf-8?B?V0RlU3c5ZHZGNVZwR0ltU3lObkt4SWpKc1RsNkN4blBCSEJpRWxRcjkzTmRl?=
 =?utf-8?B?dU1BOHVMMjFqTHFNN0QyWHVsM1NsVDJ0TElCczBwa1FDNGd0dWF1aEV0TUlj?=
 =?utf-8?B?c1VOYmpoR2ZJNy9lZ1hTVHZDR2FoM0xmTWFrdmE5V0JnVjJwT1I4eW9WS1hF?=
 =?utf-8?B?OGxqbEMvcHJxaVBHRU8yRU15eENSdm1rRTlQSGlmVTRPZzBkbHBJSFlsdlFt?=
 =?utf-8?B?OTcvVjBMZmF1d0JFWGpSaHZPbFpVY3JTbHJJNkJ5bGRpVEdSWnhlZXYwQm45?=
 =?utf-8?B?WFNBQnpVRExUMGNqcUdQYTdBUTdCTVFwS2Z4cWszNjNHNWNpMDh3OUUveWIy?=
 =?utf-8?B?YVdzdnZPc1pYTENzSW5XU0lHdkUrOHRUOU9wNDliSHZ3ZXJES0pVYVpJRlJk?=
 =?utf-8?B?c1pzcUhmVEZ0MFZ4aTB5V1RwWDNmVTl3UDBLbzNNWk5rd29PVXN4MWJiRjZM?=
 =?utf-8?Q?bHSqVB23JRqNh?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b8ee5da-3d1f-4eab-42f6-08d92422c72f
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2021 10:56:44.2405 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LgRCa82Bj2MFgONlN6m4cxhVN6UUQG1IWxC2FhpkAfPBxS3fwer6xHlwvhNx7ET7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4333
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

Am 31.05.21 um 12:46 schrieb Thomas Hellström (Intel):
>
> On 5/31/21 12:32 PM, Christian König wrote:
>> Am 31.05.21 um 11:52 schrieb Thomas Hellström (Intel):
>>> Hi, Lang,
>>>
>>> On 5/31/21 10:19 AM, Yu, Lang wrote:
>>>> [Public]
>>>>
>>>>> Hi,
>>>>> On 5/27/21 3:30 AM, Lang Yu wrote:
>>>>>> Make TTM_PL_FLAG_* start from zero and add
>>>>>> TTM_PL_FLAG_TEMPORARY flag for temporary
>>>>>> GTT allocation use.
>>>>> GTT is a driver private acronym, right? And it doesn't look like
>>>>> TTM_PL_FLAG_TEMPORARY will be used in core TTM, so should we 
>>>>> instead set
>>>>> aside a mask in the PL flag for driver-private use?
>>>> Hi Thomas,
>>>>
>>>> Thanks for your comments and advice, GTT means Graphics Translation 
>>>> Table here, seems
>>>> a general acronym. TTM_PL_FLAG_TEMPORARY may also be used by other 
>>>> drives.
>>>> I have made other patches for this. Please help review.
>>>>
>>>> Regards,
>>>> Lang
>>>>
>>> My point was really that the flag naming and documentation should 
>>> reflect what core ttm is doing with that flag. If there is no 
>>> specific core TTM usage, IMO we should move it to a driver specific 
>>> flag to avoid future confusion. In particular a writer of a generic 
>>> TTM resource manager should be able to know without looking at an 
>>> old commit message what the placement flag is intended for.
>>>
>>> So here we add a flag where core TTM forces a bo move on validate 
>>> and that's it. And that appears to be how it's used when an amdgpu 
>>> bo is evicted to GTT, (btw should it be accounted in this situation?)
>>>
>>> The other use is to force the amdgpu driver to temporarily accept it 
>>> into GTT when there is a lack of space, and IMHO that's a driver 
>>> specific use and we should allocate a mask for driver specific flags 
>>> for that.
>>>
>>> So shouldn't this be two flags, really?
>>
>> Well one flag makes sense for the use case at hand that drivers want 
>> to signal to TTM that an allocation is only temporary and not 
>> considered valid.
>>
>> That we then use this flag to implement temporary GTT allocations to 
>> avoid problems during eviction is just extending that use case.
>>
> OK, but it looked like there were actually two use-cases. One for 
> possibly long-term VRAM evictions to GTT, the other for the temporary 
> use-case where the hop resource allocations sometimes failed. Or did I 
> misunderstand the code?

Ok sounds like we need more documentation here. That's really one use case.

Key point is we need temporary allocation during multihop which should 
be handled differently to normal allocations.

When Lang is ok with that I think I will pick up his patches and 
document them a bit.

Christian.

>
> /Thomas
>
>
>> Christian.
>>
>>>
>>> TTM_PL_FLAG_FORCE_MOVE
>>>
>>> and
>>>
>>> AMDGPU_PL_FLAG_TEMPORARY
>>>
>>> Thanks,
>>>
>>> /Thomas
>>>
>>>>> Thomas
>>>>> -----Original Message-----
>>>>> From: Yu, Lang <Lang.Yu@amd.com>
>>>>> Sent: Thursday, May 27, 2021 9:31 AM
>>>>> To: amd-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org
>>>>> Cc: Koenig, Christian <Christian.Koenig@amd.com>; Huang, Ray
>>>>> <Ray.Huang@amd.com>; Deucher, Alexander <Alexander.Deucher@amd.com>;
>>>>> Yu, Lang <Lang.Yu@amd.com>
>>>>> Subject: [PATCH 1/2] drm/ttm: cleanup and add TTM_PL_FLAG_TEMPORARY
>>>>>
>>>>> Make TTM_PL_FLAG_* start from zero and add TTM_PL_FLAG_TEMPORARY flag
>>>>> for temporary GTT allocation use.
>>>>>
>>>>> Signed-off-by: Lang Yu <Lang.Yu@amd.com>
>>>>> ---
>>>>> include/drm/ttm/ttm_placement.h | 5 +++--
>>>>> 1 file changed, 3 insertions(+), 2 deletions(-)
>>>>>
>>>>> diff --git a/include/drm/ttm/ttm_placement.h
>>>>> b/include/drm/ttm/ttm_placement.h index aa6ba4d0cf78..9f5cfc7c2d5a 
>>>>> 100644
>>>>> --- a/include/drm/ttm/ttm_placement.h
>>>>> +++ b/include/drm/ttm/ttm_placement.h
>>>>> @@ -47,8 +47,9 @@
>>>>>   * top of the memory area, instead of the bottom.
>>>>>   */
>>>>>
>>>>> -#define TTM_PL_FLAG_CONTIGUOUS  (1 << 19)
>>>>> -#define TTM_PL_FLAG_TOPDOWN     (1 << 22)
>>>>> +#define TTM_PL_FLAG_CONTIGUOUS  (1 << 0)
>>>>> +#define TTM_PL_FLAG_TOPDOWN     (1 << 1)
>>>>> +#define TTM_PL_FLAG_TEMPORARY   (1 << 2)
>>>>>
>>>>> /**
>>>>>   * struct ttm_place
>>>>> -- 
>>>>> 2.25.1
>>> _______________________________________________
>>> amd-gfx mailing list
>>> amd-gfx@lists.freedesktop.org
>>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flists.freedesktop.org%2Fmailman%2Flistinfo%2Famd-gfx&amp;data=04%7C01%7CChristian.Koenig%40amd.com%7C3868af2bd5d94aeda94b08d924215b3a%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637580547980190391%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=C7b5wz8Kph5bM8fkFVyXKwSNkSj3lDaxGUnww4jY%2FeM%3D&amp;reserved=0 
>>>

