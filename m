Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oPn7I2xtfGkSMgIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 09:35:56 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43F70B8763
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 09:35:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6CE110E969;
	Fri, 30 Jan 2026 08:35:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="hHfPA48b";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11011048.outbound.protection.outlook.com [40.107.208.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE74D10E95D;
 Fri, 30 Jan 2026 08:35:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WCXywSi522/PdBzZc+ncG2pTiwQxZ5mggP6z4mGWZzpVkQMKMxvrmfbrVhNLSS8wlEkTwPwtxUw2aqlIVjVPuwvMuR0CbOITVRW+97HmNCZerIy3DH+CyEG7cBjpw4OvAtvHi+3Yz71PCsieMB19djryZMm3jLRwJRg1cHhImDLH95agm/Gk6c4zYXdFYVZgfakAyiMt+bYmjO/cKyL/AoH3VG4soqiYxI7a17teylrazNmaWQYJrRAnPhEyQvOPojhj39fErKJefRjFrznmR/V+3cH7G6Liw6yRiJSVzaQ18O7HjEgZvFyRCUeusXKXlUNW1uj9/JnbCvQZaSmI6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q6v8DIJiB6u+RO+QviFIZahEhm1VS8Am8soaTwJTE8c=;
 b=qU+Y12Xmp+kCXN1WMjplplp+h9wRD1VE3sKAwYuYwWcdNZwlJYAsA2dlqrbuo4FBxGq+Omy94pOph6KI8VC0PEGtgkXPFMcmtR1c5vudL2yOfKMED4r/Bq3U5FkqdfYNhv2/4lnypWNKdhaD3dMk4wNB2/35FG0x3e3lvJec4SqauGKSzK9qFJIzkwi0X3qgMH67ci7TGEVR3wk5HIjy5j3BoNYIdq/0VI3m9pQWuUBcgifaLWxDnbSEDRL8cAx6uewVvN94UBgi4jKczpXxdsMcyZP28KGtWu0lCGhqCqTqZnk4VT+SFXB3ZWRRMAPuoxzU0+9p9sSrhy5u0S76wA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q6v8DIJiB6u+RO+QviFIZahEhm1VS8Am8soaTwJTE8c=;
 b=hHfPA48bamD9EsqlVjTV/DFqP50s2ewqJyt4j1UGz9yWLqMRzwqa9mrZ2gTZrpPhcwMG+iqsft5Bz2QllNSIIPRzNnzNHc+lCo+n6hV3/TJSnMCTfJEmoYujWTa9f2aLrpgJdjk9nnY9sqv0IYSUTf0iykfOhXCHu8Y2FAEg1+DGT90xgxpjwiYwadpC/HRXzdWoOBz11J0aTP1k3uRaeJDb5pVVKWjiU/I1Hz7ls1AKZ9TlkNohYkS6u2LqW3ANbdhUxgBXWC56sjVAYMzI9NcEmGlXQXbotLFhRNBY7UDZFpANxL3KymHySbkxcPYYuAxRotEILiAljyetQhhYdA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2353.namprd12.prod.outlook.com (2603:10b6:207:4c::31)
 by PH7PR12MB5757.namprd12.prod.outlook.com (2603:10b6:510:1d0::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Fri, 30 Jan
 2026 08:35:48 +0000
Received: from BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0]) by BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0%6]) with mapi id 15.20.9542.010; Fri, 30 Jan 2026
 08:35:47 +0000
