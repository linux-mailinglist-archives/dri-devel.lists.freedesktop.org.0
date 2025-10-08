Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 618C9BC30AF
	for <lists+dri-devel@lfdr.de>; Wed, 08 Oct 2025 02:13:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FB0C10E718;
	Wed,  8 Oct 2025 00:13:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="iNML2Ozs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11013057.outbound.protection.outlook.com
 [40.93.201.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FCA310E718;
 Wed,  8 Oct 2025 00:13:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zQv6aqVIxRBqK/kCTfHrhIs+X1p1RM7au9Qt95aoK1YYbfSG5z655WWwMZz07Om4ZEOaqOTOJVhHxCxg4K78iZtncaSe8WqGJvZ/Af0MFlIT6KxCC4HJukjgJw2YyBJt0ftqeTbHeue3AhpQa7hj6f6TkgA22pPkCBSs3VNwG/+kQuVwoXe7hRlDnJDJbPMjpm3CdgL6ZzSeeRcNj0KNfYP2ZpdDjzZCjLmR3uDqhga40KvwIlZxhzqScxbww231qlo3OMJ9zyqkLPiQNpXrMYN27HKgwevJVECHl3zUMD+1PGGigylDOaPnnWSeg+fga29BS3kT9HJxmrUp3ZDI8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ytvQ/l9zmZXBrcIspPYTd/CBkZ1WeDssNh2+lQEEZU0=;
 b=KCNRLruXnCZFWS5t9o7IG0DAP7B5+HCFCsHy3os4j4xGvG2s0G1KjXNapbJiwOswIIHpJwq5zL4TIJYt27CEbrzmQZus2nh9YCXjS6pgz7AG8ksQxzqilfY+YPJkUEE1MRTofjl0b26MxTASd6cnvZvEhLY0F6HsNhvmtiDOomEX1l3Ynwjh67lNNRvp6yxUghvpGV/W0/5Fg/GAY6MR/bJGt/1jjr3vnUGrUYBmStfu+HbYql3p8cAGhC+vogKWT5Tz/bkVET1L/j+zsaO2bQSEilYjAIW/BCvbYwNM8PySHgteb1fVQ4omF/OFtXwwJWIfdbjPLy04r9eJ/dcGtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ytvQ/l9zmZXBrcIspPYTd/CBkZ1WeDssNh2+lQEEZU0=;
 b=iNML2OzsjZx27QGxgT708TSk4d1t0BXei4nNOodn9HN2a+4ijCA2qzcZSHnKKANN83jyzUq7qbvhvnTTPOfMcI0zNn1GGsrSmJMJspELmDGl6XxsXg31c+hDnK6n2tx3AAChX0FItPl14WB2PqFg4dDU/6O3Eq0WdZnf75bDJgR483tHwk6JACaU39Y8ptcEwFJ9g+nglkob7GJy+Vhbgy7NpUgyyzR45Osvg0PV68gthtYoxmwgMsEsYGGksaRbSZmkXKoyDa/OM42sYmKcZq0c2P+MIl6gbVTBzHKj7FoT4rDqXon2eufmZhgyU9diRKLDG7ZEwgUSlrGDSlCHRw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) by
 CH2PR12MB4071.namprd12.prod.outlook.com (2603:10b6:610:7b::16) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9203.9; Wed, 8 Oct 2025 00:13:05 +0000
Received: from DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe]) by DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe%4]) with mapi id 15.20.9182.017; Wed, 8 Oct 2025
 00:13:05 +0000
From: Alistair Popple <apopple@nvidia.com>
To: rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org,
 dakr@kernel.org, acourbot@nvidia.com
Cc: Alistair Popple <apopple@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 John Hubbard <jhubbard@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>,
 Timur Tabi <ttabi@nvidia.com>, linux-kernel@vger.kernel.org,
 nouveau@lists.freedesktop.org
