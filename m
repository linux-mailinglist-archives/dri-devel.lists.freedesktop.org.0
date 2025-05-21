Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EEFBFABEC2B
	for <lists+dri-devel@lfdr.de>; Wed, 21 May 2025 08:45:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F17D10E65F;
	Wed, 21 May 2025 06:45:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Vzddq7FK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2040.outbound.protection.outlook.com [40.107.237.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3DE910E123;
 Wed, 21 May 2025 06:45:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZCukG19Jko2RP0RJqVFPOtY88/9b+7kfTE94oHQplbnjXGx4QAQrelxfIuU3ReRHtxtoJ+3JiZHAvkNy+jjkLzzf29vjdUnb0ImDjLUWNmcQC5Rt9luHLOL31I4+iWoNFFuqAA5EWMs8RW3zmy1XtKHKySlX6XCYBAvBGDT0JfFFDevjh/3otT+7EZ9PsZgN0f/MpKSgrv64aPDXYvU27YfHfjolFC0LRgTIcnXWe7HJNbMrj8wawrO6eWF1rB8lDt+671Kg1k0tIpMMLOaBgRV1MkY5w2g4x1W/egW8FIyg0l74OjfA1mzrlvsm4hwpdHYHoP1Bn76jQ7F2y37BZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bmugSDiVaAuNj++VQPUcOOPGrCEuS5UMXe6QWRq1fUQ=;
 b=yhpBdi8tOKzRu5qQnQIv4nSQNqM5s0j7vHj0stUzkKAEvPNrPrDg0qoDPLTT4/r9dOzR6tglORrzG3kp4pewFWnjGj6xLCnftaoH6SFFWXrftcMP+o0GTTc9YOk2/OwDOWNFgC9ERkN74YSpPyH5wDjw0PLDxvsMPnaLVZ3VkGkur3i/CLt64ba+yRrGjBOItXCyFs5AMX9zDZyJXNkcYk8pTynVceHjwjtKVPo4HAUzqkUIAcpB0Ygwf0MPzL4oMzITbwSt4b0nxSeHeCKOpwN98w3ZaDcV0AF+lZN/PO/pmi483Vgsa4NSfIwXWjaEK+MhzKQOctVH/FBk8n2h4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bmugSDiVaAuNj++VQPUcOOPGrCEuS5UMXe6QWRq1fUQ=;
 b=Vzddq7FKX2465tMdckjHh/Os9ze7D6SIfw3ocwRJKyD68JPfYGq32J9PBdPnOgQkaU2FJqjZrl3v+sFe882zP8rNgHhbqqydVAlioruzvyy0ajJbQvXQcJGR4bUxvwuYHGPvFlcDBeU1BF69QAzkeDWanzxdfCNh5XQKemYw88nNe48QfM9wGgqHrP0YJMS1hp/VepJCBFJBYaLVNH5a1BvhIC4K9YnDPezhFxPCCvSrR5X5tbZWGeg3y76QPpIVR7RbokSlchBzo95/6PYOuHh0kXhOUAOvvBFDak5yDXHIc9D5NvZchchjAkk8v/Aqg/19LYF8H2kzAXezqEGMDg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by BL3PR12MB6618.namprd12.prod.outlook.com (2603:10b6:208:38d::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.20; Wed, 21 May
 2025 06:45:35 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%5]) with mapi id 15.20.8769.019; Wed, 21 May 2025
 06:45:35 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Wed, 21 May 2025 15:45:04 +0900
