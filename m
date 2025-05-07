Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CF85AAE163
	for <lists+dri-devel@lfdr.de>; Wed,  7 May 2025 15:53:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACE7110E7E9;
	Wed,  7 May 2025 13:53:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="HKtByefK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2082.outbound.protection.outlook.com [40.107.243.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5750A10E7E4;
 Wed,  7 May 2025 13:53:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AvvKDK6y+cwAnq3Wh9OYjw+rijT+U1KsPNGCbF+GhmX8invpILoyVJq96sRCCDL9VMfSYnDozDcdhLi33eC6i1kMlZGpyHVUYmoVRZKe/Nu/aX6Ql8nLAX2v8Yg9WVVgQwzMlBGj8TaYoxkGnp87K/UVudU1AlwKyIqi7b6Xf+rXLnPQVNLuOJMdk5RnBF4/it8nHLjHg5HnJqpRACKnnd644kBO5MfWZt4qnlMGxMkz4tVs0gk7vS4CpGmm0B94Qom+4TB3OC/gT68IoO37xGbhm0yRnvcCHpjl576Vg6w3KwsSSatT7LlhW/QwKQMkJBOYFAtb4r8YJlmCk5qxNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uFJ59ttIw7s2heX+XSSeGrDEUYBGgqJE6sWU7ILrCpY=;
 b=bZpPdAkfdTc5zi/jCzsURFYX/K8XSOjg+9bo5ygQAbJCvDlHynatT/w7J8pKBmAi6QXh4OKxJQiilKGkqrRy/q2bRhExU3wC7tNBGYvx93NYbqmx2nFldxuzpDbc0F4WZtDxo0NvE4c2cVNLZxQAq1QS+M0uodWhOfq9Nv1B5mtvKgaprwEHovoLl/sa9C5iwmPx5b5bBZ8Q/KSpBYzY+MZTHO6r4VmLAdDxpnNOJde9+gqJewCGO3HLo7LfMvFJ7VRzr/8vayPYHnPOGzksVE66FF5IPeAY6GhTPECWK7GEUuN341iMharKWKsOfg27NEr7XemxIrgD3v/8Bel4bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uFJ59ttIw7s2heX+XSSeGrDEUYBGgqJE6sWU7ILrCpY=;
 b=HKtByefKxouLnBDpROiC4Hq0IJST2y8Yc2lgy4TBf6TAKnvtF9HWHGlyG7oJlN9xn5slWTMHBO9pY5HCnFzkTTEhXYlAFhEso7zzsUmmtMHb9OPNWHe8wg5GMXgq0yWZWHIYFX9QH6VmZLAc2F0cYjT5ZOJp2NTgkzgy7Q/FdRS5uQfhhyKDR7X8z9kdWBliHqhsAbjqW0SqQd0ZI7lemBER2zLyGrFHYeXsIvmjZB3ElJTyAH7q4soihwxUVUZYwsw05sDr98bKr1MG346q9jar2cwmQ5Gk+LmHqgj1haeK+qcR8xK3whPQY62VjrHqx3NJCMBOD8eVGImU7OnGCw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by PH7PR12MB6761.namprd12.prod.outlook.com (2603:10b6:510:1ab::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.26; Wed, 7 May
 2025 13:53:17 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8699.026; Wed, 7 May 2025
 13:53:17 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Wed, 07 May 2025 22:52:37 +0900
Subject: [PATCH v3 10/19] gpu: nova-core: add DMA object struct
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250507-nova-frts-v3-10-fcb02749754d@nvidia.com>
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
X-ClientProxiedBy: OSTP286CA0073.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:226::6) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|PH7PR12MB6761:EE_
X-MS-Office365-Filtering-Correlation-Id: e1ab64ae-21fe-457e-dc47-08dd8d6e84aa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|10070799003|376014|7416014|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?K2VWZjdaNk9haDJucnhrMndEQnBtdWVST1pEYXFRTWlWM2hQdmx6U2JhZ3hl?=
 =?utf-8?B?MEdxUmpuQjJqQ3JLbm9WTktqVUsreW5HMFEweVdIODJYcjJVMUFLODNCTlds?=
 =?utf-8?B?amlVQUVUNlJyL0VyZ21YTDBYV3AzY0YyK0xuRktuakdrZEZmbFNVaDhyampT?=
 =?utf-8?B?UFBPNllVLytjSjFvcjBVeXJ5TWlibHRRUEF6cXcrZUlLRmRuNTZtKzZGeTMv?=
 =?utf-8?B?alhKUFRydWdqNDBHV2pWdkhDemduMjFrTGdhWTZCREcyV05zTDNTMThZSnRB?=
 =?utf-8?B?QkhRSldhaTVHdUNvTlhEY0ZjTEI0T1ZNMG1SSWE5cFRoVFQxZE0ybndGVzNP?=
 =?utf-8?B?V1lBWnNncWxVa0w4UG13UFQ0dkswQUo1WVkxRUtwREZJWEN1d1FtVTkvY3lT?=
 =?utf-8?B?V21qMGtXY2R3NEdjRjIzRnNFRFB4bUhwVEhDa3lIcWJaYnJjN1RoK2pReXZY?=
 =?utf-8?B?L21Tb0hseUM3bDlwNkZXaGM5QndzOXhHUERNK0tIa0QrR3lvd1BJeVp0Y3I4?=
 =?utf-8?B?TklVK2ZHZzlxdjJSRDhBZDk4enJqd3VDandmTHBzckhDbEdlQXNLbmhMK2Jj?=
 =?utf-8?B?UEdCZURRMmdOSzJjV3VFbEI3MkUyUWVRbDhQYzlremhiallqdzlLN1AwRVpH?=
 =?utf-8?B?Ry96SU8wVWU1Wkwyb0V4c2FPdGN3b3UycXpPRWlvYjFpQTIxdmFxU29EZGxQ?=
 =?utf-8?B?QklDS29DME1RNGpqV1B1anljbTJnOTJhYklSSHRnMHNvR2NUL1doRGNidW9J?=
 =?utf-8?B?ci9BdmtsUmhLT0tVTXZVUDY1WXlKcnh5UGp0L2ZEVXByZmJlMzRNaENYR2Mv?=
 =?utf-8?B?S2pzbHROT3Z1Rkg5eGdwVmxEMEJDdnVGRWtBTTEwMnJVZjBPSkgwbzVLa2Qz?=
 =?utf-8?B?V3k3eHRuRWhFNGVNNC90N3FwOGM0ZjB2K0VLNFdld0xGdGZHMzYwQy9RT2ll?=
 =?utf-8?B?amMzQ1ZzY2RwRkxJcFh1cEtBVUUxMHlseWRRTlgyVjB1ZWRPVHdlQmZUTjg4?=
 =?utf-8?B?Zm90Rm9uWFdCdE41U2hxdlhidVdSODVzZGhjMjdCcWIxeG94ZmZvdWZnd01k?=
 =?utf-8?B?UVNZQStYMXEwOE82STEzM2p4L1ZIaDZ4bkVVbnp0dzQ0RXBHcTk3bVlFc1N2?=
 =?utf-8?B?Q29HVGk1MXJyN3VPbk9mS2xDUGJ1WHl1UVp5NXM5VzBieHFYTXMyRlhzeW9k?=
 =?utf-8?B?dlF2Q1RMNTVQZ0lia3pPZ2xiRUpxbSt0YXp6WlRPNWJRVXpCdE5Palk3WWIv?=
 =?utf-8?B?TmFwbE1wR3lzYThpeUFSNjZyNURhRGFCQmNxc0lwbHhLOC9jaWJubUtZZVc5?=
 =?utf-8?B?TU0rUHkzeit5TlpOdkZra0lHdWtRSFl5TUFxa2RBMjV3cXZhUXcvWCszUWtO?=
 =?utf-8?B?U2x1RXY3OVlxTjJYa3ZSZEw2WUF5dFNmWjFVcnpNbDdCNGU5cHd0QnVnVEhs?=
 =?utf-8?B?bjAxMFBLVElNd2Vqa1Q5WHZpSVpTdlBpdjlGSTZFeWNidFJWSmhFVnAzQTVp?=
 =?utf-8?B?azVyWEtEYUVVWExQbzlvclRXaTJhQkVXeFhBTXhzWHVCbERjOWdUUmY1UG41?=
 =?utf-8?B?V0tua29TY1hWTmlpenpKMEhoWkEzQ043Z2hKbEZsYi9IQTNIR1IrR2h2bE10?=
 =?utf-8?B?MytJUkk2NnEraVcrL2lPNWxnWnU1OEgwU0w3RElHbExoa2lzS2xLYkpDNVZ5?=
 =?utf-8?B?em9zVkNXVlhla25rRmRJTVhxQVdYRmFRcFQrL3BUSkg1aVFZTmdBTjk5bFZN?=
 =?utf-8?B?STZKenZzK2w2NXJEOE0wdjFZNkpPMWZzQ1huUzY3M20xR0cvR095UFRxWEt5?=
 =?utf-8?B?YjRMWTVpWHdLNkJuODUwYlpTWXlTakc2Y1NLK2tEaThISzMzRmFDUTE5L0d6?=
 =?utf-8?B?Yk5yYnhaRWNwVEI1SHRHWmpPa2ZNVDQwMU16L2ZVMGk0bER0VWxLN3pPUUE0?=
 =?utf-8?B?cWxUOHRJQWpqSDdPR2RFNEhNVlhaTjdjNnZ0cUFKZE1iYWZjZ1BCMWJSTXZW?=
 =?utf-8?B?NUlKR3ZSUEVRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(10070799003)(376014)(7416014)(1800799024)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MFhGalhMVFhWelJWRU9DTWlXZXh3UUVEb0dwK09DUXorNThqb3h0R2hiS3Bh?=
 =?utf-8?B?UWEvZCtQdnQ2Y0puMG44YVNXb2dSMGJrcmg0bis4aVB2RFh0T3RPUU4rYnh2?=
 =?utf-8?B?RDlROFdVcm1SWG8xVGlmejBIU1R3UmE4cUVJRWdpb2NUUVBadFhFZzExWlc1?=
 =?utf-8?B?WTJOUmlISkEvSFM2NmU5dDB3cElNUUJjaTNtVFhJZHd4UGQxM2hRY2xONzBs?=
 =?utf-8?B?R2g5dWJuNk5iVk5xUHJRcnd5RUt2WHI0dnhPdklySUhjWDgxMWJNREJJaWtF?=
 =?utf-8?B?OUNDSHpUemNTaDlqRjg5K2tNU2RKSmdKRDJMTUlyNXU2TDhRVE1RTDY4QXpz?=
 =?utf-8?B?Z2tSdHJ1c2Y1Q2k1UGlubUJsazJyZXV2RHZsN2RPQWE5dFFxQ0hzbUt1dXo5?=
 =?utf-8?B?S210bjJ1STZZSnpmekc4ancwdk1qaVVrcmNpT0EzTWh3aGdsUE1vSWMxTEth?=
 =?utf-8?B?bVNOcjlRQ3NNRllTOG5tZG1FaUFtOWkrdUJQcnU3UVFpRTZTS09ZbStvT0Vy?=
 =?utf-8?B?ZWxjQmtFdysvRUVHM05wc1J6VjZ3UGJCWHJpVFZma2lueGlhS1poL2kwVUd0?=
 =?utf-8?B?MVIxNHBua280SjdRWE1KL1Zod0hhNEZnNFFTYmpxV1d5Tmtscm45N1kwL1Nx?=
 =?utf-8?B?NGdjOURVUXd4VWx5bmQ5dFNUZW5jb216QXVDZ0l5WHptV2lRQmhqb2thVnI1?=
 =?utf-8?B?ZTdMbzJ4TGExN3BJWGpjeVBhSG55dFRiNi96TTR2QUxKcWZIcTkvczhDSVRH?=
 =?utf-8?B?Rnk1MEt2WlVYeGpzOWQ4aVcyTmxOQmlXcWdmTjVjNHJXWmZrWm1zbHdvMUdQ?=
 =?utf-8?B?Zlh2eUdaQWdrbmtKQ29Bc1ZmUWN1aitsTzZ2RkczczcyZ0NHT0pMSmdSWFNO?=
 =?utf-8?B?ZHc2WVVPb1JhOERrZzQzWWpOWHpCR3pTVUI1QjRuVFk2aUZyMEJySmUzTkxj?=
 =?utf-8?B?OE5SeHViTlhLek1yN2xFRWh3K3diRjVMQVJkWDhnVmRGam5NUkFqbjZ5blhI?=
 =?utf-8?B?bHNjN1NMT25FdHpYUjVlVGlnZEhtOEYzcEFJZ2VVVXZOR1plUlZMSEFQaE9G?=
 =?utf-8?B?LzZmSnBhcXJhd054NTlGZVg0Nml6VG9pSys4MnBZNUt4aHlNUUhuMzBJNFVx?=
 =?utf-8?B?STNvcjlKZktDYVlvN21zUEd4ZWxiZ1hnOHA1RlJMcEkvbkI0T0RETndGUkZ0?=
 =?utf-8?B?MUV3UmFzQUVBS3hmbUREMVNYa3loYlpEd3Q3VXVGRktnLzRuUjlSMWhqZ3Iy?=
 =?utf-8?B?VFRYQUJuc1BZajQ3WlFieE1rSXJYb3FPcXVXNFVBaDl5OG9sWVFDSHV2ZjBs?=
 =?utf-8?B?aEZyekx2eUh4OEkxMUluZWNJcFJna0IrdkMxamJMM0VXQy80cHJJdXFTWjdP?=
 =?utf-8?B?a3Z2QmpBQkJxRHZmcDhKenZKdlpNZUYwRkVVMFdlMjRMR3dvOUhoS0JSS3lj?=
 =?utf-8?B?TkVKcnBLa1ZpUWlZTDNtUmIweWlEN2JwdTduQnN0V1FTY3hpS3ZUeVVBWk5P?=
 =?utf-8?B?ZzkrRDlkWFlqMWNhd0FLcldXcCt6WWQ4bWQ2WCs2SGlDRGQ3QW12VjcyMjJi?=
 =?utf-8?B?MmJNaU91VmRKcDlyWlBFMTJZTEtMRmRUdklvN0pjQ2FjZ2F1YkgrYUY0bEcw?=
 =?utf-8?B?ZmxzNkJGRFdUSlNHM0hkRWRCZXd3MGM4ZUFHRzl4TGtyM2NzWEQ1UndUc1JJ?=
 =?utf-8?B?ajYveGlHakNkbXhpNFBPeitDOGZWand3aXFFbVpuZDN5L2pSbnJENlRlamUx?=
 =?utf-8?B?RlMwYkpMbng5bFUwUjBLUlBSQmRqZnc1Z1hIRDA2Z25JSlpydVp5OWd4UlVE?=
 =?utf-8?B?V283TmhzeGRxUm0yT1dNMzIvZDIvUCtyMFlSREdvNXlFWklOejZmcDNPU0Ex?=
 =?utf-8?B?Ny9TSTJIbGg4K0w5ZDVsbmtzK096bTlqWjB5YzJuRnR0aGhDMWxnek1jSzl4?=
 =?utf-8?B?OUdqRWNjMkdtQnMrL1ptcHdscmNoWG8reWFGdE1GOHJ3ODZMWkwvYVYvQ1RE?=
 =?utf-8?B?dWhxaVJ6VmJ5SUQzOGRaOXRjWk12a1ZZeVFJWCtwbnpEcXZicW9xWjZEZTBh?=
 =?utf-8?B?TmtwS0FjM2k2TENSVjJpcE5QWGJCUzNaUmhWZ0NVTUlIYU5RZXFOajExbURB?=
 =?utf-8?B?NzlCMnFFWmhaeDdpL1ZnYnNyTVJ1SGI1S1pBUzZPTjBQSzhwQVJaZkJpMlUx?=
 =?utf-8?Q?Z1bcxHRLxPfGxqXk9wMJb/bKHTIeqiG+EVgB1bDYwAN7?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1ab64ae-21fe-457e-dc47-08dd8d6e84aa
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2025 13:53:16.9543 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kOZLJBx3I5Wr6VAH7rR9dlcJ9vpSEjLdT4d6aN0eMfBRsPCoSVQTf7H45iekeYyiljfpTrMGiiWPmYayaKAPkQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6761
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

