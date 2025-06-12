Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0677AAD72ED
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jun 2025 16:02:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88D9F10E848;
	Thu, 12 Jun 2025 14:02:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="g3+JGvoG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2062.outbound.protection.outlook.com [40.107.223.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94C2710E7F6;
 Thu, 12 Jun 2025 14:02:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V/sLJLOZgl4CnpBQubx/1ggkOhHxeKJ+r1RuQ2NO+mLoFcWf703N2ww66+Jp8b6x+NsrGA6A4Iru/VQD+mKw152iZPvjGGxzJuQllXE7mM4kS8YsFL9N3gSEhlCGAwyaeXyyXWelxUU/g1YtoWx5hxKMD964Ql99HGHhAiaqkSfiSGG2nAFYEZWnbMMKVZck7X3MRFK8/+CkiUUwB4no7aOOK65JM7DDdF5XUcQQsxNMut77wTcxbTCJCVBdar4hIpc80RD4DBM7Wk6aGH7uNMFMxEObNgjzUDKpPmc/hcxzxA0gR59Ay/2oS45zRg6jNlDGXYui4laiKgYZjmOWxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g9TS1eDRRpS8VuHGdD7ZMg7HzU6ywFQ3JbP8B0RHMMA=;
 b=W5GQWQ8i7cE1BR5ouOxu6pA0fRH68AfkYyKXiy5WTZZuJDDSNR2Ngwxstqpn3U236ZF6FRq1JxHRr7Wi0/DM1GtjAN7YSDe3lCv3vIN+eVuZg1qgpocvnmeGpoZaJ0gOeFK12BUY4vs4W8Ltt6r404xrEopnwGlQluTdYwq969LPU+wVkKyOEInTy3xVoqX+3owPV6cY+oLnsxgOW0RsLwCvqLWXn2Rr+zv0HprtY5SzFV5QBK4+ND8WC2CAp77hbjEQT19q7oOFtAO9lGLPtQlS/+yiDHNzFKxZ8GE1/TSQKJPEruBSr1x95pLsinm5Lz0s6gS/jb3RMOU10xHAng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g9TS1eDRRpS8VuHGdD7ZMg7HzU6ywFQ3JbP8B0RHMMA=;
 b=g3+JGvoGOYAAof7MgAlZmTMRDUUJm4PzQa1nH3sZK0fN8M3khteHTY2VqRJAoOivdqzceaK0Y5S5gGyUTflDqRUBo8qFqKEeH2ptTa1SzRGfnmx7arg+a31KrdjaGrGiBHO2fA5Af1EWZmqR0oF9HjlfMRBGPuCokwBSs9m2q39LSG/r9Uqspj1sFAkvCkCmx7hNF4Ai0Qx3ZSIBiqAtYnmi0/1F6nJE5K7uWFV6AdHtopoUandcdCKC9fGPaK/AEDfwWaKJ2xP74fbhRyYwH+XtKIBuCiUmuDnpCjtGUEGJugfbiAB6WBFGdHL8u1WW2jwuKuzDh0v4iMef9ordDw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CH3PR12MB8458.namprd12.prod.outlook.com (2603:10b6:610:155::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.18; Thu, 12 Jun
 2025 14:02:31 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8835.018; Thu, 12 Jun 2025
 14:02:31 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Thu, 12 Jun 2025 23:01:29 +0900
Subject: [PATCH v5 01/23] rust: dma: expose the count and size of
 CoherentAllocation
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250612-nova-frts-v5-1-14ba7eaf166b@nvidia.com>
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
X-ClientProxiedBy: TYCP286CA0217.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c5::18) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CH3PR12MB8458:EE_
X-MS-Office365-Filtering-Correlation-Id: d350b39a-b2a9-4ba9-14e2-08dda9b9c606
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|1800799024|7416014|376014|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZWh4SFlacDRLd1czOWxaOGdwNnRkai9sZExRQ1llSUhSaWw1NUJJb0pHYW5q?=
 =?utf-8?B?VEpqdm9nRXNWUGErU3BPaGhqcFVsVm9kWTVNclFGOENNSEc5eDA2cmZaclBt?=
 =?utf-8?B?aVoyZFVZOGRtNHczeGJmTUFGbXVnZkk2K0EwTjlRUXhyS0JxUUNyYVVuNWZz?=
 =?utf-8?B?N0loSGI3ckUwVmdtcERoNmF5VWRaK1dzdmFsRDhnU2pObk16WUZBR0pZUFlI?=
 =?utf-8?B?TFduTzRFYWlZL2dqYVViRi8zRk9QY05KS1dCaGlmb0RudURlSUlIN05BekhO?=
 =?utf-8?B?aDdFQ1ZwaWRodEl3VFBUR0U0S3o2T3RaMVVRbWJ2cVl4WmdoN2xGc2lTY3Zh?=
 =?utf-8?B?UEhtOWJVVU1DRFJuMGUybDE4NDdPTFdrNCtCTFBEd2NoWmYwVEVHQjlQb0tP?=
 =?utf-8?B?Q2liZ1Y0ckFjd1hxMVhZa3JlTWtoTWludzdZYTdpYWdyb0lpSmgzSlZpWlNl?=
 =?utf-8?B?S1hTYjBEVWJmcUNPblR3U040UEhFTC9QeU5PYkhCZ1NWL0Fha21JaGlGbC9x?=
 =?utf-8?B?dERIZkNCSTVEdWlISkVRcU42V2l1Uk9vL2Y5K3ZxVmZ6a1pMcUoyUkN5L3Vy?=
 =?utf-8?B?LzFsaHFaUGlNL1JzclUxd05rYVpGZ0dSb3Y3R1FCc09mNXJkd3ExWXpqNzJn?=
 =?utf-8?B?YW1uNzVmVy9CeEdSME02ak1FdVQwVytrY0Mvdk1mWUNmbzJmOUZsWXNIaXFG?=
 =?utf-8?B?Z3JNOVNGQm1saDBwZWZsMFFHYjJJVUtuUmsvM1dzUW5ncFVMcXoreGZEMEhI?=
 =?utf-8?B?TGl6cnk2Z2NhTHFqcTBicEhDS3Y5OHNIVWlTR0FwWFFZNko4UlFPeTBBMWds?=
 =?utf-8?B?cHk0c1QvdW4vRGt5SE16Y2kwVnVGN1EwNlJtMmlPcFU1aGVWb29Eakd6WlYy?=
 =?utf-8?B?bnRDdmVBejFpcS9WNzBiaVJ2TU5wbWRuL2lweEk3QjZield1dnVnOXVldU1a?=
 =?utf-8?B?KzdWZm9VQ0FFQzVMakcvQmdtOUZ5blZNbVBpTEdDWWExTWxUbElmSjRTa3Fo?=
 =?utf-8?B?V3c5TEZITENIdjVTOXJnMnZZMlkyYnZPekZlL0dWOG1uUFpmd2UvUEhVdGNM?=
 =?utf-8?B?dE9JZzllaWcvRkMvc1AxQ2ZtZFh1ZGl1dVk4T3VRU2VZeDhBeDJ4dzhWb3FW?=
 =?utf-8?B?b29BQ0N1RGltUGdxdFAvQWlhajRkQmNkbUhsNVU2L0RidGh6cnFGSXBocjVW?=
 =?utf-8?B?eW5kd1FuRnNDNHFhaXBHVTd3Z3JjQU5uTFBJMXZCL1VPK0ZqM3RMNDRremVG?=
 =?utf-8?B?ZXFnKzlOTDF0RTEvRnVST3ZiNi9ieDNBL2szR0d4TW5jUmg3YjN3TTA2MC92?=
 =?utf-8?B?R0pxUVVmbExwSUh5Mm96ZVo4RkhpVmdGcnpJenFldjBSaWwzdXJuS1V1dUww?=
 =?utf-8?B?b3pDL0pKS2hYczZFNTVOcjZyT044bnNzUEcvZHAxdnE3UnQvY2hvd2ZDdzdE?=
 =?utf-8?B?c1ZPUzlaL1VKdFpxUmx0TWRybmtCUkhRTUFnaVBDWE55cGxmWWJFaTMyd1Fw?=
 =?utf-8?B?RUNrRnFTYlQvMnJzSmxmTUlydVZlMXh4YlpQdC8xbjJYU2w3eFJHUkdkUkFl?=
 =?utf-8?B?UUtIbk5zQVBnVDVTVUlXd3BhQlFXdUlCTXh2U3lKMFNOYkh5OXM1d1FYbDRB?=
 =?utf-8?B?OWtidVVsd1hIYXdGVUlnVDBQOXRTcnIxWmhJTkpkdE11S3RRYVUrOTNTTHdY?=
 =?utf-8?B?Unh6TkFWWUdZcXd4U0wyaXFpVkllTnI3Z0k0UDVVSTI4ZDBEc0dTNm4waC9V?=
 =?utf-8?B?WGxrOVBZUVpTUXU2RnNoVUZVdnYySUJTWUJFL01qV2l5RWR6TUllY3BoMjZL?=
 =?utf-8?B?Z1N0aHNEYTB2eWZYaFZRbGpIRDdXdzZFeHVWdzBLdng1cFJYbGdmTVN6R3po?=
 =?utf-8?B?ZDFqdDhPVExvVU1UMzQyMnZHWUZQVkN2alV0MWNCcVRDRTdUNXFSeXZIbm42?=
 =?utf-8?B?N0tOSnRnUzNVaTQxN0oxT1pzTjJOcWZYYUVKeERlVStwREVpVUhmZGFFQzlJ?=
 =?utf-8?B?eVg4TDk4TlJBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(1800799024)(7416014)(376014)(366016)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YlE3V0NRTzlMQmVuTnhBOU8vaHl2UG9LRFAya0JnbDdsRFUxWkZuYUp4cEVG?=
 =?utf-8?B?VjYyRjNYMXRIVDdXWk01YThqZjU3LzB4YVh6K3o5Y2QxSDNlQkt6blFVZS9J?=
 =?utf-8?B?bStIMExXYzFVa0R2ZVN6MHhFYW1KQ0RFNWhXc2xYVlBVcFpGdE5sUHJLbkU4?=
 =?utf-8?B?ek1Yek51dEdkanhZV2RZSWdDUDZpT0tuK1dUS2ZmbGsyVmZWSVl2SDlNdWt2?=
 =?utf-8?B?SXlhVnAvQUFtOU9RaFZ6bVFBNXNVbGduUjB5bk9Xd05NT0pKYmcvMU1MUTE1?=
 =?utf-8?B?UkVvdEZJN2V0eXdObHlnTEExSG8vekRrMzR5TTlrSlA5K01LVktmN1gvRUJx?=
 =?utf-8?B?dVQwOEx3T3dWZG15Wlg4M3FvS1NLMVZqNGpVb0d0eVNEMDY4K0RidGpCamtI?=
 =?utf-8?B?ZjJySytrY3NZc3Q2anVIQ3ZZaFlNU2xpZS9yMXRLSWwwUE53Y1h4Yy9hck9T?=
 =?utf-8?B?M0FTcmkzSWpDbHZ3dUZpbVAvT3RROS81alFBcTJ0Zlk3ME5pemZkTkhhUndj?=
 =?utf-8?B?WHRsNlUrUExMekZDMm9lZzBDNTQxdGdLZVlYSzlVcERKK1VZNkpHV2FnZFRo?=
 =?utf-8?B?eFMrRmlWQmNuL3g5VHNsWkhBM2xFZ3pMWml0cDQ5czBpZ0lsYWdyenRmYitz?=
 =?utf-8?B?bWVzV3JLMy9SZHhpR1pqSWJiaGVFMXQ3YnV5SlVIV0NBenV2QkpzaDRTWkJQ?=
 =?utf-8?B?eC9MV2dGcVB2M1RqUWRuM2Z2b3N5Zno3b1ByZ2dQMGo5MTN3c2pwMFVxQjZs?=
 =?utf-8?B?djJpMlduYk51VnNKVnJUb09GV2g2U2JnS2o5R29TK0p2L1BaMVFOVVlDQTJL?=
 =?utf-8?B?SmJweXh2b1VIN1BlQjFzaVNSeWZsOElRbE1ZR25SVmQ0TTZla2I2V1BnWlZq?=
 =?utf-8?B?NlhkSDl0M3gzT2EvcmF4cmhHU3ZocHVHUjJ4eHFwdEliL2o1OXcwQWp1UFJl?=
 =?utf-8?B?Mm9uaUR2bGZqb3BIVjF2eUJWYU9BSTFPUjFlVFlURmZ1VjUwY0FjaE93VlhC?=
 =?utf-8?B?N3NIZGtKWGhCelVKN0hUM2l3V0EycjBUZjY2V2wwYW9CZzgxVk9qcmlQTGtm?=
 =?utf-8?B?dkMzREVKcG9IaGl4LzJUUElHcEFta3hmRWVEczZaM3ByRmg1eG9IQTJBZlYz?=
 =?utf-8?B?RFA0WUJwVGhiVTZqUEtaOG9oSG1wYVc1MjBRTDl3ay9xczRIRHdTcytHL01o?=
 =?utf-8?B?RnpQbDhUQ0JwcnNRUlBTOFVXMzZZbjJhY3E0UG1kOE9RNDBaQTdRN3hsU1da?=
 =?utf-8?B?Z0MzUE9nb05ITERDbmsyb3RJRGFBakhVb2txeVp6bGhOeUwyNUNsNldDRytX?=
 =?utf-8?B?QUZCdjhROU1ZRVk1YzBFWUlUckQwN2JPMnljNHBCUkZkMzN5eXZCQnZoOHJH?=
 =?utf-8?B?VjQxMzdDd1o2VmpQeUJjVzc1bFpOd3dwdHk2UmVueENydzZMbmxhZ3YwZktn?=
 =?utf-8?B?T2xWcEJpMGNmazZoa002YktUejJBY0pRR1VCcld5b2wvZmpZSjNoZlo4anc0?=
 =?utf-8?B?M1RFa29YK0JBWmpKYW43d29keEYzR3lQdXhUNEZqbXBXOTlyRy9lZG5zeTBP?=
 =?utf-8?B?aGQ0S3c5Tm1xRnR2eEVHQ1FBTzVLKzFqMndXQTRRV3Q1LzBvY2hKVDJUMzVT?=
 =?utf-8?B?ZEFDekY5Q3ZPd3padEdlM1BlVUdUOHJ4NTAyUE5XbHRpdXNNQUYwTVA1TTlB?=
 =?utf-8?B?WmpSV2EwWDArdGI5T3lnd0tWaUhDMHlFS1BrOERVd3ovbVI0UGM0ZmJFZFJ2?=
 =?utf-8?B?T3dRODVkdGs4STZsUmRtM3ZIV3VxUmpRdXc2UXBUUENOWXdaNmFYS3phelkr?=
 =?utf-8?B?WW1VbzNqUklwU0g1b2k3bnBwR3dkdE9SRGlOaEZlcHlOcDdJanNFVEdjSGw0?=
 =?utf-8?B?SkNGekhNZDIzV3hpdFcrNjlyQ2lxYVFaUTA5UXppQUw2UHpZc0kwYWZTYWR1?=
 =?utf-8?B?N2psUE0zaUdCaGdZV2lmQlQvZWUrd2FmTmg2bUFPYUIzMmtmZW1rbmdZdGFu?=
 =?utf-8?B?dTBCR1FBeVAzeDFYUHg5VHpsWVJLQS9oNUptVjAwRkVhbWNJSEh0V3lDcUFy?=
 =?utf-8?B?aFRWUXB3VFlieFVKSDUzcWw4NFVRTnY1clN0SXlEUVJvVk5kWlFPbXVWRS9W?=
 =?utf-8?B?RlEvT1pJVEtDeXJ2UEo3QzBoQ1ozNExqRmYyL0VVTGR6UWE1RTY2eS9TM1Ba?=
 =?utf-8?Q?m2/nmda8P5OjmvIqRt9j78QiYAsCbxEkwrHDRr1mEnBQ?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d350b39a-b2a9-4ba9-14e2-08dda9b9c606
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2025 14:02:31.4468 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6aCOEziyOslJlWBsa+uI2CqzR+9h+wJNWfjB6P0Vo5Hs2Gn/A5/JSQc67vlDnMMNkQb6FlU6nAar9A+m70hjZw==
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

