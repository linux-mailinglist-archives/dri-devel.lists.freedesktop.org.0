Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A540E387AEC
	for <lists+dri-devel@lfdr.de>; Tue, 18 May 2021 16:19:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A6886E0B9;
	Tue, 18 May 2021 14:19:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2080.outbound.protection.outlook.com [40.107.244.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EB206E0B9;
 Tue, 18 May 2021 14:19:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UAHTxk+IQSuCqaKlWGpTJxjIpeI2GqNX2XZOMZGhRTicpJ0M/xj1oTzi5tCQ47lGDzeyryTsVuGjuFlJcX2W68jP8xvjktcaDqeerXuGg94F73bACi0XXU2Wtx0AyX0o/uCE6zSnH+y2jMjYmxRge6u+j2+CwZlIscBUtSmgWN0womwUe+Z1ZBr56LzW1ejOONAEBQt1Usv8uQwIboo9/r93WxROvSTGNayPkz6sE1bmfTQNQApZbpzVrAmwSpZGtzzwbvxHN2WUiBpJDx0GvZgywplynlrPwVRO1e5tKhL8MuacHfuqAfUdUMbkS3kVhXP1l7/pa1tWa7U918pJsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WSvxssJVJN0EnPiIe6VnBaTCcePcR7S9H9OBjP1+DXA=;
 b=Cacv81u39A7yEwpDGgaHX/cNF8r0sZA/nEG11vfK1anXO+iI+n8eoFG29bBTHHqxpAmPok9/xRnA1ADktBQKT4MAbvnnqxrRKtvF3p8xM9YRWHPOIu3vYnj2RGukEcKkEtoAiP3NJoeEWMUNsPYrCztkOR4g5zwcd7R/YW7QnksYhlB7j3hC0MSYa3Lf9Mk272+tUKAllTr+da1z92L3ZRTk/qKqDe1QffX12u4USUALtnyk16ohVMdHB5NhOkk6ef0JyrC6IaCPmC9n7mnGKslCeesfR1+hfC19E7oymmvFUz5sMytV9cOJ1BjBT/2w0totYO4XIInfYo3iQuszTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WSvxssJVJN0EnPiIe6VnBaTCcePcR7S9H9OBjP1+DXA=;
 b=wj53DlmCCKjnlFGE5xFGw+W9vbptjZhsPXUWTFYO1X6Z04CUKdqFnj0WTiVbuk2NvBf/veLV0b4zMFz7qGgn980AgjYiiCa1liz3oWsRQMFNN/jyxrGu8ZiyVJfwyI2U1POxg0rtBDm5lO3t+NSGI058TQZfXyz4WVn5QfphbAU=
Authentication-Results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none header.from=amd.com;
Received: from MW3PR12MB4379.namprd12.prod.outlook.com (2603:10b6:303:5e::11)
 by MWHPR12MB1904.namprd12.prod.outlook.com (2603:10b6:300:114::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.25; Tue, 18 May
 2021 14:19:29 +0000
Received: from MW3PR12MB4379.namprd12.prod.outlook.com
 ([fe80::c476:9fdf:664e:4f25]) by MW3PR12MB4379.namprd12.prod.outlook.com
 ([fe80::c476:9fdf:664e:4f25%4]) with mapi id 15.20.4129.033; Tue, 18 May 2021
 14:19:29 +0000
Subject: Re: [RFC PATCH 0/3] A drm_plane API to support HDR planes
To: Pekka Paalanen <ppaalanen@gmail.com>,
 Vitaly Prosyak <vitaly.prosyak@amd.com>
References: <20210426173852.484368-1-harry.wentland@amd.com>
 <20210427175005.5b92badc@eldfell>
 <e51a3067-a0b3-16e4-5996-bd8527b7536b@amd.com>
 <20210517115726.4fc1c710@eldfell>
 <5f6abaaa45bb7f77110d9f87c9824e3f@sebastianwick.net>
 <b0834be8-9023-0fde-f15d-8c44f72e7702@amd.com>
 <20210518105615.212b84e4@eldfell>
From: Harry Wentland <harry.wentland@amd.com>
Message-ID: <9d4ec9c3-6716-7c80-97d5-dd3c5c50ab51@amd.com>
Date: Tue, 18 May 2021 10:19:25 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
In-Reply-To: <20210518105615.212b84e4@eldfell>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [198.200.67.155]
X-ClientProxiedBy: YQBPR0101CA0102.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:4::35) To MW3PR12MB4379.namprd12.prod.outlook.com
 (2603:10b6:303:5e::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.193] (198.200.67.155) by
 YQBPR0101CA0102.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:c01:4::35) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.31 via Frontend
 Transport; Tue, 18 May 2021 14:19:27 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3265cd10-e8f5-44c9-5052-08d91a07f2f3
