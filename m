Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ACB9F8A8B9C
	for <lists+dri-devel@lfdr.de>; Wed, 17 Apr 2024 20:52:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62F4D113779;
	Wed, 17 Apr 2024 18:52:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="kv41KNnm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2075.outbound.protection.outlook.com [40.107.220.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76A87113779;
 Wed, 17 Apr 2024 18:52:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KQbxLxTXuUqyBZDHxm+bL/7rnjtSp/OmwWMQsEM25oMafl9V13vlBnSXnc65bxcsoPPKwR66r904yssKe9lU7LrBZ0Z3bfwyAP7kGBjTdI8JXy8KOL2xLCm/c/SinjLUrCOwrvtbabQVbTh/ItigASexNrY07ePhhOXC6rrxFeRBXoQokHLSxJKkWu0vaiXVIyjUUab/MalSUJco+TU9elx/wbGhf8BDpDuCnhe6d+nyFtIGuV9YkC+njPkW6OL8TMg45hzIQzxF7d+xPQwcrWbpNovq0A4/Vj0Olcq4I6uvi1iDQhbPXAGOO9ih9kteY0224iX8b9pm7ndGqlhk3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P3vVGS388PBtQGdYxq39ozAUFRYYIsFWSJtbGYCreBY=;
 b=T0k/DWOLe3Pkawss5Mfd/GWLG/9gHTHPwhzgvpJbftirNYvw8VfM0amMQQK5EXz5ieQdmn33Wk8cK7MRvSsqUJ8Qz7I8h9rnpiahSDKJsaLruK2P9Mbq5BCWJVcM7lJfUywUELGiw346PiA/LWYwFlJ9U+XF3wUKM4SQqUYUL4UktcabDjowxAfGXm5Zjr4twutY9fmSph/ugRXHw4pfmACjCSr6d/LWB9x3Ih5K7b0dLHcyuDm2UPeqSy+D1a4MAt5pjWm5KnFLDcxlN9L2Ncx54dLp8pO3iWg8Rf+ll9m1oBLL0funIEeoXhOMxXLXKEUnLHIU3htr95VUHwzWDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P3vVGS388PBtQGdYxq39ozAUFRYYIsFWSJtbGYCreBY=;
 b=kv41KNnmC0/bCHk0ziDJ6YGJS42BGqf2BGcuRVROI51hsEgcXJkhH4emq/OQp0TSnewyKVOsMTaP8LyuPdcG/ydVnnZSEGayeULMxrPm2usHNEj9MC3fsb66assd0VVQSpSDh8tu/GB5Vmok/OnOAwlzSlBnX034ghbmCCL62lU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB5311.namprd12.prod.outlook.com (2603:10b6:5:39f::7) by
 CH3PR12MB9194.namprd12.prod.outlook.com (2603:10b6:610:19f::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7452.50; Wed, 17 Apr 2024 18:52:01 +0000
Received: from DM4PR12MB5311.namprd12.prod.outlook.com
 ([fe80::43dd:8fc3:fa6f:e54]) by DM4PR12MB5311.namprd12.prod.outlook.com
 ([fe80::43dd:8fc3:fa6f:e54%6]) with mapi id 15.20.7452.050; Wed, 17 Apr 2024
 18:52:01 +0000
Message-ID: <13e24eed-8fa0-4203-a6c3-9126bb787951@amd.com>
Date: Wed, 17 Apr 2024 14:51:59 -0400
User-Agent: Mozilla Thunderbird
From: Leo Li <sunpeng.li@amd.com>
Subject: Re: [PATCH 0/2] drm/amdgpu/display: Make multi-plane configurations
 more flexible
To: Harry Wentland <harry.wentland@amd.com>,
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 Simon Ser <contact@emersion.fr>
Cc: Alex Deucher <alexdeucher@gmail.com>,
 Marius Vlad <marius.vlad@collabora.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, Joshua Ashton <joshua@froggi.es>,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <mdaenzer@redhat.com>,
 Chao Guo <chao.guo@nxp.com>, Xaver Hugl <xaver.hugl@gmail.com>,
 Vikas Korjani <Vikas.Korjani@amd.com>, Robert Mader
 <robert.mader@posteo.de>, Sean Paul <sean@poorly.run>,
 Shashank Sharma <shashank.sharma@amd.com>,
 Sebastian Wick <sebastian.wick@redhat.com>
References: <20240315170959.165505-1-sunpeng.li@amd.com>
 <20240328163311.34b58b39.pekka.paalanen@collabora.com>
 <1ca9c55b-2358-4357-a337-c0bf5e3e2118@amd.com>
 <20240404132411.5bb5cb53.pekka.paalanen@collabora.com>
 <b1613277-567d-47db-af84-74dfad2e9cf2@amd.com> <Zg63qvnHgutUARrh@xpredator>
 <46968a40-e0e5-4af9-b859-8a41d5992863@amd.com>
 <20240412110325.4afa29ca.pekka.paalanen@collabora.com>
 <7d04e345-b319-4e2f-a1d3-378cc1881144@amd.com>
 <20240412180741.360d8c2b.pekka.paalanen@collabora.com>
 <CADnq5_MD4EBm4kGuK3fa0azKsMimEnTM3tm-Hy8CN-NNtom3Kw@mail.gmail.com>
 <75f2b674-4ad5-4d36-9708-0eea9a9bba6a@amd.com>
 <20240415111953.04b65a53.pekka.paalanen@collabora.com>
 <8f0a48da-3efc-4742-9539-d852fb92ebfd@amd.com>
 <20240416110120.0a5d24fd.pekka.paalanen@collabora.com>
 <d927a4ca-f602-40c5-a0a7-e329d5e4e273@amd.com>
Content-Language: en-US
In-Reply-To: <d927a4ca-f602-40c5-a0a7-e329d5e4e273@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT1PR01CA0132.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2f::11) To DM4PR12MB5311.namprd12.prod.outlook.com
 (2603:10b6:5:39f::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5311:EE_|CH3PR12MB9194:EE_
X-MS-Office365-Filtering-Correlation-Id: bda86cc3-d0e1-4b7f-d34c-08dc5f0f776e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SHz6vWVqNC0JoMKiRPF3iJ0CQhQEWGa0tqDE2dU8XvY0bgd6/JkHd4f4vj2xQCezc00U44psdOBAcslFKSrLzO1814gfrzjmvjEhKOkUttx3VfSnmeWZUPGPzsB1jk1yzFFAKtfUNpycMEL3VvAB25GM5uozeW9DZAT1ZTw4JvPwgAPZ3SIt9MKmerg63MVHHq0NOt2hjSnuf+GJOVymPwoK7uHPrgTiHjI5qh80xGrC27HWK5pjLTqx5oCTAtys6JpS8fPGtO9ktmPZx4uSg7hmIQ/K43uosALqSoGRVpTkH2jGrQldiXZ/JizAL6G6K4c1Y7XBwYbEuBn3yeYTRdZq6Aw/7VMAnoFrvFB29afc8+IcrRlychmFRvHmiotvMM80/mFohBMQFx0LXkApEvpqlA9F4+cgpEHfhIIWLh5K9kEu0w7MiLIARtEI2tDriGHUygzBLoVN8Qr/aLSuDBED9W7qSRP5XEcWzFd5N9ceWDzLbQgEaxHn0eRSb8ZbMMw//ScNaevbp9zisw5z1W0GYvhngWG6t2LPXtJuRZ+Tu/28FT69B2eMCi0YYCWncyfyru6rPSL+mCK06ngR/uh6NumFlzK8l3w+kwRlXsJSbRKVLAwfo9utFkMXCHotdw8eLuKepBWNZmN5kUpxoqfblfmMqbi3OGhmj+hdpGg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB5311.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015)(7416005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QmZVcHJ2eXNNZTRuZHpCTERMRVhsVVZDS1IyWFBXcmJvOTNMUHdSVUZ5VklX?=
 =?utf-8?B?U0haSTgycFRIODNRZVBWem5ISElpODllLzVtSloxUEgyZ0hYTWRTS1U0Tjkv?=
 =?utf-8?B?YXh2Mk9xcC9VQ0lIS2F6MUljM0lTWkZQeXlYUnRSaEdKZWZ0QWpvUWhGazEv?=
 =?utf-8?B?TXcxVjFtZ0RiWjFaNkxWTXU0K3BZRHA3SjF5L3N1ck5LendaTUV0MllEd2Fj?=
 =?utf-8?B?UkZ3MnhIZmFMYUZaY2hzbWprcGhObGx2MXc1ZFh4SmI3SjlXYjZ1SEl0T2ZT?=
 =?utf-8?B?RlVDcFFNcW1vR3NRVzFrL25VdWEvRkxmWWxIYnVUT0tOMDJMK0c0L0tKdHVh?=
 =?utf-8?B?ZGpEblZDUjlJZFJ6V2ptRStIcmd1Y2R5ZnRFRC9XTGFOYkhxalpqQUl5REZJ?=
 =?utf-8?B?Z0dpVHRiN1FoTFVBM0p5d3g1VDhwRGlpMTQyVmFiRnM1Zk9VYlo1NkJQcS8w?=
 =?utf-8?B?cnluQXp2ZWZBSkZ3TUtXU2xpL2s4NXU1dWtBcWlqQUZtQlJEYitic0VDWGJo?=
 =?utf-8?B?K1hpc3RjZzd4a0V4QitUSlAvTXQrUmdDQ1JtampVTnRSQnVUbTBnYUdjT3Rz?=
 =?utf-8?B?eUFPa2lIdjZFTVByQlFKTG9qQTloMWFCTXNoYkhiZHNkNlpPZFZXR0RENXZr?=
 =?utf-8?B?TC9TNytDOGlnMFJZV0xuZmQ0eHMrUmxGbUxDcWNha0tFVkgzSno3TG5VNnJE?=
 =?utf-8?B?RmNoREFSZkFRYmUwclliV0dLa25kaGdRNk5wZTJNTG5qM2pySHBDM0ljTVF6?=
 =?utf-8?B?VXpmVjJ5VG52T2RxRzBBakI1TEZPY2Q0ZER2UlRiNjhFaE55WnBQLzhRMWlp?=
 =?utf-8?B?S1gwZHVmcUZQdjdNWVJKS2NHS1FvcC9ORDN3blo2b2h3T1ExejFFWk1LM2dl?=
 =?utf-8?B?ODRNZWloM3NzWUw0Uk55R0tuKzQzQUd3MU5WcUttcG9ZSWtsOGpCUUNZU0ZK?=
 =?utf-8?B?Q2Z1SjJtS211M0k3RGRtNHV2aGVuMkludGVkTmc2Ny9maUpoU3N6d1hQUEtM?=
 =?utf-8?B?cTFrazRNZXZGbnVsMVlOYTd3OW1idGxzOHR5eVYvQTA1TjdQeHluQjE2dGlK?=
 =?utf-8?B?ZW85RUxubEVnVS9GN09URVFUekFVdWVnYlNWQTIrdnBSdWZ3QVc5YjdCWjkz?=
 =?utf-8?B?Y2gyL1pYaUZLcm5ZSnZ3amtUZjVEYlRWa0tGWEw2bVZCY1JzN3pQRDdZRE16?=
 =?utf-8?B?a3M3WjhrWDViVG9ybk1QeGZlVnUxajJPRThBdmpzYnBuTFk3ajZxT0swVGpS?=
 =?utf-8?B?eWdZTHhnN3JBNWw4VnRpaXQrUStKcjltSUxzazFZT0M1RkpTdDNWaHJwVk5L?=
 =?utf-8?B?dEptOFZwSGRldzRlS2gzbzdKOVlxSVQrbDhJSGk4cG1rMllUcW9BOUhpVTAy?=
 =?utf-8?B?RTRkcnpOdWVhV3dPNExHaVhkY0swaEF4QjlYNXQwOEtMY09xRkRRN0l0Q3Zy?=
 =?utf-8?B?M09ZSHZEQ21BeHErY2hNRHVOL3VEL0RiUHZXZDFBMzR3bXlRbWEwc05xL3Jl?=
 =?utf-8?B?SVRteEh1dGlERWd6bXRhc0k3d0JFTUEwcjJ6cHBSY2JOcUc2S3NtMU01K0Rz?=
 =?utf-8?B?TTNadVdQOWFNU0RLb1gxcEFvV0txMm95UjFEMHlWenh4U2RqUVlXUWR1RUF6?=
 =?utf-8?B?Mzd4NzErRHRvN20zY0V5c2JENm13SUxoamR2ZktsQlRJbHJ6UEJnbnZCU3pj?=
 =?utf-8?B?eHhsaWhHWVhMQ1paRS9JTTRlMTNBL2g5MFZERUg0V1loZW1NVzJZSWVtVzgv?=
 =?utf-8?B?d3J0Ui90UHkyNFVDdktnakxKYndvNUxhckJsd3JIdEdpTld6eTRtZEt0Z2FU?=
 =?utf-8?B?SnRldGxQYnVkUFFCSDZMM3JnZ2I0TURsaU90eElKaGpQQ3p3NmNZazBrLzVj?=
 =?utf-8?B?S0QzRHFTWjN0RzZFOUpIZ2tRSVNPMHhxVVJ4UzVvSElmUzNFQUtPbkYvTXZJ?=
 =?utf-8?B?cUZVd294Y2liTExlL2Zka3VOb3hVdEdqU1YwOWpoUS8xZXdWaUNmeDdPbGxV?=
 =?utf-8?B?NFpic2NMUTZYLzd2N0lQa0xaQVlHMFNPTWNlZllqcUhFWFhiL2krYncwTUtB?=
 =?utf-8?B?YThuNWE4Q2FhWWFLVm5EZTJPbTREYlp5Y3lZZnhOT0h6aG9Hek9mSTNWMlRm?=
 =?utf-8?Q?MX94=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bda86cc3-d0e1-4b7f-d34c-08dc5f0f776e
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5311.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2024 18:52:01.4673 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BItlb13/MEEr0P1AkE9uFMvPyDkvqkpEoK0PO6ngYU0SlGpAClyuWGIaidqG2SBe
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9194
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




On 2024-04-16 10:10, Harry Wentland wrote:
> 
> 
> On 2024-04-16 04:01, Pekka Paalanen wrote:
>> On Mon, 15 Apr 2024 18:33:39 -0400
>> Leo Li <sunpeng.li@amd.com> wrote:
>>
>>> On 2024-04-15 04:19, Pekka Paalanen wrote:
>>>> On Fri, 12 Apr 2024 16:14:28 -0400
>>>> Leo Li <sunpeng.li@amd.com> wrote:
>>>>    
>>>>> On 2024-04-12 11:31, Alex Deucher wrote:
>>>>>> On Fri, Apr 12, 2024 at 11:08 AM Pekka Paalanen
>>>>>> <pekka.paalanen@collabora.com> wrote:
>>>>>>>
>>>>>>> On Fri, 12 Apr 2024 10:28:52 -0400
>>>>>>> Leo Li <sunpeng.li@amd.com> wrote:
>>>>>>>      
>>>>>>>> On 2024-04-12 04:03, Pekka Paalanen wrote:
>>>>>>>>> On Thu, 11 Apr 2024 16:33:57 -0400
>>>>>>>>> Leo Li <sunpeng.li@amd.com> wrote:
>>>>>>>>>      
>>>>>>>
>>>>>>> ...
>>>>>>>      
>>>>>>>>>> That begs the question of what can be nailed down and what can left to
>>>>>>>>>> independent implementation. I guess things like which plane should be enabled
>>>>>>>>>> first (PRIMARY), and how zpos should be interpreted (overlay, underlay, mixed)
>>>>>>>>>> can be defined. How to handle atomic test failures could be as well.
>>>>>>>>>
>>>>>>>>> What room is there for the interpretation of zpos values?
>>>>>>>>>
>>>>>>>>> I thought they are unambiguous already: only the relative numerical
>>>>>>>>> order matters, and that uniquely defines the KMS plane ordering.
>>>>>>>>
>>>>>>>> The zpos value of the PRIMARY plane relative to OVERLAYS, for example, as a way
>>>>>>>> for vendors to communicate overlay, underlay, or mixed-arrangement support. I
>>>>>>>> don't think allowing OVERLAYs to be placed under the PRIMARY is currently
>>>>>>>> documented as a way to support underlay.
>>>>>>>
>>>>>>> I always thought it's obvious that the zpos numbers dictate the plane
>>>>>>> order without any other rules. After all, we have the universal planes
>>>>>>> concept, where the plane type is only informational to aid heuristics
>>>>>>> rather than defining anything.
>>>>>>>
>>>>>>> Only if the zpos property does not exist, the plane types would come
>>>>>>> into play.
>>>>>>>
>>>>>>> Of course, if there actually exists userspace that fails if zpos allows
>>>>>>> an overlay type plane to be placed below primary, or fails if primary
>>>>>>> zpos is not zero, then DRM needs a new client cap.
>>>>>
>>>>> Right, it wasn't immediately clear to me that the API allowed placement of
>>>>> things beneath the PRIMARY. But reading the docs for drm_plane_create_zpos*,
>>>>> there's nothing that forbids it.
>>>>>   
>>>>>>>      
>>>>>>>> libliftoff for example, assumes that the PRIMARY has the lowest zpos. So
>>>>>>>> underlay arrangements will use an OVERLAY for the scanout plane, and the PRIMARY
>>>>>>>> for the underlay view.
>>>>>>>
>>>>>>> That's totally ok. It works, right? Plane type does not matter if the
>>>>>>> KMS driver accepts the configuration.
>>>>>>>
>>>>>>> What is a "scanout plane"? Aren't all KMS planes by definition scanout
>>>>>>> planes?
>>>>>
>>>>> Pardon my terminology, I thought the scanout plane was where weston rendered
>>>>> non-offloadable surfaces to. I guess it's more correct to call it the "render
>>>>> plane". On weston, it seems to be always assigned to the PRIMARY.
>>>>>   
>>>>
>>>> The assignment restriction is just technical design debt. It is
>>>> limiting. There is no other good reason for it, than when lighting
>>>> up a CRTC for the first time, Weston should do it with the renderer FB
>>>> only, on the plane that is most likely to succeed i.e. PRIMARY. After
>>>> the CRTC is lit, there should be no built-in limitations in what can go
>>>> where.
>>>>
>>>> The reason for this is that if a CRTC can be activated, it must always
>>>> be able to show the renderer FB without incurring a modeset. This is
>>>> important for ensuring that the fallback compositing (renderer) is
>>>> always possible. So we start with that configuration, and everything
>>>> else is optional bonus.
>>>
>>> Genuinely curious - What exactly is limiting with keeping the renderer FB on
>>> PRIMARY? IOW, what is the additional benefit of placing the renderer FB on
>>> something other than PRIMARY?
>>
>> The limitations come from a combination of hardware limitations.
>> Perhaps zpos is not mutable, or maybe other planes cannot arbitrarily
>> move between above and below the primary. This reduces the number of
>> possible configurations, which might cause off-loading to fail.
>>
>> I think older hardware has more of these arbitrary restrictions.

I see. I was thinking that drivers can do under-the-hood stuff to present a
mutable zpos to clients, even if their hardware planes cannot be arbitrarily
rearranged, by mapping the PRIMARY to a different hardware plane. But not all
planes have the same function, so this sounds more complicated than helpful.

>>
>>>>>
>>>>> For libliftoff, using OVERLAYs as the render plane and PRIMARY as the underlay
>>>>> plane would work. But I think keeping the render plane on PRIMARY (a la weston)
>>>>> makes underlay arrangements easier to allocate, and would be nice to incorporate
>>>>> into a shared algorithm.
>>>>
>>>> If zpos exists, I don't think such limitation is a good idea. It will
>>>> just limit the possible configurations for no reason.
>>>>
>>>> With zpos, the KMS plane type should be irrelevant for their
>>>> z-ordering. Underlay vs. overlay completely loses its meaning at the
>>>> KMS level.
>>>
>>> Right, the plane types loose their meanings. But at least with the way
>>> libliftoff builds the plane arrangement, where we first allocate the renderer fb
>>> matters.
>>>
>>> libliftoff incrementally builds the atomic state by adding a single plane to the
>>> atomic state, then testing it. It essentially does a depth-first-search of all
>>> possible arrangements, pruning the search on atomic test fail. The state that
>>> offloads the most number of FBs will be the arrangement used.
>>>
>>> Of course, it's unlikely that the entire DFS tree will traversed in time for a
>>> frame. So the key is to search the most probable and high-benefit branches
>>> first, while minimizing the # of atomic tests needed, before a hard-coded
>>> deadline is hit.
>>>
>>> Following this algorithm, the PRIMARY needs to be enabled first, followed by all
>>> the secondary planes. After a plane is enabled, it's not preferred to change
>>> it's assigned FB, since that can cause the state to be rejected (in actuality,
>>> not just the FB, but also any color and transformation stuffs associated with
>>> the surface). It is preferable to build on the state by enabling another
>>> fb->plane. This is where changing a plane's zpos to be above/below the PRIMARY
>>> is advantageous, rather than changing the FBs assigned, to accommodate
>>> overlay/underlay arrangements.
>>
>> This all sounds reasonable, but why limit this to only the renderer FB
>> on primary plane? The same idea should apply equally to any FB on any
>> plane. Then one needs more heuristics on when to stop the search short,
>> and when to reconsider each FB-plane assignment in case new candidates
>> have appeared but the old ones have not disappeared.

