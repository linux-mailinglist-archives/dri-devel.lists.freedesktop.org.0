Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42B12AD7306
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jun 2025 16:03:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73C4710E870;
	Thu, 12 Jun 2025 14:03:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="DKQWEfiu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2089.outbound.protection.outlook.com [40.107.100.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D4F310E867;
 Thu, 12 Jun 2025 14:03:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZEMMjMht885zbdaQPZtpyAleCD/ajj8gJZnn6o967yfX3k0PccLWWdirpUZwYsj+4nDO7tWg7TgIOqJK3yugz9ntX60ndoowz4NZL6uqp95rNi3EkYze08pLFRynxvZQRHWFfZ4RUzMRzBFBjSQjN33XE0y/hQhoNszEb0HcD/ObsGFSPvyACR9SuHHRHbUeTNcuJDAjvjSg1I506wLyXPoCZa56OCWlYqWoALsInurzuyx7mQGc8TlxZrjTUROWio/49BqNILX19c74aaC7xhYSyBhC36qj6tyZ79aoHKzVD2C3bmE587ykgASN4csvm1FxYh6QUsfH7ZNXUA+XtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gVdeOSaK6oXuDuSmZ9ja//bAAloMWQc1ufxN4SDGV0U=;
 b=MX5uOg2U4n6p2utRxpPXG4Qd6e3DfOuNl4v1lf4e6fOD7ig1jkdSjjYdShjF9yqXWZnlfbmE4FyNKIrpbgenTBeiCHNVb/AHP9DD4JmvmwiJcGel9yZQLry4Kg8VU2K1L6rQ0tggETEvnfmpAcDhaiBRxZ8WPg4CJONJTye0JI4LE3LTjxz9EFDVaQlwwqlK2P6JhBAZYmjPDExtHlx9aXTuSUQgGnnYIZjcVtfy1nntc08aCbjB5W06qj4nGXb9ZABTtrYdVEckTjAcCzFNHZarbPuHyp4pjvu752IHKrQWDRzSfShqOAnpN3/XvRTa6nlbjtrWkEdRpcDxhr9B5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gVdeOSaK6oXuDuSmZ9ja//bAAloMWQc1ufxN4SDGV0U=;
 b=DKQWEfiuhJxlXiiRuELLRNdooSn+qX+bML836nI+O9t9m+BrUx0j/cDKdSe4a7gbyTOKuxDgt+P1kr9IfLWtL6c2LpdxZNZNPi7yxKQNb9dn2wRrdj/U0k6Pt5dHHptXlBLPu41dFLWTe0ESWkpYeLwsXP4oNJh6N8bjINTNkB5/+mVnh1R9wjUta7GdeMSadDMTNAy171f54Cs032h3ZeNmxahs6lq9OCW0W9bd81nJeVUgXqKArmAJkgpKy532Rlr5GTAL9cx7U5POyiVp9i7ZtG2w+eXfutPAU4xxNNa2mcOR0W24p6GvPUMn+lnHhnkNOxEj39WzpGQyrnOzrQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SA1PR12MB8598.namprd12.prod.outlook.com (2603:10b6:806:253::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.40; Thu, 12 Jun
 2025 14:03:17 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8835.018; Thu, 12 Jun 2025
 14:03:17 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Thu, 12 Jun 2025 23:01:42 +0900
Subject: [PATCH v5 14/23] gpu: nova-core: register sysmem flush page
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250612-nova-frts-v5-14-14ba7eaf166b@nvidia.com>
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
X-ClientProxiedBy: TYAPR01CA0079.jpnprd01.prod.outlook.com
 (2603:1096:404:2c::19) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SA1PR12MB8598:EE_
X-MS-Office365-Filtering-Correlation-Id: 260cc5a8-29fc-4118-1492-08dda9b9e191
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|10070799003|376014|7416014|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?c25FSTJPN2o1bUpWVVhHc2ZJblJYSHozOXo2bHpYeVFqSW1hZmVYQXZRYWZ3?=
 =?utf-8?B?bW9zRXJjL2M1Q21aa1I0Wng2OUZoemR2eCtBZzQ5THRyMDcrdER5NkRlRDhE?=
 =?utf-8?B?clpxMDJKKzNJcVpZRTJWWms2bnIwb0F2NXZwRUM5bWV3QzQvLzBuYTNuaEkw?=
 =?utf-8?B?SkRaSlg5NWxlWDQwdU04MlV5OVNRaVR5eStqeS9SSVFybFQrekwrdUVRamhk?=
 =?utf-8?B?cmxtS2Q0dDZhdXJJdVdZb2F5bDVUaGxkWTNoSGJYUWhTTUhXM2tZakVjbXFt?=
 =?utf-8?B?R05WYi8rRFlGK2xVV3VJOXZGTENYSWkzcTVsa3d0TzVkS2NoVlZFNm5uVjk4?=
 =?utf-8?B?b0hYSVl4V1JNN1dnbFJZZnlWR0dWTzlkOXova0NJMnZoZldQRlFyNmttTTM4?=
 =?utf-8?B?eHN0aVNYeWNCaHFmaEE1ZEdCMHF0K2xxQjFqcW1oNWNvL0FlcDJrV2QrdXdO?=
 =?utf-8?B?Z3ZqbDJ4Q0tXbnh0VndLaXhQeDVvSWU3NGxBNm1sbmVrR3NNRmpXSXZiQ1F5?=
 =?utf-8?B?amNQUXpEM1NaTENObkZ3ck5vRXRGakFzQVlnTkxIQmp0VEp3enU3R2w1bVEv?=
 =?utf-8?B?MGxrajIrdzZjUFFMTDVrZnFxaWZITmdBbzdvY24vd2s2Wk1ZTVZqTnlHeTNJ?=
 =?utf-8?B?Tk8yK3R6MTdwRzh5K2NiTVhqdEtGWVNjMzd1VnU3MHJ1YktqYTEvY0s3UWxw?=
 =?utf-8?B?d1A4SzBZU2JLeU9jeDBOWERkMUlQMHhWeHpZSXNSb2hsallZMzBPVGdXbUxS?=
 =?utf-8?B?WDR5UUZoYlVTNkd0MkZRMlNaZHdKQ1I4WlFpL29KOE8xYStLNExaNktseHdz?=
 =?utf-8?B?SkFYdGVPVFpsSklMdE5UdzlnbGhpMVRxME1ON3o3WUNTaVdKemVPRDYvQ0FP?=
 =?utf-8?B?WFltTnFNcmFTM1BuWnR6aVd3bWpKSEc3VUxtbkRoV0Y2ck05dnRQQ2NLOElt?=
 =?utf-8?B?R3VqUnh6NjRCbGhVTFRQenE4ejZXaHF6N2FlaEM5V21FZ0MwWTBJRWZFaVVM?=
 =?utf-8?B?VFlKYkdhZVU4N0ZsVUdiSXNsQzVOZ3lnbksxbjU0T052S2FyMllhMnZya2Fl?=
 =?utf-8?B?cnF0NHdNdGJkUmdMdk9aZ1RYZEFCZUhmblhUTkI4eW9YM3QzZkZqaGlzWVNF?=
 =?utf-8?B?RmxvKzluRVJIcnMwWGJZVTdtVnRBS21NRUwveVp0cmFKUjJSdURXNkNhZElG?=
 =?utf-8?B?NVBLSVhFWmhBd09FbngraVdvTXdwVytYTGdKeXJEQ2VOWE5iZDBhZy9xcStH?=
 =?utf-8?B?LzdxMnNNUll0SUZpa084VFhZSDlBUVBhQWlnK1lRWFJMY3BZaWZ5UGhaZExC?=
 =?utf-8?B?L3NJNzlDR3pRT3hoajdyQWNvQS8zQ1pFVDRGQktKbHh1MkFKbHlXa1hTL3N2?=
 =?utf-8?B?UVFqM0hKaW9nYTk5aGJRanB2YzBSNVh3SHY0KzArMmRZZFJpSzUvRVVPNThS?=
 =?utf-8?B?VWN0VG80bmtYTUI3ejVKc0hiRnRJVmtQc1p0K1hDWEwzU0NLaS9GYm8xRjhK?=
 =?utf-8?B?Sm1hVXFQeGM0U3g4OTFFYmN3RXMzQXIwRkx0a1U5dXMvN1VsMmZiN3Z1MWlh?=
 =?utf-8?B?M080V01SRGdKeEpJVDRrRHIyaERUWHJZaCtQRnl1enZubWRuNzAxV0FxcnRJ?=
 =?utf-8?B?bnc1ajBlTXJOMk1VaHFaZFN1VldKanIzaktRZnkvZzVDNWU2ZERLek9DVWM4?=
 =?utf-8?B?bXdqT2c4bjFmVUJoR0NwOFVBbHl3RDd6RCtNdlVuZG1ud2pIVHorUmV0NWR5?=
 =?utf-8?B?bWRoY2ZucU85bkZXL1hLUGhiZUluSkZMMm1LdTJYNjg2QW5rV00xUkg1Qkkw?=
 =?utf-8?B?cHhHM0t0am4yWFFVaUtKTmp3QXhEQ0JUVHBWSFkxeFoxaDlMNnBtOE9vZU0w?=
 =?utf-8?B?b0ZPUDNwTytZQjk1SGtXYTlXOGd2d1M3WmlseUVxSDJTNTBlOUxodkJtSUFm?=
 =?utf-8?B?Umx1R1ZuSmZqdkIwZlNZQ1piTnQ0WGhac05GaEE3UVBzQloyVG94MlBYaFdK?=
 =?utf-8?B?UC9yZlhOR0p3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(10070799003)(376014)(7416014)(1800799024)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dll0ZmhGRFFMaTdabUJTRDBPNkZsMVNuUnhhMnpaSGhKZmh5YStoM282dEhJ?=
 =?utf-8?B?M2xPa0NJb0I1UGQyMW5OcTNabzRvY2VNK0JIek5xTm1LZzN0Z1FZV3FuS3Rk?=
 =?utf-8?B?ekx3Wkh2ZUtYNVUzSHRJNkFUUGIyMERDQ2JLenp3T3pJWEQrSk9sSnV6c3RB?=
 =?utf-8?B?eUR1K0d0WWc0Rmg3RjM0a3hBMlBWbXlobFpWNHh4ajJtMWJ2YWR5WkRLRWUw?=
 =?utf-8?B?TnhsUTNaTWkrY2lxdEE3UmhVOFVVVlBSY3JWL05oMlVIbXFNd0t2Q0sra2Fr?=
 =?utf-8?B?Wkl2Zy9uTXQ2cjVRdUtaejFSVm1aYlE1ejI1a0dOc1NMekw3WVg0RVVpUEFI?=
 =?utf-8?B?NjNTUFQrUkE3eUxhcW5BampKZnZkVzEyN25qR0l6RTkzbTlXUmMzbFhqY3do?=
 =?utf-8?B?WDBoSTZlV3dZM2loc1dEc1hMT1N2SEdpcGc4Nlh2VWN0WWxVVTZ3bm5lczdj?=
 =?utf-8?B?UWNDaFJoUEM5M1lyak9GdEUxVGsyeHZwY0NaUzB0Zm9zcFJQM2Fqcy9GMGdx?=
 =?utf-8?B?SW0wZml2SVhlbVB5dE1BKzZHMkhKL01GdTkvZ3NhN2Fuci94ako1bW5pZEk2?=
 =?utf-8?B?T05lRW5pM1lhaG5pdUx2cFhmMVd2aHRnODk5UEVRd3NQOXdQcUc3OXBKZzZT?=
 =?utf-8?B?U3RwYWVveDYrSmpRTmdaTmdUZHY0ajV4R0s2YmNJRVlxdHEwR3cweGxqUm9Q?=
 =?utf-8?B?T0xySFl0WXZYaTJrTXdTV3I4ZG5TOGhZR1ZwRDJmT25NdXllalV5SHZvaTZY?=
 =?utf-8?B?ZXpOTFc5YUVpNlRxUVMwVFY2Y1NkRjFXRklVSGh1eDNFY2o4MGFQSFdBbXFy?=
 =?utf-8?B?dHN4NmhtYlIvYVNWR0pjNlpSSXc2L25JbEwzWitYcUEzWkg0K0d3OGlXK0hw?=
 =?utf-8?B?a0o3QlhtWndZOUdPYTROSHJQM0FiOVJVdUdxOVZIRmZpN0M0N1lobXRwOVdQ?=
 =?utf-8?B?WHlPK3JVV2ZKYVpkVUg4VU83QTNBM1FGVXRkRkdmWjQ0ZTRNQjZuTlRBRDNL?=
 =?utf-8?B?NHJKVmE4NmF4cCtTaXRNSy9tWld3VHB4SHVsWTFscmFCSWJhTUd0c201dXVY?=
 =?utf-8?B?V3B5NDVpK0YrMmV5ZmZGc1ZlL3RZcFVnRnhLWldlRzVqaGNueWtKWmd5UE12?=
 =?utf-8?B?eDNjZVdsREpOazMxK2JBRENDL3ZYN2lOdCtoa3FNU2VHKzFzbkpBZEZNT1Jk?=
 =?utf-8?B?QTRXQ1M0eVlHT0c0bzZiamRSN0VlMjBvRW1GdzN6ZUJiZ3MwL05TNis4TER0?=
 =?utf-8?B?bFBuZjg4czF5SXB3YlBoSmcxUldSTlRGVCtQL2dPSG4wM2Z6Q0w4N2t2Wi9y?=
 =?utf-8?B?YlB4aEc0VlkrdlYzY01PTmFTUTduN0pBb2JuNXNlVk9SM05PZk9PZ0NQWnVP?=
 =?utf-8?B?K3lNNHZ3ZjE3d2MxbVlpN0JSNVltSSsyajI4NENhb2JQU2g5Q2JYM3lSUmE3?=
 =?utf-8?B?ZkpuUnhiWklVcm9NNXc4ZlZOT01xMitWbFJCa3FyMDd0UkxLazlUOWxIN1hp?=
 =?utf-8?B?N20wQjhPeDhzdzF2WDlBY3ZocDVlTTRucVB6d0VOek9sK2IwUHMrckN1Y3NM?=
 =?utf-8?B?c2l4RDdDajJpdlZrUXBCK0lFUUFqM1U1TTA3RGU1dDk3dDRNY29Geno0bTdG?=
 =?utf-8?B?U1RhM1R3QU1nM24va2doS2UydE1FeXRocnZCait4UXR3UlkyektEZUpScEho?=
 =?utf-8?B?Szk1OTVBOW9CcVhZSmN2dWdkVXp6T0QxNnlSRFdSSWY3WHMrbzB5UFZ3VzQw?=
 =?utf-8?B?K0t0c1lHQVkzWlhZZjE5Vi80K1hZUDMyNi93c2ZKWlJiUXRkRTIxeWpvMjhO?=
 =?utf-8?B?Z042Mit6V0tTK1NZRUE3azVFTEo5OUtrQzkwTEdXUDcwQjdmbWZuUFlRTUhT?=
 =?utf-8?B?a09EU3lJd2JmTTUvZHhsYmhvLzZybHE0WGI5TVU1UmVTZDgySGxjSGl4Q3pm?=
 =?utf-8?B?Mm1kcGRNRm95cEMvclBDaExINFNQemNReFgwY1BqVER6R1BKR1c4TDJwT3o1?=
 =?utf-8?B?TzRNZ3pxT25seFJmQzl4Zk9jTTVvTjQzYXZ4a2RLbFJxWFo1MnpPR1djQjk3?=
 =?utf-8?B?dmdVNU1DNnZKZHBKOXFrYWUyYmlBNWZxV3BXNzNaYVpVcnhhMTVKMVMrbzd1?=
 =?utf-8?B?NGlnSXB3WFNyYzRsS3lmeHpJcVpOYlZJT0pOV2pTTDhzais0Q3NhdnNva1R4?=
 =?utf-8?Q?Jl1Cl+H5o8plRJgHpa8xI/lXeLjYfSEH+0TKGsmvwTdH?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 260cc5a8-29fc-4118-1492-08dda9b9e191
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2025 14:03:17.6191 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oUxda9gL9l7qywvXTuYwyWhiElJz0ltUAjPC6HI8O/rA4nxywp0qXFo2oh1QK2Zb83ekfDEmmaKRzFpUvcVEHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8598
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

Reserve a page of system memory so sysmembar can perform a read on it if
a system write occurred since the last flush. Do this early as it can be
required to e.g. reset the GPU falcons.

Chipsets capabilities differ in that respect, so this commit also
introduces the FB HAL.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/fb.rs           | 66 +++++++++++++++++++++++++++++++++++
 drivers/gpu/nova-core/fb/hal.rs       | 31 ++++++++++++++++
 drivers/gpu/nova-core/fb/hal/ga100.rs | 45 ++++++++++++++++++++++++
 drivers/gpu/nova-core/fb/hal/tu102.rs | 42 ++++++++++++++++++++++
 drivers/gpu/nova-core/gpu.rs          | 25 +++++++++++--
 drivers/gpu/nova-core/nova_core.rs    |  1 +
 drivers/gpu/nova-core/regs.rs         | 10 ++++++
 7 files changed, 218 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/nova-core/fb.rs b/drivers/gpu/nova-core/fb.rs
new file mode 100644
index 0000000000000000000000000000000000000000..308cd76edfee5a2e8a4cd979c20da2ce51cb16a5
--- /dev/null
+++ b/drivers/gpu/nova-core/fb.rs
@@ -0,0 +1,66 @@
+// SPDX-License-Identifier: GPL-2.0
+
+use kernel::prelude::*;
+use kernel::types::ARef;
+use kernel::{dev_warn, device};
+
+use crate::dma::DmaObject;
+use crate::driver::Bar0;
+use crate::gpu::Chipset;
+
+mod hal;
+
+/// Type holding the sysmem flush memory page, a page of memory to be written into the
+/// `NV_PFB_NISO_FLUSH_SYSMEM_ADDR*` registers and used to maintain memory coherency.
+///
+/// Users are responsible for manually calling [`Self::unregister`] before dropping this object, or
+/// the page might remain in use even after it has been freed.
+pub(crate) struct SysmemFlush {
+    /// Chipset we are operating on.
+    chipset: Chipset,
+    device: ARef<device::Device>,
+    /// Keep the page alive as long as we need it.
+    page: DmaObject,
+}
+
+impl SysmemFlush {
+    /// Allocate a memory page and register it as the sysmem flush page.
+    pub(crate) fn register(
+        dev: &device::Device<device::Bound>,
+        bar: &Bar0,
+        chipset: Chipset,
+    ) -> Result<Self> {
+        let page = DmaObject::new(dev, kernel::bindings::PAGE_SIZE)?;
+
+        hal::fb_hal(chipset).write_sysmem_flush_page(bar, page.dma_handle())?;
+
+        Ok(Self {
+            chipset,
+            device: dev.into(),
+            page,
+        })
+    }
+
+    /// Unregister the managed sysmem flush page.
+    ///
+    /// Users must make sure to call this method before dropping the object.
+    pub(crate) fn unregister(self, bar: &Bar0) {
+        let hal = hal::fb_hal(self.chipset);
+
+        if hal.read_sysmem_flush_page(bar) == self.page.dma_handle() {
+            let _ = hal.write_sysmem_flush_page(bar, 0).inspect_err(|e| {
+                dev_warn!(
+                    &self.device,
+                    "failed to unregister sysmem flush page: {:?}",
+                    e
+                )
+            });
+        } else {
+            // Another page has been registered after us for some reason - warn as this is a bug.
+            dev_warn!(
+                &self.device,
+                "attempt to unregister a sysmem flush page that is not active\n"
+            );
+        }
+    }
+}
diff --git a/drivers/gpu/nova-core/fb/hal.rs b/drivers/gpu/nova-core/fb/hal.rs
new file mode 100644
index 0000000000000000000000000000000000000000..23eab57eec9f524e066d3324eb7f5f2bf78481d2
--- /dev/null
+++ b/drivers/gpu/nova-core/fb/hal.rs
@@ -0,0 +1,31 @@
+// SPDX-License-Identifier: GPL-2.0
+
+use kernel::prelude::*;
+
+use crate::driver::Bar0;
+use crate::gpu::Chipset;
+
+mod ga100;
+mod tu102;
+
+pub(crate) trait FbHal {
+    /// Returns the address of the currently-registered sysmem flush page.
+    fn read_sysmem_flush_page(&self, bar: &Bar0) -> u64;
+
+    /// Register `addr` as the address of the sysmem flush page.
+    ///
+    /// This might fail if the address is too large for the receiving register.
+    fn write_sysmem_flush_page(&self, bar: &Bar0, addr: u64) -> Result;
+}
+
+/// Returns the HAL corresponding to `chipset`.
+pub(super) fn fb_hal(chipset: Chipset) -> &'static dyn FbHal {
+    use Chipset::*;
+
+    match chipset {
+        TU102 | TU104 | TU106 | TU117 | TU116 => tu102::TU102_HAL,
+        GA100 | GA102 | GA103 | GA104 | GA106 | GA107 | AD102 | AD103 | AD104 | AD106 | AD107 => {
+            ga100::GA100_HAL
+        }
+    }
+}
diff --git a/drivers/gpu/nova-core/fb/hal/ga100.rs b/drivers/gpu/nova-core/fb/hal/ga100.rs
new file mode 100644
index 0000000000000000000000000000000000000000..7c10436c1c590d9b767c399b69370697fdf8d239
--- /dev/null
+++ b/drivers/gpu/nova-core/fb/hal/ga100.rs
@@ -0,0 +1,45 @@
+// SPDX-License-Identifier: GPL-2.0
+
+struct Ga100;
+
+use kernel::prelude::*;
+
+use crate::driver::Bar0;
+use crate::fb::hal::FbHal;
+use crate::regs;
+
+use super::tu102::FLUSH_SYSMEM_ADDR_SHIFT;
+
+pub(super) fn read_sysmem_flush_page_ga100(bar: &Bar0) -> u64 {
+    (regs::NV_PFB_NISO_FLUSH_SYSMEM_ADDR::read(bar).adr_39_08() as u64) << FLUSH_SYSMEM_ADDR_SHIFT
+        | (regs::NV_PFB_NISO_FLUSH_SYSMEM_ADDR_HI::read(bar).adr_63_40() as u64)
+            << FLUSH_SYSMEM_ADDR_SHIFT_HI
+}
+
+pub(super) fn write_sysmem_flush_page_ga100(bar: &Bar0, addr: u64) {
+    regs::NV_PFB_NISO_FLUSH_SYSMEM_ADDR_HI::default()
+        .set_adr_63_40((addr >> FLUSH_SYSMEM_ADDR_SHIFT_HI) as u32)
+        .write(bar);
+    regs::NV_PFB_NISO_FLUSH_SYSMEM_ADDR::default()
+        .set_adr_39_08((addr >> FLUSH_SYSMEM_ADDR_SHIFT) as u32)
+        .write(bar);
+}
+
+/// Shift applied to the sysmem address before it is written into
+/// `NV_PFB_NISO_FLUSH_SYSMEM_ADDR_HI`,
+const FLUSH_SYSMEM_ADDR_SHIFT_HI: u32 = 40;
+
+impl FbHal for Ga100 {
+    fn read_sysmem_flush_page(&self, bar: &Bar0) -> u64 {
+        read_sysmem_flush_page_ga100(bar)
+    }
+
+    fn write_sysmem_flush_page(&self, bar: &Bar0, addr: u64) -> Result {
+        write_sysmem_flush_page_ga100(bar, addr);
+
+        Ok(())
+    }
+}
+
+const GA100: Ga100 = Ga100;
+pub(super) const GA100_HAL: &dyn FbHal = &GA100;
diff --git a/drivers/gpu/nova-core/fb/hal/tu102.rs b/drivers/gpu/nova-core/fb/hal/tu102.rs
new file mode 100644
index 0000000000000000000000000000000000000000..048859f9fd9d6cfb630da0a8c3513becf3ab62d6
--- /dev/null
+++ b/drivers/gpu/nova-core/fb/hal/tu102.rs
@@ -0,0 +1,42 @@
+// SPDX-License-Identifier: GPL-2.0
+
+use crate::driver::Bar0;
+use crate::fb::hal::FbHal;
+use crate::regs;
+use kernel::prelude::*;
+
+/// Shift applied to the sysmem address before it is written into `NV_PFB_NISO_FLUSH_SYSMEM_ADDR`,
+/// to be used by HALs.
+pub(super) const FLUSH_SYSMEM_ADDR_SHIFT: u32 = 8;
+
+pub(super) fn read_sysmem_flush_page_gm107(bar: &Bar0) -> u64 {
+    (regs::NV_PFB_NISO_FLUSH_SYSMEM_ADDR::read(bar).adr_39_08() as u64) << FLUSH_SYSMEM_ADDR_SHIFT
+}
+
+pub(super) fn write_sysmem_flush_page_gm107(bar: &Bar0, addr: u64) -> Result {
+    // Check that the address doesn't overflow the receiving 32-bit register.
+    if addr >> (u32::BITS + FLUSH_SYSMEM_ADDR_SHIFT) == 0 {
+        regs::NV_PFB_NISO_FLUSH_SYSMEM_ADDR::default()
+            .set_adr_39_08((addr >> FLUSH_SYSMEM_ADDR_SHIFT) as u32)
+            .write(bar);
+
+        Ok(())
+    } else {
+        Err(EINVAL)
+    }
+}
+
+struct Tu102;
+
+impl FbHal for Tu102 {
+    fn read_sysmem_flush_page(&self, bar: &Bar0) -> u64 {
+        read_sysmem_flush_page_gm107(bar)
+    }
+
+    fn write_sysmem_flush_page(&self, bar: &Bar0, addr: u64) -> Result {
+        write_sysmem_flush_page_gm107(bar, addr)
+    }
+}
+
+const TU102: Tu102 = Tu102;
+pub(super) const TU102_HAL: &dyn FbHal = &TU102;
diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index e44ff6fa07147c6dd1515c2c6c0df927a2257c85..768579dfdfc7e9e61c613202030d2c7ee6054e2a 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -3,6 +3,7 @@
 use kernel::{device, devres::Devres, error::code::*, pci, prelude::*};
 
 use crate::driver::Bar0;
