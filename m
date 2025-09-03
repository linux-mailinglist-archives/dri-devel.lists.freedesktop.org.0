Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2540EB41C24
	for <lists+dri-devel@lfdr.de>; Wed,  3 Sep 2025 12:45:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0423010E6DD;
	Wed,  3 Sep 2025 10:44:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="WWx2xrAI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2080.outbound.protection.outlook.com [40.107.101.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A66210E146;
 Wed,  3 Sep 2025 10:44:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SElZl6WV2ChD9CeIGWSqHF3NWgMBgK3SRxHXJhL5J5fP7wvD1LJ/RB4remYDJE1nLLD2DzrTY7ado4dXkXlDcHpOgOY6Q/Bu6AxeZW7v2hrQX1QYKkbzedV3/al2K06iav1QPTPQ9ve5SLe7j6VZ9NKr+Mmp9ghVLsgz05IWkmNQ4yGlm6MkSG7esGqXrgdWyXW9PdaD/Jn6AIOCctwox24FJQSQH4G2zRELfGdOjq0M1ZsSbAAhcV7AnOkEIKoKHDdEpRLdsJfYErMyRman8crGCibyNEAX+uNeFERU8A6Ri8VZVh6NVMR5+NHtT0fYa/w6PHONFAaQytWHIrj8dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rz8aSvrv0pSb4VGQfQChLA1cH+zSHsR+1rB6hslfMxk=;
 b=Liiqb6yjaTmfMxxljYNEFTBmrp3nOXYcImYx5yDGDNccC7QU8lHoVxV0n5advnQGl5bqAiDhqXylm2V+P1bTItrCPQ9UBtETf1kiipnfIIDHxzIYmTFzRcEgRdnUcWrixC3CLsEHRmuRHaT1hLxAXkrxJyYpjQKZhMPQLKAkQiJlTykc51ro5pOMXWzJrOA7Bt04iz7lr4Dz24jGPwl+amnXMb/nguQ6TyuHxkfJDlhT9f4XQ8LwOK61mLGZIchaMcKdBfOIcMowQuzru5eUUXDgN/4IBVkvh9xyWT38yTqehYsdvMfAMhB54fC6I+XafiCYFTS+R2BbIQvjVWx1Ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rz8aSvrv0pSb4VGQfQChLA1cH+zSHsR+1rB6hslfMxk=;
 b=WWx2xrAI9rwQ4+kWb/sgVzrb2kJhuZQVCOHnrbh8KTbkZrnFwEguzlxViW/1w3j3L3zD5nORE/rzw9Spzd4V6BSuXMNiLKEyH4eFQ4lKcxbBcXGtKhXHLlM8gknT3p5PLM7mEYy/t9qZMw+VvQdUzjULaFO4l82p/jAQBVVf5gKasNa/b7UCs38P268yWxgibpDIPky+Tjf5c5XjjmhJyGE4dqrLprw1AnISe1Vrej0UerAeIU9Baxvf8xib3X0ShSxH1IB78mYjjQRvCoJfi8+hY5f2g17t+SpceZ+ei/GY/pY5H73Ae8YBAFNUL30XoroVAsG052OvPN/wIeGwkg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DM6PR12MB4201.namprd12.prod.outlook.com (2603:10b6:5:216::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.17; Wed, 3 Sep
 2025 10:44:52 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%3]) with mapi id 15.20.9052.027; Wed, 3 Sep 2025
 10:44:52 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 03 Sep 2025 19:44:49 +0900
Message-Id: <DCJ3R8YQUYK1.3K5BCWHMAEOL7@nvidia.com>
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
To: "Danilo Krummrich" <dakr@kernel.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250902-nova_firmware-v3-0-56854d9c5398@nvidia.com>
 <20250902-nova_firmware-v3-2-56854d9c5398@nvidia.com>
 <DCIKSL18GE9A.2R4BAGR56YVPF@kernel.org>
 <DCIZ5VVLACXO.1L0QTYM5YVRQV@nvidia.com>
 <DCJ0T81CZQ88.6IK6LG0E0R02@kernel.org>
