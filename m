Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03931B50CEA
	for <lists+dri-devel@lfdr.de>; Wed, 10 Sep 2025 06:48:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A02510E2AD;
	Wed, 10 Sep 2025 04:48:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="K4feRcNt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2074.outbound.protection.outlook.com [40.107.94.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9232610E2AD;
 Wed, 10 Sep 2025 04:48:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GYgt5rOfdUMBXxrNbAy67KCAYcmRuK38B/U/2L46m/MGwkYX7OlfDmRrbt1V1sdSlpHFAA8vUYwg0JpoMzV0cJ8wwp1mOjQRAItxJsjdHeW1vXa0sA15sGHK/8gGPA8mmgFclYpX8Olh8WwEaXk6xpRz7fACrHSPKqt0XCY6ZCZkSdb5GuEUZpTPqZFjSKTUFVCXww2+vxei8fuPedkU5j5njcpAV5hcSIOdvgiImegHslCNqnFDZPWfpauXfHAa5RxONo3mF3ZwFNSp0Zl9Sdlc/10jDiBbovH6g25Mo1Q8+gd4utySuCb0K4VLlkgEyDXR/+K2m1xBWf4EJ5F2gA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hb8qMDcX5mac49JzlYe/056oZSj0xgXVD881WAENCGU=;
 b=IBheaKUdTsMM+cKuuemRh8Aj2yQbMfSraG0odNJ0F7mS4Z5lquChj4Ytk7YH9V+MlIQNVzB+cgyypqo9RMYvJf57zEMSBQATtl0aH5FmNVk0NK+eWYwcHa2jyivedWo39QYBA/87ntCHEcQUIDEtlxy6qL7RyXJ3ZRm9cu3ZrpEXgMgxqQABulfoMRR3Jf6kwRyomokg+PyHhGvzIVvSIq2JXUSP5zsxnipR36L1ku4Fhq3YONVzooifvgBYbMgMTsg2YRvm4ehau2sA7D4KQzAn++ggx/B1LGqgK+87xI/Dlk9GcukkTVcYkEPf1YRK4JT2dL9ORkpCrNVuYoSoUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hb8qMDcX5mac49JzlYe/056oZSj0xgXVD881WAENCGU=;
 b=K4feRcNtWQS+nJnDtwOOLXNRr9M7SyDlO/jQcrZICSRouTGXwTIQxkn+55FSavajz1cBMllrIphBTrcgbLewrInlYfg2m8fOVfkzP8eJ3q0eNNsDgiqA5XhIC9UcVz4i6HUtvwmHNXVfrKnOK1gq4eeqgaKtMF1Izk9zJqHNuzBEHK5qVJQFGPChDbqfXjalPIWSHFYqQUDLU1pZuXdwVsiuZsdW1nlph/2NEG+47tpH06kqcxNhza4GrDSw7f9v21hqJkKwkLvkqUJRFu9rG5rs03cQjffmmxAGe4jf62ddWvT/uBxe4sjDT51tgT9zPDdvjZ7/ceWsLchKA4eFsA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CH3PR12MB8993.namprd12.prod.outlook.com (2603:10b6:610:17b::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Wed, 10 Sep
 2025 04:48:16 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9094.021; Wed, 10 Sep 2025
 04:48:16 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 10 Sep 2025 13:48:12 +0900
Message-Id: <DCOUK0Z4YV6M.2R0CFE57DY5CR@nvidia.com>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "David Airlie" <airlied@gmail.com>,
 "Simona Vetter" <simona@ffwll.ch>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "John Hubbard"
 <jhubbard@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>, "Joel
 Fernandes" <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v3 02/11] gpu: nova-core: move GSP boot code out of
 `Gpu` constructor
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Danilo Krummrich" <dakr@kernel.org>, "Alexandre Courbot"
 <acourbot@nvidia.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20250902-nova_firmware-v3-0-56854d9c5398@nvidia.com>
 <20250902-nova_firmware-v3-2-56854d9c5398@nvidia.com>
 <843554b1-f4c5-43f5-a23b-583339708bea@kernel.org>
 <DCIZ79KKSSF1.25NJT5ZWR3OOS@nvidia.com>
 <DCJ0UA7KM9AP.OGO7EJB4ORQP@kernel.org>
 <DCOBWF0EZLHF.3FFVAB16SJ3FW@nvidia.com>
 <DCOCL398HXDH.3QH9U6UGGIUP1@kernel.org>
In-Reply-To: <DCOCL398HXDH.3QH9U6UGGIUP1@kernel.org>
X-ClientProxiedBy: TYCP286CA0120.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:29c::20) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CH3PR12MB8993:EE_
X-MS-Office365-Filtering-Correlation-Id: 041a90b3-8b90-496f-4b59-08ddf025416d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|10070799003|7416014|376014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZmpqdHZLUGhuS1UzMFBIL1dkZzBicmdmWE1SOTFJWmdyajZzSEFoZHpxMW9W?=
 =?utf-8?B?Rkk1S0ZCWXp0VVdjbklkOXZBSXdLazRrUmMwdlRDZnUxaW4vUUM0NXBsZWlx?=
 =?utf-8?B?dTJoclB6RC9mVFkyRWZOblRkYzl1bWh4VUVxakgrWXBLckpMSU1CUm5PdkFZ?=
 =?utf-8?B?bW5VckhhT0M0aytMMEJFTjEyUHo4TmY4eXBSSTVleng4a1lLbnIrcEpKSEtG?=
 =?utf-8?B?M1JwMEE3dVVBbjE2ZU5HSFlHQ3gxcEJBYmc1Z3J3djJVOVBzUUduanpvbWZV?=
 =?utf-8?B?QUd5dnptbm9BenBiSFU5RkN5eUxuaHNZL0VCRHErajhENklzZGhEUk5teGFw?=
 =?utf-8?B?RllCdGIwRENTNTRDa1B0TStjMmlFN0crWTh2eGU0ZjUzZlVPVjlKWlhWQTBs?=
 =?utf-8?B?QmoxMGlEQ3U4dEl0ai9EK1NJWjNKSFJpKythQlV6L2hSZlJ2ekZEaGJuRitL?=
 =?utf-8?B?RTNvTHRSZGlwd0ZvcXhBUG1rb2R3MDdvdGdXemRWRnRXdWRZcFpGWjFNbnNm?=
 =?utf-8?B?ODUvT3A3KzJxRnF3Q3ZDVVJvY0dOa25vYnlaZEtnOUFuNTBqQ3FuRmxzYytj?=
 =?utf-8?B?TmJqOG80NUNLeisyNkZFY1R6RjhnWXQ2c0VYV3ExSlFmM2lya3ZYL3FhVGdp?=
 =?utf-8?B?VXdrMExCRFJWREI5RzJ2N0N6YjVPb082bkNwcDZidmdJdWJQOURDZndweEVI?=
 =?utf-8?B?UlViY2VpTmw5Zlo1TXN4Ty84TW5wQ0oweFdFODFMRFRDdC9VOUtVMzFsaFhM?=
 =?utf-8?B?eDNPa2xCdlNHNkN3OEh2WGdFZmlnbnhMZCtRdEJPZTU1UXlXaUwzRGd4Rzhm?=
 =?utf-8?B?OUc0VVZLci82VUxvc1VqUGJhYmFTd2gvdWY3cGRyMEh2azJ0cWYrQktUVUI5?=
 =?utf-8?B?eUhyaGpaZHc1QnJSNFVRV21EQVhPcVlUaUF0TjFDYjU3bTNqM2Y1MGxINEw2?=
 =?utf-8?B?eldyTjB4VllMYUttajlxWTJYN1hIK3pOWUhrVjh0UVB3UXBvL09sZVZHckps?=
 =?utf-8?B?bWhFSktKUUZnNjFSL1dHMFlIM3VENndEN1Q3SmUwREVjV2o1SklEME5aQUxK?=
 =?utf-8?B?cWozUWpHNmsxWGd3c3lkcVFqcjROWEtGVjU4djRBdFR2RC9kVWJNK3ZDRTdi?=
 =?utf-8?B?SUhHS3kwNHFyeTB6a3pBVmE5UExiQWdCY1VCTmhReGNFc3lETkRZakxmdEVk?=
 =?utf-8?B?YXRlUFdyMXhTVFNLT1JJM1NmMjdsTWZFUlczZng3em4zTmw0dklldmV0K09Y?=
 =?utf-8?B?eG9aa3BqTHVuTWVSMVRGVWN1QkpLR2EzV1grZ2k0MHRrWm5tMGxWeGZOZjhY?=
 =?utf-8?B?eGZ0NGpPVDhnN2krSHZNL0ZNT204c1JiUEVBcW1veXpwVG5YdExvOENxMmVZ?=
 =?utf-8?B?SUNaQ1hEMkttR0dLenRmMjhrcWw0YUw4TXhFSnhQdGdsVWlacE9qS245VUx6?=
 =?utf-8?B?eS9hZVo4bVNiT2U0YTl0Q0FJWFd5YVA3Z1BidHNNVW1aN3kyT2FKakxBM1ZS?=
 =?utf-8?B?eWVjam9TUGJ4L2FVVXJoUTVmNVZDdWt0YklISmw4aXk1TXpjbTlwOUhDc29E?=
 =?utf-8?B?RmIvSEFTNlQ1cTdMRTJBdGl4MStDRHZBQ2ovOTVKb2hOaVRiYkNQelBWRWgx?=
 =?utf-8?B?eDFnZVJ6MWUrdEpRSVAvWVl5dksrZlhKY1Q2S1UzZ0hKSnd1cE1yQlJFUmti?=
 =?utf-8?B?c0NXVE9QS3hBdmdYMklpY0xhdnl4MWQwTHRLc3lpNTZQWHpWWWlURFA2bk1a?=
 =?utf-8?B?TjZHMFVjTVBGQmc4SEZZcE9Rbmo1QXRyU1Zvbk1wTG1yQ1FhZVFGSTZ5UTY1?=
 =?utf-8?B?RDBTc3dzNEtpeVlCTlBIbjN0VXhCbFlxcHFZUnQyQ1g0LzFHM01SN3hDYWJG?=
 =?utf-8?B?UTd3Z3hTTGZBRHVaL3VLcFBqRzZJRmN4SDRzNFdoS1ZXbTZ4TWF6amU5UFIy?=
 =?utf-8?Q?h2Fsprsh+PY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(10070799003)(7416014)(376014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WDlqVDR1Y3BodGcya08vWmh4R3UrRWQyYzNmZ0lCOEpUbUZuZlNaQ244NUpq?=
 =?utf-8?B?SU1PdDh0QWZwY2N4OGNFbUVhVUpiUUcxY21ETGZsTFRORlFLRDlPTjRncVpP?=
 =?utf-8?B?QXB6eUljcFdKcnZ2SFgxMUNEL202YXJvVklyb1BQc29vQVZPRm1IbGxpTzBL?=
 =?utf-8?B?UnNuL1NwakVxQzhUdDR1bmg4UnhhTXVJOERuei83RTEwYWoxK2EyWEhSVi9E?=
 =?utf-8?B?VVZvWUphQ1pxbnpoRmVQK3ZGcndMb1FYaTEzQ09Hb2tydDZUdjNLalVZVklz?=
 =?utf-8?B?ZUZGZ3cxZnBtRkY0RTVsT3BrL3JScjVpR05YdEQzYnpQWUZoT0U2aDNvWSsr?=
 =?utf-8?B?dDRZZjRtYnlVQ0pCM2p4b1JtWHFiRlByZHh2M0lPQ01idTdHOG9kc0hObjdW?=
 =?utf-8?B?TGVRVHhUZEdndXpNekozRnNhTEU3QWVKVldRbHZuQU8yTTFBVnRWWHd6K3dj?=
 =?utf-8?B?NVYwL0tVVUdRU0h1SG5YUG11Y0srV09QUlpQRStVZHEzOXl3NnBaaWNGNW05?=
 =?utf-8?B?b0ZjVCtDRi9FK2tSWGhYZ3hhMEUxMVdSTGVqK1pQcG80SHNMcmgrU1FDalVR?=
 =?utf-8?B?eUhXQmptbDRZdGoyd3Q4SVpwazJQWVJDSmhrUWs3czdibWR1eFM4bFUwQTBP?=
 =?utf-8?B?VU53dUErN29rbjZYUi9zalU4bmRlZ29IdU0vUVRpaDNVS0pXZkNuSWtsa3Jr?=
 =?utf-8?B?N2JrYjBBUGQ0ZWpmd05Cd2x4RFJJN2ozSHozSjBKanBKQkNjLzQ2MzBlbjR3?=
 =?utf-8?B?dk0wVG9aNjhsTGc3ck02Ulp3VjdsZGpIaVQ5OWYvTklGc21ySjVyZjhJV1FF?=
 =?utf-8?B?NW5Jb1BSRmplOWE1Um5ZYUJnYWRpcVFMYkk2a2E4UUVWZEdnRGJNZzV0Njcw?=
 =?utf-8?B?bzU3Q0UyaTdTTzBqWDN3QmZ6dFVkZzluSGVBaWZaQjJPeURVNzU1YnRLem1r?=
 =?utf-8?B?b0RMMURxVjE3Mzl3Nk1yZ0RsUXl2THZ2UW1NdlZpS0p1WlBoTHdyNS92QnB0?=
 =?utf-8?B?bEJJbE1Cc0xlOFlZL0ZacjFJamU4ZnU3ZnVuWXFMYndobmpVNjdrMmpId3ky?=
 =?utf-8?B?QU13cGNqVHR2Z2MrMUZwMnl1c2hldEo3Qi83OFpyZkpnOFpBS1BqVWdIbmNS?=
 =?utf-8?B?MDVtSEMreXVoNnRJWEFEMGJTSVBCZERBUHNYMGtudWdCR3BWdEp6clZYdnpI?=
 =?utf-8?B?RGptMVZURDVrRFRYMktDUmtDRVVMSUtGK24wb1dwQmw1VXhmQ2VuWWovOTdu?=
 =?utf-8?B?cXl2dHA0a0s0dzQ3cDZLZy9QRzhmNTJWNU5XMkNjVjZjYjJjOUpuTHNqQTZa?=
 =?utf-8?B?eVQ1elRyRWlJUDFOV3FlUHlBZjkyVWk4c1dsdmNwSWlkbWFOeldxZ3k4YW1z?=
 =?utf-8?B?ZkVrWnhvWkx1L29kK0YvMFR4N3VWWXp1MndqUkJWdzR2cHVJT3NxNmthL2Rj?=
 =?utf-8?B?Ungvby9TZHJwYUxVQ2FSUVVYUlNlcHhKRWR6VG5RMm16RzJOM0tjVjc1ZFhQ?=
 =?utf-8?B?NFM1T0xCMkZnL3JFK0VGemVRUDlxSWVNVnJIUElhclpLWUg3L3R1YVJKdUNJ?=
 =?utf-8?B?Sm9yMVdVNmtQMDIyR3NMRHZYaE5rTEJmM0I3SGZMczlJK1JFYjNIWFRyOXhB?=
 =?utf-8?B?bFlwM0Z6Qi9jWDlKSnc4OGtoN3QwRnZEcm1XK1JzZFNwWkEvN0xxbTJCU2tt?=
 =?utf-8?B?bENXcEd1b3N2YWFEMHNmV2s4TFNZZFBIMDhzSlpyUFJhUmM4Q1A0RnllbFJK?=
 =?utf-8?B?SDdISTFMS2xwNVBKU2dTbnlvT0NqMXc4VnIvaEJwS3VpRDlJYjVGRDFMNFBy?=
 =?utf-8?B?Yk1BdWtTaHIvWGNFbENRUk9BTENpRmpUZFRJK29JOVZOWU54aU82NzM0RUhV?=
 =?utf-8?B?K2JodmhEcE40eEVUVTZqcTNJMDQ5WVRvLytQZlkyR1Z4ZEFCV3VDZGozM0dG?=
 =?utf-8?B?d05aTGdJbWxxZkJBeE5raWMrdjNsNk5jZGI1VUFab1AwdkV6Sm5GVmlCR2wx?=
 =?utf-8?B?cy81S3F0NW1BV25VeXhQN09qTW5HZnQrMGVWWEdRa0NpaXFQc1R5MTd3VTEx?=
 =?utf-8?B?T0J1ZnVDa3BvbkxqWGYwa01oaUZRVXJzbm9mUG5GcndYWFpOOGpUNytUSGth?=
 =?utf-8?B?THdQYUtCVGxSd1BzTzd2VEJXeE4zQU8wYitzcDdHQWlTTkpWckE1VURrUFRW?=
 =?utf-8?Q?X8swVbY80yq9huTxAsvTCDKdIkKNTh9ZKOF7fhENDfcm?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 041a90b3-8b90-496f-4b59-08ddf025416d
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2025 04:48:16.0625 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W1GQrVAYpIc/aSQxcx6TqKe1811EGfHG4VP2B6HWqmjBhEZkDnF9Iz3C/yr1uz455oHBsoGurvD4dRbEHTuK/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8993
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

On Tue Sep 9, 2025 at 11:43 PM JST, Danilo Krummrich wrote:
> On Tue Sep 9, 2025 at 4:11 PM CEST, Alexandre Courbot wrote:
>> On Wed Sep 3, 2025 at 5:27 PM JST, Danilo Krummrich wrote:
>>> On Wed Sep 3, 2025 at 9:10 AM CEST, Alexandre Courbot wrote:
>>>> On Wed Sep 3, 2025 at 8:12 AM JST, Danilo Krummrich wrote:
>>>>> On 9/2/25 4:31 PM, Alexandre Courbot wrote:
>>>>>>       pub(crate) fn new(
>>>>>>           pdev: &pci::Device<device::Bound>,
>>>>>>           devres_bar: Arc<Devres<Bar0>>,
>>>>>
>>>>> The diff is hiding it, but with this patch we should also make sure t=
hat this=20
>>>>> returns impl PinInit<Self, Error> rather than Result<impl PinInit<Sel=
f>.
>>>>>
>>>>> I think this should be possible now.
>>>>
>>>> There is still code that can return errors (falcon creation, etc) - do
>>>> you mean that we should move it into the pin initializer and turn it
>>>> into a `try_pin_init`?
>>>
>>> Yeah, that would be better practice, if it doesn't work out for a good =
reason
>>> we can also fall back to Result<impl PinInit<Self, Error>, but we shoul=
d at
>>> least try to avoid it.
>>
>> I tried but could not do it in a way that is satisfying. The problem is
>> that `Gpu::new` receives a `Arc<Devres<Bar0>>`, which we need to
>> `access` in order to do anything useful with it. If we first store it
>> into the `Gpu` structure, then every subsequent member needs to `access`
>> it in its own code block in order to perform their own initialization.
>> This is quite cumbersome.
>>
>> If there is a way to obtain the `Bar0` once after the `bar` member of
>> `Gpu` is initialized, and then use that instance with each remaining
>> member, then that problem would go away but I am not aware of such a
>> thing.
>
> What about this?
>
> 	impl Gpu {
> 	    pub(crate) fn new<'a>(
> 	        dev: &'a Device<Bound>,
> 	        bar: &'a Bar0
> 	        devres_bar: Arc<Devres<Bar0>>,
> 	    ) -> impl PinInit<Self, Error> + 'a {
> 	        try_pin_init(Self {
> 	            bar: devres_bar,
> 	            spec: Spec::new(bar)?,
> 	            gsp_falcon: Falcon::<Gsp>::new(dev, spec.chipset)?,
> 	            sec2_falcon: Falcon::<Sec2>::new(dev, spec.chipset)?,
> 	            sysmem_flush: SysmemFlush::register(dev, bar, spec.chipset)?
> 	            gsp <- Gsp::new(gsp_falcon, sec2_falcon, sysmem_flush)?,
> 	        })
> 	    }
> 	}

