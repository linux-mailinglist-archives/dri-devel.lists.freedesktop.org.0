Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C800BC502E3
	for <lists+dri-devel@lfdr.de>; Wed, 12 Nov 2025 02:12:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 315B410E170;
	Wed, 12 Nov 2025 01:12:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="HugM2BO3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11013054.outbound.protection.outlook.com
 [40.93.201.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 268AD10E170;
 Wed, 12 Nov 2025 01:12:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dauWes4IsoloSKqnBCBWE9u7nEJi7jLfPdIIFfWg4kRIZ+rtbtiN6LbVCCfaICNOmcQD/WcMz8SLzZf1ieyClRV4qbiD0H4R4NYQp28ekdh8QU2mwMdAkoAXUKoQp8Oi2tdM3BkU9cwzs3DfFsJGpqA75tW2RMwjIf3MjkspA4GlKjbWH1gZi1zKJPGTgKc6GiBNlNDuHyqS37RIOqTSBRlKA+nmrpS6HQ9Ms+BLbgk5nD0ChObhW0tIpnaThxs6cZEoi7ylxzbtX8ZJfMQ97fewX15mlPNR5+phJrdpU7b/Zl8A/Y2lBQ+TqqryOW9WX2x/+bKLgwp+CrjOnNejog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8WAO5ocjf6ZsGGQLcGA77Am6Ez/BaQha0ddwMLsMmXM=;
 b=bSqrgr3dSpYWORqCGxMWwjbgO3U9W5PQu64ExocyCCAKGxCTVDfoxnSB3gVecYl0tzowhNSctSUIkbTx4yrfVR3O/Yao5mhR/ZIHlkDvfHx6pMVx5+/iNYOhaUrKRCcqkywG6SkxsBq2QrzV3H+oaQEeAq0eJzPQucT7rCdz6i0rOvqhJyHu92+lVmituVwsWhpenmQCpolfRAc1uVu7/rDoC1qUH8akqBUQKzquisaCKwE8UwK2jQPB3DC6pH3mBBR9r0QtmXFUnUgqjR08852AUjM2GZheTEZObxpKQPd7AGDuU8jblID5qDomG/1nlT1BapzMzzdUHK7VDI1F+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8WAO5ocjf6ZsGGQLcGA77Am6Ez/BaQha0ddwMLsMmXM=;
 b=HugM2BO3tfPRlMwA2ZwJG3GqAEPfFD7TFClEvehYORejX9GpaAiBUWg/dGgl8BbDh/BPM3J7FFkAHEGBu2/QWjMsEM09cGypT4flDcKqkyz+bvXucSKzr5BaEbCGEuQQMStdhWSybPKoa5vcocYE5TPViA2z6i7uAkkgEFgOOPX4eUYm+MTqFxioqE8zN4QouQuC74VGoM5U5ZlbSzt8Ypg7o7ZyusN9+NnPAFbNEvJreHcOSfutD6WSLW8b9DL3/CqMMutjqk7X/t/Kr9F41owaeNf2BtdvsdZQ+xcPuLJQJkK3elZXqWF2MLP2qRh70wMlKS3G4cTFXpPNqdr/3g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by MW4PR12MB7309.namprd12.prod.outlook.com (2603:10b6:303:22f::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Wed, 12 Nov
 2025 01:12:03 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9298.015; Wed, 12 Nov 2025
 01:12:03 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 12 Nov 2025 10:12:00 +0900
Message-Id: <DE6BESY0QHEZ.2DX2FQ6HF8BY6@nvidia.com>
Subject: Re: [PATCH v2 06/12] nova-core: Add bindings required by GSP sequencer
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
 <joel@joelfernandes.org>, <nouveau@lists.freedesktop.org>, "Nouveau"
 <nouveau-bounces@lists.freedesktop.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251102235920.3784592-1-joelagnelf@nvidia.com>
 <20251102235920.3784592-7-joelagnelf@nvidia.com>
 <DE521OFQRH29.ZNUPX2POGN1V@nvidia.com>
 <f7608a86-3842-439b-9d5c-b7039cd15d1f@nvidia.com>
In-Reply-To: <f7608a86-3842-439b-9d5c-b7039cd15d1f@nvidia.com>
X-ClientProxiedBy: TYCP286CA0039.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:29d::13) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|MW4PR12MB7309:EE_
X-MS-Office365-Filtering-Correlation-Id: 50ca624b-87dc-4628-f9b8-08de21887d1e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|1800799024|7416014|376014|366016; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YUQ0cVVTZVMyaDNFd1k1RGdPMUdLZHVCZ1l5UXFPMUY0Ump0Vk15MnFyMHla?=
 =?utf-8?B?MzVhUWhzeE8wV2hRNjl0YkYwZWFoTHZLRlRwWURpbHN2R1hMcjhUYW5IeWNx?=
 =?utf-8?B?emxJUko4N3RodkltTDM3eFl5MTlBakZNanhiZ1JRR1dRSXI0WDBmUDJhMEFZ?=
 =?utf-8?B?dmVtL3h2amp2R3FhUUhmUmdWaXpFV3NsMnFzSElTcDkyOFIwc1hGRnJoNXQ3?=
 =?utf-8?B?N3BiK09LQ0g1TU1aR0xHaGJnV2VBbDZDcHZaemZ6RDhiU1lPUGlCamlFS3pU?=
 =?utf-8?B?dXBCdUx1eWY2RkMvaXpWT1FIWXFsL1YrTnNsSUFJQ1dqSHVwMStNOFJEREho?=
 =?utf-8?B?U2N0TEk3bzEwaVpTMFJWNWprMVJRQ2xKZ1JPUDhVUEtFMTVIL3pwU3FmQlNt?=
 =?utf-8?B?aTU2b0sxK2ZTV2JYUHFKelpxZCsxNTkwVEhzTitLbDhmR1Fxc21FZjVPQW5u?=
 =?utf-8?B?NTh3c3NwNlNNTndkTFJKOUI4YXRrNWZaTVRXUlJCWnRVaE04UndSVlB0amJH?=
 =?utf-8?B?dXlxWUhNV25pQ2pGL0lkczYzeHhWYzNwcTZ2VFIwaXhrd0tXRnVXeXVJQlZK?=
 =?utf-8?B?RWVxR1gvOUhsa3N4eUJxNWwwemxIZmxmWmpoWXpmWXZhL0kwbkQzVC9uOEZB?=
 =?utf-8?B?ZE4wWm43UmJKM0J2L2dtV2pYc2luQ3hISGpVaXVqVXp3U3VLK2FFbjYzL0Vs?=
 =?utf-8?B?Visyc0ErR0N3OEEzNUc2YWxSbE5KWVJlQmZwRlRJbndPNTNsM2M3cUl5em83?=
 =?utf-8?B?enpBZUNYMTdSQmo3MklKajRZK0dBUENRaEJBMnlUNGFjbnhhcFZTR0dkVjJF?=
 =?utf-8?B?WStXOWdqQkFJeXdmeHk3dk41MDlFQ3JITGVYdG1tZ3pwM1NRL0tHdGowUzE4?=
 =?utf-8?B?bXNaRTFzMkRxcWdrdHh3RUp6Y0FSNW1oeWlYeHIzNmNEWVFsRitFbnVBb05T?=
 =?utf-8?B?YS83b3doaGhwQmFoWTBMc2NvTWRnTy9NaU9xU3pIQTJEQjJHY0xrQlFRYzF2?=
 =?utf-8?B?Q0tWMVB0NGsrR2xhQnVBNmtCZER2UXJYaytXc2R4UWdmUzNNaFk3d2puU3RR?=
 =?utf-8?B?Z3doZ2hDeDRHRXhtWTRCK3Q5UFVtWE1XMnp2empwT0NtVnV3L3Mwczk1aUdp?=
 =?utf-8?B?YUNkRUVDeGhOb0ExM09taGthYmhCemMzYW13cng0bWlGd3ZVWkZiUzNrTVVL?=
 =?utf-8?B?N25FdVd4M0RqRXUzSTJoZWoyS1JtMkkrRC9JOUNwamI3UVQ1K2pLK2d4R1Fn?=
 =?utf-8?B?Z0lKem9HOUI1TnRYcW51YmFLQ1IzY25ic0grNy9qdHNTRDFRY1VrUEovMHNY?=
 =?utf-8?B?WUNEd3dpdjAzZVg3YktScEorTDZZT3R5VC9DQmtDU0ZVaDhLMzNtU2FwdXJ0?=
 =?utf-8?B?dGJpWUZueVhJZEJqMjBnd3l6MURqNy9vbThRbUlNNnpxR21mZ21zb0Q4UHB6?=
 =?utf-8?B?MENKWjJjd2RqcVk0RXh5eHVaQXZPdlBIYkRhMktWMGwxWkx5S0RaWFNjMDA0?=
 =?utf-8?B?Q2ZTc2UvcTVmOFBuM1p5b1o1WVhaZEkwRy9pWk05M2xaaGpvQzFGSkJjSHZk?=
 =?utf-8?B?NW9Pa1RCNVcxRjQyZlAzWmVheHl1UFB5ck9pYTlVN2lidVFnVFlLbFBnRFpa?=
 =?utf-8?B?YUdnbkNxbkw0S2RSb3pWWFRNU24wSUo3azl3WTVJazRQWWgwcmwyNzJmRnBl?=
 =?utf-8?B?WmJ0c09tVnNpSER2YVJCK2FFNi82MVlqT0hGMmhYU0tvYm0vTVEzdk1GN0lB?=
 =?utf-8?B?c085QU55aTRVdkxyMG9VWWpCZmlERjl5aG5nUzFpRlNwREx0ZnMxU2ZIMld0?=
 =?utf-8?B?K3RCbVFzMjVvdWN0ZGRMN3JQdFZvcStXaUNoTmpXU3NnT2VaSDhCMGMwdWRt?=
 =?utf-8?B?c2RxelhWQmIrN2czbUNOWVk3d2NvQjVySXBSSkxaUnpFQy9ldUJjMFN2QkVF?=
 =?utf-8?Q?9D9XHvZYUdKT1pX+CNz+95VtWGMCqV94?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(1800799024)(7416014)(376014)(366016); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZTNxc0RxTWRKZ0dLZWgyRlhOL3JLbUZ1N1JPT2ZudEZueGpDdkpCTWdZOFBs?=
 =?utf-8?B?ZjVyWFlNU3JwZkNMdzIweGxMRit4U1lWVDhMSU1yOVNkZVVMRm5nYWgvV2wr?=
 =?utf-8?B?RFo5TFAxL09jSWNaVnF0Lzd6ODNsUk9kK3NZR1JUcmZqYmFTUTNwN3crNG5u?=
 =?utf-8?B?Q2RnZlhJK0p4bXhqVldFNXVaRS9jYjZGeEJRMzQ0M0lyaHNsN1Bsb25nZEpR?=
 =?utf-8?B?QWJmRFRzbEZ4M0Fyeno4eU5sMHBmTjY3Zk5iVmZpdWFsem9tUVpJYkhrVlRD?=
 =?utf-8?B?cWJ4RmlqMWdmQTZIMmUrZGh6WDBEOW9GVUJVaDVuME05cnNkU1p6L0FNdEY4?=
 =?utf-8?B?Z3E5RFpwcXpSMlhaK2RFeCtyQ3Nvb0dSMWgzeDRLK2VOL2o2Z3p3RDFURWt5?=
 =?utf-8?B?U0FFa1RCbzZBamFyNWRxY0hZZno4cFdteWg1SXhpci9DU3JQcFRQY1h0eERW?=
 =?utf-8?B?bDV5RHNGSHJUK0NZM2J1VXFNbGdmNVBMaTNZcG1jYlFDaVdLcmtGMjJUcm5h?=
 =?utf-8?B?QldtR1E2MzRGYmFLdUVOMjd6NEttK01lSkdSN1hRR1ZialRja1lySTliQ0dZ?=
 =?utf-8?B?dHo0TXErNGsrMmJsdFJyTUV0RUx5M2hWTlppZ3hiN2hGcEJxTFliZTVNaVBO?=
 =?utf-8?B?OTFXZjZrMlFjYld2NXlQSENuRVBZUkFlQTVXdWNWMmFMOGZJMXRqWnRyK1pG?=
 =?utf-8?B?UGY1cWpjTXZHVC9UeVFIbDVyUHlZR1BrUVNiRFIrWE1KNFJPWllENzlISmFk?=
 =?utf-8?B?YWo5Q0lBVUFtZ3g4bnE3RUtaeFpJenB4eWxaajl1RXpXUVBndUhTWHI4cEJ3?=
 =?utf-8?B?ZFc2Y3Ezc3NnMGtNeFZndjdnSWN0YTlRcjZjTUMxaGpLVzdpWTlzNmdhRGkv?=
 =?utf-8?B?emRDWlVpcmllKzBPcW9MZVJYRTNUKzk3N1k5RnJBOW1tVlU0cWhMejJOTkFr?=
 =?utf-8?B?eC9pY2s3MnRsQ1NQZnRLZFczazQ3MzI2S0kzaXB5MWN6RWljQ2VmaGNsV2lr?=
 =?utf-8?B?bGdSSWY2S2hWQkdyanVZQ05xUEFtOEJrTVBOcVMwZDRIcG0xRCtxWjdBU2JO?=
 =?utf-8?B?YmpxSDE3WDBRK0FXZSs3ZjYyem1xUW5TOU95WnQ0R2xOb0lDMlBoWXEyMm5q?=
 =?utf-8?B?TFNYdk9adEdkQnBjSHRHZ2JVZytxbFpZcUQ0YVVuOVpqY05QZ3ROeXFXOXhG?=
 =?utf-8?B?WFcrNjc4ZklwZDRCazN6aXRibjB2TmJ2Rm4rSno5VEpYUGtIUzI1clZOMWh6?=
 =?utf-8?B?MFZXWisxSW5TaU96dC9jZWg5bzV3NDZwaW9LWWpseVZGcy9tRURvL2xRdlFm?=
 =?utf-8?B?UklGOWNCMmdPVWxtMGVMbXpBYTFvdmJseWJzMlh0R2xwY0VnOVYrbXlSM01n?=
 =?utf-8?B?ZTFuNWtQVGJDa083Y3MzOUg2bGN2cDAxZllqdm4yT3ZSYitkNmh6QWtKN3VO?=
 =?utf-8?B?WHdvVWdhTVIzNkFZVVIwWGozQmE1WFF6T2xsSjZkTnRhOGdpN0tEY2c0K2sw?=
 =?utf-8?B?ODBJRktEak8xUUh1cjBkNEpNbFMyd0dVOTJXZDh2eVpwSVFRU1BIdXBrL1BH?=
 =?utf-8?B?WFh2dnFkWTZhR3hwdHljbTNoRWJabFRlQ0RQc0JFbnBlQnNPZkxtMGt6bncw?=
 =?utf-8?B?UVEwblFZZjlvcFhTSEd5aU5RZlZtRnk2NUk3KzZGa0xpeHUvZ2lEc1lmWnF2?=
 =?utf-8?B?bkpYbHhDWVlFK3RlK01FbGVLS2IwUVZ5U2pGcWI4TWtxYlJXVmsxQW5XY2I3?=
 =?utf-8?B?aklpeVdBVGV3NmY3TklEMndxWlNNK284MHMvb09Ra3FFc1FRc0VPWUVHRHk1?=
 =?utf-8?B?MHFaRU5wVW9OV3NvcnVNQUV4bWRvVU1MUkQrZmpHb2pLb2cvZGNCaUZhZDJi?=
 =?utf-8?B?NmRNaFZ1cmZVeDlla2ZXQUZNcjJxczcrSVB4d29Ia2R0bkJ1dkx5VlNFYU12?=
 =?utf-8?B?bXl2SHY4K0VicEIzaWpzYW84ZXl6TVR0ODR3ajRTTC9mSXVRNHQxemtXYUgz?=
 =?utf-8?B?Mk1RTG1wSmsyZ0NGUmRwNHFlT2ZCRjFRMC84dHo5ZTN6aDlRaWtXQWd6Y21Y?=
 =?utf-8?B?eWt4WEROaFRXek85WGdZblBTVDhTODFRS1hZL0lCbGdoa2dQcWt5SEM3dzFV?=
 =?utf-8?B?bEhoVVZpV2x2L3ROK2gvZk41RThpcnhLTmpZUjZiREhqQi9ZaVhsaU1Mb2NN?=
 =?utf-8?Q?N0LJkgVfjSn40x6esVXjeYULGWwxKRcjqcZVAWoNYANA?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 50ca624b-87dc-4628-f9b8-08de21887d1e
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2025 01:12:03.3346 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +xc8l9oqyRVrHK3kuKakBMl9l0vZdmLjCzUk5S0FGQtn88FKPzTSQxfbalAa0tCMMOTeDhH+6dr6c1cKAlQA9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7309
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

On Wed Nov 12, 2025 at 7:06 AM JST, Joel Fernandes wrote:
>
>
> On 11/10/2025 8:39 AM, Alexandre Courbot wrote:
>>> +    // GSP sequencer delay payload structure.
>>> +    GSP_SEQ_BUF_PAYLOAD_DELAY_US,
>>> +
>>> +    // GSP sequencer register payload structures.
>>> +    GSP_SEQ_BUF_PAYLOAD_REG_MODIFY,
>>> +    GSP_SEQ_BUF_PAYLOAD_REG_POLL,
>>> +    GSP_SEQ_BUF_PAYLOAD_REG_STORE,
>>> +    GSP_SEQ_BUF_PAYLOAD_REG_WRITE, //
>>> These ones are a bit trickier to abstract. Since they ever only use
>> `bar` from the sequencer, I guess we can have their semantics in the
>> `fw` module, exposed through a method that receives the `bar`? That way
>> the sequencer won't have to access their members which are private to
>> it.
>
> The sequencer does need access to the private fields, because the logic o=
f what
> to write to the bar should be in the sequencer, and that logic depends on=
 the
> fields.
>
> Example:
>
> impl GspSeqCmdRunner for fw::GSP_SEQ_BUF_PAYLOAD_REG_MODIFY {
>     fn run(&self, sequencer: &GspSequencer<'_>) -> Result {
>         let addr =3D self.addr as usize;
>         if let Ok(temp) =3D sequencer.bar.try_read32(addr) {
>             let _ =3D sequencer
>                 .bar
>                 .try_write32((temp & !self.mask) | self.val, addr);
>         }
>         Ok(())
>     }
> }
>
> Here, the sequencer needs access to `.addr`, `.mask` and `.val` to craft =
the
> address and the value to write.
>
> I could expose access to those fields as functions, but I think we should=
 not
> move sequencer logic to fw.rs, that should live in the sequencer.

Yeah although I floated the idea I have to admit I am not a big fan of
that either. So I guess we could have accessor functions for the fields,
so the `GspSeqCmdRunner` implementation stays in the sequencer?

It will at least provide the level of abstraction we require against the
firmware types' internal structure.
