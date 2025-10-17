Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 340F6BE676E
	for <lists+dri-devel@lfdr.de>; Fri, 17 Oct 2025 07:48:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FA4210EB02;
	Fri, 17 Oct 2025 05:48:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="J853j43W";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11010057.outbound.protection.outlook.com
 [40.93.198.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2E2B10EB02
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Oct 2025 05:47:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KzcTa25y9iSH2Qo0UxzFn0siFcNIfeOWpS1UCZ8fksggq5RrMnwG5P7KsIWT3Np5+YktrqTOSgymuX/pT4WAQuJPbx5+cDuvstAJu//h33PZ32eC2/cFnL+wA4ISRo/1oGO4WKapy7tas1RbWATF/IdXf9vmyed8O3a90+DiohHNsIQlFYMH7vsO8O5bxf4Gh6vxQmLuW4z5QX6ZE3EqVWpgY70DzrklgWq+CCphYu+EaQ/klNDSALFsAxomC/cBcphLdutDxP98cmogNURLu9RCim6b+GY+aVQUQEx6sRXuiv1cA6z4lsVK/YcKJ+QHwc64fif8FU78oWnY+ydJeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6+KckomB7fnKKmjfOxJEaXL8OiqQr1bLTbtwa4dbHVs=;
 b=YS+0we+qPP3NYO/DPaoHw4v0/a1lOVQjVEyYhNOyUdDGDLNaChgFBZmeZZiTxMJuIBWqq7O6ks3wQKoCTSRA/6qp7b0V/d4bIt3A7tsS2ObQZHMmCytW2r7zdBt/zlrTMRs201bYlLfil7seLfWrAMM/pbfo+L/O0YITuzTfWqqsPnwOtH7rehK0IdEt/+bKTeN7hbDY/k0GRizIb78QCb03VG0xHTOctB8rl37zwaY5X9y7H0QEGhF33UfZZdNt2PWEgCk/+ol+Tj2XKx4JeqMNEGUcqDX1A4ULhSRmFtOF1gF6WqorKXx1QVtY/Qh0Bgye3k3IqiWX2TC17qmrWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6+KckomB7fnKKmjfOxJEaXL8OiqQr1bLTbtwa4dbHVs=;
 b=J853j43WJdgMUema+3Ybt36uDq+ylZXc51BvGzB6AJsgWjtmyRHqcvalt6f0oHcInfcyK0Jh7W+NQ/A5TADabcp8iWqjHjOC6AlxFscHnUtkGhaVyTOg02bQOyXO8L90+F1O9JTJPtV33PWj+w2K8xoxl6j6j/HuQMpH2jCsq1NCKBiM3GNDSUfqDrIpLKTPUxJxpUINrGEGO5vpanZLgcOFRE3o6xIuakcQvXQH7CHj4yUQQ1mK0tU4fx3tOYo77ZQUZJJ1NiTIsDLaY1YOi1s0WUvodVfgiZ+sudzu2q/i9ETRJ3Tc0FyeUYKKAXrjW5gXi4+fNd/FRTDRiOH6pw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) by
 PH7PR12MB7819.namprd12.prod.outlook.com (2603:10b6:510:27f::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9228.12; Fri, 17 Oct 2025 05:47:55 +0000
Received: from DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe]) by DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe%4]) with mapi id 15.20.9228.012; Fri, 17 Oct 2025
 05:47:55 +0000
From: Alistair Popple <apopple@nvidia.com>
To: rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org,
 dakr@kernel.org, acourbot@nvidia.com
