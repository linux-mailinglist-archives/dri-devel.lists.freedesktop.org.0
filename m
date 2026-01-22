Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EN49ENWScWlZJgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jan 2026 04:00:37 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D92BA6120A
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jan 2026 04:00:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CA1810E8E5;
	Thu, 22 Jan 2026 03:00:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="lKJ1Pe9v";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11013050.outbound.protection.outlook.com
 [40.93.201.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F168A10E8CC;
 Thu, 22 Jan 2026 03:00:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u/V1/8TWXkParuJwCScGYSKFM76ml196PIJxTGzzaWHlMPWnh9O6P0cGcrjTvctkaDbKQo/RyRchH0bKLTF0Fez5VbAypfM9ZMCaTm4j/Q9wRfcw9gv1KxpBzkHlj4Uv6AEoTowVNmcKcg66SsVNVdtBLyI2aZZo57W/ZnDv6g0hXiSBZbWEvIPFts1Lotwl9ViJoGDJGVNdoPH7ZtyyHYHqcPRtQY1d6DfCWUPuDosTy8ERSXS+KjXNb+k8c9CVtYDK5S2cXm2x7E6jWeRqWgWfqqMnItU08sMR9oCcn0h00CdH0445EUDpOOo5JorhSOvRxeX2WlsNl0PpZNMKDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MnQ0tLl1NmEFXu7LwzYMY9TFquu9dbbPqS/W2WcnPT8=;
 b=BS5r8fflIaTuXKHuHRTX0+SDMFUkbkghR1UAmqY8CbSXCHWVSIl0OT6g4bBDj3veojiyNfBujInEe3w2Mj3IhvveEtajAv/P3S4hx6Ts+HGZIU6LgPH8dvAOOxEtKx3AqYEt30z16jnQWnUYBmF5Li0Fg2z1NuJcIAVdj4Us0GqusfO/cbAcFdcCH+xKZmDbBxRh9SSH4bY/JSVnXG/T4T5AIa1oijYXviZ9bgvdTE4EXgRW8qo9DYh85rBQpRCYPbBpPL2N2LElAhNDEACMBhgnDrs6rhavORMfbQvzXQQNwu2lREHq1r02P3jfJcc3OweGd18KLI1qqn5lGvHBtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MnQ0tLl1NmEFXu7LwzYMY9TFquu9dbbPqS/W2WcnPT8=;
 b=lKJ1Pe9vkQ7R7KrhbnWnh9nTtrMiROASylDCQMYyqAuWSCJZ0pLn2MO16d/E2WbDB3P5S3KJTGl7ggdIf1Ji+Xt+UBn2UzuzMh+7kFQWQuDSa3Zd+cZJ/Qc8jeIUbkS5yIzj3DzlhK2FMoldQzSFaR6b/vQK9TY/SfE+KvcOn+DwtluJlyhIAG5D6aa2nAwnVsvT8BQclinc42bwh8qf+MqY786CgdghTVm4TwnlhIzu99ZByv5E0U71iIKhseYEPoThmgZR/9gf/5r6NryMzjs507KuE+Ik63Ia0CCB/zEG84X+/j7SZfwVRY3xDtieHy6h8o3mzSfKidvncmxzww==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2353.namprd12.prod.outlook.com (2603:10b6:207:4c::31)
 by SA5PPF7D510B798.namprd12.prod.outlook.com
 (2603:10b6:80f:fc04::8d0) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Thu, 22 Jan
 2026 03:00:30 +0000
Received: from BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0]) by BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0%6]) with mapi id 15.20.9542.008; Thu, 22 Jan 2026
 03:00:30 +0000
