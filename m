Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D7E3673E06
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jan 2023 16:57:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE35810E05C;
	Thu, 19 Jan 2023 15:57:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2061.outbound.protection.outlook.com [40.107.96.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A1C510E05C;
 Thu, 19 Jan 2023 15:57:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F+p8LK1Eah9aEWOXiG1skeCjWtiy+8Y9SK1CfdjctjfQarxmHVC9cv1IKT7ibaFol32pu5t0UgM4AiVVx3pfz3T2WfcK8UvyXDWrGB5uovbyjNQpyczllOjUGJAfGSJxPi4R2YTSjIC67jwiWcX7+P9esjmprPJebsRKWEqEBDNBGmc2sWHjgT9bjtckEmtx++77xN40N8YKl0YblDluUON+P9dAiB9JhnscFhHQadZ/NdgSzuzokyvFNOfwZnkYvDAVIS5avEGpCyDMWD5Rp5BOmHlpge1VRz/DStslkYd+onpHNpdvf4mWbdzfUYBoPfpjtvzzDbh8iLi5DDaTDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tnCNn0gLW5pyQY9l/0jxdZdFCC9ASyk7kM+M8ToF974=;
 b=LXkqSwTAj3qj3gFXI3nR4XpptVwS71NpK93EC+zlbPAYKDM8viUl4b0ymKzvFyXQYX4uBMP0PmMNzdGEw/svTF7TaqYB+HZPhhOvQSEvgJMxIUjdTDOneiFkNYUZDVjSluHnL34GdZ9xbwV4/sRvraH4vAyFkHkvk8VkoACjPbBD4yva2fHAuRDlA6z52jCmLM8aOcU3fcWVWNGN/E1wLes0n5SCqM2n820JwjBQ9jGgnXgg1qRZTnLESZcN+oZw/I9xP2Ypvw3d1L+uA+TJkuF2fPAfm7teJtOUgL920xr56xrbZeGe8DO9yM6jbzl7R/owZVQnNdkJPDVhiqqJpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tnCNn0gLW5pyQY9l/0jxdZdFCC9ASyk7kM+M8ToF974=;
 b=cevjevnBxWZaAPaYTyZiKz6nU3NCi+RghO53gtP1y760zW6iImA+EM7ttigWjmdiVVMUQJfjzGr9C+MmHwVxPFVBSPPPHb/NViiDjtzhU0TqOXtDWm5Aqpd2Br/PHeFIlW12s8Mnsx7uf8vy5bh651SSljARxTs131PNfdQeZBE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by SA1PR12MB6847.namprd12.prod.outlook.com (2603:10b6:806:25e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.26; Thu, 19 Jan
 2023 15:57:19 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::152b:e615:3d60:2bf0]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::152b:e615:3d60:2bf0%5]) with mapi id 15.20.6002.025; Thu, 19 Jan 2023
 15:57:19 +0000
Message-ID: <e5d0b837-2fd3-7bfa-155b-d80418dc2e79@amd.com>
Date: Thu, 19 Jan 2023 10:57:14 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [RFC PATCH v3 1/3] drm: Introduce solid fill property for drm
 plane
Content-Language: en-US
To: Jessica Zhang <quic_jesszhan@quicinc.com>, freedreno@lists.freedesktop.org
References: <20230104234036.636-1-quic_jesszhan@quicinc.com>
 <20230104234036.636-2-quic_jesszhan@quicinc.com>
 <c380bb1b-6e65-23c4-6e6b-29ce410b6baa@amd.com>
 <512bf32f-b8d2-91b7-a23c-1905354ff0e9@quicinc.com>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <512bf32f-b8d2-91b7-a23c-1905354ff0e9@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQBPR01CA0134.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:1::34) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|SA1PR12MB6847:EE_
