Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FB53A194A4
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jan 2025 16:06:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2662D10E310;
	Wed, 22 Jan 2025 15:06:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="RhUlg4Jm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20627.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2416::627])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13D5310E24B;
 Wed, 22 Jan 2025 15:06:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NQJHCmK4ucemWRxzt0IHh+WEe/wCbI9d+jxOZ/nx8Lf/ABMaRq8AAoyHuUdqxTRa19AAazBOsKIZNzXCwfeDTHCyo4GeCwvkGbfW4aq47ouYl4B6yhNzmynft+2pritr6aV0YfaK9Uc4DQgnI2pdMTNoDL1Qpi01q8AIXKCrEWcehqSX/0Awx+0YwhOlG7C5vOIRhYg85mM0bHD2EfkLj0aiC4fhHhItgJs7cR3VjwxiauWGxCU7RtYgcIza7jBh7TIVs4t+D7PQxxgiEeFstynPINckP//nxNEVMveXAKQOsTrsz0dGujcd+ghO+U+lNU/Tv3UOSYX53YeOuIYCyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DTXoi2FTo87En2fI8ecq+QDKcFlTkhjIYRWYjre2Pxc=;
 b=UCIHg7f0uExezmZuqFj2n6/8f20ZFHiS7P6d1KFGO4Z+OM0fKJB1PSKNj8Z5xXa6MLBTIpYn7OCME05JhpMamZGGjzVeOlS/1HoSqWK/XqkNKLLH/Q1QtOgXoeCbtjJieZl4Cd9427DBLqqWyS/vuVUx+i/wck2hyRe2REl37aI28E4YFA/vXw9gcy/preN6u63k35f9WipMKfNiop+MvwQU2yH4ju5QhRBcmMggijvZrvJAY/xARQnxkJRWwj2h4PDpYkYMjr7aRV8yCaoZWDzxlwF4IjauEZ05Tg+l8kRkJVQRyf+Bk5a83Wt6LX3JNttWOZRXUpz4iyHpd56ezw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DTXoi2FTo87En2fI8ecq+QDKcFlTkhjIYRWYjre2Pxc=;
 b=RhUlg4JmX4yDwJz8XRS8CkLCO0V7o2RqSMpVOr88P3dAbuX+arPf5ymYiptdZ4HTExgcFRnDVeynlmX4F84+hrpneopw/WtUR0XY71O337u6clmH6klTpkTgXfcIRX6GUhzTT65VSQnalMTHz/6MFbhR7UyfGsoP8ndiXpN7aiA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SJ0PR12MB8091.namprd12.prod.outlook.com (2603:10b6:a03:4d5::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.21; Wed, 22 Jan
 2025 15:06:25 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8356.014; Wed, 22 Jan 2025
 15:06:25 +0000
Message-ID: <4614fd95-ea91-484b-87b7-bba5da0bb8d6@amd.com>
Date: Wed, 22 Jan 2025 16:06:10 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/sched: Use struct for drm_sched_init() params
To: Philipp Stanner <pstanner@redhat.com>, Philipp Stanner
 <phasta@kernel.org>, Alex Deucher <alexander.deucher@amd.com>,
 Xinhui Pan <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 Frank Binns <frank.binns@imgtec.com>, Matt Coster <matt.coster@imgtec.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Qiang Yu <yuq825@gmail.com>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>,
 Liviu Dudau <liviu.dudau@arm.com>, Luben Tuikov <ltuikov89@gmail.com>,
 Matthew Brost <matthew.brost@intel.com>, Melissa Wen <mwen@igalia.com>,
 =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sunil Khatri <sunil.khatri@amd.com>,
 Lijo Lazar <lijo.lazar@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>, Ma Jun <Jun.Ma2@amd.com>,
 Yunxiang Li <Yunxiang.Li@amd.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, etnaviv@lists.freedesktop.org,
 lima@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
References: <20250122140818.45172-3-phasta@kernel.org>
 <f149ca5c-b30a-4a24-82dd-c0b5e99a34e5@amd.com>
 <5fe5160c06d3648d9bcff7bdc52a0167d05271d7.camel@redhat.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <5fe5160c06d3648d9bcff7bdc52a0167d05271d7.camel@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0171.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:99::16) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SJ0PR12MB8091:EE_
