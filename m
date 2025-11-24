Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31EC3C82D96
	for <lists+dri-devel@lfdr.de>; Tue, 25 Nov 2025 00:46:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 414E610E273;
	Mon, 24 Nov 2025 23:46:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="kttSZiFW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11010045.outbound.protection.outlook.com [52.101.201.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD18B10E272;
 Mon, 24 Nov 2025 23:46:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Boziv/nzjWLq6ostmlFedbXN6fEqghvUMCh5oWhDkn9McczCA37lKNKx6P0YlYK+rh8rY7qDosGp5vhCvWCzMwNlLbRQjQs3uG64oZkBKnl+VJNCBR28rMMOmXHdsprC7A3Ex+7MV/nsB3tF1ltIhno+ldUjM1V5yMzPSXS7+7OZ4r6drb3AxZqtD1LT0hFOUPuD+lbjXQ30lr8zJAQsCkPwzS9L1Xt9PIimOaYiiXP76V3aSlEedBdPlPPWKP1K/6dRLzt8uqxUDpG7WxYHgR35d7MRD86Z3+m2CawQox1XFwkQgPdd8G4ouMCkyAkm+17KL8FV1VLz36Udusqt9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=06gdeqhWV3jBwAAjgUGljbBOXff00n3pJiJJv3FhqH8=;
 b=l3MapVFvO1FtjvCOmXSLnd5WRHsoGHKI16kHUj2iAWke/ciI7JNWQB1d1otNqt3tgAr7sY33CkwHRlJLewXH4hpmJ2JY1xojBjwsJx3GxP9PzdG8lbwHl4ZuyisvlgikddWJCt4Tz+Uov30otD+Shgr0FL6jNbWFvP2CZEMHnXB1/nhF/wU2Xnw64STS+yKX1eVBYGgSN3VrQV8HCAWUgV92r8+QMCE7Qht1xGF8F0YH8FLznN8E3EYoAoqMKXZdFGPgYQizadW7YIdV+dzfewAVF5594A/qNdHWTJ97p5iH+BlKjiRL05CaEirP8r631ExJAiN/i2/2lsmxT2CCsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=06gdeqhWV3jBwAAjgUGljbBOXff00n3pJiJJv3FhqH8=;
 b=kttSZiFWc/bmlnVACjp/PwO9KzaoJSgyMxlX7PI81cI6mB0IDrAuKdSlqCkXDExdCZYUV4sAHRfNVyF2VTicxZWQXPwjLkdFgxpWaVr6/sMWdHaZt35cz5AKD/r3o6gagNqanAAUiyZqQCuIxZKhGhO22L6ab7ZaxR0okzzNtZbporbdaCn23M4XcNut9mbEj+qS5BQmkbhu5aPJ8LoRa3lLUtIFyc8NddQMX1oSqM9mD6aDGV95B85uwKHEB/skTQLrYo/ToJBZQsYrSQoonz7zyXaapxZiIMv9DkT92VgUPVMI58vftFXi836wnhGBOaxTijv3UoxC4x7smZvEHA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by IA1PR12MB6578.namprd12.prod.outlook.com (2603:10b6:208:3a2::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.17; Mon, 24 Nov
 2025 23:46:23 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9343.016; Mon, 24 Nov 2025
 23:46:23 +0000
Message-ID: <410ecd09-af28-4fb3-854e-09fa9cc9313b@nvidia.com>
Date: Mon, 24 Nov 2025 18:46:20 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] gpu: Move DRM buddy allocator one level up
To: linux-kernel@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jonathan Corbet <corbet@lwn.net>, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, Huang Rui <ray.huang@amd.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Helge Deller <deller@gmx.de>
Cc: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>, John Hubbard <jhubbard@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 Edwin Peer <epeer@nvidia.com>, Alexandre Courbot <acourbot@nvidia.com>,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, linux-fbdev@vger.kernel.org
References: <20251124234432.1988476-1-joelagnelf@nvidia.com>
Content-Language: en-US
From: Joel Fernandes <joelagnelf@nvidia.com>
In-Reply-To: <20251124234432.1988476-1-joelagnelf@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MN0PR04CA0027.namprd04.prod.outlook.com
 (2603:10b6:208:52d::16) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|IA1PR12MB6578:EE_
