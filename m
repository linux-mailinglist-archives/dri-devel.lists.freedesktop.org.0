Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4553643FDB3
	for <lists+dri-devel@lfdr.de>; Fri, 29 Oct 2021 15:58:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDC1F6EA5E;
	Fri, 29 Oct 2021 13:58:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2049.outbound.protection.outlook.com [40.107.244.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D7A46EA59;
 Fri, 29 Oct 2021 13:58:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VhccVg9TKhlW5o8trEK28VaSTFU8Tx5hzO7kkziBb4QCKCEqMuuj33ju4feBVzrAYxO5mgrtG2/UyRh1TxiyCBuPMORmI2oqCf8NYPXG3fW6Jec6vk3ciYOTK7TE2pw6uA56oReQmhC0HoZFbgoduatNVtrlkoF1rj+jUBaXvTXwzXubxQvziH6r+V7wmch8LStSLAuArCiKjnm6ADdaxzw+JPROliPmXj1Sj0sIXJjMiM8ZL2CcjebYsxIklgDax2YiS51n/IYbrN2IQa/zLDwDudXTuYc4GP+SAA6QViJdb+V7zIv+BGd3/sGztzgva9AZce7vn8wLzkkvZYSy6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VS9I4aU8wcbbF5FAO5NHMp5Cl4tabm2v30mh7CcdgDI=;
 b=ISbaeYJZII5MIVb2p0hvLFHWDW3jdkAPpwDbp8R/dw1idsiMKLcTZkZaAHM7N8jqrmm/YoNYuTpAqFTh74izAQhF19E+bw8jCFqfUFGl0TRH7UFnZ1zbaagLHec3tDPibsnMU0gMrKv7K4GuLjRk45By2uHL1GRnd1RrwmUQUmcnaCxiUeKjGiWh3A+lfR14CdfwtsH3qMpyqzlcW8VJYMneT0ME2GvJSFs4Iy3n24EzKZxn+f4v9RpK7uW2ppYF/JEPtI8+rwEoLuxynjpJL3PC9RJ04g6+CiMCvWwoDzzoVGaI3k3aPDZgGS2jTqLrFq8zUG6ye8FWQPqK+Iv4iQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VS9I4aU8wcbbF5FAO5NHMp5Cl4tabm2v30mh7CcdgDI=;
 b=kqyuDTSDMRpVxBP7dfa+mZpkDmIV3DMXZKNkOhTtFX/GG5Wu239nYu/y93xbpL5ufAGmsuDMJI8Br9JlZmfvGz5xLpbclwRX9gZAzbex/QuG0ZKzuFHZ/4vtvBkQXQKopQpNdOu8TOVxIGdKhI2EQJBLHXQebVFZ9J6yGb1BWw4=
Authentication-Results: poorly.run; dkim=none (message not signed)
 header.d=none;poorly.run; dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.14; Fri, 29 Oct
 2021 13:58:24 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::d095:131a:b99a:9975]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::d095:131a:b99a:9975%3]) with mapi id 15.20.4649.015; Fri, 29 Oct 2021
 13:58:24 +0000
Message-ID: <70c668fc-0040-a9a5-67b5-d6340d4b8f31@amd.com>
Date: Fri, 29 Oct 2021 09:58:19 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [Intel-gfx] [PATCH v3 1/3] drm: Rename lut check functions to lut
 channel checks
Content-Language: en-US
To: Sean Paul <sean@poorly.run>, Mark Yacoub <markyacoub@chromium.org>
Cc: seanpaul@chromium.org, pmenzel@molgen.mpg.de,
 Mark Yacoub <markyacoub@google.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org
References: <20211026192104.1860504-1-markyacoub@chromium.org>
 <20211029004220.GA10475@art_vandelay>
 <CAJUqKUpop4JodJjT+HBR7ayq2=G_8UdJatLFhty5XZTZ7xL8QQ@mail.gmail.com>
 <20211029134335.GE10475@art_vandelay>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20211029134335.GE10475@art_vandelay>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR01CA0001.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:c01::9)
 To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