X-MS-Office365-Filtering-Correlation-Id: f428f3b0-b6aa-4542-00c6-08dafa35d819
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wvD3TFwWH3qWZzULv3sogR6fQXBd+NZ3aF1D3piO1T0WD4sk4O/tTFeGonYhc/ePab5AoBPF5hfARUIT3AuZsZcBNd0qU56QnjdIo32YtJxh2QFfMIpvOUcnnZ4VAHNE11EguK3qhYSxsDU95wGZM9Y8C7GuTsE0Ou+DW8tOW6tNDmLqlrVzWbttro04I5C5qFUtPuxJwPnXB6uZtWTtq8EgZs1877eEdaQ3aRACxpvP5VjQILP33P1qlcivfr8rIgVFJPIDdYdhLOqoGnITR7hTzy7/cMBd4sYm5BjdjbsvtUU4UzW8Ij15OjMytbxIDT17Vb0695qJmKWjvrZTmZ1wQT04uJiPpn6vH0yROraJLtmUhInERSFv5XdHnuIIZhWKWwr9gbq6gSbtPGloxu7eR9qgsf86HekhTyzR1GXBgX6Ro3eLz8w1BvZdeYH+bOUE06KbI/dXMpXNB2hDIJgI2hC8p3WS1AYXnOHKQFxjGMdcAgNNXb8tgqt5TdUYVZ+WY3kz0fp/GGPlZzyj9HdG+ZaGjCy6byUd6O7hxBy0veD4UwKaM4grBxOwlOEEjyoII5hO/dTXE7YU7G9ok5Re+t3uDrypYlmehyqCOgW/Pm0iFR05v7I3mvyx16jP1AB4lbFMlP5L/58qva6fBmsrc11IFdYVBWLkzZ7M8DPrLhberYqNbXjs2ikjJdDl0cXeMTe4cqStpjjBZxi6+R/kJbLGczoPsscZKWZ+G09v+HySc3+vElTkMSu+yLpxsrEJ8n/3CgaftIxrygXOQA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(396003)(346002)(39860400002)(366004)(136003)(451199015)(316002)(2616005)(7416002)(4326008)(5660300002)(8936002)(38100700002)(41300700001)(8676002)(26005)(36756003)(6512007)(186003)(83380400001)(30864003)(66556008)(66946007)(66476007)(44832011)(31686004)(6666004)(31696002)(86362001)(2906002)(6486002)(966005)(6506007)(478600001)(53546011)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TEJONTQ0RndRYXRpQm05VjhMUkNkZkk4bTRmc2w0Y3BvMjRRRm1CVTVqNFBa?=
 =?utf-8?B?T0dyTFdPMjhBNzI5U3pDRGZ1Mzc1eFZjRGhmbUgrNVJzQ3VTQjhZdnlodFhn?=
 =?utf-8?B?dytTTENwNHpCb0ozTE1hQ1RHVHNwSFpCd1NEZ0dhTGc5VDUyQVNrTGNHVWZR?=
 =?utf-8?B?Y01LOWl6eEtMdFliYUNFZXRkK1VENFBGdHFadGVMaWh0aDBvRmZtaEE5Kzls?=
 =?utf-8?B?NkJSOHpoTVdDQTJkbjlsZUY3aEtjVC83Y2ZXNnllL3daVkk5ZE96eWUvTDBl?=
 =?utf-8?B?Um1jMnRnKzIrVVA0U2JVUXVyQ3UzZjk3R1ppSkhZRm5UVWUxZHVodzJuMHJV?=
 =?utf-8?B?TDNFRWNDVU5PZGdxSUVjcEJoUEFGNkIwRkhLaG9DVG5kdW5kSmhNY0IvVUhJ?=
 =?utf-8?B?MDNGUHdHbWZWcis4bXkvWmxKQXBtOXMrUHNZRU1LU2xySFQyRjBXMUwvaTRl?=
 =?utf-8?B?NWpqWGhRYlVYajJ5M1doUWVPRGM0a0R3QXdCTU5ia0FhbU05OUtBcTRwdjNB?=
 =?utf-8?B?S21jeTRlWTdHaHBTRVNNeUgrU1dReGd0cWdWYS9xcG1yQlRXMFF4dEQ3cWJU?=
 =?utf-8?B?M2RLMm04RG1Xa2RaakhlU0RQSlprbXVmS3V6TU1KR3dsU0NrbDF4QUZuVnE5?=
 =?utf-8?B?Mm94eE9Qb1F2STc0SXJyaXpSL2lTaGZCNHlWVWFvRlhPT3JyUUFaVVJDU0NV?=
 =?utf-8?B?eGJPWEJkQ3c3S0puZzhxRUNITnQybTU1WGZZQWZ6QlJXNGRxOThybGo2dUI5?=
 =?utf-8?B?UGpqcHVuUm9hQW1Vbk1jRE9CK1Q0YldzTTlHNE5IT21jNUxsVlhhK1lPb3NB?=
 =?utf-8?B?ZVcvcnp1N1NMVit2b0gzdDVvUEVlNTYvSjV6a2FHTnJ1UnM1VWZIUTdEb0pO?=
 =?utf-8?B?dlRWOCttdkJ5bENreGRnUHpDWUwzb2hWc25VWmU3bWV1bFNIbjlUbzluZDkx?=
 =?utf-8?B?UWwvcENHYlFiZSswQWRqdWhVcVcxa2J0RGd5OUpyV1p5SndIRFdMZW5SSXV5?=
 =?utf-8?B?QURQeGNHY0ZNb0VpalRQTExNaDNEQ3V6TmNsUlgrQ2tDNFhBdXkxRjBEUEhM?=
 =?utf-8?B?Y3ZTVkRBeVpqZHNjNGd4TXRoUXNzT3JPWXhFUVBvS294RUlKZU1wRTFDeHNv?=
 =?utf-8?B?REhlSDFPbWRpQ04vcTJTVUVYLzN2WGZ5dzVTKytkUkJobG1raDgvQWpvemRr?=
 =?utf-8?B?dFRoQVd1NEt3a0YxWDJudlp2ZDEzZXdjOHMxU1JRT21HR1BDcWxsQjRaaTlo?=
 =?utf-8?B?YWY5Z21iaVphbGlUa0JOK0NsQ2NybnFKZldEZ2hEODBmMEY4WExmWHc2QURJ?=
 =?utf-8?B?ZDBnMTdaTEU3MnBRQjRucE15a05xQmF0N09GQ0xWNWV5MDFRT0g2dWtaU3JI?=
 =?utf-8?B?UDFRRkN2V0RKUzAzMms0RTZhbWdaMUdBVzEzY1NrNTdiTDZtRVZxOGoxeHVM?=
 =?utf-8?B?M1VOZVhXUW9Ia3RJazlHSGhXbmFyeVZla3V0YTZsSnhiS3l1bFlVTmt0eFJV?=
 =?utf-8?B?R2VQVHZnVjB4WC94cnd4aWJxbGdCMmprRWh5UlljTEEwM3E4cUlxbUJwWlBF?=
 =?utf-8?B?SlNPenRGZzVyWHc0TWk0NjR4VHlLcjB6NThrbTlLR09YeTRQSHVrUEl0NTg5?=
 =?utf-8?B?OXpkSGdRRkl5bHY1YU5GYnowM2hQUHB2Y3NYQXRQMS9GMzROVWg3amlxL3k0?=
 =?utf-8?B?eTBXZGJwWFVrREhQTXlQNGlPTlFFblhPRlJoR3FSeE1LRngxWFk4TGt2RWQz?=
 =?utf-8?B?Qmw4anZ5ZTdkVXhWdFBFTmVtZ2FqVTZjak9XL0JSamlRcE1UNGV5NEQvWFRK?=
 =?utf-8?B?UnJWZ3U0N3NwaTJxK1dORklkdU43RUppWjJ0aDR2SkVUNCtCSmFIVVJlaDBH?=
 =?utf-8?B?RUJpSmF1dm05V3hzU0lNMUs4NGJOUkExdTNrdU9xOHgxbG1UMGNxRWMzU2tv?=
 =?utf-8?B?L3dvNW5IWlJhaW1QUW5ONkhlbEh6SDcvREtjeWkzendZMzRuUGJJVExTMkU4?=
 =?utf-8?B?aEpjK0dJR3FLUlB4M3NQZkc4N2pnNHpDS3ZtU3QyNGN0UWNwaWhLbkdDRHU4?=
 =?utf-8?B?SW5ESm9iT1gvS3RCMFlvMGYxa0E5VytmUitWdkQzN1JSUGN0SXlKVFR3OFNF?=
 =?utf-8?Q?iBMhmAA2RWUiYGTMiGmwGVmL6?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f428f3b0-b6aa-4542-00c6-08dafa35d819
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2023 15:57:19.4117 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p0a5KZMbYGhyDHN7JdUKk+hbUqBJVl2MJy9JS4xeqSoCWfoKRC0sbZ98rePNgQU4fSeV2TOI14RwWgDRdAdB3A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6847
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
Cc: sebastian.wick@redhat.com, linux-arm-msm@vger.kernel.org,
 quic_abhinavk@quicinc.com, dri-devel@lists.freedesktop.org,
 swboyd@chromium.org, ppaalanen@gmail.com, seanpaul@chromium.org,
 laurent.pinchart@ideasonboard.com, daniel.vetter@ffwll.ch,
 dmitry.baryshkov@linaro.org, wayland-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 1/18/23 17:53, Jessica Zhang wrote:
