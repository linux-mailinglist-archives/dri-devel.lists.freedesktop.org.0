Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D722FB43984
	for <lists+dri-devel@lfdr.de>; Thu,  4 Sep 2025 13:06:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E5EE10E9F2;
	Thu,  4 Sep 2025 11:06:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="G4CQpuRj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2056.outbound.protection.outlook.com [40.107.96.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DC7B10E9E6;
 Thu,  4 Sep 2025 11:06:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AEKEciDjChSnNWMw4HGxhvXymo2YcRwOBLkWBNubSXlcMvqqRsYRZdkqDFibaruz8K55x3j3MQ28dM019svh6963VT9Y/cBDLzs/9YOUcFZy2eMnHTvg+Fh9KMc5O8Yg3avm1fOPGuCpdJoPILB3ySJ9rPRIbarXbPMsts6LWxBg5ToYa8ojKtVeJOVXfp+UtGsA9QN6dVs5ROo34/v00lbvPqD60baUnPYkBneU/BUV6h+7dOUXdaWXiECK6wDWMBGD5lgPUM4EpxyjQrzLMWfgzwfs+pGbQy/hNlJjDBWD/8l5TVHd6DVX+pl9SpFjJ9aUyGIiRvx/ftiz3wC6WA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HYHC85QquLhWTcYuW1IMg2To06zmsTrLLooZED4ofcI=;
 b=xTPW6r7BgdqaXEAodb2tUUWvwwiA/9yyLvFJd0qivQTi5ZuvIyPHvbsAnkUMbq83OG/MowoZFYmGR+7cmUV3NDyjFZkNQ+SuOAeGFX5/timnMOBug9iHk6f9AilCDFK4H1Ky0jaweCjitU0fu5i5mdnP/sxMCCQ6KmWrmQHv2OYDNwIVb76uYnDR8QFPJ6MxK1ApqPdvBiMfXkGrDT0tVRC6CUbNXNSgBd+pfhC5JNJ+y4nATpj4XyB5i+eaMGN5+2Mkf1l2p3w2LnknXxmpT5ZBufWNXrjb81T+Bf9meT8eVhrcUXFF56XQa+qty3JxwJit8O74zHzToEsFkgGfaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HYHC85QquLhWTcYuW1IMg2To06zmsTrLLooZED4ofcI=;
 b=G4CQpuRjH5BtFMUxC92wh1lgHbNW09jI9PzyuJggWSTJfG4aqU69b9P+Nz3qtnYm35GkApy1TO0aZo6bXN4dtS8Wn8PQUg7OtkCJZJVSSrfpSQyEMBuxZ5Ww5wN/7iRBfpwUZOpP/rIJMBUZ71iQQc5L6uggRinf0EHpjY4FdRGNUrLv3Z6yzTKXJVITe756JzEHfpFRa9Ax1U5Amexyb2gLgbFwWkKVL3fGgN7c+Z0wsm+3VnQQJsREOc4Diafqgen2MsDvTjpgTlJBI+a4DexdpgKd8l+BuurO4RDP2y4fPhCj1e4Y2nOHmXEcLkKluCQtIrsvJgHTzKkQGHQ8dA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CY8PR12MB7436.namprd12.prod.outlook.com (2603:10b6:930:50::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Thu, 4 Sep
 2025 11:06:18 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%3]) with mapi id 15.20.9052.027; Thu, 4 Sep 2025
 11:06:17 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 04 Sep 2025 20:06:14 +0900
Message-Id: <DCJYU75OUCGQ.3AEODDJR4IT38@nvidia.com>
Cc: "Joel Fernandes" <joelagnelf@nvidia.com>,
 <linux-kernel@vger.kernel.org>, "David Airlie" <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>, "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "John Hubbard" <jhubbard@nvidia.com>,
 "Alistair Popple" <apopple@nvidia.com>, <nouveau@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH 1/2] nova-core: Add a library for bitfields in Rust structs
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Danilo Krummrich" <dakr@kernel.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250824135954.2243774-1-joelagnelf@nvidia.com>
 <DCBGLCQVD1RF.6V5UT0NQ4GLB@nvidia.com>
 <444ebd64-7a90-46a6-b885-2c114aa59284@nvidia.com>
 <DCJOUO214EXC.32MFBN80VJW3K@nvidia.com>
 <DCJTY0OQFG83.1AX49CQARXCEX@kernel.org>
