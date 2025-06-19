Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8405FAE0716
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jun 2025 15:25:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D58EF10EA50;
	Thu, 19 Jun 2025 13:25:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="ANgGDAWY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2063.outbound.protection.outlook.com [40.107.94.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD47C10EA4E;
 Thu, 19 Jun 2025 13:25:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ta0S9LMge/EQQKtK2utX+eZ1KDrJCgeREDHGnc6jIYdEpXK1tZsFvG++EtxAyhwPUmEb2QnDaEk+8wUCXF4nALeEwKsEjwiw1OD6r1iRzgywv6rrSOGYVsAQ+xECB3GlE56VHAN44+69XH7+3T8OtCEbKyTAsSnY9U+rELS/lL2Fck1y7tjAU6qRAdG0HKu6ACz+BOqSF+00gDatRMhSVxdEAGxgIrekGZPW7jLlFHYTsr0Px/Xz+CdsLkeGm46lW5+EslWL85ndCYRuf0xiLhzzsn2XIR5/pZs5I27g+UJcG+dZq8TasaQ46RLzVh+tio5f5rqUMsYQ66/untXKvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Aid8otmZ3s8zQvCNKGNXbVGb0ujHig5G+zbKbCBMomg=;
 b=lyxUqtL0wLsg7K5tNDfei2lNqq+qpRygqX4zz7tb5K51zX1EfquuguJg7WtGjFXzbCXLDg3NfCN3c52c2QdCuNU8yjxmbb9sZGUr8efoTsipodkD0qQf947mbmOnoEWZDiN2BME1UWlk5eaGwllM+eycvunB/YYTaKCj3JniZS3gbMwL0NMUcnQTXTr+jJhBZBimL4FAKsgpaxAlkzgFL9PfVWcE5B955Vlk+TAU6ptzZqhH9KzeHodhPuZpUwkQ5Fg43A/PPV/sO61ke4u3xXbvjlj7CXQTRSW0jIXFH+HAr17wbMHQxnfb0H8lS6ZbUV8flAUwDddGXPOnlgC9LQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Aid8otmZ3s8zQvCNKGNXbVGb0ujHig5G+zbKbCBMomg=;
 b=ANgGDAWYJOClnG+CyeZydLGBjkvIHMf+9gFg9mTldSskgovzl8lnjPpVnUyoY4azziEZPVmv9Hr/GMmyT+0uFl9CUqLkEjohEjheEubiC5ltjZ46j0TfBFMvsmxcRlN51VoUU0tney1f8IRL5oyBmOhDt6kwdEXFHE3sEfHJF2/G0SKAAWGdGB5x3F+AV9IivXA9ZhVYDXvZmC880/MI73Mx+Wfm6cBKpwRx8i6CHVEWVD050+1KgedWb0UduWge9cLgy0r1G/y3NxNQJwpDWjXS0mQ+svWPVP1oUImfGoH2vemMeC3LtLNqPUsI2eSMXkhIkg483m6QUhKkSluxPA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DM6PR12MB4353.namprd12.prod.outlook.com (2603:10b6:5:2a6::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.21; Thu, 19 Jun
 2025 13:25:28 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8857.019; Thu, 19 Jun 2025
 13:25:28 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Thu, 19 Jun 2025 22:24:02 +0900
Subject: [PATCH v6 18/24] gpu: nova-core: vbios: Add support to look up PMU
 table in FWSEC
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250619-nova-frts-v6-18-ecf41ef99252@nvidia.com>
References: <20250619-nova-frts-v6-0-ecf41ef99252@nvidia.com>
In-Reply-To: <20250619-nova-frts-v6-0-ecf41ef99252@nvidia.com>
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
X-ClientProxiedBy: TYCP286CA0023.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:263::10) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DM6PR12MB4353:EE_
X-MS-Office365-Filtering-Correlation-Id: aef7c337-b87a-433f-f742-08ddaf34c1ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|10070799003|376014|366016|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cFZqQlF4TmlaNEt5U2JMQ2FhSkpOY3pKbHBsY2t6bis0bXhYNFZsSEJNTzFy?=
 =?utf-8?B?ZGk3WW5wSmp3RGVJT0tteHJiUEhNSjNJd1lVVlgxTHZMbU96RnpQZFdUVGRq?=
 =?utf-8?B?VnVINlN6MWF1ZUU3VW5yWElCUytEamxpbDRGUk5sL3BmeVJNRUZ0L2VYZHJV?=
 =?utf-8?B?dG44UjVxd2RFd2ZPc1kxMld2V3BzU2pCUytlYXNoTDJqUFh4NzVMcSsrdW96?=
 =?utf-8?B?ai9mRno3dDZSbmpmZjR2RWRHclJTVktBSkJQcGo4dCtzOGVJclBwUERjQXBM?=
 =?utf-8?B?a2p2b28zZjNwb0NxWmF0VVBCTUtmOVhCclozb0wxcTZHWU1yTEtYTWRZd3hw?=
 =?utf-8?B?Z09MTUtOSUVlc0R2SHZIRVRNa0s4VGtlMExKSHZRTmVFYW1LT2xSSTMzSlda?=
 =?utf-8?B?TnlDY1pkUU9NTnRGWXZhbldySmdpZFdsUy9HQ1Qyei9Sd3JoME5BVzlCVk0r?=
 =?utf-8?B?VGhkdmN3T29WT2l3dTZkb0x0eGg1YndCTTk1NzVpdjRTSjNOV2NlYmJMUkw1?=
 =?utf-8?B?UGtqd3o3ank5U09NM0JqL0Vub2J5QnlTUzN0SHhQZmUvY09HT2FUNmdJeFFs?=
 =?utf-8?B?aWxaMW9iYk15TnJER1I0RTlOWldGYXQ2a1BjU3VtSnFaODJ4ZHlUUmJoS09E?=
 =?utf-8?B?ZDhOMnZhQmFxeTFsdzdQQk40bUd0dGdJU2xpaFRCYWFCYlFDVDlmQ01RUWlB?=
 =?utf-8?B?YjN0aUpDejQwTExIRTUwTnFBM2FuZmZRZ1FSUmpLTmgvQnN2RE1Pd0lRVmtq?=
 =?utf-8?B?NlRBaEJsdTlMRmJXY1NuY1NKU0RvZ2FzaDZZZ3BWT0s3VDN0S0F0NHpSQTBM?=
 =?utf-8?B?T01vRXFtZ1V0ZldGaEFoNTRzWDc1dnQyTUNOaTVMUlFYVjBXMXU5UzVxTFl3?=
 =?utf-8?B?RUxRMUtaUVFuMHJLSTJJK3ZKeDY0WTh6MExidThFMExjMkRyY1haZHJqTVdl?=
 =?utf-8?B?cHVnbUZURVRuQTB2YlJPdjdZK0xLcm0yc3ZiOXk3SktxMis3WUM2RW4wWDhu?=
 =?utf-8?B?d0puTzVOMktZQ1FWaHQvck1LdmdXa2ZuSmQ0c3N0RnY4M09EQnNnaEx5RUNx?=
 =?utf-8?B?QW9pRDhuaCtNOWI4UjliUURDa1dXaElQUm41aFRmZmYyeEoxVGhCV0tsM28z?=
 =?utf-8?B?elEvamVVZVYzSnV1UTJhR1FoNVBjbGltTG8rK0tlZjNiaTQ4SkdCN2QxekZJ?=
 =?utf-8?B?V0dOaDlmTjdWa0QvRHdYdUIzclV3U2pUaTREV3ZQaEVLRDFBTHREbnRxaG96?=
 =?utf-8?B?R3NmdkYweERtQU8xRVFKOEhQeHA3RGRGT0Q4ZGZWMEc1bWZrZEhpTUdNcTBJ?=
 =?utf-8?B?UkFHVW9IUHdCZXZoZ2ZGd3EwSFByUUNJdUZSSVUzVnczajZVVU4vWkFkcE9a?=
 =?utf-8?B?MkhMK09FaU5WVzFXRWIzSnlLNkUxMjduTmRuOTh3S1JQdzFFUmUwVVdHa3BY?=
 =?utf-8?B?UVBCdzlzYVNXU3E5aXNzdGdiZjBOZHZ5ekxCblJjaWJCYVRVVithSXIydVR4?=
 =?utf-8?B?UjVLazZLTmpjZWxZT2dFY1l5MUVyVkF4QkpUOFZiTHJkaTFEZEVrZllQVjNQ?=
 =?utf-8?B?czRwQWJrVVcwNXdxdWVoNFoxUEpGbk5XaUFKWTVuN05LRlhhbDNwTnJBckZI?=
 =?utf-8?B?cm4wRlkyYXNRcDRTTjNpUHNvUk1aYmJLZFNEUzFhMUdxUUorb2VZdTBoWnlX?=
 =?utf-8?B?NVloVHJKOW5IcUk3MDRIQnQzUEVLZDdkM2xiQ3FLT1dJeWNaQ1RoMnIxUFI0?=
 =?utf-8?B?VUZOYW9LVk5LZ2F6dDJabW16bWVMNmxmU3d0Vk16VUUvbWtDSGVpNWhjbVAw?=
 =?utf-8?B?eDdFYzZBRnFUc1lhK3lrcnpySktpeVRvK011VUVZalZYU296SGRtUzRqamJD?=
 =?utf-8?B?QmFPazgzWHJIZjQvMmFNUzREMkZpenl0SkdmUjdmdk1VQWVYY21PL2dLTktj?=
 =?utf-8?B?aDFveFUxL2N5WVBFbFNkek5HQmRscVlrS20wT1pURC9wMk56amVydzBQakFt?=
 =?utf-8?B?aXpwL2lHVERBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(10070799003)(376014)(366016)(1800799024)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OUZXTnhmNmNFYUVLUWhqOHhvZlV3eWRkempTc0h0WlpUY01VdUtGNVJnSDcv?=
 =?utf-8?B?VmxudXB4enpZSUlPZmFOYU1XMUVIUlJyOEFNUG5RWnRRRjNTMU0zelJqUS90?=
 =?utf-8?B?QTE0MmF2SHZHMWFTNFBkUnZFLzd0cVVSZ213cXBlZUxKUWFEY1prVlFFbnFD?=
 =?utf-8?B?dGcyRlJ3YWZFSndEVm1ZaE9pU0JjTEwzNGVDcDRhcmw0Q3d1dkR0Y0c1dGtS?=
 =?utf-8?B?QzFzL3hLbTBXWlZhRDV5eHRqMVQxaWZkM1A4b1F2ajMreWNNM0dSRDhtR2Ev?=
 =?utf-8?B?cU5iaEVLaHNRalJ2V0xiVmp2OFJmYWtDVndXYzBwdVd5OU1rZC9jSFFQK0FY?=
 =?utf-8?B?TGN5dmF0U2ZiYmF3ZkdnbjBKTmo1aHNRREpjSTBjRlJpdGNPMTVPSnJtR0ox?=
 =?utf-8?B?R3JqV0dNU2NVVndqL2xuVGhMTmh5a2VhYU5tK0gydHVkQWVIVUxHVU9yZ0R6?=
 =?utf-8?B?OXNndE9EdHRsUUJSeGpVZWMxZFlCK1NGS3c2bW9KSXg0NjJPSGxsdVZnWjhT?=
 =?utf-8?B?NUs4NTY4NGZCbDV6SkpYc2V3TEpYSmkrMU12S1d5cXh0Vjgyclpsa0pYYlEr?=
 =?utf-8?B?YlNNZzZST01NUFFPdHJPdTlOcDltTjhIcWkxLy80ZHNEdXJjRlRHZ3ArUUc0?=
 =?utf-8?B?ZlpKcFpEYXR1STRPTzQyTnV3Qm5KOVVrQU8vNDFiZ2NTMGN1SDRyWVV4WG56?=
 =?utf-8?B?eGVWMFVIM0tLTEpZWjJWTDFIZlpybUdlc3o3RS9mVTdZTTliRmFsNUFHclVG?=
 =?utf-8?B?eUNxTU9mZkFHbEp1bzJQd1NwV2NGYms3dE4xYXIwSHNLQjZrWWYvSFgzVXFJ?=
 =?utf-8?B?TjBBdU1BUjJ0K2dLcUwzVmxuQVp3K1dYdFlVdUpJaGdBOWt6TWhHZ3N5Y29J?=
 =?utf-8?B?ak9JUlh2dkE2bVR0NUJEdjBzQ01xTEFBYlFmQWNtV2xrQXpqcVZoVlhZNm1r?=
 =?utf-8?B?T2hCTXRaUG9ZcGxUUUhzVDdibU1mbUNJUlhMMXVLZUtCd0tQNm9GbEVSRVZn?=
 =?utf-8?B?a0Q3cnBhWUNEZStuSHRuSnQ2emZPTjBUbXpzV3B6dUYvaVozNDRVWm9uR0VH?=
 =?utf-8?B?S2JmVjRvZ1JzTGtRRHl2dS9XVStzZWdwWHRWUmR4ZDFzbW14T3YxRU5kcnd1?=
 =?utf-8?B?SnF3NTRneHovallyUm5TMlYydk05M0dZQTBEZGVNcjI2V29HNmRZc2JiL01O?=
 =?utf-8?B?L3loeU91ZHZHUnIxZko2YVRWdXZ1ZDdjcXpyU0FVYWE1UkJuV2tuWVVqNjZQ?=
 =?utf-8?B?SXB5YlowSy83blNlbmZJWXlmbzBZT25raHREdTZLanNGWEdabnJuMU5pRGFC?=
 =?utf-8?B?RTF3VzJxVlplNURJNmVhNTBHMGNFN2dvNlBnc3NrZzljaGE3K0xabTVNUG5L?=
 =?utf-8?B?MzkvbE56SmtaaFpPY1BocDF6a2pKY21HL2lDQkhOelc2d3B2UElUZEtjZ0pu?=
 =?utf-8?B?RDl5YVQzb2hpdDJpb3JodkdtdENYQlFUVTdsbTdaSGxwUnUvOEdHZWI1Tkc2?=
 =?utf-8?B?TCtPUVgzd1M0WVFBYngxWnlvaUJlY2cwVW5VenZvMGU1VVVseXhrZkpoR2pW?=
 =?utf-8?B?ZlNCaHlLeXhzL2RYZjFhbVc2KzYyamJLM25makZZT1o2UW4xcnlJQzJvOGRZ?=
 =?utf-8?B?a1BZVlducXFJWnlseWxuSVNZQVBYZTdRM3BJNzhPWDQyOVpQdTEyWk1OdXNy?=
 =?utf-8?B?ejkzTmx4L290SG5sV0Y2VElGU0dyaWNVbGpOb21LWWNMRDd3NXRrbmVGMWh4?=
 =?utf-8?B?TkYwNEc3VUVtTWxiZXJwYTJudDRQMTRGd2F0dTM1akZZR2pqSmdFU1lYd3Rn?=
 =?utf-8?B?eEExdis5RUZ4YmtWL2k0by9BZDBacUV2OVFnT2tVRGpqeUwzMUZPQ0lpc3dH?=
 =?utf-8?B?RnJVcDNZS2JXaG9ZblFQR1RpU2tzbXVMRlVUeXBKZTNteFYrMmpraCt2ekFG?=
 =?utf-8?B?SGFLQ1Q0bHhqdlZ2SGpyempIc2RrRVFaZTVkd2FiZEpibVBjMEJxV00yaW9V?=
 =?utf-8?B?RCtjT2NjVWJBWGtURnkxRnRyVlBvYnZYOFpQdWQvQUpVRlc3WStSazAvd0NK?=
 =?utf-8?B?c1lTZ25penRrZEw4VXZrQWxleTAvS2lnTFp4YXNPL2hXdzE3MHZQT3ZSVGpX?=
 =?utf-8?B?a0pLa0hsY0lpTWZnWGt5eUdWc2R0cktONERwZHVFNjV0c0R6NnRtQ3NweHEy?=
 =?utf-8?Q?SI6NiqjONtMzFYI1rxgfKhMd+cw0j02PUJaWAGkKalNW?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aef7c337-b87a-433f-f742-08ddaf34c1ee
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2025 13:25:28.4578 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ta+Vc1WbMtbnPayCkN6ybL36luhmVI7ACPdkvpY56DXRtW2UknGpHnCwWLWPRFreRmDdPIHLmcZPg8IsrMvY/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4353
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

