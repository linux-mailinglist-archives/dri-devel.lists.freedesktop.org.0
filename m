Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50234AA5EC2
	for <lists+dri-devel@lfdr.de>; Thu,  1 May 2025 14:59:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A384810E833;
	Thu,  1 May 2025 12:59:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="lNGko3Of";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2053.outbound.protection.outlook.com [40.107.220.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED04910E833;
 Thu,  1 May 2025 12:59:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kDEzmRAwumTwUboKWBtk41D+lGPmWsICRxvG4B+ahVxQoRMQs5n2lRbfp7sn7Rv6azM885/OOprHg41Hs7PN89TDoLwG6QG1DXjSiEleOuYSUQU7qRa01B/d/yjH91zAGNeeXn/UblGV3Ge1L8cnHujfFrzBDK0cKqhBR1MtEyNHNkGRPgsuSOk7miDLZZo6C4w9PSfeUXqh4Zgm9KRy3hrLlON305v0o1hTJ+ieSnF8R1l3ur3wE9uyt4eKfVMTonivAhaCEpT05yR0BSBfc92NGoV7J8lzGJuVSrhSJYxX3GIyRvS/v8//KgsFW8iWgU0KsR6g6v7V8q4EPtiFKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=isVCa1VzJUl+JwRfoKfKrcHX1vEvf/WOS7yEmB7PrOY=;
 b=qOJbHyBJturlk0UpcsVkYx7KvDEU3ZwculANKxVKa/zsDDV9E9iEpwn1DxYqwegvDZGnQtdr/z9ptDLaA3UYQdG7XI8b6qqDfGAU+7GkxzaIBtgz8p9j2UnWnBAfG/zpsHB2sFEI5mtAq9y+q+N4KSCdzY7KhpIMtg/Ox1PvEqzxoIokSH5ITKOFPQ1DWNtNXqPYdX9fT4rMNbyztPGp8MBaGw8q6ghGsz4AabyanImlMoOb3cUbORF9/azXMUx5FC3BWjkyLS8Gzn4gOBpUZBJYoIgOsYmixXDwZ4tVpFbdyaqTJuzwE+Px98wXu0G09ebasAVoY+eBZj8Mc8XcPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=isVCa1VzJUl+JwRfoKfKrcHX1vEvf/WOS7yEmB7PrOY=;
 b=lNGko3OffLyxa+vpf3iGecZ3ybW3V1cGKsuFcRy2OMnNzip1xIBbPl28d0bTEjShNgPbow1h0ZJ59IEEuASVaitu7cl10Yp8iupnJ6bjqqvoA5ZPvxShVqK2JFXmBydKPKJTL8sflWtMhtc9vBjZG1l8+OFGd/0EW8FLfGiVetZzsCdez/ffFh+EdV8RFItIZyVzAqCnshQbcsDNDMiUYJTaBCWeOz2SRpZ69MoktmyWft4tbC/um40rU0oFoFtRQk/iduyseABrvvHb/gboUgGA/HkLAhFDkt8Jl2gT2Yk6MbIc38J5ygmx0pzURoRTc5kSw6NdI49EPOzp2aHYlA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by PH7PR12MB6442.namprd12.prod.outlook.com (2603:10b6:510:1fa::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.29; Thu, 1 May
 2025 12:59:19 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8699.012; Thu, 1 May 2025
 12:59:19 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Thu, 01 May 2025 21:58:27 +0900
Subject: [PATCH v2 09/21] gpu: nova-core: move Firmware to firmware module
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250501-nova-frts-v2-9-b4a137175337@nvidia.com>
References: <20250501-nova-frts-v2-0-b4a137175337@nvidia.com>
In-Reply-To: <20250501-nova-frts-v2-0-b4a137175337@nvidia.com>
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
X-ClientProxiedBy: TYCP286CA0069.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31a::17) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|PH7PR12MB6442:EE_
X-MS-Office365-Filtering-Correlation-Id: 91b24963-5d09-4313-25aa-08dd88affc95
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|7416014|10070799003|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cS8wYVBVYkw0T2FBUGpiQmZraitRRHh3OEhsRDJ0d2p0dW13WEZXdDc5REEx?=
 =?utf-8?B?d0pGcTF2dTQyRFBsTUtReitYZEhLVEtaRFYyak5BcnBpRjZCZXFFVjBZa2pX?=
 =?utf-8?B?RnZ1SkxWMlZyR1R4MVEySDhWZG03b3J6bFMwczh4S09YOGRQRlJNZ1p5am8x?=
 =?utf-8?B?Y1VhbkJNNkhhTVFZeENVUTdXQUp2dmw5WWJoZHpOakxCSmtBeDZtWC81dG5D?=
 =?utf-8?B?ZWJCeW15YjYzeXZ3dXV3TVpZUzJVY2hpanVjYjRCV3p1Sk9qTVcvZm5xaURs?=
 =?utf-8?B?VExpRUdUUm1NdUgyQ3lCVDNjSlozU2tvMVNnRys2dlUxbzAyazFpZUcvdDJM?=
 =?utf-8?B?SWc1ZER2bC9VQ1NDZ3VZYy9aUVh0ejZobTVJbWlUcmdLS0FHSlJldUNyU0NJ?=
 =?utf-8?B?QkxqYXlxOWw0ZjZUV1hNVUFoNU00blYwSUhIS2gyZDVnSzRQOVBCeU94U2Q4?=
 =?utf-8?B?aGcyNE9JekJpZ0h1NFRhS0dKbDVIdkdLWkx5N2dEczkzUmFRTlBKVFlFMFVy?=
 =?utf-8?B?citYTDhTZWpMaWl5NitaWnZrT0h1S0Eyd2hlTWltTmJ3cFF1K1h0OEwzL0Fa?=
 =?utf-8?B?OWZRczF5UjZ6V1AxT2IvNmppZkQyNkRNMUVUNHF5My9tRzdhYnRQc2VNemNJ?=
 =?utf-8?B?Z3FONUMrbVhYYm5keU9rUTFTamlkV1Z4NGNCT0xkSzA1MlFWakdNWVZGQkll?=
 =?utf-8?B?ejEyNTJTMjhvQWZ4WkRVc0hwSzdreEY4OHNORm41ajlTUFpsRlFVakNPd3ll?=
 =?utf-8?B?dnFEWVVRaG52SC9udHpUajVWTXNHeC9DMy9ONGdicVB2YkVCNE1tTUxsM3cx?=
 =?utf-8?B?dXFEUWxlZmJKMTB1Z29adXJyL3FqemJSc2RvaUZCWlNmbjJkU3N4OW9NUEdx?=
 =?utf-8?B?aEs3QncrQjhkMHJHTVJxVnl4bnRCb0hiUUFzNWVtbGZDZjY5aUJLQThuaHcv?=
 =?utf-8?B?UUk5LzRYNDRyaC9MK3owd2ZYbXczb1o4OVJKT3NNOW5QRWpFQURDaG8xUWFH?=
 =?utf-8?B?QnNocVNoM0NDblJQV24zU0dEVyszUi8xd0dURFlrS05LUFBBR280T2N6MG5V?=
 =?utf-8?B?R2ErWTEwQTluQmJxc0s2N21RbTN5WWhpeXR3dDhWVVhLS0JmT2JjUjg0M1U1?=
 =?utf-8?B?MFg0KzhZZjJEYmZCTWJQZzUzdnArbGJJRjloTHprdEtVZjNiVWVyanJudkhR?=
 =?utf-8?B?a1VSZzAwS21qQXN1YVhGMk5vdzFYdFNaMDZUZEttZFNva09PNEg4RkJVWmFs?=
 =?utf-8?B?TlNZRlJqS3ZQbEtZUXVDWTRrcWU0Y2JUZTNOblROUzYwMDFGdTdtckdQKzNO?=
 =?utf-8?B?TmtkcnNqV2dNY2hJcTFDVmFvT09nYjhQU1NhR1ZzMGdDSkhmRThYMVlGOGtK?=
 =?utf-8?B?S0VsOWgrQ0tuYThNQkh0SGg4WEdBOC8xYU11NlFzblZPaUVpZjNGSkpGbTRI?=
 =?utf-8?B?Tkp3Zm9TeTlaUnZsWFVGVzRsZStCazN0bk1kSlNYanhuR0RpRmNaQkVrUDdw?=
 =?utf-8?B?QXBGZEVyUkpUeFRZcFhOYzN4VlhlalBlemk2MXYvaWxOL0xUOFJ0djNXOUE1?=
 =?utf-8?B?a0lxUUVNM3BKb3pVanJCS2FyOGZYRlI2dDhQQWl0RHBLbGo0OEo0Z0tBYjMx?=
 =?utf-8?B?L1M0QThpWm9ld1Nwd09pME5RMm8wTlJ1WHFQRVpaS2JwZlZIamp6cFlLT3RQ?=
 =?utf-8?B?N2JTK0s2QnJnMEc2QW1sNUxJOW5tSExxWHFjTW04Qmt6bXM2SG9aZXFNRW9v?=
 =?utf-8?B?VEJkakVjRndBRFFTSjJoOWloYVU3bVd5MWlEZ00zSE43SWs5WVZtZDR6SnBG?=
 =?utf-8?B?dFdoNDl0SzQ1a2ZiNTFncnlrUllYc0FnUFIxL0gxQkNzS1B3K2I5UUtueWRk?=
 =?utf-8?B?ZU00bWRlK3FnVGkrZEpxSjh6RGo0eU9saTBNWThtb0o2N3BqUVptd0ttYkR5?=
 =?utf-8?B?UFI4MzFmU1hFM1lDUU50OWFXenJBMmRGZnkwcWRuNkV3RzROMmhDNGM1dWlm?=
 =?utf-8?B?Tm5LeG9sT2F3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7416014)(10070799003)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L2J4S0pET05WRDk1OUtQMmpPSzY3MlFISXZkckhuczN1dGNDNUJtYUcvNFdX?=
 =?utf-8?B?eGE5Slo5STNqSGVNUUJXUEswVkZ3R1hERUU4MTNxNDZMYllSNFpuNjlGczg1?=
 =?utf-8?B?TG5QTnN4K2FGSHpFRlk3U01OZEpZTyt0emt6MVJXRC82U3NVQnQzZU9SRDBC?=
 =?utf-8?B?VjFkTGtzTHBVTUpQclIyNDBzQldyUEpZZFRPZTRJRjlsL3lacGQyTzVENGJL?=
 =?utf-8?B?bXVRK04wQVFxdUh0Ym9TY3VZQ1Exb2lTeWN1TzVwa0ZuREZaUUlQU25rQUI4?=
 =?utf-8?B?RWhGb1pKZi9RU3FlTFJXR1hhRjFGWlZuQkZhd09xbmR1Q1ptUDdhTVovYlVP?=
 =?utf-8?B?akYrQUE1STFUUExnY1o4TFFBWTVQd3ZtV0VLTGVsNzNqc1czUlJLL1ZpU1Nr?=
 =?utf-8?B?VkVETFdySXJEaXg2aE5yZEdJL3RPR2twdzdsZVNoMExjWlgwUWhpL0VKd2Ix?=
 =?utf-8?B?MFFHM3VSRWszRHFDVEZUcXp3QThwb2lENlBFVWFtRkllTUhBRDZRRkcrc2J1?=
 =?utf-8?B?TGhCMERDMmFGczRuOGtwNnVHUEIwZ2E4bEZGUG1NUUd3LzkzdUErbnM4M2p1?=
 =?utf-8?B?N2JGRmdLanhPaHN5U0V2WTVzY1drS2FHR2gwVDZhaWlvcXNYaGhmQ0RyODU0?=
 =?utf-8?B?dDF1aW5FZXZMYitpTUhtMzdYM1pmazJxcFhSZHA0Nkw5ZHlmNlJKNVpjUHU1?=
 =?utf-8?B?K0ZINGNySjJ2N1pHUE9GbkRnREM3NWl2Q08wWmhWTURlYjRseVlXYnBvbW9I?=
 =?utf-8?B?TGtvTG9veWZWVnMxamhMaFAvRTk2ZDV0MkNLSzZKcXhMOXZvVWtMUW16ZE9F?=
 =?utf-8?B?Ylp3WjU4bGo1azNmVjBpNkk0eng3R0hCN1Vka2kzaHd1MmcyOHkrSENJU1Y4?=
 =?utf-8?B?OUYyMzNWVnArWm9KMVBFcktwRTJzWVZqVFE4ckM2UURKL3BHR1JQZlpMZkl3?=
 =?utf-8?B?RlBrTmQ5aGVESVN1WGJzLzZGLzNlUGxuZmUwMXE0R1duZkpKeGdLTGNFa1J4?=
 =?utf-8?B?UElFTnJ2UjgwWTBJWEExU2w2TDhHOHdSUUZwbStMUU95UlM1WTVmRTlsRkNG?=
 =?utf-8?B?RlpNRzRxTmYwbHAxQUlrYkt3VWVDRkxDNHVlenBzK3Q3UkZvT1NVeldaU3V2?=
 =?utf-8?B?RHVldWI3cGcxaU9HS3JienlhMGV0alVhVnFpV2NRVUVNdVk3ZXpoNG03VlE2?=
 =?utf-8?B?VEduNjNJSHVlaXJxNDVwYjRBOHlKSW5lckZGYStVWkxJdUVzUjZpZTdmaWNC?=
 =?utf-8?B?SXo2VTl1SVpKcHA4REpYWCs5T3VjVEh2b3lpOWtWbUFwOU1sbUh4bGR5S04w?=
 =?utf-8?B?akVnRmF4RXdYNDQ2VS9zNFY4bHE2NUpiaXVDY0NZZVZqcFh4TEU4eEs1Sk83?=
 =?utf-8?B?OGxrTDREYTgwQkFQaGE2YjhkWUlseCtKMlFiQlZSMCtKTDRaRE1WbDluOFIw?=
 =?utf-8?B?MDh0anZMU3R5Z24wZW1rVjQyQno2ME01UW45RmhudWZIRkR6RWpOM01yeVE2?=
 =?utf-8?B?RmVaWG90cXNsZ1hHNnVjN2NoNERETW02Sk9RbXBhMXluVnlVTXRlRUF4alps?=
 =?utf-8?B?a1I4MjliMEgwTUpaSmQ2Wis5QmRnd0pSTmg1SXJhUXB4NlVLTC9scVJPTXQr?=
 =?utf-8?B?UWRoQVYxQTNQY3BwdHpKL3hycUlTTnpxTkR3SWtaR2c2WXZ1UStna2ZNaXVL?=
 =?utf-8?B?WXNNTlNEc2xtWXdOaGUvV2hhaVQybmVYdDZkZkdmZTJ4TFZ3Q0JybTBwN3JB?=
 =?utf-8?B?dUNKeGtZeUhyRzB4MlphK1N5Q1JBWTNqTjJJZGlsK3IyUzlISkE2R3Y4US9R?=
 =?utf-8?B?UHA2MU5HUzY4dW9oUXJSd2l1cVBNbXQ5V3VkMzM5a2FQdWxRYUdBeXV5QXNU?=
 =?utf-8?B?djBiMDhNMGJKQ0dhU3lzb21WWUJ6SnFhNVJaaEh3dm9pUmROMTBENGF5aXYr?=
 =?utf-8?B?TWxmRWtsK0dsVjZ3UUJ2UVNOcVlianNXNnpLV09rUjFGUE1scGdrR3NQVmtq?=
 =?utf-8?B?WXE2dm9xL1hTNmU1RnhmenVDQ2JiNGNmejBZMkJGL0wwMFFLdnVCdnJJV21Z?=
 =?utf-8?B?eWE3M2pJN3B6Qk9vZW5UT0VlcTVubjRPQSs2R0t1bGVyZ0RtZkU2VzFZcVQz?=
 =?utf-8?B?VFNZczlHNnFJVVMrbHVZS0pCQVJhY3JFeEVYeWVKbVI0VkYwSTBKeEZWd1FG?=
 =?utf-8?Q?IBimG9ao7iLOIdkQvfJMgn/yHAQ4/30WtygpKmerb2eQ?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 91b24963-5d09-4313-25aa-08dd88affc95
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2025 12:59:19.6490 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ApuIAeGfnvdox44o+GyUMtKw/unOLYAuN1PlBwy9KJSWB3s4YEWW0uk0/X4MdMUm0u+GZmSPvHWAR3neugah/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6442
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

