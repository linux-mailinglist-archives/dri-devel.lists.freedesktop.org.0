Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7367BA78863
	for <lists+dri-devel@lfdr.de>; Wed,  2 Apr 2025 08:55:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2AAC10E6C0;
	Wed,  2 Apr 2025 06:55:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="jg7hdu3F";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2063.outbound.protection.outlook.com [40.107.243.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B94810E196
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Apr 2025 06:55:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LImXpwi9DhiGzmxi7459/RNAAsIhE6uMx0/pR+hywR3MsUmggk5Ihxx0o5LfrntO23aTwLcGjMaVUdw/lZz+0CLwei6Nwol0Y5UxCv/whN/6tIuq1n/oXknmn+N7A1wEE08b/x1CWTwRciW87ex4n8DiHb33krcVv47nbkgCu3a2BwkC46ajYB4d7yOL+f+v/U2UI+bGK54adYPFXsinq6gAjlkL4pcUSkP58jt6ie3i/DiuLJi33uNc24nyLK5S0FBzsJyUFXrun/qvh2DLQ+YBcC/LL/z8sil8NQN8CVxyijGLNeXpJUE5Auyyl+oKiGiDrvh2VzyDdSro1QEItw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3mZcEHH2DqEa02GY3M32pX5rVocJ1d74cs0948Olvb8=;
 b=J8IyVIC9kg9+x7xgDllIzaJsz7YrO7kRtj4fWUSK8M+4iF08/6IF7AqCIflcuDaxV7RAt9vpo+oagMLGUEdrOMVqU5Ex0TfGB658j5B4UNwgfwuiFwgOkzrG425Jg4s5PIkBvfF4AsI0O/oBgAJOo4td31HJ6Z/mTGWU0cZQCP0Sj1uf7Rs2hJuxXnTWC9l7Ku717v0zcgQoXgPHsLjdcyndilPFmWUdbXshI/p+lDSihrvsLmVJxfqEjKr53Xw1Zqz8/7tPj/KPoArmdsk/cegc3jawOmYMO7aleE0UIDwXUE4U7hpwG1lwLItA6CLWcMJIDVv3p8vRhxpoiSvb/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3mZcEHH2DqEa02GY3M32pX5rVocJ1d74cs0948Olvb8=;
 b=jg7hdu3F2rZHOb2a/MkuWSbGF96K8BXi/6I4JgWg114hXqYokNiOhoOPjniDVrR+TN16utfbIfD2hdMe0RmtNLpzycXGJj4b4yHRJD378fMEWM/zWIIRVxpbe4N4AyEb2B7gR2cMRVQk0sugB//B12IvwO+xqlvJLSrdn8S/Cfc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DS5PPF6BCF148B6.namprd12.prod.outlook.com (2603:10b6:f:fc00::652)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.41; Wed, 2 Apr
 2025 06:55:20 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8534.043; Wed, 2 Apr 2025
 06:55:20 +0000
Message-ID: <b636faa5-ab31-41d6-b957-4dfe89a2b47d@amd.com>
Date: Wed, 2 Apr 2025 08:55:15 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6] drm/syncobj: Extend EXPORT_SYNC_FILE for timeline
 syncobjs
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
Cc: Rob Clark <robdclark@chromium.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK:Keyword:bdma_(?:buf|fence|resv)b"
 <linux-media@vger.kernel.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK:Keyword:bdma_(?:buf|fence|resv)b"
 <linaro-mm-sig@lists.linaro.org>
References: <20250401155758.48855-1-robdclark@gmail.com>
 <CAF6AEGsKbjq_q7ezQTn5vyAF1cjXahgbv84uYK35BJH1KBXSpw@mail.gmail.com>
 <ff614cb7-94ca-4d74-9bbb-f97c95893113@collabora.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <ff614cb7-94ca-4d74-9bbb-f97c95893113@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0285.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e6::19) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DS5PPF6BCF148B6:EE_
