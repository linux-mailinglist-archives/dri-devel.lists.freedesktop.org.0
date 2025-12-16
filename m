Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AAF5CC0A7E
	for <lists+dri-devel@lfdr.de>; Tue, 16 Dec 2025 03:57:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97C6C10E65F;
	Tue, 16 Dec 2025 02:57:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="DxTYEEWb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11010056.outbound.protection.outlook.com
 [40.93.198.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6786D10E65D;
 Tue, 16 Dec 2025 02:57:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Lv9kwDV6lA/jut5MHv8jA79/cmNXO98FuVVyKlSHlUTjLZcexfoTy3kWTv8xkb1Df161EmlAWh8oxuxBLHBLrqr3v9sd7b1rglL02QCkk4FkfntQEnQPwzkXN/PQQuDETP3wzlv14kvkgk9sAzxJClccuswVBfqXNdbszF0oCAR7W/HuI44ROVDGdD/r/cFOnYyc2Iyw50uCX968qIq+gs+UHkXcroIstomFIv09F0jgQbTl5/4yT8f39+9jLyhd7zejpTY7o7+lcoAJ+TecZRQkvnTC5JAQurKX1o6Peh6OFWi74pKxqItp66odwngpxJnIfRGfM95Yyer/Wzz6Hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3b0uBUiult65NLSLVnT+f0uAZ6jkcOw6aEOAPc9YhJY=;
 b=Y4sPCkuwsEYzMR1/Hs9eSPDI5iZmxE4ZwVDq7vrZPQGPROM0RA1kMKjh2MWhmhh8a7c8xoVyhRJKe8/lk1k7fhc+GtHCVpzesI8lu2OTjJPKFNOB/Rzq+dbvFV4gpp6C0+JFO5Ik5o6NYZFfcoK/sFqQThmrv/KwN8oi7SHRznBBMa77CpQ4iCf/1cz3lGH0K3hBl1oauzGvsZV+H2p8A4VDHZ9/SXlMpBMY8G2iz5r18uAsuEgVM5hBneLL7H/e/Nvvlgn6K0JWsAlqbxRSJGmkUs0WrKie4XHU6h3ND60fty5fxg4/UmnTm2F2Y6lPjMt37eUhYueZcgNlRC9W7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3b0uBUiult65NLSLVnT+f0uAZ6jkcOw6aEOAPc9YhJY=;
 b=DxTYEEWb8ExWdiVEwaPKdp1c5c7rCP+aCKAknrqkg3EOIOseM/W4kD2K2TEXwB0aD9QLhzCxbbPiI/atOXGT8yUELrAk19gQ+yEzkLMS1gUX1nkFLk4EjfNf+R/9FLfW4yJoJgAXtJMM3dm9xUwFJ03CbOv9063U250qmA8NPVGJjBBtF/aqtRLYl/uf1/G89imMfdK5yQkDJ3NoLc1Jq6oTKSklbGzrjI/HJ4omETphGMwlWASmw6IqOptfDfVTuABcC9/9ocwZeylW++dY2HnQrckg6ICjQKos6caN4oDfwtLHgTDOCMZ99xMz6UArLunyECUx9sHgH5fJDIoI7w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by PH8PR12MB7158.namprd12.prod.outlook.com (2603:10b6:510:22a::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Tue, 16 Dec
 2025 02:57:45 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9412.011; Tue, 16 Dec 2025
 02:57:45 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Tue, 16 Dec 2025 11:57:10 +0900
Subject: [PATCH v3 4/4] gpu: nova-core: gsp: replace firmware version with
 "bindings" alias
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251216-nova-fixes-v3-4-c7469a71f7c4@nvidia.com>
References: <20251216-nova-fixes-v3-0-c7469a71f7c4@nvidia.com>
In-Reply-To: <20251216-nova-fixes-v3-0-c7469a71f7c4@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Trevor Gross <tmgross@umich.edu>, John Hubbard <jhubbard@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Edwin Peer <epeer@nvidia.com>
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 Alexandre Courbot <acourbot@nvidia.com>, Lyude Paul <lyude@redhat.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TY4PR01CA0107.jpnprd01.prod.outlook.com
 (2603:1096:405:378::15) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|PH8PR12MB7158:EE_
X-MS-Office365-Filtering-Correlation-Id: 3283b82a-5f8c-49ce-936e-08de3c4ee389
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|7416014|1800799024|10070799003|7053199007|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Mjg3M0FIUGQ5MHpmTGVPMWZ2RGlRbEZ2eHRZTXlLa2tJME5YdlJyYzRVM1ox?=
 =?utf-8?B?MVloc3VJVnAvbjhwZnA2MEZWenNJd2lGa3NFWFM1d3lSdHBIbERQWTFRMUZn?=
 =?utf-8?B?S2J2K2dvU0c0Z003TjFIaEFXL0hjMzg1RGNzVmtXNXVpYnY5ZFRoYjZXWVlq?=
 =?utf-8?B?eGFVM0pHazBRQ2lzRFpyQjhzcFNUczlCTzVJTG9XMlFuNER5UTNCa1B5UnY2?=
 =?utf-8?B?VFJWU2ZURmZKaGwyTkRXa1R3MnZqRFgvditsaURITVBkcWpJV1dmYTAwUC9a?=
 =?utf-8?B?bDl5V3V0YTNHL1JFQndhM2pVdHJMcXlRUURVYklxa0FtR0RBdkRjbmVpcFNr?=
 =?utf-8?B?Y3lhNE1LTzBzcHdRZXNpVjVEeUNEMHV2OVhWL2JCVFg5Z0oxcDBRRFFSWVFk?=
 =?utf-8?B?bTZlSzU1enBmT1BjSWtMb08rd0ZaOVlBdnUrRVNKQ2YzVGxYcFVaUHlhZGRu?=
 =?utf-8?B?VjV0YnRXRXZSMmdUMldaYm1QMUlLS1k1TXdIUUJoaWxHUHl6U01VRnl6TEZh?=
 =?utf-8?B?RzN3MkM3RnIzbE40WElOMC9Ld2NQTjFoZkFWTkZqdmZxdEV5RXpnQitINWVS?=
 =?utf-8?B?RktCczdQeHdnN3FwUnBkZTNLOUF5cVFQSGhSSHJLTGZtS1ZFOUFQNEo4OWRa?=
 =?utf-8?B?UWFseEh2aVlFNUZHdGVjeHc3elZJT2xIY3M3UlhqOVNRYnIrcExPRi9XREsr?=
 =?utf-8?B?Uk1TeW0vSzZEbE0yUU1BbEc0dTYzeUIyalNCNFBVU2FkMGgvaGpTME1pSm5p?=
 =?utf-8?B?bVZuN2NLcWdsTWhLOWpxbHdxRjFncVo2YjVNaEdybUtSRUVSNVZiUmg2a3Qy?=
 =?utf-8?B?Y0hkSGhwc3hnbjZYL3hyQTMwVEtIMG0rS0VCTWc5UXRPNXh6QjRXYlllRVQ4?=
 =?utf-8?B?T1hxL1hjcUExbGc5dWpPVGwvc3pvWW94L241MGxFaTJmbEZZY3NNSU50bytD?=
 =?utf-8?B?YUpMZElETStnNzdnYmNBOTRNWUdkTkFodUZNRGJyRU01SFMyRzR1UjA1N0hz?=
 =?utf-8?B?TVkxaml1YmkwMzR0Q0kwTXpOWUl3c2RGSzF2T1Jad21MVTFOUUVBazBBVGcv?=
 =?utf-8?B?M0hzcHY4QXppdHJvYjdnamV3UDBKTzVZVmhzQ0U4RHpTeHdKdnY3WjFmKzQx?=
 =?utf-8?B?K3hRa2VmanJjK2dOT3gzVGtWMTcvODVjL1llcS9DOFJRSDI5a3lTNHFKcld5?=
 =?utf-8?B?M05XcmFmWjBlWXMwRURkUDh1U2pMaWJSRjM2L1pvc0hXOU1CWVdINkxJVzZS?=
 =?utf-8?B?eExyZG1YeDVWYko5SU12SFZNVU1sYnlRSnFZS2tZUUNQbUZnMWgzNGU3RGpZ?=
 =?utf-8?B?UlhXOTlNZ1RwQmNWbnpOdW5YTWdPV3hMV01CMjNnZUZkTEY5OUZsamxjRCtK?=
 =?utf-8?B?aVNEVzJydlFEMnUxZ2k3RkM4RU44czE5ZWhIVHAwOWNzQ3lpTmRxM09UQjNo?=
 =?utf-8?B?bmZtdnZYVjdlNDljcDNwanQySmxhSWlFU1h5R1FwNXNzVk0xazQwQlZkYjJU?=
 =?utf-8?B?VUlaeGh6VWNhVzVFR2JLV2VVQWhlQlZRbEdEanphQ082SVhkK1gzYUZMY3NY?=
 =?utf-8?B?dVJGekJzKzRwRUw3WXhyWDFBaUhqWW5QRFhDMlVMeVp3V0hGbXlzL2JrWUx6?=
 =?utf-8?B?NEVmNzU2Rjd4RGlHZndyZU4vQ2JrVVpPeVVwOFBSWmJNNnM0clhLRGkxbXVx?=
 =?utf-8?B?NG02UTVGNnRnZm5LU2pEOFFmbU9PUk1CSnpDWWQyaVgvZHJwdzZWSGw2b2Vo?=
 =?utf-8?B?cWJwYXA3d1lIUkljMy9IVlRTMEY1VU05eWVmMHVVWmhiZ2dsYlZ4bDM3bERL?=
 =?utf-8?B?WW1tVVRMVDRHVnFSdDFsSCtPMlV1QTcyV0UwYyt4UlR3OGhGSmNVd2loS0Zo?=
 =?utf-8?B?dmljZUhCenlXSjRybTdNZEhxRHYzdURYS2E2aHp5TmdWMnRvSWlTZTMzNHh1?=
 =?utf-8?B?U2ozWDA4Y3IrREVJR0ZYR2pvQmRSZ0pEZGRXbmRuaE1JTGRyaXRVcDJ3SHgy?=
 =?utf-8?Q?YGctE3AXb3qwnbv+f1SyMZ/3pJQgcU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024)(10070799003)(7053199007)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZFBrVTNtWkhuUkVmalRaV2Vrb25EaVQ0RFZFYW1iVTAxQk42Ly9KK2R6cVRD?=
 =?utf-8?B?MnVqTEpxWGVHNnp6RUIvNnltM0o0WTBDN0lmYUtuQytGWW0wc3h6UTdUaFgw?=
 =?utf-8?B?a2dRbGlVT29PQi9pNUx2aDZOWnU4Z1lYMkdkaUV6S2pxcmNSWHB5NlpJdlgy?=
 =?utf-8?B?MUhhRVVuZ092U2ZzV2RPOTBXbEFRWFV0Ti9URHM3cmM4cy9qQ1o0ajF0dlIw?=
 =?utf-8?B?N0JxcjJ5S0JMT1BUeGdHbjF4V3FGMnJDdGRwZlFXbWNac3lUWkkycXkvODF5?=
 =?utf-8?B?UVpaVGVKbHdwSUoyL25Ta2s5blFvOEZDUGZHdy9aWDhKUjRxdFNlbnRDU0Nw?=
 =?utf-8?B?bXhRUFZMZVRFenA1dWp6MTRQMG5aUVV0L25iWWZ1b1ZQK1IvbDN3VUl5MnhX?=
 =?utf-8?B?a2JJV2Q5eTZGbXd0WVZmaTlGQzlFaXpyR0VicWh1bHNRQWF4VHF2ZlQ1T2hh?=
 =?utf-8?B?RUowQzY1c3lBODlPbW5BcFVLVGR1VXhoeGpoSE1reTg5M3ZSSGJrVXNCbWxj?=
 =?utf-8?B?dDN5WnJGMFpvN25BeGRsYitZZE9LQ0ovazJFRkd4Z3FERURSSmM1amdLeWQw?=
 =?utf-8?B?a2VjYjZoVk1OUFNQYVZ0bW5zRFQ1Q1MyU2NsTXdnV1lSZHJhMWJTVkRVWm1G?=
 =?utf-8?B?MW5LWDRvM00wZDc3OVlTSTc4Q2VUMFRidDFIQzlyRWZoVjJ0Yk9VK1JWdm40?=
 =?utf-8?B?eU5wME5UT2RCeWVmYUYrcjlGUCs3T3FYNDBUWlVGNWpsQWtlcktMdDRNZ1RQ?=
 =?utf-8?B?eXJmZzJHSExzRWNSZmVucmtsUGVVNW5Bc2RXLzczQUlVUDVxWHErVExEbXdI?=
 =?utf-8?B?ZjFzTDFiU0RtdDhUdTlCNzhFWkNzNUUzd05ydGs4WkdYK2dLL1U1M0ZQVXl2?=
 =?utf-8?B?NWlWZnlnQXJUSE92WkJKbU52bzdvVGE3SzgwNzhsZ1hLM3RTMHRpcEdZUTVy?=
 =?utf-8?B?UmpmZnlYMVhFWkt1SnhwWTZhMStHVUoyM3ZVL3VLdEhTYjdpWWE5Yy9IY2VN?=
 =?utf-8?B?MFVqUWFtam1mYzZIMlNYZ1ZRRTJubUdXWkFqWjliN3JxeUtyZ3piZmJvbWsx?=
 =?utf-8?B?QmdEaEw4aDFlMkN0VklsS05nc2xuTG45c1JBZmFySjdFTVlTRWtmUGpVZlhr?=
 =?utf-8?B?SmZQT1BoeEMxZmNCVUFma3VrdUdQZDVKUFBJelg2cUNHL2orYzhEb3gzK3No?=
 =?utf-8?B?N1lGVEVaYy9pY2xIUHQyS0N1Nm1NNHdobjl1YTNEcEViR0tmcGRQRFVPUkc0?=
 =?utf-8?B?L3BNbW9BYTBQMkd5dytMYmlBWGtRQWxaQis5YVFGMmFNU3ArTUZvM2pMM29r?=
 =?utf-8?B?cXVSQjFPZGJucTRQbDB6RHZOQkJkcnU0NG9JZkNTVitlZ0pGemxEYU9hQnBX?=
 =?utf-8?B?NWpNdEZvUUJyNG5BeVNxVVZNeG1oZGdtRU1ubzRIVzZMSDdOMjFlcmU2OU1K?=
 =?utf-8?B?S0h1b3BsNHJGMEpQdDQvNVp1bHdIcW03OTFZcmdhYjdVa2pZcWpCZGQxZCtR?=
 =?utf-8?B?Nnp2ZDJHeG1QYk1zMDBNVTZNaHBiZGI3ZFJqNDBVU2tONHNSNGk0QVFNUGUx?=
 =?utf-8?B?VTBjSzdtSHJnSUNzTXhzUDV3MzdFWWtMZUhnQUNHcnQraGV4eFZsbnRRQmFO?=
 =?utf-8?B?ZUJDU25XVmNVdkx3Y05ybXlyZXQ5ZWtxWHo4UktvL0xKcGhQbTJvS2FHUldW?=
 =?utf-8?B?czE5M0ZuZ3l2djRrQ1BaM2lQbmFZY3gwZTNvYy9kK2FjYXppSnI0aDhpTEVm?=
 =?utf-8?B?RUFLc3FWelJXS2RpZTdyMWl2ZmIyT3laQzRxWnFLVEdqVm5SSEVIY3pHekEy?=
 =?utf-8?B?Nm1hbEpPRWYvdnNad2hYbWIwVEVULzNIS0FnWktVNzBqOGwzNWx6eVVUSXhm?=
 =?utf-8?B?d1Yvb0tFeHJ0eiswYW5DMnNzWVNqRE9zWS9HNHlLQ1RJRCtobXRzRmpEM01K?=
 =?utf-8?B?SXppb2RrZDNWMzNxWXQ2d0UwOHhBemdpdkcxSmFQNE9ONTZDNWhiWjJENjh6?=
 =?utf-8?B?alhtdzJTUWxUa0tDTHI1ZngzMG5DcDNXNEE5cWNuSUsxbTE3ODFkakVzWU0z?=
 =?utf-8?B?WFZPVm9tOXRLRW5pelBoZkxxN0g1S0RnWHljaVYxaDJHS2FRNXI0Z1pUOTdW?=
 =?utf-8?B?Q010c3A5amk1UE1jL25NdHpENXRTNXdDb3p6NUVZT0QyOWNrWklDSnZFV3Ry?=
 =?utf-8?Q?2gIbX4Ar1zrfDZX2/rYj6b22WBb4kuGbfHucg2M6kWuw?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3283b82a-5f8c-49ce-936e-08de3c4ee389
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2025 02:57:45.6939 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VN6uynjue8fBhAwIpzqU8ewoE9MOLK7n/yiXOwRXbCfmlLkc/Rv/gdvGYEv8WpOZ8LWd2SvVbFrgf9qSLUlR8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7158
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

We have an "bindings" alias to avoid having to mention the firmware
version again and again, and limit the diff when upgrading the firmware.
Use it where we neglected to.

Fixes: eaf0989c77e4 ("gpu: nova-core: Add bindings required by GSP sequencer")
Reviewed-by: Lyude Paul <lyude@redhat.com>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/gsp/fw.rs | 58 ++++++++++++++++++++---------------------
 1 file changed, 29 insertions(+), 29 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp/fw.rs
index b754631d2d8d..caeb0d251fe5 100644
--- a/drivers/gpu/nova-core/gsp/fw.rs
+++ b/drivers/gpu/nova-core/gsp/fw.rs
@@ -141,8 +141,8 @@ unsafe impl AsBytes for GspFwWprMeta {}
 // are valid.
 unsafe impl FromBytes for GspFwWprMeta {}
 
-type GspFwWprMetaBootResumeInfo = r570_144::GspFwWprMeta__bindgen_ty_1;
-type GspFwWprMetaBootInfo = r570_144::GspFwWprMeta__bindgen_ty_1__bindgen_ty_1;
+type GspFwWprMetaBootResumeInfo = bindings::GspFwWprMeta__bindgen_ty_1;
+type GspFwWprMetaBootInfo = bindings::GspFwWprMeta__bindgen_ty_1__bindgen_ty_1;
 
 impl GspFwWprMeta {
     /// Fill in and return a `GspFwWprMeta` suitable for booting `gsp_firmware` using the
@@ -150,8 +150,8 @@ impl GspFwWprMeta {
     pub(crate) fn new(gsp_firmware: &GspFirmware, fb_layout: &FbLayout) -> Self {
         Self(bindings::GspFwWprMeta {
             // CAST: we want to store the bits of `GSP_FW_WPR_META_MAGIC` unmodified.
-            magic: r570_144::GSP_FW_WPR_META_MAGIC as u64,
-            revision: u64::from(r570_144::GSP_FW_WPR_META_REVISION),
+            magic: bindings::GSP_FW_WPR_META_MAGIC as u64,
+            revision: u64::from(bindings::GSP_FW_WPR_META_REVISION),
             sysmemAddrOfRadix3Elf: gsp_firmware.radix3_dma_handle(),
             sizeOfRadix3Elf: u64::from_safe_cast(gsp_firmware.size),
             sysmemAddrOfBootloader: gsp_firmware.bootloader.ucode.dma_handle(),
@@ -315,19 +315,19 @@ fn from(value: MsgFunction) -> Self {
 #[repr(u32)]
 pub(crate) enum SeqBufOpcode {
     // Core operation opcodes
-    CoreReset = r570_144::GSP_SEQ_BUF_OPCODE_GSP_SEQ_BUF_OPCODE_CORE_RESET,
-    CoreResume = r570_144::GSP_SEQ_BUF_OPCODE_GSP_SEQ_BUF_OPCODE_CORE_RESUME,
-    CoreStart = r570_144::GSP_SEQ_BUF_OPCODE_GSP_SEQ_BUF_OPCODE_CORE_START,
-    CoreWaitForHalt = r570_144::GSP_SEQ_BUF_OPCODE_GSP_SEQ_BUF_OPCODE_CORE_WAIT_FOR_HALT,
+    CoreReset = bindings::GSP_SEQ_BUF_OPCODE_GSP_SEQ_BUF_OPCODE_CORE_RESET,
+    CoreResume = bindings::GSP_SEQ_BUF_OPCODE_GSP_SEQ_BUF_OPCODE_CORE_RESUME,
+    CoreStart = bindings::GSP_SEQ_BUF_OPCODE_GSP_SEQ_BUF_OPCODE_CORE_START,
+    CoreWaitForHalt = bindings::GSP_SEQ_BUF_OPCODE_GSP_SEQ_BUF_OPCODE_CORE_WAIT_FOR_HALT,
 
     // Delay opcode
-    DelayUs = r570_144::GSP_SEQ_BUF_OPCODE_GSP_SEQ_BUF_OPCODE_DELAY_US,
+    DelayUs = bindings::GSP_SEQ_BUF_OPCODE_GSP_SEQ_BUF_OPCODE_DELAY_US,
 
     // Register operation opcodes
-    RegModify = r570_144::GSP_SEQ_BUF_OPCODE_GSP_SEQ_BUF_OPCODE_REG_MODIFY,
-    RegPoll = r570_144::GSP_SEQ_BUF_OPCODE_GSP_SEQ_BUF_OPCODE_REG_POLL,
-    RegStore = r570_144::GSP_SEQ_BUF_OPCODE_GSP_SEQ_BUF_OPCODE_REG_STORE,
-    RegWrite = r570_144::GSP_SEQ_BUF_OPCODE_GSP_SEQ_BUF_OPCODE_REG_WRITE,
+    RegModify = bindings::GSP_SEQ_BUF_OPCODE_GSP_SEQ_BUF_OPCODE_REG_MODIFY,
+    RegPoll = bindings::GSP_SEQ_BUF_OPCODE_GSP_SEQ_BUF_OPCODE_REG_POLL,
+    RegStore = bindings::GSP_SEQ_BUF_OPCODE_GSP_SEQ_BUF_OPCODE_REG_STORE,
+    RegWrite = bindings::GSP_SEQ_BUF_OPCODE_GSP_SEQ_BUF_OPCODE_REG_WRITE,
 }
 
 impl fmt::Display for SeqBufOpcode {
@@ -351,25 +351,25 @@ impl TryFrom<u32> for SeqBufOpcode {
 
     fn try_from(value: u32) -> Result<SeqBufOpcode> {
         match value {
-            r570_144::GSP_SEQ_BUF_OPCODE_GSP_SEQ_BUF_OPCODE_CORE_RESET => {
+            bindings::GSP_SEQ_BUF_OPCODE_GSP_SEQ_BUF_OPCODE_CORE_RESET => {
                 Ok(SeqBufOpcode::CoreReset)
             }
-            r570_144::GSP_SEQ_BUF_OPCODE_GSP_SEQ_BUF_OPCODE_CORE_RESUME => {
+            bindings::GSP_SEQ_BUF_OPCODE_GSP_SEQ_BUF_OPCODE_CORE_RESUME => {
                 Ok(SeqBufOpcode::CoreResume)
             }
-            r570_144::GSP_SEQ_BUF_OPCODE_GSP_SEQ_BUF_OPCODE_CORE_START => {
+            bindings::GSP_SEQ_BUF_OPCODE_GSP_SEQ_BUF_OPCODE_CORE_START => {
                 Ok(SeqBufOpcode::CoreStart)
             }
-            r570_144::GSP_SEQ_BUF_OPCODE_GSP_SEQ_BUF_OPCODE_CORE_WAIT_FOR_HALT => {
+            bindings::GSP_SEQ_BUF_OPCODE_GSP_SEQ_BUF_OPCODE_CORE_WAIT_FOR_HALT => {
                 Ok(SeqBufOpcode::CoreWaitForHalt)
             }
-            r570_144::GSP_SEQ_BUF_OPCODE_GSP_SEQ_BUF_OPCODE_DELAY_US => Ok(SeqBufOpcode::DelayUs),
-            r570_144::GSP_SEQ_BUF_OPCODE_GSP_SEQ_BUF_OPCODE_REG_MODIFY => {
+            bindings::GSP_SEQ_BUF_OPCODE_GSP_SEQ_BUF_OPCODE_DELAY_US => Ok(SeqBufOpcode::DelayUs),
+            bindings::GSP_SEQ_BUF_OPCODE_GSP_SEQ_BUF_OPCODE_REG_MODIFY => {
                 Ok(SeqBufOpcode::RegModify)
             }
-            r570_144::GSP_SEQ_BUF_OPCODE_GSP_SEQ_BUF_OPCODE_REG_POLL => Ok(SeqBufOpcode::RegPoll),
-            r570_144::GSP_SEQ_BUF_OPCODE_GSP_SEQ_BUF_OPCODE_REG_STORE => Ok(SeqBufOpcode::RegStore),
-            r570_144::GSP_SEQ_BUF_OPCODE_GSP_SEQ_BUF_OPCODE_REG_WRITE => Ok(SeqBufOpcode::RegWrite),
+            bindings::GSP_SEQ_BUF_OPCODE_GSP_SEQ_BUF_OPCODE_REG_POLL => Ok(SeqBufOpcode::RegPoll),
+            bindings::GSP_SEQ_BUF_OPCODE_GSP_SEQ_BUF_OPCODE_REG_STORE => Ok(SeqBufOpcode::RegStore),
+            bindings::GSP_SEQ_BUF_OPCODE_GSP_SEQ_BUF_OPCODE_REG_WRITE => Ok(SeqBufOpcode::RegWrite),
             _ => Err(EINVAL),
         }
     }
@@ -385,7 +385,7 @@ fn from(value: SeqBufOpcode) -> Self {
 /// Wrapper for GSP sequencer register write payload.
 #[repr(transparent)]
 #[derive(Copy, Clone)]
-pub(crate) struct RegWritePayload(r570_144::GSP_SEQ_BUF_PAYLOAD_REG_WRITE);
+pub(crate) struct RegWritePayload(bindings::GSP_SEQ_BUF_PAYLOAD_REG_WRITE);
 
 impl RegWritePayload {
     /// Returns the register address.
@@ -408,7 +408,7 @@ unsafe impl AsBytes for RegWritePayload {}
 /// Wrapper for GSP sequencer register modify payload.
 #[repr(transparent)]
 #[derive(Copy, Clone)]
-pub(crate) struct RegModifyPayload(r570_144::GSP_SEQ_BUF_PAYLOAD_REG_MODIFY);
+pub(crate) struct RegModifyPayload(bindings::GSP_SEQ_BUF_PAYLOAD_REG_MODIFY);
 
 impl RegModifyPayload {
     /// Returns the register address.
@@ -436,7 +436,7 @@ unsafe impl AsBytes for RegModifyPayload {}
 /// Wrapper for GSP sequencer register poll payload.
 #[repr(transparent)]
 #[derive(Copy, Clone)]
-pub(crate) struct RegPollPayload(r570_144::GSP_SEQ_BUF_PAYLOAD_REG_POLL);
+pub(crate) struct RegPollPayload(bindings::GSP_SEQ_BUF_PAYLOAD_REG_POLL);
 
 impl RegPollPayload {
     /// Returns the register address.
@@ -469,7 +469,7 @@ unsafe impl AsBytes for RegPollPayload {}
 /// Wrapper for GSP sequencer delay payload.
 #[repr(transparent)]
 #[derive(Copy, Clone)]
-pub(crate) struct DelayUsPayload(r570_144::GSP_SEQ_BUF_PAYLOAD_DELAY_US);
+pub(crate) struct DelayUsPayload(bindings::GSP_SEQ_BUF_PAYLOAD_DELAY_US);
 
 impl DelayUsPayload {
     /// Returns the delay value in microseconds.
@@ -487,7 +487,7 @@ unsafe impl AsBytes for DelayUsPayload {}
 /// Wrapper for GSP sequencer register store payload.
 #[repr(transparent)]
 #[derive(Copy, Clone)]
-pub(crate) struct RegStorePayload(r570_144::GSP_SEQ_BUF_PAYLOAD_REG_STORE);
+pub(crate) struct RegStorePayload(bindings::GSP_SEQ_BUF_PAYLOAD_REG_STORE);
 
 impl RegStorePayload {
     /// Returns the register address.
@@ -510,7 +510,7 @@ unsafe impl AsBytes for RegStorePayload {}
 
 /// Wrapper for GSP sequencer buffer command.
 #[repr(transparent)]
-pub(crate) struct SequencerBufferCmd(r570_144::GSP_SEQUENCER_BUFFER_CMD);
+pub(crate) struct SequencerBufferCmd(bindings::GSP_SEQUENCER_BUFFER_CMD);
 
 impl SequencerBufferCmd {
     /// Returns the opcode as a `SeqBufOpcode` enum, or error if invalid.
@@ -612,7 +612,7 @@ unsafe impl AsBytes for SequencerBufferCmd {}
 
 /// Wrapper for GSP run CPU sequencer RPC.
 #[repr(transparent)]
-pub(crate) struct RunCpuSequencer(r570_144::rpc_run_cpu_sequencer_v17_00);
+pub(crate) struct RunCpuSequencer(bindings::rpc_run_cpu_sequencer_v17_00);
 
 impl RunCpuSequencer {
     /// Returns the command index.

-- 
2.52.0