It does work. The bizareness of passing the `bar` twice aside, here is
what it looks like when I got it to compile:

    pub(crate) fn new<'a>(
        pdev: &'a pci::Device<device::Bound>,
        devres_bar: Arc<Devres<Bar0>>,
        bar: &'a Bar0,
    ) -> impl PinInit<Self, Error> + 'a {
        try_pin_init!(Self {
            spec: Spec::new(bar).inspect(|spec| {
                dev_info!(
                    pdev.as_ref(),
                    "NVIDIA (Chipset: {}, Architecture: {:?}, Revision: {})=
\n",
                    spec.chipset,
                    spec.chipset.arch(),
                    spec.revision
                );
            })?,

            sysmem_flush: SysmemFlush::register(pdev.as_ref(), bar, spec.ch=
ipset)?,

            gsp_falcon: Falcon::<Gsp>::new(
                pdev.as_ref(),
                spec.chipset,
                bar,
                spec.chipset > Chipset::GA100,
            )
            .inspect(|falcon| falcon.clear_swgen0_intr(bar))?,

            sec2_falcon: Falcon::<Sec2>::new(pdev.as_ref(), spec.chipset, b=
ar, true)?,

            gsp: Self::start_gsp(pdev, bar, spec.chipset, gsp_falcon, sec2_=
falcon)?,

            bar: devres_bar,
        })
    }

The wait for GFW initialization had to be moved to `probe`, but that's
fine IMO. I do however find the code less readable in this form, less
editable as well. And LSP seems lost, so I don't get any syntax
highlighting in the `try_pin_init` block.

Fundamentally, this changes the method from a fallible method returning
a non-fallible initializer into a non-fallible method returning a
fallible initializer. I'm ok with that, and maybe this new form will
encourage us to keep this method short, which is what we want, but other
than that what benefit are we getting from this change?
