Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA842C3461D
	for <lists+dri-devel@lfdr.de>; Wed, 05 Nov 2025 09:03:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A588B10E6C7;
	Wed,  5 Nov 2025 08:03:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="XdPC+wN0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11012027.outbound.protection.outlook.com
 [40.93.195.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7765B10E6C5;
 Wed,  5 Nov 2025 08:03:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=awrLVViF9rKxTdyTxj8eZADsk7VpJG4j3rD0BZ0PYslSFAj9kuyzE9ud2jnOaxduAQ1Jy5H0qdKlQ+cM2OnXINDSmTpiX2OeaR40oqCrhMfuctnNXf5q3PYKQRhSl3h55DYOF1Ruznw2msMeUNpYkvxPi8V7BwYRDxvksachspX6eHnS/SbOvSTCdMyDeyKMmBKdywivwiGm645frLfyykgP7CAzzjN82fQ0gdKfR5jqH8LibBfDT/azlS7uyNWFENDGbvThoBPqONcLtKCLj8k0OLH6/SXOHA2L3FHrCDgwaZQsY74rtNDgANY33BHjJodIs/jKKRmn/TI3zrCe9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PT4ztwz+n6CCQ4mr9igVGOGM+DQOiekvJ7A+2V+n5r0=;
 b=kNGfBc5posW9pVc1IgYPkkE7OFfPrN8GWixj8VuOQlcZLbgvx2mVSNWnuNIBhbKONAaI+WUIImg3ejrWUMomaAW/HTj9R+w4k837WTRkWZ3YWatybMrXOBPfVUMU2S0iEVrQPIgFmOjCS2CYtu6/H7lkhIL6itinisnLAwlSAj5x3yrrIA/Kx6LwzYeTCYN9sTmxk2p7zTxnpSTN3OHkvfewF7dNxEYV6axiu8WP7PZ1Uhz1xH53r2TwxkTeCY7pcHsJXCPRbdcANoVQP6tK1hufWgHycoHtFs4QDR0IVac8siJJfUSfKf9eE4UkZeLuJiZfmFAZJ1+uW2E5Dpj5rQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PT4ztwz+n6CCQ4mr9igVGOGM+DQOiekvJ7A+2V+n5r0=;
 b=XdPC+wN05oKKxeGAxnd3ebyGADR/HSpMPjJqrsvmwUqTyqKmdUNp1dBmJMZc0M+fr3BlTze5+HRu5Z52zw8bzJhwbHGkPtfWwd5y3bKrv8ZrSi8qxII9cZwmkqvQbxMeDfkN4K5z1xdmnzpjGcE2WjTD556Wt5npuqCAHDXfvrkuelJlAXCt7xH0hX3qMBMLFkH+Io1rfxsGyzGwhgz0XVnHYMjj1Cf9EOG4coD9VTprYFcEAd/kwmaL5+kU+Ro8BRsoxMtEEYvHTC7wvM0AO7A/KPGJ+6xpAlrkfTTQRyPRkG7GNaUCSwJw7zuLEZGNQgWqscuIMQAXGsXkJT3Mgw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DM6PR12MB4450.namprd12.prod.outlook.com (2603:10b6:5:28e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.8; Wed, 5 Nov
 2025 08:03:30 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9275.015; Wed, 5 Nov 2025
 08:03:30 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Wed, 05 Nov 2025 17:03:16 +0900
Subject: [PATCH v2 2/3] gpu: nova-core: select RUST_FW_LOADER_ABSTRACTIONS
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251105-b4-select-rust-fw-v2-2-156d9014ed3b@nvidia.com>
References: <20251105-b4-select-rust-fw-v2-0-156d9014ed3b@nvidia.com>
In-Reply-To: <20251105-b4-select-rust-fw-v2-0-156d9014ed3b@nvidia.com>
To: Luis Chamberlain <mcgrof@kernel.org>, 
 Russ Weight <russ.weight@linux.dev>, Danilo Krummrich <dakr@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Trevor Gross <tmgross@umich.edu>, 
 FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: linux-kernel@vger.kernel.org, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, netdev@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TY4PR01CA0097.jpnprd01.prod.outlook.com
 (2603:1096:405:37d::10) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DM6PR12MB4450:EE_
X-MS-Office365-Filtering-Correlation-Id: a9e2397b-1475-46e6-8cd2-08de1c41cedf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|1800799024|7416014|376014|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Q3NlYWo5U3J4ZHV1ZW12TTdVWEdLSVppSDMyVVcwZXhDaTJnM2hVazNramFs?=
 =?utf-8?B?elBDNGRGbHBSRjBUUFlFRkZYWjVKZ1BvQk9uS3I5TFhmd2xaT1I4YTBtY2Mx?=
 =?utf-8?B?Q2hpMU9HSlIwcCtDTlEzT0FMLzM0UDA3MlRyeFBjZ1czVnFXUXdyQmRqQ2pF?=
 =?utf-8?B?d2RqU2Qrdm1ERnpOY09ILzFxQy81eFVweVgvSk9pc2xYb1FKZERuQkFsMVZF?=
 =?utf-8?B?M0tDQmFKbkZOQ2FDSCtTU1JvNW1HdjZia2R2eURuVTZYRk1za0R5TzlpUWg0?=
 =?utf-8?B?ZkZ1eVN3YlpnOTZPQ3cyVGI2TVBEYUhrVDVBSmJ6dmZUbExHVXpHV2hPbnpH?=
 =?utf-8?B?WkljWEYrSXpEWUM3WkJ4dlF6SjRCTlE0MXZZK3Qya21uVXBnSlk3dE5jSUtm?=
 =?utf-8?B?NFFDSXVMNm9lTEtaWm8xeUhWSGxxZ1dlSHB4RUQ0NllXRllHVENrZDRGaW00?=
 =?utf-8?B?MjdqSmdwR1p4Tll6VnJBeWpTMXprTlJrZGpMWWpzRkJFOU1Hcm5GcHByTStS?=
 =?utf-8?B?dWZUMFJ5bjVFcitGUUV3MFlTMUlYa0RpQ0Y5elBCUEVNeE5EeGtOMEVvOURQ?=
 =?utf-8?B?TXVNcExzVUF1RXVqWWZYMWhNaktRRWlZUktjQWEwVUN2MGZlMnZPVmtxSVpU?=
 =?utf-8?B?a0ExMGxUYTNJYTdEaUxOU0Y0MmI2Vm9zbHhnZzRmSzRIa01mb3VuZFBHN2NW?=
 =?utf-8?B?Yk15NzArdSt0TWp3YjlOZSszeW9QMHA1ckgweTRnWGxJTEVUdk0wVVcvWXRI?=
 =?utf-8?B?QkZOLy82b3V1OXFHaUFxaFhjem1rSXIzMUUwczBIQXh6eWRHWHE0YVc1cHhH?=
 =?utf-8?B?K1ZSYWJqTSt3Sm1DUGM0UEkreUkxSmp3NmE0K0RzRDhLY3htdGJOeTZSRzdG?=
 =?utf-8?B?alN3dDJDbzJzOTlYdmZ4ZmplU2pzTFBaUk1XdHJNNlhYNHlZcnAxZG94WU9I?=
 =?utf-8?B?VnVSNzlYTzBIbnZ5ZFJjRkJaR3RRSEdGeW5WM0lPeHFGZmltVEpXSGJ0aXZ4?=
 =?utf-8?B?UndhZ3Rna282SXhGTnJ2MlRETU1NRDFzdmVCc3pCd2dUYTNSemdoTmJnUTc3?=
 =?utf-8?B?N1g2UmNROG1ERVNaUDA0SEFmTlp4Qk5mcU9Lei9mblJKcjdRc29uVFA2aVNj?=
 =?utf-8?B?bzdkcmEvMDhMcnh6UkZobTNTYTZJVU1Wd0cwNXNqZXNoRmF3eDR6WnFRMjhL?=
 =?utf-8?B?UmJYTElsZTU5alp0ZHo4bURsWmQ3bFU2MUR3bWE4Z1NsYStzOGVKdU1vb1FY?=
 =?utf-8?B?N3RhTFRIemhiT2V4aldmVnJ0ZlI1UDZRc2dCMUZpVUpHbHhsQ3FtUW5pSWpv?=
 =?utf-8?B?OHRobG1uTWJJWTAxV2NhcVExYldPc2tXSExzUXBlTTljcjdEOFM3K3VQMWZF?=
 =?utf-8?B?Vml1UEcyTHpRNFY3TWpLOGVZdGpobGtwNy9oTjNOb1Bkd3FEZHAvd2c4NE5u?=
 =?utf-8?B?TkVPUm56NTJlelN0NkNEZ0FPb2VMMlU5aVNuRUQxb2N3bWIyenZVemZXcHkv?=
 =?utf-8?B?TDBwZWg0cGFEeUhsRWJvakxNaWFVYVY1aHJxblk2d0h1Yi9vc2cydmE4VlNm?=
 =?utf-8?B?dGtwc1Z6bG54RVArM042cHcyZnhtdU82bVQ1M3l4emd0cnZoanU3VnlWS1Vo?=
 =?utf-8?B?ZUFvSEFLTmhYR3lra3pXMVh6eXV5RThRVkI2Ny8xZm1wbkdkSVJVYVY1clRB?=
 =?utf-8?B?T2ZNUnluNzVpeE1JbHRYZHAwMkx3SU9CeXpZdlhrVXNERXhUMWtsQUFNUVFX?=
 =?utf-8?B?d1hqMUtSQlRhVUVFSUdmeGFTREFFNjhPSHJycUE4bWNyZmVDSlRhcGUxSmNY?=
 =?utf-8?B?dngxdHBaZjhadDU2RzAvK1Z6MkIwTlNzU0srdVhjcHJSRWRURGk0YkRCTFRS?=
 =?utf-8?B?MTNVQmx5WkNwbEJlL0djK3l3S2RMVmZnQisveENDSkZJVWJrbFVlMk5sWWx0?=
 =?utf-8?B?Yis5NGFlZjI4VDFxdFp4TUhidHIzemkwT0VsWVo3RXd5TldvVXZDdTdJZXlm?=
 =?utf-8?Q?YkJZ0wKAEZk8ITUahAyA8cdX1kC0og=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(1800799024)(7416014)(376014)(366016)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V25hY2RXODlDbURUbTRqN2FQRzFjVEpaMWorb3laelV1Wk84WjNya2F6Ym9r?=
 =?utf-8?B?NVBFTUFNcnBTemRnbk9lU1dENWtSbm1za1BIL3pXTTQxaXZHaWtSTjRBQ2tV?=
 =?utf-8?B?a2RFQTZVNktSb2VXTkh1YTZZTmRPN1NmM2lSN0ZqUDJFUzNlTHFyMVpkVXlp?=
 =?utf-8?B?U2lzbDFpVXBrT3Q3NzNidnkzb0hXVU1GN1h0NWN6NDl5eGZPVy9kUVBwcTNJ?=
 =?utf-8?B?R3U4TlgrZXU5UHFaQURkeU5PdERrL3FjeE9HVEN3MlBhMHVhU3RiZi84b0lj?=
 =?utf-8?B?OWZSY3dPdkxxUXlGa29tc1VOQkdDU1lVQi9LQmNnNUh3TG05QTBoUnRVa2Vt?=
 =?utf-8?B?NmcycnBCTE44bW56TjFNd1JEOFFQYlZDZlVSNlY5aVFCSmxBOVNKMVdVWnZt?=
 =?utf-8?B?SXpLczdQdUtYMEdmMVNXSzdjWDQxaGRjWGJTQnR4Nlc3ZGpObW0wU1J2cUty?=
 =?utf-8?B?WVFHQkdhWkp5Tkt4QmRnMnpNdUdEOHFXS2c3NWFQTzczT3ZRandoU1YwTkNE?=
 =?utf-8?B?UldUY2ZJVEVMRnBqaDhxZ01kejJ3andaWGFlcnlpL1AzV1Q0K2N6Qk1Fc3Fv?=
 =?utf-8?B?SzhnNEtHT2VYbmxqSU44MzNWV2k3aWlRVHNjck5VbVI4WElNUnlmdzJTckI1?=
 =?utf-8?B?NGZBbmxmaXZJVndWR0krS0NJNkIzbEsvcUxSbjJ6bTFNM09PZzE5S0Vnc1FN?=
 =?utf-8?B?blJTcmlPYjVFOHV0Wmg0cjIrcW5XM1VHZncySDV1eFp6TFFyZm1LTmQwbjA3?=
 =?utf-8?B?R283WDRZUXpUNG9QSkdSMThUdDhkY2pmNGVWODRGT251TlV2TWZwZ2p4a2g4?=
 =?utf-8?B?V1FYVnh5VnpGK3o1cGdZZXNPVmE0TWloOHVPU2pHRFU1RENNcERaQmwwdEdO?=
 =?utf-8?B?cnlPZW9wUm9lR3JaWU9oUnpyWEhNL1MvQ1FYZStQeHQvalNVL3hrdlFYQTcw?=
 =?utf-8?B?Q0ExdXlSUHQ0QWhJMjVQWVBITW1SWE9ubjJBU3dGdVoxK2p1WjMvVWZxRGNI?=
 =?utf-8?B?RUx3b1RsNEJvUjlzTnBQbXZXVllpbkJhVkt0YitXRkk5Si9YS2YrYWFsc1Qv?=
 =?utf-8?B?YXJLK0tjWEdkdEIzN0VIVTFSaEQ3V0hpQ0dPOXF4eFJ2NGVUTjBZRGxGVkJB?=
 =?utf-8?B?Zyt0NjlqQjdwaUJ5ZU5tRlR5N2ZteFpwbTNwdFg2cXBaT1RiM28yenExOEpu?=
 =?utf-8?B?RHMrMTVPekRQYUdoUnFHUklYWCtJNjVLV3BwdmdNZU9USmo3dDN1azI5Ykx6?=
 =?utf-8?B?VXVMdFhBNTZWa2tWN1RPUk9nWVdYYjVha1ZDZStHbU4wL3dpOVp1TnBpbjN4?=
 =?utf-8?B?ejBXRENhY3U3OU9Fa1dLZmF4dTZEVzJzbW5NWCtaRitLRzVpTlhCWjdkTlMw?=
 =?utf-8?B?SnYxeGxQeFFwVUtGU3Z5aDQ3NW1SOEJqQ2htemZYV0RBS0NrRE5TbDVOUzhh?=
 =?utf-8?B?eUpXUVV3RXVHRWdiYXkzS3NXeGFQbC9mYTNWYzFxY1FzNWRTclBIbERvdmlJ?=
 =?utf-8?B?Q1dROU5OQTZXOWJnanZ6T1RSazR3Y1ZyT1ErSmFwNDd4bkZ4NzRqT1RBK2xD?=
 =?utf-8?B?NTFIakdtaGo3RFBVbWd3Y0FGVWs2L2ZBcENHeDNRSFNFbGNweTlKcThIWnlX?=
 =?utf-8?B?d1E3Vm5IaGxZOUNtNHFWL0htbFYvNE8zRXIzUTlsdktMdHJvTDJHMmdVQzVE?=
 =?utf-8?B?MTdiVTRNbElFdHExVVZQQTZqcE1DUCtXTGZVeGM1Qmk1ZndwcnhPWWhvRUNQ?=
 =?utf-8?B?YnVFamF1eXJNNzEzR0dzbTRsaC9tWlpETTkyaGNxQ3FzRXlDOWMvbXBIM3hG?=
 =?utf-8?B?bUFTVG9WdmloMFVqbDE5MW9oWUltWUMvSzZDK1lYakEyZDN5RU82WkV0MjI0?=
 =?utf-8?B?Ymg3WlA5bGR6UUR1cENiaVJpUDJIL0V3UzRhd2loQ3g1VzVDZ2srQ0d1REcx?=
 =?utf-8?B?VlV3WVNpZ3lhcEFPbmVhN1hRcFh0aDgvTTlCZXFGdFExUElubDBKTVJRdklH?=
 =?utf-8?B?d0lIZ3BlRHhKVnFEcTV3S0RXMlVBQXVPczJiTHFLbk5YNkF2dHFQOStFTWRB?=
 =?utf-8?B?SlNzRE44UmZ2WDltLy9XTkwvS3Z2T0NrcVNCdURnaE80cGhyMXkxSmNQYWhw?=
 =?utf-8?B?anpQQVR2SVVMVy9CV1czUzkwcHRiSjZEZ2ZxMENBOGRPVzgrTkh3OFJPL0N5?=
 =?utf-8?Q?x5CQdVPiuX2sBe9DSNDrurpQoenSpCQXNbyLQg1UggC5?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9e2397b-1475-46e6-8cd2-08de1c41cedf
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2025 08:03:30.3682 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jO817sv9YvkSXqZOIR1mbm6vsuXWNVG6Ar2ky7d/YfV5ewHImdKCzuAiMKtnb0K+p1I5v5qeQMIOh8+WTgu9fA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4450
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

RUST_FW_LOADER_ABSTRACTIONS was depended on by NOVA_CORE, but NOVA_CORE
is selected by DRM_NOVA. This creates a situation where, if DRM_NOVA is
selected, NOVA_CORE gets enabled but not RUST_FW_LOADER_ABSTRACTIONS,
which results in a build error.

Since the firmware loader is an implementation detail of the driver, it
should be enabled along with it, so change the "depends on" to a
"select".

Fixes: 54e6baf123fd ("gpu: nova-core: add initial driver stub")
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/nova-core/Kconfig b/drivers/gpu/nova-core/Kconfig
index 20d3e6d0d796..527920f9c4d3 100644
--- a/drivers/gpu/nova-core/Kconfig
+++ b/drivers/gpu/nova-core/Kconfig
@@ -3,7 +3,7 @@ config NOVA_CORE
 	depends on 64BIT
 	depends on PCI
 	depends on RUST
-	depends on RUST_FW_LOADER_ABSTRACTIONS
+	select RUST_FW_LOADER_ABSTRACTIONS
 	select AUXILIARY_BUS
 	default n
 	help

-- 
2.51.2

