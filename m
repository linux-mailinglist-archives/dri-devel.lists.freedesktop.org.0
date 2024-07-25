Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A6CF93C122
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jul 2024 13:52:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1ED410E78E;
	Thu, 25 Jul 2024 11:52:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="vYEiypcB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2040.outbound.protection.outlook.com [40.107.95.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0850F10E761
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jul 2024 11:52:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZF8Kmum1DZgn55iU8Wt7/H7s3apNBEU4JcksUExnHaqQVpElM+btHJLUdTaAtFePx5uueaMwdCkqkZIxWTzEgnXpc/pe0URvUUe2vGToHWRp9bzBbqes67IbBBIk6FX/fP8XhjNwnzGYGvr+5SR706/Dvu49uf0VksXTbbg7l08Sangt/2ssGWC1EYrowPifoVZKxwO0yOsWxjNN4oqy1nfF9BUzD2WZZLkgQFXb3qgtOgXvaTl48hxrDHs2u+Ig+3EYmcdBAiIj2x89NY4feKaoxrHg4XkOg70sWdxaH1V7G4NJVZ6A/OzNXHjQPmhN7aORoSTqK7IYeG4tg/jCZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RSs6X33NSanPEP5CCoDKmshOlG10taomX3cw2dErWew=;
 b=LUNFN/g+6vAcrlM1hxxEAtvLg0Wrr5zZEg3yNL1M71egp24k4dIu3tS65Cn5XYe9zTkzkNKBGYK4w6FLu9NGjv8h6j9XBZiN86ZWQZBIqYS3zRbHsu7b2MzDjzwzVx52vzaAthKmfMF0gY7npHTiqocGP75FV/FMKiU6BAfFCUudVai2nqJizRfbybhYdqVzR5fjGxqNKbAodhNPWqeKySD/LvjPoRFYVLmzSQQKuf9CJwAwnvixzyfWUk9qL0A1CHHUmDoy0N/6VDFUOcYaDQrDSb2uYB0l8GrKKsbXQgMlyxbCFNeCLtRu9jxus5ItuizkahFnLk963bhTc3Mdwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RSs6X33NSanPEP5CCoDKmshOlG10taomX3cw2dErWew=;
 b=vYEiypcBGos4mfi+6Wc6DsVERhMLuboAT6/9t5KUYxRXS7CVXr5xlB7R7nHO7PtXKn1gaCj+NqONl9KYpKUJ0GgTXLfh2f3WVdnX4QxZX+7xdHImg9iWIIpip2BTAtvbGUwTBHfjlPmb47Z4Q3WYwF4vqvhnJw2Pz4SyCfso5mw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DM4PR12MB5961.namprd12.prod.outlook.com (2603:10b6:8:68::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.20; Thu, 25 Jul
 2024 11:52:27 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.7784.017; Thu, 25 Jul 2024
 11:52:26 +0000
Message-ID: <8b143d1c-edf9-4b2c-a382-75328156a7b0@amd.com>
Date: Thu, 25 Jul 2024 13:52:17 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 04/28] dma-buf: heaps: Deduplicate docs and adopt
 common format
To: Yunfei Dong <yunfei.dong@mediatek.com>,
 Jeffrey Kardatzke <jkardatzke@google.com>,
 =?UTF-8?Q?N=C3=ADcolas_F_=2E_R_=2E_A_=2E_Prado?= <nfraprado@collabora.com>,
 Nathan Hebert <nhebert@chromium.org>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Sebastian Fricke <sebastian.fricke@collabora.com>,
 Tomasz Figa <tfiga@chromium.org>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>, Yong Wu <yong.wu@mediatek.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>,
 Daniel Vetter <daniel@ffwll.ch>, Steve Cho <stevecho@chromium.org>,
 Sumit Semwal <sumit.semwal@linaro.org>, Brian Starkey
 <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>,
 "T . J . Mercier" <tjmercier@google.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20240720071606.27930-1-yunfei.dong@mediatek.com>
 <20240720071606.27930-5-yunfei.dong@mediatek.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20240720071606.27930-5-yunfei.dong@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0271.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e6::20) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DM4PR12MB5961:EE_
