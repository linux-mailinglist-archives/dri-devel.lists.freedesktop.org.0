Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A85F8B39271
	for <lists+dri-devel@lfdr.de>; Thu, 28 Aug 2025 06:08:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 211D810E935;
	Thu, 28 Aug 2025 04:08:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="CNlsi0Qe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2051.outbound.protection.outlook.com [40.107.244.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0AB310E930;
 Thu, 28 Aug 2025 04:08:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GlrtbhvniFKdVzlO16qB6koIi0U0HfW6EgBxr0V2ERfRMjfhyNQkjuMV+u38k7eGeWi8jAtqzmivWS9IV3d6OnIIsSZluV7W3DcDN+UIQnrBVGNq5J5LxxL9N4Dj43dBF0Dy5A2ngzIt7ES2YBnG6uvx84MdZ0yixWw1t/GSiUwSQtw8leQoZeQLuo+MXYbuSR9PcbA35QUmvEgB46FMm5tg/Y2yb+5NQ/hDkUQ/PFUIhIM3QrkkGhOjPsh24BK9uHUOLwh9hd88eQ1a315f0zhSugkydtfsq45ew5sRTqiW+fAWEp+9gBMVv9PW+X/Af7Gal03r+nz4okVLkOAjBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rXvHj4kecGB7BqUwc7UZ8sAgpeqJDIX3E00xxTJyMbE=;
 b=SllU+cPJe4FUUk2VMFvnOUcgJVMRXKRtPpCEKWayxpjHkg9dFpsjmPNYwCWAIqWw9TBDaWqpMOd2akPeb6yYcf6DAoOsRyuyrd2UjmKqQ85Szlw96b6WV3sGa7p4EE1Q5s6NLKPWztHVhwMtwRcasr2Wqq1mr/mnkbUL3VYhFnatuav0Wj1KDSz/AYYPexcLMxN9KZCRQC/P5pJ/j5kyTIXslxtHo7IuKT8OYivDLOdV1nWMzd03amr1lVrMarhejuDyy+u4DQvsJ+o/WRHmTMH5v/tjI2OGp7uxtaBr63vIkocmCboKPJwJPIMmpkQ9RYP1EDktCNZbSzdGQOaxtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rXvHj4kecGB7BqUwc7UZ8sAgpeqJDIX3E00xxTJyMbE=;
 b=CNlsi0Qe2TN4lC8i07zLu73HxlvT5reVktUFVjb9tV6XCaOe4D9ceGslHqKafvF6btrajx1xZNJCJelEF8ag2TrQEUYQIjUf0NfJSS7AA7IHEw4AC3a11Vr01gMEpmNjz/BjRDjQ7z6n9mG5yr7b/C0IG8F10y6QF5lXm4Hn/xi3fWMu7/MxSBoiERMNZYPHcjHmc84HInRYl4aGiH6oYztKeqabRzHoHoaMSYPWKQAZ9YSZIaiCS7U8rtaPnPyUepn4vZjTYwjqqieYiEtSLWpeYOnDxAdFkP6QrpKK6xn+3NdL/O53IJJApbhBO7AzhOvHiRhF2I0W2LG61g6cLQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5968.namprd12.prod.outlook.com (2603:10b6:408:14f::7)
 by CY5PR12MB6081.namprd12.prod.outlook.com (2603:10b6:930:2b::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.13; Thu, 28 Aug
 2025 04:08:44 +0000
Received: from LV2PR12MB5968.namprd12.prod.outlook.com
 ([fe80::e6dd:1206:6677:f9c4]) by LV2PR12MB5968.namprd12.prod.outlook.com
 ([fe80::e6dd:1206:6677:f9c4%6]) with mapi id 15.20.9073.010; Thu, 28 Aug 2025
 04:08:44 +0000
Message-ID: <0d775b73-9248-45dc-a632-a979f5c1f68c@nvidia.com>
Date: Wed, 27 Aug 2025 21:08:41 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 7/8] gpu: nova-core: Add base files for r570.144
 firmware bindings
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
 <20250826-nova_firmware-v2-7-93566252fe3a@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <20250826-nova_firmware-v2-7-93566252fe3a@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR02CA0020.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::33) To LV2PR12MB5968.namprd12.prod.outlook.com
 (2603:10b6:408:14f::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5968:EE_|CY5PR12MB6081:EE_
X-MS-Office365-Filtering-Correlation-Id: 0dd081f1-accc-403d-6441-08dde5e89460
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|1800799024|376014|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MTNpY3lDNjhiS0pKSnpIa1ZHZ3dUd2tUcXRKcE94RFJCbVU1S1diWkVuaWpz?=
 =?utf-8?B?NHp1VUVtZWJiQWp6Z1pHZmUvMmVCL1lOL0lzSTkyYXZVNUFBQ0djaDlucmZa?=
 =?utf-8?B?UWpmY1RPWkVpcGRoYWY3Y0kwT2ZKSVNqNXZsbUh4dUVTWUFoR3YxMXVDMjRt?=
 =?utf-8?B?d215cVdLNWtSMkZKSTRhTjN5WDc0cndPVjN0LzRXNm9uQnEyOERWSHlnbzU0?=
 =?utf-8?B?QzE5aXcycGpWQTFXaE1zdU92YzZSbVdLMEk0YlVVZHhzZ3pDTGl3R3I3RWRy?=
 =?utf-8?B?NzRKM2pKZlVxeE1hajlkdHZ0Szh2a0U1a050K0Q4OWYvK0NrTFFacEtrRjlM?=
 =?utf-8?B?N1lpWUFZdU94SU9rY002SlBVbTdIazZuc0JWRTZuVTVSY1hRek5qOWE5WUsy?=
 =?utf-8?B?OVNGS0FvUWFjeVRCRnhvWGxaV2VVemNicFRUWXRxVThReUgvd01wVWp1Nnp4?=
 =?utf-8?B?cDFReUJZZzhFOU9nQ0xPUTJVS28zN0paRnljbE8rOEcvMUVGY0hQVEszbSt3?=
 =?utf-8?B?TmFzelBYdm9INUtwVGV4NG44RUdCaWYxek1CMFhqOTNwQzY5a0NVSWJnUVVr?=
 =?utf-8?B?MURRU2VuRC9KNEdRelpjd09mUmZMWmd6TTVGRnJvL1Mzck5aMnNJTmVkejI5?=
 =?utf-8?B?bUpZbGZnRExYQkQrUHhzYXZXZkxIbFVEQWpNV284UEdUNGRhSk5KNkM2eWZw?=
 =?utf-8?B?UFV5aTdDTXF6QTdoVXJNQkh6eEtaZXlRcVRUbGVRMDNJZEZaakV0elZYUmQ1?=
 =?utf-8?B?aWE1NVZ1bUVWS2E3L2ZlYis2UlQ1YU5iQUpuK1k0MkRuVlpJVWxkVEIveUtT?=
 =?utf-8?B?NGlxQVU5R1kzOFBEclFnTzBWdis1OGRFUXNRMFlESDMvTW9peS9teUFkc292?=
 =?utf-8?B?MjVLMnRSbmxSM3cxcUVmbVFXS2FMQmpwQ3JmeFUwb0ppRzEyZTZCSGtReE9R?=
 =?utf-8?B?ZjhrajlnM2tKZXVKQ2YyMXRhbEpCMlM0NWh6RjVyVnI3OWZHb0pQbEdHQVRl?=
 =?utf-8?B?dTRjcmNJeXhNWEdLbTVORWRjdlQ0VDJxZnlRVTJUNGgxRGZybHNVc0ZRUjJw?=
 =?utf-8?B?N2Rwd2tsTVNKaHRHT2pmSnB6U2UvWlBoVGxKNlpua0VrdjhzbGdBVFZ0K0kw?=
 =?utf-8?B?SDZJR3VXdGhqODFFcHg5Y0QvSGxkWVRNc1B0S0oreElFNXBZbDlmSWVadEFq?=
 =?utf-8?B?Z29wTTFCckFJNTlUWXdQbnh3NUhzMUxNQ2E1cjd2VVBJYkM2cTFVWjhyVFBT?=
 =?utf-8?B?QjBhY1NzZmwwdHcrbElINzhValhCbHZDdVhYTnAxTHhGZ1FnVVhWaW91ejB5?=
 =?utf-8?B?TDhCZnE5Zld1ZGNYa1BSOG93WGxoTW1SbnQ3V0kzd3JSbHJjN3hhbVdjOTBj?=
 =?utf-8?B?V1RsVXJjOW9UMGNSa1l2anBNak80WmxvVitiUjhWRTI4SC9WQXcxb1FuRG90?=
 =?utf-8?B?Z3l6dzY4UVJGd2FKemtYYmQxMElQbThQNkFENnYvdmdvZUNvUjRwK0IxYy80?=
 =?utf-8?B?b2FDYVk1ei9Zd1d6cWFzVW9BTTNIMi9UQmZweis1QU9CL1VEcElFbDBwdlFp?=
 =?utf-8?B?N3BIZUZCRjB0NzM0YzhmdUhJcUlNbXUyNGVjSisvTFgrMjFBb1FtSHNRM1B2?=
 =?utf-8?B?NEw0bXdJN0ZQQzdjbFl2dXBUMUEyTENXazVSeDBiOEVOWjhFYjJKbzd0aHVi?=
 =?utf-8?B?VjZJdTlqV3c3MWJPRkVDZExsWWJZMXBIbEJQSTFtQ1lVdFMyZ2FnYWdlODhK?=
 =?utf-8?B?Vm0wblRsU1ZxWFZkVTYrK1kzRGN5cnZoa1pqbnFUUEdWTWd3OUpPUnhMZHpP?=
 =?utf-8?B?cEtqd3B2ZTE2blB1RkVOckVjcGw2R2pHTE9lZHd2aTAzWEFURnNHU3E2cWZR?=
 =?utf-8?B?ZGFCOWY2SkVBRHY2anFGQWNZdW9LdTFzQ0VhaTAzSXZVaG1VaGszMlo2TUVZ?=
 =?utf-8?B?ckhwd2FDV2FkdHpCeVU1VDljR3pwNlMydyt1QmJaYXJSVmRaTzZCOW9ScGRj?=
 =?utf-8?B?Q2pzODZ1U3JnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR12MB5968.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(1800799024)(376014)(366016)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RWZIUmJaV0xZQ2lmbm81SnIxSXlZVFRkbUdFS1VvYWN4ZGprRUhzMXIzZENv?=
 =?utf-8?B?Nkl5dDdCUVlDY0ZGSDBocVFpNDlWN2hVdGMvN1phNkZTanZoRUhoUjUwalov?=
 =?utf-8?B?eWxwVXdqS2RpeEx1emJyTy9xRDVsZVpuSEtOTU81MVVVWTgvckJrZHUrbFYx?=
 =?utf-8?B?bkFVdHdLbUpaZHlHWk9scVJ5OVd1dCtQTVVSYUhLWU1Vc2IrblAzWm5MK3Fp?=
 =?utf-8?B?Q0hMTndJeVhvN0k3QlEvdkcxOVQ0eXNzdnpCTG9ueVUvNXkySFJGa1dwTEhB?=
 =?utf-8?B?VzNNUlpyNWw0aGhPdi8vRUpGeHk1UzVsQUh0S3VHbHdQWlA2Tk1nK2dCbzlT?=
 =?utf-8?B?eVJuOWxiMHBTZEFqdkNmWms1OTVnRGpBdjlUWlE3Qkh0d0tvWGhaMzNVeTJy?=
 =?utf-8?B?OCtsQ09FUFhoMXlubkJQbmxyWnhrUml5S01Jb1lGeHNJT2FlcHpkOUtpQzFZ?=
 =?utf-8?B?S3NML3JhMTUwOGVONXJvMVkxTHVXWDNlQUlFSEN1ZWwyUU5ycVBtMERNdVBm?=
 =?utf-8?B?bFBLWnI3Szk0b1pvNkZ3c0Via3lmT1BPaFBFQ0c0YVAxb1Y4V0MzQ2ppMy9Z?=
 =?utf-8?B?M3FLeC9BQWhqVmZhU2ZnMDY3Z1BBQkRPRjRyd09yUVFqb2VIa3VZak1Id1Fx?=
 =?utf-8?B?cU96MEw0OXd0VzNwV21qM1V4VnBYZ0dqdUxiMzZwNHRaSWE5UThqMjhpQUIw?=
 =?utf-8?B?NDNsbStiaENBTWY1ejRoZkVvSkdja0Nyb2QzQXZDdU1qdlhvdXhwSlpja0d6?=
 =?utf-8?B?ZzF4YWFacGtNbHhJK0VrT2IvM2ZnWnBBL096VTlmNFJ6ZUJZOFo3ODNtS01E?=
 =?utf-8?B?K24zUGx6VWI4Q2JiNVNLaGZ4L0ZJR284L2h5T0xaUVJrT05xSk1CZmxQMEtB?=
 =?utf-8?B?a2F3emNlSmJQSjFhNjZjdDU1N0cyQ2c2VWZwQzA0bzljYVJvN0Fac3lUQTBG?=
 =?utf-8?B?T0RHSGE4bFJwaUtrMWloZUY2ajdJQWlHR0U4VC94cTZjT0JYdG8zeHVzZTVB?=
 =?utf-8?B?cEd5b1VlMGwwdlNjL3FWUWk5QURMbzE4TjdHUUs4dk5MV1p4NHpGVTlSR2NN?=
 =?utf-8?B?bnEyL3NYYjJIZXc0Q0RlU2V6S04zeEJIRlRMMkxQTzNwaXh3c3l6NFF5cnQ1?=
 =?utf-8?B?ZkphT1VUVU0rMkRsc2RDRElVSmIvUndCZjJaOHJTVm04YVpoRHVOLzY0TEdj?=
 =?utf-8?B?aERxUjc3b3lXb0lNcUhVdTIxOFo0aDF4TFp0Sk9wZ05iOU1mbUtBT0cxNHEr?=
 =?utf-8?B?OGxkQVpXa25zbG9iODhyVWs1eHhTYWpHVzFRM2ZxWFFvUFM3QTNJdVo1aWxF?=
 =?utf-8?B?dG4zRzVTMlVyTFRQSzZNcm53VjRpcE9KU0JwZUxWUzRoc3BRa202Sk41N0Mz?=
 =?utf-8?B?cENDWjFLb3k0SDVXcGlHNjNoMm5vc2h1eDFaVnRJcFFTU1VWS0toOE1udnl0?=
 =?utf-8?B?bzY1UmlSeGhlcVRPU3pYQkJRdDFQaXJUa2RXSFh6K1JrdnFxc1p4MFgrdTJS?=
 =?utf-8?B?VWxCK3FpQ256QnlSME9tSTR2NWVobFo1c1Z0NXVEMWlaVFJUZGVYdlI4OG1i?=
 =?utf-8?B?bmc3RThTQVE5UVNuSncvZXJDa05ZVHJ3YnBSU0NnNCtMWm1qOE5xVXFTdEJU?=
 =?utf-8?B?T1h2NE5HbHpBVk1nRXdSK1FkaklvR2lUZ3djRHlQaWZldzFCL3kwVWU5cmEz?=
 =?utf-8?B?VkFGTnlRSUYzejQ0ZHM1VXIvOG92aUVFQUNjMVVWdVlUSHltVDh2WnNWcTVl?=
 =?utf-8?B?QWY3YXV4NjZXZHczTkh3dUp0L28xcW5IM2RQU3hVcTBpWWY3OGJOUWFWL1Uz?=
 =?utf-8?B?eUlmTEJucnBVejhTRVZDYlEwbWIwUDNEU0czOE9QUHJFcnBZVTlEWUZ4eDRB?=
 =?utf-8?B?Sk44U2RnOFlkdlRlNXBpeit0S09seG0rUHBsakladXExQ1RDeVdyL1JhYXY2?=
 =?utf-8?B?eEVIOXhqSlNKYlJXWHRtTk9hdDRid1NhZk5iQnpXZkhUOXQ4dGFyTmhaNmI5?=
 =?utf-8?B?OGdJU3NBdDZoL09TMEpqNElGM0ZSSEZoY2VISitxM3B4NWhiZUJmR3B0MFB1?=
 =?utf-8?B?UURaOTV4d2g5QTUzdkI1OXppeDdoNDZSemFYV0pua2JhK1ZXNXVRbWVwUnRo?=
 =?utf-8?Q?SfIEuLmzP3NFi4BpmWJugDEJa?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0dd081f1-accc-403d-6441-08dde5e89460
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5968.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2025 04:08:44.2963 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iQ5eZgPEGkbWfRn1S1dMDolJ1ocJKhdAOv4tO/OIP+p5po/QASOKv7T3qeMRU4Ool2/y6n4NODHjeFo9MUn6Jw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6081
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

On 8/25/25 9:07 PM, Alexandre Courbot wrote:
> From: Alistair Popple <apopple@nvidia.com>
> 
> Interacting with the GSP currently requires using definitions from C
> header files. Rust definitions for the types needed for Nova core will
> be generated using the Rust bindgen tool. This patch adds the base
> module to allow inclusion of the generated bindings. The generated
> bindings themselves are added by subsequent patches when they are first
> used.
> 
> Currently we only intend to support a single firmware version, 570.144,
> with these bindings. Longer term we intend to move to a more stable GSP
> interface that isn't tied to specific firmware versions.
> 
> [acourbot@nvidia.com: adapt the bindings module comment a bit.]
> 
> Signed-off-by: Alistair Popple <apopple@nvidia.com>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> ---
>  drivers/gpu/nova-core/nova_core.rs              |  1 +
>  drivers/gpu/nova-core/nvfw.rs                   |  3 +++
>  drivers/gpu/nova-core/nvfw/r570_144.rs          | 29 +++++++++++++++++++++++++
>  drivers/gpu/nova-core/nvfw/r570_144_bindings.rs |  1 +
>  4 files changed, 34 insertions(+)
> 

Reviewed-by: John Hubbard <jhubbard@nvidia.com>

thanks,
-- 
John Hubbard

> diff --git a/drivers/gpu/nova-core/nova_core.rs b/drivers/gpu/nova-core/nova_core.rs
> index fffcaee2249fe6cd7f55a7291c1e44be42e791d9..db197498b0b7b1ff9234ef6645a4ea5ff44bd285 100644
> --- a/drivers/gpu/nova-core/nova_core.rs
> +++ b/drivers/gpu/nova-core/nova_core.rs
> @@ -10,6 +10,7 @@
>  mod gfw;
>  mod gpu;
>  mod gsp;
> +mod nvfw;
>  mod regs;
>  mod util;
>  mod vbios;
> diff --git a/drivers/gpu/nova-core/nvfw.rs b/drivers/gpu/nova-core/nvfw.rs
> new file mode 100644
> index 0000000000000000000000000000000000000000..7c5baccc34a2387c30e51f93d3ae039b14b6b83a
> --- /dev/null
> +++ b/drivers/gpu/nova-core/nvfw.rs
> @@ -0,0 +1,3 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +mod r570_144;
> diff --git a/drivers/gpu/nova-core/nvfw/r570_144.rs b/drivers/gpu/nova-core/nvfw/r570_144.rs
> new file mode 100644
> index 0000000000000000000000000000000000000000..2e7bba80fa8b9c5fcb4e26887825d2cca3f7b6b7
> --- /dev/null
> +++ b/drivers/gpu/nova-core/nvfw/r570_144.rs
> @@ -0,0 +1,29 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +//! Firmware bindings.
> +//!
> +//! Imports the generated bindings by `bindgen`.
> +//!
> +//! This module may not be directly used. Please abstract or re-export the needed symbols in the
> +//! parent module instead.
> +
> +#![cfg_attr(test, allow(deref_nullptr))]
> +#![cfg_attr(test, allow(unaligned_references))]
> +#![cfg_attr(test, allow(unsafe_op_in_unsafe_fn))]
> +#![allow(
> +    dead_code,
> +    unused_imports,
> +    clippy::all,
> +    clippy::undocumented_unsafe_blocks,
> +    clippy::ptr_as_ptr,
> +    clippy::ref_as_ptr,
> +    missing_docs,
> +    non_camel_case_types,
> +    non_upper_case_globals,
> +    non_snake_case,
> +    improper_ctypes,
> +    unreachable_pub,
> +    unsafe_op_in_unsafe_fn
> +)]
> +use kernel::ffi;
> +include!("r570_144_bindings.rs");
> diff --git a/drivers/gpu/nova-core/nvfw/r570_144_bindings.rs b/drivers/gpu/nova-core/nvfw/r570_144_bindings.rs
> new file mode 100644
> index 0000000000000000000000000000000000000000..cec5940325151e407aa90128a35cb683afd436d7
> --- /dev/null
> +++ b/drivers/gpu/nova-core/nvfw/r570_144_bindings.rs
> @@ -0,0 +1 @@
> +// SPDX-License-Identifier: GPL-2.0
> 


