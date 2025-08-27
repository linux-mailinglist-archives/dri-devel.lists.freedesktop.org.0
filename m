Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46C49B37FF8
	for <lists+dri-devel@lfdr.de>; Wed, 27 Aug 2025 12:36:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 431AD10E794;
	Wed, 27 Aug 2025 10:36:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="pERoE0+A";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2071.outbound.protection.outlook.com [40.107.94.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9A1010E794
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Aug 2025 10:36:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x5vNc23RFT3YxJOPEqPwoda6whSbDu5frEWKivdIqmX6k/Hpdazjx5x+esEEm2wYqMoXBPljjnIbH20MdeGLHMZCRvncfGh425Q/VvhJn19Gz9r+CAnosUhlWqTe7HsWbxsrYSo2unFndspA0EnNpB1TY5ZA2Xpk0YNP48zNx1wkEOGORSB6kwMtlqwm2V0gNsXHTjjoyP1AMegVbgLCJMH/Wr4SMHirSuXrnOqeFi3rFHFtORp8kDvfWficH5jIT+dJpFA9kvw9iZWYoXyz2pbbCqZKVpESwWJ2e2/8FLrd493at+wcyih7+dGvolCFhAY+oKEhqyIVVMm/le0QCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XbWnWaP26o510QCIdpz3sbDYNOxqn/n1aHQzouv6C5g=;
 b=DRivUxyHHVuBRGxXV2rCeAxSiKt8dCHlBJSib/kUhL8pIQMHr4f99d1OkGocbOS5XFlPbK8Hw+0OQTBXZRqj9Wf8Jjr9JtMZOBKL+5mqL7LD8XcSVZfJnkjMHhTQ6Vh12e5Tgta0iPWqHRJ3npPLnLr3kBdZJmEKyazCBlxnK1Q9+/0GZ/muxXCLEC+iFSJeveiyz4MuB/2YI1F+xG5HB1cy4vmXVH15EJTWSLu9LA8uCzOE/SZyAiGnhkwknJdi4Zmjp9L9e9nGvYFlBrm42FdPugJG61aV/wly914sTD6PhkeRXBK3Ktzp8LojG4R/m+Pkd85cmWJ3cFfeld8sjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XbWnWaP26o510QCIdpz3sbDYNOxqn/n1aHQzouv6C5g=;
 b=pERoE0+AKuPfzRF/D98DWi4sQkukVaqxhZJ6pCMlua2QV9q+2V2RjP2GqWhcsEpPIfmFqYrZ3qNNLFezMJVY+vys69s2gi1Qf7IZeP7m0DsAS1DqYAweBIiHu/rGytgVWUwyXZFTWxZEBbrm2xXuCmtnJq9cLroJaNiGHTK8l47VW6v0ZXCPVwvLFS+rRGp8RtBPbPwNxTip7BinC2bI6y7DgA1mt3k1PQy3R5efvrDh6p3f0lTkDio4DaTYztGQt5xxQMauh55tvWTPRtmaVUXDW03HyD58Jhv7rk2t4ts/e40sQuuInRULx3uOaxJx1T5yLJhZRis0MezwjKJ7pg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB6494.namprd12.prod.outlook.com (2603:10b6:8:ba::19) by
 DS0PR12MB8576.namprd12.prod.outlook.com (2603:10b6:8:165::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9052.20; Wed, 27 Aug 2025 10:36:44 +0000
Received: from DM4PR12MB6494.namprd12.prod.outlook.com
 ([fe80::346b:2daf:d648:2e11]) by DM4PR12MB6494.namprd12.prod.outlook.com
 ([fe80::346b:2daf:d648:2e11%6]) with mapi id 15.20.9052.019; Wed, 27 Aug 2025
 10:36:44 +0000
From: Mikko Perttunen <mperttunen@nvidia.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Thierry Reding <treding@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 Sowjanya Komatineni <skomatineni@nvidia.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 Prashant Gaikwad <pgaikwad@nvidia.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dmitry Osipenko <digetx@gmail.com>,
 Charan Pedumuru <charan.pedumuru@gmail.com>, Svyatoslav <clamor95@gmail.com>
Cc: linux-media@vger.kernel.org, linux-tegra@vger.kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-staging@lists.linux.dev
Subject: Re: [PATCH v1 01/19] clk: tegra: init CSUS clock for Tegra20 and
 Tegra30
Date: Wed, 27 Aug 2025 19:36:40 +0900
Message-ID: <14287352.RDIVbhacDa@senjougahara>
In-Reply-To: <76B1EB6D-B149-43C2-AA56-A15C9DCCA3AF@gmail.com>
References: <20250819121631.84280-1-clamor95@gmail.com>
 <1909286.atdPhlSkOF@senjougahara>
 <76B1EB6D-B149-43C2-AA56-A15C9DCCA3AF@gmail.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-ClientProxiedBy: TYCP286CA0348.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:7c::11) To DM4PR12MB6494.namprd12.prod.outlook.com
 (2603:10b6:8:ba::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6494:EE_|DS0PR12MB8576:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f13e27d-91ff-4191-2d44-08dde5559da5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|10070799003|376014|366016|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?emVEUm5PclJwUlZyRE9WTVpTNWJJR2hDdEtuRVcwY1NSU3Y5UHA5YXhETWlJ?=
 =?utf-8?B?WVM5ZldQYU50NGVkc2ordUVyVE1leEkrcFRweUg3L2RiMHVMaWNIdGRHUXFi?=
 =?utf-8?B?UEtsa084U2x3TWYvMW5DRkE5dHVhS3lHOU84ekhtNEtMRTNmVnpXdExPY1Ir?=
 =?utf-8?B?ZjZ6c0x1L0NCT1o4YTYvcEFwck9IdWJEQ0ZjTG1QMkFVTU4yT0tYM0lQYSty?=
 =?utf-8?B?R2l1STUvbExyOERFQVA0UGhlSjBOL0dxNWFWZGdFU3o5MXBwVGg2T0ttdW1J?=
 =?utf-8?B?UTBGc1hNd0tZRGQzWHY1bjRCdVEzbVpicHYwWTk2NFhWZUw3OGgrelk2eHl0?=
 =?utf-8?B?NVMzY3lXZU51T2tndnhBdHVRUzNxeWh5QTkxaGJ3c0JBQUxlSCthWUJ1VFps?=
 =?utf-8?B?Ni9NUURqZThMcncvVUUwbkszd1laVXB2YkVnQWJXMktVdFFTcE1tdEh1azJN?=
 =?utf-8?B?UHNORXRIS2NqUEVodFRxNkdjZlNuMk1uRkRXWlB5eTA4Q2tIZTNKOXlkU3lV?=
 =?utf-8?B?RC9pQkI0UkZZNmFqMTY5L1dEbnVCSnROT0FDZFRmeTk2OVExRE1uMlBlbVJI?=
 =?utf-8?B?V0drdjZjMTBjOEpueWEyUU9CeHZrUmpLQjczanRCRDZRaktyUFJKK0NVNlFL?=
 =?utf-8?B?dmN4bEJZZGlDRDdaVENsYmFHT2FnM3kwTGZmVXlQRTlKQTg3WmhhYXFReDBP?=
 =?utf-8?B?UTh6SFhkTEkzWkdZK2k3Ni9lYlIwNlZoaVcyV1IzWE16TzNjeDdOd0hieFQ5?=
 =?utf-8?B?NHBWMEJFT1lJaDh3SjdydHU4MDRVVmlpZnpoRERBNi8zOUZSY1JvTzY2R1ha?=
 =?utf-8?B?QWsxL1FMbXNuT1RqVlo0d2tYNXgyaFVucnFJWnhQbS93Z0NlNWErdGRuWUFy?=
 =?utf-8?B?VENkdmlmRG9Wc2cyd1d3Z2g4cStrczNYMWp1K1BSL1hTeWEzZDNRVEdJSVJO?=
 =?utf-8?B?SlhXckM1b25FcENxQkkwUStlODlrRmRLLzBVYTRORG5XVktiUitNMXE5TFg1?=
 =?utf-8?B?NGJ4TGU5WHh3czZ6bHNVTy9aZENZcGZkSUNWUzZCdUtFTC9WekJlWGJMSFdJ?=
 =?utf-8?B?RWFmdHZmUElzdFJxYjR5QkdNdTNLOExLWVpsK0R4Q2RnNEVTNCtnRndvbkxU?=
 =?utf-8?B?aXN5RzFUbHdsVzgwMjJVWTFSTTRxSFVJdGxxU0ZpTzBYcGswV2sweEtHdXU4?=
 =?utf-8?B?YnR1ekRzSEVubDZNRitpdnlydE03dmxOLzl3MHozUzRDWHIxbGQ1N0x2YnhI?=
 =?utf-8?B?MUtJMWJLRXpBb2M0SC9tM2VRRzFGOElQUzk3bWlGeVpaTUExVlkzanlXaExN?=
 =?utf-8?B?cTJBRiszVW9DYnE2a2hBb0VEU3ZQcWJ3Z1p3Ujg3UXBJTlpBTi8yeVJlVTk1?=
 =?utf-8?B?TXdTSEdpckMySFhwRE9sMGdqODZVNkNwS2tBenVpWVAxM2tGUG9mZjZPS2Fx?=
 =?utf-8?B?TURqWUp0TjZGbHFMWGhFSWo0a3I0cERURk5IWS9SdVNFVUxvRTNkU2IwblR4?=
 =?utf-8?B?MHBIby9FUlM0TmFGaEtyOUtJR1FhbG5MWkMvVUFPRnkyVmNUMFA2N1k3SDVY?=
 =?utf-8?B?WTAzT2JQMk1Gd3pMaDhOQzM0L3ZTMit3b0hPTDFDQ0RWdktwbmFHWUtyUURh?=
 =?utf-8?B?eHVNU3QxY2Mzdy9zN1hKMmQydG4rWVlja0NTSjlXWWFEd2xxcjJPbGVsYTNi?=
 =?utf-8?B?Q3l3MXZpaWRmbFFzZzdtQWgrWC9UUHRvTDdLREdzVmpEbXpuNFI3WFJFL2xI?=
 =?utf-8?B?d0Y1UkNIakJzK0h3NmE5SUtES1dPbk9TWjJiRTRJOTM1R1JpbUI5R0ZXUll1?=
 =?utf-8?B?VFVtSjZvWVhhTkpXZWpId0dwQk1TQ2wweUFLZUs3bC9XaG5Dd2pCTG04NTJv?=
 =?utf-8?B?UXA2cmN3L3RRT09MaDhWandLOGtlRFBlWFZYSmhFZmt5NFAvQWRBRFpiU1Br?=
 =?utf-8?B?UitOUTZ5c2IyMXl0Z3VwbDdNN09XR04wWldBQVo4Zitncjh5NzFvTjJGbmdI?=
 =?utf-8?B?WnZ4bWQ0dW5nPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB6494.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(10070799003)(376014)(366016)(1800799024)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VVBPbUFqS1BRbWlTRUhnNDFxTkphanZtNHl1dlpqVlUwYU5nSEtseDFhR0Zw?=
 =?utf-8?B?eFJyejlDLzdZVDRrRWlMQnRUa0o4bjVCYU9LL3VYT3ZBWUJsNlMzY0pJblg5?=
 =?utf-8?B?T0NZRERZMVcwckFZRHFoYlEya2tMb2loRXovMG5LTUl0ZzBNRUdZYlRiazlJ?=
 =?utf-8?B?VWV0WDdNRys1RVpud1VxV212SkFGTVZPdW1QRUc4SmVwZlFuTTJXWEx6cjRw?=
 =?utf-8?B?K1UwYk1EeDY1WkZtTEJJb2VIWmVENk5lODFhQzl0MWhodTAzRWNnaFlEck1k?=
 =?utf-8?B?ZFVLNnRWY1N1dU9JeUcveVNLQlhEbXRVWXJRd3A0YjJqWDdxRnQ1UnduMTA1?=
 =?utf-8?B?Sk5lemMrc1ZYUVhXczZkMXU5UzJWZmMwRitrYkRhaXVFRFpRMm1DZW9TQno5?=
 =?utf-8?B?c0UzOGhOS1BKeTgzWG5YTXVTWU54MTdQUjI3QjQ1MWNRZ3dDNHlBYXEwMFMx?=
 =?utf-8?B?TUQwM1g5MGRHSlMvNG5nb1lrbEN1QUY0dCt4VUJ6Q2Q0cnZlQUVuSDhQRlFr?=
 =?utf-8?B?ZmRIVlNzOFo1YytyeU9tOEdFTVN3UzhjOENkQ1Bqby90VHVNa0dYYTNIWVZL?=
 =?utf-8?B?QTJZaWhGek9JaHhHR2hQK3Q1ZE5lZStRY2hYbkoyZ0FyMUpDSEhEL0lQaWhV?=
 =?utf-8?B?NXFNd0JMR2MvWEQ1MWpZTkFobTVKZFVCTmcyZ3NlOVBDSktiYUtUZ05tNWoz?=
 =?utf-8?B?dmt3WElLeUJ5V3MvdGVoOTZNY0pLYWw1Qis5RWY1Y3h3a3ZNSE9jUUUrN1li?=
 =?utf-8?B?c25PZkJoQko5bW81MDc4d3lpTzBEM0xzMFczRUF0M0ljbVNZRXpQUlFDMjJu?=
 =?utf-8?B?RG5WeTRoTDVLZ3I5Y2hSRVJIdHhUa3hhNkZTaWNaTUY5QnVrR1c0REJFUndD?=
 =?utf-8?B?ajhWT2xvaUlwOTNuUU9YVHM2VGQ2U2JBZmd6SkRSd1dHcUU5T0J6dWlDeW5M?=
 =?utf-8?B?M3pVRTRnc2RMUFFxVzJzNzVmZzVmTG1tcTU3UnQyZHBET1BycklDTjJ4QkdB?=
 =?utf-8?B?SVVLSGF2VkIxWEZvZVJxWlM0aDhVb1ZtWDh1dmI0cXdhVnlrbEwzYWhiOTBx?=
 =?utf-8?B?Nnp4dUsyMnJUZUFWMG1Lb0l1WGpzRkI1Mlp0VHZJcVh4Zm56dUlmOGJDSGZm?=
 =?utf-8?B?bXVsUjRDSTFtQklBUkxNTXNoaEI0MnhjMWd0NWxQQWJBY24yUkRNSVR4b2hC?=
 =?utf-8?B?UU83V0ZWbXdNM0dzU0FudkxqeEFNVE5MaXBpcmhSWVNTNmhmSUlTM0xxOFYz?=
 =?utf-8?B?Si9ScXhHUzVFUERmSWwreXhHRXBnY3h3TFlncjJRbm4wbFhMWG15c2RQNzRC?=
 =?utf-8?B?ZTQ2Z0gwMXJ0cE80QUkvUXBxQXBka0V6cnY5QWxoSG0wVWdwRDNJUXdUQTZo?=
 =?utf-8?B?UVdnYzRpZk1zZThqU3RjYnlTVUNlZVNyU2t5U3RNZVh2anU2UXoxbjVyV0Jl?=
 =?utf-8?B?RWFkb1JHd1FzdWlYYmR5cGpjVktVVEFQOTEwVXBXYmxWMEt1ZVRQRkFpVTA4?=
 =?utf-8?B?L2VoT01KQ3RzVVM2NVI0cHc4MmpFUFNsU21SMm10RGZleU5oUWUyd0Jqd3Jh?=
 =?utf-8?B?cEFvbHphR3oyeXpzMEFwendDMTB4dWxxMS9LUTB1TFU2eWRWb0F2a0VRV2xw?=
 =?utf-8?B?SC9INzVTL3FaR1c4N21LZEJXcDNrY3V2M0pmYlFNdEJOdXRSWE5qQXNXaTNt?=
 =?utf-8?B?M0dzUFZ1MktYak9SQ0hnelB4UFJRSlJ5Zm45VW9sd2hCR0Vtb21OQjlTbGF6?=
 =?utf-8?B?VVEwWmptS3o4Ky9mWXZPMDFPZ0xLZ2tLeE9NWG1lSlhMd0dsMEVBc2MrVzRV?=
 =?utf-8?B?LzJvVzhJdjZFRGVUc3FGczQ5NzJPVW9UWEE5Vm5hTmF5Q3FNNnhRZ29vVTB0?=
 =?utf-8?B?Vk40YnRObFN4VmtrNTROdm5WeHVmSEFseXpZendxcGpoaWxTUkRGblBlN2Nq?=
 =?utf-8?B?bzkramZBWnVodGRTT1FTM1FkTDQyWk0yaGdyQnV6Nzh1ZGk5T3NqZ0lTbnJU?=
 =?utf-8?B?Z2EzRi92cU5qMVdCeHZGaUk4UWRSMnJoMzVrdnhDYVdNODRJVktkdG11aDQ1?=
 =?utf-8?B?VWNIU1VzSWZFb3lOQmQwRlBFcGNKdWpKV0ZZVkFrL2hmeFJHU1ZrQUNtSXpW?=
 =?utf-8?B?ZkZRa2VoTTlTQysxdlVtSFBvUmZKblRsd0hxbFVMSGJxZ1h6cUlNRmJUNjhO?=
 =?utf-8?B?NjBDc3lQMStrVVFPWTd1MWZrQ3JKbVZTeGNBb0FRNVdoMTErdlNiblFSN2JG?=
 =?utf-8?B?OXgzaFI5bVA4TEdGMzFPREFqMFpnPT0=?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f13e27d-91ff-4191-2d44-08dde5559da5
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6494.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2025 10:36:43.8970 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6y/rU6UL/DeIT1cgjhDmmZgXCPCQdqBqSMNvJPbwqpSegCDv6Bvg++vYO65bSsJAiR6D6uEPYcOqlvxa8SJH9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8576
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

On Wednesday, August 27, 2025 1:32=E2=80=AFPM Svyatoslav wrote:
> 27 =D1=81=D0=B5=D1=80=D0=BF=D0=BD=D1=8F 2025=E2=80=AF=D1=80. 07:09:45 GMT=
+03:00, Mikko Perttunen=20
<mperttunen@nvidia.com> =D0=BF=D0=B8=D1=88=D0=B5:
> >On Tuesday, August 19, 2025 9:16=E2=80=AFPM Svyatoslav Ryhel wrote:
> >> CSUS clock is required to be enabled on camera device configuration or
> >> else camera module refuses to initiate properly.
> >>=20
> >> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> >> ---
> >>=20
> >>  drivers/clk/tegra/clk-tegra20.c | 1 +
> >>  drivers/clk/tegra/clk-tegra30.c | 1 +
> >>  2 files changed, 2 insertions(+)
> >>=20
> >> diff --git a/drivers/clk/tegra/clk-tegra20.c
> >> b/drivers/clk/tegra/clk-tegra20.c index 551ef0cf0c9a..42f8150c6110 100=
644
> >> --- a/drivers/clk/tegra/clk-tegra20.c
> >> +++ b/drivers/clk/tegra/clk-tegra20.c
> >> @@ -1043,6 +1043,7 @@ static struct tegra_clk_init_table init_table[] =
=3D {
> >>=20
> >>  	{ TEGRA20_CLK_GR3D, TEGRA20_CLK_PLL_C, 300000000, 0 },
> >>  	{ TEGRA20_CLK_VDE, TEGRA20_CLK_PLL_C, 300000000, 0 },
> >>  	{ TEGRA20_CLK_PWM, TEGRA20_CLK_PLL_P, 48000000, 0 },
> >>=20
> >> +	{ TEGRA20_CLK_CSUS, TEGRA20_CLK_CLK_MAX, 6000000, 1 },
> >>=20
> >>  	/* must be the last entry */
> >>  	{ TEGRA20_CLK_CLK_MAX, TEGRA20_CLK_CLK_MAX, 0, 0 },
> >> =20
> >>  };
> >>=20
> >> diff --git a/drivers/clk/tegra/clk-tegra30.c
> >> b/drivers/clk/tegra/clk-tegra30.c index 82a8cb9545eb..70e85e2949e0 100=
644
> >> --- a/drivers/clk/tegra/clk-tegra30.c
> >> +++ b/drivers/clk/tegra/clk-tegra30.c
> >> @@ -1237,6 +1237,7 @@ static struct tegra_clk_init_table init_table[] =
=3D {
> >>=20
> >>  	{ TEGRA30_CLK_HDA, TEGRA30_CLK_PLL_P, 102000000, 0 },
> >>  	{ TEGRA30_CLK_HDA2CODEC_2X, TEGRA30_CLK_PLL_P, 48000000, 0 },
> >>  	{ TEGRA30_CLK_PWM, TEGRA30_CLK_PLL_P, 48000000, 0 },
> >>=20
> >> +	{ TEGRA30_CLK_CSUS, TEGRA30_CLK_CLK_MAX, 6000000, 1 },
> >>=20
> >>  	/* must be the last entry */
> >>  	{ TEGRA30_CLK_CLK_MAX, TEGRA30_CLK_CLK_MAX, 0, 0 },
> >> =20
> >>  };
> >
> >I looked into what this clock does and it seems to be a gate for the CSU=
S
> >pin, which provides an output clock for camera sensors (VI MCLK). Defaul=
t
> >source seems to be PLLC_OUT1. It would be good to note that on the commi=
t
> >message, as I can't find any documentation about the CSUS clock elsewher=
e.
> >
> >What is the 6MHz rate based on?
>=20
> 6mhz is the statistic value which I was not able to alter while testing. =
I
> have tried 12mhz and 24mhz too but it remained 6mhz, so I left it 6mhz.
> >Since this seems to be a clock consumed by the sensor, it seems to me th=
at
> >rather than making it always on, we could point to it in the sensor's
> >device tree entry.
>=20
> Sensor device tree uses vi_sensor as clocks source and sensor drivers don=
't
> support multiple linked clocks.

AIUI vi_sensor is an internal clock so the sensor cannot be receiving it=20
directly. Perhaps the sensor is actually connected to csus, and the reason =
we=20
need to enable it is to allow the vi_sensor clock to pass through the csus=
=20
gate?

That leaves the question of why the csus pad would be muxed to vi_sensor by=
=20
default, but perhaps there's an explanation for that.

> >Cheers,
> >Mikko




