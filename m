Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8DZ5BTt9c2lowwAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jan 2026 14:52:59 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9C59767D8
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jan 2026 14:52:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E3D510EAF4;
	Fri, 23 Jan 2026 13:52:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="DHkYvnPx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazon11010015.outbound.protection.outlook.com [52.101.61.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72B9B10EAF3;
 Fri, 23 Jan 2026 13:52:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Hv9tfrdJ5gyM2/gItd9ZDvqnet3BtmPpNhm10kD/Ie0Sr9zZY+U0dBUGCFHQ/rFCmT9yUw7GZ6a4dP9uHcShRknm7dO593nOINiWFUCWTwVuezrTJV3asf5Zcu8HdgyQnOs/3xBp56jacJwC2SHaxfuBX5tR9ywjo8747vQprexgRxzs7P5E8gYRvmpL0i0APHwXG8r0+wUxe9S6h2xZ2E58ieztqmHjIPLOZXouRc3MG8mBNdX06jXa1oUQxV6rNuRof9pLrXbKJTMVVwSIMov67NMHknsQEvfeEQz3hhd6zxoaPyhS215+11kBtd9gGClGWUuSSwKIwP9EMa7ZRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g+2q4MGLyOTpY2+1WzhrhtsVcQDOxQNqTvyCBi1UJLw=;
 b=MBtvzLD7tXGgYlXjiAYsdEt8VCTouvwvRMLtQP0x1rCvB8jb4EPh8IoFF+BYHXvQ1YNREaJgFeotdNuIUp10Y5GBdHsKBgf1EZtOF+ylE2XHwG28gr9x4gBodUd/PDE4akeQS4jGZrJ0sF/9YEsBubrzdXduNzzc17fZZ2xS9YBIWUItwZrg7AjyakjHZi0VgPlrgA7JdzgEWo4QKK3QrNC8O6LZkQPPmObn7sLrh8uNChqiYBIEhwJIAOSotoZ3NvFxbK6aNmfrx6KYIk/KEh1waFD8tYDtSP/tQVx+LqFPMk0lZVWws3guc52DpuFrgzMjRq4gMOykbOP141Tl3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g+2q4MGLyOTpY2+1WzhrhtsVcQDOxQNqTvyCBi1UJLw=;
 b=DHkYvnPxyMKZoEouRT3WmqsqkcN63o0SlzsIQpFzjwZK8XOQBtshusHmuH9oRZpHi/r6TQfzZ4MQ7FUo3h3zrhQTDCmdydqQv67XPRNwJ3TOhzqomY10NyZmqk+E/zRx9oliP1Z0ZrFLw3npLYvQhKMxstz3t4lrTPk8q/36BTA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DS7PR12MB9526.namprd12.prod.outlook.com (2603:10b6:8:251::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Fri, 23 Jan
 2026 13:52:52 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9542.009; Fri, 23 Jan 2026
 13:52:52 +0000
Message-ID: <2de6d428-b997-4ba8-8766-a211e5612e72@amd.com>
Date: Fri, 23 Jan 2026 14:52:44 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm: introduce page_flip_timeout()
To: Hamza Mahfooz <someguy@effective-light.com>,
 dri-devel@lists.freedesktop.org
Cc: Alex Deucher <alexander.deucher@amd.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Sunil Khatri <sunil.khatri@amd.com>, Ce Sun <cesun102@amd.com>,
 Lijo Lazar <lijo.lazar@amd.com>, Kenneth Feng <kenneth.feng@amd.com>,
 Ivan Lipski <ivan.lipski@amd.com>, Alex Hung <alex.hung@amd.com>,
 Tom Chung <chiahsuan.chung@amd.com>, Melissa Wen <mwen@igalia.com>,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <mdaenzer@redhat.com>,
 Fangzhi Zuo <Jerry.Zuo@amd.com>, =?UTF-8?Q?Timur_Krist=C3=B3f?=
 <timur.kristof@gmail.com>, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20260123000537.2450496-1-someguy@effective-light.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20260123000537.2450496-1-someguy@effective-light.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BN0PR07CA0017.namprd07.prod.outlook.com
 (2603:10b6:408:141::31) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DS7PR12MB9526:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e624d91-6d15-4135-665f-08de5a86b39b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|7416014|376014|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YytYS0JHVW9Ra0Rub3FEV3h6WkVkNFgzR1BRWmFXTDhTY3VTTFUxdXdBOG1D?=
 =?utf-8?B?NnR1Y2lGYnduQmtLWWRzTFhuV0MrK1h2WkJqMjcwenQ3Nkp3K3ZDQzhCZnZi?=
 =?utf-8?B?UHVibXNHc1diaDkrTG5lK1pKMC9sdE1JSXBiSkxtd1lqQWVjbEhZQk45K1pW?=
 =?utf-8?B?Z25JWGtqbUprT1FPYldLQ0FjL2VzSXVQK0xrY05tN2pPU1h5WWhtU1dLZmxM?=
 =?utf-8?B?YXZJWDYyV3B3N1oyUTF1YW5aVTIzaUVsRy9NT0dGS2oyNE4rQlZ1bFREZU9G?=
 =?utf-8?B?eDVwUmJoTXZQZEpZM0ZYbWVpUGZ3SUVpMHUvTk5xOWllRXV4RTc2YXcvWklk?=
 =?utf-8?B?NHMxTlcvNWtsZ2tESzRUamhQdjhDbjlTdnh1cGZ2UVo3REh3S294YVhBa3BG?=
 =?utf-8?B?WW8zV29YMDg5RWFWcyt1Ly9mR0t0TFlJMHFGQnZsenhtbHFaWUl5R2h2U0Nx?=
 =?utf-8?B?OVhBSXdvL0FkRUpkemZrb21Ta1l4MnA2K1p5Q1RkMHdRNTZUMDdvbkhzTExs?=
 =?utf-8?B?NDNRYnN3cG9lT2tja0Q5LysxY3JpSnY4Y0RVNTlrWEVIWjViMWtHYkMyM3ll?=
 =?utf-8?B?YmJwZWxmRWNhZ2hCZlhJMFI3amZIN1VTdzFCb2paa2NoUUwwWFA5Wm12V0N4?=
 =?utf-8?B?Vy95V3lWd1MwSm9Yam5heFRYeGJYVmxsWUVVdWluNVluZHBTZUFDUmI4RVdp?=
 =?utf-8?B?MGkzUmdhTzZEOWIvbHZJVXNVeFk2czBHbW9LQTFqTzVnaG5QUWVVdHlRU2Uz?=
 =?utf-8?B?eGdMNXEwbEJMVG1rOEIwbmxkNEp3K1BweUhPcWNaVFVTV2N0WGxsWXRxSkZ5?=
 =?utf-8?B?aVF0OXdSbmVqb1cvdjc2dXpCUEhZQnZ1Umt4RS9JT0NOaVhmTXNqbHVEU2Fz?=
 =?utf-8?B?MXJ5citEM3RuNmI5MUJGVHlOVHRGRlRHd2Eyd1prT3F2SFJzWkovSkQxQVgx?=
 =?utf-8?B?MGhtejVpUGViZytNSkpvY0hJOTVnSTkzemdRRzBXanNVc3BkTjJ4SWluSHgy?=
 =?utf-8?B?d1NBeFJMbFE2aStNbU9XWUtoZWZBRFpucnJmV1NUNlBJS3FHclhNalIxM0Zs?=
 =?utf-8?B?LzNoMkcwNjhXT3pEai9PQjA1Qm9sZGZPNkFjeEd4NXFyOGZIajNiQnBmT3Jp?=
 =?utf-8?B?RzE5SzJodzJEMW1BcGdaR3NRSkdudkphSHREdCtQdkYyMnRaOGVTNUFqbFEz?=
 =?utf-8?B?QUhZK2MvaHV1ZEtUeDgyUmlNV1duSGNablNuSDVxdFRmTzJBb2NLSXFJamIx?=
 =?utf-8?B?dlU4N3h6UGFFNXZNZnQxQXBENE13V3ZEejJkVktjRkc2RU00Mm9wSEx3WUNR?=
 =?utf-8?B?VXE3R3laWVFqaUtvbFFuZHZtbzN3OHI4SVU4NjlvMkg5OWE1ekRLbVZBN1pq?=
 =?utf-8?B?dWc1UDE0UWFVZWRvTDB6UTFZdm5PSGdBVk53RjY1Q25hMzZXc2M2MjRUZ0c3?=
 =?utf-8?B?bldKVTB1VUxkSkwxREpUY3JjSWRPaVNlY1pDeGVub1FPZWxrZzBYUkhjQXRK?=
 =?utf-8?B?MDN1SXlWbkdqSHM5dnlkckRVdm5NaklSWFM3UmxVd0M3TFdQRGttM3lLRlZU?=
 =?utf-8?B?QzJHemVHcWZIaWZBZGtkb2xtUWVpakVPSmFoSnNCTTQ5VTl0VVNzYlNLNlF1?=
 =?utf-8?B?VklLV3pTUitocm5HVXh1VkZuTVoxdjAyNW13ak04YlE5R2kwT0pQV29zY0xL?=
 =?utf-8?B?RDJtNmU4dHlSbTZzUkxzeEVOQXY1ZHZqK1FSMHptOW1ZZUR1cW5aOW1JSU5F?=
 =?utf-8?B?OEc3WUxNOGZpanpZNUViTGk2ZE1UU05rbUJSbkFlOVppNjN5dTI2V3B1RGFv?=
 =?utf-8?B?bjhOM1d2TDRsYjdSK3gxMnR4aGtMaEh3VEo3VkFRQ0VoRFFvV0lqcTdwQlBO?=
 =?utf-8?B?UmlNM0ltby9RZ05sOXJaSllhNmtzMXArR1ZieUh3QkRVcmk5MUtxUVduOTFh?=
 =?utf-8?B?dmtyUE5nay9TbzFCN0V2OFp0bTJVOGVkb015WVh0Y1FiL3Z2TFoxWlBrNFMz?=
 =?utf-8?B?TGhGNU16Y1pTSlowWDFIOWw5cUFDVmNSS09SMG9kOGZEdFpXMHlacFZVUnlX?=
 =?utf-8?B?THYvQ25PSVp4d2lJV1FBeE80dVczYUUrT1BjajMvYXlHeGo1TCtoNHhYYVhY?=
 =?utf-8?Q?84QA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N3NTZzZ0Q2gwdExYTmZ0Wjc2cXo2eVpGVmw5bUFhemZsZkRlZGNDaEtGMlJs?=
 =?utf-8?B?aFpjOFlyaGN4M0tWQVFvRkFKTmlCRzJEZmx0c01WWDFoNHdyME5OSGU3dlo1?=
 =?utf-8?B?dThoa0NhWndLUnFvbVo2bS9XTE9LKzdOOWRoMVdzTnAvSmJldUVuS01rMFR5?=
 =?utf-8?B?OU1jVlFVQkpKbGRCSUw1NDdLN3g3S25ra202TjlBMzhSRkxYZTNBcjNOV0dV?=
 =?utf-8?B?OUNiRnNVN3g1ZnB6ZlJVNXg0blpUZlpsVE1ncUQvNTViSm1nTExudWpKK0tY?=
 =?utf-8?B?eGpLb3hTeVF2RzFVQ3VCQ1BDUUxlNU9aVkk0b0N4QS80MjltWlB0cnJoUUIr?=
 =?utf-8?B?dkloSzM4R2FzSGJHOW9ZWDZ1UTZGQ3o4MWZEdlcyenBtTFU3Q3U3TDZWR0Zj?=
 =?utf-8?B?aUpKOGRKamZFeVhja1BVb09XNDFGd3llQnFaN2NwcmpTb0ROWXNLMjdmR0xN?=
 =?utf-8?B?Z0FnTkRDWVo2bElMZWQ1aW1DcnRiSXlLY3ZQK0VLb1hkVFdpWmlvMmpaM1h6?=
 =?utf-8?B?L3ZmcUNHZlZjTE9XVUVWeDFHTlNmZk1HcjF2SnVEQ0J6Y1lEWWVIaDY2SThU?=
 =?utf-8?B?NGxrV3dzMGtBSmxId0s5enFvMEF6cjBqZ21lcFNNUjhlNTQrcjBqT29vM2tH?=
 =?utf-8?B?NjVWWFlCZlpGRUFPUStjQnl0S2E3YklsZ0tuZnhyRmhPMUFRY3ZCSUhnMXZs?=
 =?utf-8?B?Q2loRyszbThZSzhSSk5tT1dpRm9RaEo5STl4dkJXMStmRUNackpNcjQzS3JD?=
 =?utf-8?B?clREL2gva28rK0N1MXY2dFowby8reWRyaU9QdXQvRGZNSzBNV0RDeTR3dFMz?=
 =?utf-8?B?TEtRamNqU2NHVDhiRklVQm5aYWlWSFV5aFpFeDZ2bDdFTjBNbGIwRjlPWFdZ?=
 =?utf-8?B?SjFnd2hOZU1ZOWd1ZU1tVU5mM1ZDYWdOc2g3SlVqWndmaXJPL0NiUUk0a0lM?=
 =?utf-8?B?OVBoY2Jsd1ZoRGs4SkNBWnNXd29vOE5NTytrSXdiS1pGcjgyb3FqRXdiTmhn?=
 =?utf-8?B?SVZjYWozbXovdTJzZWxXSk5mSjk1ckN4UTR4OUUrclRsTkV3Uk9Dc09EUVd0?=
 =?utf-8?B?MjcwSEJFUDVxYTVOZGhiRE95a1pHNU50elpwbmR3ZjRGZmEzNDh4dC9NU3Nk?=
 =?utf-8?B?YlM2M3U0SmhXUExjOGRjQVZmNWVBWXhSZGczR2Y4Y1FwdFVoVW9EWnM2R3Zk?=
 =?utf-8?B?MlhUSnpjTG00OEM3czhHUUtjSEw5LzRLemswR3c2RGNSWGlUSWdib3VDUVdy?=
 =?utf-8?B?SkpGR2U2Q3VQUURDMWVxRnZyQmdPR2ZIaXpqeVZ3SWpQR1Y4RGVWNlphR2V3?=
 =?utf-8?B?dWVzVk12ZkdPb2IycHdlQkJMY1FISkxQZ1F3MjBnbWpIbHZrZ0xlbVd0eG1W?=
 =?utf-8?B?WnI3UGZpemFrN1dpYXdGNE1SZzVjaWltUXhLT3VNcGgxd2w3RHhpejZvRDRk?=
 =?utf-8?B?MGZ2SVVvN2I2TWEzT1FEVUtvaXlwRVdGM0VtUzl4T3pKaTBTZ0pTNUU1RTZk?=
 =?utf-8?B?WnNBTHJ4b00wNVJhL1lQeFNLeG1HUCtXSHNOc1NiaGZJazIvWmg0SzR3NDRU?=
 =?utf-8?B?YTJrOU03Z3JQMXFZbFlhbEFxalpkSS83QStlNDVCaDhpeXZLdThIaVRRSUtQ?=
 =?utf-8?B?SW5HUWh2QnZaZmNBSU0ya2xuY1Q5bEVpb2kveDlFNGI1alRQLzFjQk94dEhH?=
 =?utf-8?B?YmU1SUN4R1NCRFV3T3RNVDFqWUlXQm0ramg0bmM1M0toUlRXZ25OS2RIdU9Z?=
 =?utf-8?B?Yko3UGkyemk5bmpnVVVhZW1vSG1MeVVIbU10SUJwcVFSYkcwWWphU3FmNFRq?=
 =?utf-8?B?YXg5MkYwUFFqR3JUdHIvZ0NJNTNMc0JFZzlGTkVybHNHWCtHZXdWV25kZ3JR?=
 =?utf-8?B?T2g2TW5LbXFvTkZOZ2dPdlZJL1VSTEhQWkIzZGt2YnJLc1REaEtaQSs5azI3?=
 =?utf-8?B?Q01XSUZ1VlBMMk5hbFl0YTI3RnNxMGNMb3ZZR28yT3laK1VJaHRQMXhPMi81?=
 =?utf-8?B?VlZ4TXFDbnhJV3JJSjlNbTA2alRtMHhVaWxrZXAxaXZRYTFLVFRzQ05UUVZE?=
 =?utf-8?B?VnBHd2RQYXdtUnE4ZnVYb1h5dTlzcGJ3Mm1VZXlrU2pMa0gwNS9DRk0vdDlW?=
 =?utf-8?B?L2tDaFVNNDhUaTd6eGN0SW4wakc3ejA2UFAyeHlCYWd0UTBVZEdhQnl0aGxu?=
 =?utf-8?B?YjdOQ0RSNnEyR2lVc21OOXB0YnRpTDFLeVN0Zzl1OGlOV0QybUZTN1F2MkVz?=
 =?utf-8?B?OHNEQ1BBbmQwVGJtL1FiVDhRaERoMkhBWkhzZkNKWU5xSkRrVGEvenRaV1M1?=
 =?utf-8?Q?kaD0/+PfsAvc93R+D4?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e624d91-6d15-4135-665f-08de5a86b39b
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 13:52:52.1339 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1EvwKUCZ4Ck0fwIml6/uk5lYvhdLFvJRTubOi/eHGitcpCKxj5e82UZ9I7ZB4v3w
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB9526
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[24];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.987];
	FROM_NEQ_ENVFROM(0.00)[christian.koenig@amd.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[amd.com,gmail.com,ffwll.ch,igalia.com,linux.intel.com,kernel.org,suse.de,redhat.com,lists.freedesktop.org,vger.kernel.org];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[effective-light.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: B9C59767D8
X-Rspamd-Action: no action

On 1/23/26 01:05, Hamza Mahfooz wrote:
> There should be a mechanism for drivers to respond to flip_done
> time outs.

I can only see two reasons why you could run into a timeout:

1. A dma_fence never signals.
	How that should be handled is already well documented and doesn't require any of this.

2. A coding error in the vblank or page flip handler leading to waiting forever.
	In that case calling back into the driver doesn't help either.

So as far as I can see the whole approach doesn't make any sense at all.

Regards,
Christian.

> Since, as it stands it is possible for the display
> to stall indefinitely, necessitating a hard reset. So, introduce
> a new crtc callback that is called by
> drm_atomic_helper_wait_for_flip_done() to give drivers a shot
> at recovering from page flip timeouts.
> 
> Signed-off-by: Hamza Mahfooz <someguy@effective-light.com>
> ---
>  drivers/gpu/drm/drm_atomic_helper.c | 6 +++++-
>  include/drm/drm_crtc.h              | 9 +++++++++
>  2 files changed, 14 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
> index 5840e9cc6f66..3a144c324b19 100644
> --- a/drivers/gpu/drm/drm_atomic_helper.c
> +++ b/drivers/gpu/drm/drm_atomic_helper.c
> @@ -1881,9 +1881,13 @@ void drm_atomic_helper_wait_for_flip_done(struct drm_device *dev,
>  			continue;
>  
>  		ret = wait_for_completion_timeout(&commit->flip_done, 10 * HZ);
> -		if (ret == 0)
> +		if (!ret) {
>  			drm_err(dev, "[CRTC:%d:%s] flip_done timed out\n",
>  				crtc->base.id, crtc->name);
> +
> +			if (crtc->funcs->page_flip_timeout)
> +				crtc->funcs->page_flip_timeout(crtc);
> +		}
>  	}
>  
>  	if (state->fake_commit)
> diff --git a/include/drm/drm_crtc.h b/include/drm/drm_crtc.h
> index 66278ffeebd6..45dc5a76e915 100644
> --- a/include/drm/drm_crtc.h
> +++ b/include/drm/drm_crtc.h
> @@ -609,6 +609,15 @@ struct drm_crtc_funcs {
>  				uint32_t flags, uint32_t target,
>  				struct drm_modeset_acquire_ctx *ctx);
>  
> +	/**
> +	 * @page_flip_timeout:
> +	 *
> +	 * This optional hook is called if &drm_crtc_commit.flip_done times out,
> +	 * and can be used by drivers to attempt to recover from a page flip
> +	 * timeout.
> +	 */
> +	void (*page_flip_timeout)(struct drm_crtc *crtc);
> +
>  	/**
>  	 * @set_property:
>  	 *

