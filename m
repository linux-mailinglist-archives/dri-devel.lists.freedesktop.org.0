Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 150573A35B6
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jun 2021 23:14:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5A5889B96;
	Thu, 10 Jun 2021 21:14:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2071.outbound.protection.outlook.com [40.107.243.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A645189B96;
 Thu, 10 Jun 2021 21:14:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NPgvODL2nmLFJLtFk58BVEbkAHUwrn/AoaHbHxB0veiyrl8CI7ws1IiDYkMXi+KvwePCLvL9Sr9mVCKvgKs2hMgCrK3TTXO9sYj9i03+AyBC3/0mfxkF3KwnGeQOzEplMtmVjEMZulBpggCBLifgQkw2wsUl2HYXzDugzvhC+tCbSXHZeV11FnGrtsvJmrT5+8bhzJOB1UENVN6q32OvVPbElmHjuqI4VgnFB8MQ6NFZi/gQU95aZZ32tZDRnEqg2hWZg5qzyPJzI8nOt28wDNtvkdCjiaA78//vOxhteoqYgx7ziyfcQwqOA/N5Wz8jd2pKX1popDjCDdNBPxt7/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uYPeitdqz6Augrr52nTebZn7rIuFitlA2utAsNkDHQc=;
 b=bRNF4p/9mhd3plwd6n/l0p0labuiCklOdSKZEWSbbVPm2djyqDClKgY851h9ie/AiE8M6ZUUvlJrtsxgJH+UBXibQ9WC1cE0p3zlmscljt3Mcb3Y7oTsGsogygBq3JZfBA76QeOVjAPxqqtwjVJA6C8LsnCFplHHR46UHmjqtCPpoFkZ4vcZDaIzwvQcTIabzi+s1x/IdaxTLE1Of8L5ei0e2ajoFkAaxeQnvyYFO0JHW0VYxycoQtydwJe8ctm+RCoza7KR703/kHhba6MGiCHHIDcYQEuam5ZUwdQKlleBelNDCvWBvmSI5aP52vjp/8J3KZ/1tb5HfO5o1atr3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uYPeitdqz6Augrr52nTebZn7rIuFitlA2utAsNkDHQc=;
 b=RaHNcnLatWvzkfPW3WUQs84pNWG3RcM94bjggd0jvyxDiYog2LYjb/qTJxUAwgf/Lo6XySNCa7Qg+moFXXZbNZ0j91wZbWWwMmt3TPS/3wHoIex9pevrASi8fIUls8Hk20fbBKs5w1Owa3P7ngNKlXG5EOToS/w2I5NVhKHMUgg=
Authentication-Results: google.com; dkim=none (message not signed)
 header.d=none;google.com; dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by CO6PR12MB5441.namprd12.prod.outlook.com (2603:10b6:303:13b::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.22; Thu, 10 Jun
 2021 21:14:05 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::f455:b0b4:439:2753]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::f455:b0b4:439:2753%3]) with mapi id 15.20.4195.030; Thu, 10 Jun 2021
 21:14:05 +0000
Subject: Re: [PATCH] drm/amd/display: Verify Gamma & Degamma LUT sizes in
 amdgpu_dm_atomic_check
To: Mark Yacoub <markyacoub@chromium.org>
References: <20210604170107.2023162-1-markyacoub@chromium.org>
 <906d0ab3-ddca-8cb9-68f5-1b495cc4be5c@amd.com>
 <CAJUqKUr-s+r1Q-CEO6avH-X5T_Lwt3ZaG5tukygo0joHi8kCpA@mail.gmail.com>
From: Harry Wentland <harry.wentland@amd.com>
Message-ID: <2e289387-0101-6141-a1c4-ae0438e0c2b8@amd.com>
Date: Thu, 10 Jun 2021 17:14:02 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
In-Reply-To: <CAJUqKUr-s+r1Q-CEO6avH-X5T_Lwt3ZaG5tukygo0joHi8kCpA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [198.200.67.154]
X-ClientProxiedBy: YQXPR01CA0093.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c00:41::22) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.50.3] (198.200.67.154) by
 YQXPR01CA0093.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:c00:41::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4219.20 via Frontend Transport; Thu, 10 Jun 2021 21:14:04 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f60ca0c3-fabc-43a1-8e13-08d92c54adbb
