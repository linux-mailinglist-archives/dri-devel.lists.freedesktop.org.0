Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 316B99C3EE8
	for <lists+dri-devel@lfdr.de>; Mon, 11 Nov 2024 13:57:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D66D10E13A;
	Mon, 11 Nov 2024 12:57:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="4QNz6jIw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2049.outbound.protection.outlook.com [40.107.94.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BD0610E13A
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Nov 2024 12:57:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=msexhvzDbAu8v4qo+VFlHwRDqKxSMRYhPMmoUcqBKbmRURGGL1/r3YaHlmGDsnVQ0+MTj+IxJeqp+x5xdtrNi81CxQXs0cdNfig0SuZZ0jSLjsBjf7gHADXlRi4I5j1wtcrOExHmr2aR7i+OwkZJvcux87r3CZnfGpGV2uU7Ta0YgRLtyjYtNa5xV8JINnAHZEhkmC/b2LZg8ptCC4yon0vety2y5dYiXlm8Lp9FVxRQEJvDAMtzeE5gEDmrFPsQfYOoxkAYYHHU46Nzsp6ir+HYn5bJEQ31t3mTBxlaNhAlOL8dk23u+poqRBdauc74h5iW5WjEg7M8jAWFYR/oGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lVIVa3XDgBcc/r6M7NP++XXnHgn3EbCG3teiuB5HwkY=;
 b=f5nRnX1YO6jFtUTzUmYGYSlTwam2XenGcFrGj9eRc9XPcgs2o/2rOecU/Mi4SiTE87ZQoGlE2aqZOQkFmipxj3V6Efd1A+pfeRv27dwcvRFrPS7R+/USl6RMla0mItd8/GKjobooiyhZsIQ8S6yUdCD5rKEf0LRgpT1asfYQljFmxAs6AF7VGTKBuk5KPieN+bUxMVZZk1ZqD4mBL8vHP+THeypvxBQ90e4xsGeInl+oVMd0JBbsb/E1P7fx1z1odb5uYDqNz5AzAnTjg2UybH7xr3oHQ2RQyHyYevZ7F1N9YhPyuQB2ffzKWJlU3R7mC+jTIsfU6H6d5NNc0SoFkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lVIVa3XDgBcc/r6M7NP++XXnHgn3EbCG3teiuB5HwkY=;
 b=4QNz6jIw5QSnhawmKFXt6/HGVfAKCqlPYBi3+LGdLxTmR9mcSCrCk0s95yskrnsUSz4+56VdbwcpYwYrvJ95tJdgg0dBYy+bz9iUdohRAapZM5QhfvHUAThV4i94f8EosIzv6Obc+RI2PmCrTHfDXcReD1XIYSHogU9Zut0e5OM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SN7PR12MB8792.namprd12.prod.outlook.com (2603:10b6:806:341::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.22; Mon, 11 Nov
 2024 12:57:23 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%2]) with mapi id 15.20.8137.022; Mon, 11 Nov 2024
 12:57:23 +0000
Message-ID: <ba1bf723-1f0b-440e-b7eb-87dd94d8aba8@amd.com>
Date: Mon, 11 Nov 2024 13:57:15 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 00/10] drm/panthor: Add user submission
To: Matthew Brost <matthew.brost@intel.com>,
 Simona Vetter <simona.vetter@ffwll.ch>
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>,
 Mihail Atanassov <mihail.atanassov@arm.com>, linux-kernel@vger.kernel.org,
 Liviu Dudau <liviu.dudau@arm.com>, dri-devel@lists.freedesktop.org,
 David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Deucher <alexander.deucher@amd.com>, Xinhui Pan <Xinhui.Pan@amd.com>,
 Shashank Sharma <shashank.sharma@amd.com>,
 Ketil Johnsen <ketil.johnsen@arm.com>, Akash Goel <akash.goel@arm.com>
References: <20240828172605.19176-1-mihail.atanassov@arm.com>
 <c64be651-2f40-4535-a537-b8304e6556ce@amd.com>
 <a3e78bf7-931e-4e49-8933-c3df9a503ffd@arm.com>
 <96ef7ae3-4df1-4859-8672-453055bbfe96@amd.com>
 <Ztd7g4Q8V9lFZ53R@phenom.ffwll.local>
 <090ae980-a944-4c00-a26e-d95434414417@amd.com>
 <80ffea9b-63a6-4ae2-8a32-2db051bd7f28@arm.com>
 <20240904132308.7664902e@collabora.com>
 <a5a53492-9651-403e-b613-91ef0b9e80b6@amd.com>
 <ZvKGzSeA7OT-hZQS@phenom.ffwll.local>
 <Zy6QVH9FpAI32hMz@lstrano-desk.jf.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <Zy6QVH9FpAI32hMz@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0041.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::17) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SN7PR12MB8792:EE_