Subject: [PATCH v4 09/20] gpu: nova-core: increase BAR0 size to 16MB
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250521-nova-frts-v4-9-05dfd4f39479@nvidia.com>
References: <20250521-nova-frts-v4-0-05dfd4f39479@nvidia.com>
In-Reply-To: <20250521-nova-frts-v4-0-05dfd4f39479@nvidia.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: John Hubbard <jhubbard@nvidia.com>, Ben Skeggs <bskeggs@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: TYCP286CA0227.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c7::14) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|BL3PR12MB6618:EE_
X-MS-Office365-Filtering-Correlation-Id: c895a030-cc26-48a6-9205-08dd983316fc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|1800799024|366016|7416014|376014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WnRHd1VLUko4OVpPenFhOEdHRTI1MnpXS0dFNmpBcUE3WlFXcjhDeGNaRmw0?=
 =?utf-8?B?VmNUNXFEWlRrbHlzTmluTkZnWUIzcnd3WnFBa1AzcE5qRlZMcmJ5bGVicWJx?=
 =?utf-8?B?ZjcwVWRmR0NDV2ZhSEJxcUtHdzN6S01SVWFwZ3ZRTys4WjJFL1lPQTFleVNk?=
 =?utf-8?B?c25FV29vVW1ZN3VoNm52ZDN4OUFuWjNvbUpNMUtML1lCTXFaRFYyZ1E3alha?=
 =?utf-8?B?UlRodzV4blJKNm1sbEU1NUd4cGFlRExISGJ5UjFNYWFITE9NU3hNRjE0ZDFm?=
 =?utf-8?B?eDNRZ2lNek92bEcwd0R1d0ZjTzZDWEg3bUY1UG5TR0p0L0lkUnBCdTN4MThU?=
 =?utf-8?B?RWtQU2ZTOE4rdlkzaTBEdDBoUzZZWjZTTEhOM0d0Rm9WTGUrZW5BRTIrMVlx?=
 =?utf-8?B?MlNncGFFSEtwNStOUTJYSjBmWjd0T21VMmdXZDVqVlJQSEtZeURrL2huM0RB?=
 =?utf-8?B?RXJEejFMZ2pVZnF1SlRkZGNlb3RuOFVGNktjaktTdnJNdHozVnk0aXp2djNp?=
 =?utf-8?B?NFJ1UUh1c0ZYM05seG1HVVhrQjhjelRXUktTa1hwY2FpR1NuVG5uYm1Vd2JL?=
 =?utf-8?B?US9zVUhxZFBSOEpReDRzWTVFNnVsNGZHSDZ4ck9BQVA1WlBsV20zRlpGaktu?=
 =?utf-8?B?VVN2Ny9lYVJLbC9JenczNkZPTlBqOHdQbnJCMG1kUE1hdTNHcllPbGVwRlJY?=
 =?utf-8?B?WjNCTGo0Qm1xYTFEaHdjU1FZajVFcnRWWHBGQjMwd2hBQW5PSngzeDR6cWRN?=
 =?utf-8?B?ZDhqUXVyVzBqK0tZR1JGLy93eHVxM0xjUTZ5RHdKcTBFTXZCVkV4V3JkaHJL?=
 =?utf-8?B?ci9EV29BWEcxSHg5VVZRT0FwVUxRTGlmNkNWdUpDeXJDOWtyWlBzajVMS3dy?=
 =?utf-8?B?cldaM0hDL1J6WmlnRXZrVXVoVURWQXd6ZCtURHhpcVp6QzE0ZFIzV0JlTjN6?=
 =?utf-8?B?RkdTZFdKdFlGek5GSXBJVXl6ellDOG9lc2VBMHBTOHNBeUJlTm1XQ21WSXNR?=
 =?utf-8?B?VHNVWFpNRHphMU5kVXc0S3BVQW5oWXRZWE9oK1lMVkVvNjMxejZOZGJ3aGRO?=
 =?utf-8?B?NVREODA0bzlpSXVXcmpwMHVpSnVPemxEb0ZwWk9EYXk2ZzBJK1BoSnY3dDIx?=
 =?utf-8?B?NU9Ya2ppS003NVh0MmhHQzFJNzZMUTlnY2ovZVcvVjJWV3FYVjhwVEkyaEpi?=
 =?utf-8?B?RjNEWXREWmxkdFRyVVJCei8rRVFmN043K1c1aGdaMDQ0RUYvaFlZc3JhdC9z?=
 =?utf-8?B?bWJUVmd6YmJYVll4U251eE5Ra2VaREsvLzhJaWZiMHVycDJzVmZwUEZwTEN5?=
 =?utf-8?B?aFZabmEwa3I1bVhDdUlKNGVhdGdMYnAyMUY4NytPQ1phWHQzVlJITnM3Z3Fk?=
 =?utf-8?B?YnMwNXJLN05uNlFkQ1p1TEFwS0x2UTdIMmxFU2I4V3hOTldCazlyV2RINE54?=
 =?utf-8?B?S2pkc2Q3KzVOdDlod1lhV25xY0xvUXZpNGsvaURyb0tXVXJZVFRUdUE1R2xG?=
 =?utf-8?B?L3JLSGF4MXEvQzN2U3hKRU82MzlYa2ZDOGZnc2hZdTV2dE9mZVJBcWhpeThu?=
 =?utf-8?B?Q2JQNVdNV2RJK1VENWxZRHZTZElwczROSEZicmJhaXl4ZUtaNnY3N1dZbU56?=
 =?utf-8?B?YUFGa1Z0UnJnTmhOZWpZNlUzWXBES1JjZnNvVDR2MnE4NTRwYTI2UVhXTWhT?=
 =?utf-8?B?LyttanMzTHJwYWwrb1FOaXpEbjZEOVc4SkpPQ21QTkVZWXhjeklEWENtd2ts?=
 =?utf-8?B?cWhBY1Y0V0M4SWpEeXhhKzNpMy9xNUxXWFVPdWhWaG1nWUUxVXh3MjUvc201?=
 =?utf-8?B?Mit4ZTBmVlk5RDUxVWR1ek9XTWIvOHpMMlFNMkxMU2wrU2ZkcE1wMWxWUXVT?=
 =?utf-8?B?WnVGbnJFcTVtdkR4dVh0WE5SMzRLZXZYeU5TN0Y5UHd3K2l2anJwUUxWTTZO?=
 =?utf-8?B?ZUkzWHBtQ0VLVFp4WVJVMGxMSHlnUjFFamd3Zkc2OE9CelJkK1JldjdTaGlX?=
 =?utf-8?B?ODZSVEtmYzhBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(1800799024)(366016)(7416014)(376014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?clhMbjRBeHhTY3MzVFNOM3Ftc2dITkw0aW4rMzZPbXNMZERQQVFUYTBNbk1Y?=
 =?utf-8?B?Z2xrb2hvdnhXV2g4R1BjOWhPaVY1R0NFb0NLdHRZY0tiM3UxVGpLdmdld21L?=
 =?utf-8?B?TkRBcm9iNEMzRG5PVmM0bHZEZHN3M0tKUlR3MFFWWURHSzQ5amJVYU9yZStP?=
 =?utf-8?B?dHhqQmZ0UnNVMHVHclc4Q0hjVjJ3T3FETjNUREJyVmN6ZGxGVEl5MmpyN1Fk?=
 =?utf-8?B?MFF5TndWRjR6bmVTV3Vsc3U2bWsralExK1BPQ3I1L3lyMjRyNmQ5L0N0R0lw?=
 =?utf-8?B?MFp6UmFLb0NTeVQwb1pKTmx5M083TVhLa1RzTVBKNTlrRzI1a2VjUTE3SmFM?=
 =?utf-8?B?cWRjV054TWlNVHhweTg2cVBvRG9DN0JVVG1GQk1venI0b2p4UWFrbFZ1TGF4?=
 =?utf-8?B?dkE1Vi9kZVNsM0RKRlEyeGsrVllkSWlZRm9ybTQyMUJBdXlLcnZnS3Vnclph?=
 =?utf-8?B?UEl6QmZGYXozWHFic2d0TlZCNDhhVHVOMG01bTJEOUQ0U0JOWkVFSDM4MnBJ?=
 =?utf-8?B?VGJHcEdJS2k4L2NqdWVnU1ZXbXpnUDMyUDFwWjlOZ0dvbktmWWFNSHZDVnlQ?=
 =?utf-8?B?SGd1UE5VRmdCQStySEN2ZVpRc3loMm9ucHBJdk1pTnVGOERuRFpVK01IK0xu?=
 =?utf-8?B?dnRYY1pwTWcrVGpwc1ltdEdQNktPa1JnbUFrTmFHakpscmJGK200WmIxemRX?=
 =?utf-8?B?MDlVNGt6WnJWZW9RZWhQcmtvZ1VwYzh3bkpEZEcyWWs2MVVia0UycXMzQlp2?=
 =?utf-8?B?a3E5d2Nva1FTam9CUCtuUUR5VEEyUEovR3RZb2h4dUY3cDBuaDJFVHYvTFU1?=
 =?utf-8?B?OTlaVFdVaTI0SzlsWUtIdjRxTVJzcEVFNXNmMDdibUxxa3N6QXVYU3VPYVVq?=
 =?utf-8?B?czRiYU9QWm1QLzVWMFJNTU1JZzBTZWtYblN5dFVPRDFOaGExbDZMVDV5cDNy?=
 =?utf-8?B?L1U1dWtUMlgyQlUxbHF4VTlVUzdwT0JrTVQzNU56Si83OVFqbW1zeFhsOHF6?=
 =?utf-8?B?UFVhVzBDa3VLeDRocFB4UjlQeER2Z05PWllxZzVIZzRvU3lYT2xhSUJ4K2Jl?=
 =?utf-8?B?TWhjMG9UdEduVk03Z285eXhIbFJJQXZ1dTJuTVZiQlorZUJEQzJCQUkzMzJU?=
 =?utf-8?B?aERPRUdyWUMxL0dIejhjNGcra0g0ZzdqeW9iREl4S1lJTVJIT0pwZ1FWdmFm?=
 =?utf-8?B?UXl0ZnNlZVdpQVYzb1JOZGJRMXhsQmZMRkVkaHVDNUhyN1NlOWVudmNKK1pZ?=
 =?utf-8?B?L1l6K0pUcDRBRWsyWU4xci9oNVcwRnVvajN0Q1NlMVdZdk9DM0pRTUUvMXBK?=
 =?utf-8?B?TmdQTzhDdVZjc25JWTBrNVl3UC9yejJUeEhYWFNyRjNVR2Y5RHA4TmJaS01C?=
 =?utf-8?B?THZ0QTc0dklQVGs3cjNaY1BDOVdveW9mWkVId1VYck5iTkRGS1NObHhvSnF2?=
 =?utf-8?B?RlNUWi90YTRlOStlb3Bjd21uTWZwYVE3ejhDbmVoMHNsV29PTFo1UjZpVHor?=
 =?utf-8?B?R2dJMldCYlBlekxKR2R6SEhRZ1ZsMU5jYVhJeWg3cGErcFVmYTRnSHVQZDRV?=
 =?utf-8?B?V0hEZ3djV2NZNWlkc0NlTG9WVlVaVFlnblFvVWFnQ1Y0MFpzcUV3eG1uUURH?=
 =?utf-8?B?QjhRcTdlYU1zN3RPQ1lVRkdGbSthWWwyc0w5VU9UcGV3VEU2bGhvSmd5SEpo?=
 =?utf-8?B?aTYyY0lId29FV0loR0JWZ0VqRzZzZE9lMVJUakxTaVFrbWhsd25nNlpMQ1dy?=
 =?utf-8?B?VWRMV1dmdWhSbEJXOWpJZ2V4bW9SSldNSDFxeFpYTDZVV1RSVnR5UEg1YmlH?=
 =?utf-8?B?Zm96MWVDUnNXbmloVmhXL0g4SGdtQVJVdmQ4cVltM2lheXM2RXZ2Z1htYzZI?=
 =?utf-8?B?SnpYQnA3bEpaZ1V5OFlNT2NPaFNiclo5c3B6cW1PTUl3bFE0UmRaUTQ5WEI3?=
 =?utf-8?B?R0tROEE2dDJmTzhiYVdXcGxMV0o1YjZmeW5BQTFMQnV0YkpjbjdvdlU2cGNl?=
 =?utf-8?B?L24zVjF1eWY0NzRnK1NGem1NRDdnR0lTRzZmVlNjNWVKdmZNMUY2VWFzZHh2?=
 =?utf-8?B?WCthekxmQlJ1ZlhpRlBxaXJ3WU01c2RnaUxwMVBvM1AvOFoyQWM5RnNHcGlp?=
 =?utf-8?B?OTRNU1p0YXFjVTdKTUZ1ODZNTUdCQlZYYUFnNWo5UUdaQ2hmaEN2WlVHaWpG?=
 =?utf-8?Q?TgP6vMCaCrUbU3ERuO6ik+4agQA1udkbza8vREPDm0Le?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c895a030-cc26-48a6-9205-08dd983316fc
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2025 06:45:35.4240 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7d81jo7kX/Zq3mBqHGHagnQw+YsHfMfARdxidHocu0QJtwXLqYGI4/KsO8UI9fbFO2x3XoU99ewnP0YI++TTmA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6618
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

The Turing+ register address space spans over that range, so increase it
as future patches will access more registers.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/driver.rs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/nova-core/driver.rs b/drivers/gpu/nova-core/driver.rs
index 8c86101c26cb5fe5eb9a3d03268338c6b58baef7..b13d0b7399e56ed36b4ee5b77a0408299d69d9dd 100644
--- a/drivers/gpu/nova-core/driver.rs
+++ b/drivers/gpu/nova-core/driver.rs
@@ -11,7 +11,7 @@ pub(crate) struct NovaCore {
     _reg: auxiliary::Registration,
 }
 
-const BAR0_SIZE: usize = 8;
+const BAR0_SIZE: usize = 0x1000000;
 pub(crate) type Bar0 = pci::Bar<BAR0_SIZE>;
 
 kernel::pci_device_table!(

-- 
2.49.0