X-MS-Office365-Filtering-Correlation-Id: cab587f6-d86a-4406-967c-08dcaca0411c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|366016|376014|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bDh6dzA5VUUxazZiTmhaYVVPM3hTZStGY3Y2R0NlSDBVdERIMlMyYWVnRzlk?=
 =?utf-8?B?Y0cycFZiK0JFeUJGTkdjTmVQSkhSVmh6aVFxWTBiRzVEU1NoZjZUVkw2Q2xE?=
 =?utf-8?B?b1NrZ1RoMDlPMGErOXBkb2hXWWxIdUN6OEZFMTRoUEI4ajI3WlBraVJDMUtx?=
 =?utf-8?B?Wk9LOXc4YlBqcVFzZjEyTW8yN2NFSmJOcGd3VHRKQWNDRG1vRTVLdXZJTXdt?=
 =?utf-8?B?dzM4VURtWFhQNURoN09KamNuQ0IrR0J6TUVSSG9MK3orREVWUlZaeUZ0UTdo?=
 =?utf-8?B?Q2xDendtT2xrWWF1WFB3TVFHb0x5M1o3S0t3Mi9mcWpKYUUwUW54NlI5Z0Ey?=
 =?utf-8?B?RWFacDZwek5EbWh4UnVSM0IzOStlaEY3OWNPSzJIK0NjZTB4MHUrU082ZVFC?=
 =?utf-8?B?bTQ0ZUFtUHAvSmZlOFd2Yk9UamJ2R0ZYTldMTTUvSFhzSWZhajkycnVBQXNL?=
 =?utf-8?B?UTNtVlhqbkNGa0d6MFgrejVya1lOSW50dUJacSthV2tnS09VUFlIUzZyOEVK?=
 =?utf-8?B?eUlkY0NuWHIrSWg2SGxuQk5lOGNzdlF1dzdsZVhxSVYvYW9USks2QksxQW9i?=
 =?utf-8?B?K3psYTh3VS9nSFZMdzB3dGp4OWplSDcrek1TNjl2RGQyRW9Od3JXNXB4V01K?=
 =?utf-8?B?L3pkU3poWStuS1BjUXlvS2wrcDVjRUxsQXlRTEIwVXh4T3RjRkxPLzM5RlVt?=
 =?utf-8?B?anh2d1dvZmdFdjNwc1R1emJuSXk1YzAwTldVR2NEMCsrNkliKzg5MTFKaU1C?=
 =?utf-8?B?TWpWZVFmblhwaTgvQzVjbnBKSWhzSFJpODNaZkdNckVaYXpOVm1RRXJRNDR4?=
 =?utf-8?B?RWc3MEZPeGZaS1lqcWswNnRsczQ3U0ZRMTlzbzJZRThlRU1JNzBXcjFVSTRN?=
 =?utf-8?B?a1dOaUNzTHd6VTQwTjdGNXlMTzd1M09SNkVOdDJaVEplc0U1SVdjWkx2c2lK?=
 =?utf-8?B?WUxualVQVXIzeTErRU9JSlBHN25EOTFtOUpjRVBmK0hKTXNvcnlYZW1DWS9y?=
 =?utf-8?B?bUdSdWZTU1BxbkEweU96NWpicjhqUmwyR0VYd2diRWlCM3UxMnoveVkzUlN1?=
 =?utf-8?B?NTdXSHZENjN3cVJqaGtEVWdITmZaRmlJclFlTzR2NXdHdjl0dTIvSUpKMHE3?=
 =?utf-8?B?NEZzbVRGQWNvRzJnaVZPQnRBRmlrNC9Xc1lUMHpwVjMxcUsxMGVsY2xyNE40?=
 =?utf-8?B?VVJJNEJVY3pVYUlJeUR5NVVuQmdDZ3I3Tnh3QkVjR3M2b0dBZzh5cVhvUzNr?=
 =?utf-8?B?SkpOa3lnL05ZNlNaem9sbVM2ZUFmOUk2RkV2bXh4c3Q5SFRPODNrTEhJV0M5?=
 =?utf-8?B?Y2ZtZ2d3UHA3bklKOTExYlQxUnd2eThXZm9aaGZqUUVCQzlZYzM0MzBYeDd2?=
 =?utf-8?B?L25LVkEwTEw0MDYvSXhKUlRPQVVzc0NEN1Fyb1NSd1hwY1ppYXV4b2dwR2Fz?=
 =?utf-8?B?U2Z4eUV6eGlvMFFSNDhyaXVQMjlQV1hZazZEUlR1ZkpMNjN4N0NJd3Y5VllK?=
 =?utf-8?B?eG1FeFNTSWxKcnUrQnhROGJseVkyTjVydWRVbURSNEtOdFFVcktEYnR6Y0RG?=
 =?utf-8?B?T2JtNnVUUzVPYUw4UzByRVRaU3ZkRmo1c2p0VjVQQm5PZ1JuWUNpek9PZVpR?=
 =?utf-8?B?dzdIOVZZMGt2U0twZ2kzeCtkcE9wcmVOWU5WQnV2dEZUS3BCM2NFVTNINjBQ?=
 =?utf-8?B?M2UxaGVreUxuODNHd3JYY1QvdkwxcmhDNmJTY1J6aisyQ0RROEppa1F5S25k?=
 =?utf-8?B?ZWlwbVptNGxWTU53L29LQStRci9GZSs3cnV3Ykd2Z09UV2Nwa2NTeXJUUy9l?=
 =?utf-8?B?d2RhTTZRb1U5RE1EUWl6Q3ZNcE1ZZTFDbUhRZ0dGRmJZR0NmUXBra0syeDh2?=
 =?utf-8?Q?9eTjc59wRz7OI?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(366016)(376014)(1800799024)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eWN3Y3k1M0dLT0ZpanpLMU15Z3laQzhhMGd4eE9rRVVzY1dEZWR3YjVJK2RZ?=
 =?utf-8?B?VlZOTExIOXJ3anBpT0srcnhXalhhZUgvemVNUGNEQmVuVUNkSFQ2NjNEaCtx?=
 =?utf-8?B?TXFmV0JnV1RtK2ZBVjF1eXZLY3hVejd6YTNHZjMzYVRZMlRvRDRETllQaVdl?=
 =?utf-8?B?c3N5Y0VaVk9FTWNJZ3NSYlc5eHU2c0pZNEdtWWFqTk1YblVxQ0lQanFHc3pN?=
 =?utf-8?B?N1FheUFnTHpXMGtBUUJYZmk4cVBLaHlXKzRHMlBnKzQ3YUhvUmZyTCsvSnZX?=
 =?utf-8?B?cnRCNTVHSkpwdHZ3a1NIWURTNUIrMC9Ia051NEhTcE5vb2pJVVY5N0JyVEhZ?=
 =?utf-8?B?Unh2YmpKV3hUMUl4M2hWWkk4cEdGV1hWV0picU5CSkdSeGc4RTRWLzBLNWsz?=
 =?utf-8?B?YU1rTjVCN3A4WkdoVDBuaWpiNUoyUlU4L04xdGQvVW5CdEtnTVl4cEJXd2xW?=
 =?utf-8?B?UEc4bDNuSXRHeXp5M3R1emtIc3R3M2VZZnFNRWxhZDlhclBzVjlZanVkYjdN?=
 =?utf-8?B?Y0RaL0JCQ0JQdGNzRUJpQndVRGlaQXdrc2YxY2w2OTRKTUJxSUw1ajFZdVZu?=
 =?utf-8?B?bjlvRTFkTEQramJUeGx2aHJyd2VmWGZoV1BtWU54bFZtc2pYeXNaeStWczVu?=
 =?utf-8?B?NEdKK0RLVG1Yb0Q4dHI0a3BrSVF3ZXNyQWxjVEVTOUtsM1lsZHMyWEZZTkxL?=
 =?utf-8?B?K29oWWFWUWxuYzZMeU1uTmlQM3VIZFRxOEFUVXc1bnZINCt0ckdCRlorQjk1?=
 =?utf-8?B?QmRvOEpUbnd6ZjYvdFZ3NWlWdEFmUnAzMW5MYUhhRk9vZDgrZnVpUXNwRkxS?=
 =?utf-8?B?dXRLSVZId0R5Y29pS3NQdEp0S2Z1T2lhNlR5bWVmKzhaSFlkbWI4ZVFzZndC?=
 =?utf-8?B?RVBWTnVSTkZnWWEyRitibHZjUktkREV4N3RkSmZEdmo0SHlEc2dzcmg5Tmto?=
 =?utf-8?B?RXNhVXZra2dxbWVCVnJEWHM2M0JkTHVveXp1YTRSZGhNM243c3FqMW92K2s0?=
 =?utf-8?B?ZXVKdmNibmtFeEVYL0orTkJYR1lXSnZJU2xYUWdrcGRNZUVRdEQ2bHdLR1FY?=
 =?utf-8?B?SlZjUDVYWW5VL1Y2MExrQWdUckw1aWJIMTVzMVZTMXIvZEFRblkxWWwrK3Yz?=
 =?utf-8?B?NTM3MFkwZ2svRElFMVJ4NXVFdzlxdS9SRW5GbjV4TFEyTGdUV0xlR3pZd2g0?=
 =?utf-8?B?TVFSVDJLSHpPcEVyNWdvQmcvZ3ZRbWFaQTJLVHRNcldqY2JlaUhWM2pRQTFq?=
 =?utf-8?B?R2R0a3crb3JWNXBmU0lta3hPUzJUbERCUGRpcytkb2JSeEtLdG5Dckc2RjVO?=
 =?utf-8?B?Q3F5Y2pTMWVxaS8wdFUrckdqUy9GNDRFK1BaVUloV1RMVEVLU0pubHRQMm1J?=
 =?utf-8?B?Y0FvYm1VU1JZUkVvMWc0UGY3ZmpjSmZqa1BGa1VxTGJYa2Y4ZnJ0RkYxSVNZ?=
 =?utf-8?B?ZFB4VFdYN1ozR2VGVDNUUDFtdVFHNDh1L0V0RHFkamU2SmExV1k1RHg0Nnpk?=
 =?utf-8?B?Y00rWXd0bGVQNVRxWkxwYmhGRDc1ME1Jc2NWa3BUTUxYMEgwck5YWUI0Z1gx?=
 =?utf-8?B?eG9sSDZBZkY0Q3MveERybFFmbzFEOW5aR3JFMU5QQUs3Y3cwZkl2dklJenlu?=
 =?utf-8?B?NGpoMU9mdTVyL3dWM1g4MHBSWGZwNzFabXdneE42N1d0RmlHanZEL1BpTDFW?=
 =?utf-8?B?S2FCcWZTVUN0OE5FRStQWURQK1ExcldVVDYvRlRkVkptWjZVNGkyaUx6RGJZ?=
 =?utf-8?B?RUtQUWo5SVJwaVBGWS9OVGJLTHIxWVl1QituR3pGYngzL3dlRXpJVCsza1BK?=
 =?utf-8?B?cHh5S3JHT2tzdTBwQjlEZGM5YUo3R2Z3OTNuQ3lwTDhFVHVLVXlMNkFMMytQ?=
 =?utf-8?B?QnpNMHh2UzczcjM5ak96ZkMxaXlhOXpRaGdsSU5Lam1senJLOGxWN2JaTWp0?=
 =?utf-8?B?Tlp4YTU0bGgzL2hET2lDTGlRV0NmMjdNSlBWUTkwc2wvZVFESWRoQk9FcGNk?=
 =?utf-8?B?TnNoeTNpaTJNbDMvTnVRQTcwR3NYZHY4eHRRMlNGN1NXSGNCdmFlNDdLWENY?=
 =?utf-8?B?Y1ErWXJLcXRrSmdBOFFsQlkvZFZLVFZsSnBXczdLclpxZWo1RkFZYW9ib1d3?=
 =?utf-8?Q?IcB6/HmphTcgeiwY0FNOiEAer?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cab587f6-d86a-4406-967c-08dcaca0411c
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2024 11:52:26.8098 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1T08tIDA70m7GjWFyvJvZh3WGpzvJIUxUo8/ao3lvFjn+jofavm7Su/kLMopX2G2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5961
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