We will extend the firmware methods, so move it to its own module
instead to keep gpu.rs focused.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/firmware.rs | 46 +++++++++++++++++++++++++++++++++++++--
 drivers/gpu/nova-core/gpu.rs      | 35 +++--------------------------
 2 files changed, 47 insertions(+), 34 deletions(-)

diff --git a/drivers/gpu/nova-core/firmware.rs b/drivers/gpu/nova-core/firmware.rs
index 6e6361c59ca1ae9a52185e66e850ba1db93eb8ce..cb79d039948858e657c9a23a62ed27ff780ac169 100644
--- a/drivers/gpu/nova-core/firmware.rs
+++ b/drivers/gpu/nova-core/firmware.rs
@@ -1,12 +1,54 @@
 // SPDX-License-Identifier: GPL-2.0
 
-use crate::gpu;
+//! Contains structures and functions dedicated to the parsing, building and patching of firmwares
+//! to be loaded into a given execution unit.
+
+use kernel::device;
 use kernel::firmware;
+use kernel::prelude::*;
+use kernel::str::CString;
+
+use crate::gpu;
+use crate::gpu::Chipset;
+
+pub(crate) const FIRMWARE_VERSION: &str = "535.113.01";
+
+/// Structure encapsulating the firmware blobs required for the GPU to operate.
+#[expect(dead_code)]
+pub(crate) struct Firmware {
+    pub booter_load: firmware::Firmware,
+    pub booter_unload: firmware::Firmware,
+    pub bootloader: firmware::Firmware,
+    pub gsp: firmware::Firmware,
+}
+
+impl Firmware {
+    pub(crate) fn new(
+        dev: &device::Device<device::Bound>,
+        chipset: Chipset,
+        ver: &str,
+    ) -> Result<Firmware> {
+        let mut chip_name = CString::try_from_fmt(fmt!("{}", chipset))?;
+        chip_name.make_ascii_lowercase();
+
+        let request = |name_| {
+            CString::try_from_fmt(fmt!("nvidia/{}/gsp/{}-{}.bin", &*chip_name, name_, ver))
+                .and_then(|path| firmware::Firmware::request(&path, dev))
+        };
+
+        Ok(Firmware {
+            booter_load: request("booter_load")?,
+            booter_unload: request("booter_unload")?,
+            bootloader: request("bootloader")?,
+            gsp: request("gsp")?,
+        })
+    }
+}
 
 pub(crate) struct ModInfoBuilder<const N: usize>(firmware::ModInfoBuilder<N>);
 
 impl<const N: usize> ModInfoBuilder<N> {
-    const VERSION: &'static str = "535.113.01";
+    const VERSION: &'static str = FIRMWARE_VERSION;
 
     const fn make_entry_file(self, chipset: &str, fw: &str) -> Self {
         ModInfoBuilder(
diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index 275b005d262e0a01a9ef1498836ef3c3019cb497..b1ee465de907432325c4d0e0dead3a52e81ed067 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -1,10 +1,9 @@
 // SPDX-License-Identifier: GPL-2.0
 
-use kernel::{
-    device, devres::Devres, error::code::*, firmware, fmt, pci, prelude::*, str::CString,
-};
+use kernel::{device, devres::Devres, error::code::*, pci, prelude::*};
 
 use crate::driver::Bar0;
+use crate::firmware::Firmware;
 use crate::regs;
 use crate::util;
 use core::fmt;
@@ -157,34 +156,6 @@ fn new(bar: &Devres<Bar0>) -> Result<Spec> {
     }
 }
 
-/// Structure encapsulating the firmware blobs required for the GPU to operate.
-#[expect(dead_code)]
-pub(crate) struct Firmware {
-    booter_load: firmware::Firmware,
-    booter_unload: firmware::Firmware,
-    bootloader: firmware::Firmware,
-    gsp: firmware::Firmware,
-}
-
-impl Firmware {
-    fn new(dev: &device::Device, spec: &Spec, ver: &str) -> Result<Firmware> {
-        let mut chip_name = CString::try_from_fmt(fmt!("{}", spec.chipset))?;
-        chip_name.make_ascii_lowercase();
-
-        let request = |name_| {
-            CString::try_from_fmt(fmt!("nvidia/{}/gsp/{}-{}.bin", &*chip_name, name_, ver))
-                .and_then(|path| firmware::Firmware::request(&path, dev))
-        };
-
-        Ok(Firmware {
-            booter_load: request("booter_load")?,
-            booter_unload: request("booter_unload")?,
-            bootloader: request("bootloader")?,
-            gsp: request("gsp")?,
-        })
-    }
-}
-
 /// Structure holding the resources required to operate the GPU.
 #[pin_data]
 pub(crate) struct Gpu {
@@ -200,7 +171,7 @@ pub(crate) fn new(
         bar: Devres<Bar0>,
     ) -> Result<impl PinInit<Self>> {
         let spec = Spec::new(&bar)?;
-        let fw = Firmware::new(pdev.as_ref(), &spec, "535.113.01")?;
+        let fw = Firmware::new(pdev.as_ref(), spec.chipset, "535.113.01")?;
 
         dev_info!(
             pdev.as_ref(),

-- 
2.49.0