libliftoff starts the search by assigning the renderer FB, if one is provided by
the compositor, to PRIMARY. I think the reason is to always have the renderer
option available for FBs that need it. Eventually, if the search tree is
traversed enough, an arrangement that does not need the renderer fb may be
found, if all the FBs can be assigned, and there are enough planes for them. But
we may not get there before the deadline.

Perhaps having more time to search is the solution here.

(p.s. if a candidate FB is added or removed, libliftoff starts the search anew)

>>
>>> I imagine that any algorithm which incrementally builds up the plane arrangement
>>> will have a similar preference. Of course, it's entirely possible that such an
>>> algorithm isn't the best, I admittedly have not thought much about other
>>> possibilities, yet...
>>
>> It's a complicated problem, indeed. Maybe there needs to be a background
>> task that is not limited by the page flip deadline and can do an
>> exhaustive search over many refresh periods.
>>
> 
> That would be nice. Kick this off when there is a configuration change,
> e.g., user starts video playback, opens a new video, etc.
> 
> One would need to avoid doing too much of that, though, as one could
> envision scenarios where this happens frequently and could have its
> own impact on power by keeping the CPU busy.
> 
> Harry

I recall emersion had a similar suggestion for libliftoff by caching the
incomplete plane arrangement for further processing on future frames once the
deadline is reached. It avoids the need for a separate task.

Having more time to do a more exhaustive search would make zpos meaningless
outside of determining the correct z-ordering, as pq previously mentioned. It
would support hardware that have zpos limitations. It is more complex, but maybe
that's fine, as long as the complexity doesn't bleed into other parts of the
compositor.

There are still ways to limit the # of atomic tests needed for the search, which
will help speed things up (already considered by libliftoff today):

* IN_FORMAT property for what FB formats a plane supports
* zpos property for correct z-ordering
* Occlusion rules. A FB occluded by a rendered FB or underlay-ed FB cannot be
overlay-ed, for example
* And potentially more

Thanks,
Leo

> 
>>
>> Thanks,
>> pq
> 
