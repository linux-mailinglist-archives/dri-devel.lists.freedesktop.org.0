Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C101FAAE17C
	for <lists+dri-devel@lfdr.de>; Wed,  7 May 2025 15:54:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B2CC10E7F8;
	Wed,  7 May 2025 13:54:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="XbfEI6v3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2077.outbound.protection.outlook.com [40.107.244.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D0A810E7F4;
 Wed,  7 May 2025 13:54:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n302FMfIkj0JTK6nbUZ0dv1t3lUP4xDCsbY+cSQULUTdtre7kpSm+FMODB+jIVJxKVwxG3chYFVz957OeIV6gY3+HoSwCOTxJOynpxelJ5hRZzwgKhNAKOQ0QyOrL5miB0q87vVBc55t8h7vcSWYqdGq4yCP97VdfD0nNAb3+DcCkVFTqk4NjA00AxU7cqlnf2vF1YxLIQbBfs6uQ7rMGUAIPJsz9stv4N0j6b9aVbV180MBu/D508ZKDtMH7Qsrj1xUOBIOXVUMhRqVIi5YP4M25x5GAJiCjyS5jB8EmajNiuaUdI9Q7VCxcrkPliANmwGJsiRY2ZM3UQzn+DPg+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m6ZBqfoQKM33N4zK3mwmG9BJaMULtw2+GxaJhd4dj0E=;
 b=hLzGBhEshajDJhe8mo9w7dms2PLCp87wWY+xhd0osb9guYg/eGDcDca34L+htDjEyEk560DWJj9uVLSHR5fbRM+sFjB6H1usdH6VAH1bIonaGjdhp+qkD/axZQfGmd4ssAF0/Bb91FMbazaB1j8eG09oNJ+MobVowEHH42qDWVxUDUe+kj1ohjwXBTDcNDoiC1YjpxB/SjkDs2FD3WiFswuTjEVM9OS7gTTW5Fi49gz99Hms4pnSSdSnl1dkVkYMsUzUB/+Rs9FWg6T94eJTby09L9eQb8x2JGcV2EQu8kGkIKoIooemqTSu9fSWIZ+0Ks6wOLhKQxCPgNFf7TtQiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m6ZBqfoQKM33N4zK3mwmG9BJaMULtw2+GxaJhd4dj0E=;
 b=XbfEI6v3kF0EG8Wc8i8Ex54iGRIGjtt0r05WmGYmOrNJ+7NRVKokYLc+AHn9iti3KBY6OLXFiNrdtg9lt/KvZ/hcbKCjQT0TRyPtWAypylytHkzwQJoCeReWWgmxZWRMYkPzlp1RFlYtutzzqD+jEjJIjPJnsuIC4opAnKo+IRmn5yklw+Dsz4dKQjqCk0i+W4tPsyU3jOvq32uIpHc7Ld9Zp4QlAXAaaL7t9hi1ONrSdFWBuaG6QMleOg81CNKYz1zKzoEjmulbkmiuwM1f1f1F1dnj90lAXQQkY0o7ROGCm+vtpF5rQGwfozlopzJnhdeWWn5cGJ61gAxwDJZIOg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SJ0PR12MB8115.namprd12.prod.outlook.com (2603:10b6:a03:4e3::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.21; Wed, 7 May
 2025 13:53:53 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8699.026; Wed, 7 May 2025
 13:53:53 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Wed, 07 May 2025 22:52:46 +0900
Subject: [PATCH v3 19/19] gpu: nova-core: load and run FWSEC-FRTS
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250507-nova-frts-v3-19-fcb02749754d@nvidia.com>
References: <20250507-nova-frts-v3-0-fcb02749754d@nvidia.com>
In-Reply-To: <20250507-nova-frts-v3-0-fcb02749754d@nvidia.com>
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
 dri-devel@lists.freedesktop.org, Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: OSTPR01CA0072.jpnprd01.prod.outlook.com
 (2603:1096:604:21a::11) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SJ0PR12MB8115:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f859432-9a52-4a7d-f966-08dd8d6e9a27
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|366016|10070799003|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?c0FzdUNPN3h4S0dMMFVnWE9xTDkrd2NKSEVTenhYYzlpVTRpeGtndTdPa0l2?=
 =?utf-8?B?VlJzY21nL1E0VjR4Q3AzbGdHc0V3OGtqb0U2TjF5cllRZENYNDVPb254c0Q3?=
 =?utf-8?B?Nm5tMEZzTDQzdkxNNVVZRDFKeFN2cU9LNWNiMEo3WHRvOHZmeitzdDRkeVhM?=
 =?utf-8?B?Vmh0djV0VzlOYi9Nblk2YTFTZzFGQkRrY3RoNWtxQUhFS1IvVmtRbGVYT2VC?=
 =?utf-8?B?bFBnU0xGZFRCNi9RNTlXTXBGVFJCZnpOK05kRTdCTW9WbGFxT2cvZGVGNjk2?=
 =?utf-8?B?akRvUTJXZmduUlN2dDk3UFJMWFBKZFJ2T0s4YnVwV3h4T08wMHpZNlg2VThM?=
 =?utf-8?B?allZWjQ3NWViWW1rZURBaUhoYTRFZlpHNHJzeGRuT1pQMlhtcTc4cE9DTXNL?=
 =?utf-8?B?N25kRUlvSW9XMVpaZU5wQmxvNCtCTjJXUVk5NTBmeStValRkU2lDN2hhOWc5?=
 =?utf-8?B?cTFzejVvV3lOdFYzSTFVS3JxN0ErODhHajI3RUdUSitoaVVUcTRXaHFxZE9E?=
 =?utf-8?B?TjlVekY4MnY3d2RYSDR3SmdZWEUzK0VkSFFRaTN2ajRmSnY1WURWR1RJTC9U?=
 =?utf-8?B?ZG93a25Gb0R3VmFhMzF3eVpjSVZFVVRoUnNyVzlxZEVqb1JpVEZYMmtBTExt?=
 =?utf-8?B?cDZUaWJXR3Q0c1VYSGdEb0FTeDVCZU9zdU9zbjhmMElwMjBybGdVSmhLNm9Q?=
 =?utf-8?B?eUtlbGFjQXZ0cisyK3dBcUQxV25jdWVDdjdXditMU1FUZUV2ZS9NUHV4OXkv?=
 =?utf-8?B?cE5CQ0tuU0IxdEgrZ2lKMHZDQTBjUmxaMkMzRkF1bDdPdFFiY2JNemFPbk91?=
 =?utf-8?B?dk1hUUVSazVjWlg3TGxkQStmQ3JBMUNmb2owdXllbGFuLzZZdnRFeEIrVElE?=
 =?utf-8?B?WVZQc01Telh3ajZ5OFNqWUdvZkZFdElscHNPbTdhZTAwRnRLUWE4dm1YYnhM?=
 =?utf-8?B?YVdyWWJ3SXVMWGZnVWlFdTV2cWJuMEpMeU9IWmJyQTkwUnQxNXdFNXRvYWU2?=
 =?utf-8?B?SlBocWtvYXlvY2lWdURRdWh5Wm9OM1FSb3h4aUNieDNDSnB6RWZ3Z2RKb1FR?=
 =?utf-8?B?ajVkbHdyd0FrK3VIZUEveEx2V1NBZ0dvblpuSXZXK3A3SzZPdkNOYTFjcmt0?=
 =?utf-8?B?QUdTVDFxb2cwTW9DQURNWmV2KzdVRGpWTUozZnBiaTZSL3BnVXlRRTNmaTFN?=
 =?utf-8?B?Q0hkWVo4Ulluckd0elNPQlN3VTJ6dTBadGdxZkp3OVpLeGJDbUMrR2xab0E2?=
 =?utf-8?B?Y0RFeHNkUzl5WmZXMGx1U3RWcFhkMXNlV1pTemVJR2dKWms5ZXEwRzZWVy9G?=
 =?utf-8?B?VVBGK0dOZDhvUUIvVCs2QmkxdjB1WFlKRmpQTHNyaDMzQStJR3hLbnljMk9u?=
 =?utf-8?B?TVZUZ3p6VW9nNHZaV2NzSUptRmd4WXZkYTdoUGErQ2dhYzU1WlpZMnN5ejFv?=
 =?utf-8?B?QmZ3M3RKZjlRenZvd1JFS2YwekhHODFtVXZTaDFxU2lqQ2pDRmE1S1JIbGVD?=
 =?utf-8?B?M0llSFdKUTRUYW1wK01zaTlZRk5NWVR1a2g1Wis1aFBtQmVrd25GV0lnRC9a?=
 =?utf-8?B?Y1VzZnZleEdBbDdTalhlNWk0SmplaWR0bjQyeUUzai9SVUhXdm43cGQxVG05?=
 =?utf-8?B?SmMwaWgxVTdObHZacWIrRy9velNxWkNmaUlselZ2aU4xT0FMUEhVVDlNZmhZ?=
 =?utf-8?B?a2RKS1F1N2xzUGlJSEJGeDcwVU9HSnd2bmhUSnlkWXF3UUZQZVBmeFRPQzVJ?=
 =?utf-8?B?cGpQTkIrc2JORm9EMk5nS2NvWlFyRVlVNnFHT1RUNXNkQWxoRW9CSkFZRkNk?=
 =?utf-8?B?dSs5UnNJZGY0eDFrbmpkeWNHMjVob1RZbG52cmNSVmFHQm5raHpoZ3RhVzRI?=
 =?utf-8?B?Vk9ERXFySFAyWElXNXFFSzgwMnVpbHcwNENZSnJocTlYN3REZ2Q1M1VwZ0dD?=
 =?utf-8?B?elZmaXVXUnViem9odXJVUHd0TnJxeENxUEViQS9pTUxxWWE4VnMzQTk1dEdr?=
 =?utf-8?B?eGhRSjlMTXZnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016)(10070799003)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y0tWOHdjVHhXSmNkR2wyQmhwR3IvTXNYb2hnbjI5ak52Ti9BVytaelQzWDBU?=
 =?utf-8?B?YmdDTDdWSnRveU1JRjI5VmYxNis5RXhTUm1Ma21sZUt0T290dWR2WnFhT2Rh?=
 =?utf-8?B?OEFMZmgzSmNWRDhUQzlzdmVuL3gxcnMzcG9UeS9Ic3hqRUxDeUpZVTU1TXpj?=
 =?utf-8?B?V2tuaUFmeTBTQnZwQnVQQ2tMcDNoQ3QzOWR0L1dzZ3AvMHpJb1FRSjZSYVE1?=
 =?utf-8?B?eWxlcEtENG84QllwZ2tqS3JZa1ArcVdyQU9ocm5EN1lHOEV4RENpeGdRY0pr?=
 =?utf-8?B?QUdOUzhSc3VxY2xxUWZDdjA0L3lMRjBLMjRFYllpZW55VVNieW9VckZabUsv?=
 =?utf-8?B?eXBQOHcvT0U3T09pNm1MRFE2bTNKVEZkL3Y4RjRkVGQwZnA1Y2Vra3pyUUZC?=
 =?utf-8?B?ZWNlVXFqem9xclJPcmxjVTk1RitKYzA3b2VleCtMNkNIZGpVN29nS2xoaUJI?=
 =?utf-8?B?WVVkcDd4bjh4a3hzaE9nYjQ0OXU0citzU3RVenkzTXpzRk43KzhCdGorSU1w?=
 =?utf-8?B?dCtSTG5FNEkxUTR2ajVXQ29sZWI3eFlyUEgxeHp5Y3QrUmcxR29ERHA2clFN?=
 =?utf-8?B?R3hyYXR5bXo3VVgyb09LM0hhVkRhdlQ2cEhWeGZkRWdiRHhqVzBaMUFqTVFv?=
 =?utf-8?B?SytIV0k5d1I2WlMwTTJQU1FJK1Nwb21JcjJrNGhkUUZXclU3REx3MTN0QkNQ?=
 =?utf-8?B?aFNxQ2ZjbkN3ZUFKd1RCSW1xeVNsc2RSWjdXc1NMemFzS3FqY3RQU1dyQW5k?=
 =?utf-8?B?WTZndE94K0ZCY0l2NlhQMVduV01wTDNiMFNNaFRuVHJMMVBsemFMQ0Q2aG5G?=
 =?utf-8?B?YURrN0l5Q0VYamdCWEVJd0JMVmduWElyMWtxbC9uK0kyODFjUWoxNUVlSExw?=
 =?utf-8?B?NmJROU5uSUdRUENCTE83V2JZdkF1WW9HeVRKa1JXSXFYZFhybGhETmZJUFZS?=
 =?utf-8?B?aXN5WFptT0MvNkk0d0tuVEkxWldocXFKb3hqZWVyNmR2NmJrWE5RdFpWdTdj?=
 =?utf-8?B?TmRESVhFb09PNEtKV2tpTEFDYzQ0T3pucmVINTV2cFE0NEhuQXBMYk1UYlFR?=
 =?utf-8?B?REY1ZlVGbm8rOW5ZVysxdGRyS3JvR2dYN0hrb01iOWc1SHRETktreHJNam80?=
 =?utf-8?B?OCsvaER1VlFmK2FNTjBORzZkd3o3dExLZEtoeGdIZS81dkptMUhhSm5DV05t?=
 =?utf-8?B?QlFkUHVVVzhzOURTb2FJbm42TGlmYUhDMDNjNEdMSDRKalJaeUJIb0l3K1Fp?=
 =?utf-8?B?QTRFUFh2WHBtOE55a3U1MC90aVJKc3Y0Zjg4SUY2Yy95a1Z2eWM3T2xaVVVz?=
 =?utf-8?B?UDMrWlBVUS9JVWZUNnFEdWlJc0pNR2ZxdExsM21kRmx6WWgwSUpXbVJRT3Ju?=
 =?utf-8?B?U3VPZGNsZWN3TmpZYXZkKzNMa3k4eVZKMmgzVlNCMUd5bnBrWjJTVFVGUzFO?=
 =?utf-8?B?Vy9Zd3JndFJYTFlXT0pFUnFxV1kza0VGTmdUcDdjckc5aWVyQksxclNzUHlL?=
 =?utf-8?B?aHBNcnJEK2s0OWdXamlpeEtaNFc4dVBEdktDQXZnS0w1N1crS1ByODB1aklx?=
 =?utf-8?B?b0c3eFdEb0hLbmtsaDhHaDlKRzdtRFRhSmpzN0ljN3Y0ZWR4UHo3Wnc5OEEv?=
 =?utf-8?B?RVFYeVk1MlRXU2JSTkliczJxMXIzUU1FOC9nTytpRkx2TlhaNUpvdW9Dcmwv?=
 =?utf-8?B?MzBISmxpUHRHUktXYy9vUWorNW5SQWhMRElZZjV6SXk3TDhERHAwZVJZdjJF?=
 =?utf-8?B?M293VnFjWUpVVnNTRFo4M2IybWRSYzJYQ2JuUHdGNkxWeWZ5OVNPUjdMa1Aw?=
 =?utf-8?B?ckszUVBkOU1DZUtRd25tNUdnSEF6WjVLbG50a2ticXBRYVRyek9ob3dsV1BB?=
 =?utf-8?B?MXNnVE1UY3pGL09KaFN6aStwM0RKeXlwQS9qakFyNXFERlpzNStObGR0WGRX?=
 =?utf-8?B?Qkh2dzk3RXp4bXZGYlB0R21EZkpEYXg4Q3VBUlp2ZFduNE04ZUx3NVNhcXF4?=
 =?utf-8?B?djdxMmdKUnpIS1d3emk2Ty9lcVFFYWlLT000UnB4RHBzMjBHak56a2hNTC91?=
 =?utf-8?B?KzRvSCtHN0VBL3pEWjlWV2p3aGFKMk9iMG0xVFNzSXdNdFdvSytXb3ArdU4x?=
 =?utf-8?B?NFhJTTRtenlIbGFEVExZSEI3Y0hmUVQ3TGt4cE9nUnpTRWl4UlozRU41WkVZ?=
 =?utf-8?Q?4OdiVrerH1lJEHATOeEBeXoEfj0Tr9ZIhw4syuHLvu8C?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f859432-9a52-4a7d-f966-08dd8d6e9a27
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2025 13:53:53.6494 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SnndQxFD8REAO4gTkpWOJtn5wZ/oiteh0YG3ga3cM8vPB0S4UG3usPccWL/YklIHRrzIARBvxjT/I4iAQWq6Rw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB8115
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

