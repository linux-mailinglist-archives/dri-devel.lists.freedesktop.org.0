Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50FA9A3855D
	for <lists+dri-devel@lfdr.de>; Mon, 17 Feb 2025 15:05:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75B3F10E488;
	Mon, 17 Feb 2025 14:05:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="n/zGG2sw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2089.outbound.protection.outlook.com [40.107.236.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23FDE10E4CC;
 Mon, 17 Feb 2025 14:05:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pH0HqmU77/bKFOEiP0Xaz/RmSxZhPr1X11NikqD4lBTSZNbbEOagDpaDdkD3XCNV5nnEvBP9hsfbYyW/nyBXle+qNCEx5ChwrC3PkhVZBauet1kvfLK3bFG+OLqwVMLjxM4BfZfJJCn3NK1yeOocs2Xe6VW9/rZvya1rLhwrXf4k9WL2kFd7/UGrr/tD0uGtThE1q8bp6w9Lx/GQ0gSxxOCKs7t1q12dF1659s6e2R1SzMSKpYwqM7nKs82SlU+oz6CgxtcGvkCVa/4ACw1JFGr4/PHONo5KSCYu2rNoDBoyHv5U/ATzUINig8YoPOGSBcMyPh068PUe446RtPoWNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WdBRs2AA2V0j6HXXiO7Ggy7uRBITJWic5eW1ClXT9Ys=;
 b=Mi8rhik+5lKXVXOdkpkSNd8syA9VD0o4LbvZ3Psm1VCBT68ARP9dCtM0zDCCia33iWkSievFStErbcLZNWPC9CTj9XDVwjrvDLUn7bM7Xrr2to1IFgbvR4TvmJLlP3LxFWGVO41Rh7YCtBdDVObnIOkz8/LJxz4MuqVKZ9j2lEs3VGRbe4x0hMO4I1KlnMLhv1mtQ1ko/ALTjn9V8egDtIuDCjS3WDiw17xX2U8rmqggDnbm1Gu4Iav4Y9EZMgvm6hjIRmV+uz0jh99q045JLIpWGbiAAYSsN5f2+wjS+vtdjaetYHdrxRt8RXWPaPbow2KrVnAa0GjwKcSaNxLM6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WdBRs2AA2V0j6HXXiO7Ggy7uRBITJWic5eW1ClXT9Ys=;
 b=n/zGG2swV1sFFYzVnbSJVCAxLpUYiH3hPeUbI1p63vro1BLi09kNuH/sJDtmzjfT7inuCa3NFy1i0uIRlsCU4u90XpJTutjCns2AClSrV+bZrh4m3l6RpbpNQo6M11PDw2ii6bc02lY9UOReeip2RokU/F/Pk1LBOqGXPkzZWUXzOiuMdLZiqOIJM5Nmajqdy63xpa0GzGd0vhswTlg8OjQ2Mbl6PzvbrYiLHtjSQqvuZGs6oJB2qK1bSwFkobQ/AEfAePNK2wPZ9fhDduwNecq/8xS8hErlEVZPbbX56ENgT1z0bGU/lqmDJ8FKRLFl9/BcfxS7IRbzLLSBRi/YSQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by MN2PR12MB4208.namprd12.prod.outlook.com (2603:10b6:208:1d0::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.19; Mon, 17 Feb
 2025 14:04:57 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%6]) with mapi id 15.20.8445.017; Mon, 17 Feb 2025
 14:04:57 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Mon, 17 Feb 2025 23:04:47 +0900
