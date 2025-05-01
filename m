Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0980CAA5ED0
	for <lists+dri-devel@lfdr.de>; Thu,  1 May 2025 14:59:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 229EA10E848;
	Thu,  1 May 2025 12:59:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="UngbZIuX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2088.outbound.protection.outlook.com [40.107.94.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD81310E846;
 Thu,  1 May 2025 12:59:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HZjzybe7ZCGXyb7d/yNXBrAU96m0eN2Ek0g4xN5QN2w3yyAcKQBZ3Eji9Hi9qEMrPkJgLVFCKaVNjEjAf4EEXKI1Ip5kut6cJcB10EP/mfuISft3EBTsOff/vLejv1iFPxQY/gXcD0aR3rUeS9h0arbN+eBZqHKZLAcZHn7j66Zno8ySs2k0YMLeaW6eoOtBUYN3fEA47OkKYeWp4OGd9oqmns9m55w6fg+UhliXDORKIbG7XaR+dO+PuRCxkc8GyIvKp4+lC7CqLgB56nviSdQ0IcE9GWj8h6k7Z6woEnIXvX11bV1jRCF+O4WnV9ZH4yYBqnZ3YjW+KYrttMj9MA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XG2JBDLJoiDPNJhaAyFT4ObCxkxiJK3WPlaZxFgjz/s=;
 b=Tge3TkUl+8zSYKjWzy9ixu8aFJfxPvE4yfpYw2td9XXFNanDsB5a/CC4DOajP9YXLVzAcCgsr8jsrjYXn6Yj93p2r6Bdh3mwI5ZHXvU9W+3ii4ZOKG/cDe3RD7w+RVXnobAqijjxFlFgfwt67B8TR7M+ZBh7r/aGdcEsdH/sSjkpMuHK1vVvlmHB+7QMvrdP1VF4nGYiJ1hEwo8nm6JHLyemjxq2TliTomI94GNsAQCBjeSCvfmifJ7kM//k3m8szO8shZHWXGPBnjs6tgTQiiUpeBswu47533q1HVxHPsq52Rpn4RZucu+D+sL2UJTnZJsaFNuF+VkWyrcGAQ3N9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XG2JBDLJoiDPNJhaAyFT4ObCxkxiJK3WPlaZxFgjz/s=;
 b=UngbZIuXMggUDU7XdWEDVURfiu7oYCB2/WdFc6b10vuunEZm/OT3N8sqEfmFe0s8pCk1v+qT3XLJTCBBRxUPU0sTZtdW5NonIgYn6ZqvdRzL76rfblAGowvbgWrbrLZ8OQ9kYYkDuVJBFOJrb2Noq4d6QDDtzTsSyEMcJNQeXUOJ6O2NOkQgD9wLqfLaVl+HavN7G10uiyNudyabuz1lcBiMJa8HwqjMJ32DFg2tAl/386rndnd/Wql/A3QDDXKfK6ZHfix3f0PV9TTfUWfNMWz1oxrhWhULXUhxXt29/KJ7NyWVDXKvjvfAEM5HuwEeHvqQtRSjsSyBTo0XJ9ymmQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by LV2PR12MB5919.namprd12.prod.outlook.com (2603:10b6:408:173::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.24; Thu, 1 May
 2025 12:59:42 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8699.012; Thu, 1 May 2025
 12:59:42 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Thu, 01 May 2025 21:58:34 +0900
Subject: [PATCH v2 16/21] gpu: nova-core: firmware: add ucode descriptor
 used by FWSEC-FRTS
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250501-nova-frts-v2-16-b4a137175337@nvidia.com>
References: <20250501-nova-frts-v2-0-b4a137175337@nvidia.com>
In-Reply-To: <20250501-nova-frts-v2-0-b4a137175337@nvidia.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Jonathan Corbet <corbet@lwn.net>
Cc: John Hubbard <jhubbard@nvidia.com>, Ben Skeggs <bskeggs@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: TYCP286CA0170.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c6::11) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|LV2PR12MB5919:EE_
X-MS-Office365-Filtering-Correlation-Id: 79145d0b-54c5-464f-5692-08dd88b009ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|10070799003|366016|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aGt2NUpTejFOMEdrNHBZYnc4SHA4WlVCMUJ3eTh0c0tOUWxuVmhvYkZtTjN4?=
 =?utf-8?B?T1FmQzB6S2VZaEZQK1JDSDYzQVowWm9CUnhQdlk0SGhoR2ZMQjFUQzVYUjJF?=
 =?utf-8?B?UngwQXJEV25ZM2FNVFZWVXpvanZiWTlqOTRLM3NneE1PSld5VTByQXRSeFUx?=
 =?utf-8?B?aEY1ZUlKc25uakNzejBQWmV6T3dNSnE4dVhLRWcvY2kxSERLU0RVTWVxVlpI?=
 =?utf-8?B?eVlWWk5BTk8zRlVkZnpHcU54Sm95Qml0M3dGcUYzWkl0aENFY0NnNDJoK0pF?=
 =?utf-8?B?Vk9mVlZESE4zSWZYa0l5WWxwa2hyS0VIV0hVSHBqc3RCeWRhdU02VDROQ0h1?=
 =?utf-8?B?VWR1dVMvcGR5dGF1ZEowZ2draWFpYStUSWtOQXdyVDNncFZpZXVscllTTWJm?=
 =?utf-8?B?SE9PNENoVFdSbDZua1p5dDRhY3d5U016QlhDTDZONHErMVFsaXJ1Rld6UkZs?=
 =?utf-8?B?RDJEc2p0RXl1TEY5bzhqS3NRUzdzUVVtcjh0Qk0xdTNqSk9CN2twWWVyMjhW?=
 =?utf-8?B?TDVnSjZRSWZGbkplcDBJVW1ROWVLODZmZUhHbjJKVlB3YWZ1N0tqTHFxV3du?=
 =?utf-8?B?bUIwNWV6QTJxcXJPUjBmaGpwUFFKSXBkSWNnWDhKeDIxS0M1c2cwQkxsOEZz?=
 =?utf-8?B?cVgxK0xhR3BpekJnQTFDOG1YZHBMSVErVFdVUm82em5xS1Z4YUdYN1FoRThH?=
 =?utf-8?B?UGljRW9zeCt5dUQ5OGZLZXNHb3Y4cGFPWGtyRHlTTE5ZN3h6L2NKOW54NWcw?=
 =?utf-8?B?bjdUSllFc0dYMW5EZWdMQU9lYUNaRXlIY2E3OFJsT3dnTENkRVVBVllCbTA4?=
 =?utf-8?B?bUFTQ0lvenVGUEpMbGZBRkNCYjU4N2hFVkRwM1pTUHFZV0REQlhzOUdBellk?=
 =?utf-8?B?WHhvR21rdUk5TG1sOWFLb0tsY0k3OVJhTTR2NUpDaTVUN3hQajlyb0cvVWRO?=
 =?utf-8?B?bk5KdmlGZ0JzS0RIK3BuS01mSElZZUJxN05uR1Fnd1QwU2drZXVzb1lxaXc5?=
 =?utf-8?B?WWxxV0xZUjhIaFBGR29GOGVZTW1tbnFKT2VjTUFrUlZyWXVRSThVM2lZb2Zk?=
 =?utf-8?B?aUl6TWpSbmJkQWZhRHRLR29IcUVLNVRSY1ExbTYxcWdvN2V3UDZaeGY1TGda?=
 =?utf-8?B?b0tGelN3bDdVUThIQnpNaE9FR09nRkVlazdUczVqV2V3bW9tTEJ1M2dmaVNG?=
 =?utf-8?B?aUlvY0FXWHc5MDd4bXUrbnZnckZ1M3dxQlNlRjVSRUZKVW5BY0o3OFJNbDAw?=
 =?utf-8?B?Z1VwaEJ5Y3J2bUFPdVNCNW9IVlRMYTB6TFNEZ1d4K09IQlFaSktvdldxZWhj?=
 =?utf-8?B?Mm9KSUs2UTBDMDFWWmpCaWcrVnF0OENRdkRwSGJuVHAycENuRnZOSm1NbXRO?=
 =?utf-8?B?Y3EzT3VvYVVuTUV1NHdjRDBjV2dHZ2NucDdCV2VMK2ZyaE9OQ2VBdmNLSTI1?=
 =?utf-8?B?MVZIKytyU1JIMmUvU3p3dTFyZXRoeDc5RXp3VTcxK0JxMzQ3NEdwRndyYkJ5?=
 =?utf-8?B?Um12eThNTXJOY3RUWFFMWjcwd094NGtDd0tHU2VGbEJsQTlNNEFqYWtUWlJ2?=
 =?utf-8?B?cDkyMHIvZjRaT3hHdWI2b0hNckV1dmhsekwwNUY3aytEYlZXS2ZTd0JneHZI?=
 =?utf-8?B?MmQxV2wyaGdteUtRd1NEMGxkM0JGcnNOdXFPV0lhOGpyZUFZYUdiWVRmZHpQ?=
 =?utf-8?B?eCtGOFV2Y3drNThZbkhhbFJKeGNNY0lhVjFRUmp5dVVYcHMyODJKYVRueXBs?=
 =?utf-8?B?c0FDaFpOYUt0bHB4NVBkSnR4Z052WFdkYldINUdqYUVLNTRzNHc4a28xTFIw?=
 =?utf-8?B?aGEwVEsxZzFJbnNPRERpWnJlY1JveVNyMEVRVk1XN0xuSFlqZll4Qy9meG9s?=
 =?utf-8?B?MnRhZnZ5ZGU0dGpLSzgwQm9iUUlBYjFIU21rYW1LbG1HUTRzbVk2RFRpblha?=
 =?utf-8?B?ZkVxMFliRzFsbHZydWMwKzJCRUczSFZQait2MUJXL09Vbm9rOERmOTNLZE82?=
 =?utf-8?B?eGtGVGM3ZjZnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(10070799003)(366016)(1800799024)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NDhzMUJQLzJybWhCWklYalBxcUtrZXFoWEJxZ25UOVB2aVVFdXBQanJZMmJV?=
 =?utf-8?B?a0xkdjFtSjkva0xZeE5OaXB1cUJ3TDVpM0tDZ2pDekNSTGlGQlQ5VkRtSmpj?=
 =?utf-8?B?TU5hTmxwQXBtV04wbGhVbHZxMnpncVZlcElIR0pSNDdDeTVBRmZpaWFGWXB6?=
 =?utf-8?B?UkViTWVNQXNHczdxVUlNUWZTYUl2empTMTZnQkZZZjhnT1habnNxWVJaS2VL?=
 =?utf-8?B?Y3FYMS9IMkc3OWxNTXlTeThRazBnYWlIV1p0b2Z5T09CcWdsZ01US09RRG4v?=
 =?utf-8?B?b1Nyc1d0ZXN0VDRoUDcwa0tqNmNUdUIvelU4MTUrVHU3NENPRThURnhGdWhl?=
 =?utf-8?B?d3BFVDJMMzd4aWIyWlU4MzU4c21xK1ZtOFJ2U2tGOGM0aUszU2M3ZnF3R0lU?=
 =?utf-8?B?Qy9DZmlOZThtTEdnVWNYVVVIdzVsM0tUajFQaFdGK3V0S011b3RHNmtjU2hx?=
 =?utf-8?B?OTgwdUVkenkzODJTNzJyZGlHME9RK29UMWVTaWJ1eVBSM1FLOHEyelQ1UVNU?=
 =?utf-8?B?MlF5YVFPZllMM1lTUWJ3VHJ3ZVZxV0hqVmV1MWpJZGI5a3BLd2E2NENpckNZ?=
 =?utf-8?B?bklMK0kyd3hsSkVhdStyZEFxWXhyaXJ3QmtJTFJqaWp0b3drQkZaVE83RnNi?=
 =?utf-8?B?elJyK3pueHBVVXNLN1BCVnNxSlJ0ODFJT3ZjRjl3T2pXcmh4QWo4OHlZMTVs?=
 =?utf-8?B?NVpZTzczUm5JREg0NmptbmpnMVIyZW1IMmVWbkFxV0g0VXlMUlZqVHhTQm9o?=
 =?utf-8?B?dHVZUXROR0dVOVc2d3ZHcHlDWXZyS2VIMTdJazdTeUxIdEJkMFVrT1ViVXps?=
 =?utf-8?B?MW1kempvcGo2L0xvRVhEUUZzQ3NOSmZvZTJBZWFhZk1MQkVmY2NlM1h4WUdk?=
 =?utf-8?B?VVdHYW5GSUw0aWNuVW5JS1ZNc0xIUjl4OUx3WWNlSXlFVVZvTnpRdno4ZWJ6?=
 =?utf-8?B?OU52VTF2TUIzbmNmN1dzTDR5Q0pWN0N3TFZYVGxoM0NXZGZHY04xU1R4Q1gr?=
 =?utf-8?B?eEhWYng0dUFxTWM2MkZWdkJFa1hUUk0vbjEzSXpRSFErZU9nSDAySjZnVTlK?=
 =?utf-8?B?YWtsWEx5M0c3by93WStERHE3ZU9BNU9DdHp0TDkwaTR1NmtVNS9HY2JUdm8w?=
 =?utf-8?B?UXRGVzZNM1l4eEs4V1dnQVpoL3Y2ZzJCZ2dLVkE3UFlGazl6UktrL3hlZFRx?=
 =?utf-8?B?MUFaYUlVWFVpUkdiYW1ZeFZ2ejJvRllPcTZWazJwWWNvU3ZLcitGRWNzL2xr?=
 =?utf-8?B?dmhCSk5STGVjbEt0VHdjUHo0T3VmVzllbXNpVEJxbEVjcTRzUDhZei9HYzg3?=
 =?utf-8?B?cWhqcmFIWTRuT0o0ekMvWkhXRFVldER0cWJMdXBFNUg2WTlTbUJwdXFnblU3?=
 =?utf-8?B?ZXozNnp6YUx5elhvRFptL0UzZk5HaFgrb0xoQkNHYlcrTWpFMVlScFdTaGVS?=
 =?utf-8?B?WitYR09nd2FoOENVekRyaTZhNFpadi9iVEN4b3k1R1F0RnhLT1FibElZRnBi?=
 =?utf-8?B?dzhnN0FMVzgzeUh2NWJ6ZlZtYTJySGw5SGVDWkh1RXY1ZnQrOTdhQlkyOXgy?=
 =?utf-8?B?ZXZscXVycVpVbVBsNUVJRHJVSFFoR3EyT1lvYzhSdE5uc1NNMFJYbStIWVE1?=
 =?utf-8?B?d0V2SnZTdzBQWkNCakpYM0NEbDRHZnBuUkZOdGIrdFYwS1ZLT3p0ZHhOS1Vv?=
 =?utf-8?B?NEVwNG9tWXIycVNIK0VkT2R4WEdJYkpkMDVJMEt6UnhKQ1R2UXZ2M3NRNHNY?=
 =?utf-8?B?NzlSRC9yTVBINVJSV3JLNEdTMGpQZmNQcGtwWHFpYzBaanljdmNhTWw1WTF4?=
 =?utf-8?B?RGRub2FUdDdodW1JcFpVc0NEcGh1UnRuZlFrOTNOd2JpdmlwZFZuNHJ5ckFE?=
 =?utf-8?B?VGxER1R6Wk1MdWRzbTM4YVF0ZFBYVXR0M2RhL00wYVRpbkRzSkZNbW90NzZp?=
 =?utf-8?B?NWFRZStrK2d4ei96OEozRlJCcGgvUnFqQkpkU1Y5M3I4NnlMSHVWbEZqcnNw?=
 =?utf-8?B?RnBUVkxBLzVnTjczdHkvT2tLMlV3b0d2TEt2UWtmWE9hRWYyOEVOQkJvMytC?=
 =?utf-8?B?N01kdWMreFBEK2R5OGJ1Q0FQbUxyMFpqR1Y3d05yN3Z1ZkU5c3FWYWl2TkJC?=
 =?utf-8?B?L2dqeDRxZkRORmhRWXIrVTB4ajhMWExQYW5xMTE4dklTVXBNcUtLT05MVkdn?=
 =?utf-8?Q?JiH9Vx0t6tS3yH/YKSYgf5Kr4JscUgrBDDfQLHr6By1i?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 79145d0b-54c5-464f-5692-08dd88b009ff
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2025 12:59:42.1050 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6n4wFgNiNJVPWNNDy1JiYqTY8cOWG+Grzg2ddxtndXcEyBWv0VBCvy4LtcblA1V7OOCNmZG9Gy7ZNLeqATlisA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5919
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