From: Eliot Courtney <ecourtney@nvidia.com>
Date: Fri, 30 Jan 2026 17:34:09 +0900
Subject: [PATCH 6/9] rust: dma: add dma_read! and dma_write! macros
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260130-coherent-array-v1-6-bcd672dacc70@nvidia.com>
References: <20260130-coherent-array-v1-0-bcd672dacc70@nvidia.com>
In-Reply-To: <20260130-coherent-array-v1-0-bcd672dacc70@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, Alice Ryhl <aliceryhl@google.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Abdiel Janulgue <abdiel.janulgue@gmail.com>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Robin Murphy <robin.murphy@arm.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Trevor Gross <tmgross@umich.edu>
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, driver-core@lists.linux.dev, 
 rust-for-linux@vger.kernel.org, Eliot Courtney <ecourtney@nvidia.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TY4PR01CA0097.jpnprd01.prod.outlook.com
 (2603:1096:405:37d::10) To BL0PR12MB2353.namprd12.prod.outlook.com
 (2603:10b6:207:4c::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2353:EE_|PH7PR12MB5757:EE_
X-MS-Office365-Filtering-Correlation-Id: 64ab1e48-d2fc-4f28-ecae-08de5fda913b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|7416014|376014|366016|10070799003|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QVJMdVNPTTVMNWJzMzVTUld3aU5SdmFXMGIrMkJGTlhGbEVFOHpLUmhVSW5o?=
 =?utf-8?B?YVlFQWsrVk4wZ1lqaG8yMnBTYjlQMjlHZXpiVnNmaTdaS0xMdDYzaHJXUFJx?=
 =?utf-8?B?R0FZbTVWay9hU0JwN0tja2tmTysyWlY1a2w2SlhPK2d2U29mWDhNVDZVVG5S?=
 =?utf-8?B?MkhMVEppR2N4NTQxUUxoQlJHM2hQWURBcjd1SXFpbWVMRUNRUFdQdStYdEVp?=
 =?utf-8?B?bWJVL3Vpa1BzcEt2T3RxRmZHSk1RRGN1ZTJSYjhlclVKamNnWmhjck56U29G?=
 =?utf-8?B?aktSdm5EM3RScExPd0o2UmFkYmtpYWZNUlIrZFhMZFZiTWhEMUlCbzRtU3dp?=
 =?utf-8?B?VHVLNW1kWGI4SFkxZkUya2w1aVZnTmFwNTl5U0owc2I2WG93MTB6MkozU0Y3?=
 =?utf-8?B?TEtnRnhuOHcvMVZxaUNoTm4vMHVHZjFmcCsrU01kbnN5T2tHMERDT0VlTWow?=
 =?utf-8?B?bFZJaVgzbTVpMElDb3Y4bDdSZnBKZUczK0hzS3pJUGdoT0t6TlB3WjlSZng0?=
 =?utf-8?B?V25yeWcvc2ZCVTRDY0JmZkgvL0tXVEd5c3FVdk9CRDloVC9FV3JJWW1QV2ZE?=
 =?utf-8?B?Q1VVa29vbHlUNzcyQTB1Q25ibVg5RFpmMm5qbEZEWlYwNW1RZmZXNE5UdUZH?=
 =?utf-8?B?TE4xZy80VFlXVmpmOHJGTnVZOFVXQ01lUmxrWk94cW1XUmdDaDF6OTBOWjZv?=
 =?utf-8?B?R2MyVEsxUGN5cDMwcmhPNlRJekZKblRPaXR3czhCN0J4RFluM3QyVkRMdWkr?=
 =?utf-8?B?a3lreTh1UFJSWXZic0RMRjVHcWlhamRVeWJXdTlVamkrZ1p5NU00dlVsVGRV?=
 =?utf-8?B?cEg3cjNxb0loQzhEbXp0R1hUT2ZoSlBSOHlLOGZQOE0raEtpUVNTKzdBTUZs?=
 =?utf-8?B?T3lDVWd6N2lSQVhTczQ2bVFFR3JNVG9LaHYwU2psVFRscnJzWUs0OUJtd3I3?=
 =?utf-8?B?YTRrTGZOajFvMTBZdGU2VnVvZ0UzYk4zMHFrWGFGZnpBMEpKK3FBdVVjK2VJ?=
 =?utf-8?B?dFV4VHlWaUkwbVpVcDRvMHo2WHJ3dTFGTDhleHlZWkNyMUlFayszNzdXdmY5?=
 =?utf-8?B?U3dCbHBZOE5UYUJ3SWxkUVpTUndHQTdMY09rVHZockxaeXhzYUNyWTFVZ01s?=
 =?utf-8?B?Q3dCaGNkOVBVMVpLZTF2M1lULzlQNFIyRkQzNE9HRVJ6R1dXQkNsNjRxZUM4?=
 =?utf-8?B?eldZYkxsWnZlQXZXQzVCQXVnT0pQS0F6MFJUcXhxYTJBSWErSFRkTi9JNlRn?=
 =?utf-8?B?d0V1a0hKVGJNdlJHWGlPdFphZW9UOEN4bWpiNkFGbUQ2RTZIRUwyRTVaVzls?=
 =?utf-8?B?V256eHBXMTlPVUZ5WTNjU2pXbjZnZnpjRkJqRW1zSlhiK3ZhYzY5UG40OE5i?=
 =?utf-8?B?Qmc4S3dsa3c3NUhNckxKVW0wTlhHWlgxakF3OE9uV3B1dU1JdXRDZXRla3NP?=
 =?utf-8?B?MVJocW9BbXNGVGw1Mk1HcUF0U1d4WW9XV0ptQWpIUlFPVTJmOGNWMXhweE9C?=
 =?utf-8?B?UW9HVG1UNGJGV3o1Z2dENmgxSGk4aCtUb1BDcE00dk92aDB6WFNZbnlINUdQ?=
 =?utf-8?B?dTdvcDF3Q041ejVkd3F2bnZsYW5hRDRMYWJRdWJrY0lBTGYyc1hyRitHV0hi?=
 =?utf-8?B?ZlVtMHBiWmIzNUU5Sk1OVHAwbmtnMzZZR3lKZGRzTy9vSGo5WGMxU0JrdDdH?=
 =?utf-8?B?eG1YSmgyVlBZa0h1VncyZWVObGhrY0xCOEJMOUozZy9Da1F2K0VzT3FITEUw?=
 =?utf-8?B?S1RqclBvNFZLNWtlSUZXL3JOaXlkaFdpQXM2MW1hUzB1QVc3ZFZRRjdKM285?=
 =?utf-8?B?UkxPdTV4VVorUkxUKzB3bWJNL1hMTVRTMnJjcVVHV1Y4QXJscVZld0hHV1NY?=
 =?utf-8?B?Vkg1aUxObWMzZFRPdDArbGsrempkQ1BCRDZXM2Q2TDZ5WTVPbEcwQUhVZ1Q2?=
 =?utf-8?B?MlltdlhpK1JZUGQ1N3llaUtmUTdtbHhaaGZBTlpxbThERW9RUWYwMEFQbzFZ?=
 =?utf-8?B?c0IrRk9OYXZZd0o3N1lUTEVWMXJTbkxLRjh0SlpJRXhaRThTYXJzb1VqZFB3?=
 =?utf-8?B?SS9tQ0hMWisxMU5XVUNsNnNDVjQ3a0MvQ2cvZ2tLdDhBbXB3VUUvejdvN1l6?=
 =?utf-8?B?YkFMQlArY2pDZFNRcmQyRldsTS9yK2JNSnh0S1ZIWUlnV1ZQSmZBcmxQWUsx?=
 =?utf-8?B?MkE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB2353.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016)(10070799003)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VzJsUTQ3R1ZNYkhtSUovR1NHQitLQklBa3lDMnBlY042T01Md1BhRVF3alZG?=
 =?utf-8?B?by9kSk9aYjR3M0hIc0lNelI3SHJ2aUdMNnJYZXgwajRrRjJSbVFCUUM5ZFo2?=
 =?utf-8?B?YjNtMkNldFVUaUNaUm9paFduRmIzT2psaTBST2lJeFpXUDZRaVA0VmEzRjNW?=
 =?utf-8?B?dzFwUnZEd1lRZXM4S2Z3eEJQeFR2YmZ3K3pFb0JQcE1jaVZ4Q0krZnRZT29R?=
 =?utf-8?B?NlNJRXBnL0JSN1dpb010OTBDc0REb2FxUlcvSFNTbnRRRm1iWTJsNzBLV28z?=
 =?utf-8?B?bUxHS2VKQzBubVIrd3RyanpLelFSeHc1ZjZpbDlOTy9oaEhrR2ZRLzZiUnN1?=
 =?utf-8?B?UlQ1Q3YwSHhaa1IxcUR6akJzUjFXMlpNdkRNTmgxQ2hURkZpZmZIaFRpaTNL?=
 =?utf-8?B?aEhTWnIxMHpnTTdSckJYZ1FpSXZXWUJ3TU4vSGRDWDc2TEltdFROQnJXYUhW?=
 =?utf-8?B?ZmF3QU5NQmtEVzRxdzBWTjJTMG1Ubkl2MnFnZzNIUDRQTkZzaDdqcFdJTVZp?=
 =?utf-8?B?UmprMEtmdTFrSzRvN1JvM3prZUhpc250dFBnZHlVVjJneEJaTldCKzAyb1NE?=
 =?utf-8?B?WDgydDMzNlBxd1NvSzlXLzNWemlyQW9qY2NFWTZTS0tXTFNidC8vaUIzbnl6?=
 =?utf-8?B?SFNudTBXY25kdmJBdHE3b0NiclBrbU9qdEh0TFEvdkxxTEgrcXcwRTlWSTVs?=
 =?utf-8?B?WnlBL3UyV0NEZHF2dk1qZ2RMM0Q5WnlSOTNzSGV5NnYwMDNoTkxVZFZQR0tY?=
 =?utf-8?B?OGlMRkg3dnh1Ym5Wbit2UVpEQlBVUm1QZmxrdURGOGdDZ2JFSTBBcDJ3WmRE?=
 =?utf-8?B?Wk4xOXduK2ZGT05rMjZaczl0K08yNUFOREs0S0R6NytubE0wRHlXNmtwdjJQ?=
 =?utf-8?B?Y3VuK0ozQWNwOEdIck1ZaVVUSDZqd0d5d2RPRkU4YnJMY25yeWtOanJwemNo?=
 =?utf-8?B?WlNvVmVQRHNJUGxGUDArOC9FVkRIZTNoMjhqMjJzWDJyYkxORENsK28rYVBU?=
 =?utf-8?B?SE90M1lnSHB1dzVYenVCcGJjUG9KSHl3NDhPR3g0N3NHeWZobG1YR3hLeVN5?=
 =?utf-8?B?a1NUTDBqRG92eno5dGFzdHNhalZvS0d2Y3NycytUNW5SZlZMZlpTaWlVUGZx?=
 =?utf-8?B?S3JUekY3MzFmVDMrRkw0UldsRTNrS3ZDcGNObEhRWEtRT3oyVERxYmRJVFQ5?=
 =?utf-8?B?dmRHZFBzdWdDYk1BTGcrSUNXTDZSSDM4OXVXOGVxTFlscmRjNzZUeWNuM3JN?=
 =?utf-8?B?VzdWRW1RT1FzK2dLTm9uYkNOVXg1SWhHbnZJOXU5dUxQNW1RaWM2TTVnYUo1?=
 =?utf-8?B?THh5cGRHVE1DYWhVOEptM00yMVEvbG40citDKzlpREIzcEdFZzdiVE5DK2Fj?=
 =?utf-8?B?Tyt5QTNKTGIzYk9CSkFlK29QWlJiVWhTUXJ6VnJhdjhpTU9wd25BZVNzYzZZ?=
 =?utf-8?B?Q2pLTDJVL05IM0twaWZUSlh2bGo3K2hySlJXbGRDVFlMRlIrbGhjTUkxQ0Yx?=
 =?utf-8?B?UFFDcHdtTVNvYWl1YnRrZTV6YmpyaDRiZUMyQjFrQnQzQWJBQU1TaTVtY1l4?=
 =?utf-8?B?N1o1cDkrSHN3OTFaODZYaVhIR21MV043cVk3aW1ieU1HdkNvTUpSakt2aHor?=
 =?utf-8?B?bFFDaTl0VEhkeXp4WGVFSW1MenFOSXdLQkdicjV6dTV5NDA0aEh0VkhTVmtw?=
 =?utf-8?B?Z3VpRDZTcVExRUUvSmFYZzFTaUdWRjJLYlJzWkFxTWV1VDZvLytKQU1XdEpC?=
 =?utf-8?B?UnBsTmhENy9QSnNBNCswa2hwdWZYdmE2VVRPUGwrL0orSE1hbkxacXdEMlJr?=
 =?utf-8?B?R3RMTjY2T0IxRmhwMGJqRGhnZnMrM3JwcjRCWnRhZFh4VDhPbEF0b0czbUpq?=
 =?utf-8?B?WU5VNzdVYlAvU3ZaKzJLSUVySHVnWHJ4R1BNUmdmc0NFVkV0UnpRMFNQUnA0?=
 =?utf-8?B?VXVEZE9KN3pzSjExTmlHMXJZSE5vRnhucWpHMHBUUmZwK3ovUC9hUnp0aG11?=
 =?utf-8?B?YVdQMXc3OHp5MVVTZldxQkdtN2hmclZJbGoyMHFMYnY2V1A0Z1k4WHltMnVZ?=
 =?utf-8?B?VGhNQThFd1pqMy9KVUU3S3JUWWpTYXBieWFNelp4anJieFFLWDE2VjZXcmFh?=
 =?utf-8?B?TDEwKzkzMEpEdWhoZXhWeXJEbk5HUmpKZXFHSDJPQytTRXlqTG51K2RyNW5W?=
 =?utf-8?B?SGhDa1JJL2taY3NicWlrNVFyR2p3Snp5c0NkZDlzOHNiZkphWTRYNUw1ekM2?=
 =?utf-8?B?WXJKQW13Tm9aMit6bFJyUlR2ZldBdE9SdE5pTGJTaW1MMGdwcFVqR0Z4b1U2?=
 =?utf-8?B?cm5WUkZrTGYvMVY3QWxEOTBOUDBjUjZEK1VxZ1VjRlVvNVg1NHg4YnFWLytJ?=
 =?utf-8?Q?cb4e9koIU8G4seDK+r2GiK4yZqNcorle2CGy0JDq8aYlQ?=