In-Reply-To: <DCJTY0OQFG83.1AX49CQARXCEX@kernel.org>
X-ClientProxiedBy: TYCP286CA0246.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:456::12) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CY8PR12MB7436:EE_
X-MS-Office365-Filtering-Correlation-Id: 69865c3f-01e5-47ed-9ac5-08ddeba3122f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|10070799003|1800799024|366016; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aXMvS0xLNFh4U1cxdVl0dnRwQi9yODdNVGMxSHMvdzg5NWF0Q00xa3RnSi8y?=
 =?utf-8?B?Tkx2Sk1CczJCTFVIeWlNTURid0U0SHd4QTB1N0t2dXk3V0tuemwzNWEzZEtw?=
 =?utf-8?B?K1ZGRnpFOFVPZjdlUk4xaXlXejMyT0U5VnA1Zm1jYWdDS3g2eGQ0NHlUNkwv?=
 =?utf-8?B?TUVYUlpkWUdvVlZhYjJvS29heUhPMG1MdlBzV1RYZ1JZOTVnaGw3eW01dnVB?=
 =?utf-8?B?TW1XS0VYQzJXVnJiUEJHNDE3bENwU1hReklSL0NyMjRmd3NEQ0licFU0UUpB?=
 =?utf-8?B?TXlyOU5CSGJXdW93YXV5WDVoUDQ3UVBrWktMS29qVGVoUFlkbHNicUp5M0Iy?=
 =?utf-8?B?YStLc3ViWURjanNOUTlBbllZcW54NkxaNWZXclNIeWxKWEp0RkhnNjRKRTht?=
 =?utf-8?B?TDU1WFltTzJ1dXg2Y1pjRlFkMi9hNlpQQlQyaDdBSTZPUXpuWDRyVEJlUkxK?=
 =?utf-8?B?enBaTktpWGY3MFlXTm5pRlJMalNjNHNSVTZxQ0VVY2Z5U3pTV0UzNnB3RmVE?=
 =?utf-8?B?dFZRejA2Y2VnOVRvTGFjL3J3UU00T0JwRDBxOWJPbHl2ZnB1SHphc3ZEWit2?=
 =?utf-8?B?TVk4T01nZUp3TUVpOVAwdXZXYnhjNFR6cFBycUppOTVweEh6Z3YvbkhKTDlR?=
 =?utf-8?B?M2ZLdkpNR3daNTk2My9ucm8xam9VUzRESlI0M0JBYmZFZGEzMitzWUwwRXdn?=
 =?utf-8?B?ck1SbjRrSHFvVlhMcC9hMjdBK3pWblVtMytZOUxCMVBQOXB4MG5RTVY5bXoy?=
 =?utf-8?B?R2hJOWtjS0JDamtKTHNUanZ1VkU3a0ZRcHZzK2NwT0xBNWozYXBGczhPTDlD?=
 =?utf-8?B?L2NDa2gzdDMyc21kMHZRN1VaNUN2d05FTklmaktra1UvYndpbXU4ekkzNDl3?=
 =?utf-8?B?RjFzdGdMeXBkUTJpWUJOajZiNXpWM21MZTdYZGlEdVlRQkp1VlpMM3pIZitG?=
 =?utf-8?B?U3FrZXFzQzBrZXp0aDl4REkyTmQ3MTEwMVZWcnhnTWxDWVdKdXo0YW9hWDFw?=
 =?utf-8?B?N05WWHpCSkdaTHFwZ2l0TVM5UXZlMEpSM3hwcjhRbkd1Q0FESmM1Z21YR2w2?=
 =?utf-8?B?TVY5L0RIMzQ5UjE5Z3Z0Z29RVi9sVlNQMFA5NFliaHdCQVBoK0xzNW1Qellv?=
 =?utf-8?B?bk9kd042V2Mxam9XVkhISlVDNWN6bkV1VzBvTndGeUlPTEJTbXpZR2l5dVpY?=
 =?utf-8?B?WHB6Rzg0MlVUUXdGSjZMRUloY0RkNUo3V0F0TGkxeDBYTkFXQXJmdVNPdWZ5?=
 =?utf-8?B?T3pDYWlIVUhJd2xDSlh3dXNTNkpGZVo2R3doK2h2MnF1TkpXa3ZrZURxVGtx?=
 =?utf-8?B?OEJzUlFpcFRLNlUzUDdPUkphUGJSMjVTcjVOSW5Vb1VTWnhTUjB6MVdTeGg2?=
 =?utf-8?B?U0xla0hUZHEwTWhLODl5QTMySkRSemNFNWZiTXZlUktrYnAyT25RUHdONlZ2?=
 =?utf-8?B?bTcyUU5pTU9CNUo5SnBVZmhTMUwzZlJTYUs3U1h2aHljYzV5SFgxbGJQMU1x?=
 =?utf-8?B?SU9LZHpUK2psMFRWNTZZUm5TTUNkNE95UUxFeVpTRUpNZTlEcjB2UWNuSVZI?=
 =?utf-8?B?UEFqM3ZjU29xc1BRZ1Y3TC9RYURzTnFKRnpqeU1ROVdaTVlFS1U4aUVGRzVG?=
 =?utf-8?B?ZVRBK1IyOHhvanUwT0pScWR2MGtzZStnOW1mdld4T2d4VWd1WEdKMy9XL2FN?=
 =?utf-8?B?NGQ0U3dWVDFDVzR1Uko1V0RuMjNpeHJtNE5oTkxUWkhaUjZzMzRrczFIYVJK?=
 =?utf-8?B?VHhvWURWVUZWbkFrdTFpTkNkSVlRTnNGWTJUTGFDSWhwUXhlNElIeFM0YmM4?=
 =?utf-8?B?NzFOZGN5WHRVUENrcGc0RlRFeU1aVTdJb3lONTRTSHZtSlJMeFdSSHNhbjNz?=
 =?utf-8?B?dXpqTW5MUlozT0xhY2tqbkFWYmxmYmtUbVpBMHlmOFdKRWhlUXhNNFp6L3pt?=
 =?utf-8?Q?YGyYrfs2xhc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(10070799003)(1800799024)(366016); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VTVMaDNEd3hGTU1TWktTcC9lZDBUN0FmTkRaa093K3NZTjBsS3h6U2dEMG5N?=
 =?utf-8?B?eStaL0dzMzBpVm9JSEFYQkRabjFMK3pVT0l4WkUwMThpeDUyUXEvcUhLZWNQ?=
 =?utf-8?B?NHFneXNrNVluamw5K2FMTHA1WFdrUXRtaDNmVWVyOWd3RjFuYS9MQzQyZjRX?=
 =?utf-8?B?YUNWNzdHYWIwSG9wdDFSRXNzRXJvandWYjlPdFJSTnhId3ArVDV3bTFpdUE4?=
 =?utf-8?B?UVRlSmNSYVBVSGxHQzRPWUh2MHB4MFQvdWJldG1aU1EzbXVBdWZ2TGFZK0R1?=
 =?utf-8?B?S0lOWnkvU3Q4RUIwUFBUL3Y4M1RzeTFrYWtxODdqT2kvZTh1ZkhEZ2Z6dHpo?=
 =?utf-8?B?c295eC9oRlZKL1BWQzlrNTZJNW4wdHRhZFBKc0pJL0t5cjVxUkgyd1NIOWlw?=
 =?utf-8?B?TWJzSkJ0ZzZDelpYT3VuUnR0SE1PU1FWenJ5NmpyckpXVWl1dFRRaW1uSlp3?=
 =?utf-8?B?U25sWTc0MGVEdFNwLytIZkFUNWpYS2ZWUEdIM09tQWMrci9LOE5RYlhTclFv?=
 =?utf-8?B?bTQ3bnJ5OHBvbktHditQU24xZThMb3BKN3I1RDdqNnhENy9UcWd5R3hHeWR0?=
 =?utf-8?B?b1lGbEZBWnF6MWpKYSsxTTZ3a3hWN2FxbVVwRkVwc3pLMEZadTdxbGFxWTBk?=
 =?utf-8?B?VjIvTU9WWDJ0K3F0WHNyNjErL21qdmNlVFhJSG5IOUlTUmFkR1gvTTJyZ09R?=
 =?utf-8?B?ckhyakhZemNCZFNrS3AzN3kzZGVtQ0RSd2h6OW4wUjFhWWFuaDFKNk9FcjFr?=
 =?utf-8?B?WEdHRUExRStqc0JSUUhERFlNYVhVWmNPTk1JM1ZQclV2dTFTTUxJemV3QWwv?=
 =?utf-8?B?RTM2djgyaWR2dktHNzRiekxITExnZWR4dGtFNGllTWxHajRQTkNNZzJZR2tV?=
 =?utf-8?B?dVNGT2lOMDhDV1lCMEV6cWUydE51N3o0dFQrODE1MzhLa2hWWFlaZFZ1aEpV?=
 =?utf-8?B?SDd1NDViTFFoai95M3c2SVBBYmdsc1lIaVlGb3hhOU1KQ3RRV3lmTW40aEN4?=
 =?utf-8?B?cVUxamt2em9RYS9qOUxIZzhUSmxDajEyTjdYanNLcE91UDEzeFlaRUNsOU9R?=
 =?utf-8?B?UG05cjdKN040d2JWV25qSkFRNVplL29UaUIwamhWdGx2QWJPMUJtLzhML3lL?=
 =?utf-8?B?aC82VWdBVjM3RXYyeTY2NFlNa2RWTzc2bUs4SlZCL2dGMEd5UHpJdnRNdmJa?=
 =?utf-8?B?QklzbmVuZkhZRWVWQ29PcS9hSEg5ZWl1ekdXMjA2UERXZVlybFRHNnB2OWRv?=
 =?utf-8?B?dURIMUlhT0ZQK3h2dzA5ZDI4SkJpWjVzQllaNExHRnR6L2pySXlMblh1R0Jv?=
 =?utf-8?B?QnhIZnI0UUtZZTVGWjVVVGx3dHFibXMvSlUyMHNUWEdVekNYcXVXTzZ3RWg5?=
 =?utf-8?B?STNDWW5XaU95ZXhPS1ZzT1BGK3djanRaZUd4NE8rYnJBWmEyZEQ3R3ZpaStN?=
 =?utf-8?B?MXZTKzJqSXJBMURXMCt0b2RxTmc4NWZyQk0rMWprYkV2MW1FRG1BNzdCazkw?=
 =?utf-8?B?a1lMbHJMQk15ZjNMZ3BXdHovdmlYRU9zYXRkeUpQVnVYVVBoTDFQRzE4MlVL?=
 =?utf-8?B?VjRNd2FJc0hCbSt5ZS9tQUVwU3E5R2EzejB4NU1Bb3F2cWFNRWp0eEZsQkNJ?=
 =?utf-8?B?aTFmRWJvVytnYkFuQ3lrdXdaOUE2ZGd2cjFDcnpYVGRiYlE4VjA5ZGliUzU0?=
 =?utf-8?B?ZmRMUmI3alBraUtYcERlcEpEMU5leWhqWjBJWWdmWkNURWpzU092TWExNFo2?=
 =?utf-8?B?N3M0YmxDcVpPT205RCtzclM0QlVlY3hsbFRSWWR6NG1ibVFEdGovc3FyTncx?=
 =?utf-8?B?ZmN3UDVLWGZwdVpXNy8zdGFoMmV4K0k3dTVDSndjbktDdlBJZzEwODZhY0xV?=
 =?utf-8?B?b3VSdi9zRVF3cyt5QldEVjc3b1Z1Ynp2L29WN3oyTzFGRTVZcnpnVXduTmFt?=
 =?utf-8?B?ZUNDWjV4cVlJY0ZnL1N6ZnlwTmd4d1ZGcy82U3NaV1lUdGRsWC9vb3BvZThq?=
 =?utf-8?B?MlZvZXhQdzhmZU12QlIzYlBlWC8zc1FIRzBad3lZVkFjeEJXRnNyaXUrRnRw?=
 =?utf-8?B?THBpMm15am1IdFpQTDNIVHA4ME5YMUFGTzJUWENwUmRjVnFlWUJldFVCeWo3?=
 =?utf-8?B?UEs3N0FGL0ZNeFFRRVlFcXF4U2hUNm41RHQ2Ti9ld3UrZkNPZlFWSzFyWVlN?=
 =?utf-8?Q?HfNQGE3EKG/MLyOajdOeTnVBLlhEB5a1gd9M5HVf033K?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 69865c3f-01e5-47ed-9ac5-08ddeba3122f
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2025 11:06:17.7911 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NKIF7jXHEkNsxcCPLi18HYoKyTn0M9vfStZazgs9Vky1W/sqOfTD4k1VW/aZTPnnVnfpYA6dgA7PIk1bfqHxUg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7436
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