Subject: [PATCH v4 01/13] gpu: nova-core: Set correct DMA mask
Date: Wed,  8 Oct 2025 11:12:40 +1100
Message-ID: <20251008001253.437911-2-apopple@nvidia.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251008001253.437911-1-apopple@nvidia.com>
References: <20251008001253.437911-1-apopple@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SY5P300CA0015.AUSP300.PROD.OUTLOOK.COM
 (2603:10c6:10:1fb::7) To DS0PR12MB7726.namprd12.prod.outlook.com
 (2603:10b6:8:130::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB7726:EE_|CH2PR12MB4071:EE_
X-MS-Office365-Filtering-Correlation-Id: dec9af66-abd0-4b96-401f-08de05ff7394
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?yVVBnpDCyo8m6+noNYhykyh5g/JyOnBg2pewdZNrZWKMZ5qucmsPT2sfU6gq?=
 =?us-ascii?Q?mXuhTn9dVjmmG0kon1hy/Y0RbvFXznvdq1du1mNKA/SJ2o2jMBiIX3o1Abrc?=
 =?us-ascii?Q?s7/+dq685/RjNNrX4sx6Rl2LT9E8Hd/gNSTT1/jUkhrKZjMcGcgoRoGoPqrU?=
 =?us-ascii?Q?9+BvVAy2b+mVAAaGJ00Z6smx34sRL0YgY0LPXm8RpN9lrg/jUGeoekysqFS4?=
 =?us-ascii?Q?rEJgh7mrRSRXCE/GeRddpEwEAMaRPX2VL/vgyPyj1P4vKmWO7ph+bleTTpWv?=
 =?us-ascii?Q?prhoYzSBwNBMLI9zchRgvQ0VuemhsZz7JxfZfCs9B4wHeO6aXls5lfJwEzWn?=
 =?us-ascii?Q?MGZmM/GlRDB4cMUJZnv89L6Lg+bsfrUzBm2WYjv4rC402Q+QTtVfmplK2WPp?=
 =?us-ascii?Q?UUTGHO43ZlbwGhl+CwjMyHy1nSWgDarH08JUoUYNE0dupdd2vCFTHMmFQzqz?=
 =?us-ascii?Q?Uj6mtuuLCLrZfz//o4VzRO7/m2FLMQBAuCiDrDZFhuzjlyNldCwUWHcMSKkm?=
 =?us-ascii?Q?0zp4CqkrealmDOiyqXC939a9ww1jGJsjeyHSaDZ9h2ZvyLBl2sT3nvmDfIYH?=
 =?us-ascii?Q?jD75FD18xDTUHWXPsboKc32V7CZ2t8hkZqif3sTK5M6tsq3Ru5A5b34yf2FL?=
 =?us-ascii?Q?uYIOQcS5fTH/vF59gJwXlovdPzyTxxvLdKLc6Ps1sS19hvY3jhxqrh2ZzJZ3?=
 =?us-ascii?Q?XKOv5imBqtVD7mktH5paFcD0yPBlnOIFU+tapDzimv4bicnuWmhX98PzA67q?=
 =?us-ascii?Q?8IpkiA1tTJwXsKeyA7gu1awwN3PWtEYlxy93wjcLQESdQlA9iVAUsbESwrA5?=
 =?us-ascii?Q?Ta12lzR1W63bdnp49sX5I5rs/6B0jM0ovHd7Q8cMFge2igx0ajD/Q2KRUtVw?=
 =?us-ascii?Q?uJ4zZ2bRTHpYQB1iBkS7ZP6/fpDATOzgjn7bYBYNl6N+D94stv6ou6GqyOmP?=
 =?us-ascii?Q?pN1iasBtjSCtbyPhSbNpnBE/2zolH4vxk5PYTBI2bDBjMpnVabha1hyrUX6l?=
 =?us-ascii?Q?RGv5ScGRRI2ab/P5+a/gG+hYRfB6Mp1jXQSrQScNpgC7DX0v42E3AkZh8X6i?=
 =?us-ascii?Q?zeLjnk3dH1y1apvRpF/N8NdB0kaIB5xzkVCjSgqHl5GqdfqoCDwz/m2iofQF?=
 =?us-ascii?Q?x99MFTuPgcKy2/SuFOmB+f3VpM1nrM4F6S85kJXgTm1Nb90QCJB6U68zDgOD?=
 =?us-ascii?Q?QV1d3c9kcjPWuO8AmzevORaSg8eyVPCry8yx7zU7GK8cHpH+r6HNgDHIXUMF?=
 =?us-ascii?Q?Om/4omszNhyzWYZ9ZUcbMIFnWZoB1W1J9bICrrnRfrZ7gf3FhndEbNzK9aPy?=
 =?us-ascii?Q?JIBTwajMEsX43MYqpvTkCjF/25yjNjMHO1uJNf8mqfKE06ppb5Wf1YfIWy9M?=
 =?us-ascii?Q?MG0n1rdrI12xJJkTzFkfpbn4BfPuwYqlPs4/ZPX0K8TJ0JDr5ZmfQOwiA79x?=
 =?us-ascii?Q?10OTJPJD0WE4fvvHDxINiasiz3q9segs?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB7726.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?v6FcJiYaY9UGzlHXZwE+AaFktk+Ba/hcBid/H/q8NbACW9gmNdgHbiXsXIR0?=
 =?us-ascii?Q?yaLqnY7f9/11BWzMQWx1EUP8VDd9Eps2oWjQTHU6f/yC81m8ZuTRZ0hFyHte?=
 =?us-ascii?Q?zSvKeJKj3AkPCT8WcUrRjxJh6fzPrc2sC56z3btZGvZwGuNMuErS1zmXaJv8?=
 =?us-ascii?Q?xVZXk/S2Nj4UnslIQKG6dFnkOJjU5K8MFVDHY9R3JjiQZm/5rlf136InwHiu?=
 =?us-ascii?Q?Y2Uzf/Ms7q2x9QFeXT9wLHCW/0aqTbrr5Ky2wVPhmlKaSYzm7g33Q04JgEhJ?=
 =?us-ascii?Q?vqIzqR6G8tluizVlXpVsnmKbINEvhuliI9cZSE4PMdqIuzMyZo5AUFzZyMoJ?=
 =?us-ascii?Q?+9KjEAH1wlHPs10TYYi8LYlkxe+6AU2ZAdfHxY0asisYXYF2YRX42yWR2jgJ?=
 =?us-ascii?Q?Pt1LyWsvYFPj3uuhHXb3XZWygyaBOUoVfmzH6QH76AsaJ6sK2iqu8c6ew5pq?=
 =?us-ascii?Q?SY34soJlinvXvYjsQ6iAqtOSKAffUVWUssCdERs9xTET8/YgIVsfKdzr5Dni?=
 =?us-ascii?Q?1han7MydBFlLJTmsmD8QNePkYZXd5+aNKE/HcCt1FaXE8dOnWsLOeoNOkJLb?=
 =?us-ascii?Q?Adk15apkgcuGaajq2SoJ8pd75Lj7RI5/f7IbHFAuSDdH4bDZyfgFEM8rTIRz?=
 =?us-ascii?Q?M8AnYaorCN7A6RSpAueafJF60d//6sTeF5pAxvItJ5GQi9iUsmvKRwuqJi6y?=
 =?us-ascii?Q?qpo+p+/mQWO3Sg4wRrzlnx2gRDi7xM0W7tA1RxqllHpCSdwOUMs9uOuzV0B/?=
 =?us-ascii?Q?ObdAY6PCUmdbexQp0Fl8dCpE2yuxgzEpImjnWCAbYbpLIF47IJ30BGbdggFx?=
 =?us-ascii?Q?1Vj7+LagVnyin2faAXfpJi/faRcYoqwYS76cICWYnFeNhdSco5ZkP12bS6V+?=
 =?us-ascii?Q?8aC/+BQr1rrE+/g8fSXGUvxC2vjIsXtsTf1FvtdMHctFeHTxgTnG09OCD7y/?=
 =?us-ascii?Q?rH6xqG3iGAz+Y9BMOLYRC4X7lvcvwIbGqemt22n7RaFIytVUqbM3BGyJXmL0?=
 =?us-ascii?Q?VHT0gHhEEbe/5M1V3pu9i+CELXZClGVmCIuhWujKx7QdX2ZRMezgMni5ZDzQ?=
 =?us-ascii?Q?jzGcl3TaSm7wSd9yAPjAg1+NzYhnJnzopLLlV6oIWbu9lw1qoFu1Dz8Suc0D?=
 =?us-ascii?Q?9qPMZXJaKea2aS/Boa17RIBxA6HPhLzQ/E4p+3lLFQI5G4g/OZ7XSxV0DOST?=
 =?us-ascii?Q?HSgHF7dD5tEv9SOzs+TCaF/0BO0W001iG/2kMHWc1mQO8QvsI4p0ng9StYTU?=
 =?us-ascii?Q?T/P8sQOwr41/Eu/yGcCTACNOj7V2LHA+AiLaC12kRM1Cix2Vc+f7nSy1r6ev?=
 =?us-ascii?Q?rfab0zIW0ur4sfV7nwT4K9iOIc9Q5jDIerv2MrvP6nLbYZIxAOegxBmAmGPx?=
 =?us-ascii?Q?2SIAZrbRpuwvFuGY6koFHYkil75AfbtUZczv2JdPsz5XbwuVmRZZ1gKb2Uxo?=
 =?us-ascii?Q?wNK9U3YG2sG4o+LsyUx/NOMTBDYoPOT2fat5lF4M6brqZwImIMlmtqDTZLvh?=
 =?us-ascii?Q?YFPqr0SpM3tFd8s5yMlo5S/rrBWC0TiYBHi7j3IsNpo9Ntqh25rE5Pw+axRc?=
 =?us-ascii?Q?d9NM2OsCNZTc8U1cJoSYEsZcAehmgf3/ryMbAx5N?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dec9af66-abd0-4b96-401f-08de05ff7394
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7726.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2025 00:13:04.9054 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tcd1iOpCdcOV6EXrFeN3kLEzMumNsWhr8apuvcSQypf2P+PxqBtL27Dktkc6p7ro40bqmfR9N4I4TY6D1d0Crw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4071
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

Set the correct DMA mask. Without this DMA will fail on some setups.

Signed-off-by: Alistair Popple <apopple@nvidia.com>

---

Changes for v4:
 - Use a const (GPU_DMA_BITS) instead of a magic number

Changes for v2:
 - Update DMA mask to correct value for Ampere/Turing (47 bits)
---
 drivers/gpu/nova-core/driver.rs | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/nova-core/driver.rs b/drivers/gpu/nova-core/driver.rs
index edc72052e27a..84fe4a45eb6a 100644
--- a/drivers/gpu/nova-core/driver.rs
+++ b/drivers/gpu/nova-core/driver.rs
@@ -3,6 +3,8 @@
 use kernel::{
     auxiliary, c_str,
     device::Core,
+    dma::Device,
+    dma::DmaMask,
     pci,
     pci::{Class, ClassMask, Vendor},
     prelude::*,
@@ -20,6 +22,10 @@ pub(crate) struct NovaCore {
 }
 
 const BAR0_SIZE: usize = SZ_16M;
+
+// For now we only support Ampere which can use up to 47-bit DMA addresses.
+const GPU_DMA_BITS: u32 = 47;
+
 pub(crate) type Bar0 = pci::Bar<BAR0_SIZE>;
 
 kernel::pci_device_table!(
@@ -57,6 +63,9 @@ fn probe(pdev: &pci::Device<Core>, _info: &Self::IdInfo) -> Result<Pin<KBox<Self
         pdev.enable_device_mem()?;
         pdev.set_master();
 
+        // SAFETY: No DMA allocations have been made yet
+        unsafe { pdev.dma_set_mask_and_coherent(DmaMask::new::<GPU_DMA_BITS>())? };
+
         let devres_bar = Arc::pin_init(
             pdev.iomap_region_sized::<BAR0_SIZE>(0, c_str!("nova-core/bar0")),
             GFP_KERNEL,
-- 
2.50.1