> 
> 
> On 1/18/2023 10:57 AM, Harry Wentland wrote:
>> On 1/4/23 18:40, Jessica Zhang wrote:
>>> Add support for solid_fill property to drm_plane. In addition, add
>>> support for setting and getting the values for solid_fill.
>>>
>>> solid_fill holds data for supporting solid fill planes. The property
>>> accepts an RGB323232 value and the driver data is formatted as such:
>>>
>>> struct drm_solid_fill {
>>>     u32 r;
>>>     u32 g;
>>>     u32 b;
>>> };
>>
>> Rather than special-casing this would it make sense to define this
>> as a single pixel of a FOURCC property?
>>
>> I.e., something like this:
>>
>> struct drm_solid_fill_info {
>>     u32 format; /* FOURCC value */
>>     u64 value; /* FOURCC pixel value */
>> }
>>
>> That removes some ambiguity how the value should be interpreted, i.e.,
>> it can be interpreted like a single pixel of the specified FOURCC format.
>>
>> It might also make sense to let drivers advertise the supported
>> FOURCC formats for solid_fill planes.
> 
> Hi Harry,
> 
> The initial v1 of this RFC had support for taking in a format and such, but it was decided that just supporting RGB323232 would work too.
> 
> Here's the original thread discussing it [1], but to summarize, the work needed to convert the solid fill color to RGB is trivial (as it's just a single pixel of data). In addition, supporting various formats for solid_fill would add complexity as we'd have to communicate which formats are supported.
> 
> [1] https://lists.freedesktop.org/archives/dri-devel/2022-November/379148.html
> 

