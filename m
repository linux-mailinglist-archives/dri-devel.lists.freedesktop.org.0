Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23CF5AD72F0
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jun 2025 16:03:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CC8E10E849;
	Thu, 12 Jun 2025 14:02:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="goxAF7YO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2062.outbound.protection.outlook.com [40.107.223.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35F8F10E83B;
 Thu, 12 Jun 2025 14:02:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UCHBw3GOF8fAtYzqmaOU2zvQFIc81QImxz/5MkikrIk9IXaHr0HUdgd1jdxgbqv58sNPpnOoB4adcYinxL6hvqBmPALf3Yo8Sw8IRbjkOe+mFl1PInHYCyTLsd6PFndDcWNioz0IcVssDVTBHZdy59kcUQoR3hn1GJMmcNJ1aTaU48KQ5rWfn/XSd9EE9CK54UnEi76ulrSY+AC295G4qYA6h87WTR6m2KWQs3768xo+pIbrl5fDXSuE6UJu1tEUD3IS6sqblF8FRyVkLSln4H44rc4Bha3EnREgE0djwF8qslgRc+gIHCkgMvkm4iTc7Hg5v0G2waUWnk5RUl6gnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i9CS1bhLQz66sfhKKyQ4u0JRKY4I5LCBLKGppnVO/FU=;
 b=dPBfyqt+widcYCN041ZOboWBB/RzoHuLXVMPDciCv04HwuOkD0kAM2eAziYsKYJPTRg93xcWV5yUyl9Z5fdq4VwmYbJa03N6lV6ID11TnEDz4UVJrewYDHuoCsVzj4jN7pthK1/jl3ZCIWG1tHPO1CbsZPP1v0kdKVn66weARpo/k1/pYKqsekl3/zGrg7TJwIbv+5K7yr+QYjrifuEPd+eAkvMcm3jco0lFdwmgdj3zD87EJs89O9A4Rt8TSviOe6WuXFWzKcpOZwdZQIoYWlN15sugWmoktZxQyV+AeZjVD4/tKqNHUKIvuhLunQuLotfPw8StzbLSkJB1goq08A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i9CS1bhLQz66sfhKKyQ4u0JRKY4I5LCBLKGppnVO/FU=;
 b=goxAF7YOou5wuJc7gTdpcbqxRMoPzOD71JzJJu6Aiac20e+d7OCKaIn6EJ3r3B0ohKJ/6haKeepXaqDS7NBSraYDM2k/I4T1qTqwQeSgWvHg60yqiiIKwgmfaB4xMC/BW31ZwXaeTf2GRcyRVo5/Y4yCh00eerGwVGYmq8F263Rm3CWhG64/s/iQzQ7o+DnX9mBiDEEz1flnr4FBqik+tppmTDWOqmMJ9GdFBV/X30Xo4T6TluIlY32qPwl+oNp11WCOYI19yK6qp5RR0uvCPqbR15m2HFOHiDjZX4lJ1K7z/waW+gur6MOFtsVHlw2h9m1ZZJb39WSwgScKnYmPNg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CH3PR12MB8458.namprd12.prod.outlook.com (2603:10b6:610:155::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.18; Thu, 12 Jun
 2025 14:02:45 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8835.018; Thu, 12 Jun 2025
 14:02:45 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Thu, 12 Jun 2025 23:01:33 +0900
Subject: [PATCH v5 05/23] rust: num: add the `fls` operation
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250612-nova-frts-v5-5-14ba7eaf166b@nvidia.com>
References: <20250612-nova-frts-v5-0-14ba7eaf166b@nvidia.com>
In-Reply-To: <20250612-nova-frts-v5-0-14ba7eaf166b@nvidia.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Benno Lossin <lossin@kernel.org>
Cc: John Hubbard <jhubbard@nvidia.com>, Ben Skeggs <bskeggs@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: TYCP286CA0262.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:455::9) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CH3PR12MB8458:EE_
X-MS-Office365-Filtering-Correlation-Id: cc2a9c38-34a0-4149-0b45-08dda9b9ce3f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|1800799024|7416014|376014|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?T2hEbzVPUkwvZC9tSkYyOFhqWlM3RENHRHorUnVzL3RBa3ptUFJidzNJOEpJ?=
 =?utf-8?B?R3pqQWlSa0M3V0p3KzJHMXB3TlcrbDZ1QlUrZXNGc1B4ekdkYXluWTZnOGZU?=
 =?utf-8?B?UVNyRjFzT3ljOW9oQXRxSjBUK0FCVG5nTkxJUmhVRUJHWHVOd3ozc3pBMjVp?=
 =?utf-8?B?SXVFaWpPRHFGOVJvRDIxRXA2V1JPamVZV1pmMzBITXB0QnFDcEQ0cktLRU1N?=
 =?utf-8?B?dStxdjl3V2VYL2R0ZHRMR1pxMkxjbVcyWUdZSWV1UXNjTVpMb0s3WlZaWEFS?=
 =?utf-8?B?aDR5UzJUY1VUOS9PdlVnSjRyeGFLblhtdDRNWnhyRE0zR1BzeUxsdWNqUGRS?=
 =?utf-8?B?eG5uajU2bStqSUhiVnU4dkF6RjVRNUVWYWw1WFpzd3ZEN0wvZmVTcEVHd09Q?=
 =?utf-8?B?aE9LU21GL21ZT1RHemtBSkZKQi8ySFcxL1pocWd3cGVIeUZxRWZ0eFFkTmkx?=
 =?utf-8?B?aldIMEdwRUE1UnBnU3ZLMnJIT015ajF2VjJtWEhhVzZJZHdLcks4dnRjbTEy?=
 =?utf-8?B?c0lTK2hIWUpPTkI3ZHpnNjEzRXpnQytyODA2NlozUUl4Y0RyekZHSDJrUmo3?=
 =?utf-8?B?enV3Q1RwTkxrOEM3cDN2K2kvSld1VFlMRkJhT2UrNXlIUE1GYW11blRPWUEw?=
 =?utf-8?B?MG5CU0dZUm02SnJhWW1YQ2E4RmF2M1ZsanVtOTUzUk9mczZ2ajNBSlRkblVG?=
 =?utf-8?B?elR4QXV6NWtGTDRXNEhvTkVaOXZXK2RLdjdwOTV0UUdLQlExOVBIS0x4YWMy?=
 =?utf-8?B?U3VXaEVpOSs5KzhweGtSNDlQeUtSNmE4WlJLN0Z3dEVHOGI5NklRdXR1K0la?=
 =?utf-8?B?OVVPUnNCUUpTbURpejJvTTM2M2c2QlZ4Tkd4eU1VYnAzZVJoNTA5MXhhSmVT?=
 =?utf-8?B?aEVmZ1RmZFZXTFJ5dXFqSkFBUForY3RsZ01FczRMQ1VKS0ladncyYzg5Y2sv?=
 =?utf-8?B?ZUZSSnloNmZ3Q2tRWXRFbmkzK0R2d3ZMME44UHJXL0dJQWJzN0hTVVYvOUhC?=
 =?utf-8?B?VGhKR3VIeXd0d0hwa2EvZTlDNTM0QVBCVlRyNUx2MHFhY3VPK2NyNTEvMWVp?=
 =?utf-8?B?VTY0VWxzVURUV3ZGRWtkNTF0N0srd0ZSbCtaZ2I5UEd6Y1N1TExsOU9FZGhs?=
 =?utf-8?B?bjZVT1dYb0ZweTVOZlNjVXQvNFlwbkkwQ0R4S2tCRXZaZllkM3RHOGYraS90?=
 =?utf-8?B?SEN2REY1MXVtZWZKNUQ1QTZNZUM4WmloQ2pIMW1kN0xYS0N5U2V2MlNVeC9u?=
 =?utf-8?B?VE44MVM3aGhvU3MvUFAxNE14SGJyaFZOVnkySlQzSGluanMzampJcDJTVGFX?=
 =?utf-8?B?TVVMai91MEdSbFhUMENTOG9QcWl2alJLdHNuMmlsWllQcFBTOWpveVM5V09E?=
 =?utf-8?B?TU5vWk5LdTh4bnpseGxicWtqVzRYWmFGejhNaHNZc1ArOUxxODFYSStTc0tU?=
 =?utf-8?B?VnFPMHRJZDN6UmtGMHdGOHdiYVNyTldJcml1eHNFMW54cDhsR3E2cDRsRkJ6?=
 =?utf-8?B?RXErQTk5MGtTS1R6cjBpWDdZVVBoN01HM2pqdFlzWnFBcVRZUE11Z2RzVXVt?=
 =?utf-8?B?TTJMTnBTMUZmMW9vZlRhdExoSXZrckNtSEVnVnE2T1gyaGJMaGJzR2Z3TXVn?=
 =?utf-8?B?QXNLY1hlRW5ORUdaZEZRaVdxMnBxZGlrVElMNFVFQmJEV3U2NVZrR0VvT3gz?=
 =?utf-8?B?YmlYbTcwNm1XdWhVSC9mQXMvUUx3Q05LWk40UloyamZPbW5oZGlHTVRWUWRs?=
 =?utf-8?B?cG1lMzZGQTBQUlV2M2RiZ01uK0hIL2dta0tXcHBFRmtta1NHdlV2eE9EMk94?=
 =?utf-8?B?YmlsSjVkWis5eXBuTWtTK2RnWUlaYlNUK3dmZW1LMmxUUFAxcTQzODUrZnFN?=
 =?utf-8?B?S2ExNE1jbHh4dENKVlN4MHE0cmpvRkQwUkRxdHhiREZLakN1TkRjL0JoNWZa?=
 =?utf-8?B?K3lPYW1MV0wwN2lRQWdET2kzRE1OTVdiZ0p5VHhmUEZSaXUxY3U4Mmg2NnMr?=
 =?utf-8?B?NGREOERScWpnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(1800799024)(7416014)(376014)(366016)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WWFRVkVTMlJhTzN3blRhaCtJTjlLZ3YyTDBlL2lLcWlrR0dEMnQyUDhDZ2pI?=
 =?utf-8?B?OGRNNGpwYS9XdmRTMVBoeUIxRDF0OEdxYXVSZGdNMnNFcWo0c1lTSVJVN3Ir?=
 =?utf-8?B?ZUNmOFovZjdkZjRhaGpMbXNIaGo2MFpNclhSM0VmZnBDVlR5ejhmbzBBTVln?=
 =?utf-8?B?ejFMK3U2bEFNTldaT095UC8zbHZmL0VnS3ZwdkRTcHNRT3VnVTlFNFQ4UDBa?=
 =?utf-8?B?VGh1SGJ3ZUNtUndwVlNXYnY4S0d2b3IrQi94WEZhVnA4QWNLempBZVFmdldF?=
 =?utf-8?B?aGVWSUFpZ3EzS1JNcnh2aWJYU3JkVlI4TXV0WFlQRUd5QXczTGI3azZMQlpD?=
 =?utf-8?B?M0RaUEM0WDJwb0FrdGpidmE0WFU2R3h1NlFLOVQ4NXp3VDFGcFQ0QzRETUw2?=
 =?utf-8?B?RUtUY003WENsUmJ1Mm5TRE1ZMWFXU2pReFd0TFdydTJObWs1WXJNZ24rWW1r?=
 =?utf-8?B?a3daZ3F2cFBJOVpUYmszcWpKU1VLZGxGckxkYXBEQW1KenZMb3RMUVY1WHFr?=
 =?utf-8?B?MmgzZXJ1VlgvVHp3U1NuV3hLc0VyWEUvQkRjS3JRVG1zTHlwYU1aV1dScUZP?=
 =?utf-8?B?R00vZUJGRFBXbEEwSUhibHlxdUJ1NGxsbXNUeFp4L2FqRXZ2NlUwYjh4eXho?=
 =?utf-8?B?SlMzdE9wZmVXWjhUYXUzdmIzV0xtaExzWTg0WmtzYVdvb2k4SjVkNlU5OGpz?=
 =?utf-8?B?Mk1pcnNoT0JsTFBGR2EzRXhIUHZFRXhlVlhqbTJCMzZBTGZjRXBrd1dHSUdn?=
 =?utf-8?B?dmFlbFE0VExGYldsU0ZJZUE0THdzcGkySEF1VnVHRUUxMWp6MDA4V0l3V0NI?=
 =?utf-8?B?YWdrY2JrbVZtU2lvRjh1WmovT2pqUWlxYWR2NWxpdFRQK2FvdjdIVlBFU0g1?=
 =?utf-8?B?bFBiZ0g4ek4xRGp1OUJueHY5dnh5bk0zV0dNb3IwRVk5WmJSSjI5S3Q3My9T?=
 =?utf-8?B?UEN4dHN6NkpSclZDVWYrRkV5dzdwREhiUTFpRy9WaVRONnBYbnJBZmhqUXQ3?=
 =?utf-8?B?cWhRTWs1UGZoc2wzRi82NUU3cXU4NDBmREdCT1ZZa2V6U1Z5QVBoSEhiZVMz?=
 =?utf-8?B?ejE0SnJ3QXBhZFd1WkJ2ZEwzRmJsSFpPdHFmeVNIdTBEelVLcFUvZTArTmNQ?=
 =?utf-8?B?RWRZUFA4WUpKOTd3WjBOdUZuTlhUZHNpYlJhazU1cXZkbkpROTlYcDl5T1Z2?=
 =?utf-8?B?Z0lEWTZubllSeU1tT3ZmcGxtT0YwVGdpV2x1eW9UN1VHeW44Z1NTU2Rod2Fq?=
 =?utf-8?B?YnEyUG1OV1pmMnNiVFo1RG11VytqMFRBaTF5VmJ4RnRSbUd5YnlUZENrNE1J?=
 =?utf-8?B?eUFmVTFZNkRFVHVyU0x5bHk0R3VZQmdLdWdNelcybXg3ZlNPd1JkZllKWTEy?=
 =?utf-8?B?NXk3cG43dzlQZG9BbU9USXhlcCtQOGJTSjlXNGp1VFVLME5rVElzcjVHczQ0?=
 =?utf-8?B?czdRT1VuQlYrWXhsYnpHVnhnd043dlRHRXVGMzBVdGI5QU5qVlViNTZzbUZ6?=
 =?utf-8?B?M0JVU3lXMExIYlkvaHlDV2ZtcGYrZFJVVFpXSS9zQmtXeFZsa1NGV1V4cHdU?=
 =?utf-8?B?WGFDQ1dCOWZSWHhFZEVpVXIvcWQ3VjJ5WWNDU3o5ajB4ejhDcnBkTTFra2gz?=
 =?utf-8?B?UldnNXFueEVHcmliWGtVMmVtQlozU3I2Rjd0Mjhva1VuYk9wS1NyVWJFT2R2?=
 =?utf-8?B?S3FmNWFrWWE0TFprRkEya2NWUE1QNUcyUkp3clhtQm5HUG94eTF6U01IV0RM?=
 =?utf-8?B?MmltZ21ZRUdXcXNSVm01a0M1REVXb0RTSm1Ba2RDejdrbGF3VEFoV3hJMG14?=
 =?utf-8?B?cHBqMkpuWE1tOVV1TXYvR0l6RjFKM1plcDVQTXRTMkllUzJ3L0ttUVhXcXRW?=
 =?utf-8?B?am96NXY3NFFqemlXakhqVlFENlJNNE1rNTFjN1o0RFkrUEd1WE02ZXdmYVRh?=
 =?utf-8?B?Z0lRQ3poNS90VE5UZWNMTENGdkxaREdDcnBDV0YzdlcyTDZ5MmZ6SUpmdkd5?=
 =?utf-8?B?U2ZLS1JpanRWNjl4VVlCMzJ5V3VQQUxuSGd6SGMrZUpPUndDYmpZdDdOeWda?=
 =?utf-8?B?Z2NkQTRmUHhSWFRIUE9DZjBNc2RkN3FxS2VQWlBidG51cnVXUXF5ZS83amYw?=
 =?utf-8?B?R1dHbTFIZUs3WnplRUhDQnp0Tnkzdm9XMktPMjdZL3l5NlhhbmxmUkM0V3FR?=
 =?utf-8?Q?9k4YYkXjWKKQbRpHggqbazEsxRUku3JhDAs0g9V/r/Sx?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc2a9c38-34a0-4149-0b45-08dda9b9ce3f
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2025 14:02:45.2660 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R6dyLnyLitegy+82MOZ28+iXoeHehxS9S+HEFB6Y+HT/11JwfquwiUACQhN1vRJvqytt1yVy5EYz58okIjCdYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8458
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