X-MS-Office365-Filtering-Correlation-Id: 91356e3b-a991-4a0e-57c2-08dd02506282
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Z0tNdDlpTFNQNXM1dkI5L1k4RmhLZjk4cHNpREFYR1BxTE5JaW5qQzc1OVMr?=
 =?utf-8?B?V0NJdTJrblRUZlRKQnBhdlJFV241YXljYWpvQlovRnlmNG9Iek1ZZU9KMUpl?=
 =?utf-8?B?NDRydWhDSHVRaVJxY3hSeGtxZEJVK08zeXdDRWRZWU84NGV6cDAzTzlsZnA1?=
 =?utf-8?B?RWVvZXdaYm5KSHlQOUVQTG1CM0VCQ1dCYVFLSVpncG9VK2dHbU4xUEJneU9M?=
 =?utf-8?B?d2Q1UkRIR2dQZkQ2dmdCVlhvbldjUXFJVVBHM0lDdDZ0TDV3aEkwbk5UZXhN?=
 =?utf-8?B?ZUNqOFAxdXU4NDlSZWhmb2NBQVEyTjh6RTNzbXQxTk5oeUI2L2cwWTNtYnBU?=
 =?utf-8?B?aGFHcGJNaTVCa0xpbEJXdzh0V2lEVnBLZWRieFZwOGM4d1BBQXpyRTVuZC9V?=
 =?utf-8?B?UG9Bejc0bEtHMVY5RXA0dmI4NzkyQ24wVTVNMkhSTGpBdkFLUVdPVjVtNjZt?=
 =?utf-8?B?bm1CcjIvTTdwckF2MnBjdERjU2c2Vk13N3Q1MFF4a2ZQQ09WT3hOV2FOcDZi?=
 =?utf-8?B?Um5DZUpsWjZMYUhOYXVOMG1vaXA0K0ttK2wxcGNYU0N1Vjl6Z1V0WjZPd1BB?=
 =?utf-8?B?d3U2TUNKeDYrNWhjMVVXRXhXejFaTG5sd1A4Ujh6M1ZzcitGMVlrOVJtNjBQ?=
 =?utf-8?B?SkZFQXZseVEvcmpVWkhHZHNYUUVqOXNnS3QvY3JxM1hlTWZmakNPcmxGK3FP?=
 =?utf-8?B?a1BGcnM2aC9QYWNOR21GVm9IYTVHZ0tuUEhPZytiUkxwNDdwaThlOXppVWZw?=
 =?utf-8?B?WkNLN0pqeTErcUZ0Y0F5bnZkU0g4RitBdjg0djRHRCszMkNma3VCc1VtQlAz?=
 =?utf-8?B?ckRrc3FJL1VpR1pySXdrYWVCSzlnM1ZxRmNUK245bG5kN2hRY09VWFZ2MmJh?=
 =?utf-8?B?cWlFRSsraVpWTWFQRU5PcStiM2pMUUlISGtHZHZkanpOUTRhQy9CWFFrTmdJ?=
 =?utf-8?B?WmpscnlIQUJYUW9rWGJOWjlLUmxLOExIT082QkthcTc1TEpYRERhQ28rbmM3?=
 =?utf-8?B?SEhmVnJFd1NlR0Z1NTdMelZlM3daa2l0TTJSSW9aVXFPN2UxYXR6U1BJelJB?=
 =?utf-8?B?QXovc0dlMEhHbjRKSWp6M3J5ejI2aEpoYi9aeGdnWFgwaFNaSU5BOFJTOGdB?=
 =?utf-8?B?SUtsYitHUlVid0RzMUVQR1NhU2ZmbFgrLytjYklnc245MU9SaTBoUFhXWFFJ?=
 =?utf-8?B?d3BKaHlXMXVjV1hlMmErR29mWUt6OVNNNjlZNjBYVXNPbzBHWTZjM2RSM0RQ?=
 =?utf-8?B?S1NYVmZSaGhSNWdvd1VGNlp1SlFmV0F4MGtkeVVlb1d2MFc3TDRvZFRXTVhm?=
 =?utf-8?B?dHBZb1c5UVdQbnlVNWM4blU5SExDN0UwSXdIS2Y0a0ZkRE5PQ1Vob2llY2Fh?=
 =?utf-8?B?SGNQVUh1NGxUSFhUemwzUk5XWXZUL0xScXhsU0FEamdrRFVjUmlHYXovQWVi?=
 =?utf-8?B?TXkvS2JaY29jSmxZMjJtbFIvQlRjeHBjMndhU0hnTGdNSUMrbkNKVXpPd0RT?=
 =?utf-8?B?dWxRTEVCdHIvM0RwQTQyT2dnVjdxVzFwTWdTWjc4c2JXTVUvU0F4VHRLR1Fn?=
 =?utf-8?B?TUlVdFU3Mnc0MUhUVmRBOVdXSUVrd0VaaE14dVRZWEUrL1RGLzdZTDQvbTNq?=
 =?utf-8?B?T3JxOGlsb09GTlpxcXRmb1o0SHI2a25JdVlMeUJSVDNQMkw2SXVqTXl0WSsz?=
 =?utf-8?Q?Ju+NL/kahN6okquRjquD?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bGFCTFpBR0ZJbVlmK3RlbWYrRFRjQ21BeldIYVc0ek43RXozSGhPOVBnUG02?=
 =?utf-8?B?WGdkTlgwMi95WGtTVWJGRjVKYmlWeFkwWW5JeEgrNXdzOEh5aEVGcXJlS0N1?=
 =?utf-8?B?eWlSSm1FZ3hDdndHTCtXRlJtQzRucndvZStOVmJkbUFzRmJxSm1OTjZ2NE1m?=
 =?utf-8?B?aUU5VkppS0hTRnc0T0dsdXNUWTN2U09BbXBpY2twU25jZW9GenFMYnVQbHQr?=
 =?utf-8?B?Wm1rbTF6UHNSZjRRNGdpakYwbkltZzIyZUQ2ajV4d3Z4d1FwMXlOc2xRN3M5?=
 =?utf-8?B?V0dOejNEanU1cFd1VVMxemkzcytxd1BPRTNPOGN1R0NBNHJoKzhZQTN1R1B1?=
 =?utf-8?B?aFhYUHMxazBIdVdwMUE5QTBMTVlmS2hwT3BxUWRTSU5tcHVla2ZnQjRSZ2Zv?=
 =?utf-8?B?aTF2TTI1RithQWlVYWJDRHRtblk5dnh2RUZOTDQrT245bXFLcStjMmFwNnRl?=
 =?utf-8?B?TkJiTHRHZlBvdlNVK3BxRVBaVVEzWUUrdGFxQjhNQTJqMHpwdWlhVnFLQXQw?=
 =?utf-8?B?Um5uNXBtV2hISVVkamk0c1ZGSlVkenk3N05WM2VYRFFCSE1ZMVVxRDlQQS9y?=
 =?utf-8?B?WHZ1ZG9rR3RWcWt1bVdlTmJlUzBGbkJ2S2RPQjNzYVlERUk1QjlRTFZBWjZS?=
 =?utf-8?B?QjRJbEllNjhjMEh2YlIrcDNsVld1ZVU2MittRWxRc01QQ2huaVBBOFpjZmxl?=
 =?utf-8?B?S2FHRVNDdit0OHZ2QThicjd4RGVXRDlTNEtaS0FVaVZ5M3VJOEI3VjVnWWkr?=
 =?utf-8?B?bTNQOHBoS1gvMjdMcWxhQWo0YWlWdThkMUhJb0VPOVNpQk4vOEhrdTJlZE1I?=
 =?utf-8?B?R0Z4MjUvME9Zc0NXanRlY2JHUDJZb1VFNFI1VjhXaGRFUmM2N0xxWkkrbG1t?=
 =?utf-8?B?MkZyVXdMM283KzRZYm41cVF0akN5Ym0zNHhyRE9lR3gwWTVHZms3cTFjM0tv?=
 =?utf-8?B?VUM1dk9DOS9LMXJLYlJwK0JCSEhwcHc2TUZwZGYrQWtveWd1MVZoMkN0NU9i?=
 =?utf-8?B?WVdXNGJabzhNdHNPZUo1UzBHdW5KRy9BOUh3ei9tUU04TFlxYi9sbCtQU3Fx?=
 =?utf-8?B?N3g5cEJwQTR0SmRjNjI5RnRhVjlOc0VxaXRTMzF4bW1LSC9GR0ZyWC9XdVEz?=
 =?utf-8?B?UjhCakZnNExseExqMG9DbkdTRGZaUllhUkJyNGFTVktQcjg0cStoL0drdXNn?=
 =?utf-8?B?dnBaclhWbnpLbGVxNVFScWF0Vlk4Y1RqdDNYRUNuYm5vWFZFVnIwMlVzVGVl?=
 =?utf-8?B?UVVob3JsLytzQ0FyRzJmKyt1ODVOTUh1VTk2Q3djVVU5dUVPTGFQd1g0UXc1?=
 =?utf-8?B?SVpXM0pEQ0VnVFNvS3F0L2Jpa0U5aFZldFJ3bHJTSzdvK1ZTTnROQjdPWjYv?=
 =?utf-8?B?QU5JMURUUGxHVDdDQStMclVlTXRXTkl2LzdRaytXR3lNeTdIZDF1cnhJOGJH?=
 =?utf-8?B?ZmRJKy9tZEtaZGQrSTk1OVo2WHd1RG1lTUtUbGxVcGpGWUdRd2J2cnpxQWZO?=
 =?utf-8?B?RWF2cFFQS3JLZThlMytldi9wbE9ONHJJQzBlRThnaThwL3hSUlVobkk0YU1D?=
 =?utf-8?B?S3FsWlVMRXZTUmlwcmZTYUp1djk0Snk3RWxOT1FBM3RqTWVVRGo1QTJhYXZL?=
 =?utf-8?B?Tk5NbE1ZbWpnUzI3bmI4T2xGMWFJcEFBNU41VlFob1B5V1hZVDZLQS9YTnhM?=
 =?utf-8?B?OUJYYWNTWVU5VCtTNjRhRE9oWkh4Ykl0M1VOZjFlTDZVME42TmYxVXlzMzZO?=
 =?utf-8?B?SzFOemdPeXJSb2c5RW14ZGtPY3h1TlpGOG1UaWg3WlhkdVNrdHdSclEzVk9u?=
 =?utf-8?B?RGpmNm9jVGUwWTdTWlhLWGlOZEdjeDY3MTdzUWk4Sk1tS0FzaVBkR21EMGNM?=
 =?utf-8?B?b1NlVURyQVRBcXJqemtWeG0rVytES01OOGZCNERjZlBidTZUSHd6NUF3QXhB?=
 =?utf-8?B?M0Q4aVVLb1A5TXh2azlPVndxdVVIdmJkcnh1ME0vay9jRHYzNTBTb3hpa0pj?=
 =?utf-8?B?NEF1UERhb3Q2VU5uUnIrZFZHVUNjVEpDc1I0ZG9tNWpCWUc0SjBsZzFIdGY1?=
 =?utf-8?B?SjN3QjdhcDEyVEZtbklTWU96a3Npc2NDUHdQYmpVUEVNaEVNSm82U3BORkhZ?=
 =?utf-8?Q?AuLI=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 91356e3b-a991-4a0e-57c2-08dd02506282
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2024 12:57:23.2414 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 78MmkTKvs+Nh7Mo0TXF5A9YLFXpIIVuXlKx0V8Se+p47OgWQaam9djbD/VRRApgM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8792
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

