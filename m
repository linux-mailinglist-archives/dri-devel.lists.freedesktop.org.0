Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94973BF30D2
	for <lists+dri-devel@lfdr.de>; Mon, 20 Oct 2025 20:56:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B5E410E4E0;
	Mon, 20 Oct 2025 18:55:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Rrw6nVrM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BN8PR05CU002.outbound.protection.outlook.com
 (mail-eastus2azon11011017.outbound.protection.outlook.com [52.101.57.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0B5310E4E0;
 Mon, 20 Oct 2025 18:55:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hUk+QpiODsvuAZw27NNaHYNl39f3rcX4sabG0BAFjPI34y44F8xDoL2oZrUwqpH5TdlJDZfKzWdy/CgDvERGnkXJg005pnolrAgB0ZcOq5eJpYLPEZsBbNlNZEwMBbYfyOh8FY1DRHab8rRF++MpuvRhEf/u0r7kHBWjwve6VgFrxdhluNY8Wzj0EhxcQWC+hbJVFXbWsR4JLOLgZbVLFc3J4QfMqNLlL5n9QlcnTLcNlEeUt9XujC2ATgR0pJ+ealMIrUbZERSDsWLYYDEcaVJJTcymOrsOIqcLHmCDBhlWfzMfpnmQTHW6/EjKckwS2JmzsntUPF1edb2wK83vbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2nvBLExWzzSC9WkCbNUwchJG0yZ1DxsdMrQMf6weLKQ=;
 b=pgFyfJ0Cu8sOsAW6fyIel+3hKPmpRSchMb6JBE8HSf/Ko98qNv5SJ2xHV5TUzTYwGmRo60M+WhoH4aEmO6pSgoMn7yfHdfR242gvOaw9SLAJzuxYV+nL7zjCMdw2t/KA61MODt3Khf/aO02yINujtdjkIDkCvkmTRoefZRev4uKjC5s+wpl4xAxAA87VRld+JySAJgf9xESNXA/5WjVvT5hEiezdEyWVHT5NvxNUHETiMOSfCqcTq4270FGonMxd5qWoisnbyyar6vLqusfSJ9GlbkvyrZLTokPkbNkZIKnBtv9CCerbuIn5+quWbk9u09x3qFTGw3ZigFz27YpX3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2nvBLExWzzSC9WkCbNUwchJG0yZ1DxsdMrQMf6weLKQ=;
 b=Rrw6nVrMGrXX89WWdbm2oRukhOWw0WcGD2lWWrflpWxaKQn1pfbt4wDT47stsMsHjhQ7rNurVKPAazQyPVv/ZeHh1gpf/RE98gdNBOWZYfBxUAMCtIfGExQCO43PVZdq41QgR1tJbn0mYBJP8RvwldL2QdYXmL6S73Si7HMaG++i0Aj7vNszbyUBGwmTFXGG8xGTvzsCU46osn18fKZJopHCsePYSumhB1xI51Vb6P+pvdVjXAW/6k6A6ttsEL/ULk6r7e31HeetBDPOgjH9HIx2nbTSzripCENjYMLSz00AWuUmTY/6gOgHN/I65A4DMWvw6IRjUY3J/w85X9HUsg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by CH3PR12MB9316.namprd12.prod.outlook.com (2603:10b6:610:1ce::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.16; Mon, 20 Oct
 2025 18:55:51 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9228.015; Mon, 20 Oct 2025
 18:55:51 +0000
From: Joel Fernandes <joelagnelf@nvidia.com>
To: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 dri-devel@lists.freedesktop.org, dakr@kernel.org, acourbot@nvidia.com
Cc: Alistair Popple <apopple@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, bjorn3_gh@protonmail.com,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 John Hubbard <jhubbard@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>,
 Timur Tabi <ttabi@nvidia.com>, joel@joelfernandes.org,
 Elle Rhumsaa <elle@weathered-steel.dev>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 nouveau@lists.freedesktop.org
Subject: [PATCH 1/7] docs: rust: Fix a few grammatical errors
Date: Mon, 20 Oct 2025 14:55:33 -0400
Message-Id: <20251020185539.49986-2-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251020185539.49986-1-joelagnelf@nvidia.com>
References: <20251020185539.49986-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BN9PR03CA0577.namprd03.prod.outlook.com
 (2603:10b6:408:10d::12) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|CH3PR12MB9316:EE_
X-MS-Office365-Filtering-Correlation-Id: 390ff468-6d64-49fa-a652-08de100a49d7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?li/pcRkXkN96KibTTclSRV3xvnfg/639ZlLV4+uXpToyXf5TSqIyzQjwJhLw?=
 =?us-ascii?Q?NDSAaFnTGQTAF3OPQDsd8dcO/UW1MPOOZYNcC9BqFq0ipkm8Y2OhYrVEifno?=
 =?us-ascii?Q?nF8Q8r5HVjD/Y1K03cEM7rr95xkvL+jcmbl5Km0KJtVQwqIlQakEoy28rO5M?=
 =?us-ascii?Q?+KGsnigcrdleqiQGqtQlWShfFGGuGh3Gy/+39WEwEOCZIv2rKAch1oXAUael?=
 =?us-ascii?Q?dL1UYIBeHy1Rsb31HFNBrMtWJIYwGdQOLlEn8x/D5CfvHed42Dh2XaFFW2+X?=
 =?us-ascii?Q?wok5rV4SJmNU7gyjNpMBMQ7zHVp1ZQOh5N2H/fdsk1GbOdlDIgr7d+/NiSSj?=
 =?us-ascii?Q?viLc+dR2ex7fZQvcZeAP/HpHN9sWiNQ2QRdQZsuMfMR8mVLkjN3UFag9/ojh?=
 =?us-ascii?Q?fPU+vDmuUcBXo7HR86XNADOl51YmhNPaOHOglaN+CGBOGBosxY/LFLAAFkl7?=
 =?us-ascii?Q?gV+7nEWuexWBvFdY6S1Qtl1ACkRr/L0nfaFdLp9Fs/NmUmxbK1tDYtlnfUmO?=
 =?us-ascii?Q?ebhcp/HJTGlrWZS9YsXd2PP+NJz8rtXDSkSN25CGRCdASoXQ+/xslzjSwqOE?=
 =?us-ascii?Q?AoKjbdRqSfqDS/Wl2dfDT1BzQSteuY+uKLvCyE4ape+TGeEzMErhQgdEp1zs?=
 =?us-ascii?Q?fiZOqDH5GP6K8wHDCy3esEaYgJORw0Uq/sEOz0LbqS0djZFGhSmr0b0kD0iP?=
 =?us-ascii?Q?Fv6lpm8mSYANz6CffMaoFu/YjTkOA4YePwyXVkHF5aNKwnvNdcv+zUXw0Czm?=
 =?us-ascii?Q?ndovv+5RmFkklIhY/xD1XMyQkacz/24HWSj46+JGP5uxKc/haNOWpL+bANDe?=
 =?us-ascii?Q?Sy96p2315CISl1nfnvswAA8IHBB7CGtclZ3b7k4yBcDxsz4je8i/OvsVspC0?=
 =?us-ascii?Q?zFTfBer7Ma42YoaQu07iKCn+NF9PFVMaph1H2wOHurgrRITTDj+jooTVun3H?=
 =?us-ascii?Q?5JUTipY7uHj12SqhoTKAccSmjAgrvK+AX6xk6avj04PkDEPrh3gI5gJqNtch?=
 =?us-ascii?Q?EFYJgvgZ1Bvh/Sovl2fazWSSad00JAYOfA0hYV9koa6IhkyhJRohUOXuw0uK?=
 =?us-ascii?Q?gg42efcWznZ6kZ/1VyajyBPYekBfN9hr8M326cC+CndkSTpOsG+PQI1ow8p9?=
 =?us-ascii?Q?3Iw9Cy+gyhv89R4zNXiKng+C1qkVkwn06fSVjAleaNXl6bK0PMlsszhPfGrr?=
 =?us-ascii?Q?VBpRNlVOetvqTWQuTSZxthxISFZMzHQI/ySQfaiiFDAy8aYH89WXY+KTUC3K?=
 =?us-ascii?Q?irioA5yaFI8dUbxcMk1yKcYDVI8UWWZllOoEysgo1yD5uS55b0//o/NA0SD5?=
 =?us-ascii?Q?UeQxntG4MbBGDQEE2GCCUjs/8QVKhoD5sIG2g75XqfwKyX+EToiPqeYDCC/v?=
 =?us-ascii?Q?fqxgQxTbnpLHt0zzvM++cLRA3Iq1033V7x1UZMMCy47qGBn6c9aOxVIVwHl3?=
 =?us-ascii?Q?lhHhQNj6m9m1WqnLT+IzqjNI8k0CqDzx?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?G8qb0aKEduHEdDgosn0tv2BEcZEHFWDtfjIrD94C1NgcvUz+co9iE1Xmj2dH?=
 =?us-ascii?Q?8hNWQn/eQx/r/SLcqeJ8MYoYzUPzdN7jhcawThbPqiHELDAjIlL95N4q2cDM?=
 =?us-ascii?Q?er00OgjW6at+E0gJBnPHfrBmksdieNIl8PI3h9jbo9XgRIIJvqAFDcacnd4U?=
 =?us-ascii?Q?X7w3z3yWC4KmDfV9A4XsOA1LWSHFvRPYj8b8hzECi8ky1nyoYHTer6APB8Nf?=
 =?us-ascii?Q?1A4VXolcF5PKuhukl9+qxhhkx2oRIUPYkc93QOQwjL5tUpPoBqgkA1uXrCcv?=
 =?us-ascii?Q?pkpFWQWZUNyHpFT81rElrriTIg7LrhMYWcZJ87vstQk9TaIMzDCAZFBSyyN0?=
 =?us-ascii?Q?z7SYFy3XI25pTZplLH6mRkuzv+kWCeETRalXr2Wh3T+3DROujG3q0EhggJXZ?=
 =?us-ascii?Q?PjlLyKLoY5+3NuIVeUxxVVAecG6w+7zdM+9r2ctSNbcON0xk6BAvyWggMNSo?=
 =?us-ascii?Q?MwvN4KXVS2/U6Vb6v9PUKuwwGHEhhU6w9PeTC3pWGTn7KXxC4x9QK+yVvzZb?=
 =?us-ascii?Q?8Ywv/iXCdIybISjgENnlf2DF8nZxrXyPRXC415LHd49+auuQj2F4lS6O9m8O?=
 =?us-ascii?Q?bDTmHB+pP67quiDbzCdM5Xl8Aqog0kTYJ2Lnoc3bgY8AlIycETmpySwhSUU7?=
 =?us-ascii?Q?hLDdJZCz+mEr9cjAT2Jv8wXoRa9QeePMs5EOUY6stCwYHso3sSC3prvgPi+R?=
 =?us-ascii?Q?9t21BT6Kn5g65erFiXpbg4CtnHZdeL2tPjrdTZTPKBoVxAdKbj4+rh8FMaJb?=
 =?us-ascii?Q?zy8yqo+A8B8rJTBKvftewuIBGYS80cXPLGK643IFklUpr1Ncz9FZXCXBfp42?=
 =?us-ascii?Q?kU7tp/Er0M/zYWmgKjL+kcBOUaVZH8mDUmr+USaykr1ZZXFVjR5UmC5A7RfA?=
 =?us-ascii?Q?Ffy8Q7FFv3O1t4Y+U3cTMydPR77sVcP55HRcXbs/tDKSnq3sjhqGQdxgJzs4?=
 =?us-ascii?Q?lYPdc+uh+zkIPUmsup6LXv+PHq1yNyLLNfQxxDCzyLnMzKOrnD9PclwjI0Yt?=
 =?us-ascii?Q?Pxw0L/FBO1vqt8n9fwsWTLkTASOl77p7Z+MhBrSND0Ltonl/XOq6cgSB4DyB?=
 =?us-ascii?Q?WlmSqazYhsr6tQhwHBUz7NEdeXdyXDofPeiK+Ts4hfYsOgEH00HazTIcbY0s?=
 =?us-ascii?Q?/H5dO9ALGj5eBKeOaMeLjZUKQ6zsso5tR9ZWYxyyS0mg2fBKacwDUd/WmfWU?=
 =?us-ascii?Q?yzXqlwBTndBRYzj9lLU0D+I1hFqHQZygemVpBtjYJQvijv2s9srXpyr5XOh0?=
 =?us-ascii?Q?zhChqqpRpWYExwdKgCp2EDOxNpwgpNIz+JOUoO6N2UmpGb9x9Wc9WMU0ABaP?=
 =?us-ascii?Q?f3ZNuvjjfQd30cWX9AD5r6JEBarzGnrpSXaNdKZ3hoLQzlsl6Olcf97Sy+mw?=
 =?us-ascii?Q?8eqGW4pLPwwhG4NgYIv93Rm0PRUuP/C9PFQpvtyACdyOq9mgrv+rJnX21uoc?=
 =?us-ascii?Q?co7NMQwWCHz5CYeBDmylU0Q5iIg5KNs5yMaZdPKlJ0Fu9b3UBoWsM488tmLB?=
 =?us-ascii?Q?nffDlV2OpLe227WDudmHmdU2KpEuxKcMZopQa017ruUkwag7yEatQ5gNztf4?=
 =?us-ascii?Q?MI7W+GdUQ+2p1GHIC115Y0jETVKuEcOawUMxJaVE?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 390ff468-6d64-49fa-a652-08de100a49d7
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2025 18:55:50.9054 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nUiz62Ow2Defg03RB1g4VXKWJdIWIalAZnsQi6UIniyQM3Nzk08eRR+fb4e3UlzGhEd3QtkGjcMdrI+6K1D4QQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9316
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

Fix two grammatical errors in the Rust coding guidelines document.

Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
---
 Documentation/rust/coding-guidelines.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/rust/coding-guidelines.rst b/Documentation/rust/coding-guidelines.rst
index 6ff9e754755d..d556f0db042b 100644
--- a/Documentation/rust/coding-guidelines.rst
+++ b/Documentation/rust/coding-guidelines.rst
@@ -97,7 +97,7 @@ should still be used. For instance:
 	// TODO: ...
 	fn f() {}
 
-One special kind of comments are the ``// SAFETY:`` comments. These must appear
+One special kind of comment is the ``// SAFETY:`` comment. These must appear
 before every ``unsafe`` block, and they explain why the code inside the block is
 correct/sound, i.e. why it cannot trigger undefined behavior in any case, e.g.:
 
@@ -166,7 +166,7 @@ in the kernel:
 - While not shown here, if a function may panic, the conditions under which
   that happens must be described under a ``# Panics`` section.
 
-  Please note that panicking should be very rare and used only with a good
+  Please note that panicking should be very rare and used only for a good
   reason. In almost all cases, a fallible approach should be used, typically
   returning a ``Result``.
 
-- 
2.34.1