Received: from [192.168.50.4] (198.200.67.104) by
 YQBPR01CA0001.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:c01::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4649.14 via Frontend Transport; Fri, 29 Oct 2021 13:58:21 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7ab28d97-9a9c-4abe-25ec-08d99ae42c4e
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:
X-Microsoft-Antispam-PRVS: <CO6PR12MB5427431A18A80693611D0CD28C879@CO6PR12MB5427.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: z58glpRRY9RFTZIsegs01m6LncoKE7azLR8viPGd1WAnDSO5Dp51vIkKNJU3O5GGsZLU6Ugzlxcu+1Xj4ew2yHq/hfe6pc3b5QpEBIQq6rl8Rw37/3rdjYEZGI8jxM74KkvM25h/zy0TEdZaW/IA+p83bT4Tkoojf40Xrc3gQHtgNc6OASg9WNKZNvflqZvjJoMyFSxuZf2ZvX+1LBpcHLaCoidS79X77+WLFPKPVCWfcq/PaBJuRRMkjC3J9DFYIuaIDqStrR7KdQV+jp2NB56c6mGMThDUmqKBZPRO3ZOzFZ3j4Vz6MRRmUY4D4j1bY1plX/nqlawCeNsIz5xpEmRvNuSIiuyLuAOe3rLwnKgBY/sJi+OfozY2l2Aep2AC6AXAdMCYAkGBhyv0u/AB34kGx6EsH6MNQlwua7fKqiTsodGjYvHUE22S5//nGZIl4hbxP55bFmqviYvUoEB2CJzzED/wfBJSc6R3b/hhgLXe40Lk+RSJUYzCg3z85vfi3Vcr/lgReCnEyTLP+u5BpHX1Fx69KxX8iRPEDRgjqBnlomXOVLAzpLK7bSFecIvSSdpwk8zF1ccvxdPkVll6I2A9HdZcXG4LudsGMKCrVBJJ1b2Mh05OFA2y7XSbbAs0594zg9o5yTvQH6wxKnZ5tR4wQ3bStJ07JMn1v3NY5VaUklhEcjgIzLct0Rwf4a2EWZT5J5stf0uxteSqKgXq339ZBNZy0gdpkOh1HxBA6+0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(66476007)(26005)(7416002)(508600001)(31696002)(6486002)(86362001)(110136005)(956004)(2616005)(8676002)(8936002)(54906003)(66556008)(186003)(4326008)(66946007)(4001150100001)(38100700002)(53546011)(2906002)(16576012)(36756003)(5660300002)(316002)(31686004)(83380400001)(44832011)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QVZrMGlHQzBYbFR4Y1BTdnVnZncwdWNTM3UxaXV3NmwvNit2bDh2VGVVbE04?=
 =?utf-8?B?aUJqRU80Y1hQNUVNMnJ3TXBSZmlyREFTL2lZTDZXRHQ0bE9CbWhoUnVYRU05?=
 =?utf-8?B?Qk5RS1F6NElzdE15aHIyR0tKekU3QklLQTNFQ1MzYmZaQ1E3d3lucWFOb3RE?=
 =?utf-8?B?dU5Ya0EvSVZYaVlPMittbmZuWkt6YVg5OVBrQXlZQ3NIYklEQzFiUXNRcDIw?=
 =?utf-8?B?WDVYNHRnWE5EU2pjdDgxbDJiTGhhQnRySEJ6cDliRER0RHZTNkY3MFdGTkFB?=
 =?utf-8?B?bFFIRzRCU3pMckJaajJZUVJkRU1YTGJ1MnpOeTV2Y1VtbUV3VnlCaVJHWldL?=
 =?utf-8?B?OS9Ib3hGNCtPYk1ubE1sU3IvZUVUbmZwcnYvZDV3Y1ZKNHVybmR4L293THZ6?=
 =?utf-8?B?RGJCdVpmZzZlWTRUN09zNzIvSFlCV0RkQklFM3oyOGc2NytGRXVQZzhBaGZP?=
 =?utf-8?B?OHo2MnpYNXI4RlkrRTI0VTFISjNlRjd3cnh1V28wMkl6S3RXSUxualp0QjVv?=
 =?utf-8?B?eUp5Qnd2Z3hXY2Y1c3pxNDZlczNvM2RBY1B2alhvTUNGaHI3K2NlT2paQ3BS?=
 =?utf-8?B?OUNwR1oyWXcxMmc0UzR0eEliUGVQdk5Ma2dJZ2psVEtyUVB1VXNSY3piUDBp?=
 =?utf-8?B?czBEYXA4YnE4UU9JRmRjUUFrSmZXZDlFWFl6SFBTTHpJL1d6SGxTZTVYUzl1?=
 =?utf-8?B?V1cvQ1IwMCtUTkxVZForTmZNMFhwYXZKdXVHTTVWOUFmcmhveHhYS3FkdnBG?=
 =?utf-8?B?ZFliVEZsdE1Ma2VVMm5HMnRwcDBvNzhYcWx5aHBmcU5tdDhsWjgxWVJhL09u?=
 =?utf-8?B?Q1BNLzlUR3JuNk9pLzZuVWhyMFMxcDVmRDZEZmI1NGVXR1d4eC9UaFFBLzZo?=
 =?utf-8?B?cUVJY0hPUjBhTmc0WmhGL1BwVTJTRVZmak1DcnBERHduQ25jcFBjeWJySVdZ?=
 =?utf-8?B?SnZpSklJRGdsUEUrcW9FSGRaQmIxTGNWNXEvYU5BeVNxbTI5YW9tYXNzMjV5?=
 =?utf-8?B?R0RDeXNMdmJuV0ptL3dSbm9kU21WUVR2MXZROE4zdEdPTW1IZC95M3VCRWFU?=
 =?utf-8?B?Q0V5Q29MZlJuOXF1QVZHVTRaS0M2STJjL1I3RGdtQ2RVMkNCejc4N0lZQzNF?=
 =?utf-8?B?bnlWM2FJSDR0TzYzNHdRRzFEWXVuNDR2bkFYYnNwVWhSWW9MTXhld25zRjk2?=
 =?utf-8?B?a3d3OUVlWHk1bjBELzVoMEQrcCtVMFNVbzdXUEdwK1pPbXFmdFFzekQ4Um1B?=
 =?utf-8?B?VDJTQlNLV1YzOG9WeGQxanlPZEEzRTNwTENUbGVKSGhoaW5obVFrSnErSmtj?=
 =?utf-8?B?UVFORzJpaDRIb1RHbnVjdGdPWDhaMjVwWGk2cHE4NDQ0Wityc2YzbDhVZkRT?=
 =?utf-8?B?VzgzQVJhRnF6SWFTRXlJZGlwck9WNWkvUHhJRTBsQjAxN0VxY1MxYTE0VXU2?=
 =?utf-8?B?UzZ2ZzBoRjJ5cUQrUlAwQzJuNEp3SUkyTm95TzIwV1lXWFV2UVNwRXJLTkhM?=
 =?utf-8?B?QjhSeGc1MFVvQkNlbVhJK2ZhMkdibVdxUW5VKzlaWS9wTmQrbG0xTU1Ec2hO?=
 =?utf-8?B?VG82MkpEOU8vRjU1cGZjbmM5VWZOazJST1hwYkN3Z09ZbThxV1c1amFLRW5D?=
 =?utf-8?B?a3N3bGNzVFNUbEd4S0hwLzhHRFhEOHZLYkFLVmROb0pmQWo2TDZCRVpWREIx?=
 =?utf-8?B?OXdVdjVPeDIrVDdWd1FiZ3JaU2tvVHR5Zkc5TS9DMlB4WnNmaTVsbEx6ZkUy?=
 =?utf-8?B?SElyQ3oxc2k5VUE2M05oRGVyVFR5dXYxM25uZlhpZkRISE1GcUxMTzBHcG9s?=
 =?utf-8?B?V0VhTU1qNEFpMHpROWo3UFR4c0FIcUZVc3FYRC9IeTQrWGZtYThQREtQY2NC?=
 =?utf-8?B?NUp4M0JUQnEzSFk4ZUg4MXQwS2VkdjFyN3htUGRFTnRNd0V6VkhLQ2FiVzNW?=
 =?utf-8?B?VVlLbFBBTXdkekp2WVpzTCtOdzcwb01BejJ6YTZaMEVUcTN4T2U5c1NpaVIz?=
 =?utf-8?B?Z2syVkljbHBlcXpWaDVrMVZ6TEFNSG0rR0JXVk5LUjNkdFRuNTBONDVMRjc2?=
 =?utf-8?B?bXdDd1NlSTg2WUZIcDhCcDRaT1hGeG51WXl3a2dPQnIwLzZrVWVRY2lEWXFk?=
 =?utf-8?B?cHFlYmFPZlZBMXFUWVNJWEJQaFFwc3NLeW9JaVRJQUZaSGtidFdlVVVFaGNi?=
 =?utf-8?Q?ujQOYORqk/2y3JdVyDVKj1c=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ab28d97-9a9c-4abe-25ec-08d99ae42c4e
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2021 13:58:23.9411 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ODdEYxyuobt8EDatHWpvRiQPcNbYnD6DJL/nHKMPgBrgDjvensEw20DvUJsHqtyCtJlWglh0m+cqHCv2bgiMQg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR12MB5427
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



