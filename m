Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 592ACC18F0B
	for <lists+dri-devel@lfdr.de>; Wed, 29 Oct 2025 09:17:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACCFF10E731;
	Wed, 29 Oct 2025 08:17:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="eopABcWH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11013030.outbound.protection.outlook.com
 [40.93.201.30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEB3810E730;
 Wed, 29 Oct 2025 08:17:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EESrtBZEvn0x5Rzj0eANwruddPtbUweQF1AJgZQDGPW70pUff0ZDbkGSQ7dV6Rsw7fe1nbX6O45VlGrojrbkV2o0KQWAIqvAyyDMmbFTdV70It8Lit/4H68imfMEYRkOkPN7a+CzJrKOK4tppoBc9WnAGYZfC8h0x6LeyLOXKf/D/UUlqCMOfxUr7QllaIWoqkeAAcc+PuL8BlEYAlzcLHhCKWkl9YI4yS2pJrifcGKuuzXWjIxhW7H5Ajg0VEulKZQbfci53JQoPa4rD7C76yX4o+MRaRmwIk4FLOgFWtzzQ1XpKUxUe89Yj7xK/aG8YTXLPWPSGDeg4SNrRwyERQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ugKPXflbbn9hsqjhj4vAv0p57KPB1H2+6a/m13JCOz4=;
 b=Y1ufgIfIgoMH4J3+XDLONVAZFp0oS8DiCyc3fRY6r5QzLTOneSBJJMj+lvCmvoZHIUTiZs4enAcg1UJ1TIAQapzJ/n3H06PwY30qMy+M+c1u0Qw6f7+Kz6/S0K7bxEs7xfNwgLDAmYX0Yxk1RQUQOrMA2szQHJ3YXnQffV5+IrIHOPFQokasXhDLVSvui+6N2MmcROIXtpH/tRtwy3aKSgwjouC40RJOoLy3n6QxfstRPxh5yGLH8t8FhouxoMraYHx/TDek8Q2LfF4QyNUnRUNgUMDR2yh7IIsO7geiHMyuFaeZTORpxgHjs84cpIaPQuig0nBBPhwp0Uel0gfXPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ugKPXflbbn9hsqjhj4vAv0p57KPB1H2+6a/m13JCOz4=;
 b=eopABcWHazFa/e1gPqsGvA2/gpU+HLL3jchQfjvnq+O6ZkxdtQi95SgSO1NtEVcIjhKK20o+RoVdO5z7f6jcM7lyPajToqpbwWGqctPyWjZOwF8aOyg37r4OCQqmuv+SFm7cyY1WBlPmDQy4YJB0ESejZQSMhwp6ij00Q5EiqzdkkMZ1rq9sKM/LWA40IgubhljbbTLh6mXeh5pw+4JMnuxen5HvBpA+OB4ZWqVOaxvWQB2ET9UeBELKOBVpafDwRmBWnPb2dkfzRx3IwAyAS8rOfMqlXkXIJ15vsE+0dtiMzEjY4rls7/TdtXauYob4mBcy5kh7omfb/efTACFsjw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB3997.namprd12.prod.outlook.com (2603:10b6:208:161::11)
 by SA3PR12MB8438.namprd12.prod.outlook.com (2603:10b6:806:2f6::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.13; Wed, 29 Oct
 2025 08:17:48 +0000
Received: from MN2PR12MB3997.namprd12.prod.outlook.com
 ([fe80::d161:329:fdd3:e316]) by MN2PR12MB3997.namprd12.prod.outlook.com
 ([fe80::d161:329:fdd3:e316%4]) with mapi id 15.20.9275.011; Wed, 29 Oct 2025
 08:17:48 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Wed, 29 Oct 2025 17:16:34 +0900
Subject: [PATCH v7 07/14] gpu: nova-core: Add zeroable trait to bindings
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251029-gsp_boot-v7-7-34227afad347@nvidia.com>
References: <20251029-gsp_boot-v7-0-34227afad347@nvidia.com>
In-Reply-To: <20251029-gsp_boot-v7-0-34227afad347@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Benno Lossin <lossin@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>
Cc: John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Edwin Peer <epeer@nvidia.com>, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TYCP301CA0071.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:7d::18) To MN2PR12MB3997.namprd12.prod.outlook.com
 (2603:10b6:208:161::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB3997:EE_|SA3PR12MB8438:EE_
X-MS-Office365-Filtering-Correlation-Id: 68746920-adc1-47f4-d491-08de16c3a5b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|7416014|376014|366016|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aTlqZ3VqUnptdUpmakdTMTNQWVVrbitmODhKbHpuUWN6S1pvWVFJUGxHSnRY?=
 =?utf-8?B?dkFtZnM0QWQwaTRMRWFxWndyS2lhbWh2V080OStQamZCRXVJbXFlZHdZb0lD?=
 =?utf-8?B?RDZUR05LaHdJZ2xXbTR2cFBKalZZT0FwRlpIdkZPRlNpbUJiT3RLenl0S05w?=
 =?utf-8?B?UksrbnBDOFBNUmM3WUVoVmxoZGtDQ1QvaEg3L0k4QmhlY3lGL0FNRnVvRUIv?=
 =?utf-8?B?RWNtaGk5Q1RXV0ZLVnZjS3lpaC9Ickk3L3F3dERIWWlwYzdjNEE3a0twNUZU?=
 =?utf-8?B?MUxTS3FFSkFlNHV4SWMrMVNLZ2Vua1NQNENMRzY0RnF4WUtYU2crVG9LZml1?=
 =?utf-8?B?WU1KZUY5eVhVbEFHR1pHd0x4TGYwODB0YzRvaDV4dkhPcUdsN1AxOHlFODFV?=
 =?utf-8?B?T2JrTHJNQ2w1U1FiZ0lhdmhOOEtQVk03MWlSUjM4SFNIdVpzbUZlTExkcGR3?=
 =?utf-8?B?SC9mZ3lhY3BwSW5MYklZQm84US9XSmREZE1LNUNwdWxCTXVML0VPV3RHTW81?=
 =?utf-8?B?NVZ3NGFsN21Ic3g4M3dKMVlZdy9vejcyV2xWOHFhS0l5dEpyY1Z4SzgvMC8v?=
 =?utf-8?B?QWV6YjQxTmFhWTZycjRGZEZTSDVXQm41Kzh6YWU2aTBvbks0Y3U4MlRTUWRX?=
 =?utf-8?B?RGlGQXh5TWJnOUk2V0YxNVQzaWVNbFRXTFNiTEFOSU9ydTcxWnZybHdrSWgz?=
 =?utf-8?B?U2krMzZuUTYwS1ZDUWd3WVBXdmMwYW9RdWRxRS9BNU1ZYVRtV2NKYmt3VUN6?=
 =?utf-8?B?ck54YWRINVl3WkJXQVBDTExPakxPUUtzd0tIRFhiM2tSY0xpL0tpbzNhSm1V?=
 =?utf-8?B?UjA0dWFLUElCc2pSRjJZNGRuQXhBbytnQjJmL20rdDdSQ1lKYm5KZUsxM0hw?=
 =?utf-8?B?NEVMUDZpRUcxRDE4ajgrY29xbXZtTERHQkhhNXF6ei9id3RHRUlzVlZIKy9Q?=
 =?utf-8?B?Skl4Y3RGVlNIZlk2UXpHNFJXM2dpYUF6T25HRnJVTm10blV5ZW12bk1HbThr?=
 =?utf-8?B?T3loOUlNaXVmUkc0WkZEVUE2RU9OVXQ3TFBNYXlCMVRXMVkxMG9kcWZMSE5O?=
 =?utf-8?B?WEZ0WWtKQmRKdGRvRG93VjFUSWd5eXlCc1F1bS9kRGtjaWh6eFdMeHR0SytT?=
 =?utf-8?B?dlZFVmlocFpBMTRaTC90MmVCQkhxaWRNSERHWkR5VUlFWWV3dmMwRzgyQ3JL?=
 =?utf-8?B?NUFxanRtc01yTE9zMWQvK1FwYUZMTEsrdld3eXc1UTFoY2xiY013L1pvQnJW?=
 =?utf-8?B?a0U1cFVHVzgrMVlac09MazN3blJ5U3BhQS9MZjJ6Qm9WeWh5cHVXOHJ2b2tO?=
 =?utf-8?B?ZXk2U1NBQllPM05ySkEwRFhsZnhVS1ovakl4RTJXWEpvU25tOHBjdzdsZzdJ?=
 =?utf-8?B?d3d6TnQ3bVpVR0U4ZlVmWklEaFgwUXVacXZSdUxzYXl2M1l2dEI1UGV6TC9a?=
 =?utf-8?B?VDdBeEsydUUvalI3cU1YK0FRWWtRYVo5aFowZnE0OGdxejdNVnNMSTlvWCtz?=
 =?utf-8?B?aE5xd2hsclNMeGtzQ2pWbVhDNHJqQUtyOGFLS1J0ZCtRbEVpaUJ2bzFLb2Z6?=
 =?utf-8?B?QkFYV1JJeldXRlV3dWFEcXV3b3JSMGRVNjlqcHo0dytvK0toSUVMcnN2cmNK?=
 =?utf-8?B?WWw5WjM2VEtNL2pVazlkL090bEdNd2xyYXhJWWJreHB2ejZodCtjTlJjM1ZD?=
 =?utf-8?B?U1dmY1pPdXJZQ09rZ1JxVjdiRE9zOWFXdEJPV1lyOEtPdUhWa2JEYjRhdUdh?=
 =?utf-8?B?cWZvdytOUzBJYlZHdXUrUHJWa1dtWkxyVkpZTGYrNGN2d1VMbEhvYUNhZEtW?=
 =?utf-8?B?VnFNTU1hQzFYMGc3RXJSNUZWSTJMQnVvOEZzRXEvZUFKcnI1STI2eVcwOEhY?=
 =?utf-8?B?cjNIVGZlRGIvUlZNY2cxRmp4VWpCTE9IamxWVGRkSmlDRU9BczZIR3VjNmtj?=
 =?utf-8?B?Z1FNR3dVa2hIOWllSm9HRllGdmdkT2JaVVpZamtVR21zREZhV2d4NXdZdzBX?=
 =?utf-8?Q?EcevRETD4mROUwvyu6Lp3f/CgM+u0w=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3997.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(7416014)(376014)(366016)(1800799024)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aUw4aElLdDR0UjJ6U203U05vajE2V2d1elA0N0EvTCtraFFSLzRVbjVwN1VF?=
 =?utf-8?B?VG1ka0NJaGwvYzRQM2N4bzVncGhiQjQ0d091QTVZVi9JSVp3ek1jTE1LakI4?=
 =?utf-8?B?cVRoNEZRYWdnMlZQMlJvU3ZicXhUVUN3YkQvOGttTDJYbkI2bDJ2MGxDTHJx?=
 =?utf-8?B?NFVFNkZHV1NKb0p3bUZxT1BYc0gyWUlWUVdmb1ZockVpRldWN1E0TlJRcWNr?=
 =?utf-8?B?dmZwU3JmT1pISkl6dnhOMDd6ak9RUE10L2hDRzZmYXRKRjJwWnFpZmdZWkFP?=
 =?utf-8?B?VUJFQzhVeHV2Q3hVQllBZE92S0NiU1RnSzAwTFNlbnAzY2dKSTBjOWprT2VM?=
 =?utf-8?B?U09VdFY3cUgzMGJRZEZBZkpwbnZtVWVYMkhMTTJuUEJHTklhaHAyc3FkUGVx?=
 =?utf-8?B?VFhid09lK25neGt4QzdrZ1pobWs2bGtvSVFsck95aG9RYVhNYVM3ZktBVGkz?=
 =?utf-8?B?YkpCOWs2UVZ2aHZBN1c2R3BHRUo3Vk1EL1NLdUZMZmdkSTJCWkpCbXpmLzU5?=
 =?utf-8?B?ZWtCRW9JZkVCb1lRK3pQWVJvb2xsWUpqdEl1K0F1SWNMOFNoTTFMNTVMYW5a?=
 =?utf-8?B?Q3hEaG4yNkozb0Uwc2ZnMkZlWEhuTXQ1WVhoVzlrNmVDMklFcHFxTytGM0Iv?=
 =?utf-8?B?bzBLdHE1cm5WRGpROWVFTC9OTE5HRm9WYlp5VUdRR1V6WElNdWtmdzJaMzFj?=
 =?utf-8?B?UVZFNTZ2VHowQ1g5NHJURjVFSTJWcE5UTkl2cCs0b2I3ZzJmL1doTmE2WXFo?=
 =?utf-8?B?R3JBcXFjQWZkbTB5Q1U2T0ZkU1YwUHZIdkM0Ky80MkE4aVJHaS9KZS9qK2pQ?=
 =?utf-8?B?a0wrOVFISW1DSkVvcXA2ZkxPWHozU1ZFWk1QYjdONGx5NDNtZ1lXY1dKMmdB?=
 =?utf-8?B?VlhoYS93T3J2OHBmd2hHTEltd0huV0ZVNVlzMnZHN1pyclkrZFhrUjJnSFpm?=
 =?utf-8?B?cEpuL1pUVS9MM3B5cmowa0NGN2Q5TzZud0c4aEFrc3BLRk5ZaGliS2hueDBZ?=
 =?utf-8?B?UzlmdTBEMXRCWjk4cXVmSnQ0ZExqSUZRWjdKbXlENnpGeTBVL2g1Wk80RHdN?=
 =?utf-8?B?T1dNdnNPWmVDbEZEd0lpek00SDFrQ3pxR0RBOHU5SXZoNGVYYVRYeG9JRzNn?=
 =?utf-8?B?YmpsUFVaMHRDOEZaUHRnNEFvbTVXVTB5d08rNFljWjM1SUZiK0Z2Q0luL21y?=
 =?utf-8?B?dHlONWtSWi93cFhrRzhiNzY2c25JeEZQdFdndW1KYVY3Tk10a0dpU0dkWTFR?=
 =?utf-8?B?WEhHd3N4VTNmVDhtREJUdjFWK0F2YzdpNnRXMmJ4N3JhQWNDVjN2L2V4QUJS?=
 =?utf-8?B?SkZTL1p5R0ZoWFZySm43N00zSGdBZ0I3Ulh5TE9WL1RWUk1jcUZIR2FTamNF?=
 =?utf-8?B?QmFHMkRnNUUzbkNsaGY5NzVEUGlEWktTRlhLWGJITTdzdUYwNW1nYmV3ZTYy?=
 =?utf-8?B?bEs5SWZqL2VGWlZJdFRBNy9pZjk1cmVod0xtOHZBSUZNbjduTUkyMko0bnhU?=
 =?utf-8?B?WC9XQ3lxSldZcXhhekhFYjhJY25GdmdtNzBKakMycm10RnBXRnk0cTJtbmFm?=
 =?utf-8?B?RzJwYXZKT0JGd3hxUE1NRFV6S0wwRVpzTDlFQ3c1UkR4LzJxeCtydWc2cXd3?=
 =?utf-8?B?MDh3N2ZpTzBpcWJFSzRzYkFoSm1FOTJaUk56dWRBQWRqSWxEV2crSmRIbFY3?=
 =?utf-8?B?d2U2QlVUMGIxNmx6S1pMVFVTOE95aGNUNkJld3gzT1RIN1RFNmZYNzlaMmpS?=
 =?utf-8?B?aVZMcXNSRDhMUmdkN2R5NHB1dGgydk04SFpuWjY4Rk9hTUE0M2hQcUllZGV1?=
 =?utf-8?B?QnFzSDVMTk9sdVFBSzNPakJrQVNXNCtab2VuaXpCNS9lVWZEbGI2RmxwSUdH?=
 =?utf-8?B?ck16Wi9iSzI3a3JJVENxU1lkWmMzTHdoMGMyampWUS9WS2U0U2RpbnZvcEFF?=
 =?utf-8?B?YnR5SU10R2htZkRqVnFrWXFMVlBJczFkemwvVWMvWU80Z0Q3a0xNcFJiMUor?=
 =?utf-8?B?SGlnYi9HandKelJKK0hnc2RHWjlBY3lZek1BMW1aSndWKzlzRjg5US9pYkV4?=
 =?utf-8?B?RllRS2pSRjRxYjVDZWluTTdRcU9mRlh6QmpFcTlWaHB2akJwTi9haEdUNmdN?=
 =?utf-8?B?VTZEajM3UEthZU5rS3owSE8xU3MxdEYxajhzNW1EeU9rRUhrTFlyWTVzZklw?=
 =?utf-8?Q?axIolkaeGi5HVOlVteLr6II7UF8KMUHeDaOJKIz+s1aH?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68746920-adc1-47f4-d491-08de16c3a5b0
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3997.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2025 08:17:48.8808 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pNPdNim2sQPaPHyjBkFj9wxappx4MybzXqq7DTmQpKn3s8UytK5jgmVotRr1kCVJTKxpqG1rPhB12D1aIqVzjA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB8438
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

From: Alistair Popple <apopple@nvidia.com>

Derive the Zeroable trait for existing bindgen generated bindings. This
is safe because all bindgen generated types are simple integer types for
which any bit pattern, including all zeros, is valid.

Signed-off-by: Alistair Popple <apopple@nvidia.com>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/gsp/fw/r570_144.rs          |  1 +
 drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs | 16 ++++++++--------
 2 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp/fw/r570_144.rs b/drivers/gpu/nova-core/gsp/fw/r570_144.rs
index 82a973cd99c3..4f5c65ac1eb9 100644
--- a/drivers/gpu/nova-core/gsp/fw/r570_144.rs
+++ b/drivers/gpu/nova-core/gsp/fw/r570_144.rs
@@ -25,4 +25,5 @@
     unsafe_op_in_unsafe_fn
 )]
 use kernel::ffi;