X-MS-Office365-Filtering-Correlation-Id: 975a3801-d776-4ef5-6013-08dd3af656c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|1800799024|366016|376014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?T1J5T2E4alVWOGYvV0JNRFRhMlhxUElBUDdHazIvVUVnZkFORWdtazlKSUUw?=
 =?utf-8?B?ZW83dVhLUmQ2ZVpMZnpXQ2hlVGxNMnIvUnU4aDhCR3dqZkxTMktiTEhPTzdG?=
 =?utf-8?B?dXoySjFPVC9Xc0RCb0dtSHU1NU4reS9jQlZIaWdrYWZvN0puYUVIRFpDTm1h?=
 =?utf-8?B?VUl1Q2cvSTJnRmZWSldNRUtuWG5UZVFWaC9uNEJaTXYxbGsyRnpYYjBEVWZS?=
 =?utf-8?B?bUpMRTBDNHp2czdPMTUvWndCdUtZc1poMVd3bEY3WDY2WXlQTlpzWjNTeUIz?=
 =?utf-8?B?K05ta0hkL3kxL2ZHN1lnMzVDZ1EzVXBsMWpWYlZUZVo0UERnRkZqMmhmZWdq?=
 =?utf-8?B?eFFHVEZDOVV6VmwvWGlLQkl1ZHlWdFVGNnN1c3pUNG9yY0V5RE96TW9nM0ox?=
 =?utf-8?B?Z3N0NE9uV1F1dWV1THVoNWVlWTZYMmRnODRrWGtxVVN2NVRpREZibXlKbUZ3?=
 =?utf-8?B?N2pUQmhadE5WMm9ITG5NM3AvWjhlS0JTUUFwalFPbTdmWjJIcHZIZTVlNFRQ?=
 =?utf-8?B?cFllbjZoeURGS3JmamY4bjdTYlFtOE9QVXl4dDF3aXhiZjdZR1ZwQkg4Vys1?=
 =?utf-8?B?UytTd0ZVNEZ1elpWVFpNVU0yZHZUSmtRcEx1endjKzBUYUU0L3Vxd0lHQzVU?=
 =?utf-8?B?TE10emxFbXVSbjhuN045N2IxUnpENkhGcWxNM3QzNzRBbHpwSk1ycUduellr?=
 =?utf-8?B?RGhMZUc1SHlwaExBNkFab1QrYThDNzBOSGQxYVJZSjlLZHUyZUd0T0piMFNq?=
 =?utf-8?B?c0w4M1BNc1Jwd09TUVZvdzlVMTVZOVFMekE5U2xYa05LeXozbUpnbDFyTkxQ?=
 =?utf-8?B?bytyZG5YOEhFV1B6K2JxSFVKaEhaWjRva09LVDE1Q1BsRitLaVZPdXpuTjM0?=
 =?utf-8?B?UmFvQTdNYzJObmVUVkc4bDJhMENPbUNXMGxmZWdRNXI5bzk0dWZUVjNYM3Y5?=
 =?utf-8?B?QzZYZ084QXhGK3I5UmM3NHNaVDVHZVZNYUZsWlBjemFLVERQdjVqeG5RbUhK?=
 =?utf-8?B?a01Jd0lpa2RIZlBuL0ZqVUhmZVNFMnlNTlNTRU9vSExET0lYS3NRTFlOTCtL?=
 =?utf-8?B?cjBEUXk2ZW10YSt6VFFJVmxmT3B3TXJJUzVzL1NOWnNhdWdZaHd1anQ3dlFq?=
 =?utf-8?B?bllqYWhZVEcrOTZVNXg3NXVad09kdWRkVmhUeU91UVFTd1pJclRxMmxUT2o0?=
 =?utf-8?B?QUtlbmpJMjErZkZzMHhLZzdaUnpYTU5URGN6cGs3NGMvK0dRVmFiWDEyS3FE?=
 =?utf-8?B?UkZ5RGhCZ2l2RnR2d0VoMEIvMTFKRW1uOGR3RlViWEZLbVFYQkIxTmgrdEpS?=
 =?utf-8?B?dTUzUng4QXpwenNLenpla0NFV1IreEtMRUI0ekFEU2NGYnFETWNNMUx6b0xi?=
 =?utf-8?B?K3J4dzlsbWhIUEhteE1XeXUvcUttM3pQenRwUTZJd3BXMVV2bWhQRjgra1Jr?=
 =?utf-8?B?OHdzbFVQMm1KM2hXalNFbDI2MWF0UVF1WTYzM2lWQktZdStMbUhkdjFvZmVr?=
 =?utf-8?B?UW1BMU9QZDR5VW5ZeUkycXdNOEZ0OW9DTkVmd1dJUFlNZVBYTktZY2ZPVjZX?=
 =?utf-8?B?bUxadlB4OGZ0NnYyWG5aamJVZXFWOGRZeEwxR1ZjZ0FkWnJqUFd0VlpuR1kx?=
 =?utf-8?B?dllLcnpkaEhyWmh3eGFNb2VERWdBU0thZ0pjZ1E1c3NMSFZ2MGNXcG9Yclha?=
 =?utf-8?B?WjllTEU5aFEwNXROSFJjejlaYVpFdTZYVDhKOURHUmRmTVZXMER4Nkx2OFVp?=
 =?utf-8?B?SDAzZXdOSXQ1RFowdmVTOHJoVmxveU44dXE1cDFjRnpFK3o5amNHYnBMNWlt?=
 =?utf-8?B?Z2YvTFVRd0MvL2VnVFpkOXl5bDFiOUhjVXZ2eTRqbHNFUTJGa0RXVlFTa1M1?=
 =?utf-8?B?VFhlMHcrOEkrNmxPVmRYUHRnQ252QkVBTWc0ZWJXd1BFVVdKb3VHK09NZmk1?=
 =?utf-8?Q?cUkSrMv7tK4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(1800799024)(366016)(376014)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UWhadWxQa1Y0QzdEQmRYblpnVjJHRE9RMWgvMkwxVG1RZkZsTkxGQTFxcTZy?=
 =?utf-8?B?ZHpJd1ZLTkVVb3hrM0hYZVdEejJOUGRNTDZvVzBabUNRR0ZmN1c2cWhoL2E3?=
 =?utf-8?B?WEl1TFZVZHczSXNRSTV1b2tFZnlMdjgrR3JuZExMU0Z3NTEycHVpQXorMkxO?=
 =?utf-8?B?M3RhU1kvTnBLdjhDSlNyTGxFdzBJS2grcXBQUjZ0dkFiVVJHMXFXZk1UcWUx?=
 =?utf-8?B?MHBmL1BJNmdCRG13NnF1TER0bnIzOWxiamFlWEg5RlRGYWJRNnBVZ0l4MC83?=
 =?utf-8?B?RURCbUlUTi9EY3B0MmF6NFhaK0YvSWwvY0xTMWRuRWtkN2d6d01vTDdFU0Jh?=
 =?utf-8?B?Ty9qMHAwaWNNUUVGL3BCTWJFUGtQRWVGMnpscWoxRnlmdWFDRHREd0p3b1JU?=
 =?utf-8?B?aWplR2huRWJBcHNyZlVHYWFqQ2UvSEJxK090TW1EN3VJNnZCY2VuWFJHNENo?=
 =?utf-8?B?OFRFNlBhdXp1Nk1CS0pYRlVDblh2WU9VdFRMaWR5NXAvb1dLNnlvU0JwR1dV?=
 =?utf-8?B?ZXQvNCtXNlhpQTNwclozZHc3WkJqNnpiSjFYMjZqc2t0UG1qN04zbE83d1lv?=
 =?utf-8?B?SUFQamExSDNNY2FyQTd5WkpYQ1dHd2FBRTZsUHhYSTJRdmlVYjVoMHhkckRH?=
 =?utf-8?B?bkVZckdtczVQdno1OGQrOXYycHlOa2I1MjRyNGwvTGZHNVQ1MjhNbFF0WjhB?=
 =?utf-8?B?VklpQ0JZaEozZWE0VjI2Zk9reXZpNTBFbDFBR2FCNmtsWUFnbERhbm5vby9a?=
 =?utf-8?B?amlLL0Z5OTc0Ty9qSEgrb2dKS3Y5UjF6Z1puaXNHYTd6SmovTlFaWmlwUUh1?=
 =?utf-8?B?a1hMQmpDdUlPWGZiZkMxcWYvSmtSVWtNNGJ5M1F6MFBCeGJtYTZ1aWRoNFBC?=
 =?utf-8?B?ZE1hbEhLMEZXeEJEMDluSmZSN0t1WW9FbXhOVWFrN01taXJUdk9pTzU4bmxr?=
 =?utf-8?B?NGhqQ3phLzRSZHkxTzhtblBDTy91MjQrMkVEcXlZZUhVOUxDYVhBMDYwelcv?=
 =?utf-8?B?N21xbjhtS2VPZHArMlYyTDQ0S2lSUE4yRVRMR1J4TDV5Q04wNksrNW16RER4?=
 =?utf-8?B?dU9XZjlEaHBWK3A5ZWVZOVkrTWx4K2VKY0djQkRmLzVCM3J6aEhYK005T05l?=
 =?utf-8?B?bGFoS0doV2JyaEZESEN3ZndyQVM4Y29MaUFsS0IrVGo2VmlmZW5xNjZYYzFo?=
 =?utf-8?B?ZUxLT1U5LzdBWDhpM09LZnpxSGxpang2TkpCV2QvWGRudHdmei9ZL1lqOEt3?=
 =?utf-8?B?RXBaMjRDaWRWRlpTWVBHSDBwbWl1bkxQZVFReU5NMmk5UEZscHpRcCtRWDUw?=
 =?utf-8?B?ZEN3amVybm1XWnI3aTVtSkJpeXBqMnZZc29pei9NT045NU45dWdKZTFiUzhV?=
 =?utf-8?B?NXJNbmU4WGFVL1l6dWU5ZExjM3A4UXRpOVhnemRndUNXS05PWnMxVUNlRE8x?=
 =?utf-8?B?MnBhdjlVODFoSnplcjVqcXE1MDdkc0NQb0hMOUMrSDRGa1E2WWNPdzZ5aDZs?=
 =?utf-8?B?bTJoU3I2VjdOVWJMRi95SWx1aW5sdE8rRi9vVExvQVZqR2RNQVJMRmR1eFpj?=
 =?utf-8?B?RS9CUm5CL1dwaE1rb3J5Q2g1QmpuMHRURGxLK3FoY3lqUnlqRGo2b1JZTnF3?=
 =?utf-8?B?clBXREVmbnYxVURDU1RmbVl0NWlBWFhKSkZCQWlwUXpVbzVKemFucXA3WTQ0?=
 =?utf-8?B?ZzJzdkdXT0RaWi9NTkEvbmtUTVVGWDhXY3lPYWJKdlluR0hlanBxVm8rTU5x?=
 =?utf-8?B?dVE1aHArSm5vbmljby9lZmMydmZmV1RFOUJwWUNlY29DY1YxT29CL1VxRy9Z?=
 =?utf-8?B?VGw2S3N3TnJWajE1YXdNczdJTStVNXBaTHlrRFVlZFRPRllHVWhUZ1RqR0kz?=
 =?utf-8?B?ZVMzelFqZG5ZYktzTDBDa2c2UHJROVBsV1hHbDNicXZyRnMyL0NQeVhqbXpr?=
 =?utf-8?B?MFVXMFFSYUZPVmlTTmljTDJ5NFhlTzFoU2JDMWZwSElsZzVDTG5kWktLOXNj?=
 =?utf-8?B?Y2V5b2JmRkRTN1NWVHFVRDB1R3cwdXRkdk1ESXFQTzBqNkpMMjBmR0x6WStx?=
 =?utf-8?B?bVJIUVU1WUJlL3Z6RG9vM2pLdmpQNVdlb0MwOFphUXAxMmNWWGVFdGpUbXYv?=
 =?utf-8?Q?A00U=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 975a3801-d776-4ef5-6013-08dd3af656c3
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2025 15:06:25.1868 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OduIV4nStsWcDRMVbyc5wrLS4w1GsL5/0uIzxXm1+zJN6s2rK8NVpFq+e5cmyDlt
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB8091
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