On 2021-10-29 09:43, Sean Paul wrote:
> On Thu, Oct 28, 2021 at 11:03:54PM -0400, Mark Yacoub wrote:
>> On Thu, Oct 28, 2021 at 8:42 PM Sean Paul <sean@poorly.run> wrote:
>>>
>>> On Tue, Oct 26, 2021 at 03:21:00PM -0400, Mark Yacoub wrote:
>>>> From: Mark Yacoub <markyacoub@google.com>
>>>>
>>>> [Why]
>>>> This function and enum do not do generic checking on the luts but they
>>>> test color channels in the LUTs.
>>>
>>> I'm not sure there's anything inherently specific to channels, it seems like
>>> one could add a new test to reflect a HW limitation and it would fit pretty well
>>> in the lut check function. I wonder if it would be better to expose the types of
>>> tests required by the crtc such that the atomic_check could also do the test?
>>>
>> So the tests of the color are pretty unique to intel devices, no other
>> device is using it so I didn't think it adds a lot of benefit adding
>> it to the lut check. However, it's still in DRM because technically it
>> can be supported by any driver. But once it is, the driver will have
>> to expose the tests it wants so we can check it in atomic_check. but
>> given that no one does expose any test but intel, i just left it only
>> used by them.
>>
> 
> Yeah, understood. Regardless of that, the spirit of the function is not specific
> to the color channels in the LUT, so renaming as channels_check is probably not
> the correct fix. I'd probably lean towards stuffing this in i915 as a
> driver-specific check instead of renaming it.
> 

