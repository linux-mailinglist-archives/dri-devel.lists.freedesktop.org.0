Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83DC5AA8127
	for <lists+dri-devel@lfdr.de>; Sat,  3 May 2025 16:47:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC62D10E3AA;
	Sat,  3 May 2025 14:47:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="X2rzWytb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2043.outbound.protection.outlook.com [40.107.94.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAAA010E1BE;
 Sat,  3 May 2025 14:47:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hosBIvaFXFA/Ge+L8sVrd7KpqUty3b1S5R1BNRhM3I6fxZ/tGgPVy+C7+ycbh3NnidOq6lg0rEkMNKsIIp45c4u2wLb557vsotGrD2xOXGLUfi+KTPyWuElm8tzgHE9I0r2svuZRcNj17TXTJzvILyXIVoFhOMopaTOFL0R0pmeRABvgDD7BjV661QTzu3uvreXqW8KBOzqqfXftdlsOeXg4fHridFbV2TymhZ9+HoxIDS6hxczvDGilVoOgjju90ggpFbSSSEPp/1dURMnfH0fUwTo4qwI9Rrpmh+emsx9DrK+2uIpIGPTihAXAdtYrEiMqZmwaMHnMWuZ291VurA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XA0U2hC0NdbH2oKoD9RY2vdT+UEIMImCJ96QpOI6VRA=;
 b=kyvoN3pSeWJtkVo0xzkcA+vmymdsTzjxrNrNI/OsGF6NwOJ5WNK0RhHx+6Kuhwo0Y9uTdql39Sk3BBcDik2r3u1wn8ZRZloTD50NKYwV/lvBYsdcdueDMIajZHO9vvT5wmtZbjP7LbhPsjwRXoO5TVYUcyPu0OfRKpavUa6YXwZhXtzMzV83M8NEigN+c6urwWlfkqhZCW1pDSza12G559Er2Ypbxaq8rRRDToEAQ+T/1frCHlognTU3DFI1dT3B5F3YGbx1AajwgnX6hUTRlOFumBWG7p5T8eL9ts6tyk7gZfuNTivR37orpio+ASYRfQOSxINTtI4cePerscemdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XA0U2hC0NdbH2oKoD9RY2vdT+UEIMImCJ96QpOI6VRA=;
 b=X2rzWytbOWIg/VHHDNW88tm/GMV2vzcdn9Tcki3tfHbf728v5Z/U7QKgQShXjg8RQffrC2ChUWWEEbz4ZmMCV0mR6bS2mGH8R9mmPWwwxYbYoluXgpaUnBHM2sKYD/F3fElhe3X3PIEbjpIaIVJFTJollf8SDUrI0+JO1v0fAr/hQd0LW4P/BDtCAuHBkBz3/bamrIsuaBh4c297qyhP1eI3sIzGIISHOKERYlxYENtDW0QaziuWKN6l/4bryCaofUv35xvybAzW4HTn6ctZLuUyMYDQFCpnm7G4Hpf1Kd7xCGAz5/oqioAp3/ci44MD3fAHDek7G5SLgcBr2byMcA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by LV3PR12MB9235.namprd12.prod.outlook.com (2603:10b6:408:1a4::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.21; Sat, 3 May
 2025 14:47:43 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%5]) with mapi id 15.20.8699.022; Sat, 3 May 2025
 14:47:43 +0000
Content-Type: text/plain; charset=UTF-8
Date: Sat, 03 May 2025 23:47:40 +0900
Message-Id: <D9MLW6HKYY10.2Q7TPUHQAEMQ2@nvidia.com>
Subject: Re: [PATCH v2 17/21] rust: num: Add an upward alignment helper for
 usize
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Joel Fernandes" <joelagnelf@nvidia.com>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <benno.lossin@proton.me>, "Andreas Hindborg" <a.hindborg@kernel.org>,
 "Alice Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 "Danilo Krummrich" <dakr@kernel.org>, "David Airlie" <airlied@gmail.com>,
 "Simona Vetter" <simona@ffwll.ch>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "Jonathan Corbet"
 <corbet@lwn.net>