With all the required pieces in place, load FWSEC-FRTS onto the GSP
falcon, run it, and check that it successfully carved out the WPR2
region out of framebuffer memory.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/falcon.rs |  3 ---
 drivers/gpu/nova-core/gpu.rs    | 57 ++++++++++++++++++++++++++++++++++++++++-
 drivers/gpu/nova-core/regs.rs   | 15 +++++++++++
 3 files changed, 71 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/falcon.rs
index b6552496ad9c5f8eeda4beaa757c7393f495072b..810a7b4ef0d55fb7bd4bfb7833d5da7df091203c 100644
--- a/drivers/gpu/nova-core/falcon.rs
+++ b/drivers/gpu/nova-core/falcon.rs
@@ -2,9 +2,6 @@
 
 //! Falcon microprocessor base support
 
-// To be removed when all code is used.
-#![expect(dead_code)]
-
 use core::time::Duration;
 use hal::FalconHal;
 use kernel::bindings;
diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index ad71402dbfced2aaa84800a32dbac276b9706803..896986333b76d1192c07093289eddab98fe3f26d 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -250,7 +250,7 @@ pub(crate) fn new(
 
         let bios = Vbios::new(pdev, bar)?;
 
-        let _fwsec_frts = FwsecFirmware::new(
+        let fwsec_frts = FwsecFirmware::new(
             &gsp_falcon,
             pdev.as_ref(),
             bar,
@@ -261,6 +261,61 @@ pub(crate) fn new(
             },
         )?;
 
+        // Check that the WPR2 region does not already exists - if it does, the GPU needs to be
+        // reset.
+        if regs::NV_PFB_PRI_MMU_WPR2_ADDR_HI::read(bar).hi_val() != 0 {
+            dev_err!(
+                pdev.as_ref(),
+                "WPR2 region already exists - GPU needs to be reset to proceed\n"
+            );
+            return Err(EBUSY);
+        }
+
+        // Reset falcon, load FWSEC-FRTS, and run it.
+        gsp_falcon.reset(bar)?;
+        gsp_falcon.dma_load(bar, &fwsec_frts)?;
+        let (mbox0, _) = gsp_falcon.boot(bar, Some(0), None)?;
+        if mbox0 != 0 {
+            dev_err!(pdev.as_ref(), "FWSEC firmware returned error {}\n", mbox0);
+            return Err(EINVAL);
+        }
+
+        // SCRATCH_E contains FWSEC-FRTS' error code, if any.
+        let frts_status = regs::NV_PBUS_SW_SCRATCH_0E::read(bar).frts_err_code();
+        if frts_status != 0 {
+            dev_err!(
+                pdev.as_ref(),
+                "FWSEC-FRTS returned with error code {:#x}",
+                frts_status
+            );
+            return Err(EINVAL);
+        }
+
+        // Check the WPR2 has been created as we requested.
+        let (wpr2_lo, wpr2_hi) = (
+            (regs::NV_PFB_PRI_MMU_WPR2_ADDR_LO::read(bar).lo_val() as u64) << 12,
+            (regs::NV_PFB_PRI_MMU_WPR2_ADDR_HI::read(bar).hi_val() as u64) << 12,
+        );
+        if wpr2_hi == 0 {
+            dev_err!(
+                pdev.as_ref(),
+                "WPR2 region not created after running FWSEC-FRTS\n"
+            );
+
+            return Err(ENOTTY);
+        } else if wpr2_lo != fb_layout.frts.start {
+            dev_err!(
+                pdev.as_ref(),
+                "WPR2 region created at unexpected address {:#x} ; expected {:#x}\n",
+                wpr2_lo,
+                fb_layout.frts.start,
+            );
+            return Err(EINVAL);
+        }
+
+        dev_info!(pdev.as_ref(), "WPR2: {:#x}-{:#x}\n", wpr2_lo, wpr2_hi);
+        dev_info!(pdev.as_ref(), "GPU instance built\n");
+
         Ok(pin_init!(Self {
             spec,
             bar: devres_bar,
diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
index 15ec9b7e69694ff198b5353d562fc1aff5eefd3f..3acec36f2d5701af4a752808e86d71d5f200359b 100644
--- a/drivers/gpu/nova-core/regs.rs
+++ b/drivers/gpu/nova-core/regs.rs
@@ -43,6 +43,13 @@ pub(crate) fn chipset(self) -> Result<Chipset, Error> {
     }
 }
 
+/* PBUS */
+
+// TODO: this is an array of registers.
+register!(NV_PBUS_SW_SCRATCH_0E@0x00001438  {
+    31:16   frts_err_code as u16;
+});
+
 /* PFB */
 
 register!(NV_PFB_NISO_FLUSH_SYSMEM_ADDR @ 0x00100c10 {
@@ -59,6 +66,14 @@ pub(crate) fn chipset(self) -> Result<Chipset, Error> {
     30:30   ecc_mode_enabled as bool;
 });
 
+register!(NV_PFB_PRI_MMU_WPR2_ADDR_LO@0x001fa824  {
+    31:4    lo_val as u32;
+});
+
+register!(NV_PFB_PRI_MMU_WPR2_ADDR_HI@0x001fa828  {
+    31:4    hi_val as u32;
+});
+
 /* PGC6 */
 
 register!(NV_PGC6_AON_SECURE_SCRATCH_GROUP_05_PRIV_LEVEL_MASK @ 0x00118128 {

-- 
2.49.0

