Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D43F0C18F38
	for <lists+dri-devel@lfdr.de>; Wed, 29 Oct 2025 09:18:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D18210E73B;
	Wed, 29 Oct 2025 08:18:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="lI+YIvja";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazon11012055.outbound.protection.outlook.com [52.101.43.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6367A10E737;
 Wed, 29 Oct 2025 08:18:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k1kMbj0CmoKdAvemJbGQdWabcIyDqztlPmvUv9o7FUTzJDP4Lj24HieUkpxyJjEPEVKrdsYJlFiawffLT9E1G6a7QYh1/6ey4Q6CCSJEjJAdKjLevdeDV7LTkaHp6dHJyAbbk3Vr5b108gl2U7wFc71Bv5xe67Lq16AUasXBflLZsMBrfsBcrormG3wp1Kvd2J4Y2sOyePEJRYxC0wjbYvO66p4AzFm9kUfvZAoYsJDGosMeOmQbzcoTpLG15Hz+wqNU5hTcDPbBcoauGwH5HJqms1UMA0/4GA69spW8Mvjmq+7brcYAakmOpYYrPguW0ApNf7CCUvsmqb8QoLIyyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nVtbTwp22qSK9nErFK/KIwSQ+3cJPfYxnQcXEbCzEeg=;
 b=vQ6BKGttcmphQSp5Wq6Rs8TgrP1k2d6+xTSEtfbeUK3qQpOyQFIdyFTwvsaYTxCkCLfL1eeS6igYCa9cFOwFwxg51fQJ0IiZdWgYyJtcg8pi3HnZm7w/oCbpOfcNihBVxQ3iXRpcRtalEnvQHuHM0SpFCwkKw1v3bSHbxOamoHQZp5ysFt1ZCj85yYJR0EoGPYNeanfFP9z3HPijjdYGQf3Ou9JWTjJDcq57yVSAELgm99VK7BuY9/Tbvuhb1uIg50pbHaJupMTmqsw82rK/64dxR2LPsjmOwfNOefuujiD1e02/1Sxh1fL5nQphWiQavCREc2yzJiPXWgS0SeCJsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nVtbTwp22qSK9nErFK/KIwSQ+3cJPfYxnQcXEbCzEeg=;
 b=lI+YIvjapG7M7gkUQ+3d51XOllT3uFsmuBwt9F6O2eRJiV/TCi12DIo5nqkVNK8F8+hfJzqStkaN5mkz2kgw7JXQNb/Z++UbUBMBN0ffGCTrdXGkCALNGUih6EHK+EKD1TuEJiVl8hc4SL7s2wZTKWUi53kmD+H51+U68jjQ9bk6vWo0nsm4SY9OMTIA6vY8Q4JOOlzG8v3v74PEO83W3DZCjiVK8j4soSwxSfGrphI5JSQTcTD2tN7DClfq0VyxIxTKs+oUMtL/5Qz+Elw8SgrhGMnojOOWGU/WQqMzUHW3UF2QHjiOZ+RgXbdyNthfRPn239TRbN1OXQIknaItLA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB3997.namprd12.prod.outlook.com (2603:10b6:208:161::11)
 by SA3PR12MB8438.namprd12.prod.outlook.com (2603:10b6:806:2f6::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.13; Wed, 29 Oct
 2025 08:18:20 +0000
Received: from MN2PR12MB3997.namprd12.prod.outlook.com
 ([fe80::d161:329:fdd3:e316]) by MN2PR12MB3997.namprd12.prod.outlook.com
 ([fe80::d161:329:fdd3:e316%4]) with mapi id 15.20.9275.011; Wed, 29 Oct 2025
 08:18:20 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Wed, 29 Oct 2025 17:16:38 +0900
Subject: [PATCH v7 11/14] gpu: nova-core: gsp: Add RM registry and sysinfo
 bindings and commands
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251029-gsp_boot-v7-11-34227afad347@nvidia.com>
References: <20251029-gsp_boot-v7-0-34227afad347@nvidia.com>
In-Reply-To: <20251029-gsp_boot-v7-0-34227afad347@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Benno Lossin <lossin@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>
Cc: John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Edwin Peer <epeer@nvidia.com>, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>, 
 Lyude Paul <lyude@redhat.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TYCP301CA0030.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:381::20) To MN2PR12MB3997.namprd12.prod.outlook.com
 (2603:10b6:208:161::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB3997:EE_|SA3PR12MB8438:EE_
X-MS-Office365-Filtering-Correlation-Id: f15ebe8a-f336-452a-0eb2-08de16c3b8c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|7416014|376014|366016|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TXhsb2VPVnVXZGNyNXBSdlUwVm9mVGNsQzlPNjVsUmNFdGlwU2RNbU5PRzh4?=
 =?utf-8?B?L0QrellUMzVtOVZGL29FNW5NaG02L1p1N05WemQ4NjB1MGUzb3hqMXB1VzFp?=
 =?utf-8?B?YU1wOG95UzVIOThBa00renhHNzJDTU9nWDdGYjNsL0pqb2ZQQW1jTk16TTlv?=
 =?utf-8?B?eWRyNk9aQk96cjMyRVRiTDNwOW0zaWtmSG5DSTdvVEFKaTBqMnBBalF1YnAr?=
 =?utf-8?B?VkJHaUw5dEYzSWx3Q0hOMkFJS3pQUlFTQUdkOVh6aWRuMjNBSWMvVlBwZWMz?=
 =?utf-8?B?U0Y5T29vTXlpc0ZXcEVnZC81RHZyMmRuMGJTSkpWMGhHdC92ekkxblNlVGY2?=
 =?utf-8?B?ODR1cDIvUDVtVFlPQ05ta3dCaFY2Lzl3K2VuU0JmYWpqRThSZkxWK3lkc1lm?=
 =?utf-8?B?eTF2Y1dmQ08rTUVWcjJITFhqRy93Q0tjOWtqcTF0SG9tZTZ3VFBINjJ1SXl1?=
 =?utf-8?B?TjlNc0oyR3lGN3pOVjZ5KzJMdXlhQlZnNDhtSndjYzA5Z3FxMjV4Tjc5M1gz?=
 =?utf-8?B?UG93cENScmZBejRWWlU4WjMxNmdYSE5IOTNneFdINkprM3FVeW1wNXI2QjJS?=
 =?utf-8?B?SDBJd0VHL3RZd1JITXI2T3QzR0ZlNjNmU1RIa3VJYTN3anZ4VFAwVlNVN3Bh?=
 =?utf-8?B?WWJTVVNNbGpzZ1NSVVdiOGdKT0FzOFV3RTdLVnMyOExudUVaYm56N0xWa2Zy?=
 =?utf-8?B?NlhraE9sU00xRkpTWUdnM1RWOUoxNEtUcDhCZk5aNkhyUWFZSHd6NXJGNWhG?=
 =?utf-8?B?L29CVlpDQ2NiL1c5cndydXlzSHZlZHcwb2ErMTZJdVJWdmhKN1NhblpvbTNS?=
 =?utf-8?B?OGJRRHkwUzdWeGhFT0RUZXp4dGZEdVJLcEhocjFISkN4MG9aTDRySGRGRXdj?=
 =?utf-8?B?Z1hxalVsOUgya3VMOHJnQ09NSTE3anVGVmN5ZSs2VVpoNXhZQTFiUUhRY0Yz?=
 =?utf-8?B?T0U3ZHhsWll0dU84OFNPemNDRkJ6dDQ3NjEyeU5xRHZRZHVkektKejEyTWRU?=
 =?utf-8?B?cmpzNTVEQ3ViT3FHRVVheW1HVzROMEN3UGc4cGwvdDNHcDUzN2FqN0lxZmJa?=
 =?utf-8?B?S1I2S3lra1VSY1ExZEZkSUVaQzVZaGREd2xHNVVsMXpaeTdUK3VOTUQ5ZkJV?=
 =?utf-8?B?a2FTOGVpNWw2dEx3ekZLS1BIQWF1alFIcVFYMHhhSkQ0SDJ1SkxYWXdHSG1K?=
 =?utf-8?B?TjlaS1pVS2gwMmVhZmEvb2c3KzRZWHdHdGZtQXRDZ2FleHBmRy9ienBDQ1NJ?=
 =?utf-8?B?ZUZ2L05LeHJiSXE1N1VNUk1FenFCbEpBckZwTVREaFBQa3hGK2xlVFhwUTYz?=
 =?utf-8?B?b3N5bCtlRG53NlRlREdkeVo3M3Z3RTZETnlXajBNSGhPVFVLTVhWSTVnTjU3?=
 =?utf-8?B?SVhQZVRjeTRpK0NPN3dNU0hPWmhKY09kekVWWG5aVURYTHE1alR4QksrbFBH?=
 =?utf-8?B?ZVJja0VIbnVzcWNzT3VMOUoydGtCUDhQRnY0QXU3VXR0ZFhqWDRsWENndzM1?=
 =?utf-8?B?T3dUYUNjSFIxbnhKZXB1S3lmdi9qa1F1Tkgyb0E5dUV1VjFwSjg2SytlWlJS?=
 =?utf-8?B?VWpjUEg3WE0xc3plMDVYdlphVmhxSjJzWVNuNUNVWHV5cnIvZXFmeHZTNTlZ?=
 =?utf-8?B?cm52QSs4TWErMjBmRTIvSVBMcUV4K0cvRE85TmMyU21tUXRmeWp6V2J2YThL?=
 =?utf-8?B?V2xxVXkwVnVuWE5aQ3NacGU2eVExamtPTEMyZC9ZdzdMWDJtT3RqNWFldHkw?=
 =?utf-8?B?dXk1UlBENzF1dkVtRXMzL3NteEw1Z1JmS005SWJsOGNwUnRHTTZYRkFMUk9x?=
 =?utf-8?B?SUVBakk1dnVyaTNYU1pyeTZ5V0NURS95V01yK0RtWnJLQ1V1YllyQzVmbW9v?=
 =?utf-8?B?V0cvaFpGZkNza3hVTytjRGZVTnhnYVdhZ1hQRHRvYlo0YWFlVU5Ic1V0YVRK?=
 =?utf-8?B?RDZjYng4Z2ZmSUNNRHpMNzBxbVJ4THY3dllLYlZvZjkxUFVrRFhJMjhDTXhI?=
 =?utf-8?Q?i5cxFhY1YIOKpU1ItxHwRGRUhDKX58=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3997.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(7416014)(376014)(366016)(1800799024)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MWxRbnQrN091S2lUVWovbkdmejdPV1hJSDhjNTVRWEZvT0s0VUV1Wnd4ck9v?=
 =?utf-8?B?UWM3OGpJSVBFZFRMZXVFQmtZbVM2aVA0VHNIQis1Q0FvTE92c1grbXFqOVI5?=
 =?utf-8?B?akhuNER4Q0NwY2lreXlpS0JzcWhsT0VXUnJwTlNUb2ZuVmF5M3dmcXF2WldE?=
 =?utf-8?B?UHN2WWlPQTJFTDhWZHZaVFFMejgrNnN2NENwQm96YThLS0lDOHF1dS9WVmM5?=
 =?utf-8?B?cHJHTlBydDRwK0VjOUQ4K1JaYjRCbUdLbVU4eWZTUTgveEhWT2pMT2UyMnow?=
 =?utf-8?B?YzVzNGhFM3BYeWFEM1JVYTdka2FRd2NjWmovTEpmb0pjNkg1cE5Ca0ZKUWNN?=
 =?utf-8?B?ZVJtTWw3dzVWQjEwblRkZ0pjN1BNTTBuNXJIazhQWUc4R2xWRFFxaVRJUEU4?=
 =?utf-8?B?WVhqOGFlOHlPUml2Wjd1K2s5TE5yK1Nya1IvUXJFNGVmbEUwWitOeFBMWGoz?=
 =?utf-8?B?c2NEa2QvMHlNdk1MYngzcEVOWXNUcXdvTzYvMU9WOEFoUmtPTFhDZ0ZqWCsr?=
 =?utf-8?B?eFl4Y3BxRTk4emk1NUFIZ25MQzJzOU00THd0U0tNRnAzS0hNSlpkcm5FN2pM?=
 =?utf-8?B?Ny8vRTBJSmZMMzB2aXNoQVRGZlhaa2J0bE9BUXBpcHRsQjVoR1g5ZmIwaDFa?=
 =?utf-8?B?QXpGUFJpV0I5T2dYSko1OEI2aU16UVJwRU8reFF4dHpBcit1b2lQajdwRStC?=
 =?utf-8?B?MG5xV0lSUGFtejVsdWROS2g4T1N0SzdqSmMvN3RVcktiU2FUdUoyMjAxY0FB?=
 =?utf-8?B?L1c4WUxIbUIzRUZ1QVJWSktYY1RWZUtScnA5TXRRcC93aXBqKzBPYVJ1UHFi?=
 =?utf-8?B?RW56cnF2UUp4QnV5YTR4UjFzamZja0p6Nk1lWGxHZVh6UDF6SzVnQXVXM0ZG?=
 =?utf-8?B?VmR2cHBVbmNPd1ZPbEwvbzNuNHBRdzIxS2tucmxad01tdXFpQWpTRmZ3anNQ?=
 =?utf-8?B?QlJoalRSazR1ZWxQWGNUejBkdncvb05ZK3BDTndETkFKd0d3Z0RkemsxYXBX?=
 =?utf-8?B?UzhSVmdIUC94ME1wT1JvcDd0MTBxamJoTytUbWU4cHpJcy9jdlRYZnVpbmRT?=
 =?utf-8?B?Snk1VHM3Y2NXU2JqdC8wK3djREVOaDk3MGx1QkVGZlEzRWhKZXRYKzdnL0Yy?=
 =?utf-8?B?alZtbndiaGErSHY1K3dXNGJvUm8rejNxNStQN1I4TFhmdHI0eDFucE56ZS8z?=
 =?utf-8?B?T0s5aityeHlhRDZYOVNINXlMTno3b1BGSVpqQkhTdjU1NUhiQ24vWVo0bllq?=
 =?utf-8?B?V09oaFVtNGdWTHZKMnJPVGc4M01tOXQ5aTBvU09xWm9vRk1OWXNxTlhEY2h6?=
 =?utf-8?B?QkhSbjVIRXlCc2lIN2JCNUUyZnQ4R21mK0RWN1JJd2FxNGtUbWVlQmtRNGtl?=
 =?utf-8?B?a2YyM1Q0ZWN6TytsalN3a1FPMlAweFhKWE9HZ1lrOVBydCtqVWliSkxna3RO?=
 =?utf-8?B?MGJFNWVHZlh6ZXJEOHpTM2hTbCt4UEd2cGdJYkFqWFFuR1hFb2dxdy9tdUlq?=
 =?utf-8?B?azE1ZVNkQ3FmUDl4enBFSTVrakhLeVRTVUhvclYvSWwxcngvMnpwQS90OHJS?=
 =?utf-8?B?LzRKUFBuZ2UvZnM0RFVuTUp3QmlyOWcySHZvY1VNWW50WDMwZkQwcmF3RGlu?=
 =?utf-8?B?MDhsZ1JiMnNPVWh3NHFGUVltTkRjYkR5c2NUYXp0anBFangxMVV4c25DcFpt?=
 =?utf-8?B?ZmNLWU1FYzcyNFYyT3NVczc3YlVqR0lsUGhRb0F2cmxMSnhrWGsxcXVJZlNs?=
 =?utf-8?B?aXBVcEpqNElhNUVnSHVlZElFblltSUNaTmtNVm5RV3dlRzdXZTc2N3Y3LzBu?=
 =?utf-8?B?VWFUcngwWTh3eHFLdjVjSU9vMU0yMXliQllhMG9aMlQ0Mm5QWEc4SW8zSmRT?=
 =?utf-8?B?bWkyZmYrdXJjY0k4eGVsalVqWDdHSHJOZUp2QVl6QThNNGN5cVVLWGd6ay9y?=
 =?utf-8?B?aHRvUitlYzk4VFAwWDQ3czZtdGN2Y2o3c0cyREEwNmV0M2wzSnVEZVN5ZFJD?=
 =?utf-8?B?QUYvVHNQYkVaVEZPOGNheVFjM2hOMnNPNXBmTEdIZmp1REZ3dSszTGhHdURv?=
 =?utf-8?B?NGU3Nk4raTYwVEZsQWwvckYrN0FJblZjMHIvbHllS2gzaDV5ai8wbTZ5Zndq?=
 =?utf-8?B?MlUrZFIySHV4akVQSHJxaSszMkhyVit5M05nWlJGSmljY05YcVErbnQzSUNp?=
 =?utf-8?Q?xqjYJqVsXPhUkNYKLaDAmPX+b+jwcc9QadsVenawnEx9?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f15ebe8a-f336-452a-0eb2-08de16c3b8c0
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3997.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2025 08:18:20.8432 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: woebxsGqiwRuPLJDPyZeDO4s9czq0njXKd2fSdNvoWlwhqQ9e3MWdEdDMQNeIBzK5NWgnZaWg7Zs9RObFzYCFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB8438
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

From: Alistair Popple <apopple@nvidia.com>

Add the RM registry and system information commands that enable the host
driver to configure GSP firmware parameters during initialization.

The RM registry is serialized into a packed format and sent via the
command queue. For now only two parameters which are required to boot
GSP are hardcoded. In future a kernel module parameter will be added to
enable other parameters to be added.

Also add the system info command, which provides required hardware
information to the GSP. These commands use the GSP command queue
infrastructure to issue commands to the GSP which is read during GSP
boot.

Reviewed-by: Lyude Paul <lyude@redhat.com>
Signed-off-by: Alistair Popple <apopple@nvidia.com>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/gsp.rs                      |   1 +
 drivers/gpu/nova-core/gsp/boot.rs                 |   6 +-
 drivers/gpu/nova-core/gsp/cmdq.rs                 |   2 -
 drivers/gpu/nova-core/gsp/commands.rs             | 117 +++++++++++++++++
 drivers/gpu/nova-core/gsp/fw.rs                   |   1 +
 drivers/gpu/nova-core/gsp/fw/commands.rs          | 100 +++++++++++++++
 drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs | 148 ++++++++++++++++++++++
 drivers/gpu/nova-core/sbuffer.rs                  |   1 -
 8 files changed, 372 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp.rs b/drivers/gpu/nova-core/gsp.rs
index e3b7a6bbe004..36175eafaf2e 100644
--- a/drivers/gpu/nova-core/gsp.rs
+++ b/drivers/gpu/nova-core/gsp.rs
@@ -14,6 +14,7 @@
 use crate::gsp::cmdq::Cmdq;
 
 pub(crate) mod cmdq;
+pub(crate) mod commands;
 mod fw;
 
 use fw::GspArgumentsCached;
diff --git a/drivers/gpu/nova-core/gsp/boot.rs b/drivers/gpu/nova-core/gsp/boot.rs
index 1d2448331d7a..0b306313ec53 100644
--- a/drivers/gpu/nova-core/gsp/boot.rs
+++ b/drivers/gpu/nova-core/gsp/boot.rs
@@ -16,6 +16,7 @@
     FIRMWARE_VERSION,
 };
 use crate::gpu::Chipset;
+use crate::gsp::commands::{build_registry, set_system_info};
 use crate::gsp::GspFwWprMeta;
 use crate::regs;
 use crate::vbios::Vbios;
@@ -105,7 +106,7 @@ fn run_fwsec_frts(
     ///
     /// Upon return, the GSP is up and running, and its runtime object given as return value.
     pub(crate) fn boot(
-        self: Pin<&mut Self>,
+        mut self: Pin<&mut Self>,
         pdev: &pci::Device<device::Bound>,
         bar: &Bar0,
         chipset: Chipset,
@@ -139,6 +140,9 @@ pub(crate) fn boot(
             CoherentAllocation::<GspFwWprMeta>::alloc_coherent(dev, 1, GFP_KERNEL | __GFP_ZERO)?;
         dma_write!(wpr_meta[0] = GspFwWprMeta::new(&gsp_fw, &fb_layout))?;
 
+        set_system_info(&mut self.cmdq, pdev, bar)?;
+        build_registry(&mut self.cmdq, bar)?;
+
         Ok(())
     }
 }
diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gsp/cmdq.rs
index df1633cba2a6..0fb8ff26ba2f 100644
--- a/drivers/gpu/nova-core/gsp/cmdq.rs
+++ b/drivers/gpu/nova-core/gsp/cmdq.rs
@@ -325,7 +325,6 @@ fn notify_gsp(bar: &Bar0) {
             .write(bar);
     }
 
-    #[expect(unused)]
     pub(crate) fn send_gsp_command<M, E>(&mut self, bar: &Bar0, init: impl Init<M, E>) -> Result
     where
         M: CommandToGsp,
@@ -337,7 +336,6 @@ pub(crate) fn send_gsp_command<M, E>(&mut self, bar: &Bar0, init: impl Init<M, E
         self.send_gsp_command_base_with_payload(bar, 0, init, |_| Ok(()))
     }
 
-    #[expect(unused)]
     pub(crate) fn send_gsp_command_with_payload<M, E>(
         &mut self,
         bar: &Bar0,
diff --git a/drivers/gpu/nova-core/gsp/commands.rs b/drivers/gpu/nova-core/gsp/commands.rs
new file mode 100644
index 000000000000..338d1695027f
--- /dev/null
+++ b/drivers/gpu/nova-core/gsp/commands.rs
@@ -0,0 +1,117 @@
+// SPDX-License-Identifier: GPL-2.0
+
+use kernel::build_assert;
+use kernel::device;
+use kernel::pci;
+use kernel::prelude::*;
+use kernel::transmute::AsBytes;
+
+use super::fw::commands::*;
+use super::fw::MsgFunction;
+use crate::driver::Bar0;
+use crate::gsp::cmdq::Cmdq;
+use crate::gsp::cmdq::{CommandToGsp, CommandToGspBase, CommandToGspWithPayload};
+use crate::gsp::GSP_PAGE_SIZE;
+use crate::sbuffer::SBufferIter;
+
+// For now we hard-code the registry entries. Future work will allow others to
+// be added as module parameters.
+const GSP_REGISTRY_NUM_ENTRIES: usize = 3;
+pub(crate) struct RegistryEntry {
+    key: &'static str,
+    value: u32,
+}
+
+pub(crate) struct RegistryTable {
+    entries: [RegistryEntry; GSP_REGISTRY_NUM_ENTRIES],
+}
+
+impl CommandToGspBase for PackedRegistryTable {
+    const FUNCTION: MsgFunction = MsgFunction::SetRegistry;
+}
+impl CommandToGspWithPayload for PackedRegistryTable {}
+
+impl RegistryTable {
+    fn write_payload<'a, I: Iterator<Item = &'a mut [u8]>>(
+        &self,
+        mut sbuffer: SBufferIter<I>,
+    ) -> Result {
+        let string_data_start_offset = size_of::<PackedRegistryTable>()
+            + GSP_REGISTRY_NUM_ENTRIES * size_of::<PackedRegistryEntry>();
+
+        // Array for string data.
+        let mut string_data = KVec::new();
+
+        for entry in self.entries.iter().take(GSP_REGISTRY_NUM_ENTRIES) {
+            sbuffer.write_all(
+                PackedRegistryEntry::new(
+                    (string_data_start_offset + string_data.len()) as u32,
+                    entry.value,
+                )
+                .as_bytes(),
+            )?;
+
+            let key_bytes = entry.key.as_bytes();
+            string_data.extend_from_slice(key_bytes, GFP_KERNEL)?;
+            string_data.push(0, GFP_KERNEL)?;
+        }
+
+        sbuffer.write_all(string_data.as_slice())
+    }
+
+    fn size(&self) -> usize {
+        let mut key_size = 0;
+        for i in 0..GSP_REGISTRY_NUM_ENTRIES {
+            key_size += self.entries[i].key.len() + 1; // +1 for NULL terminator
+        }
+        GSP_REGISTRY_NUM_ENTRIES * size_of::<PackedRegistryEntry>() + key_size
+    }
+}
+
+pub(crate) fn build_registry(cmdq: &mut Cmdq, bar: &Bar0) -> Result {
+    let registry = RegistryTable {
+        entries: [
+            // RMSecBusResetEnable - enables PCI secondary bus reset
+            RegistryEntry {
+                key: "RMSecBusResetEnable",
+                value: 1,
+            },
+            // RMForcePcieConfigSave - forces GSP-RM to preserve PCI
+            //   configuration registers on any PCI reset.
+            RegistryEntry {
+                key: "RMForcePcieConfigSave",
+                value: 1,
+            },
+            // RMDevidCheckIgnore - allows GSP-RM to boot even if the PCI dev ID
+            //   is not found in the internal product name database.
+            RegistryEntry {
+                key: "RMDevidCheckIgnore",
+                value: 1,
+            },
+        ],
+    };
+
+    cmdq.send_gsp_command_with_payload(
+        bar,
+        registry.size(),
+        PackedRegistryTable::init(GSP_REGISTRY_NUM_ENTRIES as u32, registry.size() as u32),
+        |sbuffer| registry.write_payload(sbuffer),
+    )
+}
+
+impl CommandToGspBase for GspSystemInfo {
+    const FUNCTION: MsgFunction = MsgFunction::GspSetSystemInfo;
+}
+
+impl CommandToGsp for GspSystemInfo {}
+
+pub(crate) fn set_system_info(
+    cmdq: &mut Cmdq,
+    dev: &pci::Device<device::Bound>,
+    bar: &Bar0,
+) -> Result {
+    build_assert!(size_of::<GspSystemInfo>() < GSP_PAGE_SIZE);
+    cmdq.send_gsp_command(bar, GspSystemInfo::init(dev))?;
+
+    Ok(())
+}
diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp/fw.rs
index 787cfc8a0ce6..687749bdbb45 100644
--- a/drivers/gpu/nova-core/gsp/fw.rs
+++ b/drivers/gpu/nova-core/gsp/fw.rs
@@ -1,5 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 
+pub(crate) mod commands;
 mod r570_144;
 
 // Alias to avoid repeating the version number with every use.
diff --git a/drivers/gpu/nova-core/gsp/fw/commands.rs b/drivers/gpu/nova-core/gsp/fw/commands.rs
new file mode 100644
index 000000000000..79a69c6279e8
--- /dev/null
+++ b/drivers/gpu/nova-core/gsp/fw/commands.rs
@@ -0,0 +1,100 @@
+// SPDX-License-Identifier: GPL-2.0
+
+use super::bindings;
+
+use kernel::prelude::*;
+use kernel::transmute::{AsBytes, FromBytes};
+use kernel::{device, pci};
+
+#[repr(transparent)]
+pub(crate) struct GspSystemInfo {
+    inner: bindings::GspSystemInfo,
+}
+
+impl GspSystemInfo {
+    #[allow(non_snake_case)]
+    pub(crate) fn init<'a>(dev: &'a pci::Device<device::Bound>) -> impl Init<Self, Error> + 'a {
+        type InnerGspSystemInfo = bindings::GspSystemInfo;
+        let init_inner = try_init!(InnerGspSystemInfo {
+            gpuPhysAddr: dev.resource_start(0)?,
+            gpuPhysFbAddr: dev.resource_start(1)?,
+            gpuPhysInstAddr: dev.resource_start(3)?,
+            nvDomainBusDeviceFunc: u64::from(dev.dev_id()),
+
+            // Using TASK_SIZE in r535_gsp_rpc_set_system_info() seems wrong because
+            // TASK_SIZE is per-task. That's probably a design issue in GSP-RM though.
+            maxUserVa: (1 << 47) - 4096,
+            pciConfigMirrorBase: 0x088000,
+            pciConfigMirrorSize: 0x001000,
+
+            PCIDeviceID: (u32::from(dev.device_id()) << 16) | u32::from(dev.vendor_id().as_raw()),
+            PCISubDeviceID: (u32::from(dev.subsystem_device_id()) << 16)
+                | u32::from(dev.subsystem_vendor_id()),
+            PCIRevisionID: u32::from(dev.revision_id()),
+            bIsPrimary: 0,
+            bPreserveVideoMemoryAllocations: 0,
+            ..Zeroable::init_zeroed()
+        });
+
+        try_init!(GspSystemInfo {
+            inner <- init_inner,
+        })
+    }
+}
+
+// SAFETY: These structs don't meet the no-padding requirements of AsBytes but
+//         that is not a problem because they are not used outside the kernel.
+unsafe impl AsBytes for GspSystemInfo {}
+
+// SAFETY: These structs don't meet the no-padding requirements of FromBytes but
+//         that is not a problem because they are not used outside the kernel.
+unsafe impl FromBytes for GspSystemInfo {}
+
+#[repr(transparent)]
+pub(crate) struct PackedRegistryEntry(bindings::PACKED_REGISTRY_ENTRY);
+
+impl PackedRegistryEntry {
+    pub(crate) fn new(offset: u32, value: u32) -> Self {
+        Self({
+            bindings::PACKED_REGISTRY_ENTRY {
+                nameOffset: offset,
+
+                // We only support DWORD types for now. Support for other types
+                // will come later if required.
+                type_: bindings::REGISTRY_TABLE_ENTRY_TYPE_DWORD as u8,
+                __bindgen_padding_0: Default::default(),
+                data: value,
+                length: 0,
+            }
+        })
+    }
+}
+
+// SAFETY: Padding is explicit and will not contain uninitialized data.
+unsafe impl AsBytes for PackedRegistryEntry {}
+
+#[repr(transparent)]
+pub(crate) struct PackedRegistryTable {
+    inner: bindings::PACKED_REGISTRY_TABLE,
+}
+
+impl PackedRegistryTable {
+    #[allow(non_snake_case)]
+    pub(crate) fn init(num_entries: u32, size: u32) -> impl Init<Self> {
+        type InnerPackedRegistryTable = bindings::PACKED_REGISTRY_TABLE;
+        let init_inner = init!(InnerPackedRegistryTable {
+            numEntries: num_entries,
+            size,
+            entries: Default::default()
+        });
+
+        init!(PackedRegistryTable { inner <- init_inner })
+    }
+}
+
+// SAFETY: Padding is explicit and will not contain uninitialized data.
+unsafe impl AsBytes for PackedRegistryTable {}
+
+// SAFETY: This struct only contains integer types for which all bit patterns
+// are valid.
+unsafe impl FromBytes for PackedRegistryTable {}
diff --git a/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs b/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs
index 17fb2392ec3c..32933874ff97 100644
--- a/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs
+++ b/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs
@@ -321,6 +321,138 @@ fn fmt(&self, fmt: &mut ::core::fmt::Formatter<'_>) -> ::core::fmt::Result {
 pub type _bindgen_ty_3 = ffi::c_uint;
 #[repr(C)]
 #[derive(Debug, Default, Copy, Clone, Zeroable)]
+pub struct DOD_METHOD_DATA {
+    pub status: u32_,
+    pub acpiIdListLen: u32_,
+    pub acpiIdList: [u32_; 16usize],
+}
+#[repr(C)]
+#[derive(Debug, Default, Copy, Clone, Zeroable)]
+pub struct JT_METHOD_DATA {
+    pub status: u32_,
+    pub jtCaps: u32_,
+    pub jtRevId: u16_,
+    pub bSBIOSCaps: u8_,
+    pub __bindgen_padding_0: u8,
+}
+#[repr(C)]
+#[derive(Debug, Default, Copy, Clone, Zeroable)]
+pub struct MUX_METHOD_DATA_ELEMENT {
+    pub acpiId: u32_,
+    pub mode: u32_,
+    pub status: u32_,
+}
+#[repr(C)]
+#[derive(Debug, Default, Copy, Clone, Zeroable)]
+pub struct MUX_METHOD_DATA {
+    pub tableLen: u32_,
+    pub acpiIdMuxModeTable: [MUX_METHOD_DATA_ELEMENT; 16usize],
+    pub acpiIdMuxPartTable: [MUX_METHOD_DATA_ELEMENT; 16usize],
+    pub acpiIdMuxStateTable: [MUX_METHOD_DATA_ELEMENT; 16usize],
+}
+#[repr(C)]
+#[derive(Debug, Default, Copy, Clone, Zeroable)]
+pub struct CAPS_METHOD_DATA {
+    pub status: u32_,
+    pub optimusCaps: u32_,
+}
+#[repr(C)]
+#[derive(Debug, Default, Copy, Clone, Zeroable)]
+pub struct ACPI_METHOD_DATA {
+    pub bValid: u8_,
+    pub __bindgen_padding_0: [u8; 3usize],
+    pub dodMethodData: DOD_METHOD_DATA,
+    pub jtMethodData: JT_METHOD_DATA,
+    pub muxMethodData: MUX_METHOD_DATA,
+    pub capsMethodData: CAPS_METHOD_DATA,
+}
+#[repr(C)]
+#[derive(Debug, Default, Copy, Clone, Zeroable)]
+pub struct BUSINFO {
+    pub deviceID: u16_,
+    pub vendorID: u16_,
+    pub subdeviceID: u16_,
+    pub subvendorID: u16_,
+    pub revisionID: u8_,
+    pub __bindgen_padding_0: u8,
+}
+#[repr(C)]
+#[derive(Debug, Default, Copy, Clone, Zeroable)]
+pub struct GSP_VF_INFO {
+    pub totalVFs: u32_,
+    pub firstVFOffset: u32_,
+    pub FirstVFBar0Address: u64_,
+    pub FirstVFBar1Address: u64_,
+    pub FirstVFBar2Address: u64_,
+    pub b64bitBar0: u8_,
+    pub b64bitBar1: u8_,
+    pub b64bitBar2: u8_,
+    pub __bindgen_padding_0: [u8; 5usize],
+}
+#[repr(C)]
+#[derive(Debug, Default, Copy, Clone, Zeroable)]
+pub struct GSP_PCIE_CONFIG_REG {
+    pub linkCap: u32_,
+}
+#[repr(C)]
+#[derive(Debug, Default, Copy, Clone, Zeroable)]
+pub struct GspSystemInfo {
+    pub gpuPhysAddr: u64_,
+    pub gpuPhysFbAddr: u64_,
+    pub gpuPhysInstAddr: u64_,
+    pub gpuPhysIoAddr: u64_,
+    pub nvDomainBusDeviceFunc: u64_,
+    pub simAccessBufPhysAddr: u64_,
+    pub notifyOpSharedSurfacePhysAddr: u64_,
+    pub pcieAtomicsOpMask: u64_,
+    pub consoleMemSize: u64_,
+    pub maxUserVa: u64_,
+    pub pciConfigMirrorBase: u32_,
+    pub pciConfigMirrorSize: u32_,
+    pub PCIDeviceID: u32_,
+    pub PCISubDeviceID: u32_,
+    pub PCIRevisionID: u32_,
+    pub pcieAtomicsCplDeviceCapMask: u32_,
+    pub oorArch: u8_,
+    pub __bindgen_padding_0: [u8; 7usize],
+    pub clPdbProperties: u64_,
+    pub Chipset: u32_,
+    pub bGpuBehindBridge: u8_,
+    pub bFlrSupported: u8_,
+    pub b64bBar0Supported: u8_,
+    pub bMnocAvailable: u8_,
+    pub chipsetL1ssEnable: u32_,
+    pub bUpstreamL0sUnsupported: u8_,
+    pub bUpstreamL1Unsupported: u8_,
+    pub bUpstreamL1PorSupported: u8_,
+    pub bUpstreamL1PorMobileOnly: u8_,
+    pub bSystemHasMux: u8_,
+    pub upstreamAddressValid: u8_,
+    pub FHBBusInfo: BUSINFO,
+    pub chipsetIDInfo: BUSINFO,
+    pub __bindgen_padding_1: [u8; 2usize],
+    pub acpiMethodData: ACPI_METHOD_DATA,
+    pub hypervisorType: u32_,
+    pub bIsPassthru: u8_,
+    pub __bindgen_padding_2: [u8; 7usize],
+    pub sysTimerOffsetNs: u64_,
+    pub gspVFInfo: GSP_VF_INFO,
+    pub bIsPrimary: u8_,
+    pub isGridBuild: u8_,
+    pub __bindgen_padding_3: [u8; 2usize],
+    pub pcieConfigReg: GSP_PCIE_CONFIG_REG,
+    pub gridBuildCsp: u32_,
+    pub bPreserveVideoMemoryAllocations: u8_,
+    pub bTdrEventSupported: u8_,
+    pub bFeatureStretchVblankCapable: u8_,
+    pub bEnableDynamicGranularityPageArrays: u8_,
+    pub bClockBoostSupported: u8_,
+    pub bRouteDispIntrsToCPU: u8_,
+    pub __bindgen_padding_4: [u8; 6usize],
+    pub hostPageSize: u64_,
+}
+#[repr(C)]
+#[derive(Debug, Default, Copy, Clone, Zeroable)]
 pub struct MESSAGE_QUEUE_INIT_ARGUMENTS {
     pub sharedMemPhysAddr: u64_,
     pub pageTableEntryCount: u32_,
@@ -517,6 +649,22 @@ pub struct LibosMemoryRegionInitArgument {
     pub __bindgen_padding_0: [u8; 6usize],
 }
 #[repr(C)]
+#[derive(Debug, Default, Copy, Clone)]
+pub struct PACKED_REGISTRY_ENTRY {
+    pub nameOffset: u32_,
+    pub type_: u8_,
+    pub __bindgen_padding_0: [u8; 3usize],
+    pub data: u32_,
+    pub length: u32_,
+}
+#[repr(C)]
+#[derive(Debug, Default)]
+pub struct PACKED_REGISTRY_TABLE {
+    pub size: u32_,
+    pub numEntries: u32_,
+    pub entries: __IncompleteArrayField<PACKED_REGISTRY_ENTRY>,
+}
+#[repr(C)]
 #[derive(Debug, Default, Copy, Clone, Zeroable)]
 pub struct msgqTxHeader {
     pub version: u32_,
diff --git a/drivers/gpu/nova-core/sbuffer.rs b/drivers/gpu/nova-core/sbuffer.rs
index acde73132ba0..4d7cbc4bd060 100644
--- a/drivers/gpu/nova-core/sbuffer.rs
+++ b/drivers/gpu/nova-core/sbuffer.rs
@@ -193,7 +193,6 @@ fn get_slice_mut(&mut self, len: usize) -> Option<&'a mut [u8]> {
 
     /// Ideally we would implement [`Write`], but it is not available in `core`.
     /// So mimic `std::io::Write::write_all`.
-    #[expect(unused)]
     pub(crate) fn write_all(&mut self, mut src: &[u8]) -> Result {
         while !src.is_empty() {
             match self.get_slice_mut(src.len()) {

-- 
2.51.0

