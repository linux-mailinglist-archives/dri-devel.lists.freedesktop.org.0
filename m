Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57236673EBE
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jan 2023 17:27:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DA2D10E9D6;
	Thu, 19 Jan 2023 16:27:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2081.outbound.protection.outlook.com [40.107.96.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A60B10E9B3;
 Thu, 19 Jan 2023 16:27:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PpyrO/C4yCEixtubpXbLJFIL4XXWyfuQYb0DANi/44JlE7aCJ51cAIo6Pz8drAvKeCLu6hSACJw1D8wC2LqC+e9mgnqf+rlKwPsJ7f6SO5tE5lnoP9oPhEPKA+6FgsxQgfchxKHbs2WrUxccNRBCibgG9n+fp7A4KE4J2DEvu8UU5EpxttyGBIZ/As2R4Z6f0h1pDfZcEVDxNAdRMyGtOaB0amLi1tNxRNwN6bhPd/hysoo3qYSZ4fMtDG9tn/RkCFr/qRAttSRN46LPwwJ2FkppV/kWGE/TJjIpY0u7+aIT660qSXBR1ekfcHJRTJAzaoXtdixsOi/4ZBcACxZ9sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HVZhqDIyHJdPq1ep1nde+lFE7QPHFtmA84iyajPNex8=;
 b=HHGrKCC40sAG/xKbCkYPFWsAi9u2Qghn6cW9vLrbzExlLOMZWROXnoBa/u8ZMBaAmHzKJ66894zeDb/UwpEl96r0E0Y1hQGmTf3UZ7rwmvBDKlpSGenvBa4FkIyQFJHb1ycycqzklebwCqewBR/Dc8LadRL8/Hhi5NoTtgC6JPxQB1LPt66PYxnIgkeCXcLDuTCvE+SfpHz6GRMF+rdPqnwsuektu1O85/o0faAMdgwNommn4rs0QxslUR+wNz+Z4iqalPa6XXIkC0UJHhTqdqzYgTuf7QTz0f4iaVJWOgp8TpQAob6Jj6F/Ns41rd9W4sHi3wsglrH7safQVl/vxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HVZhqDIyHJdPq1ep1nde+lFE7QPHFtmA84iyajPNex8=;
 b=Az0xYR2yTRyMlVkqb7sPFrK8HWa4ebmN9+dmKiSpve0vR61K8ekoIeA3jQvg4gXqbqfZAIQZzQhLOsu7hfDNUstYrnPRaXUfh//n/JEr3gNItm5nx+zY1+YmgqnK545CYh9LN/LM/i95U3YXm7GJLeYudHRa+G5DVctiB6OfgsQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by MW3PR12MB4444.namprd12.prod.outlook.com (2603:10b6:303:5c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.26; Thu, 19 Jan
 2023 16:27:38 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::152b:e615:3d60:2bf0]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::152b:e615:3d60:2bf0%5]) with mapi id 15.20.6002.025; Thu, 19 Jan 2023
 16:27:37 +0000
Message-ID: <9038446d-f0a4-7752-8495-e7e86bece025@amd.com>
Date: Thu, 19 Jan 2023 11:27:33 -0500
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
 <e5d0b837-2fd3-7bfa-155b-d80418dc2e79@amd.com>
 <c9f67c35-9abb-8d3c-d6d1-e55451c453a1@quicinc.com>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <c9f67c35-9abb-8d3c-d6d1-e55451c453a1@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQBPR01CA0036.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:c01::44)
 To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|MW3PR12MB4444:EE_
