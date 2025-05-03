Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 254B1AA8116
	for <lists+dri-devel@lfdr.de>; Sat,  3 May 2025 16:38:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EACE010E004;
	Sat,  3 May 2025 14:38:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="VY/VvnVG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2076.outbound.protection.outlook.com [40.107.223.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D20A10E004;
 Sat,  3 May 2025 14:38:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=St8lgrQN0Eyl1slrh6e664XniVM/35i/VZY5m+yzJTKNLjYHnZWWZ5pG3BXQTLSqTpaFqyE4eAhjy1xSWaXh1CNVIwtKUUVYecRRXcxncFLR/SRl40pFtFF7wbYpCtPVN1debcgTWJsD2t4QpKL1xJTN8gV4OA94TdKagYGNgtbRvgSAeDD++HK/fGqu+PlJh5x5XaLeKFvFIGLkZN8iHEILr33V+bnMiaV9+b0XXQjnl0c5hMjV0vsTbsVi6W8b440XIbJXpl1P+mOB0siisMqBXtjj5CiAiz3EqQEondcEfU01wSUzv2vdcPjCaOMJ/FOYQU6YTnfx4tO/pDDRCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gmQGqE0do93SL801k9OaetlC1kMvhZl08GXDD+mW0Lo=;
 b=xROB43UIgBPZLhugLjO2kTebzEyt1ywoTvRkOspxunvmfZdtGp4ng+ZZ2Eu/58BaT5SHXs3UJBA9pwsm0jbztdwSmkWQWReAJx2F/It1mITIz3GAMrDBxYkK8CcDWm+dzzl5s4JoP/5ezX/SSJr+7R/Ln8k+LzIXFmfS6T0OpcpzgqMLSXrsHxSSjr4KGewkbqXxlnlqcKlhpjJN/YtZBLPGDJII3FBpgv+USDA5rP/ck73V5lOY5t3MCo0g/S+TNxX2ksopURqF5ndl5JBEsfthB8SjiQKOzqh3JN41A9yXIf/7Y++nsiMIeHJKoJSNZ38SM0HGYkzlQc5it0UfAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gmQGqE0do93SL801k9OaetlC1kMvhZl08GXDD+mW0Lo=;
 b=VY/VvnVG4gpSVkAD45OkQ9mS95aJPxW/2h6nrnUQV9bZ4yHHbcsvdQlzPkcd3xM48CWLR1IvP027u/EmGieUSQVDqsIMYh7/xnDopO6SQplk5y2PH7ZBXUuBbAvMXx3Z8oWq8dJ0KkWbZR8VzV7mJ2i4fLc7M3iV6Djp+Rk9NSj6B9VSp6NKVf/KmH6LgPN9nmsqf3QjRuHEXwXgzupimFO+p3Y0voJGDcBXBxOvUS0Y2sBkR5dG1UNFDKiCXrnXwFTA9ReTIQ44xzidbWQy227sQQyn1Eat66jRfM3YMl8FQxzArZPgzmYlMtu7JTtUyWBypblLvl2p46ej4sZiZw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by IA1PR12MB8286.namprd12.prod.outlook.com (2603:10b6:208:3f8::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.20; Sat, 3 May
 2025 14:38:07 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%5]) with mapi id 15.20.8699.022; Sat, 3 May 2025
 14:38:00 +0000
Content-Type: text/plain; charset=UTF-8
Date: Sat, 03 May 2025 23:37:56 +0900
Message-Id: <D9MLOQC5G7XH.3GTUIRCCN8X70@nvidia.com>
Cc: "John Hubbard" <jhubbard@nvidia.com>, "Ben Skeggs" <bskeggs@nvidia.com>,
 "Timur Tabi" <ttabi@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>,
 <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
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
Content-Transfer-Encoding: quoted-printable
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250501-nova-frts-v2-0-b4a137175337@nvidia.com>
 <20250501-nova-frts-v2-17-b4a137175337@nvidia.com>
 <D9LEQ1U1PLO8.3N22GRY380ZM3@nvidia.com>
 <d6962ea3-282d-437c-b3cf-ce701d514558@nvidia.com>
 <D9M5K55GTN6S.1X827WU0Z50UM@nvidia.com>
 <112d971f-20c8-4598-86c9-6822d9c24001@nvidia.com>
