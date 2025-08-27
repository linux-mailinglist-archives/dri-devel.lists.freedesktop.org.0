Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9A8CB38BBD
	for <lists+dri-devel@lfdr.de>; Wed, 27 Aug 2025 23:56:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D368A10E8C1;
	Wed, 27 Aug 2025 21:56:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="jy6GKzaR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2052.outbound.protection.outlook.com [40.107.100.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0926210E6C1;
 Wed, 27 Aug 2025 21:56:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jQkC7K+FB9Q/rCCQGYxAG8HW7Y8aZvnwxjeRvbBSjmOPAtxDm25ig9eumHKUR3cg3689NTLlvP0k+enBC7jC3lEATIblMSY/BUzr5L8WksNepsEHQ2uyhiI+FQ0sZMemC48Bx8Yj0R21oXcC3mSY7sPHYqEi07EIVGiZyjK41ryTGiaogFgSbasNzUINuf8iVeyV726nvsGJG/6FB7iJJQexX0alLtRLfN3GJY2CKN6O/hbVAZDoJkr+ERR20xvvaeZlWIrsgQIe0iWTW9jSlr+uBym4Z+X7Bt2D26W6a1ZzbKo7N4IlB7IK5kst6ib2igfYRF5UmwL39tANtKxKSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Uq0CPNLKMEz7J26PKmYLOZVccaC4IygLTh/nLsHz6LY=;
 b=iA/12tgxEB13bX4l6r4tcQzwpjwdts/mkb0aQAXxA3uX/T0DiewFZg0obrRrEQ/xYRQ+nmq09Egax1yzhMQmNad6Tw2DwZBX+mF7a6dAupNrXfPwHLD8jRh1dxrKFZHsavZRi1dNSe3U9BIg7cZ4n/kzX9gpanvKMl6LVB/XSJi9r5ZIp1Sd9o4ngAKinqs5vi2yV3tf6VmUUPAiDP6xFzqB9btyfTqp7/LwxuoScvfjdVElAl4NgoN1g5X2jKydP+L6Y21Is1BYCprbj4gscmicy5Ysluet6gmK0alx7GyOioUyLeYfcfNyqMPr1U+TV8xCDLpUvst58g2KCTuGgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Uq0CPNLKMEz7J26PKmYLOZVccaC4IygLTh/nLsHz6LY=;
 b=jy6GKzaRZKc9K66mEA1viqyoE8AJjdTMEu9t6hsHQtqd9POoH3LpYzN4rw9fxh+vvtiUQWd4olXRg454DPjntAizMiZhSutsfWzUlEOmiW3gLfuAReyGehQJNlkrvy5lpTBSaEJtBjCGjpSIDQq7C/sactUCzS1vrod3U3wo8ZSASBZxDp53F5D0azOowlP3o3xhjdR4sZPI+g2ztHUTczsQTp+ShANT37CQ0YWL04PDNGQZq4wrh3IT/U5bSVQNVFWfC8fz2oMvKcfxvhKsLpT2D3Dq6Z7IKDbZPSu/GdWJ1f7tuB26m2Us5CBW/eV3NMOZzoRiG8k1o7JNe4z5iQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5968.namprd12.prod.outlook.com (2603:10b6:408:14f::7)
 by MN2PR12MB4126.namprd12.prod.outlook.com (2603:10b6:208:199::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.22; Wed, 27 Aug
 2025 21:56:30 +0000
Received: from LV2PR12MB5968.namprd12.prod.outlook.com
 ([fe80::e6dd:1206:6677:f9c4]) by LV2PR12MB5968.namprd12.prod.outlook.com
 ([fe80::e6dd:1206:6677:f9c4%6]) with mapi id 15.20.9073.010; Wed, 27 Aug 2025
 21:56:30 +0000
Message-ID: <79c7d5b5-5fe0-4306-b8c4-3c91758a4c00@nvidia.com>
Date: Wed, 27 Aug 2025 14:56:26 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/8] gpu: nova-core: process and prepare more firmwares
 to boot GSP