Am 22.01.25 um 15:48 schrieb Philipp Stanner:
> On Wed, 2025-01-22 at 15:34 +0100, Christian König wrote:
>> Am 22.01.25 um 15:08 schrieb Philipp Stanner:
>>> drm_sched_init() has a great many parameters and upcoming new
>>> functionality for the scheduler might add even more. Generally, the
>>> great number of parameters reduces readability and has already
>>> caused
>>> one missnaming in:
>>>
>>> commit 6f1cacf4eba7 ("drm/nouveau: Improve variable name in
>>> nouveau_sched_init()").
>>>
>>> Introduce a new struct for the scheduler init parameters and port
>>> all
>>> users.
>>>
>>> Signed-off-by: Philipp Stanner <phasta@kernel.org>
>>> ---
>>> Howdy,
>>>
>>> I have a patch-series in the pipe that will add a `flags` argument
>>> to
>>> drm_sched_init(). I thought it would be wise to first rework the
>>> API as
>>> detailed in this patch. It's really a lot of parameters by now, and
>>> I
>>> would expect that it might get more and more over the years for
>>> special
>>> use cases etc.
>>>
>>> Regards,
>>> P.
>>> ---
>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_device.c |  21 +++-
>>>    drivers/gpu/drm/etnaviv/etnaviv_sched.c    |  20 ++-
>>>    drivers/gpu/drm/imagination/pvr_queue.c    |  21 +++-
>>>    drivers/gpu/drm/lima/lima_sched.c          |  21 +++-
>>>    drivers/gpu/drm/msm/msm_ringbuffer.c       |  22 ++--
>>>    drivers/gpu/drm/nouveau/nouveau_sched.c    |  20 ++-
>>>    drivers/gpu/drm/panfrost/panfrost_job.c    |  22 ++--
>>>    drivers/gpu/drm/panthor/panthor_mmu.c      |  18 ++-
>>>    drivers/gpu/drm/panthor/panthor_sched.c    |  23 ++--
>>>    drivers/gpu/drm/scheduler/sched_main.c     |  53 +++-----
>>>    drivers/gpu/drm/v3d/v3d_sched.c            | 135 +++++++++++++++-
>>> -----
>>>    drivers/gpu/drm/xe/xe_execlist.c           |  20 ++-
>>>    drivers/gpu/drm/xe/xe_gpu_scheduler.c      |  19 ++-
>>>    include/drm/gpu_scheduler.h                |  35 +++++-
>>>    14 files changed, 311 insertions(+), 139 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>> index cd4fac120834..c1f03eb5f5ea 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>> @@ -2821,6 +2821,9 @@ static int
>>> amdgpu_device_init_schedulers(struct amdgpu_device *adev)
>>>    {
>>>    	long timeout;
>>>    	int r, i;
>>> +	struct drm_sched_init_params params;
>> Please keep the reverse xmas tree ordering for variable declaration.
>> E.g. long lines first and variables like "i" and "r" last.
> Okay dokay
>
>> Apart from that looks like a good idea to me.
>>
>>
>>> +
>>> +	memset(&params, 0, sizeof(struct drm_sched_init_params));
>>>    
>>>    	for (i = 0; i < AMDGPU_MAX_RINGS; ++i) {
>>>    		struct amdgpu_ring *ring = adev->rings[i];
>>> @@ -2844,12 +2847,18 @@ static int
>>> amdgpu_device_init_schedulers(struct amdgpu_device *adev)
>>>    			break;
>>>    		}
>>>    
>>> -		r = drm_sched_init(&ring->sched,
>>> &amdgpu_sched_ops, NULL,
>>> -				   DRM_SCHED_PRIORITY_COUNT,
>>> -				   ring->num_hw_submission, 0,
>>> -				   timeout, adev->reset_domain-
>>>> wq,
>>> -				   ring->sched_score, ring->name,
>>> -				   adev->dev);
>>> +		params.ops = &amdgpu_sched_ops;
>>> +		params.submit_wq = NULL; /* Use the system_wq. */
>>> +		params.num_rqs = DRM_SCHED_PRIORITY_COUNT;
>>> +		params.credit_limit = ring->num_hw_submission;
>>> +		params.hang_limit = 0;
>> Could we please remove the hang limit as first step to get this awful
>> feature deprecated?
> Remove it? From the struct you mean?
>
> We can mark it as deprecated in the docstring of the new struct. That's
> what you mean, don't you?

No, the function using this parameter already deprecated. What I meant 
is to start to completely remove this feature.

The hang_limit basically says how often the scheduler should try to run 
a job over and over again before giving up.

And we already agreed that trying the same thing over and over again and 
expecting different results is the definition of insanity :)

So my suggestion is to drop the parameter and drop the job as soon as it 
caused a timeout.

Regards,
Christian.

>
> P.
>
>> Thanks,
>> Christian.
>>
>>> +		params.timeout = timeout;
>>> +		params.timeout_wq = adev->reset_domain->wq;
>>> +		params.score = ring->sched_score;
>>> +		params.name = ring->name;
>>> +		params.dev = adev->dev;
>>> +
>>> +		r = drm_sched_init(&ring->sched, &params);
>>>    		if (r) {
>>>    			DRM_ERROR("Failed to create scheduler on
>>> ring %s.\n",
>>>    				  ring->name);
>>> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_sched.c
>>> b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
>>> index 5b67eda122db..7d8517f1963e 100644
>>> --- a/drivers/gpu/drm/etnaviv/etnaviv_sched.c
>>> +++ b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
>>> @@ -145,12 +145,22 @@ int etnaviv_sched_push_job(struct
>>> etnaviv_gem_submit *submit)
>>>    int etnaviv_sched_init(struct etnaviv_gpu *gpu)
>>>    {
>>>    	int ret;
>>> +	struct drm_sched_init_params params;
>>>    
>>> -	ret = drm_sched_init(&gpu->sched, &etnaviv_sched_ops,
>>> NULL,
>>> -			     DRM_SCHED_PRIORITY_COUNT,
>>> -			     etnaviv_hw_jobs_limit,
>>> etnaviv_job_hang_limit,
>>> -			     msecs_to_jiffies(500), NULL, NULL,
>>> -			     dev_name(gpu->dev), gpu->dev);
>>> +	memset(&params, 0, sizeof(struct drm_sched_init_params));
>>> +
>>> +	params.ops = &etnaviv_sched_ops;
>>> +	params.submit_wq = NULL; /* Use the system_wq. */
>>> +	params.num_rqs = DRM_SCHED_PRIORITY_COUNT;
>>> +	params.credit_limit = etnaviv_hw_jobs_limit;
>>> +	params.hang_limit = etnaviv_job_hang_limit;
>>> +	params.timeout = msecs_to_jiffies(500);
>>> +	params.timeout_wq = NULL; /* Use the system_wq. */
>>> +	params.score = NULL;
>>> +	params.name = dev_name(gpu->dev);
>>> +	params.dev = gpu->dev;
>>> +
>>> +	ret = drm_sched_init(&gpu->sched, &params);
>>>    	if (ret)
>>>    		return ret;
>>>    
>>> diff --git a/drivers/gpu/drm/imagination/pvr_queue.c
>>> b/drivers/gpu/drm/imagination/pvr_queue.c
>>> index c4f08432882b..03a2ce1a88e7 100644
>>> --- a/drivers/gpu/drm/imagination/pvr_queue.c
>>> +++ b/drivers/gpu/drm/imagination/pvr_queue.c
>>> @@ -1211,10 +1211,13 @@ struct pvr_queue *pvr_queue_create(struct
>>> pvr_context *ctx,
>>>    	};
>>>    	struct pvr_device *pvr_dev = ctx->pvr_dev;
>>>    	struct drm_gpu_scheduler *sched;
>>> +	struct drm_sched_init_params sched_params;
>>>    	struct pvr_queue *queue;
>>>    	int ctx_state_size, err;
>>>    	void *cpu_map;
>>>    
>>> +	memset(&sched_params, 0, sizeof(struct
>>> drm_sched_init_params));
>>> +
>>>    	if (WARN_ON(type >= sizeof(props)))
>>>    		return ERR_PTR(-EINVAL);
>>>    
>>> @@ -1282,12 +1285,18 @@ struct pvr_queue *pvr_queue_create(struct
>>> pvr_context *ctx,
>>>    
>>>    	queue->timeline_ufo.value = cpu_map;
>>>    
>>> -	err = drm_sched_init(&queue->scheduler,
>>> -			     &pvr_queue_sched_ops,
>>> -			     pvr_dev->sched_wq, 1, 64 * 1024, 1,
>>> -			     msecs_to_jiffies(500),
>>> -			     pvr_dev->sched_wq, NULL, "pvr-queue",
>>> -			     pvr_dev->base.dev);
>>> +	sched_params.ops = &pvr_queue_sched_ops;
>>> +	sched_params.submit_wq = pvr_dev->sched_wq;
>>> +	sched_params.num_rqs = 1;
>>> +	sched_params.credit_limit = 64 * 1024;
>>> +	sched_params.hang_limit = 1;
>>> +	sched_params.timeout = msecs_to_jiffies(500);
>>> +	sched_params.timeout_wq = pvr_dev->sched_wq;
>>> +	sched_params.score = NULL;
>>> +	sched_params.name = "pvr-queue";
>>> +	sched_params.dev = pvr_dev->base.dev;
>>> +
>>> +	err = drm_sched_init(&queue->scheduler, &sched_params);
>>>    	if (err)
>>>    		goto err_release_ufo;
>>>    
>>> diff --git a/drivers/gpu/drm/lima/lima_sched.c
>>> b/drivers/gpu/drm/lima/lima_sched.c
>>> index b40c90e97d7e..a64c50fb6d1e 100644
>>> --- a/drivers/gpu/drm/lima/lima_sched.c
>>> +++ b/drivers/gpu/drm/lima/lima_sched.c
>>> @@ -513,20 +513,29 @@ static void lima_sched_recover_work(struct
>>> work_struct *work)
>>>    
>>>    int lima_sched_pipe_init(struct lima_sched_pipe *pipe, const char
>>> *name)
>>>    {
>>> +	struct drm_sched_init_params params;
>>>    	unsigned int timeout = lima_sched_timeout_ms > 0 ?
>>>    			       lima_sched_timeout_ms : 10000;
>>>    
>>> +	memset(&params, 0, sizeof(struct drm_sched_init_params));
>>> +
>>>    	pipe->fence_context = dma_fence_context_alloc(1);
>>>    	spin_lock_init(&pipe->fence_lock);
>>>    
>>>    	INIT_WORK(&pipe->recover_work, lima_sched_recover_work);
>>>    
>>> -	return drm_sched_init(&pipe->base, &lima_sched_ops, NULL,
>>> -			      DRM_SCHED_PRIORITY_COUNT,
>>> -			      1,
>>> -			      lima_job_hang_limit,
>>> -			      msecs_to_jiffies(timeout), NULL,
>>> -			      NULL, name, pipe->ldev->dev);
>>> +	params.ops = &lima_sched_ops;
>>> +	params.submit_wq = NULL; /* Use the system_wq. */
>>> +	params.num_rqs = DRM_SCHED_PRIORITY_COUNT;
>>> +	params.credit_limit = 1;
>>> +	params.hang_limit = lima_job_hang_limit;
>>> +	params.timeout = msecs_to_jiffies(timeout);
>>> +	params.timeout_wq = NULL; /* Use the system_wq. */
>>> +	params.score = NULL;
>>> +	params.name = name;
>>> +	params.dev = pipe->ldev->dev;
>>> +
>>> +	return drm_sched_init(&pipe->base, &params);
>>>    }
>>>    
>>>    void lima_sched_pipe_fini(struct lima_sched_pipe *pipe)
>>> diff --git a/drivers/gpu/drm/msm/msm_ringbuffer.c
>>> b/drivers/gpu/drm/msm/msm_ringbuffer.c
>>> index c803556a8f64..49a2c7422dc6 100644
>>> --- a/drivers/gpu/drm/msm/msm_ringbuffer.c
>>> +++ b/drivers/gpu/drm/msm/msm_ringbuffer.c
>>> @@ -59,11 +59,13 @@ static const struct drm_sched_backend_ops
>>> msm_sched_ops = {
>>>    struct msm_ringbuffer *msm_ringbuffer_new(struct msm_gpu *gpu,
>>> int id,
>>>    		void *memptrs, uint64_t memptrs_iova)
>>>    {
>>> +	struct drm_sched_init_params params;
>>>    	struct msm_ringbuffer *ring;
>>> -	long sched_timeout;
>>>    	char name[32];
>>>    	int ret;
>>>    
>>> +	memset(&params, 0, sizeof(struct drm_sched_init_params));
>>> +
>>>    	/* We assume everywhere that MSM_GPU_RINGBUFFER_SZ is a
>>> power of 2 */
>>>    	BUILD_BUG_ON(!is_power_of_2(MSM_GPU_RINGBUFFER_SZ));
>>>    
>>> @@ -95,13 +97,19 @@ struct msm_ringbuffer
>>> *msm_ringbuffer_new(struct msm_gpu *gpu, int id,
>>>    	ring->memptrs = memptrs;
>>>    	ring->memptrs_iova = memptrs_iova;
>>>    
>>> -	 /* currently managing hangcheck ourselves: */
>>> -	sched_timeout = MAX_SCHEDULE_TIMEOUT;
>>> +	params.ops = &msm_sched_ops;
>>> +	params.submit_wq = NULL; /* Use the system_wq. */
>>> +	params.num_rqs = DRM_SCHED_PRIORITY_COUNT;
>>> +	params.credit_limit = num_hw_submissions;
>>> +	params.hang_limit = 0;
>>> +	/* currently managing hangcheck ourselves: */
>>> +	params.timeout = MAX_SCHEDULE_TIMEOUT;
>>> +	params.timeout_wq = NULL; /* Use the system_wq. */
>>> +	params.score = NULL;
>>> +	params.name = to_msm_bo(ring->bo)->name;
>>> +	params.dev = gpu->dev->dev;
>>>    
>>> -	ret = drm_sched_init(&ring->sched, &msm_sched_ops, NULL,
>>> -			     DRM_SCHED_PRIORITY_COUNT,
>>> -			     num_hw_submissions, 0, sched_timeout,
>>> -			     NULL, NULL, to_msm_bo(ring->bo)-
>>>> name, gpu->dev->dev);
>>> +	ret = drm_sched_init(&ring->sched, &params);
>>>    	if (ret) {
>>>    		goto fail;
>>>    	}
>>> diff --git a/drivers/gpu/drm/nouveau/nouveau_sched.c
>>> b/drivers/gpu/drm/nouveau/nouveau_sched.c
>>> index 4412f2711fb5..f20c2e612750 100644
>>> --- a/drivers/gpu/drm/nouveau/nouveau_sched.c
>>> +++ b/drivers/gpu/drm/nouveau/nouveau_sched.c
>>> @@ -404,9 +404,11 @@ nouveau_sched_init(struct nouveau_sched
>>> *sched, struct nouveau_drm *drm,
>>>    {
>>>    	struct drm_gpu_scheduler *drm_sched = &sched->base;
>>>    	struct drm_sched_entity *entity = &sched->entity;
>>> -	const long timeout =
>>> msecs_to_jiffies(NOUVEAU_SCHED_JOB_TIMEOUT_MS);
>>> +	struct drm_sched_init_params params;
>>>    	int ret;
>>>    
>>> +	memset(&params, 0, sizeof(struct drm_sched_init_params));
>>> +
>>>    	if (!wq) {
>>>    		wq = alloc_workqueue("nouveau_sched_wq_%d", 0,
>>> WQ_MAX_ACTIVE,
>>>    				     current->pid);
>>> @@ -416,10 +418,18 @@ nouveau_sched_init(struct nouveau_sched
>>> *sched, struct nouveau_drm *drm,
>>>    		sched->wq = wq;
>>>    	}
>>>    
>>> -	ret = drm_sched_init(drm_sched, &nouveau_sched_ops, wq,
>>> -			     NOUVEAU_SCHED_PRIORITY_COUNT,
>>> -			     credit_limit, 0, timeout,
>>> -			     NULL, NULL, "nouveau_sched", drm-
>>>> dev->dev);
>>> +	params.ops = &nouveau_sched_ops;
>>> +	params.submit_wq = wq;
>>> +	params.num_rqs = DRM_SCHED_PRIORITY_COUNT;
>>> +	params.credit_limit = credit_limit;
>>> +	params.hang_limit = 0;
>>> +	params.timeout =
>>> msecs_to_jiffies(NOUVEAU_SCHED_JOB_TIMEOUT_MS);
>>> +	params.timeout_wq = NULL; /* Use the system_wq. */
>>> +	params.score = NULL;
>>> +	params.name = "nouveau_sched";
>>> +	params.dev = drm->dev->dev;
>>> +
>>> +	ret = drm_sched_init(drm_sched, &params);
>>>    	if (ret)
>>>    		goto fail_wq;
>>>    
>>> diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c
>>> b/drivers/gpu/drm/panfrost/panfrost_job.c
>>> index 9b8e82fb8bc4..6b509ff446b5 100644
>>> --- a/drivers/gpu/drm/panfrost/panfrost_job.c
>>> +++ b/drivers/gpu/drm/panfrost/panfrost_job.c
>>> @@ -836,10 +836,13 @@ static irqreturn_t
>>> panfrost_job_irq_handler(int irq, void *data)
>>>    
>>>    int panfrost_job_init(struct panfrost_device *pfdev)
>>>    {
>>> +	struct drm_sched_init_params params;
>>>    	struct panfrost_job_slot *js;
>>>    	unsigned int nentries = 2;
>>>    	int ret, j;
>>>    
>>> +	memset(&params, 0, sizeof(struct drm_sched_init_params));
>>> +
>>>    	/* All GPUs have two entries per queue, but without
>>> jobchain
>>>    	 * disambiguation stopping the right job in the close path
>>> is tricky,
>>>    	 * so let's just advertise one entry in that case.
>>> @@ -872,16 +875,21 @@ int panfrost_job_init(struct panfrost_device
>>> *pfdev)
>>>    	if (!pfdev->reset.wq)
>>>    		return -ENOMEM;
>>>    
>>> +	params.ops = &panfrost_sched_ops;
>>> +	params.submit_wq = NULL; /* Use the system_wq. */
>>> +	params.num_rqs = DRM_SCHED_PRIORITY_COUNT;
>>> +	params.credit_limit = nentries;
>>> +	params.hang_limit = 0;
>>> +	params.timeout = msecs_to_jiffies(JOB_TIMEOUT_MS);
>>> +	params.timeout_wq = pfdev->reset.wq;
>>> +	params.score = NULL;
>>> +	params.name = "pan_js";
>>> +	params.dev = pfdev->dev;
>>> +
>>>    	for (j = 0; j < NUM_JOB_SLOTS; j++) {
>>>    		js->queue[j].fence_context =
>>> dma_fence_context_alloc(1);
>>>    
>>> -		ret = drm_sched_init(&js->queue[j].sched,
>>> -				     &panfrost_sched_ops, NULL,
>>> -				     DRM_SCHED_PRIORITY_COUNT,
>>> -				     nentries, 0,
>>> -				
>>> msecs_to_jiffies(JOB_TIMEOUT_MS),
>>> -				     pfdev->reset.wq,
>>> -				     NULL, "pan_js", pfdev->dev);
>>> +		ret = drm_sched_init(&js->queue[j].sched,
>>> &params);
>>>    		if (ret) {
>>>    			dev_err(pfdev->dev, "Failed to create
>>> scheduler: %d.", ret);
>>>    			goto err_sched;
>>> diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c
>>> b/drivers/gpu/drm/panthor/panthor_mmu.c
>>> index a49132f3778b..4362442cbfd8 100644
>>> --- a/drivers/gpu/drm/panthor/panthor_mmu.c
>>> +++ b/drivers/gpu/drm/panthor/panthor_mmu.c
>>> @@ -2268,6 +2268,7 @@ panthor_vm_create(struct panthor_device
>>> *ptdev, bool for_mcu,
>>>    	u64 full_va_range = 1ull << va_bits;
>>>    	struct drm_gem_object *dummy_gem;
>>>    	struct drm_gpu_scheduler *sched;
>>> +	struct drm_sched_init_params sched_params;
>>>    	struct io_pgtable_cfg pgtbl_cfg;
>>>    	u64 mair, min_va, va_range;
>>>    	struct panthor_vm *vm;
>>> @@ -2284,6 +2285,8 @@ panthor_vm_create(struct panthor_device
>>> *ptdev, bool for_mcu,
>>>    		goto err_free_vm;
>>>    	}
>>>    
>>> +	memset(&sched_params, 0, sizeof(struct
>>> drm_sched_init_params));
>>> +
>>>    	mutex_init(&vm->heaps.lock);
>>>    	vm->for_mcu = for_mcu;
>>>    	vm->ptdev = ptdev;
>>> @@ -2325,11 +2328,18 @@ panthor_vm_create(struct panthor_device
>>> *ptdev, bool for_mcu,
>>>    		goto err_mm_takedown;
>>>    	}
>>>    
>>> +	sched_params.ops = &panthor_vm_bind_ops;
>>> +	sched_params.submit_wq = ptdev->mmu->vm.wq;
>>> +	sched_params.num_rqs = 1;
>>> +	sched_params.credit_limit = 1;
>>> +	sched_params.hang_limit = 0;
>>>    	/* Bind operations are synchronous for now, no timeout
>>> needed. */
>>> -	ret = drm_sched_init(&vm->sched, &panthor_vm_bind_ops,
>>> ptdev->mmu->vm.wq,
>>> -			     1, 1, 0,
>>> -			     MAX_SCHEDULE_TIMEOUT, NULL, NULL,
>>> -			     "panthor-vm-bind", ptdev->base.dev);
>>> +	sched_params.timeout = MAX_SCHEDULE_TIMEOUT;
>>> +	sched_params.timeout_wq = NULL; /* Use the system_wq. */
>>> +	sched_params.score = NULL;
>>> +	sched_params.name = "panthor-vm-bind";
>>> +	sched_params.dev = ptdev->base.dev;
>>> +	ret = drm_sched_init(&vm->sched, &sched_params);
>>>    	if (ret)
>>>    		goto err_free_io_pgtable;
>>>    
>>> diff --git a/drivers/gpu/drm/panthor/panthor_sched.c
>>> b/drivers/gpu/drm/panthor/panthor_sched.c
>>> index ef4bec7ff9c7..a324346d302f 100644
>>> --- a/drivers/gpu/drm/panthor/panthor_sched.c
>>> +++ b/drivers/gpu/drm/panthor/panthor_sched.c
>>> @@ -3272,6 +3272,7 @@ group_create_queue(struct panthor_group
>>> *group,
>>>    		   const struct drm_panthor_queue_create *args)
>>>    {
>>>    	struct drm_gpu_scheduler *drm_sched;
>>> +	struct drm_sched_init_params sched_params;
>>>    	struct panthor_queue *queue;
>>>    	int ret;
>>>    
>>> @@ -3289,6 +3290,8 @@ group_create_queue(struct panthor_group
>>> *group,
>>>    	if (!queue)
>>>    		return ERR_PTR(-ENOMEM);
>>>    
>>> +	memset(&sched_params, 0, sizeof(struct
>>> drm_sched_init_params));
>>> +
>>>    	queue->fence_ctx.id = dma_fence_context_alloc(1);
>>>    	spin_lock_init(&queue->fence_ctx.lock);
>>>    	INIT_LIST_HEAD(&queue->fence_ctx.in_flight_jobs);
>>> @@ -3341,17 +3344,23 @@ group_create_queue(struct panthor_group
>>> *group,
>>>    	if (ret)
>>>    		goto err_free_queue;
>>>    
>>> +	sched_params.ops = &panthor_queue_sched_ops;
>>> +	sched_params.submit_wq = group->ptdev->scheduler->wq;
>>> +	sched_params.num_rqs = 1;
>>>    	/*
>>> -	 * Credit limit argument tells us the total number of
>>> instructions
>>> +	 * The credit limit argument tells us the total number of
>>> instructions
>>>    	 * across all CS slots in the ringbuffer, with some jobs
>>> requiring
>>>    	 * twice as many as others, depending on their profiling
>>> status.
>>>    	 */
>>> -	ret = drm_sched_init(&queue->scheduler,
>>> &panthor_queue_sched_ops,
>>> -			     group->ptdev->scheduler->wq, 1,
>>> -			     args->ringbuf_size / sizeof(u64),
>>> -			     0, msecs_to_jiffies(JOB_TIMEOUT_MS),
>>> -			     group->ptdev->reset.wq,
>>> -			     NULL, "panthor-queue", group->ptdev-
>>>> base.dev);
>>> +	sched_params.credit_limit = args->ringbuf_size /
>>> sizeof(u64);
>>> +	sched_params.hang_limit = 0;
>>> +	sched_params.timeout = msecs_to_jiffies(JOB_TIMEOUT_MS);
>>> +	sched_params.timeout_wq = group->ptdev->reset.wq;
>>> +	sched_params.score = NULL;
>>> +	sched_params.name = "panthor-queue";
>>> +	sched_params.dev = group->ptdev->base.dev;
>>> +
>>> +	ret = drm_sched_init(&queue->scheduler, &sched_params);
>>>    	if (ret)
>>>    		goto err_free_queue;
>>>    
>>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c
>>> b/drivers/gpu/drm/scheduler/sched_main.c
>>> index 57da84908752..27db748a5269 100644
>>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>>> @@ -1240,40 +1240,25 @@ static void drm_sched_run_job_work(struct
>>> work_struct *w)
>>>     * drm_sched_init - Init a gpu scheduler instance
>>>     *
>>>     * @sched: scheduler instance
>>> - * @ops: backend operations for this scheduler
>>> - * @submit_wq: workqueue to use for submission. If NULL, an
>>> ordered wq is
>>> - *	       allocated and used
>>> - * @num_rqs: number of runqueues, one for each priority, up to
>>> DRM_SCHED_PRIORITY_COUNT
>>> - * @credit_limit: the number of credits this scheduler can hold
>>> from all jobs
>>> - * @hang_limit: number of times to allow a job to hang before
>>> dropping it
>>> - * @timeout: timeout value in jiffies for the scheduler
>>> - * @timeout_wq: workqueue to use for timeout work. If NULL, the
>>> system_wq is
>>> - *		used
>>> - * @score: optional score atomic shared with other schedulers
>>> - * @name: name used for debugging
>>> - * @dev: target &struct device
>>> + * @params: scheduler initialization parameters
>>>     *
>>>     * Return 0 on success, otherwise error code.
>>>     */
>>>    int drm_sched_init(struct drm_gpu_scheduler *sched,
>>> -		   const struct drm_sched_backend_ops *ops,
>>> -		   struct workqueue_struct *submit_wq,
>>> -		   u32 num_rqs, u32 credit_limit, unsigned int
>>> hang_limit,
>>> -		   long timeout, struct workqueue_struct
>>> *timeout_wq,
>>> -		   atomic_t *score, const char *name, struct
>>> device *dev)
>>> +		const struct drm_sched_init_params *params)
>>>    {
>>>    	int i;
>>>    
>>> -	sched->ops = ops;
>>> -	sched->credit_limit = credit_limit;
>>> -	sched->name = name;
>>> -	sched->timeout = timeout;
>>> -	sched->timeout_wq = timeout_wq ? : system_wq;
>>> -	sched->hang_limit = hang_limit;
>>> -	sched->score = score ? score : &sched->_score;
>>> -	sched->dev = dev;
>>> +	sched->ops = params->ops;
>>> +	sched->credit_limit = params->credit_limit;
>>> +	sched->name = params->name;
>>> +	sched->timeout = params->timeout;
>>> +	sched->timeout_wq = params->timeout_wq ? : system_wq;
>>> +	sched->hang_limit = params->hang_limit;
>>> +	sched->score = params->score ? params->score : &sched-
>>>> _score;
>>> +	sched->dev = params->dev;
>>>    
>>> -	if (num_rqs > DRM_SCHED_PRIORITY_COUNT) {
>>> +	if (params->num_rqs > DRM_SCHED_PRIORITY_COUNT) {
>>>    		/* This is a gross violation--tell drivers what
>>> the  problem is.
>>>    		 */
>>>    		drm_err(sched, "%s: num_rqs cannot be greater than
>>> DRM_SCHED_PRIORITY_COUNT\n",
>>> @@ -1288,16 +1273,16 @@ int drm_sched_init(struct drm_gpu_scheduler
>>> *sched,
>>>    		return 0;
>>>    	}
>>>    
>>> -	if (submit_wq) {
>>> -		sched->submit_wq = submit_wq;
>>> +	if (params->submit_wq) {
>>> +		sched->submit_wq = params->submit_wq;
>>>    		sched->own_submit_wq = false;
>>>    	} else {
>>>    #ifdef CONFIG_LOCKDEP
>>> -		sched->submit_wq =
>>> alloc_ordered_workqueue_lockdep_map(name,
>>> -
>>> 								       WQ_MEM_RECLAIM,
>>> -
>>> 								       &drm_sched_lockdep_map);
>>> +		sched->submit_wq =
>>> alloc_ordered_workqueue_lockdep_map(
>>> +					params->name,
>>> WQ_MEM_RECLAIM,
>>> +					&drm_sched_lockdep_map);
>>>    #else
>>> -		sched->submit_wq = alloc_ordered_workqueue(name,
>>> WQ_MEM_RECLAIM);
>>> +		sched->submit_wq = alloc_ordered_workqueue(params-
>>>> name, WQ_MEM_RECLAIM);
>>>    #endif
>>>    		if (!sched->submit_wq)
>>>    			return -ENOMEM;
>>> @@ -1305,11 +1290,11 @@ int drm_sched_init(struct drm_gpu_scheduler
>>> *sched,
>>>    		sched->own_submit_wq = true;
>>>    	}
>>>    
>>> -	sched->sched_rq = kmalloc_array(num_rqs, sizeof(*sched-
>>>> sched_rq),
>>> +	sched->sched_rq = kmalloc_array(params->num_rqs,
>>> sizeof(*sched->sched_rq),
>>>    					GFP_KERNEL | __GFP_ZERO);
>>>    	if (!sched->sched_rq)
>>>    		goto Out_check_own;
>>> -	sched->num_rqs = num_rqs;
>>> +	sched->num_rqs = params->num_rqs;
>>>    	for (i = DRM_SCHED_PRIORITY_KERNEL; i < sched->num_rqs;
>>> i++) {
>>>    		sched->sched_rq[i] = kzalloc(sizeof(*sched-
>>>> sched_rq[i]), GFP_KERNEL);
>>>    		if (!sched->sched_rq[i])
>>> diff --git a/drivers/gpu/drm/v3d/v3d_sched.c
>>> b/drivers/gpu/drm/v3d/v3d_sched.c
>>> index 99ac4995b5a1..716e6d074d87 100644
>>> --- a/drivers/gpu/drm/v3d/v3d_sched.c
>>> +++ b/drivers/gpu/drm/v3d/v3d_sched.c
>>> @@ -814,67 +814,124 @@ static const struct drm_sched_backend_ops
>>> v3d_cpu_sched_ops = {
>>>    	.free_job = v3d_cpu_job_free
>>>    };
>>>    
>>> +/*
>>> + * v3d's scheduler instances are all identical, except for ops and
>>> name.
>>> + */
>>> +static void
>>> +v3d_common_sched_init(struct drm_sched_init_params *params, struct
>>> device *dev)
>>> +{
>>> +	memset(params, 0, sizeof(struct drm_sched_init_params));
>>> +
>>> +	params->submit_wq = NULL; /* Use the system_wq. */
>>> +	params->num_rqs = DRM_SCHED_PRIORITY_COUNT;
>>> +	params->credit_limit = 1;
>>> +	params->hang_limit = 0;
>>> +	params->timeout = msecs_to_jiffies(500);
>>> +	params->timeout_wq = NULL; /* Use the system_wq. */
>>> +	params->score = NULL;
>>> +	params->dev = dev;
>>> +}
>>> +
>>> +static int
>>> +v3d_bin_sched_init(struct v3d_dev *v3d)
>>> +{
>>> +	struct drm_sched_init_params params;
>>> +
>>> +	v3d_common_sched_init(&params, v3d->drm.dev);
>>> +	params.ops = &v3d_bin_sched_ops;
>>> +	params.name = "v3d_bin";
>>> +
>>> +	return drm_sched_init(&v3d->queue[V3D_BIN].sched,
>>> &params);
>>> +}
>>> +
>>> +static int
>>> +v3d_render_sched_init(struct v3d_dev *v3d)
>>> +{
>>> +	struct drm_sched_init_params params;
>>> +
>>> +	v3d_common_sched_init(&params, v3d->drm.dev);
>>> +	params.ops = &v3d_render_sched_ops;
>>> +	params.name = "v3d_render";
>>> +
>>> +	return drm_sched_init(&v3d->queue[V3D_RENDER].sched,
>>> &params);
>>> +}
>>> +
>>> +static int
>>> +v3d_tfu_sched_init(struct v3d_dev *v3d)
>>> +{
>>> +	struct drm_sched_init_params params;
>>> +
>>> +	v3d_common_sched_init(&params, v3d->drm.dev);
>>> +	params.ops = &v3d_tfu_sched_ops;
>>> +	params.name = "v3d_tfu";
>>> +
>>> +	return drm_sched_init(&v3d->queue[V3D_TFU].sched,
>>> &params);
>>> +}
>>> +
>>> +static int
>>> +v3d_csd_sched_init(struct v3d_dev *v3d)
>>> +{
>>> +	struct drm_sched_init_params params;
>>> +
>>> +	v3d_common_sched_init(&params, v3d->drm.dev);
>>> +	params.ops = &v3d_csd_sched_ops;
>>> +	params.name = "v3d_csd";
>>> +
>>> +	return drm_sched_init(&v3d->queue[V3D_CSD].sched,
>>> &params);
>>> +}
>>> +
>>> +static int
>>> +v3d_cache_sched_init(struct v3d_dev *v3d)
>>> +{
>>> +	struct drm_sched_init_params params;
>>> +
>>> +	v3d_common_sched_init(&params, v3d->drm.dev);
>>> +	params.ops = &v3d_cache_clean_sched_ops;
>>> +	params.name = "v3d_cache_clean";
>>> +
>>> +	return drm_sched_init(&v3d->queue[V3D_CACHE_CLEAN].sched,
>>> &params);
>>> +}
>>> +
>>> +static int
>>> +v3d_cpu_sched_init(struct v3d_dev *v3d)
>>> +{
>>> +	struct drm_sched_init_params params;
>>> +
>>> +	v3d_common_sched_init(&params, v3d->drm.dev);
>>> +	params.ops = &v3d_cpu_sched_ops;
>>> +	params.name = "v3d_cpu";
>>> +
>>> +	return drm_sched_init(&v3d->queue[V3D_CPU].sched,
>>> &params);
>>> +}
>>> +
>>>    int
>>>    v3d_sched_init(struct v3d_dev *v3d)
>>>    {
>>> -	int hw_jobs_limit = 1;
>>> -	int job_hang_limit = 0;
>>> -	int hang_limit_ms = 500;
>>>    	int ret;
>>>    
>>> -	ret = drm_sched_init(&v3d->queue[V3D_BIN].sched,
>>> -			     &v3d_bin_sched_ops, NULL,
>>> -			     DRM_SCHED_PRIORITY_COUNT,
>>> -			     hw_jobs_limit, job_hang_limit,
>>> -			     msecs_to_jiffies(hang_limit_ms),
>>> NULL,
>>> -			     NULL, "v3d_bin", v3d->drm.dev);
>>> +	ret = v3d_bin_sched_init(v3d);
>>>    	if (ret)
>>>    		return ret;
>>>    
>>> -	ret = drm_sched_init(&v3d->queue[V3D_RENDER].sched,
>>> -			     &v3d_render_sched_ops, NULL,
>>> -			     DRM_SCHED_PRIORITY_COUNT,
>>> -			     hw_jobs_limit, job_hang_limit,
>>> -			     msecs_to_jiffies(hang_limit_ms),
>>> NULL,
>>> -			     NULL, "v3d_render", v3d->drm.dev);
>>> +	ret = v3d_render_sched_init(v3d);
>>>    	if (ret)
>>>    		goto fail;
>>>    
>>> -	ret = drm_sched_init(&v3d->queue[V3D_TFU].sched,
>>> -			     &v3d_tfu_sched_ops, NULL,
>>> -			     DRM_SCHED_PRIORITY_COUNT,
>>> -			     hw_jobs_limit, job_hang_limit,
>>> -			     msecs_to_jiffies(hang_limit_ms),
>>> NULL,
>>> -			     NULL, "v3d_tfu", v3d->drm.dev);
>>> +	ret = v3d_tfu_sched_init(v3d);
>>>    	if (ret)
>>>    		goto fail;
>>>    
>>>    	if (v3d_has_csd(v3d)) {
>>> -		ret = drm_sched_init(&v3d->queue[V3D_CSD].sched,
>>> -				     &v3d_csd_sched_ops, NULL,
>>> -				     DRM_SCHED_PRIORITY_COUNT,
>>> -				     hw_jobs_limit,
>>> job_hang_limit,
>>> -				
>>> msecs_to_jiffies(hang_limit_ms), NULL,
>>> -				     NULL, "v3d_csd", v3d-
>>>> drm.dev);
>>> +		ret = v3d_csd_sched_init(v3d);
>>>    		if (ret)
>>>    			goto fail;
>>>    
>>> -		ret = drm_sched_init(&v3d-
>>>> queue[V3D_CACHE_CLEAN].sched,
>>> -				     &v3d_cache_clean_sched_ops,
>>> NULL,
>>> -				     DRM_SCHED_PRIORITY_COUNT,
>>> -				     hw_jobs_limit,
>>> job_hang_limit,
>>> -				
>>> msecs_to_jiffies(hang_limit_ms), NULL,
>>> -				     NULL, "v3d_cache_clean", v3d-
>>>> drm.dev);
>>> +		ret = v3d_cache_sched_init(v3d);
>>>    		if (ret)
>>>    			goto fail;
>>>    	}
>>>    
>>> -	ret = drm_sched_init(&v3d->queue[V3D_CPU].sched,
>>> -			     &v3d_cpu_sched_ops, NULL,
>>> -			     DRM_SCHED_PRIORITY_COUNT,
>>> -			     1, job_hang_limit,
>>> -			     msecs_to_jiffies(hang_limit_ms),
>>> NULL,
>>> -			     NULL, "v3d_cpu", v3d->drm.dev);
>>> +	ret = v3d_cpu_sched_init(v3d);
>>>    	if (ret)
>>>    		goto fail;
>>>    
>>> diff --git a/drivers/gpu/drm/xe/xe_execlist.c
>>> b/drivers/gpu/drm/xe/xe_execlist.c
>>> index a8c416a48812..7f29b7f04af4 100644
>>> --- a/drivers/gpu/drm/xe/xe_execlist.c
>>> +++ b/drivers/gpu/drm/xe/xe_execlist.c
>>> @@ -332,10 +332,13 @@ static const struct drm_sched_backend_ops
>>> drm_sched_ops = {
>>>    static int execlist_exec_queue_init(struct xe_exec_queue *q)
>>>    {
>>>    	struct drm_gpu_scheduler *sched;
>>> +	struct drm_sched_init_params params;
>>>    	struct xe_execlist_exec_queue *exl;
>>>    	struct xe_device *xe = gt_to_xe(q->gt);
>>>    	int err;
>>>    
>>> +	memset(&params, 0, sizeof(struct drm_sched_init_params));
>>> +
>>>    	xe_assert(xe, !xe_device_uc_enabled(xe));
>>>    
>>>    	drm_info(&xe->drm, "Enabling execlist submission (GuC
>>> submission disabled)\n");
>>> @@ -346,11 +349,18 @@ static int execlist_exec_queue_init(struct
>>> xe_exec_queue *q)
>>>    
>>>    	exl->q = q;
>>>    
>>> -	err = drm_sched_init(&exl->sched, &drm_sched_ops, NULL, 1,
>>> -			     q->lrc[0]->ring.size /
>>> MAX_JOB_SIZE_BYTES,
>>> -			     XE_SCHED_HANG_LIMIT,
>>> XE_SCHED_JOB_TIMEOUT,
>>> -			     NULL, NULL, q->hwe->name,
>>> -			     gt_to_xe(q->gt)->drm.dev);
>>> +	params.ops = &drm_sched_ops;
>>> +	params.submit_wq = NULL; /* Use the system_wq. */
>>> +	params.num_rqs = 1;
>>> +	params.credit_limit = q->lrc[0]->ring.size /
>>> MAX_JOB_SIZE_BYTES;
>>> +	params.hang_limit = XE_SCHED_HANG_LIMIT;
>>> +	params.timeout = XE_SCHED_JOB_TIMEOUT;
>>> +	params.timeout_wq = NULL; /* Use the system_wq. */
>>> +	params.score = NULL;
>>> +	params.name = q->hwe->name;
>>> +	params.dev = gt_to_xe(q->gt)->drm.dev;
>>> +
>>> +	err = drm_sched_init(&exl->sched, &params);
>>>    	if (err)
>>>    		goto err_free;
>>>    
>>> diff --git a/drivers/gpu/drm/xe/xe_gpu_scheduler.c
>>> b/drivers/gpu/drm/xe/xe_gpu_scheduler.c
>>> index 50361b4638f9..2129fee83f25 100644
>>> --- a/drivers/gpu/drm/xe/xe_gpu_scheduler.c
>>> +++ b/drivers/gpu/drm/xe/xe_gpu_scheduler.c
>>> @@ -63,13 +63,26 @@ int xe_sched_init(struct xe_gpu_scheduler
>>> *sched,
>>>    		  atomic_t *score, const char *name,
>>>    		  struct device *dev)
>>>    {
>>> +	struct drm_sched_init_params params;
>>> +
>>>    	sched->ops = xe_ops;
>>>    	INIT_LIST_HEAD(&sched->msgs);
>>>    	INIT_WORK(&sched->work_process_msg,
>>> xe_sched_process_msg_work);
>>>    
>>> -	return drm_sched_init(&sched->base, ops, submit_wq, 1,
>>> hw_submission,
>>> -			      hang_limit, timeout, timeout_wq,
>>> score, name,
>>> -			      dev);
>>> +	memset(&params, 0, sizeof(struct drm_sched_init_params));
>>> +
>>> +	params.ops = ops;
>>> +	params.submit_wq = submit_wq;
>>> +	params.num_rqs = 1;
>>> +	params.credit_limit = hw_submission;
>>> +	params.hang_limit = hang_limit;
>>> +	params.timeout = timeout;
>>> +	params.timeout_wq = timeout_wq;
>>> +	params.score = score;
>>> +	params.name = name;
>>> +	params.dev = dev;
>>> +
>>> +	return drm_sched_init(&sched->base, &params);
>>>    }
>>>    
>>>    void xe_sched_fini(struct xe_gpu_scheduler *sched)
>>> diff --git a/include/drm/gpu_scheduler.h
>>> b/include/drm/gpu_scheduler.h
>>> index 95e17504e46a..1a834ef43862 100644
>>> --- a/include/drm/gpu_scheduler.h
>>> +++ b/include/drm/gpu_scheduler.h
>>> @@ -553,12 +553,37 @@ struct drm_gpu_scheduler {
>>>    	struct device			*dev;
>>>    };
>>>    
>>> +/**
>>> + * struct drm_sched_init_params - parameters for initializing a
>>> DRM GPU scheduler
>>> + *
>>> + * @ops: backend operations provided by the driver
>>> + * @submit_wq: workqueue to use for submission. If NULL, an
>>> ordered wq is
>>> + *	       allocated and used
>>> + * @num_rqs: Number of run-queues. This is at most
>>> DRM_SCHED_PRIORITY_COUNT,
>>> + *           as there's usually one run-queue per priority, but
>>> could be less.
>>> + * @credit_limit: the number of credits this scheduler can hold
>>> from all jobs
>>> + * @hang_limit: number of times to allow a job to hang before
>>> dropping it
>>> + * @timeout: timeout value in jiffies for the scheduler
>>> + * @timeout_wq: workqueue to use for timeout work. If NULL, the
>>> system_wq is
>>> + *		used
>>> + * @score: optional score atomic shared with other schedulers
>>> + * @name: name used for debugging
>>> + * @dev: associated device. Used for debugging
>>> + */
>>> +struct drm_sched_init_params {
>>> +	const struct drm_sched_backend_ops *ops;
>>> +	struct workqueue_struct *submit_wq;
>>> +	struct workqueue_struct *timeout_wq;
>>> +	u32 num_rqs, credit_limit;
>>> +	unsigned int hang_limit;
>>> +	long timeout;
>>> +	atomic_t *score;
>>> +	const char *name;
>>> +	struct device *dev;
>>> +};
>>> +
>>>    int drm_sched_init(struct drm_gpu_scheduler *sched,
>>> -		   const struct drm_sched_backend_ops *ops,
>>> -		   struct workqueue_struct *submit_wq,
>>> -		   u32 num_rqs, u32 credit_limit, unsigned int
>>> hang_limit,
>>> -		   long timeout, struct workqueue_struct
>>> *timeout_wq,
>>> -		   atomic_t *score, const char *name, struct
>>> device *dev);
>>> +		const struct drm_sched_init_params *params);
>>>    
>>>    void drm_sched_fini(struct drm_gpu_scheduler *sched);
>>>    int drm_sched_job_init(struct drm_sched_job *job,