On Thu Sep 4, 2025 at 4:16 PM JST, Danilo Krummrich wrote:
> On Thu Sep 4, 2025 at 5:16 AM CEST, Alexandre Courbot wrote:
>> On Thu Sep 4, 2025 at 12:15 AM JST, Joel Fernandes wrote:
>> <snip>
>>>>> +use kernel::prelude::*;
>>>>> +
>>>>> +/// Macro for defining bitfield-packed structures in Rust.
>>>>> +/// The size of the underlying storage type is specified with #[repr=
(TYPE)].
>>>>> +///
>>>>> +/// # Example (just for illustration)
>>>>> +/// ```rust
>>>>> +/// bitstruct! {
>>>>> +///     #[repr(u64)]
>>>>> +///     pub struct PageTableEntry {
>>>>> +///         0:0       present     as bool,
>>>>> +///         1:1       writable    as bool,
>>>>> +///         11:9      available   as u8,
>>>>> +///         51:12     pfn         as u64,
>>>>> +///         62:52     available2  as u16,
>>>>> +///         63:63     nx          as bool,
>>>>=20
>>>> A note on syntax: for nova-core, we may want to use the `H:L` notation=
,
>>>> as this is what OpenRM uses, but in the larger kernel we might want to
>>>> use inclusive ranges (`L..=3DH`) as it will look more natural in Rust
>>>> code (and is the notation the `bits` module already uses).
>>>
>>> Perhaps future add-on enhancement to have both syntax? I'd like to init=
ially
>>> keep H:L and stabilize the code first, what do you think?
>>
>> Let's have the discussion with the other stakeholders (Daniel?). I think
>> in Nova we want to keep the `H:L` syntax, as it matches what the OpenRM
>> headers do (so Nova would have its own `register` macro that calls into
>> the common one, tweaking things as it needs). But in the kernel crate we
>> should use something intuitive for everyone.
>
> I don't care too much about whether it's gonna be H:L or L:H [1], but I d=
o care
> about being consistent throughout the kernel. Let's not start the practic=
e of
> twisting kernel APIs to NV_* specific APIs that differ from what people a=
re used
> to work with in the kernel.
>
> [1] If it's gonna be H:L, I think we should also list things in reverse o=
rder,
>     i.e.:
>
> 	pub struct PageTableEntry {
> 	    63:63     nx          as bool,
> 	    62:52     available2  as u16,
> 	    51:12     pfn         as u64,
> 	    11:9      available   as u8,
> 	    1:1       writable    as bool,
> 	    0:0       present     as bool,
> 	}
>
> This is also what would be my preferred style for the kernel in general.

Sorry for the confusion. The discussion was whether to keep using the
`H:L` syntax of the current macro, or use Rust's inclusive ranges syntax
(i.e. `L..=3DH`), as the `genmask_*` macros currently do.