X-MS-TrafficTypeDiagnostic: MWHPR12MB1904:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR12MB1904C6273D2A1FE492C1DFA98C2C9@MWHPR12MB1904.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QfuH4HqmSGTOS3cEuZJKPaMgIBJ5xbWvLsYzyA9TKB/1t9rLaPiGmQfH0lQpjwlhAgzHur+t6QZL5cfd2f5Lb+gDZYy3XCqRimPpvMV5+ANlQcdGuS1Lwu1FVTOszc7InTh0KZLSuJX6RWh3PlzVLcB2JIE1Q05nAvospAtCGzHhLmpMhUZ5++FbmViVbcDSZ7dlQ7VZhGbZmraxy6EJd9pQmNikHYSdqYNIkzB8u1Vy5W5fDTJr9lxacpeU33M7bkdIxQnLTLw3At6t0pWRvffuBJp6cow8qbm4fCNFu9TU7lBjmEszLKbWkJUobS8xmicS253LlESwXzOP4lCeSEqx80cCLidkZCiwDKZpVLZQJg/YCFusCxefadYSpr0KoYetZJHUPyvDvcESpNhhOnnw/vjBHdl8wtmAHOSIrKVpA8DEZwqPV8bEIswmWJDR2WjCJGkKqETAuqrksHlQpq3797O/ohQY5Ttz+sn1b7urHVn29sWxV2QLCqXFEMpWgBXS8+A1pP1k/cynHry13xzZJUt+TQYORRNJS+GMv9TDy1WzIDNJqWOf6+R/RKBXFsu7iS08t0ew97VkP0kVb1+RRS2WJkBZzDK5oZCQaQTk7/WbBWhlmBLOM1fHP0VwRs0FcXhEstO056fKRDnBKeXiPN1ZY1LAP4i0aDeBOWeg7HQdAYdVywN/XMLm49wt
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW3PR12MB4379.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(136003)(39860400002)(346002)(366004)(376002)(6486002)(31686004)(26005)(83380400001)(6636002)(66476007)(2906002)(36756003)(44832011)(2616005)(4326008)(53546011)(66556008)(16576012)(316002)(110136005)(38100700002)(5660300002)(186003)(478600001)(31696002)(8676002)(16526019)(956004)(86362001)(66946007)(8936002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?d0lOTmtLMnZ2ZlUrUkJyWFpMaGN6ZEFqQmlCTVJlaGIvVXVyRjU0QytPVFg2?=
 =?utf-8?B?WW9PeXAvZCtCMlU3eEw5NzR5NGg5MGIyNjBTcmlScXBSSHNkYTVtZ3hvb2sw?=
 =?utf-8?B?NmJNekFBZEpMUHgxQ0JoYXVqWGsvTXdLWHlMOERLRXYvVjY4RG9vL1RBSTlh?=
 =?utf-8?B?ZUhQU3NBVFJBVWhhK0Z3TzZpbXk5Vi9jZEJyOXdnQkpEM2FQTW4zN0g2aXdQ?=
 =?utf-8?B?SkhqajZSRFVTNmFIOUVhQWZHMVVVYmxMQW5iOG0zSjA2SHB6K0tsMVRLLzU1?=
 =?utf-8?B?V2hkSGZ4Yzh4eVU4N2Noc1ZqellqbDFmRTIwNVc1WVA5cks0Rm91djQ2WjhJ?=
 =?utf-8?B?R2h3QytWUHNKMEdXNXF4aG55WFlTTm9xZnNoQUVpYTVSMDNlZHpjOVhNdDIw?=
 =?utf-8?B?SHRZUU1IbHVyK0pOUlMrMGtkQ29uSDFKcWpBdUZyS1Z4V1kyalA3OGlsV3dj?=
 =?utf-8?B?Y2NxUGs3WmlpS0xVNWxaZWVXK252VC82V0NvWVdsQ2lGOGdTUGlqWjVTQnNm?=
 =?utf-8?B?QXpFYkdxeUNXZytvYzM3d3VPZVA5aVhtOGVuSWFwSUhvTnVxR0M2U0gwb3BP?=
 =?utf-8?B?a2NjVU8xbUd3d2hKQTRtbUZjYzJVZFJpYkN2R25mRy9PYmtjVzNsMlNyTVMz?=
 =?utf-8?B?Q1UvTjhydDlkYzJFTlAzSlJCNk85TFU2OXBUaE5IMWJlV1VRSHJQWTdia1RH?=
 =?utf-8?B?aGRUTDBncm5ic0psVXZIQTdEbFl0NDl4Uy9ZVTB4TjExK054WEpkcE16TytJ?=
 =?utf-8?B?d2ZUMDNSRUVxVjlFeFI5a2Jrd3VrOUhuOHRzZXE2YWR6SmJHNTN1THpLM05k?=
 =?utf-8?B?Yjh0QUszZnRLMHQzMDRUcTg3cWYzN1hUSWhHeDBNR3VWaFhodzJ2RWYyUmhH?=
 =?utf-8?B?N3JNaXR0MGVPS2hSQXVHN0FSNnNMbVNNdUtia1pjMXB2alVvUkZxcEp0R21K?=
 =?utf-8?B?SC9sNFpNcUJ0cGNwdzR4T3lNYzdtclNEYURpU0NodTdIVkh0UUVrWUI4VUJt?=
 =?utf-8?B?TDlyWlNiMUM1SjJZNFZyZ1hFMmUvNmRwb3lOc2lDb0hXR0ZxZ3J4Wjhwb0NJ?=
 =?utf-8?B?UGRKeTdxYmdMUndFemNrL2NYRjVIMVNSSjRXcFZlOEx3Z05vMGZGK2xUSmNp?=
 =?utf-8?B?WmRCYUFLNEpLMmFiVmRjTjRTdDBzckFLOUQ0Z05vcndEdVBjV3l2N3Ixem1i?=
 =?utf-8?B?ZDFQTWIyRVVWK0RONVdQM210dnQ4WlM5L1lKZlIrWXEwbThaVVduS0RWOFov?=
 =?utf-8?B?ZGRISGdKZjB4S2xxdE00b3FjODYvTE1VZFJ2cmV6TFd6cU9HaXNqU0hwVzJi?=
 =?utf-8?B?Wk5nZlMzNjN4QTkxaXUvL1N1K2VMZVQwbjR1QmRzL1BBTUxTd1dsVnBrVkRm?=
 =?utf-8?B?V1NDMkdVU3l0NG55VFJsT01YK2FZcjNhTG56ZGU4MzluVVc2Y3h2aXdITDlY?=
 =?utf-8?B?RSs2NmZWNnpSenNySzM1SUNjcjcveWFBcmp3OHhTWEFBUlhpT2g4T204Nnhq?=
 =?utf-8?B?YzBlaVJMZTh1bVRZelBTdTlWRlh0QUV5NUxCQTNyRVlmK05TUlpKZVBBRWRP?=
 =?utf-8?B?dFc2WmFMbjhZOGdmWTliYlVYN013TDVzc3l6azRib3pDb0tDNDgzMWp2K2pU?=
 =?utf-8?B?dEJkcVcrMVdtVUlodTBDZVNQN1kwMjlQQW0xclp1TGlPVk94cUJaYnZiUVpm?=
 =?utf-8?B?UHZXT01ENjZDTThrZmVyMkREaHZkc3FveXExd3liRkFmTjJ1bFNqQm96SDhp?=
 =?utf-8?Q?/CzANpS9oxYjOm6ZyilSXkxdY+1zNVt/VNVfAXM?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3265cd10-e8f5-44c9-5052-08d91a07f2f3
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4379.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2021 14:19:29.5230 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oR52blZ7S6P350+BkQ+jSb0QygNqMJ1NHHu1fX4Kla4Rw7mL6/uDYQlwjGcmrpzybsUSgMYUYB9dNakoZiKokg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1904
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
Cc: Deepak.Sharma@amd.com, Krunoslav.Kovac@amd.com, mcasas@google.com,
 Shashank.Sharma@amd.com, dri-devel@lists.freedesktop.org, Shirish.S@amd.com,
 Sebastian Wick <sebastian@sebastianwick.net>, hersenxs.wu@amd.com,
 amd-gfx@lists.freedesktop.org, laurentiu.palcu@oss.nxp.com,
 Bhawanpreet.Lakha@amd.com, Nicholas.Kazlauskas@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2021-05-18 3:56 a.m., Pekka Paalanen wrote:
> On Mon, 17 May 2021 15:39:03 -0400
> Vitaly Prosyak <vitaly.prosyak@amd.com> wrote:
> 
>> On 2021-05-17 12:48 p.m., Sebastian Wick wrote:
>>> On 2021-05-17 10:57, Pekka Paalanen wrote:  
>>>> On Fri, 14 May 2021 17:05:11 -0400
>>>> Harry Wentland <harry.wentland@amd.com> wrote:
>>>>  
>>>>> On 2021-04-27 10:50 a.m., Pekka Paalanen wrote:  
>>>>>> On Mon, 26 Apr 2021 13:38:49 -0400
>>>>>> Harry Wentland <harry.wentland@amd.com> wrote:  
>>>>
>>>> ...
>>>>  
>>>>>>> ## Mastering Luminances
>>>>>>>
>>>>>>> Now we are able to use the PQ 2084 EOTF to define the luminance of
>>>>>>> pixels in absolute terms. Unfortunately we're again presented with
>>>>>>> physical limitations of the display technologies on the market   
>>>>> today.  
>>>>>>> Here are a few examples of luminance ranges of displays.
>>>>>>>
>>>>>>> | Display                  | Luminance range in nits |
>>>>>>> | ------------------------ | ----------------------- |
>>>>>>> | Typical PC display       | 0.3 - 200 |
>>>>>>> | Excellent LCD HDTV       | 0.3 - 400 |
>>>>>>> | HDR LCD w/ local dimming | 0.05 - 1,500 |
>>>>>>>
>>>>>>> Since no display can currently show the full 0.0005 to 10,000 nits
>>>>>>> luminance range the display will need to tonemap the HDR content,   
>>>>> i.e  
>>>>>>> to fit the content within a display's capabilities. To assist with
>>>>>>> tonemapping HDR content is usually accompanied with a metadata that
>>>>>>> describes (among other things) the minimum and maximum mastering
>>>>>>> luminance, i.e. the maximum and minimum luminance of the display   
>>>>> that  
>>>>>>> was used to master the HDR content.
>>>>>>>
>>>>>>> The HDR metadata is currently defined on the drm_connector via the
>>>>>>> hdr_output_metadata blob property.
>>>>>>>
>>>>>>> It might be useful to define per-plane hdr metadata, as different
>>>>>>> planes might have been mastered differently.  
>>>>>>
>>>>>> I don't think this would directly help with the dynamic range   
>>>>> blending  
>>>>>> problem. You still need to establish the mapping between the optical
>>>>>> values from two different EOTFs and dynamic ranges. Or can you know
>>>>>> which optical values match the mastering display maximum and minimum
>>>>>> luminances for not-PQ?
>>>>>>  
>>>>>
>>>>> My understanding of this is probably best illustrated by this example:
>>>>>
>>>>> Assume HDR was mastered on a display with a maximum white level of 500
>>>>> nits and played back on a display that supports a max white level of 
>>>>> 400
>>>>> nits. If you know the mastering white level of 500 you know that 
>>>>> this is
>>>>> the maximum value you need to compress down to 400 nits, allowing 
>>>>> you to
>>>>> use the full extent of the 400 nits panel.  
>>>>
>>>> Right, but in the kernel, where do you get these nits values from?
>>>>
>>>> hdr_output_metadata blob is infoframe data to the monitor. I think this
>>>> should be independent of the metadata used for color transformations in
>>>> the display pipeline before the monitor.
>>>>
>>>> EDID may tell us the monitor HDR metadata, but again what is used in
>>>> the color transformations should be independent, because EDIDs lie,
>>>> lighting environments change, and users have different preferences.
>>>>
>>>> What about black levels?
>>>>
>>>> Do you want to do black level adjustment?
>>>>
>>>> How exactly should the compression work?
>>>>
>>>> Where do you map the mid-tones?
>>>>
>>>> What if the end user wants something different?  
>>>
>>> I suspect that this is not about tone mapping at all. The use cases
>>> listed always have the display in PQ mode and just assume that no
>>> content exceeds the PQ limitations. Then you can simply bring all
>>> content to the color space with a matrix multiplication and then map the
>>> linear light content somewhere into the PQ range. Tone mapping is
>>> performed in the display only.
> 
> The use cases do use the word "desktop" though. Harry, could you expand
> on this, are you seeking a design that is good for generic desktop
> compositors too, or one that is more tailored to "embedded" video
> player systems taking the most advantage of (potentially
> fixed-function) hardware?
> 

The goal is to enable this on a generic desktop, such as generic Wayland
implementations or ChromeOS. We're not looking for a custom solution for
some embedded systems, though the solution we end up with should obviously
not prevent an implementation on embedded video players.

> What matrix would one choose? Which render intent would it
> correspond to?
> 
> If you need to adapt different dynamic ranges into the blending dynamic
> range, would a simple linear transformation really be enough?
> 
>>> From a generic wayland compositor point of view this is uninteresting.
>>>  
>> It a compositor's decision to provide or not the metadata property to 
>> the kernel. The metadata can be available from one or multiple clients 
>> or most likely not available at all.
>>
>> Compositors may put a display in HDR10 ( when PQ 2084 INV EOTF and TM 
>> occurs in display ) or NATIVE mode and do not attach any metadata to the 
>> connector and do TM in compositor.
>>
>> It is all about user preference or compositor design, or a combination 
>> of both options.
> 
> Indeed. The thing here is that you cannot just add KMS UAPI, you also
> need to have the FOSS userspace to go with it. So you need to have your
> audience defined, userspace patches written and reviewed and agreed
> to be a good idea. I'm afraid this particular UAPI design would be
> difficult to justify with Weston. Maybe Kodi is a better audience?
> 

I'm not sure designing a UAPI for Kodi that's not going to work for
Wayland-compositors is the right thing. From a KMS driver maintainer
standpoint I don't want an API for each userspace.

The idea here is to do design and discussion in public so we can eventually
arrive at a UAPI for HDR and CM that works for Wayland and by extension
for every other userspace.

> But then again, one also needs to consider whether it is enough for a
> new UAPI to satisfy only part of the possible audience and then need
> yet another new UAPI to satisfy the rest. Adding new UAPI requires
> defining the interactions with all existing UAPI as well.
> 
> Maybe we do need several different UAPIs for the "same" things if the
> hardware designs are too different to cater with just one.
> 

I feel we should have a section in the RFC that sketches how different HW
deals with this currently. It would be good if we can arrive at a UAPI that
captures at least the common functionality of various HW.

Harry

> 
> Thanks,
> pq
> 

