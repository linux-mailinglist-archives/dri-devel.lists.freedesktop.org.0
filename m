Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56A2AB92BAB
	for <lists+dri-devel@lfdr.de>; Mon, 22 Sep 2025 21:06:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87CBE10E13A;
	Mon, 22 Sep 2025 19:06:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="W5s/vKkP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazon11010034.outbound.protection.outlook.com [52.101.85.34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 339B710E13A
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Sep 2025 19:06:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ALXfPlqFyA1FJa8DXO7u+xa8bZLcB616BLUtVjEZDlt4VeUC04Vz9tDxs0kjreoqg/aiDXNJjkxlbiSGqoZIdaOv+yEhTOLHdIgV1a4rTCI/HfhDZ/qzvZq4gtxUQcZNOeQ1Kxv5E5jO0D+ubaqeuK08fYcaf9ee80qtdda/j4w9IdCZLLygciu36vxtgWsITwk7O/khrPD4zZR2PFyaW6tEC5QqhNk9sRsHyVzsxYS9uQskwC5I3u+RQzyxDg8toZxw2Pe3RjCSVUYACf7qnSDudidZD/v7VaXjGoEHTislf1H5YSAaige7GlgfRLeePr7vH0fXhdH1RBZ4eCmKTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PiSgg/kCh2xM4au7focgl2o3pldeQ1gyZY/bb9MxM8c=;
 b=zLtDdHKnXqTUMWNzuv2Sy/pJUoU64pBp/Oy2JJQJPDw9WgVX0LhfB4elAh8a91tAqdjKSPsBemjKaRDvyACtC3rVVwDKNnoJK4AiB8qndCUl9jTBAfjxSxefvvFJircrBj5rGmx0/Xw6xoPhBreHdX5OEta362FBwVxKnBBujX5sROo5RT0BzDQW0fosWspwn4lZZvIlrV1fIIRoGYtIxLEMusjF9KElZ06ZzsezoU83Te41yBA2gr73p8MpQtiF1GlcIraGBBkYIN5aaA2sxioj5T28Np9cQ2ETaua0wliggNmOCrI27D1WDmZQMwLI/bG9Rb3ejFdImP9trE9+CQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=collabora.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PiSgg/kCh2xM4au7focgl2o3pldeQ1gyZY/bb9MxM8c=;
 b=W5s/vKkPU4ZCCAL+NzbtuyN4K9ja4eMj5Ae3pNsUSTwNJJvfL2/k9PhS+J+KDWYRTIbMtTZyz4rIQhtCCnhkSvXAkIEMAgnIl0hnWC1luYq9E6xbuHDXQhKwJKpij3tW+ZrhoJq3WLXp7D8MQ9a3MFr6WqdO3V8wEKraApeyg5U=
