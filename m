Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 846A5C17488
	for <lists+dri-devel@lfdr.de>; Wed, 29 Oct 2025 00:12:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D77E10E6A7;
	Tue, 28 Oct 2025 23:12:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="jMrLXKz4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazon11012045.outbound.protection.outlook.com [52.101.53.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EE4610E6A7;
 Tue, 28 Oct 2025 23:12:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qMSeFIvTbeYP4eIxnjiFVLgzd57do0ymVytlXT2I402ZHKQpJL3XllTq5FRrV1iTtVgAkSMQmyGGQ5DUGn74QDvL5ScynOVRmuS5jxqKsTaNO/ioUZ2+yK3EhUVGSvCgVOiVSinCFWKixgs4G4FhQH7lMxBWkwYDLm3V1ETDrlOe8YFpaNkAv+HrFjXn5IuMSO4dSTM/d8EvydyfU7FtPX0ly1/HNx3kg/7RCuvpoYcOOUOu2UtNWIq4pVvA+R3JukO7QpGFEaStufhr41iggmFmgkJ6Iohm7QC9cP/jbYG2qhkkqmDN1LQ9hS8SKBKpiIXydnZ4zEqoHYEVMm7o+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rjqFs444tv3AYVJw7werj3Jkg4M0YLjBvmfrVFIwAnc=;
 b=Wy7hKO4podn+e2a3491wkrRPRYnLHlZTkbE8J7W7U0eIY6cLPY4Qb8ZVKturM0L0l//rUnD21ndO2N0s4VpkFjooCLEaNkt/QSZCkWl0fsL66bW3A0pKOBjRqixD/xh+yt/RkO9IZgQQBhUBL7ssZZGpP4K2sJ/kIPpjCMRyZJSJThFA9BgXpnvzgJxjXGh7aKhqLOBjIuaSrIZB73+FQxj+WBXOVZw2l06p9qWecEZereTz3wjbWUt2SygYGPmARtJcy9ggIz5M6rnpvmL5Hdh8rB921GNPtomtNsvDapuyTSsj3QByxffmokWNvlyzL93WB0QoSS0oplPQVX08Kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rjqFs444tv3AYVJw7werj3Jkg4M0YLjBvmfrVFIwAnc=;
 b=jMrLXKz48OetOqmnlyBcB/Un6BOxnhfAxTsCVMby+1Y9QYae0Hkx3pmIWl4IHZQpkv2IBEJe722T+Fz6aAWRe8XWKbv4FpGpgdeI1i96zFTllqV3tyVpgb2b6ZpzxVpihGLuBUBkYAi6zLql2S9KV3ajDoZwTLytYCi/ipGhrHDKIfw4+bj6zMAD2EwaTkJoF4a+UXdhQMyuzjWM4zvAwNY4CVSOKxcxV7MoVfLzzZs8zGU1Pbsn8tQ2pCfEJq/gS/CjXNttFBvF/cImER9u+hfDxcv6+17fze7cJdoVifUbOezxmlWwKcscBiQuKT8C6qglYfwPjqPPjl4xLAMSCA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CH1PR12MB9646.namprd12.prod.outlook.com (2603:10b6:610:2af::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.15; Tue, 28 Oct
 2025 23:12:24 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9253.017; Tue, 28 Oct 2025
 23:12:24 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Wed, 29 Oct 2025 08:12:11 +0900
Subject: [PATCH v3 3/6] gpu: nova-core: use `try_from` instead of `as` for
 u32 conversions
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251029-nova-as-v3-3-6a30c7333ad9@nvidia.com>
References: <20251029-nova-as-v3-0-6a30c7333ad9@nvidia.com>
In-Reply-To: <20251029-nova-as-v3-0-6a30c7333ad9@nvidia.com>
To: Alice Ryhl <aliceryhl@google.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Trevor Gross <tmgross@umich.edu>
Cc: John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Edwin Peer <epeer@nvidia.com>, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, Danilo Krummrich <dakr@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TYCP286CA0333.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:38e::19) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CH1PR12MB9646:EE_
X-MS-Office365-Filtering-Correlation-Id: ddc8a8cd-5961-48ca-a905-08de16777487
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|7416014|376014|10070799003|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SmJzeVlmUVhGR2FFL1BreUhRdk1CeVlSWStqejVOa21QWmJ5MzZqWloyUTBW?=
 =?utf-8?B?cWwrbUZENXMwUXF0ZXhaQ1NSb0pYcXJUNmY5TXp2Zzk2MkRqQzNWbVpVMU41?=
 =?utf-8?B?anJYWU5qMFlkWEQ1dHp2TWViRzhrSzBXemlCVnRXN2Y0cmlyTWNScFJwUzRB?=
 =?utf-8?B?V0pWQnFSOHpBWk9uMDJoR2l4bmR5aW9wTGMzTVRVTFRGYnJvQ241dzJIQitG?=
 =?utf-8?B?eHVTQVhkWXR0bFVGeCtNWHNlbURDMlgzZGpBSEhvN2R3OWEyQU9MUUViQzJv?=
 =?utf-8?B?MUd1d0E3cXBSSktaOGV6N2Z6VS9sS0RXK2tQc09qWXFXV2xpcm03a2k1ZWdY?=
 =?utf-8?B?c3BGVDBVWDh3YkFGSVJmdk1tblhzd2R5TVIrSWs5dWFRK1ZacEk3UlFIM1Nk?=
 =?utf-8?B?NVFjTjB2V28vZXYvMnBtK3k5TUY3WnJMSVVJMGtYM25jekhvUFRlSFd0cEgw?=
 =?utf-8?B?RzE1SERPb0VNdFhZSFVFcDNyMGkwNVlWWjJZTE9rUFpJa0V1QkpJdmtFd2h3?=
 =?utf-8?B?MjNXeDIyNkU1NEt0S0czUytoSUZFcUtPb3ZRcnJLT3Fud1FSbnI5WnduUUNR?=
 =?utf-8?B?ZG5WWUNCTWN6UEI2Q0hiZW42WnpNSU9Ca1paNy9zL0lPanZyQW0rY3FmaStB?=
 =?utf-8?B?UDlnSjF4OVg1SFB4T2tLU0JVVzNWc0NMUXlsNkNRUTdhYks0M1doZzB4bW43?=
 =?utf-8?B?dTV5ZzdLU0dQWnVpbUdza0UwcWhKUlEzZm1aSjlXY1NJRzUxTnpMcDBXYTM1?=
 =?utf-8?B?NzNuQkR6TGlMSGxGK3ZoWjYzeTZiVm5HeXJnZzh4OHkxOENnTjg0QVcxbFFC?=
 =?utf-8?B?RHpCc3pvdU9PWnRoREY2QzVvWmpOWXR5V2tNbE81U3VKWTlBY3JOeUhOMnVS?=
 =?utf-8?B?aDhtMURJYVNkU29oUkJMQ3pWc2Y0OGx0MUprUVRmM3dZUUNhWU1GdE10NWdP?=
 =?utf-8?B?ckNlU1VxVkM1UmJLQS9remQxVEtWSFF6MkxvaHJMOCtWOU1rRlphUnVRVXBj?=
 =?utf-8?B?TGJNV2cybFlTMXNNVDhuRzZYSXc2NktmdDYyRjRob3lRTFlteTJSOGFmbnVB?=
 =?utf-8?B?em5ib1JCVnpzQWVPTEJzdjN6aXQ0ZTMwTFRzREZ5elZubkdBQ1ZKc2IxUktW?=
 =?utf-8?B?VjlEQmNjWFA3RVB5V1hOckxmTkxUUWFudWZCVHZVR2xiMVBQaTk4b3NadFAx?=
 =?utf-8?B?Q3hkQ3pLMVlPbENtcDlnRDVZSDZmNVM3cVh1ZG9kRGg0SjNsRzVadkVnYjdl?=
 =?utf-8?B?WGJwd2hkdlg4dFFrNjJDaW9kTm41R25jVW02Z3lySnJyNytBWVhxaXpidy9t?=
 =?utf-8?B?ZG1lT3BFUCtwc01lcFJGM1JseFU1T0dSTDJZdmVJSTJneUZBc1dRcGNma0Mw?=
 =?utf-8?B?UmxNNm5zaDhMc1RRQkUxQXBWaDZBNkZQU2lZNW5XeUl4cGsrcWNacXM4cmcz?=
 =?utf-8?B?eVFKN1hPSmFScnRQRGFpVGwrQ25CNEhSNGNwWWhzbUJVbkhZYTdubjVXeWF0?=
 =?utf-8?B?Zjl3NjdUVmEyNXliZjN1Uk5Dc3FwM09SU294U3BnZGtpMlF0K2JDSG16ampD?=
 =?utf-8?B?eERwUzY0a0pTVFdMK29ZYS8xNFRpaS8zV000WDRNTVhkTkozcUFTVmhwdkpr?=
 =?utf-8?B?RVJ6UHpxMklHVVZuV1hwbHFqY2NWNmtJWE9rVkpQb1lPUE8wK1dlYUtZOWFh?=
 =?utf-8?B?WE1rRU0zUDV0YWZOVS9na2d1Tit0dklwaGZOSFYrVUlCdDB5dThJNHBxNXVF?=
 =?utf-8?B?UjV6My9uTEhIa3hmQnRibHJIaXJINFdYb28rSjA4blprS2xWbGxhWDFsSG9r?=
 =?utf-8?B?RlArTi9NNlRKZndsVFdENVFnTGEybk9TZDl0cWJ3S0w4ODdyaVhIdk9XQmZJ?=
 =?utf-8?B?bVRhVEFoTFBIbmttMFBsZVdTUWlwdTU1MHcwTWwyMnFBODJ5bWl5Qm9CN2Vq?=
 =?utf-8?B?UG9JZ0JrNDBEbS9lWjBoU1I3MkxLWEYxdy83Q2w2Q3NHQmpEcnJieVN5Vlhn?=
 =?utf-8?Q?WXhpW4kfMgRxJfuvytL/+LdteKpI0w=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014)(10070799003)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L2hoY3pmM1dNaUZJRGxsL0hWeWRpZUtCVnYvSEFUU0ROdi92U2pMR3dQeis2?=
 =?utf-8?B?Q09waHhOM1h0TXFHNzZVcm9VZ1U2NkRaNmx6cWN1bFJjVm9iazViZjBKaTI1?=
 =?utf-8?B?aU9mL21jTkxxbE9qdnU5R252TFk5YzFtY05PR3lIWVBEUWYvbG9wck5pYlo5?=
 =?utf-8?B?Ync5bVpEbFBjL2hxUW4zcUFFeGVkejRzWFB5QUVkek54WnVuenNabUpsdjNR?=
 =?utf-8?B?RzJDblFhTVNJTDk3OWJwQnErRFR3RHdzQ2tkRGlnMktmdnJUVHYybXVuRE5z?=
 =?utf-8?B?UGY4LzZPTzN6SjFJMTZ6R2dSWm1ibkZxVFQvZ1JTU1dKQVQzUVdUNXpTVWxX?=
 =?utf-8?B?Tm00bjJJZDl6NjVnaTljUXp1SWxuQjdxS0pHaEloaHE4QnJkRVFENjNnVG4v?=
 =?utf-8?B?a0tGdFAvcXBlbzBOSnFEM1BnWHFuSHF2RDJxazFkQVFwVDFONE0ycUpUYXhv?=
 =?utf-8?B?YkFGTVpCNERhc2t3WHVBT2NBTmkzVklYc2JyVVNkWUE4RlpHRVIvRi8zMWpO?=
 =?utf-8?B?eGs5UXZ3Q3Nsb3A3R2lBSlRCekZwcmtFb253RnhqZ09EeDd3UUQzZjFHbXdk?=
 =?utf-8?B?TC9OQkUwM1doQVlwL0FRa2ZCMi9MaXhKQklvUjR1L0FtcUMyK2NNMlhZSDF6?=
 =?utf-8?B?UEl1SXV0SGI2Z1pCY0VHR21IRlBvZWhWT00yT2t0cmhKRTV6SERHdzNPMUdj?=
 =?utf-8?B?aXZKb2prYXJYQlJmME9xdVMwZXpqQ3U5Z1NrV3dyVDNXZXdXTUVNbVFLSEgz?=
 =?utf-8?B?UUxvdkQ0S0Y2SHQvaDhJNUhraCtQd3BEb1ZRQ0VYUlo1RzdEcGhkQmNERWRK?=
 =?utf-8?B?TkZ4cUdRV2R2TFNSTkxsS0JqSTc3RmF2T0NrcUZVN1lQQlVYTDVoRkwwbmo1?=
 =?utf-8?B?RWx3VlhHN05rZ1hYL0JIMXhrSUVEZDZWK3dXZ09RVjREVWpVWTRVOWYvWjhN?=
 =?utf-8?B?T3RrcDhHWW1DWjJqaHVyUjQxS3l2YzhTNGFibWxVNXVrbUZDNXlKKzAweUpR?=
 =?utf-8?B?V3hCc1FhOWg3K0pQQ2tGUEpSU0NjejJUWFlxdUdBVVl6azkvVy9YZlBXSHpn?=
 =?utf-8?B?R3l1a005M01FbEhKdXdTaTFodDQxTWVoUnRXUDdOdVN2VnNEU1VvVm1uTWtB?=
 =?utf-8?B?UUkvSUpsYUJlem0vdXZxU3A3a2tuL3VKSlhxa3RTMUNtR3NsaDRVSWhlejhO?=
 =?utf-8?B?cElmeVZVanJydXhuWEpMVjlhZTdQRU9uUUs3ODVoa1pnYkZwUUJGTG9pUEhh?=
 =?utf-8?B?UE54MjYzN1ZmaXd2cHlmeEplTlhlNUo1ZThIQWFQbEtGMWJpRTI0UFg3TVli?=
 =?utf-8?B?ZVF1RTA5ZzljZndEcjZVOHFwQlJGbzZUSjI0UEx2ckkycTh0RkNEOE5UZjQv?=
 =?utf-8?B?QUZEL1IrdVBiV3N2Smg5TS9JOWNjdk1tV2NDOHNzMkVBbzJzVWRIQ2JnSHhJ?=
 =?utf-8?B?RW1QQTdEdHkzNUNMZmkxVFBrR3I3K1o2OFJ0ak9KZFU5Z3EzWGNHOUhjOEkw?=
 =?utf-8?B?aWQvSTRzdkRZc0lzSlZhc08xaURwUCs2cXFrTTdNRHdnVkt6eE9ORENhYjIz?=
 =?utf-8?B?WmhuSkNtVnRpQ3Y5NHRvWmZ5Vk94U0l3T2pYei9kYXA3b1FOL1gxbkpsd1Iz?=
 =?utf-8?B?L1Q0MXViVGxXN0hvSzVBb2R2RStxaGIxb3RTenc1UnZodHZJbnJZMDJpOEVZ?=
 =?utf-8?B?RFhVZG5xZTFDZmVSKytIWXVETVhBaE5hT1Y2WlgrVnFjRUhSRmJUQlI1a09O?=
 =?utf-8?B?WHRuRlM4a204OE1wWG5wbm05L3VsUHQ1ZlBUMGd5bjRsSUsvVVRLM3kzWk81?=
 =?utf-8?B?cXlKL0pPNy9sQlJ3MGNCSk0xWHJxWXRNZk5uYy9Xc0ZmMEI5ckxyYTU4dGRC?=
 =?utf-8?B?RTg2Mk1Wd0x1amRqdFd1MWZOZC9zNElvL1llTU45bzhYdVJRNzE1a3Q2VmYz?=
 =?utf-8?B?OU1jbjJ2WjJFa2xUQi9ZdnlCeXlEeVRjTGttQStYaHhTbVd0cHR3RnNjWm4r?=
 =?utf-8?B?K1drczlxK3BjbjhBZWhXenA2M3BuUlFSSVAxaVJ1NU5pcG1Na2JsS3phaUhw?=
 =?utf-8?B?anVxb2pjd0FEcWVUSWNqbnNkS0cvT01PVnNYQTcwWU9XYzg1dkhsUStKMHRG?=
 =?utf-8?B?VWVBYzNYTEY1M2lDVXU0cU9BVi9HZEtBemVHUUNTNG9BR2NjV2x3eDVSMkxI?=
 =?utf-8?Q?BQI+e3Xr4n5wyUYSwEAzzntGiC+x4/ZWMam/U9/MDWYg?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ddc8a8cd-5961-48ca-a905-08de16777487
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2025 23:12:24.6641 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i+u9388W9t8OzF69CkhE0lRveEgBRuO6nb1Oi8qKI4CZvPZod0g5Jk09Cbj0/3oEbDqgowj7O0JSrgKc3XfA/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PR12MB9646
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