+use crate::fb::SysmemFlush;
 use crate::firmware::{Firmware, FIRMWARE_VERSION};
 use crate::gfw;
 use crate::regs;
@@ -158,12 +159,28 @@ fn new(bar: &Bar0) -> Result<Spec> {
 }
 
 /// Structure holding the resources required to operate the GPU.
-#[pin_data]
+#[pin_data(PinnedDrop)]
 pub(crate) struct Gpu {
     spec: Spec,
     /// MMIO mapping of PCI BAR 0
     bar: Devres<Bar0>,
     fw: Firmware,
+    /// System memory page required for flushing all pending GPU-side memory writes done through
+    /// PCIE into system memory.
+    ///
+    /// We use an `Option` so we can take the object during `drop`. It is not accessed otherwise.
+    sysmem_flush: Option<SysmemFlush>,
+}
+
+#[pinned_drop]
+impl PinnedDrop for Gpu {
+    fn drop(mut self: Pin<&mut Self>) {
+        // Unregister the sysmem flush page before we release it.
+        let _ = self
+            .sysmem_flush
+            .take()
+            .map(|sysmem_flush| self.bar.try_access_with(|b| sysmem_flush.unregister(b)));
+    }
 }
 
 impl Gpu {
@@ -187,10 +204,14 @@ pub(crate) fn new(
         gfw::wait_gfw_boot_completion(bar)
             .inspect_err(|_| dev_err!(pdev.as_ref(), "GFW boot did not complete"))?;
 
+        // System memory page required for sysmembar to properly flush into system memory.
+        let sysmem_flush = SysmemFlush::register(pdev.as_ref(), bar, spec.chipset)?;
+
         Ok(pin_init!(Self {
             spec,
             bar: devres_bar,
-            fw
+            fw,
+            sysmem_flush: Some(sysmem_flush),
         }))
     }
 }
