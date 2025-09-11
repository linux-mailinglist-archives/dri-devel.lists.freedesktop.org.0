Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C94CB52F35
	for <lists+dri-devel@lfdr.de>; Thu, 11 Sep 2025 13:05:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFAF010EA96;
	Thu, 11 Sep 2025 11:05:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="YVwP9d01";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2040.outbound.protection.outlook.com [40.107.95.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C273F10EA91;
 Thu, 11 Sep 2025 11:05:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pVO/lpXYMgLbYT7gy97Tgy+Gx55EdNLFyO/MnB5+aLScWdTrOC+i7BLswOTq5DD5PXosLaZGgbc58qj4+zQVxnVpnxgTkQk7AnSEe8dCWg6qf6MkW0XO80F851YUYCLkDl/T0VAJpP+kOJefiY7x3sTBoaoa7e8cv+dB/Rrr4OC8N6EDWuM4oGeo+Jg5mMMgMjfUu1NfxE1u9hbmhhJnLKsM8C+/G9FDTlnE31Fk3ki34541pbgH0qZzIMc6peqrVXdyfeY6XzU07txCpUlnMF6WLY8T3Fvjr6irIksUHyn+T++rkkaH23fo3LsNetWWl5NKTmjTbpCGp8fjHkVIgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/RHs4RuOFY1TLqnYWVXXVNz9jvCNuGUgosjbjlXt7QM=;
 b=lq3MZ79D5L5/b/4/XkEPjTTP4bmkQuJrpaee9wbwpW//l76LSs8B/ayZSAyyzSar/BnU90YB1ys9659OINnwJ6cFgfYM26tzv1ezPIThybNOYy4G/g+/VHVzbnTr+cdRTMIgjNBg8fYSMYQIOjaWE/TGXYCcWidynN60+8nFDuV3IFcC0Ykm88nqxpUoFIhQzBvBmYUSlHCCmH5PBamNeCrE7mwe0oP2SxXLQ117nNljKeb/4glzum2soaK26lLreYjBKMZehuX1B8a9TZEgslpRS4JAgNOfLuX6/xTzCbv8Drz69q8c2pXi4rNMQawLHF7HlBWM4u+WNpBQ/eyzfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/RHs4RuOFY1TLqnYWVXXVNz9jvCNuGUgosjbjlXt7QM=;
 b=YVwP9d01Me2szgLSyfE1qyDtSutekVWk0GjyaHV9dLOvE/hC/SP5LjSuZnb6CqhHqYCMGy4kayj2qZFOGqW5vbafbDhTtiaGVaxbRxunla+GSviGBqoEwlvs5yUAYegUpuA0UT+wq2PdNQMSY7Gaj+Gd5YakoOB+QHlAiLkTCUY7YQGkKA7Na+Kf0IXAeXezfxcBBx3xN+8UMXM7vWY7U3Xj9cjO8DfU5XSHTDymPgz1TywbfUSvY8zqsBQzOF42RYTAR6lqxD8EwxDa4C3mOXKS9/3JLlwlU0mZ1tz4FQgn0EgoCSMUi7jnwUzsUePYfo+i77XHqbfqQqKNurgggA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CH8PR12MB9840.namprd12.prod.outlook.com (2603:10b6:610:271::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Thu, 11 Sep
 2025 11:05:11 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9094.021; Thu, 11 Sep 2025
 11:05:11 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Thu, 11 Sep 2025 20:04:36 +0900
Subject: [PATCH v5 11/12] gpu: nova-core: Add base files for r570.144
 firmware bindings
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250911-nova_firmware-v5-11-5a8a33bddca1@nvidia.com>
References: <20250911-nova_firmware-v5-0-5a8a33bddca1@nvidia.com>
In-Reply-To: <20250911-nova_firmware-v5-0-5a8a33bddca1@nvidia.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: TYCP286CA0083.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b3::11) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CH8PR12MB9840:EE_
X-MS-Office365-Filtering-Correlation-Id: 577b23fd-066e-43ca-bafd-08ddf123137a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|366016|1800799024|7416014|376014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZzJHRlBqZGg5OWZJQ1lBV2tadWptTUpLTXAzdCtXcmZpck5FUVN2cUR4ejJB?=
 =?utf-8?B?ZVdjRlVKU3Z2S1RCZk4yc21pczIrRzhscHJtTC9EdUtiYVdKT2d5cGZMRFgr?=
 =?utf-8?B?VzhEMUNmVXc5ZDQ2bmFJVzZiTWswMUlKMm5JSW5IQTJvbkNTejRkYzY5SVNN?=
 =?utf-8?B?ZGZCTnkwZlhyOXBVTHZ5YU5taDNEQ0NSN2plY242dXprL0dGUHdIMGVtOWhn?=
 =?utf-8?B?YzAyZDArbWhscktqbENkQkg1aFJHMEZUQkpRZGZGVllLWHZqSlJpVisrVmdl?=
 =?utf-8?B?SXJpN3lTd1Z3SzdLMGtjTys2TDZ2TjZBVHJJS2x6SmJtMlM3OTBtWGJxL2hU?=
 =?utf-8?B?SjloUUlrK3RnYXQ4RmNadEMrSXNDUDZ2YWlXS3FBZ20zS1p2TlEzRHhxb0Fq?=
 =?utf-8?B?aURKSUVKYjY3bnkzR2hwK0VGWGVvV29jZGFGV2xiTXZoU1hkUWxZWTFlMUlr?=
 =?utf-8?B?VFl6MU9oTnMzNkFORHhvZWI3UTZaSWVwRlZ1S3QvRU5HS3QzYXYrUmgzRlBO?=
 =?utf-8?B?VldFdzFTQ3NnOWNSVmwyckIycmQwZ0ErZ1V5VFJUNGwvcmdwVEJ4c0VScUlt?=
 =?utf-8?B?NUt6YmF6THhuRnFKOTZLcEY5VVBKdGtDdjFuSUpGZXhqQVZQaysvMmZHZ0hn?=
 =?utf-8?B?OHNzUHBOSjlqdVRIQ3MxN3ZWTlFWaWNJcXMvMDhTb2JmbHYzbERxTjJlcWNj?=
 =?utf-8?B?cFdqNHErdlh4YnV6Y281YmJMeGE0Y214cGhCQVlKWGZhOVN2N2pJN1ExN2E5?=
 =?utf-8?B?OHRROVgrSkpYeFVzSUc0ZjlhRW1IMUZFRmpQRThkZ3NUOWpja1ZkL2JCVHVM?=
 =?utf-8?B?MitFTkhEazM3enNCQ0N3aE9pMXpOT04rUmRyMHVXblJkb01wQVRrL2VhaktK?=
 =?utf-8?B?QTBwdUFCeUZuQVFTQVl0TGFFRGZGTjBhSGd3MDNrbFI5dFpsZ2JwU2JIbjR1?=
 =?utf-8?B?S0FnbXY0M1FkM1lCZXoyejB2TEt4T0lhYkRGMGtmbHJWU2NCT3hEaGdQTENl?=
 =?utf-8?B?clpjVVpPNGhRQnFRaUVSbGRVeUJ1TmpoYVU1LzZPeUhNV1RhbnZsemNPUnMx?=
 =?utf-8?B?S3lUWUVhUU5adG81aGs1N1NvNldpOVByRElWSWk4SXNXV09PbmhpMXlaRTdi?=
 =?utf-8?B?VWpWOXhzYWk3Qk95aVdnaDJHT3lTSjhPR3pLaGhldHYvbGRkS0NSeDl4T3NH?=
 =?utf-8?B?Qnl4SWQvWUFmYlpDQ1hHakpYRW5NWnJrTXhHRzdMV1h1Z3h6S1VOT05aMm1h?=
 =?utf-8?B?ZHkzTkN3cm0vSmZuUGJaYkFzY1NrWUl1amJiZWkyMFRNdzYybWV1MWtIRGlk?=
 =?utf-8?B?MkY5aFNrSTNaT053T2ZOR1E2ZlQ5SE00alYrQ01pRUlVajUyNVJJM051eWpm?=
 =?utf-8?B?c3hoMEJ2TjdRZ0s3VWJueVZ2bktUbFlLT3BYSmpMYXlHNmtwRHRXTkFkN2R2?=
 =?utf-8?B?cUsybjVmUklNejhzdHdlK1NzYmNOaFJZRWFsLyswNk5ZYjZUZUdlL2kwSEl2?=
 =?utf-8?B?NWZ0OFdEcjM2N1VZVVhHRVRSYXZyR2oxbzZURTgzRitNYzBXSG93RHJSK0xV?=
 =?utf-8?B?UWUvbHlRYkpMd0gvQk81UytMQ1UwbUFHYWhBSE9NRmpQVzdsSmNRTHN4QTJ5?=
 =?utf-8?B?ZmI0c0UzRllFNVV1TVJTYU5CemRLYnVVMWEzM1FCNkZhdnVBenB5WHdFYkhQ?=
 =?utf-8?B?ZVlabi9aQ2ZhbmJuSWFicys3VWFLZ1YySjFrOWtpTDNldS9XRzNlbnd2Umxn?=
 =?utf-8?B?dG96TXJiVENDNU1YNGhpeDd2RmZkZ3pzb0hLQWJNMFZBYlg0V3JPa1l5OEdt?=
 =?utf-8?B?R0c2dXUyWlZWY0ZVaEhoQmYyaGFod1k3NW1DTGFJdUFibkd6TGdWQm1UT1N0?=
 =?utf-8?B?eHkvckpnTlU1U3kzcE5yOTVqRm9VN3VqZnpZKzN3SmhvOWxOMllKdXZNMXor?=
 =?utf-8?B?UjN4MG1KM0U5NTJ6SDdvNWp2RHNwMkNrWDJCaEhxQVlGS1MrMUlPSTRQWTZK?=
 =?utf-8?B?N2t3QmlVQ2RnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(366016)(1800799024)(7416014)(376014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QndOZGFmUmpQb2grdUVpdUxrZVFmeFlsKzNhandhc1dQMTM5SXNodWN2cUJl?=
 =?utf-8?B?K3ZLam9nU0Qra2pEajh0WnJzVlpVWk9ieWxtL253b1F5RTlFNEpycEdjdWtk?=
 =?utf-8?B?OGt2d1B4ekE4VjFQcDRnR3FxYkE3b05mUWU0MWxOVFIwVEwvSm83YWJjdGdO?=
 =?utf-8?B?elFYWkxuSW1iejRvM1gybC9NSjI1S3FjNjlMKyt4ZkYyVWFhV0ZVNDJGVjdU?=
 =?utf-8?B?S3BWNEo5TStMTDg0TExzbGE1dCtRakZXNnJXL05rZU5DVEhOaWdneGsyMERr?=
 =?utf-8?B?N0JQamdoQ2JFYmlGRTVxTkM0d2hCWnRKTlFXOEoxNnV1WTM2ZzdlS09YeXQr?=
 =?utf-8?B?ZVFqUXpMeVNYUmlJOXFHTWE3WjhnMndwOEpCbDlDTzFoSVFIM2pjRHAwbHhE?=
 =?utf-8?B?NWRaRlYwZGc5bHRzNS8zUjMvZ2JLZ3hHZDBpaVdNbGdDVU9QbFQzM0d2T3Rp?=
 =?utf-8?B?WWEwWmpZT281NU1GakQ2MmNKS0s3MGhkbkljemtvRy9ucFRMSlkxSmlsMncz?=
 =?utf-8?B?RDhwVEVQaXN2dVBYS0taREY2SkRMMTVDYmNIMElMMktZaXIwajM3ZWtLRUNy?=
 =?utf-8?B?UEJYdzg1R1dnLytzckt5RlNjbGNSSUpIRHRNakFiNm42eWhlMXBjb1JVZVFT?=
 =?utf-8?B?cjRCcGNMSGpxTGc2bVBTaVcwdjRhcExCNGxxc1ZmSkcrN2xtVlQzWU9wTVBt?=
 =?utf-8?B?VDhQejVIem5jL1phYjJxVEZpNVRWYnJFU3JMMUxqcHlWM1pmWTdmK0pBZ0FL?=
 =?utf-8?B?ZGFobnVVRmJOc0RlMDZYRjJTR01OQUl4STNXcjBpeUdDeXFhZFJWdGV6b3Z6?=
 =?utf-8?B?YlRBVmx5WjhaZ01hd21zZTk1RGp5dlFLNWhEc0wxQks3NjlrVlFFRmJDNkUw?=
 =?utf-8?B?aEZYSHdpRk4xbkRWaHJwbTNta3NveUg2U0VPWVlNYkhka2hGOSs1N1dnTUxl?=
 =?utf-8?B?RjF2WVgvYzJmckxKWStPTkJPTTd1aE45RTA1c3M5ZWttL1BUWGg4SkdyWFhK?=
 =?utf-8?B?ZFgzY0h4WWtJTHUraXNXNGJDaUtpVzFsamhCSkd2aEc3aFd6M21qVjBuWDlW?=
 =?utf-8?B?S0cxZ1Rrem50TFVtQlRrZHk2MUpNaWxWeUJaajhWcjk3SUFVZGNqRXU3a3pp?=
 =?utf-8?B?YWdRUS91QmxmNlNmMGJZUksvMndOUjNUSEVhUGpXbXJNL0M1dnZaZDRrZDg5?=
 =?utf-8?B?RnVPWCtoYW1ZR2FqZ3ovTlFhbHlLZkphVjlSTkxOcndrMEE0ZEcxWTY3UC9Q?=
 =?utf-8?B?SmhGTUFwOW5VWWRHaVlsUlE2eXZ3T2U1MzZ1dkQ0eUxlNklDUXU4T0U3aFE2?=
 =?utf-8?B?YUxpcUppMDhFSXZ5R3h4eWdMaHc5RlI4UzJEVGI2VTI5NE1HNWRwQmpIYStt?=
 =?utf-8?B?RXprQmJuVEhJNmhKNy8remtKSlF0a01oWmkrOElwNnpTRGlGNDhyVEo5TnZm?=
 =?utf-8?B?Q3VCR01JUmhTR2xMOVQxMkgrd1hkZmdrWHNjSzRQT1Z4WnNuQ1h5c1NxMWQv?=
 =?utf-8?B?cUJOWm15aXJ0dkhPWW83VWNKZFl1aUI2RTVyM1VNNXorRmhjbXJWbWJpNGs2?=
 =?utf-8?B?cVVZWVdmZm50WnI3Tm9TdXhidG5lWlc3V0VrSG1CR3BFRHYxd3dTeVRtcTVG?=
 =?utf-8?B?RXhqS0dKNHd2S3duQnJsN1FEZmV3YnFzcjFickxTNFRVcHZzUm1tQWxwbTlM?=
 =?utf-8?B?V3Q3SmZJVGRTQldyb1lZTFRrZi9odm95Z3cyVXNRdXFYOERSNGlGNGRVZVFk?=
 =?utf-8?B?M0Q5RVRxZ092eTRwL0JKY0Z2ajRwbE9zUkQrb1Yzbk15NnRYVzMwNjRyYVor?=
 =?utf-8?B?NkZod2pSWVg0S2o4M1dwL1JlQXR0bGJZTm1WV2JueFlSSXhFWCtjdmoxc2VD?=
 =?utf-8?B?NHZkMWQ4U2tqRkZVOFl2ZGhIQ2cweXN0WEJYaHNlSnBSc1hLMmR1dEltVlcw?=
 =?utf-8?B?dGw4VGJLWkZ2MlNlRWVoQ21ZSFRoZjM3aW5zdHFkSHBic05BMkdTQmxldG5w?=
 =?utf-8?B?ejFLVmFsaHkxMm9zSUhXR29ZTXZURzVLUlQyNHJPOWdscTZlY2dsZHJYS3lG?=
 =?utf-8?B?RnRNSStFV3l3TGhXaUZyWEczQzZWbHlxd1F4cWZLSDVXc2VvV3diZWtIWk9x?=
 =?utf-8?B?TUFITm9uUmhFQzROdEJSbHczbHJPUGl6NVJCa1R5aUF4UWFUSVVoTDFrZXFT?=
 =?utf-8?Q?qoyFonugDUpsAJXBw4a+gj4wS09oHafK7MXFS+jO7z7f?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 577b23fd-066e-43ca-bafd-08ddf123137a
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2025 11:05:11.1392 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iO88ysEJ8WZAohxCq72TnVungqC2xjFm+6bzfkoqbIpeznHvna+2KCCa98SY2+87qxIUZxB9yDbeaZ7Hbq5NTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH8PR12MB9840
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

Interacting with the GSP currently requires using definitions from C
header files. Rust definitions for the types needed for Nova core will
be generated using the Rust bindgen tool. This patch adds the base
module to allow inclusion of the generated bindings. The generated
bindings themselves are added by subsequent patches when they are first
used.

Currently we only intend to support a single firmware version, 570.144,
with these bindings. Longer term we intend to move to a more stable GSP
interface that isn't tied to specific firmware versions.

Signed-off-by: Alistair Popple <apopple@nvidia.com>
Reviewed-by: John Hubbard <jhubbard@nvidia.com>
[acourbot@nvidia.com: adapt the bindings module comment a bit]
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/gsp.rs                      |  2 ++
 drivers/gpu/nova-core/gsp/fw.rs                   |  7 ++++++
 drivers/gpu/nova-core/gsp/fw/r570_144.rs          | 29 +++++++++++++++++++++++
 drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs |  1 +
 4 files changed, 39 insertions(+)

diff --git a/drivers/gpu/nova-core/gsp.rs b/drivers/gpu/nova-core/gsp.rs
index a0e7ec5f6c9c959d57540b3ebf4b782f2e002b08..6933848eb950e97238ab43c7b8f9e022ffe84eba 100644
--- a/drivers/gpu/nova-core/gsp.rs
+++ b/drivers/gpu/nova-core/gsp.rs
@@ -1,4 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 
+mod fw;
+
 pub(crate) const GSP_PAGE_SHIFT: usize = 12;
 pub(crate) const GSP_PAGE_SIZE: usize = 1 << GSP_PAGE_SHIFT;
diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp/fw.rs
new file mode 100644
index 0000000000000000000000000000000000000000..34226dd009824c1e44d0cb2e37b43434a364e433
--- /dev/null
+++ b/drivers/gpu/nova-core/gsp/fw.rs
@@ -0,0 +1,7 @@
+// SPDX-License-Identifier: GPL-2.0
+
+mod r570_144;
+
+// Alias to avoid repeating the version number with every use.
+#[expect(unused)]
+use r570_144 as bindings;
diff --git a/drivers/gpu/nova-core/gsp/fw/r570_144.rs b/drivers/gpu/nova-core/gsp/fw/r570_144.rs
new file mode 100644
index 0000000000000000000000000000000000000000..35cb0370a7c9b4604393931f9f3bf72ef4a794b4
--- /dev/null
+++ b/drivers/gpu/nova-core/gsp/fw/r570_144.rs
@@ -0,0 +1,29 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Firmware bindings.
+//!
+//! Imports the generated bindings by `bindgen`.
+//!
+//! This module may not be directly used. Please abstract or re-export the needed symbols in the
+//! parent module instead.
+
+#![cfg_attr(test, allow(deref_nullptr))]
+#![cfg_attr(test, allow(unaligned_references))]
+#![cfg_attr(test, allow(unsafe_op_in_unsafe_fn))]
+#![allow(
+    dead_code,
+    unused_imports,
+    clippy::all,
+    clippy::undocumented_unsafe_blocks,
+    clippy::ptr_as_ptr,
+    clippy::ref_as_ptr,
+    missing_docs,
+    non_camel_case_types,
+    non_upper_case_globals,
+    non_snake_case,
+    improper_ctypes,
+    unreachable_pub,
+    unsafe_op_in_unsafe_fn
+)]
+use kernel::ffi;
+include!("r570_144/bindings.rs");
diff --git a/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs b/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs
new file mode 100644
index 0000000000000000000000000000000000000000..cec5940325151e407aa90128a35cb683afd436d7
--- /dev/null
+++ b/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs
@@ -0,0 +1 @@
+// SPDX-License-Identifier: GPL-2.0

-- 
2.51.0