X-MS-Office365-Filtering-Correlation-Id: 443945f3-b028-4a7b-cc8f-08dd71b3558d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7416014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eTRwRERxNzJrQlJvamJCbWIzOThISDU2S1g2WVc3OWxRNHE2ZzlEWVNQb0Z4?=
 =?utf-8?B?VDQxZXpVc0xMQmtaRlljeVVQY1B0T3JVUUhYb2NObWkycnRZcC9ocjF3OVFQ?=
 =?utf-8?B?Z3hFQnlwT3Y0emc1MWxhT1pMQ1llY0FHRWI5YXgyZlAxbjJIcnh4NnplUldh?=
 =?utf-8?B?aUxWdDRrZW14c1JFL2cwd1FySGd1ZXgzeE5KTlVpZ2owTWZuek1XQ3F0aG8z?=
 =?utf-8?B?UXl0NE9MMzhUdEU4SEtmcHZBS0t2amVFaEJWWXl5OEczUEJNYXFUaHpseC9w?=
 =?utf-8?B?WGY3aHBJcUhzbDFVbmF4cHlKaHVJcDl6eUtBdU56T3pGTUIyMm5oY2JMVmZG?=
 =?utf-8?B?b0NKR1QreHdlcXJkVldCZVY5dzBJbWVIK2ZaYjhPa1kvaFZva0V4MmxmYXV5?=
 =?utf-8?B?Q01xb1ZGRFFQQ1NzTlpZM0s1bHFLLzBnZ0N5YkZBR1dkQ29Cbk1HTTM0VDA1?=
 =?utf-8?B?MUFJT2RORllPMWRNbHJpWklEQUtXQ0dZdjA0Wm1PNVh0RXlkbjFiOVIrLzhS?=
 =?utf-8?B?K00yY2s3Uk1TWDZLRWNDL1FOUDdrVUhPNmhoVGFYSEkzQ25pR1NlamZyc3hG?=
 =?utf-8?B?VW1nZndUaVRyTVFUVXFUZ3NmOEsvVmFHWFM3dE9wRHpZUkcwU1VMM2tEeE1N?=
 =?utf-8?B?M21uTzk2K05HUXRNek5yWXBOaG1TaHJrbXVSODdlN3VCWG1pNmFPQ2YveGRR?=
 =?utf-8?B?N2NtWldHb3FwcllyMkZ5NHluQkY0TFB5SnNhT1VVbHY5WlYzTXhWVU5VVHBv?=
 =?utf-8?B?b1JYRzBPUnNYUlZhSFBxd0l3aCtyT0lFWklIRytZajkvdkNjbmViSjViUXZF?=
 =?utf-8?B?a1lnK3VqRXJJVGY3ZDE0OWJ4ZTVJaVBJT2w3Nm94R2hDbHJHMm8vZGdpWFhq?=
 =?utf-8?B?dHRKMTc0N3pSVjE1UUE4Vzk1OW94a2F5dmRKck5lTEJnaVVNeDhTR3RwOVVD?=
 =?utf-8?B?eEgxRlZSOENyVXlNMDRlVmhxTWUzY3hWY1pEREFjOTdNanVNZDBUNEdTTGNx?=
 =?utf-8?B?Zi9ja0tneEFwOE5BenB1MlBzRk9TbVlRd1gzdGRJNXZYRmNXVjlLMXN4d0VZ?=
 =?utf-8?B?RkxKRXNjeG0wd3UxMldCWFErbndITG04eE04WHh3dEpyTUp6dGtqRkpxMGp5?=
 =?utf-8?B?Wldwc3B0T1M1aDJGYlNETEI1dGdNcjdocG0yTVU3N3Q2KzlEY3N0VGRzZnBt?=
 =?utf-8?B?VGI1VE1SUkNVVjhaeEI3UVNlWjZMTUlCTHZ4MndpazZNUWFPQlpLNGhOQndV?=
 =?utf-8?B?K3RSM2FRZkcvSzBjUHlwYjAxTmsrZDdyL1dPdHZ3dEJZSG1RQUZJbE1ueU5j?=
 =?utf-8?B?allMSGx5aGtYWUNQMFZ1QWdPd092aWsvUzdXTy85RXZUakY3aXlRcldpZGFv?=
 =?utf-8?B?a25Vd0tSS1k1NDV1RVNHYmEvK0VKbHR1WG9OcVUxR1p5eTArZmFGNUR1ZDg2?=
 =?utf-8?B?cnNpSUxYTnhWNkxNQW5HdHp6Ymo4MXV6Z1JjaS9oeFRNc3RsVWhnSElKZnhn?=
 =?utf-8?B?YkErMlh0QUxzekVwNXR4SlpqdjM4OGhtSFEvcUlKd21NZTBWN1E0UWFNNCtX?=
 =?utf-8?B?NTQwZEJKelBVVTBVQ245YjdPeUUzTDMxNGt4K3VYeFVPUTlFTk5KTTBTNGVk?=
 =?utf-8?B?VmtobzF3eDE2SkVWNEE3UnBPMTdSdjJNWTlhUjBicFRKVjgyVGZwNDdKelJy?=
 =?utf-8?B?RTZVQTZnOU01cDlkc2YvTkd0YzYxMVY5SnZIZU9PWDVSTWZRbEs4RDA0NTQ3?=
 =?utf-8?B?L2Q0aW5oNWVKZTRRSE1SUTl4c2pVUk5xWHJZc0NJYWJJMGJJT3pYUzVnUnJs?=
 =?utf-8?B?dHN4S0R1bEQ3OWZZblhXQT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M2YzNFpYUEJUQURSWXhQcCtzZjB5YmkxeU1tbU8wdGROcUphNVVTKzVGN0lQ?=
 =?utf-8?B?aWh6YWd1UGVBVWY5SUhtbUtQQm1Lek5RMWVlQVBXWVZCTXBMOU1LZDZvZS9s?=
 =?utf-8?B?WExLWksrQUxpUjlWWDdzV3Y5SmZpVUcvNmwxTitrVkFkSGh3elpnTk5GeWxV?=
 =?utf-8?B?OVJEdncxRHhSWXF6Tmx3RGVvVDBOaGNndjNOZFlKUHhrL3VvTXIxQlFXYm5T?=
 =?utf-8?B?a0lEbjQ1cmx4TGprU284SlJiRWJVbHBVbHI0eGZCNzhYNmVoZnpJRzdlWWdI?=
 =?utf-8?B?cWwzWGoyeDVTU1VXeTBxTUdVbTUwOWJDcy91VE02akVCbUNGREk0TzhBNmRs?=
 =?utf-8?B?dlEyOUZ5NU5tYUxNc0dMeWxodmJ0Lzh3OVZNaktJL1JtYXhiMDEzMkVjbjRT?=
 =?utf-8?B?cUNRMjFPc1F6cWhublN4c1JaUENUTGdaTTFPUzFxUEtuNHJycHN6amM3Vk1o?=
 =?utf-8?B?ZmRWNEVyU2JlR1BVdXFlMHNRSm4reWlaSG5QR2NqKzlFQ0c1ZjlybThHcmlO?=
 =?utf-8?B?TWdnb25pK3I5Q3VROWVTVFFVVUw0bENCaDNEcFJwb0ZYejFUVTRWYjVzUHVl?=
 =?utf-8?B?RGNqbWd1VmFBaFlMS0FaOHlNT3ArTVprNnQvYVVMWmZHdzRLN3VzOWJCQVNJ?=
 =?utf-8?B?N2JJY0s0ZE9hK0JqazNNUjZYVHFxNk1IbFpwZnhyaTVUZG03L3Z1VWk0SVpa?=
 =?utf-8?B?T0RMMXJJcitOVXBFaXl2RWZxeTI2VXp1MkxTTDdWdUwyWVdLd2pqeTlGYTlj?=
 =?utf-8?B?bUI3bWJBem40T1RMM1MxSFVtSFJ2RkhNL3BBdE16bFJ5ZE5CQ2VHL0p6eGha?=
 =?utf-8?B?cWdzSkVSSkcrUlVSdVIvbmw5TXgzNjl1a2J1bmpzbGNGOVFnYk1GTmxMZEdz?=
 =?utf-8?B?QnZqajFNSDd0Q2d6VVNBRWlBV1ZQam5BQitMVkxJelpRVXU2dXVGdzNPUERB?=
 =?utf-8?B?czFyREUwUHIydklTaFJpT0d0MVI4ZHdDUDd6R3FkeEtrdFNHclJIZzIyY1ZK?=
 =?utf-8?B?dDFqcFZ0S0xraGtkY3VCUmFyWGJadW1BZG1meGIyQ2tGRkgxVkJMdFFRcFhu?=
 =?utf-8?B?QkREM1JhRyt4QmRrYkFoV214RVpsVzYrL3RHSVF0SlJZdjNYdmdQMkdCRm1D?=
 =?utf-8?B?MU95MXBXSjc4ZzY2cm1IL3RUdVBMRWFYTUZWT2pud3labzZwWllQRElwZGZx?=
 =?utf-8?B?S1ZxWWZLSkdiaEVUc2NGbXVIdXpLYlArdEQzdmpQbExZeHlmckVWcDNWeURJ?=
 =?utf-8?B?Y1V4SktNVHpoK3hPdlhmRFZBMUJsNjhqYUU3ajlSMUNGcEVHOEJvRmNKaEpN?=
 =?utf-8?B?dmw2bWpsZ0h1cy9pQmZIVU5OK3dITVVwRTFDQ3g3U0N1QTR2TFZRRkxoeVNv?=
 =?utf-8?B?SHFyaWxRREhYdktWSHJkbkNSQmlabnNEY2hxK3JjSUU4cmtPY1NQT3hRcnZN?=
 =?utf-8?B?U3hUQ2NuQmVhbk5pUU5EN1RMMHM2a2h1a1VFTmJFaEs2SkdrOXRqTnpWdFg5?=
 =?utf-8?B?SGdlbTMwVFBvOXZlcGZyWURsSGptL0FIc09aU2loaWhIck0zc3dWQnZZamh1?=
 =?utf-8?B?WDVQR1RTMW9GUFkyR3NRQXh0TFNndkRZeVB4MDllL0xhSE9HdzB6ZXc0TEhK?=
 =?utf-8?B?OFpOdVpkcS9yVm4xVDdsL21jN3YwRjQ4N1JVWGNBVkdIR20rQWNLcHpIU3ZW?=
 =?utf-8?B?ZjdzTnhqS3lkZjB1UkRETmFrVkUwbVVJY2ZIaUVzaFR1aGpkUThSRzZNVGsz?=
 =?utf-8?B?R21sRFZwbkhzRHh5WDZocFJoZG9KQU1PaFN5TS90cWZoL21wOWs1eG9WT1dr?=
 =?utf-8?B?NFFEd2cxNW1rRmRSVHFMeElVU1dsaStxbWpZRmdOZkhzUGo5aFIrMTZFcHZF?=
 =?utf-8?B?emNKcXU1aXpuYXk3U3l1QUlVN3lEM3ZqVVpqdHBPaFpPTTlSVlpKcUR6eXBa?=
 =?utf-8?B?clUzNER0U3RjeVFvN0s1NW40aitFWFh2Ui9FN1Uwd1I1d1hSRitRWGErZ1ND?=
 =?utf-8?B?WW1WYVZmZFJYMTBZeXR6K3VpbGdERktubkRmRndmQVpyT1dTRENYRDhuVzB0?=
 =?utf-8?B?Q1JJMUVrMzFYSWpXK2dEWjFIM1lFOTVxZndwNzl5eFVYMXd5MTJzc2EyQ21U?=
 =?utf-8?Q?SvntuFwpOUHP1rHgfYc2XLHhn?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 443945f3-b028-4a7b-cc8f-08dd71b3558d
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2025 06:55:20.7495 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6Pgu1+A0Rv2UTxaoIViXYWMPH7tcC31U1Ta9V8qspe8/3axv1Otkd61i6GP3rnjr
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS5PPF6BCF148B6
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