In-Reply-To: <DCJ0T81CZQ88.6IK6LG0E0R02@kernel.org>
X-ClientProxiedBy: TYCP286CA0002.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:26c::6) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DM6PR12MB4201:EE_
X-MS-Office365-Filtering-Correlation-Id: a4c1de73-211b-4847-83a9-08ddead6e9aa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|10070799003; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZWV2ekpUb2hSZkQya3NvdjVKbWY5SmN4QzVIYzUrRGdHb3hsUmdrbUJKRjFV?=
 =?utf-8?B?ZFl5c0tCbDEvTnZSMEg2eXRZL1M5QzRpMjhBVDRHU3l0YlROTSsyaFZ0QkVs?=
 =?utf-8?B?Q0xQcUdJR3lCN2hSb1lMRHhmd3NpLzR0QkZaeGVEK3pLU0hOSHFrV3BwZnhy?=
 =?utf-8?B?U2tLNG12amkxUVF2Zm9mSFovK2lEc0RpcndQb2s5S2c2ZDd3cmZ6a1NEZXc2?=
 =?utf-8?B?N2ZUeTdiRmQ3U2RYUlV4aEJvdnEvRnlXRllsYXlIRFVwRWJLd3NjSlhkVlFm?=
 =?utf-8?B?V2xDMEdNVldwYkdxK2szR2hhWjBLWHd2SUdrb0NNTmpacDdEUDVwenVSRU9w?=
 =?utf-8?B?a0Y0L055bDk5aDl1NklkMHk2Y25LeHpra0pqcGowb0szcmo2OG1JZ1BmeEJ1?=
 =?utf-8?B?andobk02ZWJOTG52OXl5Q3lzeXRFa3JDYitXODlFTmtCeS9oY3JSejhYRjdM?=
 =?utf-8?B?Umh0eGp6NjlzUzU2R05ZMDNVSGFwOGxKZnYrbzViZ0pHVzZIRE92V05NM2lF?=
 =?utf-8?B?YldTdmZlNUVGTjg5K2IrbDFOZ0pCa1hIUERMT0FqclV2WmNGWUtmZDBabEtE?=
 =?utf-8?B?ZGFQMGxzK2lpUkNMdXlTSlk4STVSdlpOUVFubjl0SFkvYkc0UlpqVVIzV0g5?=
 =?utf-8?B?OHNESEZhK2U4MFVlNStSTGRiREpHL3hFSVRHaWx3REMwNnF6TGdZRTFGdW9R?=
 =?utf-8?B?QWpJUEJjMldDLzBnMjd1dmk5eDJpcFBFZzFpSzhqcHlLc1pkWW9SMkJYTXkz?=
 =?utf-8?B?Yk1vNEZjNWp2dE5SS0hvb0s4Q29mSHRET2FyczV2MGRKOXArelhVQ2UvaU1m?=
 =?utf-8?B?a0dzWWRKa2JJcFRUYmF1RVVOQTJiWTRScnVZYVRrQ1dYYkZUYXJqNmlLRTFs?=
 =?utf-8?B?aVd0UjljTHJNYk1abTBQWG1RR3Y5b2dpU3VTMmJGZ1ZSMjVJZHg4cjJEc0dy?=
 =?utf-8?B?dkRJK1NmNGRvWVdEY3RMRitRdWd1bUhyZENFQjNGSXU0SVJkUEkvNlZpRlVB?=
 =?utf-8?B?UjNMQS9YZVhaNDYvcjRZbHB6UTJSNnBPRGhheTZrRHhGYnhPRVQySmI5WEcz?=
 =?utf-8?B?blp1TkJoT0F0QWo3T2VVTEJIeDhSajFaWUtmeDhrTTB6N2RQQXdqVEQ5ZjBK?=
 =?utf-8?B?UG1OUkxtQVpidS9wUVhyS2hmTEphNElvZnNaZ2x5TURiTEZPZC83d1pwaGN2?=
 =?utf-8?B?cnh4OXdwTmZUK1MxVm1EaHBTQ1dUN05Sb2czbWRtS1dBU1FPOGZ0WVh2c3Ru?=
 =?utf-8?B?OUxpckl4TDUvK1pmQUNUeGtxYWpPS3lROGxueURJSlZmUUNMczJPQTNTWmVN?=
 =?utf-8?B?M0lieDE0cUtlSHhLTkJFaFh2aW1vRVM3VVhtT01TZElaU1lpYmpRNU1YalZN?=
 =?utf-8?B?NHkyUXVIZEFsZ0F2OTROTVlGSDRzWkkvaGQ2NXFkYzZZcE51c2JtdnI4cVIv?=
 =?utf-8?B?Mk80SEp2MEdZRHlwNTl4K1cvMTZQZjdZVEZpNFJ5VWNiVGNPaDk1RnQvQm5C?=
 =?utf-8?B?YThXQkFabC9YQnFYRVJYem1TaGxyZHUwMEd0OU9uZ2xBVTZ5RFVoZTNwUngv?=
 =?utf-8?B?TlN4dVpNakp1Q2ZleXVEazBtSENoNUlJVVBvVXd3cmMxbjhxajEzT3dOWCtS?=
 =?utf-8?B?N0VUS0lkUnZ5OEFQVUl5QzR5ZXdIS25zeEdHc1R3VjBGQldDNE0rK2h0S0dV?=
 =?utf-8?B?MTNqSHNISDVmekxHMHlHa3RBbVkzOHhQWjMyQXNLQi9kajdHdUtqSnR0TDZj?=
 =?utf-8?B?Y3RoWU9LQWdFbkY0QmM2U1V1b2d4MXNRUVBKck5WeG9POExPaWJsWGFOeFNs?=
 =?utf-8?B?NjF6M0xxSEcxWExGc3dEbDB2cmhkVTJiQ1JhZFFrKytnNVc2M3NpOHZkVU1L?=
 =?utf-8?B?eGlBZWxJRWdUTk1ZZGdGNE5INUdWK2daQVZvMGZIK3ZvalV0UUxoT3huOUN4?=
 =?utf-8?Q?/YGRhCD6sso=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(10070799003); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bDhQTGM0R1JGUGZ6bXVmVERUZEZJN2QvWGlNMUtjT2h0SmRIQTZFenhNRVJE?=
 =?utf-8?B?YXd5aWoyL1lURXAvTEw2RURXRWZhTTZkbzFhNHdkUmVhSDF2S3o4L0VtUEVR?=
 =?utf-8?B?ZklOb1RQU2RMcE9uV04xYm9Qa1pyc3lCYnl5SlJXb3NGNTFzVEVrTGlwL204?=
 =?utf-8?B?UlpZNmIreDRVVGZXSERsS1hUTU84Q0NDSFA2dmE1NXV0c2JENkhNM09kWXVP?=
 =?utf-8?B?cFBzdXlIYUdoVlBnWlRFS3RuNXcyc2Q1ZndjUmRFZHV5VUp5VlIra3ZDUmJV?=
 =?utf-8?B?aHBuamhDalFvRU5HR2FPWUw5VVJycHFKSXM1c292eDN0UGNmL2ZqQVRmdzB3?=
 =?utf-8?B?aDFMQUJObTAxWE1NVzlDVldQcjhmQnJ5cVEzb1RxL1lsR2NSZHF2L01SaEFr?=
 =?utf-8?B?eFFsTElIVXljWXovTmI0T3ZodTZhV0llYngvN3VmV1lGRmYzUlBQeUJwZHpL?=
 =?utf-8?B?TElXV0FKNlNXTHh3T1AyTHNWZUZvbk5WN1M0SzB0YWsrSkRGY3JYdWVHZ25n?=
 =?utf-8?B?UE5YVGx2cFBhT0NLVHE5VGV6Y2pRNkdHRlVkWFFUZy91Ym15MXRNTDJ5YjRl?=
 =?utf-8?B?Zk1KL29GNjd5UHJORGRoSUVTUnBHUEJRSXV0S0xwR3ZKamRYTHQ1TlhEU1Rv?=
 =?utf-8?B?Z3UwQW11Uml6c2tDQ2VsdFp4YTVDVFYrVEREZHFMZzU2UUFsYVRyYUsydzBq?=
 =?utf-8?B?OFU1a0dBSHF2UFE5ZGNnYnhTa0RtYlFlVm1pTTBNcXd6RG4xYmphVmtXZUV6?=
 =?utf-8?B?SFVNZ2RvMEx0Skd2UUhTeHljbUp5Y1Bxa0hKYzJCWFhtb2ZaZTBUanJyRU8z?=
 =?utf-8?B?Wnd1ZmMvM2R5QmNBQUpvUTFGT1lsNFpocWpiN2tPRjF6dks4eE1VWG5CbHFt?=
 =?utf-8?B?cHQvazlBaU1HVEV0Y2dJN2h1ZUpJenM4WTVBQTFqdzBqM2FBM05haVhUeE9Y?=
 =?utf-8?B?YTc4ZnZBeVVmRU1DcFdhNlRKeldPVjh3TDdOejhwZXowRGhFcy9GMEIzS1Jl?=
 =?utf-8?B?ZE1YMTYvOWdDdG9MSSt3UWlxSE1oRTNGZWh5cmJYd1UxVE5hM2ZINmJJMGxh?=
 =?utf-8?B?eGczaGplS1VteVk3Q2x2Q0RMWE1TVjh1OTNLUHp3amd5Nm83ZDhjc2M4YTU5?=
 =?utf-8?B?YjV6THBIYlVPOUhKM1hzazZsUXNNbkJzMFR3ZjRRMVU2Slo5VWk1dXdaY2pi?=
 =?utf-8?B?S2QxWEl5TUt0SkNFeU1iSmZ5NTlncEtYZXBPR2kvb0tFbFN6L0ZLa3dKNHRQ?=
 =?utf-8?B?NExsQWxuSGR4WG5OMURpcnJqaE9DTjdjdkY2VDdMczM5YVZHUlJLL0ZKbTVQ?=
 =?utf-8?B?NjNNNm5lZkxSWFJjTWhkWVpKaGxRakFQR0tHRGxPdFVUeG00dzNpQ3JKVmJ1?=
 =?utf-8?B?WVZJZzZtYTA5Q0NNb0E0RnNVTTdBWmJhZHhNSzlPWm9WQjgxSm1Ncy9BaXhP?=
 =?utf-8?B?UEVlYnQzeGFwVXJaa01LSkM2VFp1dWx4TlQreW9naXdhM05tcldCQ1N3QmtB?=
 =?utf-8?B?YnJtdGQ5SkVsQU1abzlaTDRYU1ZYSWNWR2dzcUFKZzhwd0NXYVdSU05NU1Nu?=
 =?utf-8?B?SXNOVjdQWlJFZi92TWNVa0Y2WFhxYTFYY2pDQk1KbGwzd0xtbGxSeXNWUi9u?=
 =?utf-8?B?Unlha3JsR2lpeHBnTXBCWmhSU3I2QWV5TW10VVd4VjlFQzdlRWZwSmtDelQz?=
 =?utf-8?B?YTlSWDU4TVo0TDQ5ZGRJWFEzMmJiNTZlSitZbkk1TjVzMzZMUm5IQm9hZGhu?=
 =?utf-8?B?b3dONjJTaUJFbHlxaUV3RnczR2FMMXhzdHo3OFB4MEp2VGxhZlN5RkdTdDIr?=
 =?utf-8?B?SnArNWYzUWt1TUhEcEFkTUVHMHF4VkpXMGQyY0ZmejR6Q3BmVW9Cd1ZSeE0x?=
 =?utf-8?B?R1NmMmJKYjU0OTJPYm1tbjJiTjgrakdXTGNpeDN5b0JZMXltcWtQWU92R0ho?=
 =?utf-8?B?MkJjUzhaT0g0NjBaMlhnZy9yTnZZNW5pVU9mdUNtWkJJelg1SDBLdVNteUl0?=
 =?utf-8?B?Y2JUSVF1MVBQM3dsWVhOVm5Xb2JScCtmQXdkL0gwQlluTHJjOGtaRDJIRHRZ?=
 =?utf-8?B?eE5FLzZNSTV2NzNZaE5JZEx4K0tyQklNZ2V4YWhPT0QxczQraUxzUEx2V3k2?=
 =?utf-8?B?VkF4VjJ4WFhQT09jY3hOK2dsN0hRL1VMUGwzdlk5UUwzek03dDlURndwM29z?=
 =?utf-8?Q?whzI0aJmEnCiW0/4g+Jj6Fkwwao7e6S8sFvzvkxJK/lf?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a4c1de73-211b-4847-83a9-08ddead6e9aa
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2025 10:44:52.2939 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kwpX4GFoOdgeiCkqvi4vvlo0QzJei4rHJ32GySbWK+os3PJthYWnCx1BqYgez65CG97+z77AyAZOd9HuP+sfIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4201
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