diff --git a/drivers/gpu/nova-core/nova_core.rs b/drivers/gpu/nova-core/nova_core.rs
index 121fe5c11044a192212d0a64353b7acad58c796a..8ac04b8586e7314528e081464ed73ee615001e9b 100644
--- a/drivers/gpu/nova-core/nova_core.rs
+++ b/drivers/gpu/nova-core/nova_core.rs
@@ -4,6 +4,7 @@
 
 mod dma;
 mod driver;
+mod fb;
 mod firmware;
 mod gfw;
 mod gpu;
diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
index cba442da51181971f209b338249307c11ac481e3..b599e7ddad57ed8defe0324056571ba46b926cf6 100644
--- a/drivers/gpu/nova-core/regs.rs
+++ b/drivers/gpu/nova-core/regs.rs
@@ -38,6 +38,16 @@ pub(crate) fn chipset(self) -> Result<Chipset> {
     }
 }
 
+/* PFB */
+
+register!(NV_PFB_NISO_FLUSH_SYSMEM_ADDR @ 0x00100c10 {
+    31:0    adr_39_08 as u32;
+});
+
+register!(NV_PFB_NISO_FLUSH_SYSMEM_ADDR_HI @ 0x00100c40 {
+    23:0    adr_63_40 as u32;
+});
+
 /* PGC6 */
 
 register!(NV_PGC6_AON_SECURE_SCRATCH_GROUP_05_PRIV_LEVEL_MASK @ 0x00118128 {

-- 
2.49.0

