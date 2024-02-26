Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E57D6867AF4
	for <lists+dri-devel@lfdr.de>; Mon, 26 Feb 2024 16:59:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11ACF10E074;
	Mon, 26 Feb 2024 15:59:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="yHrrmBlQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2055.outbound.protection.outlook.com [40.107.102.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BCD510E795;
 Mon, 26 Feb 2024 15:59:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mqdr8D3q/eidwwN2SiG3cw2wUk0LnXe9PMnuLh0vGPgC0LGQRndZbM5rAV6mT/zq79XBreDtclyAEtBue2jJBo+Xn7PmMsG/PRMYIq+y4xCniS82Uwnm21PUcJSbhdH+UVUA76GF59ONJgkhvxfyeu9XDarf72XtLe8evpnH051WBEy8GiuP0rC6pveeBbZqTYNEUuqAKGRAePr9uNBos/GRwt4yq4IBmiotHfcCWW1i0Qu/AI+bmU4DUKeB1PyAxmYhz6mfmOhJjBrjb4znmiXlOKGz+31jvFEhJ7/wdvEFTsZ1+YLNP0jLubkDVdSsXr3dSJ5tG+AFVVl5JJEXUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t/Ylj4HiGCYf3ZM8XCXYUJqhyi+rw5beVQEO+OiF9XQ=;
 b=BQDARkf5dTx2u9O6MTjO1LEux4XMz6X++odB+tG3Na1l/XdiOk4kkgwPavx/3WiOzjUlXHotUAZE0JO/gJ1h4KXFr/jL9IlIcR8E3nZ002HMb+l/+eu4OEt6DrdpR/XdSXR3GiU8/ViUdZs3FpXhzd1SFPVrYni6JsD+0aUbSvIF9PLg7vXhMTgJMTUJm9famOL/bF4cnGWHjTRqRaeo6PVtcE9buc2jTuJxFvLTBK8VZJ9DfgfitrwNioODwgPB9cgnG6OhEDgWdgYSgQMk9UPlfqJ+oL81F+aHtxb0MgeUr8V19H0CjJy45W9w1LyFMKdNz1r1ciB3OgxR4LJYYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t/Ylj4HiGCYf3ZM8XCXYUJqhyi+rw5beVQEO+OiF9XQ=;
 b=yHrrmBlQp6cPUToJEmDF5md4zR2RSToHgvJNvLNWYSJdoArZLNwTc0U+jhqjnivovsei94qg4T3OvHzjP8bHw921g44TJcJTI01mWE5+fp/CePr+ArW3CUgNnG1uQ3bxQ0/Sb0vdneAgw20b7ddPsmt0mtykzS7OKqFU7SdLC8k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by LV8PR12MB9334.namprd12.prod.outlook.com (2603:10b6:408:20b::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.33; Mon, 26 Feb
 2024 15:59:01 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::f2b6:1034:76e8:f15a]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::f2b6:1034:76e8:f15a%6]) with mapi id 15.20.7316.031; Mon, 26 Feb 2024
 15:59:00 +0000
Message-ID: <d1528a0e-6dd3-497a-972c-3b86efd46313@amd.com>
Date: Mon, 26 Feb 2024 16:58:55 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] drm/amdgpu: Refuse to create a KMS FB for non-P2P
 exported dma-bufs
Content-Language: en-US
To: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel@daenzer.net>,
 Alex Deucher <alexander.deucher@amd.com>, Xinhui Pan <Xinhui.Pan@amd.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20240222172821.16901-1-michel@daenzer.net>
 <3156ea34-0655-4b0f-9438-9113fb714373@amd.com>
 <2d7632f0-0783-4d82-9d81-dd6bd52d5db6@daenzer.net>
 <84fa5bc1-6b4d-4d82-844a-8070d4bd78eb@amd.com>
 <b08c2c14-5a99-49cf-ba79-b89f86487f15@daenzer.net>
 <7dd49c00-8d5e-4492-801c-f1b6db5e1737@daenzer.net>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <7dd49c00-8d5e-4492-801c-f1b6db5e1737@daenzer.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0140.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:96::6) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|LV8PR12MB9334:EE_