Make sense, and thanks for summarizing.

The only comment I would have left then, is that maybe it'd be good to add
an alpha value. I think it was suggested by someone else as well.

>>
>> Is there an implementation for this in a corresponding canonical
>> upstream userspace project, to satisfy [1]? If not, what is the plan
>> for this? If so, please point to the corresponding patches.
> 
> The use case we're trying to support here is the Android HWC SOLID_FILL hint [1], though it can also be used to address the Wayland single pixel FB protocol [2]. I'm also planning to add an IGT test to show an example of end to end usage.
> 
> [1] https://android.googlesource.com/platform/hardware/interfaces/+/refs/heads/master/graphics/composer/aidl/android/hardware/graphics/composer3/Composition.aidl#52
> 
> [2] https://gitlab.freedesktop.org/wayland/wayland-protocols/-/merge_requests/104
> 

Makes sense.

Harry

> Thanks,
> 
> Jessica Zhang
> 
>>
>> [1] https://dri.freedesktop.org/docs/drm/gpu/drm-uapi.html#open-source-userspace-requirements
>>
>> Harry
>>
>>>
>>> To enable solid fill planes, userspace must assigned solid_fill to a
>>> property blob containing the following information:
>>>
>>> struct drm_solid_fill_info {
>>>     u8 version;
>>>     u32 r, g, b;
>>> };
>>>
>>> Changes in V2:
>>> - Changed solid_fill property to a property blob (Simon, Dmitry)
>>> - Added drm_solid_fill struct (Simon)
>>> - Added drm_solid_fill_info struct (Simon)
>>>
>>> Changes in V3:
>>> - Corrected typo in drm_solid_fill struct documentation
>>>
>>> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
>>> ---
>>>   drivers/gpu/drm/drm_atomic_state_helper.c |  9 ++++
>>>   drivers/gpu/drm/drm_atomic_uapi.c         | 59 +++++++++++++++++++++++
>>>   drivers/gpu/drm/drm_blend.c               | 17 +++++++
>>>   include/drm/drm_blend.h                   |  1 +
>>>   include/drm/drm_plane.h                   | 43 +++++++++++++++++
>>>   5 files changed, 129 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/drm_atomic_state_helper.c b/drivers/gpu/drm/drm_atomic_state_helper.c
>>> index dfb57217253b..c96fd1f2ad99 100644
>>> --- a/drivers/gpu/drm/drm_atomic_state_helper.c
>>> +++ b/drivers/gpu/drm/drm_atomic_state_helper.c
>>> @@ -253,6 +253,11 @@ void __drm_atomic_helper_plane_state_reset(struct drm_plane_state *plane_state,
>>>       plane_state->alpha = DRM_BLEND_ALPHA_OPAQUE;
>>>       plane_state->pixel_blend_mode = DRM_MODE_BLEND_PREMULTI;
>>>   +    if (plane_state->solid_fill_blob) {
>>> +        drm_property_blob_put(plane_state->solid_fill_blob);
>>> +        plane_state->solid_fill_blob = NULL;
>>> +    }
>>> +
>>>       if (plane->color_encoding_property) {
>>>           if (!drm_object_property_get_default_value(&plane->base,
>>>                                  plane->color_encoding_property,
>>> @@ -335,6 +340,9 @@ void __drm_atomic_helper_plane_duplicate_state(struct drm_plane *plane,
>>>       if (state->fb)
>>>           drm_framebuffer_get(state->fb);
>>>   +    if (state->solid_fill_blob)
>>> +        drm_property_blob_get(state->solid_fill_blob);
>>> +
>>>       state->fence = NULL;
>>>       state->commit = NULL;
>>>       state->fb_damage_clips = NULL;
>>> @@ -384,6 +392,7 @@ void __drm_atomic_helper_plane_destroy_state(struct drm_plane_state *state)
>>>           drm_crtc_commit_put(state->commit);
>>>         drm_property_blob_put(state->fb_damage_clips);
>>> +    drm_property_blob_put(state->solid_fill_blob);
>>>   }
>>>   EXPORT_SYMBOL(__drm_atomic_helper_plane_destroy_state);
>>>   diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
>>> index c06d0639d552..8a1d2fb7a757 100644
>>> --- a/drivers/gpu/drm/drm_atomic_uapi.c
>>> +++ b/drivers/gpu/drm/drm_atomic_uapi.c
>>> @@ -316,6 +316,55 @@ drm_atomic_set_crtc_for_connector(struct drm_connector_state *conn_state,
>>>   }
>>>   EXPORT_SYMBOL(drm_atomic_set_crtc_for_connector);
>>>   +static void drm_atomic_convert_solid_fill_info(struct drm_solid_fill *out,
>>> +        struct drm_solid_fill_info *in)
>>> +{
>>> +    out->r = in->r;
>>> +    out->g = in->g;
>>> +    out->b = in->b;
>>> +}
>>> +
>>> +static int drm_atomic_set_solid_fill_prop(struct drm_plane_state *state,
>>> +        struct drm_property_blob *blob)
>>> +{
>>> +    int ret = 0;
>>> +    int blob_version;
>>> +
>>> +    if (blob == state->solid_fill_blob)
>>> +        return 0;
>>> +
>>> +    drm_property_blob_put(state->solid_fill_blob);
>>> +    state->solid_fill_blob = NULL;
>>> +
>>> +    memset(&state->solid_fill, 0, sizeof(state->solid_fill));
>>> +
>>> +    if (blob) {
>>> +        if (blob->length != sizeof(struct drm_solid_fill_info)) {
>>> +            drm_dbg_atomic(state->plane->dev,
>>> +                    "[PLANE:%d:%s] bad solid fill blob length: %zu\n",
>>> +                    state->plane->base.id, state->plane->name,
>>> +                    blob->length);
>>> +            return -EINVAL;
>>> +        }
>>> +
>>> +        blob_version = ((struct drm_solid_fill_info *)blob->data)->version;
>>> +
>>> +        /* Append with more versions if necessary */
>>> +        if (blob_version == 1) {
>>> +            drm_atomic_convert_solid_fill_info(&state->solid_fill, blob->data);
>>> +        } else {
>>> +            drm_dbg_atomic(state->plane->dev,
>>> +                    "[PLANE:%d:%s] failed to set solid fill (ret=%d)\n",
>>> +                    state->plane->base.id, state->plane->name,
>>> +                    ret);
>>> +            return -EINVAL;
>>> +        }
>>> +        state->solid_fill_blob = drm_property_blob_get(blob);
>>> +    }
>>> +
>>> +    return ret;
>>> +}
>>> +
>>>   static void set_out_fence_for_crtc(struct drm_atomic_state *state,
>>>                      struct drm_crtc *crtc, s32 __user *fence_ptr)
>>>   {
>>> @@ -544,6 +593,13 @@ static int drm_atomic_plane_set_property(struct drm_plane *plane,
>>>           state->src_w = val;
>>>       } else if (property == config->prop_src_h) {
>>>           state->src_h = val;
>>> +    } else if (property == plane->solid_fill_property) {
>>> +        struct drm_property_blob *solid_fill = drm_property_lookup_blob(dev, val);
>>> +
>>> +        ret = drm_atomic_set_solid_fill_prop(state, solid_fill);
>>> +        drm_property_blob_put(solid_fill);
>>> +
>>> +        return ret;
>>>       } else if (property == plane->alpha_property) {
>>>           state->alpha = val;
>>>       } else if (property == plane->blend_mode_property) {
>>> @@ -616,6 +672,9 @@ drm_atomic_plane_get_property(struct drm_plane *plane,
>>>           *val = state->src_w;
>>>       } else if (property == config->prop_src_h) {
>>>           *val = state->src_h;
>>> +    } else if (property == plane->solid_fill_property) {
>>> +        *val = state->solid_fill_blob ?
>>> +            state->solid_fill_blob->base.id : 0;
>>>       } else if (property == plane->alpha_property) {
>>>           *val = state->alpha;
>>>       } else if (property == plane->blend_mode_property) {
>>> diff --git a/drivers/gpu/drm/drm_blend.c b/drivers/gpu/drm/drm_blend.c
>>> index b4c8cab7158c..17ab645c8309 100644
>>> --- a/drivers/gpu/drm/drm_blend.c
>>> +++ b/drivers/gpu/drm/drm_blend.c
>>> @@ -616,3 +616,20 @@ int drm_plane_create_blend_mode_property(struct drm_plane *plane,
>>>       return 0;
>>>   }
>>>   EXPORT_SYMBOL(drm_plane_create_blend_mode_property);
>>> +
>>> +int drm_plane_create_solid_fill_property(struct drm_plane *plane)
>>> +{
>>> +    struct drm_property *prop;
>>> +
>>> +    prop = drm_property_create(plane->dev,
>>> +            DRM_MODE_PROP_ATOMIC | DRM_MODE_PROP_BLOB,
>>> +            "solid_fill", 0);
>>> +    if (!prop)
>>> +        return -ENOMEM;
>>> +
>>> +    drm_object_attach_property(&plane->base, prop, 0);
>>> +    plane->solid_fill_property = prop;
>>> +
>>> +    return 0;
>>> +}
>>> +EXPORT_SYMBOL(drm_plane_create_solid_fill_property);
>>> diff --git a/include/drm/drm_blend.h b/include/drm/drm_blend.h
>>> index 88bdfec3bd88..0338a860b9c8 100644
>>> --- a/include/drm/drm_blend.h
>>> +++ b/include/drm/drm_blend.h
>>> @@ -58,4 +58,5 @@ int drm_atomic_normalize_zpos(struct drm_device *dev,
>>>                     struct drm_atomic_state *state);
>>>   int drm_plane_create_blend_mode_property(struct drm_plane *plane,
>>>                        unsigned int supported_modes);
>>> +int drm_plane_create_solid_fill_property(struct drm_plane *plane);
>>>   #endif
>>> diff --git a/include/drm/drm_plane.h b/include/drm/drm_plane.h
>>> index 447e664e49d5..3b9da06f358b 100644
>>> --- a/include/drm/drm_plane.h
>>> +++ b/include/drm/drm_plane.h
>>> @@ -40,6 +40,25 @@ enum drm_scaling_filter {
>>>       DRM_SCALING_FILTER_NEAREST_NEIGHBOR,
>>>   };
>>>   +/**
>>> + * struct drm_solid_fill_info - User info for solid fill planes
>>> + */
>>> +struct drm_solid_fill_info {
>>> +    __u8 version;
>>> +    __u32 r, g, b;
>>> +};
>>> +
>>> +/**
>>> + * struct solid_fill_property - RGB values for solid fill plane
>>> + *
>>> + * Note: This is the V1 for this feature
>>> + */
>>> +struct drm_solid_fill {
>>> +    uint32_t r;
>>> +    uint32_t g;
>>> +    uint32_t b;
>>> +};
>>> +
>>>   /**
>>>    * struct drm_plane_state - mutable plane state
>>>    *
>>> @@ -116,6 +135,23 @@ struct drm_plane_state {
>>>       /** @src_h: height of visible portion of plane (in 16.16) */
>>>       uint32_t src_h, src_w;
>>>   +    /**
>>> +     * @solid_fill_blob:
>>> +     *
>>> +     * Blob containing relevant information for a solid fill plane
>>> +     * including pixel format and data. See
>>> +     * drm_plane_create_solid_fill_property() for more details.
>>> +     */
>>> +    struct drm_property_blob *solid_fill_blob;
>>> +
>>> +    /**
>>> +     * @solid_fill:
>>> +     *
>>> +     * Pixel data for solid fill planes. See
>>> +     * drm_plane_create_solid_fill_property() for more details.
>>> +     */
>>> +    struct drm_solid_fill solid_fill;
>>> +
>>>       /**
>>>        * @alpha:
>>>        * Opacity of the plane with 0 as completely transparent and 0xffff as
>>> @@ -699,6 +735,13 @@ struct drm_plane {
>>>        */
>>>       struct drm_plane_state *state;
>>>   +    /*
>>> +     * @solid_fill_property:
>>> +     * Optional solid_fill property for this plane. See
>>> +     * drm_plane_create_solid_fill_property().
>>> +     */
>>> +    struct drm_property *solid_fill_property;
>>> +
>>>       /**
>>>        * @alpha_property:
>>>        * Optional alpha property for this plane. See
>>

