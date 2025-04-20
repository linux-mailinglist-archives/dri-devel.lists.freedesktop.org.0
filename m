Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CBAA0A9479F
	for <lists+dri-devel@lfdr.de>; Sun, 20 Apr 2025 14:20:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A93D10E2A3;
	Sun, 20 Apr 2025 12:20:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="L623qyfZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2042.outbound.protection.outlook.com [40.107.220.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2830F10E051;
 Sun, 20 Apr 2025 12:20:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JZ2DOmgxfXWpGmZvDxbfoQzMAIelXp4aYqOB6grw5ziWxJ2jHOB+Pbt/YnYE1/FQG0JxAgw0mnILeeeslUfQ/D/nLhhvFdZOC8m5ZpW5IVkIztGk8UrxlPWSpcLP5GytSor3s4+Tu1xyEd5k7MGDW7ONzHiC4qaficuVMNDhE3MvGnR0r7gZM/+l4AEdC/BUFL8TTCt1pyzcXlgjxKZYix+pqT8q/oQeJbFvWC2Lgb5Cf0SWQEuATeNbzf9HAneJ0eOLBfxmPgGcSvwV4vfjRG5rW7TFVyR0EbYotsFuKqFnFGoQUZuUD3vwxWmu5qcIeVvaKArU/6fN0n2/6yaB+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vYELUx8aMzlYCoMFO3jJUQF7hfwNLop7EwGijiFbc6w=;
 b=NH1UIXsqMwiKnu1al6LPbgBbalq9WeU4MtU67jYSDndUbnTyQXcYw3eaQRudgW6CYmyeDhZOhIJr4o9IdYA4HtNs5J5kUjdWvDdjUJk9JDWFkhWYRUukBxgkezPvf2j5sUCQcb3Cda9fNyxlzyuVMAp8J8aQHlZk2RyDhYCbOe/ImxM6t8G0BBljfH58xMb7NZwQpJiPMnZYwY3jrLxsZoSc7j+mCjV3XqteQpbtm3qSYRxc486eieQ7IOOo0G+kJeeqhlag5vtVm1V34zYqmT4Xnyabi25tM6Ej7pDzKthhRVLspFo171SvIw0k1hfjp3KeMmw25jgj0n/kUPN2wA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vYELUx8aMzlYCoMFO3jJUQF7hfwNLop7EwGijiFbc6w=;
 b=L623qyfZpDi8kvZgarute16xucnUdc/nv6ZN7vfUEgbIannQSYCM/YFJL5WsLI+Nk1Tu5JMmg32VObvtX0hm8GmGgyH4wX2uc/Rf7hWEABD/azCmGJqnksFoVNdKvbeFj9TE4NJhD62jzB0ZGyZItL8250VV4vO6yTV/z8QEhv9Msq6DzUeXtS5bHRHWqk9yWznGkT0gRIbL/4Am3ufsaiLQD6pGvW6QheTeoQLEG6qgAsLVybja6FeABJYC//y6dICR0XJM+i22bbL2Sh8s++QPlns4Ets55IQANUkQybGkvOhQ3K2CJm7HZbEOh3yzC9CQgjyZOgZQymyNHSTXqg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by PH7PR12MB9175.namprd12.prod.outlook.com (2603:10b6:510:2e6::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.33; Sun, 20 Apr
 2025 12:19:51 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8655.025; Sun, 20 Apr 2025
 12:19:51 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Subject: [PATCH 00/16] nova-core: run FWSEC-FRTS to perform first stage of
 GSP initialization
Date: Sun, 20 Apr 2025 21:19:32 +0900
Message-Id: <20250420-nova-frts-v1-0-ecd1cca23963@nvidia.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFTmBGgC/02Oyw6CMBBFf4XM2iZ90MLwK4aYUqbSBaBtRQ3h3
 yWwcXlubk7OColioARNsUKkJaQwTzuISwFusNOdWOh3Bsml5qWo2DQvlvmYE0NDXiLajqSD/f+
 I5MPncF3bkyM9X7synyN0NhFz8ziG3BRoDEcr0KAvbU+lVlqQU6Z2Ruuau6rSKKnu4D+lKY4QJ
 RTL8Xt7hzww59Cj6HvVGd4sJbTb9gPKp/yG1wAAAA==