Am 08.11.24 um 23:27 schrieb Matthew Brost:
> On Tue, Sep 24, 2024 at 11:30:53AM +0200, Simona Vetter wrote:
>> Apologies for the late reply ...
>>
> Also late reply, just read this.
>
>> On Wed, Sep 04, 2024 at 01:34:18PM +0200, Christian König wrote:
>>> Hi Boris,
>>>
>>> Am 04.09.24 um 13:23 schrieb Boris Brezillon:
>>>>>>>> Please read up here on why that stuff isn't allowed:
>>>>>>>> https://www.kernel.org/doc/html/latest/driver-api/dma-buf.html#indefinite-dma-fences
>>>>>>> panthor doesn't yet have a shrinker, so all memory is pinned, which means
>>>>>>> memory management easy mode.
>>>>>> Ok, that at least makes things work for the moment.
>>>>> Ah, perhaps this should have been spelt out more clearly ;)
>>>>>
>>>>> The VM_BIND mechanism that's already in place jumps through some hoops
>>>>> to ensure that memory is preallocated when the memory operations are
>>>>> enqueued. So any memory required should have been allocated before any
>>>>> sync object is returned. We're aware of the issue with memory
>>>>> allocations on the signalling path and trying to ensure that we don't
>>>>> have that.
>>>>>
>>>>> I'm hoping that we don't need a shrinker which deals with (active) GPU
>>>>> memory with our design.
>>>> That's actually what we were planning to do: the panthor shrinker was
>>>> about to rely on fences attached to GEM objects to know if it can
>>>> reclaim the memory. This design relies on each job attaching its fence
>>>> to the GEM mapped to the VM at the time the job is submitted, such that
>>>> memory that's in-use or about-to-be-used doesn't vanish before the GPU
>>>> is done.
>>> Yeah and exactly that doesn't work any more when you are using user queues,
>>> because the kernel has no opportunity to attach a fence for each submission.
>>>
>>>>> Memory which user space thinks the GPU might
>>>>> need should be pinned before the GPU work is submitted. APIs which
>>>>> require any form of 'paging in' of data would need to be implemented by
>>>>> the GPU work completing and being resubmitted by user space after the
>>>>> memory changes (i.e. there could be a DMA fence pending on the GPU work).
>>>> Hard pinning memory could work (ioctl() around gem_pin/unpin()), but
>>>> that means we can't really transparently swap out GPU memory, or we
>>>> have to constantly pin/unpin around each job, which means even more
>>>> ioctl()s than we have now. Another option would be to add the XGS fence
>>>> to the BOs attached to the VM, assuming it's created before the job
>>>> submission itself, but you're no longer reducing the number of user <->
>>>> kernel round trips if you do that, because you now have to create an
>>>> XSG job for each submission, so you basically get back to one ioctl()
>>>> per submission.
>>> For AMDGPU we are currently working on the following solution with memory
>>> management and user queues:
>>>
>>> 1. User queues are created through an kernel IOCTL, submissions work by
>>> writing into a ring buffer and ringing a doorbell.
>>>
>>> 2. Each queue can request the kernel to create fences for the currently
>>> pushed work for a queues which can then be attached to BOs, syncobjs,
>>> syncfiles etc...
>>>
>>> 3. Additional to that we have and eviction/preemption fence attached to all
>>> BOs, page tables, whatever resources we need.
>>>
>>> 4. When this eviction fences are requested to signal they first wait for all
>>> submission fences and then suspend the user queues and block creating new
>>> submission fences until the queues are restarted again.
>> Yup this works, at least when I play it out in my head.
>>
> I just started experimenting with user submission in Xe last week and
> ended up landing on a different PoC, blissfully unaware future fences /
> Mesa submit thread. However, after Sima filled me in, I’ve essentially
> landed on exactly what Christian is describing in Xe. I haven’t coded it
> yet, but have the design in my head.