There are a few situations in the driver where we convert a `usize` into
a `u32` using `as`. Even though most of these are obviously correct, use
`try_from` and let the compiler optimize wherever it is safe to do so.

Acked-by: Danilo Krummrich <dakr@kernel.org>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/fb/hal/tu102.rs   | 16 +++++++---------
 drivers/gpu/nova-core/firmware/fwsec.rs |  8 ++++----
 2 files changed, 11 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/nova-core/fb/hal/tu102.rs b/drivers/gpu/nova-core/fb/hal/tu102.rs
index b022c781caf4..32114c3b3686 100644
--- a/drivers/gpu/nova-core/fb/hal/tu102.rs
+++ b/drivers/gpu/nova-core/fb/hal/tu102.rs
@@ -15,15 +15,13 @@ pub(super) fn read_sysmem_flush_page_gm107(bar: &Bar0) -> u64 {
 
 pub(super) fn write_sysmem_flush_page_gm107(bar: &Bar0, addr: u64) -> Result {
     // Check that the address doesn't overflow the receiving 32-bit register.
-    if addr >> (u32::BITS + FLUSH_SYSMEM_ADDR_SHIFT) == 0 {
-        regs::NV_PFB_NISO_FLUSH_SYSMEM_ADDR::default()
-            .set_adr_39_08((addr >> FLUSH_SYSMEM_ADDR_SHIFT) as u32)
-            .write(bar);
-
-        Ok(())
-    } else {
-        Err(EINVAL)
-    }
+    u32::try_from(addr >> FLUSH_SYSMEM_ADDR_SHIFT)
+        .map_err(|_| EINVAL)
+        .map(|addr| {
+            regs::NV_PFB_NISO_FLUSH_SYSMEM_ADDR::default()
+                .set_adr_39_08(addr)
+                .write(bar)
+        })
 }
 
 pub(super) fn display_enabled_gm107(bar: &Bar0) -> bool {
diff --git a/drivers/gpu/nova-core/firmware/fwsec.rs b/drivers/gpu/nova-core/firmware/fwsec.rs
index dd3420aaa2bf..ce78c1563754 100644
--- a/drivers/gpu/nova-core/firmware/fwsec.rs
+++ b/drivers/gpu/nova-core/firmware/fwsec.rs
@@ -291,7 +291,7 @@ fn new_fwsec(dev: &Device<device::Bound>, bios: &Vbios, cmd: FwsecCommand) -> Re
 
             frts_cmd.read_vbios = ReadVbios {
                 ver: 1,
-                hdr: size_of::<ReadVbios>() as u32,
+                hdr: u32::try_from(size_of::<ReadVbios>())?,
                 addr: 0,
                 size: 0,
                 flags: 2,
@@ -304,9 +304,9 @@ fn new_fwsec(dev: &Device<device::Bound>, bios: &Vbios, cmd: FwsecCommand) -> Re
                 } => {
                     frts_cmd.frts_region = FrtsRegion {
                         ver: 1,
-                        hdr: size_of::<FrtsRegion>() as u32,
-                        addr: (frts_addr >> 12) as u32,
-                        size: (frts_size >> 12) as u32,
+                        hdr: u32::try_from(size_of::<FrtsRegion>())?,
+                        addr: u32::try_from(frts_addr >> 12)?,
+                        size: u32::try_from(frts_size >> 12)?,
                         ftype: NVFW_FRTS_CMD_REGION_TYPE_FB,
                     };
 

-- 
2.51.0