X-MS-Office365-Filtering-Correlation-Id: 160fbd01-d60d-4a82-b1d1-08dafa3a13f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eiGqnZq+BmvZIxsFN35qNzaRx1fy1rAlglr+qRUgUwiSWl4pWI1OveAKz18P6QB1C7BM3mNu2wd5PN2vGcgjJ0w5/xIpf0ZGSh6P9yqlQe7jeDNhVARsZtKE4T0l/Fq+AzTRC1Zeu+eTRrD0UjAuABF/is/B+FPDsP6Mv38cqmz0UIQvNq4VncrG9z+Sf+LnUzISIC6AmJXiwtfv6ytiEC+9fBrEkLfkBLZfp++bw7BgselXPtLNy84ED5Rq+nJhNF6i8TP6e/v5JL/gtKo+ecxwo2W8wMpaY9IgqfJOey2buXQyQTOrvSvmzOgQr+o2doqXftUnp9Pc4dXAQtYYXx2gDemuO3ytoaJO3l+E2a9MpvvYJSVbe764uH06KydyxgSvcTN6oriUHee3mGl+GOc3747WLcpCs2Wpaad88pVbM58k74tzFhULwLU82pGfFwkfmK3f2WaB/xX8cqMDnLqekzHBa3CZRApGK8W/tRyWQZoit2Vp/vdM0hUrJF+AdVgZ0UTVf7tUrORXAwnuldcbV6KkTIs0ZErcIIn9Twls7Me5pcyET93IL9J+Bll2Jh9CLZLBBzTeX1t2XHhJxII15aRCY2adxLAPO0SOXuhlIEzlUnIBafnhbP3tAl7PbeRojWriOd88M8OXqX9ZV3y1tsdFZwFHLwXmjoDVq1gE1gQRMZwRoIpJtKraE5Ta0IMbTOj9xc6hREQ10SGlZXVFDFiOLA+CPNicwVqVrA6ikTD0J12W6ir0gpoSUNfm1INw5aEO4N7ZeGFh9wZ96w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(366004)(346002)(376002)(39860400002)(136003)(451199015)(316002)(2616005)(7416002)(4326008)(5660300002)(8936002)(38100700002)(41300700001)(26005)(36756003)(6512007)(186003)(30864003)(83380400001)(66946007)(66556008)(66476007)(8676002)(44832011)(31686004)(6666004)(31696002)(86362001)(2906002)(966005)(6486002)(6506007)(478600001)(53546011)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z21meXJzYkE2aWZBZ3JaQWlNTm5xRE1qL1o3VWZLYVlBOGJQa1RsVG9pdCt5?=
 =?utf-8?B?UGNyZmsyL0F4TUxqSXZCZUtuVzBnNzBrQmduR24wM1BRVUpJZEppa2IxY0tI?=
 =?utf-8?B?YWhQdmZPZlMxYlROVzk2cWppTzRxWXFpUmd0T3lsaXVqaUR3QUdiKzVMUTVZ?=
 =?utf-8?B?VGo5RXhDN0o4dk5HYVhCUHRzZlJVRUVsbndmU080c1pLbDZVYy9hL3BhR1FS?=
 =?utf-8?B?R2l2WmRyWVdyVUJvOWNsZkZ1V0ZaYmthOTMrMHNvNlpCZWt6dTFVbEFsdzdL?=
 =?utf-8?B?SS8zdTh6eWdrRWU3MmhFT1F6cTRMbEdheThoQThWdzF6L2JTOVZHMUkrR0VU?=
 =?utf-8?B?Z0ptdHVpQTQ0ZkJBTUJHakdHVStyL1QxRElzSnZPek02eEY0RTk4NXh5R1Br?=
 =?utf-8?B?ZW9WUkJQaXc1TWNiSE1zK1BOVkZnMUZ0elM4NWJrRTBNcXNEcWEvR3dVbVhq?=
 =?utf-8?B?ZmdINVNYM3ZhMFZnNUV1c1QwMEhkdWtKbFhSNTM0VzhiVkRXKzluUVVQNDky?=
 =?utf-8?B?Z2svVVIwMWRRTUFHTzhjQ09WcHNTWVFkNng0TEYvWkkyK3k4WHE1WjRsd1k1?=
 =?utf-8?B?RVlCb1Y1L1VNMDNpTXI1WE5yWUtTYTNjeFBUNFNqWDZnaGRGNHk5U05QcDFC?=
 =?utf-8?B?eGZSTy9pbDhYNjByK296dG03Y21QK0lqTGM2UWtnanFBaERka0pzaEprT1dG?=
 =?utf-8?B?Z2hickMxcEVrKzhxWUFJNE5zV3pUU0k5OVdFb2pEOU5CMjRZM0tHeDlQL2FV?=
 =?utf-8?B?T2c5T2NJMldGbFhLcE9EellXMUg2WHpiaitONXBiWU5jU0NkRlBsd29pTzZC?=
 =?utf-8?B?VkRSYmFyVDVCSiswWHdrTGxhVy8xaldsRkMxREZISmlqVFU1Q1puLzdBTWNk?=
 =?utf-8?B?ejZDZHp3WUNJWkZkYUkyNXRhUTVDcHhKVnpMTWFIWURmK1ZJWktQZWx3MEFs?=
 =?utf-8?B?RHVwRzl5ODVLMnIyU1Z3VHpTdmFwZmI2N2l1ZkR4K0NRM2ZJaW1JRVVlZDU0?=
 =?utf-8?B?WE9RSGdPU2lmZG0zdnRwLzFFWmttRjJaVmEwYmZCVUk5cXN2MFEyQkZwNEFt?=
 =?utf-8?B?bGJYQ0xnbm0zcDUweS96U3pCZWdEakxkcFh0d1VDNjVjRjhsQjN3ZTZkZHIx?=
 =?utf-8?B?V1ZaYlFaOTd4a2VrZ3RmNE03aEE4TUxxcDdRRnJScnRRZXE3cXdzYkJVSkJI?=
 =?utf-8?B?dFkxNE9RM3hDdzJuWjRXODJxTDNoM0s0MTVyckNYeGI4SXNzYzNzQ1F6VlI4?=
 =?utf-8?B?Q3FuUHlneUxxTktYaWFvYTJMLzhKUzRYbHNZdFJTNmM5dDBFR2gwTytBbkY1?=
 =?utf-8?B?VzdteGpvR1lKWmR4OEFiaTVPM0lTdGpVV3ltVkhodmh3RUp3dEdBMWZXeUYv?=
 =?utf-8?B?b3JCdkZKUFJWQkNZSXBsdDRmdllUZTdFNzVuODBYSG10QnRlbzl6VkhwOVFW?=
 =?utf-8?B?S0tTb010ZmNYYXZDWDZWSmx6aVJGT2hnQ3EwWTUxKzhRVnZIdlRpRkRuT3J5?=
 =?utf-8?B?RndQaWdkYzZYOGRuTWpiSE84Mlljd25ZeGtHdUE1d29JdEQra1JvbUR6Mm1U?=
 =?utf-8?B?Rmh4b1BLeUtxRVo4U3lYZzJybG9nb1lObEhqWGxtdzhwa3A1OFhPa252TjV0?=
 =?utf-8?B?dDMyS0JkN2taK3plREhsSFlibnBqL1RGZDdheUhVWkpPeWo3NlZtb091a2Jz?=
 =?utf-8?B?TW1CcHdkdXlUM3VqQlFvem1xRDBaKzVQTDZtNC90cjdQSzVTdW5yNk01Y0tK?=
 =?utf-8?B?dkhkUUtaSVR0OUVrc1Naayszc2tsRmxSeUc2Y0pQTUJGRnRxRVJhc0JuYmV3?=
 =?utf-8?B?Q2xLMEJtaWlzb3FwYWJybXJzQWNyRFp4TTd4VGZzNnZlTzhmNC92dmpjRml6?=
 =?utf-8?B?K0Z3bE1sNnZTOEs0R3F0WGFSYWRNSTh6L3hBT1YzVlZKeEM0dGhRUFVLNXRO?=
 =?utf-8?B?c09HbGNMdDNFQmxGcXFlRldtYVd4ejhxQklIOTJocWREcFlVQ3M5YzBpQmly?=
 =?utf-8?B?dU1COE5Zc3B1VmZLSkVEL0Q1UnlMV1FjM1hvS0RRUWRrQ0lWZXR0SlVrTlFF?=
 =?utf-8?B?UitaMlE1Skx6dmlYajBybThwR01PZlRhRnVpRWUxdHRkZCtOR3BRQ3hRbUo1?=
 =?utf-8?Q?u9Fm913W5Vg/zSdDKws80tdbF?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 160fbd01-d60d-4a82-b1d1-08dafa3a13f4
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2023 16:27:37.7603 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3SnCDPsoA6zH6rTUGkjvUy6JSE0tvH2X59b1/t67Ft8LmI090ca3lPm5Ba4M/gppGxA8y0YPPKOqXh2rac/pig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4444
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



