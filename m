Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0390C8B0AF5
	for <lists+dri-devel@lfdr.de>; Wed, 24 Apr 2024 15:33:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A62E710FEBD;
	Wed, 24 Apr 2024 13:33:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="nl/VSDPg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2040.outbound.protection.outlook.com [40.107.220.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 008A410FEB6;
 Wed, 24 Apr 2024 13:33:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BbJzG0nqHuVokfm6pup3OVfHmVexWCy+MtDQYmZd9heRRHgAxl1WGuZ1DDefzKOknIbqENTMyt8XfX2esh3zmNO4D89a8cQrvhnu5rakVumyn2lQnu6bAwmp3lnm5reUBFd6E51uidBLSmkUTKfTz4ioPE7GqPbdIYgNMkTYGn1B2QnUiv0kFmbacLmBVTAmOocdcyD5aAzlzkWc+nt4WRQGEg6Ekz8k/IIeDEa2VMX0o0bpL7HGHjdTwcgVzZCC8oGDDybm6TQjk+YoOE5kRAPw53NLhTFwb14Eh6SobWn6hDPNl0W8eyuNXv0DFguNRqj36bNCzVmCU+w1+3TRAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BwzBEQ5cgCdObhnRlC3Cv9C0IpkpeTUieLBx9t19nbE=;
 b=BgXGeqgvLyy+RC86ASmpuc9auJZLX4D3r/SvMh7t6ycT972jnopsWBLsDYKwrHT07hNFcBMRF0hGInRrQSMoxG2QwXrFzVUDllv76+JwGTuF5Gw+9kF6egGe239h96wXBT3d/V5MJ8L9aQIvkd8zudSdDwQ0GReX8fRopAQu4m+E4RdZZxYH7WQlJO21d51PO1EajAu3kyx5Mzv6rLeDOlsLFZxUZEEzTTobBQ/yvI7QY+aIvKRxuIeuoQesdCtYboU0ypoay5DnSlFLAiJiS7LcBmqWT1bHjGrKcJiZWEWv7oXnfxAxN057ZBZkAI5iQ3JqZmBVeo6ohweq1ywXpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BwzBEQ5cgCdObhnRlC3Cv9C0IpkpeTUieLBx9t19nbE=;
 b=nl/VSDPgVJjmgftJGzLvId0Tx/ftul8yhm5fnRJOtOsUC2KCNNSi1wjQWlIdCb4FAlWr5YWhlw+5leN8P83RFY3HOigIf7XnkJWnd0jh33ctENAFgJ7aWXqwxgV5UA9TkDC1NYTxMrUCQqt4+a/EDZV/2NT99CXajX0ghtEXqIY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by PH7PR12MB7379.namprd12.prod.outlook.com (2603:10b6:510:20e::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.50; Wed, 24 Apr
 2024 13:33:20 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::f2b6:1034:76e8:f15a]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::f2b6:1034:76e8:f15a%6]) with mapi id 15.20.7519.021; Wed, 24 Apr 2024
 13:33:20 +0000
Message-ID: <f3b0e0fe-edb9-420d-b4a1-71c267246875@amd.com>
Date: Wed, 24 Apr 2024 15:33:11 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amd/display: re-indent dc_power_down_on_boot()
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Harry Wentland <harry.wentland@amd.com>,
 Charlene Liu <charlene.liu@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, "Pan, Xinhui"
 <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Alvin Lee <alvin.lee2@amd.com>,
 Wenjing Liu <wenjing.liu@amd.com>, Jun Lei <jun.lei@amd.com>,
 Tom Chung <chiahsuan.chung@amd.com>, Dillon Varone <dillon.varone@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
References: <e5f538ab-ebc8-400b-8104-4642b8089b4f@moroto.mountain>
 <bbc315ed-3482-4abb-b3f6-88c335dcf9d2@amd.com>
 <4a996c51-e101-47a0-8a89-78c6f9f01e0f@moroto.mountain>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <4a996c51-e101-47a0-8a89-78c6f9f01e0f@moroto.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0222.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ac::18) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|PH7PR12MB7379:EE_