Subject: [PATCH RFC 2/3] rust: make ETIMEDOUT error available
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250217-nova_timer-v1-2-78c5ace2d987@nvidia.com>
References: <20250217-nova_timer-v1-0-78c5ace2d987@nvidia.com>
In-Reply-To: <20250217-nova_timer-v1-0-78c5ace2d987@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>, 
 John Hubbard <jhubbard@nvidia.com>, Ben Skeggs <bskeggs@nvidia.com>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: TYAPR01CA0106.jpnprd01.prod.outlook.com
 (2603:1096:404:2a::22) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|MN2PR12MB4208:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b815ea6-1c48-42a7-8c33-08dd4f5c0fc6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|10070799003|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UGlsYllqL29aTC9Fa29icGxtZEx4dU9DUk9RTmpwYWFoL1pHU1VKamVLT0Nl?=
 =?utf-8?B?dlhPTDAwSS91T3E1VW1aOW5id3c4dUJWeStOeE42ZVNNUVpmMDUvRFVzSzlj?=
 =?utf-8?B?QWNlM2U0endCWGhHZktJdThnV1J2b1d4aHNubmhXY1FubjZqajZHRlc1MER3?=
 =?utf-8?B?WnpybndvdDlQVFpqQTY2eEplOWlWSGE2a1NWYkhNT1VrYkhIbXhMTDJkS3Bk?=
 =?utf-8?B?UFVlZTY2VHVCbHVJK0thMFJOY2pDaDlsKzJmY1dkWGluVDgxYm9UZ2xEUHBT?=
 =?utf-8?B?djFaNVE4TExvSkwwUVRwa3lZS1MzbkY0YXlyR2tXRTRNLzVpV2dteUtmREd2?=
 =?utf-8?B?WE1YVjBkZWlYMzBRYlFBVkZ4NlVRYkdGUEVnSW1GRWFvYnNrTy9GeFFUMWNU?=
 =?utf-8?B?YTJoTU02OWF1T1dNbXRYL2ltKzhESCtrMGp3dXpUWHhLOFdWMjNHMkNLcG1S?=
 =?utf-8?B?SXdJY1U4aGpPY0hUT3J1ZFh0K3FBbThsOUkreGp0bEkxS0UvWHJFalRNY2c0?=
 =?utf-8?B?Q0RERVNqTmRuTmc3c2p1YlREdDVmK2QrV1IwZytoWFpSeFM3T016a3JOM1dR?=
 =?utf-8?B?cjllN21kLzVDTmZzRGg0UmI4b21XWU8veGdOU0V6d2pJajR6bmxoMjM5NkR4?=
 =?utf-8?B?cEVVMWErOTQ2VG5XWEtMSEdndjdPUDZockpVU0tQK3p2VFp1dFZGQWxTZmNv?=
 =?utf-8?B?QUNFazM0dDF5UnBVTkRjQWxmSExGb1QyaDMwWmErWGpVWU0xZUI1SlNSTGRp?=
 =?utf-8?B?UUxvYVZPMkdETHh4bml6WlN1cFMvcnpuMTRaVDFRaU8rRStHajNRSHRNTllU?=
 =?utf-8?B?K3RDaUNUZTZEeEJiS1RQWlowM245NHVCK21yclB0U2RjZTVPaHlUaHRQSDFF?=
 =?utf-8?B?YXQ5bEN1Y1o1bHVIa3Z2KzNiVHNGMmVPNTBQeUxTSHFnQTYxK05IM25EWlU0?=
 =?utf-8?B?YUE3cWZIVk5tUEpSNzA2S3k2VDRiOWxYcmYvUnh5K096RFlNa2dBQmhoalQ5?=
 =?utf-8?B?MEJVdzF0TzZhZ2s4OGk4ZnN0am9FUUZhVG5HNXNVNDhXb0dlWmR2R2xudzRJ?=
 =?utf-8?B?MWFkQy9PWlJDN0ZWbTRURUFPWTZNZ2lyZDRubGxoU3QwcDJKYWRXUWlPQ3R2?=
 =?utf-8?B?RjA2UlFRSDVTTWVSbDNBaUtUTHhtNWdlc1NJb0pPZlU5UEduN0d6Z2ZkS3VI?=
 =?utf-8?B?VGJyYm1XNXU3R2xsZEN2SEJQYUord09XZkZnYW9jbTVqZitKOFlEbExPT1ZX?=
 =?utf-8?B?TVFsZ2tRWTYyYnFObVh5dmtKclRtUCtMOFZNcFg2Z2FmdkJkL0Y0L3NwR2xQ?=
 =?utf-8?B?SDl6VkYxblJUK1EzL2ZQY1BzVWxhbGdJeUFlazNGYUpFR0EyaHRuSFpKNUM2?=
 =?utf-8?B?Y2loc2F2OG5lTkVud2xEWmEvU2VXZjBpY1ZRUzZpN1cyVkxuN3h2RThZaHgx?=
 =?utf-8?B?VDZYQkVyK2EzOTIzWnhEdkJOQXEzeUJXdVVsWWpMaHZCT0RWWmV0NDczVkQr?=
 =?utf-8?B?dmhqMGlMemFVL2kvVnF2UndkZXplZDV4cVRjSC9BRHg1MFNjL3RKdXh4cTdO?=
 =?utf-8?B?dTVlaW45cEVOUit5TXRHVkdrVFFXc1Erb1pCRzlyUTBsK1UrK05qVWtVOTVX?=
 =?utf-8?B?UFUvZ1hRU2FJUjJLaVJvLzRVTjZlVEh6RjlPb29JT3dET0M4cUJoVkdxWGZt?=
 =?utf-8?B?MGlBSDN3bng0U2VrYmdhaGtVQnhxenZyQ1NYZVZVaFFZOTJjQjMvK2NVNVZt?=
 =?utf-8?B?UzltM1BwNDZwcTNtcGVDYVhKVTlyd2ZNa1I5SzRxWVdUbUxScEwvNnJVbjVa?=
 =?utf-8?B?WkFrY0wrbnJkTlpmNjltakwvaktVZFRWNHltc0U4am1DQlRsVzRLUEtqb0dt?=
 =?utf-8?Q?LKHbfeHw9Yrqe?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YTBWeWZFWmNndGdOSHlrMVhWeVZac3pZVHRmZFhNOXRramlFQTdtOG9ROVgz?=
 =?utf-8?B?OVBXUHIzTlhyR24vcko4aVNIUDE2SmVUbDN1RDBDaWhDRWhnMVRNWWlPUEdG?=
 =?utf-8?B?SDJJTDdIUlNCTDdqRXZKNGlyYTFOSlYyOURlejZab2ovazRESWRZN2FuN2gv?=
 =?utf-8?B?emVYSDEwZ1BYeU1DVkR6RXQrRkhKSGdwWGR1MitxR2hyd0NKeWgzZzFJc0Mz?=
 =?utf-8?B?WDd2dWZBWEdQN0h1MUdMRTk4aXNSdk1wTUFFL0lYWW9KbnVXQ1FpY2l3QnVw?=
 =?utf-8?B?S3k5dlNnOWZrVCtMVGo2N2xXemcvU1FpZEVoM2ZKNVY4WUZ1cXIvS1FSRnVz?=
 =?utf-8?B?dFdkMWtXbERjaUF5TGdTUDA5UGNRRlk0aFFqQVN3SVFHZjJCZktHbWllOHNQ?=
 =?utf-8?B?bjZ3VlQ1cUpQd0RXNkRSbXQ5VDJ3YUFPMnBhaktMWlZGUi9JNUFzZjZPQlQz?=
 =?utf-8?B?d0wrOGdUODM4TUsvRC9HTVBpYWsyWHlxR0psLzVkSU1oT2JZcGE0ZmFyNlIz?=
 =?utf-8?B?OGtqTCtjbytvMm4ya29oVDNCc1c4MXVIUGh4a0tDZ1ErMGFUdWdQRzZqcTVL?=
 =?utf-8?B?MFlIMnlEUTRXanM1ZW9JL1FKVGtrS2Rzb0ZkaFZ1VitRc1kxRk55TFFXMFkz?=
 =?utf-8?B?ZFpKVFJSS2xaMy9DN2U3Z3grc1k2UngrMHkrdDBScGVhemRtdlFzbTE2RVB5?=
 =?utf-8?B?a0lDY2hzblM2Rm4vbCt4QkZSR3VISEZLdElTNFpSWnFoOENDRzFYMG04NUZK?=
 =?utf-8?B?QVdYQWp6dGUwQjY4ZytjSUtVUng4MzRkc2VFdzl0RktYc1dObGhXbzhqeDBN?=
 =?utf-8?B?WmRiOUo5RzVUdTFFWEJtMllodzVSb0xsbUp5NGp4SXBkM25wSHF6aEZJUVF4?=
 =?utf-8?B?aVdlL2hQUjZNa3VZTllBN1lLclArbWNQZjJFVlpZRTBOdFNOa3l5WEVrMWVD?=
 =?utf-8?B?eTFoVFRqa3lVclV3RDRIeTZjN0FMTFI0VDNhYkxlTU0yMmlMRWZ5YnVZb0pp?=
 =?utf-8?B?NnhNQzNKcWtzTE9TTjQ5QTJNQndBeHJKdGZBVjVIZ01VZmZWbkdaNFVReVh3?=
 =?utf-8?B?YVZvYnJuQ1B1eFh4eXhFWVYxWHd6akFEZjVJaWtqVmtJdXVVeENVTTlVSXpZ?=
 =?utf-8?B?M1B6N2xPR3kyZ2IvTyt3ZkxGeVU3RldYRXhjbmFKK3VjQ1dEaFVOV3F4dzNp?=
 =?utf-8?B?QmNjODNHMVpxdG0rTlZQckhPQnFKbGtTelZpelE3cDNFclhic2J6RkRrK2NS?=
 =?utf-8?B?S0lWc0JqNFl2anZyelVISTVnQitNTG5xUkNsQjBucWpVMkFvYnAycm1PRXE1?=
 =?utf-8?B?bVBrMlVxUkdmNXRWYkptOFNrVmpYcFdpdThmYmVONTZ2bHdKVGhpSlcySVU4?=
 =?utf-8?B?Mm54N3NZQ2FXT1FMYSs3QUhEQmN1VUUxb0licVRNV2pqY1V2Mmtham5FTEVl?=
 =?utf-8?B?bWJqSEV3QjZ1aWVJNGFLNUhPTkRpejRFUjE5d0c3Uk91TDZKRjdPMEtXQUdS?=
 =?utf-8?B?eE5BME9TdnRveWcydHdCL0xQVHRyWTV4d0pPUjFpdk9JWitJbDAxWVZnamFU?=
 =?utf-8?B?UHlZYVpNOHYreDBUVVZDVFlyaCs2YXBsZ2IvVmxZUVhVZENnaWNiYTBBMitk?=
 =?utf-8?B?a0oyK3N0NzJsZzhnNjRsNUFSc0lUWFJnZnIvd1ZPazZVRWlxNEpMemxQOXdv?=
 =?utf-8?B?QXJWS3RNMW9BbXI1N2xOZzZXOVJXSDFpaE9wdnRhN1lFWGdGSkZWSDBnVEU2?=
 =?utf-8?B?SmRHOE5uc2FGVVBwaVlEMm5WanpZWm82K2RnL2VrVnZyb3hic3FTTWp4Qlpz?=
 =?utf-8?B?UWYzaXdSZHl4amxBM200bnFmL1JlV0VpVm9CRWxhckFZMWdiakNzTzdiM1o5?=
 =?utf-8?B?RFNQN1g4QTM3QThBaURtd2szVFdsRkQ2Tmswa0FLVDRaK29hQ081UGU1Q1ha?=
 =?utf-8?B?WUxCTW1nYjM1cXZORWorTjVBcm1YWEFYL0NCMXRCWWtJeVh6Z3ZEUm1aMStI?=
 =?utf-8?B?L0p4ckViVWdSVHVnRTZzUC9QdXUveG9ycGNadHEycEFNdlUxNmMrV0M4SGJL?=
 =?utf-8?B?MU15TGJpKzF3eWpodEFWV0JwN1M4V3EwbDMwZWRqcU1VQUk2d2ZQcEhDeXpt?=
 =?utf-8?B?d2xYSTd6TGIvUTNuWEwzdHFwY1d3dnh5SzM0MjV6WUg5cENES1gwWUl4OHQy?=
 =?utf-8?Q?f53wRYAXZUkIetaAS4NWUE0Glgf/DWf+n1sbYWi9evhx?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b815ea6-1c48-42a7-8c33-08dd4f5c0fc6
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2025 14:04:57.7910 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yRA8AopH11UFoByyvULCNfree+bIOLAdZA/gPEcjsVA0RsAf0jDteIe/dGdQW4Pzu99491LgL+HU8kcPhGZIkA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4208
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

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 rust/kernel/error.rs | 1 +
 1 file changed, 1 insertion(+)

diff --git a/rust/kernel/error.rs b/rust/kernel/error.rs
index f6ecf09cb65f4ebe9b88da68b3830ae79aa4f182..8858eb13b3df674b54572d2a371b8ec1303492dd 100644
--- a/rust/kernel/error.rs
+++ b/rust/kernel/error.rs
@@ -64,6 +64,7 @@ macro_rules! declare_err {
     declare_err!(EPIPE, "Broken pipe.");
     declare_err!(EDOM, "Math argument out of domain of func.");
     declare_err!(ERANGE, "Math result not representable.");
+    declare_err!(ETIMEDOUT, "Connection timed out.");
     declare_err!(ERESTARTSYS, "Restart the system call.");
     declare_err!(ERESTARTNOINTR, "System call was interrupted by a signal and will be restarted.");
     declare_err!(ERESTARTNOHAND, "Restart if no handler.");

-- 
2.48.1