On 1/19/23 11:24, Jessica Zhang wrote:
> 
> 
> On 1/19/2023 7:57 AM, Harry Wentland wrote:
>>
>>
>> On 1/18/23 17:53, Jessica Zhang wrote:
>>>
>>>
>>> On 1/18/2023 10:57 AM, Harry Wentland wrote:
>>>> On 1/4/23 18:40, Jessica Zhang wrote:
>>>>> Add support for solid_fill property to drm_plane. In addition, add
>>>>> support for setting and getting the values for solid_fill.
>>>>>
>>>>> solid_fill holds data for supporting solid fill planes. The property
>>>>> accepts an RGB323232 value and the driver data is formatted as such:
>>>>>
>>>>> struct drm_solid_fill {
>>>>>      u32 r;
>>>>>      u32 g;
>>>>>      u32 b;
>>>>> };
>>>>
>>>> Rather than special-casing this would it make sense to define this
>>>> as a single pixel of a FOURCC property?
>>>>
>>>> I.e., something like this:
>>>>
>>>> struct drm_solid_fill_info {
>>>>      u32 format; /* FOURCC value */
>>>>      u64 value; /* FOURCC pixel value */
>>>> }
>>>>
>>>> That removes some ambiguity how the value should be interpreted, i.e.,
>>>> it can be interpreted like a single pixel of the specified FOURCC format.
>>>>
>>>> It might also make sense to let drivers advertise the supported
>>>> FOURCC formats for solid_fill planes.
>>>
>>> Hi Harry,
>>>
>>> The initial v1 of this RFC had support for taking in a format and such, but it was decided that just supporting RGB323232 would work too.
>>>
>>> Here's the original thread discussing it [1], but to summarize, the work needed to convert the solid fill color to RGB is trivial (as it's just a single pixel of data). In addition, supporting various formats for solid_fill would add complexity as we'd have to communicate which formats are supported.
>>>
>>> [1] https://lists.freedesktop.org/archives/dri-devel/2022-November/379148.html
>>>
>>
>> Make sense, and thanks for summarizing.
>>
>> The only comment I would have left then, is that maybe it'd be good to add
>> an alpha value. I think it was suggested by someone else as well.
> 
> Yep it was mentioned in the v1 discussion, but we came to the conclusion that user can set the alpha through the separate alpha plane property.
> 