X-MS-Exchange-AntiSpam-MessageData-1: aOdphbk3svln9Q==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 64ab1e48-d2fc-4f28-ecae-08de5fda913b
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2353.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2026 08:35:47.8291 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uOym1nro543qcK40iHPVU46qfP4oL7KkJGpy3ZJN8OhqO5ucFZXyF4M7kSUJmx0AIQlnnHWh+zctJnLASUFKag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5757
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	SUBJECT_HAS_EXCLAIM(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[kernel.org,nvidia.com,google.com,gmail.com,ffwll.ch,collabora.com,arm.com,garyguo.net,protonmail.com,umich.edu];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[ecourtney@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,Nvidia.com:dkim,nvidia.com:mid,nvidia.com:email]
X-Rspamd-Queue-Id: 43F70B8763
X-Rspamd-Action: no action

Add dma_read! and dma_write! macros using the new infallible methods
on CoherentArray.

Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>
---
 rust/kernel/dma.rs | 103 +++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 103 insertions(+)

diff --git a/rust/kernel/dma.rs b/rust/kernel/dma.rs
index e4bca7a18ac1..f3920f74583a 100644
--- a/rust/kernel/dma.rs
+++ b/rust/kernel/dma.rs
@@ -811,6 +811,24 @@ pub unsafe fn as_slice_mut<const OFFSET: usize, const COUNT: usize>(&mut self) -
             )
         };
     }