FWSEC-FRTS is the first firmware we need to run on the GSP falcon in
order to initiate the GSP boot process. Introduce the structure that
describes it.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/firmware.rs | 43 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/drivers/gpu/nova-core/firmware.rs b/drivers/gpu/nova-core/firmware.rs
index cb79d039948858e657c9a23a62ed27ff780ac169..1eb216307cd01d975b3d5beda1dc516f34b4b3f2 100644
--- a/drivers/gpu/nova-core/firmware.rs
+++ b/drivers/gpu/nova-core/firmware.rs
@@ -45,6 +45,49 @@ pub(crate) fn new(
     }
 }
 
+/// Structure used to describe some firmwares, notably FWSEC-FRTS.
+#[repr(C)]
+#[derive(Debug, Clone)]
+pub(crate) struct FalconUCodeDescV3 {
+    /// Header defined by `NV_BIT_FALCON_UCODE_DESC_HEADER_VDESC*` in OpenRM.
+    ///
+    /// Bits `31:16` contain the size of the header, after which the actual ucode data starts.
+    hdr: u32,
+    /// Stored size of the ucode after the header.
+    stored_size: u32,
+    /// Offset in `DMEM` at which the signature is expected to be found.
+    pub(crate) pkc_data_offset: u32,
+    /// Offset after the code segment at which the app headers are located.
+    pub(crate) interface_offset: u32,
+    /// Base address at which to load the code segment into `IMEM`.
+    pub(crate) imem_phys_base: u32,
+    /// Size in bytes of the code to copy into `IMEM`.
+    pub(crate) imem_load_size: u32,
+    /// Virtual `IMEM` address (i.e. `tag`) at which the code should start.
+    pub(crate) imem_virt_base: u32,
+    /// Base address at which to load the data segment into `DMEM`.
+    pub(crate) dmem_phys_base: u32,
+    /// Size in bytes of the data to copy into `DMEM`.
+    pub(crate) dmem_load_size: u32,
+    /// Mask of the falcon engines on which this firmware can run.
+    pub(crate) engine_id_mask: u16,
+    /// ID of the ucode used to infer a fuse register to validate the signature.
+    pub(crate) ucode_id: u8,
+    /// Number of signatures in this firmware.
+    pub(crate) signature_count: u8,
+    /// Versions of the signatures, used to infer a valid signature to use.
+    pub(crate) signature_versions: u16,
+    _reserved: u16,
+}
+
+// To be removed once that code is used.
+#[expect(dead_code)]
+impl FalconUCodeDescV3 {
+    pub(crate) fn size(&self) -> usize {
+        ((self.hdr & 0xffff0000) >> 16) as usize
+    }
+}
+
 pub(crate) struct ModInfoBuilder<const N: usize>(firmware::ModInfoBuilder<N>);
 
 impl<const N: usize> ModInfoBuilder<N> {

-- 
2.49.0