To: Alexandre Courbot <acourbot@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: Alistair Popple <apopple@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20250826-nova_firmware-v2-0-93566252fe3a@nvidia.com>
 <dc18894e-09d3-4088-9be0-22c2070b61f4@nvidia.com>
 <DCD2P4ORDLYV.2NSHXI305AF2E@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <DCD2P4ORDLYV.2NSHXI305AF2E@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR11CA0088.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::29) To LV2PR12MB5968.namprd12.prod.outlook.com
 (2603:10b6:408:14f::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5968:EE_|MN2PR12MB4126:EE_
X-MS-Office365-Filtering-Correlation-Id: 6db0c1f5-4abb-4c18-a69f-08dde5b49414
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|7416014|376014|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?R0pkYiswTndwSWRsUXFOL2FwNkdYVUVDaXlZcnQ0MGtqVkdtRlM2OEpOdFFL?=
 =?utf-8?B?L1llM3ZrK3JvS3QyNFlFY3NDWklBNjNKWXVmcUxWVHZZeFU0dXZibkt5Q2ww?=
 =?utf-8?B?c2x6cWZ5VWE5aUlDRTVMMGhLZEV0ZzgyZnI2cExoeEZRRFNrSll2U0hrRXYr?=
 =?utf-8?B?dXgzZlM0UVhzcmJmSzN1ZTlHcjgyUS8rS294M3VtcVRGbE1EVG5rS3paZmEv?=
 =?utf-8?B?MDNHUjc5eUd4am9tY2VSZE93RVRGYnRRZ212YmpWM05tY0paWDVpVENwQUU3?=
 =?utf-8?B?ZTFZYWUyM3F6cFRQVkJCSERVaWlHZHRuY3dCNldubTJnb3FjTnlEMUd1STBx?=
 =?utf-8?B?STZXaXNBQzZrN2lJdElzUWlhZWVHYVJtSzlwako4aW9MaXczVFppMXJnWWZB?=
 =?utf-8?B?YmlvZGUyTHZUcjlPdTFjTWpVMTJURm9wWUFab1VSVUJYN1BVTzk3WHMyUFd1?=
 =?utf-8?B?NkJMaWpsM0ZjaWdGalN6eHlqMFpwUGEwRS8zdlh0SnRNKzUrSHl2ZURRNzFG?=
 =?utf-8?B?MUxVdTU4cFFrMWgrcUtVb3lSUHVLbVBwMmFPK0xvOXJ4WmlpNG5obWNUYW9L?=
 =?utf-8?B?OHY5N0JuZEhTWDc4RWlIMXBkaDVhQUZYKzM0YmgwQVFINGN2aFY1RE9kUXBT?=
 =?utf-8?B?S2lENUFDUGdkTUV4V0dPRDlvM2hjY3hYWkxwZExzcGJlb1B0NzNpVHNJS2hC?=
 =?utf-8?B?UUhTTHhxdmt3bGpUVmlNZFV2VzBVSjdzZm1BKzYrTXhKcHVkdVRJQjVxTjlO?=
 =?utf-8?B?aXFVNFp6TVBjTXpDVXRZeWlMUzVzdlY5MjNVYkJCM0lPWnJLNTVNSEU4amwv?=
 =?utf-8?B?bnMxdmpKRVdOUFExZzBaTmFIN0NVZzlSWk94aG5pMEVWK1YrKzZTL0lKbGhn?=
 =?utf-8?B?SGJMR0ZzaW9yUEZsTmNibDd1SUZYemtJNytkb2w4WXVZTmxQZWlHYStNNEdX?=
 =?utf-8?B?N3oxaUQ3V3NzOXNQM2l3WUpUMjdsUmxQSW9mY0lJT05IVWRpaEJPZXRMODJT?=
 =?utf-8?B?Mm0vZ2k0MFNQdjRHandWUlFWWklwN0hNV2dJTWhuaTVzQm1qK0FtZXNxZThU?=
 =?utf-8?B?Y1FIVk53NTY2KzFPcGVGT2VUeStYSnJnclBVQXVmcFVKQ3lmbTYzSWljcVh4?=
 =?utf-8?B?dUI5RlFhOXBCNXdSWXMxRXhaQ3RHb2pWOGR4MzBKMUpXZTEwclMwZTFzOTdz?=
 =?utf-8?B?VWlzNGpXY2JXWFE2L2tuUFRkejlOakIxVCtKS0FDQnkwOTBuWlVjTmZrdWJy?=
 =?utf-8?B?SXhSRWN0NDI2QW9SQUd2a0hXUk5iZGVzRURDQS85ZU5wL1FEb1dyb0gxRWtw?=
 =?utf-8?B?QnZCaEd3bjJ2WldySjJwTStmM3d5ZmlXa0djZnAxTGFKeHRmTEVYem9naGVQ?=
 =?utf-8?B?dHBvbG1vS3pDdkpWd1c3VG1weEEzUDZ5V3Bnb0plWldubi95ZTA5dlozZU1t?=
 =?utf-8?B?R3pDc1F3MmtCMkRNUVBvM3BKb1J5Z0FTaVZQQmU1cVpYdkpsdU1iWS9OVVV6?=
 =?utf-8?B?M0xSUkk3YkptdHc0T2NlT3ZjdGN2SnBHR1IyUFdRN05JNWVITVRIYllieTcy?=
 =?utf-8?B?N1ZUVmlQR2tvMlBvSUx2TWV4ZW5aUmJNdmN2U0k3UUJWckxybW8rY1BUOUla?=
 =?utf-8?B?N0pPSG5kS1BIU3NqK1VBZEUwTG50L0Fzai9DdGpMSk1wYm85dWttRlNQV2ZD?=
 =?utf-8?B?eEZyUUIvK0RYejIvamdaSkJOSjdnVTVMZ211MEM5MXZ6bnFEQ2FmbnhOZlpQ?=
 =?utf-8?B?Tjd3a2RrT3FpWitTMWVQS29JTWNWUmh4RnJSNms1NDZPRnlLNVJTOTEzakww?=
 =?utf-8?B?THllLzFpcHl5VkRDSTA4TThRRzV5ZkJ1R1JpOVh2NytZV1JLR3N4VGEzaGFE?=
 =?utf-8?B?S2dzVHVybEhWc2x1Y2xYcWhPOGRnU0xwMWVZbDUxUFM4TFNDcVNIdlZyM3ZU?=
 =?utf-8?B?UVF3V21SMGpyTmpnQ1YyazNqRUptQlpJMU5SeWJscXJEWnRoVzBkQWYvM2wv?=
 =?utf-8?B?WGpQazZ5bEdBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR12MB5968.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Tkt1dDdDSFVDTEQ2dmtqbE9QN3E5U216VTNzUjZaenpLek81Z1FqWG5XMlNm?=
 =?utf-8?B?TGNzdnR2TnVwdEhYTDBBZFgzSWhmOW43RkRobm5pODNMb28zaWY5c0VuZVU3?=
 =?utf-8?B?YzJHaVdEUVNYWE9tUnV2NGdRTit4emtEM1lSNTc0UTYxL0pkb1poR2ozNVd2?=
 =?utf-8?B?Y1FiK2c2dnlPcjVmbzFiVElnK0pidlg4TEkwVTNZTFNOeDZPM3dUOFBaTnpP?=
 =?utf-8?B?Q1d6M05oSHFqYVhrbk5qWWJoR1pGNXZnNzBhaXdYSXo0RVRMdjNvN3VaQk1i?=
 =?utf-8?B?RENMRSs2Tm9MeEFLZmlYRnNkVnlNMVdiU3lSUmtabzNtckp4U0dlRzEvZXR5?=
 =?utf-8?B?TTVQMVRYUWozbGRsc2M4R3Bzd29wNlpOMW5sV0hlOHIxYjJ6ckV1ZTZQWUx2?=
 =?utf-8?B?YnhUTGNFS3ZicDR3Q29FL20vY1QrV29KQmJKSy9hZVU3aUZWdCtxY00rNmpR?=
 =?utf-8?B?NGZuWWhESVVVNGVYQW5KZWtzakEvZWprQjdmREErbUZ6NEh5UkJYdVNZNkVR?=
 =?utf-8?B?QzdnZHJreENxVSs5MUxaK1Z5TmR5YTBPQU10WTNkOVFRSHJQbzJKNXUwTGxj?=
 =?utf-8?B?MjhLNHoxMW1iSk4xZFNtQyt2OCtDK0FnaS9sM3VjMkhHbFVaS3hkS1BkV3Rm?=
 =?utf-8?B?YTZzWFFCSy9Vanl6UzB4QTJDUVVXSHUrdEZMVTlVeUNCS0l1eXdTb2FucWZX?=
 =?utf-8?B?WFJUMXdXa3VZZkZGdFlLTjZxamswOFJYdkQ5QVBjQkh3RTg5SllDbDdheGFC?=
 =?utf-8?B?MEVrSUVrVlAwKzRoOU9TWStMR1d4cEVrTE9keEx2RGtKOTYzTng3ck1TRlFh?=
 =?utf-8?B?YkpHWXFVa2V2bnhLYlEwZm5EWmt6ZzMwYVNWOWlPSEd0Z1pSVDRGOEtBRUR2?=
 =?utf-8?B?VmFhN3E4VThWbVFEdWd4SlcxV3RsbEdYZUhNVDZjTDM3RCtXSnk4YVc1RG1p?=
 =?utf-8?B?NXJaQzl3YjBuSTVRWEswTVpKdTd6MDVKbzRmQnV0cEFBQXVzMUpFOStFc0lI?=
 =?utf-8?B?ZkdPNjNNTFlQanBLRnEzanBsWEd6Q1Z2b0pLc3FuTGE0QURUbG95OENIM3ps?=
 =?utf-8?B?bkZ1c3dJUzVzb25SNXluVzgrQVpaYW9mbzZtY2c4Mm9TdFFsV0xLN1hGMFNF?=
 =?utf-8?B?R2I2MEpIZC9veEpMYjdjTmpwSTZTNTgzbStuc0VidGcrSjZTNjJ3WkJHZ09x?=
 =?utf-8?B?ZE54VmQ2dU9sTVp1cFlIWnM0bFRtemFpU29YUlQvazMybm9tSXNWZDRWa2p3?=
 =?utf-8?B?ZE5VVzF3MjFxWW1hTHZEeVB5MlFyZFRDWS9RN3BpTDhDTGt3U0lPbXZmSy9p?=
 =?utf-8?B?a2VYUDkwYU95cUh6dGwwc0cxeldxQklJK25tVnlpc3B1ZDhtMDNjK3ZXUStO?=
 =?utf-8?B?T29VZzM2NWYrWng3UGZCQkI0UXRvcWRpWU5pYktodUFBZldjMEJVOW9qaVNP?=
 =?utf-8?B?NFFqWnJxUkpvVkFMcjhBd01NazdHaGtFZURHekhJaTYvSTAyam5pYlJ1aVhq?=
 =?utf-8?B?d2FnckFHMjRFSThUb1RnRWlsREEra0xCeHAwYTBvODJIMC8ybHBWZGszU016?=
 =?utf-8?B?R20xOWhxRll2VW9ZQ3RBdVdCVDFpYlJ0ZmlNOSs5NCt1Y1dwSXE5TS9pS0NC?=
 =?utf-8?B?Q3VpL3RZVGg2WklUT0NEajlqeG9RV2NaaytaSVp6YlBsbGhZQ1BZMlhMUCt5?=
 =?utf-8?B?cE1VTERJV0o2MEM3WjV4aXV2cXgvR1M2aloxcXlXNksxOHRNVzdiaHVMRHEz?=
 =?utf-8?B?YzlHb1c3YS9NaSticU5xV1NvdmVhbmYydFdJTlljMXg1c2hpZHlKN0xzUW42?=
 =?utf-8?B?clpqakZmcHNhZERIaGM1REVDM1RXODJFNlJoSWMxZ3Y2UDRia3NnY25odnFr?=
 =?utf-8?B?cjdSancxK2lXQTY3Mmgyc3lsbkZNb0VwUG95SVR3dmFjTDBZeGtOVUJyM3JE?=
 =?utf-8?B?bXRlY2tPOVlud3VDQmFtc1o5YndBaTFvUVFZb1NSeUdvU3VkVXpCeHNFZTZT?=
 =?utf-8?B?aG5WMlo5UjZkVmJpR0FybGRqRUJlbkhGSFE5K01aV3U4R3R5T2lCR2JVUVAv?=
 =?utf-8?B?NTd4cW01dVoyazV6MVM4Z29zbm5GdktTLzJGZ2F5NkVyMnhHWmEyTUlldkNX?=
 =?utf-8?Q?yameUZd7a7etedLMH9snbqodH?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6db0c1f5-4abb-4c18-a69f-08dde5b49414
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5968.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2025 21:56:29.9726 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5T6CVjeHnVk0WY+2aiqnFm4xW+8ZufF8+HfXtONnAYCsPlZ9qqEcoY1zg45kZuL3r1JZhcGviBAVZtoAEOrNjw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4126
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

On 8/27/25 1:39 AM, Alexandre Courbot wrote:
> On Wed Aug 27, 2025 at 9:29 AM JST, John Hubbard wrote:
>> On 8/25/25 9:07 PM, Alexandre Courbot wrote:
>> ...
>> But the point is that the admin can be made simpler for the reviewers--even
>> those of us who know exactly what you're up to. And we should keep
>> that in mind, especially because there are many more of these situations
>> coming soon.
> 
> Right, b4 is supposed to be able to help with this as well, but indeed a

It really doesn't quite, though.

It is true that "base" (git format-patch --base) helps "b4 am" set things
up, but then a subsequent "git am" fails due to missing prerequisites.

b4 isn't set up to go retrieve those, on its own anyway.


thanks,
-- 
John Hubbard

