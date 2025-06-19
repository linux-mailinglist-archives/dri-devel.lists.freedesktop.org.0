Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20CEEAE06ED
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jun 2025 15:24:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9614510E040;
	Thu, 19 Jun 2025 13:24:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="h8Y0JTQM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2048.outbound.protection.outlook.com [40.107.102.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D728110E040;
 Thu, 19 Jun 2025 13:24:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qTkeJtnQfLjb+hlWq3dl1KcvvJFsLONtcWwEx4pCkMdA/IQwl5h3Jxo5WV+i2ZRJ56KJbkA41R4N+4j4/VVnbZGVAbXjmcoipmLsIPNupJ3mspDFC1LXEm+kMhvYj06sgR+AOvzzfpeVlOEwuOafSTC9RhoBBrTOiWmM0w5swc5vrXzZFzmD+58mLrIfD+/PtRnzK8VtnSL7rgRRxG/Nv5tow5huMMO2Ny+oNxqZgbNQniQxqRLFF1hQk/FEa7lMV7Gxrf8QnIocwIqk/qv/WSC9dzs5p665RGMQM6MvxpZ6dGOpW19sMzEahcNa9vbC/xyph+EyuMbkux2o92Kyrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o7YPgagoc1cT8oVRnkuq42W/oMfa5rNKKti15fLBZnM=;
 b=flNqYrgOimjRo5/ebHqsbegki+TXhln+a9hcyHs1lIqMuHu5H94kFCDt5L/w4KltqsyuVdYkpjYVhayMDI63grpQcG3aZTG80YMIK+PZwCG2Ibn3G8YmhxDxUfSyttDiUuo/mZKHX7ZpEmk6mGMBF9RpOJWJFU09OzLtt7IbGMaO0Cz8D9BTn6mFm3OjkFvV2/ZHzEEDi2WDD0SrMk58zWc241syckomeqgh6k04F7qsHWzfdVzj++ej/+nF8LrJKJ8YDZQOwRIWS9AMFSrJGCQzxVZLw1RCrPGCIOCDAHQBOiqX/NeYVi6BhCaUEUPqwaAjAfRuLzBtDOiS+tJvWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o7YPgagoc1cT8oVRnkuq42W/oMfa5rNKKti15fLBZnM=;
 b=h8Y0JTQM8RTU72dAHrXXyD3dHBkIRKRV7RFmQOO8afiWDGWIDyM7q+2gbhmrHLLgoUJlF1/cH3vHGPkpLB69qU5Nkyl7tWcWXtsG0T6jJrVO6lH+FT7Ijli3aW6oYYM9d9PSPzuvmLiOopZ74TW/wF6pGDUOZkxBixboL3rAsVhFyW14oPGaCMnEuaXHGtuPLWjO0+A+ebQjm3sxovPb0XrmVhmRrhI+WZrEr+wxx7AYtVPFW3VR9Lkejt9jkz4Xn5Ud/3WN1t1qeYuAg8XFKcESTf+D4MeiYE5JzL84uaAfl5slGlpf/syYp6t+3ktzR1WHdIa6o8Evp/Vmj6SeJw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by PH7PR12MB8122.namprd12.prod.outlook.com (2603:10b6:510:2b7::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.20; Thu, 19 Jun
 2025 13:24:24 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8857.019; Thu, 19 Jun 2025
 13:24:23 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Subject: [PATCH v6 00/24] nova-core: run FWSEC-FRTS to perform first stage
 of GSP initialization
Date: Thu, 19 Jun 2025 22:23:44 +0900
Message-Id: <20250619-nova-frts-v6-0-ecf41ef99252@nvidia.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGEPVGgC/2XPTU4EIRAF4KtMWIuhir/gynsYFzQUDgu7FVqim
 fTdZUaTZtLLV6nvVerCKpVMlT2dLqxQyzUvcw/m4cTC2c9vxHPsmaFALRRYPi/N81TWyp2hhM7
 5iTCwvv9RKOXvW9fL618u9PnVK9d9eM51XcrP7V6D6/S/GsVQ3YALTiFCCB6lM/J5bjlm/xiWd
 3atabhTLWCk2OmkPEgLVktpD1SOdHyoyU5TmARa5axW8UDVQPHuqupU6JiiStIp6w5U79QAjlR
 3CmrylnwCY6Y7um3bL4un6zakAQAA
X-Change-ID: 20250417-nova-frts-96ef299abe2c
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Benno Lossin <lossin@kernel.org>
Cc: John Hubbard <jhubbard@nvidia.com>, Ben Skeggs <bskeggs@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, Alexandre Courbot <acourbot@nvidia.com>, 
 Benno Lossin <lossin@kernel.org>, Lyude Paul <lyude@redhat.com>, 
 Shirish Baskaran <sbaskaran@nvidia.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: TYCPR01CA0206.jpnprd01.prod.outlook.com
 (2603:1096:405:7a::17) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|PH7PR12MB8122:EE_
X-MS-Office365-Filtering-Correlation-Id: cfab4122-0ad9-4843-9318-08ddaf349b3f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|10070799003|1800799024|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?THZndWl0OGlscG1xVEhTb0EyMkRwMEx4S1NaazM5VzV6NXlkSmFZa0c5bjlH?=
 =?utf-8?B?MG1OeEorWm55TFFpZDdVdEFoVVRudGNDbHdyNS9jNEFFWGI5OC9EQUNXdklI?=
 =?utf-8?B?MXlTOFhkVzVpNmtTaXNta212M0tHVHo3SnQ2aEpDd3VHTHMzR2laZHhUWmZF?=
 =?utf-8?B?cXBBaE1FVS9FWEp6MGYwR2w1UFpWZ0w5MEMvTTBLV0oxUDNneGlkMkVMaXl5?=
 =?utf-8?B?cTU0TUxHUHhSaXhHTjluRGdWcTVBTEgzdFcxVS9tZ3RsQjVQWDlOZ083YlJS?=
 =?utf-8?B?UC9EbStKaU04cHFKYVBoUjBPM0ozM290ZU5WZlVzMTMyenZvaTk3Wmd1cTNt?=
 =?utf-8?B?Q3JHMWFmTFlDbkg4WDEyT2xWSXJsbGxkMHQvRUV0RlBQd2xWWjNGRnluODgv?=
 =?utf-8?B?R09LUG15L3VSTVRqeTdFeEFHTE41eGhJSjVWKzRNanlyUnlnMDNsb0VrTFN1?=
 =?utf-8?B?UlhWZkYycEl3QXlkNlRiMjdlU2tIcGp1WFhqNi9RUTVrK1pTcExET0VGR3FC?=
 =?utf-8?B?UDIrOGsxYWpMU1Urd1NiZlBsZWtUd0FVczlaKzBvNlk4cEpjUW5xeVg1QUJ6?=
 =?utf-8?B?VkpQUlZIVXFDQ1pHT3Vvamtqc3pvUXNkakV0dlBTWTZsMCtxbmN0WXdqUW9q?=
 =?utf-8?B?Q05EQnZYTzdKRVFyeG54dkFvLzgwNjFSV2RMdUFJUlZ4dFZqMGZaS3dHZzRR?=
 =?utf-8?B?VEQzcEF4M3JpLzFvaVh0bFc3RHRHU0t2bmFmWFhSdGpudU5WM3pneWVSMEdC?=
 =?utf-8?B?L2NlR3dRM0d5dTRLeHpDZjJUUkJDanVaSUZHc2NMTFJiRFY5NnZzTVJEcjlR?=
 =?utf-8?B?ZWYwOUlnUVpRNzMrUUhIS2tST3lzN0sveFdvdWZnOUpNdXJ4MEh0S1RDYm01?=
 =?utf-8?B?VFRPVE5RY2pQNm9uc2FpY1pVUWNDK1ZFckRnSjdZZVhEZG1tOGRxNEMyd2x1?=
 =?utf-8?B?YUhPaXhRektkZC9EdURsQjE3TVEvMmt3eFYxMEo4NFp0QkxtOEJjVVFKL0NJ?=
 =?utf-8?B?TXlhVXY2REtzbWkzQVlXbi9qanRtbXNPOTNQR1pXazJGZnphb1FkRmdOeWVp?=
 =?utf-8?B?MWNuWThjUS9mWGRUem1RTzhoSXZuZFJoZ3ZpNDl4SHZnVDV0ekpkNXZialFR?=
 =?utf-8?B?T1pCYlFNaE1mUjdEZ0IvTHlZc2d2ZS9henBGaXh2OXQvbENKazVMeERkMWwx?=
 =?utf-8?B?cG1NRkUreWkxa2x0d0Q4cmZWLzA2QzN5dDg3bDVCYVJXK1ZJTUhRdk5ZRmtk?=
 =?utf-8?B?OC92RURGbkloNkxlVjA1dFg4QnVGUk8zMVNrUnJXUjlTbEpKMFViSjd1N1Zh?=
 =?utf-8?B?YWtHNEo0dGFsMnlvVWJGVldIRDk5TFQ1QzhUOEdlU1RtN3pxY2xBd1dsVDAx?=
 =?utf-8?B?T2Q3enFJQUM0MWgzTVpBNHlsQU5NZFRWQlpicnJjTytadUdHOGxaRjVudXdT?=
 =?utf-8?B?SlAzNEc2bk1CWnJGWFcwM0dQQ1VYMXBQaENtM0NTVVJ5VE00cjZNaWVQWEpN?=
 =?utf-8?B?VzVVelJ3SlVudEdCSEtXZk4xZnNxb2N6TU9yWnJsSTVhS2d0VjM4ZE8vNjdR?=
 =?utf-8?B?ZFdla1NWL3JzTUNnM2FLMCtsYzM0Sm0raXlPN0VQV0RDVnFHRXM0TXptZWdB?=
 =?utf-8?B?MlNKSDhSeU56V1hNeVVFNmFlcU44dUxhWHJqZTlZRjQ1YTZkL290Q3Fqci9x?=
 =?utf-8?B?WHNKckl4SjUxQ3pFWGt0WFU4UDNYUXE4MDIwZ25tOUhJWXlaa251eVA5akpF?=
 =?utf-8?B?NGExOWhaclE4RkpYRXNCRnBBKzhqRFdDSS9RTks0cm0vZ3BCNi94TkFMWWlo?=
 =?utf-8?B?VkpJR05IOVl2VklhZWNtckEvNTBJS1BwVUdPRHJBMVNLQU0vRTlURUNDamd2?=
 =?utf-8?B?cXZqYWVPbjdQa29Vb3RwRGpScGN5bHJ6NUZOTStqQjg0blRkZTcyZW4ySTY1?=
 =?utf-8?B?MFRHM0M3ZlRtL0FESERvOWpLcGYrUm5TUE5yUkJVRG1NYm1YZHlxRlpkM3FN?=
 =?utf-8?B?ellMd3JtbDR3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(10070799003)(1800799024)(366016)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NGpjQnJ2Nk5wTEVUaHFIRTI4elhJLzhCQkdxd0xVa0ZpejdDMHVwWVNJSmFB?=
 =?utf-8?B?am51elJYcENSYlp5Qm00bWZxQU9HN295aVo2ZHAzU3d3WnBLbnp6dFNPQWVP?=
 =?utf-8?B?L3BXR3dtM3FIV0pobVo2UkNiTkQ2aVRIcnEyays1OUEwVDB3VUhGNGxIMGZs?=
 =?utf-8?B?b2VQNVJBa25KeWwyZGpaYUJkdmhIbGN5amtlUFRuL2t5WE5mSjBhU21CYVNi?=
 =?utf-8?B?MGVVYkZ6ZXBHUytGWktnSnd3bDI4SDBWMm82TVJwK3JUclpUZU5iYVZrZmNl?=
 =?utf-8?B?eGlnUzZNVExiemJYVXFNRVY3Q0hZS3J5MENGeHZPVnZHRHUvRllDWFFCQ2w5?=
 =?utf-8?B?ejhEQ1ZvM05yS3hGWnFyaFEzbWsxUEJNL3FhQjJML093QSs4WG1EcFhKeXcy?=
 =?utf-8?B?Y3p6OXpqS1VuN3pSK21KRzR2WTh6a2o2dU5tZlZRVWNHa000a1lsV1VNeC9P?=
 =?utf-8?B?K3NSYXcyMVliWDZPN09sTzJKRml0QmdrY0lzMU0wWTdPaS9VOHNPWW5ic1RQ?=
 =?utf-8?B?VHEwbmFRaG9FQ09qY1RlcGxHS3k5MGVmdUhOY25vVGczWHB6QUkySGl6UzZm?=
 =?utf-8?B?cjY1U2FZTVM5Rm1lZUx4bmFHZnJoMHk4bnZHWGE4ejZqc1VET2FYWnZ1RzVi?=
 =?utf-8?B?ODlhc1RNcXdXTC8yWVJ4di9RNG45UDVoSCtwaUVtM3g1MWw4SENPKzdvRng0?=
 =?utf-8?B?YzBtaDlQSUVSZzF6OHZRWDNWWTVFd2RJZ0RxdCtuOU82UjJ2ZytqK2Jod0V3?=
 =?utf-8?B?YjFQejFlRlhQM1IrMTNTWUV5Mk9jcmdSZGRtUjhLcXlyQVhBWFVaM1huTHpl?=
 =?utf-8?B?c1J4SS9Nc0Q5cW8wdTgvWTRNZnE5cnNrVGJmeXNDOGtKYmF4QzUrL3EwZjFh?=
 =?utf-8?B?OGNET2kxMkwwOFlRSkJ2d1JLOE9HdGhEL2hPcm5kS0RTeFl3QkJWS1FWTWJP?=
 =?utf-8?B?cGhGSlpXWktlOURXODBwNk43Vk11YVQ1d0pqSll4dDBVaDBhVXgzK3BoR1Fj?=
 =?utf-8?B?SVYwdWxEenBKa0g0TFZSNGRkQ2pNN0VHK3h3K3pZOEJINlhLOTh3UWxPQVVz?=
 =?utf-8?B?cmNUMmhWSjhZdWhxNmlwN1BUdkFlMWVEZnlIQ1RWbSsrWkRoUks1b3ZKbjg0?=
 =?utf-8?B?b2xWb0J4TVJtT1VqRWVVUzJzVDQ2cC91dUx3OGIrMFFvd0RrNzE5a2NLQmx0?=
 =?utf-8?B?Q2pGOUdKSzViUm8xdXk0ejVHcklTMlFBOXVWZll3Uko1czlaWHJMOXE2cy81?=
 =?utf-8?B?ZW1hZ1o5QjFycVJleEt1c2RiV2QrMGdaZlYrVDJNRzdWQ0g2dlQ0cE4wWVlz?=
 =?utf-8?B?ZFUvb1NjN0lxQis5c20vZHppRlJzQnVHbkRCSWRrVzczeXcrT0tnUHA3dDB5?=
 =?utf-8?B?OWFhWHRvNlExV1dLMVlJRHpKWG50Q1gwcWhJRTlsK3dFYmpxT1AwOHJDUlh3?=
 =?utf-8?B?dzl0U3p5ZTB2TlprRFRLNE9Gd1F4cGZ3NVFJMU11OFFHbWNrcnFDNnRydTNU?=
 =?utf-8?B?ZmwzelNvRi82UlhlU0RUY1JSckFBQlIvR3NIS3AreE1GQ0lwMlBsSGIyVXBU?=
 =?utf-8?B?V3pvWUxQU0M5WjRSQktEc1IyTkppTG9vaTVXTVp6MmwrQmpPZDJXQkdZOHh2?=
 =?utf-8?B?TjlPaVFxVDNLc2UzMjM2ejZTTTJlL0JuQlA4dUs5MTJqTHo5YVV3MVdIM2p1?=
 =?utf-8?B?NU5LcndqWkVXUVNMUm9Wb3dRMFdYWEpNWDY4S0RnUmQ1c0tIc29UbnM3Sllh?=
 =?utf-8?B?TjNmb2FwVk9mNmV2OEJLejhXUFNaN2dxSnNMSll6RDg1K3YyVW5IMVdhd1g0?=
 =?utf-8?B?OTZjN2xtTElDek5wSFFHbG9kOEQrVkxVaGxDazBHbFYvbWtlRjZqNWQyMDJ6?=
 =?utf-8?B?T0RvWTNJQURjSWVReWRjYXQ1empacktZemV5NzdNYXVTZUQ2QjRkdDZSTmFa?=
 =?utf-8?B?bmViTk43TTZFNC9LajBRMGJVYlhEM1E5SzkxSFRySmk3bm9xNlVDT1lPTWRu?=
 =?utf-8?B?d01ZcVN2WTYxTk1xbHpUUkxCb2NLZ0VjcGt1cFpuR0dRdElvZ0VKekU5cEkv?=
 =?utf-8?B?TEU4SERJSGdvUkdCd0NKVUp4Y1pRL0QwdnBza3ZMc2RxMkV5YUpQaTVQVlZQ?=
 =?utf-8?B?M1ZFU0xRZi8rdnBodGZGVEs5YXdHZXJlUnNVQ1c3L21RMzNITmZyOTJtODZz?=
 =?utf-8?Q?U9Wm6wmL6n7EzQZ4m5bfMTuMGmOKGXhBWqvMWfpc9V/3?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cfab4122-0ad9-4843-9318-08ddaf349b3f
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2025 13:24:23.7329 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Kn9HqKjl9kDUg6JH68ZrKLa8B591FiGYNftEo1A4swrYRKWK5q2j6Jk7UKdE1Ex2wZAaFCxg5APDXkdXbSaJNg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8122
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

Hi everyone,

After discussion, and since the `num` module seems to be taking more
time to reach consensus than the rest of this series, I have split it
into its own patch series and use ad-hoc code in Nova (only a handful of
places thankfully) for now that will be replaced by the `num` patch
series. This will also allow it to maybe get more attention as it was
until now buried inside a loosely-related patch series.

This also includes an important fix for a bug discovered by Ben Skeggs
in the falcon code: the bit indicating the completion of memory
scrubbing was interpreted incorrectly, which created a race condition
that could result in a failure to boot the GSP. :O

Other than that, a few more minor refinements took place, but nothing
that changes this series considerably. The last patch tries to organize
the increasing number of TODO items we have in the code; until they can
be addressed, it would be nice to understand which task in `todo.rst`
they correspond to, so I took the freedom to annotate them all to that
effect.

Usual disclaimer: this series currently only successfully probes Ampere
GPUs, and does not allow the GPU to do anything useful yet. Upon
successful probe, the driver will only display the range of the WPR2
region constructed by FWSEC-FRTS with debug priority:

  [   95.436000] NovaCore 0000:01:00.0: WPR2: 0xffc00000-0xffce0000
  [   95.436002] NovaCore 0000:01:00.0: GPU instance built

This series is based on v6.16-rc1 with no other dependencies.

There are bits of documentation still missing, these are addressed by
Joel in his own documentation patch series [1]. I'll also double-check
and send follow-up patches if anything is still missing after that.

[1] https://lore.kernel.org/rust-for-linux/20250503040802.1411285-1-joelagnelf@nvidia.com/

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
Changes in v6:
- Add `dma_handle_with_offset` method to CoherentAllocation.
- Move the `num` module into its own patchset and use ad-hoc code for
  now.
- Add new items (and remove obsolete ones) to the TODO tag `TODO`
  entries in the code with their corresponding task in the list.
- Add `TIMEOUT:` comments wherever a timeout is used.
- Fix bug while waiting for falcon mem scrubbing to finish (thanks Ben
  Skeggs!)
- Pass the firwmare object instead of its DMA handle in `dma_wr`.
- Fix safety statements in `fwsec.rs`.
- Move FWSEC boot code to `FwsecFirmware` and a helper function of
  `Gpu` to simplify `Gpu::new`.
- Add helper methods to NV_PFB_PRI_MMU_WPR2_ADDR_* to obtain the exact
  address.
- Fix build errors and warnings with Rust 1.78.
- Link to v5: https://lore.kernel.org/r/20250612-nova-frts-v5-0-14ba7eaf166b@nvidia.com

Changes in v5:
- Rebased on top of 6.16-rc1.
- Improve invariants of CoherentAllocation related to the new `size`
  method.
- Use SZ_* consts when redefining BAR0 size.
- Split VBIOS patch into 3 patches (Joel)
- Convert all `Result<()>` into `Result`.
- Use `::cast<T>()` instead of ` as ` to convert pointer types.
- Use `KBox` instead of `Arc` for falcon HALs.
- Do not use `get_` prefix on methods that do not increase reference
  count.
- Replace arbitrary immediate values with proper constants.
- Use EIO to indicate firmware errors.
- Use inspect_err to be more verbose on which step of the FWSEC setup
  failed.
- Move sysmem flush page into its own type and add its registration to
  the FB HAL.
- Turn HAL getters into standalone functions.
- Patch FWSEC command at construction time.
- Force the signing stage (or an explicit non-signing state transition)
  on the firmware DMA objects.
- Link to v4: https://lore.kernel.org/r/20250521-nova-frts-v4-0-05dfd4f39479@nvidia.com

Changes in v4:
- Improve documentation of falcon security modes (thanks Joel!)
- Add the definition of the size of CoherentAllocation as one of its
  invariants.
- Better document GFW boot progress, registers and use wait_on() helper,
  and move it to `gfw` module instead of `devinit`.
- Add missing TODOs for workarounds waiting to be replaced by in-flight
  R4L features.
- Register macro: add the offset of the register as a type constant, and
  allow register aliases for registers which can be interpreted
  differently depending on context.
- Rework the `num` module using only macros (to allow use of overflowing
  ops), and add the `PowerOfTwo` type.
- Add a proper HAL to the `fb` module.
- Move HAL builders to impl blocks of Chipset.
- Add proper types and traits for signatures.
- Proactively split FalconFirmware into distinct traits to ease
  management of v2 vs v3 FWSEC headers that will be needed for Turing
  support.
- Link to v3:
  https://lore.kernel.org/r/20250507-nova-frts-v3-0-fcb02749754d@nvidia.com

Changes in v3:
- Rebased on top of latest nova-next.
- Use the new Devres::access() and remove the now unneeded with_bar!()
  macro.
- Dropped `rust: devres: allow to borrow a reference to the resource's
  Device` as it is not needed anymore.
- Fixed more erroneous uses of `ERANGE` error.
- Optimized alignment computations of the FB layout a bit.
- Link to v2: https://lore.kernel.org/r/20250501-nova-frts-v2-0-b4a137175337@nvidia.com

Changes in v2:
- Rebased on latest nova-next.
- Fixed all clippy warnings.
- Added `count` and `size` methods to `CoherentAllocation`.
- Added method to obtain a reference to the `Device` from a `Devres`
  (this is super convenient).
- Split `DmaObject` into its own patch and added `Deref` implementation.
- Squashed field names from [3] into "extract FWSEC from BIOS".
- Fixed erroneous use of `ERANGE` error.
- Reworked `register!()` macro towards a more intuitive syntax, moved
  its helper macros into internal rules to avoid polluting the macro
  namespace.
- Renamed all registers to capital snake case to better match OpenRM.
- Removed declarations for registers that are not used yet.
- Added more documentation for items not covered by Joel's documentation
  patches.
- Removed timer device and replaced it with a helper function using
  `Ktime`. This also made [4] unneeded so it is dropped.
- Unregister the sysmem flush page upon device destruction.
- ... probably more that I forgot. >_<
- Link to v1: https://lore.kernel.org/r/20250420-nova-frts-v1-0-ecd1cca23963@nvidia.com

[3] https://lore.kernel.org/all/20250423225405.139613-6-joelagnelf@nvidia.com/
[4] https://lore.kernel.org/lkml/20250420-nova-frts-v1-1-ecd1cca23963@nvidia.com/

---
Alexandre Courbot (21):
      rust: dma: fix comment
      rust: dma: expose the count and size of CoherentAllocation
      rust: dma: add dma_handle_with_offset method to CoherentAllocation
      rust: make ETIMEDOUT error available
      rust: sizes: add constants up to SZ_2G
      gpu: nova-core: use absolute paths in register!() macro
      gpu: nova-core: add delimiter for helper rules in register!() macro
      gpu: nova-core: expose the offset of each register as a type constant
      gpu: nova-core: allow register aliases
      gpu: nova-core: increase BAR0 size to 16MB
      gpu: nova-core: add helper function to wait on condition
      gpu: nova-core: wait for GFW_BOOT completion
      gpu: nova-core: add DMA object struct
      gpu: nova-core: register sysmem flush page
      gpu: nova-core: add falcon register definitions and base code
      gpu: nova-core: firmware: add ucode descriptor used by FWSEC-FRTS
      gpu: nova-core: compute layout of the FRTS region
      gpu: nova-core: add types for patching firmware binaries
      gpu: nova-core: extract FWSEC from BIOS and patch it to run FWSEC-FRTS
      gpu: nova-core: load and run FWSEC-FRTS
      gpu: nova-core: update and annotate TODO list

Joel Fernandes (3):
      gpu: nova-core: vbios: Add base support for VBIOS construction and iteration
      gpu: nova-core: vbios: Add support to look up PMU table in FWSEC
      gpu: nova-core: vbios: Add support for FWSEC ucode extraction

 Documentation/gpu/nova/core/todo.rst      |  107 +--
 drivers/gpu/nova-core/dma.rs              |   58 ++
 drivers/gpu/nova-core/driver.rs           |    6 +-
 drivers/gpu/nova-core/falcon.rs           |  554 ++++++++++++++
 drivers/gpu/nova-core/falcon/gsp.rs       |   24 +
 drivers/gpu/nova-core/falcon/hal.rs       |   54 ++
 drivers/gpu/nova-core/falcon/hal/ga102.rs |  119 +++
 drivers/gpu/nova-core/falcon/sec2.rs      |   10 +
 drivers/gpu/nova-core/fb.rs               |  136 ++++
 drivers/gpu/nova-core/fb/hal.rs           |   39 +
 drivers/gpu/nova-core/fb/hal/ga100.rs     |   57 ++
 drivers/gpu/nova-core/fb/hal/ga102.rs     |   36 +
 drivers/gpu/nova-core/fb/hal/tu102.rs     |   58 ++
 drivers/gpu/nova-core/firmware.rs         |  108 +++
 drivers/gpu/nova-core/firmware/fwsec.rs   |  423 +++++++++++
 drivers/gpu/nova-core/gfw.rs              |   41 +
 drivers/gpu/nova-core/gpu.rs              |  132 +++-
 drivers/gpu/nova-core/nova_core.rs        |    5 +
 drivers/gpu/nova-core/regs.rs             |  288 +++++++
 drivers/gpu/nova-core/regs/macros.rs      |   65 +-
 drivers/gpu/nova-core/util.rs             |   28 +
 drivers/gpu/nova-core/vbios.rs            | 1157 +++++++++++++++++++++++++++++
 rust/kernel/dma.rs                        |   48 +-
 rust/kernel/error.rs                      |    1 +
 rust/kernel/sizes.rs                      |   24 +
 25 files changed, 3504 insertions(+), 74 deletions(-)
---
base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
change-id: 20250417-nova-frts-96ef299abe2c

Best regards,
-- 
Alexandre Courbot <acourbot@nvidia.com>