X-MS-Office365-Filtering-Correlation-Id: 334ae011-e9db-46ad-72a2-08de2bb3ad0f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|7416014|376014|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?c3l0bkc4S0pNZUplb3pRbklYQmRMdGtPUXNtL2dDcllScC9LaWJtV0pqR3lz?=
 =?utf-8?B?SmdLOE9adVhqVlBOT3ZRZE9iZFZwVVcyVUtreDkvaG03enZYQ20zcURMbE5I?=
 =?utf-8?B?QnlBcnpIT3I3NWV3NlJ1bERGUGx2NTByYkhONXIxNmdsUG5FUHk4WndCc004?=
 =?utf-8?B?cllGNU5VNk1haWFSVHRuMlNlS0VKcWdqN3RFOEprT0h6OGJicVNYK2llcUw3?=
 =?utf-8?B?ZmxueWtGR2RDamVpWngzbWJmWkUzSDc3MitHSDR0dWxwV2ZJYUVtRUhGWWd5?=
 =?utf-8?B?OXNTaUptdlZZL1Blak1EdklWdGFhZnJBblFTbnc3SVNZdWVQdm5PVVFRdCtY?=
 =?utf-8?B?V1dBSXFGREJ1d0JtZ0RIUVROK0hhZ0hvMXh4VDFRQk9sTEdra25vaXNFaWdl?=
 =?utf-8?B?R1JLdkNSTFJWWlQ1R2tkN01iaDgzcFZBSGZaWDB6eGRONHFRakJwNnVQOUNh?=
 =?utf-8?B?bStjcFNTZ3JxRDhzZTVPNlo5dDVERFhZLzlvRzM1cit5Sllud3QveVRTbWYx?=
 =?utf-8?B?d0V2V01pZCttbWo3RFZpQWJqOTJ3NThEeDZtNlpTRVpiZ2pFL3ZGbmY4RGNi?=
 =?utf-8?B?ZkNUcCtLTkNLeFFBcStlRGFZS1lvb0hyQytTbFZUL2JTMXo3Y0tIZksvQ1N4?=
 =?utf-8?B?clBwUUwvcWZubFhEMHhhMTlHNTNWWWFnYkVGWFpQSE5zWXpnbXBpam95ckRx?=
 =?utf-8?B?WU9rMkZWK0czQ0RwSVF2bGRaejVUZ2VmdW9BcGZiU28yVVl5VUozdTA1M0Nx?=
 =?utf-8?B?enJQai9DNXV5Wmp3THYyQ3pUWVV0aXc3OE1MTU94b1gyM2FVV1NZU294Y1hM?=
 =?utf-8?B?RlRzeGx2WmxkSFVTa0l1UGZvRWsvSEhIU2M0NTVYbjFGalI0QWVIZ3dCcCsy?=
 =?utf-8?B?THBOWHNEblppVXN6S0VtQnRnQllkQ3JDRCs3bnZseVQwVDhDWkZWMjZSV2Z2?=
 =?utf-8?B?bEk1RlNPejFBNzZXSTRWd1BxbFNaRWFhYU5IYVZZeWQ3ejlNUzZYakZEUXIw?=
 =?utf-8?B?QXlUTUg3dVdSSzhZd1RiZWd1M0tyTTRabEZEVXZXMTRoSTROL1hiMkhFTlJ1?=
 =?utf-8?B?MGJGSkd5WlVuVlN3bWtWWkM3a2prN3liY2dmcS8rV1NIbG52RFUyZWFSVDFu?=
 =?utf-8?B?dmxUc0ZnVWFqdGkwTHJkRUhnWXlTaW1ZNGVSWGI5bFQxZkVqdzE0WlgwckI4?=
 =?utf-8?B?a3lCcGYvYUFEVHN0d084TTIrTHNYL0RNTXNrbGpUTnBuOER0cjlwRDRDenNM?=
 =?utf-8?B?THAvVkhxSTlGRnlaSkQ0cnUyeThkQnMzZVBBdWViem1qaEJiUXZCNjlvSDBw?=
 =?utf-8?B?Y1JOY1lqUjBobk8xbTlCeXBxMDN2ZVdFYk5QQnRuaTFQc0JQZHhiRUJROWVu?=
 =?utf-8?B?c2gvblFOdVhVd1ZTeHRTTzBsUk9PRzYwK3pkQ2hscFlCek50eFRKcE9YNVVk?=
 =?utf-8?B?UXZWY25UUlhZbTZvMVlBalpvQzVqSWtlZHlEb1VGUG5hUFlKdXB6ektaa3l2?=
 =?utf-8?B?NzRtQjBBYWlFWlQrNGM1TEdJeEx2WWZ4V2tPbXVrLytkd0UvNkRhSSs1anlw?=
 =?utf-8?B?MXhYajNkUjYxTDFYT1J1dHdUOXpXdHFWZE5TTDdkWWNVOTg5YlQxN3R5cHNt?=
 =?utf-8?B?QkdTWUNzR25ZSnF1eUJnYkJZcVh4dDZEek9xc3IrM21oK3FsaHpKc0lkSThV?=
 =?utf-8?B?QmlIZDFyeGxuL2RSR1BjU0xPYUJEVENDSTIxVXlpelE0SlRnanpxMFpGNFRT?=
 =?utf-8?B?UmpIbUIvWTBMeWxTaGFyUElqM29ya3ZVZ2dybzE0c0w5d3hwU1BaRHhnSGJL?=
 =?utf-8?B?Y2ljVDVkYWNkMDZQZEdQUFFXL1E2M2ZWWmxyZy84azRsTlY5dmFqNWJzZHBE?=
 =?utf-8?B?c0toYWdZUFpJWG5aaVZrUUgzRW5HZUZRdmdqYi9QNHlVZ3hnR1VieDBzT0Vs?=
 =?utf-8?B?ZUxRRHJOVGEvQ3BoYm9OVmxOVXlpU1FZb2pVWFR2S1gwd2dTVlZ1NE9ObkJZ?=
 =?utf-8?Q?348/XSLYQs5ZYjp15DT2yEMSGa03Oc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L0lzSk9sV0huaGI2U3k5SlRvSUZWZ0VtTkwwRVJvVzA5QW1wSGVnUW90NEw5?=
 =?utf-8?B?S0k1Y0ZocUlidGNIYmtYWUd2SERRNEE4YStXZVhpNFcycHNXVTVLTHV6OHls?=
 =?utf-8?B?cjJhTS9UUVpvUVpQMHdTK2toVHBmTEFvanVhNjhicWVUN2ExcStQMVlXRXZa?=
 =?utf-8?B?Zm5mVWFJaHhadGY2MzJYa1B1QWlEM0t2YnBUek9kbUwzMzE4VTJmdGRqSHg2?=
 =?utf-8?B?S3ZZdWNvUHUyblM0Wi81azJsOW9NeE9PZjZ2YlREdzFmYzNRZllBKzR5QUtR?=
 =?utf-8?B?bnZCTCtJM3p6cUZCb3ZGRzV4V3pxZHNLUDZGRTBMZWlzTmZvSDBNbEl4bmhM?=
 =?utf-8?B?Mkc5Q3QvMzQ3alpscldVVUQzYy95YXR4dmtvUmV5dGNYOFVPckJnT1NPVWRF?=
 =?utf-8?B?NndSUVBRaE9FZ0FHd0JRNVVhY3lXNStQSkhIcWZ5RkZwSFdyMnY1SUNlT0Vw?=
 =?utf-8?B?QS9XczA4cklRS1NRUmZzUUhGVGRvcG9aR3RBU1FJaEc0dVNTMXZCVFNEU2Ra?=
 =?utf-8?B?OGkxWm10TXNoY0F1WEpRa1pOUTVmQllTVU84V28zZkNsQmVKK3IvbGhEL3ZD?=
 =?utf-8?B?dDFyV2hSSWZLY0pSQVkzL0VxZHlTcTBURnJHT1BWTkExRlZpMUxOZVdPaHpP?=
 =?utf-8?B?cEFreW01UUtqNDQ3cWRHaGlZbkRBaVIvK0c4dGVuMG5vUXRuOWZyYmFaUGFt?=
 =?utf-8?B?QmRQMUdYV3cwWStqRFJtT0N3cUhEcU1NRGU2MmUyYWF2M0JCZ0hWbWZFSWRY?=
 =?utf-8?B?enNXNWx4OEhTQkZhUmVYdWhhdS95RUNQbEJWZ2ZmLzZPSW5YUHpjS0xSemUr?=
 =?utf-8?B?YkZPclhhdnlqTU05Z0hXVjhsbmttNzJPcnRhY0xIWEZkOEw0MFhsbW5nUVNF?=
 =?utf-8?B?N084TkJicE93dG0xZ3VaNHNVWTFCb09yaW5mUEdBSnpWSGluUnpuQUFGZlhE?=
 =?utf-8?B?TVR2VWhQc1V5c0VybFA0QkZ0bU5nNUUwR3NYRTFvVlNzZjVoaysvcy9Kejcy?=
 =?utf-8?B?NVJTemIxdWU5NnJhUHVxajVNcnp1ZER6K3Zmb3BlazdGWG9GejB5Uzc0dVF0?=
 =?utf-8?B?U1VJVlRvVE9OMmRhKzVuYkRUT1hZcjZvbjk4WHdSOEUvQUxVOEdhQ2pLMll3?=
 =?utf-8?B?Z1lqaEZUQlZDbjJxMTJmK291NGNTWjFnOGRUL1lURW9ibmhzY1ZaMFdreWVW?=
 =?utf-8?B?b0ROMW1ucWlEVVJObXJKVitFbHNYNmxXNVJnUmxVYXhqS0RSWXFwdTNlMy9J?=
 =?utf-8?B?MWZpS0lRem4wRmRRMU9KbldLamtlU1htcFprRVBFMXAra2NPM0dxY3RNZ1Fp?=
 =?utf-8?B?MUJRTXZXalFOZWo1SlMwTUpGSnhBWC9yRkJyQ0tOUnJybDFISFdFUXpYdFA0?=
 =?utf-8?B?MFRlRjhNOGJza205TkJBOCs0VnF0YytIeEVQZEs0VkZpUkZ4WUhEYkx4dXI0?=
 =?utf-8?B?WmdmeUFjbFEzOU0rK2RaRVZCMkVJa2JuL0ljK0h3VGVMRVovTUtsaHlPL1I5?=
 =?utf-8?B?dkU2emlmUGxNZFFoRWxmalhLTW13T2R0bFlDNkpjL2puWGZpQzdNbHA0UXp4?=
 =?utf-8?B?WlhKTmtmMEx2OC9KTGNhTitvVGJXSTVFS0dJUExITjJGMkZlWlIwWWd2a0hi?=
 =?utf-8?B?Y0EzK2pIRXR2alE1WCtjN0lXSVdzS3p0Rm83eGNsVFRaMnduMyt2QjNDTDJV?=
 =?utf-8?B?ZS9ueTFFaUN6NFdTdldVWFBqem1hU1lHdXc0S2Y0aTVXK2p3T2QwQUhZSVhH?=
 =?utf-8?B?Y2gyajFGcDd0MFJDbEVCTXlpM0pweUUzVDU4RlZJaE41M0RqLzlDTWwvbklk?=
 =?utf-8?B?RU5EZHJUV2cyU1pqUmRLQjQyVWpnYVREVWJ0dUdublNNdVN5RGtud0lnSWZJ?=
 =?utf-8?B?dXJOWFpmTTlUNTZETjdYYkU3S1VoTHhZbVhDUWVEMVZvUUFwMVZLQXc5azJE?=
 =?utf-8?B?OXNXeG11L1RDalBBUHF0eTR0cWJmTUNGNUZTaGp4aDRQTkxRUDBSWFo2OWM3?=
 =?utf-8?B?cDVTV0k1NnJxOTlLa0dQUStSZjlzNjJzR0JrQk1VU0pQTGh6eklmYTEvSnB3?=
 =?utf-8?B?ZGVOVTdMV0pDcCtpK0NnQVJCd21IYkRNVHhYakllSlJnS2tQWU9xd2ppQStC?=
 =?utf-8?Q?NVyttht0P2nDHwDaSpsNTqpG6?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 334ae011-e9db-46ad-72a2-08de2bb3ad0f
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2025 23:46:23.7030 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5lkZykjChfpI69ebBGlgzG+CCLMge6tpSYCcPHhhMm18QJXNkjQU3c1qDZdhsZVRBfxMb3S5SKl/ELiubBCeVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6578
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

On 11/24/2025 6:44 PM, Joel Fernandes wrote:
> Move the DRM buddy allocator one level up so that it can be used by GPU
> drivers (example, nova-core) that have usecases other than DRM (such as
> VFIO vGPU support). Modify the API, structures and Kconfigs to use
> "gpu_buddy" terminology. Adapt the drivers and tests to use the new API.
> 
> The commit cannot be split due to bissectability, however no functional
> change is intended. Verified by running K-UNIT tests and build tested
> various configurations.
> 
> Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
> ---

Sorry, I should have mentioned: this patch applies on linux-next master branch.
I did so to get the latest changes to reduce conflicts. Thanks.

 - Joel