+use kernel::prelude::Zeroable;
 include!("r570_144/bindings.rs");
diff --git a/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs b/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs
index 392b25dc6991..f7b38978c5f8 100644
--- a/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs
+++ b/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs
@@ -20,7 +20,7 @@
 pub type u32_ = __u32;
 pub type u64_ = __u64;
 #[repr(C)]
-#[derive(Copy, Clone)]
+#[derive(Copy, Clone, Zeroable)]
 pub struct GspFwWprMeta {
     pub magic: u64_,
     pub revision: u64_,
@@ -55,19 +55,19 @@ pub struct GspFwWprMeta {
     pub verified: u64_,
 }
 #[repr(C)]
-#[derive(Copy, Clone)]
+#[derive(Copy, Clone, Zeroable)]
 pub union GspFwWprMeta__bindgen_ty_1 {
     pub __bindgen_anon_1: GspFwWprMeta__bindgen_ty_1__bindgen_ty_1,
     pub __bindgen_anon_2: GspFwWprMeta__bindgen_ty_1__bindgen_ty_2,
 }
 #[repr(C)]
-#[derive(Debug, Default, Copy, Clone)]
+#[derive(Debug, Default, Copy, Clone, Zeroable)]
 pub struct GspFwWprMeta__bindgen_ty_1__bindgen_ty_1 {
     pub sysmemAddrOfSignature: u64_,
     pub sizeOfSignature: u64_,
 }
 #[repr(C)]
-#[derive(Debug, Default, Copy, Clone)]
+#[derive(Debug, Default, Copy, Clone, Zeroable)]
 pub struct GspFwWprMeta__bindgen_ty_1__bindgen_ty_2 {
     pub gspFwHeapFreeListWprOffset: u32_,
     pub unused0: u32_,
@@ -83,13 +83,13 @@ fn default() -> Self {
     }
 }
 #[repr(C)]
-#[derive(Copy, Clone)]
+#[derive(Copy, Clone, Zeroable)]
 pub union GspFwWprMeta__bindgen_ty_2 {
     pub __bindgen_anon_1: GspFwWprMeta__bindgen_ty_2__bindgen_ty_1,
     pub __bindgen_anon_2: GspFwWprMeta__bindgen_ty_2__bindgen_ty_2,
 }
 #[repr(C)]
-#[derive(Debug, Default, Copy, Clone)]
+#[derive(Debug, Default, Copy, Clone, Zeroable)]
 pub struct GspFwWprMeta__bindgen_ty_2__bindgen_ty_1 {
     pub partitionRpcAddr: u64_,
     pub partitionRpcRequestOffset: u16_,
@@ -101,7 +101,7 @@ pub struct GspFwWprMeta__bindgen_ty_2__bindgen_ty_1 {
     pub lsUcodeVersion: u32_,
 }
 #[repr(C)]
-#[derive(Debug, Default, Copy, Clone)]
+#[derive(Debug, Default, Copy, Clone, Zeroable)]
 pub struct GspFwWprMeta__bindgen_ty_2__bindgen_ty_2 {
     pub partitionRpcPadding: [u32_; 4usize],
     pub sysmemAddrOfCrashReportQueue: u64_,
@@ -136,7 +136,7 @@ fn default() -> Self {
 pub const LibosMemoryRegionLoc_LIBOS_MEMORY_REGION_LOC_FB: LibosMemoryRegionLoc = 2;
 pub type LibosMemoryRegionLoc = ffi::c_uint;
 #[repr(C)]
-#[derive(Debug, Default, Copy, Clone)]
+#[derive(Debug, Default, Copy, Clone, Zeroable)]
 pub struct LibosMemoryRegionInitArgument {
     pub id8: LibosAddress,
     pub pa: LibosAddress,

-- 
2.51.0