Cc: "John Hubbard" <jhubbard@nvidia.com>, "Ben Skeggs" <bskeggs@nvidia.com>,
 "Timur Tabi" <ttabi@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>,
 <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Content-Transfer-Encoding: quoted-printable
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250501-nova-frts-v2-0-b4a137175337@nvidia.com>
 <20250501-nova-frts-v2-17-b4a137175337@nvidia.com>
 <D9LEQ1U1PLO8.3N22GRY380ZM3@nvidia.com>
 <d6962ea3-282d-437c-b3cf-ce701d514558@nvidia.com>
 <D9M5K55GTN6S.1X827WU0Z50UM@nvidia.com>
 <112d971f-20c8-4598-86c9-6822d9c24001@nvidia.com>
In-Reply-To: <112d971f-20c8-4598-86c9-6822d9c24001@nvidia.com>
X-ClientProxiedBy: TYAPR01CA0131.jpnprd01.prod.outlook.com
 (2603:1096:404:2d::23) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|LV3PR12MB9235:EE_
X-MS-Office365-Filtering-Correlation-Id: 2db39584-a197-44fb-df98-08dd8a51761c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|10070799003|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cHI2TFRNMVduTVZVMXo1NEFmR28wL2VCQWppeUp6aHlFcWI0Sy80OG0vTW9J?=
 =?utf-8?B?MU1BV1ZWK0pUSi9nNWVHTHZKdy8ybWdaU25OZXhSL0VOSzJRcVhCUEE3d0k0?=
 =?utf-8?B?Y1BSZFQwUXhTL2kyMWliRmF0VngrV2R3TGR0SG85RWlGNTA2VUdJd2lBZlRl?=
 =?utf-8?B?SGN2NlJWb25sVFJ0ZGVvZFRZUHZhRXBSZWp2VTZ4eVkxbnB6Tm9Zb3IxQWVT?=
 =?utf-8?B?eFRCQ3NRbi8zSElpU2hUQUxnTjVqOURuYkxZTEsrY0svTXZDTTkzcjJEZjFF?=
 =?utf-8?B?Ny8wcDd2TldLaVVSWUoyOWRiaVlxTGNYbVg0azcveU9CUzRKWHQ3NHRTRzM5?=
 =?utf-8?B?WFRSTWtDMCs3cnJWY0E2c0E3V1JJMWNYS0NyWHhEZFAxQk8yMDhGTVQ1Q1Fz?=
 =?utf-8?B?ZTNaaFNPUStaeUJaUlkyT3hXSG9aL2YxVlVPVWwvQ1V3QmpoNTFheXoxQ3c3?=
 =?utf-8?B?YUMzRkJQaE5zWUdFVzdvd3lZL0cwbEQ5NFlnWHNnVHVmcER0d2dNeXoya1pU?=
 =?utf-8?B?ZzJBZWNNREJHTWlKSVRGbGVOSUs3S1Q0QVFseVNxL2s1dFd4YVYvU0xsaTBH?=
 =?utf-8?B?M0d6eHBMMG1FZFRHVVIwRjU2Y3hBa0JhOXFHeDVWeDlkZVloRHovVlZGSis2?=
 =?utf-8?B?Uk02UGlSQmJ0RC8xM3VTMUU2R2xlVzk1RDY4QUpycldGeUNJQ2lGZjdrcFpz?=
 =?utf-8?B?aDlpaVIwclpYWFU3U1VFYU5ZNi8vQ3NsdWpVTDNHUHBDemNXWXlBWmJyYW9l?=
 =?utf-8?B?WmZDWG1yUnhScGdtT25iZXhRczZXZFQ1aEdBOVBwYm8yVitVQnpnM094T0Zv?=
 =?utf-8?B?YWdpUCtKVTk5aWNMRFYraVhCU3Rod1dPYjAzQkoxOE9xZlpTYmxWbU1kc3N1?=
 =?utf-8?B?TzNvRTg4UEN1TzIrbFpxNlBFWDNYZTNaUys1YTJIL0NQNFdxd1ZkNzRYd3dx?=
 =?utf-8?B?Wmp5VlNyWUNiZkxMMzd3aTNLbEdNekt6Sm5SZncxRTh4RWlpd0NKQ1VhMjFI?=
 =?utf-8?B?ZzNxMnc3cGFUdC9JT2dwdURuN2dRUEx2TmtmY3BhL0wzVEhoaGcwWjN4NnlR?=
 =?utf-8?B?SUxJQUpiamwzem1wL1NLbFZINVBJMWNuUzVtckd5c1BQQlBMVTA1bDMycXZX?=
 =?utf-8?B?eTlUdWRlSEp5cnFLT0g5cnFmOEx5QWVLdC9JWldwTTZURUtHRVV5a2Zaa00v?=
 =?utf-8?B?RkdtTEpBNU9YTGhXV01XalpnaXNzcVlWTURCTFRZeWd0bG8zRmNsTGY3WmVs?=
 =?utf-8?B?L2lrVm90ckozckpMUnE5NFN1N1Ivc0IxYUlHampsOUNSb0l6a3haVzgwV1pK?=
 =?utf-8?B?cGJmSHY1WStvUVZ3cWY0RW9HOEFJSTcrci9tVmJqaDRYWDAxTVNsdnFmZUhD?=
 =?utf-8?B?YjBOV2YrUVgwUTFNeU9CUEhNdDMrYk4wa29ZMUR2bGkzSHJRMlZ2cDZUVWxJ?=
 =?utf-8?B?R2Y2UUJTQTdxelJXeTJhWVJISXNGMk9mQXJkN0Q3OVUrRUVNZlRGR2VTWG9Q?=
 =?utf-8?B?UHVjSUtwZ0JmdmtZVys1K1F1cGRsVzZWT2hCUmJqalp0SXVVVVFvNDhXNkpS?=
 =?utf-8?B?TkdzMWtUY2JBVXphZGx3enRXVDFrV1NjWnJCa3lJbW9lTkRFand3TjFGSC9R?=
 =?utf-8?B?S1lGQ21xaTgvbUFMMzhGdjZzUWlNWFpUcGUzVGFYNHFzRFRuWXBlald6UlRB?=
 =?utf-8?B?QkM3aXExanh0Zmd2aFd2Zk92NFl2Yk5vWTF4Z3FyV2Z1bWR3eW1lRW1NMmNy?=
 =?utf-8?B?cmtObDhnNFdVNGgvYlJ3YVRYcjh6MnJWanJ1NTlPNDdrNTJsaWd4dVhCZWsw?=
 =?utf-8?B?QXZ6L2w5Z0FnOFhCVWdrZXdGOWhZQ3BGd084ZlFUQ1ViRXFUS3RUbzN1Vk9Y?=
 =?utf-8?B?MlltV3dDVWVkczRZZkRzNDM0cEhJeE5uRVZKZ0VYRjNIN0NQL0U0bktFRlds?=
 =?utf-8?B?eCtwUzJMcUF3Ukp3SHk0U0pQdUtXY3l2VnVjRGtzNU1kaEd3TXRPUmFsSUhh?=
 =?utf-8?B?SkxpdVhOL0lRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(10070799003)(366016)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WW1QQm9yK2RCQjFnNmh2RGd3T1RBYUxkWksycEhhK1JNd3RraEhSV0dydG5h?=
 =?utf-8?B?WE1jS2dwOTl0THBNYVBzTlo4SmFNdDNVUVZUMUVjT1N4OFVTL1BNT3JGdVJq?=
 =?utf-8?B?SlRkRHdMclJ4S2djcW8vWWRwMmtoQmtsTU5zaWhkbGlSSXNEaEZvYTA2OE1q?=
 =?utf-8?B?NVlSMzdaR2Y3Y0wvdHJXSXNHUzFmaUF1c29XbUsvRHc5ck5Md1I5SHRLRTlF?=
 =?utf-8?B?YXdGSHZiZGFSZGJGSHRLd1dqQUlUbjVHZGZQWExnN25pUStJSUt5aThHS2dq?=
 =?utf-8?B?SnJXK0pSUVVCcTJ6SmZESlQ3UTM5a0VobmdPSlVHemNzNDMrZy9nU3krbXdi?=
 =?utf-8?B?Smpod2h3WGdXb2JVRDYyNGQzTDRDU3pqQkgzMCtqeE5wSzhMcHFHYzRrbllF?=
 =?utf-8?B?cW1oeWppU2JSbGtwVlFUOVJ2VGh5VC9HaUo2ZTF5R2FJckQwT0VGUisveENi?=
 =?utf-8?B?L3kwRThoanR2RDV1OExzZmI0Y0lyelhjNm15SWovTzJIMFFIeS80TmY4OFFn?=
 =?utf-8?B?N0RDKzZxNXh4bUtPNTRuUzZjbVlxUGFTOVJpYm9kSmpEWVRtQmczdjFyS1lz?=
 =?utf-8?B?ZitxbzF0SmFMUXovdGNjVWczdnIwLzU2NUY3ZjBJVHl5STY3WUZLT3JhY3pN?=
 =?utf-8?B?d25tS0wvWXhnSUlycktoMk9QcDBGNUdCWThsdStVOTdKKy9uak5taUc0OGpR?=
 =?utf-8?B?SFB3NmxZdGlybTJGU1pWb05mYTJqNzhjREd6N1grRG1JTFRvY1FqNXRNdE55?=
 =?utf-8?B?ZmdnZWtlUExiMm1CMzNESi92S2xQUUVSb0p1QkRtSmVOWTE2OW1NS2pKNVFK?=
 =?utf-8?B?d1JjSkwvSHBnZmIzenovRjJ3a3Q1Y3VVOG1IeDVmYnZqSi8zbExIR3FGTnB3?=
 =?utf-8?B?djVwTWJ5cjYydm9LK0dBOGY3VStvN09xVXRmVnVhWDBvell1RVZOeXdlbi8v?=
 =?utf-8?B?cUw2c2llMlhRc3doNitXd2NVQ1N0czJxUkxicHZqNDhHOVJxeEpXbFplcEky?=
 =?utf-8?B?Wkp0OVlIVWR6T0N1Qm5BK2szbTZicjA4dWRaQ3Fac2RtemtxdWFnODhiS05G?=
 =?utf-8?B?VWs3L0JVNUtmZ1VPVFpxZEkvZW9HYWs3NFdrWnhzYmFMNVhzcXJJK1hwSXVY?=
 =?utf-8?B?L05lZnR5YW9GeXdNbm9Cb09xYXc3VlFKL1RUZ2xEMUVVNkkyQ2JYeFpwS2xa?=
 =?utf-8?B?ZWh4dVRENUk4aGJtYVdaOEdxdFZtOTd4RnBhdEM5RjV1VTAwaitveklqWk54?=
 =?utf-8?B?QUdPSW5ObDBSNjY1WUxmbzFrZUFzS0ZHSFFCUmEzMXBQRWM1bUF2aHgrSFhi?=
 =?utf-8?B?YjhxS0lKeENaVlZXV0NNZHdrR3VmOEErWkVZZFMxNHRaNW83U1RiakdxS1o0?=
 =?utf-8?B?Q3RMTFZodEFTNUljVnhudDFJbzhQWkJFV1c1OERpTnp0U0paR2NSYzlRdFA3?=
 =?utf-8?B?SGQzMTdkNEV5WkRJT1VnMW1vZ0hnaWZKbWZVcUt0Q01sK21HUkJEZkZ5Vlp4?=
 =?utf-8?B?ekZBdHpZQWN4cEdMTEkzajlsQ0Z5am1nM1V6M2tKb1hMemYvTGJMMUYxUG1r?=
 =?utf-8?B?a1UzVmFqMlBodEowbFJBV1Fuc3BTSndhRGJqYWhmZ21PRGpxTGhtcEtJdlB4?=
 =?utf-8?B?Qk82TlFpYVp3aTdpcmxJSHRIUEh4bktkcm9DMkdwYWJhYlhFY1lzb0FpZjZk?=
 =?utf-8?B?TTB1cHluaFUyNHd5Nm4yYzdlQk1KNGxJT1VFeFpERG9kWG1UQ2pKNmVOMDNG?=
 =?utf-8?B?Q1RXLzFBbkdqK3NoeE54TWtlNldyMEdFdEpkUjY5SkgxcWFHNWxzc3RDK1N6?=
 =?utf-8?B?NkJtZ1hsNlF0N2NLWCsyUnR1SDZUaXRrMHJwSVBBczYxOWRzTTBPSmtOY1RV?=
 =?utf-8?B?Uk83eTRSTXE0VG9NV3BNT1kzc0g3N3QrOEZjZEk2MmFlcjZaYm9pZWoyMHcr?=
 =?utf-8?B?M0hXdU9RS1VJSTZtaGduZ2RPeUlJTExMMTJKcnIza0lNelBJS0F0Y0ZDREp6?=
 =?utf-8?B?UCs4K2VXUWdteGV6Vjl2QWpRUmpxQ0x2b2QrSVRKc3grb1FTUlJhSi9vb0Vw?=
 =?utf-8?B?MVFoSkY4amg4MHdiNitNZWVTY1ZlZ2F5MmFFeDRuVmZqb3E0bXlkVFVVUXBY?=
 =?utf-8?B?bU95eEYrc2M2dHM2QllWT0FMc1lRTG5sMGJZdVFMc0wxMk9Rc3ZoS0Z5TXkv?=
 =?utf-8?Q?KSRxB2JqMxtWjJgVu1Q0Jmb2iMYWQsNOGI4lNQtmO9lq?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2db39584-a197-44fb-df98-08dd8a51761c
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2025 14:47:43.7509 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OJcUVoVMCqDP+Ei32rzTZb25MLt0yxcZyeZ368DaBuRqiVhMt80r8QuzpFXEVuCZYWl6cRZXNzgypf07qz1cEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9235
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