From: Joel Fernandes <joelagnelf@nvidia.com>

The PMU table in the FWSEC image has to be located to locate the start
of the Falcon ucode in the same or another FWSEC image. Add support for
the same.

Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/vbios.rs | 179 ++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 177 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/nova-core/vbios.rs b/drivers/gpu/nova-core/vbios.rs
index b9879590ae3aae6517683a6ed02f7f639055598e..445b7ee5893c9d16a82254e70d937a902b1d0fae 100644
--- a/drivers/gpu/nova-core/vbios.rs
+++ b/drivers/gpu/nova-core/vbios.rs
@@ -330,6 +330,111 @@ fn image_size_bytes(&self) -> usize {
     }
 }
 
+/// BIOS Information Table (BIT) Header
+/// This is the head of the BIT table, that is used to locate the Falcon data.
+/// The BIT table (with its header) is in the PciAtBiosImage and the falcon data
+/// it is pointing to is in the FwSecBiosImage.
+#[derive(Debug, Clone, Copy)]
+#[expect(dead_code)]
+struct BitHeader {
+    /// 0h: BIT Header Identifier (BMP=0x7FFF/BIT=0xB8FF)
+    id: u16,
+    /// 2h: BIT Header Signature ("BIT\0")
+    signature: [u8; 4],
+    /// 6h: Binary Coded Decimal Version, ex: 0x0100 is 1.00.
+    bcd_version: u16,
+    /// 8h: Size of BIT Header (in bytes)
+    header_size: u8,
+    /// 9h: Size of BIT Tokens (in bytes)
+    token_size: u8,
+    /// 10h: Number of token entries that follow
+    token_entries: u8,
+    /// 11h: BIT Header Checksum
+    checksum: u8,
+}
+
+impl BitHeader {
+    fn new(data: &[u8]) -> Result<Self> {
+        if data.len() < 12 {
+            return Err(EINVAL);
+        }
+
+        let mut signature = [0u8; 4];
+        signature.copy_from_slice(&data[2..6]);
+
+        // Check header ID and signature
+        let id = u16::from_le_bytes([data[0], data[1]]);
+        if id != 0xB8FF || &signature != b"BIT\0" {
+            return Err(EINVAL);
+        }
+
+        Ok(BitHeader {
+            id,
+            signature,
+            bcd_version: u16::from_le_bytes([data[6], data[7]]),
+            header_size: data[8],
+            token_size: data[9],
+            token_entries: data[10],
+            checksum: data[11],
+        })
+    }
+}
+
+/// BIT Token Entry: Records in the BIT table followed by the BIT header
+#[derive(Debug, Clone, Copy)]
+#[expect(dead_code)]
+struct BitToken {
+    /// 00h: Token identifier
+    id: u8,
+    /// 01h: Version of the token data
+    data_version: u8,
+    /// 02h: Size of token data in bytes
+    data_size: u16,
+    /// 04h: Offset to the token data
+    data_offset: u16,
+}
+
+// Define the token ID for the Falcon data
+const BIT_TOKEN_ID_FALCON_DATA: u8 = 0x70;
+
+impl BitToken {
+    /// Find a BIT token entry by BIT ID in a PciAtBiosImage
+    fn from_id(image: &PciAtBiosImage, token_id: u8) -> Result<Self> {
+        let header = &image.bit_header;
+
+        // Offset to the first token entry
+        let tokens_start = image.bit_offset + header.header_size as usize;
+
+        for i in 0..header.token_entries as usize {
+            let entry_offset = tokens_start + (i * header.token_size as usize);
+
+            // Make sure we don't go out of bounds
+            if entry_offset + header.token_size as usize > image.base.data.len() {
+                return Err(EINVAL);
+            }
+
+            // Check if this token has the requested ID
+            if image.base.data[entry_offset] == token_id {
+                return Ok(BitToken {
+                    id: image.base.data[entry_offset],
+                    data_version: image.base.data[entry_offset + 1],
+                    data_size: u16::from_le_bytes([
+                        image.base.data[entry_offset + 2],
+                        image.base.data[entry_offset + 3],
+                    ]),
+                    data_offset: u16::from_le_bytes([
+                        image.base.data[entry_offset + 4],
+                        image.base.data[entry_offset + 5],
+                    ]),
+                });
+            }
+        }
+
+        // Token not found
+        Err(ENOENT)
+    }
+}
+
 /// PCI ROM Expansion Header as defined in PCI Firmware Specification.
 /// This is header is at the beginning of every image in the set of
 /// images in the ROM. It contains a pointer to the PCI Data Structure