The checks could be generally useful for other drivers. I assume a lot
of HW wants the LUT to be non-decreasing and there might be other HW
out there that implements LUTs with a single channel that applies to
all colors. Since this is only used by i915 at the moment I don't have
a strong opinion about keeping it in DRM core or stuffing it into i915.

I agree with Sean that this function isn't specifically about color
channels. The function seems to be designed as a generic check for LUTs,
which is why the "tests" flag is passed in. DRM_COLOR_LUT_EQUAL_CHANNELS
is checking the channels but DRM_COLOR_LUT_NON_DECREASING doesn't
particularly have anything to do with the channels.

Harry

> Sean
> 
>>> Sean
>>>
>>>> Keeping the name explicit as more generic LUT checks will follow.
>>>>
>>>> Tested on Eldrid ChromeOS (TGL).
>>>>
>>>> Signed-off-by: Mark Yacoub <markyacoub@chromium.org>
>>>> ---
>>>>  drivers/gpu/drm/drm_color_mgmt.c           | 12 ++++++------
>>>>  drivers/gpu/drm/i915/display/intel_color.c | 10 +++++-----
>>>>  include/drm/drm_color_mgmt.h               |  7 ++++---
>>>>  3 files changed, 15 insertions(+), 14 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/drm_color_mgmt.c b/drivers/gpu/drm/drm_color_mgmt.c
>>>> index bb14f488c8f6c..6f4e04746d90f 100644
>>>> --- a/drivers/gpu/drm/drm_color_mgmt.c
>>>> +++ b/drivers/gpu/drm/drm_color_mgmt.c
>>>> @@ -585,17 +585,17 @@ int drm_plane_create_color_properties(struct drm_plane *plane,
>>>>  EXPORT_SYMBOL(drm_plane_create_color_properties);
>>>>
>>>>  /**
>>>> - * drm_color_lut_check - check validity of lookup table
>>>> + * drm_color_lut_channels_check - check validity of the channels in the lookup table
>>>>   * @lut: property blob containing LUT to check
>>>>   * @tests: bitmask of tests to run
>>>>   *
>>>> - * Helper to check whether a userspace-provided lookup table is valid and
>>>> - * satisfies hardware requirements.  Drivers pass a bitmask indicating which of
>>>> - * the tests in &drm_color_lut_tests should be performed.
>>>> + * Helper to check whether each color channel of userspace-provided lookup table is valid and
>>>> + * satisfies hardware requirements. Drivers pass a bitmask indicating which of in
>>>> + * &drm_color_lut_channels_tests should be performed.
>>>>   *
>>>>   * Returns 0 on success, -EINVAL on failure.
>>>>   */
>>>> -int drm_color_lut_check(const struct drm_property_blob *lut, u32 tests)
>>>> +int drm_color_lut_channels_check(const struct drm_property_blob *lut, u32 tests)
>>>>  {
>>>>       const struct drm_color_lut *entry;
>>>>       int i;
>>>> @@ -625,4 +625,4 @@ int drm_color_lut_check(const struct drm_property_blob *lut, u32 tests)
>>>>
>>>>       return 0;
>>>>  }
>>>> -EXPORT_SYMBOL(drm_color_lut_check);
>>>> +EXPORT_SYMBOL(drm_color_lut_channels_check);
>>>> diff --git a/drivers/gpu/drm/i915/display/intel_color.c b/drivers/gpu/drm/i915/display/intel_color.c
>>>> index dab892d2251ba..4bb1bc76c4de9 100644
>>>> --- a/drivers/gpu/drm/i915/display/intel_color.c
>>>> +++ b/drivers/gpu/drm/i915/display/intel_color.c
>>>> @@ -1285,7 +1285,7 @@ static int check_luts(const struct intel_crtc_state *crtc_state)
>>>>       const struct drm_property_blob *gamma_lut = crtc_state->hw.gamma_lut;
>>>>       const struct drm_property_blob *degamma_lut = crtc_state->hw.degamma_lut;
>>>>       int gamma_length, degamma_length;
>>>> -     u32 gamma_tests, degamma_tests;
>>>> +     u32 gamma_channels_tests, degamma_channels_tests;
>>>>
>>>>       /* Always allow legacy gamma LUT with no further checking. */
>>>>       if (crtc_state_is_legacy_gamma(crtc_state))
>>>> @@ -1300,15 +1300,15 @@ static int check_luts(const struct intel_crtc_state *crtc_state)
>>>>
>>>>       degamma_length = INTEL_INFO(dev_priv)->color.degamma_lut_size;
>>>>       gamma_length = INTEL_INFO(dev_priv)->color.gamma_lut_size;
>>>> -     degamma_tests = INTEL_INFO(dev_priv)->color.degamma_lut_tests;
>>>> -     gamma_tests = INTEL_INFO(dev_priv)->color.gamma_lut_tests;
>>>> +     degamma_channels_tests = INTEL_INFO(dev_priv)->color.degamma_lut_tests;
>>>> +     gamma_channels_tests = INTEL_INFO(dev_priv)->color.gamma_lut_tests;
>>>>
>>>>       if (check_lut_size(degamma_lut, degamma_length) ||
>>>>           check_lut_size(gamma_lut, gamma_length))
>>>>               return -EINVAL;
>>>>
>>>> -     if (drm_color_lut_check(degamma_lut, degamma_tests) ||
>>>> -         drm_color_lut_check(gamma_lut, gamma_tests))
>>>> +     if (drm_color_lut_channels_check(degamma_lut, degamma_channels_tests) ||
>>>> +         drm_color_lut_channels_check(gamma_lut, gamma_channels_tests))
>>>>               return -EINVAL;
>>>>
>>>>       return 0;
>>>> diff --git a/include/drm/drm_color_mgmt.h b/include/drm/drm_color_mgmt.h
>>>> index 81c298488b0c8..cb1bf361ad3e3 100644
>>>> --- a/include/drm/drm_color_mgmt.h
>>>> +++ b/include/drm/drm_color_mgmt.h
>>>> @@ -94,12 +94,12 @@ int drm_plane_create_color_properties(struct drm_plane *plane,
>>>>                                     enum drm_color_range default_range);
>>>>
>>>>  /**
>>>> - * enum drm_color_lut_tests - hw-specific LUT tests to perform
>>>> + * enum drm_color_lut_channels_tests - hw-specific LUT tests to perform
>>>>   *
>>>>   * The drm_color_lut_check() function takes a bitmask of the values here to
>>>>   * determine which tests to apply to a userspace-provided LUT.
>>>>   */
>>>> -enum drm_color_lut_tests {
>>>> +enum drm_color_lut_channels_tests {
>>>>       /**
>>>>        * @DRM_COLOR_LUT_EQUAL_CHANNELS:
>>>>        *
>>>> @@ -119,5 +119,6 @@ enum drm_color_lut_tests {
>>>>       DRM_COLOR_LUT_NON_DECREASING = BIT(1),
>>>>  };
>>>>
>>>> -int drm_color_lut_check(const struct drm_property_blob *lut, u32 tests);
>>>> +int drm_color_lut_channels_check(const struct drm_property_blob *lut,
>>>> +                              u32 tests);
>>>>  #endif
>>>> --
>>>> 2.33.0.1079.g6e70778dc9-goog
>>>>
>>>
>>> --
>>> Sean Paul, Software Engineer, Google / Chromium OS
> 