Received: from DM6PR03CA0076.namprd03.prod.outlook.com (2603:10b6:5:333::9) by
 PH0PR12MB8125.namprd12.prod.outlook.com (2603:10b6:510:293::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9137.19; Mon, 22 Sep 2025 19:06:18 +0000
Received: from DS3PEPF000099D8.namprd04.prod.outlook.com
 (2603:10b6:5:333:cafe::50) by DM6PR03CA0076.outlook.office365.com
 (2603:10b6:5:333::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9137.20 via Frontend Transport; Mon,
 22 Sep 2025 19:06:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 DS3PEPF000099D8.mail.protection.outlook.com (10.167.17.9) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9137.12 via Frontend Transport; Mon, 22 Sep 2025 19:06:18 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Mon, 22 Sep
 2025 12:06:17 -0700
Received: from satlexmb07.amd.com (10.181.42.216) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 22 Sep
 2025 14:06:17 -0500
Received: from [10.254.37.98] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Mon, 22 Sep 2025 12:06:16 -0700
Message-ID: <508d9810-1e42-4439-b1f5-e213892975c0@amd.com>
Date: Mon, 22 Sep 2025 15:06:16 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] drm/uapi: Indroduce a VRR Range Control Interface
To: "Tseng, Chuan Yu (Max)" <ChuanYu.Tseng@amd.com>, Derek Foreman
 <derek.foreman@collabora.com>, Xaver Hugl <xaver.hugl@gmail.com>,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>
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
Content-Language: en-US
From: Leo Li <sunpeng.li@amd.com>
In-Reply-To: <CY1PR12MB9583E829ED2AF17A77A3EE7DE516A@CY1PR12MB9583.namprd12.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB05.amd.com: sunpeng.li@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099D8:EE_|PH0PR12MB8125:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b98522e-7190-44d4-90c7-08ddfa0b1c6d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|82310400026|42112799006|36860700013; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VVZrMDFkRlhSRmdwWkVUN2syWWRvN1NSZnpyZldiQit2VXhJSndHOUpvb3o5?=
 =?utf-8?B?TjAxRzZuZHd1ZU9sQStiVGN1R1RPWEdGdVQ2dVgvcVNJc2tCaHVYUDNQY1dQ?=
 =?utf-8?B?cXByKzAxVXM5U2R5WmRNTm1uNEhzU1MxZHF0Rm5yUWROQU13MU9YUTZHQlln?=
 =?utf-8?B?SlQrbE04VmhjYmRPVUYza1QyVW9vZlFmaE4vZlhjbDVmTFFpeEVpcGpDM3Vv?=
 =?utf-8?B?eWFraEhrNVg5ZjQ1cktPelBrVzJ5VmZTZXJkdVVJeFlFdXpZK01TNzJxWnB1?=
 =?utf-8?B?REFjMlRkU2JRNXJUL0U2akhNZnpaa3oyUUpibExqT2R4elhhR0hRL2tJQU85?=
 =?utf-8?B?TTcwNjNGa3NWSkhBK2FVRmhQZllOSXNseFZjZ0JoeFJPVmcxK0JBaW5ONndl?=
 =?utf-8?B?ZnEyM0tzazNOb3BjcThmZjd4UE9nRmJFRHArOVZhL2dSNVcvZGo0SEw1Mkth?=
 =?utf-8?B?YXpCNlZPMk42UGVQZE02cGVBVk1CbEFFT1IySkVyaXE1ejFhckpabC9PSUdk?=
 =?utf-8?B?YVNMdUhiZWZpV3ZlZVlRdmZuVExEWHJaeTB2S3QrUmw3UHRvaXJRc1RsRVZ4?=
 =?utf-8?B?ZUgzbHhWWCs5WG9lakVzVThQc2dNVWVQckN1bWxiRUFvRHFaZlRwbk1odTA3?=
 =?utf-8?B?RVM1RHZ3d1FHT0s0bVJUVkd0T1JLZFFBV2ZuajNHY056dnl6SytKZnF6T0E2?=
 =?utf-8?B?SDRCWlNsTTM5cjhQNS9saGxqcmhCSE1CVjBWOWRLL1c3VHhpYmttd3p0cGhq?=
 =?utf-8?B?VE5jd0hQa3ZJK015TjdySFlpb0pQdEdSZHlBdDVuQXVHWXlCSXdtdklyKytx?=
 =?utf-8?B?Z0lkSEJwMFZIbGQ4T094dzhwYzBCNVpORHdOdWhyQ3NCcVBlZ1NHMlVzeDBV?=
 =?utf-8?B?ZVd0RU9WRXJ6d2s3b3BIbzlTaVVxZzNMeWF2eDBEK3dmVTNtMXhBRmZtVi9u?=
 =?utf-8?B?L01ZNkFzeWdVU0FSR1l6OTBvc29vN0dXQVdEYjJTektXMFZScEU2eU1hd1pu?=
 =?utf-8?B?NG1URFA4M1Irbm9Yd1V4cENpcGk0SkhCSXpER1N5TmlGVlZVVmhyV01mMnMx?=
 =?utf-8?B?endoSTkzeUF3c3lPcWxHRlgvejVMREorbGs1ZlpSdVl6Z3g4dWxodVpVQXRp?=
 =?utf-8?B?LzBGWDNENjYrNEo4VHpHYlh5TXE0Q3ZLVzdacCtkVjJFclI3d05HekFvbFNT?=
 =?utf-8?B?a1RiVHY5OXJlL0tpZXg2L1pOQzltbEltZWRCZEFZY2lSZ2R2c2VueFZhWkRX?=
 =?utf-8?B?VXBLZkFzKzluSHdzN2cwclhLY1haTlBoenNuR21RZk1oaVlZYVRoRWZ5SU1i?=
 =?utf-8?B?dDc2SnNLZGp0c0JvS2FJb2xHTlM3Z0ovU28yNzhLVHl1eG5mZmM2cDRrYmxn?=
 =?utf-8?B?TXJQcDVFcDA4Ty9OU2Z3c1JNNFQxNmU4VlQ1WURaZDJUeDhXdmNsSlBNRkFz?=
 =?utf-8?B?aUUrR2NoTXQ1eW5MaWhwejZ6NnhBNnB1MU1McERUK3lsS01leEdHM1BXNkVM?=
 =?utf-8?B?TXFrdFVYczdLNW53VjRzcWtsdndHTnIwRkFWeS80a0ZoelJiRC9rZ3NOdEti?=
 =?utf-8?B?UnhzaWtlOHZqWUFUdkZ3cTJFRTB3NVVLUk9HTk9EbTZDblpPYjdINm5oNE43?=
 =?utf-8?B?ejFxUU9jdTNQR01UaVViZVUrNm8zdVBzMS9zcnNhM09yZDcwR0dvd29sNWdj?=
 =?utf-8?B?QWRJVDM5YjdBdEdiWitaMzg4K0s1ak1mYWNDNTFmaDRkeUVlbk45bE9CZGd1?=
 =?utf-8?B?eGgzanFmQ3h3aXUzNFZHZmIvRHNLY0JrOG1LbXFOZFBCMTNxNWtwRVdkSzVD?=
 =?utf-8?B?Y3IvOGtSVnAxb2dMTkU0Qkp2WFVZUzFWWDBCcUxVSE1uU2VqMkp4Wmd1VWVJ?=
 =?utf-8?B?UWhEZFZDMi94K1plOURLRWVwL2tvK2V3Q3FUOTgrU3l0Y1ZLdzhMNjF6SmtS?=
 =?utf-8?B?UUl0ZFBSWWh5cDZ1b21mMXZRaEdJUUJxVGxqTTRSTUsxNndQUXVzZ3M0aVpm?=
 =?utf-8?B?a0ZiT0pCRFR2OHRZeDFZcXByYnlwZHBlSkkvOTV3a3ZwbUJ4WVd4dEdTZjhs?=
 =?utf-8?Q?s+tWRd?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(82310400026)(42112799006)(36860700013);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2025 19:06:18.4198 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b98522e-7190-44d4-90c7-08ddfa0b1c6d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS3PEPF000099D8.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8125
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



On 2025-09-18 04:33, Tseng, Chuan Yu (Max) wrote:
> [AMD Official Use Only - AMD Internal Distribution Only]
> 
> On 9/16/25 4:56 PM, Xaver Hugl wrote:
>> Am Mo., 15. Sept. 2025 um 17:49 Uhr schrieb Michel Dänzer
>> <michel.daenzer@mailbox.org>:
>>> On 15.09.25 17:37, Derek Foreman wrote:
>>>> On 9/15/25 5:01 AM, Michel Dänzer wrote:
>>>>> On 12.09.25 15:45, Derek Foreman wrote:
>>>>>> On 9/12/25 2:33 AM, Chuanyu Tseng wrote:
>>>>>>> Introduce a DRM interface for DRM clients to further restrict the
>>>>>>> VRR Range within the panel supported VRR range on a per-commit
>>>>>>> basis.
>>>>>>>
>>>>>>> The goal is to give DRM client the ability to do frame-doubling/
>>>>>>> ramping themselves, or to set lower static refresh rates for
>>>>>>> power savings.
>>>>>> I'm interested in limiting the range of VRR to enable HDMI's QMS/CinemaVRR features - ie: switching to a fixed rate for media playback without incurring screen blackouts/resyncs/"bonks" during the switch.
>>>>>>
>>>>>> I could see using an interface such as this to do the frame rate limiting, by setting the lower and upper bounds both to a media file's framerate. However for that use case it's not precise enough, as video may have a rate like 23.9760239... FPS.
>>>>>>
>>>>>> Would it be better to expose the limits as a numerator/denominator pair so a rate can be something like 24000/1001fps?
>>>>> I was thinking the properties could allow directly specifying the minimum and maximum number of total scanlines per refresh cycle, based on the assumption the driver needs to program something along those lines.
>>>> Surprisingly, this would also not be precise enough for exact media playback, as the exact intended framerate might not result in an integer number of scan lines. When that happens a QMS/CinemaVRR capable HDMI source is expected to periodically post a frame with a single extra scan line to minimize the error.
>>> Interesting, maybe your suggestion of numerator / denominator properties is better then.
>> API wise, I'd much prefer just using nanoseconds instead of two
>> properties that compositors will in practice just use the same way.
> 
>> Yeah, I hear you. Period is generally much nicer than frequency, and every other time I'd unconditionally agree, but QMS is awkward in this regard.
>>
>> The media file I start with will have a fraction specified in integers for the rate, eg: something like 24000/1001 fps. That will map to an index in an array of QMS blessed target framerates (24000/1001, 24, 25, 48/1001, 48...) and the index ends up in a bitfield in the HDMI QMS infoframe. That infoframe also has a bit to indicate that the framerate is currently constant, with constant defined as "constant number of scanlines but may be exactly 1 scanline longer occasionally".
>>
>> In the constant state we'd need to maintain that fixed rate within that constraint, and the integer math to do that needs to start from 24000/1001.
>>
>> So if we used a nanosecond period for the interface, we'd need to take the media file's values and convert them to nanoseconds, then in the kernel convert back to something like milliframes per second (so we could get something near 23976), then look that up in the QMS accepted rates array, have some manner of epsilon to decide if we're close enough to one of them to use it, and then use the integer representation (back to 24000/1001) to setup the scanline temporal dithering algorithm to do the +1 extra line every few frames to hit the exact rate.
>>
>> In effect we'd throw away the precise values we started with and try to reconstruct them later.
>>
>> QMS also has the added strange feature of being able to set a fixed rate below the display's normal VRR minimum, so I'm undecided as to whether this range control interface is an ideal match for setting up QMS anyway, or whether I should propose a separate fixed rate property later. I just don't want to ignore this discussion and show up proposing another non-orthogonal property later.

Static video/desktop frame rates was indeed one of the motivations for proposing this API, so it is worth discussing.

For amdgpu (and I think most HW are like this), hardware VRR granularity is at # of total vertical scanlines (vtotal). So if that isn't precise enough, then the driver will have to do record-keeping to alternate between some vtotal and vtotal+1 to avoid drift.

It's not impossible to do, though I'm not sure at what point the driver is considered to be doing "unexpected adjustments of refresh rate", which was something we were also trying to address with this new API. Today, drivers are free to do unexpected things with the vtotal, such as frame-doubling to handle rates below the supported vrr min, and frame-ramping to prevent panel flicker. We discussed at the display hackfest that this was not something compositors liked, and that compositors would like to handle that themselves.

Now, memory fails me, and I don't remember the exact motivation for why compositors want transparent vrr control. Was it because of unexpected driver-reported vblank timestamps messing with compositor internal record keeping? Or something else entirely?

Another way of putting it: Would the compositor rather:

1. Specify a min_vtotal + 1 == max_vtotal so driver doesn't do any unexpected adjustments out of the specified range, or
2. Specify a min_frame_ns == max_frame_ns (or some other highly-precise unit), and have driver correct for drift by alternating between two vtotals, and hence adjust refresh rate beyond the specified range?

>>
>> Sorry to be speaking in hypotheticals, I do have a working QMS implementation to share soonish, it's just not quite ready for review yet...
> 
> Thanks for the input. For the QMS support, it's related to HDMI 2.1 spec. From my knowledge, it's not open to everyone.
> We might sperate this QMS support into different discussions.
> 
> To support FPS/1.001, I think we can augment 1 more property in this patch, once it's set, we can divide this FPS with 1.001, vise versa.

I think whether we want a separate thing for QMS also depends on what unit we use for specifying the min/max.

Thanks,
Leo

> 
> Thanks,
> --
> Chuanyu.
> 
> 