@@ -575,7 +680,8 @@ fn new(pdev: &pci::Device, data: &[u8]) -> Result<Self> {
 
 struct PciAtBiosImage {
     base: BiosImageBase,
-    // PCI-AT-specific fields can be added here in the future.
+    bit_header: BitHeader,
+    bit_offset: usize,
 }
 
 struct EfiBiosImage {
@@ -599,7 +705,7 @@ impl TryFrom<BiosImageBase> for BiosImage {
 
     fn try_from(base: BiosImageBase) -> Result<Self> {
         match base.pcir.code_type {
-            0x00 => Ok(BiosImage::PciAt(PciAtBiosImage { base })),
+            0x00 => Ok(BiosImage::PciAt(base.try_into()?)),
             0x03 => Ok(BiosImage::Efi(EfiBiosImage { base })),
             0x70 => Ok(BiosImage::Nbsi(NbsiBiosImage { base })),
             0xE0 => Ok(BiosImage::FwSec(FwSecBiosImage { base })),
@@ -679,3 +785,72 @@ fn new(pdev: &pci::Device, data: &[u8]) -> Result<Self> {
         })
     }
 }
+
+/// The PciAt BIOS image is typically the first BIOS image type found in the
+/// BIOS image chain. It contains the BIT header and the BIT tokens.
+impl PciAtBiosImage {
+    /// Find a byte pattern in a slice
+    fn find_byte_pattern(haystack: &[u8], needle: &[u8]) -> Result<usize> {
+        haystack
+            .windows(needle.len())
+            .position(|window| window == needle)
+            .ok_or(EINVAL)
+    }
+
+    /// Find the BIT header in the PciAtBiosImage
+    fn find_bit_header(data: &[u8]) -> Result<(BitHeader, usize)> {
+        let bit_pattern = [0xff, 0xb8, b'B', b'I', b'T', 0x00];
+        let bit_offset = Self::find_byte_pattern(data, &bit_pattern)?;
+        let bit_header = BitHeader::new(&data[bit_offset..])?;
+
+        Ok((bit_header, bit_offset))
+    }
+
+    /// Get a BIT token entry from the BIT table in the PciAtBiosImage
+    fn get_bit_token(&self, token_id: u8) -> Result<BitToken> {
+        BitToken::from_id(self, token_id)
+    }
+
+    /// Find the Falcon data pointer structure in the PciAtBiosImage
+    /// This is just a 4 byte structure that contains a pointer to the
+    /// Falcon data in the FWSEC image.
+    fn falcon_data_ptr(&self, pdev: &pci::Device) -> Result<u32> {
+        let token = self.get_bit_token(BIT_TOKEN_ID_FALCON_DATA)?;
+
+        // Make sure we don't go out of bounds
+        if token.data_offset as usize + 4 > self.base.data.len() {
+            return Err(EINVAL);
+        }
+
+        // read the 4 bytes at the offset specified in the token
+        let offset = token.data_offset as usize;
+        let bytes: [u8; 4] = self.base.data[offset..offset + 4].try_into().map_err(|_| {
+            dev_err!(pdev.as_ref(), "Failed to convert data slice to array");
+            EINVAL
+        })?;
+
+        let data_ptr = u32::from_le_bytes(bytes);
+
+        if (data_ptr as usize) < self.base.data.len() {
+            dev_err!(pdev.as_ref(), "Falcon data pointer out of bounds\n");
+            return Err(EINVAL);
+        }
+
+        Ok(data_ptr)
+    }
+}
+
+impl TryFrom<BiosImageBase> for PciAtBiosImage {
+    type Error = Error;
+
+    fn try_from(base: BiosImageBase) -> Result<Self> {
+        let data_slice = &base.data;
+        let (bit_header, bit_offset) = PciAtBiosImage::find_bit_header(data_slice)?;
+
+        Ok(PciAtBiosImage {
+            base,
+            bit_header,
+            bit_offset,
+        })
+    }
+}

-- 
2.49.0