From: Eliot Courtney <ecourtney@nvidia.com>
Date: Thu, 22 Jan 2026 11:59:07 +0900
Subject: [PATCH 4/4] gpu: nova-core: gsp: fix improper indexing in
 driver_read_area
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260122-nova-core-cmdq1-v1-4-7f8fe4683f11@nvidia.com>
References: <20260122-nova-core-cmdq1-v1-0-7f8fe4683f11@nvidia.com>
In-Reply-To: <20260122-nova-core-cmdq1-v1-0-7f8fe4683f11@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, Alice Ryhl <aliceryhl@google.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Alistair Popple <apopple@nvidia.com>
Cc: nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Eliot Courtney <ecourtney@nvidia.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TYCP286CA0139.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31b::7) To BL0PR12MB2353.namprd12.prod.outlook.com
 (2603:10b6:207:4c::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2353:EE_|SA5PPF7D510B798:EE_
X-MS-Office365-Filtering-Correlation-Id: 3aa6fed8-6169-4d49-43fa-08de5962672a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|376014|10070799003|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ejU4UmdaU1JhY0pVL0pnNWVTSHBOdllnRTNMV3BUTjlaUmFJM1lobzR6STJY?=
 =?utf-8?B?VGZrVTFpdFNKckc4T2o0TmFVWGFJcmdWNlNORG8rL2Fub2I1dnlJNU1nY1A0?=
 =?utf-8?B?OWZoaEJQeW5ERDhTazFSVkYvRDh6dVllc3BabXdUOWZ5R0tEcS9CYmR4OExV?=
 =?utf-8?B?WVBwMk1mVkFlVHFnY3BoUUFxNzFJN0sxcy8yWGVmeHAyS3Bvb1VMSDZuTnlB?=
 =?utf-8?B?bUtuV3FESmRqVkE1NUxMRWFqcjhkQktPOUNhb3gvVjN1d3lNYVZSSkk5NU1r?=
 =?utf-8?B?Uk5mYnQ4ZVozVG91S3RFdW9UVnpkb05tMk4yWUZoQTZobTlwSGpRV1pFN3F5?=
 =?utf-8?B?VmtGaFJiSHo3NGFkZTZRVGQ4OGpYcVJ3UCt4bW80RWYwc01YcGhyN2w2bmFv?=
 =?utf-8?B?K2ZVdVBlUjBTOG9zSm1tMzlBN2tWenFuM1A0M2lGckRnSXBnOFdOa3QwSnk3?=
 =?utf-8?B?dkJKMWJwQUZ0NXNrYk04d2tNTFJNZ3FhZlZCdFZrSW5LSzFqSmpRVFZvK3pR?=
 =?utf-8?B?SThlSksxS1ZLZHVjOGxuUnFvOEZhdUNFUGcyVHkxVmxwdHpqUkc0elJYb0VR?=
 =?utf-8?B?dzJ3djFWSkZNYkJocXBPYjQrV3Q2eVVza2c2eHIwTSt2N2VzTmxYeE1uVEkv?=
 =?utf-8?B?WWdzMjIyZEtlL3ZHVHRDVVBJRmFLNURWV1RDbkxlb1dQRGRJa2hRRkV4Umk2?=
 =?utf-8?B?bUlKNGVnWmsxRTB2SkRvRHB0MDBSNndoM0gyQzlacEVXbCtTbGo2dVBFMC90?=
 =?utf-8?B?NUJEbnZBMWtRdzFja2IyTXUvL3pGUDlyT3I4UHV3VUFTakQ1SEVzSEwvQkNz?=
 =?utf-8?B?bmZjUGMzODJXYjk4cWd3SjBGdExSVjU3OG81WDNRSWU2TWdxa2Q3SVNxd2oz?=
 =?utf-8?B?VXpVYTdoZExUWlRXTlpGcG1rRHB3c3Jiem9pWlVSbkxTRUtQZDlwUkN3TUVN?=
 =?utf-8?B?TFgxQXZsMWYwQThLQVpnWFliTnZBaHRHQWg4aDBGMndCaE1EcXVzVzN2OEda?=
 =?utf-8?B?QmVhTnpRUHNqSFErT2Q5VDJGYzRWM1VSb0NlUzZLV1F2cXpBV3pFNGgvclE4?=
 =?utf-8?B?Vm12Z1FVSlRHejhwdVdKSVllT3hiekZHVnY2ZUxoOVNYVzJzL0RxT24rRVN6?=
 =?utf-8?B?YmM4THV2U1g5alhqN21lU3U0NnFhbzluU3UyQW1iRTdyOEdnWXB1eldwQ0Rp?=
 =?utf-8?B?ckJ5Nm5iSzNyN0grS3lXQmFaZ1p5WlNyalFBNjFjV3F1RHhpZ24rWDRoQnJM?=
 =?utf-8?B?SzhTNHFNbXlta3JKTlh5a3NMZnVUWjBQd0pTUGVHOGJGZGVhMlhUSmYvdENi?=
 =?utf-8?B?SklEdGZRNnhiTFEybEJwUXVTMXJKZXJHckhTb09NQ0h2Qk9oWVMrRmNZaWpp?=
 =?utf-8?B?a2hmbGY4TkNUSG1tSmJkaXQ2TjJydXowUzVNWTB3NXhra3VhVHdPeStwcWxW?=
 =?utf-8?B?T2dNdG1MSDBsb3dPNWJDVEhTdldIbk41Yy9JeUdhL0dwdjFEeEVQVFIySmxF?=
 =?utf-8?B?VkNVN3lPendlMUcvNFI3dU8ydStjUjNSellpRkNiM0o4VTJKOUpyQWJVcTE2?=
 =?utf-8?B?WWp1R2ptVitDcmR6dHVMM1pQSDFxUnY0YUNaMVU3OUMvWTZnQTVJN1dHNDVk?=
 =?utf-8?B?c3VKT3haTTFXZHI3SmNpbHZPWkdWTTVCNDdvWXAvWHY0TUgwdkhEaWhHODdF?=
 =?utf-8?B?OE9uTDY0c0ptekoyZmt1WVNVSFJOd0FJbmJ4YWEyVWRRa3BEcmVUZC9WN3h3?=
 =?utf-8?B?ekxxdS9LQTdydlpWMzkreGtZRU0xL25SVGs4K0RFQ1pNeFMyTWNhUU9xdE9m?=
 =?utf-8?B?ZWpGcWlUaGh3V2dDSWU5MURUR2Y5bTQvZTdGTjZlRWluVlFxeHp5bjFTR1ZD?=
 =?utf-8?B?d3JBcXpyTDJ3M1ZQbUJaSEZLUE4ra3B3cWJ1VnN3a0dvQkkyT0dpRE0yZzR5?=
 =?utf-8?B?MmRHdXQvc3JNaXZYZTNKYmdKaHRiT0tvNUhpaHFRZE5OR1hBVjZUN2NtMzlW?=
 =?utf-8?B?bkRiRkdTQnliYWd5ME1JdDRUeDcrRTVBMG1vRWp3WXdmVmpGUkZweWlOSy83?=
 =?utf-8?B?RVZXUVNVTmhrRm9UeGkzM3E2all0d2p2LzZjSWY0TExQN0Z6WjR2cUxxbkgr?=
 =?utf-8?Q?E/yU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB2353.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(10070799003)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ekJ5aWxOUEkyS3R0OTNUREJDMm80bWl0Y2h2b2NqSitONTluM1B6czMvZFhD?=
 =?utf-8?B?ZnJXU0EvNkpQZ2FqWmhEampxcGhVT0NWSFRzUFRweWNDMkZTc2xQaFVXZ1ox?=
 =?utf-8?B?U05BZUg0VE9vb1FYUXNIQ2txTjRjUGtUQzdaT0tWS29mRkJRT1BtR01kcVNl?=
 =?utf-8?B?WXpLQ2NocEtQaW4vRlFmZXk2SkhiQ0lNSTJDb1ZwQSt3VGtxbHpIM3pVQkNP?=
 =?utf-8?B?M2laM25IOGR4U3dxdVJ0MXZ4emwrcWkveWFEZ3lhUXlPckZva3pzR0hKcjZj?=
 =?utf-8?B?T2U2RmxXNEJhcThCdldBdVpwS21MU0RqRjRiaGpMNlNqUW1lcUNGTGhNVGxr?=
 =?utf-8?B?WnQ1ZktwWENrY2NIZkxtQjVMK0dNUGJtdzNlUFUyeitZdkdKWHdLSVVzRWox?=
 =?utf-8?B?ZzdIZldSRGF6eHUyU25qMUwwRzVuZDd0enFVdEdiaU9iK3pNWWlCenN6cmNP?=
 =?utf-8?B?SGtTRi85Z0tUbmNkTC8ySmJzaE1BSEFmTHZvMlJDWnRPQnVESnlLdW5RYkFw?=
 =?utf-8?B?ZWhibGFQRzNUdm5OL2hWNThJeDV0K3JhR01OOUIwakpJMXR3WnJQSEV2RWtx?=
 =?utf-8?B?OHFFRHA5eUdlbmhhVS8xemRLR0xMVGw5QjFXUml6QkRIMlh0VnFkWjNoaU0w?=
 =?utf-8?B?ZXNvUFFrNGNqaDdPZUx0M295NVZQcmZPYVJYY0NVUWhOL3BVNUwwdmtFd0M2?=
 =?utf-8?B?NWErV3BHdEhYb1RkU21kbU1wb0lZaDdJQklGMTJDaUozdFd4Y0EwQ095ZG1Y?=
 =?utf-8?B?OFFYZ2xKVk42eVNCTjA3YU5UUnpCdFdvQmRBbmYzdFpYelY2SWRtcTVmdHFs?=
 =?utf-8?B?bTArOFpWQ2FsT2swTGJTb3RsYWpMbFJ4ekJzaHFzdnhxOTJsSjMzVm9zcm1y?=
 =?utf-8?B?VmhVVElHbmlrTGl4a0JxNGlBM05EWVJhU0VvRS8wY0J3YVhwNktwYnA3Z1ds?=
 =?utf-8?B?bE1ZQXZlVS8wdTlZMDVMWXZ6UEZscGdtZzVYWWJjM2hFRmtEMlY5R1hETldY?=
 =?utf-8?B?QlNFNUJwTW4vSFA2ckZ3UFlBeEF4bWZDN25GZEtidGJSek5sS1VvY3Q5VHlG?=
 =?utf-8?B?U1FQZmRmek5VZVV5Mnd4KzRPZVppUmpQcmlwNnhuTTVSeTQvVzVMTzZCNkRK?=
 =?utf-8?B?TFozR2FZQUFqRUxURHpkQ3RmczA2UGlhSHdxOWdGQmF0ekRValdEeUk0Y25D?=
 =?utf-8?B?NnAzVVZTSHVaYUFLWjFCSisrTU54OG55NzVtcEI3blczaG1KWFk1aWtidytY?=
 =?utf-8?B?WjZxZitLVnlVUkovVnVEQVk0cFZzamFvUFVhbExmM3RPVG1ta1M4akJZNHpN?=
 =?utf-8?B?MVNCS1c2U1RLWVZyaG1FcUlYS1MreUxMdEZlTTByaitOVU1rRzVxbWJnMXMz?=
 =?utf-8?B?TnZUZ1ZVUHkvazJFdE9UajdRNGFud2E2d1I0UmNGdnZnWVVOcDFKSDl2U215?=
 =?utf-8?B?TURpb1pGUCszMUZVNUc5NHVBRDZOYXpBUjFDbjk4dG55MG54L1o0UUk4aURP?=
 =?utf-8?B?eGdIZzlTZmtPQUVjaEMreEtNTUJBbi92ZlhabGhrRmpDSVpmQkd5TVQ0elNp?=
 =?utf-8?B?NGUxbzk4Wm5PM25Vb2tzRG9IYVJCMVdndXd5cElUdEZlc2J1TGdKRnAxMVJR?=
 =?utf-8?B?dVhXempJQlVzRFZWcXpoL3lGM0VCWnlOUkFBRy9GMExxTjF4SndZN2Nnc1lN?=
 =?utf-8?B?ejVaMWd2QWVNS3pwaGxXUTFVRFBhMmlsNzF4K3RJWjBYYlV1aWdldjlWRitp?=
 =?utf-8?B?UW5ZOFc0QWZhZ3hiODF6dEZSbmsxbURuS2p6MjNoSnJnMUtsR2xveSs5UHFk?=
 =?utf-8?B?U0R2SStqdHdTcXU2TldRR2oxMWxhQVZObXhVMjJVOVpoVm5QQzI0dmVJVnY0?=
 =?utf-8?B?QWRxemw0MXlHdHhTbUlkY25xWGUrWjZldXo0L1NPcm9hdFZncjBpS3BYK2lq?=
 =?utf-8?B?OFRMRk9ubDcxM0RiZ2FjYk9Ed1FOR1RXVEhncm1IZTBpMHdYaU5wdWllS3p0?=
 =?utf-8?B?dG1kN3RwaXZ2QTJud2NNRTdldVNqUzIxNEFhcWpOdWJWdU9kWXNyblBJaXpp?=
 =?utf-8?B?WHlzTkpnVEZWM05YQWdqRmxxN242UFlRNmcrQ0kyRTc0MEJEczNNVDJacFFH?=
 =?utf-8?B?ZzQ2TWJsUnU1cVVPZGZ2Y1pEb3hGMjRBdU0wUW80SDFwR2VLUXphUDlveFR6?=
 =?utf-8?B?MkVUN3cxMTZibG9OSDNRMUt4WS8wT3NMVnVIbmJMdk9sR3JlSDQxVXNPTVU0?=
 =?utf-8?B?Znl6Lzl5dnZQcmlPZzAxekhLcUt4Z2dMZkpIbEVxZStWd2pUWUFKeDl4Ympy?=
 =?utf-8?B?cHpvTFovT0w5b0FaRWRwakRwN3RIK2NTbWhGYmhHNmlDd0tFQnQrWS82T29j?=
 =?utf-8?Q?koqJKl2jiogu7EtRMJGGDqTc74caIeuSyKOAmpYCTujB8?=
X-MS-Exchange-AntiSpam-MessageData-1: IY5U9spLfR+Rhw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3aa6fed8-6169-4d49-43fa-08de5962672a
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2353.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2026 03:00:30.6606 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rkDH7VIxe7xuT4kIo0aYamLZkqMxs73KG9CMYqPAswyeCNT1MhqVeFakd5WaC8dQwZON5UFwi0XDehGwuTfcTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA5PPF7D510B798
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
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FREEMAIL_TO(0.00)[kernel.org,nvidia.com,google.com,gmail.com,ffwll.ch];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ecourtney@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:mid,nvidia.com:email,Nvidia.com:dkim];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	DKIM_TRACE(0.00)[Nvidia.com:+]
X-Rspamd-Queue-Id: D92BA6120A
X-Rspamd-Action: no action

