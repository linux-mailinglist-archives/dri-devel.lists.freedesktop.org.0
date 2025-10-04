Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A679FBB8743
	for <lists+dri-devel@lfdr.de>; Sat, 04 Oct 2025 02:38:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD7D010E1A4;
	Sat,  4 Oct 2025 00:38:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="d6qPECVt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazon11012030.outbound.protection.outlook.com [52.101.53.30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D4A010E198;
 Sat,  4 Oct 2025 00:38:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AjROHFdBpi4hzojmg8jqDgrjTvg8kXE8uHr/7gCnZjyVFNOl84gy3LRg6C9rcOHNq8VPaU5risPMtoJOB1mT4aEn/Y1O1+eM4fkU2vWkS6UPU+Spkweo5VZ32vYj1jOM/KL6hQArZz+PItxbqlRLIjFxJHUFMMryvtYvgH/oJGiA58wyRdPw3hwZU0q+OWBYiffnKIo4qL5jCck9GgaIf4V8ZQ6hnUOMqWOtnUZbc1sJMDnNHGvbvaC3tCsZNJ+h6pZDt2rryo3OodUi/ZUpCfgRq13jq0TEmANm+kqp0sZTOTyHlbGtgEvW5zRxvdbHyVJKIaHr3vWZd5UMjtp2Ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b6OgpW9NJ39YobOhSbH1bmd/bhO03EwwVD3pLlJ5iiA=;
 b=Di61QEsKGuuu/XzbuxCLHr/UQxljvXHKM2cruK9LWT8AFGaQWM6LYVBvRcCGUPtV4EgF704fyEeNx/PNwP2Uw6Euzl9ry6JyaltWhZ9NxtP2tV0GNR6cbgrbJdlX4ij18QZIJCex3zy+7Qx97H8pL2/iz11sJnF2vAECN7g50NRoeSLoSIJv7VdhIkvVMbfkDapKMl/oKXFIICuRY8AIQcqxMD48B4kpVwtia48QXP7TytgGwX2UXYrUvgkUz58NfMm8LysPYiFyUH2xgP428MBI4KtJxlmQeoFgv9dKCso9WHG28ab0cdvptaV9RB4m+3VZKB3hTu064zZcLYLf9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b6OgpW9NJ39YobOhSbH1bmd/bhO03EwwVD3pLlJ5iiA=;
 b=d6qPECVtNSpyHDXTWDxSYYvzUSowcNwGJau065kqeUpDLGPUhaieb1PmZa6o5BKPNiaK1migCXdNQrqfh4ycwVRXURSZ6LaBqVcp2XNapR9e7LFFznBd9cyBr6HGVOGQAY8IVt0I+KauCmI+NZIDYpXhln4CTfY1L7oRUT3xKllzjlE6yFQiyM+iFeNX1pDtLPVBNHC4+vIn5oKwviR7DDvNqvfxpERn6MO4ND5C3gTAM5BJUloiJFs2pr1K07ke7XjKbGlnrVGvP4NBJZQfczblocSa4zLTgwinDu9l39ftl+jqpIJXDv9MGZciDirOX3UlhucDqZ6Adh/MSDYhag==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by IA1PR12MB6353.namprd12.prod.outlook.com (2603:10b6:208:3e3::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.17; Sat, 4 Oct
 2025 00:38:16 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9160.017; Sat, 4 Oct 2025
 00:38:16 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 04 Oct 2025 09:38:12 +0900
Message-Id: <DD949OHGD5WP.1X9TCLIEKSHGB@nvidia.com>
Subject: Re: [PATCH v5 6/9] rust: bitfield: Add KUNIT tests for bitfield
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Joel Fernandes" <joelagnelf@nvidia.com>, "Alexandre Courbot"
 <acourbot@nvidia.com>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <dakr@kernel.org>
Cc: "Alistair Popple" <apopple@nvidia.com>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "David Airlie" <airlied@gmail.com>,
 "Simona Vetter" <simona@ffwll.ch>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "John Hubbard"
 <jhubbard@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>,
 <joel@joelfernandes.org>, "Elle Rhumsaa" <elle@weathered-steel.dev>, "Yury
 Norov" <yury.norov@gmail.com>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Andrea Righi" <arighi@nvidia.com>,
 <nouveau@lists.freedesktop.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20250930144537.3559207-1-joelagnelf@nvidia.com>
 <20250930144537.3559207-7-joelagnelf@nvidia.com>
 <DD7GCYCZU3P3.1KK174S7MQ5BW@nvidia.com>
 <81490b32-6ea2-400f-a97e-ad2e33e6daab@nvidia.com>
In-Reply-To: <81490b32-6ea2-400f-a97e-ad2e33e6daab@nvidia.com>
X-ClientProxiedBy: TYXPR01CA0055.jpnprd01.prod.outlook.com
 (2603:1096:403:a::25) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|IA1PR12MB6353:EE_
X-MS-Office365-Filtering-Correlation-Id: 349f5a2b-cd34-4335-17f8-08de02de4ec4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|1800799024|366016|7416014|376014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZEVUWjhSbHk2ellWS1RLTGxnTlN1cG8zbGRxR1hBMXZEU2dBWEF3RmpiN0dW?=
 =?utf-8?B?TjM3S25DeUViL081VjR0YTdaR0NxQ0dFM21wSWM1Nmp5Q250T3FKMW5xZnls?=
 =?utf-8?B?bm1QMXpzMkVwZnRZTlJVclYvMk0wSXhHZDlxcVpUSWlXMGxVWHRFU3AzMDNO?=
 =?utf-8?B?Qko1cWljRTY5eTRBU3RmWE4xM0loTFR6NUovV3lSQWNka3BaL1JCakZKUk9B?=
 =?utf-8?B?N3V2cllkZkNtMmd5Qmhua1hocHREVzcrRlZva29VS1hobDhwNmt3b2Z2SFZK?=
 =?utf-8?B?M3I1aWs0eWFCekZ3NEtzY1pFbDhJOTI0L0VmNGpsVGljN2dSai8vNEM5QVhk?=
 =?utf-8?B?QWFMME5EcGM1RHZxdktwN3ZkWkZHNHF2cnFVazhldDlPZnFYWGwzN09nSkJ5?=
 =?utf-8?B?WUNwOXhLTXRxcXYrRVRpY0VETWJkc0VKZGNoZHlDYmF3cGZRMytEVWcxaGph?=
 =?utf-8?B?TERxWjZHb2s2R3JOdlh2RTFubEtJV3lhRjBwK3lpSFcvWSs4ZS9VTFhRSmVv?=
 =?utf-8?B?Vm5mcjhodTh6L1lkVVR6UmNCOEtRZjZqZ0o5eW9BL09jTk9sWG9RRjVqUGcr?=
 =?utf-8?B?bzhjWVZPQ0NRNG44WEpqTnVva051cHF3L0ZSa2V3aWp2NldMZGlIMEgwOHY5?=
 =?utf-8?B?b1pvWXNVdStVVjVCRDljQ3RQUUR5a2JBeWJrUnhScE5xaGMyZjlWdDF0dFhq?=
 =?utf-8?B?cS9taVBlZ3BFM3J5T1pabjR5dHNEZk1lR3dCVGZBN0M5K1ZPUnRsVEcyNGlt?=
 =?utf-8?B?cG9VREdhK1JvNGhaa29yejhRQkVyb1dybXNwQlRPc1BKNXRjdzVlOWJRL1hI?=
 =?utf-8?B?dnZhWXBodWhwbGZVaXExOTFudDQzbGxObGdXclk4VEpGMDZaTFM2SlNJaXFJ?=
 =?utf-8?B?aVdRY05sU3ZuYkoyNFhTQStQY2FQVjNjVXpZNTJOUjM0QXAwUDd4U2hKbHRt?=
 =?utf-8?B?M1pDeGRidGlWMTVWUzQxRlNpNWpWR1pVR1VlZkRmM3RhRmIwWUVWaytmdmYz?=
 =?utf-8?B?ZU1NZGhMR3U1TTFadXRySmlaRVZoZ2ZEejlTekQ4ekh0OWVRVlBPbUxaOVFK?=
 =?utf-8?B?SFlGNGpsRTl1KzlLekRhUmlmeDZTalBPM3VGMS9aSUtTSXh6UnVpTmw3NTJT?=
 =?utf-8?B?cFkxVWQvZGN4ZEVOZ1FmbEl5K2szSFBsNk9NemxPZUFGSyt5OUdRdWxISzVs?=
 =?utf-8?B?VkV1dnJIZlBZb3lBd3l2VkloZkUwclZYa1IwOE5oTG14czRURkdDTU54L1ZH?=
 =?utf-8?B?STFRZmM0bFVvSWN0TTc0UlBzY21uWnM0Y2JNT3NiTjJOZWxNNTlkVW93K3A4?=
 =?utf-8?B?UDREYnhEdnN2MTJVSmZsUDRWWklnTGovbUJGTmFOa29EK0tlckZhdXhMSjRm?=
 =?utf-8?B?VFdRYnNsOWxqUUhzcU92S2dlUUVmbWtQSmhGck1YYUxOVjNkVitSM1N4Z0NC?=
 =?utf-8?B?Q0YvN09QQjQzME42aG02OE53eitkMEc1NE91eVNISVYxdjg2U29XUUc1S3p0?=
 =?utf-8?B?dGFJbi9rT3pXdlBIZ0VCT2V1c2c0WkZNdEJFVjBJQ0YvWS9LSUZnZ2dOWENs?=
 =?utf-8?B?Wjk1a21SWU5hQ2d4MmJtbHBGT3lVc3c3WW5lbUFmODlIOU9LWlVjOC9GUm4y?=
 =?utf-8?B?M0RFZ251ak9VQ0lUVFU4cERaK3dPUHJFN3BIZmJOYlBMOGNBT1lHYkdaNVlK?=
 =?utf-8?B?V0R5dzVCR3ZJZ1A2aGpuNHU0aURrVCtwbmVTeVZpVHQyaUdaZGYzQjRFOHVp?=
 =?utf-8?B?MUNzMmZGaFhteEZLMUR2bGpLUktjcml6RGtTU3NJd2FobzRrVDRoUVZJc0lH?=
 =?utf-8?B?b2luSGh3L2VaMzlyWGhRMmtIZXU1WlBiWUNOby9id1AvbWpGUHZGNUZROWlD?=
 =?utf-8?B?a0w2RmJ3MmZ0bk82bUpPNHI5WUt2ejVjKzVtYnRjekRiZldDcEhid0U1SE4x?=
 =?utf-8?Q?kVyjk1h66JfgrKpQOGJ9xwPME28cY09U?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(1800799024)(366016)(7416014)(376014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dW5KUnlNTE5PQldSNmlEaGttN3I2SmRNZmYxaUkzbkVQbDVIYXpQM0tsb0lN?=
 =?utf-8?B?U25Xb3NYdnhsbEcwZksyd1hScXRUeXRnOVQyVmRNOWNSd1dzcVZsSHhFMFJ1?=
 =?utf-8?B?bEFod0paU1NGcmkwU04vQ2ZZcWVBWGx2eVVkMlFDL0pvc0hpZ3hVVFhKWENo?=
 =?utf-8?B?Y09RUENyMmhOaGg3bGVpRFhteDFnNXZLaS9zeWpxT1FoMXo5a2hxT2U0MVR2?=
 =?utf-8?B?dTNkc1FxSXhVeE1BWW1Cd2wxM3o2MlhuYkw5dTNzUUNwOWcvSXovM2poZDk4?=
 =?utf-8?B?OXBNUjU0NzVPeXE1RUJpUDlGbytvZTZrUW9vSVVxdkpqbjdLOVdvL0xqWnNB?=
 =?utf-8?B?TVZPK3Fwb2szTmF6cmRERnhMdWR2NFZmdUZ2ODhnSnB0YlVuc0FjVVhneHRY?=
 =?utf-8?B?MndLaEpXMjVvVnl1UW5Vc3lNNDFuL3FMTnNwVDdicSt3VEF1VDVKeWdwdEVX?=
 =?utf-8?B?NHJWRkFoYTZqNUF5SG9nTkpWL2p1U3phK3FrZDNtUlRqcXdnNlgxakE0Kys5?=
 =?utf-8?B?RGk3bHlRY0tvK1lUa3Z4c0tWckF3RzBmaXdCTW9PRklkTkJDOUREOURnQ2FD?=
 =?utf-8?B?UDIxbjRWN0VHeEpWSlFvYS9FM1dXWGY4dkxCa0QzSWlFaE8rUFp3ZzJKMGRw?=
 =?utf-8?B?VFEwcDE3MlFyQzJlZWxWY3FCenhzNjRhQ3dMOWZOYk5Gd3JxVTdiUDRzM2k1?=
 =?utf-8?B?UG91TVFEaGdGd0VZc0NTaDFpb05xWTQxRys0c2toNExrMmx2cnlQNE5ROXF3?=
 =?utf-8?B?R24zek8ySXk3TDQ0WjlRRDN3dWVKSENNWTNwYzVMcTNkRCsxbDZldUYyNFoy?=
 =?utf-8?B?OCtyZFQ3NTVGWGpsblY5bFl3UWJub004ZTdyS0NZMXhGRU9hN2RpbnBmREll?=
 =?utf-8?B?NFNMQlZHcExDNGFRV0pXOHRva1BlOWhFeC9zT1FaakNqT2h0Nnd6MG1Wbm4v?=
 =?utf-8?B?TVF1bUhSTGNVbXhVYnZvOHUvM0pSTkZhYUIwSVZ3RkRWQVRJZncrUWNTbEha?=
 =?utf-8?B?YUF3WE8vTUg2U21nZCthWTBkV1JuOEJLRXNEZWpPS0UvZ3FIMzBWOHM5emQy?=
 =?utf-8?B?VTZHeDhKd3I4aHBYNml5UGJkZlVvYkpKeXIwRC9DYi9VZ1ZOSnYrem5XR1hx?=
 =?utf-8?B?ZmlzcTlkcmdoNXdyT2I2SnNhdFVmdnVmQm1QaUJvRGpESWtGeVA0T0UvTGpE?=
 =?utf-8?B?bTV2c2NKNVVzdFhxdEppWjZzZTNOMVJZNEd5OEs5UFJBZTlpTE5MbXQ2ZFZo?=
 =?utf-8?B?Qkc1MlBOTzh6Sk5kSVZwM01KYnhkQ2xEcUhmSXNaUTdySGJON3hDY0JiWTc2?=
 =?utf-8?B?M1czcW5CRnVvd2tVM243SnVYSVk3bHJYcGJTZzA2RGVKdHFNRE82cU5Wb2Ny?=
 =?utf-8?B?SXQ0ZzFlNVRBQVU2SHFUTERpakFPS0NHbEtEclRTTGI5Wkk0eDRhbnVPd2J2?=
 =?utf-8?B?RFdWcW8vblpPc2FjaStZSFBUZmJQaVVyTGtqOTR1YWE5dFJVcVNzTjY2NzRZ?=
 =?utf-8?B?Ym5qVlIrWG81VDFTT0xkancyNWozS2F3SkRoaFljbGV1V0kzVUtIRVJFejlt?=
 =?utf-8?B?MURVMEhFY0lOeFFKdzJWdGdDQlM2TEIybTJBVzJuM0NIQTVKbjFpdE4zT1Rh?=
 =?utf-8?B?aXMzVUNBR1Roc3U4dHVUZkZYaG0zbXZEelpvZ0RLeTBUbVNpRWNnM0JSeUkv?=
 =?utf-8?B?S2tnUWU1RU5OUjRZaWd6V1FTWUNRVllFYUhWd3AzNlRjQXJhQ21oVnM3RlRE?=
 =?utf-8?B?YzdCaUFXaER3OGROcjJkdkY0dlZsemxrZEN0ZmF1eVFUOGVpb1FHNmNhVjdX?=
 =?utf-8?B?UmN5ZE9NQ1pnM3NBallvYnEwbDFvYkkxK3JHc1k0V2V6QUJQb29IOWtvVHZa?=
 =?utf-8?B?VDV1MkJYN25leEx2TE5YL3F5Tld2V0JJd1JvTnNwQ1lNWXpGQitwb1RtbUJG?=
 =?utf-8?B?cWJ6bFJvVVdSU0YwVXVJYUN6QjZXTmVwcTRDNG1vWHFpN0V5UXg2cEdmYnlO?=
 =?utf-8?B?K3dvYnNSMmpoc2N2WENjeGNMUWtWa1NBNjZvWS9ocGxKSVhoYnROZ3pYL2Zv?=
 =?utf-8?B?Q0lSNHJFOXIvd0tEeVFmWndwUy8yQkFTWm5zdU1tcGlhalFCMHV3WGN6emtl?=
 =?utf-8?B?ZGJ6aktFOGZRRG00YldqOHVRdjVzMWRIREVpckdlVjU5Q2VZNkpYYy80UUJq?=
 =?utf-8?Q?wqG/ao2pOzqHOJ/vJciX9KQ0r7hx7ePXM4SkqLSwSLu0?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 349f5a2b-cd34-4335-17f8-08de02de4ec4
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2025 00:38:16.4022 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NLubFsyUM+8AmJouqdZJppWI6m4P5fKRss8dSAQM7qqkMhsrSroMYynI9jiFP/xw5XhwNMkUieoqt0mbZHU8hA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6353
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

On Sat Oct 4, 2025 at 12:23 AM JST, Joel Fernandes wrote:
>> - The right field is actually written (i.e. if the offset is off by one,
>>   the getter will return the expected result even though the bitfield
>>   has the wrong value),
>> - No other field has been affected.
>>=20
>> So something like:
>>=20
>>     pte =3D pte.set_present(true);
>>     assert!(pte.present());
>>     assert(pte.into(), 0x1u64);
>>=20
>>     pte =3D pte.set_writable(true);
>>     assert!(pte.writable());
>>     assert(pte.into(), 0x3u64);
>>=20
>> It might look a bit gross, but it is ok since these are not doctests
>> that users are going to take as a reference, so we case improve test
>> coverage at the detriment of readability.
>>=20
>
> Ack. I will add these.
>
> Thanks for the review! (I am assuming with these changes you're Ok with m=
e
> carrying your Reviewed-by tag on this patch as well, but please let me kn=
ow if
> there is a concern.)

Please do not add tags that haven't been explicitly given. If we start
assuming one another's stance about patches, the trust we can have in
these tags is significantly reduced.

Doing so also doesn't achieve anything in terms of efficiency; if I am
ok with v3 I can give my Reviewed-by on it, and the tag can be picked up
along with the patch when it is applied.