X-Change-ID: 20250417-nova-frts-96ef299abe2c
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
 dri-devel@lists.freedesktop.org, Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Sergio_Gonz=C3=A1lez_Collado?= <sergio.collado@gmail.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: OS3P301CA0027.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:604:21f::9) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|PH7PR12MB9175:EE_
X-MS-Office365-Filtering-Correlation-Id: 22002c0f-fb9b-48e9-fb17-08dd8005a61b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|10070799003|1800799024|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?L0xGUjRKNmFuUE1BV2ZUMElqbFhhTUZWaHhCa2h1S2NaWGRzdXFoTDdxRitn?=
 =?utf-8?B?MmJMV1JpNis5YkhJSk5Ra2NJVlZsdGVLbzA1NGJrakZhMkE0UjI0N1RDb1Fx?=
 =?utf-8?B?VXhZdWx1NXRKcDVUV1VSWGMvWXJucUVkMUcwWVdDVlVOZ09Xd1E1T3Viamdj?=
 =?utf-8?B?S0srSEhaL0tERkowbjlraDRsL0hpUzhudUZLUjlwZWNubitzYk9NMDVZSTEz?=
 =?utf-8?B?cnJHaVBmQ1R0OVBqUWpGaFRDTVlkOWIrcUlsTS9XOWVIeGI3OTFoaWlUcUNa?=
 =?utf-8?B?VFBHMWpGdkc1RlV0QjVTTmROVm1BR0FCV1NvRi9hS2xCNUpUeWgrT3k1eWFG?=
 =?utf-8?B?enFYNkdWK0pRNVZENUxsY2I4akkxeUFZU2xhMHZ0MHVSVEozU3g3VVhMZFNJ?=
 =?utf-8?B?VnBMbXAvWnZuN0R3cS91K1Bzbkg4eU10VkJBeXZyalhnR2ZDRnBoSVRCQ0VR?=
 =?utf-8?B?MUEwSHFGKythQXdvRnVYUTljcTFGdGZLRU40TGZsc2U3SkxhUWE4U3dTZUFQ?=
 =?utf-8?B?allHRDZJWmRYUk1qdTd1SFJIZnBuTE1TMXVjcWwwSDgrQzBvdGxtMkcrOXF4?=
 =?utf-8?B?MXY0TjMwc3BYM2dRN1E3NDZ3ajVQVFJUSFlrbk82NFpaSEY3dE1SSHVab0pm?=
 =?utf-8?B?dWxjOHlpWkVQTGYvQkMrMzNFb2VWOEV3d2FpdDNiK0xMMEZhOFVEZ2ZNWWRT?=
 =?utf-8?B?WUt0VnRBRitCYzhON1JvbFFmdGZqNW9pSEZEdzdVZWNic1QvQ2xmb0NOaUdU?=
 =?utf-8?B?WDFmMzg0dldBd21wQVNsbk9lWHEzQmdVaHdub2pMZWRoRFVDYXJ2T0VWR0J1?=
 =?utf-8?B?T2dVbWdlRFpia0Q4QXZwVEptL1lMdElIbWRiSGxGcVZEdnFmYklqcDNBWVdU?=
 =?utf-8?B?RWI5SVpkVTJJWFNPdENUczB2ZFRRM0d3RnJhV0VkVFZoQ3FGZUl4aURZQ3pS?=
 =?utf-8?B?UCt0cTJ5My9tS25Xc1YrbXBsVDBSSFpVKzRJRVFobDhGbDZMYndhR2lTT0NU?=
 =?utf-8?B?Um5pY0xreVdHS1hLZVFZak8vS0NlSm4zZW5qRFROdUh3QmNLaE1SYUJ3MzRq?=
 =?utf-8?B?N0kyaldoaVo4bXhpbVhvWmRZbGhlV1phWHpDUXB4MnZLQWhodDAwSENLNGV3?=
 =?utf-8?B?NFlXSXh0VzFXUmRaTGtKdlpVUy9KMjJHQTZXdG9Hb1hFbUx1TU83bGhNald0?=
 =?utf-8?B?U2doR1RHN3Ezd0JwbUUrRmtQamVjWEJtMUR2OEdkZHVHSkF0WFBWbzlNRlZV?=
 =?utf-8?B?a0FVRDJTekhJNXJManhwcTBDamdldmhLOWhJaU8xTXVMMmNCTlNkS3hVak8x?=
 =?utf-8?B?bEhvMlpmTnZUN3M5YXYwMlMvTWtrdGlGZ2c0TnhvNzhZSXA2N3AvK3VHdlVE?=
 =?utf-8?B?REE1Q0tYRnJRN0dKOGpsd2VoR0xzREZORGR6ZHJYQ1UyWFd4elRkb3hYb3di?=
 =?utf-8?B?WDErbm5PY2ttRW5tb1NER2pxT1pZcjNaOXFJZFhuVmVGaEtweUVnYzRMZnNO?=
 =?utf-8?B?cklRbU43NzFpaktNTGF4cTVPZ3JJeDV6TTZhajlRZ1A0K1lhVEptcGJqREpm?=
 =?utf-8?B?T2sxWXRETlBUNTF6Tk9NYVRmcnJYZTQrT0VYTnNwdHl1Um5yeTBjVE1OZk1D?=
 =?utf-8?B?cS9KODVWZXJlOXhZYUxBdEFQWGllVC8vYTJkTmxVVmNoQngySU1wWVNIc1Zj?=
 =?utf-8?B?dEZxSy92amROTUdBa1RuZXJKb2t6SGVsOW05RDk4YTNwZXFIYnZ4R29ZMWN2?=
 =?utf-8?B?RW9xTmdRbzdnTjg0UzhMbEl2dHRRY2ZpLzJHeGE0Ylhiem5qcUhWUVhUSGRI?=
 =?utf-8?B?NU5BWG8ySkxtTStmb0ZBSDJHVE9tTlNHSllMd205dGZiVVNtTkdxbXI2VFl6?=
 =?utf-8?B?dmtBQXNzT0ppTXFpckQycmxzbnpMRE51MEZxcis1ZU5wdFQ1R0lBbVE3NHBk?=
 =?utf-8?B?Ykc1MVpmQmNzeWs5RFlJamgvUUloWGwycTFHVlEwWEpFK1k1NGt4ZDhZRjkr?=
 =?utf-8?B?UVFNODdmdTRBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(10070799003)(1800799024)(366016)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SGp2bTBoR2hOelVnM3NZdnBwS1dpR0doaExjQjNzSFNUUmhpcFQyR0F5MXBW?=
 =?utf-8?B?KytMa0xRU1ZXUmtYUzJVVDFhRnYyN3IvVjQyUXRtVnZFZDFzdjRDaXR5YmVR?=
 =?utf-8?B?MDhHUTJ3clF5OTNHWVllSTc4SXBSRUZHajA3V0hXNXZFWWlZeGN6M0JDMENY?=
 =?utf-8?B?WXdJb2plQitRelVFMjZhc1pvVUlobDU1azRPNmFoU3ZnUWs3emdKZFQwa3or?=
 =?utf-8?B?cGN2bzJxSVJMN2Vod2ozeHErV3N2QVlZTmhuRUdiRFhFOHdGOHdIVnZaRzZR?=
 =?utf-8?B?cSsxVk9JaXlBalRPRGZicXJWRStKcHlvSnFaVWNjb0pGVUc1VjY2Zk4rRm16?=
 =?utf-8?B?ZXIyZy92RktTQ21OMVZ1a1lWeDl1eWsvamI1RXBmKzhYKzc4SjJ2SXYyMnlY?=
 =?utf-8?B?by9wZjBSYjV4SmloaWtsdlNlU3FCc2gwK1dvU3FlMjEvdmdOVk5CVkYwSDMy?=
 =?utf-8?B?SklGRk9qYWp3QjVRd2RIUGEvQ21YUjFhNGRpUm1OTVRaamRpZ3NaWi9DOE1P?=
 =?utf-8?B?NHJpUTBpT3NPY1NlU0RVM2xjdFZlY1MxUFI5NzNNNm4rZXd3R2o1WkgxVFJG?=
 =?utf-8?B?YjBVejlPWGhYQ0NZQU43QWNTdyt0bHhiR09mUmNHYXh3cTB1cmp6YVJ6SkFH?=
 =?utf-8?B?NlVYb1NFZ01LVDBmdGFQVTZWTjJHVmFvSDVIZ2VkdG9rak1zNnJ5dDZYMjRa?=
 =?utf-8?B?aHFqTXZ3NDFMYVZtRXp4bGR4Y3BaU3lUMWtZQnpJK0dvbFRHUTk2U3ZnVXho?=
 =?utf-8?B?QW9wdkswN1Z2WnV3RXVzanVZcXRqV1lmMmIzbWllbTdmcm5DNTByM2g0eGc3?=
 =?utf-8?B?L2IyOEZLWXdzSHVETkluNG4xcWRTcFY5Y2NGOHRRclVjdVVPcmRzWmczdGRD?=
 =?utf-8?B?cWVVQnpFa2szUUlNZ3JVdW1GWEVhb3Y2SFlnOFhvNmpkb01qZkMvZVRsc1FQ?=
 =?utf-8?B?T1BvL2R4bVU3d2t5NXJ4c3NPOFZLQXNsNkV2TWhGS3B1RG9VQ1dUUlJiV2k4?=
 =?utf-8?B?TXMvYlg2N1F5WkxmWkVlU2crWHBmNnUyeFRGb015b3k2QVBodmM3Q2V1L3FZ?=
 =?utf-8?B?SWVFSFFjQUFwVmQ3QWR3OXpMUTlOZlQ5bHNDQ2JOd2RSeGhQTTg4NTNYNG5U?=
 =?utf-8?B?RG9sRjRLNE5wcm5Ca2JXbFpxYmpacXpUZnJhemVFTHVxakVWcE16TnpaTGhJ?=
 =?utf-8?B?Uy9tS1BjWnFSK1ViRnI5dUVBMGU0VXBkakFnVDZMbVpabDE3VmtjeHRKTVJT?=
 =?utf-8?B?K28reW1sRlNEN2dBOW9iMkRiUFhRaGNibUVYYzlNVUVER3FBN0dpZXd1Wmwx?=
 =?utf-8?B?dkJtMTMrNzhzTy9nOE5rZUkwY0JESHJmYlF5Zkx5Qy8rSUwvdU9zMGN0TkZa?=
 =?utf-8?B?N1dreGtXbW82Y1lDaWpQaENwY0ZoSGtCN1BtQ3RWN25zbTBoUitFaXBQRzUw?=
 =?utf-8?B?Q1dUaVBPSW5XZ2ZaWGNpSS90TVhVbkZqalRZT0tJamtKUTVBeUFPaHpFeU91?=
 =?utf-8?B?QW55cXZaYk9sdlhDT3FEOVZCSm51TG1IMDRpU1lLMUdmMlhLUSt6anlPNjk1?=
 =?utf-8?B?Y0J4dXVzdzR0d3VIcXJ1cWNkTzhLcEtBZDJQMFBpbm9lbEVxR29CQndXRmZ6?=
 =?utf-8?B?eThtV0MzZWlQbEFQbndXbmxTM0pPTXdpdDdYRmtFcmI3cU81MlExdFhZOUJu?=
 =?utf-8?B?dWF3UFNrbW8xOWVvS01JUmFYejliNndHN1RLN1BMNzJPSWhMYkdDTmtCN3Jn?=
 =?utf-8?B?REhydUlpeEFQb3ViNmJIaEVoVXlKSjVwNVV1dDM5MEZ0SjdRZ3RlWU9IQ3Jm?=
 =?utf-8?B?ZGJBK1daTHVlQUJ4Q2Npb3haWEtqRWlqNTlROFFlZVJtaVFQT0xNL1NRcUlF?=
 =?utf-8?B?WkpSN1ZaYWxJR2lSTThGMHZ3QUorRXFZVGlTcTJrUGo2cEhyRFpWS2J6b3p1?=
 =?utf-8?B?TkZOam8vaVRzQ2xQM1h0MURWc1RBRUVOWVNxSXJ6cXl5NzN3Mk9KalpIdlhj?=
 =?utf-8?B?YUpkWWhOR2F3UFlUaWxLMmVSN0JwbEp0cjdiYzI5U2JKQVVvNUZLRmJrTGVC?=
 =?utf-8?B?Y0JWREhIRXRKaFBETFhDd0RFS2ZJenF1RGJyOXBZbExwM2JpbW10WVBUQmcz?=
 =?utf-8?B?dWJ2d283ZFRTMGxOTWNvS1VhamloYlpWeVNOajd1MTM4WDlHNVM2MTZxY0FZ?=
 =?utf-8?Q?0zMbfELr3QPv6z5CnSGA11opgus2pZQD9ttYBsGc6qi6?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 22002c0f-fb9b-48e9-fb17-08dd8005a61b
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2025 12:19:50.9405 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eiKXGbe5nl3YdXZVY0wMr+blzzyGqABHQBPM+ZICrUzH6iEL2Lm+8TARpozTFYVzwZBaQQDloaohLPWvaIa7cQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB9175
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