X-MS-Office365-Filtering-Correlation-Id: 19a0b861-a2c5-487d-333e-08dc64631aed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?U0RrZFlTUXh0WHd2YkV1LzBvT0tDYUJZUmFkVnVjRXRKT25Wa2tzajRnK2U3?=
 =?utf-8?B?eGhNY2FKR1ZkNzNjbGJsZ2dMalV6dWorazZwRWVpUTdZeHZ1UnZ0aEk4NzZY?=
 =?utf-8?B?WWgvaVNXOXpRNjlENEJJZUcvWFcveXQ2bDJNVnNWVmRIMFhqYUV0T256K1M2?=
 =?utf-8?B?OGJFcXdnUkNLaGk1eDRQeVVvcXVPbEN2RnVqL3NsMUg4NllFWTFkZnMzZU5O?=
 =?utf-8?B?UkNpTnRVc1BFMmtsWFdPZjFLUGlHWnN2MkZBbnIzU0pJSzZ6R2VBRWlXYVFF?=
 =?utf-8?B?ZlcxT3MxRnhsaklRczdzS0E3R002aEo5bkhOYlRBcnd0U0pGVkI0RWZoKzBv?=
 =?utf-8?B?L1B1S1dza05NeTN2bUltTEJYVzBkSjJBNGJWZjNQSW9IR0dtbndhUjNXbXVW?=
 =?utf-8?B?YmsvUHZVRGFMUW9ZQ3Fmdm82Qld2V2tSSkFmNk83NC96RXBxQ0xBOTZOL3pY?=
 =?utf-8?B?TFdRTWNnYllzTWlSUzFmQWNZNEFKd3hFbG5DQTl3WFh4ZUhmNnNLbUpWNWFv?=
 =?utf-8?B?dDVWQjQ3WklsenhWR1V0aTlYOTJaNytWNzNDWVF2aXFYTVMrNHFJNThhU1Ex?=
 =?utf-8?B?SCtHZzF1L0ZOdkZiTVoyMlJuVHNHSkxKYkhqZlFRUXF3WUsvVWx0QXJhV3dX?=
 =?utf-8?B?K3Rmb0U2b1VCTTBFc2pTUkRDaXN6R1JMWlphZUZYbUd0dVJ5RU9yYjVWOHYz?=
 =?utf-8?B?OWNTTlYzK2hBa3d3UVNNR1VRM3FzN2kzdFhsRENEODV1TVNmNmRmTWVtbWkv?=
 =?utf-8?B?aWg1NWdCWkNZVjhGMHFNbEZOa3VqNzlxc1Q4RWc1dHVQclZHZzdmaEtadjQx?=
 =?utf-8?B?cU1xcDd0cmJEeXBUdHZQNnk5UXg3ZG1SNzhpcEplOGNTVlp4aFN0bWNWTE93?=
 =?utf-8?B?ZDZJZmM3bGkyTWVQSHd4NTR0c2sxajlXbUc2Q21CbkVXQ3lZeE9uYTVpb1B0?=
 =?utf-8?B?N1BvZHhiUk5qaFNLc2Nsc1YrYTNpYzFDUjV2N0VYRFJnY0hKUjRqNVRmMFhr?=
 =?utf-8?B?S2xDZ2tFMi9IVVRZaGNteExqazdQbndDSjY2UWtsblRzdkg2Z2N2dTV5L3Bh?=
 =?utf-8?B?Y3lWNWhtL2NaQTQ0dkpnaTlBQ0Z0YS95NWdyWk5CY1NtbGNJWTZaa0JKZEcw?=
 =?utf-8?B?dTlxbituWE1sYVY4NmpwMkxWaVdnTTVvS3BFMExPQWQxc0hVbkU5QUFNVi9l?=
 =?utf-8?B?WmpsK1dBdEVqZVdaWkpYaDMvT1ozRHNTcHlhSzFXYisrck4xTUZGT2dzM1Yv?=
 =?utf-8?B?eVR4dDE0RzRvNTM3OUFJYWQ0dFluRmJuV21HODlCR2NoTXZwbXpsekRGTWo0?=
 =?utf-8?B?d2RlVjZpN0RrZVYzSUhUb2t1S0o3ZDhSbGE0a0lML2xyYUc3Sm5WbmhnQlJC?=
 =?utf-8?B?Z004QUFFL3lIRVRiVDQ1N2hMaGRBa3dlcGdDeHdwMzFvZWM4WUo4RnFRa3d6?=
 =?utf-8?B?dHZVZUZSWkdrYjM1eEtMMFRQS3ZlL0drYmNMdDNPMTM1Q2JSeWhmRWQycm5H?=
 =?utf-8?B?MmlZWndCRUptNHF5SnlQVFVPQXYzYlE2S2JGNUFMeDUzNFpFOWZqYm5iaTFG?=
 =?utf-8?B?THBycWEySWoyVmt1ZE5FMlMrL2EzVFFpNGNra0h1YzkxeG1maXQ4d1lZd0hQ?=
 =?utf-8?B?MlIvL2dVMXVmWEIrem9JQW8vemZqYkZNRzlXQ1FZRHp6bjAxS3BIOS9ldEgr?=
 =?utf-8?B?eGh1QlRDdzB0eCt5YUkrRUNJSkNraHpsTUQ3dnVkSVpPNnlqbDBNV3RRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VnNnUEd3T2t6RXFrckhCc3NlSGNlaDB1TmwrbG4xTHBjcm0wQURNZkNNTmVX?=
 =?utf-8?B?MmdzaUk5aVlvTHZibkM3MVF6TS9wMkxBNjU4Q1p3MG9IV3NVeDZ3ZVpUS0c0?=
 =?utf-8?B?VFpES0VvbE9hdXpUcThJcXNQcnlQeVJRVkdiK09GUFdSLzdPS0svYm1EVUFp?=
 =?utf-8?B?a2dxTmhJZUxyT21tS013YWVXS0VGb3Nub0RFSVZXM1Z4My84cHloYVJCTWd1?=
 =?utf-8?B?b1dFMFZ5MERQenBKSzBmcXY5YWJQVWpwM2lVMG1lQ1p2MG92bER5Q0FSamtr?=
 =?utf-8?B?bkpuMHY5czdOdU93VkZYd2h5UXFwOWFkMWhYKzYrN0ZjL3ZjQmw3cXJFbnQx?=
 =?utf-8?B?ZHoyV3JnZ0gxbWJyKzlkOCtzaXBQd3NORWduQnhBeU82UjRRaFJWSFliQVNE?=
 =?utf-8?B?dTc2QU5RamNLU0ZxaFB2QXJBbktVRVN2MzVvNXozUDRlZWhjV3RLNmJlTGpX?=
 =?utf-8?B?dnB6SUwzc3Rad0FVVnBLblZ2emhnTFBEY3d6Wk8wZnN6ek9LOEpqZzQ4ZVpE?=
 =?utf-8?B?b1BpTkxVQkN0bHJaUTEwKzB3dkhaRjJhaHdGV3U4dndRMUFoemNTYjk3QTc1?=
 =?utf-8?B?OC9mVDBIajN5dmtFT1lCbHJ4VDJqNjJqSkJJSEdnV0pIM0xtUkdwYlBIeHJR?=
 =?utf-8?B?NlRLa0VVdmx0TnNyYkNFeWNRWHcvMHRKUHM0RnIvVFlyaHRpQ2lBOVBnenMw?=
 =?utf-8?B?dE1vQThTbWFVLzBrUktHRFpZTStpZ2ZSTkZwU2Y0MWF4RDVaUDE4VnRnZ1JO?=
 =?utf-8?B?dWdVMTZPdG5WNXJYTXBGaVpyS2Y1d0RXYmlQak1abnJsMEFEVWYxVWtJOTBx?=
 =?utf-8?B?WFQvMVViMmJyWVVDRUpvVnVrRUNiN09PU3BzNHJDTDNsOUxSK0I4TXZCS2Vq?=
 =?utf-8?B?b2tCTExWKzBLLzJQMDhlc3FoMVl3ZHhaYS9mWlJVWmlzVUt3VFdjd1dOU21a?=
 =?utf-8?B?cHEybW5Cb2tWMnJFc2xrTzVQa2dhL1NZNTczVWhTUFZhdnlVK0pBWmVMVkJY?=
 =?utf-8?B?L0xpVElPZWduRzdhVjZsOElmRGwyb1d4VGp0N3FOdWZ4Vy9qN2xjcVdjMVhJ?=
 =?utf-8?B?cmxxdkdaNElBLzMySUVKN0ZnSy92K3I5WnRpTlAzUjJ1ZmJwWHQrejRsQUlC?=
 =?utf-8?B?eWJVeWhFbEpma2dyN0lGZ09RMlVkQklPdHVUQkxjQlpiUjBwYnkwOUlMM1N5?=
 =?utf-8?B?ODJYV29qNW9BamMzWDhROVpyZmFuMjQ5bW5HMWdyMUpiVDdEUnNhY1g1TCt6?=
 =?utf-8?B?RjJ6bFhacm5Tb1FaVGhwWmFXUjJnQk5jS1pSa3VERFliQXVlWGhnOE9UQ2gr?=
 =?utf-8?B?MldEaFExMjQ0L3pHTkRraUw1Q1hJcHVHQkJyZDNmOGJzSXVzdXlJdnJHKzBZ?=
 =?utf-8?B?SkQ0UVVPUk1IV1JNbFlyZ3NDSjVOVHU3aUtNV2diVUxOaVQvUW81RXk2d3hm?=
 =?utf-8?B?MHF3cXp3eUw2RFR4bEtIOFZIQjVXZUNtcVh2TFA5dEQ3TTlDdVpIaUx1MDVN?=
 =?utf-8?B?Nnoyam0vUnBKaXMvb00yM05aYzVpMDJmSlgxRFp0RHpkSzNnSWlOUUFUS1BL?=
 =?utf-8?B?ZE02WXZjSWNXZ3BMZzNIeENvdXE1SmVvczZ3TG1xV29ydzB4cUFiVVl3TjF2?=
 =?utf-8?B?Q0lNQSsrb1FqYU1GdGRMSC8yU1YxTjFOQmV0bUM0aVJUNEtGbHlyRCt0Sjcy?=
 =?utf-8?B?NURFa3puR1V6NGhMSC81N2RHbDJ1VDRHdmVzS28renNUWkV2dWhwV1RlR3lB?=
 =?utf-8?B?aTVFeGovamY5R1MycXVyOWVjTXJRNGVWalgxR1hNVE1mZDJRTk9KaGdNcDUy?=
 =?utf-8?B?YU5WcjRKQzg2TjJnZnJGbjZGNFhpbnloMVlTTFJtRmRsVS9qQ2JRVW91SDBC?=
 =?utf-8?B?L1BTYVdVTUxxMXNnNER4dXdlMXBad0VJUFFVN3I0NFFLZUQ2MnFweUU2UU1P?=
 =?utf-8?B?QVJ0d0NaN1BYVG91QzVNRmkrZVl5Zzc3V1VzSW16OU1JRHdnNmlUK004QTg4?=
 =?utf-8?B?WFUzbCtMOXNMeEVpM0w0T0Nic2ZkbFNhWm9JbTAzcUs3UzU2UndCRDEvajVw?=
 =?utf-8?B?WFRFZzU1NlJhekgxOCtrbjVoTFNnRElocGZ0QTZxM1BnUnc2QXoyMHM1QjY2?=
 =?utf-8?Q?ccn/aRsP3C53df8qBQI2X+WGr?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 19a0b861-a2c5-487d-333e-08dc64631aed
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2024 13:33:19.8931 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 164E+vTknOb6sfnLCSFRYaqT/SEr8kw12LXKq2VlL6byiTWOTZF9ghbYXA5qW2A5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7379
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