On Sat May 3, 2025 at 12:02 PM JST, Joel Fernandes wrote:
>
>
> On 5/2/2025 9:59 PM, Alexandre Courbot wrote:
>>> pub trait AlignUp {
>>>     fn align_up(self, alignment: Self) -> Self;
>>> }
>>>
>>> macro_rules! align_up_impl {
>>>     ($($t:ty),+) =3D> {
>>>         $(
>>>             impl AlignUp for $t {
>>>                 fn align_up(self, alignment: Self) -> Self {
>>>                     (self + alignment - 1) & !(alignment - 1)
>>>                 }
>>>             }
>>>         )+
>>>     }
>>> }
>>>
>>> align_up_impl!(usize, u8, u16, u32, u64, u128);
>>>
>>> Or, we can even combine the 2 approaches. Use macros for the "impl Alig=
nable"
>>> and use generics on the Alignable trait.
>>>
>>> macro_rules! impl_alignable {
>>>     ($($t:ty),+) =3D> {
>>>         $(
>>>             impl Alignable for $t {}
>>>         )+
>>>     };
>>> }
>>>
>>> impl_alignable!(usize, u8, u16, u32, u64, u128);
>>>
>>> pub trait AlignUp {
>>>     fn align_up(self, alignment: Self) -> Self;
>>> }
>>>
>>> impl<T> AlignUp for T
>>> where
>>>     T: Alignable,
>>> {
>>>     fn align_up(self, alignment: Self) -> Self {
>>>         let one =3D T::from(1u8);
>>>         (self + alignment - one) & !(alignment - one)
>>>     }
>>> }
>>>
>>> Thoughts?
>> I think that's the correct way to do it and am fully on board with this
>> approach.
>>=20
>> The only thing this doesn't solve is that it doesn't provide `const`
>> functions. But maybe for that purpose we can use a single macro that
>> nicely panics at build-time should an overflow occur.
>
> Great, thanks. I split the traits as follows and it is cleaner and works.=
 I will
> look into the build-time overflow check and the returning of Result chang=
e on
> Monday. Let me know if any objections.

Looking good IMHO, apart maybe from the names of the `BitOps` and
`Unsigned` traits that are not super descriptive and don't need to be
split for the moment anyway.

Actually it may be a good idea to split this into its own patch/series
so it gets more attention as this is starting to look like the `num` or
`num_integer` crates and we might be advised to take more inspiration
from them in order to avoid reinventing the wheel.

To address our immediate needs of an `align_up`, it just occurred to me
that we could simply use the `next_multiple_of` method, at least
temporarily. It is implemented with a modulo and will therefore probably
result in less efficient code than a version optimized for powers of
two, but it will do the trick until we figure out how we want to extend
the primitive types for the kernel, which is really what this patch is
about - we will also need an `align_down` for instance.

> I added the #[inline] and hopefully that
> gives similar benefits to const that you're seeking:

A `const` version is still going to be needed, `#[inline]` encourages the
compiler to try and inline the function, but AFAIK it doesn't allow use
in const context.