This series is a continuation of my previous RFCs [1] to complete the
first step of GSP booting (running the FWSEC-FRTS firmware extracted
from the BIOS) on Ampere devices. While it is still far from bringing
the GPU into a state where it can do anything useful, it sets up the
basic layout of the driver upon which we can build in order to continue
with the next steps of GSP booting, as well as supporting more chipsets.

Upon successful probe, the driver will display the range of the WPR2
region constructed by FWSEC-FRTS:

  [   95.436000] NovaCore 0000:01:00.0: WPR2: 0xffc00000-0xffce0000
  [   95.436002] NovaCore 0000:01:00.0: GPU instance built

This code is based on nova-next with the try_access_with patch [2].

There is still a bit of unsafe code where it is not desired, notably to
transmute byte slices into types that implement FromBytes - this is
because support for doing such transmute operations safely are not in
the kernel crate yet.

[1] https://lore.kernel.org/rust-for-linux/20250320-nova_timer-v3-0-79aa2ad25a79@nvidia.com/
[2] https://lore.kernel.org/rust-for-linux/20250411-try_with-v4-0-f470ac79e2e2@nvidia.com/

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
Alexandre Courbot (15):
      rust: add useful ops for u64
      rust: make ETIMEDOUT error available
      gpu: nova-core: derive useful traits for Chipset
      gpu: nova-core: add missing GA100 definition
      gpu: nova-core: take bound device in Gpu::new
      gpu: nova-core: define registers layout using helper macro
      gpu: nova-core: move Firmware to firmware module
      gpu: nova-core: wait for GFW_BOOT completion
      gpu: nova-core: register sysmem flush page
      gpu: nova-core: add basic timer device
      gpu: nova-core: add falcon register definitions and base code
      gpu: nova-core: firmware: add ucode descriptor used by FWSEC-FRTS
      gpu: nova-core: compute layout of the FRTS region
      gpu: nova-core: extract FWSEC from BIOS and patch it to run FWSEC-FRTS
      gpu: nova-core: load and run FWSEC-FRTS