X-MS-Office365-Filtering-Correlation-Id: 9850a671-c688-429e-9f46-08dc36e3d8d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6B0cVkZpFzkZRtLri6AfW/6IvWfBHda98opclMqSd7D0DHK+PnQrkXjSKtG3lkk3r4CFgOKHrTUX09lv8bok5zWnq9ftPXxuyfD3qqFJSjDTOmWoBBH18/80rNHNrr5oOgr79S7YRfxm8VHUaV2MgiJSrBitgmlXCbNgForak9+rXX94F2JXI4AYjXgzL6nW2dR0HmeCqMqhzbZPsIz2zFb2NiwhBhDGL1LCLDJ6eTk2GQhNWdgExH4mgwq8r8wCg0JiHoXKxhhgi/jCaz5QFuh7jiNYFZhAszOcS22b5GOgnYmfPyC3j3sJhE9sWAg4lWTBvW6etFL0F5GsvgrBxWxuECp3RFjsXAFgWVsZyhvoBijkCD99AocbDtDcXRyFCvjgJc1w9QVOoqXYKAaCP7x+a9yHnfLquffRzFlHv6aQ9KsrxuCYLHFgD8/sZv1U/EhVD2WSfbjLmssbHPFYzhG7ZUKh9QtUJM65YASya9zVZrvikxdLSM/qvUTCSGMzlR6czNUMogiO8ADiylIyyxnvHDBsKQXGM8q/1SOMaiAvlIpWhgWsQLvzOGskqVhsKkZ4wwkrwYtjmt468blhbPw+Zaw5B6xyNBI9zIJBlzywQdDlWAK2IxqZ6e2NDylQYYL1H/O7twrqxqGgicX+CA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QnlnSXhaYmIrSGJzOG51Y3ZEdDFIOEJualgwZGd6U0pBNnFZanNsZXBYRzZ5?=
 =?utf-8?B?VmhxajBoU1NPM3JQZXlPYXJGditsdmRxT21HdWhmVnBEOVBCdkswSGJvVUxk?=
 =?utf-8?B?Z2tScUdmMllsOHllcER0Y2FjNTg4cm5qdnNFYW44OURwYmZDRDFYSEwwdmFO?=
 =?utf-8?B?VGFDY0NkdTJjamorekhYc09OQXhzRHVJYXNpSmlkZEJzREF3Z3E5eEQ5R2NO?=
 =?utf-8?B?V2xUQ3BZTVpKZ1laUWs1dk5saVcwSlRWbklFMUd1UDlFSE9BaXBDMGVQYVpp?=
 =?utf-8?B?NUF5ZjNhdGMzVTEyYmJiVHh1U1JBWFNCREkwZERtV1dJQzdvU1cvZmx5Wm1l?=
 =?utf-8?B?dzQycmZXYUl2bFdjVnliYzhSOW9GSjZodVdDUmdwQ0UxVldlY0FIdHBvRHM0?=
 =?utf-8?B?ZUEzY05QbGc1VGd1TkRUY3hUYzlQbm5MUnp2dHkwTUdkbUd5L3I3MjBVZ1Vl?=
 =?utf-8?B?NDMrRk9zOGgvbFJNM2JIQm1iSXhVekxwSzFwQ2szbnR5M0hwQ1RFWC85MGYv?=
 =?utf-8?B?M3o4WHpqZm9mODVTckdscGdLYUlTQ0Y3WW5mQmY4M1FyRW1UQ3h1Njh5Qkxl?=
 =?utf-8?B?QjA3ZkIvWVlHRndzMmNyYVZIaXlBZUpMdmxGQnBHSnB1bGduSStpUktranNm?=
 =?utf-8?B?M2RobnhlWXNlSU1Wb21NRXFoeEh0dGpsUms5R1oyNHFuRlozQ3ByTWk2dE9m?=
 =?utf-8?B?eTc2ZGVmTXY1ZkJtWHBiT3I5SXUrTzhUdDFBQTRvZmdUSkg5R1dxYk91ZjVN?=
 =?utf-8?B?VFpIYkhvUnhOYmQxV0U3UkdjMUd1M2dYYzBGZWJkUTVPOFdJRFRFUFFURmJa?=
 =?utf-8?B?cFJUYU1QODNIWVgycU9CVHdnR3NHclNiWCszdHl5NHJxRFBnQU96UjF4ZlpJ?=
 =?utf-8?B?eGt6bUdmN2krYXFBNlNqbEloQ3JuSWhPV0xMa1REVmtFbU56WGo0dWhEUUhj?=
 =?utf-8?B?K3hhL25XUkIvRjBnd0gvRkhBZlBSOXhyR3M2VDhDWG0zc3RWc01rUS9VaWkx?=
 =?utf-8?B?ZVcyM2V4QTVmWUlVNFlwK1JpNG9vak9zdGdVTmZaTTF5a2lFVlBJbnZYc2JE?=
 =?utf-8?B?ajFMSFE3Y2lvVjFURUFGWk9MWmJhSkhDMGd1WHlSeVdkRnNxMkVQNjdCY3hu?=
 =?utf-8?B?d3lDc1MzSlduandVVllYN1FmU0REc0FNWGhwQkVIeDlFeWJxWE9DbWprNHlS?=
 =?utf-8?B?UEpReWMwWEpMa2ZQUVQ3VGN6akFjMGlJTnZQQm5JdW12dmxhZVg4NmFORTQv?=
 =?utf-8?B?Q1hsZ0JnZ1I1YWpCOEVoSGlxL0Q2dzgzZ0Fhazd5OWVYVG44TzFIOWI1cmky?=
 =?utf-8?B?SkxoeG5ycUxSUDZEVFlGM1FVdit3Zk9pMHgwOXErVTVHT0dYSGpNTng3V2RY?=
 =?utf-8?B?aUJDMFJheEllTEltdnROaDR6aU5GL3BZQkxRWDFuengycjRjS2ZrTSt1d0Ur?=
 =?utf-8?B?Qmxad1hXQTJRaEt1bTJEaXlXYVJZNDA3OXJZYTQ1R0doSy9ZQmxOUWVORVVS?=
 =?utf-8?B?NlhzWXNZbTl5UWxOQm5MMXpHL1BzSWIxTWJKYlRTTjVVd2FVSlU4dWxneDNq?=
 =?utf-8?B?VTVTdTVqcWJIbEFiempFWHZ3UVA1WHc2YXllcU1CS2JtM1owWUVidHZ0aDg4?=
 =?utf-8?B?SCtiZzlvL1o0ZzZ0QzV3UTBTRGlPNW5Xd2gvamRaaXh0MEZ4YjMzOTNsRStZ?=
 =?utf-8?B?SjA0SGxoMEx0dHZ5bHA1dXpGZEVzMWR2dk5ydzg0dTlFdkxJWVI5TVhlckFQ?=
 =?utf-8?B?YUVIbkM1czZLVEZtUHFiQ3Q3ODJaZE40cEpyUWEzR1BxQ2FxN25xbUorVTBL?=
 =?utf-8?B?YVFoRDBIUWxqYjlENjE2WUVDaUtQSWlyTE5TZ2JBQ3BQelNFWDExbWhTMm01?=
 =?utf-8?B?TzN0SG1xSEhRRzAxY3Q4dmw1OHR2QjNjcjQvNmtnMUpqWkxmajZEdHpkMTVS?=
 =?utf-8?B?ZDNQaU9GWE1tSzNraEdFVmVWVncvWEpRVlUvOFRFQjJSY0JRVjVFaW1XR2JT?=
 =?utf-8?B?WFM4ZnMyTXZjMkZRRi96dHV2V0VUbnpjaHlWTXJvMW8xOFZyb0o2c3A4ZEox?=
 =?utf-8?B?UklIWjl5WkswMmh1UDl6WjJWL2dHZmdmZVlDbndzdVYxWk0zTDlqNnliUEVj?=
 =?utf-8?Q?nf6KnxZHnUMGV+Oj81TH++sab?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9850a671-c688-429e-9f46-08dc36e3d8d2
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2024 15:59:00.5420 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ymqopRE38wEsxoa/ns1qiZx3GGTW5U8Bw2KgfkB4nituF14O61w028VXLFydUKnq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9334
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