X-MS-TrafficTypeDiagnostic: CO6PR12MB5441:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO6PR12MB5441BF17236DFE41F44689848C359@CO6PR12MB5441.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AkaS0lPskKkFvRXq6KkN3y50txNWcwXjvj5nf1Uhb7/3/E+zTvgrP3ZZT3jjtNm7qRCgnWcCbL5csFVehGCbebyiJIVZttNgYeA9MDK6vQ2I9UMLr9mbCJlj+1luKMfVXChmdKmhxBSw9NkiXL1vat5WIzWc4lqU5Mq6Nt5bd+nIAwk/QK6dLVmK3phFKBUYTUC0gBW9U0/zUajC0yx2j380RGO6OldrFU4MEb5fYnJoyJ4h37L071LGLLhMYNeW8V8I6UvCgci404pa4nnUyddUoHPwQURqwXuXf8wvBiPwAOmytXpSPOhAi/5vy5OO6i39pjcaq/z1Eqna8tvcEcGQGM2kIAiqx8dsU8CpF20Xg9yQtByLgLBvtvFn+C9mpe9dQQ0DZgBfKWjJ3uwMm7AlYeqA09vTVblp5ElaH2YtrPqFa9tUzZLB/KVQ9bnJ4e42zLbGrT+tbpx6oePVSa58EhV1SA73rx3/Wmvtb+eAH9lZ257X7RALxBMw10NaxLzoyZLiU3TWQXQEsNKn64J/6IM/uUGJxtok+/JxLmONCrxeFTTG0ki37tOHU9cp6C7kbfbMvy+gxB5ydAoAcaCWve973hXVyK4afX/F5XLlamfJducCwiySDmxRI00M5Gs9jkTmFHllDG9l+vf8FoJzvBdu0rHRoKB9iqQnXtjwbDIkmqQ5+sTVay8IoOCiD95/ltqv2OFtqVkWVkiTN9zZT4VCVPrBshPJoVnNxZI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(376002)(136003)(366004)(39850400004)(396003)(316002)(66946007)(66476007)(186003)(16526019)(86362001)(5660300002)(31686004)(2906002)(66556008)(53546011)(2616005)(36756003)(478600001)(4326008)(16576012)(966005)(31696002)(54906003)(8676002)(6916009)(44832011)(83380400001)(8936002)(6486002)(956004)(38100700002)(26005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?czdRYlZVSGxyaVlYU2YvRVA0MUp4amlnTDY0akpVbFVzT1V1ZEhteXpyOVVE?=
 =?utf-8?B?RkJ2RDhBMjdtS1ZObmdqZ3ZXenY1dWdTbHNQQ2hsOEswVXNjMmRmM0RodElj?=
 =?utf-8?B?ZE1KSmgzK3A4SDltM3k4M21wazRtQkp1ZnMwS0ZEai9JaUF0dXVOSTZWMXBn?=
 =?utf-8?B?ZmFpNHQ4ZCtqVW45ODh2VjFBd09TWW03cVVmSlcrTkJrSEVXSEsvb09tY1p5?=
 =?utf-8?B?SEk4aHQ1TGIxM2N3Ynp0dzlKaWdOamhlUXluWHJDa1Foa3dIQjByRDlqNTBu?=
 =?utf-8?B?cmlxL1h1SGxNSjk2Qnh2SWd0OHZCcitiMGZZOWQ4R2k1bHpBUDltbDZIOWRi?=
 =?utf-8?B?b0U2NFFpVnRRTUxPMTZlZzR6dWlDYUVkQjdJcENjazdiUFl3c2psSCtFUEIy?=
 =?utf-8?B?RlUrbFNxQytmakVId0tlcDZNMXJTZll6NUhXeWtFNEwzVGcyZjNNVGNaV1dy?=
 =?utf-8?B?SEE5dDQ2TDZTTmxTaUFLWmlBREJ4eVpid0FGdmJBZ25NQWtHUlZZdlJWMTVv?=
 =?utf-8?B?WStScTd1U2QzK2hHTlBBT1l4SmZtMlJzblhmVDF3cXF6RGZzVDhqTnNhZDNU?=
 =?utf-8?B?NHNXS1JYS1dMTCsxbjMvYUNkMU9ROFVQWGpzdXhVVS95ZFo2OHB6Ym53TTlJ?=
 =?utf-8?B?WWZ1amQ0TmM2VzVSNkY4SjNsdEc0cjVHZnlGUXI4Q2NWOXo0WVZnYWw5cVFL?=
 =?utf-8?B?UTNBMlBpYldyOCtOMTl3ektLN0xkTG5CVmZUR3RLZGxneDRIalVnWUZqLzVl?=
 =?utf-8?B?ZFNkeWVZU1hCTVIwdDZPd0J4U1A3bVFJV2J4a3djSjhzcmJoYUJRTmZxVmNu?=
 =?utf-8?B?YmpCcHRvUWdyc0xnYmIySllPRlorZFYwaXBqTmc0dGpVV0R4ZmNGZXJ2Szdy?=
 =?utf-8?B?MWwvRm5qb0lncmFoWlpmdUtrd1lYRDR5MmNVZ1gyNEVxY3hDR0RuaFdNNWMr?=
 =?utf-8?B?YTNaYUladVNVWWdrUlFVWTVEc1FhUHFPbHN4Z01odHo1M3hLZzlUNllpdUhK?=
 =?utf-8?B?MG5mODZSUTl2QW5MdUVuWXRVa2o3ZFRZMzhMbzh3dXZBTmtCTGp5UzlKMEFH?=
 =?utf-8?B?YUFKdVA0TG0wWllQQ1JoaGtRbjQ5SFZOMldGM2pkTUxXMFZWbEhiaVdLZjNZ?=
 =?utf-8?B?Q1E2Z0lnV3FjelZqelhSdm5nV0RDdUlPekFRT2pIeUxLcW9OSWNtaCszYmNO?=
 =?utf-8?B?OVVMNWh4blMzdXk5RjRjMXpLSnEzWW1va3RlZTNPQWNxSUhnSTRUMUpvc2dW?=
 =?utf-8?B?VERleGZTZlY1VlZRZExiVTVIYU5qbDlZRVBxeS81eVhCWHF6US9VU1llUExI?=
 =?utf-8?B?bUs3cENxaEhZUVF1bnh3aVBIdHhZR0xNUzh0U3QvK3V6YjF6bSs4ZVUwcjdO?=
 =?utf-8?B?eGJPcjJGS1lyeTZ1Q2pmcTcyT2o5OS9TVFFYUHZJMHhtYXZzb2dHb3BQRWFT?=
 =?utf-8?B?d05NbjcvdnUxQUZIdENSWmpobjhkOWxXMVF1NVBMbnZ5NTlGQ3lIWTZXY0tU?=
 =?utf-8?B?RW5zdDk0MkxKclhDWERLenlPNmpwYmtsdDE3QjB5enN6TkNrUjFGdCtXRzZJ?=
 =?utf-8?B?a2JmZ1g0bHhRd2t2SFZrMUkvSm12aWJjMHFSRTB0aENqWlcxRFZSZklqT2lF?=
 =?utf-8?B?QlB3UmxRWHBIUElMWnprZldjSUg3cjcrTzVZaTJiRWJNR1RwQ1N1WjluS0tJ?=
 =?utf-8?B?SE1QeWVPcHgrTFRHK3BxZWVXTjhQQnFtQUlpelUrUWNWQ0VwWGdEck5hL2d5?=
 =?utf-8?Q?nyOHCfPOmlgzgEcQnlU1I/N3SJd+VZKhRiPSrVd?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f60ca0c3-fabc-43a1-8e13-08d92c54adbb
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2021 21:14:05.5978 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +sadVWTjgoUYSF/wVU3FZi8WHl7Zj3vNQxGtJyPDRvUYmthtny6K/rLJi57/giIxTvOahbanXGCQj4Br36t+yw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR12MB5441
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
Cc: "Siqueira, Rodrigo" <rodrigo.siqueira@amd.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Sean Paul <seanpaul@chromium.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, "Deucher,
 Alexander" <alexander.deucher@amd.com>, Mark Yacoub <markyacoub@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2021-06-07 10:53 a.m., Mark Yacoub wrote:
> On Fri, Jun 4, 2021 at 4:17 PM Harry Wentland <harry.wentland@amd.com> wrote:
>>
>>
>>
>> On 2021-06-04 1:01 p.m., Mark Yacoub wrote:
>>> From: Mark Yacoub <markyacoub@google.com>
>>>
>>> For each CRTC state, check the size of Gamma and Degamma LUTs  so
>>> unexpected and larger sizes wouldn't slip through.
>>>
>>> TEST: IGT:kms_color::pipe-invalid-gamma-lut-sizes
>>>
>>> Signed-off-by: Mark Yacoub <markyacoub@chromium.org>
>>> Change-Id: I9d513a38e8ac2af1b4bf802e1feb1a4d726fba4c
>>> ---
>>>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  3 ++
>>>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h |  1 +
>>>  .../amd/display/amdgpu_dm/amdgpu_dm_color.c   | 40 ++++++++++++++++---
>>>  3 files changed, 38 insertions(+), 6 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>>> index 38d497d30dba8..f6cd522b42a80 100644
>>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>>> @@ -9402,6 +9402,9 @@ static int amdgpu_dm_atomic_check(struct drm_device *dev,
>>>                       dm_old_crtc_state->dsc_force_changed == false)
>>>                       continue;
>>>
>>> +             if ((ret = amdgpu_dm_verify_lut_sizes(new_crtc_state)))
>>> +                     goto fail;
>>> +
>>>               if (!new_crtc_state->enable)
>>>                       continue;
>>>
>>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
>>> index 8bfe901cf2374..1b77cd2612691 100644
>>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
>>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
>>> @@ -541,6 +541,7 @@ void amdgpu_dm_trigger_timing_sync(struct drm_device *dev);
>>>  #define MAX_COLOR_LEGACY_LUT_ENTRIES 256
>>>
>>>  void amdgpu_dm_init_color_mod(void);
>>> +int amdgpu_dm_verify_lut_sizes(const struct drm_crtc_state *crtc_state);
>>>  int amdgpu_dm_update_crtc_color_mgmt(struct dm_crtc_state *crtc);
>>>  int amdgpu_dm_update_plane_color_mgmt(struct dm_crtc_state *crtc,
>>>                                     struct dc_plane_state *dc_plane_state);
>>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
>>> index 157fe4efbb599..da6f9fcc0b415 100644
>>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
>>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
>>> @@ -284,6 +284,37 @@ static int __set_input_tf(struct dc_transfer_func *func,
>>>       return res ? 0 : -ENOMEM;
>>>  }
>>>
>>> +/**
>>> + * Verifies that the Degamma and Gamma LUTs attached to the |crtc_state| are of
>>> + * the expected size.
>>> + * Returns 0 on success.
>>> + */
>>> +int amdgpu_dm_verify_lut_sizes(const struct drm_crtc_state *crtc_state)
>>> +{
>>> +     const struct drm_color_lut *lut = NULL;
>>> +     uint32_t size = 0;
>>> +
>>> +     lut = __extract_blob_lut(crtc_state->degamma_lut, &size);
>>> +     if (lut && size != MAX_COLOR_LUT_ENTRIES) {
>>
>> Isn't the point of the LUT size that it can be variable? Did you observe any
>> problems with LUTs that are not of size 4096?
> Is it supposed to be variable?
> I'm basing my knowledge of LUTs on this IGT Test:
> https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/blob/master/tests/kms_color_helper.c#L281>> It does check for invalid sizes and for the exact size, giving me the
> impression that it's not too flexible.
> Is variability of size an AMD specific behavior or should it be a DRM behavior?
>>
>> Legacy X-based userspace will give us 256 size LUTs. We can't break support for
>> that. See MAX_COLOR_LEGACY_LUT_ENTRIES.
> In the new function `amdgpu_dm_verify_lut_sizes`, I maintained parity
> with the old behavior. In `amdgpu_dm_update_crtc_color_mgmt`, the
> degamma size is only checked against `MAX_COLOR_LUT_ENTRIES` while
> regamma_size size is checked against both MAX_COLOR_LUT_ENTRIES and
> MAX_COLOR_LEGACY_LUT_ENTRIES:
> https://gitlab.freedesktop.org/agd5f/linux/-/blob/amd-staging-drm-next/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c#L321>> Also, in the definition of MAX_COLOR_LEGACY_LUT_ENTRIES, it mentions
> "Legacy gamm[sic] LUT" not degamma:
> https://gitlab.freedesktop.org/agd5f/linux/-/blame/amd-staging-drm-next/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h#L616>> As well as the commit when it was introduced, it seems to be handling
> gammas rather than degamma LUTs:
> https://gitlab.freedesktop.org/agd5f/linux/-/commit/086247a4b2fba49800b27807f22bb894cd8363fb>> Let me know if this would be a bug in the old behavior and I can fix
> it, or if i'm missing something.

Ah, yes, you're right, of course. Thanks for walking me through it. :)

Reviewed-by: Harry Wentland <harry.wentland@amd.com>

Harry

>>
>> Harry
>>
>>> +             DRM_DEBUG_DRIVER(
>>> +                     "Invalid Degamma LUT size. Should be %u but got %u.\n",
>>> +                     MAX_COLOR_LUT_ENTRIES, size);
>>> +             return -EINVAL;
>>> +     }
>>> +
>>> +     lut = __extract_blob_lut(crtc_state->gamma_lut, &size);
>>> +     if (lut && size != MAX_COLOR_LUT_ENTRIES &&
>>> +         size != MAX_COLOR_LEGACY_LUT_ENTRIES) {
>>> +             DRM_DEBUG_DRIVER(
>>> +                     "Invalid Gamma LUT size. Should be %u (or %u for legacy) but got %u.\n",
>>> +                     MAX_COLOR_LUT_ENTRIES, MAX_COLOR_LEGACY_LUT_ENTRIES,
>>> +                     size);
>>> +             return -EINVAL;
>>> +     }
>>> +
>>> +     return 0;
>>> +}
>>> +
>>>  /**
>>>   * amdgpu_dm_update_crtc_color_mgmt: Maps DRM color management to DC stream.
>>>   * @crtc: amdgpu_dm crtc state
>>> @@ -317,14 +348,11 @@ int amdgpu_dm_update_crtc_color_mgmt(struct dm_crtc_state *crtc)
>>>       bool is_legacy;
>>>       int r;
>>>
>>> -     degamma_lut = __extract_blob_lut(crtc->base.degamma_lut, &degamma_size);
>>> -     if (degamma_lut && degamma_size != MAX_COLOR_LUT_ENTRIES)
>>> -             return -EINVAL;
>>> +     if ((r = amdgpu_dm_verify_lut_sizes(&crtc->base)))
>>> +             return r;
>>>
>>> +     degamma_lut = __extract_blob_lut(crtc->base.degamma_lut, &degamma_size);
>>>       regamma_lut = __extract_blob_lut(crtc->base.gamma_lut, &regamma_size);
>>> -     if (regamma_lut && regamma_size != MAX_COLOR_LUT_ENTRIES &&
>>> -         regamma_size != MAX_COLOR_LEGACY_LUT_ENTRIES)
>>> -             return -EINVAL;
>>>
>>>       has_degamma =
>>>               degamma_lut && !__is_lut_linear(degamma_lut, degamma_size);
>>>
>>
> -Mark
> 