Add an equivalent to the `fls` (Find Last Set bit) C function to Rust
unsigned types.

It is to be first used by the nova-core driver.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 rust/kernel/num.rs | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/rust/kernel/num.rs b/rust/kernel/num.rs
index ee0f67ad1a89e69f5f8d2077eba5541b472e7d8a..934afe17719f789c569dbd54534adc2e26fe59f2 100644
--- a/rust/kernel/num.rs
+++ b/rust/kernel/num.rs
@@ -171,3 +171,34 @@ fn borrow(&self) -> &T {
         &self.0
     }
 }
+
+macro_rules! impl_fls {
+    ($($t:ty),+) => {
+        $(
+            ::kernel::macros::paste! {
+            /// Find Last Set Bit: return the 1-based index of the last (i.e. most significant) set
+            /// bit in `v`.
+            ///
+            /// Equivalent to the C `fls` function.
+            ///
+            /// # Examples
+            ///
+            /// ```
+            /// use kernel::num::fls_u32;
+            ///
+            /// assert_eq!(fls_u32(0x0), 0);
+            /// assert_eq!(fls_u32(0x1), 1);
+            /// assert_eq!(fls_u32(0x10), 5);
+            /// assert_eq!(fls_u32(0xffff), 16);
+            /// assert_eq!(fls_u32(0x8000_0000), 32);
+            /// ```
+            #[inline(always)]
+            pub const fn [<fls_ $t>](v: $t) -> u32 {
+                $t::BITS - v.leading_zeros()
+            }
+            }
+        )+
+    };
+}
+
+impl_fls!(usize, u8, u16, u32, u64, u128);

-- 
2.49.0