+
+    /// Returns a pointer to an element from the region with bounds checking. `OFFSET` is in
+    /// units of `T`, not the number of bytes.
+    ///
+    /// Public but hidden since it should only be used from [`dma_read`] and [`dma_write`] macros.
+    #[doc(hidden)]
+    pub fn ptr_at<const OFFSET: usize>(&self) -> *mut T {
+        build_assert!(
+            OFFSET < N,
+            "Index out of bounds when accessing CoherentArray"
+        );
+        // SAFETY:
+        // - The pointer is valid due to type invariant on `CoherentAllocation`
+        // and we've just checked that the range and index is within bounds.
+        // - `OFFSET` can't overflow since it is smaller than `N` and we've checked
+        // that `N` won't overflow early in the constructor.
+        unsafe { self.cpu_addr.as_ptr().add(OFFSET) }
+    }
 }
 
 /// Note that the device configured to do DMA must be halted before this object is dropped.
@@ -927,3 +945,88 @@ macro_rules! try_dma_write {
         $crate::try_dma_write!($($dma).*, $idx, $($field)*)
     }};
 }
+
+/// Reads a field of an item from a [`CoherentArray`] with compile-time bounds checking.
+///
+/// # Examples
+///
+/// ```
+/// use kernel::device::Device;
+/// use kernel::dma::{attrs::*, CoherentArray};
+///
+/// struct MyStruct { field: u32, }
+///
+/// // SAFETY: All bit patterns are acceptable values for `MyStruct`.
+/// unsafe impl kernel::transmute::FromBytes for MyStruct{};
+/// // SAFETY: Instances of `MyStruct` have no uninitialized portions.
+/// unsafe impl kernel::transmute::AsBytes for MyStruct{};
+///
+/// # fn test(alloc: &kernel::dma::CoherentArray<MyStruct, 3>) {
+/// let whole = kernel::dma_read!(alloc[2]);
+/// let field = kernel::dma_read!(alloc[1].field);
+/// # }
+/// ```
+#[macro_export]
+macro_rules! dma_read {
+    ($dma:expr, $idx:expr, $($field:tt)*) => {{
+        (|| {
+            let ptr = $crate::dma::CoherentArray::ptr_at::<$idx>(&$dma);
+            // SAFETY: `ptr_at` ensures that `ptr` is always a valid pointer and can be
+            // dereferenced. The compiler also further validates the expression on whether `field`
+            // is a member of `ptr` when expanded by the macro.
+            unsafe {
+                let ptr_field = ::core::ptr::addr_of!((*ptr) $($field)*);
+                $crate::dma::CoherentAllocation::field_read(&$dma, ptr_field)
+            }
+        })()
+    }};
+    ($($dma:ident).* [ $idx:expr ] $($field:tt)* ) => {
+        $crate::dma_read!($($dma).*, $idx, $($field)*)
+    };
+}
+
+/// Writes to a field of an item in a [`CoherentArray`] with compile-time bounds checking.
+///
+/// # Examples
+///
+/// ```
+/// use kernel::device::Device;
+/// use kernel::dma::{attrs::*, CoherentArray};
+///
+/// struct MyStruct { member: u32, }
+///
+/// // SAFETY: All bit patterns are acceptable values for `MyStruct`.
+/// unsafe impl kernel::transmute::FromBytes for MyStruct{};
+/// // SAFETY: Instances of `MyStruct` have no uninitialized portions.
+/// unsafe impl kernel::transmute::AsBytes for MyStruct{};
+///
+/// # fn test(alloc: &kernel::dma::CoherentArray<MyStruct, 3>) {
+/// kernel::dma_write!(alloc[2].member = 0xf);
+/// kernel::dma_write!(alloc[1] = MyStruct { member: 0xf });
+/// # }
+/// ```
+#[macro_export]
+macro_rules! dma_write {
+    ($dma:expr, $idx:expr, = $val:expr) => {
+        (|| {
+            let ptr = $crate::dma::CoherentArray::ptr_at::<$idx>(&$dma);
+            // SAFETY: `ptr_at` ensures that `ptr` is always a valid ptr.
+            unsafe { $crate::dma::CoherentAllocation::field_write(&$dma, ptr, $val) }
+        })()
+    };
+    ($dma:expr, $idx:expr, $(.$field:ident)* = $val:expr) => {
+        (|| {
+            let ptr = $crate::dma::CoherentArray::ptr_at::<$idx>(&$dma);
+            // SAFETY: `ptr_at` ensures that `ptr` is always a valid pointer and can be
+            // dereferenced. The compiler also further validates the expression on whether `field`
+            // is a member of `ptr` when expanded by the macro.
+            unsafe {
+                let ptr_field = ::core::ptr::addr_of_mut!((*ptr) $(.$field)*);
+                $crate::dma::CoherentAllocation::field_write(&$dma, ptr_field, $val)
+            }
+        })()
+    };
+    ($($dma:ident).* [ $idx:expr ] $($field:tt)* ) => {{
+        $crate::dma_write!($($dma).*, $idx, $($field)*)
+    }};
+}

-- 
2.52.0