On Wed Sep 3, 2025 at 5:26 PM JST, Danilo Krummrich wrote:
> On Wed Sep 3, 2025 at 9:08 AM CEST, Alexandre Courbot wrote:
>> On Wed Sep 3, 2025 at 4:53 AM JST, Danilo Krummrich wrote:
>>> On Tue Sep 2, 2025 at 4:31 PM CEST, Alexandre Courbot wrote:
>>>> diff --git a/drivers/gpu/nova-core/driver.rs b/drivers/gpu/nova-core/d=
river.rs
>>>> index 274989ea1fb4a5e3e6678a08920ddc76d2809ab2..1062014c0a488e959379f0=
09c2e8029ffaa1e2f8 100644
>>>> --- a/drivers/gpu/nova-core/driver.rs
>>>> +++ b/drivers/gpu/nova-core/driver.rs
>>>> @@ -6,6 +6,8 @@
>>>> =20
>>>>  #[pin_data]
>>>>  pub(crate) struct NovaCore {
>>>> +    // Placeholder for the real `Gsp` object once it is built.
>>>> +    pub(crate) gsp: (),
>>>>      #[pin]
>>>>      pub(crate) gpu: Gpu,
>>>>      _reg: auxiliary::Registration,
>>>> @@ -40,8 +42,14 @@ fn probe(pdev: &pci::Device<Core>, _info: &Self::Id=
Info) -> Result<Pin<KBox<Self
>>>>          )?;
>>>> =20
>>>>          let this =3D KBox::pin_init(
>>>> -            try_pin_init!(Self {
>>>> +            try_pin_init!(&this in Self {
>>>>                  gpu <- Gpu::new(pdev, bar)?,
>>>> +                gsp <- {
>>>> +                    // SAFETY: `this.gpu` is initialized to a valid v=
alue.
>>>> +                    let gpu =3D unsafe { &(*this.as_ptr()).gpu };
>>>> +
>>>> +                    gpu.start_gsp(pdev)?
>>>> +                },
>>>
>>> Please use pin_chain() [1] for this.
>>
>> Sorry, but I couldn't figure out how I can use pin_chain here (and
>> couldn't find any relevant example in the kernel code either). Can you
>> elaborate a bit?
>
> I thought of just doing the following, which I think should be equivalent=
 (diff
> against current nova-next).
>
> diff --git a/drivers/gpu/nova-core/driver.rs b/drivers/gpu/nova-core/driv=
er.rs
> index 274989ea1fb4..6d62867f7503 100644
> --- a/drivers/gpu/nova-core/driver.rs
> +++ b/drivers/gpu/nova-core/driver.rs
> @@ -41,7 +41,9 @@ fn probe(pdev: &pci::Device<Core>, _info: &Self::IdInfo=
) -> Result<Pin<KBox<Self
>
>          let this =3D KBox::pin_init(
>              try_pin_init!(Self {
> -                gpu <- Gpu::new(pdev, bar)?,
> +                gpu <- Gpu::new(pdev, bar)?.pin_chain(|gpu| {
> +                    gpu.start_gsp(pdev)
> +                }),
>                  _reg: auxiliary::Registration::new(
>                      pdev.as_ref(),
>                      c_str!("nova-drm"),
> diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
> index 8caecaf7dfb4..211bc1a5a5b3 100644
> --- a/drivers/gpu/nova-core/gpu.rs
> +++ b/drivers/gpu/nova-core/gpu.rs
> @@ -266,7 +266,7 @@ fn run_fwsec_frts(
>      pub(crate) fn new(
>          pdev: &pci::Device<device::Bound>,
>          devres_bar: Arc<Devres<Bar0>>,
> -    ) -> Result<impl PinInit<Self>> {
> +    ) -> Result<impl PinInit<Self, Error>> {
>          let bar =3D devres_bar.access(pdev.as_ref())?;
>          let spec =3D Spec::new(bar)?;
>          let fw =3D Firmware::new(pdev.as_ref(), spec.chipset, FIRMWARE_V=
ERSION)?;
> @@ -302,11 +302,16 @@ pub(crate) fn new(
>
>          Self::run_fwsec_frts(pdev.as_ref(), &gsp_falcon, bar, &bios, &fb=
_layout)?;
>
> -        Ok(pin_init!(Self {
> +        Ok(try_pin_init!(Self {
>              spec,
>              bar: devres_bar,
>              fw,
>              sysmem_flush,
>          }))
>      }
> +
> +    pub(crate) fn start_gsp(&self, _pdev: &pci::Device<device::Core>) ->=
 Result {
> +        // noop
> +        Ok(())
> +    }
>  }
>
> But maybe it doesn't capture your intend?

The issue is that `start_gsp` returns a value (currently a placeholder
`()`, but it will change into a real type) that needs to be stored into
the newly-introduced `gsp` member of `NovaCore`. I could not figure how
how `pin_chain` could help with this (and this is the same problem for
the other `unsafe` statements in `firmware/gsp.rs`).

It is a common pattern when initializing a pinned object, so I agree it
would be nice support this without unsafe code.