Am 23.02.24 um 17:43 schrieb Michel Dänzer:
> On 2024-02-23 11:04, Michel Dänzer wrote:
>> On 2024-02-23 10:34, Christian König wrote:
>>> Am 23.02.24 um 09:11 schrieb Michel Dänzer:
>>>> On 2024-02-23 08:06, Christian König wrote:
>>>>> Am 22.02.24 um 18:28 schrieb Michel Dänzer:
>>>>>> From: Michel Dänzer <mdaenzer@redhat.com>
>>>>>>
>>>>>> Pinning the BO storage to VRAM for scanout would make it inaccessible
>>>>>> to non-P2P dma-buf importers.
>>>>> Thinking more about it I don't think we can do this.
>>>>>
>>>>> Using the BO in a ping/pong fashion for scanout and DMA-buf is actually valid, you just can't do both at the same time.
>>>>>
>>>>> And if I'm not completely mistaken we actually have use cases for this at the moment,
>>>> Those use cases don't have P2P & CONFIG_DMABUF_MOVE_NOTIFY?
>>> Nope, we are basically talking about unit tests and examples for inter device operations.
>> Sounds like the "no user-space regressions" rule might not apply then.
> To clarify what I mean by that:
>
> "We can't fix this issue, because it would break some unit tests and examples" is similar to saying "We can't fix this KMS bug, because there are IGT tests expecting the buggy behaviour". In practice, the latter do get fixed, along with the IGT tests.

The problem here is that this is not a bug, but intentional behavior. 
Exporting BOs and using them in scanout in a ping/pong fashion is 
perfectly valid.

We have use cases which depend on this behavior and I'm not going to 
break those to fix your use case.

So as far as I can see this approach here is a no-go.

Regards,
Christian.