Got it.

Harry

> Thanks,
> 
> Jessica Zhang
> 
>>
>>>>
>>>> Is there an implementation for this in a corresponding canonical
>>>> upstream userspace project, to satisfy [1]? If not, what is the plan
>>>> for this? If so, please point to the corresponding patches.
>>>
>>> The use case we're trying to support here is the Android HWC SOLID_FILL hint [1], though it can also be used to address the Wayland single pixel FB protocol [2]. I'm also planning to add an IGT test to show an example of end to end usage.
>>>
>>> [1] https://android.googlesource.com/platform/hardware/interfaces/+/refs/heads/master/graphics/composer/aidl/android/hardware/graphics/composer3/Composition.aidl#52
>>>
>>> [2] https://gitlab.freedesktop.org/wayland/wayland-protocols/-/merge_requests/104
>>>
>>
>> Makes sense.
>>
>> Harry
>>
>>> Thanks,
>>>
>>> Jessica Zhang
>>>
>>>>
>>>> [1] https://dri.freedesktop.org/docs/drm/gpu/drm-uapi.html#open-source-userspace-requirements
>>>>
>>>> Harry
>>>>
>>>>>
>>>>> To enable solid fill planes, userspace must assigned solid_fill to a
>>>>> property blob containing the following information:
>>>>>
>>>>> struct drm_solid_fill_info {
>>>>>      u8 version;
>>>>>      u32 r, g, b;
>>>>> };
>>>>>
>>>>> Changes in V2:
>>>>> - Changed solid_fill property to a property blob (Simon, Dmitry)
>>>>> - Added drm_solid_fill struct (Simon)
>>>>> - Added drm_solid_fill_info struct (Simon)
>>>>>
>>>>> Changes in V3:
>>>>> - Corrected typo in drm_solid_fill struct documentation
>>>>>
>>>>> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
>>>>> ---
>>>>>    drivers/gpu/drm/drm_atomic_state_helper.c |  9 ++++
>>>>>    drivers/gpu/drm/drm_atomic_uapi.c         | 59 +++++++++++++++++++++++
>>>>>    drivers/gpu/drm/drm_blend.c               | 17 +++++++
>>>>>    include/drm/drm_blend.h                   |  1 +
>>>>>    include/drm/drm_plane.h                   | 43 +++++++++++++++++
>>>>>    5 files changed, 129 insertions(+)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/drm_atomic_state_helper.c b/drivers/gpu/drm/drm_atomic_state_helper.c
>>>>> index dfb57217253b..c96fd1f2ad99 100644
>>>>> --- a/drivers/gpu/drm/drm_atomic_state_helper.c
>>>>> +++ b/drivers/gpu/drm/drm_atomic_state_helper.c
>>>>> @@ -253,6 +253,11 @@ void __drm_atomic_helper_plane_state_reset(struct drm_plane_state *plane_state,
>>>>>        plane_state->alpha = DRM_BLEND_ALPHA_OPAQUE;
>>>>>        plane_state->pixel_blend_mode = DRM_MODE_BLEND_PREMULTI;
>>>>>    +    if (plane_state->solid_fill_blob) {
>>>>> +        drm_property_blob_put(plane_state->solid_fill_blob);
>>>>> +        plane_state->solid_fill_blob = NULL;
>>>>> +    }
>>>>> +
>>>>>        if (plane->color_encoding_property) {
>>>>>            if (!drm_object_property_get_default_value(&plane->base,
>>>>>                                   plane->color_encoding_property,
>>>>> @@ -335,6 +340,9 @@ void __drm_atomic_helper_plane_duplicate_state(struct drm_plane *plane,
>>>>>        if (state->fb)
>>>>>            drm_framebuffer_get(state->fb);
>>>>>    +    if (state->solid_fill_blob)
>>>>> +        drm_property_blob_get(state->solid_fill_blob);
>>>>> +
>>>>>        state->fence = NULL;
>>>>>        state->commit = NULL;
>>>>>        state->fb_damage_clips = NULL;
>>>>> @@ -384,6 +392,7 @@ void __drm_atomic_helper_plane_destroy_state(struct drm_plane_state *state)
>>>>>            drm_crtc_commit_put(state->commit);
>>>>>          drm_property_blob_put(state->fb_damage_clips);
>>>>> +    drm_property_blob_put(state->solid_fill_blob);
>>>>>    }
>>>>>    EXPORT_SYMBOL(__drm_atomic_helper_plane_destroy_state);
>>>>>    diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
>>>>> index c06d0639d552..8a1d2fb7a757 100644
>>>>> --- a/drivers/gpu/drm/drm_atomic_uapi.c
>>>>> +++ b/drivers/gpu/drm/drm_atomic_uapi.c
>>>>> @@ -316,6 +316,55 @@ drm_atomic_set_crtc_for_connector(struct drm_connector_state *conn_state,
>>>>>    }
>>>>>    EXPORT_SYMBOL(drm_atomic_set_crtc_for_connector);
>>>>>    +static void drm_atomic_convert_solid_fill_info(struct drm_solid_fill *out,
>>>>> +        struct drm_solid_fill_info *in)
>>>>> +{
>>>>> +    out->r = in->r;
>>>>> +    out->g = in->g;
>>>>> +    out->b = in->b;
>>>>> +}
>>>>> +
>>>>> +static int drm_atomic_set_solid_fill_prop(struct drm_plane_state *state,
>>>>> +        struct drm_property_blob *blob)
>>>>> +{
>>>>> +    int ret = 0;
>>>>> +    int blob_version;
>>>>> +
>>>>> +    if (blob == state->solid_fill_blob)
>>>>> +        return 0;
>>>>> +
>>>>> +    drm_property_blob_put(state->solid_fill_blob);
>>>>> +    state->solid_fill_blob = NULL;
>>>>> +
>>>>> +    memset(&state->solid_fill, 0, sizeof(state->solid_fill));
>>>>> +
>>>>> +    if (blob) {
>>>>> +        if (blob->length != sizeof(struct drm_solid_fill_info)) {
>>>>> +            drm_dbg_atomic(state->plane->dev,
>>>>> +                    "[PLANE:%d:%s] bad solid fill blob length: %zu\n",
>>>>> +                    state->plane->base.id, state->plane->name,
>>>>> +                    blob->length);
>>>>> +            return -EINVAL;
>>>>> +        }
>>>>> +
>>>>> +        blob_version = ((struct drm_solid_fill_info *)blob->data)->version;
>>>>> +
>>>>> +        /* Append with more versions if necessary */
>>>>> +        if (blob_version == 1) {
>>>>> +            drm_atomic_convert_solid_fill_info(&state->solid_fill, blob->data);
>>>>> +        } else {
>>>>> +            drm_dbg_atomic(state->plane->dev,
>>>>> +                    "[PLANE:%d:%s] failed to set solid fill (ret=%d)\n",
>>>>> +                    state->plane->base.id, state->plane->name,
>>>>> +                    ret);
>>>>> +            return -EINVAL;
>>>>> +        }
>>>>> +        state->solid_fill_blob = drm_property_blob_get(blob);
>>>>> +    }
>>>>> +
>>>>> +    return ret;
>>>>> +}
>>>>> +
>>>>>    static void set_out_fence_for_crtc(struct drm_atomic_state *state,
>>>>>                       struct drm_crtc *crtc, s32 __user *fence_ptr)
>>>>>    {
>>>>> @@ -544,6 +593,13 @@ static int drm_atomic_plane_set_property(struct drm_plane *plane,
>>>>>            state->src_w = val;
>>>>>        } else if (property == config->prop_src_h) {
>>>>>            state->src_h = val;
>>>>> +    } else if (property == plane->solid_fill_property) {
>>>>> +        struct drm_property_blob *solid_fill = drm_property_lookup_blob(dev, val);
>>>>> +
>>>>> +        ret = drm_atomic_set_solid_fill_prop(state, solid_fill);
>>>>> +        drm_property_blob_put(solid_fill);
>>>>> +
>>>>> +        return ret;
>>>>>        } else if (property == plane->alpha_property) {
>>>>>            state->alpha = val;
>>>>>        } else if (property == plane->blend_mode_property) {
>>>>> @@ -616,6 +672,9 @@ drm_atomic_plane_get_property(struct drm_plane *plane,
>>>>>            *val = state->src_w;
>>>>>        } else if (property == config->prop_src_h) {
>>>>>            *val = state->src_h;
>>>>> +    } else if (property == plane->solid_fill_property) {
>>>>> +        *val = state->solid_fill_blob ?
>>>>> +            state->solid_fill_blob->base.id : 0;
>>>>>        } else if (property == plane->alpha_property) {
>>>>>            *val = state->alpha;
>>>>>        } else if (property == plane->blend_mode_property) {
>>>>> diff --git a/drivers/gpu/drm/drm_blend.c b/drivers/gpu/drm/drm_blend.c
>>>>> index b4c8cab7158c..17ab645c8309 100644
>>>>> --- a/drivers/gpu/drm/drm_blend.c
>>>>> +++ b/drivers/gpu/drm/drm_blend.c
>>>>> @@ -616,3 +616,20 @@ int drm_plane_create_blend_mode_property(struct drm_plane *plane,
>>>>>        return 0;
>>>>>    }
>>>>>    EXPORT_SYMBOL(drm_plane_create_blend_mode_property);
>>>>> +
>>>>> +int drm_plane_create_solid_fill_property(struct drm_plane *plane)
>>>>> +{
>>>>> +    struct drm_property *prop;
>>>>> +
>>>>> +    prop = drm_property_create(plane->dev,
>>>>> +            DRM_MODE_PROP_ATOMIC | DRM_MODE_PROP_BLOB,
>>>>> +            "solid_fill", 0);
>>>>> +    if (!prop)
>>>>> +        return -ENOMEM;
>>>>> +
>>>>> +    drm_object_attach_property(&plane->base, prop, 0);
>>>>> +    plane->solid_fill_property = prop;
>>>>> +
>>>>> +    return 0;
>>>>> +}
>>>>> +EXPORT_SYMBOL(drm_plane_create_solid_fill_property);
>>>>> diff --git a/include/drm/drm_blend.h b/include/drm/drm_blend.h
>>>>> index 88bdfec3bd88..0338a860b9c8 100644
>>>>> --- a/include/drm/drm_blend.h
>>>>> +++ b/include/drm/drm_blend.h
>>>>> @@ -58,4 +58,5 @@ int drm_atomic_normalize_zpos(struct drm_device *dev,
>>>>>                      struct drm_atomic_state *state);
>>>>>    int drm_plane_create_blend_mode_property(struct drm_plane *plane,
>>>>>                         unsigned int supported_modes);
>>>>> +int drm_plane_create_solid_fill_property(struct drm_plane *plane);
>>>>>    #endif
>>>>> diff --git a/include/drm/drm_plane.h b/include/drm/drm_plane.h
>>>>> index 447e664e49d5..3b9da06f358b 100644
>>>>> --- a/include/drm/drm_plane.h
>>>>> +++ b/include/drm/drm_plane.h
>>>>> @@ -40,6 +40,25 @@ enum drm_scaling_filter {
>>>>>        DRM_SCALING_FILTER_NEAREST_NEIGHBOR,
>>>>>    };
>>>>>    +/**
>>>>> + * struct drm_solid_fill_info - User info for solid fill planes
>>>>> + */
>>>>> +struct drm_solid_fill_info {
>>>>> +    __u8 version;
>>>>> +    __u32 r, g, b;
>>>>> +};
>>>>> +
>>>>> +/**
>>>>> + * struct solid_fill_property - RGB values for solid fill plane
>>>>> + *
>>>>> + * Note: This is the V1 for this feature
>>>>> + */
>>>>> +struct drm_solid_fill {
>>>>> +    uint32_t r;
>>>>> +    uint32_t g;
>>>>> +    uint32_t b;
>>>>> +};
>>>>> +
>>>>>    /**
>>>>>     * struct drm_plane_state - mutable plane state
>>>>>     *
>>>>> @@ -116,6 +135,23 @@ struct drm_plane_state {
>>>>>        /** @src_h: height of visible portion of plane (in 16.16) */
>>>>>        uint32_t src_h, src_w;
>>>>>    +    /**
>>>>> +     * @solid_fill_blob:
>>>>> +     *
>>>>> +     * Blob containing relevant information for a solid fill plane
>>>>> +     * including pixel format and data. See
>>>>> +     * drm_plane_create_solid_fill_property() for more details.
>>>>> +     */
>>>>> +    struct drm_property_blob *solid_fill_blob;
>>>>> +
>>>>> +    /**
>>>>> +     * @solid_fill:
>>>>> +     *
>>>>> +     * Pixel data for solid fill planes. See
>>>>> +     * drm_plane_create_solid_fill_property() for more details.
>>>>> +     */
>>>>> +    struct drm_solid_fill solid_fill;
>>>>> +
>>>>>        /**
>>>>>         * @alpha:
>>>>>         * Opacity of the plane with 0 as completely transparent and 0xffff as
>>>>> @@ -699,6 +735,13 @@ struct drm_plane {
>>>>>         */
>>>>>        struct drm_plane_state *state;
>>>>>    +    /*
>>>>> +     * @solid_fill_property:
>>>>> +     * Optional solid_fill property for this plane. See
>>>>> +     * drm_plane_create_solid_fill_property().
>>>>> +     */
>>>>> +    struct drm_property *solid_fill_property;
>>>>> +
>>>>>        /**
>>>>>         * @alpha_property:
>>>>>         * Optional alpha property for this plane. See
>>>>
>>