Am 20.07.24 um 09:15 schrieb Yunfei Dong:
> From: "T.J. Mercier" <tjmercier@google.com>
>
> The docs for dma_heap_get_name were incorrect, and since they were
> duplicated in the header they were wrong there too.
>
> The docs formatting was inconsistent so I tried to make it more
> consistent across functions since I'm already in here doing cleanup.
>
> Remove multiple unused includes and alphabetize.
>
> Signed-off-by: T.J. Mercier <tjmercier@google.com>
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> [Yong: Just add a comment for "priv" to mute build warning]
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>

Since this is essentially a complete independent documentation fix I've 
gone ahead and pushed it to drm-misc-next.

Regards,
Christian.

> ---
>   drivers/dma-buf/dma-heap.c | 27 +++++++++++++++------------
>   include/linux/dma-heap.h   | 21 +--------------------
>   2 files changed, 16 insertions(+), 32 deletions(-)
>
> diff --git a/drivers/dma-buf/dma-heap.c b/drivers/dma-buf/dma-heap.c
> index 84ae708fafe7..22f6c193db0d 100644
> --- a/drivers/dma-buf/dma-heap.c
> +++ b/drivers/dma-buf/dma-heap.c
> @@ -7,17 +7,15 @@
>    */
>   
>   #include <linux/cdev.h>
> -#include <linux/debugfs.h>
>   #include <linux/device.h>
>   #include <linux/dma-buf.h>
> +#include <linux/dma-heap.h>
>   #include <linux/err.h>
> -#include <linux/xarray.h>
>   #include <linux/list.h>
> -#include <linux/slab.h>
>   #include <linux/nospec.h>
> -#include <linux/uaccess.h>
>   #include <linux/syscalls.h>
> -#include <linux/dma-heap.h>
> +#include <linux/uaccess.h>
> +#include <linux/xarray.h>
>   #include <uapi/linux/dma-heap.h>
>   
>   #define DEVNAME "dma_heap"
> @@ -28,9 +26,10 @@
>    * struct dma_heap - represents a dmabuf heap in the system
>    * @name:		used for debugging/device-node name
>    * @ops:		ops struct for this heap
> - * @heap_devt		heap device node
> - * @list		list head connecting to list of heaps
> - * @heap_cdev		heap char device
> + * @priv:		private data for this heap
> + * @heap_devt:		heap device node
> + * @list:		list head connecting to list of heaps
> + * @heap_cdev:		heap char device
>    *
>    * Represents a heap of memory from which buffers can be made.
>    */
> @@ -193,11 +192,11 @@ static const struct file_operations dma_heap_fops = {
>   };
>   
>   /**
> - * dma_heap_get_drvdata() - get per-subdriver data for the heap
> + * dma_heap_get_drvdata - get per-heap driver data
>    * @heap: DMA-Heap to retrieve private data for
>    *
>    * Returns:
> - * The per-subdriver data for the heap.
> + * The per-heap data for the heap.
>    */
>   void *dma_heap_get_drvdata(struct dma_heap *heap)
>   {
> @@ -205,8 +204,8 @@ void *dma_heap_get_drvdata(struct dma_heap *heap)
>   }
>   
>   /**
> - * dma_heap_get_name() - get heap name
> - * @heap: DMA-Heap to retrieve private data for
> + * dma_heap_get_name - get heap name
> + * @heap: DMA-Heap to retrieve the name of
>    *
>    * Returns:
>    * The char* for the heap name.
> @@ -216,6 +215,10 @@ const char *dma_heap_get_name(struct dma_heap *heap)
>   	return heap->name;
>   }
>   
> +/**
> + * dma_heap_add - adds a heap to dmabuf heaps
> + * @exp_info: information needed to register this heap
> + */
>   struct dma_heap *dma_heap_add(const struct dma_heap_export_info *exp_info)
>   {
>   	struct dma_heap *heap, *h, *err_ret;
> diff --git a/include/linux/dma-heap.h b/include/linux/dma-heap.h
> index 0c05561cad6e..fbe86ec889a8 100644
> --- a/include/linux/dma-heap.h
> +++ b/include/linux/dma-heap.h
> @@ -9,14 +9,13 @@
>   #ifndef _DMA_HEAPS_H
>   #define _DMA_HEAPS_H
>   
> -#include <linux/cdev.h>
>   #include <linux/types.h>
>   
>   struct dma_heap;
>   
>   /**
>    * struct dma_heap_ops - ops to operate on a given heap
> - * @allocate:		allocate dmabuf and return struct dma_buf ptr
> + * @allocate:	allocate dmabuf and return struct dma_buf ptr
>    *
>    * allocate returns dmabuf on success, ERR_PTR(-errno) on error.
>    */
> @@ -41,28 +40,10 @@ struct dma_heap_export_info {
>   	void *priv;
>   };
>   
> -/**
> - * dma_heap_get_drvdata() - get per-heap driver data
> - * @heap: DMA-Heap to retrieve private data for
> - *
> - * Returns:
> - * The per-heap data for the heap.
> - */
>   void *dma_heap_get_drvdata(struct dma_heap *heap);
>   
> -/**
> - * dma_heap_get_name() - get heap name
> - * @heap: DMA-Heap to retrieve private data for
> - *
> - * Returns:
> - * The char* for the heap name.
> - */
>   const char *dma_heap_get_name(struct dma_heap *heap);
>   
> -/**
> - * dma_heap_add - adds a heap to dmabuf heaps
> - * @exp_info:		information needed to register this heap
> - */
>   struct dma_heap *dma_heap_add(const struct dma_heap_export_info *exp_info);
>   
>   #endif /* _DMA_HEAPS_H */