In-Reply-To: <112d971f-20c8-4598-86c9-6822d9c24001@nvidia.com>
X-ClientProxiedBy: TYCP286CA0322.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3b7::11) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|IA1PR12MB8286:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b634c65-f55a-4f51-7517-08dd8a501a0a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|10070799003|1800799024|376014|7416014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UlhCVW5hUVF1T3FXbEJ4b2s2K2R0YzJuYUMwVGdieTR6bTRzVTI0VEd0TnRx?=
 =?utf-8?B?Z1FYaUJQTWJZSFdWS0VZS25NemprYlVISnlHRzJwT3BaanJXcUJIejJkMjB1?=
 =?utf-8?B?NCtXMmdLM1hnR2lMTHphTjAxYTNXSWh4ZWtjQkNZcU9aSHYxOTdaeCt2UmRC?=
 =?utf-8?B?TERaQWZtc01nQllqZXp6Qkx0Qm12VFRpV2hScHVyVmJRNVZWeVpndDBVTWY3?=
 =?utf-8?B?NU14dnYzN3MxZHVQbE5aWERPaER1aFhqVTk0TDdRbm04UUF2V2wyY0pWblcw?=
 =?utf-8?B?bEpGSWFaaGZhRDF6aW9adEZlTzRYYUxWQm5samhoWkJXRE00ZmVyRko4MXpr?=
 =?utf-8?B?N3N5RTFlcEtFK0xsUllVeklIRWsvZG8vK3hOVnlWejY5VzFsaXVCZmw4OEFr?=
 =?utf-8?B?MmFncGlUWkpHcEVGNmFhQ3B6TGdhbzdNLzVDTUpFVkxCVytESUMvNlo3bFQx?=
 =?utf-8?B?MEZhWHdtRXNBT2krRXJVbngyeXZDR0ladVdtTGQzSUQ2eFBPbmJZZ3BuNng4?=
 =?utf-8?B?cGZKT3RDcmttVys3YXNsMlBibFFHaERsTFIwQ1BWZ0pwSTI0M3hlZ0tZSnpP?=
 =?utf-8?B?eU9QMGF0RUlYckJvQjBSQW10Sm5rN3ppK24zSXVKWWtBUE9lbDVBTGt1UEJv?=
 =?utf-8?B?QlozMzNHNXF5d2l6NEw0RGFzcFRFL1dYZ3puem5ZRWFGUDF1YzN2OUJVcTJy?=
 =?utf-8?B?b2hpZHcwUkp1RUt4YzBxSGJzTWcvRVZpS2YwUTRvZEpoclFHSFZYbzVIMS9G?=
 =?utf-8?B?WEsrVTdIVjhMYlZKcVE5Ny9ueTZIcmV2WGdMUkZYeE1YZUtRWENZVE9uUlR6?=
 =?utf-8?B?aWxNUkNyRGtCV200L0pKSEEreFh1RmwxcmMrUWVIWlBScTdFTmtyRnpwa3o1?=
 =?utf-8?B?MVdNeFVDbVN6R0R3Tk9Qb3d1eFZVa0VUdnUvYjQ4dlErT1BBdnBQUHdPOUM5?=
 =?utf-8?B?V0tZRC9SaVBmdklhWTlYaTM3TXdjMjE3Q1dCTmRFVDhiTXZBbEU5M3Vxci9U?=
 =?utf-8?B?cEVYUzFDNlVFM1pGaitXNUI4aXdaNUNpeU1ZSHBZTnVTaUJJNnhRWTFGZVQ1?=
 =?utf-8?B?VnN6ZC94eFgyYlM4Nkx1S0xCMSs2UUZqQUJoeWY5TGMvSUZBL1ArWFpsc0VO?=
 =?utf-8?B?Z1UwL1hyMCtvYThoSFQxdk1YTnptaUxlTk8zTTBGdVRPMXpoZk9UdFJneWgr?=
 =?utf-8?B?Z0Z2QWYvVGVPMHY3emdaYTArZWlRUXp6N0pyZU54MUlvaUtMbHIwTVRzZlM4?=
 =?utf-8?B?VytXazR3N3RtZlhFNUkrVE9FaGlzVXBXaDMxc1pETllHLzBZZjdWcHI5cm0y?=
 =?utf-8?B?V01GQjhEUWVUU3dDdE9IWVREQVFNOUVjUzNnVS82V3daaGJobjd4MGZKRGdF?=
 =?utf-8?B?QjgvZkxwVDFvUzJLZnZNcWFFVnArYkFtV3grQVdyMng3ajgwdk1DYjMyR2Uy?=
 =?utf-8?B?ZkN4UXEwaE8zWDkxN3M4Y0RETUY5RUFjWTF0OFJxQkJaZm5LZ3dtUVZ6Q1E3?=
 =?utf-8?B?cXNpQTBIWWtrN3drakFhbnJjV2t6YW5nNjNXQWdCNHNKYUJ4T2h1eEVnS1dY?=
 =?utf-8?B?bHE4TkhhZENzaWhZbVpHNTZrWXdUcHNqSEdaakgzTHdyY0hORkNKKzdWeDNX?=
 =?utf-8?B?bTZWWFpEYWFLL2VMVE5NTHk2WEduS3FEK3ZyNjJCV21lNlIzSHFRd0xWT1JK?=
 =?utf-8?B?NmYxZmszK3I1TTE4N05DUGNPdzFhcHcvNnEyNkJGL1M1UmRyRWdIa0taTmE1?=
 =?utf-8?B?RVBaRlptcFJOaWdFNjczbUx6eDV1U0dpekJuQ1JpeFVETVJhMzJab0xGRVUy?=
 =?utf-8?B?V2FaYjFwNW5zQ0haaE8zeFZuZkNRZGdTTk0yeFlybEo2eHlnUzVoaStkUkdp?=
 =?utf-8?B?THZsL0diTGkwOTVXeUQ3T003RlpEaU5OMWRrZFJISUNtTXJJQUEvOWZjWE4r?=
 =?utf-8?B?YXJrQ2ZoZjltUStVWUhOMVJsUEllZ2dSa2o5RUxjcERKQ0huWFhVRnRTL0l6?=
 =?utf-8?B?T0RpU1FoNDdBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(10070799003)(1800799024)(376014)(7416014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T3E3SjIrbUM5d3IrMFMrajBtc2xtYnZudnRqcGlGZTF0N0hCMVNCZ1NmVjA5?=
 =?utf-8?B?Tk1YZ09FRTcxdVJjSUR0dHhQemdyU0lhSkZrZmFkRG1heXhoczZvUUYvQk12?=
 =?utf-8?B?bG5Ha21zOHk5UmxYc0hMUVJwZG4vY3BSNGplSkFKMXFuMTg0YUo5NElqRFM1?=
 =?utf-8?B?MHZMaHpGRmo1UGtvbXEyVWk5LzFVUC9ranVnRHRSZk8rQncxaWFSSVgrakNa?=
 =?utf-8?B?VVA0MDM4ZkpabngvV1dacjJnWmIrNzIwU0NLUTFwODNXd3VtWlp2VFNxM3lK?=
 =?utf-8?B?RXFhR3phL2tMSWk3R0NZQ3NjN1hDVVA1KzAwaUNSSjdYdjBLYVVKSHlSay9q?=
 =?utf-8?B?cDBIVjFLR0xwZmpndXc4RHMwY0ZOYjlwVFBLTE9IOXR3c1JjQmtkbHFPT2V3?=
 =?utf-8?B?U05sNFAzVkhDQTNyRURzamI2UlBueTBRbHRGYUJxTjNjeEhNK20xR1BRSkhH?=
 =?utf-8?B?aG8vbWpmWVJYbTcxUE5OKzQrSnZXYlZHNloyUUEzM3VTUGwybjZwVTRCZHhV?=
 =?utf-8?B?Q0ltVlpwQVpqSmxLUWYvbXFmLzAvSUoyRis1L0R6MCtCRnpiTGJjaU8zM2Jr?=
 =?utf-8?B?OUdSaGZKR1JuWVUyU2RZY2J6Y0Z2REU1bEUyb090OVBsMWpmdDJFdTh3cGRl?=
 =?utf-8?B?dmg5aUhDN0RjSFRNaUxwK1BFYkpwcGdzUG1qY1NZMG5YLytYRzYxbFhNTzJW?=
 =?utf-8?B?YzkyWHZsNkwzZUJ6S056MHR6VHBRc0VoWG5tcTgya0IrdndlV0VEdCs1VEti?=
 =?utf-8?B?K3ZJbVFSNjJmMGE2RUxZV3ZuZ2JzZVA3QStneTE1TGxXRFNDYXJwR2xzN25y?=
 =?utf-8?B?RUpsZmpIQlc1dlFheFE3ZEpNeUdnaE1WQXo3UXhEdERUaTdSZ2UzNW9MNEtT?=
 =?utf-8?B?ZG5ZdWpHUTc2SjFXQng0MUR2SU8xa2pKSlQxUjFVdjI0ZmUxMkcweW1jUHdZ?=
 =?utf-8?B?UmVwQ3dKWUZDaWl0LzU1UEhoUTZnTlhzclJtM0Q2S2ZnRmtCR3RGU2ZpNk9H?=
 =?utf-8?B?RFdOTnJVaVMvM1lWTG8zbFZRejZzWmlVeUJnYUY0dWF3TVBTWC9HOHQ2Ynlp?=
 =?utf-8?B?Y1c5SHp0cGg1cExIYlhmMmU2MWJRQnFValNNL0FQNHlwZTBDazRZSDRxK2RC?=
 =?utf-8?B?T0kwcGYvZGVDUHQzd2FWMWJibERKVzhJQWZWS3lGTHZmOWl1dDdFWkpPQndl?=
 =?utf-8?B?SjNmRzl3eDVqSTBIMWx2eURhc2xZc1ROWFhyLzI3c0RmYzJkOEtjYkZuQ0lm?=
 =?utf-8?B?bE5YWUFDVkViVTFXNEtCSXlRZjZUWlEwQVNRZDUzY1Y0dldsS1FTZkJlajF0?=
 =?utf-8?B?bHVBS01pajJ2MElaRlBBUGI5bDlnRjVlRFphUWFlU3RRZCtrVjJWOUlUZXhN?=
 =?utf-8?B?bTFBOVpCN1hTMnRJdDYzRXJZdzdROWduUGs0cW1Pd3l4ZC9DbTdYM09iaCsw?=
 =?utf-8?B?Z0grUFhRV0pqM3I5bnJsNWM0M2tITDFtMVRrajhseDA0M1FEeFZPNlVQeUdP?=
 =?utf-8?B?aHQrOFNBUktyNE5OTVZsRDlidndhVjZNbXNaWW5tQ1VUODdieTRSMlY1ZVV5?=
 =?utf-8?B?S3BxdmVMbkhkaHgya3ptUFYveCsxdzBDREpJU2kxUTdJZmJ0UmlJa01GU3Y5?=
 =?utf-8?B?SE5xa3VVRVVVR3ZFYWZESzg4N0o2VFZWb3JjQ0owNURIcWw3TTBYQWN5R1d5?=
 =?utf-8?B?bTRtZ1lhTDJqdDBSU3Z0UmZKbk1UeFpPMFJ6b3VIZlpkVmp5MitNczRKL1pQ?=
 =?utf-8?B?RUtNYjdjdUp4Qnp0RG5qbkFlZW85aFVMWFBuVzlLMWk0RGpJcEhuMVhMZVFV?=
 =?utf-8?B?Rk80TjdBZ1V5RnNNaTZJcDc3ekxjOVBvdkpDT2dFVHJMUHk4VUc0ZkZHdkF5?=
 =?utf-8?B?Q1cvTndLN0dUSnFxY3FpTXNreGRUbFRrV1F6cy9pVjI1SnVSODBjNk9zTlAy?=
 =?utf-8?B?RGYvRTFDNThJUzNucTNHUlNiTGhPT1l2V3JRYVlQTzEvUlBmK045TW52Y0RO?=
 =?utf-8?B?S0diWDVEVnZIZ3N3TkRoK2xhMHJWYnJGc1VsOW80b2hXS1ZkbUdueVp0UzRi?=
 =?utf-8?B?OHFVcjFnUnRVZUxWd3JsWFovWW1Obk95a0tabkxZYmJRQnFhWlVrWURHWkVY?=
 =?utf-8?B?WUJ3VFhDQjdEWkVQQ0dDb0ZoQTdYVmE0SWE3bVlPOWFtdHoydmFFWFc1UmlL?=
 =?utf-8?Q?TyF8nKh9j0LQyUSN80pm17EmaEFwfl2fFB5GpxkadJPT?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b634c65-f55a-4f51-7517-08dd8a501a0a
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2025 14:38:00.0017 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hmBg1tegRY1ediMyOhgS2AzTUqjI5qvu/z1nQBlFhQGIK+mU7DWoouhHKxITJPaqbwumaxN5avQoWIDI1smppQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8286
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

Actually it may be a good idea to move this into its own patch/series so
it gets more attention as this is starting to look like the `num` or
`num_integer` crates and we might be well-advised to take more
inspiration from them in order to avoid reinventing the wheel. It is
basically asking the question "how do we want to extend the integer
types in a useful way for the kernel", so it's actually pretty important
that we get our answer right. :)

To address our immediate needs of an `align_up`, it just occurred to me
that we could simply use the `next_multiple_of` method, at least
temporarily. It is implemented with a modulo and will therefore probably
result in less efficient code than a version optimized for powers of
two, but it will do the trick until we figure out how we want to extend
the primitive types for the kernel, which is really what this patch is
about - we will also need an `align_down` for instance, and I don't know
of a standard library equivalent for it...

> I added the #[inline] and hopefully that
> gives similar benefits to const that you're seeking:

A `const` version is still going to be needed, `#[inline]` encourages the
compiler to try and inline the function, but AFAIK it doesn't allow use
in const context.
