Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 210C3B406DE
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 16:32:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0091A10E76D;
	Tue,  2 Sep 2025 14:32:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="LCthjOrG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2055.outbound.protection.outlook.com [40.107.94.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA6E710E76B;
 Tue,  2 Sep 2025 14:32:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x/0I4WCSHgoqabPs2yIa7TxO5mrMfZhrCSfsMlK61cLAqmj+C3YjQyZWv6DhMExr1XIX+ruAymOmkuUhuaqeIXWO2Z+Nd+9T7HeC+fditMlzPMBaDNPngrXh4wjSUbq9lAMPJTKl8imI/tN+WDc/dkISLLNGFm6ilinVQAswsrLIZTSDmoU+1FG8ELC8rcJyzr+PS4XQMJFZ8z9MNTdRw2u1YKe0+R7vy47DJUdNMEmgyfWdkDfu+qSTuJPZj0RLx2dR/45pUofz1SmFF794vgiwXZaQ47SYVow5q9WVkJcbsKAF0uIB2iGd5ByHwMjeJwVMCjfuu0tHMgM5XiLIfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hU5br8WCHySVbxomD+20xNQ48S0n6Fbv2sbrIDydCro=;
 b=LNawy9vwe5IS/Dlm/wK6foCIBwWLkT7c5o89eQI1yHVNFxRbKgnF7P4NkNYExF22KyLVpZgXZ0LRe2bT3q8bAnX1Y0F31c06I8K+IlRVGDmtjfN7et3eogoZ157g8oE1SKi0UcLFRqyf4u0X8F9fws7W9vrzSN68yPvTLVlqQLd/PP5Gi3SwrYIxrKWmoEVHVtTV8hRG3Zh8Ul3A2eF5wKj/chH2FnRy8DWify9sTg9ESqLzP3JBxNBRhcA5YTnJ1wRitoAXKrEj8oCykRNFF/vYsyKYlIsCkAWuYea0oOmrUkHkqXqH4z3mLyHUKF++q/BtlBtbcvO3i9ceZDNHxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hU5br8WCHySVbxomD+20xNQ48S0n6Fbv2sbrIDydCro=;
 b=LCthjOrG4COUheXNsNZMfyhGDBTKVBvUqRyDQsX5lMDSkjXpy540vVHhqDP49zLXAjaOykZS1SAX+fqOwS+UlXLTFx0z+cMjK2JOVFdgI9TluAWiAAwz/o5CpIH3EYOWm0mrBMa2XizMRRH754lMJcMrsJw3AQYUUcikRdqSDO9MT3kz0l8EcFRw315oEQk99/qC8MgVFFmBLXyfiygM3JlRBsDved1Q+K+CgylM4/mPIeOqMEjH+CygLU7cRocE/pNwtVNL1dzOZWzGRSLbXdP/GQ2OHbV5kcqs/NajwEjvUHd2MoEsDkayGDRFnuPZD+tyOMOj4+u3SpDnvo2EAg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SJ2PR12MB8955.namprd12.prod.outlook.com (2603:10b6:a03:542::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.21; Tue, 2 Sep
 2025 14:32:17 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%3]) with mapi id 15.20.9052.027; Tue, 2 Sep 2025
 14:32:17 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Tue, 02 Sep 2025 23:31:58 +0900