Since we will need to allocate lots of distinct memory chunks to be
shared between GPU and CPU, introduce a type dedicated to that. It is a
light wrapper around CoherentAllocation.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/dma.rs       | 60 ++++++++++++++++++++++++++++++++++++++
 drivers/gpu/nova-core/nova_core.rs |  1 +
 2 files changed, 61 insertions(+)

diff --git a/drivers/gpu/nova-core/dma.rs b/drivers/gpu/nova-core/dma.rs
new file mode 100644
index 0000000000000000000000000000000000000000..9d90ae01d0044eaab4ddbc3eba216741d7a623ef
--- /dev/null
+++ b/drivers/gpu/nova-core/dma.rs
@@ -0,0 +1,60 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Simple DMA object wrapper.
+
+// To be removed when all code is used.
+#![expect(dead_code)]
+
+use core::ops::{Deref, DerefMut};
+
+use kernel::device;
+use kernel::dma::CoherentAllocation;
+use kernel::page::PAGE_SIZE;
+use kernel::prelude::*;
+
+pub(crate) struct DmaObject {
+    dma: CoherentAllocation<u8>,
+}
+
+impl DmaObject {
+    pub(crate) fn new(dev: &device::Device<device::Bound>, len: usize) -> Result<Self> {
+        let len = core::alloc::Layout::from_size_align(len, PAGE_SIZE)
+            .map_err(|_| EINVAL)?
+            .pad_to_align()
+            .size();
+        let dma = CoherentAllocation::alloc_coherent(dev, len, GFP_KERNEL | __GFP_ZERO)?;
+
+        Ok(Self { dma })
+    }
+
+    pub(crate) fn from_data(dev: &device::Device<device::Bound>, data: &[u8]) -> Result<Self> {
+        Self::new(dev, data.len()).map(|mut dma_obj| {
+            // SAFETY:
+            // - The copied data fits within the size of the allocated object.
+            // - We have just created this object and there is no other user at this stage.
+            unsafe {
+                core::ptr::copy_nonoverlapping(
+                    data.as_ptr(),
+                    dma_obj.dma.start_ptr_mut(),
+                    data.len(),
+                );
+            }
+
+            dma_obj
+        })
+    }
+}
+
+impl Deref for DmaObject {
+    type Target = CoherentAllocation<u8>;
+
+    fn deref(&self) -> &Self::Target {
+        &self.dma
+    }
+}
+
+impl DerefMut for DmaObject {
+    fn deref_mut(&mut self) -> &mut Self::Target {
+        &mut self.dma
+    }
+}
diff --git a/drivers/gpu/nova-core/nova_core.rs b/drivers/gpu/nova-core/nova_core.rs
index 3d75e7acc6e0ddcfa142b1fb134cb5c966aaf472..1c7333e9fabe357f3ecbc6944ca98b66fa17c9a5 100644
--- a/drivers/gpu/nova-core/nova_core.rs
+++ b/drivers/gpu/nova-core/nova_core.rs
@@ -3,6 +3,7 @@
 //! Nova Core GPU Driver
 
 mod devinit;
+mod dma;
 mod driver;
 mod firmware;
 mod gpu;

-- 
2.49.0