Am 01.04.25 um 22:46 schrieb Dmitry Osipenko:
> On 4/1/25 23:40, Rob Clark wrote:
>> On Tue, Apr 1, 2025 at 8:58 AM Rob Clark <robdclark@gmail.com> wrote:
>>> From: Rob Clark <robdclark@chromium.org>
>>>
>>> Add support for exporting a dma_fence fd for a specific point on a
>>> timeline.  This is needed for vtest/vpipe[1][2] to implement timeline
>>> syncobj support, as it needs a way to turn a point on a timeline back
>>> into a dma_fence fd.  It also closes an odd omission from the syncobj
>>> UAPI.
>>>
>>> [1] https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/33433
>>> [2] https://gitlab.freedesktop.org/virgl/virglrenderer/-/merge_requests/805
>>>
>>> v2: Add DRM_SYNCOBJ_HANDLE_TO_FD_FLAGS_TIMELINE
>>> v3: Add unstaged uabi header hunk
>>> v4: Also handle IMPORT_SYNC_FILE case
>>> v5: Address comments from Dmitry
>>> v6: checkpatch.pl nits
>>>
>>> Signed-off-by: Rob Clark <robdclark@chromium.org>
>>> Reviewed-by: Christian König <christian.koenig@amd.com>
>>> Reviewed-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
>>> ---
>>>  drivers/gpu/drm/drm_syncobj.c | 47 +++++++++++++++++++++++++++--------
>>>  include/uapi/drm/drm.h        |  4 +++
>>>  2 files changed, 41 insertions(+), 10 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/drm_syncobj.c b/drivers/gpu/drm/drm_syncobj.c
>>> index 4f2ab8a7b50f..636cd83ca29e 100644
>>> --- a/drivers/gpu/drm/drm_syncobj.c
>>> +++ b/drivers/gpu/drm/drm_syncobj.c
>>> @@ -741,7 +741,7 @@ static int drm_syncobj_fd_to_handle(struct drm_file *file_private,
>>>  }
>>>
>>>  static int drm_syncobj_import_sync_file_fence(struct drm_file *file_private,
>>> -                                             int fd, int handle)
>>> +                                             int fd, int handle, u64 point)
>>>  {
>>>         struct dma_fence *fence = sync_file_get_fence(fd);
>>>         struct drm_syncobj *syncobj;
>>> @@ -755,14 +755,24 @@ static int drm_syncobj_import_sync_file_fence(struct drm_file *file_private,
>>>                 return -ENOENT;
>>>         }
>>>
>>> -       drm_syncobj_replace_fence(syncobj, fence);
>>> +       if (point) {
>>> +               struct dma_fence_chain *chain = dma_fence_chain_alloc();
>>> +
>>> +               if (!chain)
>>> +                       return -ENOMEM;
>>> +
>>> +               drm_syncobj_add_point(syncobj, chain, fence, point);
>>> +       } else {
>>> +               drm_syncobj_replace_fence(syncobj, fence);
>>> +       }
>>> +
>>>         dma_fence_put(fence);
>>>         drm_syncobj_put(syncobj);
>>>         return 0;
>>>  }
>>>
>>>  static int drm_syncobj_export_sync_file(struct drm_file *file_private,
>>> -                                       int handle, int *p_fd)
>>> +                                       int handle, u64 point, int *p_fd)
>>>  {
>>>         int ret;
>>>         struct dma_fence *fence;
>>> @@ -772,7 +782,7 @@ static int drm_syncobj_export_sync_file(struct drm_file *file_private,
>>>         if (fd < 0)
>>>                 return fd;
>>>
>>> -       ret = drm_syncobj_find_fence(file_private, handle, 0, 0, &fence);
>>> +       ret = drm_syncobj_find_fence(file_private, handle, point, 0, &fence);
>>>         if (ret)
>>>                 goto err_put_fd;
>>>
>>> @@ -869,6 +879,9 @@ drm_syncobj_handle_to_fd_ioctl(struct drm_device *dev, void *data,
>>>                                    struct drm_file *file_private)
>>>  {
>>>         struct drm_syncobj_handle *args = data;
>>> +       unsigned int valid_flags = DRM_SYNCOBJ_HANDLE_TO_FD_FLAGS_TIMELINE |
>>> +                                  DRM_SYNCOBJ_HANDLE_TO_FD_FLAGS_EXPORT_SYNC_FILE;
>>> +       u64 point = 0;
>>>
>>>         if (!drm_core_check_feature(dev, DRIVER_SYNCOBJ))
>>>                 return -EOPNOTSUPP;
>>> @@ -876,13 +889,18 @@ drm_syncobj_handle_to_fd_ioctl(struct drm_device *dev, void *data,
>>>         if (args->pad)
>>>                 return -EINVAL;
>>>
>>> -       if (args->flags != 0 &&
>>> -           args->flags != DRM_SYNCOBJ_HANDLE_TO_FD_FLAGS_EXPORT_SYNC_FILE)
>>> +       if (args->flags & ~valid_flags)
>>>                 return -EINVAL;
>>>
>>> +       if (args->flags & DRM_SYNCOBJ_HANDLE_TO_FD_FLAGS_TIMELINE)
>>> +               point = args->point;
>>> +
>>>         if (args->flags & DRM_SYNCOBJ_HANDLE_TO_FD_FLAGS_EXPORT_SYNC_FILE)
>>>                 return drm_syncobj_export_sync_file(file_private, args->handle,
>>> -                                                   &args->fd);
>>> +                                                   point, &args->fd);
>>> +
>>> +       if (args->point)
>>> +               return -EINVAL;
>>>
>>>         return drm_syncobj_handle_to_fd(file_private, args->handle,
>>>                                         &args->fd);
>>> @@ -893,6 +911,9 @@ drm_syncobj_fd_to_handle_ioctl(struct drm_device *dev, void *data,
>>>                                    struct drm_file *file_private)
>>>  {
>>>         struct drm_syncobj_handle *args = data;
>>> +       unsigned int valid_flags = DRM_SYNCOBJ_FD_TO_HANDLE_FLAGS_TIMELINE |
>>> +                                  DRM_SYNCOBJ_FD_TO_HANDLE_FLAGS_IMPORT_SYNC_FILE;
>>> +       u64 point = 0;
>>>
>>>         if (!drm_core_check_feature(dev, DRIVER_SYNCOBJ))
>>>                 return -EOPNOTSUPP;
>> oh, I suppose I should add a check for DRIVER_SYNCOBJ_TIMELINE?  I'll
>> send a v7 a bit later
> Christian already applied to misc-test, please rebase and make it as a
> new patch

Yeah, sorry I was a bit to quick obviously.

On the other hand I don't see an immediate need for a check for DRIVER_SYNCOBJ_TIMELINE here.

The functions should work even when the driver doesn't handle timeline syncobj on it's own.

Regards,
Christian.


