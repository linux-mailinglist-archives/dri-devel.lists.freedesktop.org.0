Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50BA1C46EF7
	for <lists+dri-devel@lfdr.de>; Mon, 10 Nov 2025 14:35:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7828A10E3B6;
	Mon, 10 Nov 2025 13:35:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="CTOOQxx9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010013.outbound.protection.outlook.com
 [52.101.193.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDC3710E3B8;
 Mon, 10 Nov 2025 13:35:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ojYPKxa5fd+5HfbaFuZQfzQubw3K5CmOkjd4NgLNqP2OF2VsngTLR9XZTNNrbIX9RZBLIwNSMIQ4mtZ/1fK/GjwEEBPHl41M999DfSSFaSxFQNsQ5av3au9wEWLgLbXmCr3EdbIfwwSaSk5+jiri9n4447+8mB/tcCHjk7bF80T6zZnqmp79AgegjWop6r5sx6Br2jDOEq0m0Z0cEHlV/zo4iHMSlnpVp+In/ne8tTjhdZxqBst9krCxLfHGVXOe12SybuoMy+AaP/UvHz/iAy9qnc8QUzLxvS9LhO+Vn9pzl5BywNj4kNNxaMJDTLsA9uLgYRvB55ICZM7nyvBdJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jf7eqo3LWh310A62CIrpIxysheIRWQSPzYbhbmhANFY=;
 b=kCfGU35qLZJ3GXfVJOwWasQXkEdba3P8QmmzVo2A4IUoe9/MU2kzPeXiJsJHCOPO2kbgMNG5VGJn6B1stfqNzMoKG9BmbUUBybN3keuDECQps8KqraH4CruyrEsBn6HdU7iLoWEwzS3J9xAcMlMku5lDfm+2uBAyF37atWFSMgr/2deLC3l17uvmHGMgzcYlI3af7oPB+fQavoaye5EnKIJBWdDRbOsnqcw7GcbzkPl0ScAncZ5NV1SeAKm8pTYNrECtlLyvie6+JIuQupErCsTqzvfSNICmNimpzhK1Gj7CO5fYGU0/FvfshurTM0QTPjLnYCrhwtjDx67fFGVxIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jf7eqo3LWh310A62CIrpIxysheIRWQSPzYbhbmhANFY=;
 b=CTOOQxx9M5+CFhWQB7hCo/bMJAmMG+yffh7vpgrHd8AJUxN+40veuIut/ARSVCsUYRiLQuY2c91ewTmb7uQAIS3T+9jMQjiwxgN1pKJ7DfiOuPz13HH7JzRosSGmPghVpUswG2zMoIPVg3v/E8VXi9NwZgDnS96NxXL3m+Y++qU+mNZ4CIMh0gNeaYXbUNQz70807T+c045D5xjm/SLv5A7GSEF8N0DBH5dsNht5ncIMDIf6rhkMwMxnu77wZcNq6wb83g7+/8DYgMNPatbnNEOX1B9XIHoGhR8ATC1c4XF/gArmKzi9kzKWeGWdLxYQQDSubvGQk9/0tlebDia2vg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CH2PR12MB4055.namprd12.prod.outlook.com (2603:10b6:610:78::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Mon, 10 Nov
 2025 13:35:08 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9298.015; Mon, 10 Nov 2025
 13:35:08 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Mon, 10 Nov 2025 22:34:21 +0900
Subject: [PATCH v9 13/15] gpu: nova-core: falcon: Add support to check if
 RISC-V is active
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251110-gsp_boot-v9-13-8ae4058e3c0e@nvidia.com>
References: <20251110-gsp_boot-v9-0-8ae4058e3c0e@nvidia.com>
In-Reply-To: <20251110-gsp_boot-v9-0-8ae4058e3c0e@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Benno Lossin <lossin@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>
Cc: John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Edwin Peer <epeer@nvidia.com>, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>, 
 Lyude Paul <lyude@redhat.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TYCP286CA0197.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:385::11) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CH2PR12MB4055:EE_
X-MS-Office365-Filtering-Correlation-Id: edbc604d-73a3-47a7-2892-08de205df752
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|10070799003|7416014|376014|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bkM1VmI3R3FFbHJoTVFSdEc1T1RBbEd4NUxmdy9oZlBUS1djdHN2bjhSMFlh?=
 =?utf-8?B?TzBVcmFkd3l0QldBMmtSYzhaSWNLVHJQQkN0Rm5qRXhPd05vRE55OFRhZXRP?=
 =?utf-8?B?c0VVUjVaV0kwci9KL1hRU3J1NVFzM2orRS9ib21sRzNRcjFMMEdzdStiK0J0?=
 =?utf-8?B?VjhEdkFZeEVUeGJ3NmZ0Y1ZxMFNJcVl5ZjRIVHZVSGxNZ1dKSjVRaDZmeHVl?=
 =?utf-8?B?QWpuMkxmNlJlNVNvekZQOGFrNzBncTd6UDlVa3dOTXhMbGpDeU45b3NZT2Z4?=
 =?utf-8?B?YjJXaGc2VTZUUk9oT3NUTDQ1OUVSR1RwVUY3bTMyTkJvWU5UQnd6bWdyQTFO?=
 =?utf-8?B?dExvb0xDUVRjenRraTBYdFhwdkpjdFlzcTFWWFl0bXBkRGI5YTVQSGtmVVZN?=
 =?utf-8?B?ajBkZFpnQnptOWN6bkhhbjl6aFRUNTFqbml2STI0WUZ2d3d0T0xSbFhpSVg3?=
 =?utf-8?B?ckF0VHYrc3RHNGRIcXl6NE9qM0l1TFRvazBHTWFlcE5WdUNCYU41cE5kODB6?=
 =?utf-8?B?QlRLOGRBM1MvYmRiemt3YjVTUnVLTE9ERlFkaXZlYVk2aXVDanJ5bThiNldp?=
 =?utf-8?B?ckpyWndDSXpuRTJVZGxVTmxJRnptSXczOWlGMDJSQ1ltMTFKRmVHZVJqZzBL?=
 =?utf-8?B?YXRRRTliemhyR0xXLzJCaUtpRzRabVdVN2NKWnprNU0zZ1IvcUdBL2hwWmpn?=
 =?utf-8?B?ZTNGanYrcWlwU1l3cE44NG9QVlJqQzVWc3VnSGdPUnVLRGcxQ2tFbnBxaWxt?=
 =?utf-8?B?ZjRKbEMxRmRWczNjMUZSN2hlWS9UaU1CTXdqTmlzeFJJWG9CWU14Nm85TGJN?=
 =?utf-8?B?M0FHcEFYOFR2Yll2WEVrT253TEtlMzlPdjk3Njc1ODdFcjRNL2dvYnpGZFBx?=
 =?utf-8?B?NzJZMmIwK1JWOHY0TXhzNjRMV1d0QmlwMHg5N2U2NEJDNGFoZGlpLzlqYUJO?=
 =?utf-8?B?ckx2UzVXcTg4OXlWSnQ4TUlzcERPbStlNitzMXNRQXQva0hhWDF1QzZlaWdD?=
 =?utf-8?B?WEsvSWFDNlF2dnc5MTNBMFlmdEh0V1I0Skk0T1Q2K0V1dnZ1cnVkb3dEVTFB?=
 =?utf-8?B?Z0RkcTNmS01HRDVkOFhvdmFpNHRWMzBaeGNOemlBTjkxYlM0TXBjT1Q2ZHNt?=
 =?utf-8?B?L09kbjVLVktibzc4dUIrVVB4cC8wNDFvUjNWVHNtNTI5M3BiNzl2cUVHcGlO?=
 =?utf-8?B?NENLTlFiVGV0cGJzcVgyMWhkK0svQzdPME9rSlF4eldJOVRrRG5kVnJCU1Bl?=
 =?utf-8?B?NDJnUHlXVjZtaHZ6aXg2UmI2akVTWklJQmdFVStXV0ZKR2JsOWhRNHdSeDNs?=
 =?utf-8?B?VmhjV2xPeU44WXg4Zkc3Qm4xWlVOYW40WW5WcFFvNmV3MTIzWmxkZzQ0SVhL?=
 =?utf-8?B?NGk2SGJQWjRwUCtsR0lzOEgvTTNiVlR2M0Eza2hPdEJuZzJNdE1uR3RnZEJD?=
 =?utf-8?B?RjV2aU8xYkV0aDFNNmo2SlpTL1pBSXVwVGh6VlExM0poNFYyY3dHWU1DN0Ro?=
 =?utf-8?B?MTNlekRCQmVMV00zQjhXZ1NoNWptMGpSbld1dGVpcWpzUU15eGo2YWxxUGpw?=
 =?utf-8?B?QWp1MmNhSFNnMWlYdnFwRlRXYjRtbk9obFdqMDFoM0w1RjBpYkVoazAxVmxI?=
 =?utf-8?B?M0J6V2pzTVdMelB1MnBXdVJVWkpRMHluSGw1SEprMUR0RXVwMmNRVGJRYXBF?=
 =?utf-8?B?dFpoU1I4eUh4d2crM1g0alJJbloycEdjR2I5b0tqb0tkOFJIV3FFY3JTQXp0?=
 =?utf-8?B?UUI2UEJLMXVEOGhNRklHTUx4RGhDZFpqMzBsaUQwTkJ4bUFuRmxsZ3JCRmxl?=
 =?utf-8?B?OFhqYjJWT3BEWE9waFZzcU5VTWYzaW5nT0NvRjJKYTNmS0RTVlltVVc3VEN3?=
 =?utf-8?B?bThmcWRDTkEwWFRNUnpabzFjcC8yelpIcmtySy9RZ1BtMlA1Y09iaGZGN2RO?=
 =?utf-8?B?V0dzK3lwdDNTaTR4c1BzS3VGMUJGZnJZaGlHTkVnTWhHM2dGS05YSnlmYm1K?=
 =?utf-8?Q?GvYPMAjjlAVpzQQ6LQuHurWeAGKyQ4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(10070799003)(7416014)(376014)(366016)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M0U0UDZRSWc0Q0RnMHdjR2xFY1dUUW42bHJrZ3Z2aW5kTTVVeUxsU1RxYXQv?=
 =?utf-8?B?TnR2MHhmYWtMTFBaRCtncW05NzNxVzJmbVJQRFZ4bVhKTkhIL1hsZ3I3Zkw4?=
 =?utf-8?B?K2UybFNHVUQrbmNRczBxeHZKMzVNZ0FNbm1jc3JTejBvQlRmeDJNdWgyR2V1?=
 =?utf-8?B?TnM0aXFQYVFwWUt2WWE2MlBXNTRMMlBHUmx2NmhGR2xFMnQyWjNMaWJlRGZO?=
 =?utf-8?B?S3hwWTd3LzVJczhxbjFBYVJhUURpcUZLTS9IY1lhMlM3MkNKQzRWS000TjFt?=
 =?utf-8?B?SWQ5alNta3BPbUhwRU92K3ExdjZ0Y0RsRUdya3A2TTdxb3cwVGNvUlN2V2Mx?=
 =?utf-8?B?U3VyWDIwTWlGRG5kWHE3NUhOekN6TTd4Z1BNajdjZm56eFFpREJJdm1WQUFB?=
 =?utf-8?B?YUJZLzVxc1dyVXc1bkJYc29UVGVDWjFITzM3WmxTUDJFTTJGMGU5STJySzdO?=
 =?utf-8?B?UmV1cjF4Y1hGOUtWL2JOS3N2WGNDaThyRzEwRHZ6a2dmWDJJdjhyQ0dEMEF3?=
 =?utf-8?B?Y2tFL2pFVGxIbGhIZG1mYkxuSWNFOVFPMkVBa0MxQlZITGpTdCtaSlBZekhh?=
 =?utf-8?B?c1pLelB6b0VYUktIOG8zSllsclo0VFJkRjBMMTIzbVdiT0ROQnVpdmR6RCtS?=
 =?utf-8?B?WnFyUXFtYy85dUpqNUtXdmVQeG5TLysxSTY4Wjh3UWNyaWdrS0xDZUFLOE5G?=
 =?utf-8?B?R2ZtYm91R1lyTkRFdnBlZXY3V3FXOG9yS3FSU2gxV0N3alVDZ2V4NGcyZUMy?=
 =?utf-8?B?Q3NYVGZNYStLMjI5dFNUZDNLcVRGTitxUW8rSWM0ejBjKzkrNklLQjJBSVpa?=
 =?utf-8?B?NjFYRU9uMFZWSzRrdTlUanI4bXZ5V2p3eWg4Z21NMjdHYVVQRzRSLy95TVN6?=
 =?utf-8?B?KzMvRS9zUkxtbFA4T3hrL2Q1QXpWM1FITlNsSGtSQ3ViZE1OZzZCQ1lzVUx1?=
 =?utf-8?B?cmFoWEdVeUxEaW1BZTJXbzlxZU5YMXh0MEVmNzFDdkpnd2xUTm5Ea3hlNWgy?=
 =?utf-8?B?US9tOGZLMGxZS1JOampnRE9pdDFML3M0cXVLZEdZUUtOb0lDeVJPT0lTSEZi?=
 =?utf-8?B?TllqcENYajZYSVNxMWF4VktqcHRFTGdQVktCKzlublhrTmVUUHlLUXljL1gv?=
 =?utf-8?B?aUJCWVd4VC8rd24vKzlKNDBxcDE4QnVqVTEvU0FaOXBKTzh4RGkrdU4rWHBj?=
 =?utf-8?B?aVp5QmJQWDVCdTdyNUNZREhXMHMxK0pEaWZ0SVIyNE0wdVpVbXF4R2R2NFZM?=
 =?utf-8?B?aXNIVEJ6TGxtSjZGUm4rMDd0RmExcTVHNGRSdUFxNXJLVlpCRG1TampTVnAz?=
 =?utf-8?B?OTZpYTFvRit4UXNxN2RZSkc1TDZENndXSUl1bWlMRWliYm1xQ0J0Z2IrQUZw?=
 =?utf-8?B?YTZoWkJSWmt0cnh1SGg1SG5EdllpNmpGbmZzR3RBanU5eGVGenQrZkY4Vllh?=
 =?utf-8?B?WVpYT2ZQeHN0YWxJZC81YmlHMENRQWhtaGZ6Z1E1QXp5dzQxNkZLM1hoUjBn?=
 =?utf-8?B?cTZab0VUdEdrYXZtWlZuZTNqOHZRTkcrK3pudWRoYVdPYmw4SDlONlhlS3J6?=
 =?utf-8?B?WFZDZG4vT1dXUmNQL3Q0c0R0NUhNOERGS25sYnUwK1lHNGJLYVlsSEthZ3Jn?=
 =?utf-8?B?VW1OVXBYKytMMzFkVHdNRXZJalBOeWcvUjU2S29wTmdIU1VvdXpWQVNnemJT?=
 =?utf-8?B?c3VIb2k2c08yOWtFKytzSERrWm1nS0VudDJIbkZyeVRzckJRRHJKc3NLbzBm?=
 =?utf-8?B?T2t0aDBUYW1ndjhzWjN5TnA4WXN0My9aemh1UHc0UDVmVnJtSVVmdVRIYWJN?=
 =?utf-8?B?SkNzRlRLend6dSs1aU02dERCc0FUU0ZJTWc2cXVKK0FmMVlaeFJja1daU0ps?=
 =?utf-8?B?aE5FRHhqQmowQVRXVy83TWprVTBVdmtXVTdOLzc5djRvTjBNSS9nQUhab2RQ?=
 =?utf-8?B?ZUFad0dseTVXTEU5TDNFcW9qS0lOSFp6UkxUc21BRHBna24xMCtyUklLZVhH?=
 =?utf-8?B?THVTRUIrZXBxWkxhT0ExYllNWGQ2UzRGSGkwUW1MaWFQaXprSnJTbXNJSWZy?=
 =?utf-8?B?VC8rekcrNmRaQVNtYkJrRGlaUDZZMlpoNlZDTFdDdHdBWlFja1U5NEM4UW43?=
 =?utf-8?B?RjNkd0dLdTdEL3RkbXpWU2dJRlY3QzNaeGJJM1NhTmZiUXRsdFJENHlrcWpt?=
 =?utf-8?Q?qryOzr3Ggf4sndiXtQ8w7hCidXwa2LBJ++UVT69F/EGH?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: edbc604d-73a3-47a7-2892-08de205df752
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2025 13:35:08.8049 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8XR8yb23qc3Ekd1Eg9s1QkOfoSd1Di3FzGtwpQdISVBeUBE9R29lBEy25FKYbvahprinPTgHyqdpN1soAht/dQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4055
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

Add definition for RISCV_CPUCTL register and use it in a new falcon API
to check if the RISC-V core of a Falcon is active. It is required by
the sequencer to know if the GSP's RISCV processor is active.

Reviewed-by: Lyude Paul <lyude@redhat.com>
Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/falcon.rs | 9 +++++++++
 drivers/gpu/nova-core/regs.rs   | 7 ++++++-
 2 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/falcon.rs
index fe5b3256d972..4c1f36073533 100644
--- a/drivers/gpu/nova-core/falcon.rs
+++ b/drivers/gpu/nova-core/falcon.rs
@@ -612,4 +612,13 @@ pub(crate) fn signature_reg_fuse_version(
         self.hal
             .signature_reg_fuse_version(self, bar, engine_id_mask, ucode_id)
     }
+
+    /// Check if the RISC-V core is active.
+    ///
+    /// Returns `true` if the RISC-V core is active, `false` otherwise.
+    #[expect(unused)]
+    pub(crate) fn is_riscv_active(&self, bar: &Bar0) -> bool {
+        let cpuctl = regs::NV_PRISCV_RISCV_CPUCTL::read(bar, &E::ID);
+        cpuctl.active_stat()
+    }
 }
diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
index 41fdda8a0748..5d5ba766cd61 100644
--- a/drivers/gpu/nova-core/regs.rs
+++ b/drivers/gpu/nova-core/regs.rs
@@ -339,7 +339,12 @@ pub(crate) fn mem_scrubbing_done(self) -> bool {
 
 // PRISCV
 
-register!(NV_PRISCV_RISCV_BCR_CTRL @ PFalconBase[0x00001668] {
+register!(NV_PRISCV_RISCV_CPUCTL @ PFalcon2Base[0x00000388] {
+    0:0     halted as bool;
+    7:7     active_stat as bool;
+});
+
+register!(NV_PRISCV_RISCV_BCR_CTRL @ PFalcon2Base[0x00000668] {
     0:0     valid as bool;
     4:4     core_select as bool => PeregrineCoreSelect;
     8:8     br_fetch as bool;

-- 
2.51.2