Sounds like going over that design again and again was good invested time.

And yeah we have it working and at least so far it really looks like it 
works.

> I also generally agree with Sima’s comments about having a somewhat
> generic preempt fence (Christian refers to this as an eviction fence)
> as well.

Well that is really a bike-sheet.

I don't care if we call it preempt fence or eviction fence as long as 
everybody understands what that thing is supposed to do.

Probably something we should document.

> Additionally, I’m thinking it might be beneficial for us to add a new
> 'preempt' dma-resv slot to track these, which would make it easier to
> enforce the ordering of submission fence signaling before preempt
> fences.

That's exactly what DMA_RESV_USAGE_BOOKKEEP is good for.

And yes, I spend really *a lot of time* planning this :)

> Depending on bandwidth, I may post an RFC to the list soon. I’ll also
> gauge the interest and bandwidth from our Mesa team to begin UMD work.

Please loop me in as well.

Regards,
Christian.

>
> Matt
>
>> Note that the completion fence is only deadlock free if userspace is
>> really, really careful. Which in practice means you need the very
>> carefully constructed rules for e.g. vulkan winsys fences, otherwise you
>> do indeed deadlock.
>>
>> But if you keep that promise in mind, then it works, and step 2 is
>> entirely option, which means we can start userspace in a pure long-running
>> compute mode where there's only eviction/preemption fences. And then if
>> userspace needs a vulkan winsys fence, we can create that with step 2 as
>> needed.
>>
>> But the important part is that you need really strict rules on userspace
>> for when step 2 is ok and won't result in deadlocks. And those rules are
>> uapi, which is why I think doing this in panthor without the shrinker and
>> eviction fences (i.e. steps 3&4 above) is a very bad mistake.
>>
>>> This way you can still do your memory management inside the kernel (e.g.
>>> move BOs from local to system memory) or even completely suspend and resume
>>> applications without their interaction, but as Sima said it is just horrible
>>> complicated to get right.
>>>
>>> We have been working on this for like two years now and it still could be
>>> that we missed something since it is not in production testing yet.
>> Ack.
>> -Sima
>> -- 
>> Simona Vetter
>> Software Engineer, Intel Corporation
>> http://blog.ffwll.ch

