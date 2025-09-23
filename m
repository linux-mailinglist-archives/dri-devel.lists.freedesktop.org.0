Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14A47B964A1
	for <lists+dri-devel@lfdr.de>; Tue, 23 Sep 2025 16:35:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEA9B10E633;
	Tue, 23 Sep 2025 14:35:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="rX531BMa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazon11011067.outbound.protection.outlook.com
 [40.93.194.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3AE610E633
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Sep 2025 14:35:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VO4gzK2xgMxmkc2DPCnu/Hwc8GnaW7chxkb1o4G6lMMvmcUoA74kpfg1vkT7bAuIgMrqUGwa4kdk0oadQS/Z44FgTLbw5LXIaQw8WFvuSQlqbItNx/0FTlvjGxJGy9X3CfUXzJp6zHoCdMLYMTkSgSv2yIsPJoJufZdRmSmNFCtvfGG7PSd3vG3+giQh13gzY3zPdVpsNS91bfizeiiXe/Fr080nFEWfjAKLfbCDOWvye8Aj/vTqghq6SlcCVi2a5IJK6lSfAIKEgHfRWfCmLcBepey4QbqEFUSImwx+QieNr4Fb8Sdtr4p+CZt1hyouEQLSR0pCvssZuvvctA6vkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FPSYWGqQE+EaspQBQKzk1EHZjGMpDkvV50PtBb2ok3c=;
 b=PS54zm5rc5yyhY0S9F6tSM6ySIaqFD/VogBiV+jU9zEU3fNWk3rGhkYpj376tllfRBfaXuJd9sTbDmqA4K2259QDcft1Iv9wA0ZR53anMME8HQ/2zbCDly9FvPasm/FFuJqub4/1bIid9urk+8eVCcDucPnkJAAttm6lmixiWF/pcAslFrXfVHgbj4bTI8uwKvWbPwpi/Rqz5VsVZYg6IdbLvOdMjlWBYplcxtJWEpbGlrFVjrhFrZax8ZLpTycZfempBgC3brHXKYfynU0SFjFp5vfXU/hTweiF+c4lw1j7PMMZek92wZX4vkmwVTZR2KChzO7BENAxN8oRT3n+ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=temperror (sender ip
 is 165.204.84.17) smtp.rcpttodomain=mailbox.org
 smtp.mailfrom=amd.com; 
 dmarc=temperror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FPSYWGqQE+EaspQBQKzk1EHZjGMpDkvV50PtBb2ok3c=;
 b=rX531BMa+1OfX6GEfGI7KW8JxEsFWVVfxN9Ifh+dt2FNfZ0YCikjrJEChoYD1eYyrqtqi5EhkfxchP338brEab0fLcObrMWJnxq+g6sMapqz0kOyI17wM/OiS7KtLq0QIexhHwis+QdBm4z8pZu1IZo+A2rbPmYfDvU35uZA7rQ=
Received: from SA1PR03CA0002.namprd03.prod.outlook.com (2603:10b6:806:2d3::11)
 by SA3PR12MB7879.namprd12.prod.outlook.com (2603:10b6:806:306::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.20; Tue, 23 Sep
 2025 14:35:34 +0000
Received: from SN1PEPF00036F40.namprd05.prod.outlook.com
 (2603:10b6:806:2d3:cafe::87) by SA1PR03CA0002.outlook.office365.com
 (2603:10b6:806:2d3::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9137.21 via Frontend Transport; Tue,
 23 Sep 2025 14:35:34 +0000
X-MS-Exchange-Authentication-Results: spf=temperror (sender IP is
 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=temperror action=none header.from=amd.com;
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of amd.com: DNS Timeout)
Received: from satlexmb07.amd.com (165.204.84.17) by
 SN1PEPF00036F40.mail.protection.outlook.com (10.167.248.24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9137.12 via Frontend Transport; Tue, 23 Sep 2025 14:35:33 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Tue, 23 Sep
 2025 07:35:31 -0700
Received: from satlexmb07.amd.com (10.181.42.216) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 23 Sep
 2025 09:35:31 -0500
Received: from [10.254.37.111] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Tue, 23 Sep 2025 07:35:30 -0700
Message-ID: <56b2a874-e2b6-4b50-8a12-c90dc1e86316@amd.com>
Date: Tue, 23 Sep 2025 10:35:30 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] drm/uapi: Indroduce a VRR Range Control Interface
To: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>, "Tseng, Chuan
 Yu (Max)" <ChuanYu.Tseng@amd.com>, Derek Foreman
 <derek.foreman@collabora.com>, Xaver Hugl <xaver.hugl@gmail.com>
CC: "Wentland, Harry" <Harry.Wentland@amd.com>, "Limonciello, Mario"
 <Mario.Limonciello@amd.com>, "victoria@system76.com" <victoria@system76.com>, 
 "seanpaul@google.com" <seanpaul@google.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
References: <20250912073305.209777-1-Chuanyu.Tseng@amd.com>
 <010201993e2cb26f-089ce007-9e30-4b79-b487-c16c360309fd-000000@eu-west-1.amazonses.com>
 <d8694d69-62b3-4418-9fcb-d37c1daa1f9f@mailbox.org>
 <010201994e05ce63-85ad5afd-fc09-48fc-bd6e-f3716c8ba09f-000000@eu-west-1.amazonses.com>
 <d52ec8d7-cc5e-4801-bc04-096504a131b7@mailbox.org>
 <CAFZQkGzWUK5BP_f=zyOM8_pzvv6xYOaVdqN4RAULArvEmD4wUg@mail.gmail.com>
 <01020199583bf42e-4a08777d-554c-42b7-a42c-5162f4459a72-000000@eu-west-1.amazonses.com>
 <CY1PR12MB9583E829ED2AF17A77A3EE7DE516A@CY1PR12MB9583.namprd12.prod.outlook.com>
 <508d9810-1e42-4439-b1f5-e213892975c0@amd.com>
 <c3474514-7f2a-4443-a152-e035af7e0379@mailbox.org>
Content-Language: en-US
From: Leo Li <sunpeng.li@amd.com>
In-Reply-To: <c3474514-7f2a-4443-a152-e035af7e0379@mailbox.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB03.amd.com: sunpeng.li@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F40:EE_|SA3PR12MB7879:EE_
X-MS-Office365-Filtering-Correlation-Id: db305e51-7630-44b0-f431-08ddfaae73f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|376014|1800799024|42112799006|82310400026|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MlVhMTMvMXFodlA4aGJEdFJZTEFTV0hCc1kwNE1KZnRTT0EycjIxcXBsbjlR?=
 =?utf-8?B?Sk93NTlOeHJPemU1djloZjFUWUVTUzI2akpLaDlqQlFoWDVJeVpoakFjVnFx?=
 =?utf-8?B?TmZ0dFFIbzd2eVRQRjlaYzBuSHlWZUthRC9zYnFnT1ZWSkJ3WjdEMEFHL21U?=
 =?utf-8?B?cE4xZEMxNkFOeEtMZXBJSlQ3blU0NWpLVTVxQ2xNVzdIZ0RlcFhvMlRPWVFT?=
 =?utf-8?B?dzY1Mlo2V254RWhKQzRpZG05d3phYzF3Q0xhd1VRS09yZVVNNldmbmhVdVFi?=
 =?utf-8?B?WE1Ca25CdjF4YnFCdVRpNVNKNnNuRVg5TGloVlhlT1dsOHEwZFVYdEFnck10?=
 =?utf-8?B?UlJyNEpPd2dkQ2pidEw3Vy82MHVoVTRkcXV2eGsxenRTajV6dFZOV3BkZDJt?=
 =?utf-8?B?V3VrdmEyRi9Nb1l3RU5BajZmOUtHOTJtb2U0T254RU94TjZXYkZOWXpLcS9P?=
 =?utf-8?B?L2R0RW96RkxUMTNDdTJRK2dLVlJ5bGdJVHZPYVU1VDhNcHN3Zjl1TzFDRjVq?=
 =?utf-8?B?eC91Z3dFeWhOL2xXaDlQOEJlTG5mVVc4OURSKzVOeWtHdFlHTHZicDE1TU9X?=
 =?utf-8?B?L2xoVEM1NFF2SWhoZFlVb2l3WmZGRGZKMXFDbjZwMUJNS1lGZnBHeXpxNi9S?=
 =?utf-8?B?MWxyeDFhejdkK0hOdTZDVyt4Qld3YnBQSFZzZVFaKzFRT3lYd3hWNS9sRFlm?=
 =?utf-8?B?amxVNk02cXAxREl2cWNiNUprbXM0V214ajBNTmZ3Vkhrc3FhV3FOM0s4SFl1?=
 =?utf-8?B?VkpnNkNKdDMvT05meXh0WDFNUCt6bWd3MDBxWjRVeFQ2RmRORUJocmtRbzF0?=
 =?utf-8?B?L1o0UG9MSUszZVMzc0VQNUh2ZXo5bVJDaXdSajBJSEZGT1RJUng3bFRST1FQ?=
 =?utf-8?B?RGszeStyZ0RadEdMRndDRDBpbnNyUEM2MUc3TTFzT3Vwb3p3RUhFTy93TkJ1?=
 =?utf-8?B?Y1YwOUh3ZVBpSE5jZGd2RlRoQ0hucHBNWkhXTnhpNWg3aWt4QXBSM003ckNy?=
 =?utf-8?B?N3dXZHI5blZzTy9BVVBrYkxEb3BKaDlxcWZkazdvT3RwVU1IQmFqTDFzbkRT?=
 =?utf-8?B?MmdXYzBqcjVHemt1QlVwTGlMODZaeDFaQWo2dWlwazhXdno3Wm5keDZDZ0U2?=
 =?utf-8?B?bWRwTXAvYlBUWkNOSW9weGNpa2s0d3hvWXFCOGdNWGQxZ3h4L01LV21Bb0NI?=
 =?utf-8?B?L2JlUEdDR0Rjdmo4MUNMY0kyRmpaVkhFS0tBOFFST25iaXpUQjBWZkkxVXVT?=
 =?utf-8?B?cEtkdEc1SnozaDFWUEdHWmYrVjdPOUNTQ2orMWNmZEdNVkJkN1libm1rWUcr?=
 =?utf-8?B?VExZbHZ4cDV0ZEhDK2h3TDNsT1B4VHRhZzRFUFhXaFFSS2dsblpMV1RDdks1?=
 =?utf-8?B?QmdiUFI3YXdHbWxXTTkydERRZTFrK2FhdXlGYitKYVhBbmdnRXdvWXdqRFRa?=
 =?utf-8?B?SVovZ0NnbS9GNnppSWhGRHA2UXpWNGxzVDlhOEQrNlVkcjRqN1F6ekw1M0dR?=
 =?utf-8?B?Zm41M3Y4T1JRSUtWbEEzY1VpYWo5d1lDK2pHMi8vMjlpTWU0U3VWWkl3MFhh?=
 =?utf-8?B?WWNZRTR6SUtDNlNjbFRxVUpUV0JLNUR3ZWF6US9Zc01BTmlpaUExQUFuRkRC?=
 =?utf-8?B?L3pXcW10ZmhmcGhaT29TbGtxSGoxL0k1VXJXUlVOU3lmdlJ4Vk9Yc0ZEYlRT?=
 =?utf-8?B?WWxnVmx1UW1BR2VOd0g5dVFUZ1dHWUgxaHdxRHYyYlVJdVl0M1NBV2gwSWVw?=
 =?utf-8?B?TGNpVXY0OWh6cnduT2xzdzZnMU1MSUhmMmhSejBkM0Njek5NdCtEZUR4YXZp?=
 =?utf-8?B?RWc5WjIxdjA2dlZnYzhXZXJBNDlvU1ViM29nYXV3OUhML0lLMFU5VjR6bC9q?=
 =?utf-8?B?a3dmVS9xNDlNNnpEZTMydnMrLytSMnZVM0NvdUdaOEg2RWZ2K0xRWFJYcGtq?=
 =?utf-8?B?blZlWjhVajMxQ2Z3eEhrZEVKYzhIaGtIVXcyWUdmTTRIMnBUQkFKbGp3YUsv?=
 =?utf-8?B?QUNKdHBEcFhGRzZDVm9wT2lVclkzSWR6bzFpU3hPQzVGNSs2VmtpUDkveUha?=
 =?utf-8?Q?MXErU2?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(376014)(1800799024)(42112799006)(82310400026)(7053199007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2025 14:35:33.2200 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: db305e51-7630-44b0-f431-08ddfaae73f0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF00036F40.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7879
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



On 2025-09-23 04:37, Michel Dänzer wrote:
> On 22.09.25 21:06, Leo Li wrote:
>> On 2025-09-18 04:33, Tseng, Chuan Yu (Max) wrote:
>>> On 9/16/25 4:56 PM, Xaver Hugl wrote:
>>>> Am Mo., 15. Sept. 2025 um 17:49 Uhr schrieb Michel Dänzer
>>>> <michel.daenzer@mailbox.org>:
>>>>> On 15.09.25 17:37, Derek Foreman wrote:
>>>>>> On 9/15/25 5:01 AM, Michel Dänzer wrote:
>>>>>>> On 12.09.25 15:45, Derek Foreman wrote:
>>>>>>>> On 9/12/25 2:33 AM, Chuanyu Tseng wrote:
>>>>>>>>> Introduce a DRM interface for DRM clients to further restrict the
>>>>>>>>> VRR Range within the panel supported VRR range on a per-commit
>>>>>>>>> basis.
>>>>>>>>>
>>>>>>>>> The goal is to give DRM client the ability to do frame-doubling/
>>>>>>>>> ramping themselves, or to set lower static refresh rates for
>>>>>>>>> power savings.
>>>>>>>> I'm interested in limiting the range of VRR to enable HDMI's QMS/CinemaVRR features - ie: switching to a fixed rate for media playback without incurring screen blackouts/resyncs/"bonks" during the switch.
>>>>>>>>
>>>>>>>> I could see using an interface such as this to do the frame rate limiting, by setting the lower and upper bounds both to a media file's framerate. However for that use case it's not precise enough, as video may have a rate like 23.9760239... FPS.
>>>>>>>>
>>>>>>>> Would it be better to expose the limits as a numerator/denominator pair so a rate can be something like 24000/1001fps?
>>>>>>> I was thinking the properties could allow directly specifying the minimum and maximum number of total scanlines per refresh cycle, based on the assumption the driver needs to program something along those lines.
>>>>>> Surprisingly, this would also not be precise enough for exact media playback, as the exact intended framerate might not result in an integer number of scan lines. When that happens a QMS/CinemaVRR capable HDMI source is expected to periodically post a frame with a single extra scan line to minimize the error.
>>>>> Interesting, maybe your suggestion of numerator / denominator properties is better then.
>>>> API wise, I'd much prefer just using nanoseconds instead of two
>>>> properties that compositors will in practice just use the same way.
>>>
>>>> Yeah, I hear you. Period is generally much nicer than frequency, and every other time I'd unconditionally agree, but QMS is awkward in this regard.
>>>>
>>>> The media file I start with will have a fraction specified in integers for the rate, eg: something like 24000/1001 fps. That will map to an index in an array of QMS blessed target framerates (24000/1001, 24, 25, 48/1001, 48...) and the index ends up in a bitfield in the HDMI QMS infoframe. That infoframe also has a bit to indicate that the framerate is currently constant, with constant defined as "constant number of scanlines but may be exactly 1 scanline longer occasionally".
>>>>
>>>> In the constant state we'd need to maintain that fixed rate within that constraint, and the integer math to do that needs to start from 24000/1001.
>>>>
>>>> So if we used a nanosecond period for the interface, we'd need to take the media file's values and convert them to nanoseconds, then in the kernel convert back to something like milliframes per second (so we could get something near 23976), then look that up in the QMS accepted rates array, have some manner of epsilon to decide if we're close enough to one of them to use it, and then use the integer representation (back to 24000/1001) to setup the scanline temporal dithering algorithm to do the +1 extra line every few frames to hit the exact rate.
>>>>
>>>> In effect we'd throw away the precise values we started with and try to reconstruct them later.
>>>>
>>>> QMS also has the added strange feature of being able to set a fixed rate below the display's normal VRR minimum, so I'm undecided as to whether this range control interface is an ideal match for setting up QMS anyway, or whether I should propose a separate fixed rate property later. I just don't want to ignore this discussion and show up proposing another non-orthogonal property later.
>>
>> Static video/desktop frame rates was indeed one of the motivations for proposing this API, so it is worth discussing.
>>
>> For amdgpu (and I think most HW are like this), hardware VRR granularity is at # of total vertical scanlines (vtotal). So if that isn't precise enough, then the driver will have to do record-keeping to alternate between some vtotal and vtotal+1 to avoid drift.
>>
>> It's not impossible to do, though I'm not sure at what point the driver is considered to be doing "unexpected adjustments of refresh rate", which was something we were also trying to address with this new API. Today, drivers are free to do unexpected things with the vtotal, such as frame-doubling to handle rates below the supported vrr min, and frame-ramping to prevent panel flicker. We discussed at the display hackfest that this was not something compositors liked, and that compositors would like to handle that themselves.
>>
>> Now, memory fails me, and I don't remember the exact motivation for why compositors want transparent vrr control. Was it because of unexpected driver-reported vblank timestamps messing with compositor internal record keeping? Or something else entirely?
> 
> AFAIR it's mostly about the compositor being able to control the refresh rate in general (e.g. keeping it low to save power) and allowing it to handle LFC & ramping without interference by the kernel's corresponding handling.

I seem to recall a good reason mentioned for why compositors would like to handle LFC & ramping, but I don't recall the details. Otherwise, would it not be simpler for the compositor to leave that to the kernel, and have one additional "static_refresh" property to handle low hz desktop and static hz content scenarios?

Thanks,
Leo

> 
> 
>> Another way of putting it: Would the compositor rather:
>>
>> 1. Specify a min_vtotal + 1 == max_vtotal so driver doesn't do any unexpected adjustments out of the specified range, or
>> 2. Specify a min_frame_ns == max_frame_ns (or some other highly-precise unit), and have driver correct for drift by alternating between two vtotals, and hence adjust refresh rate beyond the specified range?
> 
> FWIW, I'd be fine with option 2.
> 
> 