The current code indexes into `after_rx` using `tx` which is an index
for the whole buffer, not the split buffer `after_rx`.

Also add more rigorous no-panic proofs.

Fixes: 75f6b1de8133 ("gpu: nova-core: gsp: Add GSP command queue bindings and handling")
Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>
---
 drivers/gpu/nova-core/gsp/cmdq.rs | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gsp/cmdq.rs
index b6d6093e3ac0..5ca1d757d4a3 100644
--- a/drivers/gpu/nova-core/gsp/cmdq.rs
+++ b/drivers/gpu/nova-core/gsp/cmdq.rs
@@ -1,7 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 
 use core::{
-    cmp,
     mem,
     sync::atomic::{
         fence,
@@ -265,10 +264,18 @@ fn new(dev: &device::Device<device::Bound>) -> Result<Self> {
         // PANIC: per the invariant of `cpu_read_ptr`, `rx` is `< MSGQ_NUM_PAGES`.
         let (before_rx, after_rx) = gsp_mem.gspq.msgq.data.split_at(rx);
 
-        match tx.cmp(&rx) {
-            cmp::Ordering::Equal => (&after_rx[0..0], &after_rx[0..0]),
-            cmp::Ordering::Greater => (&after_rx[..tx], &before_rx[0..0]),
-            cmp::Ordering::Less => (after_rx, &before_rx[..tx]),
+        // The area starting at `rx` and ending at `tx - 1` modulo MSGQ_NUM_PAGES, inclusive,
+        // belongs to the driver for reading.
+        if rx <= tx {
+            // The area is contiguous.
+            // PANIC: since `rx <= tx` we have `tx - rx >= 0`
+            // PANIC: since `tx < MSGQ_NUM_PAGES && after_rx.len() == MSGQ_NUM_PAGES - rx`:
+            //   `tx - rx <= MSGQ_NUM_PAGES - rx` -> `tx - rx <= after_rx.len()`
+            (&after_rx[..(tx - rx)], &after_rx[0..0])
+        } else {
+            // The area is discontiguous.
+            // PANIC: since `tx < rx && before_rx.len() == rx` we have `tx <= before_rx.len()`
+            (after_rx, &before_rx[..tx])
         }
     }
 

-- 
2.52.0