Subject: [PATCH v3 04/11] gpu: nova-core: firmware: move firmware request
 code into a function
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250902-nova_firmware-v3-4-56854d9c5398@nvidia.com>
References: <20250902-nova_firmware-v3-0-56854d9c5398@nvidia.com>
In-Reply-To: <20250902-nova_firmware-v3-0-56854d9c5398@nvidia.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: TYCP286CA0362.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:79::16) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SJ2PR12MB8955:EE_
X-MS-Office365-Filtering-Correlation-Id: d09f8029-9b0d-4390-5219-08ddea2d8494
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|10070799003|7416014|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SUFtMXBBTE1rVzJBeVpmdTVlZUlveDl5Qnh5NG83QTZDSFlrbjlGWFQwck1B?=
 =?utf-8?B?QmtoZEMyTlZRY3Ewb0dHNytGL0JiLzBpNlQ1cGRtNC81VEcyMWxSdkc2Ulh4?=
 =?utf-8?B?WnIyekMzZWhPcm1USUpTYlRKRVNlUXJxQjlQRnBDbFlVRVdxOG9Xb2RjL2pw?=
 =?utf-8?B?aUw4ZVJGVFgyd3BMQTFTRVU5bUVNQndIWVNrREF3TjIzR29HY0FkNXZKYmpl?=
 =?utf-8?B?S016NDdqREREeW1vcm84MGZSTWhTald1VGVXMENlM3p0NENMYktCem5DNGlE?=
 =?utf-8?B?Y0E4WndNSHRaTmJJd09KeFlqNHd0dVQvczN5NnM5MDJSczNobFBxS3ZDMThZ?=
 =?utf-8?B?K1B4SFVVUlJMUmFpcll2QVF6Zk9hZU5BdDBQOEIxSFNIdGgzZGdoenN5eStZ?=
 =?utf-8?B?TFZad1Y0Q0YwS0tRbFd3Wi9tL05YRklQTXBQdVZjRVo0ZUJoNlNvejJpMDhZ?=
 =?utf-8?B?NWxtSG9oa2xjTjdJREJJZGU3RFBuaEVPdnptMnJKM0phaUxOOTBOMzl6MGFP?=
 =?utf-8?B?Y2w3ektjeVpXeGlZVUR1eURvU1g1UGp1aDdUclJlMkNTQkJsbEg0aEtERmE4?=
 =?utf-8?B?dGVqbEFZbUxNRTg5YllwQnJvbnB6eGwycnRWSkd4R1lvdkh4ZmNmTXd6NFZT?=
 =?utf-8?B?V1FTN2RJUVdEeFpBNWFjL3NnQisyMllHUGk2eFFMZ05FMnlwYlBVS3NRSm9j?=
 =?utf-8?B?Slk4UWQzS2xMQmFaSTBsSFk5R1AyekZqSEs2MUd4WmhOWE1yOEtlSXFPckZP?=
 =?utf-8?B?eWhRWnQ5U1J5UlEvWVkrK3pOUFU2QkcxcmloOHdCdmo4d2hhTU5UOTBOOVhh?=
 =?utf-8?B?anZ3TEt3UEtNeUN0T1N3b0JmQmNWUStNaWRSMTh6ajduQmoyZTFJNTBTamFJ?=
 =?utf-8?B?MFRTV21leXJvc1c2ekN5eitoN1VDRW80NUlIVXg4OS9DdXVjRm42dElNKzB5?=
 =?utf-8?B?SDR2UGNBZzNodGkraTB5VEJxdisrS05HUTV2NUJTZWZQRmNUK09STU4zdG5R?=
 =?utf-8?B?R2twamZld1dibTVVTUxYeDZCbHFwZ25iWnhEbWlhT3RzdHUzdTFKTmVIMmxx?=
 =?utf-8?B?eWQ4VkZpeEt3NDVDZzdrQ2FnS1R3QlZiMUREcXd1MUVWblFjSlhxZnhkZFk3?=
 =?utf-8?B?SUVqbTh5UmtHbTVqdzBvc2NJNnZCTW9vZkRPcXZQV2p4d2EyVTJCdXBIa29r?=
 =?utf-8?B?Y1JxeE1mMmJIZmpJbmdDWHkyQVpNcTZLbWIrRm1KRXpiTkZ6VHg1LzlnNGpF?=
 =?utf-8?B?UTh4OWJwazJNMDd3SFpEWnlPR0sxbG9oM0pnWERxTmh5QXY0QjF3ZytoS0hw?=
 =?utf-8?B?K0ZYN21HalRYbjhFcGtGMlhLc3FOMGFET0o3LzlxSlRwclZSU0NmbVIxSEdl?=
 =?utf-8?B?Rm5sNGhYVFZ1bWRLeVJCZzhTdFhheElleHJ3STREb1ZlMTg5R1F0MmpKaHJ6?=
 =?utf-8?B?aERHUEM4eG5OZXNMMGJlVmN0N05hUmNLbzVqMWRLRExCbFFLTGowWi9JTFpw?=
 =?utf-8?B?TkhKWXRnczJnMkttUERvS2g1Q01UTTArMHJvN1JTeTQxOEZEUERNWDRsa2lv?=
 =?utf-8?B?MURyT3ZEZlYrdE5kR2ZsV1phZUluUFdlV3d3NzVuSTUrMnVTWWN1Y05jWXpR?=
 =?utf-8?B?QmV6czIxU3NVQml4ZThmVjVBTGwwYWZpVWRhZGgzOXB1dHFOMmFYK0JyeXZF?=
 =?utf-8?B?YlFzd21rbEptcGNla0JIQkZPQjNDMG5GK1FTKzNjcnAzdTFwM1RkVXFTb0xy?=
 =?utf-8?B?NFYxRC9jelQzMGl2WVlVOGVQSXhhV0I5TkNsUTJXMnJ1N1hiOTJiY3RaSSt3?=
 =?utf-8?B?anBhYmQrWkhGMlVwenpmdjZIV0UrbEhtTlhYYlhlZWZMaFJzeE14ZUx5KzVO?=
 =?utf-8?B?bjl5dWZHZzZwRzNmR09ZRVpUaUtBVzl3RGdRc1NKQWJZWHRNdWJudTlHeVNl?=
 =?utf-8?B?bHJIZG00Q3loSkhvT2o3V2tUT2l3eG5yNWFJcXFtMU9lQklaWlJmb2Y1eHNM?=
 =?utf-8?B?Ly9nTEhjb3NBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(10070799003)(7416014)(1800799024)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UldYY0pGY1BseGp6ZHdzR1BuT1IxMWpIZFBQQ0psUWF1blJvdGVmMXVmdDdH?=
 =?utf-8?B?QVMvTFpqZVp4QTVBeFpkOGx5R3pJYTh3dVo2NWk1aTJSTjB0RktZNUc0MzZi?=
 =?utf-8?B?a2xVMS9DWEpiOTcwRm9XVEg0M2VnUEkrZW54aXFVVU02RHFBK0lPUEFhQUE0?=
 =?utf-8?B?alNiQ0tWK3k1TEpURWVLKzdMZVh3Q0E5VVBEQzI1WEMvRkpRR1FkYWJUYzZ6?=
 =?utf-8?B?OGxjcGFzWFZpN2liRVpOWmZBSjFpb1RwSzRoMThKMzNxWXBhc1hqZ2gwUGJH?=
 =?utf-8?B?eGNhRS84SHhhMmppcEpmSXlQSHNoZzNOUlp2K0dmSmhIMmNncDdxQlRiRmZZ?=
 =?utf-8?B?bEFBZUpKNjBEb0ZjT1ZiSys1bnZ4enF0SUFIcXJ0dFUzRU42djROOEdhSzN4?=
 =?utf-8?B?MUhDQ2pTMmRhSlZobWpXbW1IblZLb1FWcVJJcU1SQndQYUx4K1ZxYjg2SUNj?=
 =?utf-8?B?YStDSGQ4b0pKbC9OSzhMY0lHNFJtTjU4TkNXdXdxTUc0Qk9qNGZkS2kyZVI2?=
 =?utf-8?B?dERERnJ0Zjh1UDBLYmRJRm83bzZpeGpoMGRQNFJ6UGN1MjJreTlrRXFSbUFK?=
 =?utf-8?B?Vy9ING8zTWRPL2hMeGpMd2ZtUUlxTVdzajV6NEQ4SzVhdXg3VkhubDhQWE10?=
 =?utf-8?B?K0VndWJBUlpESEwrWElNMitiNXpvU1ZncFh3U2ZXQ3kwL2dTMVBYM3J2T0pV?=
 =?utf-8?B?SE0ydGdwVmlrMWJLaXBqQ3BZUXpLS1ExZ2xFZW5qRWY0dFBiSkxXUi9xR2Vq?=
 =?utf-8?B?SXp5V2hjVDdFSXRoR2htMk9JOG45R2JnV1llYlhuN0x5UE0rODNWVjZ5blJq?=
 =?utf-8?B?UkZVTjFzbzE0N0YvR05scDE0TWxOby9JN0tWL05ncllrOUcvL0ZRWUVrUmE5?=
 =?utf-8?B?OEd1dmoyUHVGZWNqdEVuWGNuZHlXbjVGNnZVdVlUbmJyZUJxMmF1bnl5M3hX?=
 =?utf-8?B?UUkwQTF1aWJHUGFHRXk1QTFwUGkwNmxDVWlZSDhWdk8rTFdyYlZlR0VGOGJS?=
 =?utf-8?B?NUtJeFY0K2VSd0NCdEVSUDh0bjQ4SlI3K2wyQlZUZHUzU1BYWTQwMFc5TUp4?=
 =?utf-8?B?RnVVam82aXgraCtPY2tUaFBTWkV2TG1lUjA3YkxlNVZHdjlNVUx4OWxYK2Ri?=
 =?utf-8?B?YXhOUTQvbVIrTHduT1ZPaEZrMUd5WDk1U3dVa1hUeGhoSmlZSjJid2xic2hE?=
 =?utf-8?B?U3pOMDlsdmdtSzR5M3ZvWlZPMlhocndWeDJQYzdNaGZ1MjZMYjdzeXFBQVBE?=
 =?utf-8?B?bnZhUXhCY05uK2d1ODAvQzYraTRWL2ZqY09haDBCRHpSa3k5YXN0M1V0NmNW?=
 =?utf-8?B?MmliM21Zd01UbGhRUVhpdEZibUhVMGVoMTRhWjF2Yld3dE9vRGtaUmlJNE1O?=
 =?utf-8?B?ZUJBM0ZsMnBxUk9jZDc3ZUlLbnNXUDNNWnBQcjBnZ0NPcEVSZzl0U0NZK3Yx?=
 =?utf-8?B?UVJDWmlSakdEOWlCcFZKTjd1UElMaUhTbHEyZXYwSVpqbUtWeFhmQUFoRnVF?=
 =?utf-8?B?K2ZmZGErclhrV25lRzFRajlhTDFNVThzbjExbkN0UlZaVkE3MHBCZ21HUUov?=
 =?utf-8?B?WjBFRHlHbS9Na0s2ODYzM3RXMHNLSTRicmk5TVNjTkNwZkYvQXZWY0YyTzFV?=
 =?utf-8?B?bFUwYUI5dUNrWmg3a1ZEajFteTFUK0d0ZnNhTjZyQTJ6bWJHR1JNZUdGUXNm?=
 =?utf-8?B?Si96a0dKY1dyMDQrZ1hCYisxNHQ3dE1EcHRnRytiMXo3UzVKcmdtT2pRK1h3?=
 =?utf-8?B?WHU3YnNQb0kyMWV6akZqeWJNSmk1SVZxM05MS2xTSzZiSmZZYnlzY0pnRHY3?=
 =?utf-8?B?UTR5Yldwa1NnT2grek9odFQ2cy94alVrWS9xVDUrK2M1MTZQOGRkeTdCUzU1?=
 =?utf-8?B?L1hFcUo4V2tvZElKbjBjODBHNTFBVC85enpqV1IwaDVLVGI1Z25yQzBUZm9q?=
 =?utf-8?B?V0d2K1RMWGc0OHo2SWVNWG9VRzFSckZPUktRNk9JN0lmS1FpS1lTemV3WnpV?=
 =?utf-8?B?Y0tpZlMxNzVEdFFHLytadXNWb3FmR2svQ1BBbjUwSkZkN201MzJ4YzM0aTlj?=
 =?utf-8?B?VlpQYjU0SWh5aWVIa1JUd3ZBejdUYi91bDFoRk1WOFlNU1krWjVWQTVNVEsy?=
 =?utf-8?B?emwwSXN5d2dhdkRCc1g1OE1Na05RSEpHUGdHbDJiVHIvQlJ0RjdaVkc0NmF1?=
 =?utf-8?Q?n8LCh87dDTFJuhRehMwtg9CbX9LegYxY8PnDZoBtTbzp?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d09f8029-9b0d-4390-5219-08ddea2d8494
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2025 14:32:17.6379 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: peEiSF64virOccL0q2EXLCQCbQt9gs8+Q1r4Iiry+iKzVKoWguF+OIGUpDHYx3NZtsLcXFXaBa71C57Fm/MMTw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8955
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