Cc: Alistair Popple <apopple@nvidia.com>
Subject: [PATCH v6 02/11] gpu: nova-core: Create initial Gsp
Date: Fri, 17 Oct 2025 16:47:27 +1100
Message-ID: <20251017054736.2984332-3-apopple@nvidia.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251017054736.2984332-1-apopple@nvidia.com>
References: <20251017054736.2984332-1-apopple@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SY6PR01CA0087.ausprd01.prod.outlook.com
 (2603:10c6:10:110::20) To DS0PR12MB7726.namprd12.prod.outlook.com
 (2603:10b6:8:130::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB7726:EE_|PH7PR12MB7819:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f304f9b-cfa2-451c-0b93-08de0d40b7d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?xFz64CCpP1Fk2xTMsDDmfDZaqcSkkYcOqaUJnSz8RdS5NMASFkZgrrN2nNFY?=
 =?us-ascii?Q?mBRmmd5IlR62XcayqsVYfVwU9uq+jecfviY2YFCXoh6d3a70FMtszBIYrkcm?=
 =?us-ascii?Q?UgtMclS3LHEuKU6MbQg8UF6JEAqVgXfJT37s1L2v1dwGHIZ6sTRGPcDIVH61?=
 =?us-ascii?Q?gqvm0gwWsEX4bF/HdrJTh7cVMAH3rhzZpynyhgk2fOYAf3jkRLXNp0uS1Fza?=
 =?us-ascii?Q?WDWXYoFfJ5MSQ5fC28ctdpEkDMUbzkJwzyqqLDhlZnl8a3ppFlhG8gppvLBy?=
 =?us-ascii?Q?dgFPDEoD90lPH1abrBnaVfVkzBlgjyCtt/t3X1RPFiJXzJWWVXM8LUzGmE2i?=
 =?us-ascii?Q?73/fjKNdpp+3YjnwJhgLj9jOaKFOjZ+/8lJQHamqfNr2pAbnFEda3PWn304n?=
 =?us-ascii?Q?UOk1NN42k8uR4xXkL6GNYSpc1PYxfq14fXeqoVt7JwbxRI8fLYm5LlAnSqP8?=
 =?us-ascii?Q?+zwV0ra5bKgevD637ZeW+ezSgwterqKOyUNHUHRkm5STiZakLEK6ZWQ9nx7M?=
 =?us-ascii?Q?J5ZfBg/KERv9btE3+6tz5NigGregc0wASPIj5NRxocly7Myzii6pWes795Pp?=
 =?us-ascii?Q?dc+fyg9tMpy8G7rvRpw/5Wor1ug3gkr+nDu0p3SwRr/2g2/6nbkxUL2xtxNf?=
 =?us-ascii?Q?STuAzcgu1jLtce8zb884hvbHKusJ3efQiyYgWEYHGpHADvX+hmRyNYOppkgb?=
 =?us-ascii?Q?Ig61isurgIVUiKjxSIrf2WmOC1xFIOrLZ//w40JWH4JCcJtu2MXvYvYkF8Wc?=
 =?us-ascii?Q?N6FVgvQTTOlQyGcgbGa8yvhUPA6zXszcM/+fcjek+RWaPa0ThKSkfABeiJV6?=
 =?us-ascii?Q?Q5yhgmd1nZhzyyevflZLJV6TmG1bzKf6ebsZeMwEpOvEuf/9A+jI4AX5x0OM?=
 =?us-ascii?Q?iWMBC7rGx+9PWAo/zaNBDiMXN1tb2GLyzkreWjtcPXbo4UPPwjCd5vDFnxco?=
 =?us-ascii?Q?GDz8MU+Lho7GJ16h5kS3cNOSY+D5HeMnkcV1cQB+gXGYO9yXQBCuCUkENtoA?=
 =?us-ascii?Q?RhFq2eR2CL7+IwICziCOFqQs7zF1oAbog4KnViH0XxMZUeAfxKIUBRf3SxN4?=
 =?us-ascii?Q?Pri41SeZDhXI/nn6xUm7xGB4J13W2wYRLtI1cwJGHx9FwA9Vb7eibf669OfP?=
 =?us-ascii?Q?ZlG4eG4twmDOdYPmBMQ2rKmxI0rQ1/J6+XLQma4YBO7AwYmAciaC9fuja2rU?=
 =?us-ascii?Q?Lvpc++lZnMTWF1VyycqmfhS4TT3J04UC8pd7P1IyPyvQjumACm8vyl+7w2OJ?=
 =?us-ascii?Q?AdjgOmdraJd56zzkNmitF+hZESVNqS/2dWHPRECf9WOT0gHmFAURgwE813qF?=
 =?us-ascii?Q?jHPDVe1zgTKtrwHBEUDzIVQvB40hMitiOzwlvq+a75CVG7KtRDPQZc2W2leb?=
 =?us-ascii?Q?IZRctdPM8q6nuRfqHkNBBHYX2rqftq5Y6UkeMyui6Oezh2+XyNvk6MJqXadv?=
 =?us-ascii?Q?dYslut22uqi+3woYwfQAVDMzc87YopoG?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB7726.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jldDjh4FbC9JEMRwybULvpA3hUsmbUrAm2s2As8w9KoLZZ4jxYYhCavL6PlH?=
 =?us-ascii?Q?TKlblni7nB/C/AtzirM3KBfcwyJ2cqFbo4jnZvt9DImkOmCJ5ZPkXgRUn+CJ?=
 =?us-ascii?Q?3P5EL7bY4FTbZ85LtrXvDczteZbY3gxc4uLeuHqcKoC9uYX624xJlXC4K0Kq?=
 =?us-ascii?Q?PfW6efZplr+AT2dSFxmdfsUzDyIUftKwv7iyyrJtx57drr2BB2DNRstCKUnh?=
 =?us-ascii?Q?y53ec1IpzWruERqsU10xtV++AMVIMh0qHoVMllYgg2FXDDkGC+pdJrKM2hw/?=
 =?us-ascii?Q?xnR262r11FhUETv/hpbzG893XIaKjLLrjrh9yBXlaJp+6ys+HUrpLLDCSPYM?=
 =?us-ascii?Q?d6wh2dySag+BPJiNMZ+28v4DUMdAD4UJobUs1HzjrbvnFYWUBn7BtuWrpBin?=
 =?us-ascii?Q?CnYa19bAutSv0uLDC636d8TIxCzpUGdiKnr5GkhVsWLJ7o7zjsQp3nsl/Qla?=
 =?us-ascii?Q?p5KqlifUPsbxGeR0Bod6fAGEcH3p4f7Bc/Rw6qYDafGfDRtRzZz2PpLEOOYi?=
 =?us-ascii?Q?CU58OuQpFZC912TW9A0uZkHRsov44w5fZuoNbRMqbouzQ2/m+p+l8KiY+QPT?=
 =?us-ascii?Q?JT6UIA/q1KPMpUF3eB3F47XmV+aF7HzqYqWguw6IuRewed+07fsmcxALdc2a?=
 =?us-ascii?Q?COVGFdz/Hy79fguzGdlHsaC2B+6J2GLHg/+oYI4DD9w+tit4ksYLfaA6+blj?=
 =?us-ascii?Q?0jENWp8bPotbxhAmvsrdWisobic+IMI3ictTSTlzxRHasz3w8QyFz0/hQJ42?=
 =?us-ascii?Q?0xE4r/sQ8LR/UWZA3l0gyDFIXIC+4Gyo9+jGNntGh4oo1a1ESfxHb4UpszB/?=
 =?us-ascii?Q?dl06i2XUsUZ5AGzeCREeAwPgcJzTWTvYhljG8jT4ANv54ULFQ4/u/x9AbMXy?=
 =?us-ascii?Q?jtHSaHOXgMTtx/OkWkivewQejmTqjtYexiebYHWYntmw2H25KJzxynHT/xUM?=
 =?us-ascii?Q?GtTxwP6eklAqSj03PyO+OOJZN3JdnNtpIxIYqtilzPFP/YEYyF8OR6bUuTPr?=
 =?us-ascii?Q?XMHhT3CpVdVky4d0nTfUbIDJsh2863CMsqD2nU9Zdrl1kS24HtTqPtbSBUK/?=
 =?us-ascii?Q?utZmOJd5kiuNgsPX2i6oAbEQ2/lgrvXQ9ZoHgchOLxyQBo/ZkY/RHG1L+snR?=
 =?us-ascii?Q?9AHRO9yn5SVwgFLTouaQ9Vd8izUCfTKf6i51TP1ySG6kD9cVq07BxDh+UITc?=
 =?us-ascii?Q?cwcls6ev/6LEF4f9a8GZ9Ri7zBJoN5VgbiBAICwgrKnABDPw/ZpkuppUO05Y?=
 =?us-ascii?Q?MUKjBxbtH4zFMnnT/N3mQQv6IQee29IUysWXHQNOpx3v8wZS3p5HlcgbZTIy?=
 =?us-ascii?Q?qZWHTDzhybWzt539/itZ1lF5Jyj5tzJvLFuoF75OuZX7z9L5wXGY2MjtU052?=
 =?us-ascii?Q?06Quze9jPlafNn5s9FDt8azzoOHQ18Hu4oyIPhobJKCAfNp6/t8mpI7itf+D?=
 =?us-ascii?Q?rPDV2RBxZ8Yxxr+QrtKccWwDQVDRoAn2MaEFnvWAEhV/vrwsIQaMPpp3XvxG?=
 =?us-ascii?Q?o+otQm+vrCXg8c0q9pHBx3FArwbuGvoIr3NViaXv1NiJ6NzheWjQc0e8wOpJ?=
 =?us-ascii?Q?otWa1Kog5ZnSmZ6qdBABQiA6XI3gYFnbBfKPXQui?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f304f9b-cfa2-451c-0b93-08de0d40b7d2
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7726.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2025 05:47:54.9439 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uV4OgzpuTpABBB5S0ZK/mYjBGigP8aXasyYVrGsUGpTd8qPTLc2wQ4pikIpD8SmQcRjJGu3rpZyTJa9fmi0c5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7819
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

The GSP requires several areas of memory to operate. Each of these have
their own simple embedded page tables. Set these up and map them for DMA
to/from GSP using CoherentAllocation's. Return the DMA handle describing
where each of these regions are for future use when booting GSP.

Signed-off-by: Alistair Popple <apopple@nvidia.com>
Co-developed-by: Alexandre Courbot <acourbot@nvidia.com>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>

---

Changes for v5:
 - Move GSP_HEAP_ALIGNMENT to gsp/fw.rs and add a comment.
 - Create a LogBuffer type.
 - Use checked_add to ensure PTE values don't overflow.
 - Added some type documentation (shamelessly stolen from Nouveau)

Change for v3:
 - Clean up the PTE array creation, with much thanks to Alex for doing
   most it (please let me know if I should put you as co-developer!)

Changes for v2:
 - Renamed GspMemOjbects to Gsp as that is what they are
 - Rebased on Alex's latest series
---
 drivers/gpu/nova-core/gpu.rs                  |   2 +-
 drivers/gpu/nova-core/gsp.rs                  | 106 ++++++++++++++++--
 drivers/gpu/nova-core/gsp/fw.rs               |  64 ++++++++++-
 .../gpu/nova-core/gsp/fw/r570_144/bindings.rs |  19 ++++
 4 files changed, 179 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index ea124d1912e7..c1396775e9b6 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -197,7 +197,7 @@ pub(crate) fn new<'a>(
 
             sec2_falcon: Falcon::new(pdev.as_ref(), spec.chipset, bar, true)?,
 
-            gsp <- Gsp::new(),
+            gsp <- Gsp::new(pdev)?,
 
             _: { gsp.boot(pdev, bar, spec.chipset, gsp_falcon, sec2_falcon)? },
 
diff --git a/drivers/gpu/nova-core/gsp.rs b/drivers/gpu/nova-core/gsp.rs
index 221281da1a45..f1727173bd42 100644
--- a/drivers/gpu/nova-core/gsp.rs
+++ b/drivers/gpu/nova-core/gsp.rs
@@ -2,25 +2,117 @@
 
 mod boot;
 
+use kernel::device;
+use kernel::dma::CoherentAllocation;
+use kernel::dma::DmaAddress;
+use kernel::dma_write;
+use kernel::pci;
 use kernel::prelude::*;
-use kernel::ptr::Alignment;
+use kernel::transmute::AsBytes;
 
 pub(crate) use fw::{GspFwWprMeta, LibosParams};
 
 mod fw;
 
+use fw::LibosMemoryRegionInitArgument;
+
 pub(crate) const GSP_PAGE_SHIFT: usize = 12;
 pub(crate) const GSP_PAGE_SIZE: usize = 1 << GSP_PAGE_SHIFT;
-pub(crate) const GSP_HEAP_ALIGNMENT: Alignment = Alignment::new::<{ 1 << 20 }>();
+
+/// Number of GSP pages to use in a RM log buffer.
+const RM_LOG_BUFFER_NUM_PAGES: usize = 0x10;
 
 /// GSP runtime data.
-///
-/// This is an empty pinned placeholder for now.
 #[pin_data]
-pub(crate) struct Gsp {}
+pub(crate) struct Gsp {
+    pub(crate) libos: CoherentAllocation<LibosMemoryRegionInitArgument>,
+    loginit: LogBuffer,
+    logintr: LogBuffer,
+    logrm: LogBuffer,
+}
+
+#[repr(C)]
+struct PteArray<const NUM_ENTRIES: usize>([u64; NUM_ENTRIES]);
+
+/// SAFETY: arrays of `u64` implement `AsBytes` and we are but a wrapper around it.
+unsafe impl<const NUM_ENTRIES: usize> AsBytes for PteArray<NUM_ENTRIES> {}
+
+impl<const NUM_PAGES: usize> PteArray<NUM_PAGES> {
+    fn new(handle: DmaAddress) -> Result<Self> {
+        let mut ptes = [0u64; NUM_PAGES];
+        for (i, pte) in ptes.iter_mut().enumerate() {
+            *pte = handle
+                .checked_add((i as u64) << GSP_PAGE_SHIFT)
+                .ok_or(EOVERFLOW)?;
+        }
+
+        Ok(Self(ptes))
+    }
+}
+
+/// The logging buffers are byte queues that contain encoded printf-like
+/// messages from GSP-RM.  They need to be decoded by a special application
+/// that can parse the buffers.
+///
+/// The 'loginit' buffer contains logs from early GSP-RM init and
+/// exception dumps.  The 'logrm' buffer contains the subsequent logs. Both are
+/// written to directly by GSP-RM and can be any multiple of GSP_PAGE_SIZE.
+///
+/// The physical address map for the log buffer is stored in the buffer
+/// itself, starting with offset 1. Offset 0 contains the "put" pointer (pp).
+/// Initially, pp is equal to 0. If the buffer has valid logging data in it,
+/// then pp points to index into the buffer where the next logging entry will
+/// be written. Therefore, the logging data is valid if:
+///   1 <= pp < sizeof(buffer)/sizeof(u64)
+struct LogBuffer(CoherentAllocation<u8>);
+
+impl LogBuffer {
+    fn new(dev: &device::Device<device::Bound>) -> Result<Self> {
+        const NUM_PAGES: usize = RM_LOG_BUFFER_NUM_PAGES;
+
+        let mut obj = Self(CoherentAllocation::<u8>::alloc_coherent(
+            dev,
+            NUM_PAGES * GSP_PAGE_SIZE,
+            GFP_KERNEL | __GFP_ZERO,
+        )?);
+        let ptes = PteArray::<NUM_PAGES>::new(obj.0.dma_handle())?;
+
+        // SAFETY: `obj` has just been created and we are its sole user.
+        unsafe {
+            // Copy the self-mapping PTE at the expected location.
+            obj.0
+                .as_slice_mut(size_of::<u64>(), size_of_val(&ptes))?
+                .copy_from_slice(ptes.as_bytes())
+        };
+
+        Ok(obj)
+    }
+}
 
 impl Gsp {
-    pub(crate) fn new() -> impl PinInit<Self> {
-        pin_init!(Self {})
+    pub(crate) fn new(pdev: &pci::Device<device::Bound>) -> Result<impl PinInit<Self, Error>> {
+        let dev = pdev.as_ref();
+        let libos = CoherentAllocation::<LibosMemoryRegionInitArgument>::alloc_coherent(
+            dev,
+            GSP_PAGE_SIZE / size_of::<LibosMemoryRegionInitArgument>(),
+            GFP_KERNEL | __GFP_ZERO,
+        )?;
+
+        // Initialise the logging structures. The OpenRM equivalents are in:
+        // _kgspInitLibosLoggingStructures (allocates memory for buffers)
+        // kgspSetupLibosInitArgs_IMPL (creates pLibosInitArgs[] array)
+        let loginit = LogBuffer::new(dev)?;
+        dma_write!(libos[0] = LibosMemoryRegionInitArgument::new("LOGINIT", &loginit.0)?)?;
+        let logintr = LogBuffer::new(dev)?;
+        dma_write!(libos[1] = LibosMemoryRegionInitArgument::new("LOGINTR", &logintr.0)?)?;
+        let logrm = LogBuffer::new(dev)?;
+        dma_write!(libos[2] = LibosMemoryRegionInitArgument::new("LOGRM", &logrm.0)?)?;
+
+        Ok(try_pin_init!(Self {
+            libos,
+            loginit,
+            logintr,
+            logrm,
+        }))
     }
 }
diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp/fw.rs
index 181baa401770..c3bececc29cd 100644
--- a/drivers/gpu/nova-core/gsp/fw.rs
+++ b/drivers/gpu/nova-core/gsp/fw.rs
@@ -7,15 +7,20 @@
 
 use core::ops::Range;
 
-use kernel::ptr::Alignable;
+use kernel::dma::CoherentAllocation;
+use kernel::prelude::*;
+use kernel::ptr::{Alignable, Alignment};
 use kernel::sizes::SZ_1M;
+use kernel::transmute::{AsBytes, FromBytes};
 
 use crate::gpu::Chipset;
-use crate::gsp;
 
 /// Dummy type to group methods related to heap parameters for running the GSP firmware.
 pub(crate) struct GspFwHeapParams(());
 
+/// Minimum required alignment for the GSP heap.
+const GSP_HEAP_ALIGNMENT: Alignment = Alignment::new::<{ 1 << 20 }>();
+
 impl GspFwHeapParams {
     /// Returns the amount of GSP-RM heap memory used during GSP-RM boot and initialization (up to
     /// and including the first client subdevice allocation).
@@ -29,7 +34,7 @@ fn base_rm_size(_chipset: Chipset) -> u64 {
     /// Returns the amount of heap memory required to support a single channel allocation.
     fn client_alloc_size() -> u64 {
         u64::from(bindings::GSP_FW_HEAP_PARAM_CLIENT_ALLOC_SIZE)
-            .align_up(gsp::GSP_HEAP_ALIGNMENT)
+            .align_up(GSP_HEAP_ALIGNMENT)
             .unwrap_or(u64::MAX)
     }
 
@@ -40,7 +45,7 @@ fn management_overhead(fb_size: u64) -> u64 {
 
         u64::from(bindings::GSP_FW_HEAP_PARAM_SIZE_PER_GB_FB)
             .saturating_mul(fb_size_gb)
-            .align_up(gsp::GSP_HEAP_ALIGNMENT)
+            .align_up(GSP_HEAP_ALIGNMENT)
             .unwrap_or(u64::MAX)
     }
 }
@@ -99,3 +104,54 @@ pub(crate) fn wpr_heap_size(&self, chipset: Chipset, fb_size: u64) -> u64 {
 /// addresses of the GSP bootloader and firmware.
 #[repr(transparent)]
 pub(crate) struct GspFwWprMeta(bindings::GspFwWprMeta);
+
+/// Struct containing the arguments required to pass a memory buffer to the GSP
+/// for use during initialisation.
+///
+/// The GSP only understands 4K pages (GSP_PAGE_SIZE), so even if the kernel is
+/// configured for a larger page size (e.g. 64K pages), we need to give
+/// the GSP an array of 4K pages. Since we only create physically contiguous
+/// buffers the math to calculate the addresses is simple.
+///
+/// The buffers must be a multiple of GSP_PAGE_SIZE.  GSP-RM also currently
+/// ignores the @kind field for LOGINIT, LOGINTR, and LOGRM, but expects the
+/// buffers to be physically contiguous anyway.
+///
+/// The memory allocated for the arguments must remain until the GSP sends the
+/// init_done RPC.
+#[repr(transparent)]
+pub(crate) struct LibosMemoryRegionInitArgument(bindings::LibosMemoryRegionInitArgument);
+
+// SAFETY: Padding is explicit and will not contain uninitialized data.
+unsafe impl AsBytes for LibosMemoryRegionInitArgument {}
+
+// SAFETY: This struct only contains integer types for which all bit patterns
+// are valid.
+unsafe impl FromBytes for LibosMemoryRegionInitArgument {}
+
+impl LibosMemoryRegionInitArgument {
+    pub(crate) fn new<A: AsBytes + FromBytes>(
+        name: &'static str,
+        obj: &CoherentAllocation<A>,
+    ) -> Result<Self> {
+        /// Generates the `ID8` identifier required for some GSP objects.
+        fn id8(name: &str) -> u64 {
+            let mut bytes = [0u8; core::mem::size_of::<u64>()];
+
+            for (c, b) in name.bytes().rev().zip(&mut bytes) {
+                *b = c;
+            }
+
+            u64::from_ne_bytes(bytes)
+        }
+
+        Ok(Self(bindings::LibosMemoryRegionInitArgument {
+            id8: id8(name),
+            pa: obj.dma_handle(),
+            size: obj.size() as u64,
+            kind: bindings::LibosMemoryRegionKind_LIBOS_MEMORY_REGION_CONTIGUOUS.try_into()?,
+            loc: bindings::LibosMemoryRegionLoc_LIBOS_MEMORY_REGION_LOC_SYSMEM.try_into()?,
+            ..Default::default()
+        }))
+    }
+}
diff --git a/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs b/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs
index 0407000cca22..6a14cc324391 100644
--- a/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs
+++ b/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs
@@ -124,3 +124,22 @@ fn default() -> Self {
         }
     }
 }
+pub type LibosAddress = u64_;
+pub const LibosMemoryRegionKind_LIBOS_MEMORY_REGION_NONE: LibosMemoryRegionKind = 0;
+pub const LibosMemoryRegionKind_LIBOS_MEMORY_REGION_CONTIGUOUS: LibosMemoryRegionKind = 1;
+pub const LibosMemoryRegionKind_LIBOS_MEMORY_REGION_RADIX3: LibosMemoryRegionKind = 2;
+pub type LibosMemoryRegionKind = ffi::c_uint;
+pub const LibosMemoryRegionLoc_LIBOS_MEMORY_REGION_LOC_NONE: LibosMemoryRegionLoc = 0;
+pub const LibosMemoryRegionLoc_LIBOS_MEMORY_REGION_LOC_SYSMEM: LibosMemoryRegionLoc = 1;
+pub const LibosMemoryRegionLoc_LIBOS_MEMORY_REGION_LOC_FB: LibosMemoryRegionLoc = 2;
+pub type LibosMemoryRegionLoc = ffi::c_uint;
+#[repr(C)]
+#[derive(Debug, Default, Copy, Clone)]
+pub struct LibosMemoryRegionInitArgument {
+    pub id8: LibosAddress,
+    pub pa: LibosAddress,
+    pub size: LibosAddress,
+    pub kind: u8_,
+    pub loc: u8_,
+    pub __bindgen_padding_0: [u8; 6usize],
+}
-- 
2.50.1