These properties are very useful to have (and to be used by nova-core)
and should be accessible.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 rust/kernel/dma.rs | 32 ++++++++++++++++++++++++++------
 1 file changed, 26 insertions(+), 6 deletions(-)

diff --git a/rust/kernel/dma.rs b/rust/kernel/dma.rs
index a33261c62e0c2d3c2c9e92a4c058faab594e5355..1a6fc800256500ae04099fbf4f9a1bd1115ce202 100644
--- a/rust/kernel/dma.rs
+++ b/rust/kernel/dma.rs
@@ -114,9 +114,11 @@ pub mod attrs {
 ///
 /// # Invariants
 ///
-/// For the lifetime of an instance of [`CoherentAllocation`], the `cpu_addr` is a valid pointer
-/// to an allocated region of consistent memory and `dma_handle` is the DMA address base of
-/// the region.
+/// - For the lifetime of an instance of [`CoherentAllocation`], the `cpu_addr` is a valid pointer
+///   to an allocated region of consistent memory and `dma_handle` is the DMA address base of the
+///   region.
+/// - The size in bytes of the allocation is equal to `size_of::<T> * count`.
+/// - `size_of::<T> * count` fits into a `usize`.
 // TODO
 //
 // DMA allocations potentially carry device resources (e.g.IOMMU mappings), hence for soundness
@@ -179,9 +181,12 @@ pub fn alloc_attrs(
         if ret.is_null() {
             return Err(ENOMEM);
         }
-        // INVARIANT: We just successfully allocated a coherent region which is accessible for
-        // `count` elements, hence the cpu address is valid. We also hold a refcounted reference
-        // to the device.
+        // INVARIANT:
+        // - We just successfully allocated a coherent region which is accessible for
+        //   `count` elements, hence the cpu address is valid. We also hold a refcounted reference
+        //   to the device.
+        // - The allocated `size` is equal to `size_of::<T> * count`.
+        // - The allocated `size` fits into a `usize`.
         Ok(Self {
             dev: dev.into(),
             dma_handle,
@@ -201,6 +206,21 @@ pub fn alloc_coherent(
         CoherentAllocation::alloc_attrs(dev, count, gfp_flags, Attrs(0))
     }
 
+    /// Returns the number of elements `T` in this allocation.
+    ///
+    /// Note that this is not the size of the allocation in bytes, which is provided by
+    /// [`Self::size`].
+    pub fn count(&self) -> usize {
+        self.count
+    }
+
+    /// Returns the size in bytes of this allocation.
+    pub fn size(&self) -> usize {
+        // INVARIANT: The type invariant of `Self` guarantees that size_of::<T> * count` fits into
+        // a `usize`.
+        self.count * core::mem::size_of::<T>()
+    }
+
     /// Returns the base address to the allocated region in the CPU's virtual address space.
     pub fn start_ptr(&self) -> *const T {
         self.cpu_addr

-- 
2.49.0