When all the firmware files are loaded from `Firmware::new`, it makes
sense to have the firmware request code into a closure. However, as we
eventually want each individual firmware constructor to request its own
file (and get rid of `Firmware` altogether), move this code into a
dedicated function that can be called by individual firmware types.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/firmware.rs | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/nova-core/firmware.rs b/drivers/gpu/nova-core/firmware.rs
index 213d4506a53f83e7474861f6f81f033a9760fb61..4e8654d294a2205ac6f0b05b6da8d959a415ced1 100644
--- a/drivers/gpu/nova-core/firmware.rs
+++ b/drivers/gpu/nova-core/firmware.rs
@@ -19,6 +19,19 @@
 
 pub(crate) const FIRMWARE_VERSION: &str = "535.113.01";
 
+/// Requests the GPU firmware `name` suitable for `chipset`, with version `ver`.
+fn request_nv_firmware(
+    dev: &device::Device,
+    chipset: gpu::Chipset,
+    name: &str,
+    ver: &str,
+) -> Result<firmware::Firmware> {
+    let chip_name = chipset.name();
+
+    CString::try_from_fmt(fmt!("nvidia/{chip_name}/gsp/{name}-{ver}.bin"))
+        .and_then(|path| firmware::Firmware::request(&path, dev))
+}
+
 /// Structure encapsulating the firmware blobs required for the GPU to operate.
 #[expect(dead_code)]
 pub(crate) struct Firmware {
@@ -30,12 +43,7 @@ pub(crate) struct Firmware {
 
 impl Firmware {
     pub(crate) fn new(dev: &device::Device, chipset: Chipset, ver: &str) -> Result<Firmware> {
-        let chip_name = chipset.name();
-
-        let request = |name_| {
-            CString::try_from_fmt(fmt!("nvidia/{chip_name}/gsp/{name_}-{ver}.bin"))
-                .and_then(|path| firmware::Firmware::request(&path, dev))
-        };
+        let request = |name| request_nv_firmware(dev, chipset, name, ver);
 
         Ok(Firmware {
             booter_load: request("booter_load")?,

-- 
2.51.0

