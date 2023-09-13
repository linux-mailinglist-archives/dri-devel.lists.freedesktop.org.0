Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF03979F317
	for <lists+dri-devel@lfdr.de>; Wed, 13 Sep 2023 22:47:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3143110E0FF;
	Wed, 13 Sep 2023 20:47:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2061f.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e83::61f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27B8510E0FF;
 Wed, 13 Sep 2023 20:46:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PlBTpLX33FeV5V16hyWZyDN51onlpOJqL1VmxgAFX4l4lpm0PKx3wHk6kM/Z+OB3c4dWz3+nGoqDOxUvXwPAOSNb2d8xyDPLLPI1emGFujxKd8lnTFRmuQvPB8GmshNe1j9wBCAaQMJ/RI+mfEuAoVB2fKn4n80LHuOg15Cqa5ToVHk9gAJXvfxtDCzgPM5PFAMKLlyNPjcEdZAuiR6H3/4VtU6r4RRw0GtwGHJvAA+cidI5Dgry1K/SyFOXOHulJ2vDz/2SxRjW7N47r/ExXdh4rAfqol36yqjDxN0fMnOH+NIdLzf+lLybO6ZJ4+5JHNY1eB2+XJqjZwMeObD+fA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O9MNs8GnQg35c7YMstFoolv08+cirw57nc7zc/9diww=;
 b=OBKW3fPunxbxfTDE/4pvS+jaqWB5lYNTlpN/npzryCGbk3/d8eq/8tUeTI9fxmu20GS2sOosHMMc1Cl+U84T1nmXPPEh/hsh/YhZ9iYLi8mWnpUpZA8J4HQUTD1szJneklVErIy8pX/txnUIk6iHppgh4OIFaeINX+Sp6hNme43JgHXU+TiKcJJw1BZlRCy/+UyCyHyrBpEJPP+wGzJB2d1pbI56MZ7tjQayUuAut8dSqwAf2D6v410ItYNnAzGRoBP5W0UKaQsaMGTL2SKwEHnYIvAT+Dx5kW1qCu7X22qzxAsn1O0JpQACzPacoTEmnKGzuSiAjgFshLZUugJRZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O9MNs8GnQg35c7YMstFoolv08+cirw57nc7zc/9diww=;
 b=BJfQWp4xCgorYYMGduE5cm9XYZsgnmqKJUqA6g8wUeTdUuMLxab60QOS/ZovRVCVP/uKfZxK0356ksY0bralcUreIsN/OGkiTlDikitwC8Mh5VK6TyHigWvB//KRZTaDA3vdIBUB0fYu31aPiBjAuoseDx6uq3WPB19hipyqw64=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB6280.namprd12.prod.outlook.com (2603:10b6:8:a2::11) by
 IA0PR12MB8280.namprd12.prod.outlook.com (2603:10b6:208:3df::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.30; Wed, 13 Sep
 2023 20:46:54 +0000
Received: from DM4PR12MB6280.namprd12.prod.outlook.com
 ([fe80::4196:c9c9:dfe9:8079]) by DM4PR12MB6280.namprd12.prod.outlook.com
 ([fe80::4196:c9c9:dfe9:8079%3]) with mapi id 15.20.6768.029; Wed, 13 Sep 2023
 20:46:54 +0000
Message-ID: <327f018f-c810-4e99-8003-f0dfa9f7d156@amd.com>
Date: Wed, 13 Sep 2023 16:46:49 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amd/display: Fix -Wuninitialized in
 dm_helpers_dp_mst_send_payload_allocation()
Content-Language: en-US
To: Alex Deucher <alexdeucher@gmail.com>
References: <20230913-fix-wuninitialized-dm_helpers_dp_mst_send_payload_allocation-v1-1-2d1b0a3ef16c@kernel.org>
 <b11cce07-7e13-49b5-aed3-88517356281b@amd.com>
 <CADnq5_MsHwC94F_2SdyUM39FRoeVZMNa-8quxB4TVOVqM05=zQ@mail.gmail.com>
 <b1396feb-9bd5-4aa4-97b1-9d743fffe5ef@amd.com>
 <CADnq5_NZ6Bv5zyNxJc13Bb4bPmHTTDPEWqtV_VFt5y1gzsgGzQ@mail.gmail.com>
From: Hamza Mahfooz <hamza.mahfooz@amd.com>
In-Reply-To: <CADnq5_NZ6Bv5zyNxJc13Bb4bPmHTTDPEWqtV_VFt5y1gzsgGzQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQBPR0101CA0176.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:f::19) To DM4PR12MB6280.namprd12.prod.outlook.com
 (2603:10b6:8:a2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6280:EE_|IA0PR12MB8280:EE_
X-MS-Office365-Filtering-Correlation-Id: f0baafc3-768a-47e4-0851-08dbb49a9000
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nYCNdHhk53/YXiQCYjb9HpLcfMVk1Lh5ZnIWhka/rxiASTfkLVOqj+8oMR0NdC9A/I3rt3XrarWV9TalkhPodkqFXlgD1hj1GLqTDYGneP8ylVI36/MJ/hRvbvQc0bdac5/J+msfVU+AGZ+Db/+l2GUuvdvyozoSHkMVHGl04u2a/uk9DfuKuTdsyQKCc+KV1QHpMUa4Q8yWzMhlHuLxgKTc4sSl9BfhBQIXBzv1hPYShhXH0j7wb06D9QgYPM/WUJiPfQ9j/d2JStwJ5u8xQMAe/7xkJbYZ7XtbqZq8/KXwjf2KpFiXbwMCY3o7WESpm40Qg2XbJrQaiEDXQX0ojxd3GtflIXa1lvnS/Quhho1Wvg44Dsq8LKeHLJrt40VstjSqlrJvHAslLn36xxodMeJypef0WI/0NdnqhD+tBI06QturIGWhpO/lQTIpGeiZ6FbOfoq9YHmcbnAKNTSzId4i4GtuWxnUDYmEnJcTkdEpa6Bhiivn9AGc97eKY4GtO3N6h75eToAl9Jrdm+iKNxhhSQxPLW3zqLOIwb3MhCJhR85X2Ebgc+G/OPh7SdWoH+NXqQ6489XX3TNJ4rPIvu2+3xkRr4ZmCwYckf6dZZYjxrhcM1PiBgtZfb/UNMvA+MLf/qwYb99LimbZUq6pVw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB6280.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(366004)(346002)(376002)(396003)(136003)(451199024)(1800799009)(186009)(2906002)(53546011)(6486002)(6666004)(6506007)(478600001)(6512007)(83380400001)(966005)(8936002)(26005)(66476007)(6916009)(44832011)(66946007)(316002)(66556008)(41300700001)(4326008)(8676002)(5660300002)(36756003)(31696002)(86362001)(2616005)(38100700002)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Rnk0U1R3ZUQvN1NMeEFaQkdFUitqNG96c3VQNW92OWwrVktLZE1LeWo4eXRN?=
 =?utf-8?B?MjlpM0ZiWStBYiszMjkzNmJYdW5xbUR4S0YvSHZ6bmYvMXBjZzB5NUVNRVY0?=
 =?utf-8?B?dWNSVk05TmsyZ2J2Vmx5MzB5UGN1UG5HUjdtL3h6OW5lNHFaUG93VmhlZUNn?=
 =?utf-8?B?aEN4NHU1UUlSdjFLc0VIS0RmN25UUjBJWUZIbHJYenN6bEVOazJVTWk0ZFN4?=
 =?utf-8?B?Y3F2cm9pN0tOcy93SEFVaElFQ1cvYU83Zms2QXZQRTdZaFhQQjIxNm9xeGRN?=
 =?utf-8?B?Q1A3NEVsNWxtYVBESWRUVGZyTkpXdlR1VGZBcEtqQW0zZVFTZ0FvSExRazNk?=
 =?utf-8?B?Yy9NNmVlS09waW5jVEFTajJyeDRqMC9OWnB4V21ySHlZSHYzdFNSZUI1UHdm?=
 =?utf-8?B?cVN5SlVRTk5GbHlRRGYwUHhiekExQ0N2c0l0QlVTa3NHRmp3Z0pKblVWdGtq?=
 =?utf-8?B?d3ZmSjR3U05zeWh0RHdmS290bWVNd2lac3pwUWxZVk1pNmdHOVdORTJpeHZG?=
 =?utf-8?B?V3ZHSnZ4a21ha3dKemZybFhYSDhrRlZZQ3J3R1A5bVRPSDNQTG1QY1AzdU5j?=
 =?utf-8?B?NWd6NzdLQlFKYVBKSFQwQitSRlR0NmNmOXgva1hHVlVEUllTa2VNRm9rWjlL?=
 =?utf-8?B?VWhVNDU5QjF1T0NIUmk3Nld2ZmZMQVdyZEZZSlpaK0xrMHNwaTl0R2thMklN?=
 =?utf-8?B?Y0F4Nmg0YUhtcWtZQ0JaMUdsaFprSWprdXd3eU5CUVRKMU9kcFJHOU9NaEgr?=
 =?utf-8?B?WWxxRnYvL0RVOCsya0UraDhtZVhzdXg5bUFMRVR3dm1hNUVFZ3Z4b0ZqZGN4?=
 =?utf-8?B?cnE2WWJrTjR5MkFSaUdXY0t4QU5FNFFTVXo1TEkwOUYrMGNvM0FKR3I2ZzIy?=
 =?utf-8?B?SHdPbVR0aU1qRGZPaGVWZHlMU29FRmJod2pGSkhOMWxkTHhNNUk0eVZEdTc1?=
 =?utf-8?B?R3kxZlNtck41V09GT3JBc0FlNjhUK3JNRmRST3ducGIxaG03aDlBRmFHOGcw?=
 =?utf-8?B?amRPaSthaWdHYm9YTTRuY0FEOVB5VXM5YzBBZk1uUm5GdEdUcitGcnpCZFpT?=
 =?utf-8?B?MHJqeUxUMlVkRzBmQmh3RWt5VDBCU3lxNVpmT1hITEhLVHEzUWVVbHZ0VUxx?=
 =?utf-8?B?YkVnbHRFcWc0c0dSZkJLMGN0OWhidWdodnBWUFdheDVmSUZrTFN1R0lDd1Qr?=
 =?utf-8?B?Ukt1bWZpS1JKT0ZsQm5LNDNvN2o1blFsZXRVbXpYYjUwUHR0U1JwblQxQWtw?=
 =?utf-8?B?aGx5NjhlcDNMT0xxTXVLQmZmSmNzeWFGalg4TWlwdzhuQVpGUTRnYjc3ekww?=
 =?utf-8?B?Tm5EUUhaYnhWczJSTUNEakdobG93ZkpOUXFqeDBmaiswYmQ3NU81aGN3U1Q2?=
 =?utf-8?B?T1I0STdhUnZWeU13S2lZc1FQZ05YYkpKYUdQWlV2M2ZKL3dNMWJMNThRdU5Q?=
 =?utf-8?B?WkFpeWVhRC9zUUE2eXFkb3l6WVF4cDA5K2NJR283eXZXRnhxL2JtQlR5WWlS?=
 =?utf-8?B?bTZ6eDlkNTRKaDRPaHdaUm1rVmlNREx3aGh4UE9ZV2dIeFFJS1c0NTkwRENo?=
 =?utf-8?B?YlpsRmtUWSt2NDhxdkNuWCt6NGYrdDExWXdaazZadTEvVE5xQjRJd3R2OGlu?=
 =?utf-8?B?alhsbDlScys2cXltS3lLQUt4VFcvM1VkRVd0Rmg1V3ZsT3NRVW54aXJ2emJz?=
 =?utf-8?B?SDcxUkI0QmJiRlJJWjN5STlVeldDSW9wdFhEcUtudzJXeGFWN1dKWVd2L3Fa?=
 =?utf-8?B?WmVnZFhocjZqdzNNRFZwOCs2Q2toSFF0ZkxTYXNtT25NWm50SEd6OTZaWG00?=
 =?utf-8?B?M3A3UEZiMm10cW94OXloYmFZTmFURUJJV0FSUlpOYUxqWlRtMnM5UGpUREdM?=
 =?utf-8?B?bkRJR3BUOTJwazFzUWdiVGZBelJwRXNzaGVFUFVzcWRCaG1kT0V1TlU0ZzJx?=
 =?utf-8?B?a1BIZGJrMTRZWDlJS29XRTR1K1dvb2NzYW9QV2RuM1BnNWYzMnRrTFIwR0hl?=
 =?utf-8?B?WkRHT3ZxZ09XRDJlNUcxV213aVRMaHFMRTZMMWwzYkw0U3p0eVhwUVpTY1Bs?=
 =?utf-8?B?Q25sS0N3bmdybmFLbEdhcUFCUkNMZjZ3enBtZWdtWVlHT3FpSjI0ZHNIWTVq?=
 =?utf-8?Q?96NxTI18oghKFBYV7y7eG2FIh?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f0baafc3-768a-47e4-0851-08dbb49a9000
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6280.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2023 20:46:53.9006 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h7Umx80hgeHvfHAhFLxoB56uBWiHW9yYwclyomBhjLFUXjvgP0GgLb7RYyxk9WScrIRUrCtboLeohtgh4Pe9NA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8280
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
Cc: ndesaulniers@google.com, llvm@lists.linux.dev, sunpeng.li@amd.com,
 trix@redhat.com, Xinhui.Pan@amd.com, Rodrigo.Siqueira@amd.com,
 patches@lists.linux.dev, amd-gfx@lists.freedesktop.org,
 Nathan Chancellor <nathan@kernel.org>, dri-devel@lists.freedesktop.org,
 Wayne.Lin@amd.com, alexander.deucher@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 9/13/23 16:03, Alex Deucher wrote:
> On Wed, Sep 13, 2023 at 3:57 PM Hamza Mahfooz <hamza.mahfooz@amd.com> wrote:
>>
>>
>> On 9/13/23 15:54, Alex Deucher wrote:
>>> On Wed, Sep 13, 2023 at 12:17 PM Hamza Mahfooz <hamza.mahfooz@amd.com> wrote:
>>>>
>>>>
>>>> On 9/13/23 12:10, Nathan Chancellor wrote:
>>>>> When building with clang, there is a warning (or error when
>>>>> CONFIG_WERROR is set):
>>>>>
>>>>>      drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_helpers.c:368:21: error: variable 'old_payload' is uninitialized when used here [-Werror,-Wuninitialized]
>>>>>        368 |                                                  new_payload, old_payload);
>>>>>            |                                                               ^~~~~~~~~~~
>>>>>      drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_helpers.c:344:61: note: initialize the variable 'old_payload' to silence this warning
>>>>>        344 |         struct drm_dp_mst_atomic_payload *new_payload, *old_payload;
>>>>>            |                                                                    ^
>>>>>            |                                                                     = NULL
>>>>>      1 error generated.
>>>>>
>>>>> This variable is not required outside of this function so allocate
>>>>> old_payload on the stack and pass it by reference to
>>>>> dm_helpers_construct_old_payload(), resolving the warning.
>>>>>
>>>>> Closes: https://github.com/ClangBuiltLinux/linux/issues/1931
>>>>> Fixes: 5aa1dfcdf0a4 ("drm/mst: Refactor the flow for payload allocation/removement")
>>>>> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
>>>>
>>>> Reviewed-by: Hamza Mahfooz <hamza.mahfooz@amd.com>
>>>>
>>>> Hm, seems like this was pushed through drm-misc-next and as such our CI
>>>> didn't get a chance to test it.
>>>
>>> Can you push this to drm-misc?  That is where Wayne's patches landed.
>>> If not, I can push it.
>>
>> No need, I cherry-picked Wayne's patches to amd-staging-drm-next and
>> applied Nathan's fix.
> 
> Yes, but we can only have patches go upstream via one tree.  Wayne's
> patches are in drm-misc, so that is where the fix should be.  It's
> fine to have them in amd-staging-drm-next for testing purposes, but I
> won't be upstreaming them via the amdgpu -next tree since they are
> already in drm-misc.