Joel Fernandes (1):
      gpu: nova-core: Add support for VBIOS ucode extraction for boot

 Documentation/gpu/nova/core/todo.rst      |    6 +
 drivers/gpu/nova-core/devinit.rs          |   40 ++
 drivers/gpu/nova-core/dma.rs              |   54 ++
 drivers/gpu/nova-core/driver.rs           |    2 +-
 drivers/gpu/nova-core/falcon.rs           |  466 ++++++++++++
 drivers/gpu/nova-core/falcon/gsp.rs       |   27 +
 drivers/gpu/nova-core/falcon/hal.rs       |   54 ++
 drivers/gpu/nova-core/falcon/hal/ga102.rs |  111 +++
 drivers/gpu/nova-core/falcon/sec2.rs      |    9 +
 drivers/gpu/nova-core/firmware.rs         |   90 ++-
 drivers/gpu/nova-core/firmware/fwsec.rs   |  340 +++++++++
 drivers/gpu/nova-core/gpu.rs              |  211 ++++--
 drivers/gpu/nova-core/gsp.rs              |    3 +
 drivers/gpu/nova-core/gsp/fb.rs           |  109 +++
 drivers/gpu/nova-core/nova_core.rs        |   24 +
 drivers/gpu/nova-core/regs.rs             |  304 ++++++--
 drivers/gpu/nova-core/regs/macros.rs      |  297 ++++++++
 drivers/gpu/nova-core/timer.rs            |  130 ++++
 drivers/gpu/nova-core/vbios.rs            | 1100 +++++++++++++++++++++++++++++
 rust/kernel/error.rs                      |    1 +
 rust/kernel/lib.rs                        |    1 +
 rust/kernel/num.rs                        |   52 ++
 22 files changed, 3347 insertions(+), 84 deletions(-)
---
base-commit: 96609a1969f4ade45351ec368c65580c77592e8b
change-id: 20250417-nova-frts-96ef299abe2c
prerequisite-change-id: 20250313-try_with-cc9f91dd3b60:v4
prerequisite-patch-id: b0c2d08bdea8193307c43c04aa9ff96baf6b00e1
prerequisite-patch-id: b6d1232c2dfef24e4d3f8753a198eb6c427c3486

Best regards,
-- 
Alexandre Courbot <acourbot@nvidia.com>