Am 24.04.24 um 15:20 schrieb Dan Carpenter:
> On Wed, Apr 24, 2024 at 03:11:08PM +0200, Christian König wrote:
>> Am 24.04.24 um 13:41 schrieb Dan Carpenter:
>>> These lines are indented too far.  Clean the whitespace.
>>>
>>> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
>>> ---
>>>    drivers/gpu/drm/amd/display/dc/core/dc.c | 7 +++----
>>>    1 file changed, 3 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/amd/display/dc/core/dc.c b/drivers/gpu/drm/amd/display/dc/core/dc.c
>>> index 8eefba757da4..f64d7229eb6c 100644
>>> --- a/drivers/gpu/drm/amd/display/dc/core/dc.c
>>> +++ b/drivers/gpu/drm/amd/display/dc/core/dc.c
>>> @@ -5043,11 +5043,10 @@ void dc_interrupt_ack(struct dc *dc, enum dc_irq_source src)
>>>    void dc_power_down_on_boot(struct dc *dc)
>>>    {
>>>    	if (dc->ctx->dce_environment != DCE_ENV_VIRTUAL_HW &&
>>> -			dc->hwss.power_down_on_boot) {
>>> -
>>> -			if (dc->caps.ips_support)
>>> -				dc_exit_ips_for_hw_access(dc);
>>> +	    dc->hwss.power_down_on_boot) {
>>> +		if (dc->caps.ips_support)
>>> +			dc_exit_ips_for_hw_access(dc);
>> Well while at it can't the two ifs be merged here?
>>
>> (I don't know this code to well, but it looks like it).
>>
> I'm sorry, I don't see what you're saying.

The indentation was so messed up that I though the call to 
power_down_on_boot() was after both ifs, but it is still inside the first.

So your patch is actually right, sorry for the noise.

Regards,
Christian.

>
> I probably should have deleted the other blank line as well, though.
> It introduces a checkpatch.pl --strict warning.
>
> regards,
> dan carpenter
>