In that case can you push it to drm-misc?

> 
> Alex
> 
>>
>>>
>>> Alex
>>>
>>>
>>>>
>>>>
>>>>> ---
>>>>>     drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c | 6 +++---
>>>>>     1 file changed, 3 insertions(+), 3 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
>>>>> index 9ad509279b0a..c4c35f6844f4 100644
>>>>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
>>>>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
>>>>> @@ -341,7 +341,7 @@ bool dm_helpers_dp_mst_send_payload_allocation(
>>>>>         struct amdgpu_dm_connector *aconnector;
>>>>>         struct drm_dp_mst_topology_state *mst_state;
>>>>>         struct drm_dp_mst_topology_mgr *mst_mgr;
>>>>> -     struct drm_dp_mst_atomic_payload *new_payload, *old_payload;
>>>>> +     struct drm_dp_mst_atomic_payload *new_payload, old_payload;
>>>>>         enum mst_progress_status set_flag = MST_ALLOCATE_NEW_PAYLOAD;
>>>>>         enum mst_progress_status clr_flag = MST_CLEAR_ALLOCATED_PAYLOAD;
>>>>>         int ret = 0;
>>>>> @@ -365,8 +365,8 @@ bool dm_helpers_dp_mst_send_payload_allocation(
>>>>>                 ret = drm_dp_add_payload_part2(mst_mgr, mst_state->base.state, new_payload);
>>>>>         } else {
>>>>>                 dm_helpers_construct_old_payload(stream->link, mst_state->pbn_div,
>>>>> -                                              new_payload, old_payload);
>>>>> -             drm_dp_remove_payload_part2(mst_mgr, mst_state, old_payload, new_payload);
>>>>> +                                              new_payload, &old_payload);
>>>>> +             drm_dp_remove_payload_part2(mst_mgr, mst_state, &old_payload, new_payload);
>>>>>         }
>>>>>
>>>>>         if (ret) {
>>>>>
>>>>> ---
>>>>> base-commit: 8569c31545385195bdb0c021124e68336e91c693
>>>>> change-id: 20230913-fix-wuninitialized-dm_helpers_dp_mst_send_payload_allocation-c37b33aaad18
>>>>>
>>>>> Best regards,
>>>> --
>>>> Hamza
>>>>
>> --
>> Hamza
>>
-- 
Hamza

